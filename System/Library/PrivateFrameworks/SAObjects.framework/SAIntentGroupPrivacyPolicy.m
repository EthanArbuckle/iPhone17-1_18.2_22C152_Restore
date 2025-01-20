@interface SAIntentGroupPrivacyPolicy
+ (id)privacyPolicy;
- (NSString)privacyCategory;
- (NSString)redactionTarget;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPrivacyCategory:(id)a3;
- (void)setRedactionTarget:(id)a3;
@end

@implementation SAIntentGroupPrivacyPolicy

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"PrivacyPolicy";
}

+ (id)privacyPolicy
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)privacyCategory
{
  return (NSString *)[(AceObject *)self propertyForKey:@"privacyCategory"];
}

- (void)setPrivacyCategory:(id)a3
{
}

- (NSString)redactionTarget
{
  return (NSString *)[(AceObject *)self propertyForKey:@"redactionTarget"];
}

- (void)setRedactionTarget:(id)a3
{
}

@end