@interface _UGCPhotoCarouselViewModel
- (NSString)identifier;
- (NSURL)imageURL;
- (NSURL)url;
- (UIImage)image;
- (double)timeoutInterval;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageURL:(id)a3;
@end

@implementation _UGCPhotoCarouselViewModel

- (NSURL)url
{
  return [(_UGCPhotoCarouselViewModel *)self imageURL];
}

- (double)timeoutInterval
{
  return 30.0;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end