void sub_1000044AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000044D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000044E0(uint64_t a1)
{
}

void sub_1000044E8(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

uint64_t sub_100004538(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];

  return _objc_release_x1();
}

void sub_100004580(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) derivedPersonalizationData];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = [objc_alloc((Class)FCDerivedPersonalizationData) initWithAggregates:&__NSDictionary0__struct scoringType:0 decayRate:0.0];
  }
  v5 = v4;

  id v6 = [objc_alloc((Class)FCReadonlyPersonalizationAggregateStore) initWithGenerator:v5];
  v7 = [*(id *)(a1 + 32) feedPersonalizerFactory];
  id v8 = [v7 newFeedPersonalizerWithAggregateStore:v6 appConfigurationManager:*(void *)(a1 + 40) todayPrivateData:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000046FC;
  v11[3] = &unk_100028C60;
  id v12 = v8;
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  int8x16_t v16 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  id v15 = *(id *)(a1 + 56);
  id v9 = v6;
  id v10 = v8;
  [v10 prepareForUseWithCompletionHandler:v11];
}

void sub_1000046FC(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) sortItems:*(void *)(a1 + 40) options:1 configurationSet:18];
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) personalizationTreatment];
  id v3 = [*(id *)(a1 + 48) baselineAggregateWithConfigurableValues:v2];
  id v4 = [v2 notificationScoringConfig];
  [v4 decayFactor];
  [v3 personalizationValueWithBaseline:0];
  double v6 = v5;

  v7 = [[FRArticleNotificationPersonalizerResult alloc] initWithItems:v8 baselineClickThroughRate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) todayData:v6];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100004D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004D7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[NSThread isMainThread];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  FCPerformIfNonNil();
}

void sub_100004E6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    id v5 = [*(id *)(a1 + 40) headline];
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = sub_1000052E8;
    v46[4] = sub_1000052F8;
    id v47 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = sub_1000052E8;
    v44[4] = sub_1000052F8;
    id v45 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_1000052E8;
    v42[4] = sub_1000052F8;
    id v43 = 0;
    id v6 = [v5 thumbnailHQ];
    v32 = [v6 thumbnailAssetHandle];

    v7 = [v5 sourceChannel];
    id v8 = [v7 theme];
    id v9 = [v8 bannerImageForWhiteBackground];
    id v10 = [v8 bannerImageForMask];
    id v11 = [v9 assetHandle];
    v31 = v10;
    uint64_t v12 = [v10 assetHandle];
    id v13 = (void *)v12;
    v28 = v9;
    v29 = v7;
    id v30 = v3;
    if (!v32 && !v11 && !v12)
    {
      id v14 = objc_alloc((Class)NSSArticleInternal);
      id v15 = [v5 title];
      int8x16_t v16 = [v5 shortExcerpt];
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
        block[2] = sub_100005300;
        block[3] = &unk_100028CD8;
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

void sub_100005298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 184), 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000052E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000052F8(uint64_t a1)
{
}

void sub_100005300(uint64_t a1)
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
  id v10 = [*(id *)(a1 + 48) filePath];
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
  block[2] = sub_10000549C;
  block[3] = &unk_100028CB0;
  uint64_t v18 = *(void *)(a1 + 72);
  id v16 = *(id *)(a1 + 56);
  long long v19 = *(_OWORD *)(a1 + 80);
  id v17 = *(id *)(a1 + 64);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000549C(uint64_t a1)
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

void sub_1000061C8(uint64_t a1)
{
  id v2 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Aborting prefetch since kettle prefetching is disabled per the notification behavior flags", v5, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 bestAttemptContent];
  [v3 finalizeContent:v4];
}

void sub_100006258(uint64_t a1)
{
  id v2 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Aborting prefetch because notification interruption level + device settings will bypass digest", v5, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 bestAttemptContent];
  [v3 finalizeContent:v4];
}

void sub_1000062E8(uint64_t a1)
{
  id v2 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Aborting prefetch since prefetching is disabled", v5, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 bestAttemptContent];
  [v3 finalizeContent:v4];
}

void sub_100006378(uint64_t a1)
{
  id v2 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Aborting prefetch since device does not have watch paired", v5, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 bestAttemptContent];
  [v3 finalizeContent:v4];
}

void sub_100006408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v13 = a6;
  id v14 = a7;
  if (v14)
  {
    id v15 = FRArticleNotificationServiceSharedLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412290;
      id v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Fetch thumbnailURL and publisherLogoURL failed with error: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  else
  {
    id v16 = [*(id *)(a1 + 32) notificationAttachmentsWithThumbnailFileURL:a2 publisherLogoFileURL:a3 publisherLogoMaskFileURL:a4 publisherLogoCompactFileURL:a5 isKettleDigestEnabled:*(unsigned __int8 *)(a1 + 56)];
    id v17 = [*(id *)(a1 + 32) bestAttemptContent];
    [v17 setAttachments:v16];

    if (v13)
    {
      id v18 = [*(id *)(a1 + 40) mutableCopy];
      long long v19 = +[NSData dataWithContentsOfURL:v13];
      [v18 setObject:v19 forKeyedSubscript:FCNotificationPayloadFlintDocumentAssetDataKey];

      id v20 = [*(id *)(a1 + 48) mutableCopy];
      [v20 setObject:v18 forKeyedSubscript:FCNotificationPayloadNewsKey];
      id v21 = [*(id *)(a1 + 32) bestAttemptContent];
      [v21 setUserInfo:v20];
    }
    id v15 = FRArticleNotificationServiceSharedLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v22 = [*(id *)(a1 + 32) bestAttemptContent];
      v23 = [v22 attachments];
      int v26 = 134217984;
      id v27 = [v23 count];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Attached %lu attachments to notification.", (uint8_t *)&v26, 0xCu);
    }
  }

  id v24 = *(void **)(a1 + 32);
  v25 = [v24 bestAttemptContent];
  [v24 finalizeContent:v25];
}

void sub_100006F04(uint64_t a1)
{
  id v2 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Unable to create FCNotificationArticleHeadline from userInfo, skipping personalization.", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) contentHandler];
  v3[2](v3, *(void *)(a1 + 40));
}

void sub_100006F94(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000700C;
  block[3] = &unk_100028D50;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000700C(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) contentHandler];
  id v2 = [*(id *)(a1 + 32) bestAttemptContent];
  v3[2](v3, v2);
}

void sub_100007080(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 items];
  uint64_t v4 = [v3 scoreProfiles];
  id v5 = [v4 objectForKey:*(void *)(a1 + 32)];

  [v5 personalizationScore];
  double v7 = v6;
  uint64_t v8 = [*(id *)(a1 + 40) bestAttemptContent];
  [v8 setRelevanceScore:v7];

  id v9 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [*(id *)(a1 + 40) bestAttemptContent];
    [v10 relevanceScore];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Post processing notification with relevanceScore: %f", buf, 0xCu);
  }
  uint64_t v12 = [*(id *)(a1 + 40) postProcessCoordinator];
  id v13 = [*(id *)(a1 + 40) bestAttemptContent];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007230;
  v14[3] = &unk_100028D50;
  v14[4] = *(void *)(a1 + 40);
  [v12 notificationArrived:v13 completionHandler:v14];
}

void sub_100007230(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000072A8;
  block[3] = &unk_100028D50;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000072A8(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) contentHandler];
  id v2 = [*(id *)(a1 + 32) bestAttemptContent];
  v3[2](v3, v2);
}

id FRArticleNotificationServiceSharedLog()
{
  if (qword_10002E3A0 != -1) {
    dispatch_once(&qword_10002E3A0, &stru_100028E08);
  }
  v0 = (void *)qword_10002E3A8;

  return v0;
}

void sub_100007438(id a1)
{
  qword_10002E3A8 = (uint64_t)os_log_create("com.apple.news.newsnotificationserviceextension", "General");

  _objc_release_x1();
}

void sub_100007CB0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007D2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007D3C(uint64_t a1)
{
}

void sub_100007D44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Thumb DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v10 + 40);
  uint64_t v11 = (id *)(v10 + 40);
  uint64_t v12 = v13;
  if (v13) {
    id v14 = v12;
  }
  else {
    id v14 = v6;
  }
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100007E50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Dark Style Logo DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v10 + 40);
  uint64_t v11 = (id *)(v10 + 40);
  uint64_t v12 = v13;
  if (v13) {
    id v14 = v12;
  }
  else {
    id v14 = v6;
  }
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100007F5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Logo DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v10 + 40);
  uint64_t v11 = (id *)(v10 + 40);
  uint64_t v12 = v13;
  if (v13) {
    id v14 = v12;
  }
  else {
    id v14 = v6;
  }
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100008068(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Compact logo DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v10 + 40);
  uint64_t v11 = (id *)(v10 + 40);
  uint64_t v12 = v13;
  if (v13) {
    id v14 = v12;
  }
  else {
    id v14 = v6;
  }
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100008174(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Flint document DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v10 + 40);
  uint64_t v11 = (id *)(v10 + 40);
  uint64_t v12 = v13;
  if (v13) {
    id v14 = v12;
  }
  else {
    id v14 = v6;
  }
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100008280(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupFilesInDirectory:*(void *)(a1 + 40)];
  id v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

uint64_t sub_1000082C0(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 40);
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
    uint64_t v4 = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v5 = *(void *)(*(void *)(a1[8] + 8) + 40);
    uint64_t v6 = *(void *)(*(void *)(a1[9] + 8) + 40);
    uint64_t v7 = *(void *)(*(void *)(a1[10] + 8) + 40);
    int v9 = 138413570;
    uint64_t v10 = v2;
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Group done with URLs %@, %@, %@, %@, %@ and Error: %@", (uint8_t *)&v9, 0x3Eu);
  }
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[8] + 8) + 40), *(void *)(*(void *)(a1[9] + 8) + 40), *(void *)(*(void *)(a1[10] + 8) + 40));
  }
  return result;
}

void sub_100008A58(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Download of %@. DONE: %@ - %@ - %@", buf, 0x2Au);
  }
  if (v7)
  {
    uint64_t v12 = *(void **)(a1 + 40);
    __int16 v13 = [v7 lastPathComponent];
    uint64_t v14 = [v12 URLByAppendingPathComponent:v13];

    __int16 v15 = +[NSFileManager defaultManager];
    id v27 = 0;
    unsigned int v16 = [v15 copyItemAtURL:v7 toURL:v14 error:&v27];
    id v17 = v27;

    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v18)
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v29 = v19;
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        id v33 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: COPIED download of %@ from %@ to %@", buf, 0x20u);
      }
      id v20 = v14;
    }
    else
    {
      if (v18)
      {
        uint64_t v21 = *(void *)(a1 + 32);
        v22 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v29 = v21;
        __int16 v30 = 2112;
        id v31 = v22;
        __int16 v32 = 2112;
        id v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Couldn't copy download of %@ to %@ - %@", buf, 0x20u);
      }
      id v20 = 0;
    }

    if (*(void *)(a1 + 48))
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100008D48;
      v23[3] = &unk_100028EA8;
      id v26 = *(id *)(a1 + 48);
      id v24 = v20;
      id v25 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);
    }
  }
}

uint64_t sub_100008D48(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_100008DBC(void *a1)
{
  uint64_t v2 = (objc_class *)type metadata accessor for ArticleNotificationPersonalizationConfigurationManager();
  id v3 = objc_allocWithZone(v2);
  uint64_t v4 = (objc_class *)sub_10001F0E0();
  objc_allocWithZone(v4);
  swift_unknownObjectRetain();
  uint64_t v5 = (char *)v3;
  uint64_t v6 = sub_10001F0D0();
  id v7 = (uint64_t *)&v5[OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager];
  v7[3] = (uint64_t)v4;
  v7[4] = (uint64_t)&protocol witness table for NewsAppConfigurationManager;
  uint64_t *v7 = v6;

  v10.receiver = v5;
  v10.super_class = v2;
  [super init];
  sub_10001F110();
  sub_100009010();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v8 = a1;
  return sub_10001F100();
}

id sub_100008FA4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for ArticleNotificationFeedPersonalizerFactory()
{
  return self;
}

unint64_t sub_100009010()
{
  unint64_t result = qword_10002DCB0;
  if (!qword_10002DCB0)
  {
    type metadata accessor for ArticleNotificationPersonalizationConfigurationManager();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DCB0);
  }
  return result;
}

unint64_t sub_100009068()
{
  unint64_t result = sub_1000144F4((uint64_t)&_swiftEmptyArrayStorage);
  qword_10002F330 = (uint64_t)&_swiftEmptyArrayStorage;
  *(void *)algn_10002F338 = result;
  return result;
}

uint64_t destroy for PostProcessingRequest()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s32NewsNotificationServiceExtension21PostProcessingRequestVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PostProcessingRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PostProcessingRequest(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for PostProcessingRequest(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PostProcessingRequest(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PostProcessingRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PostProcessingRequest()
{
  return &type metadata for PostProcessingRequest;
}

uint64_t sub_100009258@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = sub_1000099DC(&qword_10002DD50);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  __chkstk_darwin();
  __int16 v32 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_1000099DC(&qword_10002DD58);
  uint64_t v23 = *(void *)(v28 - 8);
  __chkstk_darwin();
  id v31 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000099DC(&qword_10002DD60);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  id v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000099DC(&qword_10002DD68);
  __chkstk_darwin();
  __int16 v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = enum case for FeatureState.disabled<A>(_:);
  uint64_t v14 = *(void (**)(void))(v13 + 104);
  v22[1] = v11;
  v14();
  if ([a1 respondsToSelector:"clientSideEngagementBoostEnabled"]) {
    unsigned int v27 = [a1 clientSideEngagementBoostEnabled];
  }
  else {
    unsigned int v27 = 0;
  }
  if ([a1 respondsToSelector:"fallbackToReverseChronSorting"]) {
    unsigned int v26 = [a1 fallbackToReverseChronSorting];
  }
  else {
    unsigned int v26 = 0;
  }
  id v25 = [a1 personalizationTreatment];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 104))(v9, v12, v6);
  if ([a1 respondsToSelector:"publisherDampeningConfig"])
  {
    id v24 = [a1 publisherDampeningConfig];
  }
  else
  {
    sub_100014610((uint64_t)&_swiftEmptyArrayStorage);
    id v15 = objc_allocWithZone((Class)FCPersonalizationPublisherDampeningConfig);
    Class isa = sub_10001F190().super.isa;
    swift_bridgeObjectRelease();
    id v24 = [v15 initWithConfig:isa];
  }
  if ([a1 respondsToSelector:"shadowPublisherDampeningConfig"])
  {
    [a1 shadowPublisherDampeningConfig];
  }
  else
  {
    sub_100014610((uint64_t)&_swiftEmptyArrayStorage);
    id v17 = objc_allocWithZone((Class)FCPersonalizationPublisherDampeningConfig);
    Class v18 = sub_10001F190().super.isa;
    swift_bridgeObjectRelease();
    [v17 initWithConfig:v18];
  }
  if ([a1 respondsToSelector:"aggregatesInNotificationExtensionXavierEnabled"]) {
    [a1 aggregatesInNotificationExtensionXavierEnabled];
  }
  if ([a1 respondsToSelector:"tabiScoringInNotificationExtensionEnabled"]) {
    [a1 tabiScoringInNotificationExtensionEnabled];
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 104))(v31, v12, v28);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 104))(v32, v12, v30);
  id v19 = objc_allocWithZone((Class)FCStatelessPersonalizationPublisherFavorability);
  sub_1000099DC(&qword_10002DD70);
  Class v20 = sub_10001F210().super.isa;
  [v19 initWithArray:v20];

  return sub_10001F0F0();
}

uint64_t type metadata accessor for ArticleNotificationPersonalizationConfigurationManager()
{
  return self;
}

uint64_t sub_10000982C()
{
  sub_100009948((void *)(*v0+ OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager), *(void *)(*v0+ OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager+ 24));
  return sub_10001F140();
}

uint64_t sub_100009888()
{
  sub_100009948((void *)(*v0+ OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager), *(void *)(*v0+ OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager+ 24));
  return sub_10001F130();
}

uint64_t sub_1000098E0()
{
  sub_100009948((void *)(*v0+ OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager), *(void *)(*v0+ OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager+ 24));
  return sub_10001F120();
}

void *sub_100009948(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000998C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000099DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_100009A20()
{
  uint64_t v1 = type metadata accessor for ArticleNotificationDeduper();
  uint64_t v2 = swift_allocObject();
  sub_10001F050();
  swift_allocObject();
  uint64_t v3 = v0;
  *(void *)(v2 + 16) = sub_10001F040();
  uint64_t v4 = type metadata accessor for ArticleNotificationClusterIdDeduper();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = type metadata accessor for UnwantedNotificationReporter();
  uint64_t v7 = swift_allocObject();
  swift_allocObject();
  *(void *)(v7 + 16) = sub_10001F040();
  uint64_t v8 = OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_logger;
  if (qword_10002DBB0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001F180();
  uint64_t v10 = sub_10000C75C(v9, (uint64_t)qword_10002F358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7 + v8, v10, v9);
  uint64_t v11 = OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_sharedDefaults;
  *(void *)(v7 + v11) = (id)NewsCoreUserDefaults();
  sub_1000099DC(&qword_10002DE80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100023260;
  *(void *)(v12 + 56) = v1;
  *(void *)(v12 + 64) = &off_100029570;
  *(void *)(v12 + 32) = v2;
  *(void *)(v12 + 96) = v4;
  *(void *)(v12 + 104) = &off_100029560;
  *(void *)(v12 + 72) = v5;
  *(void *)(v12 + 136) = v6;
  *(void *)(v12 + 144) = &off_1000295D0;
  *(void *)(v12 + 112) = v7;
  *(void *)&v3[OBJC_IVAR___FRArticleNotificationPostProcessingCoordinator_processors] = v12;
  swift_retain();
  swift_retain();
  swift_retain();

  v15.receiver = v3;
  v15.super_class = (Class)type metadata accessor for PostProcessingCoordinator();
  [super init];
  swift_release();
  swift_release();
  swift_release();
  return v13;
}

uint64_t sub_100009C7C(uint64_t a1)
{
  *(void *)(v2 + 248) = a1;
  *(void *)(v2 + 256) = v1;
  return _swift_task_switch(sub_100009C9C, 0, 0);
}

uint64_t sub_100009C9C()
{
  id v1 = [self currentNotificationCenter];
  v0[33] = v1;
  v0[2] = v0;
  v0[7] = v0 + 29;
  v0[3] = sub_100009DC0;
  uint64_t v2 = swift_continuation_init();
  v0[23] = _NSConcreteStackBlock;
  v0[24] = 0x40000000;
  v0[25] = sub_10000A8C0;
  v0[26] = &unk_100029168;
  v0[27] = v2;
  [v1 getNotificationSettingsWithCompletionHandler:v0 + 23];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100009DC0()
{
  return _swift_task_switch(sub_100009EA0, 0, 0);
}

uint64_t sub_100009EA0()
{
  uint64_t v1 = (void *)v0[33];
  v0[34] = v0[29];
  v0[10] = v0;
  v0[15] = v0 + 28;
  v0[11] = sub_100009FA4;
  uint64_t v2 = swift_continuation_init();
  v0[18] = _NSConcreteStackBlock;
  v0[19] = 0x40000000;
  v0[20] = sub_10000A914;
  v0[21] = &unk_100029180;
  v0[22] = v2;
  [v1 getDeliveredNotificationsWithCompletionHandler:v0 + 18];
  return _swift_continuation_await(v0 + 10);
}

uint64_t sub_100009FA4()
{
  return _swift_task_switch(sub_10000A084, 0, 0);
}

uint64_t sub_10000A084()
{
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 224);
  *(void *)(v0 + 280) = v2;
  *(void *)(v0 + 240) = &_swiftEmptyArrayStorage;
  uint64_t v3 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 288) = v3;
  v3[1] = vextq_s8(*(int8x16_t *)(v0 + 248), *(int8x16_t *)(v0 + 248), 8uLL);
  v3[2].i64[0] = v2;
  v3[2].i64[1] = v1;
  v3[3].i64[0] = v0 + 240;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10000A19C;
  return withTaskGroup<A, B>(of:returning:isolation:body:)();
}

uint64_t sub_10000A19C()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return _swift_task_switch(sub_10000A2D0, 0, 0);
}

uint64_t sub_10000A2D0()
{
  __int16 v32 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[30];
  uint64_t v29 = *(void *)(v2 + 16);
  if (v29)
  {
    unsigned int v27 = v0;
    uint64_t v28 = v2 + 32;
    uint64_t v26 = v0[30];
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v29; ++i)
    {
      uint64_t v4 = (uint64_t *)(v28 + 16 * i);
      uint64_t v5 = *v4;
      uint64_t v6 = *(void *)(*v4 + 16);
      if (v6)
      {
        uint64_t v30 = i;
        uint64_t v7 = qword_10002DBB0;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v7 != -1) {
          swift_once();
        }
        uint64_t v8 = sub_10001F180();
        uint64_t v9 = (unint64_t *)(v5 + 40);
        do
        {
          uint64_t v10 = *(v9 - 1);
          unint64_t v11 = *v9;
          sub_10000C75C(v8, (uint64_t)qword_10002F358);
          swift_bridgeObjectRetain_n();
          uint64_t v12 = sub_10001F160();
          os_log_type_t v13 = sub_10001F2E0();
          if (os_log_type_enabled(v12, v13))
          {
            uint64_t v14 = swift_slowAlloc();
            id v31 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v14 = 136315138;
            swift_bridgeObjectRetain();
            *(void *)(v14 + 4) = sub_100019294(v10, v11, (uint64_t *)&v31);
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "Requested to remove notificationID, %s", (uint8_t *)v14, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }

          swift_bridgeObjectRetain();
          sub_10000C5AC((Swift::Int *)&v31, v10, v11);
          swift_bridgeObjectRelease();
          v9 += 2;
          --v6;
        }
        while (v6);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t i = v30;
      }
    }
    uint64_t v2 = v26;
    swift_bridgeObjectRelease();
    uint64_t v1 = v27;
  }
  objc_super v15 = (void *)v1[33];
  uint64_t v16 = swift_bridgeObjectRetain();
  v1[38] = sub_100016008(v16);
  swift_bridgeObjectRelease_n();
  Class isa = sub_10001F210().super.isa;
  [v15 removeDeliveredNotificationsWithIdentifiers:isa];

  uint64_t v18 = *(void *)(v2 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain_n();
    id v19 = (uint64_t *)(v2 + 40);
    Class v20 = &_swiftEmptyDictionarySingleton;
    do
    {
      uint64_t v21 = *v19;
      id v31 = v20;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_10000D268(v21, v21, &v31);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      Class v20 = v31;
      v19 += 2;
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    Class v20 = &_swiftEmptyDictionarySingleton;
  }
  v1[39] = v20;
  uint64_t v22 = v1[33];
  uint64_t v23 = swift_task_alloc();
  v1[40] = v23;
  *(void *)(v23 + 16) = v20;
  *(void *)(v23 + 24) = v22;
  id v24 = (void *)swift_task_alloc();
  v1[41] = v24;
  *id v24 = v1;
  v24[1] = sub_10000A70C;
  __int16 v34 = (char *)&type metadata for () + 8;
  return withTaskGroup<A, B>(of:returning:isolation:body:)();
}

