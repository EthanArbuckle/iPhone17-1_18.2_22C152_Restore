@interface POCredentialUtil
+ (BOOL)encryptPendingSSOTokens:(id)a3 usingPublicKey:(__SecKey *)a4 sharedData:(id)a5 encryptedTokens:(id *)a6;
+ (id)decryptPendingSSOTokens:(id)a3 UsingPrivateKey:(__SecKey *)a4 sharedData:(id)a5;
+ (id)maskName:(id)a3;
+ (id)passwordDataFromContext:(id)a3 error:(id *)a4;
+ (id)passwordStringFromData:(id)a3;
@end

@implementation POCredentialUtil

+ (id)passwordDataFromContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__POCredentialUtil_passwordDataFromContext_error___block_invoke;
    v14[3] = &unk_265463E70;
    v16 = &v18;
    v17 = &v24;
    v7 = v6;
    v15 = v7;
    [v5 credentialOfType:-9 reply:v14];
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v7, v8);
    v9 = (void *)v19[5];
    if (a4)
    {
      *a4 = v9;
    }
    else if (v9)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __50__POCredentialUtil_passwordDataFromContext_error___block_invoke_2;
      v13[3] = &unk_265463E98;
      v13[4] = &v18;
      id v11 = __50__POCredentialUtil_passwordDataFromContext_error___block_invoke_2((uint64_t)v13);
    }
    id v10 = (id)v25[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __50__POCredentialUtil_passwordDataFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  CFDataRef theData = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (theData)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)SecCFAllocatorZeroize();
    CFMutableDataRef MutableCopy = CFDataCreateMutableCopy(v6, 0, theData);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = MutableCopy;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __50__POCredentialUtil_passwordDataFromContext_error___block_invoke_2(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"Failure to get credential."];
  v2 = PO_LOG_POCredentialUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

+ (id)passwordStringFromData:(id)a3
{
  if (a3)
  {
    v4 = (objc_class *)NSString;
    id v5 = a3;
    id v6 = [v4 alloc];
    id v7 = v5;
    uint64_t v8 = [v7 bytes];
    uint64_t v9 = [v7 length];

    id v10 = (void *)[v6 initWithBytesNoCopy:v8 length:v9 encoding:4 freeWhenDone:0];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

+ (id)maskName:(id)a3
{
  uint64_t v3 = [a3 componentsSeparatedByString:@"@"];
  v4 = [v3 firstObject];
  if ([v3 count] == 2)
  {
    id v5 = NSString;
    id v6 = [v3 objectAtIndexedSubscript:1];
    id v7 = [v5 stringWithFormat:@"@%@", v6];
  }
  else
  {
    id v7 = &stru_2707C1488;
  }
  if ((unint64_t)[v4 length] > 3)
  {
    unint64_t v9 = [v4 length];
    id v10 = NSString;
    uint64_t v11 = [v4 length];
    if (v9 < 7) {
      uint64_t v12 = v11 - 1;
    }
    else {
      uint64_t v12 = v11 - 2;
    }
    v13 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 1, v12, @"***");
    uint64_t v8 = [v10 stringWithFormat:@"%@%@", v13, v7];
  }
  else
  {
    uint64_t v8 = [NSString stringWithFormat:@"***%@", v7];
  }

  return v8;
}

+ (BOOL)encryptPendingSSOTokens:(id)a3 usingPublicKey:(__SecKey *)a4 sharedData:(id)a5 encryptedTokens:(id *)a6
{
  v22[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = PO_LOG_POCredentialUtil();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[POCredentialUtil encryptPendingSSOTokens:usingPublicKey:sharedData:encryptedTokens:](v11);
  }

  BOOL v12 = 0;
  if (v9 && a4)
  {
    if (SecKeyIsAlgorithmSupported(a4, kSecKeyOperationTypeEncrypt, (SecKeyAlgorithm)*MEMORY[0x263F17310]))
    {
      uint64_t v21 = *MEMORY[0x263F173E0];
      v22[0] = v10;
      v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v20 = 0;
      EncryptedDataWithParameters = (void *)SecKeyCreateEncryptedDataWithParameters();
      v15 = EncryptedDataWithParameters;
      BOOL v12 = EncryptedDataWithParameters != 0;
      if (EncryptedDataWithParameters)
      {
        *a6 = EncryptedDataWithParameters;
      }
      else
      {
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke_26;
        v19[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v19[4] = v20;
        id v17 = __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke_26((uint64_t)v19);
      }
    }
    else
    {
      id v16 = __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke();
      BOOL v12 = 0;
    }
  }

  return v12;
}

id __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Encryption algorithm not supported when encrypting pending sso tokens."];
  v1 = PO_LOG_POCredentialUtil();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke_26(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Failed to encrypt tokens when encrypting pending sso tokens."];

  uint64_t v3 = PO_LOG_POCredentialUtil();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (id)decryptPendingSSOTokens:(id)a3 UsingPrivateKey:(__SecKey *)a4 sharedData:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = PO_LOG_POCredentialUtil();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[POCredentialUtil decryptPendingSSOTokens:UsingPrivateKey:sharedData:](v9);
  }

  id v10 = 0;
  if (v7 && a4 && v8)
  {
    if (SecKeyIsAlgorithmSupported(a4, kSecKeyOperationTypeDecrypt, (SecKeyAlgorithm)*MEMORY[0x263F17310]))
    {
      uint64_t v19 = *MEMORY[0x263F173E0];
      v20[0] = v8;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v18 = 0;
      DecryptedDataWithParameters = (void *)SecKeyCreateDecryptedDataWithParameters();
      v13 = DecryptedDataWithParameters;
      if (DecryptedDataWithParameters)
      {
        id v10 = DecryptedDataWithParameters;
      }
      else
      {
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke_35;
        v17[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v17[4] = v18;
        id v15 = __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke_35((uint64_t)v17);
        id v10 = 0;
      }
    }
    else
    {
      id v14 = __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke();
      id v10 = 0;
    }
  }

  return v10;
}

id __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Encryption algorithm not supported when decrypting pending sso tokens."];
  v1 = PO_LOG_POCredentialUtil();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke_35(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"failed to decrypt tokens when decrypting pending sso tokens."];

  uint64_t v3 = PO_LOG_POCredentialUtil();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (void)encryptPendingSSOTokens:(os_log_t)log usingPublicKey:sharedData:encryptedTokens:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_259DFE000, log, OS_LOG_TYPE_DEBUG, "encryptPendingSSOTokens", v1, 2u);
}

+ (void)decryptPendingSSOTokens:(os_log_t)log UsingPrivateKey:sharedData:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_259DFE000, log, OS_LOG_TYPE_DEBUG, "decryptPendingSSOTokensUsingPrivateKey", v1, 2u);
}

@end