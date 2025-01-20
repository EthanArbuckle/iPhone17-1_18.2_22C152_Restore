id BooksNotificationLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_10000D0B8 != -1) {
    dispatch_once(&qword_10000D0B8, &stru_100008418);
  }
  v0 = (void *)qword_10000D0B0;

  return v0;
}

void sub_1000023AC(id a1)
{
  qword_10000D0B0 = (uint64_t)os_log_create("com.apple.iBooks", "BooksNotification");

  _objc_release_x1();
}

void sub_1000024F4(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002604;
    block[3] = &unk_100008440;
    uint64_t v9 = *(void *)(a1 + 56);
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    char v10 = 1;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v3 = objc_retainBlock(*(id *)(a1 + 48));
    if (v3)
    {
      id v4 = v3;
      (*((void (**)(id, void))v3 + 2))(v3, 0);
      id v3 = v4;
    }
  }
}

void sub_100002604(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 56) _contentDataForContentID:*(void *)(a1 + 32) tracker:*(void *)(a1 + 40)];
  v2 = +[BAEventReporter sharedReporter];
  [v2 emitAddToCollectionEventWithTracker:*(void *)(a1 + 40) collectionID:kBKCollectionDefaultIDWantToRead contentData:v6];

  id v3 = +[BAEventReporter sharedReporter];
  [v3 emitWantListAddEventWithTracker:*(void *)(a1 + 40) contentData:v6];

  id v4 = objc_retainBlock(*(id *)(a1 + 48));
  v5 = v4;
  if (v4) {
    (*((void (**)(id, void))v4 + 2))(v4, *(unsigned __int8 *)(a1 + 64));
  }
}

void sub_100002908(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationDelegate];
  [v2 feedViewController:*(void *)(a1 + 32) willTransitionToContentHeight:*(double *)(a1 + 40)];
}

void sub_100002E50(uint64_t a1, char a2)
{
  if (a2)
  {
    id v2 = BooksNotificationLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100004FB8(v2);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) analyticsManager];
    [v4 endSession];

    +[JSAApplication willTerminate];
    v5 = [*(id *)(a1 + 32) analyticsManager];
    [v5 waitForSessionEndWithTimeout:2.0];

    id v6 = [*(id *)(a1 + 32) analyticsManager];
    [v6 appSessionDidTerminate];
  }
}

void sub_100003084(id *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 objectForKeyedSubscript:@"host-patterns"];
  v5 = BUDynamicCast();

  objc_opt_class();
  id v6 = [v3 objectForKeyedSubscript:@"path-patterns"];

  id v7 = BUDynamicCast();

  id v8 = [a1[4] defaultAction];
  uint64_t v9 = [v8 defaultURL];

  if ([a1[5] _isURLValid:v9 hostPatterns:v5 pathPatterns:v7])
  {
    id v10 = a1[5];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100003264;
    v17[3] = &unk_1000084E0;
    v17[4] = v10;
    id v18 = a1[4];
    [v10 _setupWithCompletion:v17];
    v11 = v18;
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100003270;
    v14[3] = &unk_1000084E0;
    id v12 = a1[6];
    id v13 = a1[5];
    id v15 = v12;
    id v16 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    v11 = v15;
  }
}

id sub_100003264(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _renderUserNotification:*(void *)(a1 + 40)];
}

id sub_100003270(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BooksNotificationViewController;
  return [super didReceiveNotification:v1];
}

uint64_t sub_100003A60(void *a1)
{
  id v2 = BooksNotificationLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = objc_opt_class();
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[7];
    int v10 = 138543874;
    v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: handling URL and bump'd %@ in WTR position to #1 for action type %ld", (uint8_t *)&v10, 0x20u);
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], 1, v7, v8);
}

uint64_t sub_100003B54(void *a1)
{
  id v2 = BooksNotificationLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = objc_opt_class();
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[9];
    int v11 = 138543874;
    __int16 v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: handling URL and bump'd %@ in WTR position to #1 for action type %ld", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v7 = +[LSApplicationWorkspace defaultWorkspace];
  [v7 openSensitiveURL:a1[6] withOptions:a1[7]];

  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(a1[8] + 16))(a1[8], 1, v8, v9);
}

