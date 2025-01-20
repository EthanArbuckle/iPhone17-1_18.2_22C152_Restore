@interface VMUProcList
- (BOOL)update;
- (BOOL)updateFromSystem;
- (VMUProcList)init;
- (id)allNames;
- (id)allPIDs;
- (id)allPathNames;
- (id)allProcInfos;
- (id)newestProcInfo;
- (id)newestProcInfoWithName:(id)a3;
- (id)procInfoWithPID:(int)a3;
- (unint64_t)count;
- (void)_populateFromSystem;
- (void)addProcInfo:(id)a3;
- (void)removeProcInfo:(id)a3;
- (void)setProcInfos:(id)a3;
@end

@implementation VMUProcList

- (VMUProcList)init
{
  v10.receiver = self;
  v10.super_class = (Class)VMUProcList;
  v2 = [(VMUProcList *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    procLock = v2->procLock;
    v2->procLock = (NSLock *)v3;

    uint64_t v5 = objc_opt_new();
    allProcs = v2->allProcs;
    v2->allProcs = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    filteredProcs = v2->filteredProcs;
    v2->filteredProcs = (NSMutableDictionary *)v7;

    [(VMUProcList *)v2 updateFromSystem];
  }
  return v2;
}

- (void)setProcInfos:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSLock *)self->procLock lock];
  [(NSMutableDictionary *)self->allProcs removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        allProcs = self->allProcs;
        v12 = [NSNumber numberWithInt:[v10 pid]];
        [(NSMutableDictionary *)allProcs setObject:v10 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSLock *)self->procLock unlock];
  [(VMUProcList *)self update];
}

- (void)addProcInfo:(id)a3
{
  procLock = self->procLock;
  id v5 = a3;
  [(NSLock *)procLock lock];
  allProcs = self->allProcs;
  uint64_t v7 = [NSNumber numberWithInt:[v5 pid]];
  [(NSMutableDictionary *)allProcs setObject:v5 forKeyedSubscript:v7];

  [(NSLock *)self->procLock unlock];

  [(VMUProcList *)self update];
}

- (void)removeProcInfo:(id)a3
{
  procLock = self->procLock;
  id v5 = a3;
  [(NSLock *)procLock lock];
  allProcs = self->allProcs;
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 pid];

  v9 = [v7 numberWithInt:v8];
  [(NSMutableDictionary *)allProcs removeObjectForKey:v9];

  [(NSLock *)self->procLock unlock];

  [(VMUProcList *)self update];
}

- (BOOL)update
{
  [(NSLock *)self->procLock lock];
  uint64_t v3 = objc_opt_new();
  allProcs = self->allProcs;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __21__VMUProcList_update__block_invoke;
  v9[3] = &unk_1E5D23EB8;
  id v5 = v3;
  objc_super v10 = v5;
  [(NSMutableDictionary *)allProcs enumerateKeysAndObjectsUsingBlock:v9];
  LODWORD(allProcs) = [(NSMutableDictionary *)v5 isEqualToDictionary:self->filteredProcs] ^ 1;
  filteredProcs = self->filteredProcs;
  self->filteredProcs = v5;
  uint64_t v7 = v5;

  [(NSLock *)self->procLock unlock];
  return (char)allProcs;
}

