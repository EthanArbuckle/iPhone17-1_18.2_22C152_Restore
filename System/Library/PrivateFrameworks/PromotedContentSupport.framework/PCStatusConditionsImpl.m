@interface PCStatusConditionsImpl
- (BOOL)isConditionRateLimited:(id)a3 onOperation:(int64_t)a4;
- (BOOL)operationWithCondition:(id)a3 forType:(int64_t)a4;
- (id)_setupXPCConnection;
- (void)cleanupExpiredConditionsInBuffer;
- (void)clearStatusCondition:(id)a3 completionHandler:(id)a4;
- (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setStatusCondition:(id)a3 completionHandler:(id)a4;
@end

@implementation PCStatusConditionsImpl

- (void)setStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(PCStatusConditionsImpl *)self isConditionRateLimited:v6 onOperation:0])
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = sub_220C1EF90;
    v25[4] = sub_220C1EFBC;
    id v26 = (id)MEMORY[0x223C709D0](v7);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = sub_220C1EFC4;
    v23[4] = sub_220C1EFD4;
    id v24 = objc_alloc_init(MEMORY[0x263F08958]);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_220C1EFDC;
    v22[3] = &unk_26457C128;
    v22[4] = v23;
    v22[5] = v25;
    v8 = (void *)MEMORY[0x223C709D0](v22);
    v9 = [(PCStatusConditionsImpl *)self _setupXPCConnection];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_220C1F074;
    v20[3] = &unk_26457C150;
    id v10 = v8;
    id v21 = v10;
    [v9 setInvalidationHandler:v20];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_220C1F194;
    v18[3] = &unk_26457C150;
    id v11 = v10;
    id v19 = v11;
    [v9 setInterruptionHandler:v18];
    [v9 resume];
    v12 = [v9 remoteObjectProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_220C1F2B4;
    v15[3] = &unk_26457C178;
    id v13 = v11;
    id v17 = v13;
    id v14 = v9;
    id v16 = v14;
    [v12 setStatusCondition:v6 completionHandler:v15];

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
  }
}

- (void)clearStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(PCStatusConditionsImpl *)self isConditionRateLimited:v6 onOperation:1])
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = sub_220C1EF90;
    v25[4] = sub_220C1EFBC;
    id v26 = (id)MEMORY[0x223C709D0](v7);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = sub_220C1EFC4;
    v23[4] = sub_220C1EFD4;
    id v24 = objc_alloc_init(MEMORY[0x263F08958]);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_220C1F6B4;
    v22[3] = &unk_26457C128;
    v22[4] = v23;
    v22[5] = v25;
    v8 = (void *)MEMORY[0x223C709D0](v22);
    v9 = [(PCStatusConditionsImpl *)self _setupXPCConnection];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_220C1F74C;
    v20[3] = &unk_26457C150;
    id v10 = v8;
    id v21 = v10;
    [v9 setInvalidationHandler:v20];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_220C1F86C;
    v18[3] = &unk_26457C150;
    id v11 = v10;
    id v19 = v11;
    [v9 setInterruptionHandler:v18];
    [v9 resume];
    v12 = [v9 remoteObjectProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_220C1F98C;
    v15[3] = &unk_26457C178;
    id v13 = v11;
    id v17 = v13;
    id v14 = v9;
    id v16 = v14;
    [v12 clearStatusCondition:v6 completionHandler:v15];

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
  }
}

