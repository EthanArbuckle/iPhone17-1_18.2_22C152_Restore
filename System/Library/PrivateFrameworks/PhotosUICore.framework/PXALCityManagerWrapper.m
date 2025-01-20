@interface PXALCityManagerWrapper
+ (ALCityManager)sharedALCityManager;
@end

@implementation PXALCityManagerWrapper

+ (ALCityManager)sharedALCityManager
{
  return (ALCityManager *)[MEMORY[0x1E4F4BE38] sharedManager];
}

@end