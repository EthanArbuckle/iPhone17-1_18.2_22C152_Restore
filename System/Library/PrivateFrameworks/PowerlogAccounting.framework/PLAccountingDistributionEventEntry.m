@interface PLAccountingDistributionEventEntry
+ (id)mergingDenyList;
+ (void)load;
- (BOOL)_distributeRangeWeightedTotal;
- (BOOL)canMergeWithEvent:(id)a3;
- (BOOL)distributeRangeWeightedTotal;
- (BOOL)isEmptyEvent;
- (BOOL)isEqualContentsWithEvent:(id)a3;
- (NSDictionary)childNodeIDToWeight;
- (NSDictionary)childNodeNameToWeight;
- (NSNumber)distributionID;
- (PLAccountingDistributionEventEntry)initWithDistributionID:(id)a3 withChildNodeIDToWeight:(id)a4 withRange:(id)a5;
- (PLAccountingDistributionEventEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withRange:(id)a5;
- (id)subEntryKey;
- (int)instanceDirectionality;
- (void)set_distributeRangeWeightedTotal:(BOOL)a3;
@end

@implementation PLAccountingDistributionEventEntry

- (void).cxx_destruct
{
}

- (BOOL)distributeRangeWeightedTotal
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->__distributeRangeWeightedTotal) {
    return 1;
  }
  self->__distributeRangeWeightedTotal = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [&unk_26DA69E08 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&unk_26DA69E08);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9 = [(PLAccountingDistributionEventEntry *)self distributionID];
        LODWORD(v8) = [v9 isEqualToNumber:v8];

        if (v8) {
          self->__distributeRangeWeightedTotal = 1;
        }
      }
      uint64_t v5 = [&unk_26DA69E08 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return self->__distributeRangeWeightedTotal;
}

- (NSNumber)distributionID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F7C0]];
}

- (PLAccountingDistributionEventEntry)initWithDistributionID:(id)a3 withChildNodeIDToWeight:(id)a4 withRange:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((int)[v8 intValue] < 1)
  {
    long long v13 = 0;
    goto LABEL_23;
  }
  long long v11 = +[PLAccountingEngine allDistributionIDs];
  int v12 = [v11 containsObject:v8];

  long long v13 = 0;
  if (v9 && v12)
  {
    v46.receiver = self;
    v46.super_class = (Class)PLAccountingDistributionEventEntry;
    v14 = [(PLAccountingEventEntry *)&v46 initWithRange:v10];
    self = v14;
    if (v14)
    {
      [(PLEntry *)v14 setObject:v8 forKeyedSubscript:*MEMORY[0x263F5F7C0]];
      int v15 = [(PLAccountingDistributionEventEntry *)self instanceDirectionality];
      v41 = self;
      int v16 = [(id)objc_opt_class() classDirectionality];
      if (v15 != v16 && v16 != 3)
      {
        v17 = [NSString stringWithFormat:@"ERROR: Directionality mismatch for distributionID=%@", v8];
        v18 = (void *)MEMORY[0x263F5F638];
        v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Distribution/PLAccountingDistributionEventEntry.m"];
        v20 = [v19 lastPathComponent];
        v21 = [NSString stringWithUTF8String:"-[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:54];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:]((uint64_t)v17, v22);
        }

        long long v13 = 0;
        goto LABEL_23;
      }
      id v39 = v10;
      v23 = (NSDictionary *)[v9 mutableCopy];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v40 = v9;
      id v24 = v9;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v43;
        uint64_t v28 = *MEMORY[0x263F5F7B8];
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v43 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            v31 = [v24 objectForKeyedSubscript:v30];
            [v31 doubleValue];
            if (v32 >= 0.005)
            {
              v33 = NSNumber;
              [v31 doubleValue];
              v35 = [v33 numberWithLong:llround(v34 * 100.0)];
              uint64_t v47 = v28;
              uint64_t v48 = v30;
              v36 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
              [(PLEntry *)v41 setObject:v35 forKeyedSubscript:v36];
            }
            else
            {
              [(NSDictionary *)v23 removeObjectForKey:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v49 count:16];
        }
        while (v26);
      }

      self = v41;
      childNodeIDToWeight = v41->_childNodeIDToWeight;
      v41->_childNodeIDToWeight = v23;

      id v9 = v40;
      id v10 = v39;
    }
    self = self;
    long long v13 = self;
  }
LABEL_23:

  return v13;
}

