@interface NSObject(PXReusableObject)
- (id)_px_reuseIdentifier;
- (void)_px_setReuseIdentifier:()PXReusableObject;
@end

@implementation NSObject(PXReusableObject)

- (id)_px_reuseIdentifier
{
  return objc_getAssociatedObject(a1, (const void *)PXReuseIdentifierAssociationKey);
}

- (void)_px_setReuseIdentifier:()PXReusableObject
{
}

@end