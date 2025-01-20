@interface beam_bridge_2022_v2_1Input
- (BOOL)setImage_PlaceholderWithCGImage:(CGImage *)a3 error:(id *)a4;
- (BOOL)setImage_PlaceholderWithURL:(id)a3 error:(id *)a4;
- (NSSet)featureNames;
- (__CVBuffer)image_Placeholder;
- (beam_bridge_2022_v2_1Input)initWithImage_Placeholder:(__CVBuffer *)a3;
- (beam_bridge_2022_v2_1Input)initWithImage_PlaceholderAtURL:(id)a3 error:(id *)a4;
- (beam_bridge_2022_v2_1Input)initWithImage_PlaceholderFromCGImage:(CGImage *)a3 error:(id *)a4;
- (id)featureValueForName:(id)a3;
- (void)dealloc;
- (void)setImage_Placeholder:(__CVBuffer *)a3;
@end

@implementation beam_bridge_2022_v2_1Input

- (beam_bridge_2022_v2_1Input)initWithImage_Placeholder:(__CVBuffer *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)beam_bridge_2022_v2_1Input;
  v4 = [(beam_bridge_2022_v2_1Input *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_image_Placeholder = a3;
    CVPixelBufferRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_image_Placeholder);
  v3.receiver = self;
  v3.super_class = (Class)beam_bridge_2022_v2_1Input;
  [(beam_bridge_2022_v2_1Input *)&v3 dealloc];
}

- (beam_bridge_2022_v2_1Input)initWithImage_PlaceholderFromCGImage:(CGImage *)a3 error:(id *)a4
{
  if (!self) {
    return 0;
  }
  v6 = self;
  id v12 = 0;
  v8 = +[MLFeatureValue featureValueWithCGImage:a3 pixelsWide:256 pixelsHigh:256 pixelFormatType:32 options:0 error:&v12];
  id v9 = v12;
  if (v8)
  {
    v6 = -[beam_bridge_2022_v2_1Input initWithImage_Placeholder:](v6, "initWithImage_Placeholder:", [v8 imageBufferValue]);
    v10 = v6;
  }
  else
  {
    v10 = 0;
  }

  if (a4) {
    *a4 = v9;
  }

  return v10;
}

- (beam_bridge_2022_v2_1Input)initWithImage_PlaceholderAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self)
  {
    id v12 = 0;
    v8 = +[MLFeatureValue featureValueWithImageAtURL:v6 pixelsWide:256 pixelsHigh:256 pixelFormatType:32 options:0 error:&v12];
    id v9 = v12;
    if (v8)
    {
      self = -[beam_bridge_2022_v2_1Input initWithImage_Placeholder:](self, "initWithImage_Placeholder:", [v8 imageBufferValue]);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)setImage_PlaceholderWithCGImage:(CGImage *)a3 error:(id *)a4
{
  id v11 = 0;
  v8 = +[MLFeatureValue featureValueWithCGImage:a3 pixelsWide:256 pixelsHigh:256 pixelFormatType:32 options:0 error:&v11];
  id v9 = v11;
  if (v8)
  {
    CVPixelBufferRelease([(beam_bridge_2022_v2_1Input *)self image_Placeholder]);
    -[beam_bridge_2022_v2_1Input setImage_Placeholder:](self, "setImage_Placeholder:", [v8 imageBufferValue]);
    CVPixelBufferRetain([(beam_bridge_2022_v2_1Input *)self image_Placeholder]);
  }

  if (a4) {
    *a4 = v9;
  }

  return v8 != 0;
}

- (BOOL)setImage_PlaceholderWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  v8 = +[MLFeatureValue featureValueWithImageAtURL:v6 pixelsWide:256 pixelsHigh:256 pixelFormatType:32 options:0 error:&v11];
  id v9 = v11;
  if (v8)
  {
    CVPixelBufferRelease([(beam_bridge_2022_v2_1Input *)self image_Placeholder]);
    -[beam_bridge_2022_v2_1Input setImage_Placeholder:](self, "setImage_Placeholder:", [v8 imageBufferValue]);
    CVPixelBufferRetain([(beam_bridge_2022_v2_1Input *)self image_Placeholder]);
  }

  if (a4) {
    *a4 = v9;
  }

  return v8 != 0;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10025BDA0];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"image_Placeholder"])
  {
    v4 = +[MLFeatureValue featureValueWithPixelBuffer:[(beam_bridge_2022_v2_1Input *)self image_Placeholder]];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (__CVBuffer)image_Placeholder
{
  return self->_image_Placeholder;
}

- (void)setImage_Placeholder:(__CVBuffer *)a3
{
  self->_image_Placeholder = a3;
}

@end