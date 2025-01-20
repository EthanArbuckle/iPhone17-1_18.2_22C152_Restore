@interface SAGKAnswerPropertyGroup
+ (id)answerPropertyGroup;
- (NSArray)answerProperties;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnswerProperties:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAGKAnswerPropertyGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"AnswerPropertyGroup";
}

+ (id)answerPropertyGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)answerProperties
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"answerProperties", v3);
}

- (void)setAnswerProperties:(id)a3
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