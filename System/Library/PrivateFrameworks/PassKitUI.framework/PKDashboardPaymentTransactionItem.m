@interface PKDashboardPaymentTransactionItem
+ (id)identifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFeaturedTransaction;
- (FKInstitution)bankConnectInstitution;
- (NSSet)physicalCards;
- (PKAccount)account;
- (PKAccountUserCollection)accountUserCollection;
- (PKDashboardPaymentTransactionItem)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 transaction:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8;
- (PKFamilyMemberCollection)familyCollection;
- (PKPaymentTransaction)transaction;
- (PKTransactionSource)secondaryTransactionSource;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (unint64_t)hash;
- (void)setAccount:(id)a3;
- (void)setAccountUserCollection:(id)a3;
- (void)setBankConnectInstitution:(id)a3;
- (void)setFamilyCollection:(id)a3;
- (void)setIsFeaturedTransaction:(BOOL)a3;
- (void)setPhysicalCards:(id)a3;
- (void)setSecondaryTransactionSource:(id)a3;
@end

@implementation PKDashboardPaymentTransactionItem

- (PKDashboardPaymentTransactionItem)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 transaction:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKDashboardPaymentTransactionItem;
  v18 = [(PKDashboardPaymentTransactionItem *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_transaction, a5);
    objc_storeStrong((id *)&v19->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v19->_familyCollection, a4);
    objc_storeStrong((id *)&v19->_account, a6);
    objc_storeStrong((id *)&v19->_accountUserCollection, a7);
    objc_storeStrong((id *)&v19->_bankConnectInstitution, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PKPaymentTransaction *)self->_transaction identifier];
    v6 = [v4[2] identifier];
    char v7 = PKEqualObjects();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PKPaymentTransaction *)self->_transaction identifier];
  [v3 safelyAddObject:v4];

  unint64_t v5 = PKCombinedHash();
  return v5;
}

+ (id)identifier
{
  return @"transaction";
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
}

- (PKTransactionSource)secondaryTransactionSource
{
  return self->_secondaryTransactionSource;
}

- (void)setSecondaryTransactionSource:(id)a3
{
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
}

- (FKInstitution)bankConnectInstitution
{
  return self->_bankConnectInstitution;
}

- (void)setBankConnectInstitution:(id)a3
{
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
}

- (BOOL)isFeaturedTransaction
{
  return self->_isFeaturedTransaction;
}

- (void)setIsFeaturedTransaction:(BOOL)a3
{
  self->_isFeaturedTransaction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_secondaryTransactionSource, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end