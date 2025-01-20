@interface PLAccountingPowerEventBackwardEntry
+ (id)entryKey;
+ (id)mergingDenyList;
+ (int)classDirectionality;
+ (void)load;
- (BOOL)canMergeWithEvent:(id)a3;
- (PLAccountingPowerEventBackwardEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withEndDate:(id)a5;
@end

@implementation PLAccountingPowerEventBackwardEntry

- (BOOL)canMergeWithEvent:(id)a3
{
  id v3 = a3;
  v4 = +[PLAccountingPowerEventBackwardEntry mergingDenyList];
  v5 = [v3 rootNodeID];

  LOBYTE(v3) = [v4 containsObject:v5] ^ 1;
  return (char)v3;
}

+ (id)mergingDenyList
{
  if (mergingDenyList_onceToken_0 != -1) {
    dispatch_once(&mergingDenyList_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)mergingDenyList__mergingDenyList_0;
  return v2;
}

+ (int)classDirectionality
{
  return 2;
}

+ (id)entryKey
{
  if (entryKey_onceToken_14 != -1) {
    dispatch_once(&entryKey_onceToken_14, &__block_literal_global_18);
  }
  v2 = (void *)entryKey_entryKey_14;
  return v2;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingPowerEventBackwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __47__PLAccountingPowerEventBackwardEntry_entryKey__block_invoke()
{
  entryKey_entryKey_14 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F7D8]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingPowerEventBackwardEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withEndDate:(id)a5
{
  v5 = (PLAccountingPowerEventBackwardEntry *)a5;
  if (a5)
  {
    id v8 = a3;
    v9 = +[PLAccountingRange rangeWithStartDate:0 withEndDate:v5];
    v12.receiver = self;
    v12.super_class = (Class)PLAccountingPowerEventBackwardEntry;
    v10 = [(PLAccountingPowerEventEntry *)&v12 initWithRootNodeID:v8 withPower:v9 withRange:a4];

    self = v10;
    v5 = self;
  }

  return v5;
}

void __54__PLAccountingPowerEventBackwardEntry_mergingDenyList__block_invoke()
{
  v0 = (void *)mergingDenyList__mergingDenyList_0;
  mergingDenyList__mergingDenyList_0 = (uint64_t)&unk_26DA69FB8;
}

@end