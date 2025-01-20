@interface PXCuratedLibraryGridLayoutMetrics
- (PXCuratedLibraryGridLayoutMetrics)init;
- (UIEdgeInsets)padding;
- (double)headerAspectRatio;
- (double)interitemSpacing;
- (double)itemAspectRatio;
- (double)screenScale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfColumns;
- (int64_t)numberOfPrecedingAssets;
- (int64_t)style;
- (void)setHeaderAspectRatio:(double)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setItemAspectRatio:(double)a3;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setNumberOfPrecedingAssets:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setScreenScale:(double)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation PXCuratedLibraryGridLayoutMetrics

- (void)setNumberOfPrecedingAssets:(int64_t)a3
{
  self->_numberOfPrecedingAssets = a3;
}

- (int64_t)numberOfPrecedingAssets
{
  return self->_numberOfPrecedingAssets;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setHeaderAspectRatio:(double)a3
{
  self->_headerAspectRatio = a3;
}

- (double)headerAspectRatio
{
  return self->_headerAspectRatio;
}

- (void)setItemAspectRatio:(double)a3
{
  self->_itemAspectRatio = a3;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
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

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXCuratedLibraryGridLayoutMetrics;
  id result = [(PXLayoutMetrics *)&v6 copyWithZone:a3];
  *((void *)result + 3) = self->_numberOfColumns;
  long long v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)result + 5) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)result + 6) = v5;
  *((void *)result + 4) = *(void *)&self->_itemAspectRatio;
  *((void *)result + 9) = self->_numberOfPrecedingAssets;
  *((void *)result + 5) = *(void *)&self->_headerAspectRatio;
  *((void *)result + 6) = *(void *)&self->_screenScale;
  *((void *)result + 7) = *(void *)&self->_interitemSpacing;
  *((void *)result + 8) = self->_style;
  return result;
}

- (PXCuratedLibraryGridLayoutMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryGridLayoutMetrics;
  id result = [(PXCuratedLibraryGridLayoutMetrics *)&v3 init];
  if (result)
  {
    result->_numberOfColumns = 4;
    result->_itemAspectRatio = 1.0;
    result->_screenScale = 1.0;
    result->_interitemSpacing = 1.0;
    result->_headerAspectRatio = 1.0;
  }
  return result;
}

@end