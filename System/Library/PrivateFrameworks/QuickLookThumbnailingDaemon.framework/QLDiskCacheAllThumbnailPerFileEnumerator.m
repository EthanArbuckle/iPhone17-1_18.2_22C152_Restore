@interface QLDiskCacheAllThumbnailPerFileEnumerator
- (QLDiskCacheAllThumbnailPerFileEnumerator)initWithDiskCache:(id)a3 fileIdentifier:(id)a4;
- (id)nextThumbnailData;
- (void)_createNewCacheIndexDatabaseEnumeratorWithFileIdentifier:(id)a3;
@end

@implementation QLDiskCacheAllThumbnailPerFileEnumerator

- (QLDiskCacheAllThumbnailPerFileEnumerator)initWithDiskCache:(id)a3 fileIdentifier:(id)a4
{
  id v7 = a4;
  v8 = [(QLDiskCacheEnumerator *)self initWithDiskCache:a3];
  if (v8)
  {
    v9 = objc_alloc_init(QLCacheBlobInfo);
    bitmapDataBlobInfo = v8->_bitmapDataBlobInfo;
    v8->_bitmapDataBlobInfo = v9;

    v11 = objc_alloc_init(QLCacheBlobInfo);
    metadataBlobInfo = v8->_metadataBlobInfo;
    v8->_metadataBlobInfo = v11;

    objc_storeStrong((id *)&v8->_fileIdentifier, a4);
  }

  return v8;
}

- (void)_createNewCacheIndexDatabaseEnumeratorWithFileIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v10 = objc_alloc_init(v4);
  v6 = [[QLCacheIndexFileRequest alloc] initWithFileIdentifier:v5];
  [v10 setObject:v6 forKeyedSubscript:v5];

  id v7 = [(QLDiskCache *)self->super._diskCache indexDatabase];
  v8 = [v7 queryCacheForFileRequests:v10];
  cacheIndexDatabaseEnumerator = self->_cacheIndexDatabaseEnumerator;
  self->_cacheIndexDatabaseEnumerator = v8;
}

- (id)nextThumbnailData
{
  if (!self->_cacheIndexDatabaseEnumerator) {
    [(QLDiskCacheAllThumbnailPerFileEnumerator *)self _createNewCacheIndexDatabaseEnumeratorWithFileIdentifier:self->_fileIdentifier];
  }
  thumbnailData = self->_thumbnailData;
  self->_thumbnailData = 0;

  bitmapDataBlobInfo = self->_bitmapDataBlobInfo;
  self->_bitmapDataBlobInfo = 0;

  metadataBlobInfo = self->_metadataBlobInfo;
  self->_metadataBlobInfo = 0;

  if ([(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator nextThumbnailInfo])
  {
    v6 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator bitmapDataBlobInfo];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      v8 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator bitmapDataBlobInfo];
      v9 = self->_bitmapDataBlobInfo;
      self->_bitmapDataBlobInfo = v8;

      id v10 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator metadataBlobInfo];
      v11 = self->_metadataBlobInfo;
      self->_metadataBlobInfo = v10;

      v12 = [(QLDiskCache *)self->super._diskCache blobDatabase];
      v13 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator bitmapDataBlobInfo];
      v14 = (NSData *)[v12 copyBlobWithInfo:v13];
      bitmapData = self->_bitmapData;
      self->_bitmapData = v14;

      v16 = [(QLDiskCache *)self->super._diskCache blobDatabase];
      v17 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator metadataBlobInfo];
      v18 = (NSData *)[v16 copyBlobWithInfo:v17];
      metadata = self->_metadata;
      self->_metadata = v18;

      v62 = [QLCacheThumbnailData alloc];
      unint64_t v60 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator cacheId];
      v20 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator fileIdentifier];
      [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator size];
      int v22 = v21;
      BOOL v58 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator iconMode] != 0;
      int64_t v57 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator iconVariant];
      unsigned int v56 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator interpolationQuality];
      uint64_t v55 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator hitCount];
      v23 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator lastHitDate];
      v24 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator bitmapFormat];
      v25 = self->_bitmapData;
      v26 = self->_metadata;
      int v27 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator flavor];
      [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator contentRect];
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      unint64_t v36 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator badgeType];
      unint64_t v37 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator externalGeneratorDataHash];
      LODWORD(v54) = v27;
      LODWORD(v38) = v22;
      v39 = -[QLCacheThumbnailData initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:](v62, "initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", v60, v20, 0, v58, v57, v56, v38, v29, v31, v33, v35, v55, v23, v24, v25, v26,
              v54,
              v36,
              v37);
      v40 = self->_thumbnailData;
      self->_thumbnailData = v39;
    }
    else
    {
      v63 = [QLCacheThumbnailData alloc];
      unint64_t v61 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator cacheId];
      v20 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator fileIdentifier];
      [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator size];
      int v42 = v41;
      BOOL v59 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator iconMode] != 0;
      int64_t v43 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator iconVariant];
      uint64_t v44 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator interpolationQuality];
      unint64_t v45 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator badgeType];
      unint64_t v46 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator externalGeneratorDataHash];
      uint64_t v47 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator hitCount];
      v48 = [(QLCacheIndexDatabaseQueryEnumerator *)self->_cacheIndexDatabaseEnumerator lastHitDate];
      LODWORD(v49) = v42;
      v50 = [(QLCacheThumbnailData *)v63 initWithCacheId:v61 fileIdentifier:v20 version:0 size:v59 iconMode:v43 iconVariant:v44 interpolationQuality:v49 badgeType:v45 externalGeneratorDataHash:v46 hitCount:v47 lastHitDate:v48];
      v51 = self->_thumbnailData;
      self->_thumbnailData = v50;
    }
  }
  else
  {
    v20 = self->_thumbnailData;
    self->_thumbnailData = 0;
  }

  v52 = self->_thumbnailData;
  return v52;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataBlobInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bitmapDataBlobInfo, 0);
  objc_storeStrong((id *)&self->_bitmapData, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_cacheIndexDatabaseEnumerator, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
}

@end