@interface SFVoiceSearchManager
+ (SFVoiceSearchManager)sharedManager;
- (BOOL)liveCompletionList;
- (BOOL)presentDictationDiscoveryAlertIfNeeded;
- (NSArray)queryItems;
- (SFVoiceSearchManager)init;
- (id)_kfed;
- (int64_t)_voiceSearchAvailability;
- (int64_t)availability;
- (void)_updateDictationAvailability;
@end

@implementation SFVoiceSearchManager

- (int64_t)availability
{
  return self->_availability;
}

+ (SFVoiceSearchManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)sharedManager_manager;

  return (SFVoiceSearchManager *)v2;
}

- (BOOL)liveCompletionList
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = [v2 BOOLForKey:@"LiveCompletionList"];

  return v3;
}

void __37__SFVoiceSearchManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SFVoiceSearchManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
}

- (SFVoiceSearchManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFVoiceSearchManager;
  v2 = [(SFVoiceSearchManager *)&v7 init];
  char v3 = v2;
  if (v2)
  {
    v2->_availability = [(SFVoiceSearchManager *)v2 _voiceSearchAvailability];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__updateDictationAvailability name:*MEMORY[0x1E4FB2BB0] object:0];

    v5 = v3;
  }

  return v3;
}

- (void)_updateDictationAvailability
{
  int64_t v3 = [(SFVoiceSearchManager *)self _voiceSearchAvailability];
  if (self->_availability != v3)
  {
    self->_availability = v3;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"SFVoiceSearchAvailabilityDidChangeNotification" object:self];
  }
}

- (int64_t)_voiceSearchAvailability
{
  v2 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  int64_t v3 = [getAFPreferencesClass() sharedPreferences];
  if ([v3 dictationIsEnabled] & 1) == 0 && (objc_msgSend(v3, "suppressDictationOptIn")) {
    goto LABEL_14;
  }
  id v4 = [v2 enabledDictationLanguages];
  if (![v4 count])
  {

LABEL_14:
    int64_t v10 = 0;
    goto LABEL_15;
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v5 = (uint64_t (*)(void))getAFDictationRestrictedSymbolLoc_ptr;
  v16 = getAFDictationRestrictedSymbolLoc_ptr;
  if (!getAFDictationRestrictedSymbolLoc_ptr)
  {
    v6 = (void *)AssistantServicesLibrary();
    v14[3] = (uint64_t)dlsym(v6, "AFDictationRestricted");
    getAFDictationRestrictedSymbolLoc_ptr = (_UNKNOWN *)v14[3];
    v5 = (uint64_t (*)(void))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v5)
  {
    v12 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v12);
  }
  char v7 = v5();

  if (v7) {
    goto LABEL_14;
  }
  Class v8 = NSClassFromString(&cfstr_Uidictationcon.isa);
  if (v8)
  {
    v9 = [(objc_class *)v8 sharedInstance];
    if ([v9 dictationDisabledDueToTelephonyActivity]) {
      int64_t v10 = 2;
    }
    else {
      int64_t v10 = 1;
    }
  }
  else
  {
    int64_t v10 = 1;
  }
LABEL_15:

  return v10;
}

- (id)_kfed
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int64_t v3 = [v2 stringForKey:@"VoiceSearchKfed"];

  return v3;
}

- (NSArray)queryItems
{
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F290C8] queryItemWithName:@"qtype" value:@"voice_search"];
  [v3 addObject:v4];

  v5 = [(SFVoiceSearchManager *)self _kfed];
  if ([v5 length])
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"kfed-service" value:v5];
    [v3 addObject:v6];
  }

  return (NSArray *)v3;
}

- (BOOL)presentDictationDiscoveryAlertIfNeeded
{
  v2 = [getAFPreferencesClass() sharedPreferences];
  if ([v2 dictationIsEnabled] & 1) != 0 || (objc_msgSend(v2, "suppressDictationOptIn"))
  {
    char v3 = 0;
  }
  else
  {
    if (dictationControllerClass_onceToken != -1) {
      dispatch_once(&dictationControllerClass_onceToken, &__block_literal_global_84_1);
    }
    id v4 = [ (id) dictationControllerClass_cachedClass sharedInstance];
    char v3 = objc_opt_respondsToSelector();
    if (v3) {
      [v4 presentAlertOfType:1 withCompletion:0];
    }
  }
  return v3 & 1;
}

@end