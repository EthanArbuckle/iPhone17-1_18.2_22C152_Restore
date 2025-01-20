@interface BCProgressKitController
+ (BCProgressKitController)sharedController;
- (BCProgressKitController)init;
- (BOOL)_isBookOpen:(id)a3;
- (BOOL)testMode;
- (CLSDataStore)progressKitDataStore;
- (NSMutableDictionary)activeChapters;
- (NSMutableDictionary)activeSections;
- (NSMutableDictionary)activeTrackingProviders;
- (NSMutableDictionary)activeWidgets;
- (NSMutableDictionary)openBooks;
- (NSMutableDictionary)readingStatisticsControllers;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)workQueue;
- (id)_bookIdentifierFromAssetID:(id)a3;
- (id)_chapterHrefFromAssetID:(id)a3 chapterID:(id)a4;
- (id)_chapterIdentifierFromAssetID:(id)a3 chapterID:(id)a4;
- (id)_contextWithID:(id)a3;
- (id)_currentActivityForContext:(id)a3;
- (id)_getActiveChapterContext:(id)a3;
- (id)_getActiveSectionContext:(id)a3;
- (id)_getActiveWidgetContext:(id)a3;
- (id)_getOpenBookContext:(id)a3;
- (id)_mediaIdentifierFromCFI:(id)a3;
- (id)_sectionIdentifierFromAssetID:(id)a3 chapterID:(id)a4 sectionID:(id)a5;
- (id)_universalLinkFromAssetID:(id)a3 cfi:(id)a4;
- (id)_updateCurrentChapterProgressForBook:(id)a3;
- (id)_widgetIdentifierFromAssetID:(id)a3 parentID:(id)a4 widgetID:(id)a5;
- (id)standardProgressCapability;
- (id)standardWidgetReportingCapability;
- (void)_activateChapterForBook:(id)a3 chapterID:(id)a4 title:(id)a5 currentPage:(int64_t)a6 chapterRange:(_NSRange)a7 completion:(id)a8;
- (void)_becomeActiveOnContext:(id)a3;
- (void)_deactivateCurrentWidget:(id)a3;
- (void)_resetWithAssetID:(id)a3;
- (void)_resignActiveContext;
- (void)_saveChanges;
- (void)_startActivity:(BOOL)a3 forContext:(id)a4;
- (void)_updateBookProgress:(id)a3 currentPage:(int64_t)a4 completion:(id)a5;
- (void)_updateContext:(id)a3 withProgress:(double)a4;
- (void)_updateContext:(id)a3 withScore:(double)a4 maxScore:(double)a5;
- (void)activateChapterForBook:(id)a3 chapterID:(id)a4 title:(id)a5 completion:(id)a6;
- (void)activateChapterForBook:(id)a3 chapterID:(id)a4 title:(id)a5 currentPage:(int64_t)a6 chapterRange:(_NSRange)a7 completion:(id)a8;
- (void)activateSectionForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 title:(id)a6 completion:(id)a7;
- (void)activateWidgetForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 title:(id)a7 trackingProvider:(id)a8 cfi:(id)a9 completion:(id)a10;
- (void)activeContextWithCompletion:(id)a3;
- (void)addReadingStatisticsController:(id)a3 forAssetID:(id)a4;
- (void)buildContextTree:(id)a3 forBook:(id)a4 completion:(id)a5;
- (void)contextForBook:(id)a3 title:(id)a4 completion:(id)a5;
- (void)deactivateCurrentWidgetForBook:(id)a3 completion:(id)a4;
- (void)didCloseBookWithAssetID:(id)a3 completion:(id)a4;
- (void)didOpenBookWithAssetID:(id)a3 version:(id)a4 title:(id)a5 pageCount:(int64_t)a6 storeID:(id)a7 completion:(id)a8;
- (void)didOpenBookWithAssetID:(id)a3 version:(id)a4 title:(id)a5 pageCount:(int64_t)a6 storeID:(id)a7 coverImage:(id)a8 completion:(id)a9;
- (void)readingStatisticsDidChangeOnController:(id)a3 changes:(id)a4;
- (void)resetWidgetAttemptForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 completion:(id)a7;
- (void)setActiveChapters:(id)a3;
- (void)setActiveSections:(id)a3;
- (void)setActiveTrackingProviders:(id)a3;
- (void)setActiveWidgets:(id)a3;
- (void)setOpenBooks:(id)a3;
- (void)setReadingStatisticsControllers:(id)a3;
- (void)setTestMode:(BOOL)a3;
- (void)updateBook:(id)a3 withTitle:(id)a4 completion:(id)a5;
- (void)updateBookProgress:(id)a3 completion:(id)a4;
- (void)updateBookProgress:(id)a3 currentPage:(int64_t)a4 completion:(id)a5;
- (void)updateMediaForBook:(id)a3 chapter:(id)a4 mediaCFI:(id)a5 progress:(id)a6 completion:(id)a7;
- (void)updateWidgetProgressForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 percent:(id)a7 completion:(id)a8;
- (void)updateWidgetScoreForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 score:(id)a7 total:(id)a8 completion:(id)a9;
@end

