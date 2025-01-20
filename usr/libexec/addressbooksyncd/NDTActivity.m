@interface NDTActivity
- (BOOL)criteriaOnConnection;
- (NDTActivity)initWithDelegate:(id)a3;
- (NDTActivityDelegate)delegate;
- (NSCondition)activityCondition;
- (NSDate)estimatedFireDate;
- (NSDate)lastFired;
- (OS_dispatch_source)deferPollingSource;
- (OS_os_log)log;
- (OS_os_transaction)waitingForCheckin;
- (OS_xpc_object)activity;
- (id)_currentCriteria;
- (int64_t)criteriaDelay;
- (void)_activityComplete;
- (void)_checkIn;
- (void)_setActivity:(id)a3;
- (void)_setState:(int64_t)a3;
- (void)_startDeferralPolling;
- (void)_stopDeferralPolling;
- (void)completeAndFireIn:(int64_t)a3;
- (void)completeAndFireNever;
- (void)completeAndFireOnConnection;
- (void)setActivity:(id)a3;
- (void)setActivityCondition:(id)a3;
- (void)setCriteriaDelay:(int64_t)a3;
- (void)setCriteriaOnConnection:(BOOL)a3;
- (void)setDeferPollingSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEstimatedFireDate:(id)a3;
- (void)setLastFired:(id)a3;
- (void)setLog:(id)a3;
- (void)setWaitingForCheckin:(id)a3;
@end

@implementation NDTActivity

- (NDTActivity)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NDTActivity;
  v5 = [(NDTActivity *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(NDTActivity *)v5 setDelegate:v4];
    id v7 = objc_alloc_init((Class)NSCondition);
    [(NDTActivity *)v6 setActivityCondition:v7];

    os_log_t v8 = os_log_create((const char *)[v4 activitySubsystem:v6], "xpc_activity");
    [(NDTActivity *)v6 setLog:v8];

    [(NDTActivity *)v6 setCriteriaDelay:-1];
    [(NDTActivity *)v6 setCriteriaOnConnection:0];
    [(NDTActivity *)v6 _checkIn];
  }

  return v6;
}

- (OS_xpc_object)activity
{
  v3 = [(NDTActivity *)self activityCondition];
  [v3 lock];
  while (1)
  {

    if (self->_activity) {
      break;
    }
    v3 = [(NDTActivity *)self activityCondition];
    [v3 wait];
  }
  id v4 = [(NDTActivity *)self activityCondition];
  [v4 unlock];

  activity = self->_activity;

  return activity;
}

- (void)_setActivity:(id)a3
{
}

- (void)_checkIn
{
  v3 = [(NDTActivity *)self delegate];
  objc_initWeak(&location, self);
  id v4 = (const char *)[v3 activityIdentifier:self];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000CF1C;
  handler[3] = &unk_100054EC0;
  objc_copyWeak(&v8, &location);
  id v5 = v3;
  id v7 = v5;
  xpc_activity_register(v4, XPC_ACTIVITY_CHECK_IN, handler);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_currentCriteria
{
  if ([(NDTActivity *)self criteriaDelay] == -1
    && ![(NDTActivity *)self criteriaOnConnection])
  {
    xpc_object_t v5 = 0;
  }
  else
  {
    v3 = [(NDTActivity *)self delegate];
    id v4 = [(NDTActivity *)self activity];
    xpc_object_t v5 = xpc_activity_copy_criteria(v4);

    if (!v5) {
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    }
    xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_GRACE_PERIOD, 10);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_INTERVAL, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, [(NDTActivity *)self criteriaOnConnection]);
    if (![(NDTActivity *)self criteriaOnConnection]) {
      xpc_dictionary_set_int64(v5, XPC_ACTIVITY_DELAY, [(NDTActivity *)self criteriaDelay]);
    }
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v3 activity:self customizeCriteria:v5];
    }
  }

  return v5;
}

