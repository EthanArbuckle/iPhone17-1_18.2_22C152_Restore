@interface POAuthenticationContext
- (BOOL)federated;
- (NSMutableData)password;
- (NSNumber)userSepSigningAlgorithm;
- (NSString)apv;
- (NSString)encryptionContext;
- (NSString)nonce;
- (NSString)refreshToken;
- (NSString)requestIdentifier;
- (NSString)scope;
- (NSString)serverNonce;
- (NSString)tokenTypeNamespace;
- (NSString)userName;
- (NSString)wsTrustFederationNonce;
- (NSURL)wsTrustFederationMexURL;
- (NSURL)wsTrustFederationURL;
- (NSURLSession)urlSession;
- (POAuthenticationContext)init;
- (PODeviceConfiguration)deviceConfiguration;
- (POJWKSStorageProvider)jwksStorageProvider;
- (POLoginConfiguration)loginConfiguration;
- (__SecCertificate)embeddedAssertionCertificate;
- (__SecKey)embeddedAssertionSigningKey;
- (int64_t)retriesRemaining;
- (int64_t)retryDelay;
- (unint64_t)loginType;
- (unint64_t)wsTrustVersion;
- (void)addRequiredScope:(id)a3;
- (void)dealloc;
- (void)setApv:(id)a3;
- (void)setDeviceConfiguration:(id)a3;
- (void)setEmbeddedAssertionCertificate:(__SecCertificate *)a3;
- (void)setEmbeddedAssertionSigningKey:(__SecKey *)a3;
- (void)setEncryptionContext:(id)a3;
- (void)setFederated:(BOOL)a3;
- (void)setJwksStorageProvider:(id)a3;
- (void)setLoginConfiguration:(id)a3;
- (void)setLoginType:(unint64_t)a3;
- (void)setNonce:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRefreshToken:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRetriesRemaining:(int64_t)a3;
- (void)setRetryDelay:(int64_t)a3;
- (void)setScope:(id)a3;
- (void)setServerNonce:(id)a3;
- (void)setTokenTypeNamespace:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)setUserName:(id)a3;
- (void)setUserSepSigningAlgorithm:(id)a3;
- (void)setWsTrustFederationMexURL:(id)a3;
- (void)setWsTrustFederationNonce:(id)a3;
- (void)setWsTrustFederationURL:(id)a3;
- (void)setWsTrustVersion:(unint64_t)a3;
@end

@implementation POAuthenticationContext

- (POAuthenticationContext)init
{
  v15.receiver = self;
  v15.super_class = (Class)POAuthenticationContext;
  v2 = [(POAuthenticationContext *)&v15 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    nonce = v2->_nonce;
    v2->_nonce = (NSString *)v4;

    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    requestIdentifier = v2->_requestIdentifier;
    v2->_requestIdentifier = (NSString *)v7;

    v9 = NSString;
    v10 = [MEMORY[0x263F08C38] UUID];
    v11 = [v10 UUIDString];
    uint64_t v12 = [v9 stringWithFormat:@"urn:uuid:%@", v11];
    wsTrustFederationNonce = v2->_wsTrustFederationNonce;
    v2->_wsTrustFederationNonce = (NSString *)v12;

    v2->_loginType = 0;
    v2->_wsTrustVersion = 0;
    *(_OWORD *)&v2->_retriesRemaining = xmmword_259EA0ED0;
  }
  return v2;
}

- (void)dealloc
{
  embeddedAssertionSigningKey = self->_embeddedAssertionSigningKey;
  if (embeddedAssertionSigningKey)
  {
    CFRelease(embeddedAssertionSigningKey);
    self->_embeddedAssertionSigningKey = 0;
  }
  embeddedAssertionCertificate = self->_embeddedAssertionCertificate;
  if (embeddedAssertionCertificate)
  {
    CFRelease(embeddedAssertionCertificate);
    self->_embeddedAssertionCertificate = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)POAuthenticationContext;
  [(POAuthenticationContext *)&v5 dealloc];
}

