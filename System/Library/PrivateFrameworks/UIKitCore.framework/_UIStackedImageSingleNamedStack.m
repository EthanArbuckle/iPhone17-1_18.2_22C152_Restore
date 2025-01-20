@interface _UIStackedImageSingleNamedStack
- (CGImage)flattenedImage;
- (CGSize)size;
- (NSArray)layers;
- (NSString)name;
- (_UIStackedImageSingleNamedLayerImage)layerImage;
- (double)scale;
- (void)setLayerImage:(id)a3;
@end

@implementation _UIStackedImageSingleNamedStack

- (NSString)name
{
  return (NSString *)@"single image stack";
}

- (NSArray)layers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(_UIStackedImageSingleNamedStack *)self layerImage];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (CGSize)size
{
  v2 = [(_UIStackedImageSingleNamedStack *)self layerImage];
  v3 = [v2 imageObj];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)scale
{
  return 1.0;
}

- (CGImage)flattenedImage
{
  v2 = [(_UIStackedImageSingleNamedStack *)self layerImage];
  id v3 = [v2 imageObj];
  double v4 = (CGImage *)[v3 CGImage];

  return v4;
}

- (_UIStackedImageSingleNamedLayerImage)layerImage
{
  return self->_layerImage;
}

- (void)setLayerImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end