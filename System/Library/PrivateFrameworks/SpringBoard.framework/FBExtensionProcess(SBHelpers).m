@interface FBExtensionProcess(SBHelpers)
- (id)sb_bundleIdentifierWithFallback;
@end

@implementation FBExtensionProcess(SBHelpers)

- (id)sb_bundleIdentifierWithFallback
{
  v2 = [a1 extensionInfo];
  v3 = [v2 bundleIdentifier];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&off_1F356BCD0;
    objc_msgSendSuper2(&v8, sel_sb_bundleIdentifierWithFallback);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end