@interface POLoginManager
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeviceRegistered;
- (BOOL)isUserRegistered;
- (BOOL)saveLoginConfiguration:(id)a3 error:(id *)a4;
- (BOOL)saveUserLoginConfiguration:(id)a3 error:(id *)a4;
- (NSDictionary)extensionData;
- (NSDictionary)ssoTokens;
- (NSString)loginUserName;
- (NSString)registrationToken;
- (NSString)requestIdentifier;
- (POLoginConfiguration)loginConfiguration;
- (POLoginManager)init;
- (POLoginManager)initWithCoder:(id)a3;
- (POLoginManager)initWithUid:(unsigned int)a3;
- (POUserLoginConfiguration)userLoginConfiguration;
- (SOHostExtensionContextProtocol)hostExtensionContext;
- (__SecCertificate)copyDeviceAttestationCertificate;
- (__SecCertificate)deviceAttestationCertificate;
- (__SecIdentity)copyIdentityForKeyType:(int64_t)a3;
- (__SecKey)copyKeyForKeyType:(int64_t)a3;
- (__SecKey)rotateKeyForKeyType:(int64_t)a3;
- (void)attestKey:(int64_t)a3 clientDataHash:(id)a4 completion:(id)a5;
- (void)completeRotationKeyForKeyType:(int64_t)a3;
- (void)copyDeviceAttestationCertificate;
- (void)deviceRegistrationsNeedsRepair;
- (void)invalidate;
- (void)isDeviceRegistered;
- (void)isUserRegistered;
- (void)loginConfiguration;
- (void)presentRegistrationViewControllerWithCompletion:(id)a3;
- (void)registrationToken;
- (void)resetDeviceKeys;
- (void)resetKeys;
- (void)resetUserSecureEnclaveKey;
- (void)saveCertificate:(__SecCertificate *)a3 keyType:(int64_t)a4;
- (void)setExtensionData:(id)a3;
- (void)setHostExtensionContext:(id)a3;
- (void)setLoginUserName:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSsoTokens:(id)a3;
- (void)ssoTokens;
- (void)userLoginConfiguration;
- (void)userNeedsReauthentication;
- (void)userNeedsReauthenticationWithCompletion:(id)a3;
- (void)userRegistrationsNeedsRepair;
@end

@implementation POLoginManager

- (POLoginManager)init
{
  return [(POLoginManager *)self initWithUid:0];
}

- (POLoginManager)initWithUid:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(POLoginManager *)(uint64_t)self initWithUid:v5];
  }

  v10.receiver = self;
  v10.super_class = (Class)POLoginManager;
  v6 = [(POLoginManager *)&v10 init];
  if (v6)
  {
    v7 = [[POServiceLoginManagerConnection alloc] initWithUid:v3];
    serviceConnection = v6->_serviceConnection;
    v6->_serviceConnection = v7;
  }
  return v6;
}

- (void)invalidate
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (BOOL)isDeviceRegistered
{
  uint64_t v3 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager isDeviceRegistered]();
  }

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__POLoginManager_isDeviceRegistered__block_invoke;
  v7[3] = &unk_264BBEC78;
  v7[4] = &v8;
  [(POServiceLoginManagerConnection *)serviceConnection isDeviceRegisteredWithCompletion:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__POLoginManager_isDeviceRegistered__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isUserRegistered
{
  uint64_t v3 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager isUserRegistered]();
  }

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__POLoginManager_isUserRegistered__block_invoke;
  v7[3] = &unk_264BBEC78;
  v7[4] = &v8;
  [(POServiceLoginManagerConnection *)serviceConnection isUserRegisteredWithCompletion:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __34__POLoginManager_isUserRegistered__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (NSString)registrationToken
{
  uint64_t v3 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager registrationToken]();
  }

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__0;
  v14[4] = __Block_byref_object_dispose__0;
  id v15 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__POLoginManager_registrationToken__block_invoke;
  v7[3] = &unk_264BBEE30;
  v7[4] = &v8;
  void v7[5] = v14;
  [(POServiceLoginManagerConnection *)serviceConnection registrationTokenWithCompletion:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);

  return (NSString *)v5;
}

void __35__POLoginManager_registrationToken__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (NSString)loginUserName
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__0;
  v12[4] = __Block_byref_object_dispose__0;
  id v13 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  serviceConnection = self->_serviceConnection;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__POLoginManager_loginUserName__block_invoke;
  v5[3] = &unk_264BBEE30;
  v5[4] = &v6;
  v5[5] = v12;
  [(POServiceLoginManagerConnection *)serviceConnection loginUserNameWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(v12, 8);

  return (NSString *)v3;
}

