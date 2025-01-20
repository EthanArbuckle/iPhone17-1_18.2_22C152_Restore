@interface STSPayload
- (NSURL)imageURL;
- (NSURL)videoURL;
- (void)setImageURL:(id)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation STSPayload

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURL, 0);

  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end