@interface RBCoalitionManager
- (NSString)stateCaptureTitle;
- (RBCoalitionManager)initWithAdapter:(id)a3;
- (id)captureState;
- (void)addProcess:(id)a3 withState:(id)a4;
- (void)didUpdateProcessStates:(id)a3;
- (void)removeProcess:(id)a3;
@end

@implementation RBCoalitionManager

- (RBCoalitionManager)initWithAdapter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RBCoalitionManager;
  v6 = [(RBCoalitionManager *)&v12 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    lock_coalitions = v6->_lock_coalitions;
    v6->_lock_coalitions = v7;

    v9 = objc_alloc_init(RBProcessMap);
    lock_processes = v6->_lock_processes;
    v6->_lock_processes = v9;

    objc_storeStrong((id *)&v6->_adapter, a3);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)didUpdateProcessStates:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasChanges])
  {
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v24 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v43 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "identity", lock);
          v11 = [(RBProcessMap *)self->_lock_processes valueForIdentity:v10];
          if (v11)
          {
            objc_super v12 = [v9 updatedState];
            v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "jetsamCoalitionID"));
            v14 = [(NSMutableDictionary *)self->_lock_coalitions objectForKey:v13];
            [v14 setProcess:v11 withState:v12];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v6);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    long long v38 = 0u;
    obuint64_t j = self->_lock_coalitions;
    uint64_t v15 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = -[NSMutableDictionary objectForKey:](self->_lock_coalitions, "objectForKey:", *(void *)(*((void *)&v38 + 1) + 8 * j), lock);
          uint64_t v34 = 0;
          v35 = &v34;
          uint64_t v36 = 0x2020000000;
          char v37 = 0;
          uint64_t v30 = 0;
          v31 = &v30;
          uint64_t v32 = 0x2020000000;
          uint64_t v33 = 0;
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __45__RBCoalitionManager_didUpdateProcessStates___block_invoke;
          v26[3] = &unk_2647C88F0;
          id v19 = v18;
          id v27 = v19;
          v28 = &v30;
          v29 = &v34;
          [v19 enumerateProcessesUsingBlock:v26];
          if (*((unsigned char *)v35 + 24))
          {
            uint64_t v20 = v31[3];
            if (v20 != [v19 coalitionLevel])
            {
              adapter = self->_adapter;
              uint64_t v22 = [v19 coalitionID];
              if (!-[RBCoalitionKernelAdapting applyCoalitionWithID:coalitionLevel:](adapter, "applyCoalitionWithID:coalitionLevel:", v22, v31[3]))[v19 setCoalitionLevel:v31[3]]; {
            }
              }
          }

          _Block_object_dispose(&v30, 8);
          _Block_object_dispose(&v34, 8);
        }
        uint64_t v15 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v15);
    }

    os_unfair_lock_unlock(lock);
    id v4 = v24;
  }
}

