@interface SDAirDropStatus
- (SDAirDropStatus)init;
- (SDAirDropStatusDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setStatusAndNotify;
- (void)somethingChanged:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropStatus

- (SDAirDropStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)SDAirDropStatus;
  v2 = [(SDAirDropStatus *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    uint64_t v4 = objc_opt_new();
    properties = v3->_properties;
    v3->_properties = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (void)dealloc
{
  [(SDAirDropStatus *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropStatus;
  [(SDAirDropStatus *)&v3 dealloc];
}

- (void)setStatusAndNotify
{
  [(NSMutableDictionary *)self->_properties setObject:&__kCFBooleanFalse forKeyedSubscript:kSFOperationAirDropEnabledKey];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091B54;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)somethingChanged:(id)a3
{
}

- (void)start
{
  if (!self->_started)
  {
    self->_started = 1;
    [(SDAirDropStatus *)self setStatusAndNotify];
  }
}

- (void)stop
{
  if (self->_started) {
    self->_started = 0;
  }
}

- (SDAirDropStatusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropStatusDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end