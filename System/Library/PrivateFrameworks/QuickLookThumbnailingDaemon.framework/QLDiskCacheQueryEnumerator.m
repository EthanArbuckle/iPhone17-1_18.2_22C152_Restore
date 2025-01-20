@interface QLDiskCacheQueryEnumerator
- (BOOL)iconMode;
- (NSMutableArray)sameGeneratorRequests;
- (NSMutableDictionary)generatorRequestBeingProcessed;
- (QLCacheBlobInfo)bitmapDataBlobInfo;
- (QLDiskCacheQueryEnumerator)initWithDiskCache:(id)a3 thumbnailRequests:(id)a4;
- (float)size;
- (id)nextThumbnailRequestWithThumbnailData:(id *)a3;
- (int)interpolationQuality;
- (int64_t)iconVariant;
- (unint64_t)badgeType;
- (unint64_t)externalGeneratorDataHash;
- (void)_cleanUpValues;
- (void)_createNewCacheIndexDatabaseEnumerator;
- (void)_findThumbnailRequestsToProcess;
- (void)dealloc;
- (void)moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:(id)a3;
- (void)setBadgeType:(unint64_t)a3;
- (void)setBitmapDataBlobInfo:(id)a3;
- (void)setExternalGeneratorDataHash:(unint64_t)a3;
- (void)setGeneratorRequestBeingProcessed:(id)a3;
- (void)setIconMode:(BOOL)a3;
- (void)setIconVariant:(int64_t)a3;
- (void)setInterpolationQuality:(int)a3;
- (void)setSameGeneratorRequests:(id)a3;
- (void)setSize:(float)a3;
@end

@implementation QLDiskCacheQueryEnumerator

- (void)_findThumbnailRequestsToProcess
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v4 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator fileIdentifier];

  if (v4
    || (BOOL v5 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator nextThumbnailInfo], self->_valueFound = v5, v5))
  {
    if (![(NSMutableArray *)self->_sameGeneratorRequests count])
    {
      *(void *)&long long v6 = 138413058;
      long long v33 = v6;
      do
      {
        if (!self->_valueFound) {
          return;
        }
        if (self->_fileIdentifier)
        {
          v7 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator fileIdentifier];
          if (v7)
          {
            fileIdentifier = self->_fileIdentifier;
            v2 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator fileIdentifier];
            if (![(QLCacheFileIdentifier *)fileIdentifier isEqual:v2]
              || (int iconMode = self->_iconMode,
                  iconMode != [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator iconMode])|| (unint64_t badgeType = self->_badgeType, badgeType != [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator badgeType])|| (iconVariant = self->_iconVariant, iconVariant != [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator iconVariant])|| (interpolationQuality = self->_interpolationQuality, interpolationQuality != [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator interpolationQuality])|| (externalGeneratorDataHash = self->_externalGeneratorDataHash, externalGeneratorDataHash != [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator externalGeneratorDataHash]))
            {

LABEL_20:
              v35[0] = MEMORY[0x1E4F143A8];
              v35[1] = 3221225472;
              v35[2] = __61__QLDiskCacheQueryEnumerator__findThumbnailRequestsToProcess__block_invoke;
              v35[3] = &unk_1E6D0CA20;
              v35[4] = self;
              -[QLDiskCacheQueryEnumerator moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:](self, "moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:", v35, v33);
              goto LABEL_21;
            }
          }
          v14 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator fileIdentifier];

          if (v7)
          {
          }
          if (!v14) {
            goto LABEL_20;
          }
        }