@implementation BCProgressKitController

+ (BCProgressKitController)sharedController
{
  if (qword_345590 != -1) {
    dispatch_once(&qword_345590, &stru_2C48B8);
  }
  v2 = (void *)qword_345588;

  return (BCProgressKitController *)v2;
}

- (BCProgressKitController)init
{
  v21.receiver = self;
  v21.super_class = (Class)BCProgressKitController;
  v2 = [(BCProgressKitController *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ibooks.BCClassKitController.work", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ibooks.BCClassKitController.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v6;

    v2->_progressKitDataStore = (CLSDataStore *)+[CLSDataStore shared];
    uint64_t v8 = objc_opt_new();
    openBooks = v2->_openBooks;
    v2->_openBooks = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    activeChapters = v2->_activeChapters;
    v2->_activeChapters = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    activeSections = v2->_activeSections;
    v2->_activeSections = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    activeWidgets = v2->_activeWidgets;
    v2->_activeWidgets = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    activeTrackingProviders = v2->_activeTrackingProviders;
    v2->_activeTrackingProviders = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    readingStatisticsControllers = v2->_readingStatisticsControllers;
    v2->_readingStatisticsControllers = (NSMutableDictionary *)v18;
  }
  return v2;
}

- (id)standardProgressCapability
{
  v2 = IMCommonCoreBundle();
  v3 = [v2 localizedStringForKey:@"Reports percentage progress in the activity." value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  id v4 = [objc_alloc((Class)CLSProgressReportingCapability) initWithKind:1 details:v3];
  v5 = +[NSSet setWithObject:v4];

  return v5;
}

- (id)standardWidgetReportingCapability
{
  v3 = IMCommonCoreBundle();
  id v4 = [v3 localizedStringForKey:@"Reports score achieved and percentage progress in the activity." value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  id v5 = [objc_alloc((Class)CLSProgressReportingCapability) initWithKind:4 details:v4];
  dispatch_queue_t v6 = [(BCProgressKitController *)self standardProgressCapability];
  v7 = [v6 setByAddingObject:v5];

  return v7;
}

- (void)_resetWithAssetID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_27398;
  block[3] = &unk_2C48E0;
  block[4] = self;
  id v12 = v4;
  v7 = v5;
  v13 = v7;
  id v8 = v4;
  dispatch_async(workQueue, block);
  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    uint64_t v10 = BCProgressKitLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1EA0B0();
    }
  }
}

- (void)_saveChanges
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  progressKitDataStore = self->_progressKitDataStore;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_27550;
  v8[3] = &unk_2C4908;
  dispatch_semaphore_t v5 = v3;
  dispatch_time_t v9 = v5;
  [(CLSDataStore *)progressKitDataStore saveWithCompletion:v8];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = BCProgressKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1EA0B0();
    }
  }
}

- (id)_bookIdentifierFromAssetID:(id)a3
{
  return +[NSString stringWithFormat:@"bookAssetID:%@", a3];
}

- (id)_chapterIdentifierFromAssetID:(id)a3 chapterID:(id)a4
{
  return +[NSString stringWithFormat:@"%@:%@", a3, a4];
}

