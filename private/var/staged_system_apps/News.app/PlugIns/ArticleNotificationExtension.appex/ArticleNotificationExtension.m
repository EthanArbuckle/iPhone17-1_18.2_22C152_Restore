void sub_100003ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003EE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[NSThread isMainThread];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = v6;
  id v11 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  FCPerformIfNonNil();
}

void sub_100003FD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    id v5 = [*(id *)(a1 + 40) headline];
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = sub_100004454;
    v46[4] = sub_100004464;
    id v47 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = sub_100004454;
    v44[4] = sub_100004464;
    id v45 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_100004454;
    v42[4] = sub_100004464;
    id v43 = 0;
    id v6 = [v5 thumbnailHQ];
    v32 = [v6 thumbnailAssetHandle];

    v7 = [v5 sourceChannel];
    id v8 = [v7 theme];
    id v9 = [v8 bannerImageForWhiteBackground];
    v10 = [v8 bannerImageForMask];
    id v11 = [v9 assetHandle];
    v31 = v10;
    uint64_t v12 = [v10 assetHandle];
    v13 = (void *)v12;
    v28 = v9;
    v29 = v7;
    id v30 = v3;
    if (!v32 && !v11 && !v12)
    {
      id v14 = objc_alloc((Class)NSSArticleInternal);
      v15 = [v5 title];
      v16 = [v5 shortExcerpt];
      v17 = [v5 publishDate];
      v18 = [v5 sourceName];
      v19 = [v14 initWithThumbnailImage:0 title:v15 shortExcerpt:v16 publishDate:v17 publisherName:v18 publisherLogoImage:0 publisherLogoMaskImage:0];

      uint64_t v20 = *(void *)(a1 + 48);
      if (v20) {
        (*(void (**)(uint64_t, NSObject *))(v20 + 16))(v20, v19);
      }
      goto LABEL_17;
    }
    v19 = dispatch_group_create();
    if (v32) {
      id v21 = [v32 downloadIfNeededWithGroup:v19];
    }
    v22 = +[UIScreen mainScreen];
    v23 = [v22 traitCollection];
    id v24 = [v23 userInterfaceStyle];

    if (v24 == (id)2)
    {
      v25 = v11;
      if (!v11) {
        goto LABEL_16;
      }
    }
    else
    {
      v25 = v13;
      if (!v13)
      {
LABEL_16:
        v27 = FCDispatchQueueForQualityOfService();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000446C;
        block[3] = &unk_1000082B0;
        id v34 = v32;
        v39 = v46;
        id v35 = v11;
        v40 = v44;
        id v36 = v13;
        v41 = v42;
        id v37 = v5;
        id v38 = *(id *)(a1 + 48);
        dispatch_group_notify(v19, v27, block);

LABEL_17:
        _Block_object_dispose(v42, 8);

        _Block_object_dispose(v44, 8);
        _Block_object_dispose(v46, 8);

        id v3 = v30;
        goto LABEL_18;
      }
    }
    id v26 = [v25 downloadIfNeededWithGroup:v19];
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
LABEL_18:
}

