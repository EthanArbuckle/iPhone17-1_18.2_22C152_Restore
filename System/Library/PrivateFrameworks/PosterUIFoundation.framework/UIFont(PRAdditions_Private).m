@interface UIFont(PRAdditions_Private)
- (id)pui_cachedVariantWeight;
- (void)pui_setCachedVariantWeight:()PRAdditions_Private;
@end

@implementation UIFont(PRAdditions_Private)

- (id)pui_cachedVariantWeight
{
  return objc_getAssociatedObject(a1, &PUICachedVariantWeightAssociationKey);
}

- (void)pui_setCachedVariantWeight:()PRAdditions_Private
{
}

@end