void sub_100002E50(uint64_t a1)
{
  id v1;
  id v2;
  uint64_t vars8;

  v1 = objc_retainBlock(*(id *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    (*((void (**)(id, void))v1 + 2))(v1, 0);
    v1 = v2;
  }
}

void sub_1000030D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000030F4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    v8 = BCProductPageExtensionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002278C((uint64_t)v7, v8);
    }
    v9 = 0;
  }
  else
  {
    v8 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      int v14 = kBKCollectionMinUserCollectionSortOrder;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((int)[v16 sortOrder] >= v14) {
            [v8 addObject:v16];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    v9 = [v8 sortedArrayUsingComparator:&stru_1000313D0];
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100003370;
  v18[3] = &unk_1000313F8;
  objc_copyWeak(&v20, (id *)(a1 + 32));
  id v19 = v9;
  id v17 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

  objc_destroyWeak(&v20);
}

int64_t sub_100003318(id a1, BCMutableCollectionDetail *a2, BCMutableCollectionDetail *a3)
{
  v4 = a3;
  signed int v5 = [(BCMutableCollectionDetail *)a2 sortOrder];
  signed int v6 = [(BCMutableCollectionDetail *)v4 sortOrder];

  if (v5 >= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

void sub_100003370(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCollectionDetailsCache:v1];

  objc_opt_class();
  id v4 = objc_loadWeakRetained(v2);
  signed int v5 = [v4 view];
  BUDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 reloadData];
}

void sub_1000036E4(uint64_t a1, int a2)
{
  if (!a2) {
    return;
  }
  id v9 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 40) isAudiobook]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = +[BAEventReporter sharedReporter];
  id v5 = [v4 seriesTypeForContentID:v9];

  uint64_t v6 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 8);
  int64_t v7 = +[BAEventReporter sharedReporter];
  [v7 emitAddToCollectionEventWithTracker:*(void *)(a1 + 48) collectionID:*(void *)(a1 + 56) contentID:v9 contentAcquisitionType:v6 contentType:v3 supplementalContentCount:0 seriesType:v5 productionType:0];

  if ([*(id *)(a1 + 56) isEqualToString:kBKCollectionDefaultIDWantToRead])
  {
    v8 = +[BAEventReporter sharedReporter];
    [v8 emitWantListAddEventWithTracker:*(void *)(a1 + 48) contentID:v9 contentAcquisitionType:v6 contentType:v3 supplementalContentCount:0 seriesType:v5 productionType:0];
LABEL_10:

    goto LABEL_11;
  }
  if ([*(id *)(a1 + 56) isEqualToString:kBKCollectionDefaultIDFinished])
  {
    v8 = +[BAEventReporter sharedReporter];
    [v8 emitMarkAsFinishedEventWithTracker:*(void *)(a1 + 48) contentID:v9 contentAcquisitionType:v6 contentType:v3 supplementalContentCount:0 seriesType:v5 productionType:0];
    goto LABEL_10;
  }
LABEL_11:
}

void sub_100004418(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[JSABridge sharedInstance];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v3 name];
  if (v6)
  {
    int64_t v7 = [v3 name];
    id v9 = v7;
    v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [v4 enqueueValueCall:v5 arguments:v8 file:@"PPXJSALibraryManager.m" line:129];
  }
  else
  {
    [v4 enqueueValueCall:v5 arguments:0 file:@"PPXJSALibraryManager.m" line:129];
  }
}

void sub_100004A20(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100004ACC;
    v3[3] = &unk_100031530;
    id v4 = *(id *)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

id sub_100004ACC(uint64_t a1)
{
  uint64_t v2 = +[BAEventReporter sharedReporter];
  [v2 emitRemoveFromCollectionEventWithTracker:*(void *)(a1 + 32) collectionID:kBKCollectionDefaultIDWantToRead contentID:*(void *)(a1 + 40) contentAcquisitionType:1 contentType:0 supplementalContentCount:0 seriesType:0 productionType:0];

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return +[PPXBookDataStoreServices _analyticsSubmitRemoveFromWantListEventWithTracker:v3 contentID:v4];
}

void sub_100004C28(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004CDC;
    block[3] = &unk_100031580;
    uint64_t v6 = *(void *)(a1 + 48);
    id v4 = *(id *)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100004CDC(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 48) _contentDataForContentID:*(void *)(a1 + 32) tracker:*(void *)(a1 + 40)];
  uint64_t v2 = +[BAEventReporter sharedReporter];
  [v2 emitAddToCollectionEventWithTracker:*(void *)(a1 + 40) collectionID:kBKCollectionDefaultIDWantToRead contentData:v4];

  uint64_t v3 = +[BAEventReporter sharedReporter];
  [v3 emitWantListAddEventWithTracker:*(void *)(a1 + 40) contentData:v4];
}

void sub_100004E3C(uint64_t a1, uint64_t a2)
{
  id v3 = objc_retainBlock(*(id *)(a1 + 32));
  if (v3)
  {
    id v4 = v3;
    (*((void (**)(id, uint64_t))v3 + 2))(v3, a2);
    id v3 = v4;
  }
}

void sub_100004FCC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005088;
      block[3] = &unk_100031580;
      uint64_t v6 = *(void *)(a1 + 48);
      id v4 = *(id *)(a1 + 32);
      id v5 = *(id *)(a1 + 40);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

void sub_100005088(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 48) _contentDataForContentID:*(void *)(a1 + 32) tracker:*(void *)(a1 + 40)];
  uint64_t v2 = +[BAEventReporter sharedReporter];
  [v2 emitMarkAsFinishedEventWithTracker:*(void *)(a1 + 40) contentData:v3 markedData:0];
}

void sub_1000051DC(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9) {
    id v6 = [v9 isFinished];
  }
  else {
    id v6 = 0;
  }
  id v7 = objc_retainBlock(*(id *)(a1 + 32));
  v8 = v7;
  if (v7) {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
}

uint64_t sub_100005558(uint64_t a1)
{
  qword_100039678 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100005610(id a1)
{
  qword_100039680 = objc_alloc_init(PPXProductPageContext);

  _objc_release_x1();
}

void sub_1000056C0(id a1)
{
  qword_100039690 = objc_alloc_init(PPXProductPageActions);

  _objc_release_x1();
}

void sub_100005CB4(id a1, NSString *a2, BLPurchaseResponse *a3, NSError *a4)
{
  id v4 = BCProductPageExtensionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Just purchased or redownloaded a book", v5, 2u);
  }
}

void sub_100005E58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(a1 + 40) longLongValue]);
  id v4 = +[BLPurchaseRequest requestWithBuyParameters:v2 storeIdentifier:v3];

  [v4 setAudiobook:*(unsigned __int8 *)(a1 + 56)];
  if (*(void *)(a1 + 48))
  {
    v19[0] = *(void *)(a1 + 48);
    v18[0] = @"BATracker";
    v18[1] = @"hasRacSupport";
    id v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
    v19[1] = v5;
    id v6 = (void **)v19;
    id v7 = (const __CFString **)v18;
    uint64_t v8 = 2;
  }
  else
  {
    id v9 = BCProductPageExtensionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002290C(v9);
    }

    CFStringRef v16 = @"hasRacSupport";
    id v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
    id v17 = v5;
    id v6 = &v17;
    id v7 = &v16;
    uint64_t v8 = 1;
  }
  id v10 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v7 count:v8];
  [v4 setAnalyticsInfo:v10];

  id v11 = +[JSABridge sharedInstance];
  id v12 = [v11 windowManager];

  uint64_t v13 = +[BLDownloadQueue sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006090;
  v14[3] = &unk_100031708;
  id v15 = *(id *)(a1 + 40);
  [v13 purchaseWithRequest:v4 uiManager:v12 completion:v14];
}

void sub_100006090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    BSUIGetLibraryItemStateUpdater();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 updateStateToPurchaseFailedForIdentifier:*(void *)(a1 + 32)];
  }
}

void sub_100006458(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_1000069D0(id a1)
{
  qword_1000396A0 = objc_alloc_init(PPXBLDownloadController);

  _objc_release_x1();
}

id sub_100006D04(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _performBlockOnAllAssetsForAssetID:*(void *)(a1 + 40) block:&stru_100031790];
}

void sub_100006D18(id a1, PPXBLDownloadAsset *a2)
{
  uint64_t v2 = a2;
  id v3 = [(PPXBLDownloadAsset *)v2 downloadStatus];
  uint64_t v4 = [v3 downloadID];
  if ([v4 length])
  {
    id v5 = +[BLDownloadQueue sharedInstance];
    [v5 cancelDownloadWithID:v4 withCompletion:0];

    id v6 = BCBookDownloadLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(PPXBLDownloadAsset *)v2 identifier];
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "download canceled %@, downloadID=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void sub_100007488(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(a1 + 40) _updateDownloadingAssets:*(void *)(*((void *)&v8 + 1) + 8 * (void)v8)];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void sub_1000076C4(uint64_t a1)
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v36;
    *(void *)&long long v4 = 138543362;
    long long v31 = v4;
    id v32 = v2;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v9 = [v8 bk_assetIdentifier:v31];
        if ([v9 length])
        {
          long long v10 = [*(id *)(a1 + 40) downloadingAssets];
          long long v11 = [v10 objectForKeyedSubscript:v9];

          if (v11)
          {
            [v11 setDownloadStatus:v8];
            if ([v8 downloadPhase] != (id)3)
            {
              if ([v11 isAudiobook])
              {
                id v12 = [v11 parent];
                if (!v12) {
                  goto LABEL_28;
                }
                CFStringRef v16 = BCBookDownloadLog();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  id v17 = [v11 identifier];
                  v18 = [v11 downloadID];
                  *(_DWORD *)buf = 138412546;
                  v40 = v17;
                  __int16 v41 = 2114;
                  v42 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "download completed audiobook child identifier=%@, downloadID=%{public}@", buf, 0x16u);
                }
                id v19 = [*(id *)(a1 + 40) downloadingAssets];
                id v20 = [v11 identifier];
                [v19 removeObjectForKey:v20];

                [v11 removeFromParent];
                long long v21 = [v12 children];
                id v22 = [v21 count];

                if (!v22)
                {
                  long long v23 = BCBookDownloadLog();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v24 = [v12 identifier];
                    *(_DWORD *)buf = v31;
                    v40 = v24;
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "download completed audiobook parent identifier=%{public}@", buf, 0xCu);
                  }
                  v25 = [*(id *)(a1 + 40) downloadingAssets];
                  v26 = [v12 identifier];
                  [v25 removeObjectForKey:v26];
                }
              }
              else
              {
                v27 = BCBookDownloadLog();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  v28 = [v11 identifier];
                  v29 = [v11 downloadID];
                  *(_DWORD *)buf = 138412546;
                  v40 = v28;
                  __int16 v41 = 2114;
                  v42 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "download completed identifier=%@, downloadID=%{public}@", buf, 0x16u);
                }
                id v12 = [*(id *)(a1 + 40) downloadingAssets];
                v30 = [v11 identifier];
                [v12 removeObjectForKey:v30];
              }
              id v2 = v32;
              goto LABEL_28;
            }
            id v12 = BCBookDownloadLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = [v8 downloadID];
              *(_DWORD *)buf = 138412546;
              v40 = v9;
              __int16 v41 = 2114;
              v42 = v13;
              int v14 = v12;
              id v15 = "completed asset was paused: %@, downloadID:%{public}@";
              goto LABEL_15;
            }
          }
          else
          {
            id v12 = BCBookDownloadLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = [v8 downloadID];
              *(_DWORD *)buf = 138412546;
              v40 = v9;
              __int16 v41 = 2114;
              v42 = v13;
              int v14 = v12;
              id v15 = "download completed untracked identifier=%@, downloadID=%{public}@";
LABEL_15:
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
            }
          }
LABEL_28:

          goto LABEL_29;
        }
        long long v11 = BCBookDownloadLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100022B00(&v33, v34, v11);
        }
LABEL_29:
      }
      id v5 = [v2 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v5);
  }
}

uint64_t sub_100007BFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  sub_10000941C(a1, (uint64_t)v18);
  sub_10000941C(a2, (uint64_t)v17);
  sub_10000941C(a4, (uint64_t)v16);
  id v10 = (id)BSUIGetLibraryItemStateProvider();
  sub_100008AAC(a4);
  sub_100008AAC(a2);
  sub_100008AAC(a1);
  self;
  uint64_t v11 = swift_dynamicCastObjCClassUnconditional();
  id v12 = (char *)a5 + *(int *)(type metadata accessor for PPXAddToWantToReadActionItem() + 36);
  uint64_t v13 = enum case for ContextActionType.addToWantToRead(_:);
  uint64_t v14 = sub_100022DF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
  sub_10000936C(v18, (uint64_t)a5);
  sub_10000936C(v17, (uint64_t)(a5 + 5));
  a5[10] = a3;
  uint64_t result = sub_10000936C(v16, (uint64_t)(a5 + 11));
  a5[16] = v11;
  a5[17] = &off_100031BE0;
  return result;
}

uint64_t sub_100007D40()
{
  sub_100009384(v0, v0[3]);
  sub_100022FD0();
  if ((v8 & 1) == 0)
  {
    sub_10000936C(&v6, (uint64_t)v9);
    sub_100009384(v9, v9[3]);
    char v2 = sub_100022F30();
    if (v2 == 2)
    {
      sub_10000941C((uint64_t)v9, (uint64_t)&v6);
    }
    else
    {
      char v3 = v2;
      sub_10000941C((uint64_t)v9, (uint64_t)&v6);
      if (v3)
      {
        uint64_t v1 = 0;
LABEL_10:
        sub_100008AAC((uint64_t)&v6);
        sub_100008AAC((uint64_t)v9);
        return v1;
      }
    }
    sub_100009384(&v6, v7);
    char v4 = sub_100022F90();
    if (v4 == 2) {
      uint64_t v1 = 0;
    }
    else {
      uint64_t v1 = v4 & 1;
    }
    goto LABEL_10;
  }
  sub_1000093C8((uint64_t)&v6);
  return 0;
}

uint64_t sub_100007E54()
{
  *(void *)(v1 + 104) = v0;
  sub_100023590();
  *(void *)(v1 + 112) = sub_100023580();
  uint64_t v3 = sub_100023570();
  return _swift_task_switch(sub_100007EEC, v3, v2);
}

uint64_t sub_100007EEC()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();
  sub_100009384(v1, v1[3]);
  sub_100022FD0();
  if (*(unsigned char *)(v0 + 56))
  {
    sub_1000093C8(v0 + 16);
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 104);
    sub_10000936C((long long *)(v0 + 16), v0 + 64);
    uint64_t v3 = self;
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    NSString v4 = sub_100023480();
    swift_bridgeObjectRelease();
    [v3 addStoreIDToWantToRead:v4 tracker:*(void *)(v2 + 80)];

    uint64_t v5 = *(void **)(v2 + 128);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    NSString v6 = sub_100023480();
    swift_bridgeObjectRelease();
    [v5 updateWantToReadState:1 identifier:v6];

    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    NSString v7 = sub_100023480();
    swift_bridgeObjectRelease();
    [v5 updateItemOfInterestForItemIdentifier:v7];

    sub_100008AAC(v0 + 64);
  }
  char v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_1000080B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = sub_100022DF0();
  NSString v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_100008144()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000081D0;
  return sub_100007E54();
}

uint64_t sub_1000081D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000082C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000941C(v1 + 40, a1);
}

uint64_t sub_1000082E4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000941C(v1, a1);
}

void *sub_100008304()
{
  uint64_t v1 = *(void **)(v0 + 80);
  id v2 = v1;
  return v1;
}

uint64_t sub_10000832C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000941C(v1 + 88, a1);
}

uint64_t variable initialization expression of PPXContextMenuProvider.swipeActionItems()
{
  sub_1000084A8((uint64_t *)&unk_100038D70);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10002AEA0;
  uint64_t v1 = type metadata accessor for PPXMarkedAsFinishedActionItem();
  uint64_t v2 = sub_1000087DC((unint64_t *)&unk_100038480, (void (*)(uint64_t))type metadata accessor for PPXMarkedAsFinishedActionItem);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = type metadata accessor for PPXMarkedAsStillReadingActionItem();
  uint64_t v4 = sub_1000087DC((unint64_t *)&unk_100038D80, (void (*)(uint64_t))type metadata accessor for PPXMarkedAsStillReadingActionItem);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  uint64_t ActionItem = type metadata accessor for PPXAddToWantToReadActionItem();
  uint64_t v6 = sub_1000087DC((unint64_t *)&unk_100038490, (void (*)(uint64_t))type metadata accessor for PPXAddToWantToReadActionItem);
  *(void *)(v0 + 64) = ActionItem;
  *(void *)(v0 + 72) = v6;
  uint64_t v7 = type metadata accessor for PPXRemoveFromWantToReadActionItem();
  uint64_t v8 = sub_1000087DC((unint64_t *)&unk_100038D90, (void (*)(uint64_t))type metadata accessor for PPXRemoveFromWantToReadActionItem);
  *(void *)(v0 + 80) = v7;
  *(void *)(v0 + 88) = v8;
  return v0;
}

uint64_t sub_1000084A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for PPXAddToWantToReadActionItem()
{
  uint64_t result = qword_100038578;
  if (!qword_100038578) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t variable initialization expression of PPXContextMenuProvider.actionItems()
{
  sub_1000084A8((uint64_t *)&unk_100038D70);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10002AEB0;
  uint64_t v1 = type metadata accessor for PPXAddToCollectionActionItem();
  uint64_t v2 = sub_1000087DC((unint64_t *)&unk_1000384A0, (void (*)(uint64_t))type metadata accessor for PPXAddToCollectionActionItem);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t ActionItem = type metadata accessor for PPXAddToWantToReadActionItem();
  uint64_t v4 = sub_1000087DC((unint64_t *)&unk_100038490, (void (*)(uint64_t))type metadata accessor for PPXAddToWantToReadActionItem);
  *(void *)(v0 + 48) = ActionItem;
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = type metadata accessor for PPXDownloadActionItem();
  uint64_t v6 = sub_1000087DC((unint64_t *)&unk_100038DA0, (void (*)(uint64_t))type metadata accessor for PPXDownloadActionItem);
  *(void *)(v0 + 64) = v5;
  *(void *)(v0 + 72) = v6;
  uint64_t v7 = type metadata accessor for PPXDislikeActionItem();
  uint64_t v8 = sub_1000087DC((unint64_t *)&unk_1000384B0, (void (*)(uint64_t))type metadata accessor for PPXDislikeActionItem);
  *(void *)(v0 + 80) = v7;
  *(void *)(v0 + 88) = v8;
  *(void *)(v0 + 96) = sub_100022C70();
  *(void *)(v0 + 104) = &protocol witness table for LikeActionItem;
  uint64_t v9 = type metadata accessor for PPXMarkedAsFinishedActionItem();
  uint64_t v10 = sub_1000087DC((unint64_t *)&unk_100038480, (void (*)(uint64_t))type metadata accessor for PPXMarkedAsFinishedActionItem);
  *(void *)(v0 + 112) = v9;
  *(void *)(v0 + 120) = v10;
  uint64_t v11 = type metadata accessor for PPXMarkedAsStillReadingActionItem();
  uint64_t v12 = sub_1000087DC((unint64_t *)&unk_100038D80, (void (*)(uint64_t))type metadata accessor for PPXMarkedAsStillReadingActionItem);
  *(void *)(v0 + 128) = v11;
  *(void *)(v0 + 136) = v12;
  *(void *)(v0 + 144) = sub_100022F00();
  *(void *)(v0 + 152) = &protocol witness table for RateAndReviewActionItem;
  uint64_t v13 = type metadata accessor for PPXRemoveDownloadActionItem();
  uint64_t v14 = sub_1000087DC(&qword_100038DB0, (void (*)(uint64_t))type metadata accessor for PPXRemoveDownloadActionItem);
  *(void *)(v0 + 160) = v13;
  *(void *)(v0 + 168) = v14;
  uint64_t v15 = type metadata accessor for PPXRemoveFromWantToReadActionItem();
  uint64_t v16 = sub_1000087DC((unint64_t *)&unk_100038D90, (void (*)(uint64_t))type metadata accessor for PPXRemoveFromWantToReadActionItem);
  *(void *)(v0 + 176) = v15;
  *(void *)(v0 + 184) = v16;
  *(void *)(v0 + 192) = sub_100022CC0();
  *(void *)(v0 + 200) = &protocol witness table for ShareActionItem;
  return v0;
}

uint64_t sub_1000087DC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008824(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v19 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    long long v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(v4 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v4 + 40, (uint64_t)(a2 + 5));
    uint64_t v9 = (void *)a2[10];
    *(void *)(v4 + 80) = v9;
    long long v10 = *((_OWORD *)a2 + 7);
    *(_OWORD *)(v4 + 112) = v10;
    uint64_t v11 = v10;
    uint64_t v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
    id v13 = v9;
    v12(v4 + 88, (uint64_t)(a2 + 11), v11);
    *(_OWORD *)(v4 + 128) = *((_OWORD *)a2 + 8);
    uint64_t v14 = *(int *)(a3 + 36);
    uint64_t v15 = v4 + v14;
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_100022DF0();
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
    swift_unknownObjectRetain();
    v18(v15, v16, v17);
  }
  return v4;
}

uint64_t sub_100008A18(uint64_t a1, uint64_t a2)
{
  sub_100008AAC(a1);
  sub_100008AAC(a1 + 40);

  sub_100008AAC(a1 + 88);
  swift_unknownObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_100022DF0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_100008AAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, a2 + 40);
  long long v8 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v8;
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 112) = v9;
  uint64_t v10 = v9;
  uint64_t v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  id v12 = v8;
  v11(a1 + 88, a2 + 88, v10);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v13 = *(int *)(a3 + 36);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_100022DF0();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16);
  swift_unknownObjectRetain();
  v17(v14, v15, v16);
  return a1;
}

uint64_t *sub_100008C98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_100008D68(a1, a2);
  sub_100008D68(a1 + 5, a2 + 5);
  long long v6 = (void *)a1[10];
  long long v7 = (void *)a2[10];
  a1[10] = (uint64_t)v7;
  id v8 = v7;

  sub_100008D68(a1 + 11, a2 + 11);
  uint64_t v9 = a2[17];
  a1[16] = a2[16];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[17] = v9;
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = (char *)a1 + v10;
  id v12 = (char *)a2 + v10;
  uint64_t v13 = sub_100022DF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t *sub_100008D68(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_100008F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  long long v6 = *(_OWORD *)(a2 + 88);
  long long v7 = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v7;
  *(_OWORD *)(a1 + 88) = v6;
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v11 = sub_100022DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_100009054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100008AAC(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_100008AAC(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  long long v7 = *(void **)(a1 + 80);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;

  sub_100008AAC(a1 + 88);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  uint64_t v9 = *(void *)(a2 + 128);
  uint64_t v10 = *(void *)(a2 + 136);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v9;
  swift_unknownObjectRelease();
  *(void *)(a1 + 136) = v10;
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100022DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_10000913C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009150);
}

uint64_t sub_100009150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100022DF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100009200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009214);
}

uint64_t sub_100009214(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100022DF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000092BC()
{
  uint64_t result = sub_100022DF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000936C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_100009384(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000093C8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000941C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

__n128 sub_100009480(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100009490(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000094B0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGPoint()
{
  if (!qword_100038630)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100038630);
    }
  }
}

uint64_t static EventReporter.setupLibraryAnalyticsDataProvider()()
{
  return sub_1000230E0();
}

unint64_t sub_10000957C()
{
  unint64_t result = qword_1000386A0;
  if (!qword_1000386A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000386A0);
  }
  return result;
}

void sub_1000095D0(id a1, SEL a2)
{
}

uint64_t sub_10000961C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009630);
}

uint64_t sub_100009630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100022DF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000096E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000096F4);
}

uint64_t sub_1000096F4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100022DF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PPXMarkedAsFinishedActionItem()
{
  uint64_t result = qword_100038700;
  if (!qword_100038700) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000097E8()
{
  uint64_t result = sub_100022DF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100009898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  sub_10000941C(a1, (uint64_t)v18);
  sub_10000941C(a2, (uint64_t)v17);
  sub_10000941C(a4, (uint64_t)v16);
  id v10 = (id)BSUIGetLibraryItemStateProvider();
  sub_100008AAC(a4);
  sub_100008AAC(a2);
  sub_100008AAC(a1);
  self;
  uint64_t v11 = swift_dynamicCastObjCClassUnconditional();
  uint64_t v12 = (char *)a5 + *(int *)(type metadata accessor for PPXMarkedAsFinishedActionItem() + 36);
  uint64_t v13 = enum case for ContextActionType.markAsFinished(_:);
  uint64_t v14 = sub_100022DF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
  sub_10000936C(v18, (uint64_t)a5);
  sub_10000936C(v17, (uint64_t)(a5 + 5));
  a5[10] = a3;
  uint64_t result = sub_10000936C(v16, (uint64_t)(a5 + 11));
  a5[16] = v11;
  a5[17] = &off_100031BE0;
  return result;
}

BOOL sub_1000099DC()
{
  sub_100009384(v0, v0[3]);
  sub_100022FD0();
  if (v8)
  {
    sub_1000093C8((uint64_t)&v6);
    return 0;
  }
  else
  {
    sub_10000936C(&v6, (uint64_t)v9);
    sub_100009384(v9, v9[3]);
    char v2 = sub_100022F90();
    if (v2 == 2)
    {
      sub_10000941C((uint64_t)v9, (uint64_t)&v6);
      BOOL v1 = 0;
    }
    else
    {
      char v3 = v2;
      sub_10000941C((uint64_t)v9, (uint64_t)&v6);
      if (v3)
      {
        sub_100009384(&v6, v7);
        char v4 = sub_100022F40();
        BOOL v1 = v4 != 2 && (v4 & 1) == 0;
      }
      else
      {
        BOOL v1 = 0;
      }
    }
    sub_100008AAC((uint64_t)&v6);
    sub_100008AAC((uint64_t)v9);
  }
  return v1;
}

uint64_t sub_100009AF8()
{
  v1[13] = v0;
  uint64_t v2 = sub_100023120();
  v1[14] = v2;
  v1[15] = *(void *)(v2 - 8);
  v1[16] = swift_task_alloc();
  sub_1000084A8(&qword_100038758);
  v1[17] = swift_task_alloc();
  uint64_t v3 = sub_1000230A0();
  v1[18] = v3;
  v1[19] = *(void *)(v3 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v4 = sub_100023130();
  v1[21] = v4;
  v1[22] = *(void *)(v4 - 8);
  v1[23] = swift_task_alloc();
  sub_100023590();
  v1[24] = sub_100023580();
  uint64_t v6 = sub_100023570();
  return _swift_task_switch(sub_100009CD4, v6, v5);
}

uint64_t sub_100009CD4()
{
  BOOL v1 = *(void **)(v0 + 104);
  swift_release();
  sub_100009384(v1, v1[3]);
  sub_100022FD0();
  if (*(unsigned char *)(v0 + 56))
  {
    sub_1000093C8(v0 + 16);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 176);
    uint64_t v2 = *(void *)(v0 + 184);
    uint64_t v5 = *(void *)(v0 + 160);
    uint64_t v4 = *(void *)(v0 + 168);
    uint64_t v24 = v4;
    uint64_t v6 = *(void *)(v0 + 144);
    uint64_t v7 = *(void *)(v0 + 152);
    uint64_t v23 = v7;
    uint64_t v22 = *(void *)(v0 + 136);
    uint64_t v8 = *(void *)(v0 + 120);
    uint64_t v25 = *(void *)(v0 + 128);
    uint64_t v26 = *(void *)(v0 + 104);
    uint64_t v27 = *(void *)(v0 + 112);
    sub_10000936C((long long *)(v0 + 16), v0 + 64);
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for ContentAcquisitionType.storeBought(_:), v4);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022FB0();
    char v9 = sub_100022E30();
    id v10 = (unsigned int *)&enum case for ContentType.audiobook(_:);
    if ((v9 & 1) == 0) {
      id v10 = (unsigned int *)&enum case for ContentType.book(_:);
    }
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v5, *v10, v6);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F60();
    sub_100023660();
    sub_100023110();
    uint64_t v11 = (void *)sub_100023100();
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    sub_1000230F0();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v25, enum case for ProductionType.unknown(_:), v27);
    long long v21 = (void *)sub_100023100();
    uint64_t v12 = *(void *)(v26 + 80);
    sub_100023490();
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    uint64_t v20 = v22;
    sub_1000230C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v13 = (void *)sub_100023100();
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    LOBYTE(v20) = 2;
    sub_1000230B0();
    swift_bridgeObjectRelease();

    uint64_t v14 = self;
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    NSString v15 = sub_100023480();
    swift_bridgeObjectRelease();
    [v14 setFinishedState:1 storeID:v15 tracker:v20];

    uint64_t v16 = *(void **)(v26 + 128);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    NSString v17 = sub_100023480();
    swift_bridgeObjectRelease();
    [v16 updateItemOfInterestForItemIdentifier:v17];

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v25, v27);
    sub_10000A224(v22);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v24);
    sub_100008AAC(v0 + 64);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_10000A194()
{
  BOOL v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000081D0;
  return sub_100009AF8();
}

