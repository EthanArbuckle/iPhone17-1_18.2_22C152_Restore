@interface SOSContactsManager
+ (BOOL)authorizedToUseContactStore;
+ (id)contactStore;
+ (void)preloadContactStoreIfNecessary;
- (BOOL)SOSContactsExist;
- (BOOL)_isEmergencyNumber:(id)a3;
- (BOOL)hasValidContactsToMessage;
- (BOOL)isPhoneNumberEqual:(id)a3 toNumber:(id)a4;
- (HKHealthStore)healthStore;
- (NSArray)activeSafetyMonitorSessionPrimaryHandles;
- (NSArray)medicalIDEmergencyContacts;
- (OS_dispatch_semaphore)medicalIDContactsInitialStateSemaphore;
- (OS_dispatch_semaphore)safetyMonitorSessionInitialStateSemaphore;
- (SOSContactsManager)init;
- (SOSContactsManager)initWithHealthStore:(id)a3;
- (SOSLegacyContactsManager)legacyContactsManager;
- (_opaque_pthread_mutex_t)medicalIDEmergencyContactsMutex;
- (_opaque_pthread_mutex_t)safetyMonitorSessionHandleMutex;
- (id)SOSContactDestinations;
- (id)SOSContactRecipients;
- (id)_sosRecipientContainingPhoneNumber:(id)a3 inRecipients:(id)a4;
- (id)_userDefaults;
- (void)SOSContactsWithTimeout:(double)a3 andCompletion:(id)a4;
- (void)_fetchMedicalIDEmergencyContacts;
- (void)_fetchSafetyMonitorSessionHandles;
- (void)_medicalContactsDidChange;
- (void)_medicalIDEmergencyContactsWithCompletion:(id)a3;
- (void)_updateWithSafetyMonitorHandles:(id)a3;
- (void)_updateWithSafetyMonitorSessionState:(id)a3 error:(id)a4;
- (void)_waitForMedicalIDInitialState;
- (void)_waitForSafetyMonitorInitialState;
- (void)dealloc;
- (void)refreshCurrentEmergencyContacts;
- (void)setActiveSafetyMonitorSessionPrimaryHandles:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setMedicalIDContactsInitialStateSemaphore:(id)a3;
- (void)setMedicalIDEmergencyContacts:(id)a3;
- (void)setMedicalIDEmergencyContactsMutex:(_opaque_pthread_mutex_t *)a3;
- (void)setSafetyMonitorSessionHandleMutex:(_opaque_pthread_mutex_t *)a3;
- (void)setSafetyMonitorSessionInitialStateSemaphore:(id)a3;
@end

@implementation SOSContactsManager

- (SOSContactsManager)init
{
  return [(SOSContactsManager *)self initWithHealthStore:0];
}

