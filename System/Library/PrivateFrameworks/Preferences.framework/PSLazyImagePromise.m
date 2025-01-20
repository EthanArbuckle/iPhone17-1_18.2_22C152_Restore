@interface PSLazyImagePromise
+ (id)imagePromiseWithImageNamed:(id)a3 inBundle:(id)a4;
+ (id)imagePromiseWithImagePath:(id)a3;
+ (id)imagePromiseWithLoadBlock:(id)a3;
- (BOOL)isImageLoaded;
- (UIImage)image;
- (void)loadImage;
@end

@implementation PSLazyImagePromise

+ (id)imagePromiseWithImagePath:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [v3 copy];

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (id)imagePromiseWithImageNamed:(id)a3 inBundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  uint64_t v8 = [v6 copy];

  v9 = (void *)v7[2];
  v7[2] = v8;

  v10 = (void *)v7[3];
  v7[3] = v5;

  return v7;
}

+ (id)imagePromiseWithLoadBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [v3 copy];

  id v6 = (void *)v4[4];
  v4[4] = v5;

  return v4;
}

- (void)loadImage
{
  if (!self->_imageLoaded)
  {
    loadBlock = (void (**)(id, SEL))self->_loadBlock;
    if (loadBlock)
    {
      loadBlock[2](loadBlock, a2);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      image = self->_image;
      self->_image = v4;
    }
    if (!self->_image)
    {
      if (!self->_imagePath
        || (id v6 = (UIImage *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithContentsOfFile:self->_imagePath],
            v7 = self->_image,
            self->_image = v6,
            v7,
            !self->_image))
      {
        imageName = self->_imageName;
        if (imageName)
        {
          imageBundle = self->_imageBundle;
          v10 = (void *)MEMORY[0x1E4F42A80];
          if (imageBundle)
          {
            v11 = [MEMORY[0x1E4F42D90] mainScreen];
            v12 = [v11 traitCollection];
            v13 = [v10 imageNamed:imageName inBundle:imageBundle compatibleWithTraitCollection:v12];
            v14 = self->_image;
            self->_image = v13;
          }
          else
          {
            v15 = [MEMORY[0x1E4F42A80] imageNamed:self->_imageName];
            v11 = self->_image;
            self->_image = v15;
          }
        }
      }
    }
    self->_imageLoaded = 1;
  }
}

- (UIImage)image
{
  if (!self->_imageLoaded) {
    [(PSLazyImagePromise *)self loadImage];
  }
  image = self->_image;
  return image;
}

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_loadBlock, 0);
  objc_storeStrong((id *)&self->_imageBundle, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
}

@end