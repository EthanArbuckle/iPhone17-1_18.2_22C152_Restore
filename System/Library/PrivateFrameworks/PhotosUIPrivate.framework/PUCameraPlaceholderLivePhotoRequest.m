@interface PUCameraPlaceholderLivePhotoRequest
- (BOOL)imageRequestFinished;
- (BOOL)videoRequestFinished;
- (NSError)error;
- (NSString)filterName;
- (NSURL)videoURL;
- (NSValue)stillDisplayTime;
- (PHAsset)asset;
- (PUCameraPlaceholderLivePhotoRequest)initWithAsset:(id)a3 resultHandler:(id)a4;
- (UIImage)image;
- (id)resultHandler;
- (void)setError:(id)a3;
- (void)setFilterName:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageRequestFinished:(BOOL)a3;
- (void)setStillDisplayTime:(id)a3;
- (void)setVideoRequestFinished:(BOOL)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation PUCameraPlaceholderLivePhotoRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_filterName, 0);
  objc_storeStrong((id *)&self->_stillDisplayTime, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setVideoRequestFinished:(BOOL)a3
{
  self->_videoRequestFinished = a3;
}

- (BOOL)videoRequestFinished
{
  return self->_videoRequestFinished;
}

- (void)setImageRequestFinished:(BOOL)a3
{
  self->_imageRequestFinished = a3;
}

- (BOOL)imageRequestFinished
{
  return self->_imageRequestFinished;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setFilterName:(id)a3
{
}

- (NSString)filterName
{
  return self->_filterName;
}

- (void)setStillDisplayTime:(id)a3
{
}

- (NSValue)stillDisplayTime
{
  return self->_stillDisplayTime;
}

- (void)setVideoURL:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (PUCameraPlaceholderLivePhotoRequest)initWithAsset:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUCameraPlaceholderLivePhotoRequest;
  v9 = [(PUCameraPlaceholderLivePhotoRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    uint64_t v11 = [v8 copy];
    id resultHandler = v10->_resultHandler;
    v10->_id resultHandler = (id)v11;
  }
  return v10;
}

@end