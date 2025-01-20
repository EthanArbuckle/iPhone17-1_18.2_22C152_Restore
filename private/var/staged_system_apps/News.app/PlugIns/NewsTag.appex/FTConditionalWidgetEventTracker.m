@interface FTConditionalWidgetEventTracker
- (BOOL)_shouldReportEventWithTodayResults:(id)a3 fetchInfo:(id)a4;
- (BOOL)_shouldReportEventWithTrackableWidgetState:(id)a3;
- (FTConditionalWidgetEventTracker)init;
- (FTConditionalWidgetEventTracker)initWithWidgetEventTracker:(id)a3 predicate:(id)a4;
- (FTSelectiveWidgetEventTracker)widgetEventTracker;
- (id)predicate;
- (void)setPredicate:(id)a3;
- (void)setWidgetEventTracker:(id)a3;
- (void)submitEventsIfNeededWithCompletion:(id)a3;
- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5;
- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5;
- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6;
@end

@implementation FTConditionalWidgetEventTracker

- (FTConditionalWidgetEventTracker)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTConditionalWidgetEventTracker init]";
    __int16 v7 = 2080;
    v8 = "FTConditionalWidgetEventTracker.m";
    __int16 v9 = 1024;
    int v10 = 22;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTConditionalWidgetEventTracker init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTConditionalWidgetEventTracker)initWithWidgetEventTracker:(id)a3 predicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000C9B14();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C9A50();
  }
LABEL_6:
  v13.receiver = self;
  v13.super_class = (Class)FTConditionalWidgetEventTracker;
  __int16 v9 = [(FTConditionalWidgetEventTracker *)&v13 init];
  if (v9)
  {
    id v10 = [v8 copy];
    id predicate = v9->_predicate;
    v9->_id predicate = v10;

    objc_storeStrong((id *)&v9->_widgetEventTracker, a3);
  }

  return v9;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000C9C9C();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C9BD8();
  }
LABEL_6:
  if ([(FTConditionalWidgetEventTracker *)self _shouldReportEventWithTrackableWidgetState:v7])
  {
    id v8 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
      [v10 widgetDidAppearAtDate:v6 withTrackableWidgetState:v7];
    }
  }
}

- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(FTConditionalWidgetEventTracker *)self _shouldReportEventWithTrackableWidgetState:v6])
  {
    id v7 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
      [v9 widgetDidDisappearAtDate:v10 withTrackableWidgetState:v6];
    }
  }
}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(FTConditionalWidgetEventTracker *)self _shouldReportEventWithTodayResults:v15 fetchInfo:v10])
  {
    id v12 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
      [v14 widgetPerformedUpdateWithTodayResults:v15 fetchInfo:v10 error:v11 updateFetchDuration:a6];
    }
  }
}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  if ([(FTConditionalWidgetEventTracker *)self _shouldReportEventWithTrackableWidgetState:v8])
  {
    char v9 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
      [v11 visibleItemsDidChangeAtDate:v12 withTriggerEvent:a4 trackableWidgetState:v8];
    }
  }
}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(FTConditionalWidgetEventTracker *)self _shouldReportEventWithTrackableWidgetState:v9])
  {
    char v10 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
      [v12 userEngagedWithWidgetAtDate:v13 actionURL:v8 trackableWidgetState:v9];
    }
  }
}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  id v7 = (void (**)(void))a3;
  id v4 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(FTConditionalWidgetEventTracker *)self widgetEventTracker];
    [v6 submitEventsIfNeededWithCompletion:v7];
  }
  else
  {
    v7[2]();
  }
}

- (BOOL)_shouldReportEventWithTrackableWidgetState:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C9D60();
  }
  char v5 = [v4 todayResults];
  id v6 = [v4 fetchInfoForVisibleResults];
  BOOL v7 = [(FTConditionalWidgetEventTracker *)self _shouldReportEventWithTodayResults:v5 fetchInfo:v6];

  return v7;
}

- (BOOL)_shouldReportEventWithTodayResults:(id)a3 fetchInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C9E24();
  }
  id v8 = [(FTConditionalWidgetEventTracker *)self predicate];
  char v9 = ((uint64_t (**)(void, id, id))v8)[2](v8, v6, v7);

  return v9;
}

- (id)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (FTSelectiveWidgetEventTracker)widgetEventTracker
{
  return self->_widgetEventTracker;
}

- (void)setWidgetEventTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEventTracker, 0);

  objc_storeStrong(&self->_predicate, 0);
}

@end