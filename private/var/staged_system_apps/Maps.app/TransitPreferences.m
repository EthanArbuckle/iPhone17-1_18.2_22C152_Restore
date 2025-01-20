@interface TransitPreferences
+ (BOOL)isModeDisabled:(unint64_t)a3 inModes:(unint64_t)a4;
+ (BOOL)isModeDisabled:(unint64_t)a3 inUserDefaults:(id)a4;
+ (unint64_t)disabledModesByTogglingMode:(unint64_t)a3 inModes:(unint64_t)a4;
+ (unint64_t)enabledModesFromDisabled:(unint64_t)a3;
+ (void)toggleMode:(unint64_t)a3 inUserDefaults:(id)a4;
- (BOOL)hasAnyNonStandardPreferences;
- (BOOL)isModeDisabled:(unint64_t)a3;
- (BOOL)showICFares;
- (NSNumber)surchargeOption;
- (TransitPreferences)initWithCopy:(id)a3;
- (TransitPreferences)initWithTransitOptions:(id)a3 defaults:(id)a4;
- (id)_keys;
- (id)_values;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)transitOptions;
- (id)transitPreferencesByOverridingPropertiesWithUserInfo:(id)a3;
- (int)sortOption;
- (unint64_t)disabledModes;
- (void)_copyPropertiesTo:(id)a3;
- (void)loadValuesFromDefaults;
- (void)setDisabledModes:(unint64_t)a3;
- (void)setShowICFares:(BOOL)a3;
- (void)setSortOption:(int)a3;
- (void)setSurchargeOption:(id)a3;
@end

@implementation TransitPreferences

- (id)transitOptions
{
  id v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc_init((Class)GEOTransitOptions);
    [v2 setPrioritization:[v1 sortOption]];
    id v3 = objc_alloc_init((Class)GEOFareOptions);
    [v3 setPaymentType:[v1 showICFares]];
    v4 = [v1 surchargeOption];

    if (v4)
    {
      v5 = [v1 surchargeOption];
      [v3 setPreferredSurchargeType:[v5 integerValue]];
    }
    [v2 setFareOptions:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = sub_1000B448C([v1 disabledModes]);
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [v2 addAvoidedMode:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) integerValue]];
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    if (GEOConfigGetBOOL()) {
      [v2 setRoutingBehavior:1];
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (NSNumber)surchargeOption
{
  return self->_surchargeOption;
}

- (int)sortOption
{
  return self->_sortOption;
}

- (BOOL)showICFares
{
  return self->_showICFares;
}

- (unint64_t)disabledModes
{
  return self->_disabledModes;
}

- (void)loadValuesFromDefaults
{
  id v3 = [(WatchSyncedPreferences *)self defaults];
  -[TransitPreferences setDisabledModes:](self, "setDisabledModes:", (unint64_t)[v3 integerForKey:@"DefaultDisabledTransitModesKey"] & 0xF);

  v4 = [(WatchSyncedPreferences *)self defaults];
  -[TransitPreferences setSortOption:](self, "setSortOption:", [v4 integerForKey:@"MapsTransitSortOption"]);

  v5 = [(WatchSyncedPreferences *)self defaults];
  v6 = [v5 objectForKey:@"MapsTransitSurchargeOption"];
  [(TransitPreferences *)self setSurchargeOption:v6];

  id v7 = [(WatchSyncedPreferences *)self defaults];
  id v9 = [v7 objectForKey:@"MapsTransitShowICFaresKey"];

  if (v9) {
    uint64_t v8 = (uint64_t)[v9 BOOLValue];
  }
  else {
    uint64_t v8 = 1;
  }
  [(TransitPreferences *)self setShowICFares:v8];
}

- (void)setSurchargeOption:(id)a3
{
}

- (void)setSortOption:(int)a3
{
  self->_sortOption = a3;
}

- (void)setShowICFares:(BOOL)a3
{
  self->_showICFares = a3;
}

- (void)setDisabledModes:(unint64_t)a3
{
  self->_disabledModes = a3;
}

- (void).cxx_destruct
{
}

- (id)transitPreferencesByOverridingPropertiesWithUserInfo:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    long long v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315906;
      v18 = "-[TransitPreferences(DirectionsUserInfo) transitPreferencesByOverridingPropertiesWithUserInfo:]";
      __int16 v19 = 2080;
      v20 = "RoutePlanningPreferences+DirectionsUserInfo.m";
      __int16 v21 = 1024;
      int v22 = 23;
      __int16 v23 = 2080;
      v24 = "userInfo != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v17, 0x26u);
    }

    if (sub_100BB36BC())
    {
      long long v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        int v17 = 138412290;
        v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  id v5 = [(TransitPreferences *)self mutableCopy];
  v6 = [v4 objectForKeyedSubscript:@"DirectionsAvoidedTransitModesKey"];

  if (v6)
  {
    id v7 = [v4 objectForKeyedSubscript:@"DirectionsAvoidedTransitModesKey"];
    [v5 setDisabledModes:(unint64_t)[v7 integerValue] & 0xF];
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"DirectionsSortOptionKey"];

  if (v8)
  {
    id v9 = [v4 objectForKeyedSubscript:@"DirectionsSortOptionKey"];
    [v5 setSortOption:[v9 integerValue]];
  }
  v10 = [v4 objectForKeyedSubscript:@"DirectionsTransitSurchargeOptionKey"];

  if (v10)
  {
    v11 = [v4 objectForKeyedSubscript:@"DirectionsTransitSurchargeOptionKey"];
    [v5 setSurchargeOption:v11];
  }
  id v12 = [v5 copy];

  return v12;
}

