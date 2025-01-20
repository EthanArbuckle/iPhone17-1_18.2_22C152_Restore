@interface TBFetchAnalyticsEvent
+ (id)fetchEventWithSource:(unint64_t)a3 type:(unint64_t)a4 trigger:(unint64_t)a5 duration:(id)a6 requestCount:(id)a7 resultCount:(id)a8 error:(id)a9 tileKey:(id)a10;
- (NSDate)date;
- (NSDictionary)eventDictionary;
- (NSError)error;
- (NSNumber)duration;
- (NSNumber)requestCount;
- (NSNumber)resultCount;
- (NSString)eventName;
- (NSString)tileKey;
- (unint64_t)source;
- (unint64_t)trigger;
- (unint64_t)type;
- (void)setDate:(id)a3;
- (void)setDuration:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestCount:(id)a3;
- (void)setResultCount:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setTileKey:(id)a3;
- (void)setTrigger:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBFetchAnalyticsEvent

- (NSDictionary)eventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TBFetchAnalyticsEvent source](self, "source"));
  [v3 setObject:v4 forKey:@"source"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TBFetchAnalyticsEvent type](self, "type"));
  [v3 setObject:v5 forKey:@"type"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TBFetchAnalyticsEvent trigger](self, "trigger"));
  [v3 setObject:v6 forKey:@"trigger"];

  v7 = [(TBFetchAnalyticsEvent *)self duration];

  if (v7)
  {
    v8 = [(TBFetchAnalyticsEvent *)self duration];
    [v3 setObject:v8 forKey:@"duration"];
  }
  v9 = [(TBFetchAnalyticsEvent *)self requestCount];

  if (v9)
  {
    v10 = [(TBFetchAnalyticsEvent *)self requestCount];
    [v3 setObject:v10 forKey:@"requestCount"];
  }
  v11 = [(TBFetchAnalyticsEvent *)self resultCount];

  if (v11)
  {
    v12 = [(TBFetchAnalyticsEvent *)self resultCount];
    [v3 setObject:v12 forKey:@"resultCount"];
  }
  v13 = [(TBFetchAnalyticsEvent *)self error];

  if (v13)
  {
    v14 = NSNumber;
    v15 = [(TBFetchAnalyticsEvent *)self error];
    v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "code"));
    [v3 setObject:v16 forKey:@"errorCode"];
  }
  v17 = [(TBFetchAnalyticsEvent *)self date];

  if (v17)
  {
    v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v19 = [(TBFetchAnalyticsEvent *)self date];
    v20 = [v18 components:96 fromDate:v19];

    uint64_t v21 = [v20 hour];
    v22 = [NSNumber numberWithInteger:v21];
    [v3 setObject:v22 forKey:@"hour"];
  }
  v23 = [(TBFetchAnalyticsEvent *)self tileKey];

  if (v23)
  {
    v24 = [(TBFetchAnalyticsEvent *)self tileKey];
    [v3 setObject:v24 forKey:@"tileKey"];
  }

  return (NSDictionary *)v3;
}

- (NSNumber)resultCount
{
  return self->_resultCount;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSDate)date
{
  return self->_date;
}

- (NSNumber)requestCount
{
  return self->_requestCount;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (NSString)tileKey
{
  return self->_tileKey;
}

- (unint64_t)source
{
  return self->_source;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.wifi.3bars.Fetch";
}

+ (id)fetchEventWithSource:(unint64_t)a3 type:(unint64_t)a4 trigger:(unint64_t)a5 duration:(id)a6 requestCount:(id)a7 resultCount:(id)a8 error:(id)a9 tileKey:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  uint64_t v21 = objc_alloc_init(TBFetchAnalyticsEvent);
  [(TBFetchAnalyticsEvent *)v21 setSource:a3];
  [(TBFetchAnalyticsEvent *)v21 setType:a4];
  [(TBFetchAnalyticsEvent *)v21 setTrigger:a5];
  [(TBFetchAnalyticsEvent *)v21 setDuration:v20];

  [(TBFetchAnalyticsEvent *)v21 setRequestCount:v19];
  [(TBFetchAnalyticsEvent *)v21 setResultCount:v18];

  [(TBFetchAnalyticsEvent *)v21 setError:v17];
  v22 = [MEMORY[0x1E4F1C9C8] date];
  [(TBFetchAnalyticsEvent *)v21 setDate:v22];

  [(TBFetchAnalyticsEvent *)v21 setTileKey:v16];

  return v21;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setTrigger:(unint64_t)a3
{
  self->_trigger = a3;
}

- (void)setTileKey:(id)a3
{
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void)setResultCount:(id)a3
{
}

- (void)setRequestCount:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (void)setDuration:(id)a3
{
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_tileKey, 0);
  objc_storeStrong((id *)&self->_resultCount, 0);
  objc_storeStrong((id *)&self->_requestCount, 0);

  objc_storeStrong((id *)&self->_duration, 0);
}

@end