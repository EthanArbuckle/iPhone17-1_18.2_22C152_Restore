@interface SAUITemplateHighlightGroupView
+ (id)highlightGroupView;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAUITemplateHighlightGroupView

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"HighlightGroupView";
}

+ (id)highlightGroupView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end