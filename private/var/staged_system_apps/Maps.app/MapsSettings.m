@interface MapsSettings
+ (BOOL)_selectedViewModeIsExpired;
+ (BOOL)allowEmailCorrespondence;
+ (BOOL)alwaysShowScale;
+ (BOOL)showsAirQualityIndex;
+ (BOOL)showsCompass;
+ (BOOL)showsWeather;
+ (BOOL)showsZoomControls;
+ (BOOL)userDesiresLabels;
+ (BOOL)userDesiresTraffic;
+ (BOOL)usesMetric;
+ (NSString)preferredDistanceUnit;
+ (NSString)settingsUpdatedNotificationKey;
+ (id)valueForConfigKey:(id)a3;
+ (id)valueForDefaultsKey:(id)a3;
+ (id)valueForDefaultsKey:(id)a3 defaultValue:(id)a4;
+ (int64_t)selectedViewMode;
+ (void)_synchronizeNanoDefaultsForDomain:(id)a3 key:(id)a4 container:(id)a5;
+ (void)clearSelectedViewModeIfExpired;
+ (void)postNotification;
+ (void)setAllowEmailCorrespondence:(BOOL)a3;
+ (void)setAlwaysShowScale:(BOOL)a3;
+ (void)setSelectedViewMode:(int64_t)a3;
+ (void)setShowsAirQualityIndex:(BOOL)a3;
+ (void)setShowsCompass:(BOOL)a3;
+ (void)setShowsWeather:(BOOL)a3;
+ (void)setShowsZoomControls:(BOOL)a3;
+ (void)setSystemMeasurementUnits;
+ (void)setUserDesiresLabels:(BOOL)a3;
+ (void)setUserDesiresTraffic:(BOOL)a3;
+ (void)setValue:(id)a3 forConfigKey:(id)a4;
+ (void)setValue:(id)a3 forDefaultsKey:(id)a4 bundleID:(id)a5 syncToNano:(BOOL)a6;
@end

@implementation MapsSettings

+ (void)setSystemMeasurementUnits
{
  v2 = +[NSLocale currentLocale];
  id v4 = [v2 objectForKey:NSLocaleMeasurementSystem];

  if ([v4 isEqualToString:@"Metric"]) {
    CFStringRef v3 = @"Metric";
  }
  else {
    CFStringRef v3 = @"Imperial";
  }
  +[MapsSettings setValue:v3 forDefaultsKey:@"DistanceUnits" bundleID:0 syncToNano:1];
}

+ (BOOL)_selectedViewModeIsExpired
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 doubleForKey:@"LastSuspendTime"];
  double v4 = v3;

  if (v4 == 0.0) {
    return 0;
  }
  v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v4];
  [v6 timeIntervalSinceNow];
  double v8 = v7;

  GEOConfigGetDouble();
  return v8 < -v9;
}

+ (BOOL)userDesiresLabels
{
  v2 = +[NSUserDefaults standardUserDefaults];
  double v3 = [v2 objectForKey:@"SatelliteMapShowLabelsKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (void)_synchronizeNanoDefaultsForDomain:(id)a3 key:(id)a4 container:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && v8)
  {
    id v10 = objc_alloc_init((Class)NPSManager);
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412802;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "NPSManager synchronizeUserDefaultsDomain:%@, key= %@, container= %@)", (uint8_t *)&v13, 0x20u);
    }

    v12 = +[NSSet setWithObject:v8];
    [v10 synchronizeUserDefaultsDomain:v7 keys:v12 container:v9];
  }
}

