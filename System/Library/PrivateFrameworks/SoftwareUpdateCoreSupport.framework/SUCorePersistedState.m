@interface SUCorePersistedState
- (BOOL)BOOLeanForKey:(id)a3;
- (BOOL)BOOLeanForKey:(id)a3 forType:(int)a4;
- (BOOL)defaultLevelLogging;
- (BOOL)isPersistedStateLoaded;
- (BOOL)loadPersistedState;
- (NSMutableDictionary)persistedState;
- (NSString)persistencePath;
- (NSString)versionPolicyLayer;
- (NSString)versionSUCore;
- (OS_dispatch_queue)persistedStateQueue;
- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5;
- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5 issuingDefaultLevelLogging:(BOOL)a6;
- (id)_createEmptyPersistedState;
- (id)_keyNameForPersistedStateType:(int)a3;
- (id)dataForKey:(id)a3;
- (id)dataForKey:(id)a3 forType:(int)a4;
- (id)dateForKey:(id)a3;
- (id)dateForKey:(id)a3 forType:(int)a4;
- (id)description;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryForKey:(id)a3 forType:(int)a4;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)objectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5;
- (id)persistedContentsType;
- (id)persistedCoreVersion;
- (id)persistedPolicyVersion;
- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4;
- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5;
- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5 forType:(int)a6;
- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5;
- (id)stringForKey:(id)a3;
- (id)stringForKey:(id)a3 forType:(int)a4;
- (id)summary;
- (unint64_t)ullForKey:(id)a3;
- (unint64_t)ullForKey:(id)a3 forType:(int)a4;
- (void)_writePersistedState;
- (void)persistBoolean:(BOOL)a3 forKey:(id)a4;
- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistData:(id)a3 forKey:(id)a4;
- (void)persistData:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistData:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistDate:(id)a3 forKey:(id)a4;
- (void)persistDate:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistDate:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistDictionary:(id)a3 forKey:(id)a4;
- (void)persistDictionary:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistDictionary:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistObject:(id)a3 forKey:(id)a4;
- (void)persistObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4;
- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistState;
- (void)persistString:(id)a3 forKey:(id)a4;
- (void)persistString:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistString:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistULL:(unint64_t)a3 forKey:(id)a4;
- (void)persistULL:(unint64_t)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistULL:(unint64_t)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)removePersistedState;
- (void)setDefaultLevelLogging:(BOOL)a3;
- (void)setPersistedState:(id)a3;
- (void)setPersistencePath:(id)a3;
- (void)setVersionPolicyLayer:(id)a3;
- (void)setVersionSUCore:(id)a3;
@end

@implementation SUCorePersistedState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionSUCore, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_versionPolicyLayer, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
  objc_storeStrong((id *)&self->_persistedStateQueue, 0);
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  v8 = objc_msgSend([v6 alloc], "initWithObjects:", a4, 0);
  v9 = [(SUCorePersistedState *)self secureCodedObjectForKey:v7 ofClass:a4 encodeClasses:v8 forType:3];

  return v9;
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5 forType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v12);

  if ((v6 & 0xFFFFFFFE) != 2)
  {
    v21 = +[SUCoreDiag sharedDiag];
    id v22 = [NSString alloc];
    v23 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v6];
    v24 = (void *)[v22 initWithFormat:@"invalid SUCorePersistedStateType (%@) provided for secure coded object persistence", v23];
    [v21 trackAnomaly:@"[PERSISTED_STATE]" forReason:v24 withResult:8253 withError:0];

    id v25 = 0;
    goto LABEL_22;
  }
  v13 = [(SUCorePersistedState *)self dataForKey:v10 forType:v6];
  BOOL v14 = [(SUCorePersistedState *)self defaultLevelLogging];
  if (v13)
  {
    if (v14)
    {
      v15 = +[SUCoreLog sharedLogger];
      v16 = [v15 oslog];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v33 = v10;
        __int16 v34 = 2114;
        id v35 = v11;
        _os_log_impl(&dword_1B4EC2000, v16, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] attempting to load encoded data for key %{public}@ with classes: %{public}@", buf, 0x16u);
      }
    }
    id v31 = 0;
    v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v11 fromData:v13 error:&v31];
    v18 = v31;
    if (v18)
    {
      v19 = +[SUCoreDiag sharedDiag];
      v20 = (void *)[[NSString alloc] initWithFormat:@"NSKeyedUnarchiver error found when attempting to unarchive data for key %@", v10];
      [v19 trackError:@"[PERSISTED_STATE]" forReason:v20 withResult:8254 withError:v18];
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        id v25 = v17;
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      v28 = +[SUCoreDiag sharedDiag];
      v29 = (void *)[[NSString alloc] initWithFormat:@"unarchived object is not of the expected class %@", a4];
      [v28 trackError:@"[PERSISTED_STATE]" forReason:v29 withResult:8255 withError:0];
    }
    id v25 = 0;
    goto LABEL_19;
  }
  if (v14)
  {
    v26 = +[SUCoreLog sharedLogger];
    v18 = [v26 oslog];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v6];
      *(_DWORD *)buf = 138543618;
      id v33 = v10;
      __int16 v34 = 2114;
      id v35 = v27;
      _os_log_impl(&dword_1B4EC2000, v18, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] no data object present in secure coded object persisted state for key %{public}@ and type %{public}@", buf, 0x16u);
    }
    id v25 = 0;
    goto LABEL_20;
  }
  id v25 = 0;
