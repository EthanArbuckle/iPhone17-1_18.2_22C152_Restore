@interface SAUITemplateGroupView
+ (id)groupView;
- (NSString)alignment;
- (NSString)layoutStyle;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlignment:(id)a3;
- (void)setLayoutStyle:(id)a3;
@end

@implementation SAUITemplateGroupView

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"GroupView";
}

+ (id)groupView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)alignment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"alignment"];
}

- (void)setAlignment:(id)a3
{
}

- (NSString)layoutStyle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"layoutStyle"];
}

- (void)setLayoutStyle:(id)a3
{
}

@end