@interface PLVideoEditSource
- (NSURL)videoURL;
- (PLVideoEditSource)initWithVideoURL:(id)a3;
@end

@implementation PLVideoEditSource

- (void).cxx_destruct
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (PLVideoEditSource)initWithVideoURL:(id)a3
{
  id v5 = a3;
  v6 = [getPIPhotoEditHelperClass_84181() videoSourceWithURL:v5];
  v10.receiver = self;
  v10.super_class = (Class)PLVideoEditSource;
  v7 = [(PLEditSource *)&v10 initWithResolvedSource:v6 mediaType:2];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_videoURL, a3);
  }

  return v8;
}

@end