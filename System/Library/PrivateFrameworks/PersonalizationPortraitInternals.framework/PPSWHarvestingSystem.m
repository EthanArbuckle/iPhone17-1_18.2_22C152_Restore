@interface PPSWHarvestingSystem
+ (void)start;
- (PPSWHarvestingSystem)init;
@end

@implementation PPSWHarvestingSystem

+ (void)start
{
}

- (PPSWHarvestingSystem)init
{
  return (PPSWHarvestingSystem *)HarvestingSystem.init()();
}

@end