LABEL_21:

LABEL_22:
  return v25;
}

- (id)dataForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [(SUCorePersistedState *)self persistedState];

  if (v8)
  {
    v9 = [(SUCorePersistedState *)self persistedState];
    id v10 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    id v11 = [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];

    if (v11)
    {
      v12 = [v11 safeDataForKey:v6];
      goto LABEL_7;
    }
    BOOL v14 = +[SUCoreDiag sharedDiag];
    id v15 = [NSString alloc];
    v16 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];
  }
  else
  {
    id v11 = +[SUCoreDiag sharedDiag];
    v13 = (void *)[[NSString alloc] initWithFormat:@"persisted state is not loaded, unable to load data value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (BOOL)loadPersistedState
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCorePersistedState *)self persistedState];

  BOOL v5 = [(SUCorePersistedState *)self defaultLevelLogging];
  if (!v4)
  {
    if (v5)
    {
      v9 = +[SUCoreLog sharedLogger];
      id v10 = [v9 oslog];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(SUCorePersistedState *)self summary];
        *(_DWORD *)buf = 138543362;
        __int16 v34 = v11;
        _os_log_impl(&dword_1B4EC2000, v10, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] loading persisted state with summary: %{public}@", buf, 0xCu);
      }
    }
    v12 = (void *)MEMORY[0x1E4F1C9B8];
    v13 = [(SUCorePersistedState *)self persistencePath];
    id v32 = 0;
    BOOL v14 = [v12 dataWithContentsOfFile:v13 options:0 error:&v32];
    id v7 = v32;

    if (v7)
    {
      id v15 = [v7 domain];
      if ([v15 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        if ([v7 code] == 4)
        {

LABEL_27:
          if (![(SUCorePersistedState *)self defaultLevelLogging])
          {
            BOOL v8 = 1;
            goto LABEL_35;
          }
          v23 = +[SUCoreLog sharedLogger];
          v18 = [v23 oslog];

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B4EC2000, v18, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] no persisted state file found at persistence path", buf, 2u);
          }
          BOOL v8 = 1;
LABEL_34:

LABEL_35:
          id v25 = [(SUCorePersistedState *)self persistedState];

          if (!v25)
          {
            v26 = [(SUCorePersistedState *)self _createEmptyPersistedState];
            [(SUCorePersistedState *)self setPersistedState:v26];

            if ([(SUCorePersistedState *)self defaultLevelLogging])
            {
              v27 = +[SUCoreLog sharedLogger];
              v28 = [v27 oslog];

              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = [(SUCorePersistedState *)self persistedState];
                *(_DWORD *)buf = 138543362;
                __int16 v34 = v29;
                _os_log_impl(&dword_1B4EC2000, v28, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] created a new, empty persisted state dictionary: %{public}@", buf, 0xCu);
              }
            }
          }

          goto LABEL_41;
        }
        uint64_t v22 = [v7 code];

        if (v22 == 260) {
          goto LABEL_27;
        }
      }
      else
      {
      }
    }
    else if (v14)
    {
      id v31 = 0;
      v16 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:2 format:0 error:&v31];
      v17 = v31;
      v18 = v17;
      BOOL v8 = v16 != 0;
      if (v16)
      {
        if (v17)
        {
          v19 = +[SUCoreDiag sharedDiag];
          [v19 trackAnomaly:@"[PERSISTED_STATE]", @"an error occurred when loading the persisted state, but the state was still loaded", 8251, v18 forReason withResult withError];
        }
        if ([(SUCorePersistedState *)self defaultLevelLogging])
        {
          v20 = +[SUCoreLog sharedLogger];
          v21 = [v20 oslog];

          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            __int16 v34 = v16;
            _os_log_impl(&dword_1B4EC2000, v21, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] loaded persisted state: %{public}@", buf, 0xCu);
          }
        }
        [(SUCorePersistedState *)self setPersistedState:v16];
      }
      else
      {
        v24 = +[SUCoreDiag sharedDiag];
        [v24 trackError:@"[PERSISTED_STATE]" forReason:@"unable to load persisted state as dictionary" withResult:8106 withError:v18];
      }
      goto LABEL_34;
    }
    v18 = +[SUCoreDiag sharedDiag];
    [v18 trackError:@"[PERSISTED_STATE]" forReason:@"unable to serialize contents of persisted state file" withResult:8106 withError:v7];
    BOOL v8 = 0;
    goto LABEL_34;
  }
  if (v5)
  {
    id v6 = +[SUCoreLog sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v7, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] attempting to load persisted state, but state is already loaded - no operation to perform", buf, 2u);
    }
    BOOL v8 = 1;
