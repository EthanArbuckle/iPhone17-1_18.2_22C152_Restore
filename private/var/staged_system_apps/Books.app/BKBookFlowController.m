@interface BKBookFlowController
- (BKBookFlowController)initWithLibraryAssetProvider:(id)a3;
- (BKLibraryAssetProvider)libraryAssetProvider;
- (BKMinifiedPresenting)minifiedPresenter;
- (BKSceneHosting)sceneHosting;
- (BKStorePresenting)storePresenter;
- (BOOL)_isPresenterAudiobook:(id)a3;
- (BOOL)_shouldOpenBookUsingLargeCover:(id)a3;
- (BOOL)_wantsMinifiedAssetPresenterToOpenForTransaction:(id)a3 forceOpen:(BOOL)a4;
- (BOOL)isOpeningFromCard:(id)a3 options:(id)a4;
- (CGRect)openAnimationRect;
- (CGRect)openAnimationSourceRect;
- (NSArray)pendingShowAssetInvocations;
- (_BKShowAssetInvocation)runningShowAssetInvocation;
- (id)_bookFlowAssetPresentingForShowAssetAction:(id)a3;
- (id)_currentAssetPresentersFromAllScenes;
- (id)_currentPresenterFromAllScenesForAssetID:(id)a3;
- (id)_dockedAssetViewController;
- (id)_largeCoverViewControllerForAssetIdentifier:(id)a3 download:(BOOL)a4 options:(id)a5 minifiedPresenter:(id)a6 holdAnimationAssertion:(id)a7 withTransaction:(id)a8;
- (id)_largeCoverViewControllerForBook:(id)a3 options:(id)a4 transaction:(id)a5 minifiedPresenter:(id)a6 holdAnimationAssertion:(id)a7;
- (id)_optionsForLibraryAsset:(id)a3 transaction:(id)a4;
- (id)_prepareOpenFromCardOverlayWithTransaction:(id)a3 assetIdentifier:(id)a4 options:(id)a5;
- (id)_pushLargeCoverAndOpenBook:(id)a3 options:(id)a4 minifiedPresenter:(id)a5 animated:(BOOL)a6 transaction:(id)a7 completion:(id)a8;
- (id)_removePresenters:(id)a3 thatMustStayOpenWhenOpeningBook:(id)a4;
- (id)_storeController;
- (id)_viewForCardOverlayFromOptions:(id)a3;
- (id)bookPresenterCurrentlyOpenBookForSingleScene:(id)a3;
- (id)currentAssetPresentersForSingleSceneWithTransaction:(id)a3;
- (void)_closeMinifiedPresenters:(id)a3 excludeAssetID:(id)a4 isAudiobook:(BOOL)a5 completion:(id)a6;
- (void)_closePresenter:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_closePresenters:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_libraryOwnershipNotification:(id)a3;
- (void)_obtainImageForAsset:(id)a3 withAssetIdentifier:(id)a4 options:(id)a5 withTransaction:(id)a6 completion:(id)a7;
- (void)_openPDFAsset:(id)a3;
- (void)_optionallyCloseCardStack:(id)a3 inPresentedVC:(id)a4 completion:(id)a5;
- (void)_pendingAssetUpdateNotification:(id)a3;
- (void)_popToPresenterIfNeeded:(id)a3 completion:(id)a4;
- (void)_prepareMinifiedAssetPresenterForAssetID:(id)a3 transaction:(id)a4 force:(BOOL)a5 openBook:(BOOL)a6 showRestorationScrim:(BOOL)a7;
- (void)_presentItem:(id)a3 transaction:(id)a4 host:(id)a5 source:(id)a6 options:(id)a7;
- (void)_presentViewController:(id)a3 bookFlowPresenting:(id)a4 options:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_presentViewController:(id)a3 transaction:(id)a4 animated:(BOOL)a5 overlayView:(id)a6 options:(id)a7 completion:(id)a8;
- (void)_processAndClearReopenAssetIDs:(id)a3 options:(id)a4 assetIDToPresenterMap:(id)a5;
- (void)_processNextShowAssetInvocation;
- (void)_promptInVCToRestartReadingFromBeginning:(id)a3 completion:(id)a4;
- (void)_removeViewForCardOverlayWithTransaction:(id)a3 options:(id)a4;
- (void)_replacePresenterWithTransaction:(id)a3 oldPresenter:(id)a4 newPresenter:(id)a5 completion:(id)a6;
- (void)_showAssetWithTransaction:(id)a3 assetIdentifier:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7;
- (void)_showAssetWithoutStateRestoration:(id)a3 assetIdentifier:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7;
- (void)_showRestorationScrimForAssetID:(id)a3 transaction:(id)a4;
- (void)_showStoreAsset:(id)a3 asset:(id)a4 options:(id)a5;
- (void)_updateAssetAfterOpen:(id)a3;
- (void)closeAllPresentersForSingleSceneWithTransaction:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)enqueueShowAssetWithTransactionProvider:(id)a3 assetID:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7;
- (void)handleBookOpenErrorWithTransaction:(id)a3 error:(id)a4 assetIdentifier:(id)a5;
- (void)handleFamilyChangeErrorWithTransaction:(id)a3 error:(id)a4 assetIdentifier:(id)a5;
- (void)minifiedAssetPresenterForAssetIdentifier:(id)a3 transaction:(id)a4 completion:(id)a5;
- (void)minifiedAssetPresenterForAssetIdentifier:(id)a3 transaction:(id)a4 options:(id)a5 completion:(id)a6;
- (void)preflightShowAssetWithTransaction:(id)a3 assetIdentifier:(id)a4 completion:(id)a5;
- (void)presentItem:(id)a3 transaction:(id)a4 host:(id)a5 source:(id)a6;
- (void)presentItem:(id)a3 transaction:(id)a4 host:(id)a5 source:(id)a6 options:(id)a7;
- (void)requestOpenBookMinified:(id)a3 transaction:(id)a4 force:(BOOL)a5;
- (void)requestOpenLastKnownBookWithTransaction:(id)a3;
- (void)requestReopenAssetIDs:(id)a3 options:(id)a4;
- (void)setLibraryAssetProvider:(id)a3;
- (void)setMinifiedPresenter:(id)a3;
- (void)setOpenAnimationRect:(CGRect)a3;
- (void)setPendingShowAssetInvocations:(id)a3;
- (void)setRunningShowAssetInvocation:(id)a3;
- (void)setSceneHosting:(id)a3;
- (void)setStorePresenter:(id)a3;
- (void)showAssetWithTransaction:(id)a3 assetID:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7;
- (void)showAssetWithTransaction:(id)a3 assetIdentifier:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7;
- (void)showAssetWithTransaction:(id)a3 storeID:(id)a4 options:(id)a5;
- (void)showInstallationErrorWithTransaction:(id)a3 assetIdentifier:(id)a4;
- (void)showNotEnoughMemAlertWithTransaction:(id)a3 name:(id)a4;
- (void)showStoreAsset:(id)a3 asset:(id)a4 options:(id)a5;
@end

@implementation BKBookFlowController

- (id)bookPresenterCurrentlyOpenBookForSingleScene:(id)a3
{
  v3 = [a3 bookFlowAssetPresenting];
  v4 = [v3 presenterFirstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];

  return v4;
}

- (void)setStorePresenter:(id)a3
{
}

- (void)setSceneHosting:(id)a3
{
}

- (void)setMinifiedPresenter:(id)a3
{
}

- (void)setLibraryAssetProvider:(id)a3
{
}

- (BKBookFlowController)initWithLibraryAssetProvider:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKBookFlowController;
  v5 = [(BKBookFlowController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(BKBookFlowController *)v5 setLibraryAssetProvider:v4];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"_libraryOwnershipNotification:" name:BKLibraryOwnershipDidChangeNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v6 selector:"_pendingAssetUpdateNotification:" name:BKLibraryPendingUpdateNotification object:0];

    v9 = (NSArray *)objc_alloc_init((Class)NSArray);
    pendingShowAssetInvocations = v6->_pendingShowAssetInvocations;
    v6->_pendingShowAssetInvocations = v9;
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:BKLibraryOwnershipDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)BKBookFlowController;
  [(BKBookFlowController *)&v4 dealloc];
}

- (BKMinifiedPresenting)minifiedPresenter
{
  return self->_minifiedPresenter;
}

