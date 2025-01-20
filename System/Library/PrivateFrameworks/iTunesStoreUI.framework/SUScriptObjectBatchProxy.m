@interface SUScriptObjectBatchProxy
- (SUScriptObjectInvocationBatch)invocationBatch;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)target;
- (void)forwardInvocation:(id)a3;
- (void)setInvocationBatch:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation SUScriptObjectBatchProxy

- (void)forwardInvocation:(id)a3
{
  id v6 = a3;
  v4 = [(SUScriptObjectBatchProxy *)self invocationBatch];
  v5 = [(SUScriptObjectBatchProxy *)self target];
  [v6 setTarget:v5];

  if (v4)
  {
    [v4 enqueueInvocation:v6];
  }
  else
  {
    [v6 retainArguments];
    [v6 performSelectorOnMainThread:sel_invoke withObject:0 waitUntilDone:0];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUScriptObjectBatchProxy;
  v5 = -[SUScriptObjectBatchProxy methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    id v6 = [(SUScriptObjectBatchProxy *)self target];
    v5 = [v6 methodSignatureForSelector:a3];
  }

  return v5;
}

- (SUScriptObjectInvocationBatch)invocationBatch
{
  return self->_invocationBatch;
}

- (void)setInvocationBatch:(id)a3
{
  self->_invocationBatch = (SUScriptObjectInvocationBatch *)a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = a3;
}

@end