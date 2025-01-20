@interface POKeychainJWKSStorageProvider
- (BOOL)isSystem;
- (POKeychainHelper)keychainHelper;
- (POKeychainJWKSStorageProvider)init;
- (POKeychainJWKSStorageProvider)initWithSystem:(BOOL)a3;
- (id)jwksCacheForExtensionIdentifier:(id)a3;
- (void)setIsSystem:(BOOL)a3;
- (void)setJwksCache:(id)a3 forExtensionIdentifier:(id)a4;
- (void)setKeychainHelper:(id)a3;
@end

@implementation POKeychainJWKSStorageProvider

- (POKeychainJWKSStorageProvider)init
{
  return [(POKeychainJWKSStorageProvider *)self initWithSystem:0];
}

- (POKeychainJWKSStorageProvider)initWithSystem:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POKeychainJWKSStorageProvider;
  v4 = [(POKeychainJWKSStorageProvider *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_isSystem = a3;
    v6 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x263F5E638]);
    keychainHelper = v5->_keychainHelper;
    v5->_keychainHelper = v6;
  }
  return v5;
}

- (id)jwksCacheForExtensionIdentifier:(id)a3
{
  id v4 = a3;
  v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POKeychainJWKSStorageProvider jwksCacheForExtensionIdentifier:]();
  }

  v6 = [(POKeychainJWKSStorageProvider *)self keychainHelper];
  id v12 = 0;
  int v7 = [v6 retrieveTokensFromKeychainForService:v4 username:@"com.apple.jwksCache" returningTokens:&v12 metaData:0];

  id v8 = v12;
  if (v7)
  {
    id v9 = __65__POKeychainJWKSStorageProvider_jwksCacheForExtensionIdentifier___block_invoke();
    id v10 = 0;
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

id __65__POKeychainJWKSStorageProvider_jwksCacheForExtensionIdentifier___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"JWKS data not found in cache."];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)setJwksCache:(id)a3 forExtensionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POKeychainJWKSStorageProvider setJwksCache:forExtensionIdentifier:]();
  }

  id v9 = [(POKeychainJWKSStorageProvider *)self keychainHelper];
  id v10 = v9;
  if (v6)
  {
    int v11 = objc_msgSend(v9, "addTokens:metaData:toKeychainForService:username:system:", v6, 0, v7, @"com.apple.jwksCache", -[POKeychainJWKSStorageProvider isSystem](self, "isSystem"));

    if (v11) {
      id v12 = __69__POKeychainJWKSStorageProvider_setJwksCache_forExtensionIdentifier___block_invoke();
    }
  }
  else
  {
    int v13 = [v9 removeTokensFromKeychainWithService:v7 username:@"com.apple.jwksCache"];

    if (v13 != -25300 && v13) {
      id v14 = __69__POKeychainJWKSStorageProvider_setJwksCache_forExtensionIdentifier___block_invoke_11();
    }
  }
}

id __69__POKeychainJWKSStorageProvider_setJwksCache_forExtensionIdentifier___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save JWKS data in cache."];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __69__POKeychainJWKSStorageProvider_setJwksCache_forExtensionIdentifier___block_invoke_11()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Error removing jwks data from cache"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeychainHelper:(id)a3
{
}

- (BOOL)isSystem
{
  return self->_isSystem;
}

- (void)setIsSystem:(BOOL)a3
{
  self->_isSystem = a3;
}

- (void).cxx_destruct
{
}

- (void)jwksCacheForExtensionIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)setJwksCache:forExtensionIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

@end