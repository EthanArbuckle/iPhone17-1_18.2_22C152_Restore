@interface NEKProgressLiar
- (NEKProgressLiar)initWithSpan:(double)a3 session:(id)a4;
- (PSYServiceSyncSession)session;
- (void)_doneForRealNotifyingPairedSync:(BOOL)a3;
- (void)doneForRealNotifyingPairedSync:(BOOL)a3;
- (void)pause;
- (void)resume;
- (void)setSession:(id)a3;
- (void)start;
@end

@implementation NEKProgressLiar

- (NEKProgressLiar)initWithSpan:(double)a3 session:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NEKProgressLiar;
  v8 = [(NEKProgressLiar *)&v14 init];
  v9 = v8;
  if (v8)
  {
    double v10 = 1.0;
    if (a3 != 0.0) {
      double v10 = a3;
    }
    v8->_span = v10;
    v8->_previousFraction = -0.02;
    uint64_t v11 = sub_100006A20("com.apple.eventkitsync.progressliar");
    q = v9->_q;
    v9->_q = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_session, a4);
  }

  return v9;
}

- (void)start
{
  objc_initWeak(&location, self);
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_q);
  timeToLie = self->_timeToLie;
  self->_timeToLie = v3;

  v5 = self->_timeToLie;
  dispatch_time_t v6 = dispatch_time(0, 0);
  dispatch_source_set_timer(v5, v6, 0x3B9ACA00uLL, 0x1DCD6500uLL);
  id v7 = self->_timeToLie;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100035FBC;
  handler[3] = &unk_1000A8B48;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v7, handler);
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036104;
  block[3] = &unk_1000A8B90;
  block[4] = self;
  dispatch_sync(q, block);
  dispatch_resume((dispatch_object_t)self->_timeToLie);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)pause
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000361AC;
  block[3] = &unk_1000A8B90;
  block[4] = self;
  dispatch_sync(q, block);
}

- (void)resume
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036230;
  block[3] = &unk_1000A8B90;
  block[4] = self;
  dispatch_sync(q, block);
}

- (void)doneForRealNotifyingPairedSync:(BOOL)a3
{
  q = self->_q;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000362B4;
  v4[3] = &unk_1000A9658;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(q, v4);
}

- (void)_doneForRealNotifyingPairedSync:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)os_transaction_create();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  dispatch_time_t v6 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "doneForRealNotifyingPairedSync: %d", (uint8_t *)v10, 8u);
  }
  timeToLie = self->_timeToLie;
  if (timeToLie)
  {
    dispatch_source_cancel(timeToLie);
    v8 = self->_timeToLie;
    self->_timeToLie = 0;
  }
  if (!self->_calledDidComplete && v3)
  {
    self->_calledDidComplete = 1;
    v9 = [(NEKProgressLiar *)self session];
    [v9 syncDidComplete];
  }
}

- (PSYServiceSyncSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_q, 0);

  objc_storeStrong((id *)&self->_timeToLie, 0);
}

@end