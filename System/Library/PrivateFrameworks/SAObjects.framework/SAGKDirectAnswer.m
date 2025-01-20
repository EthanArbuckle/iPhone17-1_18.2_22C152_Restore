@interface SAGKDirectAnswer
+ (id)directAnswer;
- (NSString)answer;
- (NSString)confidenceLevel;
- (SAGKSpeakableAnswer)speakableAnswer;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnswer:(id)a3;
- (void)setConfidenceLevel:(id)a3;
- (void)setSpeakableAnswer:(id)a3;
@end

@implementation SAGKDirectAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
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

- (NSString)confidenceLevel
{
  return (NSString *)[(AceObject *)self propertyForKey:@"confidenceLevel"];
}

- (void)setConfidenceLevel:(id)a3
{
}

- (SAGKSpeakableAnswer)speakableAnswer
{
  return (SAGKSpeakableAnswer *)AceObjectAceObjectForProperty(self, @"speakableAnswer");
}

- (void)setSpeakableAnswer:(id)a3
{
}

@end