LABEL_41:

    return v8;
  }
  return 1;
}

- (NSMutableDictionary)persistedState
{
  return self->_persistedState;
}

- (BOOL)defaultLevelLogging
{
  return self->_defaultLevelLogging;
}

- (OS_dispatch_queue)persistedStateQueue
{
  return self->_persistedStateQueue;
}

- (void)setPersistedState:(id)a3
{
}

- (NSString)persistencePath
{
  return self->_persistencePath;
}

- (id)_keyNameForPersistedStateType:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"SUCorePersistedStateTypeUnknown(%d)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E60B74D0[a3];
  }
  return v3;
}

- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5 issuingDefaultLevelLogging:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SUCorePersistedState;
  BOOL v14 = [(SUCorePersistedState *)&v18 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_persistedStateQueue, a3);
    objc_storeStrong((id *)&v15->_persistencePath, a4);
    objc_storeStrong((id *)&v15->_versionPolicyLayer, a5);
    v15->_defaultLevelLogging = a6;
    objc_storeStrong((id *)&v15->_versionSUCore, @"2.1.0");
    persistedState = v15->_persistedState;
    v15->_persistedState = 0;
  }
  return v15;
}

- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5
{
  return [(SUCorePersistedState *)self initWithDispatchQueue:a3 withPersistencePath:a4 forPolicyVersion:a5 issuingDefaultLevelLogging:1];
}

- (BOOL)isPersistedStateLoaded
{
  v2 = self;
  v3 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCorePersistedState *)v2 persistedState];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)persistedContentsType
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCorePersistedState *)self persistedState];

  if (v4)
  {
    BOOL v5 = [(SUCorePersistedState *)self persistedState];
    id v6 = [v5 safeStringForKey:@"SUCorePersistedStateContentsType"];

    if ([(SUCorePersistedState *)self defaultLevelLogging])
    {
      id v7 = +[SUCoreLog sharedLogger];
      BOOL v8 = [v7 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v6;
        _os_log_impl(&dword_1B4EC2000, v8, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] returning persisted contents type with string value: %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    v9 = +[SUCoreDiag sharedDiag];
    [v9 trackError:@"[PERSISTED_STATE]", @"persisted state is not loaded, unable to load core contents type string", 8250, 0 forReason withResult withError];

    id v6 = 0;
  }
  return v6;
}

- (id)persistedCoreVersion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCorePersistedState *)self persistedState];

  if (v4)
  {
    BOOL v5 = [(SUCorePersistedState *)self persistedState];
    id v6 = [v5 safeStringForKey:@"SUCorePersistedStateCoreVersion"];

    if ([(SUCorePersistedState *)self defaultLevelLogging])
    {
      id v7 = +[SUCoreLog sharedLogger];
      BOOL v8 = [v7 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v6;
        _os_log_impl(&dword_1B4EC2000, v8, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] returning persisted core version with string value: %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    v9 = +[SUCoreDiag sharedDiag];
    [v9 trackError:@"[PERSISTED_STATE]", @"persisted state is not loaded, unable to load core version string", 8250, 0 forReason withResult withError];

    id v6 = 0;
  }
  return v6;
}

- (id)persistedPolicyVersion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCorePersistedState *)self persistedState];

  if (v4)
  {
    BOOL v5 = [(SUCorePersistedState *)self persistedState];
    id v6 = [v5 safeStringForKey:@"SUCorePersistedStatePolicyVersion"];

    if ([(SUCorePersistedState *)self defaultLevelLogging])
    {
      id v7 = +[SUCoreLog sharedLogger];
      BOOL v8 = [v7 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v6;
        _os_log_impl(&dword_1B4EC2000, v8, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] returning persisted policy version with string value: %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    v9 = +[SUCoreDiag sharedDiag];
    [v9 trackError:@"[PERSISTED_STATE]", @"persisted state is not loaded, unable to load policy version string", 8250, 0 forReason withResult withError];

    id v6 = 0;
  }
  return v6;
}

- (void)removePersistedState
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v3);

  if ([(SUCorePersistedState *)self defaultLevelLogging])
  {
    uint64_t v4 = +[SUCoreLog sharedLogger];
    BOOL v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SUCorePersistedState *)self summary];
      *(_DWORD *)buf = 138543362;
      objc_super v18 = v6;
      _os_log_impl(&dword_1B4EC2000, v5, OS_LOG_TYPE_DEFAULT, "attempting to remove persisted state with summary: %{public}@", buf, 0xCu);
    }
  }
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v8 = [(SUCorePersistedState *)self persistencePath];
  id v16 = 0;
  char v9 = [v7 removeItemAtPath:v8 error:&v16];
  id v10 = v16;
  int v11 = v10;
  if (v9)
  {
  }
  else
  {
    uint64_t v12 = [v10 code];

    if (v12 != 4)
    {
      id v15 = +[SUCoreDiag sharedDiag];
      [v15 trackError:@"[PERSISTED_STATE]" forReason:@"failed to remove persisted state file" withResult:8110 withError:v11];

      goto LABEL_14;
    }
  }
  if ([(SUCorePersistedState *)self defaultLevelLogging])
  {
    uint64_t v13 = +[SUCoreLog sharedLogger];
    BOOL v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v14, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] successfully removed persisted state file", buf, 2u);
    }
  }
  [(SUCorePersistedState *)self setPersistedState:0];
