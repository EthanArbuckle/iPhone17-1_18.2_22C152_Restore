@interface PXPlacesThumbnailManager
+ (id)_descriptionForBoundingRegion:(id *)a3;
+ (id)_filePathForHash:(id)a3;
+ (id)_filePathForMetadataPlist;
+ (id)_hashStringForBoundingRegion:(id *)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5;
+ (id)_thumbnailFilePath;
+ (id)hashStringForBoundingRegion:(id *)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5 displayScale:(double)a6;
- (NSCache)cache;
- (NSMutableDictionary)metadataPlist;
- (NSMutableDictionary)thumbnailsToWrite;
- (NSTimer)diskTimer;
- (OS_dispatch_queue)metadataQueue;
- (PXPlacesSearchProvider)placesProvider;
- (PXPlacesThumbnailManager)init;
- (id)_hashStringForKey:(id)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5 displayScale:(double)a6;
- (id)_imageForHomeZeroKeywordWithMapImage:(id)a3;
- (id)_processFetchedSnapshot:(id)a3 withHashString:(id)a4 placeIsHome:(BOOL)a5;
- (id)fetchPlacesThumbnailForBoundingRegion:(id *)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5;
- (void)_createThumbnailDirectoryIfNeeded;
- (void)_fetchDiskOrMemoryPlacesThumbnailForHashString:(id)a3 completion:(id)a4;
- (void)_fetchDiskOrMemoryPlacesThumbnailForHashString:(id)a3 synchronous:(BOOL)a4 completion:(id)a5;
- (void)_setInMemoryAndPersistToDiskThumbnail:(id)a3 forHashString:(id)a4;
- (void)_setInMemoryThumbnail:(id)a3 forHashString:(id)a4;
- (void)_setMetadataDate:(id)a3 forKey:(id)a4;
- (void)_writeMetadataPlistToDisk;
- (void)cachePlacesThumbnailForBoundingRegion:(id *)a3 size:(CGSize)a4 snapshot:(id)a5 interfaceStyle:(int64_t)a6;
- (void)fetchPlacesThumbnailForBoundingRegion:(id *)a3 placeIsHome:(BOOL)a4 traitCollection:(id)a5 withSize:(CGSize)a6 completion:(id)a7;
- (void)fetchPlacesThumbnailForPlaceName:(id)a3 placeIsHome:(BOOL)a4 traitCollection:(id)a5 withSize:(CGSize)a6 completion:(id)a7;
- (void)setCache:(id)a3;
- (void)setDiskTimer:(id)a3;
- (void)setMetadataPlist:(id)a3;
- (void)setMetadataQueue:(id)a3;
- (void)setPlacesProvider:(id)a3;
- (void)setThumbnailsToWrite:(id)a3;
@end

@implementation PXPlacesThumbnailManager

- (id)fetchPlacesThumbnailForBoundingRegion:(id *)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  double height = a4.height;
  double width = a4.width;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a5))
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PXPlacesThumbnailManager.m" lineNumber:129 description:@"This should not be called on main"];
  }
  if (height < -180.0
    || height > 180.0
    || width < -90.0
    || width > 90.0
    || v13 < 0.0
    || v13 > 180.0
    || v12 < 0.0
    || v12 > 360.0)
  {
    PXAssertGetLog();
  }
  v18 = objc_msgSend((id)objc_opt_class(), "_hashStringForBoundingRegion:size:interfaceStyle:", a3, width, height, v13, v12, v11, v10);
  *(void *)buf = 0;
  v24 = buf;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__27921;
  v27 = __Block_byref_object_dispose__27922;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_size_interfaceStyle___block_invoke;
  v22[3] = &unk_1E5DB1D18;
  v22[4] = buf;
  [(PXPlacesThumbnailManager *)self _fetchDiskOrMemoryPlacesThumbnailForHashString:v18 synchronous:1 completion:v22];
  id v19 = *((id *)v24 + 5);
  _Block_object_dispose(buf, 8);

  return v19;
}

