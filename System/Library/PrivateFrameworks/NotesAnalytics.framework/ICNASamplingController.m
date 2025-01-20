@interface ICNASamplingController
+ (id)sharedController;
- (BOOL)shouldTrackSyncHealth;
- (ICNASamplingController)init;
- (void)init;
@end

@implementation ICNASamplingController

+ (id)sharedController
{
  if (s_onceToken_1 != -1) {
    dispatch_once(&s_onceToken_1, &__block_literal_global_5);
  }
  v2 = (void *)sharedController_s_instance;
  return v2;
}

uint64_t __42__ICNASamplingController_sharedController__block_invoke()
{
  sharedController_s_instance = objc_alloc_init(ICNASamplingController);
  return MEMORY[0x1F41817F8]();
}

- (ICNASamplingController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICNASamplingController;
  v2 = [(ICNASamplingController *)&v6 init];
  if (v2)
  {
    uint32_t v3 = arc4random();
    v2->_shouldTrackSyncHealth = 1;
    v4 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(ICNASamplingController *)v3 init];
    }
  }
  return v2;
}

- (BOOL)shouldTrackSyncHealth
{
  return self->_shouldTrackSyncHealth;
}

- (void)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  uint64_t v6 = 0x3FF0000000000000;
  int v5 = 134218498;
  if (v3) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  __int16 v7 = 2048;
  uint64_t v8 = a1 % 0x64;
  __int16 v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_1C3EAD000, log, OS_LOG_TYPE_DEBUG, "Sync Health Tracking Sampling Ratio = %f, generated random number %lu, decision = %@", (uint8_t *)&v5, 0x20u);
}

@end