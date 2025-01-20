@interface RTTSettings
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)BOOLValueForKey:(id)a3 andContext:(id)a4 withDefaultValue:(BOOL)a5;
- (BOOL)BOOLValueForKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)TTYHardwareEnabled;
- (BOOL)TTYHardwareEnabledForContext:(id)a3;
- (BOOL)TTYSoftwareEnabled;
- (BOOL)TTYSoftwareEnabledForContext:(id)a3;
- (BOOL)answerRTTCallsAsMuted;
- (BOOL)answerRTTCallsAsMutedForContext:(id)a3;
- (BOOL)continuityRTTIsSupported;
- (BOOL)hasReceivedRTTCall;
- (BOOL)incomingCallsTTY;
- (BOOL)incomingCallsTTYForContext:(id)a3;
- (BOOL)internalOverrideTTYAvailability;
- (BOOL)isRelayCallingEnabled;
- (BOOL)rttCallHoldEnabled;
- (BOOL)rttInlineAbbreviationBarEnabled;
- (BOOL)rttLiveTranscriptionsEnabled;
- (BOOL)rttLiveTranscriptionsEnabledForContext:(id)a3;
- (BOOL)rttLiveTranscriptionsFeatureFlagEnabled;
- (BOOL)shouldMigrateSettings;
- (BOOL)showsRTTNotifications;
- (BOOL)showsRTTNotificationsForContext:(id)a3;
- (BOOL)supportsRelayCalling;
- (BOOL)ttyShouldBeRealtime;
- (BOOL)ttyShouldBeRealtimeForContext:(id)a3;
- (NSArray)cannedResponses;
- (NSMutableDictionary)updateBlocks;
- (NSMutableSet)registeredNotifications;
- (NSMutableSet)synchronizePreferences;
- (NSString)preferredRelayNumber;
- (OS_dispatch_queue)nanoSynchronizeQueue;
- (RTTSettings)init;
- (SEL)selectorForPreferenceKey:(id)a3;
- (double)lastCallCountReset;
- (double)lastDBVacuum;
- (id)_notificationForPreferenceKey:(id)a3;
- (id)_preferenceKeyForSelector:(SEL)a3;
- (id)_selectorMap;
- (id)currentLocale;
- (id)notificationForSelector:(SEL)a3;
- (id)objectValueForKey:(id)a3 andContext:(id)a4 withClass:(Class)a5 andDefaultValue:(id)a6;
- (id)objectValueForKey:(id)a3 withClass:(Class)a4 andDefaultValue:(id)a5;
- (id)preferredRelayNumberForContext:(id)a3;
- (id)uuidFromContext:(id)a3;
- (id)valueForPreferenceKey:(id)a3;
- (id)valueForPreferenceKey:(id)a3 andContext:(id)a4;
- (int64_t)incomingTTYCallCount;
- (int64_t)integerValueForKey:(id)a3 withDefaultValue:(int64_t)a4;
- (int64_t)outgoingTTYCallCount;
- (int64_t)settingsVersion;
- (void)_handlePreferenceChanged:(id)a3;
- (void)_registerForNotification:(id)a3;
- (void)_setValue:(id)a3 forPreferenceKey:(id)a4;
- (void)_setValue:(id)a3 forPreferenceKey:(id)a4 andContext:(id)a5;
- (void)_synchronizeIfNecessary:(id)a3;
- (void)clearAllServerSettingsCache;
- (void)clearServerSettingsCacheForKey:(id)a3;
- (void)dealloc;
- (void)migrateSettings;
- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5;
- (void)resetCannedResponses;
- (void)setAnswerRTTCallsAsMuted:(BOOL)a3;
- (void)setAnswerRTTCallsAsMuted:(BOOL)a3 forContext:(id)a4;
- (void)setCannedResponses:(id)a3;
- (void)setContinuityRTTIsSupported:(BOOL)a3;
- (void)setHasReceivedRTTCall:(BOOL)a3;
- (void)setIncomingCallsTTY:(BOOL)a3;
- (void)setIncomingCallsTTY:(BOOL)a3 forContext:(id)a4;
- (void)setIncomingTTYCallCount:(int64_t)a3;
- (void)setInternalOverrideTTYAvailability:(BOOL)a3;
- (void)setIsRelayCallingEnabled:(BOOL)a3;
- (void)setLastCallCountReset:(double)a3;
- (void)setLastDBVacuum:(double)a3;
- (void)setNanoSynchronizeQueue:(id)a3;
- (void)setOutgoingTTYCallCount:(int64_t)a3;
- (void)setPreferredRelayNumber:(id)a3;
- (void)setPreferredRelayNumber:(id)a3 forContext:(id)a4;
- (void)setRTTLiveTranscriptionsEnabled:(BOOL)a3 forContext:(id)a4;
- (void)setRegisteredNotifications:(id)a3;
- (void)setRttInlineAbbreviationBarEnabled:(BOOL)a3;
- (void)setSettingsVersion:(int64_t)a3;
- (void)setShowsRTTNotifications:(BOOL)a3 forContext:(id)a4;
- (void)setSupportsRelayCalling:(BOOL)a3;
- (void)setSynchronizePreferences:(id)a3;
- (void)setTTYHardwareEnabled:(BOOL)a3;
- (void)setTTYHardwareEnabled:(BOOL)a3 forContext:(id)a4;
- (void)setTTYShouldBeRealtime:(BOOL)a3 forContext:(id)a4;
- (void)setTTYSoftwareEnabled:(BOOL)a3;
- (void)setTTYSoftwareEnabled:(BOOL)a3 forContext:(id)a4;
- (void)setTtyShouldBeRealtime:(BOOL)a3;
- (void)setUpdateBlocks:(id)a3;
- (void)updateGizmoValueIfNeeded:(id)a3 forPreferenceKey:(id)a4;
@end

