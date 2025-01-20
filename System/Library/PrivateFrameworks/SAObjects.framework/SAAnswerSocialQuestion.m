@interface SAAnswerSocialQuestion
+ (id)socialQuestion;
- (NSArray)socialAnswers;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSocialAnswers:(id)a3;
@end

@implementation SAAnswerSocialQuestion

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"SocialQuestion";
}

+ (id)socialQuestion
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)socialAnswers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"socialAnswers", v3);
}

- (void)setSocialAnswers:(id)a3
{
}

@end