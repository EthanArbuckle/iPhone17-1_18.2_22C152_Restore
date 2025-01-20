@interface BKLibraryDataSourceAdaptor
- (BCUCoverEffectsEnvironment)coverEffectsEnvironment;
- (BKLibraryActionHandler)actionHandler;
- (BKLibraryBookshelfBooksDataSource)booksDataSource;
- (BKLibraryBookshelfSupplementaryDataSource)supplementaryDataSource;
- (BKLibraryDataSourceAdaptor)initWithBooksDataSource:(id)a3 supplementaryDataSource:(id)a4;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)coverAnimationSourceUseLargeCoverForLibraryAsset:(id)a3;
- (BOOL)isEditable;
- (BOOL)isItemPlayingAtIndexPath:(id)a3;
- (BOOL)shouldDragWithTouch:(id)a3;
- (CGRect)coverRectForLibraryAsset:(id)a3;
- (NSMutableDictionary)storage;
- (NSString)dataSourceID;
- (UICollectionView)collectionView;
- (double)bookCellHeightFor:(id)a3 editMode:(BOOL)a4 metrics:(id)a5 clearCache:(BOOL)a6;
- (id)_audioBookStatusForCell:(id)a3;
- (id)_nonContainerAssetsFrom:(id)a3;
- (id)bookImageProviderForLibraryAsset:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)coverAnimationSourceReferenceViewForLibraryAsset:(id)a3;
- (id)coverAnimationSourceViewForLibraryAsset:(id)a3;
- (id)coverImageForLibraryAsset:(id)a3;
- (id)indexPathForRepresentedObject:(id)a3;
- (id)representedObjectForIndexPath:(id)a3;
- (id)retrieveValueForKey:(id)a3 forConsumer:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)coverAnimationSourceAlignment;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)adjustHeight:(id)a3;
- (void)booksDataSource:(id)a3 insertedSections:(id)a4 deletedSections:(id)a5 insertedItems:(id)a6 deletedItems:(id)a7 updatedItems:(id)a8 mayHaveZeroObjects:(BOOL)a9;
- (void)booksDataSourceReloadAssetInfo:(id)a3;
- (void)booksDataSourceReloadAssetInfo:(id)a3 forAssetIDs:(id)a4;
- (void)booksDataSourceReloadAssetReviewData:(id)a3;
- (void)booksDataSourceReloadAssetReviewData:(id)a3 forAssetIDs:(id)a4;
- (void)collectionView:(id)a3 addAssets:(id)a4;
- (void)collectionView:(id)a3 addBookStoreItem:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)coverAnimationSourceFinalizeForLibraryAsset:(id)a3;
- (void)coverAnimationSourcePrepareForLibraryAsset:(id)a3;
- (void)invalidateLayoutFor:(id)a3;
- (void)registerClasses;
- (void)reloadData;
- (void)setActionHandler:(id)a3;
- (void)setBooksDataSource:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCoverEffectsEnvironment:(id)a3;
- (void)setStorage:(id)a3;
- (void)setSupplementaryDataSource:(id)a3;
- (void)storeValue:(id)a3 forKey:(id)a4 forConsumer:(id)a5;
@end

@implementation BKLibraryDataSourceAdaptor

- (BKLibraryDataSourceAdaptor)initWithBooksDataSource:(id)a3 supplementaryDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryDataSourceAdaptor;
  v8 = [(BKLibraryDataSourceAdaptor *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(BKLibraryDataSourceAdaptor *)v8 setBooksDataSource:v6];
    [(BKLibraryDataSourceAdaptor *)v9 setSupplementaryDataSource:v7];
    uint64_t v10 = +[NSMutableDictionary dictionary];
    storage = v9->_storage;
    v9->_storage = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);

  [(BKLibraryDataSourceAdaptor *)self registerClasses];
}

