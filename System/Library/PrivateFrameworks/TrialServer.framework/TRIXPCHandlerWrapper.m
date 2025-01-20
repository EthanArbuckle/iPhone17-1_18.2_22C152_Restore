@interface TRIXPCHandlerWrapper
+ (id)_symbolicatedBacktraceWithAddresses:(id)a3 unresolvedSymbols:(id)a4;
- (TRIXPCHandlerWrapper)initWithUnderlyingHandler:(id)a3 forProtocol:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation TRIXPCHandlerWrapper

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
  if (MethodDescription.types)
  {
    v4 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodDescription.types];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (TRIXPCHandlerWrapper)initWithUnderlyingHandler:(id)a3 forProtocol:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 conformsToProtocol:v9] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIXPCHandlerWrapper.m", 78, @"Invalid parameter not satisfying: %@", @"[handler conformsToProtocol:protocol]" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)TRIXPCHandlerWrapper;
  v10 = [(TRIXPCHandlerWrapper *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_underlying, a3);
    objc_storeStrong((id *)&v11->_protocol, a4);
  }

  return v11;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)self[16], (SEL)[v4 selector], 1, 1).types)
  {
    [v4 invokeWithTarget:self->_underlying];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TRIXPCHandlerWrapper;
    [(TRIXPCHandlerWrapper *)&v5 forwardInvocation:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

+ (id)_symbolicatedBacktraceWithAddresses:(id)a3 unresolvedSymbols:(id)a4
{
  id v4 = a4;
  return v4;
}

@end