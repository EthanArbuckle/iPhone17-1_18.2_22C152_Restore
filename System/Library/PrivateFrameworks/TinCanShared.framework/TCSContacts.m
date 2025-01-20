@interface TCSContacts
+ (BOOL)_contact:(id)a3 hasKeysForFormatterStye:(int64_t)a4;
+ (BOOL)_isContact:(id)a3 similarToContact:(id)a4;
+ (BOOL)_isUnknownContact:(id)a3 equalToUnknownContact:(id)a4;
+ (id)_canonicalDestinationForString:(id)a3;
+ (id)_canonicalPhoneNumberFromCNPhoneNumber:(id)a3;
+ (id)_canonicalPhoneNumberFromPhoneNumberString:(id)a3;
+ (id)_destinationsFromAllowlistDictionary:(id)a3 onlyAccepted:(BOOL)a4;
+ (id)_firstPhoneNumberOrEmailAddressFromContact:(id)a3 formatPhoneNumber:(BOOL)a4;
+ (id)_pauseCharacterSet;
+ (id)_safeContactDetailStringForLogging:(id)a3;
+ (id)_safeContactNameStringForLogging:(id)a3 handle:(id)a4;
+ (id)_tinCanUserNotificationCenter;
+ (id)_unifiedContactWithIdentifier:(id)a3 orDestination:(id)a4 usingContactStore:(id)a5 keysToFetch:(id)a6;
+ (id)_unifiedMeContactFromContactStore:(id)a3 keysToFetch:(id)a4;
+ (id)_unknownContactWithDestination:(id)a3;
+ (id)canonicalDestinationsForContact:(id)a3;
+ (id)validatedAllowlistFromDictionary:(id)a3;
+ (void)dismissInvitationNotificationsFromContact:(id)a3;
- (BOOL)_didIncomingOutgoingOrSupportChange:(id)a3;
- (BOOL)_generateDestinationsFromAllowlist;
- (BOOL)_loadAllowlistFromDefaults;
- (BOOL)_shouldHandleResetStoreDemoContent;
- (BOOL)contactSupportsTinCan:(id)a3;
- (BOOL)isContactAccepted:(id)a3;
- (BOOL)isContactAnInviter:(id)a3;
- (BOOL)isDestinationAccepted:(id)a3;
- (BOOL)isDestinationAnInviter:(id)a3;
- (BOOL)shouldObserveAllowlistDefaultChanges;
- (NSArray)destinations;
- (NSMutableDictionary)allowlist;
- (NSUserDefaults)defaults;
- (TCSContacts)init;
- (id)_removeDestinationFromAllowlist:(id)a3;
- (id)dateAddedForDestination:(id)a3;
- (id)mostRecentCallDateForContact:(id)a3;
- (id)mostRecentCallDateForDestination:(id)a3;
- (int64_t)stateForContact:(id)a3;
- (void)_addDestinations:(id)a3 asType:(int64_t)a4;
- (void)_deleteAllowlist;
- (void)_didInitiateCallToDestination:(id)a3 date:(id)a4;
- (void)_didReceiveCallFromDestination:(id)a3 date:(id)a4;
- (void)_handleDeviceFirstUnlock;
- (void)_loadDataFromDefaults;
- (void)_logDestinations;
- (void)_notifyObserversContactBecameAccepted:(id)a3;
- (void)_notifyObserversDestinationsChanged;
- (void)_notifyObserversRecencyChanged;
- (void)_reloadAllowlist;
- (void)_resetStoreDemoContent;
- (void)_saveAllowlist;
- (void)addDestinations:(id)a3;
- (void)addDestinationsForInviter:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didInitiateCallToContact:(id)a3 date:(id)a4;
- (void)didReceiveCallFromContact:(id)a3 date:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeDestinations:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAllowlist:(id)a3;
- (void)setContact:(id)a3 supportsTinCan:(BOOL)a4;
- (void)setContactAsAccepted:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDestinationAsAccepted:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setShouldObserveAllowlistDefaultChanges:(BOOL)a3;
@end

@implementation TCSContacts

- (TCSContacts)init
{
  v27.receiver = self;
  v27.super_class = (Class)TCSContacts;
  v2 = [(TCSContacts *)&v27 init];
  v3 = v2;
  if (v2)
  {
    v2->_allowlistLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    uint64_t v6 = objc_opt_new();
    npsManager = v3->_npsManager;
    v3->_npsManager = (NPSManager *)v6;

    if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot])
    {
      [(TCSContacts *)v3 _loadDataFromDefaults];
    }
    else
    {
      _TCSInitializeLogging();
      v8 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21E834000, v8, OS_LOG_TYPE_DEFAULT, "TCSContacts needs to wait for first device unlock before loading data.", (uint8_t *)buf, 2u);
      }
      v9 = [MEMORY[0x263F08A00] defaultCenter];
      v10 = +[TCSBehavior sharedBehavior];
      [v9 addObserver:v3 selector:sel__handleDeviceFirstUnlock name:@"TCSFirstUnlockNotification" object:v10];
    }
    v11 = [MEMORY[0x263F33668] defaultProvider];
    objc_initWeak(buf, v3);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __19__TCSContacts_init__block_invoke;
    v24[3] = &unk_2644C8B00;
    objc_copyWeak(&v25, buf);
    v12 = (void *)MEMORY[0x223C32060](v24);
    id v13 = objc_alloc(MEMORY[0x263F33580]);
    v14 = [v11 mainThreadScheduler];
    uint64_t v15 = [v13 initWithDelay:1 options:v12 block:v11 schedulerProvider:v14 downstreamScheduler:0.3];
    allowlistSaveTimer = v3->_allowlistSaveTimer;
    v3->_allowlistSaveTimer = (CNCoalescingTimer *)v15;

    [(TCSContacts *)v3 setShouldObserveAllowlistDefaultChanges:1];
    objc_initWeak(&location, v3);
    v17 = (const char *)[@"TCSContactsDidChangeNotification" UTF8String];
    v18 = MEMORY[0x263EF83A0];
    id v19 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __19__TCSContacts_init__block_invoke_2;
    handler[3] = &unk_2644C8BE8;
    objc_copyWeak(&v22, &location);
    notify_register_dispatch(v17, &v3->_prefSyncToken, v18, handler);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v25);
    objc_destroyWeak(buf);
  }
  return v3;
}