@implementation RTTSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_70);
  }
  v2 = (void *)sharedInstance_Settings;

  return v2;
}

- (BOOL)TTYSoftwareEnabled
{
  v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v4 = [v3 defaultVoiceContext];
  LOBYTE(self) = [(RTTSettings *)self TTYSoftwareEnabledForContext:v4];

  return (char)self;
}

- (BOOL)TTYSoftwareEnabledForContext:(id)a3
{
  return [(RTTSettings *)self BOOLValueForKey:kAXSTTYSoftwareEnabledPreference andContext:a3 withDefaultValue:0];
}

- (BOOL)TTYHardwareEnabled
{
  v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v4 = [v3 defaultVoiceContext];
  LOBYTE(self) = [(RTTSettings *)self TTYHardwareEnabledForContext:v4];

  return (char)self;
}

- (BOOL)TTYHardwareEnabledForContext:(id)a3
{
  return [(RTTSettings *)self BOOLValueForKey:kAXSTTYHardwareEnabledPreference andContext:a3 withDefaultValue:0];
}

void __40__RTTSettings__registerForNotification___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) registeredNotifications];
  v3 = (uint64_t *)(a1 + 40);
  if (([v2 containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [v2 addObject:*(void *)(a1 + 40)];
    v4 = [*(id *)(a1 + 32) _notificationForPreferenceKey:*(void *)(a1 + 40)];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = AXLogRTT();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __40__RTTSettings__registerForNotification___block_invoke_2_cold_1(v3, v7);
    }
  }
}

- (NSMutableSet)registeredNotifications
{
  return self->_registeredNotifications;
}

- (BOOL)BOOLValueForKey:(id)a3 andContext:(id)a4 withDefaultValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = AXLogRTT();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:]();
  }

  uint64_t v11 = objc_opt_class();
  v12 = [NSNumber numberWithBool:v5];
  v13 = [(RTTSettings *)self objectValueForKey:v8 andContext:v9 withClass:v11 andDefaultValue:v12];

  v14 = AXLogRTT();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:]();
  }

  char v15 = [v13 BOOLValue];
  return v15;
}

- (id)objectValueForKey:(id)a3 andContext:(id)a4 withClass:(Class)a5 andDefaultValue:(id)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(RTTSettings *)self uuidFromContext:v11];
  v14 = [(RTTSettings *)self valueForPreferenceKey:v10 andContext:v13];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v15 = v12;
    if ([v13 length])
    {
      v41 = [v14 objectForKey:v13];
      char isKindOfClass = objc_opt_isKindOfClass();
      v17 = AXLogRTT();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (isKindOfClass)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412546;
          id v49 = v10;
          __int16 v50 = 2112;
          v51 = v41;
          _os_log_impl(&dword_21FEA9000, v17, OS_LOG_TYPE_INFO, "Returning setting: [%@] = '%@'", buf, 0x16u);
        }

        v19 = v41;
        char v15 = v19;
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138413314;
          id v49 = v10;
          __int16 v50 = 2112;
          v51 = v41;
          __int16 v52 = 2112;
          *(void *)v53 = a5;
          *(_WORD *)&v53[8] = 2112;
          Class v54 = (Class)v14;
          __int16 v55 = 2112;
          v56 = v13;
          _os_log_impl(&dword_21FEA9000, v17, OS_LOG_TYPE_INFO, "Slot value is wrong kind: [%@] %@ > %@ (%@ -> %@)", buf, 0x34u);
        }

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id obj = v14;
        uint64_t v23 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          id v39 = v11;
          Class v40 = a5;
          id v38 = v12;
          uint64_t v25 = *(void *)v44;
          while (2)
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v44 != v25) {
                objc_enumerationMutation(obj);
              }
              v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              v28 = AXLogRTT();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                int v29 = [v13 isEqualToString:@"RTTWildcardContext"];
                int v30 = [v27 hasPrefix:@"00000000-"];
                *(_DWORD *)buf = 138413058;
                id v49 = v27;
                __int16 v50 = 2112;
                v51 = v13;
                __int16 v52 = 1024;
                *(_DWORD *)v53 = v29;
                *(_WORD *)&v53[4] = 1024;
                *(_DWORD *)&v53[6] = v30;
                _os_log_impl(&dword_21FEA9000, v28, OS_LOG_TYPE_INFO, "check: %@ %@ %d %d", buf, 0x22u);
              }

              v31 = [v27 commonPrefixWithString:v13 options:1];
              if ((unint64_t)[v31 length] > 5)
              {

LABEL_32:
                v33 = [obj objectForKey:v27];

                v34 = AXLogRTT();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  v35 = objc_opt_class();
                  *(_DWORD *)buf = 138413058;
                  id v49 = v27;
                  __int16 v50 = 2112;
                  v51 = v15;
                  __int16 v52 = 2112;
                  *(void *)v53 = v35;
                  *(_WORD *)&v53[8] = 2112;
                  Class v54 = v40;
                  id v36 = v35;
                  _os_log_impl(&dword_21FEA9000, v34, OS_LOG_TYPE_INFO, "Found another id with value: [%@], contextUUID mismatch: [%@] [cls: %@, expected: %@]", buf, 0x2Au);
                }
                id v12 = v38;
                id v11 = v39;
                if (objc_opt_isKindOfClass())
                {
                  v19 = v33;

                  char v15 = v19;
                }
                else
                {
                  v19 = v33;
                }
                goto LABEL_37;
              }
              if ([v13 isEqualToString:@"RTTWildcardContext"])
              {
                char v32 = [v27 hasPrefix:@"00000000-"];

                if (v32) {
                  goto LABEL_32;
                }
              }
              else
              {
              }
            }
            uint64_t v24 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
            if (v24) {
              continue;
            }
            break;
          }
          id v12 = v38;
          id v11 = v39;
        }
        v19 = v41;
