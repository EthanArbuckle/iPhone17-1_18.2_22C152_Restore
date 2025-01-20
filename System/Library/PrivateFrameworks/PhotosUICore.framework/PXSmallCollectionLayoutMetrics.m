@interface PXSmallCollectionLayoutMetrics
- (UIEdgeInsets)padding;
- (UIEdgeInsets)safeAreaInsets;
- (double)headerAspectRatio;
- (double)interitemSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)edgesForExtendedLayout;
- (unint64_t)style;
- (void)setEdgesForExtendedLayout:(unint64_t)a3;
- (void)setHeaderAspectRatio:(double)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation PXSmallCollectionLayoutMetrics

- (void)setHeaderAspectRatio:(double)a3
{
  self->_headerAspectRatio = a3;
}

- (double)headerAspectRatio
{
  return self->_headerAspectRatio;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgesForExtendedLayout:(unint64_t)a3
{
  self->_edgesForExtendedLayout = a3;
}

- (unint64_t)edgesForExtendedLayout
{
  return self->_edgesForExtendedLayout;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXSmallCollectionLayoutMetrics;
  id result = [(PXLayoutMetrics *)&v7 copyWithZone:a3];
  if (result)
  {
    *((void *)result + 3) = self->_style;
    *((void *)result + 4) = *(void *)&self->_interitemSpacing;
    long long v5 = *(_OWORD *)&self->_safeAreaInsets.bottom;
    *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_safeAreaInsets.top;
    *(_OWORD *)((char *)result + 72) = v5;
    *((void *)result + 5) = self->_edgesForExtendedLayout;
    long long v6 = *(_OWORD *)&self->_padding.bottom;
    *(_OWORD *)((char *)result + 88) = *(_OWORD *)&self->_padding.top;
    *(_OWORD *)((char *)result + 104) = v6;
    *((void *)result + 6) = *(void *)&self->_headerAspectRatio;
  }
  return result;
}

@end