- (void)registerClasses
{
  v3 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:off_100B20020];

  v4 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:off_100B20028];

  v5 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:off_100B20030];

  id v6 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:off_100B20038];

  id v7 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v7 registerClass:objc_opt_class() forSupplementaryViewOfKind:off_100B20050 withReuseIdentifier:off_100B20040];

  v8 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v8 registerClass:objc_opt_class() forSupplementaryViewOfKind:off_100B20058 withReuseIdentifier:off_100B20040];

  v9 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v9 registerClass:objc_opt_class() forSupplementaryViewOfKind:off_100B20060 withReuseIdentifier:off_100B20040];

  uint64_t v10 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v10 registerClass:objc_opt_class() forSupplementaryViewOfKind:off_100B20068 withReuseIdentifier:off_100B20040];

  v11 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v11 registerClass:objc_opt_class() forSupplementaryViewOfKind:off_100B20070 withReuseIdentifier:off_100B20048];

  v12 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v12 registerClass:objc_opt_class() forSupplementaryViewOfKind:off_100B20078 withReuseIdentifier:off_100B20040];

  id v13 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v13 registerClass:objc_opt_class() forSupplementaryViewOfKind:off_100B20080 withReuseIdentifier:off_100B20040];
}

- (void)reloadData
{
  v3 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
  [v3 invalidateFRC];

  id v4 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
  [v4 reloadData];
}

- (id)representedObjectForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
  id v6 = [v5 representedObjectForIndexPath:v4];

  return v6;
}

- (id)indexPathForRepresentedObject:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
  id v6 = [v5 indexPathForRepresentedObject:v4];

  return v6;
}

- (BOOL)isEditable
{
  v2 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
  v3 = [v2 collection];

  LOBYTE(v2) = [v3 allowsManualAddition];
  return (char)v2;
}

- (NSString)dataSourceID
{
  v2 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
  v3 = [v2 collection];

  id v4 = [v3 collectionID];

  return (NSString *)v4;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  v3 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
  id v4 = [v3 numberOfSections];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v5 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
  id v6 = [v5 numberOfItemsInSection:a4];

  return (int64_t)v6;
}

- (BOOL)shouldDragWithTouch:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  v11 = [v10 hitTest:0 withEvent:v7, v9];

  v12 = BUProtocolCast();
  if (!v12)
  {
    id v13 = [v11 superview];
    v12 = BUProtocolCast();
  }
  unsigned __int8 v14 = [v12 shouldDragWithTouch:v4];

  return v14;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  double v8 = [(BKLibraryDataSourceAdaptor *)self representedObjectForIndexPath:v7];
  double v9 = BUDynamicCast();

  objc_opt_class();
  uint64_t v10 = [v6 layoutAttributesForItemAtIndexPath:v7];
  v11 = BUDynamicCast();

  id v12 = v9;
  v45 = v11;
  id v13 = [v11 cellMetrics];
  unsigned int v14 = [v13 cellType];

  if (v14 > 4) {
    v15 = 0;
  }
  else {
    v15 = *off_100A4AF90[v14];
  }
  v47 = v6;
  v44 = v15;
  v16 = [v6 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v7];
  v17 = BUProtocolCast();
  [v17 setStorageProvider:self];
  v18 = [(BKLibraryDataSourceAdaptor *)self coverEffectsEnvironment];
  [v17 setCoverEffectsEnvironment:v18];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v19 = BUDynamicCast();
    v20 = [(BKLibraryDataSourceAdaptor *)self actionHandler];
    [v19 setActionHandler:v20];

    v21 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
    [v19 setHasSeriesSequenceLabel:[v21 hasSeriesSequenceLabel]];
  }
  v22 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
  [v17 setDataSource:v22];

  [v17 setLibraryAsset:v12];
  [v17 setLayoutManager:self];
  v23 = [(BKLibraryDataSourceAdaptor *)self actionHandler];
  [v17 setupMenuWithLibraryAsset:v12 withActionHandler:v23];

  v24 = BUProtocolCast();
  if (v24)
  {
    v25 = [(BKLibraryDataSourceAdaptor *)self _audioBookStatusForCell:v17];
    objc_opt_class();
    v26 = BUClassAndProtocolCast();
    [v24 setAudiobookStatus:v26 &OBJC_PROTOCOL___AEAssetAudiobookStatus];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v27 = BUDynamicCast();
    id v28 = [(BKLibraryDataSourceAdaptor *)self actionHandler];
    [v27 setActionHandler:v28];
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v29 = BUDynamicCast();
    v30 = [(BKLibraryDataSourceAdaptor *)self actionHandler];
    [v29 setActionHandler:v30];

    v27 = [v12 assetID];
    v31 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1001DED54;
    v51[3] = &unk_100A4AEE8;
    id v52 = v29;
    v53 = self;
    id v28 = v29;
    v32 = [v31 assetReviewForAssetID:v27 completion:v51];
    [v28 setAssetReview:v32];

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v42 = BUDynamicCast();
    v43 = [(BKLibraryDataSourceAdaptor *)self actionHandler];
    [v42 setActionHandler:v43];
  }