- (void)_fetchDiskOrMemoryPlacesThumbnailForHashString:(id)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(void))a5;
  double v10 = [(PXPlacesThumbnailManager *)self cache];
  double v11 = [v10 objectForKey:v8];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__27921;
  v26 = __Block_byref_object_dispose__27922;
  id v27 = [v11 objectForKey:v8];
  if (v23[5])
  {
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__PXPlacesThumbnailManager__fetchDiskOrMemoryPlacesThumbnailForHashString_synchronous_completion___block_invoke;
    aBlock[3] = &unk_1E5DC7920;
    v21 = &v22;
    id v18 = v8;
    id v19 = self;
    v20 = v9;
    double v12 = _Block_copy(aBlock);
    double v13 = v12;
    if (v6)
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }
    else
    {
      v14 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __98__PXPlacesThumbnailManager__fetchDiskOrMemoryPlacesThumbnailForHashString_synchronous_completion___block_invoke_2;
      block[3] = &unk_1E5DD3128;
      id v16 = v13;
      dispatch_async(v14, block);
    }
  }
  _Block_object_dispose(&v22, 8);
}

void __98__PXPlacesThumbnailManager__fetchDiskOrMemoryPlacesThumbnailForHashString_synchronous_completion___block_invoke(uint64_t a1)
{
  v2 = +[PXPlacesThumbnailManager _filePathForHash:*(void *)(a1 + 32)];
  v15 = v2;
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
    if (v3)
    {
      v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
      double v5 = (void *)MEMORY[0x1E4FB1818];
      BOOL v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v6 scale];
      uint64_t v7 = objc_msgSend(v5, "imageWithData:scale:", v4);
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) imageByPreparingForDisplay];
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      double v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v13) {
        [*(id *)(a1 + 40) _setInMemoryThumbnail:v13 forHashString:*(void *)(a1 + 32)];
      }
    }
    v2 = v15;
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14)
  {
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v2);
    v2 = v15;
  }
}

- (NSCache)cache
{
  return self->_cache;
}

+ (id)_hashStringForBoundingRegion:(id *)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5
{
  CGFloat v8 = v6;
  CGFloat v9 = v5;
  uint64_t v10 = NSString;
  uint64_t v11 = objc_msgSend(a1, "_descriptionForBoundingRegion:", a3, a5, a4.width, a4.height);
  v18.double width = v9;
  v18.double height = v8;
  double v12 = NSStringFromCGSize(v18);
  uint64_t v13 = [v10 stringWithFormat:@"%@_%@_%ld", v11, v12, a3];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
  v15 = [v14 stringValue];

  return v15;
}

+ (id)_filePathForHash:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@.jpg", a3];
  double v5 = [a1 _thumbnailFilePath];
  double v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

+ (id)_thumbnailFilePath
{
  v2 = NSTemporaryDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"com.apple.mobileslideshow/search/thumbnails"];

  return v3;
}

+ (id)_descriptionForBoundingRegion:(id *)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%f,%f,%f,%f", v3, v4, v5, v6);
}

void __86__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_size_interfaceStyle___block_invoke(uint64_t a1, void *a2)
{
}

void __52__PXPlacesThumbnailManager__setMetadataDate_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained metadataPlist];
  [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)metadataQueue
{
  return self->_metadataQueue;
}

- (NSMutableDictionary)metadataPlist
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_metadataPlist)
  {
    uint64_t v3 = +[PXPlacesThumbnailManager _filePathForMetadataPlist];
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v3];
    uint64_t v5 = v4;
    if (v4) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    metadataPlist = v2->_metadataPlist;
    v2->_metadataPlist = v6;
  }
  objc_sync_exit(v2);

  CGFloat v8 = v2->_metadataPlist;
  return v8;
}

