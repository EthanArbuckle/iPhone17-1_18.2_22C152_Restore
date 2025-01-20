@interface SAThemeImage
+ (id)themeImage;
- (NSData)dynamicImage;
- (NSString)appearanceSetting;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppearanceSetting:(id)a3;
- (void)setDynamicImage:(id)a3;
@end

@implementation SAThemeImage

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ThemeImage";
}

+ (id)themeImage
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appearanceSetting
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appearanceSetting"];
}

- (void)setAppearanceSetting:(id)a3
{
}

- (NSData)dynamicImage
{
  return (NSData *)[(AceObject *)self propertyForKey:@"dynamicImage"];
}

- (void)setDynamicImage:(id)a3
{
}

@end