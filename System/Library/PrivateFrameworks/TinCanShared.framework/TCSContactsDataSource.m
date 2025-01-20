@interface TCSContactsDataSource
+ (id)descriptorForRequiredKeys;
- (BOOL)_contactArray:(id)a3 differsFromArray:(id)a4;
- (BOOL)isContactAllowed:(id)a3;
- (BOOL)isContactAnInviter:(id)a3;
- (CNContactStore)contactStore;
- (NSArray)sortedContacts;
- (NSArray)sortedInvitees;
- (NSArray)sortedInviters;
- (TCSContacts)contacts;
- (TCSContactsDataSource)initWithContactStore:(id)a3 contacts:(id)a4;
- (TCSContactsDataSourceDelegate)delegate;
- (id)_contactMapFromArray:(id)a3;
- (id)_contactsForSection:(int64_t)a3;
- (id)_sortedContactsArrayFromArray:(id)a3;
- (id)_sortedContactsArrayFromArray:(id)a3 forSection:(int64_t)a4;
- (id)_unsortedContactsArray;
- (id)contactWithIdentifier:(id)a3;
- (int64_t)_sectionForContact:(id)a3;
- (int64_t)inviteContact:(id)a3;
- (unint64_t)sectionCount;
- (void)_handleContactStoreDidChange:(id)a3;
- (void)_handleDeviceFirstUnlock;
- (void)_handlePersonNamePreferencesChangeNotification;
- (void)_notifyDelegateContactsChanged;
- (void)_notifyDelegateRecencyChanged;
- (void)_updateSortedContactsAndNotifyIfChanged:(BOOL)a3;
- (void)contactBecameAccepted:(id)a3;
- (void)dealloc;
- (void)destinationsDidChange:(id)a3;
- (void)logSortedContacts;
- (void)recencyDidChange:(id)a3;
- (void)removeContact:(id)a3;
- (void)removeContact:(id)a3 inSection:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setSortedContacts:(id)a3;
- (void)setSortedInvitees:(id)a3;
- (void)setSortedInviters:(id)a3;
@end

@implementation TCSContactsDataSource

- (TCSContactsDataSource)initWithContactStore:(id)a3 contacts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TCSContactsDataSource;
  v9 = [(TCSContactsDataSource *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_contacts, a4);
    [(TCSContacts *)v10->_contacts addObserver:v10];
    objc_initWeak(&location, v10);
    v11 = (const char *)[(id)*MEMORY[0x263F50748] UTF8String];
    v12 = MEMORY[0x263EF83A0];
    id v13 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __55__TCSContactsDataSource_initWithContactStore_contacts___block_invoke;
    handler[3] = &unk_2644C8BE8;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v11, &v10->_namePrefChangeToken, v12, handler);

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v10 selector:sel__handleContactStoreDidChange_ name:*MEMORY[0x263EFE118] object:0];
    if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot])
    {
      [(TCSContactsDataSource *)v10 _updateSortedContactsAndNotifyIfChanged:0];
    }
    else
    {
      _TCSInitializeLogging();
      v15 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_21E834000, v15, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource will need to wait for first device unlock before it can generate Walkie-Talkie contacts for display.", v18, 2u);
      }
      v16 = +[TCSBehavior sharedBehavior];
      [v14 addObserver:v10 selector:sel__handleDeviceFirstUnlock name:@"TCSFirstUnlockNotification" object:v16];
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __55__TCSContactsDataSource_initWithContactStore_contacts___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[14] == a2)
  {
    v4 = WeakRetained;
    [WeakRetained _handlePersonNamePreferencesChangeNotification];
    WeakRetained = v4;
  }
}

- (void)dealloc
{
  [(TCSContacts *)self->_contacts removeObserver:self];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_namePrefChangeToken);
  v4.receiver = self;
  v4.super_class = (Class)TCSContactsDataSource;
  [(TCSContactsDataSource *)&v4 dealloc];
}

- (unint64_t)sectionCount
{
  NSUInteger v3 = [(NSArray *)self->_sortedContacts count];
  NSUInteger v4 = [(NSArray *)self->_sortedInviters count];
  uint64_t v5 = 1;
  if (v3) {
    uint64_t v5 = 2;
  }
  if (v4) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v3 != 0;
  }
  if ([(NSArray *)self->_sortedInvitees count]) {
    return v6 + 1;
  }
  else {
    return v6;
  }
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1, &__block_literal_global_0);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1;
  return v2;
}

