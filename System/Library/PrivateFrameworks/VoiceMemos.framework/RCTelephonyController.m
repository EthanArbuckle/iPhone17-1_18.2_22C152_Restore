@interface RCTelephonyController
+ (id)sharedTelephonyController;
- (BOOL)isCallPresent;
@end

@implementation RCTelephonyController

+ (id)sharedTelephonyController
{
  v2 = (void *)sharedTelephonyController___sharedTelephonyController;
  if (!sharedTelephonyController___sharedTelephonyController)
  {
    v3 = objc_alloc_init(RCTelephonyController);
    v4 = (void *)sharedTelephonyController___sharedTelephonyController;
    sharedTelephonyController___sharedTelephonyController = (uint64_t)v3;

    v2 = (void *)sharedTelephonyController___sharedTelephonyController;
  }
  return v2;
}

- (BOOL)isCallPresent
{
  v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  BOOL v3 = [v2 currentAudioAndVideoCallCount] != 0;

  return v3;
}

@end