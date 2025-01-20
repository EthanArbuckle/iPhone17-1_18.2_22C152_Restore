@interface OSBatteryDrainPredictor
@end

@implementation OSBatteryDrainPredictor

uint64_t __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) logCompletion:a2];
}

uint64_t __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  uint64_t v3 = [v2 hasBatteryPercentage];

  return v3;
}

void __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 eventBody];
  [v3 batteryPercentage];
  double v5 = v4;
  double v6 = (double)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastBatterySoC];

  if (v5 < v6)
  {
    double v7 = (double)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) drainSoFar];
    double v8 = (double)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastBatterySoC];
    v9 = [v13 eventBody];
    [v9 batteryPercentage];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDrainSoFar:(uint64_t)(v8 - v10 + v7)];
  }
  v11 = [v13 eventBody];
  [v11 batteryPercentage];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setLastBatterySoC:(uint64_t)v12];
}

@end