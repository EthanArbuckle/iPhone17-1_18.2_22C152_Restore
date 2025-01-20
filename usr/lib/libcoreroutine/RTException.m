@interface RTException
+ (void)dontOpenDeadInside;
@end

@implementation RTException

+ (void)dontOpenDeadInside
{
  v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = a1;
    _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "A tombstoned object was modified when it shouldn't have been.\n%@", (uint8_t *)&v4, 0xCu);
  }

  __break(1u);
}

@end