- (SOSContactsManager)initWithHealthStore:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (+[SOSEntitlement currentProcessHasEntitlement:@"com.apple.sos.contacts"])
  {
    v34.receiver = self;
    v34.super_class = (Class)SOSContactsManager;
    v6 = [(SOSContactsManager *)&v34 init];
    v7 = v6;
    if (v6)
    {
      if (v5)
      {
        objc_storeStrong((id *)&v6->_healthStore, a3);
      }
      else
      {
        v9 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E4F2B0B8]);
        healthStore = v7->_healthStore;
        v7->_healthStore = v9;

        [(HKHealthStore *)v7->_healthStore setDebugIdentifier:@"com.apple.sos"];
        [(HKHealthStore *)v7->_healthStore resume];
      }
      v11 = sos_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_opt_class();
        v13 = v7->_healthStore;
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v12;
        __int16 v37 = 2112;
        v38 = v13;
        _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "Initializing %@ with _healthStore: %@", buf, 0x16u);
      }

      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      medicalIDContactsInitialStateSemaphore = v7->_medicalIDContactsInitialStateSemaphore;
      v7->_medicalIDContactsInitialStateSemaphore = (OS_dispatch_semaphore *)v14;

      int v16 = pthread_mutex_init(&v7->_medicalIDEmergencyContactsMutex, 0);
      if (v16)
      {
        v17 = sos_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SOSContactsManager initWithHealthStore:](v16, v17);
        }
      }
      v18 = (const char *)*MEMORY[0x1E4F2BED8];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __42__SOSContactsManager_initWithHealthStore___block_invoke;
      handler[3] = &unk_1E6063FC8;
      v19 = v7;
      v33 = v19;
      uint32_t v20 = notify_register_dispatch(v18, &v7->_healthContactsNotificationToken, MEMORY[0x1E4F14428], handler);
      if (v20)
      {
        v21 = sos_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v36) = v20;
          _os_log_impl(&dword_1B3A94000, v21, OS_LOG_TYPE_DEFAULT, "Failed to register for Health contacts notification: %d", buf, 8u);
        }
      }
      [(pthread_mutex_t *)v19 _fetchMedicalIDEmergencyContacts];

      dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
      v23 = *(void **)&v19->__opaque[48];
      *(void *)&v19->__opaque[48] = v22;

      int v24 = pthread_mutex_init(v19 + 2, 0);
      if (v24)
      {
        v25 = sos_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[SOSContactsManager initWithHealthStore:](v24, v25);
        }
      }
      objc_initWeak((id *)buf, v19);
      v26 = sos_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_1B3A94000, v26, OS_LOG_TYPE_DEFAULT, "Registering SafetyMonitor startMonitoringSessionStateWithHandler", v31, 2u);
      }

      v27 = [getSMSafetyMonitorManagerClass() defaultManager];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __42__SOSContactsManager_initWithHealthStore___block_invoke_314;
      v29[3] = &unk_1E6063FF0;
      objc_copyWeak(&v30, (id *)buf);
      [v27 startMonitoringSessionStateWithHandler:v29];

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __42__SOSContactsManager_initWithHealthStore___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _medicalContactsDidChange];
}

void __42__SOSContactsManager_initWithHealthStore___block_invoke_314(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = sos_default_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v10)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor startMonitoringSessionStateWithHandler invoked, updating", v11, 2u);
    }

    [WeakRetained _updateWithSafetyMonitorSessionState:v6 error:v7];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor startMonitoringSessionStateWithHandler invoked, no self", buf, 2u);
    }
  }
}

- (void)dealloc
{
  v3 = [getSMSafetyMonitorManagerClass() defaultManager];
  [v3 stopMonitoringSessionStateWithHandler:&__block_literal_global];

  notify_cancel(self->_healthContactsNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)SOSContactsManager;
  [(SOSContactsManager *)&v4 dealloc];
}

void __29__SOSContactsManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __29__SOSContactsManager_dealloc__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)refreshCurrentEmergencyContacts
{
  [(SOSContactsManager *)self _fetchMedicalIDEmergencyContacts];

  [(SOSContactsManager *)self _fetchSafetyMonitorSessionHandles];
}