- (id)_chapterHrefFromAssetID:(id)a3 chapterID:(id)a4
{
  id v5 = a4;
  dispatch_time_t v6 = +[NSString stringWithFormat:@"%@:", a3];
  v7 = (char *)[v5 rangeOfString:v6];
  uint64_t v9 = v8;

  if (v9)
  {
    uint64_t v10 = [v5 substringFromIndex:&v7[v9]];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_sectionIdentifierFromAssetID:(id)a3 chapterID:(id)a4 sectionID:(id)a5
{
  return +[NSString stringWithFormat:@"%@:%@:%@", a3, a4, a5];
}

- (id)_mediaIdentifierFromCFI:(id)a3
{
  return +[NSString stringWithFormat:@"media:%@", a3];
}

- (id)_widgetIdentifierFromAssetID:(id)a3 parentID:(id)a4 widgetID:(id)a5
{
  return +[NSString stringWithFormat:@"%@:%@:%@", a3, a4, a5];
}

- (id)_universalLinkFromAssetID:(id)a3 cfi:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    v7 = +[NSURL bu_urlWithAssetID:v5];
    uint64_t v8 = +[NSURLComponents componentsWithURL:v7 resolvingAgainstBaseURL:0];

    [v8 setFragment:v6];
    uint64_t v9 = [v8 URL];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_contextWithID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_27A2C;
  v20 = sub_27A3C;
  id v21 = 0;
  if ([v4 length])
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    id v5 = +[CLSQuery predicateForObjectsWithIdentifier:v4];
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    v7 = [(BCProgressKitController *)self progressKitDataStore];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_27A44;
    v13[3] = &unk_2C4930;
    v15 = &v16;
    uint64_t v8 = v6;
    uint64_t v14 = v8;
    [v7 contextsMatchingPredicate:v5 completion:v13];

    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      uint64_t v10 = BCProgressKitLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1EA14C();
      }
    }
  }
  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (BOOL)_isBookOpen:(id)a3
{
  id v4 = a3;
  id v5 = [(BCProgressKitController *)self openBooks];
  dispatch_semaphore_t v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (id)_getOpenBookContext:(id)a3
{
  id v4 = a3;
  id v5 = [(BCProgressKitController *)self openBooks];
  dispatch_semaphore_t v6 = [v5 objectForKey:v4];

  v7 = [v6 identifier];
  uint64_t v8 = [(BCProgressKitController *)self _contextWithID:v7];

  return v8;
}

- (id)_getActiveChapterContext:(id)a3
{
  id v4 = a3;
  id v5 = [(BCProgressKitController *)self activeChapters];
  dispatch_semaphore_t v6 = [v5 objectForKey:v4];

  v7 = [v6 identifier];
  uint64_t v8 = [(BCProgressKitController *)self _contextWithID:v7];

  return v8;
}

- (id)_getActiveSectionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(BCProgressKitController *)self activeSections];
  dispatch_semaphore_t v6 = [v5 objectForKey:v4];

  v7 = [(BCProgressKitController *)self _contextWithID:v6];

  return v7;
}

- (id)_getActiveWidgetContext:(id)a3
{
  id v4 = a3;
  id v5 = [(BCProgressKitController *)self activeWidgets];
  dispatch_semaphore_t v6 = [v5 objectForKey:v4];

  v7 = [(BCProgressKitController *)self _contextWithID:v6];

  return v7;
}

- (id)_currentActivityForContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 currentActivity];

  if (!v4) {
    id v5 = [v3 createNewActivity];
  }
  dispatch_semaphore_t v6 = [v3 currentActivity];

  return v6;
}

- (void)_startActivity:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = v6;
    do
    {
      uint64_t v8 = BCProgressKitLog();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
      if (v4)
      {
        if (v9) {
          sub_1EA1F4((uint64_t)v13, (uint64_t)v7);
        }

        uint64_t v10 = [(BCProgressKitController *)self _currentActivityForContext:v7];
        [v10 start];
      }
      else
      {
        if (v9) {
          sub_1EA250((uint64_t)&v12, (uint64_t)v7);
        }

        uint64_t v10 = [(BCProgressKitController *)self _currentActivityForContext:v7];
        [v10 stop];
      }

      if ([v7 type] == (char *)&dword_8 + 3) {
        break;
      }
      uint64_t v11 = [v7 parent];

      v7 = (void *)v11;
    }
    while (v11);
  }
}