- (void)addRequiredScope:(id)a3
{
  id v11 = a3;
  if ([v11 length])
  {
    uint64_t v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    objc_super v5 = [v11 stringByTrimmingCharactersInSet:v4];

    v6 = [(POAuthenticationContext *)self scope];
    char v7 = [v6 containsString:v5];

    if ((v7 & 1) == 0)
    {
      v8 = NSString;
      v9 = [(POAuthenticationContext *)self scope];
      v10 = [v8 stringWithFormat:@"%@ %@", v9, v5];
      [(POAuthenticationContext *)self setScope:v10];
    }
  }
}

- (POLoginConfiguration)loginConfiguration
{
  return self->_loginConfiguration;
}

- (void)setLoginConfiguration:(id)a3
{
}

- (PODeviceConfiguration)deviceConfiguration
{
  return self->_deviceConfiguration;
}

- (void)setDeviceConfiguration:(id)a3
{
}

- (POJWKSStorageProvider)jwksStorageProvider
{
  return self->_jwksStorageProvider;
}

- (void)setJwksStorageProvider:(id)a3
{
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
}

- (NSMutableData)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (__SecKey)embeddedAssertionSigningKey
{
  return self->_embeddedAssertionSigningKey;
}

- (void)setEmbeddedAssertionSigningKey:(__SecKey *)a3
{
  self->_embeddedAssertionSigningKey = a3;
}

- (__SecCertificate)embeddedAssertionCertificate
{
  return self->_embeddedAssertionCertificate;
}

- (void)setEmbeddedAssertionCertificate:(__SecCertificate *)a3
{
  self->_embeddedAssertionCertificate = a3;
}

- (NSNumber)userSepSigningAlgorithm
{
  return self->_userSepSigningAlgorithm;
}

- (void)setUserSepSigningAlgorithm:(id)a3
{
}

- (NSString)encryptionContext
{
  return self->_encryptionContext;
}

- (void)setEncryptionContext:(id)a3
{
}

- (NSString)serverNonce
{
  return self->_serverNonce;
}

- (void)setServerNonce:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
}

- (NSString)apv
{
  return self->_apv;
}

- (void)setApv:(id)a3
{
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (unint64_t)loginType
{
  return self->_loginType;
}

- (void)setLoginType:(unint64_t)a3
{
  self->_loginType = a3;
}

- (BOOL)federated
{
  return self->_federated;
}

- (void)setFederated:(BOOL)a3
{
  self->_federated = a3;
}

- (unint64_t)wsTrustVersion
{
  return self->_wsTrustVersion;
}

- (void)setWsTrustVersion:(unint64_t)a3
{
  self->_wsTrustVersion = a3;
}

- (NSURL)wsTrustFederationMexURL
{
  return self->_wsTrustFederationMexURL;
}

- (void)setWsTrustFederationMexURL:(id)a3
{
}

- (NSURL)wsTrustFederationURL
{
  return self->_wsTrustFederationURL;
}

- (void)setWsTrustFederationURL:(id)a3
{
}

- (NSString)wsTrustFederationNonce
{
  return self->_wsTrustFederationNonce;
}

- (void)setWsTrustFederationNonce:(id)a3
{
}

- (NSString)tokenTypeNamespace
{
  return self->_tokenTypeNamespace;
}

- (void)setTokenTypeNamespace:(id)a3
{
}

- (int64_t)retriesRemaining
{
  return self->_retriesRemaining;
}

- (void)setRetriesRemaining:(int64_t)a3
{
  self->_retriesRemaining = a3;
}

- (int64_t)retryDelay
{
  return self->_retryDelay;
}

- (void)setRetryDelay:(int64_t)a3
{
  self->_retryDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenTypeNamespace, 0);
  objc_storeStrong((id *)&self->_wsTrustFederationNonce, 0);
  objc_storeStrong((id *)&self->_wsTrustFederationURL, 0);
  objc_storeStrong((id *)&self->_wsTrustFederationMexURL, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_apv, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_serverNonce, 0);
  objc_storeStrong((id *)&self->_encryptionContext, 0);
  objc_storeStrong((id *)&self->_userSepSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_jwksStorageProvider, 0);
  objc_storeStrong((id *)&self->_deviceConfiguration, 0);
  objc_storeStrong((id *)&self->_loginConfiguration, 0);
}

@end