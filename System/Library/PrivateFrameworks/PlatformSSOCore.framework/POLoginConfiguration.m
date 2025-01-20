@interface POLoginConfiguration
+ (BOOL)supportsSecureCoding;
+ (POLoginConfiguration)configurationWithOpenIdConfigurationURL:(id)a3 clientID:(id)a4 issuer:(id)a5 completion:(id)a6;
+ (POLoginConfiguration)configurationWithOpenIdConfigurationURL:(id)a3 identityProviderURL:(id)a4 clientId:(id)a5 issuer:(id)a6 completion:(id)a7;
- (BOOL)includePreviousRefreshTokenInLoginRequest;
- (BOOL)setCustomAssertionRequestBodyClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomAssertionRequestHeaderClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomDecryptionRequestBodyClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomDecryptionRequestHeaderClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomKeyExchangeRequestBodyClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomKeyExchangeRequestHeaderClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomKeyRequestBodyClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomKeyRequestHeaderClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomLoginRequestBodyClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomLoginRequestHeaderClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomRefreshRequestBodyClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomRefreshRequestHeaderClaims:(id)a3 returningError:(id *)a4;
- (NSArray)customDecryptionRequestValues;
- (NSArray)customFederationUserPreauthenticationRequestValues;
- (NSArray)customKeyExchangeRequestValues;
- (NSArray)customKeyRequestValues;
- (NSArray)customLoginRequestValues;
- (NSArray)customNonceRequestValues;
- (NSArray)customRefreshRequestValues;
- (NSArray)jwksTrustedRootCertificates;
- (NSArray)kerberosTicketMappings;
- (NSData)_hpkeAuthPublicKeyData;
- (NSData)_loginRequestEncryptionPublicKeyData;
- (NSData)deviceContext;
- (NSData)hpkePsk;
- (NSData)hpkePsk_id;
- (NSData)loginRequestEncryptionAPVPrefix;
- (NSData)loginRequestHpkePsk;
- (NSData)loginRequestHpkePsk_id;
- (NSDictionary)customAssertionRequestBodyClaims;
- (NSDictionary)customAssertionRequestHeaderClaims;
- (NSDictionary)customKeyExchangeRequestBodyClaims;
- (NSDictionary)customKeyExchangeRequestHeaderClaims;
- (NSDictionary)customKeyRequestBodyClaims;
- (NSDictionary)customKeyRequestHeaderClaims;
- (NSDictionary)customLoginRequestBodyClaims;
- (NSDictionary)customLoginRequestHeaderClaims;
- (NSDictionary)customRefreshRequestBodyClaims;
- (NSDictionary)customRefreshRequestHeaderClaims;
- (NSNumber)loginRequestEncryptionAlgorithm;
- (NSString)accountDisplayName;
- (NSString)additionalAuthorizationScopes;
- (NSString)additionalScopes;
- (NSString)audience;
- (NSString)clientID;
- (NSString)customRequestJWTParameterName;
- (NSString)federationMexURLKeypath;
- (NSString)federationPredicate;
- (NSString)federationRequestURN;
- (NSString)groupRequestClaimName;
- (NSString)groupResponseClaimName;
- (NSString)invalidCredentialPredicate;
- (NSString)issuer;
- (NSString)nonceResponseKeypath;
- (NSString)previousRefreshTokenClaimName;
- (NSString)serverNonceClaimName;
- (NSString)uniqueIdentifierClaimName;
- (NSURL)decryptionEndpointURL;
- (NSURL)federationMexURL;
- (NSURL)federationUserPreauthenticationURL;
- (NSURL)jwksEndpointURL;
- (NSURL)keyEndpointURL;
- (NSURL)nonceEndpointURL;
- (NSURL)refreshEndpointURL;
- (NSURL)tokenEndpointURL;
- (POLoginConfiguration)initWithClientID:(id)a3 issuer:(id)a4 tokenEndpointURL:(id)a5 jwksEndpointURL:(id)a6 audience:(id)a7;
- (POLoginConfiguration)initWithCoder:(id)a3;
- (POLoginConfiguration)initWithData:(id)a3;
- (__SecKey)hpkeAuthPublicKey;
- (__SecKey)loginRequestEncryptionPublicKey;
- (id)_initWithClientId:(id)a3 issuer:(id)a4 tokenEndpointURL:(id)a5 jwksEndpointURL:(id)a6 audience:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)dataRepresentationForDisplay:(BOOL)a3;
- (id)description;
- (id)mergedConfigurationWithUserLoginConfiguration:(id)a3;
- (unint64_t)federationType;
- (unint64_t)userSEPKeyBiometricPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountDisplayName:(id)a3;
- (void)setAdditionalAuthorizationScopes:(id)a3;
- (void)setAdditionalScopes:(id)a3;
- (void)setAudience:(id)a3;
- (void)setCustomAssertionRequestBodyClaims:(id)a3;
- (void)setCustomAssertionRequestHeaderClaims:(id)a3;
- (void)setCustomDecryptionRequestValues:(id)a3;
- (void)setCustomFederationUserPreauthenticationRequestValues:(id)a3;
- (void)setCustomKeyExchangeRequestBodyClaims:(id)a3;
- (void)setCustomKeyExchangeRequestHeaderClaims:(id)a3;
- (void)setCustomKeyExchangeRequestValues:(id)a3;
- (void)setCustomKeyRequestBodyClaims:(id)a3;
- (void)setCustomKeyRequestHeaderClaims:(id)a3;
- (void)setCustomKeyRequestValues:(id)a3;
- (void)setCustomLoginRequestBodyClaims:(id)a3;
- (void)setCustomLoginRequestHeaderClaims:(id)a3;
- (void)setCustomLoginRequestValues:(id)a3;
- (void)setCustomNonceRequestValues:(id)a3;
- (void)setCustomRefreshRequestBodyClaims:(id)a3;
- (void)setCustomRefreshRequestHeaderClaims:(id)a3;
- (void)setCustomRefreshRequestValues:(id)a3;
- (void)setCustomRequestJWTParameterName:(id)a3;
- (void)setDecryptionEndpointURL:(id)a3;
- (void)setDeviceContext:(id)a3;
- (void)setFederationMexURL:(id)a3;
- (void)setFederationMexURLKeypath:(id)a3;
- (void)setFederationPredicate:(id)a3;
- (void)setFederationRequestURN:(id)a3;
- (void)setFederationType:(unint64_t)a3;
- (void)setFederationUserPreauthenticationURL:(id)a3;
- (void)setGroupRequestClaimName:(id)a3;
- (void)setGroupResponseClaimName:(id)a3;
- (void)setHpkeAuthPublicKey:(__SecKey *)a3;
- (void)setHpkePsk:(id)a3;
- (void)setHpkePsk_id:(id)a3;
- (void)setIncludePreviousRefreshTokenInLoginRequest:(BOOL)a3;
- (void)setInvalidCredentialPredicate:(id)a3;
- (void)setJwksEndpointURL:(id)a3;
- (void)setJwksTrustedRootCertificates:(id)a3;
- (void)setKerberosTicketMappings:(id)a3;
- (void)setKeyEndpointURL:(id)a3;
- (void)setLoginRequestEncryptionAPVPrefix:(id)a3;
- (void)setLoginRequestEncryptionAlgorithm:(id)a3;
- (void)setLoginRequestEncryptionPublicKey:(__SecKey *)a3;
- (void)setLoginRequestHpkePsk:(id)a3;
- (void)setLoginRequestHpkePsk_id:(id)a3;
- (void)setNonceEndpointURL:(id)a3;
- (void)setNonceResponseKeypath:(id)a3;
- (void)setPreviousRefreshTokenClaimName:(id)a3;
- (void)setRefreshEndpointURL:(id)a3;
- (void)setServerNonceClaimName:(id)a3;
- (void)setTokenEndpointURL:(id)a3;
- (void)setUniqueIdentifierClaimName:(id)a3;
- (void)setUserSEPKeyBiometricPolicy:(unint64_t)a3;
- (void)set_hpkeAuthPublicKeyData:(id)a3;
- (void)set_loginRequestEncryptionPublicKeyData:(id)a3;
@end

@implementation POLoginConfiguration

- (POLoginConfiguration)initWithClientID:(id)a3 issuer:(id)a4 tokenEndpointURL:(id)a5 jwksEndpointURL:(id)a6 audience:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (![v12 length])
  {
    id v18 = __90__POLoginConfiguration_initWithClientID_issuer_tokenEndpointURL_jwksEndpointURL_audience___block_invoke();
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  if (![v13 length])
  {
    id v19 = __90__POLoginConfiguration_initWithClientID_issuer_tokenEndpointURL_jwksEndpointURL_audience___block_invoke_55();
    goto LABEL_6;
  }
  self = (POLoginConfiguration *)[(POLoginConfiguration *)self _initWithClientId:v12 issuer:v13 tokenEndpointURL:v14 jwksEndpointURL:v15 audience:v16];
  v17 = self;
LABEL_7:

  return v17;
}

