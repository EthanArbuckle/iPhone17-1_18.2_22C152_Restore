@interface BSUIStoreServices
+ (BSUIStoreServices)sharedInstance;
+ (id)getInstance;
+ (void)checkAudiobookAvailabilityForStoreID:(id)a3 completion:(id)a4;
- (BSUIDownloadPurchaseMonitor)downloadPurchaseMonitor;
- (BSUIStoreServices)initWithDelegate:(id)a3;
- (BSUIStoreServicesDelegate)delegate;
- (id)_optionsForTransaction:(id)a3;
- (id)analyticsTrackerForPurchaseMonitor:(id)a3;
- (id)customerReviewURLForAssetID:(id)a3;
- (void)_analyticsSubmitHideBookEventWithStoreIDs:(id)a3 contentTypeDictionary:(id)a4 supplementalContentCountDictionary:(id)a5 hasRACSupportDictionary:(id)a6 tracker:(id)a7;
- (void)_setPurchaseHidden:(BOOL)a3 forStoreID:(id)a4 withCompletion:(id)a5;
- (void)canHandleURLAsProductPage:(id)a3 completion:(id)a4;
- (void)hidePurchasedForStoreIDs:(id)a3 contentTypeDictionary:(id)a4 supplementalContentCountDictionary:(id)a5 hasRACSupportDictionary:(id)a6 tracker:(id)a7;
- (void)pauseRemovingFromMySamples;
- (void)productPageURLForStoreID:(id)a3 completion:(id)a4;
- (void)purchasedDidHide:(BOOL)a3 withStoreID:(id)a4 withCompletion:(id)a5;
- (void)purchasedHiddenDidChange:(id)a3 :(id)a4;
- (void)resumeRemovingFromMySamplesWithTracker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadPurchaseMonitor:(id)a3;
- (void)showProductPageForStoreID:(id)a3 resourceType:(int64_t)a4 transaction:(id)a5 needsAnalyticsLinkData:(BOOL)a6;
- (void)showProductPagesForStoreIDs:(id)a3 resourceTypes:(id)a4 focusedIndex:(unint64_t)a5 transaction:(id)a6 needsAnalyticsLinkData:(BOOL)a7;
- (void)showPurchasedForStoreID:(id)a3;
- (void)showWriteAReviewForStoreId:(id)a3 transaction:(id)a4;
- (void)showWriteAReviewForStoreId:(id)a3 transaction:(id)a4 completion:(id)a5;
@end

@implementation BSUIStoreServices

- (BSUIStoreServices)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BSUIStoreServices;
  v5 = [(BSUIStoreServices *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [[BSUIDownloadPurchaseMonitor alloc] initWithDelegate:v6];
    downloadPurchaseMonitor = v6->_downloadPurchaseMonitor;
    v6->_downloadPurchaseMonitor = v7;
  }
  return v6;
}

+ (id)getInstance
{
  return +[BSUIStoreServices sharedInstance];
}

+ (BSUIStoreServices)sharedInstance
{
  if (qword_3D41B8[0] != -1) {
    dispatch_once(qword_3D41B8, &stru_38F6D0);
  }
  v2 = (void *)qword_3D41B0;

  return (BSUIStoreServices *)v2;
}

+ (void)checkAudiobookAvailabilityForStoreID:(id)a3 completion:(id)a4
{
  id v11 = a3;
  v5 = (void (**)(id, void))a4;
  if (+[BKReachability isOffline])
  {
    uint64_t v6 = 0;
  }
  else
  {
    v7 = +[BCMBridgedCatalogService sharedInstance];
    id v8 = objc_alloc((Class)BFMRequestMetadata);
    v9 = +[NSString stringWithFormat:@"%s", "BSUIStoreServices.m"];
    id v10 = [v8 initWithFileID:v9 line:77];
    uint64_t v6 = [v7 checkAvailabilityForStoreID:v11 type:0 metadata:v10] ^ 1;
  }
  v5[2](v5, v6);
}

- (id)analyticsTrackerForPurchaseMonitor:(id)a3
{
  id v4 = [(BSUIStoreServices *)self delegate];
  v5 = [v4 analyticsTrackerForStoreServices:self];

  return v5;
}