void __19__TCSContacts_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _saveAllowlist];
}

void __19__TCSContacts_init__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[8] == a2)
  {
    uint64_t v4 = WeakRetained;
    [WeakRetained _handleContactsPrefSync];
    id WeakRetained = v4;
  }
}

- (void)dealloc
{
  [(TCSContacts *)self setShouldObserveAllowlistDefaultChanges:0];
  notify_cancel(self->_prefSyncToken);
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TCSContacts;
  [(TCSContacts *)&v4 dealloc];
}

- (NSUserDefaults)defaults
{
  defaults = self->_defaults;
  if (!defaults)
  {
    objc_super v4 = +[TCSTinCanUserDefaults defaults];
    v5 = self->_defaults;
    self->_defaults = v4;

    defaults = self->_defaults;
  }
  return defaults;
}

- (void)setShouldObserveAllowlistDefaultChanges:(BOOL)a3
{
  if (self->_shouldObserveAllowlistDefaultChanges != a3)
  {
    BOOL v3 = a3;
    self->_shouldObserveAllowlistDefaultChanges = a3;
    id v6 = [(TCSContacts *)self defaults];
    v5 = +[TCSTinCanUserDefaults allowListKey];
    if (v3) {
      [v6 addObserver:self forKeyPath:v5 options:1 context:TCSContactsObservationContext];
    }
    else {
      [v6 removeObserver:self forKeyPath:v5 context:TCSContactsObservationContext];
    }
  }
}

+ (void)dismissInvitationNotificationsFromContact:(id)a3
{
  id v4 = a3;
  v5 = [a1 _tinCanUserNotificationCenter];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__TCSContacts_dismissInvitationNotificationsFromContact___block_invoke;
  v7[3] = &unk_2644C91C0;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 getDeliveredNotificationsWithCompletionHandler:v7];
}

void __57__TCSContacts_dismissInvitationNotificationsFromContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  uint64_t v35 = a1;
  if (objc_opt_isKindOfClass())
  {
    BOOL v34 = 0;
  }
  else
  {
    int v4 = [*(id *)(a1 + 32) iOSLegacyIdentifier];
    BOOL v34 = v4 != *MEMORY[0x263EFDFD0];
  }
  v33 = [MEMORY[0x263EFF980] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "request", v33);
        v11 = [v10 content];

        v12 = [v11 categoryIdentifier];
        int v13 = [@"com.apple.tincan.invite" isEqualToString:v12];

        if (v13)
        {
          v14 = [v11 userInfo];
          uint64_t v15 = [v14 objectForKeyedSubscript:@"com.apple.tincan.invite.handle"];

          v16 = [v11 userInfo];
          v17 = [v16 objectForKeyedSubscript:@"com.apple.tincan.invite.contactidentifier"];

          v18 = [*(id *)(v35 + 32) identifier];
          if (v18) {
            BOOL v19 = v17 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          BOOL v20 = !v19 && v34;

          if (!v20)
          {
            v23 = [*(id *)(v35 + 40) canonicalDestinationsForContact:*(void *)(v35 + 32)];
            v24 = v23;
            if (v15)
            {
              int v25 = [v23 containsObject:v15];

              if (!v25) {
                goto LABEL_23;
              }
LABEL_21:
              v17 = [v9 request];
              v24 = [v17 identifier];
              [v33 addObject:v24];
            }

            goto LABEL_23;
          }
          v21 = [*(id *)(v35 + 32) identifier];
          char v22 = [v21 isEqualToString:v17];

          if (v22) {
            goto LABEL_21;
          }
        }
LABEL_23:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v6);
  }

  v26 = v33;
  if ([v33 count])
  {
    _TCSInitializeLogging();
    objc_super v27 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void *)(v35 + 32);
      v28 = *(void **)(v35 + 40);
      v30 = v27;
      v31 = [v28 _safeContactDetailStringForLogging:v29];
      *(_DWORD *)buf = 138412290;
      v42 = v31;
      _os_log_impl(&dword_21E834000, v30, OS_LOG_TYPE_DEFAULT, "Requesting removal of invitation notifications from: %@", buf, 0xCu);
    }
    v32 = objc_msgSend(*(id *)(v35 + 40), "_tinCanUserNotificationCenter", v33);
    [v32 removeDeliveredNotificationsWithIdentifiers:v26];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)addDestinations:(id)a3
{
}

- (void)addDestinationsForInviter:(id)a3
{
}

- (void)removeDestinations:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(void *)(*((void *)&v17 + 1) + 8 * v10), (void)v17);
        v12 = [(TCSContacts *)self _removeDestinationFromAllowlist:v11];
        [v5 addObjectsFromArray:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    _TCSInitializeLogging();
    int v13 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      uint64_t v15 = [v5 componentsJoinedByString:@", "];
      v16 = TCSLogSafeDescription(v15);
      *(_DWORD *)buf = 138412290;
      char v22 = v16;
      _os_log_impl(&dword_21E834000, v14, OS_LOG_TYPE_DEFAULT, "TCSContacts removed handles: %@", buf, 0xCu);
    }
    [(CNCoalescingTimer *)self->_allowlistSaveTimer handleEvent];
    [(TCSContacts *)self _generateDestinationsFromAllowlist];
    [(TCSContacts *)self _notifyObserversDestinationsChanged];
  }
}