id __90__POLoginConfiguration_initWithClientID_issuer_tokenEndpointURL_jwksEndpointURL_audience___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Client ID is missing"];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __90__POLoginConfiguration_initWithClientID_issuer_tokenEndpointURL_jwksEndpointURL_audience___block_invoke_55()
{
  v0 = +[POError errorWithCode:-1008 description:@"Issuer is missing"];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)_initWithClientId:(id)a3 issuer:(id)a4 tokenEndpointURL:(id)a5 jwksEndpointURL:(id)a6 audience:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = 0;
  if (v13 && v14 && v24 && v15)
  {
    id v23 = v16;
    v25.receiver = self;
    v25.super_class = (Class)POLoginConfiguration;
    id v18 = [(POLoginConfiguration *)&v25 init];
    id v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_clientID, a3);
      objc_storeStrong((id *)&v19->_issuer, a4);
      objc_storeStrong((id *)&v19->_tokenEndpointURL, a5);
      objc_storeStrong((id *)&v19->_jwksEndpointURL, a6);
      objc_storeStrong((id *)&v19->_audience, a7);
      additionalScopes = v19->_additionalScopes;
      v19->_additionalScopes = (NSString *)@"urn:apple:platformsso";

      uniqueIdentifierClaimName = v19->_uniqueIdentifierClaimName;
      v19->_uniqueIdentifierClaimName = (NSString *)@"sub";
    }
    self = v19;
    v17 = self;
    id v16 = v23;
  }

  return v17;
}

+ (POLoginConfiguration)configurationWithOpenIdConfigurationURL:(id)a3 clientID:(id)a4 issuer:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [v13 URLByAppendingPathComponent:@"/.well-known/openid-configuration"];
  [a1 configurationWithOpenIdConfigurationURL:v15 identityProviderURL:v13 clientId:v12 issuer:v11 completion:v10];

  return result;
}

+ (POLoginConfiguration)configurationWithOpenIdConfigurationURL:(id)a3 identityProviderURL:(id)a4 clientId:(id)a5 issuer:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  v37 = objc_alloc_init(POSessionDelegate);
  v17 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v16 delegate:v33[5] delegateQueue:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v11 cachePolicy:4 timeoutInterval:60.0];
  [v18 setHTTPMethod:@"GET"];
  [v18 addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke;
  v27 = &unk_265464358;
  v31 = &v32;
  id v19 = v15;
  id v30 = v19;
  id v20 = v13;
  id v28 = v20;
  id v21 = v14;
  id v29 = v21;
  v22 = [v17 dataTaskWithRequest:v18 completionHandler:&v24];
  objc_msgSend(v22, "resume", v24, v25, v26, v27);

  _Block_object_dispose(&v32, 8);
  return result;
}

void __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[7] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  if (v9)
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_2;
    v41[3] = &unk_265463860;
    id v42 = v9;
    id v12 = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_2((uint64_t)v41);
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v8;
      if ([v13 statusCode] >= 200 && objc_msgSend(v13, "statusCode") < 300)
      {
        id v16 = PO_LOG_POLoginConfiguration();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_cold_1((uint64_t)v7);
        }

        id v38 = 0;
        v17 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:16 error:&v38];
        id v18 = v38;
        id v15 = v18;
        if (!v17 || v18)
        {
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_101;
          v36[3] = &unk_265463860;
          id v37 = v18;
          v27 = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_101((uint64_t)v36);
          (*(void (**)(void))(a1[6] + 16))();

          id v28 = v37;
        }
        else
        {
          uint64_t v19 = [v17 objectForKeyedSubscript:@"token_endpoint"];
          uint64_t v20 = [v17 objectForKeyedSubscript:@"jwks_uri"];
          v33 = v17;
          uint64_t v21 = [v17 objectForKeyedSubscript:@"issuer"];
          v22 = [POLoginConfiguration alloc];
          uint64_t v34 = a1[4];
          v35 = v22;
          id v30 = (void *)v21;
          if (a1[5]) {
            uint64_t v23 = a1[5];
          }
          else {
            uint64_t v23 = v21;
          }
          uint64_t v32 = (void *)v19;
          uint64_t v24 = [NSURL URLWithString:v19];
          v31 = (void *)v20;
          uint64_t v25 = [NSURL URLWithString:v20];
          v26 = [(POLoginConfiguration *)v35 initWithClientID:v34 issuer:v23 tokenEndpointURL:v24 jwksEndpointURL:v25 audience:0];

          if (v26)
          {
            (*(void (**)(void))(a1[6] + 16))();
          }
          else
          {
            id v29 = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_116();
            (*(void (**)(void))(a1[6] + 16))();
          }
          id v28 = v32;
          v17 = v33;
        }
      }
      else
      {
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_94;
        v39[3] = &unk_265463860;
        id v40 = v13;
        id v14 = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_94((uint64_t)v39);
        (*(void (**)(void))(a1[6] + 16))();

        id v15 = v40;
      }
    }
    else
    {
      __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_88();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_2(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1009 underlyingError:*(void *)(a1 + 32) description:@"failed to retrieve openid-configuration."];
  v2 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_88()
{
  v0 = +[POError errorWithCode:-1009 description:@"Not a HTTP response when retrieving openid-configuration."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_94(uint64_t a1)
{
  v2 = +[POError errorWithCode:-1009 description:@"Not a HTTP success response when retrieving openid-configuration."];
  v3 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_94_cold_1((uint64_t)v2, a1, v3);
  }

  return v2;
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_101(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1008 underlyingError:*(void *)(a1 + 32) description:@"Failed to parse openid-configuration response."];
  v2 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_116()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to create login configuration when retrieving openid-configuration."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (NSURL)nonceEndpointURL
{
  nonceEndpointURL = self->_nonceEndpointURL;
  if (!nonceEndpointURL) {
    nonceEndpointURL = self->_tokenEndpointURL;
  }
  return nonceEndpointURL;
}

- (BOOL)setCustomAssertionRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomAssertionRequestHeaderClaims:v8];
  }
  else
  {
    id v9 = __77__POLoginConfiguration_setCustomAssertionRequestHeaderClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __77__POLoginConfiguration_setCustomAssertionRequestHeaderClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Assertion request header claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomAssertionRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomAssertionRequestBodyClaims:v8];
  }
  else
  {
    id v9 = __75__POLoginConfiguration_setCustomAssertionRequestBodyClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __75__POLoginConfiguration_setCustomAssertionRequestBodyClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Assertion request body claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomLoginRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomLoginRequestHeaderClaims:v8];
  }
  else
  {
    id v9 = __73__POLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __73__POLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Login request header claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomLoginRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomLoginRequestBodyClaims:v8];
  }
  else
  {
    id v9 = __71__POLoginConfiguration_setCustomLoginRequestBodyClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __71__POLoginConfiguration_setCustomLoginRequestBodyClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Login request body claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (NSString)uniqueIdentifierClaimName
{
  if ([(NSString *)self->_uniqueIdentifierClaimName length]) {
    uniqueIdentifierClaimName = (__CFString *)self->_uniqueIdentifierClaimName;
  }
  else {
    uniqueIdentifierClaimName = @"sub";
  }
  return (NSString *)uniqueIdentifierClaimName;
}

- (NSURL)refreshEndpointURL
{
  return self->_refreshEndpointURL;
}

- (BOOL)setCustomRefreshRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomRefreshRequestHeaderClaims:v8];
  }
  else
  {
    id v9 = __75__POLoginConfiguration_setCustomRefreshRequestHeaderClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __75__POLoginConfiguration_setCustomRefreshRequestHeaderClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Refresh request header claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomRefreshRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomRefreshRequestBodyClaims:v8];
  }
  else
  {
    id v9 = __73__POLoginConfiguration_setCustomRefreshRequestBodyClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __73__POLoginConfiguration_setCustomRefreshRequestBodyClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Refresh request body header claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (__SecKey)loginRequestEncryptionPublicKey
{
  if (self->__loginRequestEncryptionPublicKeyData) {
    return +[POSecKeyHelper ephemeralPublicKeyForData:](POSecKeyHelper, "ephemeralPublicKeyForData:");
  }
  else {
    return 0;
  }
}

- (void)setLoginRequestEncryptionPublicKey:(__SecKey *)a3
{
  if (a3)
  {
    +[POSecKeyHelper dataForEphemeralKey:](POSecKeyHelper, "dataForEphemeralKey:");
    self->__loginRequestEncryptionPublicKeyData = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self->__loginRequestEncryptionPublicKeyData = 0;
  }
  MEMORY[0x270F9A758]();
}

- (NSURL)keyEndpointURL
{
  keyEndpointURL = self->_keyEndpointURL;
  if (!keyEndpointURL) {
    keyEndpointURL = self->_tokenEndpointURL;
  }
  return keyEndpointURL;
}

- (BOOL)setCustomKeyExchangeRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomKeyExchangeRequestHeaderClaims:v8];
  }
  else
  {
    id v9 = __79__POLoginConfiguration_setCustomKeyExchangeRequestHeaderClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __79__POLoginConfiguration_setCustomKeyExchangeRequestHeaderClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Key exchange request header claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomKeyExchangeRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomKeyExchangeRequestBodyClaims:v8];
  }
  else
  {
    id v9 = __77__POLoginConfiguration_setCustomKeyExchangeRequestBodyClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __77__POLoginConfiguration_setCustomKeyExchangeRequestBodyClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Key exchange request body claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomKeyRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomKeyRequestHeaderClaims:v8];
  }
  else
  {
    id v9 = __71__POLoginConfiguration_setCustomKeyRequestHeaderClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __71__POLoginConfiguration_setCustomKeyRequestHeaderClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Key request header claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomKeyRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POLoginConfiguration *)self setCustomKeyRequestBodyClaims:v8];
  }
  else
  {
    id v9 = __69__POLoginConfiguration_setCustomKeyRequestBodyClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __69__POLoginConfiguration_setCustomKeyRequestBodyClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Key request body claims are not valid JSON."];
  v1 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomDecryptionRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  return 0;
}

- (BOOL)setCustomDecryptionRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  return 0;
}

