@interface _PreloadedImageResult
- (BOOL)imageIsFullQuality;
- (CGImage)gainMapImage;
- (CGSize)targetSize;
- (PUDisplayAsset)asset;
- (UIImage)image;
- (_PreloadedImageResult)initWithPreloadedImage:(id)a3;
- (double)timeIntervalSinceRequest;
- (float)gainMapValue;
- (id)description;
@end

@implementation _PreloadedImageResult

- (void).cxx_destruct
{
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)targetSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)timeIntervalSinceRequest
{
  return 0.0;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_PreloadedImageResult *)self image];
  v7 = (void *)[v3 initWithFormat:@"<%@ %p; image = %@>", v5, self, v6];

  return v7;
}

- (BOOL)imageIsFullQuality
{
  return 0;
}

- (float)gainMapValue
{
  return 0.0;
}

- (CGImage)gainMapImage
{
  return 0;
}

- (PUDisplayAsset)asset
{
  return 0;
}

- (_PreloadedImageResult)initWithPreloadedImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PreloadedImageResult;
  v6 = [(_PreloadedImageResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_image, a3);
  }

  return v7;
}

@end