@interface WFScanPerformanceEvent
- (NSDictionary)eventDictionary;
- (NSString)eventName;
- (WFScanPerformanceEvent)initWithScanReason:(unint64_t)a3 timeElasped:(unint64_t)a4 firstScan:(BOOL)a5 results:(unint64_t)a6 errorCode:(int64_t)a7 lowPriority:(BOOL)a8 rssiFilter:(BOOL)a9;
- (id)_scanReasonToString:(unint64_t)a3;
@end

@implementation WFScanPerformanceEvent

- (WFScanPerformanceEvent)initWithScanReason:(unint64_t)a3 timeElasped:(unint64_t)a4 firstScan:(BOOL)a5 results:(unint64_t)a6 errorCode:(int64_t)a7 lowPriority:(BOOL)a8 rssiFilter:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v12 = a5;
  v31[8] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)WFScanPerformanceEvent;
  v15 = [(WFScanPerformanceEvent *)&v29 init];
  v16 = v15;
  if (v15)
  {
    v30[0] = @"reason";
    v17 = [(WFScanPerformanceEvent *)v15 _scanReasonToString:a3];
    v31[0] = v17;
    v30[1] = @"duration";
    v18 = [NSNumber numberWithUnsignedInteger:a4];
    v31[1] = v18;
    v30[2] = @"results";
    v19 = [NSNumber numberWithUnsignedInteger:a6];
    v31[2] = v19;
    v30[3] = @"firstScan";
    v20 = [NSNumber numberWithBool:v12];
    v31[3] = v20;
    v30[4] = @"errorCode";
    v21 = [NSNumber numberWithInteger:a7];
    v31[4] = v21;
    v30[5] = @"lowPriority";
    v22 = [NSNumber numberWithBool:v9];
    v31[5] = v22;
    v30[6] = @"rssiFilter";
    v23 = [NSNumber numberWithBool:a9];
    v31[6] = v23;
    v30[7] = @"process";
    v24 = +[WFMetricsManager sharedManager];
    v25 = [v24 processName];
    v31[7] = v25;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:8];
    eventDictionary = v16->_eventDictionary;
    v16->_eventDictionary = (NSDictionary *)v26;
  }
  return v16;
}

- (id)_scanReasonToString:(unint64_t)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_26478F168[a3];
  }
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.wifi.ui.scanperf";
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
}

@end