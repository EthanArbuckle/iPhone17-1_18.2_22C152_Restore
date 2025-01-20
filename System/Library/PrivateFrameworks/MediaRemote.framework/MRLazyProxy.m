@interface MRLazyProxy
+ (id)proxyWithProtocol:(id)a3 objectCallback:(id)a4;
- (Protocol)protocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)objectCallback;
- (void)forwardInvocation:(id)a3;
@end

@implementation MRLazyProxy

+ (id)proxyWithProtocol:(id)a3 objectCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc((Class)a1);
  uint64_t v9 = MEMORY[0x1997190F0](v7);

  v10 = (void *)v8[1];
  v8[1] = v9;

  v11 = (void *)v8[2];
  v8[2] = v6;

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v6 = a3;
  v4 = [(MRLazyProxy *)self objectCallback];
  v5 = v4[2]();

  if (v5)
  {
    [v6 selector];
    if (objc_opt_respondsToSelector()) {
      [v6 invokeWithTarget:v5];
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (a3 == a2)
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v6 = [(MRLazyProxy *)self protocol];
    types = protocol_getMethodDescription(v6, a3, 0, 1).types;

    if (types
      || ([(MRLazyProxy *)self protocol],
          v8 = (Protocol *)objc_claimAutoreleasedReturnValue(),
          types = protocol_getMethodDescription(v8, a3, 1, 1).types,
          v8,
          types))
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

- (id)objectCallback
{
  return self->_objectCallback;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong(&self->_objectCallback, 0);
}

@end