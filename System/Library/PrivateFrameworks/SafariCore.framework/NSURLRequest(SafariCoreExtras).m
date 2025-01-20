@interface NSURLRequest(SafariCoreExtras)
+ (id)safari_nonAppInitiatedRequestWithURL:()SafariCoreExtras;
- (id)safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:()SafariCoreExtras;
- (id)safari_requestBySettingIsUserInitiated:()SafariCoreExtras;
@end

@implementation NSURLRequest(SafariCoreExtras)

+ (id)safari_nonAppInitiatedRequestWithURL:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "requestWithURL:");
  v2 = objc_msgSend(v1, "safari_requestBySettingIsUserInitiated:", 1);

  return v2;
}

- (id)safari_requestBySettingIsUserInitiated:()SafariCoreExtras
{
  if (([a1 attribution] != 1) == a3)
  {
    id v5 = (id)[a1 mutableCopy];
    [v5 setAttribution:a3];
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

- (id)safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:()SafariCoreExtras
{
  v4 = a1;
  id v5 = (void *)[a1 mutableCopy];
  if ([v5 _useEnhancedPrivacyMode] != a3)
  {
    [v5 _setUseEnhancedPrivacyMode:a3];
    v4 = v5;
  }
  id v6 = v4;

  return v6;
}

@end