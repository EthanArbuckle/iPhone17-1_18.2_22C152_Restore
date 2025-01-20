@interface PKPaymentTransactionDetailAmountLineItemTotal
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemTotal)initWithAmount:(id)a3 totalType:(unint64_t)a4;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemTotal

- (PKPaymentTransactionDetailAmountLineItemTotal)initWithAmount:(id)a3 totalType:(unint64_t)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentTransactionDetailAmountLineItemTotal;
  v7 = [(PKPaymentTransactionDetailAmountLineItemTotal *)&v19 init];
  if (v7)
  {
    v8 = [v6 amount];
    int v9 = objc_msgSend(v8, "pk_isNegativeNumber");

    if (v9)
    {
      v10 = [v6 negativeValue];

      v11 = [v10 formattedStringValue];
      uint64_t v12 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v11);
      value = v7->_value;
      v7->_value = (NSString *)v12;

      id v6 = v10;
    }
    else
    {
      uint64_t v14 = [v6 formattedStringValue];
      v11 = v7->_value;
      v7->_value = (NSString *)v14;
    }

    switch(a4)
    {
      case 0uLL:
        v15 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_PAID";
        goto LABEL_15;
      case 1uLL:
        v15 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_SENT";
        goto LABEL_15;
      case 2uLL:
        v15 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_RECEIVED";
        goto LABEL_15;
      case 3uLL:
        v15 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_NOT_ACCEPTED";
        goto LABEL_15;
      case 4uLL:
        v15 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_UNQUALIFIED_TOTAL";
        goto LABEL_15;
      case 5uLL:
        uint64_t v16 = PKLocalizedPaymentString(&cfstr_Subtotal_0.isa);
        break;
      case 6uLL:
        uint64_t v16 = PKLocalizedBeekmanString(&cfstr_TotalFinanced.isa);
        break;
      case 7uLL:
        v15 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_REQUEST";
LABEL_15:
        uint64_t v16 = PKLocalizedPeerPaymentString(&v15->isa);
        break;
      default:
        uint64_t v16 = 0;
        break;
    }
    label = v7->_label;
    v7->_label = (NSString *)v16;
  }
  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isEmphasized
{
  return 1;
}

- (unint64_t)lineItemType
{
  return 2;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  self->_hasTrailingLineSeperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end