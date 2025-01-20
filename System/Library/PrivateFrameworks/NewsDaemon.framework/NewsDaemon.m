void sub_1000059E0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NDOfflineTodayFeedOperation *v22;
  void *v23;
  void *v24;
  NDOfflineTodayFeedOperation *v25;
  void *v26;
  id v27;
  void *v28;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, void *);
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  long long *v36;
  void v37[5];
  id v38;
  long long *p_buf;
  void v40[4];
  id v41;
  id v42;
  void v43[4];
  id v44;
  long long buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v3 = a2;
  v4 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "TodayFeedService did enter operation queue (instance=%{public}@)", (uint8_t *)&buf, 0xCu);
  }
  v6 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 40);
    v8 = v6;
    v9 = [v7 length];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TodayFeedService will adopt feed config data, length=%lu", (uint8_t *)&buf, 0xCu);
  }
  v10 = [*(id *)(a1 + 48) _configFromData:*(void *)(a1 + 40)];
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    v13 = [*(id *)(a1 + 48) _contentIDForConfig:v12];
    v14 = [*(id *)(a1 + 48) archiveStore];
    v15 = [v14 isContentIDComplete:v13];

    if (v15)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100005FB4;
      v40[3] = &unk_1000616F8;
      v41 = v13;
      v42 = v3;
      sub_100005FB4((uint64_t)v40);

      v16 = v41;
    }
    else
    {
      v17 = FCOfflineDownloadsLog;
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "TodayFeedService will begin downloading feed contents, id=%{public}@", (uint8_t *)&buf, 0xCu);
      }
      v18 = [*(id *)(a1 + 48) archiveStore];
      v16 = [v18 interestTokenForContentID:v13];

      v19 = [*(id *)(a1 + 48) interestTokens];
      [v19 addObject:v16];

      v20 = [*(id *)(a1 + 48) archiveStore];
      [v20 prepareForContentID:v13];

      v21 = [*(id *)(a1 + 48) archiveStore];
      [v21 addBlob:*(void *)(a1 + 40) name:@"config" contentID:v13];

      v22 = [NDOfflineTodayFeedOperation alloc];
      v23 = [*(id *)(a1 + 48) context];
      v24 = [*(id *)(a1 + 48) ANFHelper];
      v25 = [(NDOfflineTodayFeedOperation *)v22 initWithFeedConfig:v12 context:v23 ANFHelper:v24];

      *(void *)&buf = 0;
      *((void *)&buf + 1) = &buf;
      v46 = 0x3032000000;
      v47 = sub_10000606C;
      v48 = sub_10000607C;
      v49 = +[FCContentManifest empty];
      v26 = [*(id *)(a1 + 48) queue];
      [(NDOfflineTodayFeedOperation *)v25 setArchiveQueue:v26];

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100006084;
      v37[3] = &unk_100061720;
      v37[4] = *(void *)(a1 + 48);
      v27 = v13;
      v38 = v27;
      p_buf = &buf;
      [(NDOfflineTodayFeedOperation *)v25 setArchiveHandler:v37];
      v28 = [*(id *)(a1 + 48) queue];
      [(NDOfflineTodayFeedOperation *)v25 setFetchCompletionQueue:v28];

      v29 = _NSConcreteStackBlock;
      v30 = 3221225472;
      v31 = sub_100006140;
      v32 = &unk_100061770;
      v33 = *(void *)(a1 + 48);
      v34 = v27;
      v35 = v3;
      v36 = &buf;
      [(NDOfflineTodayFeedOperation *)v25 setFetchCompletionHandler:&v29];
      [(NDOfflineTodayFeedOperation *)v25 start];

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100005F38;
    v43[3] = &unk_1000616D0;
    v44 = v3;
    sub_100005F38((uint64_t)v43);
    v12 = v44;
  }
}

void sub_100005F18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005F38(uint64_t a1)
{
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TodayFeedService failed to adopt feed config data", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005FB4(uint64_t a1)
{
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TodayFeedService will ignore feed config because it's already downloaded, id=%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10000606C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000607C(uint64_t a1)
{
}

void sub_100006084(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  int v5 = [v3 archiveStore];
  [v5 addArchive:v4 forContentID:a1[5]];

  id v9 = [v4 manifest];

  uint64_t v6 = +[FCContentManifest manifestByMergingManifest:v9 withManifest:*(void *)(*(void *)(a1[6] + 8) + 40)];
  uint64_t v7 = *(void *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_100006140(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100006340;
    v17[3] = &unk_100061748;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    id v18 = v6;
    uint64_t v19 = v7;
    id v20 = v8;
    id v21 = *(id *)(a1 + 48);
    sub_100006340((uint64_t)v17);

    id v9 = v18;
  }
  else
  {
    v10 = [*(id *)(a1 + 32) archiveStore];
    [v10 addManifest:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forContentID:*(void *)(a1 + 40)];

    v11 = [*(id *)(a1 + 32) archiveStore];
    [v11 didCompleteContentID:*(void *)(a1 + 40)];

    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copyWithAssetsOnly];
    v12 = [*(id *)(a1 + 32) context];
    v13 = [v12 interestTokenForContentManifest:v9];

    v14 = [*(id *)(a1 + 32) interestTokens];
    [v14 addObject:v13];

    v15 = FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TodayFeedService successfully downloaded feed contents, id=%{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_100006340(uint64_t a1)
{
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_100047394(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  id v9 = [*(id *)(a1 + 40) archiveStore];
  [v9 pruneArchivesForContentID:*(void *)(a1 + 48)];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t sub_1000063B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void sub_100006488(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError errorWithDomain:FCErrorDomain code:8 userInfo:&__NSDictionary0__struct];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void sub_1000065BC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _latestTodayFeed];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100006684;
    v3[3] = &unk_1000616D0;
    id v4 = *(id *)(a1 + 40);
    sub_100006684((uint64_t)v3);
  }
}

void sub_100006684(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError errorWithDomain:FCErrorDomain code:8 userInfo:&__NSDictionary0__struct];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t sub_1000067A4()
{
  v0 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_100047404(v0);
  }
  return 0;
}

uint64_t sub_1000067EC()
{
  v0 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_100047448(v0);
  }
  return 0;
}

void sub_100006B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006B38(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_10004748C((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_100006B8C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006C54;
    v9[3] = &unk_100061828;
    id v10 = v7;
    sub_100006C54((uint64_t)v9);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void sub_100006C54(uint64_t a1)
{
  id v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_1000474F8(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

int64_t sub_100006DD8(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a3 compare:a2 options:64];
}

void sub_100007028(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007964(uint64_t a1)
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.newsd.todayclientconnection", v2);
  uint64_t v4 = (void *)qword_10006BC98;
  qword_10006BC98 = (uint64_t)v3;

  id v5 = objc_alloc((Class)NTTodayContext);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = (id)objc_opt_new();
  id v7 = [v5 initWithContentContext:v6 feedPersonalizerFactory:v9 todayBannerValidator:0 processVariant:1 accessQueue:qword_10006BC98 fetchQueue:*(void *)(a1 + 40)];
  uint64_t v8 = (void *)qword_10006BC90;
  qword_10006BC90 = (uint64_t)v7;
}

void sub_100007A34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained serviceHasNewTodayResults];
}

uint64_t sub_100007B40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007C60(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    v12 = NTXPCSuitableError();
  }
  else
  {
    v12 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id, id, id, void *, void))(v13 + 16))(v13, v14, v9, v10, v12, 0);
  }
}

void sub_100007F34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) todayContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007FE8;
  v5[3] = &unk_1000616D0;
  id v6 = *(id *)(a1 + 56);
  [v2 writeUserDidSeeHeadlinesWithAnalyticsElements:v3 atDate:v4 withCompletion:v5];
}

uint64_t sub_100007FE8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_100008148(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) todayContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000081FC;
  v5[3] = &unk_1000616D0;
  id v6 = *(id *)(a1 + 56);
  [v2 writeUserDidReadHeadlineWithAnalyticsElement:v3 atDate:v4 withCompletion:v5];
}

uint64_t sub_1000081FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_100008280(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_100008920(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) consumer];
  [v2 downloadProgressedForRequest:*(void *)(a1 + 40) progress:*(double *)(a1 + 48)];
}

void sub_100008A38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) consumer];
  [v2 downloadProgressedForRequest:*(void *)(a1 + 40) contentArchive:*(void *)(a1 + 48)];
}

void sub_100008B4C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) consumer];
  [v2 downloadFinishedForRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void sub_100008C78(uint64_t a1, void *a2)
{
  uint64_t v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v4[2]();
}

void sub_100008DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008E20(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained connection];

  if (v6)
  {
    [v6 scheduleSendBarrierBlock:v3];
  }
  else
  {
    id v7 = (void (**)(void))v3;
    v7[2]();
  }
}

uint64_t sub_100008F10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000911C(uint64_t a1)
{
  id v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_100047F90(a1, v2);
  }
}

uint64_t sub_100009168(uint64_t a1)
{
  id v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 connectionDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "consumer proxy did send message, connection=%{public}@", buf, 0xCu);
  }
  return FCPerformBlockOnMainThread();
}

id sub_10000928C(uint64_t a1)
{
  [*(id *)(a1 + 32) setSendingMesssage:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 _sendNextMessage];
}

void *sub_1000095CC()
{
  v0 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "found no last known requests in store", v2, 2u);
  }
  return &__NSArray0__struct;
}

void sub_10000987C()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_1000480D8();
  }
}

void sub_1000098C8()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_1000480D8();
  }
}

id sub_100009AC8()
{
  v0 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "found no last known limits in store", v3, 2u);
  }
  uint64_t v1 = +[NDDownloadLimits defaultLimits];

  return v1;
}

void sub_100009D44()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_1000481AC();
  }
}

void sub_100009D90()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_1000481AC();
  }
}

void sub_100009E68(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_10000A088(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _initMain];
}

id sub_10000A1C0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) batteryStateDidChange];
}

id sub_10000A43C(uint64_t a1)
{
  id v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 currentConsumer];
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 134218240;
    id v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "replacing consumer=%p with consumer=%p", (uint8_t *)&v13, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) currentConnection];

  if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000483CC();
  }
  uint64_t v8 = [NDDownloadConsumerProxy alloc];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) currentConnection];
  uint64_t v11 = [(NDDownloadConsumerProxy *)v8 initWithConsumer:v9 connection:v10];
  [*(id *)(a1 + 32) setCurrentConsumer:v11];

  return [*(id *)(a1 + 32) _catchUpConsumer];
}

id sub_10000A5A0(uint64_t a1)
{
  id v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 currentConsumer];
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 134218240;
    id v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "replacing consumer=%p with consumer=%p", (uint8_t *)&v13, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) currentConnection];

  if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000483CC();
  }
  uint64_t v8 = [NDDownloadConsumerProxy alloc];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) currentConnection];
  uint64_t v11 = [(NDDownloadConsumerProxy *)v8 initWithConsumer:v9 connection:v10];
  [*(id *)(a1 + 32) setCurrentConsumer:v11];

  return [*(id *)(a1 + 32) _catchUpConsumer];
}

void sub_10000A888(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) downloadRequests];
  unsigned __int8 v3 = [v2 isEqualToArray:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = (void *)FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = v4;
      id v7 = [v5 downloadRequests];
      id v8 = [v7 count];
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 134218242;
      id v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "replacing %lu requests with requests=%{public}@", (uint8_t *)&v12, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 32) store];
    [v11 setLastKnownRequests:v10];

    [*(id *)(a1 + 32) _pruneUnneededInterestTokens];
    [*(id *)(a1 + 32) _revisitDownloadQueue];
  }
}

void sub_10000A9C8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) downloadRequests];
  unsigned __int8 v3 = [v2 isEqualToArray:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = (void *)FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = v4;
      id v7 = [v5 downloadRequests];
      id v8 = [v7 count];
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 134218242;
      id v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "replacing %lu requests with requests=%{public}@", (uint8_t *)&v12, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 32) store];
    [v11 setLastKnownRequests:v10];

    [*(id *)(a1 + 32) _pruneUnneededInterestTokens];
    [*(id *)(a1 + 32) _revisitDownloadQueue];
  }
}

void sub_10000AC8C(uint64_t a1)
{
  id v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "replacing download limits with limits=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) store];
  [v5 setLastKnownLimits:v4];
}

void sub_10000AD5C(uint64_t a1)
{
  id v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "replacing download limits with limits=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) store];
  [v5 setLastKnownLimits:v4];
}

void sub_10000AFB8(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() _cacheLookupQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B078;
  v3[3] = &unk_100061A48;
  void v3[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fc_addMainThreadOperationWithBlock:", v3);
}

void sub_10000B078(id *a1)
{
  id v2 = [a1[4] currentConsumer];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B12C;
  v3[3] = &unk_100061A20;
  id v5 = a1[6];
  id v4 = a1[5];
  [v2 flushMessagesWithCompletion:v3];
}

uint64_t sub_10000B12C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000B13C(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() _cacheLookupQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B1FC;
  v3[3] = &unk_100061A48;
  void v3[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fc_addMainThreadOperationWithBlock:", v3);
}

void sub_10000B1FC(id *a1)
{
  id v2 = [a1[4] currentConsumer];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B2B0;
  v3[3] = &unk_100061A20;
  id v5 = a1[6];
  id v4 = a1[5];
  [v2 flushMessagesWithCompletion:v3];
}

uint64_t sub_10000B2B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000B730(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_10000B76C(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) activeDownloadRequest];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    id v5 = [*(id *)(a1 + 32) currentConsumer];
    [v5 downloadProgressedForRequest:*(void *)(a1 + 40) contentArchive:v14];

    int v6 = [*(id *)(a1 + 32) contentArchiveStore];
    uint64_t v7 = [*(id *)(a1 + 40) contentID];
    [v6 addArchive:v14 forContentID:v7];

    id v8 = [v14 manifest];
    uint64_t v9 = [*(id *)(a1 + 32) activeDownloadManifest];
    uint64_t v10 = +[FCContentManifest manifestByMergingManifest:v8 withManifest:v9];
    [*(id *)(a1 + 32) setActiveDownloadManifest:v10];

    uint64_t v11 = [*(id *)(a1 + 32) contentArchiveStore];
    int v12 = [*(id *)(a1 + 32) activeDownloadManifest];
    id v13 = [*(id *)(a1 + 40) contentID];
    [v11 addManifest:v12 forContentID:v13];
  }
}

void sub_10000B8D4(uint64_t a1, double a2)
{
  id v4 = [*(id *)(a1 + 32) activeDownloadRequest];
  id v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    int v6 = [*(id *)(a1 + 32) currentConsumer];
    [v6 downloadProgressedForRequest:*(void *)(a1 + 40) progress:a2];

    uint64_t v7 = *(void **)(a1 + 32);
    [v7 setActiveDownloadProgress:a2];
  }
}

void sub_10000B974(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  unsigned int v8 = [WeakRetained isCancelled];

  if (v8)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10000BE30;
    v35[3] = &unk_100061AC0;
    id v36 = *(id *)(a1 + 32);
    objc_copyWeak(&v38, (id *)(a1 + 64));
    id v37 = *(id *)(a1 + 56);
    sub_10000BE30((uint64_t)v35);

    objc_destroyWeak(&v38);
    id v9 = v36;
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [*(id *)(a1 + 40) activeDownloadRequest];

    if (v10 == v11)
    {
      int v12 = (void *)FCOfflineDownloadsLog;
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = *(void **)(a1 + 32);
        id v14 = v12;
        uint64_t v15 = [v13 contentID];
        id v16 = objc_loadWeakRetained((id *)(a1 + 64));
        v17 = [v16 shortOperationDescription];
        *(_DWORD *)buf = 138543874;
        v41 = v15;
        __int16 v42 = 2114;
        v43 = v17;
        __int16 v44 = 2114;
        id v45 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "processing completion for %{public}@ from %{public}@ with error=%{public}@", buf, 0x20u);
      }
      id v18 = [*(id *)(a1 + 40) activeDownloadManifest];
      id v9 = [v18 copyWithAssetsOnly];

      uint64_t v19 = [*(id *)(a1 + 40) contentContext];
      id v20 = [v19 interestTokenForContentManifest:v9];

      id v21 = [*(id *)(a1 + 40) interestTokensByContentID];
      v39[0] = *(void *)(a1 + 48);
      v39[1] = v20;
      v22 = +[NSArray arrayWithObjects:v39 count:2];
      uint64_t v23 = [*(id *)(a1 + 32) contentID];
      [v21 setObject:v22 forKey:v23];

      v24 = [*(id *)(a1 + 40) contentArchiveStore];
      v25 = [*(id *)(a1 + 32) contentID];
      if (v6)
      {
        [v24 pruneArchivesForContentID:v25];

        v26 = [*(id *)(a1 + 40) errorsByContentID];
        v27 = [*(id *)(a1 + 32) contentID];
        [v26 setObject:v6 forKey:v27];
      }
      else
      {
        [v24 didCompleteContentID:v25];

        v28 = [*(id *)(a1 + 40) downloadedContentIDs];
        v29 = [*(id *)(a1 + 32) contentID];
        [v28 addObject:v29];

        v26 = [*(id *)(a1 + 40) errorsByContentID];
        v27 = [*(id *)(a1 + 32) contentID];
        [v26 removeObjectForKey:v27];
      }

      v30 = [*(id *)(a1 + 40) currentConsumer];
      [v30 downloadFinishedForRequest:*(void *)(a1 + 32) error:v6];

      [*(id *)(a1 + 40) setActiveDownloadRequest:0];
      [*(id *)(a1 + 40) setActiveDownloadManifest:0];
      [*(id *)(a1 + 40) setActiveDownloadProgress:0.0];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000BF48;
      v31[3] = &unk_100061AC0;
      id v32 = *(id *)(a1 + 32);
      objc_copyWeak(&v34, (id *)(a1 + 64));
      id v33 = *(id *)(a1 + 56);
      sub_10000BF48((uint64_t)v31);

      objc_destroyWeak(&v34);
      id v9 = v32;
    }
  }
}

void sub_10000BE10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BE30(uint64_t a1)
{
  uint64_t v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 contentID];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v7 = [WeakRetained shortOperationDescription];
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    int v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ignoring completion for %{public}@ from %{public}@ since we cancelled it ourselves", (uint8_t *)&v9, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10000BF48(uint64_t a1)
{
  uint64_t v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 contentID];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v7 = [WeakRetained shortOperationDescription];
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    int v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ignoring completion for %{public}@ from %{public}@ it's no longer the active request", (uint8_t *)&v9, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_10000C0D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _revisitDownloadQueue];
}

id sub_10000C144(uint64_t a1)
{
  return [*(id *)(a1 + 32) _revisitDownloadQueue];
}

void sub_10000C5B0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contentArchiveStore];
  [v2 enableFlushingWithFlushingThreshold:0];

  id v3 = [*(id *)(a1 + 32) contentContext];
  [v3 enableFlushingWithFlushingThreshold:0];
}

id sub_10000C620(uint64_t a1)
{
  return [*(id *)(a1 + 32) _revisitDownloadQueue];
}

void sub_10000C628(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) prewarmGroup];
  dispatch_group_leave(v1);
}

id sub_10000CD8C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 downloadedContentIDs];
  id v5 = [v3 contentID];

  id v6 = [v4 containsObject:v5];
  return v6;
}

id sub_10000CDFC(id a1, NDDownloadRequest *a2)
{
  return [(NDDownloadRequest *)a2 contentID];
}

id sub_10000D07C(id a1, NDDownloadRequest *a2)
{
  return [(NDDownloadRequest *)a2 contentID];
}

void sub_10000D084(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ANFHelper];
  [v2 popInterest];

  [*(id *)(a1 + 32) _recordWhetherTasksAreUnfinished];
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_2;
  block[3] = &unk_100061828;
  id v5 = *(id *)(a1 + 40);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10000D3F8(unsigned char *a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [v3 options];
  if ((v4 & 1) != 0 && a1[32])
  {
    id v5 = (void *)FCOfflineDownloadsLog;
    uint64_t v6 = 0;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v5;
      unsigned int v8 = [v3 contentID];
      int v15 = 138543362;
      id v16 = v8;
      int v9 = "filtering download request for %{public}@ because there's no wifi";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0xCu);

      uint64_t v6 = 0;
    }
  }
  else if ((v4 & 4) != 0 && a1[33])
  {
    uint64_t v10 = (void *)FCOfflineDownloadsLog;
    uint64_t v6 = 0;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v10;
      unsigned int v8 = [v3 contentID];
      int v15 = 138543362;
      id v16 = v8;
      int v9 = "filtering download request for %{public}@ because of low-data mode";
      goto LABEL_21;
    }
  }
  else if ((v4 & 2) != 0 && a1[34])
  {
    __int16 v11 = (void *)FCOfflineDownloadsLog;
    uint64_t v6 = 0;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v11;
      unsigned int v8 = [v3 contentID];
      int v15 = 138543362;
      id v16 = v8;
      int v9 = "filtering download request for %{public}@ because of low-power mode";
      goto LABEL_21;
    }
  }
  else if ((v4 & 8) != 0 && a1[35])
  {
    int v12 = (void *)FCOfflineDownloadsLog;
    uint64_t v6 = 0;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v12;
      unsigned int v8 = [v3 contentID];
      int v15 = 138543362;
      id v16 = v8;
      int v9 = "filtering download request for %{public}@ because of battery power";
      goto LABEL_21;
    }
  }
  else
  {
    if ((v4 & 0x10) == 0 || !a1[36])
    {
      uint64_t v6 = 1;
      goto LABEL_23;
    }
    id v13 = (void *)FCOfflineDownloadsLog;
    uint64_t v6 = 0;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v13;
      unsigned int v8 = [v3 contentID];
      int v15 = 138543362;
      id v16 = v8;
      int v9 = "filtering download request for %{public}@ because of low storage";
      goto LABEL_21;
    }
  }
LABEL_23:

  return v6;
}

BOOL sub_10000D754(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [*(id *)(a1 + 32) downloadedContentIDs];
  id v5 = [v3 contentID];
  unsigned __int8 v6 = [v4 containsObject:v5];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    unsigned int v8 = [*(id *)(a1 + 32) errorsByContentID];
    int v9 = [v3 contentID];
    uint64_t v10 = [v8 objectForKey:v9];

    BOOL v7 = !v10 || ([*(id *)(a1 + 32) _isFatalError:v10] & 1) == 0;
  }

  return v7;
}

void sub_10000DA30(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned __int8 v4 = objc_msgSend(*(id *)(a1 + 32), "downloadRequests", 0);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      unsigned int v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) contentID];
        [v3 addObject:v9];

        unsigned int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void sub_10000DFA8(id a1)
{
  id v1 = objc_alloc_init((Class)NSOperationQueue);
  uint64_t v2 = (void *)qword_10006BCA8;
  qword_10006BCA8 = (uint64_t)v1;

  [(id)qword_10006BCA8 setName:@"com.apple.newsd.download.cacheLookupQueue"];
  id v3 = (void *)qword_10006BCA8;

  [v3 setMaxConcurrentOperationCount:1];
}

void sub_10000E05C(id a1)
{
  id v1 = objc_alloc_init((Class)NSOperationQueue);
  uint64_t v2 = (void *)qword_10006BCB8;
  qword_10006BCB8 = (uint64_t)v1;

  [(id)qword_10006BCB8 setName:@"com.apple.newsd.download.downloadQueue"];
  id v3 = (void *)qword_10006BCB8;

  [v3 setMaxConcurrentOperationCount:1];
}

void sub_10000E2C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_10000E724(uint64_t a1)
{
  uint64_t v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TodayFeedService XPC connection invalidated, connection=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000E7CC(uint64_t a1)
{
  uint64_t v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TodayFeedService XPC connection interrupted, connection=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000EBC8(id *a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = objc_msgSend(a1[4], "fc_NewsArticleID");
    if (v3)
    {
      id v4 = objc_alloc((Class)FCArticleHeadlinesFetchOperation);
      uint64_t v5 = [a1[5] contentContext];
      id v14 = v3;
      id v6 = +[NSArray arrayWithObjects:&v14 count:1];
      id v7 = [v4 initWithContext:v5 articleIDs:v6 ignoreCacheForArticleIDs:&__NSArray0__struct];

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000EE14;
      v8[3] = &unk_100061C40;
      id v9 = a1[6];
      [v7 setFetchCompletionBlock:v8];
      [v7 start];
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000EDFC;
      v10[3] = &unk_1000616D0;
      id v11 = a1[6];
      sub_10000EDFC((uint64_t)v10);
      id v7 = v11;
    }
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000EDE4;
    v12[3] = &unk_1000616D0;
    id v13 = a1[6];
    sub_10000EDE4((uint64_t)v12);
    uint64_t v3 = v13;
  }
}

uint64_t sub_10000EDE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000EDFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EE14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fetchedObject];
  id v8 = [v4 firstObject];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v8 contentURL];
  id v7 = [v3 error];

  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);
}

void sub_10000EF88(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) endpointConnection];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000F0BC;
    v6[3] = &unk_100061C90;
    id v4 = &v7;
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v3 resolveWebURL:v5 withQualityOfService:25 completion:v6];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000F0A4;
    v8[3] = &unk_1000616D0;
    id v4 = &v9;
    id v9 = *(id *)(a1 + 48);
    sub_10000F0A4((uint64_t)v8);
  }
}

uint64_t sub_10000F0A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F0BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = +[NSURL fc_NewsURLForArticleID:a2 hardPaywall:1];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000F1B0;
    v7[3] = &unk_100061A20;
    id v9 = *(id *)(a1 + 32);
    id v8 = v5;
    sub_10000F1B0((uint64_t)v7);
  }
}

uint64_t sub_10000F1B0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_10000F25C(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) endpointConnection];
    [v3 fetchWebURLBloomFilterInfoWithQualityOfService:25 completion:*(void *)(a1 + 40)];
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000F32C;
    v4[3] = &unk_1000616D0;
    id v5 = *(id *)(a1 + 40);
    sub_10000F32C((uint64_t)v4);
  }
}

void sub_10000F32C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NTPBBloomFilterInfo fc_emptyBloomFilterInfo];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

uint64_t sub_10000F580(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F594(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F5A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) isContentStoreFrontSupported];
  id v3 = *(uint64_t (**)(uint64_t, id))(v1 + 16);

  return v3(v1, v2);
}

id sub_10000FC98(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleArchive:a2];
}

void sub_10000FCA4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 _handleError:a3];
  [*(id *)(a1 + 32) _handleInterestToken:v6];

  id v7 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v7);
}

id sub_10000FD0C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 context];
  id v5 = [v4 assetManager];
  id v6 = [v5 assetHandleForURL:v3 lifetimeHint:0];

  return v6;
}

id sub_10000FD8C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleArchive:a2];
}

id sub_10000FD98(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleInterestToken:a2];
}

void sub_10000FDA4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 error];
  [v3 _handleError:v4];

  id v5 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v5);
}

void sub_10000FE04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ANFHelper];
  [v2 popInterest];

  id v3 = *(void **)(a1 + 32);
  id v5 = [v3 resultErrors];
  id v4 = [v5 firstObject];
  [v3 finishedPerformingOperationWithError:v4];
}

void sub_10000FFD4(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) fetchCompletionHandler];
  id v2 = [*(id *)(a1 + 32) resultInterestTokens];
  id v3 = [v2 readOnlyArray];
  v4[2](v4, v3, *(void *)(a1 + 40));
}

void sub_1000101A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) progressHandler];
  [*(id *)(a1 + 32) progress];
  v2[2]();
}

void sub_100010384(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) archiveHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

void sub_100010B24(uint64_t a1)
{
  id v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated, connection=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100010BCC(uint64_t a1)
{
  id v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted, connection=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

id sub_1000112B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelSystemTask];
}

void sub_100011418(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001143C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleSystemTask:v3];
}

void sub_10001184C()
{
  v0 = FCNotificationsLog;
  if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "notification pool refresh task has already been submitted", v1, 2u);
  }
}

id sub_1000119C8(uint64_t a1)
{
  uint64_t v2 = FCNotificationsLog;
  if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "did handle notification pool refresh task", v4, 2u);
  }
  return [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_100011F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011F18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011F28(uint64_t a1)
{
}

void sub_100011F30(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cacheCoordinator];
  id v3 = [v2 allKeys];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011FF0;
  v7[3] = &unk_100061E38;
  void v7[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "fc_arrayOfObjectsPassingTest:", v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id sub_100011FF0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _isContentIDComplete:a2];
}

void sub_1000120DC(uint64_t a1)
{
  uint64_t v2 = +[NSFileManager defaultManager];
  unsigned int v3 = [v2 fileExistsAtPath:*(void *)(a1 + 32)];

  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    [v4 _pruneArchivesFromContainer:v5 forContentID:v6];
  }
  else
  {
    id v7 = +[NSFileManager defaultManager];
    uint64_t v8 = *(void *)(a1 + 32);
    id v14 = 0;
    unsigned int v9 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v10 = v14;

    id v11 = FCOfflineDownloadsLog;
    if (v9)
    {
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "content archive store created container for contentID=%{public}@", buf, 0xCu);
      }
      id v13 = [*(id *)(a1 + 40) cacheCoordinator];
      [v13 didInsertKeyIntoCache:*(void *)(a1 + 48)];
    }
    else if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR))
    {
      sub_100048788(a1);
    }
  }
}

id sub_10001235C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pruneArchivesFromContainer:*(void *)(a1 + 40) forContentID:*(void *)(a1 + 48)];
}

void sub_100012544()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_1000487FC();
  }
}

void sub_100012590(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = 0;
  unsigned __int8 v4 = [v2 writeToFile:v3 options:0 error:&v12];
  id v5 = v12;
  if (v4)
  {
    uint64_t v6 = FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "content archive store added archive for contentID=%{public}@, archivePath=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000126F4;
    v9[3] = &unk_1000618B8;
    id v10 = *(id *)(a1 + 48);
    id v11 = v5;
    ((void (*)(void *))sub_1000126F4)(v9);
  }
}

void sub_1000126F4()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_100048864();
  }
}

void sub_10001291C()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_1000488CC();
  }
}

void sub_100012968(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = 0;
  unsigned __int8 v4 = [v2 writeToFile:v3 options:1 error:&v12];
  id v5 = v12;
  if (v4)
  {
    uint64_t v6 = FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "content archive store added manifest for contentID=%{public}@, manifestPath=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012ACC;
    v9[3] = &unk_1000618B8;
    id v10 = *(id *)(a1 + 48);
    id v11 = v5;
    ((void (*)(void *))sub_100012ACC)(v9);
  }
}

void sub_100012ACC()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_100048934();
  }
}

void sub_100012C60(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v14 = 0;
  unsigned __int8 v4 = [v2 writeToFile:v3 options:0 error:&v14];
  id v5 = v14;
  if (v4)
  {
    uint64_t v6 = FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "content archive store added blob for name=%{public}@, contentID=%{public}@, manifestPath=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100012DE4;
    v10[3] = &unk_100061980;
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v13 = v5;
    ((void (*)(void *))sub_100012DE4)(v10);
  }
}

void sub_100012DE4()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_10004899C();
  }
}

void sub_100012F0C(uint64_t a1)
{
  uint64_t v2 = +[NSData data];
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = 0;
  unsigned __int8 v4 = [v2 writeToFile:v3 options:0 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100012FF4;
    v6[3] = &unk_1000618B8;
    id v7 = *(id *)(a1 + 40);
    id v8 = v5;
    ((void (*)(void *))sub_100012FF4)(v6);
  }
}

void sub_100012FF4()
{
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
    sub_100048A18();
  }
}

void sub_100013144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001315C(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 fileExistsAtPath:*(void *)(a1 + 32)];
}

void sub_100013474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013490(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSData dataWithContentsOfFile:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

void sub_100013604(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = +[NSFileManager defaultManager];
  uint64_t v3 = [v2 subpathsOfDirectoryAtPath:*(void *)(a1 + 32) error:0];

  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 pathExtension];
        unsigned int v10 = [v9 isEqualToString:@"contentArchive"];

        if (v10)
        {
          id v11 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v8];
          id v12 = +[FCContentArchive archiveWithPersistedArchivePath:v11];
          objc_msgSend(*(id *)(a1 + 40), "fc_safelyAddObject:", v12);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

void sub_100013960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001397C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSData dataWithContentsOfFile:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

void sub_100013B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013BA8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v7 = 0;
  uint64_t v3 = [v2 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v7];
  id v4 = v7;
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR))
  {
    sub_100048AF0();
  }
}

void sub_1000147C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000147E0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100014800(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_100014DBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)FCConfigurationManager);
  uint64_t v5 = +[FCContextConfiguration defaultConfiguration];
  uint64_t v6 = [*(id *)(a1 + 32) cacheDirectoryFileURL];
  id v7 = [v3 resolveProtocol:&OBJC_PROTOCOL___FCFeldsparIDProvider];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  unsigned int v10 = [v3 resolveClass:objc_opt_class()];

  id v11 = [v4 initWithContextConfiguration:v5 contentHostDirectoryFileURL:v6 feldsparIDProvider:v7 appShortVersionString:v9 buildNumberString:v8 networkBehaviorMonitor:v10 appActivityMonitor:0 applicationState:2];

  return v11;
}

id sub_100014ECC(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  return v3;
}

id sub_100014F2C(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  return v3;
}

id sub_100014F8C(uint64_t a1, void *a2)
{
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v5 = a2;
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.newsd.analytics.urlsessionqueue", v4);

  id v7 = objc_alloc((Class)NDAnalyticsEnvelopeManager);
  uint64_t v8 = [v5 resolveProtocol:&OBJC_PROTOCOL___FCNewsAppConfigurationManager];
  uint64_t v9 = [v5 resolveClass:objc_opt_class()];

  unsigned int v10 = [*(id *)(a1 + 32) documentDirectoryFileURL];
  id v11 = [v7 initWithAppConfigurationManager:v8 telemetryUploader:v9 storeDirectoryFileURL:v10 URLSessionQueue:v6];

  return v11;
}

void sub_100015090(id a1, TFResolver *a2, NDAnalyticsEnvelopeManager *a3)
{
  id v3 = a3;
  id v4 = (const char *)kNSURLSessionLaunchOnDemandNotificationName;
  id v5 = [(NDAnalyticsEnvelopeManager *)v3 URLSessionQueue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001514C;
  handler[3] = &unk_100061FC8;
  uint64_t v8 = v3;
  dispatch_queue_t v6 = v3;
  xpc_set_event_stream_handler(v4, v5, handler);
}

void sub_10001514C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)os_transaction_create();
  string = xpc_dictionary_get_string(v3, kNSURLSessionLaunchOnDemandSessionIdentifierKey);

  dispatch_queue_t v6 = +[NSString stringWithCString:string encoding:4];
  id v7 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = nullsub_3;
  v9[3] = &unk_100061828;
  id v10 = v4;
  id v8 = v4;
  [v7 handleLaunchEventForBackgroundSessionWithIdentifier:v6 completion:v9];
}

id sub_100015244(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [NDAnalyticsServiceRouter alloc];
  id v4 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v8 = v4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  dispatch_queue_t v6 = [(NDAnalyticsServiceRouter *)v3 initWithServices:v5];

  return v6;
}

id sub_100015328(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)FCContentContext);
  id v5 = +[FCContextConfiguration defaultConfiguration];
  dispatch_queue_t v6 = [v3 resolveProtocol:&OBJC_PROTOCOL___FCNewsAppConfigurationManager];
  id v7 = [*(id *)(a1 + 32) cacheDirectoryFileURL];
  id v8 = [v3 resolveClass:objc_opt_class()];

  uint64_t v9 = +[FCNetworkReachability sharedNetworkReachability];
  id v10 = [v4 initWithConfiguration:v5 configurationManager:v6 contentHostDirectory:v7 networkBehaviorMonitor:v8 networkReachability:v9 desiredHeadlineFieldOptions:0xF87FFFFC1 feedUsage:10 assetKeyManagerDelegate:0 appActivityMonitor:0 backgroundTaskable:0 pptContext:0];

  return v10;
}

id sub_100015458(id a1, TFResolver *a2)
{
  id v2 = objc_alloc_init((Class)NDANFHelperProxyWithFallback);

  return v2;
}

id sub_100015488(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [NDURLResolutionService alloc];
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCContentContext];

  id v5 = [(NDURLResolutionService *)v3 initWithContentContext:v4];

  return v5;
}

id sub_10001550C(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [NDNotificationPoolRefreshManager alloc];
  id v4 = [(TFResolver *)v2 resolveClass:objc_opt_class()];
  id v5 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCNewsAppConfigurationManager];

  dispatch_queue_t v6 = [(NDNotificationPoolRefreshManager *)v3 initWithNotificationPool:v4 configManager:v5];

  return v6;
}

id sub_1000155B8(id a1, TFResolver *a2)
{
  id v2 = objc_alloc_init(NDContentVariantProvider);

  return v2;
}

id sub_1000155E8(id a1, TFResolver *a2)
{
  id v2 = [objc_alloc((Class)FCNetworkBehaviorMonitor) initForLoggingOnly];

  return v2;
}

id sub_10001561C(id a1, TFResolver *a2)
{
  return +[FCFeldsparIDProvider sharedInstance];
}

id sub_100015628(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = objc_alloc((Class)FCNotificationPoolService);
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCContentContext];
  id v5 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCContentVariantProviding];

  id v6 = [v3 initWithContext:v4 contentVariantProvider:v5];

  return v6;
}

int main(int argc, const char **argv, const char **envp)
{
  +[NSURLCache setSharedURLCache:](NSURLCache, "setSharedURLCache:", [objc_alloc((Class)NSURLCache) initWithMemoryCapacity:0 diskCapacity:0 diskPath:0]);
  id v3 = +[NewsdContainer tfResolver];
  uint64_t v4 = [v3 resolveProtocol:&OBJC_PROTOCOL___FCContentContext];
  uint64_t v5 = [v3 resolveProtocol:&OBJC_PROTOCOL___FCANFHelper];
  uint64_t v6 = [v3 resolveClass:objc_opt_class()];
  uint64_t v7 = [v3 resolveProtocol:&OBJC_PROTOCOL___NDURLResolutionService];
  [v3 resolveProtocol:&OBJC_PROTOCOL___NDDelayedNotificationSchedulerType];
  [(id)objc_claimAutoreleasedReturnValue() activate];
  [v3 resolveClass:objc_opt_class()];
  [(id)objc_claimAutoreleasedReturnValue() activate];
  uint64_t v8 = objc_opt_new();
  v18[0] = @"com.apple.newsd.analytics";
  v18[1] = @"com.apple.newsd.today";
  v18[2] = @"com.apple.newsd.url-resolution";
  v18[3] = @"com.apple.newsd.download";
  v18[4] = @"com.apple.newsd.live-activity";
  v18[5] = @"com.apple.newsd.today-feed";
  uint64_t v9 = +[NSArray arrayWithObjects:v18 count:6];
  id v10 = [[NDAnalyticsServiceListenerDelegate alloc] initWithService:v6];
  id v11 = -[NDTodayServiceListenerDelegate initWithContentContext:fetchQueue:]([NDTodayServiceListenerDelegate alloc], "initWithContentContext:fetchQueue:", v4, v8, v10);
  v17[1] = v11;
  id v12 = [[NDURLResolutionListenerDelegate alloc] initWithURLResolutionService:v7];
  v17[2] = v12;
  long long v13 = [[NDDownloadServiceListenerDelegate alloc] initWithContentContext:v4 ANFHelper:v5];
  v17[3] = v13;
  long long v14 = objc_alloc_init(NDLiveActivityServiceListenerDelegate);
  void v17[4] = v14;
  long long v15 = [[NDTodayFeedServiceListenerDelegate alloc] initWithContentContext:v4 ANFHelper:v5];
  v17[5] = v15;
  uint64_t v16 = +[NSArray arrayWithObjects:v17 count:6];

  objc_msgSend(v9, "fc_enumerateSideBySideWithArray:reverse:block:", v16, 0, &stru_100062108);
  dispatch_main();
}

void sub_100016000(id a1, NSString *a2, NSXPCListenerDelegate *a3, BOOL *a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  id object = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v6];

  [object setDelegate:v5];
  objc_setAssociatedObject(object, off_10006A9D0, v5, (void *)1);

  [object resume];
}

BOOL sub_1000160A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000160B8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100016100()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10001612C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100016180(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  uint64_t v4 = type metadata accessor for TimeZone();
  v3[11] = v4;
  v3[12] = *(void *)(v4 - 8);
  v3[13] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Calendar();
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  uint8_t v3[16] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Date();
  v3[17] = v6;
  v3[18] = *(void *)(v6 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return _swift_task_switch(sub_10001630C, 0, 0);
}

uint64_t sub_10001630C()
{
  Swift::UInt v1 = v0;
  id v2 = (id)NewsCoreUserDefaults();
  id v3 = [v2 integerForKey:FCDelayedNotificationFrequencySharedPreferenceKey];

  if (!v3)
  {
    id v16 = [*(id *)(v0[10] + 16) possiblyUnfetchedAppConfiguration];
    if ([v16 respondsToSelector:"delayedNotificationSchedulerConfigurationData"])
    {
      id v17 = [v16 delayedNotificationSchedulerConfigurationData];
      swift_unknownObjectRelease();
      if (v17)
      {
        uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v20 = v19;

        type metadata accessor for JSONDecoder();
        swift_allocObject();
        sub_10001722C(v18, v20);
        JSONDecoder.init()();
        sub_100017284();
        dispatch thunk of JSONDecoder.decode<A>(_:from:)();
        uint64_t v24 = v0[9];
        swift_release();
        int v25 = *((unsigned __int8 *)v0 + 16);
        v26 = sub_100034760(v24, *((unsigned __int8 *)v0 + 16), v0[3]);
        if (v28)
        {
          swift_bridgeObjectRelease();
          sub_1000171D8();
          swift_allocError();
          *id v34 = 2;
        }
        else
        {
          v29 = v26;
          uint64_t v30 = v27;
          uint64_t v31 = sub_100016B1C();
          if ((v32 & 1) == 0)
          {
            if (v25) {
              sub_100017330(v31, 0.0, 1.0);
            }
            else {
              double v33 = sub_10003465C();
            }
            double v36 = v33;
            uint64_t result = swift_bridgeObjectRelease();
            uint64_t v37 = v30 - (void)v29;
            uint64_t v70 = v30;
            if (__OFSUB__(v30, v29))
            {
              __break(1u);
            }
            else
            {
              uint64_t v38 = v0[19];
              uint64_t v39 = v0[18];
              uint64_t v65 = v0[17];
              uint64_t v41 = v0[15];
              uint64_t v40 = v1[16];
              uint64_t v42 = v1[14];
              v73 = v1;
              double v43 = floor(v36 * (double)v37);
              static Calendar.current.getter();
              Calendar.startOfDay(for:)();
              (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
              Date.addingTimeInterval(_:)();
              v64 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
              v64(v38, v65);
              __int16 v44 = (void *)FCNotificationsLog;
              sub_1000170E8((uint64_t *)&unk_10006AB60);
              uint64_t v45 = swift_allocObject();
              *(_OWORD *)(v45 + 16) = xmmword_10004E5E0;
              sub_10001712C();
              id v63 = v44;
              uint64_t v46 = dispatch thunk of CustomStringConvertible.description.getter();
              uint64_t v48 = v47;
              *(void *)(v45 + 56) = &type metadata for String;
              unint64_t v49 = sub_100017184();
              *(void *)(v45 + 64) = v49;
              *(void *)(v45 + 32) = v46;
              *(void *)(v45 + 40) = v48;
              v0 = v73;
              v73[6] = v29;
              v73[7] = v70;
              v73[4] = 0;
              v73[5] = 0xE000000000000000;
              _print_unlocked<A, B>(_:_:)();
              v50._countAndFlagsBits = 3943982;
              v50._id object = (void *)0xE300000000000000;
              String.append(_:)(v50);
              _print_unlocked<A, B>(_:_:)();
              uint64_t v51 = v73[4];
              uint64_t v52 = v73[5];
              *(void *)(v45 + 96) = &type metadata for String;
              *(void *)(v45 + 104) = v49;
              *(void *)(v45 + 72) = v51;
              *(void *)(v45 + 80) = v52;
              uint64_t v53 = swift_allocObject();
              *(_OWORD *)(v53 + 16) = xmmword_10004E5F0;
              *(void *)(v53 + 56) = &type metadata for Double;
              *(void *)(v53 + 64) = &protocol witness table for Double;
              *(double *)(v53 + 32) = v36;
              uint64_t result = String.init(format:_:)();
              *(void *)(v45 + 136) = &type metadata for String;
              *(void *)(v45 + 144) = v49;
              *(void *)(v45 + 112) = result;
              *(void *)(v45 + 120) = v54;
              if ((~*(void *)&v43 & 0x7FF0000000000000) != 0)
              {
                if (v43 > -9.22337204e18)
                {
                  if (v43 < 9.22337204e18)
                  {
                    uint64_t v55 = v73[19];
                    uint64_t v56 = v73[17];
                    uint64_t v57 = v73[12];
                    uint64_t v58 = v73[13];
                    uint64_t v66 = v73[11];
                    uint64_t v67 = v73[20];
                    uint64_t v68 = v73[8];
                    uint64_t v71 = v73[18];
                    *(void *)(v45 + 176) = &type metadata for Int;
                    *(void *)(v45 + 184) = &protocol witness table for Int;
                    *(void *)(v45 + 152) = (uint64_t)v43;
                    uint64_t v59 = dispatch thunk of CustomStringConvertible.description.getter();
                    *(void *)(v45 + 216) = &type metadata for String;
                    *(void *)(v45 + 224) = v49;
                    *(void *)(v45 + 192) = v59;
                    *(void *)(v45 + 200) = v60;
                    static os_log_type_t.default.getter();
                    os_log(_:dso:log:type:_:)();
                    swift_bridgeObjectRelease();

                    static TimeZone.current.getter();
                    Date.init()();
                    TimeZone.secondsFromGMT(for:)();
                    v64(v55, v56);
                    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v66);
                    id v61 = (id)NewsCoreUserDefaults();
                    Class isa = Int._bridgeToObjectiveC()().super.super.isa;
                    [v61 setObject:isa forKey:FCDelayedNotificationSecondsFromGMTKey];

                    sub_1000172D8(v18, v20);
                    sub_1000172D8(v18, v20);
                    (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 32))(v68, v67, v56);
                    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v71 + 56))(v68, 0, 1, v56);
                    goto LABEL_8;
                  }
LABEL_27:
                  __break(1u);
                  return result;
                }
LABEL_26:
                __break(1u);
                goto LABEL_27;
              }
            }
            __break(1u);
            goto LABEL_26;
          }
          swift_bridgeObjectRelease();
          sub_1000171D8();
          swift_allocError();
          unsigned char *v35 = 0;
        }
        swift_willThrow();
        sub_1000172D8(v18, v20);
        sub_1000172D8(v18, v20);
        goto LABEL_8;
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
    sub_1000171D8();
    swift_allocError();
    *id v21 = 1;
    swift_willThrow();
    goto LABEL_8;
  }
  uint64_t v4 = v0[17];
  uint64_t v69 = v0[18];
  uint64_t v5 = v0[8];
  Date.addingTimeInterval(_:)();
  uint64_t v6 = (void *)FCNotificationsLog;
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10004E5D0;
  sub_10001712C();
  id v8 = v6;
  uint64_t v9 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v11 = v10;
  *(void *)(v7 + 56) = &type metadata for String;
  v72 = v1;
  unint64_t v12 = sub_100017184();
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v11;
  *(void *)(v7 + 96) = &type metadata for Int;
  *(void *)(v7 + 104) = &protocol witness table for Int;
  *(void *)(v7 + 64) = v12;
  *(void *)(v7 + 72) = v3;
  uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
  *(void *)(v7 + 136) = &type metadata for String;
  *(void *)(v7 + 144) = v12;
  *(void *)(v7 + 112) = v13;
  *(void *)(v7 + 120) = v14;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  uint64_t v15 = v5;
  v0 = v72;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v69 + 56))(v15, 0, 1, v4);
LABEL_8:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_100016B1C()
{
  uint64_t v0 = type metadata accessor for TimeZone();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Calendar();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DateComponents();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.current.getter();
  static TimeZone.current.getter();
  Calendar.dateComponents(in:from:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = DateComponents.hour.getter();
  if ((v13 & 1) != 0
    || (uint64_t v14 = v12, v15 = DateComponents.minute.getter(), (v16 & 1) != 0)
    || (v17 = v15, uint64_t v18 = DateComponents.second.getter(), (v19 & 1) != 0)
    || (uint64_t v20 = v18, result = DateComponents.weekday.getter(), (v22 & 1) != 0))
  {
    id v28 = FCNotificationsLog;
    static os_log_type_t.error.getter();
    sub_1000170E8((uint64_t *)&unk_10006AB60);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_10004E5F0;
    type metadata accessor for Date();
    sub_10001712C();
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v32 = v31;
    *(void *)(v29 + 56) = &type metadata for String;
    *(void *)(v29 + 64) = sub_100017184();
    *(void *)(v29 + 32) = v30;
    *(void *)(v29 + 40) = v32;
    os_log(_:dso:log:type:_:)();

    swift_bridgeObjectRelease();
    uint64_t v27 = 0;
    goto LABEL_12;
  }
  if ((unsigned __int128)(v14 * (__int128)60) >> 64 != (60 * v14) >> 63)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v23 = 3600 * v14;
  if ((unsigned __int128)(60 * v14 * (__int128)60) >> 64 != (3600 * v14) >> 63)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v24 = 60 * v17;
  if ((unsigned __int128)(v17 * (__int128)60) >> 64 != (60 * v17) >> 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  BOOL v25 = __OFADD__(v23, v24);
  uint64_t v26 = v23 + v24;
  if (v25)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (!__OFADD__(v26, v20))
  {
    uint64_t v27 = result;
LABEL_12:
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v27;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10001708C()
{
  swift_unknownObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for DelayedNotificationTimetableFactory()
{
  return self;
}

uint64_t sub_1000170E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10001712C()
{
  unint64_t result = qword_10006BAD0;
  if (!qword_10006BAD0)
  {
    type metadata accessor for Date();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10006BAD0);
  }
  return result;
}

unint64_t sub_100017184()
{
  unint64_t result = qword_10006AB70;
  if (!qword_10006AB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AB70);
  }
  return result;
}

unint64_t sub_1000171D8()
{
  unint64_t result = qword_10006AB78;
  if (!qword_10006AB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AB78);
  }
  return result;
}

uint64_t sub_10001722C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

unint64_t sub_100017284()
{
  unint64_t result = qword_10006AB80;
  if (!qword_10006AB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AB80);
  }
  return result;
}

uint64_t sub_1000172D8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_100017330(uint64_t result, double a2, double a3)
{
  if (a2 == a3)
  {
    __break(1u);
    goto LABEL_7;
  }
  double v5 = a3 - a2;
  if ((~COERCE__INT64(a3 - a2) & 0x7FF0000000000000) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = swift_stdlib_random();
  if (v5 * ((double)0 * 1.11022302e-16) + a2 == a3) {
    return sub_100017330(v6, a2, a3);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for DelayedNotificationTimetableFactory.Errors(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationTimetableFactory.Errors(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DelayedNotificationTimetableFactory.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100017548);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_100017570(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001757C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactory.Errors()
{
  return &type metadata for DelayedNotificationTimetableFactory.Errors;
}

__n128 initializeWithTake for DelayedNotificationTimetableFactoryConfiguration(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000175A0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000175C0(uint64_t result, int a2, int a3)
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

void type metadata accessor for _NSRange()
{
  if (!qword_10006AB88)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10006AB88);
    }
  }
}

unint64_t sub_100017644()
{
  unint64_t result = qword_10006AB90;
  if (!qword_10006AB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AB90);
  }
  return result;
}

id sub_100017698(void *a1)
{
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006AD00);
  id result = (id)dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v6)
  {
    sub_100017A60(a1, a1[3]);
    sub_1000170E8(&qword_10006AD08);
    id result = (id)dispatch thunk of ResolverType.resolve<A>(_:)();
    if (v4[3])
    {
      id v3 = objc_allocWithZone((Class)type metadata accessor for LiveActivityService());
      return sub_10001A89C((uint64_t)v5, (uint64_t)v4);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100017760()
{
  return Accessor.init(_:)();
}

void sub_1000177B4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1000177C0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for LiveActivityAssembly()
{
  return self;
}

uint64_t sub_1000177F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Configurable.setting<A>(_:)(a1, *v5, a5);
}

uint64_t sub_100017828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Configurable.setting<A>(_:defaultValue:)(a1, a2, *v6, a6);
}

uint64_t sub_100017858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return Configurable.setting<A>(_:_:)(a1, a2, a3, *v7, a7);
}

uint64_t sub_100017888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, *v8, a8);
}

uint64_t sub_1000178B8()
{
  uint64_t v0 = type metadata accessor for Scope();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProxyContainer.public.getter();
  type metadata accessor for LiveActivityService();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Scope.singleton(_:), v0);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  ProxyContainer.public.getter();
  sub_1000170E8(&qword_10006ACF8);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  return swift_release();
}

void *sub_100017A60(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100017B8C(uint64_t a1, unint64_t a2, const char *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.liveActivityDaemon.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    char v16 = a3;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = v6;
    uint64_t v13 = a1;
    uint64_t v14 = (uint8_t *)v12;
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100024BC0(v13, a2, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v16, v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

id sub_100017E04()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LiveActivityServiceListenerDelegate()
{
  return self;
}

uint64_t sub_100017E70(void *a1)
{
  uint64_t v47 = type metadata accessor for XPCInterface();
  uint64_t v2 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v46 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MachService();
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  __chkstk_darwin(v4);
  double v43 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004E5F0;
  *(void *)(v10 + 56) = sub_100018490();
  *(void *)(v10 + 64) = sub_1000184D0();
  *(void *)(v10 + 32) = a1;
  id v11 = a1;
  uint64_t v12 = String.init(format:_:)();
  unint64_t v14 = v13;
  static Logger.liveActivityDaemon.getter();
  id v15 = v11;
  swift_bridgeObjectRetain_n();
  id v16 = v15;
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v39 = v7;
    uint64_t v40 = v6;
    uint64_t v42 = v2;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v38 = (void **)swift_slowAlloc();
    aBlock = v38;
    *(_DWORD *)uint64_t v19 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v41 = v12;
    uint64_t v49 = sub_100024BC0(v12, v14, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 12) = 2082;
    id v20 = [v16 serviceName];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v24 = v23;
    }
    else
    {
      unint64_t v24 = 0xE500000000000000;
      uint64_t v22 = 0x3E6C696E3CLL;
    }
    uint64_t v49 = sub_100024BC0(v22, v24, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "will accept new XPC connection, connection=%{public}s, serviceName=%{public}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v40);
    uint64_t v26 = v47;
    uint64_t v25 = v48;
    uint64_t v12 = v41;
    uint64_t v2 = v42;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v26 = v47;
    uint64_t v25 = v48;
  }
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v12;
  *(void *)(v27 + 24) = v14;
  uint64_t v54 = sub_100018560;
  uint64_t v55 = v27;
  aBlock = _NSConcreteStackBlock;
  uint64_t v51 = 1107296256;
  uint64_t v52 = sub_10001A6AC;
  uint64_t v53 = &unk_1000624D8;
  id v28 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  [v16 setInvalidationHandler:v28];
  _Block_release(v28);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v12;
  *(void *)(v29 + 24) = v14;
  uint64_t v54 = sub_10001859C;
  uint64_t v55 = v29;
  aBlock = _NSConcreteStackBlock;
  uint64_t v51 = 1107296256;
  uint64_t v52 = sub_10001A6AC;
  uint64_t v53 = &unk_100062528;
  uint64_t v30 = _Block_copy(&aBlock);
  swift_release();
  [v16 setInterruptionHandler:v30];
  _Block_release(v30);
  uint64_t v31 = v43;
  static MachServices.LiveActivities.getter();
  uint64_t v32 = v46;
  MachService.serviceInterface.getter();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v31, v45);
  Class isa = XPCInterface.asNSXPCInterface()().super.isa;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v32, v26);
  [v16 setExportedInterface:isa];

  uint64_t v34 = *(void *)(v25 + OBJC_IVAR___NDLiveActivityServiceListenerDelegate_liveActivityService);
  [v16 setExportedObject:v34];
  v35 = *(void **)(v34 + OBJC_IVAR____TtC5newsd19LiveActivityService_currentConnection);
  *(void *)(v34 + OBJC_IVAR____TtC5newsd19LiveActivityService_currentConnection) = v16;

  [v16 resume];
  return 1;
}

unint64_t sub_100018490()
{
  unint64_t result = qword_10006ADA8;
  if (!qword_10006ADA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006ADA8);
  }
  return result;
}

unint64_t sub_1000184D0()
{
  unint64_t result = qword_10006ADB0;
  if (!qword_10006ADB0)
  {
    sub_100018490();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006ADB0);
  }
  return result;
}

uint64_t sub_100018528()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100018560()
{
  return sub_100017B8C(*(void *)(v0 + 16), *(void *)(v0 + 24), "XPC connection invalidated, connection=%{public}s");
}

uint64_t sub_100018584(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100018594()
{
  return swift_release();
}

uint64_t sub_10001859C()
{
  return sub_100017B8C(*(void *)(v0 + 16), *(void *)(v0 + 24), "XPC connection interrupted, connection=%{public}s");
}

uint64_t sub_1000185C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001861C(uint64_t a1)
{
  uint64_t v21 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v21 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v21);
  uint64_t v5 = type metadata accessor for Scope();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v1 + OBJC_IVAR____TtC5newsd21NotificationsAssembly_cacheDirectoryFileURL;
  uint64_t v18 = a1;
  ProxyContainer.public.getter();
  sub_1000170E8(&qword_10006AE78);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  unsigned int v20 = enum case for Scope.singleton(_:);
  uint64_t v19 = *(void (**)(char *))(v6 + 104);
  uint64_t v15 = v5;
  v19(v8);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v8, v5);
  ProxyContainer.public.getter();
  type metadata accessor for ScoredNotificationPool();
  uint64_t v9 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v16, v21);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v11 + v10, (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  swift_release();
  uint64_t v12 = v15;
  ((void (*)(char *, void, uint64_t))v19)(v8, v20, v15);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  v17(v8, v12);
  ProxyContainer.private.getter();
  RegistrationContainer.lazy(block:)();
  return swift_release();
}

uint64_t sub_100018960(void *a1)
{
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006AE80);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v19)
  {
    __break(1u);
    goto LABEL_7;
  }
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006AE88);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v17)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006AF08);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v15)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006AF70);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = sub_100019994((uint64_t)v18, v19);
    __chkstk_darwin(v4);
    uint64_t v6 = (uint64_t *)&v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    uint64_t v8 = sub_100019994((uint64_t)v16, v17);
    __chkstk_darwin(v8);
    unint64_t v10 = (uint64_t *)&v14[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(uint64_t *))(v11 + 16))(v10);
    uint64_t v12 = sub_1000197B0(*v6, *v10, (uint64_t)v14, v3);
    swift_unknownObjectRelease();
    sub_1000185C0((uint64_t)v16);
    sub_1000185C0((uint64_t)v18);
    return (uint64_t)v12;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100018C04(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006AF00);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v9 = result;
    sub_100017A60(a1, a1[3]);
    sub_1000170E8(&qword_10006AF78);
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (result)
    {
      uint64_t v10 = result;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
      id v11 = objc_allocWithZone((Class)type metadata accessor for ScoredNotificationPool());
      id v12 = sub_100044C24(v9, v10, (uint64_t)v7);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return (uint64_t)v12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100018D90()
{
  uint64_t v0 = type metadata accessor for Scope();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000170E8(&qword_10006AE80);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_1000170E8(&qword_10006AE88);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_1000195BC();
  RegistrationContainer.register<A>(_:name:factory:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Scope.singleton(_:), v0);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100018F2C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006AF70);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = type metadata accessor for DelayedNotificationTimetableFactory();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    a2[3] = v5;
    a2[4] = (uint64_t)&off_100062390;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100018FB8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006AF00);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v5 = result;
  sub_100017A60(a1, a1[3]);
  type metadata accessor for ScoredNotificationPool();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v6 = result;
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006AF08);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v11)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_100017A60(a1, a1[3]);
  sub_1000195BC();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = type metadata accessor for DelayedNotificationVendor();
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = v5;
    v9[3] = v6;
    uint64_t result = sub_1000195FC(&v10, (uint64_t)(v9 + 4));
    v9[9] = v7;
    a2[3] = v8;
    a2[4] = &off_100062928;
    *a2 = v9;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100019124()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000170E8(&qword_10006AE98);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (id)FCURLForTodayDropbox();
  if (v7)
  {
    uint64_t v8 = v7;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v6, v3, v0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0);
    if (result != 1)
    {
      id v10 = objc_allocWithZone((Class)FCFileCoordinatedTodayDropbox);
      URL._bridgeToObjectiveC()(v11);
      uint64_t v13 = v12;
      id v14 = [v10 initWithFileURL:v12];

      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
      return (uint64_t)v14;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
  }
  __break(1u);
  return result;
}

uint64_t sub_100019314()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC5newsd21NotificationsAssembly_cacheDirectoryFileURL;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000193B4()
{
  return type metadata accessor for NotificationsAssembly();
}

uint64_t type metadata accessor for NotificationsAssembly()
{
  uint64_t result = qword_10006ADF0;
  if (!qword_10006ADF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100019408()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100019498(uint64_t a1)
{
  return sub_10001861C(a1);
}

uint64_t sub_1000194BC()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001954C(void *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100018C04(a1, v4);
}

unint64_t sub_1000195BC()
{
  unint64_t result = qword_10006AE90;
  if (!qword_10006AE90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006AE90);
  }
  return result;
}

uint64_t sub_1000195FC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

char *sub_100019614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v20[3] = type metadata accessor for DelayedNotificationTimetableFactory();
  v20[4] = &off_100062390;
  v20[0] = a1;
  v19[3] = type metadata accessor for DelayedNotificationVendor();
  v19[4] = &off_100062928;
  v19[0] = a2;
  uint64_t v11 = OBJC_IVAR___NDDelayedNotificationScheduler_notificationCenter;
  id v12 = objc_allocWithZone((Class)UNUserNotificationCenter);
  uint64_t v13 = a5;
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v12 initWithBundleIdentifier:v14];

  *(void *)&a5[v11] = v15;
  sub_1000199E4((uint64_t)v20, (uint64_t)&v13[OBJC_IVAR___NDDelayedNotificationScheduler_timetableFactory]);
  sub_1000199E4((uint64_t)v19, (uint64_t)&v13[OBJC_IVAR___NDDelayedNotificationScheduler_notificationVendor]);
  sub_1000199E4(a3, (uint64_t)&v13[OBJC_IVAR___NDDelayedNotificationScheduler_notificationHistory]);
  *(void *)&v13[OBJC_IVAR___NDDelayedNotificationScheduler_configurationManager] = a4;
  swift_unknownObjectRetain();

  v18.receiver = v13;
  v18.super_class = ObjectType;
  uint64_t v16 = (char *)objc_msgSendSuper2(&v18, "init");
  [*(id *)&v16[OBJC_IVAR___NDDelayedNotificationScheduler_notificationCenter] setPrivateDelegate:v16];
  sub_1000185C0(a3);
  sub_1000185C0((uint64_t)v19);
  sub_1000185C0((uint64_t)v20);
  return v16;
}

char *sub_1000197B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = type metadata accessor for DelayedNotificationTimetableFactory();
  unint64_t v24 = &off_100062390;
  v22[0] = a1;
  uint64_t v20 = type metadata accessor for DelayedNotificationVendor();
  uint64_t v21 = &off_100062928;
  v19[0] = a2;
  uint64_t v8 = (char *)objc_allocWithZone((Class)type metadata accessor for DelayedNotificationScheduler());
  uint64_t v9 = sub_100019994((uint64_t)v22, v23);
  __chkstk_darwin(v9);
  uint64_t v11 = (void *)((char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = sub_100019994((uint64_t)v19, v20);
  __chkstk_darwin(v13);
  id v15 = (void *)((char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = sub_100019614(*v11, *v15, a3, a4, v8);
  sub_1000185C0((uint64_t)v19);
  sub_1000185C0((uint64_t)v22);
  return v17;
}

uint64_t sub_100019994(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1000199E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100019A48(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1000170E8((uint64_t *)&unk_10006BAE0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = FCCurrentQoS();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_100019EEC;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001A274;
  aBlock[3] = &unk_1000625A0;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [a2 withQualityOfService:v11 enqueueBlock:v14];
  _Block_release(v14);
}

uint64_t sub_100019C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = a1;
  uint64_t v9 = sub_1000170E8((uint64_t *)&unk_10006BAE0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = sub_1000170E8(&qword_10006B220);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v9);
  unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = a3;
  *((void *)v17 + 5) = a4;
  *((void *)v17 + 6) = v20;
  *((void *)v17 + 7) = a2;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_retain();
  swift_retain();
  sub_10001A6F0((uint64_t)v14, (uint64_t)&unk_10006AF88, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_100019E1C()
{
  uint64_t v1 = sub_1000170E8((uint64_t *)&unk_10006BAE0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100019EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_1000170E8((uint64_t *)&unk_10006BAE0) - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100019C1C(a1, a2, v6, v7, v8);
}

uint64_t sub_100019F74(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v8[4] = a7;
  v8[5] = a8;
  v8[3] = a6;
  uint64_t v11 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v9 = (void *)swift_task_alloc();
  v8[6] = v9;
  *uint64_t v9 = v8;
  v9[1] = sub_10001A048;
  return v11();
}

uint64_t sub_10001A048()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10001A1DC;
  }
  else {
    uint64_t v2 = sub_10001A15C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001A15C()
{
  (*(void (**)(void))(v0 + 24))();
  sub_1000170E8((uint64_t *)&unk_10006BAE0);
  CheckedContinuation.resume(returning:)();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001A1DC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  (*(void (**)(void))(v0 + 24))();
  *(void *)(v0 + 16) = v1;
  sub_1000170E8((uint64_t *)&unk_10006BAE0);
  CheckedContinuation.resume(throwing:)();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10001A274(uint64_t a1, void *aBlock)
{
  uint64_t v2 = *(void (**)(uint64_t (*)(), uint64_t))(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_10001A358, v4);
  swift_release();

  return swift_release();
}

uint64_t sub_10001A308(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A318()
{
  return swift_release();
}

uint64_t sub_10001A320()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001A358()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10001A368()
{
  uint64_t v1 = sub_1000170E8((uint64_t *)&unk_10006BAE0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001A448()
{
  uint64_t v2 = *(void *)(sub_1000170E8((uint64_t *)&unk_10006BAE0) - 8);
  uint64_t v3 = *(int **)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_10001A5B8;
  *(void *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v6;
  uint64_t v9 = (uint64_t (*)(void))((char *)v3 + *v3);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 48) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_10001A048;
  return v9();
}

uint64_t sub_10001A5B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001A6AC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10001A6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100025DD4(a1, &qword_10006B220);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_10001A89C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1000170E8(&qword_10006B220);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v3[OBJC_IVAR____TtC5newsd19LiveActivityService_currentConnection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC5newsd19LiveActivityService_maxSubscriptionDelay] = 0x40CC200000000000;
  sub_1000199E4(a1, (uint64_t)&v3[OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityLauncher]);
  sub_1000199E4(a2, (uint64_t)&v3[OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityRepository]);
  v14.receiver = v3;
  v14.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v14, "init");
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v9;
  id v12 = v9;
  sub_10001A6F0((uint64_t)v8, (uint64_t)&unk_10006AFE8, (uint64_t)v11);
  swift_release();
  sub_1000185C0(a2);
  sub_1000185C0(a1);
  return v12;
}

uint64_t sub_10001AA30()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100026628;
  return sub_10001AAC0();
}

uint64_t sub_10001AAC0()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for NewsroomActivityID();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for NewsLiveActivitySubscriptionState();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ScheduledLiveActivity();
  v1[9] = v4;
  v1[10] = *(void *)(v4 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for NewsLiveActivity();
  v1[13] = v5;
  v1[14] = *(void *)(v5 - 8);
  v1[15] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  uint8_t v1[16] = v6;
  v1[17] = *(void *)(v6 - 8);
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  return _swift_task_switch(sub_10001AD10, 0, 0);
}

uint64_t sub_10001AD10()
{
  uint64_t v1 = (void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityRepository);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100017A60(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10001ADD0;
  return dispatch thunk of NewsLiveActivityRepository.activities.getter(v2, v3);
}

uint64_t sub_10001ADD0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 168) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10001AED0, 0, 0);
}

uint64_t sub_10001AED0()
{
  static Logger.liveActivityDaemon.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Will re-scheduled live activities.", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 152);
  uint64_t v6 = *(void *)(v0 + 128);
  uint64_t v7 = *(void *)(v0 + 136);

  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  *(void *)(v0 + 176) = v8;
  *(void *)(v0 + 184) = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v5, v6);
  uint64_t v9 = *(void *)(v4 + 16);
  *(void *)(v0 + 192) = v9;
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)(v0 + 112);
    *(_DWORD *)(v0 + 248) = *(_DWORD *)(v11 + 80);
    *(void *)(v0 + 200) = *(void *)(v11 + 72);
    *(void *)(v0 + 208) = *(void *)(v11 + 16);
    *(_DWORD *)(v0 + 252) = enum case for NewsLiveActivitySubscriptionState.scheduled(_:);
    while (1)
    {
      *(void *)(v0 + 216) = v10;
      int v12 = *(_DWORD *)(v0 + 252);
      uint64_t v14 = *(void *)(v0 + 56);
      uint64_t v13 = *(void *)(v0 + 64);
      uint64_t v15 = *(void *)(v0 + 48);
      (*(void (**)(void, unint64_t, void))(v0 + 208))(*(void *)(v0 + 120), *(void *)(v0 + 168)+ ((*(unsigned __int8 *)(v0 + 248) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 248))+ *(void *)(v0 + 200) * v10, *(void *)(v0 + 104));
      NewsLiveActivity.subscriptionState.getter();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 88))(v13, v15) == v12) {
        break;
      }
      uint64_t v17 = *(void *)(v0 + 56);
      uint64_t v16 = *(void *)(v0 + 64);
      uint64_t v18 = *(void *)(v0 + 48);
      (*(void (**)(void, void))(*(void *)(v0 + 112) + 8))(*(void *)(v0 + 120), *(void *)(v0 + 104));
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
      uint64_t v10 = *(void *)(v0 + 216) + 1;
      if (v10 == *(void *)(v0 + 192)) {
        goto LABEL_7;
      }
    }
    uint64_t v21 = *(void *)(v0 + 96);
    uint64_t v22 = *(void *)(v0 + 72);
    uint64_t v23 = *(void *)(v0 + 80);
    uint64_t v24 = *(void *)(v0 + 64);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 56) + 96))(v24, *(void *)(v0 + 48));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v21, v24, v22);
    uint64_t v25 = ScheduledLiveActivity.scheduleRequest.getter();
    *(void *)(v0 + 224) = v25;
    uint64_t v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v26;
    void *v26 = v0;
    v26[1] = sub_10001B1E8;
    return sub_10001BA20(v25);
  }
  else
  {
LABEL_7:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
}

uint64_t sub_10001B1E8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_10001B548;
  }
  else
  {

    uint64_t v3 = sub_10001B304;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10001B304()
{
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 80);
  while (1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
    uint64_t v7 = *(void *)(v0 + 216) + 1;
    if (v7 == *(void *)(v0 + 192)) {
      break;
    }
    *(void *)(v0 + 216) = v7;
    int v8 = *(_DWORD *)(v0 + 252);
    uint64_t v10 = *(void *)(v0 + 56);
    uint64_t v9 = *(void *)(v0 + 64);
    uint64_t v11 = *(void *)(v0 + 48);
    (*(void (**)(void, unint64_t, void))(v0 + 208))(*(void *)(v0 + 120), *(void *)(v0 + 168)+ ((*(unsigned __int8 *)(v0 + 248) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 248))+ *(void *)(v0 + 200) * v7, *(void *)(v0 + 104));
    NewsLiveActivity.subscriptionState.getter();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v9, v11) == v8)
    {
      uint64_t v14 = *(void *)(v0 + 96);
      uint64_t v15 = *(void *)(v0 + 72);
      uint64_t v16 = *(void *)(v0 + 80);
      uint64_t v17 = *(void *)(v0 + 64);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 56) + 96))(v17, *(void *)(v0 + 48));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v14, v17, v15);
      uint64_t v18 = ScheduledLiveActivity.scheduleRequest.getter();
      *(void *)(v0 + 224) = v18;
      uint64_t v19 = (void *)swift_task_alloc();
      *(void *)(v0 + 232) = v19;
      *uint64_t v19 = v0;
      v19[1] = sub_10001B1E8;
      return sub_10001BA20(v18);
    }
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v3 = *(void *)(v0 + 120);
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v2 = *(void *)(v0 + 56);
    uint64_t v1 = *(void *)(v0 + 64);
    uint64_t v4 = *(void *)(v0 + 48);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_10001B548()
{
  uint64_t v51 = v0;
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 80);

  static Logger.liveActivityDaemon.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t type = static os_log_type_t.error.getter();
  BOOL v6 = os_log_type_enabled(v5, type);
  uint64_t v7 = *(void *)(v0 + 144);
  uint64_t v8 = *(void *)(v0 + 120);
  uint64_t v9 = *(void *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 72);
  uint64_t v11 = *(void *)(v0 + 80);
  uint64_t v48 = *(void *)(v0 + 96);
  uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
  uint64_t v47 = *(void *)(v0 + 128);
  if (v6)
  {
    uint64_t v45 = *(void *)(v0 + 104);
    uint64_t v12 = *(void *)(v0 + 32);
    uint64_t v13 = *(void *)(v0 + 40);
    uint64_t v43 = *(void *)(v0 + 144);
    uint64_t v14 = *(void *)(v0 + 24);
    uint64_t v42 = *(void *)(v0 + 112);
    uint64_t v15 = *(void *)(v0 + 88);
    uint64_t v44 = *(void *)(v0 + 120);
    uint64_t v16 = swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136446210;
    log = v5;
    ScheduledLiveActivity.activityID.getter();
    sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
    uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v19 = v18;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
    *(void *)(v16 + 4) = sub_100024BC0(v17, v19, &v50);
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v20(v15, v10);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Failed to re-scheduled live activity, id=%{public}s.", (uint8_t *)v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();

    v49(v43, v47);
    v20(v48, v10);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v44, v45);
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 72);
    uint64_t v22 = *(void *)(v0 + 112);
    uint64_t v23 = *(void *)(v0 + 88);
    swift_errorRelease();

    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v24(v23, v21);
    v49(v7, v47);
    v24(v48, v21);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v8, v9);
  }
  while (1)
  {
    uint64_t v32 = *(void *)(v0 + 216) + 1;
    if (v32 == *(void *)(v0 + 192))
    {
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
      return v33();
    }
    *(void *)(v0 + 216) = v32;
    int v25 = *(_DWORD *)(v0 + 252);
    uint64_t v27 = *(void *)(v0 + 56);
    uint64_t v26 = *(void *)(v0 + 64);
    uint64_t v28 = *(void *)(v0 + 48);
    (*(void (**)(void, unint64_t, void))(v0 + 208))(*(void *)(v0 + 120), *(void *)(v0 + 168)+ ((*(unsigned __int8 *)(v0 + 248) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 248))+ *(void *)(v0 + 200) * v32, *(void *)(v0 + 104));
    NewsLiveActivity.subscriptionState.getter();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v27 + 88))(v26, v28) == v25) {
      break;
    }
    uint64_t v30 = *(void *)(v0 + 56);
    uint64_t v29 = *(void *)(v0 + 64);
    uint64_t v31 = *(void *)(v0 + 48);
    (*(void (**)(void, void))(*(void *)(v0 + 112) + 8))(*(void *)(v0 + 120), *(void *)(v0 + 104));
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
  }
  uint64_t v35 = *(void *)(v0 + 96);
  uint64_t v36 = *(void *)(v0 + 72);
  uint64_t v37 = *(void *)(v0 + 80);
  uint64_t v38 = *(void *)(v0 + 64);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 56) + 96))(v38, *(void *)(v0 + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v35, v38, v36);
  uint64_t v39 = ScheduledLiveActivity.scheduleRequest.getter();
  *(void *)(v0 + 224) = v39;
  uint64_t v40 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v40;
  *uint64_t v40 = v0;
  v40[1] = sub_10001B1E8;
  return sub_10001BA20(v39);
}

uint64_t sub_10001BA20(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = type metadata accessor for Date();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for NewsroomActivityID();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ScheduledLiveActivity();
  uint8_t v2[16] = v6;
  v2[17] = *(void *)(v6 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  return _swift_task_switch(sub_10001BC1C, 0, 0);
}

uint64_t sub_10001BC1C()
{
  uint64_t v46 = v0;
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  LiveActivityScheduleRequest.scheduledActivity.getter();
  static Logger.liveActivityDaemon.getter();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(v2, v1, v5);
  v7(v3, v1, v5);
  v7(v4, v1, v5);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    log = v8;
    uint64_t v10 = v0[20];
    uint64_t v34 = v0[19];
    uint64_t v11 = v0[17];
    uint64_t v36 = v0[18];
    uint64_t v44 = v0[16];
    uint64_t v41 = v0[14];
    uint64_t v12 = v0[12];
    uint64_t v42 = v0[13];
    uint64_t v43 = v0[15];
    uint64_t v14 = v0[10];
    uint64_t v13 = v0[11];
    uint64_t v35 = v0[9];
    uint64_t v37 = v0[7];
    uint64_t v38 = v0[8];
    uint64_t v15 = swift_slowAlloc();
    v45[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136446722;
    os_log_type_t type = v9;
    ScheduledLiveActivity.activityID.getter();
    sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
    uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v18 = v17;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    v0[2] = sub_100024BC0(v16, v18, v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v19 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v19(v10, v44);
    *(_WORD *)(v15 + 12) = 2082;
    uint64_t v20 = ScheduledLiveActivity.backgroundTaskID.getter();
    v0[3] = sub_100024BC0(v20, v21, v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v19(v34, v44);
    *(_WORD *)(v15 + 22) = 2082;
    ScheduledLiveActivity.scheduleDate.getter();
    sub_100025D8C(&qword_10006BAD0, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v24 = v23;
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v35, v37);
    v0[4] = sub_100024BC0(v22, v24, v45);
    int v25 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v19(v36, v44);
    _os_log_impl((void *)&_mh_execute_header, log, type, "LiveActivityService: will schedule live activity id=%{public}s taskID=%{public}s date=%{public}s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v43, v42);
  }
  else
  {
    uint64_t v26 = v0[19];
    uint64_t v27 = v0[18];
    uint64_t v29 = v0[15];
    uint64_t v28 = v0[16];
    uint64_t v30 = v0[13];
    uint64_t v31 = v0[14];
    int v25 = *(void (**)(uint64_t, uint64_t))(v0[17] + 8);
    v25(v0[20], v28);
    v25(v26, v28);
    v25(v27, v28);

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
  }
  sub_100021ED0();
  v25(v0[21], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t sub_10001C114(uint64_t a1)
{
  v2[10] = a1;
  v2[11] = v1;
  uint64_t v3 = type metadata accessor for Calendar();
  v2[12] = v3;
  v2[13] = *(void *)(v3 - 8);
  v2[14] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for LiveActivitySubscriptionError();
  v2[15] = v4;
  uint8_t v2[16] = *(void *)(v4 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  v2[18] = v5;
  v2[19] = *(void *)(v5 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Date();
  v2[24] = v6;
  v2[25] = *(void *)(v6 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for NewsroomActivityID();
  v2[34] = v7;
  v2[35] = *(void *)(v7 - 8);
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  sub_1000170E8(&qword_10006B048);
  v2[41] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for ScheduledLiveActivity();
  v2[42] = v8;
  v2[43] = *(void *)(v8 - 8);
  v2[44] = swift_task_alloc();
  return _swift_task_switch(sub_10001C484, 0, 0);
}

uint64_t sub_10001C484()
{
  uint64_t v1 = v0[42];
  uint64_t v2 = v0[43];
  uint64_t v3 = v0[41];
  NewsLiveActivity.scheduledActivityOrLogError.getter(v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100025DD4(v0[41], &qword_10006B048);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v6 = v0[11];
    (*(void (**)(void, void, void))(v0[43] + 32))(v0[44], v0[41], v0[42]);
    ScheduledLiveActivity.activityID.getter();
    ScheduledLiveActivity.scheduleDate.getter();
    uint64_t v7 = *(void *)(v6 + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityRepository + 24);
    uint64_t v8 = *(void *)(v6 + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityRepository + 32);
    sub_100017A60((void *)(v6 + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityRepository), v7);
    os_log_type_t v9 = (void *)swift_task_alloc();
    v0[45] = v9;
    *os_log_type_t v9 = v0;
    v9[1] = sub_10001C71C;
    uint64_t v10 = v0[40];
    return dispatch thunk of NewsLiveActivityRepository.removeActivity(identifier:)(v10, v7, v8);
  }
}

uint64_t sub_10001C71C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001C818, 0, 0);
}

uint64_t sub_10001C818()
{
  uint64_t v66 = v0;
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[31];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[25];
  Date.addingTimeInterval(_:)();
  static Date.now.getter();
  char v5 = static Date.< infix(_:_:)();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v0[46] = v6;
  v0[47] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v2, v3);
  uint64_t v7 = (void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  uint64_t v8 = v0[40];
  uint64_t v9 = v0[34];
  if (v5)
  {
    uint64_t v10 = v0[39];
    static Logger.liveActivityDaemon.getter();
    uint64_t v11 = *v7;
    v0[48] = *v7;
    v0[49] = (unint64_t)v7 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v11(v10, v8, v9);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    BOOL v14 = os_log_type_enabled(v12, v13);
    uint64_t v15 = v0[39];
    uint64_t v16 = v0[34];
    uint64_t v17 = v0[35];
    uint64_t v18 = v0[23];
    uint64_t v20 = v0[18];
    uint64_t v19 = v0[19];
    if (v14)
    {
      uint64_t v63 = v0[23];
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      *(_DWORD *)unint64_t v21 = 136446210;
      sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
      uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[9] = sub_100024BC0(v22, v23, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      unint64_t v24 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v24(v15, v16);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Will request start of live activity id=%{public}s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      int v25 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      v25(v63, v20);
    }
    else
    {
      unint64_t v24 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v24(v0[39], v0[34]);

      int v25 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      v25(v18, v20);
    }
    v0[50] = v25;
    v0[51] = v24;
    uint64_t v47 = (void *)(v0[11] + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityLauncher);
    uint64_t v48 = v47[3];
    uint64_t v49 = v47[4];
    sub_100017A60(v47, v48);
    uint64_t v50 = (void *)swift_task_alloc();
    v0[52] = v50;
    *uint64_t v50 = v0;
    v50[1] = sub_10001D028;
    uint64_t v51 = v0[40];
    return dispatch thunk of NewsLiveActivityLauncherType.startActivity(activityID:)(v51, v48, v49);
  }
  else
  {
    v64 = v6;
    uint64_t v26 = v0[38];
    uint64_t v27 = v0[33];
    uint64_t v28 = v0[30];
    uint64_t v29 = v0[24];
    uint64_t v30 = v0[25];
    static Logger.liveActivityDaemon.getter();
    (*v7)(v26, v8, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v28, v27, v29);
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v34 = v0[43];
    uint64_t v62 = v0[42];
    uint64_t v60 = v0[44];
    uint64_t v61 = v0[40];
    uint64_t v35 = v0[38];
    uint64_t v37 = v0[34];
    uint64_t v36 = v0[35];
    uint64_t v58 = v0[32];
    uint64_t v59 = v0[33];
    uint64_t v38 = v0[30];
    uint64_t v39 = v0[24];
    uint64_t v40 = v0[19];
    uint64_t v56 = v0[18];
    uint64_t v57 = v0[22];
    if (v33)
    {
      uint64_t v55 = v0[30];
      uint64_t v41 = swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136446466;
      sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
      uint64_t v42 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[2] = sub_100024BC0(v42, v43, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v44(v35, v37);
      *(_WORD *)(v41 + 12) = 2082;
      sub_100025D8C(&qword_10006BAD0, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v45 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[3] = sub_100024BC0(v45, v46, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v64(v55, v39);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Activity too old to subscribe, id=%{public}s scheduleDate=%{public}s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v57, v56);
      v64(v58, v39);
      v64(v59, v39);
      v44(v61, v37);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v60, v62);
    }
    else
    {

      v64(v38, v39);
      uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v52(v35, v37);
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v57, v56);
      v64(v58, v39);
      v64(v59, v39);
      v52(v61, v37);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v60, v62);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v53 = (uint64_t (*)(void))v0[1];
    return v53();
  }
}

uint64_t sub_10001D028()
{
  *(void *)(*(void *)v1 + 424) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10001D314;
  }
  else {
    uint64_t v2 = sub_10001D13C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001D13C()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[51];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[46];
  uint64_t v3 = v0[43];
  uint64_t v10 = v0[42];
  uint64_t v11 = v0[44];
  uint64_t v4 = v0[40];
  uint64_t v5 = v0[34];
  uint64_t v6 = v0[33];
  uint64_t v7 = v0[24];
  v2(v0[32], v7);
  v2(v6, v7);
  v1(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v11, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10001D314()
{
  v72 = v0;
  v0[4] = v0[53];
  swift_errorRetain();
  sub_1000170E8(&qword_10006B260);
  if (swift_dynamicCast())
  {
    if ((*(unsigned int (**)(void, void))(v0[16] + 88))(v0[17], v0[15]) == enum case for LiveActivitySubscriptionError.liveActivityHasNotStarted(_:))
    {
      uint64_t v63 = (void (*)(uint64_t, uint64_t, uint64_t))v0[48];
      uint64_t v1 = v0[37];
      uint64_t v60 = v0[34];
      uint64_t v62 = v0[40];
      uint64_t v2 = v0[29];
      uint64_t v67 = v0[28];
      uint64_t v4 = v0[24];
      uint64_t v3 = v0[25];
      uint64_t v5 = v0[16];
      uint64_t v6 = v0[17];
      uint64_t v7 = v0[15];
      swift_errorRelease();
      (*(void (**)(uint64_t, uint64_t))(v5 + 96))(v6, v7);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v6, v4);
      static Logger.liveActivityDaemon.getter();
      v63(v1, v62, v60);
      os_log_t v57 = *(os_log_t *)(v3 + 16);
      ((void (*)(uint64_t, uint64_t, uint64_t))v57)(v67, v2, v4);
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t type = static os_log_type_t.default.getter();
      BOOL v9 = os_log_type_enabled(v8, type);
      uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[50];
      uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[51];
      uint64_t v61 = (void (*)(uint64_t, uint64_t))v0[46];
      uint64_t v12 = v0[37];
      uint64_t v13 = v0[34];
      uint64_t v14 = v0[28];
      uint64_t v15 = v0[24];
      uint64_t v65 = v0[18];
      uint64_t v68 = v0[21];
      if (v9)
      {
        uint64_t v16 = swift_slowAlloc();
        uint64_t v71 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136446466;
        sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
        uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter();
        v0[7] = sub_100024BC0(v17, v18, &v71);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v10(v12, v13);
        *(_WORD *)(v16 + 12) = 2082;
        sub_100025D8C(&qword_10006BAD0, (void (*)(uint64_t))&type metadata accessor for Date);
        uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
        v0[8] = sub_100024BC0(v19, v20, &v71);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v61(v14, v15);
        _os_log_impl((void *)&_mh_execute_header, v8, type, "Attempted to subscribe to live activity (%{public}s) that hasn't started yet. Will re-schedule for activity start date: %{public}s", (uint8_t *)v16, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v11(v68, v65);
      }
      else
      {
        v10(v12, v13);
        v61(v14, v15);

        v11(v68, v65);
      }
      uint64_t v42 = (void (*)(uint64_t, uint64_t))v0[46];
      uint64_t v43 = v0[31];
      uint64_t v44 = v0[29];
      uint64_t v45 = v0[26];
      uint64_t v70 = v0[27];
      uint64_t v46 = v0[24];
      uint64_t v47 = v0[13];
      uint64_t v48 = v0[14];
      uint64_t v49 = v0[12];
      static Date.now.getter();
      static Calendar.current.getter();
      Date.addSeconds(_:calendar:)();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v49);
      v42(v43, v46);
      sub_100025D8C(&qword_10006B058, (void (*)(uint64_t))&type metadata accessor for Date);
      if (dispatch thunk of static Comparable.>= infix(_:_:)()) {
        uint64_t v50 = v44;
      }
      else {
        uint64_t v50 = v45;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t))v57)(v70, v50, v46);
      v42(v45, v46);
      uint64_t v51 = (void *)swift_task_alloc();
      v0[54] = v51;
      *uint64_t v51 = v0;
      v51[1] = sub_10001DBA0;
      uint64_t v52 = v0[27];
      uint64_t v53 = v0[10];
      return sub_10001E690(v53, v52);
    }
    (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
  }
  unint64_t v21 = (void (*)(uint64_t, uint64_t, uint64_t))v0[48];
  uint64_t v22 = v0[40];
  uint64_t v23 = v0[36];
  uint64_t v24 = v0[34];
  swift_errorRelease();
  static Logger.liveActivityDaemon.getter();
  v21(v23, v22, v24);
  swift_errorRetain();
  swift_errorRetain();
  int v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.error.getter();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = (void (*)(uint64_t, uint64_t))v0[50];
  uint64_t v30 = v0[35];
  uint64_t v29 = v0[36];
  uint64_t v31 = v0[34];
  if (v27)
  {
    uint64_t v66 = v0[18];
    uint64_t v69 = (void (*)(uint64_t, uint64_t))v0[50];
    uint64_t v64 = v0[20];
    typea = (void (*)(uint64_t, uint64_t))v0[51];
    uint64_t v32 = swift_slowAlloc();
    uint64_t v59 = (void *)swift_slowAlloc();
    uint64_t v71 = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136446466;
    uint64_t v58 = v25;
    sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
    uint64_t v33 = dispatch thunk of CustomStringConvertible.description.getter();
    os_log_type_t v54 = v26;
    v0[5] = sub_100024BC0(v33, v34, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v35 = v30 + 8;
    typea(v29, v31);
    *(_WORD *)(v32 + 12) = 2114;
    swift_errorRetain();
    uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v59 = v36;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v58, v54, "Failed to subscribe to live activity id=%{public}s, error: %{public}@", (uint8_t *)v32, 0x16u);
    sub_1000170E8(&qword_10006B018);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v69(v64, v66);
  }
  else
  {
    uint64_t v35 = v30 + 8;
    uint64_t v37 = v0[18];
    uint64_t v38 = v0[20];
    ((void (*)(void, void))v0[51])(v0[36], v0[34]);
    swift_errorRelease();
    swift_errorRelease();

    v28(v38, v37);
  }
  v0[55] = v35;
  uint64_t v39 = (void *)swift_task_alloc();
  v0[56] = v39;
  *uint64_t v39 = v0;
  v39[1] = sub_10001DEA4;
  uint64_t v40 = v0[10];
  return sub_10001F79C(v40);
}

uint64_t sub_10001DBA0()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001DC9C, 0, 0);
}

uint64_t sub_10001DC9C()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[46];
  uint64_t v2 = v0[43];
  uint64_t v13 = v0[44];
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[51];
  uint64_t v12 = v0[42];
  uint64_t v10 = v0[40];
  uint64_t v3 = v0[34];
  uint64_t v5 = v0[32];
  uint64_t v4 = v0[33];
  uint64_t v6 = v0[29];
  uint64_t v7 = v0[24];
  v1(v0[27], v7);
  v1(v6, v7);
  v1(v5, v7);
  v1(v4, v7);
  v11(v10, v3);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v13, v12);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10001DEA4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001DFA0, 0, 0);
}

uint64_t sub_10001DFA0()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[51];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[46];
  uint64_t v3 = v0[43];
  uint64_t v12 = v0[44];
  uint64_t v11 = v0[42];
  uint64_t v4 = v0[40];
  uint64_t v6 = v0[33];
  uint64_t v5 = v0[34];
  uint64_t v7 = v0[32];
  uint64_t v8 = v0[24];
  swift_errorRelease();
  v2(v7, v8);
  v2(v6, v8);
  v1(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v12, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t NewsLiveActivity.scheduledActivityOrLogError.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = type metadata accessor for NewsLiveActivity();
  uint64_t v3 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v35 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for NewsLiveActivitySubscriptionState();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v28 - v14;
  NewsLiveActivity.subscriptionState.getter();
  if ((*(unsigned int (**)(char *, uint64_t))(v10 + 88))(v15, v9) == enum case for NewsLiveActivitySubscriptionState.scheduled(_:))
  {
    (*(void (**)(char *, uint64_t))(v10 + 96))(v15, v9);
    uint64_t v16 = type metadata accessor for ScheduledLiveActivity();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a1, v15, v16);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
  }
  else
  {
    unint64_t v34 = *(void (**)(char *, uint64_t))(v10 + 8);
    v34(v15, v9);
    static Logger.liveActivityDaemon.getter();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v36);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    int v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      int v31 = v21;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v32 = swift_slowAlloc();
      uint64_t v38 = v32;
      uint64_t v33 = a1;
      *(_DWORD *)uint64_t v23 = 136446210;
      v28[1] = v23 + 4;
      uint64_t v29 = v23;
      NewsLiveActivity.subscriptionState.getter();
      sub_100025D8C(&qword_10006AF90, (void (*)(uint64_t))&type metadata accessor for NewsLiveActivitySubscriptionState);
      uint64_t v24 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v30 = v6;
      unint64_t v26 = v25;
      v34(v13, v9);
      uint64_t v37 = sub_100024BC0(v24, v26, &v38);
      a1 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v36);
      _os_log_impl((void *)&_mh_execute_header, v19, (os_log_type_t)v31, "Unexpected subscription state. Must be .scheduled(). Is: %{public}s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v30);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v36);

      (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v6);
    }
    uint64_t v27 = type metadata accessor for ScheduledLiveActivity();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(a1, 1, 1, v27);
  }
}

uint64_t sub_10001E690(uint64_t a1, uint64_t a2)
{
  void v3[5] = a2;
  v3[6] = v2;
  void v3[4] = a1;
  uint64_t v4 = type metadata accessor for NewsroomActivityID();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  sub_1000170E8(&qword_10006B068);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  sub_1000170E8(&qword_10006B070);
  v3[15] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for NewsLiveActivity();
  uint8_t v3[16] = v6;
  v3[17] = *(void *)(v6 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  sub_1000170E8(&qword_10006B2C0);
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UUID();
  v3[22] = v7;
  v3[23] = *(void *)(v7 - 8);
  v3[24] = swift_task_alloc();
  sub_1000170E8(&qword_10006B048);
  v3[25] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for ScheduledLiveActivity();
  v3[26] = v8;
  v3[27] = *(void *)(v8 - 8);
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  return _swift_task_switch(sub_10001E9C4, 0, 0);
}

uint64_t sub_10001E9C4()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[25];
  NewsLiveActivity.scheduledActivityOrLogError.getter(v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100025DD4(v0[25], &qword_10006B048);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v24 = v0[28];
    uint64_t v23 = v0[27];
    uint64_t v25 = v0[26];
    uint64_t v6 = v0[24];
    uint64_t v8 = v0[22];
    uint64_t v7 = v0[23];
    uint64_t v10 = v0[20];
    uint64_t v9 = v0[21];
    uint64_t v26 = v0[15];
    uint64_t v27 = v0[14];
    uint64_t v11 = v0[5];
    uint64_t v28 = v0[13];
    (*(void (**)(void))(v23 + 32))();
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v12 = type metadata accessor for Date();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    v14(v9, v11, v12);
    uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v15(v9, 0, 1, v12);
    v14(v10, v11, v12);
    v15(v10, 0, 1, v12);
    ScheduledLiveActivity.with(backgroundTaskIDSuffix:scheduleDate:originalScheduleDate:retryCount:scheduleDelay:scheduleTimeWindow:)();
    swift_bridgeObjectRelease();
    sub_100025DD4(v10, &qword_10006B2C0);
    sub_100025DD4(v9, &qword_10006B2C0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v26, v24, v25);
    uint64_t v16 = enum case for NewsLiveActivitySubscriptionState.scheduled(_:);
    uint64_t v17 = type metadata accessor for NewsLiveActivitySubscriptionState();
    uint64_t v18 = *(void *)(v17 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 104))(v26, v16, v17);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v26, 0, 1, v17);
    v15(v9, 1, 1, v12);
    uint64_t v19 = type metadata accessor for NewsLiveActivityChangeSource();
    os_log_type_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
    v20(v27, 1, 1, v19);
    v20(v28, 1, 1, v19);
    NewsLiveActivity.with(subscriptionState:lastUpdatedContentDate:subscriptionSource:dismissalSource:)();
    sub_100025DD4(v28, &qword_10006B068);
    sub_100025DD4(v27, &qword_10006B068);
    sub_100025DD4(v9, &qword_10006B2C0);
    sub_100025DD4(v26, &qword_10006B070);
    int v21 = (void *)swift_task_alloc();
    v0[30] = v21;
    *int v21 = v0;
    v21[1] = sub_10001EE9C;
    uint64_t v22 = v0[19];
    return sub_10002106C(v22);
  }
}

uint64_t sub_10001EE9C()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10001F2C4;
  }
  else {
    uint64_t v2 = sub_10001EFB0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001EFB0()
{
  uint64_t v1 = (void *)(v0[6] + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityRepository);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100017A60(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[32] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10001F078;
  uint64_t v5 = v0[19];
  return dispatch thunk of NewsLiveActivityRepository.store(_:)(v5, v2, v3);
}

uint64_t sub_10001F078()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001F174, 0, 0);
}

uint64_t sub_10001F174()
{
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[29];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[27];
  (*(void (**)(void, void))(v0[17] + 8))(v0[19], v0[16]);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v1, v3);
  v5(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10001F2C4()
{
  uint64_t v47 = v0;
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[16];
  static Logger.liveActivityDaemon.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v40 = v0[28];
    uint64_t v42 = v0[29];
    uint64_t v37 = v0[27];
    uint64_t v38 = v0[26];
    uint64_t v7 = v0[18];
    uint64_t v36 = v0[19];
    uint64_t v31 = v0[17];
    uint64_t v44 = v0[16];
    uint64_t v33 = v0[11];
    uint64_t v8 = v0[9];
    uint64_t v34 = v0[10];
    uint64_t v35 = v0[12];
    uint64_t v9 = v0[7];
    uint64_t v10 = v0[8];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v30 = (void *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446466;
    os_log_type_t type = v6;
    NewsLiveActivity.id.getter();
    sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
    uint64_t v12 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    v0[2] = sub_100024BC0(v12, v14, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v32(v7, v44);
    *(_WORD *)(v11 + 12) = 2114;
    swift_errorRetain();
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v30 = v15;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, type, "Failed to re-schedule live activity id=%{public}s, error: %{public}@", (uint8_t *)v11, 0x16u);
    sub_1000170E8(&qword_10006B018);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v34);
    v32(v36, v44);
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v16(v40, v38);
    v16(v42, v38);
  }
  else
  {
    uint64_t v45 = v0[29];
    uint64_t v17 = v0[27];
    uint64_t v18 = v0[26];
    uint64_t v19 = v0[18];
    uint64_t v41 = v0[19];
    uint64_t v43 = v0[28];
    os_log_type_t v20 = v5;
    uint64_t v22 = v0[16];
    uint64_t v21 = v0[17];
    uint64_t v23 = v0[11];
    uint64_t v39 = v0[12];
    uint64_t v24 = v0[10];

    swift_errorRelease();
    swift_errorRelease();
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v25(v19, v22);
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v39, v24);
    v25(v41, v22);
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v26(v43, v18);
    v26(v45, v18);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v27 = (uint64_t (*)(void))v0[1];
  return v27();
}

uint64_t sub_10001F79C(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = type metadata accessor for NewsroomActivityID();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  sub_1000170E8(&qword_10006B068);
  uint8_t v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  sub_1000170E8(&qword_10006B070);
  v2[18] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for NewsLiveActivity();
  v2[19] = v5;
  v2[20] = *(void *)(v5 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Date();
  v2[25] = v6;
  v2[26] = *(void *)(v6 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  sub_1000170E8(&qword_10006B2C0);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UUID();
  v2[32] = v7;
  v2[33] = *(void *)(v7 - 8);
  v2[34] = swift_task_alloc();
  sub_1000170E8(&qword_10006B048);
  v2[35] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for ScheduledLiveActivity();
  v2[36] = v8;
  v2[37] = *(void *)(v8 - 8);
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  return _swift_task_switch(sub_10001FB78, 0, 0);
}

uint64_t sub_10001FB78()
{
  v100 = v0;
  uint64_t v1 = v0[36];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[35];
  NewsLiveActivity.scheduledActivityOrLogError.getter(v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100025DD4(v0[35], &qword_10006B048);
    goto LABEL_3;
  }
  uint64_t v6 = v0[34];
  uint64_t v8 = v0[32];
  uint64_t v7 = v0[33];
  uint64_t v9 = v0[31];
  uint64_t v98 = v0[30];
  uint64_t v11 = v0[25];
  uint64_t v10 = v0[26];
  (*(void (**)(void, void, void))(v0[37] + 32))(v0[39], v0[35], v0[36]);
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  ScheduledLiveActivity.retryInterval.getter();
  Date.init(timeIntervalSinceNow:)();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v12(v9, 0, 1, v11);
  v12(v98, 1, 1, v11);
  uint64_t result = ScheduledLiveActivity.retryCount.getter();
  if (__OFADD__(result, 1))
  {
    __break(1u);
    return result;
  }
  uint64_t v14 = v0[30];
  uint64_t v13 = v0[31];
  ScheduledLiveActivity.retryScheduleTimeWindow.getter();
  ScheduledLiveActivity.with(backgroundTaskIDSuffix:scheduleDate:originalScheduleDate:retryCount:scheduleDelay:scheduleTimeWindow:)();
  swift_bridgeObjectRelease();
  sub_100025DD4(v14, &qword_10006B2C0);
  sub_100025DD4(v13, &qword_10006B2C0);
  uint64_t v15 = ScheduledLiveActivity.retryCount.getter();
  if (ScheduledLiveActivity.retryCountMax.getter() < v15)
  {
    uint64_t v16 = v0[22];
    uint64_t v17 = v0[19];
    uint64_t v18 = v0[20];
    uint64_t v19 = v0[6];
    static Logger.liveActivityDaemon.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v19, v17);
    os_log_type_t v20 = Logger.logObject.getter();
    os_log_type_t type = static os_log_type_t.default.getter();
    BOOL v21 = os_log_type_enabled(v20, type);
    uint64_t v23 = v0[38];
    uint64_t v22 = v0[39];
    uint64_t v24 = v0[36];
    uint64_t v25 = v0[37];
    uint64_t v26 = v0[22];
    uint64_t v27 = v0[20];
    uint64_t v91 = v0[19];
    uint64_t v28 = v0[12];
    uint64_t v93 = v0[14];
    uint64_t v95 = v0[11];
    if (v21)
    {
      uint64_t v85 = v0[36];
      uint64_t v87 = v0[39];
      uint64_t v29 = v0[9];
      uint64_t v30 = v0[10];
      v81 = (uint8_t *)v0[12];
      uint64_t v31 = v0[8];
      log = v20;
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v99 = swift_slowAlloc();
      buf = v32;
      *(_DWORD *)uint64_t v32 = 136446210;
      uint64_t v79 = v26;
      NewsLiveActivity.id.getter();
      sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
      uint64_t v33 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v35 = v34;
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
      v0[5] = sub_100024BC0(v33, v35, &v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v79, v91);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Reached maximum number of retries. Will not retry scheduling task for activity id=%{public}s", buf, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*((void (**)(uint64_t, uint64_t))v81 + 1))(v93, v95);
      uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v36(v23, v85);
      v36(v87, v85);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v91);
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v93, v95);
      uint64_t v64 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v64(v23, v24);
      v64(v22, v24);
    }
    goto LABEL_3;
  }
  v96 = v12;
  uint64_t v38 = v0[28];
  uint64_t v37 = v0[29];
  uint64_t v40 = v0[26];
  uint64_t v39 = v0[27];
  uint64_t v41 = v0[25];
  ScheduledLiveActivity.scheduleDate.getter();
  ScheduledLiveActivity.originalScheduleDate.getter();
  Date.addingTimeInterval(_:)();
  uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v42(v39, v41);
  sub_100025D8C(&qword_10006B058, (void (*)(uint64_t))&type metadata accessor for Date);
  char v43 = dispatch thunk of static Comparable.< infix(_:_:)();
  v42(v38, v41);
  v42(v37, v41);
  if (v43)
  {
    uint64_t v44 = v0[23];
    uint64_t v45 = v0[19];
    uint64_t v46 = v0[20];
    uint64_t v47 = v0[6];
    static Logger.liveActivityDaemon.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v44, v47, v45);
    uint64_t v48 = Logger.logObject.getter();
    os_log_type_t typea = static os_log_type_t.default.getter();
    BOOL v49 = os_log_type_enabled(v48, typea);
    uint64_t v50 = v0[38];
    uint64_t v94 = v0[39];
    uint64_t v51 = v0[36];
    uint64_t v52 = v0[37];
    uint64_t v53 = v0[23];
    uint64_t v54 = v0[20];
    uint64_t v92 = v0[19];
    uint64_t v55 = v0[15];
    uint64_t v56 = v0[12];
    uint64_t v97 = v0[11];
    if (v49)
    {
      uint64_t v86 = v0[15];
      uint64_t v88 = v0[36];
      uint64_t v57 = v0[9];
      uint64_t v58 = v0[10];
      uint64_t v78 = v0[8];
      loga = v48;
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      uint64_t v99 = swift_slowAlloc();
      uint64_t v80 = v53;
      *(_DWORD *)uint64_t v59 = 136446210;
      NewsLiveActivity.id.getter();
      sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
      uint64_t v60 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v62 = v61;
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v78);
      v0[4] = sub_100024BC0(v60, v62, &v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v80, v92);
      _os_log_impl((void *)&_mh_execute_header, loga, typea, "Retry schedule date exceeds maximum subscription delay. Will not retry scheduling task for activity id=%{public}s", v59, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v86, v97);
      uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
      v63(v50, v88);
      v63(v94, v88);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v92);
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v97);
      v77 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
      v77(v50, v51);
      v77(v94, v51);
    }
LABEL_3:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  uint64_t v65 = v0[31];
  uint64_t v66 = v0[25];
  uint64_t v68 = v0[17];
  uint64_t v67 = v0[18];
  uint64_t v69 = v0[16];
  (*(void (**)(uint64_t, void, void))(v0[37] + 16))(v67, v0[38], v0[36]);
  uint64_t v70 = enum case for NewsLiveActivitySubscriptionState.scheduled(_:);
  uint64_t v71 = type metadata accessor for NewsLiveActivitySubscriptionState();
  uint64_t v72 = *(void *)(v71 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 104))(v67, v70, v71);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v72 + 56))(v67, 0, 1, v71);
  v96(v65, 1, 1, v66);
  uint64_t v73 = type metadata accessor for NewsLiveActivityChangeSource();
  uint64_t v74 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56);
  v74(v68, 1, 1, v73);
  v74(v69, 1, 1, v73);
  NewsLiveActivity.with(subscriptionState:lastUpdatedContentDate:subscriptionSource:dismissalSource:)();
  sub_100025DD4(v69, &qword_10006B068);
  sub_100025DD4(v68, &qword_10006B068);
  sub_100025DD4(v65, &qword_10006B2C0);
  sub_100025DD4(v67, &qword_10006B070);
  v75 = (void *)swift_task_alloc();
  v0[40] = v75;
  void *v75 = v0;
  v75[1] = sub_1000206B0;
  uint64_t v76 = v0[24];
  return sub_10002106C(v76);
}

uint64_t sub_1000206B0()
{
  *(void *)(*(void *)v1 + 328) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100020B38;
  }
  else {
    uint64_t v2 = sub_1000207C4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000207C4()
{
  uint64_t v1 = (void *)(v0[7] + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityRepository);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100017A60(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[42] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10002088C;
  uint64_t v5 = v0[24];
  return dispatch thunk of NewsLiveActivityRepository.store(_:)(v5, v2, v3);
}

uint64_t sub_10002088C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100020988, 0, 0);
}

uint64_t sub_100020988()
{
  uint64_t v1 = v0[38];
  uint64_t v2 = v0[39];
  uint64_t v3 = v0[36];
  uint64_t v4 = v0[37];
  (*(void (**)(void, void))(v0[20] + 8))(v0[24], v0[19]);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v1, v3);
  v5(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100020B38()
{
  uint64_t v46 = v0;
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[6];
  static Logger.liveActivityDaemon.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v39 = v0[38];
    uint64_t v41 = v0[39];
    uint64_t v36 = v0[37];
    uint64_t v37 = v0[36];
    uint64_t v35 = v0[24];
    uint64_t v28 = v0[21];
    uint64_t v30 = v0[20];
    uint64_t v43 = v0[19];
    uint64_t v32 = v0[12];
    uint64_t v7 = v0[10];
    uint64_t v33 = v0[11];
    uint64_t v34 = v0[13];
    uint64_t v9 = v0[8];
    uint64_t v8 = v0[9];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v29 = (void *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446466;
    NewsLiveActivity.id.getter();
    sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
    uint64_t v11 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    v0[2] = sub_100024BC0(v11, v13, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v31(v28, v43);
    *(_WORD *)(v10 + 12) = 2114;
    swift_errorRetain();
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v29 = v14;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to re-schedule live activity id=%{public}s, error: %{public}@", (uint8_t *)v10, 0x16u);
    sub_1000170E8(&qword_10006B018);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
    v31(v35, v43);
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v15(v39, v37);
    v15(v41, v37);
  }
  else
  {
    uint64_t v44 = v0[39];
    uint64_t v16 = v0[37];
    uint64_t v17 = v0[36];
    uint64_t v40 = v0[24];
    uint64_t v42 = v0[38];
    uint64_t v18 = v5;
    uint64_t v19 = v0[20];
    uint64_t v20 = v0[21];
    uint64_t v21 = v0[19];
    uint64_t v22 = v0[12];
    uint64_t v38 = v0[13];
    uint64_t v23 = v0[11];

    swift_errorRelease();
    swift_errorRelease();
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v24(v20, v21);
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v38, v23);
    v24(v40, v21);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v25(v42, v17);
    v25(v44, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

uint64_t sub_10002106C(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for NewsroomActivityID();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  uint8_t v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Date();
  v2[18] = v5;
  v2[19] = *(void *)(v5 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  sub_1000170E8(&qword_10006B048);
  v2[24] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ScheduledLiveActivity();
  v2[25] = v6;
  v2[26] = *(void *)(v6 - 8);
  v2[27] = swift_task_alloc();
  return _swift_task_switch(sub_1000212C4, 0, 0);
}

uint64_t sub_1000212C4()
{
  uint64_t v76 = v0;
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[24];
  NewsLiveActivity.scheduledActivityOrLogError.getter(v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100025DD4(v0[24], &qword_10006B048);
LABEL_3:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  uint64_t v5 = v0[22];
  uint64_t v6 = v0[18];
  uint64_t v7 = v0[19];
  uint64_t v8 = v0[14];
  (*(void (**)(void, void, void))(v0[26] + 32))(v0[27], v0[24], v0[25]);
  ScheduledLiveActivity.scheduleDate.getter();
  ScheduledLiveActivity.activityID.getter();
  uint64_t v69 = ScheduledLiveActivity.backgroundTaskID.getter();
  unint64_t v70 = v9;
  static Date.now.getter();
  sub_100025D8C(&qword_10006B058, (void (*)(uint64_t))&type metadata accessor for Date);
  char v10 = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v7 += 8;
  v0[28] = v11;
  v0[29] = v7 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v74 = v11;
  v11(v5, v6);
  unint64_t v12 = (void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  unint64_t v13 = (void (**)(uint64_t, uint64_t, uint64_t))(v7 + 8);
  uint64_t v71 = v0[23];
  uint64_t v15 = v0[17];
  uint64_t v14 = v0[18];
  uint64_t v16 = v0[13];
  if (v10)
  {
    uint64_t v17 = v0[20];
    uint64_t v18 = v0[15];
    static Logger.liveActivityDaemon.getter();
    (*v12)(v18, v15, v16);
    (*v13)(v17, v71, v14);
    swift_bridgeObjectRetain();
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t type = static os_log_type_t.default.getter();
    BOOL v20 = os_log_type_enabled(v19, type);
    uint64_t v22 = v0[14];
    uint64_t v21 = v0[15];
    uint64_t v23 = v0[13];
    uint64_t v24 = v0[10];
    uint64_t v25 = v0[11];
    uint64_t v26 = v0[9];
    if (v20)
    {
      uint64_t v67 = v0[10];
      uint64_t v61 = v0[20];
      uint64_t v62 = v0[18];
      uint64_t v65 = v0[9];
      uint64_t v27 = swift_slowAlloc();
      v75[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136446722;
      sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
      uint64_t v28 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[4] = sub_100024BC0(v28, v29, v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v72 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v72(v21, v23);
      *(_WORD *)(v27 + 12) = 2082;
      swift_bridgeObjectRetain();
      v0[5] = sub_100024BC0(v69, v70, v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v27 + 22) = 2082;
      sub_100025D8C(&qword_10006BAD0, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[6] = sub_100024BC0(v30, v31, v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v74(v61, v62);
      _os_log_impl((void *)&_mh_execute_header, v19, type, "LiveActivityService: will schedule live activity id=%{public}s taskID=%{public}s date=%{public}s", (uint8_t *)v27, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v25, v65);
    }
    else
    {
      uint64_t v48 = v0[20];
      uint64_t v49 = v0[18];
      uint64_t v72 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v72(v0[15], v0[13]);
      swift_bridgeObjectRelease_n();
      v74(v48, v49);

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
    }
    sub_100021ED0();
    uint64_t v55 = (void (*)(uint64_t, uint64_t))v0[28];
    uint64_t v57 = v0[26];
    uint64_t v56 = v0[27];
    uint64_t v58 = v0[25];
    uint64_t v59 = v0[23];
    uint64_t v60 = v0[18];
    v72(v0[17], v0[13]);
    v55(v59, v60);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v58);
    goto LABEL_3;
  }
  uint64_t v32 = v0[21];
  uint64_t v33 = v0[16];
  static Logger.liveActivityDaemon.getter();
  (*v12)(v33, v15, v16);
  (*v13)(v32, v71, v14);
  uint64_t v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.default.getter();
  BOOL v36 = os_log_type_enabled(v34, v35);
  uint64_t v37 = v0[16];
  uint64_t v38 = v0[13];
  uint64_t v39 = v0[14];
  uint64_t v40 = v0[12];
  uint64_t v42 = v0[9];
  uint64_t v41 = v0[10];
  if (v36)
  {
    uint64_t v73 = v0[12];
    uint64_t v64 = v0[21];
    uint64_t v66 = v0[18];
    uint64_t v43 = swift_slowAlloc();
    v75[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 136446466;
    sub_100025D8C(&qword_10006B010, (void (*)(uint64_t))&type metadata accessor for NewsroomActivityID);
    uint64_t v44 = dispatch thunk of CustomStringConvertible.description.getter();
    os_log_type_t v63 = v35;
    v0[2] = sub_100024BC0(v44, v45, v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v46(v37, v38);
    *(_WORD *)(v43 + 12) = 2048;
    Date.timeIntervalSinceReferenceDate.getter();
    v0[3] = v47;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v74(v64, v66);
    _os_log_impl((void *)&_mh_execute_header, v34, v63, "LiveActivityService: will immediately start live activity. Schedule date has passed. id=%{public}s date=%f", (uint8_t *)v43, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v73, v42);
  }
  else
  {
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    uint64_t v51 = v0[18];
    uint64_t v52 = v0[21];
    v46(v0[16], v0[13]);
    v74(v52, v51);

    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
  }
  v0[30] = v46;
  sub_100025440(v69, v70);
  swift_bridgeObjectRelease();
  uint64_t v53 = (void *)swift_task_alloc();
  v0[31] = v53;
  *uint64_t v53 = v0;
  v53[1] = sub_100021C98;
  uint64_t v54 = v0[7];
  return sub_10001C114(v54);
}

uint64_t sub_100021C98()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100021D94, 0, 0);
}

uint64_t sub_100021D94()
{
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v6 = *(void *)(v0 + 144);
  (*(void (**)(void, void))(v0 + 240))(*(void *)(v0 + 136), *(void *)(v0 + 104));
  v2(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

void sub_100021ED0()
{
  uint64_t v0 = type metadata accessor for Date();
  uint64_t v51 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)v48 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v56 = *(void *)(v3 - 8);
  uint64_t v57 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v54 = (char *)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v53 = (char *)v48 - v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v48 - v8;
  uint64_t v10 = ScheduledLiveActivity.backgroundTaskID.getter();
  unint64_t v12 = v11;
  sub_1000226FC(v10, v11);
  id v52 = self;
  id v13 = [v52 sharedScheduler];
  uint64_t v14 = v10;
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [v13 taskRequestForIdentifier:v15];

  if (v16)
  {
    uint64_t v17 = v55;
    static Logger.liveActivityDaemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v50 = v0;
      uint64_t v21 = (uint8_t *)v20;
      uint64_t v49 = (void *)swift_slowAlloc();
      id v59 = v49;
      *(_DWORD *)uint64_t v21 = 136446210;
      v48[1] = v21 + 4;
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_100024BC0(v14, v12, (uint64_t *)&v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Background task (%{public}s) already exists. Will cancel existing task.", v21, 0xCu);
      swift_arrayDestroy();
      uint64_t v22 = v55;
      swift_slowDealloc();
      uint64_t v0 = v50;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v56 + 8))(v9, v57);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v56 + 8))(v9, v57);
      uint64_t v22 = v17;
    }
    sub_100025440(v14, v12);
    if (v22) {
      swift_errorRelease();
    }
    uint64_t v55 = 0;
  }
  ScheduledLiveActivity.scheduleDate.getter();
  Date.timeIntervalSinceNow.getter();
  double v24 = v23;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v2, v0);
  ScheduledLiveActivity.scheduleDelay.getter();
  double v26 = v24 + v25;
  id v27 = objc_allocWithZone((Class)BGNonRepeatingSystemTaskRequest);
  swift_bridgeObjectRetain();
  NSString v28 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v29 = [v27 initWithIdentifier:v28];

  [v29 setRequiresNetworkConnectivity:1];
  [v29 setScheduleAfter:v26];
  ScheduledLiveActivity.scheduleTimeWindow.getter();
  [v29 setTrySchedulingBefore:v26 + v30];
  [v29 setPriority:2];
  id v31 = v29;
  ScheduledLiveActivity.randomInitialDelay.getter();
  objc_msgSend(v31, "setRandomInitialDelay:");

  id v32 = v31;
  [v32 setNetworkDownloadSize:ScheduledLiveActivity.expectedDownloadByteSize.getter()];

  uint64_t v33 = v53;
  static Logger.liveActivityDaemon.getter();
  swift_bridgeObjectRetain();
  uint64_t v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = swift_slowAlloc();
    id v59 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_100024BC0(v14, v12, (uint64_t *)&v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v36 + 12) = 2048;
    uint64_t v58 = *(void *)&v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Will schedule background task=%s scheduleAfter=%f", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v37 = *(void (**)(char *, uint64_t))(v56 + 8);
  v37(v33, v57);
  id v38 = [v52 sharedScheduler];
  id v59 = 0;
  unsigned __int8 v39 = [v38 submitTaskRequest:v32 error:&v59];

  if (v39)
  {
    id v40 = v59;
  }
  else
  {
    id v41 = v59;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    static Logger.liveActivityDaemon.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v55 = v37;
      uint64_t v46 = (void *)v45;
      *(_DWORD *)uint64_t v44 = 138412290;
      swift_errorRetain();
      uint64_t v47 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v59 = v47;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v46 = v47;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Failed to submit background task, error: %@", v44, 0xCu);
      sub_1000170E8(&qword_10006B018);
      swift_arrayDestroy();
      uint64_t v37 = v55;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    v37(v54, v57);
    swift_willThrow();
  }
}

void sub_1000226FC(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.liveActivityDaemon.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v19 = v6;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v3;
    id v13 = (uint8_t *)v12;
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)id v13 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_100024BC0(a1, a2, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Will register for handling background task: %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  id v14 = [self sharedScheduler];
  NSString v15 = String._bridgeToObjectiveC()();
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = (uint64_t)sub_100025B90;
  aBlock[5] = v16;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000240C4;
  aBlock[3] = (uint64_t)&unk_100062690;
  uint64_t v17 = _Block_copy(aBlock);
  swift_release();
  [v14 registerForTaskWithIdentifier:v15 usingQueue:0 launchHandler:v17];
  _Block_release(v17);
}

void sub_100022A10(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000170E8(&qword_10006B220);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = (void *)Strong;
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      uint64_t v13 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
      id v14 = (void *)swift_allocObject();
      v14[2] = 0;
      v14[3] = 0;
      v14[4] = v10;
      v14[5] = v12;
      id v15 = a1;
      id v16 = v10;
      uint64_t v17 = sub_10001A6F0((uint64_t)v8, (uint64_t)&unk_10006B028, (uint64_t)v14);
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v12;
      *(void *)(v18 + 24) = v17;
      aBlock[4] = sub_100025D1C;
      aBlock[5] = v18;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10001A6AC;
      aBlock[3] = &unk_100062708;
      uint64_t v19 = _Block_copy(aBlock);
      id v20 = v15;
      swift_retain();
      swift_release();
      [v12 setExpirationHandler:v19];
      _Block_release(v19);

      swift_release();
      return;
    }
  }
  static Logger.liveActivityDaemon.getter();
  uint64_t v21 = a1;
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v30 = v2;
    double v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v29 = v3;
    double v26 = (void *)v25;
    *(_DWORD *)double v24 = 138543362;
    aBlock[0] = v21;
    id v27 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v26 = v21;

    uint64_t v2 = v30;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Unexpected task type: %{public}@)", v24, 0xCu);
    sub_1000170E8(&qword_10006B018);
    swift_arrayDestroy();
    uint64_t v3 = v29;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v22 = v21;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  [v21 setTaskCompleted];
}

uint64_t sub_100022E1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100026628;
  return sub_100022EB8(a5);
}

uint64_t sub_100022EB8(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = type metadata accessor for NewsLiveActivitySubscriptionState();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ScheduledLiveActivity();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for NewsLiveActivity();
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  uint8_t v2[16] = swift_task_alloc();
  sub_1000170E8(&qword_10006B038);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v2[19] = v6;
  v2[20] = *(void *)(v6 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  return _swift_task_switch(sub_1000230F8, 0, 0);
}

uint64_t sub_1000230F8()
{
  uint64_t v25 = v0;
  uint64_t v1 = (void *)v0[5];
  static Logger.liveActivityDaemon.getter();
  id v2 = v1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v21 = v0[20];
    uint64_t v22 = v0[19];
    uint64_t v23 = v0[23];
    uint64_t v5 = (void *)v0[5];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446210;
    id v7 = [v5 identifier];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    v0[4] = sub_100024BC0(v8, v10, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Will handle background task: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v11(v23, v22);
  }
  else
  {
    uint64_t v12 = v0[23];
    uint64_t v13 = v0[19];
    uint64_t v14 = v0[20];
    id v15 = (void *)v0[5];

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v11(v12, v13);
  }
  v0[24] = v11;
  id v16 = (void *)(v0[6] + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityRepository);
  uint64_t v17 = v16[3];
  uint64_t v18 = v16[4];
  sub_100017A60(v16, v17);
  uint64_t v19 = (void *)swift_task_alloc();
  v0[25] = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_100023380;
  return dispatch thunk of NewsLiveActivityRepository.activities.getter(v17, v18);
}

uint64_t sub_100023380(uint64_t a1)
{
  *(void *)(*(void *)v1 + 208) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100023480, 0, 0);
}

uint64_t sub_100023480()
{
  uint64_t v71 = v0;
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
LABEL_13:
    uint64_t v29 = 1;
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v8 = *(void (**)(void, uint64_t, void))(v3 + 16);
  uint64_t v6 = v3 + 16;
  id v7 = v8;
  uint64_t v9 = v1 + ((*(unsigned __int8 *)(v6 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 64));
  unint64_t v10 = (unsigned int (**)(uint64_t, uint64_t))(v5 + 88);
  int v68 = enum case for NewsLiveActivitySubscriptionState.scheduled(_:);
  uint64_t v61 = (void (**)(uint64_t, void))(v5 + 96);
  uint64_t v62 = (void (**)(void, void))(v5 + 8);
  uint64_t v60 = (void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  uint64_t v67 = (void (**)(void, void))(v6 - 8);
  uint64_t v64 = (void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v66 = *(void *)(v6 + 56);
  swift_bridgeObjectRetain();
  uint64_t v58 = v10;
  id v59 = v8;
  while (1)
  {
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v12 = *(void *)(v0 + 56);
    v7(*(void *)(v0 + 120), v9, *(void *)(v0 + 104));
    NewsLiveActivity.subscriptionState.getter();
    if ((*v10)(v11, v12) != v68)
    {
      (*v62)(*(void *)(v0 + 72), *(void *)(v0 + 56));
      goto LABEL_4;
    }
    uint64_t v13 = v6;
    uint64_t v14 = *(void *)(v0 + 96);
    uint64_t v16 = *(void *)(v0 + 72);
    uint64_t v15 = *(void *)(v0 + 80);
    uint64_t v17 = *(void **)(v0 + 40);
    (*v61)(v16, *(void *)(v0 + 56));
    (*v60)(v14, v16, v15);
    uint64_t v18 = ScheduledLiveActivity.backgroundTaskID.getter();
    uint64_t v20 = v19;
    id v21 = [v17 identifier];
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;

    uint64_t v25 = *(void *)(v0 + 96);
    uint64_t v26 = *(void *)(v0 + 80);
    if (v18 == v22 && v20 == v24) {
      break;
    }
    char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*v64)(v25, v26);
    uint64_t v6 = v13;
    unint64_t v10 = v58;
    id v7 = v59;
    if (v28) {
      goto LABEL_15;
    }
LABEL_4:
    (*v67)(*(void *)(v0 + 120), *(void *)(v0 + 104));
    v9 += v66;
    if (!--v2)
    {
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease_n();
  (*v64)(v25, v26);
LABEL_15:
  uint64_t v30 = *(void *)(v0 + 144);
  uint64_t v32 = *(void *)(v0 + 112);
  uint64_t v31 = *(void *)(v0 + 120);
  uint64_t v33 = *(void *)(v0 + 104);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v30, v31, v33);
  uint64_t v29 = 0;
LABEL_16:
  uint64_t v35 = *(void *)(v0 + 136);
  uint64_t v34 = *(void *)(v0 + 144);
  uint64_t v36 = *(void *)(v0 + 104);
  uint64_t v37 = *(void *)(v0 + 112);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56))(v34, v29, 1, v36);
  swift_bridgeObjectRelease();
  sub_100025D24(v34, v35);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36) == 1)
  {
    id v38 = *(void **)(v0 + 40);
    sub_100025DD4(*(void *)(v0 + 136), &qword_10006B038);
    static Logger.liveActivityDaemon.getter();
    id v39 = v38;
    id v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    BOOL v42 = os_log_type_enabled(v40, v41);
    os_log_type_t v43 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
    uint64_t v44 = *(void *)(v0 + 168);
    uint64_t v45 = *(void *)(v0 + 144);
    uint64_t v46 = *(void *)(v0 + 152);
    uint64_t v47 = *(void **)(v0 + 40);
    if (v42)
    {
      uint64_t v69 = *(void *)(v0 + 144);
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 136446210;
      uint64_t v65 = v43;
      id v49 = [v47 identifier];
      uint64_t v63 = v44;
      uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v52 = v51;

      *(void *)(v0 + 16) = sub_100024BC0(v50, v52, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Unable to find scheduled activity with background task id: %{public}s", v48, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v65(v63, v46);
      uint64_t v53 = v69;
    }
    else
    {

      v43(v44, v46);
      uint64_t v53 = v45;
    }
    sub_100025DD4(v53, &qword_10006B038);
    [*(id *)(v0 + 40) setTaskCompleted];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v57 = *(uint64_t (**)(void))(v0 + 8);
    return v57();
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 112) + 32))(*(void *)(v0 + 128), *(void *)(v0 + 136), *(void *)(v0 + 104));
    uint64_t v54 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v54;
    *uint64_t v54 = v0;
    v54[1] = sub_100023A9C;
    uint64_t v55 = *(void *)(v0 + 128);
    return sub_10001C114(v55);
  }
}

uint64_t sub_100023A9C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100023B98, 0, 0);
}

uint64_t sub_100023B98()
{
  uint64_t v28 = v0;
  uint64_t v1 = *(void **)(v0 + 40);
  static Logger.liveActivityDaemon.getter();
  id v2 = v1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v20 = *(void *)(v0 + 152);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 144);
    uint64_t v21 = *(void *)(v0 + 112);
    uint64_t v22 = *(void *)(v0 + 176);
    uint64_t v23 = *(void *)(v0 + 104);
    uint64_t v24 = *(void *)(v0 + 128);
    uint64_t v5 = *(void **)(v0 + 40);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446210;
    id v7 = [v5 identifier];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    *(void *)(v0 + 24) = sub_100024BC0(v8, v10, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Did handle background task: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v25(v22, v20);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v24, v23);
  }
  else
  {
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
    uint64_t v12 = *(void *)(v0 + 176);
    uint64_t v13 = *(void *)(v0 + 152);
    uint64_t v26 = *(void *)(v0 + 144);
    uint64_t v14 = *(void *)(v0 + 128);
    uint64_t v15 = *(void *)(v0 + 104);
    uint64_t v16 = *(void *)(v0 + 112);
    uint64_t v17 = *(void **)(v0 + 40);

    v11(v12, v13);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  }
  sub_100025DD4(v26, &qword_10006B038);
  [*(id *)(v0 + 40) setTaskCompleted];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

void sub_100023E98(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.liveActivityDaemon.getter();
  uint64_t v8 = a1;
  unint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v16 = a2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v15 = v5;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138543362;
    uint64_t v17 = v8;
    uint64_t v13 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v14 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Live activity scheduling task expired, task=%{public}@", v12, 0xCu);
    sub_1000170E8(&qword_10006B018);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v15;
    swift_slowDealloc();
  }
  else
  {

    unint64_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  Task.cancel()();
}

void sub_1000240C4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000242A8(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  void v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  id v7 = (void *)swift_task_alloc();
  void v3[5] = v7;
  *id v7 = v3;
  v7[1] = sub_10002436C;
  return sub_10001BA20((uint64_t)v6);
}

uint64_t sub_10002436C()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  id v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  uint64_t v8 = *(void *)(v3 + 32);
  if (v2)
  {
    uint64_t v9 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  os_log_type_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t sub_10002468C(int a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  void v4[4] = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  void v4[5] = v10;
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10006B090 + dword_10006B090);
  id v12 = a4;
  uint64_t v13 = (void *)swift_task_alloc();
  v4[6] = v13;
  void *v13 = v4;
  v13[1] = sub_10002479C;
  return v15(v6, v8, v9, v11);
}

uint64_t sub_10002479C()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_1000249EC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100024AC8;
  return v6(a1);
}

uint64_t sub_100024AC8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100024BC0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100024C94(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000265C0((uint64_t)v12, *a3);
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
      sub_1000265C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000185C0((uint64_t)v12);
  return v7;
}

uint64_t sub_100024C94(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100024E50(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_100024E50(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100024EE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000250C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000250C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100024EE8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100025060(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100025060(uint64_t a1, uint64_t a2)
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
  sub_1000170E8(&qword_10006B0B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000250C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000170E8(&qword_10006B0B8);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for LiveActivityService()
{
  return self;
}

uint64_t sub_10002523C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002527C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100026628;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100026628;
  return sub_10001AAC0();
}

uint64_t sub_100025350()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100025388(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *size_t v5 = v2;
  v5[1] = sub_10001A5B8;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10006AFF0 + dword_10006AFF0);
  return v6(a1, v4);
}

id sub_100025440(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  os_log_type_t v41 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  BOOL v42 = (void (*)(char *, uint64_t))((char *)&v41 - v9);
  __chkstk_darwin(v8);
  size_t v11 = (char *)&v41 - v10;
  static Logger.liveActivityDaemon.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v44 = v5;
  if (v14)
  {
    uint64_t v43 = v4;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    id v47 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_100024BC0(a1, a2, (uint64_t *)&v47);
    uint64_t v4 = v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "LiveActivityService: will cancel background task id=%{public}s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v16 = *(void (**)(char *, uint64_t))(v44 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  }
  v16(v11, v4);
  uint64_t v17 = self;
  id v18 = [v17 sharedScheduler];
  NSString v19 = String._bridgeToObjectiveC()();
  uint64_t v20 = a1;
  id v21 = [v18 taskRequestForIdentifier:v19];

  if (v21)
  {
    id v22 = [v17 sharedScheduler];
    NSString v23 = String._bridgeToObjectiveC()();
    id v47 = 0;
    unsigned int v24 = [v22 cancelTaskRequestWithIdentifier:v23 error:&v47];

    if (v24)
    {
      return v47;
    }
    else
    {
      id v32 = v47;
      uint64_t v33 = _convertNSErrorToError(_:)();

      swift_willThrow();
      uint64_t v34 = v41;
      static Logger.liveActivityDaemon.getter();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      swift_bridgeObjectRetain();
      uint64_t v45 = v33;
      swift_errorRetain();
      uint64_t v35 = Logger.logObject.getter();
      os_log_type_t v36 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        BOOL v42 = v16;
        uint64_t v43 = v4;
        uint64_t v38 = v37;
        id v39 = (void *)swift_slowAlloc();
        id v47 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 136446466;
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_100024BC0(v20, a2, (uint64_t *)&v47);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v38 + 12) = 2114;
        swift_errorRetain();
        uint64_t v40 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v46 = v40;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v39 = v40;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "Unable to cancel task request, id=%{public}s, error: %{public}@", (uint8_t *)v38, 0x16u);
        sub_1000170E8(&qword_10006B018);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v42(v41, v43);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_errorRelease();
        swift_errorRelease();

        v16(v34, v4);
      }
      return (id)swift_willThrow();
    }
  }
  else
  {
    uint64_t v26 = v42;
    static Logger.liveActivityDaemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v43 = v4;
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      id v47 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_100024BC0(v20, a2, (uint64_t *)&v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "LiveActivityService: no existing background with id=%{public}s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v30 = v43;
      uint64_t v31 = v42;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v31 = v26;
      uint64_t v30 = v4;
    }
    return (id)((uint64_t (*)(void, uint64_t))v16)(v31, v30);
  }
}

uint64_t sub_100025B58()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100025B90(void *a1)
{
}

uint64_t sub_100025B98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100025BA8()
{
  return swift_release();
}

uint64_t sub_100025BB0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100025BF8()
{
  uint64_t v2 = *(void *)(v0 + 40);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_100026628;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100026628;
  return sub_100022EB8(v2);
}

uint64_t sub_100025CDC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100025D1C()
{
  sub_100023E98(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100025D24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000170E8(&qword_10006B038);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100025D8C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100025DD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000170E8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100025E30()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100025E80()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10001A5B8;
  uint64_t v7 = (uint64_t (*)(int, int, void *, void *))((char *)&dword_10006B080 + dword_10006B080);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_100025F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a3;
  v4[7] = a4;
  void v4[4] = a1;
  void v4[5] = a2;
  uint64_t v5 = type metadata accessor for Logger();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_10002600C, 0, 0);
}

uint64_t sub_10002600C()
{
  NSString v19 = v0;
  static Logger.liveActivityDaemon.getter();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = v0[7];
    uint64_t v16 = v0[8];
    uint64_t v17 = v0[10];
    unint64_t v4 = v0[5];
    uint64_t v14 = v0[6];
    uint64_t v15 = v0[9];
    uint64_t v5 = v0[4];
    uint64_t v6 = swift_slowAlloc();
    v18[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446466;
    swift_bridgeObjectRetain();
    v0[2] = sub_100024BC0(v5, v4, v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2082;
    swift_bridgeObjectRetain();
    v0[3] = sub_100024BC0(v14, v3, v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "LiveActivityService: will cancel live activity, id=%{public}s backgroundTaskID=%{public}s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  }
  else
  {
    uint64_t v8 = v0[9];
    uint64_t v7 = v0[10];
    uint64_t v9 = v0[8];
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  sub_100025440(v0[6], v0[7]);
  id v10 = [self sharedScheduler];
  NSString v11 = String._bridgeToObjectiveC()();
  [v10 deregisterTaskWithIdentifier:v11];

  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_1000262F0()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100026338()
{
  os_log_type_t v2 = (void *)v0[2];
  unint64_t v3 = (void *)v0[3];
  unint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100026628;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_10006B098 + dword_10006B098);
  return v6(v2, v3, v4);
}

uint64_t sub_1000263F0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100026628;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10006BA88 + dword_10006BA88);
  return v6(v2, v3, v4);
}

uint64_t sub_1000264B4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000264F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100026628;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10006BA98 + dword_10006BA98);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1000265C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_10002662C(void *a1)
{
  sub_100017A60(a1, a1[3]);
  sub_1000170E8(&qword_10006B158);
  uint64_t result = (void *)dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    unsigned int v2 = [result isPrivateDataSyncingAllowed];
    swift_unknownObjectRelease();
    type metadata accessor for PrivateDataContext();
    if (v2)
    {
      sub_10002689C();
      uint64_t v3 = (void *)static CKContainer.defaultPrivateSecure.getter();
      uint64_t v4 = static PrivateDataContext.readWriteCloud(container:apsMachServiceName:)();

      return (void *)v4;
    }
    else
    {
      return (void *)static PrivateDataContext.readWriteLocal.getter();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for PrivateDataAssembly()
{
  return self;
}

uint64_t sub_100026720()
{
  uint64_t v0 = type metadata accessor for Scope();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProxyContainer.public.getter();
  type metadata accessor for PrivateDataContext();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Scope.singleton(_:), v0);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  ProxyContainer.private.getter();
  RegistrationContainer.lazy(block:)();
  return swift_release();
}

unint64_t sub_10002689C()
{
  unint64_t result = qword_10006B160;
  if (!qword_10006B160)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006B160);
  }
  return result;
}

uint64_t sub_1000268DC()
{
  uint64_t v1 = sub_1000170E8(&qword_10006B220);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TaskPriority();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  void v6[4] = v0;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  id v8 = v0;
  if (v7 == 1)
  {
    sub_100025DD4((uint64_t)v3, &qword_10006B220);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_10006B270;
  *(void *)(v12 + 24) = v6;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_100026B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  return _swift_task_switch(sub_100026B3C, 0, 0);
}

uint64_t sub_100026B3C()
{
  sub_10002ABB8();
  uint64_t v1 = static OS_dispatch_queue.main.getter();
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v0[6] = sub_10002AC30;
  v0[7] = v2;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_1000296BC;
  v0[5] = &unk_1000628C0;
  uint64_t v3 = _Block_copy(v0 + 2);
  swift_release();
  xpc_set_event_stream_handler("com.apple.alarm", v1, v3);
  _Block_release(v3);

  id v4 = FCNotificationsLog;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100026CE4;
  return sub_100026DD8();
}

uint64_t sub_100026CE4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100026DD8()
{
  v1[5] = v0;
  uint64_t v2 = type metadata accessor for Date();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  sub_1000170E8(&qword_10006B240);
  v1[9] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for DelayedNotificationTimetable();
  v1[10] = v3;
  v1[11] = *(void *)(v3 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  return _swift_task_switch(sub_100026F34, 0, 0);
}

uint64_t sub_100026F34()
{
  if ((sub_100027718() & 1) == 0)
  {
    xpc_set_event();
    id v8 = FCNotificationsLog;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    goto LABEL_5;
  }
  uint64_t v1 = xpc_copy_event();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (void *)FCNotificationsLog;
    sub_1000170E8((uint64_t *)&unk_10006AB60);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_10004E5F0;
    v0[2] = 0;
    v0[3] = 0xE000000000000000;
    v0[4] = v2;
    id v5 = v3;
    sub_1000170E8(&qword_10006B258);
    _print_unlocked<A, B>(_:_:)();
    uint64_t v6 = v0[2];
    uint64_t v7 = v0[3];
    *(void *)(v4 + 56) = &type metadata for String;
    *(void *)(v4 + 64) = sub_100017184();
    *(void *)(v4 + 32) = v6;
    *(void *)(v4 + 40) = v7;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  uint64_t v11 = (void *)swift_task_alloc();
  v0[14] = v11;
  void *v11 = v0;
  v11[1] = sub_10002719C;
  uint64_t v12 = v0[9];
  uint64_t v13 = v0[5];
  return sub_100028A90(v12, v13);
}

uint64_t sub_10002719C()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v1 = sub_10002761C;
  }
  else
  {
    uint64_t v1 = sub_1000272B4;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_1000272B4()
{
  uint64_t v1 = v0[9];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[11] + 48))(v1, 1, v0[10]) != 1)
  {
    uint64_t v3 = v0[12];
    uint64_t v2 = v0[13];
    uint64_t v4 = v0[6];
    uint64_t v5 = v0[7];
    sub_100029A08(v1, v2);
    sub_100029A6C(v2, v3);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      uint64_t v6 = v0[13];
      xpc_set_event();
      id v7 = FCNotificationsLog;
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      id v8 = FCNotificationsLog;
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      uint64_t v9 = v6;
LABEL_10:
      sub_100029AD0(v9);
      goto LABEL_11;
    }
    (*(void (**)(void, void, void))(v0[7] + 32))(v0[8], v0[12], v0[6]);
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    uint64_t result = Date.timeIntervalSince1970.getter();
    double v13 = ceil(v12);
    if ((~*(void *)&v13 & 0x7FF0000000000000) != 0)
    {
      if (v13 > -9.22337204e18)
      {
        if (v13 < 9.22337204e18)
        {
          int64_t v14 = 1000000000 * (uint64_t)v13;
          if ((unsigned __int128)((uint64_t)v13 * (__int128)1000000000) >> 64 == v14 >> 63)
          {
            uint64_t v15 = v0[13];
            uint64_t v17 = v0[7];
            uint64_t v16 = v0[8];
            uint64_t v18 = v0[6];
            xpc_dictionary_set_date(v10, "Date", v14);
            xpc_set_event();
            NSString v19 = (void *)FCNotificationsLog;
            sub_1000170E8((uint64_t *)&unk_10006AB60);
            uint64_t v20 = swift_allocObject();
            *(_OWORD *)(v20 + 16) = xmmword_10004E5F0;
            sub_10001712C();
            id v21 = v19;
            uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter();
            uint64_t v24 = v23;
            *(void *)(v20 + 56) = &type metadata for String;
            *(void *)(v20 + 64) = sub_100017184();
            *(void *)(v20 + 32) = v22;
            *(void *)(v20 + 40) = v24;
            static os_log_type_t.default.getter();
            os_log(_:dso:log:type:_:)();
            swift_bridgeObjectRelease();

            swift_unknownObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
            uint64_t v9 = v15;
            goto LABEL_10;
          }
LABEL_17:
          __break(1u);
          return result;
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  sub_100025DD4(v1, &qword_10006B240);
LABEL_11:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_10002761C()
{
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[11] + 56))(v0[9], 1, 1, v0[10]);
  sub_100025DD4(v0[9], &qword_10006B240);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100027718()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR___NDDelayedNotificationScheduler_configurationManager) possiblyUnfetchedAppConfiguration];
  if (([v1 respondsToSelector:"useNotificationsV2"] & 1) == 0
    || ![v1 useNotificationsV2])
  {
    id v5 = FCNotificationsLog;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

LABEL_6:
    uint64_t v4 = 0;
    goto LABEL_7;
  }
  id v2 = [*(id *)(v0 + OBJC_IVAR___NDDelayedNotificationScheduler_notificationCenter) notificationSettings];
  id v3 = [v2 authorizationStatus];

  if (v3 != (id)2)
  {
    id v7 = (void *)FCNotificationsLog;
    sub_1000170E8((uint64_t *)&unk_10006AB60);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_10004E5F0;
    *(void *)(v8 + 56) = &type metadata for Int;
    *(void *)(v8 + 64) = &protocol witness table for Int;
    *(void *)(v8 + 32) = v3;
    id v9 = v7;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  uint64_t v4 = 1;
LABEL_7:
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_1000278B8()
{
  v1[18] = v0;
  type metadata accessor for Date();
  v1[19] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for NotificationHistoryItem();
  v1[20] = v2;
  v1[21] = *(void *)(v2 - 8);
  v1[22] = swift_task_alloc();
  return _swift_task_switch(sub_1000279A4, 0, 0);
}

uint64_t sub_1000279A4()
{
  if (sub_100027718())
  {
    id v1 = (void *)swift_task_alloc();
    v0[23] = v1;
    *id v1 = v0;
    v1[1] = sub_100027AA0;
    v1[5] = v0[18];
    return _swift_task_switch(sub_100028454, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
}

uint64_t sub_100027AA0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 192) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100027BA0, 0, 0);
}

uint64_t sub_100027BA0()
{
  if (*(void *)(v0 + 192))
  {
    uint64_t v1 = *(void **)(*(void *)(v0 + 144) + OBJC_IVAR___NDDelayedNotificationScheduler_notificationCenter);
    id v2 = [*(id *)(v0 + 192) notificationItem];
    id v3 = [v2 canonicalID];

    if (v3)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      id v5 = sub_100029C1C();
      NSString v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v7 = [self requestWithIdentifier:v6 content:v5 trigger:0];
      *(void *)(v0 + 200) = v7;

      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 24) = sub_100027DBC;
      uint64_t v8 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = sub_100028928;
      *(void *)(v0 + 104) = &unk_100062910;
      *(void *)(v0 + 112) = v8;
      [v1 addNotificationRequest:v7 withCompletionHandler:v0 + 80];
      uint64_t v4 = v0 + 16;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_await(v4);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    id v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_100027DBC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    id v2 = sub_1000282B4;
  }
  else {
    id v2 = sub_100027ECC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100027ECC()
{
  uint64_t v1 = *(void **)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 144);

  id v3 = (void *)(v2 + OBJC_IVAR___NDDelayedNotificationScheduler_notificationHistory);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR___NDDelayedNotificationScheduler_notificationHistory + 24);
  uint64_t v5 = v3[4];
  sub_100017A60(v3, v4);
  id v6 = [v1 notificationItem];
  Date.init()();
  NotificationHistoryItem.init(_:notifiedAt:)();
  id v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v7;
  *id v7 = v0;
  v7[1] = sub_100027FE0;
  uint64_t v8 = *(void *)(v0 + 176);
  return NotificationHistoryType.add(_:)(v8, v4, v5);
}

uint64_t sub_100027FE0()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v3 = v2[22];
  uint64_t v4 = v2[21];
  uint64_t v5 = v2[20];
  if (v0)
  {
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v6 = sub_10002B198;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v6 = sub_100028178;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_100028178()
{
  uint64_t v1 = *(void **)(v0 + 192);
  uint64_t v2 = (void *)FCNotificationsLog;
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10004E5F0;
  id v4 = v2;
  id v5 = [v1 description];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 64) = sub_100017184();
  *(void *)(v3 + 32) = v6;
  *(void *)(v3 + 40) = v8;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  id v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_1000282B4()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = v0[26];
  uint64_t v3 = (void *)v0[24];
  swift_willThrow();

  id v4 = FCNotificationsLog;
  static os_log_type_t.error.getter();
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v5 = swift_allocObject();
  v0[15] = 0;
  *(_OWORD *)(v5 + 16) = xmmword_10004E5F0;
  v0[16] = 0xE000000000000000;
  v0[17] = v2;
  sub_1000170E8(&qword_10006B260);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[16];
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100017184();
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100028434(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return _swift_task_switch(sub_100028454, 0, 0);
}

uint64_t sub_100028454()
{
  uint64_t v1 = *(void *)(v0 + 40);
  id v2 = FCNotificationsLog;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_100017A60((void *)(v1 + OBJC_IVAR___NDDelayedNotificationScheduler_notificationVendor), *(void *)(v1 + OBJC_IVAR___NDDelayedNotificationScheduler_notificationVendor + 24));
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100028544;
  return sub_10002B970();
}

uint64_t sub_100028544(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = v1;
  swift_task_dealloc();
  if (v1) {
    id v4 = sub_1000287D4;
  }
  else {
    id v4 = sub_100028658;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100028658()
{
  uint64_t v1 = *(void **)(v0 + 56);
  if (v1)
  {
    id v2 = (void *)FCNotificationsLog;
    sub_1000170E8((uint64_t *)&unk_10006AB60);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_10004E5F0;
    id v4 = v2;
    id v5 = [v1 description];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    *(void *)(v3 + 56) = &type metadata for String;
    *(void *)(v3 + 64) = sub_100017184();
    *(void *)(v3 + 32) = v6;
    *(void *)(v3 + 40) = v8;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    uint64_t v9 = *(void *)(v0 + 56);
  }
  else
  {
    id v10 = FCNotificationsLog;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    uint64_t v9 = 0;
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v11(v9);
}

uint64_t sub_1000287D4()
{
  uint64_t v1 = v0[8];
  id v2 = FCNotificationsLog;
  static os_log_type_t.error.getter();
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v3 = swift_allocObject();
  v0[2] = 0;
  *(_OWORD *)(v3 + 16) = xmmword_10004E5F0;
  v0[3] = 0xE000000000000000;
  v0[4] = v1;
  sub_1000170E8(&qword_10006B260);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 64) = sub_100017184();
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6(0);
}

uint64_t sub_100028928(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_1000170E8(&qword_10006B260);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t type metadata accessor for DelayedNotificationScheduler()
{
  return self;
}

uint64_t sub_100028A90(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = type metadata accessor for Date();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for DelayedNotificationTimetable();
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  return _swift_task_switch(sub_100028BAC, 0, 0);
}

uint64_t sub_100028BAC()
{
  uint64_t v1 = v0[8];
  id v2 = FCNotificationsLog;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_100017A60((void *)(v1 + OBJC_IVAR___NDDelayedNotificationScheduler_timetableFactory), *(void *)(v1 + OBJC_IVAR___NDDelayedNotificationScheduler_timetableFactory + 24));
  Date.init()();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[15] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100028CC0;
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[11];
  return sub_100016180(v4, v5);
}

uint64_t sub_100028CC0()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 88);
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = *(void *)(*(void *)v1 + 72);
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_100028FB8;
  }
  else {
    uint64_t v5 = sub_100028E30;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100028E30()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[7];
  uint64_t v5 = (void *)FCNotificationsLog;
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10004E5F0;
  v0[4] = 0;
  v0[5] = 0xE000000000000000;
  id v7 = v5;
  _print_unlocked<A, B>(_:_:)();
  uint64_t v8 = v0[4];
  uint64_t v9 = v0[5];
  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 64) = sub_100017184();
  *(void *)(v6 + 32) = v8;
  *(void *)(v6 + 40) = v9;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_100029A08(v1, v4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  id v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100028FB8()
{
  uint64_t v1 = v0[16];
  id v2 = FCNotificationsLog;
  static os_log_type_t.error.getter();
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v3 = swift_allocObject();
  v0[2] = 0;
  *(_OWORD *)(v3 + 16) = xmmword_10004E5F0;
  v0[3] = 0xE000000000000000;
  v0[6] = v1;
  sub_1000170E8(&qword_10006B260);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 64) = sub_100017184();
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100029130()
{
  uint64_t v0 = sub_1000170E8(&qword_10006B220);
  __chkstk_darwin(v0 - 8);
  id v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    id v5 = objc_allocWithZone((Class)NDAssertion);
    NSString v6 = String._bridgeToObjectiveC()();
    id v7 = [v5 initWithName:v6];

    uint64_t v8 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    void v9[4] = v4;
    v9[5] = v7;
    sub_10001A6F0((uint64_t)v2, (uint64_t)&unk_10006B290, (uint64_t)v9);
    return swift_release();
  }
  return result;
}

uint64_t sub_10002929C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return _swift_task_switch(sub_1000292BC, 0, 0);
}

uint64_t sub_1000292BC()
{
  xpc_set_event();
  id v1 = FCNotificationsLog;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  id v2 = FCNotificationsLog;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000293F4;
  return sub_1000278B8();
}

uint64_t sub_1000293F4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000294F0, 0, 0);
}

uint64_t sub_1000294F0()
{
  id v1 = FCNotificationsLog;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  void *v2 = v0;
  v2[1] = sub_1000295C8;
  return sub_100026DD8();
}

uint64_t sub_1000295C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000296BC(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_10002971C()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *id v1 = v0;
  v1[1] = sub_100026628;
  return sub_100026DD8();
}

uint64_t sub_100029934()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *id v1 = v0;
  v1[1] = sub_10001A5B8;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100026628;
  return sub_100026DD8();
}

uint64_t sub_100029A08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DelayedNotificationTimetable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100029A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DelayedNotificationTimetable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100029AD0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DelayedNotificationTimetable();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100029B30()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100029B70()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100026628;
  v3[8] = v2;
  return _swift_task_switch(sub_100026B3C, 0, 0);
}

id sub_100029C1C()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)UNMutableNotificationContent) init];
  id v3 = objc_msgSend(objc_msgSend(v0, "headline"), "title");
  swift_unknownObjectRelease();
  if (v3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v6 = v5;

    type metadata accessor for Capabilities();
    swift_bridgeObjectRetain();
    if (static Capabilities.isInternalBuild()())
    {
      id v7 = [v1 notificationItem];
      unsigned int v8 = [v7 source];

      uint64_t v9 = 0x2096A49FF0;
      if (v8 == 5)
      {
        unint64_t v10 = 0xA500000000000000;
      }
      else
      {
        uint64_t v9 = 0;
        unint64_t v10 = 0xE000000000000000;
      }
      uint64_t v16 = v9;
      unint64_t v17 = v10;
      swift_bridgeObjectRetain();
      v11._countAndFlagsBits = v4;
      v11._id object = v6;
      String.append(_:)(v11);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v2 setTitle:v12];

  NSString v13 = [v1 bodyText];
  if (!v13)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v2, "setBody:", v13, v16, v17);

  [v2 setCategoryIdentifier:FCNotificationArticleCategory];
  sub_100029E6C();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 setUserInfo:isa];

  return v2;
}

void *sub_100029E6C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v11 + 1) = v0;
  AnyHashable.init<A>(_:)();
  sub_1000170E8(&qword_10006B2A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E5F0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 56) = v3;
  unint64_t v4 = sub_10002A148(inited);
  uint64_t v12 = sub_1000170E8(&qword_10006B2B0);
  *(void *)&long long v11 = v4;
  sub_10002AD40(&v11, v10);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100042418(v10, (uint64_t)v13, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_10002B018((uint64_t)v13);
  *(void *)&long long v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v11 + 1) = v6;
  AnyHashable.init<A>(_:)();
  id v7 = sub_10002A26C();
  uint64_t v12 = sub_1000170E8(&qword_10006B2B8);
  *(void *)&long long v11 = v7;
  sub_10002AD40(&v11, v10);
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_100042418(v10, (uint64_t)v13, v8);
  swift_bridgeObjectRelease();
  sub_10002B018((uint64_t)v13);
  return &_swiftEmptyDictionarySingleton;
}

unint64_t sub_10002A01C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000170E8(&qword_10006B2D8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_10002B130(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100040C28(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10002AD40(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
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

unint64_t sub_10002A148(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000170E8(&qword_10006B2D0);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100040C28(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

void *sub_10002A26C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000170E8(&qword_10006B2C0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v60 - v6;
  uint64_t v66 = &_swiftEmptyDictionarySingleton;
  *(void *)&long long v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v63 + 1) = v8;
  AnyHashable.init<A>(_:)();
  id v9 = objc_msgSend(objc_msgSend(v0, "headline"), "articleID");
  swift_unknownObjectRelease();
  if (v9)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    uint64_t v64 = &type metadata for String;
    *(void *)&long long v63 = v10;
    *((void *)&v63 + 1) = v12;
    sub_10002AD40(&v63, v62);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = &_swiftEmptyDictionarySingleton;
    sub_100042418(v62, (uint64_t)v65, isUniquelyReferenced_nonNull_native);
    uint64_t v66 = v61;
    swift_bridgeObjectRelease();
    sub_10002B018((uint64_t)v65);
  }
  else
  {
    sub_10002AD50((uint64_t)v65, &v63);
    sub_10002B018((uint64_t)v65);
    sub_100025DD4((uint64_t)&v63, &qword_10006B2C8);
  }
  *(void *)&long long v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v63 + 1) = v14;
  AnyHashable.init<A>(_:)();
  id v15 = objc_msgSend(objc_msgSend(v0, "headline"), "title");
  swift_unknownObjectRelease();
  if (v15)
  {
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = v17;

    uint64_t v64 = &type metadata for String;
    *(void *)&long long v63 = v16;
    *((void *)&v63 + 1) = v18;
    sub_10002AD40(&v63, v62);
    NSString v19 = v66;
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v19;
    sub_100042418(v62, (uint64_t)v65, v20);
    uint64_t v66 = v61;
    swift_bridgeObjectRelease();
    sub_10002B018((uint64_t)v65);
  }
  else
  {
    sub_10002AD50((uint64_t)v65, &v63);
    sub_10002B018((uint64_t)v65);
    sub_100025DD4((uint64_t)&v63, &qword_10006B2C8);
  }
  *(void *)&long long v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v63 + 1) = v21;
  AnyHashable.init<A>(_:)();
  id v22 = objc_msgSend(objc_msgSend(v1, "headline"), "shortExcerpt");
  swift_unknownObjectRelease();
  if (v22)
  {
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    uint64_t v64 = &type metadata for String;
    *(void *)&long long v63 = v23;
    *((void *)&v63 + 1) = v25;
    sub_10002AD40(&v63, v62);
    uint64_t v26 = v66;
    char v27 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v26;
    sub_100042418(v62, (uint64_t)v65, v27);
    uint64_t v66 = v61;
    swift_bridgeObjectRelease();
    sub_10002B018((uint64_t)v65);
  }
  else
  {
    sub_10002AD50((uint64_t)v65, &v63);
    sub_10002B018((uint64_t)v65);
    sub_100025DD4((uint64_t)&v63, &qword_10006B2C8);
  }
  *(void *)&long long v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v63 + 1) = v28;
  AnyHashable.init<A>(_:)();
  id v29 = objc_msgSend(objc_msgSend(v1, "headline"), "sourceChannelID");
  swift_unknownObjectRelease();
  if (v29)
  {
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v32 = v31;

    uint64_t v64 = &type metadata for String;
    *(void *)&long long v63 = v30;
    *((void *)&v63 + 1) = v32;
    sub_10002AD40(&v63, v62);
    uint64_t v33 = v66;
    char v34 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v33;
    sub_100042418(v62, (uint64_t)v65, v34);
    uint64_t v66 = v61;
    swift_bridgeObjectRelease();
    sub_10002B018((uint64_t)v65);
  }
  else
  {
    sub_10002AD50((uint64_t)v65, &v63);
    sub_10002B018((uint64_t)v65);
    sub_100025DD4((uint64_t)&v63, &qword_10006B2C8);
  }
  *(void *)&long long v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v63 + 1) = v35;
  AnyHashable.init<A>(_:)();
  id v36 = objc_msgSend(objc_msgSend(v1, "headline"), "sourceChannel");
  swift_unknownObjectRelease();
  if (v36)
  {
    id v37 = [v36 name];
    swift_unknownObjectRelease();
    uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v40 = v39;

    uint64_t v64 = &type metadata for String;
    *(void *)&long long v63 = v38;
    *((void *)&v63 + 1) = v40;
    sub_10002AD40(&v63, v62);
    os_log_type_t v41 = v66;
    char v42 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v41;
    sub_100042418(v62, (uint64_t)v65, v42);
    uint64_t v66 = v61;
    swift_bridgeObjectRelease();
    sub_10002B018((uint64_t)v65);
  }
  else
  {
    sub_10002AD50((uint64_t)v65, &v63);
    sub_10002B018((uint64_t)v65);
    sub_100025DD4((uint64_t)&v63, &qword_10006B2C8);
  }
  *(void *)&long long v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v63 + 1) = v43;
  AnyHashable.init<A>(_:)();
  id v44 = objc_msgSend(objc_msgSend(v1, "headline"), "sourceChannel");
  swift_unknownObjectRelease();
  if (v44
    && (id v45 = [v44 nameCompact], swift_unknownObjectRelease(), v45))
  {
    uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v48 = v47;

    uint64_t v64 = &type metadata for String;
    *(void *)&long long v63 = v46;
    *((void *)&v63 + 1) = v48;
    sub_10002AD40(&v63, v62);
    id v49 = v66;
    char v50 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v49;
    sub_100042418(v62, (uint64_t)v65, v50);
    uint64_t v66 = v61;
    swift_bridgeObjectRelease();
    sub_10002B018((uint64_t)v65);
  }
  else
  {
    sub_10002AD50((uint64_t)v65, &v63);
    sub_10002B018((uint64_t)v65);
    sub_100025DD4((uint64_t)&v63, &qword_10006B2C8);
  }
  *(void *)&long long v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v63 + 1) = v51;
  AnyHashable.init<A>(_:)();
  id v52 = objc_msgSend(objc_msgSend(v1, "headline"), "publishDate");
  swift_unknownObjectRelease();
  if (v52)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v53 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v5, 0, 1, v53);
  }
  else
  {
    uint64_t v53 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v5, 1, 1, v53);
  }
  sub_10002B06C((uint64_t)v5, (uint64_t)v7);
  type metadata accessor for Date();
  uint64_t v54 = *(void *)(v53 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(v7, 1, v53) == 1)
  {
    sub_100025DD4((uint64_t)v7, &qword_10006B2C0);
    sub_10002AD50((uint64_t)v65, &v63);
    sub_10002B018((uint64_t)v65);
    sub_100025DD4((uint64_t)&v63, &qword_10006B2C8);
    return v66;
  }
  else
  {
    Date.timeIntervalSince1970.getter();
    uint64_t v64 = &type metadata for Double;
    *(void *)&long long v63 = v56;
    (*(void (**)(char *, uint64_t))(v54 + 8))(v7, v53);
    sub_10002AD40(&v63, v62);
    uint64_t v57 = v66;
    char v58 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v57;
    sub_100042418(v62, (uint64_t)v65, v58);
    uint64_t v55 = v61;
    swift_bridgeObjectRelease();
    sub_10002B018((uint64_t)v65);
  }
  return v55;
}

uint64_t sub_10002AB80()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10002ABB8()
{
  unint64_t result = qword_10006B280;
  if (!qword_10006B280)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_10006B280);
  }
  return result;
}

uint64_t sub_10002ABF8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002AC30()
{
  return sub_100029130();
}

uint64_t sub_10002AC38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002AC48()
{
  return swift_release();
}

uint64_t sub_10002AC50()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002AC98()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100026628;
  v3[2] = v2;
  return _swift_task_switch(sub_1000292BC, 0, 0);
}

_OWORD *sub_10002AD40(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

double sub_10002AD50@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100040CA0(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100042954();
      uint64_t v9 = v11;
    }
    sub_10002B018(*(void *)(v9 + 48) + 40 * v6);
    sub_10002AD40((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_10002AE4C(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_10002AE4C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10002B0D4(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = AnyHashable._rawHashValue(seed:)(*(void *)(a2 + 40));
        double result = sub_10002B018((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            uint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            char v20 = (_OWORD *)(v19 + 32 * v3);
            uint64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *char v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    id v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    id v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  uint64_t *v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10002B018(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002B06C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000170E8(&qword_10006B2C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B0D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10002B130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000170E8((uint64_t *)&unk_10006B2E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B19C()
{
  return 1;
}

Swift::Int sub_10002B1A4()
{
  return Hasher._finalize()();
}

void sub_10002B1E8()
{
}

Swift::Int sub_10002B210()
{
  return Hasher._finalize()();
}

uint64_t sub_10002B258()
{
  uint64_t v1 = 0x74696D696CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E6F697461727564;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x656372756F73;
  }
}

uint64_t sub_10002B2AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100031060(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10002B2D4()
{
  return 0;
}

void sub_10002B2E0(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10002B2EC(uint64_t a1)
{
  unint64_t v2 = sub_1000343E0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002B328(uint64_t a1)
{
  unint64_t v2 = sub_1000343E0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002B364(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a4;
  uint64_t v6 = sub_1000170E8(&qword_10006B568);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  long long v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017A60(a1, a1[3]);
  sub_1000343E0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v14 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v4)
  {
    char v13 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v12 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_10002B50C(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v7 = sub_1000311A8(a1);
  if (!v2)
  {
    *(void *)a2 = v4;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(double *)(a2 + 24) = v7;
  }
}

uint64_t sub_10002B540(void *a1)
{
  return sub_10002B364(a1, *v1, v1[1], v1[2]);
}

unint64_t sub_10002B564(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 2:
      unint64_t result = 0x6B6E615278616DLL;
      break;
    case 3:
      unint64_t result = 0x65726F63536E696DLL;
      break;
    case 4:
      unint64_t result = 0x694C656372756F73;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002B620(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000170E8(&qword_10006B528);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100017A60(a1, a1[3]);
  sub_100033D84();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v15 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    char v14 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v13 = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v12 = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    uint64_t v11 = *(void *)(v3 + 48);
    v10[15] = 4;
    sub_1000170E8(&qword_10006B510);
    sub_100033EC0(&qword_10006B530, (void (*)(void))sub_100033F30);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_10002B854()
{
  return sub_10002B564(*v0);
}

uint64_t sub_10002B85C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100031698(a1, a2);
  *a3 = result;
  return result;
}

void sub_10002B884(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10002B890(uint64_t a1)
{
  unint64_t v2 = sub_100033D84();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002B8CC(uint64_t a1)
{
  unint64_t v2 = sub_100033D84();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10002B908@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000313D0(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_10002B958(void *a1)
{
  return sub_10002B620(a1);
}

uint64_t sub_10002B970()
{
  v1[50] = v0;
  uint64_t v2 = type metadata accessor for Date();
  v1[51] = v2;
  v1[52] = *(void *)(v2 - 8);
  v1[53] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for NotificationHistoryItem();
  v1[54] = v3;
  v1[55] = *(void *)(v3 - 8);
  v1[56] = swift_task_alloc();
  v1[57] = swift_task_alloc();
  v1[58] = swift_task_alloc();
  sub_1000170E8(&qword_10006B410);
  v1[59] = swift_task_alloc();
  v1[60] = swift_task_alloc();
  v1[61] = swift_task_alloc();
  uint64_t v4 = (void *)swift_task_alloc();
  v1[62] = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10002BB3C;
  void v4[5] = v0;
  return _swift_task_switch(sub_10002D574, 0, 0);
}

uint64_t sub_10002BB3C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 504) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return _swift_task_switch(sub_10002BCD8, 0, 0);
  }
}

uint64_t sub_10002BCD8()
{
  id v1 = objc_msgSend(objc_msgSend(*(id *)(*(void *)(v0 + 400) + 16), "appConfigurationManager"), "possiblyUnfetchedAppConfiguration");
  swift_unknownObjectRelease();
  if (([v1 respondsToSelector:"delayedNotificationVendorConfigurationData"] & 1) == 0)
  {
    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  id v2 = [v1 delayedNotificationVendorConfigurationData];
  swift_unknownObjectRelease();
  if (!v2)
  {
LABEL_6:
    sub_10002E824();
    swift_allocError();
    swift_willThrow();
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(v0 + 504);
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  *(void *)(v0 + 512) = v4;
  *(void *)(v0 + 520) = v6;
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  sub_10001722C(v4, v6);
  JSONDecoder.init()();
  sub_10002E878();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  if (v3)
  {
    sub_1000172D8(v4, v6);
    sub_1000172D8(v4, v6);
    swift_release();
LABEL_7:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    long long v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  long long v9 = *(void **)(v0 + 400);
  swift_release();
  long long v10 = *(_OWORD *)(v0 + 88);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 72);
  *(_OWORD *)(v0 + 32) = v10;
  *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 104);
  *(void *)(v0 + 64) = *(void *)(v0 + 120);
  uint64_t v11 = (void *)FCNotificationsLog;
  *(void *)(v0 + 528) = sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10004E5F0;
  *(void *)(v0 + 344) = 0;
  *(void *)(v0 + 352) = 0xE000000000000000;
  long long v13 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 128) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v0 + 144) = v13;
  *(_OWORD *)(v0 + 160) = *(_OWORD *)(v0 + 48);
  *(void *)(v0 + 176) = *(void *)(v0 + 64);
  id v14 = v11;
  _print_unlocked<A, B>(_:_:)();
  uint64_t v15 = *(void *)(v0 + 344);
  uint64_t v16 = *(void *)(v0 + 352);
  *(void *)(v12 + 56) = &type metadata for String;
  unint64_t v17 = sub_100017184();
  *(void *)(v0 + 536) = v17;
  *(void *)(v12 + 64) = v17;
  *(void *)(v12 + 32) = v15;
  *(void *)(v12 + 40) = v16;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  uint64_t v18 = v9[7];
  uint64_t v19 = v9[8];
  sub_100017A60(v9 + 4, v18);
  char v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 544) = v20;
  *char v20 = v0;
  v20[1] = sub_10002C08C;
  return dispatch thunk of NotificationHistoryType.recentHistoryItems()(v0 + 224, v18, v19);
}

uint64_t sub_10002C08C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 552) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_10002E8CC(v2 + 16);
    uint64_t v3 = sub_10002D374;
  }
  else
  {
    uint64_t v3 = sub_10002C1A8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10002C1A8()
{
  v131 = v0;
  v120 = v0 + 38;
  v122 = v0 + 47;
  v123 = v0 + 33;
  uint64_t v114 = (uint64_t)(v0 + 2);
  uint64_t v1 = v0[55];
  uint64_t v2 = v0[52];
  v0[47] = (uint64_t)&_swiftEmptyDictionarySingleton;
  uint64_t v3 = v0[31];
  v116 = v0 + 28;
  uint64_t v4 = sub_100017A60(v0 + 28, v3);
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v6, v4, v3);
  v0[26] = swift_getAssociatedTypeWitness();
  v0[27] = swift_getAssociatedConformanceWitness();
  sub_10002E8F8(v0 + 23);
  dispatch thunk of Sequence.makeIterator()();
  swift_task_dealloc();
  long long v7 = 0;
  v129 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  v125 = (void (**)(uint64_t, uint64_t))(v2 + 8);
  v126 = (void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32);
  v124 = (void (**)(uint64_t, uint64_t))(v1 + 8);
  while (1)
  {
    v0[70] = (uint64_t)v7;
    uint64_t v8 = v0[61];
    uint64_t v9 = v0[54];
    sub_100019994((uint64_t)(v0 + 23), v0[26]);
    dispatch thunk of IteratorProtocol.next()();
    v127 = *v129;
    if ((*v129)(v8, 1, v9) == 1) {
      goto LABEL_19;
    }
    uint64_t v10 = v0[53];
    uint64_t v11 = v0[51];
    (*v126)(v0[58], v0[61], v0[54]);
    NotificationHistoryItem.notifiedAt.getter();
    Date.timeIntervalSinceNow.getter();
    double v13 = v12;
    (*v125)(v10, v11);
    if (v13 <= -86400.0) {
      break;
    }
    uint64_t v14 = NotificationHistoryItem.channelID.getter();
    uint64_t v16 = v15;
    sub_100030F18((uint64_t)v7);
    unint64_t v17 = (void *)*v122;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v130[0] = (Swift::Int)v17;
    void *v122 = 0x8000000000000000;
    unint64_t v26 = sub_100040C28(v14, v16);
    uint64_t v27 = v17[2];
    BOOL v28 = (v19 & 1) == 0;
    uint64_t v29 = v27 + v28;
    if (__OFADD__(v27, v28)) {
      goto LABEL_58;
    }
    char v30 = v19;
    if (v17[3] >= v29)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1000427A4();
        unint64_t v17 = (void *)v130[0];
      }
    }
    else
    {
      sub_100041390(v29, isUniquelyReferenced_nonNull_native);
      unint64_t v17 = (void *)v130[0];
      unint64_t v31 = sub_100040C28(v14, v16);
      if ((v30 & 1) != (v32 & 1))
      {
        return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      }
      unint64_t v26 = v31;
    }
    void *v122 = v17;
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
    {
      v17[(v26 >> 6) + 8] |= 1 << v26;
      uint64_t v33 = (uint64_t *)(v17[6] + 16 * v26);
      *uint64_t v33 = v14;
      v33[1] = v16;
      *(void *)(v17[7] + 8 * v26) = 0;
      uint64_t v34 = v17[2];
      uint64_t v35 = v34 + 1;
      BOOL v36 = __OFADD__(v34, 1);
      uint64_t v29 = swift_bridgeObjectRetain();
      if (v36) {
        goto LABEL_60;
      }
      v17[2] = v35;
    }
    uint64_t v37 = v17[7];
    swift_bridgeObjectRetain();
    uint64_t v29 = swift_bridgeObjectRelease();
    uint64_t v38 = *(void *)(v37 + 8 * v26);
    BOOL v39 = __OFADD__(v38, 1);
    uint64_t v40 = v38 + 1;
    if (v39) {
      goto LABEL_59;
    }
    uint64_t v41 = v0[58];
    uint64_t v42 = v0[54];
    *(void *)(v37 + 8 * v26) = v40;
    swift_bridgeObjectRelease();
    (*v124)(v41, v42);
    long long v7 = sub_10002D9E8;
  }
  (*v124)(v0[58], v0[54]);
LABEL_19:
  uint64_t v43 = v0[60];
  uint64_t v44 = v0[54];
  sub_1000185C0((uint64_t)(v0 + 23));
  v0[45] = (uint64_t)&_swiftEmptySetSingleton;
  uint64_t v45 = v0[31];
  uint64_t v46 = sub_100017A60(v116, v45);
  uint64_t v47 = *(void *)(v45 - 8);
  uint64_t v48 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v47 + 16))(v48, v46, v45);
  v0[41] = swift_getAssociatedTypeWitness();
  v0[42] = swift_getAssociatedConformanceWitness();
  sub_10002E8F8(v120);
  dispatch thunk of Sequence.makeIterator()();
  swift_task_dealloc();
  sub_100019994((uint64_t)v120, v0[41]);
  dispatch thunk of IteratorProtocol.next()();
  if (v127(v43, 1, v44) != 1)
  {
    id v49 = *v126;
    while (1)
    {
      uint64_t v50 = v0[53];
      uint64_t v51 = v0[51];
      v49(v0[57], v0[60], v0[54]);
      NotificationHistoryItem.notifiedAt.getter();
      Date.timeIntervalSinceNow.getter();
      double v53 = v52;
      (*v125)(v50, v51);
      if (v53 <= -(double)v0[2]) {
        break;
      }
      uint64_t v54 = v0[60];
      uint64_t v55 = v0[57];
      uint64_t v56 = v0[54];
      Swift::Int v57 = NotificationHistoryItem.clusterID.getter();
      sub_10002EDBC(v130, v57, v58);
      swift_bridgeObjectRelease();
      (*v124)(v55, v56);
      sub_100019994((uint64_t)v120, v0[41]);
      dispatch thunk of IteratorProtocol.next()();
      if (v127(v54, 1, v56) == 1) {
        goto LABEL_25;
      }
    }
    (*v124)(v0[57], v0[54]);
  }
LABEL_25:
  sub_1000185C0((uint64_t)v120);
  v0[46] = (uint64_t)&_swiftEmptySetSingleton;
  uint64_t v59 = v0[8];
  uint64_t v118 = *(void *)(v59 + 16);
  if (v118)
  {
    uint64_t v117 = v59 + 32;
    uint64_t v29 = swift_bridgeObjectRetain();
    unint64_t v60 = 0;
    uint64_t v115 = v59;
    while (v60 < *(void *)(v59 + 16))
    {
      uint64_t v64 = (double *)(v117 + 32 * v60);
      double v66 = *v64;
      uint64_t v65 = *((void *)v64 + 1);
      uint64_t v121 = *((void *)v64 + 2);
      double v67 = v64[3];
      swift_bridgeObjectRetain_n();
      NSString v68 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t v69 = FCNotificationSourceFromString();

      if (v69)
      {
        uint64_t v119 = v65;
        uint64_t v70 = v0[59];
        uint64_t v71 = v0[54];
        uint64_t v72 = v0[31];
        sub_100017A60(v116, v72);
        uint64_t v73 = *(void *)(v72 - 8);
        swift_task_alloc();
        (*(void (**)(void))(v73 + 16))();
        v0[36] = swift_getAssociatedTypeWitness();
        v0[37] = swift_getAssociatedConformanceWitness();
        sub_10002E8F8(v123);
        dispatch thunk of Sequence.makeIterator()();
        swift_task_dealloc();
        sub_100019994((uint64_t)v123, v0[36]);
        dispatch thunk of IteratorProtocol.next()();
        uint64_t v74 = 0;
        if (v127(v70, 1, v71) != 1)
        {
          uint64_t v74 = 0;
          v75 = *v126;
          while (1)
          {
            uint64_t v78 = v0[53];
            uint64_t v79 = v0[51];
            v75(v0[56], v0[59], v0[54]);
            NotificationHistoryItem.notifiedAt.getter();
            Date.timeIntervalSinceNow.getter();
            double v81 = v80;
            (*v125)(v78, v79);
            uint64_t v82 = v0[56];
            uint64_t v83 = v0[54];
            if (v81 <= -v67) {
              break;
            }
            int v84 = NotificationHistoryItem.source.getter();
            uint64_t v29 = ((uint64_t (*)(uint64_t, uint64_t))*v124)(v82, v83);
            if (v84 == v69)
            {
              BOOL v39 = __OFADD__(v74++, 1);
              if (v39)
              {
                __break(1u);
                goto LABEL_57;
              }
            }
            uint64_t v76 = v0[59];
            uint64_t v77 = v0[54];
            sub_100019994((uint64_t)v123, v0[36]);
            dispatch thunk of IteratorProtocol.next()();
            if (v127(v76, 1, v77) == 1) {
              goto LABEL_40;
            }
          }
          (*v124)(v0[56], v0[54]);
        }
LABEL_40:
        sub_1000185C0((uint64_t)v123);
        if (v74 >= v121)
        {
          uint64_t v85 = (void *)FCNotificationsLog;
          uint64_t v86 = swift_allocObject();
          *(_OWORD *)(v86 + 16) = xmmword_10004E5E0;
          *(void *)(v86 + 56) = &type metadata for Int;
          *(void *)(v86 + 64) = &protocol witness table for Int;
          *(void *)(v86 + 32) = v74;
          uint64_t v59 = v115;
          uint64_t v29 = v119;
          if ((~*(void *)&v67 & 0x7FF0000000000000) == 0) {
            goto LABEL_61;
          }
          if (v67 <= -9.22337204e18) {
            goto LABEL_62;
          }
          if (v67 >= 9.22337204e18) {
            goto LABEL_63;
          }
          uint64_t v87 = v0[67];
          *(void *)(v86 + 96) = &type metadata for Int;
          *(void *)(v86 + 104) = &protocol witness table for Int;
          *(void *)(v86 + 72) = (uint64_t)v67;
          *(void *)(v86 + 136) = &type metadata for String;
          *(void *)(v86 + 144) = v87;
          *(double *)(v86 + 112) = v66;
          *(void *)(v86 + 120) = v119;
          *(void *)(v86 + 176) = &type metadata for Int;
          *(void *)(v86 + 184) = &protocol witness table for Int;
          *(void *)(v86 + 152) = v121;
          *(void *)(v86 + 216) = &type metadata for String;
          *(void *)(v86 + 224) = v87;
          *(double *)(v86 + 192) = v66;
          *(void *)(v86 + 200) = v119;
          swift_bridgeObjectRetain();
          id v88 = v85;
          static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)();
          swift_bridgeObjectRelease();

          uint64_t v29 = sub_10002ECA8(v130, v69);
        }
        else
        {
          uint64_t v29 = swift_bridgeObjectRelease();
          uint64_t v59 = v115;
        }
      }
      else
      {
        uint64_t v61 = v0[67];
        id v62 = FCNotificationsLog;
        static os_log_type_t.error.getter();
        uint64_t v63 = swift_allocObject();
        *(_OWORD *)(v63 + 16) = xmmword_10004E5F0;
        *(void *)(v63 + 56) = &type metadata for String;
        *(void *)(v63 + 64) = v61;
        *(double *)(v63 + 32) = v66;
        *(void *)(v63 + 40) = v65;
        os_log(_:dso:log:type:_:)();
        swift_bridgeObjectRelease();
      }
      if (++v60 == v118)
      {
        sub_10002E8CC(v114);
        goto LABEL_47;
      }
    }
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v29, v19, v20, v21, v22, v23, v24, v25);
  }
LABEL_47:
  uint64_t v89 = v0[67];
  uint64_t v128 = v0[50];
  v90 = (void *)FCNotificationsLog;
  uint64_t v91 = swift_allocObject();
  *(_OWORD *)(v91 + 16) = xmmword_10004E5D0;
  id v92 = v90;
  swift_bridgeObjectRetain();
  uint64_t v93 = Dictionary.description.getter();
  uint64_t v95 = v94;
  swift_bridgeObjectRelease();
  *(void *)(v91 + 56) = &type metadata for String;
  *(void *)(v91 + 64) = v89;
  *(void *)(v91 + 32) = v93;
  *(void *)(v91 + 40) = v95;
  swift_bridgeObjectRetain();
  uint64_t v96 = Set.description.getter();
  uint64_t v98 = v97;
  swift_bridgeObjectRelease();
  *(void *)(v91 + 96) = &type metadata for String;
  *(void *)(v91 + 104) = v89;
  *(void *)(v91 + 72) = v96;
  *(void *)(v91 + 80) = v98;
  swift_bridgeObjectRetain();
  uint64_t v99 = Set.description.getter();
  uint64_t v101 = v100;
  swift_bridgeObjectRelease();
  *(void *)(v91 + 136) = &type metadata for String;
  *(void *)(v91 + 144) = v89;
  *(void *)(v91 + 112) = v99;
  *(void *)(v91 + 120) = v101;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  uint64_t v102 = *(void *)(v128 + 24);
  v103 = (void *)swift_task_alloc();
  v103[2] = v128;
  v103[3] = v114;
  v103[4] = v0 + 46;
  v103[5] = v122;
  v103[6] = v0 + 45;
  v104 = (void *)swift_task_alloc();
  v104[2] = v102;
  v104[3] = sub_10002EDAC;
  v104[4] = v103;
  sub_1000170E8(&qword_10006B430);
  OS_dispatch_queue.sync<A>(execute:)();
  sub_10002E8CC(v114);
  swift_task_dealloc();
  uint64_t v105 = v0[48];
  v0[71] = v105;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v105)
  {
    uint64_t v106 = v0[50];
    uint64_t v107 = swift_task_alloc();
    v0[72] = v107;
    *(void *)(v107 + 16) = v106;
    *(void *)(v107 + 24) = v105;
    v108 = (void *)swift_task_alloc();
    v0[73] = (uint64_t)v108;
    uint64_t v25 = sub_1000170E8(&qword_10006B438);
    void *v108 = v0;
    v108[1] = sub_10002D144;
    unint64_t v22 = 0x8000000100051C00;
    uint64_t v23 = sub_100030F28;
    uint64_t v29 = (uint64_t)(v0 + 49);
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    unint64_t v21 = 0xD000000000000012;
    uint64_t v24 = v107;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v29, v19, v20, v21, v22, v23, v24, v25);
  }
  unint64_t v109 = v0[65];
  uint64_t v110 = v0[64];
  sub_1000172D8(v110, v109);
  sub_1000172D8(v110, v109);
  uint64_t v111 = v0[70];
  sub_1000185C0((uint64_t)v116);
  sub_100030F18(v111);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v112 = (uint64_t (*)(void))v0[1];
  return v112(0);
}

uint64_t sub_10002D144()
{
  *(void *)(*(void *)v1 + 592) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10002D44C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10002D260;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002D260()
{
  uint64_t v1 = (void *)v0[71];
  unint64_t v2 = v0[65];
  uint64_t v3 = v0[64];
  sub_1000172D8(v3, v2);

  sub_1000172D8(v3, v2);
  uint64_t v7 = v0[49];
  uint64_t v4 = v0[70];
  sub_1000185C0((uint64_t)(v0 + 28));
  sub_100030F18(v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v7);
}

uint64_t sub_10002D374()
{
  unint64_t v1 = v0[65];
  uint64_t v2 = v0[64];
  sub_1000172D8(v2, v1);
  sub_1000172D8(v2, v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10002D44C()
{
  unint64_t v1 = (void *)v0[71];
  uint64_t v2 = v0[70];
  unint64_t v3 = v0[65];
  uint64_t v4 = v0[64];
  sub_1000172D8(v4, v3);
  sub_1000172D8(v4, v3);

  swift_task_dealloc();
  sub_1000185C0((uint64_t)(v0 + 28));
  sub_100030F18(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10002D554(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return _swift_task_switch(sub_10002D574, 0, 0);
}

uint64_t sub_10002D574()
{
  id v1 = FCNotificationsLog;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  *(void *)(v0 + 48) = [objc_allocWithZone((Class)NSDate) init];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  void *v2 = v0;
  v2[1] = sub_10002D66C;
  return sub_1000397EC();
}

uint64_t sub_10002D66C()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10002D888;
  }
  else {
    uint64_t v2 = sub_10002D780;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002D780()
{
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = (void *)FCNotificationsLog;
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10004E5F0;
  id v4 = v2;
  id v5 = objc_msgSend(v1, "fc_millisecondTimeIntervalUntilNow");
  *(void *)(v3 + 56) = &type metadata for UInt64;
  *(void *)(v3 + 64) = &protocol witness table for UInt64;
  *(void *)(v3 + 32) = v5;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_10002D888()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = (void *)v0[6];
  id v3 = FCNotificationsLog;
  static os_log_type_t.error.getter();
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v4 = swift_allocObject();
  v0[2] = 0;
  *(_OWORD *)(v4 + 16) = xmmword_10004E5F0;
  v0[3] = 0xE000000000000000;
  v0[4] = v1;
  sub_1000170E8(&qword_10006B260);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 64) = sub_100017184();
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  swift_willThrow();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

void sub_10002D9E8(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_10002D9F0@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X3>, uint64_t *a4@<X4>, uint64_t *a5@<X5>, uint64_t *a6@<X8>)
{
  uint64_t v7 = *a3;
  uint64_t v8 = *a4;
  uint64_t v9 = *a5;
  uint64_t v10 = *(void *)(a2 + 32);
  int v11 = *(unsigned __int8 *)(a2 + 40);
  int v12 = *(unsigned __int8 *)(a2 + 24);
  uint64_t v13 = *(void *)(a2 + 8);
  uint64_t v14 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1000318C8(a1, v13, v14, v12, v10, v11, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a6 = v15;
  return result;
}

void sub_10002DAC0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = a1;
  uint64_t v34 = sub_1000170E8(&qword_10006B448);
  uint64_t v5 = *(void *)(v34 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v34);
  uint64_t v33 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a2 + 16);
  sub_1000170E8((uint64_t *)&unk_10006B450);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10004E950;
  *(void *)(v8 + 32) = a3;
  aBlock[0] = v8;
  specialized Array._endMutation()();
  id v9 = objc_allocWithZone((Class)FCNotificationPayloadOperation);
  sub_10003369C(0, &qword_10006BB00);
  swift_unknownObjectRetain();
  id v10 = a3;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v12 = [v9 initWithContext:v7 notificationItems:isa];

  swift_unknownObjectRelease();
  uint64_t v13 = (void *)FCNotificationsLog;
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10004E960;
  id v15 = v13;
  id v16 = [v10 description];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;

  *(void *)(v14 + 56) = &type metadata for String;
  unint64_t v20 = sub_100017184();
  *(void *)(v14 + 64) = v20;
  *(void *)(v14 + 32) = v17;
  *(void *)(v14 + 40) = v19;
  id v21 = [v12 shortOperationDescription];
  if (v21)
  {
    unint64_t v22 = v21;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    *(void *)(v14 + 96) = &type metadata for String;
    *(void *)(v14 + 104) = v20;
    *(void *)(v14 + 72) = v23;
    *(void *)(v14 + 80) = v25;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    swift_bridgeObjectRelease();
    unint64_t v26 = v33;
    uint64_t v27 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v33, v32, v34);
    unint64_t v28 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v29 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v29 + v28, v26, v27);
    aBlock[4] = sub_100030FC4;
    aBlock[5] = v29;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002DF40;
    aBlock[3] = &unk_100062960;
    char v30 = _Block_copy(aBlock);
    swift_release();
    [v12 setCompletionHandler:v30];
    _Block_release(v30);
    [v12 start];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10002DE40(unint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain();
    sub_1000170E8(&qword_10006B448);
    return CheckedContinuation.resume(throwing:)();
  }
  if (!a1) {
    goto LABEL_10;
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    if (!result) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4)
    {
LABEL_9:
      swift_bridgeObjectRelease();
LABEL_10:
      sub_1000170E8(&qword_10006B448);
      return CheckedContinuation.resume(returning:)();
    }
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_9;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v5 = *(id *)(a1 + 32);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002DF40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_10003369C(0, &qword_10006B460);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002DFE4()
{
  id v10 = &_swiftEmptySetSingleton;
  int v11 = &_swiftEmptySetSingleton;
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v10;
  *(void *)(v2 + 24) = &v11;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_100033748;
  *(void *)(v3 + 24) = v2;
  void v9[4] = sub_100033760;
  v9[5] = v3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10002E43C;
  v9[3] = &unk_1000629D8;
  uint64_t v4 = _Block_copy(v9);
  swift_retain();
  swift_release();
  unsigned __int8 v5 = [v1 peekSyncWithAccessor:v4];
  _Block_release(v4);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = v11;
      swift_release();
    }
    else
    {
      id v8 = FCNotificationsLog;
      static os_log_type_t.error.getter();
      os_log(_:dso:log:type:_:)();

      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return 0;
    }
    return (uint64_t)v7;
  }
  return result;
}

void sub_10002E1D8(void *a1, uint64_t *a2, unint64_t **a3)
{
  id v6 = [a1 rankedAllSubscribedTagIDs];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v9 = sub_100033788(v8);
    swift_bridgeObjectRelease();
    id v10 = [a1 autoFavoriteTagIDs];
    if (v10)
    {
      int v11 = v10;
      uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v13 = sub_100033788(v12);
      swift_bridgeObjectRelease();
      id v14 = [a1 mutedTagIDs];
      if (v14)
      {

        *a2 = v9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (*(void *)(v13 + 16) <= *(void *)(v9 + 16) >> 3)
        {
          sub_10002FFFC(v13);
          swift_bridgeObjectRelease();
          id v15 = (unint64_t *)v9;
        }
        else
        {
          id v15 = sub_1000301A4(v13, v9);
          swift_bridgeObjectRelease();
        }
        *a3 = v15;
        swift_bridgeObjectRelease();
        return;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v16 = FCNotificationsLog;
      static os_log_type_t.error.getter();
    }
    else
    {
      swift_bridgeObjectRelease();
      id v16 = FCNotificationsLog;
      static os_log_type_t.error.getter();
    }
  }
  else
  {
    id v16 = FCNotificationsLog;
    static os_log_type_t.error.getter();
  }
  os_log(_:dso:log:type:_:)();
}

uint64_t sub_10002E43C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_10002E490()
{
  id v0 = (id)NewsCoreUserDefaults();
  uint64_t v1 = FCShowStoriesOnlyFromFavoritesSharedPreferenceKey;
  id v2 = [v0 valueForKey:FCShowStoriesOnlyFromFavoritesSharedPreferenceKey];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_1000336D8((uint64_t)v7);
    id v3 = (id)NewsCoreUserDefaults();
    unsigned int v4 = [v3 BOOLForKey:v1];

    if (v4)
    {
      id v5 = FCNotificationsLog;
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      return 1;
    }
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    sub_1000336D8((uint64_t)v7);
  }
  return 0;
}

uint64_t sub_10002E5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      int v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

BOOL sub_10002E6E0(int a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = static Hasher._hash(seed:bytes:count:)();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(_DWORD *)(v8 + 4 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_10002E7B0()
{
  swift_unknownObjectRelease();

  sub_1000185C0(v0 + 32);

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for DelayedNotificationVendor()
{
  return self;
}

unint64_t sub_10002E824()
{
  unint64_t result = qword_10006B420;
  if (!qword_10006B420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B420);
  }
  return result;
}

unint64_t sub_10002E878()
{
  unint64_t result = qword_10006B428;
  if (!qword_10006B428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B428);
  }
  return result;
}

uint64_t sub_10002E8CC(uint64_t a1)
{
  return a1;
}

uint64_t *sub_10002E8F8(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_10002E95C(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x64657269707865;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0x6B6E615278616DLL;
      break;
    case 4:
      unint64_t result = 0x65726F63536E696DLL;
      break;
    case 6:
      unint64_t result = 0x627550646574756DLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0xD000000000000021;
      break;
    case 9:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 10:
      unint64_t result = 0x6143656372756F73;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002EAA8(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10002E95C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10002E95C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10002EB34()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  sub_10002E95C(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_10002EB98()
{
  sub_10002E95C(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10002EBEC()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  sub_10002E95C(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t sub_10002EC4C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100033E74(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_10002EC7C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10002E95C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10002ECA8(_DWORD *a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = static Hasher._hash(seed:bytes:count:)();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    sub_10002F4D4(a2, v9, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(_DWORD *)(v10 + 4 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(_DWORD *)(v10 + 4 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_10002EDAC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10002D9F0(a1, *(void *)(v2 + 24), *(uint64_t **)(v2 + 32), *(uint64_t **)(v2 + 40), *(uint64_t **)(v2 + 48), a2);
}

uint64_t sub_10002EDBC(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    int v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10002F5FC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10002EF6C()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  sub_1000170E8((uint64_t *)&unk_10006B4E0);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    uint64_t v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  *uint64_t v6 = v26;
                }
                char v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
      uint64_t result = static Hasher._hash(seed:bytes:count:)();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v1 = v4;
  return result;
}

uint64_t sub_10002F1F4()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  sub_1000170E8(&qword_10006B440);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                char v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v1 = v4;
  return result;
}

uint64_t sub_10002F4D4(uint64_t result, unint64_t a2, char a3)
{
  int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10002EF6C();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_10002F798();
      goto LABEL_14;
    }
    sub_10002FAE4();
  }
  uint64_t v8 = *v3;
  uint64_t result = static Hasher._hash(seed:bytes:count:)();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(_DWORD *)(v10 + 4 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(void *)(v12 + 48) + 4 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

Swift::Int sub_10002F5FC(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  int v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10002F1F4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10002F930();
      goto LABEL_22;
    }
    sub_10002FD4C();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_10002F798()
{
  char v1 = v0;
  sub_1000170E8((uint64_t *)&unk_10006B4E0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *char v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10002F930()
{
  char v1 = v0;
  sub_1000170E8(&qword_10006B440);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *char v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10002FAE4()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  sub_1000170E8((uint64_t *)&unk_10006B4E0);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *char v1 = v4;
    return result;
  }
  unint64_t v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
    uint64_t result = static Hasher._hash(seed:bytes:count:)();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    char v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10002FD4C()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  sub_1000170E8(&qword_10006B440);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *char v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    char v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10002FFFC(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    int64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_100030614(v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:

  return swift_release();
}

unint64_t *sub_1000301A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_100033820();
                  return (unint64_t *)v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      int64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int v19 = Hasher._finalize()();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    unint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        unint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      __chkstk_darwin(isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_1000307A4((unint64_t *)((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0)), v30, v2, v21, &v38);
      swift_release();
      sub_100033820();
    }
    else
    {
      uint64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_1000307A4((unint64_t *)v33, v30, v2, v21, &v38);
      swift_release();
      sub_100033820();
      swift_slowDealloc();
    }
    return v32;
  }
  else
  {
    swift_release();
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_100030614(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10002F930();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_100030D1C(v8);
  uint64_t *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t *sub_1000307A4(unint64_t *result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v38 = result;
  *(unint64_t *)((char *)result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v39 = a3 + 56;
  while (2)
  {
    uint64_t v37 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          int64_t v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_45;
          }
          int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
          int64_t v15 = a5[3];
          if (v13 >= v14) {
            goto LABEL_43;
          }
          uint64_t v16 = a5[1];
          unint64_t v17 = *(void *)(v16 + 8 * v13);
          if (!v17)
          {
            int64_t v15 = v9 + 1;
            if (v9 + 2 >= v14) {
              goto LABEL_43;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              int64_t v13 = v9 + 2;
            }
            else
            {
              int64_t v15 = v9 + 2;
              if (v9 + 3 >= v14) {
                goto LABEL_43;
              }
              unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                int64_t v13 = v9 + 3;
              }
              else
              {
                int64_t v13 = v9 + 4;
                int64_t v15 = v9 + 3;
                if (v9 + 4 >= v14) {
                  goto LABEL_43;
                }
                unint64_t v17 = *(void *)(v16 + 8 * v13);
                if (!v17)
                {
                  int64_t v15 = v14 - 1;
                  int64_t v18 = v9 + 5;
                  while (v14 != v18)
                  {
                    unint64_t v17 = *(void *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      int64_t v13 = v18 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_43:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  return (unint64_t *)sub_100030A84(v38, a2, v37, a3);
                }
              }
            }
          }
LABEL_21:
          uint64_t v11 = (v17 - 1) & v17;
          unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
          int64_t v9 = v13;
        }
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v22 = Hasher._finalize()();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v39 + 8 * (v24 >> 6))) != 0) {
          break;
        }
LABEL_3:
        uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
      }
      uint64_t v27 = *(void *)(a3 + 48);
      uint64_t v28 = (void *)(v27 + 16 * v24);
      BOOL v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          uint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_29;
          }
        }
        goto LABEL_3;
      }
      uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
LABEL_29:
      unint64_t v30 = v38[v25];
      v38[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_45:
      __break(1u);
      return result;
    }
    if (v37 != 1) {
      continue;
    }
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_100030A84(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_1000170E8(&qword_10006B440);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_100030D1C(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v10 = Hasher._finalize()();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            _OWORD *v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_100030EE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100039E48(*(void *)(v1 + 16), *(void (**)(uint64_t *__return_ptr, void *))(v1 + 24), *(void *)(v1 + 32));
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_100030F18(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_100030F28(uint64_t a1)
{
  sub_10002DAC0(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100030F30()
{
  uint64_t v1 = sub_1000170E8(&qword_10006B448);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100030FC4(unint64_t a1, uint64_t a2)
{
  sub_1000170E8(&qword_10006B448);

  return sub_10002DE40(a1, a2);
}

uint64_t sub_100031048(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100031058()
{
  return swift_release();
}

uint64_t sub_100031060(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74696D696CLL && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

double sub_1000311A8(void *a1)
{
  uint64_t v4 = sub_1000170E8(&qword_10006B558);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100017A60(a1, a1[3]);
  sub_1000343E0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_1000185C0((uint64_t)a1);
  }
  else
  {
    v10[15] = 0;
    KeyedDecodingContainer.decode(_:forKey:)();
    v10[14] = 1;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode(_:forKey:)();
    v10[13] = 2;
    KeyedDecodingContainer.decode(_:forKey:)();
    double v2 = v9;
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1000185C0((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_1000313D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000170E8(&qword_10006B500);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017A60(a1, a1[3]);
  sub_100033D84();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_1000185C0((uint64_t)a1);
  }
  char v31 = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  if (v10) {
    uint64_t v11 = 86400;
  }
  else {
    uint64_t v11 = v9;
  }
  char v30 = 1;
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  if (v13) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = v12;
  }
  char v29 = 2;
  uint64_t v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v23 = v16;
  uint64_t v24 = v15;
  uint64_t v25 = v14;
  char v28 = 3;
  uint64_t v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v22 = v18;
  sub_1000170E8(&qword_10006B510);
  char v27 = 4;
  sub_100033EC0(&qword_10006B518, (void (*)(void))sub_100033E20);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  if (v26) {
    uint64_t v20 = v26;
  }
  else {
    uint64_t v20 = &_swiftEmptyArrayStorage;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_1000185C0((uint64_t)a1);
  uint64_t v21 = v25;
  *(void *)a2 = v11;
  *(void *)(a2 + 8) = v21;
  *(void *)(a2 + 16) = v24;
  *(unsigned char *)(a2 + 24) = v23 & 1;
  *(void *)(a2 + 32) = v17;
  *(unsigned char *)(a2 + 40) = v22 & 1;
  *(void *)(a2 + 48) = v20;
  return result;
}

uint64_t sub_100031698(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000016 && a2 == 0x80000001000520C0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x80000001000520E0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6B6E615278616DLL && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65726F63536E696DLL && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x694C656372756F73 && a2 == 0xEC0000007374696DLL)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1000318C8(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v270 = a7;
  int v281 = a6;
  int v282 = a4;
  uint64_t v273 = type metadata accessor for Date();
  uint64_t v14 = *(void *)(v273 - 8);
  __chkstk_darwin(v273);
  v272 = (char *)&v256 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10002DFE4();
  if (!v16)
  {
    id v203 = FCNotificationsLog;
    static os_log_type_t.error.getter();
    os_log(_:dso:log:type:_:)();

    uint64_t v24 = 0;
    uint64_t v204 = 0;
    uint64_t v205 = 0;
LABEL_239:
    sub_100030F18(v204);
    sub_100030F18(v205);
    return v24;
  }
  uint64_t v258 = a2;
  uint64_t v259 = a8;
  uint64_t v264 = v18;
  uint64_t v265 = v17;
  uint64_t v286 = v16;
  int v19 = sub_10002E490();
  uint64_t v20 = a1[3];
  v277 = a1;
  uint64_t v21 = sub_100017A60(a1, v20);
  __chkstk_darwin(v21);
  (*(void (**)(char *))(v23 + 16))((char *)&v256 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_10002E8F8(&v291);
  dispatch thunk of Sequence.makeIterator()();
  sub_100019994((uint64_t)&v291, AssociatedTypeWitness);
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v24 = (uint64_t)v289;
  uint64_t v25 = &type metadata for String;
  if (!v289)
  {
    v279 = 0;
    uint64_t v283 = 0;
    uint64_t v274 = 0;
    v262 = 0;
    v263 = 0;
    v266 = 0;
    v267 = 0;
    uint64_t v271 = 0;
    uint64_t v276 = 0;
    char v31 = &_swiftEmptyDictionarySingleton;
LABEL_208:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v24 = 0;
LABEL_209:
    unint64_t v64 = 0;
    goto LABEL_210;
  }
  uint64_t v287 = 0;
  uint64_t v276 = 0;
  uint64_t v271 = 0;
  v267 = 0;
  v266 = 0;
  v263 = 0;
  v262 = 0;
  uint64_t v274 = 0;
  uint64_t v283 = 0;
  v279 = 0;
  uint64_t v275 = a9;
  double v26 = v290;
  uint64_t v27 = v286;
  uint64_t v288 = v286 + 56;
  uint64_t v257 = a3;
  double v28 = *(double *)&a3;
  double v29 = *(double *)&a5;
  v268 = (void (**)(char *, uint64_t))(v14 + 8);
  if (v19) {
    int v30 = 8;
  }
  else {
    int v30 = 7;
  }
  int v261 = v30;
  char v31 = &_swiftEmptyDictionarySingleton;
  long long v260 = xmmword_10004E5F0;
  long long v269 = xmmword_10004E960;
  char v32 = v19;
  int v278 = v19;
  while (1)
  {
    id v34 = [(id)v24 suppressIfFollowingTagIDs];
    if (v34)
    {
      BOOL v35 = v34;
      v289 = 0;
      static Array._conditionallyBridgeFromObjectiveC(_:result:)();

      LOBYTE(v14) = (_BYTE)v289;
      if (v289) {
        break;
      }
    }
LABEL_44:
    if ((v282 & 1) == 0)
    {
      double v74 = (double)v287;
      sub_100017A60(v277, v277[3]);
      if (v74 / (double)dispatch thunk of Collection.count.getter() > v28)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v239 = (void *)FCNotificationsLog;
        sub_1000170E8((uint64_t *)&unk_10006AB60);
        uint64_t v240 = swift_allocObject();
        *(_OWORD *)(v240 + 16) = xmmword_10004E5D0;
        *(void *)(v240 + 56) = &type metadata for Int;
        *(void *)(v240 + 64) = &protocol witness table for Int;
        *(void *)(v240 + 32) = v287;
        sub_100017A60(v277, v277[3]);
        uint64_t v14 = v239;
        uint64_t v241 = dispatch thunk of Collection.count.getter();
        *(void *)(v240 + 96) = &type metadata for Int;
        *(void *)(v240 + 104) = &protocol witness table for Int;
        *(void *)(v240 + 72) = v241;
        uint64_t v242 = swift_allocObject();
        *(_OWORD *)(v242 + 16) = v260;
        *(void *)(v242 + 56) = &type metadata for Double;
        *(void *)(v242 + 64) = &protocol witness table for Double;
        *(void *)(v242 + 32) = v257;
        uint64_t v243 = String.init(format:_:)();
        uint64_t v245 = v244;
        *(void *)(v240 + 136) = v25;
        *(void *)(v240 + 144) = sub_100017184();
        *(void *)(v240 + 112) = v243;
        *(void *)(v240 + 120) = v245;
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();

        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v289 = v31;
        unint64_t v64 = sub_100040CE4(3);
        uint64_t v248 = v31[2];
        BOOL v249 = (v247 & 1) == 0;
        uint64_t v250 = v248 + v249;
        if (!__OFADD__(v248, v249))
        {
          LOBYTE(v14) = v247;
          if (v31[3] >= v250)
          {
            if (isUniquelyReferenced_nonNull_native) {
              goto LABEL_245;
            }
            goto LABEL_291;
          }
          sub_1000419B4(v250, isUniquelyReferenced_nonNull_native);
          unint64_t v251 = sub_100040CE4(3);
          if ((v14 & 1) == (v252 & 1))
          {
            unint64_t v64 = v251;
            goto LABEL_245;
          }
          goto LABEL_303;
        }
        goto LABEL_282;
      }
    }
    if ((v281 & 1) == 0 && v26 < v29)
    {
      sub_100030F18(v283);
      char v75 = swift_isUniquelyReferenced_nonNull_native();
      v289 = v31;
      unint64_t v64 = sub_100040CE4(4);
      uint64_t v77 = v31[2];
      BOOL v78 = (v76 & 1) == 0;
      uint64_t v79 = v77 + v78;
      if (__OFADD__(v77, v78))
      {
        __break(1u);
      }
      else
      {
        LOBYTE(v14) = v76;
        if (v31[3] >= v79)
        {
          if ((v75 & 1) == 0) {
            sub_100042B3C();
          }
        }
        else
        {
          sub_1000419B4(v79, v75);
          unint64_t v80 = sub_100040CE4(4);
          if ((v14 & 1) != (v81 & 1)) {
            goto LABEL_303;
          }
          unint64_t v64 = v80;
        }
        char v31 = v289;
        swift_bridgeObjectRelease();
        if (v14)
        {
          swift_bridgeObjectRetain();
        }
        else
        {
          v31[(v64 >> 6) + 8] |= 1 << v64;
          *(unsigned char *)(v31[6] + v64) = 4;
          *(void *)(v31[7] + 8 * v64) = 0;
          uint64_t v110 = v31[2];
          uint64_t v111 = v110 + 1;
          LOBYTE(v14) = __OFADD__(v110, 1);
          swift_bridgeObjectRetain();
          if (v14) {
            goto LABEL_259;
          }
          v31[2] = v111;
        }
        uint64_t v112 = v31[7];
        swift_bridgeObjectRelease();
        uint64_t v113 = *(void *)(v112 + 8 * v64);
        BOOL v72 = __OFADD__(v113, 1);
        uint64_t v114 = v113 + 1;
        if (!v72)
        {
          *(void *)(v112 + 8 * v64) = v114;

          BOOL v72 = __OFADD__(v287++, 1);
          if (!v72)
          {
            unint64_t v33 = &v297;
            goto LABEL_7;
          }
LABEL_254:
          __break(1u);
LABEL_255:
          __break(1u);
          goto LABEL_256;
        }
      }
      __break(1u);
      goto LABEL_254;
    }
    id v82 = [(id)v24 feedItem];
    if (!v82) {
      goto LABEL_294;
    }
    uint64_t v83 = v82;
    id v84 = [v82 expirationData];

    if (!v84) {
      goto LABEL_295;
    }
    unsigned int v85 = [v84 hasGlobalExpireUtcTime];

    if (v85)
    {
      id v86 = [(id)v24 feedItem];
      if (!v86) {
        goto LABEL_298;
      }
      uint64_t v87 = v86;
      id v88 = [v86 expirationData];

      if (!v88) {
        goto LABEL_299;
      }
      unint64_t v64 = (unint64_t)[v88 globalExpireUtcTime];

      uint64_t v89 = v272;
      Date.init()();
      Date.timeIntervalSince1970.getter();
      double v91 = v90;
      (*v268)(v89, v273);
      if ((~*(void *)&v91 & 0x7FF0000000000000) == 0) {
        goto LABEL_258;
      }
      if (v91 <= -9.22337204e18) {
        goto LABEL_260;
      }
      if (v91 >= 9.22337204e18) {
        goto LABEL_261;
      }
      if ((uint64_t)v64 < (uint64_t)v91)
      {
        sub_100030F18(v274);
        char v92 = swift_isUniquelyReferenced_nonNull_native();
        v289 = v31;
        unint64_t v64 = sub_100040CE4(1);
        uint64_t v94 = v31[2];
        BOOL v95 = (v93 & 1) == 0;
        uint64_t v96 = v94 + v95;
        if (__OFADD__(v94, v95)) {
          goto LABEL_265;
        }
        LOBYTE(v14) = v93;
        if (v31[3] >= v96)
        {
          if ((v92 & 1) == 0) {
            sub_100042B3C();
          }
        }
        else
        {
          sub_1000419B4(v96, v92);
          unint64_t v97 = sub_100040CE4(1);
          if ((v14 & 1) != (v98 & 1)) {
            goto LABEL_303;
          }
          unint64_t v64 = v97;
        }
        char v31 = v289;
        swift_bridgeObjectRelease();
        if (v14)
        {
          swift_bridgeObjectRetain();
        }
        else
        {
          v31[(v64 >> 6) + 8] |= 1 << v64;
          *(unsigned char *)(v31[6] + v64) = 1;
          *(void *)(v31[7] + 8 * v64) = 0;
          uint64_t v134 = v31[2];
          uint64_t v135 = v134 + 1;
          LOBYTE(v14) = __OFADD__(v134, 1);
          swift_bridgeObjectRetain();
          if (v14) {
            goto LABEL_273;
          }
          v31[2] = v135;
        }
        uint64_t v136 = v31[7];
        swift_bridgeObjectRelease();
        uint64_t v137 = *(void *)(v136 + 8 * v64);
        BOOL v72 = __OFADD__(v137, 1);
        uint64_t v138 = v137 + 1;
        if (v72) {
          goto LABEL_266;
        }
        *(void *)(v136 + 8 * v64) = v138;

        BOOL v72 = __OFADD__(v287++, 1);
        if (v72) {
          goto LABEL_267;
        }
        unint64_t v33 = &v295;
        goto LABEL_7;
      }
    }
    id v99 = [(id)v24 clusterID];
    if (!v99) {
      goto LABEL_296;
    }
    uint64_t v100 = v99;
    uint64_t v101 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v102;

    LOBYTE(v100) = sub_10002E5A8(v101, v14, v275);
    swift_bridgeObjectRelease();
    if (v100)
    {
      sub_100030F18(v276);
      char v103 = swift_isUniquelyReferenced_nonNull_native();
      v289 = v31;
      unint64_t v64 = sub_100040CE4(0);
      uint64_t v105 = v31[2];
      BOOL v106 = (v104 & 1) == 0;
      uint64_t v107 = v105 + v106;
      if (__OFADD__(v105, v106)) {
        goto LABEL_262;
      }
      LOBYTE(v14) = v104;
      if (v31[3] >= v107)
      {
        if ((v103 & 1) == 0) {
          sub_100042B3C();
        }
      }
      else
      {
        sub_1000419B4(v107, v103);
        unint64_t v108 = sub_100040CE4(0);
        if ((v14 & 1) != (v109 & 1)) {
          goto LABEL_303;
        }
        unint64_t v64 = v108;
      }
      char v31 = v289;
      swift_bridgeObjectRelease();
      if (v14)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v31[(v64 >> 6) + 8] |= 1 << v64;
        *(unsigned char *)(v31[6] + v64) = 0;
        *(void *)(v31[7] + 8 * v64) = 0;
        uint64_t v129 = v31[2];
        uint64_t v130 = v129 + 1;
        LOBYTE(v14) = __OFADD__(v129, 1);
        swift_bridgeObjectRetain();
        if (v14) {
          goto LABEL_269;
        }
        v31[2] = v130;
      }
      uint64_t v131 = v31[7];
      swift_bridgeObjectRelease();
      uint64_t v132 = *(void *)(v131 + 8 * v64);
      BOOL v72 = __OFADD__(v132, 1);
      uint64_t v133 = v132 + 1;
      if (v72) {
        goto LABEL_263;
      }
      *(void *)(v131 + 8 * v64) = v133;

      BOOL v72 = __OFADD__(v287++, 1);
      if (v72) {
        goto LABEL_264;
      }
      unint64_t v33 = &v296;
      goto LABEL_7;
    }
    int v115 = [(id)v24 source];
    if (sub_10002E6E0(v115, v270))
    {
      sub_100030F18(v271);
      char v116 = swift_isUniquelyReferenced_nonNull_native();
      v289 = v31;
      unint64_t v64 = sub_100040CE4(10);
      uint64_t v118 = v31[2];
      BOOL v119 = (v117 & 1) == 0;
      uint64_t v120 = v118 + v119;
      if (__OFADD__(v118, v119)) {
        goto LABEL_268;
      }
      LOBYTE(v14) = v117;
      if (v31[3] >= v120)
      {
        if ((v116 & 1) == 0) {
          sub_100042B3C();
        }
      }
      else
      {
        sub_1000419B4(v120, v116);
        unint64_t v121 = sub_100040CE4(10);
        if ((v14 & 1) != (v122 & 1)) {
          goto LABEL_303;
        }
        unint64_t v64 = v121;
      }
      char v31 = v289;
      swift_bridgeObjectRelease();
      if (v14)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v31[(v64 >> 6) + 8] |= 1 << v64;
        *(unsigned char *)(v31[6] + v64) = 10;
        *(void *)(v31[7] + 8 * v64) = 0;
        uint64_t v139 = v31[2];
        uint64_t v140 = v139 + 1;
        LOBYTE(v14) = __OFADD__(v139, 1);
        swift_bridgeObjectRetain();
        if (v14) {
          goto LABEL_274;
        }
        v31[2] = v140;
      }
      uint64_t v141 = v31[7];
      swift_bridgeObjectRelease();
      uint64_t v142 = *(void *)(v141 + 8 * v64);
      BOOL v72 = __OFADD__(v142, 1);
      uint64_t v143 = v142 + 1;
      if (v72) {
        goto LABEL_270;
      }
      *(void *)(v141 + 8 * v64) = v143;

      BOOL v72 = __OFADD__(v287++, 1);
      if (v72) {
        goto LABEL_271;
      }
      unint64_t v33 = &v294;
LABEL_7:
      *(v33 - 32) = (uint64_t)sub_10002D9E8;
      goto LABEL_8;
    }
    id v123 = [(id)v24 feedItem];
    if (!v123) {
      goto LABEL_300;
    }
    v124 = v123;
    id v125 = [v123 publisherID];

    if (!v125)
    {
      id v144 = FCNotificationsLog;
      static os_log_type_t.error.getter();
      sub_1000170E8((uint64_t *)&unk_10006AB60);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = v260;
      id v145 = [(id)v24 identifier];
      if (!v145) {
        goto LABEL_302;
      }
      v146 = v145;
      uint64_t v147 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v149 = v148;

      *(void *)(v14 + 56) = v25;
      *(void *)(v14 + 64) = sub_100017184();
      *(void *)(v14 + 32) = v147;
      *(void *)(v14 + 40) = v149;
      os_log(_:dso:log:type:_:)();

      swift_bridgeObjectRelease();
      sub_100030F18((uint64_t)v267);
      char v150 = swift_isUniquelyReferenced_nonNull_native();
      v289 = v31;
      unint64_t v64 = sub_100040CE4(5);
      uint64_t v152 = v31[2];
      BOOL v153 = (v151 & 1) == 0;
      uint64_t v154 = v152 + v153;
      if (__OFADD__(v152, v153)) {
        goto LABEL_275;
      }
      LOBYTE(v14) = v151;
      if (v31[3] >= v154)
      {
        char v32 = v278;
        if ((v150 & 1) == 0) {
          sub_100042B3C();
        }
      }
      else
      {
        sub_1000419B4(v154, v150);
        unint64_t v155 = sub_100040CE4(5);
        char v32 = v278;
        if ((v14 & 1) != (v156 & 1)) {
          goto LABEL_303;
        }
        unint64_t v64 = v155;
      }
      char v31 = v289;
      swift_bridgeObjectRelease();
      if (v14)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v31[(v64 >> 6) + 8] |= 1 << v64;
        *(unsigned char *)(v31[6] + v64) = 5;
        *(void *)(v31[7] + 8 * v64) = 0;
        uint64_t v172 = v31[2];
        uint64_t v173 = v172 + 1;
        LOBYTE(v14) = __OFADD__(v172, 1);
        swift_bridgeObjectRetain();
        if (v14) {
          goto LABEL_281;
        }
        v31[2] = v173;
      }
      uint64_t v174 = v31[7];
      swift_bridgeObjectRelease();
      uint64_t v175 = *(void *)(v174 + 8 * v64);
      BOOL v72 = __OFADD__(v175, 1);
      uint64_t v176 = v175 + 1;
      if (v72) {
        goto LABEL_276;
      }
      *(void *)(v174 + 8 * v64) = v176;

      v267 = sub_10002D9E8;
      BOOL v72 = __OFADD__(v287++, 1);
      if (v72) {
        goto LABEL_277;
      }
      goto LABEL_8;
    }
    uint64_t v126 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v128 = v127;

    if (v32)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = v27;
    }
    else
    {
      uint64_t v14 = v265;
      swift_bridgeObjectRetain();
    }
    char v157 = sub_10002E5A8(v126, v128, v14);
    swift_bridgeObjectRelease();
    if ((v157 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_100030F18((uint64_t)v266);
      char v165 = swift_isUniquelyReferenced_nonNull_native();
      v289 = v31;
      unint64_t v64 = sub_100040CE4(v261);
      uint64_t v167 = v31[2];
      BOOL v168 = (v166 & 1) == 0;
      uint64_t v169 = v167 + v168;
      if (__OFADD__(v167, v168)) {
        goto LABEL_278;
      }
      LOBYTE(v14) = v166;
      char v32 = v278;
      if (v31[3] >= v169)
      {
        if ((v165 & 1) == 0) {
          sub_100042B3C();
        }
      }
      else
      {
        sub_1000419B4(v169, v165);
        unint64_t v170 = sub_100040CE4(v261);
        if ((v14 & 1) != (v171 & 1)) {
          goto LABEL_303;
        }
        unint64_t v64 = v170;
      }
      char v31 = v289;
      swift_bridgeObjectRelease();
      if (v14)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v31[(v64 >> 6) + 8] |= 1 << v64;
        *(unsigned char *)(v31[6] + v64) = v261;
        *(void *)(v31[7] + 8 * v64) = 0;
        uint64_t v181 = v31[2];
        uint64_t v182 = v181 + 1;
        LOBYTE(v14) = __OFADD__(v181, 1);
        swift_bridgeObjectRetain();
        if (v14) {
          goto LABEL_285;
        }
        v31[2] = v182;
      }
      uint64_t v183 = v31[7];
      swift_bridgeObjectRelease();
      uint64_t v184 = *(void *)(v183 + 8 * v64);
      BOOL v72 = __OFADD__(v184, 1);
      uint64_t v185 = v184 + 1;
      if (v72) {
        goto LABEL_279;
      }
      *(void *)(v183 + 8 * v64) = v185;

      v266 = sub_10002D9E8;
      BOOL v72 = __OFADD__(v287++, 1);
      if (v72) {
        goto LABEL_280;
      }
      goto LABEL_8;
    }
    if (sub_10002E5A8(v126, v128, v264))
    {
      swift_bridgeObjectRelease();
      sub_100030F18((uint64_t)v263);
      char v158 = swift_isUniquelyReferenced_nonNull_native();
      v289 = v31;
      unint64_t v64 = sub_100040CE4(6);
      uint64_t v160 = v31[2];
      BOOL v161 = (v159 & 1) == 0;
      uint64_t v162 = v160 + v161;
      char v32 = v278;
      if (__OFADD__(v160, v161)) {
        goto LABEL_284;
      }
      LOBYTE(v14) = v159;
      if (v31[3] >= v162)
      {
        if ((v158 & 1) == 0) {
          sub_100042B3C();
        }
      }
      else
      {
        sub_1000419B4(v162, v158);
        unint64_t v163 = sub_100040CE4(6);
        if ((v14 & 1) != (v164 & 1)) {
          goto LABEL_303;
        }
        unint64_t v64 = v163;
      }
      char v31 = v289;
      swift_bridgeObjectRelease();
      if (v14)
      {
        swift_bridgeObjectRetain();
LABEL_189:
        uint64_t v195 = v31[7];
        swift_bridgeObjectRelease();
        uint64_t v196 = *(void *)(v195 + 8 * v64);
        BOOL v72 = __OFADD__(v196, 1);
        uint64_t v197 = v196 + 1;
        if (v72) {
          goto LABEL_286;
        }
        *(void *)(v195 + 8 * v64) = v197;

        v263 = sub_10002D9E8;
        BOOL v72 = __OFADD__(v287++, 1);
        if (v72) {
          goto LABEL_287;
        }
        goto LABEL_8;
      }
      v31[(v64 >> 6) + 8] |= 1 << v64;
      *(unsigned char *)(v31[6] + v64) = 6;
      *(void *)(v31[7] + 8 * v64) = 0;
      uint64_t v193 = v31[2];
      uint64_t v194 = v193 + 1;
      LOBYTE(v14) = __OFADD__(v193, 1);
      swift_bridgeObjectRetain();
      if ((v14 & 1) == 0)
      {
        v31[2] = v194;
        goto LABEL_189;
      }
      __break(1u);
LABEL_293:
      __break(1u);
LABEL_294:
      __break(1u);
LABEL_295:
      __break(1u);
LABEL_296:
      __break(1u);
LABEL_297:
      __break(1u);
LABEL_298:
      __break(1u);
LABEL_299:
      __break(1u);
LABEL_300:
      __break(1u);
      goto LABEL_301;
    }
    uint64_t v177 = v259;
    char v32 = v278;
    if (*(void *)(v259 + 16))
    {
      unint64_t v178 = sub_100040C28(v126, v128);
      if (v179)
      {
        uint64_t v180 = *(void *)(*(void *)(v177 + 56) + 8 * v178);
        swift_bridgeObjectRelease();
        if (v180 < v258) {
          goto LABEL_251;
        }
        goto LABEL_176;
      }
    }
    swift_bridgeObjectRelease();
    if (v258 > 0)
    {
LABEL_251:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_209;
    }
LABEL_176:
    sub_100030F18((uint64_t)v262);
    char v186 = swift_isUniquelyReferenced_nonNull_native();
    v289 = v31;
    unint64_t v64 = sub_100040CE4(2);
    uint64_t v188 = v31[2];
    BOOL v189 = (v187 & 1) == 0;
    uint64_t v190 = v188 + v189;
    if (__OFADD__(v188, v189)) {
      goto LABEL_288;
    }
    LOBYTE(v14) = v187;
    if (v31[3] >= v190)
    {
      if ((v186 & 1) == 0) {
        sub_100042B3C();
      }
    }
    else
    {
      sub_1000419B4(v190, v186);
      unint64_t v191 = sub_100040CE4(2);
      if ((v14 & 1) != (v192 & 1)) {
        goto LABEL_303;
      }
      unint64_t v64 = v191;
    }
    char v31 = v289;
    swift_bridgeObjectRelease();
    if (v14)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v31[(v64 >> 6) + 8] |= 1 << v64;
      *(unsigned char *)(v31[6] + v64) = 2;
      *(void *)(v31[7] + 8 * v64) = 0;
      uint64_t v198 = v31[2];
      uint64_t v199 = v198 + 1;
      LOBYTE(v14) = __OFADD__(v198, 1);
      swift_bridgeObjectRetain();
      if (v14) {
        goto LABEL_293;
      }
      v31[2] = v199;
    }
    uint64_t v200 = v31[7];
    swift_bridgeObjectRelease();
    uint64_t v201 = *(void *)(v200 + 8 * v64);
    BOOL v72 = __OFADD__(v201, 1);
    uint64_t v202 = v201 + 1;
    if (v72) {
      goto LABEL_289;
    }
    *(void *)(v200 + 8 * v64) = v202;

    v262 = sub_10002D9E8;
    BOOL v72 = __OFADD__(v287++, 1);
    if (v72) {
      goto LABEL_290;
    }
LABEL_8:
    LOBYTE(v14) = AssociatedConformanceWitness;
    sub_100019994((uint64_t)&v291, AssociatedTypeWitness);
    dispatch thunk of IteratorProtocol.next()();
    uint64_t v24 = (uint64_t)v289;
    double v26 = v290;
    if (!v289) {
      goto LABEL_208;
    }
  }
  uint64_t v36 = v289[2];
  if (!v36)
  {
LABEL_43:
    swift_bridgeObjectRelease();
    char v32 = v278;
    goto LABEL_44;
  }
  v280 = v31;
  v284 = v289 + 4;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v37 = 0;
  id v285 = (id)v24;
  while (2)
  {
    if (!*(void *)(v27 + 16)) {
      goto LABEL_14;
    }
    uint64_t v38 = v25;
    uint64_t v39 = &v284[2 * v37];
    uint64_t v41 = *v39;
    uint64_t v40 = v39[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v42 = Hasher._finalize()();
    uint64_t v43 = -1 << *(unsigned char *)(v27 + 32);
    unint64_t v44 = v42 & ~v43;
    if (((*(void *)(v288 + ((v44 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v44) & 1) == 0)
    {
LABEL_13:
      swift_bridgeObjectRelease();
      uint64_t v25 = v38;
      uint64_t v24 = (uint64_t)v285;
      uint64_t v27 = v286;
LABEL_14:
      if (++v37 == v36)
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        LOBYTE(v14) = v27;
        char v31 = v280;
        goto LABEL_43;
      }
      continue;
    }
    break;
  }
  uint64_t v45 = *(void *)(v286 + 48);
  uint64_t v46 = (void *)(v45 + 16 * v44);
  BOOL v47 = *v46 == v41 && v46[1] == v40;
  if (!v47 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v24 = ~v43;
    for (unint64_t i = v44 + 1; ; unint64_t i = v49 + 1)
    {
      unint64_t v49 = i & v24;
      if (((*(void *)(v288 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
        break;
      }
      uint64_t v50 = (void *)(v45 + 16 * v49);
      BOOL v51 = *v50 == v41 && v50[1] == v40;
      if (v51 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_30;
      }
    }
    goto LABEL_13;
  }
LABEL_30:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  double v52 = (void *)FCNotificationsLog;
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = v269;
  uint64_t v25 = v38;
  *(void *)(v53 + 56) = v38;
  uint64_t v14 = sub_100017184();
  *(void *)(v53 + 64) = v14;
  *(void *)(v53 + 32) = v41;
  *(void *)(v53 + 40) = v40;
  id v54 = v52;
  id v55 = v285;
  id v56 = [v285 identifier];
  if (!v56) {
    goto LABEL_297;
  }
  Swift::Int v57 = v56;
  uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v60 = v59;

  *(void *)(v53 + 96) = v25;
  *(void *)(v53 + 104) = v14;
  *(void *)(v53 + 72) = v58;
  *(void *)(v53 + 80) = v60;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
  sub_100030F18((uint64_t)v279);
  uint64_t v61 = v280;
  char v62 = swift_isUniquelyReferenced_nonNull_native();
  v289 = v61;
  unint64_t v64 = sub_100040CE4(9);
  uint64_t v65 = v61[2];
  BOOL v66 = (v63 & 1) == 0;
  uint64_t v67 = v65 + v66;
  if (__OFADD__(v65, v66)) {
    goto LABEL_255;
  }
  LOBYTE(v14) = v63;
  if (v61[3] >= v67)
  {
    char v32 = v278;
    if ((v62 & 1) == 0) {
      sub_100042B3C();
    }
  }
  else
  {
    sub_1000419B4(v67, v62);
    unint64_t v68 = sub_100040CE4(9);
    char v32 = v278;
    if ((v14 & 1) != (v69 & 1)) {
      goto LABEL_303;
    }
    unint64_t v64 = v68;
  }
  char v31 = v289;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if ((v14 & 1) == 0) {
    sub_100042760(v64, 9, 0, v31);
  }
  uint64_t v70 = v31[7];
  swift_bridgeObjectRelease();
  uint64_t v71 = *(void *)(v70 + 8 * v64);
  BOOL v72 = __OFADD__(v71, 1);
  uint64_t v73 = v71 + 1;
  if (v72)
  {
LABEL_256:
    __break(1u);
    goto LABEL_257;
  }
  *(void *)(v70 + 8 * v64) = v73;

  BOOL v72 = __OFADD__(v287++, 1);
  if (!v72)
  {
    v279 = sub_10002D9E8;
    uint64_t v27 = v286;
    goto LABEL_8;
  }
LABEL_257:
  __break(1u);
LABEL_258:
  __break(1u);
LABEL_259:
  __break(1u);
LABEL_260:
  __break(1u);
LABEL_261:
  __break(1u);
LABEL_262:
  __break(1u);
LABEL_263:
  __break(1u);
LABEL_264:
  __break(1u);
LABEL_265:
  __break(1u);
LABEL_266:
  __break(1u);
LABEL_267:
  __break(1u);
LABEL_268:
  __break(1u);
LABEL_269:
  __break(1u);
LABEL_270:
  __break(1u);
LABEL_271:
  __break(1u);
LABEL_272:
  __break(1u);
LABEL_273:
  __break(1u);
LABEL_274:
  __break(1u);
LABEL_275:
  __break(1u);
LABEL_276:
  __break(1u);
LABEL_277:
  __break(1u);
LABEL_278:
  __break(1u);
LABEL_279:
  __break(1u);
LABEL_280:
  __break(1u);
LABEL_281:
  __break(1u);
LABEL_282:
  __break(1u);
  do
  {
    __break(1u);
LABEL_284:
    __break(1u);
LABEL_285:
    __break(1u);
LABEL_286:
    __break(1u);
LABEL_287:
    __break(1u);
LABEL_288:
    __break(1u);
LABEL_289:
    __break(1u);
LABEL_290:
    __break(1u);
LABEL_291:
    sub_100042B3C();
LABEL_245:
    char v31 = v289;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((v14 & 1) == 0) {
      sub_100042760(v64, 3, 0, v31);
    }
    uint64_t v253 = v31[7];
    swift_bridgeObjectRelease();
    uint64_t v254 = *(void *)(v253 + 8 * v64);
    BOOL v72 = __OFADD__(v254, 1);
    uint64_t v255 = v254 + 1;
  }
  while (v72);
  *(void *)(v253 + 8 * v64) = v255;

  uint64_t v24 = 0;
  unint64_t v64 = (unint64_t)sub_10002D9E8;
LABEL_210:
  sub_1000185C0((uint64_t)&v291);
  v206 = (void *)FCNotificationsLog;
  sub_1000170E8((uint64_t *)&unk_10006AB60);
  uint64_t v207 = swift_allocObject();
  uint64_t v14 = v207;
  int64_t v208 = 0;
  uint64_t v209 = 0;
  *(_OWORD *)(v207 + 16) = xmmword_10004E960;
  *(void *)(v207 + 56) = &type metadata for Int;
  *(void *)(v207 + 64) = &protocol witness table for Int;
  v210 = (char *)(v31 + 8);
  uint64_t v211 = 1 << *((unsigned char *)v31 + 32);
  uint64_t v212 = -1;
  if (v211 < 64) {
    uint64_t v212 = ~(-1 << v211);
  }
  unint64_t v213 = v212 & v31[8];
  int64_t v214 = (unint64_t)(v211 + 63) >> 6;
  while (2)
  {
    if (v213)
    {
      unint64_t v215 = __clz(__rbit64(v213));
      v213 &= v213 - 1;
      unint64_t v216 = v215 | (v208 << 6);
      goto LABEL_214;
    }
    int64_t v218 = v208 + 1;
    if (__OFADD__(v208, 1)) {
      goto LABEL_250;
    }
    if (v218 >= v214) {
      break;
    }
    unint64_t v219 = *(void *)&v210[8 * v218];
    ++v208;
    if (v219) {
      goto LABEL_233;
    }
    int64_t v208 = v218 + 1;
    if (v218 + 1 >= v214) {
      break;
    }
    unint64_t v219 = *(void *)&v210[8 * v208];
    if (v219) {
      goto LABEL_233;
    }
    int64_t v208 = v218 + 2;
    if (v218 + 2 >= v214) {
      break;
    }
    unint64_t v219 = *(void *)&v210[8 * v208];
    if (v219) {
      goto LABEL_233;
    }
    int64_t v208 = v218 + 3;
    if (v218 + 3 >= v214) {
      break;
    }
    unint64_t v219 = *(void *)&v210[8 * v208];
    if (v219) {
      goto LABEL_233;
    }
    int64_t v208 = v218 + 4;
    if (v218 + 4 >= v214) {
      break;
    }
    unint64_t v219 = *(void *)&v210[8 * v208];
    if (v219) {
      goto LABEL_233;
    }
    int64_t v220 = v218 + 5;
    if (v220 < v214)
    {
      unint64_t v219 = *(void *)&v210[8 * v220];
      if (!v219)
      {
        while (1)
        {
          int64_t v208 = v220 + 1;
          if (__OFADD__(v220, 1)) {
            goto LABEL_272;
          }
          if (v208 >= v214) {
            goto LABEL_234;
          }
          unint64_t v219 = *(void *)&v210[8 * v208];
          ++v220;
          if (v219) {
            goto LABEL_233;
          }
        }
      }
      int64_t v208 = v220;
LABEL_233:
      unint64_t v213 = (v219 - 1) & v219;
      unint64_t v216 = __clz(__rbit64(v219)) + (v208 << 6);
LABEL_214:
      uint64_t v217 = *(void *)(v31[7] + 8 * v216);
      BOOL v72 = __OFADD__(v209, v217);
      v209 += v217;
      if (v72)
      {
        __break(1u);
LABEL_250:
        __break(1u);
        goto LABEL_251;
      }
      continue;
    }
    break;
  }
LABEL_234:
  *(void *)(v207 + 32) = v209;
  sub_100033648();
  id v221 = v206;
  swift_bridgeObjectRetain();
  uint64_t v222 = Dictionary.description.getter();
  v223 = v31;
  uint64_t v225 = v224;
  v280 = v223;
  swift_bridgeObjectRelease();
  *(void *)(v14 + 96) = v25;
  unint64_t v226 = sub_100017184();
  *(void *)(v14 + 104) = v226;
  *(void *)(v14 + 72) = v222;
  *(void *)(v14 + 80) = v225;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
  if (!v24)
  {
    sub_10003369C(0, (unint64_t *)&unk_10006B470);
    v237 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    id v236 = 0;
LABEL_238:
    swift_bridgeObjectRelease();

    sub_100030F18((uint64_t)v279);
    sub_100030F18(v64);
    sub_100030F18(v283);
    sub_100030F18(v274);
    sub_100030F18((uint64_t)v262);
    sub_100030F18((uint64_t)v263);
    sub_100030F18((uint64_t)v266);
    sub_100030F18((uint64_t)v267);
    uint64_t v205 = v276;
    uint64_t v204 = v271;
    goto LABEL_239;
  }
  v227 = (void *)FCNotificationsLog;
  uint64_t v228 = swift_allocObject();
  *(_OWORD *)(v228 + 16) = xmmword_10004E5F0;
  id v229 = v227;
  id v230 = (id)v24;
  id v231 = [v230 identifier];
  if (v231)
  {
    v232 = v231;
    uint64_t v233 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v235 = v234;

    *(void *)(v228 + 56) = v25;
    *(void *)(v228 + 64) = v226;
    *(void *)(v228 + 32) = v233;
    *(void *)(v228 + 40) = v235;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    swift_bridgeObjectRelease();
    id v236 = v230;
    goto LABEL_238;
  }
LABEL_301:
  __break(1u);
LABEL_302:
  __break(1u);
LABEL_303:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

unint64_t sub_100033648()
{
  unint64_t result = qword_10006B468;
  if (!qword_10006B468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B468);
  }
  return result;
}

uint64_t sub_10003369C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000336D8(uint64_t a1)
{
  uint64_t v2 = sub_1000170E8(&qword_10006B2C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100033738()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100033748(void *a1)
{
  sub_10002E1D8(a1, *(uint64_t **)(v1 + 16), *(unint64_t ***)(v1 + 24));
}

uint64_t sub_100033750()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100033760()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100033788(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10002EDBC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_100033820()
{
  return swift_release();
}

uint64_t getEnumTagSinglePayload for DelayedNotificationVendor.FilterReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DelayedNotificationVendor.FilterReason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *uint64_t result = a2 + 10;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100033984);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationVendor.FilterReason()
{
  return &type metadata for DelayedNotificationVendor.FilterReason;
}

uint64_t destroy for DelayedNotificationVendor.Configuration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DelayedNotificationVendor.Configuration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DelayedNotificationVendor.Configuration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for DelayedNotificationVendor.Configuration(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DelayedNotificationVendor.Configuration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationVendor.Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DelayedNotificationVendor.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationVendor.Configuration()
{
  return &type metadata for DelayedNotificationVendor.Configuration;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationVendor.Errors(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for DelayedNotificationVendor.Errors(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100033C94);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100033CBC()
{
  return 0;
}

ValueMetadata *type metadata accessor for DelayedNotificationVendor.Errors()
{
  return &type metadata for DelayedNotificationVendor.Errors;
}

unint64_t sub_100033CD8()
{
  unint64_t result = qword_10006B4F0;
  if (!qword_10006B4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B4F0);
  }
  return result;
}

unint64_t sub_100033D30()
{
  unint64_t result = qword_10006B4F8;
  if (!qword_10006B4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B4F8);
  }
  return result;
}

unint64_t sub_100033D84()
{
  unint64_t result = qword_10006B508;
  if (!qword_10006B508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B508);
  }
  return result;
}

uint64_t sub_100033DD8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100033E20()
{
  unint64_t result = qword_10006B520;
  if (!qword_10006B520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B520);
  }
  return result;
}

unint64_t sub_100033E74(Swift::String string)
{
  id object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._id object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100062268, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 0xB) {
    return 11;
  }
  else {
    return v3;
  }
}

uint64_t sub_100033EC0(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100033DD8(&qword_10006B510);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100033F30()
{
  unint64_t result = qword_10006B538;
  if (!qword_10006B538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B538);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationVendor.Configuration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DelayedNotificationVendor.Configuration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000340E0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationVendor.Configuration.CodingKeys()
{
  return &type metadata for DelayedNotificationVendor.Configuration.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for DelayedNotificationVendor.Configuration.SourceLimit(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DelayedNotificationVendor.Configuration.SourceLimit()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DelayedNotificationVendor.Configuration.SourceLimit(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DelayedNotificationVendor.Configuration.SourceLimit(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 initializeWithTake for DelayedNotificationVendor.Configuration.SourceLimit(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for DelayedNotificationVendor.Configuration.SourceLimit(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationVendor.Configuration.SourceLimit(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DelayedNotificationVendor.Configuration.SourceLimit(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationVendor.Configuration.SourceLimit()
{
  return &type metadata for DelayedNotificationVendor.Configuration.SourceLimit;
}

unint64_t sub_1000342DC()
{
  unint64_t result = qword_10006B540;
  if (!qword_10006B540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B540);
  }
  return result;
}

unint64_t sub_100034334()
{
  unint64_t result = qword_10006B548;
  if (!qword_10006B548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B548);
  }
  return result;
}

unint64_t sub_10003438C()
{
  unint64_t result = qword_10006B550;
  if (!qword_10006B550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B550);
  }
  return result;
}

unint64_t sub_1000343E0()
{
  unint64_t result = qword_10006B560;
  if (!qword_10006B560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B560);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DelayedNotificationVendor.Configuration.SourceLimit.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100034500);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationVendor.Configuration.SourceLimit.CodingKeys()
{
  return &type metadata for DelayedNotificationVendor.Configuration.SourceLimit.CodingKeys;
}

unint64_t sub_10003453C()
{
  unint64_t result = qword_10006B570;
  if (!qword_10006B570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B570);
  }
  return result;
}

unint64_t sub_100034594()
{
  unint64_t result = qword_10006B578;
  if (!qword_10006B578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B578);
  }
  return result;
}

unint64_t sub_1000345EC()
{
  unint64_t result = qword_10006B580;
  if (!qword_10006B580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B580);
  }
  return result;
}

double sub_10003465C()
{
  id v0 = (id)NewsCoreUserDefaults();
  uint64_t v1 = FCDelayedNotificationRandomNormalizedValueKey;
  id v2 = [v0 valueForKey:FCDelayedNotificationRandomNormalizedValueKey];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_1000336D8((uint64_t)v9);
    id v3 = (id)NewsCoreUserDefaults();
    [v3 doubleForKey:v1];
    double v5 = v4;
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v6 = sub_1000336D8((uint64_t)v9);
    sub_100017330(v6, 0.0, 1.0);
    double v5 = v7;
    id v3 = (id)NewsCoreUserDefaults();
    [v3 setDouble:v1 forKey:v5];
  }

  return v5;
}

void *sub_100034760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result = (void *)sub_100016B1C();
  if (v6) {
    return 0;
  }
  double v7 = result;
  int v8 = (char *)result + 7;
  if (__OFADD__(result, 7))
  {
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if ((uint64_t)v8 < (uint64_t)result) {
    goto LABEL_38;
  }
  uint64_t v9 = v5;
  uint64_t v10 = 0;
  char v11 = 1;
  uint64_t v12 = &_swiftEmptyArrayStorage;
  uint64_t v13 = (uint64_t)result;
  while (!*(void *)(a3 + 16))
  {
    unint64_t result = v12;
    uint64_t v16 = v12[2];
    if (v16) {
      goto LABEL_14;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    if ((char *)v13 == v8) {
      return (void *)v10;
    }
    if (__OFADD__(v13++, 1))
    {
      __break(1u);
      return 0;
    }
  }
  if (v13 <= 7) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v13 - 7;
  }
  sub_100040BE4(v14);
  unint64_t result = v12;
  if (v15) {
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  uint64_t v16 = result[2];
  if (!v16) {
    goto LABEL_27;
  }
LABEL_14:
  uint64_t v17 = v12;
  uint64_t v18 = result[4];
  uint64_t v19 = result[5];
  if (v18 < v9 && v13 <= (uint64_t)v7)
  {
    if (v11)
    {
      uint64_t v21 = 86400 * (v13 - (void)v7);
      uint64_t v10 = v18 + v21;
      if (__OFADD__(v18, v21)) {
        goto LABEL_39;
      }
      if (__OFADD__(v19, v21)) {
        goto LABEL_44;
      }
    }
    uint64_t v22 = result + 6;
    uint64_t v12 = v17;
    while (--v16)
    {
      uint64_t v23 = v22 + 2;
      uint64_t v18 = *v22;
      v22 += 2;
      if (v18 >= v9)
      {
        uint64_t v19 = *(v23 - 1);
        goto LABEL_32;
      }
    }
    char v11 = 0;
    goto LABEL_27;
  }
LABEL_32:
  unint64_t result = (void *)swift_bridgeObjectRelease();
  uint64_t v25 = v13 - (void)v7;
  if (__OFSUB__(v13, v7)) {
    goto LABEL_40;
  }
  uint64_t v26 = 86400 * v25;
  if ((unsigned __int128)(v25 * (__int128)86400) >> 64 != (86400 * v25) >> 63)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v10 = v18 + v26;
  if (__OFADD__(v18, v26))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (!__OFADD__(v19, v26)) {
    return (void *)v10;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_100034918()
{
  uint64_t result = 0x7961646E7573;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x7961646E6F6DLL;
      break;
    case 2:
      uint64_t result = 0x79616473657574;
      break;
    case 3:
      uint64_t result = 0x616473656E646577;
      break;
    case 4:
      uint64_t result = 0x7961647372756874;
      break;
    case 5:
      uint64_t result = 0x796164697266;
      break;
    case 6:
      uint64_t result = 0x7961647275746173;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000349F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000373AC(a1, a2);
  *a3 = result;
  return result;
}

void sub_100034A18(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_100034A24(uint64_t a1)
{
  unint64_t v2 = sub_1000393C0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100034A60(uint64_t a1)
{
  unint64_t v2 = sub_1000393C0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100034A9C(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v18 = 30067;
  unint64_t v19 = 0xE200000000000000;
  v20[0] = a1 & 1;
  uint64_t v21 = 109;
  unint64_t v22 = 0xE100000000000000;
  char v23 = BYTE1(a1) & 1;
  uint64_t v24 = 30068;
  unint64_t v25 = 0xE200000000000000;
  char v26 = BYTE2(a1) & 1;
  uint64_t v27 = 119;
  unint64_t v28 = 0xE100000000000000;
  char v29 = BYTE3(a1) & 1;
  uint64_t v30 = 26740;
  unint64_t v31 = 0xE200000000000000;
  char v32 = BYTE4(a1) & 1;
  uint64_t v33 = 102;
  unint64_t v34 = 0xE100000000000000;
  char v35 = BYTE5(a1) & 1;
  uint64_t v36 = 24947;
  unint64_t v37 = 0xE200000000000000;
  char v38 = BYTE6(a1) & 1;
  do
  {
    uint64_t v5 = &v17[v1];
    if (v20[v1] == 1)
    {
      uint64_t v7 = *((void *)v5 + 4);
      uint64_t v6 = *((void *)v5 + 5);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_10004314C(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v3 = _swiftEmptyArrayStorage[2];
      unint64_t v2 = _swiftEmptyArrayStorage[3];
      if (v3 >= v2 >> 1) {
        sub_10004314C(v2 > 1, v3 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v3 + 1;
      double v4 = (char *)&_swiftEmptyArrayStorage[3 * v3];
      *((void *)v4 + 4) = v7;
      *((void *)v4 + 5) = v6;
      v4[48] = 1;
    }
    v1 += 24;
  }
  while (v1 != 168);
  sub_1000170E8(&qword_10006B858);
  swift_arrayDestroy();
  int64_t v8 = _swiftEmptyArrayStorage[2];
  if (v8)
  {
    sub_10004312C(0, v8, 0);
    uint64_t v9 = &_swiftEmptyArrayStorage[5];
    do
    {
      uint64_t v11 = *(v9 - 1);
      uint64_t v10 = *v9;
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v13 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v12 >= v13 >> 1) {
        sub_10004312C(v13 > 1, v12 + 1, 1);
      }
      v9 += 3;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage[2 * v12];
      *((void *)v14 + 4) = v11;
      *((void *)v14 + 5) = v10;
      --v8;
    }
    while (v8);
  }
  swift_release();
  uint64_t v15 = Array.description.getter();
  swift_bridgeObjectRelease();
  return v15;
}

int8x8_t sub_100034D00@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = sub_10003767C(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(v4);
    int16x8_t v7 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v6, (uint64x2_t)xmmword_10004EE40), (int32x4_t)vshlq_u64(v6, (uint64x2_t)xmmword_10004EE30));
    *(int8x8_t *)v7.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v7), (int8x8_t)0x1000100010001);
    int8x8_t result = vmovn_s16(v7);
    *(_DWORD *)(a2 + 1) = result.i32[0];
    *(unsigned char *)(a2 + 5) = BYTE5(v4) & 1;
    *(unsigned char *)(a2 + 6) = BYTE6(v4) & 1;
  }
  return result;
}

uint64_t sub_100034D74()
{
  uint64_t v1 = 0x1000000000000;
  if (!v0[6]) {
    uint64_t v1 = 0;
  }
  uint64_t v2 = 0x10000000000;
  if (!v0[5]) {
    uint64_t v2 = 0;
  }
  unint64_t v3 = &_mh_execute_header;
  if (!v0[4]) {
    unint64_t v3 = 0;
  }
  uint64_t v4 = 0x1000000;
  if (!v0[3]) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = 0x10000;
  if (!v0[2]) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 256;
  if (!v0[1]) {
    uint64_t v6 = 0;
  }
  return sub_100034A9C(v6 | *v0 | v5 | v4 | (unint64_t)v3 | v2 | v1);
}

BOOL sub_100034DF4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v3 = *a1;
  int v4 = a1[1];
  int v5 = a1[2];
  int v6 = a1[3];
  int v7 = a1[4];
  int v8 = a1[5];
  uint64_t v9 = *a2;
  int v10 = a2[1];
  int v11 = a2[2];
  int v12 = a2[3];
  int v13 = a2[4];
  int v14 = a2[5];
  int v15 = a2[6];
  if (a1[6]) {
    uint64_t v16 = 0x1000000000000;
  }
  else {
    uint64_t v16 = 0;
  }
  BOOL v17 = v8 == 0;
  uint64_t v18 = 0x10000000000;
  if (v17) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = 0x10000000000;
  }
  BOOL v17 = v7 == 0;
  uint64_t v20 = &_mh_execute_header;
  if (v17) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = &_mh_execute_header;
  }
  BOOL v17 = v6 == 0;
  uint64_t v22 = 0x1000000;
  if (v17) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = 0x1000000;
  }
  BOOL v17 = v5 == 0;
  uint64_t v24 = 0x10000;
  if (v17) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = 0x10000;
  }
  BOOL v17 = v4 == 0;
  uint64_t v26 = 256;
  if (v17) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = 256;
  }
  unint64_t v28 = v27 | v3 | v25 | v23 | (unint64_t)v21 | v19 | v16;
  if (v15) {
    uint64_t v29 = 0x1000000000000;
  }
  else {
    uint64_t v29 = 0;
  }
  if (!v14) {
    uint64_t v18 = 0;
  }
  if (!v13) {
    uint64_t v20 = 0;
  }
  if (!v12) {
    uint64_t v22 = 0;
  }
  if (!v11) {
    uint64_t v24 = 0;
  }
  if (!v10) {
    uint64_t v26 = 0;
  }
  return sub_10003733C(v28, v26 | v9 | v24 | v22 | (unint64_t)v20 | v18 | v29);
}

uint64_t sub_100034EEC()
{
  uint64_t v1 = 0x7472617473;
  if (*v0 != 1) {
    uint64_t v1 = 6581861;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6557664F73796164;
  }
}

uint64_t sub_100034F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100037C7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100034F68(uint64_t a1)
{
  unint64_t v2 = sub_100038FE8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100034FA4(uint64_t a1)
{
  unint64_t v2 = sub_100038FE8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100034FE0(uint64_t a1)
{
  _StringGuts.grow(_:)(16);
  uint64_t v2 = sub_100034A9C(a1 & 0x1010101010101);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 2629690;
  v3._id object = (void *)0xE300000000000000;
  String.append(_:)(v3);
  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x28203E2D2029;
  v5._id object = (void *)0xE600000000000000;
  String.append(_:)(v5);
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 41;
  v7._id object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  return v2;
}

int8x8_t sub_1000350FC@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = sub_100037DC8(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    uint64x2_t v8 = (uint64x2_t)vdupq_n_s64(v4);
    int16x8_t v9 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_10004EE40), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_10004EE30));
    *(int8x8_t *)v9.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v9), (int8x8_t)0x1000100010001);
    int8x8_t result = vmovn_s16(v9);
    *(_DWORD *)(a2 + 1) = result.i32[0];
    *(unsigned char *)(a2 + 5) = BYTE5(v4) & 1;
    *(unsigned char *)(a2 + 6) = BYTE6(v4) & 1;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_100035174()
{
  uint64_t v1 = 256;
  if (!v0[1]) {
    uint64_t v1 = 0;
  }
  uint64_t v2 = v1 | *v0;
  uint64_t v3 = 0x10000;
  if (!v0[2]) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = 0x1000000;
  if (!v0[3]) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v2 | v3 | v4;
  uint64_t v6 = &_mh_execute_header;
  if (!v0[4]) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 0x10000000000;
  if (!v0[5]) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = 0x1000000000000;
  if (!v0[6]) {
    uint64_t v8 = 0;
  }
  return sub_100034FE0(v5 | (unint64_t)v6 | v7 | v8);
}

uint64_t sub_1000351F8(void *a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v111 = *a2;
  if (v5)
  {
    unint64_t v7 = 7 * (v4 / 7);
    unint64_t v8 = v7 + v4 % 7;
    BOOL v9 = __OFADD__(v7, v4 % 7);
    BOOL v112 = v9;
    swift_bridgeObjectRetain();
    int v10 = (_OWORD *)(a3 + 40);
    char v104 = _swiftEmptyArrayStorage;
    unint64_t v98 = v8;
    unint64_t v11 = v8 - 1;
    unint64_t v99 = v11;
    do
    {
      if ((uint64_t)v4 >= 1)
      {
        if (v112)
        {
          __break(1u);
LABEL_97:
          __break(1u);
LABEL_98:
          __break(1u);
LABEL_99:
          __break(1u);
LABEL_100:
          __break(1u);
LABEL_101:
          __break(1u);
LABEL_102:
          __break(1u);
LABEL_103:
          __break(1u);
LABEL_104:
          KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
          __break(1u);
          JUMPOUT(0x100035AC4);
        }
        char v14 = *((unsigned char *)v10 - 8);
        char v15 = *((unsigned char *)v10 - 7);
        char v16 = *((unsigned char *)v10 - 5);
        switch(v11)
        {
          case 0uLL:
            if (*((unsigned char *)v10 - 8)) {
              goto LABEL_24;
            }
            break;
          case 1uLL:
            if (*((unsigned char *)v10 - 7)) {
              goto LABEL_24;
            }
            break;
          case 2uLL:
            if (*((unsigned char *)v10 - 6)) {
              goto LABEL_24;
            }
            break;
          case 3uLL:
            if (*((unsigned char *)v10 - 5)) {
              goto LABEL_24;
            }
            break;
          case 4uLL:
            if (*((unsigned char *)v10 - 4)) {
              goto LABEL_24;
            }
            break;
          case 5uLL:
            if (*((unsigned char *)v10 - 3)) {
              goto LABEL_24;
            }
            break;
          case 6uLL:
            if (*((unsigned char *)v10 - 2))
            {
LABEL_24:
              char v100 = *((unsigned char *)v10 - 2);
              char v102 = *((unsigned char *)v10 - 3);
              char v105 = *((unsigned char *)v10 - 4);
              char v107 = *((unsigned char *)v10 - 6);
              long long v109 = *v10;
              BOOL v17 = v104;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_10004316C(0, v104[2] + 1, 1);
                BOOL v17 = v104;
              }
              long long v18 = v109;
              unint64_t v20 = v17[2];
              unint64_t v19 = v17[3];
              if (v20 >= v19 >> 1)
              {
                sub_10004316C(v19 > 1, v20 + 1, 1);
                long long v18 = v109;
                BOOL v17 = v104;
              }
              v17[2] = v20 + 1;
              char v104 = v17;
              uint64_t v21 = &v17[3 * v20];
              *((unsigned char *)v21 + 32) = v14;
              *((unsigned char *)v21 + 33) = v15;
              *((unsigned char *)v21 + 34) = v107;
              *((unsigned char *)v21 + 35) = v16;
              *((unsigned char *)v21 + 36) = v105;
              *((unsigned char *)v21 + 37) = v102;
              *((unsigned char *)v21 + 38) = v100;
              *(_OWORD *)(v21 + 5) = v18;
              unint64_t v4 = v111;
              unint64_t v11 = v99;
            }
            break;
          default:
            id v12 = FCNotificationsLog;
            static os_log_type_t.error.getter();
            sub_1000170E8((uint64_t *)&unk_10006AB60);
            uint64_t v13 = swift_allocObject();
            *(_OWORD *)(v13 + 16) = xmmword_10004E5F0;
            *(void *)(v13 + 56) = &type metadata for Int;
            *(void *)(v13 + 64) = &protocol witness table for Int;
            *(void *)(v13 + 32) = v98;
            unint64_t v4 = v111;
            os_log(_:dso:log:type:_:)();

            swift_bridgeObjectRelease();
            break;
        }
      }
      int v10 = (_OWORD *)((char *)v10 + 24);
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    uint64_t v22 = v104;
  }
  else
  {
    uint64_t v22 = _swiftEmptyArrayStorage;
  }
  uint64_t v23 = v22[2];
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (v23)
  {
    uint64_t v110 = 0;
    BOOL v26 = v4 != 7;
    if (!__OFADD__(v4, 1)) {
      BOOL v26 = 0;
    }
    BOOL v103 = v26;
    if (v4 == 7) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = v4 + 1;
    }
    uint64_t v101 = v27;
    unint64_t v28 = v22 + 6;
    while (1)
    {
      uint64_t v32 = *(v28 - 1);
      uint64_t v113 = *v28;
      if (v32 >= *v28)
      {
        BOOL v106 = v24;
        sub_100030F18((uint64_t)v25);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v44 = (void *)*a1;
        int v115 = (void *)*a1;
        *a1 = 0x8000000000000000;
        unint64_t v46 = sub_100040BE4(v4);
        uint64_t v47 = v44[2];
        BOOL v48 = (v45 & 1) == 0;
        uint64_t v49 = v47 + v48;
        if (__OFADD__(v47, v48)) {
          goto LABEL_98;
        }
        char v50 = v45;
        if (v44[3] >= v49)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_100042CCC();
            unint64_t v44 = v115;
          }
        }
        else
        {
          sub_100041E50(v49, isUniquelyReferenced_nonNull_native);
          unint64_t v44 = v115;
          unint64_t v51 = sub_100040BE4(v4);
          if ((v50 & 1) != (v52 & 1)) {
            goto LABEL_104;
          }
          unint64_t v46 = v51;
        }
        *a1 = v44;
        swift_bridgeObjectRelease();
        id v55 = (void *)*a1;
        if (v50)
        {
          uint64_t v56 = swift_bridgeObjectRetain();
        }
        else
        {
          v55[(v46 >> 6) + 8] |= 1 << v46;
          *(void *)(v55[6] + 8 * v46) = v4;
          *(void *)(v55[7] + 8 * v46) = _swiftEmptyArrayStorage;
          uint64_t v67 = v55[2];
          uint64_t v68 = v67 + 1;
          BOOL v69 = __OFADD__(v67, 1);
          uint64_t v56 = swift_bridgeObjectRetain();
          if (v69) {
            goto LABEL_101;
          }
          *(void *)(v56 + 16) = v68;
        }
        uint64_t v70 = *(void *)(v56 + 56);
        swift_bridgeObjectRelease();
        uint64_t v71 = *(void **)(v70 + 8 * v46);
        char v72 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v70 + 8 * v46) = v71;
        if ((v72 & 1) == 0)
        {
          uint64_t v71 = sub_100046DC8(0, v71[2] + 1, 1, v71);
          *(void *)(v70 + 8 * v46) = v71;
        }
        unint64_t v74 = v71[2];
        unint64_t v73 = v71[3];
        if (v74 >= v73 >> 1)
        {
          uint64_t v71 = sub_100046DC8((void *)(v73 > 1), v74 + 1, 1, v71);
          *(void *)(v70 + 8 * v46) = v71;
        }
        v71[2] = v74 + 1;
        char v75 = &v71[2 * v74];
        v75[4] = v32;
        v75[5] = 86400;
        if (v103) {
          goto LABEL_102;
        }
        sub_100030F18((uint64_t)v110);
        char v76 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v77 = (void *)*a1;
        char v116 = (void *)*a1;
        *a1 = 0x8000000000000000;
        unint64_t v79 = sub_100040BE4(v101);
        uint64_t v80 = v77[2];
        BOOL v81 = (v78 & 1) == 0;
        uint64_t v82 = v80 + v81;
        if (__OFADD__(v80, v81)) {
          goto LABEL_99;
        }
        char v83 = v78;
        if (v77[3] >= v82)
        {
          if ((v76 & 1) == 0)
          {
            sub_100042CCC();
            uint64_t v77 = v116;
          }
        }
        else
        {
          sub_100041E50(v82, v76);
          uint64_t v77 = v116;
          unint64_t v84 = sub_100040BE4(v101);
          if ((v83 & 1) != (v85 & 1)) {
            goto LABEL_104;
          }
          unint64_t v79 = v84;
        }
        *a1 = v77;
        swift_bridgeObjectRelease();
        id v86 = (void *)*a1;
        if (v83)
        {
          uint64_t v87 = swift_bridgeObjectRetain();
        }
        else
        {
          v86[(v79 >> 6) + 8] |= 1 << v79;
          *(void *)(v86[6] + 8 * v79) = v101;
          *(void *)(v86[7] + 8 * v79) = _swiftEmptyArrayStorage;
          uint64_t v88 = v86[2];
          uint64_t v89 = v88 + 1;
          BOOL v90 = __OFADD__(v88, 1);
          uint64_t v87 = swift_bridgeObjectRetain();
          if (v90) {
            goto LABEL_103;
          }
          *(void *)(v87 + 16) = v89;
        }
        uint64_t v91 = *(void *)(v87 + 56);
        swift_bridgeObjectRelease();
        char v92 = *(void **)(v91 + 8 * v79);
        char v93 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v91 + 8 * v79) = v92;
        if ((v93 & 1) == 0)
        {
          char v92 = sub_100046DC8(0, v92[2] + 1, 1, v92);
          *(void *)(v91 + 8 * v79) = v92;
        }
        unint64_t v95 = v92[2];
        unint64_t v94 = v92[3];
        if (v95 >= v94 >> 1)
        {
          char v92 = sub_100046DC8((void *)(v94 > 1), v95 + 1, 1, v92);
          *(void *)(v91 + 8 * v79) = v92;
        }
        uint64_t v29 = v113;
        uint64_t v24 = v106;
        v92[2] = v95 + 1;
        uint64_t v96 = &v92[2 * v95];
        v96[4] = 0;
        unint64_t v31 = v96 + 5;
        uint64_t v110 = sub_100035AE0;
        uint64_t v25 = sub_100035AE0;
        unint64_t v4 = v111;
      }
      else
      {
        sub_100030F18((uint64_t)v24);
        char v33 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v34 = (void *)*a1;
        uint64_t v114 = (void *)*a1;
        *a1 = 0x8000000000000000;
        unint64_t v36 = sub_100040BE4(v4);
        uint64_t v37 = v34[2];
        BOOL v38 = (v35 & 1) == 0;
        uint64_t v39 = v37 + v38;
        if (__OFADD__(v37, v38)) {
          goto LABEL_97;
        }
        char v40 = v35;
        if (v34[3] >= v39)
        {
          if ((v33 & 1) == 0)
          {
            sub_100042CCC();
            unint64_t v34 = v114;
          }
        }
        else
        {
          sub_100041E50(v39, v33);
          unint64_t v34 = v114;
          unint64_t v41 = sub_100040BE4(v111);
          if ((v40 & 1) != (v42 & 1)) {
            goto LABEL_104;
          }
          unint64_t v36 = v41;
        }
        *a1 = v34;
        swift_bridgeObjectRelease();
        uint64_t v53 = (void *)*a1;
        uint64_t v108 = v23;
        if (v40)
        {
          uint64_t v54 = swift_bridgeObjectRetain();
        }
        else
        {
          v53[(v36 >> 6) + 8] |= 1 << v36;
          *(void *)(v53[6] + 8 * v36) = v111;
          *(void *)(v53[7] + 8 * v36) = _swiftEmptyArrayStorage;
          uint64_t v57 = v53[2];
          uint64_t v58 = v57 + 1;
          BOOL v59 = __OFADD__(v57, 1);
          uint64_t v54 = swift_bridgeObjectRetain();
          if (v59) {
            goto LABEL_100;
          }
          *(void *)(v54 + 16) = v58;
        }
        uint64_t v60 = v32;
        uint64_t v61 = *(void *)(v54 + 56);
        swift_bridgeObjectRelease();
        char v62 = *(void **)(v61 + 8 * v36);
        char v63 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v61 + 8 * v36) = v62;
        unint64_t v64 = v25;
        if ((v63 & 1) == 0)
        {
          char v62 = sub_100046DC8(0, v62[2] + 1, 1, v62);
          *(void *)(v61 + 8 * v36) = v62;
        }
        unint64_t v66 = v62[2];
        unint64_t v65 = v62[3];
        if (v66 >= v65 >> 1)
        {
          char v62 = sub_100046DC8((void *)(v65 > 1), v66 + 1, 1, v62);
          *(void *)(v61 + 8 * v36) = v62;
        }
        unint64_t v4 = v111;
        uint64_t v29 = v113;
        _OWORD v62[2] = v66 + 1;
        uint64_t v30 = &v62[2 * v66];
        v30[4] = v60;
        unint64_t v31 = v30 + 5;
        uint64_t v24 = sub_100035AE0;
        uint64_t v25 = v64;
        uint64_t v23 = v108;
      }
      v28 += 3;
      *unint64_t v31 = v29;
      if (!--v23) {
        goto LABEL_95;
      }
    }
  }
  uint64_t v110 = 0;
LABEL_95:
  swift_release();
  sub_100030F18((uint64_t)v24);
  sub_100030F18((uint64_t)v25);
  return sub_100030F18((uint64_t)v110);
}

void sub_100035AE0(void *a1@<X8>)
{
  *a1 = &_swiftEmptyArrayStorage;
}

uint64_t sub_100035AF0(void *a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v3 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = _swiftEmptyArrayStorage;
  unint64_t v83 = *a2;
  if (v4)
  {
    unint64_t v7 = 7 * (v3 / 7);
    unint64_t v8 = v7 + v3 % 7;
    BOOL v9 = __OFADD__(v7, v3 % 7);
    swift_bridgeObjectRetain();
    int v10 = (_OWORD *)(a3 + 40);
    unint64_t v79 = _swiftEmptyArrayStorage;
    unint64_t v74 = v8;
    unint64_t v11 = v8 - 1;
    BOOL v75 = v9;
    unint64_t v76 = v11;
    do
    {
      if ((uint64_t)v3 >= 1)
      {
        if (v9)
        {
          __break(1u);
LABEL_74:
          __break(1u);
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
          __break(1u);
          JUMPOUT(0x1000361E0);
        }
        char v12 = *((unsigned char *)v10 - 8);
        char v13 = *((unsigned char *)v10 - 7);
        char v14 = *((unsigned char *)v10 - 6);
        char v15 = *((unsigned char *)v10 - 5);
        unint64_t v3 = *((unsigned __int8 *)v10 - 4);
        switch(v11)
        {
          case 0uLL:
            if (*((unsigned char *)v10 - 8)) {
              goto LABEL_25;
            }
            goto LABEL_6;
          case 1uLL:
            if (*((unsigned char *)v10 - 7)) {
              goto LABEL_25;
            }
            goto LABEL_6;
          case 2uLL:
            if (*((unsigned char *)v10 - 6)) {
              goto LABEL_25;
            }
            goto LABEL_6;
          case 3uLL:
            if (*((unsigned char *)v10 - 5)) {
              goto LABEL_25;
            }
            goto LABEL_6;
          case 4uLL:
            if (v3) {
              goto LABEL_25;
            }
            goto LABEL_6;
          case 5uLL:
            if (*((unsigned char *)v10 - 3)) {
              goto LABEL_25;
            }
            goto LABEL_6;
          case 6uLL:
            if (*((unsigned char *)v10 - 2))
            {
LABEL_25:
              char v77 = *((unsigned char *)v10 - 2);
              char v78 = *((unsigned char *)v10 - 3);
              long long v80 = *v10;
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              unint64_t v19 = v79;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                sub_10004316C(0, v79[2] + 1, 1);
                BOOL v9 = v75;
                unint64_t v19 = v79;
              }
              long long v20 = v80;
              uint64_t v21 = v19;
              unint64_t v23 = v19[2];
              unint64_t v22 = v19[3];
              if (v23 >= v22 >> 1)
              {
                sub_10004316C(v22 > 1, v23 + 1, 1);
                long long v20 = v80;
                BOOL v9 = v75;
                uint64_t v21 = v79;
              }
              v21[2] = v23 + 1;
              unint64_t v79 = v21;
              uint64_t v24 = &v21[3 * v23];
              *((unsigned char *)v24 + 32) = v12;
              *((unsigned char *)v24 + 33) = v13;
              *((unsigned char *)v24 + 34) = v14;
              *((unsigned char *)v24 + 35) = v15;
              *((unsigned char *)v24 + 36) = v3;
              *((unsigned char *)v24 + 37) = v78;
              *((unsigned char *)v24 + 38) = v77;
              *(_OWORD *)(v24 + 5) = v20;
              unint64_t v3 = v83;
              unint64_t v11 = v76;
            }
            else
            {
LABEL_6:
              unint64_t v3 = v83;
            }
            break;
          default:
            id v16 = FCNotificationsLog;
            static os_log_type_t.error.getter();
            sub_1000170E8((uint64_t *)&unk_10006AB60);
            uint64_t v17 = swift_allocObject();
            *(_OWORD *)(v17 + 16) = xmmword_10004E5F0;
            *(void *)(v17 + 56) = &type metadata for Int;
            *(void *)(v17 + 64) = &protocol witness table for Int;
            *(void *)(v17 + 32) = v74;
            os_log(_:dso:log:type:_:)();

            BOOL v9 = v75;
            swift_bridgeObjectRelease();
            break;
        }
      }
      int v10 = (_OWORD *)((char *)v10 + 24);
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    uint64_t v5 = v79;
  }
  uint64_t v25 = v5[2];
  BOOL v26 = 0;
  uint64_t v27 = 0;
  if (v25)
  {
    unint64_t v28 = (long long *)(v5 + 5);
    do
    {
      long long v29 = *v28;
      if (*((uint64_t *)&v29 + 1) >= (uint64_t)v29)
      {
        long long v81 = *v28;
        sub_100030F18((uint64_t)v27);
        char v40 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v41 = (void *)*a1;
        *a1 = 0x8000000000000000;
        unint64_t v43 = sub_100040BE4(v3);
        uint64_t v44 = v41[2];
        BOOL v45 = (v42 & 1) == 0;
        uint64_t v46 = v44 + v45;
        if (__OFADD__(v44, v45)) {
          goto LABEL_75;
        }
        char v47 = v42;
        if (v41[3] >= v46)
        {
          if ((v40 & 1) == 0) {
            sub_100042CCC();
          }
        }
        else
        {
          sub_100041E50(v46, v40);
          unint64_t v48 = sub_100040BE4(v3);
          if ((v47 & 1) != (v49 & 1)) {
            goto LABEL_79;
          }
          unint64_t v43 = v48;
        }
        *a1 = v41;
        swift_bridgeObjectRelease();
        char v50 = (void *)*a1;
        if (v47)
        {
          uint64_t v51 = swift_bridgeObjectRetain();
        }
        else
        {
          v50[(v43 >> 6) + 8] |= 1 << v43;
          *(void *)(v50[6] + 8 * v43) = v83;
          *(void *)(v50[7] + 8 * v43) = _swiftEmptyArrayStorage;
          uint64_t v52 = v50[2];
          uint64_t v53 = v52 + 1;
          BOOL v54 = __OFADD__(v52, 1);
          uint64_t v51 = swift_bridgeObjectRetain();
          if (v54) {
            goto LABEL_77;
          }
          *(void *)(v51 + 16) = v53;
        }
        uint64_t v55 = *(void *)(v51 + 56);
        swift_bridgeObjectRelease();
        uint64_t v56 = *(void **)(v55 + 8 * v43);
        char v57 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v55 + 8 * v43) = v56;
        if ((v57 & 1) == 0)
        {
          uint64_t v56 = sub_100046DC8(0, v56[2] + 1, 1, v56);
          *(void *)(v55 + 8 * v43) = v56;
        }
        unint64_t v59 = v56[2];
        unint64_t v58 = v56[3];
        long long v60 = v81;
        if (v59 >= v58 >> 1)
        {
          uint64_t v61 = sub_100046DC8((void *)(v58 > 1), v59 + 1, 1, v56);
          long long v60 = v81;
          uint64_t v56 = v61;
          *(void *)(v55 + 8 * v43) = v61;
        }
        unint64_t v3 = v83;
        v56[2] = v59 + 1;
        *(_OWORD *)&v56[2 * v59 + 4] = v60;
        uint64_t v27 = sub_100035AE0;
      }
      else
      {
        if (__OFADD__(*((void *)&v29 + 1), 86400)) {
          goto LABEL_74;
        }
        sub_100030F18((uint64_t)v26);
        char v30 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v31 = (void *)*a1;
        *a1 = 0x8000000000000000;
        unint64_t v33 = sub_100040BE4(v3);
        uint64_t v34 = v31[2];
        BOOL v35 = (v32 & 1) == 0;
        uint64_t v36 = v34 + v35;
        if (__OFADD__(v34, v35)) {
          goto LABEL_76;
        }
        char v37 = v32;
        if (v31[3] >= v36)
        {
          if ((v30 & 1) == 0) {
            sub_100042CCC();
          }
        }
        else
        {
          sub_100041E50(v36, v30);
          unint64_t v38 = sub_100040BE4(v3);
          if ((v37 & 1) != (v39 & 1)) {
            goto LABEL_79;
          }
          unint64_t v33 = v38;
        }
        *a1 = v31;
        swift_bridgeObjectRelease();
        char v62 = (void *)*a1;
        if (v37)
        {
          uint64_t v63 = swift_bridgeObjectRetain();
        }
        else
        {
          v62[(v33 >> 6) + 8] |= 1 << v33;
          *(void *)(v62[6] + 8 * v33) = v83;
          *(void *)(v62[7] + 8 * v33) = _swiftEmptyArrayStorage;
          uint64_t v64 = v62[2];
          uint64_t v65 = v64 + 1;
          BOOL v66 = __OFADD__(v64, 1);
          uint64_t v63 = swift_bridgeObjectRetain();
          if (v66) {
            goto LABEL_78;
          }
          *(void *)(v63 + 16) = v65;
        }
        uint64_t v67 = *(void *)(v63 + 56);
        swift_bridgeObjectRelease();
        uint64_t v68 = *(void **)(v67 + 8 * v33);
        char v69 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v67 + 8 * v33) = v68;
        if ((v69 & 1) == 0)
        {
          uint64_t v68 = sub_100046DC8(0, v68[2] + 1, 1, v68);
          *(void *)(v67 + 8 * v33) = v68;
        }
        unint64_t v71 = v68[2];
        unint64_t v70 = v68[3];
        if (v71 >= v70 >> 1)
        {
          uint64_t v68 = sub_100046DC8((void *)(v70 > 1), v71 + 1, 1, v68);
          *(void *)(v67 + 8 * v33) = v68;
        }
        unint64_t v3 = v83;
        v68[2] = v71 + 1;
        char v72 = &v68[2 * v71];
        v72[4] = v29;
        v72[5] = *((void *)&v29 + 1) + 86400;
        BOOL v26 = sub_100035AE0;
      }
      unint64_t v28 = (long long *)((char *)v28 + 24);
      --v25;
    }
    while (v25);
  }
  swift_release();
  sub_100030F18((uint64_t)v26);
  return sub_100030F18((uint64_t)v27);
}

BOOL sub_1000361FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_100036214()
{
  if (*v0) {
    return 0x73776F646E6977;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_100036254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000386F0(a1, a2);
  *a3 = result;
  return result;
}

void sub_10003627C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100036288(uint64_t a1)
{
  unint64_t v2 = sub_1000389C0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000362C4(uint64_t a1)
{
  unint64_t v2 = sub_1000389C0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100036300(char a1, uint64_t a2)
{
  _StringGuts.grow(_:)(52);
  v4._countAndFlagsBits = 0xD000000000000032;
  v4._id object = (void *)0x8000000100052210;
  String.append(_:)(v4);
  sub_1000170E8(&qword_10006B810);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E960;
  *(void *)(inited + 32) = 0xD000000000000014;
  *(void *)(inited + 40) = 0x8000000100052250;
  *(unsigned char *)(inited + 48) = a1;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(void *)(inited + 80) = 0x73776F646E6977;
  *(void *)(inited + 88) = 0xE700000000000000;
  *(void *)(inited + 120) = sub_1000170E8(&qword_10006B818);
  *(void *)(inited + 96) = a2;
  swift_bridgeObjectRetain();
  sub_10002A01C(inited);
  v6._countAndFlagsBits = Dictionary.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100036438@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000387E0(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result & 1;
    *(void *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_10003646C()
{
  return sub_100036300(*(unsigned char *)v0, *(void *)(v0 + 8));
}

unint64_t sub_100036478(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2) {
    return sub_100036508(*((void *)a1 + 1), *((void *)a2 + 1));
  }
  else {
    return 0;
  }
}

Swift::Int sub_10003649C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100044B94(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_1000369F0(v5);
  *a1 = v2;
  return result;
}

unint64_t sub_100036508(unint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  unint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  unint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_47;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    uint64_t v15 = 8 * v11;
    id v16 = *(int64x2_t **)(*(void *)(v3 + 56) + v15);
    Swift::Int result = sub_100040BE4(*(void *)(*(void *)(v3 + 48) + v15));
    if ((v17 & 1) == 0) {
      return 0;
    }
    long long v18 = *(int64x2_t **)(*(void *)(a2 + 56) + 8 * result);
    uint64_t v19 = v18[1].i64[0];
    if (v19 != v16[1].i64[0]) {
      return 0;
    }
    if (v19) {
      BOOL v20 = v18 == v16;
    }
    else {
      BOOL v20 = 1;
    }
    if (!v20)
    {
      if (v18[2].i64[0] != v16[2].i64[0] || v18[2].i64[1] != v16[2].i64[1]) {
        return 0;
      }
      if (v19 != 1)
      {
        if (v18[3].i64[0] != v16[3].i64[0] || v18[3].i64[1] != v16[3].i64[1]) {
          return 0;
        }
        unint64_t v23 = v18 + 4;
        uint64_t v24 = v16 + 4;
        for (uint64_t i = v19 - 2; i; --i)
        {
          int64x2_t v26 = *v23++;
          int64x2_t v27 = v26;
          int64x2_t v28 = *v24++;
          *(int32x2_t *)v27.i8 = vmovn_s64(vceqq_s64(v27, v28));
          if ((v27.i32[0] & v27.i32[1] & 1) == 0) {
            return 0;
          }
        }
      }
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DelayedNotificationTimetableFactoryConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DelayedNotificationTimetableFactoryConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DelayedNotificationTimetableFactoryConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactoryConfiguration()
{
  return &type metadata for DelayedNotificationTimetableFactoryConfiguration;
}

uint64_t sub_1000367D4(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1000170E8(&qword_10006B7F8);
  uint64_t v4 = static _DictionaryStorage.copy(original:)();
  unint64_t v5 = (void *)v4;
  int64_t v6 = 0;
  uint64_t v25 = a1;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v8 = a1 + 64;
  uint64_t v7 = v9;
  uint64_t v10 = 1 << *(unsigned char *)(v8 - 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v7;
  uint64_t v23 = v8;
  int64_t v24 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v4 + 64;
  if ((v11 & v7) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v6 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v6 << 6))
  {
    uint64_t v19 = *(void *)(*(void *)(v25 + 48) + 8 * i);
    uint64_t v26 = *(void *)(*(void *)(v25 + 56) + 8 * i);
    swift_bridgeObjectRetain_n();
    sub_10003649C(&v26);
    if (v2) {
      break;
    }
    uint64_t v2 = 0;
    swift_bridgeObjectRelease();
    *(void *)(v13 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(void *)(v5[6] + 8 * i) = v19;
    *(void *)(v5[7] + 8 * i) = v26;
    uint64_t v20 = v5[2];
    BOOL v16 = __OFADD__(v20, 1);
    uint64_t v21 = v20 + 1;
    if (v16)
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      break;
    }
    uint64_t v5[2] = v21;
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v16 = __OFADD__(v6++, 1);
    if (v16) {
      goto LABEL_26;
    }
    if (v6 >= v24) {
      return (uint64_t)v5;
    }
    unint64_t v17 = *(void *)(v23 + 8 * v6);
    if (!v17)
    {
      int64_t v18 = v6 + 1;
      if (v6 + 1 >= v24) {
        return (uint64_t)v5;
      }
      unint64_t v17 = *(void *)(v23 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v6 + 2;
        if (v6 + 2 >= v24) {
          return (uint64_t)v5;
        }
        unint64_t v17 = *(void *)(v23 + 8 * v18);
        if (!v17)
        {
          int64_t v18 = v6 + 3;
          if (v6 + 3 >= v24) {
            return (uint64_t)v5;
          }
          unint64_t v17 = *(void *)(v23 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v6 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_27;
              }
              if (v6 >= v24) {
                return (uint64_t)v5;
              }
              unint64_t v17 = *(void *)(v23 + 8 * v6);
              ++v18;
              if (v17) {
                goto LABEL_15;
              }
            }
          }
        }
      }
      int64_t v6 = v18;
    }
LABEL_15:
    unint64_t v12 = (v17 - 1) & v17;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

Swift::Int sub_1000369F0(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v83 = 0;
      uint64_t v84 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v86 = *(void *)(v84 + 16 * i);
        uint64_t v87 = v83;
        do
        {
          if (v86 >= *(void *)(v84 + v87)) {
            break;
          }
          if (!v84) {
            goto LABEL_140;
          }
          uint64_t v88 = (void *)(v84 + v87);
          uint64_t v89 = *(void *)(v84 + v87 + 24);
          *(_OWORD *)(v84 + v87 + 16) = *(_OWORD *)(v84 + v87);
          *uint64_t v88 = v86;
          v88[1] = v89;
          v87 -= 16;
        }
        while (v87 != -16);
        v83 += 16;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_145;
  }
  Swift::Int v6 = result;
  unint64_t v98 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = (char *)_swiftEmptyArrayStorage;
LABEL_102:
      BOOL v90 = v12;
      uint64_t v101 = v9;
      if (v13 >= 2)
      {
        uint64_t v91 = *v98;
        do
        {
          unint64_t v92 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v91) {
            goto LABEL_144;
          }
          char v93 = v90;
          uint64_t v94 = *(void *)&v90[16 * v92 + 32];
          uint64_t v95 = *(void *)&v90[16 * v13 + 24];
          sub_1000370C0((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(void *)&v90[16 * v13 + 16]), v91 + 16 * v95, __dst);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v93 = sub_100044704((uint64_t)v93);
          }
          if (v92 >= *((void *)v93 + 2)) {
            goto LABEL_133;
          }
          uint64_t v96 = &v93[16 * v92 + 32];
          *(void *)uint64_t v96 = v94;
          *((void *)v96 + 1) = v95;
          unint64_t v97 = *((void *)v93 + 2);
          if (v13 > v97) {
            goto LABEL_134;
          }
          memmove(&v93[16 * v13 + 16], &v93[16 * v13 + 32], 16 * (v97 - v13));
          BOOL v90 = v93;
          *((void *)v93 + 2) = v97 - 1;
          unint64_t v13 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      v101[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v101 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    sub_1000170E8(&qword_10006B800);
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v8 + 16) = v7;
    uint64_t v101 = (void *)v8;
    __dst = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v99 = *a1 - 16;
  uint64_t v100 = *a1 + 32;
  unint64_t v12 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v102 = v6;
  Swift::Int v103 = v3;
  uint64_t v104 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 16 * v10);
      uint64_t v16 = *(void *)(v11 + 16 * v14);
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        unint64_t v17 = (uint64_t *)(v100 + 16 * v14);
        uint64_t v18 = v15;
        while (1)
        {
          uint64_t v20 = *v17;
          v17 += 2;
          uint64_t v19 = v20;
          if (v15 < v16 == v20 >= v18) {
            break;
          }
          ++v10;
          uint64_t v18 = v19;
          if (v3 == v10)
          {
            Swift::Int v10 = v3;
            break;
          }
        }
      }
      if (v15 < v16)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v21 = (long long *)(v99 + 16 * v10);
          Swift::Int v22 = v10;
          Swift::Int v23 = v14;
          int64_t v24 = (long long *)(v11 + 16 * v14);
          do
          {
            if (v23 != --v22)
            {
              if (!v11) {
                goto LABEL_143;
              }
              long long v25 = *v24;
              long long *v24 = *v21;
              *uint64_t v21 = v25;
            }
            ++v23;
            --v21;
            ++v24;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    Swift::Int v26 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v26 >= v3) {
      Swift::Int v26 = v3;
    }
    if (v26 < v14) {
      break;
    }
    if (v10 != v26)
    {
      uint64_t v27 = v99 + 16 * v10;
      do
      {
        uint64_t v28 = *(void *)(v11 + 16 * v10);
        Swift::Int v29 = v14;
        uint64_t v30 = v27;
        do
        {
          if (v28 >= *(void *)v30) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v31 = *(void *)(v30 + 24);
          *(_OWORD *)(v30 + 16) = *(_OWORD *)v30;
          *(void *)uint64_t v30 = v28;
          *(void *)(v30 + 8) = v31;
          v30 -= 16;
          ++v29;
        }
        while (v10 != v29);
        ++v10;
        v27 += 16;
      }
      while (v10 != v26);
      Swift::Int v10 = v26;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_100044490(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v33 = *((void *)v12 + 2);
    unint64_t v32 = *((void *)v12 + 3);
    unint64_t v13 = v33 + 1;
    uint64_t v11 = v104;
    if (v33 >= v32 >> 1)
    {
      uint64_t v82 = sub_100044490((char *)(v32 > 1), v33 + 1, 1, v12);
      uint64_t v11 = v104;
      unint64_t v12 = v82;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v34 = v12 + 32;
    BOOL v35 = &v12[16 * v33 + 32];
    *(void *)BOOL v35 = v14;
    *((void *)v35 + 1) = v10;
    if (v33)
    {
      while (1)
      {
        unint64_t v36 = v13 - 1;
        if (v13 >= 4)
        {
          unint64_t v41 = &v34[16 * v13];
          uint64_t v42 = *((void *)v41 - 8);
          uint64_t v43 = *((void *)v41 - 7);
          BOOL v47 = __OFSUB__(v43, v42);
          uint64_t v44 = v43 - v42;
          if (v47) {
            goto LABEL_119;
          }
          uint64_t v46 = *((void *)v41 - 6);
          uint64_t v45 = *((void *)v41 - 5);
          BOOL v47 = __OFSUB__(v45, v46);
          uint64_t v39 = v45 - v46;
          char v40 = v47;
          if (v47) {
            goto LABEL_120;
          }
          unint64_t v48 = v13 - 2;
          char v49 = &v34[16 * v13 - 32];
          uint64_t v51 = *(void *)v49;
          uint64_t v50 = *((void *)v49 + 1);
          BOOL v47 = __OFSUB__(v50, v51);
          uint64_t v52 = v50 - v51;
          if (v47) {
            goto LABEL_122;
          }
          BOOL v47 = __OFADD__(v39, v52);
          uint64_t v53 = v39 + v52;
          if (v47) {
            goto LABEL_125;
          }
          if (v53 >= v44)
          {
            unint64_t v71 = &v34[16 * v36];
            uint64_t v73 = *(void *)v71;
            uint64_t v72 = *((void *)v71 + 1);
            BOOL v47 = __OFSUB__(v72, v73);
            uint64_t v74 = v72 - v73;
            if (v47) {
              goto LABEL_129;
            }
            BOOL v64 = v39 < v74;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v65 = *((void *)v12 + 4);
            uint64_t v66 = *((void *)v12 + 5);
            BOOL v47 = __OFSUB__(v66, v65);
            uint64_t v58 = v66 - v65;
            char v59 = v47;
            goto LABEL_77;
          }
          uint64_t v38 = *((void *)v12 + 4);
          uint64_t v37 = *((void *)v12 + 5);
          BOOL v47 = __OFSUB__(v37, v38);
          uint64_t v39 = v37 - v38;
          char v40 = v47;
        }
        if (v40) {
          goto LABEL_121;
        }
        unint64_t v48 = v13 - 2;
        BOOL v54 = &v34[16 * v13 - 32];
        uint64_t v56 = *(void *)v54;
        uint64_t v55 = *((void *)v54 + 1);
        BOOL v57 = __OFSUB__(v55, v56);
        uint64_t v58 = v55 - v56;
        char v59 = v57;
        if (v57) {
          goto LABEL_124;
        }
        long long v60 = &v34[16 * v36];
        uint64_t v62 = *(void *)v60;
        uint64_t v61 = *((void *)v60 + 1);
        BOOL v47 = __OFSUB__(v61, v62);
        uint64_t v63 = v61 - v62;
        if (v47) {
          goto LABEL_127;
        }
        if (__OFADD__(v58, v63)) {
          goto LABEL_128;
        }
        if (v58 + v63 >= v39)
        {
          BOOL v64 = v39 < v63;
LABEL_83:
          if (v64) {
            unint64_t v36 = v48;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v59) {
          goto LABEL_123;
        }
        uint64_t v67 = &v34[16 * v36];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v47 = __OFSUB__(v68, v69);
        uint64_t v70 = v68 - v69;
        if (v47) {
          goto LABEL_126;
        }
        if (v70 < v58) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v75 = v36 - 1;
        if (v36 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_142;
        }
        unint64_t v76 = v12;
        char v77 = &v34[16 * v75];
        uint64_t v78 = *(void *)v77;
        unint64_t v79 = &v34[16 * v36];
        uint64_t v80 = *((void *)v79 + 1);
        sub_1000370C0((char *)(v11 + 16 * *(void *)v77), (char *)(v11 + 16 * *(void *)v79), v11 + 16 * v80, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v80 < v78) {
          goto LABEL_116;
        }
        if (v36 > *((void *)v76 + 2)) {
          goto LABEL_117;
        }
        *(void *)char v77 = v78;
        *(void *)&v34[16 * v75 + 8] = v80;
        unint64_t v81 = *((void *)v76 + 2);
        if (v36 >= v81) {
          goto LABEL_118;
        }
        unint64_t v12 = v76;
        unint64_t v13 = v81 - 1;
        memmove(&v34[16 * v36], v79 + 16, 16 * (v81 - 1 - v36));
        *((void *)v76 + 2) = v81 - 1;
        uint64_t v11 = v104;
        if (v81 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    Swift::Int v6 = v102;
    Swift::Int v3 = v103;
    if (v10 >= v103)
    {
      uint64_t v9 = v101;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000370C0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  Swift::Int v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  int64_t v24 = __src;
  Swift::Int v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v16 = &v4[16 * v13];
      Swift::Int v22 = v16;
      int64_t v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        unint64_t v17 = (char *)(a3 - 16);
        uint64_t v18 = v6;
        while (1)
        {
          uint64_t v19 = v17 + 16;
          uint64_t v20 = *((void *)v18 - 2);
          v18 -= 16;
          if (*((void *)v16 - 2) >= v20)
          {
            Swift::Int v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16) {
              *(_OWORD *)unint64_t v17 = *((_OWORD *)v16 - 1);
            }
            uint64_t v18 = v6;
            v16 -= 16;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v19 != v6 || v17 >= v6) {
              *(_OWORD *)unint64_t v17 = *(_OWORD *)v18;
            }
            int64_t v24 = v18;
            if (v18 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 16;
          Swift::Int v6 = v18;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    Swift::Int v14 = &v4[16 * v10];
    Swift::Int v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          Swift::Int v23 = v4;
          uint64_t v15 = v6;
        }
        else
        {
          uint64_t v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        Swift::Int v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      int64_t v24 = v7;
    }
LABEL_42:
    sub_10004458C((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

BOOL sub_10003733C(unint64_t a1, unint64_t a2)
{
  return ((a1 ^ a2) & 1 | (a1 >> 8) & 1 ^ (a2 >> 8) & 1 | (a1 >> 16) & 1 ^ (a2 >> 16) & 1 | (a1 >> 24) & 1 ^ (a2 >> 24) & 1 | BYTE4(a1) & 1 ^ BYTE4(a2) & 1 | (a1 >> 40) & 1 ^ (a2 >> 40) & 1 | HIWORD(a1) & 1 ^ HIWORD(a2) & 1) == 0;
}

uint64_t sub_1000373AC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7961646E7573 && a2 == 0xE600000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7961646E6F6DLL && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79616473657574 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x616473656E646577 && a2 == 0xE900000000000079 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7961647372756874 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x796164697266 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7961647275746173 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_10003767C(void *a1)
{
  uint64_t v3 = sub_1000170E8(&qword_10006B878);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017A60(a1, a1[3]);
  sub_1000393C0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1) {
    return sub_1000185C0((uint64_t)a1);
  }
  char v39 = 0;
  char v7 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v38 = 1;
  char v8 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v37 = 2;
  char v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v36 = 3;
  LODWORD(v32) = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v35 = 4;
  LODWORD(v31) = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v34 = 5;
  int v30 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v33 = 6;
  unsigned __int8 v10 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v11 = v7 & 1;
  uint64_t v12 = v8 & 1;
  uint64_t v13 = v9 & 1;
  uint64_t v14 = v32 & 1;
  uint64_t v15 = v31 & 1;
  if (v10 != 2)
  {
    if (v11) {
      BOOL v21 = 0;
    }
    else {
      BOOL v21 = v12 == 0;
    }
    if (!v21 || v13 != 0 || v14 != 0 || v15 != 0 || ((v10 | v30) & 1) != 0)
    {
      uint64_t v31 = v30 & 1;
      uint64_t v32 = v11;
      int v30 = v10 & 1;
      goto LABEL_37;
    }
    goto LABEL_40;
  }
  if (v11) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v12 == 0;
  }
  if (v16 && v13 == 0 && v14 == 0 && v15 == 0 && (v30 & 1) == 0)
  {
LABEL_40:
    sub_100039414();
    swift_allocError();
    void *v28 = 0xD00000000000003DLL;
    v28[1] = 0x8000000100052360;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return sub_1000185C0((uint64_t)a1);
  }
  uint64_t v31 = v30 & 1;
  uint64_t v32 = v11;
  int v30 = 0;
LABEL_37:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1000185C0((uint64_t)a1);
  uint64_t v26 = 0x1000000000000;
  if (!v30) {
    uint64_t v26 = 0;
  }
  return v26 | (v31 << 40) | (v15 << 32) | (v14 << 24) | (v13 << 16) | (v12 << 8) | v32;
}

uint64_t sub_1000379D8(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 == a3)
  {
    sub_100039090();
    swift_allocError();
    *uint64_t v3 = 0xD00000000000003ALL;
    unint64_t v4 = 0x8000000100052320;
  }
  else
  {
    if (a2 >= 0x15181)
    {
      _StringGuts.grow(_:)(71);
      v6._countAndFlagsBits = 0xD000000000000013;
      v6._id object = (void *)0x8000000100052270;
      String.append(_:)(v6);
      v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v7);
      swift_bridgeObjectRelease();
      v8._countAndFlagsBits = 0xD000000000000030;
      v8._id object = (void *)0x8000000100052290;
      String.append(_:)(v8);
    }
    else
    {
      if (a3 < 0x15181) {
        return a1 & 0x1010101010101;
      }
      _StringGuts.grow(_:)(67);
      v9._id object = (void *)0x80000001000522D0;
      v9._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v9);
      v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v10);
      swift_bridgeObjectRelease();
      v11._countAndFlagsBits = 0xD00000000000002ELL;
      v11._id object = (void *)0x80000001000522F0;
      String.append(_:)(v11);
    }
    _print_unlocked<A, B>(_:_:)();
    v12._countAndFlagsBits = 3943982;
    v12._id object = (void *)0xE300000000000000;
    String.append(_:)(v12);
    _print_unlocked<A, B>(_:_:)();
    v13._countAndFlagsBits = 0;
    v13._id object = (void *)0xE000000000000000;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xE000000000000000;
    sub_100039090();
    swift_allocError();
    *uint64_t v3 = 0;
  }
  v3[1] = v4;
  return swift_willThrow();
}

uint64_t sub_100037C7C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6557664F73796164 && a2 == 0xEA00000000006B65;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7472617473 && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 6581861 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100037DC8(void *a1)
{
  uint64_t v3 = sub_1000170E8(&qword_10006B838);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017A60(a1, a1[3]);
  sub_100038FE8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1) {
    return sub_1000185C0((uint64_t)a1);
  }
  char v35 = 0;
  sub_10003903C();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  unint64_t v7 = v32 | ((unint64_t)(v33 | (v34 << 16)) << 32);
  uint64_t v8 = v32 & 1;
  uint64_t v9 = v7 & 0x1000000000000;
  uint64_t v10 = v7 & 0x10000000000;
  unint64_t v11 = v7 & (unint64_t)&_mh_execute_header;
  uint64_t v12 = v32 & 0x100;
  if (v32 == 2)
  {
    uint64_t v8 = 1;
    uint64_t v12 = 256;
  }
  uint64_t v28 = v12;
  uint64_t v29 = v8;
  if (v32 == 2) {
    uint64_t v13 = 0x10000;
  }
  else {
    uint64_t v13 = v32 & 0x10000;
  }
  if (v32 == 2) {
    uint64_t v14 = 0x1000000;
  }
  else {
    uint64_t v14 = v32 & 0x1000000;
  }
  uint64_t v26 = v14;
  uint64_t v27 = v13;
  if (v32 == 2) {
    uint64_t v15 = &_mh_execute_header;
  }
  else {
    uint64_t v15 = (const mach_header_64 *)v11;
  }
  if (v32 == 2) {
    uint64_t v16 = 0x10000000000;
  }
  else {
    uint64_t v16 = v10;
  }
  if (v32 == 2) {
    uint64_t v17 = 0x1000000000000;
  }
  else {
    uint64_t v17 = v9;
  }
  char v31 = 1;
  unint64_t v22 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v23 = v16;
  uint64_t v24 = v17;
  long long v25 = v15;
  char v30 = 2;
  unint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v19 = sub_1000379D8(v28 | v29 | (v26 | v27 | (unint64_t)v25 | v23 | v24) & 0x1FFFFFFFF0000, v22, v18);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1000185C0((uint64_t)a1);
  return v19 & 0x1010101010101;
}

uint64_t sub_10003807C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v45 = &_swiftEmptyDictionarySingleton;
    v43._countAndFlagsBits = 1;
    sub_1000351F8(&v45, (unint64_t *)&v43, a1);
    if (!v1)
    {
      v43._countAndFlagsBits = 2;
      sub_1000351F8(&v45, (unint64_t *)&v43, a1);
      v43._countAndFlagsBits = 3;
      sub_1000351F8(&v45, (unint64_t *)&v43, a1);
      v43._countAndFlagsBits = 4;
      sub_1000351F8(&v45, (unint64_t *)&v43, a1);
      v43._countAndFlagsBits = 5;
      sub_1000351F8(&v45, (unint64_t *)&v43, a1);
      v43._countAndFlagsBits = 6;
      sub_1000351F8(&v45, (unint64_t *)&v43, a1);
      v43._countAndFlagsBits = 7;
      sub_1000351F8(&v45, (unint64_t *)&v43, a1);
      uint64_t v3 = sub_1000367D4((uint64_t)v45);
      swift_bridgeObjectRelease();
      int64_t v4 = 0;
      uint64_t v5 = v3 + 64;
      uint64_t v6 = 1 << *(unsigned char *)(v3 + 32);
      uint64_t v7 = -1;
      if (v6 < 64) {
        uint64_t v7 = ~(-1 << v6);
      }
      unint64_t v8 = v7 & *(void *)(v3 + 64);
      int64_t v9 = (unint64_t)(v6 + 63) >> 6;
      do
      {
LABEL_6:
        if (v8)
        {
          unint64_t v10 = __clz(__rbit64(v8));
          v8 &= v8 - 1;
          unint64_t v11 = v10 | (v4 << 6);
        }
        else
        {
          int64_t v12 = v4 + 1;
          if (__OFADD__(v4, 1)) {
            goto LABEL_45;
          }
          if (v12 >= v9) {
            return swift_release();
          }
          unint64_t v13 = *(void *)(v5 + 8 * v12);
          ++v4;
          if (!v13)
          {
            int64_t v4 = v12 + 1;
            if (v12 + 1 >= v9) {
              return swift_release();
            }
            unint64_t v13 = *(void *)(v5 + 8 * v4);
            if (!v13)
            {
              int64_t v4 = v12 + 2;
              if (v12 + 2 >= v9) {
                return swift_release();
              }
              unint64_t v13 = *(void *)(v5 + 8 * v4);
              if (!v13)
              {
                int64_t v14 = v12 + 3;
                if (v14 >= v9) {
                  return swift_release();
                }
                unint64_t v13 = *(void *)(v5 + 8 * v14);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v4 = v14 + 1;
                    if (__OFADD__(v14, 1)) {
                      goto LABEL_46;
                    }
                    if (v4 >= v9) {
                      return swift_release();
                    }
                    unint64_t v13 = *(void *)(v5 + 8 * v4);
                    ++v14;
                    if (v13) {
                      goto LABEL_21;
                    }
                  }
                }
                int64_t v4 = v14;
              }
            }
          }
LABEL_21:
          unint64_t v8 = (v13 - 1) & v13;
          unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
        }
        uint64_t v15 = *(void *)(*(void *)(v3 + 56) + 8 * v11);
        unint64_t v16 = *(void *)(v15 + 16);
      }
      while (!v16);
      unint64_t v17 = 0;
      unint64_t v18 = (uint64_t *)(v15 + 56);
      while (1)
      {
        uint64_t v19 = v17++;
        if (v19 < (uint64_t)(v16 - 1) && v17 != v16) {
          break;
        }
LABEL_24:
        v18 += 2;
        if (v17 == v16) {
          goto LABEL_6;
        }
      }
      uint64_t v20 = (uint64_t *)(v15 + 32 + 16 * v19);
      uint64_t v21 = *v20;
      uint64_t v22 = v20[1];
      uint64_t v23 = v18;
      unint64_t v24 = v17;
      while (v24 < v16)
      {
        uint64_t v25 = *(v23 - 1);
        uint64_t v26 = *v23;
        if (v25 < v22 && v21 < v26 && v25 != v26 && v21 != v22)
        {
          uint64_t v30 = *(void *)(*(void *)(v3 + 48) + 8 * v11);
          uint64_t v45 = 0;
          unint64_t v46 = 0xE000000000000000;
          swift_bridgeObjectRetain_n();
          _StringGuts.grow(_:)(56);
          v31._countAndFlagsBits = 0x20776F646E6957;
          v31._id object = (void *)0xE700000000000000;
          String.append(_:)(v31);
          uint64_t v47 = v25;
          v43._id object = (void *)0xE000000000000000;
          uint64_t v44 = v26;
          v43._countAndFlagsBits = 0;
          _print_unlocked<A, B>(_:_:)();
          v32._countAndFlagsBits = 3943982;
          v32._id object = (void *)0xE300000000000000;
          String.append(_:)(v32);
          _print_unlocked<A, B>(_:_:)();
          String.append(_:)(v43);
          swift_bridgeObjectRelease();
          v33._countAndFlagsBits = 0x20796164206E6920;
          v33._id object = (void *)0xE800000000000000;
          String.append(_:)(v33);
          v43._countAndFlagsBits = v30;
          v34._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v34);
          swift_bridgeObjectRelease();
          v35._id object = (void *)0x80000001000521D0;
          v35._countAndFlagsBits = 0xD000000000000011;
          String.append(_:)(v35);
          uint64_t v47 = v21;
          v43._countAndFlagsBits = 0;
          v43._id object = (void *)0xE000000000000000;
          uint64_t v44 = v22;
          _print_unlocked<A, B>(_:_:)();
          v36._countAndFlagsBits = 3943982;
          v36._id object = (void *)0xE300000000000000;
          String.append(_:)(v36);
          _print_unlocked<A, B>(_:_:)();
          String.append(_:)(v43);
          swift_bridgeObjectRelease();
          v37._countAndFlagsBits = 0xD000000000000012;
          v37._id object = (void *)0x80000001000521F0;
          String.append(_:)(v37);
          char v38 = v45;
          unint64_t v39 = v46;
          sub_100038ADC();
          swift_allocError();
          *char v40 = v38;
          v40[1] = v39;
          swift_willThrow();
          swift_release();
          return swift_bridgeObjectRelease_n();
        }
        ++v24;
        v23 += 2;
        if (v16 == v24) {
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
    }
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    sub_100038ADC();
    swift_allocError();
    *uint64_t v42 = 0;
    v42[1] = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_10003858C(char a1, uint64_t a2)
{
  sub_10003807C(a2);
  if (v2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v6 = 1;
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    sub_100035AF0(&v7, &v6, a2);
    unint64_t v6 = 2;
    sub_100035AF0(&v7, &v6, a2);
    unint64_t v6 = 3;
    sub_100035AF0(&v7, &v6, a2);
    unint64_t v6 = 4;
    sub_100035AF0(&v7, &v6, a2);
    unint64_t v6 = 5;
    sub_100035AF0(&v7, &v6, a2);
    unint64_t v6 = 6;
    sub_100035AF0(&v7, &v6, a2);
    unint64_t v6 = 7;
    sub_100035AF0(&v7, &v6, a2);
    swift_bridgeObjectRelease();
    sub_1000367D4((uint64_t)v7);
    swift_bridgeObjectRelease();
  }
  return a1 & 1;
}

uint64_t sub_1000386F0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x8000000100052250
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73776F646E6977 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1000387E0(void *a1)
{
  uint64_t v2 = sub_1000170E8(&qword_10006B7D0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100017A60(a1, a1[3]);
  sub_1000389C0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  char v11 = 0;
  char v6 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  sub_1000170E8(&qword_10006B7E0);
  v9[15] = 1;
  sub_100038A14();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v8 = sub_10003858C(v6 & 1, v10);
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1000185C0((uint64_t)a1);
  return v8 & 1;
}

unint64_t sub_1000389C0()
{
  unint64_t result = qword_10006B7D8;
  if (!qword_10006B7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B7D8);
  }
  return result;
}

unint64_t sub_100038A14()
{
  unint64_t result = qword_10006B7E8;
  if (!qword_10006B7E8)
  {
    sub_100033DD8(&qword_10006B7E0);
    sub_100038A88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B7E8);
  }
  return result;
}

unint64_t sub_100038A88()
{
  unint64_t result = qword_10006B7F0;
  if (!qword_10006B7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B7F0);
  }
  return result;
}

unint64_t sub_100038ADC()
{
  unint64_t result = qword_10006B808;
  if (!qword_10006B808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B808);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for DelayedNotificationTimetableFactoryConfiguration.Errors(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithTake for DelayedNotificationTimetableFactoryConfiguration.Errors(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.Errors(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.Errors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_100038C3C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100038C54(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactoryConfiguration.Errors()
{
  return &type metadata for DelayedNotificationTimetableFactoryConfiguration.Errors;
}

__n128 initializeBufferWithCopyOfBuffer for DelayedNotificationTimetableFactoryConfiguration.Window(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.Window(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[24]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.Window(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactoryConfiguration.Window()
{
  return &type metadata for DelayedNotificationTimetableFactoryConfiguration.Window;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100038E9CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_100038EC4(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactoryConfiguration.CodingKeys()
{
  return &type metadata for DelayedNotificationTimetableFactoryConfiguration.CodingKeys;
}

unint64_t sub_100038EE4()
{
  unint64_t result = qword_10006B820;
  if (!qword_10006B820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B820);
  }
  return result;
}

unint64_t sub_100038F3C()
{
  unint64_t result = qword_10006B828;
  if (!qword_10006B828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B828);
  }
  return result;
}

unint64_t sub_100038F94()
{
  unint64_t result = qword_10006B830;
  if (!qword_10006B830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B830);
  }
  return result;
}

unint64_t sub_100038FE8()
{
  unint64_t result = qword_10006B840;
  if (!qword_10006B840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B840);
  }
  return result;
}

unint64_t sub_10003903C()
{
  unint64_t result = qword_10006B848;
  if (!qword_10006B848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B848);
  }
  return result;
}

unint64_t sub_100039090()
{
  unint64_t result = qword_10006B850;
  if (!qword_10006B850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B850);
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactoryConfiguration.Window.Errors()
{
  return &type metadata for DelayedNotificationTimetableFactoryConfiguration.Window.Errors;
}

unsigned char *storeEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.Window.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000391C0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactoryConfiguration.Window.CodingKeys()
{
  return &type metadata for DelayedNotificationTimetableFactoryConfiguration.Window.CodingKeys;
}

_DWORD *initializeBufferWithCopyOfBuffer for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek(_DWORD *result, int *a2)
{
  int v2 = *a2;
  *(_DWORD *)((char *)result + 3) = *(int *)((char *)a2 + 3);
  *unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[7]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 6) = 0;
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 7) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 7) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek()
{
  return &type metadata for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek;
}

unint64_t sub_1000392BC()
{
  unint64_t result = qword_10006B860;
  if (!qword_10006B860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B860);
  }
  return result;
}

unint64_t sub_100039314()
{
  unint64_t result = qword_10006B868;
  if (!qword_10006B868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B868);
  }
  return result;
}

unint64_t sub_10003936C()
{
  unint64_t result = qword_10006B870;
  if (!qword_10006B870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B870);
  }
  return result;
}

unint64_t sub_1000393C0()
{
  unint64_t result = qword_10006B880;
  if (!qword_10006B880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B880);
  }
  return result;
}

unint64_t sub_100039414()
{
  unint64_t result = qword_10006B888;
  if (!qword_10006B888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B888);
  }
  return result;
}

void *_s5newsd48DelayedNotificationTimetableFactoryConfigurationV6ErrorsOwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5newsd48DelayedNotificationTimetableFactoryConfigurationVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1000394F4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek.Errors()
{
  return &type metadata for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek.Errors;
}

uint64_t getEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10003969CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek.CodingKeys()
{
  return &type metadata for DelayedNotificationTimetableFactoryConfiguration.Window.DaysOfWeek.CodingKeys;
}

unint64_t sub_1000396D8()
{
  unint64_t result = qword_10006B890;
  if (!qword_10006B890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B890);
  }
  return result;
}

unint64_t sub_100039730()
{
  unint64_t result = qword_10006B898;
  if (!qword_10006B898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B898);
  }
  return result;
}

unint64_t sub_100039788()
{
  unint64_t result = qword_10006B8A0;
  if (!qword_10006B8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B8A0);
  }
  return result;
}

uint64_t sub_1000397EC()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Date();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  return _swift_task_switch(sub_1000398BC, 0, 0);
}

uint64_t sub_1000398BC()
{
  id v1 = objc_msgSend(objc_msgSend(*(id *)(v0[2] + OBJC_IVAR___NDScoredNotificationPool_context), "news_core_ConfigurationManager"), "configuration");
  uint64_t result = swift_unknownObjectRelease();
  if (v1)
  {
    if ([v1 respondsToSelector:"notificationPoolMaxAge"]) {
      [v1 notificationPoolMaxAge];
    }
    swift_unknownObjectRelease();
    uint64_t v3 = v0[5];
    uint64_t v4 = v0[3];
    uint64_t v5 = v0[4];
    Date.init()();
    static Date.- infix(_:_:)();
    unsigned int v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v0[7] = v6;
    v0[8] = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v6(v3, v4);
    BOOL v7 = (void *)swift_task_alloc();
    v0[9] = v7;
    *BOOL v7 = v0;
    v7[1] = sub_100039A48;
    uint64_t v8 = v0[6];
    return sub_10003AB24(v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100039A48()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100039BDC;
  }
  else {
    uint64_t v2 = sub_100039B5C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100039B5C()
{
  (*(void (**)(void, void))(v0 + 56))(*(void *)(v0 + 48), *(void *)(v0 + 24));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100039BDC()
{
  (*(void (**)(void, void))(v0 + 56))(*(void *)(v0 + 48), *(void *)(v0 + 24));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100039C5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v24 = a1;
  uint64_t v6 = a2 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a2 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v13 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    uint64_t v18 = 16 * i;
    uint64_t v19 = *(void *)(a2 + 56);
    uint64_t v20 = (uint64_t *)(*(void *)(a2 + 48) + v18);
    uint64_t v21 = v20[1];
    v22[0] = *v20;
    v22[1] = v21;
    long long v23 = *(_OWORD *)(v19 + v18);
    swift_bridgeObjectRetain();
    sub_10003EACC(&v24, v22, a3);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v12++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v10) {
      goto LABEL_26;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    if (!v16) {
      break;
    }
LABEL_17:
    unint64_t v9 = (v16 - 1) & v16;
  }
  int64_t v17 = v12 + 1;
  if (v12 + 1 >= v10) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v12 + 2;
  if (v12 + 2 >= v10) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v12 + 3;
  if (v12 + 3 >= v10) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v12 + 4;
  if (v12 + 4 >= v10)
  {
LABEL_26:
    swift_release();
    return v24;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
LABEL_16:
    int64_t v12 = v17;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v10) {
      goto LABEL_26;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_17;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_100039E28()
{
  word_10006D950 = (FCNotificationItemVersion << 8) | 2;
}

uint64_t sub_100039E48(uint64_t a1, void (*a2)(uint64_t *__return_ptr, void *), uint64_t a3)
{
  void (*v18)(uint64_t *__return_ptr, void *);
  void v19[5];
  uint64_t v20;

  v17[1] = a3;
  uint64_t v18 = a2;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  int64_t v10 = (char *)v17 - v9;
  id v11 = sub_10003A2C8();
  URL.appendingPathComponent(_:)();
  uint64_t v12 = type metadata accessor for PoolAccessHandle();
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 32) = 0;
  *(void *)(v13 + 16) = v11;
  sub_10003369C(0, &qword_10006BB50);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  id v14 = sub_10003F6FC((uint64_t)v8);
  if (v3)
  {
    swift_errorRelease();
    id v15 = 0;
  }
  else
  {
    id v15 = v14;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *(void *)(v13 + 24) = v15;
  void v19[3] = v12;
  v19[4] = sub_100045974((unint64_t *)&unk_10006BA38, (void (*)(uint64_t))type metadata accessor for PoolAccessHandle);
  v19[0] = v13;
  swift_retain();
  v18(&v20, v19);
  sub_1000185C0((uint64_t)v19);
  *(unsigned char *)(v13 + 32) = 1;
  swift_release();
  return v20;
}

uint64_t sub_10003A088@<X0>(void (*a1)(void *)@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  v17[1] = a3;
  void v17[2] = a2;
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  int64_t v10 = (char *)v17 - v9;
  id v11 = sub_10003A2C8();
  URL.appendingPathComponent(_:)();
  uint64_t v12 = type metadata accessor for PoolAccessHandle();
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 32) = 0;
  *(void *)(v13 + 16) = v11;
  sub_10003369C(0, &qword_10006BB50);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  id v14 = sub_10003F6FC((uint64_t)v8);
  if (v3)
  {
    swift_errorRelease();
    id v15 = 0;
  }
  else
  {
    id v15 = v14;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *(void *)(v13 + 24) = v15;
  v18[3] = v12;
  v18[4] = sub_100045974((unint64_t *)&unk_10006BA38, (void (*)(uint64_t))type metadata accessor for PoolAccessHandle);
  v18[0] = v13;
  swift_retain();
  v19(v18);
  sub_1000185C0((uint64_t)v18);
  *(unsigned char *)(v13 + 32) = 1;
  return swift_release();
}

id sub_10003A2C8()
{
  uint64_t v1 = (_UNKNOWN **)type metadata accessor for Date();
  uint64_t v49 = (uint64_t)*(v1 - 1);
  __chkstk_darwin(v1);
  unint64_t v48 = (char *)v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v47 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v42 - v7;
  uint64_t v9 = type metadata accessor for DispatchPredicate();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (void *)((char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = *(void **)(v0 + OBJC_IVAR___NDScoredNotificationPool_accessQueue);
  void *v12 = v13;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, enum case for DispatchPredicate.onQueue(_:), v9);
  id v14 = v13;
  char v15 = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
  if ((v15 & 1) == 0)
  {
    __break(1u);
LABEL_15:
    swift_once();
    goto LABEL_6;
  }
  unint64_t v16 = *(void **)(v0 + OBJC_IVAR___NDScoredNotificationPool__index);
  if (v16)
  {
    id v17 = *(id *)(v0 + OBJC_IVAR___NDScoredNotificationPool__index);
LABEL_11:
    id v35 = v16;
    return v17;
  }
  Swift::String v43 = v1;
  uint64_t v44 = 0;
  uint64_t v45 = v0;
  uint64_t v46 = OBJC_IVAR___NDScoredNotificationPool__index;
  v42[1] = "v16@?0@\"NTPBNotificationItem\"8";
  URL.appendingPathComponent(_:)();
  URL._bridgeToObjectiveC()(v18);
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v4 + 8);
  v21(v8, v3);
  NSString v22 = String._bridgeToObjectiveC()();
  LODWORD(v13) = [v20 getUInt16XAttrWithName:v22];

  URL.appendingPathComponent(_:)();
  URL._bridgeToObjectiveC()(v23);
  uint64_t v25 = v24;
  v42[0] = v21;
  v21(v8, v3);
  NSString v26 = String._bridgeToObjectiveC()();
  unsigned int v27 = [v25 getUInt16XAttrWithName:v26];

  uint64_t v1 = FCContextConfiguration_ptr;
  if (v13 != v27) {
    goto LABEL_8;
  }
  if (qword_10006A9E0 != -1) {
    goto LABEL_15;
  }
LABEL_6:
  if (v13 == (unsigned __int16)word_10006D950)
  {
    uint64_t v28 = v47;
    URL.appendingPathComponent(_:)();
    uint64_t v36 = Data.init(contentsOf:options:)();
    unint64_t v38 = v37;
    ((void (*)(char *, uint64_t))v42[0])(v28, v3);
    id v39 = objc_allocWithZone((Class)v1[59]);
    sub_10001722C(v36, v38);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000172D8(v36, v38);
    id v41 = [v39 initWithData:isa];

    sub_1000172D8(v36, v38);
    if (v41) {
      goto LABEL_10;
    }
  }
LABEL_8:
  id result = [objc_allocWithZone((Class)v1[59]) init];
  if (result)
  {
    id v41 = result;
    uint64_t v30 = v48;
    static Date.distantPast.getter();
    Class v31 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, _UNKNOWN **))(v49 + 8))(v30, v43);
    id v32 = [(objc_class *)v31 pbDate];

    [v41 setCreationDate:v32];
    sub_10003369C(0, &qword_10006BB20);
    Swift::String v33 = NSArray.init(arrayLiteral:)();
    [v41 setEntries:v33];

LABEL_10:
    Swift::String v34 = *(void **)(v45 + v46);
    *(void *)(v45 + v46) = v41;
    id v17 = v41;

    unint64_t v16 = v44;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10003A85C(void *a1, void (*a2)(double))
{
  uint64_t v3 = sub_100017A60(a1, a1[3]);
  __chkstk_darwin(v3);
  (*(void (**)(char *))(v5 + 16))((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_10002E8F8(v12);
  dispatch thunk of Sequence.makeIterator()();
  sub_100019994((uint64_t)v12, AssociatedTypeWitness);
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v6 = v10;
  if (v10)
  {
    double v7 = v11;
    do
    {
      LOBYTE(v10) = 0;
      id v8 = v6;
      a2(v7);

      if (v10) {
        break;
      }
      sub_100019994((uint64_t)v12, AssociatedTypeWitness);
      dispatch thunk of IteratorProtocol.next()();
      uint64_t v6 = v10;
      double v7 = v11;
    }
    while (v10);
  }
  return sub_1000185C0((uint64_t)v12);
}

uint64_t sub_10003AB24(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = type metadata accessor for Date();
  v2[6] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[7] = v4;
  v2[8] = *(void *)(v4 + 64);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v2[13] = swift_task_alloc();
  return _swift_task_switch(sub_10003AC58, 0, 0);
}

uint64_t sub_10003AC58()
{
  uint64_t v46 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[10];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  id v6 = (id)FCGenerateOperationID();
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  static Logger.notifications.getter();
  Swift::String v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v43(v3, v2, v5);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v40 = v1[12];
    uint64_t v41 = v1[11];
    uint64_t v42 = v1[13];
    uint64_t v12 = v1[7];
    uint64_t v38 = v1[6];
    uint64_t v39 = v1[10];
    uint64_t v13 = swift_slowAlloc();
    v45[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446466;
    sub_100045974(&qword_10006BAD0, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v15 = v7;
    v1[2] = sub_100024BC0(v14, v16, v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v39, v38);
    *(_WORD *)(v13 + 12) = 2082;
    swift_bridgeObjectRetain();
    v1[3] = sub_100024BC0(v7, v9, v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "will refresh notification pool if older than date=%{public}s, instance=%{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v42, v41);
  }
  else
  {
    uint64_t v18 = v1[12];
    uint64_t v17 = v1[13];
    uint64_t v19 = v1[11];
    (*(void (**)(void, void))(v1[7] + 8))(v1[10], v1[6]);

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    uint64_t v15 = v7;
  }
  uint64_t v21 = v1[4];
  uint64_t v20 = v1[5];
  NSString v22 = (void *)swift_task_alloc();
  uint64_t v22[2] = v20;
  void v22[3] = v21;
  v22[4] = v15;
  v22[5] = v9;
  OS_dispatch_queue.sync<A>(execute:)();
  swift_task_dealloc();
  if (*((unsigned char *)v1 + 144) == 1)
  {
    uint64_t v24 = v1[8];
    uint64_t v23 = v1[9];
    uint64_t v25 = v15;
    uint64_t v26 = v1[6];
    uint64_t v27 = v1[7];
    uint64_t v28 = (char *)v1[5];
    uint64_t v44 = *(void *)&v28[OBJC_IVAR___NDScoredNotificationPool_refreshSerialQueue];
    v43(v23, v1[4], v26);
    unint64_t v29 = (*(unsigned __int8 *)(v27 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    unint64_t v30 = (v24 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v31 = swift_allocObject();
    v1[14] = v31;
    *(void *)(v31 + 16) = v28;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v27 + 32))(v31 + v29, v23, v26);
    id v32 = (uint64_t *)(v31 + v30);
    *id v32 = v25;
    v32[1] = v9;
    Swift::String v33 = v28;
    Swift::String v34 = (void *)swift_task_alloc();
    v1[15] = v34;
    v34[2] = v44;
    v34[3] = &unk_10006BAC8;
    v34[4] = v31;
    id v35 = (void *)swift_task_alloc();
    uint8_t v1[16] = v35;
    void *v35 = v1;
    v35[1] = sub_10003B168;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v35, 0, 0, 0x2865747563657865, 0xEB00000000293A5FLL, sub_100045438, v34, (char *)&type metadata for () + 8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v36 = (uint64_t (*)(void))v1[1];
    return v36();
  }
}

uint64_t sub_10003B168()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10003B304;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10003B284;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10003B284()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003B304()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003B500(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10003B5A8;
  return sub_1000397EC();
}

uint64_t sub_10003B5A8()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    unint64_t v8 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  unint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

void sub_10003B72C(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char *a5@<X8>)
{
  unint64_t v83 = a4;
  uint64_t v79 = a3;
  uint64_t v84 = a2;
  uint64_t v82 = a5;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v80 = v6;
  uint64_t v81 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  char v85 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v78 = (char *)&v74 - v11;
  __chkstk_darwin(v10);
  char v77 = (char *)&v74 - v12;
  uint64_t v13 = sub_1000170E8(&qword_10006B2C0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Date();
  uint64_t v17 = *(char **)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v18);
  unint64_t v76 = (char *)&v74 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  unint64_t v75 = (char *)&v74 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v74 - v26;
  __chkstk_darwin(v25);
  unint64_t v29 = (char *)&v74 - v28;
  id v30 = sub_10003A2C8();
  id v31 = [v30 creationDate];

  if (v31)
  {
    id v32 = [v31 nsDate];

    if (v32)
    {
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      Swift::String v33 = (void (*)(char *, char *, uint64_t))*((void *)v17 + 4);
      Swift::String v34 = v27;
      id v35 = (void (**)(char *, char *, uint64_t))v17;
      v33(v15, v34, v16);
      (*((void (**)(char *, void, uint64_t, uint64_t))v17 + 7))(v15, 0, 1, v16);
      if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v17 + 6))(v15, 1, v16) != 1)
      {
        v33(v29, v15, v16);
        goto LABEL_7;
      }
    }
    else
    {
      id v35 = (void (**)(char *, char *, uint64_t))v17;
      (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v17 + 7))(v15, 1, 1, v16);
    }
    static Date.distantPast.getter();
    sub_100025DD4((uint64_t)v15, &qword_10006B2C0);
LABEL_7:
    uint64_t v36 = v85;
    sub_100045974(&qword_10006B058, (void (*)(uint64_t))&type metadata accessor for Date);
    if (dispatch thunk of static Comparable.< infix(_:_:)())
    {
      static Logger.notifications.getter();
      v35[2](v20, v29, v16);
      unint64_t v37 = v83;
      swift_bridgeObjectRetain_n();
      uint64_t v38 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = swift_slowAlloc();
        uint64_t v78 = (char *)swift_slowAlloc();
        uint64_t v87 = v78;
        *(_DWORD *)uint64_t v40 = 136446466;
        char v77 = (char *)(v40 + 4);
        sub_100045974(&qword_10006BAD0, (void (*)(uint64_t))&type metadata accessor for Date);
        uint64_t v41 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v86 = sub_100024BC0(v41, v42, (uint64_t *)&v87);
        uint64_t v84 = v29;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        Swift::String v43 = v35[1];
        ((void (*)(char *, uint64_t))v43)(v20, v16);
        *(_WORD *)(v40 + 12) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v86 = sub_100024BC0(v79, v37, (uint64_t *)&v87);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "need to refresh notification pool due to age, lastRefresh=%{public}s, instance=%{public}s", (uint8_t *)v40, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v81 + 8))(v85, v80);
        ((void (*)(char *, uint64_t))v43)(v84, v16);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        long long v60 = v35[1];
        ((void (*)(char *, uint64_t))v60)(v20, v16);
        (*(void (**)(char *, uint64_t))(v81 + 8))(v36, v80);
        ((void (*)(char *, uint64_t))v60)(v29, v16);
      }
    }
    else
    {
      uint64_t v44 = v29;
      id v45 = [*(id *)(a1 + OBJC_IVAR___NDScoredNotificationPool_contentVariantProvider) preferredContentVariant];
      id v46 = sub_10003A2C8();
      unsigned int v47 = [v46 isPaidVariant];

      unint64_t v48 = v35 + 2;
      if ((((v45 == (id)1) ^ v47) & 1) == 0)
      {
        uint64_t v61 = v77;
        static Logger.notifications.getter();
        uint64_t v62 = v75;
        (*v48)(v75, v44, v16);
        unint64_t v63 = v83;
        swift_bridgeObjectRetain_n();
        BOOL v64 = Logger.logObject.getter();
        os_log_type_t v65 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v64, v65))
        {
          uint64_t v66 = swift_slowAlloc();
          uint64_t v84 = v44;
          uint64_t v67 = v66;
          uint64_t v78 = (char *)swift_slowAlloc();
          uint64_t v87 = v78;
          *(_DWORD *)uint64_t v67 = 136446466;
          char v85 = (char *)v35;
          sub_100045974(&qword_10006BAD0, (void (*)(uint64_t))&type metadata accessor for Date);
          uint64_t v68 = dispatch thunk of CustomStringConvertible.description.getter();
          uint64_t v86 = sub_100024BC0(v68, v69, (uint64_t *)&v87);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          uint64_t v70 = (void (*)(char *, uint64_t))*((void *)v85 + 1);
          v70(v62, v16);
          *(_WORD *)(v67 + 12) = 2082;
          swift_bridgeObjectRetain();
          uint64_t v86 = sub_100024BC0(v79, v63, (uint64_t *)&v87);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v64, v65, "no need to refresh notification pool, lastRefresh=%{public}s, instance=%{public}s", (uint8_t *)v67, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v81 + 8))(v77, v80);
          v70(v84, v16);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          uint64_t v73 = v35[1];
          ((void (*)(char *, uint64_t))v73)(v62, v16);
          (*(void (**)(char *, uint64_t))(v81 + 8))(v61, v80);
          ((void (*)(char *, uint64_t))v73)(v44, v16);
        }
        char v71 = 0;
        goto LABEL_19;
      }
      uint64_t v49 = v78;
      static Logger.notifications.getter();
      uint64_t v50 = *v48;
      uint64_t v51 = v76;
      uint64_t v84 = v44;
      v50(v76, v44, v16);
      unint64_t v52 = v83;
      swift_bridgeObjectRetain_n();
      uint64_t v53 = Logger.logObject.getter();
      os_log_type_t v54 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v53, v54))
      {
        BOOL v55 = v45 == (id)1;
        uint64_t v56 = swift_slowAlloc();
        char v77 = (char *)swift_slowAlloc();
        uint64_t v87 = v77;
        *(_DWORD *)uint64_t v56 = 67240706;
        LODWORD(v86) = v55;
        char v85 = (char *)v35;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v56 + 8) = 2082;
        sub_100045974(&qword_10006BAD0, (void (*)(uint64_t))&type metadata accessor for Date);
        uint64_t v57 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v86 = sub_100024BC0(v57, v58, (uint64_t *)&v87);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        char v59 = (void (*)(char *, uint64_t))*((void *)v85 + 1);
        v59(v51, v16);
        *(_WORD *)(v56 + 18) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v86 = sub_100024BC0(v79, v52, (uint64_t *)&v87);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "need to refresh notification pool due to content variant change, preferPaid=%{BOOL,public}d, lastRefresh=%{public}s, instance=%{public}s", (uint8_t *)v56, 0x1Cu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v81 + 8))(v78, v80);
        v59(v84, v16);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        uint64_t v72 = v35[1];
        ((void (*)(char *, uint64_t))v72)(v51, v16);
        (*(void (**)(char *, uint64_t))(v81 + 8))(v49, v80);
        ((void (*)(char *, uint64_t))v72)(v84, v16);
      }
    }
    char v71 = 1;
LABEL_19:
    *uint64_t v82 = v71;
    return;
  }
  __break(1u);
}

uint64_t sub_10003C2BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v4[4] = a3;
  void v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return _swift_task_switch(sub_10003C2E0, 0, 0);
}

uint64_t sub_10003C2E0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = swift_task_alloc();
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 16);
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  OS_dispatch_queue.sync<A>(execute:)();
  swift_task_dealloc();
  if (*(unsigned char *)(v0 + 56) == 1)
  {
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 48) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10003C434;
    uint64_t v6 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v0 + 40);
    return sub_10003C528(v6, v5);
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_10003C434()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10003C528(uint64_t a1, uint64_t a2)
{
  void v3[4] = a2;
  void v3[5] = v2;
  v3[3] = a1;
  uint64_t v4 = type metadata accessor for URL();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Date();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  return _swift_task_switch(sub_10003C690, 0, 0);
}

uint64_t sub_10003C690()
{
  Date.init()();
  id v1 = [self defaultManager];
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR___NDScoredNotificationPool_cacheDirectory);
  uint64_t v3 = v2;
  v0[2] = 0;
  id v4 = [v1 URLForDirectory:99 inDomain:1 appropriateForURL:v2 create:1 error:v0 + 2];

  uint64_t v5 = (void *)v0[2];
  uint64_t v6 = v0[13];
  if (v4)
  {
    uint64_t v7 = v0[9];
    uint64_t v8 = v0[8];
    uint64_t v30 = v0[5];
    uint64_t v31 = v0[13];
    uint64_t v9 = v0[3];
    uint64_t v10 = v0[4];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    id v11 = v5;

    swift_bridgeObjectRetain();
    v12._countAndFlagsBits = 0x7865646E692DLL;
    v12._id object = (void *)0xE600000000000000;
    String.append(_:)(v12);
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v13._countAndFlagsBits = 0x736D6574692DLL;
    v13._id object = (void *)0xE600000000000000;
    String.append(_:)(v13);
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    id v14 = objc_allocWithZone((Class)FCPBMessageStreamWriter);
    URL._bridgeToObjectiveC()(v15);
    uint64_t v17 = v16;
    id v18 = [v14 initWithURL:v16];
    v0[14] = v18;

    uint64_t v19 = swift_allocObject();
    v0[15] = v19;
    *(void *)(v19 + 16) = &_swiftEmptyDictionarySingleton;
    uint64_t v20 = swift_allocObject();
    v0[16] = v20;
    *(void *)(v20 + 16) = _swiftEmptyArrayStorage;
    uint64_t v21 = (void *)swift_allocObject();
    v0[17] = v21;
    v21[2] = v19;
    v21[3] = v18;
    v21[4] = v20;
    uint64_t v22 = (void *)swift_task_alloc();
    v0[18] = v22;
    uint64_t v22[2] = v30;
    void v22[3] = sub_1000454C4;
    v22[4] = v21;
    v22[5] = v9;
    v22[6] = v10;
    v22[7] = v18;
    v22[8] = v20;
    v22[9] = v19;
    v22[10] = v31;
    v22[11] = v7;
    v22[12] = v8;
    swift_retain();
    id v23 = v18;
    swift_retain();
    uint64_t v24 = (void *)swift_task_alloc();
    v0[19] = v24;
    void *v24 = v0;
    v24[1] = sub_10003CAAC;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v24, 0, 0, 0xD000000000000021, 0x8000000100052540, sub_1000454D0, v22, (char *)&type metadata for () + 8);
  }
  else
  {
    uint64_t v26 = v0[11];
    uint64_t v25 = v0[12];
    id v27 = v5;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v6, v26);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v28 = (uint64_t (*)(void))v0[1];
    return v28();
  }
}

uint64_t sub_10003CAAC()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10003CD60;
  }
  else {
    uint64_t v2 = sub_10003CC0C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10003CC0C()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v5 = v0[10];
  uint64_t v4 = v0[11];
  uint64_t v7 = v0[8];
  uint64_t v6 = v0[9];
  uint64_t v9 = v0[6];
  uint64_t v8 = v0[7];
  swift_release();

  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v10(v5, v9);
  v10(v7, v9);
  v10(v6, v9);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10003CD60()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v5 = v0[10];
  uint64_t v4 = v0[11];
  uint64_t v7 = v0[8];
  uint64_t v6 = v0[9];
  uint64_t v9 = v0[6];
  uint64_t v8 = v0[7];
  swift_release();

  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v10(v5, v9);
  v10(v7, v9);
  v10(v6, v9);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10003D038(uint64_t a1, const void *a2, void *a3)
{
  v3[2] = a3;
  uint64_t v6 = type metadata accessor for Date();
  v3[3] = v6;
  void v3[4] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  void v3[5] = v7;
  v3[6] = _Block_copy(a2);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[7] = v8;
  void *v8 = v3;
  v8[1] = sub_10003D164;
  return sub_10003AB24(v7);
}

uint64_t sub_10003D164()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void *)(*v1 + 40);
  uint64_t v6 = *(void *)(*v1 + 32);
  uint64_t v7 = *(void *)(*v1 + 24);
  uint64_t v8 = *(void **)(*v1 + 16);
  uint64_t v9 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);

  uint64_t v10 = *(void *)(v3 + 48);
  if (v2)
  {
    id v11 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 16))(*(void *)(v3 + 48), 0);
  }
  _Block_release(*(const void **)(v4 + 48));
  swift_task_dealloc();
  Swift::String v12 = *(uint64_t (**)(void))(v9 + 8);
  return v12();
}

id sub_10003D34C(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id result = [a1 identifier];
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    id v13 = [a3 writeMessage:a1];
    uint64_t v15 = v14;
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = 0x8000000000000000;
    sub_100042564((uint64_t)v13, v15, v10, v12, isUniquelyReferenced_nonNull_native);
    *(void *)(a2 + 16) = v18;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_beginAccess();
    id v17 = a1;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*(void *)(a4 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a4 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    return (id)swift_endAccess();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10003D4D0(uint64_t a1, char *a2, void (**a3)(uint64_t a1, void *a2), uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v62 = a8;
  uint64_t v69 = a6;
  id v70 = a7;
  uint64_t v60 = a5;
  os_log_type_t v54 = a3;
  uint64_t v53 = a1;
  uint64_t v59 = a12;
  uint64_t v57 = a11;
  uint64_t v61 = a9;
  uint64_t v55 = a10;
  uint64_t v14 = type metadata accessor for URL();
  BOOL v64 = *(void **)(v14 - 8);
  uint64_t v65 = v14;
  uint64_t v15 = v64[8];
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v68 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v67 = (char *)&v48 - v17;
  uint64_t v66 = type metadata accessor for Date();
  uint64_t v63 = *(void *)(v66 - 8);
  uint64_t v52 = *(void *)(v63 + 64);
  __chkstk_darwin(v66);
  uint64_t v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = v19;
  uint64_t v20 = sub_1000170E8((uint64_t *)&unk_10006BAE0);
  uint64_t v49 = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void *)(v21 + 64);
  __chkstk_darwin(v20);
  uint64_t v50 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = a2;
  id v23 = [objc_allocWithZone((Class)FCNotificationPoolOperation) initWithContext:*(void *)&a2[OBJC_IVAR___NDScoredNotificationPool_context] contentVariantProvider:*(void *)&a2[OBJC_IVAR___NDScoredNotificationPool_contentVariantProvider]];
  id v58 = v23;
  unint64_t v75 = (void (*)(void *))v54;
  uint64_t v76 = a4;
  aBlock = _NSConcreteStackBlock;
  uint64_t v72 = 1107296256;
  os_log_type_t v54 = &v73;
  uint64_t v73 = sub_1000240C4;
  uint64_t v74 = &unk_100063398;
  uint64_t v24 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v23 setItemHandler:v24];
  _Block_release(v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))((char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v53, v20);
  uint64_t v25 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v19, v55, v66);
  uint64_t v26 = v64;
  uint64_t v27 = v65;
  uint64_t v28 = (void (*)(char *, uint64_t, uint64_t))v64[2];
  v28(v67, v57, v65);
  v28(v68, v59, v27);
  unint64_t v29 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v30 = (v22 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v31 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = (*(unsigned __int8 *)(v25 + 80) + v32 + 8) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  unint64_t v34 = (v52 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v35 = *((unsigned __int8 *)v26 + 80);
  uint64_t v36 = (v35 + v34 + 8) & ~v35;
  uint64_t v37 = (v15 + v35 + v36) & ~v35;
  uint64_t v38 = swift_allocObject();
  uint64_t v39 = v69;
  *(void *)(v38 + 16) = v60;
  *(void *)(v38 + 24) = v39;
  (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v38 + v29, v50, v49);
  *(void *)(v38 + v30) = v70;
  uint64_t v40 = v61;
  *(void *)(v38 + v31) = v62;
  *(void *)(v38 + v32) = v40;
  (*(void (**)(unint64_t, char *, uint64_t))(v63 + 32))(v38 + v33, v51, v66);
  uint64_t v41 = v56;
  *(void *)(v38 + v34) = v56;
  uint64_t v42 = v65;
  Swift::String v43 = (void (*)(uint64_t, char *, uint64_t))v64[4];
  v43(v38 + v36, v67, v65);
  v43(v38 + v37, v68, v42);
  unint64_t v75 = sub_100045794;
  uint64_t v76 = v38;
  aBlock = _NSConcreteStackBlock;
  uint64_t v72 = 1107296256;
  uint64_t v73 = sub_10003F498;
  uint64_t v74 = &unk_1000633E8;
  uint64_t v44 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  id v45 = v70;
  swift_retain();
  swift_retain();
  id v46 = v41;
  swift_release();
  id v47 = v58;
  [v58 setCompletionHandler:v44];
  _Block_release(v44);
  [v47 start];
}

void sub_10003DA78(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, uint64_t a6, NSObject *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v78 = a2;
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v20 = __chkstk_darwin(v19);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)v71 - v23;
  if (a1)
  {
    swift_errorRetain();
    static Logger.notifications.getter();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      os_log_t v74 = v25;
      unint64_t v29 = (void *)v28;
      unint64_t v75 = (void *)swift_slowAlloc();
      v83[0] = v75;
      *(_DWORD *)uint64_t v27 = 138543618;
      uint64_t v77 = v17;
      swift_errorRetain();
      os_log_t v30 = (os_log_t)_swift_stdlib_bridgeErrorToNSError();
      uint64_t v76 = v18;
      os_log_t v31 = v30;
      v81[0] = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v29 = v31;
      swift_errorRelease();
      swift_errorRelease();
      *(_WORD *)(v27 + 12) = 2082;
      swift_bridgeObjectRetain();
      v81[0] = (os_log_t)sub_100024BC0(v78, a3, (uint64_t *)v83);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      os_log_t v32 = v74;
      _os_log_impl((void *)&_mh_execute_header, v74, v26, "failed to refresh notification pool, error=%{public}@, instance=%{public}s", (uint8_t *)v27, 0x16u);
      sub_1000170E8(&qword_10006B018);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v76 + 8))(v24, v77);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
    }
    v83[0] = a1;
    sub_1000170E8((uint64_t *)&unk_10006BAE0);
LABEL_14:
    CheckedContinuation.resume(throwing:)();
    return;
  }
  uint64_t v73 = v22;
  os_log_t v74 = a7;
  unint64_t v75 = v21;
  v83[0] = 0;
  unsigned __int8 v33 = [a5 close:v83];
  id v34 = v83[0];
  uint64_t v77 = v17;
  if ((v33 & 1) == 0)
  {
    id v54 = v83[0];
    os_log_t v55 = (os_log_t)_convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v57 = v75;
    static Logger.notifications.getter();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    id v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = swift_slowAlloc();
      uint64_t v61 = (void *)swift_slowAlloc();
      os_log_t v74 = (os_log_t)swift_slowAlloc();
      v81[0] = v74;
      *(_DWORD *)uint64_t v60 = 138543618;
      swift_errorRetain();
      unint64_t v62 = a3;
      uint64_t v63 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v80 = v63;
      uint64_t v76 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v61 = v63;
      swift_errorRelease();
      swift_errorRelease();
      *(_WORD *)(v60 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v80 = sub_100024BC0(v78, v62, (uint64_t *)v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "failed to persist notification pool, error=%{public}@, instance=%{public}s", (uint8_t *)v60, 0x16u);
      sub_1000170E8(&qword_10006B018);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(void *, uint64_t))(v76 + 8))(v75, v77);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      swift_bridgeObjectRelease_n();
      (*(void (**)(void *, uint64_t))(v18 + 8))(v57, v17);
    }
    v81[0] = v55;
    sub_1000170E8((uint64_t *)&unk_10006BAE0);
    goto LABEL_14;
  }
  unint64_t v72 = a3;
  uint64_t v35 = (uint64_t *)&v74[2];
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = &_swiftEmptyDictionarySingleton;
  type metadata accessor for ProxyScoringServiceConnection();
  id v37 = v34;
  uint64_t v38 = (void *)static ProxyScoringServiceConnection.shared.getter();
  __chkstk_darwin(v38);
  v71[-2] = a6 + 16;
  v71[-1] = v36;
  v71[2] = v36;
  ProxyScoringServiceConnection.withScoringService(_:)();

  swift_beginAccess();
  v71[0] = v35;
  uint64_t v39 = *v35;
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_100039C5C((uint64_t)_swiftEmptyArrayStorage, v39, (uint64_t *)(v36 + 16));
  swift_bridgeObjectRelease();
  uint64_t v80 = v40;
  sub_10003EC90((unint64_t *)&v80);
  id v41 = [objc_allocWithZone((Class)NTPBNotificationPoolIndex) init];
  if (!v41)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v42 = v41;
  v71[1] = a4;
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v44 = [(objc_class *)isa pbDate];

  [v42 setCreationDate:v44];
  objc_msgSend(v42, "setIsPaidVariant:", objc_msgSend(*(id *)(a9 + OBJC_IVAR___NDScoredNotificationPool_contentVariantProvider), "preferredContentVariant") == (id)1);
  unint64_t v45 = swift_bridgeObjectRetain();
  sub_10003ED18(v45);
  swift_bridgeObjectRelease();
  id v46 = objc_allocWithZone((Class)NSMutableArray);
  Class v47 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v48 = [v46 initWithArray:v47];

  [v42 setEntries:v48];
  id v49 = [v42 data];
  if (!v49)
  {
LABEL_20:
    __break(1u);
    return;
  }
  uint64_t v50 = v49;
  uint64_t v51 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v53 = v52;
  swift_bridgeObjectRelease();

  Data.write(to:options:)();
  uint64_t v56 = sub_1000172D8(v51, v53);
  __chkstk_darwin(v56);
  v71[-4] = a9;
  v71[-3] = a10;
  v71[-2] = a11;
  v71[-1] = v42;
  OS_dispatch_queue.sync<A>(execute:)();
  uint64_t v64 = v73;
  static Logger.notifications.getter();
  unint64_t v65 = v72;
  swift_bridgeObjectRetain_n();
  os_log_t v66 = v74;
  swift_retain();
  uint64_t v67 = Logger.logObject.getter();
  uint64_t v68 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v67, (os_log_type_t)v68))
  {
    uint64_t v69 = swift_slowAlloc();
    uint64_t v76 = v18;
    uint64_t v70 = v69;
    unint64_t v75 = (void *)swift_slowAlloc();
    uint64_t v82 = v75;
    *(_DWORD *)uint64_t v70 = 134349314;
    swift_beginAccess();
    uint64_t v79 = *((void *)v66[2].isa + 2);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    *(_WORD *)(v70 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v79 = sub_100024BC0(v78, v65, (uint64_t *)&v82);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v67, (os_log_type_t)v68, "successfully refreshed notification pool, items=%{public}ld, instance=%{public}s", (uint8_t *)v70, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v64, v77);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v64, v77);
  }
  sub_1000170E8((uint64_t *)&unk_10006BAE0);
  CheckedContinuation.resume(returning:)();
  swift_release();
}

void sub_10003E594(void *a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  sub_10003369C(0, &qword_10006BB00);
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10004596C;
  aBlock[5] = a3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10003EA18;
  aBlock[3] = &unk_100063438;
  uint64_t v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [a1 scoreNotificationItems:isa completion:v6];
  _Block_release(v6);
}

uint64_t sub_10003E6C0(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    id result = sub_10003E720(result);
    if (result)
    {
      uint64_t v4 = result;
      swift_beginAccess();
      *(void *)(a3 + 16) = v4;
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_10003E720(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000170E8(&qword_10006BB10);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v13 = (unint64_t)(63 - v4) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (v5)
  {
    unint64_t v7 = __clz(__rbit64(v5));
LABEL_23:
    uint64_t v11 = *(void **)(*(void *)(a1 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
    id v12 = v11;
    static Double._conditionallyBridgeFromObjectiveC(_:result:)();

    swift_bridgeObjectRelease();
    sub_100033820();
    swift_release();
    return 0;
  }
  if (v13 <= 1) {
    goto LABEL_24;
  }
  unint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = 1;
  if (v8)
  {
LABEL_22:
    unint64_t v7 = __clz(__rbit64(v8)) + (v9 << 6);
    goto LABEL_23;
  }
  uint64_t v9 = 2;
  if (v13 <= 2)
  {
LABEL_24:
    sub_100033820();
    return (uint64_t)v2;
  }
  unint64_t v8 = *(void *)(a1 + 80);
  if (v8) {
    goto LABEL_22;
  }
  uint64_t v9 = 3;
  if (v13 <= 3) {
    goto LABEL_24;
  }
  unint64_t v8 = *(void *)(a1 + 88);
  if (v8) {
    goto LABEL_22;
  }
  uint64_t v9 = 4;
  if (v13 <= 4) {
    goto LABEL_24;
  }
  unint64_t v8 = *(void *)(a1 + 96);
  if (v8) {
    goto LABEL_22;
  }
  uint64_t v10 = 5;
  if (v13 <= 5) {
    goto LABEL_24;
  }
  unint64_t v8 = *(void *)(a1 + 104);
  if (v8)
  {
    uint64_t v9 = 5;
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v9 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v8 = *(void *)(a1 + 64 + 8 * v9);
    ++v10;
    if (v8) {
      goto LABEL_22;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10003EA18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_10003369C(0, &qword_10006BB08);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_10003EACC(void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v7 = a2[3];
  id v9 = [objc_allocWithZone((Class)NTPBNotificationPoolIndexEntry) init];
  if (!v9)
  {
    __break(1u);
LABEL_13:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  if (v8 < 0) {
    goto LABEL_13;
  }
  uint64_t v10 = v9;
  [v9 setItemOffset:v8];
  if (v7 < 0) {
    goto LABEL_13;
  }
  [v10 setItemLength:v7];
  swift_beginAccess();
  uint64_t v11 = *a3;
  if (*(void *)(*a3 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_100040C28(v6, v5);
    double v13 = 0.0;
    if (v14) {
      double v13 = *(double *)(*(void *)(v11 + 56) + 8 * v12);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    double v13 = 0.0;
  }
  swift_endAccess();
  [v10 setScore:v13];
  id v15 = v10;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
}

uint64_t sub_10003EC90(unint64_t *a1)
{
  unint64_t v2 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    unint64_t v2 = sub_100044BA8(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v6[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v6[1] = v4;
  sub_100043900(v6);
  return specialized Array._endMutation()();
}

uint64_t sub_10003ED18(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  double v13 = _swiftEmptyArrayStorage;
  uint64_t result = sub_10004318C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        sub_10003369C(0, &qword_10006BA60);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10004318C(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_10004318C(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_10002AD40(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_10003369C(0, &qword_10006BA60);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10004318C(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_10004318C(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_10002AD40(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

id sub_10003EF7C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v57 = a4;
  uint64_t v60 = a3;
  uint64_t v62 = a2;
  uint64_t v63 = a1;
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = a1 + OBJC_IVAR___NDScoredNotificationPool_cacheDirectory;
  v54[0] = "v16@?0@\"NTPBNotificationItem\"8";
  unint64_t v61 = 0x8000000100052590;
  URL.appendingPathComponent(_:)();
  URL._bridgeToObjectiveC()(v10);
  unint64_t v12 = v11;
  char v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v13 = v6 + 8;
  v14(v8, v5);
  uint64_t v56 = "notification_pool_index";
  NSString v15 = String._bridgeToObjectiveC()();
  [v12 setUInt16XAttr:0 withName:v15];

  v54[1] = "otification_pool_version";
  unint64_t v58 = 0x80000001000525E0;
  URL.appendingPathComponent(_:)();
  URL._bridgeToObjectiveC()(v16);
  uint64_t v18 = v17;
  v14(v8, v5);
  NSString v19 = String._bridgeToObjectiveC()();
  [v18 setUInt16XAttr:0 withName:v19];

  uint64_t v20 = *(void **)(v63 + OBJC_IVAR___NDScoredNotificationPool__index);
  uint64_t v55 = OBJC_IVAR___NDScoredNotificationPool__index;
  *(void *)(v63 + OBJC_IVAR___NDScoredNotificationPool__index) = 0;

  uint64_t v21 = self;
  id v22 = [v21 defaultManager];
  unint64_t v61 = v9;
  URL.appendingPathComponent(_:)();
  URL._bridgeToObjectiveC()(v23);
  uint64_t v25 = v24;
  os_log_type_t v59 = v14;
  v14(v8, v5);
  URL._bridgeToObjectiveC()(v26);
  uint64_t v28 = v27;
  id v64 = 0;
  unsigned int v29 = [v22 replaceItemAtURL:v25 withItemAtURL:v27 backupItemName:0 options:0 resultingItemURL:0 error:&v64];

  id v30 = v64;
  if (!v29) {
    goto LABEL_6;
  }
  id v31 = [v21 defaultManager];
  URL.appendingPathComponent(_:)();
  URL._bridgeToObjectiveC()(v32);
  id v34 = v33;
  uint64_t v35 = v59;
  v59(v8, v5);
  URL._bridgeToObjectiveC()(v36);
  uint64_t v38 = v37;
  id v64 = 0;
  unsigned int v39 = [v31 replaceItemAtURL:v34 withItemAtURL:v37 backupItemName:0 options:0 resultingItemURL:0 error:&v64];

  id v30 = v64;
  if (v39)
  {
    URL.appendingPathComponent(_:)();
    URL._bridgeToObjectiveC()(v40);
    uint64_t v42 = v41;
    v35(v8, v5);
    uint64_t v62 = v13;
    if (qword_10006A9E0 != -1) {
      swift_once();
    }
    uint64_t v43 = (unsigned __int16)word_10006D950;
    NSString v44 = String._bridgeToObjectiveC()();
    [v42 setUInt16XAttr:v43 withName:v44];

    URL.appendingPathComponent(_:)();
    URL._bridgeToObjectiveC()(v45);
    Class v47 = v46;
    v35(v8, v5);
    uint64_t v48 = (unsigned __int16)word_10006D950;
    NSString v49 = String._bridgeToObjectiveC()();
    [v47 setUInt16XAttr:v48 withName:v49];

    uint64_t v50 = *(void **)(v63 + v55);
    uint64_t v51 = v57;
    *(void *)(v63 + v55) = v57;

    return v51;
  }
  else
  {
LABEL_6:
    unint64_t v53 = v30;
    _convertNSErrorToError(_:)();

    return (id)swift_willThrow();
  }
}

void sub_10003F498(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10003F5F4()
{
  return type metadata accessor for ScoredNotificationPool();
}

uint64_t type metadata accessor for ScoredNotificationPool()
{
  uint64_t result = qword_10006B908;
  if (!qword_10006B908) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003F648()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_10003F6FC(uint64_t a1)
{
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  uint64_t v3 = v2;
  id v12 = 0;
  id v4 = [(id)swift_getObjCClassFromMetadata() fileHandleForReadingFromURL:v2 error:&v12];

  id v5 = v12;
  if (v4)
  {
    uint64_t v6 = type metadata accessor for URL();
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    id v8 = v5;
    v7(a1, v6);
  }
  else
  {
    id v9 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  }
  return v4;
}

id sub_10003F854(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 24);
  if (!v2)
  {
    if (qword_10006A9F0 != -1) {
      swift_once();
    }
    return (id)qword_10006D960;
  }
  id v4 = *(void **)(v1 + 16);
  id v5 = v2;
  id result = [v4 entries];
  if (result)
  {
    uint64_t v7 = result;
    id v8 = [result objectAtIndexedSubscript:a1];

    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10003369C(0, &qword_10006BA60);
    if (swift_dynamicCast())
    {
      sub_10003FA70(v11, v5, &v12);

      return (id)v12;
    }
    else
    {
      if (qword_10006A9F0 != -1) {
        swift_once();
      }
      id v10 = (id)qword_10006D960;
    }
    return v10;
  }
  __break(1u);
  return result;
}

void sub_10003FA70(id a1@<X1>, void *a2@<X0>, void *a3@<X8>)
{
  id v16 = 0;
  if (objc_msgSend(a2, "seekToOffset:error:", objc_msgSend(a1, "itemOffset"), &v16))
  {
    id v6 = v16;
    if (((unint64_t)[a1 itemLength] & 0x8000000000000000) != 0) {
      __break(1u);
    }
    uint64_t v7 = NSFileHandle.read(upToCount:)();
    if (!v3)
    {
      uint64_t v9 = v7;
      unint64_t v10 = v8;
      if (v8 >> 60 == 15)
      {
        Class isa = 0;
      }
      else
      {
        sub_10001722C(v7, v8);
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        sub_100045000(v9, v10);
      }
      id v13 = [objc_allocWithZone((Class)NTPBNotificationItem) initWithData:isa];

      if (v13)
      {
        [a1 score];
        uint64_t v15 = v14;
        sub_100045000(v9, v10);
        *a3 = v13;
        a3[1] = v15;
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    id v12 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t sub_10003FC10()
{
  return _swift_deallocClassInstance(v0, 33, 7);
}

uint64_t type metadata accessor for PoolAccessHandle()
{
  return self;
}

uint64_t sub_10003FC74()
{
  return sub_100044FBC(&qword_10006B9C8, &qword_10006B9D0);
}

void sub_10003FCB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10003FD7C(a1, a3);
  if (a2 < 1)
  {
    if (v6 > 0 || v6 <= a2)
    {
LABEL_8:
      BOOL v7 = __OFADD__(a1, a2);
      uint64_t v8 = a1 + a2;
      if (v7)
      {
        __break(1u);
      }
      else
      {
        id v9 = [*(id *)(v3 + 16) entries];
        if (!v9)
        {
LABEL_15:
          __break(1u);
          return;
        }
        unint64_t v10 = v9;
        id v11 = [v9 count];

        if ((v8 & 0x8000000000000000) == 0 && (uint64_t)v11 >= v8) {
          return;
        }
      }
      __break(1u);
      goto LABEL_15;
    }
  }
  else if (v6 < 0 || v6 >= a2)
  {
    goto LABEL_8;
  }
}

void sub_10003FD7C(uint64_t a1, uint64_t a2)
{
  id v5 = *(void **)(v2 + 16);
  id v6 = [v5 entries];
  if (!v6) {
    goto LABEL_10;
  }
  BOOL v7 = v6;
  id v8 = [v6 count];

  if (a1 < 0 || (uint64_t)v8 < a1)
  {
    __break(1u);
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v9 = [v5 entries];
  if (!v9)
  {
LABEL_11:
    __break(1u);
    return;
  }
  unint64_t v10 = v9;
  id v11 = [v9 count];

  if (a2 < 0 || (uint64_t)v11 < a2) {
    goto LABEL_9;
  }
}

void sub_10003FE48(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1 - 1;
  if (__OFSUB__(*a1, 1))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  id v5 = [*(id *)(*(void *)v2 + 16) entries];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 count];

    if ((v4 & 0x8000000000000000) == 0 && v4 < (uint64_t)v7)
    {
      *a2 = v4;
      return;
    }
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
}

void sub_10003FED0(uint64_t *a1)
{
  uint64_t v2 = *a1 - 1;
  if (__OFSUB__(*a1, 1))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  id v4 = [*(id *)(*(void *)v1 + 16) entries];
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 count];

    if ((v2 & 0x8000000000000000) == 0 && v2 < (uint64_t)v6)
    {
      *a1 = v2;
      return;
    }
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
}

void sub_10003FF58(uint64_t *a1, uint64_t *a2)
{
}

void sub_10003FF84(void *a1@<X8>)
{
  id v3 = [*(id *)(*(void *)v1 + 16) entries];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 count];

    *a1 = v5;
  }
  else
  {
    __break(1u);
  }
}

void (*sub_10003FFEC(void *a1, uint64_t *a2))(uint64_t a1)
{
  id v3 = sub_10003F854(*a2);
  a1[2] = v3;
  *a1 = v3;
  a1[1] = v4;
  return sub_100040040;
}

void sub_100040040(uint64_t a1)
{
}

void sub_100040048(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = *v2;
  id v7 = [*(id *)(v6 + 16) entries];
  if (!v7) {
    goto LABEL_11;
  }
  id v8 = v7;
  uint64_t v9 = (uint64_t)[v7 count];

  if (v9 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v9 < v4)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  *a2 = v5;
  a2[1] = v4;
  a2[2] = v6;

  swift_retain();
}

void sub_1000400F0(void *a1@<X8>)
{
  id v3 = [*(id *)(*(void *)v1 + 16) entries];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = (unint64_t)[v3 count];

    if ((v5 & 0x8000000000000000) == 0)
    {
      *a1 = 0;
      a1[1] = v5;
      return;
    }
    __break(1u);
  }
  __break(1u);
}

id sub_100040160()
{
  id result = [*(id *)(*(void *)v0 + 16) entries];
  if (result)
  {
    uint64_t v2 = result;
    id v3 = [result count];

    return (id)(v3 == 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000401C4(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

void sub_1000401D4(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *a1 + a2;
  if (__OFADD__(*a1, a2))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  id v6 = [*(id *)(*(void *)v3 + 16) entries];
  if (v6)
  {
    id v7 = v6;
    id v8 = [v6 count];

    if ((v5 & 0x8000000000000000) == 0 && (uint64_t)v8 >= v5)
    {
      *a3 = v5;
      return;
    }
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
}

void sub_10004025C(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  sub_10003FCB8(*a1, a2, *a3);
  *(void *)a4 = v5;
  *(unsigned char *)(a4 + 8) = v6 & 1;
}

uint64_t *sub_100040298(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *sub_1000402B4(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

void *sub_1000402D0(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void sub_1000402EC(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  id v5 = [*(id *)(*(void *)v2 + 16) entries];
  if (v5)
  {
    char v6 = v5;
    id v7 = [v5 count];

    if ((v4 & 0x8000000000000000) == 0 && v4 < (uint64_t)v7)
    {
      *a2 = v4 + 1;
      return;
    }
    __break(1u);
  }
  __break(1u);
}

void sub_10004036C(uint64_t *a1)
{
  uint64_t v3 = *a1;
  id v4 = [*(id *)(*(void *)v1 + 16) entries];
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 count];

    if ((v3 & 0x8000000000000000) == 0 && v3 < (uint64_t)v6)
    {
      *a1 = v3 + 1;
      return;
    }
    __break(1u);
  }
  __break(1u);
}

void sub_1000403EC(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

void sub_1000403F8()
{
  id v1 = [*(id *)(*(void *)v0 + 16) entries];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 count];

    sub_10003FD7C(0, (uint64_t)v3);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100040464()
{
  return 2;
}

void *sub_10004046C()
{
  id v1 = sub_10004301C(*v0);
  swift_release();
  return v1;
}

void sub_1000404A4(void *a1, void *a2, char *a3)
{
}

uint64_t sub_1000404C8()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t sub_1000404EC()
{
  return sub_100045974(&qword_10006B9D8, (void (*)(uint64_t))type metadata accessor for PoolAccessHandle);
}

void *sub_100040534()
{
  return &protocol witness table for Int;
}

uint64_t sub_100040540()
{
  return sub_10004074C((unint64_t *)&unk_10006B9E0);
}

unint64_t sub_100040574()
{
  unint64_t result = qword_10006B9F0;
  if (!qword_10006B9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B9F0);
  }
  return result;
}

uint64_t sub_1000405C8()
{
  return sub_100044FBC(&qword_10006B9F8, &qword_10006BA00);
}

uint64_t sub_100040604()
{
  return sub_100045974(&qword_10006BA08, (void (*)(uint64_t))type metadata accessor for PoolAccessHandle);
}

uint64_t sub_10004064C()
{
  return sub_10004074C(&qword_10006BA10);
}

uint64_t sub_100040680()
{
  return sub_10004080C(&qword_10006BA18, &qword_10006BA20);
}

uint64_t sub_1000406D0()
{
  return sub_100045974(&qword_10006BA20, (void (*)(uint64_t))type metadata accessor for PoolAccessHandle);
}

uint64_t sub_100040718()
{
  return sub_10004074C(&qword_10006BA28);
}

uint64_t sub_10004074C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100033DD8(&qword_10006B800);
    sub_100040574();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000407BC()
{
  return sub_10004080C(&qword_10006BA30, (unint64_t *)&unk_10006BA38);
}

uint64_t sub_10004080C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100033DD8(&qword_10006BA00);
    sub_100045974(a2, (void (*)(uint64_t))type metadata accessor for PoolAccessHandle);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000408A0(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_100026628;
  return v6();
}

uint64_t sub_10004096C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_100026628;
  return v7();
}

uint64_t sub_100040A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100025DD4(a1, &qword_10006B220);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_100040BE4(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();

  return sub_100040D6C(a1, v2);
}

unint64_t sub_100040C28(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100040E08(a1, a2, v4);
}

unint64_t sub_100040CA0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100040EEC(a1, v4);
}

unint64_t sub_100040CE4(char a1)
{
  Hasher.init(_seed:)();
  sub_10002E95C(a1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v2 = Hasher._finalize()();

  return sub_100040FB4(a1, v2);
}

unint64_t sub_100040D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_100040E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100040EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10002B0D4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10002B018((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100040FB4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x8000000100050B50;
      unint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x64657269707865;
          break;
        case 2:
          unint64_t v8 = 0xD000000000000017;
          unint64_t v7 = 0x8000000100050B70;
          break;
        case 3:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x6B6E615278616DLL;
          break;
        case 4:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x65726F63536E696DLL;
          break;
        case 5:
          unint64_t v7 = 0x8000000100050BA0;
          break;
        case 6:
          unint64_t v8 = 0x627550646574756DLL;
          unint64_t v7 = 0xEE0072656873696CLL;
          break;
        case 7:
          unint64_t v8 = 0xD000000000000014;
          unint64_t v7 = 0x8000000100050BC0;
          break;
        case 8:
          unint64_t v8 = 0xD000000000000021;
          unint64_t v7 = 0x8000000100050BE0;
          break;
        case 9:
          unint64_t v8 = 0xD00000000000001ALL;
          unint64_t v7 = 0x8000000100050C10;
          break;
        case 0xA:
          unint64_t v8 = 0x6143656372756F73;
          unint64_t v7 = 0xEC00000074694870;
          break;
        default:
          break;
      }
      unint64_t v9 = 0x8000000100050B50;
      unint64_t v10 = 0xD000000000000010;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE700000000000000;
          if (v8 == 0x64657269707865) {
            goto LABEL_30;
          }
          goto LABEL_31;
        case 2:
          unint64_t v10 = 0xD000000000000017;
          BOOL v11 = "duplicateCluster";
          goto LABEL_29;
        case 3:
          unint64_t v9 = 0xE700000000000000;
          if (v8 != 0x6B6E615278616DLL) {
            goto LABEL_31;
          }
          goto LABEL_30;
        case 4:
          unint64_t v9 = 0xE800000000000000;
          if (v8 != 0x65726F63536E696DLL) {
            goto LABEL_31;
          }
          goto LABEL_30;
        case 5:
          BOOL v11 = "rrences";
          goto LABEL_29;
        case 6:
          unint64_t v9 = 0xEE0072656873696CLL;
          if (v8 != 0x627550646574756DLL) {
            goto LABEL_31;
          }
          goto LABEL_30;
        case 7:
          unint64_t v10 = 0xD000000000000014;
          BOOL v11 = "missingPublisher";
          goto LABEL_29;
        case 8:
          unint64_t v10 = 0xD000000000000021;
          BOOL v11 = "publisherNotFollowed";
LABEL_29:
          unint64_t v9 = (unint64_t)v11 | 0x8000000000000000;
          if (v8 == v10) {
            goto LABEL_30;
          }
          goto LABEL_31;
        case 9:
          unint64_t v9 = 0x8000000100050C10;
          if (v8 != 0xD00000000000001ALL) {
            goto LABEL_31;
          }
          goto LABEL_30;
        case 10:
          unint64_t v9 = 0xEC00000074694870;
          if (v8 != 0x6143656372756F73) {
            goto LABEL_31;
          }
          goto LABEL_30;
        default:
          if (v8 != 0xD000000000000010) {
            goto LABEL_31;
          }
LABEL_30:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_31:
          char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v12) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

uint64_t sub_100041390(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000170E8(&qword_10006BB60);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
  id v34 = v2;
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
    id v22 = (void *)(v5 + 64);
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
    unsigned int v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  id v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10004169C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000170E8(&qword_10006BB58);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_10002AD40((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_10002B0D4(v25, (uint64_t)&v38);
      sub_1000265C0(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_10002AD40(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  id v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000419B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000170E8(&qword_10006BB68);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  char v32 = a2;
  BOOL v33 = v2;
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
  swift_retain();
  int64_t v12 = 0;
LABEL_9:
  if (v10)
  {
    unint64_t v18 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v19 = v18 | (v12 << 6);
LABEL_31:
    char v28 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
    uint64_t v29 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
    Hasher.init(_seed:)();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    Swift::Int v13 = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v24 = 0;
    unint64_t v25 = (unint64_t)(63 - v14) >> 6;
    while (++v16 != v25 || (v24 & 1) == 0)
    {
      BOOL v26 = v16 == v25;
      if (v16 == v25) {
        unint64_t v16 = 0;
      }
      v24 |= v26;
      uint64_t v27 = *(void *)(v11 + 8 * v16);
      if (v27 != -1)
      {
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
LABEL_8:
        *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
        *(unsigned char *)(*(void *)(v7 + 48) + v17) = v28;
        *(void *)(*(void *)(v7 + 56) + 8 * v17) = v29;
        ++*(void *)(v7 + 16);
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    JUMPOUT(0x100041E24);
  }
  int64_t v20 = v12 + 1;
  if (__OFADD__(v12, 1)) {
    goto LABEL_40;
  }
  if (v20 >= v34)
  {
    swift_release();
    uint64_t v3 = v33;
    int64_t v21 = (void *)(v5 + 64);
    if (v32)
    {
LABEL_35:
      uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
      if (v30 >= 64) {
        bzero(v21, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
      }
      else {
        *int64_t v21 = -1 << v30;
      }
      *(void *)(v5 + 16) = 0;
    }
  }
  else
  {
    int64_t v21 = (void *)(v5 + 64);
    unint64_t v22 = *(void *)(v35 + 8 * v20);
    ++v12;
    if (v22) {
      goto LABEL_30;
    }
    int64_t v12 = v20 + 1;
    if (v20 + 1 >= v34) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v35 + 8 * v12);
    if (v22)
    {
LABEL_30:
      unint64_t v10 = (v22 - 1) & v22;
      unint64_t v19 = __clz(__rbit64(v22)) + (v12 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v20 + 2;
    if (v23 < v34)
    {
      unint64_t v22 = *(void *)(v35 + 8 * v23);
      if (!v22)
      {
        while (1)
        {
          int64_t v12 = v23 + 1;
          if (__OFADD__(v23, 1)) {
            goto LABEL_41;
          }
          if (v12 >= v34) {
            goto LABEL_32;
          }
          unint64_t v22 = *(void *)(v35 + 8 * v12);
          ++v23;
          if (v22) {
            goto LABEL_30;
          }
        }
      }
      int64_t v12 = v23;
      goto LABEL_30;
    }
LABEL_32:
    swift_release();
    uint64_t v3 = v33;
    if (v32) {
      goto LABEL_35;
    }
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100041E50(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000170E8(&qword_10006B7F8);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100042108(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000170E8(&qword_10006BB18);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11) {
      break;
    }
    char v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v23);
    ++v14;
    if (!v25)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v14);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v14 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v37 + 8 * v14);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    long long v39 = *(_OWORD *)(*(void *)(v5 + 56) + v31);
    if ((v38 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v17 == v28;
        if (v17 == v28) {
          unint64_t v17 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      unint64_t v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 16 * v18;
    unint64_t v20 = (void *)(*(void *)(v7 + 48) + v19);
    *unint64_t v20 = v34;
    v20[1] = v33;
    *(_OWORD *)(*(void *)(v7 + 56) + v19) = v39;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  char v24 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_100042418(_OWORD *a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_100040CA0(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100042954();
      goto LABEL_7;
    }
    sub_10004169C(v13, a3 & 1);
    unint64_t v19 = sub_100040CA0(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_10002B0D4(a2, (uint64_t)v21);
      return sub_1000426E4(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  unint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_1000185C0((uint64_t)v17);

  return sub_10002AD40(a1, v17);
}

uint64_t sub_100042564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100040C28(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= result && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= result && (a5 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100042E70();
LABEL_7:
    char v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_100042108(result, a5 & 1);
  uint64_t result = sub_100040C28(a3, a4);
  if ((v18 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
  char v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  int64_t v23 = (uint64_t *)(v20[6] + 16 * v14);
  *int64_t v23 = a3;
  v23[1] = a4;
  char v24 = (void *)(v20[7] + 16 * v14);
  void *v24 = a1;
  v24[1] = a2;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_1000426E4(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_10002AD40(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

unint64_t sub_100042760(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

void *sub_1000427A4()
{
  uint64_t v1 = v0;
  sub_1000170E8(&qword_10006BB60);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    char v22 = (void *)(*(void *)(v4 + 48) + v16);
    void *v22 = v19;
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

void *sub_100042954()
{
  uint64_t v1 = v0;
  sub_1000170E8(&qword_10006BB58);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_10002B0D4(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1000265C0(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_10002AD40(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100042B3C()
{
  uint64_t v1 = v0;
  sub_1000170E8(&qword_10006BB68);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100042CCC()
{
  uint64_t v1 = v0;
  sub_1000170E8(&qword_10006B7F8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100042E70()
{
  uint64_t v1 = v0;
  sub_1000170E8(&qword_10006BB18);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_10004301C(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 16) entries];
  if (result)
  {
    uint64_t v2 = result;
    id v3 = [result count];

    sub_10003FD7C(0, (uint64_t)v3);
    if (!v4) {
      return _swiftEmptyArrayStorage;
    }
    BOOL v5 = (char *)v4;
    if (v4 <= 0)
    {
      uint64_t v6 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_1000170E8((uint64_t *)&unk_10006BA68);
      uint64_t v6 = (void *)swift_allocObject();
      int64_t v7 = j__malloc_size(v6);
      uint64_t v8 = v7 - 32;
      if (v7 < 32) {
        uint64_t v8 = v7 - 17;
      }
      uint64_t v6[2] = v5;
      v6[3] = 2 * (v8 >> 4);
    }
    swift_retain();
    sub_100044718(&v11, v6 + 4, v5);
    uint64_t v10 = v9;
    uint64_t result = (void *)swift_release();
    if (v10 == v5) {
      return v6;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10004312C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000431AC(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_10004314C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100043318(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_10004316C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000434B4(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_10004318C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100043790(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_1000431AC(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000170E8((uint64_t *)&unk_10006BB90);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100043318(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000170E8((uint64_t *)&unk_10006BB80);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    _OWORD v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 4;
  int64_t v13 = a4 + 4;
  size_t v14 = 3 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v10 + 4, a4 + 4, v14 * 8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    sub_1000170E8(&qword_10006B858);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000434B4(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000170E8((uint64_t *)&unk_10006BB70);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    memcpy(v12, v13, 24 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100043630(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000170E8(&qword_10006BAF8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100043790(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000170E8(&qword_10006BAF0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100043900(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  Swift::Int v5 = _minimumMergeRunLength(_:)(v4);
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_132;
    }
    if (v4) {
      sub_10004406C(0, v4, 1, a1);
    }
    return;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_140;
  }
  Swift::Int v7 = v5;
  uint64_t v110 = a1;
  if (v4 < 2)
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
    uint64_t v119 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v118 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
LABEL_98:
      Swift::Int v102 = v10;
      if (v13 >= 2)
      {
        uint64_t v103 = *v110;
        do
        {
          unint64_t v104 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_127;
          }
          if (!v103) {
            goto LABEL_139;
          }
          char v105 = v102;
          uint64_t v106 = *(void *)&v102[16 * v104 + 32];
          uint64_t v107 = *(void *)&v102[16 * v13 + 24];
          sub_100044164((void **)(v103 + 8 * v106), (id *)(v103 + 8 * *(void *)&v102[16 * v13 + 16]), v103 + 8 * v107, v118);
          if (v2) {
            break;
          }
          if (v107 < v106) {
            goto LABEL_128;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v105 = sub_100044704((uint64_t)v105);
          }
          if (v104 >= *((void *)v105 + 2)) {
            goto LABEL_129;
          }
          uint64_t v108 = &v105[16 * v104 + 32];
          *(void *)uint64_t v108 = v106;
          *((void *)v108 + 1) = v107;
          unint64_t v109 = *((void *)v105 + 2);
          if (v13 > v109) {
            goto LABEL_130;
          }
          memmove(&v105[16 * v13 + 16], &v105[16 * v13 + 32], 16 * (v109 - v13));
          Swift::Int v102 = v105;
          *((void *)v105 + 2) = v109 - 1;
          unint64_t v13 = v109 - 1;
        }
        while (v109 > 2);
      }
LABEL_95:
      swift_bridgeObjectRelease();
      *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    sub_10003369C(0, &qword_10006BA60);
    uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    uint64_t v118 = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v119 = v9;
  }
  Swift::Int v114 = v7;
  Swift::Int v11 = 0;
  uint64_t v12 = *a1;
  uint64_t v111 = *a1 - 8;
  uint64_t v112 = *a1 + 16;
  uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v115 = v4;
  while (1)
  {
    Swift::Int v14 = v11++;
    Swift::Int v116 = v14;
    if (v11 < v4)
    {
      unint64_t v15 = *(void **)(v12 + 8 * v14);
      id v16 = *(id *)(v12 + 8 * v11);
      id v17 = v15;
      [v16 score];
      double v19 = v18;
      [v17 score];
      double v21 = v20;

      Swift::Int v11 = v14 + 2;
      if (v14 + 2 < v4)
      {
        int64_t v22 = (id *)(v112 + 8 * v14);
        while (1)
        {
          unint64_t v23 = *(v22 - 1);
          id v24 = *v22;
          id v25 = v23;
          [v24 score];
          double v27 = v26;
          [v25 score];
          double v29 = v28;

          if (v21 < v19 == v29 >= v27) {
            break;
          }
          ++v11;
          ++v22;
          if (v4 == v11)
          {
            Swift::Int v11 = v4;
            break;
          }
        }
        Swift::Int v14 = v116;
      }
      if (v21 < v19)
      {
        if (v11 < v14) {
          goto LABEL_133;
        }
        if (v14 < v11)
        {
          uint64_t v30 = (uint64_t *)(v111 + 8 * v11);
          Swift::Int v31 = v11;
          Swift::Int v32 = v14;
          uint64_t v33 = (uint64_t *)(v12 + 8 * v14);
          do
          {
            if (v32 != --v31)
            {
              if (!v12) {
                goto LABEL_138;
              }
              uint64_t v34 = *v33;
              *uint64_t v33 = *v30;
              uint64_t *v30 = v34;
            }
            ++v32;
            --v30;
            ++v33;
          }
          while (v32 < v31);
        }
      }
    }
    if (v11 >= v4) {
      goto LABEL_47;
    }
    if (__OFSUB__(v11, v14)) {
      goto LABEL_131;
    }
    if (v11 - v14 >= v114) {
      goto LABEL_47;
    }
    if (__OFADD__(v14, v114)) {
      goto LABEL_134;
    }
    Swift::Int v35 = v14 + v114 >= v4 ? v4 : v14 + v114;
    if (v35 < v14) {
      break;
    }
    if (v11 != v35)
    {
      uint64_t v113 = v10;
      uint64_t v36 = v111 + 8 * v11;
      do
      {
        uint64_t v37 = *(void **)(v12 + 8 * v11);
        Swift::Int v38 = v14;
        uint64_t v39 = v36;
        do
        {
          uint64_t v40 = *(void **)v39;
          id v41 = v37;
          id v42 = v40;
          [v41 score];
          double v44 = v43;
          [v42 score];
          double v46 = v45;

          if (v46 >= v44) {
            break;
          }
          if (!v12) {
            goto LABEL_136;
          }
          Class v47 = *(void **)v39;
          uint64_t v37 = *(void **)(v39 + 8);
          *(void *)uint64_t v39 = v37;
          *(void *)(v39 + 8) = v47;
          v39 -= 8;
          ++v38;
        }
        while (v11 != v38);
        ++v11;
        v36 += 8;
        Swift::Int v14 = v116;
      }
      while (v11 != v35);
      Swift::Int v11 = v35;
      uint64_t v10 = v113;
    }
LABEL_47:
    if (v11 < v14) {
      goto LABEL_126;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_100044490(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v49 = *((void *)v10 + 2);
    unint64_t v48 = *((void *)v10 + 3);
    unint64_t v13 = v49 + 1;
    if (v49 >= v48 >> 1) {
      uint64_t v10 = sub_100044490((char *)(v48 > 1), v49 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v13;
    uint64_t v50 = v10 + 32;
    uint64_t v51 = &v10[16 * v49 + 32];
    *(void *)uint64_t v51 = v14;
    *((void *)v51 + 1) = v11;
    if (v49)
    {
      Swift::Int v117 = v11;
      while (1)
      {
        unint64_t v52 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v57 = &v50[16 * v13];
          uint64_t v58 = *((void *)v57 - 8);
          uint64_t v59 = *((void *)v57 - 7);
          BOOL v63 = __OFSUB__(v59, v58);
          uint64_t v60 = v59 - v58;
          if (v63) {
            goto LABEL_115;
          }
          uint64_t v62 = *((void *)v57 - 6);
          uint64_t v61 = *((void *)v57 - 5);
          BOOL v63 = __OFSUB__(v61, v62);
          uint64_t v55 = v61 - v62;
          char v56 = v63;
          if (v63) {
            goto LABEL_116;
          }
          unint64_t v64 = v13 - 2;
          unint64_t v65 = &v50[16 * v13 - 32];
          uint64_t v67 = *(void *)v65;
          uint64_t v66 = *((void *)v65 + 1);
          BOOL v63 = __OFSUB__(v66, v67);
          uint64_t v68 = v66 - v67;
          if (v63) {
            goto LABEL_118;
          }
          BOOL v63 = __OFADD__(v55, v68);
          uint64_t v69 = v55 + v68;
          if (v63) {
            goto LABEL_121;
          }
          if (v69 >= v60)
          {
            uint64_t v87 = &v50[16 * v52];
            uint64_t v89 = *(void *)v87;
            uint64_t v88 = *((void *)v87 + 1);
            BOOL v63 = __OFSUB__(v88, v89);
            uint64_t v90 = v88 - v89;
            if (v63) {
              goto LABEL_125;
            }
            BOOL v80 = v55 < v90;
            goto LABEL_85;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v81 = *((void *)v10 + 4);
            uint64_t v82 = *((void *)v10 + 5);
            BOOL v63 = __OFSUB__(v82, v81);
            uint64_t v74 = v82 - v81;
            char v75 = v63;
            goto LABEL_79;
          }
          uint64_t v54 = *((void *)v10 + 4);
          uint64_t v53 = *((void *)v10 + 5);
          BOOL v63 = __OFSUB__(v53, v54);
          uint64_t v55 = v53 - v54;
          char v56 = v63;
        }
        if (v56) {
          goto LABEL_117;
        }
        unint64_t v64 = v13 - 2;
        uint64_t v70 = &v50[16 * v13 - 32];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        BOOL v73 = __OFSUB__(v71, v72);
        uint64_t v74 = v71 - v72;
        char v75 = v73;
        if (v73) {
          goto LABEL_120;
        }
        uint64_t v76 = &v50[16 * v52];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v63 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v63) {
          goto LABEL_123;
        }
        if (__OFADD__(v74, v79)) {
          goto LABEL_124;
        }
        if (v74 + v79 >= v55)
        {
          BOOL v80 = v55 < v79;
LABEL_85:
          if (v80) {
            unint64_t v52 = v64;
          }
          goto LABEL_87;
        }
LABEL_79:
        if (v75) {
          goto LABEL_119;
        }
        unint64_t v83 = &v50[16 * v52];
        uint64_t v85 = *(void *)v83;
        uint64_t v84 = *((void *)v83 + 1);
        BOOL v63 = __OFSUB__(v84, v85);
        uint64_t v86 = v84 - v85;
        if (v63) {
          goto LABEL_122;
        }
        if (v86 < v74) {
          goto LABEL_14;
        }
LABEL_87:
        unint64_t v91 = v52 - 1;
        if (v52 - 1 >= v13)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
          goto LABEL_135;
        }
        uint64_t v92 = v12;
        if (!v12) {
          goto LABEL_137;
        }
        char v93 = v10;
        uint64_t v94 = &v50[16 * v91];
        uint64_t v95 = *(void *)v94;
        uint64_t v96 = v50;
        unint64_t v97 = v52;
        unint64_t v98 = &v50[16 * v52];
        uint64_t v99 = *((void *)v98 + 1);
        uint64_t v100 = v92;
        sub_100044164((void **)(v92 + 8 * *(void *)v94), (id *)(v92 + 8 * *(void *)v98), v92 + 8 * v99, v118);
        if (v1) {
          goto LABEL_95;
        }
        if (v99 < v95) {
          goto LABEL_112;
        }
        if (v97 > *((void *)v93 + 2)) {
          goto LABEL_113;
        }
        *(void *)uint64_t v94 = v95;
        *(void *)&v96[16 * v91 + 8] = v99;
        unint64_t v101 = *((void *)v93 + 2);
        if (v97 >= v101) {
          goto LABEL_114;
        }
        uint64_t v10 = v93;
        unint64_t v13 = v101 - 1;
        memmove(v98, v98 + 16, 16 * (v101 - 1 - v97));
        uint64_t v50 = v96;
        *((void *)v93 + 2) = v101 - 1;
        uint64_t v12 = v100;
        Swift::Int v11 = v117;
        if (v101 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_14:
    Swift::Int v4 = v115;
    if (v11 >= v115)
    {
      uint64_t v2 = v1;
      goto LABEL_98;
    }
  }
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10004406C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v8 = *(void **)(v6 + 8 * v4);
    uint64_t v9 = a1;
    uint64_t v10 = v7;
    while (1)
    {
      Swift::Int v11 = *(void **)v10;
      id v12 = v8;
      id v13 = v11;
      [v12 score];
      double v15 = v14;
      [v13 score];
      double v17 = v16;

      if (v17 >= v15)
      {
LABEL_4:
        ++v4;
        v7 += 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v6) {
        break;
      }
      double v18 = *(void **)v10;
      uint64_t v8 = *(void **)(v10 + 8);
      *(void *)uint64_t v10 = v8;
      *(void *)(v10 + 8) = v18;
      v10 -= 8;
      if (v4 == ++v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_100044164(void **__src, id *a2, unint64_t a3, void **a4)
{
  Swift::Int v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v8 = (char *)a2 - (char *)__src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  uint64_t v39 = __src;
  Swift::Int v38 = a4;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7) {
      goto LABEL_46;
    }
    if (a4 != a2 || &a2[v12] <= a4) {
      memmove(a4, a2, 8 * v12);
    }
    unint64_t v23 = &a4[v12];
    uint64_t v37 = (char *)v23;
    uint64_t v39 = v5;
    if (v6 >= v5 || v10 < 8) {
      goto LABEL_45;
    }
    id v24 = (id *)(a3 - 8);
    id v25 = v5;
    while (1)
    {
      double v26 = v24 + 1;
      double v27 = v23 - 1;
      double v28 = *--v25;
      id v29 = *(v23 - 1);
      id v30 = v28;
      [v29 score];
      double v32 = v31;
      [v30 score];
      double v34 = v33;

      if (v34 < v32) {
        break;
      }
      uint64_t v37 = (char *)(v23 - 1);
      if (v26 < v23 || v24 >= v23)
      {
        id *v24 = *v27;
        id v25 = v5;
        --v23;
        goto LABEL_43;
      }
      if (v26 != v23) {
        id *v24 = *v27;
      }
      id v25 = v5;
      --v23;
      if (v5 <= v6) {
        goto LABEL_45;
      }
LABEL_44:
      --v24;
      Swift::Int v5 = v25;
      if (v23 <= a4) {
        goto LABEL_45;
      }
    }
    if (v26 != v5 || v24 >= v5) {
      id *v24 = *v25;
    }
    uint64_t v39 = v25;
LABEL_43:
    if (v25 <= v6) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  if (v7 >= -7)
  {
    if (a4 != __src || &__src[v9] <= a4) {
      memmove(a4, __src, 8 * v9);
    }
    id v13 = &a4[v9];
    uint64_t v37 = (char *)v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      double v14 = a4;
      do
      {
        double v15 = *v14;
        id v16 = *v5;
        id v17 = v15;
        [v16 score];
        double v19 = v18;
        [v17 score];
        double v21 = v20;

        if (v21 >= v19)
        {
          if (v6 != v14) {
            *uint64_t v6 = *v14;
          }
          Swift::Int v38 = ++v14;
          int64_t v22 = v5;
        }
        else
        {
          int64_t v22 = v5 + 1;
          if (v6 < v5 || v6 >= v22 || v6 != v5) {
            *uint64_t v6 = *v5;
          }
        }
        ++v6;
        if (v14 >= v13) {
          break;
        }
        Swift::Int v5 = v22;
      }
      while ((unint64_t)v22 < a3);
      uint64_t v39 = v6;
    }
LABEL_45:
    sub_100044648((void **)&v39, (const void **)&v38, &v37);
    return 1;
  }
LABEL_46:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_100044490(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000170E8(&qword_10006BAF8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  id v13 = v10 + 32;
  double v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10004458C(void **a1, const void **a2, void *a3)
{
  id v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_100044648(void **a1, const void **a2, void *a3)
{
  id v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_100044704(uint64_t a1)
{
  return sub_100044490(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_100044718(void *a1, void *a2, char *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v5 = a3;
    if (a3)
    {
      if (((unint64_t)a3 & 0x8000000000000000) != 0) {
        goto LABEL_38;
      }
      unint64_t v6 = a2;
      Swift::Int v35 = a1;
      id v7 = [*(id *)(v3 + 16) entries];
      if (!v7)
      {
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
      }
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = v5 - 1;
      uint64_t v36 = v5 - 1;
      while (1)
      {
        int64_t v11 = (char *)objc_msgSend(v8, "count", v34);

        if (v9 == v11) {
          break;
        }
        uint64_t v12 = *(void **)(v4 + 24);
        if (v12)
        {
          id v13 = *(void **)(v4 + 16);
          id v14 = v12;
          id v15 = [v13 entries];
          if (!v15) {
            goto LABEL_41;
          }
          id v16 = v15;
          id v17 = [v15 objectAtIndexedSubscript:v9];

          _bridgeAnyObjectToAny(_:)();
          swift_unknownObjectRelease();
          sub_10003369C(0, &qword_10006BA60);
          if (swift_dynamicCast())
          {
            id v19 = [v37 itemOffset];
            v38[0] = 0;
            if ([v14 seekToOffset:v19 error:v38])
            {
              id v20 = v38[0];
              if (((unint64_t)[v37 itemLength] & 0x8000000000000000) != 0) {
                goto LABEL_37;
              }
              uint64_t v21 = NSFileHandle.read(upToCount:)();
              uint64_t v23 = v21;
              unint64_t v24 = v22;
              double v34 = v5;
              if (v22 >> 60 == 15)
              {
                Class isa = 0;
              }
              else
              {
                sub_10001722C(v21, v22);
                Class isa = Data._bridgeToObjectiveC()().super.isa;
                sub_100045000(v23, v24);
              }
              id v27 = [objc_allocWithZone((Class)NTPBNotificationItem) initWithData:isa];

              if (!v27)
              {
                __break(1u);
                return;
              }
              [v37 score];
              uint64_t v26 = v33;
              sub_100045000(v23, v24);

              uint64_t v5 = v34;
            }
            else
            {
              id v28 = v38[0];
              _convertNSErrorToError(_:)();

              swift_willThrow();
              if (qword_10006A9F0 != -1) {
                swift_once();
              }
              uint64_t v26 = qword_10006D968;
              id v27 = (id)qword_10006D960;
              swift_errorRelease();
            }
            uint64_t v10 = v36;
          }
          else
          {
            if (qword_10006A9F0 != -1) {
              swift_once();
            }
            uint64_t v26 = qword_10006D968;
            id v27 = (id)qword_10006D960;
          }
        }
        else
        {
          if (qword_10006A9F0 != -1) {
            swift_once();
          }
          uint64_t v26 = qword_10006D968;
          id v27 = (id)qword_10006D960;
        }
        id v29 = *(void **)(v4 + 16);
        swift_retain();
        id v30 = [v29 entries];
        if (!v30) {
          goto LABEL_40;
        }
        double v31 = v30;
        double v32 = (char *)[v30 count];
        swift_release();

        if ((uint64_t)v9 >= (uint64_t)v32)
        {
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        *unint64_t v6 = v27;
        v6[1] = v26;
        if (v10 == v9) {
          goto LABEL_34;
        }
        id v8 = [*(id *)(v4 + 16) entries];
        ++v9;
        v6 += 2;
        if (!v8) {
          goto LABEL_39;
        }
      }
      uint64_t v5 = v9;
LABEL_34:
      a1 = v35;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a1 = v4;
  a1[1] = v5;
}

uint64_t sub_100044B94(uint64_t a1)
{
  return sub_100043630(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100044BA8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

id sub_100044C24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v22 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v21 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v4[OBJC_IVAR___NDScoredNotificationPool__index] = 0;
  *(void *)&v4[OBJC_IVAR___NDScoredNotificationPool_context] = a1;
  *(void *)&v4[OBJC_IVAR___NDScoredNotificationPool_contentVariantProvider] = a2;
  id v14 = &v4[OBJC_IVAR___NDScoredNotificationPool_cacheDirectory];
  uint64_t v20 = type metadata accessor for URL();
  uint64_t v15 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v14, a3, v20);
  sub_10003369C(0, &qword_10006B280);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v10);
  id v16 = v4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  static DispatchQoS.unspecified.getter();
  uint64_t v26 = &_swiftEmptyArrayStorage;
  sub_100045974(&qword_10006BA48, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000170E8(&qword_10006BA50);
  sub_100044FBC(&qword_10006BA58, &qword_10006BA50);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  *(void *)&v16[OBJC_IVAR___NDScoredNotificationPool_accessQueue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  id v17 = [objc_allocWithZone((Class)FCAsyncSerialQueue) initWithQualityOfService:17];
  *(void *)&v16[OBJC_IVAR___NDScoredNotificationPool_refreshSerialQueue] = v17;

  v25.receiver = v16;
  v25.super_class = ObjectType;
  id v18 = objc_msgSendSuper2(&v25, "init");
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v22, v20);
  return v18;
}

uint64_t sub_100044FBC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100033DD8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100045000(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000172D8(a1, a2);
  }
  return a1;
}

uint64_t sub_100045014()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10004505C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (const void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100026628;
  unint64_t v6 = (uint64_t (*)(uint64_t, const void *, void *))((char *)&dword_10006BA78 + dword_10006BA78);
  return v6(v2, v3, v4);
}

uint64_t sub_100045118()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100045150(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100026628;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10006BAA8 + dword_10006BAA8);
  return v6(a1, v4);
}

void sub_100045208(char *a1@<X8>)
{
  sub_10003B72C(*(void *)(v1 + 16), *(char **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_100045228()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_100045314()
{
  uint64_t v2 = *(void *)(type metadata accessor for Date() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  unint64_t v6 = (uint64_t *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  void v9[4] = v7;
  v9[5] = v8;
  _OWORD v9[2] = v4;
  v9[3] = v5;
  v9[1] = sub_10001A5B8;
  return _swift_task_switch(sub_10003C2E0, 0, 0);
}

void sub_100045438(uint64_t a1)
{
  sub_100019A48(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_100045444()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004547C()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

id sub_1000454C4(void *a1)
{
  return sub_10003D34C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

void sub_1000454D0(uint64_t a1)
{
  sub_10003D4D0(a1, *(char **)(v1 + 16), *(void (***)(uint64_t, void *))(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void **)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96));
}

uint64_t sub_100045510(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100045520()
{
  return swift_release();
}

uint64_t sub_100045528()
{
  uint64_t v21 = sub_1000170E8((uint64_t *)&unk_10006BAE0);
  uint64_t v1 = *(void *)(v21 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  unint64_t v19 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v20 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (v5 + ((((v19 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v5;
  unint64_t v17 = (*(void *)(v4 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 + v17 + 8) & ~v9;
  uint64_t v11 = *(void *)(v8 + 64);
  uint64_t v12 = v2 | v5 | v9 | 7;
  uint64_t v13 = (v11 + v9 + v10) & ~v9;
  uint64_t v18 = v13 + v11;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v21);

  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v6, v20);

  uint64_t v14 = v0 + v10;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v15(v14, v7);
  v15(v0 + v13, v7);

  return _swift_deallocObject(v0, v18, v12);
}

void sub_100045794(void *a1)
{
  uint64_t v3 = *(void *)(sub_1000170E8((uint64_t *)&unk_10006BAE0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(type metadata accessor for Date() - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + v7 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v10 = (*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  sub_10003DA78(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), v1 + v4, *(void **)(v1 + v5), *(void *)(v1 + v6), *(NSObject **)(v1 + v7), v1 + v9, *(void *)(v1 + v10), v1 + ((v12 + v10 + 8) & ~v12), v1 + ((*(void *)(v11 + 64) + v12 + ((v12 + v10 + 8) & ~v12)) & ~v12));
}

void sub_100045944(void *a1)
{
  sub_10003E594(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

id sub_10004594C()
{
  return sub_10003EF7C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_10004596C(uint64_t a1, uint64_t a2)
{
  return sub_10003E6C0(a1, a2, v2);
}

uint64_t sub_100045974(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000459BC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000459FC()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *unint64_t v4 = v1;
  v4[1] = sub_10001A5B8;
  unint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_10006BB28 + dword_10006BB28);
  return v5(v2, v3);
}

uint64_t sub_100045AB0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100045AC8(void *a1)
{
  return sub_10003A85C(a1, *(void (**)(double))(v1 + 16));
}

uint64_t sub_100045AD0@<X0>(uint64_t a1@<X8>)
{
  return sub_10003A088(*(void (**)(void *))(v1 + 24), *(void *)(v1 + 32), a1);
}

void sub_100045B04(char *a1@<X8>)
{
}

uint64_t *sub_100045B28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_100045C74(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_100045D44(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_100045E54(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *sub_100045FC8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_1000460D8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_10004624C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100046260);
}

uint64_t sub_100046260(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000462CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000462E0);
}

uint64_t sub_1000462E0(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_100046360(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 1, v2);
}

uint64_t sub_1000463C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 1, v4);
}

uint64_t type metadata accessor for DelayedNotificationTimetable()
{
  uint64_t result = qword_10006BC10;
  if (!qword_10006BC10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100046484()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_1000464FC()
{
  uint64_t result = sub_10004651C();
  qword_10006D958 = result;
  return result;
}

uint64_t sub_10004651C()
{
  uint64_t v0 = type metadata accessor for Container.Environment();
  uint64_t v42 = *(void *)(v0 - 8);
  uint64_t v43 = v0;
  ((void (*)(void))__chkstk_darwin)();
  double v44 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v42 - v7;
  sub_1000170E8(&qword_10006BC48);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10004E5D0;
  int v10 = self;
  id v11 = [v10 newsdDocumentsURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v12 = [v10 newsdCachesURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v13 = objc_allocWithZone((Class)NDAssembly);
  URL._bridgeToObjectiveC()(v14);
  id v16 = v15;
  URL._bridgeToObjectiveC()(v17);
  unint64_t v19 = v18;
  [v13 initWithDocumentDirectoryFileURL:v16 cacheDirectoryFileURL:v18];

  uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  v20(v6, v2);
  v20(v8, v2);
  uint64_t v21 = type metadata accessor for BridgedAssembly();
  swift_allocObject();
  uint64_t v22 = BridgedAssembly.init(_:)();
  *(void *)(v9 + 56) = v21;
  *(void *)(v9 + 64) = &protocol witness table for BridgedAssembly;
  *(void *)(v9 + 32) = v22;
  id v23 = [v10 newsdCachesURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v24 = type metadata accessor for NotificationsAssembly();
  uint64_t v25 = swift_allocObject();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v25 + OBJC_IVAR____TtC5newsd21NotificationsAssembly_cacheDirectoryFileURL, v8, v2);
  *(void *)(v9 + 96) = v24;
  *(void *)(v9 + 104) = sub_100046C5C(&qword_10006BC50, (void (*)(uint64_t))type metadata accessor for NotificationsAssembly);
  *(void *)(v9 + 72) = v25;
  uint64_t v26 = type metadata accessor for PrivateDataAssembly();
  uint64_t v27 = swift_allocObject();
  *(void *)(v9 + 136) = v26;
  *(void *)(v9 + 144) = sub_100046C5C(&qword_10006BC58, (void (*)(uint64_t))type metadata accessor for PrivateDataAssembly);
  *(void *)(v9 + 112) = v27;
  uint64_t v28 = type metadata accessor for LiveActivityAssembly();
  uint64_t v29 = swift_allocObject();
  unint64_t v31 = *(void *)(v9 + 16);
  unint64_t v30 = *(void *)(v9 + 24);
  if (v31 >= v30 >> 1) {
    uint64_t v9 = (uint64_t)sub_100046CA4((char *)(v30 > 1), v31 + 1, 1, (char *)v9);
  }
  uint64_t v46 = v28;
  uint64_t v47 = sub_100046C5C(&qword_10006BC60, (void (*)(uint64_t))type metadata accessor for LiveActivityAssembly);
  *(void *)&long long v45 = v29;
  *(void *)(v9 + 16) = v31 + 1;
  sub_1000195FC(&v45, v9 + 40 * v31 + 32);
  double v32 = (objc_class *)type metadata accessor for Assembly();
  id v33 = [objc_allocWithZone(v32) init];
  unint64_t v35 = *(void *)(v9 + 16);
  unint64_t v34 = *(void *)(v9 + 24);
  if (v35 >= v34 >> 1) {
    uint64_t v9 = (uint64_t)sub_100046CA4((char *)(v34 > 1), v35 + 1, 1, (char *)v9);
  }
  uint64_t v46 = (uint64_t)v32;
  uint64_t v47 = sub_100046C5C(&qword_10006BC68, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)&long long v45 = v33;
  *(void *)(v9 + 16) = v35 + 1;
  sub_1000195FC(&v45, v9 + 40 * v35 + 32);
  sub_1000170E8(&qword_10006BC70);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_10004E960;
  uint64_t v37 = (objc_class *)type metadata accessor for Assembly();
  id v38 = [objc_allocWithZone(v37) init];
  *(void *)(v36 + 56) = v37;
  *(void *)(v36 + 64) = sub_100046C5C(&qword_10006BC78, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v36 + 32) = v38;
  uint64_t v39 = (objc_class *)type metadata accessor for Assembly();
  id v40 = [objc_allocWithZone(v39) init];
  *(void *)(v36 + 96) = v39;
  *(void *)(v36 + 104) = sub_100046C5C(&qword_10006BC80, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v36 + 72) = v40;
  type metadata accessor for SingletonPool();
  swift_allocObject();
  SingletonPool.init()();
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v44, enum case for Container.Environment.normal(_:), v43);
  type metadata accessor for Container();
  swift_allocObject();
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:)();
}

uint64_t type metadata accessor for NewsdContainer()
{
  return self;
}

uint64_t sub_100046C5C(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_100046CA4(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000170E8(&qword_10006BC48);
      int v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      id v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int v10 = (char *)&_swiftEmptyArrayStorage;
      id v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100046ED8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100046DC8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000170E8(&qword_10006BAF8);
      int v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      _OWORD v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int v10 = _swiftEmptyArrayStorage;
      id v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100046FE8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100046ED8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_1000170E8(&qword_10006BC88);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_100046FE8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_1000470D4()
{
  id v0 = [objc_allocWithZone((Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores) init];
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = [objc_allocWithZone((Class)NTPBFeedItem) init];
    if (v2)
    {
      uint64_t v3 = v2;
      NSString v4 = String._bridgeToObjectiveC()();
      [v3 setArticleID:v4];

      id v5 = objc_allocWithZone((Class)NTPBNotificationItem);
      NSString v6 = String._bridgeToObjectiveC()();
      NSString v7 = String._bridgeToObjectiveC()();
      NSString v8 = String._bridgeToObjectiveC()();
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      LODWORD(v12) = 0;
      LODWORD(v11) = 7;
      id v10 = [v5 initWithIdentifier:v6 canonicalID:v7 clusterID:v8 notabilityScores:v1 suppressIfFollowingTagIDs:isa targetMinNewsVersion:0 targetDeviceTypes:v11 feedItem:v3 source:v12 algoID:0];

      qword_10006D960 = (uint64_t)v10;
      qword_10006D968 = 0;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void *initializeBufferWithCopyOfBuffer for ScoredNotificationItem(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for ScoredNotificationItem(id *a1)
{
}

uint64_t assignWithCopy for ScoredNotificationItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for ScoredNotificationItem(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ScoredNotificationItem(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScoredNotificationItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScoredNotificationItem()
{
  return &type metadata for ScoredNotificationItem;
}

void sub_100047394(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007028((void *)&_mh_execute_header, a2, a3, "TodayFeedService failed to download feed contents, error=%{public}@", a5, a6, a7, a8, 2u);
}

void sub_100047404(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "TodayFeedService will reject donated config due to low-power mode", v1, 2u);
}

void sub_100047448(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "TodayFeedService will reject donated config due to low-data mode", v1, 2u);
}

void sub_10004748C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000474F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100047568()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchQueue", v6, 2u);
}

void sub_100047630()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);
}

void sub_1000476F8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"client", v6, 2u);
}

void sub_1000477C0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

void sub_100047884()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

void sub_100047948()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"parameters", v6, 2u);
}

void sub_100047A0C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"syncCompletion", v6, 2u);
}

void sub_100047AD0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);
}

void sub_100047B94()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_100047C58()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElements", v6, 2u);
}

void sub_100047D1C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_100047DE0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_1000082AC();
  sub_10000829C();
  sub_10000826C();
  sub_100008280((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElement", v6, 2u);
}

void sub_100047EA4()
{
  id v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Invalid parameter not satisfying %s", "service");
  *(_DWORD *)buf = 136315906;
  int v2 = "-[NDAnalyticsServiceListenerDelegate initWithService:]";
  __int16 v3 = 2080;
  int v4 = "NDAnalyticsServiceListenerDelegate.m";
  __int16 v5 = 1024;
  int v6 = 29;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100047F90(uint64_t a1, void *a2)
{
  __int16 v3 = *(void **)(a1 + 32);
  int v4 = a2;
  __int16 v5 = [v3 pendingMessages];
  id v6 = [v5 count];
  __int16 v7 = [*(id *)(a1 + 32) connectionDescription];
  int v8 = 134218242;
  id v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "consumer proxy lost connection, will drop %lu messages, connection=%{public}@", (uint8_t *)&v8, 0x16u);
}

void sub_10004806C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000480D8()
{
  sub_100009E68(__stack_chk_guard);
  sub_100009E5C();
  sub_100007028((void *)&_mh_execute_header, v0, v1, "failed to save last known requests to store with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100048140(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000481AC()
{
  sub_100009E68(__stack_chk_guard);
  sub_100009E5C();
  sub_100007028((void *)&_mh_execute_header, v0, v1, "failed to save last known limits to store with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100048214()
{
  id v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[NDContentDownloadService initWithContentContext:ANFHelper:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NDContentDownloadService.m";
  __int16 v5 = 1024;
  int v6 = 69;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100048300()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"replacing XPC connection while a consumer is already active"];
  sub_10000E2E0();
  sub_10000E2C4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000483CC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"registering a consumer without an XPC connection"];
  sub_10000E2E0();
  sub_10000E2A0();
  sub_10000E2C4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10004847C()
{
  id v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[NDURLResolutionService _determineWhetherResolutionIsAllowedWithCompletion:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NDURLResolutionService.m";
  __int16 v5 = 1024;
  int v6 = 110;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100048568()
{
  id v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Invalid parameter not satisfying %s", "URLResolutionService != nil");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[NDURLResolutionListenerDelegate initWithURLResolutionService:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NDURLResolutionListenerDelegate.m";
  __int16 v5 = 1024;
  int v6 = 31;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100048654(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to register handler for notification pool refresh task", v1, 2u);
}

void sub_100048698(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to submit notification pool refresh task, error=%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100048710(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to update notification pool refresh task, error=%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100048788(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 48);
  sub_100014828();
  sub_1000147E0((void *)&_mh_execute_header, v1, v2, "content archive store failed to create container for contentID=%{public}@, error=%{public}@", (void)v3, DWORD2(v3));
}

void sub_1000487FC()
{
  sub_100014800(__stack_chk_guard);
  sub_1000147AC();
  sub_1000147C4((void *)&_mh_execute_header, v0, v1, "content archive store failed to encode archive for contentID=%{public}@, error=%{public}@", v2, v3, v4, v5, v6);
}

void sub_100048864()
{
  sub_100014800(__stack_chk_guard);
  sub_1000147AC();
  sub_1000147C4((void *)&_mh_execute_header, v0, v1, "content archive store failed to add archive for contentID=%{public}@, error=%{public}@", v2, v3, v4, v5, v6);
}

void sub_1000488CC()
{
  sub_100014800(__stack_chk_guard);
  sub_1000147AC();
  sub_1000147C4((void *)&_mh_execute_header, v0, v1, "content archive store failed to encode manifest for contentID=%{public}@, error=%{public}@", v2, v3, v4, v5, v6);
}

void sub_100048934()
{
  sub_100014800(__stack_chk_guard);
  sub_1000147AC();
  sub_1000147C4((void *)&_mh_execute_header, v0, v1, "content archive store failed to add manifest for contentID=%{public}@, error=%{public}@", v2, v3, v4, v5, v6);
}

void sub_10004899C()
{
  sub_100014800(__stack_chk_guard);
  sub_10001480C();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "content archive store failed to add blob for name=%{public}@, contentID=%{public}@, error=%{public}@", v2, 0x20u);
}

void sub_100048A18()
{
  sub_100014800(__stack_chk_guard);
  sub_1000147AC();
  sub_1000147C4((void *)&_mh_execute_header, v0, v1, "content archive store failed to write completion token for contentID=%{public}@, error=%{public}@", v2, v3, v4, v5, v6);
}

void sub_100048A80(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_100014828();
  sub_1000147E0((void *)&_mh_execute_header, v1, v2, "content archive store failed to decode manifest for contentID=%{public}@, error=%{public}@", (void)v3, DWORD2(v3));
}

void sub_100048AF0()
{
  sub_10001480C();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "content archive store failed to generate blob bookmark for name=%{public}@, contentID=%{public}@, error=%{public}@", v2, 0x20u);
}

void sub_100048B70(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_100014828();
  sub_1000147E0((void *)&_mh_execute_header, v1, v2, "content archive store failed to remove completion token while pruning container, contentID=%{public}@, error=%{public}@", (void)v3, DWORD2(v3));
}

void sub_100048BE0()
{
  id v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Invalid parameter not satisfying %s", "fetchQueue");
  *(_DWORD *)buf = 136315906;
  os_log_t v2 = "-[NDTodayServiceListenerDelegate initWithContentContext:fetchQueue:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NDTodayServiceListenerDelegate.m";
  __int16 v5 = 1024;
  sub_10000826C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100048CC0()
{
  id v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
  *(_DWORD *)buf = 136315906;
  os_log_t v2 = "-[NDTodayServiceListenerDelegate initWithContentContext:fetchQueue:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NDTodayServiceListenerDelegate.m";
  __int16 v5 = 1024;
  sub_10000826C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t DateComponents.hour.getter()
{
  return DateComponents.hour.getter();
}

uint64_t DateComponents.minute.getter()
{
  return DateComponents.minute.getter();
}

uint64_t DateComponents.second.getter()
{
  return DateComponents.second.getter();
}

uint64_t DateComponents.weekday.getter()
{
  return DateComponents.weekday.getter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t Date.addSeconds(_:calendar:)()
{
  return Date.addSeconds(_:calendar:)();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date.- infix(_:_:)()
{
  return static Date.- infix(_:_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Calendar.startOfDay(for:)()
{
  return Calendar.startOfDay(for:)();
}

uint64_t Calendar.dateComponents(in:from:)()
{
  return Calendar.dateComponents(in:from:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t TimeZone.secondsFromGMT(for:)()
{
  return TimeZone.secondsFromGMT(for:)();
}

uint64_t static TimeZone.current.getter()
{
  return static TimeZone.current.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t static MachServices.LiveActivities.getter()
{
  return static MachServices.LiveActivities.getter();
}

uint64_t LiveActivityScheduleRequest.scheduledActivity.getter()
{
  return LiveActivityScheduleRequest.scheduledActivity.getter();
}

uint64_t ProxyScoringServiceConnection.withScoringService(_:)()
{
  return ProxyScoringServiceConnection.withScoringService(_:)();
}

uint64_t static ProxyScoringServiceConnection.shared.getter()
{
  return static ProxyScoringServiceConnection.shared.getter();
}

uint64_t type metadata accessor for ProxyScoringServiceConnection()
{
  return type metadata accessor for ProxyScoringServiceConnection();
}

uint64_t Definition.inScope(_:)()
{
  return Definition.inScope(_:)();
}

uint64_t MachService.serviceInterface.getter()
{
  return MachService.serviceInterface.getter();
}

uint64_t type metadata accessor for MachService()
{
  return type metadata accessor for MachService();
}

uint64_t static Capabilities.isInternalBuild()()
{
  return static Capabilities.isInternalBuild()();
}

uint64_t type metadata accessor for Capabilities()
{
  return type metadata accessor for Capabilities();
}

uint64_t dispatch thunk of ResolverType.bridgedResolver.getter()
{
  return dispatch thunk of ResolverType.bridgedResolver.getter();
}

uint64_t dispatch thunk of ResolverType.resolve<A>(_:)()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

NSXPCInterface __swiftcall XPCInterface.asNSXPCInterface()()
{
  return (NSXPCInterface)XPCInterface.asNSXPCInterface()();
}

uint64_t type metadata accessor for XPCInterface()
{
  return type metadata accessor for XPCInterface();
}

uint64_t SingletonPool.init()()
{
  return SingletonPool.init()();
}

uint64_t type metadata accessor for SingletonPool()
{
  return type metadata accessor for SingletonPool();
}

uint64_t ProxyContainer.public.getter()
{
  return ProxyContainer.public.getter();
}

uint64_t ProxyContainer.private.getter()
{
  return ProxyContainer.private.getter();
}

uint64_t type metadata accessor for BridgedAssembly()
{
  return type metadata accessor for BridgedAssembly();
}

uint64_t BridgedAssembly.init(_:)()
{
  return BridgedAssembly.init(_:)();
}

uint64_t RegistrationContainer.lazy(block:)()
{
  return RegistrationContainer.lazy(block:)();
}

uint64_t RegistrationContainer.register<A>(_:name:factory:)()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t type metadata accessor for Scope()
{
  return type metadata accessor for Scope();
}

uint64_t Accessor.init(_:)()
{
  return Accessor.init(_:)();
}

uint64_t type metadata accessor for Container.Environment()
{
  return type metadata accessor for Container.Environment();
}

uint64_t Container.init(bundleAssemblies:assemblies:singletonPool:environment:)()
{
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:)();
}

uint64_t Container.resolver.getter()
{
  return Container.resolver.getter();
}

uint64_t type metadata accessor for Container()
{
  return type metadata accessor for Container();
}

uint64_t type metadata accessor for Assembly()
{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

uint64_t ScheduledLiveActivity.activityID.getter()
{
  return ScheduledLiveActivity.activityID.getter();
}

uint64_t ScheduledLiveActivity.retryCount.getter()
{
  return ScheduledLiveActivity.retryCount.getter();
}

uint64_t ScheduledLiveActivity.scheduleDate.getter()
{
  return ScheduledLiveActivity.scheduleDate.getter();
}

uint64_t ScheduledLiveActivity.retryCountMax.getter()
{
  return ScheduledLiveActivity.retryCountMax.getter();
}

uint64_t ScheduledLiveActivity.retryInterval.getter()
{
  return ScheduledLiveActivity.retryInterval.getter();
}

uint64_t ScheduledLiveActivity.scheduleDelay.getter()
{
  return ScheduledLiveActivity.scheduleDelay.getter();
}

uint64_t ScheduledLiveActivity.scheduleRequest.getter()
{
  return ScheduledLiveActivity.scheduleRequest.getter();
}

uint64_t ScheduledLiveActivity.backgroundTaskID.getter()
{
  return ScheduledLiveActivity.backgroundTaskID.getter();
}

uint64_t ScheduledLiveActivity.randomInitialDelay.getter()
{
  return ScheduledLiveActivity.randomInitialDelay.getter();
}

uint64_t ScheduledLiveActivity.scheduleTimeWindow.getter()
{
  return ScheduledLiveActivity.scheduleTimeWindow.getter();
}

uint64_t ScheduledLiveActivity.originalScheduleDate.getter()
{
  return ScheduledLiveActivity.originalScheduleDate.getter();
}

uint64_t ScheduledLiveActivity.retryScheduleTimeWindow.getter()
{
  return ScheduledLiveActivity.retryScheduleTimeWindow.getter();
}

uint64_t ScheduledLiveActivity.expectedDownloadByteSize.getter()
{
  return ScheduledLiveActivity.expectedDownloadByteSize.getter();
}

uint64_t ScheduledLiveActivity.with(backgroundTaskIDSuffix:scheduleDate:originalScheduleDate:retryCount:scheduleDelay:scheduleTimeWindow:)()
{
  return ScheduledLiveActivity.with(backgroundTaskIDSuffix:scheduleDate:originalScheduleDate:retryCount:scheduleDelay:scheduleTimeWindow:)();
}

uint64_t type metadata accessor for ScheduledLiveActivity()
{
  return type metadata accessor for ScheduledLiveActivity();
}

uint64_t type metadata accessor for LiveActivitySubscriptionError()
{
  return type metadata accessor for LiveActivitySubscriptionError();
}

uint64_t type metadata accessor for NewsLiveActivityChangeSource()
{
  return type metadata accessor for NewsLiveActivityChangeSource();
}

uint64_t type metadata accessor for NewsLiveActivitySubscriptionState()
{
  return type metadata accessor for NewsLiveActivitySubscriptionState();
}

uint64_t NewsLiveActivity.subscriptionState.getter()
{
  return NewsLiveActivity.subscriptionState.getter();
}

uint64_t NewsLiveActivity.id.getter()
{
  return NewsLiveActivity.id.getter();
}

uint64_t NewsLiveActivity.with(subscriptionState:lastUpdatedContentDate:subscriptionSource:dismissalSource:)()
{
  return NewsLiveActivity.with(subscriptionState:lastUpdatedContentDate:subscriptionSource:dismissalSource:)();
}

uint64_t type metadata accessor for NewsLiveActivity()
{
  return type metadata accessor for NewsLiveActivity();
}

uint64_t type metadata accessor for NewsroomActivityID()
{
  return type metadata accessor for NewsroomActivityID();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t static Logger.liveActivityDaemon.getter()
{
  return static Logger.liveActivityDaemon.getter();
}

uint64_t static Logger.notifications.getter()
{
  return static Logger.notifications.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t static PrivateDataContext.readWriteCloud(container:apsMachServiceName:)()
{
  return static PrivateDataContext.readWriteCloud(container:apsMachServiceName:)();
}

uint64_t static PrivateDataContext.readWriteLocal.getter()
{
  return static PrivateDataContext.readWriteLocal.getter();
}

uint64_t type metadata accessor for PrivateDataContext()
{
  return type metadata accessor for PrivateDataContext();
}

uint64_t NotificationHistoryItem.notifiedAt.getter()
{
  return NotificationHistoryItem.notifiedAt.getter();
}

uint64_t NotificationHistoryItem.source.getter()
{
  return NotificationHistoryItem.source.getter();
}

uint64_t NotificationHistoryItem.channelID.getter()
{
  return NotificationHistoryItem.channelID.getter();
}

uint64_t NotificationHistoryItem.clusterID.getter()
{
  return NotificationHistoryItem.clusterID.getter();
}

uint64_t type metadata accessor for NotificationHistoryItem()
{
  return type metadata accessor for NotificationHistoryItem();
}

uint64_t NotificationHistoryItem.init(_:notifiedAt:)()
{
  return NotificationHistoryItem.init(_:notifiedAt:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Double._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Double._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t static CKContainer.defaultPrivateSecure.getter()
{
  return static CKContainer.defaultPrivateSecure.getter();
}

uint64_t NSFileHandle.read(upToCount:)()
{
  return NSFileHandle.read(upToCount:)();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t NSArray.init(arrayLiteral:)()
{
  return NSArray.init(arrayLiteral:)();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return static Hasher._hash(seed:bytes:count:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t FCBundle()
{
  return _FCBundle();
}

uint64_t FCCurrentQoS()
{
  return _FCCurrentQoS();
}

uint64_t FCDispatchGroupIsEmpty()
{
  return _FCDispatchGroupIsEmpty();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return _FCDispatchQueueForQualityOfService();
}

uint64_t FCDynamicCast()
{
  return _FCDynamicCast();
}

uint64_t FCGenerateOperationID()
{
  return _FCGenerateOperationID();
}

uint64_t FCNotificationSourceFromString()
{
  return _FCNotificationSourceFromString();
}

uint64_t FCPerformBlockOnMainThread()
{
  return _FCPerformBlockOnMainThread();
}

uint64_t FCURLForTodayDropbox()
{
  return _FCURLForTodayDropbox();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return _IOPSDrawingUnlimitedPower();
}

uint64_t NDDownloadServiceXPCInterface()
{
  return _NDDownloadServiceXPCInterface();
}

uint64_t NDTodayFeedConfigDecodingServiceXPCConnection()
{
  return _NDTodayFeedConfigDecodingServiceXPCConnection();
}

uint64_t NDTodayFeedServiceXPCInterface()
{
  return _NDTodayFeedServiceXPCInterface();
}

uint64_t NTXPCSuitableError()
{
  return _NTXPCSuitableError();
}

uint64_t NewsCoreUserDefaults()
{
  return _NewsCoreUserDefaults();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
}

{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
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

void objc_exception_throw(id exception)
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t xpc_copy_event()
{
  return _xpc_copy_event();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_ANFHelper(void *a1, const char *a2, ...)
{
  return _[a1 ANFHelper];
}

id objc_msgSend_URLResolutionService(void *a1, const char *a2, ...)
{
  return _[a1 URLResolutionService];
}

id objc_msgSend_URLSessionQueue(void *a1, const char *a2, ...)
{
  return _[a1 URLSessionQueue];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__articleOperationForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_articleOperationForRequest:");
}

id objc_msgSend__audioOperationForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_audioOperationForRequest:");
}

id objc_msgSend__blobPathForName_contentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blobPathForName:contentID:");
}

id objc_msgSend__cacheLookupQueue(void *a1, const char *a2, ...)
{
  return _[a1 _cacheLookupQueue];
}

id objc_msgSend__canAdoptFeedConfig(void *a1, const char *a2, ...)
{
  return _[a1 _canAdoptFeedConfig];
}

id objc_msgSend__cancelSystemTask(void *a1, const char *a2, ...)
{
  return _[a1 _cancelSystemTask];
}

id objc_msgSend__catchUpConsumer(void *a1, const char *a2, ...)
{
  return _[a1 _catchUpConsumer];
}

id objc_msgSend__configFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configFromData:");
}

id objc_msgSend__containerPathForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_containerPathForContentID:");
}

id objc_msgSend__contentIDForConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentIDForConfig:");
}

id objc_msgSend__determineWhetherResolutionIsAllowedWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineWhetherResolutionIsAllowedWithCompletion:");
}

id objc_msgSend__downloadKeyQueue(void *a1, const char *a2, ...)
{
  return _[a1 _downloadKeyQueue];
}

id objc_msgSend__downloadQueue(void *a1, const char *a2, ...)
{
  return _[a1 _downloadQueue];
}

id objc_msgSend__enqueueBarrierMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueBarrierMessage:");
}

id objc_msgSend__enqueueMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueMessage:");
}

id objc_msgSend__filePathForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filePathForKey:");
}

id objc_msgSend__handleError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleError:");
}

id objc_msgSend__handleInterestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleInterestToken:");
}

id objc_msgSend__handleSystemTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSystemTask:");
}

id objc_msgSend__hasReachedStorageLimits(void *a1, const char *a2, ...)
{
  return _[a1 _hasReachedStorageLimits];
}

id objc_msgSend__isFatalError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isFatalError:");
}

id objc_msgSend__issueOperationForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_issueOperationForRequest:");
}

id objc_msgSend__keepAliveTokenForInstanceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keepAliveTokenForInstanceID:");
}

id objc_msgSend__latestTodayFeed(void *a1, const char *a2, ...)
{
  return _[a1 _latestTodayFeed];
}

id objc_msgSend__manifestPathForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_manifestPathForContentID:");
}

id objc_msgSend__mostRecentContentID(void *a1, const char *a2, ...)
{
  return _[a1 _mostRecentContentID];
}

id objc_msgSend__newUniqueArchivePathForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newUniqueArchivePathForContentID:");
}

id objc_msgSend__operationFlagsForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_operationFlagsForRequest:");
}

id objc_msgSend__prepareRootContainerAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareRootContainerAtPath:");
}

id objc_msgSend__prepareToHandleSystemTask(void *a1, const char *a2, ...)
{
  return _[a1 _prepareToHandleSystemTask];
}

id objc_msgSend__prewarmFromLastKnownRequests(void *a1, const char *a2, ...)
{
  return _[a1 _prewarmFromLastKnownRequests];
}

id objc_msgSend__pruneArchivesFromContainer_forContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pruneArchivesFromContainer:forContentID:");
}

id objc_msgSend__pruneUnneededInterestTokens(void *a1, const char *a2, ...)
{
  return _[a1 _pruneUnneededInterestTokens];
}

id objc_msgSend__publishDateFromContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_publishDateFromContentID:");
}

id objc_msgSend__puzzleOperationForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_puzzleOperationForRequest:");
}

id objc_msgSend__recordWhetherTasksAreUnfinished(void *a1, const char *a2, ...)
{
  return _[a1 _recordWhetherTasksAreUnfinished];
}

id objc_msgSend__revisitDownloadQueue(void *a1, const char *a2, ...)
{
  return _[a1 _revisitDownloadQueue];
}

id objc_msgSend__sendNextMessage(void *a1, const char *a2, ...)
{
  return _[a1 _sendNextMessage];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__storageUsedByDownloads(void *a1, const char *a2, ...)
{
  return _[a1 _storageUsedByDownloads];
}

id objc_msgSend__todayFeedForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_todayFeedForContentID:");
}

id objc_msgSend__tokenPathForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tokenPathForContentID:");
}

id objc_msgSend__unfinishedRequests(void *a1, const char *a2, ...)
{
  return _[a1 _unfinishedRequests];
}

id objc_msgSend__updateProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateProgress:");
}

id objc_msgSend_accessQueue(void *a1, const char *a2, ...)
{
  return _[a1 accessQueue];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activeDownloadManifest(void *a1, const char *a2, ...)
{
  return _[a1 activeDownloadManifest];
}

id objc_msgSend_activeDownloadProgress(void *a1, const char *a2, ...)
{
  return _[a1 activeDownloadProgress];
}

id objc_msgSend_activeDownloadRequest(void *a1, const char *a2, ...)
{
  return _[a1 activeDownloadRequest];
}

id objc_msgSend_addArchive_forContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArchive:forContentID:");
}

id objc_msgSend_addBlob_name_contentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBlob:name:contentID:");
}

id objc_msgSend_addManifest_forContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addManifest:forContentID:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_aggregateArchiveForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateArchiveForContentID:");
}

id objc_msgSend_allCompleteContentIDs(void *a1, const char *a2, ...)
{
  return _[a1 allCompleteContentIDs];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_archiveHandler(void *a1, const char *a2, ...)
{
  return _[a1 archiveHandler];
}

id objc_msgSend_archiveQueue(void *a1, const char *a2, ...)
{
  return _[a1 archiveQueue];
}

id objc_msgSend_archiveStore(void *a1, const char *a2, ...)
{
  return _[a1 archiveStore];
}

id objc_msgSend_archiveWithChildArchives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archiveWithChildArchives:");
}

id objc_msgSend_archiveWithPersistedArchivePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archiveWithPersistedArchivePath:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_archivesForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivesForContentID:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_articleID(void *a1, const char *a2, ...)
{
  return _[a1 articleID];
}

id objc_msgSend_assetHandleForURL_lifetimeHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetHandleForURL:lifetimeHint:");
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return _[a1 assetManager];
}

id objc_msgSend_associateChildOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateChildOperation:");
}

id objc_msgSend_blobWithName_contentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blobWithName:contentID:");
}

id objc_msgSend_bookmarkDataWithOptions_includingResourceValuesForKeys_relativeToURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_cacheCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 cacheCoordinator];
}

id objc_msgSend_cacheDirectoryFileURL(void *a1, const char *a2, ...)
{
  return _[a1 cacheDirectoryFileURL];
}

id objc_msgSend_cachedOnly(void *a1, const char *a2, ...)
{
  return _[a1 cachedOnly];
}

id objc_msgSend_cancelTaskRequestWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTaskRequestWithIdentifier:error:");
}

id objc_msgSend_configManager(void *a1, const char *a2, ...)
{
  return _[a1 configManager];
}

id objc_msgSend_configurationManager(void *a1, const char *a2, ...)
{
  return _[a1 configurationManager];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionDescription(void *a1, const char *a2, ...)
{
  return _[a1 connectionDescription];
}

id objc_msgSend_consumer(void *a1, const char *a2, ...)
{
  return _[a1 consumer];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentArchiveStore(void *a1, const char *a2, ...)
{
  return _[a1 contentArchiveStore];
}

id objc_msgSend_contentContext(void *a1, const char *a2, ...)
{
  return _[a1 contentContext];
}

id objc_msgSend_contentDirectory(void *a1, const char *a2, ...)
{
  return _[a1 contentDirectory];
}

id objc_msgSend_contentHostDirectoryURL(void *a1, const char *a2, ...)
{
  return _[a1 contentHostDirectoryURL];
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return _[a1 contentID];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_contentURL(void *a1, const char *a2, ...)
{
  return _[a1 contentURL];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithAssetsOnly(void *a1, const char *a2, ...)
{
  return _[a1 copyWithAssetsOnly];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentConsumer(void *a1, const char *a2, ...)
{
  return _[a1 currentConsumer];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_decodeTodayFeedConfigData_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeTodayFeedConfigData:completion:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfiguration];
}

id objc_msgSend_defaultLimits(void *a1, const char *a2, ...)
{
  return _[a1 defaultLimits];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_deregisterTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterTaskWithIdentifier:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_didCompleteContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCompleteContentID:");
}

id objc_msgSend_didInsertKeyIntoCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didInsertKeyIntoCache:");
}

id objc_msgSend_documentDirectoryFileURL(void *a1, const char *a2, ...)
{
  return _[a1 documentDirectoryFileURL];
}

id objc_msgSend_downloadFinishedForRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadFinishedForRequest:error:");
}

id objc_msgSend_downloadKeyedOperationQueue(void *a1, const char *a2, ...)
{
  return _[a1 downloadKeyedOperationQueue];
}

id objc_msgSend_downloadLimits(void *a1, const char *a2, ...)
{
  return _[a1 downloadLimits];
}

id objc_msgSend_downloadProgressedForRequest_contentArchive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadProgressedForRequest:contentArchive:");
}

id objc_msgSend_downloadProgressedForRequest_progress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadProgressedForRequest:progress:");
}

id objc_msgSend_downloadRequests(void *a1, const char *a2, ...)
{
  return _[a1 downloadRequests];
}

id objc_msgSend_downloadService(void *a1, const char *a2, ...)
{
  return _[a1 downloadService];
}

id objc_msgSend_downloadedContentIDs(void *a1, const char *a2, ...)
{
  return _[a1 downloadedContentIDs];
}

id objc_msgSend_empty(void *a1, const char *a2, ...)
{
  return _[a1 empty];
}

id objc_msgSend_enableFlushingWithFlushingThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableFlushingWithFlushingThreshold:");
}

id objc_msgSend_enableFlushingWithPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableFlushingWithPolicy:");
}

id objc_msgSend_endpointConnection(void *a1, const char *a2, ...)
{
  return _[a1 endpointConnection];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorsByContentID(void *a1, const char *a2, ...)
{
  return _[a1 errorsByContentID];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_fc_NewsArticleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_NewsArticleID");
}

id objc_msgSend_fc_NewsURLForArticleID_hardPaywall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_NewsURLForArticleID:hardPaywall:");
}

id objc_msgSend_fc_addAsyncOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_addAsyncOperationWithBlock:");
}

id objc_msgSend_fc_addMainThreadOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_addMainThreadOperationWithBlock:");
}

id objc_msgSend_fc_arrayByTransformingWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_arrayByTransformingWithBlock:");
}

id objc_msgSend_fc_arrayOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_arrayOfObjectsPassingTest:");
}

id objc_msgSend_fc_emptyBloomFilterInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_emptyBloomFilterInfo");
}

id objc_msgSend_fc_enumerateSideBySideWithArray_reverse_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_enumerateSideBySideWithArray:reverse:block:");
}

id objc_msgSend_fc_fileSystemFreeSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_fileSystemFreeSize");
}

id objc_msgSend_fc_isCancellationError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_isCancellationError");
}

id objc_msgSend_fc_isOfflineError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_isOfflineError");
}

id objc_msgSend_fc_isRecoverableNetworkError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_isRecoverableNetworkError");
}

id objc_msgSend_fc_millisecondTimeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_millisecondTimeIntervalSince1970");
}

id objc_msgSend_fc_millisecondTimeIntervalUntilNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_millisecondTimeIntervalUntilNow");
}

id objc_msgSend_fc_popFirstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_popFirstObject");
}

id objc_msgSend_fc_removeObjectsForKeysNotInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_removeObjectsForKeysNotInSet:");
}

id objc_msgSend_fc_safelyAddObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_safelyAddObject:");
}

id objc_msgSend_fc_set_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_set:");
}

id objc_msgSend_fc_sizeOfItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_sizeOfItemAtURL:error:");
}

id objc_msgSend_fc_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_unsignedLongLongValue");
}

id objc_msgSend_feedConfig(void *a1, const char *a2, ...)
{
  return _[a1 feedConfig];
}

id objc_msgSend_fetchCompletionHandler(void *a1, const char *a2, ...)
{
  return _[a1 fetchCompletionHandler];
}

id objc_msgSend_fetchCompletionQueue(void *a1, const char *a2, ...)
{
  return _[a1 fetchCompletionQueue];
}

id objc_msgSend_fetchLatestResultsWithOperationInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLatestResultsWithOperationInfo:completion:");
}

id objc_msgSend_fetchModuleDescriptorsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchModuleDescriptorsWithCompletion:");
}

id objc_msgSend_fetchQueue(void *a1, const char *a2, ...)
{
  return _[a1 fetchQueue];
}

id objc_msgSend_fetchWebURLBloomFilterInfoWithQualityOfService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchWebURLBloomFilterInfoWithQualityOfService:completion:");
}

id objc_msgSend_fetchedObject(void *a1, const char *a2, ...)
{
  return _[a1 fetchedObject];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_finishedPerformingOperationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedPerformingOperationWithError:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flushMessagesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flushMessagesWithCompletion:");
}

id objc_msgSend_handleLaunchEventForBackgroundSessionWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLaunchEventForBackgroundSessionWithIdentifier:completion:");
}

id objc_msgSend_holdTokenForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "holdTokenForKey:");
}

id objc_msgSend_holdTokenForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "holdTokenForKeys:");
}

id objc_msgSend_inScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inScope:");
}

id objc_msgSend_initForLoggingOnly(void *a1, const char *a2, ...)
{
  return _[a1 initForLoggingOnly];
}

id objc_msgSend_initWithAppConfigurationManager_telemetryUploader_storeDirectoryFileURL_URLSessionQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:");
}

id objc_msgSend_initWithAssetHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetHandles:");
}

id objc_msgSend_initWithCacheDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCacheDirectory:");
}

id objc_msgSend_initWithClient_contentContext_fetchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:contentContext:fetchQueue:");
}

id objc_msgSend_initWithConfigData_publishDate_contentManifest_contentArchive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigData:publishDate:contentManifest:contentArchive:");
}

id objc_msgSend_initWithConfiguration_configurationManager_contentHostDirectory_networkBehaviorMonitor_networkReachability_desiredHeadlineFieldOptions_feedUsage_assetKeyManagerDelegate_appActivityMonitor_backgroundTaskable_pptContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:");
}

id objc_msgSend_initWithConfigurationManager_cachesDirectoryURL_networkReachability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurationManager:cachesDirectoryURL:networkReachability:");
}

id objc_msgSend_initWithConsumer_connection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConsumer:connection:");
}

id objc_msgSend_initWithContentContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentContext:");
}

id objc_msgSend_initWithContentContext_ANFHelper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentContext:ANFHelper:");
}

id objc_msgSend_initWithContentContext_feedPersonalizerFactory_todayBannerValidator_processVariant_accessQueue_fetchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentContext:feedPersonalizerFactory:todayBannerValidator:processVariant:accessQueue:fetchQueue:");
}

id objc_msgSend_initWithContentContext_fetchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentContext:fetchQueue:");
}

id objc_msgSend_initWithContext_ANFHelper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:ANFHelper:");
}

id objc_msgSend_initWithContext_ANFHelper_articleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:ANFHelper:articleID:");
}

id objc_msgSend_initWithContext_ANFHelper_issueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:ANFHelper:issueID:");
}

id objc_msgSend_initWithContext_articleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:articleID:");
}

id objc_msgSend_initWithContext_articleIDs_ignoreCacheForArticleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:articleIDs:ignoreCacheForArticleIDs:");
}

id objc_msgSend_initWithContext_contentVariantProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:contentVariantProvider:");
}

id objc_msgSend_initWithContext_puzzleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:puzzleID:");
}

id objc_msgSend_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_appShortVersionString_buildNumberString_networkBehaviorMonitor_appActivityMonitor_applicationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:appShortVersionString:buildNumberString:networkBehaviorMonitor:appActivityMonitor:applicationState:");
}

id objc_msgSend_initWithDelegate_maxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:maxConcurrentOperationCount:");
}

id objc_msgSend_initWithFeedConfig_context_ANFHelper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeedConfig:context:ANFHelper:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithLowWaterMark_highWaterMark_alwaysFlushKeysWithZeroInterest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLowWaterMark:highWaterMark:alwaysFlushKeysWithZeroInterest:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMemoryCapacity_diskCapacity_diskPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMemoryCapacity:diskCapacity:diskPath:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithNotificationPool_configManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationPool:configManager:");
}

id objc_msgSend_initWithParentDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParentDirectory:");
}

id objc_msgSend_initWithParentDirectory_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParentDirectory:name:");
}

id objc_msgSend_initWithProcessVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProcessVariant:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServices:");
}

id objc_msgSend_initWithURLResolutionService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURLResolutionService:");
}

id objc_msgSend_interestTokenForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interestTokenForContentID:");
}

id objc_msgSend_interestTokenForContentManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interestTokenForContentManifest:");
}

id objc_msgSend_interestTokens(void *a1, const char *a2, ...)
{
  return _[a1 interestTokens];
}

id objc_msgSend_interestTokensByContentID(void *a1, const char *a2, ...)
{
  return _[a1 interestTokensByContentID];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return _[a1 interval];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isCloudKitReachable(void *a1, const char *a2, ...)
{
  return _[a1 isCloudKitReachable];
}

id objc_msgSend_isContentIDComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContentIDComplete:");
}

id objc_msgSend_isContentStoreFrontSupported(void *a1, const char *a2, ...)
{
  return _[a1 isContentStoreFrontSupported];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isLowDataModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowDataModeEnabled];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isNetworkOnlyReachableViaCellular(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkOnlyReachableViaCellular];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkReachable];
}

id objc_msgSend_isNetworkUsageExpensive(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkUsageExpensive];
}

id objc_msgSend_isNewsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isNewsAvailable];
}

id objc_msgSend_issueID(void *a1, const char *a2, ...)
{
  return _[a1 issueID];
}

id objc_msgSend_lastKnownLimits(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownLimits];
}

id objc_msgSend_lastKnownRequests(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownRequests];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadStoreFrontWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadStoreFrontWithCompletionHandler:");
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return _[a1 manifest];
}

id objc_msgSend_manifestByMergingManifest_withManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manifestByMergingManifest:withManifest:");
}

id objc_msgSend_manifestForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manifestForContentID:");
}

id objc_msgSend_maxDownloadStorage(void *a1, const char *a2, ...)
{
  return _[a1 maxDownloadStorage];
}

id objc_msgSend_minDeviceStorage(void *a1, const char *a2, ...)
{
  return _[a1 minDeviceStorage];
}

id objc_msgSend_notificationPool(void *a1, const char *a2, ...)
{
  return _[a1 notificationPool];
}

id objc_msgSend_notificationPoolAutoRefreshInterval(void *a1, const char *a2, ...)
{
  return _[a1 notificationPoolAutoRefreshInterval];
}

id objc_msgSend_notifyWhenAllOperationsAreFinishedUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyWhenAllOperationsAreFinishedUsingBlock:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_operationFactory(void *a1, const char *a2, ...)
{
  return _[a1 operationFactory];
}

id objc_msgSend_operationForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationForRequest:");
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return _[a1 operationQueue];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_parentDirectory(void *a1, const char *a2, ...)
{
  return _[a1 parentDirectory];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pendingMessages(void *a1, const char *a2, ...)
{
  return _[a1 pendingMessages];
}

id objc_msgSend_performCacheRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCacheRead:");
}

id objc_msgSend_performCacheWrite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCacheWrite:");
}

id objc_msgSend_placeholderResultsWithOperationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderResultsWithOperationInfo:");
}

id objc_msgSend_popInterest(void *a1, const char *a2, ...)
{
  return _[a1 popInterest];
}

id objc_msgSend_possiblyUnfetchedAppConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 possiblyUnfetchedAppConfiguration];
}

id objc_msgSend_prepareForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForContentID:");
}

id objc_msgSend_prewarmGroup(void *a1, const char *a2, ...)
{
  return _[a1 prewarmGroup];
}

id objc_msgSend_privateContainer(void *a1, const char *a2, ...)
{
  return _[a1 privateContainer];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_progressHandler(void *a1, const char *a2, ...)
{
  return _[a1 progressHandler];
}

id objc_msgSend_progressQueue(void *a1, const char *a2, ...)
{
  return _[a1 progressQueue];
}

id objc_msgSend_pruneArchivesForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pruneArchivesForContentID:");
}

id objc_msgSend_publicContainer(void *a1, const char *a2, ...)
{
  return _[a1 publicContainer];
}

id objc_msgSend_publishDate(void *a1, const char *a2, ...)
{
  return _[a1 publishDate];
}

id objc_msgSend_pushInterest(void *a1, const char *a2, ...)
{
  return _[a1 pushInterest];
}

id objc_msgSend_puzzleID(void *a1, const char *a2, ...)
{
  return _[a1 puzzleID];
}

id objc_msgSend_qualityOfService(void *a1, const char *a2, ...)
{
  return _[a1 qualityOfService];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_readOnlyArray(void *a1, const char *a2, ...)
{
  return _[a1 readOnlyArray];
}

id objc_msgSend_refreshIfOlderThan_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshIfOlderThan:completionHandler:");
}

id objc_msgSend_registerClass_factory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:factory:");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerProtocol_factory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerProtocol:factory:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_resolveClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveClass:");
}

id objc_msgSend_resolveProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveProtocol:");
}

id objc_msgSend_resolveWebURL_withQualityOfService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveWebURL:withQualityOfService:completion:");
}

id objc_msgSend_resultErrors(void *a1, const char *a2, ...)
{
  return _[a1 resultErrors];
}

id objc_msgSend_resultInterestTokens(void *a1, const char *a2, ...)
{
  return _[a1 resultInterestTokens];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_rootContainerPath(void *a1, const char *a2, ...)
{
  return _[a1 rootContainerPath];
}

id objc_msgSend_scheduleSendBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleSendBarrierBlock:");
}

id objc_msgSend_sendingMesssage(void *a1, const char *a2, ...)
{
  return _[a1 sendingMesssage];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _[a1 serialQueue];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceHasNewTodayResults(void *a1, const char *a2, ...)
{
  return _[a1 serviceHasNewTodayResults];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return _[a1 services];
}

id objc_msgSend_setActiveDownloadManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveDownloadManifest:");
}

id objc_msgSend_setActiveDownloadProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveDownloadProgress:");
}

id objc_msgSend_setActiveDownloadRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveDownloadRequest:");
}

id objc_msgSend_setArchiveHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArchiveHandler:");
}

id objc_msgSend_setArchiveQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArchiveQueue:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setCachedOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedOnly:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCurrentConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentConnection:");
}

id objc_msgSend_setCurrentConsumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentConsumer:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExpectedDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedDuration:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFetchCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchCompletionBlock:");
}

id objc_msgSend_setFetchCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchCompletionHandler:");
}

id objc_msgSend_setFetchCompletionQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchCompletionQueue:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setInterestTokenHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterestTokenHandler:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setKeyQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyQueue:");
}

id objc_msgSend_setLastKnownLimits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownLimits:");
}

id objc_msgSend_setLastKnownRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownRequests:");
}

id objc_msgSend_setLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLog:");
}

id objc_msgSend_setMaxConcurrentFetchCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentFetchCount:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMinDurationBetweenInstances_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinDurationBetweenInstances:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNetworkDownloadSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkDownloadSize:");
}

id objc_msgSend_setNewResultsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNewResultsHandler:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPreventsDeviceSleep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreventsDeviceSleep:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgressHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgressHandler:");
}

id objc_msgSend_setProgressQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgressQueue:");
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurpose:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setRelatedApplications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelatedApplications:");
}

id objc_msgSend_setRelativePriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelativePriority:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setScoreProfiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScoreProfiles:");
}

id objc_msgSend_setSendingMesssage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendingMesssage:");
}

id objc_msgSend_setSharedURLCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedURLCache:");
}

id objc_msgSend_setShouldFailOnMissingObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldFailOnMissingObjects:");
}

id objc_msgSend_setShouldWakeDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldWakeDevice:");
}

id objc_msgSend_setSortedItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortedItems:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return _[a1 setTaskCompleted];
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupWithInitialKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithInitialKeys:");
}

id objc_msgSend_sharedAccount(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccount];
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return _[a1 sharedNetworkReachability];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_shortOperationDescription(void *a1, const char *a2, ...)
{
  return _[a1 shortOperationDescription];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_storageSize(void *a1, const char *a2, ...)
{
  return _[a1 storageSize];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return _[a1 store];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromByteCount:countStyle:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_submitEnvelopes_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitEnvelopes:withCompletion:");
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitTaskRequest:error:");
}

id objc_msgSend_subpathsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subpathsOfDirectoryAtPath:error:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_taskRequestForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskRequestForIdentifier:");
}

id objc_msgSend_tfResolver(void *a1, const char *a2, ...)
{
  return _[a1 tfResolver];
}

id objc_msgSend_todayContext(void *a1, const char *a2, ...)
{
  return _[a1 todayContext];
}

id objc_msgSend_todayFeedManager(void *a1, const char *a2, ...)
{
  return _[a1 todayFeedManager];
}

id objc_msgSend_topStoriesArticleIDs(void *a1, const char *a2, ...)
{
  return _[a1 topStoriesArticleIDs];
}

id objc_msgSend_topStoriesPackageURLs(void *a1, const char *a2, ...)
{
  return _[a1 topStoriesPackageURLs];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_updateTaskRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTaskRequest:error:");
}

id objc_msgSend_useNotificationsV2(void *a1, const char *a2, ...)
{
  return _[a1 useNotificationsV2];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withConfiguration:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeUserDidReadHeadlineWithAnalyticsElement_atDate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUserDidReadHeadlineWithAnalyticsElement:atDate:withCompletion:");
}

id objc_msgSend_writeUserDidSeeHeadlinesWithAnalyticsElements_atDate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:");
}

id objc_msgSend_xpcMessageQueue(void *a1, const char *a2, ...)
{
  return _[a1 xpcMessageQueue];
}