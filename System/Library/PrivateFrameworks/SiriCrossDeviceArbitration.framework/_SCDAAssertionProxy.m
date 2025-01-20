@interface _SCDAAssertionProxy
- (NSString)description;
- (NSUUID)uuid;
- (SCDAAssertionContext)context;
- (_SCDAAssertionProxy)initWithImpl:(id)a3 coordinator:(id)a4;
- (void)dealloc;
- (void)relinquishWithContext:(id)a3 options:(unint64_t)a4;
- (void)relinquishWithError:(id)a3 options:(unint64_t)a4;
@end

@implementation _SCDAAssertionProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_impl, 0);
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v4 = [(_SCDAAssertionImpl *)self->_impl uuid];
  v5 = [MEMORY[0x263F087E8] errorWithDomain:@"kSCDAErrorDomain" code:41 userInfo:0];
  [WeakRetained relinquishAssertionWithUUID:v4 error:v5 options:0];

  v6.receiver = self;
  v6.super_class = (Class)_SCDAAssertionProxy;
  [(_SCDAAssertionProxy *)&v6 dealloc];
}

- (SCDAAssertionContext)context
{
  return [(_SCDAAssertionImpl *)self->_impl context];
}

- (NSUUID)uuid
{
  return [(_SCDAAssertionImpl *)self->_impl uuid];
}

- (void)relinquishWithError:(id)a3 options:(unint64_t)a4
{
  p_coordinator = &self->_coordinator;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinator);
  v8 = [(_SCDAAssertionImpl *)self->_impl uuid];
  [WeakRetained relinquishAssertionWithUUID:v8 error:v7 options:a4];
}

- (void)relinquishWithContext:(id)a3 options:(unint64_t)a4
{
  p_coordinator = &self->_coordinator;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinator);
  v8 = [(_SCDAAssertionImpl *)self->_impl uuid];
  [WeakRetained relinquishAssertionWithUUID:v8 context:v7 options:a4];
}

- (_SCDAAssertionProxy)initWithImpl:(id)a3 coordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SCDAAssertionProxy;
  v9 = [(_SCDAAssertionProxy *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_impl, a3);
    objc_storeWeak((id *)&v10->_coordinator, v8);
  }

  return v10;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)_SCDAAssertionProxy;
  v4 = [(_SCDAAssertionProxy *)&v8 description];
  v5 = _SCDAAssertionCreateDescriptionOfProperties(self->_impl);
  objc_super v6 = (void *)[v3 initWithFormat:@"%@ {%@}", v4, v5];

  return (NSString *)v6;
}

@end