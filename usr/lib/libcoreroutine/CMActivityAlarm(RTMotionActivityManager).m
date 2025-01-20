@interface CMActivityAlarm(RTMotionActivityManager)
+ (__CFString)triggerToString:()RTMotionActivityManager;
- (id)description;
@end

@implementation CMActivityAlarm(RTMotionActivityManager)

+ (__CFString)triggerToString:()RTMotionActivityManager
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if a3 < 0x1D && ((0x10003FDFu >> a3))
  {
    v6 = off_1E6B9CAE0[(int)a3];
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "unrecognized trigger for description %d", (uint8_t *)v8, 8u);
    }

    v5 = [NSNumber numberWithUnsignedInt:a3];
    v6 = [v5 stringValue];
  }

  return v6;
}

- (id)description
{
  v2 = NSString;
  [a1 duration];
  uint64_t v4 = v3;
  v5 = [MEMORY[0x1E4F22190] triggerToString:[a1 trigger]];
  v6 = [v2 stringWithFormat:@"CMActivityAlarm, duration, %f, trigger, %@", v4, v5];

  return v6;
}

@end