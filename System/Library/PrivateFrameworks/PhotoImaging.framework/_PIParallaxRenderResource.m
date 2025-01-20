@interface _PIParallaxRenderResource
- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceThresholds;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceWeights;
- (CIImage)image;
- (CIRenderTask)task;
- (NSString)identifier;
- (NUImageHistogram)imageHistogram;
- (NUPurgeableStorage)destination;
- (PFParallaxColor)dominantColor;
- (PFParallaxColor)medianColor;
- (void)setDestination:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageHistogram:(id)a3;
- (void)setLuminanceThresholds:(id)a3;
- (void)setLuminanceWeights:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation _PIParallaxRenderResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHistogram, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setLuminanceThresholds:(id)a3
{
  self->_luminanceThresholds = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceThresholds
{
  float r = self->_luminanceThresholds.r;
  float g = self->_luminanceThresholds.g;
  float b = self->_luminanceThresholds.b;
  float a = self->_luminanceThresholds.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void)setLuminanceWeights:(id)a3
{
  self->_luminanceWeights = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceWeights
{
  float r = self->_luminanceWeights.r;
  float g = self->_luminanceWeights.g;
  float b = self->_luminanceWeights.b;
  float a = self->_luminanceWeights.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void)setImageHistogram:(id)a3
{
}

- (NUImageHistogram)imageHistogram
{
  return self->_imageHistogram;
}

- (void)setTask:(id)a3
{
}

- (CIRenderTask)task
{
  return self->_task;
}

- (void)setImage:(id)a3
{
}

- (CIImage)image
{
  return self->_image;
}

- (void)setDestination:(id)a3
{
}

- (NUPurgeableStorage)destination
{
  return self->_destination;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PFParallaxColor)dominantColor
{
  v2 = [(_PIParallaxRenderResource *)self imageHistogram];
  v3 = (void *)[v2 mutableCopy];

  [v3 smoothWithFunction:1 windowSize:13 sampleMode:0];
  v4 = [v3 red];
  [v4 mode];
  double v6 = v5;

  v7 = [v3 green];
  [v7 mode];
  double v9 = v8;

  v10 = [v3 blue];
  [v10 mode];
  double v12 = v11;

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithRed:v6 green:v9 blue:v12];
  return (PFParallaxColor *)v13;
}

- (PFParallaxColor)medianColor
{
  v3 = [(_PIParallaxRenderResource *)self imageHistogram];
  v4 = [v3 red];
  [v4 median];
  double v6 = v5;

  v7 = [(_PIParallaxRenderResource *)self imageHistogram];
  double v8 = [v7 green];
  [v8 median];
  double v10 = v9;

  double v11 = [(_PIParallaxRenderResource *)self imageHistogram];
  double v12 = [v11 blue];
  [v12 median];
  double v14 = v13;

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithRed:v6 green:v10 blue:v14];
  return (PFParallaxColor *)v15;
}

@end