@interface _SBDisplayItemSingleSizeGrid
- (CGSize)maxSize;
- (CGSize)minSize;
- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4;
- (CGSize)sizeAtIndexFromFullWidthForBounds:(unint64_t)a3;
- (_SBDisplayItemSingleSizeGrid)initWithSize:(CGSize)a3;
- (id)allHeights;
- (id)allWidths;
@end

@implementation _SBDisplayItemSingleSizeGrid

- (_SBDisplayItemSingleSizeGrid)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)_SBDisplayItemSingleSizeGrid;
  result = [(_SBDisplayItemSingleSizeGrid *)&v6 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }
  return result;
}

- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)minSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)maxSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)sizeAtIndexFromFullWidthForBounds:(unint64_t)a3
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)allWidths
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [NSNumber numberWithDouble:self->_size.width];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)allHeights
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [NSNumber numberWithDouble:self->_size.height];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end