- (void)setContact:(id)a3 supportsTinCan:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = +[TCSContacts canonicalDestinationsForContact:a3];
  int v25 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(void *)(*((void *)&v27 + 1) + 8 * i), v25);
        os_unfair_lock_lock(&self->_allowlistLock);
        v12 = [(NSMutableDictionary *)self->_allowlist objectForKey:v11];
        int v13 = (void *)[v12 mutableCopy];
        v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [MEMORY[0x263EFF9A0] dictionary];
        }
        v16 = v15;

        os_unfair_lock_unlock(&self->_allowlistLock);
        long long v17 = [v16 objectForKeyedSubscript:@"Supported"];
        int v18 = [v17 BOOLValue];

        if (v18 != v4)
        {
          long long v19 = [NSNumber numberWithBool:v4];
          [v16 setObject:v19 forKey:@"Supported"];

          os_unfair_lock_lock(&self->_allowlistLock);
          [(NSMutableDictionary *)self->_allowlist setObject:v16 forKey:v11];
          os_unfair_lock_unlock(&self->_allowlistLock);
          [v25 addObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v8);
  }

  if ([v25 count])
  {
    _TCSInitializeLogging();
    long long v20 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      char v22 = NSStringFromBOOL();
      v23 = [v25 componentsJoinedByString:@", "];
      uint64_t v24 = TCSLogSafeDescription(v23);
      *(_DWORD *)buf = 138412546;
      v32 = v22;
      __int16 v33 = 2112;
      BOOL v34 = v24;
      _os_log_impl(&dword_21E834000, v21, OS_LOG_TYPE_DEFAULT, "TCSContacts set support flag to %@ for: %@", buf, 0x16u);
    }
    [(TCSContacts *)self _saveAllowlist];
    [(TCSContacts *)self _notifyObserversRecencyChanged];
  }
}

- (BOOL)contactSupportsTinCan:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  +[TCSContacts canonicalDestinationsForContact:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        os_unfair_lock_lock(&self->_allowlistLock);
        uint64_t v10 = [(NSMutableDictionary *)self->_allowlist objectForKeyedSubscript:v9];
        os_unfair_lock_unlock(&self->_allowlistLock);
        v11 = [v10 objectForKeyedSubscript:@"Supported"];
        char v12 = [v11 BOOLValue];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)isDestinationAccepted:(id)a3
{
  id v4 = +[TCSContacts _canonicalDestinationForString:a3];
  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  uint64_t v6 = [(NSMutableDictionary *)self->_allowlist objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_allowlistLock);
  uint64_t v7 = [v6 objectForKeyedSubscript:@"Accepted"];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)isDestinationAnInviter:(id)a3
{
  id v4 = +[TCSContacts _canonicalDestinationForString:a3];
  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  uint64_t v6 = [(NSMutableDictionary *)self->_allowlist objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_allowlistLock);
  uint64_t v7 = [v6 objectForKeyedSubscript:@"Inviter"];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)setDestinationAsAccepted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[TCSContacts _canonicalDestinationForString:v4];
  os_unfair_lock_lock(&self->_allowlistLock);
  uint64_t v6 = [(NSMutableDictionary *)self->_allowlist objectForKey:v5];
  uint64_t v7 = (void *)[v6 mutableCopy];

  os_unfair_lock_unlock(&self->_allowlistLock);
  if (v7)
  {
    char v8 = [v7 objectForKeyedSubscript:@"Accepted"];
    int v9 = [v8 BOOLValue];

    if (v9)
    {
      _TCSInitializeLogging();
      uint64_t v10 = (void *)TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
        -[TCSContacts setDestinationAsAccepted:](v10);
      }
    }
    else
    {
      [v7 setObject:MEMORY[0x263EFFA88] forKey:@"Accepted"];
      char v12 = [MEMORY[0x263EFF910] date];
      [v7 setObject:v12 forKey:@"Added"];

      [v7 removeObjectForKey:@"Inviter"];
      os_unfair_lock_lock(&self->_allowlistLock);
      [(NSMutableDictionary *)self->_allowlist setObject:v7 forKey:v5];
      os_unfair_lock_unlock(&self->_allowlistLock);
      [(CNCoalescingTimer *)self->_allowlistSaveTimer handleEvent];
    }
  }
  else
  {
    _TCSInitializeLogging();
    v11 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSContacts setDestinationAsAccepted:](v11);
    }
  }
}

- (BOOL)isContactAccepted:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  +[TCSContacts canonicalDestinationsForContact:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[TCSContacts isDestinationAccepted:](self, "isDestinationAccepted:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isContactAnInviter:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  +[TCSContacts canonicalDestinationsForContact:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[TCSContacts isDestinationAnInviter:](self, "isDestinationAnInviter:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)setContactAsAccepted:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[TCSContacts canonicalDestinationsForContact:v4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        [(TCSContacts *)self setDestinationAsAccepted:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(TCSContacts *)self _notifyObserversContactBecameAccepted:v4];
}

- (void)didInitiateCallToContact:(id)a3 date:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = +[TCSContacts canonicalDestinationsForContact:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(TCSContacts *)self _didInitiateCallToDestination:*(void *)(*((void *)&v12 + 1) + 8 * v11++) date:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  [(CNCoalescingTimer *)self->_allowlistSaveTimer handleEvent];
  [(TCSContacts *)self _notifyObserversRecencyChanged];
}

- (void)didReceiveCallFromContact:(id)a3 date:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = +[TCSContacts canonicalDestinationsForContact:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(TCSContacts *)self _didReceiveCallFromDestination:*(void *)(*((void *)&v12 + 1) + 8 * v11++) date:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  [(CNCoalescingTimer *)self->_allowlistSaveTimer handleEvent];
  [(TCSContacts *)self _notifyObserversRecencyChanged];
}

- (void)_didInitiateCallToDestination:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[TCSContacts _canonicalDestinationForString:v6];
  os_unfair_lock_lock(&self->_allowlistLock);
  uint64_t v9 = [(NSMutableDictionary *)self->_allowlist objectForKeyedSubscript:v8];
  uint64_t v10 = (void *)[v9 mutableCopy];

  os_unfair_lock_unlock(&self->_allowlistLock);
  if (v10
    && ([v10 objectForKeyedSubscript:@"Accepted"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 BOOLValue],
        v11,
        (v12 & 1) != 0))
  {
    long long v13 = [v10 objectForKeyedSubscript:@"Outgoing"];
    long long v14 = (void *)[v13 mutableCopy];
    long long v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x263EFF980] array];
    }
    long long v18 = v16;

    [v18 enqueue:v7];
    [v10 setObject:v18 forKey:@"Outgoing"];
    os_unfair_lock_lock(&self->_allowlistLock);
    [(NSMutableDictionary *)self->_allowlist setObject:v10 forKey:v8];
    os_unfair_lock_unlock(&self->_allowlistLock);
    [(CNCoalescingTimer *)self->_allowlistSaveTimer handleEvent];
  }
  else
  {
    _TCSInitializeLogging();
    uint64_t v17 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSContacts _didInitiateCallToDestination:date:](v17);
    }
  }
}

