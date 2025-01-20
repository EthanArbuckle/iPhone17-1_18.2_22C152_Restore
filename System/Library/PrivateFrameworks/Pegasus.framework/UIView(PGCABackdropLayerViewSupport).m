@interface UIView(PGCABackdropLayerViewSupport)
- (id)PG_backdropGroupLeader;
- (uint64_t)PG_preferredVisibilityForView:()PGCABackdropLayerViewSupport;
@end

@implementation UIView(PGCABackdropLayerViewSupport)

- (id)PG_backdropGroupLeader
{
  v1 = [a1 superview];
  v2 = objc_msgSend(v1, "PG_backdropGroupLeader");

  return v2;
}

- (uint64_t)PG_preferredVisibilityForView:()PGCABackdropLayerViewSupport
{
  id v4 = a3;
  v5 = [a1 superview];
  uint64_t v6 = objc_msgSend(v5, "PG_preferredVisibilityForView:", v4);

  return v6;
}

@end