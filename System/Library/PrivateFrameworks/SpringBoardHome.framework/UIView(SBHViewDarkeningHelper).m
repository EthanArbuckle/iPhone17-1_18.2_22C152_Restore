@interface UIView(SBHViewDarkeningHelper)
- (SBHViewDarkeningHelper)sbh_darkener;
@end

@implementation UIView(SBHViewDarkeningHelper)

- (SBHViewDarkeningHelper)sbh_darkener
{
  objc_getAssociatedObject(a1, &SBHViewDarkeningHelperKey);
  v2 = (SBHViewDarkeningHelper *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = [[SBHViewDarkeningHelper alloc] initWithView:a1];
    objc_setAssociatedObject(a1, &SBHViewDarkeningHelperKey, v2, (void *)1);
  }
  return v2;
}

@end