LABEL_37:
      }
    }
    else
    {
      v19 = AXLogRTT();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v11;
        _os_log_impl(&dword_21FEA9000, v19, OS_LOG_TYPE_INFO, "Not retrieving setting. Context is wrong: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v20 = AXLogRTT();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412802;
      id v49 = v10;
      __int16 v50 = 2112;
      v51 = v22;
      __int16 v52 = 2112;
      *(void *)v53 = v14;
      _os_log_impl(&dword_21FEA9000, v20, OS_LOG_TYPE_INFO, "Preference group wrong: [%@] = |%@| '%@'", buf, 0x20u);
    }
    char v15 = v12;
  }

  return v15;
}

- (id)valueForPreferenceKey:(id)a3 andContext:(id)a4
{
  v26[2] = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  [(RTTSettings *)self _synchronizeIfNecessary:v6];
  [(RTTSettings *)self _registerForNotification:v6];
  [(NSLock *)self->_synchronizeDomainsLock lock];
  id v8 = [(NSMutableDictionary *)self->_cachedSettings objectForKeyedSubscript:v6];
  [(NSLock *)self->_synchronizeDomainsLock unlock];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(__CFString *)v8 objectForKey:v7];

      if (v9)
      {
        id v10 = AXLogRTT();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v21 = 138412546;
          v22 = v8;
          __int16 v23 = 2112;
          uint64_t v24 = v6;
          _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Returning cached version: %@: %@", (uint8_t *)&v21, 0x16u);
        }

        id v11 = v8;
        goto LABEL_21;
      }
    }
    id v12 = AXLogRTT();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412802;
      v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      __int16 v25 = 2112;
      v26[0] = v6;
      _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "Cached setting missing right context: %@ > [%@]%@", (uint8_t *)&v21, 0x20u);
    }
  }
  int pw_uid = valueForPreferenceKey_andContext__mobileUID;
  if (valueForPreferenceKey_andContext__mobileUID == -1)
  {
    v14 = getpwnam("mobile");
    if (v14)
    {
      int pw_uid = v14->pw_uid;
      valueForPreferenceKey_andContext__mobileUID = pw_uid;
    }
    else
    {
      int pw_uid = valueForPreferenceKey_andContext__mobileUID;
    }
  }
  if (pw_uid == geteuid())
  {
    char v15 = (__CFString *)CFPreferencesCopyValue(v6, (CFStringRef)*MEMORY[0x263F8B3A0], @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
    if (v15) {
      id v11 = v15;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    v16 = +[RTTServer sharedInstance];
    id v11 = [v16 valueForTTYSetting:v6];

    v17 = AXLogRTT();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = valueForPreferenceKey_andContext__mobileUID;
      uid_t v19 = geteuid();
      int v21 = 138413058;
      v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 1024;
      LODWORD(v26[0]) = v18;
      WORD2(v26[0]) = 1024;
      *(_DWORD *)((char *)v26 + 6) = v19;
      _os_log_impl(&dword_21FEA9000, v17, OS_LOG_TYPE_INFO, "Not mobile: asked heard for setting: %@: Result: [%@] {mobile UID %d, my UID %d}", (uint8_t *)&v21, 0x22u);
    }
  }
LABEL_21:

  return v11;
}

- (id)uuidFromContext:(id)a3
{
  id v3 = a3;
  if (([MEMORY[0x263F472B0] deviceIsPad] & 1) != 0
    || ([MEMORY[0x263F472B0] deviceIsPod] & 1) != 0)
  {
    v4 = @"RTTWildcardContext";
  }
  else
  {
    BOOL v5 = [v3 uuid];
    v4 = [v5 UUIDString];
  }

  return v4;
}

- (void)_synchronizeIfNecessary:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_synchronizeDomainsLock lock];
  v4 = [(RTTSettings *)self synchronizePreferences];
  if ([v4 containsObject:v5])
  {
    CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263F8B3A0]);
    [v4 removeObject:v5];
  }
  [(NSLock *)self->_synchronizeDomainsLock unlock];
}

- (NSMutableSet)synchronizePreferences
{
  return self->_synchronizePreferences;
}

- (void)_registerForNotification:(id)a3
{
  id v4 = a3;
  if (_registerForNotification__onceToken != -1) {
    dispatch_once(&_registerForNotification__onceToken, &__block_literal_global_130);
  }
  id v5 = _registerForNotification__RegistrationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__RTTSettings__registerForNotification___block_invoke_2;
  v7[3] = &unk_2645400C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (void)initialize
{
  id v2 = +[RTTSettings sharedInstance];
  if (([MEMORY[0x263F472B0] currentProcessIsHeard] & 1) != 0
    || [MEMORY[0x263F472B0] currentProcessIsPreferences])
  {
    [&unk_26D1B3C70 enumerateObjectsUsingBlock:&__block_literal_global_6];
  }
}

void __25__RTTSettings_initialize__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = +[RTTSettings sharedInstance];
  id v3 = +[RTTSettings sharedInstance];
  id v4 = [v3 valueForPreferenceKey:v2];
  [v5 updateGizmoValueIfNeeded:v4 forPreferenceKey:v2];
}

uint64_t __29__RTTSettings_sharedInstance__block_invoke()
{
  sharedInstance_Settings = objc_alloc_init(RTTSettings);

  return MEMORY[0x270F9A758]();
}

