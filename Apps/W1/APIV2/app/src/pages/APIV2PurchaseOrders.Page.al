page 30066 "APIV2 - Purchase Orders"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Purchase Order';
    EntitySetCaption = 'Purchase Orders';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'purchaseOrder';
    EntitySetName = 'purchaseOrders';
    ODataKeyFields = Id;
    PageType = API;
    SourceTable = "Purchase Order Entity Buffer";
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Id)
                {
                    Caption = 'Id';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo(Id));
                    end;
                }
                field(number; "No.")
                {
                    Caption = 'No.';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("No."));
                    end;
                }
                field(orderDate; "Document Date")
                {
                    Caption = 'Order Date';

                    trigger OnValidate()
                    begin
                        DocumentDateVar := "Document Date";
                        DocumentDateSet := true;

                        RegisterFieldSet(FieldNo("Document Date"));
                    end;
                }
                field(postingDate; "Posting Date")
                {
                    Caption = 'Posting Date';

                    trigger OnValidate()
                    begin
                        PostingDateVar := "Posting Date";
                        PostingDateSet := true;

                        RegisterFieldSet(FieldNo("Posting Date"));
                    end;
                }
                field(vendorId; "Vendor Id")
                {
                    Caption = 'Vendor Id';

                    trigger OnValidate()
                    begin
                        if not BuyFromVendor.GetBySystemId("Vendor Id") then
                            Error(CouldNotFindBuyFromVendorErr);

                        "Buy-from Vendor No." := BuyFromVendor."No.";
                        RegisterFieldSet(FieldNo("Vendor Id"));
                        RegisterFieldSet(FieldNo("Buy-from Vendor No."));
                    end;
                }
                field(vendorNumber; "Buy-from Vendor No.")
                {
                    Caption = 'Vendor No.';

                    trigger OnValidate()
                    begin
                        if BuyFromVendor."No." <> '' then begin
                            if BuyFromVendor."No." <> "Buy-from Vendor No." then
                                Error(BuyFromVendorValuesDontMatchErr);
                            exit;
                        end;

                        if not BuyFromVendor.Get("Buy-from Vendor No.") then
                            Error(CouldNotFindBuyFromVendorErr);

                        "Vendor Id" := BuyFromVendor.SystemId;
                        RegisterFieldSet(FieldNo("Vendor Id"));
                        RegisterFieldSet(FieldNo("Buy-from Vendor No."));
                    end;
                }
                field(vendorName; "Buy-from Vendor Name")
                {
                    Caption = 'Vendor Name';
                    Editable = false;
                }
                field(payToName; "Pay-to Name")
                {
                    Caption = 'Pay-to Name';
                    Editable = false;
                }
                field(payToVendorId; "Pay-to Vendor Id")
                {
                    Caption = 'Pay-to Vendor Id';

                    trigger OnValidate()
                    begin
                        if not PayToVendor.GetBySystemId("Pay-to Vendor Id") then
                            Error(CouldNotFindPayToVendorErr);

                        "Pay-to Vendor No." := PayToVendor."No.";
                        RegisterFieldSet(FieldNo("Pay-to Vendor Id"));
                        RegisterFieldSet(FieldNo("Pay-to Vendor No."));
                    end;
                }
                field(payToVendorNumber; "Pay-to Vendor No.")
                {
                    Caption = 'Pay-to Vendor No.';

                    trigger OnValidate()
                    begin
                        if PayToVendor."No." <> '' then begin
                            if PayToVendor."No." <> "Pay-to Vendor No." then
                                Error(PayToVendorValuesDontMatchErr);
                            exit;
                        end;

                        if not PayToVendor.Get("Pay-to Vendor No.") then
                            Error(CouldNotFindPayToVendorErr);

                        "Pay-to Vendor Id" := PayToVendor.SystemId;
                        RegisterFieldSet(FieldNo("Pay-to Vendor Id"));
                        RegisterFieldSet(FieldNo("Pay-to Vendor No."));
                    end;
                }
                field(shipToName; "Ship-to Name")
                {
                    Caption = 'Ship-to Name';

                    trigger OnValidate()
                    begin
                        if xRec."Ship-to Name" <> "Ship-to Name" then begin
                            "Ship-to Code" := '';
                            RegisterFieldSet(FieldNo("Ship-to Code"));
                            RegisterFieldSet(FieldNo("Ship-to Name"));
                        end;
                    end;
                }
                field(shipToContact; "Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';

                    trigger OnValidate()
                    begin
                        if xRec."Ship-to Contact" <> "Ship-to Contact" then begin
                            "Ship-to Code" := '';
                            RegisterFieldSet(FieldNo("Ship-to Code"));
                            RegisterFieldSet(FieldNo("Ship-to Contact"));
                        end;
                    end;
                }
                field(buyFromAddressLine1; "Buy-from Address")
                {
                    Caption = 'Buy-from Address Line 1';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Buy-from Address"));
                    end;
                }
                field(buyFromAddressLine2; "Buy-from Address 2")
                {
                    Caption = 'Buy-from Address Line 2';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Buy-from Address 2"));
                    end;
                }
                field(buyFromCity; "Buy-from City")
                {
                    Caption = 'Buy-from City';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Buy-from City"));
                    end;
                }
                field(buyFromCountry; "Buy-from Country/Region Code")
                {
                    Caption = 'Buy-from Country/Region Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Buy-from Country/Region Code"));
                    end;
                }
                field(buyFromState; "Buy-from County")
                {
                    Caption = 'Buy-from State';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Buy-from County"));
                    end;
                }
                field(buyFromPostCode; "Buy-from Post Code")
                {
                    Caption = 'Buy-from Post Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Buy-from Post Code"));
                    end;
                }
                field(payToAddressLine1; "Pay-to Address")
                {
                    Caption = 'Pay-to Address Line 1';
                    Editable = false;
                }
                field(payToAddressLine2; "Pay-to Address 2")
                {
                    Caption = 'Pay-to Address Line 2';
                    Editable = false;
                }
                field(payToCity; "Pay-to City")
                {
                    Caption = 'Pay-to City';
                    Editable = false;
                }
                field(payToCountry; "Pay-to Country/Region Code")
                {
                    Caption = 'Pay-to Country/Region Code';
                    Editable = false;
                }
                field(payToState; "Pay-to County")
                {
                    Caption = 'Pay-to State';
                    Editable = false;
                }
                field(payToPostCode; "Pay-to Post Code")
                {
                    Caption = 'Pay-to Post Code';
                    Editable = false;
                }
                field(shipToAddressLine1; "Ship-to Address")
                {
                    Caption = 'Ship-to Address Line 1';

                    trigger OnValidate()
                    begin
                        "Ship-to Code" := '';
                        RegisterFieldSet(FieldNo("Ship-to Code"));
                        RegisterFieldSet(FieldNo("Ship-to Address"));
                    end;
                }
                field(shipToAddressLine2; "Ship-to Address 2")
                {
                    Caption = 'Ship-to Address Line 2';

                    trigger OnValidate()
                    begin
                        "Ship-to Code" := '';
                        RegisterFieldSet(FieldNo("Ship-to Code"));
                        RegisterFieldSet(FieldNo("Ship-to Address 2"));
                    end;
                }
                field(shipToCity; "Ship-to City")
                {
                    Caption = 'Ship-to City';

                    trigger OnValidate()
                    begin
                        "Ship-to Code" := '';
                        RegisterFieldSet(FieldNo("Ship-to Code"));
                        RegisterFieldSet(FieldNo("Ship-to City"));
                    end;
                }
                field(shipToCountry; "Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';

                    trigger OnValidate()
                    begin
                        "Ship-to Code" := '';
                        RegisterFieldSet(FieldNo("Ship-to Code"));
                        RegisterFieldSet(FieldNo("Ship-to Country/Region Code"));
                    end;
                }
                field(shipToState; "Ship-to County")
                {
                    Caption = 'Ship-to State';

                    trigger OnValidate()
                    begin
                        "Ship-to Code" := '';
                        RegisterFieldSet(FieldNo("Ship-to Code"));
                        RegisterFieldSet(FieldNo("Ship-to County"));
                    end;
                }
                field(shipToPostCode; "Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';

                    trigger OnValidate()
                    begin
                        "Ship-to Code" := '';
                        RegisterFieldSet(FieldNo("Ship-to Code"));
                        RegisterFieldSet(FieldNo("Ship-to Post Code"));
                    end;
                }
                field(shortcutDimension1Code; "Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Shortcut Dimension 1 Code"));
                    end;
                }
                field(shortcutDimension2Code; "Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Shortcut Dimension 2 Code"));
                    end;
                }
                field(currencyId; "Currency Id")
                {
                    Caption = 'Currency Id';

                    trigger OnValidate()
                    begin
                        if "Currency Id" = BlankGUID then
                            "Currency Code" := ''
                        else begin
                            if not Currency.GetBySystemId("Currency Id") then
                                Error(CurrencyIdDoesNotMatchACurrencyErr);

                            "Currency Code" := Currency.Code;
                        end;

                        RegisterFieldSet(FieldNo("Currency Id"));
                        RegisterFieldSet(FieldNo("Currency Code"));
                    end;
                }
                field(currencyCode; CurrencyCodeTxt)
                {
                    Caption = 'Currency Code';

                    trigger OnValidate()
                    begin
                        "Currency Code" :=
                          GraphMgtGeneralTools.TranslateCurrencyCodeToNAVCurrencyCode(
                            LCYCurrencyCode, COPYSTR(CurrencyCodeTxt, 1, MAXSTRLEN(LCYCurrencyCode)));

                        if Currency.Code <> '' then begin
                            if Currency.Code <> "Currency Code" then
                                Error(CurrencyValuesDontMatchErr);
                            exit;
                        end;

                        if "Currency Code" = '' then
                            "Currency Id" := BlankGUID
                        else begin
                            if not Currency.Get("Currency Code") then
                                Error(CurrencyCodeDoesNotMatchACurrencyErr);

                            "Currency Id" := Currency.SystemId;
                        end;

                        RegisterFieldSet(FieldNo("Currency Id"));
                        RegisterFieldSet(FieldNo("Currency Code"));
                    end;
                }
                field(pricesIncludeTax; "Prices Including VAT")
                {
                    Caption = 'Prices Include Tax';

                    trigger OnValidate()
                    var
                        PurchaseLine: Record "Purchase Line";
                    begin
                        if "Prices Including VAT" then begin
                            PurchaseLine.SetRange("Document No.", Rec."No.");
                            PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
                            if PurchaseLine.FindFirst() then
                                if PurchaseLine."VAT Calculation Type" = PurchaseLine."VAT Calculation Type"::"Sales Tax" then
                                    Error(CannotEnablePricesIncludeTaxErr);
                        end;
                        RegisterFieldSet(FieldNo("Prices Including VAT"));
                    end;
                }
                field(paymentTermsId; "Payment Terms Id")
                {
                    Caption = 'Payment Terms Id';

                    trigger OnValidate()
                    begin
                        if "Payment Terms Id" = BlankGUID then
                            "Payment Terms Code" := ''
                        else begin
                            if not PaymentTerms.GetBySystemId("Payment Terms Id") then
                                Error(PaymentTermsIdDoesNotMatchAPaymentTermsErr);

                            "Payment Terms Code" := PaymentTerms.Code;
                        end;

                        RegisterFieldSet(FieldNo("Payment Terms Id"));
                        RegisterFieldSet(FieldNo("Payment Terms Code"));
                    end;
                }
                field(shipmentMethodId; "Shipment Method Id")
                {
                    Caption = 'Shipment Method Id';

                    trigger OnValidate()
                    begin
                        if "Shipment Method Id" = BlankGUID then
                            "Shipment Method Code" := ''
                        else begin
                            if not ShipmentMethod.GetBySystemId("Shipment Method Id") then
                                Error(ShipmentMethodIdDoesNotMatchAShipmentMethodErr);

                            "Shipment Method Code" := ShipmentMethod.Code;
                        end;

                        RegisterFieldSet(FieldNo("Shipment Method Id"));
                        RegisterFieldSet(FieldNo("Shipment Method Code"));
                    end;
                }
                field(purchaser; "Purchaser Code")
                {
                    Caption = 'Purchaser';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Purchaser Code"));
                    end;
                }
                field(requestedReceiptDate; "Requested Receipt Date")
                {
                    Caption = 'Requested Receipt Date';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Requested Receipt Date"));
                    end;
                }
                part(purchaseOrderLines; "APIV2 - Purchase Order Lines")
                {
                    Caption = 'Lines';
                    EntityName = 'purchaseOrderLine';
                    EntitySetName = 'purchaseOrderLines';
                    SubPageLink = "Document Id" = Field(Id);
                }
                field(discountAmount; "Invoice Discount Amount")
                {
                    Caption = 'Discount Amount';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Invoice Discount Amount"));
                        InvoiceDiscountAmount := "Invoice Discount Amount";
                        DiscountAmountSet := true;
                    end;
                }
                field(discountAppliedBeforeTax; "Discount Applied Before Tax")
                {
                    Caption = 'Discount Applied Before Tax';
                    Editable = false;
                }
                field(totalAmountExcludingTax; Amount)
                {
                    Caption = 'Total Amount Excluding Tax';
                    Editable = false;
                }
                field(totalTaxAmount; "Total Tax Amount")
                {
                    Caption = 'Total Tax Amount';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Total Tax Amount"));
                    end;
                }
                field(totalAmountIncludingTax; "Amount Including VAT")
                {
                    Caption = 'Total Amount Including Tax';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Amount Including VAT"));
                    end;
                }
                field(fullyReceived; "Completely Received")
                {
                    Caption = 'Fully Received';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(FieldNo("Completely Received"));
                    end;
                }
                field(status; Status)
                {
                    Caption = 'Status';
                    Editable = false;
                }
                field(lastModifiedDateTime; SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }
                part(attachments; "APIV2 - Attachments")
                {
                    Caption = 'Attachments';
                    EntityName = 'attachment';
                    EntitySetName = 'attachments';
                    SubPageLink = "Document Id" = Field(Id), "Document Type" = const("Purchase Order");
                }
                part(dimensionSetLines; "APIV2 - Dimension Set Lines")
                {
                    Caption = 'Dimension Set Lines';
                    EntityName = 'dimensionSetLine';
                    EntitySetName = 'dimensionSetLines';
                    SubPageLink = "Parent Id" = Field(Id), "Parent Type" = const("Purchase Order");
                }
                part(documentAttachments; "APIV2 - Document Attachments")
                {
                    Caption = 'Document Attachments';
                    EntityName = 'documentAttachment';
                    EntitySetName = 'documentAttachments';
                    SubPageLink = "Document Id" = Field(SystemId), "Document Type" = const("Purchase Order");
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        SetCalculatedFields();
        if HasWritePermission then
            GraphMgtPurchOrderBuffer.RedistributeInvoiceDiscounts(Rec);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        GraphMgtPurchOrderBuffer.PropagateOnDelete(Rec);

        exit(false);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CheckBuyFromVendorSpecified();

        GraphMgtPurchOrderBuffer.PropagateOnInsert(Rec, TempFieldBuffer);
        SetDates();

        UpdateDiscount();

        SetCalculatedFields();

        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if xRec.Id <> Id then
            Error(CannotChangeIDErr);

        GraphMgtPurchOrderBuffer.PropagateOnModify(Rec, TempFieldBuffer);
        UpdateDiscount();

        SetCalculatedFields();

        exit(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ClearCalculatedFields();
    end;

    trigger OnOpenPage()
    begin
        CheckPermissions();
    end;

    var
        TempFieldBuffer: Record "Field Buffer" temporary;
        BuyFromVendor: Record "Vendor";
        PayToVendor: Record "Vendor";
        Currency: Record "Currency";
        PaymentTerms: Record "Payment Terms";
        ShipmentMethod: Record "Shipment Method";
        GraphMgtPurchOrderBuffer: Codeunit "Graph Mgt - Purch Order Buffer";
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        LCYCurrencyCode: Code[10];
        CurrencyCodeTxt: Text;
        CannotChangeIDErr: Label 'The "id" cannot be changed.', Comment = 'id is a field name and should not be translated.';
        BuyFromVendorNotProvidedErr: Label 'A "vendorNumber" or a "vendorId" must be provided.', Comment = 'vendorNumber and vendorId are field names and should not be translated.';
        BuyFromVendorValuesDontMatchErr: Label 'The buy-from vendor values do not match to a specific Vendor.';
        PayToVendorValuesDontMatchErr: Label 'The pay-to vendor values do not match to a specific Vendor.';
        CouldNotFindBuyFromVendorErr: Label 'The buy-from vendor cannot be found.';
        CouldNotFindPayToVendorErr: Label 'The pay-to vendor cannot be found.';
        PurchaseOrderPermissionsErr: Label 'You do not have permissions to read Purchase Orders.';
        CurrencyValuesDontMatchErr: Label 'The currency values do not match to a specific Currency.';
        CurrencyIdDoesNotMatchACurrencyErr: Label 'The "currencyId" does not match to a Currency.', Comment = 'currencyId is a field name and should not be translated.';
        CurrencyCodeDoesNotMatchACurrencyErr: Label 'The "currencyCode" does not match to a Currency.', Comment = 'currencyCode is a field name and should not be translated.';
        CannotEnablePricesIncludeTaxErr: Label 'The "pricesIncludeTax" cannot be set to true if VAT Calculation Type is Sales Tax.', Comment = 'pricesIncludeTax is a field name and should not be translated.';
        PaymentTermsIdDoesNotMatchAPaymentTermsErr: Label 'The "paymentTermsId" does not match to a Payment Terms.', Comment = 'paymentTermsId is a field name and should not be translated.';
        ShipmentMethodIdDoesNotMatchAShipmentMethodErr: Label 'The "shipmentMethodId" does not match to a Shipment Method.', Comment = 'shipmentMethodId is a field name and should not be translated.';
        CannotFindOrderErr: Label 'The order cannot be found.';
        DiscountAmountSet: Boolean;
        InvoiceDiscountAmount: Decimal;
        BlankGUID: Guid;
        DocumentDateSet: Boolean;
        DocumentDateVar: Date;
        PostingDateSet: Boolean;
        PostingDateVar: Date;
        HasWritePermission: Boolean;

    local procedure SetCalculatedFields()
    begin
        CurrencyCodeTxt := GraphMgtGeneralTools.TranslateNAVCurrencyCodeToCurrencyCode(LCYCurrencyCode, "Currency Code");
    end;

    local procedure ClearCalculatedFields()
    begin
        Clear(DiscountAmountSet);
        Clear(InvoiceDiscountAmount);

        TempFieldBuffer.DeleteAll();
    end;


    local procedure RegisterFieldSet(FieldNo: Integer)
    var
        LastOrderNo: Integer;
    begin
        LastOrderNo := 1;
        if TempFieldBuffer.FindLast() then
            LastOrderNo := TempFieldBuffer.Order + 1;

        Clear(TempFieldBuffer);
        TempFieldBuffer.Order := LastOrderNo;
        TempFieldBuffer."Table ID" := Database::"Purch. Inv. Entity Aggregate";
        TempFieldBuffer."Field ID" := FieldNo;
        TempFieldBuffer.Insert();
    end;

    local procedure CheckBuyFromVendorSpecified()
    begin
        if ("Buy-from Vendor No." = '') and
           ("Vendor Id" = BlankGUID)
        then
            Error(BuyFromVendorNotProvidedErr);
    end;

    local procedure CheckPermissions()
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);
        if not PurchaseHeader.ReadPermission() then
            Error(PurchaseOrderPermissionsErr);

        HasWritePermission := PurchaseHeader.WritePermission();
    end;

    local procedure UpdateDiscount()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchCalcDiscByType: Codeunit "Purch - Calc Disc. By Type";
    begin
        if not DiscountAmountSet then begin
            GraphMgtPurchOrderBuffer.RedistributeInvoiceDiscounts(Rec);
            exit;
        end;

        PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, "No.");
        PurchCalcDiscByType.ApplyInvDiscBasedOnAmt(InvoiceDiscountAmount, PurchaseHeader);
    end;

    local procedure SetDates()
    begin
        if not (DocumentDateSet or PostingDateSet) then
            exit;

        TempFieldBuffer.Reset();
        TempFieldBuffer.DeleteAll();

        if DocumentDateSet then begin
            "Document Date" := DocumentDateVar;
            RegisterFieldSet(FieldNo("Document Date"));
        end;

        if PostingDateSet then begin
            "Posting Date" := PostingDateVar;
            RegisterFieldSet(FieldNo("Posting Date"));
        end;

        GraphMgtPurchOrderBuffer.PropagateOnModify(Rec, TempFieldBuffer);
        Find();
    end;

    local procedure GetOrder(var PurchaseHeader: Record "Purchase Header")
    begin
        if not PurchaseHeader.GetBySystemId(Id) then
            Error(CannotFindOrderErr);
    end;

    local procedure PostInvoice(var PurchaseHeader: Record "Purchase Header"; var PurchInvHeader: Record "Purch. Inv. Header")
    var
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
        OrderNo: Code[20];
        OrderNoSeries: Code[20];
    begin
        LinesInstructionMgt.PurchaseCheckAllLinesHaveQuantityAssigned(PurchaseHeader);
        OrderNo := PurchaseHeader."No.";
        OrderNoSeries := PurchaseHeader."No. Series";
        PurchaseHeader.Receive := true;
        PurchaseHeader.Invoice := true;
        PurchaseHeader.SendToPosting(Codeunit::"Purch.-Post");
        Commit(); // Purch.-Post does not always commit latest purchase invoice header
        PurchInvHeader.SetCurrentKey("Order No.");
        PurchInvHeader.SetRange("Order No.", OrderNo);
        PurchInvHeader.SetRange("Order No. Series", OrderNoSeries);
        PurchInvHeader.SetRange("Pre-Assigned No.", '');
        PurchInvHeader.FindFirst();
    end;

    local procedure SetActionResponse(var ActionContext: WebServiceActionContext; InvoiceId: Guid)
    var
    begin
        ActionContext.SetObjectType(ObjectType::Page);
        ActionContext.SetObjectId(Page::"APIV2 - Purchase Invoices");
        ActionContext.AddEntityKey(FieldNo(Id), InvoiceId);
        ActionContext.SetResultCode(WebServiceActionResultCode::Deleted);
    end;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure ReceiveAndInvoice(var ActionContext: WebServiceActionContext)
    var
        PurchaseHeader: Record "Purchase Header";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchInvAggregator: Codeunit "Purch. Inv. Aggregator";
    begin
        GetOrder(PurchaseHeader);
        PostInvoice(PurchaseHeader, PurchInvHeader);
        SetActionResponse(ActionContext, PurchInvAggregator.GetPurchaseInvoiceHeaderId(PurchInvHeader));
    end;
}