void __50__TCSContactsDataSource_descriptorForRequiredKeys__block_invoke()
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
  NSUInteger v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];
  uint64_t v5 = [NSString stringWithUTF8String:"+[TCSContactsDataSource descriptorForRequiredKeys]_block_invoke"];
  uint64_t v6 = [v0 descriptorWithKeyDescriptors:v4 description:v5];
  id v7 = (void *)descriptorForRequiredKeys_cn_once_object_1;
  descriptorForRequiredKeys_cn_once_object_1 = v6;
}

- (int64_t)inviteContact:(id)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TCSContactsDataSource *)self sortedInvitees];
  uint64_t v6 = (void *)[v5 mutableCopy];

  if (![v6 containsObject:v4])
  {
    id v8 = [(TCSContactsDataSource *)self sortedInviters];
    int v9 = [v8 containsObject:v4];

    if (v9)
    {
      _TCSInitializeLogging();
      v10 = (void *)TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
        -[TCSContactsDataSource inviteContact:](v10);
      }
      goto LABEL_10;
    }
    v11 = [(TCSContactsDataSource *)self sortedContacts];
    int v12 = [v11 containsObject:v4];

    if (v12)
    {
      _TCSInitializeLogging();
      id v13 = (void *)TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
        -[TCSContactsDataSource inviteContact:](v13);
      }
      goto LABEL_10;
    }
    v16 = +[TCSContactsDataSource descriptorForRequiredKeys];
    v36[0] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];

    if ([v4 areKeysAvailable:v17])
    {
      v18 = v4;
    }
    else
    {
      contactStore = self->_contactStore;
      id v20 = [v4 identifier];
      id v33 = 0;
      v18 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v20 keysToFetch:v17 error:&v33];
      id v21 = v33;

      if (v21)
      {
        _TCSInitializeLogging();
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
          -[TCSContactsDataSource inviteContact:].cold.4();
        }

        int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_21;
      }
    }
    [v6 addObject:v18];
    objc_super v22 = [(TCSContactsDataSource *)self _sortedContactsArrayFromArray:v6];
    sortedInvitees = self->_sortedInvitees;
    self->_sortedInvitees = v22;

    v24 = [(TCSContactsDataSource *)self _contactMapFromArray:self->_sortedInvitees];
    inviteeContactMap = self->_inviteeContactMap;
    self->_inviteeContactMap = v24;

    allowedContactIdentifiers = self->_allowedContactIdentifiers;
    v27 = [v18 identifier];
    [(NSMutableSet *)allowedContactIdentifiers addObject:v27];

    _TCSInitializeLogging();
    v28 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = +[TCSContacts _safeContactDetailStringForLogging:v18];
      *(_DWORD *)buf = 138412290;
      v35 = v30;
      _os_log_impl(&dword_21E834000, v29, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource added an invited contact %@", buf, 0xCu);
    }
    [(TCSContacts *)self->_contacts removeObserver:self];
    contacts = self->_contacts;
    v32 = +[TCSContacts canonicalDestinationsForContact:v18];
    [(TCSContacts *)contacts addDestinations:v32];

    [(TCSContacts *)self->_contacts addObserver:self];
    int64_t v14 = [(NSArray *)self->_sortedInvitees indexOfObject:v18];
LABEL_21:

    id v4 = v18;
    goto LABEL_11;
  }
  _TCSInitializeLogging();
  id v7 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
    -[TCSContactsDataSource inviteContact:](v7);
  }
LABEL_10:
  int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v14;
}

- (void)removeContact:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TCSContactsDataSource *)self _sectionForContact:v4];
  if (v5 == -1)
  {
    _TCSInitializeLogging();
    uint64_t v6 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSContactsDataSource removeContact:](v6);
    }
  }
  else
  {
    [(TCSContactsDataSource *)self removeContact:v4 inSection:v5];
  }
}

