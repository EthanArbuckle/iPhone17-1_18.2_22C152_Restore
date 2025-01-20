@interface WFScanSessionEvent
+ (id)scanSessionEventWithSectionCounts:(id)a3 duration:(double)a4;
- (NSDictionary)eventDictionary;
- (NSString)eventName;
- (WFScanSessionEvent)initWithScanSectionCounts:(id)a3 duration:(double)a4;
- (id)_sectionCountsToJSONString:(id)a3;
- (unint64_t)_durationBucketFromTimeInterval:(double)a3;
@end

@implementation WFScanSessionEvent

+ (id)scanSessionEventWithSectionCounts:(id)a3 duration:(double)a4
{
  id v5 = a3;
  v6 = [[WFScanSessionEvent alloc] initWithScanSectionCounts:v5 duration:a4];

  return v6;
}

- (WFScanSessionEvent)initWithScanSectionCounts:(id)a3 duration:(double)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v17[0] = @"duration";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFScanSessionEvent _durationBucketFromTimeInterval:](self, "_durationBucketFromTimeInterval:", a4));
  v17[1] = @"sections";
  v18[0] = v7;
  v8 = [(WFScanSessionEvent *)self _sectionCountsToJSONString:v6];
  v18[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  eventDictionary = self->_eventDictionary;
  self->_eventDictionary = v9;

  if ([v6 count])
  {
    v11 = [v6 keysSortedByValueUsingComparator:&__block_literal_global];
    v12 = [v11 lastObject];

    v13 = [v6 objectForKey:v12];
    v14 = (NSDictionary *)[(NSDictionary *)self->_eventDictionary mutableCopy];
    [(NSDictionary *)v14 setObject:v13 forKey:@"maxCount"];
    [(NSDictionary *)v14 setObject:v12 forKey:@"maxSection"];
    v15 = self->_eventDictionary;
    self->_eventDictionary = v14;
  }
  return self;
}

uint64_t __57__WFScanSessionEvent_initWithScanSectionCounts_duration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)_durationBucketFromTimeInterval:(double)a3
{
  if (a3 > 10.0 && a3 < 30.0) {
    return 1;
  }
  if (a3 > 30.0 && a3 < 60.0) {
    return 2;
  }
  if (a3 > 60.0) {
    return 3;
  }
  return 0;
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
      id v6 = (__CFString *)[[NSString alloc] initWithData:v4 encoding:4];
    }
    else
    {
      v8 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFScanSessionEvent _sectionCountsToJSONString:]";
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_226071000, v8, v9, "%s: failed to create json from dictionary %@", buf, 0x16u);
      }

      id v6 = &stru_26D9BFD58;
    }
    v7 = v6;
  }
  else
  {
    v7 = &stru_26D9BFD58;
  }

  return v7;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.wifi.ui.scanlist";
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eventName, 0);
  objc_storeStrong((id *)&self->_eventDictionary, 0);
}

@end