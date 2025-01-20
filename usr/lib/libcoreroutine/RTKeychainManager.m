@interface RTKeychainManager
+ (RTKeychainManager)allocWithZone:(_NSZone *)a3;
- (BOOL)_removeItemWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_setKey:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_updateKey:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeEncryptionKeyWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)updateKeyWithIdentifier:(id)a3 keyData:(id)a4 keySize:(int64_t)a5 error:(id *)a6;
- (id)_keyForIdentifier:(id)a3 error:(id *)a4;
- (id)_keySpecifierWithBitSize:(int64_t)a3;
- (id)_randomKeyWithSpecifier:(id)a3 error:(id *)a4;
- (id)createSymmetricKeyWithSize:(int64_t)a3 identifier:(id)a4 storeInKeychain:(BOOL)a5 error:(id *)a6;
- (id)encryptionKeyWithSize:(int64_t)a3 identifier:(id)a4 error:(id *)a5;
- (int)_addSecItemWithAttributes:(id)a3 result:(id *)a4;
- (int)_copySecItemMatchingQuery:(id)a3 result:(id *)a4;
- (int)_deleteSecItemMatchingQuery:(id)a3;
- (int)_updateSecItemMatchingQuery:(id)a3 attributes:(id)a4;
- (void)_shutdownWithHandler:(id)a3;
- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5;
@end

@implementation RTKeychainManager

+ (RTKeychainManager)allocWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTKeychainManager;
  return (RTKeychainManager *)[super allocWithZone:a3];
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (id)createSymmetricKeyWithSize:(int64_t)a3 identifier:(id)a4 storeInKeychain:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (v10)
  {
    if ((unint64_t)a3 < 3)
    {
      v11 = [(RTKeychainManager *)self _keySpecifierWithBitSize:a3];
      id v28 = 0;
      v12 = [(RTKeychainManager *)self _randomKeyWithSpecifier:v11 error:&v28];
      v13 = (char *)v28;
      v14 = v13;
      if (!v12 || v13)
      {
        v24 = _rt_log_facility_get_os_log(RTLogFacilityKeychain);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v14;
          _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "could not generate key, error, %@", buf, 0xCu);
        }

        if (a6)
        {
          v18 = 0;
          *a6 = v14;
          goto LABEL_31;
        }
      }
      else
      {
        if (!v7
          || (id v27 = 0,
              BOOL v15 = [(RTKeychainManager *)self _setKey:v12 forIdentifier:v10 error:&v27], v16 = (char *)v27, v17 = v16, v15)&& !v16)
        {
          v18 = [v12 keyData];
LABEL_31:

          goto LABEL_32;
        }
        v25 = _rt_log_facility_get_os_log(RTLogFacilityKeychain);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v17;
          _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "could not set key in keychain, error, %@", buf, 0xCu);
        }

        if (a6) {
          *a6 = v17;
        }
      }
      v18 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[RTKeychainManager createSymmetricKeyWithSize:identifier:storeInKeychain:error:]";
      __int16 v35 = 1024;
      int v36 = 55;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if ((unint64_t)a3 < 3)
    {
LABEL_17:
      if (a6)
      {
        uint64_t v31 = *MEMORY[0x1E4F28568];
        v32 = @"Invalid parameter: identifier must be non-nil.";
        v21 = (void *)MEMORY[0x1E4F1C9E8];
        v22 = &v32;
        v23 = &v31;
        goto LABEL_19;
      }
LABEL_20:
      v18 = 0;
      goto LABEL_33;
    }
  }
  v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[RTKeychainManager createSymmetricKeyWithSize:identifier:storeInKeychain:error:]";
    __int16 v35 = 1024;
    int v36 = 56;
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "unknown key size (in %s:%d)", buf, 0x12u);
  }

  if (!v10) {
    goto LABEL_17;
  }
  if (!a6) {
    goto LABEL_20;
  }
  uint64_t v29 = *MEMORY[0x1E4F28568];
  v30 = @"Invalid parameter: unknown key size.";
  v21 = (void *)MEMORY[0x1E4F1C9E8];
  v22 = &v30;
  v23 = &v29;
LABEL_19:
  v14 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
  [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v14];
  v18 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

LABEL_33:

  return v18;
}

