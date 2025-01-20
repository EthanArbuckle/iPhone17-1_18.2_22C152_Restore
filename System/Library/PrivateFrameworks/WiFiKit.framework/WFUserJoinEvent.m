@interface WFUserJoinEvent
+ (id)joinEventWithSecurity:(int64_t)a3 error:(int64_t)a4 sectionCounts:(id)a5 sectionName:(id)a6 didRun:(BOOL)a7 didPass:(BOOL)a8 failedTests:(id)a9;
+ (id)joinEventWithType:(int64_t)a3 security:(int64_t)a4 error:(int64_t)a5 didRun:(BOOL)a6 didPass:(BOOL)a7 failedTests:(id)a8;
- (NSDictionary)eventDictionary;
- (NSString)eventName;
- (WFUserJoinEvent)initWithType:(int64_t)a3 security:(int64_t)a4 error:(int64_t)a5 sectionCounts:(id)a6 sectionName:(id)a7 didRunVelocityTests:(BOOL)a8 didPassVelocityTests:(BOOL)a9 failedTests:(id)a10;
- (id)_eventTypeStringForType:(int64_t)a3;
- (id)_sectionCountsToJSONString:(id)a3;
@end

@implementation WFUserJoinEvent

+ (id)joinEventWithSecurity:(int64_t)a3 error:(int64_t)a4 sectionCounts:(id)a5 sectionName:(id)a6 didRun:(BOOL)a7 didPass:(BOOL)a8 failedTests:(id)a9
{
  BOOL v10 = a7;
  id v15 = a9;
  id v16 = a6;
  id v17 = a5;
  LOBYTE(v20) = a8;
  v18 = [[WFUserJoinEvent alloc] initWithType:0 security:a3 error:a4 sectionCounts:v17 sectionName:v16 didRunVelocityTests:v10 didPassVelocityTests:v20 failedTests:v15];

  return v18;
}

+ (id)joinEventWithType:(int64_t)a3 security:(int64_t)a4 error:(int64_t)a5 didRun:(BOOL)a6 didPass:(BOOL)a7 failedTests:(id)a8
{
  BOOL v9 = a6;
  id v13 = a8;
  LOBYTE(v16) = a7;
  v14 = [[WFUserJoinEvent alloc] initWithType:a3 security:a4 error:a5 sectionCounts:0 sectionName:0 didRunVelocityTests:v9 didPassVelocityTests:v16 failedTests:v13];

  return v14;
}

- (WFUserJoinEvent)initWithType:(int64_t)a3 security:(int64_t)a4 error:(int64_t)a5 sectionCounts:(id)a6 sectionName:(id)a7 didRunVelocityTests:(BOOL)a8 didPassVelocityTests:(BOOL)a9 failedTests:(id)a10
{
  BOOL v10 = a8;
  v40[9] = *MEMORY[0x263EF8340];
  id v16 = a6;
  id v17 = (__CFString *)a7;
  id v37 = a10;
  v38.receiver = self;
  v38.super_class = (Class)WFUserJoinEvent;
  v18 = [(WFUserJoinEvent *)&v38 init];
  v19 = v18;
  if (v18)
  {
    v39[0] = @"type";
    v36 = [(WFUserJoinEvent *)v18 _eventTypeStringForType:a3];
    v40[0] = v36;
    v39[1] = @"errorCode";
    v35 = [NSNumber numberWithInteger:a5];
    v40[1] = v35;
    v39[2] = @"securityType";
    uint64_t v20 = [NSNumber numberWithInteger:a4];
    BOOL v21 = v10;
    v22 = (void *)v20;
    v23 = &stru_26D9BFD58;
    if (v17) {
      v23 = v17;
    }
    v40[2] = v20;
    v40[3] = v23;
    v39[3] = @"value";
    v39[4] = @"context";
    v24 = [(WFUserJoinEvent *)v19 _sectionCountsToJSONString:v16];
    v40[4] = v24;
    v39[5] = @"process";
    v25 = +[WFMetricsManager sharedManager];
    [v25 processName];
    v26 = v17;
    v28 = id v27 = v16;
    v40[5] = v28;
    v39[6] = @"didRunVelocityTests";
    v29 = [NSNumber numberWithBool:v21];
    v40[6] = v29;
    v39[7] = @"didPassVelocityTests";
    v30 = [NSNumber numberWithBool:a9];
    v40[7] = v30;
    v39[8] = @"failedVelocityTests";
    v31 = [v37 numberArrayToJsonString];
    v40[8] = v31;
    uint64_t v32 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:9];
    eventDictionary = v19->_eventDictionary;
    v19->_eventDictionary = (NSDictionary *)v32;

    id v16 = v27;
    id v17 = v26;
  }
  return v19;
}

- (id)_sectionCountsToJSONString:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v11 = 0;
    v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:0 error:&v11];
    id v5 = v11;
    if (v4)
    {
      v6 = (__CFString *)[[NSString alloc] initWithData:v4 encoding:4];
    }
    else
    {
      v8 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 136315394;
        id v13 = "-[WFUserJoinEvent _sectionCountsToJSONString:]";
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_226071000, v8, v9, "%s: failed to create json from dictionary %@", buf, 0x16u);
      }

      v6 = &stru_26D9BFD58;
    }
    v7 = v6;
  }
  else
  {
    v7 = &stru_26D9BFD58;
  }

  return v7;
}

- (id)_eventTypeStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"unknown";
  }
  else {
    return off_26478FB00[a3];
  }
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.wifi.ui.event";
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
}

@end