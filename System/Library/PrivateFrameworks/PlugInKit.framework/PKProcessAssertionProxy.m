@interface PKProcessAssertionProxy
- (BKSProcessAssertion)_bksObject;
- (BOOL)acquire;
- (PKProcessAssertionProxy)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6;
- (id)invalidationHandler;
- (void)invalidate;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation PKProcessAssertionProxy

- (PKProcessAssertionProxy)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PKProcessAssertionProxy;
  v11 = [(PKProcessAssertionProxy *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F4E288]) initWithPID:v8 flags:v7 reason:v6 name:v10];
    bksObject = v11->__bksObject;
    v11->__bksObject = (BKSProcessAssertion *)v12;
  }
  return v11;
}

- (id)invalidationHandler
{
  v2 = [(PKProcessAssertionProxy *)self _bksObject];
  v3 = [v2 invalidationHandler];

  return v3;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PKProcessAssertionProxy *)self _bksObject];
  [v5 setInvalidationHandler:v4];
}

- (BOOL)acquire
{
  v2 = [(PKProcessAssertionProxy *)self _bksObject];
  char v3 = [v2 acquire];

  return v3;
}

- (void)invalidate
{
  id v2 = [(PKProcessAssertionProxy *)self _bksObject];
  [v2 invalidate];
}

- (BKSProcessAssertion)_bksObject
{
  return (BKSProcessAssertion *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end