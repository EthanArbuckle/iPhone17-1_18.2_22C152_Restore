@interface PLInitialSyncAgent
+ (id)entryEventIntervalDefinitions;
+ (void)load;
- (PLXPCListenerOperatorComposition)xpcHandler;
- (void)initOperatorDependancies;
- (void)logInitialSyncActivityFromEvent:(id)a3;
- (void)logInitialSyncFromEvent:(id)a3;
- (void)setXpcHandler:(id)a3;
@end

@implementation PLInitialSyncAgent

+ (void)load
{
  v2 = (void *)MEMORY[0x1E4F929B0];
  uint64_t v3 = objc_opt_class();
  [v2 registerOperator:v3];
}

+ (id)entryEventIntervalDefinitions
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v38[0] = @"InitialSync";
  uint64_t v35 = *MEMORY[0x1E4F92C50];
  uint64_t v2 = v35;
  uint64_t v33 = *MEMORY[0x1E4F92CD0];
  uint64_t v3 = v33;
  v34 = &unk_1F29F0B40;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v37[0] = v24;
  uint64_t v36 = *MEMORY[0x1E4F92CA8];
  uint64_t v4 = v36;
  v31[0] = @"count";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v32[0] = v22;
  v31[1] = @"timestampEnd";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_DateFormat");
  v32[1] = v20;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v37[1] = v19;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v35 count:2];
  v38[1] = @"InitialSyncActivity";
  v39[0] = v18;
  v28 = &unk_1F29F0B40;
  v29[0] = v2;
  uint64_t v27 = v3;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v29[1] = v4;
  v30[0] = v17;
  v25[0] = @"activityID";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v26[0] = v5;
  v25[1] = @"errorDescription";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v26[1] = v7;
  v25[2] = @"success";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v26[2] = v9;
  v25[3] = @"timestampEnd";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_DateFormat");
  v26[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
  v30[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v39[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

  return v14;
}

- (void)initOperatorDependancies
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__PLInitialSyncAgent_initOperatorDependancies__block_invoke;
    v6[3] = &unk_1E692A6F8;
    v6[4] = self;
    uint64_t v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F29EA080 withBlock:v6];
    xpcHandler = self->_xpcHandler;
    self->_xpcHandler = v4;
  }
}

void __46__PLInitialSyncAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a4;
  id v7 = a5;
  if ([v8 isEqualToString:@"InitialSyncActivity"])
  {
    [*(id *)(a1 + 32) logInitialSyncActivityFromEvent:v7];
  }
  else if ([v8 isEqualToString:@"InitialSync"])
  {
    [*(id *)(a1 + 32) logInitialSyncFromEvent:v7];
  }
}

- (void)logInitialSyncActivityFromEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"state"];
  v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"InitialSyncActivity"];
  if ([v5 isEqualToString:@"start"])
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
    id v8 = [v4 objectForKeyedSubscript:@"activity"];
    [v7 setObject:v8 forKeyedSubscript:@"activityID"];

    [(PLOperator *)self logEntry:v7];
LABEL_10:

    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"end"])
  {
    v9 = [(PLOperator *)self storage];
    id v7 = [v9 lastEntryForKey:v6];

    if (v7
      && ([v7 objectForKeyedSubscript:@"timestampEnd"],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __54__PLInitialSyncAgent_logInitialSyncActivityFromEvent___block_invoke;
      v17[3] = &unk_1E692B128;
      id v18 = v7;
      id v19 = v4;
      [(PLOperator *)self updateEntry:v18 withBlock:v17];
    }
    else
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withDate:0];
      v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [v11 setObject:v12 forKeyedSubscript:@"timestampEnd"];

      v13 = [v4 objectForKeyedSubscript:@"activity"];
      [v11 setObject:v13 forKeyedSubscript:@"activityID"];

      uint64_t v14 = [v4 objectForKeyedSubscript:@"success"];
      [v11 setObject:v14 forKeyedSubscript:@"success"];

      v15 = [v4 objectForKeyedSubscript:@"success"];
      LOBYTE(v14) = [v15 BOOLValue];

      if ((v14 & 1) == 0)
      {
        v16 = [v4 objectForKeyedSubscript:@"error"];
        [v11 setObject:v16 forKeyedSubscript:@"errorDescription"];
      }
      [(PLOperator *)self logEntry:v11];
    }
    goto LABEL_10;
  }
LABEL_11:
}

void __54__PLInitialSyncAgent_logInitialSyncActivityFromEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"timestampEnd"];

  uint64_t v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"success"];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"success"];

  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"success"];
  LOBYTE(v3) = [v4 BOOLValue];

  if ((v3 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"error"];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"errorDescription"];
  }
}

- (void)logInitialSyncFromEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"state"];
  v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"InitialSync"];
  if ([v5 isEqualToString:@"start"])
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
    id v8 = [v4 objectForKeyedSubscript:@"activityCount"];
    [v7 setObject:v8 forKeyedSubscript:@"count"];

    [(PLOperator *)self logEntry:v7];
LABEL_8:

    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"end"])
  {
    v9 = [(PLOperator *)self storage];
    id v7 = [v9 lastEntryForKey:v6];

    if (v7
      && ([v7 objectForKeyedSubscript:@"timestampEnd"],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__PLInitialSyncAgent_logInitialSyncFromEvent___block_invoke;
      v14[3] = &unk_1E692A250;
      id v15 = v7;
      [(PLOperator *)self updateEntry:v15 withBlock:v14];
    }
    else
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withDate:0];
      v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [v11 setObject:v12 forKeyedSubscript:@"timestampEnd"];

      v13 = [v4 objectForKeyedSubscript:@"activityCount"];
      [v11 setObject:v13 forKeyedSubscript:@"count"];

      [(PLOperator *)self logEntry:v11];
    }
    goto LABEL_8;
  }
LABEL_9:
}

void __46__PLInitialSyncAgent_logInitialSyncFromEvent___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"timestampEnd"];
}

- (PLXPCListenerOperatorComposition)xpcHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end