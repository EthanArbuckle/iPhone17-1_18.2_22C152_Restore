@interface SAAnswerAnswerProperty
+ (id)answerProperty;
- (NSString)name;
- (NSString)value;
- (NSString)valueAnnotation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueAnnotation:(id)a3;
@end

@implementation SAAnswerAnswerProperty

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"AnswerProperty";
}

+ (id)answerProperty
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

- (NSString)valueAnnotation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"valueAnnotation"];
}

- (void)setValueAnnotation:(id)a3
{
}

@end