void sub_1000040BC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  objc_super v3 = +[JSABridge sharedInstance];
  uint64_t v4 = [v3 currentPackage];
  [v2 registerTemplateBundlesFromPackage:v4];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000418C;
  block[3] = &unk_100008558;
  id v6 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000418C(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 32));
  if (v1)
  {
    id v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

void sub_100004420(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) feedViewController];
  uint64_t v1 = [v4 view];
  id v2 = [v1 window];
  objc_super v3 = +[BNJSAWindowProvider sharedInstance];
  [v3 setWindow:v2];
}

void sub_100004620(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = BooksNotificationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100005094(a1, (uint64_t)v4, v5);
    }
  }
}

uint64_t sub_100004C80(uint64_t a1)
{
  qword_10000D0C8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t LibraryAnalyticsDataProvider.seriesType(for:)@<X0>(uint64_t a1@<X8>)
{
  id v2 = (id)BSUIGetLibraryItemStateProvider();
  NSString v3 = sub_100005170();
  id v4 = [v2 itemStateWithIdentifier:v3];

  swift_unknownObjectRelease();
  id v5 = [v4 seriesType];
  swift_unknownObjectRelease();
  switch((unint64_t)v5)
  {
    case 1uLL:
      int v11 = (unsigned int *)&enum case for SeriesType.nonSeries(_:);
      goto LABEL_6;
    case 2uLL:
      int v11 = (unsigned int *)&enum case for SeriesType.ordered(_:);
      goto LABEL_6;
    case 3uLL:
      int v11 = (unsigned int *)&enum case for SeriesType.unOrdered(_:);
LABEL_6:
      uint64_t v12 = *v11;
      uint64_t v13 = sub_100005140();
      uint64_t v15 = *(void *)(v13 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 104))(a1, v12, v13);
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      uint64_t v9 = a1;
      uint64_t v10 = 0;
      uint64_t v8 = v13;
      break;
    default:
      uint64_t v6 = sub_100005140();
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
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

uint64_t static EventReporter.setupLibraryAnalyticsDataProvider()()
{
  return sub_100005150();
}

unint64_t sub_100004F18()
{
  unint64_t result = qword_10000D0A0;
  if (!qword_10000D0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000D0A0);
  }
  return result;
}

void sub_100004F6C(id a1, SEL a2)
{
}

void sub_100004FB8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Process is about to be suspended. Upload metrics might have failed.", v1, 2u);
}

void sub_100004FFC(uint64_t a1, NSObject *a2)
{
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: didReceiveNotification: received for a notification that did not originate from an AMS", (uint8_t *)&v4, 0xCu);
}

void sub_100005094(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@: can't flush Figaro event due to %@", (uint8_t *)&v6, 0x16u);
}

uint64_t sub_100005140()
{
  return type metadata accessor for SeriesType();
}

uint64_t sub_100005150()
{
  return static EventReporter.libraryAnalyticsDataProvider.setter();
}

uint64_t sub_100005160()
{
  return type metadata accessor for EventReporter();
}

NSString sub_100005170()
{
  return String._bridgeToObjectiveC()();
}

uint64_t BSUIGetLibraryItemStateProvider()
{
  return _BSUIGetLibraryItemStateProvider();
}

uint64_t BUDynamicCast()
{
  return _BUDynamicCast();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

id objc_msgSend__contentDataForContentID_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentDataForContentID:tracker:");
}

id objc_msgSend__emitNotificationEngagementEventForResponse_notificationAction_actionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_emitNotificationEngagementEventForResponse:notificationAction:actionType:");
}

id objc_msgSend__isOwned_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isOwned:");
}

id objc_msgSend__isURLValid_hostPatterns_pathPatterns_(void *a1, const char *a2, ...)
{
  return [a1 _isURLValid:nil hostPatterns:nil pathPatterns:nil];
}

id objc_msgSend__reportMetricsEvent_(void *a1, const char *a2, ...)
{
  return [a1 _reportMetricsEvent:];
}

id objc_msgSend__setupWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupWithCompletion:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifier];
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return [a1 addFinishBlock:];
}

