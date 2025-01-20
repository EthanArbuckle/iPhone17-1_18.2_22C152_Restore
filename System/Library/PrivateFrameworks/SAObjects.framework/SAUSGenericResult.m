@interface SAUSGenericResult
+ (id)genericResult;
- (BOOL)centered;
- (NSArray)descriptions;
- (NSNumber)titleMaxLines;
- (NSString)footnote;
- (NSString)secondaryTitle;
- (NSString)title;
- (SAUIAppPunchOut)actionButton;
- (SAUIImageResource)thumbnail;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActionButton:(id)a3;
- (void)setCentered:(BOOL)a3;
- (void)setDescriptions:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleMaxLines:(id)a3;
@end

@implementation SAUSGenericResult

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
}

- (id)encodedClassName
{
  return @"GenericResult";
}

+ (id)genericResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAppPunchOut)actionButton
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"actionButton");
}

- (void)setActionButton:(id)a3
{
}

- (BOOL)centered
{
  return AceObjectBoolForProperty(self, @"centered");
}

- (void)setCentered:(BOOL)a3
{
}

- (NSArray)descriptions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"descriptions", v3);
}

- (void)setDescriptions:(id)a3
{
}

- (NSString)footnote
{
  return (NSString *)[(AceObject *)self propertyForKey:@"footnote"];
}

- (void)setFootnote:(id)a3
{
}

- (NSString)secondaryTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"secondaryTitle"];
}

- (void)setSecondaryTitle:(id)a3
{
}

- (SAUIImageResource)thumbnail
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"thumbnail");
}

- (void)setThumbnail:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (NSNumber)titleMaxLines
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"titleMaxLines"];
}

- (void)setTitleMaxLines:(id)a3
{
}

@end