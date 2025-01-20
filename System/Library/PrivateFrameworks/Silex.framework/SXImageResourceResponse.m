@interface SXImageResourceResponse
- (UIImage)image;
- (unint64_t)imageQuality;
- (void)setImage:(id)a3;
- (void)setImageQuality:(unint64_t)a3;
@end

@implementation SXImageResourceResponse

- (unint64_t)imageQuality
{
  return self->_imageQuality;
}

- (void)setImageQuality:(unint64_t)a3
{
  self->_imageQuality = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end