uint64_t sub_10000A224(uint64_t a1)
{
  uint64_t v2 = sub_1000084A8(&qword_100038758);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_10000A318(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager] = 0;
  uint64_t v6 = &v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  uint64_t v7 = &v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification];
  *(_OWORD *)uint64_t v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_initialProductPageItem] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider] = 0;
  uint64_t v8 = v3;
  *(void *)&v8[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_objectGraph] = sub_10000E940();

  if (a2)
  {
    NSString v9 = sub_100023480();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v22.receiver = v8;
  v22.super_class = (Class)type metadata accessor for ProductPageRootViewController();
  [super initWithNibName:v9 bundle:a3];

  type metadata accessor for FallbackSceneSessionProvider();
  id v11 = v10;
  swift_retain();
  sub_1000233E0();
  swift_release();
  swift_unknownObjectWeakAssign();
  swift_release();
  uint64_t v12 = self;
  id v13 = [v12 defaultCenter];
  [v13 addObserver:v11 selector:"_smartInvertDidChange:" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];

  uint64_t v14 = (char *)v11;
  if (UIAccessibilityIsInvertColorsEnabled()) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 0;
  }
  [v14 setOverrideUserInterfaceStyle:v15];

  id v16 = [objc_allocWithZone((Class)TUISyncLayoutController) initWithDelegate:v14];
  NSString v17 = *(void **)&v14[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController];
  *(void *)&v14[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController] = v16;

  id v18 = [v12 defaultCenter];
  uint64_t v19 = JSABridgeDidReloadNotification;
  uint64_t v20 = v14;
  [v18 addObserver:v20 selector:"_bridgeDidReload:" name:v19 object:0];

  return v20;
}