- (void)_pendingAssetUpdateNotification:(id)a3
{
  objc_super v4 = [a3 object];
  [v4 assetID];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CB008;
  v6[3] = &unk_100A43DD8;
  v6[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)_libraryOwnershipNotification:(id)a3
{
  v27 = self;
  id v30 = a3;
  v3 = [v30 userInfo];
  objc_opt_class();
  objc_super v4 = BCGetUnsafeAppDelegateReference();
  id v5 = BUDynamicCast();

  v28 = v5;
  v6 = [v5 ubiquityStatusMonitor];
  [v6 isICloudDriveEnabled];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v29 = v3;
  id obj = [v3 objectForKeyedSubscript:BKLibraryOwnershipAssetsKey];
  id v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v37 = *(void *)v42;
    v38 = 0;
    uint64_t v35 = BKLibraryOwnershipNewDatasourceKey;
    uint64_t v36 = BKLibraryOwnershipOldDatasourceKey;
    uint64_t v33 = BKLibraryOwnershipOldStateKey;
    uint64_t v34 = BKLibraryOwnershipNewStateKey;
    uint64_t v32 = BKLibraryOwnershipAssetIDKey;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v11 = [v10 objectForKeyedSubscript:v36, v27];
        objc_super v12 = [v11 stringValue];

        v13 = [v10 objectForKeyedSubscript:v35];
        v14 = [v13 stringValue];

        v15 = [v10 objectForKeyedSubscript:v34];
        int v16 = (unsigned __int16)[v15 integerValue];

        v17 = [v10 objectForKeyedSubscript:v33];
        unsigned __int16 v18 = (unsigned __int16)[v17 integerValue];

        v19 = [v10 objectForKeyedSubscript:v32];
        v20 = @"com.apple.iBooks.plist.sample.stashed";
        v21 = @"com.apple.ibooks.plist.untethered";
        if ([v12 isEqualToString:v20])
        {
          unsigned __int8 v22 = [v14 isEqualToString:v21];
          if (v16 == 2) {
            char v23 = 1;
          }
          else {
            char v23 = v22;
          }
        }
        else
        {
          char v23 = 0;
        }
        unsigned __int8 v24 = [v12 isEqualToString:v21];
        if (v16 == 2) {
          unsigned __int8 v25 = v24;
        }
        else {
          unsigned __int8 v25 = 0;
        }
        if (v19 && v18 == 1 && (v23 & 1) == 0 && (v25 & 1) == 0)
        {
          id v26 = v38;
          if (!v38) {
            id v26 = objc_alloc_init((Class)NSMutableSet);
          }
          v38 = v26;
          [v26 addObject:v19];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v8);
  }
  else
  {
    v38 = 0;
  }

  if ([v38 count])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CB5FC;
    block[3] = &unk_100A43DD8;
    block[4] = v27;
    id v40 = v38;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)_storeController
{
  v2 = +[BKAppDelegate delegate];
  v3 = [v2 storeController];

  return v3;
}

- (id)_optionsForLibraryAsset:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  if ([v6 isPreorderBook]) {
    [v8 setObject:&__kCFBooleanTrue forKey:AEHelperNumberIsPreorderKey];
  }
  if ([v6 isAudiobook])
  {
    v9 = [v6 lastOpenDate];

    if (v9)
    {
      v10 = [v6 lastOpenDate];
      [v8 setObject:v10 forKey:AEHelperDateLastOpenKey];
    }
    if ([v6 isStore])
    {
      v11 = [v6 supplementalContentAssets];
      objc_super v12 = [v11 allObjects];
      v13 = [v12 bu_arrayByInvokingBlock:&stru_100A45840];
      v14 = [v13 bu_arrayByRemovingNSNulls];

      [v8 setObject:v14 forKeyedSubscript:AEHelperNumberSupplementalContentAssetIDs];
    }
    else
    {
      [v8 setObject:&__NSArray0__struct forKeyedSubscript:AEHelperNumberSupplementalContentAssetIDs];
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000CBE74;
    v18[3] = &unk_100A45868;
    v18[4] = self;
    id v19 = v7;
    id v20 = v6;
    v15 = objc_retainBlock(v18);
    id v16 = [v15 copy];
    [v8 setObject:v16 forKey:AEHelperImageMetadataCoverBlockKey];

    [v8 setObject:&__kCFBooleanFalse forKey:@"BKBookPresentingResetLocationForMiniToFullTransition"];
  }

  return v8;
}

- (id)_largeCoverViewControllerForBook:(id)a3 options:(id)a4 transaction:(id)a5 minifiedPresenter:(id)a6 holdAnimationAssertion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  v17 = +[NSMutableDictionary dictionary];
  unsigned __int16 v18 = v17;
  if (v13) {
    [v17 addEntriesFromDictionary:v13];
  }
  if (([v12 isDownloading] & 1) != 0
    || ([v12 isLocal] & 1) == 0)
  {
    uint64_t v19 = [v12 streamable] ^ 1;
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v20 = BKLibraryAssetIdentifierFromAsset();
  v21 = [(BKBookFlowController *)self _largeCoverViewControllerForAssetIdentifier:v20 download:v19 options:v18 minifiedPresenter:v15 holdAnimationAssertion:v14 withTransaction:v16];

  return v21;
}

- (void)_obtainImageForAsset:(id)a3 withAssetIdentifier:(id)a4 options:(id)a5 withTransaction:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [v13 permanentOrTemporaryAssetID];
  if ([v17 length])
  {
    v63 = [v14 objectForKeyedSubscript:@"storeAsset"];
    uint64_t v18 = [v63 objectForKeyedSubscript:@"artwork"];
    objc_opt_class();
    uint64_t v19 = BUDynamicCast();
    v64 = v16;
    v67 = (void *)v18;
    v62 = (void *)v19;
    if (v18)
    {
      id v20 = (void *)v19;
      if (v19)
      {
        id v21 = objc_alloc_init((Class)BICProductProfileData);
        unsigned __int8 v22 = [v20 assetID];
        [v21 setIdentifier:v22];

        char v23 = [v67 objectForKeyedSubscript:@"url"];
        [v21 setUrl:v23];

        unsigned __int8 v24 = [v67 objectForKeyedSubscript:@"width"];
        [v21 setWidth:[v24 unsignedIntegerValue]];

        unsigned __int8 v25 = [v67 objectForKeyedSubscript:@"height"];
        [v21 setHeight:[v25 unsignedIntegerValue]];

        id v26 = +[BCCacheManager defaultCacheManager];
        v27 = [v26 describedImagesFromProductProfile:v21];
        [v26 addDescribedImages:v27];
        v28 = BCImageCacheLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_1007E95E8();
        }
      }
    }
    if (v12) {
      unsigned int v29 = +[BKLibraryManager processingOptionsFor:v12 coverEffectsEnvironment:0];
    }
    else {
      unsigned int v29 = 2;
    }
    id v66 = v12;
    objc_opt_class();
    uint64_t v32 = [v14 objectForKeyedSubscript:@"isRTL"];
    uint64_t v33 = BUDynamicCast();

    v61 = v33;
    unsigned int v34 = [v33 BOOLValue];
    uint64_t v35 = +[UIScreen mainScreen];
    [v35 nativeBounds];
    double v37 = v36;
    double v39 = v38;

    id v65 = v15;
    v60 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v15];
    v59 = [v60 presenterFirstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCUCoverEffectsEnvironment];
    unsigned int v40 = [v59 coverEffectsNightMode];
    long long v41 = BCImageCacheLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      sub_1007E9574();
    }

    if (v40) {
      int v42 = 64;
    }
    else {
      int v42 = 0;
    }
    if (v34) {
      int v43 = 128;
    }
    else {
      int v43 = 0;
    }
    int v44 = v43 | v29 | v42;
    v45 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v17, v44 | 0x100u, v37, v39);
    [v45 setRequestOptions:18];
    [v45 setPriority:6];
    v46 = [v14 objectForKeyedSubscript:@"title"];
    [v45 setTitle:v46];

    v47 = [v14 objectForKeyedSubscript:@"author"];
    [v45 setAuthor:v47];

    id v48 = [v45 copy];
    [v48 setRequestOptions:514];
    v49 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v17, v44 | 0x10u, v37, v39);
    [v49 setRequestOptions:18];
    [v49 setPriority:6];
    v50 = [v14 objectForKeyedSubscript:@"title"];
    [v49 setTitle:v50];

    v51 = [v14 objectForKeyedSubscript:@"author"];
    [v49 setAuthor:v51];

    v86[0] = 0;
    v86[1] = v86;
    v86[2] = 0x3032000000;
    v86[3] = sub_100006FA4;
    v86[4] = sub_1000071BC;
    id v87 = 0;
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x3032000000;
    v84[3] = sub_100006FA4;
    v84[4] = sub_1000071BC;
    id v85 = 0;
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x3032000000;
    v82[3] = sub_100006FA4;
    v82[4] = sub_1000071BC;
    id v83 = 0;
    v52 = dispatch_group_create();
    dispatch_group_enter(v52);
    dispatch_group_enter(v52);
    dispatch_group_enter(v52);
    v53 = +[BCCacheManager defaultCacheManager];
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1000CC928;
    v79[3] = &unk_100A45890;
    v81 = v86;
    v54 = v52;
    v80 = v54;
    [v53 fetchCGImageFor:v48 forRequest:v48 timeOut:1 waitForNonGeneric:v79 completion:4.0];

    v55 = +[BCCacheManager defaultCacheManager];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000CC9C4;
    v76[3] = &unk_100A45890;
    v78 = v84;
    v56 = v54;
    v77 = v56;
    [v55 fetchCGImageFor:v45 forRequest:v45 timeOut:1 waitForNonGeneric:v76 completion:4.0];

    v57 = +[BCCacheManager defaultCacheManager];
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1000CCA60;
    v73[3] = &unk_100A45890;
    v75 = v82;
    v58 = v56;
    v74 = v58;
    [v57 fetchCGImageFor:v49 forRequest:v49 timeOut:1 waitForNonGeneric:v73 completion:4.0];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CCB20;
    block[3] = &unk_100A458B8;
    v70 = v86;
    v71 = v84;
    id v16 = v64;
    id v69 = v64;
    v72 = v82;
    dispatch_group_notify(v58, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v82, 8);
    _Block_object_dispose(v84, 8);

    _Block_object_dispose(v86, 8);
    id v15 = v65;
    id v12 = v66;
  }
  else
  {
    id v30 = objc_retainBlock(v16);
    v31 = v30;
    if (v30) {
      (*((void (**)(id, void, void, void))v30 + 2))(v30, 0, 0, 0);
    }
  }
}

