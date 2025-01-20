id sub_100005AB8(id a1, TFResolver *a2)
{
  void *v2;
  uint64_t vars8;

  v2 = objc_opt_new();

  return v2;
}

void sub_100005BF4(id a1)
{
  if (NFInternalBuild())
  {
    id v2 = +[FRPPTContext sharedContext];
    if ([v2 isRunningPPT])
    {
      byte_1000EE158 = 0;
    }
    else
    {
      v1 = +[NSBundle fr_feldsparInternalExtrasBundle];
      byte_1000EE158 = v1 != 0;
    }
  }
  else
  {
    byte_1000EE158 = 0;
  }
}

uint64_t FeldsparInternalExtrasEnabled()
{
  if (qword_1000EE150 != -1) {
    dispatch_once(&qword_1000EE150, &stru_1000C9448);
  }
  return byte_1000EE158;
}

void sub_100005E7C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000068EC;
  v2[3] = &unk_1000C6E28;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 fetchMappingResourcesWithCompletionHandler:v2];
}

void sub_100005F50(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autoFavoritesQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000BB3C;
  v3[3] = &unk_1000C7458;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  [v2 enqueueBlock:v3];
}

void sub_100005FE8(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_100018D48((uint64_t)v2, v3);
  }
}

FCPuzzleDownloadServiceType *__cdecl sub_10000603C(id a1, TFResolver *a2)
{
  id v2 = [(TFResolver *)a2 resolveProtocol:&OBJC_PROTOCOL___FCContentContext];
  id v3 = [objc_alloc((Class)FCPuzzleDownloadService) initWithContext:v2];

  return (FCPuzzleDownloadServiceType *)v3;
}

void sub_100006314(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) performWithPrivateDataContext:*(void *)(a1 + 40) v7];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10000650C(id a1)
{
  v1 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Did finish loading the storefront", v2, 2u);
  }
}

void sub_100006614(id a1)
{
  id v3 = +[UIDevice currentDevice];
  uint64_t v1 = [v3 systemVersion];
  id v2 = (void *)qword_1000EDF80;
  qword_1000EDF80 = v1;
}

void sub_1000066BC(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  id v3 = (uint64_t *)(a1 + 32);
  unsigned int v4 = [v2 fileExistsAtPath:*(void *)(a1 + 32)];

  if (v4)
  {
    CFTypeRef cf = 0;
    CFArrayRef ImagesFromPath = (const __CFArray *)CPBitmapCreateImagesFromPath();
    CFArrayRef v6 = ImagesFromPath;
    if (ImagesFromPath && CFArrayGetCount(ImagesFromPath) >= 1)
    {
      long long v7 = [0 objectForKeyedSubscript:@"FRImageScaleKey"];
      ValueAtIndex = CFArrayGetValueAtIndex(v6, 0);
      [v7 floatValue];
      uint64_t v10 = +[UIImage imageWithCGImage:ValueAtIndex scale:0 orientation:v9];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else
    {
      v13 = (void *)FCDefaultLog;
      if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
        sub_10007A0F8(v3, (__CFError **)&cf, v13);
      }
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v6) {
      CFRelease(v6);
    }
  }
}

FRNewsBridgeDeeplinkRouter *sub_10000680C(uint64_t a1)
{
  id v2 = [FRNewsBridgeDeeplinkRouter alloc];
  id v3 = +[UIApplication sharedApplication];
  unsigned int v4 = [(FRNewsBridgeDeeplinkRouter *)v2 initWithApplication:v3 bridgedAppDelegate:*(void *)(a1 + 32)];

  return v4;
}

void sub_1000068EC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v1 = FCPersonalizationLog;
  if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Did fetch mapping resources", v2, 2u);
  }
}

id sub_100006A40(uint64_t a1)
{
  id v2 = objc_alloc((Class)NTPBPublisherFavorabilityScores);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"favorability_scores"];
  id v4 = [v2 initWithData:v3];

  id v5 = [objc_alloc((Class)FCPersonalizationFavorabilityScores) initWithPBFavorabilityScores:v4];

  return v5;
}

void sub_100006D30(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100018BEC();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void, void))(v4 + 16))(v4, 0, 0, 0);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  CFArrayRef v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

id sub_100006DC0(uint64_t a1)
{
  id v2 = objc_alloc((Class)NTPBURLMapping);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"url_mapping"];
  id v4 = [v2 initWithData:v3];

  id v5 = [objc_alloc((Class)FCPersonalizationURLMapping) initWithPBURLMapping:v4];

  return v5;
}

FREditorialItemCreator *__cdecl sub_100006EE0(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [FREditorialItemCreator alloc];
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemThumbnailCreator];

  id v5 = [(FREditorialItemCreator *)v3 initWithThumbnailCreator:v4];

  return v5;
}

id sub_100006FE4(uint64_t a1)
{
  id v2 = objc_alloc((Class)NTPBPersonalizationWhitelist);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"whitelist"];
  id v4 = [v2 initWithData:v3];

  id v5 = [objc_alloc((Class)FCPersonalizationWhitelist) initWithPBPersonalizationWhitelist:v4];

  return v5;
}

TSEditorialItemProvider *__cdecl sub_1000072CC(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  return (TSEditorialItemProvider *)v3;
}

id FRDiagnosticFileListURL()
{
  v0 = +[NSFileManager defaultManager];
  uint64_t v1 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.news"];
  id v2 = [v1 URLByAppendingPathComponent:@"news-diagnostic-file-list.txt"];

  return v2;
}

FRURLRouterManagerType *__cdecl sub_10000755C(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  return (FRURLRouterManagerType *)v3;
}

void sub_1000076CC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_100010E50;
  activity_block[3] = &unk_1000C7380;
  char v9 = a2;
  activity_block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  _os_activity_initiate((void *)&_mh_execute_header, "handleDestructiveDataMigration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

FRToCEditorialManager *__cdecl sub_100007948(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  return (FRToCEditorialManager *)v3;
}

void sub_1000079A8(uint64_t a1)
{
  +[SUUIClientContext defaultContext];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009C60;
  block[3] = &unk_1000C5680;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if ((+[FCGeoUtilities isRunningInSupportedRegion] & 1) == 0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100050D7C;
    v3[3] = &unk_1000C5680;
    v3[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

id sub_100007AC0(uint64_t a1)
{
  id v2 = objc_alloc((Class)NTPBBundleIDMapping);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"bundle_id_mapping"];
  id v4 = [v2 initWithData:v3];

  id v5 = [objc_alloc((Class)FCPersonalizationBundleIDMapping) initWithPBBundleIDMapping:v4];

  return v5;
}

void sub_100007CCC(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "fcDigestModeFromScheduledDeliverySetting:", objc_msgSend(*(id *)(a1 + 40), "scheduledDeliverySetting"));
  id v3 = [*(id *)(a1 + 48) cloudContext];
  id v4 = [v3 notificationController];
  [v4 registerDeviceToken:*(void *)(a1 + 56) deviceDigestMode:v2];

  id v5 = [*(id *)(a1 + 32) notificationManager];
  [v5 notifyDeviceTokenIsAvailable:*(void *)(a1 + 56)];
}

FCAVAssetFactoryType *__cdecl sub_100007D70(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 avAssetFactory];

  return (FCAVAssetFactoryType *)v4;
}

void sub_100007DE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = [v5 topStoriesPublishDates];
  if ([v7 count])
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100018AF0;
    v23 = sub_100018A00;
    id v24 = [*(id *)(a1 + 32) _newCompanionConnection];
    [(id)v20[5] resume];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100047ADC;
    v16[3] = &unk_1000C84A8;
    id v17 = *(id *)(a1 + 40);
    v18 = &v19;
    id v8 = objc_retainBlock(v16);
    id v9 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v10 = [v7 count];
      *(_DWORD *)buf = 134217984;
      id v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Syncing refresh dates %ld…", buf, 0xCu);
    }

    uint64_t v11 = [(id)v20[5] remoteObjectProxyWithErrorHandler:v8];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100047B60;
    v12[3] = &unk_1000C85C0;
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    v15 = &v19;
    [v11 setPreferredRefreshDates:v13 withReply:v12];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000807C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

FCNotificationController *__cdecl sub_1000080A4(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 notificationController];

  return (FCNotificationController *)v4;
}

void sub_1000081D8(id a1, TFResolver *a2, FRUnrecognizedURLRouter *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [(TFResolver *)v5 resolveClass:objc_opt_class()];

  [(FRUnrecognizedURLRouter *)v4 setRetryHandler:v6];
}

FCArticleController *__cdecl sub_100008340(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 articleController];

  return (FCArticleController *)v4;
}

void sub_1000083B4(id a1, TFResolver *a2, FRBackgroundFetchManager *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [(TFResolver *)v5 resolveClass:objc_opt_class()];

  [(FRBackgroundFetchManager *)v4 addFetchable:v6];
}

FCSportsEventController *__cdecl sub_100008440(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 sportsEventController];

  return (FCSportsEventController *)v4;
}

FCTagController *__cdecl sub_10000854C(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 tagController];

  return (FCTagController *)v4;
}

FCPurchaseController *__cdecl sub_1000085C0(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 purchaseController];

  return (FCPurchaseController *)v4;
}

FRLimitedPersonalizationDataGeneratorType *__cdecl sub_100008634(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [FRTimeAndCountAwareLimitedPersonalizationDataGenerator alloc];
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCPersonalizationDataGeneratorType name:@"extension"];
  id v5 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCCoreConfigurationManager];

  id v6 = [(FRTimeAndCountAwareLimitedPersonalizationDataGenerator *)v3 initWithGenerator:v4 configurationManager:v5];

  return (FRLimitedPersonalizationDataGeneratorType *)v6;
}

FCLocalAreasManager *__cdecl sub_1000086E0(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 localAreasManager];

  return (FCLocalAreasManager *)v4;
}

FCPPTContext *__cdecl sub_100008754(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 pptContext];

  return (FCPPTContext *)v4;
}

uint64_t FRShouldPrefetchIgnoringNetworkInterface(void *a1)
{
  id v1 = a1;
  if ([v1 isNetworkReachable]
    && ([v1 isLowDataModeEnabled] & 1) == 0)
  {
    id v3 = +[NSProcessInfo processInfo];
    if ([v3 isLowPowerModeEnabled])
    {
      uint64_t v2 = 0;
    }
    else
    {
      id v4 = +[FRPPTContext sharedContext];
      uint64_t v2 = [v4 isPrefetchDisabled] ^ 1;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

FCPurchaseManagerType *__cdecl sub_100008860(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 purchaseManager];

  return (FCPurchaseManagerType *)v4;
}

FCPersonalizationData *__cdecl sub_100008A3C(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 personalizationData];

  return (FCPersonalizationData *)v4;
}

FCPurchaseProviderType *__cdecl sub_100008BF0(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 purchaseProvider];

  return (FCPurchaseProviderType *)v4;
}

FREditorialItemEntryManager *__cdecl sub_100008D40(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class() name:@"editorialLocalStore"];

  id v4 = [[FREditorialItemEntryManager alloc] initWithLocalStore:v3];

  return v4;
}

FCPuzzleController *__cdecl sub_100008E94(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 puzzleController];

  return (FCPuzzleController *)v4;
}

void sub_100008FB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) fetchedObject];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000CA60;
  v6[3] = &unk_1000C7088;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

FCAssetManager *__cdecl sub_100009134(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 assetManager];

  return (FCAssetManager *)v4;
}

FCSubscriptionController *__cdecl sub_1000091A8(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 subscriptionController];

  return (FCSubscriptionController *)v4;
}

FCTranslationManager *__cdecl sub_10000921C(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 translationManager];

  return (FCTranslationManager *)v4;
}

FCAVAssetPrewarming *__cdecl sub_100009290(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 avAssetPrewarmer];

  return (FCAVAssetPrewarming *)v4;
}

FCEntitlementService *__cdecl sub_1000094F0(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 entitlementService];

  return (FCEntitlementService *)v4;
}

void sub_100009674(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

FCPuzzleTypeController *__cdecl sub_1000097F8(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 puzzleTypeController];

  return (FCPuzzleTypeController *)v4;
}

id sub_1000098F8(uint64_t a1)
{
  id v2 = objc_alloc((Class)FCKeyValueStore);
  id v3 = [*(id *)(a1 + 32) feldsparContext];
  id v4 = [v3 cloudContext];
  id v5 = [v4 contentDirectory];
  id v6 = [v2 initWithName:@"EditorialManager" directory:v5 version:1 options:0 classRegistry:0];

  return v6;
}

void sub_100009C60(uint64_t a1)
{
  id v2 = +[UIApplication sharedApplication];
  id v3 = [v2 key_window];
  id v4 = [v3 rootViewController];

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100018B20;
  uint64_t v11 = sub_100018A18;
  id v12 = [objc_alloc((Class)SUUIExplicitRestrictionAlertController) initWithClientContext:*(void *)(a1 + 32) presentingViewController:v4];
  id v5 = (void *)v8[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018E10;
  v6[3] = &unk_1000C6408;
  void v6[4] = &v7;
  [v5 presentExplicitRestrictionAlertIfNeededOfType:0 completionBlock:v6];
  _Block_object_dispose(&v7, 8);
}

void sub_100009D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

FREditorialConfigurationProvider *__cdecl sub_100009ED0(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [FREditorialConfigurationProvider alloc];
  id v5 = [v3 appConfigurationManager];
  id v6 = [(FREditorialConfigurationProvider *)v4 initWithAppConfigurationManager:v5];

  return v6;
}

FREditorialItemDownloader *__cdecl sub_100009F70(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [FRTagEditorialItemDownloader alloc];
  id v4 = [(TFResolver *)v2 resolveClass:objc_opt_class()];
  id v5 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemEntryManager];

  id v6 = [(FRTagEditorialItemDownloader *)v3 initWithTagController:v4 editorialItemEntryManager:v5];

  return (FREditorialItemDownloader *)v6;
}

FRUnrecognizedURLRouter *__cdecl sub_10000A01C(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [FRUnrecognizedURLRouter alloc];
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FRURLAnalyticsReferralFactory];
  id v5 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v6 = [(FRUnrecognizedURLRouter *)v3 initWithAnalyticsReferralFactory:v4 redirectService:v5];

  return v6;
}

void sub_10000A0C8(uint64_t a1, void *a2)
{
  id v4 = [a2 copy];
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = v4;
  FCPerformBlockOnMainThread();
}

void sub_10000A188(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007CCC;
  v6[3] = &unk_1000C5720;
  id v4 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

FCArticleDownloadServiceType *__cdecl sub_10000A24C(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCContentContext];
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCANFHelper];

  id v5 = [objc_alloc((Class)FCArticleDownloadService) initWithContext:v3 ANFHelper:v4];

  return (FCArticleDownloadServiceType *)v5;
}

FCIssueReadingHistory *__cdecl sub_10000A2E4(id a1, TFResolver *a2)
{
  id v2 = [(TFResolver *)a2 resolveProtocol:&OBJC_PROTOCOL___FCPrivateDataContext];
  id v3 = [v2 issueReadingHistory];

  return (FCIssueReadingHistory *)v3;
}

void sub_10000A654(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) appConfigurationManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005E7C;
  v6[3] = &unk_1000C6EA0;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [v4 fetchAppConfigurationIfNeededWithCompletion:v6];
}

void sub_10000A818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

FCIssueDownloadServiceType *__cdecl sub_10000A9C8(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCContentContext];
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCANFHelper];
  id v5 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCArticleDownloadServiceType];

  id v6 = [objc_alloc((Class)FCIssueDownloadService) initWithContext:v3 ANFHelper:v4 articleDownloadService:v5];

  return (FCIssueDownloadServiceType *)v6;
}

FRArticleEditorialItemProvider *__cdecl sub_10000AA80(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [FRArticleEditorialItemProvider alloc];
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemEntryManager];
  id v5 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemThumbnailCreator];
  id v6 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemCreator];

  id v7 = [(FRArticleEditorialItemProvider *)v3 initWithEditorialItemEntryManager:v4 thumbnailCreator:v5 editorialItemCreator:v6];

  return v7;
}

NSSNewsAnalyticsSessionManager *__cdecl sub_10000AB4C(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  return (NSSNewsAnalyticsSessionManager *)v3;
}

FRURLAnalyticsReferralFactory *__cdecl sub_10000ABAC(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  return (FRURLAnalyticsReferralFactory *)v3;
}

FRArticlePrefetchManager *__cdecl sub_10000AC0C(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [FRArticlePrefetchManager alloc];
  id v4 = [(TFResolver *)v2 resolveClass:objc_opt_class()];
  id v5 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v6 = [(FRArticlePrefetchManager *)v3 initWithCloudContext:v4 articleContentPool:v5];

  return v6;
}

id sub_10000ACC0(id a1, TFResolver *a2)
{
  id v2 = objc_alloc((Class)TFDiagnosticFileCollector);
  id v3 = +[NSFileManager defaultManager];
  id v4 = [v3 temporaryDirectory];
  id v5 = [v4 URLByAppendingPathComponent:@"diagnostics"];
  id v6 = FRDiagnosticFileListURL();
  id v7 = [v2 initWithDiagnosticDumpDir:v5 diagnosticDumpNotificationName:@"FRDiagnosticDumpNotificationName" diagnosticFilesNotificationName:@"FRDiagnosticFileNotificationName" diagnosticFileListURL:v6 log:FCDiagnosticsLog];

  return v7;
}

void sub_10000AFD4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = &__NSArray0__struct;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Found metadata seen IDs = %@ saved IDs = %@.", buf, 0x16u);
  }
  if (WeakRetained)
  {
    if ([v8 count])
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000465AC;
      v13[3] = &unk_1000C5680;
      id v14 = *(id *)(a1 + 32);
      [WeakRetained _syncSeenIdentifiers:v8 withCompletion:v13];
    }
    if ([v9 count])
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000465B4;
      v11[3] = &unk_1000C5680;
      id v12 = *(id *)(a1 + 32);
      [WeakRetained _syncSavedIdentifiersOnGizmo:v9 articleIdentifiersOnGizmo:v7 withCompletion:v11];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

int main(int argc, const char **argv, const char **envp)
{
  if ((TFAmIBeingDebugged() & 1) == 0 && TFSetupCrashDetector())
  {
    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setBool:1 forKey:@"should_clear_cache_on_next_launch"];

    id v7 = +[NSFileManager defaultManager];
    id v8 = +[FRAppDelegate stateRestorationURL];
    [v7 removeItemAtURL:v8 error:0];
  }
  id v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  id v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v13 = UIApplicationMain(argc, (char **)argv, v10, v12);

  return v13;
}

FRBackgroundFetchManager *sub_10000BA48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [FRBackgroundFetchManager alloc];
  id v5 = [*(id *)(a1 + 32) appConfigurationManager];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 subscriptionController];
  id v8 = [*(id *)(a1 + 40) privateDataUpdateCoordinator];
  id v9 = [v3 resolveClass:objc_opt_class()];
  id v10 = [(FRBackgroundFetchManager *)v4 initWithResolver:v3 appConfigManager:v5 privateDataContext:v6 subscriptionController:v7 privateDataUpdateCoordinator:v8 todayAgent:v9];

  return v10;
}

void sub_10000BB3C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 autoFavoritesCursor];
  id v6 = [*(id *)(a1 + 32) _createNewAutoFavoritesOperation];
  [v6 setQualityOfService:9];
  [v6 setRelativePriority:-1];
  [v6 setDisregardCache:*(unsigned __int8 *)(a1 + 40)];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000328B8;
  v12[3] = &unk_1000C7430;
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v7 = v5;
  [v6 setAutoFavoritesCompletionHandler:v12];
  v4[2](v4);

  id v8 = objc_opt_class();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032B20;
  v10[3] = &unk_1000C6FE8;
  id v11 = v6;
  id v9 = v6;
  [v8 logPPMessage:v10];
  +[FCTaskScheduler scheduleLowPriorityOperation:v9];
}

FCOfflineIssueList *__cdecl sub_10000BF74(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = objc_alloc((Class)FCOfflineIssueList);
  id v4 = FCURLForContainerizedUserAccountDocumentDirectory();
  id v5 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCAppActivityMonitor];
  id v6 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCBackgroundTaskable];

  id v7 = [v3 initWithStoreDirectoryFileURL:v4 appActivityMonitor:v5 backgroundTaskable:v6];

  return (FCOfflineIssueList *)v7;
}

void sub_10000C4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CA60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 resourceID];
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100073830();
  }
  [*(id *)(a1 + 32) fc_safelySetObjectAllowingNil:v3 forKeyAllowingNil:v4];
}

FCVanityURLRedirectService *__cdecl sub_10000CC5C(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = objc_alloc((Class)FCVanityURLRedirectService);
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCContentContext];

  id v5 = [v3 initWithContentContext:v4];

  return (FCVanityURLRedirectService *)v5;
}

FRTodayAgent *sub_10000D380(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 resolveProtocol:&OBJC_PROTOCOL___FCFeedPersonalizing];
  id v5 = [FRTodayAgent alloc];
  id v6 = [*(id *)(a1 + 32) purchaseController];
  id v7 = [*(id *)(a1 + 32) subscriptionController];
  id v8 = [v3 resolveProtocol:&OBJC_PROTOCOL___TSWidgetLocalNewsChannelServiceType];
  id v9 = [*(id *)(a1 + 32) bundleSubscriptionManager];
  id v10 = [v3 resolveProtocol:&OBJC_PROTOCOL___FRLimitedPersonalizationDataGeneratorType];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [v3 resolveProtocol:&OBJC_PROTOCOL___NPUserEmbeddingGeneratorType];

  id v13 = [(FRTodayAgent *)v5 initWithFeedPersonalizer:v4 purchaseController:v6 subscriptionController:v7 localNewsChannelService:v8 bundleSubscriptionManager:v9 personalizationDataGenerator:v10 privateDataContext:v11 userEmbeddingGenerator:v12];

  return v13;
}

FRArticleEditorialItemDownloader *sub_10000D4D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [FRArticleEditorialItemDownloader alloc];
  id v5 = [v3 resolveClass:objc_opt_class()];
  id v6 = [*(id *)(a1 + 32) dataProviderFactory];
  id v7 = [v3 resolveProtocol:&OBJC_PROTOCOL___FRArticleEditorialItemProvider];
  id v8 = [v3 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemEntryManager];
  id v9 = [v3 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemThumbnailCreator];
  id v10 = [v3 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemCreator];

  uint64_t v11 = [(FRArticleEditorialItemDownloader *)v4 initWithArticleController:v5 dataProviderFactory:v6 articleEditorialItemProvider:v7 editorialItemEntryManager:v8 thumbnailCreator:v9 editorialItemCreator:v10];

  return v11;
}

FRURLAnalyticsReferralFactory *__cdecl sub_10000E004(id a1, TFResolver *a2)
{
  id v2 = a2;
  id v3 = [FRURLAnalyticsReferralFactory alloc];
  id v4 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v5 = [(FRURLAnalyticsReferralFactory *)v3 initWithAppActivityMonitor:v4];

  return v5;
}

FRToCEditorialManager *sub_10000E478(uint64_t a1, void *a2)
{
  id v3 = a2;
  v15 = [FRToCEditorialManager alloc];
  id v4 = [v3 resolveClass:objc_opt_class()];
  id v5 = [*(id *)(a1 + 32) feldsparContext];
  id v6 = [v5 appActivityMonitor];
  id v7 = [v3 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemEntryManager];
  id v8 = [v3 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemDownloader name:@"editorialArticleDownloader"];
  id v9 = [v3 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemDownloader name:@"editorialTagDownloader"];
  id v10 = [v3 resolveProtocol:&OBJC_PROTOCOL___FREditorialConfigurationProvider];
  uint64_t v11 = [v3 resolveProtocol:&OBJC_PROTOCOL___FREditorialItemThumbnailCreator];
  id v12 = [v3 resolveProtocol:&OBJC_PROTOCOL___FCANFHelper];

  id v13 = [(FRToCEditorialManager *)v15 initWithCloudContext:v4 activityMonitor:v6 editorialItemEntryManager:v7 articleEditorialItemDownloader:v8 tagEditorialItemDownloader:v9 editorialConfigurationProvider:v10 thumbnailCreator:v11 ANFHelper:v12];

  return v13;
}

void sub_10000F19C(id a1)
{
  os_log_t v1 = os_log_create(FRLogSubsystemIdentifier, "FeedDataSource");
  id v2 = (void *)FRFeedDataSourceLog;
  FRFeedDataSourceLog = (uint64_t)v1;

  os_log_t v3 = os_log_create(FRLogSubsystemIdentifier, "FeedLayout");
  id v4 = (void *)FRFeedLayoutLog;
  FRFeedLayoutLog = (uint64_t)v3;

  os_log_t v5 = os_log_create(FRLogSubsystemIdentifier, "PresubscribeService");
  id v6 = (void *)FRPresubscribeServiceLog;
  FRPresubscribeServiceLog = (uint64_t)v5;

  os_log_t v7 = os_log_create(FRLogSubsystemIdentifier, "StateRestore");
  id v8 = (void *)FRStateRestoreLog;
  FRStateRestoreLog = (uint64_t)v7;

  os_log_t v9 = os_log_create(FRLogSubsystemIdentifier, "TodayAgent");
  id v10 = (void *)FRTodayAgentLog;
  FRTodayAgentLog = (uint64_t)v9;

  os_log_t v11 = os_log_create(FRLogSubsystemIdentifier, "AutoScrollToTopManager");
  id v12 = (void *)FRAutoScrollToTopManagerLog;
  FRAutoScrollToTopManagerLog = (uint64_t)v11;

  os_log_t v13 = os_log_create(FRLogSubsystemIdentifier, "FeedCollectionView");
  id v14 = (void *)FRFeedCollectionViewLog;
  FRFeedCollectionViewLog = (uint64_t)v13;

  os_log_t v15 = os_log_create(FRLogSubsystemIdentifier, "Weather");
  v16 = (void *)FRWeatherLog;
  FRWeatherLog = (uint64_t)v15;

  os_log_t v17 = os_log_create(FRLogSubsystemIdentifier, "FeedManager");
  id v18 = (void *)FRFeedManagerLog;
  FRFeedManagerLog = (uint64_t)v17;

  os_log_t v19 = os_log_create(FRLogSubsystemIdentifier, "FeedRefreshAnimationManager");
  v20 = (void *)FRFeedRefreshAnimationManagerLog;
  FRFeedRefreshAnimationManagerLog = (uint64_t)v19;

  os_log_t v21 = os_log_create(FRLogSubsystemIdentifier, "OfflineTransition");
  v22 = (void *)FROfflineTransitionLog;
  FROfflineTransitionLog = (uint64_t)v21;

  os_log_t v23 = os_log_create(FRLogSubsystemIdentifier, "Article");
  id v24 = (void *)FRArticleLog;
  FRArticleLog = (uint64_t)v23;

  os_log_t v25 = os_log_create(FRLogSubsystemIdentifier, "ArticlePrefetch");
  id v26 = (void *)FRArticlePrefetchLog;
  FRArticlePrefetchLog = (uint64_t)v25;

  os_log_t v27 = os_log_create(FRLogSubsystemIdentifier, "BackgroundFetch");
  v28 = (void *)FRBackgroundFetchLog;
  FRBackgroundFetchLog = (uint64_t)v27;

  os_log_t v29 = os_log_create(FRLogSubsystemIdentifier, "Navigation");
  v30 = (void *)FRNavigationLog;
  FRNavigationLog = (uint64_t)v29;

  os_log_t v31 = os_log_create(FRLogSubsystemIdentifier, "Portrait");
  v32 = (void *)FRPortraitLog;
  FRPortraitLog = (uint64_t)v31;

  FRDESLog = (uint64_t)os_log_create(FRLogSubsystemIdentifier, "DES");

  _objc_release_x1();
}

uint64_t sub_10000F9F8(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v6;
    if ([v2 isViewLoaded])
    {
      os_log_t v3 = [v2 view];
      id v4 = [v3 window];

      if (v4) {
        [(id)objc_opt_class() saveViewAppearanceDateForObserver:v2];
      }
    }
  }

  return _objc_release_x1();
}

id FRPrivateDataActionsForDataclassActionTypes(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = [(id)[*(id *)(*((void *)&v11 + 1) + 8 * i) integerValue] - 1];
        if (v8 > 5) {
          os_log_t v9 = 0;
        }
        else {
          os_log_t v9 = off_1000C98D8[v8];
        }
        [v2 addObjectsFromArray:v9];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_100010E50(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = +[NSFileManager defaultManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100011098;
  v16[3] = &unk_1000C9FB0;
  char v17 = v2;
  id v4 = objc_retainBlock(v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100063690;
  v14[3] = &unk_1000C5680;
  id v5 = v3;
  id v15 = v5;
  uint64_t v6 = objc_retainBlock(v14);
  os_log_t v7 = +[NSUserDefaults standardUserDefaults];
  ((void (*)(void *, void *, const __CFString *, void *))v4[2])(v4, v7, @"should_clear_cache_on_next_launch", v6);

  unint64_t v8 = NewsCoreUserDefaults();
  ((void (*)(void *, void *, void, void *))v4[2])(v4, v8, FCClearCacheOnNextLaunchSharedPreferenceKey, v6);

  os_log_t v9 = +[NSUserDefaults standardUserDefaults];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100063764;
  v12[3] = &unk_1000C5680;
  id v10 = v5;
  id v13 = v10;
  ((void (*)(void *, void *, const __CFString *, void *))v4[2])(v4, v9, @"should_clear_private_data_on_next_launch", v12);

  if (v2)
  {
    +[FRSpotlightManager clearIndex];
    long long v11 = [*(id *)(a1 + 32) defaultsDataDestructionItems];
    NSSDestroyUserDefaultsDataWithItems();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011098(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  unint64_t v8 = a4;
  if (*(unsigned char *)(a1 + 32) || [v9 BOOLForKey:v7])
  {
    v8[2](v8);
    [v9 setBool:0 forKey:v7];
  }
}

void sub_1000114D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 fetchedObject];
  id v5 = FCDynamicCast();

  if ([v5 count])
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100008FB4;
    v41[3] = &unk_1000C6FC0;
    id v42 = v3;
    uint64_t v6 = +[NSDictionary fc_dictionary:v41];
    id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007376C();
    }
    unint64_t v8 = [v6 objectForKeyedSubscript:*(void *)(a1 + 48)];
    if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000736A8();
    }
    id v9 = [v6 objectForKeyedSubscript:*(void *)(a1 + 56)];
    if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000735E4();
    }
    id v10 = [v6 objectForKeyedSubscript:*(void *)(a1 + 64)];
    if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100073520();
    }
    v34 = [v7 fileURL];
    if (!v34 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007345C();
    }
    v30 = v7;
    long long v11 = [v8 fileURL];
    if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100073398();
    }
    id v33 = v3;
    long long v12 = [v9 fileURL];
    if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000732D4();
    }
    v32 = v5;
    id v13 = [v10 fileURL];
    if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100073210();
    }
    v28 = v9;
    long long v14 = +[NSData dataWithContentsOfURL:v34];
    if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007314C();
    }
    os_log_t v31 = v6;
    id v15 = +[NSData dataWithContentsOfURL:v11];
    if (!v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100073088();
    }
    os_log_t v29 = v8;
    v16 = +[NSData dataWithContentsOfURL:v12];
    if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100072FC4();
    }
    char v17 = &v42;
    id v18 = +[NSData dataWithContentsOfURL:v13];
    if (!v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100072F00();
    }
    os_log_t v19 = [*(id *)(a1 + 32) storeQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000137F4;
    block[3] = &unk_1000C70B0;
    uint64_t v20 = *(void *)(a1 + 32);
    id v36 = v15;
    uint64_t v37 = v20;
    id v38 = v14;
    id v39 = v16;
    id v40 = v18;
    id v21 = v18;
    id v22 = v16;
    id v23 = v14;
    id v24 = v15;
    dispatch_sync(v19, block);

    id v5 = v32;
    id v3 = v33;
  }
  else
  {
    os_log_t v25 = objc_opt_class();
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100030258;
    v43[3] = &unk_1000C6FE8;
    char v17 = &v44;
    id v44 = v3;
    [v25 logPPMessage:v43];
  }

  uint64_t v26 = *(void *)(a1 + 72);
  if (v26) {
    (*(void (**)(void))(v26 + 16))();
  }
}

id sub_100011BD8(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) appConfigurationManager];
  id v3 = [v2 appConfiguration];

  uint64_t v4 = [v3 personalizationBundleIdMappingResourceId];
  id v5 = (void *)v4;
  uint64_t v6 = @"P-BM-143441";
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  id v7 = v6;

  uint64_t v8 = [v3 personalizationUrlMappingResourceId];
  id v9 = (void *)v8;
  id v10 = @"P-UM-143441";
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  long long v11 = v10;

  uint64_t v12 = [v3 personalizationWhitelistResourceId];
  id v13 = (void *)v12;
  long long v14 = @"P-W-143441";
  if (v12) {
    long long v14 = (__CFString *)v12;
  }
  id v15 = v14;

  uint64_t v16 = [v3 personalizationFavorabilityResourceId];
  char v17 = (void *)v16;
  id v18 = @"P-PF-143441";
  if (v16) {
    id v18 = (__CFString *)v16;
  }
  os_log_t v19 = v18;

  uint64_t v20 = objc_opt_class();
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10002FEE4;
  v57[3] = &unk_1000C6FE8;
  id v58 = v3;
  id v21 = v3;
  [v20 logPPMessage:v57];
  id v22 = objc_opt_class();
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000300A8;
  v52[3] = &unk_1000C7038;
  id v23 = v7;
  v53 = v23;
  id v24 = v11;
  v54 = v24;
  os_log_t v25 = v15;
  v55 = v25;
  uint64_t v26 = v19;
  v56 = v26;
  [v22 logPPMessage:v52];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100018904;
  v47[3] = &unk_1000C7060;
  os_log_t v27 = v23;
  v48 = v27;
  v28 = v24;
  v49 = v28;
  os_log_t v29 = v25;
  v50 = v29;
  v30 = v26;
  v51 = v30;
  os_log_t v31 = +[NSArray fc_array:v47];
  id v32 = objc_alloc((Class)FCResourcesFetchOperation);
  id v33 = [*(id *)(a1 + 32) cloudContext];
  id v34 = [v32 initWithContext:v33 resourceIDs:v31 downloadAssets:1];

  [v34 setCachePolicy:1];
  [v34 setQualityOfService:*(void *)(a1 + 48)];
  [v34 setRelativePriority:*(void *)(a1 + 56)];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000114D8;
  v41[3] = &unk_1000C70D8;
  v35 = *(void **)(a1 + 40);
  void v41[4] = *(void *)(a1 + 32);
  id v42 = v27;
  v43 = v28;
  id v44 = v29;
  v45 = v30;
  id v46 = v35;
  id v36 = v30;
  uint64_t v37 = v29;
  id v38 = v28;
  id v39 = v27;
  [v34 setFetchCompletionBlock:v41];

  return v34;
}

void sub_100011FE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [(id)objc_opt_class() logPPMessage:&stru_1000C6EE0];
  id v4 = objc_alloc((Class)FCFileCoordinatedTodayPersonalizationUpdate);
  id v5 = FCURLForTodayPersonalizationUpdateStore();
  id v6 = [v4 initWithFileURL:v5];

  id v7 = [v6 consumeUpdates];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F730;
  v10[3] = &unk_1000C6F30;
  id v11 = *(id *)(a1 + 32);
  [v7 enumerateObjectsUsingBlock:v10];
  [(id)objc_opt_class() logPPMessage:&stru_1000C6F50];
  v3[2](v3);

  uint64_t v8 = FCPersonalizationLog;
  if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Did process events from Today widget", v9, 2u);
  }
}

TSClearDataManager *__cdecl sub_100012558(id a1, TFResolver *a2)
{
  int v2 = a2;
  uint64_t v16 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCPrivateDataContext];
  id v3 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCAppleAccount];
  id v15 = [(TFResolver *)v2 resolveClass:objc_opt_class()];
  id v4 = [FRMenuBarClearDataManager alloc];
  id v5 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCClearableReadingHistory];
  long long v14 = [v16 personalizationData];
  id v6 = [(TFResolver *)v2 resolveClass:objc_opt_class()];
  id v7 = [v15 newsletterManager];
  uint64_t v8 = [v15 userEventHistory];
  id v9 = [v8 storage];
  id v10 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___TSNewsActivityManagerType];
  id v11 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCClearableUserEmbedding];

  uint64_t v12 = [(FRMenuBarClearDataManager *)v4 initWithAccount:v3 clearReadingHistoryManager:v5 personalizationData:v14 analyticsController:v6 newsletterManager:v7 userEventHistoryStorage:v9 userActivityManager:v10 clearableUserEmbedding:v11];

  return (TSClearDataManager *)v12;
}

FCClearableReadingHistory *__cdecl sub_100012728(id a1, TFResolver *a2)
{
  int v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCUserEventHistoryStorageType];
  id v5 = [(TFResolver *)v2 resolveClass:objc_opt_class()];
  id v6 = [(TFResolver *)v2 resolveClass:objc_opt_class()];
  id v7 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCClearableUserEmbedding];

  id v8 = [objc_alloc((Class)TFMultiDelegate) initWithDelegate:v3 delegateProtocol:&OBJC_PROTOCOL___FCClearableReadingHistory];
  [v8 addDelegate:v4];
  [v8 addDelegate:v5];
  [v8 addDelegate:v6];
  [v8 addDelegate:v7];
  id v9 = [v8 delegate];

  return (FCClearableReadingHistory *)v9;
}

FRVanityURLRouterManager *__cdecl sub_100012884(id a1, TFResolver *a2)
{
  int v2 = a2;
  id v3 = [FRVanityURLRouterManager alloc];
  id v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FRURLAnalyticsReferralFactory];
  id v5 = [(TFResolver *)v2 resolveClass:objc_opt_class()];
  id v6 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v7 = [(FRVanityURLRouterManager *)v3 initWithAnalyticsReferralFactory:v4 redirectService:v5 routerManager:v6];

  return v7;
}

FCPaidAccessCheckerType *__cdecl sub_100012960(id a1, TFResolver *a2)
{
  int v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  id v4 = [v3 paidAccessChecker];

  return (FCPaidAccessCheckerType *)v4;
}

void sub_100013394(uint64_t a1)
{
  id v2 = objc_alloc((Class)FCKeyValueStore);
  id v3 = [*(id *)(a1 + 32) path];
  id v18 = [v2 initWithName:@"PersonalizationConfiguration" directory:v3 version:6 options:8 classRegistry:0];

  id v4 = [[FRPersonalizationConfiguration alloc] initWithKeyValueStore:v18];
  [*(id *)(a1 + 40) setConfigurationStore:v4];

  id v5 = [FRPersonalizationAutoFavoritesCursor alloc];
  id v6 = [*(id *)(a1 + 40) configurationStore];
  id v7 = [v6 coreDuetLastQueryDate];
  id v8 = [*(id *)(a1 + 40) configurationStore];
  id v9 = [v8 portraitLastQueryDate];
  id v10 = [(FRPersonalizationAutoFavoritesCursor *)v5 initWithCoreDuetLastQueryDate:v7 portraitLastQueryDate:v9];
  [*(id *)(a1 + 40) setAutoFavoritesCursor:v10];

  id v11 = [*(id *)(a1 + 40) appConfigurationManager];
  uint64_t v12 = [v11 possiblyUnfetchedAppConfiguration];
  id v13 = [v12 personalizationTreatment];
  [*(id *)(a1 + 40) setConfigurableValues:v13];

  long long v14 = [*(id *)(a1 + 40) configurationStore];
  uint64_t v15 = [v14 autoFavorites];
  uint64_t v16 = *(void *)(a1 + 40);
  char v17 = *(void **)(v16 + 32);
  *(void *)(v16 + 32) = v15;

  [*(id *)(a1 + 40) _saveReadableAllowlist];
}

void sub_1000137F4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) configurationStore];
    [v2 setURLMappingData:*(void *)(a1 + 32)];
  }
  if (*(void *)(a1 + 48))
  {
    id v3 = [*(id *)(a1 + 40) configurationStore];
    [v3 setBundleIDMappingData:*(void *)(a1 + 48)];
  }
  if (*(void *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 40) configurationStore];
    [v4 setWhitelistData:*(void *)(a1 + 56)];
  }
  if (*(void *)(a1 + 64))
  {
    id v5 = [*(id *)(a1 + 40) configurationStore];
    [v5 setFavorabilityScoresData:*(void *)(a1 + 64)];
  }
}

void sub_100014C24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100015F78(id a1, id a2, TFResolver *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [(TFResolver *)v4 resolveClass:objc_opt_class()];
  [v5 addRoutable:v6];

  id v7 = [(TFResolver *)v4 resolveClass:objc_opt_class()];

  [v5 addRoutable:v7];
}

void sub_100016EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FRURLForNewsPersonalizationDirectory()
{
  v0 = FRURLForNewsAppCachesDirectory();
  id v1 = [v0 URLByAppendingPathComponent:@"Personalization_Data" isDirectory:1];

  id v2 = +[NSFileManager defaultManager];
  uint64_t v4 = 0;
  [v2 createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v4];

  return v1;
}

id FRURLForNewsAppCachesDirectory()
{
  v0 = FCURLForContainerizedUserAccountCachesDirectory();
  id v1 = [v0 URLByAppendingPathComponent:@"News" isDirectory:1];

  id v2 = +[NSFileManager defaultManager];
  uint64_t v4 = 0;
  [v2 createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v4];

  return v1;
}

void sub_100018854(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) feldsparContext];
  uint64_t v3 = [v2 gizmoSyncManager];
  [v3 syncWithGizmo];

  id v5 = [*(id *)(a1 + 32) feldsparContext];
  uint64_t v4 = [v5 favoritesPersonalizer];
  [v4 refreshAutoFavoritesInBackgroundDisregardingCache:1];
}

void sub_100018904(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 fc_safelyAddObject:v3];
  [v4 fc_safelyAddObject:a1[5]];
  [v4 fc_safelyAddObject:a1[6]];
  [v4 fc_safelyAddObject:a1[7]];
}

id sub_100018990(uint64_t a1)
{
  return [*(id *)(a1 + 32) analyticsController];
}

FCAppActivityMonitor *__cdecl sub_100018998(id a1, TFResolver *a2)
{
  return (FCAppActivityMonitor *)[(TFResolver *)a2 resolveProtocol:&OBJC_PROTOCOL___NUAppActivityMonitor];
}

void sub_1000189A8(uint64_t a1)
{
}

void sub_1000189B0(uint64_t a1)
{
}

void sub_1000189B8(uint64_t a1)
{
}

void sub_1000189C0(uint64_t a1)
{
}

void sub_1000189C8(uint64_t a1)
{
}

void sub_1000189D0(uint64_t a1)
{
}

void sub_1000189D8(uint64_t a1)
{
}

void sub_1000189E0(uint64_t a1)
{
}

void sub_1000189E8(uint64_t a1)
{
}

void sub_1000189F0(uint64_t a1)
{
}

void sub_1000189F8(uint64_t a1)
{
}

void sub_100018A00(uint64_t a1)
{
}

void sub_100018A08(uint64_t a1)
{
}

void sub_100018A10(uint64_t a1)
{
}

void sub_100018A18(uint64_t a1)
{
}

void sub_100018A20(uint64_t a1)
{
}

void sub_100018A28(uint64_t a1)
{
}

void sub_100018A30(uint64_t a1)
{
}

void sub_100018A38(uint64_t a1)
{
}

uint64_t sub_100018A40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018A50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018A60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018A70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018A80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018A90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018AA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018AB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018AC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018AD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018AE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018AF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018B00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018B10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018B20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018B30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018B40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018B50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100018B60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100018B70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, [a2 count] != 0, v5);
}

id sub_100018BDC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) popActionTypesUpToCount:*(void *)(a1 + 40) setLocalDataHintIfNeeded:1];
}

void sub_100018BEC()
{
  sub_10001918C();
  sub_1000191CC((void *)&_mh_execute_header, &_os_log_default, v0, "Error fetching metadata from gizmo %@.", v1, v2, v3, v4, v5);
}

void sub_100018C5C(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsUserIDLoaded:1];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

id sub_100018C9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) appActivityMonitor];
}

id sub_100018CA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) favoritesPersonalizer];
}

id sub_100018CAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) favoritesPersonalizer];
}

id sub_100018CB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) favoritesPersonalizer];
}

id sub_100018CBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) favoritesPersonalizer];
}

id sub_100018CC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) analyticsController];
}

id sub_100018CCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) articleContentPool];
}

void sub_100018CD4(id a1, TFResolver *a2, FREditorialItemEntryManager *a3)
{
}

NUFontRegistration *__cdecl sub_100018CDC(id a1, TFResolver *a2)
{
  uint64_t v2 = objc_alloc_init(FREditorialFontManager);

  return (NUFontRegistration *)v2;
}

FREditorialItemThumbnailCreator *__cdecl sub_100018D0C(id a1, TFResolver *a2)
{
  uint64_t v2 = objc_alloc_init(FREditorialItemThumbnailCreator);

  return v2;
}

void sub_100018D3C(id a1, NSNotification *a2)
{
}

void sub_100018D48(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error while updating onboard version. Error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100018DC0(id a1)
{
  id v1 = +[FCAppleAccount sharedAccount];
  [v1 loadStoreFrontWithCompletionHandler:&stru_1000C8D30];
}

void sub_100018E10(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  int v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

FRURLRouterManager *__cdecl sub_100018E24(id a1, TFResolver *a2)
{
  int v2 = objc_alloc_init(FRURLRouterManager);

  return v2;
}

id sub_100018E54(id a1, TFResolver *a2)
{
  int v2 = objc_opt_new();

  return v2;
}

void sub_100018E84(uint64_t a1)
{
}

void sub_100018E8C(uint64_t a1)
{
  +[NSThread isMainThread];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSyncingWatchData:0];
}

FCBackgroundTaskable *__cdecl sub_100018EE8(id a1, TFResolver *a2)
{
  return (FCBackgroundTaskable *)+[UIApplication sharedApplication];
}

FRCachesClearableReadingHistory *__cdecl sub_100018EF4(id a1, TFResolver *a2)
{
  int v2 = objc_opt_new();

  return (FRCachesClearableReadingHistory *)v2;
}

id sub_100018F24(uint64_t a1)
{
  return [*(id *)(a1 + 32) appActivityMonitor];
}

FCReceiptRefresherType *__cdecl sub_100018F2C(id a1, TFResolver *a2)
{
  id v2 = objc_alloc_init((Class)FCReceiptRefresher);

  return (FCReceiptRefresherType *)v2;
}

TSSharedImageCacheType *__cdecl sub_100018F5C(id a1, TFResolver *a2)
{
  id v2 = [[FRSharedImageCache alloc] initWithPersistenceEnabled:1];

  return (TSSharedImageCacheType *)v2;
}

TSSharedImageCacheType *__cdecl sub_100018F94(id a1, TFResolver *a2)
{
  id v2 = objc_alloc_init(FRSharedImageCache);

  return (TSSharedImageCacheType *)v2;
}

id sub_100018FC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationManager];
}

id sub_100018FCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationManager];
}

id sub_100018FD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationManager];
}

id sub_100018FDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationManager];
}

id sub_100018FE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkBehaviorMonitor];
}

id sub_100018FEC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_100018FF4(uint64_t a1)
{
  qword_1000EE3C0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10001902C(id a1)
{
  id v1 = +[UIDevice currentDevice];
  byte_1000EE000 = [v1 userInterfaceIdiom] == 0;
}

void sub_100019084(id a1)
{
  id v1 = +[UIDevice currentDevice];
  byte_1000EDFF0 = [v1 userInterfaceIdiom] == (id)1;
}

void sub_1000190F0(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_100019140(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_100019160(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 22) = 1024;
}

void sub_100019170(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

uint64_t sub_1000191B8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  *(_DWORD *)(a2 + 24) = a3;
  *(_WORD *)(a2 + 28) = 2114;
  *(void *)(a2 + 30) = result;
  return result;
}

void sub_1000191CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t FRURLForNewsAppDocumentsDirectory()
{
  return FCURLForContainerizedUserAccountDocumentDirectory();
}

void FRSetupLogging()
{
  if (qword_1000EDF20 != -1) {
    dispatch_once(&qword_1000EDF20, &stru_1000C5800);
  }
}

NSSet *FRAppDefaultsDomainiCloudDataDestructionStickyKeys()
{
  return +[NSSet setWithObjects:@"should_clear_cache_on_next_launch", 0];
}

Class sub_100019EFC(id a1, NSString *a2, Class a3)
{
  return (Class)objc_opt_class();
}

void sub_10001A1E8(uint64_t a1)
{
  id v2 = +[UIApplication sharedApplication];
  uint64_t v3 = [v2 key_window];
  uint64_t v4 = [v3 windowScene];
  uint8_t v5 = [v4 session];
  id v6 = [v5 persistentIdentifier];

  [*(id *)(a1 + 32) endSessionForReason:4 byStartingNewSession:1 resetUserID:0 forSceneID:v6];
}

void sub_10001A3B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cloudContext];
  uint64_t v3 = [v2 userInfo];
  uint64_t v4 = [v3 userStartDate];

  if (!v4)
  {
    uint8_t v5 = [*(id *)(a1 + 32) lastAppOpenDate];

    if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006F020();
    }
    id v6 = [*(id *)(a1 + 32) lastAppOpenDate];
    id v7 = [*(id *)(a1 + 32) cloudContext];
    id v8 = [v7 userInfo];
    [v8 setUserStartDate:v6];
  }
}

void sub_10001A8EC()
{
  uint64_t v0 = FCAnalyticsLog;
  if (os_log_type_enabled(FCAnalyticsLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "No scene ID passed in to end", v1, 2u);
  }
}

void sub_10001A954()
{
  uint64_t v0 = FCAnalyticsLog;
  if (os_log_type_enabled(FCAnalyticsLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "No Session in progress for the scene to end", v1, 2u);
  }
}

void sub_10001AB2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSUUID UUID];
  id v6 = [v4 UUIDString];

  uint8_t v5 = [*(id *)(a1 + 32) sceneSessionDictionary];
  [v5 setObject:v6 forKeyedSubscript:v3];
}

void sub_10001B168(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t v5 = [a2 embedConfigurationAssetID];
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006F340();
    }
    goto LABEL_7;
  }
  if (a3 || ([*(id *)(a1 + 32) isCancelled] & 1) != 0)
  {
LABEL_7:
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
    goto LABEL_8;
  }
  id v6 = [*(id *)(a1 + 32) resourceManager];
  id v18 = v5;
  id v7 = +[NSArray arrayWithObjects:&v18 count:1];
  id v8 = [*(id *)(a1 + 32) relativePriority];
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  long long v14 = sub_10001B2F8;
  uint64_t v15 = &unk_1000C5748;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v10;
  uint64_t v11 = [v6 fetchResourcesWithIdentifiers:v7 downloadAssets:0 relativePriority:v8 callBackQueue:&_dispatch_main_q completionBlock:&v12];

  [*(id *)(a1 + 32) associateChildOperation:v11, v12, v13, v14, v15];
LABEL_8:
}

void sub_10001B2F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 objectForKey:*(void *)(a1 + 32)];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 assetHandle];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001B414;
    v12[3] = &unk_1000C5720;
    id v13 = v7;
    int8x16_t v11 = *(int8x16_t *)(a1 + 32);
    id v9 = (id)v11.i64[0];
    int8x16_t v14 = vextq_s8(v11, v11, 8uLL);
    id v15 = v5;
    id v10 = [v8 downloadIfNeededWithCompletion:v12];
  }
  else
  {
    [*(id *)(a1 + 40) finishedPerformingOperationWithError:v5];
  }
}

void sub_10001B414(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetHandle];
  id v4 = [v2 filePath];

  if (v4)
  {
    id v3 = +[NSData dataWithContentsOfFile:v4];
    [*(id *)(a1 + 40) setEmbedConfigurationData:v3];

    [*(id *)(a1 + 40) setEmbedConfigurationIdentifier:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 40) finishedPerformingOperationWithError:*(void *)(a1 + 56)];
}

uint64_t sub_10001BC68(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

void sub_10001BEC4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 analyticsReferralFactory];
    id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
    id v8 = [v5 analyticsReferralForURL:v4 sourceApplication:v6];

    id v7 = [*(id *)(a1 + 32) retryHandler];
    [v7 handleOpenURL:v4 options:*(void *)(a1 + 40) analyticsReferral:v8];
  }
}

void FRShowEnableNotificationsAlert(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a4;
  int8x16_t v11 = a5;
  id v12 = a3;
  id v13 = +[FRAppDelegate sharedDelegate];
  int8x16_t v14 = [v13 resolver];

  id v15 = [v14 resolveProtocol:&OBJC_PROTOCOL___TSNotificationManagerType];
  id v16 = [v15 subscribeNotificationPromptForTagID:v12];

  if (v16 == (id)2)
  {
    if (v11) {
      v11[2](v11, 1);
    }
  }
  else if (v16 == (id)1)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001C42C;
    v36[3] = &unk_1000C5828;
    id v37 = v9;
    os_log_t v29 = objc_retainBlock(v36);
    id v18 = +[NSBundle mainBundle];
    os_log_t v19 = [v18 localizedStringForKey:@"Turn On" value:&stru_1000CABC0 table:0];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001C590;
    v34[3] = &unk_1000C5850;
    uint64_t v20 = v11;
    v35 = v20;
    os_log_t v31 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v34];

    id v21 = +[NSBundle mainBundle];
    id v22 = [v21 localizedStringForKey:@"Not Now" value:&stru_1000CABC0 table:0];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10001C5AC;
    v32[3] = &unk_1000C5850;
    id v33 = v20;
    v30 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v32];

    id v23 = +[NSBundle mainBundle];
    id v24 = [v23 localizedStringForKey:@"Find out about important stories from %@." value:&stru_1000CABC0 table:0];
    os_log_t v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v10);

    if (!a2)
    {
      v28 = +[NSBundle mainBundle];
      uint64_t v26 = [v28 localizedStringForKey:@"FRGetNotificationsAlertTitle" value:&stru_1000CABC0 table:0];
      v38[0] = v30;
      v38[1] = v31;
      os_log_t v27 = +[NSArray arrayWithObjects:v38 count:2];
      ((void (*)(void *, void *, void *, void *, void *))v29[2])(v29, v26, v25, v27, v31);
    }
  }
  else
  {
    if (v16) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v11 == 0;
    }
    if (!v17) {
      v11[2](v11, 0);
    }
  }
}

void sub_10001C42C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  int8x16_t v11 = +[UIAlertController alertControllerWithTitle:a2 message:a3 preferredStyle:1];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [v11 addAction:*(void *)(*((void *)&v17 + 1) + 8 * (void)v16) v17];
        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }

  if (v10) {
    [v11 setPreferredAction:v10];
  }
  [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:0 v17];
}

uint64_t sub_10001C590(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_10001C5AC(uint64_t a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = +[NSDate date];
  [v2 setObject:v3 forKey:FCNotificationManagerLastDeclinedNotificationDateKey];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_10001C7DC(id a1)
{
  v15[0] = @"FRSystemFont-Ultralight";
  id v14 = +[NSNumber numberWithDouble:UIFontWeightUltraLight];
  v16[0] = v14;
  v15[1] = @"FRSystemFont-Thin";
  id v13 = +[NSNumber numberWithDouble:UIFontWeightThin];
  v16[1] = v13;
  v15[2] = @"FRSystemFont-Light";
  id v1 = +[NSNumber numberWithDouble:UIFontWeightLight];
  v16[2] = v1;
  v15[3] = @"FRSystemFont-Regular";
  id v2 = +[NSNumber numberWithDouble:UIFontWeightRegular];
  v16[3] = v2;
  v15[4] = @"FRSystemFont-Medium";
  id v3 = +[NSNumber numberWithDouble:UIFontWeightMedium];
  void v16[4] = v3;
  v15[5] = @"FRSystemFont-Semibold";
  id v4 = +[NSNumber numberWithDouble:UIFontWeightSemibold];
  v16[5] = v4;
  v15[6] = @"FRSystemFont-Bold";
  id v5 = +[NSNumber numberWithDouble:UIFontWeightBold];
  v16[6] = v5;
  v15[7] = @"FRSystemFont-Heavy";
  id v6 = +[NSNumber numberWithDouble:UIFontWeightHeavy];
  v16[7] = v6;
  v15[8] = @"FRSystemFont-Black";
  id v7 = +[NSNumber numberWithDouble:UIFontWeightBlack];
  v16[8] = v7;
  v15[9] = @"FRSystemFont-Condensed-Bold";
  id v8 = +[NSNumber numberWithDouble:UIFontWeightBold];
  v16[9] = v8;
  v15[10] = @"FRSystemFont-Condensed-Semibold";
  id v9 = +[NSNumber numberWithDouble:UIFontWeightSemibold];
  v16[10] = v9;
  v15[11] = @"FRSystemFont-Condensed-Black";
  id v10 = +[NSNumber numberWithDouble:UIFontWeightBlack];
  v16[11] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:12];
  id v12 = (void *)qword_1000EDF28;
  qword_1000EDF28 = v11;
}

uint64_t sub_10001DB4C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v6 = FCProtocolCast();
  id v9 = v5;
  FCPerformIfNonNil();

  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void sub_10001DC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DC70(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = FCProtocolCast();
  id v4 = v2;
  FCPerformIfNonNil();
}

void sub_10001DD34(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) name];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) name];
  }
  else
  {
    id v5 = &stru_1000CABC0;
  }
  id v6 = [*(id *)(a1 + 40) identifier];
  uint64_t v7 = +[NSString stringWithFormat:@"%@%@", v5, v6];
  id v8 = [v3 trimTheArticle:v7];

  if (v4) {
  id v9 = *(void **)(a1 + 32);
  }
  uint64_t v10 = [v15 name];
  if (v10)
  {
    uint64_t v11 = [v15 name];
  }
  else
  {
    uint64_t v11 = &stru_1000CABC0;
  }
  uint64_t v12 = [v15 identifier];
  uint64_t v13 = +[NSString stringWithFormat:@"%@%@", v11, v12];
  id v14 = [v9 trimTheArticle:v13];

  if (v10) {
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 compare:v14 options:65];
  }
}

uint64_t sub_10001E078(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) tagOpenedDate];
  id v8 = [v5 identifier];
  uint64_t v9 = [v7 objectForKey:v8];

  uint64_t v10 = [*(id *)(a1 + 32) tagOpenedDate];
  uint64_t v11 = [v6 identifier];
  uint64_t v12 = [v10 objectForKey:v11];

  if (v9 && !v12) {
    goto LABEL_3;
  }
  if (!v9 && v12) {
    goto LABEL_6;
  }
  if (v9 | v12)
  {
    uint64_t v13 = (uint64_t)[(id)v12 compare:v9];
    goto LABEL_17;
  }
  id v14 = *(void **)(a1 + 40);
  id v15 = [v5 identifier];
  id v16 = [v14 indexOfObject:v15];

  long long v17 = *(void **)(a1 + 40);
  long long v18 = [v6 identifier];
  id v19 = [v17 indexOfObject:v18];

  if (v16 == (id)0x7FFFFFFFFFFFFFFFLL && v19 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    uint64_t v13 = 1;
    goto LABEL_17;
  }
  if (v16 != (id)0x7FFFFFFFFFFFFFFFLL && v19 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_3:
    uint64_t v13 = -1;
  }
  else if (v16 == (id)0x7FFFFFFFFFFFFFFFLL && v19 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    long long v20 = *(void **)(a1 + 32);
    id v21 = [v5 name];
    if (v21)
    {
      id v22 = [v5 name];
    }
    else
    {
      id v22 = &stru_1000CABC0;
    }
    id v24 = [v5 identifier];
    os_log_t v25 = +[NSString stringWithFormat:@"%@%@", v22, v24];
    uint64_t v26 = [v20 trimTheArticle:v25];

    if (v21) {
    os_log_t v27 = *(void **)(a1 + 32);
    }
    v28 = [v6 name];
    if (v28)
    {
      os_log_t v29 = [v6 name];
    }
    else
    {
      os_log_t v29 = &stru_1000CABC0;
    }
    v30 = [v6 identifier];
    os_log_t v31 = +[NSString stringWithFormat:@"%@%@", v29, v30];
    id v32 = [v27 trimTheArticle:v31];

    if (v28) {
    uint64_t v13 = (uint64_t)[v26 compare:v32 options:65];
    }
  }
  else if (v16 == v19)
  {
    uint64_t v13 = 0;
  }
  else if (v16 > v19)
  {
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = -1;
  }
LABEL_17:

  return v13;
}

id sub_10001E740(uint64_t a1)
{
  id v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = (void *)v3;
  if (v3) {
    id v5 = (void *)v3;
  }
  else {
    id v5 = &__NSArray0__struct;
  }
  id v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

void sub_10001EE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001EE98(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 filePath];
  if (v7)
  {
    id v8 = +[NSURL fileURLWithPath:v7 isDirectory:0];
    if (v8)
    {
      uint64_t v9 = +[NSUUID UUID];
      uint64_t v10 = [v9 UUIDString];

      uint64_t v11 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v10 isDirectory:0];
      uint64_t v12 = *(void **)(a1 + 40);
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v13 + 40);
      [v12 copyItemAtURL:v8 toURL:v11 error:&obj];
      objc_storeStrong((id *)(v13 + 40), obj);
      id v14 = *(void **)(a1 + 48);
      id v15 = [v6 remoteURL];
      [v14 setObject:v11 forKeyedSubscript:v15];

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        *a4 = 1;
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10006FF30();
  }
}

id sub_10001F51C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) assetHandleForURL:a2 prefetchedFileURL:a3 importMethod:0 lifetimeHint:0];
}

void sub_10001F938(uint64_t a1)
{
}

void sub_10001F940(uint64_t a1)
{
}

id sub_10001F948(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001F9B8;
  v3[3] = &unk_1000C5680;
  v3[4] = v1;
  return [v1 _processSignals:v3];
}

id sub_10001F9B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
}

id sub_10001F9C4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001FA34;
  v3[3] = &unk_1000C5680;
  v3[4] = v1;
  return [v1 _processSignals:v3];
}

id sub_10001FA34(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
}

void sub_100020140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose((const void *)(v65 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000201D0(uint64_t a1)
{
  id v2 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_ERROR)) {
    sub_100070830(a1, v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100020230(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = *(void **)(a1 + 40);
    id v16 = v14;
    long long v17 = [v15 shortOperationDescription];
    int v18 = 138543362;
    id v19 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ did consider external signals", (uint8_t *)&v18, 0xCu);
  }
}

void sub_1000203B0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v8 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = v8;
    id v11 = [v9 shortOperationDescription];
    int v12 = 138543362;
    id v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ did consider internal signals", (uint8_t *)&v12, 0xCu);
  }
}

void sub_1000204D8(uint64_t a1)
{
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_1000210B4;
  v113[3] = &unk_1000C5A00;
  id v2 = *(void **)(a1 + 40);
  v113[4] = *(void *)(a1 + 32);
  id v114 = v2;
  uint64_t v3 = sub_1000210B4((uint64_t)v113);
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [*(id *)(a1 + 32) subscriptionController];
  id v6 = [v5 subscriptionsWithType:3];

  id v7 = +[NSMutableSet set];
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_100021210;
  v110[3] = &unk_1000C5A28;
  id v8 = v4;
  id v111 = v8;
  id v9 = v7;
  id v112 = v9;
  [v6 enumerateObjectsUsingBlock:v110];
  id v10 = [*(id *)(a1 + 32) subscriptionController];
  id v11 = [v10 subscriptionsWithType:4];
  int v12 = v11;
  if (!v11) {
    id v11 = &__NSArray0__struct;
  }
  id v13 = [v11 fc_setByTransformingWithBlock:&stru_1000C5A68];

  if (!v3)
  {
    id v14 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100070F58();
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (v9) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  id v15 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100070E88();
  }

  if (!v9)
  {
LABEL_13:
    id v16 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100070DB8();
    }
  }
LABEL_16:
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (v13) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  id v17 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100070CE8();
  }

  if (!v13)
  {
LABEL_22:
    id v18 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100070C18();
    }
  }
LABEL_25:
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id v19 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100070B48();
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    id v20 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100070A78();
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    id v21 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000709A8();
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    id v22 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000708D8();
    }
  }
  id v23 = [v3 count];
  id v24 = (char *)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  os_log_t v25 = &v24[(unint64_t)[v9 count] + (void)v23];
  id v26 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
  os_log_t v27 = &v25[(unint64_t)[v13 count] + (void)v26];
  id v28 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
  os_log_t v29 = (char *)[*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count] + (void)v28;
  v30 = &v27[(unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count]
           + (void)v29];
  os_log_t v31 = (char *)[*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count] + (void)v30;
  id v32 = FCOperationLog;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = [*(id *)(a1 + 32) shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    v118 = v33;
    __int16 v119 = 2048;
    v120 = v31;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ finished processing signals with %lu candidates", buf, 0x16u);
  }
  if (v31)
  {
    uint64_t v34 = (uint64_t)v3;
    v93 = v3;
    if (!v3)
    {
      uint64_t v34 = +[NSSet set];
    }
    v84 = (void *)v34;
    v116[0] = v34;
    uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v90 = v35;
    if (!v35)
    {
      uint64_t v35 = +[NSSet set];
    }
    v82 = (void *)v35;
    v116[1] = v35;
    uint64_t v36 = (uint64_t)v9;
    v92 = v9;
    if (!v9)
    {
      uint64_t v36 = +[NSSet set];
    }
    v80 = (void *)v36;
    v116[2] = v36;
    uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v38 = v37;
    if (!v37)
    {
      uint64_t v38 = +[NSSet set];
    }
    v88 = v13;
    v89 = v8;
    v78 = (void *)v38;
    v116[3] = v38;
    id v39 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    id v40 = v39;
    if (!v39)
    {
      id v40 = +[NSSet set];
    }
    v86 = v6;
    v116[4] = v40;
    v41 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    id v42 = v41;
    if (!v41)
    {
      id v42 = +[NSSet set];
    }
    v116[5] = v42;
    v43 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    id v44 = v43;
    if (!v43)
    {
      id v44 = +[NSSet set];
    }
    v116[6] = v44;
    v45 = +[NSArray arrayWithObjects:v116 count:7];
    v87 = +[NSSet fc_unionOfSetsInArray:v45];

    if (v43)
    {
      if (v41) {
        goto LABEL_60;
      }
    }
    else
    {

      if (v41) {
        goto LABEL_60;
      }
    }

LABEL_60:
    if (!v39) {

    }
    if (!v37) {
    if (!v92)
    }

    if (!v90) {
    if (!v3)
    }

    id v46 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) fc_setByUnioningSet:v88];
    v91 = [v46 fc_setByMinusingSet:v87];

    v47 = FCOperationLog;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [*(id *)(a1 + 32) shortOperationDescription];
      *(_DWORD *)buf = 138543362;
      v118 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ looking for valid candidates", buf, 0xCu);
    }
    v83 = *(void **)(a1 + 32);
    uint64_t v49 = (uint64_t)v3;
    if (!v3)
    {
      uint64_t v49 = +[NSSet set];
    }
    v81 = (void *)v49;
    v115[0] = v49;
    uint64_t v50 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v85 = v50;
    if (!v50)
    {
      uint64_t v50 = +[NSSet set];
    }
    v115[1] = v50;
    uint64_t v51 = (uint64_t)v92;
    if (!v92)
    {
      uint64_t v51 = +[NSSet set];
    }
    v77 = (void *)v51;
    v79 = (void *)v50;
    v115[2] = v51;
    uint64_t v52 = (uint64_t)v91;
    if (!v91)
    {
      uint64_t v52 = +[NSSet set];
    }
    v76 = (void *)v52;
    v115[3] = v52;
    uint64_t v53 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v54 = v53;
    if (!v53)
    {
      uint64_t v54 = +[NSSet set];
    }
    v75 = (void *)v54;
    v115[4] = v54;
    uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v56 = v55;
    if (!v55)
    {
      uint64_t v56 = +[NSSet set];
    }
    v74 = (void *)v56;
    v115[5] = v56;
    uint64_t v57 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    uint64_t v58 = v57;
    if (!v57)
    {
      uint64_t v58 = +[NSSet set];
    }
    v73 = (void *)v58;
    v115[6] = v58;
    v59 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    v60 = v59;
    if (!v59)
    {
      v60 = +[NSSet set];
    }
    v115[7] = v60;
    v61 = +[NSArray arrayWithObjects:v115 count:8];
    v62 = +[NSSet fc_unionOfSetsInArray:v61];
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_1000212D0;
    v105[3] = &unk_1000C5A90;
    uint64_t v107 = *(void *)(a1 + 56);
    id v106 = v92;
    long long v108 = *(_OWORD *)(a1 + 80);
    uint64_t v109 = *(void *)(a1 + 96);
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_100021378;
    v104[3] = &unk_1000C5AB8;
    v104[4] = v109;
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_10002138C;
    v94[3] = &unk_1000C5B80;
    v63 = *(void **)(a1 + 40);
    v94[4] = *(void *)(a1 + 32);
    id v95 = v63;
    id v96 = v89;
    id v64 = v91;
    id v97 = v64;
    id v65 = v93;
    uint64_t v66 = *(void *)(a1 + 56);
    id v98 = v65;
    uint64_t v101 = v66;
    id v99 = v106;
    long long v67 = *(_OWORD *)(a1 + 88);
    long long v102 = *(_OWORD *)(a1 + 72);
    long long v103 = v67;
    id v100 = *(id *)(a1 + 48);
    [v83 _findValidAutoFavoritesWithCandidates:v62 channelsAllowedProvider:v105 topicsAllowedProvider:v104 completion:v94];

    if (!v59) {
    id v6 = v86;
    }
    if (!v57) {

    }
    id v8 = v89;
    id v9 = v92;
    if (v55)
    {
      if (v53) {
        goto LABEL_94;
      }
    }
    else
    {

      if (v53) {
        goto LABEL_94;
      }
    }

LABEL_94:
    if (!v91) {

    }
    uint64_t v3 = v93;
    if (!v92) {

    }
    if (v85)
    {
      if (v93)
      {
LABEL_100:

        id v13 = v88;
        goto LABEL_105;
      }
    }
    else
    {

      if (v93) {
        goto LABEL_100;
      }
    }

    goto LABEL_100;
  }
  v68 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v69 = *(void **)(a1 + 32);
    v70 = v68;
    v71 = [v69 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    v118 = v71;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ done because there are no candidates", buf, 0xCu);
  }
  uint64_t v72 = *(void *)(a1 + 48);
  if (v72) {
    (*(void (**)(void))(v72 + 16))();
  }
LABEL_105:
}

id sub_1000210B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) subscriptionController];
  uint64_t v3 = [v2 subscriptionsWithType:0];

  id v4 = [v3 count];
  if (v4 < [*(id *)(a1 + 40) numSubscriptionsToDisableDefaultTopics]) {
    goto LABEL_2;
  }
  uint64_t v10 = (uint64_t)[*(id *)(a1 + 40) numEventsToDisableDefaultTopics];
  if (v10)
  {
    unint64_t v11 = v10;
    if (v10 >= 1)
    {
      int v12 = [*(id *)(a1 + 32) aggregateStore];
      id v5 = [v12 baselineAggregateWithConfigurableValues:*(void *)(a1 + 40)];

      if ((unint64_t)[v5 eventCount] >= v11)
      {
        id v8 = +[NSSet set];
        goto LABEL_3;
      }
    }
LABEL_2:
    id v5 = [*(id *)(a1 + 32) whitelist];
    id v6 = [v5 defaultTags];
    id v7 = [v6 allKeys];
    id v8 = +[NSSet setWithArray:v7];

LABEL_3:
    goto LABEL_4;
  }
  id v8 = +[NSSet set];
LABEL_4:

  return v8;
}

void sub_100021210(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 dateAdded];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v8 tagID];
  [v4 setObject:v3 forKeyedSubscript:v5];

  if ([v8 subscriptionOrigin] == (id)3)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v8 tagID];
    [v6 addObject:v7];
  }
}

NSString *__cdecl sub_1000212C8(id a1, FCSubscription *a2)
{
  return (NSString *)[(FCSubscription *)a2 tagID];
}

uint64_t sub_1000212D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v3] & 1) != 0
    || ([*(id *)(a1 + 32) containsObject:v3] & 1) != 0
    || ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) containsObject:v3] & 1) != 0
    || ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:v3] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = (uint64_t)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) containsObject:v3];
  }

  return v4;
}

id sub_100021378(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:a2];
}

void sub_10002138C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    v59 = v7;
    __int16 v60 = 2048;
    id v61 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ found %lu valid candidates", buf, 0x16u);
  }
  [*(id *)(a1 + 40) autoUnfavoriteFactor];
  double v9 = v8;
  [*(id *)(a1 + 40) autoGroupableFactor];
  double v11 = v9 / v10;
  [*(id *)(a1 + 40) appUsagePriorFactorExponent];
  uint64_t v13 = v12;
  [*(id *)(a1 + 40) appUsageTagFavorabilityExponent];
  id v14 = *(void **)(a1 + 32);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000218B8;
  v52[3] = &unk_1000C5AE0;
  void v52[4] = v14;
  uint64_t v54 = v13;
  uint64_t v55 = v15;
  uint64_t v16 = *(void *)(a1 + 48);
  id v53 = *(id *)(a1 + 56);
  double v56 = v11;
  double v57 = v9;
  id v17 = [v14 auditCandidates:v3 autoSubscriptionAddedDateByTagId:v16 multiplierProvider:v52];
  id v18 = [v17 copy];
  id v19 = [v17 count];
  if (v19 > [*(id *)(a1 + 40) maxNumberOfSuggestions])
  {
    id v20 = [*(id *)(a1 + 32) tagRanker];
    id v21 = [v17 allObjects];
    id v22 = [v20 scoresForTagIDs:v21];

    id v23 = [v17 allObjects];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10002193C;
    v50[3] = &unk_1000C5B08;
    id v51 = v22;
    id v24 = v22;
    os_log_t v25 = [v23 sortedArrayUsingComparator:v50];
    id v26 = [v25 fc_safeSubarrayWithCountFromFront:[*(id *)(a1 + 40) maxNumberOfSuggestions]];
    uint64_t v27 = +[NSSet setWithArray:v26];

    id v17 = (void *)v27;
  }
  id v28 = objc_alloc_init(FRPersonalizationAutoFavorites);
  v43 = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472;
  v45 = sub_1000219D8;
  id v46 = &unk_1000C5B58;
  id v29 = v17;
  id v47 = v29;
  id v30 = *(id *)(a1 + 56);
  uint64_t v31 = *(void *)(a1 + 32);
  id v48 = v30;
  uint64_t v49 = v31;
  id v32 = +[NSDictionary fc_dictionary:&v43];
  -[FRPersonalizationAutoFavorites setAutoFavoriteTagIDsToScores:](v28, "setAutoFavoriteTagIDsToScores:", v32, v43, v44, v45, v46);

  id v33 = [*(id *)(a1 + 56) fc_setByIntersectingSet:v29];
  [(FRPersonalizationAutoFavorites *)v28 setGroupableFavoriteTagIDs:v33];

  uint64_t v34 = [*(id *)(a1 + 64) fc_setByIntersectingSet:v18];
  [(FRPersonalizationAutoFavorites *)v28 setDefaultCandidates:v34];

  uint64_t v35 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) fc_setByIntersectingSet:v18];
  [(FRPersonalizationAutoFavorites *)v28 setInternalSignalAutoFavoriteCandidates:v35];

  uint64_t v36 = [*(id *)(a1 + 72) fc_setByIntersectingSet:v18];
  [(FRPersonalizationAutoFavorites *)v28 setExistingInternalSignalAutoFavoriteCandidates:v36];

  uint64_t v37 = [*(id *)(a1 + 56) fc_setByIntersectingSet:v18];
  [(FRPersonalizationAutoFavorites *)v28 setGroupableCandidates:v37];

  uint64_t v38 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) fc_setByIntersectingSet:v18];
  [(FRPersonalizationAutoFavorites *)v28 setPortraitAutoFavoriteCandidates:v38];

  id v39 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) fc_setByIntersectingSet:v18];
  [(FRPersonalizationAutoFavorites *)v28 setAppUsageAutoFavoriteCandidates:v39];

  id v40 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) fc_setByIntersectingSet:v18];
  [(FRPersonalizationAutoFavorites *)v28 setSafariAutoFavoriteCandidates:v40];

  v41 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) fc_setByIntersectingSet:v18];
  [(FRPersonalizationAutoFavorites *)v28 setLocationAutoFavoriteCandidates:v41];

  [*(id *)(a1 + 32) setResultAutoFavorites:v28];
  uint64_t v42 = *(void *)(a1 + 80);
  if (v42) {
    (*(void (**)(void))(v42 + 16))();
  }
}

double sub_1000218B8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  id v6 = a2;
  [v3 metricMultiplierForTagID:v6 withPriorFactorExponent:v4 tagFavorabilityExponent:v5];
  double v8 = v7;
  LODWORD(v3) = [*(id *)(a1 + 40) containsObject:v6];

  uint64_t v9 = 72;
  if (v3) {
    uint64_t v9 = 64;
  }
  return v8 * *(double *)(a1 + v9);
}

id sub_10002193C(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 objectForKeyedSubscript:a3];
  double v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (_UNKNOWN **)v7;
  }
  else {
    uint64_t v9 = &off_1000CFBB8;
  }
  double v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  if (v10) {
    double v11 = v10;
  }
  else {
    double v11 = &off_1000CFBB8;
  }
  id v12 = [v9 compare:v11];

  return v12;
}

void sub_1000219D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) fc_setByMinusingSet:*(void *)(a1 + 40)];
  double v5 = [*(id *)(a1 + 48) aggregateStore];
  id v6 = [v4 allObjects];
  uint64_t v7 = +[FCPersonalizationFeature featuresFromTagIDs:v6];
  double v8 = [v5 aggregatesForFeatures:v7];

  uint64_t v9 = [*(id *)(a1 + 48) aggregateStore];
  double v10 = [*(id *)(a1 + 48) configurableValues];
  double v11 = [v9 baselineAggregateWithConfigurableValues:v10];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021B64;
  v15[3] = &unk_1000C5B30;
  v15[4] = *(void *)(a1 + 48);
  id v16 = v8;
  id v17 = v3;
  id v18 = v11;
  id v12 = v11;
  id v13 = v3;
  id v14 = v8;
  [v4 enumerateObjectsUsingBlock:v15];
}

void sub_100021B64(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [*(id *)(a1 + 32) whitelist];
  double v4 = [*(id *)(a1 + 32) configurableValues];
  double v5 = [v4 defaultScoringConfig];
  [v5 baselineRatePrior];
  FCPersonalizationBaselineClicksMultiplerForTagID();

  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = +[FCPersonalizationFeature featureFromTagID:v12];
  double v8 = [v6 objectForKeyedSubscript:v7];

  uint64_t v9 = *(void **)(a1 + 56);
  double v10 = [*(id *)(a1 + 32) aggregateStore];
  [v10 decayRate];
  if (v8) {
    [v8 personalizationValueWithBaseline:v9];
  }
  else {
    [v9 personalizationValueWithBaseline:0];
  }
  double v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v12];
}

void sub_100022034(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [*(id *)(a1 + 32) subscriptionController];
  double v4 = [v3 mutedTagIDs];
  if ([v4 containsObject:v15]) {
    goto LABEL_4;
  }
  double v5 = [*(id *)(a1 + 32) subscriptionController];
  id v6 = [v5 subscribedTagIDs];
  if ([v6 containsObject:v15])
  {

LABEL_4:
    goto LABEL_5;
  }
  uint64_t v7 = [*(id *)(a1 + 32) subscriptionController];
  double v8 = [v7 ignoredTagIDs];
  unsigned __int8 v9 = [v8 containsObject:v15];

  if ((v9 & 1) == 0)
  {
    double v10 = [*(id *)(a1 + 40) defaultTags];
    double v11 = [v10 objectForKeyedSubscript:v15];
    if (v11)
    {
    }
    else
    {
      id v12 = [*(id *)(a1 + 40) optionalTags];
      id v13 = [v12 objectForKeyedSubscript:v15];

      if (!v13)
      {
        id v14 = *(void **)(a1 + 56);
        goto LABEL_13;
      }
    }
    id v14 = *(void **)(a1 + 48);
LABEL_13:
    [v14 addObject:v15];
  }
LABEL_5:
}

void sub_1000221A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        unsigned __int8 v9 = [v3 objectForKeyedSubscript:v8];
        if ([v9 isSubscribable]
          && +[FCTagController isTagAllowed:v9]
          && ([v9 isSports] & 1) == 0)
        {
          id v10 = [v9 tagType];
          if (v10 == (id)1)
          {
            if (([v9 isHidden] & 1) == 0
              && (*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
            {
LABEL_16:
              [*(id *)(a1 + 32) addObject:v8];
            }
          }
          else if (v10 == (id)2 {
                 && ([v9 isHidden] & 1) == 0
          }
                 && ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) != 0)
          {
            goto LABEL_16;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_100022358(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t sub_100022378(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_1000225C8(uint64_t a1, void *a2)
{
  id v23 = a2;
  id v3 = [v23 featureKey];
  id v4 = +[FCPersonalizationFeature featureForIdentifier:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 tagID];
    [*(id *)(a1 + 32) internalUsageSignalWeight];
    double v7 = v6;
    [*(id *)(a1 + 40) ctrForTagID:v5 withAggregate:v23 baselineAggregate:*(void *)(a1 + 48)];
    double v9 = v7 * v8;
    id v10 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) appUsagePriorFactorExponent];
    double v12 = v11;
    [*(id *)(a1 + 32) appUsageTagFavorabilityExponent];
    [v10 metricMultiplierForTagID:v5 withPriorFactorExponent:v12 tagFavorabilityExponent:v13];
    double v15 = v14;
    if ([*(id *)(a1 + 40) shouldAcceptAggregate:v23 withCtr:v9 minEvents:*(double *)(a1 + 72) minClicks:*(double *)(a1 + 80) minRate:*(double *)(a1 + 88) baseRate:*(double *)(a1 + 96) multiplier:v14])
    {
      id v16 = (id *)(a1 + 56);
    }
    else
    {
      double v17 = *(double *)(a1 + 72);
      double v18 = *(double *)(a1 + 80);
      double v19 = *(double *)(a1 + 88);
      double v20 = *(double *)(a1 + 96);
      id v21 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) autoGroupableFactor];
      if (![v21 shouldAcceptAggregate:v23 withCtr:v9 minEvents:v17 minClicks:v18 minRate:v19 baseRate:v20 multiplier:v15 / v22])
      {
LABEL_7:

        goto LABEL_8;
      }
      id v16 = (id *)(a1 + 64);
    }
    [*v16 addObject:v5];
    goto LABEL_7;
  }
LABEL_8:
}

void sub_100022A74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    double v6 = v4;
    double v7 = [v5 shortOperationDescription];
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did consider location", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

void sub_100022B68(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)a1[4];
    double v6 = v4;
    double v7 = [v5 shortOperationDescription];
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did fetch local areas provider", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = [v3 autoFavoriteTagIDsForLocation:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

double sub_100022E84(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 portraitSignalWeight];
  double v6 = v5;
  double v7 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) portraitPriorFactorExponent];
  double v9 = v8;
  [*(id *)(a1 + 32) portraitTagFavorabilityExponent];
  [v7 metricMultiplierForTagID:v4 withPriorFactorExponent:v9 tagFavorabilityExponent:v10];
  double v12 = v11;

  return v6 * v12;
}

void sub_100023168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100023198(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  double v8 = (void *)FCBiomeLog;
  if (os_log_type_enabled(FCBiomeLog, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = *(void **)(a1 + 32);
    uint64_t v10 = v8;
    double v11 = [v9 shortOperationDescription];
    int v45 = 138543362;
    id v46 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ did consider Biome", (uint8_t *)&v45, 0xCu);
  }
  uint64_t v12 = [*(id *)(a1 + 32) bundleIDMapping];

  if (!v12)
  {
    uint64_t v13 = FCBiomeLog;
    if (os_log_type_enabled(FCBiomeLog, OS_LOG_TYPE_ERROR)) {
      sub_1000711EC(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    double v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = &__NSArray0__struct;
  }
  id v23 = [*(id *)(a1 + 32) urlMapping];

  if (!v23)
  {
    id v24 = FCBiomeLog;
    if (os_log_type_enabled(FCBiomeLog, OS_LOG_TYPE_ERROR)) {
      sub_1000711B4(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
    id v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = &__NSArray0__struct;
  }
  id v34 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  uint64_t v35 = (char *)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  uint64_t v36 = FCBiomeLog;
  BOOL v37 = os_log_type_enabled(FCBiomeLog, OS_LOG_TYPE_DEFAULT);
  if (&v35[(void)v34])
  {
    if (v37)
    {
      v41 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v42 = v36;
      v43 = (char *)[v41 count];
      id v44 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
      int v45 = 134217984;
      id v46 = &v43[(void)v44];
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Got back %lu results from Biome", (uint8_t *)&v45, 0xCu);
    }
    [*(id *)(a1 + 32) processAppSignals:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) safariSignals:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) completion:*(void *)(a1 + 40)];
  }
  else
  {
    if (v37)
    {
      LOWORD(v45) = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Didn't get any results back from Biome", (uint8_t *)&v45, 2u);
    }
    uint64_t v38 = *(void *)(a1 + 40);
    if (v38)
    {
      id v39 = +[NSSet set];
      id v40 = +[NSSet set];
      (*(void (**)(uint64_t, void *, void *))(v38 + 16))(v38, v39, v40);
    }
  }
}

void sub_100023AF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = *(void **)(a1 + 32);
    double v9 = v7;
    uint64_t v10 = [v8 shortOperationDescription];
    int v12 = 138543362;
    uint64_t v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ did process app signals", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

void sub_100023C04(id a1, NSDictionary *a2, NSMutableDictionary *a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023C98;
  v5[3] = &unk_1000C5D90;
  id v6 = a3;
  id v4 = v6;
  [(NSDictionary *)a2 enumerateKeysAndObjectsUsingBlock:v5];
}

void sub_100023C98(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  double v8 = [v5 objectForKeyedSubscript:v7];
  double v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  id v11 = v10;

  [v11 addObject:v6];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v7];
}

void sub_100023D4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023EBC;
  v8[3] = &unk_1000C5E30;
  id v9 = *(id *)(a1 + 32);
  id v7 = v6;
  char v17 = *(unsigned char *)(a1 + 80);
  id v14 = v7;
  uint64_t v16 = v18;
  id v15 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  [v5 enumerateObjectsUsingBlock:v8];

  _Block_object_dispose(v18, 8);
}

void sub_100023EA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100023EBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (char *)[v3 type];
  id v5 = [v3 content];
  id v6 = [v3 date];

  if ((unint64_t)(v4 - 2) < 2)
  {
    id v7 = [*(id *)(a1 + 32) tagScoresForBundleID:v5];
    if ([v7 count])
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000241CC;
      v30[3] = &unk_1000C5DB8;
      double v8 = (id *)v31;
      id v9 = *(id *)(a1 + 72);
      uint64_t v11 = *(void *)(a1 + 88);
      id v10 = (unsigned char *)(a1 + 88);
      char v32 = v10[8];
      v31[0] = v9;
      v31[1] = v11;
      [v7 fc_dictionaryByTransformingValuesWithBlock:v30];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*((void *)v10 - 1) + 16))();
      if (*((void *)v10 - 5) && objc_msgSend(v6, "compare:") == (id)-1) {
        goto LABEL_12;
      }
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10002424C;
      v28[3] = &unk_1000C5DE0;
      id v13 = &v29;
      id v12 = v12;
      id v29 = v12;
      id v14 = (void ***)v28;
LABEL_11:
      +[FRPersonalizationFeatureBundle personalizationFeatureBundleForFeaturesGenerator:](FRPersonalizationFeatureBundle, "personalizationFeatureBundleForFeaturesGenerator:", v14, v17, v18, v19, v20, v21, v22, v23, v24, v25);

LABEL_12:
      ++*(void *)(*(void *)(*(void *)v10 + 8) + 24);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v4 == (char *)1)
  {
    id v7 = [*(id *)(a1 + 56) tagScoresForURL:v5];
    if ([v7 count])
    {
      double v22 = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472;
      id v24 = sub_1000242AC;
      uint64_t v25 = &unk_1000C5E08;
      double v8 = (id *)v26;
      id v15 = *(id *)(a1 + 72);
      uint64_t v16 = *(void *)(a1 + 88);
      id v10 = (unsigned char *)(a1 + 88);
      char v27 = v10[8];
      v26[0] = v15;
      v26[1] = v16;
      [v7 fc_dictionaryByTransformingValuesWithKeyAndValueBlock:&v22];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*((void *)v10 - 1) + 16))();
      if (*((void *)v10 - 5) && objc_msgSend(v6, "compare:") == (id)-1) {
        goto LABEL_12;
      }
      char v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      uint64_t v19 = sub_10002432C;
      uint64_t v20 = &unk_1000C5DE0;
      id v13 = &v21;
      id v12 = v12;
      id v21 = v12;
      id v14 = &v17;
      goto LABEL_11;
    }
LABEL_13:
  }
}

NSNumber *sub_1000241CC(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  double v5 = v3 * (*(double (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v4);

  return +[NSNumber numberWithDouble:v5];
}

id sub_10002424C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) allKeys];
  id v2 = +[FCPersonalizationFeature featuresFromTagIDs:v1];

  return v2;
}

NSNumber *sub_1000242AC(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 doubleValue];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  double v6 = v4 * (*(double (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5);

  return +[NSNumber numberWithDouble:v6];
}

id sub_10002432C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) allKeys];
  id v2 = +[FCPersonalizationFeature featuresFromTagIDs:v1];

  return v2;
}

long double sub_10002438C(uint64_t a1, unint64_t a2)
{
  double v3 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) appUsageOccurrenceDecayMultiplier];
  return v3 * pow(v4, (double)a2);
}

long double sub_1000243CC(uint64_t a1, unint64_t a2)
{
  double v3 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) safariOccurrenceDecayMultiplier];
  return v3 * pow(v4, (double)a2);
}

void sub_100024AC4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  double v8 = [v5 resultCursor];
  [v8 setLastInternalSignalAutoFavorites:v7];

  id v9 = [*(id *)(a1 + 32) resultCursor];
  [v9 setLastInternalSignalGroupableFavorites:v6];

  id v10 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v10);
}

void sub_100024B58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) resultCursor];
  double v3 = [v6 lastInternalSignalAutoFavorites];
  long double v4 = [*(id *)(a1 + 32) resultCursor];
  uint64_t v5 = [v4 lastInternalSignalGroupableFavorites];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v5);
}

void sub_100024BF8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) resultCursor];
  double v3 = [v6 lastInternalSignalAutoFavorites];
  long double v4 = [*(id *)(a1 + 32) resultCursor];
  uint64_t v5 = [v4 lastInternalSignalGroupableFavorites];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v5);
}

void sub_100024FD8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v20 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[NSUserDefaults standardUserDefaults];
  unsigned int v13 = [v12 BOOLForKey:FCPersonalizationSimulateSuggestions];

  if (v13)
  {
    uint64_t v14 = [v20 setByAddingObjectsFromArray:&off_1000CF990];

    uint64_t v15 = [v10 setByAddingObjectsFromArray:&off_1000CF9A8];

    uint64_t v16 = [v9 setByAddingObjectsFromArray:&off_1000CF9C0];

    uint64_t v17 = [v11 setByAddingObjectsFromArray:&off_1000CF9D8];

    id v18 = (id)v14;
    id v9 = (id)v16;
    id v10 = (id)v15;
    id v11 = (id)v17;
  }
  else
  {
    id v18 = v20;
  }
  id v21 = v18;
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    (*(void (**)(uint64_t, id, id, id, id))(v19 + 16))(v19, v21, v9, v10, v11);
  }
}

void sub_100025148(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  double v8 = [v5 resultCursor];
  [v8 setLastAppUsageAutoFavoriteResults:v7];

  id v9 = [*(id *)(a1 + 32) resultCursor];
  [v9 setLastSafariAutoFavoriteResults:v6];

  id v10 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002523C;
  v11[3] = &unk_1000C5EF8;
  void v11[4] = v10;
  id v12 = *(id *)(a1 + 40);
  [v10 considerLocation:v11];
}

void sub_10002523C(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 resultCursor];
  [v5 setLastLocationAutoFavoriteResults:v4];

  id v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

void sub_1000252A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = [*(id *)(a1 + 32) resultCursor];
  id v4 = [v3 lastPortraitAutoFavoriteResults];
  uint64_t v5 = [*(id *)(a1 + 32) resultCursor];
  id v6 = [v5 lastAppUsageAutoFavoriteResults];
  id v7 = [*(id *)(a1 + 32) resultCursor];
  double v8 = [v7 lastSafariAutoFavoriteResults];
  id v9 = [*(id *)(a1 + 32) resultCursor];
  id v10 = [v9 lastLocationAutoFavoriteResults];
  (*(void (**)(uint64_t, void *, void *, void *, void *))(v2 + 16))(v2, v4, v6, v8, v10);

  id v11 = +[NSDate date];
  id v12 = [*(id *)(a1 + 32) resultCursor];
  [v12 setLastExternalSignalProcessingDate:v11];

  unsigned int v13 = [*(id *)(a1 + 32) resultCursor];
  uint64_t v14 = [v13 lastExternalSignalProcessingDate];
  uint64_t v15 = [*(id *)(a1 + 32) resultCursor];
  [v15 setCoreDuetLastQueryDate:v14];

  id v18 = [*(id *)(a1 + 32) resultCursor];
  uint64_t v16 = [v18 lastExternalSignalProcessingDate];
  uint64_t v17 = [*(id *)(a1 + 32) resultCursor];
  [v17 setPortraitLastQueryDate:v16];
}

id sub_100025B50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = +[FCTagIDFeature featureFromTagID:v3];
  id v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [*(id *)(a1 + 64) objectForKeyedSubscript:v3];
  LOBYTE(a1) = [v4 shouldRejectTagID:v3 withAggregate:v7 baseline:v8 currentDate:v9 addedDate:v10 maxIdleTime:*(double *)(a1 + 80) minEvents:*(double *)(a1 + 88) minRate:*(double *)(a1 + 96) baseRate:*(double *)(a1 + 104) multiplier:(*(double (**)(void))(*(void *)(a1 + 72) + 16))()];

  if (a1) {
    id v11 = 0;
  }
  else {
    id v11 = v3;
  }

  return v11;
}

void sub_100026240(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void sub_100026268(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

double sub_1000263F0(id a1, NSString *a2)
{
  return 1.0;
}

void sub_1000263FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000264E4;
  v6[3] = &unk_1000C5FA8;
  id v9 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void sub_1000264E4(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
  id v8 = +[NSString stringWithFormat:@"Considering signal %@ from Portait with threshold %@", v15, v7];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);

  if ([*(id *)(a1 + 32) containsObject:v15])
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = +[NSString stringWithFormat:@"Portrait signal from %@ not added because it is disabled", v15];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    [v5 doubleValue];
    double v12 = v11 * (*(double (**)(void))(*(void *)(a1 + 56) + 16))();
    if (v12 >= *(double *)(a1 + 64))
    {
      [*(id *)(a1 + 40) addObject:v15];
      uint64_t v13 = *(void *)(a1 + 48);
      id v10 = +[NSNumber numberWithDouble:v12];
      +[NSString stringWithFormat:@"Autofavorite %@ based on Portrait Signal with score %@", v15, v10];
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v10 = +[NSNumber numberWithDouble:v12];
      +[NSString stringWithFormat:@"Portrait signal from %@ not added to auto-favorites with score %@", v15, v10];
    uint64_t v14 = };
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
}

void sub_100026938(uint64_t a1)
{
  uint64_t v2 = FRPortraitLog;
  if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "No topics found for articleID: %{public}@ when considering portrait feedback for explicit engagement", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000269E0(uint64_t a1)
{
  uint64_t v2 = FRPortraitLog;
  if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "No topics found for articleID: %{public}@ when considering portrait feedback for explicit engagement", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100026A88(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = FRPortraitLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_ERROR)) {
      sub_100071AFC();
    }
  }
  else if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully submitted portrait feedback for explicit engagement with articleID: %{public}@ and topicIDs: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100026DDC(uint64_t a1)
{
  uint64_t v2 = FRPortraitLog;
  if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "No topics found for articleID: %{public}@ when considering portrait feedback for explicit rejection", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100026E84(uint64_t a1)
{
  uint64_t v2 = FRPortraitLog;
  if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "No topics found for articleID: %{public}@ when considering portrait feedback for explicit rejection", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100026F2C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = FRPortraitLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_ERROR)) {
      sub_100071B64();
    }
  }
  else if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully submitted portrait feedback for explicit rejection with articleID: %{public}@ and topicIDs: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100027238(uint64_t a1)
{
  uint64_t v2 = FRPortraitLog;
  if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "No topics found for articleID: %{public}@ when considering portrait feedback for implicit engagement", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000272E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = FRPortraitLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_ERROR)) {
      sub_100071BCC();
    }
  }
  else if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully submitted portrait feedback for implicit engagement with articleID: %{public}@ and topicIDs: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_1000275EC(uint64_t a1)
{
  uint64_t v2 = FRPortraitLog;
  if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "No topics found for articleID: %{public}@ when considering portrait feedback for implicit rejection", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100027694(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = FRPortraitLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_ERROR)) {
      sub_100071C34();
    }
  }
  else if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully submitted portrait feedback for implicit rejection with articleID: %{public}@ and topicIDs: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100027784(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100028988(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  [*(id *)(a1 + 32) size];
  CGContextTranslateCTM(CurrentContext, 0.0, -v3);
  CGContextSaveGState(CurrentContext);
  CGContextClipToMask(CurrentContext, *(CGRect *)(a1 + 48), (CGImageRef)[*(id *)(a1 + 32) CGImage]);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[*(id *)(a1 + 40) CGColor]);
  CGContextFillRect(CurrentContext, *(CGRect *)(a1 + 48));

  CGContextRestoreGState(CurrentContext);
}

void sub_100028B4C(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -*(double *)(a1 + 56));
  CGContextSaveGState(CurrentContext);
  CGContextClipToMask(CurrentContext, *(CGRect *)(a1 + 64), (CGImageRef)[*(id *)(a1 + 32) CGImage]);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[*(id *)(a1 + 40) CGColor]);
  CGContextFillRect(CurrentContext, *(CGRect *)(a1 + 64));

  CGContextRestoreGState(CurrentContext);
}

id sub_100028E10(uint64_t a1)
{
  [*(id *)(a1 + 32) size];
  double v3 = v2;
  [*(id *)(a1 + 32) size];
  double v5 = v4;
  [*(id *)(a1 + 40) setFill];
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = v3;
  v9.size.height = v5;
  UIRectFill(v9);
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 drawInRect:0.0, 0.0, v3, v5];
}

id sub_100029078(uint64_t a1)
{
  [*(id *)(a1 + 32) setFill];
  [*(id *)(a1 + 40) size];
  double v3 = v2;
  [*(id *)(a1 + 40) size];
  double v5 = v4;
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = v3;
  v9.size.height = v5;
  UIRectFill(v9);
  uint64_t v6 = *(void **)(a1 + 40);

  return [v6 drawInRect:1 blendMode:0.0 alpha:0.0 v3, v5, 1.0];
}

id sub_1000292C4(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 setFill];
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  double v3 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [v3 addClip];

  double v4 = *(void **)(a1 + 40);
  double v5 = *(double *)(a1 + 88);

  return [v4 drawInRect:0.0, 0.0, v5, v5];
}

void sub_100029660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029684(uint64_t a1, CGContext *a2)
{
  v26.origin.CGFloat x = FRRectWithSize();
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  CGRect v27 = CGRectInset(v26, 1.0, 1.0);
  int v8 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height, *(double *)(a1 + 80) * *(double *)(a1 + 88));
  CGContextBeginPath(a2);
  id v24 = v8;
  CGContextAddPath(a2, (CGPathRef)[v24 CGPath]);
  CGContextClip(a2);
  CGRect v9 = *(void **)(a1 + 32);
  if (v9)
  {
    CGContextSetFillColorWithColor(a2, (CGColorRef)[v9 CGColor]);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    CGContextFillRect(a2, v28);
  }
  CGContextSetInterpolationQuality(a2, kCGInterpolationHigh);
  double v10 = FRCenterOfRect(x, y, width, height);
  double v12 = FRRectWithCenterAndSize(v10, v11, *(double *)(a1 + 96));
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  uint64_t v19 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  v29.origin.CGFloat x = v12;
  v29.origin.CGFloat y = v14;
  v29.size.CGFloat width = v16;
  v29.size.CGFloat height = v18;
  CGContextDrawImage(a2, v29, v19);
  if (*(void *)(a1 + 48))
  {
    [v24 bounds];
    CGContextAddEllipseInRect(a2, v30);
    CGContextSetStrokeColorWithColor(a2, (CGColorRef)[*(id *)(a1 + 48) CGColor]);
    CGContextSetLineWidth(a2, *(CGFloat *)(a1 + 88));
    CGContextStrokePath(a2);
  }
  Image = CGBitmapContextCreateImage(a2);
  id v21 = [objc_alloc((Class)UIImage) initWithCGImage:Image scale:*(void *)(a1 + 112) orientation:*(double *)(a1 + 88)];
  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  CGImageRelease(Image);
}

void sub_100029BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029C08(uint64_t a1, CGContextRef c)
{
  CGContextSetInterpolationQuality(c, kCGInterpolationHigh);
  CGContextScaleCTM(c, 1.0, -1.0);
  CGContextTranslateCTM(c, 0.0, -*(double *)(a1 + 48));
  CGFloat v4 = *(double *)(a1 + 56);
  CGFloat v5 = *(double *)(a1 + 64);
  uint64_t v6 = (CGImage *)[*(id *)(a1 + 32) CGImage];
  v12.origin.CGFloat x = 0.0;
  v12.origin.CGFloat y = 0.0;
  v12.size.CGFloat width = v4;
  v12.size.CGFloat height = v5;
  CGContextDrawImage(c, v12, v6);
  Image = CGBitmapContextCreateImage(c);
  id v8 = [objc_alloc((Class)UIImage) initWithCGImage:Image scale:*(void *)(a1 + 80) orientation:*(double *)(a1 + 72)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  CGImageRelease(Image);
}

id sub_100029F1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) drawInRect:*(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64)];
}

id sub_10002A080(uint64_t a1)
{
  return [*(id *)(a1 + 32) drawAtPoint: -*(double *)(a1 + 40), -*(double *)(a1 + 48)];
}

void sub_10002A2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002A2F0(uint64_t a1, CGContextRef c)
{
  CGContextSetInterpolationQuality(c, kCGInterpolationHigh);
  CGFloat v4 = *(double *)(a1 + 56);
  CGFloat v5 = *(double *)(a1 + 64);
  CGFloat v6 = *(double *)(a1 + 72);
  uint64_t v7 = (CGImage *)[*(id *)(a1 + 32) CGImage];
  v18.origin.CGFloat x = 0.0;
  v18.origin.CGFloat y = v4;
  v18.size.CGFloat width = v5;
  v18.size.CGFloat height = v6;
  CGContextDrawImage(c, v18, v7);
  id v8 = +[UIColor clearColor];
  CGContextSetFillColorWithColor(c, (CGColorRef)[v8 CGColor]);

  v19.size.CGFloat height = *(CGFloat *)(a1 + 56);
  v19.size.CGFloat width = *(CGFloat *)(a1 + 64);
  v19.origin.CGFloat x = 0.0;
  v19.origin.CGFloat y = 0.0;
  CGContextFillRect(c, v19);
  double v9 = *(double *)(a1 + 88);
  CGFloat v10 = ((double)*(unint64_t *)(a1 + 80) - v9) * 0.5;
  CGFloat v11 = *(double *)(a1 + 56) - v9 * 0.5;
  CGRect v12 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  v20.origin.CGFloat x = v10;
  v20.origin.CGFloat y = v11;
  v20.size.CGFloat width = v9;
  v20.size.CGFloat height = v9;
  CGContextDrawImage(c, v20, v12);
  Image = CGBitmapContextCreateImage(c);
  id v14 = [objc_alloc((Class)UIImage) initWithCGImage:Image scale:[*(id *)(a1 + 32) imageOrientation] orientation:*(double *)(a1 + 96)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  CGFloat v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  CGImageRelease(Image);
}

void sub_10002A678(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 fillWithBlendMode:0 alpha:1.0];
}

void sub_10002AD64(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -*(double *)(a1 + 48));
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v3, v4, *(double *)(a1 + 56));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addClip];
  CGFloat v5 = (CGImage *)[*(id *)(a1 + 32) CGImage];
  v8.origin.CGFloat x = 0.0;
  v8.origin.CGFloat y = 0.0;
  v8.size.CGFloat width = v3;
  v8.size.CGFloat height = v4;
  CGContextDrawImage(CurrentContext, v8, v5);
}

void sub_10002B61C(_Unwind_Exception *a1)
{
}

id sub_10002B664(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -*(double *)(a1 + 56));
  CGContextDrawImage(CurrentContext, *(CGRect *)(a1 + 64), (CGImageRef)[*(id *)(a1 + 32) CGImage]);
  Data = CGBitmapContextGetData(CurrentContext);
  size_t Width = CGBitmapContextGetWidth(CurrentContext);
  size_t Height = CGBitmapContextGetHeight(CurrentContext);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(CurrentContext);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B7A0;
  v8[3] = &unk_1000C61A0;
  __int16 v15 = *(_WORD *)(a1 + 120);
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
  CGFloat v10 = Data;
  size_t v11 = Height;
  size_t v12 = Width;
  size_t v13 = BytesPerRow;
  uint64_t v14 = *(void *)(a1 + 112);
  void v8[4] = *(void *)(a1 + 40);
  return +[FRMacros useManagedContextWithSize:0 opaque:1 forceSRGB:v8 scale:*(double *)(a1 + 48) contextBlock:*(double *)(a1 + 56)];
}

void sub_10002B7A0(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  dest.data = CGBitmapContextGetData(CurrentContext);
  dest.CGFloat width = CGBitmapContextGetWidth(CurrentContext);
  dest.CGFloat height = CGBitmapContextGetHeight(CurrentContext);
  dest.rowBytes = CGBitmapContextGetBytesPerRow(CurrentContext);
  if (*(unsigned char *)(a1 + 96))
  {
    uint32_t v3 = vcvtmd_u64_f64(*(double *)(a1 + 40) * *(double *)(a1 + 48) * 3.0 * 2.50662827 * 0.25 + 0.5) | 1;
    vImageBoxConvolve_ARGB8888((const vImage_Buffer *)(a1 + 56), &dest, 0, 0, 0, v3, v3, 0, 8u);
    vImageBoxConvolve_ARGB8888(&dest, (const vImage_Buffer *)(a1 + 56), 0, 0, 0, v3, v3, 0, 8u);
    vImageBoxConvolve_ARGB8888((const vImage_Buffer *)(a1 + 56), &dest, 0, 0, 0, v3, v3, 0, 8u);
  }
  if (*(unsigned char *)(a1 + 97))
  {
    double v4 = *(double *)(a1 + 88);
    double v18 = v4 * 0.9278 + 0.0722;
    double v19 = v4 * -0.0722 + 0.0722;
    double v20 = v19;
    float64x2_t v22 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FE6E2EB1C432CA5uLL), (float64x2_t)xmmword_1000BD2F0, v4);
    float64_t v23 = v22.f64[0];
    uint64_t v29 = 0x3FF0000000000000;
    uint64_t v21 = 0;
    uint64_t v24 = 0;
    float64x2_t v5 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FCB367A0F9096BCuLL), (float64x2_t)xmmword_1000BD300, v4);
    float64_t v25 = v5.f64[0];
    float64x2_t v26 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v6 = 0;
    uint64_t v7 = &v18;
    float64x2_t v8 = (float64x2_t)vdupq_n_s64(0x4070000000000000uLL);
    do
    {
      float64x2_t v9 = *(float64x2_t *)v7;
      float64x2_t v10 = *(float64x2_t *)(v7 + 2);
      v7 += 4;
      *(int16x4_t *)&v16[v6] = vmovn_s32(vcvtq_s32_f32(vrndaq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(v9, v8)), vmulq_f64(v10, v8)))));
      v6 += 4;
    }
    while (v6 != 16);
    if (*(unsigned char *)(a1 + 96))
    {
      p_vImage_Buffer dest = &dest;
      size_t v12 = (vImage_Buffer *)(a1 + 56);
    }
    else
    {
      size_t v12 = &dest;
      p_vImage_Buffer dest = (vImage_Buffer *)(a1 + 56);
    }
    vImageMatrixMultiply_ARGB8888(p_dest, v12, v16, 256, 0, 0, 0);
  }
  uint64_t v13 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

void sub_10002BA34(uint64_t a1, CGContext *a2)
{
  id v46 = *(id *)(a1 + 32);
  CGFloat v4 = *(double *)(a1 + 88);
  double v5 = *(double *)(a1 + 96);
  CGFloat v6 = *(double *)(a1 + 104);
  id v7 = *(id *)(a1 + 40);
  CGContextScaleCTM(a2, 1.0, -1.0);
  CGContextTranslateCTM(a2, 0.0, -*(double *)(a1 + 128));
  CGContextSaveGState(a2);
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 136));
  if (vabdd_f64(Width, CGRectGetHeight(*(CGRect *)(a1 + 136))) >= 0.00999999978)
  {
    CGContextDrawImage(a2, *(CGRect *)(a1 + 136), (CGImageRef)[*(id *)(a1 + 48) CGImage]);
  }
  else
  {
    double v9 = *(double *)(a1 + 120);
    double v10 = *(double *)(a1 + 128);
    v49.origin.CGFloat x = 0.0;
    v49.origin.CGFloat y = 0.0;
    v49.size.CGFloat width = v9;
    v49.size.CGFloat height = v9;
    CGFloat Height = CGRectGetHeight(v49);
    CGContextTranslateCTM(a2, 0.0, v10 - Height);
    size_t v12 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, v9, v9);
    [v12 addClip];
    [*(id *)(a1 + 48) filledRectForRect:0.0, 0.0, v9, v9];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    uint64_t v21 = (CGImage *)[*(id *)(a1 + 48) CGImage];
    v50.origin.CGFloat x = v14;
    v50.origin.CGFloat y = v16;
    v50.size.CGFloat width = v18;
    v50.size.CGFloat height = v20;
    CGContextDrawImage(a2, v50, v21);
  }
  CGContextRestoreGState(a2);
  if (*(unsigned char *)(a1 + 184))
  {
    CGContextSaveGState(a2);
    float64x2_t v22 = *(void **)(a1 + 56);
    if (v22) {
      CGContextClipToMask(a2, *(CGRect *)(a1 + 136), (CGImageRef)[v22 CGImage]);
    }
    CGContextDrawImage(a2, *(CGRect *)(a1 + 136), (CGImageRef)[*(id *)(a1 + 64) CGImage]);
    CGContextRestoreGState(a2);
  }
  if (*(unsigned char *)(a1 + 185))
  {
    uint64_t v23 = +[UIColor colorWithWhite:1.0 alpha:0.84];

    uint64_t v24 = +[UIColor colorWithWhite:0.2 alpha:0.5];
    id v25 = (id)v23;
  }
  else
  {
    uint64_t v24 = 0;
    id v25 = v46;
  }
  id v47 = v25;
  if (v25)
  {
    CGContextSaveGState(a2);
    float64x2_t v26 = *(void **)(a1 + 56);
    if (v26) {
      CGContextClipToMask(a2, *(CGRect *)(a1 + 136), (CGImageRef)[v26 CGImage]);
    }
    id v27 = v47;
    CGContextSetFillColorWithColor(a2, (CGColorRef)[v27 CGColor]);
    CGContextFillRect(a2, *(CGRect *)(a1 + 136));
    if (*(unsigned char *)(a1 + 186) && *(unsigned char *)(a1 + 187))
    {
      id v28 = [v27 colorWithAlphaComponent:0.85];
      CGContextSetFillColorWithColor(a2, (CGColorRef)[v28 CGColor]);

      CGContextFillRect(a2, *(CGRect *)(a1 + 136));
    }
    CGContextRestoreGState(a2);
  }
  if (*(void *)(a1 + 72))
  {
    CGContextSaveGState(a2);
    CGContextSetInterpolationQuality(a2, kCGInterpolationHigh);
    if (*(unsigned char *)(a1 + 185))
    {
      [v24 setFill];
      CGContextClipToMask(a2, *(CGRect *)(a1 + 88), (CGImageRef)[*(id *)(a1 + 72) CGImage]);
      CGContextFillRect(a2, *(CGRect *)(a1 + 88));
    }
    else
    {
      CGContextDrawImage(a2, *(CGRect *)(a1 + 88), (CGImageRef)[*(id *)(a1 + 72) CGImage]);
    }
    goto LABEL_31;
  }
  if (CGRectIsEmpty(*(CGRect *)(a1 + 88))) {
    goto LABEL_32;
  }
  CGContextSaveGState(a2);
  CGContextTranslateCTM(a2, 0.0, *(CGFloat *)(a1 + 128));
  CGContextScaleCTM(a2, 1.0, -1.0);
  if (*(unsigned char *)(a1 + 185))
  {
    id v29 = [*(id *)(a1 + 40) mutableCopy];
    [v29 addAttribute:NSForegroundColorAttributeName value:v24 range:[*(id *)(a1 + 40) length]];
    id v30 = [v29 copy];

    id v7 = v30;
  }
  [v7 boundingRectWithSize:35 options:0 context:*(double *)(a1 + 104) *(double *)(a1 + 112)];
  CGRect v52 = CGRectIntegral(v51);
  CGFloat x = v52.origin.x;
  CGFloat y = v52.origin.y;
  CGFloat v33 = v52.size.width;
  CGFloat v34 = v52.size.height;
  double v35 = CGRectGetHeight(v52);
  if (v35 < CGRectGetHeight(*(CGRect *)(a1 + 88)))
  {
    v53.origin.CGFloat x = *(CGFloat *)(a1 + 88);
    double v36 = *(double *)(a1 + 96);
    v53.size.CGFloat width = *(CGFloat *)(a1 + 104);
    v53.size.CGFloat height = *(CGFloat *)(a1 + 112);
    v53.origin.CGFloat y = v36;
    double v37 = CGRectGetHeight(v53);
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = v33;
    v54.size.CGFloat height = v34;
    double v38 = v37 - CGRectGetHeight(v54);
    double v39 = 0.5;
LABEL_29:
    double v5 = v36 + v38 * v39;
    goto LABEL_30;
  }
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = v33;
  v55.size.CGFloat height = v34;
  double v40 = CGRectGetHeight(v55);
  if (v40 > CGRectGetHeight(*(CGRect *)(a1 + 88)))
  {
    v56.origin.CGFloat x = *(CGFloat *)(a1 + 88);
    double v36 = *(double *)(a1 + 96);
    v56.size.CGFloat width = *(CGFloat *)(a1 + 104);
    v56.size.CGFloat height = *(CGFloat *)(a1 + 112);
    v56.origin.CGFloat y = v36;
    double v41 = CGRectGetHeight(v56);
    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = v33;
    v57.size.CGFloat height = v34;
    double v38 = v41 - CGRectGetHeight(v57);
    double v39 = -0.5;
    goto LABEL_29;
  }
LABEL_30:
  v58.origin.CGFloat x = v4;
  v58.origin.CGFloat y = v5;
  v58.size.CGFloat width = v6;
  v58.size.CGFloat height = v34;
  CGRect v59 = CGRectIntegral(v58);
  [v7 drawWithRect:35, 0, v59.origin.x, v59.origin.y, v59.size.width, v59.size.height];
LABEL_31:
  CGContextRestoreGState(a2);
LABEL_32:
  Image = CGBitmapContextCreateImage(a2);
  id v43 = [objc_alloc((Class)UIImage) initWithCGImage:Image scale:*(void *)(a1 + 176) orientation:*(double *)(a1 + 168)];
  uint64_t v44 = *(void *)(*(void *)(a1 + 80) + 8);
  int v45 = *(void **)(v44 + 40);
  *(void *)(v44 + 40) = v43;

  CGImageRelease(Image);
}

void sub_10002BFC8(uint64_t a1, CGContextRef c)
{
  components[0] = xmmword_1000BD320;
  components[1] = unk_1000BD330;
  CGContextSetStrokeColorSpace(c, *(CGColorSpaceRef *)(a1 + 56));
  CGContextSetStrokeColor(c, (const CGFloat *)components);
  CGContextSetLineWidth(c, 1.0 / *(double *)(a1 + 64));
  CGContextAddPath(c, (CGPathRef)[*(id *)(a1 + 32) CGPath]);
  CGContextReplacePathWithStrokedPath(c);
  CGContextClip(c);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) drawAtPoint:CGPointZero.x, CGPointZero.y];
  CGFloat v4 = UIGraphicsGetImageFromCurrentImageContext();
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002C28C;
  v30[3] = &unk_1000C6178;
  uint64_t v7 = *(void *)(a1 + 56);
  id v31 = v4;
  uint64_t v32 = v7;
  long long v33 = *(_OWORD *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  id v9 = v4;
  double v10 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v30, v6, v8, v5);
  double v11 = *(double *)(a1 + 64);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  void v26[2] = sub_10002C344;
  v26[3] = &unk_1000C6218;
  double v29 = v11;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  id v27 = v12;
  uint64_t v28 = v13;
  CGFloat v14 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v26, *(double *)(a1 + 72), *(double *)(a1 + 80), v11);
  double v15 = *(double *)(a1 + 64);
  double v16 = *(double *)(a1 + 72);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002C3C4;
  v23[3] = &unk_1000C56D0;
  id v24 = v14;
  id v25 = v10;
  double v17 = *(double *)(a1 + 80);
  id v18 = v10;
  id v19 = v14;
  uint64_t v20 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v23, v16, v17, v15);
  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  float64x2_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;
}

void sub_10002C28C(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [*(id *)(a1 + 32) drawAtPoint:CGPointZero.x, CGPointZero.y];
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceAtop);
  v3[0] = xmmword_1000BD340;
  v3[1] = unk_1000BD350;
  CGContextSetFillColorSpace(CurrentContext, *(CGColorSpaceRef *)(a1 + 40));
  CGContextSetFillColor(CurrentContext, (const CGFloat *)v3);
  v4.size.CGFloat width = *(CGFloat *)(a1 + 48);
  v4.size.CGFloat height = *(CGFloat *)(a1 + 56);
  v4.origin.CGFloat x = 0.0;
  v4.origin.CGFloat y = 0.0;
  CGContextFillRect(CurrentContext, v4);
}

id sub_10002C344(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0 / *(double *)(a1 + 48));
  CGContextAddPath(CurrentContext, (CGPathRef)[*(id *)(a1 + 32) CGPath]);
  CGContextClip(CurrentContext);
  uint32_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  double y = CGPointZero.y;

  return [v3 drawAtPoint:CGPointZero.x, y];
}

id sub_10002C3C4(uint64_t a1)
{
  double y = CGPointZero.y;
  [*(id *)(a1 + 32) drawAtPoint:CGPointZero.x, y];
  uint32_t v3 = *(void **)(a1 + 40);

  return [v3 drawAtPoint:CGPointZero.x blendMode:y alpha:1.0];
}

void sub_10002C6AC(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2080;
}

void sub_10002CD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002CD88(uint64_t a1, void *a2)
{
}

void sub_10002CE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002CEA0(uint64_t a1, int a2, id obj)
{
}

void sub_10002CFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002CFBC(uint64_t a1, int a2, int a3, id obj)
{
}

void sub_10002D0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D0D8(uint64_t a1, void *a2)
{
}

void sub_10002D1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D1F0(uint64_t a1, int a2, id obj)
{
}

void sub_10002D2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D30C(uint64_t a1, int a2, int a3, id obj)
{
}

void sub_10002D474(id a1)
{
  qword_1000EDF48 = (uint64_t)[objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

  _objc_release_x1();
}

void sub_10002D514(id a1)
{
  uint64_t v1 = objc_opt_new();
  double v2 = (void *)qword_1000EDF58;
  qword_1000EDF58 = v1;

  uint32_t v3 = (void *)qword_1000EDF58;

  [v3 setDateFormat:@"EEEE"];
}

void sub_10002D5BC(id a1)
{
  uint64_t v1 = objc_opt_new();
  double v2 = (void *)qword_1000EDF68;
  qword_1000EDF68 = v1;

  [(id)qword_1000EDF68 setTimeStyle:1];
  uint32_t v3 = (void *)qword_1000EDF68;

  _[v3 setDateStyle:0];
}

void sub_10002D66C(id a1)
{
  uint64_t v1 = objc_opt_new();
  double v2 = (void *)qword_1000EDF78;
  qword_1000EDF78 = v1;

  [(id)qword_1000EDF78 setTimeStyle:0];
  uint32_t v3 = (void *)qword_1000EDF78;

  _[v3 setDateStyle:1];
}

BOOL sub_10002D828(id a1, CAFilter *a2)
{
  double v2 = [(CAFilter *)a2 name];
  unsigned __int8 v3 = [v2 isEqualToString:@"kFRAXUndoInvertColorsFilter"];

  return v3;
}

void sub_10002DFD4(id a1)
{
  id v3 = +[NSBundle mainBundle];
  uint64_t v1 = [v3 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  double v2 = (void *)qword_1000EDF90;
  qword_1000EDF90 = v1;
}

void sub_10002EAB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    CGRect v4 = [*(id *)(a1 + 32) feldsparContext];
    double v5 = [v4 cloudContext];
    double v6 = [v5 subscriptionController];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v13 = [v12 asChannel];
          if ([v13 supportsNotifications]
            && [v6 hasSubscriptionToTag:v12])
          {
            [v6 setNotificationsEnabled:1 forTag:v12 error:0];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

void sub_10002ED74(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[NSThread isMainThread];
  CGRect v4 = +[NSMutableSet set];
  double v5 = [v3 notificationsConfig];

  double v6 = [v5 preSubscribedNotificationsChannelIDs];

  if ([v6 count]) {
    [v4 addObjectsFromArray:v6];
  }
  if ([v4 count])
  {
    id v7 = [*(id *)(a1 + 32) feldsparContext];
    id v8 = [v7 cloudContext];
    id v9 = [v8 tagController];
    uint64_t v10 = [v4 allObjects];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002EF20;
    v12[3] = &unk_1000C63B8;
    id v14 = *(id *)(a1 + 40);
    id v13 = v6;
    [v9 fetchTagsForTagIDs:v10 qualityOfService:25 callbackQueue:&_dispatch_main_q completionHandler:v12];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void, void))(v11 + 16))(v11, 0, 0);
    }
  }
}

void sub_10002EF20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[NSThread isMainThread];
  if (v6)
  {
    id v7 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_100072BA0((uint64_t)v6, v7);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_6:
      v9();
    }
  }
  else
  {
    if (![v5 count])
    {
      uint64_t v12 = *(void *)(a1 + 40);
      if (!v12) {
        goto LABEL_11;
      }
      id v9 = *(void (**)(void))(v12 + 16);
      goto LABEL_6;
    }
    uint64_t v10 = [v5 nf_objectsForKeysWithoutMarker:*(void *)(a1 + 32)];
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v10, 0);
    }
  }
LABEL_11:
}

void sub_10002F108(uint64_t a1)
{
  double v2 = +[SUUIClientContext defaultContext];
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_100018A80;
  id v9 = sub_1000189C8;
  id v10 = [objc_alloc((Class)SUUIExplicitRestrictionAlertController) initWithClientContext:v2 presentingViewController:*(void *)(a1 + 32)];
  id v3 = (void *)v6[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002F230;
  v4[3] = &unk_1000C6408;
  v4[4] = &v5;
  [v3 presentExplicitRestrictionAlertIfNeededOfType:5 completionBlock:v4];
  _Block_object_dispose(&v5, 8);
}

void sub_10002F218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002F230(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  double v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

id sub_10002F244(uint64_t a1)
{
  return [*(id *)(a1 + 32) offlineModeMonitor];
}

SXAppStateMonitor *__cdecl sub_10002F24C(id a1, TFResolver *a2)
{
  return (SXAppStateMonitor *)[(TFResolver *)a2 resolveProtocol:&OBJC_PROTOCOL___NUAppActivityMonitor];
}

id sub_10002F25C(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationManager];
}

FCBundleSubscriptionManager *__cdecl sub_10002F264(id a1, TFResolver *a2)
{
  double v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  CGRect v4 = [v3 bundleSubscriptionManager];

  return (FCBundleSubscriptionManager *)v4;
}

id sub_10002F2D8(id a1, TFResolver *a2)
{
  double v2 = a2;
  id v3 = objc_alloc((Class)FCNotificationPoolService);
  CGRect v4 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCContentContext];
  uint64_t v5 = [(TFResolver *)v2 resolveProtocol:&OBJC_PROTOCOL___FCContentVariantProviding];

  id v6 = [v3 initWithContext:v4 contentVariantProvider:v5];

  return v6;
}

id sub_10002F37C(uint64_t a1)
{
  return [*(id *)(a1 + 32) cloudContext];
}

void sub_10002F438(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_1000EDFB0 = [v1 BOOLForKey:@"personalization_frozen"];
}

void sub_10002F494(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  CGRect v4 = a3;
  uint64_t v5 = FCPersonalizationLog;
  BOOL v6 = os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v6) {
      sub_100072C18(v5);
    }
  }
  else if (v6)
  {
    sub_100072C5C(v5, v4);
  }
}

void sub_10002F508(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGRect v4 = [*(id *)(a1 + 32) cloudContext];
  uint64_t v5 = [v4 subscriptionList];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F5DC;
  v7[3] = &unk_1000C6E50;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v6 = v3;
  [v5 syncWithCompletion:v7];
}

void sub_10002F5DC(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) subscriptionController];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _OWORD v3[2] = sub_10002F67C;
  v3[3] = &unk_1000C6E28;
  id v4 = *(id *)(a1 + 40);
  [v2 removeAllAutoFavoriteSubscriptions:v3];
}

void sub_10002F67C(uint64_t a1)
{
  double v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:0 forKey:FCPersonalizationClearSuggestions];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v3 = FCPersonalizationLog;
  if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did clear suggestions", v4, 2u);
  }
}

NSString *__cdecl sub_10002F724(id a1)
{
  return (NSString *)@"Considering events from News Today Widget.";
}

void sub_10002F730(uint64_t a1, void *a2)
{
  id v3 = [a2 events];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002F7D0;
  v4[3] = &unk_1000C6F08;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void sub_10002F7D0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v11 = [v3 aggregateStore];
  id v5 = +[FCPersonalizationFeature featuresFromTodayPersonalizationEvent:v4];
  [v4 action];
  uint64_t v6 = FCPersonalizationActionFromTodayPersonalizationAction();
  id v7 = [v4 overallOrder];
  id v8 = [v4 sectionOrder];
  id v9 = [v4 groupType];

  id v10 = [*(id *)(a1 + 32) configurableValues];
  [v11 updateFeatures:v5 withAction:v6 displayRank:v7 groupRank:v8 groupType:v9 individually:1 configurableValues:v10];
}

NSString *__cdecl sub_10002F8CC(id a1)
{
  return (NSString *)@"Finished processing events from News Today Widget.";
}

void sub_10002F8D8(uint64_t a1)
{
  double v2 = FCPersonalizationLog;
  if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Will save readable allowlist.", buf, 2u);
  }
  v37[0] = @"defaultTags";
  id v3 = [*(id *)(a1 + 32) configurationStore];
  id v4 = [v3 whitelist];
  uint64_t v5 = [v4 defaultTags];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = &__NSDictionary0__struct;
  }
  v38[0] = v7;
  v37[1] = @"optionalTags";
  id v8 = [*(id *)(a1 + 32) configurationStore];
  id v9 = [v8 whitelist];
  uint64_t v10 = [v9 optionalTags];
  id v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  else {
    uint64_t v12 = &__NSDictionary0__struct;
  }
  v38[1] = v12;
  v37[2] = @"lastUpdated";
  id v13 = +[NSDate date];
  [v13 timeIntervalSince1970];
  long long v15 = +[NSString stringWithFormat:@"%f", v14];
  void v38[2] = v15;
  long long v16 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

  id v34 = 0;
  long long v17 = +[NSJSONSerialization dataWithJSONObject:v16 options:1 error:&v34];
  id v18 = v34;
  id v19 = v18;
  if (v17)
  {
    uint64_t v20 = [*(id *)(a1 + 32) cloudContext];
    uint64_t v21 = [v20 privateDataDirectory];
    float64x2_t v22 = +[NSURL fileURLWithPath:v21];
    uint64_t v23 = [v22 URLByAppendingPathComponent:@"allowlist"];
    id v24 = [v23 URLByAppendingPathExtension:@"json"];

    if (v24)
    {
      id v25 = [v24 path];
      id v31 = v19;
      unsigned int v26 = [v17 writeToFile:v25 options:1 error:&v31];
      id v27 = v31;

      uint64_t v28 = FCPersonalizationLog;
      if (v26)
      {
        if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          double v29 = v28;
          id v30 = [v24 path];
          *(_DWORD *)buf = 138412290;
          double v36 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Successfully saved readable allowlist at %@.", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        sub_100072D04((uint64_t)v27, v28);
      }
      id v19 = v27;
    }
    else
    {
      sub_10002FCE8();
    }
  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10002FC9C;
    v32[3] = &unk_1000C5680;
    id v19 = v18;
    id v33 = v19;
    sub_10002FC9C((uint64_t)v32);
    id v24 = v33;
  }
}

void sub_10002FC9C(uint64_t a1)
{
  double v2 = FCPersonalizationLog;
  if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_ERROR)) {
    sub_100072D7C(a1, v2);
  }
}

void sub_10002FCE8()
{
  uint64_t v0 = FCPersonalizationLog;
  if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_ERROR)) {
    sub_100072DF8(v0);
  }
}

id sub_10002FECC(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshAutoFavoritesInBackgroundDisregardingCache:1];
}

NSString *__cdecl sub_10002FED8(id a1)
{
  return (NSString *)@"Attempting to fetch mapping resources";
}

id sub_10002FEE4(uint64_t a1)
{
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  uint64_t v6 = sub_10002FFB8;
  id v7 = &unk_1000C6FC0;
  id v8 = *(id *)(a1 + 32);
  id v1 = +[NSDictionary fc_dictionary:&v4];
  double v2 = +[NSString stringWithFormat:@"App config specified resource IDs: %@", v1, v4, v5, v6, v7];

  return v2;
}

void sub_10002FFB8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 personalizationBundleIdMappingResourceId];
  [v4 fc_safelySetObjectAllowingNil:v5 forKeyAllowingNil:@"Bundle ID Mapping Resource ID"];

  uint64_t v6 = [*(id *)(a1 + 32) personalizationUrlMappingResourceId];
  [v4 fc_safelySetObjectAllowingNil:v6 forKeyAllowingNil:@"URL Mapping Resource ID"];

  id v7 = [*(id *)(a1 + 32) personalizationWhitelistResourceId];
  [v4 fc_safelySetObjectAllowingNil:v7 forKeyAllowingNil:@"Whitelist Resource ID"];

  id v8 = [*(id *)(a1 + 32) personalizationFavorabilityResourceId];
  [v4 fc_safelySetObjectAllowingNil:v8 forKeyAllowingNil:@"Favorability Resource ID"];
}

id sub_1000300A8(id *a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000301C4;
  v5[3] = &unk_1000C7010;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[7];
  double v2 = +[NSDictionary fc_dictionary:v5];
  id v3 = +[NSString stringWithFormat:@"Querying for resource IDs: %@", v2];

  return v3;
}

void sub_1000301C4(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 fc_safelySetObjectAllowingNil:v3 forKeyAllowingNil:@"Bundle ID Mapping Resource ID"];
  [v4 fc_safelySetObjectAllowingNil:a1[5] forKeyAllowingNil:@"URL Mapping Resource ID"];
  [v4 fc_safelySetObjectAllowingNil:a1[6] forKeyAllowingNil:@"Whitelist Resource ID"];
  [v4 fc_safelySetObjectAllowingNil:a1[7] forKeyAllowingNil:@"Favorability Resource ID"];
}

NSString *sub_100030258(uint64_t a1)
{
  return +[NSString stringWithFormat:@"Got back results from mapping resource fetch that was empty %@", *(void *)(a1 + 32)];
}

uint64_t sub_100030424(uint64_t a1)
{
  double v2 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished preparing personalization data source for use", v4, 2u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000304A4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) storeQueue];
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
}

void sub_100030884(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1000308B0(uint64_t a1)
{
}

void sub_1000308B8(uint64_t a1)
{
}

uint64_t sub_1000308C0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_1000309BC;
    id v9 = &unk_1000C7128;
    id v10 = *(id *)(a1 + 32);
    FCPerformIfNonNil();
  }
  uint64_t v3 = FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Finished preparing favorites", v5, 2u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000309BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:*(void *)(a1 + 32) forKey:FCPrimaryLanguageKey];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 userInfo];

  [v6 setCanonicalLanguage:v5];
}

uint64_t sub_100030A5C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_100030B58;
    id v9 = &unk_1000C7128;
    id v10 = *(id *)(a1 + 32);
    FCPerformIfNonNil();
  }
  id v3 = FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Finished preparing favorites", v5, 2u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100030B58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:*(void *)(a1 + 32) forKey:FCPrimaryLanguageKey];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 userInfo];

  [v6 setCanonicalLanguage:v5];
}

void sub_100030D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100030D70(uint64_t a1)
{
  uint64_t v2 = FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Not preparing favorites because the language didn't change", v4, 2u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100030DF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    id v10 = v6;
    id v12 = *(id *)(a1 + 32);
    id v11 = v5;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    FCPerformIfNonNil();
    id v9 = &v10;

    objc_destroyWeak(&v13);
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100030F84;
    v14[3] = &unk_1000C6E28;
    id v9 = &v15;
    id v15 = *(id *)(a1 + 32);
    sub_100030F84((uint64_t)v14);
  }
}

void sub_100030F70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100030F84(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100030F9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100031464;
    v32[3] = &unk_1000C6E28;
    id v33 = *(id *)(a1 + 48);
    sub_100031464((uint64_t)v32);
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    void v31[2] = sub_10003147C;
    v31[3] = &unk_1000C6FC0;
    v31[4] = v3;
    id v4 = +[NSDictionary fc_dictionary:v31];
    id v5 = [v4 allKeys];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100031644;
    v29[3] = &unk_1000C71A0;
    id v30 = *(id *)(a1 + 40);
    id v6 = +[NSDictionary fc_dictionaryWithKeys:v5 allowingNil:1 valueBlock:v29];

    uint64_t v7 = FCTranslationLog;
    if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found subscriptions to translate: %@", (uint8_t *)&buf, 0xCu);
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100031730;
    v27[3] = &unk_1000C71C8;
    id v8 = v6;
    id v28 = v8;
    id v9 = +[NSMutableArray fc_array:v27];
    id v10 = FCTranslationLog;
    if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Querying tags for translation %@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0x3032000000;
    double v36 = sub_100018A90;
    double v37 = sub_1000189D0;
    id v38 = 0;
    id v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    id v12 = [v3 cloudContext];
    id v13 = [v12 tagController];
    uint64_t v14 = [v3 storeQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100031834;
    v24[3] = &unk_1000C71F0;
    p_long long buf = &buf;
    id v15 = v11;
    id v25 = v15;
    [v13 fetchTagsForTagIDs:v9 qualityOfService:25 callbackQueue:v14 completionHandler:v24];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031894;
    block[3] = &unk_1000C7268;
    objc_copyWeak(&v23, (id *)(a1 + 56));
    float64x2_t v22 = &buf;
    id v19 = v8;
    id v20 = v4;
    id v21 = *(id *)(a1 + 48);
    id v16 = v4;
    id v17 = v8;
    dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v23);
    _Block_object_dispose(&buf, 8);
  }
}

void sub_100031444(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100031464(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10003147C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) subscriptionController];
  id v5 = [v4 subscriptionsWithType:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031544;
  v7[3] = &unk_1000C7178;
  id v8 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void sub_100031544(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 tagID];
  if (v4)
  {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100031604;
    v5[3] = &unk_1000C5680;
    id v6 = v3;
    sub_100031604((uint64_t)v5);
  }
}

void sub_100031604(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000739C8(a1);
  }
}

id sub_100031644(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) favoriteTranslationForTagID:v3];
  id v5 = FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking for translation for: %@, found %@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

void sub_100031730(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000317C8;
  v6[3] = &unk_1000C56F8;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void sub_1000317C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 fc_safelyAddObject:a2];
  [*(id *)(a1 + 32) fc_safelyAddObject:v6];
}

void sub_100031834(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100031894(uint64_t a1)
{
  uint64_t v2 = FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Processing subscriptions for translation", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  __int16 v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100031A08;
  id v12 = &unk_1000C7240;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  id v13 = v4;
  uint64_t v15 = v5;
  id v14 = *(id *)(a1 + 40);
  FCPerformIfNonNil();

  id v6 = FCDispatchQueueForQualityOfService();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031DB8;
  v7[3] = &unk_1000C6E28;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v6, v7);
}

void sub_100031A08(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031B00;
  v9[3] = &unk_1000C7218;
  v9[4] = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  id v6 = FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished translating subscriptions", buf, 2u);
  }
}

void sub_100031B00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v5];
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v6];
  __int16 v9 = (void *)v8;
  if (v7)
  {
    if (v8)
    {
      long long v10 = FCTranslationLog;
      if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v19 = v7;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to translate %@ to %@", buf, 0x16u);
      }
      id v11 = [*(id *)(a1 + 32) subscriptionController];
      id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
      id v17 = 0;
      [v11 addSubscriptionToTag:v9 notificationsEnabled:[v12 notificationsEnabled] error:&v17];
      id v13 = v17;

      if (v13)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100073C14();
        }
        goto LABEL_18;
      }
      id v15 = [*(id *)(a1 + 32) subscriptionController];
      [v15 removeSubscriptionToTag:v7];
LABEL_12:

      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100073B50();
    if (v9) {
      goto LABEL_10;
    }
  }
  else if (v9)
  {
LABEL_10:
    int v14 = 0;
    goto LABEL_17;
  }
LABEL_14:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100073A8C();
  }
  int v14 = 1;
LABEL_17:
  id v13 = FCTranslationLog;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v16 = v7 ? 0 : v14;
    if (v16 == 1)
    {
      id v15 = +[NSString stringWithFormat:@"%@ and %@", v5, v6];
    }
    else
    {
      id v15 = v7 ? v6 : v5;
    }
    *(_DWORD *)long long buf = 138412802;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to translate %@ to %@, %@ didn't return a tag", buf, 0x20u);
    if (v16) {
      goto LABEL_12;
    }
  }
LABEL_18:
}

uint64_t sub_100031DB8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000320C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000320DC(uint64_t a1)
{
  uint64_t v2 = (void *)FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id v4 = +[FCAppleAccount sharedAccount];
    id v5 = [v4 primaryLanguageCode];
    id v6 = [*(id *)(a1 + 32) cloudContext];
    long long v7 = [v6 userInfo];
    uint64_t v8 = [v7 canonicalLanguage];
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not processing auto favorites, primary language %@ doesn't match canonical language %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100032224(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) autofavorites];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_100032274(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)
    || ([*(id *)(a1 + 32) configurationStore],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 autoFavorites],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    uint64_t v2 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Auto-favorites have never been generated", buf, 2u);
    }
    id v3 = [*(id *)(a1 + 32) autoFavoritesQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000323F0;
    v9[3] = &unk_1000C7358;
    id v4 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v4;
    [v3 enqueueBlock:v9];
  }
  else
  {
    long long v7 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Auto-favorites have been generated in the past so nothing to prepare", buf, 2u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
  }
}

void sub_1000323F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _createNewAutoFavoritesOperation];
  [v4 setQualityOfService:25];
  [v4 setRelativePriority:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032590;
  v10[3] = &unk_1000C7330;
  void v10[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  [v4 setAutoFavoritesCompletionHandler:v10];
  id v6 = (void *)FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = v6;
    uint64_t v8 = [v4 operationID];
    *(_DWORD *)long long buf = 138412290;
    int v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing personalization auto-favorites for use with operation %@", buf, 0xCu);
  }
  __int16 v9 = +[NSOperationQueue fc_sharedConcurrentQueue];
  [v9 addOperation:v4];
}

void sub_100032590(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finished preparing personalization auto-favorites for use", buf, 2u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000326BC;
  v12[3] = &unk_1000C7308;
  id v11 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  [v11 _processAutoFavoritesOperationResult:v7 cursor:v8 error:v9 completion:v12];
}

uint64_t sub_1000326BC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_100032718()
{
  uint64_t v0 = FCAutoFavoritesLog;
  if (os_log_type_enabled(FCAutoFavoritesLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Not running autofavorites operation because news personalization based autofavorites are enabled", v1, 2u);
  }
}

void sub_100032780(uint64_t a1)
{
  uint64_t v2 = (void *)FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id v4 = +[FCAppleAccount sharedAccount];
    id v5 = [v4 primaryLanguageCode];
    id v6 = [*(id *)(a1 + 32) cloudContext];
    id v7 = [v6 userInfo];
    id v8 = [v7 canonicalLanguage];
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not processing auto favorites, primary language %@ doesn't match canonical language %@", (uint8_t *)&v9, 0x16u);
  }
}

NSString *__cdecl sub_1000328AC(id a1)
{
  return (NSString *)@"Getting in line to refresh personalization auto-favorites";
}

void sub_1000328B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) autoFavoritesQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000329D0;
  v16[3] = &unk_1000C7408;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v17 = v11;
  uint64_t v18 = v12;
  id v19 = v7;
  id v20 = v8;
  id v21 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  [v10 enqueueBlock:v16];
}

void sub_1000329D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) autoFavoritesCursor];

  if (v4 == v5)
  {
    [(id)objc_opt_class() logPPMessage:&stru_1000C73E0];
    [*(id *)(a1 + 40) _processAutoFavoritesOperationResult:*(void *)(a1 + 48) cursor:*(void *)(a1 + 56) error:*(void *)(a1 + 64) completion:v3];
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100032AB8;
    v6[3] = &unk_1000C5988;
    void v6[4] = *(void *)(a1 + 40);
    id v7 = v3;
    sub_100032AB8((uint64_t)v6);
  }
}

uint64_t sub_100032AB8(uint64_t a1)
{
  [(id)objc_opt_class() logPPMessage:&stru_1000C73C0];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

NSString *__cdecl sub_100032B08(id a1)
{
  return (NSString *)@"Cursor changed while refreshing personalization auto-favorites";
}

NSString *__cdecl sub_100032B14(id a1)
{
  return (NSString *)@"Finished refreshing personalization auto-favorites";
}

id sub_100032B20(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) operationID];
  uint64_t v2 = +[NSString stringWithFormat:@"Refreshing personalization auto-favorites with operation %@", v1];

  return v2;
}

uint64_t sub_100032D80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100032D90(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) coreDuetLastQueryDate];
  id v3 = [*(id *)(a1 + 32) configurationStore];
  [v3 setCoreDuetLastQueryDate:v2];

  id v5 = [*(id *)(a1 + 40) portraitLastQueryDate];
  id v4 = [*(id *)(a1 + 32) configurationStore];
  [v4 setPortraitLastQueryDate:v5];
}

uint64_t sub_100032E30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) locationAutoFavoriteCandidates];
  unsigned __int8 v5 = [v4 containsObject:v3];

  if (v5)
  {
    uint64_t v6 = 9;
    goto LABEL_8;
  }
  id v7 = [*(id *)(a1 + 32) internalSignalAutoFavoriteCandidates];
  if ([v7 containsObject:v3]) {
    goto LABEL_6;
  }
  id v8 = [*(id *)(a1 + 32) existingInternalSignalAutoFavoriteCandidates];
  if ([v8 containsObject:v3])
  {

LABEL_6:
LABEL_7:
    uint64_t v6 = 3;
    goto LABEL_8;
  }
  id v10 = [*(id *)(a1 + 32) groupableCandidates];
  unsigned __int8 v11 = [v10 containsObject:v3];

  if (v11) {
    goto LABEL_7;
  }
  uint64_t v12 = [*(id *)(a1 + 32) portraitAutoFavoriteCandidates];
  unsigned __int8 v13 = [v12 containsObject:v3];

  if (v13)
  {
    uint64_t v6 = 8;
  }
  else
  {
    id v14 = [*(id *)(a1 + 32) appUsageAutoFavoriteCandidates];
    unsigned __int8 v15 = [v14 containsObject:v3];

    if (v15)
    {
      uint64_t v6 = 2;
    }
    else
    {
      int v16 = [*(id *)(a1 + 32) safariAutoFavoriteCandidates];
      unsigned __int8 v17 = [v16 containsObject:v3];

      if (v17)
      {
        uint64_t v6 = 1;
      }
      else
      {
        uint64_t v18 = [*(id *)(a1 + 32) defaultCandidates];
        unsigned __int8 v19 = [v18 containsObject:v3];

        if (v19)
        {
          uint64_t v6 = 7;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100073CD8();
          }
          uint64_t v6 = 6;
        }
      }
    }
  }
LABEL_8:

  return v6;
}

void sub_100033164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003317C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) whitelist];
  id v3 = [v2 defaultTags];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) whitelist];
    id v7 = [v6 optionalTags];
    id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (!v8) {
      return;
    }
    uint64_t v5 = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

void sub_100033320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100033338(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) whitelist];
  id v3 = [v2 defaultTags];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) whitelist];
    id v7 = [v6 optionalTags];
    id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (!v8) {
      return;
    }
    uint64_t v5 = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

void sub_1000334F8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) subscriptionController];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000335B8;
  v6[3] = &unk_1000C74F8;
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 addAutoFavoriteSubscriptionForTagIDs:v3 groupableSubscriptionForTagIDs:v4 originProvider:v5 completion:v6];
}

uint64_t sub_1000335B8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100033690(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfigurableValues:*(void *)(a1 + 40)];
}

void sub_100033720(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 storeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003382C;
  block[3] = &unk_1000C5680;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v5, block);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000338B4;
  v6[3] = &unk_1000C5680;
  void v6[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  v4[2](v4);
}

void sub_10003382C(uint64_t a1)
{
  [*(id *)(a1 + 32) setAutofavorites:0];
  [*(id *)(a1 + 32) setAutoFavoritesCursor:0];
  uint64_t v2 = [*(id *)(a1 + 32) configurationStore];
  [v2 setCoreDuetLastQueryDate:0];

  id v3 = [*(id *)(a1 + 32) configurationStore];
  [v3 setPortraitLastQueryDate:0];
}

id sub_1000338B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareAutoFavoritesWithLanguageChange:1 completionHandler:0];
}

BOOL UIBackgroundFetchResultFromFCFetchResult(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

BOOL FCFetchResultFromUIBackgroundFetchResult(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

void sub_100033ED0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 safariAutoFavoriteCandidates];
  [v4 fc_safelyUnionSet:v5];

  uint64_t v6 = [*(id *)(a1 + 32) appUsageAutoFavoriteCandidates];
  [v4 minusSet:v6];

  id v7 = [*(id *)(a1 + 32) autoFavoriteTagIDs];
  [v4 fc_safelyIntersectSet:v7];
}

void sub_10003400C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 portraitAutoFavoriteCandidates];
  [v4 fc_safelyUnionSet:v5];

  uint64_t v6 = [*(id *)(a1 + 32) appUsageAutoFavoriteCandidates];
  [v4 minusSet:v6];

  id v7 = [*(id *)(a1 + 32) safariAutoFavoriteCandidates];
  [v4 minusSet:v7];

  id v8 = [*(id *)(a1 + 32) autoFavoriteTagIDs];
  [v4 fc_safelyIntersectSet:v8];
}

void sub_100034168(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 portraitAutoFavoriteCandidates];
  [v4 fc_safelyUnionSet:v5];

  uint64_t v6 = [*(id *)(a1 + 32) appUsageAutoFavoriteCandidates];
  [v4 minusSet:v6];

  id v7 = [*(id *)(a1 + 32) safariAutoFavoriteCandidates];
  [v4 minusSet:v7];

  id v8 = [*(id *)(a1 + 32) portraitAutoFavoriteCandidates];
  [v4 minusSet:v8];

  id v9 = [*(id *)(a1 + 32) autoFavoriteTagIDs];
  [v4 fc_safelyIntersectSet:v9];
}

void sub_1000342E4(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) internalSignalAutoFavoriteCandidates];
  id v4 = v3;
  if (!v3) {
    id v4 = objc_opt_new();
  }
  uint64_t v5 = [*(id *)(a1 + 32) existingInternalSignalAutoFavoriteCandidates];
  uint64_t v6 = [v4 fc_setByUnioningSet:v5];
  id v7 = [*(id *)(a1 + 32) defaultCandidates];
  id v8 = [v6 fc_setByUnioningSet:v7];
  [v14 fc_safelyUnionSet:v8];

  if (!v3) {
  id v9 = [*(id *)(a1 + 32) appUsageAutoFavoriteCandidates];
  }
  [v14 minusSet:v9];

  id v10 = [*(id *)(a1 + 32) safariAutoFavoriteCandidates];
  [v14 minusSet:v10];

  unsigned __int8 v11 = [*(id *)(a1 + 32) portraitAutoFavoriteCandidates];
  [v14 minusSet:v11];

  uint64_t v12 = [*(id *)(a1 + 32) locationAutoFavoriteCandidates];
  [v14 minusSet:v12];

  unsigned __int8 v13 = [*(id *)(a1 + 32) autoFavoriteTagIDs];
  [v14 fc_safelyIntersectSet:v13];
}

void sub_100034D44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_100034D64(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsPresentingAlert:0];
  [WeakRetained updateAlertDidDismiss:a2];
}

uint64_t sub_100034DC0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100034DD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100035DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100035DF4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 componentsSeparatedByString:@"="];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v12 firstObject];
  id v7 = [v6 stringByRemovingPercentEncoding];

  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
    id v8 = [v12 lastObject];
    uint64_t v9 = [v8 stringByRemovingPercentEncoding];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned __int8 v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void sub_100038A2C(uint64_t a1)
{
  uint64_t v2 = +[UIApplication sharedApplication];
  id v3 = [v2 keyWindow];
  unsigned __int8 v17 = [v3 rootViewController];

  id v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"“%@” wants to open “%@”" value:&stru_1000CABC0 table:0];

  uint64_t v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"News" value:&stru_1000CABC0 table:0];
  id v8 = [*(id *)(a1 + 32) localizedName];
  uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7, v8);

  uint64_t v10 = +[UIAlertController alertControllerWithTitle:v9 message:0 preferredStyle:1];
  objc_initWeak(&location, v10);
  unsigned __int8 v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"Cancel" value:&stru_1000CABC0 table:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100038D84;
  v20[3] = &unk_1000C75C0;
  objc_copyWeak(&v21, &location);
  unsigned __int8 v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v20];

  id v14 = +[NSBundle mainBundle];
  unsigned __int8 v15 = [v14 localizedStringForKey:@"Open" value:&stru_1000CABC0 table:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100038DE4;
  v18[3] = &unk_1000C75E8;
  objc_copyWeak(&v19, &location);
  void v18[4] = *(void *)(a1 + 40);
  int v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v18];

  [v10 addAction:v16];
  [v10 addAction:v13];
  [v10 setPreferredAction:v13];
  [v17 presentViewController:v10 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void sub_100038D48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_100038D84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_100038DE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];

  uint64_t v3 = +[UIApplication sharedApplication];
  [v3 openURL:*(void *)(a1 + 32) options:&__NSDictionary0__struct completionHandler:0];
}

id sub_100039778(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _determineUserID];
}

id sub_100039780(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _refreshAppConfig];
}

id sub_100039788(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _refreshOnboardingVersion];
}

id sub_100039790(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setOnboardingVersion:a2];
  uint64_t v3 = *(void **)(a1 + 32);

  return _[v3 _presubscribe];
}

uint64_t sub_1000397D0(uint64_t a1)
{
  return 0;
}

id sub_1000397F4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

void sub_100039934(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    id v7 = [v5 shortOperationDescription];
    *(_DWORD *)long long buf = 138543362;
    unsigned __int8 v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ determining user ID", buf, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) analyticsController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100039A88;
  v10[3] = &unk_1000C6E28;
  id v11 = v3;
  id v9 = v3;
  [v8 notifyWhenUserIDHasBeenDeterminedWithBlock:v10];
}

uint64_t sub_100039A88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100039B30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    uint64_t v10 = [v8 shortOperationDescription];
    *(_DWORD *)long long buf = 138543362;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ refreshing app config", buf, 0xCu);
  }
  id v11 = [*(id *)(a1 + 32) cloudContext];
  id v12 = [v11 appConfigurationManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100039CC4;
  v15[3] = &unk_1000C76D8;
  id v16 = v5;
  id v17 = v6;
  id v13 = v6;
  id v14 = v5;
  [v12 refreshAppConfigurationIfNeededWithCompletionQueue:&_dispatch_main_q refreshCompletion:v15];
}

uint64_t sub_100039CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100039D84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    uint64_t v10 = [v8 shortOperationDescription];
    *(_DWORD *)long long buf = 138543362;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ refreshing the onboarding version", buf, 0xCu);
  }
  id v11 = [*(id *)(a1 + 32) cloudContext];
  id v12 = [v11 userInfo];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100039F10;
  v15[3] = &unk_1000C7700;
  id v16 = v5;
  id v17 = v6;
  id v13 = v6;
  id v14 = v5;
  [v12 refreshOnboardingVersion:v15];
}

uint64_t sub_100039F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id sub_10003A070(uint64_t a1)
{
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping presubscribe because user isn't new", (uint8_t *)&v8, 0xCu);
  }
  id v6 = +[NFPromise asVoid];

  return v6;
}

void sub_10003A158(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 shortOperationDescription];
    *(_DWORD *)long long buf = 138543362;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ presubscribing to channels", buf, 0xCu);
  }
  int v8 = [*(id *)(a1 + 32) presubscribeService];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003A2AC;
  v10[3] = &unk_1000C7728;
  id v11 = v3;
  id v9 = v3;
  [v8 presubscribeToChannelsIfNeededWithCompletion:v10];
}

uint64_t sub_10003A2AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id tagsSortedByMostFrequentlyVisited(void *a1, void *a2, void *a3)
{
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10003AC50;
  id v14 = &unk_1000C58E8;
  id v15 = a2;
  id v16 = a3;
  id v5 = v16;
  id v6 = v15;
  id v7 = a1;
  int v8 = objc_retainBlock(&v11);
  id v9 = [v7 sortedArrayUsingComparator:v8, v11, v12, v13, v14];

  return v9;
}

uint64_t sub_10003AC50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  int v8 = [v5 identifier];
  if ([v7 containsObject:v8])
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v6 identifier];
    LODWORD(v9) = [v9 containsObject:v10];

    if (v9)
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = [v5 identifier];
      id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 indexOfObject:v12]);
      id v14 = *(void **)(a1 + 32);
      id v15 = [v6 identifier];
      id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 indexOfObject:v15]);
      uint64_t v17 = (uint64_t)[v13 compare:v16];

      if (!v17) {
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  uint64_t v18 = *(void **)(a1 + 32);
  id v19 = [v6 identifier];
  LOBYTE(v1_Block_object_dispose(&STACK[0x230], 8) = [v18 containsObject:v19];

  if (v18)
  {
    uint64_t v17 = 1;
  }
  else
  {
    id v20 = *(void **)(a1 + 32);
    id v21 = [v5 identifier];
    LOBYTE(v20) = [v20 containsObject:v21];

    if ((v20 & 1) == 0)
    {
LABEL_10:
      __int16 v22 = [*(id *)(a1 + 40) comparatorForSubscriptions];
      uint64_t v17 = ((uint64_t (**)(void, id, id))v22)[2](v22, v5, v6);

      goto LABEL_11;
    }
    uint64_t v17 = -1;
  }
LABEL_11:

  return v17;
}

void sub_10003B0EC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 content];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void sub_10003B29C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 flintDataProvider];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void sub_10003B594(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pool];
  id v3 = [*(id *)(a1 + 40) articleID];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = *(void **)(a1 + 64);
    if (v5)
    {
      id v6 = *(NSObject **)(a1 + 48);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10003B750;
      v19[3] = &unk_1000C5BF8;
      id v7 = &v21;
      id v21 = v5;
      int v8 = &v20;
      id v20 = v4;
      id v9 = v19;
      uint64_t v10 = v6;
LABEL_6:
      dispatch_async(v10, v9);
    }
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) pool];
    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = [*(id *)(a1 + 40) articleID];
    [v11 setObject:v12 forKey:v13];

    [*(id *)(a1 + 32) _flushIfNeeded];
    id v14 = *(void **)(a1 + 64);
    if (v14)
    {
      id v15 = *(NSObject **)(a1 + 48);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10003B764;
      v16[3] = &unk_1000C5BF8;
      id v7 = &v18;
      id v18 = v14;
      int v8 = &v17;
      id v17 = *(id *)(a1 + 56);
      id v9 = v16;
      uint64_t v10 = v15;
      goto LABEL_6;
    }
  }
}

uint64_t sub_10003B750(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10003B764(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id sub_10003BAD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  int v8 = [v5 accessDates];
  id v9 = [v8 objectForKey:v7];

  uint64_t v10 = [*(id *)(a1 + 32) accessDates];
  id v11 = [v10 objectForKey:v6];

  id v12 = [v9 compare:v11];
  return v12;
}

uint64_t sub_10003BD54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10003BDB4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) resolver];
  uint64_t v2 = [v1 resolveProtocol:&OBJC_PROTOCOL___FCOfflineArticleManagerType];

  return v2;
}

void sub_10003BE0C(uint64_t a1)
{
  if (NFInternalBuild())
  {
    id v47 = &off_1000CFA20;
  }
  else
  {
    id v47 = (_UNKNOWN **)[&off_1000CFA20 mutableCopy];
    [v47 addObject:@"Personalization_Data/knowledgeC.db"];
  }
  uint64_t v2 = +[NSFileManager defaultManager];
  id v3 = FRURLForNewsAppCachesDirectory();
  id v4 = [v3 path];

  id v48 = v2;
  id v46 = v4;
  id v5 = [v2 enumeratorAtPath:v4];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    id v7 = (void *)v6;
    do
    {
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_10003C3DC;
      v57[3] = &unk_1000C77D8;
      id v8 = v7;
      id v58 = v8;
      if (objc_msgSend(v47, "fc_containsObjectPassingTest:", v57))
      {
        id v9 = [v4 stringByAppendingPathComponent:v8];
        [v2 removeItemAtPath:v9 error:0];
      }
      else
      {
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10003C3E8;
        v55[3] = &unk_1000C77D8;
        id v56 = v8;
        if ((objc_msgSend(v47, "fc_containsObjectPassingTest:", v55) & 1) == 0) {
          [v5 skipDescendants];
        }
        id v9 = v56;
      }

      id v7 = [v5 nextObject];
    }
    while (v7);
  }
  id v10 = objc_alloc((Class)NSURL);
  id v11 = [*(id *)(a1 + 32) cloudContext];
  id v12 = [v11 contentDirectory];
  id v13 = [v10 initFileURLWithPath:v12 isDirectory:1];
  id v14 = [v13 path];

  id v15 = [v2 enumeratorAtPath:v14];

  uint64_t v16 = [v15 nextObject];
  if (v16)
  {
    id v17 = (void *)v16;
    do
    {
      if ([v17 hasPrefix:@"today-feed-database"])
      {
        id v18 = [v14 stringByAppendingPathComponent:v17];
        [v2 removeItemAtPath:v18 error:0];
      }
      uint64_t v19 = [v15 nextObject];

      id v17 = (void *)v19;
    }
    while (v19);
  }
  uint64_t v44 = v15;
  int v45 = v14;
  id v20 = NSTemporaryDirectory();
  id v21 = +[NSURL fileURLWithPath:v20];
  NSURLResourceKey v22 = NSURLContentModificationDateKey;
  NSURLResourceKey v64 = NSURLContentModificationDateKey;
  id v23 = +[NSArray arrayWithObjects:&v64 count:1];
  id v24 = [v2 contentsOfDirectoryAtURL:v21 includingPropertiesForKeys:v23 options:4 error:0];

  id v25 = +[NSProcessInfo processInfo];
  unsigned int v26 = [v25 fc_processLaunchDate];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v27 = v24;
  id v28 = [v27 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v52;
    do
    {
      id v31 = 0;
      do
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v31);
        id v50 = 0;
        unsigned int v33 = [v32 getResourceValue:&v50 forKey:v22 error:0 v44, v45];
        id v34 = v50;
        uint64_t v35 = v34;
        if (v33 && objc_msgSend(v34, "fc_isEarlierThan:", v26))
        {
          id v36 = v27;
          double v37 = v26;
          id v49 = 0;
          unsigned int v38 = [v48 removeItemAtURL:v32 error:&v49];
          id v39 = v49;
          double v40 = (void *)FCDefaultLog;
          if (v38)
          {
            if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
            {
              double v41 = v40;
              uint64_t v42 = [v32 absoluteString];
              *(_DWORD *)long long buf = 138543362;
              __int16 v60 = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Removed stale file from temporary directory: %{public}@", buf, 0xCu);
              goto LABEL_27;
            }
          }
          else if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
          {
            double v41 = v40;
            uint64_t v42 = [v32 absoluteString];
            *(_DWORD *)long long buf = 138543618;
            __int16 v60 = v42;
            __int16 v61 = 2114;
            id v62 = v39;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to remove stale file from temporary directory: %{public}@, error=%{public}@", buf, 0x16u);
LABEL_27:
          }
          unsigned int v26 = v37;
          id v27 = v36;
          NSURLResourceKey v22 = NSURLContentModificationDateKey;
        }

        id v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      id v43 = [v27 countByEnumeratingWithState:&v51 objects:v63 count:16];
      id v29 = v43;
    }
    while (v43);
  }
}

id sub_10003C3DC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPrefix:a2];
}

id sub_10003C3E8(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(a1 + 32)];
}

uint64_t sub_10003C5DC(uint64_t a1)
{
  +[NSThread isMainThread];
  [*(id *)(a1 + 32) setBackgroundFetchInProgress:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_10003C958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 216), 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003C994(uint64_t a1, uint64_t a2)
{
  if (a2 != 2)
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    [v3 setObject:*(void *)(a1 + 32) forKey:@"lastBackgroundFetchDate"];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_10003CA2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    id v4 = [*(id *)(a1 + 40) privateDataUpdateCoordinator];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003CBC4;
    v10[3] = &unk_1000C78A0;
    id v5 = (id *)v11;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v11[0] = v6;
    v11[1] = v7;
    id v12 = v3;
    long long v14 = *(_OWORD *)(a1 + 72);
    long long v9 = *(_OWORD *)(a1 + 48);
    id v8 = (id)v9;
    long long v13 = v9;
    [v4 updatePrivateDataControllersWithCompletion:v10];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003CBA0;
    v15[3] = &unk_1000C7828;
    long long v17 = *(_OWORD *)(a1 + 56);
    id v5 = &v16;
    id v16 = *(id *)(a1 + 32);
    sub_10003CBA0((uint64_t)v15);
  }
}

void sub_10003CBA0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10003CBC4(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 40) todayAgent];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003CD3C;
  v15[3] = &unk_1000C5680;
  id v16 = *(id *)(a1 + 32);
  [v2 serviceWidgetIfNeededWithCompletion:v15];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v3 = [*(id *)(a1 + 40) subscriptionController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003CD44;
  v8[3] = &unk_1000C7878;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  id v9 = v4;
  uint64_t v13 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  long long v14 = *(_OWORD *)(a1 + 72);
  id v12 = *(id *)(a1 + 56);
  [v3 fetchSubscribedTagsWithCallbackQueue:&_dispatch_main_q preferCache:0 completion:v8];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10003CD3C(uint64_t a1)
{
}

void sub_10003CD44(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) prefetchConfig];
  unsigned __int8 v3 = [v2 shouldPrefetchForYouFeed];

  if ((v3 & 1) == 0)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10003D0B0;
    v34[3] = &unk_1000C72E0;
    uint64_t v36 = *(void *)(a1 + 64);
    id v35 = *(id *)(a1 + 40);
    sub_10003D0B0((uint64_t)v34);
    id v4 = v35;
    goto LABEL_5;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    void v31[2] = sub_10003D134;
    v31[3] = &unk_1000C72E0;
    uint64_t v33 = *(void *)(a1 + 64);
    id v32 = *(id *)(a1 + 40);
    sub_10003D134((uint64_t)v31);
    id v4 = v32;
LABEL_5:

    return;
  }
  uint64_t v5 = (void *)FRBackgroundFetchLog;
  if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = v5;
    id v8 = [v6 fetchables];
    id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    *(_DWORD *)long long buf = 138412290;
    id v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Prefetching operations in the background. Count: %@", buf, 0xCu);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = [*(id *)(a1 + 48) fetchables];
  id v11 = [v10 copy];

  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        uint64_t v17 = *(void *)(a1 + 32);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10003D1B8;
        v23[3] = &unk_1000C7850;
        id v18 = *(id *)(a1 + 56);
        uint64_t v19 = *(void *)(a1 + 64);
        id v24 = v18;
        uint64_t v26 = v19;
        id v25 = *(id *)(a1 + 40);
        uint64_t v20 = [v16 backgroundFetchWithAppConfiguration:v17 completionHandler:v23];
        uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
        NSURLResourceKey v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;
      }
      id v13 = [v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v13);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10003D0B0(uint64_t a1)
{
  uint64_t v2 = FRBackgroundFetchLog;
  if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Skipping For You prefetch because it's disabled in the app config.", v3, 2u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10003D134(uint64_t a1)
{
  uint64_t v2 = FRBackgroundFetchLog;
  if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Skipping For You prefetch because background fetch timed out", v3, 2u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10003D1B8(uint64_t a1, uint64_t a2)
{
  id v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v6 = v5;
  uint64_t v7 = FRBackgroundFetchLog;
  if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Feed prefetch did complete in %f secs.", (uint8_t *)&v8, 0xCu);
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10003D2A8(void *a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    [*(id *)(*(void *)(a1[6] + 8) + 40) cancel];
  }
  id v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[7] + 8) + 24)];
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[8] + 8) + 24)];
  uint64_t v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, 0);
  uint64_t Results = FCAggregateFetchResultWithFetchResults();

  uint64_t v8 = a1[4];
  BOOL ResultFromFCFetchResult = UIBackgroundFetchResultFromFCFetchResult(Results);
  id v10 = *(uint64_t (**)(uint64_t, BOOL, uint64_t))(v8 + 16);

  return v10(v8, ResultFromFCFetchResult, a2);
}

void sub_10003D738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003D750(uint64_t a1, void *a2, void *a3, void *a4)
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003D840;
  v13[3] = &unk_1000C7940;
  void v13[4] = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [a4 fc_dictionaryByTransformingValuesWithBlock:v13];
  id v10 = [objc_alloc((Class)TSPrefetchedArticlesFetchResult) initWithSelectedArticleID:v8 articleIDs:v7 prefetchedHeadlines:v9];

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

id sub_10003D840(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) feldsparContext];
  uint64_t v5 = [v4 cloudContext];
  uint64_t v6 = [v3 headlineWithContentContext:v5];

  if (v6)
  {
    id v7 = v6;
    id v8 = [*(id *)(a1 + 32) feldsparContext];
    uint64_t v9 = [v8 cloudContext];
    id v10 = [v7 contentWithContext:v9];

    uint64_t v11 = (void *)FRArticleLog;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      id v13 = [v3 articleID];
      uint64_t v14 = [v10 anfContent];
      id v15 = [v14 anfDocumentAssetHandles];
      id v16 = [v15 firstObject];
      uint64_t v17 = [v16 uniqueKey];
      *(_DWORD *)long long buf = 138543618;
      NSURLResourceKey v22 = v13;
      __int16 v23 = 2114;
      id v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully unpacked referred article headline, articleID=%{public}@, anfDocument=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003DA7C;
    v19[3] = &unk_1000C7918;
    id v20 = v3;
    sub_10003DA7C((uint64_t)v19);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v20;
  }

  return v7;
}

uint64_t sub_10003DA7C(uint64_t a1)
{
  uint64_t v2 = (void *)FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR)) {
    sub_100075738(a1, v2);
  }
  return 0;
}

uint64_t sub_10003E884(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v6;
    if ([v2 isViewLoaded])
    {
      id v3 = [v2 view];
      id v4 = [v3 window];

      if (v4) {
        [(id)objc_opt_class() recordExposureEventForObserver:v2];
      }
    }
  }

  return _objc_release_x1();
}

void sub_10003F2CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 32) editorialItemCreator];
    id v3 = [v4 createEditorialItemFromCachedEntry:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
  }
}

void sub_10003F358(uint64_t a1)
{
  id v2 = [FREditorialItemEntry alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 80);
  id v10 = [*(id *)(a1 + 88) lastSeenDocumentVersion];
  LOBYTE(v21) = *(unsigned char *)(a1 + 128);
  NSURLResourceKey v22 = [(FREditorialItemEntry *)v2 initWithEditorialItemID:v3 title:v4 subtitle:v5 subtitleColorString:v6 image:0 actionUrlString:v7 lastModifiedDate:v8 documentVersion:v9 lastSeenDocumentVersion:v10 showBadge:v21];

  uint64_t v11 = [*(id *)(a1 + 96) editorialItemEntryManager];
  [v11 addEditorialItem:v22];

  id v12 = objc_alloc((Class)TSEditorialItem);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 104);
  id v18 = +[NSURL URLWithString:*(void *)(a1 + 64)];
  id v19 = [v12 initWithIdentifier:v13 title:v14 subtitle:v15 subtitleColor:v16 attributes:v17 actionURL:v18 thumbnailImage:0 backingTag:0 headline:*(void *)(a1 + 112)];

  uint64_t v20 = *(void *)(a1 + 120);
  if (v20) {
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v19);
  }
}

void sub_10003F4B8(uint64_t a1, UIImage *image)
{
  UIImagePNGRepresentation(image);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [FREditorialItemEntry alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v11 = [*(id *)(a1 + 88) lastSeenDocumentVersion];
  LOBYTE(v25) = *(unsigned char *)(a1 + 128);
  id v12 = [(FREditorialItemEntry *)v3 initWithEditorialItemID:v4 title:v5 subtitle:v6 subtitleColorString:v7 image:v26 actionUrlString:v8 lastModifiedDate:v9 documentVersion:v10 lastSeenDocumentVersion:v11 showBadge:v25];

  uint64_t v13 = [*(id *)(a1 + 96) editorialItemEntryManager];
  [v13 addEditorialItem:v12];

  uint64_t v14 = [*(id *)(a1 + 96) thumbnailCreator];
  uint64_t v15 = [v14 editorialThumbnailImageWith:v26];

  id v16 = objc_alloc((Class)TSEditorialItem);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 104);
  NSURLResourceKey v22 = +[NSURL URLWithString:*(void *)(a1 + 64)];
  id v23 = [v16 initWithIdentifier:v17 title:v18 subtitle:v19 subtitleColor:v20 attributes:v21 actionURL:v22 thumbnailImage:v15 backingTag:0 headline:*(void *)(a1 + 112)];

  uint64_t v24 = *(void *)(a1 + 120);
  if (v24) {
    (*(void (**)(uint64_t, id))(v24 + 16))(v24, v23);
  }
}

uint64_t sub_10003F830(uint64_t a1)
{
  id v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_100076234(a1, v2);
  }
  return 0;
}

uint64_t sub_10003F880(uint64_t a1)
{
  id v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Editorial Item Provider: New Editorial ArticleID: %{public}@, showing badge", (uint8_t *)&v5, 0xCu);
  }
  return 1;
}

void sub_10003FA24(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) documentController];
  uint64_t v3 = [v2 imageResourceForIdentifier:*(void *)(a1 + 40)];

  id v4 = objc_alloc((Class)SXImageRequest);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v3 URL];
  id v7 = [v4 initWithImageIdentifier:v5 imageQualities:4 url:v6 size:CGSizeMake(0, 0) preserveColorspace:0 loadingBlock:CGSizeZero.width, CGSizeZero.height];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003FB4C;
  v10[3] = &unk_1000C7A80;
  uint64_t v8 = *(void **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v9 = [v8 loadImagesForImageRequest:v7 completionBlock:v10];
}

void sub_10003FB4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003FC10;
    v6[3] = &unk_1000C7A58;
    id v7 = *(id *)(a1 + 32);
    [v4 enumerateObjectsUsingBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

void sub_10003FC10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)UIImage);
  uint64_t v5 = [v3 image];

  id v6 = v5;
  id v7 = [v6 CGImage];
  uint64_t v8 = +[UIScreen mainScreen];
  [v8 scale];
  id v10 = [v4 initWithCGImage:v7 scale:0 orientation:];

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }
}

TSExplicitContentRestrictionAlertPresenter *__cdecl sub_1000400C0(id a1, TFResolver *a2)
{
  id v2 = objc_alloc_init(FRExplicitContentRestrictionAlertPresenter);

  return (TSExplicitContentRestrictionAlertPresenter *)v2;
}

FROnboardingDataManager *sub_1000400F0(uint64_t a1)
{
  id v2 = [FROnboardingDataManager alloc];
  id v3 = [*(id *)(a1 + 32) feldsparContext];
  id v4 = [(FROnboardingDataManager *)v2 initWithFeldsparContext:v3];

  return v4;
}

NSString *__cdecl sub_100040500(id a1, FCTagProviding *a2)
{
  return (NSString *)[(FCTagProviding *)a2 name];
}

NSString *__cdecl sub_1000406F4(id a1, FCTagProviding *a2)
{
  return (NSString *)[(FCTagProviding *)a2 name];
}

void sub_100040900(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 appendFormat:@"_%@", v3];
}

void sub_100040AD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fetchedObject];
  id v5 = [v4 copy];

  id v6 = [v5 firstObject];
  id v7 = dispatch_group_create();
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = sub_100018AD0;
  id v49 = sub_1000189F0;
  uint64_t v8 = +[UIScreen mainScreen];
  [v8 scale];
  uint64_t v9 = FCThumbnailForHeadlineMinimumSize();
  id v50 = [v9 thumbnailAssetHandle];

  uint64_t v39 = 0;
  double v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_100018AD0;
  id v43 = sub_1000189F0;
  id v10 = [v6 sourceChannel];
  id v11 = [v10 theme];
  id v12 = [v11 bannerImageForMask];
  id v44 = [v12 assetHandle];

  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_100018AD0;
  double v37 = sub_1000189F0;
  uint64_t v13 = [v6 sourceChannel];
  uint64_t v14 = [v13 theme];
  uint64_t v15 = [v14 compactBannerImage];
  id v38 = [v15 assetHandle];

  id v16 = (void *)v46[5];
  if (v16) {
    id v17 = [v16 downloadIfNeededWithGroup:v7];
  }
  uint64_t v18 = (void *)v40[5];
  if (v18)
  {
    id v19 = [v18 downloadIfNeededWithGroup:v7];
    uint64_t v20 = (void *)v40[5];
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = (void *)v34[5];
  if (v20 == v21)
  {
    v34[5] = 0;
  }
  else
  {
    id v22 = [v21 downloadIfNeededWithGroup:v7];
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  void v26[2] = sub_100040E64;
  v26[3] = &unk_1000C7ED0;
  long long v30 = &v45;
  id v31 = &v39;
  id v32 = &v33;
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = *(void **)(a1 + 40);
  id v27 = v6;
  uint64_t v28 = v23;
  id v29 = v24;
  id v25 = v6;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, v26);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

void sub_100040E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100040E64(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) filePath];
    if (v2)
    {
      id v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) filePath];
      uint64_t v4 = +[NSURL fileURLWithPath:v3 isDirectory:0];
    }
    else
    {
      uint64_t v4 = 0;
    }

    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) filePath];
    if (v5)
    {
      id v6 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) filePath];
      uint64_t v7 = +[NSURL fileURLWithPath:v6 isDirectory:0];
    }
    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) filePath];
    if (v8)
    {
      uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) filePath];
      uint64_t v10 = +[NSURL fileURLWithPath:v9 isDirectory:0];
    }
    else
    {
      uint64_t v10 = 0;
    }

    if (v4)
    {
      id v11 = +[NSData dataWithContentsOfURL:v4];
      [v11 bytes];
    }
    if (v7)
    {
      id v12 = +[NSData dataWithContentsOfURL:v7];
      [v12 bytes];
    }
    if (v10)
    {
      id v13 = +[NSData dataWithContentsOfURL:v10];
      [v13 bytes];
    }
    uint64_t v14 = +[NSMutableDictionary dictionary];
    uint64_t v15 = [*(id *)(a1 + 32) articleID];

    if (v15)
    {
      uint64_t v16 = [*(id *)(a1 + 32) articleID];
      [v14 setObject:v16 forKeyedSubscript:FCNotificationPayloadArticleIDKey];
    }
    uint64_t v17 = [*(id *)(a1 + 32) title];

    if (v17)
    {
      uint64_t v18 = [*(id *)(a1 + 32) title];
      [v14 setObject:v18 forKeyedSubscript:FCNotificationPayloadTitleKey];
    }
    uint64_t v19 = [*(id *)(a1 + 32) shortExcerpt];

    if (v19)
    {
      uint64_t v20 = [*(id *)(a1 + 32) shortExcerpt];
      [v14 setObject:v20 forKeyedSubscript:FCNotificationPayloadExcerptKey];
    }
    uint64_t v21 = [*(id *)(a1 + 32) sourceChannel];
    id v22 = [v21 identifier];

    if (v22)
    {
      uint64_t v23 = [*(id *)(a1 + 32) sourceChannel];
      uint64_t v24 = [v23 identifier];
      [v14 setObject:v24 forKeyedSubscript:FCNotificationPayloadSourceChannelIDKey];
    }
    id v25 = [*(id *)(a1 + 32) sourceChannel];
    id v26 = [v25 name];

    if (v26)
    {
      id v27 = [*(id *)(a1 + 32) sourceChannel];
      uint64_t v28 = [v27 name];
      [v14 setObject:v28 forKeyedSubscript:FCNotificationPayloadPublisherNameKey];
    }
    id v29 = [*(id *)(a1 + 32) sourceChannel];
    long long v30 = [v29 nameCompact];

    if (v30)
    {
      id v31 = [*(id *)(a1 + 32) sourceChannel];
      id v32 = [v31 nameCompact];
      [v14 setObject:v32 forKeyedSubscript:FCNotificationPayloadPublisherNameCompactKey];
    }
    uint64_t v33 = [*(id *)(a1 + 32) publishDate];

    if (v33)
    {
      id v34 = [*(id *)(a1 + 32) publishDate];
      [v34 timeIntervalSince1970];
      uint64_t v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v14 setObject:v35 forKeyedSubscript:FCNotificationPayloadPublishDateKey];
    }
    uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) remoteURL];

    if (v36)
    {
      double v37 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) remoteURL];
      id v38 = [v37 absoluteString];
      [v14 setObject:v38 forKeyedSubscript:FCNotificationPayloadThumbnailURLKey];
    }
    uint64_t v39 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) remoteURL];

    if (v39)
    {
      double v40 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) remoteURL];
      uint64_t v41 = [v40 absoluteString];
      [v14 setObject:v41 forKeyedSubscript:FCNotificationPayloadPublisherLogoURLKey];
    }
    uint64_t v42 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v42 != *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v43 = [v42 remoteURL];

      if (v43)
      {
        id v44 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) remoteURL];
        uint64_t v45 = [v44 absoluteString];
        [v14 setObject:v45 forKeyedSubscript:FCNotificationPayloadPublisherLogoCompactURLKey];
      }
    }
    v80[0] = @"SimulateRemoteNotificationType";
    v79[0] = @"LocalNotificationTypeKey";
    v79[1] = FCNotificationPayloadNewsKey;
    id v46 = [v14 copy];
    v80[1] = v46;
    uint64_t v47 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];

    id v48 = objc_alloc_init((Class)UNMutableNotificationContent);
    id v49 = [*(id *)(a1 + 32) sourceChannel];
    id v50 = [v49 name];
    [v48 setTitle:v50];

    long long v51 = [*(id *)(a1 + 32) title];
    [v48 setBody:v51];

    [v48 setCategoryIdentifier:FCNotificationArticleCategory];
    [v48 setUserInfo:v47];
    long long v52 = [*(id *)(a1 + 40) _notificationAttachmentsWithThumbnailFileURL:v4 publisherLogoFileURL:v7 publisherLogoCompactFileURL:v10];
    [v48 setAttachments:v52];

    +[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0 repeats:3.0];
    long long v53 = v69 = (void *)v4;
    long long v54 = +[NSUUID UUID];
    CGRect v55 = [v54 UUIDString];
    v68 = (void *)v10;
    id v56 = [v48 copy];
    +[UNNotificationRequest requestWithIdentifier:v55 content:v56 trigger:v53];
    CGRect v57 = v67 = (void *)v7;

    id v58 = +[UNUserNotificationCenter currentNotificationCenter];
    [v58 addNotificationRequest:v57 withCompletionHandler:&stru_1000C7E58];

    dispatch_time_t v59 = dispatch_time(0, 10000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100041878;
    block[3] = &unk_1000C7E80;
    long long v77 = *(_OWORD *)(a1 + 56);
    uint64_t v78 = *(void *)(a1 + 72);
    dispatch_after(v59, (dispatch_queue_t)&_dispatch_main_q, block);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1000418E0;
    v74[3] = &unk_1000C7EA8;
    id v60 = [objc_alloc((Class)NSSArticleViewControllerInternal) initWithNibName:0 bundle:0];
    id v75 = v60;
    +[NSSArticleInternal articleFromNotificationUserInfo:v47 thumbnailFileURL:0 publisherLogoFileURL:0 publisherLogoMaskFileURL:0 completion:v74];
    __int16 v61 = +[UIApplication sharedApplication];
    id v62 = [v61 key_window];

    v63 = [v62 rootViewController];
    [v63 presentViewController:v60 animated:1 completion:0];

    dispatch_time_t v64 = dispatch_time(0, 10000000000);
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1000418EC;
    v72[3] = &unk_1000C5680;
    id v73 = v60;
    id v65 = v60;
    dispatch_after(v64, (dispatch_queue_t)&_dispatch_main_q, v72);

    dispatch_time_t v66 = dispatch_time(0, 3000000000);
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100041938;
    v70[3] = &unk_1000C6E28;
    id v71 = *(id *)(a1 + 48);
    dispatch_after(v66, (dispatch_queue_t)&_dispatch_main_q, v70);
  }
}

void sub_100041878(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

id sub_1000418E0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) setArticle:a2];
}

void sub_1000418EC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

uint64_t sub_100041938(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100041E50(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_1000765E8((uint64_t)v2, v3);
    }
  }
}

FREnableNotificationsAlertPresenter *__cdecl sub_100042380(id a1, TFResolver *a2)
{
  uint64_t v2 = a2;
  id v3 = [(TFResolver *)v2 resolveClass:objc_opt_class()];

  return (FREnableNotificationsAlertPresenter *)v3;
}

FREnableNotificationsAlertPresenter *__cdecl sub_1000423E0(id a1, TFResolver *a2)
{
  uint64_t v2 = objc_alloc_init(FREnableNotificationsAlertPresenter);

  return v2;
}

void sub_1000424DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained delegate];
  [v1 gizmoPreferencesNotifierDidNoticeUpdate:WeakRetained];
}

id sub_100042BA4(uint64_t a1, void *a2)
{
  id v3 = [a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == (id)2) {
    uint64_t v4 = 32;
  }
  id v5 = *(void **)(a1 + v4);

  return v5;
}

void sub_1000430B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1000430D8(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _OWORD v3[2] = sub_100043160;
  v3[3] = &unk_1000C8070;
  void v3[4] = *(void *)(a1 + 40);
  [a2 enumerateKeysAndObjectsUsingBlock:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_100043160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:a3 forKey:a2];
}

void sub_100043174(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _OWORD v3[2] = sub_1000431FC;
  v3[3] = &unk_1000C8070;
  void v3[4] = *(void *)(a1 + 40);
  [a2 enumerateKeysAndObjectsUsingBlock:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_1000431FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:a3 forKey:a2];
}

void sub_100043210(uint64_t a1)
{
  uint64_t v2 = +[NSMutableArray array];
  id v3 = +[NSMutableArray array];
  uint64_t v4 = +[NSMutableArray array];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000434D8;
  v24[3] = &unk_1000C80C0;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v28 = *(void *)(a1 + 48);
  void v24[4] = v5;
  id v7 = v2;
  id v25 = v7;
  id v8 = v3;
  id v26 = v8;
  id v9 = v4;
  id v27 = v9;
  [v6 enumerateObjectsUsingBlock:v24];
  uint64_t v10 = [*(id *)(a1 + 40) editorialItemEntryManager];
  id v11 = [v10 orderedEditorialItemIDs];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100043968;
  v21[3] = &unk_1000C80E8;
  id v12 = v8;
  id v22 = v12;
  id v13 = v9;
  id v23 = v13;
  [v11 enumerateObjectsUsingBlock:v21];
  uint64_t v14 = [*(id *)(a1 + 40) editorialItemEntryManager];
  [v14 addOrderedEditorialItemIDs:v12];

  uint64_t v15 = [*(id *)(a1 + 40) itemChangeDelegate];
  [v15 refreshEditorialItemsWithItems:v7];

  if (![*(id *)(a1 + 32) count])
  {
    uint64_t v16 = [*(id *)(a1 + 40) editorialItemEntryManager];
    uint64_t v17 = [v16 editorialItemsByID];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000439C8;
    v19[3] = &unk_1000C8110;
    id v20 = v13;
    [v17 enumerateKeysAndObjectsUsingBlock:v19];
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000439D4;
  v18[3] = &unk_1000C8138;
  void v18[4] = *(void *)(a1 + 40);
  [v13 enumerateObjectsUsingBlock:v18];
}

void sub_1000434D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v47 = v3;
  uint64_t v5 = [v3 identifier];
  uint64_t v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = [v47 title];
    if (v7)
    {
      [v6 setTitle:v7];
    }
    else
    {
      uint64_t v10 = [v6 title];
      [v6 setTitle:v10];
    }
    id v11 = [v47 subtitle];
    if (v11)
    {
      [v6 setSubtitle:v11];
    }
    else
    {
      id v12 = [v6 subtitle];
      [v6 setSubtitle:v12];
    }
    id v13 = [v47 subtitleColorString];
    if (v13)
    {
      [v6 setSubtitleColor:v13];
    }
    else
    {
      uint64_t v14 = [v6 subtitleColor];
      [v6 setSubtitleColor:v14];
    }
    uint64_t v15 = [v47 actionUrlString];
    if (v15)
    {
      uint64_t v16 = [v47 actionUrlString];
      uint64_t v17 = +[NSURL URLWithString:v16];
      [v6 setActionURL:v17];
    }
    else
    {
      uint64_t v16 = [v6 actionURL];
      [v6 setActionURL:v16];
    }

    uint64_t v18 = [*(id *)(a1 + 32) editorialItemEntryManager];
    uint64_t v19 = [v18 editorialItemsByID];
    id v20 = [v6 identifier];
    id v9 = [v19 objectForKey:v20];

    unsigned __int8 v21 = [*(id *)(a1 + 32) _editorialItemHasBadge:v6];
    uint64_t v45 = a1;
    if ((v21 & 1) == 0 && v9)
    {
      id v22 = [v9 actionUrlString];
      id v23 = [v6 actionURL];
      uint64_t v24 = [v23 absoluteString];
      unsigned __int8 v25 = [v22 isEqualToString:v24];

      if (v25)
      {
        unsigned __int8 v21 = 0;
      }
      else
      {
        id v26 = +[NSMutableArray array];
        id v27 = +[NSNumber numberWithInteger:0];
        [v26 addObject:v27];

        [v6 setAttributes:v26];
        unsigned __int8 v21 = 1;
      }
    }
    unsigned __int8 v44 = v21;
    id v43 = [FREditorialItemEntry alloc];
    uint64_t v41 = [v47 identifier];
    uint64_t v28 = [v6 title];
    id v29 = [v6 subtitle];
    long long v30 = [v6 subtitleColor];
    [v9 image];
    id v31 = v46 = v6;
    uint64_t v42 = [v46 actionURL];
    id v32 = [v42 absoluteString];
    uint64_t v33 = [v9 lastModifiedDate];
    id v34 = [v9 documentVersion];
    uint64_t v35 = [v9 lastSeenDocumentVersion];
    LOBYTE(v40) = v44;
    uint64_t v36 = [(FREditorialItemEntry *)v43 initWithEditorialItemID:v41 title:v28 subtitle:v29 subtitleColorString:v30 image:v31 actionUrlString:v32 lastModifiedDate:v33 documentVersion:v34 lastSeenDocumentVersion:v35 showBadge:v40];

    uint64_t v6 = v46;
    double v37 = [*(id *)(v45 + 32) editorialItemEntryManager];
    [v37 addEditorialItem:v36];

    [*(id *)(v45 + 40) addObject:v46];
    id v38 = *(void **)(v45 + 48);
    uint64_t v39 = [v46 identifier];
    [v38 addObject:v39];
  }
  else
  {
    id v8 = *(void **)(a1 + 56);
    id v9 = [v47 identifier];
    [v8 addObject:v9];
  }
}

void sub_100043968(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

id sub_1000439C8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_1000439D4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 editorialItemEntryManager];
  [v4 removeItemWithIdentifier:v3];
}

void sub_100043AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100043B14(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = [a2 intValue];
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_100043C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100043CAC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 editorialItemEntryManager];
  uint64_t v6 = [v5 editorialItemsByID];
  id v44 = [v6 objectForKey:v4];

  id v7 = [v44 editorialItemID];
  LODWORD(v4) = [v7 fc_isValidArticleID];

  if (v4)
  {
    id v8 = [*(id *)(a1 + 32) cloudContext];
    id v9 = [v8 articleController];
    uint64_t v10 = [v44 editorialItemID];
    id v11 = [v9 articleWithID:v10];
    uint64_t v12 = [v11 headline];

    if (!v12) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    id v13 = [v44 image];

    uint64_t v43 = a1;
    if (v13)
    {
      uint64_t v14 = [*(id *)(a1 + 32) thumbnailCreator];
      uint64_t v15 = [v44 image];
      id v13 = [v14 editorialThumbnailImageWith:v15];
    }
    uint64_t v16 = (void *)v12;
    uint64_t v17 = +[NSMutableArray array];
    if ([v44 showBadge])
    {
      uint64_t v18 = +[NSNumber numberWithInteger:0];
      [v17 addObject:v18];
    }
    id v19 = objc_alloc((Class)TSEditorialItem);
    id v20 = [v44 editorialItemID];
    unsigned __int8 v21 = [v44 title];
    id v22 = [v44 subtitle];
    id v23 = [v44 subtitleColorString];
    uint64_t v24 = [v44 actionUrlString];
    unsigned __int8 v25 = +[NSURL URLWithString:v24];
    id v26 = [v19 initWithIdentifier:v20 title:v21 subtitle:v22 subtitleColor:v23 attributes:v17 actionURL:v25 thumbnailImage:v13 backingTag:0 headline:v16];

    id v27 = v16;
    [*(id *)(v43 + 40) addObject:v26];
  }
  else
  {
    uint64_t v28 = [v44 editorialItemID];
    unsigned int v29 = [v28 fc_isValidTagID];

    long long v30 = v44;
    if (!v29) {
      goto LABEL_16;
    }
    id v31 = [*(id *)(a1 + 32) cloudContext];
    id v32 = [v31 tagController];
    uint64_t v33 = [v44 editorialItemID];
    id v27 = [v32 slowCachedTagForID:v33];

    if (!v27)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_15;
    }
    id v13 = +[NSMutableArray array];
    if ([v44 showBadge])
    {
      id v34 = +[NSNumber numberWithInteger:0];
      [v13 addObject:v34];
    }
    id v35 = objc_alloc((Class)TSEditorialItem);
    uint64_t v36 = [v44 editorialItemID];
    double v37 = [v44 title];
    id v38 = [v44 subtitle];
    uint64_t v39 = [v44 subtitleColorString];
    uint64_t v40 = [v44 actionUrlString];
    uint64_t v41 = +[NSURL URLWithString:v40];
    id v42 = [v35 initWithIdentifier:v36 title:v37 subtitle:v38 subtitleColor:v39 attributes:v13 actionURL:v41 thumbnailImage:0 backingTag:v27 headline:0];

    [*(id *)(a1 + 40) addObject:v42];
  }

LABEL_15:
  long long v30 = v44;
LABEL_16:
}

void sub_1000444E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 168));
  _Unwind_Resume(a1);
}

void sub_100044520(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 editorialItemEntryManager];
  uint64_t v6 = [v5 editorialItemsByID];
  id v12 = [v6 objectForKey:v4];

  id v7 = [v12 editorialItemID];
  LODWORD(v4) = [v7 fc_isValidArticleID];

  if (v4)
  {
    id v8 = (void *)a1[5];
  }
  else
  {
    id v9 = [v12 editorialItemID];
    unsigned int v10 = [v9 fc_isValidTagID];

    if (!v10) {
      goto LABEL_6;
    }
    id v8 = (void *)a1[6];
  }
  id v11 = [v12 editorialItemID];
  [v8 setObject:v12 forKeyedSubscript:v11];

LABEL_6:
}

void sub_100044618(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v5 = v3;
  FCPerformIfNonNil();
}

void sub_100044704(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  id v5 = [v3 error];

  if (v5)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100044868;
    v12[3] = &unk_1000C56D0;
    id v6 = &v13;
    id v13 = a1[4];
    id v14 = a1[5];
    sub_100044868((uint64_t)v12);
    id v7 = v14;
  }
  else
  {
    id v8 = [a1[4] fetchedObject];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000448BC;
    v9[3] = &unk_1000C8200;
    id v6 = (id *)v10;
    v10[0] = a1[6];
    v10[1] = v4;
    id v11 = a1[7];
    [v8 enumerateObjectsUsingBlock:v9];

    dispatch_group_leave((dispatch_group_t)a1[5]);
    id v7 = v11;
  }
}

void sub_100044868(uint64_t a1)
{
  uint64_t v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_100076CA8(a1, v2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000448BC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 articleID];
  id v23 = [v3 objectForKeyedSubscript:v5];

  id v6 = [v23 image];

  uint64_t v21 = a1;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) thumbnailCreator];
    id v8 = [v23 image];
    id v22 = [v7 editorialThumbnailImageWith:v8];
  }
  else
  {
    id v22 = 0;
  }
  id v9 = +[NSMutableArray array];
  if ([v23 showBadge])
  {
    unsigned int v10 = +[NSNumber numberWithInteger:0];
    [v9 addObject:v10];
  }
  id v11 = objc_alloc((Class)TSEditorialItem);
  id v12 = [v23 editorialItemID];
  id v13 = [v23 title];
  id v14 = [v23 subtitle];
  uint64_t v15 = [v23 subtitleColorString];
  uint64_t v16 = [v23 actionUrlString];
  uint64_t v17 = +[NSURL URLWithString:v16];
  id v18 = [v11 initWithIdentifier:v12 title:v13 subtitle:v14 subtitleColor:v15 attributes:v9 actionURL:v17 thumbnailImage:v22 backingTag:0 headline:v4];

  id v19 = *(void **)(v21 + 48);
  id v20 = [v23 editorialItemID];
  [v19 setObject:v18 forKey:v20];
}

void sub_100044AF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  FCPerformIfNonNil();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100044BCC(uint64_t a1)
{
  uint64_t v1 = a1;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [*(id *)(a1 + 32) allKeys];
  id v19 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v19)
  {
    uint64_t v17 = v1;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v4 = [*(id *)(v1 + 40) objectForKey:v3];
        id v5 = [*(id *)(v1 + 32) objectForKeyedSubscript:v3];
        if (v4)
        {
          id v23 = v4;
          id v6 = +[NSMutableArray array];
          if ([v5 showBadge])
          {
            id v7 = +[NSNumber numberWithInteger:0];
            [v6 addObject:v7];
          }
          id v21 = objc_alloc((Class)TSEditorialItem);
          id v20 = [v5 editorialItemID];
          id v8 = [v5 title];
          id v9 = [v5 subtitle];
          unsigned int v10 = [v5 subtitleColorString];
          [v5 actionUrlString];
          id v11 = v22 = v6;
          id v12 = +[NSURL URLWithString:v11];
          id v4 = v23;
          id v13 = [v21 initWithIdentifier:v20 title:v8 subtitle:v9 subtitleColor:v10 attributes:v6 actionURL:v12 thumbnailImage:0 backingTag:v23 headline:0];

          uint64_t v1 = v17;
          id v14 = *(void **)(v17 + 48);
          uint64_t v15 = [v5 editorialItemID];
          [v14 setObject:v13 forKey:v15];
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }
}

id sub_100044E64(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _refreshEditorialItemsOrderedWith:*(void *)(a1 + 40)];
}

uint64_t sub_100044F80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return _objc_release_x1();
}

void sub_1000450A8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 editorialItemEntryManager];
  id v9 = [v8 editorialItemsByID];
  id v12 = [v9 objectForKey:v7];

  unsigned int v10 = *(void **)(a1 + 40);
  id v11 = [v12 editorialItemID];
  LODWORD(v10) = [v10 isEqualToString:v11];

  if (v10)
  {
    [*(id *)(a1 + 32) tappedEditorialItemWithIdentifier:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

void sub_10004560C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_100045668(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v6 = a1[4];
  id v7 = a1[5];
  id v5 = v3;
  FCPerformIfNonNil();
}

void sub_100045740(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) error];

  if (v4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100045920;
    v17[3] = &unk_1000C5680;
    id v18 = *(id *)(a1 + 32);
    sub_100045920((uint64_t)v17);
  }
  else
  {
    id v16 = objc_alloc((Class)TSEditorialItem);
    id v5 = [*(id *)(a1 + 40) editorialItemID];
    id v6 = [*(id *)(a1 + 40) title];
    id v7 = [*(id *)(a1 + 40) subtitle];
    id v8 = [*(id *)(a1 + 40) subtitleColorString];
    id v9 = [*(id *)(a1 + 40) actionUrlString];
    unsigned int v10 = +[NSURL URLWithString:v9];
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = [*(id *)(a1 + 32) fetchedObject];
    id v13 = [v12 firstObject];
    id v14 = [v16 initWithIdentifier:v5 title:v6 subtitle:v7 subtitleColor:v8 attributes:&__NSArray0__struct actionURL:v10 thumbnailImage:v11 backingTag:0 headline:v13];

    uint64_t v15 = [v3 itemChangeDelegate];
    [v15 updateEditorialItemWith:v14];
  }
}

void sub_100045920(uint64_t a1)
{
  uint64_t v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_100076CA8(a1, v2);
  }
}

void sub_10004596C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v5 = v3;
  FCPerformIfNonNil();
}

void sub_100045A30(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = a2;
    id v4 = objc_alloc((Class)TSEditorialItem);
    id v5 = [*(id *)(a1 + 40) editorialItemID];
    id v6 = [*(id *)(a1 + 40) title];
    id v7 = [*(id *)(a1 + 40) subtitle];
    id v8 = [*(id *)(a1 + 40) subtitleColorString];
    id v9 = [*(id *)(a1 + 40) actionUrlString];
    unsigned int v10 = +[NSURL URLWithString:v9];
    id v12 = [v4 initWithIdentifier:v5 title:v6 subtitle:v7 subtitleColor:v8 attributes:&__NSArray0__struct actionURL:v10 thumbnailImage:0 backingTag:*(void *)(a1 + 32) headline:0];

    uint64_t v11 = [v3 itemChangeDelegate];

    [v11 updateEditorialItemWith:v12];
  }
}

void sub_100045E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
}

uint64_t sub_100045EB0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100045EC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v5 = v3;
  FCPerformIfNonNil();
}

void sub_100045F8C(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = [a2 interestTokens];
    [v3 addObject:*(void *)(a1 + 32)];
  }
  id v4 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v4);
}

uint64_t sub_100045FE4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100046174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a3) {
      a2 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_100046194(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 32) editorialConfigurationProvider];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _OWORD v3[2] = sub_10004628C;
  v3[3] = &unk_1000C83B8;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  [v2 fetchEditorialConfiguration:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void sub_100046268(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10004628C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  FCPerformIfNonNil();

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v10, v11, v12);
}

void sub_10004636C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100046410;
    v4[3] = &unk_1000C5680;
    id v5 = v2;
    sub_100046410((uint64_t)v4);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    _[a2 processOverrideEditorialItems:v3];
  }
}

void sub_100046410(uint64_t a1)
{
  uint64_t v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_100076EC8(a1, v2);
  }
}

void sub_10004657C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000465AC(uint64_t a1)
{
}

void sub_1000465B4(uint64_t a1)
{
}

void sub_1000468C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000468E8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100076F44(a1);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_10004694C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v2 = [*(id *)(a1 + 32) count];
    id v3 = [*(id *)(a1 + 40) count];
    int v6 = 134218240;
    id v7 = v2;
    __int16 v8 = 2048;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Marked %lu IDs saved and %lu IDs unsaved…", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void sub_100046BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100046C04(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100076FF0();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void sub_100046C74(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Cleared seen identifiers!", v4, 2u);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100046D00(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void **)(a1 + 32);
  if (v10)
  {
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    uint64_t v15 = sub_100046E14;
    id v16 = &unk_1000C84D0;
    id v20 = v10;
    id v17 = v7;
    id v18 = v8;
    id v19 = v9;
    FCPerformBlockOnMainThread();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate:v13, v14, v15, v16];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

uint64_t sub_100046E14(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void sub_100046EF0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 gizmoSyncManager:*(void *)(a1 + 32) fetchOperationForArticleIDs:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = sub_100018AF0;
    id v21 = sub_100018A00;
    id v22 = [*(id *)(a1 + 32) _newCompanionConnection];
    [(id)v18[5] resume];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100047120;
    v14[3] = &unk_1000C84A8;
    id v15 = *(id *)(a1 + 48);
    id v16 = &v17;
    uint64_t v4 = objc_retainBlock(v14);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000471A4;
    v9[3] = &unk_1000C8570;
    id v5 = *(void **)(a1 + 40);
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v5;
    id v13 = &v17;
    int v6 = v4;
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    [v3 setFetchCompletionBlock:v9];
    id v7 = +[NSOperationQueue fc_sharedSerialQueue];
    [v7 addOperation:v3];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100077060();
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
  }
}

void sub_100047104(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100047120(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100077150();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void sub_1000471A4(id *a1, void *a2)
{
  id v3 = [a2 fetchedObject];
  id v4 = [v3 copy];

  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v5 = v4;
  FCPerformBlockOnMainThread();
}

void sub_100047298(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) readingHistory];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        [v2 markArticleAsSeenWithHeadline:v8];
        [v2 markArticleAsReadWithHeadline:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Consuming seen IDs = %@", buf, 0xCu);
  }
  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) remoteObjectProxyWithErrorHandler:*(void *)(a1 + 56)];
  uint64_t v11 = *(void *)(a1 + 48);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100047498;
  v14[3] = &unk_1000C8520;
  id v12 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  id v15 = v12;
  uint64_t v16 = v13;
  [v10 consumeSeenArticleIdentifiers:v11 withReply:v14];
}

void sub_100047498(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_1000475E0(id *a1)
{
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v38;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v38 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v7 = [a1[5] readingList];
        unsigned __int8 v8 = [v7 isArticleOnReadingList:v6];

        if ((v8 & 1) == 0)
        {
          uint64_t v9 = [a1[5] readingList];
          [v9 addArticleToReadingList:v6 eventInitiationLevel:1 origin:2];
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v3);
  }

  id v10 = +[NSMutableSet setWithArray:a1[4]];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = a1[6];
  id v12 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
        if (([v10 containsObject:v15] & 1) == 0)
        {
          uint64_t v16 = [a1[5] readingList];
          unsigned int v17 = [v16 isArticleOnReadingList:v15];

          if (v17) {
            [v10 addObject:v15];
          }
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = sub_100018AF0;
  id v31 = sub_100018A00;
  id v32 = [a1[5] _newCompanionConnection];
  [(id)v28[5] resume];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000479F4;
  v24[3] = &unk_1000C84A8;
  id v25 = a1[7];
  long long v26 = &v27;
  long long v18 = objc_retainBlock(v24);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v42 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Marking IDs as saved: %@", buf, 0xCu);
  }
  long long v19 = [(id)v28[5] remoteObjectProxyWithErrorHandler:v18];
  long long v20 = [v10 allObjects];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100047A78;
  v21[3] = &unk_1000C8520;
  id v22 = a1[7];
  id v23 = &v27;
  [v19 setSavedArticleIdentifiers:v20 withReply:v21];

  _Block_object_dispose(&v27, 8);
}

void sub_1000479D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000479F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000771C0();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void sub_100047A78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_100047ADC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100077230();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void sub_100047B60(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v2 = [*(id *)(a1 + 32) count];
    int v5 = 134217984;
    id v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%ld dates set…", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t sub_100047E70(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 CGContext];
  uint64_t v4 = *(uint64_t (**)(uint64_t, id))(v2 + 16);

  return v4(v2, v3);
}

uint64_t sub_100048044(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000481C8(id a1)
{
  uint64_t v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;

  uint64_t v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;

  if (v3 >= v6) {
    *(double *)&uint64_t v7 = v3;
  }
  else {
    *(double *)&uint64_t v7 = v6;
  }
  qword_1000EDFC0 = v7;
}

void sub_10004827C(id a1)
{
  uint64_t v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;

  uint64_t v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;

  if (v3 >= v6) {
    *(double *)&uint64_t v7 = v6;
  }
  else {
    *(double *)&uint64_t v7 = v3;
  }
  qword_1000EDFD0 = v7;
}

void sub_100048780(id a1)
{
  if (+[FRMacros iPad])
  {
    uint64_t v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;

    uint64_t v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v6 = v5;

    if (v3 >= v6) {
      double v7 = v3;
    }
    else {
      double v7 = v6;
    }
    BOOL v8 = v7 == 1366.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  byte_1000EDFE0 = v8;
}

void sub_10004885C(id a1)
{
  id v2 = +[UIScreen mainScreen];
  [v2 scale];
  byte_1000EE010 = v1 >= 2.0;
}

void sub_1000488FC(id a1)
{
  if (+[FRMacros iPhone])
  {
    double v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;

    uint64_t v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v6 = v5;

    if (v3 >= v6) {
      double v7 = v3;
    }
    else {
      double v7 = v6;
    }
    BOOL v8 = v7 < 568.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  byte_1000EE020 = v8;
}

void sub_1000489D8(id a1)
{
  if (+[FRMacros iPhone])
  {
    double v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;

    uint64_t v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v6 = v5;

    if (v3 >= v6) {
      double v7 = v3;
    }
    else {
      double v7 = v6;
    }
    BOOL v8 = v7 <= 568.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  byte_1000EE030 = v8;
}

void sub_100048AB4(id a1)
{
  if (+[FRMacros iPhone])
  {
    double v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;

    uint64_t v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v6 = v5;

    if (v3 >= v6) {
      double v7 = v3;
    }
    else {
      double v7 = v6;
    }
    BOOL v8 = v7 == 568.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  byte_1000EE040 = v8;
}

void sub_100048BF4(id a1)
{
  if (+[FRMacros iPhone])
  {
    double v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;

    uint64_t v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v6 = v5;

    if (v3 >= v6) {
      double v7 = v3;
    }
    else {
      double v7 = v6;
    }
    BOOL v8 = v7 == 667.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  byte_1000EE050 = v8;
}

id sub_100048D1C(uint64_t a1)
{
  id result = (id)+[FRMacros iPhone];
  if (result)
  {
    id result = [*(id *)(a1 + 32) maxScreenSide];
    BOOL v4 = v3 <= 667.0;
  }
  else
  {
    BOOL v4 = 0;
  }
  byte_1000EE060 = v4;
  return result;
}

void sub_100048DB8(id a1)
{
  if (+[FRMacros iPhone])
  {
    double v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;

    BOOL v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v6 = v5;

    if (v3 >= v6) {
      double v7 = v3;
    }
    else {
      double v7 = v6;
    }
    BOOL v8 = v7 == 736.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  byte_1000EE070 = v8;
}

id sub_100048EE0(uint64_t a1)
{
  id result = (id)+[FRMacros iPhone];
  if (result)
  {
    id result = [*(id *)(a1 + 32) maxScreenSide];
    BOOL v4 = v3 <= 736.0;
  }
  else
  {
    BOOL v4 = 0;
  }
  byte_1000EE080 = v4;
  return result;
}

id sub_100048FC8(uint64_t a1)
{
  id result = (id)+[FRMacros iPhone];
  if (result)
  {
    id result = [*(id *)(a1 + 32) maxScreenSide];
    BOOL v4 = v3 == 896.0;
  }
  else
  {
    BOOL v4 = 0;
  }
  byte_1000EE090 = v4;
  return result;
}

void sub_100049068(id a1)
{
  id v1 = +[UIDevice currentDevice];
  byte_1000EE091 = [v1 _supportsForceTouch];
}

void sub_1000490FC(id a1)
{
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    byte_1000EE0A0 = [v1 BOOLForKey:FCRunningUIAutomationTestsSharedPreferenceKey];
  }
  else
  {
    byte_1000EE0A0 = 0;
  }
}

void sub_1000491F8(id a1)
{
  id v2 = +[UIScreen mainScreen];
  [v2 scale];
  qword_1000EE0B0 = v1;
}

void sub_10004A240(uint64_t a1)
{
}

void sub_10004A248(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) resourcesLock];
  [v2 lock];

  double v3 = [*(id *)(a1 + 32) fontsToRegister];
  id v4 = [v3 copy];

  uint64_t v24 = a1;
  double v5 = [*(id *)(a1 + 32) resourcesLock];
  [v5 unlock];

  double v6 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v27;
    *(void *)&long long v9 = 134218242;
    long long v23 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v14 = [v13 fileURL:v23];
        id v25 = 0;
        unsigned int v15 = +[FRFont registerFontWithURL:v14 error:&v25];
        id v16 = v25;

        if (v15)
        {
          [v6 addObject:v13];
        }
        else
        {
          unsigned int v17 = FRArticleLog;
          if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = *(void *)(v24 + 32);
            *(_DWORD *)long long buf = v23;
            uint64_t v31 = v18;
            __int16 v32 = 2114;
            id v33 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%p failed to load font with error: %{public}@", buf, 0x16u);
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v10);
  }

  dispatch_group_leave(*(dispatch_group_t *)(v24 + 40));
  long long v19 = [*(id *)(v24 + 32) resourcesLock];
  [v19 lock];

  long long v20 = [*(id *)(v24 + 32) fontResources];
  [v20 addObjectsFromArray:v6];

  id v21 = [*(id *)(v24 + 32) fontsToRegister];
  [v21 removeAllObjects];

  id v22 = [*(id *)(v24 + 32) resourcesLock];
  [v22 unlock];
}

void sub_10004A4E4(uint64_t a1)
{
  id v2 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%p did fetch embed configuration", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10004A594(uint64_t a1)
{
  id v2 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%p did fetch linked content", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10004A644(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 32) context];
    uint64_t v3 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);
  }
}

void sub_10004AA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  objc_destroyWeak(v22);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak((id *)(v23 - 56));
  _Unwind_Resume(a1);
}

void sub_10004AA80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained loadingGroup];
    uint64_t v5 = [v4 loadAssetsOnce];
    uint64_t v6 = [v5 executeWithCompletionHandler:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004AB70;
    v9[3] = &unk_1000C6E28;
    id v10 = *(id *)(a1 + 32);
    sub_10004AB70((uint64_t)v9);
  }
}

uint64_t sub_10004AB70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10004AB80(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
  id v2 = *(void **)(a1 + 32);

  return [v2 cancel];
}

void sub_10004B344(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  id v8 = FRArticleLog;
  long long v9 = "@40";
  if (v5)
  {
    id v35 = v6;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v45 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%p successfully downloaded Flint JSON", buf, 0xCu);
    }
    id v11 = objc_alloc((Class)SXHostApplication);
    id v12 = +[UIApplication sharedApplication];
    id v13 = [v11 initWithApplication:v12];

    uint64_t v14 = [*(id *)(a1 + 32) headline];
    unsigned int v15 = [v14 articleID];
    id v16 = +[NSURL nss_NewsURLForArticleID:v15];

    id v17 = objc_alloc((Class)SXContext);
    uint64_t v18 = [*(id *)(a1 + 32) anfContent];
    long long v19 = [v18 identifier];
    long long v20 = [v5 data];
    uint64_t v21 = *(void *)(a1 + 32);
    id v43 = 0;
    id v22 = [v17 initWithIdentifier:v19 shareURL:v16 JSONData:v20 resourceDataSource:v21 host:v13 error:&v43];
    id v23 = v43;

    uint64_t v24 = 0;
    id v25 = 0;
    if (!v23)
    {
      long long v26 = [v22 documentController];
      long long v27 = [v26 requiredResourceURLs];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10004B6F8;
      v42[3] = &unk_1000C7638;
      v42[4] = *(void *)(a1 + 32);
      id v25 = [v27 fc_arrayByTransformingWithBlock:v42];

      long long v28 = [*(id *)(a1 + 32) resourceManager];
      long long v29 = [v28 cachedResourcesWithIdentifiers:v25];
      uint64_t v24 = [v29 fc_dictionaryWithKeySelector:@"resourceID"];

      long long v9 = "@\"NSData\"48@0:8@\"CSSearchableIndex\"16@\"NSString\"24@\"NSString\"32o^@40" + 65;
    }

    uint64_t v7 = v35;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR)) {
      sub_100077380(a1, (uint64_t)v7, v8);
    }
    id v23 = v7;
    uint64_t v24 = 0;
    id v25 = 0;
    id v22 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = *((void *)v9 + 67);
  block[2] = sub_10004B704;
  block[3] = &unk_1000C8840;
  long long v30 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v37 = v22;
  id v38 = v23;
  id v39 = v25;
  id v40 = v24;
  id v41 = v30;
  id v31 = v24;
  id v32 = v25;
  id v33 = v23;
  id v34 = v22;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10004B6F8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _resourceIDFromResourceURL:a2];
}

uint64_t sub_10004B704(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];

  if (!v2)
  {
    [*(id *)(a1 + 32) setContext:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setError:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setRequiredResourceIDs:*(void *)(a1 + 56)];
    if (*(void *)(a1 + 64))
    {
      uint64_t v3 = [*(id *)(a1 + 32) resourcesLock];
      [v3 lock];

      id v4 = [*(id *)(a1 + 32) resourcesByID];
      [v4 addEntriesFromDictionary:*(void *)(a1 + 64)];

      id v5 = [*(id *)(a1 + 32) resourcesLock];
      [v5 unlock];
    }
  }
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);

  return v6();
}

void sub_10004BA70(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 allValues];
  id v8 = [v7 fc_arrayByTransformingWithBlock:&stru_1000C88A8];

  long long v9 = [a1[4] resourcesLock];
  [v9 lock];

  uint64_t v10 = [a1[4] fontResources];
  [v10 removeAllObjects];

  id v11 = [a1[4] resourcesByID];
  [v11 addEntriesFromDictionary:v6];

  id v12 = [a1[4] fontsToRegister];
  [v12 addObjectsFromArray:v8];

  id v13 = [a1[4] resourcesLock];
  [v13 unlock];

  id v14 = [v8 count];
  id v15 = [a1[5] count];
  id v16 = (void *)FRArticleLog;
  if (v14 != v15)
  {
    if (!os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v20 = a1[4];
    long long v19 = v16;
    id v21 = [v8 count];
    id v22 = [a1[5] count];
    *(_DWORD *)long long buf = 134218754;
    id v27 = v20;
    __int16 v28 = 2048;
    id v29 = v21;
    __int16 v30 = 2048;
    id v31 = v22;
    __int16 v32 = 2112;
    id v33 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%p failed to download %lu of %lu fonts with error: %@", buf, 0x2Au);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = a1[4];
    id v17 = a1[5];
    long long v19 = v16;
    *(_DWORD *)long long buf = 134218240;
    id v27 = v18;
    __int16 v28 = 2048;
    id v29 = [v17 count];
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%p successfully downloaded %lu fonts", buf, 0x16u);
LABEL_4:
  }
LABEL_6:
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10004BD74;
  v23[3] = &unk_1000C88D0;
  id v24 = a1[6];
  BOOL v25 = v14 == v15;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);
}

id sub_10004BD34(id a1, FCResource *a2)
{
  id v2 = a2;
  if ([(FCResource *)v2 isOnDisk]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t sub_10004BD74(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_10004BD8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004C044(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[NSThread isMainThread];
  uint64_t v7 = [*(id *)(a1 + 32) resourcesLock];
  [v7 lock];

  id v8 = [*(id *)(a1 + 32) resourcesByID];
  [v8 addEntriesFromDictionary:v5];

  long long v9 = [*(id *)(a1 + 32) resourcesLock];
  [v9 unlock];

  id v10 = [v5 count];
  id v11 = [*(id *)(a1 + 32) requiredResourceIDs];
  id v12 = [v11 count];

  id v13 = (void *)FRArticleLog;
  if (v10 == v12)
  {
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = v13;
      int v20 = 134218240;
      uint64_t v21 = v14;
      __int16 v22 = 2048;
      id v23 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%p successfully loaded %lu asset URLs", (uint8_t *)&v20, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = v13;
    id v18 = [v5 count];
    long long v19 = [*(id *)(a1 + 32) requiredResourceIDs];
    int v20 = 134218754;
    uint64_t v21 = v16;
    __int16 v22 = 2048;
    id v23 = v18;
    __int16 v24 = 2048;
    id v25 = [v19 count];
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%p failed to load %lu of %lu fonts with error: %@", (uint8_t *)&v20, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10004C284(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004C298(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_10004C320;
  v1[3] = &unk_1000C6E28;
  id v2 = *(id *)(a1 + 32);
  sub_10004C320((uint64_t)v1);
}

uint64_t sub_10004C320(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004C5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10004C604(id a1, FCResource *a2)
{
  return [(FCResource *)a2 assetHandle];
}

void sub_10004C60C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) allValues];
  id v5 = [v4 fc_arrayByTransformingWithBlock:&stru_1000C8960];

  id v6 = [v5 count];
  id v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) count];
  id v8 = (void *)FRArticleLog;
  if (v6 != v7)
  {
    if (!os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v11 = a1[4];
    id v10 = v8;
    id v12 = [v5 count];
    id v13 = [*(id *)(*(void *)(a1[6] + 8) + 40) count];
    uint64_t v14 = [v3 error];
    int v15 = 134218754;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    id v18 = v12;
    __int16 v19 = 2048;
    id v20 = v13;
    __int16 v21 = 2112;
    __int16 v22 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%p failed to download %lu of %lu assets with error: %@", (uint8_t *)&v15, 0x2Au);

    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    id v10 = v8;
    int v15 = 134218240;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    id v18 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%p successfully downloaded %lu assets", (uint8_t *)&v15, 0x16u);
LABEL_4:
  }
LABEL_6:
  (*(void (**)(void))(a1[5] + 16))();
}

id sub_10004C820(id a1, FCResource *a2)
{
  id v2 = a2;
  if ([(FCResource *)v2 isOnDisk]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void sub_10004CA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10004CAA4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004CB34;
    block[3] = &unk_1000C6E28;
    id v3 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return 0;
}

uint64_t sub_10004CB34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004CB44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if ([v3 status])
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10004CDB4;
      v20[3] = &unk_1000C6E28;
      id v21 = *(id *)(a1 + 32);
      sub_10004CDB4((uint64_t)v20);
      id v7 = v21;
    }
    else
    {
      int v15 = v6;
      id v7 = +[NSMutableDictionary dictionary];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = [v3 fetchedObject];
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            uint64_t v14 = [v13 identifier];
            [v7 setObject:v13 forKey:v14];
          }
          id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v10);
      }

      id v6 = v15;
      [v15 setLinkedHeadlines:v7];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004CDA4;
    v22[3] = &unk_1000C6E28;
    id v23 = *(id *)(a1 + 32);
    sub_10004CDA4((uint64_t)v22);
    id v6 = v23;
  }
}

uint64_t sub_10004CDA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004CDB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004CF7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10004CF98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained resourcesByID];
    id v5 = [v4 objectForKey:*(void *)(a1 + 32)];

    id v6 = [v5 assetHandle];
    id v7 = [*(id *)(a1 + 40) relativePriority];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_10004D13C;
    v10[3] = &unk_1000C8A00;
    id v11 = v5;
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 48);
    id v8 = v5;
    id v9 = [v6 downloadIfNeededWithPriority:v7 completion:v10];
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004D128;
    v14[3] = &unk_1000C6E28;
    id v15 = *(id *)(a1 + 48);
    sub_10004D128((uint64_t)v14);
    id v8 = v15;
  }
}

uint64_t sub_10004D128(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004D13C(id *a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D1F4;
  block[3] = &unk_1000C8A00;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10004D1F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fileURL];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) fileURL];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

void sub_10004D968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  _Block_object_dispose((const void *)(v33 - 200), 8);
  _Block_object_dispose((const void *)(v33 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004D9C8(void *a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v2) {
    [v2 cancel];
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  uint64_t result = a1[4];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_10004DA3C(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if ((*(unsigned char *)(a1 + 80) & 2) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "preserveColorspace"), *(void *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      if (!v2) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    id v2 = objc_alloc_init((Class)SXImageResourceResponse);
    uint64_t v3 = [*(id *)(a1 + 32) thumbnailImage];
    if (!v3)
    {
      id v4 = [*(id *)(a1 + 32) thumbnailAssetHandle];

      if (!v4) {
        goto LABEL_9;
      }
      uint64_t v3 = [*(id *)(a1 + 32) thumbnailAssetHandle];
      id v5 = [v3 filePath];
      id v6 = +[UIImage imageWithContentsOfFile:v5];
      [*(id *)(a1 + 32) setThumbnailImage:v6];
    }
LABEL_9:
    id v7 = [*(id *)(a1 + 32) thumbnailImage];
    [v2 setImage:v7];

    [v2 setImageQuality:*(void *)(a1 + 80)];
    if (!v2)
    {
LABEL_11:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10004DC0C;
      v9[3] = &unk_1000C56D0;
      id v10 = *(id *)(a1 + 48);
      id v11 = v2;
      id v8 = v2;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

      goto LABEL_12;
    }
LABEL_10:
    [*(id *)(a1 + 56) addObject:v2];
    goto LABEL_11;
  }
LABEL_12:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void sub_10004DC0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) loadingBlock];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) loadingBlock];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

void sub_10004DC90(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 11);
  id v3 = a1[4];
  id v4 = a1[6];
  id v5 = a1[7];
  id v6 = a1[8];
  FCPerformIfNonNil();
}

void sub_10004DD78(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 88) && !*(unsigned char *)(a1 + 89))
  {
    id v5 = [v3 resourcesByID];
    id v6 = [v5 objectForKey:*(void *)(a1 + 32)];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v6 == 0;
    }
    if (v7)
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
    }
    else
    {
      id v8 = [v6 assetHandle];
      id v9 = [*(id *)(a1 + 40) relativePriority];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10004DF24;
      v18[3] = &unk_1000C8AC8;
      void v18[4] = v4;
      id v10 = v6;
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = *(void **)(a1 + 48);
      id v19 = v10;
      uint64_t v20 = v11;
      id v13 = v12;
      uint64_t v14 = *(void *)(a1 + 72);
      id v21 = v13;
      uint64_t v24 = v14;
      id v22 = *(id *)(a1 + 56);
      id v23 = *(id *)(a1 + 64);
      uint64_t v15 = [v8 downloadIfNeededWithPriority:v9 completion:v18];
      uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
      long long v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setRelativePriority:[*(id *)(a1 + 40) relativePriority]];
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  }
}

void sub_10004DF24(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) operationQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E008;
  v8[3] = &unk_1000C8AA0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 80);
  id v11 = v6;
  uint64_t v14 = v7;
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  [v2 addOperationWithBlock:v8];
}

void sub_10004E008(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (([v2 isOnDisk] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) fallbackResourceForImageRequest:*(void *)(a1 + 48) originalResource:*(void *)(a1 + 32)];

    id v2 = (id)v3;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v4 = [v2 fileURL];

    if (v4)
    {
      id v5 = *(void **)(a1 + 40);
      id v6 = [v2 fileURL];
      id v7 = [*(id *)(a1 + 48) preserveColorspace];
      [*(id *)(a1 + 48) size];
      id v8 = [v5 imageResourceResponseForFileURL:v6 perserveColorSpace:v7 withSize:4];

      if (v8) {
        [*(id *)(a1 + 56) addObject:v8];
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      void v10[2] = sub_10004E178;
      v10[3] = &unk_1000C56D0;
      id v11 = *(id *)(a1 + 48);
      id v12 = v8;
      id v9 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void sub_10004E178(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) loadingBlock];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) loadingBlock];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

uint64_t sub_10004E1FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

id sub_10004E5D8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

BOOL sub_10004E6E4(id a1, FCResource *a2)
{
  return [(FCResource *)a2 isOnDisk];
}

uint64_t sub_10004ED04(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresenting:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_10004EDCC(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_1000EE0C0 = [v1 BOOLForKey:@"change_without_restarting"];
}

void sub_10004EED4(id a1)
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v1 = [v3 stringForKey:@"animation_type"];
  id v2 = (void *)qword_1000EE0D0;
  qword_1000EE0D0 = v1;
}

void sub_10004EFCC(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_1000EE0E0 = [v1 BOOLForKey:@"override_duration"];
}

void sub_10004F0D8(id a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 floatForKey:@"animation_duration"];
  byte_1000EE0F0 = (float)(v1 / 10.0) != 0.0;
}

void sub_10004F1D4(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_1000EE100 = [v1 BOOLForKey:@"animation_old_timing_enabled"];
}

void sub_10004F2C0(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_1000EE110 = [v1 BOOLForKey:@"animation_prewarm_animation_disabled"];
}

void sub_10004F3AC(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_1000EE120 = [v1 BOOLForKey:@"animation_synchronously_load_headerimage"];
}

void sub_10004F498(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_1000EE130 = [v1 BOOLForKey:@"animation_alternative_feedscale_disabled"];
}

void sub_10004F78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004F7A4(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = objc_alloc_init(FRCardConfigurationCacheFontItem);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [v9 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

void sub_100050B60(id a1, UIAlertAction *a2)
{
  id v2 = a2;
  exit(0);
}

id sub_100050D7C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) showAppUnsupportedAlert];
}

id sub_100050D84(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _didResumeLowPriorityTasks];
}

void sub_100050F38(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) cloudContext];
  id v5 = [v4 appConfigurationManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050FFC;
  v7[3] = &unk_1000C8D58;
  id v8 = v3;
  id v6 = v3;
  [v5 fetchAppConfigurationIfNeededWithCompletion:v7];
}

uint64_t sub_100050FFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10005100C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) prewarmWithCompletion:a2];
}

id sub_100051384(uint64_t a1)
{
  [*(id *)(a1 + 32) _application:*(void *)(a1 + 40) openURL:*(void *)(a1 + 48) options:*(void *)(a1 + 56) animated:*(unsigned __int8 *)(a1 + 72)];
  id v2 = *(void **)(a1 + 64);

  return _[v2 removeFromSuperview];
}

void sub_100051684(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) urlRouterManager];
  [v2 handleOpenURL:*(void *)(a1 + 40) options:*(void *)(a1 + 48) analyticsReferral:*(void *)(a1 + 56)];
}

void sub_10005179C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cloudContext];
  id v1 = [v2 subscriptionController];
  [v1 refreshAndNotifyAboutSubscribedTags];
}

void sub_1000517F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), &state64);
    [WeakRetained setIsDeviceLocked:state64 != 0];
    id v3 = (void *)FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      unsigned int v5 = [WeakRetained isDeviceLocked];
      *(_DWORD *)long long buf = 67109120;
      unsigned int v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "lock state change, isDeviceLocked=%d", buf, 8u);
    }
  }
}

uint64_t sub_100051FB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100051FC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100051FDC(uint64_t a1, BOOL a2)
{
  uint64_t v4 = FRBackgroundFetchLog;
  if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "did run bridged backround fetch", v7, 2u);
  }
  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = +[NSNumber numberWithUnsignedInteger:FCFetchResultFromUIBackgroundFetchResult(a2)];
  [v5 addObject:v6];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100052094(uint64_t a1, BOOL a2)
{
  uint64_t v4 = FRBackgroundFetchLog;
  if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "did run legacy backround fetch", v7, 2u);
  }
  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = +[NSNumber numberWithUnsignedInteger:FCFetchResultFromUIBackgroundFetchResult(a2)];
  [v5 addObject:v6];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10005214C(uint64_t a1)
{
  id v2 = FRBackgroundFetchLog;
  if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "finished performing background fetch", v7, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t Results = FCAggregateFetchResultWithFetchResults();
  BOOL ResultFromFCFetchResult = UIBackgroundFetchResultFromFCFetchResult(Results);
  return (*(uint64_t (**)(uint64_t, BOOL))(v3 + 16))(v3, ResultFromFCFetchResult);
}

void sub_100052320(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) windowScene];
  if ([v3 activationState] == (id)2) {
    unsigned __int8 v2 = 1;
  }
  else {
    unsigned __int8 v2 = [*(id *)(a1 + 40) isDeviceLocked];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
}

NSArray *__cdecl sub_1000523E4(FRAppDelegate *self, SEL a2)
{
  return self->_bundleAssemblies;
}

NSArray *__cdecl sub_100052408(FRAppDelegate *self, SEL a2)
{
  return self->_assemblies;
}

void sub_100052A3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = FRPresubscribeServiceLog;
    if (os_log_type_enabled((os_log_t)FRPresubscribeServiceLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not presubscribing because we failed to fetch the app config", buf, 2u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
  else
  {
    id v9 = [v5 notificationsConfig];
    uint64_t v10 = [v9 preSubscribedNotificationsChannelIDs];
    id v11 = +[NSSet setWithArray:v10];

    id v12 = [v5 presubscribedFeedIDs];
    id v13 = [v12 mutableCopy];

    uint64_t v14 = FRPresubscribeServiceLog;
    if (os_log_type_enabled((os_log_t)FRPresubscribeServiceLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Presubscribing to app config feed IDs %{public}@", buf, 0xCu);
    }
    uint64_t v15 = [v5 topStoriesConfig];
    uint64_t v16 = [v15 channelID];

    long long v17 = [v5 topStoriesConfig];
    if ([v17 isPromotingEnabled] && objc_msgSend(v16, "length"))
    {
      unsigned __int8 v18 = [v13 containsObject:v16];

      if ((v18 & 1) == 0)
      {
        [v13 insertObject:v16 atIndex:0];
        id v19 = FRPresubscribeServiceLog;
        if (os_log_type_enabled((os_log_t)FRPresubscribeServiceLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v26 = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Presubscribing to TS, with ID %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
    }
    id v20 = [v13 count];
    id v21 = *(void **)(a1 + 32);
    if (v20)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100052D4C;
      v23[3] = &unk_1000C5988;
      void v23[4] = v21;
      id v24 = *(id *)(a1 + 40);
      [v21 _subscribeToFeedIDs:v13 preSubscribedNotificationsChannelIDs:v11 withCompletion:v23];
    }
    else
    {
      [*(id *)(a1 + 32) _setHasUserBeenPresubscribed:1];
      uint64_t v22 = *(void *)(a1 + 40);
      if (v22) {
        (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0);
      }
    }
  }
}

uint64_t sub_100052D4C(uint64_t a1)
{
  [*(id *)(a1 + 32) _setHasUserBeenPresubscribed:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_100052F18(uint64_t a1, void *a2)
{
  id v3 = [a2 nf_objectsForKeysWithoutMarker:*(void *)(a1 + 32)];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100052FD4;
  v10[3] = &unk_1000C8ED0;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v11 = v4;
  uint64_t v12 = v5;
  [v3 enumerateObjectsUsingBlock:v10];
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v6, v7, v8);
  }
}

void sub_100052FD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 identifier];
  id v6 = [v4 containsObject:v5];

  uint64_t v7 = [*(id *)(a1 + 40) subscriptionController];
  unsigned int v8 = [v7 hasSubscriptionToTag:v3];

  if (v8)
  {
    if (!v6) {
      goto LABEL_12;
    }
    uint64_t v9 = [*(id *)(a1 + 40) subscriptionController];
    [v9 setNotificationsEnabled:1 forTag:v3 error:0];
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 40) subscriptionController];
    [v10 addSubscriptionToTag:v3 notificationsEnabled:v6 error:0];

    if (!v6) {
      goto LABEL_12;
    }
  }
  id v11 = [*(id *)(a1 + 40) subscriptionController];
  unsigned __int8 v12 = [v11 hasNotificationsEnabledForTag:v3];

  id v13 = (void *)FRPresubscribeServiceLog;
  BOOL v14 = os_log_type_enabled((os_log_t)FRPresubscribeServiceLog, OS_LOG_TYPE_DEFAULT);
  if ((v12 & 1) == 0)
  {
    if (v14)
    {
      long long v17 = v13;
      unsigned __int8 v18 = [v3 identifier];
      int v19 = 138543362;
      id v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Enabling notifications for tagID: %{public}@ failed. We will retry.", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v15 = [*(id *)(a1 + 40) notificationManager];
    [v15 autoEnableNotificationsForPreSubscribedChannels];
    goto LABEL_11;
  }
  if (v14)
  {
    uint64_t v15 = v13;
    uint64_t v16 = [v3 identifier];
    int v19 = 138543362;
    id v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Successfully enabled notifications for tagID: %{public}@", (uint8_t *)&v19, 0xCu);

LABEL_11:
  }
LABEL_12:
}

void sub_100053670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

uint64_t sub_10005369C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, &__NSDictionary0__struct);
  }
  return result;
}

void sub_1000536BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    FCPerformBlockOnMainThread();
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_100053778(void *a1)
{
  unsigned __int8 v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v3 = (void *)a1[4];
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKey:v4];

  id v5 = a1[5];

  dispatch_group_leave(v5);
}

void sub_1000537E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void sub_1000539C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1000539E0(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  uint64_t v10 = v6;
  id v11 = a1[4];
  id v15 = a1[7];
  id v12 = a1[5];
  id v13 = v5;
  id v14 = a1[6];
  id v8 = v5;
  id v9 = v6;
  FCPerformIfNonNil();
}

void sub_100053B00(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    if (!*(void *)(a1 + 56))
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100053E68;
      v13[3] = &unk_1000C8F48;
      id v14 = *(id *)(a1 + 40);
      id v17 = *(id *)(a1 + 72);
      id v15 = v3;
      id v16 = *(id *)(a1 + 48);
      sub_100053E68((uint64_t)v13);

      id v4 = v14;
      goto LABEL_15;
    }
    id v4 = [*(id *)(a1 + 40) headline];
    id v5 = [v4 lastModifiedDate];
    id v6 = [*(id *)(a1 + 48) lastModifiedDate];
    if (*(void *)(a1 + 48))
    {
      if ([v5 compare:v6] != (id)1)
      {
        id v8 = FCDefaultLog;
        if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 64);
          *(_DWORD *)long long buf = 138543362;
          uint64_t v25 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ToC Editorial Manager: No update in editorial articleID: %{public}@", buf, 0xCu);
        }
        uint64_t v10 = *(void *)(a1 + 72);
        if (v10)
        {
          id v11 = [v3 editorialItemCreator];
          id v12 = [v11 createEditorialItemFromCachedEntry:*(void *)(a1 + 48)];
          (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
        }
        goto LABEL_14;
      }
      uint64_t v7 = *(void *)(a1 + 48);
    }
    else
    {
      uint64_t v7 = 0;
    }
    [v3 loadArticleMetadataWithHeadline:v4 editorialItemFromCache:v7 content:*(void *)(a1 + 56) articleModifiedDate:v5 completion:*(void *)(a1 + 72)];
LABEL_14:

    goto LABEL_15;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100053DD0;
  v18[3] = &unk_1000C7778;
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 32);
  id v23 = *(id *)(a1 + 72);
  id v21 = v3;
  id v22 = *(id *)(a1 + 48);
  sub_100053DD0((uint64_t)v18);

  id v4 = v19;
LABEL_15:
}

void sub_100053DD0(uint64_t a1)
{
  uint64_t v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_100077F88(a1, v2);
  }
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 48) editorialItemCreator];
    id v5 = [v4 createEditorialItemFromCachedEntry:*(void *)(a1 + 56)];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
  }
}

void sub_100053E68(uint64_t a1)
{
  uint64_t v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_10007804C(a1, v2);
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) editorialItemCreator];
    id v5 = [v4 createEditorialItemFromCachedEntry:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
  }
}

void sub_100054118(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, a1[4]);
  uint64_t v7 = [a1[4] articleController];
  id v23 = a1[5];
  id v8 = +[NSArray arrayWithObjects:&v23 count:1];
  uint64_t v9 = [v7 headlinesFetchOperationForArticleIDs:v8];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100054354;
  v13[3] = &unk_1000C9010;
  objc_copyWeak(&v21, &location);
  id v10 = v5;
  id v14 = v10;
  id v11 = v6;
  id v15 = v11;
  id v20 = a1[9];
  id v16 = a1[6];
  id v17 = a1[7];
  id v18 = a1[5];
  id v19 = a1[8];
  [v9 setFetchCompletionBlock:v13];
  id v12 = +[NSOperationQueue fc_sharedConcurrentQueue];
  [v12 addOperation:v9];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void sub_100054318(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100054354(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 11);
  id v6 = a1[4];
  id v7 = a1[5];
  id v13 = a1[10];
  id v8 = a1[6];
  id v9 = a1[7];
  id v10 = a1[8];
  id v11 = v3;
  id v12 = a1[9];
  id v5 = v3;
  FCPerformIfNonNil();
}

void sub_10005448C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v21 = v5;
    __int16 v22 = 2114;
    uint64_t v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ToC Editorial Manager: Load flint context finished with context: %@ error: %{public}@", buf, 0x16u);
  }
  if (*(void *)(a1 + 40))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000546AC;
    v17[3] = &unk_1000C79B8;
    id v7 = &v19;
    id v19 = *(id *)(a1 + 88);
    void v17[4] = v3;
    id v18 = *(id *)(a1 + 48);
    sub_1000546AC((uint64_t)v17);
  }
  else
  {
    id v8 = [v3 articleEditorialItemProvider];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = [*(id *)(a1 + 72) fetchedObject];
    id v13 = [v12 firstObject];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100054738;
    v15[3] = &unk_1000C8FC0;
    id v7 = &v16;
    uint64_t v14 = *(void *)(a1 + 80);
    id v16 = *(id *)(a1 + 88);
    [v8 createEditorialItemWithContext:v9 articleModifiedDate:v10 articleID:v11 headline:v13 flintDataProvider:v14 completion:v15];
  }
}

void sub_1000546AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 32) editorialItemCreator];
    id v3 = [v4 createEditorialItemFromCachedEntry:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
  }
}

uint64_t sub_100054738(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000548B8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [a2 fr_barButtonItemView];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 fc_safelyAddObject:v3];
}

id sub_100054910(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100054918(uint64_t a1)
{
  return [*(id *)(a1 + 32) favoritesPersonalizer];
}

id sub_100054920(uint64_t a1)
{
  return [*(id *)(a1 + 32) appActivityMonitor];
}

id sub_100054928(uint64_t a1)
{
  return [*(id *)(a1 + 32) spotlightManager];
}

FRPrefetchedArticlesService *sub_100054930(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 resolveClass:objc_opt_class()];

  uint64_t v5 = [[FRPrefetchedArticlesService alloc] initWithFeldsparContext:*(void *)(a1 + 32) assetManager:v4];

  return v5;
}

NSSNewsAnalyticsUserIDProvider *__cdecl sub_100054A0C(id a1, TFResolver *a2)
{
  uint64_t v2 = [(TFResolver *)a2 resolveProtocol:&OBJC_PROTOCOL___FCPrivateDataContext];
  id v3 = [FRUserInfoUserIDProvider alloc];
  id v4 = [v2 userInfo];
  uint64_t v5 = [(FRUserInfoUserIDProvider *)v3 initWithUserInfo:v4];

  return (NSSNewsAnalyticsUserIDProvider *)v5;
}

void sub_100054E08(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  uint64_t v5 = [v3 lowercaseString];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

id sub_100055C60(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UIBackgroundTaskInvalid;
  return result;
}

void sub_100055CAC(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100055D44;
  v5[3] = &unk_1000C9408;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 scheduleLocalNotificationForArticleID:@"A_BUpuB2ATxS__HCPKpoh4Q" completion:v5];
}

id sub_100055D44(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UIBackgroundTaskInvalid;
  return result;
}

void sub_100055DE4(id a1)
{
  id v1 = objc_alloc((Class)NSBundle);
  uint64_t v2 = FRURLForLocalInternalExtrasBundle();
  id v3 = [v2 path];
  id v4 = [v1 initWithPath:v3];
  uint64_t v5 = (void *)qword_1000EE148;
  qword_1000EE148 = (uint64_t)v4;

  if (!qword_1000EE148)
  {
    id v6 = objc_alloc((Class)NSBundle);
    FRURLForInternalExtrasBundle();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v10 path];
    id v8 = [v6 initWithPath:v7];
    uint64_t v9 = (void *)qword_1000EE148;
    qword_1000EE148 = (uint64_t)v8;
  }
}

void sub_100055F2C(id a1)
{
  uint64_t v23 = +[NSMutableDictionary dictionary];
  v33[0] = &off_1000CFC00;
  v33[1] = &off_1000CFC18;
  v34[0] = &off_1000CFB78;
  v34[1] = &off_1000CFB88;
  id v1 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  v31[0] = &off_1000CFC00;
  uint64_t v2 = +[NSNumber numberWithDouble:UIFontWeightBold];
  v31[1] = &off_1000CFC18;
  v32[0] = v2;
  id v3 = +[NSNumber numberWithDouble:UIFontWeightSemibold];
  v32[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];

  v29[0] = &off_1000CFC00;
  v29[1] = &off_1000CFC18;
  v30[0] = &__kCFBooleanTrue;
  v30[1] = &__kCFBooleanTrue;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [&off_1000CFA50 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(&off_1000CFA50);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        id v12 = [v11 BOOLValue];

        id v13 = [v4 objectForKeyedSubscript:v10];
        [v13 floatValue];
        double v15 = v14;

        id v16 = [v1 objectForKeyedSubscript:v10];
        [v16 floatValue];
        double v18 = v17;

        id v19 = +[UIFont fr_systemFontNameForWeight:v12 condensed:v15];
        id v20 = +[UIFont fr_fontWithName:v19 size:v18];
        [v23 setObject:v20 forKeyedSubscript:v10];
      }
      id v7 = [&off_1000CFA50 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
  id v21 = [v23 copy];
  __int16 v22 = (void *)qword_1000EE160;
  qword_1000EE160 = (uint64_t)v21;
}

void sub_100056298(uint64_t a1)
{
  uint64_t v2 = +[NSMutableDictionary dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = [&off_1000CFA68 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(&off_1000CFA68);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = [v7 integerValue];
        uint64_t v9 = +[NSMutableDictionary dictionary];
        uint64_t v10 = [*(id *)(a1 + 32) fr_fontForFeedHeaderType:v8];
        if (v10)
        {
          [v9 setObject:v10 forKeyedSubscript:NSFontAttributeName];
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v18 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "font"];
          *(_DWORD *)long long buf = 136315906;
          long long v26 = "+[NSString(FRFeedAdditions) fr_attributesLookup]_block_invoke";
          __int16 v27 = 2080;
          __int16 v28 = "UIFont+FRFeedAdditions.m";
          __int16 v29 = 1024;
          int v30 = 67;
          __int16 v31 = 2114;
          id v32 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        [*(id *)(a1 + 32) fr_trackingForFeedHeaderType:v8];
        if (vabdd_f64(0.0, v11) >= 0.00999999978)
        {
          id v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v9 setObject:v12 forKeyedSubscript:kCTTrackingAttributeName];
        }
        [*(id *)(a1 + 32) fr_leadingForFeedHeaderType:v8];
        if (v13 > 0.0)
        {
          double v14 = v13;
          id v15 = objc_alloc_init((Class)NSMutableParagraphStyle);
          [v15 setMinimumLineHeight:v14];
          [v15 setLineBreakMode:0];
          [v15 setAlignment:0];
          id v16 = [v15 copy];
          [v9 setObject:v16 forKeyedSubscript:NSParagraphStyleAttributeName];
        }
        id v17 = [v9 copy];
        [v2 setObject:v17 forKey:v7];
      }
      id v4 = [&off_1000CFA68 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v4);
  }
  id v19 = [v2 copy];
  id v20 = (void *)qword_1000EE170;
  qword_1000EE170 = (uint64_t)v19;
}

id sub_100056848(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchEmbedConfigurationWithCompletion:&stru_1000C94A8];
}

void sub_100056BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100056C30(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) loadedConfiguration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) operation];

  return _objc_release_x1();
}

id sub_100056C9C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setOperation:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_100056CAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [WeakRetained loadedConfiguration];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_100056E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100056E64(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) loadedConfiguration];
  uint64_t v2 = [v5 embedForType:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_100056F64(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100057088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000570A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v3) {
      id v5 = [[FRFlintEmbedConfiguration alloc] initWithData:v3];
    }
    else {
      id v5 = 0;
    }
    id v6 = [WeakRetained lock];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100057194;
    v8[3] = &unk_1000C56D0;
    void v8[4] = WeakRetained;
    uint64_t v9 = v5;
    id v7 = v5;
    [v6 performWithLockSync:v8];
  }
}

void sub_100057194(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + _Block_object_dispose(&STACK[0x230], 8) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 4_Block_object_dispose(&STACK[0x230], 8) = 0;
}

void sub_1000574A8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled(FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = a1[6];
    *(_DWORD *)long long buf = 138543618;
    id v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "update coordinator will trigger sync, target=%{public}@, instance=%lu", buf, 0x16u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100057618;
  v12[3] = &unk_1000C9570;
  uint64_t v9 = a1[6];
  uint64_t v10 = (void *)a1[5];
  id v13 = (id)a1[4];
  uint64_t v16 = v9;
  id v14 = v10;
  id v15 = v3;
  id v11 = v3;
  [v13 syncWithCompletion:v12];
}

uint64_t sub_100057618(uint64_t a1)
{
  uint64_t v2 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled(FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 56);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "update coordinator did finish sync, target=%{public}@, instance=%lu", (uint8_t *)&v8, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100057ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100057F0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  unsigned __int16 v6 = (unsigned __int16)[a3 unsignedIntegerValue];
  if ((v6 & 0x2CDF) != 0)
  {
    id v7 = FRTodayAgentLog;
    if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "History feature of interest changed for %@", (uint8_t *)&v10, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if ((v6 & 0x2C46) != 0) {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 17;
    }
  }
  if ((v6 & 0x99) != 0)
  {
    unsigned int v8 = [*(id *)(a1 + 32) hasArticleBeenSeen:v5];
    uint64_t v9 = 48;
    if (v8) {
      uint64_t v9 = 40;
    }
    [*(id *)(a1 + v9) addObject:v5];
  }
}

void sub_10005833C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100058354(uint64_t a1)
{
  uint64_t v2 = +[UIApplication sharedApplication];
  [v2 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = UIBackgroundTaskInvalid;
}

id sub_1000583B4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UIBackgroundTaskInvalid;
  return result;
}

uint64_t sub_100058608(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100058618(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) privateDataContext];
  id v3 = [*(id *)(a1 + 32) seenArticlesTransactions];
  id v4 = +[FCFileCoordinatedTodayDropboxTransaction collapsedTransactionOfTransactions:v3];

  id v5 = [v4 todayPrivateDataAccessor];
  unsigned __int16 v6 = [*(id *)(a1 + 32) seenArticlesTransactions];
  [v6 removeAllObjects];

  id v7 = +[FCFileCoordinatedTodayDropboxTransaction transactionOfIdentity];
  if (v7)
  {
    unsigned int v8 = [*(id *)(a1 + 32) seenArticlesTransactions];
    [v8 addObject:v7];
  }
  if (!*(void *)(a1 + 48))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_38;
  }
  dispatch_time_t v66 = v7;
  uint64_t v9 = dispatch_group_create();
  int v10 = objc_opt_new();
  uint64_t v11 = *(void *)(a1 + 48);
  if ((v11 & 2) != 0)
  {
    uint64_t v12 = [v2 readingHistory];
    id v13 = [v12 mostRecentlyReadArticlesWithMaxCount:200];
    id v14 = [v13 copy];

    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_100058FA4;
    v95[3] = &unk_1000C9678;
    id v96 = v14;
    id v97 = v5;
    id v15 = v14;
    uint64_t v16 = objc_retainBlock(v95);
    [v10 addObject:v16];

    uint64_t v11 = *(void *)(a1 + 48);
  }
  long long v67 = v2;
  if ((v11 & 4) != 0)
  {
    id v17 = FRTodayAgentLog;
    if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Preparing to update subscriptions", buf, 2u);
    }
    id v18 = [*(id *)(a1 + 32) subscriptionController:v5 v4];
    __int16 v19 = [v18 mutedTagIDs];
    uint64_t v20 = +[NSSet setWithArray:v19];

    uint64_t v21 = [v18 autoFavoriteTagIDs];
    long long v22 = (void *)v21;
    long long v23 = &__NSArray0__struct;
    if (v21) {
      long long v23 = (void *)v21;
    }
    id v24 = v23;

    long long v25 = [v18 groupableTagIDs];
    long long v26 = +[NSSet setWithArray:v25];

    __int16 v27 = [v18 allSubscribedTagIDs];
    __int16 v28 = +[NSArray arrayWithArray:v27];

    dispatch_group_enter(v9);
    uint64_t v29 = FCDispatchQueueForQualityOfService();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059030;
    block[3] = &unk_1000C96F0;
    void block[4] = *(void *)(a1 + 32);
    id v87 = v28;
    id v88 = v18;
    id v89 = v10;
    id v90 = v20;
    id v91 = v24;
    id v92 = v26;
    v93 = v9;
    id v30 = v26;
    id v31 = v24;
    id v32 = v20;
    id v33 = v18;
    id v34 = v28;
    dispatch_async(v29, block);

    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v2 = v67;
    id v5 = v64;
    id v4 = v65;
  }
  if ((v11 & 0x24) != 0)
  {
    id v35 = FRTodayAgentLog;
    if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Preparing to update local news", buf, 2u);
    }
    dispatch_group_enter(v9);
    long long v36 = [*(id *)(a1 + 32) localNewsChannelService];
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_100059400;
    v83[3] = &unk_1000C9740;
    id v84 = v10;
    uint64_t v85 = v9;
    [v36 fetchWidgetLocalNewsChannelIDWithCompletion:v83];

    uint64_t v11 = *(void *)(a1 + 48);
  }
  if ((v11 & 8) != 0)
  {
    id v37 = FRTodayAgentLog;
    if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Preparing to update user info", buf, 2u);
    }
    id v38 = [v2 userInfo];
    id v39 = [v38 onboardingVersionNumber];
    id v40 = [v39 copy];

    id v41 = NewsCoreUserDefaults();
    [v41 setObject:v40 forKey:FCWidgetOnboardingVersionSharedPreferenceKey];

    uint64_t v11 = *(void *)(a1 + 48);
    if ((v11 & 0x10) == 0)
    {
LABEL_18:
      if ((v11 & 0x20) == 0) {
        goto LABEL_19;
      }
LABEL_28:
      long long v52 = FRTodayAgentLog;
      if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Preparing to update personalization data", buf, 2u);
      }
      dispatch_group_enter(v9);
      long long v53 = [*(id *)(a1 + 32) personalizationDataGenerator];
      uint64_t v54 = *(void *)(a1 + 56);
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_100059580;
      v77[3] = &unk_1000C9790;
      id v78 = v10;
      v79 = v9;
      [v53 generateDerivedDataWithMaxAggregateCount:2000 qualityOfService:v54 completion:v77];

      if ((*(void *)(a1 + 48) & 0x40) == 0) {
        goto LABEL_34;
      }
      goto LABEL_31;
    }
  }
  else if ((v11 & 0x10) == 0)
  {
    goto LABEL_18;
  }
  id v42 = FRTodayAgentLog;
  if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Preparing to update purchase", buf, 2u);
  }
  id v43 = [*(id *)(a1 + 32) purchaseController];
  id v44 = [v43 allPurchasedTagIDs];
  id v45 = [v44 copy];

  id v46 = [*(id *)(a1 + 32) bundleSubscriptionManager];
  id v47 = [v46 cachedSubscription];
  id v48 = [v47 copy];

  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  void v80[2] = sub_100059524;
  v80[3] = &unk_1000C9768;
  id v81 = v45;
  id v82 = v48;
  id v49 = v48;
  id v50 = v45;
  long long v51 = objc_retainBlock(v80);
  [v10 addObject:v51];

  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v2 = v67;
  if ((v11 & 0x20) != 0) {
    goto LABEL_28;
  }
LABEL_19:
  if ((v11 & 0x40) != 0)
  {
LABEL_31:
    CGRect v55 = FRTodayAgentLog;
    if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Preparing to update user embedding data", buf, 2u);
    }
    dispatch_group_enter(v9);
    id v56 = [*(id *)(a1 + 32) userEmbeddingGenerator];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10005968C;
    v74[3] = &unk_1000C97B8;
    id v75 = v10;
    v76 = v9;
    [v56 generateUserEmbeddingIfNeededWithCompletion:v74];
  }
LABEL_34:
  if (FCDispatchGroupIsEmpty())
  {
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_100059794;
    v71[3] = &unk_1000C8598;
    CGRect v57 = &v72;
    id v58 = *(void **)(a1 + 40);
    v71[4] = *(void *)(a1 + 32);
    uint64_t v72 = v10;
    dispatch_time_t v59 = &v73;
    id v73 = v58;
    id v60 = v10;
    sub_100059794((uint64_t)v71);
  }
  else
  {
    __int16 v61 = FCDispatchQueueForQualityOfService();
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100059A50;
    v68[3] = &unk_1000C8598;
    CGRect v57 = &v69;
    id v62 = *(void **)(a1 + 40);
    v68[4] = *(void *)(a1 + 32);
    v69 = v10;
    dispatch_time_t v59 = &v70;
    id v70 = v62;
    id v63 = v10;
    dispatch_group_notify(v9, v61, v68);
  }
  id v7 = v66;
LABEL_38:
}

void sub_100058FA4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 fc_dictionaryWithKeyBlock:&stru_1000C9650];
  [v5 setRecentlyReadHistoryItems:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

NSString *__cdecl sub_100059028(id a1, FCTodayReadHistoryItem *a2)
{
  return (NSString *)[(FCTodayReadHistoryItem *)a2 articleID];
}

void sub_100059030(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) feedPersonalizer];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005914C;
  v4[3] = &unk_1000C96F0;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 80);
  id v11 = *(id *)(a1 + 88);
  [v2 prepareForUseWithCompletionHandler:v4];
}

void sub_10005914C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) feedPersonalizer];
  id v3 = [v2 rankTagIDsDescending:*(void *)(a1 + 40)];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005932C;
  v17[3] = &unk_1000C96A0;
  id v18 = *(id *)(a1 + 48);
  id v4 = [v3 fc_arrayByTransformingWithBlock:v17];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100059380;
  v11[3] = &unk_1000C96C8;
  id v5 = *(void **)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  id v6 = v3;
  id v14 = v6;
  id v7 = v4;
  id v15 = v7;
  id v16 = *(id *)(a1 + 80);
  id v8 = objc_retainBlock(v11);
  [v5 addObject:v8];

  id v9 = FRTodayAgentLog;
  if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updated subscriptions", v10, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

id sub_10005932C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) subscriptionForTagID:a2];
  id v3 = [v2 dateAdded];

  return v3;
}

void sub_100059380(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setMutedTagIDs:v3];
  [v4 setAutoFavoriteTagIDs:a1[5]];
  [v4 setRankedAllSubscribedTagIDs:a1[6]];
  [v4 setRankedAllSubscriptionDates:a1[7]];
  [v4 setGroupableTagIDs:a1[8]];
}

void sub_100059400(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = *(void **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_100059518;
    v11[3] = &unk_1000C9718;
    id v12 = v5;
    id v8 = objc_retainBlock(v11);
    [v7 addObject:v8];
  }
  id v9 = FRTodayAgentLog;
  if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updated local news", v10, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id sub_100059518(uint64_t a1, void *a2)
{
  return _[a2 setLocalNewsTagID:*(void *)(a1 + 32)];
}

void sub_100059524(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setPurchasedTagIDs:v3];
  [v4 setBundleSubscription:*(void *)(a1 + 40)];
}

void sub_100059580(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  id v4 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100059680;
  v9[3] = &unk_1000C9718;
  id v5 = v3;
  id v10 = v5;
  id v6 = objc_retainBlock(v9);
  [v4 addObject:v6];

  id v7 = FRTodayAgentLog;
  if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updated personalization data", v8, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id sub_100059680(uint64_t a1, void *a2)
{
  return _[a2 setDerivedPersonalizationData:*(void *)(a1 + 32)];
}

void sub_10005968C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100059788;
  v9[3] = &unk_1000C9718;
  id v5 = v3;
  id v10 = v5;
  id v6 = objc_retainBlock(v9);
  [v4 addObject:v6];

  id v7 = FRTodayAgentLog;
  if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updated user embedding data", v8, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id sub_100059788(uint64_t a1, void *a2)
{
  return _[a2 setUserEmbeddingData:*(void *)(a1 + 32)];
}

void sub_100059794(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fileCoordinatedTodayDropbox];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100059944;
  v11[3] = &unk_1000C9718;
  id v12 = *(id *)(a1 + 40);
  unsigned int v3 = [v2 depositSyncWithAccessor:v11];

  id v4 = FRTodayAgentLog;
  if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    unsigned int v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished updating today data with result %d", buf, 8u);
  }
  if (v3)
  {
    id v5 = objc_alloc((Class)CHSTimelineController);
    id v6 = [v5 initForAvocadoIdentifier:NSSNewsTodayWidgetKind inBundleIdentifier:NSSNewsTodayWidgetBundleID];
    id v7 = [v6 reloadTimeline];

    id v8 = objc_alloc((Class)CHSTimelineController);
    id v9 = [v8 initForAvocadoIdentifier:NSSNewsTagWidgetKind inBundleIdentifier:NSSNewsTagWidgetBundleID];
    id v10 = [v9 reloadTimeline];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100059944(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [*(id *)(a1 + 32) readOnlyArray];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) + 16))();
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void sub_100059A50(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fileCoordinatedTodayDropbox];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100059C00;
  v11[3] = &unk_1000C9718;
  id v12 = *(id *)(a1 + 40);
  unsigned int v3 = [v2 depositSyncWithAccessor:v11];

  id v4 = FRTodayAgentLog;
  if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    unsigned int v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished updating today data with result %d", buf, 8u);
  }
  if (v3)
  {
    id v5 = objc_alloc((Class)CHSTimelineController);
    id v6 = [v5 initForAvocadoIdentifier:NSSNewsTodayWidgetKind inBundleIdentifier:NSSNewsTodayWidgetBundleID];
    id v7 = [v6 reloadTimeline];

    id v8 = objc_alloc((Class)CHSTimelineController);
    id v9 = [v8 initForAvocadoIdentifier:NSSNewsTagWidgetKind inBundleIdentifier:NSSNewsTagWidgetBundleID];
    id v10 = [v9 reloadTimeline];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100059C00(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [*(id *)(a1 + 32) readOnlyArray];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) + 16))();
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

double FRCenterOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.CGFloat x = a1;
  v10.origin.double y = a2;
  v10.size.CGFloat width = a3;
  v10.size.CGFloat height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double FRRectWithSize()
{
  return 0.0;
}

double FRRectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

BOOL sub_10005A16C(id a1, int64_t a2)
{
  return _FCAccountQueueIsDestructiveActionType(a2);
}

BOOL sub_10005A174(id a1, int64_t a2)
{
  return 1;
}

uint64_t sub_10005A17C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 integerValue];
  id v4 = *(uint64_t (**)(uint64_t, id))(v2 + 16);

  return v4(v2, v3);
}

void sub_10005A964(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v3 = v4;
  FCPerformBlockOnMainThread();
}

void sub_10005AA00(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_10005AB48;
    v11[3] = &unk_1000C56D0;
    id v3 = v2;
    uint64_t v4 = *(void *)(a1 + 40);
    id v12 = v3;
    uint64_t v13 = v4;
    sub_10005AB48((uint64_t)v11);
    id v5 = v12;
  }
  else
  {
    id v6 = FCOperationLog;
    if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FROnboardingDataManager: userOnboardingCompletionHandler completed with %ld", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    long long v9 = [*(id *)(a1 + 40) delegate];
    id v5 = v9;
    if (v8) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 0;
    }
    [v9 dataManager:*(void *)(a1 + 40) userType:v10];
  }
}

void sub_10005AB48(uint64_t a1)
{
  uint64_t v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_100079504(a1, v2);
  }
  id v3 = [*(id *)(a1 + 40) delegate];
  [v3 dataManager:*(void *)(a1 + 40) error:0];
}

void sub_10005AC70(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataManagerFeedPrepared:*(void *)(a1 + 32)];
}

id NNSetupCompanionSyncLog()
{
  if (qword_1000EE190 != -1) {
    dispatch_once(&qword_1000EE190, &stru_1000C9960);
  }
  uint64_t v0 = (void *)qword_1000EE188;

  return v0;
}

void sub_10005AE30(id a1)
{
  qword_1000EE188 = (uint64_t)os_log_create("com.apple.nanonews", "CompanionSync");

  _objc_release_x1();
}

void sub_10005B188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10005B1AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 56) _referenceCountForFontWithFileURL:*(void *)(a1 + 32)];
  if (v2)
  {
    id v3 = v2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    id v6 = FRArticleLog;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v27 = v7;
      __int16 v28 = 2048;
      id v29 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found previous registration for font at URL %{public}@ with reference count %lu", buf, 0x16u);
    }
  }
  else
  {
    CFURLRef v8 = *(const __CFURL **)(a1 + 32);
    CFErrorRef error = 0;
    long long v9 = FRArticleLog;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to register font at URL %{public}@", buf, 0xCu);
    }
    if (CTFontManagerRegisterFontsForURL(v8, kCTFontManagerScopeProcess, &error))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v11 = FRArticleLog;
      if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Font registration succeeded for font at URL %{public}@", buf, 0xCu);
      }
    }
    else
    {
      CFIndex Code = CFErrorGetCode(error);
      CFIndex v14 = Code;
      char v15 = 1;
      switch(Code)
      {
        case 'e':
          uint64_t v16 = 0;
          goto LABEL_16;
        case 'f':
          uint64_t v16 = 1;
          goto LABEL_16;
        case 'g':
          uint64_t v16 = 2;
          goto LABEL_16;
        case 'h':
          uint64_t v16 = 3;
LABEL_16:
          uint64_t v17 = +[NSError errorWithDomain:@"FRFontRegistationErrorDomain" code:v16 userInfo:0];
          uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
          __int16 v19 = *(void **)(v18 + 40);
          *(void *)(v18 + 40) = v17;

          char v15 = 0;
          goto LABEL_17;
        case 'i':
          goto LABEL_17;
        default:
          if (Code != 305) {
            goto LABEL_18;
          }
LABEL_17:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v15;
LABEL_18:
          uint64_t v20 = (void *)FRArticleLog;
          if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = *(void *)(a1 + 32);
            long long v22 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            long long v23 = v20;
            id v24 = +[NSNumber numberWithLong:v14];
            *(_DWORD *)long long buf = 138543874;
            uint64_t v27 = v21;
            __int16 v28 = 2114;
            id v29 = v22;
            __int16 v30 = 2114;
            id v31 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to register font at URL %{public}@ with error: %{public}@ underlying error code: %{public}@", buf, 0x20u);
          }
          break;
      }
    }
    if (error) {
      CFRelease(error);
    }
  }
  if (*(void *)(a1 + 64)) {
    **(void **)(a1 + 64) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 56) _increaseReferenceCountForFontWithFileURL:*(void *)(a1 + 32)];
  }
}

id sub_10005B618(uint64_t a1)
{
  return _[*(id *)(a1 + 40) _decreaseReferenceCountForFontWithFileURL:*(void *)(a1 + 32)];
}

void sub_10005BD24(id a1)
{
  qword_1000EE1A0 = (uint64_t)objc_alloc_init((Class)NSCountedSet);

  _objc_release_x1();
}

void sub_10005BDB4(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFF8000, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.news.font.registration", v3);
  id v2 = (void *)qword_1000EE1B0;
  qword_1000EE1B0 = (uint64_t)v1;
}

void sub_10005C1C8(id a1)
{
  qword_1000EE1B8 = objc_alloc_init(FRCardConfiguration);

  _objc_release_x1();
}

void sub_10005D544(id a1)
{
  id v1 = +[UIColor colorWithRed:0.941176471 green:0.945098039 blue:0.952941176 alpha:1.0];
  v5[0] = [v1 CGColor];
  id v2 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
  v5[1] = [v2 CGColor];
  uint64_t v3 = +[NSArray arrayWithObjects:v5 count:2];
  uint64_t v4 = (void *)qword_1000EE1C8;
  qword_1000EE1C8 = v3;
}

void FROpenInNewsAlert(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Content Unavailable" value:&stru_1000CABC0 table:0];
  uint64_t v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"This content is not available in Apple News." value:&stru_1000CABC0 table:0];
  id v9 = +[UIAlertController alertControllerWithTitle:v3 message:v5 preferredStyle:1];

  id v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"OK" value:&stru_1000CABC0 table:0];
  CFURLRef v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:0];
  [v9 addAction:v8];

  [v1 presentViewController:v9 animated:1 completion:0];
}

double *FR_HSL_TO_RGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a5 == 0.0)
  {
    if (result) {
      *id result = a6;
    }
    if (a2) {
      *a2 = a6;
    }
    if (!a3) {
      return result;
    }
LABEL_27:
    *a3 = a6;
    return result;
  }
  uint64_t v6 = 0;
  double v7 = a5 + a6 - a6 * a5;
  double v8 = (a5 + 1.0) * a6;
  if (a6 >= 0.5) {
    double v8 = v7;
  }
  double v9 = -(v8 - a6 * 2.0);
  double v12 = a4 + 0.333333333;
  double v13 = a4;
  double v14 = a4 + -0.333333333;
  do
  {
    double v10 = *(double *)((char *)&v12 + v6);
    if (v10 < 0.0) {
      double v10 = v10 + 1.0;
    }
    if (v10 > 1.0) {
      double v10 = v10 + -1.0;
    }
    if (v10 * 6.0 >= 1.0)
    {
      double v11 = v8;
      if (v10 + v10 >= 1.0)
      {
        double v11 = v9;
        if (v10 * 3.0 < 2.0) {
          double v11 = v9 + (v8 - v9) * (0.666666667 - v10) * 6.0;
        }
      }
    }
    else
    {
      double v11 = v9 + (v8 - v9) * 6.0 * v10;
    }
    *(double *)((char *)&v12 + v6) = v11;
    v6 += 8;
  }
  while (v6 != 24);
  if (result) {
    *id result = v12;
  }
  if (a2) {
    *a2 = v13;
  }
  if (a3)
  {
    a6 = v14;
    goto LABEL_27;
  }
  return result;
}

double *FR_RGB_TO_HSL(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 >= a5) {
    double v6 = a4;
  }
  else {
    double v6 = a5;
  }
  if (a4 >= a5) {
    double v7 = a5;
  }
  else {
    double v7 = a4;
  }
  if (v6 >= a6) {
    double v8 = v6;
  }
  else {
    double v8 = a6;
  }
  if (v7 >= a6) {
    double v7 = a6;
  }
  double v9 = v7 + v8;
  double v10 = (v7 + v8) * 0.5;
  if (v10 <= 0.0)
  {
    if (result) {
      *id result = 0.0;
    }
    if (a2) {
      *a2 = 0.0;
    }
  }
  else
  {
    double v11 = v8 - v7;
    if (v8 - v7 <= 0.0)
    {
      if (result) {
        *id result = 0.0;
      }
      if (a2) {
        *a2 = v11;
      }
    }
    else
    {
      if (v10 > 0.5) {
        double v9 = 2.0 - v8 - v7;
      }
      double v12 = v11 / v9;
      double v13 = (v8 - a4) / v11;
      double v14 = (v8 - a5) / v11;
      double v15 = (v8 - a6) / v11;
      double v16 = v15 + 5.0;
      if (v7 != a5) {
        double v16 = 1.0 - v14;
      }
      double v17 = v14 + 3.0;
      if (v7 != a4) {
        double v17 = 5.0 - v13;
      }
      double v18 = v13 + 1.0;
      double v19 = 3.0 - v15;
      if (v7 == a6) {
        double v20 = v18;
      }
      else {
        double v20 = v19;
      }
      if (v8 == a5) {
        double v21 = v20;
      }
      else {
        double v21 = v17;
      }
      if (v8 == a4) {
        double v22 = v16;
      }
      else {
        double v22 = v21;
      }
      if (result) {
        *id result = v22 / 6.0;
      }
      if (a2) {
        *a2 = v12;
      }
    }
  }
  if (a3) {
    *a3 = v10;
  }
  return result;
}

void sub_10005E978(id a1)
{
  id v3 = objc_alloc_init((Class)UIView);
  uint64_t v1 = [v3 tintColor];
  id v2 = (void *)qword_1000EE1D8;
  qword_1000EE1D8 = v1;
}

void sub_10005EA30(id a1)
{
  id v3 = +[UIColor systemPinkColor];
  uint64_t v1 = [v3 colorWithAlphaComponent:0.5];
  id v2 = (void *)qword_1000EE1E8;
  qword_1000EE1E8 = v1;
}

void sub_10005EAE4(id a1)
{
  qword_1000EE1F8 = +[UIColor colorWithRed:0.960784314 green:0.62745098 blue:0.0901960784 alpha:1.0];

  _objc_release_x1();
}

void sub_10005EB94(id a1)
{
  qword_1000EE208 = +[UIColor colorWithRed:0.941176471 green:0.588235294 blue:0.196078431 alpha:1.0];

  _objc_release_x1();
}

void sub_10005EC44(id a1)
{
  qword_1000EE218 = +[UIColor colorWithRed:0.360784314 green:0.752941176 blue:0.549019608 alpha:1.0];

  _objc_release_x1();
}

void sub_10005ECF4(id a1)
{
  qword_1000EE228 = +[UIColor colorWithRed:1.0 green:0.556862745 blue:0.0 alpha:1.0];

  _objc_release_x1();
}

void sub_10005EDE0(id a1)
{
  qword_1000EE238 = +[UIColor colorWithWhite:0.0 alpha:0.82];

  _objc_release_x1();
}

void sub_10005EEA0(id a1)
{
  qword_1000EE248 = +[UIColor colorWithWhite:1.0 alpha:0.82];

  _objc_release_x1();
}

void sub_10005EF80(id a1)
{
  id v4 = +[UIColor whiteColor];
  uint64_t v1 = +[UIColor blackColor];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE258;
  qword_1000EE258 = v2;
}

void sub_10005F008(id a1)
{
  id v4 = +[UIColor colorWithWhite:1.0 alpha:0.82];
  uint64_t v1 = +[UIColor colorWithWhite:0.0 alpha:0.82];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE268;
  qword_1000EE268 = v2;
}

void sub_10005F14C(id a1)
{
  id v4 = +[UIColor colorWithWhite:0.917647059 alpha:1.0];
  uint64_t v1 = +[UIColor colorWithWhite:0.250980392 alpha:1.0];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE278;
  qword_1000EE278 = v2;
}

void sub_10005F258(id a1)
{
  id v4 = +[UIColor colorWithWhite:0.9 alpha:1.0];
  uint64_t v1 = +[UIColor colorWithWhite:0.1 alpha:1.0];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE288;
  qword_1000EE288 = v2;
}

void sub_10005F3A0(id a1)
{
  id v4 = +[UIColor whiteColor];
  uint64_t v1 = +[UIColor blackColor];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE298;
  qword_1000EE298 = v2;
}

void sub_10005F47C(id a1)
{
  id v4 = +[UIColor colorWithWhite:0.88627451 alpha:1.0];
  uint64_t v1 = +[UIColor colorWithWhite:0.11372549 alpha:1.0];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE2A8;
  qword_1000EE2A8 = v2;
}

void sub_10005F570(id a1)
{
  id v4 = +[UIColor colorWithWhite:0.58 alpha:1.0];
  uint64_t v1 = +[UIColor colorWithWhite:0.42 alpha:1.0];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE2B8;
  qword_1000EE2B8 = v2;
}

void sub_10005F664(id a1)
{
  id v4 = +[UIColor colorWithRed:0.937254902 green:0.937254902 blue:0.956862745 alpha:1.0];
  uint64_t v1 = +[UIColor colorWithRed:0.062745098 green:0.062745098 blue:0.0431372549 alpha:1.0];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE2C8;
  qword_1000EE2C8 = v2;
}

void sub_10005F770(id a1)
{
  id v4 = +[UIColor blackColor];
  uint64_t v1 = +[UIColor systemGrayColor];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE2D8;
  qword_1000EE2D8 = v2;
}

void sub_10005F858(id a1)
{
  qword_1000EE2E8 = +[UIColor colorWithRed:0.960784314 green:0.62745098 blue:0.0901960784 alpha:1.0];

  _objc_release_x1();
}

void sub_10005F908(id a1)
{
  id v4 = +[UIColor colorWithWhite:0.92 alpha:1.0];
  uint64_t v1 = +[UIColor colorWithWhite:0.08 alpha:1.0];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE2F8;
  qword_1000EE2F8 = v2;
}

void sub_10005FA08(id a1)
{
  id v4 = +[UIColor colorWithRed:0.235294118 green:0.235294118 blue:0.262745098 alpha:0.3];
  uint64_t v1 = +[UIColor colorWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.19];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE308;
  qword_1000EE308 = v2;
}

void sub_10005FB1C(id a1)
{
  qword_1000EE318 = +[UIColor colorWithWhite:0.156862745 alpha:1.0];

  _objc_release_x1();
}

void sub_10005FBBC(id a1)
{
  qword_1000EE328 = +[UIColor colorWithWhite:0.843137255 alpha:1.0];

  _objc_release_x1();
}

void sub_10005FCB0(id a1)
{
  qword_1000EE338 = +[UIColor colorWithWhite:0.301960784 alpha:1.0];

  _objc_release_x1();
}

void sub_10005FD50(id a1)
{
  qword_1000EE348 = +[UIColor colorWithWhite:0.698039216 alpha:1.0];

  _objc_release_x1();
}

void sub_10005FEB0(id a1)
{
  id v4 = +[UIColor colorWithWhite:0.58 alpha:1.0];
  uint64_t v1 = +[UIColor colorWithWhite:0.42 alpha:1.0];
  uint64_t v2 = +[UIColor fr_dynamicColor:v4 withDarkStyleVariant:v1];
  id v3 = (void *)qword_1000EE358;
  qword_1000EE358 = v2;
}

id sub_1000600D4(uint64_t a1, void *a2)
{
  id v3 = [a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == (id)2) {
    uint64_t v4 = 32;
  }
  id v5 = *(void **)(a1 + v4);

  return v5;
}

id sub_1000604B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v3 CGColor]);
  if (CGColorSpaceGetModel(ColorSpace))
  {
    id v5 = v3;
  }
  else
  {
    double v6 = CGColorGetComponents((CGColorRef)[v3 CGColor]);
    components[0] = *v6;
    components[1] = components[0];
    _OWORD components[2] = components[0];
    components[3] = v6[1];
    double v7 = CGColorCreate(*(CGColorSpaceRef *)(a1 + 32), components);
    id v5 = +[UIColor colorWithCGColor:v7];
    CGColorRelease(v7);
  }

  return v5;
}

id sub_100060774(uint64_t a1, void *a2)
{
  id v3 = a2;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v3 CGColor]);
  if (CGColorSpaceGetModel(ColorSpace))
  {
    id v5 = v3;
  }
  else
  {
    double v6 = CGColorGetComponents((CGColorRef)[v3 CGColor]);
    components[0] = *v6;
    components[1] = components[0];
    _OWORD components[2] = components[0];
    components[3] = v6[1];
    double v7 = CGColorCreate(*(CGColorSpaceRef *)(a1 + 32), components);
    id v5 = +[UIColor colorWithCGColor:v7];
    CGColorRelease(v7);
  }

  return v5;
}

void sub_100060B74(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v8 = *(void **)(a1 + 32);
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = +[NSNumber numberWithDouble:a3];
  double v10 = +[NSNumber numberWithDouble:a4];
  double v11 = +[NSNumber numberWithDouble:a5];
  [v8 appendFormat:@"R : %@ G : %@ B : %@ A : %@", v12, v9, v10, v11];
}

void sub_100060C4C(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v8 = *(void **)(a1 + 32);
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = +[NSNumber numberWithDouble:a3];
  double v10 = +[NSNumber numberWithDouble:a4];
  double v11 = +[NSNumber numberWithDouble:a5];
  [v8 appendFormat:@"H : %@ S : %@ B : %@ A : %@", v12, v9, v10, v11];
}

void sub_100060D6C(id a1, double a2, double a3, double a4, double a5)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = +[NSNumber numberWithDouble:a2];
    double v10 = +[NSNumber numberWithDouble:a3];
    double v11 = +[NSNumber numberWithDouble:a4];
    id v12 = +[NSNumber numberWithDouble:a5];
    int v13 = 138413058;
    double v14 = v9;
    __int16 v15 = 2112;
    double v16 = v10;
    __int16 v17 = 2112;
    double v18 = v11;
    __int16 v19 = 2112;
    double v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "R : %@ G : %@ B : %@ A : %@", (uint8_t *)&v13, 0x2Au);
  }
}

void sub_100060EB0(id a1, double a2, double a3, double a4, double a5)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = +[NSNumber numberWithDouble:a2];
    double v10 = +[NSNumber numberWithDouble:a3];
    double v11 = +[NSNumber numberWithDouble:a4];
    id v12 = +[NSNumber numberWithDouble:a5];
    int v13 = 138413058;
    double v14 = v9;
    __int16 v15 = 2112;
    double v16 = v10;
    __int16 v17 = 2112;
    double v18 = v11;
    __int16 v19 = 2112;
    double v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "H : %@ S : %@ B : %@ A : %@", (uint8_t *)&v13, 0x2Au);
  }
}

void sub_1000610A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000610B8(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_100061174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006118C(uint64_t result, double a2, double a3)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return result;
}

void sub_100061248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100061260(uint64_t result, double a2, double a3, double a4)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4;
  return result;
}

void sub_10006131C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100061334(uint64_t result, double a2, double a3, double a4, double a5)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a5;
  return result;
}

void sub_1000613F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100061408(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_1000614C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000614DC(uint64_t result, double a2, double a3)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return result;
}

void sub_100061598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000615B0(uint64_t result, double a2, double a3, double a4)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4;
  return result;
}

void sub_100061B68(id a1)
{
  qword_1000EE368 = +[UIColor colorWithRed:0.360784314 green:0.752941176 blue:0.549019608 alpha:1.0];

  _objc_release_x1();
}

void sub_100061C24(id a1)
{
  qword_1000EE378 = +[UIColor colorWithRed:0.941176471 green:0.588235294 blue:0.196078431 alpha:1.0];

  _objc_release_x1();
}

void sub_100061DC4(id a1)
{
  qword_1000EE388 = +[UIColor colorWithRed:1.0 green:0.11372549 blue:0.282352941 alpha:1.0];

  _objc_release_x1();
}

void sub_100061E70(id a1)
{
  qword_1000EE398 = +[UIColor colorWithRed:0.43 green:0.43 blue:0.45 alpha:1.0];

  _objc_release_x1();
}

TSLocalDraftsDeviceManagerType *__cdecl sub_100061F9C(id a1, TFResolver *a2)
{
  id v2 = objc_alloc_init((Class)TSLocalDraftsDeviceManager);

  return (TSLocalDraftsDeviceManagerType *)v2;
}

void sub_100062290(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) generator];
  id v3 = [v2 generateDerivedData];

  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v32 = a1;
    double v6 = [v4 allAggregates];
    double v7 = [v6 allValues];
    id v8 = [v7 mutableCopy];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v10)
    {
      id v11 = v10;
      id v12 = 0;
      int v13 = 0;
      uint64_t v14 = *(void *)v37;
      unint64_t v15 = -1;
      unint64_t v16 = -1;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v9);
          }
          double v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v19 = [v18 timestamp];
          if ((unint64_t)v19 < v16) {
            unint64_t v16 = (unint64_t)v19;
          }
          double v20 = (char *)[v18 timestamp];
          if (v20 > v13) {
            int v13 = v20;
          }
          id v21 = [v18 eventCount];
          if ((unint64_t)v21 < v15) {
            unint64_t v15 = (unint64_t)v21;
          }
          double v22 = (char *)[v18 eventCount];
          if (v22 > v12) {
            id v12 = v22;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v11);
    }
    else
    {
      id v12 = 0;
      int v13 = 0;
      unint64_t v15 = -1;
      unint64_t v16 = -1;
    }

    id v31 = [*(id *)(v32 + 32) configurationManager];
    long long v23 = [v31 configuration];
    [v23 derivedPersonalizationDataBalanceValue];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100062644;
    v35[3] = &unk_1000C9ED8;
    v35[4] = &v13[-v16];
    v35[5] = v16;
    v35[6] = &v12[-v15];
    v35[7] = v15;
    v35[8] = v24;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    void v33[2] = sub_1000626E8;
    v33[3] = &unk_1000C9F00;
    id v34 = objc_retainBlock(v35);
    long long v25 = v34;
    [v9 sortUsingComparator:v33];
    long long v26 = [v9 fc_safeSubarrayWithCountFromBack:*(void *)(v32 + 48)];
    uint64_t v27 = [v26 fc_dictionaryWithKeyBlock:&stru_1000C9F40];
    id v28 = objc_alloc((Class)FCDerivedPersonalizationData);
    id v29 = [v5 scoringType];
    [v5 decayRate];
    id v30 = [v28 initWithAggregates:v27 scoringType:v29];
    (*(void (**)(void))(*(void *)(v32 + 40) + 16))();
  }
  else
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100062630;
    v40[3] = &unk_1000C6E28;
    id v41 = *(id *)(a1 + 40);
    sub_100062630((uint64_t)v40);
    id v9 = v41;
  }
}

uint64_t sub_100062630(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

double sub_100062644(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  double v5 = 1.0;
  double v6 = 1.0;
  if (*(void *)(a1 + 32)) {
    double v6 = (double)((unint64_t)[v3 timestamp] - *(void *)(a1 + 40))
  }
       / (double)*(unint64_t *)(a1 + 32);
  if (*(void *)(a1 + 48)) {
    double v5 = (double)((unint64_t)[v4 eventCount] - *(void *)(a1 + 56))
  }
       / (double)*(unint64_t *)(a1 + 48);
  double v7 = v5 * (1.0 - *(double *)(a1 + 64)) + v6 * *(double *)(a1 + 64);

  return v7;
}

uint64_t sub_1000626E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [v5 featureKey];
  unsigned __int8 v8 = [v7 isEqualToString:@"f0"];

  if (v8)
  {
    uint64_t v9 = 1;
  }
  else
  {
    id v10 = [v6 featureKey];
    unsigned __int8 v11 = [v10 isEqualToString:@"f0"];

    if (v11)
    {
      uint64_t v9 = -1;
    }
    else
    {
      double v12 = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
      double v13 = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
      if (v12 < v13) {
        uint64_t v9 = -1;
      }
      else {
        uint64_t v9 = v12 > v13;
      }
    }
  }

  return v9;
}

NSString *__cdecl sub_1000627D8(id a1, NTPBPersonalizationAggregate *a2)
{
  return (NSString *)[(NTPBPersonalizationAggregate *)a2 featureKey];
}

void sub_1000628CC(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  id v3 = [*(id *)(a1 + 32) rootPath];
  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  NSURLResourceKey v29 = NSURLContentModificationDateKey;
  id v5 = +[NSArray arrayWithObjects:&v29 count:1];
  id v6 = [v2 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v5 options:0 error:0];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      unsigned __int8 v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v11);
        id v23 = 0;
        [v12 getResourceValue:&v23 forKey:NSURLContentModificationDateKey error:0];
        id v13 = v23;
        uint64_t v14 = +[NSDate date];
        [v14 timeIntervalSinceDate:v13];
        double v16 = v15;

        if (v16 > *(double *)(a1 + 40))
        {
          __int16 v17 = +[NSFileManager defaultManager];
          id v22 = 0;
          [v17 removeItemAtURL:v12 error:&v22];
          id v18 = v22;

          if (v18)
          {
            id v19 = FCDefaultLog;
            if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
              sub_10007A1AC(&buf, v21, v19);
            }
          }
        }
        unsigned __int8 v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
}

void sub_100062D18(uint64_t a1)
{
  CFTypeRef cf = 0;
  values = *(void **)(a1 + 56);
  CFAllocatorRef Default = CFAllocatorGetDefault();
  CFArrayRef v3 = CFArrayCreate(Default, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  CFStringRef v16 = @"FRImageScaleKey";
  [*(id *)(a1 + 40) scale];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  __int16 v17 = v4;
  +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  uint64_t v5 = CPBitmapWriteImagesToPath();
  if (v3) {
    CFRelease(v3);
  }
  if (!v5)
  {
    id v6 = (void *)FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_10007A1EC((__CFError **)&cf, v6);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  CGImageRelease(*(CGImageRef *)(a1 + 56));
  double Current = CFAbsoluteTimeGetCurrent();
  id v8 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = Current - *(double *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)uint8_t buf = 138412546;
    uint64_t v13 = v10;
    __int16 v14 = 2048;
    double v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cached image %@ to disk in %f ms", buf, 0x16u);
  }
}

uint64_t sub_100062ED4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100063420(uint64_t a1, void *a2)
{
  CFArrayRef v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 bundleIDMapping];
  id v6 = [v5 jsonEncodableObject];
  [v4 fc_safelySetObjectAllowingNil:v6 forKey:@"bundle-id-mapping-data"];

  id v8 = [*(id *)(a1 + 32) urlMapping];
  id v7 = [v8 jsonEncodableObject];
  [v4 fc_safelySetObjectAllowingNil:v7 forKey:@"url-mapping-data"];
}

void sub_100063690(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  CFArrayRef v3 = FRURLForNewsAppCachesDirectory();
  [v2 fc_quicklyClearDirectory:v3];

  id v4 = FCURLForContainerizedUserAccountCachesDirectory();
  id v7 = [v4 URLByAppendingPathComponent:@"com.apple.news" isDirectory:1];

  [*(id *)(a1 + 32) fc_quicklyClearDirectory:v7 callbackQueue:0 completion:0];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = FCURLForSharedTabiResources();
  [v5 fc_quicklyClearDirectory:v6];
}

void sub_100063764(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  FRURLForNewsAppDocumentsDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 fc_removeContentsOfDirectoryAtURL:v2];
}

void sub_100064714(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dictionary];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void sub_100064D8C(id a1)
{
  qword_1000EE3A8 = +[NSSet setWithArray:&off_1000CFB28];

  _objc_release_x1();
}

void sub_10006574C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  FCPerformBlockOnMainThread();
}

void sub_1000657E8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100065870;
  v2[3] = &unk_1000C6E28;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 executeOnce:v2];
}

uint64_t sub_100065870(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100065884(uint64_t a1)
{
  +[NSThread isMainThread];
  [*(id *)(a1 + 32) cancel];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _OWORD v3[2] = sub_100065924;
  v3[3] = &unk_1000C6E28;
  id v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  [v2 executeOnce:v3];
}

uint64_t sub_100065924(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

int64_t sub_100065AE0(id a1, FRArticlePrefetchOperation *a2, FRArticlePrefetchOperation *a3)
{
  return [(FRArticlePrefetchOperation *)a2 compareExecutionOrder:a3];
}

void sub_1000661F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000662AC;
  v6[3] = &unk_1000CA088;
  void v6[4] = v4;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _doWorkIfNotCancelled:v6];
}

id sub_1000662AC(uint64_t a1)
{
  switch((unint64_t)[*(id *)(a1 + 32) component])
  {
    case 0uLL:
      id v2 = (void *)FRArticlePrefetchLog;
      if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
      {
        id v3 = *(void **)(a1 + 32);
        id v4 = v2;
        id v5 = [v3 headline];
        id v6 = [v5 articleID];
        *(_DWORD *)uint8_t buf = 138543362;
        long long v38 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "will start prefetching JSON for article ID %{public}@", buf, 0xCu);
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100066770;
      v35[3] = &unk_1000C5988;
      id v7 = *(void **)(a1 + 40);
      v35[4] = *(void *)(a1 + 32);
      id v36 = *(id *)(a1 + 48);
      id v8 = [v7 loadJSONWithCompletionBlock:v35];
      double v9 = v36;
      goto LABEL_17;
    case 1uLL:
      uint64_t v10 = (void *)FRArticlePrefetchLog;
      if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v11 = *(void **)(a1 + 32);
        double v12 = v10;
        uint64_t v13 = [v11 headline];
        __int16 v14 = [v13 articleID];
        *(_DWORD *)uint8_t buf = 138543362;
        long long v38 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "will start prefetching fonts for article ID %{public}@", buf, 0xCu);
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      void v33[2] = sub_100066860;
      v33[3] = &unk_1000C5988;
      double v15 = *(void **)(a1 + 40);
      void v33[4] = *(void *)(a1 + 32);
      id v34 = *(id *)(a1 + 48);
      id v8 = [v15 loadFontsWithCompletionBlock:v33];
      double v9 = v34;
      goto LABEL_17;
    case 2uLL:
      CFStringRef v16 = (void *)FRArticlePrefetchLog;
      if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = *(void **)(a1 + 32);
        id v18 = v16;
        id v19 = [v17 headline];
        double v20 = [v19 articleID];
        *(_DWORD *)uint8_t buf = 138543362;
        long long v38 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "will start prefetching asset URLs for article ID %{public}@", buf, 0xCu);
      }
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      void v31[2] = sub_100066950;
      v31[3] = &unk_1000C5988;
      id v21 = *(void **)(a1 + 40);
      void v31[4] = *(void *)(a1 + 32);
      id v32 = *(id *)(a1 + 48);
      id v8 = [v21 loadAssetURLsWithCompletionBlock:v31];
      double v9 = v32;
      goto LABEL_17;
    case 3uLL:
      id v22 = (void *)FRArticlePrefetchLog;
      if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
      {
        id v23 = *(void **)(a1 + 32);
        long long v24 = v22;
        long long v25 = [v23 headline];
        long long v26 = [v25 articleID];
        *(_DWORD *)uint8_t buf = 138543362;
        long long v38 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "will start prefetching assets for article ID %{public}@", buf, 0xCu);
      }
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      void v29[2] = sub_100066A40;
      v29[3] = &unk_1000C5988;
      long long v27 = *(void **)(a1 + 40);
      void v29[4] = *(void *)(a1 + 32);
      id v30 = *(id *)(a1 + 48);
      id v8 = [v27 loadAssetsWithCompletionBlock:v29];
      double v9 = v30;
LABEL_17:

      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10007AF90();
      }
      id v8 = 0;
      break;
  }

  return v8;
}

uint64_t sub_100066770(uint64_t a1)
{
  id v2 = (void *)FRArticlePrefetchLog;
  if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 headline];
    id v6 = [v5 articleID];
    int v8 = 138543362;
    double v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "did finish prefetching JSON for article ID %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100066860(uint64_t a1)
{
  id v2 = (void *)FRArticlePrefetchLog;
  if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 headline];
    id v6 = [v5 articleID];
    int v8 = 138543362;
    double v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "did finish prefetching fonts for article ID %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100066950(uint64_t a1)
{
  id v2 = (void *)FRArticlePrefetchLog;
  if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 headline];
    id v6 = [v5 articleID];
    int v8 = 138543362;
    double v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "did finish prefetching asset URLs for article ID %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100066A40(uint64_t a1)
{
  id v2 = (void *)FRArticlePrefetchLog;
  if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 headline];
    id v6 = [v5 articleID];
    int v8 = 138543362;
    double v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "did finish prefetching assets for article ID %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100066C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100066CE0;
  v6[3] = &unk_1000CA088;
  void v6[4] = v4;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _doWorkIfNotCancelled:v6];
}

id sub_100066CE0(id *a1)
{
  if ([a1[4] component] == (id)4)
  {
    id v2 = (void *)FRArticlePrefetchLog;
    if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
    {
      id v3 = a1[4];
      id v4 = v2;
      id v5 = [v3 headline];
      id v6 = [v5 articleID];
      *(_DWORD *)uint8_t buf = 138543362;
      __int16 v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "will start prefetching web excerpt for article ID %{public}@", buf, 0xCu);
    }
    id v7 = [a1[5] webContent];
    id v8 = [v7 excerptAssetHandle];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_100066EA8;
    v11[3] = &unk_1000C5988;
    void v11[4] = a1[4];
    id v12 = a1[6];
    double v9 = [v8 downloadIfNeededWithCompletionQueue:&_dispatch_main_q completion:v11];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007B04C();
    }
    double v9 = 0;
  }

  return v9;
}

uint64_t sub_100066EA8(uint64_t a1)
{
  id v2 = (void *)FRArticlePrefetchLog;
  if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 headline];
    id v6 = [v5 articleID];
    int v8 = 138543362;
    double v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "did finish prefetching web excerpt for article ID %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100067260(id a1)
{
  id v4 = +[NSFileManager defaultManager];
  uint64_t v1 = [v4 containerURLForSecurityApplicationGroupIdentifier:NSSSecurityApplicationGroupIdentifier];
  uint64_t v2 = [v1 URLByAppendingPathComponent:@"Spotlight" isDirectory:1];
  id v3 = (void *)qword_1000EE3C8;
  qword_1000EE3C8 = v2;
}

id sub_1000672EC(uint64_t a1)
{
  uint64_t v2 = +[CSSearchableIndex defaultSearchableIndex];
  id v3 = [v2 indexDelegate];

  if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007B108();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[CSSearchableIndex defaultSearchableIndex];
  [v5 setIndexDelegate:v4];

  return [*(id *)(a1 + 32) createSpotlightDirectoryIfNeeded];
}

void sub_1000676FC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[CSSearchableIndex defaultSearchableIndex];
  [v1 _indexTags:v2 searchableIndex:v3];
}

void sub_10006780C(uint64_t a1)
{
  [*(id *)(a1 + 32) fc_arrayByTransformingWithBlock:&stru_1000CA118];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[CSSearchableIndex defaultSearchableIndex];
  [v1 deleteSearchableItemsWithIdentifiers:v2 completionHandler:&stru_1000CA138];
}

NSString *__cdecl sub_100067884(id a1, FCTagProviding *a2)
{
  return (NSString *)[(FCTagProviding *)a2 identifier];
}

void sub_10006788C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_10007B604();
  }
}

void sub_100067928(id a1)
{
  id v1 = +[CSSearchableIndex defaultSearchableIndex];
  [v1 deleteAllSearchableItemsWithCompletionHandler:&stru_1000CA178];
}

void sub_100067978(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_10007B638();
  }
}

void sub_100067AD0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) allObjects];
    [v2 addSubscriptionsWithTags:v3];
  }
  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) allObjects];
    [v4 removeSubscriptionsWithTags:v5];
  }
  if ([*(id *)(a1 + 56) count])
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 56) allObjects];
    [v6 addSubscriptionsWithTags:v7];
  }
}

void sub_100067E0C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[CSSearchableIndex defaultSearchableIndex];
  [v1 _indexArticleIDs:v2 searchableIndex:v3 acknowledgementHandler:0];
}

id sub_100067F28(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeArticlesWithIDs:*(void *)(a1 + 40)];
}

void sub_100067F80(id a1)
{
  id v1 = +[CSSearchableIndex defaultSearchableIndex];
  v3[0] = NSSSpotlightArticleDomainIdentifier;
  v3[1] = NSSSpotlightFeedDomainIdentifier;
  uint64_t v2 = +[NSArray arrayWithObjects:v3 count:2];
  [v1 deleteSearchableItemsWithDomainIdentifiers:v2 completionHandler:&stru_1000CA1B8];
}

void sub_100068038(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2 && os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_10007B66C();
  }
}

void sub_1000682DC(uint64_t a1)
{
  uint64_t v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEBUG)) {
    sub_10007B6A0(a1, v2);
  }
  id v3 = +[CSSearchableIndex defaultSearchableIndex];
  [v3 deleteSearchableItemsWithIdentifiers:*(void *)(a1 + 32) completionHandler:&stru_1000CA1D8];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [*(id *)(a1 + 32) copy];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 40) _removeThumbnailForArticleID:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void sub_100068424(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2 && os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_10007B604();
  }
}

void sub_1000685EC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    void v5[2] = sub_1000686A8;
    v5[3] = &unk_1000CA200;
    uint64_t v2 = *(void **)(a1 + 32);
    void v5[4] = *(void *)(a1 + 40);
    id v3 = [v2 fc_arrayByTransformingWithBlock:v5];
    id v4 = +[CSSearchableIndex defaultSearchableIndex];
    [v4 indexSearchableItems:v3 completionHandler:&stru_1000CA220];
  }
}

id sub_1000686A8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _itemForTag:a2];
}

void sub_1000686B4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2 && os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_10007B71C();
  }
}

void sub_10006887C(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[FRMacros deviceScreenScaleFromPotentialBackgroundThread];
  double v5 = v4;
  +[FRMacros minScreenSide];
  double v7 = v5 * v6;
  int v8 = [v3 fetchedObject];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10006899C;
  v11[3] = &unk_1000CA248;
  *(double *)&void v11[5] = v7;
  *(double *)&v11[6] = v7;
  void v11[4] = *(void *)(a1 + 32);
  long long v9 = [v8 fc_arrayByTransformingWithBlock:v11];
  if ([v9 count]) {
    [v9 enumerateObjectsUsingBlock:&stru_1000CA288];
  }
  [*(id *)(a1 + 40) indexSearchableItems:v9 completionHandler:&stru_1000CA2A8];
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

id sub_10006899C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isDeleted])
  {
    id v4 = 0;
  }
  else
  {
    double v5 = +[UIScreen mainScreen];
    [v5 scale];
    double v6 = FCThumbnailForHeadlineMinimumSize();

    double v7 = [v6 thumbnailAssetHandle];
    int v8 = [v7 filePath];

    long long v25 = v8;
    if ([v8 length]
      && [*(id *)(a1 + 32) _copyThumbnail:v6 forHeadline:v3])
    {
      long long v9 = [*(id *)(a1 + 32) _thumbnailURLForHeadline:v3];
    }
    else
    {
      long long v9 = 0;
    }
    id v10 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithItemContentType:kUTTypeText];
    long long v11 = [v3 title];
    [v10 setTitle:v11];

    long long v12 = [v3 shortExcerpt];
    [v10 setContentDescription:v12];

    uint64_t v13 = [v3 shortExcerpt];
    [v10 setTextContent:v13];

    [v10 setThumbnailURL:v9];
    __int16 v14 = [v3 publishDate];
    [v10 setContentCreationDate:v14];

    double v15 = [v3 sourceName];
    [v10 setNamedLocation:v15];

    [v10 setLanguages:&off_1000CFB40];
    CFStringRef v16 = FCBundle();
    __int16 v17 = [v16 localizedStringForKey:@"news" value:&stru_1000CABC0 table:0];
    id v18 = FCBundle();
    id v19 = [v18 localizedStringForKey:@"article" value:&stru_1000CABC0 table:0];
    double v20 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v17, v19, 0);
    [v10 setKeywords:v20];

    id v21 = objc_alloc((Class)CSSearchableItem);
    id v22 = [v3 articleID];
    id v4 = [v21 initWithUniqueIdentifier:v22 domainIdentifier:NSSSpotlightArticleDomainIdentifier attributeSet:v10];

    id v23 = [*(id *)(a1 + 32) associator];
    [v23 associateAppEntityFromHeadline:v3 with:v4];
  }

  return v4;
}

void sub_100068C94(id a1, CSSearchableItem *a2, unint64_t a3, BOOL *a4)
{
  double v5 = (void *)FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    double v7 = [(CSSearchableItem *)a2 debugDescription];
    int v8 = 138412290;
    long long v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Submitting item to CoreSpotlight %@", (uint8_t *)&v8, 0xCu);
  }
}

void sub_100068D58(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2 && os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_10007B71C();
  }
}

void sub_1000690C0(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  FCPerformBlockOnMainThread();
}

void sub_100069160(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) subscriptionController];
  id v3 = [v2 cachedSubscribedTags];

  [*(id *)(a1 + 32) _indexTags:v3 searchableIndex:*(void *)(a1 + 40)];
  id v4 = +[NSMutableSet set];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100069384;
  v23[3] = &unk_1000CA2F8;
  void v23[4] = *(void *)(a1 + 32);
  id v24 = v4;
  id v5 = v4;
  double v6 = objc_retainBlock(v23);
  double v7 = [*(id *)(a1 + 32) readingHistory];
  int v8 = [v7 sortedVisitedArticleIDs];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100069414;
  v21[3] = &unk_1000CA320;
  void v21[4] = *(void *)(a1 + 32);
  long long v9 = v6;
  id v22 = v9;
  [v8 enumerateObjectsUsingBlock:v21];

  id v10 = [*(id *)(a1 + 32) readingList];
  long long v11 = [v10 allSortedArticleIDsInReadingList];
  double v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  __int16 v17 = sub_1000694AC;
  id v18 = &unk_1000CA320;
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = v9;
  long long v12 = v9;
  [v11 enumerateObjectsUsingBlock:&v15];

  uint64_t v13 = *(void **)(a1 + 32);
  __int16 v14 = [v5 allObjects:v15, v16, v17, v18, v19];
  [v13 _indexArticleIDs:v14 searchableIndex:*(void *)(a1 + 40) acknowledgementHandler:*(void *)(a1 + 48)];
}

uint64_t sub_100069384(uint64_t a1, void *a2, unsigned char *a3, uint64_t a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) _shouldIndexArticleWithDate:a4])
  {
    if ([*(id *)(a1 + 32) _shouldIndexArticleID:v8]) {
      [*(id *)(a1 + 40) addObject:v8];
    }
  }
  else
  {
    *a3 = 1;
  }

  return _objc_release_x1();
}

void sub_100069414(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 readingHistory];
  id v6 = [v5 lastVisitedDateForArticleID:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000694AC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 readingList];
  id v6 = [v5 dateArticleWasAdded:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100069624(id *a1)
{
  id v2 = a1[4];
  id v3 = a1[6];
  id v4 = a1[7];
  FCPerformBlockOnMainThread();
}

void sub_1000696D4(uint64_t a1)
{
  id v2 = +[NSMutableArray array];
  id v3 = +[NSMutableArray array];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000697C8;
  v8[3] = &unk_1000C81D8;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v2;
  id v6 = v2;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v8];
  [*(id *)(a1 + 40) _indexTags:v6 searchableIndex:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) _indexArticleIDs:v7 searchableIndex:*(void *)(a1 + 48) acknowledgementHandler:*(void *)(a1 + 56)];
}

void sub_1000697C8(id *a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(v5, "fc_isValidArticleID"))
  {
    [a1[4] addObject:v5];
  }
  else if (objc_msgSend(v5, "fc_isValidTagID"))
  {
    id v3 = [a1[5] subscriptionController];
    uint64_t v4 = [v3 subscribedTagForTagID:v5];

    if (v4) {
      [a1[6] addObject:v4];
    }
  }
}

void sub_100069928(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  id v3 = [(id)objc_opt_class() _spotlightFolder];
  uint64_t v4 = [v3 path];
  id v29 = 0;
  id v5 = [v2 contentsOfDirectoryAtPath:v4 error:&v29];
  id v6 = v29;
  id v7 = v6;
  if (v5)
  {
    id v20 = v6;
    id v21 = v4;
    uint64_t v22 = a1;
    id v23 = v3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v19 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v25 objects:v36 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v12);
          id v24 = 0;
          unsigned __int8 v14 = [v2 removeItemAtPath:v13 error:&v24];
          id v15 = v24;
          if ((v14 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            id v16 = [v15 code];
            __int16 v17 = [v15 description];
            *(_DWORD *)uint8_t buf = 138412802;
            uint64_t v31 = v13;
            __int16 v32 = 2048;
            id v33 = v16;
            __int16 v34 = 2112;
            id v35 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't delete file at path %@ - %ld - %@", buf, 0x20u);
          }
          long long v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v25 objects:v36 count:16];
      }
      while (v10);
    }

    a1 = v22;
    id v3 = v23;
    id v7 = v20;
    uint64_t v4 = v21;
    id v5 = v19;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007B750(v7);
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

uint64_t sub_10006A148()
{
  return v0;
}

void sub_10006A240(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = +[NSFileManager defaultManager];
    NSFileAttributeKey v11 = NSFileModificationDate;
    id v7 = +[NSDate date];
    long long v12 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = [*(id *)(a1 + 32) path];
    [v6 setAttributes:v8 ofItemAtPath:v9 error:0];
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

void sub_10006A5C4(uint64_t a1)
{
}

void sub_10006A5CC(uint64_t a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:1 forKey:@"FRAppCacheSnapshotterShouldRestoreOldCacheSnapshotDefaultsKey"];
  [v2 synchronize];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10006A63C(id a1)
{
}

void sub_10006A908(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v13 = 0;
  unsigned __int8 v5 = [v2 copyItemAtURL:v3 toURL:v4 error:&v13];
  id v6 = v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006A9F0;
  v9[3] = &unk_1000CA4F8;
  id v7 = *(id *)(a1 + 48);
  unsigned __int8 v12 = v5;
  id v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

uint64_t sub_10006A9F0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void sub_10006B140(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v4 = [v8 editorialItemID];
  unsigned int v5 = [v4 fc_isValidArticleID];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 editorialItemID];
    [v6 addObject:v7];
  }
}

id FRURLForInternalExtrasBundle()
{
  uint64_t v0 = FCURLForAppleInternalLibraryBundlesDirectory();
  id v1 = [v0 URLByAppendingPathComponent:@"NewsInternalExtras"];
  id v2 = [v1 URLByAppendingPathExtension:@"bundle"];

  return v2;
}

id FRURLForLocalInternalExtrasBundle()
{
  uint64_t v0 = +[NSBundle mainBundle];
  id v1 = [v0 pathForResource:@"NewsInternalExtras" ofType:@"bundle"];
  if (v1)
  {
    id v2 = +[NSURL fileURLWithPath:v1 isDirectory:0];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_10006B560(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 feedNavigationConfigJSON];
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007C264();
  }
  id v7 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Editorial Manager: AppConfiguration fetched with feed navigation config=%@ error=%@", (uint8_t *)&v8, 0x16u);
  }
  if (v6) {
    [*(id *)(a1 + 32) processConfigurationWithJSON:v6 completion:*(void *)(a1 + 40)];
  }
}

uint64_t sub_10006BB20(uint64_t a1)
{
  id v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_10007C344(a1, v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *, void))(result + 16))(result, &__NSArray0__struct, *(void *)(a1 + 32));
  }
  return result;
}

void sub_10006BD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10006BD68(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, &__NSDictionary0__struct);
  }
  return result;
}

void sub_10006BD88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v5 = v3;
  FCPerformIfNonNil();
}

void sub_10006BE4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  id v5 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006BF20;
  v8[3] = &unk_1000CA858;
  void v8[4] = v3;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
}

void sub_10006BF20(uint64_t a1, uint64_t a2, void *a3)
{
  id v25 = a3;
  uint64_t v4 = [v25 identifier];
  id v5 = [*(id *)(a1 + 32) editorialItemEntryManager];
  id v6 = [v5 editorialItemsByID];
  uint64_t v7 = [v25 identifier];
  int v8 = [v6 objectForKey:v7];

  id v9 = [v25 identifier];
  __int16 v10 = +[NSString stringWithFormat:@"https://apple.news/%@", v9];

  id v11 = +[NSMutableArray array];
  if (v8)
  {
    if (![v8 showBadge]) {
      goto LABEL_6;
    }
    unsigned __int8 v12 = +[NSNumber numberWithInteger:0];
    [v11 addObject:v12];
  }
  else
  {
    id v13 = +[NSNumber numberWithInteger:0];
    [v11 addObject:v13];

    unsigned __int8 v14 = [FREditorialItemEntry alloc];
    id v15 = [v25 identifier];
    id v16 = [v25 name];
    __int16 v17 = [v25 subtitle];
    LOBYTE(v24) = 1;
    unsigned __int8 v12 = [(FREditorialItemEntry *)v14 initWithEditorialItemID:v15 title:v16 subtitle:v17 subtitleColorString:0 image:0 actionUrlString:v10 lastModifiedDate:0 documentVersion:0 lastSeenDocumentVersion:0 showBadge:v24];

    uint64_t v18 = [*(id *)(a1 + 32) editorialItemEntryManager];
    [v18 addEditorialItem:v12];
  }
LABEL_6:
  id v19 = objc_alloc((Class)TSEditorialItem);
  id v20 = [v25 name];
  id v21 = [v25 subtitle];
  uint64_t v22 = +[NSURL URLWithString:v10];
  id v23 = [v19 initWithIdentifier:v4 title:v20 subtitle:v21 subtitleColor:0 attributes:v11 actionURL:v22 thumbnailImage:0 backingTag:v25 headline:0];

  [*(id *)(a1 + 40) setObject:v23 forKey:v4];
}

id sub_10006CF10(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

void sub_10006CF1C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 setValue:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48)];

  id v3 = [*(id *)(a1 + 32) layer];
  [v3 removeAnimationForKey:*(void *)(a1 + 48)];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  id v5 = [*(id *)(a1 + 32) layer];
  [v5 setShouldRasterize:v4];

  uint64_t v6 = 56;
  if (!*(unsigned char *)(a1 + 72)) {
    uint64_t v6 = 64;
  }
  double v7 = *(double *)(a1 + v6);
  int v8 = [*(id *)(a1 + 32) layer];
  [v8 setRasterizationScale:v7];

  if (!*(unsigned char *)(a1 + 72))
  {
    id v9 = [*(id *)(a1 + 32) layer];
    [v9 setFilters:&__NSArray0__struct];
  }
}

unint64_t sub_10006D768()
{
  unint64_t result = qword_1000EDE10;
  if (!qword_1000EDE10)
  {
    sub_10006D7C4(&qword_1000EDE18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000EDE10);
  }
  return result;
}

uint64_t sub_10006D7C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10006D80C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[19] = a2;
  v3[20] = a3;
  v3[18] = a1;
  uint64_t v4 = type metadata accessor for AudioAppIntentHandler();
  v3[21] = v4;
  v3[22] = *(void *)(v4 - 8);
  v3[23] = swift_task_alloc();
  return _swift_task_switch(sub_10006D8D0, 0, 0);
}

uint64_t sub_10006D8D0()
{
  v0[24] = self;
  v0[25] = type metadata accessor for MainActor();
  v0[26] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10006D978, v2, v1);
}

uint64_t sub_10006D978()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_release();
  *(void *)(v0 + 216) = [v1 sharedApplication];
  return _swift_task_switch(sub_10006DA00, 0, 0);
}

uint64_t sub_10006DA00()
{
  uint64_t v1 = *(void **)(v0 + 216);
  NSString v2 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 224) = [v1 beginBackgroundTaskWithName:v2 expirationHandler:0];

  id v3 = (id)NewsCoreUserDefaults();
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v3 valueForKey:v4];

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 4_Block_object_dispose(&STACK[0x230], 8) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }
  sub_10006DE78(v0 + 48, v0 + 16);
  if (*(void *)(v0 + 40))
  {
    if (swift_dynamicCast())
    {
      uint64_t v7 = *(void *)(v0 + 128);
      uint64_t v6 = *(void *)(v0 + 136);
      goto LABEL_9;
    }
  }
  else
  {
    sub_10006DF24(v0 + 16);
  }
  uint64_t v7 = 0;
  uint64_t v6 = 0;
LABEL_9:
  IntentParameter.wrappedValue.getter();
  if (v6)
  {
    if (v7 == *(void *)(v0 + 80) && v6 == *(void *)(v0 + 88))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_15:
      uint64_t v10 = *(void *)(v0 + 176);
      uint64_t v9 = *(void *)(v0 + 184);
      uint64_t v11 = *(void *)(v0 + 168);
      AppDependency.wrappedValue.getter();
      AudioAppIntentHandler.pause()();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
      goto LABEL_17;
    }
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_15;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v13 = *(void *)(v0 + 176);
  uint64_t v12 = *(void *)(v0 + 184);
  uint64_t v14 = *(void *)(v0 + 168);
  AppDependency.wrappedValue.getter();
  IntentParameter.wrappedValue.getter();
  AudioAppIntentHandler.handleAudioPlayback(for:)(*(Swift::String *)(v0 + 96));
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  id v15 = (id)NewsCoreUserDefaults();
  IntentParameter.wrappedValue.getter();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v17 = String._bridgeToObjectiveC()();
  [v15 setValue:v16 forKey:v17];

LABEL_17:
  type metadata accessor for WidgetCenter();
  static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();
  swift_release();
  *(void *)(v0 + 232) = static MainActor.shared.getter();
  uint64_t v19 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10006DD58, v19, v18);
}

uint64_t sub_10006DD58()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_release();
  *(void *)(v0 + 240) = [v1 sharedApplication];
  return _swift_task_switch(sub_10006DDE0, 0, 0);
}

uint64_t sub_10006DDE0()
{
  uint64_t v1 = (void *)v0[30];
  [v1 endBackgroundTask:v0[28]];

  static IntentResult.result<>()();
  swift_task_dealloc();
  NSString v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_10006DE78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10006DEE0(&qword_1000EDE28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10006DEE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10006DF24(uint64_t a1)
{
  uint64_t v2 = sub_10006DEE0(&qword_1000EDE28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10006DF88()
{
  unint64_t result = qword_1000EDE30;
  if (!qword_1000EDE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000EDE30);
  }
  return result;
}

unint64_t sub_10006DFE0()
{
  unint64_t result = qword_1000EDE38;
  if (!qword_1000EDE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000EDE38);
  }
  return result;
}

unint64_t sub_10006E038()
{
  unint64_t result = qword_1000EDE40;
  if (!qword_1000EDE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000EDE40);
  }
  return result;
}

unint64_t sub_10006E090()
{
  unint64_t result = qword_1000EDE48;
  if (!qword_1000EDE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000EDE48);
  }
  return result;
}

uint64_t sub_10006E0E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10006E100()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10006E150()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale();
  __chkstk_darwin();
  type metadata accessor for String.LocalizationValue();
  __chkstk_darwin();
  uint64_t v4 = type metadata accessor for LocalizedStringResource();
  sub_10006ED2C(v4, qword_1000EE6E8);
  sub_10006ECF4(v4, (uint64_t)qword_1000EE6E8);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10006E330@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000EDE08 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = sub_10006ECF4(v2, (uint64_t)qword_1000EE6E8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10006E3D8()
{
  return 0;
}

uint64_t sub_10006E3EC(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_10006E498;
  return sub_10006D80C(a1, v5, v4);
}

uint64_t sub_10006E498()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10006E58C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10006E7A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10006E5B4(uint64_t a1)
{
  unint64_t v2 = sub_10006DFE0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t destroy for ToggleAudioPlaybackIntent()
{
  swift_release();

  return swift_release();
}

void *_s4News25ToggleAudioPlaybackIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ToggleAudioPlaybackIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ToggleAudioPlaybackIntent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for ToggleAudioPlaybackIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ToggleAudioPlaybackIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ToggleAudioPlaybackIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&STACK[0x230], 8) = 0;
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

ValueMetadata *type metadata accessor for ToggleAudioPlaybackIntent()
{
  return &type metadata for ToggleAudioPlaybackIntent;
}

uint64_t sub_10006E7A8()
{
  uint64_t v0 = type metadata accessor for InputConnectionBehavior();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  __chkstk_darwin();
  uint64_t v22 = (char *)v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10006DEE0(&qword_1000EDE58);
  __chkstk_darwin();
  uint64_t v21 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10006DEE0(&qword_1000EDE60);
  __chkstk_darwin();
  id v20 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10006DEE0(&qword_1000EDE68);
  __chkstk_darwin();
  uint64_t v19 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale();
  __chkstk_darwin();
  type metadata accessor for String.LocalizationValue();
  __chkstk_darwin();
  uint64_t v9 = type metadata accessor for LocalizedStringResource();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  v18[1] = sub_10006DEE0(&qword_1000EDE70);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v11 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v12(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  v12(v8, v11, v5);
  uint64_t v13 = v19;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  uint64_t v14 = type metadata accessor for String.IntentInputOptions();
  long long v25 = 0uLL;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v20, 1, 1, v14);
  uint64_t v15 = type metadata accessor for IntentDialog();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v21, 1, 1, v15);
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v22, enum case for InputConnectionBehavior.default(_:), v24);
  uint64_t v16 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
  sub_10006DEE0(&qword_1000EDE78);
  type metadata accessor for AppDependencyManager();
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v27 = 0;
  static AppDependencyManager.shared.getter();
  AppDependency.__allocating_init(key:manager:)();
  return v16;
}

uint64_t sub_10006ECF4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10006ED2C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10006ED90()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10006EDC4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cloudContext", v6, 2u);
}

void sub_10006EE88()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Case not implemented"];
  int v1 = 136315906;
  int v2 = "-[FRAnalyticsController currentSession]";
  __int16 v3 = 2080;
  int v4 = "FRAnalyticsController.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_10006EF5C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);
}

void sub_10006F020()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"self.lastAppOpenDate", v6, 2u);
}

void sub_10006F0E4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"self.lastAppOpenDate", v6, 2u);
}

void sub_10006F1A8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userIDDeterminationGroup", v6, 2u);
}

void sub_10006F26C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"ending a session when none is in progress"];
  int v1 = 136315906;
  int v2 = "-[FRAnalyticsController endSessionForReason:byStartingNewSession:resetUserID:forSceneID:]";
  __int16 v3 = 2080;
  int v4 = "FRAnalyticsController.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_10006F340()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Expecting a resource identifier for the embed configuration"];
  int v1 = 136315906;
  int v2 = "-[FREmbedConfigurationOperation performOperation]_block_invoke";
  __int16 v3 = 2080;
  int v4 = "FREmbedConfigurationOperation.m";
  __int16 v5 = 1024;
  int v6 = 40;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_10006F420()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appActivityMonitor", v6, 2u);
}

void sub_10006F4E4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"URL", v6, 2u);
}

void sub_10006F5A8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"[URL nss_isNewsURL]", v6, 2u);
}

void sub_10006F66C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"URL", v6, 2u);
}

void sub_10006F730()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "redirectService"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRUnrecognizedURLRouter initWithAnalyticsReferralFactory:redirectService:]";
  __int16 v3 = 2080;
  int v4 = "FRUnrecognizedURLRouter.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10006F810()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"analyticsReferralFactory"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRUnrecognizedURLRouter initWithAnalyticsReferralFactory:redirectService:]";
  __int16 v3 = 2080;
  int v4 = "FRUnrecognizedURLRouter.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10006F8F0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"font", v6, 2u);
}

void sub_10006F9B4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"font", v6, 2u);
}

void sub_10006FA78()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"font", v6, 2u);
}

void sub_10006FB3C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid condensed font given"];
  int v1 = 136315906;
  int v2 = "+[UIFont(FRAdditions) fr_fontWithName:size:]";
  __int16 v3 = 2080;
  int v4 = "UIFont+FRAdditions.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_10006FC10()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid dynamic type mapping"];
  int v1 = 136315906;
  int v2 = "+[UIFont(FRAdditions) fr_appropriateValueForCurrentContentSizeCategoryUsingMap:]";
  __int16 v3 = 2080;
  int v4 = "UIFont+FRAdditions.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_10006FCE4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"map[UIContentSizeCategoryLarge]", v6, 2u);
}

void sub_10006FDA8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sharedDirectoryFileURL", v6, 2u);
}

void sub_10006FE6C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"referralItem", v6, 2u);
}

void sub_10006FF30()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceFilePath", v6, 2u);
}

void sub_10006FFF4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);
}

void sub_1000700B8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryValue", v6, 2u);
}

void sub_10007017C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemClass", v6, 2u);
}

void sub_100070240()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"auto-favorites operation requires an aggregate store"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_1000702FC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"auto-favorites operation requires a tag ranker"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_1000703B8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"auto-favorites operation requires user info"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100070474()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"auto-favorites operation requires a tag controller"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100070530()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"auto-favorites operation requires a subscription controller"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_1000705EC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"auto-favorites operation requires configurable values"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_1000706A8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"We can't process signals without a whitelist"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100070768()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

void sub_100070830(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  int v3 = a2;
  int v4 = [v2 shortOperationDescription];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed to process signals because there's no whitelist", (uint8_t *)&v5, 0xCu);
}

void sub_1000708D8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"locationAutoFavoriteCandidates", v6, 2u);
}

void sub_1000709A8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"safariAutoFavoriteCandidates", v6, 2u);
}

void sub_100070A78()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appUsageAutoFavoriteCandidates", v6, 2u);
}

void sub_100070B48()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"portraitAutoFavoriteCandidates", v6, 2u);
}

void sub_100070C18()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"existingInternalSignalGroupableFavoriteCandidates", v6, 2u);
}

void sub_100070CE8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"internalSignalGroupableFavoriteCandidates", v6, 2u);
}

void sub_100070DB8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"existingInternalSignalAutoFavoriteCandidates", v6, 2u);
}

void sub_100070E88()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"internalSignalAutoFavoriteCandidates", v6, 2u);
}

void sub_100070F58()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"defaultCandidates", v6, 2u);
}

void sub_100071028()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

void sub_1000710EC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

void sub_1000711B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000711EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100071224()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleIDMapping", v6, 2u);
}

void sub_1000712E8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"urlMapping", v6, 2u);
}

void sub_1000713AC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"unwrappedCompletion", v6, 2u);
}

void sub_100071470()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"safariSignals", v6, 2u);
}

void sub_100071534()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appSignals", v6, 2u);
}

void sub_1000715F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100071630()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"favorabilityScores", v6, 2u);
}

void sub_1000716F4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

void sub_1000717B8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"This condition should never happen as we are using siri preferences to manage this now"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100071874()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

void sub_100071938(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "No favorability multiplier specified for %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000719B0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Found a favorability multiplier of %@ for tag %@", (uint8_t *)&v3, 0x16u);
}

void sub_100071A38()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID", v6, 2u);
}

void sub_100071AFC()
{
  sub_100027784(__stack_chk_guard);
  sub_100019198();
  sub_100019140((void *)&_mh_execute_header, v0, v1, "Error in submitting portrait feedback for explicit engagement: %{public}@ with articleID: %{public}@ and topicIDs: %{public}@");
}

void sub_100071B64()
{
  sub_100027784(__stack_chk_guard);
  sub_100019198();
  sub_100019140((void *)&_mh_execute_header, v0, v1, "Error in submitting portrait feedback for explicit rejection: %{public}@ with articleID: %{public}@ and topicIDs: %{public}@");
}

void sub_100071BCC()
{
  sub_100027784(__stack_chk_guard);
  sub_100019198();
  sub_100019140((void *)&_mh_execute_header, v0, v1, "Error in submitting portrait feedback for implicit engagement: %{public}@ with articleID: %{public}@ and topicIDs: %{public}@");
}

void sub_100071C34()
{
  sub_100027784(__stack_chk_guard);
  sub_100019198();
  sub_100019140((void *)&_mh_execute_header, v0, v1, "Error in submitting portrait feedback for implicit rejection: %{public}@ with articleID: %{public}@ and topicIDs: %{public}@");
}

void sub_100071C9C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"application"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRNewsBridgeDeeplinkRouter initWithApplication:bridgedAppDelegate:]";
  __int16 v3 = 2080;
  int v4 = "FRNewsBridgeDeeplinkRouter.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100071D7C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "URL"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRNewsBridgeDeeplinkRouter handleOpenURL:options:analyticsReferral:]";
  __int16 v3 = 2080;
  int v4 = "FRNewsBridgeDeeplinkRouter.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100071E5C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "thumbnailCreator != nil"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FREditorialItemCreator initWithThumbnailCreator:]";
  __int16 v3 = 2080;
  int v4 = "FREditorialItemCreator.m";
  __int16 v5 = 1024;
  int v6 = 32;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100071F48()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"flintDocumentURLAssetHandlesByRemoteURL", v6, 2u);
}

void sub_10007200C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);
}

void sub_1000720D0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);
}

void sub_100072194()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);
}

void sub_100072258()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"encodableElement", v6, 2u);
}

void sub_10007231C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);
}

void sub_1000723E0()
{
  sub_10002C6BC();
  _DWORD *v1 = 136315906;
  sub_10002C6AC((uint64_t)v1, (uint64_t)"-[UIImage(FRAdditions) fr_imageAspectFitToSize:targetScale:croppedToCornerRadius:withMargin:withBackgroundColor:borderColor:]");
  sub_100019160(v2, (uint64_t)"UIImage+FRAdditions.m");
  sub_1000191B8(v3, v4, 236);
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v6);
}

void sub_10007244C()
{
  sub_10002C6BC();
  _DWORD *v1 = 136315906;
  sub_10002C6AC((uint64_t)v1, (uint64_t)"-[UIImage(FRAdditions) fr_bannerImageWithLogo:]");
  sub_100019160(v2, (uint64_t)"UIImage+FRAdditions.m");
  sub_1000191B8(v3, v4, 420);
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v6);
}

void sub_1000724B8(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 size];
  uint64_t v5 = v4;
  [a2 size];
  int v7 = 134218498;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %{public}@", (uint8_t *)&v7, 0x20u);
}

void sub_100072584(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "*** error: image must be backed by a CGImage: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000725FC()
{
  sub_10002C6BC();
  _DWORD *v1 = 136315906;
  sub_10002C6AC((uint64_t)v1, (uint64_t)"-[UIImage(FRAdditions) applyBlurWithRadius:tintColor:saturationDeltaFactor:maskImage:targetSize:screenScale:opaque:logoRect:logoImage:logoText:cornerRadius:punchThroughBanner:allowAldenTint:]");
  sub_100019160(v2, (uint64_t)"UIImage+FRAdditions.m");
  sub_1000191B8(v3, v4, 852);
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v6);
}

void sub_100072668()
{
  sub_10002C6BC();
  _DWORD *v1 = 136315906;
  sub_10002C6AC((uint64_t)v1, (uint64_t)"-[UIImage(FRAdditions) applyBlurWithRadius:tintColor:saturationDeltaFactor:maskImage:targetSize:screenScale:opaque:logoRect:logoImage:logoText:cornerRadius:punchThroughBanner:allowAldenTint:]");
  sub_100019160(v2, (uint64_t)"UIImage+FRAdditions.m");
  sub_1000191B8(v3, v4, 717);
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v6);
}

void sub_1000726D4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "*** error: maskImage must be backed by a CGImage: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10007274C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"applicationProxy", v6, 2u);
}

void sub_100072810(uint64_t a1)
{
  id v1 = [objc_alloc((Class)NSString) initWithFormat:@"Can't get version from LSApplicationProxy (current value: %@)"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v2, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v3, v4, v5, v6, a1, v8, 2u);
}

void sub_1000728D0(uint64_t a1)
{
  id v1 = [objc_alloc((Class)NSString) initWithFormat:@"Operating system version string is missing or not valid (current value: %@)"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v2, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v3, v4, v5, v6, a1, v8, 2u);
}

void sub_100072990()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"BOGUS: Dynamic type interpolation code could not determine a valid value. Investigate!"];
  int v1 = 136315906;
  int v2 = "-[FRDynamicTypeValueScaler scaledValueForSizeCategory:]";
  __int16 v3 = 2080;
  int v4 = "FRDynamicTypeValueScaler.m";
  __int16 v5 = 1024;
  int v6 = 148;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_100072A70()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "sizeCategory.length > 0"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRDynamicTypeValueScaler scaledValueForSizeCategory:]";
  __int16 v3 = 2080;
  int v4 = "FRDynamicTypeValueScaler.m";
  __int16 v5 = 1024;
  int v6 = 106;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100072B5C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CloudKit is not reachable.", v1, 2u);
}

void sub_100072BA0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ERROR: Failed to fetch tags for the Notifications Manager with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100072C18(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Successfully cleared personalization debug data", v1, 2u);
}

void sub_100072C5C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  int v4 = [a2 localizedDescription];
  int v5 = 138412290;
  int v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Failed to clear personalization debug data with error %@", (uint8_t *)&v5, 0xCu);
}

void sub_100072D04(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error when saving readable allowlist: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100072D7C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error when saving readable allowlist: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100072DF8(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to construct file URL for saving readable allowlist", v1, 2u);
}

void sub_100072E3C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cloudContext", v6, 2u);
}

void sub_100072F00()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"favorabilityResourceData", v6, 2u);
}

void sub_100072FC4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"whitelistResourceData", v6, 2u);
}

void sub_100073088()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"urlMappingResourceData", v6, 2u);
}

void sub_10007314C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleIDMappingResourceData", v6, 2u);
}

void sub_100073210()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"favorabilityResourceFileURL", v6, 2u);
}

void sub_1000732D4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"whitelistResourceFileURL", v6, 2u);
}

void sub_100073398()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"urlMappingResourceFileURL", v6, 2u);
}

void sub_10007345C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleIDMappingResourceFileURL", v6, 2u);
}

void sub_100073520()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"favorabilityResource", v6, 2u);
}

void sub_1000735E4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"whitelistResource", v6, 2u);
}

void sub_1000736A8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"urlMappingResource", v6, 2u);
}

void sub_10007376C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleIDMappingResource", v6, 2u);
}

void sub_100073830()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"resourceIdentifier", v6, 2u);
}

void sub_1000738F4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"This operation must not be performed on the main thread."];
  int v1 = 136315906;
  int v2 = "-[FRFavoritesPersonalizer prepareForUseWithCompletionHandler:]";
  __int16 v3 = 2080;
  int v4 = "FRFavoritesPersonalizer.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_1000739C8(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSString);
  uint64_t v9 = *(void *)(a1 + 32);
  id v3 = [v2 initWithFormat:@"Found a subscription with no tagID: %@"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v5, v6, v7, v8, v9, v10, 2u);
}

void sub_100073A8C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagToAdd", v6, 2u);
}

void sub_100073B50()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagToRemove", v6, 2u);
}

void sub_100073C14()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagAdditionError", v6, 2u);
}

void sub_100073CD8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Asked for origin of a TagID I didn't ask to subscribe to"];
  int v1 = 136315906;
  int v2 = "-[FRFavoritesPersonalizer _processAutoFavoritesOperationResult:cursor:error:completion:]_block_invoke_3";
  __int16 v3 = 2080;
  int v4 = "FRFavoritesPersonalizer.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_100073DAC(void *a1, void *a2)
{
  __int16 v3 = a1;
  int v4 = [a2 localizedDescription];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "remove personalization store error: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_100073E54()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"appActivityMonitor"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRApplicationUpdateNotifier initWithVersionHelpers:appActivityMonitor:]";
  __int16 v3 = 2080;
  int v4 = "FRApplicationUpdateNotifier.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100073F34()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "versionHelpers"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRApplicationUpdateNotifier initWithVersionHelpers:appActivityMonitor:]";
  __int16 v3 = 2080;
  int v4 = "FRApplicationUpdateNotifier.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100074014()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"The notifier needs a view controller to present the alert"];
  int v1 = 136315906;
  int v2 = "-[FRApplicationUpdateNotifier showAppUpdateAlert]";
  __int16 v3 = 2080;
  int v4 = "FRApplicationUpdateNotifier.m";
  __int16 v5 = 1024;
  int v6 = 106;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_1000740F8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryItemName", v6, 2u);
}

void sub_1000741BC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryItemName", v6, 2u);
}

void sub_100074284()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"tag IDs with slashes won't be handled properly"];
  int v1 = 136315906;
  int v2 = "+[NSURL(FRAdditions) _urlForTagID:internal:]";
  __int16 v3 = 2080;
  int v4 = "NSURL+FRAdditions.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_100074358()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID.length != 0", v6, 2u);
}

void sub_10007441C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID != nil", v6, 2u);
}

void sub_1000744E0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"pathComponent", v6, 2u);
}

void sub_1000745A4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Path components count has to be atleast two"];
  int v1 = 136315906;
  int v2 = "-[NSURL(FRAdditions) _caseInsensitiveCompareWithFirstPathComponent:]";
  __int16 v3 = 2080;
  int v4 = "NSURL+FRAdditions.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_100074678()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID.length != 0", v6, 2u);
}

void sub_10007473C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID != nil", v6, 2u);
}

void sub_100074800()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"tagRanker"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRSubscribedTagRanker initWithTagRanker:]";
  __int16 v3 = 2080;
  int v4 = "FRSubscribedTagRanker.m";
  __int16 v5 = 1024;
  int v6 = 26;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000748EC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"can't onboard user without a presubscribe service"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000749A4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"can't onboard user without an analytics controller"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100074A5C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"can't onboard user without a cloud context"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100074B14()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected inequality between %s and %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"index", (uint64_t)"NSNotFound", 2u);
}

void sub_100074BE0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected equality between %s and %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"alphabeticalCount", (uint64_t)"self.mostFrequentlyVisitedTags.count", 2u);
}

void sub_100074CAC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected equality between %s and %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"alphabeticalCount", (uint64_t)"self.recentlyOpenedTags.count", 2u);
}

void sub_100074D78()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"[URL nss_isNewsURL]"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRAppDelegate(FRAdditions) _extractWidgetEngagementFromReferralURL:]";
  __int16 v3 = 2080;
  int v4 = "FRAppDelegate+FRAdditions.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100074E58()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "URL"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRAppDelegate(FRAdditions) _extractWidgetEngagementFromReferralURL:]";
  __int16 v3 = 2080;
  int v4 = "FRAppDelegate+FRAdditions.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100074F38()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todayAgent", v6, 2u);
}

void sub_100074FFC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"privateDataUpdateCoordinator", v6, 2u);
}

void sub_1000750C0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"subscriptionController", v6, 2u);
}

void sub_100075184()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"privateDataContext", v6, 2u);
}

void sub_100075248()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfigManager", v6, 2u);
}

void sub_10007530C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"resolver", v6, 2u);
}

void sub_1000753D0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"fetchables should be added before background fetch begins"];
  int v1 = 136315906;
  int v2 = "-[FRBackgroundFetchManager addFetchable:]";
  __int16 v3 = 2080;
  int v4 = "FRBackgroundFetchManager.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: AddFetchableWhileEnumerating) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_1000754A4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"fetchables should only be added from the main thread "];
  int v1 = 136315906;
  int v2 = "-[FRBackgroundFetchManager addFetchable:]";
  __int16 v3 = 2080;
  int v4 = "FRBackgroundFetchManager.m";
  __int16 v5 = 1024;
  sub_10001911C();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: AddFetchableOffMain) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_100075578()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "assetManager"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRPrefetchedArticlesService initWithFeldsparContext:assetManager:]";
  __int16 v3 = 2080;
  int v4 = "FRPrefetchedArticlesService.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100075658()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "feldsparContext"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRPrefetchedArticlesService initWithFeldsparContext:assetManager:]";
  __int16 v3 = 2080;
  int v4 = "FRPrefetchedArticlesService.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100075738(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  __int16 v3 = a2;
  int v4 = [v2 articleID];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to unpack referred article headline, articleID=%{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_1000757E0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"observer != nil", v6, 2u);
}

void sub_1000758A4(uint64_t a1)
{
  id v1 = [objc_alloc((Class)NSString) initWithFormat:@"%p is already an observer"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v2, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v3, v4, v5, v6, a1, v8, 2u);
}

void sub_100075964()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"observer != nil", v6, 2u);
}

void sub_100075A28()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"We only support one observer with this guarantee of being called last at this time"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100075AE0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"cannot be notified of app launch twice"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100075B98()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"cannot react to other application lifecycle events without first being notified of app launch"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100075C50()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"cannot react to other application lifecycle events without first being notified of app launch"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100075D08()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"cannot react to other application lifecycle events without first being notified of app launch"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100075DC0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"cannot react to other application lifecycle events without first being notified of app launch"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100075E78()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"cannot react to other application lifecycle events without first being notified of app launch"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100075F30()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"cannot react to other application lifecycle events without first being notified of app launch"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100075FE8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"editorialItemCreator", v6, 2u);
}

void sub_1000760AC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"thumbnailCreator", v6, 2u);
}

void sub_100076170()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"editorialItemEntryManager", v6, 2u);
}

void sub_100076234(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Editorial Item Provider: ERROR: Document version is missing for editorial articleID: %{public}@, no badge", (uint8_t *)&v3, 0xCu);
}

void sub_1000762B0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"routerManager", v6, 2u);
}

void sub_100076374()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"redirectService", v6, 2u);
}

void sub_100076438()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsReferralFactory", v6, 2u);
}

void sub_1000764FC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"bridgedAppDelegate"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRRoutingAssembly initWithFeldsparContext:bridgedAppDelegate:window:]";
  __int16 v3 = 2080;
  int v4 = "FRRoutingAssembly.m";
  __int16 v5 = 1024;
  int v6 = 35;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000765E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to schedule a local notification with error : %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100076660()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"window"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRFeedSubscriptionAssembly initWithWindow:]";
  __int16 v3 = 2080;
  int v4 = "FRFeedSubscriptionAssembly.m";
  __int16 v5 = 1024;
  int v6 = 31;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10007674C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"ANFHelper != nil", v6, 2u);
}

void sub_100076810()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"thumbnailCreator != nil", v6, 2u);
}

void sub_1000768D4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"editorialConfigurationProvider != nil", v6, 2u);
}

void sub_100076998()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagEditorialItemDownloader != nil", v6, 2u);
}

void sub_100076A5C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleEditorialItemDownloader != nil", v6, 2u);
}

void sub_100076B20()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"editorialItemEntryManager != nil", v6, 2u);
}

void sub_100076BE4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cloudContext != nil", v6, 2u);
}

void sub_100076CA8(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 error];
  sub_10004657C((void *)&_mh_execute_header, v5, v6, "ToC Editorial Manager: Error while fetching editorial item headline=%@", v7, v8, v9, v10, 2u);
}

void sub_100076D40()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

void sub_100076E04()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleID", v6, 2u);
}

void sub_100076EC8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ToC Editorial Manager: Error while parsing feed navigation configuration error=%@", (uint8_t *)&v3, 0xCu);
}

void sub_100076F44(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) count];
  id v3 = [*(id *)(a1 + 40) count];
  int v4 = 134218240;
  id v5 = v2;
  __int16 v6 = 2048;
  id v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error marking %lu IDs saved and %lu IDs unsaved…", (uint8_t *)&v4, 0x16u);
}

void sub_100076FF0()
{
  sub_10001918C();
  sub_1000191CC((void *)&_mh_execute_header, &_os_log_default, v0, "Error clearing article identifiers %@.", v1, v2, v3, v4, v5);
}

void sub_100077060()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "fetchOp"];
  *(_DWORD *)uint8_t buf = 136315906;
  uint64_t v2 = "-[FRGizmoSyncManager _syncSeenIdentifiers:withCompletion:]_block_invoke";
  __int16 v3 = 2080;
  uint64_t v4 = "FRGizmoSyncManager.m";
  __int16 v5 = 1024;
  int v6 = 223;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100077150()
{
  sub_10001918C();
  sub_1000191CC((void *)&_mh_execute_header, &_os_log_default, v0, "Error syncing seen from gizmo %@.", v1, v2, v3, v4, v5);
}

void sub_1000771C0()
{
  sub_10001918C();
  sub_1000191CC((void *)&_mh_execute_header, &_os_log_default, v0, "Error syncing saved from gizmo %@.", v1, v2, v3, v4, v5);
}

void sub_100077230()
{
  sub_10001918C();
  sub_1000191CC((void *)&_mh_execute_header, &_os_log_default, v0, "Error syncing refresh dates with gizmo %@.", v1, v2, v3, v4, v5);
}

void sub_1000772A0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "resourceManager"];
  *(_DWORD *)uint8_t buf = 136315906;
  uint64_t v2 = "-[FRFlintDataProvider initWithANFContent:headline:resourceManager:cloudContext:embedConfigurationManager:]";
  __int16 v3 = 2080;
  uint64_t v4 = "FRFlintDataProvider.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100077380(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%p failed to download Flint JSON with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10007740C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%p will not load asset URLs because there's no context", (uint8_t *)&v2, 0xCu);
}

void sub_100077484()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"must have a context to fetch resources"];
  int v1 = 136315906;
  int v2 = "-[FRFlintDataProvider _loadAssetURLsWithCompletionBlock:]";
  __int16 v3 = 2080;
  int v4 = "FRFlintDataProvider.m";
  __int16 v5 = 1024;
  int v6 = 464;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_100077564()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "imageRequest"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRFlintDataProvider loadImagesForImageRequest:completionBlock:]";
  __int16 v3 = 2080;
  int v4 = "FRFlintDataProvider.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100077648()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"channelName"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FREnableNotificationsAlertPresenter presentEnableNotificationsAlertWithEnableNotificationsContext:channelID:cha"
       "nnelName:window:completionBlock:]";
  __int16 v3 = 2080;
  int v4 = "FREnableNotificationsAlertPresenter.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100077728()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "channelID"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FREnableNotificationsAlertPresenter presentEnableNotificationsAlertWithEnableNotificationsContext:channelID:cha"
       "nnelName:window:completionBlock:]";
  __int16 v3 = 2080;
  int v4 = "FREnableNotificationsAlertPresenter.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100077808()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"rowIndexes"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "+[NSIndexPath(FRAdditions) fr_indexPathsForRows:inSection:]";
  __int16 v3 = 2080;
  int v4 = "NSIndexPath+FRAdditions.m";
  __int16 v5 = 1024;
  int v6 = 34;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000778F4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "_resolver"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRAppDelegate resolver]";
  __int16 v3 = 2080;
  int v4 = "FRAppDelegate.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000779D4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to register for device lock state changes", v1, 2u);
}

void sub_100077A18(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to unregister for device lock state changes", v1, 2u);
}

void sub_100077A5C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to register for remote notifications with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100077AD4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "self.backgroundFetchManager"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRAppDelegate _configureBackgroundFetch]";
  __int16 v3 = 2080;
  int v4 = "FRAppDelegate.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100077BB4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"editorialItemCreator", v6, 2u);
}

void sub_100077C78()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"thumbnailCreator", v6, 2u);
}

void sub_100077D3C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleEditorialItemProvider", v6, 2u);
}

void sub_100077E00()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"editorialItemEntryManager", v6, 2u);
}

void sub_100077EC4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"dataProviderFactory", v6, 2u);
}

void sub_100077F88(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  int v4 = a2;
  int v5 = [v3 articleID];
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "ToC Editorial Manager: Error while loading articleID: %{public}@ with error: %{error}@", (uint8_t *)&v7, 0x16u);
}

void sub_10007804C(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  int v3 = a2;
  int v4 = [v2 articleID];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "ToC Editorial Manager: Content is nil after downloading articleID: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_1000780F4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "privateDataUpdateCoordinator"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRFeldsparContextAssembly initWithContext:privateDataUpdateCoordinator:]";
  __int16 v3 = 2080;
  int v4 = "FRFeldsparContextAssembly.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000781D4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "feldsparContext"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRFeldsparContextAssembly initWithContext:privateDataUpdateCoordinator:]";
  __int16 v3 = 2080;
  int v4 = "FRFeldsparContextAssembly.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000782B4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown header type is not supported."];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10007836C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "font"];
  *(_DWORD *)uint8_t buf = 136315906;
  uint64_t v2 = "+[NSString(FRFeedAdditions) fr_fontForFeedHeaderType:]";
  __int16 v3 = 2080;
  uint64_t v4 = "UIFont+FRFeedAdditions.m";
  __int16 v5 = 1024;
  int v6 = 110;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100078458()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown not handled."];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100078510()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown not handled."];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000785C8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userEmbeddingGenerator", v6, 2u);
}

void sub_10007868C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"privateDataContext", v6, 2u);
}

void sub_100078750()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"personalizationDataGenerator", v6, 2u);
}

void sub_100078814()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"localNewsChannelService", v6, 2u);
}

void sub_1000788D8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"subscriptionController", v6, 2u);
}

void sub_10007899C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"purchaseController", v6, 2u);
}

void sub_100078A60()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizer", v6, 2u);
}

void sub_100078B24()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" userInfo];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRUserInfoUserIDProvider initWithUserInfo:]";
  __int16 v3 = 2080;
  int v4 = "FRUserInfoUserIDProvider.m";
  __int16 v5 = 1024;
  int v6 = 28;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_100078C10()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"must not have consumed non-destructive"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100078CCC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"must not have consumed destructive"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100078D88()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"consumptionBlock"];
  v2[0] = 136315906;
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100078E50()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"must not have consumed non-destructive"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100078F0C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"must have consumed destructive"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100078FC8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"consumptionBlock"];
  v2[0] = 136315906;
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100079090()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"must have consumed destructive and non-destructive"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007914C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"consumptionBlock"];
  v2[0] = 136315906;
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_100079214()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"test"];
  v2[0] = 136315906;
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_1000792DC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Editorial Item entry must have an editorial item ID"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100079394()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Editorial Item entry must have an entryID"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10007944C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Editorial Item entry must have an entryID"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100079504(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100079580()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fontFileURL", v6, 2u);
}

void sub_100079648()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fontFileURL", v6, 2u);
}

void sub_10007970C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fontFileURL", v6, 2u);
}

void sub_1000797D0(void *a1, void *a2)
{
  int v3 = a1;
  int v4 = [a2 localizedDescription];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "_decreaseReferenceCountForFontWithFileURL %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_100079878()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to unregister font while reference count was 0"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100079930()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fontFileURL", v6, 2u);
}

void sub_1000799F4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fontFileURL", v6, 2u);
}

void sub_100079AB8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fontFileURL", v6, 2u);
}

void sub_100079B7C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"*error", v6, 2u);
}

void sub_100079C40()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fontFileURL", v6, 2u);
}

void sub_100079D04()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Attribute returned by font descriptor is not a CFStringRef"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100079DBC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Could not create, or found to many, font descriptors for font file"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100079E74()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fontFileURL", v6, 2u);
}

void sub_100079F38()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"configurationManager"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRTimeAndCountAwareLimitedPersonalizationDataGenerator initWithGenerator:configurationManager:]";
  __int16 v3 = 2080;
  int v4 = "FRLimitedPersonalizationDataGenerator.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10007A018()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"generator"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRTimeAndCountAwareLimitedPersonalizationDataGenerator initWithGenerator:configurationManager:]";
  __int16 v3 = 2080;
  int v4 = "FRLimitedPersonalizationDataGenerator.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10007A0F8(uint64_t *a1, __CFError **a2, void *a3)
{
  uint64_t v3 = *a1;
  int v4 = *a2;
  __int16 v5 = a3;
  int v6 = 138412546;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  CFIndex Code = CFErrorGetCode(v4);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: Couldn't load image at path %@ - %ld", (uint8_t *)&v6, 0x16u);
}

void sub_10007A1AC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to delete cached image.", buf, 2u);
}

void sub_10007A1EC(__CFError **a1, void *a2)
{
  int v2 = *a1;
  uint64_t v3 = a2;
  int v4 = 134217984;
  CFIndex Code = CFErrorGetCode(v2);
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error writing image to disk: %ld", (uint8_t *)&v4, 0xCu);
}

void sub_10007A288()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"error", v6, 2u);
}

void sub_10007A34C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"error", v6, 2u);
}

void sub_10007A410()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"error", v6, 2u);
}

void sub_10007A4D4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"error", v6, 2u);
}

void sub_10007A598()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"defaultsDataDestructionItems"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRDestructiveDataMigrationHandler initWithPrivateDataActionProvider:defaultsDataDestructionItems:]";
  __int16 v3 = 2080;
  int v4 = "FRDestructiveDataMigrationHandler.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10007A678()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"privateDataActionProvider"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FRDestructiveDataMigrationHandler initWithPrivateDataActionProvider:defaultsDataDestructionItems:]";
  __int16 v3 = 2080;
  int v4 = "FRDestructiveDataMigrationHandler.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10007A758()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);
}

void sub_10007A81C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Cannot be zero capacity"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10007A8D4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Initializing FRRingBuffer with a dictionay with no max"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10007A98C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Initializing FRRingBuffer with a dictionay with no min"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10007AA44()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Initializing FRRingBuffer with a dictionay with no position"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10007AAFC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Initializing FRRingBuffer with a dictionay with no values"];
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100019170((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10007ABB4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "headline != nil"];
  v2[0] = 136315906;
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007AC7C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"headline != nil"];
  v2[0] = 136315906;
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007AD44()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"headline != nil"];
  v2[0] = 136315906;
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007AE0C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"articleID != nil"];
  v2[0] = 136315906;
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007AED4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"imbalanced calls to push/pop prefetch suspended"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007AF90()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"unsupported prefetch component for Flint articles"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007B04C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"unsupported prefetch component for web articles"];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007B108()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"[CSSearchableIndex defaultSearchableIndex].indexDelegate", v6, 2u);
}

void sub_10007B1CC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Could not exclude spotlight thumbnails from backup."];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007B288(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't make spotlight directory at path %@", (uint8_t *)&v1, 0xCu);
}

void sub_10007B308()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Problem making spotlight directory."];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007B3C4()
{
  id v1 = objc_alloc((Class)NSString);
  uint64_t v2 = [(id)sub_10006A148() description];
  id v3 = [v0 initWithFormat:@"Couldn't remove the spotlight file. %@"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v5, v6, v7, v8, (uint64_t)v2, v9, 2u);
}

void sub_10007B49C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"File is not a directory."];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007B558(void *a1, uint64_t a2)
{
  [a1 lastPathComponent];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_10006A148() code];
  sub_10006A134();
  uint64_t v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't exclude spotlight thumbnails from backup - URL %@, Error: %ld, %@", v5, 0x20u);
}

void sub_10007B604()
{
  sub_10006A110();
  sub_100026268((void *)&_mh_execute_header, v0, v1, "Could not delete items from CoreSpotlight", v2, v3, v4, v5, v6);
}

void sub_10007B638()
{
  sub_10006A110();
  sub_100026268((void *)&_mh_execute_header, v0, v1, "Could not delete all items from CoreSpotlight", v2, v3, v4, v5, v6);
}

void sub_10007B66C()
{
  sub_10006A110();
  sub_100026268((void *)&_mh_execute_header, v0, v1, "Error deleting items from index", v2, v3, v4, v5, v6);
}

void sub_10007B6A0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Deleting items from CoreSpotlight %@", (uint8_t *)&v3, 0xCu);
}

void sub_10007B71C()
{
  sub_10006A110();
  sub_100026268((void *)&_mh_execute_header, v0, v1, "Could not index items in CoreSpotlight", v2, v3, v4, v5, v6);
}

void sub_10007B750(void *a1)
{
  [a1 code];
  uint64_t v1 = [(id)sub_10006A148() description];
  sub_10006A11C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't get thumbnails to remove: %ld - %@", v2, 0x16u);
}

void sub_10007B7F0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleID", v6, 2u);
}

void sub_10007B8B4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void sub_10007B978()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleID", v6, 2u);
}

void sub_10007BA3C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleID", v6, 2u);
}

void sub_10007BB00(void *a1)
{
  [a1 code];
  int v1 = [(id)sub_10006A148() description];
  sub_10006A11C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error copying file: %ld, %@", v2, 0x16u);
}

void sub_10007BBA0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void sub_10007BC64()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"No file path specified."];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007BD20()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10001AF9C();
  sub_10001910C();
  sub_1000190DC();
  sub_1000190F0((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"thumbnail", v6, 2u);
}

void sub_10007BDE4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"This operation must not be performed on the main thread."];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007BEA0(uint64_t a1, void *a2)
{
  id v3 = [a2 code];
  int v4 = [a2 description];
  sub_10006A134();
  id v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error deleting spotlight thumbnail at path %@ : %ld, %@", v6, 0x20u);
}

void sub_10007BF64()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"This operation must not be performed on the main thread."];
  v2[0] = 136315906;
  sub_100019130();
  sub_100026258();
  sub_10001911C();
  sub_100026240((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

void sub_10007C020(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to restore cache snapshot: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10007C098()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Override editorial data must have an identifier"];
  int v1 = 136315906;
  int v2 = "-[FREditorialOverrideItem initWithIdentifier:title:subtitle:subtitleColorString:actionUrlString:]";
  __int16 v3 = 2080;
  int v4 = "FREditorialOverrideItem.m";
  __int16 v5 = 1024;
  int v6 = 15;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_10007C178()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "appConfigurationManager != nil"];
  *(_DWORD *)uint8_t buf = 136315906;
  int v2 = "-[FREditorialConfigurationProvider initWithAppConfigurationManager:]";
  __int16 v3 = 2080;
  int v4 = "FREditorialConfigurationProvider.m";
  __int16 v5 = 1024;
  int v6 = 26;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10007C264()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Feed navigation config cannot be nil"];
  int v1 = 136315906;
  int v2 = "-[FREditorialConfigurationProvider fetchEditorialConfiguration:]_block_invoke";
  __int16 v3 = 2080;
  int v4 = "FREditorialConfigurationProvider.m";
  __int16 v5 = 1024;
  int v6 = 41;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_10007C344(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Editorial Manager: Error while parsing feed navigation configuration error=%@", (uint8_t *)&v3, 0xCu);
}

void sub_10007C3C0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"editorialItemEntryManager"];
  *(_DWORD *)uint8_t buf = 136315906;
  uint64_t v2 = "-[FRTagEditorialItemDownloader initWithTagController:editorialItemEntryManager:]";
  __int16 v3 = 2080;
  uint64_t v4 = "FRTagEditorialItemDownloader.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_10007C4A0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"tagController"];
  *(_DWORD *)uint8_t buf = 136315906;
  uint64_t v2 = "-[FRTagEditorialItemDownloader initWithTagController:editorialItemEntryManager:]";
  __int16 v3 = 2080;
  uint64_t v4 = "FRTagEditorialItemDownloader.m";
  __int16 v5 = 1024;
  sub_1000190DC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

uint64_t AppDependency.wrappedValue.getter()
{
  return AppDependency.wrappedValue.getter();
}

uint64_t AppDependency.__allocating_init(key:manager:)()
{
  return AppDependency.__allocating_init(key:manager:)();
}

uint64_t static AppDependencyManager.shared.getter()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t type metadata accessor for AppDependencyManager()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

Swift::Void __swiftcall AudioAppIntentHandler.handleAudioPlayback(for:)(Swift::String a1)
{
}

Swift::Void __swiftcall AudioAppIntentHandler.pause()()
{
}

uint64_t type metadata accessor for AudioAppIntentHandler()
{
  return type metadata accessor for AudioAppIntentHandler();
}

uint64_t dispatch thunk of WidgetCenter.reloadAllTimelines()()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t static WidgetCenter.shared.getter()
{
  return static WidgetCenter.shared.getter();
}

uint64_t type metadata accessor for WidgetCenter()
{
  return type metadata accessor for WidgetCenter();
}

uint64_t type metadata accessor for String.IntentInputOptions()
{
  return type metadata accessor for String.IntentInputOptions();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return _CFAllocatorGetDefault();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return _CGBitmapContextGetBytesPerRow(context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return _CGBitmapContextGetData(context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return _CGBitmapContextGetHeight(context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return _CGBitmapContextGetWidth(context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return _CGColorGetColorSpace(color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return _CGColorSpaceGetModel(space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextReplacePathWithStrokedPath(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return _CGGradientCreateWithColors(space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return _CGImageRetain(image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t CPBitmapCreateImagesFromPath()
{
  return _CPBitmapCreateImagesFromPath();
}

uint64_t CPBitmapWriteImagesToPath()
{
  return _CPBitmapWriteImagesToPath();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return _CTFontCreateUIFontForLanguage(uiType, size, language);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return _CTFontDescriptorCopyAttribute(descriptor, attribute);
}

CFArrayRef CTFontManagerCreateFontDescriptorsFromURL(CFURLRef fileURL)
{
  return _CTFontManagerCreateFontDescriptorsFromURL(fileURL);
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return _CTFontManagerRegisterFontsForURL(fontURL, scope, error);
}

BOOL CTFontManagerUnregisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return _CTFontManagerUnregisterFontsForURL(fontURL, scope, error);
}

uint64_t FCAggregateFetchResultWithFetchResults()
{
  return _FCAggregateFetchResultWithFetchResults();
}

uint64_t FCBundle()
{
  return _FCBundle();
}

uint64_t FCCheckedDynamicCast()
{
  return _FCCheckedDynamicCast();
}

uint64_t FCClamp()
{
  return _FCClamp();
}

uint64_t FCDispatchAsyncWithQoSPropagation()
{
  return _FCDispatchAsyncWithQoSPropagation();
}

uint64_t FCDispatchGroupIsEmpty()
{
  return _FCDispatchGroupIsEmpty();
}

uint64_t FCDispatchGroupNotifyWithTimeout()
{
  return _FCDispatchGroupNotifyWithTimeout();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return _FCDispatchQueueForQualityOfService();
}

uint64_t FCDynamicCast()
{
  return _FCDynamicCast();
}

uint64_t FCIntegerRepresentationOfBundleShortVersionString()
{
  return _FCIntegerRepresentationOfBundleShortVersionString();
}

uint64_t FCMix()
{
  return _FCMix();
}

uint64_t FCPerformBlockOnMainThread()
{
  return _FCPerformBlockOnMainThread();
}

uint64_t FCPerformIfNonNil()
{
  return _FCPerformIfNonNil();
}

uint64_t FCPersonalizationActionFromTodayPersonalizationAction()
{
  return _FCPersonalizationActionFromTodayPersonalizationAction();
}

uint64_t FCPersonalizationBaselineClicksMultiplerForTagID()
{
  return _FCPersonalizationBaselineClicksMultiplerForTagID();
}

uint64_t FCProtocolCast()
{
  return _FCProtocolCast();
}

uint64_t FCRandom()
{
  return _FCRandom();
}

uint64_t FCThumbnailForHeadline()
{
  return _FCThumbnailForHeadline();
}

uint64_t FCThumbnailForHeadlineMinimumSize()
{
  return _FCThumbnailForHeadlineMinimumSize();
}

uint64_t FCURLForAccountActionQueue()
{
  return _FCURLForAccountActionQueue();
}

uint64_t FCURLForAppleInternalLibraryBundlesDirectory()
{
  return _FCURLForAppleInternalLibraryBundlesDirectory();
}

uint64_t FCURLForContainerizedUserAccountCachesDirectory()
{
  return _FCURLForContainerizedUserAccountCachesDirectory();
}

uint64_t FCURLForContainerizedUserAccountDocumentDirectory()
{
  return _FCURLForContainerizedUserAccountDocumentDirectory();
}

uint64_t FCURLForContainerizedUserAccountHomeDirectory()
{
  return _FCURLForContainerizedUserAccountHomeDirectory();
}

uint64_t FCURLForSharedTabiResources()
{
  return _FCURLForSharedTabiResources();
}

uint64_t FCURLForTodayDropbox()
{
  return _FCURLForTodayDropbox();
}

uint64_t FCURLForTodayPersonalizationUpdateStore()
{
  return _FCURLForTodayPersonalizationUpdateStore();
}

uint64_t FCURLForTodayPrivateDataTransactionQueue()
{
  return _FCURLForTodayPrivateDataTransactionQueue();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return _GSEventIsHardwareKeyboardAttached();
}

uint64_t NFDevicePlatform()
{
  return _NFDevicePlatform();
}

uint64_t NFInternalBuild()
{
  return _NFInternalBuild();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSSDestroyUserDefaultsDataWithItems()
{
  return _NSSDestroyUserDefaultsDataWithItems();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t NewsCoreSensitiveUserDefaults()
{
  return _NewsCoreSensitiveUserDefaults();
}

uint64_t NewsCoreUserDefaults()
{
  return _NewsCoreUserDefaults();
}

uint64_t TFAmIBeingDebugged()
{
  return _TFAmIBeingDebugged();
}

uint64_t TFCallbackScopeAny()
{
  return _TFCallbackScopeAny();
}

uint64_t TFCompletedStartup()
{
  return _TFCompletedStartup();
}

uint64_t TFSetupCrashDetector()
{
  return _TFSetupCrashDetector();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return _UIAccessibilityIsInvertColorsEnabled();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void UIRectFill(CGRect rect)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

vImage_Error vImageBoxConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return _vImageBoxConvolve_ARGB8888(src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel_height, kernel_width, backgroundColor, flags);
}

vImage_Error vImageMatrixMultiply_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[16], int32_t divisor, const int16_t *pre_bias, const int32_t *post_bias, vImage_Flags flags)
{
  return _vImageMatrixMultiply_ARGB8888(src, dest, matrix, divisor, pre_bias, post_bias, flags);
}

uint64_t zalgo()
{
  return _zalgo();
}

id objc_msgSend_AL(void *a1, const char *a2, ...)
{
  return _[a1 AL];
}

id objc_msgSend_AM(void *a1, const char *a2, ...)
{
  return _[a1 AM];
}

id objc_msgSend_ANFHelper(void *a1, const char *a2, ...)
{
  return _[a1 ANFHelper];
}

id objc_msgSend_AXL(void *a1, const char *a2, ...)
{
  return _[a1 AXL];
}

id objc_msgSend_AXXL(void *a1, const char *a2, ...)
{
  return _[a1 AXXL];
}

id objc_msgSend_AXXXL(void *a1, const char *a2, ...)
{
  return _[a1 AXXXL];
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return _[a1 CGContext];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_JSONArray(void *a1, const char *a2, ...)
{
  return _[a1 JSONArray];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectWithData:options:error:];
}

id objc_msgSend_L(void *a1, const char *a2, ...)
{
  return _[a1 L];
}

id objc_msgSend_M(void *a1, const char *a2, ...)
{
  return _[a1 M];
}

id objc_msgSend_S(void *a1, const char *a2, ...)
{
  return _[a1 S];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathExtension:];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLOverrideForURL_(void *a1, const char *a2, ...)
{
  return [a1 URLOverrideForURL:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_URLWithSuffix_baseURL_(void *a1, const char *a2, ...)
{
  return [a1 URLWithSuffix:baseURL:];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_XL(void *a1, const char *a2, ...)
{
  return _[a1 XL];
}

id objc_msgSend_XS(void *a1, const char *a2, ...)
{
  return _[a1 XS];
}

id objc_msgSend_XXL(void *a1, const char *a2, ...)
{
  return _[a1 XXL];
}

id objc_msgSend_XXXL(void *a1, const char *a2, ...)
{
  return _[a1 XXXL];
}

id objc_msgSend__accessibilityClearChildren(void *a1, const char *a2, ...)
{
  return _[a1 _accessibilityClearChildren];
}

id objc_msgSend__accessibilityViewAncestorIsKindOf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityViewAncestorIsKindOf:");
}

id objc_msgSend__animateWithDuration_delay_options_factory_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateWithDuration:delay:options:factory:animations:completion:");
}

id objc_msgSend__application_openURL_options_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_application:openURL:options:animated:");
}

id objc_msgSend__articleOpenedFromQueryValue_(void *a1, const char *a2, ...)
{
  return [a1 _articleOpenedFromQueryValue:];
}

id objc_msgSend__buildSortedArrays(void *a1, const char *a2, ...)
{
  return _[a1 _buildSortedArrays];
}

id objc_msgSend__canHandleRequest_forMainFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canHandleRequest:forMainFrame:");
}

id objc_msgSend__caseInsensitiveCompareWithFirstPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_caseInsensitiveCompareWithFirstPathComponent:");
}

id objc_msgSend__checkForNeedToResetIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _checkForNeedToResetIdentifier];
}

id objc_msgSend__closeAppSessionForReason_startNewSession_resetUserID_forSceneID_(void *a1, const char *a2, ...)
{
  return [a1 _closeAppSessionForReason:startNewSession:resetUserID:forSceneID:];
}

id objc_msgSend__combinedStringWithTagNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_combinedStringWithTagNames:");
}

id objc_msgSend__configureBackgroundFetch(void *a1, const char *a2, ...)
{
  return _[a1 _configureBackgroundFetch];
}

id objc_msgSend__considerExternalSignals_(void *a1, const char *a2, ...)
{
  return [a1 _considerExternalSignals:];
}

id objc_msgSend__considerInternalAppUsage_(void *a1, const char *a2, ...)
{
  return [a1 _considerInternalAppUsage:];
}

id objc_msgSend__considerInternalSignals_(void *a1, const char *a2, ...)
{
  return [a1 _considerInternalSignals:];
}

id objc_msgSend__consumeActionsUpToActionPassingTest_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_consumeActionsUpToActionPassingTest:withBlock:");
}

id objc_msgSend__copyThumbnail_forHeadline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyThumbnail:forHeadline:");
}

id objc_msgSend__createEntryForHeadline_(void *a1, const char *a2, ...)
{
  return [a1 _createEntryForHeadline:];
}

id objc_msgSend__createNewAutoFavoritesOperation(void *a1, const char *a2, ...)
{
  return _[a1 _createNewAutoFavoritesOperation];
}

id objc_msgSend__disableLoggingForUnsupportedControls(void *a1, const char *a2, ...)
{
  return _[a1 _disableLoggingForUnsupportedControls];
}

id objc_msgSend__doWorkIfNotCancelled_(void *a1, const char *a2, ...)
{
  return [a1 _doWorkIfNotCancelled:];
}

id objc_msgSend__editorialEntryIDForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_editorialEntryIDForIdentifier:");
}

id objc_msgSend__editorialItemHasBadge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_editorialItemHasBadge:");
}

id objc_msgSend__endAllSessionsWithReason_forSceneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endAllSessionsWithReason:forSceneID:");
}

id objc_msgSend__entryForHeadline_(void *a1, const char *a2, ...)
{
  return [a1 _entryForHeadline:];
}

id objc_msgSend__extractWidgetEngagementFromReferralURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractWidgetEngagementFromReferralURL:");
}

id objc_msgSend__fetchEntryForHeadline_completionQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchEntryForHeadline:completionQueue:completionHandler:");
}

id objc_msgSend__fetchInterestTokenForArticleID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchInterestTokenForArticleID:completion:");
}

id objc_msgSend__fetchMetadataWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMetadataWithCompletion:");
}

id objc_msgSend__fetchPreSubscribedChannelsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPreSubscribedChannelsWithCompletion:");
}

id objc_msgSend__fetchTagsAndRefreshEditorialItems(void *a1, const char *a2, ...)
{
  return _[a1 _fetchTagsAndRefreshEditorialItems];
}

id objc_msgSend__findValidAutoFavoritesWithCandidates_channelsAllowedProvider_topicsAllowedProvider_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findValidAutoFavoritesWithCandidates:channelsAllowedProvider:topicsAllowedProvider:completion:");
}

id objc_msgSend__flushIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _flushIfNeeded];
}

id objc_msgSend__fontSizeForTopicFeedsWhenInCardsOfSize_sizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fontSizeForTopicFeedsWhenInCardsOfSize:sizeCategory:");
}

id objc_msgSend__fontSizeForTopicTitleWhenInCardsOfSize_sizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fontSizeForTopicTitleWhenInCardsOfSize:sizeCategory:");
}

id objc_msgSend__fr_fontWeightLookup(void *a1, const char *a2, ...)
{
  return [a1 _fr_fontWeightLookup];
}

id objc_msgSend__fr_undoInvertColorsFilter(void *a1, const char *a2, ...)
{
  return [a1 _fr_undoInvertColorsFilter];
}

id objc_msgSend__getHSBA_(void *a1, const char *a2, ...)
{
  return [a1 _getHSBA:];
}

id objc_msgSend__getRGBA_(void *a1, const char *a2, ...)
{
  return [a1 _getRGBA:];
}

id objc_msgSend__globalPreferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 _globalPreferredLanguages];
}

id objc_msgSend__gradientCGColors(void *a1, const char *a2, ...)
{
  return _[a1 _gradientCGColors];
}

id objc_msgSend__hasUserBeenPresubscribed(void *a1, const char *a2, ...)
{
  return _[a1 _hasUserBeenPresubscribed];
}

id objc_msgSend__identifierWithPrefix_tags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifierWithPrefix:tags:");
}

id objc_msgSend__imageAtPath_(void *a1, const char *a2, ...)
{
  return [a1 _imageAtPath:];
}

id objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(void *a1, const char *a2, ...)
{
  return _[a1 _imageThatSuppressesAccessibilityHairlineThickening];
}

id objc_msgSend__increaseReferenceCountForFontWithFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_increaseReferenceCountForFontWithFileURL:");
}

id objc_msgSend__indexArticleIDs_searchableIndex_acknowledgementHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexArticleIDs:searchableIndex:acknowledgementHandler:");
}

id objc_msgSend__indexTags_searchableIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexTags:searchableIndex:");
}

id objc_msgSend__isSimilarToColor_withinPercentage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSimilarToColor:withinPercentage:");
}

id objc_msgSend__kerningFeedsWhenInCardsOfSize_isChannel_sizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:");
}

id objc_msgSend__luminance(void *a1, const char *a2, ...)
{
  return _[a1 _luminance];
}

id objc_msgSend__markDirtyWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 _markDirtyWithFlags:];
}

id objc_msgSend__markDirtyWithFlags_qualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 _markDirtyWithFlags:];
}

id objc_msgSend__markPurchasesDirty(void *a1, const char *a2, ...)
{
  return _[a1 _markPurchasesDirty];
}

id objc_msgSend__mayWidgetsBeVisible(void *a1, const char *a2, ...)
{
  return _[a1 _mayWidgetsBeVisible];
}

id objc_msgSend__newCompanionConnection(void *a1, const char *a2, ...)
{
  return _[a1 _newCompanionConnection];
}

id objc_msgSend__nextSpecifiedCategoryStartingAtCategory_outValue_outIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nextSpecifiedCategoryStartingAtCategory:outValue:outIndex:");
}

id objc_msgSend__notificationAttachmentsWithThumbnailFileURL_publisherLogoFileURL_publisherLogoCompactFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notificationAttachmentsWithThumbnailFileURL:publisherLogoFileURL:publisherLogoCompactFileURL:");
}

id objc_msgSend__peformBackgroundFetchWithReason_timeout_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peformBackgroundFetchWithReason:timeout:completionHandler:");
}

id objc_msgSend__placeholderOfSize_withChin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_placeholderOfSize:withChin:");
}

id objc_msgSend__previousSpecifiedCategoryStartingAtCategory_outValue_outIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_previousSpecifiedCategoryStartingAtCategory:outValue:outIndex:");
}

id objc_msgSend__processAutoFavoritesOperationResult_cursor_error_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAutoFavoritesOperationResult:cursor:error:completion:");
}

id objc_msgSend__processSignals_(void *a1, const char *a2, ...)
{
  return [a1 _processSignals:];
}

id objc_msgSend__referenceCountForFontWithFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_referenceCountForFontWithFileURL:");
}

id objc_msgSend__referenceCountedSet(void *a1, const char *a2, ...)
{
  return _[a1 _referenceCountedSet];
}

id objc_msgSend__registrationQueue(void *a1, const char *a2, ...)
{
  return _[a1 _registrationQueue];
}

id objc_msgSend__removeAMSTokensFromUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAMSTokensFromUrl:");
}

id objc_msgSend__removeAllArticleThumbnailsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAllArticleThumbnailsWithCompletion:");
}

id objc_msgSend__removeThumbnailForArticleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeThumbnailForArticleID:");
}

id objc_msgSend__resetUserID(void *a1, const char *a2, ...)
{
  return _[a1 _resetUserID];
}

id objc_msgSend__resourceIDFromResourceURL_(void *a1, const char *a2, ...)
{
  return [a1 _resourceIDFromResourceURL:];
}

id objc_msgSend__restartAllSessions(void *a1, const char *a2, ...)
{
  return _[a1 _restartAllSessions];
}

id objc_msgSend__revisitSuspendedState(void *a1, const char *a2, ...)
{
  return _[a1 _revisitSuspendedState];
}

id objc_msgSend__saveReadableAllowlist(void *a1, const char *a2, ...)
{
  return _[a1 _saveReadableAllowlist];
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return [a1 _scaledValueForValue:];
}

id objc_msgSend__scheduleFakeChannelSupportNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleFakeChannelSupportNotification:");
}

id objc_msgSend__scheduleFakeNewArticleNotification_whenAppEntersBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleFakeNewArticleNotification:whenAppEntersBackground:");
}

id objc_msgSend__scheduleLocalNotificationWithIdentifier_title_body_userInfo_category_timeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleLocalNotificationWithIdentifier:title:body:userInfo:category:timeInterval:");
}

id objc_msgSend__setHasUserBeenPresubscribed_(void *a1, const char *a2, ...)
{
  return [_a1 _setHasUserBeenPresubscribed:];
}

id objc_msgSend__setTitle_(void *a1, const char *a2, ...)
{
  return [a1 _setTitle:];
}

id objc_msgSend__shouldIndexArticleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldIndexArticleID:");
}

id objc_msgSend__shouldIndexArticleWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldIndexArticleWithDate:");
}

id objc_msgSend__shouldUnregisterFontWithFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldUnregisterFontWithFileURL:");
}

id objc_msgSend__spotlightFolder(void *a1, const char *a2, ...)
{
  return _[a1 _spotlightFolder];
}

id objc_msgSend__startSessionWithReferral_sceneID_restartAllSessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startSessionWithReferral:sceneID:restartAllSessions:");
}

id objc_msgSend__subscribeToFeedIDs_preSubscribedNotificationsChannelIDs_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subscribeToFeedIDs:preSubscribedNotificationsChannelIDs:withCompletion:");
}

id objc_msgSend__supportsForceTouch(void *a1, const char *a2, ...)
{
  return _[a1 _supportsForceTouch];
}

id objc_msgSend__syncPreferredRefreshDatesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_syncPreferredRefreshDatesWithCompletion:");
}

id objc_msgSend__syncSavedIdentifiersOnGizmo_articleIdentifiersOnGizmo_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_syncSavedIdentifiersOnGizmo:articleIdentifiersOnGizmo:withCompletion:");
}

id objc_msgSend__syncSeenIdentifiers_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_syncSeenIdentifiers:withCompletion:");
}

id objc_msgSend__tagsForSortOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tagsForSortOrder:");
}

id objc_msgSend__thumbnailURLForArticleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_thumbnailURLForArticleID:");
}

id objc_msgSend__thumbnailURLForHeadline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_thumbnailURLForHeadline:");
}

id objc_msgSend__timeSinceLastActivation(void *a1, const char *a2, ...)
{
  return _[a1 _timeSinceLastActivation];
}

id objc_msgSend__unregisterFontAtFileURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterFontAtFileURL:error:");
}

id objc_msgSend__updateBackgroundFetchSettingsWithAppConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBackgroundFetchSettingsWithAppConfiguration:");
}

id objc_msgSend__updatePrivateDataControllersWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePrivateDataControllersWithCompletion:");
}

id objc_msgSend__updateSuspensionState(void *a1, const char *a2, ...)
{
  return _[a1 _updateSuspensionState];
}

id objc_msgSend__urlForTagID_internal_(void *a1, const char *a2, ...)
{
  return [a1 _urlForTagID:internal:];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accessDates(void *a1, const char *a2, ...)
{
  return _[a1 accessDates];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountActionQueue(void *a1, const char *a2, ...)
{
  return _[a1 accountActionQueue];
}

id objc_msgSend_acquireHoldTokenOnUnderlyingAssets(void *a1, const char *a2, ...)
{
  return _[a1 acquireHoldTokenOnUnderlyingAssets];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionURL(void *a1, const char *a2, ...)
{
  return _[a1 actionURL];
}

id objc_msgSend_actionUrlString(void *a1, const char *a2, ...)
{
  return _[a1 actionUrlString];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return _[a1 activationState];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityObservingApplicationDidBecomeActive(void *a1, const char *a2, ...)
{
  return _[a1 activityObservingApplicationDidBecomeActive];
}

id objc_msgSend_activityObservingApplicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return _[a1 activityObservingApplicationDidEnterBackground];
}

id objc_msgSend_activityObservingApplicationDidFinishLaunching(void *a1, const char *a2, ...)
{
  return _[a1 activityObservingApplicationDidFinishLaunching];
}

id objc_msgSend_activityObservingApplicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _[a1 activityObservingApplicationWillEnterForeground];
}

id objc_msgSend_activityObservingApplicationWillResignActive(void *a1, const char *a2, ...)
{
  return _[a1 activityObservingApplicationWillResignActive];
}

id objc_msgSend_activityObservingApplicationWillTerminate(void *a1, const char *a2, ...)
{
  return _[a1 activityObservingApplicationWillTerminate];
}

id objc_msgSend_activityObservingApplicationWindowDidBecomeBackground(void *a1, const char *a2, ...)
{
  return _[a1 activityObservingApplicationWindowDidBecomeBackground];
}

id objc_msgSend_activityObservingApplicationWindowDidBecomeForeground(void *a1, const char *a2, ...)
{
  return _[a1 activityObservingApplicationWindowDidBecomeForeground];
}

id objc_msgSend_activityObservingUserDidPerformAction(void *a1, const char *a2, ...)
{
  return _[a1 activityObservingUserDidPerformAction];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addAnimation:forKey:];
}

id objc_msgSend_addAppConfigObserver_(void *a1, const char *a2, ...)
{
  return [a1 addAppConfigObserver:];
}

id objc_msgSend_addArticleToReadingList_eventInitiationLevel_origin_(void *a1, const char *a2, ...)
{
  return [a1 addArticleToReadingList:eventInitiationLevel:origin:];
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttribute:value:range:];
}

id objc_msgSend_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion_(void *a1, const char *a2, ...)
{
  return [a1 addAutoFavoriteSubscriptionForTagIDs:groupableSubscriptionForTagIDs:originProvider:completion:];
}

id objc_msgSend_addClip(void *a1, const char *a2, ...)
{
  return _[a1 addClip];
}

id objc_msgSend_addCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 addCompletionHandler:];
}

id objc_msgSend_addDelegate_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:];
}

id objc_msgSend_addEditorialItem_(void *a1, const char *a2, ...)
{
  return [a1 addEditorialItem:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addFetchable_(void *a1, const char *a2, ...)
{
  return [a1 addFetchable:];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addInterestInArticleWithID_(void *a1, const char *a2, ...)
{
  return [a1 addInterestInArticleWithID:];
}

id objc_msgSend_addMonitor_(void *a1, const char *a2, ...)
{
  return [a1 addMonitor:];
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 addOperationWithBlock:];
}

id objc_msgSend_addOrderedEditorialItemIDs_(void *a1, const char *a2, ...)
{
  return [a1 addOrderedEditorialItemIDs:];
}

id objc_msgSend_addPreFlushTask_(void *a1, const char *a2, ...)
{
  return [a1 addPreFlushTask:];
}

id objc_msgSend_addPrefetchInterestInHeadline_priority_options_(void *a1, const char *a2, ...)
{
  return [a1 addPrefetchInterestInHeadline:priority:options:];
}

id objc_msgSend_addPrefetchOperationsToOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPrefetchOperationsToOrderedSet:");
}

id objc_msgSend_addProgressivePersonalizationAutoFavorites_groupableSubscriptionForTagIDs_originProvider_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProgressivePersonalizationAutoFavorites:groupableSubscriptionForTagIDs:originProvider:completion:");
}

id objc_msgSend_addRoutable_(void *a1, const char *a2, ...)
{
  return [a1 addRoutable:];
}

id objc_msgSend_addSkipBackupAttributeToItemAtPath_(void *a1, const char *a2, ...)
{
  return [a1 addSkipBackupAttributeToItemAtPath:];
}

id objc_msgSend_addStateObserver_(void *a1, const char *a2, ...)
{
  return [a1 addStateObserver:];
}

id objc_msgSend_addSubscriptionToTag_notificationsEnabled_error_(void *a1, const char *a2, ...)
{
  return [a1 addSubscriptionToTag:notificationsEnabled:error:];
}

id objc_msgSend_addSubscriptionsWithTags_(void *a1, const char *a2, ...)
{
  return [a1 addSubscriptionsWithTags:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_aggregateStore(void *a1, const char *a2, ...)
{
  return _[a1 aggregateStore];
}

id objc_msgSend_aggregateStoreProvider(void *a1, const char *a2, ...)
{
  return _[a1 aggregateStoreProvider];
}

id objc_msgSend_aggregatesForFeatures_(void *a1, const char *a2, ...)
{
  return [a1 aggregatesForFeatures:];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_alertPresentationCount(void *a1, const char *a2, ...)
{
  return _[a1 alertPresentationCount];
}

id objc_msgSend_allAggregates(void *a1, const char *a2, ...)
{
  return _[a1 allAggregates];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allPurchasedTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 allPurchasedTagIDs];
}

id objc_msgSend_allResourcesForImageIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 allResourcesForImageIdentifier:];
}

id objc_msgSend_allSortedArticleIDsInReadingList(void *a1, const char *a2, ...)
{
  return _[a1 allSortedArticleIDsInReadingList];
}

id objc_msgSend_allSubscribedTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 allSubscribedTagIDs];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_alphabeticalTags(void *a1, const char *a2, ...)
{
  return _[a1 alphabeticalTags];
}

id objc_msgSend_analyticsController(void *a1, const char *a2, ...)
{
  return _[a1 analyticsController];
}

id objc_msgSend_analyticsReferralFactory(void *a1, const char *a2, ...)
{
  return _[a1 analyticsReferralFactory];
}

id objc_msgSend_analyticsReferralForURL_sourceApplication_(void *a1, const char *a2, ...)
{
  return [a1 analyticsReferralForURL:sourceApplication:];
}

id objc_msgSend_anfContent(void *a1, const char *a2, ...)
{
  return _[a1 anfContent];
}

id objc_msgSend_anfDocumentAssetHandles(void *a1, const char *a2, ...)
{
  return _[a1 anfDocumentAssetHandles];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationWithKeyPath:];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appActivityMonitor(void *a1, const char *a2, ...)
{
  return _[a1 appActivityMonitor];
}

id objc_msgSend_appConfigManager(void *a1, const char *a2, ...)
{
  return _[a1 appConfigManager];
}

id objc_msgSend_appConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 appConfiguration];
}

id objc_msgSend_appConfigurationManager(void *a1, const char *a2, ...)
{
  return _[a1 appConfigurationManager];
}

id objc_msgSend_appOpenedByUserActivity(void *a1, const char *a2, ...)
{
  return _[a1 appOpenedByUserActivity];
}

id objc_msgSend_appSessionCloseObserver(void *a1, const char *a2, ...)
{
  return _[a1 appSessionCloseObserver];
}

id objc_msgSend_appSessionObservers(void *a1, const char *a2, ...)
{
  return _[a1 appSessionObservers];
}

id objc_msgSend_appSessionStartMethod(void *a1, const char *a2, ...)
{
  return _[a1 appSessionStartMethod];
}

id objc_msgSend_appSessionStartReferral(void *a1, const char *a2, ...)
{
  return _[a1 appSessionStartReferral];
}

id objc_msgSend_appUsageAutoFavoriteCandidates(void *a1, const char *a2, ...)
{
  return _[a1 appUsageAutoFavoriteCandidates];
}

id objc_msgSend_appUsageOccurrenceDecayMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 appUsageOccurrenceDecayMultiplier];
}

id objc_msgSend_appUsagePriorFactorExponent(void *a1, const char *a2, ...)
{
  return _[a1 appUsagePriorFactorExponent];
}

id objc_msgSend_appUsageSignalWeight(void *a1, const char *a2, ...)
{
  return _[a1 appUsageSignalWeight];
}

id objc_msgSend_appUsageTagFavorabilityExponent(void *a1, const char *a2, ...)
{
  return _[a1 appUsageTagFavorabilityExponent];
}

id objc_msgSend_appUsageTimeDecayMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 appUsageTimeDecayMultiplier];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return _[a1 application];
}

id objc_msgSend_application_didFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 application:didFinishLaunchingWithOptions:];
}

id objc_msgSend_application_didReceiveRemoteNotification_fetchCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 application:didReceiveRemoteNotification:fetchCompletionHandler:];
}

id objc_msgSend_application_handleIntent_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 application:handleIntent:completionHandler:];
}

id objc_msgSend_application_openURL_options_(void *a1, const char *a2, ...)
{
  return [a1 application:openURL:options:];
}

id objc_msgSend_application_performFetchWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 application:performFetchWithCompletionHandler:];
}

id objc_msgSend_application_willFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 application:willFinishLaunchingWithOptions:];
}

id objc_msgSend_applicationProxy(void *a1, const char *a2, ...)
{
  return _[a1 applicationProxy];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_applicationUpdateNotifier(void *a1, const char *a2, ...)
{
  return _[a1 applicationUpdateNotifier];
}

id objc_msgSend_applicationVersionNumber(void *a1, const char *a2, ...)
{
  return _[a1 applicationVersionNumber];
}

id objc_msgSend_applicationVersionString(void *a1, const char *a2, ...)
{
  return _[a1 applicationVersionString];
}

id objc_msgSend_applicationWillFinishLaunching(void *a1, const char *a2, ...)
{
  return _[a1 applicationWillFinishLaunching];
}

id objc_msgSend_applicationsAvailableForOpeningURL_(void *a1, const char *a2, ...)
{
  return [a1 applicationsAvailableForOpeningURL:];
}

id objc_msgSend_applyBlurWithRadius_tintColor_saturationDeltaFactor_maskImage_targetSize_screenScale_opaque_logoRect_logoImage_logoText_cornerRadius_punchThroughBanner_allowAldenTint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyBlurWithRadius:tintColor:saturationDeltaFactor:maskImage:targetSize:screenScale:opaque:logoRect:logoImage:logoText:cornerRadius:punchThroughBanner:allowAldenTint:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:requiringSecureCoding:error:];
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 areAnimationsEnabled];
}

id objc_msgSend_areFontsLocallyAvailable(void *a1, const char *a2, ...)
{
  return _[a1 areFontsLocallyAvailable];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_articleContentPool(void *a1, const char *a2, ...)
{
  return _[a1 articleContentPool];
}

id objc_msgSend_articleController(void *a1, const char *a2, ...)
{
  return _[a1 articleController];
}

id objc_msgSend_articleEditorialItemDownloader(void *a1, const char *a2, ...)
{
  return _[a1 articleEditorialItemDownloader];
}

id objc_msgSend_articleEditorialItemProvider(void *a1, const char *a2, ...)
{
  return _[a1 articleEditorialItemProvider];
}

id objc_msgSend_articleFromNotificationUserInfo_thumbnailFileURL_publisherLogoFileURL_publisherLogoMaskFileURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "articleFromNotificationUserInfo:thumbnailFileURL:publisherLogoFileURL:publisherLogoMaskFileURL:completion:");
}

id objc_msgSend_articleID(void *a1, const char *a2, ...)
{
  return _[a1 articleID];
}

id objc_msgSend_articleRecordData(void *a1, const char *a2, ...)
{
  return _[a1 articleRecordData];
}

id objc_msgSend_articleWithID_(void *a1, const char *a2, ...)
{
  return [a1 articleWithID:];
}

id objc_msgSend_articleWithID_forceArticleUpdate_qualityOfService_relativePriority_(void *a1, const char *a2, ...)
{
  return [a1 articleWithID:forceArticleUpdate:qualityOfService:relativePriority:];
}

id objc_msgSend_asChannel(void *a1, const char *a2, ...)
{
  return _[a1 asChannel];
}

id objc_msgSend_asVoid(void *a1, const char *a2, ...)
{
  return _[a1 asVoid];
}

id objc_msgSend_assetHandle(void *a1, const char *a2, ...)
{
  return _[a1 assetHandle];
}

id objc_msgSend_assetHandles(void *a1, const char *a2, ...)
{
  return _[a1 assetHandles];
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return _[a1 assetManager];
}

id objc_msgSend_assignOrderToTagSubscriptionsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 assignOrderToTagSubscriptionsIfNeeded];
}

id objc_msgSend_associateAppEntityFromHeadline_with_(void *a1, const char *a2, ...)
{
  return [a1 associateAppEntityFromHeadline:with:];
}

id objc_msgSend_associateChildOperation_(void *a1, const char *a2, ...)
{
  return [a1 associateChildOperation:];
}

id objc_msgSend_associator(void *a1, const char *a2, ...)
{
  return _[a1 associator];
}

id objc_msgSend_attachmentWithIdentifier_URL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 attachmentWithIdentifier:URL:options:error:];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 attributesOfItemAtPath:error:];
}

id objc_msgSend_audioPlaylist(void *a1, const char *a2, ...)
{
  return _[a1 audioPlaylist];
}

id objc_msgSend_auditCandidates_autoSubscriptionAddedDateByTagId_multiplierProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auditCandidates:autoSubscriptionAddedDateByTagId:multiplierProvider:");
}

id objc_msgSend_autoEnableNotificationsForPreSubscribedChannels(void *a1, const char *a2, ...)
{
  return _[a1 autoEnableNotificationsForPreSubscribedChannels];
}

id objc_msgSend_autoEnableNotificationsIsPending(void *a1, const char *a2, ...)
{
  return _[a1 autoEnableNotificationsIsPending];
}

id objc_msgSend_autoFavoriteMaxIdleTime(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteMaxIdleTime];
}

id objc_msgSend_autoFavoriteMinClicks(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteMinClicks];
}

id objc_msgSend_autoFavoriteMinEvents(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteMinEvents];
}

id objc_msgSend_autoFavoriteMinObservationsExtAppUsage(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteMinObservationsExtAppUsage];
}

id objc_msgSend_autoFavoriteMinObservationsSafari(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteMinObservationsSafari];
}

id objc_msgSend_autoFavoriteMinRate(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteMinRate];
}

id objc_msgSend_autoFavoriteMinRelativeRate(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteMinRelativeRate];
}

id objc_msgSend_autoFavoriteMinScoreExtAppUsage(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteMinScoreExtAppUsage];
}

id objc_msgSend_autoFavoriteMinScoreSafari(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteMinScoreSafari];
}

id objc_msgSend_autoFavoriteTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteTagIDs];
}

id objc_msgSend_autoFavoriteTagIDsForLocation_(void *a1, const char *a2, ...)
{
  return [a1 autoFavoriteTagIDsForLocation:];
}

id objc_msgSend_autoFavoriteTagIDsToScores(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoriteTagIDsToScores];
}

id objc_msgSend_autoFavorites(void *a1, const char *a2, ...)
{
  return _[a1 autoFavorites];
}

id objc_msgSend_autoFavoritesCompletionHandler(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoritesCompletionHandler];
}

id objc_msgSend_autoFavoritesCursor(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoritesCursor];
}

id objc_msgSend_autoFavoritesQueue(void *a1, const char *a2, ...)
{
  return _[a1 autoFavoritesQueue];
}

id objc_msgSend_autoGroupableFactor(void *a1, const char *a2, ...)
{
  return _[a1 autoGroupableFactor];
}

id objc_msgSend_autoUnfavoriteFactor(void *a1, const char *a2, ...)
{
  return _[a1 autoUnfavoriteFactor];
}

id objc_msgSend_autofavorites(void *a1, const char *a2, ...)
{
  return _[a1 autofavorites];
}

id objc_msgSend_avAssetFactory(void *a1, const char *a2, ...)
{
  return _[a1 avAssetFactory];
}

id objc_msgSend_avAssetPrewarmer(void *a1, const char *a2, ...)
{
  return _[a1 avAssetPrewarmer];
}

id objc_msgSend_backgroundFetchInProgress(void *a1, const char *a2, ...)
{
  return _[a1 backgroundFetchInProgress];
}

id objc_msgSend_backgroundFetchManager(void *a1, const char *a2, ...)
{
  return _[a1 backgroundFetchManager];
}

id objc_msgSend_backgroundFetchScheduler(void *a1, const char *a2, ...)
{
  return _[a1 backgroundFetchScheduler];
}

id objc_msgSend_backgroundFetchWithAppConfiguration_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 backgroundFetchWithAppConfiguration:completionHandler:];
}

id objc_msgSend_backingTag(void *a1, const char *a2, ...)
{
  return _[a1 backingTag];
}

id objc_msgSend_bannerHeightForWidth_(void *a1, const char *a2, ...)
{
  return [a1 bannerHeightForWidth:];
}

id objc_msgSend_bannerImageForMask(void *a1, const char *a2, ...)
{
  return _[a1 bannerImageForMask];
}

id objc_msgSend_base64EncodedDataWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedDataWithOptions:];
}

id objc_msgSend_baselineAggregateWithConfigurableValues_(void *a1, const char *a2, ...)
{
  return [a1 baselineAggregateWithConfigurableValues:];
}

id objc_msgSend_baselineRatePrior(void *a1, const char *a2, ...)
{
  return _[a1 baselineRatePrior];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginBackgroundTaskWithName_expirationHandler_(void *a1, const char *a2, ...)
{
  return [a1 beginBackgroundTaskWithName:expirationHandler:];
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithRect:];
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithRoundedRect:cornerRadius:];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_blue(void *a1, const char *a2, ...)
{
  return _[a1 blue];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bootstrapWithApplication_(void *a1, const char *a2, ...)
{
  return [a1 bootstrapWithApplication:];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return [a1 boundingRectWithSize:options:attributes:context:];
}

id objc_msgSend_boundingRectWithSize_options_context_(void *a1, const char *a2, ...)
{
  return [a1 boundingRectWithSize:options:context:];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bridgedAppDelegate(void *a1, const char *a2, ...)
{
  return _[a1 bridgedAppDelegate];
}

id objc_msgSend_buildMenuWithBuilder_(void *a1, const char *a2, ...)
{
  return [a1 buildMenuWithBuilder:];
}

id objc_msgSend_bundleIDMapping(void *a1, const char *a2, ...)
{
  return _[a1 bundleIDMapping];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleProxyForCurrentProcess(void *a1, const char *a2, ...)
{
  return _[a1 bundleProxyForCurrentProcess];
}

id objc_msgSend_bundleSubscriptionManager(void *a1, const char *a2, ...)
{
  return _[a1 bundleSubscriptionManager];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_cacheFontItemForFontSize_(void *a1, const char *a2, ...)
{
  return [a1 cacheFontItemForFontSize:];
}

id objc_msgSend_cacheImageItemForCardSize_(void *a1, const char *a2, ...)
{
  return [a1 cacheImageItemForCardSize:];
}

id objc_msgSend_cachedArticleIDs(void *a1, const char *a2, ...)
{
  return _[a1 cachedArticleIDs];
}

id objc_msgSend_cachedResourceWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cachedResourceWithIdentifier:];
}

id objc_msgSend_cachedResourcesWithIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 cachedResourcesWithIdentifiers:];
}

id objc_msgSend_cachedSubscribedTags(void *a1, const char *a2, ...)
{
  return _[a1 cachedSubscribedTags];
}

id objc_msgSend_cachedSubscription(void *a1, const char *a2, ...)
{
  return _[a1 cachedSubscription];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return _[a1 callback];
}

id objc_msgSend_campaignID(void *a1, const char *a2, ...)
{
  return _[a1 campaignID];
}

id objc_msgSend_campaignType(void *a1, const char *a2, ...)
{
  return _[a1 campaignType];
}

id objc_msgSend_canPerformAction_withSender_(void *a1, const char *a2, ...)
{
  return [a1 canPerformAction:withSender:];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelHandlerWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 cancelHandlerWithBlock:];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:nil selector:nil object:nil];
}

id objc_msgSend_candidatePortraitSignalsWithPortraitResults_disbabledTagIDs_globalThreshold_multiplierProvider_logBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidatePortraitSignalsWithPortraitResults:disbabledTagIDs:globalThreshold:multiplierProvider:logBlock:");
}

id objc_msgSend_canonicalLanguage(void *a1, const char *a2, ...)
{
  return _[a1 canonicalLanguage];
}

id objc_msgSend_capacity(void *a1, const char *a2, ...)
{
  return _[a1 capacity];
}

id objc_msgSend_cardConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 cardConfiguration];
}

id objc_msgSend_cardCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cardCornerRadius];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 caseInsensitiveCompare:];
}

id objc_msgSend_changeWithoutRestartingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 changeWithoutRestartingEnabled];
}

id objc_msgSend_channelFont(void *a1, const char *a2, ...)
{
  return _[a1 channelFont];
}

id objc_msgSend_channelID(void *a1, const char *a2, ...)
{
  return _[a1 channelID];
}

id objc_msgSend_channelPlaceholderImage(void *a1, const char *a2, ...)
{
  return _[a1 channelPlaceholderImage];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return [a1 characterIsMember:];
}

id objc_msgSend_checkForUpdate(void *a1, const char *a2, ...)
{
  return _[a1 checkForUpdate];
}

id objc_msgSend_clearAllSavedUserActivities(void *a1, const char *a2, ...)
{
  return _[a1 clearAllSavedUserActivities];
}

id objc_msgSend_clearAllSeenArticleIdentifiersWithReply_(void *a1, const char *a2, ...)
{
  return [a1 clearAllSeenArticleIdentifiersWithReply:];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearHistory(void *a1, const char *a2, ...)
{
  return _[a1 clearHistory];
}

id objc_msgSend_clearIndex(void *a1, const char *a2, ...)
{
  return _[a1 clearIndex];
}

id objc_msgSend_clearOldCacheItemsWithFeldsparContext_(void *a1, const char *a2, ...)
{
  return [a1 clearOldCacheItemsWithFeldsparContext:];
}

id objc_msgSend_clearPersonalizationData(void *a1, const char *a2, ...)
{
  return _[a1 clearPersonalizationData];
}

id objc_msgSend_clearReadingHistoryManager(void *a1, const char *a2, ...)
{
  return _[a1 clearReadingHistoryManager];
}

id objc_msgSend_clearRecommendations(void *a1, const char *a2, ...)
{
  return _[a1 clearRecommendations];
}

id objc_msgSend_clearableUserEmbedding(void *a1, const char *a2, ...)
{
  return _[a1 clearableUserEmbedding];
}

id objc_msgSend_clicks(void *a1, const char *a2, ...)
{
  return _[a1 clicks];
}

id objc_msgSend_cloudContext(void *a1, const char *a2, ...)
{
  return _[a1 cloudContext];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collapsedTransactionOfTransactions_(void *a1, const char *a2, ...)
{
  return [a1 collapsedTransactionOfTransactions:];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithCGColor_(void *a1, const char *a2, ...)
{
  return [a1 colorWithCGColor:];
}

id objc_msgSend_colorWithDynamicProvider_(void *a1, const char *a2, ...)
{
  return [a1 colorWithDynamicProvider:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_colors(void *a1, const char *a2, ...)
{
  return _[a1 colors];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_compactBannerImage(void *a1, const char *a2, ...)
{
  return _[a1 compactBannerImage];
}

id objc_msgSend_compactTitle(void *a1, const char *a2, ...)
{
  return _[a1 compactTitle];
}

id objc_msgSend_comparatorForSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 comparatorForSubscriptions];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return [a1 compare:options:];
}

id objc_msgSend_compare_options_range_(void *a1, const char *a2, ...)
{
  return [a1 compare:options:range:];
}

id objc_msgSend_component(void *a1, const char *a2, ...)
{
  return _[a1 component];
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 component:fromDate:];
}

id objc_msgSend_componentIdentifierUsingThumbnail(void *a1, const char *a2, ...)
{
  return _[a1 componentIdentifierUsingThumbnail];
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:toDate:options:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return [a1 componentsWithString:];
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 componentsWithURL:resolvingAgainstBaseURL:];
}

id objc_msgSend_configurableValues(void *a1, const char *a2, ...)
{
  return _[a1 configurableValues];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationManager(void *a1, const char *a2, ...)
{
  return _[a1 configurationManager];
}

id objc_msgSend_configurationStore(void *a1, const char *a2, ...)
{
  return _[a1 configurationStore];
}

id objc_msgSend_considerBiome_(void *a1, const char *a2, ...)
{
  return [a1 considerBiome:];
}

id objc_msgSend_considerLocation_(void *a1, const char *a2, ...)
{
  return [a1 considerLocation:];
}

id objc_msgSend_consumeActionsUpToDestructiveActionSyncWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 consumeActionsUpToDestructiveActionSyncWithBlock:];
}

id objc_msgSend_consumeSeenArticleIdentifiers_withReply_(void *a1, const char *a2, ...)
{
  return [a1 consumeSeenArticleIdentifiers:withReply:];
}

id objc_msgSend_consumeUpdates(void *a1, const char *a2, ...)
{
  return _[a1 consumeUpdates];
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 containerURLForSecurityApplicationGroupIdentifier:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 containsObjectForKey:];
}

id objc_msgSend_containsTraitsInCollection_(void *a1, const char *a2, ...)
{
  return [a1 containsTraitsInCollection:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentDirectory(void *a1, const char *a2, ...)
{
  return _[a1 contentDirectory];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_contentWithContext_(void *a1, const char *a2, ...)
{
  return [a1 contentWithContext:];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtPath:error:];
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 contextWithOptions:];
}

id objc_msgSend_convertTime_fromLayer_(void *a1, const char *a2, ...)
{
  return [a1 convertTime:fromLayer:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 copyItemAtURL:toURL:error:];
}

id objc_msgSend_copyURL_toURL_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 copyURL:toURL:completionHandler:];
}

id objc_msgSend_coreDuetLastQueryDate(void *a1, const char *a2, ...)
{
  return _[a1 coreDuetLastQueryDate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return [a1 countForObject:];
}

id objc_msgSend_createBridgedAppResolver(void *a1, const char *a2, ...)
{
  return _[a1 createBridgedAppResolver];
}

id objc_msgSend_createCGImage_fromRect_(void *a1, const char *a2, ...)
{
  return [a1 createCGImage:fromRect:];
}

id objc_msgSend_createCarPlaySceneContainer(void *a1, const char *a2, ...)
{
  return _[a1 createCarPlaySceneContainer];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createEditorialItemFromCachedEntry_(void *a1, const char *a2, ...)
{
  return [a1 createEditorialItemFromCachedEntry:];
}

id objc_msgSend_createEditorialItemWithContext_articleModifiedDate_articleID_headline_flintDataProvider_completion_(void *a1, const char *a2, ...)
{
  return [a1 createEditorialItemWithContext:articleModifiedDate:articleID:headline:flintDataProvider:completion:];
}

id objc_msgSend_createSceneContainer(void *a1, const char *a2, ...)
{
  return _[a1 createSceneContainer];
}

id objc_msgSend_createSpotlightDirectoryIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 createSpotlightDirectoryIfNeeded];
}

id objc_msgSend_creationDateOFURL_(void *a1, const char *a2, ...)
{
  return [a1 creationDateOFURL:];
}

id objc_msgSend_creativeID(void *a1, const char *a2, ...)
{
  return _[a1 creativeID];
}

id objc_msgSend_ctrForTagID_withAggregate_baselineAggregate_(void *a1, const char *a2, ...)
{
  return [a1 ctrForTagID:withAggregate:baselineAggregate:];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 currentNotificationCenter];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 currentTraitCollection];
}

id objc_msgSend_cursor(void *a1, const char *a2, ...)
{
  return _[a1 cursor];
}

id objc_msgSend_d_logState(void *a1, const char *a2, ...)
{
  return [a1 d_logState];
}

id objc_msgSend_darkColor(void *a1, const char *a2, ...)
{
  return _[a1 darkColor];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataIsAnimatedImage_(void *a1, const char *a2, ...)
{
  return [a1 dataIsAnimatedImage];
}

id objc_msgSend_dataManager_error_(void *a1, const char *a2, ...)
{
  return [a1 dataManager:error:];
}

id objc_msgSend_dataManager_userType_(void *a1, const char *a2, ...)
{
  return [a1 dataManager:userType:];
}

id objc_msgSend_dataManagerFeedPrepared_(void *a1, const char *a2, ...)
{
  return [a1 dataManagerFeedPrepared:];
}

id objc_msgSend_dataProviderFactory(void *a1, const char *a2, ...)
{
  return _[a1 dataProviderFactory];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:];
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfURL:];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:options:error:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateAdded(void *a1, const char *a2, ...)
{
  return _[a1 dateAdded];
}

id objc_msgSend_dateArticleWasAdded_(void *a1, const char *a2, ...)
{
  return [a1 dateArticleWasAdded:];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingTimeInterval:];
}

id objc_msgSend_dateFormatterWithFormat_forReuse_(void *a1, const char *a2, ...)
{
  return [a1 dateFormatterWithFormat:forReuse:];
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return [a1 dateFromString:];
}

id objc_msgSend_dateLastOpened(void *a1, const char *a2, ...)
{
  return _[a1 dateLastOpened];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decayRate(void *a1, const char *a2, ...)
{
  return _[a1 decayRate];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultAvailability(void *a1, const char *a2, ...)
{
  return _[a1 defaultAvailability];
}

id objc_msgSend_defaultCandidates(void *a1, const char *a2, ...)
{
  return _[a1 defaultCandidates];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfiguration];
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _[a1 defaultContext];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return _[a1 defaultQueue];
}

id objc_msgSend_defaultScoringConfig(void *a1, const char *a2, ...)
{
  return _[a1 defaultScoringConfig];
}

id objc_msgSend_defaultSearchableIndex(void *a1, const char *a2, ...)
{
  return _[a1 defaultSearchableIndex];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_defaultTags(void *a1, const char *a2, ...)
{
  return _[a1 defaultTags];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 defaultTimeZone];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_defaultsDataDestructionItems(void *a1, const char *a2, ...)
{
  return _[a1 defaultsDataDestructionItems];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAllSearchableItemsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteAllSearchableItemsWithCompletionHandler:];
}

id objc_msgSend_deletePersonalizationVector(void *a1, const char *a2, ...)
{
  return _[a1 deletePersonalizationVector];
}

id objc_msgSend_deleteSearchableItemsWithDomainIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteSearchableItemsWithDomainIdentifiers:completionHandler:];
}

id objc_msgSend_deleteSearchableItemsWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteSearchableItemsWithIdentifiers:completionHandler:];
}

id objc_msgSend_depositSyncWithAccessor_(void *a1, const char *a2, ...)
{
  return [a1 depositSyncWithAccessor:];
}

id objc_msgSend_dequeueTransactionsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 dequeueTransactionsWithCompletion:];
}

id objc_msgSend_derivedPersonalizationDataBalanceValue(void *a1, const char *a2, ...)
{
  return _[a1 derivedPersonalizationDataBalanceValue];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_destinationURLForURL_(void *a1, const char *a2, ...)
{
  return [a1 destinationURLForURL:];
}

id objc_msgSend_destructiveHasBeenConsumed(void *a1, const char *a2, ...)
{
  return _[a1 destructiveHasBeenConsumed];
}

id objc_msgSend_destructivelyDecodeReferraltemOfClass_withQueryValue_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destructivelyDecodeReferraltemOfClass:withQueryValue:error:");
}

id objc_msgSend_deviceManager(void *a1, const char *a2, ...)
{
  return _[a1 deviceManager];
}

id objc_msgSend_deviceScreenScaleFromPotentialBackgroundThread(void *a1, const char *a2, ...)
{
  return _[a1 deviceScreenScaleFromPotentialBackgroundThread];
}

id objc_msgSend_deviceToken(void *a1, const char *a2, ...)
{
  return _[a1 deviceToken];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryForKey:];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithValuesForKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithValuesForKeys:];
}

id objc_msgSend_didCommitFirstFrame(void *a1, const char *a2, ...)
{
  return _[a1 didCommitFirstFrame];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:YES completion:nil];
}

id objc_msgSend_dispose(void *a1, const char *a2, ...)
{
  return _[a1 dispose];
}

id objc_msgSend_disregardCache(void *a1, const char *a2, ...)
{
  return _[a1 disregardCache];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_documentController(void *a1, const char *a2, ...)
{
  return _[a1 documentController];
}

id objc_msgSend_documentVersion(void *a1, const char *a2, ...)
{
  return _[a1 documentVersion];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadArticleWithArticleID_editorialItemFromCache_completion_(void *a1, const char *a2, ...)
{
  return [a1 downloadArticleWithArticleID:editorialItemFromCache:completion:];
}

id objc_msgSend_downloadEditorialItemWithIDs_completion_(void *a1, const char *a2, ...)
{
  return [a1 downloadEditorialItemWithIDs:completion:];
}

id objc_msgSend_downloadIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 downloadIfNeededWithCompletion:];
}

id objc_msgSend_downloadIfNeededWithCompletionQueue_completion_(void *a1, const char *a2, ...)
{
  return [a1 downloadIfNeededWithCompletionQueue:completion:];
}

id objc_msgSend_downloadIfNeededWithGroup_(void *a1, const char *a2, ...)
{
  return [a1 downloadIfNeededWithGroup:];
}

id objc_msgSend_downloadIfNeededWithPriority_completion_(void *a1, const char *a2, ...)
{
  return [a1 downloadIfNeededWithPriority:];
}

id objc_msgSend_downloadThumbnailIconWithContext_flintDataProvider_iconIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 downloadThumbnailIconWithContext:flintDataProvider:iconIdentifier:completion:];
}

id objc_msgSend_dragController_contentRectOfCellAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dragController:contentRectOfCellAtIndexPath];
}

id objc_msgSend_dragController_feedForCellAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dragController:feedForCellAtIndexPath:];
}

id objc_msgSend_dragController_headlineForCellAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dragController:headlineForCellAtIndexPath:];
}

id objc_msgSend_dragItemsForFeed_(void *a1, const char *a2, ...)
{
  return [a1 dragItemsForFeed:];
}

id objc_msgSend_dragItemsForHeadline_(void *a1, const char *a2, ...)
{
  return [a1 dragItemsForHeadline:];
}

id objc_msgSend_drawAtPoint_(void *a1, const char *a2, ...)
{
  return [a1 drawAtPoint:];
}

id objc_msgSend_drawWithRect_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawWithRect:options:context:");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return [a1 earlierDate:];
}

id objc_msgSend_editorialConfigurationProvider(void *a1, const char *a2, ...)
{
  return _[a1 editorialConfigurationProvider];
}

id objc_msgSend_editorialItemCreator(void *a1, const char *a2, ...)
{
  return _[a1 editorialItemCreator];
}

id objc_msgSend_editorialItemEntryManager(void *a1, const char *a2, ...)
{
  return _[a1 editorialItemEntryManager];
}

id objc_msgSend_editorialItemID(void *a1, const char *a2, ...)
{
  return _[a1 editorialItemID];
}

id objc_msgSend_editorialItemsByID(void *a1, const char *a2, ...)
{
  return _[a1 editorialItemsByID];
}

id objc_msgSend_editorialThumbnailImageWith_(void *a1, const char *a2, ...)
{
  return [a1 editorialThumbnailImageWith:];
}

id objc_msgSend_embedConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 embedConfiguration];
}

id objc_msgSend_embedConfigurationAssetID(void *a1, const char *a2, ...)
{
  return _[a1 embedConfigurationAssetID];
}

id objc_msgSend_embedConfigurationData(void *a1, const char *a2, ...)
{
  return _[a1 embedConfigurationData];
}

id objc_msgSend_embedConfigurationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 embedConfigurationIdentifier];
}

id objc_msgSend_embedConfigurationManager(void *a1, const char *a2, ...)
{
  return _[a1 embedConfigurationManager];
}

id objc_msgSend_embedFetchCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 embedFetchCompletionBlock];
}

id objc_msgSend_embedForType_(void *a1, const char *a2, ...)
{
  return [a1 embedForType:];
}

id objc_msgSend_enableBackgroundDownloadsInSpiteOfHighPriorityTasks(void *a1, const char *a2, ...)
{
  return _[a1 enableBackgroundDownloadsInSpiteOfHighPriorityTasks];
}

id objc_msgSend_enableFlushing(void *a1, const char *a2, ...)
{
  return _[a1 enableFlushing];
}

id objc_msgSend_enableLocationBasedAutofavorites(void *a1, const char *a2, ...)
{
  return _[a1 enableLocationBasedAutofavorites];
}

id objc_msgSend_enableNewsPersonalizationAutoFavorites(void *a1, const char *a2, ...)
{
  return _[a1 enableNewsPersonalizationAutoFavorites];
}

id objc_msgSend_encodableElement(void *a1, const char *a2, ...)
{
  return _[a1 encodableElement];
}

id objc_msgSend_encodableElementClass(void *a1, const char *a2, ...)
{
  return _[a1 encodableElementClass];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_endActiveViewingSession(void *a1, const char *a2, ...)
{
  return _[a1 endActiveViewingSession];
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return [a1 endBackgroundTask:];
}

id objc_msgSend_endPoint(void *a1, const char *a2, ...)
{
  return _[a1 endPoint];
}

id objc_msgSend_endSessionForReason_byStartingNewSession_resetUserID_forSceneID_(void *a1, const char *a2, ...)
{
  return [a1 endSessionForReason:byStartingNewSession:resetUserID:forSceneID:];
}

id objc_msgSend_endpointConnectionClientID(void *a1, const char *a2, ...)
{
  return _[a1 endpointConnectionClientID];
}

id objc_msgSend_enqueueBlock_(void *a1, const char *a2, ...)
{
  return [a1 enqueueBlock:];
}

id objc_msgSend_enqueueBlockForMainThread_(void *a1, const char *a2, ...)
{
  return [a1 enqueueBlockForMainThread:];
}

id objc_msgSend_enqueueNotification_postingStyle_(void *a1, const char *a2, ...)
{
  return [a1 enqueueNotification:postingStyle:];
}

id objc_msgSend_enqueueNotification_postingStyle_coalesceMask_forModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueNotification:postingStyle:coalesceMask:forModes:");
}

id objc_msgSend_entitlementService(void *a1, const char *a2, ...)
{
  return _[a1 entitlementService];
}

id objc_msgSend_entryID(void *a1, const char *a2, ...)
{
  return _[a1 entryID];
}

id objc_msgSend_enumerateAggregatesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAggregatesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtPath:];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorMessageForArticleViewWithOfflineReason_(void *a1, const char *a2, ...)
{
  return [a1 errorMessageForArticleViewWithOfflineReason:];
}

id objc_msgSend_errorOn_error_(void *a1, const char *a2, ...)
{
  return [a1 errorOn:error:];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_eventCount(void *a1, const char *a2, ...)
{
  return _[a1 eventCount];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _[a1 events];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_excerptAssetHandle(void *a1, const char *a2, ...)
{
  return _[a1 excerptAssetHandle];
}

id objc_msgSend_executeOnce_(void *a1, const char *a2, ...)
{
  return [a1 executeOnce:];
}

id objc_msgSend_executeWithArticleContentPool_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeWithArticleContentPool:completionHandler:");
}

id objc_msgSend_executeWithCallbackQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 executeWithCallbackQueue:completionHandler:];
}

id objc_msgSend_executeWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 executeWithCompletionHandler:];
}

id objc_msgSend_existingInternalSignalAutoFavoriteCandidates(void *a1, const char *a2, ...)
{
  return _[a1 existingInternalSignalAutoFavoriteCandidates];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return _[a1 extent];
}

id objc_msgSend_fallbackResourceForImageRequest_originalResource_(void *a1, const char *a2, ...)
{
  return [a1 fallbackResourceForImageRequest:originalResource:];
}

id objc_msgSend_fastestEncoding(void *a1, const char *a2, ...)
{
  return _[a1 fastestEncoding];
}

id objc_msgSend_favorabilityScores(void *a1, const char *a2, ...)
{
  return _[a1 favorabilityScores];
}

id objc_msgSend_favoriteTranslationForTagID_(void *a1, const char *a2, ...)
{
  return [a1 favoriteTranslationForTagID:];
}

id objc_msgSend_favoritesPersonalizer(void *a1, const char *a2, ...)
{
  return _[a1 favoritesPersonalizer];
}

id objc_msgSend_fcDigestModeFromScheduledDeliverySetting_(void *a1, const char *a2, ...)
{
  return [a1 fcDigestModeFromScheduledDeliverySetting:];
}

id objc_msgSend_fc_NewsArticleID(void *a1, const char *a2, ...)
{
  return [a1 fc_NewsArticleID];
}

id objc_msgSend_fc_allObjectsPassTest_(void *a1, const char *a2, ...)
{
  return [a1 fc_allObjectsPassTest:];
}

id objc_msgSend_fc_array_(void *a1, const char *a2, ...)
{
  return [a1 fc_array:];
}

id objc_msgSend_fc_arrayByTransformingWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 fc_arrayByTransformingWithBlock:];
}

id objc_msgSend_fc_containsObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 fc_containsObjectPassingTest:];
}

id objc_msgSend_fc_dateFromStringWithISO8601Format_(void *a1, const char *a2, ...)
{
  return [a1 fc_dateFromStringWithISO8601Format];
}

id objc_msgSend_fc_dictionary_(void *a1, const char *a2, ...)
{
  return [a1 fc_dictionary:];
}

id objc_msgSend_fc_dictionaryByTransformingValuesWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 fc_dictionaryByTransformingValuesWithBlock:];
}

id objc_msgSend_fc_dictionaryByTransformingValuesWithKeyAndValueBlock_(void *a1, const char *a2, ...)
{
  return [a1 fc_dictionaryByTransformingValuesWithKeyAndValueBlock:];
}

id objc_msgSend_fc_dictionaryWithKeyBlock_(void *a1, const char *a2, ...)
{
  return [a1 fc_dictionaryWithKeyBlock:];
}

id objc_msgSend_fc_dictionaryWithKeySelector_(void *a1, const char *a2, ...)
{
  return [a1 fc_dictionaryWithKeySelector];
}

id objc_msgSend_fc_dictionaryWithKeys_allowingNil_valueBlock_(void *a1, const char *a2, ...)
{
  return [a1 fc_dictionaryWithKeys:allowingNil:valueBlock:];
}

id objc_msgSend_fc_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 fc_firstObjectPassingTest:];
}

id objc_msgSend_fc_isEarlierThan_(void *a1, const char *a2, ...)
{
  return [a1 fc_isEarlierThan:];
}

id objc_msgSend_fc_isHardPaywallNewsArticleURL_(void *a1, const char *a2, ...)
{
  return [a1 fc_isHardPaywallNewsArticleURL:];
}

id objc_msgSend_fc_isLaterThan_(void *a1, const char *a2, ...)
{
  return [a1 fc_isLaterThan:];
}

id objc_msgSend_fc_isNewsArticleURL(void *a1, const char *a2, ...)
{
  return [a1 fc_isNewsArticleURL];
}

id objc_msgSend_fc_isNewsTagURL(void *a1, const char *a2, ...)
{
  return [a1 fc_isNewsTagURL];
}

id objc_msgSend_fc_isValidArticleID(void *a1, const char *a2, ...)
{
  return [a1 fc_isValidArticleID];
}

id objc_msgSend_fc_isValidTagID(void *a1, const char *a2, ...)
{
  return [a1 fc_isValidTagID];
}

id objc_msgSend_fc_isWithinTimeInterval_ofDate_(void *a1, const char *a2, ...)
{
  return [a1 fc_isWithinTimeInterval:ofDate:];
}

id objc_msgSend_fc_processLaunchDate(void *a1, const char *a2, ...)
{
  return [a1 fc_processLaunchDate];
}

id objc_msgSend_fc_quicklyClearDirectory_callbackQueue_completion_(void *a1, const char *a2, ...)
{
  return [a1 fc_quicklyClearDirectory:callbackQueue:completion:];
}

id objc_msgSend_fc_removeContentsOfDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return [a1 fc_removeContentsOfDirectoryAtURL:];
}

id objc_msgSend_fc_removeFirstObject(void *a1, const char *a2, ...)
{
  return [a1 fc_removeFirstObject];
}

id objc_msgSend_fc_safeSubarrayWithCountFromBack_(void *a1, const char *a2, ...)
{
  return [a1 fc_safeSubarrayWithCountFromBack:];
}

id objc_msgSend_fc_safeSubarrayWithCountFromFront_(void *a1, const char *a2, ...)
{
  return [a1 fc_safeSubarrayWithCountFromFront:];
}

id objc_msgSend_fc_safelyAddObject_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelyAddObject:];
}

id objc_msgSend_fc_safelyIntersectSet_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelyIntersectSet:];
}

id objc_msgSend_fc_safelySetObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelySetObject:forKey:];
}

id objc_msgSend_fc_safelySetObjectAllowingNil_forKey_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelySetObjectAllowingNil:forKey:];
}

id objc_msgSend_fc_safelySetObjectAllowingNil_forKeyAllowingNil_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelySetObjectAllowingNil:forKeyAllowingNil:];
}

id objc_msgSend_fc_safelyUnionSet_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelyUnionSet:];
}

id objc_msgSend_fc_set_(void *a1, const char *a2, ...)
{
  return [a1 fc_set:];
}

id objc_msgSend_fc_setByIntersectingSet_(void *a1, const char *a2, ...)
{
  return [a1 fc_setByIntersectingSet:];
}

id objc_msgSend_fc_setByMinusingSet_(void *a1, const char *a2, ...)
{
  return [a1 fc_setByMinusingSet:];
}

id objc_msgSend_fc_setByTransformingWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 fc_setByTransformingWithBlock:];
}

id objc_msgSend_fc_setByUnioningSet_(void *a1, const char *a2, ...)
{
  return [a1 fc_setByUnioningSet:];
}

id objc_msgSend_fc_sharedConcurrentQueue(void *a1, const char *a2, ...)
{
  return [a1 fc_sharedConcurrentQueue];
}

id objc_msgSend_fc_sharedSerialQueue(void *a1, const char *a2, ...)
{
  return [a1 fc_sharedSerialQueue];
}

id objc_msgSend_fc_subarrayUpToCountInclusive_(void *a1, const char *a2, ...)
{
  return [a1 fc_subarrayUpToCountInclusive:];
}

id objc_msgSend_fc_timeIntervalUntilNow(void *a1, const char *a2, ...)
{
  return [a1 fc_timeIntervalUntilNow];
}

id objc_msgSend_fc_unionOfSetsInArray_(void *a1, const char *a2, ...)
{
  return [a1 fc_unionOfSetsInArray:];
}

id objc_msgSend_featureForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 featureForIdentifier:];
}

id objc_msgSend_featureFromTagID_(void *a1, const char *a2, ...)
{
  return [a1 featureFromTagID:];
}

id objc_msgSend_featureKey(void *a1, const char *a2, ...)
{
  return _[a1 featureKey];
}

id objc_msgSend_featuresFromTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 featuresFromTagIDs:];
}

id objc_msgSend_featuresFromTodayPersonalizationEvent_(void *a1, const char *a2, ...)
{
  return [a1 featuresFromTodayPersonalizationEvent:];
}

id objc_msgSend_featuresGenerator(void *a1, const char *a2, ...)
{
  return _[a1 featuresGenerator];
}

id objc_msgSend_feedNavigationAppearance(void *a1, const char *a2, ...)
{
  return _[a1 feedNavigationAppearance];
}

id objc_msgSend_feedNavigationConfigJSON(void *a1, const char *a2, ...)
{
  return _[a1 feedNavigationConfigJSON];
}

id objc_msgSend_feedPersonalizer(void *a1, const char *a2, ...)
{
  return _[a1 feedPersonalizer];
}

id objc_msgSend_feldsparContext(void *a1, const char *a2, ...)
{
  return _[a1 feldsparContext];
}

id objc_msgSend_feldsparID(void *a1, const char *a2, ...)
{
  return _[a1 feldsparID];
}

id objc_msgSend_fetchANFDocumentDataProviderWithPriority_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchANFDocumentDataProviderWithPriority:completion:];
}

id objc_msgSend_fetchAppConfigurationIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchAppConfigurationIfNeededWithCompletion:];
}

id objc_msgSend_fetchAppConfigurationIfNeededWithCompletionQueue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAppConfigurationIfNeededWithCompletionQueue:completion:");
}

id objc_msgSend_fetchContentForHeadline_completionQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchContentForHeadline:completionQueue:completionHandler:];
}

id objc_msgSend_fetchEditorialConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 fetchEditorialConfiguration:];
}

id objc_msgSend_fetchEmbedConfigurationWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchEmbedConfigurationWithCompletion:];
}

id objc_msgSend_fetchFlintDataProviderForHeadline_completionQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchFlintDataProviderForHeadline:completionQueue:completionHandler:];
}

id objc_msgSend_fetchFontResourcesWithIdentifiers_downloadAssets_relativePriority_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 fetchFontResourcesWithIdentifiers:downloadAssets:relativePriority:completionBlock:];
}

id objc_msgSend_fetchHeadlineMetadataWithReply_(void *a1, const char *a2, ...)
{
  return [a1 fetchHeadlineMetadataWithReply:];
}

id objc_msgSend_fetchLocalAreasProvider_(void *a1, const char *a2, ...)
{
  return [a1 fetchLocalAreasProvider];
}

id objc_msgSend_fetchMappingResourcesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchMappingResourcesWithCompletionHandler:];
}

id objc_msgSend_fetchResourcesWithIdentifiers_downloadAssets_relativePriority_callBackQueue_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 fetchResourcesWithIdentifiers:downloadAssets:relativePriority:callBackQueue:completionBlock:];
}

id objc_msgSend_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock_(void *a1, const char *a2, ...)
{
  return [a1 fetchSignalsFromBiomeWithSafariBlockoutDuration:maxExternalSignalEventCount:resultsBlock:];
}

id objc_msgSend_fetchSubscribedTagsWithCallbackQueue_preferCache_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchSubscribedTagsWithCallbackQueue:preferCache:completion:];
}

id objc_msgSend_fetchTagForTagID_qualityOfService_callbackQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchTagForTagID:qualityOfService:callbackQueue:completionHandler:];
}

id objc_msgSend_fetchTagsForTagIDs_qualityOfService_callbackQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchTagsForTagIDs:];
}

id objc_msgSend_fetchTranslationProvider_(void *a1, const char *a2, ...)
{
  return [a1 fetchTranslationProvider:];
}

id objc_msgSend_fetchWidgetLocalNewsChannelIDWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchWidgetLocalNewsChannelIDWithCompletion:];
}

id objc_msgSend_fetchables(void *a1, const char *a2, ...)
{
  return _[a1 fetchables];
}

id objc_msgSend_fetchedObject(void *a1, const char *a2, ...)
{
  return _[a1 fetchedObject];
}

id objc_msgSend_fileCoordinatedTodayDropbox(void *a1, const char *a2, ...)
{
  return _[a1 fileCoordinatedTodayDropbox];
}

id objc_msgSend_fileCoordinatedTodayPrivateDataTransactionQueue(void *a1, const char *a2, ...)
{
  return _[a1 fileCoordinatedTodayPrivateDataTransactionQueue];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:isDirectory:];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 fileModificationDate];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return _[a1 filePath];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return _[a1 fileURL];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_fillWithBlendMode_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillWithBlendMode:alpha:");
}

id objc_msgSend_filledRectForRect_(void *a1, const char *a2, ...)
{
  return [a1 filledRectForRect:];
}

id objc_msgSend_filterWithName_(void *a1, const char *a2, ...)
{
  return [a1 filterWithName:];
}

id objc_msgSend_filterWithName_keysAndValues_(void *a1, const char *a2, ...)
{
  return [a1 filterWithName:];
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return [a1 filterWithType:];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 filteredArrayUsingPredicate:];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return _[a1 filters];
}

id objc_msgSend_finalizeRestoreOfCachesDirectory(void *a1, const char *a2, ...)
{
  return _[a1 finalizeRestoreOfCachesDirectory];
}

id objc_msgSend_finishedExecuting(void *a1, const char *a2, ...)
{
  return _[a1 finishedExecuting];
}

id objc_msgSend_finishedExecutingWithFailure(void *a1, const char *a2, ...)
{
  return _[a1 finishedExecutingWithFailure];
}

id objc_msgSend_finishedPerformingOperationWithError_(void *a1, const char *a2, ...)
{
  return [a1 finishedPerformingOperationWithError:];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return _[a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstly_(void *a1, const char *a2, ...)
{
  return [a1 firstly:];
}

id objc_msgSend_flintDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 flintDataProvider];
}

id objc_msgSend_flintDataProviderFactory(void *a1, const char *a2, ...)
{
  return _[a1 flintDataProviderFactory];
}

id objc_msgSend_flintDataProviderForANFContent_headline_(void *a1, const char *a2, ...)
{
  return [a1 flintDataProviderForANFContent:headline:];
}

id objc_msgSend_flintDocumentURLAssetHandlesByRemoteURL(void *a1, const char *a2, ...)
{
  return _[a1 flintDocumentURLAssetHandlesByRemoteURL];
}

id objc_msgSend_flintResourceManager(void *a1, const char *a2, ...)
{
  return _[a1 flintResourceManager];
}

id objc_msgSend_floatForKey_(void *a1, const char *a2, ...)
{
  return [a1 floatForKey:];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flushContentWithArticleID_(void *a1, const char *a2, ...)
{
  return [a1 flushContentWithArticleID:];
}

id objc_msgSend_fontCache(void *a1, const char *a2, ...)
{
  return _[a1 fontCache];
}

id objc_msgSend_fontForChannelFeedsWhenInCardsOfSize_sizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 fontForChannelFeedsWhenInCardsOfSize:sizeCategory:];
}

id objc_msgSend_fontForTopicFeedsWhenInCardsOfSize_sizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 fontForTopicFeedsWhenInCardsOfSize:sizeCategory:];
}

id objc_msgSend_fontResourceIDs(void *a1, const char *a2, ...)
{
  return _[a1 fontResourceIDs];
}

id objc_msgSend_fontResources(void *a1, const char *a2, ...)
{
  return _[a1 fontResources];
}

id objc_msgSend_fontWithName_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithName:size:];
}

id objc_msgSend_fontWithSize_(void *a1, const char *a2, ...)
{
  return [a1 fontWithSize:];
}

id objc_msgSend_fontsToRegister(void *a1, const char *a2, ...)
{
  return _[a1 fontsToRegister];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return _[a1 foregroundColor];
}

id objc_msgSend_forwardingTargetForSelector_(void *a1, const char *a2, ...)
{
  return [a1 forwardingTargetForSelector:];
}

id objc_msgSend_fr_NewsURLForTagID_title_(void *a1, const char *a2, ...)
{
  return [a1 fr_NewsURLForTagID:title:];
}

id objc_msgSend_fr_accessibilityApplyLowerPitchTokenToRange_(void *a1, const char *a2, ...)
{
  return [a1 fr_accessibilityApplyLowerPitchTokenToRange:];
}

id objc_msgSend_fr_accessoryColorForTextColor_backgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fr_accessoryColorForTextColor:backgroundColor:");
}

id objc_msgSend_fr_animateWithDuration_delay_timingFunction_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fr_animateWithDuration:delay:timingFunction:options:animations:completion:");
}

id objc_msgSend_fr_articleOpenedFrom(void *a1, const char *a2, ...)
{
  return [a1 fr_articleOpenedFrom];
}

id objc_msgSend_fr_attributesLookup(void *a1, const char *a2, ...)
{
  return [a1 fr_attributesLookup];
}

id objc_msgSend_fr_barButtonItemView(void *a1, const char *a2, ...)
{
  return [a1 fr_barButtonItemView];
}

id objc_msgSend_fr_campaignID(void *a1, const char *a2, ...)
{
  return [a1 fr_campaignID];
}

id objc_msgSend_fr_campaignType(void *a1, const char *a2, ...)
{
  return [a1 fr_campaignType];
}

id objc_msgSend_fr_canHandleNavigationAction_(void *a1, const char *a2, ...)
{
  return [a1 fr_canHandleNavigationAction:];
}

id objc_msgSend_fr_colorBin(void *a1, const char *a2, ...)
{
  return [a1 fr_colorBin];
}

id objc_msgSend_fr_colorWithHue_saturation_lightness_alpha_(void *a1, const char *a2, ...)
{
  return [a1 fr_colorWithHue:saturation:lightness:alpha:];
}

id objc_msgSend_fr_creativeID(void *a1, const char *a2, ...)
{
  return [a1 fr_creativeID];
}

id objc_msgSend_fr_croppedImageWithAspectRatio_(void *a1, const char *a2, ...)
{
  return [a1 fr_croppedImageWithAspectRatio:];
}

id objc_msgSend_fr_deepLinkURL(void *a1, const char *a2, ...)
{
  return [a1 fr_deepLinkURL];
}

id objc_msgSend_fr_dynamicColor_withDarkStyleVariant_(void *a1, const char *a2, ...)
{
  return [a1 fr_dynamicColor:withDarkStyleVariant:];
}

id objc_msgSend_fr_feldsparArticleIDWithAssetManager_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fr_feldsparArticleIDWithAssetManager:completion:");
}

id objc_msgSend_fr_feldsparInternalExtrasBundle(void *a1, const char *a2, ...)
{
  return [a1 fr_feldsparInternalExtrasBundle];
}

id objc_msgSend_fr_firstAncestorOfType_(void *a1, const char *a2, ...)
{
  return [a1 fr_firstAncestorOfType:];
}

id objc_msgSend_fr_fontForFeedHeaderType_(void *a1, const char *a2, ...)
{
  return [a1 fr_fontForFeedHeaderType:];
}

id objc_msgSend_fr_fontLookup(void *a1, const char *a2, ...)
{
  return [a1 fr_fontLookup];
}

id objc_msgSend_fr_fontWithName_size_(void *a1, const char *a2, ...)
{
  return [a1 fr_fontWithName:size:];
}

id objc_msgSend_fr_gregorianShortDisplayString(void *a1, const char *a2, ...)
{
  return [a1 fr_gregorianShortDisplayString];
}

id objc_msgSend_fr_imageCroppedToCornerRadius_withBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 fr_imageCroppedToCornerRadius:withBackgroundColor:];
}

id objc_msgSend_fr_isFeldsparFavoritesPickerURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isFeldsparFavoritesPickerURL];
}

id objc_msgSend_fr_isFeldsparForYouURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isFeldsparForYouURL];
}

id objc_msgSend_fr_isFeldsparHistoryURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isFeldsparHistoryURL];
}

id objc_msgSend_fr_isFeldsparOpenInNewsErrorURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isFeldsparOpenInNewsErrorURL];
}

id objc_msgSend_fr_isFeldsparReferableURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isFeldsparReferableURL];
}

id objc_msgSend_fr_isFeldsparSavedURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isFeldsparSavedURL];
}

id objc_msgSend_fr_isFeldsparSpotlightURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isFeldsparSpotlightURL];
}

id objc_msgSend_fr_isFeldsparTabURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isFeldsparTabURL];
}

id objc_msgSend_fr_isFromSafariSearchWithSourceApplication_(void *a1, const char *a2, ...)
{
  return [a1 fr_isFromSafariSearchWithSourceApplication:];
}

id objc_msgSend_fr_isHTTPScheme(void *a1, const char *a2, ...)
{
  return [a1 fr_isHTTPScheme];
}

id objc_msgSend_fr_isPreviewURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isPreviewURL];
}

id objc_msgSend_fr_isStoreURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isStoreURL];
}

id objc_msgSend_fr_isSubcriptionURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isSubcriptionURL];
}

id objc_msgSend_fr_isSubscriptionURLForWebOptIn(void *a1, const char *a2, ...)
{
  return [a1 fr_isSubscriptionURLForWebOptIn];
}

id objc_msgSend_fr_isWebArchiveURL(void *a1, const char *a2, ...)
{
  return [a1 fr_isWebArchiveURL];
}

id objc_msgSend_fr_leadingForFeedHeaderType_(void *a1, const char *a2, ...)
{
  return [a1 fr_leadingForFeedHeaderType:];
}

id objc_msgSend_fr_opaqueImageWithFillColor_(void *a1, const char *a2, ...)
{
  return [a1 fr_opaqueImageWithFillColor:];
}

id objc_msgSend_fr_orderedContentSizeCategories(void *a1, const char *a2, ...)
{
  return [a1 fr_orderedContentSizeCategories];
}

id objc_msgSend_fr_partOfDay(void *a1, const char *a2, ...)
{
  return [a1 fr_partOfDay];
}

id objc_msgSend_fr_plusDEffectWithForegroundColor_backgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 fr_plusDEffectWithForegroundColor:backgroundColor:];
}

id objc_msgSend_fr_plusLEffectWithForegroundColor_backgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 fr_plusLEffectWithForegroundColor:backgroundColor:];
}

id objc_msgSend_fr_recolorLabelSubviewsWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fr_recolorLabelSubviewsWithColor:");
}

id objc_msgSend_fr_scaledImageWithMaximumSize_(void *a1, const char *a2, ...)
{
  return [a1 fr_scaledImageWithMaximumSize:];
}

id objc_msgSend_fr_scaledImageWithMaximumSize_targetScale_(void *a1, const char *a2, ...)
{
  return [a1 fr_scaledImageWithMaximumSize:targetScale:];
}

id objc_msgSend_fr_scaledValueForValue_(void *a1, const char *a2, ...)
{
  return [a1 fr_scaledValueForValue:];
}

id objc_msgSend_fr_scaledValueForValue_scalingRate_(void *a1, const char *a2, ...)
{
  return [a1 fr_scaledValueForValue:scalingRate:];
}

id objc_msgSend_fr_selfOrFirstAncestorOfType_(void *a1, const char *a2, ...)
{
  return [a1 fr_selfOrFirstAncestorOfType:];
}

id objc_msgSend_fr_shouldTitlecaseForFeedHeaderType_(void *a1, const char *a2, ...)
{
  return [a1 fr_shouldTitlecaseForFeedHeaderType:];
}

id objc_msgSend_fr_stringByDecodingHTMLEntities(void *a1, const char *a2, ...)
{
  return [a1 fr_stringByDecodingHTMLEntities];
}

id objc_msgSend_fr_systemFontNameForWeight_condensed_(void *a1, const char *a2, ...)
{
  return [a1 fr_systemFontNameForWeight:condensed:];
}

id objc_msgSend_fr_topicCardBorderColorForDarkBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardBorderColorForDarkBackground];
}

id objc_msgSend_fr_topicCardBorderColorForLightBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardBorderColorForLightBackground];
}

id objc_msgSend_fr_topicCardDividerColorForDarkBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardDividerColorForDarkBackground];
}

id objc_msgSend_fr_topicCardDividerColorForLightBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardDividerColorForLightBackground];
}

id objc_msgSend_fr_topicCardTextColorForDarkBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardTextColorForDarkBackground];
}

id objc_msgSend_fr_topicCardTextColorForLightBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardTextColorForLightBackground];
}

id objc_msgSend_fr_trackingForFeedHeaderType_(void *a1, const char *a2, ...)
{
  return [a1 fr_trackingForFeedHeaderType:];
}

id objc_msgSend_fr_widgetEngagementFileURL(void *a1, const char *a2, ...)
{
  return [a1 fr_widgetEngagementFileURL];
}

id objc_msgSend_fr_widgetModeGroupID(void *a1, const char *a2, ...)
{
  return [a1 fr_widgetModeGroupID];
}

id objc_msgSend_fr_widgetReferralItemWithQueryItemName_(void *a1, const char *a2, ...)
{
  return [a1 fr_widgetReferralItemWithQueryItemName:];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_generateDerivedData(void *a1, const char *a2, ...)
{
  return _[a1 generateDerivedData];
}

id objc_msgSend_generateDerivedDataWithMaxAggregateCount_qualityOfService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateDerivedDataWithMaxAggregateCount:qualityOfService:completion:");
}

id objc_msgSend_generateUserEmbeddingIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateUserEmbeddingIfNeededWithCompletion:");
}

id objc_msgSend_generator(void *a1, const char *a2, ...)
{
  return _[a1 generator];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:length:];
}

id objc_msgSend_getHue_saturation_brightness_alpha_(void *a1, const char *a2, ...)
{
  return [a1 getHue:saturation:brightness:alpha:];
}

id objc_msgSend_getHue_saturation_lightness_alpha_(void *a1, const char *a2, ...)
{
  return [a1 getHue:saturation:lightness:alpha:];
}

id objc_msgSend_getNotificationSettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 getNotificationSettingsWithCompletionHandler:];
}

id objc_msgSend_getRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 getRed:green:blue:alpha:];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 getResourceValue:forKey:error:];
}

id objc_msgSend_gizmoPreferencesNotifierDidNoticeUpdate_(void *a1, const char *a2, ...)
{
  return [a1 gizmoPreferencesNotifierDidNoticeUpdate:];
}

id objc_msgSend_gizmoSyncManager(void *a1, const char *a2, ...)
{
  return _[a1 gizmoSyncManager];
}

id objc_msgSend_gizmoSyncManager_fetchOperationForArticleIDs_(void *a1, const char *a2, ...)
{
  return [a1 gizmoSyncManager:fetchOperationForArticleIDs:];
}

id objc_msgSend_gradientLayerWithChin_(void *a1, const char *a2, ...)
{
  return [a1 gradientLayerWithChin];
}

id objc_msgSend_green(void *a1, const char *a2, ...)
{
  return _[a1 green];
}

id objc_msgSend_gridSpacingForWidth_(void *a1, const char *a2, ...)
{
  return [a1 gridSpacingForWidth:];
}

id objc_msgSend_groupCancelHandlerWithCancelHandlers_(void *a1, const char *a2, ...)
{
  return [a1 groupCancelHandlerWithCancelHandlers:];
}

id objc_msgSend_groupType(void *a1, const char *a2, ...)
{
  return _[a1 groupType];
}

id objc_msgSend_groupableCandidates(void *a1, const char *a2, ...)
{
  return _[a1 groupableCandidates];
}

id objc_msgSend_groupableFavoriteTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 groupableFavoriteTagIDs];
}

id objc_msgSend_groupableTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 groupableTagIDs];
}

id objc_msgSend_handle_(void *a1, const char *a2, ...)
{
  return [a1 handle:];
}

id objc_msgSend_handleMigration(void *a1, const char *a2, ...)
{
  return _[a1 handleMigration];
}

id objc_msgSend_handleOpenURL_options_analyticsReferral_(void *a1, const char *a2, ...)
{
  return [a1 handleOpenURL:options:analyticsReferral:];
}

id objc_msgSend_hasArticleBeenMarkedAsOffensive_(void *a1, const char *a2, ...)
{
  return [a1 hasArticleBeenMarkedAsOffensive];
}

id objc_msgSend_hasArticleBeenSeen_(void *a1, const char *a2, ...)
{
  return [a1 hasArticleBeenSeen:];
}

id objc_msgSend_hasArticleBeenVisited_(void *a1, const char *a2, ...)
{
  return [a1 hasArticleBeenVisited:];
}

id objc_msgSend_hasBeenNotifiedOfApplicationLaunch(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenNotifiedOfApplicationLaunch];
}

id objc_msgSend_hasNotificationsEnabledForTag_(void *a1, const char *a2, ...)
{
  return [a1 hasNotificationsEnabledForTag:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSubscriptionToTag_(void *a1, const char *a2, ...)
{
  return [a1 hasSubscriptionToTag:];
}

id objc_msgSend_hasTelephonyScheme(void *a1, const char *a2, ...)
{
  return _[a1 hasTelephonyScheme];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 hashTableWithOptions:];
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return _[a1 headline];
}

id objc_msgSend_headlineNotification_base64Image(void *a1, const char *a2, ...)
{
  return [a1 headlineNotification_base64Image];
}

id objc_msgSend_headlineNotification_base64PublisherImage(void *a1, const char *a2, ...)
{
  return [a1 headlineNotification_base64PublisherImage];
}

id objc_msgSend_headlineNotification_date(void *a1, const char *a2, ...)
{
  return [a1 headlineNotification_date];
}

id objc_msgSend_headlineNotification_identifier(void *a1, const char *a2, ...)
{
  return [a1 headlineNotification_identifier];
}

id objc_msgSend_headlineNotification_publisher(void *a1, const char *a2, ...)
{
  return [a1 headlineNotification_publisher];
}

id objc_msgSend_headlineNotification_title(void *a1, const char *a2, ...)
{
  return [a1 headlineNotification_title];
}

id objc_msgSend_headlineWithContentContext_(void *a1, const char *a2, ...)
{
  return [a1 headlineWithContentContext:];
}

id objc_msgSend_headlinesFetchOperationForArticleIDs_(void *a1, const char *a2, ...)
{
  return [a1 headlinesFetchOperationForArticleIDs];
}

id objc_msgSend_highWaterMark(void *a1, const char *a2, ...)
{
  return _[a1 highWaterMark];
}

id objc_msgSend_historyItemsForArticleIDs_(void *a1, const char *a2, ...)
{
  return [a1 historyItemsForArticleIDs:];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_iPad(void *a1, const char *a2, ...)
{
  return _[a1 iPad];
}

id objc_msgSend_iPhone(void *a1, const char *a2, ...)
{
  return _[a1 iPhone];
}

id objc_msgSend_iconImageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 iconImageIdentifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoredTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 ignoredTagIDs];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageCache(void *a1, const char *a2, ...)
{
  return _[a1 imageCache];
}

id objc_msgSend_imageFromData_size_(void *a1, const char *a2, ...)
{
  return [a1 imageFromData:size:];
}

id objc_msgSend_imageFromNewGraphicsContextWithSize_opaque_forceSRGB_scale_contextBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:");
}

id objc_msgSend_imageFromNewGraphicsContextWithSize_opaque_scale_contextBlock_(void *a1, const char *a2, ...)
{
  return [a1 imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:];
}

id objc_msgSend_imageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 imageIdentifier];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _[a1 imageOrientation];
}

id objc_msgSend_imageResourceForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 imageResourceForIdentifier:];
}

id objc_msgSend_imageResourceResponseForFileURL_perserveColorSpace_withSize_andQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:");
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return [a1 imageWithActions:];
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:];
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:scale:orientation:];
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 imageWithContentsOfFile:];
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return [a1 imageWithData:];
}

id objc_msgSend_inScope_(void *a1, const char *a2, ...)
{
  return [a1 inScope:];
}

id objc_msgSend_indexDelegate(void *a1, const char *a2, ...)
{
  return _[a1 indexDelegate];
}

id objc_msgSend_indexGreaterThanIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexGreaterThanIndex:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexOfObjectWithOptions_passingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectWithOptions:passingTest:");
}

id objc_msgSend_indexPathByRemovingLastIndex(void *a1, const char *a2, ...)
{
  return _[a1 indexPathByRemovingLastIndex];
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForRow:inSection:];
}

id objc_msgSend_indexPathInvalidatingIndexesFollowingPosition_(void *a1, const char *a2, ...)
{
  return [a1 indexPathInvalidatingIndexesFollowingPosition:];
}

id objc_msgSend_indexSearchableItems_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSearchableItems:completionHandler:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initFileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 initFileURLWithPath:isDirectory:];
}

id objc_msgSend_initForAvocadoIdentifier_inBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initForAvocadoIdentifier:inBundleIdentifier:];
}

id objc_msgSend_initForTestingWithTagType_identifier_name_(void *a1, const char *a2, ...)
{
  return [a1 initForTestingWithTagType:identifier:name:];
}

id objc_msgSend_initWithANFContent_headline_resourceManager_cloudContext_embedConfigurationManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithANFContent:headline:resourceManager:cloudContext:embedConfigurationManager:];
}

id objc_msgSend_initWithAccount_clearReadingHistoryManager_personalizationData_analyticsController_newsletterManager_userEventHistoryStorage_userActivityManager_clearableUserEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:clearReadingHistoryManager:personalizationData:analyticsController:newsletterManager:userEventHistoryStorage:userActivityManager:clearableUserEmbedding:");
}

id objc_msgSend_initWithActivity_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivity:identifier:];
}

id objc_msgSend_initWithActivity_identifier_object_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivity:identifier:object:];
}

id objc_msgSend_initWithAggregates_scoringType_decayRate_(void *a1, const char *a2, ...)
{
  return [a1 initWithAggregates:scoringType:decayRate:];
}

id objc_msgSend_initWithAnalyticsController_appActivityMonitor_cloudContext_window_(void *a1, const char *a2, ...)
{
  return [a1 initWithAnalyticsController:appActivityMonitor:cloudContext:window:];
}

id objc_msgSend_initWithAnalyticsReferralFactory_redirectService_(void *a1, const char *a2, ...)
{
  return [a1 initWithAnalyticsReferralFactory:redirectService:];
}

id objc_msgSend_initWithAnalyticsReferralFactory_redirectService_routerManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithAnalyticsReferralFactory:redirectService:routerManager:];
}

id objc_msgSend_initWithAppActivationMonitor_configurationManager_networkBehaviorMonitor_(void *a1, const char *a2, ...)
{
  return [a1 initWithAppActivationMonitor:configurationManager:networkBehaviorMonitor:];
}

id objc_msgSend_initWithAppActivityMonitor_(void *a1, const char *a2, ...)
{
  return [a1 initWithAppActivityMonitor:];
}

id objc_msgSend_initWithAppConfigManager_andResourceManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithAppConfigManager:andResourceManager:];
}

id objc_msgSend_initWithAppConfigManager_readingList_readingHistory_(void *a1, const char *a2, ...)
{
  return [a1 initWithAppConfigManager:readingList:readingHistory:];
}

id objc_msgSend_initWithAppConfigurationManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithAppConfigurationManager:];
}

id objc_msgSend_initWithAppConfigurationManager_tagController_subscriptionController_purchaseController_notificationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppConfigurationManager:tagController:subscriptionController:purchaseController:notificationManager:");
}

id objc_msgSend_initWithApplication_(void *a1, const char *a2, ...)
{
  return [a1 initWithApplication:];
}

id objc_msgSend_initWithApplication_bridgedAppDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithApplication:bridgedAppDelegate:];
}

id objc_msgSend_initWithArticleController_dataProviderFactory_articleEditorialItemProvider_editorialItemEntryManager_thumbnailCreator_editorialItemCreator_(void *a1, const char *a2, ...)
{
  return [a1 initWithArticleController:dataProviderFactory:articleEditorialItemProvider:editorialItemEntryManager:thumbnailCreator:editorialItemCreator:];
}

id objc_msgSend_initWithArticleID_sourceChannelID_sectionData_flintDocumentAssetHandle_articleRecordData_sourceChannelRecordData_parentIssueRecordData_(void *a1, const char *a2, ...)
{
  return [a1 initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:];
}

id objc_msgSend_initWithArticleRecordData_sourceChannel_parentIssue_assetManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithArticleRecordData:sourceChannel:parentIssue:assetManager:];
}

id objc_msgSend_initWithAssetHandles_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetHandles:];
}

id objc_msgSend_initWithAssetManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetManager:];
}

id objc_msgSend_initWithBackgroundTaskable_(void *a1, const char *a2, ...)
{
  return [a1 initWithBackgroundTaskable:];
}

id objc_msgSend_initWithBackgroundTaskable_applicationProxy_(void *a1, const char *a2, ...)
{
  return [a1 initWithBackgroundTaskable:applicationProxy:];
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithBase64EncodedString:options:];
}

id objc_msgSend_initWithBlockedReason_(void *a1, const char *a2, ...)
{
  return [a1 initWithBlockedReason:];
}

id objc_msgSend_initWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return [a1 initWithCGImage:scale:orientation:];
}

id objc_msgSend_initWithCacheDirectory_(void *a1, const char *a2, ...)
{
  return [a1 initWithCacheDirectory:];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithCapacity_dictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:dictionary:];
}

id objc_msgSend_initWithClientContext_presentingViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientContext:presentingViewController:];
}

id objc_msgSend_initWithCloudContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithCloudContext:];
}

id objc_msgSend_initWithCloudContext_activityMonitor_editorialItemEntryManager_articleEditorialItemDownloader_tagEditorialItemDownloader_editorialConfigurationProvider_thumbnailCreator_ANFHelper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCloudContext:activityMonitor:editorialItemEntryManager:articleEditorialItemDownloader:tagEditorialItemDownloader:editorialConfigurationProvider:thumbnailCreator:ANFHelper:");
}

id objc_msgSend_initWithCloudContext_articleContentPool_(void *a1, const char *a2, ...)
{
  return [a1 initWithCloudContext:articleContentPool:];
}

id objc_msgSend_initWithCloudContext_configurationManager_appActivityMonitor_networkBehaviorMonitor_offlineModeMonitor_(void *a1, const char *a2, ...)
{
  return [a1 initWithCloudContext:configurationManager:appActivityMonitor:networkBehaviorMonitor:offlineModeMonitor:];
}

id objc_msgSend_initWithCloudContext_dataProviderFactory_(void *a1, const char *a2, ...)
{
  return [a1 initWithCloudContext:dataProviderFactory:];
}

id objc_msgSend_initWithCloudContext_resourceManager_embedConfigurationManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithCloudContext:resourceManager:embedConfigurationManager:];
}

id objc_msgSend_initWithCloudContext_storePath_(void *a1, const char *a2, ...)
{
  return [a1 initWithCloudContext:storePath:];
}

id objc_msgSend_initWithColor_(void *a1, const char *a2, ...)
{
  return [a1 initWithColor:];
}

id objc_msgSend_initWithConfiguration_configurationManager_contentHostDirectory_privateDataHostDirectory_privateDataActionProvider_networkBehaviorMonitor_networkReachability_appActivityMonitor_desiredHeadlineFieldOptions_feedUsage_deviceIsiPad_backgroundTaskable_privateDataSyncAvailability_pptContext_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:privateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOptions:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:];
}

id objc_msgSend_initWithConfigurationManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfigurationManager:];
}

id objc_msgSend_initWithConfigurationManager_resourceManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfigurationManager:resourceManager:];
}

id objc_msgSend_initWithConstructor_(void *a1, const char *a2, ...)
{
  return [a1 initWithConstructor];
}

id objc_msgSend_initWithContentContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentContext:];
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfURL:];
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:];
}

id objc_msgSend_initWithContext_ANFHelper_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:ANFHelper:];
}

id objc_msgSend_initWithContext_ANFHelper_articleDownloadService_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:ANFHelper:articleDownloadService:];
}

id objc_msgSend_initWithContext_ANFHelper_articleID_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:ANFHelper:articleID:];
}

id objc_msgSend_initWithContext_articleIDs_ignoreCacheForArticleIDs_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:];
}

id objc_msgSend_initWithContext_contentVariantProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:contentVariantProvider:];
}

id objc_msgSend_initWithContext_privateDataUpdateCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:privateDataUpdateCoordinator:];
}

id objc_msgSend_initWithContext_resourceIDs_downloadAssets_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:];
}

id objc_msgSend_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_appShortVersionString_buildNumberString_networkBehaviorMonitor_appActivityMonitor_applicationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:appShortVersionString:buildNumberString:networkBehaviorMonitor:appActivityMonitor:applicationState:");
}

id objc_msgSend_initWithCoreDuetLastQueryDate_portraitLastQueryDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithCoreDuetLastQueryDate:portraitLastQueryDate:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:context:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:encoding:];
}

id objc_msgSend_initWithData_sourceChannel_assetManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:sourceChannel:assetManager:];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDelegate_delegateProtocol_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:delegateProtocol:];
}

id objc_msgSend_initWithDelegate_maxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:maxConcurrentOperationCount:];
}

id objc_msgSend_initWithDiagnosticDumpDir_diagnosticDumpNotificationName_diagnosticFilesNotificationName_diagnosticFileListURL_log_(void *a1, const char *a2, ...)
{
  return [a1 initWithDiagnosticDumpDir:diagnosticDumpDir diagnosticDumpNotificationName:diagnosticDumpNotificationName diagnosticFilesNotificationName:diagnosticFilesNotificationName diagnosticFileListURL:diagnosticFileListURL log:log];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithEditorialItemEntryManager_thumbnailCreator_editorialItemCreator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEditorialItemEntryManager:thumbnailCreator:editorialItemCreator:");
}

id objc_msgSend_initWithEditorialItemID_title_subtitle_subtitleColorString_image_actionUrlString_lastModifiedDate_documentVersion_lastSeenDocumentVersion_showBadge_(void *a1, const char *a2, ...)
{
  return [a1 initWithEditorialItemID:title:subtitle:subtitleColorString:image:actionUrlString:lastModifiedDate:documentVersion:lastSeenDocumentVersion:showBadge:];
}

id objc_msgSend_initWithEncodableElement_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEncodableElement:assetHandlesByRemoteURL:");
}

id objc_msgSend_initWithEntryID_dictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return [a1 initWithEntryID:dictionaryRepresentation:];
}

id objc_msgSend_initWithEntryID_editorialItemID_title_subtitle_subtitleColorString_image_actionUrlString_lastModifiedDate_documentVersion_lastSeenDocumentVersion_showBadge_(void *a1, const char *a2, ...)
{
  return [a1 initWithEntryID:editorialItemID:title:subtitle:subtitleColorString:image:actionUrlString:lastModifiedDate:documentVersion:lastSeenDocumentVersion:showBadge:];
}

id objc_msgSend_initWithExplicitlyEngagedStrings_explicitlyRejectedStrings_implicitlyEngagedStrings_implicitlyRejectedStrings_mappingId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:mappingId:");
}

id objc_msgSend_initWithFeedPersonalizer_purchaseController_subscriptionController_localNewsChannelService_bundleSubscriptionManager_personalizationDataGenerator_privateDataContext_userEmbeddingGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeedPersonalizer:purchaseController:subscriptionController:localNewsChannelService:bundleSubscriptionManager:personalizationDataGenerator:privateDataContext:userEmbeddingGenerator:");
}

id objc_msgSend_initWithFeldsparContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeldsparContext:];
}

id objc_msgSend_initWithFeldsparContext_assetManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeldsparContext:assetManager:];
}

id objc_msgSend_initWithFeldsparContext_bridgedAppDelegate_window_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeldsparContext:bridgedAppDelegate:window:];
}

id objc_msgSend_initWithFeldsparContext_dataProviderFactory_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeldsparContext:dataProviderFactory:];
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileURL:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithGenerator_configurationManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithGenerator:configurationManager:];
}

id objc_msgSend_initWithHeadline_(void *a1, const char *a2, ...)
{
  return [a1 initWithHeadline:];
}

id objc_msgSend_initWithHeadline_component_priority_(void *a1, const char *a2, ...)
{
  return [a1 initWithHeadline:component:priority:];
}

id objc_msgSend_initWithIdentifier_displayString_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:displayString:];
}

id objc_msgSend_initWithIdentifier_shareURL_JSONData_resourceDataSource_host_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:shareURL:JSONData:resourceDataSource:host:error:];
}

id objc_msgSend_initWithIdentifier_title_subtitle_subtitleColor_attributes_actionURL_thumbnailImage_backingTag_headline_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:title:subtitle:subtitleColor:attributes:actionURL:thumbnailImage:backingTag:headline:];
}

id objc_msgSend_initWithIdentifier_title_subtitle_subtitleColorString_actionUrlString_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:title:subtitle:subtitleColorString:actionUrlString:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithImageIdentifier_imageQualities_url_size_preserveColorspace_loadingBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:];
}

id objc_msgSend_initWithItemContentType_(void *a1, const char *a2, ...)
{
  return [a1 initWithItemContentType:];
}

id objc_msgSend_initWithItemProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithItemProvider:];
}

id objc_msgSend_initWithJSONArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithJSONArray:];
}

id objc_msgSend_initWithKeyValueStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeyValueStore:];
}

id objc_msgSend_initWithLoadJSONOnce_loadFontsOnce_loadAssetURLsOnce_loadAssetsOnce_loadLinkedContentOnce_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLoadJSONOnce:loadFontsOnce:loadAssetURLsOnce:loadAssetsOnce:loadLinkedContentOnce:");
}

id objc_msgSend_initWithLocalStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithLocalStore:];
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:options:];
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:];
}

id objc_msgSend_initWithName_directory_version_options_classRegistry_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:directory:version:options:classRegistry:];
}

id objc_msgSend_initWithNetworkReachability_(void *a1, const char *a2, ...)
{
  return [a1 initWithNetworkReachability:];
}

id objc_msgSend_initWithNewsAppConfigurationManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithNewsAppConfigurationManager:];
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return [a1 initWithNibName:nil bundle:nil];
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return [a1 initWithObject:];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithOptions:];
}

id objc_msgSend_initWithPBBundleIDMapping_(void *a1, const char *a2, ...)
{
  return [a1 initWithPBBundleIDMapping:];
}

id objc_msgSend_initWithPBFavorabilityScores_(void *a1, const char *a2, ...)
{
  return [a1 initWithPBFavorabilityScores:];
}

id objc_msgSend_initWithPBPersonalizationWhitelist_(void *a1, const char *a2, ...)
{
  return [a1 initWithPBPersonalizationWhitelist:];
}

id objc_msgSend_initWithPBURLMapping_(void *a1, const char *a2, ...)
{
  return [a1 initWithPBURLMapping:];
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:];
}

id objc_msgSend_initWithPersistenceEnabled_(void *a1, const char *a2, ...)
{
  return [a1 initWithPersistenceEnabled:];
}

id objc_msgSend_initWithPrivateDataActionProvider_defaultsDataDestructionItems_(void *a1, const char *a2, ...)
{
  return [a1 initWithPrivateDataActionProvider:defaultsDataDestructionItems:];
}

id objc_msgSend_initWithQualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 initWithQualityOfService:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithResolver_(void *a1, const char *a2, ...)
{
  return [a1 initWithResolver:];
}

id objc_msgSend_initWithResolver_appConfigManager_privateDataContext_subscriptionController_privateDataUpdateCoordinator_todayAgent_(void *a1, const char *a2, ...)
{
  return [a1 initWithResolver:appConfigManager:privateDataContext:subscriptionController:privateDataUpdateCoordinator:todayAgent:];
}

id objc_msgSend_initWithSelectedArticleID_articleIDs_prefetchedHeadlines_(void *a1, const char *a2, ...)
{
  return [a1 initWithSelectedArticleID:articleIDs:prefetchedHeadlines:];
}

id objc_msgSend_initWithSize_format_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:format:];
}

id objc_msgSend_initWithStoreDirectoryFileURL_appActivityMonitor_backgroundTaskable_(void *a1, const char *a2, ...)
{
  return [a1 initWithStoreDirectoryFileURL:appActivityMonitor:backgroundTaskable:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:attributes:];
}

id objc_msgSend_initWithTagController_editorialItemEntryManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithTagController:editorialItemEntryManager:];
}

id objc_msgSend_initWithTagRanker_(void *a1, const char *a2, ...)
{
  return [a1 initWithTagRanker:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTarget_selector_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:selector:];
}

id objc_msgSend_initWithThumbnailCreator_(void *a1, const char *a2, ...)
{
  return [a1 initWithThumbnailCreator:];
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:];
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:resolvingAgainstBaseURL:];
}

id objc_msgSend_initWithUniqueIdentifier_domainIdentifier_attributeSet_(void *a1, const char *a2, ...)
{
  return [a1 initWithUniqueIdentifier:domainIdentifier:attributeSet:];
}

id objc_msgSend_initWithUserActivityType_creativeID_campaignID_campaignType_referringApplication_referringURL_appOpenedByUserActivity_widgetModeGroupID_widgetEngagement_appSessionStartMethod_appSessionStartNotificationType_(void *a1, const char *a2, ...)
{
  return [a1 initWithUserActivityType:creativeID:campaignID:campaignType:referringApplication:referringURL:appOpenedByUserActivity:widgetModeGroupID:widgetEngagement:appSessionStartMethod:appSessionStartNotificationType:];
}

id objc_msgSend_initWithUserDefaults_domainName_stickyKeys_(void *a1, const char *a2, ...)
{
  return [a1 initWithUserDefaults:nil domainName:nil stickyKeys:nil];
}

id objc_msgSend_initWithUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithUserInfo:];
}

id objc_msgSend_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:");
}

id objc_msgSend_initWithVersionHelpers_appActivityMonitor_(void *a1, const char *a2, ...)
{
  return [a1 initWithVersionHelpers:appActivityMonitor:];
}

id objc_msgSend_initWithWithXS_S_M_L_XL_XXL_XXXL_AM_AL_AXL_AXXL_AXXXL_(void *a1, const char *a2, ...)
{
  return [a1 initWithWithXS:S:M:L:XL:XXL:XXXL:AM:AL:AXL:AXXL:AXXXL:];
}

id objc_msgSend_initializeLoadingGroup(void *a1, const char *a2, ...)
{
  return _[a1 initializeLoadingGroup];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_insetsForCollectionViewBounds_(void *a1, const char *a2, ...)
{
  return [a1 insetsForCollectionViewBounds:];
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return [a1 instancesRespondToSelector:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return [a1 integerForKey:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interestTokens(void *a1, const char *a2, ...)
{
  return _[a1 interestTokens];
}

id objc_msgSend_interests(void *a1, const char *a2, ...)
{
  return _[a1 interests];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_internalSignalAutoFavoriteCandidates(void *a1, const char *a2, ...)
{
  return _[a1 internalSignalAutoFavoriteCandidates];
}

id objc_msgSend_internalUsageSignalWeight(void *a1, const char *a2, ...)
{
  return _[a1 internalUsageSignalWeight];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isANFDocumentCached(void *a1, const char *a2, ...)
{
  return _[a1 isANFDocumentCached];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAlertPresentationIntervalPassed(void *a1, const char *a2, ...)
{
  return _[a1 isAlertPresentationIntervalPassed];
}

id objc_msgSend_isAppUpdateRequired(void *a1, const char *a2, ...)
{
  return _[a1 isAppUpdateRequired];
}

id objc_msgSend_isArticleOnReadingList_(void *a1, const char *a2, ...)
{
  return [a1 isArticleOnReadingList:];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isBackgroundFetchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isBackgroundFetchEnabled];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isCloudKitReachable(void *a1, const char *a2, ...)
{
  return _[a1 isCloudKitReachable];
}

id objc_msgSend_isDateInToday_(void *a1, const char *a2, ...)
{
  return [a1 isDateInToday:];
}

id objc_msgSend_isDateInYesterday_(void *a1, const char *a2, ...)
{
  return [a1 isDateInYesterday:];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _[a1 isDeleted];
}

id objc_msgSend_isDeviceAbandoned(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceAbandoned];
}

id objc_msgSend_isDeviceLocked(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceLocked];
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return _[a1 isDirty];
}

id objc_msgSend_isDocumentLocallyAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isDocumentLocallyAvailable];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFaceTimeAudioURL(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeAudioURL];
}

id objc_msgSend_isFaceTimeURL(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeURL];
}

id objc_msgSend_isHeadlineDraggable_(void *a1, const char *a2, ...)
{
  return [a1 isHeadlineDraggable:];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isLowDataModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowDataModeEnabled];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMainFrame(void *a1, const char *a2, ...)
{
  return _[a1 isMainFrame];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkReachable];
}

id objc_msgSend_isOSUpdateRequired(void *a1, const char *a2, ...)
{
  return _[a1 isOSUpdateRequired];
}

id objc_msgSend_isOnDisk(void *a1, const char *a2, ...)
{
  return _[a1 isOnDisk];
}

id objc_msgSend_isPaid(void *a1, const char *a2, ...)
{
  return _[a1 isPaid];
}

id objc_msgSend_isPrefetchDisabled(void *a1, const char *a2, ...)
{
  return _[a1 isPrefetchDisabled];
}

id objc_msgSend_isPresenting(void *a1, const char *a2, ...)
{
  return _[a1 isPresenting];
}

id objc_msgSend_isPresentingAlert(void *a1, const char *a2, ...)
{
  return _[a1 isPresentingAlert];
}

id objc_msgSend_isPrivateDataSyncingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isPrivateDataSyncingEnabled];
}

id objc_msgSend_isPromotingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isPromotingEnabled];
}

id objc_msgSend_isRunningInSupportedRegion(void *a1, const char *a2, ...)
{
  return _[a1 isRunningInSupportedRegion];
}

id objc_msgSend_isRunningPPT(void *a1, const char *a2, ...)
{
  return _[a1 isRunningPPT];
}

id objc_msgSend_isRunningTest(void *a1, const char *a2, ...)
{
  return _[a1 isRunningTest];
}

id objc_msgSend_isSports(void *a1, const char *a2, ...)
{
  return _[a1 isSports];
}

id objc_msgSend_isSpringboardHandledURL(void *a1, const char *a2, ...)
{
  return _[a1 isSpringboardHandledURL];
}

id objc_msgSend_isSubscribable(void *a1, const char *a2, ...)
{
  return _[a1 isSubscribable];
}

id objc_msgSend_isTagAllowed_(void *a1, const char *a2, ...)
{
  return [a1 isTagAllowed:];
}

id objc_msgSend_isUpdateRequired(void *a1, const char *a2, ...)
{
  return _[a1 isUpdateRequired];
}

id objc_msgSend_isUserIDLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isUserIDLoaded];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_issueReadingHistory(void *a1, const char *a2, ...)
{
  return _[a1 issueReadingHistory];
}

id objc_msgSend_itemChangeDelegate(void *a1, const char *a2, ...)
{
  return _[a1 itemChangeDelegate];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_jsonEncodableObject(void *a1, const char *a2, ...)
{
  return _[a1 jsonEncodableObject];
}

id objc_msgSend_keyValueStore(void *a1, const char *a2, ...)
{
  return _[a1 keyValueStore];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_key_window(void *a1, const char *a2, ...)
{
  return [a1 key_window];
}

id objc_msgSend_keyboardInputMonitor(void *a1, const char *a2, ...)
{
  return _[a1 keyboardInputMonitor];
}

id objc_msgSend_lastAppOpenDate(void *a1, const char *a2, ...)
{
  return _[a1 lastAppOpenDate];
}

id objc_msgSend_lastAppUsageAutoFavoriteResults(void *a1, const char *a2, ...)
{
  return _[a1 lastAppUsageAutoFavoriteResults];
}

id objc_msgSend_lastExternalSignalProcessingDate(void *a1, const char *a2, ...)
{
  return _[a1 lastExternalSignalProcessingDate];
}

id objc_msgSend_lastInternalSignalAutoFavorites(void *a1, const char *a2, ...)
{
  return _[a1 lastInternalSignalAutoFavorites];
}

id objc_msgSend_lastInternalSignalGroupableFavorites(void *a1, const char *a2, ...)
{
  return _[a1 lastInternalSignalGroupableFavorites];
}

id objc_msgSend_lastInternalSignalProcessingDate(void *a1, const char *a2, ...)
{
  return _[a1 lastInternalSignalProcessingDate];
}

id objc_msgSend_lastLocationAutoFavoriteResults(void *a1, const char *a2, ...)
{
  return _[a1 lastLocationAutoFavoriteResults];
}

id objc_msgSend_lastModified(void *a1, const char *a2, ...)
{
  return _[a1 lastModified];
}

id objc_msgSend_lastModifiedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastModifiedDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastPortraitAutoFavoriteResults(void *a1, const char *a2, ...)
{
  return _[a1 lastPortraitAutoFavoriteResults];
}

id objc_msgSend_lastSafariAutoFavoriteResults(void *a1, const char *a2, ...)
{
  return _[a1 lastSafariAutoFavoriteResults];
}

id objc_msgSend_lastSeenDocumentVersion(void *a1, const char *a2, ...)
{
  return _[a1 lastSeenDocumentVersion];
}

id objc_msgSend_lastVisitedDateForArticleID_(void *a1, const char *a2, ...)
{
  return [a1 lastVisitedDateForArticleID:];
}

id objc_msgSend_launchURLAction(void *a1, const char *a2, ...)
{
  return _[a1 launchURLAction];
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return _[a1 launchedToTest];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_lazyBundleIDMapping(void *a1, const char *a2, ...)
{
  return _[a1 lazyBundleIDMapping];
}

id objc_msgSend_lazyFavorabilityScores(void *a1, const char *a2, ...)
{
  return _[a1 lazyFavorabilityScores];
}

id objc_msgSend_lazyURLMapping(void *a1, const char *a2, ...)
{
  return _[a1 lazyURLMapping];
}

id objc_msgSend_lazyWhitelist(void *a1, const char *a2, ...)
{
  return _[a1 lazyWhitelist];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightColor(void *a1, const char *a2, ...)
{
  return _[a1 lightColor];
}

id objc_msgSend_lineHeightForSize_(void *a1, const char *a2, ...)
{
  return [a1 lineHeightForSize:];
}

id objc_msgSend_lineWidth(void *a1, const char *a2, ...)
{
  return _[a1 lineWidth];
}

id objc_msgSend_linkedArticleIDs(void *a1, const char *a2, ...)
{
  return _[a1 linkedArticleIDs];
}

id objc_msgSend_linkedHeadlines(void *a1, const char *a2, ...)
{
  return _[a1 linkedHeadlines];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_loadAnimatedImageFromImageData_size_(void *a1, const char *a2, ...)
{
  return [a1 loadAnimatedImageFromImageData:size:];
}

id objc_msgSend_loadArticleMetadataWithHeadline_editorialItemFromCache_content_articleModifiedDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadArticleMetadataWithHeadline:editorialItemFromCache:content:articleModifiedDate:completion:");
}

id objc_msgSend_loadAssetURLsOnce(void *a1, const char *a2, ...)
{
  return _[a1 loadAssetURLsOnce];
}

id objc_msgSend_loadAssetURLsWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadAssetURLsWithCompletionBlock:");
}

id objc_msgSend_loadAssetsOnce(void *a1, const char *a2, ...)
{
  return _[a1 loadAssetsOnce];
}

id objc_msgSend_loadAssetsWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 loadAssetsWithCompletionBlock:];
}

id objc_msgSend_loadContextWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 loadContextWithCompletionBlock:];
}

id objc_msgSend_loadFeldsparIDWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 loadFeldsparIDWithCompletion:];
}

id objc_msgSend_loadFontsOnce(void *a1, const char *a2, ...)
{
  return _[a1 loadFontsOnce];
}

id objc_msgSend_loadFontsWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 loadFontsWithCompletionBlock:];
}

id objc_msgSend_loadImagesForImageRequest_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 loadImagesForImageRequest:completionBlock:];
}

id objc_msgSend_loadJSONOnce(void *a1, const char *a2, ...)
{
  return _[a1 loadJSONOnce];
}

id objc_msgSend_loadJSONWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 loadJSONWithCompletionBlock:];
}

id objc_msgSend_loadLinkedContentOnce(void *a1, const char *a2, ...)
{
  return _[a1 loadLinkedContentOnce];
}

id objc_msgSend_loadLinkedContentWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 loadLinkedContentWithCompletionBlock:];
}

id objc_msgSend_loadOrRegenerateUserID(void *a1, const char *a2, ...)
{
  return _[a1 loadOrRegenerateUserID];
}

id objc_msgSend_loadOrRegenerateUserStartDate(void *a1, const char *a2, ...)
{
  return _[a1 loadOrRegenerateUserStartDate];
}

id objc_msgSend_loadStoreFrontWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 loadStoreFrontWithCompletionHandler:];
}

id objc_msgSend_loadedConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 loadedConfiguration];
}

id objc_msgSend_loadingBlock(void *a1, const char *a2, ...)
{
  return _[a1 loadingBlock];
}

id objc_msgSend_loadingGroup(void *a1, const char *a2, ...)
{
  return _[a1 loadingGroup];
}

id objc_msgSend_localAreasManager(void *a1, const char *a2, ...)
{
  return _[a1 localAreasManager];
}

id objc_msgSend_localNewsChannelService(void *a1, const char *a2, ...)
{
  return _[a1 localNewsChannelService];
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return _[a1 localStore];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_locationAutoFavoriteCandidates(void *a1, const char *a2, ...)
{
  return _[a1 locationAutoFavoriteCandidates];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return _[a1 locationManager];
}

id objc_msgSend_locationObserver(void *a1, const char *a2, ...)
{
  return _[a1 locationObserver];
}

id objc_msgSend_locations(void *a1, const char *a2, ...)
{
  return _[a1 locations];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logPPMessage_(void *a1, const char *a2, ...)
{
  return [a1 logPPMessage:];
}

id objc_msgSend_logoImageAssetHandle(void *a1, const char *a2, ...)
{
  return _[a1 logoImageAssetHandle];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_markAllPrivateDataControllersAsNeedingUpdate(void *a1, const char *a2, ...)
{
  return _[a1 markAllPrivateDataControllersAsNeedingUpdate];
}

id objc_msgSend_markArticleAsReadWithHeadline_(void *a1, const char *a2, ...)
{
  return [a1 markArticleAsReadWithHeadline:];
}

id objc_msgSend_markArticleAsSeenWithHeadline_(void *a1, const char *a2, ...)
{
  return [a1 markArticleAsSeenWithHeadline:];
}

id objc_msgSend_markArticleIdentifiersAsSaved_articleIdentifiersAsNotSaved_withReply_(void *a1, const char *a2, ...)
{
  return [a1 markArticleIdentifiersAsSaved:articleIdentifiersAsNotSaved:withReply:];
}

id objc_msgSend_markAsDirty(void *a1, const char *a2, ...)
{
  return _[a1 markAsDirty];
}

id objc_msgSend_max(void *a1, const char *a2, ...)
{
  return _[a1 max];
}

id objc_msgSend_maxExternalSignalEventCount(void *a1, const char *a2, ...)
{
  return _[a1 maxExternalSignalEventCount];
}

id objc_msgSend_maxForKey_(void *a1, const char *a2, ...)
{
  return [a1 maxForKey:];
}

id objc_msgSend_maxNumberOfSuggestions(void *a1, const char *a2, ...)
{
  return _[a1 maxNumberOfSuggestions];
}

id objc_msgSend_maxScreenSide(void *a1, const char *a2, ...)
{
  return _[a1 maxScreenSide];
}

id objc_msgSend_maybeConsiderPortrait(void *a1, const char *a2, ...)
{
  return _[a1 maybeConsiderPortrait];
}

id objc_msgSend_maybeUpdateOnboardingVersion_(void *a1, const char *a2, ...)
{
  return [a1 maybeUpdateOnboardingVersion:];
}

id objc_msgSend_mergedData(void *a1, const char *a2, ...)
{
  return _[a1 mergedData];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_metricMultiplierForTagID_withPriorFactorExponent_tagFavorabilityExponent_(void *a1, const char *a2, ...)
{
  return [a1 metricMultiplierForTagID:withPriorFactorExponent:tagFavorabilityExponent:];
}

id objc_msgSend_min(void *a1, const char *a2, ...)
{
  return _[a1 min];
}

id objc_msgSend_minForKey_(void *a1, const char *a2, ...)
{
  return [a1 minForKey:];
}

id objc_msgSend_minScreenSide(void *a1, const char *a2, ...)
{
  return _[a1 minScreenSide];
}

id objc_msgSend_minimumBackgroundFetchInterval(void *a1, const char *a2, ...)
{
  return _[a1 minimumBackgroundFetchInterval];
}

id objc_msgSend_minimumOSVersionNumberForUpdate(void *a1, const char *a2, ...)
{
  return _[a1 minimumOSVersionNumberForUpdate];
}

id objc_msgSend_minimumOSVersionStringForUpdate(void *a1, const char *a2, ...)
{
  return _[a1 minimumOSVersionStringForUpdate];
}

id objc_msgSend_minimumVersionNumber(void *a1, const char *a2, ...)
{
  return _[a1 minimumVersionNumber];
}

id objc_msgSend_minimumVersionString(void *a1, const char *a2, ...)
{
  return _[a1 minimumVersionString];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return _[a1 month];
}

id objc_msgSend_mostFrequentLocation(void *a1, const char *a2, ...)
{
  return _[a1 mostFrequentLocation];
}

id objc_msgSend_mostFrequentlyVisitedTags(void *a1, const char *a2, ...)
{
  return _[a1 mostFrequentlyVisitedTags];
}

id objc_msgSend_mostRecentlyReadArticlesWithMaxCount_(void *a1, const char *a2, ...)
{
  return [a1 mostRecentlyReadArticlesWithMaxCount:];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 moveItemAtURL:toURL:error:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableTags(void *a1, const char *a2, ...)
{
  return _[a1 mutableTags];
}

id objc_msgSend_mutedTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 mutedTagIDs];
}

id objc_msgSend_myEncodableElement(void *a1, const char *a2, ...)
{
  return _[a1 myEncodableElement];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameCompact(void *a1, const char *a2, ...)
{
  return _[a1 nameCompact];
}

id objc_msgSend_navigationType(void *a1, const char *a2, ...)
{
  return _[a1 navigationType];
}

id objc_msgSend_ne_color(void *a1, const char *a2, ...)
{
  return [a1 ne_color];
}

id objc_msgSend_networkBehaviorMonitor(void *a1, const char *a2, ...)
{
  return _[a1 networkBehaviorMonitor];
}

id objc_msgSend_networkReachability(void *a1, const char *a2, ...)
{
  return _[a1 networkReachability];
}

id objc_msgSend_newsletterManager(void *a1, const char *a2, ...)
{
  return _[a1 newsletterManager];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nf_objectsForKeysWithoutMarker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nf_objectsForKeysWithoutMarker:");
}

id objc_msgSend_nonDestructiveHaveBeenConsumed(void *a1, const char *a2, ...)
{
  return _[a1 nonDestructiveHaveBeenConsumed];
}

id objc_msgSend_notificationAutoEnableHelper(void *a1, const char *a2, ...)
{
  return _[a1 notificationAutoEnableHelper];
}

id objc_msgSend_notificationController(void *a1, const char *a2, ...)
{
  return _[a1 notificationController];
}

id objc_msgSend_notificationManager(void *a1, const char *a2, ...)
{
  return _[a1 notificationManager];
}

id objc_msgSend_notificationSettings(void *a1, const char *a2, ...)
{
  return _[a1 notificationSettings];
}

id objc_msgSend_notificationWithName_object_(void *a1, const char *a2, ...)
{
  return [a1 notificationWithName:object:];
}

id objc_msgSend_notificationsConfig(void *a1, const char *a2, ...)
{
  return _[a1 notificationsConfig];
}

id objc_msgSend_notificationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 notificationsEnabled];
}

id objc_msgSend_notifyDeviceTokenIsAvailable_(void *a1, const char *a2, ...)
{
  return [a1 notifyDeviceTokenIsAvailable:];
}

id objc_msgSend_notifyWhenUserIDHasBeenDeterminedWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyWhenUserIDHasBeenDeterminedWithBlock:");
}

id objc_msgSend_nss_NewsURLForArticleID_(void *a1, const char *a2, ...)
{
  return [a1 nss_NewsURLForArticleID:];
}

id objc_msgSend_nss_NewsURLForArticleID_title_(void *a1, const char *a2, ...)
{
  return [a1 nss_NewsURLForArticleID:title:];
}

id objc_msgSend_nss_NewsURLWithPathComponents_internal_(void *a1, const char *a2, ...)
{
  return [a1 nss_NewsURLWithPathComponents:internal:];
}

id objc_msgSend_nss_campaignID(void *a1, const char *a2, ...)
{
  return [a1 nss_campaignID];
}

id objc_msgSend_nss_gregorianDescriptionWithFlags_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 nss_gregorianDescriptionWithFlags:options:completion:];
}

id objc_msgSend_nss_isNewsURL(void *a1, const char *a2, ...)
{
  return [a1 nss_isNewsURL];
}

id objc_msgSend_numEventsToDisableDefaultTopics(void *a1, const char *a2, ...)
{
  return _[a1 numEventsToDisableDefaultTopics];
}

id objc_msgSend_numSubscriptionsToDisableDefaultTopics(void *a1, const char *a2, ...)
{
  return _[a1 numSubscriptionsToDisableDefaultTopics];
}

id objc_msgSend_numberOfColumnsForCollectionViewBounds_isCompact_orientation_(void *a1, const char *a2, ...)
{
  return [a1 numberOfColumnsForCollectionViewBounds:isCompact:orientation:];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLong:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForInfoDictionaryKey:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_observableMostFrequentLocation(void *a1, const char *a2, ...)
{
  return _[a1 observableMostFrequentLocation];
}

id objc_msgSend_observe_(void *a1, const char *a2, ...)
{
  return [a1 observe:];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_offlineModeMonitor(void *a1, const char *a2, ...)
{
  return _[a1 offlineModeMonitor];
}

id objc_msgSend_onboardingVersion(void *a1, const char *a2, ...)
{
  return _[a1 onboardingVersion];
}

id objc_msgSend_onboardingVersionNumber(void *a1, const char *a2, ...)
{
  return _[a1 onboardingVersionNumber];
}

id objc_msgSend_openApplication_options_withResult_(void *a1, const char *a2, ...)
{
  return [a1 openApplication:options:withResult:];
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:options:completionHandler:];
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return _[a1 operation];
}

id objc_msgSend_operationForConfigurationManager_resourceManager_(void *a1, const char *a2, ...)
{
  return [a1 operationForConfigurationManager:resourceManager:];
}

id objc_msgSend_operationID(void *a1, const char *a2, ...)
{
  return _[a1 operationID];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return _[a1 operationQueue];
}

id objc_msgSend_operationThrottler(void *a1, const char *a2, ...)
{
  return _[a1 operationThrottler];
}

id objc_msgSend_optionalTags(void *a1, const char *a2, ...)
{
  return _[a1 optionalTags];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orderedEditorialItemIDs(void *a1, const char *a2, ...)
{
  return _[a1 orderedEditorialItemIDs];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return _[a1 orderedSet];
}

id objc_msgSend_orderedSetWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 orderedSetWithObjects:];
}

id objc_msgSend_orderedSizeCategories(void *a1, const char *a2, ...)
{
  return _[a1 orderedSizeCategories];
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return _[a1 outputImage];
}

id objc_msgSend_overallOrder(void *a1, const char *a2, ...)
{
  return _[a1 overallOrder];
}

id objc_msgSend_paidAccessChecker(void *a1, const char *a2, ...)
{
  return _[a1 paidAccessChecker];
}

id objc_msgSend_parentIssueRecordData(void *a1, const char *a2, ...)
{
  return _[a1 parentIssueRecordData];
}

id objc_msgSend_parse(void *a1, const char *a2, ...)
{
  return _[a1 parse];
}

id objc_msgSend_passThroughTouches(void *a1, const char *a2, ...)
{
  return _[a1 passThroughTouches];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_peekAtActionTypes(void *a1, const char *a2, ...)
{
  return _[a1 peekAtActionTypes];
}

id objc_msgSend_peformBackgroundFetchWithReason_timeout_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 performBackgroundFetchWithReason:timeout:completionHandler:];
}

id objc_msgSend_performBlockWhenContentIsLoaded_(void *a1, const char *a2, ...)
{
  return [a1 performBlockWhenContentIsLoaded:];
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:];
}

id objc_msgSend_performSelector_withObject_withObject_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:withObject:];
}

id objc_msgSend_performWithLockSync_(void *a1, const char *a2, ...)
{
  return [a1 performWithLockSync:];
}

id objc_msgSend_performWithPrivateDataContext_(void *a1, const char *a2, ...)
{
  return [a1 performWithPrivateDataContext:];
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return [a1 performWithoutAnimation];
}

id objc_msgSend_persistStates(void *a1, const char *a2, ...)
{
  return _[a1 persistStates];
}

id objc_msgSend_persistableProperties(void *a1, const char *a2, ...)
{
  return _[a1 persistableProperties];
}

id objc_msgSend_persistenceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 persistenceEnabled];
}

id objc_msgSend_persistenceQueue(void *a1, const char *a2, ...)
{
  return _[a1 persistenceQueue];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 persistentIdentifier];
}

id objc_msgSend_personalizationBundleIdMappingResourceId(void *a1, const char *a2, ...)
{
  return _[a1 personalizationBundleIdMappingResourceId];
}

id objc_msgSend_personalizationData(void *a1, const char *a2, ...)
{
  return _[a1 personalizationData];
}

id objc_msgSend_personalizationDataGenerator(void *a1, const char *a2, ...)
{
  return _[a1 personalizationDataGenerator];
}

id objc_msgSend_personalizationFavorabilityResourceId(void *a1, const char *a2, ...)
{
  return _[a1 personalizationFavorabilityResourceId];
}

id objc_msgSend_personalizationFeatureBundleForFeaturesGenerator_(void *a1, const char *a2, ...)
{
  return [a1 personalizationFeatureBundleForFeaturesGenerator:];
}

id objc_msgSend_personalizationTreatment(void *a1, const char *a2, ...)
{
  return _[a1 personalizationTreatment];
}

id objc_msgSend_personalizationUrlMappingResourceId(void *a1, const char *a2, ...)
{
  return _[a1 personalizationUrlMappingResourceId];
}

id objc_msgSend_personalizationValueWithBaseline_decayRate_(void *a1, const char *a2, ...)
{
  return [a1 personalizationValueWithBaseline:decayRate:];
}

id objc_msgSend_personalizationValueWithBaseline_decayRate_baselineClicksMultiplier_(void *a1, const char *a2, ...)
{
  return [a1 personalizationValueWithBaseline:baseline decayRate:decayRate baselineClicksMultiplier:baselineClicksMultiplier];
}

id objc_msgSend_personalizationWhitelistResourceId(void *a1, const char *a2, ...)
{
  return _[a1 personalizationWhitelistResourceId];
}

id objc_msgSend_pinAlertController(void *a1, const char *a2, ...)
{
  return _[a1 pinAlertController];
}

id objc_msgSend_placeholderChannelImageForCardOfSize_(void *a1, const char *a2, ...)
{
  return [a1 placeholderChannelImageForCardOfSize:];
}

id objc_msgSend_placeholderTopicImageForCardOfSize_(void *a1, const char *a2, ...)
{
  return [a1 placeholderTopicImageForCardOfSize:];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_pool(void *a1, const char *a2, ...)
{
  return _[a1 pool];
}

id objc_msgSend_popHighPriorityTaskInFlight(void *a1, const char *a2, ...)
{
  return _[a1 popHighPriorityTaskInFlight];
}

id objc_msgSend_popularTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 popularTagIDs];
}

id objc_msgSend_portrait(void *a1, const char *a2, ...)
{
  return _[a1 portrait];
}

id objc_msgSend_portraitAutoFavoriteCandidates(void *a1, const char *a2, ...)
{
  return _[a1 portraitAutoFavoriteCandidates];
}

id objc_msgSend_portraitDecayRate(void *a1, const char *a2, ...)
{
  return _[a1 portraitDecayRate];
}

id objc_msgSend_portraitDisabledTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 portraitDisabledTagIDs];
}

id objc_msgSend_portraitGlobalThreshold(void *a1, const char *a2, ...)
{
  return _[a1 portraitGlobalThreshold];
}

id objc_msgSend_portraitLastQueryDate(void *a1, const char *a2, ...)
{
  return _[a1 portraitLastQueryDate];
}

id objc_msgSend_portraitPriorFactorExponent(void *a1, const char *a2, ...)
{
  return _[a1 portraitPriorFactorExponent];
}

id objc_msgSend_portraitSignalWeight(void *a1, const char *a2, ...)
{
  return _[a1 portraitSignalWeight];
}

id objc_msgSend_portraitTagFavorabilityExponent(void *a1, const char *a2, ...)
{
  return _[a1 portraitTagFavorabilityExponent];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_possiblyUnfetchedAppConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 possiblyUnfetchedAppConfiguration];
}

id objc_msgSend_pptContext(void *a1, const char *a2, ...)
{
  return _[a1 pptContext];
}

id objc_msgSend_preSubscribedNotificationsChannelIDs(void *a1, const char *a2, ...)
{
  return _[a1 preSubscribedNotificationsChannelIDs];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithBlock:];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_preferredFormat(void *a1, const char *a2, ...)
{
  return _[a1 preferredFormat];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizationsFromArray:forPreferences:];
}

id objc_msgSend_prefetchConfig(void *a1, const char *a2, ...)
{
  return _[a1 prefetchConfig];
}

id objc_msgSend_prefetchQueue(void *a1, const char *a2, ...)
{
  return _[a1 prefetchQueue];
}

id objc_msgSend_prefetchRequestsByID(void *a1, const char *a2, ...)
{
  return _[a1 prefetchRequestsByID];
}

id objc_msgSend_prepareAggregatesForUseWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 prepareAggregatesForUseWithCompletionHandler:];
}

id objc_msgSend_prepareAppCacheSnapShot(void *a1, const char *a2, ...)
{
  return _[a1 prepareAppCacheSnapShot];
}

id objc_msgSend_prepareAutoFavoritesWithLanguageChange_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 prepareAutoFavoritesWithLanguageChange:completionHandler:];
}

id objc_msgSend_prepareFavoritesWithLanguageChange_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 prepareFavoritesWithLanguageChange:completionHandler:];
}

id objc_msgSend_prepareForUseWithApplicationDelegate_(void *a1, const char *a2, ...)
{
  return [a1 prepareForUseWithApplicationDelegate:];
}

id objc_msgSend_prepareForUseWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 prepareForUseWithCompletionHandler:];
}

id objc_msgSend_presentExplicitRestrictionAlertIfNeededOfType_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 presentExplicitRestrictionAlertIfNeededOfType:completionBlock:];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_preserveColorspace(void *a1, const char *a2, ...)
{
  return _[a1 preserveColorspace];
}

id objc_msgSend_presubscribeService(void *a1, const char *a2, ...)
{
  return _[a1 presubscribeService];
}

id objc_msgSend_presubscribeToChannelsIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 presubscribeToChannelsIfNeededWithCompletion:];
}

id objc_msgSend_presubscribedFeedIDs(void *a1, const char *a2, ...)
{
  return _[a1 presubscribedFeedIDs];
}

id objc_msgSend_prewarmAd(void *a1, const char *a2, ...)
{
  return _[a1 prewarmAd];
}

id objc_msgSend_prewarmStores(void *a1, const char *a2, ...)
{
  return _[a1 prewarmStores];
}

id objc_msgSend_prewarmTodayWithContext_(void *a1, const char *a2, ...)
{
  return [a1 prewarmTodayWithContext:];
}

id objc_msgSend_primaryLanguageCode(void *a1, const char *a2, ...)
{
  return _[a1 primaryLanguageCode];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_privateChannelMembershipController(void *a1, const char *a2, ...)
{
  return _[a1 privateChannelMembershipController];
}

id objc_msgSend_privateContainer(void *a1, const char *a2, ...)
{
  return _[a1 privateContainer];
}

id objc_msgSend_privateDataActionProvider(void *a1, const char *a2, ...)
{
  return _[a1 privateDataActionProvider];
}

id objc_msgSend_privateDataContext(void *a1, const char *a2, ...)
{
  return _[a1 privateDataContext];
}

id objc_msgSend_privateDataControllers(void *a1, const char *a2, ...)
{
  return _[a1 privateDataControllers];
}

id objc_msgSend_privateDataDirectory(void *a1, const char *a2, ...)
{
  return _[a1 privateDataDirectory];
}

id objc_msgSend_privateDataUpdateCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 privateDataUpdateCoordinator];
}

id objc_msgSend_processAppSignals_safariSignals_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAppSignals:safariSignals:completion:");
}

id objc_msgSend_processConfigurationWithJSON_completion_(void *a1, const char *a2, ...)
{
  return [a1 processConfigurationWithJSON:];
}

id objc_msgSend_processExistingData(void *a1, const char *a2, ...)
{
  return _[a1 processExistingData];
}

id objc_msgSend_processExternalAppUsageSignals_(void *a1, const char *a2, ...)
{
  return [a1 processExternalAppUsageSignals:];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processSafariSignals_(void *a1, const char *a2, ...)
{
  return [a1 processSafariSignals];
}

id objc_msgSend_progressivePersonalization(void *a1, const char *a2, ...)
{
  return _[a1 progressivePersonalization];
}

id objc_msgSend_pruneImagesOlderThan_(void *a1, const char *a2, ...)
{
  return [a1 pruneImagesOlderThan:];
}

id objc_msgSend_publicContainer(void *a1, const char *a2, ...)
{
  return _[a1 publicContainer];
}

id objc_msgSend_publishDate(void *a1, const char *a2, ...)
{
  return _[a1 publishDate];
}

id objc_msgSend_purchaseController(void *a1, const char *a2, ...)
{
  return _[a1 purchaseController];
}

id objc_msgSend_purchaseManager(void *a1, const char *a2, ...)
{
  return _[a1 purchaseManager];
}

id objc_msgSend_purchaseProvider(void *a1, const char *a2, ...)
{
  return _[a1 purchaseProvider];
}

id objc_msgSend_purchasedTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 purchasedTagIDs];
}

id objc_msgSend_pushHighPriorityTaskInFlight(void *a1, const char *a2, ...)
{
  return _[a1 pushHighPriorityTaskInFlight];
}

id objc_msgSend_puzzleController(void *a1, const char *a2, ...)
{
  return _[a1 puzzleController];
}

id objc_msgSend_puzzleHistory(void *a1, const char *a2, ...)
{
  return _[a1 puzzleHistory];
}

id objc_msgSend_puzzleTypeController(void *a1, const char *a2, ...)
{
  return _[a1 puzzleTypeController];
}

id objc_msgSend_qualities(void *a1, const char *a2, ...)
{
  return _[a1 qualities];
}

id objc_msgSend_qualityOfService(void *a1, const char *a2, ...)
{
  return _[a1 qualityOfService];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:options:];
}

id objc_msgSend_rankTagIDsDescending_(void *a1, const char *a2, ...)
{
  return [a1 rankTagIDsDescending:];
}

id objc_msgSend_readOnlyArray(void *a1, const char *a2, ...)
{
  return _[a1 readOnlyArray];
}

id objc_msgSend_readWriteWithAccessor_(void *a1, const char *a2, ...)
{
  return [a1 readWriteWithAccessor:];
}

id objc_msgSend_readingHistory(void *a1, const char *a2, ...)
{
  return _[a1 readingHistory];
}

id objc_msgSend_readingList(void *a1, const char *a2, ...)
{
  return _[a1 readingList];
}

id objc_msgSend_recentlyOpenedTags(void *a1, const char *a2, ...)
{
  return _[a1 recentlyOpenedTags];
}

id objc_msgSend_recordExposureEventForObserver_(void *a1, const char *a2, ...)
{
  return [a1 recordExposureEventForObserver:];
}

id objc_msgSend_recordExposureEventWithStartDate_(void *a1, const char *a2, ...)
{
  return [a1 recordExposureEventWithStartDate:];
}

id objc_msgSend_red(void *a1, const char *a2, ...)
{
  return _[a1 red];
}

id objc_msgSend_redirectService(void *a1, const char *a2, ...)
{
  return _[a1 redirectService];
}

id objc_msgSend_referralItem(void *a1, const char *a2, ...)
{
  return _[a1 referralItem];
}

id objc_msgSend_referredArticlesWithAssetManager_(void *a1, const char *a2, ...)
{
  return [a1 referredArticlesWithAssetManager:];
}

id objc_msgSend_referringApplication(void *a1, const char *a2, ...)
{
  return _[a1 referringApplication];
}

id objc_msgSend_referringURL(void *a1, const char *a2, ...)
{
  return _[a1 referringURL];
}

id objc_msgSend_refreshAndNotifyAboutSubscribedTags(void *a1, const char *a2, ...)
{
  return _[a1 refreshAndNotifyAboutSubscribedTags];
}

id objc_msgSend_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshAppConfigurationIfNeededWithCompletionQueue:refreshCompletion:");
}

id objc_msgSend_refreshAutoFavoritesInBackgroundDisregardingCache_(void *a1, const char *a2, ...)
{
  return [a1 refreshAutoFavoritesInBackgroundDisregardingCache:];
}

id objc_msgSend_refreshEditorialItems(void *a1, const char *a2, ...)
{
  return _[a1 refreshEditorialItems];
}

id objc_msgSend_refreshEditorialItemsWithItems_(void *a1, const char *a2, ...)
{
  return [a1 refreshEditorialItemsWithItems:];
}

id objc_msgSend_refreshOnboardingVersion_(void *a1, const char *a2, ...)
{
  return [a1 refreshOnboardingVersion:];
}

id objc_msgSend_refreshThrottler(void *a1, const char *a2, ...)
{
  return _[a1 refreshThrottler];
}

id objc_msgSend_registerClass_factory_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:factory:];
}

id objc_msgSend_registerClass_name_factory_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:name:factory:];
}

id objc_msgSend_registerDefaults(void *a1, const char *a2, ...)
{
  return _[a1 registerDefaults];
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return [a1 registerDefaults:];
}

id objc_msgSend_registerDeviceToken_deviceDigestMode_(void *a1, const char *a2, ...)
{
  return [a1 registerDeviceToken:deviceDigestMode:];
}

id objc_msgSend_registerFeedback_completion_(void *a1, const char *a2, ...)
{
  return [a1 registerFeedback:completion:];
}

id objc_msgSend_registerFontWithURL_error_(void *a1, const char *a2, ...)
{
  return [a1 registerFontWithURL:error:];
}

id objc_msgSend_registerForDeviceLockNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForDeviceLockNotifications];
}

id objc_msgSend_registerForRemoteNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForRemoteNotifications];
}

id objc_msgSend_registerProtocol_factory_(void *a1, const char *a2, ...)
{
  return [a1 registerProtocol:factory:];
}

id objc_msgSend_registerProtocol_name_factory_(void *a1, const char *a2, ...)
{
  return [a1 registerProtocol:name:factory:];
}

id objc_msgSend_registerSchemeForCustomProtocol_(void *a1, const char *a2, ...)
{
  return [a1 registerSchemeForCustomProtocol:];
}

id objc_msgSend_registerUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 registerUserInfo:];
}

id objc_msgSend_relativePriority(void *a1, const char *a2, ...)
{
  return _[a1 relativePriority];
}

id objc_msgSend_reloadTimeline(void *a1, const char *a2, ...)
{
  return _[a1 reloadTimeline];
}

id objc_msgSend_remoteDefaults(void *a1, const char *a2, ...)
{
  return _[a1 remoteDefaults];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_remoteURL(void *a1, const char *a2, ...)
{
  return _[a1 remoteURL];
}

id objc_msgSend_removeAllAutoFavoriteSubscriptions_(void *a1, const char *a2, ...)
{
  return [a1 removeAllAutoFavoriteSubscriptions];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return _[a1 removeAllPendingNotificationRequests];
}

id objc_msgSend_removeAnimationForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeAnimationForKey:];
}

id objc_msgSend_removeArticlesWithIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeArticlesWithIDs:");
}

id objc_msgSend_removeInterestInArticleWithID_(void *a1, const char *a2, ...)
{
  return [a1 removeInterestInArticleWithID:];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:error:];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeItemWithIdentifier];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removePrefetchInterestInHeadline_(void *a1, const char *a2, ...)
{
  return [a1 removePrefetchInterestInHeadline];
}

id objc_msgSend_removeStateObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeStateObserver:];
}

id objc_msgSend_removeSubscriptionToTag_(void *a1, const char *a2, ...)
{
  return [a1 removeSubscriptionToTag:];
}

id objc_msgSend_removeSubscriptionsWithTags_(void *a1, const char *a2, ...)
{
  return [a1 removeSubscriptionsWithTags:];
}

id objc_msgSend_renderInContext_(void *a1, const char *a2, ...)
{
  return [a1 renderInContext:];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return [a1 requestWithIdentifier:content:trigger:];
}

id objc_msgSend_requiredResourceIDs(void *a1, const char *a2, ...)
{
  return _[a1 requiredResourceIDs];
}

id objc_msgSend_requiredResourceURLs(void *a1, const char *a2, ...)
{
  return _[a1 requiredResourceURLs];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 resetIdentifier];
}

id objc_msgSend_resetUserIDs(void *a1, const char *a2, ...)
{
  return _[a1 resetUserIDs];
}

id objc_msgSend_resignSessionForSceneID_(void *a1, const char *a2, ...)
{
  return [a1 resignSessionForSceneID:];
}

id objc_msgSend_resolveAppSingletons(void *a1, const char *a2, ...)
{
  return _[a1 resolveAppSingletons];
}

id objc_msgSend_resolveClass_(void *a1, const char *a2, ...)
{
  return [a1 resolveClass:];
}

id objc_msgSend_resolveClass_name_(void *a1, const char *a2, ...)
{
  return [a1 resolveClass:name:];
}

id objc_msgSend_resolveProtocol_(void *a1, const char *a2, ...)
{
  return [a1 resolveProtocol:];
}

id objc_msgSend_resolveProtocol_name_(void *a1, const char *a2, ...)
{
  return [a1 resolveProtocol:name:];
}

id objc_msgSend_resolveURL_withQualityOfService_completion_(void *a1, const char *a2, ...)
{
  return [a1 resolveURL:withQualityOfService:completion:];
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 resolvedColorWithTraitCollection:];
}

id objc_msgSend_resolver(void *a1, const char *a2, ...)
{
  return _[a1 resolver];
}

id objc_msgSend_resourceID(void *a1, const char *a2, ...)
{
  return _[a1 resourceID];
}

id objc_msgSend_resourceManager(void *a1, const char *a2, ...)
{
  return _[a1 resourceManager];
}

id objc_msgSend_resourceURLTranslator(void *a1, const char *a2, ...)
{
  return _[a1 resourceURLTranslator];
}

id objc_msgSend_resourcesByID(void *a1, const char *a2, ...)
{
  return _[a1 resourcesByID];
}

id objc_msgSend_resourcesLock(void *a1, const char *a2, ...)
{
  return _[a1 resourcesLock];
}

id objc_msgSend_resultAutoFavorites(void *a1, const char *a2, ...)
{
  return _[a1 resultAutoFavorites];
}

id objc_msgSend_resultCursor(void *a1, const char *a2, ...)
{
  return _[a1 resultCursor];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retryHandler(void *a1, const char *a2, ...)
{
  return _[a1 retryHandler];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return _[a1 rootPath];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_routerManager(void *a1, const char *a2, ...)
{
  return _[a1 routerManager];
}

id objc_msgSend_routers(void *a1, const char *a2, ...)
{
  return _[a1 routers];
}

id objc_msgSend_runTest_options_(void *a1, const char *a2, ...)
{
  return [a1 runTest:options:];
}

id objc_msgSend_safariAutoFavoriteCandidates(void *a1, const char *a2, ...)
{
  return _[a1 safariAutoFavoriteCandidates];
}

id objc_msgSend_safariEventBlackoutSeconds(void *a1, const char *a2, ...)
{
  return _[a1 safariEventBlackoutSeconds];
}

id objc_msgSend_safariOccurrenceDecayMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 safariOccurrenceDecayMultiplier];
}

id objc_msgSend_safariPriorFactorExponent(void *a1, const char *a2, ...)
{
  return _[a1 safariPriorFactorExponent];
}

id objc_msgSend_safariSignalWeight(void *a1, const char *a2, ...)
{
  return _[a1 safariSignalWeight];
}

id objc_msgSend_safariTagFavorabilityExponent(void *a1, const char *a2, ...)
{
  return _[a1 safariTagFavorabilityExponent];
}

id objc_msgSend_safariTimeDecayMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 safariTimeDecayMultiplier];
}

id objc_msgSend_safeIsAppRunningInBackground(void *a1, const char *a2, ...)
{
  return _[a1 safeIsAppRunningInBackground];
}

id objc_msgSend_saveViewAppearanceDateForObserver_(void *a1, const char *a2, ...)
{
  return [a1 saveViewAppearanceDateForObserver:];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledValueForSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 scaledValueForSizeCategory:];
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return [a1 scanHexInt:];
}

id objc_msgSend_scanInt_(void *a1, const char *a2, ...)
{
  return [a1 scanInt:];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return _[a1 scanLocation];
}

id objc_msgSend_scanString_intoString_(void *a1, const char *a2, ...)
{
  return [a1 scanString:intoString:];
}

id objc_msgSend_scanUpToString_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToString:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_sceneSessionDictionary(void *a1, const char *a2, ...)
{
  return _[a1 sceneSessionDictionary];
}

id objc_msgSend_sceneSessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sceneSessionIdentifier];
}

id objc_msgSend_scheduleAnyFakeNotificationsFromInternalExtras_whenAppEntersBackground_(void *a1, const char *a2, ...)
{
  return [a1 scheduleAnyFakeNotificationsFromInternalExtras:whenAppEntersBackground:];
}

id objc_msgSend_scheduleLocalNotificationForArticleID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleLocalNotificationForArticleID:completion:");
}

id objc_msgSend_scheduleLocalNotificationforChannels_(void *a1, const char *a2, ...)
{
  return [a1 scheduleLocalNotificationforChannels:];
}

id objc_msgSend_scheduleLowPriorityBlock_(void *a1, const char *a2, ...)
{
  return [a1 scheduleLowPriorityBlock:];
}

id objc_msgSend_scheduleLowPriorityBlockForMainThread_(void *a1, const char *a2, ...)
{
  return [a1 scheduleLowPriorityBlockForMainThread];
}

id objc_msgSend_scheduleLowPriorityOperation_(void *a1, const char *a2, ...)
{
  return [a1 scheduleLowPriorityOperation];
}

id objc_msgSend_scheduleTasksWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 scheduleTasksWithOptions:];
}

id objc_msgSend_scheduledDeliverySetting(void *a1, const char *a2, ...)
{
  return _[a1 scheduledDeliverySetting];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_scoreForTagID_(void *a1, const char *a2, ...)
{
  return [a1 scoreForTagID:];
}

id objc_msgSend_scoresForTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 scoresForTagIDs:];
}

id objc_msgSend_scoresForTopicMapping_query_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoresForTopicMapping:query:error:");
}

id objc_msgSend_scoringType(void *a1, const char *a2, ...)
{
  return _[a1 scoringType];
}

id objc_msgSend_sectionOrder(void *a1, const char *a2, ...)
{
  return _[a1 sectionOrder];
}

id objc_msgSend_seenArticlesTransactions(void *a1, const char *a2, ...)
{
  return _[a1 seenArticlesTransactions];
}

id objc_msgSend_serviceWidgetIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 serviceWidgetIfNeededWithCompletion:];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionDidStartWithSessionID_sourceApplication_url_(void *a1, const char *a2, ...)
{
  return [a1 sessionDidStartWithSessionID:sourceApplication:url:];
}

id objc_msgSend_sessionInProgressForID_(void *a1, const char *a2, ...)
{
  return [a1 sessionInProgressForID:];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAXXXL_(void *a1, const char *a2, ...)
{
  return [a1 setAXXXL];
}

id objc_msgSend_setAccessRestrictedBecauseOfAppVersion_(void *a1, const char *a2, ...)
{
  return [a1 setAccessRestrictedBecauseOfAppVersion:];
}

id objc_msgSend_setAccessRestrictedBecauseOfDeviceAbandoned_(void *a1, const char *a2, ...)
{
  return [a1 setAccessRestrictedBecauseOfDeviceAbandoned:];
}

id objc_msgSend_setAccessRestrictedBecauseOfOSVersion_(void *a1, const char *a2, ...)
{
  return [a1 setAccessRestrictedBecauseOfOSVersion:];
}

id objc_msgSend_setActionURL_(void *a1, const char *a2, ...)
{
  return [a1 setActionURL:];
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return [a1 setActions:];
}

id objc_msgSend_setActivityMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setActivityMonitor:];
}

id objc_msgSend_setAggregateStore_(void *a1, const char *a2, ...)
{
  return [a1 setAggregateStore:];
}

id objc_msgSend_setAggregateStoreProvider_(void *a1, const char *a2, ...)
{
  return [a1 setAggregateStoreProvider:];
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:];
}

id objc_msgSend_setAlphabeticalTags_(void *a1, const char *a2, ...)
{
  return [a1 setAlphabeticalTags:];
}

id objc_msgSend_setAmsPushHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAmsPushHandler:];
}

id objc_msgSend_setAnalyticsController_(void *a1, const char *a2, ...)
{
  return [a1 setAnalyticsController:];
}

id objc_msgSend_setAnalyticsReferralFactory_(void *a1, const char *a2, ...)
{
  return [a1 setAnalyticsReferralFactory:];
}

id objc_msgSend_setAnimatedImage_(void *a1, const char *a2, ...)
{
  return [a1 setAnimatedImage:];
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationDuration:];
}

id objc_msgSend_setAppActivityMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setAppActivityMonitor:];
}

id objc_msgSend_setAppConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setAppConfiguration:];
}

id objc_msgSend_setAppOpenedByUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 setAppOpenedByUserActivity:];
}

id objc_msgSend_setAppSessionCloseObserver_(void *a1, const char *a2, ...)
{
  return [a1 setAppSessionCloseObserver:];
}

id objc_msgSend_setAppSessionStartMethod_(void *a1, const char *a2, ...)
{
  return [a1 setAppSessionStartMethod:];
}

id objc_msgSend_setAppSessionStartReferral_(void *a1, const char *a2, ...)
{
  return [a1 setAppSessionStartReferral:];
}

id objc_msgSend_setAppUsageAutoFavoriteCandidates_(void *a1, const char *a2, ...)
{
  return [a1 setAppUsageAutoFavoriteCandidates:];
}

id objc_msgSend_setApplicationIconBadgeNumber_(void *a1, const char *a2, ...)
{
  return [a1 setApplicationIconBadgeNumber:];
}

id objc_msgSend_setApplicationUpdateNotifier_(void *a1, const char *a2, ...)
{
  return [a1 setApplicationUpdateNotifier:];
}

id objc_msgSend_setArticleContentPool_(void *a1, const char *a2, ...)
{
  return [a1 setArticleContentPool:];
}

id objc_msgSend_setArticlePrefetchManager_(void *a1, const char *a2, ...)
{
  return [a1 setArticlePrefetchManager:];
}

id objc_msgSend_setAssociator_(void *a1, const char *a2, ...)
{
  return [a1 setAssociator:];
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return [a1 setAttachments:];
}

id objc_msgSend_setAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:];
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:ofItemAtPath:error:];
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:range:];
}

id objc_msgSend_setAutoEnableNotificationsIsPending_(void *a1, const char *a2, ...)
{
  return [a1 setAutoEnableNotificationsIsPending:];
}

id objc_msgSend_setAutoFavoriteTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 setAutoFavoriteTagIDs:];
}

id objc_msgSend_setAutoFavoriteTagIDsToScores_(void *a1, const char *a2, ...)
{
  return [a1 setAutoFavoriteTagIDsToScores:];
}

id objc_msgSend_setAutoFavorites_(void *a1, const char *a2, ...)
{
  return [a1 setAutoFavorites:];
}

id objc_msgSend_setAutoFavoritesCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAutoFavoritesCompletionHandler:];
}

id objc_msgSend_setAutoFavoritesCursor_(void *a1, const char *a2, ...)
{
  return [a1 setAutoFavoritesCursor];
}

id objc_msgSend_setAutofavorites_(void *a1, const char *a2, ...)
{
  return [a1 setAutofavorites:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundFetchInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundFetchInProgress:];
}

id objc_msgSend_setBackgroundFetchManager_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundFetchManager:];
}

id objc_msgSend_setBackgroundFetchScheduler_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundFetchScheduler:];
}

id objc_msgSend_setBadgeCount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeCount:withCompletionHandler:];
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return [a1 setBeginTime:];
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return [a1 setBody:];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return [a1 setBorderColor:];
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return [a1 setBorderWidth:];
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:];
}

id objc_msgSend_setBundleIDMapping_(void *a1, const char *a2, ...)
{
  return [a1 setBundleIDMapping:];
}

id objc_msgSend_setBundleIDMappingData_(void *a1, const char *a2, ...)
{
  return [a1 setBundleIDMappingData:];
}

id objc_msgSend_setBundleSubscription_(void *a1, const char *a2, ...)
{
  return [a1 setBundleSubscription:];
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObjectsFromArray:];
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return [a1 setCachePolicy:];
}

id objc_msgSend_setCachesInputImage_(void *a1, const char *a2, ...)
{
  return [a1 setCachesInputImage:];
}

id objc_msgSend_setCampaignID_(void *a1, const char *a2, ...)
{
  return [a1 setCampaignID:];
}

id objc_msgSend_setCampaignType_(void *a1, const char *a2, ...)
{
  return [a1 setCampaignType:];
}

id objc_msgSend_setCanonicalLanguage_(void *a1, const char *a2, ...)
{
  return [a1 setCanonicalLanguage:];
}

id objc_msgSend_setCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setCapacity:];
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCategoryIdentifier];
}

id objc_msgSend_setChannelFont_(void *a1, const char *a2, ...)
{
  return [a1 setChannelFont:];
}

id objc_msgSend_setChannelPlaceholderImage_(void *a1, const char *a2, ...)
{
  return [a1 setChannelPlaceholderImage:];
}

id objc_msgSend_setCharactersToBeSkipped_(void *a1, const char *a2, ...)
{
  return [a1 setCharactersToBeSkipped:];
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setClientIdentifier];
}

id objc_msgSend_setCloudContext_(void *a1, const char *a2, ...)
{
  return [a1 setCloudContext:];
}

id objc_msgSend_setColors_(void *a1, const char *a2, ...)
{
  return [a1 setColors:];
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionBlock:];
}

id objc_msgSend_setConfigurableValues_(void *a1, const char *a2, ...)
{
  return [a1 setConfigurableValues:];
}

id objc_msgSend_setConfigurationStore_(void *a1, const char *a2, ...)
{
  return [a1 setConfigurationStore:];
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return [a1 setContent:];
}

id objc_msgSend_setContentCreationDate_(void *a1, const char *a2, ...)
{
  return [a1 setContentCreationDate:];
}

id objc_msgSend_setContentDescription_(void *a1, const char *a2, ...)
{
  return [a1 setContentDescription:];
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return [a1 setContentsScale:];
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return [a1 setContext:];
}

id objc_msgSend_setCoreDuetLastQueryDate_(void *a1, const char *a2, ...)
{
  return [a1 setCoreDuetLastQueryDate:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCreativeID_(void *a1, const char *a2, ...)
{
  return [a1 setCreativeID:];
}

id objc_msgSend_setCursor_(void *a1, const char *a2, ...)
{
  return [a1 setCursor:];
}

id objc_msgSend_setDataProviderFactory_(void *a1, const char *a2, ...)
{
  return [a1 setDataProviderFactory:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDateLastOpened_(void *a1, const char *a2, ...)
{
  return [a1 setDateLastOpened:];
}

id objc_msgSend_setDecayRate_(void *a1, const char *a2, ...)
{
  return [a1 setDecayRate:];
}

id objc_msgSend_setDefaultCandidates_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultCandidates:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDestructiveHasBeenConsumed_(void *a1, const char *a2, ...)
{
  return [a1 setDestructiveHasBeenConsumed:];
}

id objc_msgSend_setDeviceManager_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceManager:];
}

id objc_msgSend_setDeviceToken_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceToken:];
}

id objc_msgSend_setDiagnosticFileCollector_(void *a1, const char *a2, ...)
{
  return [a1 setDiagnosticFileCollector:];
}

id objc_msgSend_setDisregardCache_(void *a1, const char *a2, ...)
{
  return [a1 setDisregardCache:];
}

id objc_msgSend_setEditorialItemsByID_(void *a1, const char *a2, ...)
{
  return [a1 setEditorialItemsByID:];
}

id objc_msgSend_setEmbedConfigurationData_(void *a1, const char *a2, ...)
{
  return [a1 setEmbedConfigurationData:];
}

id objc_msgSend_setEmbedConfigurationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setEmbedConfigurationIdentifier:];
}

id objc_msgSend_setEmbedConfigurationManager_(void *a1, const char *a2, ...)
{
  return [a1 setEmbedConfigurationManager:];
}

id objc_msgSend_setEmbedFetchCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setEmbedFetchCompletionBlock:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setEndPoint_(void *a1, const char *a2, ...)
{
  return [a1 setEndPoint:];
}

id objc_msgSend_setEntitlementsOverrideProvider_(void *a1, const char *a2, ...)
{
  return [a1 setEntitlementsOverrideProvider:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setExcludingSourceBundleIds_(void *a1, const char *a2, ...)
{
  return [a1 setExcludingSourceBundleIds:];
}

id objc_msgSend_setExecutionQueue_(void *a1, const char *a2, ...)
{
  return [a1 setExecutionQueue:];
}

id objc_msgSend_setExistingInternalSignalAutoFavoriteCandidates_(void *a1, const char *a2, ...)
{
  return [a1 setExistingInternalSignalAutoFavoriteCandidates:];
}

id objc_msgSend_setFavorabilityScores_(void *a1, const char *a2, ...)
{
  return [a1 setFavorabilityScores:];
}

id objc_msgSend_setFavorabilityScoresData_(void *a1, const char *a2, ...)
{
  return [a1 setFavorabilityScoresData:];
}

id objc_msgSend_setFavoritesPersonalizer_(void *a1, const char *a2, ...)
{
  return [a1 setFavoritesPersonalizer:];
}

id objc_msgSend_setFeaturesGenerator_(void *a1, const char *a2, ...)
{
  return [a1 setFeaturesGenerator:];
}

id objc_msgSend_setFeedOrder_(void *a1, const char *a2, ...)
{
  return [a1 setFeedOrder:];
}

id objc_msgSend_setFeedPersonalizer_(void *a1, const char *a2, ...)
{
  return [a1 setFeedPersonalizer:];
}

id objc_msgSend_setFeldsparContext_(void *a1, const char *a2, ...)
{
  return [a1 setFeldsparContext:];
}

id objc_msgSend_setFetchCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setFetchCompletionBlock:];
}

id objc_msgSend_setFetchCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setFetchCompletionHandler:];
}

id objc_msgSend_setFetchCompletionQueue_(void *a1, const char *a2, ...)
{
  return [a1 setFetchCompletionQueue:];
}

id objc_msgSend_setFileURL_(void *a1, const char *a2, ...)
{
  return [a1 setFileURL:];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return [a1 setFillColor:];
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return [a1 setFillMode:];
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return [a1 setFilters:];
}

id objc_msgSend_setFlintDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 setFlintDataProvider:];
}

id objc_msgSend_setFromDate_(void *a1, const char *a2, ...)
{
  return [a1 setFromDate:];
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return [a1 setFromValue:];
}

id objc_msgSend_setGizmoSyncManager_(void *a1, const char *a2, ...)
{
  return [a1 setGizmoSyncManager:];
}

id objc_msgSend_setGroupOrder_(void *a1, const char *a2, ...)
{
  return [a1 setGroupOrder:];
}

id objc_msgSend_setGroupableCandidates_(void *a1, const char *a2, ...)
{
  return [a1 setGroupableCandidates:];
}

id objc_msgSend_setGroupableFavoriteTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 setGroupableFavoriteTagIDs:];
}

id objc_msgSend_setGroupableTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 setGroupableTagIDs:];
}

id objc_msgSend_setHasBeenNotifiedOfApplicationLaunch_(void *a1, const char *a2, ...)
{
  return [a1 setHasBeenNotifiedOfApplicationLaunch:];
}

id objc_msgSend_setHeadline_(void *a1, const char *a2, ...)
{
  return [a1 setHeadline:];
}

id objc_msgSend_setHyphenationFactor_(void *a1, const char *a2, ...)
{
  return [a1 setHyphenationFactor:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setImageQuality_(void *a1, const char *a2, ...)
{
  return [a1 setImageQuality];
}

id objc_msgSend_setInPreviewMode_(void *a1, const char *a2, ...)
{
  return [a1 setInPreviewMode:];
}

id objc_msgSend_setIndexDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setIndexDelegate:];
}

id objc_msgSend_setInternalSignalAutoFavoriteCandidates_(void *a1, const char *a2, ...)
{
  return [a1 setInternalSignalAutoFavoriteCandidates];
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return [a1 setIsActive:];
}

id objc_msgSend_setIsDeviceLocked_(void *a1, const char *a2, ...)
{
  return [a1 setIsDeviceLocked:];
}

id objc_msgSend_setIsPresentingAlert_(void *a1, const char *a2, ...)
{
  return [a1 setIsPresentingAlert:];
}

id objc_msgSend_setIsUserIDLoaded_(void *a1, const char *a2, ...)
{
  return [a1 setIsUserIDLoaded:];
}

id objc_msgSend_setIssueViewingSessionManager_(void *a1, const char *a2, ...)
{
  return [a1 setIssueViewingSessionManager:];
}

id objc_msgSend_setKeyQueue_(void *a1, const char *a2, ...)
{
  return [a1 setKeyQueue:];
}

id objc_msgSend_setKeywords_(void *a1, const char *a2, ...)
{
  return [a1 setKeywords:];
}

id objc_msgSend_setL_(void *a1, const char *a2, ...)
{
  return [a1 setL:];
}

id objc_msgSend_setLanguages_(void *a1, const char *a2, ...)
{
  return [a1 setLanguages:];
}

id objc_msgSend_setLastAppUsageAutoFavoriteResults_(void *a1, const char *a2, ...)
{
  return [a1 setLastAppUsageAutoFavoriteResults:];
}

id objc_msgSend_setLastExternalSignalProcessingDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastExternalSignalProcessingDate:];
}

id objc_msgSend_setLastInternalSignalAutoFavorites_(void *a1, const char *a2, ...)
{
  return [a1 setLastInternalSignalAutoFavorites:];
}

id objc_msgSend_setLastInternalSignalGroupableFavorites_(void *a1, const char *a2, ...)
{
  return [a1 setLastInternalSignalGroupableFavorites:];
}

id objc_msgSend_setLastInternalSignalProcessingDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastInternalSignalProcessingDate:];
}

id objc_msgSend_setLastLocationAutoFavoriteResults_(void *a1, const char *a2, ...)
{
  return [a1 setLastLocationAutoFavoriteResults:];
}

id objc_msgSend_setLastPortraitAutoFavoriteResults_(void *a1, const char *a2, ...)
{
  return [a1 setLastPortraitAutoFavoriteResults:];
}

id objc_msgSend_setLastSafariAutoFavoriteResults_(void *a1, const char *a2, ...)
{
  return [a1 setLastSafariAutoFavoriteResults:];
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setLineBreakMode:];
}

id objc_msgSend_setLineSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setLineSpacing:];
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return [a1 setLineWidth:];
}

id objc_msgSend_setLinkedHeadlines_(void *a1, const char *a2, ...)
{
  return [a1 setLinkedHeadlines:];
}

id objc_msgSend_setLoadingGroup_(void *a1, const char *a2, ...)
{
  return [a1 setLoadingGroup:];
}

id objc_msgSend_setLocalAreasManager_(void *a1, const char *a2, ...)
{
  return [a1 setLocalAreasManager:];
}

id objc_msgSend_setLocalChannelsProvider_(void *a1, const char *a2, ...)
{
  return [a1 setLocalChannelsProvider:];
}

id objc_msgSend_setLocalRegionProvider_(void *a1, const char *a2, ...)
{
  return [a1 setLocalRegionProvider:];
}

id objc_msgSend_setLocationAutoFavoriteCandidates_(void *a1, const char *a2, ...)
{
  return [a1 setLocationAutoFavoriteCandidates:];
}

id objc_msgSend_setLocationManager_(void *a1, const char *a2, ...)
{
  return [a1 setLocationManager:];
}

id objc_msgSend_setLocationObserver_(void *a1, const char *a2, ...)
{
  return [a1 setLocationObserver:];
}

id objc_msgSend_setLocations_(void *a1, const char *a2, ...)
{
  return [a1 setLocations:];
}

id objc_msgSend_setMax_(void *a1, const char *a2, ...)
{
  return [a1 setMax:];
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConcurrentOperationCount:];
}

id objc_msgSend_setMin_(void *a1, const char *a2, ...)
{
  return [a1 setMin:];
}

id objc_msgSend_setMinimumBackgroundFetchInterval_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumBackgroundFetchInterval:];
}

id objc_msgSend_setMinimumLineHeight_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumLineHeight:];
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumPressDuration:];
}

id objc_msgSend_setMostFrequentlyVisitedTags_(void *a1, const char *a2, ...)
{
  return [a1 setMostFrequentlyVisitedTags:];
}

id objc_msgSend_setMutableTags_(void *a1, const char *a2, ...)
{
  return [a1 setMutableTags:];
}

id objc_msgSend_setMutedTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 setMutedTagIDs:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNamedLocation_(void *a1, const char *a2, ...)
{
  return [a1 setNamedLocation:];
}

id objc_msgSend_setNetworkBehaviorMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkBehaviorMonitor:];
}

id objc_msgSend_setNextAlertPresentationDate_(void *a1, const char *a2, ...)
{
  return [a1 setNextAlertPresentationDate:];
}

id objc_msgSend_setNonDestructiveHaveBeenConsumed_(void *a1, const char *a2, ...)
{
  return [a1 setNonDestructiveHaveBeenConsumed:];
}

id objc_msgSend_setNotificationAutoEnableHelper_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationAutoEnableHelper];
}

id objc_msgSend_setNotificationManager_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationManager:];
}

id objc_msgSend_setNotificationsEnabled_forTag_error_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationsEnabled:forTag:error:];
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:atIndexedSubscript:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOfflineArticleManagerProvider_(void *a1, const char *a2, ...)
{
  return [a1 setOfflineArticleManagerProvider:];
}

id objc_msgSend_setOfflineModeMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setOfflineModeMonitor:];
}

id objc_msgSend_setOnboardingVersion_(void *a1, const char *a2, ...)
{
  return [a1 setOnboardingVersion:];
}

id objc_msgSend_setOnboardingVersionNumber_(void *a1, const char *a2, ...)
{
  return [a1 setOnboardingVersionNumber:];
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setOpaque:];
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return [a1 setOptions:];
}

id objc_msgSend_setOrderedEditorialItemIDs_(void *a1, const char *a2, ...)
{
  return [a1 setOrderedEditorialItemIDs:];
}

id objc_msgSend_setOverrideDecayRate_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideDecayRate:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPinAlertController_(void *a1, const char *a2, ...)
{
  return [a1 setPinAlertController:];
}

id objc_msgSend_setPopularTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 setPopularTagIDs:];
}

id objc_msgSend_setPortraitAutoFavoriteCandidates_(void *a1, const char *a2, ...)
{
  return [a1 setPortraitAutoFavoriteCandidates:];
}

id objc_msgSend_setPortraitLastQueryDate_(void *a1, const char *a2, ...)
{
  return [a1 setPortraitLastQueryDate:];
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return [a1 setPosition:];
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredAction:];
}

id objc_msgSend_setPreferredRange_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredRange:];
}

id objc_msgSend_setPreferredRefreshDates_withReply_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredRefreshDates:withReply:];
}

id objc_msgSend_setPresenting_(void *a1, const char *a2, ...)
{
  return [a1 setPresenting:];
}

id objc_msgSend_setPresubscribeService_(void *a1, const char *a2, ...)
{
  return [a1 setPresubscribeService:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setPrivateDataControllers_(void *a1, const char *a2, ...)
{
  return [a1 setPrivateDataControllers:];
}

id objc_msgSend_setPrivateDataUpdateCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 setPrivateDataUpdateCoordinator:];
}

id objc_msgSend_setPurchaseFlowOverrideProvider_(void *a1, const char *a2, ...)
{
  return [a1 setPurchaseFlowOverrideProvider:];
}

id objc_msgSend_setPurchasedTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 setPurchasedTagIDs];
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return [a1 setPurpose:];
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 setQualityOfService:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setRankedAllSubscribedTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 setRankedAllSubscribedTagIDs:];
}

id objc_msgSend_setRankedAllSubscriptionDates_(void *a1, const char *a2, ...)
{
  return [a1 setRankedAllSubscriptionDates:];
}

id objc_msgSend_setRasterizationScale_(void *a1, const char *a2, ...)
{
  return [a1 setRasterizationScale:];
}

id objc_msgSend_setReadingHistory_(void *a1, const char *a2, ...)
{
  return [a1 setReadingHistory:];
}

id objc_msgSend_setReadingList_(void *a1, const char *a2, ...)
{
  return [a1 setReadingList:];
}

id objc_msgSend_setRecentlyOpenedTags_(void *a1, const char *a2, ...)
{
  return [a1 setRecentlyOpenedTags:];
}

id objc_msgSend_setRecentlyReadHistoryItems_(void *a1, const char *a2, ...)
{
  return [a1 setRecentlyReadHistoryItems:];
}

id objc_msgSend_setReferringApplication_(void *a1, const char *a2, ...)
{
  return [a1 setReferringApplication:];
}

id objc_msgSend_setReferringURL_(void *a1, const char *a2, ...)
{
  return [a1 setReferringURL:];
}

id objc_msgSend_setRelatedUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setRelatedUniqueIdentifier:];
}

id objc_msgSend_setRelativePriority_(void *a1, const char *a2, ...)
{
  return [a1 setRelativePriority:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setRemovedOnCompletion:];
}

id objc_msgSend_setRequiredResourceIDs_(void *a1, const char *a2, ...)
{
  return [a1 setRequiredResourceIDs:];
}

id objc_msgSend_setResolver_(void *a1, const char *a2, ...)
{
  return [a1 setResolver:];
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 setResourceValue:forKey:error:];
}

id objc_msgSend_setResultAutoFavorites_(void *a1, const char *a2, ...)
{
  return [a1 setResultAutoFavorites:];
}

id objc_msgSend_setResultCursor_(void *a1, const char *a2, ...)
{
  return [a1 setResultCursor:];
}

id objc_msgSend_setRetryHandler_(void *a1, const char *a2, ...)
{
  return [a1 setRetryHandler:];
}

id objc_msgSend_setRunningPPT_(void *a1, const char *a2, ...)
{
  return [a1 setRunningPPT:];
}

id objc_msgSend_setRunningPPTWithApplication_(void *a1, const char *a2, ...)
{
  return [a1 setRunningPPTWithApplication:];
}

id objc_msgSend_setSafariAutoFavoriteCandidates_(void *a1, const char *a2, ...)
{
  return [a1 setSafariAutoFavoriteCandidates];
}

id objc_msgSend_setSavedArticleIdentifiers_withReply_(void *a1, const char *a2, ...)
{
  return [a1 setSavedArticleIdentifiers:withReply:];
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return [a1 setScale:];
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return [a1 setScheme:];
}

id objc_msgSend_setSessionDuration_(void *a1, const char *a2, ...)
{
  return [a1 setSessionDuration:];
}

id objc_msgSend_setShouldPrefetchGlobalTags_(void *a1, const char *a2, ...)
{
  return [a1 setShouldPrefetchGlobalTags:];
}

id objc_msgSend_setShouldRasterize_(void *a1, const char *a2, ...)
{
  return [a1 setShouldRasterize:];
}

id objc_msgSend_setShowUIPrompt_(void *a1, const char *a2, ...)
{
  return [a1 setShowUIPrompt:];
}

id objc_msgSend_setSignalProcessingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 setSignalProcessingTimeInterval:];
}

id objc_msgSend_setSorter_(void *a1, const char *a2, ...)
{
  return [a1 setSorter:];
}

id objc_msgSend_setSpotlightManager_(void *a1, const char *a2, ...)
{
  return [a1 setSpotlightManager:];
}

id objc_msgSend_setStartPoint_(void *a1, const char *a2, ...)
{
  return [a1 setStartPoint:];
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeColor:];
}

id objc_msgSend_setSubscribedTagRanker_(void *a1, const char *a2, ...)
{
  return [a1 setSubscribedTagRanker:];
}

id objc_msgSend_setSubscriptionController_(void *a1, const char *a2, ...)
{
  return [a1 setSubscriptionController:];
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitle:];
}

id objc_msgSend_setSubtitleColor_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitleColor:];
}

id objc_msgSend_setSuggestedName_(void *a1, const char *a2, ...)
{
  return [a1 setSuggestedName:];
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return [a1 setSuspended:];
}

id objc_msgSend_setSuspendedDepth_(void *a1, const char *a2, ...)
{
  return [a1 setSuspendedDepth:];
}

id objc_msgSend_setSyncingWatchData_(void *a1, const char *a2, ...)
{
  return [a1 setSyncingWatchData:];
}

id objc_msgSend_setTabiBasedUserVectorAggregateVectorProvider_(void *a1, const char *a2, ...)
{
  return [a1 setTabiBasedUserVectorAggregateVectorProvider:];
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return [a1 setTag:];
}

id objc_msgSend_setTagController_(void *a1, const char *a2, ...)
{
  return [a1 setTagController:];
}

id objc_msgSend_setTagRanker_(void *a1, const char *a2, ...)
{
  return [a1 setTagRanker:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTextContent_(void *a1, const char *a2, ...)
{
  return [a1 setTextContent:];
}

id objc_msgSend_setThumbnailImage_(void *a1, const char *a2, ...)
{
  return [a1 setThumbnailImage:];
}

id objc_msgSend_setThumbnailURL_(void *a1, const char *a2, ...)
{
  return [a1 setThumbnailURL:];
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return [a1 setTimeStyle:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return [a1 setTimingFunction:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return [a1 setToValue:];
}

id objc_msgSend_setTodayAgent_(void *a1, const char *a2, ...)
{
  return [a1 setTodayAgent:];
}

id objc_msgSend_setTopicFont_(void *a1, const char *a2, ...)
{
  return [a1 setTopicFont:];
}

id objc_msgSend_setTopicPlaceholderImage_(void *a1, const char *a2, ...)
{
  return [a1 setTopicPlaceholderImage:];
}

id objc_msgSend_setTransformBlock_(void *a1, const char *a2, ...)
{
  return [a1 setTransformBlock:];
}

id objc_msgSend_setURLMappingData_(void *a1, const char *a2, ...)
{
  return [a1 setURLMappingData:];
}

id objc_msgSend_setUnderlyingImageCache_(void *a1, const char *a2, ...)
{
  return [a1 setUnderlyingImageCache:];
}

id objc_msgSend_setUrlMapping_(void *a1, const char *a2, ...)
{
  return [a1 setUrlMapping:];
}

id objc_msgSend_setUrlRouterManager_(void *a1, const char *a2, ...)
{
  return [a1 setUrlRouterManager:];
}

id objc_msgSend_setUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 setUserActivity:];
}

id objc_msgSend_setUserActivityType_(void *a1, const char *a2, ...)
{
  return [a1 setUserActivityType:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setUserOnboardingCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setUserOnboardingCompletionHandler:];
}

id objc_msgSend_setUserStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setUserStartDate];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKeyPath:];
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return [a1 setValues:];
}

id objc_msgSend_setValuesForKeysWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 setValuesForKeysWithDictionary:];
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return [a1 setViewController:];
}

id objc_msgSend_setVisiblePath_(void *a1, const char *a2, ...)
{
  return [a1 setVisiblePath:];
}

id objc_msgSend_setWhitelist_(void *a1, const char *a2, ...)
{
  return [a1 setWhitelist:];
}

id objc_msgSend_setWhitelistData_(void *a1, const char *a2, ...)
{
  return [a1 setWhitelistData:];
}

id objc_msgSend_setWidgetEngagement_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetEngagement:];
}

id objc_msgSend_setWidgetModeGroupID_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetModeGroupID];
}

id objc_msgSend_setWindowIsForeground_(void *a1, const char *a2, ...)
{
  return [a1 setWindowIsForeground:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setXS_(void *a1, const char *a2, ...)
{
  return [a1 setXS:];
}

id objc_msgSend_setXXXL_(void *a1, const char *a2, ...)
{
  return [a1 setXXXL];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return _[a1 setup];
}

id objc_msgSend_setupAnalyticsControllerWithFeldsparContext_versionHelpers_referral_(void *a1, const char *a2, ...)
{
  return [a1 setupAnalyticsControllerWithFeldsparContext:versionHelpers:referral:];
}

id objc_msgSend_setupAnalyticsReferralWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 setupAnalyticsReferralWithOptions:];
}

id objc_msgSend_setupCloudContextWithAppActivityMonitor_dataActionProvider_versionHelpers_configurationManager_networkBehaviorMonitor_networkReachability_(void *a1, const char *a2, ...)
{
  return [a1 setupCloudContextWithAppActivityMonitor:dataActionProvider:versionHelpers:configurationManager:networkBehaviorMonitor:networkReachability:];
}

id objc_msgSend_setupCloudContextWithFavoritesPersonalizer_state_launchOptions_versionHelpers_referral_(void *a1, const char *a2, ...)
{
  return [a1 setupCloudContextWithFavoritesPersonalizer:state:launchOptions:versionHelpers:referral:];
}

id objc_msgSend_setupDestructiveDataAction(void *a1, const char *a2, ...)
{
  return _[a1 setupDestructiveDataAction];
}

id objc_msgSend_setupFeldsparUserAgent(void *a1, const char *a2, ...)
{
  return _[a1 setupFeldsparUserAgent];
}

id objc_msgSend_setupLanguages(void *a1, const char *a2, ...)
{
  return _[a1 setupLanguages];
}

id objc_msgSend_setupNotificationManagerWithFeldsparContext_(void *a1, const char *a2, ...)
{
  return [a1 setupNotificationManagerWithFeldsparContext:];
}

id objc_msgSend_setupUserDefaultsForPPT(void *a1, const char *a2, ...)
{
  return _[a1 setupUserDefaultsForPPT];
}

id objc_msgSend_sharedAccount(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccount];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedContext];
}

id objc_msgSend_sharedDelegate(void *a1, const char *a2, ...)
{
  return _[a1 sharedDelegate];
}

id objc_msgSend_sharedDirectoryFileURL(void *a1, const char *a2, ...)
{
  return _[a1 sharedDirectoryFileURL];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return _[a1 sharedNetworkReachability];
}

id objc_msgSend_shortExcerpt(void *a1, const char *a2, ...)
{
  return _[a1 shortExcerpt];
}

id objc_msgSend_shortOperationDescription(void *a1, const char *a2, ...)
{
  return _[a1 shortOperationDescription];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return _[a1 shortVersionString];
}

id objc_msgSend_shortcutCategoryList(void *a1, const char *a2, ...)
{
  return _[a1 shortcutCategoryList];
}

id objc_msgSend_shortcutList(void *a1, const char *a2, ...)
{
  return _[a1 shortcutList];
}

id objc_msgSend_shouldAcceptAggregate_withCtr_minEvents_minClicks_minRate_baseRate_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptAggregate:withCtr:minEvents:minClicks:minRate:baseRate:multiplier:");
}

id objc_msgSend_shouldHideHeadline_(void *a1, const char *a2, ...)
{
  return [a1 shouldHideHeadline:];
}

id objc_msgSend_shouldPrefetchForYouFeed(void *a1, const char *a2, ...)
{
  return _[a1 shouldPrefetchForYouFeed];
}

id objc_msgSend_shouldPresentLastAlertForCurrentUpdate(void *a1, const char *a2, ...)
{
  return _[a1 shouldPresentLastAlertForCurrentUpdate];
}

id objc_msgSend_shouldRejectTagID_withAggregate_baseline_currentDate_addedDate_maxIdleTime_minEvents_minRate_baseRate_multiplier_(void *a1, const char *a2, ...)
{
  return [a1 shouldRejectTagID:withAggregate:baseline:currentDate:addedDate:maxIdleTime:minEvents:minRate:baseRate:multiplier:];
}

id objc_msgSend_shouldReturnThumbnail(void *a1, const char *a2, ...)
{
  return _[a1 shouldReturnThumbnail];
}

id objc_msgSend_shouldShowBadgeForArticleID_currentDocumentVersion_lastSeenDocumentVersion_(void *a1, const char *a2, ...)
{
  return [a1 shouldShowBadgeForArticleID:currentDocumentVersion:lastSeenDocumentVersion:];
}

id objc_msgSend_shouldShowUpdateAlert(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowUpdateAlert];
}

id objc_msgSend_showAppUpdateAlert(void *a1, const char *a2, ...)
{
  return _[a1 showAppUpdateAlert];
}

id objc_msgSend_showBadge(void *a1, const char *a2, ...)
{
  return _[a1 showBadge];
}

id objc_msgSend_signalProcessingTimeInterval(void *a1, const char *a2, ...)
{
  return _[a1 signalProcessingTimeInterval];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return _[a1 skipDescendants];
}

id objc_msgSend_slowCachedTagForID_(void *a1, const char *a2, ...)
{
  return [a1 slowCachedTagForID];
}

id objc_msgSend_snapshotPreparedAndWaitingForRestoration(void *a1, const char *a2, ...)
{
  return _[a1 snapshotPreparedAndWaitingForRestoration];
}

id objc_msgSend_snapshotURL(void *a1, const char *a2, ...)
{
  return _[a1 snapshotURL];
}

id objc_msgSend_snapshotURLForCachesURL_(void *a1, const char *a2, ...)
{
  return [a1 snapshotURLForCachesURL];
}

id objc_msgSend_sortSubscriptionsAlphabetically_(void *a1, const char *a2, ...)
{
  return [a1 sortSubscriptionsAlphabetically:];
}

id objc_msgSend_sortSubscriptionsByRecency_sortedPopularTagIDs_(void *a1, const char *a2, ...)
{
  return [a1 sortSubscriptionsByRecency:sortedPopularTagIDs:];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortUsingComparator:];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_sortedArrayWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayWithOptions:];
}

id objc_msgSend_sortedVisitedArticleIDs(void *a1, const char *a2, ...)
{
  return _[a1 sortedVisitedArticleIDs];
}

id objc_msgSend_sorter(void *a1, const char *a2, ...)
{
  return _[a1 sorter];
}

id objc_msgSend_sourceChannel(void *a1, const char *a2, ...)
{
  return _[a1 sourceChannel];
}

id objc_msgSend_sourceChannelID(void *a1, const char *a2, ...)
{
  return _[a1 sourceChannelID];
}

id objc_msgSend_sourceChannelRecordData(void *a1, const char *a2, ...)
{
  return _[a1 sourceChannelRecordData];
}

id objc_msgSend_sourceName(void *a1, const char *a2, ...)
{
  return _[a1 sourceName];
}

id objc_msgSend_specifiedValueForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 specifiedValueForContentSizeCategory:];
}

id objc_msgSend_splitScreen(void *a1, const char *a2, ...)
{
  return _[a1 splitScreen];
}

id objc_msgSend_splitScreenEqual(void *a1, const char *a2, ...)
{
  return _[a1 splitScreenEqual];
}

id objc_msgSend_sportsEventController(void *a1, const char *a2, ...)
{
  return _[a1 sportsEventController];
}

id objc_msgSend_spotlightManager(void *a1, const char *a2, ...)
{
  return _[a1 spotlightManager];
}

id objc_msgSend_spotlightQueue(void *a1, const char *a2, ...)
{
  return _[a1 spotlightQueue];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startPoint(void *a1, const char *a2, ...)
{
  return _[a1 startPoint];
}

id objc_msgSend_startRecordingExposure(void *a1, const char *a2, ...)
{
  return _[a1 startRecordingExposure];
}

id objc_msgSend_startSessionIfNeededWithReferral_sceneID_(void *a1, const char *a2, ...)
{
  return [a1 startSessionIfNeededWithReferral:nil sceneID:nil];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateRestorationURL(void *a1, const char *a2, ...)
{
  return _[a1 stateRestorationURL];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return _[a1 storage];
}

id objc_msgSend_storeQueue(void *a1, const char *a2, ...)
{
  return _[a1 storeQueue];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return [a1 stringForKey:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_strings(void *a1, const char *a2, ...)
{
  return _[a1 strings];
}

id objc_msgSend_strippedString(void *a1, const char *a2, ...)
{
  return _[a1 strippedString];
}

id objc_msgSend_subscribeNotificationPromptForTagID_(void *a1, const char *a2, ...)
{
  return [a1 subscribeNotificationPromptForTagID];
}

id objc_msgSend_subscribedTagForTagID_(void *a1, const char *a2, ...)
{
  return [a1 subscribedTagForTagID:];
}

id objc_msgSend_subscribedTagIDs(void *a1, const char *a2, ...)
{
  return _[a1 subscribedTagIDs];
}

id objc_msgSend_subscriptionController(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionController];
}

id objc_msgSend_subscriptionForTagID_(void *a1, const char *a2, ...)
{
  return [a1 subscriptionForTagID:];
}

id objc_msgSend_subscriptionList(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionList];
}

id objc_msgSend_subscriptionOrigin(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionOrigin];
}

id objc_msgSend_subscriptionsWithType_(void *a1, const char *a2, ...)
{
  return [a1 subscriptionsWithType:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_subtitleColor(void *a1, const char *a2, ...)
{
  return _[a1 subtitleColor];
}

id objc_msgSend_subtitleColorString(void *a1, const char *a2, ...)
{
  return _[a1 subtitleColorString];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportsNotifications(void *a1, const char *a2, ...)
{
  return _[a1 supportsNotifications];
}

id objc_msgSend_suspendedDepth(void *a1, const char *a2, ...)
{
  return _[a1 suspendedDepth];
}

id objc_msgSend_syncWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 syncWithCompletion:];
}

id objc_msgSend_syncWithGizmo(void *a1, const char *a2, ...)
{
  return _[a1 syncWithGizmo];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronousImageLoadingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 synchronousImageLoadingEnabled];
}

id objc_msgSend_syncingWatchData(void *a1, const char *a2, ...)
{
  return _[a1 syncingWatchData];
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _[a1 system];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return _[a1 systemPinkColor];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _[a1 systemVersion];
}

id objc_msgSend_systemVersionNumber(void *a1, const char *a2, ...)
{
  return _[a1 systemVersionNumber];
}

id objc_msgSend_systemVersionString(void *a1, const char *a2, ...)
{
  return _[a1 systemVersionString];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_tagController(void *a1, const char *a2, ...)
{
  return _[a1 tagController];
}

id objc_msgSend_tagEditorialItemDownloader(void *a1, const char *a2, ...)
{
  return _[a1 tagEditorialItemDownloader];
}

id objc_msgSend_tagID(void *a1, const char *a2, ...)
{
  return _[a1 tagID];
}

id objc_msgSend_tagOpenedDate(void *a1, const char *a2, ...)
{
  return _[a1 tagOpenedDate];
}

id objc_msgSend_tagRanker(void *a1, const char *a2, ...)
{
  return _[a1 tagRanker];
}

id objc_msgSend_tagScoresForBundleID_(void *a1, const char *a2, ...)
{
  return [a1 tagScoresForBundleID:];
}

id objc_msgSend_tagScoresForURL_(void *a1, const char *a2, ...)
{
  return [a1 tagScoresForURL:];
}

id objc_msgSend_tagType(void *a1, const char *a2, ...)
{
  return _[a1 tagType];
}

id objc_msgSend_tags(void *a1, const char *a2, ...)
{
  return _[a1 tags];
}

id objc_msgSend_tappedEditorialItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 tappedEditorialItemWithIdentifier:];
}

id objc_msgSend_targetFrame(void *a1, const char *a2, ...)
{
  return _[a1 targetFrame];
}

id objc_msgSend_tempRestoreURL(void *a1, const char *a2, ...)
{
  return _[a1 tempRestoreURL];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return _[a1 temporaryDirectory];
}

id objc_msgSend_textColorForTag_(void *a1, const char *a2, ...)
{
  return [a1 textColorForTag:];
}

id objc_msgSend_textMargin(void *a1, const char *a2, ...)
{
  return _[a1 textMargin];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return _[a1 theme];
}

id objc_msgSend_thenOn_then_(void *a1, const char *a2, ...)
{
  return [a1 thenOn:then:];
}

id objc_msgSend_thumbnailAssetHandle(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailAssetHandle];
}

id objc_msgSend_thumbnailCreator(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailCreator];
}

id objc_msgSend_thumbnailImage(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailImage];
}

id objc_msgSend_thumbnailImageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailImageIdentifier];
}

id objc_msgSend_tickle(void *a1, const char *a2, ...)
{
  return _[a1 tickle];
}

id objc_msgSend_tickleWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 tickleWithCompletion:];
}

id objc_msgSend_tickleWithQualityOfService_data_completion_(void *a1, const char *a2, ...)
{
  return [a1 tickleWithQualityOfService:data:completion:];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneWithName:];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_todayAgent(void *a1, const char *a2, ...)
{
  return _[a1 todayAgent];
}

id objc_msgSend_todayPrivateDataAccessor(void *a1, const char *a2, ...)
{
  return _[a1 todayPrivateDataAccessor];
}

id objc_msgSend_topStoriesConfig(void *a1, const char *a2, ...)
{
  return _[a1 topStoriesConfig];
}

id objc_msgSend_topStoriesPublishDates(void *a1, const char *a2, ...)
{
  return _[a1 topStoriesPublishDates];
}

id objc_msgSend_topicFont(void *a1, const char *a2, ...)
{
  return _[a1 topicFont];
}

id objc_msgSend_topicFrameForSize_(void *a1, const char *a2, ...)
{
  return [a1 topicFrameForSize:];
}

id objc_msgSend_topicPlaceholderImage(void *a1, const char *a2, ...)
{
  return _[a1 topicPlaceholderImage];
}

id objc_msgSend_topicTextAttributesForCardSize_textColor_sizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 topicTextAttributesForCardSize:textColor:sizeCategory:];
}

id objc_msgSend_topicTitleAttributesForCardSize_textColor_sizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topicTitleAttributesForCardSize:textColor:sizeCategory:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithHorizontalSizeClass_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithHorizontalSizeClass:];
}

id objc_msgSend_transactionOfIdentity(void *a1, const char *a2, ...)
{
  return _[a1 transactionOfIdentity];
}

id objc_msgSend_transactionProcessingGroup(void *a1, const char *a2, ...)
{
  return _[a1 transactionProcessingGroup];
}

id objc_msgSend_transactionToClearSeenArticles(void *a1, const char *a2, ...)
{
  return _[a1 transactionToClearSeenArticles];
}

id objc_msgSend_transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems_deletedArticleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:deletedArticleIDs:");
}

id objc_msgSend_transformBlock(void *a1, const char *a2, ...)
{
  return _[a1 transformBlock];
}

id objc_msgSend_translateFileURLForURL_(void *a1, const char *a2, ...)
{
  return [a1 translateFileURLForURL:];
}

id objc_msgSend_translationManager(void *a1, const char *a2, ...)
{
  return _[a1 translationManager];
}

id objc_msgSend_triggerWithTimeInterval_repeats_(void *a1, const char *a2, ...)
{
  return [a1 triggerWithTimeInterval:repeats:];
}

id objc_msgSend_trimTheArticle_(void *a1, const char *a2, ...)
{
  return [a1 trimTheArticle];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClass:fromData:error:];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClasses:fromData:error:];
}

id objc_msgSend_underlyingImageCache(void *a1, const char *a2, ...)
{
  return _[a1 underlyingImageCache];
}

id objc_msgSend_uniqueKey(void *a1, const char *a2, ...)
{
  return _[a1 uniqueKey];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unregisterFontWithURL_(void *a1, const char *a2, ...)
{
  return [a1 unregisterFontWithURL:];
}

id objc_msgSend_unregisterForDeviceLockNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterForDeviceLockNotifications];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAlertDidDismiss_(void *a1, const char *a2, ...)
{
  return [a1 updateAlertDidDismiss];
}

id objc_msgSend_updateAppObsolescenceState(void *a1, const char *a2, ...)
{
  return _[a1 updateAppObsolescenceState];
}

id objc_msgSend_updateEditorialItemWith_(void *a1, const char *a2, ...)
{
  return [a1 updateEditorialItemWith:];
}

id objc_msgSend_updateFeatures_withAction_displayRank_groupRank_groupType_individually_configurableValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFeatures:withAction:displayRank:groupRank:groupType:individually:configurableValues:");
}

id objc_msgSend_updateInfos(void *a1, const char *a2, ...)
{
  return _[a1 updateInfos];
}

id objc_msgSend_updateOnboardingVersion(void *a1, const char *a2, ...)
{
  return _[a1 updateOnboardingVersion];
}

id objc_msgSend_updatePrivateDataControllersWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 updatePrivateDataControllersWithCompletion:];
}

id objc_msgSend_updateQueue(void *a1, const char *a2, ...)
{
  return _[a1 updateQueue];
}

id objc_msgSend_updateUnderlyingMappingWithQualityOfService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUnderlyingMappingWithQualityOfService:completion:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_urlMapping(void *a1, const char *a2, ...)
{
  return _[a1 urlMapping];
}

id objc_msgSend_urlRouterManager(void *a1, const char *a2, ...)
{
  return _[a1 urlRouterManager];
}

id objc_msgSend_useManagedContextWithSize_opaque_forceSRGB_scale_contextBlock_(void *a1, const char *a2, ...)
{
  return [a1 useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:];
}

id objc_msgSend_useManagedContextWithSize_opaque_scale_contextBlock_(void *a1, const char *a2, ...)
{
  return [a1 useManagedContextWithSize:opaque:scale:contextBlock:];
}

id objc_msgSend_userActivityManager(void *a1, const char *a2, ...)
{
  return _[a1 userActivityManager];
}

id objc_msgSend_userActivityType(void *a1, const char *a2, ...)
{
  return _[a1 userActivityType];
}

id objc_msgSend_userEmbeddingGenerator(void *a1, const char *a2, ...)
{
  return _[a1 userEmbeddingGenerator];
}

id objc_msgSend_userEventHistory(void *a1, const char *a2, ...)
{
  return _[a1 userEventHistory];
}

id objc_msgSend_userEventHistoryStorage(void *a1, const char *a2, ...)
{
  return _[a1 userEventHistoryStorage];
}

id objc_msgSend_userIDDeterminationGroup(void *a1, const char *a2, ...)
{
  return _[a1 userIDDeterminationGroup];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_userOnboardingCompletionHandler(void *a1, const char *a2, ...)
{
  return _[a1 userOnboardingCompletionHandler];
}

id objc_msgSend_userStartDate(void *a1, const char *a2, ...)
{
  return _[a1 userStartDate];
}

id objc_msgSend_validateCommand_(void *a1, const char *a2, ...)
{
  return [a1 validateCommand:];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 valueForKeyPath:];
}

id objc_msgSend_valueSpecifierWithXS_L_XXXL_AXXXL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueSpecifierWithXS:L:XXXL:AXXXL:");
}

id objc_msgSend_valueSpecifierWithXSFactor_largeSize_XXXLFactor_AXXXLFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueSpecifierWithXSFactor:largeSize:XXXLFactor:AXXXLFactor:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}

id objc_msgSend_versionHelpers(void *a1, const char *a2, ...)
{
  return _[a1 versionHelpers];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_visiblePathForIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 visiblePathForIndexPath:];
}

id objc_msgSend_webContent(void *a1, const char *a2, ...)
{
  return _[a1 webContent];
}

id objc_msgSend_whenResolvingProtocol_scope_callbackBlock_(void *a1, const char *a2, ...)
{
  return [a1 whenResolvingProtocol:scope:callbackBlock:];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitelist(void *a1, const char *a2, ...)
{
  return _[a1 whitelist];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_widgetEngagement(void *a1, const char *a2, ...)
{
  return _[a1 widgetEngagement];
}

id objc_msgSend_widgetModeGroupID(void *a1, const char *a2, ...)
{
  return _[a1 widgetModeGroupID];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 withConfiguration:];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:options:error:];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}