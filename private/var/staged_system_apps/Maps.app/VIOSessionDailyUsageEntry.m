@interface VIOSessionDailyUsageEntry
+ (BOOL)supportsSecureCoding;
+ (id)loadOrCreateEntry;
+ (void)clearEntry;
- (BOOL)isOld;
- (BOOL)isRunningVIO;
- (NSDate)creationDate;
- (NSDate)lastStartDate;
- (VIOSessionDailyUsageEntry)init;
- (VIOSessionDailyUsageEntry)initWithCoder:(id)a3;
- (double)currentUsage;
- (double)dailyUsageLimit;
- (double)timeMultiplier;
- (double)timeRemaining;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)save;
- (void)setCurrentUsage:(double)a3;
- (void)setIsRunningVIO:(BOOL)a3;
- (void)setLastStartDate:(id)a3;
- (void)updateCreationDate:(id)a3;
@end

@implementation VIOSessionDailyUsageEntry

+ (id)loadOrCreateEntry
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 dataForKey:@"kVIOSessionDailyUsageEntryUserDefaultsKey"];

  if (!v3) {
    goto LABEL_12;
  }
  id v27 = 0;
  v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v27];
  id v5 = v27;
  if (v5)
  {
    v6 = v5;
    v7 = sub_100D058D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error loading last entry: %@; creating a new one",
        buf,
        0xCu);
    }

    uint64_t v8 = objc_opt_new();
LABEL_6:
    v4 = (void *)v8;
LABEL_15:
    [v4 save];
    goto LABEL_16;
  }
  if (!v4)
  {
LABEL_12:
    v10 = sub_100D058D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Entry is nil; creating a new one", buf, 2u);
    }

    v4 = objc_opt_new();
    v6 = 0;
    goto LABEL_15;
  }
  if ([v4 isOld])
  {
    v9 = sub_100D058D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Entry is old (%@); creating a new one",
        buf,
        0xCu);
    }

    uint64_t v8 = objc_opt_new();
    v6 = 0;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_16:
  v11 = [v4 lastStartDate];

  if (v11)
  {
    v12 = sub_100D058D4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [v4 lastStartDate];
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Detected last VIO session did not end gracefully; assuming VIO session was running consecutively since %@",
        buf,
        0xCu);
    }
    v14 = +[NSDate date];
    v15 = [v4 lastStartDate];
    [v14 timeIntervalSinceDate:v15];
    double v17 = v16;
    [v4 timeMultiplier];
    double v19 = v18;
    [v4 currentUsage];
    [v4 setCurrentUsage:v20 + v17 * v19];

    [v4 currentUsage];
    double v21 = 0.0;
    if (v22 > 0.0)
    {
      [v4 currentUsage];
      double v21 = v23;
    }
    [v4 dailyUsageLimit];
    if (v21 >= v24)
    {
      [v4 dailyUsageLimit];
      double v21 = v25;
    }
    [v4 setCurrentUsage:v21];
    [v4 setLastStartDate:0];
    [v4 save];
  }

  return v4;
}

- (void)save
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v7 = 0;
  v4 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v5 = v7;
  [v3 setObject:v4 forKey:@"kVIOSessionDailyUsageEntryUserDefaultsKey"];

  if (v5)
  {
    v6 = sub_100D058D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v9 = self;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error saving entry %@: %@", buf, 0x16u);
    }
  }
}

- (VIOSessionDailyUsageEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)VIOSessionDailyUsageEntry;
  v2 = [(VIOSessionDailyUsageEntry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(VIOSessionDailyUsageEntry *)self creationDate];
  objc_super v6 = [(VIOSessionDailyUsageEntry *)self lastStartDate];
  [(VIOSessionDailyUsageEntry *)self currentUsage];
  uint64_t v8 = v7;
  [(VIOSessionDailyUsageEntry *)self timeRemaining];
  __int16 v10 = +[NSString stringWithFormat:@"<%@ %p: creationDate: %@ lastStartDate: %@ currentUsage: %f timeRemaining: %f>", v4, self, v5, v6, v8, v9];

  return v10;
}