void __31__POLoginManager_loginUserName__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)setLoginUserName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__0;
  v10[4] = __Block_byref_object_dispose__0;
  id v11 = 0;
  serviceConnection = self->_serviceConnection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__POLoginManager_setLoginUserName___block_invoke;
  v9[3] = &unk_264BBEE58;
  v9[4] = &v12;
  v9[5] = v10;
  [(POServiceLoginManagerConnection *)serviceConnection setLoginUserName:v4 completion:v9];
  if (*((unsigned char *)v13 + 24))
  {
    id v6 = PO_LOG_POLoginManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[POLoginManager setLoginUserName:]();
    }
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__POLoginManager_setLoginUserName___block_invoke_2;
    v8[3] = &unk_264BBEE80;
    v8[4] = v10;
    id v7 = __35__POLoginManager_setLoginUserName___block_invoke_2((uint64_t)v8);
  }
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(&v12, 8);
}

void __35__POLoginManager_setLoginUserName___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

id __35__POLoginManager_setLoginUserName___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"failed to save loginUserName"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (POUserLoginConfiguration)userLoginConfiguration
{
  id v3 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager userLoginConfiguration]();
  }

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__0;
  v14[4] = __Block_byref_object_dispose__0;
  id v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__POLoginManager_userLoginConfiguration__block_invoke;
  v7[3] = &unk_264BBEEA8;
  v7[4] = &v8;
  void v7[5] = v14;
  [(POServiceLoginManagerConnection *)serviceConnection userLoginConfigurationWithCompletion:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);

  return (POUserLoginConfiguration *)v5;
}

void __40__POLoginManager_userLoginConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)saveUserLoginConfiguration:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  serviceConnection = self->_serviceConnection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__POLoginManager_saveUserLoginConfiguration_error___block_invoke;
  v16[3] = &unk_264BBEE58;
  v16[4] = &v23;
  v16[5] = &v17;
  [(POServiceLoginManagerConnection *)serviceConnection setUserLoginConfiguration:v6 completion:v16];
  int v8 = *((unsigned __int8 *)v24 + 24);
  if (*((unsigned char *)v24 + 24))
  {
    uint64_t v9 = PO_LOG_POLoginManager();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POLoginManager saveUserLoginConfiguration:error:]();
    }
  }
  else
  {
    uint64_t v10 = v18[5];
    uint64_t v27 = *MEMORY[0x263F08608];
    v28[0] = v10;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = getASAuthorizationErrorDomain();
    id v13 = [v11 errorWithDomain:v12 code:1000 userInfo:v9];

    uint64_t v14 = PO_LOG_POLoginManager();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[POLoginManager saveUserLoginConfiguration:error:]();
    }

    if (a4) {
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v8 != 0;
}

void __51__POLoginManager_saveUserLoginConfiguration_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (NSDictionary)ssoTokens
{
  id v3 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager ssoTokens]();
  }

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  id v31 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  serviceConnection = self->_serviceConnection;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __27__POLoginManager_ssoTokens__block_invoke;
  v23[3] = &unk_264BBEED0;
  v23[4] = &v24;
  v23[5] = v30;
  [(POServiceLoginManagerConnection *)serviceConnection ssoTokensWithCompletion:v23];
  if (!v25[5]) {
    goto LABEL_12;
  }
  id v5 = [(POLoginManager *)self copyKeyForKeyType:11];
  id v6 = v5;
  if (!v5)
  {
    id v13 = __27__POLoginManager_ssoTokens__block_invoke_2();
LABEL_12:
    id v12 = 0;
    goto LABEL_17;
  }
  if (!SecKeyIsAlgorithmSupported(v5, kSecKeyOperationTypeDecrypt, (SecKeyAlgorithm)*MEMORY[0x263F17310]))
  {
    CFRelease(v6);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __27__POLoginManager_ssoTokens__block_invoke_13;
    v22[3] = &unk_264BBEE80;
    v22[4] = v30;
    id v14 = __27__POLoginManager_ssoTokens__block_invoke_13((uint64_t)v22);
    goto LABEL_12;
  }
  CFErrorRef error = 0;
  CFDataRef v7 = SecKeyCreateDecryptedData(v6, (SecKeyAlgorithm)*MEMORY[0x263F17320], (CFDataRef)v25[5], &error);
  CFRelease(v6);
  if (error || !v7)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __27__POLoginManager_ssoTokens__block_invoke_17;
    v20[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v20[4] = error;
    id v15 = __27__POLoginManager_ssoTokens__block_invoke_17((uint64_t)v20);
    id v12 = 0;
  }
  else
  {
    id v19 = 0;
    int v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:16 error:&v19];
    id v9 = v19;
    uint64_t v10 = v9;
    if (v9)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __27__POLoginManager_ssoTokens__block_invoke_22;
      v17[3] = &unk_264BBECA8;
      id v18 = v9;
      id v11 = __27__POLoginManager_ssoTokens__block_invoke_22((uint64_t)v17);

      id v12 = 0;
    }
    else
    {
      id v12 = v8;
    }
  }