LABEL_21:
        v15 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator fileIdentifier];
        if (v15)
        {

LABEL_24:
          if (![(NSMutableArray *)self->_sameGeneratorRequests count])
          {
            [(QLDiskCacheQueryEnumerator *)self _cleanUpValues];
            self->_cacheId = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator cacheId];
            v16 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator fileIdentifier];
            v17 = self->_fileIdentifier;
            self->_fileIdentifier = v16;

            self->_int iconMode = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator iconMode] != 0;
            self->_int64_t iconVariant = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator iconVariant];
            self->_int interpolationQuality = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator interpolationQuality];
            [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator size];
            self->_double size = v18;
            v19 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator bitmapFormat];
            bitmapFormat = self->_bitmapFormat;
            self->_bitmapFormat = v19;

            v21 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator bitmapDataBlobInfo];
            bitmapDataBlobInfo = self->_bitmapDataBlobInfo;
            self->_bitmapDataBlobInfo = v21;

            v23 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator metadataBlobInfo];
            metadataBlobInfo = self->_metadataBlobInfo;
            self->_metadataBlobInfo = v23;

            metadata = self->_metadata;
            self->_metadata = 0;

            bitmapData = self->_bitmapData;
            self->_bitmapData = 0;

            self->_unint64_t badgeType = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator badgeType];
            self->_unint64_t externalGeneratorDataHash = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator externalGeneratorDataHash];
            self->_flavor = 0;
            CGSize v27 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
            self->_contentRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
            self->_contentRect.double size = v27;
            v28 = _log_5();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v29 = self->_fileIdentifier;
              unint64_t v30 = self->_badgeType;
              v31 = @"YES";
              if (!self->_iconMode) {
                v31 = @"NO";
              }
              double size = self->_size;
              *(_DWORD *)buf = v33;
              v37 = v29;
              __int16 v38 = 2112;
              v39 = v31;
              __int16 v40 = 2048;
              unint64_t v41 = v30;
              __int16 v42 = 2048;
              double v43 = size;
              _os_log_debug_impl(&dword_1DDC5E000, v28, OS_LOG_TYPE_DEBUG, "processing from database %@ icon mode %@ badgeType %lu size %.1f", buf, 0x2Au);
            }

            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __61__QLDiskCacheQueryEnumerator__findThumbnailRequestsToProcess__block_invoke_22;
            v34[3] = &unk_1E6D0CA20;
            v34[4] = self;
            [(QLDiskCacheQueryEnumerator *)self moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:v34];
            [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator nextThumbnailInfo];
          }
          continue;
        }
        if ([(NSMutableArray *)self->_sameGeneratorRequests count]) {
          goto LABEL_24;
        }
        [(QLDiskCacheQueryEnumerator *)self _cleanUpValues];
        self->_valueFound = 0;
      }
      while (![(NSMutableArray *)self->_sameGeneratorRequests count]);
    }
  }
}

- (void)moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:(id)a3
{
  v4 = (unsigned int (**)(id, void *))a3;
  BOOL v5 = [(NSMutableDictionary *)self->_generatorRequestBeingProcessed objectForKeyedSubscript:self->_fileIdentifier];
  if (v5)
  {
    long long v6 = _log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(QLDiskCacheQueryEnumerator *)(uint64_t *)&self->_fileIdentifier moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:v6];
    }

    uint64_t v7 = [v5 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        v9 = [v5 objectAtIndexedSubscript:v8];
        if (v4[2](v4, v9))
        {
          [(NSMutableArray *)self->_sameGeneratorRequests addObject:v9];
          [v5 removeObjectAtIndex:v8];
          --v7;
        }
        else
        {
          ++v8;
        }
      }
      while (v8 < v7);
    }
    if (!v7) {
      [(NSMutableDictionary *)self->_generatorRequestBeingProcessed setObject:0 forKeyedSubscript:self->_fileIdentifier];
    }
  }
}

- (void)_cleanUpValues
{
  fileIdentifier = self->_fileIdentifier;
  self->_fileIdentifier = 0;

  self->_double size = 0.0;
  bitmapDataBlobInfo = self->_bitmapDataBlobInfo;
  self->_bitmapDataBlobInfo = 0;

  metadataBlobInfo = self->_metadataBlobInfo;
  self->_metadataBlobInfo = 0;

  self->_unint64_t badgeType = 0;
  self->_unint64_t externalGeneratorDataHash = 0;
}