- (BOOL)removeEncryptionKeyWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v12 = 0;
    BOOL v5 = [(RTKeychainManager *)self _removeItemWithIdentifier:a3 error:&v12];
    id v6 = v12;
    BOOL v7 = v6;
    int v8 = !v5;
    if (v6) {
      int v8 = 1;
    }
    if (a4 && v8) {
      *a4 = v6;
    }
    BOOL v9 = v7 == 0;
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTKeychainManager removeEncryptionKeyWithIdentifier:error:]";
      __int16 v17 = 1024;
      int v18 = 122;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (!a4) {
      return 0;
    }
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14 = @"Invalid parameter: identifier must be non-nil.";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v7];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)encryptionKeyWithSize:(int64_t)a3 identifier:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v8)
  {
    if ((unint64_t)a3 < 3)
    {
      id v20 = 0;
      BOOL v9 = [(RTKeychainManager *)self _keyForIdentifier:v8 error:&v20];
      id v10 = (char *)v20;
      if (v10)
      {
        v11 = _rt_log_facility_get_os_log(RTLogFacilityKeychain);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v10;
          _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "error encountered attempting to fetch AES key from keychain: %@", buf, 0xCu);
        }

        if (a5)
        {
          uint64_t v21 = *MEMORY[0x1E4F28A50];
          v22 = v10;
          id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v12];
        }
        id v13 = 0;
      }
      else
      {
        id v13 = v9;
      }

      goto LABEL_23;
    }
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v28 = "-[RTKeychainManager encryptionKeyWithSize:identifier:error:]";
      __int16 v29 = 1024;
      int v30 = 152;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if ((unint64_t)a3 < 3)
    {
LABEL_17:
      if (a5)
      {
        uint64_t v25 = *MEMORY[0x1E4F28568];
        v26 = @"Invalid parameter: identifier must be non-nil.";
        v16 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v17 = &v26;
        int v18 = &v25;
        goto LABEL_19;
      }
LABEL_20:
      id v13 = 0;
      goto LABEL_24;
    }
  }
  BOOL v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = "-[RTKeychainManager encryptionKeyWithSize:identifier:error:]";
    __int16 v29 = 1024;
    int v30 = 153;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "unknown key size (in %s:%d)", buf, 0x12u);
  }

  if (!v8) {
    goto LABEL_17;
  }
  if (!a5) {
    goto LABEL_20;
  }
  uint64_t v23 = *MEMORY[0x1E4F28568];
  v24 = @"Invalid parameter: unknown key size.";
  v16 = (void *)MEMORY[0x1E4F1C9E8];
  __int16 v17 = &v24;
  int v18 = &v23;
LABEL_19:
  id v10 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
  [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v10];
  id v13 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_24:

  return v13;
}

- (BOOL)updateKeyWithIdentifier:(id)a3 keyData:(id)a4 keySize:(int64_t)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (!v10)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    if (!a6) {
      goto LABEL_23;
    }
    uint64_t v23 = @"identifier";
    goto LABEL_20;
  }
  if (!v11)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyData", buf, 2u);
    }

    if (!a6) {
      goto LABEL_23;
    }
    uint64_t v23 = @"keyData";
LABEL_20:
    _RTErrorInvalidParameterCreate((uint64_t)v23);
    BOOL v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if ((unint64_t)a5 >= 3)
  {
    if (a6)
    {
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v33[0] = @"Invalid parameter: unknown key size.";
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v25];
    }
LABEL_23:
    BOOL v21 = 0;
    goto LABEL_29;
  }
  id v13 = [(RTKeychainManager *)self _keySpecifierWithBitSize:a5];
  id v29 = 0;
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F9A5D0]) initWithData:v12 specifier:v13 error:&v29];
  id v15 = v29;
  v16 = v15;
  if (!v14 || v15)
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "could not generate key, error, %@", buf, 0xCu);
    }

    BOOL v21 = 0;
    if (a6) {
      *a6 = v16;
    }
  }
  else
  {
    id v28 = 0;
    BOOL v17 = [(RTKeychainManager *)self _updateKey:v14 forIdentifier:v10 error:&v28];
    id v18 = v28;
    uint64_t v19 = v18;
    int v20 = !v17;
    if (v18) {
      int v20 = 1;
    }
    if (a6 && v20) {
      *a6 = v18;
    }
    BOOL v21 = v19 == 0;
  }
LABEL_29:

  return v21;
}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (int)_copySecItemMatchingQuery:(id)a3 result:(id *)a4
{
  if (!a4) {
    return -50;
  }
  CFTypeRef result = 0;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  int v6 = v5;
  CFTypeRef v7 = result;
  if (result)
  {
    if (!v5)
    {
      id v8 = [MEMORY[0x1E4F1C9B8] dataWithData:];
      id v9 = *a4;
      *a4 = v8;

      CFTypeRef v7 = result;
    }
    CFRelease(v7);
  }
  return v6;
}

- (int)_updateSecItemMatchingQuery:(id)a3 attributes:(id)a4
{
  return SecItemUpdate((CFDictionaryRef)a3, (CFDictionaryRef)a4);
}

- (int)_addSecItemWithAttributes:(id)a3 result:(id *)a4
{
  return SecItemAdd((CFDictionaryRef)a3, (CFTypeRef *)a4);
}

- (int)_deleteSecItemMatchingQuery:(id)a3
{
  return SecItemDelete((CFDictionaryRef)a3);
}

- (id)_keySpecifierWithBitSize:(int64_t)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F9A5D8]) initWithBitSize:a3];

  return v3;
}

- (id)_randomKeyWithSpecifier:(id)a3 error:(id *)a4
{
  OSStatus v5 = (objc_class *)MEMORY[0x1E4F9A5D0];
  id v6 = a3;
  CFTypeRef v7 = (void *)[[v5 alloc] initRandomKeyWithSpecifier:v6 error:a4];

  return v7;
}