- (void)removeContact:(id)a3 inSection:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(TCSContactsDataSource *)self _contactsForSection:a4];
  id v8 = (void *)[v7 mutableCopy];

  if ([v8 containsObject:v6])
  {
    [v8 removeObject:v6];
    if (a4 == 2)
    {
      int64_t v14 = (NSArray *)[v8 copy];
      sortedInvitees = self->_sortedInvitees;
      self->_sortedInvitees = v14;

      v16 = [(TCSContactsDataSource *)self _contactMapFromArray:self->_sortedInvitees];
      inviteeContactMap = self->_inviteeContactMap;
      self->_inviteeContactMap = v16;
    }
    else if (a4 == 1)
    {
      v17 = (NSArray *)[v8 copy];
      sortedInviters = self->_sortedInviters;
      self->_sortedInviters = v17;

      v19 = [(TCSContactsDataSource *)self _contactMapFromArray:self->_sortedInviters];
      inviteeContactMap = self->_inviterContactMap;
      self->_inviterContactMap = v19;
    }
    else
    {
      if (a4)
      {
LABEL_11:
        allowedContactIdentifiers = self->_allowedContactIdentifiers;
        id v21 = [v6 identifier];
        [(NSMutableSet *)allowedContactIdentifiers removeObject:v21];

        inviterContactIdentifiers = self->_inviterContactIdentifiers;
        v23 = [v6 identifier];
        [(NSMutableSet *)inviterContactIdentifiers removeObject:v23];

        _TCSInitializeLogging();
        v24 = (void *)TCSLogDefault;
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          v25 = v24;
          v26 = +[TCSContacts _safeContactDetailStringForLogging:v6];
          int v29 = 138412290;
          v30 = v26;
          _os_log_impl(&dword_21E834000, v25, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource removed contact %@", (uint8_t *)&v29, 0xCu);
        }
        [(TCSContacts *)self->_contacts removeObserver:self];
        contacts = self->_contacts;
        v28 = +[TCSContacts canonicalDestinationsForContact:v6];
        [(TCSContacts *)contacts removeDestinations:v28];

        [(TCSContacts *)self->_contacts addObserver:self];
        [(TCSContactsDataSource *)self _updateSortedContactsAndNotifyIfChanged:0];
        goto LABEL_14;
      }
      int v9 = (NSArray *)[v8 copy];
      sortedContacts = self->_sortedContacts;
      self->_sortedContacts = v9;

      v11 = [(TCSContactsDataSource *)self _contactMapFromArray:self->_sortedContacts];
      inviteeContactMap = self->_allowedContactMap;
      self->_allowedContactMap = v11;
    }

    goto LABEL_11;
  }
  _TCSInitializeLogging();
  id v13 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
    -[TCSContactsDataSource removeContact:](v13);
  }
LABEL_14:
}

- (BOOL)isContactAllowed:(id)a3
{
  allowedContactIdentifiers = self->_allowedContactIdentifiers;
  id v4 = [a3 identifier];
  LOBYTE(allowedContactIdentifiers) = [(NSMutableSet *)allowedContactIdentifiers containsObject:v4];

  return (char)allowedContactIdentifiers;
}

- (BOOL)isContactAnInviter:(id)a3
{
  inviterContactIdentifiers = self->_inviterContactIdentifiers;
  id v4 = [a3 identifier];
  LOBYTE(inviterContactIdentifiers) = [(NSMutableSet *)inviterContactIdentifiers containsObject:v4];

  return (char)inviterContactIdentifiers;
}

- (id)contactWithIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NSDictionary *)self->_allowedContactMap objectForKeyedSubscript:v4];
  if (!v5)
  {
    int64_t v5 = [(NSDictionary *)self->_inviterContactMap objectForKeyedSubscript:v4];
    if (!v5)
    {
      int64_t v5 = [(NSDictionary *)self->_inviteeContactMap objectForKeyedSubscript:v4];
      if (!v5)
      {
        _TCSInitializeLogging();
        id v6 = (void *)TCSLogDefault;
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
          -[TCSContactsDataSource contactWithIdentifier:](v6, v4);
        }
        int64_t v5 = 0;
      }
    }
  }

  return v5;
}

