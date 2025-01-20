@interface PPKPayloadEncryption
+ (id)sharedInstance;
- (PPKPayloadEncryption)init;
- (id)decryptData:(unsigned char *)a1;
- (id)encryptData:(unsigned char *)a1;
- (void)initializeKey;
@end

@implementation PPKPayloadEncryption

+ (id)sharedInstance
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__PPKPayloadEncryption_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v1 = (void *)_sharedInstance;
  return v1;
}

uint64_t __38__PPKPayloadEncryption_sharedInstance__block_invoke(uint64_t a1)
{
  _sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (PPKPayloadEncryption)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPKPayloadEncryption;
  result = [(PPKPayloadEncryption *)&v3 init];
  if (result) {
    *(_WORD *)&result->_keyInitialized = 0;
  }
  return result;
}

- (id)encryptData:(unsigned char *)a1
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (!a1) {
    goto LABEL_18;
  }
  if (!v3)
  {
    v6 = +[PPKImageWriter log]();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "PPKPayloadEncryption: Received nil data. Returning nil.";
LABEL_16:
      _os_log_impl(&dword_20C2D7000, v6, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_17:

LABEL_18:
    id v19 = 0;
    goto LABEL_23;
  }
  if (!a1[8]) {
    [a1 initializeKey];
  }
  int v5 = a1[9];
  v6 = +[PPKImageWriter log]();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      v20 = "PPKPayloadEncryption: failed to load key from keychain so we can't encrypt data. Returning nil.";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v7)
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = [v4 length];
    _os_log_impl(&dword_20C2D7000, v6, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: %lu bytes to encrypt", buf, 0xCu);
  }

  generateRandomKey(buf);
  v8 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:16];
  uint64_t v9 = [v4 length];
  size_t v10 = [v8 length] + v9;
  v11 = [MEMORY[0x263EFF990] dataWithCapacity:(v10 + 31) & 0xFFFFFFFFFFFFFFF0];
  [v11 appendData:v8];
  [v11 appendData:v4];
  [v11 setLength:(v10 + 31) & 0xFFFFFFFFFFFFFFF0];
  size_t v23 = 0;
  v12 = a1 + 10;
  id v13 = v11;
  v14 = (const void *)[v13 mutableBytes];
  id v15 = v13;
  CCCryptorStatus v16 = CCCrypt(0, 0, 1u, v12, 0x10uLL, 0, v14, v10, (void *)[v15 mutableBytes], (v10 + 31) & 0xFFFFFFFFFFFFFFF0, &v23);
  v17 = +[PPKImageWriter log]();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)v24 = 134217984;
      uint64_t v25 = v16;
      _os_log_impl(&dword_20C2D7000, v17, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: Failed to encrypt with error code: %ld", v24, 0xCu);
    }

    id v19 = 0;
  }
  else
  {
    if (v18)
    {
      uint64_t v21 = [v15 length];
      *(_DWORD *)v24 = 134217984;
      uint64_t v25 = v21;
      _os_log_impl(&dword_20C2D7000, v17, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: %lu bytes encrypted", v24, 0xCu);
    }

    id v19 = v15;
  }

LABEL_23:
  return v19;
}

- (id)decryptData:(unsigned char *)a1
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (!a1) {
    goto LABEL_17;
  }
  if (!v3 || ![v3 length])
  {
    v6 = +[PPKImageWriter log]();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:

LABEL_17:
      id v13 = 0;
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v14 = "PPKPayloadEncryption: Received nil data. Returning nil.";
LABEL_15:
    _os_log_impl(&dword_20C2D7000, v6, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    goto LABEL_16;
  }
  if (!a1[8]) {
    [a1 initializeKey];
  }
  int v5 = a1[9];
  v6 = +[PPKImageWriter log]();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (!v7) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v14 = "PPKPayloadEncryption: failed to load key from keychain so we can't decrypt data. Returning nil.";
    goto LABEL_15;
  }
  if (v7)
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = [v4 length];
    _os_log_impl(&dword_20C2D7000, v6, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: %lu bytes to decrypt", buf, 0xCu);
  }

  size_t v17 = 0;
  dataOut = (char *)malloc_type_malloc([v4 length], 0xDC078F40uLL);
  id v9 = v4;
  CCCryptorStatus v10 = CCCrypt(1u, 0, 1u, a1 + 10, 0x10uLL, 0, (const void *)[v9 bytes], objc_msgSend(v9, "length") - 16, dataOut, objc_msgSend(v9, "length") - 16, &v17);
  if (v10)
  {
    CCCryptorStatus v11 = v10;
    v12 = +[PPKImageWriter log]();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v11;
      _os_log_impl(&dword_20C2D7000, v12, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: Failed to decrypt with error code: %ld", buf, 0xCu);
    }
    id v13 = 0;
  }
  else
  {
    id v13 = [MEMORY[0x263EFF8F8] dataWithBytes:dataOut + 16 length:v17 - 16];
    v12 = +[PPKImageWriter log]();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 length];
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v15;
      _os_log_impl(&dword_20C2D7000, v12, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: %lu bytes decrypted", buf, 0xCu);
    }
  }

  free(dataOut);
