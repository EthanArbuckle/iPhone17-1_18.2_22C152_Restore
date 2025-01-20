@interface SAIntentGroupAceAppIntentPolicyAndVocab
+ (id)aceAppIntentPolicyAndVocab;
- (SAIntentGroupProtobufMessage)aceAppBundleInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceAppBundleInfo:(id)a3;
@end

@implementation SAIntentGroupAceAppIntentPolicyAndVocab

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"AceAppIntentPolicyAndVocab";
}

+ (id)aceAppIntentPolicyAndVocab
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAIntentGroupProtobufMessage)aceAppBundleInfo
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"aceAppBundleInfo");
}

- (void)setAceAppBundleInfo:(id)a3
{
}

@end