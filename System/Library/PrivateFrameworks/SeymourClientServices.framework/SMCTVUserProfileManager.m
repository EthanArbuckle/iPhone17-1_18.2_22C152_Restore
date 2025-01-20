@interface SMCTVUserProfileManager
+ (id)sharedInstance;
- (SMCTVUserProfile)selectedUserProfile;
@end

@implementation SMCTVUserProfileManager

- (SMCTVUserProfile)selectedUserProfile
{
  return 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_manager;
  return v2;
}

uint64_t __41__SMCTVUserProfileManager_sharedInstance__block_invoke()
{
  sharedInstance_manager = objc_alloc_init(SMCTVUserProfileManager);
  return MEMORY[0x270F9A758]();
}

@end