LABEL_14:
}

- (BOOL)BOOLeanForKey:(id)a3
{
  return [(SUCorePersistedState *)self BOOLeanForKey:a3 forType:1];
}

- (BOOL)BOOLeanForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(SUCorePersistedState *)self persistedState];

  if (!v8)
  {
    int v11 = +[SUCoreDiag sharedDiag];
    uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"persisted state is not loaded, unable to load BOOLean value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];

LABEL_6:
    char v12 = 0;
    goto LABEL_7;
  }
  char v9 = [(SUCorePersistedState *)self persistedState];
  id v10 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
  int v11 = [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];

  if (!v11)
  {
    BOOL v14 = +[SUCoreDiag sharedDiag];
    id v15 = [NSString alloc];
    id v16 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];

    goto LABEL_6;
  }
  char v12 = [v11 safeBooleanForKey:v6];
LABEL_7:

  return v12;
}

- (unint64_t)ullForKey:(id)a3
{
  return [(SUCorePersistedState *)self ullForKey:a3 forType:1];
}

- (unint64_t)ullForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(SUCorePersistedState *)self persistedState];

  if (!v8)
  {
    int v11 = +[SUCoreDiag sharedDiag];
    uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"persisted state is not loaded, unable to load ULL value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];

LABEL_6:
    unint64_t v12 = 0;
    goto LABEL_7;
  }
  char v9 = [(SUCorePersistedState *)self persistedState];
  id v10 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
  int v11 = [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];

  if (!v11)
  {
    BOOL v14 = +[SUCoreDiag sharedDiag];
    id v15 = [NSString alloc];
    id v16 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];

    goto LABEL_6;
  }
  unint64_t v12 = [v11 safeULLForKey:v6];
LABEL_7:

  return v12;
}

- (id)stringForKey:(id)a3
{
  return [(SUCorePersistedState *)self stringForKey:a3 forType:1];
}

- (id)stringForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(SUCorePersistedState *)self persistedState];

  if (v8)
  {
    char v9 = [(SUCorePersistedState *)self persistedState];
    id v10 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    int v11 = [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];

    if (v11)
    {
      unint64_t v12 = [v11 safeStringForKey:v6];
      goto LABEL_7;
    }
    BOOL v14 = +[SUCoreDiag sharedDiag];
    id v15 = [NSString alloc];
    id v16 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];
  }
  else
  {
    int v11 = +[SUCoreDiag sharedDiag];
    uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"persisted state is not loaded, unable to load string value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];
  }
  unint64_t v12 = 0;
LABEL_7:

  return v12;
}

- (id)dictionaryForKey:(id)a3
{
  return [(SUCorePersistedState *)self dictionaryForKey:a3 forType:1];
}

- (id)dictionaryForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(SUCorePersistedState *)self persistedState];

  if (v8)
  {
    char v9 = [(SUCorePersistedState *)self persistedState];
    id v10 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    int v11 = [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];

    if (v11)
    {
      unint64_t v12 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
      uint64_t v13 = [v11 safeDictionaryForKey:v6 fromBase:@"SUCorePersistedState fieldSpecificDictionary" withKeyDescription:v12];
      goto LABEL_7;
    }
    unint64_t v12 = +[SUCoreDiag sharedDiag];
    id v14 = [NSString alloc];
    id v15 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    id v16 = (void *)[v14 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v15];
    [v12 trackError:@"[PERSISTED_STATE]" forReason:v16 withResult:8252 withError:0];
  }
  else
  {
    int v11 = +[SUCoreDiag sharedDiag];
    unint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"persisted state is not loaded, unable to load dictionary value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v12 withResult:8250 withError:0];
  }
  uint64_t v13 = 0;
