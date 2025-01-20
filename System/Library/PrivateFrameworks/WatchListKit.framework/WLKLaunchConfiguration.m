@interface WLKLaunchConfiguration
+ (id)sharedInstance;
- (BOOL)alwaysPrefetchAppConfiguration;
- (BOOL)useSharedURLSession;
- (void)setAlwaysPrefetchAppConfiguration:(BOOL)a3;
- (void)setUseSharedURLSession:(BOOL)a3;
@end

@implementation WLKLaunchConfiguration

- (void)setUseSharedURLSession:(BOOL)a3
{
  self->_useSharedURLSession = a3;
}

- (void)setAlwaysPrefetchAppConfiguration:(BOOL)a3
{
  self->_alwaysPrefetchAppConfiguration = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_30);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

- (BOOL)useSharedURLSession
{
  return self->_useSharedURLSession;
}

- (BOOL)alwaysPrefetchAppConfiguration
{
  return self->_alwaysPrefetchAppConfiguration;
}

uint64_t __40__WLKLaunchConfiguration_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(WLKLaunchConfiguration);

  return MEMORY[0x1F41817F8]();
}

@end