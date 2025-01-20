@interface RTNotification
+ (id)notificationName;
- (NSString)name;
- (RTNotification)init;
@end

@implementation RTNotification

+ (id)notificationName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "+[RTNotification notificationName]";
      __int16 v8 = 1024;
      int v9 = 15;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "RTNotification should not be used directly. (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }
  }
  v4 = NSStringFromClass((Class)a1);

  return v4;
}

- (NSString)name
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (RTNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTNotification;
  return [(RTNotification *)&v3 init];
}

@end