- (void)logSortedContacts
{
  v2 = self;
  uint64_t v54 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [(NSArray *)self->_sortedContacts count];
  NSUInteger v4 = [(NSArray *)v2->_sortedInviters count] + v3;
  if (v4 + [(NSArray *)v2->_sortedInvitees count])
  {
    v36 = v2;
    if ([(NSArray *)v2->_sortedContacts count])
    {
      _TCSInitializeLogging();
      id v6 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E834000, v6, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource has allowed contacts:", buf, 2u);
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v7 = v2->_sortedContacts;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v46 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            _TCSInitializeLogging();
            id v13 = (void *)TCSLogDefault;
            if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
            {
              int64_t v14 = v13;
              v15 = +[TCSContacts _safeContactDetailStringForLogging:v12];
              *(_DWORD *)buf = 138412290;
              v52 = v15;
              _os_log_impl(&dword_21E834000, v14, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
            }
          }
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v9);
      }

      v2 = v36;
    }
    if ([(NSArray *)v2->_sortedInviters count])
    {
      _TCSInitializeLogging();
      v16 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E834000, v16, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource has contacts with unresolved incoming invites:", buf, 2u);
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v17 = v2->_sortedInviters;
      uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v42 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * j);
            _TCSInitializeLogging();
            v23 = (void *)TCSLogDefault;
            if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
            {
              v24 = v23;
              v25 = +[TCSContacts _safeContactDetailStringForLogging:v22];
              *(_DWORD *)buf = 138412290;
              v52 = v25;
              _os_log_impl(&dword_21E834000, v24, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
            }
          }
          uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v19);
      }

      v2 = v36;
    }
    if ([(NSArray *)v2->_sortedInvitees count])
    {
      _TCSInitializeLogging();
      v26 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E834000, v26, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource has contacts with unresolved outgoing invites:", buf, 2u);
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v27 = v2->_sortedInvitees;
      uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v38;
        do
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v38 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v37 + 1) + 8 * k);
            _TCSInitializeLogging();
            id v33 = (void *)TCSLogDefault;
            if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
            {
              v34 = v33;
              v35 = +[TCSContacts _safeContactDetailStringForLogging:v32];
              *(_DWORD *)buf = 138412290;
              v52 = v35;
              _os_log_impl(&dword_21E834000, v34, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
            }
          }
          uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v37 objects:v49 count:16];
        }
        while (v29);
      }
    }
  }
  else
  {
    _TCSInitializeLogging();
    int64_t v5 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E834000, v5, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource has no contacts to display.", buf, 2u);
    }
  }
}

- (void)destinationsDidChange:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__TCSContactsDataSource_destinationsDidChange___block_invoke;
  v3[3] = &unk_2644C8B50;
  v3[4] = self;
  TCSGuaranteeMainThread(v3);
}

uint64_t __47__TCSContactsDataSource_destinationsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSortedContactsAndNotifyIfChanged:1];
}

- (void)recencyDidChange:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__TCSContactsDataSource_recencyDidChange___block_invoke;
  v3[3] = &unk_2644C8B50;
  v3[4] = self;
  TCSGuaranteeMainThread(v3);
}

uint64_t __42__TCSContactsDataSource_recencyDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSortedContactsAndNotifyIfChanged:0];
  v2 = *(void **)(a1 + 32);
  return [v2 _notifyDelegateRecencyChanged];
}

- (void)contactBecameAccepted:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__TCSContactsDataSource_contactBecameAccepted___block_invoke;
  v6[3] = &unk_2644C8C60;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  TCSGuaranteeMainThread(v6);
}

uint64_t __47__TCSContactsDataSource_contactBecameAccepted___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _TCSInitializeLogging();
  v2 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = v2;
    id v5 = +[TCSContacts _safeContactDetailStringForLogging:v3];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_21E834000, v4, OS_LOG_TYPE_DEFAULT, "Contact was promoted to the allowlist: %@", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 40) _updateSortedContactsAndNotifyIfChanged:1];
}

- (id)_contactMapFromArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "identifier", (void)v14);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];
  return v12;
}

- (void)_updateSortedContactsAndNotifyIfChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = [(TCSContactsDataSource *)self _unsortedContactsArray];
  uint64_t v6 = [(TCSContactsDataSource *)self _sortedContactsArrayFromArray:v5 forSection:0];
  uint64_t v7 = [(TCSContactsDataSource *)self _sortedContactsArrayFromArray:v5 forSection:1];
  uint64_t v8 = [(TCSContactsDataSource *)self _sortedContactsArrayFromArray:v5 forSection:2];
  sortedContacts = self->_sortedContacts;
  if (sortedContacts
    && ![(TCSContactsDataSource *)self _contactArray:sortedContacts differsFromArray:v6])
  {
    int v12 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_sortedContacts, v6);
    uint64_t v10 = [(TCSContactsDataSource *)self _contactMapFromArray:v6];
    allowedContactMap = self->_allowedContactMap;
    self->_allowedContactMap = v10;

    int v12 = 1;
  }
  sortedInviters = self->_sortedInviters;
  if (!sortedInviters
    || [(TCSContactsDataSource *)self _contactArray:sortedInviters differsFromArray:v7])
  {
    objc_storeStrong((id *)&self->_sortedInviters, v7);
    long long v14 = [(TCSContactsDataSource *)self _contactMapFromArray:v7];
    inviterContactMap = self->_inviterContactMap;
    self->_inviterContactMap = v14;

    int v12 = 1;
  }
  sortedInvitees = self->_sortedInvitees;
  if (sortedInvitees
    && ![(TCSContactsDataSource *)self _contactArray:sortedInvitees differsFromArray:v8])
  {
    if (!v12) {
      goto LABEL_35;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_sortedInvitees, v8);
    long long v17 = [(TCSContactsDataSource *)self _contactMapFromArray:v8];
    inviteeContactMap = self->_inviteeContactMap;
    self->_inviteeContactMap = v17;
  }
  long long v44 = v7;
  BOOL v45 = v3;
  long long v46 = v6;
  uint64_t v19 = [MEMORY[0x263EFF9C0] set];
  allowedContactIdentifiers = self->_allowedContactIdentifiers;
  self->_allowedContactIdentifiers = v19;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v21 = self->_sortedContacts;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = self->_allowedContactIdentifiers;
        v27 = [*(id *)(*((void *)&v55 + 1) + 8 * i) identifier];
        [(NSMutableSet *)v26 addObject:v27];
      }
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v23);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v28 = self->_sortedInvitees;
  uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = self->_allowedContactIdentifiers;
        v34 = [*(id *)(*((void *)&v51 + 1) + 8 * j) identifier];
        [(NSMutableSet *)v33 addObject:v34];
      }
      uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v30);
  }

  v35 = [MEMORY[0x263EFF9C0] set];
  inviterContactIdentifiers = self->_inviterContactIdentifiers;
  self->_inviterContactIdentifiers = v35;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v37 = self->_sortedInviters;
  uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v48 != v40) {
          objc_enumerationMutation(v37);
        }
        long long v42 = self->_inviterContactIdentifiers;
        long long v43 = [*(id *)(*((void *)&v47 + 1) + 8 * k) identifier];
        [(NSMutableSet *)v42 addObject:v43];
      }
      uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v39);
  }

  [(TCSContactsDataSource *)self logSortedContacts];
  uint64_t v6 = v46;
  uint64_t v7 = v44;
  if (v45) {
    [(TCSContactsDataSource *)self _notifyDelegateContactsChanged];
  }
LABEL_35:
}

- (void)_notifyDelegateContactsChanged
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 contactsDidChange:self];
  }
}

- (void)_notifyDelegateRecencyChanged
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 recencyDidChange:self];
  }
}

- (id)_unsortedContactsArray
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v3 = [(TCSContacts *)self->_contacts destinations];
  id v4 = (void *)[v3 copy];

  uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = [(TCSContactsDataSource *)self contactStore];
        v11 = +[TCSContactsDataSource descriptorForRequiredKeys];
        uint64_t v23 = v11;
        int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
        id v13 = +[TCSContacts _unifiedContactWithIdentifier:0 orDestination:v9 usingContactStore:v10 keysToFetch:v12];

        if (v13)
        {
          long long v14 = [v13 identifier];
          [v18 setValue:v13 forKey:v14];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  long long v15 = [v18 allValues];

  return v15;
}

- (id)_sortedContactsArrayFromArray:(id)a3 forSection:(int64_t)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F08A98];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __66__TCSContactsDataSource__sortedContactsArrayFromArray_forSection___block_invoke;
  long long v14 = &unk_2644C8C88;
  long long v15 = self;
  int64_t v16 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 predicateWithBlock:&v11];
  uint64_t v8 = objc_msgSend(v6, "filteredArrayUsingPredicate:", v7, v11, v12, v13, v14, v15, v16);

  uint64_t v9 = [(TCSContactsDataSource *)self _sortedContactsArrayFromArray:v8];

  return v9;
}

BOOL __66__TCSContactsDataSource__sortedContactsArrayFromArray_forSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) stateForContact:a2];
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = v3 == 4;
  BOOL v6 = v3 == 3;
  if (v4) {
    BOOL v6 = 0;
  }
  if (v4 != 1) {
    BOOL v5 = v6;
  }
  if (v4 == 2) {
    return (unint64_t)(v3 - 1) < 2;
  }
  else {
    return v5;
  }
}

- (id)_sortedContactsArrayFromArray:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFEA78];
  id v4 = a3;
  BOOL v5 = [v3 sharedDefaults];
  uint64_t v6 = [v5 sortOrder];

  uint64_t v7 = [MEMORY[0x263EFE9F8] comparatorForNameSortOrder:v6];
  uint64_t v8 = [v4 sortedArrayUsingComparator:v7];

  return v8;
}

