@interface AEPictureBookRenderingCache
+ (Class)operationClass;
- (AEPaginatedBookSnapshotWebViewBuilder)webViewBuilder;
- (AEPictureBookRenderingCache)initWithIdentifier:(id)a3 configuration:(id)a4 webViewBuilder:(id)a5;
- (AEPictureBookRenderingPiggyBack)renderingPiggyBack;
- (BKPictureBookViewGeometry)layoutGeometry;
- (BKThumbnailBookViewConfiguring)configuration;
- (id)_applyMaskAndGutter:(CGImage *)a3 isRight:(BOOL)a4 contentSize:(CGSize)a5 containerBounds:(CGRect)a6;
- (id)_scheduleRenderWithKey:(id)a3 options:(unint64_t)a4 size:(CGSize)a5 bookInfoSnapshot:(id)a6 documentUrl:(id)a7 pageNumber:(int64_t)a8 priority:(int64_t)a9 target:(id)a10 context:(id)a11;
- (id)anySnapshotForBookInfo:(id)a3 pageNumber:(int64_t)a4 containerBounds:(CGRect)a5;
- (id)generateMasterImageForPageNumber:(int64_t)a3 asset:(id)a4 priority:(int64_t)a5 callbackBlock:(id)a6;
- (id)persistentCacheFileName;
- (id)thumbnailForPage:(int64_t)a3 asset:(id)a4 size:(CGSize)a5 renderingCacheCallbackTarget:(id)a6 renderingCacheCallbackContext:(id)a7 priority:(int64_t)a8 containerBounds:(CGRect)a9;
- (id)upsellThumbnailForAsset:(id)a3 size:(CGSize)a4;
- (id)whitePageForSize:(CGSize)a3 right:(BOOL)a4 scale:(double)a5 contentSize:(CGSize)a6 applyMaskAndGutter:(BOOL)a7 containerBounds:(CGRect)a8;
- (int64_t)upsellPageNumber;
- (void)_gotSnapshotWithMask:(BOOL)a3 bookInfo:(id)a4 containerBounds:(CGRect)a5 contentSize:(CGSize)a6 isRight:(BOOL)a7 key:(id)a8 pageNumber:(int64_t)a9 snapshot:(id)a10 scale:(double)a11 size:(CGSize)a12 completion:(id)a13;
- (void)_uncheckedSnapshotWithMask:(BOOL)a3 assetID:(id)a4 bookInfo:(id)a5 containerBounds:(CGRect)a6 contentSize:(CGSize)a7 isRight:(BOOL)a8 pageNumber:(int64_t)a9 scale:(double)a10 size:(CGSize)a11 completion:(id)a12;
- (void)generateSnapshotWithAsset:(id)a3 size:(CGSize)a4 pageNumber:(int64_t)a5;
- (void)renderQueuesEmptied;
- (void)renderingPiggyBackForPageNumber:(int64_t)a3 asset:(id)a4 priority:(int64_t)a5;
- (void)setConfiguration:(id)a3;
- (void)setLayoutGeometry:(id)a3;
- (void)setRenderingPiggyBack:(id)a3;
- (void)setUpsellPageNumber:(int64_t)a3;
- (void)setWebViewBuilder:(id)a3;
- (void)snapshotForBookInfo:(id)a3 pageNumber:(int64_t)a4 size:(CGSize)a5 maxSize:(CGSize)a6 isRight:(BOOL)a7 zoomScale:(double)a8 applyMaskAndGutter:(BOOL)a9 containerBounds:(CGRect)a10 completion:(id)a11;
@end

@implementation AEPictureBookRenderingCache

