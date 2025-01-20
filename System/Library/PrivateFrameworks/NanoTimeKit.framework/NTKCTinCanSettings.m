@interface NTKCTinCanSettings
+ (id)sharedInstance;
- (BOOL)tinCanEnabled;
- (NTKCTinCanSettings)init;
- (void)_handlePrefsChanged;
- (void)_notifyClientsOfChange;
- (void)_readValue;
- (void)dealloc;
@end

@implementation NTKCTinCanSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_59);
  }
  v2 = (void *)sharedInstance_tinCanSettings;
  return v2;
}

void __36__NTKCTinCanSettings_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_tinCanSettings;
  sharedInstance_tinCanSettings = v0;
}

- (NTKCTinCanSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCTinCanSettings;
  v2 = [(NTKCTinCanSettings *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKCTinCanSettings_HandleSettingsChanged, (CFStringRef)*MEMORY[0x1E4FAF318], v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__handlePrefsChanged name:*MEMORY[0x1E4F79E88] object:0];

    [(NTKCTinCanSettings *)v2 _readValue];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4FAF318], self);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F79E88] object:0];

  v5.receiver = self;
  v5.super_class = (Class)NTKCTinCanSettings;
  [(NTKCTinCanSettings *)&v5 dealloc];
}

- (void)_readValue
{
  v3 = [MEMORY[0x1E4F19A30] currentDevice];
  char v4 = [v3 isPaired];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F79CD8]);
    objc_super v6 = (void *)[v5 initWithDomain:*MEMORY[0x1E4FAF328]];
    id v7 = (id)[v6 synchronize];
    char v10 = 0;
    char v8 = [v6 BOOLForKey:*MEMORY[0x1E4FAF320] keyExistsAndHasValidFormat:&v10];
    if (v10) {
      BOOL v9 = v8;
    }
    else {
      BOOL v9 = 1;
    }
    self->_tinCanEnabled = v9;
  }
  else
  {
    self->_tinCanEnabled = 1;
  }
}

- (void)_handlePrefsChanged
{
  [(NTKCTinCanSettings *)self _readValue];
  [(NTKCTinCanSettings *)self _notifyClientsOfChange];
}

- (void)_notifyClientsOfChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NTKCTinCanSettingsChangedNotification" object:self];
}

- (BOOL)tinCanEnabled
{
  return self->_tinCanEnabled;
}

@end