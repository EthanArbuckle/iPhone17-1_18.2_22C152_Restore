@interface CUINamedLookup(UIKitAdditions)
- (id)configuration;
@end

@implementation CUINamedLookup(UIKitAdditions)

- (id)configuration
{
  v0 = +[UITraitCollection _emptyTraitCollection]();
  v1 = v0;
  if (v0) {
    v0 = (void *)[v0 imageConfiguration];
  }
  id v2 = v0;

  return v2;
}

@end