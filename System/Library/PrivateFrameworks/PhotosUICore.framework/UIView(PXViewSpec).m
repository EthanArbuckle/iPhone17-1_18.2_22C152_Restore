@interface UIView(PXViewSpec)
- (id)px_spec;
- (void)px_setSpec:()PXViewSpec;
@end

@implementation UIView(PXViewSpec)

- (id)px_spec
{
  return objc_getAssociatedObject(a1, (const void *)PXViewSpecAssociationKey);
}

- (void)px_setSpec:()PXViewSpec
{
  v4 = (const void *)PXViewSpecAssociationKey;
  id v5 = a3;
  objc_setAssociatedObject(a1, v4, v5, (void *)1);
  id v9 = [v5 backgroundColor];
  [a1 setBackgroundColor:v9];
  [v5 cornerRadius];
  double v7 = v6;

  v8 = [a1 layer];
  [v8 setCornerRadius:v7];
}

@end