@interface PXGridLayoutMetrics
- (BOOL)displaysHeaderTile;
- (CGSize)footerSize;
- (CGSize)headerSize;
- (CGSize)headerSpacing;
- (CGSize)interItemSpacing;
- (CGSize)itemSize;
- (UIEdgeInsets)contentInsets;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)axis;
- (unint64_t)additionalTileCount;
- (void)setAdditionalTileCount:(unint64_t)a3;
- (void)setAxis:(int64_t)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDisplaysHeaderTile:(BOOL)a3;
- (void)setFooterSize:(CGSize)a3;
- (void)setHeaderSize:(CGSize)a3;
- (void)setHeaderSpacing:(CGSize)a3;
- (void)setInterItemSpacing:(CGSize)a3;
- (void)setItemSize:(CGSize)a3;
@end

@implementation PXGridLayoutMetrics

- (void)setAdditionalTileCount:(unint64_t)a3
{
  self->_additionalTileCount = a3;
}

- (unint64_t)additionalTileCount
{
  return self->_additionalTileCount;
}

- (void)setFooterSize:(CGSize)a3
{
  self->_footerSize = a3;
}

- (CGSize)footerSize
{
  double width = self->_footerSize.width;
  double height = self->_footerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHeaderSpacing:(CGSize)a3
{
  self->_headerSpacing = a3;
}

- (CGSize)headerSpacing
{
  double width = self->_headerSpacing.width;
  double height = self->_headerSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHeaderSize:(CGSize)a3
{
  self->_headerSize = a3;
}

- (CGSize)headerSize
{
  double width = self->_headerSize.width;
  double height = self->_headerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDisplaysHeaderTile:(BOOL)a3
{
  self->_displaysHeaderTile = a3;
}

- (BOOL)displaysHeaderTile
{
  return self->_displaysHeaderTile;
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

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (int64_t)axis
{
  return self->_axis;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXGridLayoutMetrics;
  id result = [(PXLayoutMetrics *)&v6 copyWithZone:a3];
  *((void *)result + 4) = self->_axis;
  *((_OWORD *)result + 3) = self->_itemSize;
  *((_OWORD *)result + 7) = self->_footerSize;
  *((unsigned char *)result + 24) = self->_displaysHeaderTile;
  *((_OWORD *)result + 5) = self->_headerSize;
  *((_OWORD *)result + 6) = self->_headerSpacing;
  long long v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *((_OWORD *)result + 8) = *(_OWORD *)&self->_contentInsets.top;
  *((_OWORD *)result + 9) = v5;
  *((_OWORD *)result + 4) = self->_interItemSpacing;
  *((void *)result + 5) = self->_additionalTileCount;
  return result;
}

@end