@interface UICollectionViewTableLayoutInvalidationContext
- (BOOL)invalidateTableLayoutDelegateMetrics;
- (BOOL)skipSectionInvalidation;
- (void)setInvalidateTableLayoutDelegateMetrics:(BOOL)a3;
- (void)setSkipSectionInvalidation:(BOOL)a3;
@end

@implementation UICollectionViewTableLayoutInvalidationContext

- (BOOL)invalidateTableLayoutDelegateMetrics
{
  return self->_invalidateTableLayoutDelegateMetrics;
}

- (void)setInvalidateTableLayoutDelegateMetrics:(BOOL)a3
{
  self->_invalidateTableLayoutDelegateMetrics = a3;
}

- (BOOL)skipSectionInvalidation
{
  return self->_skipSectionInvalidation;
}

- (void)setSkipSectionInvalidation:(BOOL)a3
{
  self->_skipSectionInvalidation = a3;
}

@end