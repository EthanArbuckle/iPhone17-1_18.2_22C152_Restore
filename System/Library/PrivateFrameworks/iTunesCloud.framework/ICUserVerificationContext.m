@interface ICUserVerificationContext
+ (id)contextWithACAccount:(id)a3 accountStore:(id)a4;
- (ACAccount)ACAccount;
- (ACAccountStore)ACAccountStore;
- (ICUserIdentityProperties)identityProperties;
- (ICUserIdentityStore)identityStore;
- (NSString)debugReason;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)interactionLevel;
- (int64_t)verificationStyle;
- (void)setACAccount:(id)a3;
- (void)setACAccountStore:(id)a3;
- (void)setDebugReason:(id)a3;
- (void)setIdentityProperties:(id)a3;
- (void)setIdentityStore:(id)a3;
- (void)setInteractionLevel:(int64_t)a3;
- (void)setVerificationStyle:(int64_t)a3;
@end

@implementation ICUserVerificationContext

+ (id)contextWithACAccount:(id)a3 accountStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setACAccount:v7];

  [v8 setACAccountStore:v6];
  [v8 setVerificationStyle:0];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_ACAccountStore, 0);
  objc_storeStrong((id *)&self->_ACAccount, 0);
  objc_storeStrong((id *)&self->_debugReason, 0);

  objc_storeStrong((id *)&self->_identityProperties, 0);
}

- (void)setVerificationStyle:(int64_t)a3
{
  self->_verificationStyle = a3;
}

- (int64_t)verificationStyle
{
  return self->_verificationStyle;
}

- (void)setIdentityStore:(id)a3
{
}

- (ICUserIdentityStore)identityStore
{
  return self->_identityStore;
}

- (void)setACAccountStore:(id)a3
{
}

- (ACAccountStore)ACAccountStore
{
  return self->_ACAccountStore;
}

- (void)setACAccount:(id)a3
{
}

- (ACAccount)ACAccount
{
  return self->_ACAccount;
}

- (void)setDebugReason:(id)a3
{
}

- (NSString)debugReason
{
  return self->_debugReason;
}

- (void)setInteractionLevel:(int64_t)a3
{
  self->_interactionLevel = a3;
}

- (int64_t)interactionLevel
{
  return self->_interactionLevel;
}

- (void)setIdentityProperties:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 32), self->_ACAccount);
    objc_storeStrong((id *)(v6 + 40), self->_ACAccountStore);
    *(void *)(v6 + 8) = self->_interactionLevel;
    id v7 = [(ICUserIdentityProperties *)self->_identityProperties copyWithZone:a3];
    id v8 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v7;

    objc_storeStrong((id *)(v6 + 48), self->_identityStore);
    *(void *)(v6 + 56) = self->_verificationStyle;
    objc_storeStrong((id *)(v6 + 24), self->_debugReason);
  }
  return (id)v6;
}

- (ICUserIdentityProperties)identityProperties
{
  identityProperties = self->_identityProperties;
  if (identityProperties) {
    v3 = identityProperties;
  }
  else {
    v3 = objc_alloc_init(ICUserIdentityProperties);
  }

  return v3;
}

@end