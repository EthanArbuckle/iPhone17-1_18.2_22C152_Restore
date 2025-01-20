@interface AccountUtilities
+ (id)sharedAccountUtilities;
- (ACAccountStore)accountStore;
- (AccountUtilities)init;
- (BOOL)localNotesExist;
- (NSLock)updateAccountInfosLock;
- (OS_dispatch_group)backgroundDispatchGroup;
- (id)accountIDsEnabledForNotes;
- (id)accountsEnabledForNotes;
- (id)defaultStoreSyncIdWithDesiredSyncId:(id)a3;
- (id)freshContext;
- (id)localAccountDisplayName;
- (void)_accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)setAccountStore:(id)a3;
- (void)setBackgroundDispatchGroup:(id)a3;
- (void)setUpdateAccountInfosLock:(id)a3;
- (void)startKeepingAccountInfosUpToDate;
- (void)updateAccountInfos;
@end

@implementation AccountUtilities

uint64_t __42__AccountUtilities_sharedAccountUtilities__block_invoke()
{
  sharedAccountUtilities___sharedInstance = objc_alloc_init(AccountUtilities);
  return MEMORY[0x1F41817F8]();
}

- (AccountUtilities)init
{
  v13.receiver = self;
  v13.super_class = (Class)AccountUtilities;
  v2 = [(AccountUtilities *)&v13 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    backgroundDispatchGroup = v2->_backgroundDispatchGroup;
    v2->_backgroundDispatchGroup = (OS_dispatch_group *)v3;

    uint64_t v5 = [MEMORY[0x1E4F179C8] defaultStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v5;

    uint64_t v7 = [(ACAccountStore *)v2->_accountStore accountIdentifiersEnabledForDataclass:*MEMORY[0x1E4F175F0]];
    accountIDsEnabledForNotes = v2->_accountIDsEnabledForNotes;
    v2->_accountIDsEnabledForNotes = (NSArray *)v7;

    noteContext = v2->_noteContext;
    v2->_noteContext = 0;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    updateAccountInfosLock = v2->_updateAccountInfosLock;
    v2->_updateAccountInfosLock = v10;
  }
  return v2;
}

- (void)startKeepingAccountInfosUpToDate
{
  dispatch_group_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__accountStoreDidChange_ name:*MEMORY[0x1E4F178D8] object:self->_accountStore];

  [(AccountUtilities *)self updateAccountInfos];
}

void __38__AccountUtilities_updateAccountInfos__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) updateAccountInfosLock];
  int v3 = [v2 tryLock];

  if (!v3) {
    return;
  }
  v4 = [*(id *)(a1 + 32) freshContext];
  [v4 allAccounts];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  v21 = v4;
  if (!v5)
  {
    char v22 = 0;
    goto LABEL_26;
  }
  char v22 = 0;
  uint64_t v24 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v28 != v24) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      v8 = [v7 accountIdentifier];
      int v9 = [v8 isEqualToString:@"local://local/account"];
      v10 = *(void **)(a1 + 32);
      if (v9)
      {
        if (([v10 localNotesExist] & 1) == 0) {
          goto LABEL_20;
        }
        v11 = [*(id *)(a1 + 32) localAccountDisplayName];
      }
      else
      {
        v12 = [v10 accountStore];
        objc_super v13 = [v12 accountWithIdentifier:v8];

        if (v13)
        {
          v14 = [v13 displayAccount];
          v11 = [v14 accountDescription];
        }
        else
        {
          v11 = 0;
        }
      }
      if (!v11)
      {
        v1 = [v7 name];
        if (!v1)
        {
LABEL_20:
          v11 = 0;
          goto LABEL_22;
        }
      }
      v15 = [v7 name];
      char v16 = [v11 isEqualToString:v15];

      if (!v11)
      {

        if (v16) {
          goto LABEL_20;
        }
LABEL_21:
        char v22 = 1;
        [v7 setName:v11];
        goto LABEL_22;
      }
      if ((v16 & 1) == 0) {
        goto LABEL_21;
      }
