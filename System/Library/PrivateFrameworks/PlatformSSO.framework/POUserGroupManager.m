@interface POUserGroupManager
- (BOOL)removeUserWithName:(id)a3 withError:(id *)a4;
- (BOOL)saveUsers_locked:(id)a3 withError:(id *)a4;
- (NSURL)filePath;
- (POUserGroupManager)initWithFilePath:(id)a3;
- (id)_nextAvailableUserId:(id)a3;
- (id)createOrUpdateUser:(id)a3 withError:(id *)a4;
- (id)findUser:(id)a3 withError:(id *)a4;
- (id)getAllUsersWithError:(id *)a3;
- (id)loadUsers_lockedWithError:(id *)a3;
- (void)setFilePath:(id)a3;
@end

@implementation POUserGroupManager

id __49__POUserGroupManager_saveUsers_locked_withError___block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"failed to serialize users"];
  v2 = PO_LOG_POUserGroupManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (POUserGroupManager)initWithFilePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POUserGroupManager;
  v6 = [(POUserGroupManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_filePath, a3);
  }

  return v7;
}

- (id)getAllUsersWithError:(id *)a3
{
  id v5 = PO_LOG_POUserGroupManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POUserGroupManager getAllUsersWithError:]((uint64_t)self, v5);
  }

  v6 = self;
  objc_sync_enter(v6);
  v7 = [(POUserGroupManager *)v6 loadUsers_lockedWithError:a3];
  v8 = (void *)[v7 copy];

  objc_sync_exit(v6);

  return v8;
}

- (id)findUser:(id)a3 withError:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = PO_LOG_POUserGroupManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POUserGroupManager findUser:withError:]();
  }

  v8 = self;
  objc_sync_enter(v8);
  [(POUserGroupManager *)v8 loadUsers_lockedWithError:a4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "loginUserName", (void)v19);
        if ([v14 isEqualToString:v6])
        {

LABEL_15:
          id v17 = v13;
          goto LABEL_16;
        }
        v15 = [v13 uniqueIdpIdentifier];
        int v16 = [v15 isEqualToString:v6];

        if (v16) {
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v17 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v17 = 0;
  }
LABEL_16:

  objc_sync_exit(v8);

  return v17;
}

- (id)createOrUpdateUser:(id)a3 withError:(id *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v6 = PO_LOG_POUserGroupManager();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[POUserGroupManager createOrUpdateUser:withError:](v50, (uint64_t)self, v6);
  }

  v7 = self;
  objc_sync_enter(v7);
  v43 = v7;
  v8 = [(POUserGroupManager *)v7 loadUsers_lockedWithError:a4];
  id v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  v12 = v11;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v13)
  {
    uint64_t v46 = *(void *)v54;
LABEL_8:
    uint64_t v45 = v13;
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v54 != v46) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v53 + 1) + 8 * v14);
      v49 = [v15 loginUserName];
      v48 = [v50 loginUserName];
      if ([v49 isEqualToString:v48]) {
        break;
      }
      int v16 = [v15 generatedUUID];
      id v17 = [v50 generatedUUID];
      if ([v16 isEqualToString:v17]) {
        goto LABEL_22;
      }
      v18 = [v15 uniqueIdpIdentifier];
      v8 = [v50 uniqueIdpIdentifier];
      if ([v18 isEqualToString:v8])
      {

LABEL_22:
        break;
      }
      long long v19 = [v15 altSecurityIdentity];
      if (v19)
      {
        long long v20 = [v15 altSecurityIdentity];
        long long v21 = [v50 altSecurityIdentity];
        uint64_t v4 = [v20 isEqualToString:v21];

        if (v4) {
          goto LABEL_24;
        }
      }
      else
      {
      }
      if (v45 == ++v14)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (v13) {
          goto LABEL_8;
        }
        goto LABEL_20;
      }
    }

