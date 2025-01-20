@interface UNCKeyedDataStoreRepository
- (BOOL)_isReplacementSupported;
- (BOOL)_saveObjects:(id)a3 atPath:(id)a4;
- (BOOL)_useReplacementToImport:(id)a3 into:(id)a4;
- (UNCKeyedDataStoreRepository)initWithDirectory:(id)a3 fileName:(id)a4 pathExtension:(id)a5 librarian:(id)a6 repositoryProtectionStrategy:(id)a7 objectIdentifierKey:(id)a8 maxObjectsPerKey:(int64_t)a9;
- (id)_addObject:(id)a3 mustReplace:(BOOL)a4 atPath:(id)a5;
- (id)_addObject:(id)a3 toObjects:(id)a4 mustReplace:(BOOL)a5 receipt:(id *)a6;
- (id)_dataAtPath:(id)a3;
- (id)_directoryForKey:(id)a3;
- (id)_objectsAtPath:(id)a3;
- (id)_objectsForData:(id)a3 identifier:(id)a4;
- (id)_objectsPassingTest:(id)a3 atPath:(id)a4;
- (id)_pathForKey:(id)a3;
- (id)_removeObjectsPassingTest:(id)a3 atPath:(id)a4;
- (id)addObject:(id)a3 forKey:(id)a4;
- (id)addObject:(id)a3 mustReplace:(BOOL)a4 forKey:(id)a5;
- (id)allKeys;
- (id)directoryPath;
- (id)objectsForKey:(id)a3;
- (id)objectsPassingTest:(id)a3 forKey:(id)a4;
- (id)recordValidationTest;
- (id)removeObjectsPassingTest:(id)a3 forKey:(id)a4;
- (id)replaceObject:(id)a3 forKey:(id)a4;
- (void)_removeItemAtPath:(id)a3;
- (void)_setObjects:(id)a3 atPath:(id)a4;
- (void)migrateStoreAtPath:(id)a3 forKey:(id)a4;
- (void)protectionStateChanged;
- (void)removeAllObjectsForKey:(id)a3;
- (void)removeDataStoreRepository;
- (void)removeStoreForKey:(id)a3;
- (void)setObjects:(id)a3 forKey:(id)a4;
- (void)setRecordValidationTest:(id)a3;
@end

@implementation UNCKeyedDataStoreRepository

- (id)objectsForKey:(id)a3
{
  v4 = [(UNCKeyedDataStoreRepository *)self _pathForKey:a3];
  v5 = [(UNCKeyedDataStoreRepository *)self _objectsAtPath:v4];

  return v5;
}

- (id)_objectsAtPath:(id)a3
{
  id v4 = a3;
  v5 = [(UNCKeyedDataStoreRepository *)self _dataAtPath:v4];
  if (v5)
  {
    v6 = [(UNCKeyedDataStoreRepository *)self _objectsForData:v5 identifier:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_objectsForData:(id)a3 identifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v24 = a4;
  context = (void *)MEMORY[0x261221EF0]();
  v21 = (void *)MEMORY[0x263F08928];
  v23 = (void *)MEMORY[0x263EFFA08];
  uint64_t v22 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v23, "setWithObjects:", v22, v20, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v15 = [v21 unarchivedObjectOfClasses:v14 fromData:v25 error:0];

  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (id)*MEMORY[0x263F1E030];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        [(UNCKeyedDataStoreRepository *)v17 _objectsForData:(uint64_t)v26 identifier:v16];
      }

      v15 = 0;
    }
  }

  return v15;
}

- (id)_dataAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UNSContentProtectionStrategy *)self->_protectionStrategy dataAtPath:v4];
  if (!v5)
  {
    uint64_t v6 = *MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
      -[UNCKeyedDictionaryRepository _dataAtPath:]((uint64_t)v4, v6);
    }
  }

  return v5;
}

- (id)_pathForKey:(id)a3
{
  id v4 = [(UNCKeyedDataStoreRepository *)self _directoryForKey:a3];
  uint64_t v5 = [v4 stringByAppendingPathComponent:self->_fileName];
  uint64_t v6 = [v5 stringByAppendingPathExtension:self->_pathExtension];

  return v6;
}

- (id)_directoryForKey:(id)a3
{
  id v4 = [(UNCBundleLibrarian *)self->_librarian uniqueIdentifierForBundleIdentifier:a3];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:&stru_270CB9250];
  uint64_t v6 = [(NSString *)self->_directory stringByAppendingPathComponent:v5];

  return v6;
}