+ (void)setValue:(id)a3 forDefaultsKey:(id)a4 bundleID:(id)a5 syncToNano:(BOOL)a6
{
  BOOL v22 = a6;
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = (__CFString *)a5;
  if (v10) {
    v11 = v10;
  }
  else {
    v11 = @"com.apple.Maps";
  }
  v12 = +[MSPMapsPaths mapsApplicationContainerPaths];
  int v13 = [v12 homeDirectory];

  id v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    CFStringRef v24 = v9;
    __int16 v25 = 2112;
    CFStringRef v26 = v8;
    __int16 v27 = 2112;
    CFStringRef v28 = v11;
    __int16 v29 = 2112;
    CFStringRef v30 = kCFPreferencesCurrentUser;
    __int16 v31 = 2112;
    CFStringRef v32 = kCFPreferencesAnyHost;
    __int16 v33 = 2112;
    v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_CFPreferencesSetValueWithContainer(key= %@, value= %@, applicationId= %@, userName= %@, hostName= %@, containerPath= %@)", buf, 0x3Eu);
  }

  _CFPreferencesSetValueWithContainer();
  __int16 v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    CFStringRef v24 = v11;
    __int16 v25 = 2112;
    CFStringRef v26 = kCFPreferencesCurrentUser;
    __int16 v27 = 2112;
    CFStringRef v28 = kCFPreferencesAnyHost;
    __int16 v29 = 2112;
    CFStringRef v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "_CFPreferencesSynchronizeWithContainer(applicationID= %@, userName= %@, hostName= %@, containerPath= %@)", buf, 0x2Au);
  }

  _CFPreferencesSynchronizeWithContainer();
  GSSendAppPreferencesChanged();
  id v16 = +[MSPMapsPaths mapsApplicationContainerPaths];
  __int16 v17 = [v16 groupDirectory];

  id v18 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    CFStringRef v24 = v9;
    __int16 v25 = 2112;
    CFStringRef v26 = v8;
    __int16 v27 = 2112;
    CFStringRef v28 = @"group.com.apple.Maps";
    __int16 v29 = 2112;
    CFStringRef v30 = kCFPreferencesCurrentUser;
    __int16 v31 = 2112;
    CFStringRef v32 = kCFPreferencesAnyHost;
    __int16 v33 = 2112;
    v34 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "_CFPreferencesSetValueWithContainer(key= %@, value= %@, applicationId= %@, userName= %@, hostName= %@, containerPath= %@)", buf, 0x3Eu);
  }

  _CFPreferencesSetValueWithContainer();
  v19 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    CFStringRef v24 = @"group.com.apple.Maps";
    __int16 v25 = 2112;
    CFStringRef v26 = kCFPreferencesCurrentUser;
    __int16 v27 = 2112;
    CFStringRef v28 = kCFPreferencesAnyHost;
    __int16 v29 = 2112;
    CFStringRef v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "_CFPreferencesSynchronizeWithContainer(applicationID= %@, userName= %@, hostName= %@, containerPath= %@)", buf, 0x2Au);
  }

  _CFPreferencesSynchronizeWithContainer();
  GSSendAppPreferencesChanged();
  if (v22) {
    [v21 _synchronizeNanoDefaultsForDomain:v11 key:v9 container:v11];
  }
}

+ (BOOL)userDesiresTraffic
{
  v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 launchedToTest];

  if (v3) {
    return 0;
  }
  v5 = +[NSUserDefaults standardUserDefaults];
  v6 = [v5 objectForKey:@"DesiresTrafficKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 BOOL = [v6 BOOLValue];
  }
  else {
    unsigned __int8 BOOL = GEOConfigGetBOOL();
  }
  BOOL v4 = BOOL;

  return v4;
}

+ (void)clearSelectedViewModeIfExpired
{
  if ([a1 _selectedViewModeIsExpired])
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    [v2 removeObjectForKey:@"ViewMode"];
  }
}

+ (NSString)settingsUpdatedNotificationKey
{
  return (NSString *)@"MapsAppSettingsUpdatedNotification";
}

+ (id)valueForDefaultsKey:(id)a3
{
  return _[a1 valueForDefaultsKey:a3 defaultValue:0];
}

+ (id)valueForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MSPMapsPaths mapsApplicationContainerPaths];
  id v8 = [v7 homeDirectory];

  id v9 = (void *)_CFPreferencesCopyValueWithContainer();
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = v5;
  }
  id v11 = v10;

  return v11;
}