LABEL_23:

  return v13;
}

- (void)initializeKey
{
  v40[7] = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_keyInitialized)
  {
    v2->_haveKey = 0;
    CFTypeRef result = 0;
    uint64_t v3 = *MEMORY[0x263F171B8];
    uint64_t v4 = *MEMORY[0x263F171C8];
    uint64_t v5 = *MEMORY[0x263F17518];
    v39[0] = *MEMORY[0x263F171B8];
    v39[1] = v5;
    uint64_t v6 = *MEMORY[0x263EFFB40];
    uint64_t v29 = v4;
    v40[0] = v4;
    v40[1] = v6;
    uint64_t v7 = *MEMORY[0x263F16E80];
    uint64_t v8 = *MEMORY[0x263F170B0];
    v39[2] = *MEMORY[0x263F16E80];
    v39[3] = v8;
    v40[2] = @"com.apple.Markup";
    v40[3] = v6;
    uint64_t v9 = *MEMORY[0x263F17090];
    uint64_t v10 = *MEMORY[0x263F16ED8];
    v39[4] = *MEMORY[0x263F17090];
    v39[5] = v10;
    uint64_t v30 = v10;
    v40[4] = @"Sketch Service Privacy";
    v40[5] = @"Sketch Service";
    uint64_t v11 = *MEMORY[0x263F17400];
    v39[6] = *MEMORY[0x263F17400];
    uint64_t v12 = *MEMORY[0x263F17410];
    v40[6] = *MEMORY[0x263F17410];
    CFDictionaryRef query = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:7];
    OSStatus v13 = SecItemCopyMatching(query, &result);
    OSStatus v14 = v13;
    if (v13 == -25300)
    {
      generateRandomKey(v2->_key);
      BOOL v18 = [MEMORY[0x263EFF8F8] dataWithBytes:v2->_key length:16];
      uint64_t v19 = [v18 base64EncodedDataWithOptions:0];

      v37[0] = v3;
      v37[1] = v9;
      v38[0] = v29;
      v38[1] = @"Sketch Service Privacy";
      v37[2] = *MEMORY[0x263F17000];
      v37[3] = v7;
      v38[2] = @"Sketch Service Privacy";
      v38[3] = @"com.apple.Markup";
      v38[4] = v6;
      uint64_t v20 = *MEMORY[0x263F16F08];
      v37[4] = v8;
      v37[5] = v20;
      uint64_t v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"Used for the encryption of image edit state metadata for the Markup service. Deletion will make it impossible for Markup to modify annotations that were previously placed on an image using Markup." value:&stru_26C165408 table:@"PPKPayloadEncryption"];
      v38[5] = v22;
      v38[6] = @"Sketch Service";
      uint64_t v23 = *MEMORY[0x263F175A8];
      v37[6] = v30;
      v37[7] = v23;
      v38[7] = v19;
      CFDictionaryRef v24 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:8];

      CFTypeRef cf = 0;
      OSStatus v25 = SecItemAdd(v24, &cf);
      if (v25)
      {
        v26 = +[PPKImageWriter log]();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v34 = 134217984;
          *(void *)&v34[4] = v25;
          _os_log_impl(&dword_20C2D7000, v26, OS_LOG_TYPE_DEFAULT, "Couldn't add key to keychain! [osErr:%ld]", v34, 0xCu);
        }
      }
      else
      {
        v2->_haveKey = 1;
      }
      if (cf) {
        CFRelease(cf);
      }

      uint64_t v15 = v19;
    }
    else if (v13)
    {
      uint64_t v15 = +[PPKImageWriter log]();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v34 = 134218242;
        *(void *)&v34[4] = v14;
        __int16 v35 = 2112;
        v36 = &stru_26C165408;
        _os_log_impl(&dword_20C2D7000, v15, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching() returned error %ld: %@", v34, 0x16u);
      }
    }
    else
    {
      uint64_t v15 = [(id)result mutableCopy];
      CCCryptorStatus v16 = [v15 objectForKey:v30];
      size_t v17 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:query];
      [v17 removeObjectForKey:v5];
      [v17 setObject:v6 forKey:*MEMORY[0x263F17520]];
      [v17 setObject:v12 forKey:v11];
      [v17 setObject:v29 forKey:v3];
      [v17 setValue:v16 forKey:v30];
      *(void *)v34 = 0;
      if (!SecItemCopyMatching((CFDictionaryRef)v17, (CFTypeRef *)v34))
      {
        uint64_t v27 = *(void **)v34;
        if (*(void *)v34)
        {
          uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:*(void *)v34 options:0];

          if (v28)
          {
            [v28 getBytes:v2->_key length:16];
            v2->_haveKey = 1;
          }
        }
      }
    }
    v2->_keyInitialized = 1;
  }
  objc_sync_exit(v2);
}

@end