@interface PKPaymentTransactionDetailAmountLineItemTransferSource
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemTransferSource)initWithAmount:(id)a3 transactionSourceCollection:(id)a4;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemTransferSource

- (PKPaymentTransactionDetailAmountLineItemTransferSource)initWithAmount:(id)a3 transactionSourceCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentTransactionDetailAmountLineItemTransferSource;
  v8 = [(PKPaymentTransactionDetailAmountLineItemTransferSource *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 formattedStringValue];
    value = v8->_value;
    v8->_value = (NSString *)v9;

    v11 = [v7 paymentPass];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 localizedDescription];
      uint64_t v14 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_63.isa, &stru_1EF1B4C70.isa, v13);
      label = v8->_label;
      v8->_label = (NSString *)v14;
    }
    else
    {
      uint64_t v16 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_64.isa);
      v13 = v8->_label;
      v8->_label = (NSString *)v16;
    }
  }
  return v8;
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
  return 6;
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