LABEL_17:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);

  return (NSDictionary *)v12;
}

void __27__POLoginManager_ssoTokens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id __27__POLoginManager_ssoTokens__block_invoke_2()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1006 description:@"missing device encryption key for retrieving sso tokens"];
  uint64_t v1 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __27__POLoginManager_ssoTokens__block_invoke_13(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"encryption algorithm not supported for retrieving sso tokens"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __27__POLoginManager_ssoTokens__block_invoke_17(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:v1 description:@"failed to decrypt tokens for retrieving sso tokens"];

  id v3 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v2;
}

id __27__POLoginManager_ssoTokens__block_invoke_22(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"failed to parse sso tokens for retrieving sso tokens"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)setSsoTokens:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager setSsoTokens:]();
  }

  if (v4)
  {
    if ([MEMORY[0x263F08900] isValidJSONObject:v4])
    {
      id v25 = 0;
      CFDataRef v6 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:1 error:&v25];
      id v7 = v25;
      int v8 = v7;
      if (v7 || !v6)
      {
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __31__POLoginManager_setSsoTokens___block_invoke_38;
        v23[3] = &unk_264BBECA8;
        id v24 = v7;
        id v16 = __31__POLoginManager_setSsoTokens___block_invoke_38((uint64_t)v23);
      }
      else
      {
        uint64_t v9 = [(POLoginManager *)self copyKeyForKeyType:11];
        if (v9)
        {
          uint64_t v10 = v9;
          id v11 = SecKeyCopyPublicKey(v9);
          if (v11)
          {
            id v12 = v11;
            if (SecKeyIsAlgorithmSupported(v11, kSecKeyOperationTypeEncrypt, (SecKeyAlgorithm)*MEMORY[0x263F17310]))
            {
              CFErrorRef error = 0;
              CFDataRef v13 = SecKeyCreateEncryptedData(v12, (SecKeyAlgorithm)*MEMORY[0x263F17320], v6, &error);
              CFRelease(v12);
              if (error || !v13)
              {
                v21[0] = MEMORY[0x263EF8330];
                v21[1] = 3221225472;
                v21[2] = __31__POLoginManager_setSsoTokens___block_invoke_60;
                v21[3] = &__block_descriptor_40_e14___NSError_8__0l;
                v21[4] = error;
                id v20 = __31__POLoginManager_setSsoTokens___block_invoke_60((uint64_t)v21);
              }
              else
              {
                [(POServiceLoginManagerConnection *)self->_serviceConnection setSsoTokens:v13 completion:&__block_literal_global_66];
              }
            }
            else
            {
              CFRelease(v12);
              id v19 = __31__POLoginManager_setSsoTokens___block_invoke_54();
            }
          }
          else
          {
            CFRelease(v10);
            id v18 = __31__POLoginManager_setSsoTokens___block_invoke_48();
          }
        }
        else
        {
          id v17 = __31__POLoginManager_setSsoTokens___block_invoke_42();
        }
      }
    }
    else
    {
      id v15 = __31__POLoginManager_setSsoTokens___block_invoke_32();
    }
  }
  else
  {
    id v14 = PO_LOG_POLoginManager();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[POLoginManager setSsoTokens:]();
    }

    [(POServiceLoginManagerConnection *)self->_serviceConnection setSsoTokens:0 completion:&__block_literal_global_27];
  }
}

