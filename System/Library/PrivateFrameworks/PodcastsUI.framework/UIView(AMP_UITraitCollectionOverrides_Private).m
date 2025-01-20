@interface UIView(AMP_UITraitCollectionOverrides_Private)
- (id)_layoutDirectionValue;
- (unint64_t)_layoutDirectionFromLayoutDirectionValue:()AMP_UITraitCollectionOverrides_Private;
@end

@implementation UIView(AMP_UITraitCollectionOverrides_Private)

- (id)_layoutDirectionValue
{
  return objc_getAssociatedObject(a1, sel_layoutDirection);
}

- (unint64_t)_layoutDirectionFromLayoutDirectionValue:()AMP_UITraitCollectionOverrides_Private
{
  if (!a3) {
    return -1;
  }
  unint64_t result = [a3 integerValue];
  if (result >= 2) {
    return -1;
  }
  return result;
}

@end