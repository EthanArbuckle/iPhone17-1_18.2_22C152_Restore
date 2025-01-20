@interface UIFont(Variant_Private)
- (id)_cachedVariantWeight;
- (void)_setCachedVariantWeight:()Variant_Private;
@end

@implementation UIFont(Variant_Private)

- (id)_cachedVariantWeight
{
  return objc_getAssociatedObject(a1, &kUILabelCachedVariantWeight);
}

- (void)_setCachedVariantWeight:()Variant_Private
{
}

@end