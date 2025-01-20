@interface PLAccountingDistributionEventIntervalEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (PLAccountingDistributionEventIntervalEntry)initWithDistributionID:(id)a3 withChildNodeIDToWeight:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6;
- (PLAccountingDistributionEventIntervalEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6;
@end

@implementation PLAccountingDistributionEventIntervalEntry

+ (int)classDirectionality
{
  return 3;
}

+ (id)entryKey
{
  if (entryKey_onceToken_12 != -1) {
    dispatch_once(&entryKey_onceToken_12, &__block_literal_global_15);
  }
  v2 = (void *)entryKey_entryKey_12;
  return v2;
}

- (PLAccountingDistributionEventIntervalEntry)initWithDistributionID:(id)a3 withChildNodeIDToWeight:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  v7 = 0;
  if (a5 && a6)
  {
    id v11 = a4;
    id v12 = a3;
    v13 = +[PLAccountingRange rangeWithStartDate:a5 withEndDate:a6];
    v16.receiver = self;
    v16.super_class = (Class)PLAccountingDistributionEventIntervalEntry;
    v14 = [(PLAccountingDistributionEventEntry *)&v16 initWithDistributionID:v12 withChildNodeIDToWeight:v11 withRange:v13];

    self = v14;
    v7 = self;
  }

  return v7;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionEventIntervalEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __54__PLAccountingDistributionEventIntervalEntry_entryKey__block_invoke()
{
  entryKey_entryKey_12 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8A8] andName:*MEMORY[0x263F5F7B0]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingDistributionEventIntervalEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  v7 = 0;
  if (a5 && a6)
  {
    id v11 = a4;
    id v12 = a3;
    v13 = +[PLAccountingRange rangeWithStartDate:a5 withEndDate:a6];
    v16.receiver = self;
    v16.super_class = (Class)PLAccountingDistributionEventIntervalEntry;
    v14 = [(PLAccountingDistributionEventEntry *)&v16 initWithDistributionID:v12 withChildNodeNameToWeight:v11 withRange:v13];

    self = v14;
    v7 = self;
  }

  return v7;
}

@end