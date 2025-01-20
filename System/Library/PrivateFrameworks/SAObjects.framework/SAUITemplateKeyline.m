@interface SAUITemplateKeyline
+ (id)keyline;
- (NSNumber)width;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWidth:(id)a3;
@end

@implementation SAUITemplateKeyline

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"Keyline";
}

+ (id)keyline
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)width
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"width"];
}

- (void)setWidth:(id)a3
{
}

@end