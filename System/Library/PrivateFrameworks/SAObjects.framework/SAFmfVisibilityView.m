@interface SAFmfVisibilityView
+ (id)visibilityView;
- (BOOL)visible;
- (NSURL)searchContext;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSearchContext:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SAFmfVisibilityView

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"VisibilityView";
}

+ (id)visibilityView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)searchContext
{
  return (NSURL *)AceObjectURLForProperty(self, @"searchContext");
}

- (void)setSearchContext:(id)a3
{
}

- (BOOL)visible
{
  return AceObjectBoolForProperty(self, @"visible");
}

- (void)setVisible:(BOOL)a3
{
}

@end