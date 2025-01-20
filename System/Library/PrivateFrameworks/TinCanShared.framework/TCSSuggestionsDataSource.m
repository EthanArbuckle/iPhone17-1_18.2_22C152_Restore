@interface TCSSuggestionsDataSource
+ (id)descriptorForRequiredKeys;
- (BOOL)hasSuggestions;
- (NSArray)suggestedContacts;
- (TCSSuggestions)suggestions;
- (TCSSuggestionsDataSource)initWithSuggestions:(id)a3;
- (TCSSuggestionsDataSourceDelegate)delegate;
- (id)_sortedContactsArrayFromArray:(id)a3;
- (void)_handleDeviceFirstUnlock;
- (void)_handlePersonNamePreferencesChangeNotification;
- (void)_invalidate;
- (void)_notifyDelegateSuggestionsChanged;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSuggestedContacts:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)suggestionsDidChange:(id)a3;
@end

@implementation TCSSuggestionsDataSource

- (TCSSuggestionsDataSource)initWithSuggestions:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TCSSuggestionsDataSource;
  v6 = [(TCSSuggestionsDataSource *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestions, a3);
    [(TCSSuggestions *)v7->_suggestions addObserver:v7];
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__handleContactStoreDidChange_ name:*MEMORY[0x263EFE118] object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_TCSSuggestionsDataSourcePersonNamePreferencesChangeHandler, (CFStringRef)*MEMORY[0x263F50748], 0, (CFNotificationSuspensionBehavior)0);
    if (!+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot])
    {
      _TCSInitializeLogging();
      v10 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_21E834000, v10, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource will need to wait for first device unlock before it can generate Walkie-Talkie suggested contacts for display.", v13, 2u);
      }
      v11 = +[TCSBehavior sharedBehavior];
      [v8 addObserver:v7 selector:sel__handleDeviceFirstUnlock name:@"TCSFirstUnlockNotification" object:v11];
    }
  }

  return v7;
}

- (void)dealloc
{
  [(TCSSuggestions *)self->_suggestions removeObserver:self];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)TCSSuggestionsDataSource;
  [(TCSSuggestionsDataSource *)&v5 dealloc];
}

- (BOOL)hasSuggestions
{
  v2 = [(TCSSuggestionsDataSource *)self suggestedContacts];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)suggestedContacts
{
  v2 = self;
  uint64_t v65 = *MEMORY[0x263EF8340];
  suggestedContacts = self->_suggestedContacts;
  if (!suggestedContacts)
  {
    v4 = [(TCSSuggestions *)v2->_suggestions suggestedDestinations];
    objc_super v5 = (void *)[v4 copy];

    v48 = [MEMORY[0x263EFF9A0] dictionary];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v56 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          v11 = v2;
          v12 = [(TCSSuggestions *)v2->_suggestions contactStore];
          v13 = +[TCSSuggestionsDataSource descriptorForRequiredKeys];
          v63 = v13;
          objc_super v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
          v15 = +[TCSContacts _unifiedContactWithIdentifier:0 orDestination:v10 usingContactStore:v12 keysToFetch:v14];

          if (v15)
          {
            v16 = [v15 identifier];
            [v48 setValue:v15 forKey:v16];
          }
          v2 = v11;
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
      }
      while (v7);
    }

    v17 = (void *)MEMORY[0x263EFF9C0];
    v18 = [v48 allValues];
    v19 = [v17 setWithArray:v18];

    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __45__TCSSuggestionsDataSource_suggestedContacts__block_invoke;
    v54[3] = &unk_2644C8FB0;
    v54[4] = v2;
    v46 = [v19 objectsPassingTest:v54];
    objc_msgSend(v19, "minusSet:");
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __45__TCSSuggestionsDataSource_suggestedContacts__block_invoke_2;
    v53[3] = &unk_2644C8FB0;
    v53[4] = v2;
    v20 = [v19 objectsPassingTest:v53];
    [v19 minusSet:v20];
    v21 = [(TCSSuggestions *)v2->_suggestions contactStore];
    v22 = +[TCSSuggestionsDataSource descriptorForRequiredKeys];
    v62 = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
    v24 = +[TCSContacts _unifiedMeContactFromContactStore:v21 keysToFetch:v23];

    if ([v19 containsObject:v24])
    {
      _TCSInitializeLogging();
      v25 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E834000, v25, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource is omitting the Me card from suggested contacts.", buf, 2u);
      }
      [v19 removeObject:v24];
    }
    v26 = [v19 allObjects];
    uint64_t v27 = [(TCSSuggestionsDataSource *)v2 _sortedContactsArrayFromArray:v26];
    v28 = v2->_suggestedContacts;
    v2->_suggestedContacts = (NSArray *)v27;

    uint64_t v29 = [(NSArray *)v2->_suggestedContacts count];
    _TCSInitializeLogging();
    v30 = TCSLogDefault;
    BOOL v31 = os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      v42 = v24;
      v43 = v20;
      v44 = v19;
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E834000, v30, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource has suggested contacts:", buf, 2u);
      }
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v45 = v2;
      v32 = v2->_suggestedContacts;
      uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v49 objects:v61 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v50 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v49 + 1) + 8 * j);
            _TCSInitializeLogging();
            v38 = (void *)TCSLogDefault;
            if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
            {
              v39 = v38;
              v40 = +[TCSContacts _safeContactDetailStringForLogging:v37];
              *(_DWORD *)buf = 138412290;
              v60 = v40;
              _os_log_impl(&dword_21E834000, v39, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
            }
          }
          uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v49 objects:v61 count:16];
        }
        while (v34);
      }

      v19 = v44;
      v2 = v45;
      v24 = v42;
      v20 = v43;
    }
    else if (v31)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E834000, v30, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource has no suggested contacts to display.", buf, 2u);
    }

    suggestedContacts = v2->_suggestedContacts;
  }
  return suggestedContacts;
}

