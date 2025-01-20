@interface PLBackupRestoreAgent
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)backupState;
- (BOOL)restoreState;
- (MBManager)backupRestoreManager;
- (PLBackupRestoreAgent)init;
- (PLCFNotificationOperatorComposition)backupRestoreNotification;
- (PLEntryNotificationOperatorComposition)fastPassCallback;
- (void)didChangeEvent:(id)a3 toState:(BOOL)a4;
- (void)handleFastPassCallback:(id)a3;
- (void)initOperatorDependancies;
- (void)logEventForwardBackupRestore;
- (void)setBackupRestoreNotification:(id)a3;
- (void)setBackupState:(BOOL)a3;
- (void)setFastPassCallback:(id)a3;
- (void)setRestoreState:(BOOL)a3;
- (void)updateBackupState;
- (void)updateRestoreState;
@end

@implementation PLBackupRestoreAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBackupRestoreAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLBackupRestoreAgent)init
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || ([MEMORY[0x1E4F92A38] nonUIBuild] & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)PLBackupRestoreAgent;
    v4 = [(PLAgent *)&v38 init];
    v5 = v4;
    if (v4)
    {
      [(PLBackupRestoreAgent *)v4 logEventForwardBackupRestore];
      v6 = (MBManager *)objc_alloc_init(MEMORY[0x1E4F78008]);
      backupRestoreManager = v5->_backupRestoreManager;
      v5->_backupRestoreManager = v6;

      v5->_backupState = 0;
      v5->_restoreState = 0;
      if ([(PLOperator *)v5 isDebugEnabled])
      {
        v8 = [NSString stringWithFormat:@"PLBackupRestoreAgent::init: _backupState=%i, _restoreState=%i", v5->_backupState, v5->_restoreState];
        v9 = (void *)MEMORY[0x1E4F929B8];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLBackupRestoreAgent init]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:96];

        v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int out_token = 138412290;
          v40 = v8;
          _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&out_token, 0xCu);
        }
      }
      int out_token = -1;
      v14 = (const char *)[(id)*MEMORY[0x1E4F78030] UTF8String];
      v15 = [(PLOperator *)v5 workQueue];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __28__PLBackupRestoreAgent_init__block_invoke;
      handler[3] = &unk_1E6930530;
      v16 = v5;
      v37 = v16;
      notify_register_dispatch(v14, &out_token, v15, handler);

      int v35 = -1;
      uint64_t v17 = *MEMORY[0x1E4F78048];
      v18 = (const char *)[(id)*MEMORY[0x1E4F78048] UTF8String];
      v19 = [(PLOperator *)v16 workQueue];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __28__PLBackupRestoreAgent_init__block_invoke_33;
      v33[3] = &unk_1E6930530;
      v20 = v16;
      v34 = v20;
      notify_register_dispatch(v18, &v35, v19, v33);

      id v21 = objc_alloc(MEMORY[0x1E4F929A0]);
      v22 = [(PLOperator *)v20 workQueue];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __28__PLBackupRestoreAgent_init__block_invoke_38;
      v31[3] = &unk_1E692A0F0;
      v23 = v20;
      v32 = v23;
      v24 = (void *)[v21 initWithWorkQueue:v22 forNotification:v17 requireState:1 withBlock:v31];
      [(PLBackupRestoreAgent *)v23 setBackupRestoreNotification:v24];

      if (_os_feature_enabled_impl())
      {
        id v25 = objc_alloc(MEMORY[0x1E4F929E8]);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __28__PLBackupRestoreAgent_init__block_invoke_43;
        v29[3] = &unk_1E692A0F0;
        v26 = v23;
        v30 = v26;
        v27 = (void *)[v25 initWithOperator:v26 forEntryKey:@"XPCMetrics_OngoingRestore_14_2" withBlock:v29];
        [(PLBackupRestoreAgent *)v26 setFastPassCallback:v27];
      }
    }
    self = v5;
    v3 = self;
  }

  return v3;
}

uint64_t __28__PLBackupRestoreAgent_init__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDebugEnabled])
  {
    objc_super v2 = [NSString stringWithFormat:@"PLBackupRestoreAgent::kMBManagerBackupStateChangedNotification fired"];
    v3 = (void *)MEMORY[0x1E4F929B8];
    v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m"];
    v5 = [v4 lastPathComponent];
    v6 = [NSString stringWithUTF8String:"-[PLBackupRestoreAgent init]_block_invoke"];
    [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:101];

    v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      v10 = v2;
      _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) updateBackupState];
}

uint64_t __28__PLBackupRestoreAgent_init__block_invoke_33(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDebugEnabled])
  {
    objc_super v2 = [NSString stringWithFormat:@"PLBackupRestoreAgent::kMBManagerRestoreStateChangedNotification fired"];
    v3 = (void *)MEMORY[0x1E4F929B8];
    v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m"];
    v5 = [v4 lastPathComponent];
    v6 = [NSString stringWithUTF8String:"-[PLBackupRestoreAgent init]_block_invoke"];
    [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:108];

    v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      v10 = v2;
      _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) updateRestoreState];
}

