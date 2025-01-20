@interface WBSHistoryCrypto
- (NSData)cryptographicKey;
- (NSData)salt;
- (WBSHistoryCrypto)init;
- (WBSHistoryCrypto)initWithCryptographicKey:(id)a3 salt:(id)a4;
- (id)_createCryptographicKey;
- (id)_createOrLoadCryptographicKey;
- (id)decryptDictionary:(id)a3;
- (id)encryptDictionary:(id)a3;
@end

@implementation WBSHistoryCrypto

- (WBSHistoryCrypto)init
{
  return [(WBSHistoryCrypto *)self initWithCryptographicKey:0 salt:0];
}

- (WBSHistoryCrypto)initWithCryptographicKey:(id)a3 salt:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryCrypto;
  v9 = [(WBSHistoryCrypto *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cachedCryptographicKey, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_salt, a4);
    }
    else
    {
      arc4random_buf(__buf, 0x40uLL);
      uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__buf length:64];
      salt = v10->_salt;
      v10->_salt = (NSData *)v11;
    }
    v13 = v10;
  }

  return v10;
}

- (id)_createCryptographicKey
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  arc4random_buf(__buf, 0x20uLL);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__buf length:32];
  return v2;
}

- (id)_createOrLoadCryptographicKey
{
  int v3 = WBSGetKeychainData();
  id v4 = 0;
  uint64_t v5 = v4;
  if (!v3)
  {
    id v11 = v4;
    id v8 = v11;
    goto LABEL_9;
  }
  int v6 = WBSGetKeychainData();
  id v7 = 0;
  if (v6)
  {
    id v8 = [(WBSHistoryCrypto *)self _createCryptographicKey];

    v9 = _WBSLocalizedString();
    int v10 = WBSSetKeychainData();

    id v11 = 0;
    uint64_t v5 = v8;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    v12 = _WBSLocalizedString();
    WBSSetKeychainData();

    id v8 = v7;
  }
  id v11 = v8;
  id v8 = v5;
LABEL_8:

LABEL_9:
  return v11;
}

- (NSData)cryptographicKey
{
  cachedCryptographicKey = self->_cachedCryptographicKey;
  if (!cachedCryptographicKey)
  {
    id v4 = [(WBSHistoryCrypto *)self _createOrLoadCryptographicKey];
    uint64_t v5 = self->_cachedCryptographicKey;
    self->_cachedCryptographicKey = v4;

    cachedCryptographicKey = self->_cachedCryptographicKey;
  }
  int v6 = cachedCryptographicKey;
  return v6;
}

- (id)encryptDictionary:(id)a3
{
  id v19 = 0;
  id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v19];
  id v5 = v19;
  if (!v4)
  {
    objc_super v15 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WBSHistoryCrypto encryptDictionary:](v15, v5);
    }
    goto LABEL_8;
  }
  size_t v18 = 0;
  size_t dataOutAvailable = [v4 length] + 32;
  dataOut = malloc_type_malloc(dataOutAvailable, 0x53E1B1DuLL);
  id v8 = [(WBSHistoryCrypto *)self cryptographicKey];
  v9 = (const void *)[v8 bytes];
  int v10 = [(WBSHistoryCrypto *)self cryptographicKey];
  size_t v11 = [v10 length];
  id v12 = v4;
  CCCryptorStatus v13 = CCCrypt(0, 0, 1u, v9, v11, 0, (const void *)[v12 bytes], objc_msgSend(v12, "length"), dataOut, dataOutAvailable, &v18);

  if (v13)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[WBSHistoryCrypto encryptDictionary:](v13, v14);
    }
    free(dataOut);
LABEL_8:
    v16 = 0;
    goto LABEL_10;
  }
  v16 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:dataOut length:v18];
LABEL_10:

  return v16;
}

- (id)decryptDictionary:(id)a3
{
  size_t v23 = 0;
  id v4 = a3;
  size_t dataOutAvailable = [v4 length] + 16;
  dataOut = malloc_type_malloc(dataOutAvailable, 0xD89475C9uLL);
  id v7 = [(WBSHistoryCrypto *)self cryptographicKey];
  id v8 = (const void *)[v7 bytes];
  v9 = [(WBSHistoryCrypto *)self cryptographicKey];
  size_t v10 = [v9 length];
  id v11 = v4;
  id v12 = (const void *)[v11 bytes];
  size_t v13 = [v11 length];

  CCCryptorStatus v14 = CCCrypt(1u, 0, 1u, v8, v10, 0, v12, v13, dataOut, dataOutAvailable, &v23);
  if (!v14)
  {
    uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:dataOut length:v23];
    id v22 = 0;
    size_t v18 = [MEMORY[0x1E4F28F98] propertyListWithData:v17 options:0 format:0 error:&v22];
    id v19 = v22;
    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v18;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v20 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[WBSHistoryCrypto decryptDictionary:](v20, v19);
      }
    }
    id v16 = 0;
    goto LABEL_11;
  }
  objc_super v15 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[WBSHistoryCrypto decryptDictionary:](v14, v15);
  }
  free(dataOut);
  id v16 = 0;
LABEL_12:
  return v16;
}

- (NSData)salt
{
  return self->_salt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_cachedCryptographicKey, 0);
}

- (void)encryptDictionary:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to serialize dictionary: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)encryptDictionary:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to encrypt data: %i", (uint8_t *)v2, 8u);
}

- (void)decryptDictionary:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to deserialize property list: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)decryptDictionary:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to decrypt data: %i", (uint8_t *)v2, 8u);
}

@end