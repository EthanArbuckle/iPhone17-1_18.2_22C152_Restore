@interface PLAccountingNodeManager
+ (id)sharedInstance;
- (NSMutableDictionary)nodeIDToNodeName;
- (NSMutableDictionary)nodeNameToNodeID;
- (PLAccountingNodeManager)init;
- (id)childNodeIDsFromChildNodeNames:(id)a3;
- (id)nodeIDForNodeName:(id)a3 isPermanent:(BOOL)a4;
- (id)nodeNameForNodeID:(id)a3;
- (void)removeNodeReferenceFromCache:(id)a3;
- (void)setNodeIDToNodeName:(id)a3;
- (void)setNodeNameToNodeID:(id)a3;
- (void)setupNodes;
@end

@implementation PLAccountingNodeManager

+ (id)sharedInstance
{
  v3 = [MEMORY[0x263F5F698] sharedCore];
  v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__PLAccountingNodeManager_sharedInstance__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedInstance_onceToken_2 != -1) {
      dispatch_once(&sharedInstance_onceToken_2, block);
    }
    id v6 = (id)sharedInstance_sharedInstance_2;
  }
  return v6;
}

- (id)childNodeIDsFromChildNodeNames:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__PLAccountingNodeManager_childNodeIDsFromChildNodeNames___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (childNodeIDsFromChildNodeNames__defaultOnce != -1) {
      dispatch_once(&childNodeIDsFromChildNodeNames__defaultOnce, block);
    }
    if (childNodeIDsFromChildNodeNames__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"childNodeNames=%@", v4];
      v7 = (void *)MEMORY[0x263F5F638];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager childNodeIDsFromChildNodeNames:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:142];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v12 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [(PLAccountingNodeManager *)self nodeIDForNodeName:*(void *)(*((void *)&v32 + 1) + 8 * i) isPermanent:0];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v15);
  }

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __58__PLAccountingNodeManager_childNodeIDsFromChildNodeNames___block_invoke_47;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v31 = v19;
    if (childNodeIDsFromChildNodeNames__defaultOnce_45 != -1) {
      dispatch_once(&childNodeIDsFromChildNodeNames__defaultOnce_45, &v27);
    }
    if (childNodeIDsFromChildNodeNames__classDebugEnabled_46)
    {
      v20 = [NSString stringWithFormat:@"childNodeIDs=%@", v12, v27, v28, v29, v30, v31, (void)v32];
      v21 = (void *)MEMORY[0x263F5F638];
      v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
      v23 = [v22 lastPathComponent];
      v24 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager childNodeIDsFromChildNodeNames:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:152];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }

  return v12;
}

