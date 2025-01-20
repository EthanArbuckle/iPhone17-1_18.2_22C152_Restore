@interface TBCacheAnalyticsEvent
+ (id)cacheAnalyticsEventWithStatus:(unint64_t)a3 staleness:(unint64_t)a4 tileKey:(unint64_t)a5 type:(unint64_t)a6 error:(id)a7;
+ (id)cacheAvailabilityEventWithStatus:(unint64_t)a3;
+ (id)cacheEventWithTotalCount:(unint64_t)a3 last24HoursCount:(unint64_t)a4;
- (NSDictionary)eventDictionary;
- (NSNumber)errorCode;
- (NSNumber)staleness;
- (NSNumber)tileKey;
- (NSNumber)type;
- (NSString)eventName;
- (unint64_t)status;
- (void)setErrorCode:(id)a3;
- (void)setEventDictionary:(id)a3;
- (void)setEventName:(id)a3;
- (void)setStaleness:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTileKey:(id)a3;
- (void)setType:(id)a3;
@end

@implementation TBCacheAnalyticsEvent

+ (id)cacheAnalyticsEventWithStatus:(unint64_t)a3 staleness:(unint64_t)a4 tileKey:(unint64_t)a5 type:(unint64_t)a6 error:(id)a7
{
  id v11 = a7;
  v12 = objc_alloc_init(TBCacheAnalyticsEvent);
  [(TBCacheAnalyticsEvent *)v12 setEventName:@"com.apple.wifi.3bars.cache_miss"];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v14 = [NSNumber numberWithUnsignedInteger:a3];
  [v13 setObject:v14 forKey:@"status"];

  if (a4)
  {
    v15 = [NSNumber numberWithUnsignedInteger:a4];
    [v13 setObject:v15 forKey:@"staleness"];
  }
  if (a5)
  {
    v16 = [NSNumber numberWithUnsignedInteger:a5];
    [v13 setObject:v16 forKey:@"tileKey"];
  }
  if (v11)
  {
    v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "code"));
    [v13 setObject:v17 forKey:@"error"];
  }
  v18 = [NSNumber numberWithUnsignedInteger:a6];
  [v13 setObject:v18 forKey:@"type"];

  [(TBCacheAnalyticsEvent *)v12 setEventDictionary:v13];

  return v12;
}

- (void)setEventName:(id)a3
{
}

- (void)setEventDictionary:(id)a3
{
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictionary, 0);

  objc_storeStrong((id *)&self->_eventName, 0);
}

+ (id)cacheEventWithTotalCount:(unint64_t)a3 last24HoursCount:(unint64_t)a4
{
  v6 = objc_alloc_init(TBCacheAnalyticsEvent);
  [(TBCacheAnalyticsEvent *)v6 setEventName:@"com.apple.wifi.3bars.cache"];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v8 forKey:@"total"];

  v9 = [NSNumber numberWithUnsignedInteger:a4];
  [v7 setObject:v9 forKey:@"recent"];

  [(TBCacheAnalyticsEvent *)v6 setEventDictionary:v7];

  return v6;
}

+ (id)cacheAvailabilityEventWithStatus:(unint64_t)a3
{
  v4 = objc_alloc_init(TBCacheAnalyticsEvent);
  [(TBCacheAnalyticsEvent *)v4 setEventName:@"com.apple.wifi.3bars.cache_availability"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v6 forKey:@"status"];

  id v7 = (void *)MEMORY[0x1D9440170]();
  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = [v8 components:96 fromDate:v9];

  uint64_t v11 = [v10 hour];
  v12 = [NSNumber numberWithInteger:v11];
  [v5 setObject:v12 forKey:@"hour"];

  [(TBCacheAnalyticsEvent *)v4 setEventDictionary:v5];

  return v4;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSNumber)staleness
{
  return self->_staleness;
}

- (void)setStaleness:(id)a3
{
  self->_staleness = (NSNumber *)a3;
}

- (NSNumber)tileKey
{
  return self->_tileKey;
}

- (void)setTileKey:(id)a3
{
  self->_tileKey = (NSNumber *)a3;
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  self->_type = (NSNumber *)a3;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  self->_errorCode = (NSNumber *)a3;
}

@end