@interface SALocalSearchAnswerRerouteSuggestion
+ (id)answerRerouteSuggestion;
- (BOOL)requiresResponse;
- (NSString)response;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResponse:(id)a3;
@end

@implementation SALocalSearchAnswerRerouteSuggestion

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"AnswerRerouteSuggestion";
}

+ (id)answerRerouteSuggestion
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)response
{
  return (NSString *)[(AceObject *)self propertyForKey:@"response"];
}

- (void)setResponse:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end