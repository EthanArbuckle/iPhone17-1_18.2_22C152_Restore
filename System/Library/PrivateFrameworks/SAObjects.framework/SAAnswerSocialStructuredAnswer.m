@interface SAAnswerSocialStructuredAnswer
+ (id)socialStructuredAnswer;
- (NSArray)socialQuestions;
- (NSString)category;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCategory:(id)a3;
- (void)setSocialQuestions:(id)a3;
@end

@implementation SAAnswerSocialStructuredAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"SocialStructuredAnswer";
}

+ (id)socialStructuredAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)category
{
  return (NSString *)[(AceObject *)self propertyForKey:@"category"];
}

- (void)setCategory:(id)a3
{
}

- (NSArray)socialQuestions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"socialQuestions", v3);
}

- (void)setSocialQuestions:(id)a3
{
}

@end