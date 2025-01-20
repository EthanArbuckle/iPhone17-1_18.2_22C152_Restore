@interface WLAuthenticationCredentials
+ (id)generateAuthenticationCredentialsContainingSelfSignedCertificate;
- (__SecCertificate)localCertificate;
- (__SecCertificate)remoteCertificate;
- (__SecKey)privateKey;
- (__SecKey)publicKey;
- (void)setLocalCertificate:(__SecCertificate *)a3;
- (void)setPrivateKey:(__SecKey *)a3;
- (void)setPublicKey:(__SecKey *)a3;
- (void)setRemoteCertificate:(__SecCertificate *)a3;
@end

@implementation WLAuthenticationCredentials

+ (id)generateAuthenticationCredentialsContainingSelfSignedCertificate
{
  v2 = objc_alloc_init(WLAuthenticationCredentials);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __95__WLAuthenticationCredentials_generateAuthenticationCredentialsContainingSelfSignedCertificate__block_invoke;
  v9[3] = &unk_26490C730;
  v4 = v2;
  v10 = v4;
  dispatch_semaphore_t v11 = v3;
  v5 = v3;
  +[WLAuthenticationUtilities generateSelfSignedCertificateWithOrganization:@"Apple Inc" commonName:@"iOS Migration" completion:v9];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v6 = v11;
  v7 = v4;

  return v7;
}

intptr_t __95__WLAuthenticationCredentials_generateAuthenticationCredentialsContainingSelfSignedCertificate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  [*(id *)(a1 + 32) setLocalCertificate:a2];
  [*(id *)(a1 + 32) setPublicKey:a3];
  [*(id *)(a1 + 32) setPrivateKey:a4];
  v7 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v7);
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(__SecKey *)a3
{
  self->_publicKey = a3;
}

- (__SecCertificate)localCertificate
{
  return self->_localCertificate;
}

- (void)setLocalCertificate:(__SecCertificate *)a3
{
  self->_localCertificate = a3;
}

- (__SecCertificate)remoteCertificate
{
  return self->_remoteCertificate;
}

- (void)setRemoteCertificate:(__SecCertificate *)a3
{
  self->_remoteCertificate = a3;
}

@end