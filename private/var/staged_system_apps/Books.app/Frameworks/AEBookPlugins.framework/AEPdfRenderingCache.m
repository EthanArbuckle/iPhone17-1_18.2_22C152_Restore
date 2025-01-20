@interface AEPdfRenderingCache
+ (void)purgeCacheForIdentifier:(id)a3;
- (id)cachePrefix;
- (id)thumbnailForPage:(int64_t)a3 asset:(id)a4 size:(CGSize)a5 renderingCacheCallbackTarget:(id)a6 renderingCacheCallbackContext:(id)a7 priority:(int64_t)a8 containerBounds:(CGRect)a9;
@end

@implementation AEPdfRenderingCache

+ (void)purgeCacheForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithIdentifier:v3 memorySize:0];

  [v4 clear];
}

- (id)cachePrefix
{
  return @"AEPdfRenderingCache";
}

- (id)thumbnailForPage:(int64_t)a3 asset:(id)a4 size:(CGSize)a5 renderingCacheCallbackTarget:(id)a6 renderingCacheCallbackContext:(id)a7 priority:(int64_t)a8 containerBounds:(CGRect)a9
{
  double height = a5.height;
  double width = a5.width;
  id v16 = a6;
  id v17 = a7;
  if ((unint64_t)(a3 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
  {
    id v18 = a4;
    v19 = [v18 assetID];
    v20 = [v18 url];

    if (v18)
    {
      id v18 = 0;
      if ([v19 length])
      {
        if (v20)
        {
          -[AEPdfRenderingCache scaleAdjustedImageSize:](self, "scaleAdjustedImageSize:", width, floor(height));
          double v22 = v21;
          double v24 = v23;
          v25 = [(AEPdfRenderingCache *)self keyPrefixForPage:a3];
          v26 = -[AEPdfRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v19, v25, v22, v24);
          id v18 = [(AEPdfRenderingCache *)self fetchImageForKey:v26];
          if (!v18)
          {
            [(AEPdfRenderingCache *)self primaryImageSize];
            -[AEPdfRenderingCache scaleAdjustedImageSize:](self, "scaleAdjustedImageSize:");
            double v28 = v27;
            double v30 = v29;
            v38 = v26;
            id v36 = [(AEPdfRenderingCache *)self selectorForTarget:v16];
            -[AEPdfRenderingCache findRenderingCacheOperationWithStorageKey:target:selector:context:](self, "findRenderingCacheOperationWithStorageKey:target:selector:context:", v26, v16);
            v31 = (AEPdfPageRenderingCacheOperation *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (!v31 || [(AEPdfPageRenderingCacheOperation *)v31 isCancelled])
            {
              v37 = v25;
              v33 = objc_alloc_init(AEPdfPageRenderingCacheOperation);

              [(AEPdfPageRenderingCacheOperation *)v33 setTarget:v16];
              [(AEPdfPageRenderingCacheOperation *)v33 setSelector:v36];
              [(AEPdfPageRenderingCacheOperation *)v33 setContext:v17];
              [(AEPdfPageRenderingCacheOperation *)v33 setImageCache:self];
              -[AEPdfPageRenderingCacheOperation setDesiredSize:](v33, "setDesiredSize:", v22, v24);
              [(AEPdfPageRenderingCacheOperation *)v33 setAssetID:v19];
              [(AEPdfPageRenderingCacheOperation *)v33 setStorageKey:v38];
              v34 = -[AEPdfRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v19, v37, v28, v30);
              [(AEPdfPageRenderingCacheOperation *)v33 setMasterImageKey:v34];

              [(AEPdfPageRenderingCacheOperation *)v33 setSerializeFormat:[(AEPdfRenderingCache *)self serializeFormat]];
              [(AEPdfPageRenderingCacheOperation *)v33 setUrl:v20];
              [(AEPdfPageRenderingCacheOperation *)v33 setPageNumber:a3];
              [(AEPdfPageRenderingCacheOperation *)v33 setQueuePriority:a8];
              [(AEPdfRenderingCache *)self enqueueRenderingCacheOperation:v33];
              v32 = v33;
              v25 = v37;
            }

            v26 = v38;
          }
        }
      }
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

@end