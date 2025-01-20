@interface MonitoredFence
+ (id)createScheduleWithDictionary:(id)a3;
- (BOOL)isAllowedAtLocation:(id)a3;
- (BOOL)isNotifyMeFence;
- (BOOL)isNotifyOthersFence;
- (BOOL)isRecurring;
- (BOOL)isValidTrigger:(int64_t)a3;
- (BOOL)shouldTrigger:(int64_t)a3 forLocation:(id)a4 atDate:(id)a5 reason:(id *)a6;
- (BOOL)shouldUseIDSTrigger;
- (FenceScheduleProtocol)schedule;
- (MonitoredFence)initWithDictionary:(id)a3;
- (NSDate)lastTriggerTimestamp;
- (NSDictionary)contextDict;
- (NSDictionary)dictionary;
- (NSString)acceptanceStatus;
- (NSString)ckRecordName;
- (NSString)ckRecordZoneOwnerName;
- (NSString)fenceId;
- (NSString)triggerURL;
- (NSString)type;
- (double)latitude;
- (double)longitude;
- (double)radius;
- (id)description;
- (int64_t)lastTrigger;
- (int64_t)triggerType;
- (void)setAcceptanceStatus:(id)a3;
- (void)setCkRecordName:(id)a3;
- (void)setCkRecordZoneOwnerName:(id)a3;
- (void)setContextDict:(id)a3;
- (void)setFenceId:(id)a3;
- (void)setLastTrigger:(int64_t)a3;
- (void)setLastTriggerTimestamp:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setRadius:(double)a3;
- (void)setRecurring:(BOOL)a3;
- (void)setSchedule:(id)a3;
- (void)setTriggerType:(int64_t)a3;
- (void)setTriggerURL:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MonitoredFence

- (MonitoredFence)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(MonitoredFence *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"fenceId"];
    if (v6)
    {
      [(MonitoredFence *)v5 setFenceId:v6];
    }
    else
    {
      v7 = [v4 objectForKeyedSubscript:@"id"];
      [(MonitoredFence *)v5 setFenceId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"trigger"];
    if (v8)
    {
      v9 = [v4 objectForKeyedSubscript:@"trigger"];
      id v10 = (id)sub_1000143AC(v9);
    }
    else
    {
      v9 = [v4 objectForKeyedSubscript:@"triggerType"];
      id v10 = [v9 integerValue];
    }
    [(MonitoredFence *)v5 setTriggerType:v10];

    v11 = [v4 objectForKeyedSubscript:@"triggerURL"];
    [(MonitoredFence *)v5 setTriggerURL:v11];

    v12 = [v4 objectForKeyedSubscript:@"latitude"];
    [v12 doubleValue];
    -[MonitoredFence setLatitude:](v5, "setLatitude:");

    v13 = [v4 objectForKeyedSubscript:@"longitude"];
    [v13 doubleValue];
    -[MonitoredFence setLongitude:](v5, "setLongitude:");

    v14 = [v4 objectForKeyedSubscript:@"radius"];
    [v14 doubleValue];
    -[MonitoredFence setRadius:](v5, "setRadius:");

    v15 = [v4 objectForKeyedSubscript:@"fenceContext"];
    [(MonitoredFence *)v5 setContextDict:v15];

    v16 = [v4 objectForKeyedSubscript:@"lastTrigger"];
    -[MonitoredFence setLastTrigger:](v5, "setLastTrigger:", [v16 integerValue]);

    v17 = [v4 objectForKeyedSubscript:@"lastTriggerTimestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [v4 objectForKeyedSubscript:@"lastTriggerTimestamp"];
      [(MonitoredFence *)v5 setLastTriggerTimestamp:v18];
    }
    else
    {
      [(MonitoredFence *)v5 setLastTriggerTimestamp:0];
    }

    v19 = [v4 objectForKeyedSubscript:@"ckRecordName"];
    [(MonitoredFence *)v5 setCkRecordName:v19];

    v20 = [v4 objectForKeyedSubscript:@"ckRecordZoneOwnerName"];
    [(MonitoredFence *)v5 setCkRecordZoneOwnerName:v20];

    v21 = [v4 objectForKeyedSubscript:@"type"];
    [(MonitoredFence *)v5 setType:v21];

    v22 = [v4 objectForKeyedSubscript:@"acceptanceStatus"];
    [(MonitoredFence *)v5 setAcceptanceStatus:v22];

    v23 = [v4 objectForKeyedSubscript:@"onetimeonly"];
    v24 = v23;
    if (v23) {
      uint64_t v25 = [v23 BOOLValue] ^ 1;
    }
    else {
      uint64_t v25 = 0;
    }
    [(MonitoredFence *)v5 setRecurring:v25];
    v26 = [v4 objectForKeyedSubscript:@"fenceTimeRange"];
    v27 = [v26 fm_nullToNil];

    v28 = [(id)objc_opt_class() createScheduleWithDictionary:v27];
    [(MonitoredFence *)v5 setSchedule:v28];
  }
  return v5;
}

