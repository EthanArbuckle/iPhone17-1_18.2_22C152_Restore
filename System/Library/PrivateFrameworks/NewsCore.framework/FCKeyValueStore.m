@interface FCKeyValueStore
- (BOOL)BOOLValueForKey:(id)a3;
- (BOOL)containsObjectForKey:(id)a3;
- (BOOL)shouldExportJSONSidecar;
- (FCKeyValueStore)init;
- (FCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 classRegistry:(id)a7;
- (FCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 classRegistry:(id)a7 migrator:(id)a8;
- (FCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 classRegistry:(id)a7 migrator:(id)a8 savePolicy:(id)a9;
- (NSDate)modificationDate;
- (NSDictionary)asDictionary;
- (NSString)storeDirectory;
- (id)allKeys;
- (id)allObjects;
- (id)fc_jsonEncodableDictionaryWithDictionary:(uint64_t)a1;
- (id)jsonEncodableObject;
- (id)keysOfEntriesPassingTest:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectsForKeys:(id)a3;
- (unint64_t)storeSize;
- (void)_clearStore;
- (void)_maybeWriteObjectsByKey:(uint64_t)a1;
- (void)_readObjectsByKey:(uint64_t)a1;
- (void)_save;
- (void)_writeObjectsByKey:(uint64_t)a1;
- (void)addAllEntriesToDictionary:(id)a3;
- (void)addEntriesFromDictionary:(id)a3;
- (void)enumerateKeysAndObjectsForKeys:(id)a3 usingBlock:(id)a4;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)replaceContentsWithDictionary:(id)a3;
- (void)save;
- (void)saveWithCompletionHandler:(id)a3;
- (void)setBoolValue:(BOOL)a3 forKey:(id)a4;
- (void)setCloudBackupEnabled:(BOOL)a3;
- (void)setJSONEncodingHandlersWithObjectHandler:(id)a3 arrayObjectHandler:(id)a4 dictionaryKeyHandler:(id)a5 dictionaryValueHandler:(id)a6;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObjects:(id)a3 forKeys:(id)a4;
- (void)setShouldExportJSONSidecar:(BOOL)a3;
- (void)updateObjectsForKeys:(id)a3 withBlock:(id)a4;
@end

@implementation FCKeyValueStore

- (id)allKeys
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__92;
  v9 = __Block_byref_object_dispose__92;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__FCKeyValueStore_allKeys__block_invoke;
  v4[3] = &unk_1E5B5C7D0;
  v4[4] = &v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__92;
  v15 = __Block_byref_object_dispose__92;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__FCKeyValueStore_objectForKey___block_invoke;
  v8[3] = &unk_1E5B51260;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_readObjectsByKey:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 80) & 8) != 0) {
      [*(id *)(a1 + 64) lock];
    }
    v3[2](v3, *(void *)(a1 + 56));
    if ((*(unsigned char *)(a1 + 80) & 8) != 0) {
      [*(id *)(a1 + 64) unlock];
    }
  }
}

uint64_t __32__FCKeyValueStore_objectForKey___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

