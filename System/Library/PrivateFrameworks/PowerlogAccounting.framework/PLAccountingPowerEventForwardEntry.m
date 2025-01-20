@interface PLAccountingPowerEventForwardEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (BOOL)canMergeWithEvent:(id)a3;
- (PLAccountingPowerEventForwardEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withStartDate:(id)a5;
@end

@implementation PLAccountingPowerEventForwardEntry

+ (id)entryKey
{
  if (entryKey_onceToken_13 != -1) {
    dispatch_once(&entryKey_onceToken_13, &__block_literal_global_16);
  }
  v2 = (void *)entryKey_entryKey_13;
  return v2;
}

+ (int)classDirectionality
{
  return 1;
}

- (BOOL)canMergeWithEvent:(id)a3
{
  return 0;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingPowerEventForwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __46__PLAccountingPowerEventForwardEntry_entryKey__block_invoke()
{
  entryKey_entryKey_13 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F7D8]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingPowerEventForwardEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withStartDate:(id)a5
{
  v5 = (PLAccountingPowerEventForwardEntry *)a5;
  if (a5)
  {
    id v8 = a3;
    v9 = +[PLAccountingRange rangeWithStartDate:v5 withEndDate:0];
    v12.receiver = self;
    v12.super_class = (Class)PLAccountingPowerEventForwardEntry;
    v10 = [(PLAccountingPowerEventEntry *)&v12 initWithRootNodeID:v8 withPower:v9 withRange:a4];

    self = v10;
    v5 = self;
  }

  return v5;
}

@end