uint64_t sub_10000A70C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_10000A824, 0, 0);
}

uint64_t sub_10000A824()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 312) + 16);
  swift_bridgeObjectRelease();
  if (!v1)
  {
    swift_release();
    goto LABEL_5;
  }
  uint64_t v2 = *(void *)(*(void *)(v0 + 304) + 16);
  swift_release();
  if (v2) {
LABEL_5:
  }
    sleep(1u);
  uint64_t v3 = *(void **)(v0 + 264);

  swift_bridgeObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10000A8C0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return _swift_continuation_resume(v2);
}

uint64_t sub_10000A914(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_10000DFA0();
  **(void **)(*(void *)(v1 + 64) + 40) = sub_10001F220();

  return _swift_continuation_resume(v1);
}

uint64_t sub_10000A97C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[25] = a6;
  v7[26] = a7;
  v7[23] = a4;
  v7[24] = a5;
  v7[21] = a2;
  v7[22] = a3;
  sub_1000099DC(&qword_10002DDD0);
  v7[27] = swift_task_alloc();
  v7[28] = swift_task_alloc();
  uint64_t v8 = sub_1000099DC(&qword_10002DE10);
  v7[29] = v8;
  v7[30] = *(void *)(v8 - 8);
  v7[31] = swift_task_alloc();
  return _swift_task_switch(sub_10000AA88, 0, 0);
}

uint64_t sub_10000AA88()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 176) + OBJC_IVAR___FRArticleNotificationPostProcessingCoordinator_processors);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0 + 16;
    uint64_t v26 = (long long *)(v0 + 56);
    uint64_t v4 = v1 + 32;
    swift_bridgeObjectRetain_n();
    while (1)
    {
      uint64_t v6 = *(void *)(v0 + 216);
      uint64_t v7 = *(void *)(v0 + 224);
      uint64_t v8 = *(void *)(v0 + 192);
      uint64_t v28 = v2;
      uint64_t v29 = *(void **)(v0 + 200);
      uint64_t v9 = *(void **)(v0 + 184);
      uint64_t v27 = v4;
      sub_10000DD14(v4, v3);
      uint64_t v10 = sub_10001F2B0();
      uint64_t v11 = *(void *)(v10 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v7, 1, 1, v10);
      sub_10000DD14(v3, (uint64_t)v26);
      uint64_t v12 = (void *)swift_allocObject();
      v12[2] = 0;
      os_log_type_t v13 = v12 + 2;
      v12[3] = 0;
      sub_10000DDD0(v26, (uint64_t)(v12 + 4));
      v12[9] = v9;
      v12[10] = v8;
      v12[11] = v29;
      sub_10000DB94(v7, v6);
      LODWORD(v6) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10);
      id v14 = v9;
      swift_bridgeObjectRetain();
      id v15 = v29;
      uint64_t v16 = *(void *)(v0 + 216);
      if (v6 == 1)
      {
        sub_10000DBFC(*(void *)(v0 + 216));
        if (!*v13) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_10001F2A0();
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v16, v10);
        if (!*v13)
        {
LABEL_8:
          uint64_t v17 = 0;
          uint64_t v19 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v17 = sub_10001F270();
      uint64_t v19 = v18;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v3 = v0 + 16;
      uint64_t v20 = **(void **)(v0 + 168);
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = &unk_10002DE28;
      *(void *)(v21 + 24) = v12;
      uint64_t v22 = v19 | v17;
      if (v19 | v17)
      {
        uint64_t v22 = v0 + 96;
        *(void *)(v0 + 96) = 0;
        *(void *)(v0 + 104) = 0;
        *(void *)(v0 + 112) = v17;
        *(void *)(v0 + 120) = v19;
      }
      uint64_t v5 = *(void *)(v0 + 224);
      *(void *)(v0 + 128) = 1;
      *(void *)(v0 + 136) = v22;
      *(void *)(v0 + 144) = v20;
      swift_task_create();
      swift_release();
      sub_10000DBFC(v5);
      sub_10000998C(v0 + 16);
      uint64_t v4 = v27 + 40;
      uint64_t v2 = v28 - 1;
      if (v28 == 1)
      {
        swift_bridgeObjectRelease_n();
        break;
      }
    }
  }
  sub_10001F280();
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v23;
  void *v23 = v0;
  v23[1] = sub_10000AE04;
  uint64_t v24 = *(void *)(v0 + 232);
  return TaskGroup.Iterator.next(isolation:)(v0 + 152, 0, 0, v24);
}

uint64_t sub_10000AE04()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000AF00, 0, 0);
}

uint64_t sub_10000AF00()
{
  if (*(void *)(v0 + 152))
  {
    long long v14 = *(_OWORD *)(v0 + 152);
    uint64_t v1 = *(char ***)(v0 + 208);
    uint64_t v2 = *v1;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v1 = v2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v10 = *(char ***)(v0 + 208);
      uint64_t v2 = sub_100014938(0, *((void *)v2 + 2) + 1, 1, v2);
      *uint64_t v10 = v2;
    }
    unint64_t v5 = *((void *)v2 + 2);
    unint64_t v4 = *((void *)v2 + 3);
    long long v6 = v14;
    if (v5 >= v4 >> 1)
    {
      uint64_t v11 = *(char ***)(v0 + 208);
      uint64_t v12 = sub_100014938((char *)(v4 > 1), v5 + 1, 1, v2);
      long long v6 = v14;
      uint64_t v2 = v12;
      *uint64_t v11 = v12;
    }
    *((void *)v2 + 2) = v5 + 1;
    *(_OWORD *)&v2[16 * v5 + 32] = v6;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v7;
    void *v7 = v0;
    v7[1] = sub_10000AE04;
    uint64_t v8 = *(void *)(v0 + 232);
    return TaskGroup.Iterator.next(isolation:)(v0 + 152, 0, 0, v8);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 240) + 8))(*(void *)(v0 + 248), *(void *)(v0 + 232));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_10000B0C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return _swift_task_switch(sub_10000B0F0, 0, 0);
}

uint64_t sub_10000B0F0()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100009948(v1, v2);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  unint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  *unint64_t v4 = v0;
  v4[1] = sub_10000B1FC;
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[4];
  return v9(v7, v5, v6, v2, v3);
}

uint64_t sub_10000B1FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000B2FC, 0, 0);
}

uint64_t sub_10000B2FC()
{
  *(_OWORD *)*(void *)(v0 + 16) = *(_OWORD *)(v0 + 64);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B31C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a2;
  return _swift_task_switch(sub_10000B340, 0, 0);
}

uint64_t sub_10000B340()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = (void *)v0[4];
  uint64_t v3 = (uint64_t *)v0[2];
  swift_bridgeObjectRetain();
  id v4 = v2;
  sub_10000D644(v1, v1, v3, v4);

  swift_bridgeObjectRelease();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10000B3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[17] = a6;
  v7[18] = a7;
  v7[15] = a4;
  v7[16] = a5;
  return _swift_task_switch(sub_10000B408, 0, 0);
}

uint64_t sub_10000B408()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = (void *)v0[15];
  NSString v3 = sub_10001F1C0();
  v0[19] = v3;
  v0[2] = v0;
  v0[3] = sub_10000B51C;
  uint64_t v4 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000B944;
  v0[13] = &unk_1000291E8;
  v0[14] = v4;
  [v2 replaceContentForRequestWithIdentifier:v3 replacementContent:v1 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000B51C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_10000B68C;
  }
  else {
    uint64_t v2 = sub_10000B62C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000B62C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000B68C()
{
  long long v14 = v0;
  uint64_t v1 = (void *)v0[19];
  swift_willThrow();

  if (qword_10002DBB0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001F180();
  sub_10000C75C(v2, (uint64_t)qword_10002F358);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v3 = sub_10001F160();
  os_log_type_t v4 = sub_10001F2C0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = v0[17];
  if (v5)
  {
    uint64_t v7 = v0[16];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446466;
    swift_bridgeObjectRetain();
    v0[10] = sub_100019294(v7, v6, &v13);
    sub_10001F2F0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2114;
    swift_errorRetain();
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v10;
    sub_10001F2F0();
    *uint64_t v9 = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Error replacing content for notificationID (key: %{public}s), error: %{public}@", (uint8_t *)v8, 0x16u);
    sub_1000099DC(&qword_10002DDF8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10000B944(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_1000099DC(&qword_10002DE00);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_10000BB58(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_10000BC34;
  v8[31] = v6;
  v8[32] = v7;
  return _swift_task_switch(sub_100009C9C, 0, 0);
}

uint64_t sub_10000BC34()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

id sub_10000BD8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PostProcessingCoordinator();
  [super dealloc];
}

uint64_t type metadata accessor for PostProcessingCoordinator()
{
  return self;
}

uint64_t sub_10000BDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  *uint64_t v11 = v3;
  v11[1] = sub_10000BECC;
  return sub_10000A97C(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_10000BECC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000BFC0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000C09C;
  return v6(a1);
}

uint64_t sub_10000C09C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000C194(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000E368;
  return v6();
}

uint64_t sub_10000C260(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  BOOL v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_10000E368;
  return v7();
}

uint64_t sub_10000C32C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001F2B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10001F2A0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000DBFC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10001F270();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000C4D0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000E374;
  return v6(a1);
}

uint64_t sub_10000C5AC(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10001F580();
  swift_bridgeObjectRetain();
  sub_10001F1E0();
  Swift::Int v8 = sub_10001F5A0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_10001F550() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      long long v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_10001F550() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10000CA74(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10000C75C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000C794()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000099DC(&qword_10002DE08);
  uint64_t v3 = sub_10001F370();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_10001F580();
      sub_10001F1E0();
      uint64_t result = sub_10001F5A0();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_10000CA74(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10000C794();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10000CC10();
      goto LABEL_22;
    }
    sub_10000CDC4();
  }
  uint64_t v11 = *v4;
  sub_10001F580();
  sub_10001F1E0();
  uint64_t result = sub_10001F5A0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_10001F550(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_10001F560();
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
          uint64_t result = sub_10001F550();
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

void *sub_10000CC10()
{
  uint64_t v1 = v0;
  sub_1000099DC(&qword_10002DE08);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001F360();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
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

uint64_t sub_10000CDC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000099DC(&qword_10002DE08);
  uint64_t v3 = sub_10001F370();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_10001F580();
    swift_bridgeObjectRetain();
    sub_10001F1E0();
    uint64_t result = sub_10001F5A0();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
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

uint64_t sub_10000D074(uint64_t a1, int *a2)
{
  *(void *)(v2 + 32) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 40) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_10000D154;
  return v5(v2 + 16);
}

uint64_t sub_10000D154()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(_OWORD **)(*v0 + 32);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  _OWORD *v2 = *(_OWORD *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10000D268(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3;
  uint64_t v5 = a1;
  uint64_t v6 = a1 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  int64_t v11 = 0;
  uint64_t v46 = swift_bridgeObjectRetain();
  uint64_t v43 = v6;
  uint64_t v44 = a2;
  int64_t v42 = v10;
  while (1)
  {
    while (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      if (*(void *)(a2 + 16))
      {
LABEL_24:
        unint64_t v17 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v13);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        swift_bridgeObjectRetain_n();
        unint64_t v20 = sub_100014B58(v19, v18);
        if (v21)
        {
          id v22 = *(id *)(*(void *)(a2 + 56) + 8 * v20);
          swift_bridgeObjectRelease();
          id v23 = v22;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          char v25 = (void *)*v3;
          id v47 = (void *)*v3;
          *uint64_t v3 = 0x8000000000000000;
          unint64_t v27 = sub_100014B58(v19, v18);
          uint64_t v28 = v25[2];
          BOOL v29 = (v26 & 1) == 0;
          uint64_t v30 = v28 + v29;
          if (__OFADD__(v28, v29)) {
            goto LABEL_39;
          }
          char v31 = v26;
          if (v25[3] >= v30)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              __int16 v34 = v47;
              if (v26) {
                goto LABEL_32;
              }
            }
            else
            {
              sub_10001577C();
              __int16 v34 = v47;
              if (v31) {
                goto LABEL_32;
              }
            }
          }
          else
          {
            sub_100014DC0(v30, isUniquelyReferenced_nonNull_native);
            unint64_t v32 = sub_100014B58(v19, v18);
            if ((v31 & 1) != (v33 & 1)) {
              goto LABEL_42;
            }
            unint64_t v27 = v32;
            __int16 v34 = v47;
            if (v31)
            {
LABEL_32:
              uint64_t v35 = v34[7];
              id v36 = *(void **)(v35 + 8 * v27);
              *(void *)(v35 + 8 * v27) = v23;
              goto LABEL_36;
            }
          }
          v34[(v27 >> 6) + 8] |= 1 << v27;
          id v37 = (uint64_t *)(v34[6] + 16 * v27);
          *id v37 = v19;
          v37[1] = v18;
          *(void *)(v34[7] + 8 * v27) = v23;
          uint64_t v38 = v34[2];
          BOOL v39 = __OFADD__(v38, 1);
          uint64_t v40 = v38 + 1;
          if (v39) {
            goto LABEL_40;
          }
          v34[2] = v40;
          swift_bridgeObjectRetain();
          id v36 = 0;
LABEL_36:
          uint64_t v3 = a3;
          *a3 = v34;
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          uint64_t v5 = v46;
          uint64_t v6 = v43;
          a2 = v44;
          int64_t v10 = v42;
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }
      }
    }
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v14 >= v10) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v10) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v10) {
          return swift_release();
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15)
        {
          int64_t v11 = v14 + 3;
          if (v14 + 3 >= v10) {
            return swift_release();
          }
          unint64_t v15 = *(void *)(v6 + 8 * v11);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    if (*(void *)(a2 + 16)) {
      goto LABEL_24;
    }
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v10) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v10) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_41:
  __break(1u);
LABEL_42:
  uint64_t result = sub_10001F570();
  __break(1u);
  return result;
}

uint64_t sub_10000D590(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v2 + 16);
  *(void *)(v3 + 16) = v5;
  *(void *)uint64_t v5 = v3;
  *(void *)(v5 + 8) = sub_10000E368;
  *(_OWORD *)(v5 + 24) = v6;
  *(void *)(v5 + 16) = a2;
  return _swift_task_switch(sub_10000B340, 0, 0);
}

uint64_t sub_10000D644(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  v49 = a3;
  v50 = a4;
  sub_1000099DC(&qword_10002DDD0);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v58 = (uint64_t)&v42 - v9;
  uint64_t v10 = a1 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(a1 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v16 = 0;
  uint64_t v47 = a2;
  v48 = (char *)&type metadata for () + 8;
  int64_t v45 = v14;
  uint64_t v46 = v8;
  uint64_t v43 = a1 + 64;
  uint64_t v44 = a1;
  while (1)
  {
    while (v13)
    {
      unint64_t v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v18 = v17 | (v16 << 6);
      if (*(void *)(a2 + 16)) {
        goto LABEL_25;
      }
    }
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v14) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v10 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v14) {
        return swift_release();
      }
      unint64_t v20 = *(void *)(v10 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v19 + 2;
        if (v19 + 2 >= v14) {
          return swift_release();
        }
        unint64_t v20 = *(void *)(v10 + 8 * v16);
        if (!v20)
        {
          int64_t v16 = v19 + 3;
          if (v19 + 3 >= v14) {
            return swift_release();
          }
          unint64_t v20 = *(void *)(v10 + 8 * v16);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v16 << 6);
    if (*(void *)(a2 + 16))
    {
LABEL_25:
      id v22 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v18);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      swift_bridgeObjectRetain_n();
      unint64_t v25 = sub_100014B58(v24, v23);
      if (v26)
      {
        unint64_t v52 = v13;
        int64_t v53 = v16;
        id v51 = *(id *)(*(void *)(a2 + 56) + 8 * v25);
        swift_bridgeObjectRelease();
        uint64_t v27 = sub_10001F2B0();
        uint64_t v28 = *(void *)(v27 - 8);
        uint64_t v29 = v58;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56))(v58, 1, 1, v27);
        uint64_t v30 = (uint64_t)v8;
        char v31 = (void *)swift_allocObject();
        v31[2] = 0;
        char v33 = v50;
        id v32 = v51;
        v31[3] = 0;
        v31[4] = v33;
        v31[5] = v24;
        v31[6] = v23;
        v31[7] = v32;
        sub_10000DB94(v29, v30);
        int v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v30, 1, v27);
        swift_bridgeObjectRetain();
        id v35 = v33;
        if (v34 == 1)
        {
          sub_10000DBFC(v30);
        }
        else
        {
          sub_10001F2A0();
          (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v27);
        }
        uint64_t v10 = v43;
        a1 = v44;
        if (v31[2])
        {
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v36 = sub_10001F270();
          uint64_t v38 = v37;
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v36 = 0;
          uint64_t v38 = 0;
        }
        int64_t v14 = v45;
        uint64_t v39 = *v49;
        uint64_t v40 = swift_allocObject();
        *(void *)(v40 + 16) = &unk_10002DDE0;
        *(void *)(v40 + 24) = v31;
        v41 = (void *)(v38 | v36);
        if (v38 | v36)
        {
          v57[0] = 0;
          v57[1] = 0;
          v41 = v57;
          v57[2] = v36;
          v57[3] = v38;
        }
        uint64_t v8 = v46;
        a2 = v47;
        uint64_t v54 = 1;
        v55 = v41;
        uint64_t v56 = v39;
        swift_task_create();
        swift_release();
        sub_10000DBFC(v58);
        unint64_t v13 = v52;
        int64_t v16 = v53;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v21 = v19 + 4;
  if (v21 >= v14) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v10 + 8 * v21);
  if (v20)
  {
    int64_t v16 = v21;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v14) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v10 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_24;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000DA88()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10000DAD8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_10000E368;
  *(_OWORD *)(v4 + 136) = v5;
  *(void *)(v4 + 120) = v2;
  *(void *)(v4 + 128) = v3;
  return _swift_task_switch(sub_10000B408, 0, 0);
}

uint64_t sub_10000DB94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000099DC(&qword_10002DDD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DBFC(uint64_t a1)
{
  uint64_t v2 = sub_1000099DC(&qword_10002DDD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000DC5C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000E368;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10002DDE8 + dword_10002DDE8);
  return v6(a1, v4);
}

uint64_t sub_10000DD14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000DD78()
{
  swift_unknownObjectRelease();
  sub_10000998C(v0 + 32);

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_10000DDD0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000DDE8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 88);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 72);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_10000E368;
  *(void *)(v5 + 48) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = v1 + 32;
  return _swift_task_switch(sub_10000B0F0, 0, 0);
}

uint64_t sub_10000DEB0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DEE8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000BECC;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10002DE20 + dword_10002DE20);
  return v6(a1, v4);
}

unint64_t sub_10000DFA0()
{
  unint64_t result = qword_10002DE38;
  if (!qword_10002DE38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002DE38);
  }
  return result;
}

uint64_t sub_10000DFE0()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000E028()
{
  uint64_t v2 = (void *)v0[2];
  long long v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10000E368;
  long long v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_10002DE40 + dword_10002DE40);
  return v6(v2, v3, v4);
}

uint64_t sub_10000E0E0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10000E368;
  long long v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10002DE50 + dword_10002DE50);
  return v6(v2, v3, v4);
}

uint64_t sub_10000E1A4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E1E4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  long long v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000E368;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10002DE60 + dword_10002DE60);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000E2B0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000E368;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10002DE70 + dword_10002DE70);
  return v6(a1, v4);
}

uint64_t sub_10000E378(char a1)
{
  if (a1) {
    return 1937204590;
  }
  else {
    return 7565409;
  }
}

BOOL sub_10000E3A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000E3B8()
{
  Swift::UInt v1 = *v0;
  sub_10001F580();
  sub_10001F590(v1);
  return sub_10001F5A0();
}

void sub_10000E400()
{
  sub_10001F590(*v0);
}

Swift::Int sub_10000E42C()
{
  Swift::UInt v1 = *v0;
  sub_10001F580();
  sub_10001F590(v1);
  return sub_10001F5A0();
}

uint64_t sub_10000E470()
{
  return sub_10000E378(*v0);
}

uint64_t sub_10000E478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100010A70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000E4A0()
{
  return 0;
}