- (void)SOSContactsWithTimeout:(double)a3 andCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(SOSContactsManager *)self medicalIDEmergencyContacts];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)SOSContactDestinations
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [(SOSContactsManager *)self SOSContactRecipients];
  v3 = +[SOSRecipient handlesFromRecipients:v2];

  uint64_t v4 = sos_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "sosContactDestinations: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)SOSContactRecipients
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = (id)objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SOSContactsManager_SOSContactRecipients__block_invoke;
  v7[3] = &unk_1E6064038;
  v7[4] = self;
  v7[5] = &v8;
  [(SOSContactsManager *)self SOSContactsWithTimeout:v7 andCompletion:10.0];
  v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v9[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "sosRecipients: %@", buf, 0xCu);
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__SOSContactsManager_SOSContactRecipients__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v38;
    uint64_t v30 = 138412290;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v38 != v4) {
          objc_enumerationMutation(obj);
        }
        int v6 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v7 = objc_msgSend(v6, "phoneNumber", v30);
        uint64_t v8 = sos_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v7;
          _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "sosContact: %@ phoneNumber: %@", buf, 0x16u);
        }

        if ([v7 length])
        {
          if ([*(id *)(a1 + 32) _isEmergencyNumber:v7])
          {
            uint64_t v9 = sos_default_log();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v30;
              *(void *)&uint8_t buf[4] = v7;
              _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "NOT adding phoneNumber as it's an emergency #: %@", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v9 = objc_opt_new();
            [v9 setHandle:v7];
            [v9 setReasons:1];
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v3);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = [*(id *)(a1 + 32) activeSafetyMonitorSessionPrimaryHandles];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v34;
    v31 = &buf[16];
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v10);
        }
        dispatch_semaphore_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        if (objc_msgSend(v14, "length", v31))
        {
          uint64_t v41 = 0;
          v42 = &v41;
          uint64_t v43 = 0x2050000000;
          dispatch_semaphore_t v22 = (void *)getSMHandleClass_softClass;
          uint64_t v44 = getSMHandleClass_softClass;
          if (!getSMHandleClass_softClass)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&uint8_t buf[16] = __getSMHandleClass_block_invoke;
            v48 = &unk_1E60640A0;
            v49 = &v41;
            __getSMHandleClass_block_invoke((uint64_t)buf, v15, v16, v17, v18, v19, v20, v21, (uint8_t)v31);
            dispatch_semaphore_t v22 = (void *)v42[3];
          }
          id v23 = v22;
          _Block_object_dispose(&v41, 8);
          if ([v23 getSMHandleTypeWithHandle:v14] == 2)
          {
            int v24 = sos_default_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v14;
              _os_log_impl(&dword_1B3A94000, v24, OS_LOG_TYPE_DEFAULT, "Adding email safetyMonitorSessionHandle: %@", buf, 0xCu);
            }

            v25 = objc_opt_new();
            [v25 setHandle:v14];
            [v25 setReasons:2];
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v25];
          }
          else
          {
            v25 = v14;
            if ([*(id *)(a1 + 32) _isEmergencyNumber:v25])
            {
              v26 = sos_default_log();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v25;
                _os_log_impl(&dword_1B3A94000, v26, OS_LOG_TYPE_DEFAULT, "NOT adding safetyMonitorSessionPhoneNumber as it's an emergency #: %@", buf, 0xCu);
              }
            }
            else
            {
              v26 = [*(id *)(a1 + 32) _sosRecipientContainingPhoneNumber:v25 inRecipients:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
              v27 = sos_default_log();
              BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
              if (v26)
              {
                if (v28)
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v25;
                  _os_log_impl(&dword_1B3A94000, v27, OS_LOG_TYPE_DEFAULT, "NOT adding safetyMonitorSessionPhoneNumber as it's already there: %@, marking phone number as Zelkova contact", buf, 0xCu);
                }

                [v26 setReasons:[v26 reasons] | 2];
              }
              else
              {
                if (v28)
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v25;
                  _os_log_impl(&dword_1B3A94000, v27, OS_LOG_TYPE_DEFAULT, "Adding safetyMonitorSessionPhoneNumber: %@", buf, 0xCu);
                }

                v29 = objc_opt_new();
                [v29 setHandle:v25];
                [v29 setReasons:2];
                [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v29];
              }
            }
          }
        }
        else
        {
          v25 = sos_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B3A94000, v25, OS_LOG_TYPE_DEFAULT, "NOT adding safetyMonitorSessionHandle as it's empty", buf, 2u);
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v11);
  }
}

