@interface TAPersistenceManager
- (BOOL)_createDirectoryIfNotPresent;
- (BOOL)load;
- (BOOL)reset;
- (BOOL)save;
- (NSHashTable)observers;
- (TAPersistenceManager)initWithSettings:(id)a3;
- (TAPersistenceManagerSettings)settings;
- (TAPersistenceStore)store;
- (void)_notifyObserversOnReadFromURL:(id)a3 bytes:(unint64_t)a4;
- (void)_notifyObserversOnWriteToURL:(id)a3 bytes:(unint64_t)a4;
- (void)addObserver:(id)a3;
- (void)onUpdatedTAStore:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation TAPersistenceManager

- (TAPersistenceManager)initWithSettings:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TAPersistenceManager;
  v6 = [(TAPersistenceManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    if (![(TAPersistenceManager *)v7 _createDirectoryIfNotPresent])
    {
      v12 = 0;
      goto LABEL_6;
    }
    v8 = objc_alloc_init(TAPersistenceStore);
    store = v7->_store;
    v7->_store = v8;

    uint64_t v10 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v10;
  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (BOOL)_createDirectoryIfNotPresent
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(TAPersistenceManagerSettings *)self->_settings persistenceDirectoryURL];
  id v11 = 0;
  [v3 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
  id v5 = v11;

  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      id v8 = [v5 description];
      uint64_t v9 = [v8 UTF8String];
      *(_DWORD *)buf = 68289283;
      int v13 = 0;
      __int16 v14 = 2082;
      v15 = "";
      __int16 v16 = 2081;
      uint64_t v17 = v9;
      _os_log_impl(&dword_22345C000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager encountered error in creating directory\", \"error\":\"%{private}s\"}", buf, 0x1Cu);
    }
  }

  return v5 == 0;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversOnWriteToURL:(id)a3 bytes:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "didWriteToURL:bytes:", v6, a4, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversOnReadFromURL:(id)a3 bytes:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "didReadFromURL:bytes:", v6, a4, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)load
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v3 = [(TAPersistenceManagerSettings *)self->_settings _getStoreURL];
  v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v27 = 0;
    v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:2 error:&v27];
    id v8 = v27;
    if (v8)
    {
      uint64_t v9 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = v9;
        id v11 = [v3 absoluteString];
        uint64_t v12 = [v11 UTF8String];
        id v13 = [v8 description];
        uint64_t v14 = [v13 UTF8String];
        *(_DWORD *)buf = 68289539;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = "";
        __int16 v32 = 2081;
        uint64_t v33 = v12;
        __int16 v34 = 2081;
        uint64_t v35 = v14;
        _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager encountered error in loading file\", \"url\":\"%{private}s\", \"error\":\"%{private}s\"}", buf, 0x26u);
      }
      BOOL v15 = 0;
    }
    else
    {
      id v26 = 0;
      uint64_t v17 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v26];
      id v18 = v26;
      BOOL v15 = v18 == 0;
      if (v18)
      {
        v19 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          log = v19;
          id v20 = [v3 absoluteString];
          uint64_t v21 = [v20 UTF8String];
          id v22 = [v18 description];
          uint64_t v23 = [v22 UTF8String];
          *(_DWORD *)buf = 68289539;
          int v29 = 0;
          __int16 v30 = 2082;
          v31 = "";
          __int16 v32 = 2081;
          uint64_t v33 = v21;
          __int16 v34 = 2081;
          uint64_t v35 = v23;
          _os_log_impl(&dword_22345C000, log, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager encountered error in unarchiving store\", \"url\":\"%{private}s\", \"error\":\"%{private}s\"}", buf, 0x26u);
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_store, v17);
        -[TAPersistenceManager _notifyObserversOnReadFromURL:bytes:](self, "_notifyObserversOnReadFromURL:bytes:", v3, [v7 length]);
      }
    }
  }
  else
  {
    long long v16 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      _os_log_impl(&dword_22345C000, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAPersistenceManager file does not exist\"}", buf, 0x12u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)save
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (self->_store)
  {
    v3 = [(TAPersistenceManagerSettings *)self->_settings _getStoreURL];
    v4 = (void *)MEMORY[0x223CB66C0]();
    store = self->_store;
    id v26 = 0;
    char v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:store requiringSecureCoding:1 error:&v26];
    id v7 = v26;
    id v8 = (void *)TAStatusLog;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = v8;
        id v10 = [v7 description];
        uint64_t v11 = [v10 UTF8String];
        *(_DWORD *)buf = 68289283;
        int v28 = 0;
        __int16 v29 = 2082;
        __int16 v30 = "";
        __int16 v31 = 2081;
        uint64_t v32 = v11;
        _os_log_impl(&dword_22345C000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager error archiving store\", \"error\":\"%{private}s\"}", buf, 0x1Cu);
      }
      uint64_t v12 = 0;
      int v13 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      {
        long long v16 = v8;
        id v17 = [v3 path];
        uint64_t v18 = [v17 UTF8String];
        *(_DWORD *)buf = 68289283;
        int v28 = 0;
        __int16 v29 = 2082;
        __int16 v30 = "";
        __int16 v31 = 2081;
        uint64_t v32 = v18;
        _os_log_impl(&dword_22345C000, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAPersistenceManager saving to location\", \"path\":\"%{private}s\"}", buf, 0x1Cu);
      }
      id v25 = 0;
      [v6 writeToURL:v3 options:1073741825 error:&v25];
      id v19 = v25;
      if (v19)
      {
        id v20 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = v20;
          id v22 = [v19 description];
          uint64_t v23 = [v22 UTF8String];
          *(_DWORD *)buf = 68289283;
          int v28 = 0;
          __int16 v29 = 2082;
          __int16 v30 = "";
          __int16 v31 = 2081;
          uint64_t v32 = v23;
          _os_log_impl(&dword_22345C000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager error archiving store\", \"error\":\"%{private}s\"}", buf, 0x1Cu);
        }
        uint64_t v12 = 0;
        int v13 = 1;
      }
      else
      {
        uint64_t v12 = [v6 length];
        int v13 = 0;
      }
    }
    BOOL v15 = v13 == 0;
    if (!v13) {
      [(TAPersistenceManager *)self _notifyObserversOnWriteToURL:v3 bytes:v12];
    }
  }
  else
  {
    uint64_t v14 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v28 = 0;
      __int16 v29 = 2082;
      __int16 v30 = "";
      _os_log_impl(&dword_22345C000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager no store to save\"}", buf, 0x12u);
    }
    return 0;
  }
  return v15;
}

