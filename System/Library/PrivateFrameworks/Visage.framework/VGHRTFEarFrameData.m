@interface VGHRTFEarFrameData
- (IOSurface)depthImage;
- (IOSurface)rgbImage;
- (__n128)earBox;
- (id)initEmpty;
- (void)setDepthImage:(id)a3;
- (void)setEarBox:(VGHRTFEarFrameData *)self;
- (void)setRgbImage:(id)a3;
@end

@implementation VGHRTFEarFrameData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFEarFrameData;
  v2 = [(VGHRTFEarFrameData *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (IOSurface)rgbImage
{
  return self->_rgbImage;
}

- (void)setRgbImage:(id)a3
{
}

- (IOSurface)depthImage
{
  return self->_depthImage;
}

- (void)setDepthImage:(id)a3
{
}

- (__n128)earBox
{
  return a1[2];
}

- (void)setEarBox:(VGHRTFEarFrameData *)self
{
  *(_OWORD *)self->_earBox = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthImage, 0);

  objc_storeStrong((id *)&self->_rgbImage, 0);
}

@end