id objc_msgSend_addStoreID_toCollectionID_completion_(void *a1, const char *a2, ...)
{
  return [a1 addStoreID:toCollectionID:completion:];
}

id objc_msgSend_addStoreIDToWantToRead_tracker_completion_(void *a1, const char *a2, ...)
{
  return [a1 addStoreIDToWantToRead:tracker:completion:];
}

id objc_msgSend_analyticsController(void *a1, const char *a2, ...)
{
  return _[a1 analyticsController];
}

id objc_msgSend_analyticsManager(void *a1, const char *a2, ...)
{
  return _[a1 analyticsManager];
}

id objc_msgSend_appSessionDidTerminate(void *a1, const char *a2, ...)
{
  return _[a1 appSessionDidTerminate];
}

id objc_msgSend_applicationTracker(void *a1, const char *a2, ...)
{
  return _[a1 applicationTracker];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_ba_effectiveAnalyticsTracker(void *a1, const char *a2, ...)
{
  return [a1 ba_effectiveAnalyticsTracker];
}

id objc_msgSend_bc_analyticsVisibilitySubtreeDidDisappear(void *a1, const char *a2, ...)
{
  return [a1 bc_analyticsVisibilitySubtreeDidDisappear];
}

id objc_msgSend_bc_analyticsVisibilitySubtreeWillDisappear(void *a1, const char *a2, ...)
{
  return [a1 bc_analyticsVisibilitySubtreeWillDisappear];
}

id objc_msgSend_bc_analyticsVisibilityUpdateSubtree(void *a1, const char *a2, ...)
{
  return [a1 bc_analyticsVisibilityUpdateSubtree];
}

id objc_msgSend_bc_hasMatchInRegexPatterns_(void *a1, const char *a2, ...)
{
  return [a1 bc_hasMatchInRegexPatterns:];
}

id objc_msgSend_bc_isBookStoreAddToWantToReadURL(void *a1, const char *a2, ...)
{
  return [a1 bc_isBookStoreAddToWantToReadURL];
}

id objc_msgSend_bc_isBookStoreBuyNowURL(void *a1, const char *a2, ...)
{
  return [a1 bc_isBookStoreBuyNowURL];
}

id objc_msgSend_bc_isBookStoreStartListeningURL(void *a1, const char *a2, ...)
{
  return [a1 bc_isBookStoreStartListeningURL];
}

id objc_msgSend_bc_isBookStoreStartReadingURL(void *a1, const char *a2, ...)
{
  return [a1 bc_isBookStoreStartReadingURL];
}

id objc_msgSend_bc_isBookStoreViewInStoreURL(void *a1, const char *a2, ...)
{
  return [a1 bc_isBookStoreViewInStoreURL];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_books(void *a1, const char *a2, ...)
{
  return _[a1 books];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_buttonActions(void *a1, const char *a2, ...)
{
  return _[a1 buttonActions];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentPrivateIDForContentID_(void *a1, const char *a2, ...)
{
  return [a1 contentPrivateIDForContentID];
}

id objc_msgSend_contentUserIDForContentID_(void *a1, const char *a2, ...)
{
  return [a1 contentUserIDForContentID];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createUNNotificationActions(void *a1, const char *a2, ...)
{
  return _[a1 createUNNotificationActions];
}

id objc_msgSend_currentPackage(void *a1, const char *a2, ...)
{
  return _[a1 currentPackage];
}

id objc_msgSend_defaultAction(void *a1, const char *a2, ...)
{
  return _[a1 defaultAction];
}

id objc_msgSend_defaultBag(void *a1, const char *a2, ...)
{
  return _[a1 defaultBag];
}

id objc_msgSend_defaultContainer(void *a1, const char *a2, ...)
{
  return _[a1 defaultContainer];
}

id objc_msgSend_defaultURL(void *a1, const char *a2, ...)
{
  return _[a1 defaultURL];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dynamicRegistry(void *a1, const char *a2, ...)
{
  return _[a1 dynamicRegistry];
}

id objc_msgSend_emitAddToCollectionEventWithTracker_collectionID_contentData_(void *a1, const char *a2, ...)
{
  return [a1 emitAddToCollectionEventWithTracker:collectionID:contentData:];
}

id objc_msgSend_emitNotificationEngagementEventWithTracker_engagementData_notificationData_(void *a1, const char *a2, ...)
{
  return [a1 emitNotificationEngagementEventWithTracker:engagementData:notificationData:];
}

id objc_msgSend_emitWantListAddEventWithTracker_contentData_(void *a1, const char *a2, ...)
{
  return [a1 emitWantListAddEventWithTracker:contentData:];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return _[a1 endSession];
}

id objc_msgSend_enqueueEvent_(void *a1, const char *a2, ...)
{
  return [a1 enqueueEvent:];
}

id objc_msgSend_expectedContentSize(void *a1, const char *a2, ...)
{
  return _[a1 expectedContentSize];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_feedViewController(void *a1, const char *a2, ...)
{
  return _[a1 feedViewController];
}

id objc_msgSend_feedViewController_willTransitionToContentHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedViewController:willTransitionToContentHeight:");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithActionType_actionUrl_targetID_targetType_(void *a1, const char *a2, ...)
{
  return [a1 initWithActionType:actionUrl:targetID:targetType:];
}

id objc_msgSend_initWithContentID_contentType_contentPrivateID_contentUserID_contentAcquisitionType_contentSubType_contentLength_supplementalContentCount_seriesType_productionType_isUnified_contentKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithNotificationContentID_notificationID_notificationType_recoType_goalType_titleCode_title_messageCode_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationContentID:notificationID:notificationType:recoType:goalType:titleCode:title:messageCode:message:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithOptions:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithUploadsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 initWithUploadsEnabled:];
}

id objc_msgSend_initializeEnvironmentWithDataSource_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeEnvironmentWithDataSource:completion:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_itemStateWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 itemStateWithIdentifier:];
}

id objc_msgSend_ixStoreSheetBooks(void *a1, const char *a2, ...)
{
  return _[a1 ixStoreSheetBooks];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _[a1 library];
}

id objc_msgSend_logKey(void *a1, const char *a2, ...)
{
  return _[a1 logKey];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_metricsEvent(void *a1, const char *a2, ...)
{
  return _[a1 metricsEvent];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationDelegate(void *a1, const char *a2, ...)
{
  return _[a1 notificationDelegate];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 openSensitiveURL:withOptions:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performExpiringActivityWithReason_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 performExpiringActivityWithReason:];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_registerStateProvider_forKind_(void *a1, const char *a2, ...)
{
  return [a1 registerStateProvider:forKind:];
}

id objc_msgSend_registerTemplateBundlesFromPackage_(void *a1, const char *a2, ...)
{
  return [a1 registerTemplateBundlesFromPackage:];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_setAnalyticsManager_(void *a1, const char *a2, ...)
{
  return [a1 setAnalyticsManager:];
}

id objc_msgSend_setFeedViewController_(void *a1, const char *a2, ...)
{
  return [a1 setFeedViewController:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalPresentationStyle:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNotificationActions_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationActions:];
}

id objc_msgSend_setNotificationDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationDelegate:];
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredContentSize:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_setupLibraryAnalyticsDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 setupLibraryAnalyticsDataProvider];
}

id objc_msgSend_setupTrackingForRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setupTrackingForRootViewController:];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedReporter(void *a1, const char *a2, ...)
{
  return _[a1 sharedReporter];
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return _[a1 startSession];
}

id objc_msgSend_stateCenter(void *a1, const char *a2, ...)
{
  return _[a1 stateCenter];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_underlyingDictionary(void *a1, const char *a2, ...)
{
  return _[a1 underlyingDictionary];
}

id objc_msgSend_userNotificationFromNotification_(void *a1, const char *a2, ...)
{
  return [a1 userNotificationFromNotification:];
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCompletion:];
}

id objc_msgSend_videoUrl(void *a1, const char *a2, ...)
{
  return _[a1 videoUrl];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _[a1 viewIfLoaded];
}

id objc_msgSend_waitForSessionEndWithTimeout_(void *a1, const char *a2, ...)
{
  return [a1 waitForSessionEndWithTimeout:];
}

id objc_msgSend_willTerminate(void *a1, const char *a2, ...)
{
  return _[a1 willTerminate];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}