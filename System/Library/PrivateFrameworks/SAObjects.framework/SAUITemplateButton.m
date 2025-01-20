@interface SAUITemplateButton
+ (id)button;
- (NSArray)commands;
- (NSDictionary)highlightedTitles;
- (NSDictionary)titles;
- (NSNumber)generateForegroundAppSearchButtonLabel;
- (NSString)backgroundImageStyle;
- (SAUIImageResource)backgroundImage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageStyle:(id)a3;
- (void)setCommands:(id)a3;
- (void)setGenerateForegroundAppSearchButtonLabel:(id)a3;
- (void)setHighlightedTitles:(id)a3;
- (void)setTitles:(id)a3;
@end

@implementation SAUITemplateButton

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"Button";
}

+ (id)button
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIImageResource)backgroundImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"backgroundImage");
}

- (void)setBackgroundImage:(id)a3
{
}

- (NSString)backgroundImageStyle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"backgroundImageStyle"];
}

- (void)setBackgroundImageStyle:(id)a3
{
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (NSNumber)generateForegroundAppSearchButtonLabel
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"generateForegroundAppSearchButtonLabel"];
}

- (void)setGenerateForegroundAppSearchButtonLabel:(id)a3
{
}

- (NSDictionary)highlightedTitles
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"highlightedTitles", v3);
}

- (void)setHighlightedTitles:(id)a3
{
}

- (NSDictionary)titles
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"titles", v3);
}

- (void)setTitles:(id)a3
{
}

@end