- (UNCKeyedDataStoreRepository)initWithDirectory:(id)a3 fileName:(id)a4 pathExtension:(id)a5 librarian:(id)a6 repositoryProtectionStrategy:(id)a7 objectIdentifierKey:(id)a8 maxObjectsPerKey:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)UNCKeyedDataStoreRepository;
  v21 = [(UNCKeyedDataStoreRepository *)&v31 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    directory = v21->_directory;
    v21->_directory = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    fileName = v21->_fileName;
    v21->_fileName = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    pathExtension = v21->_pathExtension;
    v21->_pathExtension = (NSString *)v26;

    objc_storeStrong((id *)&v21->_librarian, a6);
    objc_storeStrong((id *)&v21->_protectionStrategy, a7);
    uint64_t v28 = [v20 copy];
    objectIdentifierKey = v21->_objectIdentifierKey;
    v21->_objectIdentifierKey = (NSString *)v28;

    v21->_maxObjectsPerKey = a9;
  }

  return v21;
}

- (id)allKeys
{
  v36[1] = *MEMORY[0x263EF8340];
  id v26 = [MEMORY[0x263EFF980] array];
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [NSURL fileURLWithPath:self->_directory];
  v36[0] = *MEMORY[0x263EFF6A8];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
  uint64_t v6 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:v5 options:1 errorHandler:&__block_literal_global_21];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x261221EF0]();
        protectionStrategy = self->_protectionStrategy;
        id v15 = [v12 path];
        LOBYTE(protectionStrategy) = [(UNSContentProtectionStrategy *)protectionStrategy dataIsAvailableAtPath:v15];

        if (protectionStrategy)
        {
          librarian = self->_librarian;
          id v17 = [v12 lastPathComponent];
          id v18 = [(UNCBundleLibrarian *)librarian bundleIdentifierForUniqueIdentifier:v17];

          id v19 = (void *)*MEMORY[0x263F1E030];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
          {
            id v20 = v19;
            v21 = [v12 path];
            *(_DWORD *)buf = 138412546;
            v32 = v21;
            __int16 v33 = 2112;
            v34 = v18;
            _os_log_impl(&dword_2608DB000, v20, OS_LOG_TYPE_DEFAULT, "UNCKeyedDataStoreRepository allKeys: Loading: %@ bundleIdentifier: %@", buf, 0x16u);
          }
          if (v18) {
            [v26 addObject:v18];
          }
        }
        else
        {
          uint64_t v22 = (void *)*MEMORY[0x263F1E030];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            uint64_t v24 = [v12 path];
            *(_DWORD *)buf = 138412290;
            v32 = v24;
            _os_log_impl(&dword_2608DB000, v23, OS_LOG_TYPE_DEFAULT, "UNCKeyedDataStoreRepository allKeys: !dataIsAvailableAtPath: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v9);
  }

  return v26;
}

uint64_t __38__UNCKeyedDataStoreRepository_allKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "UNCKeyedDataStoreRepository allKeys: enumeratorAtURL failed url: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (id)directoryPath
{
  return self->_directory;
}

- (id)objectsPassingTest:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = [(UNCKeyedDataStoreRepository *)self _pathForKey:a4];
    int v8 = [(UNCKeyedDataStoreRepository *)self _objectsPassingTest:v6 atPath:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)_objectsPassingTest:(id)a3 atPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(UNCKeyedDataStoreRepository *)self _dataAtPath:v7];
  if (v8)
  {
    id v9 = [(UNCKeyedDataStoreRepository *)self _objectsForData:v8 identifier:v7];
    __int16 v10 = objc_msgSend(v9, "bs_filter:", v6);
  }
  else
  {
    __int16 v10 = 0;
  }

  return v10;
}