void sub_10000E4AC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000E4B8(uint64_t a1)
{
  unint64_t v2 = sub_100010F08();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E4F4(uint64_t a1)
{
  unint64_t v2 = sub_100010F08();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E530(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000099DC(&qword_10002DED0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009948(a1, a1[3]);
  sub_100010F08();
  sub_10001F5C0();
  long long v9 = *(_OWORD *)(v3 + 48);
  v12[2] = *(_OWORD *)(v3 + 32);
  v12[3] = v9;
  v12[4] = *(_OWORD *)(v3 + 64);
  *(void *)&v12[5] = *(void *)(v3 + 80);
  long long v10 = *(_OWORD *)(v3 + 16);
  v12[0] = *(_OWORD *)v3;
  v12[1] = v10;
  char v13 = 0;
  sub_10001127C();
  sub_10001F520();
  if (!v2)
  {
    memcpy(v12, (const void *)(v3 + 88), 0x131uLL);
    char v13 = 1;
    sub_1000112D0();
    sub_10001F520();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void *sub_10000E6EC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100010B3C(a1, v5);
  if (!v2) {
    return memcpy(a2, v5, 0x189uLL);
  }
  return result;
}

uint64_t sub_10000E740(void *a1)
{
  return sub_10000E530(a1);
}

uint64_t sub_10000E758(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000099DC(&qword_10002DF30);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_100009948(a1, a1[3]);
  sub_100012E40();
  sub_10001F5C0();
  v11[0] = 0;
  sub_10001F4C0();
  if (!v2)
  {
    v11[0] = 1;
    sub_10001F4C0();
    v11[0] = 2;
    sub_10001F4C0();
    v11[0] = 3;
    sub_10001F4E0();
    v11[0] = 4;
    sub_10001F4E0();
    v11[0] = 5;
    sub_10001F4E0();
    v11[0] = 6;
    sub_10001F4E0();
    v11[0] = 7;
    sub_10001F4E0();
    sub_1000130C4(v3 + 128, (uint64_t)v13, &qword_10002DF38);
    sub_1000130C4((uint64_t)v13, (uint64_t)v11, &qword_10002DF38);
    HIBYTE(v10) = 8;
    sub_1000099DC(&qword_10002DF10);
    sub_100013128(&qword_10002DF40, &qword_10002DF10);
    sub_10001F4F0();
    sub_1000130C4(v3 + 136, (uint64_t)v12, &qword_10002DF48);
    sub_1000130C4((uint64_t)v12, (uint64_t)v11, &qword_10002DF48);
    HIBYTE(v10) = 9;
    sub_1000099DC(&qword_10002DF20);
    sub_100013128(&qword_10002DF50, &qword_10002DF20);
    sub_10001F4F0();
    v11[0] = 10;
    sub_10001F4C0();
    v11[0] = 11;
    sub_10001F4E0();
    v11[0] = 12;
    sub_10001F4C0();
    v11[0] = 13;
    sub_10001F4C0();
    v11[0] = 14;
    sub_10001F4C0();
    v11[0] = 15;
    sub_10001F4C0();
    v11[0] = 16;
    sub_10001F4C0();
    v11[0] = 17;
    sub_10001F4C0();
    v11[0] = 18;
    sub_10001F4C0();
    v11[0] = 19;
    sub_10001F4C0();
    v11[0] = 20;
    sub_10001F4D0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000ECA8(char a1)
{
  uint64_t result = 0x6E4F6B6369507369;
  switch(a1)
  {
    case 20:
      return result;
    default:
      uint64_t result = sub_10001F1D0();
      break;
  }
  return result;
}

uint64_t sub_10000EE48(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_10000ECA8(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000ECA8(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10001F550();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10000EED4()
{
  char v1 = *v0;
  sub_10001F580();
  sub_10000ECA8(v1);
  sub_10001F1E0();
  swift_bridgeObjectRelease();
  return sub_10001F5A0();
}

uint64_t sub_10000EF38()
{
  sub_10000ECA8(*v0);
  sub_10001F1E0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000EF8C()
{
  char v1 = *v0;
  sub_10001F580();
  sub_10000ECA8(v1);
  sub_10001F1E0();
  swift_bridgeObjectRelease();
  return sub_10001F5A0();
}

uint64_t sub_10000EFEC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10001342C(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_10000F01C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000ECA8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000F048()
{
  return sub_10000ECA8(*v0);
}

uint64_t sub_10000F050@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100013CE8(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000F078(unsigned char *a1@<X8>)
{
  *a1 = 21;
}

uint64_t sub_10000F084(uint64_t a1)
{
  unint64_t v2 = sub_100012E40();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F0C0(uint64_t a1)
{
  unint64_t v2 = sub_100012E40();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10000F0FC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100011CF0(a1, __src);
  if (!v2) {
    return memcpy(a2, __src, 0x131uLL);
  }
  return result;
}

uint64_t sub_10000F150(void *a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_10000E758(a1);
}

void sub_10000F1A4(uint64_t a1, uint64_t a2)
{
  sub_1000100D4(a2, (uint64_t)v11);
  uint64_t v4 = sub_1000099DC(&qword_10002DD70);
  if (swift_dynamicCast())
  {
    uint64_t v5 = v10[0];
    uint64_t v6 = sub_100010078(a1, (uint64_t)v11);
    v10[0] = &_swiftEmptyDictionarySingleton;
    __chkstk_darwin(v6);
    sub_10000F700(v5, (void (*)(unsigned char *, unsigned char *))sub_1000144EC);
    swift_bridgeObjectRelease();
    v10[3] = v4;
  }
  else
  {
    uint64_t v7 = self;
    sub_1000099DC(&qword_10002DEA0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000232B0;
    sub_100010078(a1, inited + 32);
    sub_1000100D4(a2, inited + 72);
    sub_100014610(inited);
    Class isa = sub_10001F190().super.isa;
    swift_bridgeObjectRelease();
    LOBYTE(v7) = [(id)v7 isValidJSONObject:isa];

    if ((v7 & 1) == 0) {
      return;
    }
    sub_100010078(a1, (uint64_t)v11);
    sub_1000100D4(a2, (uint64_t)v10);
  }
  sub_10000F378((uint64_t)v10, (uint64_t)v11);
}

uint64_t sub_10000F378(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_1000101E0((_OWORD *)a1, v7);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v6 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_100015CD0(v7, a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v6;
    swift_bridgeObjectRelease();
    return sub_10001018C(a2);
  }
  else
  {
    sub_100010130(a1, &qword_10002DEA8);
    sub_10000F438(a2, v7);
    sub_10001018C(a2);
    return sub_100010130((uint64_t)v7, &qword_10002DEA8);
  }
}

double sub_10000F438@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100014BD0(a1);
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
      sub_100015930();
      uint64_t v9 = v11;
    }
    sub_10001018C(*(void *)(v9 + 48) + 40 * v6);
    sub_1000101E0((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_10000F534(v6, v9);
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

unint64_t sub_10000F534(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_10001F320();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_100010078(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = sub_10001F330(*(void *)(a2 + 40));
        double result = sub_10001018C((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            int64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            int64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *unint64_t v20 = *v21;
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

uint64_t sub_10000F700(uint64_t a1, void (*a2)(unsigned char *, unsigned char *))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v8) {
      return swift_release();
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v14 = *(void *)(v4 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v14 = *(void *)(v4 + 8 * v10);
        if (!v14)
        {
          int64_t v10 = v13 + 3;
          if (v13 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v14 = *(void *)(v4 + 8 * v10);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_5:
    sub_100010078(*(void *)(a1 + 48) + 40 * v12, (uint64_t)v16);
    sub_1000100D4(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v17);
    a2(v16, v17);
    uint64_t result = sub_100010130((uint64_t)v16, &qword_10002DE98);
  }
  int64_t v15 = v13 + 4;
  if (v15 >= v8) {
    return swift_release();
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v14 = *(void *)(v4 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10000F8B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v30[0] = &_swiftEmptyDictionarySingleton;
  sub_10000F700(a1, (void (*)(unsigned char *, unsigned char *))sub_10000FF80);
  int64_t v3 = self;
  Class isa = sub_10001F190().super.isa;
  unsigned int v5 = [v3 isValidJSONObject:isa];

  if (!v5)
  {
    if (qword_10002DBB0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10001F180();
    sub_10000C75C(v12, (uint64_t)qword_10002F358);
    swift_bridgeObjectRetain();
    int64_t v13 = sub_10001F160();
    os_log_type_t v14 = sub_10001F2C0();
    if (os_log_type_enabled(v13, v14))
    {
      int64_t v15 = (uint8_t *)swift_slowAlloc();
      v30[0] = (id)swift_slowAlloc();
      *(_DWORD *)int64_t v15 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_10001F1B0();
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
      *(void *)&__src[0] = sub_100019294(v16, v18, (uint64_t *)v30);
      sub_10001F2F0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v19 = "Unable to create UserInfoArticle from non-serializable user info payload: %{public}s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v19, v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

LABEL_14:
      sub_10000FF88(__src);
      uint64_t v25 = __src;
      goto LABEL_15;
    }
LABEL_13:

    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  Class v6 = sub_10001F190().super.isa;
  v30[0] = 0;
  id v7 = [v3 dataWithJSONObject:v6 options:0 error:v30];

  id v8 = v30[0];
  if (!v7)
  {
    unint64_t v20 = v8;
    sub_10001F060();

    swift_willThrow();
    swift_errorRelease();
    if (qword_10002DBB0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_10001F180();
    sub_10000C75C(v21, (uint64_t)qword_10002F358);
    swift_bridgeObjectRetain();
    int64_t v13 = sub_10001F160();
    os_log_type_t v14 = sub_10001F2C0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v27 = a2;
      int64_t v15 = (uint8_t *)swift_slowAlloc();
      v30[0] = (id)swift_slowAlloc();
      *(_DWORD *)int64_t v15 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_10001F1B0();
      unint64_t v24 = v23;
      swift_bridgeObjectRelease();
      *(void *)&__src[0] = sub_100019294(v22, v24, (uint64_t *)v30);
      sub_10001F2F0();
      swift_bridgeObjectRelease_n();
      a2 = v27;
      swift_bridgeObjectRelease();
      uint64_t v19 = "Unable to create JSON data from user info payload: %{public}s";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_10001F070();
  unint64_t v11 = v10;

  sub_10001F050();
  swift_allocObject();
  sub_10001F040();
  sub_10000FFC8();
  sub_10001F030();
  sub_10001001C(v9, v11);
  swift_release();
  memcpy(__dst, __src, 0x189uLL);
  nullsub_1(__dst);
  uint64_t v25 = __dst;
LABEL_15:
  sub_1000130C4((uint64_t)v25, (uint64_t)v30, &qword_10002DE88);
  return sub_1000130C4((uint64_t)v30, a2, &qword_10002DE88);
}

void sub_10000FF80(uint64_t a1, uint64_t a2)
{
}

double sub_10000FF88(_OWORD *a1)
{
  double result = 0.0;
  a1[22] = 0u;
  a1[23] = 0u;
  a1[20] = 0u;
  a1[21] = 0u;
  a1[18] = 0u;
  a1[19] = 0u;
  a1[16] = 0u;
  a1[17] = 0u;
  a1[14] = 0u;
  a1[15] = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  *(_OWORD *)((char *)a1 + 377) = 0u;
  return result;
}

unint64_t sub_10000FFC8()
{
  unint64_t result = qword_10002DE90;
  if (!qword_10002DE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DE90);
  }
  return result;
}

uint64_t sub_10001001C(uint64_t a1, unint64_t a2)
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

uint64_t sub_100010078(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000100D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100010130(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000099DC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001018C(uint64_t a1)
{
  return a1;
}

_OWORD *sub_1000101E0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t destroy for UserInfoArticle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserInfoArticle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  uint64_t v10 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v10;
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  uint64_t v11 = *(void *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 152) = v11;
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  uint64_t v12 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v12;
  uint64_t v13 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v13;
  uint64_t v14 = *(void *)(a2 + 248);
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  *(void *)(a1 + 248) = v14;
  uint64_t v15 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = v15;
  uint64_t v16 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = v16;
  uint64_t v17 = *(void *)(a2 + 304);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = v17;
  uint64_t v18 = *(void *)(a2 + 320);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = v18;
  uint64_t v19 = *(void *)(a2 + 336);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = v19;
  uint64_t v20 = *(void *)(a2 + 352);
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  *(void *)(a1 + 352) = v20;
  uint64_t v21 = *(void *)(a2 + 368);
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(void *)(a1 + 368) = v21;
  uint64_t v22 = *(void *)(a2 + 384);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v22;
  *(unsigned char *)(a1 + 392) = *(unsigned char *)(a2 + 392);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserInfoArticle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v4;
  uint64_t v5 = *(void *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 152) = v5;
  uint64_t v6 = *(void *)(a2 + 168);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(void *)(a1 + 168) = v6;
  uint64_t v7 = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 184) = v7;
  uint64_t v8 = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = v8;
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 248);
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  *(void *)(a1 + 248) = v9;
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 392) = *(unsigned char *)(a2 + 392);
  return a1;
}

void *initializeWithTake for UserInfoArticle(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x189uLL);
}

uint64_t assignWithTake for UserInfoArticle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  uint64_t v11 = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = v11;
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v12;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  uint64_t v13 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 304);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 320);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 336);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 352);
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  *(void *)(a1 + 352) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 368);
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(void *)(a1 + 368) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(a2 + 384);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v20;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 392) = *(unsigned char *)(a2 + 392);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserInfoArticle(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 393)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserInfoArticle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 392) = 0;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 393) = 1;
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
    *(unsigned char *)(result + 393) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserInfoArticle()
{
  return &type metadata for UserInfoArticle;
}

uint64_t sub_100010A70(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7565409 && a2 == 0xE300000000000000;
  if (v3 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1937204590 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10001F550();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void *sub_100010B3C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v31 = sub_1000099DC(&qword_10002DEB0);
  uint64_t v5 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009948(a1, a1[3]);
  sub_100010F08();
  sub_10001F5B0();
  if (v2) {
    return (void *)sub_10000998C((uint64_t)a1);
  }
  uint64_t v29 = a2;
  uint64_t v30 = v5;
  LOBYTE(v32[0]) = 0;
  sub_100010F5C();
  uint64_t v8 = v31;
  sub_10001F4B0();
  uint64_t v9 = v34;
  uint64_t v10 = v36;
  uint64_t v23 = v37;
  uint64_t v24 = v35;
  uint64_t v11 = v38;
  uint64_t v25 = v40;
  uint64_t v21 = v41;
  uint64_t v22 = v39;
  uint64_t v19 = v33;
  uint64_t v20 = v42;
  uint64_t v12 = v43;
  v46[335] = 1;
  sub_100010FB0();
  uint64_t v26 = v9;
  uint64_t v13 = v25;
  swift_bridgeObjectRetain();
  uint64_t v28 = v10;
  swift_bridgeObjectRetain();
  uint64_t v27 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10001F4B0();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v8);
  memcpy(&v32[11], v45, 0x131uLL);
  memcpy(v46, v45, 0x131uLL);
  uint64_t v14 = v19;
  uint64_t v16 = v26;
  uint64_t v15 = v27;
  v32[0] = v19;
  v32[1] = v26;
  uint64_t v17 = v28;
  v32[2] = v24;
  v32[3] = v28;
  v32[4] = v23;
  v32[5] = v27;
  v32[6] = v22;
  v32[7] = v13;
  v32[8] = v21;
  v32[9] = v20;
  v32[10] = v12;
  sub_100011004((uint64_t)v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000998C((uint64_t)a1);
  uint64_t v33 = v14;
  uint64_t v34 = v16;
  uint64_t v35 = v24;
  uint64_t v36 = v17;
  uint64_t v37 = v23;
  uint64_t v38 = v15;
  uint64_t v39 = v22;
  uint64_t v40 = v13;
  uint64_t v41 = v21;
  uint64_t v42 = v20;
  uint64_t v43 = v12;
  memcpy(v44, v46, sizeof(v44));
  sub_100011140((uint64_t)&v33);
  return memcpy(v29, v32, 0x189uLL);
}

unint64_t sub_100010F08()
{
  unint64_t result = qword_10002DEB8;
  if (!qword_10002DEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DEB8);
  }
  return result;
}

unint64_t sub_100010F5C()
{
  unint64_t result = qword_10002DEC0;
  if (!qword_10002DEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DEC0);
  }
  return result;
}

unint64_t sub_100010FB0()
{
  unint64_t result = qword_10002DEC8;
  if (!qword_10002DEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DEC8);
  }
  return result;
}

uint64_t sub_100011004(uint64_t a1)
{
  return a1;
}

uint64_t sub_100011140(uint64_t a1)
{
  return a1;
}

unint64_t sub_10001127C()
{
  unint64_t result = qword_10002DED8;
  if (!qword_10002DED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DED8);
  }
  return result;
}

unint64_t sub_1000112D0()
{
  unint64_t result = qword_10002DEE0;
  if (!qword_10002DEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DEE0);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for UserInfoArticle.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UserInfoArticle.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UserInfoArticle.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x100011490);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1000114B8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000114C0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UserInfoArticle.CodingKeys()
{
  return &type metadata for UserInfoArticle.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for APS.Alert(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for NewsSingleArticle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NewsSingleArticle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  uint64_t v7 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v7;
  uint64_t v8 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v8;
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  uint64_t v9 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v9;
  uint64_t v10 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v10;
  uint64_t v11 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v11;
  uint64_t v12 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v12;
  uint64_t v13 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v13;
  uint64_t v14 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v14;
  uint64_t v15 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v15;
  uint64_t v16 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v16;
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NewsSingleArticle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 80) = v6;
  uint64_t v7 = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = v7;
  uint64_t v8 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = v9;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  return a1;
}

void *initializeWithTake for NewsSingleArticle(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x131uLL);
}

uint64_t assignWithTake for NewsSingleArticle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v7 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 112) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  uint64_t v9 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v16;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  return a1;
}

uint64_t getEnumTagSinglePayload for NewsSingleArticle(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 305)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NewsSingleArticle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 296) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 304) = 0;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 305) = 1;
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
    *(unsigned char *)(result + 305) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NewsSingleArticle()
{
  return &type metadata for NewsSingleArticle;
}

unint64_t sub_100011BEC()
{
  unint64_t result = qword_10002DEE8;
  if (!qword_10002DEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DEE8);
  }
  return result;
}

unint64_t sub_100011C44()
{
  unint64_t result = qword_10002DEF0;
  if (!qword_10002DEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DEF0);
  }
  return result;
}

unint64_t sub_100011C9C()
{
  unint64_t result = qword_10002DEF8;
  if (!qword_10002DEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DEF8);
  }
  return result;
}

void *sub_100011CF0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_1000099DC(&qword_10002DF00);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v136 = 1;
  uint64_t v9 = a1[3];
  v85 = a1;
  sub_100009948(a1, v9);
  sub_100012E40();
  sub_10001F5B0();
  if (v2)
  {
    uint64_t v86 = 0;
    uint64_t v87 = 0;
    uint64_t v141 = 0;
    sub_10000998C((uint64_t)v85);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (void *)swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v84 = v6;
    v80 = a2;
    LOBYTE(v89[0]) = 0;
    uint64_t v10 = sub_10001F490();
    uint64_t v12 = v11;
    LOBYTE(v89[0]) = 1;
    swift_bridgeObjectRetain();
    uint64_t v79 = sub_10001F490();
    LOBYTE(v89[0]) = 2;
    uint64_t v14 = v13;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_10001F450();
    uint64_t v83 = v14;
    uint64_t v77 = v10;
    uint64_t v78 = v15;
    LOBYTE(v89[0]) = 3;
    uint64_t v17 = v16;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_10001F470();
    uint64_t v82 = v17;
    uint64_t v76 = v18;
    char v140 = v19 & 1;
    LOBYTE(v89[0]) = 4;
    LODWORD(v17) = v19;
    uint64_t v20 = sub_10001F470();
    int v74 = v17;
    uint64_t v75 = v20;
    char v138 = v21 & 1;
    LOBYTE(v89[0]) = 4;
    int v22 = v21;
    uint64_t v23 = sub_10001F470();
    int v73 = v22;
    char v136 = v24 & 1;
    LOBYTE(v89[0]) = 6;
    LOBYTE(v22) = v24;
    uint64_t v72 = sub_10001F470();
    int v71 = v25;
    char v134 = v25 & 1;
    LOBYTE(v89[0]) = 7;
    uint64_t v69 = sub_10001F470();
    uint64_t v70 = v23;
    int v68 = v26;
    char v132 = v26 & 1;
    sub_1000099DC(&qword_10002DF10);
    LOBYTE(v88[0]) = 8;
    sub_100013128(&qword_10002DF18, &qword_10002DF10);
    sub_10001F480();
    uint64_t v66 = v12;
    uint64_t v27 = v89[0];
    sub_1000099DC(&qword_10002DF20);
    LOBYTE(v88[0]) = 9;
    sub_100013128(&qword_10002DF28, &qword_10002DF20);
    uint64_t v67 = v27;
    swift_bridgeObjectRetain();
    sub_10001F480();
    uint64_t v28 = v89[0];
    LOBYTE(v89[0]) = 10;
    uint64_t v65 = v28;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_10001F450();
    uint64_t v64 = v30;
    uint64_t v31 = v29;
    LOBYTE(v89[0]) = 11;
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_10001F470();
    int v63 = v32;
    char v130 = v32 & 1;
    LOBYTE(v89[0]) = 12;
    uint64_t v61 = sub_10001F450();
    uint64_t v81 = v33;
    LOBYTE(v89[0]) = 13;
    swift_bridgeObjectRetain();
    uint64_t v60 = sub_10001F450();
    uint64_t v141 = v34;
    LOBYTE(v89[0]) = 14;
    swift_bridgeObjectRetain();
    uint64_t v59 = sub_10001F450();
    uint64_t v87 = v35;
    LOBYTE(v89[0]) = 15;
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_10001F450();
    uint64_t v86 = v36;
    LOBYTE(v89[0]) = 16;
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_10001F450();
    uint64_t v57 = v37;
    LOBYTE(v89[0]) = 17;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_10001F450();
    uint64_t v56 = v38;
    LOBYTE(v89[0]) = 18;
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_10001F450();
    uint64_t v40 = v39;
    LOBYTE(v89[0]) = 19;
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_10001F450();
    uint64_t v42 = v41;
    char v128 = 20;
    swift_bridgeObjectRetain();
    int v51 = sub_10001F460();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v8, v5);
    LOBYTE(v88[7]) = v74 & 1;
    LOBYTE(v88[9]) = v73 & 1;
    LOBYTE(v88[11]) = v22 & 1;
    LOBYTE(v88[13]) = v71 & 1;
    LOBYTE(v88[15]) = v68 & 1;
    LOBYTE(v88[21]) = v63 & 1;
    v88[0] = v77;
    v88[1] = v66;
    v88[2] = v79;
    v88[3] = v83;
    v88[4] = v78;
    v88[5] = v82;
    v88[6] = v76;
    v88[8] = v75;
    v88[10] = v70;
    v88[12] = v72;
    v88[14] = v69;
    v88[16] = v67;
    v88[17] = v65;
    uint64_t v50 = v31;
    v88[18] = v31;
    v88[19] = v64;
    v88[20] = v62;
    v88[22] = v61;
    v88[23] = v81;
    uint64_t v43 = v141;
    v88[24] = v60;
    v88[25] = v141;
    v88[26] = v59;
    v88[27] = v87;
    uint64_t v44 = v57;
    v88[28] = v58;
    v88[29] = v86;
    v88[30] = v55;
    v88[31] = v57;
    v88[32] = v54;
    v88[33] = v56;
    v88[34] = v53;
    v88[35] = v40;
    v88[36] = v52;
    v88[37] = v42;
    LOBYTE(v88[38]) = v51;
    sub_100012EDC((uint64_t)v88);
    uint64_t v45 = v66;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v46 = v82;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v47 = v56;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000998C((uint64_t)v85);
    v89[0] = v77;
    v89[1] = v45;
    v89[2] = v79;
    v89[3] = v83;
    v89[4] = v78;
    v89[5] = v46;
    v89[6] = v76;
    char v90 = v140;
    *(_DWORD *)v91 = *(_DWORD *)v139;
    *(_DWORD *)&v91[3] = *(_DWORD *)&v139[3];
    uint64_t v92 = v75;
    char v93 = v138;
    *(_DWORD *)v94 = *(_DWORD *)v137;
    *(_DWORD *)&v94[3] = *(_DWORD *)&v137[3];
    uint64_t v95 = v70;
    char v96 = v136;
    *(_DWORD *)v97 = *(_DWORD *)v135;
    *(_DWORD *)&v97[3] = *(_DWORD *)&v135[3];
    uint64_t v98 = v72;
    char v99 = v134;
    *(_DWORD *)v100 = *(_DWORD *)v133;
    *(_DWORD *)&v100[3] = *(_DWORD *)&v133[3];
    uint64_t v101 = v69;
    char v102 = v132;
    *(_DWORD *)&v103[3] = *(_DWORD *)&v131[3];
    *(_DWORD *)v103 = *(_DWORD *)v131;
    uint64_t v104 = v67;
    uint64_t v105 = v65;
    uint64_t v106 = v50;
    uint64_t v107 = v64;
    uint64_t v108 = v62;
    char v109 = v130;
    *(_DWORD *)&v110[3] = *(_DWORD *)&v129[3];
    *(_DWORD *)v110 = *(_DWORD *)v129;
    uint64_t v111 = v61;
    uint64_t v112 = v81;
    uint64_t v113 = v60;
    uint64_t v114 = v43;
    uint64_t v115 = v59;
    uint64_t v116 = v87;
    uint64_t v117 = v58;
    uint64_t v118 = v86;
    uint64_t v119 = v55;
    uint64_t v120 = v44;
    uint64_t v121 = v54;
    uint64_t v122 = v47;
    uint64_t v123 = v53;
    uint64_t v124 = v40;
    uint64_t v125 = v52;
    uint64_t v126 = v42;
    char v127 = v51;
    sub_100012FD0((uint64_t)v89);
    return memcpy(v80, v88, 0x131uLL);
  }
}

