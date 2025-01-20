@interface RTLocation
@end

@implementation RTLocation

void __102__RTLocation_RTExtensions___distanceBetweenShiftedLocation_unshiftedLocation_locationShifter_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@, Unable to shift, location shifter error", buf, 0xCu);
    }
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F5CFE8];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13 = @"Reference frames do not match and we encounted an error when trying to shift.";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v8 = [v5 errorWithDomain:v6 code:6 userInfo:v7];
    (*(void (**)(uint64_t, void *, double))(v4 + 16))(v4, v8, INFINITY);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) latitude];
    [*(id *)(a1 + 32) longitude];
    RTCommonCalculateDistanceHighPrecision();
    v10 = *(void (**)(uint64_t, void))(v9 + 16);
    v10(v9, 0);
  }
}

@end