- (id)_largeCoverViewControllerForAssetIdentifier:(id)a3 download:(BOOL)a4 options:(id)a5 minifiedPresenter:(id)a6 holdAnimationAssertion:(id)a7 withTransaction:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = objc_opt_new();
  id v20 = [(BKBookFlowController *)self libraryAssetProvider];
  id v21 = [v20 libraryAssetOnMainQueueWithAssetIdentifier:v14];

  unsigned __int8 v22 = sub_1000CAD5C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558530;
    uint64_t v48 = 1752392040;
    __int16 v49 = 2112;
    id v50 = v14;
    __int16 v51 = 2112;
    v52 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] _largeCoverViewControllerForAssetIdentifier: %@", buf, 0x20u);
  }

  unsigned __int16 v23 = (unsigned __int16)[v21 contentType];
  unsigned int v34 = _NSConcreteStackBlock;
  uint64_t v35 = 3221225472;
  double v36 = sub_1000CCEA8;
  double v37 = &unk_100A45958;
  BOOL v24 = (unsigned __int16)(v23 - 7) != 65534 && (unsigned __int16)(v23 - 7) != 0xFFFF;
  BOOL v45 = v24;
  id v38 = v15;
  id v39 = v14;
  id v40 = v17;
  long long v41 = self;
  BOOL v46 = a4;
  id v42 = v16;
  id v43 = v18;
  id v25 = v19;
  id v44 = v25;
  id v26 = v18;
  id v27 = v16;
  id v28 = v17;
  id v29 = v14;
  id v30 = v15;
  v31 = objc_retainBlock(&v34);
  -[BKBookFlowController _obtainImageForAsset:withAssetIdentifier:options:withTransaction:completion:](self, "_obtainImageForAsset:withAssetIdentifier:options:withTransaction:completion:", v21, v29, v30, v26, v31, v34, v35, v36, v37);
  id v32 = v25;

  return v32;
}

- (id)_bookFlowAssetPresentingForShowAssetAction:(id)a3
{
  id v4 = a3;
  id v5 = [(BKBookFlowController *)self sceneHosting];
  id v6 = [v5 defaultSceneControllerForTransaction:v4];

  if (!v6) {
    BCReportAssertionFailureWithMessage();
  }
  id v7 = [v6 bookFlowAssetPresenting];
  if (!v7) {
    BCReportAssertionFailureWithMessage();
  }

  return v7;
}

- (void)_presentViewController:(id)a3 transaction:(id)a4 animated:(BOOL)a5 overlayView:(id)a6 options:(id)a7 completion:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = sub_1000CAD5C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v14;
    __int16 v35 = 1024;
    BOOL v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "_presentViewController: %@ animated: %{BOOL}d", buf, 0x12u);
  }

  id v20 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v15];
  id v21 = v20;
  if (v16)
  {
    unsigned __int8 v22 = [v20 presenterModalPresentingViewController];
    unsigned __int16 v23 = [v22 view];
    [v23 addSubview:v16];

    id v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    id v27 = sub_1000CD82C;
    id v28 = &unk_100A45980;
    id v29 = self;
    id v30 = v15;
    id v31 = v17;
    id v32 = v18;
    BOOL v24 = objc_retainBlock(&v25);
  }
  else
  {
    BOOL v24 = (void ***)objc_retainBlock(v18);
  }
  -[BKBookFlowController _presentViewController:bookFlowPresenting:options:animated:completion:](self, "_presentViewController:bookFlowPresenting:options:animated:completion:", v14, v21, v17, v11, v24, v25, v26, v27, v28, v29);
}

- (void)_presentViewController:(id)a3 bookFlowPresenting:(id)a4 options:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v36 = a6;
  id v37 = a3;
  id v10 = a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = [v12 presenterFirstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCoverAnimatingHost];
  __int16 v35 = [v13 ba_effectiveAnalyticsTracker];
  id v14 = [v35 chainWithName:@"ContentReading"];
  objc_opt_class();
  id v15 = [v10 objectForKeyedSubscript:@"interimTrackerPathOverride"];
  id v16 = BUDynamicCast();

  if (v16)
  {
    id v17 = [v14 chainWithName:v16];

    id v14 = [v17 chainWithName:@"ContentReading"];
  }
  [v37 ba_setAnalyticsTracker:v14];
  objc_opt_class();
  id v18 = [v10 objectForKeyedSubscript:@"rawUpSellData"];
  uint64_t v19 = BUDynamicCast();

  if (v19)
  {
    id v34 = v13;
    objc_opt_class();
    id v20 = [v19 valueForKey:BAUpSellLocationKey];
    id v21 = BUDynamicCast();
    id v22 = [v21 integerValue];

    objc_opt_class();
    unsigned __int16 v23 = [v19 valueForKey:BAUpSellVariantKey];
    BOOL v24 = BUDynamicCast();
    id v25 = [v24 integerValue];

    objc_opt_class();
    uint64_t v26 = [v19 objectForKeyedSubscript:BAUpSellVariantVersionKey];
    id v27 = BUDynamicCast();

    objc_opt_class();
    id v28 = BUDynamicCast();
    if (v28)
    {
      id v29 = [objc_alloc((Class)BAUpSellData) initWithLocation:v22 variant:v25 variantVersion:v27];
      [v28 setUpSellData:v29];
    }
    id v13 = v34;
  }
  objc_opt_class();
  id v30 = [v10 objectForKeyedSubscript:@"rawAppAnalyticsAdditionalData"];
  id v31 = BUDynamicCast();

  if (v31 && _os_feature_enabled_impl())
  {
    objc_opt_class();
    id v32 = BUDynamicCast();
    if (v32)
    {
      uint64_t v33 = +[BAAppAnalyticsAdditionalData dataWithDictionary:v31];
      [v32 setAppAnalyticsAdditionalData:v33];
    }
  }
  [v37 setModalPresentationStyle:0 v34];
  [v12 presenterShowModalController:v37 animated:v36 completion:v11];
}

- (id)_removePresenters:(id)a3 thatMustStayOpenWhenOpeningBook:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  id v7 = [v6 count];
  if ((uint64_t)v7 - 1 >= 0)
  {
    uint64_t v8 = (uint64_t)v7;
    do
    {
      --v8;
      if ([v5 isSupplementalContent])
      {
        v9 = [v5 supplementalContentParent];
        id v10 = [v9 assetID];
        id v11 = [v6 objectAtIndexedSubscript:v8];
        id v12 = [v11 assetPresenterAssetID];
        unsigned int v13 = [v10 isEqualToString:v12];

        if (v13) {
          [v6 removeObjectAtIndex:v8];
        }
      }
    }
    while (v8 > 0);
  }
  id v14 = [v6 copy];

  return v14;
}

- (id)_pushLargeCoverAndOpenBook:(id)a3 options:(id)a4 minifiedPresenter:(id)a5 animated:(BOOL)a6 transaction:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v17];
  if (!v19) {
    BCReportAssertionFailureWithMessage();
  }
  +[BKBasePresentingViewController holdAnimationAssertion];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000CDF0C;
  v29[3] = &unk_100A459F8;
  v29[4] = self;
  id v30 = v14;
  id v31 = v15;
  id v32 = v17;
  id v33 = v16;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v36 = a6;
  id v34 = v20;
  id v35 = v18;
  id v21 = v18;
  id v22 = v16;
  id v23 = v17;
  id v24 = v15;
  id v25 = v14;
  [v19 presenterFinishModalTransitionsWithCompletion:v29];
  uint64_t v26 = v35;
  id v27 = v20;

  return v27;
}

- (void)enqueueShowAssetWithTransactionProvider:(id)a3 assetID:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v20 = objc_alloc_init(_BKShowAssetInvocation);
  [(_BKShowAssetInvocation *)v20 setTransactionProvider:v16];

  [(_BKShowAssetInvocation *)v20 setAssetID:v15];
  [(_BKShowAssetInvocation *)v20 setLocation:v14];

  [(_BKShowAssetInvocation *)v20 setOptions:v13];
  [(_BKShowAssetInvocation *)v20 setCompletion:v12];

  id v17 = [(BKBookFlowController *)self pendingShowAssetInvocations];
  id v18 = [v17 arrayByAddingObject:v20];
  [(BKBookFlowController *)self setPendingShowAssetInvocations:v18];

  uint64_t v19 = [(BKBookFlowController *)self runningShowAssetInvocation];

  if (!v19) {
    [(BKBookFlowController *)self _processNextShowAssetInvocation];
  }
}

