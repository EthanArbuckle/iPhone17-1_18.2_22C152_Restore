@interface SUResponderChainInvocationRecorder
- (SUResponderChainInvocationRecorder)initWithTarget:(id)a3 protocol:(id)a4;
- (id)_targetForSelector:(SEL)a3 sender:(id)a4;
- (id)adjustedTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)invokeInvocation:(id)a3;
@end

@implementation SUResponderChainInvocationRecorder

- (SUResponderChainInvocationRecorder)initWithTarget:(id)a3 protocol:(id)a4
{
  result = [(ISInvocationRecorder *)self initWithTarget:a3];
  if (result) {
    result->_protocol = (Protocol *)a4;
  }
  return result;
}

- (id)_targetForSelector:(SEL)a3 sender:(id)a4
{
  for (i = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F89570]);
        i;
        i = (void *)[i nextResponder])
  {
    if ([i canPerformAction:a3 withSender:a4]) {
      break;
    }
  }
  return i;
}

- (id)adjustedTargetForSelector:(SEL)a3
{
  return [(SUResponderChainInvocationRecorder *)self _targetForSelector:a3 sender:0];
}

- (void)invokeInvocation:(id)a3
{
  uint64_t v8 = 0;
  v5 = (void *)[a3 methodSignature];
  if ((unint64_t)[v5 numberOfArguments] >= 3)
  {
    v6 = (const char *)[v5 getArgumentTypeAtIndex:2];
    if (v6)
    {
      if (!strcmp(v6, "@")) {
        [a3 getArgument:&v8 atIndex:2];
      }
    }
  }
  uint64_t v7 = [a3 selector];
  objc_msgSend(a3, "invokeWithTarget:", -[SUResponderChainInvocationRecorder _targetForSelector:sender:](self, "_targetForSelector:sender:", v7, v8));
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUResponderChainInvocationRecorder;
  id result = -[ISInvocationRecorder methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!result)
  {
    id result = self->_protocol;
    if (result)
    {
      objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)result, a3, 1, 1);
      id result = (id)MethodDescription.name;
      if (MethodDescription.name) {
        return (id)[MEMORY[0x263EFF970] signatureWithObjCTypes:MethodDescription.types];
      }
    }
  }
  return result;
}

@end