LABEL_7:

  return v13;
}

- (id)dataForKey:(id)a3
{
  return [(SUCorePersistedState *)self dataForKey:a3 forType:1];
}

- (id)dateForKey:(id)a3
{
  return [(SUCorePersistedState *)self dateForKey:a3 forType:1];
}

- (id)dateForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(SUCorePersistedState *)self persistedState];

  if (v8)
  {
    char v9 = [(SUCorePersistedState *)self persistedState];
    id v10 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    int v11 = [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];

    if (v11)
    {
      unint64_t v12 = [v11 safeDateForKey:v6];
      goto LABEL_7;
    }
    id v14 = +[SUCoreDiag sharedDiag];
    id v15 = [NSString alloc];
    id v16 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v4];
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];
  }
  else
  {
    int v11 = +[SUCoreDiag sharedDiag];
    uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"persisted state is not loaded, unable to load date value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];
  }
  unint64_t v12 = 0;
LABEL_7:

  return v12;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return [(SUCorePersistedState *)self objectForKey:a3 ofClass:a4 forType:1];
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  char v9 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(SUCorePersistedState *)self persistedState];

  if (v10)
  {
    int v11 = [(SUCorePersistedState *)self persistedState];
    unint64_t v12 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v5];
    uint64_t v13 = [v11 safeObjectForKey:v12 ofClass:objc_opt_class()];

    if (v13)
    {
      id v14 = [v13 safeObjectForKey:v8 ofClass:a4];
      goto LABEL_7;
    }
    id v16 = +[SUCoreDiag sharedDiag];
    id v17 = [NSString alloc];
    objc_super v18 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v5];
    uint64_t v19 = (void *)[v17 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v18];
    [v16 trackError:@"[PERSISTED_STATE]" forReason:v19 withResult:8252 withError:0];
  }
  else
  {
    uint64_t v13 = +[SUCoreDiag sharedDiag];
    id v15 = (void *)[[NSString alloc] initWithFormat:@"persisted state is not loaded, unable to load object value for key: %@", v8];
    [v13 trackError:@"[PERSISTED_STATE]" forReason:v15 withResult:8250 withError:0];
  }
  id v14 = 0;
LABEL_7:

  return v14;
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5
{
  return [(SUCorePersistedState *)self secureCodedObjectForKey:a3 ofClass:a4 encodeClasses:a5 forType:3];
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v9 = a3;
  id v10 = objc_msgSend([v8 alloc], "initWithObjects:", a4, 0);
  int v11 = [(SUCorePersistedState *)self secureCodedObjectForKey:v9 ofClass:a4 encodeClasses:v10 forType:v5];

  return v11;
}

- (void)persistBoolean:(BOOL)a3 forKey:(id)a4
{
}

- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  int v11 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v11);

  unint64_t v12 = [(SUCorePersistedState *)self persistedState];

  if (v12)
  {
    uint64_t v13 = [(SUCorePersistedState *)self persistedState];
    id v14 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
    id v15 = [v13 safeObjectForKey:v14 ofClass:objc_opt_class()];

    if (v15)
    {
      if ([(SUCorePersistedState *)self defaultLevelLogging])
      {
        id v16 = +[SUCoreLog sharedLogger];
        id v17 = [v16 oslog];

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v18 = @"NO";
          if (v8) {
            objc_super v18 = @"YES";
          }
          *(_DWORD *)buf = 138543618;
          id v29 = v10;
          __int16 v30 = 2114;
          id v31 = v18;
          _os_log_impl(&dword_1B4EC2000, v17, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with BOOLean value: %{public}@=%{public}@", buf, 0x16u);
        }
      }
      uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
      [v15 setValue:v19 forKey:v10];

      if (v6) {
        [(SUCorePersistedState *)self _writePersistedState];
      }
    }
    else
    {
      v24 = +[SUCoreDiag sharedDiag];
      id v25 = [NSString alloc];
      v26 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
      v27 = (void *)[v25 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v26];
      [v24 trackError:@"[PERSISTED_STATE]" forReason:v27 withResult:8252 withError:0];
    }
  }
  else
  {
    v20 = +[SUCoreDiag sharedDiag];
    id v21 = [NSString alloc];
    uint64_t v22 = @"NO";
    if (v8) {
      uint64_t v22 = @"YES";
    }
    v23 = (void *)[v21 initWithFormat:@"unable to persist BOOLean for key with value: %@=%@", v10, v22];
    [v20 trackError:@"[PERSISTED_STATE]" forReason:v23 withResult:8250 withError:0];
  }
}

