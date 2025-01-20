@interface SASUserUtteranceEditableTextSnippet
+ (id)userUtteranceEditableTextSnippet;
- (NSString)sessionId;
- (NSString)utterance;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSessionId:(id)a3;
- (void)setUtterance:(id)a3;
@end

@implementation SASUserUtteranceEditableTextSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"UserUtteranceEditableTextSnippet";
}

+ (id)userUtteranceEditableTextSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)sessionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sessionId"];
}

- (void)setSessionId:(id)a3
{
}

- (NSString)utterance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utterance"];
}

- (void)setUtterance:(id)a3
{
}

@end