void __68__QLDiskCacheQueryEnumerator__createNewCacheIndexDatabaseEnumerator__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  *a4 = 0;
  uint64_t v8 = (void *)[v7 mutableCopy];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v41 = v6;
    __int16 v42 = v8;
    v46 = 0;
    v12 = 0;
    uint64_t v13 = *(void *)v48;
    do
    {
      uint64_t v14 = 0;
      uint64_t v43 = v11;
      do
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v47 + 1) + 8 * v14);
        v16 = objc_msgSend(v15, "request", v41);
        if (!v12)
        {
          v17 = [v15 request];
          float v18 = [v17 fileIdentifier];
          v12 = [v18 fileIdentifier];

          v19 = [*(id *)(a1 + 32) generatorRequestBeingProcessed];
          [v19 setObject:v42 forKeyedSubscript:v12];
        }
        if (([v15 cancelled] & 1) == 0)
        {
          v45 = v12;
          uint64_t v20 = v13;
          v21 = v46;
          if (!v46)
          {
            v22 = [v16 fileIdentifier];
            v23 = [v22 version];

            v24 = [QLCacheIndexFileRequest alloc];
            v25 = [v16 fileIdentifier];
            v26 = [v25 fileIdentifier];
            v21 = [(QLCacheIndexFileRequest *)v24 initWithFileIdentifier:v26 version:v23];
          }
          [(id)objc_opt_class() _expectedThumbnailSizeForRequest:v16];
          float v28 = v27;
          [v16 minimumDimension];
          double v30 = v29;
          [v16 scale];
          *(float *)&double v30 = v30 * v31;
          uint64_t v32 = [v16 iconMode];
          uint64_t v33 = [v15 needsLowQualityThumbnailGeneration];
          uint64_t v34 = [v15 badgeType];
          uint64_t v35 = [v16 iconVariant];
          uint64_t v36 = [v16 interpolationQuality];
          uint64_t v37 = [v16 externalThumbnailGeneratorDataHash];
          v46 = v21;
          *(float *)&double v38 = v28;
          LODWORD(v39) = LODWORD(v30);
          [(QLCacheIndexFileRequest *)v21 appendSize:v32 minimumSize:v33 withIconMode:v34 lowQuality:v35 badgeType:v36 iconVariant:v37 interpolationQuality:v38 externalGeneratorDataHash:v39];
          uint64_t v13 = v20;
          v12 = v45;
          uint64_t v11 = v43;
        }

        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v11);

    __int16 v40 = v46;
    if (v46)
    {
      [*(id *)(a1 + 40) setObject:v46 forKey:v12];
      uint64_t v8 = v42;
      [v42 sortUsingSelector:sel_compare_];
      id v6 = v41;
    }
    else
    {
      id v6 = v41;
      uint64_t v8 = v42;
    }
  }
  else
  {

    v12 = 0;
    __int16 v40 = 0;
  }
}

