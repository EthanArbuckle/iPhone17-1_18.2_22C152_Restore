@interface CEMLegacyRestrictionsAppsDeclaration(UIAdditions)
- (uint64_t)st_payloadAllowMail;
- (uint64_t)st_payloadAllowWallet;
- (void)setSt_payloadAllowMail:()UIAdditions;
- (void)setSt_payloadAllowWallet:()UIAdditions;
@end

@implementation CEMLegacyRestrictionsAppsDeclaration(UIAdditions)

- (uint64_t)st_payloadAllowMail
{
  v1 = [a1 payloadBlacklistedAppBundleIDs];
  uint64_t v2 = [v1 containsObject:*MEMORY[0x263F67330]] ^ 1;

  return v2;
}

- (void)setSt_payloadAllowMail:()UIAdditions
{
  v5 = [a1 payloadBlacklistedAppBundleIDs];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v10 = v8;

  uint64_t v9 = *MEMORY[0x263F67330];
  if (a3) {
    [v10 removeObject:v9];
  }
  else {
    [v10 addObject:v9];
  }
  [a1 setPayloadBlacklistedAppBundleIDs:v10];
}

- (uint64_t)st_payloadAllowWallet
{
  v1 = [a1 payloadBlacklistedAppBundleIDs];
  uint64_t v2 = [v1 containsObject:*MEMORY[0x263F67378]] ^ 1;

  return v2;
}

- (void)setSt_payloadAllowWallet:()UIAdditions
{
  v5 = [a1 payloadBlacklistedAppBundleIDs];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v10 = v8;

  uint64_t v9 = *MEMORY[0x263F67378];
  if (a3) {
    [v10 removeObject:v9];
  }
  else {
    [v10 addObject:v9];
  }
  [a1 setPayloadBlacklistedAppBundleIDs:v10];
}

@end