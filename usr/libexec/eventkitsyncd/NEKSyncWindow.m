@interface NEKSyncWindow
- (BOOL)_eventInWindow:(id)a3 inStore:(id)a4;
- (BOOL)eventInFuture:(id)a3 inStore:(id)a4;
- (BOOL)eventInWindow:(id)a3 inStore:(id)a4;
- (BOOL)reminderInFuture:(id)a3;
- (BOOL)reminderInWindow:(id)a3;
- (BOOL)shouldSyncBasedOnTime:(double)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDate)taskCutoffDate;
- (NSTimeZone)timeZone;
- (double)_getTestWindowEnd;
- (double)_getTestWindowStart;
- (double)_getWindowEnd;
- (double)_getWindowStart;
- (double)_spanNowTime;
- (double)spanEnd;
- (double)spanStart;
- (double)taskCutoff;
- (id)initForFullSync:(BOOL)a3 tinyStore:(id)a4;
- (void)_computeDerived;
- (void)_loadLastSyncWindow;
- (void)_setWindowToNow;
- (void)setEndDate:(id)a3;
- (void)setSpanEnd:(double)a3;
- (void)setSpanStart:(double)a3;
- (void)setStartDate:(id)a3;
- (void)setTaskCutoff:(double)a3;
- (void)setTaskCutoffDate:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation NEKSyncWindow

- (id)initForFullSync:(BOOL)a3 tinyStore:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NEKSyncWindow;
  v8 = [(NEKSyncWindow *)&v20 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_tinyStore, a4);
    v10 = +[SYDevice targetableDevice];
    v11 = [v10 systemBuildVersion];
    id v12 = [@"16A0" compare:v11 options:64];
    double v13 = 30.0;
    if (v12 == (id)1) {
      double v13 = 2.0;
    }
    int32x2_t v14 = vdup_n_s32(v12 == (id)1);
    v15.i64[0] = v14.u32[0];
    v15.i64[1] = v14.u32[1];
    *(int8x16_t *)&v9->_fwdDaysToSync = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v15, 0x3FuLL)), (int8x16_t)xmmword_10009BA30, (int8x16_t)xmmword_10009BA20);
    v9->_dontSyncDays = v13;
    if (v5) {
      [(NEKSyncWindow *)v9 _setWindowToNow];
    }
    else {
      [(NEKSyncWindow *)v9 _loadLastSyncWindow];
    }
    v16 = sub_1000300B4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      startDate = v9->_startDate;
      endDate = v9->_endDate;
      *(_DWORD *)buf = 138543874;
      v22 = startDate;
      __int16 v23 = 2114;
      v24 = endDate;
      __int16 v25 = 1024;
      BOOL v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Window: start: %{public}@ end: %{public}@, isFullSync: %d", buf, 0x1Cu);
    }
  }
  return v9;
}

- (double)_getTestWindowStart
{
  [(NEKTinyStore *)self->_tinyStore getDoubleValueForKey:@"testWindowStart" default:0.0];
  return result;
}

- (double)_getTestWindowEnd
{
  [(NEKTinyStore *)self->_tinyStore getDoubleValueForKey:@"testWindowEnd" default:0.0];
  return result;
}

- (double)_getWindowStart
{
  [(NEKTinyStore *)self->_tinyStore getDoubleValueForKey:@"windowStart" default:0.0];
  return result;
}

- (double)_getWindowEnd
{
  [(NEKTinyStore *)self->_tinyStore getDoubleValueForKey:@"windowEnd" default:0.0];
  return result;
}

- (double)_spanNowTime
{
  return self->_spanStart + self->_revDaysToSync * 24.0 * 3600.0;
}