- (void)_didReceiveCallFromDestination:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[TCSContacts _canonicalDestinationForString:v6];
  os_unfair_lock_lock(&self->_allowlistLock);
  uint64_t v9 = [(NSMutableDictionary *)self->_allowlist objectForKeyedSubscript:v8];
  uint64_t v10 = (void *)[v9 mutableCopy];

  os_unfair_lock_unlock(&self->_allowlistLock);
  if (v10
    && ([v10 objectForKeyedSubscript:@"Accepted"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 BOOLValue],
        v11,
        (v12 & 1) != 0))
  {
    long long v13 = [v10 objectForKeyedSubscript:@"Incoming"];
    long long v14 = (void *)[v13 mutableCopy];
    long long v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x263EFF980] array];
    }
    long long v18 = v16;

    [v18 enqueue:v7];
    [v10 setObject:v18 forKey:@"Incoming"];
    os_unfair_lock_lock(&self->_allowlistLock);
    [(NSMutableDictionary *)self->_allowlist setObject:v10 forKey:v8];
    os_unfair_lock_unlock(&self->_allowlistLock);
    [(CNCoalescingTimer *)self->_allowlistSaveTimer handleEvent];
  }
  else
  {
    _TCSInitializeLogging();
    uint64_t v17 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSContacts _didReceiveCallFromDestination:date:](v17);
    }
  }
}

- (id)mostRecentCallDateForContact:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [(TCSContacts *)self mostRecentCallDateForDestination:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        uint64_t v11 = v10;
        if (v7)
        {
          uint64_t v12 = [v7 laterDate:v10];

          id v7 = (id)v12;
        }
        else
        {
          id v7 = v10;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)mostRecentCallDateForDestination:(id)a3
{
  id v4 = +[TCSContacts _canonicalDestinationForString:a3];
  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  uint64_t v6 = [(NSMutableDictionary *)self->_allowlist objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_allowlistLock);
  id v7 = [v6 objectForKeyedSubscript:@"Incoming"];
  uint64_t v8 = [v7 lastObject];

  uint64_t v9 = [v6 objectForKeyedSubscript:@"Outgoing"];
  uint64_t v10 = [v9 lastObject];

  uint64_t v11 = [v6 objectForKeyedSubscript:@"InvitationReceived"];
  uint64_t v12 = v11;
  if (v8) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v10 == 0;
  }
  if (!v13 || v11 == 0)
  {
    if (v8) {
      BOOL v15 = v10 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      if (v8) {
        long long v16 = v8;
      }
      else {
        long long v16 = v10;
      }
      id v17 = v16;
    }
    else
    {
      id v17 = [v8 laterDate:v10];
    }
  }
  else
  {
    id v17 = v11;
  }
  long long v18 = v17;

  return v18;
}

- (id)dateAddedForDestination:(id)a3
{
  id v4 = +[TCSContacts _canonicalDestinationForString:a3];
  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  uint64_t v6 = [(NSMutableDictionary *)self->_allowlist objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_allowlistLock);
  if (v6)
  {
    id v7 = [v6 objectForKeyedSubscript:@"Added"];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x263EFF910] distantPast];
    }
    uint64_t v11 = v9;
  }
  else
  {
    _TCSInitializeLogging();
    uint64_t v10 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSContacts dateAddedForDestination:](v10);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (int64_t)stateForContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(TCSContacts *)self isContactAccepted:v4];
    BOOL v6 = [(TCSContacts *)self isContactAnInviter:v4];
    if (v5 || !v6)
    {
      if (v5
        && ([(TCSContacts *)self mostRecentCallDateForContact:v4],
            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
            v8,
            v8)
        || +[TCSBehavior isRunningInStoreDemoModeOrSimulator])
      {
        int64_t v7 = 3;
      }
      else if ([(TCSContacts *)self contactSupportsTinCan:v4])
      {
        int64_t v7 = 2;
      }
      else
      {
        int64_t v7 = 1;
      }
    }
    else
    {
      int64_t v7 = 4;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)TCSContactsObservationContext == a6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__TCSContacts_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_2644C8B50;
    void v7[4] = self;
    TCSGuaranteeMainThread(v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TCSContacts;
    -[TCSContacts observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __62__TCSContacts_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAllowlist];
}

+ (id)validatedAllowlistFromDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = (void *)[a3 mutableCopy];
  id v4 = [v3 allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v3 objectForKeyedSubscript:v9];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v3 setObject:0 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

- (void)_handleDeviceFirstUnlock
{
  _TCSInitializeLogging();
  id v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSContacts was notified of first device unlock.", v4, 2u);
  }
  [(TCSContacts *)self _loadDataFromDefaults];
  [(TCSContacts *)self _notifyObserversDestinationsChanged];
}

- (void)_loadDataFromDefaults
{
  [(TCSContacts *)self _loadAllowlistFromDefaults];
  [(TCSContacts *)self _generateDestinationsFromAllowlist];
  [(TCSContacts *)self _logDestinations];
}