- (id)_sosRecipientContainingPhoneNumber:(id)a3 inRecipients:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "handle", (void)v17);
        BOOL v14 = [(SOSContactsManager *)self isPhoneNumberEqual:v6 toNumber:v13];

        if (v14)
        {
          id v15 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)isPhoneNumberEqual:(id)a3 toNumber:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  active = (const void *)PNCopyBestGuessCountryCodeForNumber();
  if (!active) {
    active = (const void *)CPPhoneNumberCopyActiveCountryCode();
  }
  uint64_t v8 = (const void *)PNCopyBestGuessCountryCodeForNumber();
  if (!v8) {
    uint64_t v8 = (const void *)CPPhoneNumberCopyActiveCountryCode();
  }
  int v9 = PNPhoneNumbersEqual();
  CFRelease(active);
  CFRelease(v8);
  uint64_t v10 = sos_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315906;
    id v13 = "-[SOSContactsManager isPhoneNumberEqual:toNumber:]";
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "%s: numberA: %@, numberB: %@, equal: %d", (uint8_t *)&v12, 0x26u);
  }

  return v9;
}

- (BOOL)SOSContactsExist
{
  id v2 = [(SOSContactsManager *)self SOSContactDestinations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_isEmergencyNumber:(id)a3
{
  id v3 = a3;
  CTSUServerConnectionRef();
  uint64_t IsEmergencyNumber = _CTServerConnectionIsEmergencyNumber();

  if (IsEmergencyNumber)
  {
    id v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(SOSContactsManager *)IsEmergencyNumber _isEmergencyNumber:v5];
    }
  }
  return 0;
}

- (BOOL)hasValidContactsToMessage
{
  if (+[SOSUtilities isMessagesAppInstalled])
  {
    id v3 = [(SOSContactsManager *)self phoneNumbersToMessage];
    BOOL v4 = [v3 count] != 0;
  }
  else
  {
    id v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Messages app not installed, cannot message emergency contacts", v7, 2u);
    }

    return 0;
  }
  return v4;
}

- (SOSLegacyContactsManager)legacyContactsManager
{
  legacyContactsManager = self->_legacyContactsManager;
  if (!legacyContactsManager)
  {
    BOOL v4 = (SOSLegacyContactsManager *)objc_opt_new();
    id v5 = self->_legacyContactsManager;
    self->_legacyContactsManager = v4;

    legacyContactsManager = self->_legacyContactsManager;
  }

  return legacyContactsManager;
}

- (id)_userDefaults
{
  if (_userDefaults_onceToken != -1) {
    dispatch_once(&_userDefaults_onceToken, &__block_literal_global_325);
  }
  id v2 = (void *)_userDefaults_defaults;

  return v2;
}

uint64_t __35__SOSContactsManager__userDefaults__block_invoke()
{
  _userDefaults_defaults = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobilephone"];

  return MEMORY[0x1F41817F8]();
}

+ (void)preloadContactStoreIfNecessary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SOSContactsManager_preloadContactStoreIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadContactStoreIfNecessary_once != -1) {
    dispatch_once(&preloadContactStoreIfNecessary_once, block);
  }
}

void __52__SOSContactsManager_preloadContactStoreIfNecessary__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.sos.contactStoreQueue", 0);
  id v3 = (void *)__contactStoreQueue;
  __contactStoreQueue = (uint64_t)v2;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SOSContactsManager_preloadContactStoreIfNecessary__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)__contactStoreQueue, block);
}

uint64_t __52__SOSContactsManager_preloadContactStoreIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) authorizedToUseContactStore];
  if (result)
  {
    __contactStore = [MEMORY[0x1E4F1B980] storeWithOptions:1];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)contactStore
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy_;
  int v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  [a1 preloadContactStoreIfNecessary];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SOSContactsManager_contactStore__block_invoke;
  block[3] = &unk_1E60640A0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__contactStoreQueue, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__SOSContactsManager_contactStore__block_invoke(uint64_t a1)
{
}

+ (BOOL)authorizedToUseContactStore
{
  if (authorizedToUseContactStore_onceToken != -1) {
    dispatch_once(&authorizedToUseContactStore_onceToken, &__block_literal_global_331);
  }
  return authorizedToUseContactStore_contactStoreAuthorized;
}