BOOL __61__QLDiskCacheQueryEnumerator__findThumbnailRequestsToProcess__block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 request];
  [(id)objc_opt_class() _expectedThumbnailSizeForRequest:v4];
  double v6 = v5;
  int v7 = [*(id *)(a1 + 32) iconMode];
  if (v7 != [v4 iconMode]) {
    goto LABEL_11;
  }
  uint64_t v8 = [*(id *)(a1 + 32) badgeType];
  if (v8 != [v3 badgeType]) {
    goto LABEL_11;
  }
  uint64_t v9 = [*(id *)(a1 + 32) iconVariant];
  if (v9 != [v4 iconVariant]) {
    goto LABEL_11;
  }
  int v10 = [*(id *)(a1 + 32) interpolationQuality];
  if (v10 != [v4 interpolationQuality]) {
    goto LABEL_11;
  }
  uint64_t v11 = [*(id *)(a1 + 32) externalGeneratorDataHash];
  if (v11 != [v4 externalThumbnailGeneratorDataHash]) {
    goto LABEL_11;
  }
  [*(id *)(a1 + 32) size];
  if (v6 != v12)
  {
    [*(id *)(a1 + 32) size];
    if (v6 < v14 && [v3 needsLowQualityThumbnailGeneration])
    {
      v15 = [*(id *)(a1 + 32) bitmapDataBlobInfo];
      BOOL v13 = [v15 length] != 0;

      goto LABEL_12;
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (float)size
{
  return self->_size;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (NSMutableDictionary)generatorRequestBeingProcessed
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)externalGeneratorDataHash
{
  return self->_externalGeneratorDataHash;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (id)nextThumbnailRequestWithThumbnailData:(id *)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  generatorRequest = self->_generatorRequest;
  if (generatorRequest)
  {
    self->_generatorRequest = 0;
  }
  if (self->_valueFound && ![(NSMutableArray *)self->_sameGeneratorRequests count])
  {
    if ([(NSMutableDictionary *)self->_generatorRequestBeingProcessed count])
    {
      [(QLDiskCacheQueryEnumerator *)self _findThumbnailRequestsToProcess];
      if (![(NSMutableArray *)self->_sameGeneratorRequests count])
      {
        generatorRequestBeingProcessed = self->_generatorRequestBeingProcessed;
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __68__QLDiskCacheQueryEnumerator_nextThumbnailRequestWithThumbnailData___block_invoke;
        v62[3] = &unk_1E6D0CA48;
        v62[4] = self;
        [(NSMutableDictionary *)generatorRequestBeingProcessed enumerateKeysAndObjectsUsingBlock:v62];
        [(NSMutableDictionary *)self->_generatorRequestBeingProcessed removeAllObjects];
      }
    }
  }
  if ([(NSMutableArray *)self->_sameGeneratorRequests count])
  {
    double v6 = [(NSMutableArray *)self->_sameGeneratorRequests lastObject];
    int v7 = self->_generatorRequest;
    self->_generatorRequest = v6;

    [(NSMutableArray *)self->_sameGeneratorRequests removeLastObject];
  }
  thumbnailData = self->_thumbnailData;
  self->_thumbnailData = 0;

  uint64_t v9 = self->_generatorRequest;
  if (v9)
  {
    if (![(QLTGeneratorThumbnailRequest *)v9 cancelled] && self->_valueFound)
    {
      if ([(QLCacheBlobInfo *)self->_bitmapDataBlobInfo length]
        || (double v10 = self->_size,
            uint64_t v11 = objc_opt_class(),
            [(QLTGeneratorThumbnailRequest *)self->_generatorRequest request],
            float v12 = objc_claimAutoreleasedReturnValue(),
            [v11 _expectedThumbnailSizeForRequest:v12],
            double v14 = v13,
            v12,
            v14 <= v10))
      {
        if ([(QLCacheBlobInfo *)self->_bitmapDataBlobInfo length])
        {
          if (!self->_bitmapData && [(QLCacheBlobInfo *)self->_bitmapDataBlobInfo length])
          {
            v15 = [(QLDiskCache *)self->super._diskCache blobDatabase];
            v16 = (NSData *)[v15 copyBlobWithInfo:self->_bitmapDataBlobInfo];
            bitmapData = self->_bitmapData;
            self->_bitmapData = v16;
          }
          if (!self->_metadata && [(QLCacheBlobInfo *)self->_metadataBlobInfo length])
          {
            float v18 = [(QLDiskCache *)self->super._diskCache blobDatabase];
            v19 = (NSData *)[v18 copyBlobWithInfo:self->_metadataBlobInfo];
            metadata = self->_metadata;
            self->_metadata = v19;
          }
          v21 = _log_5();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            fileIdentifier = self->_fileIdentifier;
            unint64_t v58 = [(QLCacheBlobInfo *)self->_bitmapDataBlobInfo location];
            unint64_t v57 = [(QLCacheBlobInfo *)self->_bitmapDataBlobInfo length];
            unint64_t v22 = [(QLCacheBlobInfo *)self->_metadataBlobInfo location];
            unint64_t v23 = [(QLCacheBlobInfo *)self->_metadataBlobInfo length];
            *(_DWORD *)buf = 138413314;
            v64 = fileIdentifier;
            __int16 v65 = 2048;
            unint64_t v66 = v58;
            __int16 v67 = 2048;
            unint64_t v68 = v57;
            __int16 v69 = 2048;
            unint64_t v70 = v22;
            __int16 v71 = 2048;
            unint64_t v72 = v23;
            _os_log_impl(&dword_1DDC5E000, v21, OS_LOG_TYPE_INFO, "data for %@ thumbnail location : %llu length : %llu contentRect location : %llu length : %llu", buf, 0x34u);
          }

          if (!self->_metadata && [(QLCacheBlobInfo *)self->_metadataBlobInfo length])
          {
            v25 = _log_5();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              long long v48 = [(NSData *)self->_metadata bytes];
              unint64_t v49 = [(QLCacheBlobInfo *)self->_metadataBlobInfo length];
              long long v50 = self->_bitmapData;
              unint64_t v51 = [(QLCacheBlobInfo *)self->_bitmapDataBlobInfo length];
              *(_DWORD *)buf = 134218752;
              v64 = v48;
              __int16 v65 = 2048;
              unint64_t v66 = v49;
              __int16 v67 = 2048;
              unint64_t v68 = (unint64_t)v50;
              __int16 v69 = 2048;
              unint64_t v70 = v51;
              uint64_t v52 = "We can't get the plist buffer, so we will pretend we don't have this thumbnail plist %p length %llu "
                    "bitmap data %p length %llu";
LABEL_41:
              _os_log_impl(&dword_1DDC5E000, v25, OS_LOG_TYPE_INFO, v52, buf, 0x2Au);
              goto LABEL_31;
            }
            goto LABEL_31;
          }
          if (!self->_bitmapData && [(QLCacheBlobInfo *)self->_bitmapDataBlobInfo length])
          {
            v25 = _log_5();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v53 = [(NSData *)self->_metadata bytes];
              unint64_t v54 = [(QLCacheBlobInfo *)self->_metadataBlobInfo length];
              v55 = [(NSData *)self->_bitmapData bytes];
              unint64_t v56 = [(QLCacheBlobInfo *)self->_bitmapDataBlobInfo length];
              *(_DWORD *)buf = 134218752;
              v64 = v53;
              __int16 v65 = 2048;
              unint64_t v66 = v54;
              __int16 v67 = 2048;
              unint64_t v68 = (unint64_t)v55;
              __int16 v69 = 2048;
              unint64_t v70 = v56;
              uint64_t v52 = "We can't get the bitmap data, so we will pretend we don't have this thumbnail plist %p length %llu b"
                    "itmap data %p length %llu";
              goto LABEL_41;
            }
LABEL_31:

            goto LABEL_32;
          }
          v24 = [QLCacheThumbnailData alloc];
          unint64_t cacheId = self->_cacheId;
          v61 = v24;
          v25 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest request];
          float size = self->_size;
          bitmapFormat = self->_bitmapFormat;
          float v28 = self->_bitmapData;
          double v29 = self->_metadata;
          uint64_t flavor = self->_flavor;
          unint64_t v31 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest badgeType];
          *(float *)&double v32 = size;
          uint64_t v33 = -[QLCacheThumbnailData initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:](v61, "initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:", cacheId, v25, bitmapFormat, v28, v29, flavor, v32, self->_contentRect.origin.x, self->_contentRect.origin.y, self->_contentRect.size.width, self->_contentRect.size.height, v31);
        }
        else
        {
          uint64_t v35 = _log_5();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            uint64_t v36 = self->_fileIdentifier;
            uint64_t v37 = objc_opt_class();
            double v38 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest request];
            [v37 _expectedThumbnailSizeForRequest:v38];
            *(_DWORD *)buf = 138412546;
            v64 = v36;
            __int16 v65 = 2048;
            unint64_t v66 = v39;
            _os_log_impl(&dword_1DDC5E000, v35, OS_LOG_TYPE_INFO, "no data for %@ %f", buf, 0x16u);
          }
          __int16 v40 = [QLCacheThumbnailData alloc];
          unint64_t v41 = self->_cacheId;
          v25 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest request];
          float v42 = self->_size;
          unint64_t v43 = [(QLTGeneratorThumbnailRequest *)self->_generatorRequest badgeType];
          *(float *)&double v44 = v42;
          uint64_t v33 = [(QLCacheThumbnailData *)v40 initWithCacheId:v41 thumbnailRequest:v25 size:v43 badgeType:v44];
        }
        v45 = self->_thumbnailData;
        self->_thumbnailData = v33;

        goto LABEL_31;
      }
    }
  }
