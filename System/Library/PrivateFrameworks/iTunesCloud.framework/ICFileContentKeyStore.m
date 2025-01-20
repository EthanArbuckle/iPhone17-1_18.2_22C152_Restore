@interface ICFileContentKeyStore
- (BOOL)containsKeyForIdentifier:(id)a3 error:(id *)a4;
- (ICFileContentKeyStore)initWithPath:(id)a3;
- (NSString)filePath;
- (id)_filePathForKeyIdentifier:(id)a3;
- (id)_keyEntryForIdentifier:(id)a3 error:(id *)a4;
- (id)incrementFailureCountForKeyWithIdentifier:(id)a3;
- (id)loadKeyForIdentifier:(id)a3 error:(id *)a4;
- (id)removeAllKeys;
- (id)removeKeyForIdentifier:(id)a3;
- (id)saveKey:(id)a3 forIdentifier:(id)a4 adamID:(id)a5 withRenewalDate:(id)a6 accountDSID:(id)a7 keyServerProtocolType:(int64_t)a8;
- (id)saveKeyEntry:(id)a3;
- (void)enumerateKeyEntriesUsingBlock:(id)a3;
@end

@implementation ICFileContentKeyStore

- (void).cxx_destruct
{
}

- (ICFileContentKeyStore)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICFileContentKeyStore;
  v5 = [(ICFileContentKeyStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v6;
  }
  return v5;
}

- (void)enumerateKeyEntriesUsingBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v19 = (void (**)(id, ICContentKeyStoreEntry *, unsigned char *))a3;
  [MEMORY[0x1E4F28CB8] defaultManager];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = v21 = self;
  id v4 = [v18 enumeratorAtPath:self->_filePath];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    v8 = @"dat";
    v20 = v4;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) lastPathComponent];
        if ([v10 hasPrefix:@"ic-key"]
          && [v10 hasSuffix:v8])
        {
          v11 = v8;
          v12 = [(NSString *)v21->_filePath stringByAppendingPathComponent:v10];
          id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
          v15 = (void *)[v13 initWithContentsOfURL:v14 error:0];

          if (v15)
          {
            unsigned __int8 v22 = 0;
            v16 = [[ICContentKeyStoreEntry alloc] initWithDictionaryRepresentation:v15];
            v19[2](v19, v16, &v22);
            int v17 = v22;

            if (v17)
            {

              id v4 = v20;
              goto LABEL_15;
            }
          }

          v8 = v11;
          id v4 = v20;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (NSString)filePath
{
  return self->_filePath;
}

- (id)_filePathForKeyIdentifier:(id)a3
{
  filePath = self->_filePath;
  id v4 = [NSString stringWithFormat:@"%@-%lud.%@", @"ic-key", objc_msgSend(a3, "hash"), @"dat"];
  uint64_t v5 = [(NSString *)filePath stringByAppendingPathComponent:v4];

  return v5;
}

- (id)_keyEntryForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = [(ICFileContentKeyStore *)self _filePathForKeyIdentifier:a3];
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    objc_super v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    id v16 = 0;
    v10 = (void *)[v8 initWithContentsOfURL:v9 error:&v16];
    id v11 = v16;

    if (v10) {
      v12 = [[ICContentKeyStoreEntry alloc] initWithDictionaryRepresentation:v10];
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    id v11 = 0;
    v12 = 0;
  }
  id v13 = v11;
  *a4 = v13;
  v14 = v12;

  return v14;
}

- (id)incrementFailureCountForKeyWithIdentifier:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  uint64_t v5 = [(ICFileContentKeyStore *)self _keyEntryForIdentifier:v4 error:&v9];
  id v6 = v9;
  if (!v6)
  {
    if (!v5) {
      uint64_t v5 = [[ICContentKeyStoreEntry alloc] initWithIdentifier:v4];
    }
    [(ICContentKeyStoreEntry *)v5 setFailureCount:[(ICContentKeyStoreEntry *)v5 failureCount] + 1];
    id v6 = [(ICFileContentKeyStore *)self saveKeyEntry:v5];
  }
  int v7 = v6;

  return v7;
}

- (id)removeAllKeys
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F28CB8] defaultManager];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v14 = id v13 = self;
  v3 = [v14 enumeratorAtPath:self->_filePath];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) lastPathComponent];
        if ([v9 hasPrefix:@"ic-key"]
          && [v9 hasSuffix:@"dat"])
        {
          v10 = [(NSString *)v13->_filePath stringByAppendingPathComponent:v9];
          id v15 = v6;
          [v14 removeItemAtPath:v10 error:&v15];
          id v11 = v15;

          id v6 = v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)removeKeyForIdentifier:(id)a3
{
  v3 = [(ICFileContentKeyStore *)self _filePathForKeyIdentifier:a3];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = 0;
  [v4 removeItemAtPath:v3 error:&v7];
  id v5 = v7;

  return v5;
}

- (id)saveKeyEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(ICFileContentKeyStore *)self _filePathForKeyIdentifier:v5];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v7 removeItemAtPath:v6 error:0];

  id v8 = [v4 dictionaryRepresentation];

  id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
  id v12 = 0;
  [v8 writeToURL:v9 error:&v12];
  id v10 = v12;

  return v10;
}

- (id)saveKey:(id)a3 forIdentifier:(id)a4 adamID:(id)a5 withRenewalDate:(id)a6 accountDSID:(id)a7 keyServerProtocolType:(int64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  long long v19 = [[ICContentKeyStoreEntry alloc] initWithIdentifier:v17];

  [(ICContentKeyStoreEntry *)v19 setKeyData:v18];
  [(ICContentKeyStoreEntry *)v19 setRenewalDate:v15];

  [(ICContentKeyStoreEntry *)v19 setAccountDSID:v14];
  [(ICContentKeyStoreEntry *)v19 setAdamID:v16];

  [(ICContentKeyStoreEntry *)v19 setKeyServerProtocolType:a8];
  v20 = [(ICFileContentKeyStore *)self saveKeyEntry:v19];

  return v20;
}

- (id)loadKeyForIdentifier:(id)a3 error:(id *)a4
{
  id v9 = 0;
  id v5 = [(ICFileContentKeyStore *)self _keyEntryForIdentifier:a3 error:&v9];
  id v6 = v9;
  id v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v5;
}

- (BOOL)containsKeyForIdentifier:(id)a3 error:(id *)a4
{
  id v10 = 0;
  id v5 = [(ICFileContentKeyStore *)self _keyEntryForIdentifier:a3 error:&v10];
  id v6 = v10;
  if (!v5)
  {
    BOOL v8 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v7 = [v5 keyData];
  BOOL v8 = v7 != 0;

  if (a4) {
LABEL_3:
  }
    *a4 = v6;
LABEL_4:

  return v8;
}

@end