- (void)_resignActiveContext
{
  id v3 = [(CLSDataStore *)self->_progressKitDataStore activeContext];
  if (v3)
  {
    id v4 = v3;
    [v3 resignActive];
    [(BCProgressKitController *)self _startActivity:0 forContext:v4];
    id v3 = v4;
  }
}

- (void)_becomeActiveOnContext:(id)a3
{
  id v8 = a3;
  id v4 = [(CLSDataStore *)self->_progressKitDataStore activeContext];
  id v5 = [v4 identifier];
  id v6 = [v8 identifier];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    if (v4) {
      [(BCProgressKitController *)self _resignActiveContext];
    }
    [v8 becomeActive];
    [(BCProgressKitController *)self _startActivity:1 forContext:v8];
  }
}

- (void)_deactivateCurrentWidget:(id)a3
{
  id v4 = a3;
  id v5 = [(BCProgressKitController *)self _getActiveWidgetContext:v4];
  if (v5)
  {
    id v6 = [(CLSDataStore *)self->_progressKitDataStore activeContext];
    unsigned __int8 v7 = [v6 identifier];
    id v8 = [v5 identifier];
    if ([v7 isEqualToString:v8])
    {
      BOOL v9 = [(BCProgressKitController *)self _currentActivityForContext:v6];
      unsigned int v10 = [v9 isStarted];
    }
    else
    {
      unsigned int v10 = 0;
    }

    uint64_t v11 = [(BCProgressKitController *)self activeTrackingProviders];
    uint64_t v12 = [v11 objectForKeyedSubscript:v4];

    if (v10 && [v12 tracksScore] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_28224;
      uint64_t v18 = &unk_2C4958;
      v19 = self;
      id v20 = v5;
      [v12 queryScore:&v15];
    }
    else
    {
      [(BCProgressKitController *)self _resignActiveContext];
    }
    v13 = [(BCProgressKitController *)self activeWidgets];
    [v13 removeObjectForKey:v4];

    uint64_t v14 = [(BCProgressKitController *)self activeTrackingProviders];
    [v14 removeObjectForKey:v4];
  }
}

- (void)_updateContext:(id)a3 withProgress:(double)a4
{
  workQueue = self->_workQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v9 = [(CLSDataStore *)self->_progressKitDataStore activeContext];
  [(BCProgressKitController *)self _becomeActiveOnContext:v7];
  id v8 = [(BCProgressKitController *)self _currentActivityForContext:v7];

  [v8 addProgressRangeFromStart:0.0 toEnd:a4];
  [(BCProgressKitController *)self _becomeActiveOnContext:v9];
  [(BCProgressKitController *)self _saveChanges];
}

- (void)_updateContext:(id)a3 withScore:(double)a4 maxScore:(double)a5
{
  workQueue = self->_workQueue;
  id v9 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v15 = [(CLSDataStore *)self->_progressKitDataStore activeContext];
  [(BCProgressKitController *)self _becomeActiveOnContext:v9];
  id v10 = objc_alloc((Class)CLSScoreItem);
  uint64_t v11 = [v9 identifier];
  uint64_t v12 = [v9 identifier];
  id v13 = [v10 initWithIdentifier:v11 title:v12 score:a4 maxScore:a5];

  uint64_t v14 = [(BCProgressKitController *)self _currentActivityForContext:v9];

  [v14 addAdditionalActivityItem:v13];
  [v14 setPrimaryActivityItem:v13];
  [v14 addProgressRangeFromStart:0.0 toEnd:1.0];
  [(BCProgressKitController *)self _becomeActiveOnContext:v15];
  [(BCProgressKitController *)self _saveChanges];
}

- (void)readingStatisticsDidChangeOnController:(id)a3 changes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_27A2C;
  id v20 = sub_27A3C;
  id v21 = 0;
  id v8 = [(BCProgressKitController *)self readingStatisticsControllers];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_28604;
  id v13 = &unk_2C4980;
  id v9 = v6;
  id v14 = v9;
  id v15 = &v16;
  [v8 enumerateKeysAndObjectsUsingBlock:&v10];

  if (objc_msgSend((id)v17[5], "length", v10, v11, v12, v13)) {
    [(BCProgressKitController *)self updateBookProgress:v17[5] completion:0];
  }

  _Block_object_dispose(&v16, 8);
}