- (void)_processNextShowAssetInvocation
{
  v3 = [(BKBookFlowController *)self runningShowAssetInvocation];

  if (v3) {
    BCReportAssertionFailureWithMessage();
  }
  id v4 = [(BKBookFlowController *)self pendingShowAssetInvocations];
  id v5 = (char *)[v4 count];

  if (v5)
  {
    id v6 = [(BKBookFlowController *)self pendingShowAssetInvocations];
    id v7 = [v6 firstObject];
    [(BKBookFlowController *)self setRunningShowAssetInvocation:v7];

    uint64_t v8 = [(BKBookFlowController *)self pendingShowAssetInvocations];
    v9 = [v8 subarrayWithRange:1, v5 - 1];
    [(BKBookFlowController *)self setPendingShowAssetInvocations:v9];

    id v10 = [v7 transactionProvider];

    if (v10)
    {
      id v11 = [v7 transactionProvider];
      id v12 = [v11 newShowAssetTransaction];

      id v13 = [v7 options];
      id v14 = [v13 mutableCopy];

      if (!v14) {
        id v14 = objc_alloc_init((Class)NSMutableDictionary);
      }
      if (+[BKSceneUtilities hasMultiWindowEnabled]) {
        [v14 setObject:v12 forKeyedSubscript:BCTransactionOptionsTransactionKey];
      }
      objc_initWeak(&location, self);
      id v15 = [v7 assetID];
      id v16 = [v7 location];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000CE728;
      v17[3] = &unk_100A45A20;
      id v18 = v7;
      objc_copyWeak(&v19, &location);
      [(BKBookFlowController *)self showAssetWithTransaction:v12 assetID:v15 location:v16 options:v14 completion:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_processAndClearReopenAssetIDs:(id)a3 options:(id)a4 assetIDToPresenterMap:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [v8 firstObject];
    id v12 = [v10 objectForKeyedSubscript:v11];
    id v13 = v12;
    if (v12)
    {
      id v14 = [v12 im_ancestorConformingToProtocol:&OBJC_PROTOCOL___BKTransactionProviding];
      id v15 = [v14 newShowAssetTransaction];
      id v16 = [v9 mutableCopy];
      if (!v16) {
        id v16 = objc_alloc_init((Class)NSMutableDictionary);
      }
      [v16 setObject:v15 forKeyedSubscript:BCTransactionOptionsTransactionKey];
      objc_initWeak(&location, self);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000CE9DC;
      v17[3] = &unk_100A45A48;
      id v18 = v8;
      objc_copyWeak(&v21, &location);
      id v19 = v9;
      id v20 = v10;
      [(BKBookFlowController *)self showAssetWithTransaction:v15 assetID:v11 location:0 options:v16 completion:v17];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

- (void)requestReopenAssetIDs:(id)a3 options:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    id v8 = [v6 mutableCopy];
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"BKBookPresentingCloseAndReopenAssetIfNeeded"];
  id v10 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = [(BKBookFlowController *)self _currentAssetPresentersFromAllScenes];
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v17 = [v16 assetPresenterAssetID];

        if (v17)
        {
          id v18 = [v16 assetPresenterAssetID];
          [v10 setObject:v16 forKeyedSubscript:v18];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  id v19 = [v20 mutableCopy];
  [(BKBookFlowController *)self _processAndClearReopenAssetIDs:v19 options:v9 assetIDToPresenterMap:v10];
}

- (void)_prepareMinifiedAssetPresenterForAssetID:(id)a3 transaction:(id)a4 force:(BOOL)a5 openBook:(BOOL)a6 showRestorationScrim:(BOOL)a7
{
  BOOL v7 = a6;
  id v10 = a3;
  id v11 = a4;
  if (![v10 length]) {
    goto LABEL_27;
  }
  if (v7)
  {
    id v12 = BCCurrentBookLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Requesting opening of the last known open book %@.", buf, 0xCu);
    }
  }
  id v13 = BCCurrentBookLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Requesting minified opening of book %@.", buf, 0xCu);
  }

  uint64_t v14 = [(BKBookFlowController *)self libraryAssetProvider];
  id v15 = [v14 libraryAssetOnMainQueueWithAssetID:v10];

  if (([v15 canOpen] & 1) == 0)
  {

    id v20 = BCCurrentBookLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      long long v21 = "Requested minified opening of book that is not local or streamable.";
      goto LABEL_15;
    }
LABEL_16:

    id v15 = 0;
    goto LABEL_17;
  }
  id v16 = [v15 isExplicit];
  unsigned int v17 = [v16 BOOLValue];

  if (!v17)
  {
    if (![v15 isEphemeral]) {
      goto LABEL_17;
    }

    id v20 = BCCurrentBookLog();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    long long v21 = "The book we tried to re-open is ephemeral.";
    goto LABEL_15;
  }
  id v18 = [(BKBookFlowController *)self libraryAssetProvider];
  unsigned __int8 v19 = [v18 isExplicitMaterialAllowed];

  if ((v19 & 1) == 0)
  {

    id v20 = BCCurrentBookLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      long long v21 = "Book is explicit which is not allowed for opening.";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_17:
  long long v22 = [v15 assetID];
  if (v22)
  {
    long long v23 = [(BKBookFlowController *)self libraryAssetProvider];
    long long v24 = [v23 libraryAssetOnMainQueueWithAssetID:v22];

    id v25 = [(BKBookFlowController *)self minifiedPresenter];
    [v25 setShouldIgnoreCurrentBookNotifications:1];

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000CF104;
    v38[3] = &unk_100A45AC0;
    v38[4] = self;
    id v26 = v24;
    id v39 = v26;
    id v40 = v22;
    id v27 = v11;
    id v41 = v27;
    BOOL v42 = v7;
    id v28 = objc_retainBlock(v38);
    if ([v26 isAudiobook])
    {
      id v29 = [(BKBookFlowController *)self _optionsForLibraryAsset:v26 transaction:v27];
      id v30 = [v29 mutableCopy];

      [v30 setObject:&__kCFBooleanTrue forKeyedSubscript:AEAudiobookOptionsShouldNotAutoplayKey];
      id v31 = _AEBookPluginsAudiobookLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Preventing auto-play of audiobook on auto-reopen of previous asset.", buf, 2u);
      }

      ((void (*)(void *, id))v28[2])(v28, v30);
    }
    else
    {
      if (+[BKAssetUtilities supportsRestorationSnapshots:](BKAssetUtilities, "supportsRestorationSnapshots:", [v26 contentType]))-[BKBookFlowController _showRestorationScrimForAssetID:transaction:](self, "_showRestorationScrimForAssetID:transaction:", v10, v27); {
      id v32 = +[BKAppDelegate delegate];
      }
      id v33 = [v32 appLaunchCoordinator];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000CF84C;
      v34[3] = &unk_100A45AE8;
      id v37 = v28;
      v34[4] = self;
      id v35 = v26;
      id v36 = v27;
      [v33 appLaunchCoordinatorOnConditionMask:0x4000 blockID:@"minifiedAssetPresenter resolveAndShowAsset" performBlock:v34];

      id v30 = v37;
    }
  }
LABEL_27:
}

- (void)_showRestorationScrimForAssetID:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  BOOL v7 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:a4];
  id v8 = [v7 presenterModalPresentingViewController];
  id v9 = [v8 view];
  id v10 = [v9 window];

  if (v10) {
    id v11 = [[BKRestorationScrimView alloc] initWithAssetID:v6 window:v10];
  }
  else {
    id v11 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CF9D8;
  block[3] = &unk_100A43D60;
  uint64_t v14 = v11;
  id v12 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(BKRestorationScrimView *)v12 removeEventually];
}

- (void)requestOpenLastKnownBookWithTransaction:(id)a3
{
  id v4 = a3;
  id v5 = +[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID];
  if ([v5 length])
  {
    id v6 = sub_1000CAD5C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Open Last Known Book. last ID: %@", (uint8_t *)&v9, 0xCu);
    }

    BOOL v7 = +[BKLastOpenBookManager sharedInstance];
    unsigned __int8 v8 = [v7 shouldAutoOpenAsset:v5];

    if ((v8 & 1) == 0) {
      +[BKBasePresentingViewController clearLastKnownSuccessfullyOpenBookID];
    }
    [(BKBookFlowController *)self _prepareMinifiedAssetPresenterForAssetID:v5 transaction:v4 force:0 openBook:1 showRestorationScrim:1];
  }
}

- (void)requestOpenBookMinified:(id)a3 transaction:(id)a4 force:(BOOL)a5
{
}

- (void)minifiedAssetPresenterForAssetIdentifier:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BKBookFlowController *)self libraryAssetProvider];
  id v13 = [v11 libraryAssetOnMainQueueWithAssetIdentifier:v10];

  id v12 = [(BKBookFlowController *)self _optionsForLibraryAsset:v13 transaction:v9];
  [(BKBookFlowController *)self minifiedAssetPresenterForAssetIdentifier:v10 transaction:v9 options:v12 completion:v8];
}

- (void)minifiedAssetPresenterForAssetIdentifier:(id)a3 transaction:(id)a4 options:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(BKBookFlowController *)self minifiedPresenter];

  if (v11)
  {
    id v12 = [(BKBookFlowController *)self minifiedPresenter];
    [v12 minifiedPresenterAssetPresenterForAssetIdentifier:v14 options:v9 completion:v10];
  }
  else
  {
    id v13 = objc_retainBlock(v10);
    id v12 = v13;
    if (v13) {
      (*((void (**)(id, void))v13 + 2))(v13, 0);
    }
  }
}

- (BOOL)_wantsMinifiedAssetPresenterToOpenForTransaction:(id)a3 forceOpen:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    id v8 = [v5 targetSceneDescriptor];

    if (v8)
    {
      id v9 = [v6 targetSceneDescriptor];
      id v10 = BUProtocolCast();

      if (!v10) {
        BCReportAssertionFailureWithMessage();
      }
    }
    else
    {
      id v11 = [v6 destinationSceneController];
      id v10 = BUProtocolCast();
    }
    unsigned __int8 v7 = [v10 sceneSupportsMinifiedPresenting];
  }
  return v7;
}

