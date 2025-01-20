@interface SAUITemplateImageView
+ (id)imageView;
- (NSArray)monogramName;
- (NSArray)themeImages;
- (NSString)style;
- (SAUIImageResource)image;
- (double)imagePointHeight;
- (double)imagePointWidth;
- (float)alpha;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlpha:(float)a3;
- (void)setImage:(id)a3;
- (void)setImagePointHeight:(double)a3;
- (void)setImagePointWidth:(double)a3;
- (void)setMonogramName:(id)a3;
- (void)setStyle:(id)a3;
- (void)setThemeImages:(id)a3;
@end

@implementation SAUITemplateImageView

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"ImageView";
}

+ (id)imageView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (float)alpha
{
  return AceObjectFloatForProperty(self, @"alpha");
}

- (void)setAlpha:(float)a3
{
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (double)imagePointHeight
{
  return AceObjectDoubleForProperty(self, @"imagePointHeight");
}

- (void)setImagePointHeight:(double)a3
{
}

- (double)imagePointWidth
{
  return AceObjectDoubleForProperty(self, @"imagePointWidth");
}

- (void)setImagePointWidth:(double)a3
{
}

- (NSArray)monogramName
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"monogramName"];
}

- (void)setMonogramName:(id)a3
{
}

- (NSString)style
{
  return (NSString *)[(AceObject *)self propertyForKey:@"style"];
}

- (void)setStyle:(id)a3
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

@end