@interface SAUITemplateCollectionViewCell
+ (id)collectionViewCell;
- (BOOL)sizeToFitImage;
- (NSArray)monogramName;
- (NSArray)themeImages;
- (NSString)subtitleText;
- (NSString)titleText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMonogramName:(id)a3;
- (void)setSizeToFitImage:(BOOL)a3;
- (void)setSubtitleText:(id)a3;
- (void)setThemeImages:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation SAUITemplateCollectionViewCell

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"CollectionViewCell";
}

+ (id)collectionViewCell
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)monogramName
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"monogramName"];
}

- (void)setMonogramName:(id)a3
{
}

- (BOOL)sizeToFitImage
{
  return AceObjectBoolForProperty(self, @"sizeToFitImage");
}

- (void)setSizeToFitImage:(BOOL)a3
{
}

- (NSString)subtitleText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subtitleText"];
}

- (void)setSubtitleText:(id)a3
{
}

- (NSArray)themeImages
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"themeImages", v3);
}

- (void)setThemeImages:(id)a3
{
}

- (NSString)titleText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"titleText"];
}

- (void)setTitleText:(id)a3
{
}

@end