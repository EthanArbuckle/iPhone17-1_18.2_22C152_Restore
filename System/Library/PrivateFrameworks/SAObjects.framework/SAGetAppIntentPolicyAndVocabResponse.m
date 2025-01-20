@interface SAGetAppIntentPolicyAndVocabResponse
+ (id)getAppIntentPolicyAndVocabResponse;
- (BOOL)requiresResponse;
- (NSDictionary)aceAppBundleInfos;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceAppBundleInfos:(id)a3;
@end

@implementation SAGetAppIntentPolicyAndVocabResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetAppIntentPolicyAndVocabResponse";
}

+ (id)getAppIntentPolicyAndVocabResponse
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