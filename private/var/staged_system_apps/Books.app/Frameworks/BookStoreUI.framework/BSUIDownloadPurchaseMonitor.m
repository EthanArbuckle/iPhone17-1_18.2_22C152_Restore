@interface BSUIDownloadPurchaseMonitor
- (BCCloudCollectionsManager)cloudCollectionsManager;
- (BOOL)_isPreOrder:(id)a3;
- (BSUIDownloadPurchaseMonitor)initWithDelegate:(id)a3;
- (BSUIDownloadPurchaseMonitorDelegate)delegate;
- (NSMutableDictionary)downloadPurchaseAttempts;
- (id)_addPurchaseForItemID:(id)a3 isAudioBook:(BOOL)a4;
- (id)_buyParamsDictFromString:(id)a3;
- (id)_newContentDataForID:(id)a3 isAudioBook:(BOOL)a4 hasRacSupport:(BOOL)a5 tracker:(id)a6 supplementalContentCount:(id)a7 appAnalyticsAdditionalData:(id)a8;
- (id)_newPurchaseDataForPurchaseID:(id)a3 isPreorder:(BOOL)a4 pricingParameters:(id)a5;
- (id)_newPurchaseFailData:(int64_t)a3 errorCode:(id)a4 errorDescription:(id)a5 errorDomain:(id)a6;
- (id)_purchaseForItemID:(id)a3;
- (id)purchaseIDs;
- (int64_t)_newProductionTypeForIsAudiobook:(BOOL)a3 hasRacSupport:(BOOL)a4;
- (void)_addStoreIDToWantToReadCollection:(id)a3 tracker:(id)a4 productionType:(int64_t)a5;
- (void)_emitPurchaseAttemptEventWithTracker:(id)a3 forID:(id)a4 buyParams:(id)a5 isAudioBook:(BOOL)a6 hasRacSupport:(BOOL)a7 upSellData:(id)a8 appAnalyticsAdditionalData:(id)a9;
- (void)_emitPurchaseFailEventWithTracker:(id)a3 sessionAssertion:(id)a4 forID:(id)a5 buyParams:(id)a6 hasRacSupport:(BOOL)a7 response:(id)a8 upSellData:(id)a9 appAnalyticsAdditionalData:(id)a10;
- (void)_emitPurchaseSuccessEventWithTracker:(id)a3 sessionAssertion:(id)a4 forID:(id)a5 response:(id)a6 upSellData:(id)a7 appAnalyticsAdditionalData:(id)a8;
- (void)_removePurchaseByItemID:(id)a3;
- (void)_removeStoreIDFromSamplesCollection:(id)a3 tracker:(id)a4 productionType:(int64_t)a5;
- (void)aq_processCompletedPurchaseAttempt:(id)a3;
- (void)aq_processFailedPurchaseAttempt:(id)a3;
- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4;
- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4;
- (void)downloadQueue:(id)a3 purchasedDidFailWithResponse:(id)a4;
- (void)pauseRemovingFromMySamples;
- (void)resumeRemovingFromMySamplesWithTracker:(id)a3;
- (void)setCloudCollectionsManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadPurchaseAttempts:(id)a3;
@end

@implementation BSUIDownloadPurchaseMonitor

- (BSUIDownloadPurchaseMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BSUIDownloadPurchaseMonitor;
  v5 = [(BSUIDownloadPurchaseMonitor *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_t v7 = dispatch_queue_create("BSUIDownloadPurchaseMonitor.access", 0);
    access = v6->_access;
    v6->_access = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[BCCloudCollectionsManager sharedManager];
    cloudCollectionsManager = v6->_cloudCollectionsManager;
    v6->_cloudCollectionsManager = (BCCloudCollectionsManager *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    downloadPurchaseAttempts = v6->_downloadPurchaseAttempts;
    v6->_downloadPurchaseAttempts = (NSMutableDictionary *)v11;

    queuedStoreIDsToRemoveFromMySamples = v6->_queuedStoreIDsToRemoveFromMySamples;
    v6->_queuedStoreIDsToRemoveFromMySamples = 0;

    v14 = +[BLDownloadQueue sharedInstance];
    [v14 addObserver:v6];
  }
  return v6;
}

- (void)_addStoreIDToWantToReadCollection:(id)a3 tracker:(id)a4 productionType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    v10 = +[BCCloudAssetManager sharedManager];
    uint64_t v11 = [v10 readingNowDetailManager];
    id v18 = v8;
    v12 = +[NSArray arrayWithObjects:&v18 count:1];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_2034C;
    v13[3] = &unk_38EB60;
    id v14 = v8;
    v15 = self;
    id v16 = v9;
    int64_t v17 = a5;
    [v11 readingNowDetailsForAssetIDs:v12 completion:v13];
  }
}