void __45__RBCoalitionManager_didUpdateProcessStates___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v6 coalitionLevel];
  v8 = rbs_process_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)a1[4];
    int v12 = 138413058;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = [v11 coalitionID];
    _os_log_debug_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEBUG, "Process: %@ with state: %@ for coalition: %@ with coalitionID: %llu", (uint8_t *)&v12, 0x2Au);
  }

  if (v7)
  {
    uint64_t v9 = *(void *)(a1[5] + 8);
    unint64_t v10 = *(void *)(v9 + 24);
    if (v7 > v10) {
      unint64_t v10 = v7;
    }
    *(void *)(v9 + 24) = v10;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (void)addProcess:(id)a3 withState:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identity];
  os_unfair_lock_lock(&self->_lock);
  BOOL v9 = [(RBProcessMap *)self->_lock_processes containsIdentity:v8];
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    unint64_t v10 = [v6 identifier];
    uint64_t v11 = [v10 pid];

    if ([(RBCoalitionKernelAdapting *)self->_adapter coalitionInfoForPID:v11 outCoalitionInfo:&v19] < 0)
    {
      id v13 = rbs_process_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[RBCoalitionManager addProcess:withState:](v11, v13);
      }
    }
    else
    {
      [v6 setResourceCoalitionID:v19];
      [v6 setJetsamCoalitionID:v20];
      [v6 setJetsamCoalitionLeader:v21];
      int v12 = v20;
      id v13 = [NSNumber numberWithUnsignedLongLong:v20];
      os_unfair_lock_lock(&self->_lock);
      __int16 v14 = [(NSMutableDictionary *)self->_lock_coalitions objectForKey:v13];
      if (!v14)
      {
        id v15 = rbs_process_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          id v23 = v12;
          __int16 v24 = 1024;
          LODWORD(v25) = v11;
          _os_log_impl(&dword_226AB3000, v15, OS_LOG_TYPE_DEFAULT, "Creating new RBCoalition with coalition ID: %llu for PID %d", buf, 0x12u);
        }

        __int16 v14 = [[RBCoalition alloc] initWithCoalitionID:v12];
        [(NSMutableDictionary *)self->_lock_coalitions setObject:v14 forKey:v13];
      }
      __int16 v16 = rbs_process_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(RBCoalition *)v14 coalitionID];
        *(_DWORD *)buf = 138413058;
        id v23 = v6;
        __int16 v24 = 2112;
        v25 = v14;
        __int16 v26 = 2048;
        uint64_t v27 = v17;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl(&dword_226AB3000, v16, OS_LOG_TYPE_DEFAULT, "Adding process: %@ to coalition: %@ with coalitionID: %llu with state: %@", buf, 0x2Au);
      }

      [(RBCoalition *)v14 setProcess:v6 withState:v7];
      id v18 = [(RBProcessMap *)self->_lock_processes setValue:v6 forIdentity:v8];
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)removeProcess:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identity];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "jetsamCoalitionID"));
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMutableDictionary *)self->_lock_coalitions objectForKey:v6];
  if (v7)
  {
    v8 = rbs_process_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = (uint64_t)v7;
      __int16 v16 = 2048;
      uint64_t v17 = [v7 coalitionID];
      _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "Removing process: %@ from coalition: %@ with coalitionID: %llu", (uint8_t *)&v12, 0x20u);
    }

    [v7 removeProcess:v4];
    if ([v7 isEmpty])
    {
      BOOL v9 = rbs_process_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v7 coalitionID];
        int v12 = 138412546;
        id v13 = v7;
        __int16 v14 = 2048;
        uint64_t v15 = v10;
        _os_log_impl(&dword_226AB3000, v9, OS_LOG_TYPE_DEFAULT, "Removing the coalition: %@ with coalitionID: %llu as all the processes in this coalition have been removed", (uint8_t *)&v12, 0x16u);
      }

      [(NSMutableDictionary *)self->_lock_coalitions removeObjectForKey:v6];
    }
  }
  id v11 = [(RBProcessMap *)self->_lock_processes removeValueForIdentity:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)stateCaptureTitle
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)captureState
{
  v3 = objc_opt_new();
  id v4 = [(RBCoalitionManager *)self stateCaptureTitle];
  [v3 appendFormat:@"<%@:\n", v4];

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_opt_new();
  lock_processes = self->_lock_processes;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34__RBCoalitionManager_captureState__block_invoke;
  v11[3] = &unk_2647C8918;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  [(RBProcessMap *)lock_processes enumerateWithBlock:v11];
  [v8 sortUsingComparator:&__block_literal_global_14];
  BOOL v9 = [v8 componentsJoinedByString:@"\n"];
  [v3 appendFormat:@"%@\n>\n", v9];

  os_unfair_lock_unlock(p_lock);
  return v3;
}

void __34__RBCoalitionManager_captureState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = a2;
  objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v6, "jetsamCoalitionID"));
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v22];
  BOOL v9 = NSString;
  uint64_t v10 = [v6 identifier];

  uint64_t v11 = [v10 pid];
  id v12 = [v7 shortDescription];

  uint64_t v13 = [v8 coalitionID];
  __int16 v14 = (void *)MEMORY[0x263EFF910];
  [v8 creationTime];
  uint64_t v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v16 = [v8 coalitionLevel];
  uint64_t v17 = [v8 previousCoalitionLevel];
  uint64_t v18 = (void *)MEMORY[0x263EFF910];
  [v8 lastModificationTime];
  uint64_t v19 = objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v20 = [v9 stringWithFormat:@"\t%d : %@ : coalitionID:%llu, creationTime: %@, coalitionLevel:%llu, previous:%llu, lastModTime: %@", v11, v12, v13, v15, v16, v17, v19];

  [*(id *)(a1 + 40) addObject:v20];
}

uint64_t __34__RBCoalitionManager_captureState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_lock_processes, 0);
  objc_storeStrong((id *)&self->_lock_coalitions, 0);
}

- (void)addProcess:(int)a1 withState:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Kernel failed to return coalition info for PID %d", (uint8_t *)v2, 8u);
}

@end