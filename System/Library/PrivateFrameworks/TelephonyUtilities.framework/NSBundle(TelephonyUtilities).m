@interface NSBundle(TelephonyUtilities)
+ (id)tu_assumedIdentityForBundleIdentifier:()TelephonyUtilities;
- (id)tu_assumedIdentity;
@end

@implementation NSBundle(TelephonyUtilities)

- (id)tu_assumedIdentity
{
  v1 = [a1 bundleIdentifier];
  if ([v1 length])
  {
    v2 = objc_msgSend((id)objc_opt_class(), "tu_assumedIdentityForBundleIdentifier:", v1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)tu_assumedIdentityForBundleIdentifier:()TelephonyUtilities
{
  id v3 = a3;
  if ([v3 length])
  {
    if ([v3 isEqualToString:@"com.apple.TelephonyUtilities"])
    {
      v4 = "/System/Library/PrivateFrameworks/TelephonyUtilities.framework/callservicesd";
      uint64_t v5 = 1;
    }
    else
    {
      v4 = (const char *)[v3 UTF8String];
      uint64_t v5 = 0;
    }
    v6 = (void *)tu_tcc_identity_create(v5, (uint64_t)v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end