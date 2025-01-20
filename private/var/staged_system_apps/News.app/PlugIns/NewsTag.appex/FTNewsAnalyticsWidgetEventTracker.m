@interface FTNewsAnalyticsWidgetEventTracker
- (FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker)nonVideoContentEventTracker;
- (FTNewsAnalyticsWidgetEventTracker)init;
- (FTNewsAnalyticsWidgetEventTracker)initWithUserIDProvider:(id)a3;
- (FTWidgetEventTracker)eventTrackersProxy;
- (NSArray)eventAccumulators;
- (NSHashTable)observers;
- (NSSNewsAnalyticsSessionAnnotator)sessionAnnotator;
- (NTPBSession)currentSession;
- (OS_dispatch_group)submissionGroup;
- (int)_pbDisplayModeWithDisplayMode:(unint64_t)a3;
- (void)addObserver:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setEventAccumulators:(id)a3;
- (void)setEventTrackersProxy:(id)a3;
- (void)setSessionAnnotator:(id)a3;
- (void)submitEventsIfNeededWithCompletion:(id)a3;
- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5;
- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5;
- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6;
@end

@implementation FTNewsAnalyticsWidgetEventTracker

- (FTNewsAnalyticsWidgetEventTracker)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTNewsAnalyticsWidgetEventTracker init]";
    __int16 v7 = 2080;
    v8 = "FTNewsAnalyticsWidgetEventTracker.m";
    __int16 v9 = 1024;
    int v10 = 36;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTNewsAnalyticsWidgetEventTracker init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTNewsAnalyticsWidgetEventTracker)initWithUserIDProvider:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C8E3C();
  }
  v24.receiver = self;
  v24.super_class = (Class)FTNewsAnalyticsWidgetEventTracker;
  v5 = [(FTNewsAnalyticsWidgetEventTracker *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    sessionAnnotator = v5->_sessionAnnotator;
    v5->_sessionAnnotator = (NSSNewsAnalyticsSessionAnnotator *)v6;

    v8 = [[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker alloc] initWithSessionManager:v5 userIDProvider:v4];
    __int16 v9 = [FTAggregateWidgetEventTracker alloc];
    v26 = v8;
    int v10 = +[NSArray arrayWithObjects:&v26 count:1];
    __int16 v11 = [(FTAggregateWidgetEventTracker *)v9 initWithEventTrackers:v10];

    id v12 = [[FTConditionalWidgetEventTracker alloc] initWithWidgetEventTracker:v11 predicate:&stru_1000FB748];
    eventTrackersProxy = v5->_eventTrackersProxy;
    v5->_eventTrackersProxy = (FTWidgetEventTracker *)v12;

    v14 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)v8 accumulator];
    v25 = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:&v25 count:1];
    eventAccumulators = v5->_eventAccumulators;
    v5->_eventAccumulators = (NSArray *)v15;

    nonVideoContentEventTracker = v5->_nonVideoContentEventTracker;
    v5->_nonVideoContentEventTracker = v8;
    v18 = v8;

    uint64_t v19 = +[NSHashTable hashTableWithOptions:517];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v19;

    dispatch_group_t v21 = dispatch_group_create();
    submissionGroup = v5->_submissionGroup;
    v5->_submissionGroup = (OS_dispatch_group *)v21;
  }
  return v5;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v18 = (id)objc_opt_new();
  v8 = [(FTNewsAnalyticsWidgetEventTracker *)self sessionAnnotator];
  [v8 annotateSession:v18 withOptions:30719];

  __int16 v9 = [v6 fetchInfoForVisibleResults];
  int v10 = +[NSUUID UUID];
  __int16 v11 = [v10 UUIDString];

  id v12 = [v9 appConfigTreatmentID];
  [v18 setAppConfigTreatmentId:[v12 integerValue]];

  v13 = [v9 userID];
  [v18 setUserId:v13];

  [v18 setWidgetDisplayMode:[self _pbDisplayModeWithDisplayMode:[v6 activeDisplayMode]]];
  v14 = FCUUIDStringToUUIDBytes();
  [v18 setWidgetSessionId:v14];

  [v18 setRunningObsolete:0];
  [v18 setUserSegmentationSegmentSetIds:[v9 userSegmentationSegmentSetIds] count:[v9 userSegmentationSegmentSetIdsCount]];
  [v18 setUserSegmentationTreatmentIds:[v9 userSegmentationTreatmentIds] count:[v9 userSegmentationTreatmentIdsCount]];
  [(FTNewsAnalyticsWidgetEventTracker *)self setCurrentSession:v18];
  uint64_t v15 = [(FTNewsAnalyticsWidgetEventTracker *)self observers];
  v16 = [v15 allObjects];
  [v16 makeObjectsPerformSelector:"sessionDidStartWithSessionID:" withObject:v11];

  v17 = [(FTNewsAnalyticsWidgetEventTracker *)self eventTrackersProxy];
  [v17 widgetDidAppearAtDate:v7 withTrackableWidgetState:v6];
}

- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[FTNewsAnalyticsWidgetEventTracker _pbDisplayModeWithDisplayMode:](self, "_pbDisplayModeWithDisplayMode:", [v6 activeDisplayMode]);
  __int16 v9 = [(FTNewsAnalyticsWidgetEventTracker *)self currentSession];
  [v9 setWidgetDisplayModeSessionEnd:v8];

  int v10 = [(FTNewsAnalyticsWidgetEventTracker *)self eventTrackersProxy];
  [v10 widgetDidDisappearAtDate:v7 withTrackableWidgetState:v6];

  __int16 v11 = [(FTNewsAnalyticsWidgetEventTracker *)self observers];
  id v12 = [v11 allObjects];
  [v12 makeObjectsPerformSelector:"sessionWillEnd"];

  v13 = [(FTNewsAnalyticsWidgetEventTracker *)self eventAccumulators];
  v14 = [v13 fc_arrayByTransformingWithBlock:&stru_1000FB788];

  if ([v14 count])
  {
    uint64_t v15 = [(FTNewsAnalyticsWidgetEventTracker *)self submissionGroup];
    dispatch_group_enter(v15);

    v16 = objc_opt_new();
    [v16 setEnvelopes:v14];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100015290;
    v17[3] = &unk_1000FB7B0;
    v17[4] = self;
    [v16 setSubmissionCompletion:v17];
    [v16 start];
  }
  [(FTNewsAnalyticsWidgetEventTracker *)self setCurrentSession:0];
}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(FTNewsAnalyticsWidgetEventTracker *)self eventTrackersProxy];
  [v13 widgetPerformedUpdateWithTodayResults:v12 fetchInfo:v11 error:v10 updateFetchDuration:a6];
}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(FTNewsAnalyticsWidgetEventTracker *)self eventTrackersProxy];
  [v10 visibleItemsDidChangeAtDate:v9 withTriggerEvent:a4 trackableWidgetState:v8];
}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FTNewsAnalyticsWidgetEventTracker *)self eventTrackersProxy];
  [v11 userEngagedWithWidgetAtDate:v10 actionURL:v9 trackableWidgetState:v8];
}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FTNewsAnalyticsWidgetEventTracker *)self submissionGroup];
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = [(FTNewsAnalyticsWidgetEventTracker *)self observers];
  [v5 addObject:v4];
}

- (int)_pbDisplayModeWithDisplayMode:(unint64_t)a3
{
  if (a3 - 1 < 7) {
    return a3;
  }
  else {
    return 0;
  }
}

- (FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker)nonVideoContentEventTracker
{
  return self->_nonVideoContentEventTracker;
}

- (NSArray)eventAccumulators
{
  return self->_eventAccumulators;
}

- (void)setEventAccumulators:(id)a3
{
}

- (FTWidgetEventTracker)eventTrackersProxy
{
  return self->_eventTrackersProxy;
}

- (void)setEventTrackersProxy:(id)a3
{
}

- (NSSNewsAnalyticsSessionAnnotator)sessionAnnotator
{
  return self->_sessionAnnotator;
}

- (void)setSessionAnnotator:(id)a3
{
}

- (NTPBSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_group)submissionGroup
{
  return self->_submissionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionGroup, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sessionAnnotator, 0);
  objc_storeStrong((id *)&self->_eventTrackersProxy, 0);
  objc_storeStrong((id *)&self->_eventAccumulators, 0);

  objc_storeStrong((id *)&self->_nonVideoContentEventTracker, 0);
}

@end