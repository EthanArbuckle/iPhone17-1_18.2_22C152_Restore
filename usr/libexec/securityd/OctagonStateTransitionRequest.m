@interface OctagonStateTransitionRequest
- (BOOL)timeoutCanOccur;
- (NSSet)sourceStates;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OctagonStateTransitionOperationProtocol)transitionOperation;
- (id)_onqueueStart;
- (id)description;
- (id)init:(id)a3 sourceStates:(id)a4 serialQueue:(id)a5 transitionOp:(id)a6;
- (void)onqueueHandleStartTimeout:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
@end

@implementation OctagonStateTransitionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transitionOperation, 0);
  objc_storeStrong((id *)&self->_sourceStates, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (OctagonStateTransitionOperationProtocol)transitionOperation
{
  return (OctagonStateTransitionOperationProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)sourceStates
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)onqueueHandleStartTimeout:(id)a3
{
  id v11 = a3;
  v4 = [(OctagonStateTransitionRequest *)self queue];
  dispatch_assert_queue_V2(v4);

  if ([(OctagonStateTransitionRequest *)self timeoutCanOccur])
  {
    [(OctagonStateTransitionRequest *)self setTimeoutCanOccur:0];
    v5 = [(OctagonStateTransitionRequest *)self transitionOperation];
    [v5 setDescriptionUnderlyingError:v11];

    v6 = [(OctagonStateTransitionRequest *)self transitionOperation];
    [v6 setDescriptionErrorCode:2000];

    v7 = [(OctagonStateTransitionRequest *)self transitionOperation];
    id v8 = [v7 timeout:0];

    id v9 = objc_alloc_init((Class)NSOperationQueue);
    v10 = [(OctagonStateTransitionRequest *)self transitionOperation];
    [v9 addOperation:v10];
  }
}

- (id)_onqueueStart
{
  v3 = [(OctagonStateTransitionRequest *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(OctagonStateTransitionRequest *)self timeoutCanOccur])
  {
    [(OctagonStateTransitionRequest *)self setTimeoutCanOccur:0];
    v4 = [(OctagonStateTransitionRequest *)self transitionOperation];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  v3 = [(OctagonStateTransitionRequest *)self name];
  v4 = [(OctagonStateTransitionRequest *)self transitionOperation];
  v5 = [(OctagonStateTransitionRequest *)self sourceStates];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<OctagonStateTransitionRequest: %@ %@ sources:%d>", v3, v4, [v5 count]);

  return v6;
}

- (id)init:(id)a3 sourceStates:(id)a4 serialQueue:(id)a5 transitionOp:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OctagonStateTransitionRequest;
  v15 = [(OctagonStateTransitionRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_sourceStates, a4);
    objc_storeStrong((id *)&v16->_queue, a5);
    v16->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v16->_transitionOperation, a6);
  }

  return v16;
}

@end