- (AEPictureBookRenderingCache)initWithIdentifier:(id)a3 configuration:(id)a4 webViewBuilder:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AEPictureBookRenderingCache;
  v11 = [(AEHTMLBookRenderingCache *)&v14 initWithIdentifier:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    objc_storeWeak((id *)&v12->_webViewBuilder, v10);
    v12->_upsellPageNumber = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (id)persistentCacheFileName
{
  v2 = [(AEPictureBookRenderingCache *)self identifier];
  v3 = +[NSString stringWithFormat:@"%@-%@", v2, @"v20210729"];

  return v3;
}

- (id)upsellThumbnailForAsset:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = [v7 sampleContent];
  unsigned int v9 = [v8 BOOLValue];

  id v10 = &stru_1DF0D8;
  if (v9) {
    id v10 = @"sample";
  }
  v11 = v10;
  v12 = [v7 assetID];

  v13 = -[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v12, v11, width, height);

  objc_super v14 = [(AEPictureBookRenderingCache *)self fetchImageForKey:v13];
  if (!v14)
  {
    v15 = +[UIGraphicsImageRendererFormat preferredFormat];
    id v16 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v15 format:width, height];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_D8D14;
    v19[3] = &unk_1DD450;
    double v21 = width;
    double v22 = height;
    id v20 = v15;
    id v17 = v15;
    objc_super v14 = [v16 imageWithActions:v19];
    -[AEPictureBookRenderingCache storeImage:forKey:size:format:](self, "storeImage:forKey:size:format:", v14, v13, [(AEPictureBookRenderingCache *)self serializeFormat], width, height);
  }

  return v14;
}

+ (Class)operationClass
{
  return (Class)objc_opt_class();
}

