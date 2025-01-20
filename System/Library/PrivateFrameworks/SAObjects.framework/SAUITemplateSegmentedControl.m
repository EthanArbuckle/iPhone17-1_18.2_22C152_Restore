@interface SAUITemplateSegmentedControl
+ (id)segmentedControl;
- (NSArray)titles;
- (NSDictionary)backgroundColors;
- (NSDictionary)textColors;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBackgroundColors:(id)a3;
- (void)setTextColors:(id)a3;
- (void)setTitles:(id)a3;
@end

@implementation SAUITemplateSegmentedControl

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"SegmentedControl";
}

+ (id)segmentedControl
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)backgroundColors
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"backgroundColors", v3);
}

- (void)setBackgroundColors:(id)a3
{
}

- (NSDictionary)textColors
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"textColors", v3);
}

- (void)setTextColors:(id)a3
{
}

- (NSArray)titles
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"titles"];
}

- (void)setTitles:(id)a3
{
}

@end