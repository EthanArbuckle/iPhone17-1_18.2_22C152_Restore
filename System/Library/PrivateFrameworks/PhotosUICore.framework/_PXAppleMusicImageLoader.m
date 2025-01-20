@interface _PXAppleMusicImageLoader
- (CGImage)image;
- (CGSize)targetSize;
- (NSError)error;
- (PXAppleMusicArtworkAsset)asset;
- (_PXAppleMusicImageLoader)init;
- (_PXAppleMusicImageLoader)initWithAsset:(id)a3 targetSize:(CGSize)a4;
- (void)_beginDownloadFromURL:(id)a3;
- (void)_handleRequestData:(id)a3 response:(id)a4 error:(id)a5;
- (void)_handleURLFetchFailureWithError:(id)a3;
- (void)dealloc;
- (void)startWithCompletion:(id)a3;
@end

@implementation _PXAppleMusicImageLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

- (NSError)error
{
  return self->_error;
}

- (CGImage)image
{
  return self->_image;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXAppleMusicArtworkAsset)asset
{
  return self->_asset;
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)_PXAppleMusicImageLoader;
  [(_PXAppleMusicImageLoader *)&v3 dealloc];
}

- (void)_handleURLFetchFailureWithError:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [NSString alloc];
  v6 = [(_PXAppleMusicImageLoader *)self asset];
  uint64_t v7 = [v5 initWithFormat:@"Failed to fetch artwork URL for Apple Music asset %@", v6];

  uint64_t v13 = *MEMORY[0x1E4F28228];
  v14[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v9 = v8;
  if (v4)
  {
    v10 = (void *)[v8 mutableCopy];
    [v10 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v11 = [v10 copy];

    v9 = (void *)v11;
  }
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PXAudioAssetImageProviderErrorDomain" code:1 userInfo:v9];
  px_dispatch_on_main_queue();
}

- (void)_handleRequestData:(id)a3 response:(id)a4 error:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    [(_PXAppleMusicImageLoader *)self targetSize];
    uint64_t v26 = *MEMORY[0x1E4F2FF08];
    v27[0] = MEMORY[0x1E4F1CC28];
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    CFDataRef v12 = (const __CFData *)v8;
    CFDictionaryRef v13 = [v11 dictionaryWithObjects:v27 forKeys:&v26 count:1];
    CGImageSourceRef v14 = CGImageSourceCreateWithData(v12, v13);

    if (v14) {
      PXCreateCGImageFromImageSourceWithMaxPixelSize();
    }
    id v15 = [NSString alloc];
    v16 = [v9 URL];
    v17 = (void *)[v15 initWithFormat:@"Finished download data from Apple Music artwork URL, but we could not use it to create an image: %@", v16];

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23 = v17;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v20 = (void *)[v18 initWithDomain:@"PXAudioAssetImageProviderErrorDomain" code:3 userInfo:v19];
  }
  else
  {
    if (v10)
    {
      uint64_t v24 = *MEMORY[0x1E4F28A50];
      id v25 = v10;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    }
    else
    {
      v17 = 0;
    }
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PXAudioAssetImageProviderErrorDomain" code:4 userInfo:v17];
  }

  id v21 = v20;
  px_dispatch_on_main_queue();
}

- (void)_beginDownloadFromURL:(id)a3
{
  id v5 = a3;
  if (self->_dataTask)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXAppleMusicImageProvider.m", 108, @"Invalid parameter not satisfying: %@", @"_dataTask == nil" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F290D0]) initWithURL:v5];
  uint64_t v7 = [MEMORY[0x1E4F290E0] sharedSession];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50___PXAppleMusicImageLoader__beginDownloadFromURL___block_invoke;
  v11[3] = &unk_1E5DC8CC8;
  objc_copyWeak(&v12, &location);
  id v8 = [v7 dataTaskWithRequest:v6 completionHandler:v11];
  dataTask = self->_dataTask;
  self->_dataTask = v8;

  [(NSURLSessionDataTask *)self->_dataTask resume];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (void)startWithCompletion:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_completionHandler)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXAppleMusicImageProvider.m", 93, @"Invalid parameter not satisfying: %@", @"_completionHandler == nil" object file lineNumber description];
  }
  v6 = (void *)[v5 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  id v8 = [(_PXAppleMusicImageLoader *)self asset];
  id v9 = [v8 musicAsset];

  [(_PXAppleMusicImageLoader *)self targetSize];
  id v10 = objc_msgSend(v9, "artworkURLForTargetPixelSize:");
  if (v10)
  {
    [(_PXAppleMusicImageLoader *)self _beginDownloadFromURL:v10];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28228];
    id v12 = (void *)[[NSString alloc] initWithFormat:@"Unable to fetch missing artwork URL for asset without Photo Library: %@", v9, v17];
    v18[0] = v12;
    CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    CGImageSourceRef v14 = (NSError *)[v11 initWithDomain:@"PXAudioAssetImageProviderErrorDomain" code:2 userInfo:v13];
    error = self->_error;
    self->_error = v14;

    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (_PXAppleMusicImageLoader)initWithAsset:(id)a3 targetSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_PXAppleMusicImageLoader;
  id v9 = [(_PXAppleMusicImageLoader *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    v10->_targetSize.CGFloat width = width;
    v10->_targetSize.CGFloat height = height;
  }

  return v10;
}

- (_PXAppleMusicImageLoader)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicImageProvider.m", 80, @"%s is not available as initializer", "-[_PXAppleMusicImageLoader init]");

  abort();
}

@end