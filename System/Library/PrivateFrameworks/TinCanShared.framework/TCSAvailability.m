@interface TCSAvailability
+ (BOOL)isUserAvailable;
+ (BOOL)shouldShowWalkieTalkieStatusIndicator;
+ (id)sharedInstance;
+ (void)setUserAvailable:(BOOL)a3;
- (BOOL)_calculateShouldShowStatusIndicator;
- (BOOL)_hasConnectivity;
- (BOOL)_isUserUnavailable;
- (BOOL)shouldObserveFriendListDefaultChanges;
- (BOOL)shouldObserveUnavailabilityDefaultChanges;
- (BOOL)shouldShowStatusIndicator;
- (TCSAvailability)init;
- (id)_unavailabilityText:(BOOL)a3;
- (void)_handleDeviceFirstUnlock;
- (void)_postNotificationName:(id)a3;
- (void)_setUserUnavailable:(BOOL)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setShouldObserveFriendListDefaultChanges:(BOOL)a3;
- (void)setShouldObserveUnavailabilityDefaultChanges:(BOOL)a3;
- (void)setShouldShowStatusIndicator:(BOOL)a3;
@end

@implementation TCSAvailability

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sSharedAvailability;
  return v2;
}

uint64_t __33__TCSAvailability_sharedInstance__block_invoke()
{
  sharedInstance_sSharedAvailability = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (TCSAvailability)init
{
  v10.receiver = self;
  v10.super_class = (Class)TCSAvailability;
  v2 = [(TCSAvailability *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[TCSTinCanUserDefaults defaults];
    tinCanDefaults = v2->_tinCanDefaults;
    v2->_tinCanDefaults = (NSUserDefaults *)v3;

    uint64_t v5 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v5;

    if (!+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot])
    {
      v7 = [MEMORY[0x263F08A00] defaultCenter];
      v8 = +[TCSBehavior sharedBehavior];
      [v7 addObserver:v2 selector:sel__handleDeviceFirstUnlock name:@"TCSFirstUnlockNotification" object:v8];
    }
    v2->_shouldShowStatusIndicator = [(TCSAvailability *)v2 _calculateShouldShowStatusIndicator];
    [(TCSAvailability *)v2 setShouldObserveUnavailabilityDefaultChanges:1];
    [(TCSAvailability *)v2 setShouldObserveFriendListDefaultChanges:1];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(TCSAvailability *)self setShouldObserveUnavailabilityDefaultChanges:0];
  [(TCSAvailability *)self setShouldObserveFriendListDefaultChanges:0];
  v4.receiver = self;
  v4.super_class = (Class)TCSAvailability;
  [(TCSAvailability *)&v4 dealloc];
}

- (void)setShouldObserveFriendListDefaultChanges:(BOOL)a3
{
  if (self->_shouldObserveFriendListDefaultChanges != a3)
  {
    BOOL v3 = a3;
    self->_shouldObserveFriendListDefaultChanges = a3;
    tinCanDefaults = self->_tinCanDefaults;
    uint64_t v6 = +[TCSTinCanUserDefaults allowListKey];
    id v7 = (id)v6;
    if (v3) {
      [(NSUserDefaults *)tinCanDefaults addObserver:self forKeyPath:v6 options:1 context:TCSFriendListObservationContext];
    }
    else {
      [(NSUserDefaults *)tinCanDefaults removeObserver:self forKeyPath:v6 context:TCSFriendListObservationContext];
    }
  }
}

- (void)setShouldObserveUnavailabilityDefaultChanges:(BOOL)a3
{
  if (self->_shouldObserveUnavailabilityDefaultChanges != a3)
  {
    self->_shouldObserveUnavailabilityDefaultChanges = a3;
    tinCanDefaults = self->_tinCanDefaults;
    if (a3) {
      [(NSUserDefaults *)tinCanDefaults addObserver:self forKeyPath:@"Unavailable" options:1 context:TCSAvailabilityObservationContext];
    }
    else {
      [(NSUserDefaults *)tinCanDefaults removeObserver:self forKeyPath:@"Unavailable" context:TCSAvailabilityObservationContext];
    }
  }
}

- (void)setShouldShowStatusIndicator:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_shouldShowStatusIndicator != a3)
  {
    self->_shouldShowStatusIndicator = a3;
    _TCSInitializeLogging();
    objc_super v4 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldShowStatusIndicator) {
        uint64_t v5 = &stru_26CFCDDE8;
      }
      else {
        uint64_t v5 = @"not ";
      }
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_21E834000, v4, OS_LOG_TYPE_DEFAULT, "Walkie-Talkie status indicator should %@be shown.", (uint8_t *)&v6, 0xCu);
    }
    [(TCSAvailability *)self _postNotificationName:@"TCSStatusIndicatorStateDidChangeNotification"];
  }
}

+ (BOOL)isUserAvailable
{
  v2 = +[TCSAvailability sharedInstance];
  char v3 = [v2 _isUserUnavailable] ^ 1;

  return v3;
}

+ (void)setUserAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[TCSAvailability sharedInstance];
  [v4 _setUserUnavailable:!v3];
}

