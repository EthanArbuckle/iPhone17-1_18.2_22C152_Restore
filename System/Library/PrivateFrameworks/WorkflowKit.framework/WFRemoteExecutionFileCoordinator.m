@interface WFRemoteExecutionFileCoordinator
- (NSHashTable)waitingArchivers;
- (NSMutableDictionary)waitingFiles;
- (WFRemoteExecutionFileCoordinator)init;
- (void)handleFile:(id)a3 withIdentifier:(id)a4;
- (void)registerArchiver:(id)a3;
- (void)setWaitingArchivers:(id)a3;
- (void)setWaitingFiles:(id)a3;
@end

@implementation WFRemoteExecutionFileCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingArchivers, 0);
  objc_storeStrong((id *)&self->_waitingFiles, 0);
}

- (void)setWaitingArchivers:(id)a3
{
}

- (NSHashTable)waitingArchivers
{
  return self->_waitingArchivers;
}

- (void)setWaitingFiles:(id)a3
{
}

- (NSMutableDictionary)waitingFiles
{
  return self->_waitingFiles;
}

- (void)registerArchiver:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend(v4, "transferIdentifiers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        v11 = [(WFRemoteExecutionFileCoordinator *)self waitingFiles];
        v12 = [v11 objectForKey:v10];

        if (v12)
        {
          v13 = [(WFRemoteExecutionFileCoordinator *)self waitingFiles];
          v14 = [v13 objectForKey:v10];
          [v4 setFileURL:v14];

          [v4 fileAvailabilityChanged];
          v15 = [(WFRemoteExecutionFileCoordinator *)self waitingFiles];
          [v15 removeObjectForKey:v10];

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v5 = [(WFRemoteExecutionFileCoordinator *)self waitingArchivers];
  [v5 addObject:v4];
LABEL_11:
}

- (void)handleFile:(id)a3 withIdentifier:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v28 = self;
  obuint64_t j = [(WFRemoteExecutionFileCoordinator *)self waitingArchivers];
  uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v13 = [v12 transferIdentifiers];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([*(id *)(*((void *)&v35 + 1) + 8 * j) isEqualToString:v7])
              {
                [v12 setFileURL:v6];
                [v12 fileAvailabilityChanged];
                [v8 addObject:v12];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }
          while (v15);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v10);
  }

  if ([v8 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * k);
          v24 = [(WFRemoteExecutionFileCoordinator *)v28 waitingArchivers];
          [v24 removeObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v20);
    }
    goto LABEL_28;
  }
  v25 = [(WFRemoteExecutionFileCoordinator *)v28 waitingFiles];
  v26 = [v25 allKeys];
  char v27 = [v26 containsObject:v7];

  if ((v27 & 1) == 0)
  {
    id v18 = [(WFRemoteExecutionFileCoordinator *)v28 waitingFiles];
    [v18 setObject:v6 forKey:v7];
LABEL_28:
  }
}

- (WFRemoteExecutionFileCoordinator)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFRemoteExecutionFileCoordinator;
  v2 = [(WFRemoteExecutionFileCoordinator *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    waitingFiles = v2->_waitingFiles;
    v2->_waitingFiles = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    waitingArchivers = v2->_waitingArchivers;
    v2->_waitingArchivers = (NSHashTable *)v5;

    id v7 = v2;
  }

  return v2;
}

@end