unint64_t sub_100012E40()
{
  unint64_t result = qword_10002DF08;
  if (!qword_10002DF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DF08);
  }
  return result;
}

uint64_t sub_100012E94(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100012EDC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100012FD0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000130C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000099DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013128(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100012E94(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NewsSingleArticle.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
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
      return (*a1 | (v4 << 8)) - 20;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NewsSingleArticle.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    *uint64_t result = a2 + 20;
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
        JUMPOUT(0x1000132E4);
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
          *uint64_t result = a2 + 20;
        break;
    }
  }
  return result;
}

unsigned char *sub_10001330C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NewsSingleArticle.CodingKeys()
{
  return &type metadata for NewsSingleArticle.CodingKeys;
}

unint64_t sub_100013328()
{
  unint64_t result = qword_10002DF58;
  if (!qword_10002DF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DF58);
  }
  return result;
}

unint64_t sub_100013380()
{
  unint64_t result = qword_10002DF60;
  if (!qword_10002DF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DF60);
  }
  return result;
}

unint64_t sub_1000133D8()
{
  unint64_t result = qword_10002DF68;
  if (!qword_10002DF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DF68);
  }
  return result;
}

uint64_t sub_10001342C(uint64_t a1, uint64_t a2)
{
  if (sub_10001F1D0() == a1 && v4 == a2) {
    goto LABEL_58;
  }
  char v6 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v6)
  {
LABEL_6:
    swift_bridgeObjectRelease();
    return 10;
  }
  if (sub_10001F1D0() == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v9 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v9)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  if (sub_10001F1D0() == a1 && v11 == a2)
  {
    uint64_t v10 = 2;
    swift_bridgeObjectRelease_n();
    return v10;
  }
  char v13 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  if (sub_10001F1D0() == a1 && v14 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 3;
  }
  char v15 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v15)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  if (sub_10001F1D0() == a1 && v16 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 4;
  }
  char v17 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v17)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  if (sub_10001F1D0() == a1 && v18 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 5;
  }
  char v19 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v19)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  if (sub_10001F1D0() == a1 && v20 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 6;
  }
  char v21 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v21)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  if (sub_10001F1D0() == a1 && v22 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 7;
  }
  char v23 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v23)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  if (sub_10001F1D0() == a1 && v24 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 8;
  }
  char v25 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v25)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  if (sub_10001F1D0() == a1 && v26 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 9;
  }
  char v27 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v27)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  if (sub_10001F1D0() == a1 && v28 == a2) {
    goto LABEL_58;
  }
  char v30 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v30) {
    goto LABEL_6;
  }
  if (sub_10001F1D0() == a1 && v31 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 11;
  }
  char v32 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v32)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  if (sub_10001F1D0() == a1 && v33 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 12;
  }
  char v34 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v34)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  if (sub_10001F1D0() == a1 && v35 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 13;
  }
  char v36 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v36)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  if (sub_10001F1D0() == a1 && v37 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 14;
  }
  char v38 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v38)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  if (sub_10001F1D0() == a1 && v39 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 15;
  }
  char v40 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v40)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  if (sub_10001F1D0() == a1 && v41 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 16;
  }
  char v42 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v42)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  if (sub_10001F1D0() == a1 && v43 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 17;
  }
  char v44 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v44)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  if (sub_10001F1D0() == a1 && v45 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 18;
  }
  char v46 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v46)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  if (sub_10001F1D0() == a1 && v47 == a2)
  {
LABEL_58:
    swift_bridgeObjectRelease_n();
    return 10;
  }
  char v48 = sub_10001F550();
  swift_bridgeObjectRelease();
  if (v48) {
    goto LABEL_6;
  }
  if (a1 == 0x6E4F6B6369507369 && a2 == 0xEC0000004E664F65)
  {
    swift_bridgeObjectRelease();
    return 20;
  }
  else
  {
    char v49 = sub_10001F550();
    swift_bridgeObjectRelease();
    if (v49) {
      return 20;
    }
    else {
      return 21;
    }
  }
}

uint64_t sub_100013CE8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x49656C6369747261 && a2 == 0xE900000000000044;
  if (v3 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x496C656E6E616863 && a2 == 0xE900000000000044 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 2036625250 && a2 == 0xE400000000000000 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x446873696C627570 && a2 == 0xEB00000000657461 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x646961507369 && a2 == 0xE600000000000000 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656C646E75427369 && a2 == 0xEC00000064696150 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100025420 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000100025440 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x73694C6369706F74 && a2 == 0xE900000000000074 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000100025460 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x726F697661686562 && a2 == 0xED00007367616C46 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x4972657473756C63 && a2 == 0xE900000000000044 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x69616E626D756874 && a2 == 0xE90000000000006CLL || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x656873696C627570 && a2 == 0xED00006F676F4C72 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100025480 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001000254A0 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x656873696C627570 && a2 == 0xED0000656D614E72 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else if (a1 == 0x74707265637865 && a2 == 0xE700000000000000 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 19;
  }
  else if (a1 == 0x6E4F6B6369507369 && a2 == 0xEC0000004E664F65)
  {
    swift_bridgeObjectRelease();
    return 20;
  }
  else
  {
    char v6 = sub_10001F550();
    swift_bridgeObjectRelease();
    if (v6) {
      return 20;
    }
    else {
      return 21;
    }
  }
}

