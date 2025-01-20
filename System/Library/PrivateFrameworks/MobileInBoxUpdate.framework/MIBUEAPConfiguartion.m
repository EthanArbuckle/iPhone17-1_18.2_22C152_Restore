@interface MIBUEAPConfiguartion
- (MIBUEAPConfiguartion)init;
- (NSArray)tlsCertificateChain;
- (__SecKey)tlsKey;
- (void)setTLSKey:(__SecKey *)a3;
- (void)setTlsCertificateChain:(id)a3;
@end

@implementation MIBUEAPConfiguartion

- (MIBUEAPConfiguartion)init
{
  v6.receiver = self;
  v6.super_class = (Class)MIBUEAPConfiguartion;
  v2 = [(MIBUEAPConfiguartion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_tlsKey = 0;
    v4 = objc_opt_new();
    [(MIBUEAPConfiguartion *)v3 setTlsCertificateChain:v4];
  }
  return v3;
}

- (void)setTLSKey:(__SecKey *)a3
{
  self->_tlsKey = a3;
}

- (__SecKey)tlsKey
{
  return self->_tlsKey;
}

- (NSArray)tlsCertificateChain
{
  return self->_tlsCertificateChain;
}

- (void)setTlsCertificateChain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end