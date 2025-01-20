@interface VGHRTFFaceFrameData
- (IOSurface)depthImage;
- (IOSurface)rgbImage;
- (NSArray)landmarks;
- (__n128)depthIntrinsics;
- (__n128)setDepthIntrinsics:(__n128)a3;
- (id)initEmpty;
- (void)setDepthImage:(id)a3;
- (void)setLandmarks:(id)a3;
- (void)setRgbImage:(id)a3;
@end

@implementation VGHRTFFaceFrameData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFFaceFrameData;
  v2 = [(VGHRTFFaceFrameData *)&v6 init];
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

- (__n128)depthIntrinsics
{
  return a1[2];
}

- (__n128)setDepthIntrinsics:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

- (NSArray)landmarks
{
  return self->_landmarks;
}

- (void)setLandmarks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landmarks, 0);
  objc_storeStrong((id *)&self->_depthImage, 0);

  objc_storeStrong((id *)&self->_rgbImage, 0);
}

@end