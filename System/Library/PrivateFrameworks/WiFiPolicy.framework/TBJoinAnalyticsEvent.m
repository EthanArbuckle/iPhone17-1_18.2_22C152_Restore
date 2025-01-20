@interface TBJoinAnalyticsEvent
+ (id)joinAlertEventWithSource:(unint64_t)a3 action:(unint64_t)a4 visibleDuration:(id)a5;
+ (id)joinRecommendationEventWithSource:(unint64_t)a3 action:(unint64_t)a4 BSSID:(id)a5 latitude:(id)a6 longitude:(id)a7 score:(id)a8 visibleDuration:(id)a9;
- (NSDictionary)eventDictionary;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)score;
- (NSNumber)visibleDuration;
- (NSString)bssid;
- (NSString)eventName;
- (unint64_t)action;
- (unint64_t)source;
- (unint64_t)type;
- (void)setAction:(unint64_t)a3;
- (void)setBssid:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setScore:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setVisibleDuration:(id)a3;
@end

@implementation TBJoinAnalyticsEvent

+ (id)joinRecommendationEventWithSource:(unint64_t)a3 action:(unint64_t)a4 BSSID:(id)a5 latitude:(id)a6 longitude:(id)a7 score:(id)a8 visibleDuration:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  v20 = objc_alloc_init(TBJoinAnalyticsEvent);
  [(TBJoinAnalyticsEvent *)v20 setType:0];
  [(TBJoinAnalyticsEvent *)v20 setSource:a3];
  [(TBJoinAnalyticsEvent *)v20 setAction:a4];
  [(TBJoinAnalyticsEvent *)v20 setBssid:v19];

  [(TBJoinAnalyticsEvent *)v20 setLatitude:v18];
  [(TBJoinAnalyticsEvent *)v20 setLongitude:v17];

  [(TBJoinAnalyticsEvent *)v20 setScore:v16];
  [(TBJoinAnalyticsEvent *)v20 setVisibleDuration:v15];

  return v20;
}

+ (id)joinAlertEventWithSource:(unint64_t)a3 action:(unint64_t)a4 visibleDuration:(id)a5
{
  id v7 = a5;
  v8 = objc_alloc_init(TBJoinAnalyticsEvent);
  [(TBJoinAnalyticsEvent *)v8 setType:1];
  [(TBJoinAnalyticsEvent *)v8 setSource:a3];
  [(TBJoinAnalyticsEvent *)v8 setAction:a4];
  [(TBJoinAnalyticsEvent *)v8 setVisibleDuration:v7];

  return v8;
}

- (NSDictionary)eventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TBJoinAnalyticsEvent action](self, "action"));
  [v3 setObject:v4 forKey:@"action"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TBJoinAnalyticsEvent source](self, "source"));
  [v3 setObject:v5 forKey:@"source"];

  v6 = [(TBJoinAnalyticsEvent *)self bssid];

  if (v6)
  {
    id v7 = [(TBJoinAnalyticsEvent *)self bssid];
    [v3 setObject:v7 forKey:@"BSSID"];
  }
  v8 = [(TBJoinAnalyticsEvent *)self latitude];

  if (v8)
  {
    v9 = [(TBJoinAnalyticsEvent *)self latitude];
    [v3 setObject:v9 forKey:@"latitude"];
  }
  v10 = [(TBJoinAnalyticsEvent *)self longitude];

  if (v10)
  {
    v11 = [(TBJoinAnalyticsEvent *)self longitude];
    [v3 setObject:v11 forKey:@"longitude"];
  }
  v12 = [(TBJoinAnalyticsEvent *)self score];

  if (v12)
  {
    v13 = [(TBJoinAnalyticsEvent *)self score];
    [v3 setObject:v13 forKey:@"score"];
  }
  v14 = [(TBJoinAnalyticsEvent *)self visibleDuration];

  if (v14)
  {
    id v15 = [(TBJoinAnalyticsEvent *)self visibleDuration];
    [v3 setObject:v15 forKey:@"visibleDuration"];
  }

  return (NSDictionary *)v3;
}

- (NSString)eventName
{
  if (![(TBJoinAnalyticsEvent *)self type]) {
    return (NSString *)@"com.apple.wifi.3bars.join_recommendation";
  }
  if ([(TBJoinAnalyticsEvent *)self type] == 1) {
    return (NSString *)@"com.apple.wifi.3bars.join_alert";
  }
  return 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (NSNumber)visibleDuration
{
  return self->_visibleDuration;
}

- (void)setVisibleDuration:(id)a3
{
  self->_visibleDuration = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);

  objc_storeStrong((id *)&self->_bssid, 0);
}

@end