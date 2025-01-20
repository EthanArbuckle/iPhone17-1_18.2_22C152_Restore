@interface PEAdjustmentCleanup
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
@end

@implementation PEAdjustmentCleanup

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  v8 = (void (**)(id, uint64_t, void))a7;
  if ([MEMORY[0x263F5D5F8] deviceSupportsObjectRemoval])
  {
    v8[2](v8, 1, 0);
  }
  else
  {
    v7 = [MEMORY[0x263F087E8] errorWithDomain:@"PEAdjustmentCleanupErrorDomain" code:1 userInfo:0];
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v7);
  }
}

- (int64_t)category
{
  return 11;
}

@end