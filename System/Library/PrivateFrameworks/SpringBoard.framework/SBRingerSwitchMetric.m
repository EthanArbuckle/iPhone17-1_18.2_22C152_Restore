@interface SBRingerSwitchMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
@end

@implementation SBRingerSwitchMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v5 = a4;
  if (a3 == 11 || a3 == 62)
  {
    AnalyticsSendEventLazy();
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __48__SBRingerSwitchMetric_handleEvent_withContext___block_invoke()
{
  return 0;
}

id __48__SBRingerSwitchMetric_handleEvent_withContext___block_invoke_2()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"is_muted";
  v0 = NSNumber;
  v1 = [(id)SBApp ringerControl];
  v2 = [v0 numberWithBool:-[SBRingerControl isRingerMuted]((uint64_t)v1)];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

@end