- (id)subEntryKey
{
  return [(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F7C0]];
}

- (BOOL)canMergeWithEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PLAccountingDistributionEventEntry mergingDenyList];
  uint64_t v5 = [v3 distributionID];

  LOBYTE(v3) = [v4 containsObject:v5] ^ 1;
  return (char)v3;
}

+ (id)mergingDenyList
{
  if (mergingDenyList_onceToken != -1) {
    dispatch_once(&mergingDenyList_onceToken, &__block_literal_global);
  }
  v2 = (void *)mergingDenyList__mergingDenyList;
  return v2;
}

- (BOOL)isEqualContentsWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAccountingDistributionEventEntry *)self childNodeIDToWeight];
  uint64_t v6 = [v4 childNodeIDToWeight];

  LOBYTE(v4) = [v5 isEqualToDictionary:v6];
  return (char)v4;
}

- (NSDictionary)childNodeIDToWeight
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!self->_childNodeIDToWeight && [(PLEntry *)self existsInDB])
  {
    [(PLEntry *)self loadDynamicKeys];
    uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
    id v3 = (void *)MEMORY[0x263EFFA08];
    id v4 = (void *)MEMORY[0x263F5F650];
    uint64_t v5 = [(PLEntry *)self entryKey];
    uint64_t v6 = [v4 keyConfigsForEntryKey:v5];
    v7 = [v6 allKeys];
    id v8 = [v3 setWithArray:v7];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = [(PLEntry *)self keys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      uint64_t v25 = *MEMORY[0x263F5F7B8];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (([v8 containsObject:v14] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = [v14 objectForKeyedSubscript:v25];
            }
            else
            {
              id v15 = v14;
            }
            int v16 = v15;
            v17 = [(PLEntry *)self objectForKeyedSubscript:v14];

            if (v17)
            {
              v18 = NSNumber;
              v19 = [(PLEntry *)self objectForKeyedSubscript:v14];
              [v19 doubleValue];
              v21 = [v18 numberWithDouble:v20 / 100.0];
              [(NSDictionary *)v26 setObject:v21 forKeyedSubscript:v16];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    childNodeIDToWeight = self->_childNodeIDToWeight;
    self->_childNodeIDToWeight = v26;
  }
  v23 = self->_childNodeIDToWeight;
  return v23;
}

- (int)instanceDirectionality
{
  v2 = [(PLAccountingDistributionEventEntry *)self distributionID];
  id v3 = objc_msgSend(&unk_26DA69DF0, "objectAtIndexedSubscript:", (int)objc_msgSend(v2, "intValue"));
  int v4 = [v3 intValue];

  return v4;
}

- (PLAccountingDistributionEventEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withRange:(id)a5
{
  id v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v10 allValues];
  long long v13 = +[PLAccountingNodeManager sharedInstance];
  v14 = [v10 allKeys];

  id v15 = [v13 childNodeIDsFromChildNodeNames:v14];
  int v16 = [v8 dictionaryWithObjects:v12 forKeys:v15];

  v17 = [(PLAccountingDistributionEventEntry *)self initWithDistributionID:v11 withChildNodeIDToWeight:v16 withRange:v9];
  return v17;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSDictionary)childNodeNameToWeight
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v4 = [(PLAccountingDistributionEventEntry *)self childNodeIDToWeight];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = +[PLAccountingNodeManager sharedInstance];
        id v11 = [v10 nodeNameForNodeID:v9];

        if (v11)
        {
          uint64_t v12 = [(PLAccountingDistributionEventEntry *)self childNodeIDToWeight];
          long long v13 = [v12 objectForKeyedSubscript:v9];
          [v3 setObject:v13 forKeyedSubscript:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

void __53__PLAccountingDistributionEventEntry_mergingDenyList__block_invoke()
{
  v0 = (void *)mergingDenyList__mergingDenyList;
  mergingDenyList__mergingDenyList = (uint64_t)&unk_26DA69E20;
}

- (BOOL)isEmptyEvent
{
  objc_super v2 = [(PLAccountingDistributionEventEntry *)self childNodeIDToWeight];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)_distributeRangeWeightedTotal
{
  return self->__distributeRangeWeightedTotal;
}

- (void)set_distributeRangeWeightedTotal:(BOOL)a3
{
  self->__distributeRangeWeightedTotal = a3;
}

- (void)initWithDistributionID:(uint64_t)a1 withChildNodeIDToWeight:(NSObject *)a2 withRange:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2267F1000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end