- (void)_updateAssetAfterOpen:(id)a3
{
  id v4 = a3;
  if ((+[AEAnnotationSerializationManager managedBooksAllowedToSync] & 1) == 0)
  {
    [(BKBookFlowController *)self libraryAssetProvider];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000CFE7C;
    v6[3] = &unk_100A44E38;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v4;
    id v5 = v7;
    [v5 performBlockOnWorkerQueue:v6];
  }
}

- (id)currentAssetPresentersForSingleSceneWithTransaction:(id)a3
{
  v3 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:a3];
  id v4 = [v3 presenterViewControllersConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];

  return v4;
}

- (id)_currentAssetPresentersFromAllScenes
{
  v2 = [(BKBookFlowController *)self sceneHosting];
  v3 = [v2 sceneHostingAllViewControllersConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];

  return v3;
}

- (id)_currentPresenterFromAllScenesForAssetID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(BKBookFlowController *)self _currentAssetPresentersFromAllScenes];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 assetPresenterAssetID];
        unsigned int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_dockedAssetViewController
{
  v2 = +[BKAppDelegate sceneManager];
  v3 = [v2 primarySceneController];
  id v4 = [v3 rootBarCoordinator];

  id v5 = [v4 miniPlayerViewController];
  objc_opt_class();
  id v6 = BUClassAndProtocolCast();

  return v6;
}

- (BOOL)_shouldOpenBookUsingLargeCover:(id)a3
{
  v3 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:a3];
  unsigned __int8 v4 = [v3 presenterShouldOpenBookUsingLargeCover];

  return v4;
}

- (BOOL)_isPresenterAudiobook:(id)a3
{
  id v4 = a3;
  id v5 = [(BKBookFlowController *)self libraryAssetProvider];
  id v6 = [v4 assetPresenterAssetID];

  uint64_t v7 = [v5 libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:v6];

  LOBYTE(v5) = [v7 isAudiobook];
  return (char)v5;
}

- (void)_popToPresenterIfNeeded:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [v9 bc_descendentPresentedViewController];

  if (v6)
  {
    uint64_t v7 = [v9 bc_descendentPresentedViewController];
    [v7 dismissViewControllerAnimated:1 completion:v5];
  }
  else
  {
    id v8 = objc_retainBlock(v5);
    uint64_t v7 = v8;
    if (v8) {
      (*((void (**)(id))v8 + 2))(v8);
    }
  }
}

- (void)_replacePresenterWithTransaction:(id)a3 oldPresenter:(id)a4 newPresenter:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:a3];
  if (!v13) {
    BCReportAssertionFailureWithMessage();
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000D0470;
  v17[3] = &unk_100A45338;
  id v18 = v13;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v13;
  [v16 presenterDismissModalController:v10 animated:0 completion:v17];
}

- (void)showStoreAsset:(id)a3 asset:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[BKAppDelegate delegate];
  id v12 = [v11 appLaunchCoordinator];

  [v12 appLaunchCoordinatorHoldAtConditionAssertion:3];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000D06D8;
  v37[3] = &unk_100A44268;
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v38;
  [v12 appLaunchCoordinatorOnConditionMask:2 blockID:@"showStoreAsset invalidate holdAssertion" performBlock:v37];
  id v14 = [v10 objectForKeyedSubscript:@"BKBookPresentingForceOpenBeforeWelcomeCompleted"];
  unsigned int v15 = [v14 BOOLValue];

  if (v15)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000D06E0;
    v33[3] = &unk_100A45B10;
    id v16 = &v34;
    v33[4] = self;
    id v34 = v8;
    unsigned int v17 = &v35;
    id v18 = &v36;
    id v35 = v9;
    id v36 = v10;
    id v19 = v10;
    id v20 = v9;
    id v21 = v8;
    CFStringRef v22 = @"_showStoreAsset forceOpenBeforeWelcome";
    long long v23 = v33;
    long long v24 = v12;
    uint64_t v25 = 2;
  }
  else
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000D06F0;
    v29[3] = &unk_100A45B10;
    id v16 = &v30;
    v29[4] = self;
    id v30 = v8;
    unsigned int v17 = &v31;
    id v18 = &v32;
    id v31 = v9;
    id v32 = v10;
    id v26 = v10;
    id v27 = v9;
    id v28 = v8;
    CFStringRef v22 = @"_showStoreAsset";
    long long v23 = v29;
    long long v24 = v12;
    uint64_t v25 = 10;
  }
  [v24 appLaunchCoordinatorOnConditionMask:v25 blockID:v22 performBlock:v23];
}

- (void)_showStoreAsset:(id)a3 asset:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BKBookFlowController *)self minifiedPresenter];

  if (v11)
  {
    id v12 = [(BKBookFlowController *)self minifiedPresenter];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D0800;
    v13[3] = &unk_100A45B38;
    id v14 = v8;
    unsigned int v15 = self;
    [v12 minifiedPresenterAssetPresenterForStoreAsset:v9 options:v10 completion:v13];
  }
}

- (CGRect)openAnimationSourceRect
{
  [(BKBookFlowController *)self openAnimationRect];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isOpeningFromCard:(id)a3 options:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:a3];
  id v8 = [v6 objectForKeyedSubscript:@"BKBookPresentingFromUserActivity"];

  LOBYTE(v6) = [v8 BOOLValue];
  id v9 = [v7 presenterViewControllersConformingToProtocol:&OBJC_PROTOCOL___BKAugmentedExperienceCardPresenting];
  id v10 = v9;
  BOOL v11 = (v6 & 1) == 0 && [v9 count] != 0;

  return v11;
}

- (id)_prepareOpenFromCardOverlayWithTransaction:(id)a3 assetIdentifier:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = sub_1000CAD5C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 objectForKeyedSubscript:AEAssetLogID];
    *(_DWORD *)buf = 138412546;
    id v57 = v9;
    __int16 v58 = 2114;
    v59 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "prepare to open asset %@ from card logID: %{public}@ with transaction", buf, 0x16u);
  }
  id v13 = v10;
  id v14 = [v13 objectForKeyedSubscript:@"BKBookPresentingOverlayView"];

  unsigned int v15 = v13;
  if (!v14)
  {
    id v53 = v8;
    id v16 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v8];
    uint64_t v17 = [v13 objectForKeyedSubscript:@"BKBookPresentingAnimateFromUid"];
    uint64_t v18 = [v13 objectForKeyedSubscript:@"BKBookPresentingAnimateFromRefId"];
    id v19 = (void *)v18;
    id v20 = @"cover";
    if (v18) {
      id v20 = (__CFString *)v18;
    }
    id v21 = v20;

    CFStringRef v22 = [v13 objectForKeyedSubscript:@"BKBookPresentingAnimateFromRefInstance"];
    long long v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      id v24 = [v9 permanentOrTemporaryAssetID];
    }
    uint64_t v25 = v24;

    id v26 = [v16 presenterModalPresentingViewController];
    v52 = [v26 presentedViewController];
    __int16 v51 = [v52 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCoverAnimatingHost includePresented:1];
    v54 = (void *)v17;
    id v27 = [v51 coverAnimationHostSourceForUUID:0 uid:v17 refId:v21 refInstance:v25];

    objc_opt_class();
    v55 = v16;
    id v28 = BUDynamicCast();
    [v28 setBookOpenAnimationHelper:self];
    [v27 coverAnimationSourceFrame];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    id v37 = [v27 coverAnimationSourceReferenceView];
    v62.origin.x = CGRectZero.origin.x;
    v62.origin.y = CGRectZero.origin.y;
    v62.size.width = CGRectZero.size.width;
    v62.size.height = CGRectZero.size.height;
    v61.origin.x = v30;
    v61.origin.y = v32;
    v61.size.width = v34;
    v61.size.height = v36;
    __int16 v49 = v37;
    if (!CGRectEqualToRect(v61, v62))
    {
      [v37 convertRect:0 toView:v30];
      double v30 = v38;
      double v32 = v39;
      double v34 = v40;
      double v36 = v41;
    }
    -[BKBookFlowController setOpenAnimationRect:](self, "setOpenAnimationRect:", v30, v32, v34, v36, v49);
    [v27 coverAnimationSourcePrepare];
    BOOL v42 = +[UIScreen mainScreen];
    id v43 = [v42 snapshotViewAfterScreenUpdates:0];

    [v27 coverAnimationSourceFinalize];
    id v44 = [v43 layer];
    [v44 setZPosition:1000.0];

    BOOL v45 = [v26 view];
    BOOL v46 = [v45 window];
    [v46 addSubview:v43];

    if (v13) {
      id v47 = [v13 mutableCopy];
    }
    else {
      id v47 = objc_alloc_init((Class)NSMutableDictionary);
    }
    unsigned int v15 = v47;
    [v47 setObject:v43 forKeyedSubscript:@"BKBookPresentingOverlayView"];
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"BKBookPresentWithoutCloseAnimation"];

    id v8 = v53;
  }

  return v15;
}

- (id)_viewForCardOverlayFromOptions:(id)a3
{
  return [a3 objectForKeyedSubscript:@"BKBookPresentingOverlayView"];
}

- (void)_removeViewForCardOverlayWithTransaction:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v9 = [(BKBookFlowController *)self _viewForCardOverlayFromOptions:a4];
  [v9 removeFromSuperview];
  uint64_t v7 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v6];

  objc_opt_class();
  id v8 = BUDynamicCast();
  [v8 setBookOpenAnimationHelper:0];
}