- (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_220C1EF90;
  v28[4] = sub_220C1EFBC;
  id v29 = (id)MEMORY[0x223C709D0]();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_220C1EFC4;
  v26[4] = sub_220C1EFD4;
  id v27 = objc_alloc_init(MEMORY[0x263F08958]);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_220C1FD74;
  v25[3] = &unk_26457C1A0;
  v25[4] = v26;
  void v25[5] = v28;
  id v11 = (void *)MEMORY[0x223C709D0](v25);
  v12 = [(PCStatusConditionsImpl *)self _setupXPCConnection];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_220C1FE14;
  v23[3] = &unk_26457C150;
  id v13 = v11;
  id v24 = v13;
  [v12 setInvalidationHandler:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_220C1FF38;
  v21[3] = &unk_26457C150;
  id v14 = v13;
  id v22 = v14;
  [v12 setInterruptionHandler:v21];
  [v12 resume];
  v15 = [v12 remoteObjectProxy];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_220C2005C;
  v18[3] = &unk_26457C1C8;
  id v16 = v14;
  id v20 = v16;
  id v17 = v12;
  id v19 = v17;
  [v15 isStatusConditionRegistered:v8 bundleIdentifier:v9 completionHandler:v18];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

- (BOOL)isConditionRateLimited:(id)a3 onOperation:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(PCStatusConditionsImpl *)self cleanupExpiredConditionsInBuffer];
  v7 = APLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = @"Clear";
    if (!a4) {
      id v8 = @"Set";
    }
    int v16 = 138543362;
    id v17 = v8;
    _os_log_impl(&dword_220C1C000, v7, OS_LOG_TYPE_INFO, "PCStatusConditions %{public}@ called. Checking rate limiting.", (uint8_t *)&v16, 0xCu);
  }

  BOOL v9 = [(PCStatusConditionsImpl *)self operationWithCondition:v6 forType:a4];
  id v10 = APLogForCategory();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      v12 = @"CLEAR";
      if (!a4) {
        v12 = @"SET";
      }
      int v16 = 138543362;
      id v17 = v12;
      id v13 = "This is a duplicate %{public}@ call which will be rate limited";
LABEL_14:
      _os_log_impl(&dword_220C1C000, v10, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v16, 0xCu);
    }
  }
  else if (v11)
  {
    id v14 = @"CLEAR";
    if (!a4) {
      id v14 = @"SET";
    }
    int v16 = 138543362;
    id v17 = v14;
    id v13 = "This is a new %{public}@ call which will execute.";
    goto LABEL_14;
  }

  return v9;
}

- (BOOL)operationWithCondition:(id)a3 forType:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[PCRingBuffer sharedInstance];
  v7 = [v6 lock];
  [v7 lock];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [v6 ringBuffer];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v14 = [v13 statusCondition];
        if ([v14 isEqual:v5])
        {
          uint64_t v15 = [v13 operation];

          if (v15 == a4)
          {
            BOOL v24 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  int v16 = (void *)MEMORY[0x263F08A98];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_220C205F0;
  v27[3] = &unk_26457C1F0;
  id v17 = v5;
  id v28 = v17;
  uint64_t v18 = [v16 predicateWithBlock:v27];
  id v19 = [v6 ringBuffer];
  [v19 filterUsingPredicate:v18];

  id v20 = [PCStatusConditionRateLimitedObject alloc];
  id v21 = [MEMORY[0x263EFF910] now];
  id v22 = [(PCStatusConditionRateLimitedObject *)v20 init:v17 at:v21 kind:a4];

  v23 = [v6 ringBuffer];
  [v23 addObject:v22];

  BOOL v24 = 0;
  id v8 = v28;
LABEL_13:

  v25 = [v6 lock];
  [v25 unlock];

  return v24;
}

- (void)cleanupExpiredConditionsInBuffer
{
  v2 = +[PCRingBuffer sharedInstance];
  v3 = [v2 lock];
  [v3 lock];

  [v2 cappedRingBufferTo:5];
  v4 = [MEMORY[0x263EFF910] date];
  id v5 = (void *)MEMORY[0x263F08A98];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_220C20758;
  v10[3] = &unk_26457C1F0;
  id v11 = v4;
  id v6 = v4;
  v7 = [v5 predicateWithBlock:v10];
  id v8 = [v2 ringBuffer];
  [v8 filterUsingPredicate:v7];

  uint64_t v9 = [v2 lock];
  [v9 unlock];
}

- (id)_setupXPCConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ap.adservicesd.statusconditionservice" options:4096];
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2AB538];
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

@end