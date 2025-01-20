@interface MTUIUtility
+ (void)openSleepInHealthApp;
@end

@implementation MTUIUtility

+ (void)openSleepInHealthApp
{
  [MEMORY[0x263F55D58] incrementEventCount:*MEMORY[0x263F55DC0]];
  id v6 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
  v2 = _HKCreateURLForSampleType();
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  int v4 = [v3 canOpenURL:v2];

  if (v4)
  {
    v5 = [MEMORY[0x263F1C408] sharedApplication];
    [v5 openURL:v2 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
}

@end