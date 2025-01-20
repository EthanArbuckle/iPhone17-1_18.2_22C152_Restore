@interface CRLProgressObserver
- (CRLProgressObserver)init;
- (CRLProgressObserver)initWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (double)valueInterval;
- (void)handleValue:(double)a3 maxValue:(double)a4 isIndeterminate:(BOOL)a5;
@end

@implementation CRLProgressObserver

- (CRLProgressObserver)initWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRLProgressObserver;
  v11 = [(CRLProgressObserver *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_valueInterval = a3;
    objc_storeStrong((id *)&v11->_queue, a4);
    id v13 = [v10 copy];
    id handler = v12->_handler;
    v12->_id handler = v13;

    v12->_lastHandledValue = 0.0;
  }

  return v12;
}

- (CRLProgressObserver)init
{
  return [(CRLProgressObserver *)self initWithValueInterval:0 queue:0 handler:0.0];
}

- (void)handleValue:(double)a3 maxValue:(double)a4 isIndeterminate:(BOOL)a5
{
  if (self->_lastHandledIndeterminate != a5
    || (double v9 = vabdd_f64(a3, self->_lastHandledValue),
        [(CRLProgressObserver *)self valueInterval],
        v9 >= v10)
    || a3 >= a4 && self->_lastHandledValue < a4)
  {
    self->_lastHandledIndeterminate = a5;
    self->_lastHandledValue = a3;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001182E4;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (double)valueInterval
{
  return self->_valueInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end