- (id)_optionsForTransaction:(id)a3
{
  if (a3)
  {
    uint64_t v6 = BCTransactionOptionsTransactionKey;
    id v7 = a3;
    id v3 = a3;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = &__NSDictionary0__struct;
  }

  return v4;
}

- (void)showProductPageForStoreID:(id)a3 resourceType:(int64_t)a4 transaction:(id)a5 needsAnalyticsLinkData:(BOOL)a6
{
  BOOL v6 = a6;
  id v16 = a3;
  id v10 = a5;
  id v11 = a3;
  v12 = +[NSArray arrayWithObjects:&v16 count:1];
  v13 = +[NSNumber numberWithInteger:a4];
  v15 = v13;
  v14 = +[NSArray arrayWithObjects:&v15 count:1];

  [(BSUIStoreServices *)self showProductPagesForStoreIDs:v12 resourceTypes:v14 focusedIndex:0 transaction:v10 needsAnalyticsLinkData:v6];
}

- (void)showProductPagesForStoreIDs:(id)a3 resourceTypes:(id)a4 focusedIndex:(unint64_t)a5 transaction:(id)a6 needsAnalyticsLinkData:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = BSUIStoreServicesLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v12 componentsJoinedByString:@", "];
    v17 = +[NSNumber numberWithUnsignedInteger:a5];
    *(_DWORD *)buf = 136446722;
    v46 = "-[BSUIStoreServices showProductPagesForStoreIDs:resourceTypes:focusedIndex:transaction:needsAnalyticsLinkData:]";
    __int16 v47 = 2112;
    v48 = v16;
    __int16 v49 = 2112;
    v50 = v17;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}s adamIDs=[%@], focusedIndex=%@", buf, 0x20u);
  }
  if ([v12 count])
  {
    BOOL v30 = a7;
    unint64_t v31 = a5;
    v29 = [(BSUIStoreServices *)self _optionsForTransaction:v14];
    v18 = +[NSMutableArray array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v19 = v13;
    id v20 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v41;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = +[BCMAssetWrapper nameForResourceType:](BCMAssetWrapper, "nameForResourceType:", [*(id *)(*((void *)&v40 + 1) + 8 * i) integerValue]);
          [v18 addObject:v24];
        }
        id v21 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v21);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_3D974;
    v34[3] = &unk_38F720;
    BOOL v39 = v30;
    v34[4] = self;
    id v35 = v12;
    unint64_t v38 = v31;
    id v25 = v18;
    id v36 = v25;
    id v26 = v29;
    id v37 = v26;
    v27 = objc_retainBlock(v34);
    v28 = v27;
    if (v14)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_3DC00;
      v32[3] = &unk_38E0B8;
      v33 = v27;
      [v14 commit:v32];
    }
    else
    {
      ((void (*)(void *))v27[2])(v27);
    }
  }
}