- (BOOL)reset
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(TAPersistenceManagerSettings *)self->_settings persistenceDirectoryURL];
  id v14 = 0;
  [v3 removeItemAtURL:v4 error:&v14];
  id v5 = v14;

  if (v5)
  {
    char v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      id v8 = [v5 description];
      uint64_t v9 = [v8 UTF8String];
      *(_DWORD *)buf = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      uint64_t v18 = "";
      __int16 v19 = 2081;
      uint64_t v20 = v9;
      _os_log_impl(&dword_22345C000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager error reseting directory\", \"error\":\"%{private}s\"}", buf, 0x1Cu);
    }
    goto LABEL_6;
  }
  if (![(TAPersistenceManager *)self _createDirectoryIfNotPresent])
  {
LABEL_6:
    BOOL v12 = 0;
    goto LABEL_7;
  }
  id v10 = objc_alloc_init(TAPersistenceStore);
  store = self->_store;
  self->_store = v10;

  BOOL v12 = 1;
LABEL_7:

  return v12;
}

- (void)onUpdatedTAStore:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceRecord];
  [(TAPersistenceStore *)self->_store setDeviceRecord:v5];

  id v6 = [v4 visitState];

  [(TAPersistenceStore *)self->_store setVisitState:v6];
}

- (TAPersistenceStore)store
{
  return self->_store;
}

- (TAPersistenceManagerSettings)settings
{
  return (TAPersistenceManagerSettings *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSettings:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end