@interface PLAccountingEnergyEventEntry
+ (id)entryKey;
+ (void)load;
- (NSNumber)nodeID;
- (PLAccountingEnergyEventEntry)initWithNodeID:(id)a3 withEnergy:(double)a4 withRange:(id)a5 withEntryDate:(id)a6;
- (PLAccountingRange)range;
- (double)energy;
@end

@implementation PLAccountingEnergyEventEntry

- (NSNumber)nodeID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F720]];
}

- (PLAccountingRange)range
{
  v2 = self;
  objc_sync_enter(v2);
  range = v2->_range;
  if (!range)
  {
    v4 = [(PLEntry *)v2 objectForKeyedSubscript:*MEMORY[0x263F5F750]];
    [v4 doubleValue];
    double v6 = v5;

    v7 = [(PLEntry *)v2 objectForKeyedSubscript:*MEMORY[0x263F5F710]];
    [v7 doubleValue];
    double v9 = v8;

    v10 = [(PLEntry *)v2 entryDate];
    v11 = [v10 dateByAddingTimeInterval:v6 / 1000.0];
    v12 = [(PLEntry *)v2 entryDate];
    v13 = [v12 dateByAddingTimeInterval:v9 / 1000.0];
    uint64_t v14 = +[PLAccountingRange rangeWithStartDate:v11 withEndDate:v13];
    v15 = v2->_range;
    v2->_range = (PLAccountingRange *)v14;

    range = v2->_range;
  }
  v16 = range;
  objc_sync_exit(v2);

  return v16;
}

- (PLAccountingEnergyEventEntry)initWithNodeID:(id)a3 withEnergy:(double)a4 withRange:(id)a5 withEntryDate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = [v10 intValue];
  uint64_t v14 = 0;
  if (v11 && v13 >= 1)
  {
    v15 = [(id)objc_opt_class() entryKey];
    if (v12)
    {
      v31.receiver = self;
      v31.super_class = (Class)PLAccountingEnergyEventEntry;
      v16 = [(PLEntry *)&v31 initWithEntryKey:v15 withDate:v12];
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)PLAccountingEnergyEventEntry;
      v16 = [(PLEntry *)&v30 initWithEntryKey:v15];
    }
    p_isa = (id *)&v16->super.super.isa;

    if (p_isa)
    {
      objc_storeStrong(p_isa + 8, a5);
      [p_isa setObject:v10 forKeyedSubscript:*MEMORY[0x263F5F720]];
      v18 = [NSNumber numberWithLong:llround(a4 * 1000.0)];
      [p_isa setObject:v18 forKeyedSubscript:*MEMORY[0x263F5F718]];

      v19 = NSNumber;
      v20 = [v11 startDate];
      v21 = [p_isa entryDate];
      [v20 timeIntervalSinceDate:v21];
      v23 = [v19 numberWithDouble:v22 * 1000.0];
      [p_isa setObject:v23 forKeyedSubscript:*MEMORY[0x263F5F750]];

      v24 = NSNumber;
      v25 = [v11 endDate];
      v26 = [p_isa entryDate];
      [v25 timeIntervalSinceDate:v26];
      v28 = [v24 numberWithDouble:v27 * 1000.0];
      [p_isa setObject:v28 forKeyedSubscript:*MEMORY[0x263F5F710]];
    }
    self = p_isa;
    uint64_t v14 = self;
  }

  return v14;
}

- (double)energy
{
  v2 = [(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F718]];
  [v2 doubleValue];
  double v4 = v3 / 1000.0;

  return v4;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingEnergyEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken_5 != -1) {
    dispatch_once(&entryKey_onceToken_5, &__block_literal_global_7);
  }
  objc_super v2 = (void *)entryKey_entryKey_5;
  return v2;
}

uint64_t __40__PLAccountingEnergyEventEntry_entryKey__block_invoke()
{
  entryKey_entryKey_5 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8A8] andName:*MEMORY[0x263F5F6E8]];
  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
}

@end