@interface RPTTestRunnerEnableEventDeliverySync
@end

@implementation RPTTestRunnerEnableEventDeliverySync

void ___RPTTestRunnerEnableEventDeliverySync_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v2 = [v0 valueForKey:@"RPTTestRunnerEnableEventDeliverySync"];

  v1 = v2;
  if (v2)
  {
    _RPTTestRunnerEnableEventDeliverySync_enable = [v2 BOOLValue];
    v1 = v2;
  }
}

@end