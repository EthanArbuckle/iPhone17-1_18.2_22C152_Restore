@interface NFDCKAssertion
- (NFDCKAssertion)initWithSESAssertion:(id)a3;
- (NSString)keyIdentifier;
- (SESDCKAssertion)sesAssertion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation NFDCKAssertion

- (NFDCKAssertion)initWithSESAssertion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFDCKAssertion;
  v6 = [(NFDCKAssertion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sesAssertion, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(NFDCKAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NFDCKAssertion;
  [(NFDCKAssertion *)&v3 dealloc];
}

- (NSString)keyIdentifier
{
  return (NSString *)[(SESDCKAssertion *)self->_sesAssertion keyIdentifier];
}

- (void)invalidate
{
}

- (SESDCKAssertion)sesAssertion
{
  return self->_sesAssertion;
}

- (void).cxx_destruct
{
}

@end