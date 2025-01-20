@interface NFUnifiedAccessAssertion
- (NFUnifiedAccessAssertion)initWithSESAssertion:(id)a3;
- (NSString)keyIdentifier;
- (SESAssertion)sesAssertion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation NFUnifiedAccessAssertion

- (NFUnifiedAccessAssertion)initWithSESAssertion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFUnifiedAccessAssertion;
  v6 = [(NFUnifiedAccessAssertion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sesAssertion, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(NFUnifiedAccessAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NFUnifiedAccessAssertion;
  [(NFUnifiedAccessAssertion *)&v3 dealloc];
}

- (NSString)keyIdentifier
{
  return (NSString *)[(SESAssertion *)self->_sesAssertion keyIdentifier];
}

- (void)invalidate
{
}

- (SESAssertion)sesAssertion
{
  return self->_sesAssertion;
}

- (void).cxx_destruct
{
}

@end