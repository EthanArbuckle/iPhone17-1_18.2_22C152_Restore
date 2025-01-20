@interface VUIImageLoadParamsOperation
- (BOOL)cropToFit;
- (CGSize)scaleToSize;
- (NSError)error;
- (TVImage)image;
- (VUIImageLoadParams)params;
- (VUIImageLoadParamsOperation)init;
- (VUIImageLoadParamsOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (unint64_t)scalingResult;
- (void)setCropToFit:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setImage:(id)a3;
- (void)setParams:(id)a3;
- (void)setScaleToSize:(CGSize)a3;
- (void)setScalingResult:(unint64_t)a3;
@end

@implementation VUIImageLoadParamsOperation

- (VUIImageLoadParamsOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIImageLoadParamsOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The cropToFit parameter cannot be set to YES when no scale size is given"];
  }
  v16.receiver = self;
  v16.super_class = (Class)VUIImageLoadParamsOperation;
  v13 = [(VUIImageLoadParamsOperation *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_params, a3);
    v14->_scaleToSize.double width = width;
    v14->_scaleToSize.double height = height;
    v14->_cropToFit = v5;
  }

  return v14;
}

- (CGSize)scaleToSize
{
  double width = self->_scaleToSize.width;
  double height = self->_scaleToSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScaleToSize:(CGSize)a3
{
  self->_scaleToSize = a3;
}

- (BOOL)cropToFit
{
  return self->_cropToFit;
}

- (void)setCropToFit:(BOOL)a3
{
  self->_cropToFit = a3;
}

- (TVImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (unint64_t)scalingResult
{
  return self->_scalingResult;
}

- (void)setScalingResult:(unint64_t)a3
{
  self->_scalingResult = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (VUIImageLoadParams)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end