LABEL_24:
    id v22 = v15;

    if (!v22) {
      goto LABEL_26;
    }
    v23 = (POMutableUser *)[v22 mutableCopy];
    char v24 = 0;
  }
  else
  {
LABEL_20:

LABEL_26:
    v23 = objc_alloc_init(POMutableUser);
    id v22 = 0;
    char v24 = 1;
  }
  v25 = [v50 loginUserName];
  [(POMutableUser *)v23 setLoginUserName:v25];

  uint64_t v26 = [(POUser *)v23 generatedUUID];
  v27 = (void *)v26;
  if (v26)
  {
    int v28 = 0;
    v29 = (void *)v26;
  }
  else
  {
    uint64_t v30 = [v50 generatedUUID];
    v8 = (void *)v30;
    if (v30)
    {
      int v28 = 0;
      v29 = (void *)v30;
    }
    else
    {
      uint64_t v4 = [MEMORY[0x263F08C38] UUID];
      v29 = [(id)v4 UUIDString];
      v8 = 0;
      int v28 = 1;
    }
  }
  [(POMutableUser *)v23 setGeneratedUUID:v29];
  if (v28)
  {
  }
  if (!v27) {

  }
  v31 = [v50 uniqueIdpIdentifier];
  [(POMutableUser *)v23 setUniqueIdpIdentifier:v31];

  v32 = [v50 altSecurityIdentity];
  [(POMutableUser *)v23 setAltSecurityIdentity:v32];

  v33 = [v50 uid];
  v34 = v33;
  if (!v33)
  {
    v34 = [(POUserGroupManager *)v43 _nextAvailableUserId:obj];
  }
  [(POMutableUser *)v23 setUid:v34];
  if (!v33) {

  }
  if ((v24 & 1) == 0) {
    [obj removeObject:v22];
  }
  id v35 = [(POUser *)v23 copy];
  [obj addObject:v35];

  if ([(POUserGroupManager *)v43 saveUsers_locked:obj withError:a4])
  {
    v36 = PO_LOG_POUserGroupManager();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = [(POUser *)v23 generatedUUID];
      -[POUserGroupManager createOrUpdateUser:withError:](v37, buf, v36);
    }

    v38 = v23;
  }
  else
  {
    if (a4)
    {
      id v39 = *a4;
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __51__POUserGroupManager_createOrUpdateUser_withError___block_invoke;
      v51[3] = &unk_264BBECA8;
      id v40 = v39;
      id v52 = v40;
      __51__POUserGroupManager_createOrUpdateUser_withError___block_invoke((uint64_t)v51);
      id v41 = objc_claimAutoreleasedReturnValue();
      *a4 = v41;
    }
    v38 = 0;
  }

  objc_sync_exit(v43);

  return v38;
}

id __51__POUserGroupManager_createOrUpdateUser_withError___block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to create new create or update user."];
  v2 = PO_LOG_POUserGroupManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (id)_nextAvailableUserId:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    int v7 = 9999;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 uid];

        if (v10)
        {
          id v11 = [v9 uid];
          int v12 = [v11 intValue];

          if (v12 > v7) {
            int v7 = v12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    int v7 = 9999;
  }
  uint64_t v13 = [NSNumber numberWithInt:(v7 + 1)];
  uint64_t v14 = [v13 stringValue];

  return v14;
}

- (BOOL)removeUserWithName:(id)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = PO_LOG_POUserGroupManager();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[POUserGroupManager removeUserWithName:withError:]();
  }

  int v7 = self;
  objc_sync_enter(v7);
  v8 = [(POUserGroupManager *)v7 loadUsers_lockedWithError:a4];
  id v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  int v12 = v11;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = (void *)[v12 copy];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = [v17 loginUserName];
        int v19 = [v18 isEqualToString:v5];

        if (v19)
        {
          [v12 removeObject:v17];
          goto LABEL_16;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  [(POUserGroupManager *)v7 saveUsers_locked:v12 withError:a4];
  objc_sync_exit(v7);

  return 1;
}

