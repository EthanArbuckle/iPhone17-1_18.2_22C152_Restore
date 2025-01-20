@interface SAUITemplateFont
+ (id)font;
- (NSNumber)size;
- (NSString)textStyle;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSize:(id)a3;
- (void)setTextStyle:(id)a3;
@end

@implementation SAUITemplateFont

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"Font";
}

+ (id)font
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)size
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"size"];
}

- (void)setSize:(id)a3
{
}

- (NSString)textStyle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"textStyle"];
}

- (void)setTextStyle:(id)a3
{
}

@end