- (id)_contactsForSection:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = [(TCSContactsDataSource *)self sortedInvitees];
  }
  else if (a3 == 1)
  {
    uint64_t v3 = [(TCSContactsDataSource *)self sortedInviters];
  }
  else if (a3)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(TCSContactsDataSource *)self sortedContacts];
  }
  return v3;
}

- (int64_t)_sectionForContact:(id)a3
{
  id v4 = a3;
  allowedContactMap = self->_allowedContactMap;
  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [(NSDictionary *)allowedContactMap objectForKeyedSubscript:v6];

  if (v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    inviterContactMap = self->_inviterContactMap;
    uint64_t v10 = [v4 identifier];
    uint64_t v11 = [(NSDictionary *)inviterContactMap objectForKeyedSubscript:v10];

    if (v11)
    {
      int64_t v8 = 1;
    }
    else
    {
      inviteeContactMap = self->_inviteeContactMap;
      id v13 = [v4 identifier];
      long long v14 = [(NSDictionary *)inviteeContactMap objectForKeyedSubscript:v13];

      if (v14) {
        int64_t v8 = 2;
      }
      else {
        int64_t v8 = -1;
      }
    }
  }

  return v8;
}

- (BOOL)_contactArray:(id)a3 differsFromArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 != [v6 count])
  {
LABEL_12:
    BOOL v14 = 1;
    goto LABEL_13;
  }
  if ([v5 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [v5 objectAtIndexedSubscript:v8];
      uint64_t v10 = [v6 objectAtIndexedSubscript:v8];
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      int v12 = objc_opt_isKindOfClass();
      int v13 = v12;
      if (((isKindOfClass & 1) == 0
         || (v12 & 1) == 0
         || !+[TCSContacts _isUnknownContact:equalToUnknownContact:](TCSContacts, "_isUnknownContact:equalToUnknownContact:", v9, v10))&& (((isKindOfClass | v13) & 1) != 0 || ([v9 isEqual:v10] & 1) == 0))
      {
        break;
      }

      if (++v8 >= (unint64_t)[v5 count]) {
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
LABEL_10:
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (void)_handleContactStoreDidChange:(id)a3
{
}

- (void)_handlePersonNamePreferencesChangeNotification
{
}

- (void)_handleDeviceFirstUnlock
{
  _TCSInitializeLogging();
  uint64_t v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource was notified of first device unlock.", v4, 2u);
  }
  [(TCSContactsDataSource *)self _updateSortedContactsAndNotifyIfChanged:1];
}

- (TCSContactsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TCSContactsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (TCSContacts)contacts
{
  return self->_contacts;
}

- (NSArray)sortedContacts
{
  return self->_sortedContacts;
}

- (void)setSortedContacts:(id)a3
{
}

- (NSArray)sortedInviters
{
  return self->_sortedInviters;
}

- (void)setSortedInviters:(id)a3
{
}

- (NSArray)sortedInvitees
{
  return self->_sortedInvitees;
}

- (void)setSortedInvitees:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedInvitees, 0);
  objc_storeStrong((id *)&self->_sortedInviters, 0);
  objc_storeStrong((id *)&self->_sortedContacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inviteeContactMap, 0);
  objc_storeStrong((id *)&self->_inviterContactMap, 0);
  objc_storeStrong((id *)&self->_allowedContactMap, 0);
  objc_storeStrong((id *)&self->_inviterContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)inviteContact:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "_safeContactDetailStringForLogging:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E834000, v4, v5, "Attempt to add an invited contact that was already marked as such: %@", v6, v7, v8, v9, v10);
}

- (void)inviteContact:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "_safeContactDetailStringForLogging:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E834000, v4, v5, "Attempt to add an invited contact that has a pending remote invite awaiting user response: %@", v6, v7, v8, v9, v10);
}

- (void)inviteContact:(void *)a1 .cold.3(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "_safeContactDetailStringForLogging:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E834000, v4, v5, "Attempt to add an invited contact that is already allowed: %@", v6, v7, v8, v9, v10);
}

- (void)inviteContact:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21E834000, v0, OS_LOG_TYPE_ERROR, "Error remaking contact: %@", v1, 0xCu);
}

- (void)removeContact:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "_safeContactDetailStringForLogging:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E834000, v4, v5, "Attempt to remove a contact not contained within the contacts data source: %@", v6, v7, v8, v9, v10);
}

- (void)contactWithIdentifier:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = TCSLogSafeDescription(a2);
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21E834000, v3, OS_LOG_TYPE_ERROR, "Map lookup for contact identifier %@ did not find any contact.", v5, 0xCu);
}

@end