- (void)_removeStoreIDFromSamplesCollection:(id)a3 tracker:(id)a4 productionType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    if (self->_queuedStoreIDsToRemoveFromMySamples)
    {
      v10 = BSUIDownloadPurchaseMonitorLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v8;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "BSUIDownloadPurchaseMonitor: Deferred removal of %@ from My Samples", buf, 0xCu);
      }

      [(NSMutableArray *)self->_queuedStoreIDsToRemoveFromMySamples addObject:v8];
    }
    else
    {
      uint64_t v11 = +[BCCollectionMember collectionMemberIDWithCollectionID:kBKCollectionDefaultIDSamples assetID:v8];
      v12 = [(BSUIDownloadPurchaseMonitor *)self cloudCollectionsManager];
      v13 = [v12 collectionMemberManager];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_2097C;
      v15[3] = &unk_38EB38;
      v15[4] = self;
      id v16 = v11;
      id v17 = v9;
      id v18 = v8;
      int64_t v19 = a5;
      id v14 = v11;
      [v13 collectionMemberForCollectionMemberID:v14 completion:v15];
    }
  }
}

- (void)aq_processCompletedPurchaseAttempt:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 purchaseResponse];
  if (v4)
  {
    v5 = (void *)v4;
    unsigned __int8 v6 = [v13 isSupplementalContent];

    if ((v6 & 1) == 0)
    {
      dispatch_queue_t v7 = [v13 tracker];
      id v8 = [v13 sessionAssertion];
      id v9 = [v13 storeID];
      v10 = [v13 purchaseResponse];
      uint64_t v11 = [v13 upSellData];
      v12 = [v13 appAnalyticsAdditionalData];
      [(BSUIDownloadPurchaseMonitor *)self _emitPurchaseSuccessEventWithTracker:v7 sessionAssertion:v8 forID:v9 response:v10 upSellData:v11 appAnalyticsAdditionalData:v12];
    }
  }
}

- (void)aq_processFailedPurchaseAttempt:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [v15 failureResponse];
  if (v4)
  {
    v5 = (void *)v4;
    unsigned __int8 v6 = [v15 isSupplementalContent];

    if ((v6 & 1) == 0)
    {
      dispatch_queue_t v7 = [v15 storeID];
      id v8 = [v15 tracker];
      id v9 = [v15 sessionAssertion];
      v10 = [v15 buyParams];
      id v11 = [v15 hasRacSupport];
      v12 = [v15 failureResponse];
      id v13 = [v15 upSellData];
      id v14 = [v15 appAnalyticsAdditionalData];
      [(BSUIDownloadPurchaseMonitor *)self _emitPurchaseFailEventWithTracker:v8 sessionAssertion:v9 forID:v7 buyParams:v10 hasRacSupport:v11 response:v12 upSellData:v13 appAnalyticsAdditionalData:v14];
    }
  }
}

- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_20FD0;
  v30[4] = sub_20FE0;
  id v8 = [v7 analyticsInfo];
  id v9 = [v8 objectForKeyedSubscript:@"BATracker"];
  id v31 = [v9 newSessionExtendingAssertion];

  v10 = [v7 storeIdentifier];
  id v11 = [v10 stringValue];

  if (v11)
  {
    v12 = [v7 buyParameters];
    unsigned __int8 v13 = [v7 isAudiobook];
    unsigned __int8 v14 = [v7 isSupplementalContent];
    id v15 = [v7 analyticsInfo];
    objc_opt_class();
    id v16 = [v15 objectForKeyedSubscript:@"hasRacSupport"];
    id v17 = BUDynamicCast();

    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_20FE8;
    block[3] = &unk_38EBB0;
    block[4] = self;
    id v23 = v11;
    id v24 = v12;
    unsigned __int8 v28 = v13;
    id v25 = v15;
    id v26 = v17;
    unsigned __int8 v29 = v14;
    v27 = v30;
    id v19 = v17;
    id v20 = v15;
    id v21 = v12;
    dispatch_async(access, block);
  }
  _Block_object_dispose(v30, 8);
}

- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4
{
  id v5 = a4;
  id v6 = [v5 storeID];
  id v7 = [v6 stringValue];

  if ([v7 length])
  {
    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_21364;
    block[3] = &unk_38E360;
    block[4] = self;
    id v10 = v7;
    id v11 = v5;
    dispatch_async(access, block);
  }
}

- (void)downloadQueue:(id)a3 purchasedDidFailWithResponse:(id)a4
{
  id v5 = a4;
  id v6 = [v5 storeID];
  id v7 = [v6 stringValue];

  if ([v7 length])
  {
    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_215AC;
    block[3] = &unk_38E360;
    block[4] = self;
    id v10 = v7;
    id v11 = v5;
    dispatch_async(access, block);
  }
}

- (void)pauseRemovingFromMySamples
{
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_216B4;
  block[3] = &unk_38E738;
  block[4] = self;
  dispatch_async(access, block);
}

- (void)resumeRemovingFromMySamplesWithTracker:(id)a3
{
  id v4 = a3;
  access = self->_access;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_217AC;
  v7[3] = &unk_38E1F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(access, v7);
}

- (BSUIDownloadPurchaseMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BSUIDownloadPurchaseMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BCCloudCollectionsManager)cloudCollectionsManager
{
  return self->_cloudCollectionsManager;
}

- (void)setCloudCollectionsManager:(id)a3
{
}

- (NSMutableDictionary)downloadPurchaseAttempts
{
  return self->_downloadPurchaseAttempts;
}

- (void)setDownloadPurchaseAttempts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadPurchaseAttempts, 0);
  objc_storeStrong((id *)&self->_cloudCollectionsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedStoreIDsToRemoveFromMySamples, 0);

  objc_storeStrong((id *)&self->_access, 0);
}

- (void)_emitPurchaseAttemptEventWithTracker:(id)a3 forID:(id)a4 buyParams:(id)a5 isAudioBook:(BOOL)a6 hasRacSupport:(BOOL)a7 upSellData:(id)a8 appAnalyticsAdditionalData:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  id v19 = [(BSUIDownloadPurchaseMonitor *)self _buyParamsDictFromString:a5];
  id v20 = [v19 objectForKeyedSubscript:@"pricingParameters"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2EBEC;
  block[3] = &unk_38F1A0;
  block[4] = self;
  id v27 = v16;
  BOOL v32 = a6;
  BOOL v33 = a7;
  id v28 = v15;
  id v29 = v18;
  unsigned __int8 v34 = [(BSUIDownloadPurchaseMonitor *)self _isPreOrder:v19];
  id v30 = v20;
  id v31 = v17;
  id v21 = v17;
  id v22 = v20;
  id v23 = v18;
  id v24 = v15;
  id v25 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_emitPurchaseSuccessEventWithTracker:(id)a3 sessionAssertion:(id)a4 forID:(id)a5 response:(id)a6 upSellData:(id)a7 appAnalyticsAdditionalData:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [v17 purchaseParameters];
  id v21 = [(BSUIDownloadPurchaseMonitor *)self _buyParamsDictFromString:v20];

  id v22 = [v21 objectForKeyedSubscript:@"pricingParameters"];
  LOBYTE(v20) = [(BSUIDownloadPurchaseMonitor *)self _isPreOrder:v21];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_2EF5C;
  v40[3] = &unk_38E738;
  id v41 = v15;
  id v23 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2EFE8;
  block[3] = &unk_38F1C8;
  block[4] = self;
  id v32 = v16;
  id v33 = v14;
  id v34 = v17;
  char v39 = (char)v20;
  id v35 = v19;
  id v36 = v22;
  id v37 = v18;
  v38 = objc_retainBlock(v40);
  id v24 = v38;
  id v25 = v18;
  id v26 = v22;
  id v27 = v19;
  id v28 = v17;
  id v29 = v14;
  id v30 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_emitPurchaseFailEventWithTracker:(id)a3 sessionAssertion:(id)a4 forID:(id)a5 buyParams:(id)a6 hasRacSupport:(BOOL)a7 response:(id)a8 upSellData:(id)a9 appAnalyticsAdditionalData:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = [(BSUIDownloadPurchaseMonitor *)self _buyParamsDictFromString:a6];
  id v22 = [v21 objectForKeyedSubscript:@"pricingParameters"];
  unsigned __int8 v23 = [(BSUIDownloadPurchaseMonitor *)self _isPreOrder:v21];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_2F388;
  v43[3] = &unk_38E738;
  id v44 = v16;
  id v32 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2F414;
  block[3] = &unk_38F1F0;
  block[4] = self;
  id v34 = v17;
  BOOL v41 = a7;
  id v35 = v15;
  id v36 = v20;
  unsigned __int8 v42 = v23;
  id v37 = v22;
  id v38 = v18;
  id v39 = v19;
  v40 = objc_retainBlock(v43);
  id v24 = v40;
  id v25 = v19;
  id v26 = v18;
  id v27 = v22;
  id v28 = v20;
  id v29 = v15;
  id v30 = v17;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_buyParamsDictFromString:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 componentsSeparatedByString:@"&"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v10 count] == (char *)&dword_0 + 2)
        {
          id v11 = [v10 objectAtIndexedSubscript:0];
          v12 = [v10 objectAtIndexedSubscript:1];
          if ([v11 length]) {
            [v4 setObject:v12 forKeyedSubscript:v11];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_isPreOrder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"pricingParameters"];
  id v5 = [v3 objectForKeyedSubscript:@"isPreorder"];

  LOBYTE(v3) = [v5 isEqualToString:@"1"];
  LOBYTE(v3) = [v4 hasSuffix:@"PRE"] | v3;

  return (char)v3;
}

