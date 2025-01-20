@interface MFInternalSettingsCache
+ (id)sharedCache;
- (BOOL)UIDebuggingEnabled;
- (BOOL)tiltedTabSkyViewEnabled;
- (void)setTiltedTabSkyViewEnabled:(BOOL)a3;
- (void)setUIDebuggingEnabled:(BOOL)a3;
@end

@implementation MFInternalSettingsCache

- (BOOL)UIDebuggingEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MFInternalSettingsCache_UIDebuggingEnabled__block_invoke;
  block[3] = &unk_1E6D1AB40;
  block[4] = self;
  if (UIDebuggingEnabled_onceToken != -1) {
    dispatch_once(&UIDebuggingEnabled_onceToken, block);
  }
  return self->_UIDebuggingEnabled;
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedCache_sharedCache;
  return v2;
}

void __45__MFInternalSettingsCache_UIDebuggingEnabled__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = [v2 BOOLForKey:@"UIDebuggingEnabled"];
}

void __38__MFInternalSettingsCache_sharedCache__block_invoke()
{
  v0 = objc_alloc_init(MFInternalSettingsCache);
  v1 = (void *)sharedCache_sharedCache;
  sharedCache_sharedCache = (uint64_t)v0;
}

- (BOOL)tiltedTabSkyViewEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MFInternalSettingsCache_tiltedTabSkyViewEnabled__block_invoke;
  block[3] = &unk_1E6D1AB40;
  block[4] = self;
  if (tiltedTabSkyViewEnabled_onceToken != -1) {
    dispatch_once(&tiltedTabSkyViewEnabled_onceToken, block);
  }
  return self->_tiltedTabSkyViewEnabled;
}

void __50__MFInternalSettingsCache_tiltedTabSkyViewEnabled__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [v2 BOOLForKey:@"TiltedTabViewSkyViewEnabled"];
}

- (void)setTiltedTabSkyViewEnabled:(BOOL)a3
{
  self->_tiltedTabSkyViewEnabled = a3;
}

- (void)setUIDebuggingEnabled:(BOOL)a3
{
  self->_UIDebuggingEnabled = a3;
}

@end