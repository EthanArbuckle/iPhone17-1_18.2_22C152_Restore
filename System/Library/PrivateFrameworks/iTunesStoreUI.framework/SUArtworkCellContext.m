@interface SUArtworkCellContext
- (ISURLOperationPool)imagePool;
- (SUImageCache)imageCache;
- (SUImageDataProvider)imageProvider;
- (UIImage)placeholderImage;
- (void)dealloc;
- (void)setImageCache:(id)a3;
- (void)setImagePool:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setPlaceholderImage:(id)a3;
@end

@implementation SUArtworkCellContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUArtworkCellContext;
  [(SUArtworkCellContext *)&v3 dealloc];
}

- (SUImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (ISURLOperationPool)imagePool
{
  return self->_imagePool;
}

- (void)setImagePool:(id)a3
{
}

- (SUImageDataProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

@end