@interface UGCPlaceDataPhotoListDataProvider
- (BOOL)hasDataToShow;
- (BOOL)hasPhotosThatShouldBeObfuscatedWhenInFullScreen;
- (BOOL)hasReachedTotalCount;
- (BOOL)isAllowedToShowAddPhotoCallToAction;
- (BOOL)isLoading;
- (id)albumCategory;
- (id)attributionNames;
- (id)delegate;
- (id)initWitBatchRequester:(id)a3 initialCount:(unint64_t)a4 batchCount:(unint64_t)a5 totalCount:(unint64_t)a6 albumCategory:(id)a7 delegate:(id)a8;
- (id)photoList;
- (unint64_t)indexOfTappedPhoto;
- (unint64_t)shouldLoadNextBatch;
- (unint64_t)totalNumberOfPhotos;
- (void)_failWithError:(id)a3 range:(_NSRange)a4;
- (void)_performOnCallbackQueue:(id)a3;
- (void)_processResult:(id)a3;
- (void)fetchNextBatchRequestIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setIndexOfTappedPhoto:(unint64_t)a3;
@end

@implementation UGCPlaceDataPhotoListDataProvider

- (id)initWitBatchRequester:(id)a3 initialCount:(unint64_t)a4 batchCount:(unint64_t)a5 totalCount:(unint64_t)a6 albumCategory:(id)a7 delegate:(id)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)UGCPlaceDataPhotoListDataProvider;
  v18 = [(UGCPlaceDataPhotoListDataProvider *)&v31 init];
  if (v18)
  {
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.Maps.UGCPhotoViewerDataProviderQueue", v19);
    serialQueue = v18->_serialQueue;
    v18->_serialQueue = (OS_dispatch_queue *)v20;

    v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    photoList = v18->_photoList;
    v18->_photoList = v22;

    objc_storeStrong((id *)&v18->_batchRequester, a3);
    v18->_currentIndex = 0;
    v18->_initialCount = a4;
    v18->_batchCount = a5;
    v18->_totalCount = a6;
    v18->_shouldLoadNextBatch = 1;
    v18->_isLoading = 0;
    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attributionsByVendorId = v18->_attributionsByVendorId;
    v18->_attributionsByVendorId = v24;

    objc_storeWeak((id *)&v18->_delegate, v17);
    v18->_isLoadingFirstBatch = 1;
    v18->_indexOfTappedPhoto = 0;
    objc_storeStrong((id *)&v18->_albumCategory, a7);
    uint64_t v26 = geo_isolater_create();
    attributionsByVendorIdIsolator = v18->_attributionsByVendorIdIsolator;
    v18->_attributionsByVendorIdIsolator = (geo_isolater *)v26;

    uint64_t v28 = geo_isolater_create();
    hasObfuscatedPhotosIsolator = v18->_hasObfuscatedPhotosIsolator;
    v18->_hasObfuscatedPhotosIsolator = (geo_isolater *)v28;
  }
  return v18;
}

- (BOOL)hasReachedTotalCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10092A2DC;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasDataToShow
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10092A3E4;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasPhotosThatShouldBeObfuscatedWhenInFullScreen
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (unint64_t)totalNumberOfPhotos
{
  return self->_totalCount;
}