- (void)_setPurchaseHidden:(BOOL)a3 forStoreID:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7
    && (+[BLLibraryUtility _isMultiUser] & 1) == 0
    && (+[BURestrictionsProvider sharedInstance],
        v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 isAccountModificationAllowed],
        v9,
        v10))
  {
    id v11 = +[JSABridge sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_3DD60;
    v14[3] = &unk_38F770;
    id v16 = v8;
    BOOL v17 = a3;
    id v15 = v7;
    [v11 enqueueBlock:v14 file:@"BSUIStoreServices.m" line:170];
  }
  else
  {
    id v12 = objc_retainBlock(v8);
    id v13 = v12;
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

- (void)hidePurchasedForStoreIDs:(id)a3 contentTypeDictionary:(id)a4 supplementalContentCountDictionary:(id)a5 hasRACSupportDictionary:(id)a6 tracker:(id)a7
{
  id v11 = a3;
  id v59 = a4;
  id v52 = a5;
  id v51 = a6;
  id v50 = a7;
  id v12 = BSUIStoreServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v11 allObjects];
    id v14 = [v13 componentsJoinedByString:@", "];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "[BSUIStoreServices] hidePurchasedForStoreIDs:(%@)", (uint8_t *)&buf, 0xCu);
  }
  id v15 = objc_opt_new();
  v60 = objc_opt_new();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v91 = 0x3032000000;
  v92 = sub_3E7F8;
  v93 = sub_3E808;
  id v94 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = sub_3E7F8;
  v84[4] = sub_3E808;
  id v85 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v11;
  id v16 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v81;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v81 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v80 + 1) + 8 * i);
        id v20 = [v59 objectForKeyedSubscript:v19];
        BOOL v21 = [v20 integerValue] == (char *)&dword_0 + 2;

        if (v21) {
          uint64_t v22 = v15;
        }
        else {
          uint64_t v22 = v60;
        }
        [v22 addObject:v19];
      }
      id v16 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v16);
  }

  group = dispatch_group_create();
  if ([v60 count])
  {
    dispatch_group_enter(group);
    v23 = BSUIStoreServicesLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v60 allObjects];
      id v25 = [v24 componentsJoinedByString:@", "];
      *(_DWORD *)v87 = 138412290;
      v88 = v25;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "BSUIStoreServices hiding jalisco items with identifiers on server %@", v87, 0xCu);
    }
    id v26 = +[BDSJaliscoDAAPClient sharedClient];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_3E810;
    v76[3] = &unk_38F798;
    v79 = v84;
    id v77 = v60;
    v78 = group;
    [v26 hideItemsWithStoreIDs:v77 completion:v76];
  }
  v57 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v55 = v15;
  id v27 = [v55 countByEnumeratingWithState:&v72 objects:v86 count:16];
  if (v27)
  {
    uint64_t v58 = *(void *)v73;
    uint64_t v28 = MPMediaItemPropertyStoreID;
    uint64_t v29 = MPMediaItemPropertyPurchaseHistoryID;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v73 != v58) {
          objc_enumerationMutation(v55);
        }
        unint64_t v31 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
        v32 = +[MPMediaQuery bk_audiobooksQuery];
        v33 = +[MPMediaPropertyPredicate predicateWithValue:v31 forProperty:v28];
        [v32 addFilterPredicate:v33];

        v34 = [v32 collections];
        id v35 = [v34 firstObject];

        id v36 = [v35 bk_cloudRepresentativeItem];
        id v37 = [v36 valueForProperty:v29];
        if (v37)
        {
          [v57 setObject:v37 forKeyedSubscript:v31];
        }
        else
        {
          unint64_t v38 = BSUIStoreServicesLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v87 = 138412290;
            v88 = v31;
            _os_log_error_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, "BSUIStoreServices failed to find purchase history id for audiobook %@", v87, 0xCu);
          }
        }
      }
      id v27 = [v55 countByEnumeratingWithState:&v72 objects:v86 count:16];
    }
    while (v27);
  }

  BOOL v39 = [v57 allValues];
  BOOL v40 = [v39 count] == 0;

  if (!v40)
  {
    long long v41 = BSUIStoreServicesLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      long long v42 = [v57 allKeys];
      *(_DWORD *)v87 = 138412290;
      v88 = v42;
      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "BSUIStoreServices hiding audiobooks with identifiers %@", v87, 0xCu);
    }
    dispatch_group_enter(group);
    long long v43 = +[MPCloudController sharedCloudController];
    v44 = [v57 allValues];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_3E964;
    v68[3] = &unk_38F800;
    p_long long buf = &buf;
    id v69 = v57;
    v70 = group;
    [v43 hideItemsWithPurchaseHistoryIDs:v44 completionHandler:v68];
  }
  v45 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3EB00;
  block[3] = &unk_38F850;
  v66 = &buf;
  v67 = v84;
  block[4] = self;
  id v62 = v59;
  id v63 = v52;
  id v64 = v51;
  id v65 = v50;
  id v46 = v50;
  id v47 = v51;
  id v48 = v52;
  id v49 = v59;
  dispatch_group_notify(group, v45, block);

  _Block_object_dispose(v84, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)showPurchasedForStoreID:(id)a3
{
}

