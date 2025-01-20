@interface PDMatchedDepthAndImage
- (NSArray)originalPointClouds;
- (PDTimestampedImage)image;
- (PDTimestampedPointCloud)pointCloud;
- (void)setImage:(id)a3;
- (void)setOriginalPointClouds:(id)a3;
- (void)setPointCloud:(id)a3;
@end

@implementation PDMatchedDepthAndImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPointClouds, 0);
  objc_storeStrong((id *)&self->_pointCloud, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setOriginalPointClouds:(id)a3
{
}

- (NSArray)originalPointClouds
{
  return self->_originalPointClouds;
}

- (void)setPointCloud:(id)a3
{
}

- (PDTimestampedPointCloud)pointCloud
{
  return self->_pointCloud;
}

- (void)setImage:(id)a3
{
}

- (PDTimestampedImage)image
{
  return self->_image;
}

@end