- (void)_setWindowToNow
{
  [(NEKSyncWindow *)self _getTestWindowStart];
  double v4 = v3;
  double Current = CFAbsoluteTimeGetCurrent();
  if (v4 == 0.0)
  {
    double v7 = Current + self->_revDaysToSync * -24.0 * 3600.0;
    double v8 = self->_fwdDaysToSync * 24.0;
    self->_spanStart = v7;
    self->_spanEnd = Current + v8 * 3600.0;
    [(NEKTinyStore *)self->_tinyStore setDoubleValue:@"windowStart" forKey:v7];
    [(NEKTinyStore *)self->_tinyStore setDoubleValue:@"windowEnd" forKey:self->_spanEnd];
  }
  else
  {
    self->_spanStart = v4;
    [(NEKSyncWindow *)self _getTestWindowEnd];
    self->_spanEnd = v6;
  }

  [(NEKSyncWindow *)self _computeDerived];
}

- (void)_loadLastSyncWindow
{
  [(NEKSyncWindow *)self _getTestWindowStart];
  if (v3 != 0.0)
  {
    self->_spanStart = v3;
    [(NEKSyncWindow *)self _getTestWindowEnd];
    self->_spanEnd = v4;
    goto LABEL_5;
  }
  [(NEKSyncWindow *)self _getWindowStart];
  self->_spanStart = v5;
  [(NEKSyncWindow *)self _getWindowEnd];
  self->_spanEnd = v6;
  if (self->_spanStart != 0.0 && v6 != 0.0)
  {
LABEL_5:
    [(NEKSyncWindow *)self _computeDerived];
    return;
  }
  double v7 = sub_1000300B4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10006E718(v7);
  }

  [(NEKSyncWindow *)self _setWindowToNow];
}

- (void)_computeDerived
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:self->_spanStart];
  [(NEKSyncWindow *)self setStartDate:v4];

  id v5 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:self->_spanEnd];
  [(NEKSyncWindow *)self setEndDate:v5];

  [(NEKSyncWindow *)self _spanNowTime];
  self->_taskCutoff = v6 + -1209600.0;
  id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:self->_taskCutoff];
  [(NEKSyncWindow *)self setTaskCutoffDate:v7];

  double v8 = +[NSTimeZone defaultTimeZone];
  [(NEKSyncWindow *)self setTimeZone:v8];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)eventInWindow:(id)a3 inStore:(id)a4
{
  id v5 = self;
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v5) = [(NEKSyncWindow *)v5 _eventInWindow:v8 inStore:v7];

  os_unfair_lock_unlock(p_lock);
  return (char)v5;
}

- (BOOL)_eventInWindow:(id)a3 inStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v9 = [v8 startDate];
    v10 = [v8 endDate];
    v11 = [(NEKSyncWindow *)self startDate];
    id v12 = [(NEKSyncWindow *)self endDate];
    double v13 = [(NEKSyncWindow *)self timeZone];
    if ([v9 isBefore:v12] && (objc_msgSend(v10, "isAfter:", v11) & 1) != 0
      || [v9 isBefore:v11] && (objc_msgSend(v10, "isAfter:", v12) & 1) != 0
      || ([v7 occurrencesExistInRangeForEvent:v8 startDate:v11 endDate:v12 mustStartInInterval:0 timezone:v13] & 1) != 0)
    {
      char v14 = 1;
    }
    else
    {
      v21 = sub_1000300B4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v8 uniqueId];
        v24 = [v8 eks_debugDesc];
        *(_DWORD *)buf = 138543618;
        BOOL v26 = v22;
        __int16 v27 = 2114;
        v28 = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejected event: %{public}@ %{public}@", buf, 0x16u);
      }
      char v14 = 0;
    }

LABEL_21:
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v9 = [v8 completionDate];
    int64x2_t v15 = [(NEKSyncWindow *)self taskCutoffDate];
    unsigned int v16 = [v9 isBefore:v15];

    if (v16)
    {
      v17 = sub_1000300B4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v8 uniqueId];
        v19 = [v8 eks_debugDesc];
        *(_DWORD *)buf = 138543618;
        BOOL v26 = v18;
        __int16 v27 = 2114;
        v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejected reminder: %{public}@ %{public}@", buf, 0x16u);
      }
    }
    char v14 = v16 ^ 1;
    goto LABEL_21;
  }
  id v8 = sub_1000300B4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v20 = [v6 uniqueId];
    *(_DWORD *)buf = 138543362;
    BOOL v26 = v20;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Accepting unknown entity: %{public}@", buf, 0xCu);
  }
  char v14 = 1;