LABEL_13:
  objc_opt_class();
  v33 = BUClassAndProtocolCast();
  if (objc_msgSend(v33, "needsAsset", &OBJC_PROTOCOL___BKLibraryBookshelfProductProfileCell))
  {
    uint64_t v34 = [v12 isAudiobook];
    v35 = [v12 assetID];
    v36 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1001DEE68;
    v48[3] = &unk_100A4AF10;
    id v49 = v16;
    id v50 = v33;
    [v36 resourceForAssetID:v35 type:v34 completion:v48];
  }
  v37 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  v38 = [v37 delegate];
  v39 = BUProtocolCast();
  objc_opt_class();
  v40 = BUDynamicCast();
  [v40 setDelegate:v39];

  return v16;
}

- (BOOL)isItemPlayingAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  id v6 = [v5 cellForItemAtIndexPath:v4];

  id v7 = BUProtocolCast();

  if (v7)
  {
    double v8 = [v7 audiobookStatus];
    unsigned __int8 v9 = [v8 assetAudiobookStatusIsPlaying];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)_audioBookStatusForCell:(id)a3
{
  id v4 = a3;
  v5 = [v4 libraryAsset];
  unsigned int v6 = [v5 isAudiobook];

  if (v6)
  {
    objc_opt_class();
    id v7 = [(BKLibraryDataSourceAdaptor *)self collectionView];
    double v8 = [v7 delegate];
    unsigned __int8 v9 = BUDynamicCast();

    uint64_t v10 = [v9 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKMinifiedPresenting];
    v11 = [v4 libraryAsset];
    id v12 = [v11 assetID];
    id v13 = [v10 minifiedPresenterAssetCurrentPresenterForAssetID:v12];

    unsigned int v14 = [v13 minifiedAssetStatus];
  }
  else
  {
    unsigned int v14 = 0;
  }

  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:off_100B20050]
    || [v9 isEqualToString:off_100B20058]
    || [v9 isEqualToString:off_100B20060])
  {
    id v11 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:off_100B20040 forIndexPath:v10];
    id v12 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
    [v11 setDataSource:v12];

    id v13 = [(BKLibraryDataSourceAdaptor *)self actionHandler];
    [v11 setActionHandler:v13];