void __28__PLBackupRestoreAgent_init__block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Backup restore state changed. UserInfo: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardBackupRestore];
}

void __28__PLBackupRestoreAgent_init__block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6) = 0;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Fast Pass Process state changed. Notification Received", (uint8_t *)&v6, 2u);
  }

  if (v3)
  {
    int v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Fast Pass Process state changed. User info:%@", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) handleFastPassCallback:v3];
  }
}

- (void)handleFastPassCallback:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state changed. UserInfo: %@", buf, 0xCu);
  }

  int v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  int v6 = [v3 objectForKey:@"entry"];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"state"];
    if (v8)
    {
      int v9 = (void *)v8;
      v10 = [v7 objectForKeyedSubscript:@"processName"];

      if (v10)
      {
        uint64_t v11 = [v7 objectForKeyedSubscript:@"state"];
        int v12 = [v11 intValue];

        v13 = [v7 objectForKeyedSubscript:@"processName"];
        if (v12 > 29)
        {
          if (v12 == 30)
          {
            v29 = PLLogCommon();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state Stopped", buf, 2u);
            }

            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            v15 = v13;
            uint64_t v30 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
            if (!v30) {
              goto LABEL_45;
            }
            uint64_t v31 = v30;
            v36 = v13;
            uint64_t v32 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v42 != v32) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v34 = *(void *)(*((void *)&v41 + 1) + 8 * i);
                int v35 = [MEMORY[0x1E4F92900] sharedInstance];
                [v35 createQualificationEventForwardWithQualificationID:16 withRemovingChildNodeName:v34 withStartDate:v5];
              }
              uint64_t v31 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }
            while (v31);
            goto LABEL_44;
          }
          if (v12 == 60)
          {
            v22 = PLLogCommon();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state Completed", buf, 2u);
            }

            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            v15 = v13;
            uint64_t v23 = [v15 countByEnumeratingWithState:&v37 objects:v49 count:16];
            if (!v23) {
              goto LABEL_45;
            }
            uint64_t v24 = v23;
            v36 = v13;
            uint64_t v25 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v38 != v25) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * j);
                v28 = [MEMORY[0x1E4F92900] sharedInstance];
                [v28 createQualificationEventForwardWithQualificationID:16 withRemovingChildNodeName:v27 withStartDate:v5];
              }
              uint64_t v24 = [v15 countByEnumeratingWithState:&v37 objects:v49 count:16];
            }
            while (v24);
            goto LABEL_44;
          }
        }
        else
        {
          if (v12 == 10)
          {
            v15 = PLLogCommon();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state Scheduled", buf, 2u);
            }
            goto LABEL_45;
          }
          if (v12 == 20)
          {
            v14 = PLLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state Start", buf, 2u);
            }

            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            v15 = v13;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
            if (!v16) {
              goto LABEL_45;
            }
            uint64_t v17 = v16;
            v36 = v13;
            uint64_t v18 = *(void *)v46;
            do
            {
              for (uint64_t k = 0; k != v17; ++k)
              {
                if (*(void *)v46 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v45 + 1) + 8 * k);
                id v21 = [MEMORY[0x1E4F92900] sharedInstance];
                [v21 createQualificationEventForwardWithQualificationID:16 withAddingChildNodeName:v20 withStartDate:v5];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
            }
            while (v17);
LABEL_44:
            v13 = v36;
LABEL_45:

            goto LABEL_46;
          }
        }
        v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D2690000, v15, OS_LOG_TYPE_ERROR, "Ongoing Restore: DAS Fast Pass State is invalid: Not one of scheduled, started, stopped or fully done", buf, 2u);
        }
        goto LABEL_45;
      }
    }
  }
LABEL_46:
}

- (void)initOperatorDependancies
{
  if (([MEMORY[0x1E4F92A38] nonUIBuild] & 1) == 0)
  {
    [(PLBackupRestoreAgent *)self updateBackupState];
    [(PLBackupRestoreAgent *)self updateRestoreState];
    id v4 = [MEMORY[0x1E4F92900] sharedInstance];
    id v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v4 createDistributionEventForwardWithDistributionID:39 withChildNodeNameToWeight:&unk_1F29EBED0 withStartDate:v3];
  }
}

