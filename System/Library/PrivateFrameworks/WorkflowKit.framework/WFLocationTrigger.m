@interface WFLocationTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)requiresNotification;
+ (BOOL)supportsSecureCoding;
+ (id)timestampDateFormatter;
- (BOOL)hasValidConfiguration;
- (BOOL)isDateWithinTimeRange:(id)a3;
- (CLCircularRegion)region;
- (NSDate)endTime;
- (NSDate)startTime;
- (WFLocationTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setRegion:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation WFLocationTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

- (void)setEndTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setRegion:(id)a3
{
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (WFLocationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFLocationTrigger;
  v5 = [(WFTrigger *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v6 = (void *)getCLCircularRegionClass_softClass;
    uint64_t v21 = getCLCircularRegionClass_softClass;
    if (!getCLCircularRegionClass_softClass)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __getCLCircularRegionClass_block_invoke;
      v17[3] = &unk_1E6558B78;
      v17[4] = &v18;
      __getCLCircularRegionClass_block_invoke((uint64_t)v17);
      v6 = (void *)v19[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v18, 8);
    v8 = [v4 decodeObjectOfClass:v7 forKey:@"region"];
    [(WFLocationTrigger *)v5 setRegion:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
    [(WFLocationTrigger *)v5 setStartTime:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
    [(WFLocationTrigger *)v5 setEndTime:v10];

    v11 = objc_opt_class();
    if ([v11 isSubclassOfClass:objc_opt_class()])
    {
      v12 = [(WFLocationTrigger *)v5 region];
      [v12 setNotifyOnEntry:1];
    }
    else
    {
      v13 = objc_opt_class();
      if (![v13 isSubclassOfClass:objc_opt_class()])
      {
LABEL_9:
        v14 = v5;
        goto LABEL_10;
      }
      v12 = [(WFLocationTrigger *)v5 region];
      [v12 setNotifyOnExit:1];
    }

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFLocationTrigger;
  id v4 = a3;
  [(WFTrigger *)&v8 encodeWithCoder:v4];
  v5 = [(WFLocationTrigger *)self region];
  [v4 encodeObject:v5 forKey:@"region"];

  v6 = [(WFLocationTrigger *)self startTime];
  [v4 encodeObject:v6 forKey:@"startTime"];

  id v7 = [(WFLocationTrigger *)self endTime];
  [v4 encodeObject:v7 forKey:@"endTime"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WFLocationTrigger;
  id v4 = [(WFTrigger *)&v12 copyWithZone:a3];
  v5 = [(WFLocationTrigger *)self region];
  v6 = (void *)[v5 copy];
  [v4 setRegion:v6];

  id v7 = [(WFLocationTrigger *)self startTime];
  objc_super v8 = (void *)[v7 copy];
  [v4 setStartTime:v8];

  v9 = [(WFLocationTrigger *)self endTime];
  v10 = (void *)[v9 copy];
  [v4 setEndTime:v10];

  return v4;
}

- (BOOL)isDateWithinTimeRange:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [(WFLocationTrigger *)self startTime];
  id v7 = [v5 components:96 fromDate:v6];

  objc_super v8 = objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v7, "hour"), objc_msgSend(v7, "minute"), 0, v4, 0);
  v9 = [(WFLocationTrigger *)self endTime];
  v10 = [v5 components:96 fromDate:v9];

  uint64_t v11 = objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v10, "hour"), objc_msgSend(v10, "minute"), 0, v4, 0);
  objc_super v12 = (void *)v11;
  if (v8) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v14 = [NSString stringWithFormat:@"Failed to calculate todayStart (%@) or todayEnd (%@) times", v8, v11];
    v15 = getWFTriggersLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[WFLocationTrigger isDateWithinTimeRange:]";
      __int16 v28 = 2114;
      v29 = v14;
      objc_super v16 = "%s %{public}@";
      v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 22;
LABEL_8:
      _os_log_impl(&dword_1C7F0A000, v17, v18, v16, buf, v19);
    }
  }
  else
  {
    if ([v8 isEqualToDate:v11])
    {
      v23 = [v5 components:96 fromDate:v4];
      uint64_t v24 = [(WFLocationTrigger *)self startTime];
      v25 = [v5 components:96 fromDate:v24];

      LOBYTE(v24) = [v23 isEqual:v25];
      if (v24)
      {
        BOOL v20 = 1;
        goto LABEL_12;
      }
    }
    if ([v8 compare:v12] != -1)
    {
      v14 = getWFTriggersLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "-[WFLocationTrigger isDateWithinTimeRange:]";
        __int16 v28 = 2114;
        v29 = v8;
        __int16 v30 = 2114;
        v31 = v12;
        _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_FAULT, "%s Today start %{public}@ should not be after today end %{public}@", buf, 0x20u);
      }
      goto LABEL_10;
    }
    v14 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v12];
    if ([v14 containsDate:v4])
    {
      BOOL v20 = 1;
      goto LABEL_11;
    }
    v15 = getWFTriggersLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFLocationTrigger isDateWithinTimeRange:]";
      objc_super v16 = "%s Not running location trigger due to start/end time";
      v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
      uint32_t v19 = 12;
      goto LABEL_8;
    }
  }

LABEL_10:
  BOOL v20 = 0;
LABEL_11:

LABEL_12:
  return v20;
}

- (BOOL)hasValidConfiguration
{
  v3 = [(WFLocationTrigger *)self region];
  if (v3)
  {
    id v4 = [(WFLocationTrigger *)self startTime];
    if (v4)
    {
      v5 = [(WFLocationTrigger *)self startTime];
      v6 = [(WFLocationTrigger *)self endTime];
      BOOL v7 = [v5 compare:v6] != 1;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)timestampDateFormatter
{
  if (timestampDateFormatter_onceToken != -1) {
    dispatch_once(&timestampDateFormatter_onceToken, &__block_literal_global_40587);
  }
  v2 = (void *)timestampDateFormatter_dateFormatter;
  return v2;
}

uint64_t __43__WFLocationTrigger_timestampDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)timestampDateFormatter_dateFormatter;
  timestampDateFormatter_dateFormatter = (uint64_t)v0;

  [(id)timestampDateFormatter_dateFormatter setDateStyle:0];
  v2 = (void *)timestampDateFormatter_dateFormatter;
  return [v2 setTimeStyle:1];
}

+ (BOOL)requiresNotification
{
  return 1;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

@end