LABEL_5:

    goto LABEL_6;
  }
  if ([v9 isEqualToString:off_100B20068])
  {
    id v11 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:off_100B20040 forIndexPath:v10];
    id v13 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
    [v11 setDataSource:v13];
    goto LABEL_5;
  }
  if ([v9 isEqualToString:off_100B20070])
  {
    id v11 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:off_100B20048 forIndexPath:v10];
    objc_opt_class();
    v15 = [(BKLibraryDataSourceAdaptor *)self representedObjectForIndexPath:v10];
    v16 = BUDynamicCast();

    v26 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
    id v28 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
    v27 = [v28 currentSortMode];
    v17 = [v27 sectionKeyPathForDisplay];
    v18 = [v17 componentsSeparatedByString:@"."];
    v19 = [v18 lastObject];
    v29 = v16;
    v20 = [v16 valueForKey:v19];
    v21 = [v26 stringFromSectionData:v20];

    [v11 setSectionName:v21];
    v22 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
    v23 = [v22 collection];
    v24 = [v23 collectionID];
    LODWORD(v19) = [v24 isEqualToString:kBKCollectionDefaultIDFinished];

    if (v19) {
      [v11 setBottomSeparator:1];
    }
  }
  else
  {
    if (([v9 isEqualToString:off_100B20078] & 1) != 0
      || [v9 isEqualToString:off_100B20080])
    {
      v25 = &off_100B20040;
    }
    else
    {
      v25 = &off_100B20048;
    }
    id v11 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:*v25 forIndexPath:v10];
  }
LABEL_6:

  return v11;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  id v4 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
  BOOL v5 = [v4 sortMode] == (id)6;

  return v5;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
  [v9 moveItemAtIndexPath:v8 toIndexPath:v7];
}

- (id)_nonContainerAssetsFrom:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isContainer", (void)v12) & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)collectionView:(id)a3 addAssets:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    id v6 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
    id v7 = [v6 collection];
    uint64_t v8 = [v7 collectionID];
    unsigned int v9 = [v8 isEqualToString:kBKCollectionDefaultIDFinished];

    if (v9)
    {
      id v27 = v5;
      id v10 = [(BKLibraryDataSourceAdaptor *)self _nonContainerAssetsFrom:v5];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = (char *)[v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11)
      {
        long long v12 = v11;
        long long v13 = 0;
        uint64_t v14 = *(void *)v29;
        do
        {
          long long v15 = 0;
          v16 = v13;
          do
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v10);
            }
            objc_opt_class();
            v17 = BUDynamicCast();
            [v17 setFinishedStateAddToFinishedCollection];
            objc_opt_class();
            v18 = [v17 managedObjectContext];
            long long v13 = BUDynamicCast();

            ++v15;
            v16 = v13;
          }
          while (v12 != v15);
          long long v12 = (char *)[v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v12);
      }
      else
      {
        long long v13 = 0;
      }
      [v13 setSaveContext:2];
      if ([v13 hasChanges]) {
        [v13 saveLibrary];
      }

      id v5 = v27;
    }
    else
    {
      v19 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
      v20 = [v19 collection];
      v21 = [v20 collectionID];
      unsigned int v22 = [v21 isEqualToString:kBKCollectionDefaultIDWantToRead];

      v23 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
      v24 = [v23 collection];
      v25 = v24;
      if (v22)
      {
        v26 = [(BKLibraryDataSourceAdaptor *)self _nonContainerAssetsFrom:v5];
        [v25 addLibraryAssets:v26];
      }
      else
      {
        [v24 addLibraryAssets:v5];
      }
    }
  }
}

- (void)collectionView:(id)a3 addBookStoreItem:(id)a4
{
  id v5 = a4;
  id v6 = +[BKLibraryManager defaultManager];
  id v7 = [v6 collectionController];

  uint64_t v8 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
  unsigned int v9 = [v8 collection];
  id v10 = [v9 collectionID];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001DFC18;
  v13[3] = &unk_100A43E90;
  id v14 = v5;
  id v15 = v10;
  id v11 = v10;
  id v12 = v5;
  [v7 addStoreID:v12 toCollectionID:v11 forceToTop:1 completion:v13];
}

- (id)bookImageProviderForLibraryAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
  id v6 = [v5 indexPathForRepresentedObject:v4];

  id v7 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  uint64_t v8 = [v7 cellForItemAtIndexPath:v6];

  objc_opt_class();
  unsigned int v9 = BUClassAndProtocolCast();

  return v9;
}

