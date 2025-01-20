@interface STSDCKAssertion
- (NFDCKAssertion)assertion;
- (NSString)keyIdentifier;
- (STSDCKAssertion)initWithAssertion:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation STSDCKAssertion

- (STSDCKAssertion)initWithAssertion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSDCKAssertion;
  v6 = [(STSDCKAssertion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assertion, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(STSDCKAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STSDCKAssertion;
  [(STSDCKAssertion *)&v3 dealloc];
}

- (NSString)keyIdentifier
{
  return (NSString *)[(NFDCKAssertion *)self->_assertion keyIdentifier];
}

- (void)invalidate
{
}

- (NFDCKAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
}

@end