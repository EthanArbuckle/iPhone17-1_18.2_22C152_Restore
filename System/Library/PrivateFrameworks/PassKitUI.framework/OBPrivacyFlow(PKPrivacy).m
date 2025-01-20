@interface OBPrivacyFlow(PKPrivacy)
+ (id)pk_privacyFlowForContext:()PKPrivacy;
+ (uint64_t)pk_privacyContentVersionForContext:()PKPrivacy;
@end

@implementation OBPrivacyFlow(PKPrivacy)

+ (id)pk_privacyFlowForContext:()PKPrivacy
{
  v5 = PKPrivacyBundleIdentifiersForContext(a3);
  if ([v5 count] != 1) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"pk_privacyFlowForContext should only be called with a single option, but called with: %lu", a3 format];
  }
  v6 = (void *)MEMORY[0x1E4F83A88];
  v7 = [v5 firstObject];
  v8 = [v6 bundleWithIdentifier:v7];

  v9 = [a1 flowWithBundle:v8];

  return v9;
}

+ (uint64_t)pk_privacyContentVersionForContext:()PKPrivacy
{
  v1 = objc_msgSend(a1, "pk_privacyFlowForContext:");
  uint64_t v2 = [v1 contentVersion];

  return v2;
}

@end