- (void)_setMetadataDate:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  CGFloat v8 = [(PXPlacesThumbnailManager *)self metadataQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PXPlacesThumbnailManager__setMetadataDate_forKey___block_invoke;
  v11[3] = &unk_1E5DD2548;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_setInMemoryThumbnail:(id)a3 forHashString:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v10[0] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  [v6 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  objc_claimAutoreleasedReturnValue();
  [(PXPlacesThumbnailManager *)self cache];
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_pixelSize");
  PXSizeGetArea();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailsToWrite, 0);
  objc_storeStrong((id *)&self->_diskTimer, 0);
  objc_storeStrong((id *)&self->_placesProvider, 0);
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_metadataPlist, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)setThumbnailsToWrite:(id)a3
{
}

- (NSMutableDictionary)thumbnailsToWrite
{
  return self->_thumbnailsToWrite;
}

- (void)setDiskTimer:(id)a3
{
}

- (NSTimer)diskTimer
{
  return self->_diskTimer;
}

- (void)setPlacesProvider:(id)a3
{
}

- (PXPlacesSearchProvider)placesProvider
{
  return self->_placesProvider;
}

- (void)setMetadataQueue:(id)a3
{
}

- (void)setMetadataPlist:(id)a3
{
}

- (void)setCache:(id)a3
{
}

- (id)_imageForHomeZeroKeywordWithMapImage:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
    id v4 = a3;
    objc_msgSend(v3, "px_imageNamed:", @"PXSearchZeroKeywordHomeIcon");
    objc_claimAutoreleasedReturnValue();
    [v4 size];
    PXRectGetCenter();
  }
  return 0;
}

- (void)_writeMetadataPlistToDisk
{
  v55[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [(PXPlacesThumbnailManager *)self metadataPlist];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __53__PXPlacesThumbnailManager__writeMetadataPlistToDisk__block_invoke;
  v48[3] = &unk_1E5DB1D88;
  id v36 = v3;
  id v49 = v36;
  id v6 = v4;
  id v50 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v48];
  v34 = +[PXPlacesThumbnailManager _thumbnailFilePath];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v55[0] = *MEMORY[0x1E4F1C6E8];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  v33 = (void *)v7;
  id v10 = [v8 enumeratorAtURL:v7 includingPropertiesForKeys:v9 options:4 errorHandler:0];

  v35 = v5;
  v38 = [v5 allKeys];
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v32 = v10;
  uint64_t v11 = [v10 allObjects];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v44 + 1) + 8 * i) lastPathComponent];
        v17 = [v16 pathExtension];
        int v18 = [v17 isEqualToString:@"jpg"];

        if (v18)
        {
          id v19 = [v16 stringByDeletingPathExtension];
          if (([v38 containsObject:v19] & 1) == 0) {
            [v37 setObject:v36 forKey:v19];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v13);
  }
  [v35 removeObjectsForKeys:v6];
  [v35 addEntriesFromDictionary:v37];
  v20 = off_1E5DA8000;
  v31 = +[PXPlacesThumbnailManager _filePathForMetadataPlist];
  if ((objc_msgSend(v35, "writeToFile:atomically:") & 1) == 0) {
    PXAssertGetLog();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v21 = v6;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v41;
    uint64_t v25 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        id v27 = [(__objc2_class *)v20[65] _filePathForHash:*(void *)(*((void *)&v40 + 1) + 8 * j)];
        id v39 = 0;
        [v8 removeItemAtPath:v27 error:&v39];
        id v28 = v39;
        if (v28)
        {
          v29 = v28;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [v29 localizedDescription];
            *(_DWORD *)buf = 138412290;
            v53 = v30;
            _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_DEFAULT, "Could not delete thumbnail with error: %@", buf, 0xCu);

            v20 = off_1E5DA8000;
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v23);
  }
}