- (FCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 classRegistry:(id)a7 migrator:(id)a8 savePolicy:(id)a9
{
  id v16 = a9;
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v106 = a8;
  id v105 = a9;
  v107.receiver = self;
  v107.super_class = (Class)FCKeyValueStore;
  v20 = v19;
  v21 = [(FCKeyValueStore *)&v107 init];
  v22 = v21;
  if (v21)
  {
    p_name = &v21->_name;
    objc_storeStrong((id *)&v21->_name, a3);
    v22->_clientVersion = a5;
    v22->_optionsMask = a6;
    id v23 = v18;
    v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v25 = [v24 fileExistsAtPath:v23];

    if ((v25 & 1) == 0)
    {
      v26 = [MEMORY[0x1E4F28CB8] defaultManager];
      *(void *)buf = 0;
      char v27 = [v26 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:0 error:buf];
      id v28 = *(id *)buf;

      if ((v27 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v88 = (void *)[[NSString alloc] initWithFormat:@"failed to create cache directory with error: %@", v28];
        *(_DWORD *)v124 = 136315906;
        *(void *)&v124[4] = "-[FCKeyValueStore _initializeStoreDirectoryWithName:]";
        __int16 v125 = 2080;
        v126 = "FCKeyValueStore.m";
        __int16 v127 = 1024;
        int v128 = 689;
        __int16 v129 = 2114;
        v130 = v88;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v124, 0x26u);
      }
    }
    id v29 = v23;

    storeDirectory = v22->_storeDirectory;
    v22->_storeDirectory = (NSString *)v29;

    v31 = v22->_storeDirectory;
    if (v31)
    {
      v32 = (void *)MEMORY[0x1E4F1CB10];
      v33 = [(NSString *)v31 stringByAppendingPathComponent:v22->_name];
      uint64_t v34 = [v32 fileURLWithPath:v33 isDirectory:0];
      storeURL = v22->_storeURL;
      v22->_storeURL = (NSURL *)v34;
    }
    else
    {
      v33 = v22->_storeURL;
      v22->_storeURL = 0;
    }

    if (v20) {
      v36 = v20;
    }
    else {
      v36 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    }
    classRegistry = v22->_classRegistry;
    v22->_classRegistry = v36;

    p_migrator = (void **)&v22->_migrator;
    objc_storeStrong((id *)&v22->_migrator, a8);
    uint64_t v38 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    lock = v22->_lock;
    v22->_lock = (NFLocking *)v38;

    v40 = (void *)MEMORY[0x1E4F1CA60];
    v41 = [(FCKeyValueStore *)v22 storeDirectory];
    uint64_t v42 = [v41 stringByAppendingPathComponent:v22->_name];

    double Current = CFAbsoluteTimeGetCurrent();
    v104 = (void *)v42;
    v44 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v42];
    id v45 = v44;
    v103 = v44;
    if (!v44) {
      goto LABEL_62;
    }
    v100 = v40;
    v22->_storeSize = [v44 length];
    v46 = [MEMORY[0x1E4F1CA60] dictionary];
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F82A90]) initWithData:v45];
    v102 = v47;
    if (v47 && (v48 = v47, [v47 version] == 7))
    {
      v93 = v20;
      id v95 = v18;
      id v97 = v17;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      v49 = [v48 keyValuePairs];
      uint64_t v50 = [v49 countByEnumeratingWithState:&v113 objects:v124 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        v52 = MEMORY[0x1E4F14500];
        uint64_t v53 = *(void *)v114;
        do
        {
          for (uint64_t i = 0; i != v51; ++i)
          {
            if (*(void *)v114 != v53) {
              objc_enumerationMutation(v49);
            }
            v55 = *(void **)(*((void *)&v113 + 1) + 8 * i);
            v56 = [v55 key];

            if (!v56 && os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v62 = (void *)[[NSString alloc] initWithFormat:@"WARNING: the key value store should never contain an entry without a key"];
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "-[FCKeyValueStore _loadFromDisk]";
              __int16 v118 = 2080;
              double v119 = COERCE_DOUBLE("FCKeyValueStore.m");
              __int16 v120 = 1024;
              int v121 = 470;
              __int16 v122 = 2114;
              v123 = v62;
              _os_log_error_impl(&dword_1A460D000, v52, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
            }
            v57 = v22->_classRegistry;
            v58 = -[FCKeyValueStoreClassRegistry classForValueType:](v57, "classForValueType:", [v55 valueType]);

            if (!v58 && os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v63 = objc_msgSend([NSString alloc], "initWithFormat:", @"no class to decode KVS value type %lu", (int)objc_msgSend(v55, "valueType"));
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "-[FCKeyValueStore _loadFromDisk]";
              __int16 v118 = 2080;
              double v119 = COERCE_DOUBLE("FCKeyValueStore.m");
              __int16 v120 = 1024;
              int v121 = 473;
              __int16 v122 = 2114;
              v123 = v63;
              _os_log_error_impl(&dword_1A460D000, v52, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
            }
            v59 = [(objc_class *)v58 readValueFromKeyValuePair:v55];
            if (v59)
            {
              v60 = [v55 key];

              if (v60)
              {
                v61 = [v55 key];
                [v46 setObject:v59 forKey:v61];
              }
            }
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v113 objects:v124 count:16];
        }
        while (v51);
      }

      v64 = [v102 plistSidecar];

      if (v64)
      {
        v65 = (void *)MEMORY[0x1E4F28F98];
        v66 = [v102 plistSidecar];
        uint64_t v112 = 0;
        v67 = [v65 propertyListWithData:v66 options:0 format:0 error:&v112];

        [v46 addEntriesFromDictionary:v67];
      }
      uint64_t v68 = [v102 version];
      uint64_t v69 = [v102 clientVersion];
      id v18 = v95;
      id v17 = v97;
      v20 = v93;
    }
    else
    {
      *(void *)v124 = 0;
      v70 = [MEMORY[0x1E4F28F98] propertyListWithData:v45 options:0 format:0 error:v124];
      v71 = [v70 objectForKey:@"data"];
      [v46 addEntriesFromDictionary:v71];
      v72 = [v70 objectForKey:@"version"];
      uint64_t v68 = [v72 unsignedIntegerValue];

      v73 = [v70 objectForKey:@"clientVersion"];
      uint64_t v69 = [v73 unsignedIntegerValue];
    }
    double v74 = CFAbsoluteTimeGetCurrent();
    v75 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
    {
      v76 = *p_name;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v76;
      __int16 v118 = 2048;
      double v119 = v74 - Current;
      v77 = v75;
      _os_log_impl(&dword_1A460D000, v77, OS_LOG_TYPE_INFO, "Loaded %@ cache in %f ms", buf, 0x16u);
    }
    if (v68 != 7)
    {
      -[FCKeyValueStore _clearStore]((uint64_t)v22);
      id v45 = 0;
LABEL_42:
      v40 = v100;
      goto LABEL_61;
    }
    v40 = v100;
    if (v69 == v22->_clientVersion)
    {
      id v45 = v46;
LABEL_61:

      id v16 = a9;
LABEL_62:

      uint64_t v90 = [v40 dictionaryWithDictionary:v45];
      unsafeObjectsByKey = v22->_unsafeObjectsByKey;
      v22->_unsafeObjectsByKey = (NSMutableDictionary *)v90;

      objc_storeStrong((id *)&v22->_savePolicy, v16);
      goto LABEL_63;
    }
    if ((v22->_optionsMask & 2) != 0)
    {
      v78 = *p_migrator;
      if (!*p_migrator)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v89 = (void *)[[NSString alloc] initWithFormat:@"must have a migrator in order to migrate between KVS client versions"];
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "-[FCKeyValueStore _loadFromDisk]";
          __int16 v118 = 2080;
          double v119 = COERCE_DOUBLE("FCKeyValueStore.m");
          __int16 v120 = 1024;
          int v121 = 523;
          __int16 v122 = 2114;
          v123 = v89;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          if ((v22->_optionsMask & 2) == 0) {
            goto LABEL_60;
          }
          v78 = *p_migrator;
        }
        else
        {
          v78 = 0;
        }
      }
      if ([v78 keyValueStore:v22 canMigrateFromVersion:v69])
      {
        v94 = v20;
        id v96 = v18;
        id v98 = v17;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        v79 = [v46 allKeys];
        v80 = (void *)[v79 copy];

        uint64_t v81 = [v80 countByEnumeratingWithState:&v108 objects:buf count:16];
        if (v81)
        {
          uint64_t v82 = v81;
          uint64_t v83 = *(void *)v109;
          do
          {
            for (uint64_t j = 0; j != v82; ++j)
            {
              if (*(void *)v109 != v83) {
                objc_enumerationMutation(v80);
              }
              uint64_t v85 = *(void *)(*((void *)&v108 + 1) + 8 * j);
              v86 = [v46 objectForKey:v85];
              v87 = [(FCKeyValueStoreMigrating *)v22->_migrator keyValueStore:v22 migrateObject:v86 forKey:v85 fromVersion:v69];
              if (v87) {
                [v46 setObject:v87 forKey:v85];
              }
              else {
                [v46 removeObjectForKey:v85];
              }
            }
            uint64_t v82 = [v80 countByEnumeratingWithState:&v108 objects:buf count:16];
          }
          while (v82);
        }

        id v45 = v46;
        id v18 = v96;
        id v17 = v98;
        v20 = v94;
        goto LABEL_42;
      }
    }