- (void)buildContextTree:(id)a3 forBook:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_28768;
  v15[3] = &unk_2C4480;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(workQueue, v15);
}

- (void)contextForBook:(id)a3 title:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_28FCC;
  v15[3] = &unk_2C4480;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)activeContextWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_291B8;
  v7[3] = &unk_2C4678;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)didOpenBookWithAssetID:(id)a3 version:(id)a4 title:(id)a5 pageCount:(int64_t)a6 storeID:(id)a7 completion:(id)a8
{
}

- (void)didOpenBookWithAssetID:(id)a3 version:(id)a4 title:(id)a5 pageCount:(int64_t)a6 storeID:(id)a7 coverImage:(id)a8 completion:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_29398;
  block[3] = &unk_2C49A8;
  block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v30 = v18;
  int64_t v31 = a6;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(workQueue, block);
}

- (void)addReadingStatisticsController:(id)a3 forAssetID:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    [v7 addObserver:self];
    id v8 = [(BCProgressKitController *)self readingStatisticsControllers];
    [v8 setObject:v7 forKey:v6];
  }
}

- (void)didCloseBookWithAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_297A0;
  block[3] = &unk_2C3A40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)updateBookProgress:(id)a3 completion:(id)a4
{
}

- (void)updateBookProgress:(id)a3 currentPage:(int64_t)a4 completion:(id)a5
{
}

- (void)_updateBookProgress:(id)a3 currentPage:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_29BB4;
  v13[3] = &unk_2C49F8;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, v13);
}

- (void)activateChapterForBook:(id)a3 chapterID:(id)a4 title:(id)a5 completion:(id)a6
{
}

- (void)activateChapterForBook:(id)a3 chapterID:(id)a4 title:(id)a5 currentPage:(int64_t)a6 chapterRange:(_NSRange)a7 completion:(id)a8
{
}

- (void)_activateChapterForBook:(id)a3 chapterID:(id)a4 title:(id)a5 currentPage:(int64_t)a6 chapterRange:(_NSRange)a7 completion:(id)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_2A1C8;
  v23[3] = &unk_2C4A20;
  v23[4] = self;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  NSUInteger v29 = length;
  int64_t v30 = a6;
  id v27 = v17;
  NSUInteger v28 = location;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(workQueue, v23);
}

- (id)_updateCurrentChapterProgressForBook:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v29 = 0;
  int64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_27A2C;
  v33 = sub_27A3C;
  id v34 = 0;
  id v5 = [(BCProgressKitController *)self _getActiveChapterContext:v4];
  if (v5)
  {
    id v6 = [(BCProgressKitController *)self readingStatisticsControllers];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      id v8 = [v5 identifier];
      id v9 = [(BCProgressKitController *)self _chapterHrefFromAssetID:v4 chapterID:v8];

      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x3032000000;
      id v26 = sub_27A2C;
      id v27 = sub_27A3C;
      id v28 = 0;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_2A848;
      v19[3] = &unk_2C49D0;
      id v21 = &v29;
      id v22 = &v23;
      id v10 = dispatch_semaphore_create(0);
      id v20 = v10;
      [v7 tocEntryStatisticsForHref:v9 completion:v19];
      dispatch_time_t v11 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v10, v11))
      {
        id v12 = BCProgressKitLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1EA604();
        }
      }
      if (!v30[5])
      {
        [(id)v24[5] doubleValue];
        -[BCProgressKitController _updateContext:withProgress:](self, "_updateContext:withProgress:", v5);
      }

      _Block_object_dispose(&v23, 8);
    }
    else
    {
      id v13 = [(BCProgressKitController *)self activeChapters];
      id v9 = [v13 objectForKeyedSubscript:v4];

      if ([v9 isProgressValid])
      {
        [v9 progress];
        -[BCProgressKitController _updateContext:withProgress:](self, "_updateContext:withProgress:", v5);
      }
      else
      {
        id v14 = BCProgressKitLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1EA75C();
        }
      }
    }
  }
  id v15 = (void *)v30[5];
  if (v15)
  {
    id v16 = BCProgressKitLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1EA6E0();
    }

    id v15 = (void *)v30[5];
  }
  id v17 = v15;

  _Block_object_dispose(&v29, 8);

  return v17;
}

