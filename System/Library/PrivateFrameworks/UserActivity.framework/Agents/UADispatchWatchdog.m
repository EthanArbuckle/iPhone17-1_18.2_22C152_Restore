@interface UADispatchWatchdog
- (BOOL)hasFired;
- (NSString)name;
- (OS_dispatch_source)source;
- (UADispatchWatchdog)initWithName:(id)a3 timeout:(double)a4 block:(id)a5;
- (double)timeout;
- (id)handler;
- (void)_triggerWatchdog;
- (void)cancel;
- (void)dealloc;
- (void)poke;
- (void)setHandler:(id)a3;
- (void)setHasFired:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSource:(id)a3;
- (void)setTimeout:(double)a3;
- (void)start;
@end

@implementation UADispatchWatchdog

- (UADispatchWatchdog)initWithName:(id)a3 timeout:(double)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)UADispatchWatchdog;
  v10 = [(UADispatchWatchdog *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(UADispatchWatchdog *)v10 setName:v8];
    [(UADispatchWatchdog *)v11 setTimeout:a4];
    [(UADispatchWatchdog *)v11 setHandler:v9];
    [(UADispatchWatchdog *)v11 setHasFired:0];
  }

  return v11;
}

- (void)dealloc
{
  v3 = [(UADispatchWatchdog *)self source];
  v4 = v3;
  if (v3) {
    dispatch_source_cancel(v3);
  }

  v5.receiver = self;
  v5.super_class = (Class)UADispatchWatchdog;
  [(UADispatchWatchdog *)&v5 dealloc];
}

- (void)start
{
  v3 = [(UADispatchWatchdog *)self source];

  if (v3)
  {
    v4 = [(UADispatchWatchdog *)self source];
    dispatch_source_cancel(v4);
  }
  objc_super v5 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(UADispatchWatchdog *)self name];
    [(UADispatchWatchdog *)self timeout];
    *(_DWORD *)buf = 138412546;
    objc_super v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Starting watchdog: %@ - %fs", buf, 0x16u);
  }
  id v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, 0);
  dispatch_set_qos_class_floor(v8, QOS_CLASS_USER_INTERACTIVE, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000230B8;
  handler[3] = &unk_1000C4CF0;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  [(UADispatchWatchdog *)self timeout];
  dispatch_time_t v10 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
  dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_activate(v8);
  [(UADispatchWatchdog *)self setSource:v8];
}

- (void)poke
{
  source = [(UADispatchWatchdog *)self source];
  if (![(UADispatchWatchdog *)self hasFired] && source)
  {
    [(UADispatchWatchdog *)self timeout];
    dispatch_time_t v4 = dispatch_walltime(0, (uint64_t)(v3 * 1000000000.0));
    dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

- (void)cancel
{
  double v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    dispatch_time_t v4 = [(UADispatchWatchdog *)self name];
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Canceling watchdog: %@", (uint8_t *)&v7, 0xCu);
  }
  objc_super v5 = [(UADispatchWatchdog *)self source];
  v6 = v5;
  if (v5) {
    dispatch_source_cancel(v5);
  }
}

- (void)_triggerWatchdog
{
  double v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    dispatch_time_t v4 = [(UADispatchWatchdog *)self name];
    [(UADispatchWatchdog *)self timeout];
    uint64_t v6 = v5;
    int v7 = +[NSNumber numberWithBool:[(UADispatchWatchdog *)self hasFired]];
    int v9 = 138412802;
    dispatch_time_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Triggering watchdog: %@ - %fs - %@", (uint8_t *)&v9, 0x20u);
  }
  if (![(UADispatchWatchdog *)self hasFired])
  {
    [(UADispatchWatchdog *)self setHasFired:1];
    id v8 = [(UADispatchWatchdog *)self handler];
    v8[2]();
  }
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setHandler:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_source)source
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSource:(id)a3
{
}

- (BOOL)hasFired
{
  return self->_hasFired;
}

- (void)setHasFired:(BOOL)a3
{
  self->_hasFired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end