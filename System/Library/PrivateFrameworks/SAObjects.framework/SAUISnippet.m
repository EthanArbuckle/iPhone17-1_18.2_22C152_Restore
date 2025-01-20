@interface SAUISnippet
+ (id)snippet;
- (NSString)subtitle;
- (NSString)summaryTitle;
- (NSString)title;
- (SAUIConfirmationOptions)confirmationOptions;
- (SAUISash)sash;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)category;
- (void)setCategory:(int64_t)a3;
- (void)setConfirmationOptions:(id)a3;
- (void)setSash:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSummaryTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAUISnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)category
{
  return AceObjectIntegerForProperty(self, @"category");
}

- (void)setCategory:(int64_t)a3
{
}

- (SAUIConfirmationOptions)confirmationOptions
{
  return (SAUIConfirmationOptions *)AceObjectAceObjectForProperty(self, @"confirmationOptions");
}

- (void)setConfirmationOptions:(id)a3
{
}

- (SAUISash)sash
{
  return (SAUISash *)AceObjectAceObjectForProperty(self, @"sash");
}

- (void)setSash:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subtitle"];
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)summaryTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"summaryTitle"];
}

- (void)setSummaryTitle:(id)a3
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