LABEL_60:
    -[FCKeyValueStore _clearStore]((uint64_t)v22);
    id v45 = 0;
    goto LABEL_61;
  }
LABEL_63:

  return v22;
}

- (NSString)storeDirectory
{
  return self->_storeDirectory;
}

uint64_t __26__FCKeyValueStore_allKeys__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 allKeys];
  return MEMORY[0x1F41817F8]();
}

uint64_t __45__FCKeyValueStore_addAllEntriesToDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
}

uint64_t __34__FCKeyValueStore_objectsForKeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "fc_subdictionaryForKeys:", *(void *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

uint64_t __31__FCKeyValueStore_asDictionary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

uint64_t __53__FCKeyValueStore_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateKeysAndObjectsUsingBlock:*(void *)(a1 + 32)];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __36__FCKeyValueStore_setObject_forKey___block_invoke_2;
      v10[3] = &unk_1E5B5C7A8;
      id v11 = v7;
      id v12 = v6;
      -[FCKeyValueStore _maybeWriteObjectsByKey:]((uint64_t)self, v10);
    }
    else
    {
      [(FCKeyValueStore *)self removeObjectForKey:v7];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "key");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCKeyValueStore setObject:forKey:]";
    __int16 v15 = 2080;
    id v16 = "FCKeyValueStore.m";
    __int16 v17 = 1024;
    int v18 = 146;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (void)_maybeWriteObjectsByKey:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (a1)
  {
    [*(id *)(a1 + 64) lock];
    int v4 = *(unsigned __int8 *)(a1 + 9);
    int v5 = v3[2](v3, *(void *)(a1 + 56));
    int v6 = v5;
    char v7 = *(unsigned char *)(a1 + 9) ? 1 : v5;
    *(unsigned char *)(a1 + 9) = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v8;

    [*(id *)(a1 + 64) unlock];
    if (!v4)
    {
      if (v6)
      {
        id v10 = (void *)FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v11;
          id v12 = v10;
          _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "Key-value store <%@> will schedule save", buf, 0xCu);
        }
        id v13 = *(id *)(a1 + 104);
        objc_opt_class();
        self;
        v14 = FCPersistenceQueue();
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __43__FCKeyValueStore__maybeWriteObjectsByKey___block_invoke;
        v15[3] = &unk_1E5B4C018;
        v15[4] = a1;
        [v13 scheduleSaveOnQueue:v14 handler:v15];
      }
    }
  }
}