- (double)timeRemaining
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      double v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136316418;
        v26 = "-[VIOSessionDailyUsageEntry timeRemaining]";
        __int16 v27 = 2080;
        v28 = "VIOSessionDailyUsageEntry.m";
        __int16 v29 = 1024;
        int v30 = 89;
        __int16 v31 = 2080;
        v32 = "dispatch_get_main_queue()";
        __int16 v33 = 2080;
        v34 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v35 = 2080;
        v36 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v25,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        double v17 = sub_1005762E4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          double v18 = +[NSThread callStackSymbols];
          int v25 = 138412290;
          v26 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);
        }
      }
    }
  }
  [(VIOSessionDailyUsageEntry *)self dailyUsageLimit];
  double v7 = v6;
  [(VIOSessionDailyUsageEntry *)self currentUsage];
  double v9 = v7 - v8;
  if (v9 < 0.0)
  {
    double v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315906;
      v26 = "-[VIOSessionDailyUsageEntry timeRemaining]";
      __int16 v27 = 2080;
      v28 = "VIOSessionDailyUsageEntry.m";
      __int16 v29 = 1024;
      int v30 = 93;
      __int16 v31 = 2080;
      v32 = "timeRemaining >= 0";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v25, 0x26u);
    }

    if (sub_100BB36BC())
    {
      double v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        double v21 = +[NSThread callStackSymbols];
        int v25 = 138412290;
        v26 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);
      }
    }
  }
  [(VIOSessionDailyUsageEntry *)self dailyUsageLimit];
  if (v9 > v10)
  {
    double v22 = sub_1005762E4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315906;
      v26 = "-[VIOSessionDailyUsageEntry timeRemaining]";
      __int16 v27 = 2080;
      v28 = "VIOSessionDailyUsageEntry.m";
      __int16 v29 = 1024;
      int v30 = 94;
      __int16 v31 = 2080;
      v32 = "timeRemaining <= self.dailyUsageLimit";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v25, 0x26u);
    }

    if (sub_100BB36BC())
    {
      double v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        double v24 = +[NSThread callStackSymbols];
        int v25 = 138412290;
        v26 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);
      }
    }
  }
  if (v9 < 0.0 || ([(VIOSessionDailyUsageEntry *)self dailyUsageLimit], v9 > v11))
  {
    v12 = sub_100D058D4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v25 = 134217984;
      v26 = *(const char **)&v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Detected invalid value for time remaining (%f); clamping",
        (uint8_t *)&v25,
        0xCu);
    }

    double v9 = fmax(v9, 0.0);
    [(VIOSessionDailyUsageEntry *)self dailyUsageLimit];
    if (v9 >= v13)
    {
      [(VIOSessionDailyUsageEntry *)self dailyUsageLimit];
      return v14;
    }
  }
  return v9;
}

- (BOOL)isOld
{
  uint64_t v3 = +[NSCalendar currentCalendar];
  v4 = [(VIOSessionDailyUsageEntry *)self creationDate];
  BOOL v5 = +[NSDate date];
  double v6 = [v3 components:16 fromDate:v4 toDate:v5 options:0];

  id v7 = [v6 day];
  double v8 = sub_100D058D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    double v11 = self;
    __int16 v12 = 2048;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ is %ld day(s) old", (uint8_t *)&v10, 0x16u);
  }

  return v7 != 0;
}

- (double)dailyUsageLimit
{
  GEOConfigGetDouble();
  return result;
}

- (double)timeMultiplier
{
  unsigned int v2 = [(VIOSessionDailyUsageEntry *)self isRunningVIO];
  double result = 1.2;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (void)updateCreationDate:(id)a3
{
}

+ (void)clearEntry
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"kVIOSessionDailyUsageEntryUserDefaultsKey"];
}

- (VIOSessionDailyUsageEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VIOSessionDailyUsageEntry;
  BOOL v5 = [(VIOSessionDailyUsageEntry *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector("creationDate");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    uint64_t v10 = objc_opt_class();
    double v11 = NSStringFromSelector("lastStartDate");
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    lastStartDate = v5->_lastStartDate;
    v5->_lastStartDate = (NSDate *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector("currentUsage");
    double v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    [v16 doubleValue];
    v5->_currentUsage = v17;

    double v18 = NSStringFromSelector("isRunningVIO");
    v5->_isRunningVIO = [v4 decodeBoolForKey:v18];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VIOSessionDailyUsageEntry *)self creationDate];
  uint64_t v6 = NSStringFromSelector("creationDate");
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(VIOSessionDailyUsageEntry *)self lastStartDate];
  uint64_t v8 = NSStringFromSelector("lastStartDate");
  [v4 encodeObject:v7 forKey:v8];

  [(VIOSessionDailyUsageEntry *)self currentUsage];
  double v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v10 = NSStringFromSelector("currentUsage");
  [v4 encodeObject:v9 forKey:v10];

  BOOL v11 = [(VIOSessionDailyUsageEntry *)self isRunningVIO];
  NSStringFromSelector("isRunningVIO");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v11 forKey:v12];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastStartDate
{
  return self->_lastStartDate;
}

- (void)setLastStartDate:(id)a3
{
}

- (double)currentUsage
{
  return self->_currentUsage;
}

- (void)setCurrentUsage:(double)a3
{
  self->_currentUsage = a3;
}

- (BOOL)isRunningVIO
{
  return self->_isRunningVIO;
}

- (void)setIsRunningVIO:(BOOL)a3
{
  self->_isRunningVIO = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStartDate, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end