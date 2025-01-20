@interface PKDashboardPaymentTransactionGroupItem
+ (id)identifier;
- (BOOL)isEqual:(id)a3;
- (NSArray)tokens;
- (NSSet)physicalCards;
- (PKAccount)account;
- (PKAccountUserCollection)accountUserCollection;
- (PKFamilyMemberCollection)familyCollection;
- (PKPaymentTransactionGroup)group;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (unint64_t)hash;
- (void)setAccount:(id)a3;
- (void)setAccountUserCollection:(id)a3;
- (void)setFamilyCollection:(id)a3;
- (void)setGroup:(id)a3;
- (void)setPhysicalCards:(id)a3;
- (void)setTokens:(id)a3;
- (void)setTransactionSourceCollection:(id)a3;
@end

@implementation PKDashboardPaymentTransactionGroupItem

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = PKEqualObjects();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_group];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

+ (id)identifier
{
  return @"transactionGroup";
}

- (PKPaymentTransactionGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
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

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end