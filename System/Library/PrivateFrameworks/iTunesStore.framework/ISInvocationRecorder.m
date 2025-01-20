@interface ISInvocationRecorder
- (ISInvocationRecorder)init;
- (ISInvocationRecorder)initWithTarget:(id)a3;
- (id)adjustedTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)invokeInvocation:(id)a3;
@end

@implementation ISInvocationRecorder

- (ISInvocationRecorder)init
{
  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISInvocationRecorder;
  return [(ISInvocationRecorder *)&v4 init];
}

- (ISInvocationRecorder)initWithTarget:(id)a3
{
  objc_super v4 = [(ISInvocationRecorder *)self init];
  if (v4) {
    v4->_target = a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_target = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISInvocationRecorder;
  [(ISInvocationRecorder *)&v3 dealloc];
}

- (id)adjustedTargetForSelector:(SEL)a3
{
  return self->_target;
}

- (void)invokeInvocation:(id)a3
{
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "setTarget:", -[ISInvocationRecorder adjustedTargetForSelector:](self, "adjustedTargetForSelector:", objc_msgSend(a3, "selector")));

  [(ISInvocationRecorder *)self invokeInvocation:a3];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISInvocationRecorder;
  id result = -[ISInvocationRecorder methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result) {
    return (id)objc_msgSend(-[ISInvocationRecorder adjustedTargetForSelector:](self, "adjustedTargetForSelector:", a3), "methodSignatureForSelector:", a3);
  }
  return result;
}

@end