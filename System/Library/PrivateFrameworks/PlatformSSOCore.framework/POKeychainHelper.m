@interface POKeychainHelper
- (BOOL)retrieveCertAndKeyForTokenId:(id)a3 context:(id)a4 forSigning:(BOOL)a5 hash:(id)a6 certificate:(__SecCertificate *)a7 privateKey:(__SecKey *)a8;
- (BOOL)retrieveIdentityForTokenId:(id)a3 context:(id)a4 forSigning:(BOOL)a5 hash:(id)a6 identity:(__SecIdentity *)a7;
- (int)addTokens:(id)a3 metaData:(id)a4 toKeychainForService:(id)a5 username:(id)a6;
- (int)addTokens:(id)a3 metaData:(id)a4 toKeychainForService:(id)a5 username:(id)a6 system:(BOOL)a7;
- (int)removeTokensFromKeychainWithService:(id)a3 username:(id)a4;
- (int)retrieveTokensFromKeychainForService:(id)a3 username:(id)a4 returningTokens:(id *)a5 metaData:(id *)a6;
@end

@implementation POKeychainHelper

- (int)addTokens:(id)a3 metaData:(id)a4 toKeychainForService:(id)a5 username:(id)a6
{
  return [(POKeychainHelper *)self addTokens:a3 metaData:a4 toKeychainForService:a5 username:a6 system:0];
}

- (int)addTokens:(id)a3 metaData:(id)a4 toKeychainForService:(id)a5 username:(id)a6 system:(BOOL)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = PO_LOG_POKeychainHelper();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[POKeychainHelper addTokens:metaData:toKeychainForService:username:system:]";
    __int16 v41 = 2114;
    id v42 = v14;
    __int16 v43 = 2112;
    v44 = self;
    _os_log_impl(&dword_259DFE000, v16, OS_LOG_TYPE_DEFAULT, "%s service %{public}@ on %@", buf, 0x20u);
  }

  SecAccessControlRef v17 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EA0], 0, 0);
  if (v14 && v12 && v15)
  {
    uint64_t v18 = *MEMORY[0x263F175A8];
    v38[0] = v12;
    uint64_t v19 = *MEMORY[0x263F16ED8];
    v37[0] = v18;
    v37[1] = v19;
    v20 = [v15 lowercaseString];
    uint64_t v21 = *MEMORY[0x263F17090];
    v38[1] = v20;
    v38[2] = v14;
    uint64_t v22 = *MEMORY[0x263F16E80];
    v37[2] = v21;
    v37[3] = v22;
    uint64_t v23 = *MEMORY[0x263F171B8];
    uint64_t v24 = *MEMORY[0x263F171C8];
    v38[3] = kPlatformSSOAccessGroup;
    v38[4] = v24;
    uint64_t v25 = *MEMORY[0x263F17580];
    v37[4] = v23;
    v37[5] = v25;
    v38[5] = *MEMORY[0x263EFFB40];
    v26 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:6];
    v27 = (void *)[v26 mutableCopy];

    if (!a7) {
      [v27 setObject:v17 forKeyedSubscript:*MEMORY[0x263F16E70]];
    }
    if (v13)
    {
      id v36 = 0;
      v28 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v36];
      id v29 = v36;
      if (v28)
      {
        [v27 setObject:v28 forKeyedSubscript:*MEMORY[0x263F16F30]];
      }
      else
      {
        v32 = PO_LOG_POKeychainHelper();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[POKeychainHelper addTokens:metaData:toKeychainForService:username:system:]();
        }
      }
    }
    int v33 = [(POKeychainHelper *)self removeTokensFromKeychainWithService:v14 username:v15];
    v34 = PO_LOG_POKeychainHelper();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[POKeychainHelper addTokens:metaData:toKeychainForService:username:system:](v33, v34);
    }

    OSStatus v30 = SecItemAdd((CFDictionaryRef)v27, 0);
    if (v17) {
      CFRelease(v17);
    }
  }
  else
  {
    OSStatus v30 = -67693;
    id v31 = __76__POKeychainHelper_addTokens_metaData_toKeychainForService_username_system___block_invoke();
    if (v17) {
      CFRelease(v17);
    }
  }

  return v30;
}