void sub_100004404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 184), 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004454(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004464(uint64_t a1)
{
}

void sub_10000446C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) filePath];
  if ([v2 length])
  {
    uint64_t v3 = +[UIImage imageWithContentsOfFile:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = [*(id *)(a1 + 40) filePath];
  if ([v6 length])
  {
    uint64_t v7 = +[UIImage imageWithContentsOfFile:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  v10 = [*(id *)(a1 + 48) filePath];
  if ([v10 length])
  {
    id v11 = +[UIImage imageWithContentsOfFile:v10];
    uint64_t v12 = [v11 imageWithRenderingMode:2];
    uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004608;
  block[3] = &unk_100008288;
  uint64_t v18 = *(void *)(a1 + 72);
  id v16 = *(id *)(a1 + 56);
  long long v19 = *(_OWORD *)(a1 + 80);
  id v17 = *(id *)(a1 + 64);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100004608(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSSArticleInternal);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = [*(id *)(a1 + 32) title];
  id v5 = [*(id *)(a1 + 32) shortExcerpt];
  id v6 = [*(id *)(a1 + 32) publishDate];
  uint64_t v7 = [*(id *)(a1 + 32) sourceName];
  id v9 = [v2 initWithThumbnailImage:v3 title:v4 shortExcerpt:v5 publishDate:v6 publisherName:v7 publisherLogoImage:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) publisherLogoMaskImage:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
}

void sub_100004CC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100004CF4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained articleViewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004DA4;
  v6[3] = &unk_100008328;
  v6[4] = WeakRetained;
  [v5 presentArticle:v3 completion:v6];
}

id sub_100004DA4(uint64_t a1, double a2, double a3)
{
  [*(id *)(a1 + 32) setArticlePreferredSize:];
  id v6 = *(void **)(a1 + 32);

  return [v6 setPreferredContentSize:a2, a3];
}

void sub_100004DF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = [WeakRetained articleViewController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004F4C;
    v10[3] = &unk_100008328;
    v10[4] = v5;
    [v6 presentArticle:v3 completion:v10];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004FA0;
    v8[3] = &unk_100008350;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    +[NSSArticleInternal articleFromNotification:v7 completion:v8];
    objc_destroyWeak(&v9);
  }
}

void sub_100004F38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100004F4C(uint64_t a1, double a2, double a3)
{
  [*(id *)(a1 + 32) setArticlePreferredSize:];
  id v6 = *(void **)(a1 + 32);

  return [v6 setPreferredContentSize:a2, a3];
}

void sub_100004FA0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained articleViewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005050;
  v6[3] = &unk_100008328;
  v6[4] = WeakRetained;
  [v5 presentArticle:v3 completion:v6];
}

id sub_100005050(uint64_t a1, double a2, double a3)
{
  [*(id *)(a1 + 32) setArticlePreferredSize:];
  id v6 = *(void **)(a1 + 32);

  return [v6 setPreferredContentSize:a2, a3];
}

void sub_10000568C(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_100005748()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"cachesDirectory"];
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[FRArticleNotificationArticleSource initWithCachesDirectory:]";
  __int16 v3 = 2080;
  uint64_t v4 = "FRArticleNotificationArticleSource.m";
  __int16 v5 = 1024;
  sub_1000047B4();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100005828()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "fetchCompletion != nil"];
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[FRArticleNotificationArticleSource fetchArticleWithID:completion:]";
  __int16 v3 = 2080;
  uint64_t v4 = "FRArticleNotificationArticleSource.m";
  __int16 v5 = 1024;
  sub_1000047B4();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10000590C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_1000056A8();
  sub_10000567C();
  sub_1000047B4();
  sub_10000568C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return _FCDispatchQueueForQualityOfService();
}

uint64_t FCPerformIfNonNil()
{
  return _FCPerformIfNonNil();
}

uint64_t FCURLForContainerizedUserAccountCachesDirectory()
{
  return _FCURLForContainerizedUserAccountCachesDirectory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_articleController(void *a1, const char *a2, ...)
{
  return [a1 articleController];
}

id objc_msgSend_articlePreferredSize(void *a1, const char *a2, ...)
{
  return [a1 articlePreferredSize];
}

id objc_msgSend_articleRecordData(void *a1, const char *a2, ...)
{
  return [a1 articleRecordData];
}

id objc_msgSend_articleSource(void *a1, const char *a2, ...)
{
  return [a1 articleSource];
}

id objc_msgSend_articleViewController(void *a1, const char *a2, ...)
{
  return [a1 articleViewController];
}

id objc_msgSend_asChannel(void *a1, const char *a2, ...)
{
  return [a1 asChannel];
}

id objc_msgSend_assetHandle(void *a1, const char *a2, ...)
{
  return [a1 assetHandle];
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return [a1 assetManager];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_bannerImageForMask(void *a1, const char *a2, ...)
{
  return [a1 bannerImageForMask];
}

id objc_msgSend_bannerImageForWhiteBackground(void *a1, const char *a2, ...)
{
  return [a1 bannerImageForWhiteBackground];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cachesDirectory(void *a1, const char *a2, ...)
{
  return [a1 cachesDirectory];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentContext(void *a1, const char *a2, ...)
{
  return [a1 contentContext];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return [a1 headline];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_parentIssueRecordData(void *a1, const char *a2, ...)
{
  return [a1 parentIssueRecordData];
}

id objc_msgSend_publishDate(void *a1, const char *a2, ...)
{
  return [a1 publishDate];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkReachability];
}

id objc_msgSend_shortExcerpt(void *a1, const char *a2, ...)
{
  return [a1 shortExcerpt];
}

id objc_msgSend_sourceChannel(void *a1, const char *a2, ...)
{
  return [a1 sourceChannel];
}

id objc_msgSend_sourceChannelID(void *a1, const char *a2, ...)
{
  return [a1 sourceChannelID];
}

id objc_msgSend_sourceChannelRecordData(void *a1, const char *a2, ...)
{
  return [a1 sourceChannelRecordData];
}

id objc_msgSend_sourceName(void *a1, const char *a2, ...)
{
  return [a1 sourceName];
}

id objc_msgSend_tagController(void *a1, const char *a2, ...)
{
  return [a1 tagController];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_thumbnailAssetHandle(void *a1, const char *a2, ...)
{
  return [a1 thumbnailAssetHandle];
}

id objc_msgSend_thumbnailHQ(void *a1, const char *a2, ...)
{
  return [a1 thumbnailHQ];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_uniqueKey(void *a1, const char *a2, ...)
{
  return [a1 uniqueKey];
}

id objc_msgSend_unregister(void *a1, const char *a2, ...)
{
  return [a1 unregister];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}