- (id)loadUsers_lockedWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 0;
  }
  uint64_t v4 = [(POUserGroupManager *)self filePath];
  id v5 = [v4 URLByAppendingPathComponent:@"com.apple.PlatformSSO.users.txt"];

  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5];
  if (v6)
  {
    id v27 = 0;
    int v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v27];
    v8 = v27;
    id v9 = v8;
    if (v7)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        long long v20 = v5;
        uint64_t v14 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = [(_POJWTBodyBase *)[POUser alloc] initWithDictionary:*(void *)(*((void *)&v21 + 1) + 8 * i)];
            [v10 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
        }
        while (v13);
        id v5 = v20;
      }
    }
    else
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __48__POUserGroupManager_loadUsers_lockedWithError___block_invoke;
      v25[3] = &unk_264BBECA8;
      uint64_t v26 = v8;
      long long v17 = __48__POUserGroupManager_loadUsers_lockedWithError___block_invoke((uint64_t)v25);
      long long v18 = v17;
      if (a3) {
        *a3 = v17;
      }

      id v10 = 0;
      id v11 = v26;
    }
  }
  else
  {
    id v9 = PO_LOG_POUserGroupManager();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POUserGroupManager loadUsers_lockedWithError:](v9);
    }
    id v10 = 0;
  }

  return v10;
}

id __48__POUserGroupManager_loadUsers_lockedWithError___block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"failed to load users"];
  v2 = PO_LOG_POUserGroupManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (BOOL)saveUsers_locked:(id)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  int v7 = [(POUserGroupManager *)self filePath];
  v8 = [v7 URLByAppendingPathComponent:@"com.apple.PlatformSSO.users.txt"];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v31 + 1) + 8 * i) allData];
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }

  id v30 = 0;
  long long v16 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:3 error:&v30];
  id v17 = v30;
  long long v18 = v17;
  if (!v16)
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __49__POUserGroupManager_saveUsers_locked_withError___block_invoke;
    v28[3] = &unk_264BBECA8;
    long long v22 = &v29;
    id v20 = v17;
    id v29 = v20;
    __49__POUserGroupManager_saveUsers_locked_withError___block_invoke((uint64_t)v28);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
    {
LABEL_15:

      BOOL v21 = 0;
      goto LABEL_16;
    }
LABEL_14:
    id v23 = v23;
    *a4 = v23;
    goto LABEL_15;
  }
  id v27 = v17;
  char v19 = [v16 writeToURL:v8 options:268435457 error:&v27];
  id v20 = v27;

  if ((v19 & 1) == 0)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __49__POUserGroupManager_saveUsers_locked_withError___block_invoke_21;
    v25[3] = &unk_264BBECA8;
    long long v22 = &v26;
    id v20 = v20;
    id v26 = v20;
    __49__POUserGroupManager_saveUsers_locked_withError___block_invoke_21((uint64_t)v25);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  BOOL v21 = 1;
LABEL_16:

  return v21;
}

id __49__POUserGroupManager_saveUsers_locked_withError___block_invoke_21(uint64_t a1)
{
  v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"failed to write users to disk"];
  v2 = PO_LOG_POUserGroupManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getAllUsersWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[POUserGroupManager getAllUsersWithError:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_230E51000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)findUser:withError:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_230E51000, v0, v1, "%s name=%{public}@ on %@", v2);
}

- (void)createOrUpdateUser:(os_log_t)log withError:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_230E51000, log, OS_LOG_TYPE_DEBUG, "New user created: %{public}@", buf, 0xCu);
}

- (void)createOrUpdateUser:(NSObject *)a3 withError:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 allData];
  int v7 = [a1 uniqueIdpIdentifier];
  int v8 = 136315906;
  id v9 = "-[POUserGroupManager createOrUpdateUser:withError:]";
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_debug_impl(&dword_230E51000, a3, OS_LOG_TYPE_DEBUG, "%s user=%{public}@, uniqueIdentifier=%{public}@, on %@", (uint8_t *)&v8, 0x2Au);
}

- (void)removeUserWithName:withError:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_230E51000, v0, v1, "%s name=%{public}@ on %@", v2);
}

- (void)loadUsers_lockedWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_230E51000, log, OS_LOG_TYPE_DEBUG, "User data not found", v1, 2u);
}

@end