void __31__POLoginManager_setSsoTokens___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (a2)
  {
    CFDataRef v6 = PO_LOG_POLoginManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __31__POLoginManager_setSsoTokens___block_invoke_cold_1();
    }
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __31__POLoginManager_setSsoTokens___block_invoke_28;
    v8[3] = &unk_264BBECA8;
    uint64_t v9 = v4;
    id v7 = __31__POLoginManager_setSsoTokens___block_invoke_28((uint64_t)v8);
    CFDataRef v6 = v9;
  }
}

id __31__POLoginManager_setSsoTokens___block_invoke_28(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"failed to remove sso tokens"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __31__POLoginManager_setSsoTokens___block_invoke_32()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"failed to validate JSON when saving sso tokens"];
  uint64_t v1 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __31__POLoginManager_setSsoTokens___block_invoke_38(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"failed to encode tokens to JSON when saving sso tokens"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __31__POLoginManager_setSsoTokens___block_invoke_42()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1006 description:@"missing device encryption key for saving sso tokens"];
  uint64_t v1 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __31__POLoginManager_setSsoTokens___block_invoke_48()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1006 description:@"missing device encryption public key for saving sso tokens"];
  uint64_t v1 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __31__POLoginManager_setSsoTokens___block_invoke_54()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"encryption algorithm not supported for saving sso tokens"];
  uint64_t v1 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __31__POLoginManager_setSsoTokens___block_invoke_60(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:v1 description:@"failed to encrypt tokens for saving sso tokens"];

  id v3 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v2;
}

void __31__POLoginManager_setSsoTokens___block_invoke_64(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (a2)
  {
    CFDataRef v6 = PO_LOG_POLoginManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __31__POLoginManager_setSsoTokens___block_invoke_64_cold_1();
    }
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __31__POLoginManager_setSsoTokens___block_invoke_67;
    v8[3] = &unk_264BBECA8;
    uint64_t v9 = v4;
    id v7 = __31__POLoginManager_setSsoTokens___block_invoke_67((uint64_t)v8);
    CFDataRef v6 = v9;
  }
}

id __31__POLoginManager_setSsoTokens___block_invoke_67(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"failed to save tokens for saving sso tokens"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (POLoginConfiguration)loginConfiguration
{
  id v3 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager loginConfiguration]();
  }

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__0;
  v14[4] = __Block_byref_object_dispose__0;
  id v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__POLoginManager_loginConfiguration__block_invoke;
  v7[3] = &unk_264BBEF18;
  v7[4] = &v8;
  void v7[5] = v14;
  [(POServiceLoginManagerConnection *)serviceConnection loginConfigurationWithCompletion:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);

  return (POLoginConfiguration *)v5;
}

void __36__POLoginManager_loginConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)saveLoginConfiguration:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  serviceConnection = self->_serviceConnection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__POLoginManager_saveLoginConfiguration_error___block_invoke;
  v16[3] = &unk_264BBEE58;
  v16[4] = &v23;
  v16[5] = &v17;
  [(POServiceLoginManagerConnection *)serviceConnection setLoginConfiguration:v6 completion:v16];
  int v8 = *((unsigned __int8 *)v24 + 24);
  if (*((unsigned char *)v24 + 24))
  {
    uint64_t v9 = PO_LOG_POLoginManager();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POLoginManager saveLoginConfiguration:error:]();
    }
  }
  else
  {
    uint64_t v10 = v18[5];
    uint64_t v27 = *MEMORY[0x263F08608];
    v28[0] = v10;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v11 = (void *)MEMORY[0x263F087E8];
    id v12 = getASAuthorizationErrorDomain();
    id v13 = [v11 errorWithDomain:v12 code:1000 userInfo:v9];

    id v14 = PO_LOG_POLoginManager();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[POLoginManager saveLoginConfiguration:error:]();
    }

    if (a4) {
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v8 != 0;
}

void __47__POLoginManager_saveLoginConfiguration_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)saveCertificate:(__SecCertificate *)a3 keyType:(int64_t)a4
{
  uint64_t v7 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager saveCertificate:keyType:]();
  }

  int v8 = [MEMORY[0x263F5E650] dataForCertificate:a3];
  if (v8)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__0;
    v12[4] = __Block_byref_object_dispose__0;
    id v13 = 0;
    serviceConnection = self->_serviceConnection;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__POLoginManager_saveCertificate_keyType___block_invoke_78;
    v11[3] = &unk_264BBEC78;
    v11[4] = v12;
    [(POServiceLoginManagerConnection *)serviceConnection setCertificateData:v8 keyType:a4 completion:v11];
    _Block_object_dispose(v12, 8);
  }
  else
  {
    id v10 = __42__POLoginManager_saveCertificate_keyType___block_invoke();
  }
}