- (void)_addDestinations:(id)a3 asType:(int64_t)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v31 = [MEMORY[0x263EFF980] array];
  long long v30 = [MEMORY[0x263EFF910] date];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    p_allowlistLock = &self->_allowlistLock;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(void *)(*((void *)&v34 + 1) + 8 * i), v30);
        os_unfair_lock_lock(p_allowlistLock);
        uint64_t v12 = [(NSMutableDictionary *)self->_allowlist objectForKey:v11];
        long long v13 = (void *)[v12 mutableCopy];
        long long v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [MEMORY[0x263EFF9A0] dictionary];
        }
        long long v16 = v15;

        os_unfair_lock_unlock(p_allowlistLock);
        id v17 = [v16 objectForKeyedSubscript:@"Accepted"];
        char v18 = [v17 BOOLValue];

        uint64_t v19 = [v16 objectForKeyedSubscript:@"Inviter"];
        char v20 = [v19 BOOLValue];

        if (a4) {
          char v21 = 0;
        }
        else {
          char v21 = v18;
        }
        char v22 = v18 | v20;
        if (a4 != 1) {
          char v22 = 0;
        }
        if ((v21 & 1) == 0 && (v22 & 1) == 0)
        {
          if (a4)
          {
            if (a4 == 1)
            {
              uint64_t v23 = MEMORY[0x263EFFA88];
              [v16 setObject:MEMORY[0x263EFFA88] forKey:@"Supported"];
              [v16 setObject:v23 forKey:@"Inviter"];
              [v16 setObject:v30 forKey:@"InvitationReceived"];
            }
          }
          else
          {
            [v16 setObject:MEMORY[0x263EFFA88] forKey:@"Accepted"];
            [v16 setObject:v30 forKey:@"Added"];
            [v16 removeObjectForKey:@"Inviter"];
          }
          os_unfair_lock_lock(p_allowlistLock);
          [(NSMutableDictionary *)self->_allowlist setObject:v16 forKey:v11];
          os_unfair_lock_unlock(p_allowlistLock);
          [v31 addObject:v11];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v7);
  }

  if ([v31 count])
  {
    _TCSInitializeLogging();
    uint64_t v24 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = v24;
      v26 = [v31 componentsJoinedByString:@", "];
      uint64_t v27 = TCSLogSafeDescription(v26);
      long long v28 = (void *)v27;
      long long v29 = @"inviter";
      if (!a4) {
        long long v29 = @"allowed";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = v27;
      __int16 v40 = 2112;
      v41 = v29;
      _os_log_impl(&dword_21E834000, v25, OS_LOG_TYPE_DEFAULT, "TCSContacts added: %@ (%@)", buf, 0x16u);
    }
    [(TCSContacts *)self _saveAllowlist];
    [(TCSContacts *)self _generateDestinationsFromAllowlist];
    [(TCSContacts *)self _notifyObserversDestinationsChanged];
  }
}

- (id)_removeDestinationFromAllowlist:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  os_unfair_lock_lock(&self->_allowlistLock);
  uint64_t v6 = [(NSMutableDictionary *)self->_allowlist objectForKey:v4];

  if (v6)
  {
    [(NSMutableDictionary *)self->_allowlist removeObjectForKey:v4];
    [v5 addObject:v4];
  }
  if ([v4 destinationIdIsEmailAddress])
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_allowlist allKeys];
    uint64_t v8 = (void *)[v7 copy];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "destinationIdIsEmailAddress", (void)v17)
            && [v4 isEqualToIgnoringCase:v14])
          {
            [(NSMutableDictionary *)self->_allowlist removeObjectForKey:v14];
            [v5 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  os_unfair_lock_unlock(&self->_allowlistLock);
  id v15 = (void *)[v5 copy];

  return v15;
}

- (BOOL)_loadAllowlistFromDefaults
{
  id v3 = [(TCSContacts *)self defaults];
  id v4 = +[TCSTinCanUserDefaults allowListKey];
  id v5 = [v3 dictionaryForKey:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [NSDictionary dictionary];
  }
  uint64_t v8 = v7;

  os_unfair_lock_lock(&self->_allowlistLock);
  char v9 = [v8 isEqualToDictionary:self->_allowlist];
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = +[TCSContacts validatedAllowlistFromDictionary:v8];
    uint64_t v11 = (NSMutableDictionary *)[v10 mutableCopy];
    allowlist = self->_allowlist;
    self->_allowlist = v11;
  }
  os_unfair_lock_unlock(&self->_allowlistLock);

  return v9 ^ 1;
}

- (BOOL)_generateDestinationsFromAllowlist
{
  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  id v4 = +[TCSContacts _destinationsFromAllowlistDictionary:self->_allowlist onlyAccepted:0];
  os_unfair_lock_unlock(p_allowlistLock);
  destinations = self->_destinations;
  p_destinations = &self->_destinations;
  char v7 = [v4 isEqualToArray:destinations];
  if ((v7 & 1) == 0) {
    objc_storeStrong((id *)p_destinations, v4);
  }

  return v7 ^ 1;
}

- (void)_reloadAllowlist
{
  id v3 = [(TCSContacts *)self allowlist];
  id v4 = (id)[v3 copy];

  if ([(TCSContacts *)self _loadAllowlistFromDefaults])
  {
    if ([(TCSContacts *)self _generateDestinationsFromAllowlist])
    {
      [(TCSContacts *)self _logDestinations];
      [(TCSContacts *)self _notifyObserversDestinationsChanged];
    }
    if ([(TCSContacts *)self _didIncomingOutgoingOrSupportChange:v4]) {
      [(TCSContacts *)self _notifyObserversRecencyChanged];
    }
  }
}

