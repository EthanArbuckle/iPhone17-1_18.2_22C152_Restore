@interface PKDashboardTransactionMapItem
+ (id)identifier;
- (PKMerchant)merchant;
- (PKPaymentTransaction)transaction;
- (void)setMerchant:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PKDashboardTransactionMapItem

+ (id)identifier
{
  return @"map";
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchant, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end