- (void)persistULL:(unint64_t)a3 forKey:(id)a4
{
}

- (void)persistULL:(unint64_t)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistULL:(unint64_t)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  int v11 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v11);

  unint64_t v12 = [(SUCorePersistedState *)self persistedState];

  if (v12)
  {
    uint64_t v13 = [(SUCorePersistedState *)self persistedState];
    id v14 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
    id v15 = [v13 safeObjectForKey:v14 ofClass:objc_opt_class()];

    if (v15)
    {
      if ([(SUCorePersistedState *)self defaultLevelLogging])
      {
        id v16 = +[SUCoreLog sharedLogger];
        id v17 = [v16 oslog];

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v26 = v10;
          __int16 v27 = 2048;
          unint64_t v28 = a3;
          _os_log_impl(&dword_1B4EC2000, v17, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with ULL value: %{public}@=%lld", buf, 0x16u);
        }
      }
      objc_super v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
      [v15 setValue:v18 forKey:v10];

      if (v6) {
        [(SUCorePersistedState *)self _writePersistedState];
      }
    }
    else
    {
      id v21 = +[SUCoreDiag sharedDiag];
      id v22 = [NSString alloc];
      v23 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
      v24 = (void *)[v22 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v23];
      [v21 trackError:@"[PERSISTED_STATE]" forReason:v24 withResult:8252 withError:0];
    }
  }
  else
  {
    uint64_t v19 = +[SUCoreDiag sharedDiag];
    v20 = (void *)[[NSString alloc] initWithFormat:@"unable to persist ULL for key with value: %@=%lld", v10, a3];
    [v19 trackError:@"[PERSISTED_STATE]" forReason:v20 withResult:8250 withError:0];
  }
}

- (void)persistString:(id)a3 forKey:(id)a4
{
}

