@interface PLAccountingNodeEntry
+ (id)entryKey;
+ (void)load;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (PLAccountingNodeEntry)initWithName:(id)a3;
- (PLAccountingNodeEntry)initWithRootNodeID:(id)a3;
- (id)initEntryWithRawData:(id)a3;
@end

@implementation PLAccountingNodeEntry

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingNodeEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken != -1) {
    dispatch_once(&entryKey_onceToken, &__block_literal_global_0);
  }
  objc_super v2 = (void *)entryKey_entryKey;
  return v2;
}

uint64_t __33__PLAccountingNodeEntry_entryKey__block_invoke()
{
  entryKey_entryKey = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8B0] andName:*MEMORY[0x263F5F780]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingNodeEntry)initWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(id)objc_opt_class() entryKey];
    v9.receiver = self;
    v9.super_class = (Class)PLAccountingNodeEntry;
    v6 = [(PLEntry *)&v9 initWithEntryKey:v5];

    if (v6) {
      [(PLEntry *)v6 setObject:v4 forKeyedSubscript:*MEMORY[0x263F5F790]];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PLAccountingNodeEntry)initWithRootNodeID:(id)a3
{
  unsigned int v4 = [a3 intValue];
  unsigned int v5 = v4;
  if (v4 == 1)
  {
    v6 = @"__GLOBAL__";
  }
  else if (v4 - 1 > 0x3D)
  {
    if (v4 != 10000)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v6 = @"RootNodeMaxCount";
  }
  else
  {
    v6 = [&unk_26DA69E98 objectAtIndexedSubscript:v4];
  }
  v7 = [(PLAccountingNodeEntry *)self initWithName:v6];
  [(PLEntry *)v7 setEntryID:v5];
  self = v7;

  v8 = self;
LABEL_8:

  return v8;
}

- (id)initEntryWithRawData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(id)objc_opt_class() entryKey];
  v8.receiver = self;
  v8.super_class = (Class)PLAccountingNodeEntry;
  v6 = [(PLEntry *)&v8 initWithEntryKey:v5 withRawData:v4];

  return v6;
}

- (NSString)name
{
  return (NSString *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F790]];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __33__PLAccountingNodeEntry_isEqual___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v5;
    if (isEqual__defaultOnce != -1) {
      dispatch_once(&isEqual__defaultOnce, &block);
    }
    if (isEqual__classDebugEnabled)
    {
      v6 = NSString;
      uint64_t v7 = [v4 entryID];
      int64_t v8 = [(PLEntry *)self entryID];
      objc_super v9 = [v6 stringWithFormat:@"self=%@, other=%@, result=%i", self, v4, v7 == v8, block, v19, v20, v21, v22];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingNodeEntry.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingNodeEntry isEqual:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:77];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:]((uint64_t)v9, v14);
      }
    }
  }
  uint64_t v15 = [v4 entryID];
  BOOL v16 = v15 == [(PLEntry *)self entryID];

  return v16;
}

uint64_t __33__PLAccountingNodeEntry_isEqual___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  isEqual__classDebugEnabled = result;
  return result;
}

@end