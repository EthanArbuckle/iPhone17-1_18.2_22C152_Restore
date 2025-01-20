@interface CLPMotionActivity(RTExtensions)
+ (uint64_t)convertRTMotionActivtyConfidence:()RTExtensions;
+ (uint64_t)convertRTMotionActivtyType:()RTExtensions;
- (void)initWithRTMotionActivity:()RTExtensions;
@end

@implementation CLPMotionActivity(RTExtensions)

+ (uint64_t)convertRTMotionActivtyType:()RTExtensions
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return dword_1DA0FF4AC[a3 - 1];
  }
}

+ (uint64_t)convertRTMotionActivtyConfidence:()RTExtensions
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

- (void)initWithRTMotionActivity:()RTExtensions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new();
    [v5 setType:[objc_opt_class() convertRTMotionActivtyType:[v4 type]]];
    [v5 setConfidence:[objc_opt_class() convertRTMotionActivtyConfidence:[v4 confidence]]];
  }
  else
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[CLPMotionActivity(RTExtensions) initWithRTMotionActivity:]";
      __int16 v10 = 1024;
      int v11 = 191;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: rtMotionActivity (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }

    v5 = 0;
  }

  return v5;
}

@end