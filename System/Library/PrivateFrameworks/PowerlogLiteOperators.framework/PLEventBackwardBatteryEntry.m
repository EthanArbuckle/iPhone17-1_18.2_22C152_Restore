@interface PLEventBackwardBatteryEntry
+ (id)entryKey;
+ (void)load;
+ (void)populateCellWOMForEntry:(id)a3 withRawData:(id)a4;
+ (void)populateDODForEntry:(id)a3 withRawData:(id)a4;
+ (void)populateQmaxForEntry:(id)a3 withRawData:(id)a4;
+ (void)populatewRaForEntry:(id)a3 withRawData:(id)a4;
- (id)absoluteLevelWithRawData:(id)a3;
- (id)initEntryWithRawData:(id)a3;
- (id)levelWithRawData:(id)a3;
- (id)rawLevelWithRawData:(id)a3;
- (void)dealloc;
- (void)populateAdapterPowerTierWithRawData:(id)a3;
- (void)populatePresentDODFromRawData:(id)a3;
- (void)populateTLCCounterWithRawData:(id)a3;
@end

@implementation PLEventBackwardBatteryEntry

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PLEventBackwardBatteryEntry;
  [(PLEventBackwardBatteryEntry *)&v2 dealloc];
}

- (id)initEntryWithRawData:(id)a3
{
  id v4 = a3;
  v5 = +[PLEventBackwardBatteryEntry entryKey];
  v15.receiver = self;
  v15.super_class = (Class)PLEventBackwardBatteryEntry;
  v6 = [(PLEntry *)&v15 initWithEntryKey:v5 withRawData:v4];

  if (v6)
  {
    [(id)objc_opt_class() populateQmaxForEntry:v6 withRawData:v4];
    [(id)objc_opt_class() populateDODForEntry:v6 withRawData:v4];
    [(id)objc_opt_class() populateCellVoltageForEntry:v6 withRawData:v4];
    [(id)objc_opt_class() populatewRaForEntry:v6 withRawData:v4];
    [(PLEventBackwardBatteryEntry *)v6 populatePresentDODFromRawData:v4];
    v7 = NSNumber;
    v8 = [v4 objectForKeyedSubscript:@"Temperature"];
    [v8 doubleValue];
    v10 = [v7 numberWithDouble:v9 / 100.0];
    [(PLEntry *)v6 setObject:v10 forKeyedSubscript:@"Temperature"];

    v11 = [(PLEventBackwardBatteryEntry *)v6 levelWithRawData:v4];
    [(PLEntry *)v6 setObject:v11 forKeyedSubscript:@"Level"];

    v12 = [(PLEventBackwardBatteryEntry *)v6 rawLevelWithRawData:v4];
    [(PLEntry *)v6 setObject:v12 forKeyedSubscript:@"RawLevel"];

    v13 = [(PLEventBackwardBatteryEntry *)v6 absoluteLevelWithRawData:v4];
    [(PLEntry *)v6 setObject:v13 forKeyedSubscript:@"AbsoluteLevel"];

    [(PLEventBackwardBatteryEntry *)v6 populateTLCCounterWithRawData:v4];
    [(PLEventBackwardBatteryEntry *)v6 populateAdapterPowerTierWithRawData:v4];
  }

  return v6;
}

+ (id)entryKey
{
  return +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];
}

- (id)rawLevelWithRawData:(id)a3
{
  id v4 = NSNumber;
  v5 = [(PLEntry *)self objectForKeyedSubscript:@"AppleRawCurrentCapacity"];
  [v5 doubleValue];
  double v7 = v6 * 100.0;
  v8 = [(PLEntry *)self objectForKeyedSubscript:@"AppleRawMaxCapacity"];
  [v8 doubleValue];
  v10 = [v4 numberWithDouble:v7 / v9];

  return v10;
}

- (void)populateTLCCounterWithRawData:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"ChargerData"];
  if (v4)
  {
    id v6 = v4;
    v5 = [v4 objectForKeyedSubscript:@"TimeChargingThermallyLimited"];
    [(PLEntry *)self setObject:v5 forKeyedSubscript:@"TimeChargingThermallyLimited"];

    id v4 = v6;
  }
}

- (void)populatePresentDODFromRawData:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"BatteryData"];
  id v6 = [v4 objectForKeyedSubscript:@"PresentDOD"];

  v5 = [v6 objectAtIndexedSubscript:0];
  [(PLEntry *)self setObject:v5 forKeyedSubscript:@"PresentDOD"];
}

