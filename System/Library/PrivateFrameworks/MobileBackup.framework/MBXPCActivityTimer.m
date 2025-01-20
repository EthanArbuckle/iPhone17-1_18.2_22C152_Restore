@interface MBXPCActivityTimer
- (MBXPCActivityTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9;
- (MBXPCActivityTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (MBXPCActivityTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (MBXPCActivityTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9;
- (MBXPCActivityTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (MBXPCActivityTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (NSDate)date;
- (NSString)name;
- (OS_xpc_object)activity;
- (double)gracePeriod;
- (id)activityHandler;
- (id)block;
- (id)criteria;
- (id)description;
- (int64_t)priority;
- (unint64_t)cadence;
- (unint64_t)options;
- (void)handleActivity;
- (void)invalidate;
- (void)setActivity:(id)a3;
- (void)setBlock:(id)a3;
- (void)setCadence:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setGracePeriod:(double)a3;
- (void)setName:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation MBXPCActivityTimer

- (MBXPCActivityTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  [v15 timeIntervalSinceNow];
  v18 = [(MBXPCActivityTimer *)self initWithName:v16 date:v15 gracePeriod:(unint64_t)v17 cadence:a6 priority:a7 options:v14 block:a5];

  return v18;
}

- (MBXPCActivityTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)MBXPCActivityTimer;
  v19 = [(MBXPCActivityTimer *)&v22 init];
  v20 = v19;
  if (v19)
  {
    [(MBXPCActivityTimer *)v19 setName:v16];
    [(MBXPCActivityTimer *)v20 setDate:v17];
    [(MBXPCActivityTimer *)v20 setGracePeriod:a5];
    [(MBXPCActivityTimer *)v20 setPriority:a7];
    [(MBXPCActivityTimer *)v20 setOptions:a8];
    [(MBXPCActivityTimer *)v20 setCadence:a6 & ((uint64_t)([(MBXPCActivityTimer *)v20 options] << 50) >> 63)];
    [(MBXPCActivityTimer *)v20 setBlock:v18];
    [(MBXPCActivityTimer *)v20 handleActivity];
  }

  return v20;
}

- (MBXPCActivityTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9
{
  id v16 = a9;
  id v17 = a3;
  id v18 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  v19 = [(MBXPCActivityTimer *)self initWithName:v17 date:v18 gracePeriod:a6 cadence:a7 priority:a8 options:v16 block:a5];

  return v19;
}

- (MBXPCActivityTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  return [(MBXPCActivityTimer *)self initWithName:a3 date:a4 gracePeriod:a5 priority:a6 options:a7 block:0.0];
}

- (MBXPCActivityTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = a8;
  id v15 = a3;
  id v16 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  id v17 = [(MBXPCActivityTimer *)self initWithName:v15 date:v16 gracePeriod:a6 priority:a7 options:v14 block:a5];

  return v17;
}

- (MBXPCActivityTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  id v15 = [(MBXPCActivityTimer *)self initWithName:v13 date:v14 gracePeriod:a5 priority:a6 options:v12 block:0.0];

  return v15;
}

- (id)description
{
  v3 = [(MBXPCActivityTimer *)self name];
  v4 = [(MBXPCActivityTimer *)self criteria];
  v5 = +[NSString stringWithFormat:@"MB XPC Activity: %@, %@", v3, v4];

  return v5;
}

- (id)criteria
{
  v3 = [(MBXPCActivityTimer *)self date];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  double v6 = 0.0;
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  int64_t v7 = (uint64_t)v6;
  [(MBXPCActivityTimer *)self gracePeriod];
  int64_t v9 = (uint64_t)v8;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REPEATING, ([(MBXPCActivityTimer *)self options] & 0x2000) != 0);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, v7);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_GRACE_PERIOD, v9);
  int64_t v11 = [(MBXPCActivityTimer *)self priority];
  id v12 = (const char **)&XPC_ACTIVITY_PRIORITY_UTILITY;
  if (v11 != 1) {
    id v12 = (const char **)&XPC_ACTIVITY_PRIORITY_MAINTENANCE;
  }
  xpc_dictionary_set_string(v10, XPC_ACTIVITY_PRIORITY, *v12);
  uint64_t v13 = [(MBXPCActivityTimer *)self cadence];
  if (v13 <= 3599)
  {
    if (v13 <= 299)
    {
      if (!v13) {
        goto LABEL_31;
      }
      if (v13 == 60)
      {
        id v14 = XPC_ACTIVITY_INTERVAL;
        id v15 = &XPC_ACTIVITY_INTERVAL_1_MIN;
        goto LABEL_29;
      }
    }
    else
    {
      switch(v13)
      {
        case 300:
          id v14 = XPC_ACTIVITY_INTERVAL;
          id v15 = &XPC_ACTIVITY_INTERVAL_5_MIN;
          goto LABEL_29;
        case 900:
          id v14 = XPC_ACTIVITY_INTERVAL;
          id v15 = &XPC_ACTIVITY_INTERVAL_15_MIN;
          goto LABEL_29;
        case 1800:
          id v14 = XPC_ACTIVITY_INTERVAL;
          id v15 = &XPC_ACTIVITY_INTERVAL_30_MIN;
          goto LABEL_29;
      }
    }
  }
  else if (v13 > 86399)
  {
    switch(v13)
    {
      case 86400:
        id v14 = XPC_ACTIVITY_INTERVAL;
        id v15 = &XPC_ACTIVITY_INTERVAL_1_DAY;
        goto LABEL_29;
      case 604800:
        id v14 = XPC_ACTIVITY_INTERVAL;
        id v15 = &XPC_ACTIVITY_INTERVAL_7_DAYS;
        goto LABEL_29;
      case 2592000:
        id v14 = XPC_ACTIVITY_INTERVAL;
        id v16 = v10;
        int64_t v17 = 2592000;
LABEL_30:
        xpc_dictionary_set_int64(v16, v14, v17);
        goto LABEL_31;
    }
  }
  else
  {
    switch(v13)
    {
      case 3600:
        id v14 = XPC_ACTIVITY_INTERVAL;
        id v15 = &XPC_ACTIVITY_INTERVAL_1_HOUR;
        goto LABEL_29;
      case 14400:
        id v14 = XPC_ACTIVITY_INTERVAL;
        id v15 = &XPC_ACTIVITY_INTERVAL_4_HOURS;
        goto LABEL_29;
      case 28800:
        id v14 = XPC_ACTIVITY_INTERVAL;
        id v15 = &XPC_ACTIVITY_INTERVAL_8_HOURS;
LABEL_29:
        int64_t v17 = *v15;
        id v16 = v10;
        goto LABEL_30;
    }
  }
  unint64_t v29 = [(MBXPCActivityTimer *)self cadence];
  if (([(MBXPCActivityTimer *)self options] & 0x2000) != 0)
  {
    id v14 = XPC_ACTIVITY_INTERVAL;
    id v16 = v10;
    int64_t v17 = v29;
    goto LABEL_30;
  }
LABEL_31:
  unsigned __int8 v18 = [(MBXPCActivityTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_POWER_NAP, v18 & 1);
  unsigned __int8 v19 = [(MBXPCActivityTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, (v19 & 4) != 0);
  unsigned __int8 v20 = [(MBXPCActivityTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, (v20 & 2) != 0);
  unsigned __int8 v21 = [(MBXPCActivityTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_USES_DUET_POWER_BUDGETING, (v21 & 8) != 0);
  if (([(MBXPCActivityTimer *)self options] & 0x10) != 0)
  {
    objc_super v22 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_A;
  }
  else if (([(MBXPCActivityTimer *)self options] & 0x20) != 0)
  {
    objc_super v22 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_B;
  }
  else
  {
    if (([(MBXPCActivityTimer *)self options] & 0x40) == 0) {
      goto LABEL_39;
    }
    objc_super v22 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_C;
  }
  if (*v22) {
    xpc_dictionary_set_BOOL(v10, *v22, 1);
  }
LABEL_39:
  unsigned __int8 v23 = [(MBXPCActivityTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, (v23 & 0x80) != 0);
  unint64_t v24 = [(MBXPCActivityTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, v24 & 0x100);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_ALLOW_BATTERY, ([(MBXPCActivityTimer *)self options] & 0x200) != 0);
  unsigned __int16 v25 = (unsigned __int16)[(MBXPCActivityTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_MEMORY_INTENSIVE, (v25 & 0x400) != 0);
  unsigned __int16 v26 = (unsigned __int16)[(MBXPCActivityTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_CPU_INTENSIVE, (v26 & 0x800) != 0);
  unsigned __int16 v27 = (unsigned __int16)[(MBXPCActivityTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_DISK_INTENSIVE, (v27 & 0x1000) != 0);
  return v10;
}

- (void)invalidate
{
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = [(MBXPCActivityTimer *)self name];
    *(_DWORD *)buf = 138412290;
    int64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MBXPCTimer Unregistering XPC activity %@", buf, 0xCu);

    int64_t v9 = [(MBXPCActivityTimer *)self name];
    _MBLog();
  }
  id v5 = [(MBXPCActivityTimer *)self name];
  double v6 = (const char *)[v5 UTF8String];

  xpc_activity_unregister(v6);
  int64_t v7 = [(MBXPCActivityTimer *)self block];

  if (v7) {
    [(MBXPCActivityTimer *)self setBlock:0];
  }
  double v8 = [(MBXPCActivityTimer *)self activity];

  if (v8) {
    [(MBXPCActivityTimer *)self setActivity:0];
  }
}

- (id)activityHandler
{
  v3 = [(MBXPCActivityTimer *)self name];
  double v4 = [(MBXPCActivityTimer *)self date];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  int64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(MBXPCActivityTimer *)self cadence];
    if (v8 > 14399)
    {
      if (v8 <= 86399)
      {
        if (v8 == 14400)
        {
          int64_t v9 = "4 Hours";
          goto LABEL_28;
        }
        if (v8 == 28800)
        {
          int64_t v9 = "8 Hours";
          goto LABEL_28;
        }
      }
      else
      {
        switch(v8)
        {
          case 86400:
            int64_t v9 = "1 Day";
            goto LABEL_28;
          case 604800:
            int64_t v9 = "7 Days";
            goto LABEL_28;
          case 2592000:
            int64_t v9 = "1 Month";
            goto LABEL_28;
        }
      }
    }
    else if (v8 <= 899)
    {
      if (v8 == 60)
      {
        int64_t v9 = "1 Minute";
        goto LABEL_28;
      }
      if (v8 == 300)
      {
        int64_t v9 = "5 Minutes";
        goto LABEL_28;
      }
    }
    else
    {
      switch(v8)
      {
        case 900:
          int64_t v9 = "15 Minutes";
          goto LABEL_28;
        case 1800:
          int64_t v9 = "30 Minutes";
          goto LABEL_28;
        case 3600:
          int64_t v9 = "1 Hour";
LABEL_28:
          [(MBXPCActivityTimer *)self gracePeriod];
          *(_DWORD *)buf = 138413058;
          unsigned __int8 v21 = v3;
          __int16 v22 = 2048;
          uint64_t v23 = (uint64_t)v6;
          __int16 v24 = 2080;
          unsigned __int16 v25 = v9;
          __int16 v26 = 2048;
          uint64_t v27 = v10;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MBXPCTimer: Scheduling XPC activity (%@) in %lld, cadence: %s, ~%lf grace.", buf, 0x2Au);
          [(MBXPCActivityTimer *)self cadence];
          [(MBXPCActivityTimer *)self gracePeriod];
          _MBLog();
          goto LABEL_29;
      }
    }
    int64_t v9 = "Custom";
    goto LABEL_28;
  }
LABEL_29:

  objc_initWeak((id *)buf, self);
  int64_t v11 = [(MBXPCActivityTimer *)self block];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10015D464;
  v16[3] = &unk_100414A58;
  objc_copyWeak(&v19, (id *)buf);
  id v17 = v3;
  id v18 = v11;
  id v12 = v11;
  id v13 = v3;
  id v14 = objc_retainBlock(v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
  return v14;
}

- (void)handleActivity
{
  id v5 = [(MBXPCActivityTimer *)self name];
  v3 = (const char *)[v5 utf8ValueSafe];
  double v4 = [(MBXPCActivityTimer *)self activityHandler];
  xpc_activity_register(v3, XPC_ACTIVITY_CHECK_IN, v4);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (unint64_t)cadence
{
  return self->_cadence;
}

- (void)setCadence:(unint64_t)a3
{
  self->_cadence = a3;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end