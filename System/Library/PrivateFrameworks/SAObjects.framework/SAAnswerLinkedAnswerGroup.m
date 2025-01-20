@interface SAAnswerLinkedAnswerGroup
+ (id)linkedAnswerGroup;
- (NSArray)linkedAnswers;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLinkedAnswers:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAAnswerLinkedAnswerGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"LinkedAnswerGroup";
}

+ (id)linkedAnswerGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)linkedAnswers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"linkedAnswers", v3);
}

- (void)setLinkedAnswers:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end