- (void)purchasedHiddenDidChange:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_0, "Books/BSUIPurchaseHiddenChange", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3EF84;
  block[3] = &unk_38E360;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  os_activity_apply(v8, block);
}

- (void)purchasedDidHide:(BOOL)a3 withStoreID:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = BSUIStoreServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BSUIStoreServices Attempting to update jalisco after hide:%d storeid:%@.", buf, 0x12u);
  }

  if (!v6)
  {
    id v10 = +[MPCloudController sharedCloudController];
    [v10 updateJaliscoMediaLibraryWithReason:1 completionHandler:&stru_38F870];
  }
  id v11 = +[BDSJaliscoDAAPClient sharedClient];
  [v11 setItemHidden:v6 forStoreID:v7 completion:0];

  id v12 = +[BDSJaliscoDAAPClient sharedClient];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3F468;
  v15[3] = &unk_38F898;
  BOOL v18 = v6;
  id v16 = v7;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  [v12 updatePolitely:0 reason:8 completion:v15];
}

- (void)showWriteAReviewForStoreId:(id)a3 transaction:(id)a4
{
}

- (void)showWriteAReviewForStoreId:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = BSUIStoreServicesLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "BSUIStoreServices showWriteAReviewForStoreId adamID=%@.", (uint8_t *)&buf, 0xCu);
  }

  id v12 = [(BSUIStoreServices *)self customerReviewURLForAssetID:v8];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_3F880;
  v23[3] = &unk_38E360;
  v23[4] = self;
  id v13 = v9;
  id v24 = v13;
  id v14 = v12;
  id v25 = v14;
  id v15 = objc_retainBlock(v23);
  id v16 = v15;
  if (!v14)
  {
    id v17 = objc_retainBlock(v10);
    BOOL v18 = v17;
    if (v17) {
      v17[2](v17, 0);
    }
    goto LABEL_11;
  }
  if (!v13)
  {
    ((void (*)(void *))v15[2])(v15);
    uint64_t v19 = objc_retainBlock(v10);
    BOOL v18 = v19;
    if (v19) {
      v19[2](v19, 1);
    }
LABEL_11:

    id v10 = v18;
    goto LABEL_12;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_3F8E4;
  uint64_t v29 = sub_3F910;
  BOOL v30 = objc_retainBlock(v10);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_3F918;
  v20[3] = &unk_38F8C0;
  id v21 = v16;
  p_long long buf = &buf;
  [v13 commit:v20];

  _Block_object_dispose(&buf, 8);
LABEL_12:
}

- (id)customerReviewURLForAssetID:(id)a3
{
  id v3 = (void *)JSARatingsWriteReviewUrlString;
  id v4 = a3;
  id v5 = [v3 mutableCopy];
  [v5 replaceOccurrencesOfString:@"%7Bid%7D" withString:v4 options:2 range:[v5 length]];

  BOOL v6 = +[NSURL URLWithString:v5];

  return v6;
}

- (void)canHandleURLAsProductPage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(21, 0);
  if (v6)
  {
    id v8 = +[MCProfileConnection sharedConnection];
    unsigned __int8 v9 = [v8 isOnDeviceAppInstallationAllowed];

    if (v9)
    {
      id v10 = [v5 underlyingURL];
      id v11 = [v10 scheme];

      if ([v11 caseInsensitiveCompare:@"http"]
        && [v11 caseInsensitiveCompare:@"https"])
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_3FD98;
        block[3] = &unk_38E0B8;
        id v26 = v6;
        dispatch_async(v7, block);
        id v12 = v26;
      }
      else
      {
        id v12 = dispatch_group_create();
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x2020000000;
        v24[3] = 0;
        id v13 = [v5 underlyingURL];
        if (v13)
        {
          dispatch_group_enter(v12);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_3FDAC;
          v21[3] = &unk_38F8E8;
          v23 = v24;
          id v14 = v12;
          id v22 = v14;
          [v13 bc_isStoreProductURLWithCompletion:v21];
          dispatch_group_enter(v14);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_3FDCC;
          v18[3] = &unk_38F8E8;
          BOOL v20 = v24;
          uint64_t v19 = v14;
          [v13 bc_isBookStoreProductURLWithCompletion:v18];
        }
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_3FDEC;
        v15[3] = &unk_38F8C0;
        id v16 = v6;
        id v17 = v24;
        dispatch_group_notify(v12, v7, v15);

        _Block_object_dispose(v24, 8);
      }
    }
    else
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_3FD84;
      v27[3] = &unk_38E0B8;
      id v28 = v6;
      dispatch_async(v7, v27);
      id v11 = v28;
    }
  }
}