- (void)_promptInVCToRestartReadingFromBeginning:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v19 = a3;
  id v6 = +[NSBundle mainBundle];
  uint64_t v18 = [v6 localizedStringForKey:@"You Are Reading This Book" value:&stru_100A70340 table:0];

  uint64_t v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"The book you selected is already open. Would you like to start from the beginning?" value:&stru_100A70340 table:0];

  id v9 = +[UIAlertController alertControllerWithTitle:v18 message:v8 preferredStyle:1];
  id v10 = +[NSBundle mainBundle];
  BOOL v11 = [v10 localizedStringForKey:@"Cancel" value:&stru_100A70340 table:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000D11F4;
  v22[3] = &unk_100A45B60;
  id v12 = v5;
  id v23 = v12;
  id v13 = +[UIAlertAction actionWithTitle:v11 style:1 handler:v22];
  [v9 addAction:v13];

  id v14 = +[NSBundle mainBundle];
  unsigned int v15 = [v14 localizedStringForKey:@"Start from Beginning" value:&stru_100A70340 table:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000D1244;
  v20[3] = &unk_100A45B60;
  id v21 = v12;
  id v16 = v12;
  uint64_t v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v20];
  [v9 addAction:v17];

  [v19 presentViewController:v9 animated:1 completion:0];
}

- (void)_optionallyCloseCardStack:(id)a3 inPresentedVC:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D1388;
  v15[3] = &unk_100A45BB0;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = v9;
  }
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(BKBookFlowController *)self _promptInVCToRestartReadingFromBeginning:v11 completion:v15];
}

- (void)showAssetWithTransaction:(id)a3 assetID:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = +[BKAssetID identifierWithAssetID:a4];
  [(BKBookFlowController *)self showAssetWithTransaction:v15 assetIdentifier:v16 location:v14 options:v13 completion:v12];
}

- (void)showAssetWithTransaction:(id)a3 assetIdentifier:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = sub_1000CAD5C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v12 debugDescription];
    id v19 = [v15 objectForKeyedSubscript:AEAssetLogID];
    *(_DWORD *)buf = 138544130;
    uint64_t v81 = (uint64_t)v18;
    __int16 v82 = 2160;
    uint64_t v83 = 1752392040;
    __int16 v84 = 2112;
    id v85 = v13;
    __int16 v86 = 2114;
    id v87 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction: %{public}@ assetID: %{mask.hash}@ logID: %{public}@", buf, 0x2Au);
  }
  v56 = v14;
  if ([(BKBookFlowController *)self isOpeningFromCard:v12 options:v15])
  {
    id v20 = sub_1000CAD5C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v15 objectForKeyedSubscript:AEAssetLogID];
      *(_DWORD *)buf = 141558530;
      uint64_t v81 = 1752392040;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v13;
      __int16 v84 = 2114;
      id v85 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction step 0: open asset %{mask.hash}@ from card logID: %{public}@", buf, 0x20u);
    }
    CFStringRef v22 = [v13 permanentOrTemporaryAssetID];
    id v23 = [(BKBookFlowController *)self _currentPresenterFromAllScenesForAssetID:v22];

    uint64_t v24 = [v23 presentedViewController];
    if (v24)
    {
      id v25 = (id)v24;
      id v26 = sub_1000CAD5C();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v15 objectForKeyedSubscript:AEAssetLogID];
        *(_DWORD *)buf = 141558530;
        uint64_t v81 = 1752392040;
        __int16 v82 = 2112;
        uint64_t v83 = (uint64_t)v13;
        __int16 v84 = 2114;
        id v85 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction step 0: asset %{mask.hash}@ already open logID: %{public}@", buf, 0x20u);
      }
      objc_opt_class();
      id v28 = [v25 presentedViewController];
      double v29 = BUDynamicCast();

      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_1000D1D98;
      v77[3] = &unk_100A44AF8;
      id v78 = v23;
      id v79 = v16;
      id v30 = v16;
      id v31 = v23;
      [(BKBookFlowController *)self _optionallyCloseCardStack:v29 inPresentedVC:v25 completion:v77];

      goto LABEL_19;
    }
    uint64_t v32 = [(BKBookFlowController *)self _prepareOpenFromCardOverlayWithTransaction:v12 assetIdentifier:v13 options:v15];

    id v15 = (id)v32;
  }
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_1000D1E0C;
  v71[3] = &unk_100A45C00;
  v71[4] = self;
  id v55 = v12;
  id v72 = v12;
  id v33 = v16;
  id v76 = v33;
  id v54 = v13;
  id v34 = v13;
  id v73 = v34;
  id v74 = v14;
  id v35 = v15;
  id v75 = v35;
  double v36 = objc_retainBlock(v71);
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_1000D20B8;
  v67[3] = &unk_100A45C50;
  v67[4] = self;
  id v37 = v34;
  id v68 = v37;
  id v15 = v35;
  id v69 = v15;
  double v38 = v36;
  id v70 = v38;
  double v39 = objc_retainBlock(v67);
  double v40 = +[BKAppDelegate delegate];
  double v41 = [v40 appLaunchCoordinator];

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1000D2670;
  v62[3] = &unk_100A45CA0;
  id v65 = v39;
  id v42 = v41;
  id v63 = v42;
  id v43 = v37;
  id v64 = v43;
  id v44 = v33;
  id v66 = v44;
  id v53 = v39;
  BOOL v45 = objc_retainBlock(v62);
  BOOL v46 = [v15 objectForKeyedSubscript:@"BKBookPresentingForceOpenBeforeWelcomeCompleted"];
  LODWORD(v39) = [v46 BOOLValue];

  id v47 = [v15 objectForKeyedSubscript:AEAssetLogID];
  uint64_t v48 = sub_1000CAD5C();
  BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    if (v49)
    {
      *(_DWORD *)buf = 141558530;
      uint64_t v81 = 1752392040;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v43;
      __int16 v84 = 2114;
      id v85 = v47;
      uint64_t v50 = 32;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction step 2: force open asset %{mask.hash}@ before welcome logID: %{public}@", buf, 0x20u);
    }
    else
    {
      uint64_t v50 = 32;
    }
  }
  else
  {
    if (v49)
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v81 = 1752392040;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v43;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction step 2: appLaunchCoordinatorOnConditionMask begin. assetID: %{mask.hash}@", buf, 0x16u);
    }
    uint64_t v50 = 40;
  }

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1000D27CC;
  v57[3] = &unk_100A45CC8;
  v57[4] = self;
  id v58 = v43;
  id v59 = v42;
  id v60 = v45;
  id v61 = v44;
  id v25 = v44;
  id v51 = v42;
  v52 = v45;
  [v51 appLaunchCoordinatorOnConditionMask:v50 blockID:@"showAsset:onLaunch" performBlock:v57];

  id v13 = v54;
  id v12 = v55;
LABEL_19:
}

- (void)_showAssetWithTransaction:(id)a3 assetIdentifier:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = sub_1000CAD5C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    uint64_t v40 = 1752392040;
    __int16 v41 = 2112;
    id v42 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_showAssetWithTransaction: assetID: %{mask.hash}@", buf, 0x16u);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000D2D94;
  v36[3] = &unk_100A45CF0;
  id v18 = v13;
  id v37 = v18;
  id v19 = v16;
  id v38 = v19;
  id v20 = objc_retainBlock(v36);
  id v21 = [(BKBookFlowController *)self sceneHosting];
  CFStringRef v22 = [v18 permanentOrTemporaryAssetID];
  id v23 = [v21 sceneInfoPresentingAssetID:v22];

  if (v23
    && ([v23 sceneController], uint64_t v24 = objc_claimAutoreleasedReturnValue(), v24, !v24))
  {
    id v25 = [(BKBookFlowController *)self sceneHosting];
    id v26 = sub_1000CAD5C();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27) {
        sub_1007E98E8((uint64_t)v18, v15, v26);
      }

      id v28 = [v18 permanentOrTemporaryAssetID];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000D2ED8;
      v29[3] = &unk_100A45D18;
      id v30 = v12;
      id v31 = self;
      id v32 = v18;
      id v33 = v14;
      id v34 = v15;
      id v35 = v20;
      [v25 requestSceneWithAssetID:v28 completion:v29];
    }
    else
    {
      if (v27) {
        sub_1007E9848(v15, v26);
      }

      ((void (*)(void *, void, void, void))v20[2])(v20, 0, 0, 0);
    }
  }
  else
  {
    [(BKBookFlowController *)self _showAssetWithoutStateRestoration:v12 assetIdentifier:v18 location:v14 options:v15 completion:v20];
  }
}