- (RTTSettings)init
{
  v16.receiver = self;
  v16.super_class = (Class)RTTSettings;
  id v2 = [(RTTSettings *)&v16 init];
  if (v2)
  {
    id v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    synchronizeDomainsLock = v2->_synchronizeDomainsLock;
    v2->_synchronizeDomainsLock = v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    registeredNotifications = v2->_registeredNotifications;
    v2->_registeredNotifications = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    synchronizePreferences = v2->_synchronizePreferences;
    v2->_synchronizePreferences = v7;

    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    updateBlocks = v2->_updateBlocks;
    v2->_updateBlocks = v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedSettings = v2->_cachedSettings;
    v2->_cachedSettings = v11;

    dispatch_queue_t v13 = dispatch_queue_create("rtt-nano-sync-queue", 0);
    [(RTTSettings *)v2 setNanoSynchronizeQueue:v13];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)AccessibilitySettingsChangedOnCompanion, @"NanoRTTDefaultsChanged", 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (id)currentLocale
{
  id v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = [v2 languageCode];

  return v3;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RTTSettings;
  [(RTTSettings *)&v4 dealloc];
}

- (BOOL)shouldMigrateSettings
{
  return [(RTTSettings *)self settingsVersion] < 2;
}

- (void)migrateSettings
{
  if ([(RTTSettings *)self settingsVersion] <= 1)
  {
    id v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
    objc_super v4 = [v3 defaultVoiceContext];

    id v5 = [(RTTSettings *)self objectValueForKey:kAXSTTYPreferredRelayNumberPreference withClass:objc_opt_class() andDefaultValue:&stru_26D1B01C8];
    if ([v5 length]) {
      [(RTTSettings *)self setPreferredRelayNumber:v5 forContext:v4];
    }
    [(RTTSettings *)self setTTYHardwareEnabled:[(RTTSettings *)self BOOLValueForKey:kAXSTTYHardwareEnabledPreference withDefaultValue:0] forContext:v4];
    [(RTTSettings *)self setTTYSoftwareEnabled:[(RTTSettings *)self BOOLValueForKey:kAXSTTYSoftwareEnabledPreference withDefaultValue:0] forContext:v4];
    [(RTTSettings *)self setIncomingCallsTTY:[(RTTSettings *)self BOOLValueForKey:kAXSTTYIncomingCallsTTYPreference withDefaultValue:0] forContext:v4];
    [(RTTSettings *)self setTTYShouldBeRealtime:[(RTTSettings *)self BOOLValueForKey:kAXSTTYShouldBeRealtimePreference withDefaultValue:1] forContext:v4];
    [(RTTSettings *)self setSettingsVersion:2];
  }
  id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v7 = [v6 BOOLForKey:@"RTT_RequestedNotificationAuthorizationKey_14.0"];

  if ((v7 & 1) == 0)
  {
    if ([(RTTSettings *)self TTYHardwareEnabled]
      || [(RTTSettings *)self TTYSoftwareEnabled])
    {
      RTTRequestNotificationAuthorization();
    }
    id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v8 setBool:1 forKey:@"RTT_RequestedNotificationAuthorizationKey_14.0"];

    id v9 = AXLogRTT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_DEFAULT, "Performing RTT notification request", v10, 2u);
    }
  }
}

- (void)_handlePreferenceChanged:(id)a3
{
  id v8 = [a3 stringByReplacingOccurrencesOfString:@"_AXNotification_" withString:&stru_26D1B01C8];
  [(NSLock *)self->_synchronizeDomainsLock lock];
  [(NSMutableDictionary *)self->_cachedSettings setObject:0 forKeyedSubscript:v8];
  objc_super v4 = [(RTTSettings *)self synchronizePreferences];
  [v4 addObject:v8];

  id v5 = [(RTTSettings *)self updateBlocks];
  id v6 = [v5 objectForKey:v8];
  char v7 = (void *)[v6 copy];

  [(NSLock *)self->_synchronizeDomainsLock unlock];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_92];
}

void __40__RTTSettings__handlePreferenceChanged___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectAtIndexedSubscript:1];
  if (v2)
  {
    id v3 = v2;
    v2[2]();
    id v2 = v3;
  }
}

- (id)_notificationForPreferenceKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"_AXNotification_", a3];
}

- (id)_selectorMap
{
  if (_selectorMap_onceToken != -1) {
    dispatch_once(&_selectorMap_onceToken, &__block_literal_global_97);
  }
  id v2 = (void *)_selectorMap_SelectorMap;

  return v2;
}

void __27__RTTSettings__selectorMap__block_invoke()
{
  id v0 = objc_alloc(NSDictionary);
  __int16 v25 = kAXSTTYHardwareEnabledPreference;
  id v26 = v0;
  v27 = NSStringFromSelector(sel_TTYHardwareEnabled);
  uint64_t v24 = kAXSTTYSoftwareEnabledPreference;
  uint64_t v1 = NSStringFromSelector(sel_TTYSoftwareEnabled);
  v22 = kAXSTTYIncomingCallsTTYPreference;
  __int16 v23 = (void *)v1;
  uint64_t v2 = NSStringFromSelector(sel_incomingCallsTTY);
  v20 = kAXSTTYPreferredRelayNumberPreference;
  int v21 = (void *)v2;
  uint64_t v3 = NSStringFromSelector(sel_preferredRelayNumber);
  int v18 = kAXSTTYShouldBeRealtimePreference;
  uid_t v19 = (void *)v3;
  char v15 = NSStringFromSelector(sel_ttyShouldBeRealtime);
  v17 = kAXSRTTAnswerAllRTTCallsAsMutedPreference;
  objc_super v4 = NSStringFromSelector(sel_answerRTTCallsAsMuted);
  objc_super v16 = kAXSRTTShowsNotificationsPreference;
  id v5 = NSStringFromSelector(sel_showsRTTNotifications);
  id v6 = NSStringFromSelector(sel_hasReceivedRTTCall);
  v14 = NSStringFromSelector(sel_internalOverrideTTYAvailability);
  char v7 = kAXSRTTSettingsVersionPreference;
  id v8 = NSStringFromSelector(sel_settingsVersion);
  id v9 = NSStringFromSelector(sel_continuityRTTIsSupported);
  id v10 = NSStringFromSelector(sel_cannedResponses);
  id v11 = NSStringFromSelector(sel_rttLiveTranscriptionsEnabled);
  uint64_t v12 = objc_msgSend(v26, "initWithObjectsAndKeys:", v25, v27, v24, v23, v22, v21, v20, v19, v18, v15, v17, v4, v16, v5, @"TTYReceivedRTTCallPreference", v6, @"InternalOverrideTTYAvailabilityPreference",
          v14,
          v7,
          v8,
          @"RTTContinuityRTTIsSupportedPreference",
          v9,
          @"TTYCannedResponsesPreference",
          v10,
          @"RTTLiveTranscriptionEnabledPreference",
          v11,
          0);
  dispatch_queue_t v13 = (void *)_selectorMap_SelectorMap;
  _selectorMap_SelectorMap = v12;
}

