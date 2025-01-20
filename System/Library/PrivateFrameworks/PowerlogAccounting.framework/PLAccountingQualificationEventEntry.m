@interface PLAccountingQualificationEventEntry
+ (void)load;
- (BOOL)isEmptyEvent;
- (BOOL)isEqualContentsWithEvent:(id)a3;
- (NSNumber)qualificationID;
- (NSSet)childNodeIDs;
- (NSSet)childNodeNames;
- (PLAccountingQualificationEventEntry)initWithQualificationID:(id)a3 withChildNodeIDs:(id)a4 withRange:(id)a5;
- (PLAccountingQualificationEventEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withRange:(id)a5;
- (id)subEntryKey;
- (int)instanceDirectionality;
@end

@implementation PLAccountingQualificationEventEntry

- (void).cxx_destruct
{
}

- (PLAccountingQualificationEventEntry)initWithQualificationID:(id)a3 withChildNodeIDs:(id)a4 withRange:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((int)[v8 intValue] < 1)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_20;
  }
  v11 = +[PLAccountingEngine allQualificationIDs];
  int v12 = [v11 containsObject:v8];

  v13 = 0;
  if (v9 && v12)
  {
    v37.receiver = self;
    v37.super_class = (Class)PLAccountingQualificationEventEntry;
    v14 = [(PLAccountingEventEntry *)&v37 initWithRange:v10];
    self = v14;
    if (v14)
    {
      [(PLEntry *)v14 setObject:v8 forKeyedSubscript:*MEMORY[0x263F5F808]];
      int v15 = [(PLAccountingQualificationEventEntry *)self instanceDirectionality];
      int v16 = [(id)objc_opt_class() classDirectionality];
      if (v15 != v16 && v16 != 3)
      {
        v17 = [NSString stringWithFormat:@"ERROR: Directionality mismatch for qualificationID=%@", v8];
        v18 = (void *)MEMORY[0x263F5F638];
        v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Qualification/PLAccountingQualificationEventEntry.m"];
        v20 = [v19 lastPathComponent];
        v21 = [NSString stringWithUTF8String:"-[PLAccountingQualificationEventEntry initWithQualificationID:withChildNodeIDs:withRange:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:45];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:]((uint64_t)v17, v22);
        }

        goto LABEL_10;
      }
      id v32 = v9;
      objc_storeStrong((id *)&self->_childNodeIDs, a4);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v23 = self->_childNodeIDs;
      uint64_t v24 = [(NSSet *)v23 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v34;
        uint64_t v27 = *MEMORY[0x263F5F7F8];
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v29 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v38 = v27;
            uint64_t v39 = v29;
            v30 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
            [(PLEntry *)self setObject:&unk_26DA69778 forKeyedSubscript:v30];
          }
          uint64_t v25 = [(NSSet *)v23 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }
        while (v25);
      }

      id v9 = v32;
    }
    self = self;
    v13 = self;
  }
LABEL_20:

  return v13;
}

- (id)subEntryKey
{
  return [(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F808]];
}

- (BOOL)isEqualContentsWithEvent:(id)a3
{
  id v4 = a3;
  v5 = [(PLAccountingQualificationEventEntry *)self childNodeIDs];
  v6 = [v4 childNodeIDs];

  LOBYTE(v4) = [v5 isEqualToSet:v6];
  return (char)v4;
}

- (NSSet)childNodeIDs
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!self->_childNodeIDs && [(PLEntry *)self existsInDB])
  {
    [(PLEntry *)self loadDynamicKeys];
    v3 = [MEMORY[0x263EFF9C0] set];
    id v4 = (void *)MEMORY[0x263EFFA08];
    v5 = (void *)MEMORY[0x263F5F650];
    v6 = [(PLEntry *)self entryKey];
    v7 = [v5 keyConfigsForEntryKey:v6];
    id v8 = [v7 allKeys];
    id v9 = [v4 setWithArray:v8];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = [(PLEntry *)self keys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      uint64_t v14 = *MEMORY[0x263F5F7F8];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          int v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (([v9 containsObject:v16] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = [v16 objectForKeyedSubscript:v14];
            }
            else
            {
              id v17 = v16;
            }
            v18 = v17;
            if (v17) {
              [(NSSet *)v3 addObject:v17];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    childNodeIDs = self->_childNodeIDs;
    self->_childNodeIDs = v3;
  }
  v20 = self->_childNodeIDs;
  return v20;
}

- (int)instanceDirectionality
{
  v2 = [(PLAccountingQualificationEventEntry *)self qualificationID];
  v3 = objc_msgSend(&unk_26DA69E38, "objectAtIndexedSubscript:", (int)objc_msgSend(v2, "intValue"));
  int v4 = [v3 intValue];

  return v4;
}

- (NSNumber)qualificationID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F808]];
}

- (PLAccountingQualificationEventEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withRange:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = +[PLAccountingNodeManager sharedInstance];
  uint64_t v13 = [v10 allObjects];

  uint64_t v14 = [v12 childNodeIDsFromChildNodeNames:v13];
  int v15 = [v8 setWithArray:v14];

  int v16 = [(PLAccountingQualificationEventEntry *)self initWithQualificationID:v11 withChildNodeIDs:v15 withRange:v9];
  return v16;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingQualificationEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSSet)childNodeNames
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = [(PLAccountingQualificationEventEntry *)self childNodeIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = +[PLAccountingNodeManager sharedInstance];
        id v11 = [v10 nodeNameForNodeID:v9];

        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (BOOL)isEmptyEvent
{
  objc_super v2 = [(PLAccountingQualificationEventEntry *)self childNodeIDs];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

@end