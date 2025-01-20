@interface MRWeakProxy
+ (id)weakProxyWithObject:(id)a3 protocol:(id)a4;
- (BOOL)isEqual:(id)a3;
- (Protocol)protocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)object;
- (unint64_t)hash;
- (void)forwardInvocation:(id)a3;
- (void)setObject:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation MRWeakProxy

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v5 = [(MRWeakProxy *)self object];
  if (v5)
  {
    [v4 selector];
    if (objc_opt_respondsToSelector())
    {
      [v4 invokeWithTarget:v5];
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)MRWeakProxy;
      [(MRWeakProxy *)&v6 forwardInvocation:v4];
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = [(MRWeakProxy *)self object];
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 methodSignatureForSelector:a3];
LABEL_6:
    v9 = (void *)v7;
    goto LABEL_7;
  }
  objc_method_description MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
  if (!MethodDescription.types
    || ([MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodDescription.types],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)MRWeakProxy;
    uint64_t v7 = [(MRWeakProxy *)&v11 methodSignatureForSelector:a3];
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

+ (id)weakProxyWithObject:(id)a3 protocol:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(MRWeakProxy);
  [(MRWeakProxy *)v7 setObject:v6];

  [(MRWeakProxy *)v7 setProtocol:v5];

  return v7;
}

- (void)setProtocol:(id)a3
{
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_destroyWeak(&self->_object);
}

- (unint64_t)hash
{
  v3 = [(MRWeakProxy *)self object];
  id v4 = (id)[v3 hash];
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MRWeakProxy;
    id v4 = [(MRWeakProxy *)&v6 hash];
  }

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MRWeakProxy *)self object];
    objc_super v6 = [v4 object];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (Protocol)protocol
{
  return self->_protocol;
}

@end