id __76__POKeychainHelper_addTokens_metaData_toKeychainForService_username_system___block_invoke()
{
  v0 = +[POError errorWithCode:-1006 description:@"Missing required values to add tokens to keychain."];
  v1 = PO_LOG_POKeychainHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (int)retrieveTokensFromKeychainForService:(id)a3 username:(id)a4 returningTokens:(id *)a5 metaData:(id *)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  CFTypeRef result = 0;
  id v12 = PO_LOG_POKeychainHelper();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[POKeychainHelper retrieveTokensFromKeychainForService:username:returningTokens:metaData:]();
  }

  if (v10 && v11)
  {
    if (a5) {
      *a5 = 0;
    }
    if (a6) {
      *a6 = 0;
    }
    uint64_t v13 = *MEMORY[0x263EFFB40];
    uint64_t v14 = *MEMORY[0x263F17520];
    v51[0] = *MEMORY[0x263F17518];
    v51[1] = v14;
    v52[0] = v13;
    v52[1] = v13;
    uint64_t v15 = *MEMORY[0x263F17090];
    v52[2] = v10;
    uint64_t v16 = *MEMORY[0x263F16ED8];
    v51[2] = v15;
    v51[3] = v16;
    SecAccessControlRef v17 = [v11 lowercaseString];
    uint64_t v18 = *MEMORY[0x263F16E80];
    v52[3] = v17;
    v52[4] = kPlatformSSOAccessGroup;
    uint64_t v19 = *MEMORY[0x263F171B8];
    v51[4] = v18;
    v51[5] = v19;
    v51[6] = *MEMORY[0x263F17580];
    v52[5] = *MEMORY[0x263F171C8];
    v52[6] = v13;
    CFDictionaryRef v20 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:7];

    OSStatus v21 = SecItemCopyMatching(v20, &result);
    int v22 = v21;
    if (v21)
    {
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke;
      v46[3] = &__block_descriptor_36_e14___NSError_8__0l;
      OSStatus v47 = v21;
      id v23 = __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke((uint64_t)v46);
    }
    else
    {
      uint64_t v24 = (id)result;
      uint64_t v25 = [v24 objectForKey:*MEMORY[0x263F175A8]];
      v26 = v25;
      if (a5) {
        *a5 = v25;
      }
      if (a6)
      {
        v27 = [v24 objectForKey:*MEMORY[0x263F16F30]];
        if (v27)
        {
          v40 = v24;
          id v42 = (void *)MEMORY[0x263F08928];
          v44 = v26;
          v28 = (void *)MEMORY[0x263EFFA08];
          id v29 = v27;
          uint64_t v50 = objc_opt_class();
          __int16 v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
          uint64_t v30 = [v28 setWithArray:v41];
          id v31 = (void *)MEMORY[0x263EFFA08];
          v49[0] = objc_opt_class();
          v49[1] = objc_opt_class();
          v49[2] = objc_opt_class();
          v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:3];
          int v33 = [v31 setWithArray:v32];
          id v45 = 0;
          v34 = v42;
          v35 = (void *)v30;
          __int16 v43 = v29;
          id v36 = [v34 unarchivedDictionaryWithKeysOfClasses:v30 objectsOfClasses:v33 fromData:v29 error:&v45];
          id v37 = v45;
          *a6 = v36;

          if (v37)
          {
            v38 = PO_LOG_POKeychainHelper();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              -[POKeychainHelper retrieveTokensFromKeychainForService:username:returningTokens:metaData:]();
            }
          }
          v27 = v43;
          v26 = v44;
          uint64_t v24 = v40;
        }
      }
      if (result)
      {
        CFRelease(result);
        CFTypeRef result = 0;
      }
    }
  }
  else
  {
    int v22 = -67693;
    PO_LOG_POKeychainHelper();
    CFDictionaryRef v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[POKeychainHelper retrieveTokensFromKeychainForService:username:returningTokens:metaData:]";
      __int16 v55 = 2112;
      v56 = self;
      _os_log_impl(&dword_259DFE000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "%s Could not find credentials in keychain. Invalid parameters on %@", buf, 0x16u);
    }
  }

  return v22;
}

