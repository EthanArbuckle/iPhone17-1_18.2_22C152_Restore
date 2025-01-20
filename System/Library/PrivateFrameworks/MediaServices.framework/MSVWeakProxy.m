@interface MSVWeakProxy
+ (id)proxyWithObject:(id)a3 protocol:(id)a4;
- (BOOL)isEqual:(id)a3;
- (Protocol)protocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)object;
- (unint64_t)hash;
- (void)forwardInvocation:(id)a3;
@end

@implementation MSVWeakProxy

- (void)forwardInvocation:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  if (WeakRetained)
  {
    [v5 selector];
    if (objc_opt_respondsToSelector()) {
      [v5 invokeWithTarget:WeakRetained];
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (a3 == a2)
  {
    v9 = 0;
  }
  else
  {
    v6 = [(MSVWeakProxy *)self protocol];
    types = protocol_getMethodDescription(v6, a3, 0, 1).types;

    if (types
      || ([(MSVWeakProxy *)self protocol],
          v8 = (Protocol *)objc_claimAutoreleasedReturnValue(),
          types = protocol_getMethodDescription(v8, a3, 1, 1).types,
          v8,
          types))
    {
      v9 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

- (Protocol)protocol
{
  return self->_protocol;
}

+ (id)proxyWithObject:(id)a3 protocol:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (id *)objc_alloc((Class)a1);
  objc_storeWeak(v8 + 1, v7);

  id v9 = v8[2];
  v8[2] = v6;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_destroyWeak(&self->_object);
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained(v4 + 1);
    id v6 = objc_loadWeakRetained(&self->_object);
    BOOL v7 = WeakRetained == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  id v4 = (id)[WeakRetained hash];
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MSVWeakProxy;
    id v4 = [(MSVWeakProxy *)&v6 hash];
  }

  return (unint64_t)v4;
}

@end