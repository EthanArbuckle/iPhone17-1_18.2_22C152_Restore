@interface NTKCustomWorldCityAbbreviationsStore
+ (id)sharedInstance;
- (NTKCustomWorldCityAbbreviationsStore)init;
- (id)_getCustomAbbreviationsFromPrefs;
- (void)_handlePrefsChanged;
- (void)_notifyClientsOfChange;
- (void)dealloc;
- (void)setCustomAbbreviation:(id)a3 forCityIdentifier:(id)a4;
@end

@implementation NTKCustomWorldCityAbbreviationsStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1) {
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_80);
  }
  v2 = (void *)sharedInstance_sInstance_0;
  return v2;
}

void __54__NTKCustomWorldCityAbbreviationsStore_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NTKCustomWorldCityAbbreviationsStore);
  v1 = (void *)sharedInstance_sInstance_0;
  sharedInstance_sInstance_0 = (uint64_t)v0;
}

- (NTKCustomWorldCityAbbreviationsStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCustomWorldCityAbbreviationsStore;
  v2 = [(NTKCustomWorldCityAbbreviationsStore *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKCustomWorldCityAbbreviationsStore_HandleStoreChanged, @"com.apple.NanoTimeKit.NTKNanoPrefsChanges", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit");
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NTKCustomWorldCityAbbreviationsStore;
  [(NTKCustomWorldCityAbbreviationsStore *)&v4 dealloc];
}

- (id)_getCustomAbbreviationsFromPrefs
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"customWorldCities", @"com.apple.NanoTimeKit");
  if (v2)
  {
    v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFDictionaryGetTypeID())
    {
      objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];
      CFRelease(v3);
      if (v5) {
        goto LABEL_7;
      }
    }
    else
    {
      CFRelease(v3);
    }
  }
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionary];
LABEL_7:
  return v5;
}

- (void)setCustomAbbreviation:(id)a3 forCityIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(NTKCustomWorldCityAbbreviationsStore *)self _getCustomAbbreviationsFromPrefs];
  value = (void *)[v8 mutableCopy];

  [value setObject:v7 forKey:v6];
  CFPreferencesSetAppValue(@"customWorldCities", value, @"com.apple.NanoTimeKit");
  CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit");
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    v10 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
    v11 = self->_npsManager;
    self->_npsManager = v10;

    npsManager = self->_npsManager;
  }
  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:@"customWorldCities"];
  [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.NanoTimeKit" keys:v12];

  [(NTKCustomWorldCityAbbreviationsStore *)self _notifyClientsOfChange];
}

- (void)_handlePrefsChanged
{
  CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit");
  [(NTKCustomWorldCityAbbreviationsStore *)self _notifyClientsOfChange];
}

- (void)_notifyClientsOfChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NTKCustomWorldCityAbbreviationsChangedNotification" object:self];
}

- (void).cxx_destruct
{
}

@end