void __49__SOSContactsManager_authorizedToUseContactStore__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
  authorizedToUseContactStore_contactStoreAuthorized = v0 == 3;
  if (v0 != 3) {
    NSLog(&cfstr_NotAuthorizedT.isa, v0);
  }
}

- (NSArray)medicalIDEmergencyContacts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(SOSContactsManager *)self _waitForMedicalIDInitialState];
  p_medicalIDEmergencyContactsMutex = &self->_medicalIDEmergencyContactsMutex;
  pthread_mutex_lock(&self->_medicalIDEmergencyContactsMutex);
  BOOL v4 = (void *)[(NSArray *)self->_medicalIDEmergencyContacts copy];
  pthread_mutex_unlock(p_medicalIDEmergencyContactsMutex);
  uint64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Get medicalIDEmergencyContacts: %@", (uint8_t *)&v7, 0xCu);
  }

  return (NSArray *)v4;
}

- (void)setMedicalIDEmergencyContacts:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  pthread_mutex_lock(&self->_medicalIDEmergencyContactsMutex);
  objc_storeStrong((id *)&self->_medicalIDEmergencyContacts, a3);
  pthread_mutex_unlock(&self->_medicalIDEmergencyContactsMutex);
  id v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "Set medicalIDEmergencyContacts: %@", (uint8_t *)&v8, 0xCu);
  }

  int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"SOSContactsChangedNotification" object:self];
}

- (void)_fetchMedicalIDEmergencyContacts
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__SOSContactsManager__fetchMedicalIDEmergencyContacts__block_invoke;
  v3[3] = &unk_1E60640C8;
  objc_copyWeak(&v4, &location);
  [(SOSContactsManager *)self _medicalIDEmergencyContactsWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__SOSContactsManager__fetchMedicalIDEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setMedicalIDEmergencyContacts:v3];

  id v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Received initial medical ID emergency contacts", v7, 2u);
  }

  id v6 = [WeakRetained medicalIDContactsInitialStateSemaphore];
  dispatch_semaphore_signal(v6);
}

- (void)_medicalIDEmergencyContactsWithCompletion:(id)a3
{
  id v4 = a3;
  healthStore = self->_healthStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SOSContactsManager__medicalIDEmergencyContactsWithCompletion___block_invoke;
  v7[3] = &unk_1E60640F0;
  id v8 = v4;
  id v6 = v4;
  [(HKHealthStore *)healthStore fetchMedicalIDEmergencyContactsWithCompletion:v7];
}

void __64__SOSContactsManager__medicalIDEmergencyContactsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = sos_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v5;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "emergencyContacts: %@ error: %@", buf, 0x16u);
  }

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v15 = objc_opt_new();
          __int16 v16 = [v14 name];
          [v15 setName:v16];

          id v17 = [v14 phoneNumber];
          [v15 setPhoneNumber:v17];

          __int16 v18 = [v14 nameContactIdentifier];
          [v15 setNameContactIdentifier:v18];

          int v19 = [v14 phoneNumberContactIdentifier];
          [v15 setPhoneNumberContactIdentifier:v19];

          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = v20;
  }
}

- (void)_waitForMedicalIDInitialState
{
}

- (void)_medicalContactsDidChange
{
  id v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "_medicalContactsDidChange", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SOSContactsManager__medicalContactsDidChange__block_invoke;
  v4[3] = &unk_1E60640C8;
  objc_copyWeak(&v5, buf);
  [(SOSContactsManager *)self _medicalIDEmergencyContactsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __47__SOSContactsManager__medicalContactsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setMedicalIDEmergencyContacts:v3];
}