- (id)_preferenceKeyForSelector:(SEL)a3
{
  objc_super v4 = [(RTTSettings *)self _selectorMap];
  id v5 = NSStringFromSelector(a3);
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    char v7 = v6;
  }
  else {
    char v7 = @"UnknownKey";
  }
  id v8 = v7;

  return v8;
}

- (SEL)selectorForPreferenceKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  dispatch_queue_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(RTTSettings *)self _selectorMap];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__RTTSettings_selectorForPreferenceKey___block_invoke;
  v9[3] = &unk_264540A10;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  char v7 = (const char *)v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __40__RTTSettings_selectorForPreferenceKey___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  aSelectorName = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = NSSelectorFromString(aSelectorName);
    *a4 = 1;
  }
}

uint64_t __40__RTTSettings__registerForNotification___block_invoke()
{
  _registerForNotification__RegistrationQueue = (uint64_t)dispatch_queue_create("RTTSettings", 0);

  return MEMORY[0x270F9A758]();
}

- (id)notificationForSelector:(SEL)a3
{
  id v4 = [(RTTSettings *)self _preferenceKeyForSelector:a3];
  id v5 = [(RTTSettings *)self _notificationForPreferenceKey:v4];

  return v5;
}

- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5
{
  v24[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [NSNumber numberWithUnsignedLongLong:v9];
  [(NSLock *)self->_synchronizeDomainsLock lock];
  id v11 = [(RTTSettings *)self updateBlocks];
  uint64_t v12 = (void *)[v11 copy];

  [(NSLock *)self->_synchronizeDomainsLock unlock];
  dispatch_queue_t v13 = [(RTTSettings *)self _preferenceKeyForSelector:a4];
  uint64_t v14 = [v12 objectForKey:v13];
  if (v8)
  {
    uint64_t v15 = (void *)MEMORY[0x223C608D0](v8);
    int v21 = v10;
    v24[0] = v10;
    objc_super v16 = (void *)MEMORY[0x223C608D0]();
    v24[1] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];

    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x263EFF980] array];
    }
    [v14 addObject:v17];
    objc_getAssociatedObject(v9, &AXRTTSettingsDestructionHelperKey);
    int v18 = (AXRTTSettingsListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      int v18 = [[AXRTTSettingsListenerHelper alloc] initWithListenerAddress:v9];
      objc_setAssociatedObject(v9, &AXRTTSettingsDestructionHelperKey, v18, (void *)1);
    }
    [(AXRTTSettingsListenerHelper *)v18 addSelectorKey:a4];
    [(RTTSettings *)self _registerForNotification:v13];

    id v10 = v21;
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __68__RTTSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke;
    v22[3] = &unk_264540A38;
    id v23 = v10;
    uid_t v19 = [v14 indexesOfObjectsPassingTest:v22];
    if ([v19 count]) {
      [v14 removeObjectsAtIndexes:v19];
    }

    uint64_t v15 = v23;
  }

  [(NSLock *)self->_synchronizeDomainsLock lock];
  v20 = [(RTTSettings *)self updateBlocks];
  [v20 setObject:v14 forKey:v13];

  [(NSLock *)self->_synchronizeDomainsLock unlock];
}

uint64_t __68__RTTSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)updateGizmoValueIfNeeded:(id)a3 forPreferenceKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTTSettings *)self nanoSynchronizeQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__RTTSettings_updateGizmoValueIfNeeded_forPreferenceKey___block_invoke;
  v11[3] = &unk_2645400C0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __57__RTTSettings_updateGizmoValueIfNeeded_forPreferenceKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[RTTNanoSettings sharedInstance];
  id v3 = [v2 valueForPreferenceKey:@"TTYNanoIndependencePreference"];

  if (!v3)
  {
    id v4 = +[RTTNanoSettings sharedInstance];
    [v4 _setValue:*(void *)(a1 + 32) forPreferenceKey:*(void *)(a1 + 40)];
  }
}