- (id)nodeIDForNodeName:(id)a3 isPermanent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  p_nodeMappingLock = &self->_nodeMappingLock;
  os_unfair_lock_lock(&self->_nodeMappingLock);
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (nodeIDForNodeName_isPermanent__defaultOnce != -1) {
      dispatch_once(&nodeIDForNodeName_isPermanent__defaultOnce, block);
    }
    if (nodeIDForNodeName_isPermanent__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"nodeName=%@, isPermanent=%i", v6, v4];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
      v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager nodeIDForNodeName:isPermanent:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:50];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_18;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v15;
    if (nodeIDForNodeName_isPermanent__defaultOnce_16 != -1) {
      dispatch_once(&nodeIDForNodeName_isPermanent__defaultOnce_16, v53);
    }
    if (nodeIDForNodeName_isPermanent__classDebugEnabled_17)
    {
      uint64_t v16 = NSString;
      v17 = [(PLAccountingNodeManager *)self nodeNameToNodeID];
      v18 = [v16 stringWithFormat:@"nodeNameToNodeID=%@", v17];

      uint64_t v19 = (void *)MEMORY[0x263F5F638];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
      v21 = [v20 lastPathComponent];
      v22 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager nodeIDForNodeName:isPermanent:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:52];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v24 = [(PLAccountingNodeManager *)self nodeNameToNodeID];

  if (v24)
  {
    v25 = [(PLAccountingNodeManager *)self nodeNameToNodeID];
    v26 = [v25 objectForKeyedSubscript:v6];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v27 = objc_opt_class();
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_24;
      v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v52[4] = v27;
      if (nodeIDForNodeName_isPermanent__defaultOnce_22 != -1) {
        dispatch_once(&nodeIDForNodeName_isPermanent__defaultOnce_22, v52);
      }
      if (nodeIDForNodeName_isPermanent__classDebugEnabled_23)
      {
        uint64_t v28 = [NSString stringWithFormat:@"nodeID=%@", v26];
        v29 = (void *)MEMORY[0x263F5F638];
        v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
        uint64_t v31 = [v30 lastPathComponent];
        long long v32 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager nodeIDForNodeName:isPermanent:]"];
        [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:73];

        long long v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    if (v26)
    {
      os_unfair_lock_unlock(&self->_nodeMappingLock);
      id v34 = v26;
    }
    else
    {
      long long v35 = [[PLAccountingNodeEntry alloc] initWithName:v6];
      v36 = [NSNumber numberWithBool:v4];
      [(PLEntry *)v35 setObject:v36 forKeyedSubscript:*MEMORY[0x263F5F788]];

      v37 = NSNumber;
      uint64_t v38 = [MEMORY[0x263F5F698] sharedCore];
      v39 = [v38 storage];
      objc_msgSend(v37, "numberWithLongLong:", objc_msgSend(v39, "blockingWriteEntry:withCompletionBlock:", v35, &__block_literal_global_17));
      id v34 = (id)objc_claimAutoreleasedReturnValue();

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v40 = objc_opt_class();
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_2;
        v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v51[4] = v40;
        if (nodeIDForNodeName_isPermanent__defaultOnce_31 != -1) {
          dispatch_once(&nodeIDForNodeName_isPermanent__defaultOnce_31, v51);
        }
        if (nodeIDForNodeName_isPermanent__classDebugEnabled_32)
        {
          uint64_t v41 = [NSString stringWithFormat:@"added to DB node=%@", v35];
          v50 = (void *)MEMORY[0x263F5F638];
          v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
          v43 = [v42 lastPathComponent];
          v44 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager nodeIDForNodeName:isPermanent:]"];
          [v50 logMessage:v41 fromFile:v43 fromFunction:v44 fromLineNumber:83];

          v45 = (void *)v41;
          v46 = PLLogCommon();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
      v47 = [(PLAccountingNodeManager *)self nodeNameToNodeID];
      [v47 setObject:v34 forKeyedSubscript:v6];

      v48 = [(PLAccountingNodeManager *)self nodeIDToNodeName];
      [v48 setObject:v6 forKeyedSubscript:v34];

      os_unfair_lock_unlock(p_nodeMappingLock);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_nodeMappingLock);
    id v34 = 0;
  }

  return v34;
}

- (NSMutableDictionary)nodeNameToNodeID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (PLAccountingNodeManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLAccountingNodeManager;
  v2 = [(PLAccountingNodeManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_nodeMappingLock._os_unfair_lock_opaque = 0;
    [(PLAccountingNodeManager *)v2 setupNodes];
  }
  return v3;
}

uint64_t __41__PLAccountingNodeManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

uint64_t __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  nodeIDForNodeName_isPermanent__classDebugEnabled = result;
  return result;
}

uint64_t __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_18(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  nodeIDForNodeName_isPermanent__classDebugEnabled_17 = result;
  return result;
}

uint64_t __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_24(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  nodeIDForNodeName_isPermanent__classDebugEnabled_23 = result;
  return result;
}

uint64_t __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  nodeIDForNodeName_isPermanent__classDebugEnabled_32 = result;
  return result;
}

- (id)nodeNameForNodeID:(id)a3
{
  p_nodeMappingLock = &self->_nodeMappingLock;
  id v5 = a3;
  os_unfair_lock_lock(p_nodeMappingLock);
  id v6 = [(PLAccountingNodeManager *)self nodeIDToNodeName];
  v7 = [v6 objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_nodeMappingLock);
  return v7;
}

