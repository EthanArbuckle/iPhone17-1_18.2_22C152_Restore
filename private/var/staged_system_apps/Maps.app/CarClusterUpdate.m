@interface CarClusterUpdate
+ (id)_enumProperties;
+ (id)_integersKeyed;
+ (unsigned)_accNavManeuverStateForGEONavigationAnnouncementStage:(unint64_t)a3;
+ (unsigned)_accNavManeuverTypeForGEOManeuverType:(int)a3;
+ (unsigned)_accNavRouteGuidanceStateForGEONavigationState:(int)a3;
+ (void)getStringValue:(id *)a3 displayUnits:(unsigned __int16 *)a4 forRemainingDistance:(double)a5;
- (ACCNavigationAccessoryComponent)component;
- (BOOL)_propertyIsEnum:(id)a3;
- (NSDictionary)accNavFormat;
- (NSNumber)navigationRouteGuidanceDisplayComponentID;
- (NSString)debugProperties;
- (NSString)logFormat;
- (id)_debugDescriptionForProperty:(id)a3 withValue:(id)a4;
- (id)debugDescription;
- (void)resetProperties;
- (void)setAccNavFormat:(id)a3;
- (void)setComponent:(id)a3;
@end

@implementation CarClusterUpdate

+ (void)getStringValue:(id *)a3 displayUnits:(unsigned __int16 *)a4 forRemainingDistance:(double)a5
{
  v7 = +[NSLocale currentLocale];
  [v7 _navigation_distanceUsesMetricSystem];
  v8 = +[NSLocale currentLocale];
  [v8 _navigation_useYardsForShortDistances];
  unint64_t v9 = MNInstructionsCalculateDistanceUnits();
  uint64_t v11 = v10;

  if (a3)
  {
    if ((v11 & (unint64_t)&_mh_execute_header) != 0) {
      CFStringRef v12 = @"%.1f";
    }
    else {
      CFStringRef v12 = @"%.0f";
    }
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, *(float *)&v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
  {
    if (v9 <= 5) {
      *a4 = word_100F730D0[v9];
    }
  }
}

- (void)resetProperties
{
  v3 = [(id)objc_opt_class() _integersKeyed];
  id v4 = [v3 mutableCopy];

  [v4 removeObjectForKey:&off_1013AA090];
  [v4 removeObjectForKey:&off_1013AA090];
  [v4 removeObjectForKey:&off_1013AA090];
  [v4 removeObjectForKey:&off_1013AA0A8];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A5DB50;
  v5[3] = &unk_1012F3C58;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

- (NSDictionary)accNavFormat
{
  v3 = objc_opt_new();
  id v4 = [(id)objc_opt_class() _integersKeyed];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A5DC9C;
  v9[3] = &unk_101315608;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  v6 = v10;
  v7 = (NSDictionary *)v5;

  return v7;
}

- (void)setAccNavFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100A5DF10;
  v3[3] = &unk_1012F3C58;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (NSString)logFormat
{
  v3 = +[NSMutableString stringWithString:@"{"];
  id v4 = [(id)objc_opt_class() _integersKeyed];
  unint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_100A5E098;
  CFStringRef v12 = &unk_101315608;
  v13 = self;
  id v5 = v3;
  id v14 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  [v5 appendFormat:@"\n}", v9, v10, v11, v12, v13];
  v6 = v14;
  id v7 = v5;

  return (NSString *)v7;
}

- (NSNumber)navigationRouteGuidanceDisplayComponentID
{
  v3 = [(CarClusterUpdate *)self component];

  if (v3)
  {
    id v4 = [(CarClusterUpdate *)self component];
    id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 identifier]);
  }
  else
  {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

+ (id)_enumProperties
{
  return &__NSDictionary0__struct;
}

+ (id)_integersKeyed
{
  return &__NSDictionary0__struct;
}

- (BOOL)_propertyIsEnum:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _enumProperties];
  id v5 = [v4 allKeys];
  unsigned __int8 v6 = [v5 containsObject:v3];

  return v6;
}

- (id)_debugDescriptionForProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CarClusterUpdate *)self _propertyIsEnum:v6])
  {
    v8 = [(id)objc_opt_class() _enumProperties];
    unint64_t v9 = [v8 objectForKeyedSubscript:v6];
    id v10 = [v9 objectForKeyedSubscript:v7];
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CarClusterUpdate *)self debugProperties];
  id v5 = [(CarClusterUpdate *)self logFormat];
  id v6 = +[NSString stringWithFormat:@"<%@ %p>: (%@) %@", v3, self, v4, v5];

  return v6;
}

+ (unsigned)_accNavRouteGuidanceStateForGEONavigationState:(int)a3
{
  if ((a3 - 1) > 7) {
    return 0;
  }
  else {
    return word_100F73190[a3 - 1];
  }
}

+ (unsigned)_accNavManeuverTypeForGEOManeuverType:(int)a3
{
  if ((a3 - 1) > 0x57) {
    return 0;
  }
  else {
    return word_100F730DC[a3 - 1];
  }
}

+ (unsigned)_accNavManeuverStateForGEONavigationAnnouncementStage:(unint64_t)a3
{
  unsigned __int16 v3 = a3 - 2;
  if (((a3 - 2) & 0xFFFC) != 0) {
    return -1;
  }
  return v3;
}

- (NSString)debugProperties
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (ACCNavigationAccessoryComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);

  objc_storeStrong((id *)&self->_debugProperties, 0);
}

@end