- (void)generateSnapshotWithAsset:(id)a3 size:(CGSize)a4 pageNumber:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  if ((unint64_t)(a5 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
  {
    float v10 = height;
    double v11 = floorf(v10);
    id v20 = v9;
    v12 = [(AEPictureBookRenderingCache *)self keyPrefixForPage:a5];
    v13 = [v20 assetID];
    objc_super v14 = -[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v13, v12, width, v11);

    if (([(AEPictureBookRenderingCache *)self hasImageForKey:v14] & 1) == 0)
    {
      v15 = [v20 documentWithOrdinal:a5 - 1];
      id v16 = [v20 urlForDocument:v15];
      if (v16)
      {
        if ([v20 shouldDisableOptimizeSpeed]) {
          uint64_t v17 = 0x10000;
        }
        else {
          uint64_t v17 = 0;
        }
        v18 = +[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:v20 ordinal:a5 - 1];
        id v19 = -[AEPictureBookRenderingCache _scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:](self, "_scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:", v14, v17, v18, v16, a5, 4, width, v11, 0, 0);
      }
    }

    id v9 = v20;
  }
}

- (id)_scheduleRenderWithKey:(id)a3 options:(unint64_t)a4 size:(CGSize)a5 bookInfoSnapshot:(id)a6 documentUrl:(id)a7 pageNumber:(int64_t)a8 priority:(int64_t)a9 target:(id)a10 context:(id)a11
{
  double height = a5.height;
  double width = a5.width;
  id v19 = a3;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a11;
  if ([(AEPictureBookRenderingCache *)self hasImageForKey:v19])
  {
    v24 = 0;
  }
  else
  {
    int64_t v31 = a9;
    v25 = [(AEPictureBookRenderingCache *)self findRenderingCacheOperationWithStorageKey:v19 target:0 selector:0 context:0];
    objc_opt_class();
    v26 = BUDynamicCast();
    if (v25 && ![v25 isCancelled])
    {
      if (v26) {
        [v25 addExtraCompletion:v26];
      }
      v24 = v25;
    }
    else
    {
      v24 = +[AEPictureBookRenderingCacheOperation2 renderCacheWithOptions:a4];

      [v24 setSelector:0];
      [v24 setContext:v23];
      [v24 setPageNumber:a8];
      v27 = [(AEPictureBookRenderingCache *)self renderingPiggyBack];
      [v24 setPiggyBack:v27];

      [v24 setUrl:v21];
      [v24 setBookInfoSnapshot:v20];
      v28 = [v20 assetID];
      [v24 setAssetID:v28];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
      [v24 setWebViewBuilder:WeakRetained];

      [v24 setSnapshotSize:width, height];
      [v24 setTarget:v22];
      if (v26) {
        [v24 addExtraCompletion:v26];
      }
      [v24 setImageCache:self];
      [v24 setDesiredSize:width, height];
      [v24 setStorageKey:v19];
      [v24 setMasterImageKey:0];
      [v24 setSerializeFormat:[self serializeFormat]];
      [v24 setQueuePriority:v31];
      [(AEPictureBookRenderingCache *)self enqueueRenderingCacheOperation:v24];
    }
  }

  return v24;
}

- (id)thumbnailForPage:(int64_t)a3 asset:(id)a4 size:(CGSize)a5 renderingCacheCallbackTarget:(id)a6 renderingCacheCallbackContext:(id)a7 priority:(int64_t)a8 containerBounds:(CGRect)a9
{
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a9.origin.y;
  double x = a9.origin.x;
  double v16 = a5.height;
  double v17 = a5.width;
  id v20 = a4;
  id v21 = a6;
  id v22 = a7;
  if ((unint64_t)(a3 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
  {
    v24 = [v20 assetID];
    v25 = [v20 url];
    if (v20)
    {
      id v23 = 0;
      if ([v24 length] && v25)
      {
        unsigned int v26 = [v20 shouldDisableOptimizeSpeed];
        id v23 = 0;
        uint64_t v27 = 0x10000;
        if (!v26) {
          uint64_t v27 = 0;
        }
        float v28 = v16;
        float v29 = floorf(v28);
        float v30 = v17;
        float v31 = floorf(v30);
        if (v29 > 1.0 && v31 > 1.0)
        {
          uint64_t v84 = v27;
          int64_t v86 = a8;
          double v33 = v31;
          double v34 = v29;
          -[AEPictureBookRenderingCache scaleAdjustedImageSize:](self, "scaleAdjustedImageSize:", v31, v29);
          double v36 = v35;
          double v38 = v37;
          [(AEPictureBookRenderingCache *)self keyPrefixForPage:a3];
          v40 = int64_t v39 = a3;
          v41 = -[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v24, v40, v36, v38);
          id v23 = -[AEHTMLBookRenderingCache _fetchImageForKey:size:](self, "_fetchImageForKey:size:", v41, v33, v34);
          id v42 = v20;
          if (!v23)
          {
            double v80 = v38;
            double v81 = v36;
            v88 = (char *)v39;
            v73 = v25;
            id v74 = v22;
            id v75 = v21;
            id v76 = v20;
            v43 = v42;
            [(AEPictureBookRenderingCache *)self primaryImageSize];
            double v45 = v44;
            *(float *)&double v44 = v46;
            double v47 = floorf(*(float *)&v44);
            v48 = +[IMPersistentCacheManager sharedInstance];
            v49 = [(AEPictureBookRenderingCache *)self persistentCachePath];
            v89 = [v48 cacheForPath:v49 maxSize:0];

            v50 = [(AEPictureBookRenderingCache *)self configuration];
            id v87 = v43;
            v51 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v50, [v43 hidesSpine] ^ 1, v45, v47, x, y, width, height);

            v79 = v51;
            v52 = [v51 sizes];
            v90 = -[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v24, v40, v45, v47);
            long long v92 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            id obj = v52;
            id v53 = [obj countByEnumeratingWithState:&v92 objects:v96 count:16];
            if (v53)
            {
              id v54 = v53;
              char v55 = 0;
              uint64_t v56 = *(void *)v93;
              do
              {
                for (i = 0; i != v54; i = (char *)i + 1)
                {
                  if (*(void *)v93 != v56) {
                    objc_enumerationMutation(obj);
                  }
                  v58 = *(void **)(*((void *)&v92 + 1) + 8 * i);
                  [v58 CGSizeValue];
                  v59 = -[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v24, v40);
                  if ((unint64_t)[v41 compare:v59] + 1 <= 1
                    && [v89 hasItemForKey:v59])
                  {
                    [v58 CGSizeValue];
                    double v45 = v60;
                    double v47 = v61;
                    id v62 = v59;

                    char v55 = 1;
                    v90 = v62;
                  }
                }
                id v54 = [obj countByEnumeratingWithState:&v92 objects:v96 count:16];
              }
              while (v54);
            }
            else
            {
              char v55 = 0;
            }

            uint64_t v63 = [v87 documentWithOrdinal:v88 - 1];
            v83 = [v87 urlForDocument:v63];
            v78 = (void *)v63;
            if ((v55 & 1) == 0 && [v41 compare:v90] == (id)-1)
            {
              v72 = +[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:v87 ordinal:v88 - 1];
              id v22 = v74;
              id v21 = v75;
              v82 = -[AEPictureBookRenderingCache _scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:](self, "_scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:", v90, v84, v72, v83, v88, v86, v45, v47, v75, v74);
              [v82 setPageNumber:v88];

              id v20 = v76;
            }
            else
            {
              v82 = 0;
              id v21 = v75;
              id v20 = v76;
              id v22 = v74;
            }
            v25 = v73;
            id v64 = [(AEPictureBookRenderingCache *)self selectorForTarget:v21];
            v65 = [(AEPictureBookRenderingCache *)self findRenderingCacheOperationWithStorageKey:v41 target:v21 selector:v64 context:v22];
            v66 = v65;
            if (v65 && ![v65 isCancelled])
            {
              v67 = v66;
            }
            else
            {
              +[AEPictureBookRenderingCacheOperation2 renderCacheWithOptions:v84];
              v67 = id v77 = v64;

              v85 = +[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:v87 ordinal:v88 - 1];
              [v67 setBookInfoSnapshot:];
              id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
              [v67 setWebViewBuilder:WeakRetained];

              [v67 setSnapshotSize:v33, v34];
              [v67 setPageNumber:v88];
              [v67 setUrl:v83];
              [v67 setTarget:v21];
              [v67 setSelector:v77];
              [v67 setContext:v22];
              [v67 setImageCache:self];
              [v67 setDesiredSize:v81, v80];
              [v67 setAssetID:v24];
              [v67 setStorageKey:v41];
              [v67 setMasterImageKey:v90];
              [v67 setSerializeFormat:[self serializeFormat]];
              [v67 setQueuePriority:v86];
              if (v82) {
                [v67 addDependency:];
              }
              [(AEPictureBookRenderingCache *)self enqueueRenderingCacheOperation:v67];
            }
            v69 = +[IMPersistentCacheManager sharedInstance];
            v70 = [(AEPictureBookRenderingCache *)self persistentCachePath];
            [v69 purgeFromCache:v70];

            if ((char *)[(AEPictureBookRenderingCache *)self upsellPageNumber] == v88)
            {
              id v23 = -[AEPictureBookRenderingCache upsellThumbnailForAsset:size:](self, "upsellThumbnailForAsset:size:", v87, v33, v34);
            }
            else
            {
              id v23 = 0;
            }
            id v42 = v87;
          }
        }
      }
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)anySnapshotForBookInfo:(id)a3 pageNumber:(int64_t)a4 containerBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  v12 = v11;
  if ((unint64_t)(a4 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v18 = 0;
  }
  else
  {
    v13 = [v11 assetID];
    [v12 fixedLayoutSizeForDocumentWithOrdinal:a4 - 1];
    double v15 = v14;
    double v17 = v16;
    v18 = 0;
    if ([v13 length] && v15 > 0.0 && v17 > 0.0)
    {
      [(AEPictureBookRenderingCache *)self primaryImageSize];
      double v20 = v19;
      double v22 = v21;
      id v23 = [(AEPictureBookRenderingCache *)self keyPrefixForPage:a4];
      v24 = -[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v13, v23, v20, v22);
      uint64_t v25 = [(AEPictureBookRenderingCache *)self fetchImageForKey:v24];
      if (v25)
      {
        v18 = (void *)v25;
      }
      else
      {
        unsigned int v26 = [(AEPictureBookRenderingCache *)self configuration];
        uint64_t v27 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v26, [v12 hidesSpine] ^ 1, v15, v17, x, y, width, height);

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        float v28 = [v27 sizes];
        id v29 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v29)
        {
          id v30 = v29;
          double v36 = v27;
          uint64_t v31 = *(void *)v38;
          while (2)
          {
            v32 = 0;
            double v33 = v24;
            do
            {
              if (*(void *)v38 != v31) {
                objc_enumerationMutation(v28);
              }
              [*(id *)(*((void *)&v37 + 1) + 8 * (void)v32) CGSizeValue];
              v24 = -[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v13, v23);

              uint64_t v34 = [(AEPictureBookRenderingCache *)self fetchImageForKey:v24];
              if (v34)
              {
                v18 = (void *)v34;
                goto LABEL_18;
              }
              v32 = (char *)v32 + 1;
              double v33 = v24;
            }
            while (v30 != v32);
            id v30 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
            if (v30) {
              continue;
            }
            break;
          }
          v18 = 0;
LABEL_18:
          uint64_t v27 = v36;
        }
        else
        {
          v18 = 0;
        }
      }
    }
  }

  return v18;
}

- (void)snapshotForBookInfo:(id)a3 pageNumber:(int64_t)a4 size:(CGSize)a5 maxSize:(CGSize)a6 isRight:(BOOL)a7 zoomScale:(double)a8 applyMaskAndGutter:(BOOL)a9 containerBounds:(CGRect)a10 completion:(id)a11
{
  BOOL v12 = a9;
  BOOL v13 = a7;
  double height = a5.height;
  double width = a5.width;
  id v18 = a3;
  double v19 = (void (**)(id, void *))a11;
  [v18 fixedLayoutSizeForDocumentWithOrdinal:a4 - 1];
  double v21 = v20;
  double v23 = v22;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    uint64_t v27 = _AELog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "Requesting zero size snapshot", buf, 2u);
    }

    unsigned int v26 = -[AEPictureBookRenderingCache whitePageForSize:right:scale:contentSize:applyMaskAndGutter:containerBounds:](self, "whitePageForSize:right:scale:contentSize:applyMaskAndGutter:containerBounds:", v13, v12, width, height, a8, v21, v23, *(void *)&a10.origin.x, *(void *)&a10.origin.y, *(void *)&a10.size.width, *(void *)&a10.size.height);
    v19[2](v19, v26);
  }
  else
  {
    uint64_t v25 = [v18 assetID];
    unsigned int v26 = v25;
    if ((unint64_t)a4 <= 0x7FFFFFFFFFFFFFFELL && [v25 length])
    {
      -[AEPictureBookRenderingCache _uncheckedSnapshotWithMask:assetID:bookInfo:containerBounds:contentSize:isRight:pageNumber:scale:size:completion:](self, "_uncheckedSnapshotWithMask:assetID:bookInfo:containerBounds:contentSize:isRight:pageNumber:scale:size:completion:", v12, v26, v18, v13, a4, v19, a10.origin.x, a10.origin.y, a10.size.width, a10.size.height, v21, v23, a8, *(void *)&width, *(void *)&height);
    }
    else
    {
      float v28 = _AELog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        int64_t v31 = a4;
        __int16 v32 = 2112;
        double v33 = v26;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "snapshot needs pageNumber and assetID. pageNumber: %ld. assetID: %@", buf, 0x16u);
      }

      v19[2](v19, 0);
    }
  }
}