- (BOOL)_saveObjects:(id)a3 atPath:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_t *)MEMORY[0x263F1E030];
  id v9 = (void *)*MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    *(_DWORD *)buf = 138543618;
    id v27 = v7;
    __int16 v28 = 2048;
    uint64_t v29 = [v6 count];
    _os_log_impl(&dword_2608DB000, v10, OS_LOG_TYPE_DEFAULT, "Saving file at %{public}@ with %lu items", buf, 0x16u);
  }
  id v11 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v12 = [v7 stringByDeletingLastPathComponent];
  if (([v11 fileExistsAtPath:v12] & 1) == 0)
  {
    id v25 = 0;
    char v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v14 = v25;
    if ((v13 & 1) == 0 && os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[UNCBundleLibrarian _queue_saveDictionary:atPath:].cold.4();
    }
  }
  id v24 = 0;
  id v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v24];
  id v16 = v24;
  if (v15)
  {
    protectionStrategy = self->_protectionStrategy;
    id v23 = v16;
    char v18 = [(UNSContentProtectionStrategy *)protectionStrategy writeData:v15 atPath:v7 error:&v23];
    id v19 = v23;

    if (v18)
    {
      BOOL v20 = 1;
    }
    else
    {
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
        -[UNCBundleLibrarian _queue_saveDictionary:atPath:]();
      }
      BOOL v20 = 0;
    }
    id v16 = v19;
  }
  else
  {
    v21 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[UNCKeyedDictionaryRepository _saveDictionary:atPath:]((uint64_t)v16, v21);
    }
    BOOL v20 = 0;
  }

  return v20;
}

- (void)removeAllObjectsForKey:(id)a3
{
  id v4 = [(UNCKeyedDataStoreRepository *)self _pathForKey:a3];
  [(UNCKeyedDataStoreRepository *)self _saveObjects:MEMORY[0x263EFFA68] atPath:v4];
}

- (id)removeObjectsPassingTest:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = [(UNCKeyedDataStoreRepository *)self _pathForKey:a4];
    int v8 = [(UNCKeyedDataStoreRepository *)self _removeObjectsPassingTest:v6 atPath:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)_removeObjectsPassingTest:(id)a3 atPath:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = (unsigned int (**)(id, void))a3;
  char v18 = self;
  id v19 = a4;
  id v7 = -[UNCKeyedDataStoreRepository _objectsAtPath:](self, "_objectsAtPath:");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    __int16 v10 = 0;
    id v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (v6[2](v6, v14))
        {
          if (v11)
          {
            id v15 = v11;
          }
          else
          {
            id v15 = [MEMORY[0x263EFF980] array];
            id v11 = v15;
          }
        }
        else if (v10)
        {
          id v15 = v10;
        }
        else
        {
          id v15 = [MEMORY[0x263EFF980] array];
          __int16 v10 = v15;
        }
        [v15 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  else
  {
    __int16 v10 = 0;
    id v11 = 0;
  }
  [(UNCKeyedDataStoreRepository *)v18 _saveObjects:v10 atPath:v19];
  id v16 = +[UNCDataStoreReceipt receiptWithAddedObjects:0 replacedObjects:0 replacementObjects:0 removedObjects:v11];

  return v16;
}

- (void)setObjects:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(UNCKeyedDataStoreRepository *)self _pathForKey:a4];
  [(UNCKeyedDataStoreRepository *)self _setObjects:v6 atPath:v7];
}

- (void)_setObjects:(id)a3 atPath:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[v6 mutableCopy];
  unint64_t v9 = [v8 count];
  unint64_t maxObjectsPerKey = self->_maxObjectsPerKey;
  if (v9 > maxObjectsPerKey) {
    unint64_t v9 = objc_msgSend(v8, "removeObjectsInRange:", maxObjectsPerKey, objc_msgSend(v8, "count") - self->_maxObjectsPerKey);
  }
  if (self->_recordValidationTest)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v12)
    {
      uint64_t v14 = v11;
      goto LABEL_18;
    }
    uint64_t v13 = v12;
    id v19 = v6;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (((*((uint64_t (**)(void))self->_recordValidationTest + 2))() & 1) == 0)
        {
          if (!v14)
          {
            uint64_t v14 = [MEMORY[0x263EFF980] array];
          }
          [v14 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);

    id v6 = v19;
    if (v14)
    {
      [v11 removeObjectsInArray:v14];
LABEL_18:
    }
  }
  char v18 = (void *)MEMORY[0x261221EF0](v9);
  [(UNCKeyedDataStoreRepository *)self _saveObjects:v8 atPath:v7];
}

- (id)addObject:(id)a3 forKey:(id)a4
{
  return [(UNCKeyedDataStoreRepository *)self addObject:a3 mustReplace:0 forKey:a4];
}

- (id)replaceObject:(id)a3 forKey:(id)a4
{
  return [(UNCKeyedDataStoreRepository *)self addObject:a3 mustReplace:1 forKey:a4];
}

