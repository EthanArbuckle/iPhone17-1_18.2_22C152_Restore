@interface FTProactiveWidgetEventTracker
- (FTProactiveWidgetEventTracker)init;
- (FTProactiveWidgetEventTracker)initWithMaxRowCount:(unint64_t)a3 trackedEvents:(unint64_t)a4;
- (FTWidgetAppearanceEventTracker)widgetAppearanceEventTracker;
- (FTWidgetLingerEventTracker)widgetLingerEventTracker;
- (FTWidgetUpdateEventTracker)widgetUpdateEventTracker;
- (NTHeadlineEngagementEventTracker)headlineEngagementEventTracker;
- (unint64_t)trackedEvents;
- (void)setHeadlineEngagementEventTracker:(id)a3;
- (void)setTrackedEvents:(unint64_t)a3;
- (void)setWidgetAppearanceEventTracker:(id)a3;
- (void)setWidgetLingerEventTracker:(id)a3;
- (void)setWidgetUpdateEventTracker:(id)a3;
- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6;
@end

@implementation FTProactiveWidgetEventTracker

- (FTProactiveWidgetEventTracker)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTProactiveWidgetEventTracker init]";
    __int16 v7 = 2080;
    v8 = "FTProactiveWidgetEventTracker.m";
    __int16 v9 = 1024;
    int v10 = 31;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTProactiveWidgetEventTracker init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTProactiveWidgetEventTracker)initWithMaxRowCount:(unint64_t)a3 trackedEvents:(unint64_t)a4
{
  v17.receiver = self;
  v17.super_class = (Class)FTProactiveWidgetEventTracker;
  v6 = [(FTProactiveWidgetEventTracker *)&v17 init];
  __int16 v7 = v6;
  if (v6)
  {
    v6->_trackedEvents = a4;
    v8 = [[NTHeadlineEngagementEventTracker alloc] initWithMaxRowCount:a3];
    headlineEngagementEventTracker = v7->_headlineEngagementEventTracker;
    v7->_headlineEngagementEventTracker = v8;

    int v10 = [[FTWidgetAppearanceEventTracker alloc] initWithMaxRowCount:a3];
    widgetAppearanceEventTracker = v7->_widgetAppearanceEventTracker;
    v7->_widgetAppearanceEventTracker = v10;

    uint64_t v12 = objc_opt_new();
    widgetUpdateEventTracker = v7->_widgetUpdateEventTracker;
    v7->_widgetUpdateEventTracker = (FTWidgetUpdateEventTracker *)v12;

    uint64_t v14 = objc_opt_new();
    widgetLingerEventTracker = v7->_widgetLingerEventTracker;
    v7->_widgetLingerEventTracker = (FTWidgetLingerEventTracker *)v14;
  }
  return v7;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E7EA8();
  }
  if ([(FTProactiveWidgetEventTracker *)self trackedEvents])
  {
    v8 = [v7 fetchInfoForVisibleResults];
    __int16 v9 = [v8 todaySourceIdentifier];
    int v10 = [v8 appConfigTreatmentID];
    id v11 = [v7 appearanceType];
    uint64_t v12 = [(FTProactiveWidgetEventTracker *)self widgetAppearanceEventTracker];
    [v12 trackAppearanceAtDate:v6 withHeadlineSource:v9 appConfigTreatmentID:v10 appearanceType:v11 allItemsCount:[v7 allItemsCount]];

    v13 = [(FTProactiveWidgetEventTracker *)self widgetLingerEventTracker];
    [v13 trackWidgetLingerEventExtremity:0 atDate:v6 withTodaySource:v9 appConfigTreatmentID:v10 widgetDisplayMode:[v7 activeDisplayMode] appearanceType:v11];
  }
}

- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([(FTProactiveWidgetEventTracker *)self trackedEvents])
  {
    id v7 = [(FTProactiveWidgetEventTracker *)self widgetAppearanceEventTracker];
    [v7 trackDisappearance];

    v8 = [v6 fetchInfoForVisibleResults];
    __int16 v9 = [(FTProactiveWidgetEventTracker *)self widgetLingerEventTracker];
    int v10 = [v8 todaySourceIdentifier];
    id v11 = [v8 appConfigTreatmentID];
    [v9 trackWidgetLingerEventExtremity:1 atDate:v12 withTodaySource:v10 appConfigTreatmentID:v11 widgetDisplayMode:[v6 activeDisplayMode] appearanceType:[v6 appearanceType]];
  }
}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  id v13 = a4;
  id v9 = a5;
  if (([(FTProactiveWidgetEventTracker *)self trackedEvents] & 2) != 0)
  {
    int v10 = [(FTProactiveWidgetEventTracker *)self widgetUpdateEventTracker];
    id v11 = [v13 todaySourceIdentifier];
    id v12 = [v13 appConfigTreatmentID];
    [v10 trackUpdateWithTodaySource:v11 appConfigTreatmentID:v12 error:v9 updateFetchDuration:[v13 wifiReachable] cellularRadioAccessTechnology:[v13 cellularRadioAccessTechnology] wifiReachable:a6];
  }
}

- (NTHeadlineEngagementEventTracker)headlineEngagementEventTracker
{
  return self->_headlineEngagementEventTracker;
}

- (void)setHeadlineEngagementEventTracker:(id)a3
{
}

- (FTWidgetAppearanceEventTracker)widgetAppearanceEventTracker
{
  return self->_widgetAppearanceEventTracker;
}

- (void)setWidgetAppearanceEventTracker:(id)a3
{
}

- (FTWidgetLingerEventTracker)widgetLingerEventTracker
{
  return self->_widgetLingerEventTracker;
}

- (void)setWidgetLingerEventTracker:(id)a3
{
}

- (FTWidgetUpdateEventTracker)widgetUpdateEventTracker
{
  return self->_widgetUpdateEventTracker;
}

- (void)setWidgetUpdateEventTracker:(id)a3
{
}

- (unint64_t)trackedEvents
{
  return self->_trackedEvents;
}

- (void)setTrackedEvents:(unint64_t)a3
{
  self->_trackedEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUpdateEventTracker, 0);
  objc_storeStrong((id *)&self->_widgetLingerEventTracker, 0);
  objc_storeStrong((id *)&self->_widgetAppearanceEventTracker, 0);

  objc_storeStrong((id *)&self->_headlineEngagementEventTracker, 0);
}

@end