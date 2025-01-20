@interface UIClickPresentationStatisticsReportEvent
@end

@implementation UIClickPresentationStatisticsReportEvent

id ___UIClickPresentationStatisticsReportEvent_block_invoke(uint64_t a1)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"bundleId";
  uint64_t v2 = _UIMainBundleIdentifier();
  v3 = (void *)v2;
  v4 = @"unknown bundle id";
  if (v2) {
    v4 = (__CFString *)v2;
  }
  v10[0] = v4;
  v9[1] = @"presentationType";
  v5 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v10[1] = v5;
  v9[2] = @"operation";
  v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

@end