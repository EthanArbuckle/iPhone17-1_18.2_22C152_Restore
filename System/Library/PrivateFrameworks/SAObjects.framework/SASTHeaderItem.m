@interface SASTHeaderItem
+ (id)headerItem;
- (NSString)text;
- (SAUIDecoratedText)header;
- (SAUIDecoratedText)subtitle;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHeader:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SASTHeaderItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"HeaderItem";
}

+ (id)headerItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDecoratedText)header
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"header");
}

- (void)setHeader:(id)a3
{
}

- (SAUIDecoratedText)subtitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"subtitle");
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end