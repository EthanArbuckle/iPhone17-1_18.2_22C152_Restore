@interface DrivingRouteAttributesBuilder
- (DrivePreferences)drivePreferences;
- (DrivingRouteAttributesBuilder)initWithDrivePreferences:(id)a3 timing:(id)a4;
- (RoutePlanningTiming)timing;
- (void)fillRouteAttributes:(id)a3;
@end

@implementation DrivingRouteAttributesBuilder

- (DrivingRouteAttributesBuilder)initWithDrivePreferences:(id)a3 timing:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DrivingRouteAttributesBuilder;
  v9 = [(DrivingRouteAttributesBuilder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_drivePreferences, a3);
    objc_storeStrong((id *)&v10->_timing, a4);
  }

  return v10;
}

- (void)fillRouteAttributes:(id)a3
{
  id v4 = a3;
  [v4 setMainTransportType:0];
  v5 = [(DrivingRouteAttributesBuilder *)self drivePreferences];
  v6 = [v5 automobileOptions];
  [v4 setAutomobileOptions:v6];

  long long v11 = 0uLL;
  uint64_t v12 = 0;
  timing = self->_timing;
  if (timing)
  {
    [(RoutePlanningTiming *)timing timepoint];
    if ((~BYTE4(v12) & 6) == 0)
    {
      long long v9 = v11;
      uint64_t v10 = v12;
      [v4 setTimepoint:&v9];
    }
  }
  [v4 addUiContext:4];
  [v4 setIncludePhonetics:1];
  if (GEOConfigGetBOOL()) {
    uint64_t v8 = MGGetBoolAnswer();
  }
  else {
    uint64_t v8 = 0;
  }
  [v4 setIncludeCellularCoverage:v8];
}

- (DrivePreferences)drivePreferences
{
  return self->_drivePreferences;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timing, 0);

  objc_storeStrong((id *)&self->_drivePreferences, 0);
}

@end