- (__SecKey)hpkeAuthPublicKey
{
  result = (__SecKey *)self->__hpkeAuthPublicKeyData;
  if (result)
  {
    unint64_t v4 = [(__SecKey *)result length];
    hpkeAuthPublicKeyData = self->__hpkeAuthPublicKeyData;
    if (v4 > 0x40)
    {
      return +[POSecKeyHelper ephemeralPublicKeyForData:hpkeAuthPublicKeyData];
    }
    else
    {
      return +[POSecKeyHelper ephemeralX25529PublicKeyForData:hpkeAuthPublicKeyData];
    }
  }
  return result;
}

- (void)setHpkeAuthPublicKey:(__SecKey *)a3
{
  if (a3)
  {
    +[POSecKeyHelper dataForEphemeralKey:](POSecKeyHelper, "dataForEphemeralKey:");
    self->__hpkeAuthPublicKeyData = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self->__hpkeAuthPublicKeyData = 0;
  }
  MEMORY[0x270F9A758]();
}

- (id)dataRepresentation
{
  return [(POLoginConfiguration *)self dataRepresentationForDisplay:0];
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  BOOL v185 = a3;
  uint64_t v234 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  clientID = self->_clientID;
  id v6 = NSStringFromSelector(sel_clientID);
  [v4 setObject:clientID forKeyedSubscript:v6];

  issuer = self->_issuer;
  id v8 = NSStringFromSelector(sel_issuer);
  [v4 setObject:issuer forKeyedSubscript:v8];

  audience = self->_audience;
  uint64_t v10 = NSStringFromSelector(sel_audience);
  [v4 setObject:audience forKeyedSubscript:v10];

  id v11 = [(NSURL *)self->_tokenEndpointURL absoluteString];
  id v12 = NSStringFromSelector(sel_tokenEndpointURL);
  [v4 setObject:v11 forKeyedSubscript:v12];

  id v13 = [(NSURL *)self->_jwksEndpointURL absoluteString];
  id v14 = NSStringFromSelector(sel_jwksEndpointURL);
  [v4 setObject:v13 forKeyedSubscript:v14];

  accountDisplayName = self->_accountDisplayName;
  id v16 = NSStringFromSelector(sel_accountDisplayName);
  [v4 setObject:accountDisplayName forKeyedSubscript:v16];

  invalidCredentialPredicate = self->_invalidCredentialPredicate;
  id v18 = NSStringFromSelector(sel_invalidCredentialPredicate);
  v187 = v4;
  [v4 setObject:invalidCredentialPredicate forKeyedSubscript:v18];

  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  uint64_t v20 = self->_jwksTrustedRootCertificates;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v222 objects:v233 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v223;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v223 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = +[POSecKeyHelper dataForCertificate:*(id *)(*((void *)&v222 + 1) + 8 * i)];
        v26 = objc_msgSend(v25, "psso_base64URLEncodedString");
        [v19 addObject:v26];
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v222 objects:v233 count:16];
    }
    while (v22);
  }

  if ([v19 count])
  {
    v27 = NSStringFromSelector(sel_jwksTrustedRootCertificates);
    [v187 setObject:v19 forKeyedSubscript:v27];
  }
  deviceContext = self->_deviceContext;
  if (v185) {
    [(NSData *)deviceContext psso_sha256HashString];
  }
  else {
  id v29 = [(NSData *)deviceContext psso_base64URLEncodedString];
  }
  id v30 = NSStringFromSelector(sel_deviceContext);
  [v187 setObject:v29 forKeyedSubscript:v30];

  v184 = v19;
  if (v185) {
    +[POConstantCoreUtil stringForSEPBiometricPolicy:self->_userSEPKeyBiometricPolicy];
  }
  else {
  v31 = [NSNumber numberWithUnsignedInteger:self->_userSEPKeyBiometricPolicy];
  }
  uint64_t v32 = NSStringFromSelector(sel_userSEPKeyBiometricPolicy);
  [v187 setObject:v31 forKeyedSubscript:v32];

  v33 = [(NSURL *)self->_nonceEndpointURL absoluteString];
  uint64_t v34 = NSStringFromSelector(sel_nonceEndpointURL);
  [v187 setObject:v33 forKeyedSubscript:v34];

  nonceResponseKeypath = self->_nonceResponseKeypath;
  v36 = NSStringFromSelector(sel_nonceResponseKeypath);
  [v187 setObject:nonceResponseKeypath forKeyedSubscript:v36];

  serverNonceClaimName = self->_serverNonceClaimName;
  id v38 = NSStringFromSelector(sel_serverNonceClaimName);
  [v187 setObject:serverNonceClaimName forKeyedSubscript:v38];

  id v190 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v218 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  v39 = self->_customNonceRequestValues;
  uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v218 objects:v232 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v219;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v219 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v218 + 1) + 8 * j);
        v45 = [v44 value];
        v46 = [v44 name];
        [v190 setObject:v45 forKeyedSubscript:v46];
      }
      uint64_t v41 = [(NSArray *)v39 countByEnumeratingWithState:&v218 objects:v232 count:16];
    }
    while (v41);
  }

  if ([v190 count])
  {
    v47 = NSStringFromSelector(sel_customNonceRequestValues);
    [v187 setObject:v190 forKeyedSubscript:v47];
  }
  customAssertionRequestHeaderClaims = self->_customAssertionRequestHeaderClaims;
  v49 = NSStringFromSelector(sel_customAssertionRequestHeaderClaims);
  [v187 setObject:customAssertionRequestHeaderClaims forKeyedSubscript:v49];

  customAssertionRequestBodyClaims = self->_customAssertionRequestBodyClaims;
  v51 = NSStringFromSelector(sel_customAssertionRequestBodyClaims);
  [v187 setObject:customAssertionRequestBodyClaims forKeyedSubscript:v51];

  additionalScopes = self->_additionalScopes;
  v53 = NSStringFromSelector(sel_additionalScopes);
  [v187 setObject:additionalScopes forKeyedSubscript:v53];

  additionalAuthorizationScopes = self->_additionalAuthorizationScopes;
  v55 = NSStringFromSelector(sel_additionalAuthorizationScopes);
  [v187 setObject:additionalAuthorizationScopes forKeyedSubscript:v55];

  v56 = [NSNumber numberWithBool:self->_includePreviousRefreshTokenInLoginRequest];
  v57 = NSStringFromSelector(sel_includePreviousRefreshTokenInLoginRequest);
  [v187 setObject:v56 forKeyedSubscript:v57];

  previousRefreshTokenClaimName = self->_previousRefreshTokenClaimName;
  v59 = NSStringFromSelector(sel_previousRefreshTokenClaimName);
  [v187 setObject:previousRefreshTokenClaimName forKeyedSubscript:v59];

  customRequestJWTParameterName = self->_customRequestJWTParameterName;
  v61 = NSStringFromSelector(sel_customRequestJWTParameterName);
  [v187 setObject:customRequestJWTParameterName forKeyedSubscript:v61];

  id v189 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  v62 = self->_customLoginRequestValues;
  uint64_t v63 = [(NSArray *)v62 countByEnumeratingWithState:&v214 objects:v231 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v215;
    do
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        if (*(void *)v215 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = *(void **)(*((void *)&v214 + 1) + 8 * k);
        v68 = [v67 value];
        v69 = [v67 name];
        [v189 setObject:v68 forKeyedSubscript:v69];
      }
      uint64_t v64 = [(NSArray *)v62 countByEnumeratingWithState:&v214 objects:v231 count:16];
    }
    while (v64);
  }

  if ([v189 count])
  {
    v70 = NSStringFromSelector(sel_customLoginRequestValues);
    [v187 setObject:v189 forKeyedSubscript:v70];
  }
  customLoginRequestHeaderClaims = self->_customLoginRequestHeaderClaims;
  v72 = NSStringFromSelector(sel_customLoginRequestHeaderClaims);
  [v187 setObject:customLoginRequestHeaderClaims forKeyedSubscript:v72];

  customLoginRequestBodyClaims = self->_customLoginRequestBodyClaims;
  v74 = NSStringFromSelector(sel_customLoginRequestBodyClaims);
  [v187 setObject:customLoginRequestBodyClaims forKeyedSubscript:v74];

  uniqueIdentifierClaimName = self->_uniqueIdentifierClaimName;
  v76 = NSStringFromSelector(sel_uniqueIdentifierClaimName);
  [v187 setObject:uniqueIdentifierClaimName forKeyedSubscript:v76];

  groupRequestClaimName = self->_groupRequestClaimName;
  v78 = NSStringFromSelector(sel_groupRequestClaimName);
  [v187 setObject:groupRequestClaimName forKeyedSubscript:v78];

  groupResponseClaimName = self->_groupResponseClaimName;
  v80 = NSStringFromSelector(sel_groupResponseClaimName);
  [v187 setObject:groupResponseClaimName forKeyedSubscript:v80];

  v81 = [(NSURL *)self->_refreshEndpointURL absoluteString];
  v82 = NSStringFromSelector(sel_refreshEndpointURL);
  [v187 setObject:v81 forKeyedSubscript:v82];

  id v188 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v210 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  v186 = self;
  v83 = self->_customRefreshRequestValues;
  uint64_t v84 = [(NSArray *)v83 countByEnumeratingWithState:&v210 objects:v230 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v211;
    do
    {
      for (uint64_t m = 0; m != v85; ++m)
      {
        if (*(void *)v211 != v86) {
          objc_enumerationMutation(v83);
        }
        v88 = *(void **)(*((void *)&v210 + 1) + 8 * m);
        v89 = [v88 value];
        v90 = [v88 name];
        [v188 setObject:v89 forKeyedSubscript:v90];
      }
      uint64_t v85 = [(NSArray *)v83 countByEnumeratingWithState:&v210 objects:v230 count:16];
    }
    while (v85);
  }

  if ([v188 count])
  {
    v91 = NSStringFromSelector(sel_customRefreshRequestValues);
    [v187 setObject:v188 forKeyedSubscript:v91];
  }
  customRefreshRequestHeaderClaims = v186->_customRefreshRequestHeaderClaims;
  v93 = NSStringFromSelector(sel_customRefreshRequestHeaderClaims);
  [v187 setObject:customRefreshRequestHeaderClaims forKeyedSubscript:v93];

  customRefreshRequestBodyClaims = v186->_customRefreshRequestBodyClaims;
  v95 = NSStringFromSelector(sel_customRefreshRequestBodyClaims);
  [v187 setObject:customRefreshRequestBodyClaims forKeyedSubscript:v95];

  id v96 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v206 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  v97 = v186->_kerberosTicketMappings;
  uint64_t v98 = [(NSArray *)v97 countByEnumeratingWithState:&v206 objects:v229 count:16];
  if (v98)
  {
    uint64_t v99 = v98;
    uint64_t v100 = *(void *)v207;
    do
    {
      for (uint64_t n = 0; n != v99; ++n)
      {
        if (*(void *)v207 != v100) {
          objc_enumerationMutation(v97);
        }
        v102 = [*(id *)(*((void *)&v206 + 1) + 8 * n) dictionaryRepresentation];
        [v96 addObject:v102];
      }
      uint64_t v99 = [(NSArray *)v97 countByEnumeratingWithState:&v206 objects:v229 count:16];
    }
    while (v99);
  }

  if ([v96 count])
  {
    v103 = NSStringFromSelector(sel_kerberosTicketMappings);
    [v187 setObject:v96 forKeyedSubscript:v103];
  }
  v104 = [NSNumber numberWithUnsignedInteger:v186->_federationType];
  v105 = NSStringFromSelector(sel_federationType);
  [v187 setObject:v104 forKeyedSubscript:v105];

  federationRequestURN = v186->_federationRequestURN;
  v107 = NSStringFromSelector(sel_federationRequestURN);
  [v187 setObject:federationRequestURN forKeyedSubscript:v107];

  v108 = [(NSURL *)v186->_federationMexURL absoluteString];
  v109 = NSStringFromSelector(sel_federationMexURL);
  [v187 setObject:v108 forKeyedSubscript:v109];

  v110 = [(NSURL *)v186->_federationUserPreauthenticationURL absoluteString];
  v111 = NSStringFromSelector(sel_federationUserPreauthenticationURL);
  [v187 setObject:v110 forKeyedSubscript:v111];

  federationMexURLKeypath = v186->_federationMexURLKeypath;
  v113 = NSStringFromSelector(sel_federationMexURLKeypath);
  [v187 setObject:federationMexURLKeypath forKeyedSubscript:v113];

  federationPredicate = v186->_federationPredicate;
  v115 = NSStringFromSelector(sel_federationPredicate);
  [v187 setObject:federationPredicate forKeyedSubscript:v115];

  id v116 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  v117 = v186->_customFederationUserPreauthenticationRequestValues;
  uint64_t v118 = [(NSArray *)v117 countByEnumeratingWithState:&v202 objects:v228 count:16];
  if (v118)
  {
    uint64_t v119 = v118;
    uint64_t v120 = *(void *)v203;
    do
    {
      for (iuint64_t i = 0; ii != v119; ++ii)
      {
        if (*(void *)v203 != v120) {
          objc_enumerationMutation(v117);
        }
        v122 = *(void **)(*((void *)&v202 + 1) + 8 * ii);
        v123 = [v122 value];
        v124 = [v122 name];
        [v116 setObject:v123 forKeyedSubscript:v124];
      }
      uint64_t v119 = [(NSArray *)v117 countByEnumeratingWithState:&v202 objects:v228 count:16];
    }
    while (v119);
  }

  if ([v116 count])
  {
    v125 = NSStringFromSelector(sel_customFederationUserPreauthenticationRequestValues);
    [v187 setObject:v116 forKeyedSubscript:v125];
  }
  loginRequestEncryptionPublicKeyData = v186->__loginRequestEncryptionPublicKeyData;
  if (v185) {
    [(NSData *)loginRequestEncryptionPublicKeyData psso_sha256HashString];
  }
  else {
  v127 = [(NSData *)loginRequestEncryptionPublicKeyData psso_base64URLEncodedString];
  }
  v128 = NSStringFromSelector(sel_loginRequestEncryptionPublicKey);
  [v187 setObject:v127 forKeyedSubscript:v128];

  [(POLoginConfiguration *)v186 loginRequestEncryptionAlgorithm];
  if (v185) {
    v127 = {;
  }
    +[POConstantCoreUtil stringForEncryptionAlgorithm:v127];
  v129 = };
  v130 = NSStringFromSelector(sel_loginRequestEncryptionAlgorithm);
  [v187 setObject:v129 forKeyedSubscript:v130];

  if (v185)
  {

    [(NSData *)v186->_loginRequestHpkePsk psso_sha256HashString];
  }
  else
  {
    [(NSData *)v186->_loginRequestHpkePsk psso_base64URLEncodedString];
  v131 = };
  v132 = NSStringFromSelector(sel_loginRequestHpkePsk);
  [v187 setObject:v131 forKeyedSubscript:v132];

  v133 = [(NSData *)v186->_loginRequestHpkePsk_id psso_base64URLEncodedString];
  v134 = NSStringFromSelector(sel_loginRequestHpkePsk_id);
  [v187 setObject:v133 forKeyedSubscript:v134];

  v135 = [(NSData *)v186->_loginRequestEncryptionAPVPrefix psso_base64URLEncodedString];
  v136 = NSStringFromSelector(sel_loginRequestEncryptionAPVPrefix);
  [v187 setObject:v135 forKeyedSubscript:v136];

  v137 = [(NSURL *)v186->_keyEndpointURL absoluteString];
  v138 = NSStringFromSelector(sel_keyEndpointURL);
  [v187 setObject:v137 forKeyedSubscript:v138];

  id v139 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  v140 = v186->_customKeyExchangeRequestValues;
  uint64_t v141 = [(NSArray *)v140 countByEnumeratingWithState:&v198 objects:v227 count:16];
  if (v141)
  {
    uint64_t v142 = v141;
    uint64_t v143 = *(void *)v199;
    do
    {
      for (juint64_t j = 0; jj != v142; ++jj)
      {
        if (*(void *)v199 != v143) {
          objc_enumerationMutation(v140);
        }
        v145 = *(void **)(*((void *)&v198 + 1) + 8 * jj);
        v146 = [v145 value];
        v147 = [v145 name];
        [v139 setObject:v146 forKeyedSubscript:v147];
      }
      uint64_t v142 = [(NSArray *)v140 countByEnumeratingWithState:&v198 objects:v227 count:16];
    }
    while (v142);
  }

  if ([v139 count])
  {
    v148 = NSStringFromSelector(sel_customKeyExchangeRequestValues);
    [v187 setObject:v139 forKeyedSubscript:v148];
  }
  customKeyExchangeRequestHeaderClaims = v186->_customKeyExchangeRequestHeaderClaims;
  v150 = NSStringFromSelector(sel_customKeyExchangeRequestHeaderClaims);
  [v187 setObject:customKeyExchangeRequestHeaderClaims forKeyedSubscript:v150];

  customKeyExchangeRequestBodyClaims = v186->_customKeyExchangeRequestBodyClaims;
  v152 = NSStringFromSelector(sel_customKeyExchangeRequestBodyClaims);
  [v187 setObject:customKeyExchangeRequestBodyClaims forKeyedSubscript:v152];

  id v153 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  v154 = v186->_customKeyRequestValues;
  uint64_t v155 = [(NSArray *)v154 countByEnumeratingWithState:&v194 objects:v226 count:16];
  if (v155)
  {
    uint64_t v156 = v155;
    uint64_t v157 = *(void *)v195;
    do
    {
      for (kuint64_t k = 0; kk != v156; ++kk)
      {
        if (*(void *)v195 != v157) {
          objc_enumerationMutation(v154);
        }
        v159 = *(void **)(*((void *)&v194 + 1) + 8 * kk);
        v160 = [v159 value];
        v161 = [v159 name];
        [v153 setObject:v160 forKeyedSubscript:v161];
      }
      uint64_t v156 = [(NSArray *)v154 countByEnumeratingWithState:&v194 objects:v226 count:16];
    }
    while (v156);
  }

  if ([v153 count])
  {
    v162 = NSStringFromSelector(sel_customKeyRequestValues);
    [v187 setObject:v153 forKeyedSubscript:v162];
  }
  customKeyRequestHeaderClaims = v186->_customKeyRequestHeaderClaims;
  v164 = NSStringFromSelector(sel_customKeyRequestHeaderClaims);
  [v187 setObject:customKeyRequestHeaderClaims forKeyedSubscript:v164];

  customKeyRequestBodyClaims = v186->_customKeyRequestBodyClaims;
  v166 = NSStringFromSelector(sel_customKeyRequestBodyClaims);
  [v187 setObject:customKeyRequestBodyClaims forKeyedSubscript:v166];

  hpkePsuint64_t k = v186->_hpkePsk;
  if (v185) {
    [(NSData *)hpkePsk psso_sha256HashString];
  }
  else {
  v168 = [(NSData *)hpkePsk psso_base64URLEncodedString];
  }
  v169 = NSStringFromSelector(sel_hpkePsk);
  [v187 setObject:v168 forKeyedSubscript:v169];

  v170 = [(NSData *)v186->_hpkePsk_id psso_base64URLEncodedString];
  v171 = NSStringFromSelector(sel_hpkePsk_id);
  [v187 setObject:v170 forKeyedSubscript:v171];

  if (v185) {
    [(NSData *)v186->__hpkeAuthPublicKeyData psso_sha256HashString];
  }
  else {
  v172 = [(NSData *)v186->__hpkeAuthPublicKeyData psso_base64URLEncodedString];
  }
  v173 = NSStringFromSelector(sel_hpkeAuthPublicKey);
  [v187 setObject:v172 forKeyedSubscript:v173];

  id v174 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v174 setFormatOptions:1907];
  v175 = [MEMORY[0x263EFF910] date];
  v176 = [v174 stringFromDate:v175];
  [v187 setObject:v176 forKeyedSubscript:@"created"];

  id v193 = 0;
  v177 = [MEMORY[0x263F08900] dataWithJSONObject:v187 options:11 error:&v193];
  id v178 = v193;
  v179 = v178;
  if (v178)
  {
    v191[0] = MEMORY[0x263EF8330];
    v191[1] = 3221225472;
    v191[2] = __53__POLoginConfiguration_dataRepresentationForDisplay___block_invoke;
    v191[3] = &unk_265463860;
    id v192 = v178;
    id v180 = __53__POLoginConfiguration_dataRepresentationForDisplay___block_invoke((uint64_t)v191);

    id v181 = 0;
  }
  else
  {
    v182 = PO_LOG_POLoginConfiguration();
    if (os_log_type_enabled(v182, OS_LOG_TYPE_DEBUG)) {
      -[POLoginConfiguration dataRepresentationForDisplay:]((uint64_t)v177);
    }

    id v181 = v177;
  }

  return v181;
}