- (void)setBackupState:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_backupState != a3)
  {
    BOOL v3 = a3;
    if (([MEMORY[0x1E4F92A38] nonUIBuild] & 1) == 0)
    {
      if ([(PLOperator *)self isDebugEnabled])
      {
        int v5 = objc_msgSend(NSString, "stringWithFormat:", @"PLBackupRestoreAgent::setBackupState:%i", v3);
        int v6 = (void *)MEMORY[0x1E4F929B8];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m"];
        uint64_t v8 = [v7 lastPathComponent];
        int v9 = [NSString stringWithUTF8String:"-[PLBackupRestoreAgent setBackupState:]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:190];

        v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          int v12 = v5;
          _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
      [(PLBackupRestoreAgent *)self didChangeEvent:@"Backup" toState:v3];
      self->_backupState = v3;
    }
  }
}

- (void)setRestoreState:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_restoreState != a3)
  {
    BOOL v3 = a3;
    if (([MEMORY[0x1E4F92A38] nonUIBuild] & 1) == 0)
    {
      if ([(PLOperator *)self isDebugEnabled])
      {
        int v5 = objc_msgSend(NSString, "stringWithFormat:", @"PLBackupRestoreAgent::setRestoreState:%i", v3);
        int v6 = (void *)MEMORY[0x1E4F929B8];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m"];
        uint64_t v8 = [v7 lastPathComponent];
        int v9 = [NSString stringWithUTF8String:"-[PLBackupRestoreAgent setRestoreState:]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:198];

        v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          int v12 = v5;
          _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
      [(PLBackupRestoreAgent *)self didChangeEvent:@"Restore" toState:v3];
      self->_restoreState = v3;
    }
  }
}

- (void)didChangeEvent:(id)a3 toState:(BOOL)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([MEMORY[0x1E4F92A38] nonUIBuild] & 1) == 0
    && (([v5 isEqualToString:@"Backup"] & 1) != 0
     || [v5 isEqualToString:@"Restore"]))
  {
    int v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if (a4)
    {
      id v14 = v5;
      v15[0] = &unk_1F29F1490;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint64_t v8 = [MEMORY[0x1E4F92900] sharedInstance];
      [v8 createDistributionEventForwardWithDistributionID:12 withChildNodeNameToWeight:v7 withStartDate:v6];

      id v12 = v5;
      uint64_t v13 = &unk_1F29F1490;
      int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    }
    else
    {
      v10 = [MEMORY[0x1E4F92900] sharedInstance];
      [v10 createDistributionEventForwardWithDistributionID:12 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v6];

      int v9 = &unk_1F29EBEF8;
    }
    uint64_t v11 = [MEMORY[0x1E4F92900] sharedInstance];
    [v11 createDistributionEventForwardWithDistributionID:39 withChildNodeNameToWeight:v9 withStartDate:v6];
  }
}

- (void)updateBackupState
{
  id v4 = [(PLBackupRestoreAgent *)self backupRestoreManager];
  BOOL v3 = [v4 backupState];
  -[PLBackupRestoreAgent setBackupState:](self, "setBackupState:", [v3 state] == 2);
}

- (void)updateRestoreState
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PLBackupRestoreAgent *)self backupRestoreManager];
  id v4 = [v3 restoreState];
  uint64_t v5 = [v4 state];

  [(PLBackupRestoreAgent *)self setRestoreState:v5 == 2];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    blocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __42__PLBackupRestoreAgent_updateRestoreState__block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v6;
    if (qword_1EBD5AED0 != -1) {
      dispatch_once(&qword_1EBD5AED0, &block);
    }
    if (_MergedGlobals_1_66)
    {
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"PLBackupRestoreAgent::restoreState:%d", v5, block, v17, v18, v19, v20);
      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m"];
      v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLBackupRestoreAgent updateRestoreState]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:231];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  BOOL v13 = (v5 - 1) < 3;
  id v14 = (void *)MEMORY[0x1E4F929C0];
  v15 = [NSNumber numberWithBool:v13];
  [v14 setObject:v15 forKey:@"ongoingRestore" forApplicationID:@"com.apple.powerlogd" saveToDisk:1];
}

uint64_t __42__PLBackupRestoreAgent_updateRestoreState__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_66 = result;
  return result;
}

- (void)logEventForwardBackupRestore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  BOOL v3 = [(PLBackupRestoreAgent *)self backupRestoreNotification];
  uint32_t state = notify_get_state([v3 stateToken], &state64);

  uint64_t v5 = PLLogCommon();
  uint64_t v6 = v5;
  if (state)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2690000, v6, OS_LOG_TYPE_ERROR, "Restore state Unavailable", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = state64;
      _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "backupRestore state %llu", buf, 0xCu);
    }

    int v9 = @"State";
    id v7 = [NSNumber numberWithUnsignedLongLong:state64];
    v10 = v7;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];

    [(PLOperator *)self logForSubsystem:@"BackupMetrics" category:@"RestoreState" data:v6];
  }
}

- (MBManager)backupRestoreManager
{
  return (MBManager *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)backupState
{
  return self->_backupState;
}

- (BOOL)restoreState
{
  return self->_restoreState;
}

- (PLCFNotificationOperatorComposition)backupRestoreNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackupRestoreNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)fastPassCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFastPassCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastPassCallback, 0);
  objc_storeStrong((id *)&self->_backupRestoreNotification, 0);
  objc_storeStrong((id *)&self->_backupRestoreManager, 0);
}

@end