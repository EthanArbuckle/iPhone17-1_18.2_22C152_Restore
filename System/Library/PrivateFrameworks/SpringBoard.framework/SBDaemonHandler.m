@interface SBDaemonHandler
+ (BOOL)addRequest:(id)a3 forKey:(id)a4 forDaemonPid:(int)a5;
+ (id)stateDescription;
+ (void)initialize;
+ (void)noteDaemonCanceled:(id)a3;
+ (void)removeRequestForKey:(id)a3 forDaemonPid:(int)a4;
@end

@implementation SBDaemonHandler

void __50__SBDaemonHandler_addRequest_forKey_forDaemonPid___block_invoke(uint64_t a1)
{
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v2 = objc_msgSend((id)__daemonsByPid, "objectForKey:");
  if (v2) {
    goto LABEL_4;
  }
  v3 = [SBDaemonContext alloc];
  uint64_t v4 = [(SBDaemonContext *)v3 initWithPid:*(unsigned int *)(a1 + 56) queue:__queue];
  if (v4)
  {
    v2 = (void *)v4;
    [(id)__daemonsByPid setObject:v4 forKey:v5];
LABEL_4:
    [v2 addRequest:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

    goto LABEL_5;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_5:
}

+ (BOOL)addRequest:(id)a3 forKey:(id)a4 forDaemonPid:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v9 = __queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__SBDaemonHandler_addRequest_forKey_forDaemonPid___block_invoke;
  v13[3] = &unk_1E6B04630;
  int v17 = a5;
  id v15 = v8;
  v16 = &v18;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(v9, v13);
  LOBYTE(v9) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v9;
}

+ (void)removeRequestForKey:(id)a3 forDaemonPid:(int)a4
{
  id v5 = a3;
  v6 = __queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SBDaemonHandler_removeRequestForKey_forDaemonPid___block_invoke;
  v8[3] = &unk_1E6AF7E00;
  int v10 = a4;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

void __52__SBDaemonHandler_removeRequestForKey_forDaemonPid___block_invoke(uint64_t a1)
{
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v2 = objc_msgSend((id)__daemonsByPid, "objectForKey:");
  v3 = v2;
  if (v2) {
    [v2 removeRequestForKey:*(void *)(a1 + 32)];
  }
}

+ (void)noteDaemonCanceled:(id)a3
{
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "pid"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(id)__daemonsByPid removeObjectForKey:v3];
}

+ (void)initialize
{
  if (initialize___once != -1) {
    dispatch_once(&initialize___once, &__block_literal_global_195);
  }
}

void __29__SBDaemonHandler_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)__daemonsByPid;
  __daemonsByPid = (uint64_t)v0;

  uint64_t Serial = BSDispatchQueueCreateSerial();
  id v3 = (void *)__queue;
  __queue = Serial;
}

+ (id)stateDescription
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__64;
  id v9 = __Block_byref_object_dispose__64;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBDaemonHandler_stateDescription__block_invoke;
  block[3] = &unk_1E6AF56B0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__queue, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__SBDaemonHandler_stateDescription__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)__daemonsByPid allValues];
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_6_0];

  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)__daemonsByPid, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) description];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [NSString stringWithFormat:@"SBDaemonHandler state -> %@", v4];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

uint64_t __35__SBDaemonHandler_stateDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(a2, "pid"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 pid];

  uint64_t v9 = [v7 numberWithInt:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

@end