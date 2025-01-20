@interface PLAccountingPowerEventIntervalEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (BOOL)canMergeWithEvent:(id)a3;
- (PLAccountingPowerEventIntervalEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withStartDate:(id)a5 withEndDate:(id)a6;
@end

@implementation PLAccountingPowerEventIntervalEntry

+ (int)classDirectionality
{
  return 3;
}

+ (id)entryKey
{
  if (entryKey_onceToken_3 != -1) {
    dispatch_once(&entryKey_onceToken_3, &__block_literal_global_5);
  }
  v2 = (void *)entryKey_entryKey_3;
  return v2;
}

- (BOOL)canMergeWithEvent:(id)a3
{
  id v4 = a3;
  v5 = [(PLAccountingEventEntry *)self range];
  v6 = [v5 endDate];
  v7 = [v4 range];
  v8 = [v7 startDate];
  [v6 timeIntervalSinceDate:v8];
  v34 = v4;
  if (v9 <= -1.0)
  {
    BOOL v15 = 0;
  }
  else
  {
    v10 = [v4 range];
    v11 = [v10 endDate];
    v12 = [(PLAccountingEventEntry *)self range];
    v13 = [v12 startDate];
    [v11 timeIntervalSinceDate:v13];
    BOOL v15 = v14 > -1.0;
  }
  v16 = [(PLAccountingPowerEventEntry *)self rootNodeID];
  int v17 = [v16 intValue];

  if (v17 == 54)
  {
    v18 = [(PLAccountingEventEntry *)self range];
    [v18 length];
    double v20 = v19;
    v21 = v34;
    v22 = [v34 range];
    [v22 length];
    double v24 = v20 + v23;

    double v25 = 1800.0;
    goto LABEL_6;
  }
  v26 = [(PLAccountingPowerEventEntry *)self rootNodeID];
  if ([v26 intValue] != 56 || !objc_msgSend(MEMORY[0x263F5F668], "hasAOD"))
  {

    v21 = v34;
    goto LABEL_14;
  }
  int v27 = _os_feature_enabled_impl();

  v21 = v34;
  if (v27)
  {
    v28 = [(PLAccountingEventEntry *)self range];
    [v28 length];
    double v30 = v29;
    v31 = [v34 range];
    [v31 length];
    double v24 = v30 + v32;

    double v25 = 60.0;
LABEL_6:
    if (v24 >= v25) {
      BOOL v15 = 0;
    }
  }
LABEL_14:

  return v15;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingPowerEventIntervalEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __47__PLAccountingPowerEventIntervalEntry_entryKey__block_invoke()
{
  entryKey_entryKey_3 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8A8] andName:*MEMORY[0x263F5F7D8]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingPowerEventIntervalEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  v7 = 0;
  if (a5 && a6)
  {
    id v11 = a3;
    v12 = +[PLAccountingRange rangeWithStartDate:a5 withEndDate:a6];
    v15.receiver = self;
    v15.super_class = (Class)PLAccountingPowerEventIntervalEntry;
    v13 = [(PLAccountingPowerEventEntry *)&v15 initWithRootNodeID:v11 withPower:v12 withRange:a4];

    self = v13;
    v7 = self;
  }

  return v7;
}

@end