@interface PKPaymentTransactionDetailAmountLineItemFundingSource
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemFundingSource)initWithAmount:(id)a3 credentialType:(int64_t)a4 dpanSuffix:(id)a5 cardDescription:(id)a6;
- (PKPaymentTransactionDetailAmountLineItemFundingSource)initWithAmount:(id)a3 transactionSourceCollection:(id)a4;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemFundingSource

- (PKPaymentTransactionDetailAmountLineItemFundingSource)initWithAmount:(id)a3 transactionSourceCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentTransactionDetailAmountLineItemFundingSource;
  v8 = [(PKPaymentTransactionDetailAmountLineItemFundingSource *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 formattedStringValue];
    value = v8->_value;
    v8->_value = (NSString *)v9;

    v11 = [v7 paymentPass];
    v12 = [v11 localizedDescription];

    if ([v12 length]) {
      PKLocalizedPeerPaymentString(&cfstr_TransactionDet_53.isa, &stru_1EF1B4C70.isa, v12);
    }
    else {
    uint64_t v13 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_54.isa);
    }
    label = v8->_label;
    v8->_label = (NSString *)v13;
  }
  return v8;
}

- (PKPaymentTransactionDetailAmountLineItemFundingSource)initWithAmount:(id)a3 credentialType:(int64_t)a4 dpanSuffix:(id)a5 cardDescription:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentTransactionDetailAmountLineItemFundingSource;
  v12 = [(PKPaymentTransactionDetailAmountLineItemFundingSource *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v9 formattedStringValue];
    value = v12->_value;
    v12->_value = (NSString *)v13;

    if ([v11 length])
    {
      uint64_t v15 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_53.isa, &stru_1EF1B4C70.isa, v11);
LABEL_14:
      label = v12->_label;
      v12->_label = (NSString *)v15;

      goto LABEL_15;
    }
    objc_super v16 = PKDisplayablePaymentNetworkNameForPaymentCredentialType();
    if ([v16 length] && objc_msgSend(v10, "length"))
    {
      PKLocalizedPeerPaymentString(&cfstr_TransactionDet_55.isa, &stru_1EF1B5770.isa, v16, v10);
    }
    else
    {
      if ([v16 length])
      {
        id v21 = v16;
        v17 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FUNDING_SOURCE_CARD_NETWORK_FORMAT_STRING";
      }
      else
      {
        if (![v10 length])
        {
          uint64_t v18 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_58.isa);
          goto LABEL_13;
        }
        id v21 = v10;
        v17 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FUNDING_SOURCE_DPAN_SUFFIX_FORMAT_STRING";
      }
      PKLocalizedPeerPaymentString(&v17->isa, &stru_1EF1B4C70.isa, v21);
    uint64_t v18 = };
LABEL_13:
    uint64_t v15 = v18;

    goto LABEL_14;
  }
LABEL_15:

  return v12;
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
  return 1;
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