LABEL_32:
  *a3 = self->_thumbnailData;
  v46 = self->_generatorRequest;
  return v46;
}

- (void)dealloc
{
  [(QLDiskCacheQueryEnumerator *)self _cleanUpValues];
  v3.receiver = self;
  v3.super_class = (Class)QLDiskCacheQueryEnumerator;
  [(QLDiskCacheQueryEnumerator *)&v3 dealloc];
}

- (QLDiskCacheQueryEnumerator)initWithDiskCache:(id)a3 thumbnailRequests:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(QLDiskCacheEnumerator *)self initWithDiskCache:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_generatorRequests, a4);
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    generatorRequestBeingProcessed = v9->_generatorRequestBeingProcessed;
    v9->_generatorRequestBeingProcessed = (NSMutableDictionary *)v10;

    float v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sameGeneratorRequests = v9->_sameGeneratorRequests;
    v9->_sameGeneratorRequests = v12;

    generatorRequest = v9->_generatorRequest;
    v9->_generatorRequest = 0;

    v15 = objc_alloc_init(QLCacheBlobInfo);
    bitmapDataBlobInfo = v9->_bitmapDataBlobInfo;
    v9->_bitmapDataBlobInfo = v15;

    v17 = objc_alloc_init(QLCacheBlobInfo);
    metadataBlobInfo = v9->_metadataBlobInfo;
    v9->_metadataBlobInfo = v17;

    v9->_valueFound = 1;
    [(QLDiskCacheQueryEnumerator *)v9 _createNewCacheIndexDatabaseEnumerator];
  }

  return v9;
}

