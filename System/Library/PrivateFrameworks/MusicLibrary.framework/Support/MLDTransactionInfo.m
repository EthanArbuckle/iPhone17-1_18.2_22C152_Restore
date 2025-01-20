@interface MLDTransactionInfo
- (ML3Client)client;
- (ML3DatabasePrivacyContext)privacyContext;
- (MLDTaskAssertion)taskAssertion;
- (id)description;
- (void)setClient:(id)a3;
- (void)setPrivacyContext:(id)a3;
- (void)setTaskAssertion:(id)a3;
@end

@implementation MLDTransactionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyContext, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_taskAssertion, 0);
}

- (ML3DatabasePrivacyContext)privacyContext
{
  return self->_privacyContext;
}

- (void)setTaskAssertion:(id)a3
{
}

- (void)setPrivacyContext:(id)a3
{
}

- (void)setClient:(id)a3
{
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p: client=%@>", objc_opt_class(), self, self->_client];
}

- (ML3Client)client
{
  return self->_client;
}

- (MLDTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

@end