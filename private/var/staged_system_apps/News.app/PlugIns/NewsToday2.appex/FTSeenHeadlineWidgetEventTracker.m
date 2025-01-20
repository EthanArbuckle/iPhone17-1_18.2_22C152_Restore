@interface FTSeenHeadlineWidgetEventTracker
- (BOOL)sessionHasEngagement;
- (FCFileCoordinatedDictionary)fileCoordinatedFIFOHost;
- (FTSeenHeadlineWidgetEventTracker)init;
- (FTSeenHeadlineWidgetEventTracker)initWithTodayEventTracker:(id)a3 documentsDirectory:(id)a4;
- (NSArray)visibleHeadlines;
- (NSDate)visibleHeadlinesAppearanceDate;
- (NTTodayEventTracker)todayEventTracker;
- (OS_dispatch_group)submissionGroup;
- (void)_registerOnceVisibleHeadlines:(id)a3 withLastSeenDate:(id)a4 minimumNumberOfTimesPreseenToBeSeen:(unint64_t)a5;
- (void)setFileCoordinatedFIFOHost:(id)a3;
- (void)setSessionHasEngagement:(BOOL)a3;
- (void)setSubmissionGroup:(id)a3;
- (void)setTodayEventTracker:(id)a3;
- (void)setVisibleHeadlines:(id)a3;
- (void)setVisibleHeadlinesAppearanceDate:(id)a3;
- (void)submitEventsIfNeededWithCompletion:(id)a3;
- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5;
- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5;
@end

@implementation FTSeenHeadlineWidgetEventTracker

- (FTSeenHeadlineWidgetEventTracker)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTSeenHeadlineWidgetEventTracker init]";
    __int16 v7 = 2080;
    v8 = "FTSeenHeadlineWidgetEventTracker.m";
    __int16 v9 = 1024;
    int v10 = 30;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTSeenHeadlineWidgetEventTracker init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTSeenHeadlineWidgetEventTracker)initWithTodayEventTracker:(id)a3 documentsDirectory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000E8058();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E7F94();
  }
LABEL_6:
  v21.receiver = self;
  v21.super_class = (Class)FTSeenHeadlineWidgetEventTracker;
  __int16 v9 = [(FTSeenHeadlineWidgetEventTracker *)&v21 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_todayEventTracker, a3);
    __int16 v11 = [v8 URLByAppendingPathComponent:@"seen-headline-storage" isDirectory:0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    v16 = (FCFileCoordinatedDictionary *)[objc_alloc((Class)FCFileCoordinatedDictionary) initWithFileURL:v11 allowedClasses:v15];
    fileCoordinatedFIFOHost = v10->_fileCoordinatedFIFOHost;
    v10->_fileCoordinatedFIFOHost = v16;

    dispatch_group_t v18 = dispatch_group_create();
    submissionGroup = v10->_submissionGroup;
    v10->_submissionGroup = (OS_dispatch_group *)v18;
  }
  return v10;
}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 4)
  {
    int v10 = [(FTSeenHeadlineWidgetEventTracker *)self visibleHeadlines];
    __int16 v11 = [(FTSeenHeadlineWidgetEventTracker *)self visibleHeadlinesAppearanceDate];
    id v12 = [v11 copy];

    if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000E81E0();
    }
    uint64_t v13 = v12;
    if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000E811C();
    }
    v27 = v10;
    uint64_t v14 = [v10 fc_arrayOfObjectsPassingTest:&stru_100124040];
    v15 = +[UIDevice currentDevice];
    id v16 = [v15 userInterfaceIdiom];

    v17 = +[UIApplication sharedApplication];
    dispatch_group_t v18 = [v17 keyWindow];
    v19 = [v18 windowScene];
    v20 = (char *)[v19 interfaceOrientation];

    if ((v16 != (id)1 || (unint64_t)(v20 - 3) >= 2)
      && [v9 stackLocation] == (id)1
      && [v14 count]
      && ![(FTSeenHeadlineWidgetEventTracker *)self sessionHasEngagement])
    {
      objc_super v21 = +[NSDate date];
      [v21 timeIntervalSinceDate:v13];
      unint64_t v22 = FCSecondsToMilliseconds();
      v23 = [v9 fetchInfoForVisibleResults];
      v24 = [v23 widgetConfig];

      if (v22 >= (unint64_t)[v24 minimumArticleExposureDurationToBePreseen]) {
        -[FTSeenHeadlineWidgetEventTracker _registerOnceVisibleHeadlines:withLastSeenDate:minimumNumberOfTimesPreseenToBeSeen:](self, "_registerOnceVisibleHeadlines:withLastSeenDate:minimumNumberOfTimesPreseenToBeSeen:", v14, v21, [v24 minimumNumberOfTimesPreseenToBeSeen]);
      }
    }
    [(FTSeenHeadlineWidgetEventTracker *)self setSessionHasEngagement:0];
  }
  [(FTSeenHeadlineWidgetEventTracker *)self setVisibleHeadlinesAppearanceDate:v8];
  v25 = [v9 visibleItems];
  v26 = [v25 fc_arrayByTransformingWithBlock:&stru_100124080];
  [(FTSeenHeadlineWidgetEventTracker *)self setVisibleHeadlines:v26];
}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E82A4();
  }
  [(FTSeenHeadlineWidgetEventTracker *)self setSessionHasEngagement:1];
}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FTSeenHeadlineWidgetEventTracker *)self submissionGroup];
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_registerOnceVisibleHeadlines:(id)a3 withLastSeenDate:(id)a4 minimumNumberOfTimesPreseenToBeSeen:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  +[NSThread isMainThread];
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E8368();
  }
  id v10 = [(FTSeenHeadlineWidgetEventTracker *)self todayEventTracker];
  __int16 v11 = [(FTSeenHeadlineWidgetEventTracker *)self submissionGroup];
  dispatch_group_enter(v11);

  id v12 = [(FTSeenHeadlineWidgetEventTracker *)self fileCoordinatedFIFOHost];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100017580;
  v17[3] = &unk_1001240D0;
  id v21 = v9;
  unint64_t v22 = a5;
  id v18 = v8;
  v19 = self;
  id v20 = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100017AB0;
  v16[3] = &unk_1001240F8;
  v16[4] = self;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  [v12 writeWithAccessor:v17 completion:v16];
}

- (NTTodayEventTracker)todayEventTracker
{
  return self->_todayEventTracker;
}

- (void)setTodayEventTracker:(id)a3
{
}

- (FCFileCoordinatedDictionary)fileCoordinatedFIFOHost
{
  return self->_fileCoordinatedFIFOHost;
}

- (void)setFileCoordinatedFIFOHost:(id)a3
{
}

- (NSArray)visibleHeadlines
{
  return self->_visibleHeadlines;
}

- (void)setVisibleHeadlines:(id)a3
{
}

- (NSDate)visibleHeadlinesAppearanceDate
{
  return self->_visibleHeadlinesAppearanceDate;
}

- (void)setVisibleHeadlinesAppearanceDate:(id)a3
{
}

- (BOOL)sessionHasEngagement
{
  return self->_sessionHasEngagement;
}

- (void)setSessionHasEngagement:(BOOL)a3
{
  self->_sessionHasEngagement = a3;
}

- (OS_dispatch_group)submissionGroup
{
  return self->_submissionGroup;
}

- (void)setSubmissionGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionGroup, 0);
  objc_storeStrong((id *)&self->_visibleHeadlinesAppearanceDate, 0);
  objc_storeStrong((id *)&self->_visibleHeadlines, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedFIFOHost, 0);

  objc_storeStrong((id *)&self->_todayEventTracker, 0);
}

@end