void __53__PXPlacesThumbnailManager__writeMetadataPlistToDisk__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [*(id *)(a1 + 32) timeIntervalSinceDate:a3];
  if (v5 > 604800.0) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)_hashStringForKey:(id)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5 displayScale:(double)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = NSString;
  id v11 = a3;
  v18.CGFloat width = width;
  v18.CGFloat height = height;
  uint64_t v12 = NSStringFromCGSize(v18);
  uint64_t v13 = [v10 stringWithFormat:@"%@%@%ld%f", v11, v12, a5, *(void *)&a6];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
  v15 = [v14 stringValue];

  return v15;
}

- (void)_createThumbnailDirectoryIfNeeded
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = +[PXPlacesThumbnailManager _thumbnailFilePath];
  id v6 = 0;
  char v4 = [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v6];
  id v5 = v6;
  if ((v4 & 1) == 0) {
    PXAssertGetLog();
  }
}

- (void)_setInMemoryAndPersistToDiskThumbnail:(id)a3 forHashString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PXPlacesThumbnailManager *)self _setInMemoryThumbnail:v6 forHashString:v7];
  objc_initWeak(&location, self);
  id v8 = [(PXPlacesThumbnailManager *)self metadataQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke;
  v11[3] = &unk_1E5DD2548;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained thumbnailsToWrite];
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [WeakRetained setThumbnailsToWrite:v3];
  }
  [v3 setValue:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
  char v4 = [WeakRetained diskTimer];
  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke_2;
    id v9 = &unk_1E5DB1D60;
    id v10 = v3;
    id v11 = WeakRetained;
    char v4 = [v5 timerWithTimeInterval:0 repeats:&v6 block:3.0];
    objc_msgSend(WeakRetained, "setDiskTimer:", v4, v6, v7, v8, v9);
    [v4 fire];
  }
}

void __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_27917];
  [*(id *)(a1 + 32) removeAllObjects];
  [*(id *)(a1 + 40) _writeMetadataPlistToDisk];
  [*(id *)(a1 + 40) setDiskTimer:0];
  [v4 invalidate];
}

void __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  image = a3;
  id v4 = +[PXPlacesThumbnailManager _filePathForHash:a2];
  if (v4)
  {
    id v5 = UIImageJPEGRepresentation(image, 1.0);
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithData:v5];
    uint64_t v7 = [v6 properties];
    id v8 = [v7 objectForKey:*MEMORY[0x1E4F2F800]];
    CGImageWriteEXIFJPEGToPath();
  }
}

uint64_t __98__PXPlacesThumbnailManager__fetchDiskOrMemoryPlacesThumbnailForHashString_synchronous_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchDiskOrMemoryPlacesThumbnailForHashString:(id)a3 completion:(id)a4
{
}

- (id)_processFetchedSnapshot:(id)a3 withHashString:(id)a4 placeIsHome:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if (v5)
    {
      uint64_t v10 = [(PXPlacesThumbnailManager *)self _imageForHomeZeroKeywordWithMapImage:v8];

      id v8 = (id)v10;
    }
    [(PXPlacesThumbnailManager *)self _setInMemoryAndPersistToDiskThumbnail:v8 forHashString:v9];
  }

  return v8;
}

- (void)cachePlacesThumbnailForBoundingRegion:(id *)a3 size:(CGSize)a4 snapshot:(id)a5 interfaceStyle:(int64_t)a6
{
  double v11 = v9;
  double v12 = v8;
  double v13 = v7;
  double v14 = v6;
  double height = a4.height;
  double width = a4.width;
  CGSize v18 = a3;
  if (height < -180.0
    || height > 180.0
    || width < -90.0
    || width > 90.0
    || v14 < 0.0
    || v14 > 180.0
    || v13 < 0.0
    || v13 > 360.0)
  {
    PXAssertGetLog();
  }
  id v19 = objc_msgSend((id)objc_opt_class(), "_hashStringForBoundingRegion:size:interfaceStyle:", a5, width, height, v14, v13, v12, v11);
  [(PXPlacesThumbnailManager *)self _setInMemoryAndPersistToDiskThumbnail:v18 forHashString:v19];
}