- (void)_uncheckedSnapshotWithMask:(BOOL)a3 assetID:(id)a4 bookInfo:(id)a5 containerBounds:(CGRect)a6 contentSize:(CGSize)a7 isRight:(BOOL)a8 pageNumber:(int64_t)a9 scale:(double)a10 size:(CGSize)a11 completion:(id)a12
{
  BOOL v14 = a8;
  double height = a7.height;
  double width = a7.width;
  double v18 = a6.size.height;
  double v19 = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v22 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a12;
  uint64_t v27 = [(AEPictureBookRenderingCache *)self keyPrefixForPage:a9];
  float v28 = -[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v24, v27, a11.width, a11.height);
  id v29 = -[AEHTMLBookRenderingCache _fetchImageForKey:size:](self, "_fetchImageForKey:size:", v28, a11.width, a11.height);
  if (v29)
  {
    -[AEPictureBookRenderingCache _gotSnapshotWithMask:bookInfo:containerBounds:contentSize:isRight:key:pageNumber:snapshot:scale:size:completion:](self, "_gotSnapshotWithMask:bookInfo:containerBounds:contentSize:isRight:key:pageNumber:snapshot:scale:size:completion:", v22, v25, v14, v28, a9, v29, x, y, v19, v18, width, height, a10, *(void *)&a11.width, *(void *)&a11.height, v26);
  }
  else
  {
    id v40 = v24;
    long long v37 = [v25 documentWithOrdinal:a9 - 1];
    long long v39 = [v25 urlForDocument:];
    unsigned int v30 = [v25 shouldDisableOptimizeSpeed];
    uint64_t v31 = 0x10000;
    if (!v30) {
      uint64_t v31 = 0;
    }
    uint64_t v38 = v31;
    uint64_t v32 = +[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:v25 ordinal:a9 - 1];
    objc_initWeak(location, self);
    id v41 = objc_alloc((Class)BCRenderingCacheBlockCallback);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_DA268;
    v44[3] = &unk_1DD478;
    objc_copyWeak(v48, location);
    BOOL v50 = v22;
    id v45 = v25;
    v48[1] = *(id *)&x;
    v48[2] = *(id *)&y;
    v48[3] = *(id *)&v19;
    v48[4] = *(id *)&v18;
    v48[5] = *(id *)&width;
    v48[6] = *(id *)&height;
    BOOL v51 = v14;
    id v33 = v28;
    id v46 = v33;
    v48[7] = (id)a9;
    v48[8] = *(id *)&a10;
    CGSize v49 = a11;
    id v47 = v26;
    id v34 = [v41 initWithCompletion:v44];
    id v35 = -[AEPictureBookRenderingCache _scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:](self, "_scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:", v33, v38, v32, v39, a9, 4, a11.width, a11.height, v34, v34);
    double v36 = (void *)v32;
    id v24 = v40;

    objc_destroyWeak(v48);
    objc_destroyWeak(location);
  }
}