- (void)_openPDFAsset:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D2FB4;
  block[3] = &unk_100A43D60;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_showAssetWithoutStateRestoration:(id)a3 assetIdentifier:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v49 = a5;
  id v14 = a6;
  id v48 = a7;
  id v15 = sub_1000CAD5C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v14 objectForKeyedSubscript:AEAssetLogID];
    *(_DWORD *)buf = 141558530;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    id v79 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "_showAssetWithoutStateRestoration: Showing asset: %{mask.hash}@ logID: %{public}@", buf, 0x20u);
  }
  id v47 = [v12 originatingSceneController];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v79 = sub_100006FA4;
  v80 = sub_1000071BC;
  id v17 = [(BKBookFlowController *)self sceneHosting];
  id v18 = [v17 defaultSceneControllerForTransaction:v12];
  BUProtocolCast();
  id v81 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v19 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v12];
  if (!v19) {
    BCReportAssertionFailureWithMessage();
  }
  id v44 = (void *)v19;
  id v20 = [v13 permanentOrTemporaryAssetID];
  id v21 = [(BKBookFlowController *)self _currentPresenterFromAllScenesForAssetID:v20];

  uint64_t v72 = 0;
  id v73 = &v72;
  uint64_t v74 = 0x3032000000;
  id v75 = sub_100006FA4;
  id v76 = sub_1000071BC;
  id v77 = [(BKBookFlowController *)self currentAssetPresentersForSingleSceneWithTransaction:v12];
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = sub_100006FA4;
  v70[4] = sub_1000071BC;
  id v71 = [(id)v73[5] lastObject];
  CFStringRef v22 = [v14 objectForKeyedSubscript:@"BKBookPresentingCloseAndReopenAssetIfNeeded"];
  unsigned __int8 v46 = [v22 BOOLValue];

  objc_opt_class();
  id v23 = [v14 objectForKeyedSubscript:@"BKBookPresentingSecure"];
  uint64_t v24 = BUDynamicCast();
  unsigned __int8 v25 = [v24 BOOLValue];

  id v26 = [v14 objectForKeyedSubscript:@"BKBookPresentingForceExistingAssetToClose"];
  BOOL v27 = v26;
  if (v26) {
    unsigned __int8 v45 = [v26 BOOLValue];
  }
  else {
    unsigned __int8 v45 = 1;
  }

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000D39B0;
  v68[3] = &unk_100A45D68;
  v68[4] = self;
  id v28 = v13;
  id v69 = v28;
  double v29 = objc_retainBlock(v68);
  id v30 = ((void (*)(void))v29[2])();
  id v31 = [(BKBookFlowController *)self _optionsForLibraryAsset:v30 transaction:v12];
  id v32 = [v31 mutableCopy];

  unsigned __int8 v33 = [v30 isAudiobook];
  if (v14) {
    [v32 addEntriesFromDictionary:v14];
  }
  if (v49) {
    [v32 setObject:v49 forKeyedSubscript:@"BKAssetPresentingOpenLocationKey"];
  }
  id v34 = [(BKBookFlowController *)self minifiedPresenter];
  [v34 setShouldIgnoreCurrentBookNotifications:1];

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000D3A08;
  v50[3] = &unk_100A46138;
  id v35 = v28;
  id v51 = v35;
  id v36 = v14;
  id v52 = v36;
  id v37 = v12;
  id v53 = v37;
  id v38 = v32;
  id v54 = v38;
  id v55 = self;
  unsigned __int8 v64 = v25;
  id v61 = buf;
  id v39 = v48;
  id v59 = v39;
  id v40 = v21;
  id v56 = v40;
  id v41 = v47;
  unsigned __int8 v65 = v33;
  id v57 = v41;
  CGRect v62 = v70;
  id v63 = &v72;
  id v42 = v29;
  id v60 = v42;
  unsigned __int8 v66 = v46;
  id v43 = v49;
  id v58 = v43;
  unsigned __int8 v67 = v45;
  [(BKBookFlowController *)self minifiedAssetPresenterForAssetIdentifier:v35 transaction:v37 options:v38 completion:v50];

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_closePresenter:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BKBookFlowController *)self sceneHosting];
  id v11 = [v10 sceneControllerForViewController:v8];

  if (!v11) {
    BCReportAssertionFailureWithMessage();
  }
  id v12 = [v11 bookFlowAssetPresenting];
  if (!v12) {
    BCReportAssertionFailureWithMessage();
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D76B4;
  v16[3] = &unk_100A46160;
  id v17 = v12;
  id v18 = v8;
  BOOL v20 = a4;
  id v19 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v12;
  [v15 presenterWaitForAssetPresenterTransitionsToFinishIfNeededWithCompletion:v16];
}

- (void)closeAllPresentersForSingleSceneWithTransaction:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(BKBookFlowController *)self currentAssetPresentersForSingleSceneWithTransaction:a3];
  [(BKBookFlowController *)self _closePresenters:v9 animated:v5 completion:v8];
}

- (void)_closePresenters:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 lastObject];
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D7870;
    v13[3] = &unk_100A46188;
    id v14 = v8;
    id v15 = v10;
    id v16 = self;
    BOOL v18 = v6;
    id v17 = v9;
    [(BKBookFlowController *)self _closePresenter:v15 animated:v6 completion:v13];
  }
  else
  {
    id v11 = objc_retainBlock(v9);
    id v12 = v11;
    if (v11) {
      (*((void (**)(id))v11 + 2))(v11);
    }
  }
}

- (void)_closeMinifiedPresenters:(id)a3 excludeAssetID:(id)a4 isAudiobook:(BOOL)a5 completion:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 anyObject];
  if (v13)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000D7B4C;
    v24[3] = &unk_100A459A8;
    id v25 = v10;
    id v14 = v13;
    id v26 = v14;
    BOOL v27 = self;
    id v15 = v11;
    id v28 = v15;
    char v30 = v7;
    id v29 = v12;
    id v16 = objc_retainBlock(v24);
    id v17 = [v14 minifiedAssetPresenterAssetID];
    unsigned __int8 v18 = [v17 isEqualToString:v15];

    if ([v14 minifiedAssetPresenterIsAudiobook] != v7
      || (v18 & 1) != 0
      || +[BKSceneUtilities hasMultiWindowEnabled]
      || (v7 & 1) != 0)
    {
      ((void (*)(void *))v16[2])(v16);
    }
    else
    {
      id v19 = [(BKBookFlowController *)self minifiedPresenter];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000D7BBC;
      v22[3] = &unk_100A442B8;
      id v23 = v16;
      [v19 minifiedPresenterClose:v14 completion:v22];
    }
  }
  else
  {
    id v20 = objc_retainBlock(v12);
    id v21 = v20;
    if (v20) {
      (*((void (**)(id))v20 + 2))(v20);
    }
  }
}

- (void)handleFamilyChangeErrorWithTransaction:(id)a3 error:(id)a4 assetIdentifier:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v9 = a5;
  id v10 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v8];
  id v11 = +[NSBundle mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"To read it, you must buy it from the Book Store.", &stru_100A70340, 0 value table];

  id v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"This book is no longer shared with you." value:&stru_100A70340 table:0];
  id v29 = (void *)v12;
  id v15 = +[UIAlertController alertControllerWithTitle:v14 message:v12 preferredStyle:1];

  id v16 = +[NSBundle mainBundle];
  id v17 = [v16 localizedStringForKey:@"Cancel" value:&stru_100A70340 table:0];
  unsigned __int8 v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:0];
  [v15 addAction:v18];

  objc_opt_class();
  id v19 = BUDynamicCast();
  id v20 = [v19 assetID];

  if (v20)
  {
    id v28 = v8;
    id v21 = +[NSBundle mainBundle];
    CFStringRef v22 = [v21 localizedStringForKey:@"Delete Book" value:&stru_100A70340 table:0];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000D7FC4;
    v37[3] = &unk_100A461B0;
    id v23 = v20;
    id v38 = v23;
    uint64_t v24 = +[UIAlertAction actionWithTitle:v22 style:2 handler:v37];
    [v15 addAction:v24];

    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_100006FA4;
    v35[4] = sub_1000071BC;
    id v36 = self;
    id v25 = +[NSBundle mainBundle];
    id v26 = [v25 localizedStringForKey:@"View in Book Store" value:&stru_100A70340 table:0];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000D8064;
    v31[3] = &unk_100A461D8;
    id v34 = v35;
    id v32 = v23;
    id v33 = v10;
    BOOL v27 = +[UIAlertAction actionWithTitle:v26 style:0 handler:v31];
    [v15 addAction:v27];

    _Block_object_dispose(v35, 8);
    id v8 = v28;
  }
  [v10 presenterShowAlertController:v15 animated:1];
}

- (void)preflightShowAssetWithTransaction:(id)a3 assetIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(BKBookFlowController *)self libraryAssetProvider];
  uint64_t v12 = [v11 libraryAssetOnMainQueueWithAssetIdentifier:v10];

  LOBYTE(v10) = [v12 isLocal];
  if ((v10 & 1) != 0
    || !+[BKReachability isOffline])
  {
    id v23 = objc_retainBlock(v9);
    uint64_t v24 = v23;
    if (v23) {
      (*((void (**)(id, uint64_t))v23 + 2))(v23, 1);
    }
  }
  else
  {
    id v13 = +[NSBundle mainBundle];
    id v14 = [v13 localizedStringForKey:@"This book can’t be downloaded." value:&stru_100A70340 table:0];

    id v15 = +[NSBundle mainBundle];
    id v16 = [v15 localizedStringForKey:@"Apple Books isn’t connected to the internet." value:&stru_100A70340 table:0];

    id v17 = +[UIAlertController alertControllerWithTitle:v14 message:v16 preferredStyle:1];
    unsigned __int8 v18 = +[NSBundle mainBundle];
    id v19 = [v18 localizedStringForKey:@"OK" value:&stru_100A70340 table:0];
    id v20 = +[UIAlertAction actionWithTitle:v19 style:1 handler:0];
    [v17 addAction:v20];

    id v21 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v8];
    CFStringRef v22 = [v21 presenterSceneController];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000D8370;
    v25[3] = &unk_100A45B88;
    id v26 = v9;
    char v27 = 0;
    [v22 presentViewController:v17 animated:1 completion:v25];
  }
}