id sub_10000A648()
{
  BOOL v1 = v0;
  uint64_t v2 = sub_100023250();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for ProductPageRootViewController();
  v32.receiver = v1;
  v32.super_class = v6;
  [super viewDidLoad];
  id v7 = [self bu_groupUserDefaults];
  NSString v8 = sub_100023480();
  id v9 = [v7 stringForKey:v8];

  if (v9)
  {
    uint64_t v10 = sub_100023490();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  id result = (id)BCProductPageExtensionLog();
  if (result)
  {
    sub_100023260();
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_100023230();
    os_log_type_t v15 = sub_1000235C0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v27 = v2;
      id v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v28 = v1;
      uint64_t v29 = v10;
      uint64_t v30 = v12;
      uint64_t v31 = v17;
      *(_DWORD *)id v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_1000084A8(&qword_100038D40);
      uint64_t v18 = sub_1000234C0();
      uint64_t v29 = sub_100014B40(v18, v19, &v31);
      sub_100023670();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "viewDidLoad - bootUrl: %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v27);
      BOOL v1 = v28;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    [(id)sub_100023110() setupLibraryAnalyticsDataProvider];
    id v20 = objc_allocWithZone((Class)sub_100023330());
    uint64_t v21 = sub_100023300();
    uint64_t v22 = OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager;
    uint64_t v23 = *(void **)&v1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager];
    *(void *)&v1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager] = v21;

    uint64_t v24 = *(void **)&v1[v22];
    if (v24)
    {
      id v25 = v24;
      sub_1000232F0();
    }
    return (id)sub_10000F004();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000AA90(void *a1, uint64_t a2, uint64_t a3, const char **a4, SEL *a5)
{
  v10.receiver = a1;
  v10.super_class = (Class)type metadata accessor for ProductPageRootViewController();
  NSString v8 = *a4;
  id v9 = v10.receiver;
  [super v8:a3];
  [v9 *a5:v10.receiver, v10.super_class];
}

void sub_10000AB00(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100023250();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v8 = (objc_class *)type metadata accessor for ProductPageRootViewController();
  v18.receiver = v2;
  v18.super_class = v8;
  [super viewDidDisappear:a1 & 1];
  if ((id)BCProductPageExtensionLog())
  {
    sub_100023260();
    id v9 = sub_100023230();
    os_log_type_t v10 = sub_1000235C0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "viewDidDisappear", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    [v2 bc_analyticsVisibilitySubtreeDidDisappear];
    id v12 = [self processInfo];
    NSString v13 = sub_100023480();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v2;
    aBlock[4] = sub_100010620;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000AF5C;
    aBlock[3] = &unk_100031B80;
    os_log_type_t v15 = _Block_copy(aBlock);
    id v16 = v2;
    swift_release();
    [v12 performExpiringActivityWithReason:v13 usingBlock:v15];
    _Block_release(v15);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000AD80(char a1, uint64_t a2)
{
  uint64_t v4 = sub_100023250();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if ((id)BCProductPageExtensionLog())
    {
      sub_100023260();
      NSString v8 = sub_100023230();
      os_log_type_t v9 = sub_1000235D0();
      if (os_log_type_enabled(v8, v9))
      {
        os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Process is about to be suspended. Upload metrics might have failed.", v10, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v11 = OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager;
    id v12 = *(void **)(a2 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager);
    if (v12)
    {
      id v13 = v12;
      sub_1000232D0();
    }
    [self willTerminate];
    uint64_t v14 = *(void **)(a2 + v11);
    if (v14)
    {
      id v17 = v14;
      sub_100023310();
      os_log_type_t v15 = v17;
    }
  }
}

uint64_t sub_10000AF5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_10000B06C()
{
  BOOL v1 = v0;
  uint64_t v2 = sub_100023250();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = (id)BCProductPageExtensionLog();
  if (result)
  {
    sub_100023260();
    id v7 = sub_100023230();
    os_log_type_t v8 = sub_1000235C0();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "dealloc", v9, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v10 = (uint64_t)v1
        + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification;
    swift_beginAccess();
    sub_1000104F8(v10, (uint64_t)&v17);
    if (v18)
    {
      sub_10000E538(&v17, &v19);
      id v11 = [self defaultCenter];
      sub_100009384(&v19, v20);
      [v11 removeObserver:sub_1000237D0()];

      swift_unknownObjectRelease();
      sub_100008AAC((uint64_t)&v19);
    }
    else
    {
      sub_100010560((uint64_t)&v17, &qword_100038D00);
    }
    uint64_t v12 = (uint64_t)v1
        + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification;
    swift_beginAccess();
    sub_1000104F8(v12, (uint64_t)&v17);
    if (v18)
    {
      sub_10000E538(&v17, &v19);
      id v13 = [self defaultCenter];
      sub_100009384(&v19, v20);
      [v13 removeObserver:sub_1000237D0()];

      swift_unknownObjectRelease();
      sub_100008AAC((uint64_t)&v19);
    }
    else
    {
      sub_100010560((uint64_t)&v17, &qword_100038D00);
    }
    id v14 = [self defaultCenter];
    [v14 removeObserver:v1 name:JSABridgeDidReloadNotification object:0];

    os_log_type_t v15 = (objc_class *)type metadata accessor for ProductPageRootViewController();
    v16.receiver = v1;
    v16.super_class = v15;
    return [super dealloc];
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000B4AC(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100023250();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  os_log_type_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);

  id v10 = [self sharedProvider];
  if (!v10)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v11 = v10;
  id v12 = [v3 view];
  if (!v12)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v13 = v12;
  id v14 = [v12 window];

  [v11 setWindow:v14];
  os_log_type_t v15 = *(void **)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_initialProductPageItem];
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_initialProductPageItem] = a1;
  id v16 = a1;

  if (!(id)BCProductPageExtensionLog())
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  sub_100023260();
  long long v17 = sub_100023230();
  os_log_type_t v18 = sub_1000235C0();
  if (os_log_type_enabled(v17, v18))
  {
    long long v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Starting the javaScript", v19, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v20 = [v3 view];
  if (!v20) {
    goto LABEL_12;
  }
  uint64_t v21 = v20;
  id v22 = [v20 window];

  if (v22)
  {
    sub_10000F3B4(v16, a2);

    return;
  }
LABEL_13:
  __break(1u);
}

void sub_10000B7E0(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a3)
  {
    sub_1000084A8(&qword_100038C28);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10002B110;
    *(void *)(inited + 32) = 0x7975426F546B7361;
    *(void *)(inited + 40) = 0xE800000000000000;
    *(unsigned char *)(inited + 48) = a4 & 1;
    *(void *)(inited + 72) = &type metadata for Bool;
    strcpy((char *)(inited + 80), "promptString");
    *(void *)(inited + 120) = &type metadata for String;
    *(unsigned char *)(inited + 93) = 0;
    *(_WORD *)(inited + 94) = -5120;
    *(void *)(inited + 96) = a2;
    *(void *)(inited + 104) = a3;
    swift_bridgeObjectRetain();
    uint64_t v10 = inited;
  }
  else
  {
    sub_1000084A8(&qword_100038C28);
    uint64_t v10 = swift_initStackObject();
    *(_OWORD *)(v10 + 16) = xmmword_10002B120;
    *(void *)(v10 + 32) = 0x7975426F546B7361;
    *(void *)(v10 + 40) = 0xE800000000000000;
    *(void *)(v10 + 72) = &type metadata for Bool;
    *(unsigned char *)(v10 + 48) = a4 & 1;
  }
  *(void *)(v4 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData) = sub_100018FE0(v10);
  swift_bridgeObjectRelease();
  sub_100010418(0, &qword_100038C00);
  id v11 = [(id)swift_getObjCClassFromMetadata() appearance];
  id v12 = [self bc_booksKeyColor];
  [v11 setTintColor:v12];

  id v13 = *(void **)(v4 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem);
  *(void *)(v4 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem) = a1;
  id v14 = a1;

  if (a4) {
    sub_10000B9AC();
  }
}

uint64_t sub_10000B9AC()
{
  BOOL v1 = self;
  id v2 = [v1 defaultCenter];
  uint64_t v3 = (void *)kJSAParentalApprovalApprovedRequestNotificationName;
  uint64_t v4 = self;
  id v5 = v3;
  id v6 = [v4 mainQueue];
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v23 = sub_100010370;
  uint64_t v24 = v7;
  aBlock = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_10000DCCC;
  ObjectType = &unk_1000319F0;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_release();
  os_log_type_t v9 = (void **)[v2 addObserverForName:v5 object:0 queue:v6 usingBlock:v8];
  _Block_release(v8);

  ObjectType = (void *)swift_getObjectType();
  aBlock = v9;
  uint64_t v10 = v0 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification;
  swift_beginAccess();
  sub_100010390((uint64_t)&aBlock, v10);
  swift_endAccess();
  id v11 = [v1 defaultCenter];
  id v12 = kJSAParentalApprovalDeclinedRequestNotificationName;
  id v13 = [v4 mainQueue];
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v23 = sub_1000103F8;
  uint64_t v24 = v14;
  aBlock = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_10000DCCC;
  ObjectType = &unk_100031A18;
  os_log_type_t v15 = _Block_copy(&aBlock);
  swift_release();
  id v16 = (void **)[v11 addObserverForName:v12 object:0 queue:v13 usingBlock:v15];
  _Block_release(v15);

  ObjectType = (void *)swift_getObjectType();
  aBlock = v16;
  uint64_t v17 = v0 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification;
  swift_beginAccess();
  sub_100010390((uint64_t)&aBlock, v17);
  return swift_endAccess();
}

uint64_t type metadata accessor for ProductPageRootViewController()
{
  return self;
}

uint64_t sub_10000BD84(uint64_t a1)
{
  id v2 = &_swiftEmptyDictionarySingleton;
  __int16 v41 = &_swiftEmptyDictionarySingleton;
  uint64_t v31 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  v42 = &v35;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v7 << 6);
      goto LABEL_25;
    }
    int64_t v11 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v11 >= v30) {
      goto LABEL_40;
    }
    unint64_t v12 = *(void *)(v31 + 8 * v11);
    int64_t v13 = v7 + 1;
    if (!v12)
    {
      int64_t v13 = v7 + 2;
      if (v7 + 2 >= v30) {
        goto LABEL_40;
      }
      unint64_t v12 = *(void *)(v31 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v7 + 3;
        if (v7 + 3 >= v30) {
          goto LABEL_40;
        }
        unint64_t v12 = *(void *)(v31 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v7 + 4;
          if (v7 + 4 >= v30) {
            goto LABEL_40;
          }
          unint64_t v12 = *(void *)(v31 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v7 = v13;
LABEL_25:
    os_log_type_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_1000104F8(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    long long v37 = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    sub_1000104F8((uint64_t)v38, (uint64_t)&v32);
    if (v33)
    {
      sub_10000E538(&v32, v36);
      long long v18 = v37;
      v34[2] = v37;
      sub_1000105BC((uint64_t)v38, (uint64_t)v42, &qword_100038D00);
      sub_10000E538(v36, v34);
      unint64_t v19 = v2[2];
      if (v2[3] <= v19)
      {
        uint64_t v20 = v19 + 1;
        swift_bridgeObjectRetain();
        sub_10001EA18(v20, 1);
        id v2 = v41;
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      sub_100023820();
      sub_1000234D0();
      uint64_t result = sub_100023830();
      uint64_t v21 = (char *)(v2 + 8);
      uint64_t v22 = -1 << *((unsigned char *)v2 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~v2[(v23 >> 6) + 8]) != 0)
      {
        unint64_t v25 = __clz(__rbit64((-1 << v23) & ~v2[(v23 >> 6) + 8])) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v28 = v24 == v27;
          if (v24 == v27) {
            unint64_t v24 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)&v21[8 * v24];
        }
        while (v29 == -1);
        unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
      }
      *(void *)&v21[(v25 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v25;
      *(_OWORD *)(v2[6] + 16 * v25) = v18;
      sub_10000E538(v34, (_OWORD *)(v2[7] + 32 * v25));
      ++v2[2];
      uint64_t v8 = (long long *)v42;
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_100010560((uint64_t)&v37, &qword_100038D38);
      uint64_t v8 = &v32;
    }
    uint64_t result = sub_100010560((uint64_t)v8, &qword_100038D00);
  }
  int64_t v14 = v7 + 5;
  if (v7 + 5 >= v30)
  {
LABEL_40:
    sub_10000E548();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v31 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v7 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v30) {
      goto LABEL_40;
    }
    unint64_t v12 = *(void *)(v31 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

id sub_10000C144(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_100023340();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100023370();
  uint64_t v10 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  unint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [a2 currentPackage];
  if (result)
  {
    int64_t v14 = result;
    [a1 registerTemplateBundlesFromPackage:result];

    sub_100010418(0, &qword_100038BD0);
    os_log_type_t v15 = (void *)sub_100023600();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a3;
    aBlock[4] = sub_1000104A8;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000CFAC;
    aBlock[3] = &unk_100031AB8;
    uint64_t v17 = _Block_copy(aBlock);
    id v18 = a3;
    swift_release();
    sub_100023350();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10001068C(&qword_100038BD8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000084A8(&qword_100038BE0);
    sub_100010320(&qword_100038BE8, &qword_100038BE0);
    sub_100023690();
    sub_100023610();
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v20);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000C454(char *a1)
{
  Class isa = *(Class *)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions];
  if (isa)
  {
    uint64_t v3 = swift_bridgeObjectRetain();
    sub_10000CAFC(v3);
    swift_bridgeObjectRelease();
    Class isa = sub_100023440().super.isa;
    swift_bridgeObjectRelease();
  }
  id v4 = [objc_allocWithZone((Class)PPXFeedViewController) initWithOptions:isa];

  if (!v4)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v5 = [a1 navigationItem];
  id v6 = [v5 leftBarButtonItem];

  if (v6)
  {
    sub_1000084A8(&qword_100038BF0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_10002B130;
    *(void *)(v7 + 32) = v6;
    v63[0] = v7;
    sub_100023540();
    sub_100010418(0, &qword_100038C00);
    id v8 = v4;
    id v9 = v6;
    Class v10 = sub_100023520().super.isa;
    swift_bridgeObjectRelease();
    [v8 setExtraLeftItems:v10, v63[0]];
  }
  id v11 = [a1 navigationItem];
  id v12 = [v11 rightBarButtonItem];

  if (v12)
  {
    sub_1000084A8(&qword_100038BF0);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_10002B130;
    *(void *)(v13 + 32) = v12;
    v63[0] = v13;
    sub_100023540();
    sub_100010418(0, &qword_100038C00);
    id v14 = v4;
    id v15 = v12;
    Class v16 = sub_100023520().super.isa;
    swift_bridgeObjectRelease();
    [v14 setExtraRightItems:v16, v63[0]];
  }
  id v17 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v4];
  id v18 = [self sharedContext];
  if (!v18) {
    goto LABEL_24;
  }
  uint64_t v19 = v18;
  [v18 setNavigationController:v17];

  uint64_t v20 = *(void **)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController];
  *(void *)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController] = v17;
  id v21 = v17;

  [a1 addChildViewController:v21];
  id v22 = [v4 view];
  if (!v22)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v23 = v22;
  id v24 = [a1 view];
  if (!v24)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v25 = v24;
  [v24 bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  [v23 setFrame:v27, v29, v31, v33];
  id v34 = [v4 view];
  if (!v34)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v35 = v34;
  [v34 setAutoresizingMask:18];

  id v36 = [v21 view];
  if (!v36)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  long long v37 = v36;
  id v38 = [a1 view];
  if (!v38)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  long long v39 = v38;
  [v38 bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;

  [v37 setFrame:v41, v43, v45, v47];
  id v48 = [a1 view];
  if (!v48)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v49 = v48;
  id v50 = [v21 view];
  if (!v50)
  {
LABEL_31:
    __break(1u);
    return;
  }
  v51 = v50;
  [v49 addSubview:v50];

  [v21 didMoveToParentViewController:a1];
  id v52 = [objc_allocWithZone((Class)PPXWelcomeGDPRItem) init];
  if ([v52 welcomeScreenShouldShow])
  {
    uint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = 0;
    v54 = (void **)(v53 + 16);
    uint64_t v55 = swift_allocObject();
    *(void *)(v55 + 16) = v53;
    *(void *)(v55 + 24) = v52;
    v63[4] = sub_1000104F0;
    v63[5] = v55;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 1107296256;
    v63[2] = sub_10000CF30;
    v63[3] = &unk_100031B30;
    v56 = _Block_copy(v63);
    swift_retain();
    id v57 = v52;
    swift_release();
    id v58 = [v57 welcomeScreenViewControllerWithCompletion:v56];
    _Block_release(v56);
    if (v58)
    {
      swift_beginAccess();
      v59 = *v54;
      *v54 = v58;
      id v60 = v58;

      [v60 setModalPresentationStyle:2];
      [v60 setModalTransitionStyle:2];
      id v61 = [v60 presentationController];
      if (v61)
      {
        v62 = v61;
        [v61 setDelegate:a1];
      }
      [v21 presentViewController:v60 animated:1 completion:0];
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  [a1 loadDidFinish];
}

uint64_t sub_10000CAFC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000084A8(&qword_100038C08);
    id v2 = (void *)sub_1000237A0();
  }
  else
  {
    id v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  id v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    id v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_10000E4DC(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000E538(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_10000E538(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_10000E538(v36, v37);
    sub_10000E538(v37, &v33);
    uint64_t result = sub_1000236B0(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_10000E538(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_10000E548();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_10000CEC4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_beginAccess();
  id v6 = *(void **)(a3 + 16);
  if (v6) {
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  return [a4 welcomeScreenViewControllerDidDismiss];
}

uint64_t sub_10000CF30(uint64_t a1, uint64_t a2)
{
  id v2 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v3 = sub_100023490();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  swift_retain();
  v2(v3, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000CFAC(uint64_t a1)
{
  BOOL v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000D0AC()
{
  BOOL v1 = v0;
  uint64_t v2 = sub_100023340();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100023370();
  uint64_t v6 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  int64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self sharedInstance];
  [v9 resetForJavascript];

  sub_100010418(0, &qword_100038BD0);
  uint64_t v10 = (void *)sub_100023600();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  aBlock[4] = sub_10000E4D4;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CFAC;
  aBlock[3] = &unk_1000319C8;
  unint64_t v12 = _Block_copy(aBlock);
  id v13 = v1;
  swift_release();
  sub_100023350();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10001068C(&qword_100038BD8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000084A8(&qword_100038BE0);
  sub_100010320(&qword_100038BE8, &qword_100038BE0);
  sub_100023690();
  sub_100023610();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v16);
}

void sub_10000D3AC(char *a1)
{
  Class isa = *(Class *)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions];
  if (isa)
  {
    uint64_t v3 = swift_bridgeObjectRetain();
    sub_10000CAFC(v3);
    swift_bridgeObjectRelease();
    Class isa = sub_100023440().super.isa;
    swift_bridgeObjectRelease();
  }
  id v22 = [objc_allocWithZone((Class)PPXFeedViewController) initWithOptions:isa];

  if (v22)
  {
    id v4 = [a1 navigationItem];
    id v5 = [v4 leftBarButtonItem];

    if (v5)
    {
      sub_1000084A8(&qword_100038BF0);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_10002B130;
      *(void *)(v6 + 32) = v5;
      uint64_t v24 = v6;
      sub_100023540();
      sub_100010418(0, &qword_100038C00);
      id v7 = v22;
      id v8 = v5;
      Class v9 = sub_100023520().super.isa;
      swift_bridgeObjectRelease();
      [v7 setExtraLeftItems:v9];
    }
    id v10 = [a1 navigationItem:v22, v24];
    id v11 = [v10 rightBarButtonItem];

    if (v11)
    {
      sub_1000084A8(&qword_100038BF0);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_10002B130;
      *(void *)(v12 + 32) = v11;
      sub_100023540();
      sub_100010418(0, &qword_100038C00);
      id v13 = v23;
      id v14 = v11;
      Class v15 = sub_100023520().super.isa;
      swift_bridgeObjectRelease();
      [v13 setExtraRightItems:v15];
    }
    uint64_t v16 = *(void **)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController];
    id v17 = v23;
    if (v16)
    {
      sub_1000084A8(&qword_100038BF0);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_10002B130;
      *(void *)(v18 + 32) = v23;
      sub_100023540();
      sub_100010418(0, &qword_100038BF8);
      id v19 = v23;
      id v20 = v16;
      Class v21 = sub_100023520().super.isa;
      swift_bridgeObjectRelease();
      [v20 setViewControllers:v21];

      id v17 = v23;
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_10000D818()
{
  uint64_t v1 = sub_100023340();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100023370();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([self isMainThread])
  {
    if (UIAccessibilityIsInvertColorsEnabled()) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 0;
    }
    return [v0 setOverrideUserInterfaceStyle:v9];
  }
  else
  {
    sub_100010418(0, &qword_100038BD0);
    uint64_t v15 = sub_100023600();
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_10000E434;
    aBlock[5] = v11;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000CFAC;
    aBlock[3] = &unk_100031978;
    uint64_t v12 = _Block_copy(aBlock);
    swift_release();
    sub_100023350();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10001068C(&qword_100038BD8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000084A8(&qword_100038BE0);
    sub_100010320(&qword_100038BE8, &qword_100038BE0);
    sub_100023690();
    id v13 = (void *)v15;
    sub_100023610();
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void sub_10000DB50()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    if (UIAccessibilityIsInvertColorsEnabled()) {
      uint64_t v2 = 2;
    }
    else {
      uint64_t v2 = 0;
    }
    [v1 setOverrideUserInterfaceStyle:v2];
  }
}

uint64_t sub_10000DBE0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = sub_100022B50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100022B40();
  id v10 = a1;
  a4();

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_10000DCCC(uint64_t a1)
{
  uint64_t v2 = sub_100022B50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_100022B40();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_10000DDC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;
    [Strong finishWithResult:a3 completion:0];
  }
}

id sub_10000DE28@<X0>(void *a1@<X8>)
{
  id result = [objc_allocWithZone((Class)BSUIDownloadProgressCenter) init];
  *a1 = result;
  return result;
}

id sub_10000DE64@<X0>(void *a1@<X8>)
{
  id result = (id)BSUIGetLibraryItemStateProvider();
  *a1 = result;
  return result;
}

uint64_t sub_10000DE94@<X0>(void *a1@<X8>)
{
  sub_100023430();
  sub_100023420();
  type metadata accessor for PPXContextMenuProvider();
  sub_1000233E0();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000DEF4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E0D4((uint64_t (*)(void))type metadata accessor for FallbackSceneSessionProvider, &qword_100038DB8, (void (*)(uint64_t))type metadata accessor for FallbackSceneSessionProvider, a1);
}

uint64_t sub_10000DF3C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_100022C60();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v13 - v7;
  sub_100023430();
  uint64_t v9 = sub_100023420();
  sub_100022C50();
  id v10 = (char *)objc_allocWithZone((Class)type metadata accessor for PPXContextMenuProvider());
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  id v11 = sub_10000E550((uint64_t)v6, v9, v10);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  *a1 = v11;
  return result;
}

uint64_t sub_10000E08C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E0D4((uint64_t (*)(void))type metadata accessor for PPXContextMenuProvider, &qword_100038D68, (void (*)(uint64_t))type metadata accessor for PPXContextMenuProvider, a1);
}

uint64_t sub_10000E0D4@<X0>(uint64_t (*a1)(void)@<X0>, unint64_t *a2@<X1>, void (*a3)(uint64_t)@<X2>, uint64_t a4@<X8>)
{
  sub_100023430();
  sub_100023420();
  *(void *)(a4 + 24) = a1(0);
  *(void *)(a4 + 32) = sub_10001068C(a2, a3);
  sub_1000233E0();

  return swift_release();
}

uint64_t sub_10000E280()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FigaroPageContextProvider()
{
  return self;
}

void sub_10000E2B4()
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v1 = Strong;
  if (Strong)
  {
    id v2 = [Strong view];

    if (v2)
    {
      id v3 = [v2 window];

      if (v3)
      {
        id v4 = [v3 windowScene];

        if (v4)
        {
          [v4 session];
        }
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10000E37C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for FallbackSceneSessionProvider()
{
  return self;
}

void sub_10000E3D8()
{
}

uint64_t sub_10000E3FC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000E434()
{
}

uint64_t sub_10000E43C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000E44C()
{
  return swift_release();
}

uint64_t sub_10000E454(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000E49C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000E4D4()
{
  sub_10000D3AC(*(char **)(v0 + 16));
}

uint64_t sub_10000E4DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000E538(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000E548()
{
  return swift_release();
}

id sub_10000E550(uint64_t a1, uint64_t a2, char *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_100022C60();
  v32[3] = v5;
  v32[4] = (uint64_t)&protocol witness table for FigaroProvider;
  uint64_t v6 = sub_100010628(v32);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v6, a1, v5);
  uint64_t v26 = OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_swipeActionItems;
  sub_1000084A8((uint64_t *)&unk_100038D70);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10002AEA0;
  uint64_t v28 = type metadata accessor for PPXMarkedAsFinishedActionItem();
  uint64_t v8 = sub_10001068C((unint64_t *)&unk_100038480, (void (*)(uint64_t))type metadata accessor for PPXMarkedAsFinishedActionItem);
  *(void *)(v7 + 32) = v28;
  *(void *)(v7 + 40) = v8;
  uint64_t v9 = type metadata accessor for PPXMarkedAsStillReadingActionItem();
  uint64_t v10 = sub_10001068C((unint64_t *)&unk_100038D80, (void (*)(uint64_t))type metadata accessor for PPXMarkedAsStillReadingActionItem);
  *(void *)(v7 + 48) = v9;
  *(void *)(v7 + 56) = v10;
  uint64_t ActionItem = type metadata accessor for PPXAddToWantToReadActionItem();
  uint64_t v12 = sub_10001068C((unint64_t *)&unk_100038490, (void (*)(uint64_t))type metadata accessor for PPXAddToWantToReadActionItem);
  *(void *)(v7 + 64) = ActionItem;
  *(void *)(v7 + 72) = v12;
  uint64_t v13 = type metadata accessor for PPXRemoveFromWantToReadActionItem();
  uint64_t v14 = sub_10001068C((unint64_t *)&unk_100038D90, (void (*)(uint64_t))type metadata accessor for PPXRemoveFromWantToReadActionItem);
  *(void *)(v7 + 80) = v13;
  *(void *)(v7 + 88) = v14;
  *(void *)&a3[v26] = v7;
  uint64_t v27 = OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_actionItems;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10002AEB0;
  uint64_t v16 = type metadata accessor for PPXAddToCollectionActionItem();
  uint64_t v17 = sub_10001068C((unint64_t *)&unk_1000384A0, (void (*)(uint64_t))type metadata accessor for PPXAddToCollectionActionItem);
  *(void *)(v15 + 32) = v16;
  *(void *)(v15 + 40) = v17;
  *(void *)(v15 + 48) = ActionItem;
  *(void *)(v15 + 56) = v12;
  uint64_t v18 = type metadata accessor for PPXDownloadActionItem();
  uint64_t v19 = sub_10001068C((unint64_t *)&unk_100038DA0, (void (*)(uint64_t))type metadata accessor for PPXDownloadActionItem);
  *(void *)(v15 + 64) = v18;
  *(void *)(v15 + 72) = v19;
  uint64_t v20 = type metadata accessor for PPXDislikeActionItem();
  uint64_t v21 = sub_10001068C((unint64_t *)&unk_1000384B0, (void (*)(uint64_t))type metadata accessor for PPXDislikeActionItem);
  *(void *)(v15 + 80) = v20;
  *(void *)(v15 + 88) = v21;
  *(void *)(v15 + 96) = sub_100022C70();
  *(void *)(v15 + 104) = &protocol witness table for LikeActionItem;
  *(void *)(v15 + 112) = v28;
  *(void *)(v15 + 120) = v8;
  *(void *)(v15 + 128) = v9;
  *(void *)(v15 + 136) = v10;
  *(void *)(v15 + 144) = sub_100022F00();
  *(void *)(v15 + 152) = &protocol witness table for RateAndReviewActionItem;
  uint64_t v22 = type metadata accessor for PPXRemoveDownloadActionItem();
  uint64_t v23 = sub_10001068C(&qword_100038DB0, (void (*)(uint64_t))type metadata accessor for PPXRemoveDownloadActionItem);
  *(void *)(v15 + 160) = v22;
  *(void *)(v15 + 168) = v23;
  *(void *)(v15 + 176) = v13;
  *(void *)(v15 + 184) = v14;
  *(void *)(v15 + 192) = sub_100022CC0();
  *(void *)(v15 + 200) = &protocol witness table for ShareActionItem;
  *(void *)&a3[v27] = v15;
  sub_10000941C((uint64_t)v32, (uint64_t)&a3[OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider]);
  *(void *)&a3[OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_objectGraph] = a2;
  v31.receiver = a3;
  v31.super_class = ObjectType;
  [super init];
  sub_100008AAC((uint64_t)v32);
  return v24;
}

uint64_t sub_10000E940()
{
  uint64_t v33 = sub_1000233D0();
  uint64_t v31 = *(void *)(v33 - 8);
  uint64_t v0 = __chkstk_darwin(v33);
  double v32 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v27 = (char *)&v25 - v3;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v35 = (char *)&v25 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  id v11 = (char *)&v25 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v25 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  id v36 = (char *)&v25 - v16;
  __chkstk_darwin(v15);
  long long v37 = (char *)&v25 - v17;
  sub_100023430();
  uint64_t v34 = sub_1000233F0();
  swift_retain();
  uint64_t v30 = sub_100023010();
  sub_100010418(0, &qword_100038D18);
  sub_1000233B0();
  sub_1000084A8(&qword_100038D10);
  sub_1000233B0();
  sub_1000084A8(&qword_100038D48);
  long long v29 = v14;
  sub_1000233B0();
  type metadata accessor for FallbackSceneSessionProvider();
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v38 = v18;
  uint64_t v28 = v11;
  sub_1000233C0();
  sub_1000084A8(&qword_100038D50);
  uint64_t v26 = v8;
  sub_1000233B0();
  sub_1000084A8(&qword_100038D58);
  type metadata accessor for FigaroPageContextProvider();
  uint64_t v38 = swift_allocObject();
  sub_1000233C0();
  type metadata accessor for PPXContextMenuProvider();
  sub_1000233B0();
  sub_1000084A8(&qword_100038D60);
  uint64_t v19 = v32;
  sub_1000233B0();
  swift_retain();
  sub_100023410();
  swift_release();
  swift_retain();
  sub_100023400();
  swift_release();
  swift_retain();
  sub_100023400();
  swift_release();
  swift_retain();
  sub_100023400();
  swift_release();
  swift_retain();
  sub_100023400();
  swift_release();
  swift_retain();
  sub_100023400();
  swift_release();
  swift_retain();
  sub_100023400();
  swift_release();
  swift_retain();
  uint64_t v20 = v27;
  sub_100023400();
  swift_release();
  swift_retain();
  uint64_t v25 = sub_100023400();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release_n();
  swift_release_n();
  swift_release();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v22 = v19;
  uint64_t v23 = v33;
  v21(v22, v33);
  v21(v20, v23);
  v21(v35, v23);
  v21(v26, v23);
  v21(v28, v23);
  v21(v29, v23);
  v21(v36, v23);
  v21(v37, v23);
  return v25;
}

void sub_10000EF14()
{
  *(void *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  uint64_t v2 = &v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification];
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *(void *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_initialProductPageItem] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider] = 0;

  sub_100023750();
  __break(1u);
}

uint64_t sub_10000F004()
{
  uint64_t v0 = sub_1000084A8(&qword_100038D08);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100022B90();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v27 - v8;
  id v28 = self;
  id v10 = [v28 sharedInstance];
  id v11 = self;
  id v12 = [v11 sharedInstance];
  [v10 setJsBridge:v12];

  sub_1000232C0();
  uint64_t v13 = (void *)sub_1000232B0();
  id v14 = [v11 sharedInstance];
  sub_1000232A0();

  sub_100010418(0, &qword_100038CC8);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v16 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v17 = sub_100023480();
  NSString v18 = sub_100023480();
  id v19 = [v16 URLForResource:v17 withExtension:v18];

  if (v19)
  {
    sub_100022B80();

    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v20(v2, v7, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
    if (result != 1)
    {
      v20(v9, v2, v3);
      id v22 = [v28 sharedInstance];
      id v23 = BRCBooksDefaultsNamespace;
      sub_100022B70(v24);
      uint64_t v26 = v25;
      [v22 registerNamespace:v23 withDefaults:v25 forBundleID:BRCBundleID];

      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  __break(1u);
  return result;
}

void sub_10000F3B4(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v55 = a1;
  uint64_t v56 = a2;
  uint64_t v4 = sub_1000084A8(&qword_100038D08);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v52 - v8;
  id v10 = [self sharedInstance];
  if (!v10)
  {
    __break(1u);
    goto LABEL_26;
  }
  id v11 = v10;
  [v10 setDelegate:v3];

  uint64_t v12 = *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_objectGraph];
  sub_1000084A8(&qword_100038D10);
  sub_1000233E0();
  uint64_t v13 = (void *)v58;
  sub_100010418(0, &qword_100038D18);
  uint64_t v54 = v12;
  sub_1000233E0();
  id v14 = (void *)v58;
  id v15 = [self manager];
  id v16 = [v15 dynamicRegistry];
  id v17 = [v13 stateCenter];
  NSString v18 = sub_100023480();
  [v16 registerStateProvider:v17 forKind:v18];

  id v19 = [v15 dynamicRegistry];
  id v20 = v14;
  NSString v21 = sub_100023480();
  [v19 registerProgressProvider:v20 forKind:v21];

  id v22 = [self sharedController];
  id v53 = v20;
  if (!v22)
  {
LABEL_26:
    __break(1u);
    return;
  }
  id v23 = v22;
  [v22 startObserving];

  id v24 = [self sharedProvider];
  uint64_t v25 = *(void **)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider];
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider] = v24;

  id v26 = [objc_allocWithZone((Class)PPXJSALibraryManager) init];
  uint64_t v27 = *(void **)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager];
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager] = v26;

  uint64_t v28 = OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData;
  uint64_t v29 = *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData];
  if (!v29 || !*(void *)(v29 + 16))
  {
    long long v58 = 0u;
    long long v59 = 0u;
LABEL_8:
    sub_100010560((uint64_t)&v58, &qword_100038D00);
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  unint64_t v30 = sub_10001E7B0(0x7975426F546B7361, 0xE800000000000000);
  if (v31)
  {
    sub_10000E4DC(*(void *)(v29 + 56) + 32 * v30, (uint64_t)&v58);
  }
  else
  {
    long long v58 = 0u;
    long long v59 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v59 + 1)) {
    goto LABEL_8;
  }
  if swift_dynamicCast() && (v57)
  {
    id v51 = [self metadataDictionary:0 variationWithNavigationBarVisibile:0];
    unint64_t v32 = sub_100023450();

    goto LABEL_10;
  }
LABEL_9:
  unint64_t v32 = sub_100018D50((uint64_t)&_swiftEmptyArrayStorage);
LABEL_10:
  sub_1000084A8(&qword_100038D20);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002B140;
  *(void *)(inited + 32) = 7107189;
  *(void *)(inited + 40) = 0xE300000000000000;
  id v34 = [v55 productPageURL];
  if (v34)
  {
    uint64_t v35 = v34;
    sub_100022B80();

    uint64_t v36 = sub_100022B90();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v7, 0, 1, v36);
  }
  else
  {
    uint64_t v36 = sub_100022B90();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v7, 1, 1, v36);
  }
  sub_1000105BC((uint64_t)v7, (uint64_t)v9, &qword_100038D08);
  sub_100022B90();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v9, 1, v36) == 1)
  {
    sub_100010560((uint64_t)v9, &qword_100038D08);
    *(_OWORD *)(inited + 48) = 0u;
    *(_OWORD *)(inited + 64) = 0u;
  }
  else
  {
    uint64_t v38 = sub_100022B60();
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v38;
    *(void *)(inited + 56) = v39;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v36);
  }
  *(void *)(inited + 80) = 0x6574656D61726170;
  *(void *)(inited + 88) = 0xEA00000000007372;
  uint64_t v40 = sub_1000084A8(&qword_100038D28);
  *(void *)(inited + 96) = v56;
  *(void *)(inited + 120) = v40;
  strcpy((char *)(inited + 128), "extensionInfo");
  *(_WORD *)(inited + 142) = -4864;
  if (*(void *)&v3[v28])
  {
    uint64_t v41 = *(void *)&v3[v28];
  }
  else
  {
    uint64_t v41 = 0;
    uint64_t v40 = 0;
    *(void *)(inited + 152) = 0;
    *(void *)(inited + 160) = 0;
  }
  *(void *)(inited + 144) = v41;
  *(void *)(inited + 168) = v40;
  *(void *)(inited + 176) = 0x617461646174656DLL;
  *(void *)(inited + 184) = 0xE800000000000000;
  *(void *)(inited + 216) = sub_1000084A8(&qword_100038D30);
  *(void *)(inited + 192) = v32;
  *(void *)(inited + 224) = sub_100023490();
  *(void *)(inited + 232) = v42;
  *(void *)(inited + 264) = type metadata accessor for PPXContextMenuProvider();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000233E0();
  unint64_t v43 = sub_100018E94(inited);
  uint64_t v44 = sub_10000BD84(v43);
  swift_bridgeObjectRelease();
  *(void *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions] = v44;
  swift_bridgeObjectRelease();
  id v45 = [self sharedInstance];
  double v46 = (void *)swift_allocObject();
  v46[2] = v15;
  v46[3] = v45;
  v46[4] = v3;
  id v60 = sub_10001049C;
  id v61 = v46;
  *(void *)&long long v58 = _NSConcreteStackBlock;
  *((void *)&v58 + 1) = 1107296256;
  *(void *)&long long v59 = sub_10000CFAC;
  *((void *)&v59 + 1) = &unk_100031A68;
  double v47 = _Block_copy(&v58);
  id v48 = v15;
  id v49 = v45;
  id v50 = v3;
  swift_release();
  [v49 initializeEnvironmentWithDataSource:v50 completion:v47];
  swift_unknownObjectRelease();

  _Block_release(v47);
}

uint64_t sub_10000FB74()
{
  v51[0] = sub_1000235F0();
  uint64_t v0 = *(void *)(v51[0] - 8);
  __chkstk_darwin(v51[0]);
  uint64_t v2 = (char *)v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000235E0();
  __chkstk_darwin(v3);
  uint64_t v4 = sub_100023370();
  __chkstk_darwin(v4 - 8);
  sub_100010418(0, &qword_100038BD0);
  sub_100023360();
  v51[120] = &_swiftEmptyArrayStorage;
  sub_10001068C(&qword_100038C10, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000084A8(&qword_100038C18);
  sub_100010320(&qword_100038C20, &qword_100038C18);
  sub_100023690();
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v51[0]);
  uint64_t v5 = v51[1];
  uint64_t v6 = (void *)sub_100023620();
  id v7 = [objc_allocWithZone((Class)TUITransactionController) initWithQueue:v6];
  sub_1000084A8(&qword_100038C28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002B150;
  uint64_t result = sub_100023490();
  *(void *)(inited + 32) = result;
  *(void *)(inited + 40) = v10;
  id v11 = *(void **)(v5 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = sub_100023320();

    *(void *)(inited + 72) = sub_100023080();
    *(void *)(inited + 48) = v13;
    *(void *)(inited + 80) = sub_100023490();
    *(void *)(inited + 88) = v14;
    *(void *)(inited + 120) = &type metadata for String;
    *(void *)(inited + 96) = 0x6F69736E65747865;
    *(void *)(inited + 104) = 0xE90000000000006ELL;
    uint64_t result = sub_100023490();
    *(void *)(inited + 128) = result;
    *(void *)(inited + 136) = v15;
    id v16 = *(void **)(v5 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager);
    if (v16)
    {
      *(void *)(inited + 168) = sub_100010418(0, &qword_100038C30);
      *(void *)(inited + 144) = v16;
      *(void *)(inited + 176) = sub_100023490();
      *(void *)(inited + 184) = v17;
      uint64_t v18 = sub_1000232C0();
      id v19 = v16;
      uint64_t v20 = sub_1000232B0();
      *(void *)(inited + 216) = v18;
      *(void *)(inited + 192) = v20;
      *(void *)(inited + 224) = sub_100023490();
      *(void *)(inited + 232) = v21;
      *(void *)(inited + 264) = sub_100010418(0, &qword_100038C38);
      *(void *)(inited + 240) = v7;
      *(void *)(inited + 272) = sub_100023490();
      *(void *)(inited + 280) = v22;
      uint64_t v23 = sub_100010418(0, &qword_100038C40);
      *(void *)(inited + 312) = sub_1000084A8(&qword_100038C48);
      *(void *)(inited + 288) = v23;
      *(void *)(inited + 320) = sub_100023490();
      *(void *)(inited + 328) = v24;
      uint64_t v25 = sub_100010418(0, &qword_100038C50);
      *(void *)(inited + 360) = sub_1000084A8(&qword_100038C58);
      *(void *)(inited + 336) = v25;
      *(void *)(inited + 368) = sub_100023490();
      *(void *)(inited + 376) = v26;
      uint64_t v27 = sub_100010418(0, &qword_100038C60);
      *(void *)(inited + 408) = sub_1000084A8(&qword_100038C68);
      *(void *)(inited + 384) = v27;
      *(void *)(inited + 416) = sub_100023490();
      *(void *)(inited + 424) = v28;
      uint64_t v29 = sub_100010418(0, &qword_100038C70);
      *(void *)(inited + 456) = sub_1000084A8(&qword_100038C78);
      *(void *)(inited + 432) = v29;
      *(void *)(inited + 464) = sub_100023490();
      *(void *)(inited + 472) = v30;
      *(void *)(inited + 504) = type metadata accessor for PPXContextMenuProvider();
      id v31 = v7;
      sub_1000233E0();
      *(void *)(inited + 512) = sub_100023490();
      *(void *)(inited + 520) = v32;
      uint64_t v33 = sub_100010418(0, &qword_100038C80);
      *(void *)(inited + 552) = sub_1000084A8(&qword_100038C88);
      *(void *)(inited + 528) = v33;
      *(void *)(inited + 560) = sub_100023490();
      *(void *)(inited + 568) = v34;
      uint64_t v35 = sub_100010418(0, &qword_100038C90);
      *(void *)(inited + 600) = sub_1000084A8(&qword_100038C98);
      *(void *)(inited + 576) = v35;
      *(void *)(inited + 608) = sub_100023490();
      *(void *)(inited + 616) = v36;
      uint64_t v37 = sub_100010418(0, &qword_100038CA0);
      *(void *)(inited + 648) = sub_1000084A8(&qword_100038CA8);
      *(void *)(inited + 624) = v37;
      *(void *)(inited + 656) = sub_100023490();
      *(void *)(inited + 664) = v38;
      uint64_t v39 = sub_100023290();
      *(void *)(inited + 696) = sub_1000084A8(&qword_100038CB0);
      *(void *)(inited + 672) = v39;
      *(void *)(inited + 704) = sub_100023490();
      *(void *)(inited + 712) = v40;
      uint64_t v41 = sub_100010418(0, &qword_100038CB8);
      *(void *)(inited + 744) = sub_1000084A8(&qword_100038CC0);
      *(void *)(inited + 720) = v41;
      *(void *)(inited + 752) = sub_100023490();
      *(void *)(inited + 760) = v42;
      uint64_t v43 = sub_100010418(0, &qword_100038CC8);
      *(void *)(inited + 792) = sub_1000084A8(&qword_100038CD0);
      *(void *)(inited + 768) = v43;
      *(void *)(inited + 800) = sub_100023490();
      *(void *)(inited + 808) = v44;
      uint64_t v45 = sub_100010418(0, &qword_100038CD8);
      *(void *)(inited + 840) = sub_1000084A8(&qword_100038CE0);
      *(void *)(inited + 816) = v45;
      *(void *)(inited + 848) = sub_100023490();
      *(void *)(inited + 856) = v46;
      uint64_t v47 = sub_100010418(0, &qword_100038CE8);
      *(void *)(inited + 888) = sub_1000084A8(&qword_100038CF0);
      *(void *)(inited + 864) = v47;
      *(void *)(inited + 896) = sub_100023490();
      *(void *)(inited + 904) = v48;
      uint64_t v49 = sub_100022C80();
      *(void *)(inited + 936) = sub_1000084A8(&qword_100038CF8);
      *(void *)(inited + 912) = v49;
      unint64_t v50 = sub_100018FE0(inited);

      return v50;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100010320(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000E454(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100010370(uint64_t a1)
{
  sub_10000DDC0(a1, v1, 2);
}

uint64_t sub_100010390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000084A8(&qword_100038D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1000103F8(uint64_t a1)
{
  sub_10000DDC0(a1, v1, 0);
}

uint64_t sub_100010418(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100010454()
{
  return _swift_deallocObject(v0, 40, 7);
}

id sub_10001049C()
{
  return sub_10000C144(v0[2], v0[3], v0[4]);
}

void sub_1000104A8()
{
  sub_10000C454(*(char **)(v0 + 16));
}

uint64_t sub_1000104B0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_1000104F0(uint64_t a1, uint64_t a2)
{
  return sub_10000CEC4(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1000104F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000084A8(&qword_100038D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010560(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000084A8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000105BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000084A8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_100010620(char a1)
{
  sub_10000AD80(a1, *(void *)(v1 + 16));
}

uint64_t *sub_100010628(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10001068C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100010718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001072C);
}

uint64_t sub_10001072C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100022DF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000107DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000107F0);
}

uint64_t sub_1000107F0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100022DF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PPXRemoveFromWantToReadActionItem()
{
  uint64_t result = qword_100038E18;
  if (!qword_100038E18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000108E4()
{
  uint64_t result = sub_100022DF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100010994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  sub_10000941C(a1, (uint64_t)v18);
  sub_10000941C(a2, (uint64_t)v17);
  sub_10000941C(a4, (uint64_t)v16);
  id v10 = (id)BSUIGetLibraryItemStateProvider();
  sub_100008AAC(a4);
  sub_100008AAC(a2);
  sub_100008AAC(a1);
  self;
  uint64_t v11 = swift_dynamicCastObjCClassUnconditional();
  id v12 = (char *)a5 + *(int *)(type metadata accessor for PPXRemoveFromWantToReadActionItem() + 36);
  uint64_t v13 = enum case for ContextActionType.removeFromWantToRead(_:);
  uint64_t v14 = sub_100022DF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
  sub_10000936C(v18, (uint64_t)a5);
  sub_10000936C(v17, (uint64_t)(a5 + 5));
  a5[10] = a3;
  uint64_t result = sub_10000936C(v16, (uint64_t)(a5 + 11));
  a5[16] = v11;
  a5[17] = &off_100031BE0;
  return result;
}

uint64_t sub_100010AD8()
{
  sub_100009384(v0, v0[3]);
  sub_100022FD0();
  if (v4)
  {
    sub_1000093C8((uint64_t)v3);
    return 0;
  }
  else
  {
    sub_10000936C(v3, (uint64_t)v5);
    sub_100009384(v5, v5[3]);
    uint64_t v1 = sub_100022F30() & 1;
    sub_100008AAC((uint64_t)v5);
  }
  return v1;
}

uint64_t sub_100010B80()
{
  *(void *)(v1 + 104) = v0;
  sub_100023590();
  *(void *)(v1 + 112) = sub_100023580();
  uint64_t v3 = sub_100023570();
  return _swift_task_switch(sub_100010C18, v3, v2);
}

uint64_t sub_100010C18()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();
  sub_100009384(v1, v1[3]);
  sub_100022FD0();
  if (*(unsigned char *)(v0 + 56))
  {
    sub_1000093C8(v0 + 16);
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 104);
    sub_10000936C((long long *)(v0 + 16), v0 + 64);
    uint64_t v3 = self;
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    NSString v4 = sub_100023480();
    swift_bridgeObjectRelease();
    [v3 removeAssetFromWantToRead:v4 tracker:*(void *)(v2 + 80)];

    uint64_t v5 = *(void **)(v2 + 128);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    NSString v6 = sub_100023480();
    swift_bridgeObjectRelease();
    [v5 updateWantToReadState:0 identifier:v6];

    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    NSString v7 = sub_100023480();
    swift_bridgeObjectRelease();
    [v5 updateItemOfInterestForItemIdentifier:v7];

    sub_100008AAC(v0 + 64);
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100010DE4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000081D0;
  return sub_100010B80();
}

uint64_t *sub_100010E74(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    NSString v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    NSString v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100022E00();
    id v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)v7 + v13;
    id v16 = (char *)a2 + v13;
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    v15[16] = v16[16];
    *(uint64_t *)((char *)v7 + v14) = *(uint64_t *)((char *)a2 + v14);
    uint64_t v17 = a3[8];
    uint64_t v18 = a3[9];
    id v19 = *(void **)((char *)a2 + v17);
    *(uint64_t *)((char *)v7 + v17) = (uint64_t)v19;
    *(uint64_t *)((char *)v7 + v18) = *(uint64_t *)((char *)a2 + v18);
    uint64_t v20 = a3[10];
    uint64_t v21 = (char *)v7 + v20;
    uint64_t v22 = (char *)a2 + v20;
    long long v23 = *(_OWORD *)(v22 + 24);
    *(_OWORD *)((char *)v7 + v20 + 24) = v23;
    uint64_t v24 = v23;
    uint64_t v25 = **(void (***)(char *, char *, uint64_t))(v23 - 8);
    swift_unknownObjectRetain();
    id v26 = v19;
    swift_unknownObjectRetain();
    v25(v21, v22, v24);
  }
  return v7;
}

uint64_t sub_100011010(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_100022E00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  uint64_t v6 = a1 + a2[10];

  return sub_100008AAC(v6);
}

void *sub_1000110C0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  NSString v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100022E00();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v15 = a3[8];
  uint64_t v16 = a3[9];
  uint64_t v17 = *(void **)((char *)a2 + v15);
  *(void *)((char *)a1 + v15) = v17;
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  uint64_t v18 = a3[10];
  id v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  long long v21 = *(_OWORD *)(v20 + 24);
  *(_OWORD *)((char *)a1 + v18 + 24) = v21;
  uint64_t v22 = v21;
  long long v23 = **(void (***)(char *, char *, uint64_t))(v21 - 8);
  swift_unknownObjectRetain();
  id v24 = v17;
  swift_unknownObjectRetain();
  v23(v19, v20, v22);
  return a1;
}

void *sub_100011210(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  NSString v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100022E00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  char v13 = v12[16];
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  v11[16] = v13;
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v14 = a3[8];
  uint64_t v15 = *(void **)((char *)a2 + v14);
  uint64_t v16 = *(void **)((char *)a1 + v14);
  *(void *)((char *)a1 + v14) = v15;
  id v17 = v15;

  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  sub_100008D68((void *)((char *)a1 + a3[10]), (void *)((char *)a2 + a3[10]));
  return a1;
}

void *sub_100011328(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  NSString v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100022E00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  char v13 = (char *)a2 + v10;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  v12[16] = v13[16];
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  uint64_t v14 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  uint64_t v15 = a3[10];
  uint64_t v16 = (char *)a1 + v15;
  id v17 = (char *)a2 + v15;
  long long v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  *((void *)v16 + 4) = *((void *)v17 + 4);
  return a1;
}

void *sub_100011408(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  NSString v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100022E00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  char v13 = (char *)a2 + v10;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  v12[16] = v13[16];
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  swift_unknownObjectRelease();
  uint64_t v14 = a3[8];
  uint64_t v15 = *(void **)((char *)a1 + v14);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);

  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_unknownObjectRelease();
  uint64_t v16 = a3[10];
  id v17 = (char *)a1 + v16;
  long long v18 = (char *)a2 + v16;
  sub_100008AAC((uint64_t)a1 + v16);
  long long v19 = *((_OWORD *)v18 + 1);
  *(_OWORD *)id v17 = *(_OWORD *)v18;
  *((_OWORD *)v17 + 1) = v19;
  *((void *)v17 + 4) = *((void *)v18 + 4);
  return a1;
}

uint64_t sub_100011514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100011528);
}

uint64_t sub_100011528(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100022E00();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000115D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000115EC);
}

void *sub_1000115EC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100022E00();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PPXContextActionData()
{
  uint64_t result = qword_100038EC8;
  if (!qword_100038EC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000116E0()
{
  uint64_t result = sub_100022E00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000117B0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100023770();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  int v3 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v16 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t result = sub_10001F974(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    int v3 = v16;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = sub_100023700();
        uint64_t v16 = v3;
        unint64_t v8 = v3[2];
        unint64_t v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_10001F974(v7 > 1, v8 + 1, 1);
          int v3 = v16;
        }
        ++v5;
        uint64_t v14 = type metadata accessor for PPXContextAssetInfo();
        unint64_t v15 = sub_100011F8C();
        *(void *)&long long v13 = v6;
        long long v3[2] = v8 + 1;
        sub_10000936C(&v13, (uint64_t)&v3[5 * v8 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v9 = (uint64_t *)(a1 + 32);
      do
      {
        uint64_t v10 = *v9;
        uint64_t v16 = v3;
        unint64_t v11 = v3[2];
        unint64_t v12 = v3[3];
        swift_retain();
        if (v11 >= v12 >> 1)
        {
          sub_10001F974(v12 > 1, v11 + 1, 1);
          int v3 = v16;
        }
        uint64_t v14 = type metadata accessor for PPXContextAssetInfo();
        unint64_t v15 = sub_100011F8C();
        *(void *)&long long v13 = v10;
        long long v3[2] = v11 + 1;
        sub_10000936C(&v13, (uint64_t)&v3[5 * v11 + 4]);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_100011974@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8 = (int *)type metadata accessor for PPXContextActionData();
  uint64_t v28 = *((void *)v8 - 1);
  __chkstk_darwin(v8);
  uint64_t v10 = (uint64_t *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_1000117B0((unint64_t)&_swiftEmptyArrayStorage);
  *uint64_t v10 = v11;
  unint64_t v12 = (char *)v10 + v8[5];
  uint64_t v13 = enum case for ContextActionSource.unknown(_:);
  uint64_t v14 = sub_100022E00();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
  unint64_t v15 = (char *)v10 + v8[6];
  *(void *)unint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  v15[16] = 1;
  *(uint64_t *)((char *)v10 + v8[7]) = 0;
  *(uint64_t *)((char *)v10 + v8[8]) = (uint64_t)a1;
  *(uint64_t *)((char *)v10 + v8[9]) = a2;
  sub_10000941C(a3, (uint64_t)v10 + v8[10]);
  sub_10000941C(a3, (uint64_t)&v29);
  uint64_t v16 = type metadata accessor for PPXContextAssetInfo();
  swift_allocObject();
  id v17 = a1;
  swift_unknownObjectRetain_n();
  id v18 = v17;
  uint64_t v19 = sub_1000166B8(v18, a2, (uint64_t)&v29);
  if (v19)
  {
    uint64_t v20 = v19;
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v11 = (uint64_t)sub_10001E09C(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
    }
    unint64_t v23 = *(void *)(v11 + 16);
    unint64_t v22 = *(void *)(v11 + 24);
    if (v23 >= v22 >> 1) {
      uint64_t v11 = (uint64_t)sub_10001E09C((char *)(v22 > 1), v23 + 1, 1, (char *)v11);
    }
    uint64_t v30 = v16;
    unint64_t v31 = sub_100011F8C();
    *(void *)&long long v29 = v20;
    *(void *)(v11 + 16) = v23 + 1;
    sub_10000936C(&v29, v11 + 40 * v23 + 32);
    swift_release();

    swift_unknownObjectRelease();
    *uint64_t v10 = v11;
    sub_100008AAC(a3);
    a4 = v27;
    sub_100011FE4((uint64_t)v10, v27);
    uint64_t v24 = 0;
  }
  else
  {

    swift_unknownObjectRelease();
    sub_100008AAC(a3);
    sub_100011F30((uint64_t)v10);
    uint64_t v24 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v28 + 56))(a4, v24, 1, v8);
}

uint64_t sub_100011C40()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100011C48()
{
  return [self isOffline] ^ 1;
}

id sub_100011C78()
{
  id v0 = [[[self sharedInstance] isBookStoreAllowed];
  swift_unknownObjectRelease();
  return v0;
}

id sub_100011CD4()
{
  id v0 = [self sharedProvider];
  id v1 = [v0 isStoreAccountManagedAppleID];

  return v1;
}

uint64_t sub_100011D2C()
{
  return sub_100022E50() & 1;
}

uint64_t sub_100011D58()
{
  return sub_100022E70() & 1;
}

uint64_t sub_100011D84()
{
  return sub_100022E40() & 1;
}

uint64_t sub_100011DB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_100022E00();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_100011E20()
{
  return sub_100022E60();
}

uint64_t sub_100011E48(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 24));
}

void *sub_100011E5C()
{
  id v0 = (void *)sub_100022EA0();
  uint64_t v2 = v1;
  if (v3)
  {
    sub_100011EE4(v0, v1, 1);
    return 0;
  }
  else
  {
  }
  return v2;
}

uint64_t sub_100011EA8()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_100011EB8()
{
  return sub_100022E80() & 1;
}

void sub_100011EE4(void *a1, void *a2, char a3)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

uint64_t sub_100011F30(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PPXContextActionData();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100011F8C()
{
  unint64_t result = qword_100038F18;
  if (!qword_100038F18)
  {
    type metadata accessor for PPXContextAssetInfo();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100038F18);
  }
  return result;
}

uint64_t sub_100011FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PPXContextActionData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001205C);
}

uint64_t sub_10001205C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100022DF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10001210C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100012120);
}

uint64_t sub_100012120(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100022DF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PPXMarkedAsStillReadingActionItem()
{
  uint64_t result = qword_100038F78;
  if (!qword_100038F78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100012214()
{
  uint64_t result = sub_100022DF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000122C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  sub_10000941C(a1, (uint64_t)v18);
  sub_10000941C(a2, (uint64_t)v17);
  sub_10000941C(a4, (uint64_t)v16);
  id v10 = (id)BSUIGetLibraryItemStateProvider();
  sub_100008AAC(a4);
  sub_100008AAC(a2);
  sub_100008AAC(a1);
  self;
  uint64_t v11 = swift_dynamicCastObjCClassUnconditional();
  unint64_t v12 = (char *)a5 + *(int *)(type metadata accessor for PPXMarkedAsStillReadingActionItem() + 36);
  uint64_t v13 = enum case for ContextActionType.markAsStillReading(_:);
  uint64_t v14 = sub_100022DF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
  sub_10000936C(v18, (uint64_t)a5);
  sub_10000936C(v17, (uint64_t)(a5 + 5));
  a5[10] = a3;
  uint64_t result = sub_10000936C(v16, (uint64_t)(a5 + 11));
  a5[16] = v11;
  a5[17] = &off_100031BE0;
  return result;
}

uint64_t sub_100012408()
{
  sub_100009384(v0, v0[3]);
  sub_100022FD0();
  if (v8)
  {
    sub_1000093C8((uint64_t)&v6);
    return 0;
  }
  else
  {
    sub_10000936C(&v6, (uint64_t)v9);
    sub_100009384(v9, v9[3]);
    char v2 = sub_100022F90();
    if (v2 == 2)
    {
      sub_10000941C((uint64_t)v9, (uint64_t)&v6);
      uint64_t v1 = 0;
    }
    else
    {
      char v3 = v2;
      sub_10000941C((uint64_t)v9, (uint64_t)&v6);
      if (v3)
      {
        sub_100009384(&v6, v7);
        char v4 = sub_100022F40();
        if (v4 == 2) {
          uint64_t v1 = 0;
        }
        else {
          uint64_t v1 = v4 & 1;
        }
      }
      else
      {
        uint64_t v1 = 0;
      }
    }
    sub_100008AAC((uint64_t)&v6);
    sub_100008AAC((uint64_t)v9);
  }
  return v1;
}

uint64_t sub_100012520()
{
  v1[13] = v0;
  uint64_t v2 = sub_100023120();
  v1[14] = v2;
  v1[15] = *(void *)(v2 - 8);
  v1[16] = swift_task_alloc();
  uint64_t v3 = sub_1000230A0();
  v1[17] = v3;
  v1[18] = *(void *)(v3 - 8);
  v1[19] = swift_task_alloc();
  uint64_t v4 = sub_100023130();
  v1[20] = v4;
  v1[21] = *(void *)(v4 - 8);
  v1[22] = swift_task_alloc();
  sub_1000084A8(&qword_100038758);
  v1[23] = swift_task_alloc();
  sub_100023590();
  v1[24] = sub_100023580();
  uint64_t v6 = sub_100023570();
  return _swift_task_switch(sub_1000126FC, v6, v5);
}

uint64_t sub_1000126FC()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();
  sub_100009384(v1, v1[3]);
  sub_100022FD0();
  if (*(unsigned char *)(v0 + 56))
  {
    sub_1000093C8(v0 + 16);
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 176);
    uint64_t v22 = *(void *)(v0 + 184);
    uint64_t v2 = *(void *)(v0 + 168);
    uint64_t v23 = *(void *)(v0 + 160);
    uint64_t v15 = *(void *)(v0 + 152);
    uint64_t v20 = *(void *)(v0 + 144);
    uint64_t v14 = *(void *)(v0 + 136);
    uint64_t v16 = *(void *)(v0 + 120);
    uint64_t v17 = *(void *)(v0 + 112);
    uint64_t v18 = *(void *)(v0 + 128);
    uint64_t v19 = *(void *)(v0 + 104);
    sub_10000936C((long long *)(v0 + 16), v0 + 64);
    sub_100023110();
    uint64_t v3 = (void *)sub_100023100();
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    sub_1000230F0();
    swift_bridgeObjectRelease();

    uint64_t v13 = (void *)sub_100023100();
    sub_100023490();
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v21, enum case for ContentAcquisitionType.storeBought(_:), v23);
    unint64_t v12 = (void *)(v0 + 64);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022FB0();
    char v4 = sub_100022E30();
    uint64_t v5 = (unsigned int *)&enum case for ContentType.audiobook(_:);
    if ((v4 & 1) == 0) {
      uint64_t v5 = (unsigned int *)&enum case for ContentType.book(_:);
    }
    (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v15, *v5, v14);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F60();
    sub_100023660();
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v18, enum case for ProductionType.unknown(_:), v17);
    sub_1000230D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v15, v14);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v21, v23);
    uint64_t v6 = self;
    sub_100009384(v12, *(void *)(v0 + 88));
    sub_100022F70();
    NSString v7 = sub_100023480();
    swift_bridgeObjectRelease();
    [v6 setFinishedState:0 storeID:v7 tracker:*(void *)(v19 + 80) storeID:v7 tracker:v22 tracker:v18];

    uint64_t v8 = *(void **)(v19 + 128);
    sub_100009384(v12, *(void *)(v0 + 88));
    sub_100022F70();
    NSString v9 = sub_100023480();
    swift_bridgeObjectRelease();
    [v8 updateItemOfInterestForItemIdentifier:v9];

    sub_10000A224(v22);
    sub_100008AAC((uint64_t)v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100012B38()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000081D0;
  return sub_100012520();
}

uint64_t type metadata accessor for BundleFinder()
{
  return self;
}

uint64_t LibraryAnalyticsDataProvider.seriesType(for:)@<X0>(uint64_t a1@<X8>)
{
  id v2 = (id)BSUIGetLibraryItemStateProvider();
  NSString v3 = sub_100023480();
  id v4 = [v2 itemStateWithIdentifier:v3];

  swift_unknownObjectRelease();
  id v5 = [v4 seriesType];
  swift_unknownObjectRelease();
  switch((unint64_t)v5)
  {
    case 1uLL:
      uint64_t v11 = (unsigned int *)&enum case for SeriesType.nonSeries(_:);
      goto LABEL_6;
    case 2uLL:
      uint64_t v11 = (unsigned int *)&enum case for SeriesType.ordered(_:);
      goto LABEL_6;
    case 3uLL:
      uint64_t v11 = (unsigned int *)&enum case for SeriesType.unOrdered(_:);
LABEL_6:
      uint64_t v12 = *v11;
      uint64_t v13 = sub_100023090();
      uint64_t v15 = *(void *)(v13 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 104))(a1, v12, v13);
      NSString v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      uint64_t v9 = a1;
      uint64_t v10 = 0;
      uint64_t v8 = v13;
      break;
    default:
      uint64_t v6 = sub_100023090();
      NSString v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
      uint64_t v8 = v6;
      uint64_t v9 = a1;
      uint64_t v10 = 1;
      break;
  }

  return v7(v9, v10, 1, v8);
}

ValueMetadata *type metadata accessor for LibraryAnalyticsDataProvider()
{
  return &type metadata for LibraryAnalyticsDataProvider;
}

uint64_t sub_100012DD4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v19 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    long long v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(v4 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v4 + 40, (uint64_t)(a2 + 5));
    uint64_t v9 = (void *)a2[10];
    *(void *)(v4 + 80) = v9;
    long long v10 = *((_OWORD *)a2 + 7);
    *(_OWORD *)(v4 + 112) = v10;
    uint64_t v11 = v10;
    uint64_t v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
    id v13 = v9;
    v12(v4 + 88, (uint64_t)(a2 + 11), v11);
    long long v14 = *(_OWORD *)(a2 + 19);
    *(_OWORD *)(v4 + 152) = v14;
    (**(void (***)(uint64_t, uint64_t))(v14 - 8))(v4 + 128, (uint64_t)(a2 + 16));
    uint64_t v15 = *(int *)(a3 + 36);
    uint64_t v16 = v4 + v15;
    uint64_t v17 = (uint64_t)a2 + v15;
    uint64_t v18 = sub_100022DF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return v4;
}

uint64_t sub_100012FF4(uint64_t a1, uint64_t a2)
{
  sub_100008AAC(a1);
  sub_100008AAC(a1 + 40);

  sub_100008AAC(a1 + 88);
  sub_100008AAC(a1 + 128);
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_100022DF0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_100013088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, a2 + 40);
  long long v8 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v8;
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 112) = v9;
  uint64_t v10 = v9;
  uint64_t v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  id v12 = v8;
  v11(a1 + 88, a2 + 88, v10);
  long long v13 = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 152) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 128, a2 + 128);
  uint64_t v14 = *(int *)(a3 + 36);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_100022DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

uint64_t *sub_100013250(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_100008D68(a1, a2);
  sub_100008D68(a1 + 5, a2 + 5);
  long long v6 = (void *)a1[10];
  long long v7 = (void *)a2[10];
  a1[10] = (uint64_t)v7;
  id v8 = v7;

  sub_100008D68(a1 + 11, a2 + 11);
  sub_100008D68(a1 + 16, a2 + 16);
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100022DF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_100013308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  long long v6 = *(_OWORD *)(a2 + 88);
  long long v7 = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v7;
  *(_OWORD *)(a1 + 88) = v6;
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  long long v8 = *(_OWORD *)(a2 + 144);
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  uint64_t v12 = sub_100022DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

uint64_t sub_1000133CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100008AAC(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_100008AAC(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  long long v7 = *(void **)(a1 + 80);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;

  sub_100008AAC(a1 + 88);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  sub_100008AAC(a1 + 128);
  long long v9 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v9;
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_100022DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_1000134BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000134D0);
}

uint64_t sub_1000134D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100022DF0();
    long long v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100013580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100013594);
}

uint64_t sub_100013594(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100022DF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PPXRemoveDownloadActionItem()
{
  uint64_t result = qword_1000390C0;
  if (!qword_1000390C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100013688()
{
  uint64_t result = sub_100022DF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_100013730@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_10000941C(a1, (uint64_t)v20);
  sub_10000941C(a2, (uint64_t)v19);
  sub_10000941C(a4, (uint64_t)v18);
  id result = [self sharedInstance];
  if (result)
  {
    id v11 = result;
    unint64_t v16 = sub_100013C4C();
    uint64_t v17 = &off_100031BC8;
    *(void *)&long long v15 = v11;
    sub_100008AAC(a4);
    sub_100008AAC(a2);
    sub_100008AAC(a1);
    uint64_t v12 = a5 + *(int *)(type metadata accessor for PPXRemoveDownloadActionItem() + 36);
    uint64_t v13 = enum case for ContextActionType.removeDownload(_:);
    uint64_t v14 = sub_100022DF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
    sub_10000936C(v20, a5);
    sub_10000936C(v19, a5 + 40);
    *(void *)(a5 + 80) = a3;
    sub_10000936C(v18, a5 + 88);
    return (id)sub_10000936C(&v15, a5 + 128);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100013880()
{
  sub_100009384(v0, v0[3]);
  sub_100022FD0();
  if ((v8 & 1) == 0)
  {
    sub_10000936C(&v6, (uint64_t)v9);
    sub_100009384(v9, v9[3]);
    char v2 = sub_100022F80();
    if (v2 == 2)
    {
      sub_10000941C((uint64_t)v9, (uint64_t)&v6);
    }
    else
    {
      char v3 = v2;
      sub_10000941C((uint64_t)v9, (uint64_t)&v6);
      if (v3)
      {
        sub_100009384(&v6, v7);
        char v5 = sub_100022F20();
        sub_100008AAC((uint64_t)&v6);
        if ((v5 & 1) == 0)
        {
          uint64_t v1 = [self isRunningInStoreDemoMode] ^ 1;
          goto LABEL_8;
        }
LABEL_7:
        uint64_t v1 = 0;
LABEL_8:
        sub_100008AAC((uint64_t)v9);
        return v1;
      }
    }
    sub_100008AAC((uint64_t)&v6);
    goto LABEL_7;
  }
  sub_1000093C8((uint64_t)&v6);
  return 0;
}

uint64_t sub_1000139B0()
{
  *(void *)(v1 + 104) = v0;
  sub_100023590();
  *(void *)(v1 + 112) = sub_100023580();
  uint64_t v3 = sub_100023570();
  return _swift_task_switch(sub_100013A48, v3, v2);
}

uint64_t sub_100013A48()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();
  sub_100009384(v1, v1[3]);
  sub_100022FD0();
  if (*(unsigned char *)(v0 + 56))
  {
    sub_1000093C8(v0 + 16);
  }
  else
  {
    uint64_t v2 = *(void **)(v0 + 104);
    sub_10000936C((long long *)(v0 + 16), v0 + 64);
    uint64_t v3 = v2[19];
    uint64_t v4 = v2[20];
    sub_100009384(v2 + 16, v3);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    uint64_t v5 = sub_100022F70();
    uint64_t v7 = v6;
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022FB0();
    char v8 = sub_100022E30();
    (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v4 + 16))(v5, v7, v8 & 1, v3, v4);
    swift_bridgeObjectRelease();
    sub_100008AAC(v0 + 64);
  }
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_100013BBC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000081D0;
  return sub_1000139B0();
}

unint64_t sub_100013C4C()
{
  unint64_t result = qword_100039110;
  if (!qword_100039110)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_100039110);
  }
  return result;
}

void sub_100013C8C(uint64_t a1, uint64_t a2)
{
  id v4 = [self sharedInstance];
  if (v4)
  {
    uint64_t v5 = v4;
    sub_1000084A8(&qword_100039120);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_10002B120;
    *(void *)(v6 + 32) = a1;
    *(void *)(v6 + 40) = a2;
    swift_bridgeObjectRetain();
    Class isa = sub_100023520().super.isa;
    swift_bridgeObjectRelease();
    [v5 downloadBooks:isa];
  }
  else
  {
    __break(1u);
  }
}

void sub_100013D68(uint64_t a1, uint64_t a2, char a3)
{
  id v4 = [self sharedInstance];
  if (v4)
  {
    uint64_t v5 = v4;
    NSString v6 = sub_100023480();
    [v5 removeDownload:v6 isAudiobook:a3 & 1];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100013E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013E20);
}

uint64_t sub_100013E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100022DF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100013ED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100013EE4);
}

uint64_t sub_100013EE4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100022DF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PPXDislikeActionItem()
{
  uint64_t result = qword_100039180;
  if (!qword_100039180) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100013FD8()
{
  uint64_t result = sub_100022DF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_100014080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_10000941C(a1, (uint64_t)v19);
  sub_10000941C(a2, (uint64_t)v18);
  sub_10000941C(a4, (uint64_t)v17);
  id result = [self sharedInstance];
  if (result)
  {
    sub_100014B00();
    sub_100023280();
    sub_100023270();
    uint64_t v15 = sub_100022EF0();
    unint64_t v16 = &protocol witness table for MenuLikeStateController;
    sub_100010628((uint64_t *)&v14);
    sub_100022EE0();
    sub_100008AAC(a4);
    sub_100008AAC(a2);
    sub_100008AAC(a1);
    uint64_t v11 = a5 + *(int *)(type metadata accessor for PPXDislikeActionItem() + 36);
    uint64_t v12 = enum case for ContextActionType.dislike(_:);
    uint64_t v13 = sub_100022DF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);
    sub_10000936C(v19, a5);
    sub_10000936C(v18, a5 + 40);
    *(void *)(a5 + 80) = a3;
    sub_10000936C(v17, a5 + 88);
    return (id)sub_10000936C(&v14, a5 + 128);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100014224()
{
  unint64_t v1 = v0;
  sub_100009384(v0, v0[3]);
  sub_100022FD0();
  if (v10 == 1)
  {
    sub_1000093C8((uint64_t)v9);
LABEL_11:
    char v7 = 0;
    return v7 & 1;
  }
  sub_10000936C(v9, (uint64_t)v11);
  sub_100009384(v11, v12);
  sub_100022FB0();
  if (sub_100022E30()) {
    goto LABEL_10;
  }
  sub_100009384(v11, v12);
  sub_100022FB0();
  if (sub_100022E30()) {
    goto LABEL_10;
  }
  sub_100009384(v11, v12);
  uint64_t v2 = sub_100022FA0();
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t v4 = v2;
  unint64_t v5 = v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v6 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
LABEL_10:
    sub_100008AAC((uint64_t)v11);
    goto LABEL_11;
  }
  sub_100009384(v1, v1[3]);
  char v7 = sub_100022FC0();
  sub_100008AAC((uint64_t)v11);
  return v7 & 1;
}

uint64_t sub_100014380()
{
  v1[18] = v0;
  uint64_t v2 = sub_100023250();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  sub_100023590();
  v1[22] = sub_100023580();
  uint64_t v4 = sub_100023570();
  v1[23] = v4;
  v1[24] = v3;
  return _swift_task_switch(sub_100014474, v4, v3);
}

uint64_t sub_100014474()
{
  sub_100009384(*(void **)(v0 + 144), *(void *)(*(void *)(v0 + 144) + 24));
  sub_100022FD0();
  if (*(unsigned char *)(v0 + 56))
  {
    swift_release();
    sub_1000093C8(v0 + 16);
    swift_task_dealloc();
    unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v3 = *(void **)(v0 + 144);
    sub_10000936C((long long *)(v0 + 16), v0 + 64);
    uint64_t v4 = v3[19];
    uint64_t v5 = v3[20];
    sub_100009384(v3 + 16, v4);
    uint64_t v6 = v3 + 5;
    uint64_t v7 = v3[10];
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v8;
    void *v8 = v0;
    v8[1] = sub_1000145E8;
    uint64_t v9 = *(void *)(v0 + 144);
    return dispatch thunk of LikeStateController.authAndsubmitLikeState(liked:context:data:assetInfo:tracker:)(0, v6, v9, v0 + 64, v7, v4, v5);
  }
}

uint64_t sub_1000145E8(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 208) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[23];
    uint64_t v6 = v4[24];
    uint64_t v7 = sub_100014814;
  }
  else
  {
    v4[27] = a1;
    uint64_t v5 = v4[23];
    uint64_t v6 = v4[24];
    uint64_t v7 = sub_100014710;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_100014710()
{
  uint64_t v1 = v0[27];
  swift_release();
  if (v1)
  {
    uint64_t v2 = v0[18];
    uint64_t v3 = self;
    sub_100009384((void *)(v2 + 40), *(void *)(v2 + 64));
    sub_100022C40();
    Class isa = sub_100023440().super.isa;
    swift_bridgeObjectRelease();
    [v3 presentNoticeForBookLoved:0 options:isa];
  }
  sub_100008AAC((uint64_t)(v0 + 8));
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100014814()
{
  uint64_t v15 = v0;
  swift_release();
  sub_100023220();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100023230();
  os_log_type_t v2 = sub_1000235D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v11 = v0[20];
    uint64_t v12 = v0[19];
    uint64_t v13 = v0[21];
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getErrorValue();
    uint64_t v4 = sub_100023810();
    v0[17] = sub_100014B40(v4, v5, &v14);
    sub_100023670();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "error while trying to submide dislike preference with : %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v12);
  }
  else
  {
    uint64_t v7 = v0[20];
    uint64_t v6 = v0[21];
    uint64_t v8 = v0[19];

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  sub_100008AAC((uint64_t)(v0 + 8));
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100014A70()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000081D0;
  return sub_100014380();
}

unint64_t sub_100014B00()
{
  unint64_t result = qword_1000391D0;
  if (!qword_1000391D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1000391D0);
  }
  return result;
}

uint64_t sub_100014B40(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100014C14(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000E4DC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000E4DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008AAC((uint64_t)v12);
  return v7;
}

uint64_t sub_100014C14(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100023680();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100014DD0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100023720();
  if (!v8)
  {
    sub_100023740();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000237B0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100014DD0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100014E68(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100015048(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100015048(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100014E68(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100014FE0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000236F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100023740();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000234F0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000237B0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100023740();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100014FE0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_1000084A8(&qword_1000391E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100015048(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000084A8(&qword_1000391E0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1000237B0();
  __break(1u);
  return result;
}

uint64_t sub_10001519C()
{
  *(void *)(v1 + 104) = v0;
  sub_100023590();
  *(void *)(v1 + 112) = sub_100023580();
  uint64_t v3 = sub_100023570();
  return _swift_task_switch(sub_100015234, v3, v2);
}

uint64_t sub_100015234()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();
  sub_100009384(v1, v1[3]);
  sub_100022FD0();
  if (*(unsigned char *)(v0 + 56) == 1)
  {
    sub_1000093C8(v0 + 16);
  }
  else
  {
    sub_10000936C((long long *)(v0 + 16), v0 + 64);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022F70();
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    char v2 = sub_100022F90();
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    sub_100022FB0();
    char v3 = sub_100022E30();
    id v4 = objc_allocWithZone((Class)PPXCollectionListViewController);
    NSString v5 = sub_100023480();
    swift_bridgeObjectRelease();
    id v6 = [v4 initWithAssetID:v5 isPurchased:v2 & 1 isAudiobook:v3 & 1];

    if (v6)
    {
      uint64_t v7 = *(void *)(v0 + 104);
      id v8 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v6 action:"doneButtonPressed"];
      id v9 = [v6 navigationItem];
      [v9 setRightBarButtonItem:v8 animated:0];

      id v10 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v6];
      sub_100009384((void *)(v7 + 40), *(void *)(v7 + 64));
      sub_100022C30();
    }
    sub_100008AAC(v0 + 64);
  }
  size_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_100015488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = sub_100022DF0();
  id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

BOOL sub_1000154F8()
{
  sub_100009384(v0, v0[3]);
  sub_100022FD0();
  char v1 = v3[40];
  sub_1000093C8((uint64_t)v3);
  return (v1 & 1) == 0;
}

uint64_t sub_100015558()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000081D0;
  return sub_10001519C();
}

uint64_t sub_1000155E4@<X0>(long long *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, long long *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_10000936C(a1, a6);
  sub_10000936C(a2, a6 + 40);
  *(void *)(a6 + 80) = a3;
  sub_10000936C(a4, a6 + 88);
  uint64_t v11 = a6 + *(int *)(a5 + 32);
  uint64_t v12 = enum case for ContextActionType.addToCollection(_:);
  uint64_t v13 = sub_100022DF0();
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104);

  return v14(v11, v12, v13);
}

uint64_t sub_1000156B8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    long long v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(v4 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v4 + 40, (uint64_t)(a2 + 5));
    id v9 = (void *)a2[10];
    *(void *)(v4 + 80) = v9;
    long long v10 = *((_OWORD *)a2 + 7);
    *(_OWORD *)(v4 + 112) = v10;
    uint64_t v11 = v10;
    uint64_t v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
    id v13 = v9;
    v12(v4 + 88, (uint64_t)(a2 + 11), v11);
    uint64_t v14 = *(int *)(a3 + 32);
    uint64_t v15 = v4 + v14;
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_100022DF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  return v4;
}

uint64_t sub_100015888(uint64_t a1, uint64_t a2)
{
  sub_100008AAC(a1);
  sub_100008AAC(a1 + 40);

  sub_100008AAC(a1 + 88);
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_100022DF0();
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_100015914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, a2 + 40);
  long long v8 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v8;
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 112) = v9;
  uint64_t v10 = v9;
  uint64_t v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  id v12 = v8;
  v11(a1 + 88, a2 + 88, v10);
  uint64_t v13 = *(int *)(a3 + 32);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_100022DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

uint64_t *sub_100015A8C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_100008D68(a1, a2);
  sub_100008D68(a1 + 5, a2 + 5);
  long long v6 = (void *)a1[10];
  long long v7 = (void *)a2[10];
  a1[10] = (uint64_t)v7;
  id v8 = v7;

  sub_100008D68(a1 + 11, a2 + 11);
  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100022DF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_100015B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  long long v6 = *(_OWORD *)(a2 + 88);
  long long v7 = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v7;
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + 88) = v6;
  uint64_t v11 = sub_100022DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_100015BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100008AAC(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_100008AAC(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  long long v7 = *(void **)(a1 + 80);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;

  sub_100008AAC(a1 + 88);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_100022DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_100015CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100015CD8);
}

uint64_t sub_100015CD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100022DF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100015D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100015D9C);
}

uint64_t sub_100015D9C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100022DF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PPXAddToCollectionActionItem()
{
  uint64_t result = qword_100039240;
  if (!qword_100039240) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100015E90()
{
  uint64_t result = sub_100022DF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100015F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100015F48);
}

uint64_t sub_100015F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100022DF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100015FF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001600C);
}

uint64_t sub_10001600C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100022DF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PPXDownloadActionItem()
{
  uint64_t result = qword_1000392F0;
  if (!qword_1000392F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100016100()
{
  uint64_t result = sub_100022DF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_1000161A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_10000941C(a1, (uint64_t)v20);
  sub_10000941C(a2, (uint64_t)v19);
  sub_10000941C(a4, (uint64_t)v18);
  id result = [self sharedInstance];
  if (result)
  {
    id v11 = result;
    unint64_t v16 = sub_100013C4C();
    uint64_t v17 = &off_100031BC8;
    *(void *)&long long v15 = v11;
    sub_100008AAC(a4);
    sub_100008AAC(a2);
    sub_100008AAC(a1);
    uint64_t v12 = a5 + *(int *)(type metadata accessor for PPXDownloadActionItem() + 36);
    uint64_t v13 = enum case for ContextActionType.download(_:);
    uint64_t v14 = sub_100022DF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
    sub_10000936C(v20, a5);
    sub_10000936C(v19, a5 + 40);
    *(void *)(a5 + 80) = a3;
    sub_10000936C(v18, a5 + 88);
    return (id)sub_10000936C(&v15, a5 + 128);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000162F8()
{
  sub_100009384(v0, v0[3]);
  sub_100022FD0();
  if ((v10 & 1) == 0)
  {
    sub_10000936C(&v8, (uint64_t)v11);
    sub_100009384(v11, v11[3]);
    char v2 = sub_100022F80();
    if (v2 == 2)
    {
      sub_10000941C((uint64_t)v11, (uint64_t)&v8);
    }
    else
    {
      char v3 = v2;
      sub_10000941C((uint64_t)v11, (uint64_t)&v8);
      if ((v3 & 1) == 0)
      {
        sub_100009384(&v8, v9);
        char v4 = sub_100022F20();
        sub_100008AAC((uint64_t)&v8);
        sub_10000941C((uint64_t)v11, (uint64_t)v7);
        if ((v4 & 1) == 0)
        {
          sub_100009384(v7, v7[3]);
          char v5 = sub_100022F90();
          if (v5 == 2) {
            uint64_t v1 = 0;
          }
          else {
            uint64_t v1 = v5 & 1;
          }
          goto LABEL_12;
        }
LABEL_11:
        uint64_t v1 = 0;
LABEL_12:
        sub_100008AAC((uint64_t)v7);
        sub_100008AAC((uint64_t)v11);
        return v1;
      }
    }
    sub_100008AAC((uint64_t)&v8);
    sub_10000941C((uint64_t)v11, (uint64_t)v7);
    goto LABEL_11;
  }
  sub_1000093C8((uint64_t)&v8);
  return 0;
}

uint64_t sub_10001645C()
{
  *(void *)(v1 + 104) = v0;
  sub_100023590();
  *(void *)(v1 + 112) = sub_100023580();
  uint64_t v3 = sub_100023570();
  return _swift_task_switch(sub_1000164F4, v3, v2);
}

uint64_t sub_1000164F4()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();
  sub_100009384(v1, v1[3]);
  sub_100022FD0();
  if (*(unsigned char *)(v0 + 56))
  {
    sub_1000093C8(v0 + 16);
  }
  else
  {
    uint64_t v2 = *(void **)(v0 + 104);
    sub_10000936C((long long *)(v0 + 16), v0 + 64);
    uint64_t v3 = v2[20];
    sub_100009384(v2 + 16, v2[19]);
    sub_100009384((void *)(v0 + 64), *(void *)(v0 + 88));
    uint64_t v4 = sub_100022F70();
    (*(void (**)(uint64_t))(v3 + 8))(v4);
    swift_bridgeObjectRelease();
    sub_100008AAC(v0 + 64);
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100016628()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000081D0;
  return sub_10001645C();
}

uint64_t sub_1000166B8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  *(void *)(v3 + 88) = 0;
  *(void *)(v3 + 96) = 0;
  *(void *)(v3 + 104) = 0;
  *(void *)(v3 + 112) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(v3 + 120) = 0;
  uint64_t v8 = v3 + 32;
  *(void *)(v3 + 128) = 0;
  *(void *)(v3 + 136) = 0;
  sub_10000941C(a3, v3 + 32);
  *(void *)(v3 + 16) = a2;
  swift_unknownObjectRetain();
  char v10 = (void *)sub_100022EA0();
  id v11 = v9;
  if (v12)
  {

    swift_unknownObjectRelease();
    sub_100011EE4(v10, v11, 1);
LABEL_6:
    sub_100008AAC(a3);
LABEL_8:
    swift_unknownObjectRelease();
    sub_100008AAC(v8);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    return 0;
  }

  sub_100022E90();
  if (v21 != 2)
  {

    swift_unknownObjectRelease();
    sub_100008AAC(a3);
    sub_100018A40((uint64_t)v20);
    goto LABEL_8;
  }
  id v13 = v20[0];
  sub_1000231E0();
  uint64_t v14 = swift_dynamicCastClass();
  if (!v14)
  {

    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  *(void *)(v4 + 24) = v14;
  id v15 = v13;
  uint64_t v16 = sub_100023200();
  uint64_t v18 = v17;

  swift_unknownObjectRelease();
  sub_100008AAC(a3);
  *(void *)(v4 + 72) = v16;
  *(void *)(v4 + 80) = v18;
  return v4;
}

uint64_t sub_1000168B4()
{
  uint64_t v0 = sub_100023140();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  sub_100023210();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == enum case for MResourceType.audiobooks(_:)) {
    return 0x6F6F626F69647561;
  }
  if (v4 == enum case for MResourceType.audiobookSeries(_:) || v4 == enum case for MResourceType.authors(_:)) {
    return 0;
  }
  if (v4 != enum case for MResourceType.books(_:))
  {
    if (v4 != enum case for MResourceType.bookSeries(_:) && v4 != enum case for MResourceType.genres(_:)) {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
    return 0;
  }
  if (sub_1000231C0()) {
    return 0xD000000000000012;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_100016A80()
{
  v1[7] = v0;
  uint64_t v2 = sub_100022E20();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return _swift_task_switch(sub_100016B40, 0, 0);
}

uint64_t sub_100016B40()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  sub_10000941C(v4 + 32, (uint64_t)(v0 + 2));
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  sub_100009384(v0 + 2, v5);
  uint64_t v7 = *(void *)(v4 + 24);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for MenuCoverImageSource.network(_:), v3);
  unint64_t v8 = kAEAssetActivityItemProviderDefaultCoverSize[0];
  unint64_t v9 = kAEAssetActivityItemProviderDefaultCoverSize[1];
  char v10 = (void *)swift_task_alloc();
  v0[11] = v10;
  *char v10 = v0;
  v10[1] = sub_100016C6C;
  uint64_t v11 = v0[10];
  v12.n128_u64[0] = v8;
  v13.n128_u64[0] = v9;
  return dispatch thunk of MenuCoverImageProviding.image(for:from:size:includeSpine:)(v7, v11, 1, v5, v6, v12, v13);
}

uint64_t sub_100016C6C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 80);
  uint64_t v3 = *(void *)(*(void *)v1 + 72);
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_100016DCC, 0, 0);
}

uint64_t sub_100016DCC()
{
  sub_100008AAC(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 96);
  return v1(v2);
}

uint64_t sub_100016E3C()
{
  uint64_t v1 = sub_100022BE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  uint64_t v7 = &v21[-v6];
  uint64_t v8 = sub_100023470();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  __n128 v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v14 = &v21[-v13];
  id v15 = [*(id *)(v0 + 24) editionKind];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = sub_100023490();

    return v17;
  }
  else
  {
    sub_100023160();
    sub_100023460();
    sub_100022BD0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16))(v12, v14, v8);
    type metadata accessor for BundleFinder();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    [self bundleForClass:ObjCClassFromMetadata];
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v2 + 16))(v5, v7, v1);
    uint64_t v20 = sub_1000234B0();
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v14, v8);
    return v20;
  }
}

