@interface WFHealthUIEvent
+ (id)detailEventWithIssues:(id)a3 ssid:(id)a4 securityType:(int64_t)a5;
+ (id)noInternetEventWithTestTimes:(int64_t)a3 didPassTest:(BOOL)a4 failedVelocityTests:(id)a5 ssid:(id)a6;
+ (id)subtitleEventWithIssues:(id)a3 ssid:(id)a4 securityType:(int64_t)a5;
+ (id)tapLinkEventWithIssues:(id)a3 ssid:(id)a4 securityType:(int64_t)a5;
- (NSDictionary)eventDictionary;
- (NSString)eventName;
- (WFHealthUIEvent)initWithEventType:(int64_t)a3 issues:(id)a4 ssid:(id)a5 securityType:(int64_t)a6 testTimes:(int64_t)a7 didPassTest:(BOOL)a8 failedTests:(id)a9;
- (id)_eventTypeStringForType:(int64_t)a3;
- (id)_issuesToJSONString:(id)a3;
@end

@implementation WFHealthUIEvent

- (WFHealthUIEvent)initWithEventType:(int64_t)a3 issues:(id)a4 ssid:(id)a5 securityType:(int64_t)a6 testTimes:(int64_t)a7 didPassTest:(BOOL)a8 failedTests:(id)a9
{
  BOOL v9 = a8;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a9;
  v44.receiver = self;
  v44.super_class = (Class)WFHealthUIEvent;
  v17 = [(WFHealthUIEvent *)&v44 init];
  if (!v17)
  {
    v33 = 0;
    goto LABEL_15;
  }
  if (!v15)
  {
    v25 = WFLogForCategory(0);
    os_log_type_t v35 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v25 || !os_log_type_enabled(v25, v35)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    v36 = "Missing WFHealthIssues for WFHealthUIEvent";
    goto LABEL_25;
  }
  if (a5)
  {
    v37 = v16;
    id v38 = v15;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v18);
          }
          v21 |= objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "type", v37);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = 0;
    }

    v45[0] = @"type";
    uint64_t v24 = [(WFHealthUIEvent *)v17 _eventTypeStringForType:a3];
    v46[0] = v24;
    v45[1] = @"issues";
    v25 = [(WFHealthUIEvent *)v17 _issuesToJSONString:v18];
    v46[1] = v25;
    v45[2] = @"issueBitMask";
    v26 = [NSNumber numberWithUnsignedInteger:v21];
    v46[2] = v26;
    v45[3] = @"securityType";
    v27 = [NSNumber numberWithInteger:a6];
    v46[3] = v27;
    v45[4] = @"didRunVelocityTests";
    v28 = [NSNumber numberWithInt:a7 > 0];
    v46[4] = v28;
    v45[5] = @"didPassVelocityTests";
    v29 = [NSNumber numberWithBool:v9];
    v46[5] = v29;
    v45[6] = @"failedVelocityTests";
    id v16 = v37;
    v30 = [v37 numberArrayToJsonString];
    v46[6] = v30;
    uint64_t v31 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:7];
    eventDictionary = v17->_eventDictionary;
    v17->_eventDictionary = (NSDictionary *)v31;

    id v15 = v38;
    goto LABEL_14;
  }
  v25 = WFLogForCategory(0);
  os_log_type_t v35 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v35))
  {
    *(_WORD *)buf = 0;
    v36 = "Missing ssid for WFHealthUIEvent";
LABEL_25:
    _os_log_impl(&dword_226071000, v25, v35, v36, buf, 2u);
  }
LABEL_26:
  uint64_t v24 = (uint64_t)v17;
  v17 = 0;
LABEL_14:
  v33 = v17;

  v17 = (WFHealthUIEvent *)v24;
LABEL_15:

  return v33;
}

+ (id)subtitleEventWithIssues:(id)a3 ssid:(id)a4 securityType:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = [WFHealthUIEvent alloc];
  v10 = [(WFHealthUIEvent *)v9 initWithEventType:1 issues:v8 ssid:v7 securityType:a5 testTimes:0 didPassTest:0 failedTests:MEMORY[0x263EFFA68]];

  return v10;
}

+ (id)detailEventWithIssues:(id)a3 ssid:(id)a4 securityType:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = [WFHealthUIEvent alloc];
  v10 = [(WFHealthUIEvent *)v9 initWithEventType:2 issues:v8 ssid:v7 securityType:a5 testTimes:0 didPassTest:0 failedTests:MEMORY[0x263EFFA68]];

  return v10;
}

+ (id)tapLinkEventWithIssues:(id)a3 ssid:(id)a4 securityType:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = [WFHealthUIEvent alloc];
  v10 = [(WFHealthUIEvent *)v9 initWithEventType:3 issues:v8 ssid:v7 securityType:a5 testTimes:0 didPassTest:0 failedTests:MEMORY[0x263EFFA68]];

  return v10;
}

+ (id)noInternetEventWithTestTimes:(int64_t)a3 didPassTest:(BOOL)a4 failedVelocityTests:(id)a5 ssid:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  v11 = [WFHealthUIEvent alloc];
  v12 = (void *)MEMORY[0x263EFFA08];
  v13 = [MEMORY[0x263F863A8] issueWithType:1];
  v14 = [v12 setWithObject:v13];
  id v15 = [(WFHealthUIEvent *)v11 initWithEventType:4 issues:v14 ssid:v9 securityType:-1 testTimes:a3 didPassTest:v7 failedTests:v10];

  return v15;
}

- (id)_issuesToJSONString:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [v3 allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) typeString];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }

  id v17 = 0;
  v11 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:&v17];
  id v12 = v17;
  if (v11)
  {
    v13 = (__CFString *)[[NSString alloc] initWithData:v11 encoding:4];
  }
  else
  {
    v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFHealthUIEvent _issuesToJSONString:]";
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_226071000, v14, v15, "%s: failed to create json from dictionary %@", buf, 0x16u);
    }

    v13 = &stru_26D9BFD58;
  }

  return v13;
}

- (id)_eventTypeStringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_26478F9E0[a3 - 1];
  }
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.wifi.ui.health";
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
}

@end