- (TransitPreferences)initWithTransitOptions:(id)a3 defaults:(id)a4
{
  id v6 = a3;
  id v7 = [(WatchSyncedPreferences *)self initWithDefaults:a4];
  if (v7)
  {
    -[TransitPreferences setSortOption:](v7, "setSortOption:", [v6 prioritization]);
    uint64_t v8 = [v6 fareOptions];
    id v9 = v8;
    if (v8)
    {
      -[TransitPreferences setShowICFares:](v7, "setShowICFares:", [v8 paymentType] == 1);
      if ([v9 hasPreferredSurchargeType])
      {
        v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 preferredSurchargeType]);
        [(TransitPreferences *)v7 setSurchargeOption:v10];
      }
    }
    if ([v6 avoidedModesCount])
    {
      unint64_t v11 = 0;
      uint64_t v12 = 0;
      do
      {
        switch([v6 avoidedModeAtIndex:v11])
        {
          case 1u:
          case 3u:
            v12 |= 2uLL;
            break;
          case 2u:
            v12 |= 4uLL;
            break;
          case 4u:
            v12 |= 1uLL;
            break;
          case 5u:
            v12 |= 8uLL;
            break;
          default:
            break;
        }
        ++v11;
      }
      while (v11 < (unint64_t)[v6 avoidedModesCount]);
    }
    else
    {
      uint64_t v12 = 0;
    }
    [(TransitPreferences *)v7 setDisabledModes:v12];
  }
  return v7;
}

- (TransitPreferences)initWithCopy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TransitPreferences;
  id v5 = [(WatchSyncedPreferences *)&v8 initWithCopy:v4];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if (isKindOfClass) {
        [v4 _copyPropertiesTo:v5];
      }
    }
  }

  return v5;
}

- (BOOL)hasAnyNonStandardPreferences
{
  return [(TransitPreferences *)self disabledModes] != 0;
}

- (id)_keys
{
  return &off_1013AE8B0;
}

- (id)_values
{
  id v3 = +[NSNumber numberWithUnsignedInteger:[(TransitPreferences *)self disabledModes]];
  v10[0] = v3;
  id v4 = +[NSNumber numberWithInt:[(TransitPreferences *)self sortOption]];
  v10[1] = v4;
  id v5 = [(TransitPreferences *)self surchargeOption];
  id v6 = v5;
  if (!v5)
  {
    id v6 = +[NSNull null];
  }
  v10[2] = v6;
  id v7 = +[NSNumber numberWithBool:[(TransitPreferences *)self showICFares]];
  v10[3] = v7;
  objc_super v8 = +[NSArray arrayWithObjects:v10 count:4];

  if (!v5) {

  }
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[TransitMutablePreferences allocWithZone:a3];
  id v5 = [(WatchSyncedPreferences *)self defaults];
  id v6 = [(WatchSyncedPreferences *)v4 initWithDefaults:v5];

  [(TransitPreferences *)self _copyPropertiesTo:v6];
  return v6;
}

- (void)_copyPropertiesTo:(id)a3
{
  id v5 = a3;
  [v5 setDisabledModes:[self disabledModes]];
  [v5 setSortOption:[self sortOption]];
  id v4 = [(TransitPreferences *)self surchargeOption];
  [v5 setSurchargeOption:v4];

  [v5 setShowICFares:[self showICFares]];
}

- (BOOL)isModeDisabled:(unint64_t)a3
{
  id v5 = objc_opt_class();
  unint64_t v6 = [(TransitPreferences *)self disabledModes];

  return _[v5 isModeDisabled:a3 inModes:v6];
}

+ (unint64_t)enabledModesFromDisabled:(unint64_t)a3
{
  return ~a3 & 0xFLL;
}

+ (BOOL)isModeDisabled:(unint64_t)a3 inModes:(unint64_t)a4
{
  return (a4 & a3) != 0;
}

+ (unint64_t)disabledModesByTogglingMode:(unint64_t)a3 inModes:(unint64_t)a4
{
  if ((a4 & a3) != 0) {
    return a4 & ~a3;
  }
  else {
    return a4 | a3;
  }
}

+ (BOOL)isModeDisabled:(unint64_t)a3 inUserDefaults:(id)a4
{
  unint64_t v6 = (unint64_t)[a4 integerForKey:@"DefaultDisabledTransitModesKey"] & 0xF;

  return _[a1 isModeDisabled:a3 inModes:v6];
}

+ (void)toggleMode:(unint64_t)a3 inUserDefaults:(id)a4
{
  id v6 = a4;
  id v7 = [a1 disabledModesByTogglingMode:a3 inModes:[v6 integerForKey:@"DefaultDisabledTransitModesKey"] & 0xF];
  [v6 setInteger:v7 forKey:@"DefaultDisabledTransitModesKey"];

  id v8 = +[NSUserDefaults __maps_groupUserDefaults];
  [v8 setInteger:v7 forKey:@"DefaultDisabledTransitModesKey"];
}

@end