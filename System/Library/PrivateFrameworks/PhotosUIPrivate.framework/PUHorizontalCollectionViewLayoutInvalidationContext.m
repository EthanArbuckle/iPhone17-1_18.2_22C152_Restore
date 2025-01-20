@interface PUHorizontalCollectionViewLayoutInvalidationContext
- (BOOL)invalidateCachedLayout;
- (void)_setInvalidateCachedLayout:(BOOL)a3;
@end

@implementation PUHorizontalCollectionViewLayoutInvalidationContext

- (void)_setInvalidateCachedLayout:(BOOL)a3
{
  self->_invalidateCachedLayout = a3;
}

- (BOOL)invalidateCachedLayout
{
  return self->_invalidateCachedLayout;
}

@end