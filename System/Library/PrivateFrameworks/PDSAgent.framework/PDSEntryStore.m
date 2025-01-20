@interface PDSEntryStore
- (BOOL)_permitTransitionFromState:(unsigned __int8)a3 toState:(unsigned __int8)a4;
- (BOOL)deleteEntriesForUser:(id)a3 withState:(unsigned __int8)a4 withError:(id *)a5;
- (BOOL)deleteEntry:(id)a3 withError:(id *)a4;
- (BOOL)hasActiveEntries;
- (BOOL)hasPendingEntries;
- (BOOL)storeEntries:(id)a3 deleteEntries:(id)a4 withError:(id *)a5;
- (BOOL)storeEntry:(id)a3 withError:(id *)a4;
- (BOOL)updateAllEntriesWithState:(unsigned __int8)a3 toState:(unsigned __int8)a4 withError:(id *)a5;
- (BOOL)updateEntryState:(unsigned __int8)a3 forUser:(id)a4 clientID:(id)a5 withError:(id *)a6;
- (PDSCDCache)cache;
- (PDSEntryStore)initWithCache:(id)a3;
- (PDSEntryStoreDelegate)delegate;
- (id)activeUsers;
- (id)activeUsersWithClientID:(id)a3;
- (id)entries;
- (id)entriesForUser:(id)a3;
- (id)entriesForUser:(id)a3 withClientID:(id)a4;
- (id)entriesWithClientID:(id)a3;
- (id)users;
- (id)usersWithClientID:(id)a3;
- (void)setCache:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PDSEntryStore

- (PDSEntryStore)initWithCache:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PDSEntryStore.m", 25, @"Invalid parameter not satisfying: %@", @"cache" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PDSEntryStore;
  v7 = [(PDSEntryStore *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_cache, a3);
  }

  return v8;
}

- (BOOL)storeEntry:(id)a3 withError:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(PDSEntryStore *)self cache];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __38__PDSEntryStore_storeEntry_withError___block_invoke;
  v14[3] = &unk_2645C8E40;
  v14[4] = self;
  int v8 = [v7 storeEntry:v6 transitionBlock:v14 withError:a4];

  if (v8)
  {
    v9 = [(PDSEntryStore *)self delegate];
    v10 = [v6 registration];
    objc_super v11 = [v10 topicString];
    v15[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [v9 entryStore:self didUpdatePendingTopics:v12 forceImmediateUpdate:0];
  }
  return v8;
}

uint64_t __38__PDSEntryStore_storeEntry_withError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _permitTransitionFromState:a2 toState:a3];
}

- (BOOL)updateEntryState:(unsigned __int8)a3 forUser:(id)a4 clientID:(id)a5 withError:(id *)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(PDSEntryStore *)self cache];
  int v13 = [v12 updateEntryState:v8 forUser:v10 clientID:v11 withError:a6];

  if (v8 != 3)
  {
    if (v13)
    {
      v14 = [(PDSEntryStore *)self delegate];

      if (v14)
      {
        v15 = [(PDSEntryStore *)self cache];
        v16 = [v15 loadAllEntriesUser:v10 withClientID:v11];
        v17 = objc_msgSend(v16, "__imArrayByApplyingBlock:", &__block_literal_global_2);

        v18 = [(PDSEntryStore *)self delegate];
        [v18 entryStore:self didUpdatePendingTopics:v17 forceImmediateUpdate:1];
      }
    }
  }

  return v13;
}

id __61__PDSEntryStore_updateEntryState_forUser_clientID_withError___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 registration];
  v3 = [v2 topicString];

  return v3;
}

- (BOOL)updateAllEntriesWithState:(unsigned __int8)a3 toState:(unsigned __int8)a4 withError:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  v9 = [(PDSEntryStore *)self cache];
  int v10 = [v9 updateAllEntriesWithState:v7 toState:v6 withError:a5];

  if (v10)
  {
    id v11 = [(PDSEntryStore *)self delegate];

    if (v11)
    {
      v12 = [(PDSEntryStore *)self cache];
      int v13 = [v12 loadAllEntries];
      v14 = objc_msgSend(v13, "__imArrayByApplyingBlock:", &__block_literal_global_11);

      v15 = [(PDSEntryStore *)self delegate];
      [v15 entryStore:self didUpdatePendingTopics:v14 forceImmediateUpdate:1];
    }
  }
  return v10;
}

id __61__PDSEntryStore_updateAllEntriesWithState_toState_withError___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 registration];
  v3 = [v2 topicString];

  return v3;
}

