@interface SAGKAnswerProperty
+ (id)answerProperty;
- (NSNumber)selected;
- (NSString)name;
- (NSString)value;
- (NSString)valueAnnotation;
- (SAClientBoundCommand)command;
- (SAUIAppPunchOut)punchOut;
- (SAUIDecoratedText)decoratedValue;
- (SAUIDecoratedText)decoratedValueAnnotation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommand:(id)a3;
- (void)setDecoratedValue:(id)a3;
- (void)setDecoratedValueAnnotation:(id)a3;
- (void)setName:(id)a3;
- (void)setPunchOut:(id)a3;
- (void)setSelected:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueAnnotation:(id)a3;
@end

@implementation SAGKAnswerProperty

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
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

- (SAClientBoundCommand)command
{
  return (SAClientBoundCommand *)AceObjectAceObjectForProperty(self, @"command");
}

- (void)setCommand:(id)a3
{
}

- (SAUIDecoratedText)decoratedValue
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"decoratedValue");
}

- (void)setDecoratedValue:(id)a3
{
}

- (SAUIDecoratedText)decoratedValueAnnotation
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"decoratedValueAnnotation");
}

- (void)setDecoratedValueAnnotation:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchOut");
}

- (void)setPunchOut:(id)a3
{
}

- (NSNumber)selected
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"selected"];
}

- (void)setSelected:(id)a3
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