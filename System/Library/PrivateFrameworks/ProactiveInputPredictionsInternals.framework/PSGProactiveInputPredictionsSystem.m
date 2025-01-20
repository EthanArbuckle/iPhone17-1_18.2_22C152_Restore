@interface PSGProactiveInputPredictionsSystem
+ (void)start;
@end

@implementation PSGProactiveInputPredictionsSystem

+ (void)start
{
  self;
  id v2 = [MEMORY[0x263F38298] sharedInstance];
  [v2 registerForActivity:12 handler:&__block_literal_global_19];
}

void __71__PSGProactiveInputPredictionsSystem__registerForCustomResponseHarvest__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = [MEMORY[0x263F38298] sharedInstance];
  [v3 setState:v2 state:5];
}

@end