- (BOOL)_didIncomingOutgoingOrSupportChange:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__TCSContacts__didIncomingOutgoingOrSupportChange___block_invoke;
  v6[3] = &unk_2644C91E8;
  v6[4] = self;
  v6[5] = &v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __51__TCSContacts__didIncomingOutgoingOrSupportChange___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v19 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"Supported"];
  int v9 = [v8 BOOLValue];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  char v10 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v19];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"Supported"];
  int v12 = [v11 BOOLValue];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if (v9 == v12)
  {
    long long v13 = [v7 objectForKeyedSubscript:@"Incoming"];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    long long v14 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v19];
    id v15 = [v14 objectForKeyedSubscript:@"Incoming"];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    if ([v13 count] || !objc_msgSend(v15, "count"))
    {
      long long v16 = [v7 objectForKeyedSubscript:@"Outgoing"];
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
      long long v17 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v19];
      long long v18 = [v17 objectForKeyedSubscript:@"Outgoing"];

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
      if (![v16 count] && objc_msgSend(v18, "count"))
      {
        *a4 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
    else
    {
      *a4 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)_logDestinations
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [(NSArray *)self->_destinations count];
  _TCSInitializeLogging();
  id v4 = TCSLogDefault;
  BOOL v5 = os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      destinations = self->_destinations;
      id v7 = v4;
      uint64_t v8 = [(NSArray *)destinations componentsJoinedByString:@", "];
      int v9 = TCSLogSafeDescription(v8);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_21E834000, v7, OS_LOG_TYPE_DEFAULT, "TCSContacts has allowed destinations: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21E834000, v4, OS_LOG_TYPE_DEFAULT, "TCSContacts has no allowed destinations.", (uint8_t *)&v10, 2u);
  }
}

- (void)_saveAllowlist
{
  [(TCSContacts *)self setShouldObserveAllowlistDefaultChanges:0];
  os_unfair_lock_lock(&self->_allowlistLock);
  NSUInteger v3 = [(TCSContacts *)self defaults];
  allowlist = self->_allowlist;
  BOOL v5 = allowlist;
  if (!allowlist)
  {
    BOOL v5 = [NSDictionary dictionary];
  }
  uint64_t v6 = +[TCSTinCanUserDefaults allowListKey];
  [v3 setObject:v5 forKey:v6];

  if (!allowlist) {
  os_unfair_lock_unlock(&self->_allowlistLock);
  }
  [(TCSContacts *)self setShouldObserveAllowlistDefaultChanges:1];
  if (NPSHasCompletedInitialSync())
  {
    npsManager = self->_npsManager;
    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    id v10 = +[TCSTinCanUserDefaults allowListKey];
    int v9 = [v8 setWithObject:v10];
    [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.tincan" keys:v9];
  }
}

- (void)_notifyObserversDestinationsChanged
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  NSUInteger v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 destinationsDidChange:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversRecencyChanged
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  NSUInteger v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 recencyDidChange:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversContactBecameAccepted:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 contactBecameAccepted:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)_shouldHandleResetStoreDemoContent
{
  int v2 = [MEMORY[0x263F1C408] isRunningInStoreDemoMode];
  if (v2)
  {
    NSUInteger v3 = [MEMORY[0x263F1C408] sharedApplication];
    char v4 = [v3 isFrontBoard];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)_resetStoreDemoContent
{
  if ([(TCSContacts *)self _shouldHandleResetStoreDemoContent])
  {
    _TCSInitializeLogging();
    NSUInteger v3 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSContacts will reset demo content.", v16, 2u);
    }
    char v4 = [(TCSContacts *)self defaults];
    [v4 removeObjectForKey:@"Suggestions"];

    uint64_t v5 = [(TCSContacts *)self defaults];
    [v5 removeObjectForKey:@"SuggestionsFirstGenerated"];

    uint64_t v6 = [(TCSContacts *)self defaults];
    [v6 removeObjectForKey:@"SuggestionsPreviouslyGenerated"];

    uint64_t v7 = [(TCSContacts *)self defaults];
    [v7 removeObjectForKey:@"SawTalkButtonTutorial"];

    uint64_t v8 = [(TCSContacts *)self defaults];
    uint64_t v9 = +[TCSTinCanUserDefaults storeDemoAllowlistKey];
    long long v10 = [v8 dictionaryForKey:v9];
    long long v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [NSDictionary dictionary];
    }
    long long v13 = v12;

    os_unfair_lock_lock(&self->_allowlistLock);
    long long v14 = (NSMutableDictionary *)[v13 mutableCopy];
    allowlist = self->_allowlist;
    self->_allowlist = v14;

    os_unfair_lock_unlock(&self->_allowlistLock);
    [(TCSContacts *)self _saveAllowlist];
    [(TCSContacts *)self _generateDestinationsFromAllowlist];
    [(TCSContacts *)self _logDestinations];
    [(TCSContacts *)self _notifyObserversDestinationsChanged];
    [(TCSContacts *)self _notifyObserversRecencyChanged];
  }
}

- (void)_deleteAllowlist
{
  id v3 = [(TCSContacts *)self defaults];
  int v2 = +[TCSTinCanUserDefaults allowListKey];
  [v3 removeObjectForKey:v2];
}

+ (id)_destinationsFromAllowlistDictionary:(id)a3 onlyAccepted:(BOOL)a4
{
  if (a4)
  {
    char v4 = (void *)MEMORY[0x263EFF9C0];
    id v5 = a3;
    uint64_t v6 = [v4 set];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__TCSContacts__destinationsFromAllowlistDictionary_onlyAccepted___block_invoke;
    v11[3] = &unk_2644C8B28;
    id v12 = v6;
    id v7 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];

    uint64_t v8 = [v7 allObjects];
  }
  else
  {
    id v9 = a3;
    uint64_t v8 = [v9 allKeys];
  }
  return v8;
}

void __65__TCSContacts__destinationsFromAllowlistDictionary_onlyAccepted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = [a3 objectForKeyedSubscript:@"Accepted"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

+ (id)_unifiedMeContactFromContactStore:(id)a3 keysToFetch:(id)a4
{
  id v8 = 0;
  char v4 = objc_msgSend(a3, "_ios_meContactWithKeysToFetch:error:", a4, &v8);
  id v5 = v8;
  int v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      if ([v5 code] != 2)
      {
        _TCSInitializeLogging();
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
          +[TCSContacts _unifiedMeContactFromContactStore:keysToFetch:]();
        }
      }
    }
  }

  return v4;
}

