@interface ICMemoryContentKeyStore
- (BOOL)containsKeyForIdentifier:(id)a3 error:(id *)a4;
- (ICMemoryContentKeyStore)init;
- (id)incrementFailureCountForKeyWithIdentifier:(id)a3;
- (id)loadKeyForIdentifier:(id)a3 error:(id *)a4;
- (id)removeAllKeys;
- (id)removeKeyForIdentifier:(id)a3;
- (id)saveKey:(id)a3 forIdentifier:(id)a4 adamID:(id)a5 withRenewalDate:(id)a6 accountDSID:(id)a7 keyServerProtocolType:(int64_t)a8;
- (id)saveKeyEntry:(id)a3;
- (void)enumerateKeyEntriesUsingBlock:(id)a3;
@end

@implementation ICMemoryContentKeyStore

- (void).cxx_destruct
{
}

- (id)incrementFailureCountForKeyWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_keyEntries objectForKeyedSubscript:v4];
  if (!v5) {
    v5 = [[ICContentKeyStoreEntry alloc] initWithIdentifier:v4];
  }
  [(ICContentKeyStoreEntry *)v5 setFailureCount:[(ICContentKeyStoreEntry *)v5 failureCount] + 1];
  [(NSMutableDictionary *)self->_keyEntries setObject:v5 forKeyedSubscript:v4];

  return 0;
}

- (void)enumerateKeyEntriesUsingBlock:(id)a3
{
  id v4 = a3;
  keyEntries = self->_keyEntries;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ICMemoryContentKeyStore_enumerateKeyEntriesUsingBlock___block_invoke;
  v7[3] = &unk_1E5AC8DE0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)keyEntries enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __57__ICMemoryContentKeyStore_enumerateKeyEntriesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)removeAllKeys
{
  return 0;
}

- (id)removeKeyForIdentifier:(id)a3
{
  return 0;
}

- (id)saveKeyEntry:(id)a3
{
  keyEntries = self->_keyEntries;
  id v4 = a3;
  v5 = [v4 identifier];
  [(NSMutableDictionary *)keyEntries setObject:v4 forKeyedSubscript:v5];

  return 0;
}

- (id)saveKey:(id)a3 forIdentifier:(id)a4 adamID:(id)a5 withRenewalDate:(id)a6 accountDSID:(id)a7 keyServerProtocolType:(int64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [[ICContentKeyStoreEntry alloc] initWithIdentifier:v17];
  [(ICContentKeyStoreEntry *)v19 setKeyData:v18];

  [(ICContentKeyStoreEntry *)v19 setRenewalDate:v15];
  [(ICContentKeyStoreEntry *)v19 setAccountDSID:v14];

  [(ICContentKeyStoreEntry *)v19 setAdamID:v16];
  [(ICContentKeyStoreEntry *)v19 setKeyServerProtocolType:a8];
  id v20 = [(ICMemoryContentKeyStore *)self saveKeyEntry:v19];
  [(NSMutableDictionary *)self->_keyEntries setObject:v19 forKeyedSubscript:v17];

  return 0;
}

- (id)loadKeyForIdentifier:(id)a3 error:(id *)a4
{
  id result = (id)[(NSMutableDictionary *)self->_keyEntries objectForKeyedSubscript:a3];
  if (a4) {
    *a4 = 0;
  }
  return result;
}

- (BOOL)containsKeyForIdentifier:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  id v4 = [(NSMutableDictionary *)self->_keyEntries objectForKeyedSubscript:a3];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 keyData];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (ICMemoryContentKeyStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICMemoryContentKeyStore;
  v2 = [(ICMemoryContentKeyStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
    keyEntries = v2->_keyEntries;
    v2->_keyEntries = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end