uint64_t sub_1000171AC()
{
  uint64_t v18 = sub_100023390();
  uint64_t v0 = *(void *)(v18 - 8);
  uint64_t v1 = __chkstk_darwin(v18);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v17 - v4;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = 0;
  uint64_t v8 = self;
  NSString v9 = sub_100023480();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v7;
  *(void *)(v10 + 24) = v6;
  aBlock[4] = sub_1000189D8;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000AF5C;
  aBlock[3] = &unk_100031C38;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  __n128 v12 = v6;
  swift_release();
  [v8 fetchIsAssetID:v9 inFinishedCollectionWithCompletion:v11];
  _Block_release(v11);

  sub_100023380();
  sub_1000233A0();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v0 + 8);
  uint64_t v14 = v18;
  v13(v3, v18);
  sub_100023630();

  v13(v5, v14);
  swift_beginAccess();
  uint64_t v15 = *(unsigned __int8 *)(v7 + 16);
  swift_release();
  return v15;
}

uint64_t sub_100017410()
{
  uint64_t v0 = sub_100022BE0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000231B0();
  if (v5)
  {
    sub_100022BD0();
    v6.super.Class isa = sub_100022BC0().super.isa;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    NSString v7 = sub_100023480();
    swift_bridgeObjectRelease();
    id v8 = [(objc_class *)v6.super.isa displayNameForKey:NSLocaleLanguageCode value:v7];

    if (v8)
    {
      uint64_t v4 = sub_100023490();
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

uint64_t sub_100017580@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v2 = sub_100022C00();
  uint64_t v30 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100022C20();
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  __chkstk_darwin(v5);
  NSString v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000084A8(&qword_1000394A0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100022BB0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v27 - v16;
  id v18 = [*(id *)(v1 + 24) releaseDate];
  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_5;
  }
  uint64_t v19 = v18;
  uint64_t v27 = v2;
  sub_100022BA0();

  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v20(v10, v15, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
LABEL_5:
    sub_100010560((uint64_t)v10, &qword_1000394A0);
    goto LABEL_6;
  }
  v20(v17, v10, v11);
  sub_100022BF0();
  uint64_t v21 = v30;
  uint64_t v22 = v27;
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v4, enum case for Calendar.Component.year(_:), v27);
  uint64_t v23 = sub_100022C10();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v22);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v29);
  uint64_t v32 = v23;
  sub_1000237C0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