id __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke(uint64_t a1)
{
  v2 = +[POError errorWithCode:-1004 description:@"Keychain entry not found"];
  v3 = PO_LOG_POKeychainHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);
  }

  return v2;
}

- (int)removeTokensFromKeychainWithService:(id)a3 username:(id)a4
{
  v24[7] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = PO_LOG_POKeychainHelper();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POKeychainHelper removeTokensFromKeychainWithService:username:]();
  }

  if (v5 && v6)
  {
    uint64_t v8 = *MEMORY[0x263EFFB40];
    uint64_t v9 = *MEMORY[0x263F17520];
    v23[0] = *MEMORY[0x263F17518];
    v23[1] = v9;
    v24[0] = v8;
    v24[1] = v8;
    uint64_t v10 = *MEMORY[0x263F17090];
    v24[2] = v5;
    uint64_t v11 = *MEMORY[0x263F16ED8];
    v23[2] = v10;
    v23[3] = v11;
    id v12 = [v6 lowercaseString];
    uint64_t v13 = *MEMORY[0x263F16E80];
    v24[3] = v12;
    v24[4] = kPlatformSSOAccessGroup;
    uint64_t v14 = *MEMORY[0x263F171B8];
    v23[4] = v13;
    v23[5] = v14;
    v23[6] = *MEMORY[0x263F17580];
    v24[5] = *MEMORY[0x263F171C8];
    v24[6] = v8;
    CFDictionaryRef v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];

    OSStatus v16 = SecItemDelete(v15);
    int v17 = v16;
    if (v16 != -25300 && v16)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke_21;
      v21[3] = &__block_descriptor_36_e14___NSError_8__0l;
      OSStatus v22 = v16;
      id v18 = __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke_21((uint64_t)v21);
    }
  }
  else
  {
    id v19 = __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke();
    int v17 = -67693;
  }

  return v17;
}

id __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke()
{
  v0 = +[POError errorWithCode:-1006 description:@"Values missing to delete credentials from keychain"];
  v1 = PO_LOG_POKeychainHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke_21(uint64_t a1)
{
  v2 = +[POError errorWithCode:-1001 description:@"Deleting keychain entry failed"];
  v3 = PO_LOG_POKeychainHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);
  }

  return v2;
}

- (BOOL)retrieveIdentityForTokenId:(id)a3 context:(id)a4 forSigning:(BOOL)a5 hash:(id)a6 identity:(__SecIdentity *)a7
{
  BOOL v9 = a5;
  void v38[6] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    CFTypeRef result = 0;
    uint64_t v14 = *MEMORY[0x263F171B8];
    uint64_t v15 = *MEMORY[0x263F171D0];
    uint64_t v16 = *MEMORY[0x263F16E80];
    v37[0] = *MEMORY[0x263F171B8];
    v37[1] = v16;
    uint64_t v17 = *MEMORY[0x263F16E88];
    v38[0] = v15;
    v38[1] = v17;
    uint64_t v18 = *MEMORY[0x263F17518];
    v37[2] = *MEMORY[0x263F17528];
    v37[3] = v18;
    v38[2] = MEMORY[0x263EFFA88];
    v38[3] = MEMORY[0x263EFFA88];
    uint64_t v19 = *MEMORY[0x263F17558];
    uint64_t v20 = *MEMORY[0x263F170D0];
    v37[4] = *MEMORY[0x263F17558];
    v37[5] = v20;
    v38[4] = v12;
    v38[5] = v11;
    OSStatus v21 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:6];
    OSStatus v22 = (void *)[v21 mutableCopy];

    if (v9) {
      [v22 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F16F00]];
    }
    if (v13) {
      [v22 setObject:v13 forKeyedSubscript:*MEMORY[0x263F16EE0]];
    }
    if (SecItemCopyMatching((CFDictionaryRef)v22, &result))
    {
      id v23 = PO_LOG_POKeychainHelper();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[POKeychainHelper retrieveIdentityForTokenId:context:forSigning:hash:identity:]();
      }
      BOOL v24 = 0;
    }
    else
    {
      id v23 = result;
      v26 = a7;
      uint64_t v27 = *MEMORY[0x263F175B0];
      uint64_t v28 = [(id)result objectForKeyedSubscript:*MEMORY[0x263F175B0]];
      v35[0] = v14;
      v35[1] = v27;
      v36[0] = v15;
      v36[1] = v28;
      id v29 = (void *)v28;
      uint64_t v30 = *MEMORY[0x263F17410];
      v35[2] = *MEMORY[0x263F17400];
      v35[3] = v19;
      v36[2] = v30;
      v36[3] = v12;
      v35[4] = *MEMORY[0x263F17530];
      v36[4] = *MEMORY[0x263EFFB40];
      CFDictionaryRef v31 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];
      if (SecItemCopyMatching(v31, (CFTypeRef *)v26) || !*v26)
      {
        v32 = PO_LOG_POKeychainHelper();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[POKeychainHelper retrieveIdentityForTokenId:context:forSigning:hash:identity:]();
        }

        BOOL v24 = 0;
      }
      else
      {
        BOOL v24 = 1;
      }
    }
  }
  else
  {
    uint64_t v25 = PO_LOG_POKeychainHelper();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[POKeychainHelper retrieveIdentityForTokenId:context:forSigning:hash:identity:]();
    }

    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)retrieveCertAndKeyForTokenId:(id)a3 context:(id)a4 forSigning:(BOOL)a5 hash:(id)a6 certificate:(__SecCertificate *)a7 privateKey:(__SecKey *)a8
{
  SecIdentityRef identityRef = 0;
  if (![(POKeychainHelper *)self retrieveIdentityForTokenId:a3 context:a4 forSigning:a5 hash:a6 identity:&identityRef])
  {
    id v12 = PO_LOG_POKeychainHelper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[POKeychainHelper retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:]();
    }

    return 0;
  }
  if (SecIdentityCopyCertificate(identityRef, a7))
  {
    uint64_t v10 = PO_LOG_POKeychainHelper();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[POKeychainHelper retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:]();
    }