- (id)addObject:(id)a3 mustReplace:(BOOL)a4 forKey:(id)a5
{
  id v5 = 0;
  if (a3 && a5)
  {
    BOOL v7 = a4;
    id v9 = a3;
    __int16 v10 = [(UNCKeyedDataStoreRepository *)self _pathForKey:a5];
    id v5 = [(UNCKeyedDataStoreRepository *)self _addObject:v9 mustReplace:v7 atPath:v10];
  }

  return v5;
}

- (id)_addObject:(id)a3 mustReplace:(BOOL)a4 atPath:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = (void *)MEMORY[0x261221EF0]();
  id v11 = [(UNCKeyedDataStoreRepository *)self _objectsAtPath:v9];
  id v15 = 0;
  uint64_t v12 = [(UNCKeyedDataStoreRepository *)self _addObject:v8 toObjects:v11 mustReplace:v6 receipt:&v15];
  id v13 = v15;
  [(UNCKeyedDataStoreRepository *)self _saveObjects:v12 atPath:v9];

  return v13;
}

- (id)_addObject:(id)a3 toObjects:(id)a4 mustReplace:(BOOL)a5 receipt:(id *)a6
{
  LODWORD(v40) = a5;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = [MEMORY[0x263EFF980] array];
  v42 = v8;
  [v10 addObject:v8];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if ([(UNCKeyedDataStoreRepository *)self _isReplacementSupported]
          && ([v16 objectForKey:self->_objectIdentifierKey],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              [v42 objectForKey:self->_objectIdentifierKey],
              char v18 = objc_claimAutoreleasedReturnValue(),
              int v19 = [v17 isEqualToString:v18],
              v18,
              v17,
              v19))
        {
          uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObject:v16];

          id v13 = (void *)v20;
        }
        else
        {
          [v10 addObject:v16];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v12);
  }
  else
  {
    id v13 = 0;
  }

  long long v21 = v13;
  if (v40 && ![v13 count])
  {
    v37 = 0;
    id v24 = 0;
    id v26 = 0;
    v36 = a6;
    if (a6)
    {
LABEL_41:
      +[UNCDataStoreReceipt receiptWithAddedObjects:replacedObjects:replacementObjects:removedObjects:](UNCDataStoreReceipt, "receiptWithAddedObjects:replacedObjects:replacementObjects:removedObjects:", v37, v21, v24, v26, v40);
      id *v36 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v42, v40);
    if (v13) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = v22;
    }
    if (v13) {
      id v24 = (void *)v22;
    }
    else {
      id v24 = 0;
    }
    unint64_t v25 = objc_msgSend(v10, "count", v23);
    id v26 = 0;
    unint64_t maxObjectsPerKey = self->_maxObjectsPerKey;
    if (v25 > maxObjectsPerKey)
    {
      uint64_t v28 = [v10 count] - self->_maxObjectsPerKey;
      uint64_t v29 = objc_msgSend(v10, "subarrayWithRange:", maxObjectsPerKey, v28);
      id v26 = (void *)[v29 mutableCopy];

      objc_msgSend(v10, "removeObjectsInRange:", maxObjectsPerKey, v28);
    }
    if (self->_recordValidationTest)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v30 = v10;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v45 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v44 + 1) + 8 * j);
            if (((*((uint64_t (**)(void))self->_recordValidationTest + 2))() & 1) == 0)
            {
              if (!v26)
              {
                id v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v30, "count"));
              }
              [v26 addObject:v35];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v32);
      }

      if (v26) {
        [v30 removeObjectsInArray:v26];
      }
      v36 = a6;
      long long v21 = v13;
    }
    else
    {
      v36 = a6;
    }
    v37 = v40;
    if (v36) {
      goto LABEL_41;
    }
  }
  v38 = objc_msgSend(v10, "copy", v40);

  return v38;
}

- (void)removeStoreForKey:(id)a3
{
  id v4 = [(UNCKeyedDataStoreRepository *)self _pathForKey:a3];
  [(UNCKeyedDataStoreRepository *)self _removeItemAtPath:v4];
}

- (void)removeDataStoreRepository
{
}

- (void)_removeItemAtPath:(id)a3
{
  protectionStrategy = self->_protectionStrategy;
  uint64_t v4 = 0;
  [(UNSContentProtectionStrategy *)protectionStrategy removeItemAtPath:a3 error:&v4];
}

