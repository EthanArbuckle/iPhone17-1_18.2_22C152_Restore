@interface MFUserProfileProvider_iOS
+ (id)defaultProvider;
- (BOOL)hasAccountsConfigured;
- (MFUserProfileProvider_iOS)init;
- (id)_accountsEmailAddresses;
@end

@implementation MFUserProfileProvider_iOS

- (id)_accountsEmailAddresses
{
  return (id)[MEMORY[0x1E4F77C70] activeAccountEmailAddresses];
}

- (BOOL)hasAccountsConfigured
{
  v2 = [MEMORY[0x1E4F77C70] activeNonLocalAccounts];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (id)defaultProvider
{
  if (defaultProvider_onceToken != -1) {
    dispatch_once(&defaultProvider_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)defaultProvider__defaultProvider;
  return v2;
}

- (MFUserProfileProvider_iOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFUserProfileProvider_iOS;
  v2 = [(EMUserProfileProvider *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(EMUserProfileProvider *)v2 refreshCachedValues];
  }
  return v3;
}

@end