- (void)handleBookOpenErrorWithTransaction:(id)a3 error:(id)a4 assetIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 code] != (id)2002
    || ([v9 domain],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 isEqualToString:AssetEngineErrorDomain],
        v11,
        (v12 & 1) == 0))
  {
    if ([v9 code] == (id)2003
      && ([v9 domain],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unsigned int v14 = [v13 isEqualToString:AssetEngineErrorDomain],
          v13,
          v14))
    {
      [(BKBookFlowController *)self handleFamilyChangeErrorWithTransaction:v8 error:v9 assetIdentifier:v10];
    }
    else if ([v9 code] == (id)3001)
    {
      id v15 = [(BKBookFlowController *)self libraryAssetProvider];
      id v16 = [v15 libraryAssetOnMainQueueWithAssetIdentifier:v10];

      id v17 = [(BKBookFlowController *)self libraryAssetProvider];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000D85C4;
      v20[3] = &unk_100A45D40;
      void v20[4] = self;
      id v21 = v8;
      [v17 assetForLibraryAsset:v16 completion:v20];
    }
    else if ([v9 code] == (id)1)
    {
      unsigned __int8 v18 = [v9 domain];
      unsigned int v19 = [v18 isEqualToString:@"BKAssetLookup"];

      if (v19) {
        [(BKBookFlowController *)self showInstallationErrorWithTransaction:v8 assetIdentifier:v10];
      }
    }
  }
}

- (void)showNotEnoughMemAlertWithTransaction:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"Unable to Open “%@”" value:&stru_100A70340 table:0];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v6);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"Cannot Open Document" value:&stru_100A70340 table:0];
  unsigned __int8 v12 = +[UIAlertController alertControllerWithTitle:v11 message:v18 preferredStyle:1];

  id v13 = +[NSBundle mainBundle];
  unsigned int v14 = [v13 localizedStringForKey:@"OK" value:&stru_100A70340 table:0];
  id v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];
  [v12 addAction:v15];

  id v16 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v7];

  id v17 = [v16 presenterSceneController];
  [v17 presentViewController:v12 animated:1 completion:0];
}

- (void)showInstallationErrorWithTransaction:(id)a3 assetIdentifier:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = a4;
    id v8 = +[BKLibraryManager defaultManager];
    id v9 = [v8 libraryAssetOnMainQueueWithAssetIdentifier:v7];

    if (v9)
    {
      id v25 = [v9 title];
      id v10 = +[NSBundle mainBundle];
      uint64_t v24 = [v10 localizedStringForKey:@"There is not enough available storage to install this book. You can manage your storage in Settings." value:&stru_100A70340 table:0];

      id v11 = +[NSBundle mainBundle];
      unsigned __int8 v12 = [v11 localizedStringForKey:@"Cannot install “%@”" value:&stru_100A70340 table:0];
      id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v25);
      unsigned int v14 = +[UIAlertController alertControllerWithTitle:v13 message:v24 preferredStyle:1];

      id v15 = +[NSBundle mainBundle];
      id v16 = [v15 localizedStringForKey:@"OK" value:&stru_100A70340 table:0];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000D8C0C;
      v28[3] = &unk_100A46200;
      v28[4] = self;
      id v17 = v9;
      id v29 = v17;
      id v18 = +[UIAlertAction actionWithTitle:v16 style:1 handler:v28];
      [v14 addAction:v18];

      unsigned int v19 = +[NSBundle mainBundle];
      id v20 = [v19 localizedStringForKey:@"Settings" value:&stru_100A70340 table:0];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000D8CAC;
      v26[3] = &unk_100A46200;
      v26[4] = self;
      id v27 = v17;
      id v21 = +[UIAlertAction actionWithTitle:v20 style:0 handler:v26];
      [v14 addAction:v21];

      CFStringRef v22 = [(BKBookFlowController *)self _bookFlowAssetPresentingForShowAssetAction:v6];
      id v23 = [v22 presenterSceneController];
      [v23 presentViewController:v14 animated:1 completion:0];
    }
  }
}

- (void)showAssetWithTransaction:(id)a3 storeID:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 unsignedLongLongValue])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    CFStringRef v22 = sub_100006FA4;
    id v23 = sub_1000071BC;
    id v11 = +[BSUIItemDescriptionCache sharedInstance];
    id v25 = v9;
    unsigned __int8 v12 = +[NSArray arrayWithObjects:&v25 count:1];
    id v13 = [v11 itemDescriptionsFromIdentifiers:v12];
    id v24 = [v13 objectForKeyedSubscript:v9];

    unsigned int v14 = (void *)v20[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000D8F9C;
    v15[3] = &unk_100A46228;
    void v15[4] = self;
    id v16 = v8;
    id v17 = v10;
    id v18 = &v19;
    [v14 get:v15];

    _Block_object_dispose(&v19, 8);
  }
}

- (void)presentItem:(id)a3 transaction:(id)a4 host:(id)a5 source:(id)a6
{
}

- (void)presentItem:(id)a3 transaction:(id)a4 host:(id)a5 source:(id)a6 options:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v17 storeID];
  if (v17 && v16) {
    [(BKBookFlowController *)self _presentItem:v17 transaction:v12 host:v13 source:v14 options:v15];
  }
}

- (void)_presentItem:(id)a3 transaction:(id)a4 host:(id)a5 source:(id)a6 options:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v12 storeID];
  id v18 = (void *)v17;
  if (v12 && v17)
  {
    if ([(BKBookFlowController *)self isOpeningFromCard:v13 options:v16])
    {
      uint64_t v19 = [v12 storeID];
      id v20 = +[BKAssetID identifierWithAssetID:v19];
      uint64_t v21 = [(BKBookFlowController *)self _prepareOpenFromCardOverlayWithTransaction:v13 assetIdentifier:v20 options:v16];

      id v16 = (id)v21;
    }
    CFStringRef v22 = [(BKBookFlowController *)self libraryAssetProvider];
    id v23 = [v22 libraryAssetOnMainQueueWithAssetID:v18];

    id v24 = +[NSMutableDictionary dictionaryWithDictionary:v16];
    [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:@"BKBookPresentingCanPresentOverStore"];
    [v24 setObject:v14 forKeyedSubscript:@"BKBookPresentingCoverAnimationHost"];
    [v24 setObject:v15 forKeyedSubscript:@"BKBookPresentingCoverAnimationSource"];
    if ([v23 canOpen])
    {
      [(BKBookFlowController *)self showAssetWithTransaction:v13 assetID:v18 location:0 options:v24 completion:0];
    }
    else if ([v23 isCloud] && (objc_msgSend(v23, "isPreorderBook") & 1) == 0)
    {
      id v38 = +[BKAssetID identifierWithAssetID:v18];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000D95D4;
      v45[3] = &unk_100A46278;
      id v46 = v13;
      id v47 = self;
      id v48 = v23;
      id v49 = v24;
      [(BKBookFlowController *)self minifiedAssetPresenterForAssetIdentifier:v38 transaction:v46 completion:v45];
    }
    else
    {
      id v25 = [v12 sampleDownloadURL];

      if (v25)
      {
        id v35 = v23;
        uint64_t v26 = [v12 artworkURLTemplate];
        if (v26)
        {
          +[BCCacheManager defaultCacheManager];
          v27 = id v36 = v15;
          id v28 = [v12 storeID];
          [v27 addURLTemplate:v26 forIdentifier:v28];

          id v15 = v36;
        }
        id v34 = (void *)v26;
        uint64_t v29 = [v12 title];
        if (v29) {
          [v24 setObject:v29 forKeyedSubscript:@"title"];
        }
        id v37 = v14;
        id v30 = [v12 author:v29];
        if (v30) {
          [v24 setObject:v30 forKeyedSubscript:@"author"];
        }
        id v31 = +[BKAppDelegate delegate];
        unsigned int v32 = [v31 isConnectedToInternet];

        if (v32)
        {
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1000D9964;
          v39[3] = &unk_100A44358;
          id v40 = v18;
          id v41 = self;
          id v42 = v24;
          id v43 = v13;
          id v44 = v16;
          [v43 commit:v39];
        }
        id v23 = v35;
        id v14 = v37;
      }
    }
  }
}

- (BKSceneHosting)sceneHosting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHosting);

  return (BKSceneHosting *)WeakRetained;
}

- (BKStorePresenting)storePresenter
{
  return self->_storePresenter;
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return self->_libraryAssetProvider;
}

- (_BKShowAssetInvocation)runningShowAssetInvocation
{
  return self->_runningShowAssetInvocation;
}

- (void)setRunningShowAssetInvocation:(id)a3
{
}

- (NSArray)pendingShowAssetInvocations
{
  return self->_pendingShowAssetInvocations;
}

- (void)setPendingShowAssetInvocations:(id)a3
{
}

- (CGRect)openAnimationRect
{
  double x = self->_openAnimationRect.origin.x;
  double y = self->_openAnimationRect.origin.y;
  double width = self->_openAnimationRect.size.width;
  double height = self->_openAnimationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOpenAnimationRect:(CGRect)a3
{
  self->_openAnimationRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingShowAssetInvocations, 0);
  objc_storeStrong((id *)&self->_runningShowAssetInvocation, 0);
  objc_storeStrong((id *)&self->_libraryAssetProvider, 0);
  objc_storeStrong((id *)&self->_minifiedPresenter, 0);
  objc_storeStrong((id *)&self->_storePresenter, 0);

  objc_destroyWeak((id *)&self->_sceneHosting);
}

@end