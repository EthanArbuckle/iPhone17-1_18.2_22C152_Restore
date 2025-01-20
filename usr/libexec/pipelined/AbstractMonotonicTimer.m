@interface AbstractMonotonicTimer
- (AbstractMonotonicTimer)init;
- (AbstractMonotonicTimer)initWithName:(id)a3;
- (double)delayTimeInterval;
- (double)intervalTimeInterval;
- (duration<long)delay;
- (duration<long)interval;
- (void)abstractFunctionCalled:(SEL)a3;
- (void)implOnQueuePause;
- (void)implOnQueueResume;
- (void)implOnQueueUpdateTimer;
- (void)invalidate;
- (void)onQueueInvalidate;
- (void)onQueueTick;
- (void)pause;
- (void)resume;
- (void)setDelay:(duration<long)long;
- (void)setDelayTimeInterval:(double)a3;
- (void)setEventHandler:(id)a3 onQueue:(id)a4;
- (void)setInterval:(duration<long)long;
- (void)setIntervalTimeInterval:(double)a3;
@end

@implementation AbstractMonotonicTimer

- (void)setDelay:(duration<long)long
{
  uint64_t rep = a3.__rep_;
  if (a3.__rep_ < 0)
  {
    sub_1000AE4B0(v8, "");
    sub_10015F140("Negative delays are unsupported: ", &v10);
    sub_100299DC4(&rep, &v11);
    sub_10016A2C4((uint64_t)v8, (uint64_t)&v10, 2);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v11.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_5:
        if ((v9 & 0x80000000) == 0) {
          goto LABEL_6;
        }
LABEL_9:
        operator delete(v8[0]);
LABEL_6:
        sub_1000D11E0((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  q = self->_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000965E0;
  v5[3] = &unk_100468898;
  v5[4] = self;
  v5[5] = a3.__rep_;
  dispatch_sync(q, v5);
}

- (AbstractMonotonicTimer)initWithName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AbstractMonotonicTimer;
  v5 = [(AbstractMonotonicTimer *)&v10 init];
  if (v5
    && (dispatch_queue_t v6 = dispatch_queue_create((const char *)[v4 UTF8String], 0),
        q = v5->_q,
        v5->_q = (OS_dispatch_queue *)v6,
        q,
        v5->_q))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setEventHandler:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096EFC;
  block[3] = &unk_1004688F0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(q, block);
}

- (void)setInterval:(duration<long)long
{
  uint64_t rep = a3.__rep_;
  if (a3.__rep_ < 0)
  {
    sub_1000AE4B0(v8, "");
    sub_10028CDF4("Negative intervals are unsupported: ", &v10);
    sub_100299DC4(&rep, &v11);
    sub_10016A2C4((uint64_t)v8, (uint64_t)&v10, 2);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v11.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_5:
        if ((v9 & 0x80000000) == 0) {
          goto LABEL_6;
        }
LABEL_9:
        operator delete(v8[0]);
LABEL_6:
        sub_1000D11E0((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  q = self->_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000971E4;
  v5[3] = &unk_100468898;
  v5[4] = self;
  v5[5] = a3.__rep_;
  dispatch_sync(q, v5);
}

- (void)resume
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000971F4;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_sync(q, block);
}

- (void)pause
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100097278;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_sync(q, block);
}

- (void)onQueueTick
{
  handlerQ = self->_handlerQ;
  if (handlerQ)
  {
    id handler = self->_handler;
    if (handler) {
      dispatch_async(handlerQ, handler);
    }
  }
}

- (AbstractMonotonicTimer)init
{
  return 0;
}

- (void)abstractFunctionCalled:(SEL)a3
{
  NSStringFromSelector(a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSInternalInconsistencyException, @"You must override %@ in a subclass", v3 format];
}

- (void)implOnQueuePause
{
}

- (void)implOnQueueResume
{
}

- (void)implOnQueueUpdateTimer
{
}

- (void)invalidate
{
}

- (void)onQueueInvalidate
{
  id handler = self->_handler;
  self->_id handler = 0;

  handlerQ = self->_handlerQ;
  self->_handlerQ = 0;
}

- (duration<long)delay
{
  v8.__rep_ = -1;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10033E508;
  block[3] = &unk_100468860;
  id v6 = self;
  id v7 = &v8;
  id v3 = v6;
  dispatch_sync(q, block);

  return v8;
}

- (double)delayTimeInterval
{
  return (double)(uint64_t)[(AbstractMonotonicTimer *)self delay] / 1000000000.0;
}

- (void)setDelayTimeInterval:(double)a3
{
}

- (duration<long)interval
{
  v8.__rep_ = -1;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10033E63C;
  block[3] = &unk_1004688B8;
  id v6 = self;
  id v7 = &v8;
  id v3 = v6;
  dispatch_sync(q, block);

  return v8;
}

- (void)setIntervalTimeInterval:(double)a3
{
}

- (double)intervalTimeInterval
{
  return (double)(uint64_t)[(AbstractMonotonicTimer *)self interval] / 1000000000.0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_handlerQ, 0);

  objc_storeStrong((id *)&self->_q, 0);
}

@end