- (void)productPageURLForStoreID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (v5)
    {
      uint64_t v15 = 0;
      id v16 = &v15;
      uint64_t v17 = 0x3032000000;
      BOOL v18 = sub_3E7F8;
      uint64_t v19 = sub_3E808;
      id v8 = +[BSUIItemDescriptionCache sharedInstance];
      id v21 = v5;
      unsigned __int8 v9 = +[NSArray arrayWithObjects:&v21 count:1];
      id v10 = [v8 itemDescriptionsFromIdentifiers:v9];
      id v20 = [v10 objectForKey:v5];

      id v11 = (void *)v16[5];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_3FFEC;
      v12[3] = &unk_38F520;
      id v13 = v7;
      id v14 = &v15;
      [v11 get:v12];

      _Block_object_dispose(&v15, 8);
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)pauseRemovingFromMySamples
{
  id v3 = BSUIStoreServicesLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[BSUIStoreServices pauseRemovingFromMySamples]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  [(BSUIDownloadPurchaseMonitor *)self->_downloadPurchaseMonitor pauseRemovingFromMySamples];
}

- (void)resumeRemovingFromMySamplesWithTracker:(id)a3
{
  id v4 = a3;
  id v5 = BSUIStoreServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    id v7 = "-[BSUIStoreServices resumeRemovingFromMySamplesWithTracker:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  [(BSUIDownloadPurchaseMonitor *)self->_downloadPurchaseMonitor resumeRemovingFromMySamplesWithTracker:v4];
}

- (void)_analyticsSubmitHideBookEventWithStoreIDs:(id)a3 contentTypeDictionary:(id)a4 supplementalContentCountDictionary:(id)a5 hasRACSupportDictionary:(id)a6 tracker:(id)a7
{
  id obj = a3;
  id v34 = a4;
  id v33 = a5;
  id v11 = a6;
  id v12 = a7;
  if (v12)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v35 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v35)
    {
      uint64_t v30 = *(void *)v37;
      id v31 = v12;
      id v32 = v11;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v15 = [v12 contentPrivateIDForContentID:v14];
          id v16 = [v12 contentUserIDForContentID:v14];
          uint64_t v17 = [v34 objectForKey:v14];
          BOOL v18 = v17;
          if (v17) {
            id v19 = [v17 integerValue];
          }
          else {
            id v19 = 0;
          }
          id v20 = +[BAEventReporter sharedReporter];
          id v21 = [v20 seriesTypeForContentID:v14];

          id v22 = [v11 objectForKey:v14];

          if (v22)
          {
            v23 = [v11 objectForKey:v14];
            if ([v23 BOOLValue]) {
              uint64_t v24 = 1;
            }
            else {
              uint64_t v24 = 2;
            }
          }
          else
          {
            uint64_t v24 = 0;
          }
          id v25 = objc_alloc((Class)BAContentData);
          id v26 = [v33 objectForKey:v14];
          id v27 = [v25 initWithContentID:v14 contentType:v19 contentPrivateID:v15 contentUserID:v16 contentAcquisitionType:1 contentSubType:0 contentLength:0 supplementalContentCount:v26 seriesType:v21 productionType:v24 isUnified:0 contentKind:0];

          id v28 = +[BAEventReporter sharedReporter];
          id v12 = v31;
          [v28 emitHideBookEventWithTracker:v31 contentData:v27];

          id v11 = v32;
        }
        id v35 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v35);
    }
  }
}

- (BSUIStoreServicesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BSUIStoreServicesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BSUIDownloadPurchaseMonitor)downloadPurchaseMonitor
{
  return self->_downloadPurchaseMonitor;
}

- (void)setDownloadPurchaseMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadPurchaseMonitor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end