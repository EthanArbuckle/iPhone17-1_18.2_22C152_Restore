@interface TransparencyTrustedKeyStore
- (NSDictionary)trustedKeys;
- (TransparencySignatureVerifier)signatureVerifier;
- (TransparencyTrustedKeyStore)initWithTrustedKeys:(id)a3;
- (void)setSignatureVerifier:(id)a3;
- (void)setTrustedKeys:(id)a3;
@end

@implementation TransparencyTrustedKeyStore

- (TransparencyTrustedKeyStore)initWithTrustedKeys:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransparencyTrustedKeyStore;
  v5 = [(TransparencyTrustedKeyStore *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(TransparencyTrustedKeyStore *)v5 setTrustedKeys:v4];
    v7 = [[TransparencySignatureVerifier alloc] initWithTrustedKeys:v4];
    [(TransparencyTrustedKeyStore *)v6 setSignatureVerifier:v7];
  }
  return v6;
}

- (TransparencySignatureVerifier)signatureVerifier
{
  return (TransparencySignatureVerifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSignatureVerifier:(id)a3
{
}

- (NSDictionary)trustedKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrustedKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedKeys, 0);

  objc_storeStrong((id *)&self->_signatureVerifier, 0);
}

@end