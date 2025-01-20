@interface PLAccountingDistributionEventBackwardEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (PLAccountingDistributionEventBackwardEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withEndDate:(id)a5;
@end

@implementation PLAccountingDistributionEventBackwardEntry

+ (int)classDirectionality
{
  return 2;
}

+ (id)entryKey
{
  if (entryKey_onceToken_0 != -1) {
    dispatch_once(&entryKey_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)entryKey_entryKey_0;
  return v2;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionEventBackwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __54__PLAccountingDistributionEventBackwardEntry_entryKey__block_invoke()
{
  entryKey_entryKey_0 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F7B0]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingDistributionEventBackwardEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withEndDate:(id)a5
{
  v5 = (PLAccountingDistributionEventBackwardEntry *)a5;
  if (a5)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = +[PLAccountingRange rangeWithStartDate:0 withEndDate:v5];
    v13.receiver = self;
    v13.super_class = (Class)PLAccountingDistributionEventBackwardEntry;
    v11 = [(PLAccountingDistributionEventEntry *)&v13 initWithDistributionID:v9 withChildNodeNameToWeight:v8 withRange:v10];

    self = v11;
    v5 = self;
  }

  return v5;
}

@end