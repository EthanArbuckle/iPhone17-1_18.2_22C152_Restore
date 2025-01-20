@interface _WebSafeForwarder
- (BOOL)respondsToSelector:(SEL)a3;
- (_WebSafeForwarder)initWithTarget:(id)a3 defaultTarget:(id)a4;
- (id)asyncForwarder;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)clearTarget;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation _WebSafeForwarder

- (_WebSafeForwarder)initWithTarget:(id)a3 defaultTarget:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_WebSafeForwarder;
  v6 = [(_WebSafeForwarder *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_target = a3;
    v6->_defaultTarget = a4;
    v6->_asyncForwarder = [[_WebSafeAsyncForwarder alloc] initWithForwarder:v6];
  }
  return v7;
}

- (void)dealloc
{
  self->_target = 0;
  self->_defaultTarget = 0;

  self->_asyncForwarder = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WebSafeForwarder;
  [(_WebSafeForwarder *)&v3 dealloc];
}

- (void)clearTarget
{
  self->_target = 0;
}

- (void)forwardInvocation:(id)a3
{
  if (WebThreadIsCurrent())
  {
    [a3 retainArguments];
    WebThreadCallDelegate();
  }
  else
  {
    [a3 selector];
    if (objc_opt_respondsToSelector())
    {
      [a3 invokeWithTarget:self->_target];
    }
    else
    {
      [a3 selector];
      if (objc_opt_respondsToSelector())
      {
        id defaultTarget = self->_defaultTarget;
        [a3 invokeWithTarget:defaultTarget];
      }
    }
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_defaultTarget methodSignatureForSelector:a3];
}

- (id)asyncForwarder
{
  return self->_asyncForwarder;
}

@end