LABEL_22:

  return v14;
}

- (BOOL)eventInFuture:(id)a3 inStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSDate date];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    id v12 = [v11 endDate];
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;

    if (v14 <= v10)
    {
      __int16 v23 = +[NSDate distantFuture];
      os_unfair_lock_lock(&self->_lock);
      v24 = [(NEKSyncWindow *)self timeZone];
      os_unfair_lock_unlock(&self->_lock);
      unsigned __int8 v15 = [v7 occurrencesExistInRangeForEvent:v11 startDate:v8 endDate:v23 mustStartInInterval:0 timezone:v24];
      if ((v15 & 1) == 0)
      {
        __int16 v25 = sub_1000300B4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v26 = [v11 uniqueId];
          __int16 v27 = [v11 title];
          int v31 = 138543618;
          v32 = v26;
          __int16 v33 = 2112;
          v34 = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "event not in future: %{public}@ \"%@\"", (uint8_t *)&v31, 0x16u);
        }
      }
    }
    else
    {
      unsigned __int8 v15 = 1;
    }

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    unsigned __int8 v15 = 1;
    goto LABEL_15;
  }
  id v16 = v6;
  v17 = [v16 completionDate];
  v18 = v17;
  if (!v17
    || ([v17 timeIntervalSinceReferenceDate],
        double v20 = v19,
        os_unfair_lock_lock(&self->_lock),
        [(NEKSyncWindow *)self taskCutoff],
        double v22 = v21,
        os_unfair_lock_unlock(&self->_lock),
        v20 >= v22))
  {

    goto LABEL_8;
  }
  v29 = sub_1000300B4();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = [v16 uniqueId];
    int v31 = 138543362;
    v32 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "reminder not in future: %{public}@", (uint8_t *)&v31, 0xCu);
  }
  unsigned __int8 v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)reminderInWindow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 completionDate];
  id v6 = [(NEKSyncWindow *)self taskCutoffDate];
  unsigned int v7 = [v5 isBefore:v6];

  if (v7)
  {
    id v8 = sub_1000300B4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = [v4 daCalendarItemUniqueIdentifier];
      double v10 = [v4 eks_debugDesc];
      int v12 = 138543618;
      double v13 = v9;
      __int16 v14 = 2114;
      unsigned __int8 v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rejected reminder: %{public}@ %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v7 ^ 1;
}

- (BOOL)reminderInFuture:(id)a3
{
  id v4 = a3;
  id v5 = [v4 completionDate];
  id v6 = v5;
  if (v5
    && ([v5 timeIntervalSinceReferenceDate],
        double v8 = v7,
        os_unfair_lock_lock(&self->_lock),
        [(NEKSyncWindow *)self taskCutoff],
        double v10 = v9,
        os_unfair_lock_unlock(&self->_lock),
        v8 < v10))
  {
    int v12 = sub_1000300B4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = [v4 daCalendarItemUniqueIdentifier];
      int v15 = 138543362;
      id v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "reminder not in future: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)shouldSyncBasedOnTime:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NEKSyncWindow *)self _spanNowTime];
  BOOL v7 = v6 > a3 || v6 + self->_dontSyncDays * 24.0 * 3600.0 < a3;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (double)spanStart
{
  return self->_spanStart;
}

- (void)setSpanStart:(double)a3
{
  self->_spanStart = a3;
}

- (double)spanEnd
{
  return self->_spanEnd;
}

- (void)setSpanEnd:(double)a3
{
  self->_spanEnd = a3;
}

- (double)taskCutoff
{
  return self->_taskCutoff;
}

- (void)setTaskCutoff:(double)a3
{
  self->_taskCutoff = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSDate)taskCutoffDate
{
  return self->_taskCutoffDate;
}

- (void)setTaskCutoffDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskCutoffDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_tinyStore, 0);
}

@end