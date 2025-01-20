@interface _PXFlexMusicImageLoader
- (CGImage)image;
- (CGSize)maxSize;
- (NSError)error;
- (OS_dispatch_queue)sharedImageLoadingQueue;
- (PXFlexMusicArtworkAsset)artworkAsset;
- (PXFlexMusicDownloader)downloader;
- (_PXFlexMusicImageLoader)initWithArtworkAsset:(id)a3 maxSize:(CGSize)a4 sharedImageLoadingQueue:(id)a5;
- (id)completionHandler;
- (void)_handleDownloadCompleted:(BOOL)a3 error:(id)a4;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)startWithCompletion:(id)a3;
@end

@implementation _PXFlexMusicImageLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_sharedImageLoadingQueue, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_artworkAsset, 0);
}

- (NSError)error
{
  return self->_error;
}

- (CGImage)image
{
  return self->_image;
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (OS_dispatch_queue)sharedImageLoadingQueue
{
  return self->_sharedImageLoadingQueue;
}

- (PXFlexMusicDownloader)downloader
{
  return self->_downloader;
}

- (PXFlexMusicArtworkAsset)artworkAsset
{
  return self->_artworkAsset;
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)_PXFlexMusicImageLoader;
  [(_PXFlexMusicImageLoader *)&v3 dealloc];
}

- (void)_handleDownloadCompleted:(BOOL)a3 error:(id)a4
{
  id v5 = a4;
  v6 = +[PXFlexMusicLibrary sharedLibrary];
  v7 = [(_PXFlexMusicImageLoader *)self artworkAsset];
  v8 = [v7 audioAsset];
  v9 = [v6 localURLForAsset:v8 resourceType:1];

  if (!v9)
  {
    v5;
    px_dispatch_on_main_queue();
  }
  v10 = [(_PXFlexMusicImageLoader *)self sharedImageLoadingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke;
  block[3] = &unk_1E5DD32A8;
  id v12 = v9;
  v13 = self;
  dispatch_async(v10, block);
}

- (void)startWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = [(_PXFlexMusicImageLoader *)self completionHandler];

  if (v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXFlexMusicImageProvider.m", 137, @"Invalid parameter not satisfying: %@", @"self.completionHandler == nil" object file lineNumber description];
  }
  [(_PXFlexMusicImageLoader *)self setCompletionHandler:v5];
  objc_initWeak(&location, self);
  v7 = [(_PXFlexMusicImageLoader *)self downloader];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47___PXFlexMusicImageLoader_startWithCompletion___block_invoke;
  v9[3] = &unk_1E5DD0950;
  objc_copyWeak(&v10, &location);
  [v7 startWithCompletion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (_PXFlexMusicImageLoader)initWithArtworkAsset:(id)a3 maxSize:(CGSize)a4 sharedImageLoadingQueue:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_PXFlexMusicImageLoader;
  id v12 = [(_PXFlexMusicImageLoader *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_artworkAsset, a3);
    v13->_maxSize.CGFloat width = width;
    v13->_maxSize.CGFloat height = height;
    objc_storeStrong((id *)&v13->_sharedImageLoadingQueue, a5);
    v14 = [PXFlexMusicDownloader alloc];
    v15 = [v10 audioAsset];
    uint64_t v16 = [(PXFlexMusicDownloader *)v14 initWithAsset:v15 resource:1];
    downloader = v13->_downloader;
    v13->_downloader = (PXFlexMusicDownloader *)v16;
  }
  return v13;
}

@end