- (NSArray)activeSafetyMonitorSessionPrimaryHandles
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(SOSContactsManager *)self _waitForSafetyMonitorInitialState];
  p_safetyMonitorSessionHandleMutex = &self->_safetyMonitorSessionHandleMutex;
  pthread_mutex_lock(&self->_safetyMonitorSessionHandleMutex);
  id v4 = (void *)[(NSArray *)self->_activeSafetyMonitorSessionPrimaryHandles copy];
  pthread_mutex_unlock(p_safetyMonitorSessionHandleMutex);
  id v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Get activeSafetyMonitorSessionPrimaryHandles: %@", (uint8_t *)&v7, 0xCu);
  }

  return (NSArray *)v4;
}

- (void)setActiveSafetyMonitorSessionPrimaryHandles:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  pthread_mutex_lock(&self->_safetyMonitorSessionHandleMutex);
  objc_storeStrong((id *)&self->_activeSafetyMonitorSessionPrimaryHandles, a3);
  pthread_mutex_unlock(&self->_safetyMonitorSessionHandleMutex);
  id v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "Set activeSafetyMonitorSessionPrimaryHandles: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_fetchSafetyMonitorSessionHandles
{
  objc_initWeak(&location, self);
  id v2 = [getSMSafetyMonitorManagerClass() defaultManager];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke;
    v6[3] = &unk_1E6064118;
    id v3 = &v7;
    objc_copyWeak(&v7, &location);
    [v2 fetchSOSReceiversWithCompletion:v6];
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke_340;
    v4[3] = &unk_1E6063FF0;
    id v3 = &v5;
    objc_copyWeak(&v5, &location);
    [v2 fetchCurrentSessionStateWithHandler:v4];
  }
  objc_destroyWeak(v3);

  objc_destroyWeak(&location);
}

void __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    uint64_t v9 = sos_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor fetchSOSReceiversWithCompletion, no self", (uint8_t *)&v16, 2u);
    }
    goto LABEL_7;
  }
  id v8 = sos_default_log();
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
LABEL_7:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor fetchSOSReceiversWithCompletion, updating with receivers: %@", (uint8_t *)&v16, 0xCu);
  }

  [WeakRetained _updateWithSafetyMonitorHandles:v5];
LABEL_11:
}

void __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke_340(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = sos_default_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v10)
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor fetchCurrentSessionStateWithHandler, updating", v11, 2u);
    }

    [WeakRetained _updateWithSafetyMonitorSessionState:v6 error:v7];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor fetchCurrentSessionStateWithHandler, no self", buf, 2u);
    }
  }
}

- (void)_updateWithSafetyMonitorSessionState:(id)a3 error:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = sos_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SOSContactsManager _updateWithSafetyMonitorSessionState:error:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_4:
    uint64_t v15 = 0;
    goto LABEL_5;
  }
  if (([v6 isActiveState] & 1) == 0)
  {
    id v8 = sos_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "_updateWithSafetyMonitorSessionState, Zelkova Session not in active state", buf, 2u);
    }
    goto LABEL_4;
  }
  int v16 = [v6 configuration];
  char v17 = objc_opt_respondsToSelector();

  uint64_t v18 = [v6 configuration];
  int v19 = v18;
  if (v17)
  {
    id v20 = [v18 sosReceivers];
    uint64_t v15 = [v20 receiverHandles];

    id v8 = sos_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v33 = v15;
      _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "_updateWithSafetyMonitorSessionState, sosReceivers: %@", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [v18 handle];

    long long v21 = [v8 primaryHandle];
    uint64_t v22 = [v21 length];

    if (v22)
    {
      v31 = v8;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      long long v23 = sos_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v33 = v8;
        _os_log_impl(&dword_1B3A94000, v23, OS_LOG_TYPE_DEFAULT, "_updateWithSafetyMonitorSessionState, Active state with handle: %@", buf, 0xCu);
      }
    }
    else
    {
      long long v23 = sos_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[SOSContactsManager _updateWithSafetyMonitorSessionState:error:](v23, v24, v25, v26, v27, v28, v29, v30);
      }
      uint64_t v15 = 0;
    }
  }