id __53__POLoginConfiguration_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error serializing login config."];
  v2 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (POLoginConfiguration)initWithData:(id)a3
{
  uint64_t v277 = *MEMORY[0x263EF8340];
  id v275 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:16 error:&v275];
  id v5 = v275;
  id v6 = v5;
  if (v5)
  {
    v273[0] = MEMORY[0x263EF8330];
    v273[1] = 3221225472;
    v273[2] = __37__POLoginConfiguration_initWithData___block_invoke;
    v273[3] = &unk_265463860;
    id v274 = v5;
    id v7 = __37__POLoginConfiguration_initWithData___block_invoke((uint64_t)v273);
    id v8 = 0;
    id v9 = v274;
  }
  else
  {
    uint64_t v10 = NSStringFromSelector(sel_clientID);
    id v9 = [v4 objectForKeyedSubscript:v10];

    id v11 = NSStringFromSelector(sel_issuer);
    id v12 = [v4 objectForKeyedSubscript:v11];

    id v13 = NSStringFromSelector(sel_tokenEndpointURL);
    id v14 = [v4 objectForKeyedSubscript:v13];

    if (v14)
    {
      id v15 = NSURL;
      id v16 = NSStringFromSelector(sel_tokenEndpointURL);
      v17 = [v4 objectForKeyedSubscript:v16];
      id v18 = [v15 URLWithString:v17];
    }
    else
    {
      id v18 = 0;
    }
    id v19 = NSStringFromSelector(sel_jwksEndpointURL);
    uint64_t v20 = [v4 objectForKeyedSubscript:v19];

    if (v20)
    {
      uint64_t v21 = NSURL;
      uint64_t v22 = NSStringFromSelector(sel_jwksEndpointURL);
      uint64_t v23 = [v4 objectForKeyedSubscript:v22];
      uint64_t v24 = [v21 URLWithString:v23];
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v25 = NSStringFromSelector(sel_audience);
    v26 = [v4 objectForKeyedSubscript:v25];

    id v27 = [(POLoginConfiguration *)self _initWithClientId:v9 issuer:v12 tokenEndpointURL:v18 jwksEndpointURL:v24 audience:v26];
    if (v27)
    {
      v249 = v26;
      v250 = v24;
      v251 = v18;
      v252 = v12;
      v253 = v9;
      id v28 = NSStringFromSelector(sel_accountDisplayName);
      uint64_t v29 = [v4 objectForKeyedSubscript:v28];
      id v30 = (void *)*((void *)v27 + 3);
      *((void *)v27 + 3) = v29;

      v31 = NSStringFromSelector(sel_invalidCredentialPredicate);
      uint64_t v32 = [v4 objectForKeyedSubscript:v31];
      v33 = (void *)*((void *)v27 + 2);
      *((void *)v27 + 2) = v32;

      id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v269 = 0u;
      long long v270 = 0u;
      long long v271 = 0u;
      long long v272 = 0u;
      v35 = NSStringFromSelector(sel_jwksTrustedRootCertificates);
      v254 = v4;
      v36 = [v4 objectForKeyedSubscript:v35];

      uint64_t v37 = [v36 countByEnumeratingWithState:&v269 objects:v276 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v270;
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v270 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void *)(*((void *)&v269 + 1) + 8 * i);
            id v42 = objc_alloc(MEMORY[0x263EFF8F8]);
            v43 = objc_msgSend(v42, "psso_initWithBase64URLEncodedString:", v41);

            if (v43)
            {
              v44 = +[POSecKeyHelper certificateForData:v43];
              [v34 addObject:v44];
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v269 objects:v276 count:16];
        }
        while (v38);
      }

      if ([v34 count]) {
        objc_storeStrong((id *)v27 + 9, v34);
      }
      v45 = NSStringFromSelector(sel_deviceContext);
      v46 = [v254 objectForKeyedSubscript:v45];

      if (v46)
      {
        id v47 = objc_alloc(MEMORY[0x263EFF8F8]);
        v48 = NSStringFromSelector(sel_deviceContext);
        v49 = [v254 objectForKeyedSubscript:v48];
        uint64_t v50 = objc_msgSend(v47, "psso_initWithBase64URLEncodedString:", v49);

        v51 = (void *)*((void *)v27 + 10);
        *((void *)v27 + 10) = v50;
      }
      v52 = NSStringFromSelector(sel_userSEPKeyBiometricPolicy);
      v53 = [v254 objectForKeyedSubscript:v52];
      *((void *)v27 + 11) = (int)[v53 intValue];

      v54 = NSStringFromSelector(sel_nonceEndpointURL);
      v55 = [v254 objectForKeyedSubscript:v54];

      if (v55)
      {
        v56 = NSURL;
        v57 = NSStringFromSelector(sel_nonceEndpointURL);
        v58 = [v254 objectForKeyedSubscript:v57];
        uint64_t v59 = [v56 URLWithString:v58];
        v60 = (void *)*((void *)v27 + 12);
        *((void *)v27 + 12) = v59;
      }
      v61 = NSStringFromSelector(sel_nonceResponseKeypath);
      uint64_t v62 = [v254 objectForKeyedSubscript:v61];
      uint64_t v63 = (void *)*((void *)v27 + 13);
      *((void *)v27 + 13) = v62;

      uint64_t v64 = NSStringFromSelector(sel_serverNonceClaimName);
      uint64_t v65 = [v254 objectForKeyedSubscript:v64];
      v66 = (void *)*((void *)v27 + 14);
      *((void *)v27 + 14) = v65;

      id v67 = objc_alloc_init(MEMORY[0x263EFF980]);
      v68 = NSStringFromSelector(sel_customNonceRequestValues);
      v69 = [v254 objectForKeyedSubscript:v68];

      v267[0] = MEMORY[0x263EF8330];
      v267[1] = 3221225472;
      v267[2] = __37__POLoginConfiguration_initWithData___block_invoke_297;
      v267[3] = &unk_265464380;
      id v70 = v67;
      id v268 = v70;
      v248 = v69;
      [v69 enumerateKeysAndObjectsUsingBlock:v267];
      if ([v70 count]) {
        objc_storeStrong((id *)v27 + 15, v67);
      }
      v71 = NSStringFromSelector(sel_customAssertionRequestHeaderClaims);
      uint64_t v72 = [v254 objectForKeyedSubscript:v71];
      v73 = (void *)*((void *)v27 + 45);
      *((void *)v27 + 45) = v72;

      v74 = NSStringFromSelector(sel_customAssertionRequestBodyClaims);
      uint64_t v75 = [v254 objectForKeyedSubscript:v74];
      v76 = (void *)*((void *)v27 + 46);
      *((void *)v27 + 46) = v75;

      v77 = NSStringFromSelector(sel_additionalScopes);
      uint64_t v78 = [v254 objectForKeyedSubscript:v77];
      v79 = (void *)*((void *)v27 + 16);
      *((void *)v27 + 16) = v78;

      v80 = NSStringFromSelector(sel_additionalAuthorizationScopes);
      uint64_t v81 = [v254 objectForKeyedSubscript:v80];
      v82 = (void *)*((void *)v27 + 17);
      *((void *)v27 + 17) = v81;

      v83 = NSStringFromSelector(sel_includePreviousRefreshTokenInLoginRequest);
      uint64_t v84 = [v254 objectForKeyedSubscript:v83];
      *((unsigned char *)v27 + 8) = [v84 BOOLValue];

      uint64_t v85 = NSStringFromSelector(sel_previousRefreshTokenClaimName);
      uint64_t v86 = [v254 objectForKeyedSubscript:v85];
      v87 = (void *)*((void *)v27 + 18);
      *((void *)v27 + 18) = v86;

      v88 = NSStringFromSelector(sel_customRequestJWTParameterName);
      uint64_t v89 = [v254 objectForKeyedSubscript:v88];
      v90 = (void *)*((void *)v27 + 19);
      *((void *)v27 + 19) = v89;

      id v91 = objc_alloc_init(MEMORY[0x263EFF980]);
      v92 = NSStringFromSelector(sel_customLoginRequestValues);
      v93 = [v254 objectForKeyedSubscript:v92];

      v265[0] = MEMORY[0x263EF8330];
      v265[1] = 3221225472;
      v265[2] = __37__POLoginConfiguration_initWithData___block_invoke_2;
      v265[3] = &unk_265464380;
      id v94 = v91;
      id v266 = v94;
      v247 = v93;
      [v93 enumerateKeysAndObjectsUsingBlock:v265];
      if ([v94 count]) {
        objc_storeStrong((id *)v27 + 20, v91);
      }
      v95 = NSStringFromSelector(sel_customLoginRequestHeaderClaims);
      uint64_t v96 = [v254 objectForKeyedSubscript:v95];
      v97 = (void *)*((void *)v27 + 47);
      *((void *)v27 + 47) = v96;

      uint64_t v98 = NSStringFromSelector(sel_customLoginRequestBodyClaims);
      uint64_t v99 = [v254 objectForKeyedSubscript:v98];
      uint64_t v100 = (void *)*((void *)v27 + 48);
      *((void *)v27 + 48) = v99;

      v101 = NSStringFromSelector(sel_uniqueIdentifierClaimName);
      uint64_t v102 = [v254 objectForKeyedSubscript:v101];
      v103 = (void *)*((void *)v27 + 21);
      *((void *)v27 + 21) = v102;

      v104 = NSStringFromSelector(sel_groupRequestClaimName);
      uint64_t v105 = [v254 objectForKeyedSubscript:v104];
      v106 = (void *)*((void *)v27 + 22);
      *((void *)v27 + 22) = v105;

      v107 = NSStringFromSelector(sel_groupResponseClaimName);
      uint64_t v108 = [v254 objectForKeyedSubscript:v107];
      v109 = (void *)*((void *)v27 + 23);
      *((void *)v27 + 23) = v108;

      v110 = NSStringFromSelector(sel_refreshEndpointURL);
      v111 = [v254 objectForKeyedSubscript:v110];

      if (v111)
      {
        v112 = NSURL;
        v113 = NSStringFromSelector(sel_refreshEndpointURL);
        v114 = [v254 objectForKeyedSubscript:v113];
        uint64_t v115 = [v112 URLWithString:v114];
        id v116 = (void *)*((void *)v27 + 24);
        *((void *)v27 + 24) = v115;
      }
      id v117 = objc_alloc_init(MEMORY[0x263EFF980]);

      uint64_t v118 = NSStringFromSelector(sel_customRefreshRequestValues);
      uint64_t v119 = [v254 objectForKeyedSubscript:v118];

      v263[0] = MEMORY[0x263EF8330];
      v263[1] = 3221225472;
      v263[2] = __37__POLoginConfiguration_initWithData___block_invoke_3;
      v263[3] = &unk_265464380;
      id v120 = v117;
      id v264 = v120;
      v246 = v119;
      [v119 enumerateKeysAndObjectsUsingBlock:v263];
      if ([v120 count]) {
        objc_storeStrong((id *)v27 + 25, v117);
      }
      v121 = NSStringFromSelector(sel_customRefreshRequestHeaderClaims);
      uint64_t v122 = [v254 objectForKeyedSubscript:v121];
      v123 = (void *)*((void *)v27 + 49);
      *((void *)v27 + 49) = v122;

      v124 = NSStringFromSelector(sel_customRefreshRequestBodyClaims);
      uint64_t v125 = [v254 objectForKeyedSubscript:v124];
      v126 = (void *)*((void *)v27 + 50);
      *((void *)v27 + 50) = v125;

      id v127 = objc_alloc_init(MEMORY[0x263EFF980]);
      v128 = NSStringFromSelector(sel_kerberosTicketMappings);
      v129 = [v254 objectForKeyedSubscript:v128];

      v261[0] = MEMORY[0x263EF8330];
      v261[1] = 3221225472;
      v261[2] = __37__POLoginConfiguration_initWithData___block_invoke_4;
      v261[3] = &unk_265463978;
      id v130 = v127;
      id v262 = v130;
      v245 = v129;
      [v129 enumerateObjectsUsingBlock:v261];
      if ([v130 count]) {
        objc_storeStrong((id *)v27 + 26, v127);
      }
      v131 = NSStringFromSelector(sel_federationType);
      v132 = [v254 objectForKeyedSubscript:v131];
      *((void *)v27 + 27) = (int)[v132 intValue];

      v133 = NSStringFromSelector(sel_federationRequestURN);
      uint64_t v134 = [v254 objectForKeyedSubscript:v133];
      v135 = (void *)*((void *)v27 + 28);
      *((void *)v27 + 28) = v134;

      v136 = NSStringFromSelector(sel_federationMexURL);
      v137 = [v254 objectForKeyedSubscript:v136];

      if (v137)
      {
        v138 = NSURL;
        id v139 = NSStringFromSelector(sel_federationMexURL);
        v140 = [v254 objectForKeyedSubscript:v139];
        uint64_t v141 = [v138 URLWithString:v140];
        uint64_t v142 = (void *)*((void *)v27 + 29);
        *((void *)v27 + 29) = v141;
      }
      uint64_t v143 = NSStringFromSelector(sel_federationUserPreauthenticationURL);
      v144 = [v254 objectForKeyedSubscript:v143];

      if (v144)
      {
        v145 = NSURL;
        v146 = NSStringFromSelector(sel_federationUserPreauthenticationURL);
        v147 = [v254 objectForKeyedSubscript:v146];
        uint64_t v148 = [v145 URLWithString:v147];
        v149 = (void *)*((void *)v27 + 30);
        *((void *)v27 + 30) = v148;
      }
      v150 = NSStringFromSelector(sel_federationMexURLKeypath);
      uint64_t v151 = [v254 objectForKeyedSubscript:v150];
      v152 = (void *)*((void *)v27 + 31);
      *((void *)v27 + 31) = v151;

      id v153 = NSStringFromSelector(sel_federationPredicate);
      uint64_t v154 = [v254 objectForKeyedSubscript:v153];
      uint64_t v155 = (void *)*((void *)v27 + 32);
      *((void *)v27 + 32) = v154;

      id v156 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v157 = NSStringFromSelector(sel_customFederationUserPreauthenticationRequestValues);
      v158 = [v254 objectForKeyedSubscript:v157];

      v259[0] = MEMORY[0x263EF8330];
      v259[1] = 3221225472;
      v259[2] = __37__POLoginConfiguration_initWithData___block_invoke_5;
      v259[3] = &unk_265464380;
      id v159 = v156;
      id v260 = v159;
      v244 = v158;
      [v158 enumerateKeysAndObjectsUsingBlock:v259];
      if ([v159 count]) {
        objc_storeStrong((id *)v27 + 33, v156);
      }
      v160 = NSStringFromSelector(sel_loginRequestEncryptionPublicKey);
      v161 = [v254 objectForKeyedSubscript:v160];

      if (v161)
      {
        id v162 = objc_alloc(MEMORY[0x263EFF8F8]);
        v163 = NSStringFromSelector(sel_loginRequestEncryptionPublicKey);
        v164 = [v254 objectForKeyedSubscript:v163];
        uint64_t v165 = objc_msgSend(v162, "psso_initWithBase64URLEncodedString:", v164);

        v166 = (void *)*((void *)v27 + 55);
        *((void *)v27 + 55) = v165;
      }
      v167 = NSStringFromSelector(sel_loginRequestEncryptionAlgorithm);
      v168 = [v254 objectForKeyedSubscript:v167];

      if (v168)
      {
        v169 = NSStringFromSelector(sel_loginRequestEncryptionAlgorithm);
        uint64_t v170 = [v254 objectForKeyedSubscript:v169];

        v171 = (void *)*((void *)v27 + 34);
        *((void *)v27 + 34) = v170;
      }
      else
      {
        id v172 = &unk_2707DBB50;
        v171 = (void *)*((void *)v27 + 34);
        *((void *)v27 + 34) = v172;
      }

      v173 = NSStringFromSelector(sel_loginRequestHpkePsk_id);
      id v174 = [v254 objectForKeyedSubscript:v173];

      if (v174)
      {
        id v175 = objc_alloc(MEMORY[0x263EFF8F8]);
        v176 = NSStringFromSelector(sel_loginRequestHpkePsk_id);
        v177 = [v254 objectForKeyedSubscript:v176];
        uint64_t v178 = objc_msgSend(v175, "psso_initWithBase64URLEncodedString:", v177);

        v179 = (void *)*((void *)v27 + 36);
        *((void *)v27 + 36) = v178;
      }
      id v180 = NSStringFromSelector(sel_loginRequestHpkePsk);
      id v181 = [v254 objectForKeyedSubscript:v180];

      if (v181)
      {
        id v182 = objc_alloc(MEMORY[0x263EFF8F8]);
        v183 = NSStringFromSelector(sel_loginRequestHpkePsk);
        v184 = [v254 objectForKeyedSubscript:v183];
        uint64_t v185 = objc_msgSend(v182, "psso_initWithBase64URLEncodedString:", v184);

        v186 = (void *)*((void *)v27 + 35);
        *((void *)v27 + 35) = v185;
      }
      v187 = NSStringFromSelector(sel_loginRequestEncryptionAPVPrefix);
      id v188 = [v254 objectForKeyedSubscript:v187];

      if (v188)
      {
        id v189 = objc_alloc(MEMORY[0x263EFF8F8]);
        id v190 = NSStringFromSelector(sel_loginRequestEncryptionAPVPrefix);
        v191 = [v254 objectForKeyedSubscript:v190];
        uint64_t v192 = objc_msgSend(v189, "psso_initWithBase64URLEncodedString:", v191);

        id v193 = (void *)*((void *)v27 + 37);
        *((void *)v27 + 37) = v192;
      }
      long long v194 = NSStringFromSelector(sel_keyEndpointURL);
      long long v195 = [v254 objectForKeyedSubscript:v194];

      if (v195)
      {
        long long v196 = NSURL;
        long long v197 = NSStringFromSelector(sel_keyEndpointURL);
        long long v198 = [v254 objectForKeyedSubscript:v197];
        uint64_t v199 = [v196 URLWithString:v198];
        long long v200 = (void *)*((void *)v27 + 38);
        *((void *)v27 + 38) = v199;
      }
      id v201 = objc_alloc_init(MEMORY[0x263EFF980]);

      long long v202 = NSStringFromSelector(sel_customKeyExchangeRequestValues);
      long long v203 = [v254 objectForKeyedSubscript:v202];

      v257[0] = MEMORY[0x263EF8330];
      v257[1] = 3221225472;
      v257[2] = __37__POLoginConfiguration_initWithData___block_invoke_6;
      v257[3] = &unk_265464380;
      id v204 = v201;
      id v258 = v204;
      v243 = v203;
      [v203 enumerateKeysAndObjectsUsingBlock:v257];
      if ([v204 count]) {
        objc_storeStrong((id *)v27 + 39, v201);
      }
      long long v205 = NSStringFromSelector(sel_customKeyExchangeRequestHeaderClaims);
      uint64_t v206 = [v254 objectForKeyedSubscript:v205];
      long long v207 = (void *)*((void *)v27 + 53);
      *((void *)v27 + 53) = v206;

      long long v208 = NSStringFromSelector(sel_customKeyExchangeRequestBodyClaims);
      uint64_t v209 = [v254 objectForKeyedSubscript:v208];
      long long v210 = (void *)*((void *)v27 + 54);
      *((void *)v27 + 54) = v209;

      id v211 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v212 = NSStringFromSelector(sel_customKeyRequestValues);
      long long v213 = [v254 objectForKeyedSubscript:v212];

      v255[0] = MEMORY[0x263EF8330];
      v255[1] = 3221225472;
      v255[2] = __37__POLoginConfiguration_initWithData___block_invoke_7;
      v255[3] = &unk_265464380;
      id v214 = v211;
      id v256 = v214;
      [v213 enumerateKeysAndObjectsUsingBlock:v255];
      if ([v214 count]) {
        objc_storeStrong((id *)v27 + 40, v211);
      }
      long long v215 = NSStringFromSelector(sel_customKeyRequestHeaderClaims);
      uint64_t v216 = [v254 objectForKeyedSubscript:v215];
      long long v217 = (void *)*((void *)v27 + 51);
      *((void *)v27 + 51) = v216;

      long long v218 = NSStringFromSelector(sel_customKeyRequestBodyClaims);
      uint64_t v219 = [v254 objectForKeyedSubscript:v218];
      long long v220 = (void *)*((void *)v27 + 52);
      *((void *)v27 + 52) = v219;

      long long v221 = NSStringFromSelector(sel_hpkeAuthPublicKey);
      long long v222 = [v254 objectForKeyedSubscript:v221];

      if (v222)
      {
        id v223 = objc_alloc(MEMORY[0x263EFF8F8]);
        long long v224 = NSStringFromSelector(sel_hpkeAuthPublicKey);
        long long v225 = [v254 objectForKeyedSubscript:v224];
        uint64_t v226 = objc_msgSend(v223, "psso_initWithBase64URLEncodedString:", v225);

        v227 = (void *)*((void *)v27 + 56);
        *((void *)v27 + 56) = v226;
      }
      v228 = NSStringFromSelector(sel_hpkePsk_id);
      v229 = [v254 objectForKeyedSubscript:v228];

      if (v229)
      {
        id v230 = objc_alloc(MEMORY[0x263EFF8F8]);
        v231 = NSStringFromSelector(sel_hpkePsk_id);
        v232 = [v254 objectForKeyedSubscript:v231];
        uint64_t v233 = objc_msgSend(v230, "psso_initWithBase64URLEncodedString:", v232);

        uint64_t v234 = (void *)*((void *)v27 + 44);
        *((void *)v27 + 44) = v233;
      }
      v235 = NSStringFromSelector(sel_hpkePsk);
      v236 = [v254 objectForKeyedSubscript:v235];

      if (v236)
      {
        id v237 = objc_alloc(MEMORY[0x263EFF8F8]);
        v238 = NSStringFromSelector(sel_hpkePsk);
        v239 = [v254 objectForKeyedSubscript:v238];
        uint64_t v240 = objc_msgSend(v237, "psso_initWithBase64URLEncodedString:", v239);

        v241 = (void *)*((void *)v27 + 43);
        *((void *)v27 + 43) = v240;
      }
      id v4 = v254;
      id v9 = v253;
      id v18 = v251;
      id v12 = v252;
      v26 = v249;
      uint64_t v24 = v250;
    }
    self = (POLoginConfiguration *)v27;

    id v8 = self;
  }

  return v8;
}

