@interface UIColor(ICAccessibility_Private)
- (id)_icaxCachedApproximateColorDescription;
- (void)_icaxSetCachedApproximateColorDescription:()ICAccessibility_Private;
@end

@implementation UIColor(ICAccessibility_Private)

- (id)_icaxCachedApproximateColorDescription
{
  return objc_getAssociatedObject(a1, &cachedColorDescriptionKey);
}

- (void)_icaxSetCachedApproximateColorDescription:()ICAccessibility_Private
{
}

@end