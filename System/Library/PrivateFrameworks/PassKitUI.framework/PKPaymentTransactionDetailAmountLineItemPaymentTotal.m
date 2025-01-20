@interface PKPaymentTransactionDetailAmountLineItemPaymentTotal
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemPaymentTotal)initWithAmount:(id)a3;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemPaymentTotal

- (PKPaymentTransactionDetailAmountLineItemPaymentTotal)initWithAmount:(id)a3
{
  id v4 = a3;
  v5 = [v4 amount];
  objc_msgSend(v5, "pk_absoluteValue");
  v6 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v7 = [v4 currency];

  v8 = PKCurrencyAmountCreate(v6, v7);

  v16.receiver = self;
  v16.super_class = (Class)PKPaymentTransactionDetailAmountLineItemPaymentTotal;
  v9 = [(PKPaymentTransactionDetailAmountLineItemPaymentTotal *)&v16 init];
  if (v9)
  {
    uint64_t v10 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_61.isa);
    label = v9->_label;
    v9->_label = (NSString *)v10;

    v12 = [v8 formattedStringValue];
    uint64_t v13 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v12);
    value = v9->_value;
    v9->_value = (NSString *)v13;
  }
  return v9;
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
  return 3;
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