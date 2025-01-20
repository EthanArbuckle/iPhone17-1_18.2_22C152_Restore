@interface SAAnswerSocialAnswer
+ (id)socialAnswer;
- (NSNumber)selectedAnswer;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSelectedAnswer:(id)a3;
@end

@implementation SAAnswerSocialAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"SocialAnswer";
}

+ (id)socialAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)selectedAnswer
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"selectedAnswer"];
}

- (void)setSelectedAnswer:(id)a3
{
}

@end