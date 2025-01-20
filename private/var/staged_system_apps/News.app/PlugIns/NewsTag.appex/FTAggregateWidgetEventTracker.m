@interface FTAggregateWidgetEventTracker
- (FTAggregateWidgetEventTracker)init;
- (FTAggregateWidgetEventTracker)initWithEventTrackers:(id)a3;
- (NSArray)eventTrackers;
- (OS_dispatch_group)submissionGroup;
- (id)_eventTrackersRespondingToSelector:(SEL)a3;
- (void)setEventTrackers:(id)a3;
- (void)setSubmissionGroup:(id)a3;
- (void)submitEventsIfNeededWithCompletion:(id)a3;
- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5;
- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5;
- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6;
@end

@implementation FTAggregateWidgetEventTracker

- (FTAggregateWidgetEventTracker)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTAggregateWidgetEventTracker init]";
    __int16 v7 = 2080;
    v8 = "FTAggregateWidgetEventTracker.m";
    __int16 v9 = 1024;
    int v10 = 22;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTAggregateWidgetEventTracker init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTAggregateWidgetEventTracker)initWithEventTrackers:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C8F28();
  }
  v11.receiver = self;
  v11.super_class = (Class)FTAggregateWidgetEventTracker;
  v5 = [(FTAggregateWidgetEventTracker *)&v11 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    eventTrackers = v5->_eventTrackers;
    v5->_eventTrackers = v6;

    dispatch_group_t v8 = dispatch_group_create();
    submissionGroup = v5->_submissionGroup;
    v5->_submissionGroup = (OS_dispatch_group *)v8;
  }
  return v5;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C9008();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  __int16 v9 = -[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) widgetDidAppearAtDate:v7 withTrackableWidgetState:v8];
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  __int16 v9 = -[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) widgetDidDisappearAtDate:v7 withTrackableWidgetState:v8];
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v14 = -[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0);
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) widgetPerformedUpdateWithTodayResults:v11 fetchInfo:v12 error:v13 updateFetchDuration:a6];
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = -[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) visibleItemsDidChangeAtDate:v9 withTriggerEvent:a4 trackableWidgetState:v10];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = -[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0);
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) userEngagedWithWidgetAtDate:v9 actionURL:v10 trackableWidgetState:v11];
        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  dispatch_block_t block = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(FTAggregateWidgetEventTracker *)self _eventTrackersRespondingToSelector:a2];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
        id v11 = [(FTAggregateWidgetEventTracker *)self submissionGroup];
        dispatch_group_enter(v11);

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100016520;
        v14[3] = &unk_1000FB800;
        v14[4] = self;
        [v10 submitEventsIfNeededWithCompletion:v14];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v12 = [(FTAggregateWidgetEventTracker *)self submissionGroup];
  dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_eventTrackersRespondingToSelector:(SEL)a3
{
  id v4 = [(FTAggregateWidgetEventTracker *)self eventTrackers];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001660C;
  v7[3] = &unk_1000FB820;
  v7[4] = a3;
  v5 = [v4 fc_arrayOfObjectsPassingTest:v7];

  return v5;
}

- (NSArray)eventTrackers
{
  return self->_eventTrackers;
}

- (void)setEventTrackers:(id)a3
{
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

  objc_storeStrong((id *)&self->_eventTrackers, 0);
}

@end