- (id)_keyForIdentifier:(id)a3 error:(id *)a4
{
  v25[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F3B9A0];
  uint64_t v8 = *MEMORY[0x1E4F3BD08];
  v24[0] = *MEMORY[0x1E4F3B978];
  v24[1] = v8;
  v25[0] = v7;
  v25[1] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = *MEMORY[0x1E4F3B570];
  uint64_t v10 = *MEMORY[0x1E4F3B878];
  v24[2] = *MEMORY[0x1E4F3B558];
  v24[3] = v10;
  v25[2] = v9;
  v25[3] = MEMORY[0x1E4F1CC38];
  uint64_t v11 = *MEMORY[0x1E4F3BC70];
  v24[4] = *MEMORY[0x1E4F3B5D0];
  v24[5] = v11;
  v25[4] = v6;
  v25[5] = MEMORY[0x1E4F1CC38];
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:6];
  id v19 = 0;
  int v13 = [(RTKeychainManager *)self _copySecItemMatchingQuery:v12 result:&v19];
  id v14 = v19;
  id v15 = v14;
  if (v13)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 1024;
      int v23 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "could not get key for identifier, %@ in keychain, error, %d", buf, 0x12u);
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v13 userInfo:0];
      id v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = v14;
  }

  return v17;
}

- (BOOL)_setKey:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  v22[6] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = *MEMORY[0x1E4F3B9A0];
  uint64_t v10 = *MEMORY[0x1E4F3BD08];
  v21[0] = *MEMORY[0x1E4F3B978];
  v21[1] = v10;
  v22[0] = v9;
  v22[1] = MEMORY[0x1E4F1CC38];
  uint64_t v11 = *MEMORY[0x1E4F3B878];
  v21[2] = *MEMORY[0x1E4F3B558];
  v21[3] = v11;
  v22[2] = *MEMORY[0x1E4F3B570];
  v22[3] = MEMORY[0x1E4F1CC38];
  v21[4] = *MEMORY[0x1E4F3BD38];
  id v12 = [a3 keyData];
  v21[5] = *MEMORY[0x1E4F3B5D0];
  v22[4] = v12;
  v22[5] = v8;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];

  int v14 = [(RTKeychainManager *)self _addSecItemWithAttributes:v13 result:0];
  if (v14)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 1024;
      int v20 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "could not set key for identifier, %@ in keychain, error, %d", (uint8_t *)&v17, 0x12u);
    }

    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
    }
  }

  return v14 == 0;
}

- (BOOL)_removeItemWithIdentifier:(id)a3 error:(id *)a4
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F3B9A0];
  uint64_t v8 = *MEMORY[0x1E4F3BD08];
  v19[0] = *MEMORY[0x1E4F3B978];
  v19[1] = v8;
  v20[0] = v7;
  v20[1] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = *MEMORY[0x1E4F3B570];
  uint64_t v10 = *MEMORY[0x1E4F3B878];
  v19[2] = *MEMORY[0x1E4F3B558];
  v19[3] = v10;
  v20[2] = v9;
  v20[3] = MEMORY[0x1E4F1CC38];
  v19[4] = *MEMORY[0x1E4F3B5D0];
  v20[4] = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];
  int v12 = [(RTKeychainManager *)self _deleteSecItemMatchingQuery:v11];
  if (v12)
  {
    int v13 = _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 1024;
      int v18 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "could not remove key for identifier, %@ in keychain, error, %d", (uint8_t *)&v15, 0x12u);
    }

    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
    }
  }

  return v12 == 0;
}

- (BOOL)_updateKey:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  v28[5] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = *MEMORY[0x1E4F3B9A0];
  uint64_t v10 = *MEMORY[0x1E4F3BD08];
  v27[0] = *MEMORY[0x1E4F3B978];
  v27[1] = v10;
  v28[0] = v9;
  v28[1] = MEMORY[0x1E4F1CC38];
  uint64_t v11 = *MEMORY[0x1E4F3B570];
  uint64_t v12 = *MEMORY[0x1E4F3B878];
  v27[2] = *MEMORY[0x1E4F3B558];
  v27[3] = v12;
  v28[2] = v11;
  v28[3] = MEMORY[0x1E4F1CC38];
  v27[4] = *MEMORY[0x1E4F3B5D0];
  v28[4] = v8;
  int v13 = (void *)MEMORY[0x1E4F1C9E8];
  id v14 = a3;
  int v15 = [v13 dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v25 = *MEMORY[0x1E4F3BD38];
  id v16 = [v14 keyData];

  v26 = v16;
  __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  int v18 = [(RTKeychainManager *)self _updateSecItemMatchingQuery:v15 attributes:v17];
  if (v18)
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412546;
      id v22 = v8;
      __int16 v23 = 1024;
      int v24 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "could not update key for identifier, %@ in keychain, error, %d", (uint8_t *)&v21, 0x12u);
    }

    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v18 userInfo:0];
    }
  }

  return v18 == 0;
}

@end