+ (BOOL)shouldShowWalkieTalkieStatusIndicator
{
  v2 = +[TCSAvailability sharedInstance];
  char v3 = [v2 shouldShowStatusIndicator];

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)TCSAvailabilityObservationContext == a6 || TCSFriendListObservationContext == (void)a6)
  {
    if ((void *)TCSAvailabilityObservationContext == a6) {
      [(TCSAvailability *)self _postNotificationName:@"TCSAvailabilityDidChangeNotification"];
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __66__TCSAvailability_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v15[3] = &unk_2644C8B50;
    v15[4] = self;
    TCSGuaranteeMainThread(v15);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TCSAvailability;
    [(TCSAvailability *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __66__TCSAvailability_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _calculateShouldShowStatusIndicator];
  char v3 = *(void **)(a1 + 32);
  return [v3 setShouldShowStatusIndicator:v2];
}

- (BOOL)_isUserUnavailable
{
  if (!+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot])return 1; {
  tinCanDefaults = self->_tinCanDefaults;
  }
  return [(NSUserDefaults *)tinCanDefaults BOOLForKey:@"Unavailable"];
}

- (void)_setUserUnavailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot])
  {
    if ([(TCSAvailability *)self _isUserUnavailable] != v3)
    {
      [(TCSAvailability *)self setShouldObserveUnavailabilityDefaultChanges:0];
      tinCanDefaults = self->_tinCanDefaults;
      if (v3) {
        [(NSUserDefaults *)tinCanDefaults setBool:1 forKey:@"Unavailable"];
      }
      else {
        [(NSUserDefaults *)tinCanDefaults removeObjectForKey:@"Unavailable"];
      }
      [(TCSAvailability *)self setShouldObserveUnavailabilityDefaultChanges:1];
      _TCSInitializeLogging();
      id v7 = (void *)TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = v7;
        v9 = [(TCSAvailability *)self _unavailabilityText:v3];
        int v13 = 138412290;
        objc_super v14 = v9;
        _os_log_impl(&dword_21E834000, v8, OS_LOG_TYPE_DEFAULT, "User has become %@ for Walkie-Talkie communication.", (uint8_t *)&v13, 0xCu);
      }
      [(TCSAvailability *)self _postNotificationName:@"TCSAvailabilityDidChangeNotification"];
      if (NPSHasCompletedInitialSync())
      {
        npsManager = self->_npsManager;
        id v11 = [MEMORY[0x263EFFA08] setWithObject:@"Unavailable"];
        [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.tincan" keys:v11];
      }
      BOOL v12 = !v3 && [(TCSAvailability *)self _calculateShouldShowStatusIndicator];
      [(TCSAvailability *)self setShouldShowStatusIndicator:v12];
    }
  }
  else
  {
    _TCSInitializeLogging();
    int v6 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSAvailability _setUserUnavailable:](v6);
    }
  }
}

- (BOOL)_calculateShouldShowStatusIndicator
{
  if (!+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot])return 0; {
  BOOL v3 = [(TCSAvailability *)self _hasConnectivity];
  }
  tinCanDefaults = self->_tinCanDefaults;
  uint64_t v5 = +[TCSTinCanUserDefaults allowListKey];
  int v6 = [(NSUserDefaults *)tinCanDefaults dictionaryForKey:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [NSDictionary dictionary];
  }
  id v10 = v8;

  id v11 = +[TCSContacts validatedAllowlistFromDictionary:v10];

  BOOL v12 = +[TCSContacts _destinationsFromAllowlistDictionary:v11 onlyAccepted:1];
  uint64_t v13 = [v12 count];

  unsigned int v14 = (v13 != 0) & ~[(TCSAvailability *)self _isUserUnavailable];
  if (v3) {
    BOOL v9 = v14;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_handleDeviceFirstUnlock
{
  _TCSInitializeLogging();
  BOOL v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSAvailability was notified of first device unlock.", v4, 2u);
  }
  [(TCSAvailability *)self setShouldShowStatusIndicator:[(TCSAvailability *)self _calculateShouldShowStatusIndicator]];
  if (![(TCSAvailability *)self _isUserUnavailable]) {
    [(TCSAvailability *)self _postNotificationName:@"TCSAvailabilityDidChangeNotification"];
  }
}

- (BOOL)_hasConnectivity
{
  return 1;
}

- (void)_postNotificationName:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__TCSAvailability__postNotificationName___block_invoke;
  block[3] = &unk_2644C8B50;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__TCSAvailability__postNotificationName___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:0];
}

- (id)_unavailabilityText:(BOOL)a3
{
  if (a3) {
    return @"unavailable";
  }
  else {
    return @"available";
  }
}

- (BOOL)shouldObserveFriendListDefaultChanges
{
  return self->_shouldObserveFriendListDefaultChanges;
}

- (BOOL)shouldObserveUnavailabilityDefaultChanges
{
  return self->_shouldObserveUnavailabilityDefaultChanges;
}

- (BOOL)shouldShowStatusIndicator
{
  return self->_shouldShowStatusIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_tinCanDefaults, 0);
}

- (void)_setUserUnavailable:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E834000, log, OS_LOG_TYPE_ERROR, "Attempt to set user availability flag before device first unlock.", v1, 2u);
}

@end