+ (id)_unifiedContactWithIdentifier:(id)a3 orDestination:(id)a4 usingContactStore:(id)a5 keysToFetch:(id)a6
{
  v27[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v10 length])
  {
    if (v11)
    {
      if ([v11 destinationIdIsPhoneNumber])
      {
        char v21 = [a1 _pauseCharacterSet];
        int v22 = objc_msgSend(v11, "_cn_containsCharacterInSet:", v21);

        if (!v22)
        {
          id v15 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v11];
          uint64_t v16 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v15];
          goto LABEL_3;
        }
        _TCSInitializeLogging();
        uint64_t v23 = (void *)TCSLogDefault;
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
          +[TCSContacts _unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:](v23);
        }
LABEL_20:
        long long v20 = 0;
        goto LABEL_21;
      }
      if ([v11 destinationIdIsEmailAddress])
      {
        long long v17 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:v11];
        goto LABEL_4;
      }
    }
    _TCSInitializeLogging();
    uint64_t v24 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      +[TCSContacts _unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:]((uint64_t)v10, v24, v11);
    }
    goto LABEL_20;
  }
  long long v14 = (void *)MEMORY[0x263EFE9F8];
  v27[0] = v10;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  uint64_t v16 = [v14 predicateForContactsWithIdentifiers:v15];
LABEL_3:
  long long v17 = (void *)v16;

LABEL_4:
  id v26 = 0;
  long long v18 = [v12 unifiedContactsMatchingPredicate:v17 keysToFetch:v13 error:&v26];
  id v19 = v26;
  if (v19)
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      +[TCSContacts _unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:]();
    }
    long long v20 = 0;
  }
  else
  {
    long long v20 = [v18 firstObject];
    if (!v20)
    {
      long long v20 = [a1 _unknownContactWithDestination:v11];
    }
  }

LABEL_21:
  return v20;
}

+ (id)_pauseCharacterSet
{
  if (_pauseCharacterSet_onceToken != -1) {
    dispatch_once(&_pauseCharacterSet_onceToken, &__block_literal_global_6);
  }
  int v2 = (void *)_pauseCharacterSet_PauseCharacterSet;
  return v2;
}

uint64_t __33__TCSContacts__pauseCharacterSet__block_invoke()
{
  _pauseCharacterSet_PauseCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@";,"];
  return MEMORY[0x270F9A758]();
}

+ (id)_canonicalPhoneNumberFromCNPhoneNumber:(id)a3
{
  id v3 = [a3 digits];
  char v4 = (void *)MEMORY[0x263F7E280];
  id v5 = TUHomeCountryCode();
  int v6 = [v4 phoneNumberWithDigits:v3 countryCode:v5];
  id v7 = [v6 unformattedInternationalRepresentation];

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = v3;
  }
  id v9 = v8;

  return v9;
}

+ (id)_canonicalPhoneNumberFromPhoneNumberString:(id)a3
{
  char v4 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:a3];
  id v5 = [a1 _canonicalPhoneNumberFromCNPhoneNumber:v4];

  return v5;
}

+ (id)_canonicalDestinationForString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ([v4 destinationIdIsPhoneNumber])
  {
    id v5 = [a1 _canonicalPhoneNumberFromPhoneNumberString:v4];
  }
  return v5;
}

+ (id)canonicalDestinationsForContact:(id)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  v36[0] = *MEMORY[0x263EFE070];
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
  int v7 = [v4 areKeysAvailable:v6];

  if (v7)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = [v4 phoneNumbers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v29 + 1) + 8 * i) value];
          long long v14 = [a1 _canonicalPhoneNumberFromCNPhoneNumber:v13];
          [v5 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v10);
    }
  }
  uint64_t v34 = *MEMORY[0x263EFDF80];
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  int v16 = [v4 areKeysAvailable:v15];

  if (v16)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v17 = objc_msgSend(v4, "emailAddresses", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          int v22 = [*(id *)(*((void *)&v25 + 1) + 8 * j) value];
          [v5 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }
  }
  uint64_t v23 = [v5 allObjects];

  return v23;
}

+ (id)_unknownContactWithDestination:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  if ([v3 destinationIdIsPhoneNumber])
  {
    id v5 = (void *)MEMORY[0x263EFEAD0];
    uint64_t v6 = *MEMORY[0x263EFE8D0];
    int v7 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v3];
    id v8 = [v5 labeledValueWithLabel:v6 value:v7];
    v13[0] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];

    [v4 setPhoneNumbers:v9];
  }
  else if ([v3 destinationIdIsEmailAddress])
  {
    uint64_t v10 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:*MEMORY[0x263EFE8B8] value:v3];
    id v12 = v10;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];

    [v4 setEmailAddresses:v9];
  }
  else
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      +[TCSContacts _unknownContactWithDestination:]();
    }
    uint64_t v9 = v4;
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)_contact:(id)a3 hasKeysForFormatterStye:(int64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:a4];
  v11[0] = v6;
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  char v8 = [v5 areKeysAvailable:v7];

  if ((v8 & 1) == 0)
  {
    _TCSInitializeLogging();
    uint64_t v9 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      +[TCSContacts _contact:hasKeysForFormatterStye:](v9, v5);
    }
  }

  return v8;
}

+ (BOOL)_isContact:(id)a3 similarToContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();
  if (isKindOfClass & 1) != 0 || (v9)
  {
    char v12 = [a1 _isUnknownContact:v7 equalToUnknownContact:v6];
  }
  else
  {
    uint64_t v10 = [v7 identifier];

    uint64_t v11 = [v6 identifier];
    char v12 = [v10 isEqualToString:v11];

    id v7 = v10;
  }

  return v12;
}

+ (BOOL)_isUnknownContact:(id)a3 equalToUnknownContact:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a4;
  id v7 = [a3 idsCanonicalDestinations];
  char v8 = [v5 setWithArray:v7];

  char v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = [v6 idsCanonicalDestinations];

  uint64_t v11 = [v9 setWithArray:v10];

  LOBYTE(v6) = [v8 isEqualToSet:v11];
  return (char)v6;
}

