@interface SAFmfVisibilityStateSet
+ (id)visibilityStateSet;
- (BOOL)requiresResponse;
- (BOOL)visible;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVisible:(BOOL)a3;
@end

@implementation SAFmfVisibilityStateSet

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"VisibilityStateSet";
}

+ (id)visibilityStateSet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)visible
{
  return AceObjectBoolForProperty(self, @"visible");
}

- (void)setVisible:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end