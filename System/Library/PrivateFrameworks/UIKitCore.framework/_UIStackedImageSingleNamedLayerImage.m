@interface _UIStackedImageSingleNamedLayerImage
- (CGRect)frame;
- (NSString)name;
- (UIImage)imageObj;
- (double)opacity;
- (int)blendMode;
- (void)setImageObj:(id)a3;
@end

@implementation _UIStackedImageSingleNamedLayerImage

- (NSString)name
{
  return (NSString *)@"single image";
}

- (CGRect)frame
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v4 = [(_UIStackedImageSingleNamedLayerImage *)self imageObj];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = v2;
  double v10 = v3;
  double v11 = v6;
  double v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)opacity
{
  return 1.0;
}

- (int)blendMode
{
  return 0;
}

- (UIImage)imageObj
{
  return self->_imageObj;
}

- (void)setImageObj:(id)a3
{
}

- (void).cxx_destruct
{
}

@end