- (void)_createNewCacheIndexDatabaseEnumerator
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  generatorRequests = self->_generatorRequests;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __68__QLDiskCacheQueryEnumerator__createNewCacheIndexDatabaseEnumerator__block_invoke;
  float v12 = &unk_1E6D0C9F8;
  double v13 = self;
  id v5 = v3;
  id v14 = v5;
  [(NSDictionary *)generatorRequests enumerateKeysAndObjectsUsingBlock:&v9];
  if (objc_msgSend(v5, "count", v9, v10, v11, v12, v13))
  {
    double v6 = [(QLDiskCache *)self->super._diskCache indexDatabase];
    id v7 = [v6 queryCacheForFileRequests:v5];
    cacheIndexDatabaseEnumerator = self->_cacheIndexDatabaseEnumerator;
    self->_cacheIndexDatabaseEnumerator = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataBlobInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bitmapDataBlobInfo, 0);
  objc_storeStrong((id *)&self->_bitmapData, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_generatorRequest, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_sameGeneratorRequests, 0);
  objc_storeStrong((id *)&self->_cacheIndexDatabaseEnumerator, 0);
  objc_storeStrong((id *)&self->_generatorRequestBeingProcessed, 0);
  objc_storeStrong((id *)&self->_generatorRequests, 0);
}

BOOL __61__QLDiskCacheQueryEnumerator__findThumbnailRequestsToProcess__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 request];
  int v5 = [*(id *)(a1 + 32) iconMode];
  if (v5 == [v4 iconMode]
    && [v3 needsLowQualityThumbnailGeneration]
    && ([*(id *)(a1 + 32) size],
        [v4 minimumDimension],
        [v4 maximumPixelSize],
        QLSThumbnailSizeIsSufficientForLowQuality())
    && (uint64_t v6 = [*(id *)(a1 + 32) badgeType], v6 == objc_msgSend(v3, "badgeType"))
    && (uint64_t v7 = [*(id *)(a1 + 32) iconVariant], v7 == objc_msgSend(v4, "iconVariant"))
    && (int v8 = [*(id *)(a1 + 32) interpolationQuality],
        v8 == [v4 interpolationQuality]))
  {
    uint64_t v9 = [*(id *)(a1 + 32) bitmapDataBlobInfo];
    if ([v9 length])
    {
      uint64_t v10 = [*(id *)(a1 + 32) externalGeneratorDataHash];
      BOOL v11 = v10 == [v4 externalThumbnailGeneratorDataHash];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __68__QLDiskCacheQueryEnumerator_nextThumbnailRequestWithThumbnailData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [v3 sameGeneratorRequests];
  [v5 addObjectsFromArray:v4];
}

- (void)setGeneratorRequestBeingProcessed:(id)a3
{
}

- (QLCacheBlobInfo)bitmapDataBlobInfo
{
  return (QLCacheBlobInfo *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBitmapDataBlobInfo:(id)a3
{
}

- (NSMutableArray)sameGeneratorRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSameGeneratorRequests:(id)a3
{
}

- (void)setIconMode:(BOOL)a3
{
  self->_int iconMode = a3;
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_unint64_t badgeType = a3;
}

- (void)setIconVariant:(int64_t)a3
{
  self->_int64_t iconVariant = a3;
}

- (void)setInterpolationQuality:(int)a3
{
  self->_int interpolationQuality = a3;
}

- (void)setExternalGeneratorDataHash:(unint64_t)a3
{
  self->_unint64_t externalGeneratorDataHash = a3;
}

- (void)setSize:(float)a3
{
  self->_float size = a3;
}

- (double)moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = @"YES";
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(a2 + 88);
  if (!*(unsigned char *)(a2 + 65)) {
    id v3 = @"NO";
  }
  double v6 = *(float *)(a2 + 112);
  int v8 = 138413058;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  BOOL v11 = v3;
  __int16 v12 = 2048;
  uint64_t v13 = v5;
  __int16 v14 = 2048;
  double v15 = v6;
  _os_log_debug_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_DEBUG, "make sure we are done with %@ icon mode %@ badge type %lu size %.1f", (uint8_t *)&v8, 0x2Au);
  return result;
}

@end