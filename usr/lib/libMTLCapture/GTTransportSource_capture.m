@interface GTTransportSource_capture
- (BOOL)cancelled;
- (GTTransportSource_capture)init;
- (id)_initWithQueue:(id)a3 transport:(id)a4;
- (id)cancellationHandler;
- (id)messageHandler;
- (id)registrationHandler;
- (void)_callCancellationHandler;
- (void)_callRegistrationHandler;
- (void)_cancel;
- (void)_dispatch:(id)a3;
- (void)_register;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)setCancellationHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setRegistrationHandler:(id)a3;
- (void)suspend;
@end

@implementation GTTransportSource_capture

- (void)_dispatch:(id)a3
{
  mqueue = self->_mqueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __31__GTTransportSource__dispatch___block_invoke;
  v4[3] = &unk_222148;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mqueue, v4);
}

- (void)_cancel
{
  [(GTTransport_capture *)self->_transport _cancelSource:self];

  self->_messageHandler = 0;
  self->_registrationHandler = 0;
  mqueue = self->_mqueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __28__GTTransportSource__cancel__block_invoke;
  block[3] = &unk_222120;
  block[4] = self;
  dispatch_async(mqueue, block);
}

- (void)_callCancellationHandler
{
  cancellationHandler = (void (**)(id, SEL))self->_cancellationHandler;
  if (cancellationHandler)
  {
    cancellationHandler[2](cancellationHandler, a2);

    self->_cancellationHandler = 0;
  }

  self->_transport = 0;
}

- (void)_register
{
  char v2 = atomic_load((unsigned int *)&self->_state);
  if ((v2 & 1) == 0)
  {
    if ([(GTTransport_capture *)self->_transport _activateSource:self])
    {
      atomic_fetch_or(&self->_state.__a_.__a_value, 2u);
      mqueue = self->_mqueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __30__GTTransportSource__register__block_invoke;
      block[3] = &unk_222120;
      block[4] = self;
      dispatch_async(mqueue, block);
    }
    else
    {
      [(GTTransportSource_capture *)self cancel];
    }
  }
}

- (void)_callRegistrationHandler
{
  char v2 = atomic_load((unsigned int *)&self->_state);
  if ((v2 & 1) == 0)
  {
    registrationHandler = (void (**)(id, SEL))self->_registrationHandler;
    if (registrationHandler)
    {
      registrationHandler[2](registrationHandler, a2);

      self->_registrationHandler = 0;
    }
  }
}

- (void)setRegistrationHandler:(id)a3
{
  id v4 = [a3 copy];
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __44__GTTransportSource_setRegistrationHandler___block_invoke;
  v6[3] = &unk_221320;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

- (id)registrationHandler
{
  return self->_registrationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  id v4 = [a3 copy];
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __44__GTTransportSource_setCancellationHandler___block_invoke;
  v6[3] = &unk_221320;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setMessageHandler:(id)a3
{
  id v4 = [a3 copy];
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __39__GTTransportSource_setMessageHandler___block_invoke;
  v6[3] = &unk_221320;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (BOOL)cancelled
{
  char v2 = atomic_load((unsigned int *)&self->_state);
  return v2 & 1;
}

- (void)cancel
{
  if ((atomic_fetch_or(&self->_state.__a_.__a_value, 1u) & 1) == 0)
  {
    dispatch_suspend((dispatch_object_t)self->_mqueue);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __27__GTTransportSource_cancel__block_invoke;
    block[3] = &unk_222120;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)suspend
{
}

- (void)resume
{
}

- (void)dealloc
{
  mqueue = self->_mqueue;
  if (mqueue)
  {
    dispatch_release(mqueue);
    self->_mqueue = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GTTransportSource_capture;
  [(GTTransportSource_capture *)&v5 dealloc];
}

- (id)_initWithQueue:(id)a3 transport:(id)a4
{
  if (!a3)
  {
    if (s_logUsingOsLog)
    {
      v13 = gt_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "fail: queue cannot be NULL";
        goto LABEL_12;
      }
LABEL_16:
      abort();
    }
    v15 = __stderrp;
    CFStringRef v16 = @"fail: queue cannot be NULL";
LABEL_15:
    fprintf(v15, "%s\n", [+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, a4) UTF8String]);
    goto LABEL_16;
  }
  if (!a4)
  {
    if (s_logUsingOsLog)
    {
      v13 = gt_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "fail: transport cannot be nil";
LABEL_12:
        _os_log_fault_impl(&def_CFBEC, v13, OS_LOG_TYPE_FAULT, v14, buf, 2u);
        abort();
      }
      goto LABEL_16;
    }
    v15 = __stderrp;
    CFStringRef v16 = @"fail: transport cannot be nil";
    goto LABEL_15;
  }
  v18.receiver = self;
  v18.super_class = (Class)GTTransportSource_capture;
  v6 = [(GTTransportSource_capture *)&v18 init];
  if (v6)
  {
    v6->_transport = (GTTransport_capture *)a4;
    v7 = [+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"gputools.%@.%p.%@", +[NSString stringWithUTF8String:object_getClassName(v6)], v6, @"manager") UTF8String];
    v8 = dispatch_queue_create_with_target_V2(v7, 0, (dispatch_queue_t)a3);
    v6->_queue = (OS_dispatch_queue *)v8;
    dispatch_suspend(v8);
    v9 = [+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"gputools.%@.%p.%@", +[NSString stringWithUTF8String:object_getClassName(v6)], v6, @"message") UTF8String];
    v10 = dispatch_queue_create_with_target_V2(v9, 0, (dispatch_queue_t)a3);
    v6->_mqueue = (OS_dispatch_queue *)v10;
    dispatch_suspend(v10);
    queue = v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __46__GTTransportSource__initWithQueue_transport___block_invoke;
    block[3] = &unk_222120;
    block[4] = v6;
    dispatch_async(queue, block);
  }
  return v6;
}

- (GTTransportSource_capture)init
{
  return 0;
}

@end