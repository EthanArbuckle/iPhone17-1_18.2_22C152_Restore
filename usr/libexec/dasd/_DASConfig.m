@interface _DASConfig
+ (BOOL)computeHasDeviceRecentlyUpdated;
+ (BOOL)hasRecentlyUpdated;
+ (BOOL)isAudioAccessory;
+ (BOOL)isInternalBuild;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (BOOL)requiresStrictDarkBoot;
+ (void)initialize;
@end

@implementation _DASConfig

+ (BOOL)isInternalBuild
{
  return byte_1001C4378;
}

+ (void)initialize
{
  byte_1001C4378 = os_variant_has_internal_content();
  v4 = dispatch_get_global_queue(-32768, 0);
  dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  v6 = (void *)qword_1001C4380;
  qword_1001C4380 = (uint64_t)v5;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000ADEE8;
  handler[3] = &unk_1001753E0;
  handler[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_1001C4380, handler);
  v7 = qword_1001C4380;
  dispatch_time_t v8 = dispatch_walltime(0, 43200000000000);
  dispatch_source_set_timer(v7, v8, 0x274A48A78000uLL, 0xD18C2E2800uLL);
  dispatch_activate((dispatch_object_t)qword_1001C4380);
  byte_1001C4388 = [(id)objc_opt_class() computeHasDeviceRecentlyUpdated];
}

+ (BOOL)hasRecentlyUpdated
{
  return byte_1001C4388;
}

+ (BOOL)computeHasDeviceRecentlyUpdated
{
  if (sysctlbyname_get_data_np()) {
    return 0;
  }
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", 0, 0);
  free(0);
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  dispatch_source_t v5 = [v4 stringForKey:@"savedBuildVersion"];
  v6 = +[NSDate date];
  if (v5
    && (objc_msgSend(v3, "substringToIndex:", (char *)objc_msgSend(v3, "length") - 1),
        v7 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "substringToIndex:", (char *)objc_msgSend(v5, "length") - 1),
        dispatch_time_t v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        v9))
  {
    [v4 doubleForKey:@"savedBuildDate"];
    v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v6 timeIntervalSinceDate:v10];
    BOOL v2 = v11 < 604800.0;
  }
  else
  {
    [v4 setObject:v3 forKey:@"savedBuildVersion"];
    +[NSDate timeIntervalSinceReferenceDate];
    [v4 setDouble:@"savedBuildDate" forKey:];
    BOOL v2 = 1;
  }

  return v2;
}

+ (BOOL)isAudioAccessory
{
  return 0;
}

+ (BOOL)isiPad
{
  if (qword_1001C4390 != -1) {
    dispatch_once(&qword_1001C4390, &stru_100177A40);
  }
  return byte_1001C4389;
}

+ (BOOL)isiPhone
{
  if (qword_1001C43A0 != -1) {
    dispatch_once(&qword_1001C43A0, &stru_100177A60);
  }
  return byte_1001C4398;
}

+ (BOOL)requiresStrictDarkBoot
{
  if (qword_1001C43B0 != -1) {
    dispatch_once(&qword_1001C43B0, &stru_100177A80);
  }
  return byte_1001C43A8;
}

@end