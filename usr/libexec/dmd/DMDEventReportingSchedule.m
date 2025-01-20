@interface DMDEventReportingSchedule
- (BOOL)isEqual:(id)a3;
- (DMDEventReportingSchedule)initWithScheduleRegistration:(id)a3;
- (NSNumber)day;
- (NSNumber)spread;
- (NSString)identifier;
- (NSString)localTime;
- (NSTimer)timer;
- (id)description;
- (int64_t)frequency;
- (unint64_t)hash;
- (void)dealloc;
- (void)setTimer:(id)a3;
- (void)startWithScheduleElapsedHandler:(id)a3;
@end

@implementation DMDEventReportingSchedule

- (DMDEventReportingSchedule)initWithScheduleRegistration:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DMDEventReportingSchedule;
  v5 = [(DMDEventReportingSchedule *)&v25 init];
  if (!v5) {
    goto LABEL_24;
  }
  uint64_t v6 = [v4 identifier];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = [v4 schedule];
  v9 = [v8 payloadFrequency];
  v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  if (![v9 caseInsensitiveCompare:@"Immediate"])
  {
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  if ([v10 caseInsensitiveCompare:@"Minutely"]
    || (+[DMDDeviceController shared],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v11 isAppleInternal],
        v12 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v13 = [v12 BOOLValue],
        v12,
        v11,
        (v13 & 1) == 0))
  {
    if (![v10 caseInsensitiveCompare:@"Hourly"])
    {
      uint64_t v14 = 2;
      goto LABEL_17;
    }
    if (![v10 caseInsensitiveCompare:@"Weekly"])
    {
      uint64_t v14 = 4;
      goto LABEL_17;
    }
LABEL_9:
    if ([v10 caseInsensitiveCompare:@"Daily"])
    {
      v15 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100085224((uint64_t)v10, v15);
      }
    }
    uint64_t v14 = 3;
    goto LABEL_17;
  }
  uint64_t v14 = 1;
LABEL_17:
  v5->_frequency = v14;
  uint64_t v16 = [v8 payloadLocalTime];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"00:00";
  }
  objc_storeStrong((id *)&v5->_localTime, v18);

  uint64_t v19 = [v8 payloadSpread];
  v20 = (void *)v19;
  if (v19) {
    v21 = (_UNKNOWN **)v19;
  }
  else {
    v21 = &off_1000D35C0;
  }
  objc_storeStrong((id *)&v5->_spread, v21);

  uint64_t v22 = [v8 payloadDay];
  day = v5->_day;
  v5->_day = (NSNumber *)v22;

LABEL_24:
  return v5;
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DMDEventReportingSchedule;
  [(DMDEventReportingSchedule *)&v3 dealloc];
}

- (id)description
{
  v5[0] = @"frequency";
  v5[1] = @"localTime";
  v5[2] = @"spread";
  v5[3] = @"day";
  v2 = +[NSArray arrayWithObjects:v5 count:4];
  objc_super v3 = DMFObjectDescriptionWithProperties();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DMDEventReportingSchedule *)a3;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DMDEventReportingSchedule *)self day];
      uint64_t v7 = [(DMDEventReportingSchedule *)v5 day];
      v8 = [(DMDEventReportingSchedule *)self identifier];
      v9 = [(DMDEventReportingSchedule *)v5 identifier];
      if ([v8 isEqual:v9]
        && (id v10 = [(DMDEventReportingSchedule *)self frequency],
            v10 == (id)[(DMDEventReportingSchedule *)v5 frequency]))
      {
        v11 = [(DMDEventReportingSchedule *)self localTime];
        v12 = [(DMDEventReportingSchedule *)v5 localTime];
        if ([v11 isEqual:v12])
        {
          unsigned __int8 v13 = [(DMDEventReportingSchedule *)self spread];
          uint64_t v14 = [(DMDEventReportingSchedule *)v5 spread];
          v17 = v13;
          if ([v13 isEqual:v14])
          {
            if (v6 | v7) {
              unsigned __int8 v15 = [(id)v6 isEqual:v7];
            }
            else {
              unsigned __int8 v15 = 1;
            }
          }
          else
          {
            unsigned __int8 v15 = 0;
          }
        }
        else
        {
          unsigned __int8 v15 = 0;
        }
      }
      else
      {
        unsigned __int8 v15 = 0;
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  objc_super v3 = [(DMDEventReportingSchedule *)self identifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = +[NSNumber numberWithInteger:[(DMDEventReportingSchedule *)self frequency]];
  unint64_t v6 = (unint64_t)[v5 hash];
  uint64_t v7 = [(DMDEventReportingSchedule *)self localTime];
  unint64_t v8 = v4 ^ (unint64_t)[v7 hash];
  v9 = [(DMDEventReportingSchedule *)self spread];
  unint64_t v10 = v8 ^ (unint64_t)[v9 hash];
  v11 = [(DMDEventReportingSchedule *)self day];
  unint64_t v12 = v6 ^ v10 ^ (unint64_t)[v11 hash];

  return v12;
}

- (void)startWithScheduleElapsedHandler:(id)a3
{
  id v4 = a3;
  switch([(DMDEventReportingSchedule *)self frequency])
  {
    case 1:
      v5 = +[DMDDeviceController shared];
      unint64_t v6 = [v5 isAppleInternal];
      unsigned int v7 = [v6 BOOLValue];

      if (v7) {
        double v8 = 60.0;
      }
      else {
        double v8 = 86400.0;
      }
      break;
    case 2:
      double v8 = 3600.0;
      break;
    case 3:
      double v8 = 86400.0;
      break;
    case 4:
      double v8 = 604800.0;
      break;
    default:
      double v8 = 0.0;
      break;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100047018;
  v11[3] = &unk_1000CAF28;
  id v12 = v4;
  id v9 = v4;
  unint64_t v10 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v11 block:v8];
  [(DMDEventReportingSchedule *)self setTimer:v10];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (NSString)localTime
{
  return self->_localTime;
}

- (NSNumber)spread
{
  return self->_spread;
}

- (NSNumber)day
{
  return self->_day;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_day, 0);
  objc_storeStrong((id *)&self->_spread, 0);
  objc_storeStrong((id *)&self->_localTime, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end