LABEL_22:
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v5);
LABEL_26:

  id v26 = 0;
  char v17 = [v21 save:&v26];
  id v18 = v26;
  v19 = v18;
  if ((v17 & 1) == 0) {
    NSLog(&cfstr_FailedToSaveAf.isa, v18);
  }

  v20 = [*(id *)(a1 + 32) updateAccountInfosLock];
  [v20 unlock];

  if (v22) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_30);
  }
}

- (NSLock)updateAccountInfosLock
{
  return (NSLock *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)localNotesExist
{
  return 0;
}

- (void)updateAccountInfos
{
  int v3 = dispatch_get_global_queue(0, 0);
  v4 = [(AccountUtilities *)self backgroundDispatchGroup];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AccountUtilities_updateAccountInfos__block_invoke;
  block[3] = &unk_1E686DF70;
  block[4] = self;
  dispatch_group_async(v4, v3, block);
}

- (OS_dispatch_group)backgroundDispatchGroup
{
  return self->_backgroundDispatchGroup;
}

+ (id)sharedAccountUtilities
{
  if (sharedAccountUtilities_onceToken != -1) {
    dispatch_once(&sharedAccountUtilities_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedAccountUtilities___sharedInstance;
  return v2;
}

- (id)freshContext
{
  v2 = [[NoteContext alloc] initWithAccountUtilities:self];
  return v2;
}

- (ACAccountStore)accountStore
{
  v2 = self;
  objc_sync_enter(v2);
  int v3 = v2->_accountStore;
  objc_sync_exit(v2);

  return v3;
}

- (void)_accountStoreDidChange:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(ACAccountStore *)v4->_accountStore accountIdentifiersEnabledForDataclass:*MEMORY[0x1E4F175F0]];
  accountIDsEnabledForNotes = v4->_accountIDsEnabledForNotes;
  v4->_accountIDsEnabledForNotes = (NSArray *)v5;

  objc_sync_exit(v4);
  [(AccountUtilities *)v4 updateAccountInfos];
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AccountUtilities;
  [(AccountUtilities *)&v4 dealloc];
}

- (id)accountsEnabledForNotes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = v4->_accountIDsEnabledForNotes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = -[ACAccountStore accountWithIdentifier:](v4->_accountStore, "accountWithIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)accountIDsEnabledForNotes
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_accountIDsEnabledForNotes;
  objc_sync_exit(v2);

  return v3;
}

- (id)defaultStoreSyncIdWithDesiredSyncId:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AccountUtilities *)self localNotesExist];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (![v4 length]) {
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"DeviceLocalAccount"])
  {
    if (!v5) {
      goto LABEL_7;
    }
LABEL_6:
    id v7 = v4;
    if (v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ([(NSArray *)v6->_accountIDsEnabledForNotes containsObject:v4]) {
    goto LABEL_6;
  }
LABEL_7:
  id v7 = [(NSArray *)v6->_accountIDsEnabledForNotes lastObject];
LABEL_8:
  objc_sync_exit(v6);

  return v7;
}

- (id)localAccountDisplayName
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getACUILocalizationClass_softClass;
  uint64_t v10 = getACUILocalizationClass_softClass;
  if (!getACUILocalizationClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getACUILocalizationClass_block_invoke;
    v6[3] = &unk_1E686E060;
    v6[4] = &v7;
    __getACUILocalizationClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 localizedTitleForLocalSourceOfDataclass:*MEMORY[0x1E4F175F0] usedAtBeginningOfSentence:1];
  return v4;
}

void __38__AccountUtilities_updateAccountInfos__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"NotesAccountUtilitiesDidUpdateAccounts" object:0];
}

- (void)setAccountStore:(id)a3
{
}

- (void)setBackgroundDispatchGroup:(id)a3
{
}

- (void)setUpdateAccountInfosLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateAccountInfosLock, 0);
  objc_storeStrong((id *)&self->_backgroundDispatchGroup, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_noteContext, 0);
  objc_storeStrong((id *)&self->_accountIDsEnabledForNotes, 0);
}

@end