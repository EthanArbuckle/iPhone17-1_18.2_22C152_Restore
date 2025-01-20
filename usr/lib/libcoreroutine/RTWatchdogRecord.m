@interface RTWatchdogRecord
- (BOOL)isPendingCheckIn;
- (NSDate)checkInStartDate;
- (NSDate)checkInStopDate;
- (RTWatchdogProtocol)object;
- (RTWatchdogRecord)init;
- (RTWatchdogRecord)initWithObject:(id)a3 timeout:(double)a4;
- (double)getLatency;
- (double)timeout;
- (id)description;
- (void)setCheckInStartDate:(id)a3;
- (void)setCheckInStopDate:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation RTWatchdogRecord

- (RTWatchdogRecord)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithObject_timeout_);
}

- (RTWatchdogRecord)initWithObject:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  if (!v6)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v13 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: object";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (a4 <= 0.0)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: timeout > 0";
    goto LABEL_12;
  }
  v17.receiver = self;
  v17.super_class = (Class)RTWatchdogRecord;
  v7 = [(RTWatchdogRecord *)&v17 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_object, v6);
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    checkInStartDate = v8->_checkInStartDate;
    v8->_checkInStartDate = (NSDate *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantPast];
    checkInStopDate = v8->_checkInStopDate;
    v8->_checkInStopDate = (NSDate *)v11;

    v8->_timeout = a4;
  }
  self = v8;
  v13 = self;
LABEL_10:

  return v13;
}

- (double)getLatency
{
  checkInStopDate = self->_checkInStopDate;
  if (checkInStopDate)
  {
    checkInStartDate = self->_checkInStartDate;
    [(NSDate *)checkInStopDate timeIntervalSinceDate:checkInStartDate];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSinceDate:self->_checkInStartDate];
    double v8 = v7;

    return v8;
  }
  return result;
}

- (BOOL)isPendingCheckIn
{
  return self->_checkInStartDate && self->_checkInStopDate == 0;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = NSString;
  v5 = [(RTWatchdogRecord *)self object];
  id v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  double v8 = [(RTWatchdogRecord *)self checkInStartDate];
  uint64_t v9 = [v3 stringFromDate:v8];
  v10 = [(RTWatchdogRecord *)self checkInStopDate];
  uint64_t v11 = [v3 stringFromDate:v10];
  [(RTWatchdogRecord *)self timeout];
  uint64_t v13 = v12;
  [(RTWatchdogRecord *)self getLatency];
  v15 = [v4 stringWithFormat:@"object, %@, start, %@, stop, %@, timeout, %f, latency, %f", v7, v9, v11, v13, v14];

  return v15;
}

- (RTWatchdogProtocol)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  return (RTWatchdogProtocol *)WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (NSDate)checkInStartDate
{
  return self->_checkInStartDate;
}

- (void)setCheckInStartDate:(id)a3
{
}

- (NSDate)checkInStopDate
{
  return self->_checkInStopDate;
}

- (void)setCheckInStopDate:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkInStopDate, 0);
  objc_storeStrong((id *)&self->_checkInStartDate, 0);

  objc_destroyWeak((id *)&self->_object);
}

@end