+ (id)valueForConfigKey:(id)a3
{
  return (id)_GEOConfigGetDecodedValueWithSource();
}

+ (void)setValue:(id)a3 forConfigKey:(id)a4
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001040C4;
  id v11 = sub_1001048E0;
  id v12 = 0;
  GEOConfigGetPropertiesForKey();
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v8[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GEOConfigSet(key= %@, value= %@)", buf, 0x16u);
  }

  _GEOConfigSetEncodedValue();
  _Block_object_dispose(&v7, 8);
}

+ (int64_t)selectedViewMode
{
  if ([a1 _selectedViewModeIsExpired]) {
    return 0;
  }
  unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
  unint64_t v4 = (unint64_t)[v3 integerForKey:@"ViewMode"];

  if (v4 > 7) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = qword_100F727C0[v4];
  }
  if (((v5 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0) {
    return v5;
  }
  else {
    return 2;
  }
}

+ (void)setSelectedViewMode:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_100F727C0[a3];
  }
  if (((v3 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setInteger:v4 forKey:@"ViewMode"];
}

+ (void)setUserDesiresTraffic:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"DesiresTrafficKey"];
}

+ (void)setUserDesiresLabels:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"SatelliteMapShowLabelsKey"];
}

+ (BOOL)showsWeather
{
  id v2 = +[WeatherSettingsManager sharedManager];
  unsigned __int8 v3 = [v2 shouldShowWeatherConditions];

  return v3;
}

+ (void)setShowsWeather:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[WeatherSettingsManager sharedManager];
  [v4 setShouldShowWeatherConditions:v3];
}

+ (BOOL)showsAirQualityIndex
{
  id v2 = +[WeatherSettingsManager sharedManager];
  unsigned __int8 v3 = [v2 shouldShowAirQualityConditions];

  return v3;
}

+ (void)setShowsAirQualityIndex:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[WeatherSettingsManager sharedManager];
  [v4 setShouldShowAirQualityConditions:v3];
}

+ (BOOL)allowEmailCorrespondence
{
  return sub_100578E8C(@"RAPContactBackByEmailPreference") != (id)2;
}

+ (void)setAllowEmailCorrespondence:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  sub_100578E18(@"RAPContactBackByEmailPreference", v3);
}

+ (BOOL)showsCompass
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"MapsDefaultShowCompass"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (void)setShowsCompass:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:v3 forKey:@"MapsDefaultShowCompass"];

  _[a1 postNotification];
}

+ (BOOL)showsZoomControls
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"MapsDefaultShowZoomControls"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (void)setShowsZoomControls:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:v3 forKey:@"MapsDefaultShowZoomControls"];

  _[a1 postNotification];
}

+ (BOOL)alwaysShowScale
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"MapsDefaultAlwaysShowScale"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (void)setAlwaysShowScale:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:v3 forKey:@"MapsDefaultAlwaysShowScale"];

  _[a1 postNotification];
}

+ (void)postNotification
{
  id v4 = +[NSNotificationCenter defaultCenter];
  BOOL v3 = [a1 settingsUpdatedNotificationKey];
  [v4 postNotificationName:v3 object:a1];
}

+ (NSString)preferredDistanceUnit
{
  id v2 = +[MapsSettings valueForDefaultsKey:@"DistanceUnits"];
  BOOL v3 = v2;
  if (!v2 || [(__CFString *)v2 isEqualToString:@"FromLocale"])
  {
    id v4 = +[NSLocale currentLocale];
    id v5 = [v4 _navigation_objectForKey:NSLocaleUsesMetricSystem];
    unsigned int v6 = [v5 BOOLValue];

    uint64_t v7 = @"Imperial";
    if (v6) {
      uint64_t v7 = @"Metric";
    }
    id v8 = v7;

    BOOL v3 = v8;
  }

  return (NSString *)v3;
}

+ (BOOL)usesMetric
{
  id v2 = [a1 preferredDistanceUnit];
  unsigned __int8 v3 = [@"Imperial" isEqualToString:v2];

  return v3;
}

@end