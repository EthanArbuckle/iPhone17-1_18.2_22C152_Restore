@interface NTKTimeTravelSettings
+ (id)sharedInstance;
- (BOOL)_isTimeTravelEnabledInPreferences;
- (BOOL)isTimeTravelEnabled;
- (NTKTimeTravelSettings)init;
- (void)_handlePrefsChanged;
- (void)dealloc;
- (void)setTimeTravelEnabled:(BOOL)a3;
@end

@implementation NTKTimeTravelSettings

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NTKTimeTravelSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;

  return v2;
}

void __39__NTKTimeTravelSettings_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v1;
}

- (NTKTimeTravelSettings)init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKTimeTravelSettings;
  v2 = [(NTKTimeTravelSettings *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ntk.timetravelsettings", 0);
    prefsQueue = v2->_prefsQueue;
    v2->_prefsQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKTimeTravelSettings_HandleSettingsChanged, @"com.apple.NanoTimeKit.NTKNanoPrefsChanges", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit");
    v2->_timeTravelEnabled = [(NTKTimeTravelSettings *)v2 _isTimeTravelEnabledInPreferences];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__handlePrefsChanged name:*MEMORY[0x1E4F79E88] object:0];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NTKTimeTravelSettings;
  [(NTKTimeTravelSettings *)&v5 dealloc];
}

- (BOOL)isTimeTravelEnabled
{
  return self->_timeTravelEnabled;
}

- (BOOL)_isTimeTravelEnabledInPreferences
{
  char v6 = 0;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.NanoTimeKit"];
  char v3 = [v2 BOOLForKey:@"timeTravelEnabled" keyExistsAndHasValidFormat:&v6];
  if (v6) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setTimeTravelEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_timeTravelEnabled = a3;
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.NanoTimeKit"];
  [v10 setBool:v3 forKey:@"timeTravelEnabled"];
  id v5 = (id)[v10 synchronize];
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    v7 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
    objc_super v8 = self->_npsManager;
    self->_npsManager = v7;

    npsManager = self->_npsManager;
  }
  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"timeTravelEnabled"];
  [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.NanoTimeKit" keys:v9];
}

- (void)_handlePrefsChanged
{
  prefsQueue = self->_prefsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NTKTimeTravelSettings__handlePrefsChanged__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(prefsQueue, block);
}

void __44__NTKTimeTravelSettings__handlePrefsChanged__block_invoke(uint64_t a1)
{
  CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit");
  char v2 = [*(id *)(a1 + 32) _isTimeTravelEnabledInPreferences];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__NTKTimeTravelSettings__handlePrefsChanged__block_invoke_2;
  v3[3] = &unk_1E62C1BF0;
  v3[4] = *(void *)(a1 + 32);
  char v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __44__NTKTimeTravelSettings__handlePrefsChanged__block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(v1 + 16);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  *(unsigned char *)(v1 + 16) = v3;
  if (v2 != v3)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_super v8 = @"NTKTimeTravelIsEnabledUserInfoKey";
    char v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 16)];
    v9[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v5 postNotificationName:@"NTKTimeTravelSettingsDidChange" object:0 userInfo:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefsQueue, 0);

  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end