BOOL __36__FCKeyValueStore_setObject_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 objectForKey:*(void *)(a1 + 32)];
  int v5 = *(void **)(a1 + 40);

  if (v4 != v5) {
    [v3 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  }

  return v4 != v5;
}

uint64_t __38__FCKeyValueStore__writeObjectsByKey___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __38__FCKeyValueStore_removeObjectForKey___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

uint64_t __44__FCKeyValueStore_addEntriesFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addEntriesFromDictionary:*(void *)(a1 + 32)];
}

void __50__FCKeyValueStore_updateObjectsForKeys_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = objc_msgSend(v3, "objectForKey:", v9, (void)v12);
        if (v10)
        {
          uint64_t v11 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          [v3 setObject:v11 forKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)setJSONEncodingHandlersWithObjectHandler:(id)a3 arrayObjectHandler:(id)a4 dictionaryKeyHandler:(id)a5 dictionaryValueHandler:(id)a6
{
  if (self)
  {
    id newValue = a6;
    id v10 = a5;
    id v11 = a4;
    objc_setProperty_nonatomic_copy(self, v12, a3, 112);
    objc_setProperty_nonatomic_copy(self, v13, v11, 120);

    objc_setProperty_nonatomic_copy(self, v14, v10, 128);
    objc_setProperty_nonatomic_copy(self, v15, newValue, 136);
  }
}

- (void)setShouldExportJSONSidecar:(BOOL)a3
{
  self->_shouldExportJSONSidecar = a3;
}

- (void)setObjects:(id)a3 forKeys:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v7];
      [(FCKeyValueStore *)self addEntriesFromDictionary:v9];

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "objects");
    *(_DWORD *)buf = 136315906;
    SEL v13 = "-[FCKeyValueStore setObjects:forKeys:]";
    __int16 v14 = 2080;
    SEL v15 = "FCKeyValueStore.m";
    __int16 v16 = 1024;
    int v17 = 170;
    __int16 v18 = 2114;
    __int16 v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v8)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "keys");
      *(_DWORD *)buf = 136315906;
      SEL v13 = "-[FCKeyValueStore setObjects:forKeys:]";
      __int16 v14 = 2080;
      SEL v15 = "FCKeyValueStore.m";
      __int16 v16 = 1024;
      int v17 = 171;
      __int16 v18 = 2114;
      __int16 v19 = v11;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
