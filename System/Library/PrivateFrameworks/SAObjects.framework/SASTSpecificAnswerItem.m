@interface SASTSpecificAnswerItem
+ (id)specificAnswerItem;
- (NSString)footer;
- (NSString)value;
- (SAUIDecoratedText)decoratedFooter;
- (SAUIDecoratedText)decoratedValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDecoratedFooter:(id)a3;
- (void)setDecoratedValue:(id)a3;
- (void)setFooter:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SASTSpecificAnswerItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"SpecificAnswerItem";
}

+ (id)specificAnswerItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDecoratedText)decoratedFooter
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"decoratedFooter");
}

- (void)setDecoratedFooter:(id)a3
{
}

- (SAUIDecoratedText)decoratedValue
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"decoratedValue");
}

- (void)setDecoratedValue:(id)a3
{
}

- (NSString)footer
{
  return (NSString *)[(AceObject *)self propertyForKey:@"footer"];
}

- (void)setFooter:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end