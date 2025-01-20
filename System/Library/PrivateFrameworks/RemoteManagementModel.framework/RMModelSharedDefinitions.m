@interface RMModelSharedDefinitions
+ (int64_t)currentPlatform;
@end

@implementation RMModelSharedDefinitions

+ (int64_t)currentPlatform
{
  if ([MEMORY[0x263F38BA0] isSharediPad]) {
    return 2;
  }
  else {
    return 1;
  }
}

@end