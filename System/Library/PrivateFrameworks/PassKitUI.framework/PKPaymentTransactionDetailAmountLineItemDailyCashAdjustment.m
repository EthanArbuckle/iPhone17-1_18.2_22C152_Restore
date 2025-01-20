@interface PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment)initWithAssociatedTransaction:(id)a3;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment

- (PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment)initWithAssociatedTransaction:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment;
  v5 = [(PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment *)&v12 init];
  if (v5)
  {
    [v4 featureIdentifier];
    uint64_t v6 = PKLocalizedFeatureString();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v8 = [v4 currencyAmount];
    uint64_t v9 = [v8 formattedStringValue];
    value = v5->_value;
    v5->_value = (NSString *)v9;
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
  return 7;
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