- (BOOL)deleteEntry:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PDSEntryStore *)self cache];
  LOBYTE(a4) = [v7 deleteEntry:v6 withError:a4];

  return (char)a4;
}

- (BOOL)deleteEntriesForUser:(id)a3 withState:(unsigned __int8)a4 withError:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = [(PDSEntryStore *)self cache];
  LOBYTE(a5) = [v9 deleteEntriesForUser:v8 withState:v6 withError:a5];

  return (char)a5;
}

- (BOOL)storeEntries:(id)a3 deleteEntries:(id)a4 withError:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = [(PDSEntryStore *)self cache];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __54__PDSEntryStore_storeEntries_deleteEntries_withError___block_invoke;
  v39[3] = &unk_2645C8E40;
  v39[4] = self;
  int v11 = [v10 storeEntries:v8 transitionBlock:v39 deleteEntries:v9 withError:a5];

  if (v11)
  {
    char v30 = v11;
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v35 + 1) + 8 * i) registration];
          v19 = [v18 topicString];
          [v12 addObject:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v15);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v20 = v9;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v31 + 1) + 8 * j) registration];
          v26 = [v25 topicString];
          [v12 addObject:v26];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v22);
    }

    v27 = [(PDSEntryStore *)self delegate];
    v28 = (void *)[v12 copy];
    [v27 entryStore:self didUpdatePendingTopics:v28 forceImmediateUpdate:0];

    LOBYTE(v11) = v30;
  }

  return v11;
}

uint64_t __54__PDSEntryStore_storeEntries_deleteEntries_withError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _permitTransitionFromState:a2 toState:a3];
}

- (BOOL)hasPendingEntries
{
  v2 = [(PDSEntryStore *)self cache];
  char v3 = [v2 hasPendingEntries];

  return v3;
}

- (BOOL)hasActiveEntries
{
  v2 = [(PDSEntryStore *)self cache];
  char v3 = [v2 hasActiveEntries];

  return v3;
}

- (id)entries
{
  v2 = [(PDSEntryStore *)self cache];
  char v3 = [v2 loadAllEntries];

  return v3;
}

- (id)entriesForUser:(id)a3
{
  id v4 = a3;
  v5 = [(PDSEntryStore *)self cache];
  uint64_t v6 = [v5 loadAllEntriesUser:v4];

  return v6;
}

- (id)entriesForUser:(id)a3 withClientID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDSEntryStore *)self cache];
  id v9 = [v8 loadAllEntriesUser:v7 withClientID:v6];

  return v9;
}

- (id)entriesWithClientID:(id)a3
{
  id v4 = a3;
  v5 = [(PDSEntryStore *)self cache];
  id v6 = [v5 loadAllEntriesForClientID:v4];

  return v6;
}

- (id)users
{
  v2 = [(PDSEntryStore *)self cache];
  char v3 = [v2 loadAllUsers];

  return v3;
}

- (id)activeUsers
{
  v2 = [(PDSEntryStore *)self cache];
  char v3 = [v2 loadAllActiveUsers];

  return v3;
}

- (id)usersWithClientID:(id)a3
{
  id v4 = a3;
  v5 = [(PDSEntryStore *)self cache];
  id v6 = [v5 loadAllUsersForClientID:v4];

  return v6;
}

- (id)activeUsersWithClientID:(id)a3
{
  id v4 = a3;
  v5 = [(PDSEntryStore *)self cache];
  id v6 = [v5 loadAllActiveUsersForClientID:v4];

  return v6;
}

- (BOOL)_permitTransitionFromState:(unsigned __int8)a3 toState:(unsigned __int8)a4
{
  LOBYTE(v4) = 1;
  switch(a3)
  {
    case 0u:
      return v4;
    case 1u:
      if (a4 >= 4u) {
        goto LABEL_9;
      }
      unsigned __int8 v5 = a4;
      unsigned int v6 = 14;
      goto LABEL_8;
    case 2u:
      if (a4 >= 4u) {
        goto LABEL_9;
      }
      unsigned __int8 v5 = a4;
      unsigned int v6 = 6;
      goto LABEL_8;
    case 3u:
      if (a4 >= 4u) {
        goto LABEL_9;
      }
      unsigned __int8 v5 = a4;
      unsigned int v6 = 12;
LABEL_8:
      BOOL v4 = (v6 >> v5) & 1;
      break;
    default:
LABEL_9:
      LOBYTE(v4) = 0;
      break;
  }
  return v4;
}

- (PDSEntryStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDSEntryStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PDSCDCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end