- (void)fetchPlacesThumbnailForBoundingRegion:(id *)a3 placeIsHome:(BOOL)a4 traitCollection:(id)a5 withSize:(CGSize)a6 completion:(id)a7
{
  double v12 = v10;
  double v13 = v9;
  char v14 = (char)a3;
  double v15 = v8;
  double v16 = v7;
  double height = a6.height;
  double width = a6.width;
  id v20 = (id)a4;
  id v21 = a5;
  if (height < -180.0
    || height > 180.0
    || width < -90.0
    || width > 90.0
    || v16 < 0.0
    || v16 > 180.0
    || v15 < 0.0
    || v15 > 360.0)
  {
    PXAssertGetLog();
  }
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = [v20 userInterfaceStyle];
  [v20 displayScale];
  uint64_t v25 = objc_msgSend(v22, "hashStringForBoundingRegion:size:interfaceStyle:displayScale:", v23, width, height, v16, v15, v13, v12, v24);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __114__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_placeIsHome_traitCollection_withSize_completion___block_invoke;
  v29[3] = &unk_1E5DB1CF0;
  double v33 = width;
  double v34 = height;
  double v35 = v16;
  double v36 = v15;
  double v37 = v13;
  double v38 = v12;
  v29[4] = self;
  id v30 = v20;
  id v31 = v25;
  id v32 = v21;
  char v39 = v14;
  id v26 = v25;
  id v27 = v20;
  id v28 = v21;
  [(PXPlacesThumbnailManager *)self _fetchDiskOrMemoryPlacesThumbnailForHashString:v26 completion:v29];
}

void __114__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_placeIsHome_traitCollection_withSize_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && (uint64_t v4 = *(void *)(a1 + 56)) != 0)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) placesProvider];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __114__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_placeIsHome_traitCollection_withSize_completion___block_invoke_2;
    v8[3] = &unk_1E5DB1CC8;
    uint64_t v6 = *(void *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    char v15 = *(unsigned char *)(a1 + 112);
    long long v7 = *(_OWORD *)(a1 + 80);
    long long v12 = *(_OWORD *)(a1 + 64);
    long long v13 = v7;
    id v10 = *(id *)(a1 + 40);
    long long v14 = *(_OWORD *)(a1 + 96);
    id v11 = *(id *)(a1 + 56);
    objc_msgSend(v5, "requestMapSnapshotOfRegion:size:traitCollectionForSnapshot:completion:", v6, v8, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
}

void __114__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_placeIsHome_traitCollection_withSize_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v7 = [*(id *)(a1 + 32) _processFetchedSnapshot:v5 withHashString:*(void *)(a1 + 40) placeIsHome:*(unsigned __int8 *)(a1 + 112)];
  }
  else
  {
    double v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "_descriptionForBoundingRegion:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      long long v12 = PLSearchHomeItemTypeName();
      long long v13 = NSStringFromCGSize(*(CGSize *)(a1 + 96));
      int v15 = 138413570;
      id v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      double v24 = v13;
      __int16 v25 = 2080;
      id v26 = "-[PXPlacesThumbnailManager fetchPlacesThumbnailForBoundingRegion:placeIsHome:traitCollection:withSize:comple"
            "tion:]_block_invoke_2";
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Map snapshot didn't exist. BoundingRegion: %@ TraitCollection: %@ Hash String: %@ Type: %@ Size: %@ Function: %s", (uint8_t *)&v15, 0x3Eu);
    }
    long long v7 = 0;
  }
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14) {
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v7);
  }
}

