@interface UIFont(PRAdditions_Private)
- (id)pr_cachedVariantWeight;
- (void)pr_setCachedVariantWeight:()PRAdditions_Private;
@end

@implementation UIFont(PRAdditions_Private)

- (id)pr_cachedVariantWeight
{
  return objc_getAssociatedObject(a1, &PRCachedVariantWeightAssociationKey);
}

- (void)pr_setCachedVariantWeight:()PRAdditions_Private
{
}

@end