+ (id)createScheduleWithDictionary:(id)a3
{
  id v3 = a3;
  int v4 = sub_10001F020();
  if (v3)
  {
    v5 = (Class *)FMFSchedule_ptr;
    if (!v4) {
      v5 = (Class *)off_100058E48;
    }
    id v6 = [objc_alloc(*v5) initWithDictionary:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSDictionary)dictionary
{
  id v3 = objc_opt_new();
  int v4 = [(MonitoredFence *)self fenceId];
  [v3 setObject:v4 forKeyedSubscript:@"id"];

  v5 = +[NSNumber numberWithInteger:[(MonitoredFence *)self triggerType]];
  [v3 setObject:v5 forKeyedSubscript:@"triggerType"];

  id v6 = [(MonitoredFence *)self triggerURL];
  [v3 setObject:v6 forKeyedSubscript:@"triggerURL"];

  [(MonitoredFence *)self latitude];
  v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"latitude"];

  [(MonitoredFence *)self longitude];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:@"longitude"];

  [(MonitoredFence *)self radius];
  v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:@"radius"];

  id v10 = [(MonitoredFence *)self contextDict];
  [v3 setObject:v10 forKeyedSubscript:@"fenceContext"];

  v11 = +[NSNumber numberWithInteger:[(MonitoredFence *)self lastTrigger]];
  [v3 setObject:v11 forKeyedSubscript:@"lastTrigger"];

  v12 = [(MonitoredFence *)self lastTriggerTimestamp];
  [v3 setObject:v12 forKeyedSubscript:@"lastTriggerTimestamp"];

  v13 = [(MonitoredFence *)self schedule];
  v14 = [v13 dictionary];
  [v3 setObject:v14 forKeyedSubscript:@"fenceTimeRange"];

  v15 = +[NSNumber numberWithInt:[(MonitoredFence *)self isRecurring] ^ 1];
  [v3 setObject:v15 forKeyedSubscript:@"onetimeonly"];

  v16 = [(MonitoredFence *)self ckRecordName];
  [v3 setObject:v16 forKeyedSubscript:@"ckRecordName"];

  v17 = [(MonitoredFence *)self ckRecordZoneOwnerName];
  [v3 setObject:v17 forKeyedSubscript:@"ckRecordZoneOwnerName"];

  v18 = [(MonitoredFence *)self acceptanceStatus];
  [v3 setObject:v18 forKeyedSubscript:@"acceptanceStatus"];

  v19 = [(MonitoredFence *)self type];
  [v3 setObject:v19 forKeyedSubscript:@"type"];

  return (NSDictionary *)v3;
}

- (BOOL)shouldUseIDSTrigger
{
  if ([(MonitoredFence *)self isNotifyMeFence]
    && ([(MonitoredFence *)self isRecurring]
     || (id)[(MonitoredFence *)self triggerType] == (id)3))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(MonitoredFence *)self isNotifyOthersFence];
    if (v3) {
      LOBYTE(v3) = (id)[(MonitoredFence *)self triggerType] == (id)3;
    }
  }
  return v3;
}

- (BOOL)shouldTrigger:(int64_t)a3 forLocation:(id)a4 atDate:(id)a5 reason:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([(MonitoredFence *)self isValidTrigger:a3])
  {
    if ([(MonitoredFence *)self isAllowedAtLocation:v10])
    {
      if ([(MonitoredFence *)self lastTrigger] == a3)
      {
        uint64_t v12 = [(MonitoredFence *)self lastTriggerTimestamp];
        if (v12)
        {
          v13 = (void *)v12;
          v14 = [(MonitoredFence *)self lastTriggerTimestamp];
          [v11 timeIntervalSinceDate:v14];
          double v16 = v15;

          if (v16 < 5.0)
          {
            if (a6)
            {
              v17 = [(MonitoredFence *)self lastTriggerTimestamp];
              *a6 = +[NSString stringWithFormat:@"date (%@) < lastTriggerTimestamp (%@) + 5s", v11, v17];
            }
            goto LABEL_16;
          }
        }
      }
      v20 = +[SystemConfig sharedInstance];
      unsigned int v21 = [v20 isFMFAppRemoved];

      if (!v21)
      {
        BOOL v18 = 1;
        goto LABEL_18;
      }
      if (!a6) {
        goto LABEL_16;
      }
      BOOL v18 = 0;
      v19 = @"app is removed";
      goto LABEL_10;
    }
    if (a6)
    {
      +[NSString stringWithFormat:@"not allowed at location: %@", v10];
      BOOL v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_18;
  }
  if (!a6) {
    goto LABEL_16;
  }
  BOOL v18 = 0;
  v19 = @"invalid trigger";
LABEL_10:
  *a6 = v19;
LABEL_18:

  return v18;
}

