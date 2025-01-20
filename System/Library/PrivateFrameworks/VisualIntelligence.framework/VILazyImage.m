@interface VILazyImage
- (BOOL)isLoaded;
- (CGSize)imageSize;
- (VILazyImage)initWithImageLoader:(id)a3;
- (VILazyImage)initWithImageLoader:(id)a3 imageSize:(CGSize)a4;
- (__CVBuffer)pixelBuffer;
- (id)_image;
- (unsigned)orientation;
- (void)_loadImageIfPossible;
- (void)dealloc;
@end

@implementation VILazyImage

- (VILazyImage)initWithImageLoader:(id)a3 imageSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VILazyImage;
  v8 = [(VILazyImage *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [v7 copy];
    id loader = v9->_loader;
    v9->_id loader = (id)v10;

    v9->_knownImageSize.CGFloat width = width;
    v9->_knownImageSize.CGFloat height = height;
  }

  return v9;
}

- (VILazyImage)initWithImageLoader:(id)a3
{
  return -[VILazyImage initWithImageLoader:imageSize:](self, "initWithImageLoader:imageSize:", a3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id loader = self->_loader;
  self->_id loader = 0;

  image = self->_image;
  self->_image = 0;

  os_unfair_lock_unlock(p_lock);
  v6.receiver = self;
  v6.super_class = (Class)VILazyImage;
  [(VILazyImage *)&v6 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  v2 = [(VILazyImage *)self _image];
  v3 = (__CVBuffer *)[v2 pixelBuffer];

  return v3;
}

- (unsigned)orientation
{
  v2 = [(VILazyImage *)self _image];
  unsigned int v3 = [v2 orientation];

  return v3;
}

- (BOOL)isLoaded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_image != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (CGSize)imageSize
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double width = self->_knownImageSize.width;
  double height = self->_knownImageSize.height;
  BOOL v6 = width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v6 || self->_image)
  {
    [(VILazyImage *)self _loadImageIfPossible];
    [(VIImage *)self->_image imageSize];
    double width = v7;
    double height = v8;
  }
  os_unfair_lock_unlock(p_lock);
  double v9 = width;
  double v10 = height;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (id)_image
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(VILazyImage *)self _loadImageIfPossible];
  v4 = self->_image;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_loadImageIfPossible
{
  if (!self->_image)
  {
    id loader = (void (**)(id, SEL))self->_loader;
    if (loader)
    {
      loader[2](loader, a2);
      v4 = (VIImage *)objc_claimAutoreleasedReturnValue();
      image = self->_image;
      self->_image = v4;

      id v6 = self->_loader;
      self->_id loader = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loader, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end