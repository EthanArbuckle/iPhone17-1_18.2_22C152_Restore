@interface _PUImageRequesterResult
- (BOOL)imageIsFullQuality;
- (CGImage)gainMapImage;
- (CGSize)targetSize;
- (PUDisplayAsset)asset;
- (UIImage)image;
- (double)timeIntervalSinceRequest;
- (float)gainMapValue;
- (id)description;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setGainMapImage:(CGImage *)a3;
- (void)setGainMapValue:(float)a3;
- (void)setImage:(id)a3;
- (void)setImageIsFullQuality:(BOOL)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setTimeIntervalSinceRequest:(double)a3;
@end

@implementation _PUImageRequesterResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTimeIntervalSinceRequest:(double)a3
{
  self->_timeIntervalSinceRequest = a3;
}

- (double)timeIntervalSinceRequest
{
  return self->_timeIntervalSinceRequest;
}

- (void)setImageIsFullQuality:(BOOL)a3
{
  self->_imageIsFullQuality = a3;
}

- (BOOL)imageIsFullQuality
{
  return self->_imageIsFullQuality;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setGainMapValue:(float)a3
{
  self->_gainMapValue = a3;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (void)setAsset:(id)a3
{
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (id)description
{
  id v21 = [NSString alloc];
  v3 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v3);
  v22 = [(_PUImageRequesterResult *)self asset];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_PUImageRequesterResult *)self asset];
  v7 = [v6 uuid];
  [(_PUImageRequesterResult *)self targetSize];
  v8 = NSStringFromCGSize(v24);
  v9 = [(_PUImageRequesterResult *)self image];
  [v9 size];
  v10 = NSStringFromCGSize(v25);
  if ([(_PUImageRequesterResult *)self gainMapImage]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = v11;
  [(_PUImageRequesterResult *)self gainMapValue];
  double v14 = v13;
  if ([(_PUImageRequesterResult *)self imageIsFullQuality]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  v16 = v15;
  [(_PUImageRequesterResult *)self timeIntervalSinceRequest];
  v18 = (void *)[v21 initWithFormat:@"<%@ %p>:\n\tAsset: %@ %@\n\tTargetSize: %@\n\tImageSize: %@\n\tGainMapImage: %@\n\tGainMapValue: %f\n\tFullQuality: %@\n\tLatency: %.3f", v20, self, v5, v7, v8, v10, v12, *(void *)&v14, v16, v17];

  return v18;
}

- (void)dealloc
{
  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)_PUImageRequesterResult;
  [(_PUImageRequesterResult *)&v3 dealloc];
}

- (void)setGainMapImage:(CGImage *)a3
{
  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = CGImageRetain(a3);
  }
}

@end