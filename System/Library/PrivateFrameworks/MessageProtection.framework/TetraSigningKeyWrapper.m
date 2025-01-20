@interface TetraSigningKeyWrapper
+ (id)generateKeyForTesting;
- (SigningKey)signingKey;
- (TetraSigningKeyWrapper)initWithSigningKey:(id)a3;
- (id)publicKey;
- (id)signDataWithFormatter:(id)a3 error:(id *)a4;
- (id)signDataWithMessageFormatter:(id)a3 error:(id *)a4;
- (id)signDataWithRegistrationFormatter:(id)a3 error:(id *)a4;
- (void)setSigningKey:(id)a3;
@end

@implementation TetraSigningKeyWrapper

- (id)signDataWithFormatter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(TetraSigningKeyWrapper *)self signingKey];
  v8 = [v7 signDataWithFormatter:v6 error:a4];

  return v8;
}

+ (id)generateKeyForTesting
{
  v2 = [TetraSigningKeyWrapper alloc];
  v3 = +[SecKeyP256Private defaultProtectionClassForPlatform];
  v4 = +[FullKey generateNewKeyWithAccess:v3 error:0];
  v5 = [(TetraSigningKeyWrapper *)v2 initWithSigningKey:v4];

  return v5;
}

- (TetraSigningKeyWrapper)initWithSigningKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TetraSigningKeyWrapper;
  id v6 = [(TetraSigningKeyWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_signingKey, a3);
  }

  return v7;
}

- (id)publicKey
{
  v3 = [TetraPublicSigningKeyWrapper alloc];
  v4 = [(SigningKey *)self->_signingKey publicKey];
  id v5 = [(TetraPublicSigningKeyWrapper *)v3 initWithSigningPublicKey:v4];

  return v5;
}

- (id)signDataWithMessageFormatter:(id)a3 error:(id *)a4
{
  return [(SigningKey *)self->_signingKey signDataWithFormatter:a3 error:a4];
}

- (id)signDataWithRegistrationFormatter:(id)a3 error:(id *)a4
{
  return [(SigningKey *)self->_signingKey signDataWithFormatter:a3 error:a4];
}

- (SigningKey)signingKey
{
  return (SigningKey *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSigningKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end