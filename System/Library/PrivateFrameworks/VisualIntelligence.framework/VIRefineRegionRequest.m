@interface VIRefineRegionRequest
- (CGRect)regionOfInterest;
- (MTLDevice)preferredMetalDevice;
- (VIImageContent)image;
- (VIRefineRegionRequest)initWithImage:(id)a3 regionOfInterest:(CGRect)a4 imageType:(int64_t)a5 preferredMetalDevice:(id)a6;
- (int64_t)imageType;
@end

@implementation VIRefineRegionRequest

- (VIRefineRegionRequest)initWithImage:(id)a3 regionOfInterest:(CGRect)a4 imageType:(int64_t)a5 preferredMetalDevice:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VIRefineRegionRequest;
  v16 = [(VIRefineRegionRequest *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_image, a3);
    v17->_regionOfInterest.origin.CGFloat x = x;
    v17->_regionOfInterest.origin.CGFloat y = y;
    v17->_regionOfInterest.size.CGFloat width = width;
    v17->_regionOfInterest.size.CGFloat height = height;
    v17->_imageType = a5;
    objc_storeStrong((id *)&v17->_preferredMetalDevice, a6);
  }

  return v17;
}

- (VIImageContent)image
{
  return self->_image;
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

- (int64_t)imageType
{
  return self->_imageType;
}

- (MTLDevice)preferredMetalDevice
{
  return self->_preferredMetalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end