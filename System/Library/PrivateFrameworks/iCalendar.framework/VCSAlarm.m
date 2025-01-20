@interface VCSAlarm
+ (id)_componentsWithISO8601DurationString:(id)a3;
- (NSString)body;
- (NSString)summary;
- (VCSAlarm)initWithLine:(id)a3 parseState:(id)a4 property:(id *)a5;
- (VCSDate)triggerDate;
- (double)triggerDuration;
- (id)dictify;
- (unint64_t)alarmType;
- (unint64_t)entityType;
- (unint64_t)triggerType;
- (void)ensureRelativeAlarmWithStartDate:(id)a3;
@end

@implementation VCSAlarm

- (VCSAlarm)initWithLine:(id)a3 parseState:(id)a4 property:(id *)a5
{
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)VCSAlarm;
  v7 = [(VCSEntity *)&v39 init];
  if (!v7)
  {
LABEL_33:
    v33 = v7;
    goto LABEL_34;
  }
  id v8 = [v6 content];
  v9 = strdup((const char *)[v8 bytes]);

  v10 = strchr(v9, 59);
  v11 = v10;
  if (!v10)
  {
    v13 = 0;
    goto LABEL_9;
  }
  char *v10 = 0;
  v11 = v10 + 1;
  v12 = strchr(v10 + 1, 59);
  v13 = v12;
  if (!v12)
  {
LABEL_9:
    v15 = 0;
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  char *v12 = 0;
  v13 = v12 + 1;
  v14 = strchr(v12 + 1, 59);
  v15 = v14;
  if (!v14) {
    goto LABEL_10;
  }
  char *v14 = 0;
  v15 = v14 + 1;
  if ([v6 tokenID] != 27) {
    goto LABEL_10;
  }
  v16 = strchr(v15, 59);
  v17 = v16;
  if (v16)
  {
    char *v16 = 0;
    v17 = v16 + 1;
  }
LABEL_11:
  v18 = [[VCSDate alloc] initWithDateString:v9];
  if (v18)
  {
    v7->_triggerType = 0;
    triggerDate = v7->_triggerDate;
    v7->_triggerDate = v18;

    if (v11)
    {
      __endptr = 0;
      v20 = objc_opt_class();
      v21 = [NSString stringWithUTF8String:v11];
      v22 = [v20 _componentsWithISO8601DurationString:v21];

      uint64_t v23 = strtol(v13, &__endptr, 10);
      if (v22)
      {
        uint64_t v24 = v23;
        v25 = [[VCSProperty alloc] initWithName:@"DURATION" rawValue:v22 type:5];
        [(VCSEntity *)v7 setProperty:v25];

        v26 = [VCSProperty alloc];
        v27 = [NSNumber numberWithInt:v24];
        v28 = [(VCSProperty *)v26 initWithName:@"REPEAT" rawValue:v27 type:4];
        [(VCSEntity *)v7 setProperty:v28];
      }
    }
    uint64_t v29 = [v6 tokenID];
    if (v29 > 26)
    {
      if (v29 == 27)
      {
        v7->_alarmType = 2;
        if (v17) {
          v34 = v17;
        }
        else {
          v34 = "";
        }
        uint64_t v35 = [NSString stringWithUTF8String:v34];
        summary = v7->_summary;
        v7->_summary = (NSString *)v35;

        objc_storeStrong((id *)&v7->_body, v7->_summary);
      }
      else if (v29 == 30)
      {
        v7->_alarmType = 3;
      }
    }
    else if (v29 == 14)
    {
      v7->_alarmType = 0;
    }
    else if (v29 == 20)
    {
      v7->_alarmType = 1;
      if (v15) {
        v30 = v15;
      }
      else {
        v30 = "";
      }
      uint64_t v31 = [NSString stringWithUTF8String:v30];
      v32 = v7->_summary;
      v7->_summary = (NSString *)v31;
    }
    free(v9);
    goto LABEL_33;
  }
  free(v9);
  v33 = 0;
LABEL_34:

  return v33;
}

- (unint64_t)entityType
{
  return 4;
}

- (void)ensureRelativeAlarmWithStartDate:(id)a3
{
  if (self->_triggerType != 1)
  {
    triggerDate = self->_triggerDate;
    id v5 = a3;
    id v6 = [(VCSDate *)triggerDate components];
    v7 = [v6 date];
    id v8 = [v5 components];

    v9 = [v8 date];
    [v7 timeIntervalSinceDate:v9];
    self->_triggerDuration = v10;

    self->_triggerType = 1;
  }
}

