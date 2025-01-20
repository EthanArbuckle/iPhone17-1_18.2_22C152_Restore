@interface VIOSessionAnalyticsEntry
- (BOOL)isComplete;
- (GEOMarcoLiteUsageState)usageState;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)exitReason;
- (NSNumber)value;
- (VIOSessionAnalyticsEntry)initWithUsageType:(int)a3 value:(id)a4;
- (double)totalTime;
- (id)description;
- (int)usageType;
- (void)completeEntryWithReason:(int)a3;
- (void)setEndDate:(id)a3;
- (void)setExitReason:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation VIOSessionAnalyticsEntry

- (VIOSessionAnalyticsEntry)initWithUsageType:(int)a3 value:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VIOSessionAnalyticsEntry;
  v8 = [(VIOSessionAnalyticsEntry *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_usageType = a3;
    objc_storeStrong((id *)&v8->_value, a4);
    uint64_t v10 = +[NSDate date];
    startDate = v9->_startDate;
    v9->_startDate = (NSDate *)v10;
  }
  return v9;
}

- (BOOL)isComplete
{
  return self->_endDate != 0;
}

- (void)completeEntryWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VIOSessionAnalyticsEntry *)self isComplete])
  {
    v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315906;
      objc_super v13 = "-[VIOSessionAnalyticsEntry completeEntryWithReason:]";
      __int16 v14 = 2080;
      v15 = "VIOSessionAnalyticsEntry.m";
      __int16 v16 = 1024;
      int v17 = 48;
      __int16 v18 = 2080;
      v19 = "!self.isComplete";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = +[NSThread callStackSymbols];
        int v12 = 138412290;
        objc_super v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  if (![(VIOSessionAnalyticsEntry *)self isComplete])
  {
    v5 = +[NSDate date];
    endDate = self->_endDate;
    self->_endDate = v5;

    id v7 = +[NSNumber numberWithInt:v3];
    exitReason = self->_exitReason;
    self->_exitReason = v7;
  }
}

- (double)totalTime
{
  [(NSDate *)self->_endDate timeIntervalSinceDate:self->_startDate];
  return result;
}

- (GEOMarcoLiteUsageState)usageState
{
  if (![(VIOSessionAnalyticsEntry *)self isComplete])
  {
    uint64_t v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      __int16 v14 = "-[VIOSessionAnalyticsEntry usageState]";
      __int16 v15 = 2080;
      __int16 v16 = "VIOSessionAnalyticsEntry.m";
      __int16 v17 = 1024;
      int v18 = 64;
      __int16 v19 = 2080;
      v20 = "self.isComplete";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v13, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = +[NSThread callStackSymbols];
        int v13 = 138412290;
        __int16 v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  uint64_t v3 = objc_opt_new();
  [v3 setStateType:[self usageType]];
  [(VIOSessionAnalyticsEntry *)self totalTime];
  LODWORD(v5) = vcvtpd_u64_f64(v4);
  [v3 setStateTime:v5];
  v6 = [(VIOSessionAnalyticsEntry *)self value];

  if (v6)
  {
    id v7 = [(VIOSessionAnalyticsEntry *)self value];
    [v3 setStateValue:[v7 unsignedIntegerValue]];
  }
  v8 = [(VIOSessionAnalyticsEntry *)self exitReason];
  [v3 setStateExitReason:[v8 integerValue]];

  return (GEOMarcoLiteUsageState *)v3;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  uint64_t usageType = self->_usageType;
  if (usageType >= 0x1A)
  {
    v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_usageType];
  }
  else
  {
    v6 = off_101322718[usageType];
  }
  exitReason = self->_exitReason;
  if (exitReason)
  {
    NSInteger v8 = [(NSNumber *)self->_exitReason integerValue];
    if (v8 >= 0x1A)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
    }
    else
    {
      v9 = off_101322718[(int)v8];
    }
  }
  else
  {
    v9 = @"none";
  }
  startDate = self->_startDate;
  value = self->_value;
  endDate = self->_endDate;
  [(VIOSessionAnalyticsEntry *)self totalTime];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p: type: %@ exit: %@ value: %@ from: %@ to: %@; total: %f>",
    v4,
    self,
    v6,
    v9,
    value,
    startDate,
    endDate,
  __int16 v14 = v13);
  if (exitReason) {

  }
  return v14;
}

- (int)usageType
{
  return self->_usageType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSNumber)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReason, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end