@interface CSDAppleIDUtilities
- (ACAccountStore)accountStore;
- (BOOL)isSignedIntoiCloud;
- (CSDAppleIDUtilities)init;
@end

@implementation CSDAppleIDUtilities

- (CSDAppleIDUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSDAppleIDUtilities;
  v2 = [(CSDAppleIDUtilities *)&v6 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;
  }
  return v2;
}

- (BOOL)isSignedIntoiCloud
{
  v2 = [(CSDAppleIDUtilities *)self accountStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  v4 = [v3 username];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
}

@end