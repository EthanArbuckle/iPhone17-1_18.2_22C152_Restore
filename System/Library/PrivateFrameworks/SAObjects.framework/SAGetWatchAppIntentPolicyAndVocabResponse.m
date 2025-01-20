@interface SAGetWatchAppIntentPolicyAndVocabResponse
+ (id)getWatchAppIntentPolicyAndVocabResponse;
- (BOOL)requiresResponse;
- (NSDictionary)aceAppBundleInfos;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceAppBundleInfos:(id)a3;
@end

@implementation SAGetWatchAppIntentPolicyAndVocabResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetWatchAppIntentPolicyAndVocabResponse";
}

+ (id)getWatchAppIntentPolicyAndVocabResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)aceAppBundleInfos
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"aceAppBundleInfos", v3);
}

- (void)setAceAppBundleInfos:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end