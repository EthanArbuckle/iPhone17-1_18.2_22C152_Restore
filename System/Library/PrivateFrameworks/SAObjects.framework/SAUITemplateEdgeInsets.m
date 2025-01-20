@interface SAUITemplateEdgeInsets
+ (id)edgeInsets;
- (float)bottom;
- (float)left;
- (float)right;
- (float)top;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBottom:(float)a3;
- (void)setLeft:(float)a3;
- (void)setRight:(float)a3;
- (void)setTop:(float)a3;
@end

@implementation SAUITemplateEdgeInsets

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"EdgeInsets";
}

+ (id)edgeInsets
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (float)bottom
{
  return AceObjectFloatForProperty(self, @"bottom");
}

- (void)setBottom:(float)a3
{
}

- (float)left
{
  return AceObjectFloatForProperty(self, @"left");
}

- (void)setLeft:(float)a3
{
}

- (float)right
{
  return AceObjectFloatForProperty(self, @"right");
}

- (void)setRight:(float)a3
{
}

- (float)top
{
  return AceObjectFloatForProperty(self, @"top");
}

- (void)setTop:(float)a3
{
}

@end