LABEL_5:

  [(SOSContactsManager *)self _updateWithSafetyMonitorHandles:v15];
}

- (void)_updateWithSafetyMonitorHandles:(id)a3
{
  uint64_t v15 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v9), "primaryHandle", v15);
        uint64_t v11 = [v10 length];
        uint64_t v12 = sos_default_log();
        uint64_t v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v23 = v10;
            _os_log_impl(&dword_1B3A94000, v13, OS_LOG_TYPE_DEFAULT, "_updateWithSafetyMonitorHandles, adding handle: %@", buf, 0xCu);
          }

          [v4 addObject:v10];
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            [(SOSContactsManager *)&v16 _updateWithSafetyMonitorHandles:v13];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  [(SOSContactsManager *)v15 setActiveSafetyMonitorSessionPrimaryHandles:v4];
  uint64_t v14 = [(SOSContactsManager *)v15 safetyMonitorSessionInitialStateSemaphore];
  dispatch_semaphore_signal(v14);
}

- (void)_waitForSafetyMonitorInitialState
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (OS_dispatch_semaphore)medicalIDContactsInitialStateSemaphore
{
  return self->_medicalIDContactsInitialStateSemaphore;
}

- (void)setMedicalIDContactsInitialStateSemaphore:(id)a3
{
}

- (_opaque_pthread_mutex_t)medicalIDEmergencyContactsMutex
{
  long long v3 = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[1].__opaque[40];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[24];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setMedicalIDEmergencyContactsMutex:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_medicalIDEmergencyContactsMutex.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_medicalIDEmergencyContactsMutex.__opaque[40] = v5;
  *(_OWORD *)&self->_medicalIDEmergencyContactsMutex.__sig = v3;
  *(_OWORD *)&self->_medicalIDEmergencyContactsMutex.__opaque[8] = v4;
}

- (OS_dispatch_semaphore)safetyMonitorSessionInitialStateSemaphore
{
  return self->_safetyMonitorSessionInitialStateSemaphore;
}

- (void)setSafetyMonitorSessionInitialStateSemaphore:(id)a3
{
}

- (_opaque_pthread_mutex_t)safetyMonitorSessionHandleMutex
{
  long long v3 = *(_OWORD *)&self[2].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[2].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[2].__opaque[40];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[2].__opaque[24];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setSafetyMonitorSessionHandleMutex:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_safetyMonitorSessionHandleMutex.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_safetyMonitorSessionHandleMutex.__opaque[40] = v5;
  *(_OWORD *)&self->_safetyMonitorSessionHandleMutex.__sig = v3;
  *(_OWORD *)&self->_safetyMonitorSessionHandleMutex.__opaque[8] = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyMonitorSessionInitialStateSemaphore, 0);
  objc_storeStrong((id *)&self->_medicalIDContactsInitialStateSemaphore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_activeSafetyMonitorSessionPrimaryHandles, 0);
  objc_storeStrong((id *)&self->_medicalIDEmergencyContacts, 0);

  objc_storeStrong((id *)&self->_legacyContactsManager, 0);
}

- (void)initWithHealthStore:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "_safetyMonitorSessionHandleMutex pthread_mutex_init failure: %d", (uint8_t *)v2, 8u);
}

- (void)initWithHealthStore:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "_medicalIDEmergencyContactsMutex pthread_mutex_init failure: %d", (uint8_t *)v2, 8u);
}

void __29__SOSContactsManager_dealloc__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_isEmergencyNumber:(os_log_t)log .cold.1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "Received error from _CTServerConnectionIsEmergencyNumber(): domain: %d, error: %d", (uint8_t *)v3, 0xEu);
}

void __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateWithSafetyMonitorSessionState:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateWithSafetyMonitorSessionState:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateWithSafetyMonitorHandles:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "_updateWithSafetyMonitorHandles, empty handle", buf, 2u);
}

@end