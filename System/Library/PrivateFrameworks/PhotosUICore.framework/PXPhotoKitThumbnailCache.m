@interface PXPhotoKitThumbnailCache
- (NSString)description;
- (NSString)label;
- (PHPhotoLibrary)photoLibrary;
- (PXPhotoKitThumbnailCache)init;
- (PXPhotoKitThumbnailCache)initWithSizeLimit:(unint64_t)a3 photoLibrary:(id)a4;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (id)tableThumbnailDataForAsset:(id)a3 dataSpecification:(PHAssetResourceTableDataSpecification *)a4;
- (unint64_t)sizeLimit;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)cacheThumbnailData:(id)a3 specification:(const PHAssetResourceTableDataSpecification *)a4 forAsset:(id)a5;
- (void)dealloc;
- (void)setLabel:(id)a3;
@end

@implementation PXPhotoKitThumbnailCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_lock_cachedThumbnailIndexByObjectID, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unint64_t)sizeLimit
{
  return self->_sizeLimit;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasIncrementalChanges])
  {
    os_unfair_lock_lock(&self->_lock);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v5 = self->_lock_cachedThumbnailIndexByObjectID;
    uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if ([v4 contentOrThumbnailChangedForPHAssetOID:v11])
          {
            if (!v8) {
              id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v12 = [(NSMutableDictionary *)self->_lock_cachedThumbnailIndexByObjectID objectForKeyedSubscript:v11];
            [v8 addObject:v12];
          }
        }
        uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v8)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            -[NSCache removeObjectForKey:](self->_cache, "removeObjectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v15);
      }
    }
  }
  else
  {
    [(NSCache *)self->_cache removeAllObjects];
  }

  return 0;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  lock_cachedThumbnailIndexByObjectID = self->_lock_cachedThumbnailIndexByObjectID;
  id v8 = [v6 objectID];

  [(NSMutableDictionary *)lock_cachedThumbnailIndexByObjectID removeObjectForKey:v8];
  os_unfair_lock_unlock(p_lock);
}

- (void)cacheThumbnailData:(id)a3 specification:(const PHAssetResourceTableDataSpecification *)a4 forAsset:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [v9 photoLibrary];
  photoLibrary = self->_photoLibrary;

  if (v10 == photoLibrary)
  {
    v12 = [v9 objectID];
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "thumbnailIndex"));
    unint64_t v14 = a4->dataHeight * (uint64_t)a4->bytesPerRow;
    if ([v8 length] >= v14)
    {
      uint64_t v15 = [off_1E5DA9658 sharedInstance];
      int v16 = [v15 colorCachedThumbnails];

      if (v16)
      {
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithBytes:length:", objc_msgSend(v8, "bytes"), v14);
        int bytesPerRow = a4->bytesPerRow;
        int dataWidth = a4->dataWidth;
        id v20 = v17;
        uint64_t v21 = [v20 mutableBytes];
        if ((int)v14 >= 2)
        {
          uint64_t v22 = 1;
          do
          {
            *(unsigned char *)(v21 + v22) = -1;
            v22 += bytesPerRow / dataWidth;
          }
          while (v22 < (uint64_t)v14);
        }
      }
      else
      {
        id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", objc_msgSend(v8, "bytes"), v14);
      }
      long long v23 = [[PXThumbnailCacheEntry alloc] initWithObjectID:v12 dataSpec:a4 data:v20];
      [(NSCache *)self->_cache setObject:v23 forKey:v13 cost:v14];
      id v24 = [(NSCache *)self->_cache objectForKey:v13];
      os_unfair_lock_lock(&self->_lock);
      [(NSMutableDictionary *)self->_lock_cachedThumbnailIndexByObjectID setObject:v13 forKeyedSubscript:v12];
      os_unfair_lock_unlock(&self->_lock);
    }
    else if ([v8 length] >= v14)
    {
      PXAssertGetLog();
    }
  }
}

- (id)tableThumbnailDataForAsset:(id)a3 dataSpecification:(PHAssetResourceTableDataSpecification *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 photoLibrary];
  photoLibrary = self->_photoLibrary;

  if (v7 == photoLibrary)
  {
    cache = self->_cache;
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "thumbnailIndex"));
    v12 = [(NSCache *)cache objectForKey:v11];

    if (a4 && v12)
    {
      [v12 dataSpec];
      *(_OWORD *)&a4->width = v14;
      *(_OWORD *)&a4->dataHeight = v15;
    }
    id v9 = [v12 data];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(PXPhotoKitThumbnailCache *)self label];
  uint64_t v5 = [(NSMutableDictionary *)self->_lock_cachedThumbnailIndexByObjectID count];
  id v6 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[PXPhotoKitThumbnailCache sizeLimit](self, "sizeLimit"), 1);
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p label:%@ count:%lu sizeLimit:%@>", self, self, v4, v5, v6];

  return (NSString *)v7;
}

- (void)dealloc
{
  [(NSCache *)self->_cache setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitThumbnailCache;
  [(PXPhotoKitThumbnailCache *)&v3 dealloc];
}

- (PXPhotoKitThumbnailCache)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitThumbnailCache.m", 64, @"%s is not available as initializer", "-[PXPhotoKitThumbnailCache init]");

  abort();
}

- (PXPhotoKitThumbnailCache)initWithSizeLimit:(unint64_t)a3 photoLibrary:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotoKitThumbnailCache;
  id v8 = [(PXPhotoKitThumbnailCache *)&v15 init];
  id v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_sizeLimit = a3;
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_cachedThumbnailIndexByObjectID = v9->_lock_cachedThumbnailIndexByObjectID;
    v9->_lock_cachedThumbnailIndexByObjectID = v10;

    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v9->_cache;
    v9->_cache = v12;

    [(NSCache *)v9->_cache setTotalCostLimit:a3];
    [(NSCache *)v9->_cache setDelegate:v9];
    objc_storeStrong((id *)&v9->_photoLibrary, a4);
    objc_msgSend(v7, "px_registerChangeObserver:", v9);
  }

  return v9;
}

@end