- (void)persistString:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistString:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [(SUCorePersistedState *)self persistedState];

  if (v13)
  {
    id v14 = [(SUCorePersistedState *)self persistedState];
    id v15 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
    id v16 = [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];

    if (v16)
    {
      BOOL v17 = [(SUCorePersistedState *)self defaultLevelLogging];
      if (v10)
      {
        if (v17)
        {
          objc_super v18 = +[SUCoreLog sharedLogger];
          uint64_t v19 = [v18 oslog];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl(&dword_1B4EC2000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with string value: %{public}@=%{public}@", buf, 0x16u);
          }
        }
        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      else
      {
        if (v17)
        {
          id v26 = +[SUCoreLog sharedLogger];
          __int16 v27 = [v26 oslog];

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl(&dword_1B4EC2000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state string for key: %{public}@", buf, 0xCu);
          }
        }
        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      [(SUCorePersistedState *)self _writePersistedState];
    }
    else
    {
      id v22 = +[SUCoreDiag sharedDiag];
      id v23 = [NSString alloc];
      v24 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }
LABEL_18:

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag];
  id v21 = (void *)[[NSString alloc] initWithFormat:@"unable to persist string for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

- (void)persistDictionary:(id)a3 forKey:(id)a4
{
}

- (void)persistDictionary:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistDictionary:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [(SUCorePersistedState *)self persistedState];

  if (v13)
  {
    id v14 = [(SUCorePersistedState *)self persistedState];
    id v15 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
    id v16 = [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];

    if (v16)
    {
      BOOL v17 = [(SUCorePersistedState *)self defaultLevelLogging];
      if (v10)
      {
        if (v17)
        {
          objc_super v18 = +[SUCoreLog sharedLogger];
          uint64_t v19 = [v18 oslog];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl(&dword_1B4EC2000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with dictionary value: %{public}@=%{public}@", buf, 0x16u);
          }
        }
        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      else
      {
        if (v17)
        {
          id v26 = +[SUCoreLog sharedLogger];
          __int16 v27 = [v26 oslog];

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl(&dword_1B4EC2000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state dictionary for key: %{public}@", buf, 0xCu);
          }
        }
        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      [(SUCorePersistedState *)self _writePersistedState];
    }
    else
    {
      id v22 = +[SUCoreDiag sharedDiag];
      id v23 = [NSString alloc];
      v24 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }
LABEL_18:

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag];
  id v21 = (void *)[[NSString alloc] initWithFormat:@"unable to persist dictionary for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

- (void)persistData:(id)a3 forKey:(id)a4
{
}

- (void)persistData:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistData:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [(SUCorePersistedState *)self persistedState];

  if (v13)
  {
    id v14 = [(SUCorePersistedState *)self persistedState];
    id v15 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
    id v16 = [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];

    if (v16)
    {
      BOOL v17 = [(SUCorePersistedState *)self defaultLevelLogging];
      if (v10)
      {
        if (v17)
        {
          objc_super v18 = +[SUCoreLog sharedLogger];
          uint64_t v19 = [v18 oslog];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl(&dword_1B4EC2000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with data value: %{public}@=%{public}@", buf, 0x16u);
          }
        }
        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      else
      {
        if (v17)
        {
          id v26 = +[SUCoreLog sharedLogger];
          __int16 v27 = [v26 oslog];

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl(&dword_1B4EC2000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state data for key: %{public}@", buf, 0xCu);
          }
        }
        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      [(SUCorePersistedState *)self _writePersistedState];
    }
    else
    {
      id v22 = +[SUCoreDiag sharedDiag];
      id v23 = [NSString alloc];
      v24 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }
LABEL_18:

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag];
  id v21 = (void *)[[NSString alloc] initWithFormat:@"unable to persist data for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

- (void)persistDate:(id)a3 forKey:(id)a4
{
}

- (void)persistDate:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistDate:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [(SUCorePersistedState *)self persistedState];

  if (v13)
  {
    id v14 = [(SUCorePersistedState *)self persistedState];
    id v15 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
    id v16 = [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];

    if (v16)
    {
      BOOL v17 = [(SUCorePersistedState *)self defaultLevelLogging];
      if (v10)
      {
        if (v17)
        {
          objc_super v18 = +[SUCoreLog sharedLogger];
          uint64_t v19 = [v18 oslog];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl(&dword_1B4EC2000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with date value: %{public}@=%{public}@", buf, 0x16u);
          }
        }
        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      else
      {
        if (v17)
        {
          id v26 = +[SUCoreLog sharedLogger];
          __int16 v27 = [v26 oslog];

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl(&dword_1B4EC2000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state date for key: %{public}@", buf, 0xCu);
          }
        }
        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      [(SUCorePersistedState *)self _writePersistedState];
    }
    else
    {
      id v22 = +[SUCoreDiag sharedDiag];
      id v23 = [NSString alloc];
      v24 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }
LABEL_18:

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag];
  id v21 = (void *)[[NSString alloc] initWithFormat:@"unable to persist date for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

- (void)persistObject:(id)a3 forKey:(id)a4
{
}

- (void)persistObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [(SUCorePersistedState *)self persistedState];

  if (v13)
  {
    id v14 = [(SUCorePersistedState *)self persistedState];
    id v15 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
    id v16 = [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];

    if (v16)
    {
      BOOL v17 = [(SUCorePersistedState *)self defaultLevelLogging];
      if (v10)
      {
        if (v17)
        {
          objc_super v18 = +[SUCoreLog sharedLogger];
          uint64_t v19 = [v18 oslog];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl(&dword_1B4EC2000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with object value: %{public}@=%{public}@", buf, 0x16u);
          }
        }
        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      else
      {
        if (v17)
        {
          id v26 = +[SUCoreLog sharedLogger];
          __int16 v27 = [v26 oslog];

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl(&dword_1B4EC2000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state object for key: %{public}@", buf, 0xCu);
          }
        }
        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }
      [(SUCorePersistedState *)self _writePersistedState];
    }
    else
    {
      id v22 = +[SUCoreDiag sharedDiag];
      id v23 = [NSString alloc];
      v24 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }
LABEL_18:

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag];
  id v21 = (void *)[[NSString alloc] initWithFormat:@"unable to persist object for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4
{
}

- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v12);

  if ((v7 & 0xFFFFFFFE) == 2)
  {
    if (v10)
    {
      id v20 = 0;
      uint64_t v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v20];
      id v14 = v20;
      if (v14)
      {
        id v15 = +[SUCoreDiag sharedDiag];
        [v15 trackError:@"[PERSISTED_STATE]" forReason:@"failed to use NSKeyedArchiver to archive the object into encoded NSData" withResult:8254 withError:v14];
      }
    }
    else
    {
      uint64_t v13 = 0;
      id v14 = 0;
    }
    [(SUCorePersistedState *)self persistData:v13 forKey:v11 forType:v7 shouldPersist:v6];
  }
  else
  {
    id v16 = +[SUCoreDiag sharedDiag];
    id v17 = [NSString alloc];
    objc_super v18 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:v7];
    uint64_t v19 = (void *)[v17 initWithFormat:@"invalid SUCorePersistedStateType (%@) provided for secure coded object persistence", v18];
    [v16 trackAnomaly:@"[PERSISTED_STATE]" forReason:v19 withResult:8253 withError:0];
  }
}

- (void)persistState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(SUCorePersistedState *)self persistedStateQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCorePersistedState *)self persistedState];

  if (v4)
  {
    if ([(SUCorePersistedState *)self defaultLevelLogging])
    {
      uint64_t v5 = +[SUCoreLog sharedLogger];
      BOOL v6 = [v5 oslog];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(SUCorePersistedState *)self description];
        *(_DWORD *)buf = 138543362;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1B4EC2000, v6, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] persisting the state %{public}@", buf, 0xCu);
      }
    }
    [(SUCorePersistedState *)self _writePersistedState];
  }
  else
  {
    id v11 = +[SUCoreDiag sharedDiag];
    id v8 = [NSString alloc];
    id v9 = [(SUCorePersistedState *)self description];
    id v10 = (void *)[v8 initWithFormat:@"unable to persist state: %@", v9];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v10 withResult:8250 withError:0];
  }
}

- (id)summary
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(SUCorePersistedState *)self persistencePath];
  uint64_t v5 = [(SUCorePersistedState *)self versionPolicyLayer];
  BOOL v6 = [(SUCorePersistedState *)self versionSUCore];
  uint64_t v7 = (void *)[v3 initWithFormat:@"persistencePath:%@, versionPolicyLayer:%@, versionSUCore:%@", v4, v5, v6];

  return v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(SUCorePersistedState *)self persistencePath];
  uint64_t v5 = [(SUCorePersistedState *)self versionPolicyLayer];
  BOOL v6 = [(SUCorePersistedState *)self versionSUCore];
  uint64_t v7 = [(SUCorePersistedState *)self persistedState];
  id v8 = (void *)[v3 initWithFormat:@"\n[>>>\n    persistencePath: %@\n versionPolicyLayer: %@\n      versionSUCore: %@\n     persistedState: %@\n<<<]", v4, v5, v6, v7];

  return v8;
}

