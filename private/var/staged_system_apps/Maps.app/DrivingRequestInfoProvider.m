@interface DrivingRequestInfoProvider
- (DrivePreferences)drivePreferences;
- (DrivingRequestInfoProvider)initWithPreferences:(id)a3 timing:(id)a4;
- (NSNumber)maximumRouteCountOverride;
- (RoutePlanningTiming)timing;
- (WatchSyncedPreferences)preferences;
- (id)makeRouteAttributesBuilderWithNavigationMode:(unint64_t)a3;
- (unint64_t)maximumRouteCount;
- (void)setMaximumRouteCountOverride:(id)a3;
- (void)updateWithRefinedWaypoints:(id)a3;
@end

@implementation DrivingRequestInfoProvider

- (DrivingRequestInfoProvider)initWithPreferences:(id)a3 timing:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DrivingRequestInfoProvider;
  v9 = [(DrivingRequestInfoProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preferences, a3);
    objc_storeStrong((id *)&v10->_timing, a4);
  }

  return v10;
}

- (DrivePreferences)drivePreferences
{
  return (DrivePreferences *)self->_preferences;
}

- (id)makeRouteAttributesBuilderWithNavigationMode:(unint64_t)a3
{
  v4 = [DrivingRouteAttributesBuilder alloc];
  v5 = [(DrivingRequestInfoProvider *)self drivePreferences];
  v6 = [(DrivingRouteAttributesBuilder *)v4 initWithDrivePreferences:v5 timing:self->_timing];

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
  v3 = [(DrivingRequestInfoProvider *)self maximumRouteCountOverride];

  if (!v3) {
    return 3;
  }
  id v4 = [(DrivingRequestInfoProvider *)self maximumRouteCountOverride];
  id v5 = [v4 unsignedIntegerValue];

  return (unint64_t)v5;
}

- (WatchSyncedPreferences)preferences
{
  return self->_preferences;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (NSNumber)maximumRouteCountOverride
{
  return self->_maximumRouteCountOverride;
}

- (void)setMaximumRouteCountOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumRouteCountOverride, 0);
  objc_storeStrong((id *)&self->_timing, 0);

  objc_storeStrong((id *)&self->_preferences, 0);
}

@end