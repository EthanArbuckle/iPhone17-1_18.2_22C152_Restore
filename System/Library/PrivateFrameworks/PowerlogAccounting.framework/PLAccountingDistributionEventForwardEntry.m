@interface PLAccountingDistributionEventForwardEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (PLAccountingDistributionEventForwardEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5;
@end

@implementation PLAccountingDistributionEventForwardEntry

+ (int)classDirectionality
{
  return 1;
}

+ (id)entryKey
{
  if (entryKey_onceToken_7 != -1) {
    dispatch_once(&entryKey_onceToken_7, &__block_literal_global_9);
  }
  v2 = (void *)entryKey_entryKey_7;
  return v2;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionEventForwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __53__PLAccountingDistributionEventForwardEntry_entryKey__block_invoke()
{
  entryKey_entryKey_7 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F7B0]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingDistributionEventForwardEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5
{
  v5 = (PLAccountingDistributionEventForwardEntry *)a5;
  if (a5)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = +[PLAccountingRange rangeWithStartDate:v5 withEndDate:0];
    v13.receiver = self;
    v13.super_class = (Class)PLAccountingDistributionEventForwardEntry;
    v11 = [(PLAccountingDistributionEventEntry *)&v13 initWithDistributionID:v9 withChildNodeNameToWeight:v8 withRange:v10];

    self = v11;
    v5 = self;
  }

  return v5;
}

@end