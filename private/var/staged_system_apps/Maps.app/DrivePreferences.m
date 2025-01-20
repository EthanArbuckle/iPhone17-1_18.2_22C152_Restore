@interface DrivePreferences
- (BOOL)avoidHighways;
- (BOOL)avoidTolls;
- (BOOL)hasAnyNonStandardPreferences;
- (BOOL)ignoreLiveTraffic;
- (DrivePreferences)initWithAutomobileOptions:(id)a3 defaults:(id)a4;
- (DrivePreferences)initWithAvoidTolls:(BOOL)a3 avoidHighways:(BOOL)a4 ignoreLiveTraffic:(BOOL)a5 defaults:(id)a6;
- (DrivePreferences)initWithCopy:(id)a3;
- (DrivePreferences)initWithDefaults:(id)a3;
- (id)_keys;
- (id)_values;
- (id)automobileOptions;
- (void)loadValuesFromDefaults;
- (void)setAvoidHighways:(BOOL)a3;
- (void)setAvoidTolls:(BOOL)a3;
- (void)setIgnoreLiveTraffic:(BOOL)a3;
@end

@implementation DrivePreferences

- (DrivePreferences)initWithDefaults:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DrivePreferences;
  return [(WatchSyncedPreferences *)&v4 initWithDefaults:a3];
}

- (id)automobileOptions
{
  v3 = objc_opt_new();
  [v3 setIncludeHistoricTravelTime:1];
  if ([(DrivePreferences *)self ignoreLiveTraffic]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 3;
  }
  [v3 setTrafficType:v4];
  v5 = objc_opt_new();
  [v5 setAvoidTolls:[self avoidTolls]];
  [v5 setAvoidHighways:[self avoidHighways]];
  [v3 setUserPreferences:v5];

  return v3;
}

- (BOOL)ignoreLiveTraffic
{
  return self->_ignoreLiveTraffic;
}

- (void)loadValuesFromDefaults
{
  v3 = [(WatchSyncedPreferences *)self defaults];
  -[DrivePreferences setAvoidTolls:](self, "setAvoidTolls:", [v3 BOOLForKey:@"MapsDefaultAvoidTollsKey"]);

  uint64_t v4 = [(WatchSyncedPreferences *)self defaults];
  -[DrivePreferences setAvoidHighways:](self, "setAvoidHighways:", [v4 BOOLForKey:@"MapsDefaultAvoidHighwaysKey"]);

  id v5 = [(WatchSyncedPreferences *)self defaults];
  -[DrivePreferences setIgnoreLiveTraffic:](self, "setIgnoreLiveTraffic:", [v5 BOOLForKey:@"NavigationDirectionsIgnoreLiveTraffic"]);
}

- (void)setIgnoreLiveTraffic:(BOOL)a3
{
  self->_ignoreLiveTraffic = a3;
}

- (void)setAvoidTolls:(BOOL)a3
{
  self->_avoidTolls = a3;
}

- (void)setAvoidHighways:(BOOL)a3
{
  self->_avoidHighways = a3;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (DrivePreferences)initWithAvoidTolls:(BOOL)a3 avoidHighways:(BOOL)a4 ignoreLiveTraffic:(BOOL)a5 defaults:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)DrivePreferences;
  result = [(WatchSyncedPreferences *)&v10 initWithDefaults:a6];
  if (result)
  {
    result->_avoidTolls = a3;
    result->_avoidHighways = a4;
    result->_ignoreLiveTraffic = a5;
  }
  return result;
}

- (DrivePreferences)initWithAutomobileOptions:(id)a3 defaults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 userPreferences];
  id v9 = [v8 avoidTolls];
  objc_super v10 = [v7 userPreferences];
  id v11 = [v10 avoidHighways];
  unsigned int v12 = [v7 trafficType];

  v13 = [(DrivePreferences *)self initWithAvoidTolls:v9 avoidHighways:v11 ignoreLiveTraffic:v12 != 3 defaults:v6];
  return v13;
}

- (DrivePreferences)initWithCopy:(id)a3
{
  uint64_t v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DrivePreferences;
  id v5 = [(WatchSyncedPreferences *)&v8 initWithCopy:v4];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if (isKindOfClass)
      {
        v5->_avoidTolls = v4[24];
        v5->_avoidHighways = v4[25];
        v5->_ignoreLiveTraffic = v4[26];
      }
    }
  }

  return v5;
}

- (BOOL)hasAnyNonStandardPreferences
{
  if ([(DrivePreferences *)self avoidTolls]) {
    return 1;
  }

  return [(DrivePreferences *)self avoidHighways];
}

- (id)_keys
{
  return &off_1013AE658;
}

- (id)_values
{
  v3 = +[NSNumber numberWithBool:self->_avoidTolls];
  uint64_t v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidHighways, v3);
  v8[1] = v4;
  id v5 = +[NSNumber numberWithBool:self->_ignoreLiveTraffic];
  v8[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

@end