LABEL_5:

    BOOL result = (char)identityRef;
    if (!identityRef) {
      return result;
    }
    CFRelease(identityRef);
    return 0;
  }
  SecIdentityCopyPrivateKey(identityRef, a8);
  if (!*a8)
  {
    uint64_t v10 = PO_LOG_POKeychainHelper();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[POKeychainHelper retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:]();
    }
    goto LABEL_5;
  }
  if (identityRef) {
    CFRelease(identityRef);
  }
  return 1;
}

- (void)addTokens:(int)a1 metaData:(NSObject *)a2 toKeychainForService:username:system:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "Removing keychain entry returned %d", (uint8_t *)v2, 8u);
}

- (void)addTokens:metaData:toKeychainForService:username:system:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259DFE000, v0, v1, "Error archiving meta data: %{public}@", v2, v3, v4, v5, v6);
}

- (void)retrieveTokensFromKeychainForService:username:returningTokens:metaData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259DFE000, v0, v1, "Error unarchiving meta data: %{public}@", v2, v3, v4, v5, v6);
}

- (void)retrieveTokensFromKeychainForService:username:returningTokens:metaData:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_259DFE000, v0, OS_LOG_TYPE_DEBUG, "Finding keychain entry for service %{public}@", v1, 0xCu);
}

void __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [NSNumber numberWithInt:*(unsigned int *)(a2 + 32)];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeTokensFromKeychainWithService:username:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_259DFE000, v0, OS_LOG_TYPE_DEBUG, "Deleting keychain entry for service %{public}@", v1, 0xCu);
}

- (void)retrieveIdentityForTokenId:context:forSigning:hash:identity:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "missing token id", v2, v3, v4, v5, v6);
}

- (void)retrieveIdentityForTokenId:context:forSigning:hash:identity:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "Failed to get smartcard key.", v2, v3, v4, v5, v6);
}

- (void)retrieveIdentityForTokenId:context:forSigning:hash:identity:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "Token not found.", v2, v3, v4, v5, v6);
}

- (void)retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "Failed to get private key.", v2, v3, v4, v5, v6);
}

- (void)retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "failed to get certificate.\n", v2, v3, v4, v5, v6);
}

- (void)retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "failed to get identity.\n", v2, v3, v4, v5, v6);
}

@end