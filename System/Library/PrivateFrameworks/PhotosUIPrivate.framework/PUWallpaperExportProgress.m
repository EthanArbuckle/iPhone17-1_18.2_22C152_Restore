@interface PUWallpaperExportProgress
- (NSArray)assetUUIDs;
- (NSMutableDictionary)downloadProgress;
- (NSMutableDictionary)processingProgress;
- (PUWallpaperExportProgress)init;
- (PUWallpaperExportProgress)initWithAssetUUIDs:(id)a3 progressHandler:(id)a4;
- (double)totalWork;
- (id)progressHandler;
- (void)_updateProgressValue:(double)a3 forAssetUUID:(id)a4 inDictionary:(id)a5;
- (void)begin;
- (void)finish;
- (void)reportDownloadProgress:(double)a3 forAssetUUID:(id)a4;
- (void)reportProcessingProgress:(double)a3 forAssetUUID:(id)a4;
@end

@implementation PUWallpaperExportProgress

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_processingProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (NSMutableDictionary)processingProgress
{
  return self->_processingProgress;
}

- (NSMutableDictionary)downloadProgress
{
  return self->_downloadProgress;
}

- (double)totalWork
{
  return self->_totalWork;
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (void)_updateProgressValue:(double)a3 forAssetUUID:(id)a4 inDictionary:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  v10 = [NSNumber numberWithDouble:a3];
  [v9 setObject:v10 forKey:v8];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v11 = self->_assetUUIDs;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v18 = -[NSMutableDictionary valueForKey:](self->_downloadProgress, "valueForKey:", v17, (void)v24);
        [v18 doubleValue];
        double v20 = v15 + v19;

        v21 = [(NSMutableDictionary *)self->_processingProgress valueForKey:v17];
        [v21 doubleValue];
        double v15 = v20 + v22;
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
  }

  os_unfair_lock_unlock(&self->_lock);
  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](v15 / self->_totalWork);
  }
}

- (void)finish
{
  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](1.0);
  }
}

- (void)begin
{
  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](0.0);
  }
}

- (void)reportProcessingProgress:(double)a3 forAssetUUID:(id)a4
{
}

- (void)reportDownloadProgress:(double)a3 forAssetUUID:(id)a4
{
}

- (PUWallpaperExportProgress)initWithAssetUUIDs:(id)a3 progressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUWallpaperExportProgress;
  id v8 = [(PUWallpaperExportProgress *)&v20 init];
  id v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [v6 copy];
    assetUUIDs = v9->_assetUUIDs;
    v9->_assetUUIDs = (NSArray *)v10;

    uint64_t v12 = [v7 copy];
    id progressHandler = v9->_progressHandler;
    v9->_id progressHandler = (id)v12;

    unint64_t v14 = [(NSArray *)v9->_assetUUIDs count];
    v9->_totalWork = (double)v14 + (double)v14;
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v14];
    downloadProgress = v9->_downloadProgress;
    v9->_downloadProgress = (NSMutableDictionary *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v14];
    processingProgress = v9->_processingProgress;
    v9->_processingProgress = (NSMutableDictionary *)v17;
  }
  return v9;
}

- (PUWallpaperExportProgress)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUWallpaperShuffleResourceManager.m", 940, @"%s is not available as initializer", "-[PUWallpaperExportProgress init]");

  abort();
}

@end