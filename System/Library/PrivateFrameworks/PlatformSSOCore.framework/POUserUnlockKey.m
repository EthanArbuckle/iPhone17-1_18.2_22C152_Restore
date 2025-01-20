@interface POUserUnlockKey
+ (BOOL)createUnlockKeyWithPublicKey:(__SecKey *)a3 userName:(id)a4 returningCertificate:(__SecCertificate *)a5 hash:(id *)a6 encryptedData:(id *)a7;
+ (BOOL)unlockKey:(id)a3 privateKey:(__SecKey *)a4 returningKey:(__SecKey *)a5;
+ (__SecCertificate)selfSignedCertWithPrivateKey:(__SecKey *)a3 subjectName:(id)a4;
@end

@implementation POUserUnlockKey

+ (BOOL)createUnlockKeyWithPublicKey:(__SecKey *)a3 userName:(id)a4 returningCertificate:(__SecCertificate *)a5 hash:(id *)a6 encryptedData:(id *)a7
{
  id v12 = a4;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  v13 = +[POSecKeyHelper createSEPEncryptionKeyForAlgorithm:0x2707DBB50 shared:1 preboot:0];
  if (v13)
  {
    v14 = v13;
    CFDataRef v15 = +[POSecKeyHelper dataForKey:v13];
    if (v15)
    {
      CFErrorRef error = 0;
      CFDataRef v16 = SecKeyCreateEncryptedData(a3, (SecKeyAlgorithm)*MEMORY[0x263F17320], v15, &error);
      CFDataRef v17 = v16;
      if (error || !v16)
      {
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_9;
        v26[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v26[4] = error;
        id v23 = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_9((uint64_t)v26);
        BOOL v20 = 0;
      }
      else
      {
        v18 = [NSString stringWithFormat:@"Platform SSO - %@", v12];
        v19 = (__SecCertificate *)[a1 selfSignedCertWithPrivateKey:v14 subjectName:v18];
        CFRelease(v14);
        BOOL v20 = v19 != 0;
        if (v19)
        {
          *a6 = (id)SecCertificateCopyPublicKeySHA1Digest();
          *a5 = v19;
          *a7 = [(__CFData *)v17 base64EncodedStringWithOptions:0];
        }
        else
        {
          id v24 = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_17();
        }
      }
    }
    else
    {
      id v22 = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_3();
      BOOL v20 = 0;
    }
  }
  else
  {
    id v21 = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke();
    BOOL v20 = 0;
  }

  return v20;
}

id __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"failed to create unlock key"];
  v1 = PO_LOG_POUserUnlockKey();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_3()
{
  v0 = +[POError errorWithCode:-1001 description:@"failed to create unlock key data"];
  v1 = PO_LOG_POUserUnlockKey();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_9(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Failed to encrypt unlock key."];

  v3 = PO_LOG_POUserUnlockKey();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_17()
{
  v0 = +[POError errorWithCode:-1001 description:@"error creating certificate."];
  v1 = PO_LOG_POUserUnlockKey();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

+ (BOOL)unlockKey:(id)a3 privateKey:(__SecKey *)a4 returningKey:(__SecKey *)a5
{
  *a5 = 0;
  v7 = (objc_class *)MEMORY[0x263EFF8F8];
  id v8 = a3;
  CFDataRef v9 = (const __CFData *)[[v7 alloc] initWithBase64EncodedString:v8 options:0];

  CFErrorRef error = 0;
  CFDataRef v10 = SecKeyCreateDecryptedData(a4, (SecKeyAlgorithm)*MEMORY[0x263F17320], v9, &error);
  CFDataRef v11 = v10;
  if (error || !v10)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke;
    v17[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v17[4] = error;
    id v14 = __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke((uint64_t)v17);
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  id v12 = +[POSecKeyHelper systemKeyForData:v10];
  if (!v12)
  {
    id v15 = __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke_27();
    goto LABEL_7;
  }
  *a5 = v12;
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

id __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"failed to decrypt unlock key data"];

  v3 = PO_LOG_POUserUnlockKey();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke_27()
{
  v0 = +[POError errorWithCode:-1001 description:@"error loading unlockKey key"];
  v1 = PO_LOG_POUserUnlockKey();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

+ (__SecCertificate)selfSignedCertWithPrivateKey:(__SecKey *)a3 subjectName:(id)a4
{
  v25[3] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F17420];
  v23[1] = a4;
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a4;
  v6 = [v4 arrayWithObjects:v23 count:2];
  id v24 = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v25[0] = v7;
  v21[0] = *MEMORY[0x263F17428];
  v21[1] = @"US";
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  id v22 = v8;
  CFDataRef v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  v25[1] = v9;
  v19[0] = *MEMORY[0x263F17430];
  v19[1] = @"Apple Inc";
  CFDataRef v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  BOOL v20 = v10;
  CFDataRef v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  v25[2] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];

  uint64_t v13 = *MEMORY[0x263F171B0];
  v17[0] = *MEMORY[0x263F17190];
  v17[1] = v13;
  v18[0] = &unk_2707DBC28;
  v18[1] = &unk_2707DBC40;
  id v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  SelfSignedCertificate = (__SecCertificate *)SecGenerateSelfSignedCertificate();
  return SelfSignedCertificate;
}

@end