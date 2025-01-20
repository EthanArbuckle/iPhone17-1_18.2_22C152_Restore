@interface RTKeybagMonitor
- (BOOL)getUnlockedSinceBoot;
- (BOOL)lockDevice;
- (int)getDeviceLockState;
@end

@implementation RTKeybagMonitor

- (int)getDeviceLockState
{
  return MEMORY[0x1F412F980](0, a2);
}

- (BOOL)getUnlockedSinceBoot
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = MKBDeviceUnlockedSinceBoot();
  if (v2 < 0)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Failed to determine unlocked since boot, %d", (uint8_t *)v5, 8u);
    }
  }
  return v2 > 0;
}

- (BOOL)lockDevice
{
  uint64_t v2 = SBSSpringBoardServerPort();
  MEMORY[0x1E016CCF0](v2, 1);
  return 1;
}

@end