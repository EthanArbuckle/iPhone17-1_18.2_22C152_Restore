@interface WalkingRequestInfoProvider
- (RoutePlanningTiming)timing;
- (WalkPreferences)walkPreferences;
- (WalkingRequestInfoProvider)initWithPreferences:(id)a3 timing:(id)a4;
- (WatchSyncedPreferences)preferences;
- (id)makeRouteAttributesBuilderWithNavigationMode:(unint64_t)a3;
- (unint64_t)maximumRouteCount;
- (void)updateWithRefinedWaypoints:(id)a3;
@end

@implementation WalkingRequestInfoProvider

- (WalkingRequestInfoProvider)initWithPreferences:(id)a3 timing:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WalkingRequestInfoProvider;
  v9 = [(WalkingRequestInfoProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preferences, a3);
    objc_storeStrong((id *)&v10->_timing, a4);
  }

  return v10;
}

- (WalkPreferences)walkPreferences
{
  return (WalkPreferences *)self->_preferences;
}

- (id)makeRouteAttributesBuilderWithNavigationMode:(unint64_t)a3
{
  v4 = [WalkingRouteAttributesBuilder alloc];
  v5 = [(WalkingRequestInfoProvider *)self walkPreferences];
  v6 = [(WalkingRouteAttributesBuilder *)v4 initWithWalkPreferences:v5];

  return v6;
}

- (void)updateWithRefinedWaypoints:(id)a3
{
  id v4 = a3;
  v5 = [v4 origin];
  v6 = [v5 geoMapItem];
  id v7 = [v6 timezone];

  id v8 = [v4 destination];

  v9 = [v8 geoMapItem];
  v10 = [v9 timezone];

  timing = self->_timing;
  if (timing) {
    [(RoutePlanningTiming *)timing timepoint];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  objc_super v12 = +[RoutePlanningTiming timingWithTimePoint:v14 departureTimeZone:v7 arrivalTimeZone:v10];
  v13 = self->_timing;
  self->_timing = v12;
}

- (unint64_t)maximumRouteCount
{
  return 3;
}

- (WatchSyncedPreferences)preferences
{
  return self->_preferences;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timing, 0);

  objc_storeStrong((id *)&self->_preferences, 0);
}

@end