- (void)activateSectionForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 title:(id)a6 completion:(id)a7
{
  id v7 = objc_retainBlock(a7);
  if (v7)
  {
    id v8 = v7;
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    id v7 = v8;
  }
}

- (void)updateMediaForBook:(id)a3 chapter:(id)a4 mediaCFI:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_2AA84;
  v23[3] = &unk_2C4A70;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(workQueue, v23);
}

- (void)activateWidgetForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 title:(id)a7 trackingProvider:(id)a8 cfi:(id)a9 completion:(id)a10
{
  id v32 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B25C;
  block[3] = &unk_2C4A98;
  block[4] = self;
  id v34 = v32;
  id v35 = v20;
  id v36 = v17;
  id v37 = v16;
  id v38 = v18;
  id v39 = v21;
  id v40 = v19;
  id v41 = v22;
  id v24 = v22;
  id v25 = v19;
  id v26 = v21;
  id v27 = v18;
  id v28 = v16;
  id v29 = v17;
  id v30 = v20;
  id v31 = v32;
  dispatch_async(workQueue, block);
}

- (void)deactivateCurrentWidgetForBook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B5E4;
  block[3] = &unk_2C3A40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)updateWidgetProgressForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 percent:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B834;
  block[3] = &unk_2C4AC0;
  block[4] = self;
  id v28 = v14;
  id v29 = v16;
  id v30 = v15;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v15;
  id v25 = v16;
  id v26 = v14;
  dispatch_async(workQueue, block);
}

- (void)updateWidgetScoreForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 score:(id)a7 total:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  workQueue = self->_workQueue;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_2BA84;
  v30[3] = &unk_2C4AE8;
  v30[4] = self;
  id v31 = v15;
  id v32 = v17;
  id v33 = v16;
  id v34 = v18;
  id v35 = v19;
  id v36 = v20;
  id v37 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v16;
  id v28 = v17;
  id v29 = v15;
  dispatch_async(workQueue, v30);
}

- (void)resetWidgetAttemptForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_2BCA4;
  v23[3] = &unk_2C4A70;
  v23[4] = self;
  id v24 = v12;
  id v25 = v14;
  id v26 = v13;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v13;
  id v21 = v14;
  id v22 = v12;
  dispatch_async(workQueue, v23);
}

- (void)updateBook:(id)a3 withTitle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2BE54;
  v15[3] = &unk_2C4480;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (CLSDataStore)progressKitDataStore
{
  return self->_progressKitDataStore;
}

- (NSMutableDictionary)openBooks
{
  return self->_openBooks;
}

- (void)setOpenBooks:(id)a3
{
}

- (NSMutableDictionary)activeChapters
{
  return self->_activeChapters;
}

- (void)setActiveChapters:(id)a3
{
}

- (NSMutableDictionary)activeSections
{
  return self->_activeSections;
}

- (void)setActiveSections:(id)a3
{
}

- (NSMutableDictionary)activeWidgets
{
  return self->_activeWidgets;
}

- (void)setActiveWidgets:(id)a3
{
}

- (NSMutableDictionary)activeTrackingProviders
{
  return self->_activeTrackingProviders;
}

- (void)setActiveTrackingProviders:(id)a3
{
}

- (NSMutableDictionary)readingStatisticsControllers
{
  return self->_readingStatisticsControllers;
}

- (void)setReadingStatisticsControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingStatisticsControllers, 0);
  objc_storeStrong((id *)&self->_activeTrackingProviders, 0);
  objc_storeStrong((id *)&self->_activeWidgets, 0);
  objc_storeStrong((id *)&self->_activeSections, 0);
  objc_storeStrong((id *)&self->_activeChapters, 0);
  objc_storeStrong((id *)&self->_openBooks, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end