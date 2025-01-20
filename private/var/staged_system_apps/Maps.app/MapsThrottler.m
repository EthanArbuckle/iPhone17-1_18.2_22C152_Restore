@interface MapsThrottler
- (MapsThrottler)initWithInitialValue:(id)a3 throttlingInterval:(double)a4 queue:(id)a5 updateHandler:(id)a6;
- (NSDate)valueTimestamp;
- (OS_dispatch_queue)queue;
- (double)throttlingInterval;
- (id)description;
- (id)updateHandler;
- (id)value;
- (void)_dispatchIfNeeded;
- (void)_run;
- (void)setValue:(id)a3;
@end

@implementation MapsThrottler

- (MapsThrottler)initWithInitialValue:(id)a3 throttlingInterval:(double)a4 queue:(id)a5 updateHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MapsThrottler;
  v14 = [(MapsThrottler *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->_value, a3);
    v15->_throttlingInterval = fmax(a4, 0.0);
    objc_storeStrong((id *)&v15->_queue, a5);
    id v16 = objc_retainBlock(v13);
    id updateHandler = v15->_updateHandler;
    v15->_id updateHandler = v16;

    uint64_t v18 = geo_isolater_create();
    isolator = v15->_isolator;
    v15->_isolator = (geo_isolater *)v18;
  }
  return v15;
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100103EEC;
  v33 = sub_100104800;
  id v34 = 0;
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_100048E38;
  v26 = &unk_1012E73F0;
  v27 = self;
  v28 = &v29;
  geo_isolate_sync();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100097924;
  v18[3] = &unk_1012F7790;
  objc_copyWeak(&v19, &location);
  v18[4] = self;
  v18[5] = v21;
  v3 = objc_retainBlock(v18);
  v4 = sub_10008F544();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(MapsThrottler *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ([v8 isEqualToString:v7] & 1) == 0)
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

LABEL_7:
        id v11 = v10;
        id v12 = (id)v30[5];
        if (!v12)
        {
          v17 = @"<nil>";
          goto LABEL_15;
        }
        id v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        if (objc_opt_respondsToSelector())
        {
          v15 = [v12 performSelector:"accessibilityIdentifier"];
          id v16 = v15;
          if (v15 && ([v15 isEqualToString:v14] & 1) == 0)
          {
            v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

            goto LABEL_13;
          }
        }
        v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_13:

LABEL_15:
        *(_DWORD *)buf = 138543618;
        id v36 = v11;
        __int16 v37 = 2114;
        v38 = v17;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] calling update handler with value %{public}@", buf, 0x16u);

        goto LABEL_16;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
    goto LABEL_7;
  }
LABEL_16:

  (*((void (**)(void))self->_updateHandler + 2))();
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v29, 8);
}

- (void)_dispatchIfNeeded
{
  geo_assert_isolated();
  if (!self->_valueChangedSinceLastUpdateStarted || self->_dispatched || self->_running)
  {
    v3 = sub_10008F544();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
LABEL_17:

      return;
    }
    v4 = self;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(MapsThrottler *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_10;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_10:

    if (v4->_dispatched) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    id v11 = v10;
    if (v4->_running) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    id v13 = v12;
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v9;
    __int16 v30 = 2114;
    double v31 = *(double *)&v11;
    __int16 v32 = 2114;
    v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] will not dispatch (dispatched: %{public}@, running: %{public}@)", buf, 0x20u);

    goto LABEL_17;
  }
  if (self->_lastUpdateStartedDate)
  {
    v14 = +[NSDate date];
    [v14 timeIntervalSinceDate:self->_lastUpdateStartedDate];
    double v16 = fmax(self->_throttlingInterval - v15, 0.0);
  }
  else
  {
    double v16 = 0.0;
  }
  v17 = sub_10008F544();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = self;
    id v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    if (objc_opt_respondsToSelector())
    {
      objc_super v21 = [(MapsThrottler *)v18 performSelector:"accessibilityIdentifier"];
      char v22 = v21;
      if (v21 && ![v21 isEqualToString:v20])
      {
        v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

        goto LABEL_28;
      }
    }
    v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_28:

    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v23;
    __int16 v30 = 2048;
    double v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] will dispatch after %#.2lfs", buf, 0x16u);
  }
  self->_dispatched = 1;
  objc_initWeak((id *)buf, self);
  dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E80C;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v27, (id *)buf);
  dispatch_after(v24, queue, block);
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (id)value
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_100103EEC;
  v8 = sub_100104800;
  id v9 = 0;
  geo_isolate_sync_data();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)MapsThrottler;
  id v3 = [(MapsThrottler *)&v14 description];
  double throttlingInterval = self->_throttlingInterval;
  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
  id v6 = self->_value;
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_7;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_7:

    goto LABEL_9;
  }
  id v11 = @"<nil>";
LABEL_9:

  id v12 = +[NSString stringWithFormat:@"%@ (interval: %#.2lfs, queue: %s, value: %@)", v3, *(void *)&throttlingInterval, label, v11];

  return v12;
}

- (NSDate)valueTimestamp
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_100103EEC;
  v8 = sub_100104800;
  id v9 = 0;
  geo_isolate_sync_data();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSDate *)v2;
}

- (double)throttlingInterval
{
  return self->_throttlingInterval;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastUpdateStartedDate, 0);
  objc_storeStrong((id *)&self->_valueTimestamp, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_isolator, 0);
}

@end