- (void)completeAndFireIn:(int64_t)a3
{
  xpc_object_t v5 = [(NDTActivity *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    LODWORD(v14) = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "completeAndFireIn: %d", (uint8_t *)&v13, 8u);
  }

  v6 = (void *)os_transaction_create();
  [(NDTActivity *)self setWaitingForCheckin:v6];

  id v7 = +[NSDate dateWithTimeIntervalSinceNow:(double)a3];
  id v8 = [(NDTActivity *)self estimatedFireDate];
  [(NDTActivity *)self setEstimatedFireDate:0];
  [(NDTActivity *)self _activityComplete];
  if (!v8 || [v7 compare:v8] == (id)-1)
  {
    v12 = [(NDTActivity *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109120;
      LODWORD(v14) = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "fireIn: %d", (uint8_t *)&v13, 8u);
    }

    [(NDTActivity *)self setCriteriaOnConnection:0];
    [(NDTActivity *)self setCriteriaDelay:a3];
    [(NDTActivity *)self setEstimatedFireDate:v7];
    [(NDTActivity *)self _checkIn];
  }
  else
  {
    [v8 timeIntervalSinceNow];
    uint64_t v10 = v9;
    v11 = [(NDTActivity *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      uint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "fireIn request disregarded for previous scheduled timer (%0.2f to go)", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)completeAndFireOnConnection
{
  v3 = [(NDTActivity *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "completeAndFireOnConnection", v6, 2u);
  }

  id v4 = (void *)os_transaction_create();
  [(NDTActivity *)self setWaitingForCheckin:v4];

  [(NDTActivity *)self setEstimatedFireDate:0];
  [(NDTActivity *)self _activityComplete];
  [(NDTActivity *)self setCriteriaOnConnection:1];
  [(NDTActivity *)self setCriteriaDelay:0];
  [(NDTActivity *)self _checkIn];
  xpc_object_t v5 = +[NSDate date];
  [(NDTActivity *)self setEstimatedFireDate:v5];
}

- (void)completeAndFireNever
{
  v3 = [(NDTActivity *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "completeAndFireNever", v4, 2u);
  }

  [(NDTActivity *)self _activityComplete];
}

- (void)_setState:(int64_t)a3
{
  if (self->_activity)
  {
    xpc_object_t v5 = [(NDTActivity *)self activity];
    BOOL v6 = xpc_activity_set_state(v5, a3);

    id v7 = [(NDTActivity *)self log];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        if ((unint64_t)a3 <= 5) {
          uint64_t v9 = (&off_100054EE0)[a3];
        }
        else {
          uint64_t v9 = "OUT_OF_BOUNDS";
        }
        int v12 = 136315138;
        int v13 = v9;
        v11 = "Set activity state to %s";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);
      }
    }
    else if (v8)
    {
      if ((unint64_t)a3 <= 5) {
        uint64_t v10 = (&off_100054EE0)[a3];
      }
      else {
        uint64_t v10 = "OUT_OF_BOUNDS";
      }
      int v12 = 136315138;
      int v13 = v10;
      v11 = "Failed to set activity state to %s";
      goto LABEL_13;
    }
  }
}

- (void)_activityComplete
{
  v3 = [(NDTActivity *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_activityComplete", v4, 2u);
  }

  [(NDTActivity *)self _stopDeferralPolling];
  [(NDTActivity *)self _setState:5];
  [(NDTActivity *)self setEstimatedFireDate:0];
}

- (void)_startDeferralPolling
{
  [(NDTActivity *)self _stopDeferralPolling];
  v3 = dispatch_get_global_queue(17, 0);
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  deferPollingSource = self->_deferPollingSource;
  self->_deferPollingSource = v4;

  objc_initWeak(&location, self);
  BOOL v6 = self->_deferPollingSource;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D9E4;
  v9[3] = &unk_100054E20;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v6, v9);
  id v7 = self->_deferPollingSource;
  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer(v7, v8, 0xB2D05E00uLL, 0);
  dispatch_activate((dispatch_object_t)self->_deferPollingSource);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_stopDeferralPolling
{
  deferPollingSource = self->_deferPollingSource;
  if (deferPollingSource)
  {
    dispatch_source_cancel(deferPollingSource);
    id v4 = self->_deferPollingSource;
    self->_deferPollingSource = 0;
  }
}

- (NDTActivityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NDTActivityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)lastFired
{
  return self->_lastFired;
}

- (void)setLastFired:(id)a3
{
}

- (OS_os_transaction)waitingForCheckin
{
  return self->_waitingForCheckin;
}

- (void)setWaitingForCheckin:(id)a3
{
}

- (NSCondition)activityCondition
{
  return self->_activityCondition;
}

- (void)setActivityCondition:(id)a3
{
}

- (void)setActivity:(id)a3
{
}

- (NSDate)estimatedFireDate
{
  return self->_estimatedFireDate;
}

- (void)setEstimatedFireDate:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int64_t)criteriaDelay
{
  return self->_criteriaDelay;
}

- (void)setCriteriaDelay:(int64_t)a3
{
  self->_criteriaDelay = a3;
}

- (BOOL)criteriaOnConnection
{
  return self->_criteriaOnConnection;
}

- (void)setCriteriaOnConnection:(BOOL)a3
{
  self->_criteriaOnConnection = a3;
}

- (OS_dispatch_source)deferPollingSource
{
  return self->_deferPollingSource;
}

- (void)setDeferPollingSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferPollingSource, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_estimatedFireDate, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_activityCondition, 0);
  objc_storeStrong((id *)&self->_waitingForCheckin, 0);
  objc_storeStrong((id *)&self->_lastFired, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end