- (void)fetchPlacesThumbnailForPlaceName:(id)a3 placeIsHome:(BOOL)a4 traitCollection:(id)a5 withSize:(CGSize)a6 completion:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = [v14 userInterfaceStyle];
  [v14 displayScale];
  uint64_t v18 = -[PXPlacesThumbnailManager _hashStringForKey:size:interfaceStyle:displayScale:](self, "_hashStringForKey:size:interfaceStyle:displayScale:", v13, v16, width, height, v17);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __109__PXPlacesThumbnailManager_fetchPlacesThumbnailForPlaceName_placeIsHome_traitCollection_withSize_completion___block_invoke;
  v23[3] = &unk_1E5DB1CA0;
  id v26 = v18;
  id v27 = v15;
  v23[4] = self;
  id v24 = v13;
  double v28 = width;
  double v29 = height;
  id v25 = v14;
  BOOL v30 = a4;
  id v19 = v18;
  id v20 = v14;
  id v21 = v13;
  id v22 = v15;
  [(PXPlacesThumbnailManager *)self _fetchDiskOrMemoryPlacesThumbnailForHashString:v19 completion:v23];
}

void __109__PXPlacesThumbnailManager_fetchPlacesThumbnailForPlaceName_placeIsHome_traitCollection_withSize_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && (uint64_t v4 = *(void *)(a1 + 64)) != 0)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) placesProvider];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __109__PXPlacesThumbnailManager_fetchPlacesThumbnailForPlaceName_placeIsHome_traitCollection_withSize_completion___block_invoke_2;
    v8[3] = &unk_1E5DB1CA0;
    v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 56);
    char v14 = *(unsigned char *)(a1 + 88);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    long long v13 = *(_OWORD *)(a1 + 72);
    id v12 = *(id *)(a1 + 64);
    objc_msgSend(v5, "requestMapSnapshotForQuery:size:traitCollectionForSnapshot:completion:", v6, v7, v8, *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
}

void __109__PXPlacesThumbnailManager_fetchPlacesThumbnailForPlaceName_placeIsHome_traitCollection_withSize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [*(id *)(a1 + 32) _processFetchedSnapshot:v3 withHashString:*(void *)(a1 + 40) placeIsHome:*(unsigned __int8 *)(a1 + 88)];
  }
  else
  {
    uint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = PLSearchHomeItemTypeName();
      id v11 = NSStringFromCGSize(*(CGSize *)(a1 + 72));
      int v13 = 138413570;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      __int16 v23 = 2080;
      id v24 = "-[PXPlacesThumbnailManager fetchPlacesThumbnailForPlaceName:placeIsHome:traitCollection:withSize:completion:"
            "]_block_invoke_2";
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Map snapshot didn't exist. Key: %@ TraitCollection: %@ Hash String: %@ Type: %@ Size: %@ Function: %s", (uint8_t *)&v13, 0x3Eu);
    }
    id v5 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 64);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);
  }
}

- (PXPlacesThumbnailManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXPlacesThumbnailManager;
  v2 = [(PXPlacesThumbnailManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    placesProvider = v2->_placesProvider;
    v2->_placesProvider = (PXPlacesSearchProvider *)v3;

    id v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v2->_cache;
    v2->_cache = v5;

    [(PXPlacesThumbnailManager *)v2 _createThumbnailDirectoryIfNeeded];
    dispatch_queue_t v7 = dispatch_queue_create("PXPlacesThumbnailManager metadata queue", 0);
    metadataQueue = v2->_metadataQueue;
    v2->_metadataQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)hashStringForBoundingRegion:(id *)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5 displayScale:(double)a6
{
  uint64_t v9 = v8;
  CGFloat v11 = v7;
  CGFloat v12 = v6;
  int v13 = NSString;
  uint64_t v14 = objc_msgSend(a1, "_descriptionForBoundingRegion:", a3, a5, a4.width, a4.height, a6);
  v21.double width = v12;
  v21.double height = v11;
  __int16 v15 = NSStringFromCGSize(v21);
  uint64_t v16 = [v13 stringWithFormat:@"%@_%@_%ld_%f", v14, v15, a3, v9];

  __int16 v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "hash"));
  uint64_t v18 = [v17 stringValue];

  return v18;
}

+ (id)_filePathForMetadataPlist
{
  v2 = +[PXPlacesThumbnailManager _thumbnailFilePath];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"thumbnailMetadata.plist"];

  return v3;
}

@end