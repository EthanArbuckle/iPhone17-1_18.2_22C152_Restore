@interface UICollectionViewFlowLayoutInvalidationContext
- (BOOL)invalidateFlowLayoutAttributes;
- (BOOL)invalidateFlowLayoutDelegateMetrics;
- (UICollectionViewFlowLayoutInvalidationContext)init;
- (void)setInvalidateFlowLayoutAttributes:(BOOL)invalidateFlowLayoutAttributes;
- (void)setInvalidateFlowLayoutDelegateMetrics:(BOOL)invalidateFlowLayoutDelegateMetrics;
@end

@implementation UICollectionViewFlowLayoutInvalidationContext

- (BOOL)invalidateFlowLayoutDelegateMetrics
{
  return *(unsigned char *)&self->_flowLayoutInvalidationFlags & 1;
}

- (BOOL)invalidateFlowLayoutAttributes
{
  return (*(unsigned char *)&self->_flowLayoutInvalidationFlags >> 1) & 1;
}

- (UICollectionViewFlowLayoutInvalidationContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewFlowLayoutInvalidationContext;
  result = [(UICollectionViewFlowLayoutInvalidationContext *)&v3 init];
  if (result) {
    *(unsigned char *)&result->_flowLayoutInvalidationFlags |= 3u;
  }
  return result;
}

- (void)setInvalidateFlowLayoutAttributes:(BOOL)invalidateFlowLayoutAttributes
{
  if (invalidateFlowLayoutAttributes) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flowLayoutInvalidationFlags = *(unsigned char *)&self->_flowLayoutInvalidationFlags & 0xFD | v3;
}

- (void)setInvalidateFlowLayoutDelegateMetrics:(BOOL)invalidateFlowLayoutDelegateMetrics
{
  *(unsigned char *)&self->_flowLayoutInvalidationFlags = *(unsigned char *)&self->_flowLayoutInvalidationFlags & 0xFE | invalidateFlowLayoutDelegateMetrics;
}

@end