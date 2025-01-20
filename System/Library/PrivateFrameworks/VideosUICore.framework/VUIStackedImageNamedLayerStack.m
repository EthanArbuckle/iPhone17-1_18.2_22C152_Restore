@interface VUIStackedImageNamedLayerStack
- (BOOL)flatImageContainsCornerRadius;
- (CGImage)flattenedImage;
- (CGSize)radiosityImageScale;
- (CGSize)size;
- (NSArray)layers;
- (NSString)name;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)radiosityImage;
- (void)dealloc;
- (void)setFlatImageContainsCornerRadius:(BOOL)a3;
- (void)setFlattenedImage:(CGImage *)a3;
- (void)setLayers:(id)a3;
- (void)setName:(id)a3;
- (void)setRadiosityImage:(id)a3;
- (void)setRadiosityImageScale:(CGSize)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation VUIStackedImageNamedLayerStack

- (void)dealloc
{
  flattenedImage = self->_flattenedImage;
  if (flattenedImage) {
    CFRelease(flattenedImage);
  }
  v4.receiver = self;
  v4.super_class = (Class)VUIStackedImageNamedLayerStack;
  [(VUIStackedImageNamedLayerStack *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_name copy];
    v6 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v5;

    uint64_t v7 = [(NSArray *)self->_layers copy];
    v8 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v7;

    *(CGSize *)(v4 + 56) = self->_size;
    *(double *)(v4 + 40) = self->_scale;
    *(void *)(v4 + 8) = self->_flattenedImage;
    uint64_t v9 = [self->_radiosityImage copy];
    v10 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v9;

    *(CGSize *)(v4 + 72) = self->_radiosityImageScale;
    *(unsigned char *)(v4 + 16) = self->_flatImageContainsCornerRadius;
  }
  return (id)v4;
}

- (CGImage)flattenedImage
{
  return self->_flattenedImage;
}

- (void)setFlattenedImage:(CGImage *)a3
{
  flattenedImage = self->_flattenedImage;
  if (flattenedImage != a3)
  {
    if (flattenedImage)
    {
      CFRelease(flattenedImage);
      self->_flattenedImage = 0;
    }
    if (a3) {
      self->_flattenedImage = CGImageRetain(a3);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (id)radiosityImage
{
  return self->_radiosityImage;
}

- (void)setRadiosityImage:(id)a3
{
}

- (CGSize)radiosityImageScale
{
  double width = self->_radiosityImageScale.width;
  double height = self->_radiosityImageScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRadiosityImageScale:(CGSize)a3
{
  self->_radiosityImageScale = a3;
}

- (BOOL)flatImageContainsCornerRadius
{
  return self->_flatImageContainsCornerRadius;
}

- (void)setFlatImageContainsCornerRadius:(BOOL)a3
{
  self->_flatImageContainsCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_radiosityImage, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end