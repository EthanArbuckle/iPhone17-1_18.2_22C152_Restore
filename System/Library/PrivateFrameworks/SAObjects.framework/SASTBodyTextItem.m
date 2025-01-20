@interface SASTBodyTextItem
+ (id)bodyTextItem;
- (NSString)alignment;
- (NSString)bodyText;
- (NSString)position;
- (SADecoratedString)decoratedBodyText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlignment:(id)a3;
- (void)setBodyText:(id)a3;
- (void)setDecoratedBodyText:(id)a3;
- (void)setPosition:(id)a3;
@end

@implementation SASTBodyTextItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"BodyTextItem";
}

+ (id)bodyTextItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)alignment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"alignment"];
}

- (void)setAlignment:(id)a3
{
}

- (NSString)bodyText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bodyText"];
}

- (void)setBodyText:(id)a3
{
}

- (SADecoratedString)decoratedBodyText
{
  return (SADecoratedString *)AceObjectAceObjectForProperty(self, @"decoratedBodyText");
}

- (void)setDecoratedBodyText:(id)a3
{
}

- (NSString)position
{
  return (NSString *)[(AceObject *)self propertyForKey:@"position"];
}

- (void)setPosition:(id)a3
{
}

@end