LABEL_9:
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__FCKeyValueStore_addEntriesFromDictionary___block_invoke_2;
    v6[3] = &unk_1E5B4BF78;
    id v7 = v4;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v6);
  }
}

- (void)updateObjectsForKeys:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v7 && v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__FCKeyValueStore_updateObjectsForKeys_withBlock___block_invoke_2;
    v9[3] = &unk_1E5B54370;
    id v10 = v6;
    id v11 = v7;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v9);
  }
}

- (NSDate)modificationDate
{
  id v2 = self;
  if (self) {
    self = (FCKeyValueStore *)self->_lock;
  }
  [(FCKeyValueStore *)self lock];
  modificationDate = v2->_modificationDate;
  if (!modificationDate)
  {
    if ((v2->_optionsMask & 4) != 0)
    {
      modificationDate = 0;
    }
    else
    {
      storeURL = v2->_storeURL;
      id v14 = 0;
      uint64_t v5 = *MEMORY[0x1E4F1C530];
      id v6 = storeURL;
      BOOL v7 = [(NSURL *)v6 getResourceValue:&v14 forKey:v5 error:0];
      id v8 = v14;
      id v9 = v14;

      if (v7) {
        objc_storeStrong((id *)&v2->_modificationDate, v8);
      }

      modificationDate = v2->_modificationDate;
    }
  }
  id v10 = modificationDate;
  [(NFLocking *)v2->_lock unlock];
  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  SEL v12 = v11;

  return v12;
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->_optionsMask = self->_optionsMask & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)saveWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  self;
  uint64_t v5 = FCPersistenceQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__FCKeyValueStore_saveWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5B4CC80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__FCKeyValueStore_removeObjectForKey___block_invoke_2;
    v6[3] = &unk_1E5B4BF78;
    id v7 = v4;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v6);
  }
}

- (void)_writeObjectsByKey:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__FCKeyValueStore__writeObjectsByKey___block_invoke;
    v5[3] = &unk_1E5B5C870;
    id v6 = v3;
    -[FCKeyValueStore _maybeWriteObjectsByKey:](a1, v5);
  }
}

- (NSDictionary)asDictionary
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__92;
  id v9 = __Block_byref_object_dispose__92;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__FCKeyValueStore_asDictionary__block_invoke;
  v4[3] = &unk_1E5B5C7D0;
  v4[4] = &v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

