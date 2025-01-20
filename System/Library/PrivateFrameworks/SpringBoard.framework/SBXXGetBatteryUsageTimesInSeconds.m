@interface SBXXGetBatteryUsageTimesInSeconds
@end

@implementation SBXXGetBatteryUsageTimesInSeconds

uint64_t ___SBXXGetBatteryUsageTimesInSeconds_block_invoke(uint64_t a1)
{
  float BatteryUsageTimeInSeconds = _SBWorkspaceGetBatteryUsageTimeInSeconds();
  **(float **)(a1 + 32) = BatteryUsageTimeInSeconds;
  float BatteryStandbyTimeInSeconds = _SBWorkspaceGetBatteryStandbyTimeInSeconds();
  **(float **)(a1 + 40) = BatteryStandbyTimeInSeconds;
  **(unsigned char **)(a1 + 48) = _SBWorkspaceAreUsageTimesTrusted();
  uint64_t result = _SBWorkspaceHaveChargedPartially();
  **(unsigned char **)(a1 + 56) = result;
  return result;
}

@end