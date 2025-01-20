@interface SAPersistenceManager
- (BOOL)_createDirectoryIfNotPresent;
- (BOOL)load;
- (BOOL)reset;
- (BOOL)save;
- (NSHashTable)observers;
- (SAPersistenceManager)initWithSettings:(id)a3;
- (SAPersistenceManagerSettings)settings;
- (SAPersistenceStore)store;
- (void)_notifyObserversOnReadFromURL:(id)a3 bytes:(unint64_t)a4;
- (void)_notifyObserversOnWriteToURL:(id)a3 bytes:(unint64_t)a4;
- (void)addObserver:(id)a3;
- (void)onUpdatedMonitoringSessionRecord:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation SAPersistenceManager

- (SAPersistenceManager)initWithSettings:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SAPersistenceManager;
  v6 = [(SAPersistenceManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    if (![(SAPersistenceManager *)v7 _createDirectoryIfNotPresent])
    {
      v12 = 0;
      goto LABEL_6;
    }
    v8 = objc_alloc_init(SAPersistenceStore);
    store = v7->_store;
    v7->_store = v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v10;
  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (BOOL)_createDirectoryIfNotPresent
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(SAPersistenceManagerSettings *)self->_settings persistenceDirectoryURL];
  id v11 = 0;
  [v3 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
  id v5 = v11;

  if (v5)
  {
    v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
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
      _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAPersistenceManager encountered error in creating directory\", \"error\":\"%{private}s\"}", buf, 0x1Cu);
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(SAPersistenceManagerSettings *)self->_settings _getStoreURL];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v27 = 0;
    v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:2 error:&v27];
    id v8 = v27;
    if (v8)
    {
      uint64_t v9 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
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
        _os_log_impl(&dword_1D15FC000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAPersistenceManager encountered error in loading file\", \"url\":\"%{private}s\", \"error\":\"%{private}s\"}", buf, 0x26u);
      }
      BOOL v15 = 0;
    }
    else
    {
      id v26 = 0;
      uint64_t v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v26];
      id v18 = v26;
      BOOL v15 = v18 == 0;
      if (v18)
      {
        v19 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
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
          _os_log_impl(&dword_1D15FC000, log, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAPersistenceManager encountered error in unarchiving store\", \"url\":\"%{private}s\", \"error\":\"%{private}s\"}", buf, 0x26u);
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_store, v17);
        -[SAPersistenceManager _notifyObserversOnReadFromURL:bytes:](self, "_notifyObserversOnReadFromURL:bytes:", v3, [v7 length]);
      }
    }
  }
  else
  {
    long long v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAPersistenceManager file does not exist\"}", buf, 0x12u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)save
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_store)
  {
    v3 = [(SAPersistenceManagerSettings *)self->_settings _getStoreURL];
    v4 = (void *)MEMORY[0x1D25F7C90]();
    store = self->_store;
    id v24 = 0;
    char v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:store requiringSecureCoding:1 error:&v24];
    id v7 = v24;
    id v8 = (void *)TASALog;
    if (v7)
    {
      if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        BOOL v13 = 0;
LABEL_15:

        return v13;
      }
      uint64_t v9 = v8;
      id v10 = [v7 description];
      uint64_t v11 = [v10 UTF8String];
      *(_DWORD *)buf = 68289283;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      __int16 v29 = 2081;
      uint64_t v30 = v11;
      _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAPersistenceManager error archiving store\", \"error\":\"%{private}s\"}", buf, 0x1Cu);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = v8;
        id v15 = [v3 path];
        uint64_t v16 = [v15 UTF8String];
        *(_DWORD *)buf = 68289283;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2081;
        uint64_t v30 = v16;
        _os_log_impl(&dword_1D15FC000, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAPersistenceManager saving to location\", \"path\":\"%{private}s\"}", buf, 0x1Cu);
      }
      id v23 = 0;
      [v6 writeToURL:v3 options:1073741825 error:&v23];
      id v10 = v23;
      if (!v10)
      {
        uint64_t v22 = [v6 length];

        [(SAPersistenceManager *)self _notifyObserversOnWriteToURL:v3 bytes:v22];
        BOOL v13 = 1;
        goto LABEL_15;
      }
      uint64_t v17 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        id v18 = v17;
        id v19 = [v10 description];
        uint64_t v20 = [v19 UTF8String];
        *(_DWORD *)buf = 68289283;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2081;
        uint64_t v30 = v20;
        _os_log_impl(&dword_1D15FC000, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAPersistenceManager error archiving store\", \"error\":\"%{private}s\"}", buf, 0x1Cu);
      }
    }

    goto LABEL_14;
  }
  uint64_t v12 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289026;
    int v26 = 0;
    __int16 v27 = 2082;
    v28 = "";
    _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAPersistenceManager no store to save\"}", buf, 0x12u);
  }
  return 0;
}

- (BOOL)reset
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(SAPersistenceManagerSettings *)self->_settings persistenceDirectoryURL];
  id v14 = 0;
  [v3 removeItemAtURL:v4 error:&v14];
  id v5 = v14;

  if (v5)
  {
    char v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      id v8 = [v5 description];
      uint64_t v9 = [v8 UTF8String];
      *(_DWORD *)buf = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      id v18 = "";
      __int16 v19 = 2081;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAPersistenceManager error reseting directory\", \"error\":\"%{private}s\"}", buf, 0x1Cu);
    }
    goto LABEL_6;
  }
  if (![(SAPersistenceManager *)self _createDirectoryIfNotPresent])
  {
LABEL_6:
    BOOL v12 = 0;
    goto LABEL_7;
  }
  id v10 = objc_alloc_init(SAPersistenceStore);
  store = self->_store;
  self->_store = v10;

  BOOL v12 = 1;
LABEL_7:

  return v12;
}

- (void)onUpdatedMonitoringSessionRecord:(id)a3
{
  [(SAPersistenceStore *)self->_store setMonitoringSessionRecord:a3];
  [(SAPersistenceManager *)self save];
}

- (SAPersistenceStore)store
{
  return self->_store;
}

- (SAPersistenceManagerSettings)settings
{
  return (SAPersistenceManagerSettings *)objc_getProperty(self, a2, 16, 1);
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