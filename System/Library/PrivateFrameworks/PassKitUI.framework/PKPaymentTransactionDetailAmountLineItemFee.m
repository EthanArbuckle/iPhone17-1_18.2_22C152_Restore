@interface PKPaymentTransactionDetailAmountLineItemFee
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemFee)initWithFeeItem:(id)a3;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemFee

- (PKPaymentTransactionDetailAmountLineItemFee)initWithFeeItem:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionDetailAmountLineItemFee;
  v5 = [(PKPaymentTransactionDetailAmountLineItemFee *)&v17 init];
  if (v5)
  {
    v6 = [v4 currencyAmount];
    uint64_t v7 = [v6 formattedStringValue];
    value = v5->_value;
    v5->_value = (NSString *)v7;

    v9 = [v4 localizedDisplayName];
    if ([v9 length])
    {
      id v10 = v9;
    }
    else
    {
      uint64_t v11 = [v4 type];
      v12 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_CREDIT_CARD";
      switch(v11)
      {
        case 0:
          goto LABEL_7;
        case 1:
          goto LABEL_10;
        case 2:
          v12 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_FOREIGN_TRANSACTION";
          goto LABEL_10;
        case 3:
          v12 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_SERVICE_CHARGE";
          goto LABEL_10;
        case 4:
          v12 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_INSTANT_WITHDRAWAL";
          goto LABEL_10;
        default:
          if (v11 == 100)
          {
LABEL_7:
            v12 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_GENERIC";
LABEL_10:
            PKLocalizedPeerPaymentString(&v12->isa);
            id v10 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v10 = 0;
          }
          if (![v10 length])
          {
            uint64_t v13 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_52.isa);

            id v10 = (id)v13;
          }
          break;
      }
    }
    label = v5->_label;
    v5->_label = (NSString *)v10;
    id v15 = v10;
  }
  return v5;
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
  return 0;
}

- (unint64_t)lineItemType
{
  return 0;
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