- (id)dictify
{
  v14.receiver = self;
  v14.super_class = (Class)VCSAlarm;
  v3 = [(VCSEntity *)&v14 dictify];
  v4 = (void *)[v3 mutableCopy];

  unint64_t alarmType = self->_alarmType;
  if (alarmType >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid(%lu)", self->_alarmType);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = off_1E6C25020[alarmType];
  }
  [v4 setObject:v6 forKeyedSubscript:@"alarmType"];

  summary = self->_summary;
  if (summary) {
    [v4 setObject:summary forKeyedSubscript:@"alarmSummary"];
  }
  body = self->_body;
  if (body) {
    [v4 setObject:body forKeyedSubscript:@"alarmBody"];
  }
  unint64_t triggerType = self->_triggerType;
  if (triggerType)
  {
    if (triggerType == 1)
    {
      double v10 = @"Relative";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid(%lu)", self->_triggerType);
      double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    double v10 = @"Absolute";
  }
  [v4 setObject:v10 forKeyedSubscript:@"alarmTriggerType"];

  if (self->_triggerType)
  {
    v11 = [NSNumber numberWithDouble:self->_triggerDuration];
    v12 = @"alarmTriggerDuration";
  }
  else
  {
    v11 = [(VCSDate *)self->_triggerDate description];
    v12 = @"alarmTriggerDate";
  }
  [v4 setObject:v11 forKeyedSubscript:v12];

  return v4;
}

+ (id)_componentsWithISO8601DurationString:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v17 = 0;
    goto LABEL_44;
  }
  v4 = objc_opt_new();
  id v5 = v3;
  id v6 = (char *)[v5 UTF8String];
  if (!v6)
  {
LABEL_36:
    id v17 = 0;
    goto LABEL_43;
  }
  v7 = v6;
  if (*v6 != 80)
  {
    v18 = VCSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[VCSAlarm _componentsWithISO8601DurationString:]((uint64_t)v5, v18, v19, v20, v21, v22, v23, v24);
    }

    goto LABEL_36;
  }
  id v8 = v6 + 1;
  int v9 = v6[1];
  double v10 = v4;
  if (!v6[1]) {
    goto LABEL_42;
  }
  int v11 = 0;
  while (1)
  {
    __endptr = 0;
    BOOL v12 = v9 == 84;
    if (v9 == 84) {
      v13 = v7 + 2;
    }
    else {
      v13 = v8;
    }
    unsigned int v14 = strtol(v13, &__endptr, 10);
    v7 = __endptr;
    if (v13 == __endptr || (v14 & 0x80000000) != 0)
    {
      v25 = VCSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[VCSAlarm _componentsWithISO8601DurationString:]((uint64_t)v5, v25, v27, v28, v29, v30, v31, v32);
      }
      goto LABEL_41;
    }
    v11 |= v12;
    int v16 = *__endptr;
    if (v11)
    {
      switch(v16)
      {
        case 'S':
          [v4 setSecond:v14];
          break;
        case 'M':
          [v4 setMinute:v14];
          break;
        case 'H':
          [v4 setHour:v14];
          break;
        default:
          goto LABEL_39;
      }
      goto LABEL_30;
    }
    if (v16 > 86) {
      break;
    }
    if (v16 == 68)
    {
      [v4 setDay:v14];
    }
    else
    {
      if (v16 != 77) {
        goto LABEL_39;
      }
      [v4 setMonth:v14];
    }
LABEL_30:
    id v8 = v7 + 1;
    int v9 = v7[1];
    if (!v7[1])
    {
      double v10 = v4;
      goto LABEL_42;
    }
  }
  if (v16 == 87)
  {
    [v4 setWeekOfYear:v14];
    goto LABEL_30;
  }
  if (v16 == 89)
  {
    [v4 setYear:v14];
    goto LABEL_30;
  }
LABEL_39:
  v25 = VCSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    +[VCSAlarm _componentsWithISO8601DurationString:]((uint64_t)v5, v25, v33, v34, v35, v36, v37, v38);
  }
LABEL_41:

  double v10 = 0;
LABEL_42:
  id v17 = v10;
LABEL_43:

LABEL_44:
  return v17;
}

- (unint64_t)alarmType
{
  return self->_alarmType;
}

- (NSString)summary
{
  return self->_summary;
}

- (NSString)body
{
  return self->_body;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (VCSDate)triggerDate
{
  return self->_triggerDate;
}

- (double)triggerDuration
{
  return self->_triggerDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

+ (void)_componentsWithISO8601DurationString:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_componentsWithISO8601DurationString:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_componentsWithISO8601DurationString:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end