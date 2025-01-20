@interface NSPPrivateAccessTokenClientState
+ (uint64_t)clientPrivateKey;
- (NSPPrivateAccessTokenClientState)init;
- (void)dealloc;
@end

@implementation NSPPrivateAccessTokenClientState

uint64_t __53__NSPPrivateAccessTokenClientState_sharedClientState__block_invoke()
{
  _MergedGlobals_36 = objc_alloc_init(NSPPrivateAccessTokenClientState);
  return MEMORY[0x1F41817F8]();
}

+ (uint64_t)clientPrivateKey
{
  self;
  self;
  if (qword_1EB53BDD0 != -1) {
    dispatch_once(&qword_1EB53BDD0, &__block_literal_global_6);
  }
  v0 = (id)_MergedGlobals_36;
  if (v0) {
    uint64_t v1 = v0[1];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

- (NSPPrivateAccessTokenClientState)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)NSPPrivateAccessTokenClientState;
  v2 = [(NSPPrivateAccessTokenClientState *)&v24 init];
  if (v2)
  {
    v3 = +[NPUtilities copyKeyFromKeychainWithIdentifier:@"com.apple.NetworkServiceProxy.PrivateAccessTokens.ClientKey"];
    if (v3)
    {
      v4 = v3;
      v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v28 = 0;
        _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Found client key in keychain", v28, 2u);
      }

      v2->_clientKey = v4;
    }
    else if (!v2->_clientKey)
    {
      uint64_t v6 = *MEMORY[0x1E4F3B740];
      uint64_t v7 = *MEMORY[0x1E4F3B708];
      *(void *)v26 = *MEMORY[0x1E4F3B718];
      uint64_t v27 = v7;
      *(void *)v28 = v6;
      v29 = &unk_1EF43BD48;
      CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v26 count:2];
      SecKeyRef RandomKey = SecKeyCreateRandomKey(v8, 0);
      if (RandomKey)
      {
        v2->_clientKey = RandomKey;
        +[NPUtilities saveKeyToKeychain:RandomKey withIdentifier:@"com.apple.NetworkServiceProxy.PrivateAccessTokens.ClientKey"];
        v10 = nplog_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "Generated new client key", buf, 2u);
        }
      }
      else
      {
        v10 = nplog_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "SecKeyCreateRandomKey failed to generate client key", buf, 2u);
        }
      }
    }
    v12 = +[NPUtilities copyDataFromKeychainWithIdentifier:@"com.apple.NetworkServiceProxy.PrivateAccessTokens.Secret" accountName:@"client-tokens"];
    if (v12)
    {
      v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v28 = 0;
        _os_log_debug_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEBUG, "Found client secret in keychain", v28, 2u);
      }

      objc_setProperty_atomic(v2, v14, v12, 16);
      goto LABEL_28;
    }
    if (objc_getProperty(v2, v11, 16, 1))
    {
LABEL_28:
      v22 = v2;
      goto LABEL_29;
    }
    *(_DWORD *)v28 = 0;
    ccrng();
    if (*(_DWORD *)v28)
    {
      v15 = nplog_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        v16 = "Failed to generate random";
LABEL_24:
        _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, v16, v26, 2u);
      }
    }
    else
    {
      size_t v17 = (32 * *(void *)MEMORY[0x1A622A9E0]()) | 0x10;
      v18 = malloc_type_calloc(1uLL, v17, 0xA73BF9FAuLL);
      if (!ccec_generate_key())
      {
        v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v18 length:v17];
        objc_setProperty_atomic(v2, v20, v19, 16);

        free(v18);
        +[NPUtilities saveDataToKeychain:objc_getProperty(v2, v21, 16, 1) withIdentifier:@"com.apple.NetworkServiceProxy.PrivateAccessTokens.Secret" accountName:@"client-tokens"];
        v15 = nplog_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v26 = 0;
          _os_log_debug_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_DEBUG, "Generated new client secret", v26, 2u);
        }
        goto LABEL_27;
      }
      v15 = nplog_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        v16 = "Failed to generate key";
        goto LABEL_24;
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  v12 = nplog_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_fault_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_FAULT, "[super init] failed", v28, 2u);
  }
LABEL_29:

  return v2;
}

- (void)dealloc
{
  if (self)
  {
    clientKey = self->_clientKey;
    if (clientKey)
    {
      CFRelease(clientKey);
      self->_clientKey = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPPrivateAccessTokenClientState;
  [(NSPPrivateAccessTokenClientState *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end