- (id)description
{
  uint64_t v25 = objc_opt_class();
  v26 = [(MonitoredFence *)self fenceId];
  BOOL v3 = [(MonitoredFence *)self type];
  int64_t v4 = [(MonitoredFence *)self triggerType];
  if ((unint64_t)(v4 - 1) > 2) {
    CFStringRef v5 = @"enter";
  }
  else {
    CFStringRef v5 = *(&off_1000598B8 + v4 - 1);
  }
  CFStringRef v24 = v5;
  id v6 = [(MonitoredFence *)self contextDict];
  [(MonitoredFence *)self latitude];
  uint64_t v8 = v7;
  [(MonitoredFence *)self longitude];
  uint64_t v10 = v9;
  [(MonitoredFence *)self radius];
  uint64_t v12 = v11;
  v13 = [(MonitoredFence *)self schedule];
  unsigned int v14 = [(MonitoredFence *)self isRecurring];
  double v15 = [(MonitoredFence *)self triggerURL];
  unint64_t v16 = [(MonitoredFence *)self lastTrigger];
  if (v16 > 3) {
    CFStringRef v17 = @"in";
  }
  else {
    CFStringRef v17 = *(&off_1000598D0 + v16);
  }
  BOOL v18 = [(MonitoredFence *)self lastTriggerTimestamp];
  v19 = [(MonitoredFence *)self acceptanceStatus];
  v20 = [(MonitoredFence *)self ckRecordName];
  unsigned int v21 = [(MonitoredFence *)self ckRecordZoneOwnerName];
  v22 = +[NSString stringWithFormat:@"<%@ fenceId: %@, type: %@, triggerType: %@, contextDict: %@, latitude: %f, longitude: %f, radius: %f, schedule: %@, recurring: %d, triggerURL: %@, lastTrigger: %@, lastTriggerTimestamp: %@, acceptanceStatus: %@, ckRecordName: %@, ckRecordZoneOwnerName: %@>", v25, v26, v3, v24, v6, v8, v10, v12, v13, v14, v15, v17, v18, v19, v20, v21];

  return v22;
}

- (BOOL)isNotifyMeFence
{
  int v3 = sub_10001F020();
  type = self->_type;
  if (v3) {
    CFStringRef v5 = (const __CFString *)FMFFenceTypeNotifyMe;
  }
  else {
    CFStringRef v5 = @"NotifyMe";
  }

  return [(NSString *)type isEqualToString:v5];
}

- (BOOL)isNotifyOthersFence
{
  int v3 = sub_10001F020();
  type = self->_type;
  if (v3) {
    CFStringRef v5 = (const __CFString *)FMFFenceTypeNotifyOther;
  }
  else {
    CFStringRef v5 = @"NotifyOthers";
  }

  return [(NSString *)type isEqualToString:v5];
}

- (BOOL)isAllowedAtLocation:(id)a3
{
  id v3 = a3;
  int v4 = sub_10001F020();
  CFStringRef v5 = (void **)FMFFence_ptr;
  if (!v4) {
    CFStringRef v5 = (void **)&off_100058E50;
  }
  id v6 = *v5;
  [v3 coordinate];
  double v8 = v7;
  double v10 = v9;

  return [v6 isAllowedAtLocation:v8, v10];
}

- (BOOL)isValidTrigger:(int64_t)a3
{
  switch([(MonitoredFence *)self triggerType])
  {
    case 0:
      BOOL v5 = a3 == 0;
      goto LABEL_6;
    case 1:
      BOOL v5 = a3 == 1;
      goto LABEL_6;
    case 2:
      return (unint64_t)a3 < 2;
    case 3:
      BOOL v5 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
LABEL_6:
      BOOL v4 = v5;
      break;
    default:
      return v4;
  }
  return v4;
}

- (NSString)fenceId
{
  return self->_fenceId;
}

- (void)setFenceId:(id)a3
{
}

- (int64_t)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(int64_t)a3
{
  self->_triggerType = a3;
}

- (BOOL)isRecurring
{
  return self->_recurring;
}

- (void)setRecurring:(BOOL)a3
{
  self->_recurring = a3;
}

- (NSDictionary)contextDict
{
  return self->_contextDict;
}

- (void)setContextDict:(id)a3
{
}

- (NSString)triggerURL
{
  return self->_triggerURL;
}

- (void)setTriggerURL:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (FenceScheduleProtocol)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
}

- (int64_t)lastTrigger
{
  return self->_lastTrigger;
}

- (void)setLastTrigger:(int64_t)a3
{
  self->_lastTrigger = a3;
}

- (NSDate)lastTriggerTimestamp
{
  return self->_lastTriggerTimestamp;
}

- (void)setLastTriggerTimestamp:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (void)setAcceptanceStatus:(id)a3
{
}

- (NSString)ckRecordName
{
  return self->_ckRecordName;
}

- (void)setCkRecordName:(id)a3
{
}

- (NSString)ckRecordZoneOwnerName
{
  return self->_ckRecordZoneOwnerName;
}

- (void)setCkRecordZoneOwnerName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckRecordZoneOwnerName, 0);
  objc_storeStrong((id *)&self->_ckRecordName, 0);
  objc_storeStrong((id *)&self->_acceptanceStatus, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_lastTriggerTimestamp, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_triggerURL, 0);
  objc_storeStrong((id *)&self->_contextDict, 0);

  objc_storeStrong((id *)&self->_fenceId, 0);
}

@end