id __37__POLoginConfiguration_initWithData___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing login config."];
  v2 = PO_LOG_POLoginConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

void __37__POLoginConfiguration_initWithData___block_invoke_297(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

void __37__POLoginConfiguration_initWithData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

void __37__POLoginConfiguration_initWithData___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

void __37__POLoginConfiguration_initWithData___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [[POKerberosMapping alloc] initWithDictionary:v5];
    [v3 addObject:v4];
  }
}

void __37__POLoginConfiguration_initWithData___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

void __37__POLoginConfiguration_initWithData___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

void __37__POLoginConfiguration_initWithData___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(POLoginConfiguration *)self dataRepresentationForDisplay:1];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

- (id)mergedConfigurationWithUserLoginConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(POLoginConfiguration *)self copy];
  id v6 = [v5 customAssertionRequestHeaderClaims];
  id v7 = v6;
  id v8 = (void *)MEMORY[0x263EFFA78];
  if (!v6) {
    id v6 = (void *)MEMORY[0x263EFFA78];
  }
  id v9 = (void *)[v6 mutableCopy];

  uint64_t v10 = [v4 customAssertionRequestHeaderClaims];
  [v9 addEntriesFromDictionary:v10];

  [v5 setCustomAssertionRequestHeaderClaims:v9];
  id v11 = [v5 customAssertionRequestBodyClaims];
  id v12 = v11;
  if (!v11) {
    id v11 = v8;
  }
  id v13 = (void *)[v11 mutableCopy];

  id v14 = [v4 customAssertionRequestBodyClaims];
  [v13 addEntriesFromDictionary:v14];

  [v5 setCustomAssertionRequestBodyClaims:v13];
  id v15 = [v5 customLoginRequestHeaderClaims];
  id v16 = v15;
  if (!v15) {
    id v15 = v8;
  }
  v17 = (void *)[v15 mutableCopy];

  id v18 = [v4 customLoginRequestHeaderClaims];
  [v17 addEntriesFromDictionary:v18];

  [v5 setCustomLoginRequestHeaderClaims:v17];
  id v19 = [v5 customLoginRequestBodyClaims];
  uint64_t v20 = v19;
  if (!v19) {
    id v19 = v8;
  }
  uint64_t v21 = (void *)[v19 mutableCopy];

  uint64_t v22 = [v4 customLoginRequestBodyClaims];

  [v21 addEntriesFromDictionary:v22];
  [v5 setCustomLoginRequestBodyClaims:v21];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [POLoginConfiguration alloc];
  id v5 = [(POLoginConfiguration *)self dataRepresentation];
  id v6 = [(POLoginConfiguration *)v4 initWithData:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POLoginConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_dataRepresentation);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = [(POLoginConfiguration *)self initWithData:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(POLoginConfiguration *)self dataRepresentation];
  uint64_t v5 = NSStringFromSelector(sel_dataRepresentation);
  [v4 encodeObject:v6 forKey:v5];
}