- (void)populateAdapterPowerTierWithRawData:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"AdapterDetails"];
  if (v4)
  {
    id v6 = v4;
    v5 = [v4 objectForKeyedSubscript:@"AdapterPowerTier"];
    [(PLEntry *)self setObject:v5 forKeyedSubscript:@"AdapterPowerTier"];

    id v4 = v6;
  }
}

- (id)levelWithRawData:(id)a3
{
  id v4 = NSNumber;
  v5 = [(PLEntry *)self objectForKeyedSubscript:@"CurrentCapacity"];
  [v5 doubleValue];
  double v7 = v6 * 100.0;
  v8 = [(PLEntry *)self objectForKeyedSubscript:@"MaxCapacity"];
  [v8 doubleValue];
  v10 = [v4 numberWithDouble:v7 / v9];

  return v10;
}

- (id)absoluteLevelWithRawData:(id)a3
{
  id v4 = NSNumber;
  v5 = [(PLEntry *)self objectForKeyedSubscript:@"AbsoluteCapacity"];
  [v5 doubleValue];
  double v7 = v6 * 100.0;
  v8 = [(PLEntry *)self objectForKeyedSubscript:@"QmaxCell0"];
  [v8 doubleValue];
  v10 = [v4 numberWithDouble:v7 / v9];

  return v10;
}

+ (void)populatewRaForEntry:(id)a3 withRawData:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [a4 objectForKeyedSubscript:@"BatteryData"];
  double v7 = [v6 objectForKeyedSubscript:@"WeightedRa"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 firstObject];
    [v5 setObject:v8 forKeyedSubscript:@"WeightedRa"];

    if ((unint64_t)[v7 count] >= 2)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __63__PLEventBackwardBatteryEntry_populatewRaForEntry_withRawData___block_invoke;
      v11[3] = &unk_1E69306B0;
      id v12 = v5;
      [v7 enumerateObjectsUsingBlock:v11];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 setObject:v7 forKeyedSubscript:@"WeightedRa"];
    }
    else
    {
      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [(id)objc_opt_class() className];
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_error_impl(&dword_1D2690000, v9, OS_LOG_TYPE_ERROR, "unknown wRa format: %@", buf, 0xCu);
      }
    }
  }
}

+ (void)populateDODForEntry:(id)a3 withRawData:(id)a4
{
  id v10 = a3;
  id v5 = [a4 objectForKeyedSubscript:@"BatteryData"];
  double v6 = [v5 objectForKeyedSubscript:@"DOD0"];

  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [v6 objectAtIndexedSubscript:v7];
      double v9 = objc_msgSend(NSString, "stringWithFormat:", @"DOD%d", v7);
      [v10 setObject:v8 forKeyedSubscript:v9];

      ++v7;
    }
    while ([v6 count] > v7);
  }
}

void __64__PLEventBackwardBatteryEntry_populateQmaxForEntry_withRawData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"QmaxCell%d", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

+ (void)populateQmaxForEntry:(id)a3 withRawData:(id)a4
{
  id v5 = a3;
  if (v5 && a4)
  {
    id v6 = [a4 objectForKeyedSubscript:@"BatteryData"];
    id v7 = [v6 objectForKeyedSubscript:@"Qmax"];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__PLEventBackwardBatteryEntry_populateQmaxForEntry_withRawData___block_invoke;
    v8[3] = &unk_1E69306B0;
    id v9 = v5;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEventBackwardBatteryEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (void)populateCellWOMForEntry:(id)a3 withRawData:(id)a4
{
  id v5 = a3;
  if (v5 && a4)
  {
    id v6 = [a4 objectForKeyedSubscript:@"BatteryData"];
    id v7 = [v6 objectForKeyedSubscript:@"CellWom"];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__PLEventBackwardBatteryEntry_populateCellWOMForEntry_withRawData___block_invoke;
    v8[3] = &unk_1E69306B0;
    id v9 = v5;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

void __67__PLEventBackwardBatteryEntry_populateCellWOMForEntry_withRawData___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4 = NSString;
  uint64_t v5 = (a3 + 1);
  id v6 = a2;
  objc_msgSend(v4, "stringWithFormat:", @"Wom_%d", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __63__PLEventBackwardBatteryEntry_populatewRaForEntry_withRawData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = NSString;
    id v6 = a2;
    objc_msgSend(v5, "stringWithFormat:", @"WeightedRaCell%d", a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
}

@end