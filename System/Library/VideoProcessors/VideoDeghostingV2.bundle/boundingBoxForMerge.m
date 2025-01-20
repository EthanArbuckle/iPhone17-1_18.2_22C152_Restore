@interface boundingBoxForMerge
- (CGRect)extendBBox;
- (int64_t)index2RoiArray;
- (void)setExtendBBox:(CGRect)a3;
- (void)setIndex2RoiArray:(int64_t)a3;
@end

@implementation boundingBoxForMerge

- (CGRect)extendBBox
{
  double x = self->_extendBBox.origin.x;
  double y = self->_extendBBox.origin.y;
  double width = self->_extendBBox.size.width;
  double height = self->_extendBBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setExtendBBox:(CGRect)a3
{
  self->_extendBBodouble x = a3;
}

- (int64_t)index2RoiArray
{
  return self->_index2RoiArray;
}

- (void)setIndex2RoiArray:(int64_t)a3
{
  self->_index2RoiArradouble y = a3;
}

@end