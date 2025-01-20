@interface SXMosaicGalleryLayoutItem
- (CGSize)dimensions;
- (SXMosaicGalleryLayoutItem)initWithDimensions:(CGSize)a3;
- (double)aspectRatio;
- (id)description;
- (int)tileType;
@end

@implementation SXMosaicGalleryLayoutItem

- (SXMosaicGalleryLayoutItem)initWithDimensions:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SXMosaicGalleryLayoutItem;
  result = [(SXMosaicGalleryLayoutItem *)&v6 init];
  if (result)
  {
    result->_dimensions.CGFloat width = width;
    result->_dimensions.CGFloat height = height;
  }
  return result;
}

- (double)aspectRatio
{
  [(SXMosaicGalleryLayoutItem *)self dimensions];
  double v4 = v3;
  [(SXMosaicGalleryLayoutItem *)self dimensions];
  return v4 / v5;
}

- (int)tileType
{
  int result = self->_tileType;
  if (!result)
  {
    [(SXMosaicGalleryLayoutItem *)self aspectRatio];
    if (v4 >= 2.5)
    {
      int result = 4;
    }
    else if (v4 <= 1.05)
    {
      if (v4 >= 0.952380952) {
        int result = 1;
      }
      else {
        int result = 2;
      }
    }
    else
    {
      int result = 3;
    }
    self->_tileType = result;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Type: %i", -[SXMosaicGalleryLayoutItem tileType](self, "tileType"));
}

- (CGSize)dimensions
{
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end