- (void)removeNodeReferenceFromCache:(id)a3
{
  id v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLAccountingNodeManager removeNodeReferenceFromCache:](v5);
  }

  uint64_t v6 = [v4 userInfo];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [v4 userInfo];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingNodeManager removeNodeReferenceFromCache:](v10);
      }

      v11 = [v4 userInfo];
      v12 = [v11 allKeys];

      p_nodeMappingLock = &self->_nodeMappingLock;
      os_unfair_lock_lock(&self->_nodeMappingLock);
      uint64_t v14 = [(PLAccountingNodeManager *)self nodeIDToNodeName];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke;
      v20[3] = &unk_2647B52D8;
      id v21 = v12;
      id v15 = v12;
      uint64_t v16 = [v14 keysOfEntriesPassingTest:v20];

      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke_2;
      v18[3] = &unk_2647B5300;
      v18[4] = self;
      id v19 = v4;
      [v16 enumerateObjectsUsingBlock:v18];
      v17 = [(PLAccountingNodeManager *)self nodeNameToNodeID];
      [v17 removeObjectsForKeys:v15];

      os_unfair_lock_unlock(p_nodeMappingLock);
    }
  }
}

uint64_t __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsString:");
}

void __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) nodeIDToNodeName];
  id v5 = [v4 objectForKeyedSubscript:v3];

  uint64_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke_2_cold_1((uint64_t)v5, a1, v6);
  }

  v7 = [*(id *)(a1 + 40) userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"MaskedName"];
  v10 = [*(id *)(a1 + 32) nodeIDToNodeName];
  [v10 setObject:v9 forKeyedSubscript:v3];
}

uint64_t __58__PLAccountingNodeManager_childNodeIDsFromChildNodeNames___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  childNodeIDsFromChildNodeNames__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingNodeManager_childNodeIDsFromChildNodeNames___block_invoke_47(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  childNodeIDsFromChildNodeNames__classDebugEnabled_46 = result;
  return result;
}