uint64_t __21__VMUProcList_update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (void)_populateFromSystem
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD0D9F90](self, a2);
  uint64_t v3 = +[VMUProcInfo getProcessIds];
  pid_t v4 = getpid();
  id v5 = (NSMutableDictionary *)objc_opt_new();
  [(NSLock *)self->procLock lock];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 unsignedIntValue];
        if (v12) {
          BOOL v13 = v12 == v4;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          uint64_t v14 = v12;
          long long v15 = [(NSMutableDictionary *)self->allProcs objectForKeyedSubscript:v11];
          if (!v15) {
            long long v15 = [[VMUProcInfo alloc] initWithPid:v14];
          }
          [(NSMutableDictionary *)v5 setObject:v15 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  allProcs = self->allProcs;
  self->allProcs = v5;
  v17 = v5;

  [(NSLock *)self->procLock unlock];
}

- (BOOL)updateFromSystem
{
  [(VMUProcList *)self _populateFromSystem];

  return [(VMUProcList *)self update];
}

- (unint64_t)count
{
  [(NSLock *)self->procLock lock];
  unint64_t v3 = [(NSMutableDictionary *)self->filteredProcs count];
  [(NSLock *)self->procLock unlock];
  return v3;
}

- (id)allProcInfos
{
  [(NSLock *)self->procLock lock];
  unint64_t v3 = [(NSMutableDictionary *)self->filteredProcs allValues];
  [(NSLock *)self->procLock unlock];

  return v3;
}

- (id)allPIDs
{
  [(NSLock *)self->procLock lock];
  unint64_t v3 = [(NSMutableDictionary *)self->filteredProcs allKeys];
  [(NSLock *)self->procLock unlock];

  return v3;
}

- (id)allNames
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [(NSLock *)self->procLock lock];
  filteredProcs = self->filteredProcs;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __23__VMUProcList_allNames__block_invoke;
  v7[3] = &unk_1E5D23EB8;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)filteredProcs enumerateKeysAndObjectsUsingBlock:v7];
  [(NSLock *)self->procLock unlock];

  return v5;
}

void __23__VMUProcList_allNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a3 name];
  [v3 addObject:v4];
}

- (id)allPathNames
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [(NSLock *)self->procLock lock];
  filteredProcs = self->filteredProcs;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__VMUProcList_allPathNames__block_invoke;
  v7[3] = &unk_1E5D23EB8;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)filteredProcs enumerateKeysAndObjectsUsingBlock:v7];
  [(NSLock *)self->procLock unlock];

  return v5;
}

void __27__VMUProcList_allPathNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a3 realAppName];
  [v3 addObject:v4];
}

- (id)newestProcInfo
{
  return [(VMUProcList *)self newestProcInfoWithName:0];
}

- (id)newestProcInfoWithName:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3010000000;
  v18[4] = 0;
  v18[5] = 0;
  v18[3] = &unk_1A7D91765;
  pid_t v5 = getpid();
  [(NSLock *)self->procLock lock];
  filteredProcs = self->filteredProcs;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __38__VMUProcList_newestProcInfoWithName___block_invoke;
  BOOL v13 = &unk_1E5D23EE0;
  pid_t v17 = v5;
  id v7 = v4;
  id v14 = v7;
  long long v15 = &v19;
  long long v16 = v18;
  [(NSMutableDictionary *)filteredProcs enumerateKeysAndObjectsUsingBlock:&v10];
  [(NSLock *)self->procLock unlock];
  id v8 = (id)v20[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

void __38__VMUProcList_newestProcInfoWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  uint64_t v5 = [v17 startTime];
  uint64_t v7 = v6;
  if ([v17 pid] != *(_DWORD *)(a1 + 56))
  {
    id v8 = *(void **)(a1 + 32);
    if (!v8
      || ([v17 name],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v8 isEqualToString:v9],
          v9,
          v10))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v13 = *(void *)(v11 + 40);
      uint64_t v12 = (id *)(v11 + 40);
      if (!v13
        || (uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8), v15 = *(void *)(v14 + 32), v5 > v15)
        || v5 == v15 && *(_DWORD *)(v14 + 40) < (int)v7)
      {
        objc_storeStrong(v12, a3);
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        *(void *)(v16 + 32) = v5;
        *(void *)(v16 + 40) = v7;
      }
    }
  }
}

- (id)procInfoWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(NSLock *)self->procLock lock];
  filteredProcs = self->filteredProcs;
  uint64_t v6 = [NSNumber numberWithInt:v3];
  uint64_t v7 = [(NSMutableDictionary *)filteredProcs objectForKeyedSubscript:v6];

  [(NSLock *)self->procLock unlock];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->filteredProcs, 0);
  objc_storeStrong((id *)&self->allProcs, 0);

  objc_storeStrong((id *)&self->procLock, 0);
}

@end