+ (id)_firstPhoneNumberOrEmailAddressFromContact:(id)a3 formatPhoneNumber:(BOOL)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v19[0] = *MEMORY[0x263EFE070];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  int v7 = [v5 areKeysAvailable:v6];

  if (!v7) {
    goto LABEL_6;
  }
  char v8 = [v5 phoneNumbers];
  char v9 = [v8 firstObject];
  uint64_t v10 = [v9 value];
  uint64_t v11 = v10;
  if (a4) {
    [v10 formattedInternationalStringValue];
  }
  else {
  char v12 = [v10 unformattedInternationalStringValue];
  }

  if (!v12)
  {
LABEL_6:
    uint64_t v18 = *MEMORY[0x263EFDF80];
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    int v14 = [v5 areKeysAvailable:v13];

    if (v14)
    {
      id v15 = [v5 emailAddresses];
      int v16 = [v15 firstObject];
      char v12 = [v16 value];
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

+ (id)_tinCanUserNotificationCenter
{
  if (TCSIsProcessTinCan())
  {
    int v2 = [MEMORY[0x263F1DFB0] currentNotificationCenter];
  }
  else
  {
    int v2 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.tincan"];
  }
  return v2;
}

+ (id)_safeContactNameStringForLogging:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _contact:v6 hasKeysForFormatterStye:0])
  {
    char v8 = [MEMORY[0x263EFEA20] stringFromContact:v6 style:0];
    if (!v8)
    {
      char v9 = +[TCSContacts _firstPhoneNumberOrEmailAddressFromContact:v6 formatPhoneNumber:0];
      if (v9) {
        char v8 = (__CFString *)IDSCopyRawAddressForDestination();
      }
      else {
        char v8 = @"[unknown]";
      }
      goto LABEL_8;
    }
  }
  else
  {
    char v8 = @"<name formatter keys missing>";
  }
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v10 = NSString;
  char v9 = (void *)IDSCopyRawAddressForDestination();
  uint64_t v11 = [v10 stringWithFormat:@"%@ [%@]", v8, v9];

  char v8 = (__CFString *)v11;
LABEL_8:

LABEL_9:
  char v12 = TCSLogSafeDescription(v8);

  return v12;
}

+ (id)_safeContactDetailStringForLogging:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F089D8];
  id v6 = [v4 identifier];
  id v7 = [v5 stringWithFormat:@"ID: %@", v6];

  if ([a1 _contact:v4 hasKeysForFormatterStye:0])
  {
    char v8 = [MEMORY[0x263EFEA20] stringFromContact:v4 style:0];
  }
  else
  {
    char v8 = @"<name formatter keys missing>";
  }
  if ([(__CFString *)v8 length])
  {
    char v9 = NSString;
    uint64_t v10 = TCSLogSafeDescription(v8);
    uint64_t v11 = [v9 stringWithFormat:@" \"%@\"", v10];
    [v7 appendString:v11];
  }
  char v12 = [a1 canonicalDestinationsForContact:v4];
  id v13 = [v12 componentsJoinedByString:@", "];

  if ([v13 length])
  {
    int v14 = NSString;
    id v15 = TCSLogSafeDescription(v13);
    int v16 = [v14 stringWithFormat:@" [%@]", v15];
    [v7 appendString:v16];
  }
  long long v17 = [NSString stringWithString:v7];

  return v17;
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (void)setDefaults:(id)a3
{
}

- (BOOL)shouldObserveAllowlistDefaultChanges
{
  return self->_shouldObserveAllowlistDefaultChanges;
}

- (NSMutableDictionary)allowlist
{
  return self->_allowlist;
}

- (void)setAllowlist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowlist, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_allowlistSaveTimer, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setDestinationAsAccepted:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_0();
  id v4 = TCSLogSafeDescription(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_21E834000, v5, v6, "%s: attempt to mark destination [%@] as allowed, but it does not exist in the destination list.", v7, v8, v9, v10, 2u);
}

- (void)setDestinationAsAccepted:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_0();
  id v4 = TCSLogSafeDescription(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_21E834000, v5, v6, "%s: attempt to mark destination [%@] as allowed, which it already was.", v7, v8, v9, v10, 2u);
}

- (void)_didInitiateCallToDestination:(void *)a1 date:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_0();
  id v4 = TCSLogSafeDescription(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_21E834000, v5, v6, "%s called with disallowed destination: %@", v7, v8, v9, v10, 2u);
}

- (void)_didReceiveCallFromDestination:(void *)a1 date:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_0();
  id v4 = TCSLogSafeDescription(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_21E834000, v5, v6, "%s called with disallowed destination: %@", v7, v8, v9, v10, 2u);
}

- (void)dateAddedForDestination:(void *)a1 .cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_0();
  id v4 = TCSLogSafeDescription(v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E834000, v1, v5, "TCSContacts was asked for date-added info for unallowed destination: %@", v6);
}

+ (void)_unifiedMeContactFromContactStore:keysToFetch:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E834000, v0, v1, "Error fetching me contact: %@", v2);
}

+ (void)_unifiedContactWithIdentifier:(void *)a3 orDestination:usingContactStore:keysToFetch:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v11 = TCSLogSafeDescription(a3);
  OUTLINED_FUNCTION_5(&dword_21E834000, v5, v6, "Cannot perform contact lookup using ID:%@ destination:%@", v7, v8, v9, v10, 2u);
}

+ (void)_unifiedContactWithIdentifier:(void *)a1 orDestination:usingContactStore:keysToFetch:.cold.2(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_0();
  id v4 = TCSLogSafeDescription(v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E834000, v1, v5, "Contact lookups for phone number handles containing pause characters is broken, skipping: %@", v6);
}

+ (void)_unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E834000, v0, v1, "Error fetching contacts: %@", v2);
}

+ (void)_unknownContactWithDestination:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E834000, v0, v1, "Cannot create an unknown contact with destination: %@", v2);
}

+ (void)_contact:(void *)a1 hasKeysForFormatterStye:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = TCSLogSafeDescription(a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_21E834000, v5, v6, "%@ missing keys to use name formatter style %ld!", v7, v8, v9, v10, v11);
}

@end