- (void)_gotSnapshotWithMask:(BOOL)a3 bookInfo:(id)a4 containerBounds:(CGRect)a5 contentSize:(CGSize)a6 isRight:(BOOL)a7 key:(id)a8 pageNumber:(int64_t)a9 snapshot:(id)a10 scale:(double)a11 size:(CGSize)a12 completion:(id)a13
{
  BOOL v16 = a7;
  double height = a6.height;
  double width = a6.width;
  double v19 = a5.size.height;
  double v20 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v23 = a3;
  id v30 = a4;
  id v25 = a8;
  id v26 = a10;
  uint64_t v27 = (void (**)(id, id))a13;
  if (!v26)
  {
    -[AEPictureBookRenderingCache anySnapshotForBookInfo:pageNumber:containerBounds:](self, "anySnapshotForBookInfo:pageNumber:containerBounds:", v30, a9, x, y, v20, v19);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v23 && v26)
  {
    id v28 = v26;
    -[AEPictureBookRenderingCache _applyMaskAndGutter:isRight:contentSize:containerBounds:](self, "_applyMaskAndGutter:isRight:contentSize:containerBounds:", [v28 CGImage], v16, width, height, x, y, v20, v19);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v26)
  {
    -[AEPictureBookRenderingCache whitePageForSize:right:scale:contentSize:applyMaskAndGutter:containerBounds:](self, "whitePageForSize:right:scale:contentSize:applyMaskAndGutter:containerBounds:", v16, v23, a12.width, a12.height, a11, width, height, *(void *)&x, *(void *)&y, *(void *)&v20, *(void *)&v19);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27[2](v27, v26);
}

- (id)generateMasterImageForPageNumber:(int64_t)a3 asset:(id)a4 priority:(int64_t)a5 callbackBlock:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = (void (**)(void, void))v11;
  BOOL v13 = 0;
  if (a3 >= 1 && v10 && v11)
  {
    BOOL v14 = [v10 assetID];
    if ([v14 length])
    {
      double v15 = [v10 url];

      if (!v15)
      {
        BOOL v13 = 0;
        goto LABEL_16;
      }
      [(AEPictureBookRenderingCache *)self primaryImageSize];
      double v17 = v16;
      double v19 = v18;
      BOOL v14 = -[AEHTMLBookRenderingCache _keyForAsset:size:pageNumber:](self, "_keyForAsset:size:pageNumber:", v10, a3);
      double v20 = [(AEPictureBookRenderingCache *)self fetchImageForKey:v14];
      if (v20)
      {
        ((void (**)(void, void *))v12)[2](v12, v20);
        BOOL v13 = 0;
      }
      else
      {
        id v29 = [v10 documentWithOrdinal:a3 - 1];
        id v28 = [v10 urlForDocument:v29];
        double v21 = [[AEBookRenderingCallbackTarget alloc] initWithCallbackBlock:v12];
        if ([v10 shouldDisableOptimizeSpeed]) {
          uint64_t v22 = 0x10000;
        }
        else {
          uint64_t v22 = 0;
        }
        BOOL v13 = +[AEPictureBookRenderingCacheOperation2 renderCacheWithOptions:v22];
        [v13 setTarget:v21];
        [v13 setSelector:[self selectorForTarget:v21]];
        [v13 setContext:v21];
        uint64_t v27 = +[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:v10 ordinal:a3 - 1];
        [v13 setBookInfoSnapshot:v27];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
        [v13 setWebViewBuilder:WeakRetained];

        [v13 setSnapshotSize:v17, v19];
        [v13 setPageNumber:a3];
        id v24 = [(AEPictureBookRenderingCache *)self renderingPiggyBack];
        [v13 setPiggyBack:v24];

        [v13 setUrl:v28];
        [v13 setImageCache:self];
        [v13 setDesiredSize:v17, v19];
        id v25 = [v10 assetID];
        [v13 setAssetID:v25];

        [v13 setStorageKey:v14];
        [v13 setSerializeFormat:[self serializeFormat]];
        [v13 setQueuePriority:a5];
        [(AEPictureBookRenderingCache *)self enqueueRenderingCacheOperation:v13];
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
LABEL_16:

  return v13;
}

- (void)renderingPiggyBackForPageNumber:(int64_t)a3 asset:(id)a4 priority:(int64_t)a5
{
  id v17 = a4;
  v8 = [(AEPictureBookRenderingCache *)self renderingPiggyBack];
  unsigned int v9 = [v8 needPiggyBackOperationForOrdinal:a3 - 1];

  if (v9)
  {
    id v10 = [v17 documentWithOrdinal:a3 - 1];
    id v11 = [v17 urlForDocument:v10];
    if ([v17 shouldDisableOptimizeSpeed]) {
      uint64_t v12 = 0x10000;
    }
    else {
      uint64_t v12 = 0;
    }
    BOOL v13 = +[AEPictureBookRenderingCacheOperation2 renderCacheWithOptions:v12];
    BOOL v14 = +[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:v17 ordinal:a3 - 1];
    [v13 setBookInfoSnapshot:v14];

    [v13 setPageNumber:a3];
    double v15 = [(AEPictureBookRenderingCache *)self renderingPiggyBack];
    [v13 setPiggyBack:v15];

    [v13 setUrl:v11];
    [v13 setImageCache:self];
    [v13 setDesiredSize:100.0, 100.0];
    double v16 = [v17 assetID];
    [v13 setAssetID:v16];

    [v13 setStorageKey:0];
    [v13 setSerializeFormat:[self serializeFormat]];
    [v13 setQueuePriority:a5];
    [(AEPictureBookRenderingCache *)self enqueueRenderingCacheOperation:v13];
  }
}

- (id)whitePageForSize:(CGSize)a3 right:(BOOL)a4 scale:(double)a5 contentSize:(CGSize)a6 applyMaskAndGutter:(BOOL)a7 containerBounds:(CGRect)a8
{
  BOOL v8 = a7;
  double height = a6.height;
  double width = a6.width;
  BOOL v11 = a4;
  CGFloat v12 = a3.height;
  CGFloat v13 = a3.width;
  uint64_t v15 = NSStringFromCGSize(a3);
  double v16 = (void *)v15;
  CFStringRef v17 = @"left";
  if (v11) {
    CFStringRef v17 = @"right";
  }
  CFStringRef v18 = &stru_1DF0D8;
  if (v8) {
    CFStringRef v18 = @"-m";
  }
  double v19 = +[NSString stringWithFormat:@"white-%@-%@-%0.5f%@", v15, v17, *(void *)&a5, v18];

  double v20 = [(AEPictureBookRenderingCache *)self fetchImageForKey:v19];
  if (!v20)
  {
    [(AEPictureBookRenderingCache *)self scale];
    CGFloat v23 = v22;
    v32.double width = v13;
    v32.double height = v12;
    UIGraphicsBeginImageContextWithOptions(v32, 0, v23);
    CurrentContext = UIGraphicsGetCurrentContext();
    id v25 = +[UIColor whiteColor];
    [v25 set];

    v33.origin.double x = 0.0;
    v33.origin.double y = 0.0;
    v33.size.double width = v13;
    v33.size.double height = v12;
    CGContextFillRect(CurrentContext, v33);
    id v26 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (v8)
    {
      -[AEPictureBookRenderingCache _applyMaskAndGutter:isRight:contentSize:containerBounds:](self, "_applyMaskAndGutter:isRight:contentSize:containerBounds:", [v26 CGImage], v11, width, height, a8.origin.x, a8.origin.y, a8.size.width, a8.size.height);
      uint64_t v27 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v27 = v26;
    }
    double v20 = v27;
    id v28 = UIImagePNGRepresentation(v27);
    if ([v28 length]) {
      -[AEPictureBookRenderingCache storeImage:forKey:size:format:](self, "storeImage:forKey:size:format:", v20, v19, 0, width, height);
    }
  }

  return v20;
}

- (id)_applyMaskAndGutter:(CGImage *)a3 isRight:(BOOL)a4 contentSize:(CGSize)a5 containerBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v10 = a5.height;
  double v11 = a5.width;
  BOOL v12 = a4;
  double v15 = (double)CGImageGetWidth(a3);
  double v16 = (double)CGImageGetHeight(a3);
  CFStringRef v17 = [(AEPictureBookRenderingCache *)self configuration];
  CFStringRef v18 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v17, 1, v11, v10, x, y, width, height);

  [v18 scaleForSize:v15, v16];
  double v20 = v19;
  id v21 = +[UIImage imageNamed:@"PictureBookSpine.png"];
  double v22 = CGImageAddAlphaAndAddBookMask(a3, (CGImage *)[v21 CGImage], v12, v20);

  CGFloat v23 = +[UIImage imageWithCGImage:v22];
  CGImageRelease(v22);

  return v23;
}

- (void)renderQueuesEmptied
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
  [WeakRetained finishedSnapshottingForCache:self];
}

- (int64_t)upsellPageNumber
{
  return self->_upsellPageNumber;
}

- (void)setUpsellPageNumber:(int64_t)a3
{
  self->_upsellPageNumber = a3;
}

- (BKPictureBookViewGeometry)layoutGeometry
{
  return self->_layoutGeometry;
}

- (void)setLayoutGeometry:(id)a3
{
}

- (AEPictureBookRenderingPiggyBack)renderingPiggyBack
{
  return self->_renderingPiggyBack;
}

- (void)setRenderingPiggyBack:(id)a3
{
}

- (BKThumbnailBookViewConfiguring)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (AEPaginatedBookSnapshotWebViewBuilder)webViewBuilder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);

  return (AEPaginatedBookSnapshotWebViewBuilder *)WeakRetained;
}

- (void)setWebViewBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webViewBuilder);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_renderingPiggyBack, 0);

  objc_storeStrong((id *)&self->_layoutGeometry, 0);
}

@end