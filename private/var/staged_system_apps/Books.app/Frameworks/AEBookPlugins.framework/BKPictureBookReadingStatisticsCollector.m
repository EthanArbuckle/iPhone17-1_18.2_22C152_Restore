@interface BKPictureBookReadingStatisticsCollector
+ (id)readingStatisticsCollectorWithAssetViewController:(id)a3;
- (AEAssetViewController)assetViewController;
- (BKPictureBookReadingStatisticsCollector)initWithAssetViewController:(id)a3;
- (BOOL)invalidated;
- (BOOL)needPiggyBackOperationForOrdinal:(unint64_t)a3;
- (NSDictionary)allNavigationInfosByOrdinal;
- (id)navigationInfoHrefsForOrdinal:(unint64_t)a3;
- (unint64_t)spineIndexInPackage;
- (void)invalidate;
- (void)renderingCacheOperationCompleted:(id)a3 textNodeCharacterCounts:(id)a4 cfisForHrefs:(id)a5;
- (void)setAllNavigationInfosByOrdinal:(id)a3;
- (void)setAssetViewController:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setSpineIndexInPackage:(unint64_t)a3;
- (void)setupWithBookInfo:(id)a3;
@end

@implementation BKPictureBookReadingStatisticsCollector

+ (id)readingStatisticsCollectorWithAssetViewController:(id)a3
{
  id v3 = a3;
  v4 = [[BKPictureBookReadingStatisticsCollectorWK2 alloc] initWithAssetViewController:v3];

  return v4;
}

- (BKPictureBookReadingStatisticsCollector)initWithAssetViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKPictureBookReadingStatisticsCollector;
  v5 = [(BKPictureBookReadingStatisticsCollector *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_assetViewController, v4);
  }

  return v6;
}

- (void)setupWithBookInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 spineIndexInPackage];
  v34 = self;
  -[BKPictureBookReadingStatisticsCollector setSpineIndexInPackage:](self, "setSpineIndexInPackage:", [v5 unsignedIntegerValue]);

  v6 = +[NSMutableDictionary dictionary];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v35 = v4;
  v7 = [v4 linearDocuments];
  id v8 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v13 = [v12 href];

        if (v13)
        {
          v14 = [v12 documentOrdinal];
          v15 = [v12 href];
          [v6 setObject:v14 forKeyedSubscript:v15];
        }
        else
        {
          v14 = BCReadingStatisticsLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_138138(&buf, v43, v14);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v9);
  }

  v16 = +[NSMutableDictionary dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [v35 chapters];
  id v17 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v39;
    uint64_t v36 = *(void *)v39;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
        v22 = [v21 baseHref];

        if (v22)
        {
          v23 = [v21 baseHref];
          v24 = [v6 objectForKeyedSubscript:v23];

          if (v24)
          {
            v25 = v6;
            v26 = [v16 objectForKeyedSubscript:v24];
            v27 = v26;
            if (v26)
            {
              id v28 = v26;
            }
            else
            {
              id v28 = +[NSMutableArray array];
            }
            v29 = v28;

            [v16 setObject:v29 forKeyedSubscript:v24];
            v48[0] = @"fullHref";
            v30 = [v21 href];
            v49[0] = v30;
            v48[1] = @"href";
            v31 = [v21 baseHref];
            v49[1] = v31;
            v48[2] = @"name";
            v32 = [v21 name];
            v49[2] = v32;
            v33 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
            [v29 addObject:v33];

            v6 = v25;
            uint64_t v19 = v36;
          }
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v18);
  }

  [(BKPictureBookReadingStatisticsCollector *)v34 setAllNavigationInfosByOrdinal:v16];
}

- (id)navigationInfoHrefsForOrdinal:(unint64_t)a3
{
  id v4 = [(BKPictureBookReadingStatisticsCollector *)self allNavigationInfosByOrdinal];
  v5 = +[NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  v7 = [v6 bu_arrayByInvokingBlock:&stru_1DD1A8];

  return v7;
}

- (void)renderingCacheOperationCompleted:(id)a3 textNodeCharacterCounts:(id)a4 cfisForHrefs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(BKPictureBookReadingStatisticsCollector *)self invalidated])
  {
    v11 = (char *)[v8 pageNumber] - 1;
    v12 = [(BKPictureBookReadingStatisticsCollector *)self assetViewController];
    v13 = [v12 assetViewControllerDelegate];
    if ([v13 needTOCEntriesForOrdinal:v11])
    {
      v14 = [(BKPictureBookReadingStatisticsCollector *)self allNavigationInfosByOrdinal];
      v15 = +[NSNumber numberWithInteger:v11];
      v16 = [v14 objectForKeyedSubscript:v15];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_C1428;
      v18[3] = &unk_1DCB00;
      id v19 = v10;
      id v17 = [v16 bu_arrayByInvokingBlock:v18];
      [v13 addTOCEntries:v17 ordinal:v11 completion:0];
    }
    if ([v13 needTextNodeCharacterCountsForOrdinal:v11]) {
      [v13 addTextNodeCharacterCounts:v9 ordinal:v11 completion:0];
    }
  }
}

- (BOOL)needPiggyBackOperationForOrdinal:(unint64_t)a3
{
  id v4 = [(BKPictureBookReadingStatisticsCollector *)self assetViewController];
  v5 = [v4 assetViewControllerDelegate];
  LOBYTE(a3) = [v5 needTextNodeCharacterCountsForOrdinal:a3];

  return a3;
}

- (void)invalidate
{
  [(BKPictureBookReadingStatisticsCollector *)self setAssetViewController:0];
  [(BKPictureBookReadingStatisticsCollector *)self setAllNavigationInfosByOrdinal:0];

  [(BKPictureBookReadingStatisticsCollector *)self setInvalidated:1];
}

- (unint64_t)spineIndexInPackage
{
  return self->_spineIndexInPackage;
}

- (void)setSpineIndexInPackage:(unint64_t)a3
{
  self->_spineIndexInPackage = a3;
}

- (AEAssetViewController)assetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetViewController);

  return (AEAssetViewController *)WeakRetained;
}

- (void)setAssetViewController:(id)a3
{
}

- (NSDictionary)allNavigationInfosByOrdinal
{
  return self->_allNavigationInfosByOrdinal;
}

- (void)setAllNavigationInfosByOrdinal:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allNavigationInfosByOrdinal, 0);

  objc_destroyWeak((id *)&self->_assetViewController);
}

@end