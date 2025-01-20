@interface PKBankAccountDataItem
+ (int64_t)dataType;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)showPeerPaymentBalance;
- (PKBankAccountDataItem)initWithModel:(id)a3;
- (PKBankAccountInformation)PKBankAccountInformation;
- (PKBankAccountInformation)bankAccountInformation;
- (PKCurrencyAmount)peerPaymentBalance;
- (int64_t)context;
- (void)setPKBankAccountInformation:(id)a3;
- (void)setPeerPaymentBalance:(id)a3;
- (void)setShowPeerPaymentBalance:(BOOL)a3;
@end

@implementation PKBankAccountDataItem

+ (int64_t)dataType
{
  return 9;
}

- (PKBankAccountDataItem)initWithModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKBankAccountDataItem;
  return [(PKPaymentDataItem *)&v4 initWithModel:a3];
}

- (int64_t)context
{
  return 1;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (PKBankAccountInformation)bankAccountInformation
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 bankAccount];

  return (PKBankAccountInformation *)v3;
}

- (PKCurrencyAmount)peerPaymentBalance
{
  return self->_peerPaymentBalance;
}

- (void)setPeerPaymentBalance:(id)a3
{
}

- (BOOL)showPeerPaymentBalance
{
  return self->_showPeerPaymentBalance;
}

- (void)setShowPeerPaymentBalance:(BOOL)a3
{
  self->_showPeerPaymentBalance = a3;
}

- (PKBankAccountInformation)PKBankAccountInformation
{
  return self->_PKBankAccountInformation;
}

- (void)setPKBankAccountInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PKBankAccountInformation, 0);
  objc_storeStrong((id *)&self->_peerPaymentBalance, 0);
}

@end