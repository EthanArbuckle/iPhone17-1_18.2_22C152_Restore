@interface NHSSPrivacyDefaults
+ (NHSSPrivacyDefaults)sharedInstance;
- (NHSSPrivacyDefaults)init;
- (id)localizedMicrophonePermissionAlertAllowButtonText;
- (id)localizedMicrophonePermissionAlertDenyButtonText;
- (id)localizedMicrophonePermissionAlertHeader;
- (id)localizedMicrophonePermissionAlertMessage;
- (id)localizedMicrophonePermissionSwitchFootnote;
- (id)localizedMicrophonePermissionSwitchName;
- (int64_t)microphonePermission;
- (void)_mainQueue_notifyObserversDefaultsDidChange;
- (void)_observeChangesToPrivacyDefaults;
- (void)_postPrivacyDefaultsDidChangeNotification;
- (void)addObserver:(id)a3;
- (void)microphonePermission;
- (void)privacyDefaultsDidChange;
- (void)removeObserver:(id)a3;
- (void)setMicrophonePermission:(int64_t)a3;
@end

@implementation NHSSPrivacyDefaults

+ (NHSSPrivacyDefaults)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___sharedInstance_1;
  return (NHSSPrivacyDefaults *)v2;
}

uint64_t __37__NHSSPrivacyDefaults_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_1 = objc_alloc_init(NHSSPrivacyDefaults);
  return MEMORY[0x270F9A758]();
}

- (NHSSPrivacyDefaults)init
{
  v11.receiver = self;
  v11.super_class = (Class)NHSSPrivacyDefaults;
  v2 = [(NHSSPrivacyDefaults *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    bundle = v2->_bundle;
    v2->_bundle = (NSBundle *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    lock_observers = v2->_lock_observers;
    v2->_lock_observers = (NSHashTable *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.NanoHomeScreen.PrivacyDefaults.syncQueue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    [(NHSSPrivacyDefaults *)v2 _observeChangesToPrivacyDefaults];
  }
  return v2;
}

- (int64_t)microphonePermission
{
  int64_t v2 = 1970168948;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoHomeScreen.PrivacyDefaults"];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKey:@"microphonePermission"];
    uint64_t v6 = [v5 integerValue];
    if (v6 == 1735552628) {
      uint64_t v7 = 1735552628;
    }
    else {
      uint64_t v7 = 1970168948;
    }
    if (v6 == 1684369017) {
      int64_t v2 = 1684369017;
    }
    else {
      int64_t v2 = v7;
    }
  }
  else
  {
    uint64_t v5 = NHSSLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NHSSPrivacyDefaults microphonePermission](v5);
    }
  }

  return v2;
}

- (void)setMicrophonePermission:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__NHSSPrivacyDefaults_setMicrophonePermission___block_invoke;
  v4[3] = &unk_265427C10;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __47__NHSSPrivacyDefaults_setMicrophonePermission___block_invoke(uint64_t a1)
{
  int64_t v2 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoHomeScreen.PrivacyDefaults"];
  if (v2)
  {
    uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    [v2 setObject:v3 forKey:@"microphonePermission"];
    id v4 = (id)[v2 synchronize];
    id v5 = objc_alloc_init(MEMORY[0x263F57528]);
    uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:@"microphonePermission"];
    [v5 synchronizeNanoDomain:@"com.apple.NanoHomeScreen.PrivacyDefaults" keys:v6];
    [*(id *)(a1 + 32) _postPrivacyDefaultsDidChangeNotification];
  }
  else
  {
    uint64_t v7 = NHSSLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__NHSSPrivacyDefaults_setMicrophonePermission___block_invoke_cold_1(v7);
    }
  }
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)localizedMicrophonePermissionSwitchName
{
  return [(NSBundle *)self->_bundle localizedStringForKey:@"PRIVACY_DEFAULTS_MICROPHONE_PERMISSION_SWITCH_NAME" value:0 table:0];
}

- (id)localizedMicrophonePermissionSwitchFootnote
{
  return [(NSBundle *)self->_bundle localizedStringForKey:@"PRIVACY_DEFAULTS_MICROPHONE_PERMISSION_SWITCH_FOOTNOTE" value:0 table:0];
}

- (id)localizedMicrophonePermissionAlertHeader
{
  return [(NSBundle *)self->_bundle localizedStringForKey:@"PRIVACY_DEFAULTS_MICROPHONE_PERMISSION_ALERT_HEADER" value:0 table:0];
}

- (id)localizedMicrophonePermissionAlertMessage
{
  return [(NSBundle *)self->_bundle localizedStringForKey:@"PRIVACY_DEFAULTS_MICROPHONE_PERMISSION_ALERT_MESSAGE" value:0 table:0];
}

- (id)localizedMicrophonePermissionAlertAllowButtonText
{
  return [(NSBundle *)self->_bundle localizedStringForKey:@"PRIVACY_DEFAULTS_MICROPHONE_PERMISSION_ALERT_ALLOW_BUTTON_TEXT" value:0 table:0];
}

- (id)localizedMicrophonePermissionAlertDenyButtonText
{
  return [(NSBundle *)self->_bundle localizedStringForKey:@"PRIVACY_DEFAULTS_MICROPHONE_PERMISSION_ALERT_DENY_BUTTON_TEXT" value:0 table:0];
}

- (void)_observeChangesToPrivacyDefaults
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_NHSSPrivacyDefaultsChangeHandler, @"com.apple.NanoHomeScreen.PrivacyDefaultsChanged", self, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_postPrivacyDefaultsDidChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.NanoHomeScreen.PrivacyDefaultsChanged", 0, 0, 1u);
}

- (void)privacyDefaultsDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__NHSSPrivacyDefaults_privacyDefaultsDidChange__block_invoke;
  block[3] = &unk_265427B08;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __47__NHSSPrivacyDefaults_privacyDefaultsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_notifyObserversDefaultsDidChange");
}

- (void)_mainQueue_notifyObserversDefaultsDidChange
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "privacyDefaultsDidChange", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (void)microphonePermission
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_257329000, log, OS_LOG_TYPE_ERROR, "Unable to get microphone permission, gizmo must be paired and active", v1, 2u);
}

void __47__NHSSPrivacyDefaults_setMicrophonePermission___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_257329000, log, OS_LOG_TYPE_ERROR, "Unable to set microphone permission, gizmo must be paired and active", v1, 2u);
}

@end