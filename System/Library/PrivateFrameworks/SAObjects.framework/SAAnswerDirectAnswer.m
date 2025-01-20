@interface SAAnswerDirectAnswer
+ (id)directAnswer;
- (NSString)answer;
- (SAAnswerSpeakableAnswer)speakableAnswer;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnswer:(id)a3;
- (void)setSpeakableAnswer:(id)a3;
@end

@implementation SAAnswerDirectAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"DirectAnswer";
}

+ (id)directAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)answer
{
  return (NSString *)[(AceObject *)self propertyForKey:@"answer"];
}

- (void)setAnswer:(id)a3
{
}

- (SAAnswerSpeakableAnswer)speakableAnswer
{
  return (SAAnswerSpeakableAnswer *)AceObjectAceObjectForProperty(self, @"speakableAnswer");
}

- (void)setSpeakableAnswer:(id)a3
{
}

@end