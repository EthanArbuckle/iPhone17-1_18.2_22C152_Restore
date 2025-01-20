@interface PSLaunchTracker
+ (id)sharedInstance;
- (BOOL)launchHasCompleted;
- (void)setLaunchHasCompleted;
@end

@implementation PSLaunchTracker

- (BOOL)launchHasCompleted
{
  return self->_launchHasCompleted;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PSLaunchTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;
  return v2;
}

- (void)setLaunchHasCompleted
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_launchHasCompleted)
  {
    v3 = _PSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[PSLaunchTracker setLaunchHasCompleted]";
      _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
    }

    self->_launchHasCompleted = 1;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"PSLaunchHasCompletedNotification" object:0];
  }
}

uint64_t __33__PSLaunchTracker_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

@end