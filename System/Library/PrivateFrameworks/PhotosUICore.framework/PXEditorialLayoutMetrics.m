@interface PXEditorialLayoutMetrics
- (BOOL)useNewImplementation;
- (BOOL)useSaliency;
- (PXEditorialLayoutMetrics)init;
- (UIEdgeInsets)padding;
- (double)headerHeight;
- (double)interTileSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)lowerItemCountThreshold;
- (unint64_t)numberOfColumns;
- (void)setHeaderHeight:(double)a3;
- (void)setInterTileSpacing:(double)a3;
- (void)setLowerItemCountThreshold:(unint64_t)a3;
- (void)setNumberOfColumns:(unint64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setUseNewImplementation:(BOOL)a3;
- (void)setUseSaliency:(BOOL)a3;
@end

@implementation PXEditorialLayoutMetrics

- (void)setUseNewImplementation:(BOOL)a3
{
  self->_useNewImplementation = a3;
}

- (BOOL)useNewImplementation
{
  return self->_useNewImplementation;
}

- (void)setUseSaliency:(BOOL)a3
{
  self->_useSaliency = a3;
}

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (void)setLowerItemCountThreshold:(unint64_t)a3
{
  self->_lowerItemCountThreshold = a3;
}

- (unint64_t)lowerItemCountThreshold
{
  return self->_lowerItemCountThreshold;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)headerHeight
{
  return self->_headerHeight;
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

- (void)setInterTileSpacing:(double)a3
{
  self->_interTileSpacing = a3;
}

- (double)interTileSpacing
{
  return self->_interTileSpacing;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXEditorialLayoutMetrics;
  id result = [(PXLayoutMetrics *)&v6 copyWithZone:a3];
  *((void *)result + 4) = self->_numberOfColumns;
  *((void *)result + 5) = *(void *)&self->_interTileSpacing;
  *((void *)result + 6) = *(void *)&self->_headerHeight;
  long long v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)result + 4) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)result + 5) = v5;
  *((void *)result + 7) = self->_lowerItemCountThreshold;
  *((unsigned char *)result + 24) = self->_useSaliency;
  *((unsigned char *)result + 25) = self->_useNewImplementation;
  return result;
}

- (PXEditorialLayoutMetrics)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXEditorialLayoutMetrics;
  id result = [(PXEditorialLayoutMetrics *)&v4 init];
  if (result)
  {
    result->_numberOfColumns = 3;
    result->_interTileSpacing = 2.0;
    result->_headerHeight = 0.0;
    long long v3 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)&result->_padding.double top = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)&result->_padding.double bottom = v3;
    result->_lowerItemCountThreshold = 6;
  }
  return result;
}

@end