- (void)_setValue:(id)a3 forPreferenceKey:(id)a4 andContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTTSettings *)self uuidFromContext:v10];
  id v12 = AXLogRTT();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412802;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "Setting %@=%@ for context: %@", (uint8_t *)&v16, 0x20u);
  }

  if ([v11 length])
  {
    id v13 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v14 = [(RTTSettings *)self objectValueForKey:v9 withClass:objc_opt_class() andDefaultValue:MEMORY[0x263EFFA78]];
    uint64_t v15 = [v13 dictionaryWithDictionary:v14];

    [v15 setObject:v8 forKey:v11];
    [(RTTSettings *)self _setValue:v15 forPreferenceKey:v9];
  }
  else
  {
    uint64_t v15 = AXLogRTT();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_21FEA9000, v15, OS_LOG_TYPE_INFO, "Not setting value for %@ and context %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)_setValue:(id)a3 forPreferenceKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = (CFStringRef *)MEMORY[0x263F8B3A0];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263F8B3A0];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE68];
  id v9 = (__CFString *)a4;
  id v10 = a3;
  CFPreferencesSetValue(v9, v10, v7, @"mobile", v8);
  [(RTTSettings *)self updateGizmoValueIfNeeded:v10 forPreferenceKey:v9];
  [(NSLock *)self->_synchronizeDomainsLock lock];
  [(NSMutableDictionary *)self->_cachedSettings setObject:v10 forKeyedSubscript:v9];

  [(NSLock *)self->_synchronizeDomainsLock unlock];
  CFPreferencesAppSynchronize(*v6);
  id v11 = [(RTTSettings *)self _notificationForPreferenceKey:v9];

  if (v11)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v11, 0, 0, 1u);
    id v13 = AXLogRTT();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      uint64_t v15 = v11;
      _os_log_impl(&dword_21FEA9000, v13, OS_LOG_TYPE_INFO, "Posting RTT setting notification for: %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (int64_t)integerValueForKey:(id)a3 withDefaultValue:(int64_t)a4
{
  uint64_t v5 = [(RTTSettings *)self valueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (BOOL)BOOLValueForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  uint64_t v5 = [(RTTSettings *)self valueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)objectValueForKey:(id)a3 withClass:(Class)a4 andDefaultValue:(id)a5
{
  id v7 = a5;
  CFStringRef v8 = [(RTTSettings *)self valueForPreferenceKey:a3];
  if (!v8 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = v7;

    CFStringRef v8 = v9;
  }

  return v8;
}

- (id)valueForPreferenceKey:(id)a3
{
  return [(RTTSettings *)self valueForPreferenceKey:a3 andContext:0];
}

- (void)clearAllServerSettingsCache
{
  id v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Clearing server settings cache", v4, 2u);
  }

  [(NSLock *)self->_synchronizeDomainsLock lock];
  [(NSMutableDictionary *)self->_cachedSettings removeAllObjects];
  [(NSLock *)self->_synchronizeDomainsLock unlock];
}

- (void)clearServerSettingsCacheForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Clearing server settings cache for: %@", (uint8_t *)&v8, 0xCu);
  }

  [(NSLock *)self->_synchronizeDomainsLock lock];
  [(NSMutableDictionary *)self->_cachedSettings setObject:0 forKeyedSubscript:v4];
  [(NSLock *)self->_synchronizeDomainsLock unlock];
  id v6 = [(RTTSettings *)self _notificationForPreferenceKey:v4];
  if (v6)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, v6, 0, 0, 1u);
  }
}

- (void)setTTYHardwareEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
  uint64_t v5 = [v6 defaultVoiceContext];
  [(RTTSettings *)self setTTYHardwareEnabled:v3 forContext:v5];
}

- (void)setTTYSoftwareEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
  uint64_t v5 = [v6 defaultVoiceContext];
  [(RTTSettings *)self setTTYSoftwareEnabled:v3 forContext:v5];
}

- (BOOL)incomingCallsTTY
{
  BOOL v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  id v4 = [v3 defaultVoiceContext];
  LOBYTE(self) = [(RTTSettings *)self incomingCallsTTYForContext:v4];

  return (char)self;
}

- (void)setIncomingCallsTTY:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
  uint64_t v5 = [v6 defaultVoiceContext];
  [(RTTSettings *)self setIncomingCallsTTY:v3 forContext:v5];
}

- (int64_t)incomingTTYCallCount
{
  return [(RTTSettings *)self integerValueForKey:@"incomingTTYCallCount" withDefaultValue:0];
}

- (void)setIncomingTTYCallCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"incomingTTYCallCount"];
}

- (int64_t)outgoingTTYCallCount
{
  return [(RTTSettings *)self integerValueForKey:@"outgoingTTYCallCount" withDefaultValue:0];
}

- (void)setOutgoingTTYCallCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"outgoingTTYCallCount"];
}

- (int64_t)settingsVersion
{
  if (CachedVersion == 2) {
    return 2;
  }
  int64_t result = [(RTTSettings *)self integerValueForKey:kAXSRTTSettingsVersionPreference withDefaultValue:0];
  CachedVersion = result;
  return result;
}

- (void)setSettingsVersion:(int64_t)a3
{
  CachedVersion = -1;
  id v4 = [NSNumber numberWithInteger:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:kAXSRTTSettingsVersionPreference];
}

- (double)lastCallCountReset
{
  return (double)[(RTTSettings *)self integerValueForKey:@"lastCallCountReset" withDefaultValue:0];
}

- (void)setLastCallCountReset:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"lastCallCountReset"];
}

- (double)lastDBVacuum
{
  return (double)[(RTTSettings *)self integerValueForKey:@"TTYLastDBVacuumPreference" withDefaultValue:0];
}

- (void)setLastDBVacuum:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"TTYLastDBVacuumPreference"];
}

- (BOOL)ttyShouldBeRealtime
{
  BOOL v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  id v4 = [v3 defaultVoiceContext];
  LOBYTE(self) = [(RTTSettings *)self ttyShouldBeRealtimeForContext:v4];

  return (char)self;
}

- (void)setTtyShouldBeRealtime:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
  uint64_t v5 = [v6 defaultVoiceContext];
  [(RTTSettings *)self setTTYShouldBeRealtime:v3 forContext:v5];
}

- (NSString)preferredRelayNumber
{
  BOOL v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  id v4 = [v3 defaultVoiceContext];
  uint64_t v5 = [(RTTSettings *)self preferredRelayNumberForContext:v4];

  return (NSString *)v5;
}

- (void)setPreferredRelayNumber:(id)a3
{
  id v4 = a3;
  id v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
  uint64_t v5 = [v6 defaultVoiceContext];
  [(RTTSettings *)self setPreferredRelayNumber:v4 forContext:v5];
}

