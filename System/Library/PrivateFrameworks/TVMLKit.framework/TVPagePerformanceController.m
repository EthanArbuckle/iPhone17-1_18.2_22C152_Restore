@interface TVPagePerformanceController
@end

@implementation TVPagePerformanceController

uint64_t __54___TVPagePerformanceController_isPerformanceUIEnabled__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isPerformanceUIEnabled_internalBuild = result;
  if ((result & 1) == 0)
  {
    uint64_t result = CFPreferencesGetAppBooleanValue(@"PagePerformanceUIEnabled", @"com.apple.TVMLKit", 0);
    isPerformanceUIEnabled_uiEnabled = result != 0;
  }
  return result;
}

void __80___TVPagePerformanceController_postNotificationForImageProxy_withLoadingStatus___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:a1[4] object:a1[5] userInfo:a1[6]];
}

id __39___TVPagePerformanceController_metrics__block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(*(void *)(*(void *)(a1 + 32) + 24), a2);
  if (v3) {
    [NSNumber numberWithUnsignedLongLong:(*(void *)(a1 + 40) + v3) / 0x3E8];
  }
  else {
  v4 = [MEMORY[0x263EFF9D0] null];
  }
  return v4;
}

void __56___TVPagePerformanceController_buildPagePerformanceView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  unint64_t v5 = [a3 unsignedLongLongValue];
  if (v5 >= 0x3E9)
  {
    if (v5 >> 4 > 0x270)
    {
      if (v5 > 0x7A11F) {
        objc_msgSend(NSString, "stringWithFormat:", @"%0.2fs", (double)v5 / 1000000.0);
      }
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"%lums", v5 / 0x3E8uLL);
      }
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%0.2fms", (double)v5 / 1000.0);
    v6 = };
    v7 = [v9 stringByAppendingString:v6];

    v8 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
    [v8 setText:v7];
    [*(id *)(a1 + 32) addSubview:v8];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + 60.0;
  }
}

@end