- (NSString)invalidCredentialPredicate
{
  return self->_invalidCredentialPredicate;
}

- (void)setInvalidCredentialPredicate:(id)a3
{
}

- (NSString)accountDisplayName
{
  return self->_accountDisplayName;
}

- (void)setAccountDisplayName:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSString)audience
{
  return self->_audience;
}

- (void)setAudience:(id)a3
{
}

- (NSURL)tokenEndpointURL
{
  return self->_tokenEndpointURL;
}

- (void)setTokenEndpointURL:(id)a3
{
}

- (NSURL)jwksEndpointURL
{
  return self->_jwksEndpointURL;
}

- (void)setJwksEndpointURL:(id)a3
{
}

- (NSArray)jwksTrustedRootCertificates
{
  return self->_jwksTrustedRootCertificates;
}

- (void)setJwksTrustedRootCertificates:(id)a3
{
}

- (NSData)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
}

- (unint64_t)userSEPKeyBiometricPolicy
{
  return self->_userSEPKeyBiometricPolicy;
}

- (void)setUserSEPKeyBiometricPolicy:(unint64_t)a3
{
  self->_userSEPKeyBiometricPolicy = a3;
}

- (void)setNonceEndpointURL:(id)a3
{
}

- (NSString)nonceResponseKeypath
{
  return self->_nonceResponseKeypath;
}