- (BOOL)answerRTTCallsAsMuted
{
  BOOL v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  id v4 = [v3 defaultVoiceContext];
  LOBYTE(self) = [(RTTSettings *)self answerRTTCallsAsMutedForContext:v4];

  return (char)self;
}

- (void)setAnswerRTTCallsAsMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
  uint64_t v5 = [v6 defaultVoiceContext];
  [(RTTSettings *)self setAnswerRTTCallsAsMuted:v3 forContext:v5];
}

- (BOOL)showsRTTNotifications
{
  BOOL v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  id v4 = [v3 defaultVoiceContext];
  LOBYTE(self) = [(RTTSettings *)self showsRTTNotificationsForContext:v4];

  return (char)self;
}

- (BOOL)rttLiveTranscriptionsEnabled
{
  BOOL v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  id v4 = [v3 defaultVoiceContext];
  LOBYTE(self) = [(RTTSettings *)self rttLiveTranscriptionsEnabledForContext:v4];

  return (char)self;
}

- (void)setTTYHardwareEnabled:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(RTTSettings *)self _setValue:v8 forPreferenceKey:kAXSTTYHardwareEnabledPreference andContext:v7];
}

- (void)setTTYSoftwareEnabled:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "Set software enabled: %d for context: %@", buf, 0x12u);
  }

  if ([(RTTSettings *)self TTYSoftwareEnabledForContext:v6] == v4)
  {
    id v11 = AXLogRTT();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FEA9000, v11, OS_LOG_TYPE_INFO, "TTY software has the same value, no need to set again", buf, 2u);
    }
  }
  else
  {
    id v8 = [NSNumber numberWithBool:v4];
    [(RTTSettings *)self _setValue:v8 forPreferenceKey:kAXSTTYSoftwareEnabledPreference andContext:v6];

    BOOL v9 = +[RTTTelephonyUtilities TTYSoftwareEnabledForAnyActiveContext];
    uint64_t v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__RTTSettings_setTTYSoftwareEnabled_forContext___block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    BOOL v13 = v9;
    dispatch_async(v10, block);

    _AXSSoftwareTTYSetEnabled();
  }
}

void __48__RTTSettings_setTTYSoftwareEnabled_forContext___block_invoke(uint64_t a1)
{
  id v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  [v2 setTTYDictionaryAvailability:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)incomingCallsTTYForContext:(id)a3
{
  return [(RTTSettings *)self BOOLValueForKey:kAXSTTYIncomingCallsTTYPreference andContext:a3 withDefaultValue:0];
}

- (void)setIncomingCallsTTY:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "Set incoming calls: %d context: %@", (uint8_t *)v9, 0x12u);
  }

  id v8 = [NSNumber numberWithBool:v4];
  [(RTTSettings *)self _setValue:v8 forPreferenceKey:kAXSTTYIncomingCallsTTYPreference andContext:v6];
}

- (BOOL)ttyShouldBeRealtimeForContext:(id)a3
{
  return [(RTTSettings *)self BOOLValueForKey:kAXSTTYShouldBeRealtimePreference andContext:a3 withDefaultValue:1];
}

- (void)setTTYShouldBeRealtime:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(RTTSettings *)self _setValue:v8 forPreferenceKey:kAXSTTYShouldBeRealtimePreference andContext:v7];
}

- (id)preferredRelayNumberForContext:(id)a3
{
  BOOL v4 = kAXSTTYPreferredRelayNumberPreference;
  id v5 = a3;
  id v6 = [(RTTSettings *)self objectValueForKey:v4 andContext:v5 withClass:objc_opt_class() andDefaultValue:&stru_26D1B01C8];

  return v6;
}

- (void)setPreferredRelayNumber:(id)a3 forContext:(id)a4
{
}

- (BOOL)answerRTTCallsAsMutedForContext:(id)a3
{
  return [(RTTSettings *)self BOOLValueForKey:kAXSRTTAnswerAllRTTCallsAsMutedPreference andContext:a3 withDefaultValue:1];
}

- (void)setAnswerRTTCallsAsMuted:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(RTTSettings *)self _setValue:v8 forPreferenceKey:kAXSRTTAnswerAllRTTCallsAsMutedPreference andContext:v7];
}

- (BOOL)showsRTTNotificationsForContext:(id)a3
{
  return [(RTTSettings *)self BOOLValueForKey:kAXSRTTShowsNotificationsPreference andContext:a3 withDefaultValue:1];
}

- (void)setShowsRTTNotifications:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(RTTSettings *)self _setValue:v8 forPreferenceKey:kAXSRTTShowsNotificationsPreference andContext:v7];
}

- (BOOL)hasReceivedRTTCall
{
  return [(RTTSettings *)self BOOLValueForKey:@"TTYReceivedRTTCallPreference" withDefaultValue:0];
}

- (void)setHasReceivedRTTCall:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"TTYReceivedRTTCallPreference"];
}

- (BOOL)rttLiveTranscriptionsEnabledForContext:(id)a3
{
  return [(RTTSettings *)self BOOLValueForKey:@"RTTLiveTranscriptionEnabledPreference" andContext:a3 withDefaultValue:1];
}

- (void)setRTTLiveTranscriptionsEnabled:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(RTTSettings *)self _setValue:v8 forPreferenceKey:@"RTTLiveTranscriptionEnabledPreference" andContext:v7];
}

- (BOOL)continuityRTTIsSupported
{
  return [(RTTSettings *)self BOOLValueForKey:@"RTTContinuityRTTIsSupportedPreference" withDefaultValue:0];
}

- (void)setContinuityRTTIsSupported:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"RTTContinuityRTTIsSupportedPreference"];
}