- (id)_newContentDataForID:(id)a3 isAudioBook:(BOOL)a4 hasRacSupport:(BOOL)a5 tracker:(id)a6 supplementalContentCount:(id)a7 appAnalyticsAdditionalData:(id)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = [v17 contentPrivateIDForContentID:v14];
  id v19 = [v17 contentUserIDForContentID:v14];

  id v20 = +[BAEventReporter sharedReporter];
  id v21 = [v20 seriesTypeForContentID:v14];

  int64_t v22 = [(BSUIDownloadPurchaseMonitor *)self _newProductionTypeForIsAudiobook:v12 hasRacSupport:v11];
  if (v15 && _os_feature_enabled_impl())
  {
    unsigned __int8 v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 supportsUnifiedProductPage]);
    id v24 = [v15 editionKind];
  }
  else
  {
    unsigned __int8 v23 = 0;
    id v24 = 0;
  }
  if (v12) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 1;
  }
  id v26 = [objc_alloc((Class)BAContentData) initWithContentID:v14 contentType:v25 contentPrivateID:v18 contentUserID:v19 contentAcquisitionType:1 contentSubType:0 contentLength:0 supplementalContentCount:v16 seriesType:v21 productionType:v22 isUnified:v23 contentKind:v24];

  return v26;
}

- (int64_t)_newProductionTypeForIsAudiobook:(BOOL)a3 hasRacSupport:(BOOL)a4
{
  int64_t v4 = 1;
  if (!a4) {
    int64_t v4 = 2;
  }
  if (a3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)_newPurchaseDataForPurchaseID:(id)a3 isPreorder:(BOOL)a4 pricingParameters:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)BAPurchaseData) initWithPurchaseAttemptID:v8 purchaseMethod:0 isPreorder:v5 pricingParameters:v7];

  return v9;
}

- (id)_newPurchaseFailData:(int64_t)a3 errorCode:(id)a4 errorDescription:(id)a5 errorDomain:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [objc_alloc((Class)BAPurchaseFailData) initWithPurchaseFailureReason:a3 errorCode:v11 errorDescription:v10 errorDomain:v9];

  return v12;
}

- (id)purchaseIDs
{
  v2 = (void *)qword_3D4170;
  if (!qword_3D4170)
  {
    uint64_t v3 = objc_opt_new();
    int64_t v4 = (void *)qword_3D4170;
    qword_3D4170 = v3;

    v2 = (void *)qword_3D4170;
  }

  return v2;
}

- (id)_purchaseForItemID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [(BSUIDownloadPurchaseMonitor *)self purchaseIDs];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_addPurchaseForItemID:(id)a3 isAudioBook:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v7 = objc_opt_new();
    id v8 = +[NSUUID UUID];
    id v9 = [v8 UUIDString];
    [v7 setIdentifier:v9];

    [v7 setIsAudioBook:v4];
    id v10 = [(BSUIDownloadPurchaseMonitor *)self purchaseIDs];
    [v10 setObject:v7 forKey:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_removePurchaseByItemID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(BSUIDownloadPurchaseMonitor *)self purchaseIDs];
    [v5 removeObjectForKey:v4];
  }
}

@end