- (void)_writePersistedState
{
  id v3 = (void *)MEMORY[0x1E4F28F98];
  uint64_t v4 = [(SUCorePersistedState *)self persistedState];
  id v19 = 0;
  uint64_t v5 = [v3 dataWithPropertyList:v4 format:200 options:0 error:&v19];
  id v6 = v19;

  if (v5)
  {
    uint64_t v7 = [(SUCorePersistedState *)self persistencePath];
    id v18 = v6;
    char v8 = [v5 writeToFile:v7 options:268435457 error:&v18];
    id v9 = v18;

    if (v8)
    {
      id v10 = (void *)MEMORY[0x1E4F28CB0];
      id v11 = [(SUCorePersistedState *)self persistencePath];
      unint64_t v12 = [v10 fileHandleForUpdatingAtPath:v11];

      if (v12)
      {
        [v12 synchronizeFile];
        [v12 closeFile];
      }
      else
      {
        uint64_t v13 = +[SUCoreDiag sharedDiag];
        id v14 = [NSString alloc];
        uint64_t v15 = *__error();
        id v16 = __error();
        id v17 = objc_msgSend(v14, "initWithFormat:", @"failed to open persistence file: %d - message: %s", v15, strerror(*v16));
        [v13 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8121 withError:0];
      }
    }
    else
    {
      unint64_t v12 = +[SUCoreDiag sharedDiag];
      [v12 trackError:@"[PERSISTED_STATE]" forReason:@"failed to write persistence file" withResult:8109 withError:v9];
    }
    id v6 = v9;
  }
  else
  {
    unint64_t v12 = +[SUCoreDiag sharedDiag];
    [v12 trackError:@"[PERSISTED_STATE]" forReason:@"failed to serialize persisted state to plist" withResult:8106 withError:v6];
  }
}

- (id)_createEmptyPersistedState
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setValue:@"SoftwareUpdateCorePersistedStateFile" forKey:@"SUCorePersistedStateContentsType"];
  uint64_t v4 = [(SUCorePersistedState *)self versionSUCore];
  [v3 setValue:v4 forKey:@"SUCorePersistedStateCoreVersion"];

  uint64_t v5 = [(SUCorePersistedState *)self versionPolicyLayer];
  [v3 setValue:v5 forKey:@"SUCorePersistedStatePolicyVersion"];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:0];
  [v3 setValue:v6 forKey:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:1];
  [v3 setValue:v8 forKey:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:2];
  [v3 setValue:v10 forKey:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = [(SUCorePersistedState *)self _keyNameForPersistedStateType:3];
  [v3 setValue:v12 forKey:v13];

  return v3;
}

- (void)setPersistencePath:(id)a3
{
}

- (NSString)versionPolicyLayer
{
  return self->_versionPolicyLayer;
}

- (void)setVersionPolicyLayer:(id)a3
{
}

- (void)setDefaultLevelLogging:(BOOL)a3
{
  self->_defaultLevelLogging = a3;
}

- (NSString)versionSUCore
{
  return self->_versionSUCore;
}

- (void)setVersionSUCore:(id)a3
{
}

@end