- (id)attributionNames
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_100104154;
  v10 = sub_100104928;
  id v11 = 0;
  geo_isolate_sync();
  char v2 = [v7[5] allValues:_NSConcreteStackBlock 3221225472 sub_10092A654 &unk_1012E73F0 self &v6];
  char v3 = sub_100099700(v2, &stru_1013023B0);

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)fetchNextBatchRequestIfNeeded
{
  char v3 = self->_serialQueue;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10092A7E0;
  block[3] = &unk_1012E7ED0;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)v3, block);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (void)_processResult:(id)a3
{
  id v38 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = [v6 photoViewerDataProviderRequestsMapItem:self];
    uint64_t v8 = [v7 name];
  }
  else
  {
    uint64_t v8 = &stru_101324E70;
  }
  id v9 = [v38 photos];
  v10 = v8;
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v56 objects:&v61 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v57;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = [objc_alloc((Class)MKMapItemPhoto) initWithGeoMapItemPhoto:*(void *)(*((void *)&v56 + 1) + 8 * i) fallbackTitle:v10];
        [v11 addObject:v16];
      }
      id v13 = [v12 countByEnumeratingWithState:&v56 objects:&v61 count:16];
    }
    while (v13);
  }

  id v17 = [v11 copy];
  v50 = _NSConcreteStackBlock;
  uint64_t v51 = 3221225472;
  v52 = sub_10092B1F8;
  v53 = &unk_1012E5D58;
  id v18 = v17;
  id v54 = v18;
  v55 = self;
  geo_isolate_sync();
  if (self->_isLoadingFirstBatch)
  {
    self->_isLoadingFirstBatch = 0;
    unint64_t indexOfTappedPhoto = self->_indexOfTappedPhoto;
    if (indexOfTappedPhoto < (unint64_t)[v18 count])
    {
      id v20 = [v18 mutableCopy];
      v21 = [v20 objectAtIndexedSubscript:self->_indexOfTappedPhoto];
      [v20 removeObjectAtIndex:self->_indexOfTappedPhoto];
      [v20 insertObject:v21 atIndex:0];
      id v22 = [v20 copy];

      id v18 = v22;
    }
  }
  photoList = self->_photoList;
  id v24 = [v18 copy];
  [(NSMutableArray *)photoList addObjectsFromArray:v24];

  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = sub_100104154;
  v65 = sub_100104928;
  id v66 = 0;
  v44 = _NSConcreteStackBlock;
  uint64_t v45 = 3221225472;
  v46 = sub_10092B308;
  v47 = &unk_1012E73F0;
  v48 = self;
  v49 = &v61;
  geo_isolate_sync();
  long long v43 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  id v25 = v18;
  id v26 = [v25 countByEnumeratingWithState:&v40 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v41;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        v30 = [v29 attribution];
        objc_super v31 = [v30 providerID];

        if ([v31 length])
        {
          v32 = [v29 attribution];
          if (v32)
          {
            v33 = [(id)v62[5] objectForKeyedSubscript:v31];
            BOOL v34 = v33 == 0;

            if (v34)
            {
              v35 = (void *)v62[5];
              v36 = [v29 attribution];
              [v35 setObject:v36 forKey:v31];
            }
          }
        }
      }
      id v26 = [v25 countByEnumeratingWithState:&v40 objects:v60 count:16];
    }
    while (v26);
  }

  v39[5] = _NSConcreteStackBlock;
  v39[6] = 3221225472;
  v39[7] = sub_10092B35C;
  v39[8] = &unk_1012E67C0;
  v39[9] = self;
  v39[10] = &v61;
  geo_isolate_sync();
  id v37 = [(NSMutableArray *)self->_photoList count];
  self->_currentIndex = (unint64_t)v37;
  if ((unint64_t)v37 >= self->_totalCount) {
    self->_shouldLoadNextBatch = 0;
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10092B3B0;
  v39[3] = &unk_1012E5D08;
  v39[4] = self;
  [(UGCPlaceDataPhotoListDataProvider *)self _performOnCallbackQueue:v39];
  _Block_object_dispose(&v61, 8);
}

- (void)_failWithError:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  self->_shouldLoadNextBatch = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10092B4FC;
  v9[3] = &unk_1012EAA08;
  v9[4] = self;
  id v10 = v7;
  NSUInteger v11 = location;
  NSUInteger v12 = length;
  id v8 = v7;
  [(UGCPlaceDataPhotoListDataProvider *)self _performOnCallbackQueue:v9];
}

- (void)_performOnCallbackQueue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10092B638;
    block[3] = &unk_1012E6EA8;
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", buf, 2u);
  }
}

- (id)photoList
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100104154;
  id v10 = sub_100104928;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10092B758;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = [(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isAllowedToShowAddPhotoCallToAction
{
  id v3 = [(UGCPlaceDataPhotoListDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  NSUInteger v12 = sub_100104154;
  id v13 = sub_100104928;
  id v14 = 0;
  geo_isolate_sync();
  if (objc_msgSend((id)v10[5], "count", _NSConcreteStackBlock, 3221225472, sub_10092B930, &unk_1012E73F0, self, &v9))
  {
    char v5 = [(UGCPlaceDataPhotoListDataProvider *)self delegate];
    uint64_t v6 = [v5 photoViewerDataProviderRequestsMapItem:self];

    unsigned __int8 v7 = +[MKPOIEnrichmentAvailibility shouldShowAddPhotoButtonOnMorePhotosGalleryForMapItem:v6 usingAttributionsByProviderIds:v10[5]];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v7;
}

- (unint64_t)indexOfTappedPhoto
{
  return self->_indexOfTappedPhoto;
}

- (void)setIndexOfTappedPhoto:(unint64_t)a3
{
  self->_unint64_t indexOfTappedPhoto = a3;
}

- (id)albumCategory
{
  return self->_albumCategory;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (unint64_t)shouldLoadNextBatch
{
  return self->_shouldLoadNextBatch;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_albumCategory, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_batchRequester, 0);
  objc_storeStrong((id *)&self->_hasObfuscatedPhotosIsolator, 0);
  objc_storeStrong((id *)&self->_attributionsByVendorIdIsolator, 0);
  objc_storeStrong((id *)&self->_attributionsByVendorId, 0);

  objc_storeStrong((id *)&self->_photoList, 0);
}

@end