LABEL_6:
  sub_100023180();
  uint64_t v24 = v31;
  sub_100022FF0();
  uint64_t v25 = sub_100023000();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 0, 1, v25);
}

uint64_t sub_10001799C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000084A8(&qword_100038D08);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v25 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - v10;
  uint64_t v12 = *(void **)(v1 + 24);
  if (sub_100023160())
  {
    id v13 = [v12 bookSampleDownloadURL];
    if (v13)
    {
      uint64_t v14 = v13;
      sub_100022B80();

      uint64_t v15 = sub_100022B90();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 0, 1, v15);
    }
    else
    {
      uint64_t v19 = sub_100022B90();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
    }
  }
  else
  {
    id v16 = [v12 previewURL];
    if (v16)
    {
      uint64_t v17 = v16;
      sub_100022B80();

      uint64_t v18 = sub_100022B90();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 0, 1, v18);
    }
    else
    {
      uint64_t v20 = sub_100022B90();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 1, 1, v20);
    }
    uint64_t v9 = v6;
  }
  sub_100018920((uint64_t)v9, (uint64_t)v11);
  uint64_t v21 = sub_100022B90();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v11, 1, v21) == 1)
  {
    sub_100010560((uint64_t)v11, &qword_100038D08);
    uint64_t v23 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(a1, v11, v21);
    uint64_t v23 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56))(a1, v23, 1, v21);
}

uint64_t sub_100017C68()
{
  uint64_t result = sub_100023190();
  if (result)
  {
    if (*(void *)(result + 16))
    {
      uint64_t v1 = *(void *)(result + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      strcpy((char *)v4, "versionString");
      HIWORD(v4[1]) = -4864;
      sub_1000236D0();
      if (*(void *)(v1 + 16) && (unint64_t v2 = sub_10001E828((uint64_t)v5), (v3 & 1) != 0))
      {
        sub_10000E4DC(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v6);
      }
      else
      {
        long long v6 = 0u;
        long long v7 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_1000188CC((uint64_t)v5);
      if (*((void *)&v7 + 1))
      {
        if (swift_dynamicCast()) {
          return v4[0];
        }
      }
      else
      {
        sub_100010560((uint64_t)&v6, &qword_100038D00);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  return result;
}

uint64_t sub_100017D94()
{
  swift_unknownObjectRelease();

  sub_100008AAC(v0 + 32);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100017DEC()
{
  sub_100017D94();

  return _swift_deallocClassInstance(v0, 144, 7);
}

uint64_t type metadata accessor for PPXContextAssetInfo()
{
  return self;
}

uint64_t sub_100017E44()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100017E78()
{
  if (sub_100023160()) {
    return 2;
  }
  else {
    return 3;
  }
}

uint64_t sub_100017EAC()
{
  return sub_1000168B4();
}

uint64_t sub_100017ED0(uint64_t a1, uint64_t a2)
{
  return sub_100018820(a1, a2, (uint64_t (*)(void))&MAsset.artistName.getter);
}

uint64_t sub_100017EE8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100017F78;
  return sub_100016A80();
}

uint64_t sub_100017F78(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

void *sub_100018074()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 88);
  id v2 = v1;
  return v1;
}

uint64_t sub_1000180A0()
{
  return sub_100016E3C();
}

uint64_t sub_1000180C4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000180F8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100018104(uint64_t a1, uint64_t a2)
{
  return sub_1000184EC(a1, a2, (SEL *)&selRef_genreName);
}

uint64_t sub_100018110()
{
  return 2;
}

BOOL sub_100018118()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 16);
  sub_100023200();
  NSString v2 = sub_100023480();
  swift_bridgeObjectRelease();
  id v3 = [v1 itemStateWithIdentifier:v2];

  id v4 = [v3 download];
  swift_unknownObjectRelease();
  return v4 == (id)1;
}

id sub_1000181A4()
{
  return [*(id *)(*(void *)v0 + 24) isExplicit];
}

id sub_1000181CC()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 16);
  sub_100023200();
  NSString v2 = sub_100023480();
  swift_bridgeObjectRelease();
  id v3 = [v1 itemStateWithIdentifier:v2];

  id v4 = [v3 wantToRead];
  swift_unknownObjectRelease();
  return v4;
}

BOOL sub_100018254()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 16);
  sub_100023200();
  NSString v2 = sub_100023480();
  swift_bridgeObjectRelease();
  id v3 = [v1 itemStateWithIdentifier:v2];

  id v4 = [v3 download];
  swift_unknownObjectRelease();
  return v4 == (id)2;
}

uint64_t sub_1000182E0()
{
  return *(unsigned __int8 *)(*(void *)v0 + 120);
}

uint64_t sub_1000182EC()
{
  return sub_1000171AC();
}

BOOL sub_100018310()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 16);
  sub_100023200();
  NSString v2 = sub_100023480();
  swift_bridgeObjectRelease();
  id v3 = [v1 itemStateWithIdentifier:v2];

  id v4 = [v3 library];
  swift_unknownObjectRelease();
  return v4 == (id)4;
}

uint64_t sub_10001839C()
{
  return 0;
}

uint64_t sub_1000183A4()
{
  return sub_100017410();
}

uint64_t sub_1000183C8()
{
  id v1 = [*(id *)(*(void *)v0 + 24) offer];
  if (!v1) {
    return 0;
  }
  NSString v2 = v1;
  uint64_t v3 = sub_100023450();

  return v3;
}

uint64_t sub_10001843C()
{
  return sub_1000231D0();
}

uint64_t sub_100018464()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100018498@<X0>(uint64_t a1@<X8>)
{
  return sub_100017580(a1);
}

uint64_t sub_1000184BC@<X0>(uint64_t a1@<X8>)
{
  return sub_10001799C(a1);
}

uint64_t sub_1000184E0(uint64_t a1, uint64_t a2)
{
  return sub_1000184EC(a1, a2, (SEL *)&selRef_seriesName);
}

uint64_t sub_1000184EC(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4 = [*(id *)(*(void *)v3 + 24) *a3];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_100023490();

  return v6;
}

