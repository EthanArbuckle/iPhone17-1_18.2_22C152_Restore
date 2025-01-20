@interface SAGetAppIntentPolicyAndVocab
+ (id)getAppIntentPolicyAndVocab;
- (BOOL)requiresResponse;
- (NSArray)clientIdentifiers;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientIdentifiers:(id)a3;
@end

@implementation SAGetAppIntentPolicyAndVocab

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetAppIntentPolicyAndVocab";
}

+ (id)getAppIntentPolicyAndVocab
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)clientIdentifiers
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"clientIdentifiers"];
}

- (void)setClientIdentifiers:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end