- (void)migrateStoreAtPath:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x263F08850];
  id v8 = a3;
  id v9 = [v7 defaultManager];
  __int16 v10 = [(UNCKeyedDataStoreRepository *)self _directoryForKey:v6];
  if (([v9 fileExistsAtPath:v10] & 1) == 0)
  {
    id v14 = 0;
    [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v11 = v14;
    if (v11 && os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
      -[UNCKeyedDataStoreRepository migrateStoreAtPath:forKey:]();
    }
  }
  protectionStrategy = self->_protectionStrategy;
  id v13 = [(UNCKeyedDataStoreRepository *)self _pathForKey:v6];
  [(UNSContentProtectionStrategy *)protectionStrategy migrateDataAtPath:v8 toPath:v13];
}

- (BOOL)_isReplacementSupported
{
  return self->_objectIdentifierKey != 0;
}

- (BOOL)_useReplacementToImport:(id)a3 into:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 count];
  uint64_t v8 = [v6 count];

  if (!v7 || !v8) {
    return 0;
  }

  return [(UNCKeyedDataStoreRepository *)self _isReplacementSupported];
}

- (void)protectionStateChanged
{
  if (objc_opt_respondsToSelector())
  {
    protectionStrategy = self->_protectionStrategy;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__UNCKeyedDataStoreRepository_protectionStateChanged__block_invoke;
    v4[3] = &unk_2655684A0;
    v4[4] = self;
    [(UNSContentProtectionStrategy *)protectionStrategy importDataWithImportHandler:v4];
  }
}

id __53__UNCKeyedDataStoreRepository_protectionStateChanged__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) _objectsForData:a2 identifier:0];
  uint64_t v7 = [*(id *)(a1 + 32) _objectsForData:v5 identifier:0];
  uint64_t v8 = (void *)v7;
  id v9 = (void *)MEMORY[0x263EFFA68];
  if (v7) {
    id v9 = (void *)v7;
  }
  id v10 = v9;
  if ([*(id *)(a1 + 32) _useReplacementToImport:v6 into:v8])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v24 = v6;
      id v25 = v5;
      id v14 = 0;
      uint64_t v15 = *(void *)v29;
      do
      {
        uint64_t v16 = 0;
        uint64_t v17 = v14;
        char v18 = v10;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * v16);
          uint64_t v20 = *(void **)(a1 + 32);
          id v27 = v17;
          objc_msgSend(v20, "_addObject:toObjects:mustReplace:receipt:", v19, v18, 0, &v27, v24, v25);
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          id v14 = v27;

          ++v16;
          uint64_t v17 = v14;
          char v18 = v10;
        }
        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);

      id v6 = v24;
      id v5 = v25;
    }
  }
  else if ([v6 count])
  {
    id v21 = v6;

    id v10 = v21;
  }
  uint64_t v26 = 0;
  uint64_t v22 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v26];

  return v22;
}

- (id)recordValidationTest
{
  return self->_recordValidationTest;
}

- (void)setRecordValidationTest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recordValidationTest, 0);
  objc_storeStrong((id *)&self->_objectIdentifierKey, 0);
  objc_storeStrong((id *)&self->_protectionStrategy, 0);
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_pathExtension, 0);
  objc_storeStrong((id *)&self->_fileName, 0);

  objc_storeStrong((id *)&self->_directory, 0);
}

- (void)_objectsForData:(uint64_t)a3 identifier:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  id v6 = a1;
  _os_log_error_impl(&dword_2608DB000, a4, OS_LOG_TYPE_ERROR, "Unexpected class %{public}@ decocded at %{public}@", (uint8_t *)a3, 0x16u);
}

- (void)_objectsForData:(void *)a1 identifier:(uint64_t)a2 .cold.2(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    uint64_t v6 = a2;
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_error_impl(&dword_2608DB000, v4, OS_LOG_TYPE_ERROR, "Exception caught data at %{public}@; exception: %{public}@",
      (uint8_t *)&v5,
      0x16u);
  }

  objc_end_catch();
}

- (void)_saveObjects:(void *)a1 atPath:.cold.3(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = objc_begin_catch(a1);
  v2 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = v1;
    _os_log_error_impl(&dword_2608DB000, v2, OS_LOG_TYPE_ERROR, "Unable to archive objects: %{public}@", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

- (void)migrateStoreAtPath:forKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not create directory at %{public}@; error: %{public}@ for migration");
}

@end