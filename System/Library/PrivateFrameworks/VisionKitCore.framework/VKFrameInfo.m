@interface VKFrameInfo
- (CGAffineTransform)imageToLayerTransform;
- (CGAffineTransform)visionToCroppedImageTransform;
- (CGAffineTransform)visionToLayerTransform;
- (CGRect)regionOfInterest;
- (CGSize)dimensions;
- (double)luminosity;
- (unint64_t)sceneStability;
- (void)setDimensions:(CGSize)a3;
- (void)setImageToLayerTransform:(CGAffineTransform *)a3;
- (void)setLuminosity:(double)a3;
- (void)setRegionOfInterest:(CGRect)a3;
- (void)setSceneStability:(unint64_t)a3;
- (void)setVisionToCroppedImageTransform:(CGAffineTransform *)a3;
- (void)setVisionToLayerTransform:(CGAffineTransform *)a3;
@end

@implementation VKFrameInfo

- (unint64_t)sceneStability
{
  return self->_sceneStability;
}

- (void)setSceneStability:(unint64_t)a3
{
  self->_sceneStability = a3;
}

- (double)luminosity
{
  return self->_luminosity;
}

- (void)setLuminosity:(double)a3
{
  self->_luminosity = a3;
}

- (CGSize)dimensions
{
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDimensions:(CGSize)a3
{
  self->_dimensions = a3;
}

- (CGRect)regionOfInterest
{
  double x = self->_regionOfInterest.origin.x;
  double y = self->_regionOfInterest.origin.y;
  double width = self->_regionOfInterest.size.width;
  double height = self->_regionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRegionOfInterest:(CGRect)a3
{
  self->_regionOfInterest = a3;
}

- (CGAffineTransform)visionToLayerTransform
{
  long long v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].b;
  return self;
}

- (void)setVisionToLayerTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_visionToLayerTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_visionToLayerTransform.c = v4;
  *(_OWORD *)&self->_visionToLayerTransform.a = v3;
}

- (CGAffineTransform)visionToCroppedImageTransform
{
  long long v3 = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].b;
  return self;
}

- (void)setVisionToCroppedImageTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_visionToCroppedImageTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_visionToCroppedImageTransform.c = v4;
  *(_OWORD *)&self->_visionToCroppedImageTransform.a = v3;
}

- (CGAffineTransform)imageToLayerTransform
{
  long long v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].b;
  return self;
}

- (void)setImageToLayerTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_imageToLayerTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_imageToLayerTransform.c = v4;
  *(_OWORD *)&self->_imageToLayerTransform.a = v3;
}

@end