- (id)coverImageForLibraryAsset:(id)a3
{
  id v3 = [(BKLibraryDataSourceAdaptor *)self bookImageProviderForLibraryAsset:a3];
  id v4 = [v3 coverImage];

  return v4;
}

- (id)coverAnimationSourceViewForLibraryAsset:(id)a3
{
  id v3 = [(BKLibraryDataSourceAdaptor *)self bookImageProviderForLibraryAsset:a3];
  id v4 = [v3 coverView];

  return v4;
}

- (CGRect)coverRectForLibraryAsset:(id)a3
{
  id v4 = [(BKLibraryDataSourceAdaptor *)self bookImageProviderForLibraryAsset:a3];
  id v5 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  id v6 = [v5 superview];
  [v4 coverContainerFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [v4 contentView];
  [v6 convertRect:v15 fromView:v8 toView:v10];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)coverAnimationSourceReferenceViewForLibraryAsset:(id)a3
{
  id v3 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  id v4 = [v3 superview];

  return v4;
}

- (BOOL)coverAnimationSourceUseLargeCoverForLibraryAsset:(id)a3
{
  return 0;
}

- (void)coverAnimationSourcePrepareForLibraryAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v5 layoutIfNeeded];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  id v6 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  double v7 = [v6 subviews];

  double v8 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    double v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = BUProtocolCast();
        id v13 = [v12 libraryAsset];

        if (v13 == v4)
        {
          [v12 setCoverHidden:1];

          goto LABEL_11;
        }
      }
      double v9 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)coverAnimationSourceFinalizeForLibraryAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v5 layoutIfNeeded];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  id v6 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  double v7 = [v6 subviews];

  double v8 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    double v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = BUProtocolCast();
        id v13 = [v12 libraryAsset];

        if (v13 == v4)
        {
          [v12 setCoverHidden:0];

          goto LABEL_11;
        }
      }
      double v9 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (int64_t)coverAnimationSourceAlignment
{
  v2 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
  id v3 = [v2 viewMode];

  if (v3 == (id)1) {
    return 2;
  }
  else {
    return v3 == (id)2;
  }
}

- (void)adjustHeight:(id)a3
{
  id v14 = a3;
  id v4 = [v14 representedElementKind];
  unsigned int v5 = [v4 isEqualToString:off_100B20050];

  if (v5)
  {
    id v6 = BKLibraryBookshelfTitleHeader;
  }
  else
  {
    double v7 = [v14 representedElementKind];
    int v8 = [v7 isEqualToString:off_100B20058];

    if (v8) {
      goto LABEL_10;
    }
    double v9 = [v14 representedElementKind];
    unsigned int v10 = [v9 isEqualToString:off_100B20060];

    if (v10)
    {
      id v6 = BKLibraryBookshelfCollectionInfoHeader;
    }
    else
    {
      double v11 = [v14 representedElementKind];
      unsigned int v12 = [v11 isEqualToString:off_100B20068];

      if (!v12)
      {
        id v13 = [v14 representedElementKind];
        [v13 isEqualToString:off_100B20070];
        goto LABEL_9;
      }
      id v6 = BKLibraryBookshelfNoBooks;
    }
  }
  id v13 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
  [(__objc2_class *)v6 adjustHeight:v14 withDataSource:v13];
LABEL_9:

LABEL_10:
}

- (double)bookCellHeightFor:(id)a3 editMode:(BOOL)a4 metrics:(id)a5 clearCache:(BOOL)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  if (a3)
  {
    id v11 = a3;
    objc_opt_class();
    unsigned int v12 = [(BKLibraryDataSourceAdaptor *)self representedObjectForIndexPath:v11];

    BUDynamicCast();
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v13 = [(BKLibraryDataSourceAdaptor *)self supplementaryDataSource];
  id v14 = [v13 currentStoreAccountID];
  long long v15 = [v14 stringValue];

  long long v16 = [(BKLibraryDataSourceAdaptor *)self booksDataSource];
  long long v17 = [a3 assetID];
  double v18 = [v16 assetReviewForAssetID:v17];

  LOBYTE(v22) = a6;
  +[BKLibraryBookshelfFinishedBookCell bookCellHeightFor:a3 assetReview:v18 storeID:v15 editMode:v7 metrics:v10 storageProvider:self clearCache:v22];
  double v20 = v19;

  return v20;
}