- (void)setNonceResponseKeypath:(id)a3
{
}

- (NSString)serverNonceClaimName
{
  return self->_serverNonceClaimName;
}

- (void)setServerNonceClaimName:(id)a3
{
}

- (NSArray)customNonceRequestValues
{
  return self->_customNonceRequestValues;
}

- (void)setCustomNonceRequestValues:(id)a3
{
}

- (NSString)additionalScopes
{
  return self->_additionalScopes;
}

- (void)setAdditionalScopes:(id)a3
{
}

- (NSString)additionalAuthorizationScopes
{
  return self->_additionalAuthorizationScopes;
}

- (void)setAdditionalAuthorizationScopes:(id)a3
{
}

- (BOOL)includePreviousRefreshTokenInLoginRequest
{
  return self->_includePreviousRefreshTokenInLoginRequest;
}

- (void)setIncludePreviousRefreshTokenInLoginRequest:(BOOL)a3
{
  self->_includePreviousRefreshTokenInLoginRequest = a3;
}

- (NSString)previousRefreshTokenClaimName
{
  return self->_previousRefreshTokenClaimName;
}

- (void)setPreviousRefreshTokenClaimName:(id)a3
{
}

- (NSString)customRequestJWTParameterName
{
  return self->_customRequestJWTParameterName;
}

