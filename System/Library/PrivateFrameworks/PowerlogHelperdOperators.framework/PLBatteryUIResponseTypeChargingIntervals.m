@interface PLBatteryUIResponseTypeChargingIntervals
- (NSArray)battEntries;
- (NSArray)resultArray;
- (NSDate)end;
- (NSDate)start;
- (PLBatteryUIResponderService)responderService;
- (PLEntry)lastBattEntry;
- (id)dependencies;
- (id)result;
- (void)configure:(id)a3;
- (void)run;
- (void)setBattEntries:(id)a3;
- (void)setEnd:(id)a3;
- (void)setLastBattEntry:(id)a3;
- (void)setResponderService:(id)a3;
- (void)setResultArray:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation PLBatteryUIResponseTypeChargingIntervals

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"start"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"end"];

  [v8 doubleValue];
  double v10 = v9;

  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  [(PLBatteryUIResponseTypeChargingIntervals *)self setStart:v11];

  v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
  [(PLBatteryUIResponseTypeChargingIntervals *)self setEnd:v12];

  v13 = [(PLBatteryUIResponseTypeChargingIntervals *)self start];
  v14 = [(PLBatteryUIResponseTypeChargingIntervals *)self end];
  [v13 timeIntervalSince1970];
  double v16 = v15;
  [v14 timeIntervalSince1970];
  double v18 = v17 - v16;

  id v19 = objc_alloc(MEMORY[0x1E4F92A90]);
  v20 = [MEMORY[0x1E4F28ED0] numberWithDouble:v16];
  v21 = (void *)[v19 initWithKey:@"timestamp" withValue:v20 withComparisonOperation:5];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"Level" withValue:&unk_1F400C700 withComparisonOperation:3];
  v23 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BatteryUI"];
  v24 = [(PLBatteryUIResponseTypeChargingIntervals *)self responderService];
  v25 = [v24 storage];
  v31[0] = v21;
  v31[1] = v22;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v27 = [v25 lastEntryForKey:v23 withComparisons:v26 isSingleton:0];
  [(PLBatteryUIResponseTypeChargingIntervals *)self setLastBattEntry:v27];

  v28 = [(PLBatteryUIResponseTypeChargingIntervals *)self responderService];
  v29 = [v28 storage];
  v30 = objc_msgSend(v29, "entriesForKey:inTimeRange:withFilters:", v23, 0, v16, v18);
  [(PLBatteryUIResponseTypeChargingIntervals *)self setBattEntries:v30];
}

- (void)run
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Last Entry isCharging: %d", (uint8_t *)v2, 8u);
}

- (id)result
{
  [(PLBatteryUIResponseTypeChargingIntervals *)self setBattEntries:0];
  [(PLBatteryUIResponseTypeChargingIntervals *)self setLastBattEntry:0];
  return [(PLBatteryUIResponseTypeChargingIntervals *)self resultArray];
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
}

- (NSArray)battEntries
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBattEntries:(id)a3
{
}

- (PLEntry)lastBattEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastBattEntry:(id)a3
{
}

- (NSArray)resultArray
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResultArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultArray, 0);
  objc_storeStrong((id *)&self->_lastBattEntry, 0);
  objc_storeStrong((id *)&self->_battEntries, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end