id __42__POLoginManager_saveCertificate_keyType___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"error with SecCertificateCopyData for saving certificate"];
  uint64_t v1 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __42__POLoginManager_saveCertificate_keyType___block_invoke_78(uint64_t a1, int a2, id obj)
{
}

- (__SecKey)copyKeyForKeyType:(int64_t)a3
{
  id v5 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager copyKeyForKeyType:]();
  }

  uint64_t v23 = 0;
  id v24 = (id *)&v23;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  serviceConnection = self->_serviceConnection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __36__POLoginManager_copyKeyForKeyType___block_invoke;
  v16[3] = &unk_264BBEF40;
  v16[4] = &v17;
  v16[5] = &v23;
  [(POServiceLoginManagerConnection *)serviceConnection secKeyProxyEndpointForKeyType:a3 completion:v16];
  uint64_t v7 = v18[5];
  if (!v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __36__POLoginManager_copyKeyForKeyType___block_invoke_2;
    v15[3] = &unk_264BBEE80;
    v15[4] = &v23;
    id v11 = __36__POLoginManager_copyKeyForKeyType___block_invoke_2((uint64_t)v15);
    goto LABEL_7;
  }
  int v8 = v24;
  id obj = v24[5];
  uint64_t v9 = (__SecKey *)[MEMORY[0x263F16D70] createKeyFromEndpoint:v7 error:&obj];
  objc_storeStrong(v8 + 5, obj);
  if (!v9)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __36__POLoginManager_copyKeyForKeyType___block_invoke_84;
    v13[3] = &unk_264BBEE80;
    v13[4] = &v23;
    id v10 = __36__POLoginManager_copyKeyForKeyType___block_invoke_84((uint64_t)v13);
LABEL_7:
    uint64_t v9 = 0;
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v9;
}

void __36__POLoginManager_copyKeyForKeyType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id __36__POLoginManager_copyKeyForKeyType___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"failed to retrieve SecKeyProxyEndpoint for key"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __36__POLoginManager_copyKeyForKeyType___block_invoke_84(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"failed to create SecKey from SecKeyProxyEndpoint for key"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (__SecIdentity)copyIdentityForKeyType:(int64_t)a3
{
  id v5 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager copyIdentityForKeyType:]();
  }

  uint64_t v23 = 0;
  id v24 = (id *)&v23;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  serviceConnection = self->_serviceConnection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41__POLoginManager_copyIdentityForKeyType___block_invoke;
  v16[3] = &unk_264BBEF40;
  v16[4] = &v17;
  v16[5] = &v23;
  [(POServiceLoginManagerConnection *)serviceConnection secIdentityProxyEndpointForKeyType:a3 completion:v16];
  uint64_t v7 = v18[5];
  if (!v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__POLoginManager_copyIdentityForKeyType___block_invoke_2;
    v15[3] = &unk_264BBEE80;
    v15[4] = &v23;
    id v11 = __41__POLoginManager_copyIdentityForKeyType___block_invoke_2((uint64_t)v15);
    goto LABEL_7;
  }
  int v8 = v24;
  id obj = v24[5];
  uint64_t v9 = (__SecIdentity *)[MEMORY[0x263F16D70] createIdentityFromEndpoint:v7 error:&obj];
  objc_storeStrong(v8 + 5, obj);
  if (!v9)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __41__POLoginManager_copyIdentityForKeyType___block_invoke_91;
    v13[3] = &unk_264BBEE80;
    v13[4] = &v23;
    id v10 = __41__POLoginManager_copyIdentityForKeyType___block_invoke_91((uint64_t)v13);
LABEL_7:
    uint64_t v9 = 0;
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v9;
}

void __41__POLoginManager_copyIdentityForKeyType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id __41__POLoginManager_copyIdentityForKeyType___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"failed to retrieve SecKeyProxyEndpoint for identity"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __41__POLoginManager_copyIdentityForKeyType___block_invoke_91(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"failed to create SecIdentityRef from SecKeyProxyEndpoint for key"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)attestKey:(int64_t)a3 clientDataHash:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager attestKey:clientDataHash:completion:]();
  }

  serviceConnection = self->_serviceConnection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__POLoginManager_attestKey_clientDataHash_completion___block_invoke;
  v13[3] = &unk_264BBEF68;
  id v14 = v8;
  id v12 = v8;
  [(POServiceLoginManagerConnection *)serviceConnection attestKey:a3 clientDataHash:v9 completion:v13];
}

