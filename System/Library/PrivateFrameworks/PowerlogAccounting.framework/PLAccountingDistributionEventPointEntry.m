@interface PLAccountingDistributionEventPointEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (PLAccountingDistributionEventPointEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5;
@end

@implementation PLAccountingDistributionEventPointEntry

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionEventPointEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken_8 != -1) {
    dispatch_once(&entryKey_onceToken_8, &__block_literal_global_10);
  }
  objc_super v2 = (void *)entryKey_entryKey_8;
  return v2;
}

uint64_t __51__PLAccountingDistributionEventPointEntry_entryKey__block_invoke()
{
  entryKey_entryKey_8 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F7B0]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingDistributionEventPointEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5
{
  v5 = (PLAccountingDistributionEventPointEntry *)a5;
  if (a5)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = +[PLAccountingRange rangeWithStartDate:v5 withEndDate:v5];
    v13.receiver = self;
    v13.super_class = (Class)PLAccountingDistributionEventPointEntry;
    v11 = [(PLAccountingDistributionEventEntry *)&v13 initWithDistributionID:v9 withChildNodeNameToWeight:v8 withRange:v10];

    self = v11;
    v5 = self;
  }

  return v5;
}

+ (int)classDirectionality
{
  return 4;
}

@end