@interface CyclePreferences
- (BOOL)avoidBusyRoads;
- (BOOL)avoidHills;
- (BOOL)ebike;
- (BOOL)hasAnyNonStandardPreferences;
- (CyclePreferences)initWithAvoidHills:(BOOL)a3 avoidBusyRoads:(BOOL)a4 ebike:(BOOL)a5 defaults:(id)a6;
- (CyclePreferences)initWithCopy:(id)a3;
- (CyclePreferences)initWithCyclingOptions:(id)a3 defaults:(id)a4;
- (CyclePreferences)initWithDefaults:(id)a3;
- (id)_keys;
- (id)_values;
- (id)cyclingOptions;
- (void)loadValuesFromDefaults;
- (void)setAvoidBusyRoads:(BOOL)a3;
- (void)setAvoidHills:(BOOL)a3;
- (void)setEbike:(BOOL)a3;
@end

@implementation CyclePreferences

- (BOOL)ebike
{
  return self->_ebike;
}

- (BOOL)avoidHills
{
  return self->_avoidHills;
}

- (BOOL)avoidBusyRoads
{
  return self->_avoidBusyRoads;
}

- (CyclePreferences)initWithDefaults:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CyclePreferences;
  return [(WatchSyncedPreferences *)&v4 initWithDefaults:a3];
}

- (id)cyclingOptions
{
  v3 = objc_opt_new();
  [v3 setAvoidHills:[self avoidHills]];
  [v3 setAvoidBusyRoads:[self avoidBusyRoads]];
  id v4 = objc_alloc_init((Class)GEOCyclingVehicleSpecifications);
  [v4 setIsEbike:[self ebike]];
  v5 = objc_opt_new();
  [v5 setCyclingUserPreferences:v3];
  [v5 setCyclingVehicleSpecifications:v4];

  return v5;
}

- (void)loadValuesFromDefaults
{
  v3 = [(WatchSyncedPreferences *)self defaults];
  -[CyclePreferences setAvoidHills:](self, "setAvoidHills:", [v3 BOOLForKey:@"MapsDefaultAvoidHillsKey"]);

  id v4 = [(WatchSyncedPreferences *)self defaults];
  -[CyclePreferences setAvoidBusyRoads:](self, "setAvoidBusyRoads:", [v4 BOOLForKey:@"MapsDefaultAvoidBusyRoadsKey"]);

  id v5 = [(WatchSyncedPreferences *)self defaults];
  -[CyclePreferences setEbike:](self, "setEbike:", [v5 BOOLForKey:@"MapsDefaultUseEbikeKey"]);
}

- (void)setEbike:(BOOL)a3
{
  self->_ebike = a3;
}

- (void)setAvoidHills:(BOOL)a3
{
  self->_avoidHills = a3;
}

- (void)setAvoidBusyRoads:(BOOL)a3
{
  self->_avoidBusyRoads = a3;
}

- (CyclePreferences)initWithAvoidHills:(BOOL)a3 avoidBusyRoads:(BOOL)a4 ebike:(BOOL)a5 defaults:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)CyclePreferences;
  result = [(WatchSyncedPreferences *)&v10 initWithDefaults:a6];
  if (result)
  {
    result->_avoidHills = a3;
    result->_avoidBusyRoads = a4;
    result->_ebike = a5;
  }
  return result;
}

- (CyclePreferences)initWithCyclingOptions:(id)a3 defaults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 cyclingUserPreferences];
  v9 = [v7 cyclingVehicleSpecifications];

  objc_super v10 = [CyclePreferences initWithAvoidHills:[v8 avoidHills] avoidBusyRoads:[v8 avoidBusyRoads] ebike:[v9 isEbike] defaults:v6];
  return v10;
}

- (CyclePreferences)initWithCopy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CyclePreferences;
  id v5 = [(WatchSyncedPreferences *)&v8 initWithCopy:v4];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if (isKindOfClass)
      {
        v5->_avoidHills = v4[24];
        v5->_avoidBusyRoads = v4[25];
        v5->_ebike = v4[26];
      }
    }
  }

  return v5;
}

- (BOOL)hasAnyNonStandardPreferences
{
  if ([(CyclePreferences *)self avoidHills]) {
    return 1;
  }

  return [(CyclePreferences *)self avoidBusyRoads];
}

- (id)_keys
{
  return &off_1013AD698;
}

- (id)_values
{
  v3 = +[NSNumber numberWithBool:self->_avoidHills];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidBusyRoads, v3);
  v8[1] = v4;
  id v5 = +[NSNumber numberWithBool:self->_ebike];
  v8[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

@end