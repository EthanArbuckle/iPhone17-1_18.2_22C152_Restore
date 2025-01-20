@interface _NTKNewPhoto
- (CGRect)crop;
- (PHAsset)asset;
- (unint64_t)subsampleFactor;
- (void)setAsset:(id)a3;
- (void)setCrop:(CGRect)a3;
- (void)setSubsampleFactor:(unint64_t)a3;
@end

@implementation _NTKNewPhoto

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (CGRect)crop
{
  double x = self->_crop.origin.x;
  double y = self->_crop.origin.y;
  double width = self->_crop.size.width;
  double height = self->_crop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCrop:(CGRect)a3
{
  self->_crop = a3;
}

- (unint64_t)subsampleFactor
{
  return self->_subsampleFactor;
}

- (void)setSubsampleFactor:(unint64_t)a3
{
  self->_subsampleFactor = a3;
}

- (void).cxx_destruct
{
}

@end