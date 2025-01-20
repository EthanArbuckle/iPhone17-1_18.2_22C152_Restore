@interface PKPaymentTransactionDetailAmountLineItemForeignExchange
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemForeignExchange)initWithForeignExchangeInformation:(id)a3 type:(unint64_t)a4;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemForeignExchange

- (PKPaymentTransactionDetailAmountLineItemForeignExchange)initWithForeignExchangeInformation:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentTransactionDetailAmountLineItemForeignExchange;
  v7 = [(PKPaymentTransactionDetailAmountLineItemForeignExchange *)&v16 init];
  if (v7)
  {
    if (a4 == 1)
    {
      PKLocalizedFeatureString();
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = [v6 exchangeRate];
      uint64_t v10 = PKFormattedStringSignificantDigitsFromNumber();
    }
    else
    {
      if (a4)
      {
        v8 = 0;
        v11 = 0;
        goto LABEL_8;
      }
      PKLocalizedFeatureString();
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = [v6 destinationCurrencyAmount];
      uint64_t v10 = [v9 formattedStringValue];
    }
    v11 = (NSString *)v10;

LABEL_8:
    label = v7->_label;
    v7->_label = v8;
    v13 = v8;

    value = v7->_value;
    v7->_value = v11;
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
  return 0;
}

- (unint64_t)lineItemType
{
  return 5;
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