- (void)setupNodes
{
  p_nodeMappingLock = &self->_nodeMappingLock;
  os_unfair_lock_lock(&self->_nodeMappingLock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke;
  block[3] = &unk_2647B50A0;
  block[4] = self;
  if (setupNodes_onceToken != -1) {
    dispatch_once(&setupNodes_onceToken, block);
  }
  os_unfair_lock_unlock(p_nodeMappingLock);
}

void __37__PLAccountingNodeManager_setupNodes__block_invoke(uint64_t a1)
{
  v127[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  [*(id *)(a1 + 32) setNodeNameToNodeID:v2];

  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [*(id *)(a1 + 32) setNodeIDToNodeName:v3];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel_removeNodeReferenceFromCache_ name:@"PLAppDeletionActivityStarted" object:0];

  uint64_t v5 = [objc_alloc(MEMORY[0x263F5F690]) initWithKey:@"ID" withValue:&unk_26DA69DA8 withComparisonOperation:5];
  uint64_t v6 = +[PLAccountingNodeEntry entryKey];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = [MEMORY[0x263F5F698] sharedCore];
  uint64_t v9 = [v8 storage];
  v101 = (void *)v5;
  v127[0] = v5;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:1];
  v102 = (void *)v6;
  v11 = [v9 entriesForKey:v6 withComparisons:v10];
  v12 = [v7 setWithArray:v11];

  unint64_t v13 = 0x263F5F000uLL;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v121[0] = MEMORY[0x263EF8330];
    v121[1] = 3221225472;
    v121[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_65;
    v121[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v121[4] = v14;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1, v121);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1)
    {
      id v15 = [NSString stringWithFormat:@"reservedNodesInDB=%@", v12];
      uint64_t v16 = (void *)MEMORY[0x263F5F638];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
      v18 = [v17 lastPathComponent];
      id v19 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager setupNodes]_block_invoke_2"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:176];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      unint64_t v13 = 0x263F5F000uLL;
    }
  }
  id v21 = +[PLAccountingEngine deviceRootNodeIDs];
  v22 = (void *)[v21 mutableCopy];

  [v22 addObject:&unk_26DA69DC0];
  [v22 addObject:&unk_26DA69DA8];
  unint64_t v23 = 0x2647B4000;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v24 = objc_opt_class();
    v120[0] = MEMORY[0x263EF8330];
    v120[1] = 3221225472;
    v120[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_74;
    v120[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v120[4] = v24;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_72 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_72, v120);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_73)
    {
      v25 = [NSString stringWithFormat:@"reservedNodeIDs=%@", v22];
      v26 = (void *)MEMORY[0x263F5F638];
      uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
      uint64_t v28 = [v27 lastPathComponent];
      v29 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager setupNodes]_block_invoke_2"];
      [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:182];

      v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      unint64_t v13 = 0x263F5F000uLL;
      unint64_t v23 = 0x2647B4000uLL;
    }
  }
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obj = v22;
  uint64_t v31 = [obj countByEnumeratingWithState:&v116 objects:v126 count:16];
  v103 = v12;
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v105 = *MEMORY[0x263F5F788];
    uint64_t v106 = *(void *)v117;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v117 != v106) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v116 + 1) + 8 * v33);
        long long v35 = (void *)[objc_alloc(*(Class *)(v23 + 3128)) initWithRootNodeID:v34];
        [v35 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v105];
        if ([*(id *)(v13 + 1600) debugEnabled])
        {
          uint64_t v36 = objc_opt_class();
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_80;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v36;
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_78 != -1) {
            dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_78, block);
          }
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_79)
          {
            v37 = [NSString stringWithFormat:@"reservedNode=%@", v35];
            uint64_t v38 = (void *)MEMORY[0x263F5F638];
            v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
            uint64_t v40 = [v39 lastPathComponent];
            uint64_t v41 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager setupNodes]_block_invoke_2"];
            [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:187];

            v42 = PLLogCommon();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v125 = v37;
              _os_log_debug_impl(&dword_2267F1000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v12 = v103;
            unint64_t v13 = 0x263F5F000uLL;
            unint64_t v23 = 0x2647B4000;
          }
        }
        if (([v12 containsObject:v35] & 1) == 0)
        {
          v43 = [MEMORY[0x263F5F698] sharedCore];
          v44 = [v43 storage];
          [v44 blockingWriteEntry:v35 withCompletionBlock:&__block_literal_global_86];

          if ([*(id *)(v13 + 1600) debugEnabled])
          {
            uint64_t v45 = objc_opt_class();
            v114[0] = MEMORY[0x263EF8330];
            v114[1] = 3221225472;
            v114[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_2;
            v114[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v114[4] = v45;
            if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_87 != -1) {
              dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_87, v114);
            }
            if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_88)
            {
              v46 = [NSString stringWithFormat:@"added to DB reservedNode=%@", v35];
              v47 = (void *)MEMORY[0x263F5F638];
              v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
              v49 = [v48 lastPathComponent];
              v50 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager setupNodes]_block_invoke_3"];
              [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:192];

              v51 = PLLogCommon();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v125 = v46;
                _os_log_debug_impl(&dword_2267F1000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v12 = v103;
              unint64_t v13 = 0x263F5F000;
              unint64_t v23 = 0x2647B4000;
            }
          }
        }
        v52 = [*(id *)(a1 + 32) nodeNameToNodeID];
        v53 = [v35 name];
        [v52 setObject:v34 forKeyedSubscript:v53];

        v54 = [v35 name];
        v55 = [*(id *)(a1 + 32) nodeIDToNodeName];
        [v55 setObject:v54 forKeyedSubscript:v34];

        ++v33;
      }
      while (v32 != v33);
      uint64_t v32 = [obj countByEnumeratingWithState:&v116 objects:v126 count:16];
    }
    while (v32);
  }

  v56 = [MEMORY[0x263F5F698] sharedCore];
  v57 = [v56 storage];
  [v57 flushCachesWithReason:v102];

  v58 = [MEMORY[0x263F5F678] sharedStorageCache];
  [v58 clearLastEntryCacheForEntryKey:v102];

  v59 = (void *)[objc_alloc(MEMORY[0x263F5F690]) initWithKey:@"ID" withValue:&unk_26DA69DA8 withComparisonOperation:2];
  v60 = (void *)MEMORY[0x263EFFA08];
  v61 = [MEMORY[0x263F5F698] sharedCore];
  v62 = [v61 storage];
  v123 = v59;
  v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v123 count:1];
  v64 = [v62 entriesForKey:v102 withComparisons:v63];
  v65 = [v60 setWithArray:v64];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v66 = objc_opt_class();
    v113[0] = MEMORY[0x263EF8330];
    v113[1] = 3221225472;
    v113[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_96;
    v113[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v113[4] = v66;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_94 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_94, v113);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_95)
    {
      v67 = [NSString stringWithFormat:@"otherNodesInDB=%@", v65];
      v68 = (void *)MEMORY[0x263F5F638];
      v69 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
      v70 = [v69 lastPathComponent];
      v71 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager setupNodes]_block_invoke_2"];
      [v68 logMessage:v67 fromFile:v70 fromFunction:v71 fromLineNumber:210];

      v72 = PLLogCommon();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v73 = v65;
  uint64_t v74 = [v73 countByEnumeratingWithState:&v109 objects:v122 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v110 != v76) {
          objc_enumerationMutation(v73);
        }
        v78 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        v79 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v78, "entryID"));
        v80 = [v78 name];
        if (v80)
        {
          v81 = [*(id *)(a1 + 32) nodeNameToNodeID];
          [v81 setObject:v79 forKeyedSubscript:v80];

          v82 = [*(id *)(a1 + 32) nodeIDToNodeName];
          [v82 setObject:v80 forKeyedSubscript:v79];
        }
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v109 objects:v122 count:16];
    }
    while (v75);
  }

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v83 = objc_opt_class();
    v108[0] = MEMORY[0x263EF8330];
    v108[1] = 3221225472;
    v108[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_102;
    v108[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v108[4] = v83;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_100 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_100, v108);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_101)
    {
      v84 = NSString;
      v85 = [*(id *)(a1 + 32) nodeNameToNodeID];
      v86 = [v84 stringWithFormat:@"nodeNameToNodeID=%@", v85];

      v87 = (void *)MEMORY[0x263F5F638];
      v88 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
      v89 = [v88 lastPathComponent];
      v90 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager setupNodes]_block_invoke_2"];
      [v87 logMessage:v86 fromFile:v89 fromFunction:v90 fromLineNumber:219];

      v91 = PLLogCommon();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v92 = objc_opt_class();
    v107[0] = MEMORY[0x263EF8330];
    v107[1] = 3221225472;
    v107[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_105;
    v107[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v107[4] = v92;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_103 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_103, v107);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_104)
    {
      v93 = NSString;
      v94 = [*(id *)(a1 + 32) nodeIDToNodeName];
      v95 = [v93 stringWithFormat:@"nodeIDToNodeName=%@", v94];

      v96 = (void *)MEMORY[0x263F5F638];
      v97 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m"];
      v98 = [v97 lastPathComponent];
      v99 = [NSString stringWithUTF8String:"-[PLAccountingNodeManager setupNodes]_block_invoke_2"];
      [v96 logMessage:v95 fromFile:v98 fromFunction:v99 fromLineNumber:220];

      v100 = PLLogCommon();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_65(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_74(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_73 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_80(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_79 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_88 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_96(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_95 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_102(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_101 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_105(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_104 = result;
  return result;
}

- (void)setNodeNameToNodeID:(id)a3
{
}

- (NSMutableDictionary)nodeIDToNodeName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNodeIDToNodeName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeIDToNodeName, 0);
  objc_storeStrong((id *)&self->_nodeNameToNodeID, 0);
}

- (void)removeNodeReferenceFromCache:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2267F1000, log, OS_LOG_TYPE_DEBUG, "Removing entries from the in memory cache", v1, 2u);
}

- (void)removeNodeReferenceFromCache:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2267F1000, log, OS_LOG_TYPE_DEBUG, "Received notification to update Accounting Cache", v1, 2u);
}

void __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a2 + 40) userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:a1];
  v7 = [v6 objectForKeyedSubscript:@"MaskedName"];
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_2267F1000, a3, OS_LOG_TYPE_DEBUG, "Obfuscating the node id cache for %@ with %@", (uint8_t *)&v8, 0x16u);
}

@end