- (BOOL)supportsRelayCalling
{
  return [(RTTSettings *)self BOOLValueForKey:@"TUSupportsRelayCallingPreference" withDefaultValue:0];
}

- (void)setSupportsRelayCalling:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"TUSupportsRelayCallingPreference"];
}

- (BOOL)isRelayCallingEnabled
{
  return [(RTTSettings *)self BOOLValueForKey:@"TUIsRelayCallingEnabledPreference" withDefaultValue:0];
}

- (void)setIsRelayCallingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"TUIsRelayCallingEnabledPreference"];
}

- (NSArray)cannedResponses
{
  BOOL v3 = [(RTTSettings *)self objectValueForKey:@"TTYCannedResponsesPreference" withClass:objc_opt_class() andDefaultValue:0];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v20 = [v3 count] - 1;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __30__RTTSettings_cannedResponses__block_invoke;
  v15[3] = &unk_264540A80;
  v15[4] = self;
  id v5 = v3;
  id v16 = v5;
  id v6 = v4;
  id v17 = v6;
  uint64_t v18 = v19;
  [&unk_26D1B3C88 enumerateObjectsUsingBlock:v15];
  [v6 addEntriesFromDictionary:v5];
  id v7 = [v6 keysOfEntriesPassingTest:&__block_literal_global_190];
  id v8 = [v7 allObjects];
  [v6 removeObjectsForKeys:v8];

  BOOL v9 = [v6 allKeys];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __30__RTTSettings_cannedResponses__block_invoke_3;
  v13[3] = &unk_264540AC8;
  id v10 = v6;
  id v14 = v10;
  id v11 = [v9 sortedArrayUsingComparator:v13];

  _Block_object_dispose(v19, 8);

  return (NSArray *)v11;
}

void __30__RTTSettings_cannedResponses__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 currentLocale];
  ttyLocStringAndLocale(v4, v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [*(id *)(a1 + 40) objectForKey:v10];

  if (!v6)
  {
    id v7 = NSNumber;
    id v8 = *(void **)(a1 + 48);
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    BOOL v9 = objc_msgSend(v7, "numberWithUnsignedInteger:");
    [v8 setObject:v9 forKey:v10];
  }
}

unint64_t __30__RTTSettings_cannedResponses__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return (unint64_t)[a3 integerValue] >> 63;
}

uint64_t __30__RTTSettings_cannedResponses__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKey:a2];
  id v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (void)setCannedResponses:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = [(RTTSettings *)self objectValueForKey:@"TTYCannedResponsesPreference" withClass:objc_opt_class() andDefaultValue:0];
  id v7 = [v5 dictionaryWithDictionary:v6];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __34__RTTSettings_setCannedResponses___block_invoke;
  v13[3] = &unk_264540AF0;
  id v14 = v4;
  id v8 = v7;
  id v15 = v8;
  id v9 = v4;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34__RTTSettings_setCannedResponses___block_invoke_194;
  v11[3] = &unk_264540B18;
  id v12 = v8;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v11];
  [(RTTSettings *)self _setValue:v10 forPreferenceKey:@"TTYCannedResponsesPreference"];
}

void __34__RTTSettings_setCannedResponses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL) {
    [*(id *)(a1 + 40) setObject:&unk_26D1B3C10 forKey:v3];
  }
}

void __34__RTTSettings_setCannedResponses___block_invoke_194(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [v4 setObject:v7 forKey:v6];
}

- (void)resetCannedResponses
{
  [(RTTSettings *)self _setValue:0 forPreferenceKey:@"TTYCannedResponsesPreference"];
  id v3 = [(RTTSettings *)self cannedResponses];
  [(RTTSettings *)self setCannedResponses:v3];
}

- (BOOL)rttInlineAbbreviationBarEnabled
{
  int v2 = [(RTTSettings *)self BOOLValueForKey:@"RTTInlineAbbreviationBar" withDefaultValue:1];
  if (v2) {
    LOBYTE(v2) = [MEMORY[0x263F472B0] deviceIsPad] ^ 1;
  }
  return v2;
}

- (void)setRttInlineAbbreviationBarEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"RTTInlineAbbreviationBar"];
}

- (BOOL)rttCallHoldEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)rttLiveTranscriptionsFeatureFlagEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)internalOverrideTTYAvailability
{
  return [(RTTSettings *)self BOOLValueForKey:@"InternalOverrideTTYAvailabilityPreference" withDefaultValue:0];
}

- (void)setInternalOverrideTTYAvailability:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(RTTSettings *)self _setValue:v4 forPreferenceKey:@"InternalOverrideTTYAvailabilityPreference"];
}

- (void)setRegisteredNotifications:(id)a3
{
}

- (void)setSynchronizePreferences:(id)a3
{
}

- (NSMutableDictionary)updateBlocks
{
  return self->_updateBlocks;
}

- (void)setUpdateBlocks:(id)a3
{
}

- (OS_dispatch_queue)nanoSynchronizeQueue
{
  return self->_nanoSynchronizeQueue;
}

- (void)setNanoSynchronizeQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nanoSynchronizeQueue, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_synchronizePreferences, 0);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
  objc_storeStrong((id *)&self->_cachedSettings, 0);

  objc_storeStrong((id *)&self->_synchronizeDomainsLock, 0);
}

void __40__RTTSettings__registerForNotification___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21FEA9000, a2, OS_LOG_TYPE_DEBUG, "Registered for %@", (uint8_t *)&v3, 0xCu);
}

- (void)BOOLValueForKey:andContext:withDefaultValue:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_21FEA9000, v0, v1, "Retrieved BOOL value: %@=%@");
}

- (void)BOOLValueForKey:andContext:withDefaultValue:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_21FEA9000, v0, v1, "Requesting BOOL value: %@ [%@]");
}

@end