uint64_t __54__POLoginManager_attestKey_clientDataHash_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (__SecCertificate)copyDeviceAttestationCertificate
{
  id v3 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager copyDeviceAttestationCertificate]();
  }

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__0;
  v12[4] = __Block_byref_object_dispose__0;
  id v13 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__POLoginManager_copyDeviceAttestationCertificate__block_invoke;
  v7[3] = &unk_264BBEF90;
  v7[4] = &v8;
  void v7[5] = v12;
  [(POServiceLoginManagerConnection *)serviceConnection copyDeviceAttestationCertificateWithCompletion:v7];
  id v5 = (__SecCertificate *)v9[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);

  return v5;
}

void __50__POLoginManager_copyDeviceAttestationCertificate__block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)userNeedsReauthentication
{
}

- (void)userNeedsReauthenticationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager userNeedsReauthenticationWithCompletion:]();
  }

  id v6 = [(POLoginManager *)self hostExtensionContext];

  if (v6)
  {
    uint64_t v7 = [(POLoginManager *)self hostExtensionContext];
    uint64_t v8 = [(POLoginManager *)self requestIdentifier];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke_2;
    v13[3] = &unk_264BBEFE0;
    void v13[4] = self;
    id v14 = v4;
    id v9 = v4;
    [v7 requestReauthenticationWithRequestIdentifier:v8 completion:v13];

    uint64_t v10 = v14;
  }
  else
  {
    serviceConnection = self->_serviceConnection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke;
    v15[3] = &unk_264BBEFB8;
    id v16 = v4;
    id v12 = v4;
    [(POServiceLoginManagerConnection *)serviceConnection userNeedsReauthenticationWithCompletion:v15];
    uint64_t v10 = v16;
  }
}

uint64_t __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke_3;
      v13[3] = &unk_264BBEFB8;
      id v14 = *(id *)(a1 + 40);
      [v8 userNeedsReauthenticationWithCompletion:v13];

      return;
    case 1:
      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v9();
      return;
    case 2:
    case 3:
    case 4:
      uint64_t v3 = (void *)MEMORY[0x263F087E8];
      uint64_t v4 = getASAuthorizationErrorDomain();
      id v5 = v3;
      id v6 = v4;
      uint64_t v7 = 1004;
      goto LABEL_10;
    case 5:
      uint64_t v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v4 = getASAuthorizationErrorDomain();
      id v5 = v10;
      id v6 = v4;
      uint64_t v7 = 1000;
      goto LABEL_10;
    case 6:
      uint64_t v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v4 = getASAuthorizationErrorDomain();
      id v5 = v11;
      id v6 = v4;
      uint64_t v7 = 1001;
LABEL_10:
      id v12 = [v5 errorWithDomain:v6 code:v7 userInfo:0];

      break;
    default:
      id v12 = 0;
      break;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke_3(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (void)deviceRegistrationsNeedsRepair
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)userRegistrationsNeedsRepair
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)presentRegistrationViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager presentRegistrationViewControllerWithCompletion:]();
  }

  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__POLoginManager_presentRegistrationViewControllerWithCompletion___block_invoke;
  v8[3] = &unk_264BBEFB8;
  id v9 = v4;
  id v7 = v4;
  [(POServiceLoginManagerConnection *)serviceConnection presentRegistrationViewControllerWithCompletion:v8];
}

uint64_t __66__POLoginManager_presentRegistrationViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)resetKeys
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)resetDeviceKeys
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)resetUserSecureEnclaveKey
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (__SecKey)rotateKeyForKeyType:(int64_t)a3
{
  uint64_t v5 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager rotateKeyForKeyType:]();
  }

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  serviceConnection = self->_serviceConnection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __38__POLoginManager_rotateKeyForKeyType___block_invoke;
  v16[3] = &unk_264BBF008;
  v16[4] = &v23;
  [(POServiceLoginManagerConnection *)serviceConnection rotateKeyForKeyType:a3 completion:v16];
  uint64_t v7 = v24[5];
  if (!v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __38__POLoginManager_rotateKeyForKeyType___block_invoke_2;
    v15[3] = &unk_264BBEE80;
    void v15[4] = &v17;
    id v11 = __38__POLoginManager_rotateKeyForKeyType___block_invoke_2((uint64_t)v15);
    goto LABEL_7;
  }
  uint64_t v8 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  id v9 = (__SecKey *)[MEMORY[0x263F16D70] createKeyFromEndpoint:v7 error:&obj];
  objc_storeStrong(v8, obj);
  if (!v9)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __38__POLoginManager_rotateKeyForKeyType___block_invoke_115;
    v13[3] = &unk_264BBEE80;
    void v13[4] = &v17;
    id v10 = __38__POLoginManager_rotateKeyForKeyType___block_invoke_115((uint64_t)v13);
