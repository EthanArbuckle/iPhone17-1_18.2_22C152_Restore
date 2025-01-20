@interface MKApplicationAnalytics
- (void)send:(unint64_t)a3 mismatchedApps:(unint64_t)a4;
@end

@implementation MKApplicationAnalytics

- (void)send:(unint64_t)a3 mismatchedApps:(unint64_t)a4
{
}

id __46__MKApplicationAnalytics_send_mismatchedApps___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"matched_apps";
  v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v6[1] = @"mismatched_apps";
  v7[0] = v2;
  v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

@end