uint64_t __45__FCKeyValueStore_saveWithCompletionHandler___block_invoke(uint64_t a1)
{
  -[FCKeyValueStore _save](*(void *)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_save
{
  v83[2] = *MEMORY[0x1E4F143B8];
  if (a1 && (*(unsigned char *)(a1 + 80) & 4) == 0)
  {
    [*(id *)(a1 + 64) lock];
    if (*(unsigned char *)(a1 + 9)) {
      id v2 = (void *)[*(id *)(a1 + 56) copy];
    }
    else {
      id v2 = 0;
    }
    *(unsigned char *)(a1 + 9) = 0;
    [*(id *)(a1 + 64) unlock];
    if (v2)
    {
      id v3 = [(id)a1 storeDirectory];
      uint64_t v65 = a1;
      uint64_t v67 = [v3 stringByAppendingPathComponent:*(void *)(a1 + 32)];

      uint64_t v68 = [MEMORY[0x1E4F1CA60] dictionary];
      id v4 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      v66 = v2;
      id v5 = v2;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v71 objects:v77 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v72 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v71 + 1) + 8 * i);
            id v11 = [v5 objectForKey:v10];
            SEL v12 = v11;
            if (v11 && [v11 conformsToProtocol:&unk_1EF9197D8])
            {
              id v13 = v12;
              [v68 setObject:v13 forKey:v10];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0
                          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                        {
                          id v14 = (void *)[[NSString alloc] initWithFormat:@"%@ is not supported by this key-value store", objc_opt_class()];
                          *(_DWORD *)buf = 136315906;
                          v79 = "-[FCKeyValueStore _save]";
                          __int16 v80 = 2080;
                          uint64_t v81 = "FCKeyValueStore.m";
                          __int16 v82 = 1024;
                          LODWORD(v83[0]) = 624;
                          WORD2(v83[0]) = 2114;
                          *(void *)((char *)v83 + 6) = v14;
                          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
                        }
                      }
                    }
                  }
                }
              }
              [v4 setObject:v12 forKey:v10];
              id v13 = 0;
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v71 objects:v77 count:16];
        }
        while (v7);
      }

      id v15 = v5;
      self;
      if (qword_1EB5D1C48 != -1) {
        dispatch_once(&qword_1EB5D1C48, &__block_literal_global_195);
      }
      __int16 v16 = (void *)v67;
      if (_MergedGlobals_230 && [(id)a1 shouldExportJSONSidecar])
      {
        int v17 = -[FCKeyValueStore fc_jsonEncodableDictionaryWithDictionary:](a1, v15);
        __int16 v18 = objc_msgSend(v17, "fc_jsonString");

        if (v18)
        {
          __int16 v19 = FCURLForFeldsparUserAccountHomeDirectory();
          uint64_t v20 = [v19 URLByAppendingPathComponent:@"automation_cloudkit_data" isDirectory:1];

          uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v76 = 0;
          [v21 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:&v76];
          id v22 = v76;

          if (v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v57 = [NSString alloc];
            v58 = [v22 localizedDescription];
            v59 = (void *)[v57 initWithFormat:@"Error creating directy at path %@ : %@", v20, v58];
            *(_DWORD *)buf = 136315906;
            v79 = "-[FCKeyValueStore _maybeSaveJSONRepresentationWithDictionary:]";
            __int16 v80 = 2080;
            uint64_t v81 = "FCKeyValueStore.m";
            __int16 v82 = 1024;
            LODWORD(v83[0]) = 581;
            WORD2(v83[0]) = 2114;
            *(void *)((char *)v83 + 6) = v59;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          id v23 = [*(id *)(a1 + 32) stringByAppendingPathExtension:@"json"];
          v24 = [v20 URLByAppendingPathComponent:v23];

          id v75 = 0;
          [v18 writeToURL:v24 atomically:1 encoding:4 error:&v75];
          id v25 = v75;
          if (v25 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v60 = [NSString alloc];
            v64 = [v25 localizedDescription];
            v61 = (void *)[v60 initWithFormat:@"Error generating JSON : %@", v64];
            *(_DWORD *)buf = 136315906;
            v79 = "-[FCKeyValueStore _maybeSaveJSONRepresentationWithDictionary:]";
            __int16 v80 = 2080;
            uint64_t v81 = "FCKeyValueStore.m";
            __int16 v82 = 1024;
            LODWORD(v83[0]) = 589;
            WORD2(v83[0]) = 2114;
            *(void *)((char *)v83 + 6) = v61;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
        }
      }
      id v26 = objc_alloc_init(MEMORY[0x1E4F82A90]);
      [v26 setVersion:7];
      [v26 setClientVersion:*(void *)(v65 + 72)];
      char v27 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = *(void **)(v65 + 32);
        id v29 = v28;
        v30 = v27;
        uint64_t v31 = [v68 count];
        *(_DWORD *)buf = 138412546;
        v79 = (const char *)v28;
        __int16 v80 = 2048;
        uint64_t v81 = (char *)v31;
        _os_log_impl(&dword_1A460D000, v30, OS_LOG_TYPE_DEFAULT, "Key-value store <%@> will save %lu pairs", buf, 0x16u);
      }
      id v70 = 0;
      v32 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v70];
      v33 = (char *)v70;
      [v26 setPlistSidecar:v32];

      if ([v4 count] && v33)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v52 = [NSString alloc];
          id v53 = *(id *)(v65 + 32);
          v54 = (void *)[v52 initWithFormat:@"failed to serialize %@ key-value store plist with error: %@", v53, v33];
          *(_DWORD *)buf = 136315906;
          v79 = "-[FCKeyValueStore _save]";
          __int16 v80 = 2080;
          uint64_t v81 = "FCKeyValueStore.m";
          __int16 v82 = 1024;
          LODWORD(v83[0]) = 649;
          WORD2(v83[0]) = 2114;
          *(void *)((char *)v83 + 6) = v54;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        uint64_t v34 = (void *)FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
        {
          v35 = *(const char **)(v65 + 32);
          *(_DWORD *)buf = 138543618;
          v79 = v35;
          __int16 v80 = 2114;
          uint64_t v81 = v33;
          v36 = v34;
          _os_log_error_impl(&dword_1A460D000, v36, OS_LOG_TYPE_ERROR, "failed to serialize %{public}@ key-value store plist with error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        double Current = CFAbsoluteTimeGetCurrent();
        uint64_t v38 = objc_alloc_init(FCKeyValueStoreWriter);
        if ([(FCKeyValueStoreWriter *)v38 writeKVS:v26 codables:v68 toFile:v67 size:v65 + 40])
        {
          v39 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v67 isDirectory:0];
          v40 = [NSNumber numberWithInt:(*(void *)(v65 + 80) & 1) == 0];
          uint64_t v41 = *MEMORY[0x1E4F1CE10];
          id v69 = 0;
          char v42 = [v39 setResourceValue:v40 forKey:v41 error:&v69];
          v63 = (char *)v69;

          if ((v42 & 1) == 0)
          {
            v43 = FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v79 = (const char *)v39;
              __int16 v80 = 2114;
              uint64_t v81 = v63;
              _os_log_error_impl(&dword_1A460D000, v43, OS_LOG_TYPE_ERROR, "Failed to set backup status for %{public}@ -- %{public}@", buf, 0x16u);
            }
          }
          double v44 = CFAbsoluteTimeGetCurrent();
          id v45 = (void *)FCDefaultLog;
          if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
          {
            v46 = v39;
            v47 = *(void **)(v65 + 32);
            v48 = (void *)MEMORY[0x1E4F28B68];
            id v62 = v47;
            v49 = v45;
            uint64_t v50 = objc_msgSend(v48, "stringFromByteCount:countStyle:", objc_msgSend((id)v65, "storeSize"), 0);
            *(_DWORD *)buf = 138543874;
            v79 = (const char *)v47;
            v39 = v46;
            __int16 v80 = 2048;
            uint64_t v81 = (char *)((v44 - Current) * 1000.0);
            __int16 v16 = (void *)v67;
            __int16 v82 = 2114;
            v83[0] = v50;
            _os_log_impl(&dword_1A460D000, v49, OS_LOG_TYPE_DEFAULT, "Key-value store <%{public}@> did save in %lums with size %{public}@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v51 = (void *)FCDefaultLog;
          if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
          {
            v55 = *(const char **)(v65 + 32);
            *(_DWORD *)buf = 138543362;
            v79 = v55;
            v56 = v51;
            _os_log_error_impl(&dword_1A460D000, v56, OS_LOG_TYPE_ERROR, "Failed to save key-value store <%{public}@>", buf, 0xCu);
          }
        }
      }
      id v2 = v66;
    }
  }
}

