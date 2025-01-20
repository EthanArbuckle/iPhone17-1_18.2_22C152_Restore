@interface PXOverlayFeedLayoutMetrics
- (BOOL)useSimpleLayout;
- (CGSize)interItemSpacing;
- (UIEdgeInsets)contentInsets;
- (double)firstRowTopMargin;
- (double)largeItemAspectRatio;
- (double)regularItemAspectRatio;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setFirstRowTopMargin:(double)a3;
- (void)setInterItemSpacing:(CGSize)a3;
- (void)setLargeItemAspectRatio:(double)a3;
- (void)setRegularItemAspectRatio:(double)a3;
- (void)setUseSimpleLayout:(BOOL)a3;
@end

@implementation PXOverlayFeedLayoutMetrics

- (void)setUseSimpleLayout:(BOOL)a3
{
  self->_useSimpleLayout = a3;
}

- (BOOL)useSimpleLayout
{
  return self->_useSimpleLayout;
}

- (void)setLargeItemAspectRatio:(double)a3
{
  self->_largeItemAspectRatio = a3;
}

- (double)largeItemAspectRatio
{
  return self->_largeItemAspectRatio;
}

- (void)setRegularItemAspectRatio:(double)a3
{
  self->_regularItemAspectRatio = a3;
}

- (double)regularItemAspectRatio
{
  return self->_regularItemAspectRatio;
}

- (void)setFirstRowTopMargin:(double)a3
{
  self->_firstRowTopMargin = a3;
}

- (double)firstRowTopMargin
{
  return self->_firstRowTopMargin;
}

- (void)setInterItemSpacing:(CGSize)a3
{
  self->_interItemSpacing = a3;
}

- (CGSize)interItemSpacing
{
  double width = self->_interItemSpacing.width;
  double height = self->_interItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXOverlayFeedLayoutMetrics;
  id result = [(PXLayoutMetrics *)&v6 copyWithZone:a3];
  long long v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)((char *)result + 88) = v5;
  *(CGSize *)((char *)result + 56) = self->_interItemSpacing;
  *((void *)result + 4) = *(void *)&self->_firstRowTopMargin;
  *((void *)result + 5) = *(void *)&self->_regularItemAspectRatio;
  *((void *)result + 6) = *(void *)&self->_largeItemAspectRatio;
  *((unsigned char *)result + 24) = self->_useSimpleLayout;
  return result;
}

@end