- (void)setCustomRequestJWTParameterName:(id)a3
{
}

- (NSArray)customLoginRequestValues
{
  return self->_customLoginRequestValues;
}

- (void)setCustomLoginRequestValues:(id)a3
{
}

- (void)setUniqueIdentifierClaimName:(id)a3
{
}

- (NSString)groupRequestClaimName
{
  return self->_groupRequestClaimName;
}

- (void)setGroupRequestClaimName:(id)a3
{
}

- (NSString)groupResponseClaimName
{
  return self->_groupResponseClaimName;
}

- (void)setGroupResponseClaimName:(id)a3
{
}

- (void)setRefreshEndpointURL:(id)a3
{
}

- (NSArray)customRefreshRequestValues
{
  return self->_customRefreshRequestValues;
}

- (void)setCustomRefreshRequestValues:(id)a3
{
}

- (NSArray)kerberosTicketMappings
{
  return self->_kerberosTicketMappings;
}

- (void)setKerberosTicketMappings:(id)a3
{
}

- (unint64_t)federationType
{
  return self->_federationType;
}

- (void)setFederationType:(unint64_t)a3
{
  self->_federationType = a3;
}

- (NSString)federationRequestURN
{
  return self->_federationRequestURN;
}

- (void)setFederationRequestURN:(id)a3
{
}

- (NSURL)federationMexURL
{
  return self->_federationMexURL;
}

- (void)setFederationMexURL:(id)a3
{
}

- (NSURL)federationUserPreauthenticationURL
{
  return self->_federationUserPreauthenticationURL;
}

- (void)setFederationUserPreauthenticationURL:(id)a3
{
}

- (NSString)federationMexURLKeypath
{
  return self->_federationMexURLKeypath;
}

- (void)setFederationMexURLKeypath:(id)a3
{
}

- (NSString)federationPredicate
{
  return self->_federationPredicate;
}

- (void)setFederationPredicate:(id)a3
{
}

- (NSArray)customFederationUserPreauthenticationRequestValues
{
  return self->_customFederationUserPreauthenticationRequestValues;
}

- (void)setCustomFederationUserPreauthenticationRequestValues:(id)a3
{
}

- (NSNumber)loginRequestEncryptionAlgorithm
{
  return self->_loginRequestEncryptionAlgorithm;
}

- (void)setLoginRequestEncryptionAlgorithm:(id)a3
{
}

- (NSData)loginRequestHpkePsk
{
  return self->_loginRequestHpkePsk;
}

- (void)setLoginRequestHpkePsk:(id)a3
{
}

- (NSData)loginRequestHpkePsk_id
{
  return self->_loginRequestHpkePsk_id;
}

- (void)setLoginRequestHpkePsk_id:(id)a3
{
}

- (NSData)loginRequestEncryptionAPVPrefix
{
  return self->_loginRequestEncryptionAPVPrefix;
}

- (void)setLoginRequestEncryptionAPVPrefix:(id)a3
{
}

- (void)setKeyEndpointURL:(id)a3
{
}

- (NSArray)customKeyExchangeRequestValues
{
  return self->_customKeyExchangeRequestValues;
}

- (void)setCustomKeyExchangeRequestValues:(id)a3
{
}

- (NSArray)customKeyRequestValues
{
  return self->_customKeyRequestValues;
}

- (void)setCustomKeyRequestValues:(id)a3
{
}

- (NSArray)customDecryptionRequestValues
{
  return self->_customDecryptionRequestValues;
}

- (void)setCustomDecryptionRequestValues:(id)a3
{
}

- (NSURL)decryptionEndpointURL
{
  return self->_decryptionEndpointURL;
}

- (void)setDecryptionEndpointURL:(id)a3
{
}

- (NSData)hpkePsk
{
  return self->_hpkePsk;
}

- (void)setHpkePsk:(id)a3
{
}

- (NSData)hpkePsk_id
{
  return self->_hpkePsk_id;
}

- (void)setHpkePsk_id:(id)a3
{
}

- (NSDictionary)customAssertionRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 360, 1);
}

- (void)setCustomAssertionRequestHeaderClaims:(id)a3
{
}

- (NSDictionary)customAssertionRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (void)setCustomAssertionRequestBodyClaims:(id)a3
{
}

- (NSDictionary)customLoginRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCustomLoginRequestHeaderClaims:(id)a3
{
}

- (NSDictionary)customLoginRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCustomLoginRequestBodyClaims:(id)a3
{
}

- (NSDictionary)customRefreshRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 392, 1);
}

- (void)setCustomRefreshRequestHeaderClaims:(id)a3
{
}

- (NSDictionary)customRefreshRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 400, 1);
}

- (void)setCustomRefreshRequestBodyClaims:(id)a3
{
}

- (NSDictionary)customKeyRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 408, 1);
}

- (void)setCustomKeyRequestHeaderClaims:(id)a3
{
}

- (NSDictionary)customKeyRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 416, 1);
}

- (void)setCustomKeyRequestBodyClaims:(id)a3
{
}

- (NSDictionary)customKeyExchangeRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setCustomKeyExchangeRequestHeaderClaims:(id)a3
{
}

- (NSDictionary)customKeyExchangeRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 432, 1);
}

- (void)setCustomKeyExchangeRequestBodyClaims:(id)a3
{
}

- (NSData)_loginRequestEncryptionPublicKeyData
{
  return self->__loginRequestEncryptionPublicKeyData;
}

- (void)set_loginRequestEncryptionPublicKeyData:(id)a3
{
}

- (NSData)_hpkeAuthPublicKeyData
{
  return self->__hpkeAuthPublicKeyData;
}

- (void)set_hpkeAuthPublicKeyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hpkeAuthPublicKeyData, 0);
  objc_storeStrong((id *)&self->__loginRequestEncryptionPublicKeyData, 0);
  objc_storeStrong((id *)&self->_customKeyExchangeRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customKeyExchangeRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customKeyRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customKeyRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customRefreshRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customRefreshRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customLoginRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customLoginRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customAssertionRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customAssertionRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_hpkePsk_id, 0);
  objc_storeStrong((id *)&self->_hpkePsk, 0);
  objc_storeStrong((id *)&self->_decryptionEndpointURL, 0);
  objc_storeStrong((id *)&self->_customDecryptionRequestValues, 0);
  objc_storeStrong((id *)&self->_customKeyRequestValues, 0);
  objc_storeStrong((id *)&self->_customKeyExchangeRequestValues, 0);
  objc_storeStrong((id *)&self->_keyEndpointURL, 0);
  objc_storeStrong((id *)&self->_loginRequestEncryptionAPVPrefix, 0);
  objc_storeStrong((id *)&self->_loginRequestHpkePsk_id, 0);
  objc_storeStrong((id *)&self->_loginRequestHpkePsk, 0);
  objc_storeStrong((id *)&self->_loginRequestEncryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_customFederationUserPreauthenticationRequestValues, 0);
  objc_storeStrong((id *)&self->_federationPredicate, 0);
  objc_storeStrong((id *)&self->_federationMexURLKeypath, 0);
  objc_storeStrong((id *)&self->_federationUserPreauthenticationURL, 0);
  objc_storeStrong((id *)&self->_federationMexURL, 0);
  objc_storeStrong((id *)&self->_federationRequestURN, 0);
  objc_storeStrong((id *)&self->_kerberosTicketMappings, 0);
  objc_storeStrong((id *)&self->_customRefreshRequestValues, 0);
  objc_storeStrong((id *)&self->_refreshEndpointURL, 0);
  objc_storeStrong((id *)&self->_groupResponseClaimName, 0);
  objc_storeStrong((id *)&self->_groupRequestClaimName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifierClaimName, 0);
  objc_storeStrong((id *)&self->_customLoginRequestValues, 0);
  objc_storeStrong((id *)&self->_customRequestJWTParameterName, 0);
  objc_storeStrong((id *)&self->_previousRefreshTokenClaimName, 0);
  objc_storeStrong((id *)&self->_additionalAuthorizationScopes, 0);
  objc_storeStrong((id *)&self->_additionalScopes, 0);
  objc_storeStrong((id *)&self->_customNonceRequestValues, 0);
  objc_storeStrong((id *)&self->_serverNonceClaimName, 0);
  objc_storeStrong((id *)&self->_nonceResponseKeypath, 0);
  objc_storeStrong((id *)&self->_nonceEndpointURL, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_jwksTrustedRootCertificates, 0);
  objc_storeStrong((id *)&self->_jwksEndpointURL, 0);
  objc_storeStrong((id *)&self->_tokenEndpointURL, 0);
  objc_storeStrong((id *)&self->_audience, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_accountDisplayName, 0);
  objc_storeStrong((id *)&self->_invalidCredentialPredicate, 0);
}

void __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_cold_1(uint64_t a1)
{
  v1 = (void *)[[NSString alloc] initWithData:a1 encoding:4];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v2, v3, "open id response received: %{public}@", v4, v5, v6, v7, v8);
}

void __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_94_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a2 + 32), "statusCode"));
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_259DFE000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)dataRepresentationForDisplay:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = (void *)[[NSString alloc] initWithData:a1 encoding:4];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v2, v3, "serialized configuration: %{public}@", v4, v5, v6, v7, v8);
}

@end