- (unint64_t)storeSize
{
  return self->_storeSize;
}

- (FCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 classRegistry:(id)a7
{
  return [(FCKeyValueStore *)self initWithName:a3 directory:a4 version:a5 options:a6 classRegistry:a7 migrator:0];
}

- (FCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 classRegistry:(id)a7 migrator:(id)a8
{
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  __int16 v16 = +[FCKeyValueStoreSavePolicy defaultPolicy];
  int v17 = [(FCKeyValueStore *)self initWithName:v15 directory:v14 version:a5 options:a6 classRegistry:v13 migrator:0 savePolicy:v16];

  return v17;
}

- (void)addAllEntriesToDictionary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__FCKeyValueStore_addAllEntriesToDictionary___block_invoke;
  v6[3] = &unk_1E5B5C820;
  id v7 = v4;
  id v5 = v4;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v6);
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__FCKeyValueStore_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v6[3] = &unk_1E5B4DDF8;
  id v7 = v4;
  id v5 = v4;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v6);
}

void __35__FCKeyValueStore_shouldDumpToJSON__block_invoke()
{
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    if ([v2 BOOLForKey:@"running_ui_automation"])
    {
      v0 = [MEMORY[0x1E4F28B50] mainBundle];
      v1 = [v0 bundleIdentifier];
      _MergedGlobals_230 = [v1 isEqualToString:@"com.apple.news"];
    }
    else
    {
      _MergedGlobals_230 = 0;
    }
  }
  else
  {
    _MergedGlobals_230 = 0;
  }
}