uint64_t __45__TCSSuggestionsDataSource_suggestedContacts__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  v4 = [v2 contacts];
  uint64_t v5 = [v4 isContactAccepted:v3];

  return v5;
}

BOOL __45__TCSSuggestionsDataSource_suggestedContacts__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  v4 = [v2 contacts];
  uint64_t v5 = [v4 stateForContact:v3];

  return v5 == 4;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_5 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_5, &__block_literal_global_3);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_5;
  return v2;
}

void __53__TCSSuggestionsDataSource_descriptorForRequiredKeys__block_invoke()
{
  v8[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFE9F8];
  v1 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
  v8[0] = v1;
  v2 = [MEMORY[0x263EFE9F8] descriptorForAllComparatorKeys];
  uint64_t v3 = *MEMORY[0x263EFE070];
  v8[1] = v2;
  v8[2] = v3;
  v8[3] = *MEMORY[0x263EFDF80];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];
  uint64_t v5 = [NSString stringWithUTF8String:"+[TCSSuggestionsDataSource descriptorForRequiredKeys]_block_invoke"];
  uint64_t v6 = [v0 descriptorWithKeyDescriptors:v4 description:v5];
  uint64_t v7 = (void *)descriptorForRequiredKeys_cn_once_object_5;
  descriptorForRequiredKeys_cn_once_object_5 = v6;
}

- (void)suggestionsDidChange:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__TCSSuggestionsDataSource_suggestionsDidChange___block_invoke;
  v3[3] = &unk_2644C8B50;
  v3[4] = self;
  TCSGuaranteeMainThread(v3);
}

uint64_t __49__TCSSuggestionsDataSource_suggestionsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  suggestedContacts = self->_suggestedContacts;
  self->_suggestedContacts = 0;

  [(TCSSuggestionsDataSource *)self _notifyDelegateSuggestionsChanged];
}

- (void)_notifyDelegateSuggestionsChanged
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 suggestedContactsDidChange:self];
  }
}

- (id)_sortedContactsArrayFromArray:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFEA78];
  id v4 = a3;
  char v5 = [v3 sharedDefaults];
  uint64_t v6 = [v5 sortOrder];

  uint64_t v7 = [MEMORY[0x263EFE9F8] comparatorForNameSortOrder:v6];
  uint64_t v8 = [v4 sortedArrayUsingComparator:v7];

  return v8;
}

- (void)_handlePersonNamePreferencesChangeNotification
{
  uint64_t v3 = [(TCSSuggestionsDataSource *)self _sortedContactsArrayFromArray:self->_suggestedContacts];
  suggestedContacts = self->_suggestedContacts;
  self->_suggestedContacts = v3;

  [(TCSSuggestionsDataSource *)self _notifyDelegateSuggestionsChanged];
}

- (void)_handleDeviceFirstUnlock
{
  _TCSInitializeLogging();
  uint64_t v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource was notified of first device unlock.", v4, 2u);
  }
  [(TCSSuggestionsDataSource *)self _invalidate];
}

- (TCSSuggestionsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TCSSuggestionsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TCSSuggestions)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (void)setSuggestedContacts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end