unint64_t sub_1000144F4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000099DC(&qword_10002E018);
  int v2 = (void *)sub_10001F420();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100014B58(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_100014610(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000099DC(&qword_10002E050);
  uint64_t v2 = sub_10001F420();
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
    sub_100018AAC(v6, (uint64_t)v15);
    unint64_t result = sub_100014BD0((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_1000101E0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
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

uint64_t sub_100014740()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ArticleNotificationClusterIdDeduper()
{
  return self;
}

uint64_t sub_100014774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10002E010 + dword_10002E010);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100014834;
  return v9(a1, a2, a3);
}

uint64_t sub_100014834(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

char *sub_100014938(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000099DC(&qword_10002E060);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      BOOL v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      BOOL v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_100017768(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100014A48(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000099DC(&qword_10002E038);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      BOOL v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      BOOL v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_100017AC8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_100014B58(uint64_t a1, uint64_t a2)
{
  sub_10001F580();
  sub_10001F1E0();
  Swift::Int v4 = sub_10001F5A0();

  return sub_100014C14(a1, a2, v4);
}

unint64_t sub_100014BD0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10001F330(*(void *)(v2 + 40));

  return sub_100014CF8(a1, v4);
}

unint64_t sub_100014C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10001F550() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10001F550() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100014CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100010078(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10001F340();
      sub_10001018C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100014DC0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000099DC(&qword_10002E018);
  char v38 = a2;
  uint64_t v6 = sub_10001F410();
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
  uint64_t v35 = v2;
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10001F580();
    sub_10001F1E0();
    uint64_t result = sub_10001F5A0();
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
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000150D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000099DC(&qword_10002E050);
  uint64_t v6 = sub_10001F410();
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
    uint64_t v22 = (void *)(v5 + 64);
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
      sub_1000101E0((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_100010078(v25, (uint64_t)&v38);
      sub_1000100D4(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_10001F330(*(void *)(v7 + 40));
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
    uint64_t result = (uint64_t)sub_1000101E0(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
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

uint64_t sub_1000153E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000099DC(&qword_10002E048);
  char v36 = a2;
  uint64_t v6 = sub_10001F410();
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
    sub_10001F580();
    sub_10001F1E0();
    uint64_t result = sub_10001F5A0();
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
    long long v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
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
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_100015700(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_1000101E0(a3, (_OWORD *)(a4[7] + 32 * a1));
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

id sub_10001577C()
{
  uint64_t v1 = v0;
  sub_1000099DC(&qword_10002E018);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001F400();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
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

void *sub_100015930()
{
  uint64_t v1 = v0;
  sub_1000099DC(&qword_10002E050);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001F400();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    sub_100010078(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1000100D4(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    id result = sub_1000101E0(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
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

void *sub_100015B18()
{
  uint64_t v1 = v0;
  sub_1000099DC(&qword_10002E048);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001F400();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
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

_OWORD *sub_100015CD0(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_100014BD0(a2);
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
      sub_100015930();
      goto LABEL_7;
    }
    sub_1000150D0(v13, a3 & 1);
    unint64_t v19 = sub_100014BD0(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_100010078(a2, (uint64_t)v21);
      return sub_100015700(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    id result = (_OWORD *)sub_10001F570();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_10000998C((uint64_t)v17);

  return sub_1000101E0(a1, v17);
}

uint64_t sub_100015E1C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100014B58(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100015B18();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000153E8(v15, a4 & 1);
  unint64_t v21 = sub_100014B58(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_10001F570();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100015F8C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100017754(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1000161E8(v6);
  return sub_10001F3D0();
}

void *sub_100016008(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_1000099DC(&qword_10002E038);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_100017218((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100018B14();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_1000160F0(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_1000099DC(&qword_10002E020);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100017418((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10001F3F0();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void sub_1000161E8(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  Swift::Int v5 = sub_10001F540(v4);
  if (v5 < v4)
  {
    if (v4 >= 0) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = v4 + 1;
    }
    if (v4 >= -1)
    {
      Swift::Int v121 = v5;
      uint64_t v117 = a1;
      if (v4 < 2)
      {
        char v9 = (char *)&_swiftEmptyArrayStorage;
        uint64_t v128 = (uint64_t)&_swiftEmptyArrayStorage;
        uint64_t v126 = (void **)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
        if (v4 != 1)
        {
          unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
          if (v12 < 2) {
            goto LABEL_110;
          }
          goto LABEL_98;
        }
      }
      else
      {
        uint64_t v7 = v6 >> 1;
        sub_10000DFA0();
        uint64_t v8 = sub_10001F250();
        *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
        uint64_t v126 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
        uint64_t v128 = v8;
      }
      Swift::Int v10 = 0;
      uint64_t v11 = *a1;
      uint64_t v118 = *a1 - 8;
      uint64_t v119 = *a1 + 16;
      char v9 = (char *)&_swiftEmptyArrayStorage;
      Swift::Int v123 = v4;
      uint64_t v127 = *a1;
      while (1)
      {
        Swift::Int v13 = v10++;
        Swift::Int v124 = v13;
        if (v10 < v4)
        {
          BOOL v14 = *(void **)(v11 + 8 * v13);
          id v15 = *(id *)(v11 + 8 * v10);
          id v16 = v14;
          id v17 = [v15 request];
          id v18 = [v17 content];

          [v18 relevanceScore];
          double v20 = v19;

          id v21 = [v16 request];
          id v22 = [v21 content];

          Swift::Int v4 = v123;
          [v22 relevanceScore];
          double v24 = v23;

          Swift::Int v10 = v13 + 2;
          if (v13 + 2 < v123)
          {
            BOOL v25 = (id *)(v119 + 8 * v13);
            while (1)
            {
              uint64_t v26 = *(v25 - 1);
              id v27 = *v25;
              id v28 = v26;
              id v29 = [v27 request];
              id v30 = [v29 content];

              [v30 relevanceScore];
              double v32 = v31;

              id v33 = [v28 request];
              id v34 = [v33 content];

              [v34 relevanceScore];
              double v36 = v35;

              if (v24 < v20 == v36 >= v32) {
                break;
              }
              ++v10;
              ++v25;
              Swift::Int v4 = v123;
              if (v123 == v10)
              {
                Swift::Int v10 = v123;
                goto LABEL_22;
              }
            }
            Swift::Int v4 = v123;
          }
LABEL_22:
          uint64_t v11 = v127;
          if (v24 < v20)
          {
            if (v10 < v13) {
              goto LABEL_134;
            }
            if (v13 < v10)
            {
              uint64_t v37 = (uint64_t *)(v118 + 8 * v10);
              Swift::Int v38 = v10;
              Swift::Int v39 = v13;
              uint64_t v40 = (uint64_t *)(v127 + 8 * v13);
              do
              {
                if (v39 != --v38)
                {
                  if (!v127) {
                    goto LABEL_139;
                  }
                  uint64_t v41 = *v40;
                  uint64_t *v40 = *v37;
                  *uint64_t v37 = v41;
                }
                ++v39;
                --v37;
                ++v40;
              }
              while (v39 < v38);
            }
          }
        }
        if (v10 < v4)
        {
          if (__OFSUB__(v10, v13)) {
            goto LABEL_132;
          }
          if (v10 - v13 < v121)
          {
            if (__OFADD__(v13, v121)) {
              goto LABEL_135;
            }
            if (v13 + v121 >= v4) {
              Swift::Int v42 = v4;
            }
            else {
              Swift::Int v42 = v13 + v121;
            }
            if (v42 < v13)
            {
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
              break;
            }
            if (v10 != v42)
            {
              uint64_t v120 = v9;
              uint64_t v43 = v118 + 8 * v10;
              Swift::Int v122 = v42;
              do
              {
                char v44 = *(void **)(v11 + 8 * v10);
                Swift::Int v45 = v13;
                uint64_t v125 = v43;
                while (1)
                {
                  char v46 = *(void **)v43;
                  id v47 = v44;
                  id v48 = v46;
                  id v49 = [v47 request];
                  id v50 = [v49 content];

                  [v50 relevanceScore];
                  double v52 = v51;

                  id v53 = [v48 request];
                  id v54 = [v53 content];

                  [v54 relevanceScore];
                  double v56 = v55;

                  if (v56 >= v52) {
                    break;
                  }
                  uint64_t v11 = v127;
                  if (!v127) {
                    goto LABEL_137;
                  }
                  uint64_t v57 = *(void **)v43;
                  char v44 = *(void **)(v43 + 8);
                  *(void *)uint64_t v43 = v44;
                  *(void *)(v43 + 8) = v57;
                  v43 -= 8;
                  if (v10 == ++v45) {
                    goto LABEL_42;
                  }
                }
                uint64_t v11 = v127;
LABEL_42:
                ++v10;
                Swift::Int v13 = v124;
                uint64_t v43 = v125 + 8;
              }
              while (v10 != v122);
              Swift::Int v10 = v122;
              char v9 = v120;
            }
          }
        }
        if (v10 < v13) {
          goto LABEL_127;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v9 = sub_10001704C(0, *((void *)v9 + 2) + 1, 1, v9);
        }
        unint64_t v59 = *((void *)v9 + 2);
        unint64_t v58 = *((void *)v9 + 3);
        unint64_t v12 = v59 + 1;
        uint64_t v11 = v127;
        if (v59 >= v58 >> 1)
        {
          uint64_t v108 = sub_10001704C((char *)(v58 > 1), v59 + 1, 1, v9);
          uint64_t v11 = v127;
          char v9 = v108;
        }
        *((void *)v9 + 2) = v12;
        uint64_t v60 = v9 + 32;
        uint64_t v61 = &v9[16 * v59 + 32];
        *(void *)uint64_t v61 = v13;
        *((void *)v61 + 1) = v10;
        if (v59)
        {
          while (1)
          {
            unint64_t v62 = v12 - 1;
            if (v12 >= 4)
            {
              uint64_t v67 = &v60[16 * v12];
              uint64_t v68 = *((void *)v67 - 8);
              uint64_t v69 = *((void *)v67 - 7);
              BOOL v73 = __OFSUB__(v69, v68);
              uint64_t v70 = v69 - v68;
              if (v73) {
                goto LABEL_116;
              }
              uint64_t v72 = *((void *)v67 - 6);
              uint64_t v71 = *((void *)v67 - 5);
              BOOL v73 = __OFSUB__(v71, v72);
              uint64_t v65 = v71 - v72;
              char v66 = v73;
              if (v73) {
                goto LABEL_117;
              }
              unint64_t v74 = v12 - 2;
              uint64_t v75 = &v60[16 * v12 - 32];
              uint64_t v77 = *(void *)v75;
              uint64_t v76 = *((void *)v75 + 1);
              BOOL v73 = __OFSUB__(v76, v77);
              uint64_t v78 = v76 - v77;
              if (v73) {
                goto LABEL_119;
              }
              BOOL v73 = __OFADD__(v65, v78);
              uint64_t v79 = v65 + v78;
              if (v73) {
                goto LABEL_122;
              }
              if (v79 >= v70)
              {
                v97 = &v60[16 * v62];
                uint64_t v99 = *(void *)v97;
                uint64_t v98 = *((void *)v97 + 1);
                BOOL v73 = __OFSUB__(v98, v99);
                uint64_t v100 = v98 - v99;
                if (v73) {
                  goto LABEL_126;
                }
                BOOL v90 = v65 < v100;
                goto LABEL_86;
              }
            }
            else
            {
              if (v12 != 3)
              {
                uint64_t v91 = *((void *)v9 + 4);
                uint64_t v92 = *((void *)v9 + 5);
                BOOL v73 = __OFSUB__(v92, v91);
                uint64_t v84 = v92 - v91;
                char v85 = v73;
                goto LABEL_80;
              }
              uint64_t v64 = *((void *)v9 + 4);
              uint64_t v63 = *((void *)v9 + 5);
              BOOL v73 = __OFSUB__(v63, v64);
              uint64_t v65 = v63 - v64;
              char v66 = v73;
            }
            if (v66) {
              goto LABEL_118;
            }
            unint64_t v74 = v12 - 2;
            v80 = &v60[16 * v12 - 32];
            uint64_t v82 = *(void *)v80;
            uint64_t v81 = *((void *)v80 + 1);
            BOOL v83 = __OFSUB__(v81, v82);
            uint64_t v84 = v81 - v82;
            char v85 = v83;
            if (v83) {
              goto LABEL_121;
            }
            uint64_t v86 = &v60[16 * v62];
            uint64_t v88 = *(void *)v86;
            uint64_t v87 = *((void *)v86 + 1);
            BOOL v73 = __OFSUB__(v87, v88);
            uint64_t v89 = v87 - v88;
            if (v73) {
              goto LABEL_124;
            }
            if (__OFADD__(v84, v89)) {
              goto LABEL_125;
            }
            if (v84 + v89 >= v65)
            {
              BOOL v90 = v65 < v89;
LABEL_86:
              if (v90) {
                unint64_t v62 = v74;
              }
              goto LABEL_88;
            }
LABEL_80:
            if (v85) {
              goto LABEL_120;
            }
            char v93 = &v60[16 * v62];
            uint64_t v95 = *(void *)v93;
            uint64_t v94 = *((void *)v93 + 1);
            BOOL v73 = __OFSUB__(v94, v95);
            uint64_t v96 = v94 - v95;
            if (v73) {
              goto LABEL_123;
            }
            if (v96 < v84) {
              goto LABEL_14;
            }
LABEL_88:
            unint64_t v101 = v62 - 1;
            if (v62 - 1 >= v12)
            {
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
LABEL_135:
              __break(1u);
              goto LABEL_136;
            }
            if (!v11) {
              goto LABEL_138;
            }
            char v102 = v9;
            v103 = &v60[16 * v101];
            uint64_t v104 = *(void *)v103;
            uint64_t v105 = &v60[16 * v62];
            uint64_t v106 = *((void *)v105 + 1);
            sub_100016C34((void **)(v11 + 8 * *(void *)v103), (id *)(v11 + 8 * *(void *)v105), v11 + 8 * v106, v126);
            if (v1) {
              goto LABEL_110;
            }
            if (v106 < v104) {
              goto LABEL_113;
            }
            if (v62 > *((void *)v102 + 2)) {
              goto LABEL_114;
            }
            *(void *)v103 = v104;
            *(void *)&v60[16 * v101 + 8] = v106;
            unint64_t v107 = *((void *)v102 + 2);
            if (v62 >= v107) {
              goto LABEL_115;
            }
            char v9 = v102;
            unint64_t v12 = v107 - 1;
            memmove(&v60[16 * v62], v105 + 16, 16 * (v107 - 1 - v62));
            *((void *)v102 + 2) = v107 - 1;
            uint64_t v11 = v127;
            if (v107 <= 2) {
              goto LABEL_14;
            }
          }
        }
        unint64_t v12 = 1;
LABEL_14:
        Swift::Int v4 = v123;
        if (v10 >= v123)
        {
          uint64_t v2 = v1;
          if (v12 < 2)
          {
LABEL_110:
            swift_bridgeObjectRelease();
            *(void *)((v128 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
            sub_10001F230();
            swift_bridgeObjectRelease();
            return;
          }
LABEL_98:
          uint64_t v109 = *v117;
          while (1)
          {
            unint64_t v110 = v12 - 2;
            if (v12 < 2) {
              goto LABEL_128;
            }
            if (!v109) {
              goto LABEL_140;
            }
            uint64_t v111 = v9;
            uint64_t v112 = v9 + 32;
            uint64_t v113 = *(void *)&v9[16 * v110 + 32];
            uint64_t v114 = *(void *)&v9[16 * v12 + 24];
            sub_100016C34((void **)(v109 + 8 * v113), (id *)(v109 + 8 * *(void *)&v112[16 * v12 - 16]), v109 + 8 * v114, v126);
            if (v2) {
              goto LABEL_110;
            }
            if (v114 < v113) {
              goto LABEL_129;
            }
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v111 = sub_100017204((uint64_t)v111);
            }
            if (v110 >= *((void *)v111 + 2)) {
              goto LABEL_130;
            }
            uint64_t v115 = &v111[16 * v110 + 32];
            *(void *)uint64_t v115 = v113;
            *((void *)v115 + 1) = v114;
            unint64_t v116 = *((void *)v111 + 2);
            if (v12 > v116) {
              goto LABEL_131;
            }
            char v9 = v111;
            memmove(&v111[16 * v12 + 16], &v111[16 * v12 + 32], 16 * (v116 - v12));
            *((void *)v111 + 2) = v116 - 1;
            unint64_t v12 = v116 - 1;
            if (v116 <= 2) {
              goto LABEL_110;
            }
          }
        }
      }
    }
    sub_10001F3E0();
    __break(1u);
    return;
  }
  if (v4 < 0) {
    goto LABEL_133;
  }
  if (v4) {
    sub_100016AB4(0, v4, 1, a1);
  }
}

void sub_100016AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v22 = *a4;
    uint64_t v4 = *a4 + 8 * a3 - 8;
LABEL_5:
    Swift::Int v5 = *(void **)(v22 + 8 * a3);
    uint64_t v6 = a1;
    uint64_t v21 = v4;
    uint64_t v23 = a3;
    while (1)
    {
      uint64_t v7 = *(void **)v4;
      id v8 = v5;
      id v9 = v7;
      id v10 = [v8 request];
      id v11 = [v10 content];

      [v11 relevanceScore];
      double v13 = v12;

      id v14 = [v9 request];
      id v15 = [v14 content];

      [v15 relevanceScore];
      double v17 = v16;

      if (v17 >= v13)
      {
LABEL_4:
        a3 = v23 + 1;
        uint64_t v4 = v21 + 8;
        if (v23 + 1 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v22) {
        break;
      }
      id v18 = *(void **)v4;
      Swift::Int v5 = *(void **)(v4 + 8);
      *(void *)uint64_t v4 = v5;
      *(void *)(v4 + 8) = v18;
      v4 -= 8;
      if (v23 == ++v6) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_100016C34(void **__src, id *a2, unint64_t a3, void **a4)
{
  uint64_t v4 = a2;
  Swift::Int v5 = __src;
  int64_t v6 = (char *)a2 - (char *)__src;
  int64_t v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v7 = (char *)a2 - (char *)__src;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v10 = a3 - (void)a2;
  }
  uint64_t v11 = v10 >> 3;
  id v50 = __src;
  id v49 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4) {
        memmove(a4, a2, 8 * v11);
      }
      BOOL v25 = (char *)&a4[v11];
      id v48 = v25;
      id v50 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        uint64_t v26 = (id *)(a3 - 8);
        id v27 = v4;
        id v47 = v5;
        do
        {
          uint64_t v43 = (id *)v25;
          Swift::Int v45 = v26 + 1;
          id v29 = (void *)*((void *)v25 - 1);
          v25 -= 8;
          id v28 = v29;
          id v30 = *--v27;
          id v31 = v28;
          id v32 = v30;
          id v33 = [v31 request];
          id v34 = [v33 content];

          [v34 relevanceScore];
          double v36 = v35;

          id v37 = [v32 request];
          id v38 = [v37 content];

          [v38 relevanceScore];
          double v40 = v39;

          if (v40 >= v36)
          {
            id v48 = v25;
            id v27 = v4;
            if (v45 < v43 || v26 >= v43 || v45 != v43) {
              *uint64_t v26 = *(id *)v25;
            }
          }
          else
          {
            BOOL v25 = (char *)v43;
            if (v45 != v4 || v26 >= v4) {
              *uint64_t v26 = *v27;
            }
            id v50 = v27;
          }
          if (v27 <= v47) {
            break;
          }
          --v26;
          uint64_t v4 = v27;
        }
        while (v25 > (char *)a4);
      }
      goto LABEL_42;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4) {
      memmove(a4, __src, 8 * v8);
    }
    char v44 = (char *)&a4[v8];
    id v48 = v44;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      double v12 = a4;
      do
      {
        double v13 = *v12;
        id v14 = *v4;
        id v15 = v13;
        id v16 = [v14 request];
        id v17 = [v16 content];

        [v17 relevanceScore];
        double v19 = v18;

        id v20 = [v15 request];
        id v21 = [v20 content];

        [v21 relevanceScore];
        double v23 = v22;

        if (v23 >= v19)
        {
          if (v5 != v12) {
            void *v5 = *v12;
          }
          id v49 = ++v12;
          double v24 = v4;
        }
        else
        {
          double v24 = v4 + 1;
          if (v5 < v4 || v5 >= v24 || v5 != v4) {
            void *v5 = *v4;
          }
        }
        ++v5;
        if (v12 >= (void **)v44) {
          break;
        }
        uint64_t v4 = v24;
      }
      while ((unint64_t)v24 < a3);
      id v50 = v5;
    }
LABEL_42:
    sub_100017148((void **)&v50, (const void **)&v49, &v48);
    return 1;
  }
  uint64_t result = sub_10001F430();
  __break(1u);
  return result;
}

char *sub_10001704C(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000099DC(&qword_10002E040);
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
  double v13 = v10 + 32;
  id v14 = a4 + 32;
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

char *sub_100017148(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_10001F430();
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

char *sub_100017204(uint64_t a1)
{
  return sub_10001704C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100017218(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    id v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100017418(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10001F3F0();
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
    uint64_t v10 = sub_10001F3F0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000189F0();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_1000099DC(&qword_10002E028);
          int64_t v12 = sub_10001761C(v16, i, a3);
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
    sub_10000DFA0();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_10001F430();
  __break(1u);
  return result;
}

void (*sub_10001761C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000176CC(v6, a2, a3);
  return sub_100017684;
}

void sub_100017684(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1000176CC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_10001F390();
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
    *(void *)uint64_t v3 = v4;
    return sub_10001774C;
  }
  __break(1u);
  return result;
}

void sub_10001774C(id *a1)
{
}

uint64_t sub_100017754(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_100017768(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10001F430();
  __break(1u);
  return result;
}

uint64_t sub_10001785C(void *a1)
{
  id v2 = [a1 categoryIdentifier];
  uint64_t v3 = sub_10001F1D0();
  uint64_t v5 = v4;

  if (v3 == sub_10001F1D0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v8 = sub_10001F550();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      return 0;
    }
  }
  id v9 = [a1 userInfo];
  uint64_t v10 = sub_10001F1A0();

  uint64_t v16 = sub_10001F1D0();
  sub_10001F350();
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_100014BD0((uint64_t)&v17), (v12 & 1) != 0))
  {
    sub_1000100D4(*(void *)(v10 + 56) + 32 * v11, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10001018C((uint64_t)&v17);
  if (!*((void *)&v19 + 1))
  {
    sub_100018A4C((uint64_t)&v18);
LABEL_19:
    long long v18 = 0u;
    long long v19 = 0u;
LABEL_20:
    sub_100018A4C((uint64_t)&v18);
    return 0;
  }
  sub_1000099DC(&qword_10002DD70);
  if ((swift_dynamicCast() & 1) == 0 || !v16) {
    goto LABEL_19;
  }
  sub_10001F1D0();
  sub_10001F350();
  if (*(void *)(v16 + 16) && (unint64_t v13 = sub_100014BD0((uint64_t)&v17), (v14 & 1) != 0))
  {
    sub_1000100D4(*(void *)(v16 + 56) + 32 * v13, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10001018C((uint64_t)&v17);
  if (!*((void *)&v19 + 1)) {
    goto LABEL_20;
  }
  if (swift_dynamicCast()) {
    return v17;
  }
  else {
    return 0;
  }
}

uint64_t sub_100017AC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10001F430();
  __break(1u);
  return result;
}

void sub_100017BBC(id *a1, uint64_t a2, uint64_t a3, void *a4, char **a5, uint64_t *a6)
{
  id v9 = *a1;
  id v10 = [*a1 request];
  id v11 = [v10 content];

  id v12 = [v11 categoryIdentifier];
  uint64_t v13 = sub_10001F1D0();
  uint64_t v15 = v14;

  if (v13 == sub_10001F1D0() && v15 == v16)
  {
    swift_bridgeObjectRelease_n();
LABEL_8:
    id v19 = [v9 request];
    id v20 = [v19 content];

    uint64_t v51 = sub_10001785C(v20);
    uint64_t v22 = v21;

    if (!v22) {
      return;
    }
    if (a3 && (v51 == a2 && v22 == a3 || (sub_10001F550() & 1) != 0))
    {
      id v23 = [v9 request];
      id v24 = [v23 content];

      [v24 relevanceScore];
      double v26 = v25;

      [a4 relevanceScore];
      if (v26 < v27)
      {
        id v28 = [v9 request];
        id v29 = [v28 identifier];

        uint64_t v30 = sub_10001F1D0();
        uint64_t v32 = v31;

        id v33 = *a5;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a5 = v33;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          id v33 = sub_100014A48(0, *((void *)v33 + 2) + 1, 1, v33);
          *a5 = v33;
        }
        unint64_t v36 = *((void *)v33 + 2);
        unint64_t v35 = *((void *)v33 + 3);
        if (v36 >= v35 >> 1)
        {
          id v33 = sub_100014A48((char *)(v35 > 1), v36 + 1, 1, v33);
          *a5 = v33;
        }
        *((void *)v33 + 2) = v36 + 1;
        id v37 = &v33[16 * v36];
        *((void *)v37 + 4) = v30;
        *((void *)v37 + 5) = v32;
      }
    }
    uint64_t v38 = *a6;
    if (*(void *)(*a6 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v39 = sub_100014B58(v51, v22);
      if (v40)
      {
        uint64_t v41 = *(void *)(*(void *)(v38 + 56) + 8 * v39);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        id v42 = v9;
        sub_10001F200();
        if (*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10001F240();
        }
        sub_10001F260();
        sub_10001F230();
        char v43 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v52 = *a6;
        *a6 = 0x8000000000000000;
        sub_100015E1C(v41, v51, v22, v43);
        uint64_t v44 = v52;
        goto LABEL_26;
      }
      swift_bridgeObjectRelease();
    }
    sub_1000099DC(&qword_10002E020);
    uint64_t v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_1000235F0;
    *(void *)(v45 + 32) = v9;
    uint64_t v53 = v45;
    sub_10001F230();
    uint64_t v46 = v53;
    id v47 = v9;
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v54 = *a6;
    *a6 = 0x8000000000000000;
    sub_100015E1C(v46, v51, v22, v48);
    uint64_t v44 = v54;
LABEL_26:
    *a6 = v44;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  char v18 = sub_10001F550();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18) {
    goto LABEL_8;
  }
}

uint64_t sub_100017FF8(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!((unint64_t)*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_10001F3F0();
  swift_bridgeObjectRelease();
  if (v20 < v2) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_10001F3F0();
    swift_bridgeObjectRelease();
    uint64_t v8 = v21 + v5;
    if (!__OFADD__(v21, v5)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if ((unint64_t)*v3 >> 62) {
    goto LABEL_32;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v9 & 0x8000000000000000) != 0
    || (v9 & 0x4000000000000000) != 0
    || (uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8, v8 > *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v9 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      *uint64_t v3 = sub_10001F3A0();
      swift_bridgeObjectRelease();
      uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    sub_10001F3F0();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v12 = v11 + 32;
  uint64_t v13 = (char *)(v11 + 32 + 8 * v4);
  sub_10000DFA0();
  swift_arrayDestroy();
  if (v5)
  {
    if ((unint64_t)*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_10001F3F0();
      swift_bridgeObjectRelease();
      uint64_t v15 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_17:
        if (v15 < 0)
        {
LABEL_42:
          uint64_t result = sub_10001F430();
          __break(1u);
          return result;
        }
        uint64_t v16 = (char *)(v12 + 8 * v2);
        if (v4 != v2 || v13 >= &v16[8 * v15]) {
          memmove(v13, v16, 8 * v15);
        }
        if (!((unint64_t)*v3 >> 62))
        {
          uint64_t v17 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v18 = v17 + v5;
          if (!__OFADD__(v17, v5))
          {
LABEL_23:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v18;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_10001F3F0();
        swift_bridgeObjectRelease();
        uint64_t v18 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v14 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v15 = v14 - v2;
      if (!__OFSUB__(v14, v2)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:

  return sub_10001F230();
}

uint64_t sub_100018304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_100018328, 0, 0);
}

id sub_100018328()
{
  uint64_t v67 = v0;
  uint64_t v60 = v0;
  if ([*(id *)(v0 + 32) scheduledDeliverySetting] != (id)2)
  {
    if (qword_10002DBA0 != -1) {
LABEL_84:
    }
      swift_once();
    uint64_t v14 = (char *)qword_10002F330;
    unint64_t v15 = *(void *)algn_10002F338;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_76:
    double v56 = *(uint64_t (**)(char *, unint64_t))(v60 + 8);
    return (id)v56(v14, v15);
  }
  unint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = sub_10001785C(*(void **)(v0 + 16));
  uint64_t v4 = v3;
  uint64_t v63 = (char *)_swiftEmptyArrayStorage;
  uint64_t v64 = &_swiftEmptyDictionarySingleton;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    id result = (id)sub_10001F3F0();
    uint64_t v5 = (uint64_t)result;
    if (result) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_4:
      if (v5 < 1) {
        goto LABEL_87;
      }
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)(v0 + 24);
      unint64_t v9 = v1 & 0xC000000000000001;
      uint64_t v10 = v8 + 32;
      do
      {
        if (v9)
        {
          uint64_t v11 = v60;
          id v12 = (id)sub_10001F390();
        }
        else
        {
          id v12 = *(id *)(v10 + 8 * v7);
          uint64_t v11 = v60;
        }
        uint64_t v13 = *(void **)(v11 + 16);
        ++v7;
        v66[0] = v12;
        sub_100017BBC(v66, v2, v4, v13, &v63, (uint64_t *)&v64);
      }
      while (v5 != v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = v64;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v16 = &_swiftEmptyDictionarySingleton;
LABEL_15:
  uint64_t v17 = v16 + 64;
  uint64_t v18 = -1;
  uint64_t v19 = -1 << v16[32];
  if (-v19 < 64) {
    uint64_t v18 = ~(-1 << -(char)v19);
  }
  unint64_t v20 = v18 & *((void *)v16 + 8);
  int64_t v21 = (unint64_t)(63 - v19) >> 6;
  swift_bridgeObjectRetain();
  int64_t v22 = 0;
  int64_t v59 = v21;
  if (!v20) {
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v23 = __clz(__rbit64(v20));
  v20 &= v20 - 1;
  for (unint64_t i = v23 | (v22 << 6); ; unint64_t i = __clz(__rbit64(v26)) + (v22 << 6))
  {
    unint64_t v28 = *(void *)(*((void *)v16 + 7) + 8 * i);
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v35 = sub_10001F3F0();
      swift_bridgeObjectRelease();
      if (v35 < 2)
      {
LABEL_34:
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      unint64_t v36 = swift_bridgeObjectRetain();
      id v29 = sub_1000160F0(v36);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v29 = (void *)(v28 & 0xFFFFFFFFFFFFFF8);
      unint64_t v30 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v30 <= 1) {
        goto LABEL_34;
      }
      swift_bridgeObjectRetain();
    }
    v66[0] = v29;
    sub_100015F8C((uint64_t *)v66);
    swift_bridgeObjectRelease();
    unint64_t v31 = (unint64_t)v66[0];
    unint64_t v65 = (unint64_t)v66[0];
    BOOL v32 = (uint64_t)v66[0] < 0 || ((unint64_t)v66[0] & 0x4000000000000000) != 0;
    if (v32)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_10001F3F0();
      id result = (id)swift_release();
      if (!v37) {
        goto LABEL_88;
      }
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_10001F3F0();
      swift_release();
      if (!v38) {
        goto LABEL_82;
      }
    }
    else if (!*((void *)v66[0] + 2))
    {
      goto LABEL_81;
    }
    if ((v31 & 0xC000000000000001) != 0)
    {
      id result = (id)sub_10001F390();
      id v33 = result;
      if (v32) {
        goto LABEL_49;
      }
    }
    else
    {
      if (!*(void *)(v31 + 16)) {
        goto LABEL_83;
      }
      id result = *(id *)(v31 + 32);
      id v33 = result;
      if (v32)
      {
LABEL_49:
        swift_bridgeObjectRetain();
        uint64_t v34 = sub_10001F3F0();
        id result = (id)swift_release();
        if (!v34) {
          goto LABEL_86;
        }
        goto LABEL_58;
      }
    }
    if (!*(void *)(v31 + 16)) {
      goto LABEL_86;
    }
LABEL_58:
    sub_100017FF8(0, 1);

    unint64_t v39 = v65;
    if (v65 >> 62)
    {
      swift_bridgeObjectRetain_n();
      id result = (id)sub_10001F3F0();
      uint64_t v40 = (uint64_t)result;
      if (!result)
      {
LABEL_72:
        swift_bridgeObjectRelease_n();
        goto LABEL_73;
      }
    }
    else
    {
      uint64_t v40 = *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain_n();
      if (!v40) {
        goto LABEL_72;
      }
    }
    if (v40 < 1) {
      break;
    }
    uint64_t v57 = v17;
    unint64_t v58 = v16;
    uint64_t v41 = 0;
    id v42 = v63;
    unint64_t v61 = v39 & 0xC000000000000001;
    int64_t v62 = v22;
    unint64_t v43 = v20;
    unint64_t v44 = v39;
    uint64_t v45 = v40;
    do
    {
      if (v61) {
        id v46 = (id)sub_10001F390();
      }
      else {
        id v46 = *(id *)(v39 + 8 * v41 + 32);
      }
      id v47 = v46;
      id v48 = [v46 request];
      id v49 = [v48 identifier];

      uint64_t v50 = sub_10001F1D0();
      uint64_t v52 = v51;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v42 = sub_100014A48(0, *((void *)v42 + 2) + 1, 1, v42);
      }
      unint64_t v54 = *((void *)v42 + 2);
      unint64_t v53 = *((void *)v42 + 3);
      if (v54 >= v53 >> 1) {
        id v42 = sub_100014A48((char *)(v53 > 1), v54 + 1, 1, v42);
      }
      ++v41;
      *((void *)v42 + 2) = v54 + 1;
      double v55 = &v42[16 * v54];
      *((void *)v55 + 4) = v50;
      *((void *)v55 + 5) = v52;

      int64_t v22 = v62;
      unint64_t v39 = v44;
    }
    while (v45 != v41);
    unint64_t v20 = v43;
    swift_bridgeObjectRelease_n();
    uint64_t v63 = v42;
    uint64_t v17 = v57;
    uint64_t v16 = v58;
LABEL_73:
    int64_t v21 = v59;
    if (v20) {
      goto LABEL_18;
    }
LABEL_19:
    if (__OFADD__(v22++, 1))
    {
      __break(1u);
      goto LABEL_80;
    }
    if (v22 >= v21) {
      goto LABEL_75;
    }
    unint64_t v26 = *(void *)&v17[8 * v22];
    if (!v26)
    {
      int64_t v27 = v22 + 1;
      if (v22 + 1 >= v21) {
        goto LABEL_75;
      }
      unint64_t v26 = *(void *)&v17[8 * v27];
      if (!v26)
      {
        int64_t v27 = v22 + 2;
        if (v22 + 2 >= v21) {
          goto LABEL_75;
        }
        unint64_t v26 = *(void *)&v17[8 * v27];
        if (!v26)
        {
          int64_t v27 = v22 + 3;
          if (v22 + 3 >= v21) {
            goto LABEL_75;
          }
          unint64_t v26 = *(void *)&v17[8 * v27];
          if (!v26)
          {
            int64_t v27 = v22 + 4;
            if (v22 + 4 >= v21)
            {
LABEL_75:
              swift_release();
              uint64_t v14 = v63;
              swift_bridgeObjectRetain();
              unint64_t v15 = sub_1000144F4((uint64_t)_swiftEmptyArrayStorage);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_76;
            }
            unint64_t v26 = *(void *)&v17[8 * v27];
            if (!v26)
            {
              while (1)
              {
                int64_t v22 = v27 + 1;
                if (__OFADD__(v27, 1)) {
                  break;
                }
                if (v22 >= v21) {
                  goto LABEL_75;
                }
                unint64_t v26 = *(void *)&v17[8 * v22];
                ++v27;
                if (v26) {
                  goto LABEL_31;
                }
              }
LABEL_80:
              __break(1u);
LABEL_81:
              __break(1u);
LABEL_82:
              __break(1u);
LABEL_83:
              __break(1u);
              goto LABEL_84;
            }
          }
        }
      }
      int64_t v22 = v27;
    }
LABEL_31:
    unint64_t v20 = (v26 - 1) & v26;
  }
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
  return result;
}

unint64_t sub_1000189F0()
{
  unint64_t result = qword_10002E030;
  if (!qword_10002E030)
  {
    sub_100012E94(&qword_10002E028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E030);
  }
  return result;
}

uint64_t sub_100018A4C(uint64_t a1)
{
  uint64_t v2 = sub_1000099DC(&qword_10002DEA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100018AAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000099DC(&qword_10002E058);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018B14()
{
  return swift_release();
}

void sub_100018B1C(id *a1, uint64_t a2, uint64_t a3, char **a4)
{
  id v7 = *a1;
  id v8 = [*a1 request];
  id v9 = [v8 content];

  id v10 = [v9 categoryIdentifier];
  uint64_t v11 = sub_10001F1D0();
  uint64_t v13 = v12;

  if (v11 == sub_10001F1D0() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v16 = sub_10001F550();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0) {
      return;
    }
  }
  uint64_t v51 = a3;
  uint64_t v50 = a4;
  uint64_t v17 = self;
  id v18 = [v7 request];
  id v19 = [v18 content];

  id v20 = [v19 userInfo];
  sub_10001F1A0();

  Class isa = sub_10001F190().super.isa;
  swift_bridgeObjectRelease();
  unsigned int v22 = [v17 isValidJSONObject:isa];

  if (v22)
  {
    id v23 = [v7 request];
    id v24 = [v23 content];

    id v25 = [v24 userInfo];
    sub_10001F1A0();

    Class v26 = sub_10001F190().super.isa;
    swift_bridgeObjectRelease();
    __src[0] = 0;
    id v27 = [v17 dataWithJSONObject:v26 options:0 error:__src];

    id v28 = __src[0];
    if (!v27)
    {
      BOOL v32 = v28;
      sub_10001F060();

      swift_willThrow();
      goto LABEL_14;
    }
    uint64_t v29 = sub_10001F070();
    unint64_t v31 = v30;

    sub_10000FFC8();
    sub_10001F030();
    if (v4)
    {
      sub_10001001C(v29, v31);
LABEL_14:
      swift_errorRelease();
      return;
    }
    memcpy(__dst, __src, 0x189uLL);
    uint64_t v34 = *(void *)(a3 + 88);
    unint64_t v33 = *(void *)(a3 + 96);
    if (__dst[11] == v34 && __dst[12] == v33)
    {
      sub_100011140((uint64_t)__dst);
    }
    else
    {
      char v35 = sub_10001F550();
      sub_100011140((uint64_t)__dst);
      if ((v35 & 1) == 0)
      {
        sub_10001001C(v29, v31);
        return;
      }
    }
    if (qword_10002DBB0 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_10001F180();
    sub_10000C75C(v36, (uint64_t)qword_10002F358);
    sub_100011004(v51);
    uint64_t v37 = sub_10001F160();
    os_log_type_t v38 = sub_10001F2E0();
    if (os_log_type_enabled(v37, v38))
    {
      unint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      *(_DWORD *)unint64_t v39 = 136315138;
      swift_bridgeObjectRetain();
      sub_100019294(v34, v33, &v52);
      sub_10001F2F0();
      swift_bridgeObjectRelease();
      sub_100011140(v51);
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Removing delivered notification for articleID: %s", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100011140(v51);
    }

    id v40 = [v7 request];
    id v41 = [v40 identifier];

    uint64_t v42 = sub_10001F1D0();
    uint64_t v44 = v43;

    uint64_t v45 = *v50;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id *v50 = v45;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v45 = sub_100014A48(0, *((void *)v45 + 2) + 1, 1, v45);
      id *v50 = v45;
    }
    unint64_t v48 = *((void *)v45 + 2);
    unint64_t v47 = *((void *)v45 + 3);
    if (v48 >= v47 >> 1)
    {
      uint64_t v45 = sub_100014A48((char *)(v47 > 1), v48 + 1, 1, v45);
      id *v50 = v45;
    }
    *((void *)v45 + 2) = v48 + 1;
    id v49 = &v45[16 * v48];
    *((void *)v49 + 4) = v42;
    *((void *)v49 + 5) = v44;
    sub_10001001C(v29, v31);
  }
}

uint64_t sub_10001917C()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ArticleNotificationDeduper()
{
  return self;
}

uint64_t sub_1000191D8(uint64_t a1, uint64_t a2)
{
  id v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_10002E110 + dword_10002E110);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100014834;
  return v7(a1, a2);
}

uint64_t sub_100019294(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100019368(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000100D4((uint64_t)v12, *a3);
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
      sub_1000100D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000998C((uint64_t)v12);
  return v7;
}

uint64_t sub_100019368(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10001F300();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100019524(a5, a6);
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
  uint64_t v8 = sub_10001F3B0();
  if (!v8)
  {
    sub_10001F3E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001F430();
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

uint64_t sub_100019524(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000195BC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001979C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001979C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000195BC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100019734(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001F380();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001F3E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001F1F0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001F430();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001F3E0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100019734(uint64_t a1, uint64_t a2)
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
  sub_1000099DC(&qword_10002E118);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001979C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000099DC(&qword_10002E118);
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
  uint64_t result = sub_10001F430();
  __break(1u);
  return result;
}

uint64_t sub_1000198EC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100017754(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100019968(v6);
  return sub_10001F3D0();
}

void sub_100019968(uint64_t *a1)
{
  uint64_t v136 = sub_10001F0A0();
  uint64_t v2 = *(void *)(v136 - 8);
  uint64_t v3 = __chkstk_darwin(v136);
  v135 = (char *)&v121 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v134 = (char *)&v121 - v5;
  Swift::Int v6 = a1[1];
  Swift::Int v7 = sub_10001F540(v6);
  if (v7 >= v6)
  {
    if (v6 < 0) {
      goto LABEL_134;
    }
    if (v6) {
      sub_10001A2F0(0, v6, 1, a1);
    }
    return;
  }
  if (v6 >= 0) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v6 + 1;
  }
  if (v6 < -1) {
    goto LABEL_142;
  }
  Swift::Int v126 = v7;
  if (v6 < 2)
  {
    size_t v11 = (char *)_swiftEmptyArrayStorage;
    uint64_t v139 = (uint64_t)_swiftEmptyArrayStorage;
    v131 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v6 != 1)
    {
      unint64_t v14 = _swiftEmptyArrayStorage[2];
LABEL_100:
      uint64_t v112 = v132;
      if (v14 >= 2)
      {
        uint64_t v113 = *a1;
        do
        {
          unint64_t v114 = v14 - 2;
          if (v14 < 2) {
            goto LABEL_129;
          }
          if (!v113) {
            goto LABEL_141;
          }
          uint64_t v115 = v11;
          unint64_t v116 = v11 + 32;
          uint64_t v117 = *(void *)&v11[16 * v114 + 32];
          uint64_t v118 = *(void *)&v11[16 * v14 + 24];
          sub_10001A528(v113 + 8 * v117, (id *)(v113 + 8 * *(void *)&v116[16 * v14 - 16]), (id *)(v113 + 8 * v118), v131);
          if (v112) {
            break;
          }
          if (v118 < v117) {
            goto LABEL_130;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v115 = sub_100017204((uint64_t)v115);
          }
          if (v114 >= *((void *)v115 + 2)) {
            goto LABEL_131;
          }
          uint64_t v119 = &v115[16 * v114 + 32];
          *(void *)uint64_t v119 = v117;
          *((void *)v119 + 1) = v118;
          unint64_t v120 = *((void *)v115 + 2);
          if (v14 > v120) {
            goto LABEL_132;
          }
          size_t v11 = v115;
          memmove(&v115[16 * v14 + 16], &v115[16 * v14 + 32], 16 * (v120 - v14));
          *((void *)v115 + 2) = v120 - 1;
          unint64_t v14 = v120 - 1;
        }
        while (v120 > 2);
      }
LABEL_111:
      swift_bridgeObjectRelease();
      *(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_10001F230();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v9 = v8 >> 1;
    sub_10000DFA0();
    uint64_t v10 = sub_10001F250();
    *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    v131 = (void **)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v139 = v10;
  }
  uint64_t v12 = 0;
  uint64_t v13 = *a1;
  v133 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v124 = v13 + 16;
  Swift::Int v122 = a1;
  uint64_t v123 = v13 - 8;
  size_t v11 = (char *)_swiftEmptyArrayStorage;
  uint64_t v129 = v6;
  uint64_t v137 = v13;
  while (1)
  {
    uint64_t v15 = v12;
    Swift::Int v16 = v12 + 1;
    uint64_t v128 = v12;
    if (v12 + 1 < v6)
    {
      uint64_t v17 = *(void **)(v13 + 8 * v12);
      id v18 = *(id *)(v13 + 8 * v16);
      id v19 = v17;
      id v20 = [v18 date];
      int64_t v21 = v134;
      sub_10001F090();

      id v22 = [v19 date];
      id v23 = v135;
      sub_10001F090();

      LODWORD(v138) = sub_10001F080();
      id v24 = *v133;
      id v25 = v23;
      uint64_t v26 = v136;
      (*v133)(v25, v136);
      v24(v21, v26);

      Swift::Int v6 = v129;
      Swift::Int v16 = v15 + 2;
      if (v15 + 2 < v6)
      {
        uint64_t v125 = v11;
        id v27 = (id *)(v124 + 8 * v15);
        while (1)
        {
          id v28 = *(v27 - 1);
          id v29 = *v27;
          id v30 = v28;
          id v31 = [v29 date];
          BOOL v32 = v134;
          sub_10001F090();

          id v33 = [v30 date];
          uint64_t v34 = v135;
          sub_10001F090();

          LODWORD(v33) = sub_10001F080();
          char v35 = v34;
          uint64_t v36 = v136;
          v24(v35, v136);
          v24(v32, v36);

          if ((v138 ^ v33)) {
            break;
          }
          ++v27;
          Swift::Int v6 = v129;
          if (v129 == ++v16)
          {
            Swift::Int v16 = v129;
            size_t v11 = v125;
            goto LABEL_22;
          }
        }
        size_t v11 = v125;
        Swift::Int v6 = v129;
LABEL_22:
        uint64_t v15 = v128;
      }
      uint64_t v13 = v137;
      if (v138)
      {
        if (v16 < v15) {
          goto LABEL_135;
        }
        if (v15 < v16)
        {
          uint64_t v37 = (uint64_t *)(v123 + 8 * v16);
          Swift::Int v38 = v16;
          uint64_t v39 = v15;
          id v40 = (uint64_t *)(v137 + 8 * v15);
          do
          {
            if (v39 != --v38)
            {
              if (!v13) {
                goto LABEL_140;
              }
              uint64_t v41 = *v40;
              uint64_t *v40 = *v37;
              *uint64_t v37 = v41;
            }
            ++v39;
            --v37;
            ++v40;
          }
          while (v39 < v38);
        }
      }
    }
    if (v16 >= v6) {
      goto LABEL_50;
    }
    if (__OFSUB__(v16, v15)) {
      goto LABEL_133;
    }
    if (v16 - v15 >= v126) {
      goto LABEL_50;
    }
    if (__OFADD__(v15, v126)) {
      goto LABEL_136;
    }
    Swift::Int v42 = v15 + v126 >= v6 ? v6 : v15 + v126;
    if (v42 < v15) {
      break;
    }
    if (v16 != v42)
    {
      uint64_t v125 = v11;
      uint64_t v43 = v123 + 8 * v16;
      Swift::Int v127 = v42;
      do
      {
        uint64_t v44 = *(void **)(v13 + 8 * v16);
        uint64_t v45 = v15;
        uint64_t v130 = v43;
        while (1)
        {
          Swift::Int v46 = v16;
          unint64_t v47 = *(void **)v43;
          id v48 = v44;
          id v138 = v48;
          id v49 = v47;
          id v50 = [v48 date];
          uint64_t v51 = v134;
          sub_10001F090();

          id v52 = [v49 date];
          unint64_t v53 = v135;
          sub_10001F090();

          LOBYTE(v52) = sub_10001F080();
          unint64_t v54 = *v133;
          double v55 = v53;
          uint64_t v56 = v136;
          (*v133)(v55, v136);
          v54(v51, v56);

          if ((v52 & 1) == 0) {
            break;
          }
          uint64_t v13 = v137;
          if (!v137) {
            goto LABEL_138;
          }
          Swift::Int v16 = v46;
          uint64_t v57 = *(void **)v43;
          uint64_t v44 = *(void **)(v43 + 8);
          *(void *)uint64_t v43 = v44;
          *(void *)(v43 + 8) = v57;
          v43 -= 8;
          if (v46 == ++v45) {
            goto LABEL_43;
          }
        }
        uint64_t v13 = v137;
        Swift::Int v16 = v46;
LABEL_43:
        ++v16;
        uint64_t v43 = v130 + 8;
        uint64_t v15 = v128;
      }
      while (v16 != v127);
      Swift::Int v16 = v127;
      size_t v11 = v125;
    }
LABEL_50:
    if (v16 < v15) {
      goto LABEL_128;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v138 = (id)v16;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      size_t v11 = sub_10001704C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v60 = *((void *)v11 + 2);
    unint64_t v59 = *((void *)v11 + 3);
    unint64_t v14 = v60 + 1;
    uint64_t v13 = v137;
    if (v60 >= v59 >> 1)
    {
      uint64_t v111 = sub_10001704C((char *)(v59 > 1), v60 + 1, 1, v11);
      uint64_t v13 = v137;
      size_t v11 = v111;
    }
    *((void *)v11 + 2) = v14;
    unint64_t v61 = v11 + 32;
    int64_t v62 = &v11[16 * v60 + 32];
    id v63 = v138;
    *(void *)int64_t v62 = v15;
    *((void *)v62 + 1) = v63;
    if (v60)
    {
      while (1)
      {
        unint64_t v64 = v14 - 1;
        if (v14 >= 4)
        {
          uint64_t v69 = &v61[16 * v14];
          uint64_t v70 = *((void *)v69 - 8);
          uint64_t v71 = *((void *)v69 - 7);
          BOOL v75 = __OFSUB__(v71, v70);
          uint64_t v72 = v71 - v70;
          if (v75) {
            goto LABEL_117;
          }
          uint64_t v74 = *((void *)v69 - 6);
          uint64_t v73 = *((void *)v69 - 5);
          BOOL v75 = __OFSUB__(v73, v74);
          uint64_t v67 = v73 - v74;
          char v68 = v75;
          if (v75) {
            goto LABEL_118;
          }
          unint64_t v76 = v14 - 2;
          uint64_t v77 = &v61[16 * v14 - 32];
          uint64_t v79 = *(void *)v77;
          uint64_t v78 = *((void *)v77 + 1);
          BOOL v75 = __OFSUB__(v78, v79);
          uint64_t v80 = v78 - v79;
          if (v75) {
            goto LABEL_120;
          }
          BOOL v75 = __OFADD__(v67, v80);
          uint64_t v81 = v67 + v80;
          if (v75) {
            goto LABEL_123;
          }
          if (v81 >= v72)
          {
            uint64_t v99 = &v61[16 * v64];
            uint64_t v101 = *(void *)v99;
            uint64_t v100 = *((void *)v99 + 1);
            BOOL v75 = __OFSUB__(v100, v101);
            uint64_t v102 = v100 - v101;
            if (v75) {
              goto LABEL_127;
            }
            BOOL v92 = v67 < v102;
            goto LABEL_87;
          }
        }
        else
        {
          if (v14 != 3)
          {
            uint64_t v93 = *((void *)v11 + 4);
            uint64_t v94 = *((void *)v11 + 5);
            BOOL v75 = __OFSUB__(v94, v93);
            uint64_t v86 = v94 - v93;
            char v87 = v75;
            goto LABEL_81;
          }
          uint64_t v66 = *((void *)v11 + 4);
          uint64_t v65 = *((void *)v11 + 5);
          BOOL v75 = __OFSUB__(v65, v66);
          uint64_t v67 = v65 - v66;
          char v68 = v75;
        }
        if (v68) {
          goto LABEL_119;
        }
        unint64_t v76 = v14 - 2;
        uint64_t v82 = &v61[16 * v14 - 32];
        uint64_t v84 = *(void *)v82;
        uint64_t v83 = *((void *)v82 + 1);
        BOOL v85 = __OFSUB__(v83, v84);
        uint64_t v86 = v83 - v84;
        char v87 = v85;
        if (v85) {
          goto LABEL_122;
        }
        uint64_t v88 = &v61[16 * v64];
        uint64_t v90 = *(void *)v88;
        uint64_t v89 = *((void *)v88 + 1);
        BOOL v75 = __OFSUB__(v89, v90);
        uint64_t v91 = v89 - v90;
        if (v75) {
          goto LABEL_125;
        }
        if (__OFADD__(v86, v91)) {
          goto LABEL_126;
        }
        if (v86 + v91 >= v67)
        {
          BOOL v92 = v67 < v91;
LABEL_87:
          if (v92) {
            unint64_t v64 = v76;
          }
          goto LABEL_89;
        }
LABEL_81:
        if (v87) {
          goto LABEL_121;
        }
        uint64_t v95 = &v61[16 * v64];
        uint64_t v97 = *(void *)v95;
        uint64_t v96 = *((void *)v95 + 1);
        BOOL v75 = __OFSUB__(v96, v97);
        uint64_t v98 = v96 - v97;
        if (v75) {
          goto LABEL_124;
        }
        if (v98 < v86) {
          goto LABEL_14;
        }
LABEL_89:
        unint64_t v103 = v64 - 1;
        if (v64 - 1 >= v14)
        {
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
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
          goto LABEL_137;
        }
        if (!v13) {
          goto LABEL_139;
        }
        uint64_t v104 = v11;
        uint64_t v105 = &v61[16 * v103];
        uint64_t v106 = *(void *)v105;
        unint64_t v107 = &v61[16 * v64];
        uint64_t v108 = *((void *)v107 + 1);
        uint64_t v109 = v132;
        sub_10001A528(v13 + 8 * *(void *)v105, (id *)(v13 + 8 * *(void *)v107), (id *)(v13 + 8 * v108), v131);
        uint64_t v132 = v109;
        if (v109) {
          goto LABEL_111;
        }
        if (v108 < v106) {
          goto LABEL_114;
        }
        if (v64 > *((void *)v104 + 2)) {
          goto LABEL_115;
        }
        *(void *)uint64_t v105 = v106;
        *(void *)&v61[16 * v103 + 8] = v108;
        unint64_t v110 = *((void *)v104 + 2);
        if (v64 >= v110) {
          goto LABEL_116;
        }
        size_t v11 = v104;
        unint64_t v14 = v110 - 1;
        memmove(&v61[16 * v64], v107 + 16, 16 * (v110 - 1 - v64));
        *((void *)v104 + 2) = v110 - 1;
        uint64_t v13 = v137;
        if (v110 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v14 = 1;
LABEL_14:
    Swift::Int v6 = v129;
    uint64_t v12 = (uint64_t)v138;
    if ((uint64_t)v138 >= v129)
    {
      a1 = v122;
      goto LABEL_100;
    }
  }
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  sub_10001F3E0();
  __break(1u);
}

void sub_10001A2F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v30 = a1;
  uint64_t v35 = sub_10001F0A0();
  uint64_t v7 = __chkstk_darwin(v35);
  uint64_t v34 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v33 = (char *)&v28 - v10;
  uint64_t v29 = a2;
  if (a3 != a2)
  {
    uint64_t v11 = *a4;
    uint64_t v32 = v9 + 8;
    uint64_t v36 = v11;
    uint64_t v12 = v11 + 8 * a3 - 8;
    uint64_t v13 = (void (**)(char *, uint64_t))(v9 + 8);
LABEL_5:
    unint64_t v14 = *(void **)(v36 + 8 * a3);
    uint64_t v15 = v30;
    uint64_t v31 = v12;
    while (1)
    {
      Swift::Int v16 = *(void **)v12;
      id v17 = v14;
      id v37 = v17;
      id v18 = v16;
      id v19 = [v17 date];
      id v20 = v33;
      sub_10001F090();

      id v21 = [v18 date];
      id v22 = v34;
      sub_10001F090();

      LOBYTE(v21) = sub_10001F080();
      uint64_t v23 = a3;
      id v24 = *v13;
      id v25 = v22;
      uint64_t v26 = v35;
      (*v13)(v25, v35);
      v24(v20, v26);
      a3 = v23;

      if ((v21 & 1) == 0)
      {
LABEL_4:
        a3 = v23 + 1;
        uint64_t v12 = v31 + 8;
        if (v23 + 1 == v29) {
          return;
        }
        goto LABEL_5;
      }
      if (!v36) {
        break;
      }
      id v27 = *(void **)v12;
      unint64_t v14 = *(void **)(v12 + 8);
      *(void *)uint64_t v12 = v14;
      *(void *)(v12 + 8) = v27;
      v12 -= 8;
      if (v23 == ++v15) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_10001A528(uint64_t a1, id *a2, id *a3, void **a4)
{
  uint64_t v57 = sub_10001F0A0();
  uint64_t v8 = *(void *)(v57 - 8);
  uint64_t v9 = __chkstk_darwin(v57);
  uint64_t v56 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v54 = a3;
  double v55 = (char *)&v48 - v12;
  uint64_t v13 = (uint64_t)a2 - a1;
  uint64_t v14 = v13 / 8;
  uint64_t v15 = a2;
  uint64_t v16 = (char *)a3 - (char *)a2;
  uint64_t v17 = v16 / 8;
  unint64_t v61 = v11;
  unint64_t v60 = a4;
  unint64_t v58 = v11;
  if (v13 / 8 >= v16 / 8)
  {
    if (v16 < -7) {
      goto LABEL_41;
    }
    if (a4 != v15 || &v15[v17] <= a4)
    {
      memmove(a4, v15, 8 * v17);
      uint64_t v11 = v58;
    }
    uint64_t v31 = &a4[v17];
    unint64_t v59 = v31;
    unint64_t v61 = v15;
    if (v16 < 8 || v11 >= v15) {
      goto LABEL_40;
    }
    id v49 = (void (**)(char *, uint64_t))(v8 + 8);
    id v50 = a4;
    uint64_t v32 = v54 - 1;
    id v33 = v15;
    while (1)
    {
      unint64_t v54 = v15;
      id v52 = v31;
      unint64_t v53 = v32 + 1;
      uint64_t v35 = v31 - 1;
      uint64_t v36 = *--v33;
      id v37 = *(v31 - 1);
      id v51 = v37;
      id v38 = v36;
      id v39 = [v37 date];
      id v40 = v55;
      sub_10001F090();

      id v41 = [v38 date];
      Swift::Int v42 = v56;
      sub_10001F090();

      LOBYTE(v41) = sub_10001F080();
      uint64_t v43 = *v49;
      uint64_t v44 = v42;
      uint64_t v45 = v57;
      (*v49)(v44, v57);
      v43(v40, v45);

      if (v41) {
        break;
      }
      unint64_t v59 = v35;
      if (v53 < v52 || v32 >= v52)
      {
        id *v32 = *v35;
        id v33 = v54;
        uint64_t v31 = v35;
        goto LABEL_28;
      }
      unint64_t v46 = (unint64_t)v50;
      uint64_t v34 = v58;
      id v33 = v54;
      if (v53 != v52) {
        id *v32 = *v35;
      }
      uint64_t v31 = v35;
      if ((unint64_t)v35 <= v46) {
        goto LABEL_40;
      }
LABEL_29:
      --v32;
      uint64_t v15 = v33;
      if (v33 <= v34) {
        goto LABEL_40;
      }
    }
    uint64_t v31 = v52;
    if (v53 != v54 || v32 >= v54) {
      id *v32 = *v33;
    }
    unint64_t v61 = v33;
LABEL_28:
    uint64_t v34 = v58;
    if (v31 <= v50) {
      goto LABEL_40;
    }
    goto LABEL_29;
  }
  if (v13 >= -7)
  {
    if (a4 != v11 || &v11[v14] <= a4)
    {
      memmove(a4, v58, 8 * v14);
      uint64_t v11 = v58;
    }
    unint64_t v53 = &a4[v14];
    unint64_t v59 = v53;
    if (v13 >= 8 && v15 < v54)
    {
      id v52 = (void **)(v8 + 8);
      id v18 = v55;
      do
      {
        unint64_t v58 = v11;
        id v19 = *a4;
        id v20 = *v15;
        id v21 = v19;
        id v22 = a4;
        id v23 = [v20 date];
        sub_10001F090();

        id v24 = [v21 date];
        id v25 = v56;
        sub_10001F090();

        LOBYTE(v24) = sub_10001F080();
        uint64_t v26 = (void (*)(char *, uint64_t))*v52;
        id v27 = v25;
        uint64_t v28 = v57;
        ((void (*)(char *, uint64_t))*v52)(v27, v57);
        v26(v18, v28);

        if (v24)
        {
          a4 = v22;
          unint64_t v29 = (unint64_t)(v15 + 1);
          uint64_t v30 = v58;
          if (v58 < v15 || (unint64_t)v58 >= v29 || v58 != v15) {
            *unint64_t v58 = *v15;
          }
        }
        else
        {
          uint64_t v30 = v58;
          if (v58 != v22) {
            *unint64_t v58 = *v22;
          }
          a4 = v22 + 1;
          unint64_t v60 = v22 + 1;
          unint64_t v29 = (unint64_t)v15;
        }
        uint64_t v11 = v30 + 1;
        unint64_t v61 = v11;
        if (a4 >= v53) {
          break;
        }
        uint64_t v15 = (id *)v29;
      }
      while (v29 < (unint64_t)v54);
    }
LABEL_40:
    sub_100017148((void **)&v61, (const void **)&v60, &v59);
    return 1;
  }
LABEL_41:
  uint64_t result = sub_10001F430();
  __break(1u);
  return result;
}

uint64_t sub_10001AA38(uint64_t a1, uint64_t a2)
{
  v3[154] = v2;
  v3[153] = a2;
  v3[152] = a1;
  return _swift_task_switch(sub_10001AA60, 0, 0);
}

uint64_t sub_10001AA60()
{
  uint64_t v18 = v0;
  id v1 = [*(id *)(v0 + 1216) userInfo];
  uint64_t v2 = sub_10001F1A0();

  sub_10000F8B0(v2, v0 + 816);
  swift_bridgeObjectRelease();
  sub_10001AD20(v0 + 816, v0 + 416);
  if (sub_10001AD88(v0 + 416) == 1)
  {
    if (qword_10002DBA0 != -1) {
      swift_once();
    }
    uint64_t v3 = (char *)qword_10002F330;
    unint64_t v4 = *(void *)algn_10002F338;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_22;
  }
  uint64_t v5 = *(void *)(v0 + 1224);
  memcpy((void *)(v0 + 16), (const void *)(v0 + 416), 0x189uLL);
  uint64_t v16 = (char *)_swiftEmptyArrayStorage;
  if (v5 < 0 || (v5 & 0x4000000000000000) != 0)
  {
    unint64_t v14 = swift_bridgeObjectRetain();
    Swift::Int v6 = sub_1000160F0(v14);
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::Int v6 = (void *)(v5 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  v17[0] = v6;
  sub_1000198EC((uint64_t *)v17);
  id v7 = v17[0];
  if (((unint64_t)v17[0] & 0x8000000000000000) != 0 || ((unint64_t)v17[0] & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t result = sub_10001F3F0();
    uint64_t v8 = result;
    if (result) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v8 = *((void *)v17[0] + 2);
    uint64_t result = swift_retain();
    if (v8)
    {
LABEL_11:
      if (v8 < 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v10 = 0;
      do
      {
        if (((unint64_t)v7 & 0xC000000000000001) != 0) {
          id v11 = (id)sub_10001F390();
        }
        else {
          id v11 = *((id *)v7 + v10 + 4);
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)(v0 + 1232);
        ++v10;
        v17[0] = v11;
        sub_100018B1C(v17, v13, v0 + 16, &v16);
      }
      while (v8 != v10);
      swift_release_n();
      uint64_t v3 = v16;
      goto LABEL_21;
    }
  }
  swift_release_n();
  uint64_t v3 = (char *)_swiftEmptyArrayStorage;
LABEL_21:
  sub_10001ADA0((uint64_t *)(v0 + 816));
  unint64_t v4 = sub_1000144F4((uint64_t)_swiftEmptyArrayStorage);
LABEL_22:
  uint64_t v15 = *(uint64_t (**)(char *, unint64_t))(v0 + 8);
  return v15(v3, v4);
}

uint64_t sub_10001AD20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000099DC(&qword_10002DE88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001AD88(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t *sub_10001ADA0(uint64_t *a1)
{
  return a1;
}

uint64_t sub_10001AE44(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10001B064()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10001F160();
  os_log_type_t v3 = sub_10001F2C0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "MarketingNotificationService serviceExtensionTimeWillExpire called.", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = *(void (**)(void))(v1
                        + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler);
  if (v5)
  {
    Swift::Int v6 = *(void **)(v1
                  + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent);
    if (v6)
    {
      sub_10001B36C((uint64_t)v5);
      id v7 = v6;
      v5();

      sub_10001B37C((uint64_t)v5);
    }
  }
}

uint64_t sub_10001B1B0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_logger;
  uint64_t v2 = sub_10001F180();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10001B37C(*(void *)(v0
                          + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent));
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10001B274()
{
  return type metadata accessor for MarketingNotificationService();
}

uint64_t type metadata accessor for MarketingNotificationService()
{
  uint64_t result = qword_10002E160;
  if (!qword_10002E160) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001B2C8()
{
  uint64_t result = sub_10001F180();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001B36C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10001B37C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_10001B38C(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  id v7 = (uint64_t (**)(uint64_t))(a2
                                        + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler);
  uint64_t v8 = *(void *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler);
  void *v7 = sub_10001B924;
  v7[1] = (uint64_t (*)(uint64_t))v6;
  _Block_copy(a3);
  sub_10001B37C(v8);
  swift_retain();
  uint64_t v9 = &selRef_bannerImageForWhiteBackground;
  id v10 = [a1 content];
  [v10 mutableCopy];

  sub_10001F310();
  swift_unknownObjectRelease();
  sub_10001B92C();
  int v11 = swift_dynamicCast();
  uint64_t v12 = v40;
  if (!v11) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(void **)(a2
                 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent);
  *(void *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent) = v12;

  id v14 = a1;
  uint64_t v15 = sub_10001F160();
  os_log_type_t v16 = sub_10001F2E0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v38 = v6;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315138;
    id v18 = [v14 content];
    id v19 = [v18 title];

    uint64_t v20 = sub_10001F1D0();
    id v21 = a3;
    unint64_t v23 = v22;

    uint64_t v40 = sub_100019294(v20, v23, aBlock);
    sub_10001F2F0();

    a3 = v21;
    uint64_t v9 = &selRef_bannerImageForWhiteBackground;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "MarketingNotificationService didReceive request with title: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v38;
    swift_slowDealloc();
  }
  else
  {
  }
  id v24 = self;
  unsigned int v25 = [v24 shouldHandleServiceExtensionNotificationRequest:v14];
  uint64_t v26 = sub_10001F160();
  if (v25)
  {
    os_log_type_t v27 = sub_10001F2E0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "MarketingNotificationService removing any scheduled paid bundle local notifications", v28, 2u);
      swift_slowDealloc();
    }

    id v29 = [self currentNotificationCenter];
    sub_1000099DC(&qword_10002E038);
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_1000232B0;
    *(void *)(v30 + 32) = sub_10001F1D0();
    *(void *)(v30 + 40) = v31;
    Class isa = sub_10001F210().super.isa;
    swift_bridgeObjectRelease();
    [v29 removePendingNotificationRequestsWithIdentifiers:isa];

    id v33 = [self bag];
    aBlock[4] = (uint64_t)sub_10001B924;
    aBlock[5] = v6;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10001C5EC;
    aBlock[3] = (uint64_t)&unk_1000295A8;
    uint64_t v34 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v24 handleServiceExtensionNotificationRequest:v14 bag:v33 withContentHandler:v34];
    _Block_release(v34);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    os_log_type_t v35 = sub_10001F2C0();
    if (os_log_type_enabled(v26, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v35, "MarketingNotificationService didReceive request that AMSUserNotification should not handle.", v36, 2u);
      swift_slowDealloc();
    }

    id v37 = [v14 v9[10]];
    ((void (**)(void, id))a3)[2](a3, v37);
    swift_release();
  }
}

uint64_t sub_10001B8EC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001B924(uint64_t a1)
{
  return sub_10001C654(a1, *(void *)(v1 + 16));
}

unint64_t sub_10001B92C()
{
  unint64_t result = qword_10002E1F8;
  if (!qword_10002E1F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002E1F8);
  }
  return result;
}

uint64_t sub_10001B96C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001B97C()
{
  return swift_release();
}

uint64_t sub_10001B984@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10001F0C0();
  uint64_t v19 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = *(void **)(a1 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_sharedDefaults);
  NSString v8 = sub_10001F1C0();
  id v9 = [v7 dataForKey:v8];

  if (v9)
  {
    uint64_t v10 = sub_10001F070();
    unint64_t v12 = v11;

    sub_10001C594();
    sub_10001F030();
    sub_10001001C(v10, v12);
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(a2, v6, v4);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(a2, 0, 1, v4);
  }
  else
  {
    uint64_t v13 = sub_10001F160();
    os_log_type_t v14 = sub_10001F2E0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Could not find notification settings data in defaults", v15, 2u);
      swift_slowDealloc();
    }

    os_log_type_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    return v16(a2, 1, 1, v4);
  }
}

uint64_t sub_10001BD78()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_logger;
  uint64_t v2 = sub_10001F180();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_sharedDefaults));
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10001BE30()
{
  return type metadata accessor for UnwantedNotificationReporter();
}

uint64_t type metadata accessor for UnwantedNotificationReporter()
{
  uint64_t result = qword_10002E238;
  if (!qword_10002E238) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001BE84()
{
  uint64_t result = sub_10001F180();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001BF30(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10002E2D8 + dword_10002E2D8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100014834;
  return v5(a1);
}

uint64_t sub_10001BFE0(uint64_t a1)
{
  v2[204] = v1;
  v2[203] = a1;
  sub_1000099DC(&qword_10002E2E0);
  v2[205] = swift_task_alloc();
  uint64_t v3 = sub_10001F0C0();
  v2[206] = v3;
  v2[207] = *(void *)(v3 - 8);
  v2[208] = swift_task_alloc();
  return _swift_task_switch(sub_10001C0D4, 0, 0);
}

uint64_t sub_10001C0D4()
{
  uint64_t v25 = v0;
  if (!NFInternalBuild()) {
    goto LABEL_5;
  }
  id v1 = [*(id *)(v0 + 1624) userInfo];
  uint64_t v2 = sub_10001F1A0();

  sub_10000F8B0(v2, v0 + 416);
  sub_10001AD20(v0 + 416, v0 + 816);
  swift_bridgeObjectRelease();
  sub_10001AD20(v0 + 416, v0 + 16);
  if (sub_10001AD88(v0 + 16) == 1) {
    goto LABEL_5;
  }
  uint64_t v3 = *(void *)(v0 + 1656);
  uint64_t v4 = *(void *)(v0 + 1648);
  uint64_t v5 = *(void *)(v0 + 1640);
  uint64_t v7 = *(void *)(v0 + 248);
  unint64_t v6 = *(void *)(v0 + 256);
  sub_10001B984(*(void *)(v0 + 1632), v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4) == 1)
  {
    uint64_t v8 = *(void *)(v0 + 1640);
    sub_10001ADA0((uint64_t *)(v0 + 416));
    sub_10001C534(v8);
LABEL_5:
    if (qword_10002DBA0 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_10002F330;
    uint64_t v9 = *(void *)algn_10002F338;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 1656) + 32))(*(void *)(v0 + 1664), *(void *)(v0 + 1640), *(void *)(v0 + 1648));
  uint64_t v13 = *(void *)(sub_10001F0B0() + 16);
  swift_bridgeObjectRelease();
  if (v13)
  {
    sub_10001ADA0((uint64_t *)(v0 + 416));
  }
  else
  {
    sub_10001AD20(v0 + 816, v0 + 1216);
    sub_100011004(v0 + 1216);
    os_log_type_t v14 = sub_10001F160();
    os_log_type_t v15 = sub_10001F2C0();
    if (os_log_type_enabled(v14, v15))
    {
      os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v16 = 136446210;
      if (v6)
      {
        unint64_t v17 = v6;
      }
      else
      {
        uint64_t v7 = 0x6E776F6E6B6E75;
        unint64_t v17 = 0xE700000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1616) = sub_100019294(v7, v17, &v24);
      sub_10001F2F0();
      swift_bridgeObjectRelease();
      sub_10001ADA0((uint64_t *)(v0 + 416));
      sub_10001ADA0((uint64_t *)(v0 + 416));
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "User not expecting this notification identifier=%{public}s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_10001ADA0((uint64_t *)(v0 + 416));
      sub_10001ADA0((uint64_t *)(v0 + 416));
    }
    uint64_t v18 = sub_10001F160();
    os_log_type_t v19 = sub_10001F2D0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "User not expecting to receive notifications", v20, 2u);
      swift_slowDealloc();
    }
  }
  if (qword_10002DBA0 != -1) {
    swift_once();
  }
  uint64_t v21 = *(void *)(v0 + 1664);
  uint64_t v22 = *(void *)(v0 + 1648);
  uint64_t v10 = qword_10002F330;
  uint64_t v9 = *(void *)algn_10002F338;
  unint64_t v23 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1656) + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23(v21, v22);
LABEL_8:
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v11(v10, v9);
}

uint64_t sub_10001C534(uint64_t a1)
{
  uint64_t v2 = sub_1000099DC(&qword_10002E2E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001C594()
{
  unint64_t result = qword_10002E2E8;
  if (!qword_10002E2E8)
  {
    sub_10001F0C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E2E8);
  }
  return result;
}

void sub_10001C5EC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10001C654(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_10001C66C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  swift_beginAccess();
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    *(void *)&Strong[OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService] = 0;

    swift_unknownObjectRelease();
  }
  return a3(a1);
}

id sub_10001C79C()
{
  id v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_services;
  sub_1000099DC(&qword_10002E020);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100023730;
  id v5 = objc_allocWithZone((Class)FRArticleNotificationService);
  unint64_t v6 = v1;
  *(void *)(v4 + 32) = [v5 init];
  type metadata accessor for MarketingNotificationService();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_logger;
  if (qword_10002DBB8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001F180();
  uint64_t v10 = sub_10000C75C(v9, (uint64_t)qword_10002F370);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7 + v8, v10, v9);
  unint64_t v11 = (void *)(v7 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler);
  *unint64_t v11 = 0;
  v11[1] = 0;
  *(void *)(v7 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent) = 0;
  *(void *)(v4 + 40) = v7;
  uint64_t v14 = v4;
  sub_10001F230();
  *(void *)&v6[v3] = v4;
  *(void *)&v6[OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService] = 0;

  v13.receiver = v6;
  v13.super_class = ObjectType;
  return [super init];
}

uint64_t type metadata accessor for NewsNotificationService()
{
  return self;
}

void *sub_10001C9CC(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10001F3F0();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      uint64_t v5 = 4;
      do
      {
        uint64_t v6 = v5 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v7 = (void *)sub_10001F390();
          BOOL v8 = __OFADD__(v6, 1);
          uint64_t v9 = v5 - 3;
          if (v8) {
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v7 = *(void **)(a1 + 8 * v5);
          swift_unknownObjectRetain();
          BOOL v8 = __OFADD__(v6, 1);
          uint64_t v9 = v5 - 3;
          if (v8)
          {
LABEL_14:
            __break(1u);
            goto LABEL_15;
          }
        }
        if ([v7 supportsHandling:a2])
        {
          swift_bridgeObjectRelease();
          return v7;
        }
        swift_unknownObjectRelease();
        ++v5;
      }
      while (v9 != v4);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_10001CAE8(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  _Block_copy(a3);
  id v7 = a1;
  unint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = sub_10001C9CC(v8, (uint64_t)v7);
  swift_bridgeObjectRelease();

  if (v9)
  {
    *(void *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService) = v9;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    uint64_t v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v11 = (void *)swift_allocObject();
    v11[2] = v10;
    v11[3] = sub_10001CEC8;
    void v11[4] = v6;
    aBlock[4] = (uint64_t)sub_10001CF54;
    aBlock[5] = (uint64_t)v11;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10001C5EC;
    aBlock[3] = (uint64_t)&unk_100029658;
    unint64_t v12 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v9 didReceive:v7 withContentHandler:v12];
    _Block_release(v12);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    *(void *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService) = 0;
    swift_unknownObjectRelease();
    if (qword_10002DBA8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10001F180();
    sub_10000C75C(v13, (uint64_t)qword_10002F340);
    id v14 = v7;
    os_log_type_t v15 = sub_10001F160();
    os_log_type_t v16 = sub_10001F2C0();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v17 = 136446210;
      id v18 = [v14 identifier];
      uint64_t v19 = sub_10001F1D0();
      unint64_t v21 = v20;

      uint64_t aBlock[6] = sub_100019294(v19, v21, aBlock);
      sub_10001F2F0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Unable to service notification request: %{public}s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v22 = [v14 content];
    ((void (**)(void, id))a3)[2](a3, v22);
    swift_release();
  }
}

uint64_t sub_10001CE90()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001CEC8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10001CEDC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001CF14()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001CF54(uint64_t a1)
{
  return sub_10001C66C(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_10001CF60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001CF70()
{
  return swift_release();
}

uint64_t destroy for APS()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for APS(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for APS(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for APS(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for APS(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for APS(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APS(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APS()
{
  return &type metadata for APS;
}

uint64_t sub_10001D27C(char a1, char a2)
{
  if (*(void *)&aAlert_2[8 * a1] == *(void *)&aAlert_2[8 * a2]
    && *(void *)&aMutableThreadI[8 * a1 + 16] == *(void *)&aMutableThreadI[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_10001F550();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_10001D304()
{
  return sub_10001F5A0();
}

uint64_t sub_10001D370()
{
  sub_10001F1E0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001D3C4()
{
  return sub_10001F5A0();
}

uint64_t sub_10001D42C(char a1)
{
  if (a1) {
    return 2036625250;
  }
  else {
    return 0x656C746974;
  }
}

uint64_t sub_10001D458(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a4;
  v12[1] = a5;
  uint64_t v7 = sub_1000099DC(&qword_10002E378);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009948(a1, a1[3]);
  sub_10001E740();
  sub_10001F5C0();
  char v14 = 0;
  sub_10001F500();
  if (!v5)
  {
    char v13 = 1;
    sub_10001F4C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10001D5CC()
{
  return sub_10001D42C(*v0);
}

uint64_t sub_10001D5D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001DA7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001D5FC(uint64_t a1)
{
  unint64_t v2 = sub_10001E740();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001D638(uint64_t a1)
{
  unint64_t v2 = sub_10001E740();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001D674@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10001DB50(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_10001D6A4(void *a1)
{
  return sub_10001D458(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_10001D6C4(char a1)
{
  return *(void *)&aAlert_2[8 * a1];
}

uint64_t sub_10001D6E4(void *a1)
{
  char v3 = v1;
  uint64_t v5 = sub_1000099DC(&qword_10002E340);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100009948(a1, a1[3]);
  sub_10001E1D0();
  sub_10001F5C0();
  long long v9 = v3[1];
  long long v12 = *v3;
  long long v13 = v9;
  v11[15] = 0;
  sub_10001E278();
  sub_10001F520();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_10001F500();
    LOBYTE(v12) = 2;
    sub_10001F500();
    LOBYTE(v12) = 3;
    sub_10001F510();
    LOBYTE(v12) = 4;
    sub_10001F500();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001D8D4(char *a1, char *a2)
{
  return sub_10001D27C(*a1, *a2);
}

Swift::Int sub_10001D8E0()
{
  return sub_10001D304();
}

uint64_t sub_10001D8E8()
{
  return sub_10001D370();
}

Swift::Int sub_10001D8F0()
{
  return sub_10001D3C4();
}

uint64_t sub_10001D8F8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10001DD58(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10001D928@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001D6C4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10001D954()
{
  return sub_10001D6C4(*v0);
}

uint64_t sub_10001D95C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001DD58(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001D984(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10001D990(uint64_t a1)
{
  unint64_t v2 = sub_10001E1D0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001D9CC(uint64_t a1)
{
  unint64_t v2 = sub_10001E1D0();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10001DA08@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10001DDA4(a1, v7);
  if (!v2)
  {
    long long v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(void *)(a2 + 80) = v8;
    double result = *(double *)v7;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10001DA64(void *a1)
{
  return sub_10001D6E4(a1);
}

uint64_t sub_10001DA7C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (sub_10001F550() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 2036625250 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10001F550();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10001DB50(void *a1)
{
  uint64_t v3 = sub_1000099DC(&qword_10002E368);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  sub_100009948(a1, a1[3]);
  sub_10001E740();
  sub_10001F5B0();
  if (v1)
  {
    sub_10000998C((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_10001F490();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_10001F450();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    sub_10000998C((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_10001DD58(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100029050;
  v6._object = a2;
  unint64_t v4 = sub_10001F440(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_10001DDA4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_1000099DC(&qword_10002E328);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009948(a1, a1[3]);
  sub_10001E1D0();
  sub_10001F5B0();
  if (v2) {
    return sub_10000998C((uint64_t)a1);
  }
  char v39 = 0;
  sub_10001E224();
  sub_10001F4B0();
  uint64_t v9 = v36;
  uint64_t v32 = v35;
  id v33 = a2;
  uint64_t v10 = v38;
  uint64_t v31 = v37;
  LOBYTE(v35) = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_10001F490();
  uint64_t v34 = v12;
  uint64_t v28 = v11;
  LOBYTE(v35) = 2;
  swift_bridgeObjectRetain();
  uint64_t v30 = 0;
  uint64_t v27 = sub_10001F490();
  LOBYTE(v35) = 3;
  uint64_t v14 = v13;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10001F4A0();
  uint64_t v29 = v14;
  uint64_t v26 = v15;
  LOBYTE(v35) = 4;
  uint64_t v16 = sub_10001F490();
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v30 = v16;
  v19(v8, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v20 = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000998C((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v21 = v29;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v23 = v33;
  *id v33 = v32;
  v23[1] = v9;
  v23[2] = v31;
  v23[3] = v10;
  void v23[4] = v28;
  v23[5] = v20;
  v23[6] = v27;
  v23[7] = v21;
  uint64_t v24 = v30;
  v23[8] = v26;
  v23[9] = v24;
  v23[10] = v18;
  return result;
}

unint64_t sub_10001E1D0()
{
  unint64_t result = qword_10002E330;
  if (!qword_10002E330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E330);
  }
  return result;
}

unint64_t sub_10001E224()
{
  unint64_t result = qword_10002E338;
  if (!qword_10002E338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E338);
  }
  return result;
}

unint64_t sub_10001E278()
{
  unint64_t result = qword_10002E348;
  if (!qword_10002E348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E348);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for APS.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for APS.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001E428);
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

ValueMetadata *type metadata accessor for APS.CodingKeys()
{
  return &type metadata for APS.CodingKeys;
}

uint64_t destroy for APS.Alert()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for APS.Alert(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for APS.Alert(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for APS.Alert(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for APS.Alert(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for APS.Alert(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for APS.Alert(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for APS.Alert()
{
  return &type metadata for APS.Alert;
}

unint64_t sub_10001E63C()
{
  unint64_t result = qword_10002E350;
  if (!qword_10002E350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E350);
  }
  return result;
}

unint64_t sub_10001E694()
{
  unint64_t result = qword_10002E358;
  if (!qword_10002E358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E358);
  }
  return result;
}

unint64_t sub_10001E6EC()
{
  unint64_t result = qword_10002E360;
  if (!qword_10002E360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E360);
  }
  return result;
}

unint64_t sub_10001E740()
{
  unint64_t result = qword_10002E370;
  if (!qword_10002E370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E370);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for APS.Alert.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x10001E860);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APS.Alert.CodingKeys()
{
  return &type metadata for APS.Alert.CodingKeys;
}

unint64_t sub_10001E89C()
{
  unint64_t result = qword_10002E380;
  if (!qword_10002E380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E380);
  }
  return result;
}

unint64_t sub_10001E8F4()
{
  unint64_t result = qword_10002E388;
  if (!qword_10002E388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E388);
  }
  return result;
}

unint64_t sub_10001E94C()
{
  unint64_t result = qword_10002E390;
  if (!qword_10002E390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E390);
  }
  return result;
}

uint64_t sub_10001E9A0(uint64_t a1)
{
  return sub_10001EA6C(a1, qword_10002F340);
}

uint64_t sub_10001E9C0(uint64_t a1)
{
  return sub_10001EA6C(a1, qword_10002F358);
}

uint64_t *sub_10001E9E4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10001EA48(uint64_t a1)
{
  return sub_10001EA6C(a1, qword_10002F370);
}

uint64_t sub_10001EA6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001F180();
  sub_10001E9E4(v3, a2);
  sub_10000C75C(v3, (uint64_t)a2);
  return sub_10001F170();
}

void sub_10001EAE4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"feedPersonalizerFactory"];
  *(_DWORD *)buf = 136315906;
  unint64_t v2 = "-[FRArticleNotificationPersonalizer initWithAppConfigurationManager:feedPersonalizerFactory:]";
  __int16 v3 = 2080;
  unsigned int v4 = "FRArticleNotificationPersonalizer.m";
  __int16 v5 = 1024;
  sub_100004854();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10001EBC4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"appConfigurationManager"];
  *(_DWORD *)buf = 136315906;
  unint64_t v2 = "-[FRArticleNotificationPersonalizer initWithAppConfigurationManager:feedPersonalizerFactory:]";
  __int16 v3 = 2080;
  unsigned int v4 = "FRArticleNotificationPersonalizer.m";
  __int16 v5 = 1024;
  sub_100004854();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10001ECA4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"cachesDirectory"];
  *(_DWORD *)buf = 136315906;
  unint64_t v2 = "-[FRArticleNotificationArticleSource initWithCachesDirectory:]";
  __int16 v3 = 2080;
  unsigned int v4 = "FRArticleNotificationArticleSource.m";
  __int16 v5 = 1024;
  sub_100004854();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10001ED84()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "fetchCompletion != nil"];
  *(_DWORD *)buf = 136315906;
  unint64_t v2 = "-[FRArticleNotificationArticleSource fetchArticleWithID:completion:]";
  __int16 v3 = 2080;
  unsigned int v4 = "FRArticleNotificationArticleSource.m";
  __int16 v5 = 1024;
  sub_100004854();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10001EE68()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "fetchCompletion != nil"];
  *(_DWORD *)buf = 136315906;
  unint64_t v2 = "-[FRArticleNotificationServiceArticleSource fetchAssetsWithCachesDirectory:thumbnailURLString:publisherLogoURLStr"
       "ing:publisherLogoMaskURLString:publisherLogoCompactURLString:flintDocumentURLString:completion:]";
  __int16 v3 = 2080;
  unsigned int v4 = "FRArticleNotificationServiceArticleSource.m";
  __int16 v5 = 1024;
  sub_100004854();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10001EF4C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "cachesDirectory != nil"];
  *(_DWORD *)buf = 136315906;
  unint64_t v2 = "-[FRArticleNotificationServiceArticleSource fetchAssetsWithCachesDirectory:thumbnailURLString:publisherLogoURLStr"
       "ing:publisherLogoMaskURLString:publisherLogoCompactURLString:flintDocumentURLString:completion:]";
  __int16 v3 = 2080;
  unsigned int v4 = "FRArticleNotificationServiceArticleSource.m";
  __int16 v5 = 1024;
  sub_100004854();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

uint64_t sub_10001F030()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_10001F040()
{
  return JSONDecoder.init()();
}

uint64_t sub_10001F050()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_10001F060()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10001F070()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F080()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_10001F090()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F0A0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10001F0B0()
{
  return NotificationSettingsData.tagIDs.getter();
}

uint64_t sub_10001F0C0()
{
  return type metadata accessor for NotificationSettingsData();
}

uint64_t sub_10001F0D0()
{
  return NewsAppConfigurationManager.init(appConfigurationManager:transform:)();
}

uint64_t sub_10001F0E0()
{
  return type metadata accessor for NewsAppConfigurationManager();
}

uint64_t sub_10001F0F0()
{
  return Configuration.init(articleEmbeddingsScoringState:clientSideEngagementBoostEnabled:fallbackToReverseChronSorting:newsTabiPersonalizationState:personalizationTreatment:statelessPersonalizationState:extensionStatelessPersonalizationState:publisherDampeningConfig:shadowPublisherDampeningConfig:statelessPersonalizationPublisherFavorability:personalizationAnalyticsEnabled:tabiTagScoringEnabled:tabiCohortMembershipsEnabled:aggregatesInXavierEnabled:aggregatesInExtensionsXavierEnabled:tabiScoringInExtensionsEnabled:)();
}

uint64_t sub_10001F100()
{
  return XavierScoringService.__allocating_init(aggregateStore:configurationManager:translationProvider:todayPrivateData:)();
}

uint64_t sub_10001F110()
{
  return type metadata accessor for XavierScoringService();
}

uint64_t sub_10001F120()
{
  return dispatch thunk of ConfigurationManagerType.onChangeOfConfiguration(perform:)();
}

uint64_t sub_10001F130()
{
  return dispatch thunk of ConfigurationManagerType.fetchConfigurationIfNeeded(cachedOnly:)();
}

uint64_t sub_10001F140()
{
  return dispatch thunk of ConfigurationManagerType.configuration.getter();
}

uint64_t sub_10001F150()
{
  return ConfigurationManagerType.fetchConfigurationIfNeeded()();
}

uint64_t sub_10001F160()
{
  return Logger.logObject.getter();
}

uint64_t sub_10001F170()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001F180()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_10001F190()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10001F1A0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F1B0()
{
  return Dictionary.description.getter();
}

NSString sub_10001F1C0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001F1D0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F1E0()
{
  return String.hash(into:)();
}

Swift::Int sub_10001F1F0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10001F200()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10001F210()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10001F220()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F230()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10001F240()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10001F250()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10001F260()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10001F270()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10001F280()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t sub_10001F2A0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10001F2B0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10001F2C0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001F2D0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10001F2E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10001F2F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001F300()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10001F310()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10001F320()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_10001F330(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10001F340()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10001F350()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10001F360()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10001F370()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001F380()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001F390()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10001F3A0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10001F3B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001F3D0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10001F3E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001F3F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10001F400()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10001F410()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001F420()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10001F430()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10001F440(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10001F450()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10001F460()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10001F470()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10001F480()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10001F490()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10001F4A0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10001F4B0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10001F4C0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10001F4D0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10001F4E0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10001F4F0()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10001F500()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10001F510()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10001F520()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_10001F540(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10001F550()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001F560()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001F570()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001F580()
{
  return Hasher.init(_seed:)();
}

void sub_10001F590(Swift::UInt a1)
{
}

Swift::Int sub_10001F5A0()
{
  return Hasher._finalize()();
}

uint64_t sub_10001F5B0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10001F5C0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return _FCDispatchQueueForQualityOfService();
}

uint64_t FCPerformIfNonNil()
{
  return _FCPerformIfNonNil();
}

uint64_t FCURLForAppConfigurationMirror()
{
  return _FCURLForAppConfigurationMirror();
}

uint64_t FCURLForTodayDropbox()
{
  return _FCURLForTodayDropbox();
}

uint64_t FCURLForTodayPrivateDataTransactionQueue()
{
  return _FCURLForTodayPrivateDataTransactionQueue();
}

uint64_t NFInternalBuild()
{
  return _NFInternalBuild();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_URLWithString_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:relativeToURL:];
}

id objc_msgSend__cleanupFilesInDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanupFilesInDirectory:");
}

id objc_msgSend__downloadFileURL_toDirectory_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadFileURL:toDirectory:withCompletion:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_appConfigurationManager(void *a1, const char *a2, ...)
{
  return _[a1 appConfigurationManager];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_articleController(void *a1, const char *a2, ...)
{
  return _[a1 articleController];
}

id objc_msgSend_articleSource(void *a1, const char *a2, ...)
{
  return _[a1 articleSource];
}

id objc_msgSend_articleWithID_qualityOfService_relativePriority_(void *a1, const char *a2, ...)
{
  return [a1 articleWithID:];
}

id objc_msgSend_assetHandle(void *a1, const char *a2, ...)
{
  return _[a1 assetHandle];
}

id objc_msgSend_attachmentWithIdentifier_URL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 attachmentWithIdentifier:URL:options:error:];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _[a1 attachments];
}

id objc_msgSend_bannerImageForMask(void *a1, const char *a2, ...)
{
  return _[a1 bannerImageForMask];
}

id objc_msgSend_bannerImageForWhiteBackground(void *a1, const char *a2, ...)
{
  return _[a1 bannerImageForWhiteBackground];
}

id objc_msgSend_baselineAggregateWithConfigurableValues_(void *a1, const char *a2, ...)
{
  return [a1 baselineAggregateWithConfigurableValues:];
}

id objc_msgSend_bestAttemptContent(void *a1, const char *a2, ...)
{
  return _[a1 bestAttemptContent];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_bundleChannelIDs(void *a1, const char *a2, ...)
{
  return _[a1 bundleChannelIDs];
}

id objc_msgSend_bundleSubscription(void *a1, const char *a2, ...)
{
  return _[a1 bundleSubscription];
}

id objc_msgSend_bundleSubscriptionProvider(void *a1, const char *a2, ...)
{
  return _[a1 bundleSubscriptionProvider];
}

id objc_msgSend_cachesDirectory(void *a1, const char *a2, ...)
{
  return _[a1 cachesDirectory];
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 containerURLForSecurityApplicationGroupIdentifier:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentContext(void *a1, const char *a2, ...)
{
  return _[a1 contentContext];
}

id objc_msgSend_contentHandler(void *a1, const char *a2, ...)
{
  return _[a1 contentHandler];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 copyItemAtURL:toURL:error:];
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
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_criticalAlertSetting(void *a1, const char *a2, ...)
{
  return _[a1 criticalAlertSetting];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 currentNotificationCenter];
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfURL:];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_decayFactor(void *a1, const char *a2, ...)
{
  return _[a1 decayFactor];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfiguration];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_derivedPersonalizationData(void *a1, const char *a2, ...)
{
  return _[a1 derivedPersonalizationData];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_downloadIfNeededWithGroup_(void *a1, const char *a2, ...)
{
  return [a1 downloadIfNeededWithGroup:];
}

id objc_msgSend_downloadTaskWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 downloadTaskWithURL:completionHandler:];
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return [a1 earlierDate:];
}

id objc_msgSend_enableFlushingWithFlushingThreshold_(void *a1, const char *a2, ...)
{
  return [a1 enableFlushingWithFlushingThreshold:];
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtPath:];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_feedPersonalizerFactory(void *a1, const char *a2, ...)
{
  return _[a1 feedPersonalizerFactory];
}

id objc_msgSend_fetchAppConfigurationIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAppConfigurationIfNeededWithCompletion:");
}

id objc_msgSend_fetchAssetsWithCachesDirectory_thumbnailURLString_publisherLogoURLString_publisherLogoMaskURLString_publisherLogoCompactURLString_flintDocumentURLString_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchAssetsWithCachesDirectory:thumbnailURLString:publisherLogoURLString:publisherLogoMaskURLString:publisherLogoCompactURLString:flintDocumentURLString:completion:];
}

id objc_msgSend_fileAttributes(void *a1, const char *a2, ...)
{
  return _[a1 fileAttributes];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return _[a1 filePath];
}

id objc_msgSend_finalizeContent_(void *a1, const char *a2, ...)
{
  return [a1 finalizeContent:];
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return _[a1 headline];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 imageWithContentsOfFile:];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 imageWithRenderingMode:];
}

id objc_msgSend_initWithAggregates_scoringType_decayRate_(void *a1, const char *a2, ...)
{
  return [a1 initWithAggregates:scoringType:decayRate:];
}

id objc_msgSend_initWithAppConfigurationManager_feedPersonalizerFactory_(void *a1, const char *a2, ...)
{
  return [a1 initWithAppConfigurationManager:feedPersonalizerFactory:];
}

id objc_msgSend_initWithArticlePayload_sourceChannel_assetManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithArticlePayload:sourceChannel:assetManager:];
}

id objc_msgSend_initWithConfiguration_configurationManager_contentHostDirectory_networkBehaviorMonitor_networkReachability_desiredHeadlineFieldOptions_feedUsage_assetKeyManagerDelegate_appActivityMonitor_backgroundTaskable_pptContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:");
}

id objc_msgSend_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithContextConfiguration:];
}

id objc_msgSend_initWithDropbox_transactionQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDropbox:transactionQueue:];
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileURL:];
}

id objc_msgSend_initWithFileURL_storefrontID_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileURL:storefrontID:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithGenerator_(void *a1, const char *a2, ...)
{
  return [a1 initWithGenerator:];
}

id objc_msgSend_initWithItems_baselineClickThroughRate_todayData_(void *a1, const char *a2, ...)
{
  return [a1 initWithItems:baselineClickThroughRate:todayData:];
}

id objc_msgSend_initWithThumbnailImage_title_shortExcerpt_publishDate_publisherName_publisherLogoImage_publisherLogoMaskImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:];
}

id objc_msgSend_initWithTranslationProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithTranslationProvider:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interruptionLevel(void *a1, const char *a2, ...)
{
  return _[a1 interruptionLevel];
}

id objc_msgSend_isBundlePaid(void *a1, const char *a2, ...)
{
  return _[a1 isBundlePaid];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isPaid(void *a1, const char *a2, ...)
{
  return _[a1 isPaid];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return _[a1 isPaired];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_newFeedPersonalizerWithAggregateStore_appConfigurationManager_todayPrivateData_(void *a1, const char *a2, ...)
{
  return [a1 newFeedPersonalizerWithAggregateStore:appConfigurationManager:todayPrivateData:];
}

id objc_msgSend_notificationArrived_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 notificationArrived:completionHandler:];
}

id objc_msgSend_notificationAttachmentsWithThumbnailFileURL_publisherLogoFileURL_publisherLogoMaskFileURL_publisherLogoCompactFileURL_isKettleDigestEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationAttachmentsWithThumbnailFileURL:publisherLogoFileURL:publisherLogoMaskFileURL:publisherLogoCompactFileURL:isKettleDigestEnabled:");
}

id objc_msgSend_notificationScoringConfig(void *a1, const char *a2, ...)
{
  return _[a1 notificationScoringConfig];
}

id objc_msgSend_notificationSettings(void *a1, const char *a2, ...)
{
  return _[a1 notificationSettings];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performBlockWhenFullyLoaded_(void *a1, const char *a2, ...)
{
  return [a1 performBlockWhenFullyLoaded:];
}

id objc_msgSend_personalizationScore(void *a1, const char *a2, ...)
{
  return _[a1 personalizationScore];
}

id objc_msgSend_personalizationTreatment(void *a1, const char *a2, ...)
{
  return _[a1 personalizationTreatment];
}

id objc_msgSend_personalizationValueWithBaseline_decayRate_(void *a1, const char *a2, ...)
{
  return [a1 personalizationValueWithBaseline:decayRate:];
}

id objc_msgSend_personalizer(void *a1, const char *a2, ...)
{
  return _[a1 personalizer];
}

id objc_msgSend_postProcessCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 postProcessCoordinator];
}

id objc_msgSend_prepareForUseWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 prepareForUseWithCompletionHandler:];
}

id objc_msgSend_processDidReceiveSingleArticleNotificationRequest_withContentHandler_(void *a1, const char *a2, ...)
{
  return [a1 processDidReceiveSingleArticleNotificationRequest:withContentHandler:];
}

id objc_msgSend_publishDate(void *a1, const char *a2, ...)
{
  return _[a1 publishDate];
}

id objc_msgSend_purchaseProvider(void *a1, const char *a2, ...)
{
  return _[a1 purchaseProvider];
}

id objc_msgSend_purchasedTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 purchasedTagIDs];
}

id objc_msgSend_readPrivateDataSyncWithAccessor_(void *a1, const char *a2, ...)
{
  return [a1 readPrivateDataSyncWithAccessor:];
}

id objc_msgSend_relevanceScore(void *a1, const char *a2, ...)
{
  return _[a1 relevanceScore];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:error:];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_scheduledDeliverySetting(void *a1, const char *a2, ...)
{
  return _[a1 scheduledDeliverySetting];
}

id objc_msgSend_scoreProfiles(void *a1, const char *a2, ...)
{
  return _[a1 scoreProfiles];
}

id objc_msgSend_setArticleSource_(void *a1, const char *a2, ...)
{
  return [a1 setArticleSource:];
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return [a1 setAttachments:];
}

id objc_msgSend_setBestAttemptContent_(void *a1, const char *a2, ...)
{
  return [a1 setBestAttemptContent:];
}

id objc_msgSend_setContentHandler_(void *a1, const char *a2, ...)
{
  return [a1 setContentHandler:];
}

id objc_msgSend_setLoadedArticle_(void *a1, const char *a2, ...)
{
  return [a1 setLoadedArticle:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setRelevanceScore_(void *a1, const char *a2, ...)
{
  return [a1 setRelevanceScore:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_sharedAccount(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccount];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return _[a1 sharedNetworkReachability];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _[a1 sharedSession];
}

id objc_msgSend_shortExcerpt(void *a1, const char *a2, ...)
{
  return _[a1 shortExcerpt];
}

id objc_msgSend_sortItems_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortItems:completion:");
}

id objc_msgSend_sortItems_options_configurationSet_(void *a1, const char *a2, ...)
{
  return [a1 sortItems:options:configurationSet:];
}

id objc_msgSend_sourceChannel(void *a1, const char *a2, ...)
{
  return _[a1 sourceChannel];
}

id objc_msgSend_sourceName(void *a1, const char *a2, ...)
{
  return _[a1 sourceName];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_supportedContentStoreFrontID(void *a1, const char *a2, ...)
{
  return _[a1 supportedContentStoreFrontID];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return _[a1 theme];
}

id objc_msgSend_thumbnailAssetHandle(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailAssetHandle];
}

id objc_msgSend_thumbnailHQ(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailHQ];
}

id objc_msgSend_timeSensitiveSetting(void *a1, const char *a2, ...)
{
  return _[a1 timeSensitiveSetting];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_unregister(void *a1, const char *a2, ...)
{
  return _[a1 unregister];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}