- (id)objectsForKeys:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__92;
  id v15 = __Block_byref_object_dispose__92;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__FCKeyValueStore_objectsForKeys___block_invoke;
  v8[3] = &unk_1E5B51260;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (FCKeyValueStore)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCKeyValueStore init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCKeyValueStore.m";
    __int16 v11 = 1024;
    int v12 = 77;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCKeyValueStore init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)containsObjectForKey:(id)a3
{
  id v3 = [(FCKeyValueStore *)self objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)replaceContentsWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__FCKeyValueStore_replaceContentsWithDictionary___block_invoke_2;
    v6[3] = &unk_1E5B4BF78;
    id v7 = v4;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v6);
  }
}

void __49__FCKeyValueStore_replaceContentsWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeAllObjects];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__FCKeyValueStore_removeObjectsForKeys___block_invoke_2;
    v5[3] = &unk_1E5B4BF78;
    id v6 = v4;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v5);
  }
}

uint64_t __40__FCKeyValueStore_removeObjectsForKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeObjectsForKeys:*(void *)(a1 + 32)];
}

- (void)removeAllObjects
{
}

uint64_t __35__FCKeyValueStore_removeAllObjects__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (void)setBoolValue:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(FCKeyValueStore *)self setObject:v8 forKey:v7];
}

- (BOOL)BOOLValueForKey:(id)a3
{
  id v3 = [(FCKeyValueStore *)self objectForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)allObjects
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__92;
  __int16 v9 = __Block_byref_object_dispose__92;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__FCKeyValueStore_allObjects__block_invoke;
  v4[3] = &unk_1E5B5C7D0;
  v4[4] = &v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __29__FCKeyValueStore_allObjects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allValues];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (id)keysOfEntriesPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__92;
  uint64_t v15 = __Block_byref_object_dispose__92;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__FCKeyValueStore_keysOfEntriesPassingTest___block_invoke;
  v8[3] = &unk_1E5B5C7F8;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __44__FCKeyValueStore_keysOfEntriesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 keysOfEntriesPassingTest:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (void)enumerateKeysAndObjectsForKeys:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__FCKeyValueStore_enumerateKeysAndObjectsForKeys_usingBlock___block_invoke;
  v10[3] = &unk_1E5B5C848;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v10);
}

void __61__FCKeyValueStore_enumerateKeysAndObjectsForKeys_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__FCKeyValueStore_enumerateKeysAndObjectsForKeys_usingBlock___block_invoke_2;
  v4[3] = &unk_1E5B59128;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __61__FCKeyValueStore_enumerateKeysAndObjectsForKeys_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)save
{
  objc_opt_class();
  self;
  uint64_t v3 = FCPersistenceQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__FCKeyValueStore_save__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __23__FCKeyValueStore_save__block_invoke(uint64_t a1)
{
}

void __43__FCKeyValueStore__maybeWriteObjectsByKey___block_invoke(uint64_t a1)
{
}

- (void)_clearStore
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtURL:*(void *)(a1 + 48) error:0];

  *(void *)(a1 + 40) = 0;
}

- (id)jsonEncodableObject
{
  p_isa = (id *)&self->super.isa;
  if (self)
  {
    [(NFLocking *)self->_lock lock];
    uint64_t v3 = (void *)[p_isa[7] copy];
    [p_isa[8] unlock];
    -[FCKeyValueStore fc_jsonEncodableDictionaryWithDictionary:]((uint64_t)p_isa, v3);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
  }
  return p_isa;
}

- (id)fc_jsonEncodableDictionaryWithDictionary:(uint64_t)a1
{
  uint64_t v4 = *(void **)(a1 + 112);
  uint64_t v3 = *(void **)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 136);
  id v6 = *(id *)(a1 + 128);
  id v7 = v3;
  id v8 = v4;
  id v9 = objc_msgSend(a2, "fc_jsonEncodableDictionaryWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", v8, v7, v6, v5);

  return v9;
}

- (BOOL)shouldExportJSONSidecar
{
  return self->_shouldExportJSONSidecar;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dictionaryValueHandler, 0);
  objc_storeStrong(&self->_dictionaryKeyHandler, 0);
  objc_storeStrong(&self->_arrayObjectHandler, 0);
  objc_storeStrong(&self->_objectHandler, 0);
  objc_storeStrong((id *)&self->_savePolicy, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_classRegistry, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_unsafeObjectsByKey, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
}

@end