- (void)storeValue:(id)a3 forKey:(id)a4 forConsumer:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BKLibraryDataSourceAdaptor *)self storage];
  id v11 = [v10 objectForKey:v9];

  if (!v11)
  {
    id v11 = +[NSMutableDictionary dictionary];
    unsigned int v12 = [(BKLibraryDataSourceAdaptor *)self storage];
    [v12 setObject:v11 forKey:v9];
  }
  [v11 setObject:v13 forKey:v8];
}

- (id)retrieveValueForKey:(id)a3 forConsumer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryDataSourceAdaptor *)self storage];
  id v9 = [v8 objectForKey:v6];

  id v10 = [v9 objectForKey:v7];

  return v10;
}

- (void)invalidateLayoutFor:(id)a3
{
  id v4 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  id v3 = [v4 collectionViewLayout];
  [v3 invalidateLayout];
}

- (void)booksDataSource:(id)a3 insertedSections:(id)a4 deletedSections:(id)a5 insertedItems:(id)a6 deletedItems:(id)a7 updatedItems:(id)a8 mayHaveZeroObjects:(BOOL)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  double v24 = sub_1001E083C;
  double v25 = &unk_100A454B0;
  id v17 = v14;
  id v26 = v17;
  id v18 = v13;
  id v27 = v18;
  id v19 = v16;
  id v28 = v19;
  id v20 = v15;
  BOOL v31 = a9;
  id v29 = v20;
  long long v30 = self;
  double v21 = objc_retainBlock(&v22);
  if (+[NSThread isMainThread]) {
    ((void (*)(void ***))v21[2])(v21);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);
  }
}

- (void)booksDataSourceReloadAssetInfo:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001E0B78;
  v4[3] = &unk_100A43D60;
  v4[4] = self;
  id v3 = objc_retainBlock(v4);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v3[2])(v3);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

- (void)booksDataSourceReloadAssetInfo:(id)a3 forAssetIDs:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E0C60;
  v5[3] = &unk_100A43DD8;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  +[UIView animateWithDuration:v5 animations:0.3];
}

- (void)booksDataSourceReloadAssetReviewData:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001E0F08;
  v4[3] = &unk_100A43D60;
  v4[4] = self;
  id v3 = objc_retainBlock(v4);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v3[2])(v3);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

- (void)booksDataSourceReloadAssetReviewData:(id)a3 forAssetIDs:(id)a4
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_1001E1020;
  id v10 = &unk_100A43DD8;
  id v11 = self;
  id v12 = a4;
  id v5 = v12;
  +[UIView animateWithDuration:&v7 animations:0.3];
  id v6 = [(BKLibraryDataSourceAdaptor *)self collectionView];
  [v6 performBatchUpdates:&stru_100A4AF50 completion:&stru_100A4AF70];
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (BKLibraryActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BKLibraryBookshelfBooksDataSource)booksDataSource
{
  return self->_booksDataSource;
}

- (void)setBooksDataSource:(id)a3
{
}

- (BKLibraryBookshelfSupplementaryDataSource)supplementaryDataSource
{
  return self->_supplementaryDataSource;
}

- (void)setSupplementaryDataSource:(id)a3
{
}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverEffectsEnvironment);

  return (BCUCoverEffectsEnvironment *)WeakRetained;
}

- (void)setCoverEffectsEnvironment:(id)a3
{
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_coverEffectsEnvironment);
  objc_storeStrong((id *)&self->_supplementaryDataSource, 0);
  objc_storeStrong((id *)&self->_booksDataSource, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end