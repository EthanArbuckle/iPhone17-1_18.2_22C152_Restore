@interface SAUISetSuggestedUtterances
+ (id)setSuggestedUtterances;
- (BOOL)requiresResponse;
- (NSArray)utterances;
- (NSString)language;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLanguage:(id)a3;
- (void)setUtterances:(id)a3;
@end

@implementation SAUISetSuggestedUtterances

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SetSuggestedUtterances";
}

+ (id)setSuggestedUtterances
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (NSArray)utterances
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"utterances"];
}

- (void)setUtterances:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end