LABEL_7:
    id v9 = 0;
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v9;
}

void __38__POLoginManager_rotateKeyForKeyType___block_invoke(uint64_t a1, void *a2)
{
}

id __38__POLoginManager_rotateKeyForKeyType___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"failed to retrieve SecKeyProxyEndpoint for new key"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __38__POLoginManager_rotateKeyForKeyType___block_invoke_115(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"failed to create SecKey from SecKeyProxyEndpoint for new key"];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)completeRotationKeyForKeyType:(int64_t)a3
{
  uint64_t v5 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POLoginManager completeRotationKeyForKeyType:]();
  }

  [(POServiceLoginManagerConnection *)self->_serviceConnection completeRotationKeyForKeyType:a3 completion:&__block_literal_global_120];
}

void __48__POLoginManager_completeRotationKeyForKeyType___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (a2)
  {
    id v6 = PO_LOG_POLoginManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E51000, v6, OS_LOG_TYPE_INFO, "rotation completed successfully.", buf, 2u);
    }
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__POLoginManager_completeRotationKeyForKeyType___block_invoke_121;
    v8[3] = &unk_264BBECA8;
    id v9 = v4;
    id v7 = __48__POLoginManager_completeRotationKeyForKeyType___block_invoke_121((uint64_t)v8);
    id v6 = v9;
  }
}

id __48__POLoginManager_completeRotationKeyForKeyType___block_invoke_121(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"failed to complete key rotation."];
  uint64_t v2 = PO_LOG_POLoginManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POLoginManager)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)POLoginManager;
  return [(POLoginManager *)&v4 init];
}

- (NSDictionary)extensionData
{
  return self->_extensionData;
}

- (void)setExtensionData:(id)a3
{
}

- (__SecCertificate)deviceAttestationCertificate
{
  return self->_deviceAttestationCertificate;
}

- (SOHostExtensionContextProtocol)hostExtensionContext
{
  return (SOHostExtensionContextProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHostExtensionContext:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_hostExtensionContext, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);

  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (void)initWithUid:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  objc_super v4 = "-[POLoginManager initWithUid:]";
  __int16 v5 = 1026;
  int v6 = a2;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_debug_impl(&dword_230E51000, log, OS_LOG_TYPE_DEBUG, "%s uid = %{public}d on %@", (uint8_t *)&v3, 0x1Cu);
}

- (void)isDeviceRegistered
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)isUserRegistered
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)registrationToken
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)setLoginUserName:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "loginUserName saved", v2, v3, v4, v5, v6);
}

- (void)userLoginConfiguration
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)saveUserLoginConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "userLoginConfiguration saved", v2, v3, v4, v5, v6);
}

- (void)saveUserLoginConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_230E51000, v0, v1, "failed to save userLoginConfiguration: %{public}@", v2, v3, v4, v5, v6);
}

- (void)ssoTokens
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)setSsoTokens:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "removing sso tokens", v2, v3, v4, v5, v6);
}

- (void)setSsoTokens:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __31__POLoginManager_setSsoTokens___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "sso tokens removed", v2, v3, v4, v5, v6);
}

void __31__POLoginManager_setSsoTokens___block_invoke_64_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "tokens saved", v2, v3, v4, v5, v6);
}

- (void)loginConfiguration
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)saveLoginConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "loginConfiguration saved", v2, v3, v4, v5, v6);
}

- (void)saveLoginConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_230E51000, v0, v1, "failed to save loginConfiguration: %{public}@", v2, v3, v4, v5, v6);
}

- (void)saveCertificate:keyType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)copyKeyForKeyType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)copyIdentityForKeyType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)attestKey:clientDataHash:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)copyDeviceAttestationCertificate
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)userNeedsReauthenticationWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)presentRegistrationViewControllerWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)rotateKeyForKeyType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)completeRotationKeyForKeyType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

@end