uint64_t sub_100018554()
{
  uint64_t v0 = sub_100022B90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000231A0();
  uint64_t v4 = sub_100022B60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_10001863C()
{
  return swift_bridgeObjectRelease();
}

void (*sub_100018644(uint64_t *a1))(uint64_t a1)
{
  uint64_t v2 = sub_100022B90();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = malloc(*(void *)(v3 + 64));
  a1[2] = (uint64_t)v4;
  sub_1000231A0();
  uint64_t v5 = sub_100022B60();
  uint64_t v7 = v6;
  (*(void (**)(void *, uint64_t))(v3 + 8))(v4, v2);
  *a1 = v5;
  a1[1] = v7;
  return sub_100018728;
}

void sub_100018728(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t sub_100018760()
{
  return sub_1000231F0();
}

uint64_t sub_100018788()
{
  return sub_100023170();
}

id sub_1000187B0()
{
  return [*(id *)(*(void *)v0 + 24) supportsUnifiedProductPage];
}

uint64_t sub_1000187D8()
{
  [*(id *)(*(void *)v0 + 24) hasSupplementalContent];
  return 0;
}

uint64_t sub_100018808(uint64_t a1, uint64_t a2)
{
  return sub_100018820(a1, a2, (uint64_t (*)(void))&MAsset.name.getter);
}

uint64_t sub_100018820(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_10001884C()
{
  return sub_100017C68();
}

uint64_t sub_100018870()
{
  return sub_1000188BC(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

uint64_t sub_1000188A8()
{
  return 0;
}

uint64_t sub_1000188B0()
{
  return static ContentInfoUtilities.assetInfo(storeAsset:)(*(void *)(*(void *)v0 + 24));
}

uint64_t sub_1000188BC(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_1000188CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100018920(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000084A8(&qword_100038D08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018988()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100018998()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_1000189D8(char a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_beginAccess();
  *(unsigned char *)(v3 + 16) = a1;
  return sub_100023640();
}

uint64_t sub_100018A28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100018A38()
{
  return swift_release();
}

uint64_t sub_100018A40(uint64_t a1)
{
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for PPXContextMenuPresentationContext(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PPXContextMenuPresentationContext(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();

  return swift_release();
}

uint64_t initializeWithCopy for PPXContextMenuPresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakCopyInit();
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(v4 + 8) = v5;
  *(void *)(v4 + 16) = v6;
  id v7 = v5;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PPXContextMenuPresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakCopyAssign();
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;
  id v7 = v5;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for PPXContextMenuPresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakTakeInit();
  __n128 result = *(__n128 *)(a2 + 8);
  *(__n128 *)(v3 + 8) = result;
  return result;
}

uint64_t assignWithTake for PPXContextMenuPresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakTakeAssign();
  uint64_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = *(void *)(a2 + 8);

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PPXContextMenuPresentationContext(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PPXContextMenuPresentationContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PPXContextMenuPresentationContext()
{
  return &type metadata for PPXContextMenuPresentationContext;
}

uint64_t sub_100018CB8()
{
  return swift_unknownObjectWeakLoadStrong();
}

id sub_100018CC0()
{
  return *(id *)(v0 + 8);
}

uint64_t sub_100018CC8()
{
  return swift_retain();
}

void sub_100018CD0(uint64_t a1, char a2)
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = Strong;
    [Strong presentViewController:a1 animated:a2 & 1 completion:0];
  }
}

unint64_t sub_100018D50(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000084A8(&qword_100038C08);
  uint64_t v2 = sub_1000237A0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10002228C(v6, (uint64_t)v15, &qword_1000395B0);
    unint64_t result = sub_10001E828((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10000E538(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    long long v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100018E94(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000084A8(&qword_1000395A0);
  uint64_t v2 = sub_1000237A0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10002228C(v6, (uint64_t)&v15, &qword_1000395A8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001E7B0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_1000105BC((uint64_t)&v17, v3[7] + 32 * result, &qword_100038D00);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    long long v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100018FE0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000084A8(&qword_100039590);
  uint64_t v2 = sub_1000237A0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10002228C(v6, (uint64_t)&v15, &qword_100039598);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001E7B0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000E538(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    long long v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100019118(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000084A8(&qword_100039500);
  uint64_t v2 = (void *)sub_1000237A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10001E7B0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001922C()
{
  uint64_t v0 = sub_100023250();
  sub_10002256C(v0, qword_1000394B0);
  sub_100021D90(v0, (uint64_t)qword_1000394B0);
  return sub_100023240();
}

id PPXContextMenuProvider.getInstance()()
{
  return v0;
}

void *PPXContextMenuProvider.menuElements(for:with:)(void *a1, void *a2)
{
  return sub_1000192CC(a2, a1);
}

void *sub_1000192CC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000084A8(&qword_1000394D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PPXContextActionData();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  BOOL v12 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a1;
  id v14 = (id)BSUIGetLibraryItemStateProvider();
  uint64_t v81 = sub_100022EC0();
  v82 = &protocol witness table for MenuCoverImageProvider;
  sub_100010628((uint64_t *)&v80);
  sub_100022EB0();
  sub_100011974(v13, (uint64_t)v14, (uint64_t)&v80, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100010560((uint64_t)v8, &qword_1000394D0);
    if (qword_100038470 != -1) {
LABEL_46:
    }
      swift_once();
    uint64_t v15 = sub_100023250();
    sub_100021D90(v15, (uint64_t)qword_1000394B0);
    uint64_t v16 = sub_100023230();
    os_log_type_t v17 = sub_1000235D0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Unable to instantiate PPXContextActionData", v18, 2u);
      swift_slowDealloc();
    }

    return &_swiftEmptyArrayStorage;
  }
  sub_100011FE4((uint64_t)v8, (uint64_t)v12);
  uint64_t v20 = *(void *)(v3 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_objectGraph);
  swift_unknownObjectWeakInit();
  id v86 = v13;
  uint64_t v87 = v20;
  id v21 = v13;
  swift_retain();
  v76 = a2;
  id v22 = [a2 ba_analyticsTracker];
  uint64_t v23 = *(void *)(v3 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_actionItems);
  uint64_t v24 = __chkstk_darwin(v22);
  *(&v72 - 4) = (uint64_t)v12;
  *(&v72 - 3) = (uint64_t)v85;
  *(&v72 - 2) = v24;
  *(&v72 - 1) = v3;
  swift_bridgeObjectRetain();
  uint64_t v25 = 0;
  v77 = sub_10001A0B8((void (*)(long long *__return_ptr, long long *))sub_1000225D0, (uint64_t)(&v72 - 6), v23);
  swift_bridgeObjectRelease();
  sub_1000226CC(&qword_100039608, (void (*)(uint64_t))type metadata accessor for PPXContextActionData);
  sub_100022FD0();
  if (v83 == 1)
  {
    id v74 = v22;
    uint64_t v75 = v3;
    sub_1000093C8((uint64_t)&v80);
  }
  else
  {
    sub_10000936C(&v80, (uint64_t)v84);
    sub_100009384(v84, v84[3]);
    if (sub_100022F10())
    {
      unsigned __int8 v26 = objc_msgSend(objc_msgSend(self, "sharedInstance"), "isExplicitContentAllowed");
      swift_unknownObjectRelease();
      if ((v26 & 1) == 0)
      {

        swift_bridgeObjectRelease();
        sub_10002261C((uint64_t)v85);
        sub_100011F30((uint64_t)v12);
        sub_100008AAC((uint64_t)v84);
        return &_swiftEmptyArrayStorage;
      }
    }
    id v74 = v22;
    uint64_t v75 = v3;
    sub_100008AAC((uint64_t)v84);
  }
  v84[0] = &_swiftEmptyArrayStorage;
  v79 = &_swiftEmptyDictionarySingleton;
  uint64_t v27 = *((void *)v77 + 2);
  if (v27)
  {
    uint64_t v72 = 0;
    v73 = v12;
    uint64_t v28 = (uint64_t)(v77 + 32);
    while (1)
    {
      sub_10000941C(v28, (uint64_t)&v80);
      sub_100009384(&v80, v81);
      uint64_t v30 = (void *)sub_100022D10();
      if (!v30) {
        goto LABEL_16;
      }
      id v31 = v30;
      sub_100023510();
      if (*(void *)((v84[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100023550();
      }
      sub_100023560();
      sub_100023540();
      id v32 = [v31 identifier];
      uint64_t v33 = sub_100023490();
      uint64_t v35 = v34;

      id v36 = v31;
      uint64_t v37 = v79;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v78 = v37;
      v79 = (void *)0x8000000000000000;
      unint64_t v40 = sub_10001E7B0(v33, v35);
      uint64_t v41 = v37[2];
      BOOL v42 = (v39 & 1) == 0;
      uint64_t v43 = v41 + v42;
      if (__OFADD__(v41, v42))
      {
        __break(1u);
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
      char v44 = v39;
      if (v37[3] >= v43)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v47 = v78;
          if ((v39 & 1) == 0) {
            goto LABEL_27;
          }
        }
        else
        {
          sub_1000203F4();
          uint64_t v47 = v78;
          if ((v44 & 1) == 0) {
            goto LABEL_27;
          }
        }
      }
      else
      {
        sub_10001F024(v43, isUniquelyReferenced_nonNull_native);
        unint64_t v45 = sub_10001E7B0(v33, v35);
        if ((v44 & 1) != (v46 & 1))
        {
          sub_100023800();
          __break(1u);
          goto LABEL_48;
        }
        unint64_t v40 = v45;
        uint64_t v47 = v78;
        if ((v44 & 1) == 0)
        {
LABEL_27:
          v47[(v40 >> 6) + 8] |= 1 << v40;
          uint64_t v48 = (uint64_t *)(v47[6] + 16 * v40);
          *uint64_t v48 = v33;
          v48[1] = v35;
          *(void *)(v47[7] + 8 * v40) = v36;
          uint64_t v49 = v47[2];
          BOOL v50 = __OFADD__(v49, 1);
          uint64_t v51 = v49 + 1;
          if (v50) {
            goto LABEL_45;
          }
          v47[2] = v51;
          swift_bridgeObjectRetain();
          goto LABEL_15;
        }
      }
      uint64_t v29 = v47[7];

      *(void *)(v29 + 8 * v40) = v36;
LABEL_15:
      v79 = v47;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_16:
      sub_100008AAC((uint64_t)&v80);
      v28 += 40;
      if (!--v27)
      {
        swift_bridgeObjectRelease();
        BOOL v12 = v73;
        uint64_t v25 = v72;
        goto LABEL_33;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_33:
  uint64_t v52 = sub_10001B314();
  uint64_t v54 = sub_100021348(v52, v53);
  swift_bridgeObjectRelease();
  uint64_t v55 = swift_bridgeObjectRetain();
  sub_10001A258(v55);
  swift_bridgeObjectRelease();
  uint64_t v56 = sub_100022DA0();
  uint64_t v57 = swift_bridgeObjectRelease();
  __chkstk_darwin(v57);
  *(&v72 - 2) = (uint64_t)v12;
  *(&v72 - 1) = (uint64_t)&v79;
  long long v58 = sub_10001A454((void (*)(uint64_t *__return_ptr, uint64_t))sub_1000225F0, (uint64_t)(&v72 - 4), v56);
  uint64_t v59 = swift_bridgeObjectRelease();
  v78 = 0;
  id v60 = &_swiftEmptyArrayStorage;
  *(void *)&long long v80 = &_swiftEmptyArrayStorage;
  uint64_t v61 = *((void *)v58 + 2);
  v63 = v74;
  uint64_t v62 = v75;
  if (v61)
  {
    swift_bridgeObjectRetain();
    uint64_t v64 = 48;
    do
    {
      unint64_t v65 = swift_bridgeObjectRetain();
      sub_10001FB7C(v65);
      v64 += 24;
      --v61;
    }
    while (v61);
    uint64_t v59 = swift_bridgeObjectRelease();
    id v60 = (void *)v80;
  }
  __chkstk_darwin(v59);
  *(&v72 - 2) = v54;
  *(&v72 - 1) = (uint64_t)&v78;
  v66 = sub_100021884((unint64_t)v60, (uint64_t (*)(uint64_t, id))sub_10002260C);
  swift_bridgeObjectRelease();
  if (*((void *)v66 + 2))
  {
    sub_1000084A8(&qword_100039500);
    v67 = (void *)sub_1000237A0();
  }
  else
  {
    v67 = &_swiftEmptyDictionarySingleton;
  }
  *(void *)&long long v80 = v67;
  v68 = (void *)swift_bridgeObjectRetain();
  sub_10001FEC4(v68, 1, &v80);
  if (!v25)
  {
    swift_bridgeObjectRelease();
    uint64_t v69 = v62 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider;
    swift_beginAccess();
    sub_100021DE8(v69, *(void *)(v69 + 24));
    sub_100022CB0();
    uint64_t v70 = swift_endAccess();
    __chkstk_darwin(v70);
    *(&v72 - 2) = v54;
    uint64_t v19 = sub_100021A28((uint64_t)v58, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100022614);

    swift_bridgeObjectRelease();
    sub_10002261C((uint64_t)v85);
    sub_100011F30((uint64_t)v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v19;
  }
LABEL_48:
  unint64_t result = (void *)swift_unexpectedError();
  __break(1u);
  return result;
}

char *sub_100019CF8(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000084A8(&qword_1000394D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PPXContextActionData();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  BOOL v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a1;
  id v14 = (id)BSUIGetLibraryItemStateProvider();
  uint64_t v26 = sub_100022EC0();
  uint64_t v27 = &protocol witness table for MenuCoverImageProvider;
  sub_100010628((uint64_t *)&v25);
  sub_100022EB0();
  sub_100011974(v13, (uint64_t)v14, (uint64_t)&v25, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100010560((uint64_t)v8, &qword_1000394D0);
    if (qword_100038470 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_100023250();
    sub_100021D90(v15, (uint64_t)qword_1000394B0);
    uint64_t v16 = sub_100023230();
    os_log_type_t v17 = sub_1000235D0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Unable to instantiate ContextActionData", v18, 2u);
      swift_slowDealloc();
    }

    return (char *)&_swiftEmptyArrayStorage;
  }
  sub_100011FE4((uint64_t)v8, (uint64_t)v12);
  sub_1000226CC(&qword_100039608, (void (*)(uint64_t))type metadata accessor for PPXContextActionData);
  sub_100022FD0();
  if (v28 == 1)
  {
    uint64_t v20 = sub_1000093C8((uint64_t)&v25);
LABEL_13:
    uint64_t v22 = *(void *)(v3 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_actionItems);
    __chkstk_darwin(v20);
    *(&v24 - 4) = (uint64_t)v12;
    *(&v24 - 3) = a2;
    *(&v24 - 2) = (uint64_t)v13;
    *(&v24 - 1) = v3;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_10001A0B8((void (*)(long long *__return_ptr, long long *))sub_10002244C, (uint64_t)(&v24 - 6), v22);
    swift_bridgeObjectRelease();
    sub_100011F30((uint64_t)v12);
    return v19;
  }
  sub_10000936C(&v25, (uint64_t)v29);
  sub_100009384(v29, v29[3]);
  if ((sub_100022F10() & 1) == 0
    || (unsigned __int8 v21 = objc_msgSend(objc_msgSend(self, "sharedInstance"), "isExplicitContentAllowed"), swift_unknownObjectRelease(), (v21 & 1) != 0))
  {
    uint64_t v20 = sub_100008AAC((uint64_t)v29);
    goto LABEL_13;
  }
  sub_100011F30((uint64_t)v12);
  sub_100008AAC((uint64_t)v29);
  return (char *)&_swiftEmptyArrayStorage;
}

char *sub_10001A0B8(void (*a1)(long long *__return_ptr, long long *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    long long v15 = *(_OWORD *)(a3 + 16 * v7 + 32);
    a1(&v12, &v15);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    if (v13)
    {
      sub_10000936C(&v12, (uint64_t)v14);
      sub_10000936C(v14, (uint64_t)&v12);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_10001E410(0, *((void *)v8 + 2) + 1, 1, v8, &qword_1000395E0, &qword_1000395D8);
      }
      unint64_t v10 = *((void *)v8 + 2);
      unint64_t v9 = *((void *)v8 + 3);
      if (v10 >= v9 >> 1) {
        uint64_t v8 = sub_10001E410((char *)(v9 > 1), v10 + 1, 1, v8, &qword_1000395E0, &qword_1000395D8);
      }
      *((void *)v8 + 2) = v10 + 1;
      sub_10000936C(&v12, (uint64_t)&v8[40 * v10 + 32]);
    }
    else
    {
      sub_100010560((uint64_t)&v12, &qword_1000395F8);
    }
    ++v7;
  }
  while (v4 != v7);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10001A258(uint64_t a1)
{
  uint64_t v20 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  for (unint64_t i = v9 | (v7 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v7 << 6))
  {
    id v14 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    swift_bridgeObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_10001E300(0, *((void *)v8 + 2) + 1, 1, v8);
      uint64_t v8 = (char *)result;
    }
    unint64_t v18 = *((void *)v8 + 2);
    unint64_t v17 = *((void *)v8 + 3);
    if (v18 >= v17 >> 1)
    {
      uint64_t result = (uint64_t)sub_10001E300((char *)(v17 > 1), v18 + 1, 1, v8);
      uint64_t v8 = (char *)result;
    }
    *((void *)v8 + 2) = v18 + 1;
    uint64_t v19 = &v8[16 * v18];
    *((void *)v19 + 4) = v15;
    *((void *)v19 + 5) = v16;
    if (v4) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v11 >= v5) {
      goto LABEL_27;
    }
    unint64_t v12 = *(void *)(v20 + 8 * v11);
    ++v7;
    if (!v12)
    {
      int64_t v7 = v11 + 1;
      if (v11 + 1 >= v5) {
        goto LABEL_27;
      }
      unint64_t v12 = *(void *)(v20 + 8 * v7);
      if (!v12)
      {
        int64_t v7 = v11 + 2;
        if (v11 + 2 >= v5) {
          goto LABEL_27;
        }
        unint64_t v12 = *(void *)(v20 + 8 * v7);
        if (!v12)
        {
          int64_t v7 = v11 + 3;
          if (v11 + 3 >= v5) {
            goto LABEL_27;
          }
          unint64_t v12 = *(void *)(v20 + 8 * v7);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v4 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v5)
  {
LABEL_27:
    swift_release();
    return (uint64_t)v8;
  }
  unint64_t v12 = *(void *)(v20 + 8 * v13);
  if (v12)
  {
    int64_t v7 = v13;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v7 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_27;
    }
    unint64_t v12 = *(void *)(v20 + 8 * v7);
    ++v13;
    if (v12) {
      goto LABEL_20;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

char *sub_10001A454(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  void (*v20)(uint64_t *__return_ptr, uint64_t);

  uint64_t v20 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v6 = *(void *)(sub_1000084A8(&qword_1000395E8) - 8);
  uint64_t v7 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v8 = *(void *)(v6 + 72);
  swift_bridgeObjectRetain();
  unint64_t v9 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    v20(&v18, v7);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9;
    }
    if ((void)v19)
    {
      long long v17 = v19;
      uint64_t v11 = v18;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v9 = sub_10001E1D8(0, *((void *)v9 + 2) + 1, 1, v9);
      }
      unint64_t v13 = *((void *)v9 + 2);
      unint64_t v12 = *((void *)v9 + 3);
      long long v14 = v17;
      if (v13 >= v12 >> 1)
      {
        uint64_t v15 = sub_10001E1D8((char *)(v12 > 1), v13 + 1, 1, v9);
        long long v14 = v17;
        unint64_t v9 = v15;
      }
      *((void *)v9 + 2) = v13 + 1;
      unint64_t v10 = &v9[24 * v13];
      *((void *)v10 + 4) = v11;
      *(_OWORD *)(v10 + 40) = v14;
    }
    v7 += v8;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  return v9;
}

void *sub_10001A608(uint64_t a1, uint64_t *a2)
{
  uint64_t result = &_swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v6 = *(void *)(sub_100022DF0() - 8);
    uint64_t v7 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v8 = *(void *)(v6 + 72);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v9 = sub_100022DD0();
      uint64_t v11 = *a2;
      if (*(void *)(*a2 + 16) && (unint64_t v12 = sub_10001E7B0(v9, v10), (v13 & 1) != 0))
      {
        id v14 = *(id *)(*(void *)(v11 + 56) + 8 * v12);
        swift_bridgeObjectRelease();
        sub_100023510();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100023550();
        }
        sub_100023560();
        sub_100023540();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v7 += v8;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10001A77C(uint64_t a1)
{
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v20 = (unint64_t)(v2 + 63) >> 6;
  char v28 = v26;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v6 = 0;
  uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  for (unint64_t i = v8 | (v6 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v6 << 6))
  {
    char v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    sub_10000941C(*(void *)(a1 + 56) + 40 * i, (uint64_t)v28);
    *(void *)&long long v25 = v14;
    *((void *)&v25 + 1) = v15;
    long long v22 = v25;
    v23[0] = v26[0];
    v23[1] = v26[1];
    uint64_t v24 = v27;
    long long v16 = v25;
    sub_10000941C((uint64_t)v23, (uint64_t)v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100008AAC((uint64_t)v21);
    sub_100010560((uint64_t)&v22, &qword_100039600);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_10001E300(0, *((void *)v7 + 2) + 1, 1, v7);
      uint64_t v7 = (char *)result;
    }
    unint64_t v18 = *((void *)v7 + 2);
    unint64_t v17 = *((void *)v7 + 3);
    if (v18 >= v17 >> 1)
    {
      uint64_t result = (uint64_t)sub_10001E300((char *)(v17 > 1), v18 + 1, 1, v7);
      uint64_t v7 = (char *)result;
    }
    *((void *)v7 + 2) = v18 + 1;
    *(_OWORD *)&v7[16 * v18 + 32] = v16;
    if (v4) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v10 >= v20) {
      goto LABEL_27;
    }
    unint64_t v11 = *(void *)(v19 + 8 * v10);
    ++v6;
    if (!v11)
    {
      int64_t v6 = v10 + 1;
      if (v10 + 1 >= v20) {
        goto LABEL_27;
      }
      unint64_t v11 = *(void *)(v19 + 8 * v6);
      if (!v11)
      {
        int64_t v6 = v10 + 2;
        if (v10 + 2 >= v20) {
          goto LABEL_27;
        }
        unint64_t v11 = *(void *)(v19 + 8 * v6);
        if (!v11)
        {
          int64_t v6 = v10 + 3;
          if (v10 + 3 >= v20) {
            goto LABEL_27;
          }
          unint64_t v11 = *(void *)(v19 + 8 * v6);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v4 = (v11 - 1) & v11;
  }
  int64_t v12 = v10 + 4;
  if (v12 >= v20)
  {
LABEL_27:
    swift_release();
    return (uint64_t)v7;
  }
  unint64_t v11 = *(void *)(v19 + 8 * v12);
  if (v11)
  {
    int64_t v6 = v12;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v6 >= v20) {
      goto LABEL_27;
    }
    unint64_t v11 = *(void *)(v19 + 8 * v6);
    ++v12;
    if (v11) {
      goto LABEL_20;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_10001AA18(uint64_t a1, uint64_t *a2)
{
  uint64_t v47 = a2;
  uint64_t v46 = sub_1000084A8(&qword_1000395E8);
  uint64_t v4 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  unint64_t v45 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000084A8(&qword_1000394F8);
  uint64_t v43 = *(void *)(v6 - 8);
  uint64_t v44 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v41 = (char *)&v35 - v11;
  __chkstk_darwin(v10);
  uint64_t v42 = (uint64_t)&v35 - v12;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v49 = v2;
  uint64_t v14 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v40 = *(void *)(v4 + 72);
  uint64_t v39 = sub_100022DC0();
  uint64_t v15 = *(void *)(v39 - 8);
  long long v16 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v37 = v15 + 16;
  uint64_t v38 = v16;
  uint64_t v35 = a1;
  id v36 = (void (**)(char *, char *, uint64_t))(v15 + 32);
  swift_bridgeObjectRetain();
  unint64_t v17 = &_swiftEmptyArrayStorage;
  uint64_t v18 = v39;
  do
  {
    uint64_t v48 = v13;
    uint64_t v19 = *(int *)(v44 + 48);
    uint64_t v20 = *(int *)(v46 + 48);
    uint64_t v21 = (uint64_t)v9;
    long long v22 = v45;
    v38(v45, v14, v18);
    uint64_t v23 = *(void *)(v14 + v20);
    unint64_t v24 = (unint64_t)v17;
    long long v25 = v41;
    uint64_t v26 = v22;
    uint64_t v9 = (char *)v21;
    (*v36)(v41, v26, v18);
    uint64_t v27 = v49;
    char v28 = sub_10001AFBC(v23, v47);
    uint64_t v49 = v27;
    *(void *)&v25[v19] = v28;
    uint64_t v29 = (uint64_t)v25;
    unint64_t v17 = (void *)v24;
    uint64_t v30 = v42;
    sub_1000105BC(v29, v42, &qword_1000394F8);
    sub_1000105BC(v30, v21, &qword_1000394F8);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v17 = (void *)sub_10001E540(0, *(void *)(v24 + 16) + 1, 1, v24);
    }
    unint64_t v32 = v17[2];
    unint64_t v31 = v17[3];
    uint64_t v33 = v48;
    if (v32 >= v31 >> 1) {
      unint64_t v17 = (void *)sub_10001E540(v31 > 1, v32 + 1, 1, (unint64_t)v17);
    }
    long long v17[2] = v32 + 1;
    sub_1000105BC(v21, (uint64_t)v17+ ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80))+ *(void *)(v43 + 72) * v32, &qword_1000394F8);
    v14 += v40;
    uint64_t v13 = v33 - 1;
  }
  while (v13);
  swift_bridgeObjectRelease();
  return v17;
}

char *sub_10001AD80(uint64_t a1)
{
  uint64_t v20 = sub_100022DF0();
  uint64_t v2 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v19 = v5;
  uint64_t v16 = a1;
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a1 + 32;
    unint64_t v17 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v18 = (uint64_t)v22 + 8;
    uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      sub_10000941C(v7, (uint64_t)v21 + 8);
      *(void *)&v22[0] = v6;
      sub_10000936C((_OWORD *)((char *)v21 + 8), v18);
      v21[1] = v22[1];
      v21[2] = v23;
      v21[0] = v22[0];
      uint64_t v24 = *(void *)&v22[0];
      sub_100009384((void *)v21 + 1, v23);
      sub_100022CF0();
      uint64_t v9 = sub_100022DD0();
      uint64_t v11 = v10;
      (*v17)(v4, v20);
      sub_100010560((uint64_t)v21, &qword_1000395C8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_10001E0B0(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v13 = *((void *)v8 + 2);
      unint64_t v12 = *((void *)v8 + 3);
      if (v13 >= v12 >> 1) {
        uint64_t v8 = sub_10001E0B0((char *)(v12 > 1), v13 + 1, 1, v8);
      }
      ++v6;
      *((void *)v8 + 2) = v13 + 1;
      uint64_t v14 = &v8[24 * v13];
      *((void *)v14 + 4) = v9;
      *((void *)v14 + 5) = v11;
      *((void *)v14 + 6) = v24;
      v7 += 40;
    }
    while (v19 != v6);
  }
  else
  {
    uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  return v8;
}

char *sub_10001AFBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v5 = *(void *)(sub_100022DF0() - 8);
  uint64_t v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  uint64_t v7 = *(void *)(v5 + 72);
  swift_bridgeObjectRetain();
  uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    uint64_t v9 = sub_100022DD0();
    uint64_t v11 = *a2;
    if (*(void *)(*a2 + 16) && (unint64_t v12 = sub_10001E7B0(v9, v10), (v13 & 1) != 0))
    {
      sub_10000941C(*(void *)(v11 + 56) + 40 * v12, (uint64_t)&v17);
    }
    else
    {
      uint64_t v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v18 + 1))
    {
      sub_10000936C(&v17, (uint64_t)v20);
      sub_10000936C(v20, (uint64_t)&v17);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_10001E410(0, *((void *)v8 + 2) + 1, 1, v8, &qword_1000395E0, &qword_1000395D8);
      }
      unint64_t v15 = *((void *)v8 + 2);
      unint64_t v14 = *((void *)v8 + 3);
      if (v15 >= v14 >> 1) {
        uint64_t v8 = sub_10001E410((char *)(v14 > 1), v15 + 1, 1, v8, &qword_1000395E0, &qword_1000395D8);
      }
      *((void *)v8 + 2) = v15 + 1;
      sub_10000936C(&v17, (uint64_t)&v8[40 * v15 + 32]);
    }
    else
    {
      sub_100010560((uint64_t)&v17, &qword_1000395F8);
    }
    v6 += v7;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10001B1C4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  _OWORD v21[3] = type metadata accessor for PPXContextActionData();
  v21[4] = sub_1000226CC(&qword_100039608, (void (*)(uint64_t))type metadata accessor for PPXContextActionData);
  char v13 = sub_100010628(v21);
  sub_10002246C(a2, (uint64_t)v13);
  uint64_t v19 = &type metadata for PPXContextMenuPresentationContext;
  unint64_t v20 = sub_1000224D0();
  uint64_t v18 = swift_allocObject();
  sub_100022714(a3, v18 + 16);
  uint64_t v14 = a5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider;
  swift_beginAccess();
  sub_10000941C(v14, (uint64_t)&v17);
  a6[3] = v11;
  a6[4] = v12;
  sub_100010628(a6);
  id v15 = a4;
  return sub_100022CE0();
}

uint64_t sub_10001B314()
{
  type metadata accessor for PPXContextActionData();
  sub_1000226CC(&qword_100039608, (void (*)(uint64_t))type metadata accessor for PPXContextActionData);
  sub_100022FD0();
  if (v7 == 1)
  {
    sub_1000093C8((uint64_t)&v5);
    return 0;
  }
  else
  {
    sub_10000936C(&v5, (uint64_t)v8);
    sub_100009384(v8, v8[3]);
    uint64_t v0 = sub_100022F50();
    uint64_t v2 = v1;
    sub_10000941C((uint64_t)v8, (uint64_t)&v5);
    if (!v2)
    {
      sub_100023050();
      uint64_t v3 = (void *)sub_100023040();
      sub_100009384(&v5, v6);
      sub_100022F70();
      uint64_t v0 = sub_100023020();

      swift_bridgeObjectRelease();
    }
    sub_100008AAC((uint64_t)&v5);
    sub_100008AAC((uint64_t)v8);
  }
  return v0;
}

void *sub_10001B460@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v41 = a3;
  uint64_t v42 = a1;
  uint64_t v3 = sub_100022BE0();
  __chkstk_darwin(v3 - 8);
  uint64_t v37 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100023470();
  uint64_t v36 = *(void *)(v38 - 8);
  uint64_t v5 = __chkstk_darwin(v38);
  uint64_t v35 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v9 = sub_100022DC0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000084A8(&qword_1000395E8);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PPXContextActionData();
  char v17 = sub_100022E40();
  uint64_t v18 = *(int *)(v14 + 56);
  uint64_t v19 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, v42, v9);
  uint64_t v20 = *(void *)(v19 + v18);
  uint64_t v39 = v18;
  *(void *)&v16[v18] = v20;
  if (v17)
  {
    uint64_t v34 = v8;
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for ContextActionType.ContextActionGroup.improveSuggestions(_:), v9);
    sub_1000226CC(&qword_100039668, (void (*)(uint64_t))&type metadata accessor for ContextActionType.ContextActionGroup);
    uint64_t v21 = v19;
    swift_bridgeObjectRetain();
    sub_100023500();
    sub_100023500();
    uint64_t v22 = v44;
    uint64_t v23 = v43;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    sub_100010560((uint64_t)v16, &qword_1000395E8);
    BOOL v24 = v22 == v23;
    uint64_t v19 = v21;
    long long v25 = v41;
    uint64_t v27 = v39;
    uint64_t v26 = v40;
    if (v24)
    {
      char v28 = v34;
      sub_100023460();
      uint64_t v29 = v36;
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v35, v28, v38);
      sub_100022BD0();
      uint64_t v31 = sub_1000234A0();
      unint64_t v32 = v30;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v38);
    }
    else
    {
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_100010560((uint64_t)v16, &qword_1000395E8);
    uint64_t v31 = 0;
    unint64_t v32 = 0xE000000000000000;
    long long v25 = v41;
    uint64_t v27 = v39;
    uint64_t v26 = v40;
  }
  uint64_t result = sub_10001A608(*(void *)(v19 + v27), v26);
  uint64_t *v25 = v31;
  v25[1] = v32;
  v25[2] = (uint64_t)result;
  return result;
}

void sub_10001B890(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  uint64_t v28 = a1;
  uint64_t v7 = sub_100022DF0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [a2 identifier];
  uint64_t v12 = sub_100023490();
  uint64_t v14 = v13;

  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for ContextActionType.sharedWithYou(_:), v7);
  uint64_t v15 = (void *)sub_100022DE0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v16 = sub_100023490();
  uint64_t v18 = v17;

  if (v12 == v16 && v14 == v18)
  {
    swift_bridgeObjectRelease_n();
    if (a3) {
      goto LABEL_7;
    }
  }
  else
  {
    char v20 = sub_1000237E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) != 0 && a3)
    {
LABEL_7:
      if (a3 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_100023770();
        swift_bridgeObjectRelease();
        uint64_t v22 = v26 - 1;
        if (!__OFSUB__(v26, 1))
        {
LABEL_9:
          BOOL v23 = __OFADD__(*a4, v22);
          uint64_t v24 = *a4 + v22;
          if (!v23)
          {
            *a4 = v24;
            return;
          }
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v21 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t v22 = v21 - 1;
        if (!__OFSUB__(v21, 1)) {
          goto LABEL_9;
        }
      }
      __break(1u);
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
  }
  id v25 = [a2 identifier];
  sub_100023490();

  if (__OFADD__(v28, *a4)) {
LABEL_18:
  }
    __break(1u);
}

Class sub_10001BAE8(uint64_t a1, void *a2, UIMenuElementSize a3, UIMenuElementSize a4)
{
  uint64_t v8 = sub_100022DF0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (unint64_t)a3 >> 62;
  if (!((unint64_t)a3 >> 62))
  {
    uint64_t v13 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    Class result = (Class)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  Class result = (Class)sub_100023770();
  if (!result) {
    goto LABEL_18;
  }
LABEL_3:
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v15 = (id)sub_100023700();
LABEL_6:
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    id v17 = [v16 identifier];
    uint64_t v18 = sub_100023490();
    uint64_t v20 = v19;

    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for ContextActionType.sharedWithYou(_:), v8);
    uint64_t v21 = (void *)sub_100022DE0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v22 = sub_100023490();
    uint64_t v24 = v23;

    if (v18 == v22 && v20 == v24)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v26 = sub_1000237E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
      {

        a1 = v36;
        a2 = v37;
        if (v12)
        {
LABEL_12:
          sub_100010418(0, &qword_100039638);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v27 = sub_100023760();
          swift_bridgeObjectRelease();
          a3 = v27;
LABEL_20:
          sub_100010418(0, &qword_100039588);
          v41._countAndFlagsBits = a1;
          v41._object = a2;
          v43.value._countAndFlagsBits = 0;
          v43.value._object = 0;
          v39.value.super.Class isa = 0;
          v39.is_nil = 0;
          v34.value = (UIMenuIdentifier)1;
          return (Class)sub_100023650(v41, v43, v39, v34, 0xFFFFFFFFFFFFFFFFLL, a3, v35);
        }
LABEL_19:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1000237F0();
        sub_100010418(0, &qword_100039638);
        goto LABEL_20;
      }
    }
    if (a4)
    {
      sub_100010418(0, &qword_100039588);
      swift_bridgeObjectRetain();
      id v28 = [v16 title];
      uint64_t v29 = sub_100023490();
      uint64_t v31 = v30;

      v38.value.super.Class isa = (Class)[v16 image];
      v40._countAndFlagsBits = v29;
      v40._object = v31;
      v42.value._countAndFlagsBits = 0;
      v42.value._object = 0;
      v38.is_nil = 0;
      v32.value = 0;
      v33.super.super.Class isa = sub_100023650(v40, v42, v38, v32, 0xFFFFFFFFFFFFFFFFLL, a4, v35).super.super.isa;
    }
    else
    {

      return 0;
    }
    return v33.super.super.isa;
  }
  if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v15 = *(id *)(a3 + 32);
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t PPXContextMenuProvider.showShareSheet(with:for:)()
{
  sub_100023590();
  *(void *)(v0 + 16) = sub_100023580();
  uint64_t v2 = sub_100023570();
  return _swift_task_switch(sub_10001BF34, v2, v1);
}

uint64_t sub_10001BF34()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001C118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  void v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_100023590();
  v4[7] = sub_100023580();
  uint64_t v6 = sub_100023570();
  return _swift_task_switch(sub_10001C1B8, v6, v5);
}

uint64_t sub_10001C1B8()
{
  uint64_t v1 = (const void *)v0[4];
  uint64_t v2 = (void *)v0[5];
  uint64_t v4 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_release();
  v0[8] = _Block_copy(v1);
  id v5 = v4;
  id v6 = v3;
  id v7 = v2;
  v0[9] = sub_100023580();
  uint64_t v9 = sub_100023570();
  return _swift_task_switch(sub_10001C278, v9, v8);
}

uint64_t sub_10001C278()
{
  uint64_t v1 = (void (**)(void))v0[8];
  uint64_t v2 = (void *)v0[5];
  uint64_t v4 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_release();

  v1[2](v1);
  _Block_release(v1);
  id v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

id PPXContextMenuProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void PPXContextMenuProvider.init()()
{
}

id PPXContextMenuProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

void *PPXContextMenuProvider.computeSwipeActionItems(with:for:swipeActionType:assetID:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v102 = a4;
  uint64_t v103 = a3;
  uint64_t v100 = sub_100022DF0();
  unint64_t v104 = *(void *)(v100 - 8);
  uint64_t v9 = __chkstk_darwin(v100);
  v88 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v96 = (char *)&v87 - v11;
  uint64_t v12 = sub_1000084A8(&qword_1000394D0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for PPXContextActionData();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = a1;
  id v20 = (id)BSUIGetLibraryItemStateProvider();
  v114[2] = sub_100022EC0();
  v115 = &protocol witness table for MenuCoverImageProvider;
  sub_100010628(&v113);
  sub_100022EB0();
  sub_100011974(v19, (uint64_t)v20, (uint64_t)&v113, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
  {
    uint64_t v26 = sub_100011FE4((uint64_t)v14, (uint64_t)v18);
    uint64_t v27 = *(void *)(v5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_swipeActionItems);
    __chkstk_darwin(v26);
    *(&v87 - 4) = (uint64_t)v18;
    *(&v87 - 3) = a2;
    *(&v87 - 2) = (uint64_t)v19;
    *(&v87 - 1) = v5;
    swift_bridgeObjectRetain();
    id v28 = sub_10001A0B8((void (*)(long long *__return_ptr, long long *))sub_100022770, (uint64_t)(&v87 - 6), v27);
    uint64_t v29 = swift_bridgeObjectRelease();
    __chkstk_darwin(v29);
    *(&v87 - 2) = v103;
    uint64_t v30 = sub_10001D1D8((uint64_t)sub_100021DC8, (uint64_t)(&v87 - 4), (uint64_t)v28);
    uint64_t v31 = (void *)(v5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider);
    unint64_t v32 = *(void *)(v30 + 16);
    v92 = (long long *)&v109;
    uint64_t v93 = v30 + 32;
    uint64_t v91 = (uint64_t)&v110 + 8;
    v101 = (long long *)v114;
    v99 = (void (**)(char *, uint64_t))(v104 + 8);
    uint64_t v94 = v30;
    swift_bridgeObjectRetain();
    unint64_t v33 = 0;
    long long v95 = xmmword_10002B120;
    uint64_t v34 = v102;
    uint64_t v35 = (uint64_t)v18;
    unint64_t v97 = v32;
    v98 = v18;
    while (1)
    {
      if (v33 == v32)
      {
        long long v111 = 0u;
        long long v112 = 0u;
        unint64_t v37 = v32;
        long long v110 = 0u;
      }
      else
      {
        if (v33 >= *(void *)(v94 + 16)) {
          goto LABEL_46;
        }
        unint64_t v37 = v33 + 1;
        UIImage_optional v38 = v92;
        sub_10000941C(v93 + 40 * v33, (uint64_t)v92);
        *(void *)&long long v110 = v33;
        sub_10000936C(v38, v91);
      }
      sub_1000105BC((uint64_t)&v110, (uint64_t)&v113, &qword_1000394E8);
      if (!v115)
      {
        uint64_t v25 = v94;
        swift_bridgeObjectRelease();
        sub_100011F30(v35);
        return (void *)v25;
      }
      uint64_t v103 = v113;
      unint64_t v104 = v37;
      sub_10000936C(v101, (uint64_t)&v110);
      swift_beginAccess();
      sub_100009384(v31, v31[3]);
      swift_bridgeObjectRetain();
      if (!*(void *)(sub_100022CA0() + 16)) {
        break;
      }
      sub_10001E7B0(v34, a5);
      if ((v39 & 1) == 0) {
        break;
      }
      swift_endAccess();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_100021DE8((uint64_t)v31, v31[3]);
      swift_bridgeObjectRetain();
      Swift::String v40 = (void (*)(char *, void))sub_100022C90();
      Swift::String v41 = sub_10001D364(v106, v34, a5);
      if (*v42)
      {
        Swift::String_optional v43 = v42;
        v89 = (void (*)(void *, void))v41;
        v90 = v40;
        sub_100009384(&v110, *((uint64_t *)&v111 + 1));
        uint64_t v44 = v88;
        sub_100022CF0();
        uint64_t v45 = sub_100022DD0();
        uint64_t v47 = v46;
        (*v99)(v44, v100);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v105 = (void *)*v43;
        uint64_t v49 = v105;
        *Swift::String_optional v43 = 0x8000000000000000;
        unint64_t v51 = sub_10001E7B0(v45, v47);
        uint64_t v52 = v49[2];
        BOOL v53 = (v50 & 1) == 0;
        uint64_t v54 = v52 + v53;
        if (__OFADD__(v52, v53)) {
          goto LABEL_48;
        }
        char v55 = v50;
        if (v49[3] >= v54)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            long long v58 = v105;
            if ((v50 & 1) == 0) {
              goto LABEL_40;
            }
          }
          else
          {
            sub_100020244();
            long long v58 = v105;
            if ((v55 & 1) == 0) {
              goto LABEL_40;
            }
          }
        }
        else
        {
          sub_10001ED18(v54, isUniquelyReferenced_nonNull_native);
          unint64_t v56 = sub_10001E7B0(v45, v47);
          if ((v55 & 1) != (v57 & 1)) {
            goto LABEL_51;
          }
          unint64_t v51 = v56;
          long long v58 = v105;
          if ((v55 & 1) == 0)
          {
LABEL_40:
            v58[(v51 >> 6) + 8] |= 1 << v51;
            char v83 = (uint64_t *)(v58[6] + 16 * v51);
            *char v83 = v45;
            v83[1] = v47;
            *(void *)(v58[7] + 8 * v51) = v103;
            uint64_t v84 = v58[2];
            BOOL v81 = __OFADD__(v84, 1);
            uint64_t v85 = v84 + 1;
            if (v81) {
              goto LABEL_49;
            }
            v58[2] = v85;
            swift_bridgeObjectRetain();
LABEL_42:
            *Swift::String_optional v43 = v58;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v89(v106, 0);
            v90(v108, 0);
            swift_endAccess();
            swift_bridgeObjectRelease();
            uint64_t v34 = v102;
LABEL_9:
            unint64_t v32 = v97;
            uint64_t v35 = (uint64_t)v98;
            goto LABEL_10;
          }
        }
        *(void *)(v58[7] + 8 * v51) = v103;
        goto LABEL_42;
      }
      ((void (*)(void *, void))v41)(v106, 0);
      v40(v108, 0);
      swift_endAccess();
      swift_bridgeObjectRelease();
LABEL_10:
      unint64_t v33 = v104;
      sub_100008AAC((uint64_t)&v110);
    }
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRelease();
    sub_1000084A8(&qword_1000394F0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v95;
    sub_100009384(&v110, *((uint64_t *)&v111 + 1));
    swift_bridgeObjectRetain();
    id v60 = v96;
    sub_100022CF0();
    uint64_t v61 = sub_100022DD0();
    uint64_t v63 = v62;
    (*v99)(v60, v100);
    *(void *)(inited + 32) = v61;
    *(void *)(inited + 40) = v63;
    *(void *)(inited + 48) = v103;
    unint64_t v64 = sub_100019118(inited);
    swift_beginAccess();
    sub_100021DE8((uint64_t)v31, v31[3]);
    unint64_t v65 = (void (*)(char *, void))sub_100022C90();
    v67 = v66;
    char v68 = swift_isUniquelyReferenced_nonNull_native();
    v107 = (void *)*v67;
    uint64_t v69 = v107;
    void *v67 = 0x8000000000000000;
    unint64_t v71 = sub_10001E7B0(v34, a5);
    uint64_t v72 = v69[2];
    BOOL v73 = (v70 & 1) == 0;
    uint64_t v74 = v72 + v73;
    if (__OFADD__(v72, v73))
    {
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    char v75 = v70;
    if (v69[3] < v74)
    {
      sub_10001F334(v74, v68);
      unint64_t v76 = sub_10001E7B0(v102, a5);
      if ((v75 & 1) != (v77 & 1))
      {
LABEL_51:
        Class result = (void *)sub_100023800();
        __break(1u);
        return result;
      }
      unint64_t v71 = v76;
      v78 = v107;
      if ((v75 & 1) == 0) {
        goto LABEL_31;
      }
LABEL_7:
      uint64_t v36 = v78[7];
      swift_bridgeObjectRelease();
      *(void *)(v36 + 8 * v71) = v64;
      uint64_t v34 = v102;
LABEL_8:
      void *v67 = v78;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v65(v108, 0);
      swift_endAccess();
      goto LABEL_9;
    }
    if (v68)
    {
      v78 = v107;
      if (v70) {
        goto LABEL_7;
      }
    }
    else
    {
      sub_1000205A8();
      v78 = v107;
      if (v75) {
        goto LABEL_7;
      }
    }
LABEL_31:
    v78[(v71 >> 6) + 8] |= 1 << v71;
    v79 = (void *)(v78[6] + 16 * v71);
    uint64_t v34 = v102;
    void *v79 = v102;
    v79[1] = a5;
    *(void *)(v78[7] + 8 * v71) = v64;
    uint64_t v80 = v78[2];
    BOOL v81 = __OFADD__(v80, 1);
    uint64_t v82 = v80 + 1;
    if (v81) {
      goto LABEL_47;
    }
    v78[2] = v82;
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  sub_100010560((uint64_t)v14, &qword_1000394D0);
  if (qword_100038470 != -1) {
LABEL_50:
  }
    swift_once();
  uint64_t v21 = sub_100023250();
  sub_100021D90(v21, (uint64_t)qword_1000394B0);
  uint64_t v22 = sub_100023230();
  os_log_type_t v23 = sub_1000235D0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Unable to instantiate ContextActionData", v24, 2u);
    swift_slowDealloc();
  }

  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10001CE5C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  _OWORD v21[3] = type metadata accessor for PPXContextActionData();
  v21[4] = sub_1000226CC(&qword_100039608, (void (*)(uint64_t))type metadata accessor for PPXContextActionData);
  uint64_t v13 = sub_100010628(v21);
  sub_10002246C(a2, (uint64_t)v13);
  uint64_t v14 = *(void *)(a5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_objectGraph);
  v20[11] = &type metadata for PPXContextMenuPresentationContext;
  v20[12] = sub_1000224D0();
  uint64_t v15 = swift_allocObject();
  v20[8] = v15;
  swift_unknownObjectWeakInit();
  *(void *)(v15 + 24) = a4;
  *(void *)(v15 + 32) = v14;
  id v16 = a4;
  swift_retain();
  id v17 = [a3 ba_effectiveAnalyticsTracker];
  uint64_t v18 = a5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider;
  swift_beginAccess();
  sub_10000941C(v18, (uint64_t)v20);
  a6[3] = v11;
  a6[4] = v12;
  sub_100010628(a6);
  return sub_100022CE0();
}

uint64_t sub_10001CFDC(void *a1, uint64_t a2)
{
  uint64_t v15 = a2;
  uint64_t v14 = sub_100022D90();
  uint64_t v3 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100022DF0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009384(a1, a1[3]);
  sub_100022CF0();
  sub_100022DB0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  char v10 = sub_100022D80();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v14);
  sub_10000941C((uint64_t)a1, (uint64_t)v16);
  if (v10)
  {
    sub_100009384(v16, v16[3]);
    char v11 = sub_100022CD0();
  }
  else
  {
    char v11 = 0;
  }
  sub_100008AAC((uint64_t)v16);
  return v11 & 1;
}

uint64_t sub_10001D1D8(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (unint64_t *)&_swiftEmptyArrayStorage;
  id v17 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v6 = *(unint64_t **)(a3 + 16);
  if (v6)
  {
    uint64_t v7 = (uint64_t (*)(long long *))result;
    uint64_t v5 = 0;
    uint64_t v8 = a3 + 32;
    uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v13 = *(unint64_t **)(a3 + 16);
    uint64_t v14 = (uint64_t (*)(long long *))result;
    while ((unint64_t)v5 < *(void *)(a3 + 16))
    {
      sub_10000941C(v8, (uint64_t)v16);
      char v10 = v7(v16);
      if (v3)
      {
        sub_100008AAC((uint64_t)v16);
        swift_release();
        swift_bridgeObjectRelease();
        return (uint64_t)v5;
      }
      if (v10)
      {
        sub_10000936C(v16, (uint64_t)v15);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10001F9A4(0, v9[2] + 1, 1);
        }
        uint64_t v9 = v17;
        unint64_t v12 = v17[2];
        unint64_t v11 = v17[3];
        if (v12 >= v11 >> 1)
        {
          sub_10001F9A4(v11 > 1, v12 + 1, 1);
          uint64_t v9 = v17;
        }
        long long v9[2] = v12 + 1;
        Class result = sub_10000936C(v15, (uint64_t)&v9[5 * v12 + 4]);
        uint64_t v6 = v13;
        uint64_t v7 = v14;
      }
      else
      {
        Class result = sub_100008AAC((uint64_t)v16);
      }
      uint64_t v5 = (unint64_t *)((char *)v5 + 1);
      v8 += 40;
      if (v6 == v5)
      {
        uint64_t v5 = v17;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  return result;
}

void (*sub_10001D364(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_100020B24(v6, a2, a3);
  return sub_10001D3E4;
}

void sub_10001D3E4(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t PPXContextMenuProvider.contextMenuActionItems(with:for:)(void *a1, uint64_t a2)
{
  uint64_t v68 = sub_1000084A8(&qword_1000394F8);
  uint64_t v64 = *(void *)(v68 - 8);
  uint64_t v5 = __chkstk_darwin(v68 - 8);
  uint64_t v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v62 - v8;
  uint64_t v67 = sub_100022DF0();
  char v10 = *(unint64_t **)(v67 - 8);
  __chkstk_darwin(v67);
  unint64_t v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = v2;
  uint64_t v13 = sub_100019CF8(a1, a2);
  uint64_t v14 = v13;
  uint64_t v15 = &_swiftEmptyArrayStorage;
  uint64_t v74 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v16 = *((void *)v13 + 2);
  uint64_t v69 = v9;
  v66 = v7;
  if (!v16)
  {
    uint64_t v22 = (unint64_t *)&_swiftEmptyArrayStorage;
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v74 = (unint64_t *)&_swiftEmptyDictionarySingleton;
    unint64_t v23 = v22[2];
    if (!v23)
    {
      swift_release();
LABEL_31:
      uint64_t v45 = swift_bridgeObjectRetain();
      sub_10001A77C(v45);
      swift_bridgeObjectRelease();
      uint64_t v46 = sub_100022DA0();
      swift_bridgeObjectRelease();
      uint64_t v47 = sub_10001AA18(v46, (uint64_t *)&v74);
      swift_bridgeObjectRelease();
      *(void *)&long long v72 = &_swiftEmptyArrayStorage;
      uint64_t v48 = v47[2];
      if (v48)
      {
        uint64_t v49 = (uint64_t)v47
            + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
        char v50 = v7;
        uint64_t v51 = *(void *)(v64 + 72);
        uint64_t v67 = (uint64_t)v47;
        swift_bridgeObjectRetain();
        do
        {
          sub_10002228C(v49, (uint64_t)v9, &qword_1000394F8);
          uint64_t v52 = *(int *)(v68 + 48);
          uint64_t v53 = sub_100022DC0();
          uint64_t v54 = *(void *)(v53 - 8);
          (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v50, v69, v53);
          uint64_t v55 = *(void *)&v69[v52];
          *(void *)&v50[v52] = v55;
          unint64_t v56 = *(void (**)(char *, uint64_t))(v54 + 8);
          swift_bridgeObjectRetain();
          v56(v50, v53);
          uint64_t v9 = v69;
          sub_100010560((uint64_t)v69, &qword_1000394F8);
          sub_10001FD48(v55);
          v49 += v51;
          --v48;
        }
        while (v48);
        uint64_t v47 = (void *)v67;
        swift_bridgeObjectRelease();
        uint64_t v15 = (void *)v72;
      }
      char v57 = sub_10001AD80((uint64_t)v15);
      swift_bridgeObjectRelease();
      if (*((void *)v57 + 2))
      {
        sub_1000084A8(&qword_100039500);
        long long v58 = (void *)sub_1000237A0();
      }
      else
      {
        long long v58 = &_swiftEmptyDictionarySingleton;
      }
      *(void *)&long long v72 = v58;
      uint64_t v59 = (void *)swift_bridgeObjectRetain();
      sub_10001FEC4(v59, 1, &v72);
      swift_bridgeObjectRelease();
      uint64_t v60 = v65 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider;
      swift_beginAccess();
      sub_100021DE8(v60, *(void *)(v60 + 24));
      sub_100022CB0();
      swift_endAccess();
      swift_bridgeObjectRelease();
      return (uint64_t)v47;
    }
    uint64_t v63 = v22;
    uint64_t v24 = (uint64_t)(v22 + 4);
    uint64_t v25 = (void (**)(char *, uint64_t))(v10 + 1);
    while (1)
    {
      sub_10000941C(v24, (uint64_t)&v72);
      sub_100009384(&v72, v73);
      sub_100022CF0();
      uint64_t v27 = sub_100022DD0();
      uint64_t v29 = v28;
      (*v25)(v12, v67);
      sub_10000941C((uint64_t)&v72, (uint64_t)v71);
      uint64_t v30 = v74;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      char v70 = v30;
      uint64_t v74 = (unint64_t *)0x8000000000000000;
      unint64_t v33 = sub_10001E7B0(v27, v29);
      unint64_t v34 = v30[2];
      BOOL v35 = (v32 & 1) == 0;
      uint64_t v36 = v34 + v35;
      if (__OFADD__(v34, v35)) {
        goto LABEL_40;
      }
      char v37 = v32;
      if ((uint64_t)v30[3] >= v36)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          Swift::String v40 = v70;
          if ((v32 & 1) == 0) {
            goto LABEL_25;
          }
        }
        else
        {
          sub_100020760();
          Swift::String v40 = v70;
          if ((v37 & 1) == 0) {
            goto LABEL_25;
          }
        }
      }
      else
      {
        sub_10001F64C(v36, isUniquelyReferenced_nonNull_native);
        unint64_t v38 = sub_10001E7B0(v27, v29);
        if ((v37 & 1) != (v39 & 1)) {
          goto LABEL_42;
        }
        unint64_t v33 = v38;
        Swift::String v40 = v70;
        if ((v37 & 1) == 0)
        {
LABEL_25:
          v40[(v33 >> 6) + 8] |= 1 << v33;
          Swift::String v41 = (uint64_t *)(v40[6] + 16 * v33);
          *Swift::String v41 = v27;
          v41[1] = v29;
          sub_10000936C(v71, v40[7] + 40 * v33);
          unint64_t v42 = v40[2];
          BOOL v43 = __OFADD__(v42, 1);
          unint64_t v44 = v42 + 1;
          if (v43) {
            goto LABEL_41;
          }
          _OWORD v40[2] = v44;
          swift_bridgeObjectRetain();
          goto LABEL_17;
        }
      }
      uint64_t v26 = v40[7] + 40 * v33;
      sub_100008AAC(v26);
      sub_10000936C(v71, v26);
LABEL_17:
      uint64_t v74 = v40;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100008AAC((uint64_t)&v72);
      v24 += 40;
      if (!--v23)
      {
        swift_release();
        uint64_t v7 = v66;
        uint64_t v9 = v69;
        uint64_t v15 = &_swiftEmptyArrayStorage;
        goto LABEL_31;
      }
    }
  }
  uint64_t v63 = v10;
  unint64_t v17 = 0;
  uint64_t v18 = (uint64_t)(v13 + 32);
  id v19 = (unint64_t *)&_swiftEmptyArrayStorage;
  while (v17 < *((void *)v14 + 2))
  {
    sub_10000941C(v18, (uint64_t)&v72);
    sub_100009384(&v72, v73);
    if (sub_100022CD0())
    {
      sub_10000936C(&v72, (uint64_t)v71);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_10001F9A4(0, v19[2] + 1, 1);
      }
      id v19 = v74;
      unint64_t v21 = v74[2];
      unint64_t v20 = v74[3];
      if (v21 >= v20 >> 1)
      {
        sub_10001F9A4(v20 > 1, v21 + 1, 1);
        id v19 = v74;
      }
      long long v19[2] = v21 + 1;
      sub_10000936C(v71, (uint64_t)&v19[5 * v21 + 4]);
    }
    else
    {
      sub_100008AAC((uint64_t)&v72);
    }
    ++v17;
    v18 += 40;
    if (v16 == v17)
    {
      uint64_t v22 = v74;
      uint64_t v7 = v66;
      uint64_t v9 = v69;
      uint64_t v15 = &_swiftEmptyArrayStorage;
      char v10 = v63;
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  sub_100023800();
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_10001DB3C(void *a1, uint64_t a2)
{
  return PPXContextMenuProvider.contextMenuActionItems(with:for:)(a1, a2);
}

void *sub_10001DB60(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return PPXContextMenuProvider.computeSwipeActionItems(with:for:swipeActionType:assetID:)(a1, a2, a3, a4, a5);
}

uint64_t sub_10001DB84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100022788;
  return v6();
}

uint64_t sub_10001DC50(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100022788;
  return v7();
}

uint64_t sub_10001DD1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000235B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000235A0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100010560(a1, &qword_100039540);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100023570();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001DEC8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10001DFA4;
  return v6(a1);
}

uint64_t sub_10001DFA4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_10001E09C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_10001E410(a1, a2, a3, a4, &qword_100039620, &qword_100039628);
}

char *sub_10001E0B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000084A8(&qword_1000394F0);
      char v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
      unint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[24 * v8 + 32]) {
          memmove(v12, a4 + 32, 24 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      char v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100021774(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10001E1D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000084A8(&qword_100039658);
      char v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
      unint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[24 * v8 + 32]) {
          memmove(v12, a4 + 32, 24 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      char v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100021664(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10001E300(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000084A8(&qword_100039120);
      char v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      char v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100021570(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10001E410(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = *((void *)a4 + 3);
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = *((void *)a4 + 2);
    if (v10 <= v11) {
      uint64_t v12 = *((void *)a4 + 2);
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      sub_1000084A8(a5);
      uint64_t v13 = (char *)swift_allocObject();
      size_t v14 = j__malloc_size(v13);
      *((void *)v13 + 2) = v11;
      *((void *)v13 + 3) = 2 * ((uint64_t)(v14 - 32) / 40);
      uint64_t v15 = v13 + 32;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[40 * v11 + 32]) {
          memmove(v15, a4 + 32, 40 * v11);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v15 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10002123C(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001E540(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000084A8(&qword_1000395F0);
  uint64_t v10 = *(void *)(sub_1000084A8(&qword_1000394F8) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_100023740();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1000084A8(&qword_1000394F8) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000222F0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_10001E7B0(uint64_t a1, uint64_t a2)
{
  sub_100023820();
  sub_1000234D0();
  Swift::Int v4 = sub_100023830();

  return sub_10001E86C(a1, a2, v4);
}

unint64_t sub_10001E828(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1000236B0(*(void *)(v2 + 40));

  return sub_10001E950(a1, v4);
}

unint64_t sub_10001E86C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000237E0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000237E0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10001E950(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100021E5C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_1000236C0();
      sub_1000188CC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10001EA18(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000084A8(&qword_100039590);
  uint64_t v6 = sub_100023790();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_10000E538(v24, v35);
      }
      else
      {
        sub_10000E4DC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_100023820();
      sub_1000234D0();
      uint64_t result = sub_100023830();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      BOOL v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *BOOL v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_10000E538(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10001ED18(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000084A8(&qword_100039500);
  char v37 = a2;
  uint64_t v6 = sub_100023790();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_100023820();
    sub_1000234D0();
    uint64_t result = sub_100023830();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10001F024(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000084A8(&qword_100039630);
  char v38 = a2;
  uint64_t v6 = sub_100023790();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_100023820();
    sub_1000234D0();
    uint64_t result = sub_100023830();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10001F334(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000084A8(&qword_100039618);
  char v36 = a2;
  uint64_t v6 = sub_100023790();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100023820();
    sub_1000234D0();
    uint64_t result = sub_100023830();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10001F64C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000084A8(&qword_1000395B8);
  char v37 = a2;
  uint64_t v6 = sub_100023790();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    char v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_10000936C(v25, (uint64_t)v38);
    }
    else
    {
      sub_10000941C((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_100023820();
    sub_1000234D0();
    uint64_t result = sub_100023830();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *unint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_10000936C(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10001F974(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001F9D4(a1, a2, a3, (void *)*v3, &qword_100039620, &qword_100039628);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10001F9A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001F9D4(a1, a2, a3, (void *)*v3, &qword_1000395E0, &qword_1000395D8);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10001F9D4(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_1000084A8(a5);
    int64_t v13 = (void *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    int64_t v13 = &_swiftEmptyArrayStorage;
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    sub_1000084A8(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_1000237B0();
  __break(1u);
  return result;
}

uint64_t sub_10001FB7C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100023770();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100023770();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100023710();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100020EF0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_100023770();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_100023540();
}

uint64_t sub_10001FD48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_10001E410(isUniquelyReferenced_nonNull_native, v14, 1, v3, &qword_1000395E0, &qword_1000395D8);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[40 * v8 + 32];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2) {
    goto LABEL_24;
  }
  sub_1000084A8(&qword_1000395D8);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1000237B0();
  __break(1u);
  return result;
}

uint64_t sub_10001FEC4(void *a1, char a2, void *a3)
{
  uint64_t v4 = a1[2];
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v41 = a1[6];
  swift_bridgeObjectRetain();
  unint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_10001E7B0(v8, v7);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_100020244();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    unint64_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    unint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *unint64_t v20 = v8;
    v20[1] = v7;
    *(void *)(v19[7] + 8 * v11) = v41;
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    long long v19[2] = v23;
    uint64_t v24 = v4 - 1;
    if (v4 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (unint64_t i = a1 + 9; ; i += 3)
    {
      uint64_t v27 = *(i - 2);
      uint64_t v26 = *(i - 1);
      uint64_t v28 = *i;
      char v29 = (void *)*a3;
      swift_bridgeObjectRetain();
      unint64_t v30 = sub_10001E7B0(v27, v26);
      uint64_t v32 = v29[2];
      BOOL v33 = (v31 & 1) == 0;
      BOOL v22 = __OFADD__(v32, v33);
      uint64_t v34 = v32 + v33;
      if (v22) {
        break;
      }
      char v35 = v31;
      if (v29[3] < v34)
      {
        sub_10001ED18(v34, 1);
        unint64_t v30 = sub_10001E7B0(v27, v26);
        if ((v35 & 1) != (v36 & 1)) {
          goto LABEL_25;
        }
      }
      if (v35) {
        goto LABEL_10;
      }
      char v37 = (void *)*a3;
      *(void *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      char v38 = (uint64_t *)(v37[6] + 16 * v30);
      *char v38 = v27;
      v38[1] = v26;
      *(void *)(v37[7] + 8 * v30) = v28;
      uint64_t v39 = v37[2];
      BOOL v22 = __OFADD__(v39, 1);
      uint64_t v40 = v39 + 1;
      if (v22) {
        goto LABEL_24;
      }
      v37[2] = v40;
      if (!--v24) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_10001ED18(v14, a2 & 1);
  unint64_t v16 = sub_10001E7B0(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    sub_1000084A8(&qword_1000395C0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_100023800();
  __break(1u);
LABEL_26:
  sub_1000236E0(30);
  v42._object = (void *)0x800000010002CCB0;
  v42._countAndFlagsBits = 0xD00000000000001BLL;
  sub_1000234E0(v42);
  sub_100023730();
  v43._countAndFlagsBits = 39;
  v43._object = (void *)0xE100000000000000;
  sub_1000234E0(v43);
  uint64_t result = sub_100023750();
  __break(1u);
  return result;
}

void *sub_100020244()
{
  uint64_t v1 = v0;
  sub_1000084A8(&qword_100039500);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100023780();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    BOOL v22 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1000203F4()
{
  uint64_t v1 = v0;
  sub_1000084A8(&qword_100039630);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100023780();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000205A8()
{
  uint64_t v1 = v0;
  sub_1000084A8(&qword_100039618);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100023780();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100020760()
{
  uint64_t v1 = v0;
  sub_1000084A8(&qword_1000395B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100023780();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_10000941C(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_10000936C(v26, *(void *)(v4 + 56) + v20);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_10002094C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    id result = sub_1000236A0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_100023820();
        swift_bridgeObjectRetain();
        sub_1000234D0();
        Swift::Int v9 = sub_100023830();
        id result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    char v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    char v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *char v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void (*sub_100020B24(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_100020DDC(v6);
  v6[10] = sub_100020C44(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_100020BD0;
}

void sub_100020BD0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);

  free(v1);
}

void (*sub_100020C44(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  unint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_10001E7B0(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *unint64_t v10 = v19;
        return sub_100020D8C;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_1000205A8();
      goto LABEL_7;
    }
    sub_10001F334(v16, a4 & 1);
    unint64_t v20 = sub_10001E7B0(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  id result = (void (*)(uint64_t **))sub_100023800();
  __break(1u);
  return result;
}

void sub_100020D8C(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_100020E18(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t (*sub_100020DDC(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_100020E0C;
}

uint64_t sub_100020E0C(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t *sub_100020E18(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *result;
  if (*result)
  {
    Swift::Int v9 = (void *)*a3;
    if (a2)
    {
      *(void *)(v9[7] + 8 * a4) = v8;
    }
    else
    {
      v9[(a4 >> 6) + 8] |= 1 << a4;
      unint64_t v10 = (void *)(v9[6] + 16 * a4);
      *unint64_t v10 = a5;
      v10[1] = a6;
      *(void *)(v9[7] + 8 * a4) = v8;
      uint64_t v11 = v9[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12)
      {
        __break(1u);
        return result;
      }
      long long v9[2] = v13;
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_10002094C(a4, *a3);
  }

  return (uint64_t *)swift_bridgeObjectRetain();
}

uint64_t sub_100020EF0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100023770();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100023770();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100022670();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_1000084A8(&qword_100039648);
          BOOL v12 = sub_100021104(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100010418(0, &qword_100039640);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1000237B0();
  __break(1u);
  return result;
}

void (*sub_100021104(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000211B4(v6, a2, a3);
  return sub_10002116C;
}

void sub_10002116C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1000211B4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  int64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100023700();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)int64_t v3 = v4;
    return sub_100021234;
  }
  __break(1u);
  return result;
}

void sub_100021234(id *a1)
{
}

uint64_t sub_10002123C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      sub_1000084A8(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_1000237B0();
  __break(1u);
  return result;
}

uint64_t sub_100021348(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  sub_100023050();
  uint64_t v2 = (void *)sub_100023040();
  int64_t v3 = (void *)sub_100023030();

  if (!v3) {
    return 0;
  }
  id v4 = [v3 highlightMenu];
  id v5 = [v4 children];

  sub_100010418(0, &qword_100039638);
  unint64_t v6 = sub_100023530();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100023770();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v7)
  {
    if (qword_100038470 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_100023250();
    sub_100021D90(v11, (uint64_t)qword_1000394B0);
    BOOL v12 = sub_100023230();
    os_log_type_t v13 = sub_1000235D0();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "highlightMenu empty for highlight", v14, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  id v8 = [v3 highlightMenu];
  id v9 = [v8 children];

  uint64_t v10 = sub_100023530();
  return v10;
}

uint64_t sub_100021570(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1000237B0();
  __break(1u);
  return result;
}

uint64_t sub_100021664(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      sub_1000084A8(&qword_100039660);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1000237B0();
  __break(1u);
  return result;
}

uint64_t sub_100021774(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      sub_1000084A8(&qword_1000395D0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1000237B0();
  __break(1u);
  return result;
}

char *sub_100021884(unint64_t a1, uint64_t (*a2)(uint64_t, id))
{
  unint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_100023770())
  {
    unint64_t v19 = v2 & 0xC000000000000001;
    uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v5 = 4;
    unint64_t v18 = v2;
    while (1)
    {
      id v7 = v19 ? (id)sub_100023700() : *(id *)(v2 + 8 * v5);
      id v8 = v7;
      uint64_t v9 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      uint64_t v10 = a2(v5 - 4, v7);
      uint64_t v12 = v11;
      uint64_t v14 = v13;

      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v4 = sub_10001E0B0(0, *((void *)v4 + 2) + 1, 1, v4);
        }
        unint64_t v16 = *((void *)v4 + 2);
        unint64_t v15 = *((void *)v4 + 3);
        if (v16 >= v15 >> 1) {
          uint64_t v4 = sub_10001E0B0((char *)(v15 > 1), v16 + 1, 1, v4);
        }
        *((void *)v4 + 2) = v16 + 1;
        unint64_t v6 = &v4[24 * v16];
        *((void *)v6 + 4) = v10;
        *((void *)v6 + 5) = v12;
        *((void *)v6 + 6) = v14;
        unint64_t v2 = v18;
      }
      ++v5;
      if (v9 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
  uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
LABEL_18:
  swift_bridgeObjectRelease();
  return v4;
}

void *sub_100021A28(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t result = &_swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    unint64_t v6 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v8 = *(v6 - 1);
      uint64_t v7 = *v6;
      uint64_t v9 = *(v6 - 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v10 = a2(v9, v8, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v10)
      {
        sub_100023510();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100023550();
        }
        sub_100023560();
        sub_100023540();
      }
      v6 += 3;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t _s25BooksProductPageExtension22PPXContextMenuProviderC022analyticsAssetPropertyG03forSo07BAAssetjG0_pSg11BookStoreUI22ContextActionDataModelC_tF_0(void *a1)
{
  uint64_t v2 = sub_1000084A8(&qword_1000394D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for PPXContextActionData();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = a1;
  id v10 = (id)BSUIGetLibraryItemStateProvider();
  uint64_t v17 = sub_100022EC0();
  unint64_t v18 = &protocol witness table for MenuCoverImageProvider;
  sub_100010628((uint64_t *)&v16);
  sub_100022EB0();
  sub_100011974(v9, (uint64_t)v10, (uint64_t)&v16, (uint64_t)v4);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100010560((uint64_t)v4, &qword_1000394D0);
  }
  else
  {
    sub_100011FE4((uint64_t)v4, (uint64_t)v8);
    sub_1000226CC(&qword_100039608, (void (*)(uint64_t))type metadata accessor for PPXContextActionData);
    sub_100022FD0();
    if ((v19 & 1) == 0)
    {
      sub_10000936C(&v16, (uint64_t)v15);
      sub_10000941C((uint64_t)v15, (uint64_t)v14);
      id v12 = objc_allocWithZone((Class)sub_100023070());
      uint64_t v11 = sub_100023060();
      sub_100008AAC((uint64_t)v15);
      sub_100011F30((uint64_t)v8);
      return v11;
    }
    sub_100011F30((uint64_t)v8);
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_100021D90(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100021DC8(void *a1)
{
  return sub_10001CFDC(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_100021DE8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t type metadata accessor for PPXContextMenuProvider()
{
  return self;
}

uint64_t sub_100021E5C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100021EB8()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100021F08()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000081D0;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100039548 + dword_100039548);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_100021FCC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100022788;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100039558 + dword_100039558);
  return v6(v2, v3, v4);
}

uint64_t sub_100022090()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000220D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100022788;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100039568 + dword_100039568);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10002219C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000221D4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000081D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100039578 + dword_100039578);
  return v6(a1, v4);
}

uint64_t sub_10002228C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000084A8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000222F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1000084A8(&qword_1000394F8) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1000237B0();
  __break(1u);
  return result;
}

uint64_t sub_10002244C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001CE5C(a1, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32), *(void *)(v2 + 40), a2);
}

uint64_t sub_10002246C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PPXContextActionData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000224D0()
{
  unint64_t result = qword_100039610;
  if (!qword_100039610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039610);
  }
  return result;
}

uint64_t sub_100022524()
{
  swift_unknownObjectWeakDestroy();

  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t *sub_10002256C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000225D0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001B1C4(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), *(void *)(v2 + 40), a2);
}

void *sub_1000225F0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001B460(a1, *(uint64_t **)(v2 + 24), a2);
}

void sub_10002260C(uint64_t a1, void *a2)
{
  sub_10001B890(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

Class sub_100022614(uint64_t a1, void *a2, UIMenuElementSize a3)
{
  return sub_10001BAE8(a1, a2, a3, *(UIMenuElementSize *)(v3 + 16));
}

uint64_t sub_10002261C(uint64_t a1)
{
  return a1;
}

unint64_t sub_100022670()
{
  unint64_t result = qword_100039650;
  if (!qword_100039650)
  {
    sub_10000E454(&qword_100039648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039650);
  }
  return result;
}

uint64_t sub_1000226CC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100022714(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100022770@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10002244C(a1, a2);
}

void sub_10002278C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error <BCCloudCollectionDetailManager fetchCollectionDetailsIncludingDeleted:completion:> {%@}", (uint8_t *)&v2, 0xCu);
}

void sub_100022804(char a1, NSObject *a2)
{
  CFStringRef v2 = @"NO";
  if (a1) {
    CFStringRef v2 = @"YES";
  }
  int v3 = 138412290;
  CFStringRef v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Deleting audiobook. Succeeded: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100022894(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Delete book error %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002290C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No AppAnalytics Tracker provided for purchaseBook. Analytics event will be missing tracker.", v1, 2u);
}

void sub_100022950()
{
  sub_10000643C();
  sub_100006458((void *)&_mh_execute_header, v0, v1, "Open book error: %@, opened: %d");
}

void sub_1000229B8()
{
  sub_10000643C();
  sub_100006458((void *)&_mh_execute_header, v0, v1, "Open sample book error: %@, opened: %d");
}

void sub_100022A20()
{
  sub_10000643C();
  sub_100006458((void *)&_mh_execute_header, v0, v1, "Preview audiobook error: %@, opened: %d");
}

void sub_100022A88(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "downloadQueue:downloadStatesDidChange: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100022B00(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "got a nil assetIdentifier while trying to create a BKLibraryDownloadStatus", buf, 2u);
}

uint64_t sub_100022B40()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100022B50()
{
  return type metadata accessor for Notification();
}

uint64_t sub_100022B60()
{
  return URL.absoluteString.getter();
}

void sub_100022B70(NSURL *retstr@<X8>)
{
}

uint64_t sub_100022B80()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100022B90()
{
  return type metadata accessor for URL();
}

uint64_t sub_100022BA0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100022BB0()
{
  return type metadata accessor for Date();
}

NSLocale sub_100022BC0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_100022BD0()
{
  return static Locale.current.getter();
}

uint64_t sub_100022BE0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100022BF0()
{
  return static Calendar.current.getter();
}

uint64_t sub_100022C00()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100022C10()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_100022C20()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100022C30()
{
  return dispatch thunk of ContextMenuPresentationContextProtocol.present(_:animated:)();
}

uint64_t sub_100022C40()
{
  return ContextMenuPresentationContextProtocol.newOptionsForShowingHUD.getter();
}

uint64_t sub_100022C50()
{
  return FigaroProvider.init()();
}

uint64_t sub_100022C60()
{
  return type metadata accessor for FigaroProvider();
}

uint64_t sub_100022C70()
{
  return type metadata accessor for LikeActionItem();
}

uint64_t sub_100022C80()
{
  return type metadata accessor for VCStackManager();
}

uint64_t sub_100022C90()
{
  return dispatch thunk of FigaroProviding.swipeActionTypeToIndexDict.modify();
}

uint64_t sub_100022CA0()
{
  return dispatch thunk of FigaroProviding.swipeActionTypeToIndexDict.getter();
}

uint64_t sub_100022CB0()
{
  return dispatch thunk of FigaroProviding.contextMenuActionTypeToIndexDict.setter();
}

uint64_t sub_100022CC0()
{
  return type metadata accessor for ShareActionItem();
}

uint64_t sub_100022CD0()
{
  return dispatch thunk of ContextActionItem.isSupported.getter();
}

uint64_t sub_100022CE0()
{
  return dispatch thunk of ContextActionItem.init(data:context:tracker:figaroProvider:)();
}

uint64_t sub_100022CF0()
{
  return dispatch thunk of ContextActionItem.type.getter();
}

uint64_t sub_100022D00()
{
  return ContextActionItem.swiftuiPostAction(shelfID:)();
}

uint64_t sub_100022D10()
{
  return ContextActionItem.uiAction.getter();
}

uint64_t sub_100022D20()
{
  return ContextActionItem.subContextActionItems.getter();
}

uint64_t sub_100022D30()
{
  return ContextActionItem.menuItemView.getter();
}

uint64_t sub_100022D40()
{
  return ContextActionItem.attributes.getter();
}

uint64_t sub_100022D50()
{
  return ContextActionItem.identifier.getter();
}

uint64_t sub_100022D60()
{
  return ContextActionItem.title.getter();
}

uint64_t sub_100022D70()
{
  return ContextActionItem.subtitle.getter();
}

uint64_t sub_100022D80()
{
  return static ContextActionType.SwipeActionType.== infix(_:_:)();
}

uint64_t sub_100022D90()
{
  return type metadata accessor for ContextActionType.SwipeActionType();
}

uint64_t sub_100022DA0()
{
  return static ContextActionType.orderActionItems(_:)();
}

uint64_t sub_100022DB0()
{
  return ContextActionType.swipeActionType.getter();
}

uint64_t sub_100022DC0()
{
  return type metadata accessor for ContextActionType.ContextActionGroup();
}

uint64_t sub_100022DD0()
{
  return ContextActionType.identifier.getter();
}

uint64_t sub_100022DE0()
{
  return ContextActionType.actionIdentifier.getter();
}

uint64_t sub_100022DF0()
{
  return type metadata accessor for ContextActionType();
}

uint64_t sub_100022E00()
{
  return type metadata accessor for ContextActionSource();
}

uint64_t sub_100022E20()
{
  return type metadata accessor for MenuCoverImageSource();
}

uint64_t sub_100022E30()
{
  return static ContextActionAssetType.== infix(_:_:)();
}

uint64_t sub_100022E40()
{
  return dispatch thunk of ContextActionDataModel.supportsSuggestionContextMenu.getter();
}

uint64_t sub_100022E50()
{
  return dispatch thunk of ContextActionDataModel.shouldReportFigaro.getter();
}

uint64_t sub_100022E60()
{
  return dispatch thunk of ContextActionDataModel.sourceBarButtonItem.getter();
}

uint64_t sub_100022E70()
{
  return dispatch thunk of ContextActionDataModel.isAnODPRecommendation.getter();
}

uint64_t sub_100022E80()
{
  return dispatch thunk of ContextActionDataModel.actionItemNeedsDifferentiation.getter();
}

uint64_t sub_100022E90()
{
  return ContextActionDataModel.Asset.initType.getter();
}

uint64_t sub_100022EA0()
{
  return ContextActionDataModel.initType.getter();
}

uint64_t sub_100022EB0()
{
  return MenuCoverImageProvider.init()();
}

uint64_t sub_100022EC0()
{
  return type metadata accessor for MenuCoverImageProvider();
}

uint64_t sub_100022EE0()
{
  return MenuLikeStateController.init(authStatusProvider:authServiceProvider:)();
}

uint64_t sub_100022EF0()
{
  return type metadata accessor for MenuLikeStateController();
}

uint64_t sub_100022F00()
{
  return type metadata accessor for RateAndReviewActionItem();
}

uint64_t sub_100022F10()
{
  return dispatch thunk of ContextAssetInfoProtocol.isExplicit.getter();
}

uint64_t sub_100022F20()
{
  return dispatch thunk of ContextAssetInfoProtocol.isDownloading.getter();
}

uint64_t sub_100022F30()
{
  return dispatch thunk of ContextAssetInfoProtocol.isInWantToRead.getter();
}

uint64_t sub_100022F40()
{
  return dispatch thunk of ContextAssetInfoProtocol.isMarkedFinished.getter();
}

uint64_t sub_100022F50()
{
  return dispatch thunk of ContextAssetInfoProtocol.socialHighlightID.getter();
}

uint64_t sub_100022F60()
{
  return dispatch thunk of ContextAssetInfoProtocol.supplementalContentCount.getter();
}

uint64_t sub_100022F70()
{
  return dispatch thunk of ContextAssetInfoProtocol.assetId.getter();
}

uint64_t sub_100022F80()
{
  return dispatch thunk of ContextAssetInfoProtocol.isLocal.getter();
}

uint64_t sub_100022F90()
{
  return dispatch thunk of ContextAssetInfoProtocol.isOwned.getter();
}

uint64_t sub_100022FA0()
{
  return dispatch thunk of ContextAssetInfoProtocol.storeId.getter();
}

uint64_t sub_100022FB0()
{
  return dispatch thunk of ContextAssetInfoProtocol.assetType.getter();
}

uint64_t sub_100022FC0()
{
  return dispatch thunk of ContextActionDataProtocol.isOnline.getter();
}

uint64_t sub_100022FD0()
{
  return ContextActionDataProtocol.selectionMode.getter();
}

uint64_t sub_100022FE0()
{
  return ContextActionDataProtocol.analyticsAttributes.getter();
}

uint64_t sub_100022FF0()
{
  return ContextActionPublisherInfo.init(name:year:)();
}

uint64_t sub_100023000()
{
  return type metadata accessor for ContextActionPublisherInfo();
}

uint64_t sub_100023010()
{
  return static PartialObjectGraphProvider.buildPartialObjectGraph()();
}

uint64_t sub_100023020()
{
  return dispatch thunk of BSUISharedWithYouController.highlightIdentifier(for:)();
}

uint64_t sub_100023030()
{
  return dispatch thunk of BSUISharedWithYouController.highlightAttributionView(for:viewController:)();
}

uint64_t sub_100023040()
{
  return static BSUISharedWithYouController.shared.getter();
}

uint64_t sub_100023050()
{
  return type metadata accessor for BSUISharedWithYouController();
}

uint64_t sub_100023060()
{
  return ContextMenuAssetPropertyProvider.init(assetInfo:)();
}

uint64_t sub_100023070()
{
  return type metadata accessor for ContextMenuAssetPropertyProvider();
}

uint64_t sub_100023080()
{
  return type metadata accessor for AnalyticsController();
}

uint64_t sub_100023090()
{
  return type metadata accessor for SeriesType();
}

uint64_t sub_1000230A0()
{
  return type metadata accessor for ContentType();
}

uint64_t sub_1000230B0()
{
  return EventReporter.emitMarkAsFinishedEvent(using:for:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:isFinishedDateSet:)();
}

uint64_t sub_1000230C0()
{
  return EventReporter.emitAddToCollectionEvent(using:for:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:)();
}

uint64_t sub_1000230D0()
{
  return EventReporter.emitRemoveFromCollectionEvent(using:for:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:)();
}

uint64_t sub_1000230E0()
{
  return static EventReporter.libraryAnalyticsDataProvider.setter();
}

uint64_t sub_1000230F0()
{
  return dispatch thunk of EventReporter.seriesType(for:)();
}

uint64_t sub_100023100()
{
  return static EventReporter.shared.getter();
}

uint64_t sub_100023110()
{
  return type metadata accessor for EventReporter();
}

uint64_t sub_100023120()
{
  return type metadata accessor for ProductionType();
}

uint64_t sub_100023130()
{
  return type metadata accessor for ContentAcquisitionType();
}

uint64_t sub_100023140()
{
  return type metadata accessor for MResourceType();
}

uint64_t sub_100023160()
{
  return dispatch thunk of MAsset.isBook.getter();
}

uint64_t sub_100023170()
{
  return MAsset.htmlStrippedStandardDescription.getter();
}

uint64_t sub_100023180()
{
  return MAsset.publisherName.getter();
}

uint64_t sub_100023190()
{
  return MAsset.versionHistory.getter();
}

uint64_t sub_1000231A0()
{
  return MAsset.url.getter();
}

uint64_t sub_1000231B0()
{
  return MAsset.locale.getter();
}

uint64_t sub_1000231C0()
{
  return MAsset.isIBook.getter();
}

uint64_t sub_1000231D0()
{
  return MAsset.offerType.getter();
}

uint64_t sub_1000231E0()
{
  return type metadata accessor for MAsset();
}

uint64_t sub_1000231F0()
{
  return dispatch thunk of MResource.socialHighlightID.getter();
}

uint64_t sub_100023200()
{
  return MResource.id.getter();
}

uint64_t sub_100023210()
{
  return dispatch thunk of static MResource.type.getter();
}

uint64_t sub_100023220()
{
  return static Logger.contextActionItem.getter();
}

uint64_t sub_100023230()
{
  return Logger.logObject.getter();
}

uint64_t sub_100023240()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100023250()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100023260()
{
  return Logger.init(_:)();
}

uint64_t sub_100023270()
{
  return static AccountController.shared.getter();
}

uint64_t sub_100023280()
{
  return type metadata accessor for AccountController();
}

uint64_t sub_100023290()
{
  return type metadata accessor for JSAOSFeatureFlags();
}

uint64_t sub_1000232A0()
{
  return RCDataContainer.bridge.setter();
}

uint64_t sub_1000232B0()
{
  return static RCDataContainer.default.getter();
}

uint64_t sub_1000232C0()
{
  return type metadata accessor for RCDataContainer();
}

uint64_t sub_1000232D0()
{
  return dispatch thunk of AppAnalyticsExtensionManager.endSession()();
}

uint64_t sub_1000232E0()
{
  return dispatch thunk of AppAnalyticsExtensionManager.startSession()();
}

uint64_t sub_1000232F0()
{
  return dispatch thunk of AppAnalyticsExtensionManager.setupTracking(for:)();
}

uint64_t sub_100023300()
{
  return AppAnalyticsExtensionManager.init(uploadsEnabled:)();
}

uint64_t sub_100023310()
{
  return dispatch thunk of AppAnalyticsExtensionManager.waitForSessionEnd(with:)();
}

uint64_t sub_100023320()
{
  return dispatch thunk of AppAnalyticsExtensionManager.analyticsController.getter();
}

uint64_t sub_100023330()
{
  return type metadata accessor for AppAnalyticsExtensionManager();
}

uint64_t sub_100023340()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100023350()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100023360()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_100023370()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100023380()
{
  return static DispatchTime.now()();
}

uint64_t sub_100023390()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000233A0()
{
  return + infix(_:_:)();
}

uint64_t sub_1000233B0()
{
  return Dependency.init<A>(satisfying:with:)();
}

uint64_t sub_1000233C0()
{
  return Dependency.init<A>(satisfying:with:)();
}

uint64_t sub_1000233D0()
{
  return type metadata accessor for Dependency();
}

uint64_t sub_1000233E0()
{
  return BaseObjectGraph.inject<A>(_:)();
}

uint64_t sub_1000233F0()
{
  return BaseObjectGraph.__allocating_init(name:_:)();
}

uint64_t sub_100023400()
{
  return dispatch thunk of BaseObjectGraph.adding(dependency:)();
}

uint64_t sub_100023410()
{
  return dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)();
}

uint64_t sub_100023420()
{
  return static BaseObjectGraph.current.getter();
}

uint64_t sub_100023430()
{
  return type metadata accessor for BaseObjectGraph();
}

NSDictionary sub_100023440()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100023450()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100023460()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100023470()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100023480()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100023490()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000234A0()
{
  return String.init(localized:defaultValue:table:bundle:locale:comment:)();
}

uint64_t sub_1000234B0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_1000234C0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000234D0()
{
  return String.hash(into:)();
}

void sub_1000234E0(Swift::String a1)
{
}

Swift::Int sub_1000234F0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100023500()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100023510()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100023520()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100023530()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100023540()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100023550()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100023560()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100023570()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100023580()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100023590()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1000235A0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000235B0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000235C0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000235D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000235E0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_1000235F0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100023600()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100023610()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100023620()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100023630()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_100023640()
{
  return OS_dispatch_semaphore.signal()();
}

UIMenu sub_100023650(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t sub_100023660()
{
  return Optional<A>.int32Value.getter();
}

uint64_t sub_100023670()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100023680()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100023690()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000236A0()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_1000236B0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000236C0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000236D0()
{
  return AnyHashable.init<A>(_:)();
}

void sub_1000236E0(Swift::Int a1)
{
}

uint64_t sub_1000236F0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100023700()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100023710()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100023720()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100023730()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100023740()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100023750()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100023760()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100023770()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100023780()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100023790()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000237A0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000237B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000237C0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000237D0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1000237E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000237F0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100023800()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100023810()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100023820()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100023830()
{
  return Hasher._finalize()();
}

uint64_t BCBookDownloadLog()
{
  return _BCBookDownloadLog();
}

uint64_t BCProductPageExtensionLog()
{
  return _BCProductPageExtensionLog();
}

uint64_t BSUIGetLibraryItemStateProvider()
{
  return _BSUIGetLibraryItemStateProvider();
}

uint64_t BSUIGetLibraryItemStateUpdater()
{
  return _BSUIGetLibraryItemStateUpdater();
}

uint64_t BUDynamicCast()
{
  return _BUDynamicCast();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return _UIAccessibilityIsInvertColorsEnabled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend__contentDataForContentID_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentDataForContentID:tracker:");
}

id objc_msgSend__isOwned_(void *a1, const char *a2, ...)
{
  return [_a1 _isOwned:];
}

id objc_msgSend__updateCollections(void *a1, const char *a2, ...)
{
  return _[a1 _updateCollections];
}

id objc_msgSend__updateDownloadingAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDownloadingAssets:");
}

id objc_msgSend_activeStoreAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeStoreAccount];
}

id objc_msgSend_addChild_(void *a1, const char *a2, ...)
{
  return [a1 addChild:];
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return [a1 addFilterPredicate:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addStoreID_toCollectionID_completion_(void *a1, const char *a2, ...)
{
  return [a1 addStoreID:toCollectionID:completion:];
}

id objc_msgSend_addStoreIDToWantToRead_tracker_(void *a1, const char *a2, ...)
{
  return [a1 addStoreIDToWantToRead:tracker];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return [a1 ams_DSID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assetDetailForAssetID_completion_(void *a1, const char *a2, ...)
{
  return [a1 assetDetailForAssetID:completion:];
}

id objc_msgSend_assetDetailManager(void *a1, const char *a2, ...)
{
  return _[a1 assetDetailManager];
}

id objc_msgSend_assetID(void *a1, const char *a2, ...)
{
  return _[a1 assetID];
}

id objc_msgSend_audiobooksQuery(void *a1, const char *a2, ...)
{
  return _[a1 audiobooksQuery];
}

id objc_msgSend_ba_effectiveAnalyticsTracker(void *a1, const char *a2, ...)
{
  return [a1 ba_effectiveAnalyticsTracker];
}

id objc_msgSend_ba_setAnalyticsTracker_(void *a1, const char *a2, ...)
{
  return [a1 ba_setAnalyticsTracker:];
}

id objc_msgSend_bc_firstVisibleChildViewControllerOfClass_includePresented_(void *a1, const char *a2, ...)
{
  return [a1 bc_firstVisibleChildViewControllerOfClass:includePresented:];
}

id objc_msgSend_bk_assetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bk_assetIdentifier];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_cancelDownloadForAssetID_(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadForAssetID:];
}

id objc_msgSend_cancelDownloadForBook_(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadForBook:];
}

id objc_msgSend_cancelDownloadWithID_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadWithID:withCompletion:];
}

id objc_msgSend_chainWithName_(void *a1, const char *a2, ...)
{
  return [a1 chainWithName:];
}

id objc_msgSend_childAssets(void *a1, const char *a2, ...)
{
  return _[a1 childAssets];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _[a1 children];
}

id objc_msgSend_collectionDetailForCollectionID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionDetailForCollectionID:completion:");
}

id objc_msgSend_collectionDetailManager(void *a1, const char *a2, ...)
{
  return _[a1 collectionDetailManager];
}

id objc_msgSend_collectionDetailsCache(void *a1, const char *a2, ...)
{
  return _[a1 collectionDetailsCache];
}

id objc_msgSend_collectionID(void *a1, const char *a2, ...)
{
  return _[a1 collectionID];
}

id objc_msgSend_collectionMemberIDWithCollectionID_assetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionMemberIDWithCollectionID:assetID:");
}

id objc_msgSend_collectionMemberManager(void *a1, const char *a2, ...)
{
  return _[a1 collectionMemberManager];
}

id objc_msgSend_contentPrivateIDForContentID_(void *a1, const char *a2, ...)
{
  return [a1 contentPrivateIDForContentID];
}

id objc_msgSend_contentUserIDForContentID_(void *a1, const char *a2, ...)
{
  return [a1 contentUserIDForContentID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultBookLibrary(void *a1, const char *a2, ...)
{
  return _[a1 defaultBookLibrary];
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return _[a1 defaultMediaLibrary];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deleteCollectionMemberForCollectionMemberID_completion_(void *a1, const char *a2, ...)
{
  return [a1 deleteCollectionMemberForCollectionMemberID:completion:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:YES completion:nil];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_downloadBookWithRedownloadParameters_isAudiobook_hasRacSupport_uiManager_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadBookWithRedownloadParameters:isAudiobook:hasRacSupport:uiManager:tracker:");
}

id objc_msgSend_downloadBooks_(void *a1, const char *a2, ...)
{
  return [a1 downloadBooks:];
}

id objc_msgSend_downloadID(void *a1, const char *a2, ...)
{
  return _[a1 downloadID];
}

id objc_msgSend_downloadPhase(void *a1, const char *a2, ...)
{
  return _[a1 downloadPhase];
}

id objc_msgSend_downloadStatus(void *a1, const char *a2, ...)
{
  return _[a1 downloadStatus];
}

id objc_msgSend_downloadingAssets(void *a1, const char *a2, ...)
{
  return _[a1 downloadingAssets];
}

id objc_msgSend_emitAddToCollectionEventWithTracker_collectionID_contentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitAddToCollectionEventWithTracker:collectionID:contentData:");
}

id objc_msgSend_emitAddToCollectionEventWithTracker_collectionID_contentID_contentAcquisitionType_contentType_supplementalContentCount_seriesType_productionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitAddToCollectionEventWithTracker:collectionID:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:");
}

id objc_msgSend_emitMarkAsFinishedEventWithTracker_contentData_markedData_(void *a1, const char *a2, ...)
{
  return [a1 emitMarkAsFinishedEventWithTracker:contentData:markedData:];
}

id objc_msgSend_emitMarkAsFinishedEventWithTracker_contentID_contentAcquisitionType_contentType_supplementalContentCount_seriesType_productionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitMarkAsFinishedEventWithTracker:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:");
}

id objc_msgSend_emitRemoveFromCollectionEventWithTracker_collectionID_contentID_contentAcquisitionType_contentType_supplementalContentCount_seriesType_productionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitRemoveFromCollectionEventWithTracker:collectionID:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:");
}

id objc_msgSend_emitRemoveFromWantListEventWithTracker_contentID_contentType_(void *a1, const char *a2, ...)
{
  return [a1 emitRemoveFromWantListEventWithTracker:contentID:contentType:];
}

id objc_msgSend_emitWantListAddEventWithTracker_contentData_(void *a1, const char *a2, ...)
{
  return [a1 emitWantListAddEventWithTracker:contentData:];
}

id objc_msgSend_emitWantListAddEventWithTracker_contentID_contentAcquisitionType_contentType_supplementalContentCount_seriesType_productionType_(void *a1, const char *a2, ...)
{
  return [a1 emitWantListAddEventWithTracker:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:];
}

id objc_msgSend_enqueueValueCall_arguments_file_line_(void *a1, const char *a2, ...)
{
  return [a1 enqueueValueCall:arguments:file:line:];
}

id objc_msgSend_fetchCollectionDetailsIncludingDeleted_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchCollectionDetailsIncludingDeleted:completion:];
}

id objc_msgSend_fetchIsAssetID_inCollectionID_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchIsAssetID:inCollectionID:completion:];
}

id objc_msgSend_fetchServerItemsForStoreIDs_andDSIDS_(void *a1, const char *a2, ...)
{
  return [a1 fetchServerItemsForStoreIDs:andDSIDS:];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierFromPermlink(void *a1, const char *a2, ...)
{
  return _[a1 identifierFromPermlink];
}

id objc_msgSend_initWithBLDownloadStatus_isParent_(void *a1, const char *a2, ...)
{
  return [a1 initWithBLDownloadStatus:isParent:];
}

id objc_msgSend_initWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 initWithCompletion:];
}

id objc_msgSend_initWithContentID_contentType_contentPrivateID_contentUserID_contentAcquisitionType_contentSubType_contentLength_supplementalContentCount_seriesType_productionType_isUnified_contentKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:reuseIdentifier:];
}

id objc_msgSend_isArray(void *a1, const char *a2, ...)
{
  return _[a1 isArray];
}

id objc_msgSend_isAudiobook(void *a1, const char *a2, ...)
{
  return _[a1 isAudiobook];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isObject(void *a1, const char *a2, ...)
{
  return _[a1 isObject];
}

id objc_msgSend_itemStateWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 itemStateWithIdentifier:];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _[a1 library];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_metadataDictionary_variationWithNavigationBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 metadataDictionary:variationWithNavigationBarStyle:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_networkMonitor(void *a1, const char *a2, ...)
{
  return _[a1 networkMonitor];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openBook_options_(void *a1, const char *a2, ...)
{
  return [a1 openBook:options:];
}

id objc_msgSend_openSampleBook_withSampleURL_(void *a1, const char *a2, ...)
{
  return [a1 openSampleBook:withSampleURL:];
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 openSensitiveURL:withOptions:error:];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return _[a1 parent];
}

id objc_msgSend_permLink(void *a1, const char *a2, ...)
{
  return _[a1 permLink];
}

id objc_msgSend_predicateWithValue_forProperty_comparisonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithValue:forProperty:comparisonType:");
}

id objc_msgSend_previewAudiobook_(void *a1, const char *a2, ...)
{
  return [a1 previewAudiobook:];
}

id objc_msgSend_purchaseWithRequest_uiManager_completion_(void *a1, const char *a2, ...)
{
  return [a1 purchaseWithRequest:uiManager:completion:];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_removeAssetFromWantToRead_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAssetFromWantToRead:tracker:");
}

id objc_msgSend_removeAssetID_fromCollectionID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAssetID:fromCollectionID:completion:");
}

id objc_msgSend_removeBookFromLibraryWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeBookFromLibraryWithIdentifier:error:");
}

id objc_msgSend_removeFromParent(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParent];
}

id objc_msgSend_removeItems_(void *a1, const char *a2, ...)
{
  return [a1 removeItems:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_requestWithBuyParameters_storeIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 requestWithBuyParameters:storeIdentifier:];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_seriesTypeForContentID_(void *a1, const char *a2, ...)
{
  return [a1 seriesTypeForContentID:];
}

id objc_msgSend_setAnalyticsInfo_(void *a1, const char *a2, ...)
{
  return [a1 setAnalyticsInfo:];
}

id objc_msgSend_setAudiobook_(void *a1, const char *a2, ...)
{
  return [a1 setAudiobook:];
}

id objc_msgSend_setCollectionDetailsCache_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionDetailsCache:];
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setDataSource:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDownloadStatus_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadStatus:];
}

id objc_msgSend_setFinishedState_assetIDs_completion_(void *a1, const char *a2, ...)
{
  return [a1 setFinishedState:assetIDs:completion:];
}

id objc_msgSend_setFinishedState_storeID_tracker_(void *a1, const char *a2, ...)
{
  return [a1 setFinishedState:storeID:tracker:];
}

id objc_msgSend_setNetworkMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkMonitor:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setParent_(void *a1, const char *a2, ...)
{
  return [a1 setParent:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return _[a1 sharedClient];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedProvider];
}

id objc_msgSend_sharedReporter(void *a1, const char *a2, ...)
{
  return _[a1 sharedReporter];
}

id objc_msgSend_sortOrder(void *a1, const char *a2, ...)
{
  return _[a1 sortOrder];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return _[a1 stopObserving];
}

id objc_msgSend_storeDownloadParameters(void *a1, const char *a2, ...)
{
  return _[a1 storeDownloadParameters];
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return _[a1 storeID];
}

id objc_msgSend_storeIDFromBuyParameters_(void *a1, const char *a2, ...)
{
  return [a1 storeIDFromBuyParameters:];
}

id objc_msgSend_storePlaylistID(void *a1, const char *a2, ...)
{
  return _[a1 storePlaylistID];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_suspendAndTeardownForReason_(void *a1, const char *a2, ...)
{
  return [a1 suspendAndTeardownForReason:];
}

id objc_msgSend_temporaryAssetID(void *a1, const char *a2, ...)
{
  return _[a1 temporaryAssetID];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_titleForDefaultCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 titleForDefaultCollectionID];
}

id objc_msgSend_toArray(void *a1, const char *a2, ...)
{
  return _[a1 toArray];
}

id objc_msgSend_updateFinishedState_identifier_(void *a1, const char *a2, ...)
{
  return [a1 updateFinishedState:identifier:];
}

id objc_msgSend_updateItemOfInterestForItemIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 updateItemOfInterestForItemIdentifier:];
}

id objc_msgSend_updateStateToDeletedForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 updateStateToDeletedForIdentifier:];
}

id objc_msgSend_updateStateToPurchaseFailedForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 updateStateToPurchaseFailedForIdentifier:];
}

id objc_msgSend_updateStateToPurchasingForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 updateStateToPurchasingForIdentifier:];
}

id objc_msgSend_updateWantToReadState_identifier_(void *a1, const char *a2, ...)
{
  return [a1 updateWantToReadState:identifier:];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowManager(void *a1, const char *a2, ...)
{
  return _[a1 windowManager];
}