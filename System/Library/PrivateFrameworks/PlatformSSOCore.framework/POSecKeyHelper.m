@interface POSecKeyHelper
+ (BOOL)_verifyCurve25519EncryptionKey:(__SecKey *)a3;
+ (BOOL)_verifyCurve25519SigningKey:(__SecKey *)a3;
+ (BOOL)checkIfBiometricConstraintsForSigning:(__SecAccessControl *)a3;
+ (BOOL)checkIfBiometricConstraintsForSigningForKey:(__SecKey *)a3;
+ (BOOL)evaluateTrustForCertificates:(id)a3 rootCertificates:(id)a4;
+ (BOOL)isEncryptionAlgorithm:(id)a3 validForKey:(__SecKey *)a4;
+ (BOOL)isSEPKey:(__SecKey *)a3;
+ (BOOL)verifyKey:(__SecKey *)a3;
+ (__SecCertificate)certificateForData:(id)a3;
+ (__SecIdentity)identityForKey:(__SecKey *)a3 andCertificate:(__SecCertificate *)a4;
+ (__SecKey)createEncryptionKeyForAlgorithm:(id)a3;
+ (__SecKey)createSEPEncryptionKeyForAlgorithm:(id)a3 shared:(BOOL)a4;
+ (__SecKey)createSEPEncryptionKeyForAlgorithm:(id)a3 shared:(BOOL)a4 preboot:(BOOL)a5;
+ (__SecKey)createSEPSigningKeyForAlgorithm:(id)a3 shared:(BOOL)a4;
+ (__SecKey)createSEPSigningKeyForAlgorithm:(id)a3 shared:(BOOL)a4 preboot:(BOOL)a5;
+ (__SecKey)createUserSEPSigningKeyForAlgorithm:(id)a3;
+ (__SecKey)createUserSEPSigningKeyForAlgorithm:(id)a3 userPresence:(BOOL)a4 currentSet:(BOOL)a5;
+ (__SecKey)ephemeralKeyForData:(id)a3;
+ (__SecKey)ephemeralPublicKeyForData:(id)a3;
+ (__SecKey)ephemeralX25529PublicKeyForData:(id)a3;
+ (__SecKey)keyForData:(id)a3;
+ (__SecKey)keyForData:(id)a3 context:(id)a4;
+ (__SecKey)systemKeyForData:(id)a3;
+ (id)dataForCertificate:(__SecCertificate *)a3;
+ (id)dataForEphemeralKey:(__SecKey *)a3;
+ (id)dataForKey:(__SecKey *)a3;
+ (id)printKey:(__SecKey *)a3;
@end

@implementation POSecKeyHelper

+ (__SecKey)createUserSEPSigningKeyForAlgorithm:(id)a3
{
  return (__SecKey *)[a1 createUserSEPSigningKeyForAlgorithm:a3 userPresence:0 currentSet:0];
}

+ (__SecKey)createUserSEPSigningKeyForAlgorithm:(id)a3 userPresence:(BOOL)a4 currentSet:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v56[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  CFErrorRef error = 0;
  v55 = @"osgn";
  v52 = @"com.apple.PlatformSSO.auth";
  v53 = @"cag";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
  v54 = v8;
  v9 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
  v56[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];

  SecAccessControlRef v11 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EC8], 0x40000000uLL, &error);
  if (!v11)
  {
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke;
    v45[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v45[4] = error;
    id v14 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke((uint64_t)v45);
    goto LABEL_34;
  }
  SecAccessControlSetConstraints();
  if (v6)
  {
    v12 = [MEMORY[0x263EFF8F8] data];
    if (v5) {
      uint64_t BiometryCurrentSet = SecAccessConstraintCreateBiometryCurrentSet();
    }
    else {
      uint64_t BiometryCurrentSet = SecAccessConstraintCreateBiometryAny();
    }
    v15 = (void *)BiometryCurrentSet;
    if (!BiometryCurrentSet)
    {
      CFRelease(v11);
      id v23 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_8();

LABEL_22:
      SecAccessControlRef v11 = 0;
      goto LABEL_34;
    }
    uint64_t Companion = SecAccessConstraintCreateCompanion();
    v17 = (void *)Companion;
    if (Companion)
    {
      v51[0] = v15;
      v51[1] = Companion;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
      uint64_t KofN = SecAccessConstraintCreateKofN();
      v19 = (void *)KofN;
      if (KofN)
      {
        v41 = (void *)KofN;
        v40 = SecAccessControlGetConstraint();
        v20 = (void *)[v40 mutableCopy];
        v21 = v20;
        if (v20) {
          id v22 = v20;
        }
        else {
          id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        }
        v27 = v22;

        v19 = v41;
        [v27 addEntriesFromDictionary:v41];
        if (SecAccessControlAddConstraintForOperation())
        {
          int v25 = 0;
        }
        else
        {
          CFRelease(v11);
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_23;
          v43[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v43[4] = error;
          id v28 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_23((uint64_t)v43);
          SecAccessControlRef v11 = 0;
          int v25 = 1;
        }
      }
      else
      {
        CFRelease(v11);
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_18;
        v44[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v44[4] = error;
        id v26 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_18((uint64_t)v44);
        SecAccessControlRef v11 = 0;
        int v25 = 1;
      }
    }
    else
    {
      CFRelease(v11);
      id v24 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_12();
      SecAccessControlRef v11 = 0;
      int v25 = 1;
    }

    if (v25) {
      goto LABEL_22;
    }
  }
  id v29 = (id)*MEMORY[0x263F16FB8];
  if (([v7 isEqualToNumber:0x2707DBB50] & 1) == 0)
  {
    if ([v7 isEqualToNumber:0x2707DBB68])
    {
      v30 = &unk_2707DBB08;
      goto LABEL_29;
    }
    if ([v7 isEqualToNumber:0x2707DBB80])
    {
      id v31 = (id)*MEMORY[0x263F16FD0];

      v30 = &unk_2707DBAF0;
      id v29 = v31;
      goto LABEL_29;
    }
  }
  v30 = &unk_2707DBAF0;
LABEL_29:
  uint64_t v32 = *MEMORY[0x263F16F98];
  v49[0] = *MEMORY[0x263F16FA8];
  v49[1] = v32;
  v50[0] = v29;
  v50[1] = v30;
  uint64_t v33 = *MEMORY[0x263F170D0];
  v50[2] = *MEMORY[0x263F170D8];
  uint64_t v34 = *MEMORY[0x263F174B8];
  v49[2] = v33;
  v49[3] = v34;
  uint64_t v35 = *MEMORY[0x263F16E70];
  v47[0] = *MEMORY[0x263F16F50];
  v47[1] = v35;
  v48[0] = MEMORY[0x263EFFA80];
  v48[1] = v11;
  v36 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  v50[3] = v36;
  CFDictionaryRef v37 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];

  if (v11) {
    CFRelease(v11);
  }
  SecAccessControlRef v11 = SecKeyCreateRandomKey(v37, &error);
  if (!v11)
  {
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_30;
    v42[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v42[4] = error;
    id v38 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_30((uint64_t)v42);
  }

LABEL_34:
  return v11;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecAccessControlCreateWithFlags."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_8()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with SecAccessConstraintCreateBiometry."];
  v1 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_12()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with SecAccessConstraintCreateCompanion."];
  v1 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_18(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecAccessConstraintCreateKofN."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_23(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error adding biometric constraint."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_30(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecKeyCreateRandomKey."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (__SecKey)createSEPSigningKeyForAlgorithm:(id)a3 shared:(BOOL)a4
{
  return (__SecKey *)[a1 createSEPSigningKeyForAlgorithm:a3 shared:a4 preboot:0];
}

+ (__SecKey)createSEPSigningKeyForAlgorithm:(id)a3 shared:(BOOL)a4 preboot:(BOOL)a5
{
  v47[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFErrorRef error = 0;
  v46 = @"osgn";
  v43 = @"com.apple.PlatformSSO.auth";
  v44 = @"cag";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  v45 = v7;
  v8 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v47[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];

  SecAccessControlRef v10 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EB0], 0x40000000uLL, &error);
  if (!v10)
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke;
    v33[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v33[4] = error;
    id v12 = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke((uint64_t)v33);
    goto LABEL_17;
  }
  SecAccessControlSetProtection();
  if (error)
  {
    CFRelease(v10);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_34;
    v32[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v32[4] = error;
    id v11 = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_34((uint64_t)v32);
    SecAccessControlRef v10 = 0;
    goto LABEL_17;
  }
  SecAccessControlSetConstraints();
  id v13 = (id)*MEMORY[0x263F16FB8];
  if (([v6 isEqualToNumber:0x2707DBB50] & 1) == 0)
  {
    if ([v6 isEqualToNumber:0x2707DBB68])
    {
      id v14 = &unk_2707DBB08;
      goto LABEL_11;
    }
    if ([v6 isEqualToNumber:0x2707DBB80])
    {
      id v15 = (id)*MEMORY[0x263F16FD0];

      id v14 = &unk_2707DBAF0;
      id v13 = v15;
      goto LABEL_11;
    }
  }
  id v14 = &unk_2707DBAF0;
LABEL_11:
  uint64_t v16 = *MEMORY[0x263F16F98];
  if (a4)
  {
    v37[0] = *MEMORY[0x263F16FA8];
    v37[1] = v16;
    v38[0] = v13;
    v38[1] = v14;
    uint64_t v17 = *MEMORY[0x263F170D8];
    uint64_t v18 = *MEMORY[0x263F17598];
    v37[2] = *MEMORY[0x263F170D0];
    v37[3] = v18;
    v38[2] = v17;
    v38[3] = MEMORY[0x263EFFA88];
    v37[4] = *MEMORY[0x263F174B8];
    uint64_t v19 = *MEMORY[0x263F16E70];
    v35[0] = *MEMORY[0x263F16F50];
    v35[1] = v19;
    v36[0] = MEMORY[0x263EFFA80];
    v36[1] = v10;
    v20 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    v38[4] = v20;
    v21 = NSDictionary;
    id v22 = v38;
    id v23 = v37;
    uint64_t v24 = 5;
  }
  else
  {
    v41[0] = *MEMORY[0x263F16FA8];
    v41[1] = v16;
    v42[0] = v13;
    v42[1] = v14;
    uint64_t v25 = *MEMORY[0x263F170D0];
    v42[2] = *MEMORY[0x263F170D8];
    uint64_t v26 = *MEMORY[0x263F174B8];
    v41[2] = v25;
    v41[3] = v26;
    uint64_t v27 = *MEMORY[0x263F16E70];
    v39[0] = *MEMORY[0x263F16F50];
    v39[1] = v27;
    v40[0] = MEMORY[0x263EFFA80];
    v40[1] = v10;
    v20 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    v42[3] = v20;
    v21 = NSDictionary;
    id v22 = v42;
    id v23 = v41;
    uint64_t v24 = 4;
  }
  CFDictionaryRef v28 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v24];

  CFRelease(v10);
  SecAccessControlRef v10 = SecKeyCreateRandomKey(v28, &error);
  if (!v10)
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_38;
    v31[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v31[4] = error;
    id v29 = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_38((uint64_t)v31);
  }

LABEL_17:
  return v10;
}

id __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecAccessControlCreateWithFlags."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_34(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecAccessControlSetProtection."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_38(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecKeyCreateRandomKey."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (__SecKey)createSEPEncryptionKeyForAlgorithm:(id)a3 shared:(BOOL)a4
{
  return (__SecKey *)[a1 createSEPEncryptionKeyForAlgorithm:a3 shared:a4 preboot:0];
}

+ (__SecKey)createSEPEncryptionKeyForAlgorithm:(id)a3 shared:(BOOL)a4 preboot:(BOOL)a5
{
  BOOL v5 = a5;
  v80[1] = *MEMORY[0x263EF8340];
  id v48 = a3;
  CFErrorRef error = 0;
  v78 = @"com.apple.PlatformSSO.auth";
  v79 = @"cag";
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
  v80[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v80 forKeys:&v79 count:1];

  if (v5)
  {
    v8 = (void *)[v7 mutableCopy];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"cisp"];

    id v7 = v8;
  }
  v47 = v7;
  v77[0] = v7;
  v76[0] = @"ock";
  v76[1] = @"oece";
  v73 = @"com.apple.PlatformSSO.auth";
  v74 = @"cag";
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
  v75 = v46;
  v45 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  v77[1] = v45;
  v76[2] = @"oecd";
  v71 = @"cag";
  v70 = @"com.apple.PlatformSSO.auth";
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
  v72 = v9;
  SecAccessControlRef v10 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  v77[2] = v10;
  v76[3] = @"oe";
  v67 = @"com.apple.PlatformSSO.auth";
  v68 = @"cag";
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
  v69 = v11;
  id v12 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  v77[3] = v12;
  v76[4] = @"od";
  v64 = @"com.apple.PlatformSSO.auth";
  v65 = @"cag";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
  v66 = v13;
  id v14 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  v77[4] = v14;
  v76[5] = @"osgn";
  v61 = @"com.apple.PlatformSSO.auth";
  v62 = @"cag";
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
  v63 = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  v77[5] = v16;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:6];

  SecAccessControlRef v18 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EB0], 0x40000000uLL, &error);
  if (!v18)
  {
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    void v51[2] = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke;
    v51[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v51[4] = error;
    id v24 = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke((uint64_t)v51);
    id v22 = 0;
    id v23 = v7;
    v20 = v48;
    goto LABEL_16;
  }
  SecAccessControlRef v19 = v18;
  SecAccessControlSetProtection();
  v20 = v48;
  if (error)
  {
    CFRelease(v19);
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_42;
    v50[3] = &__block_descriptor_40_e14___NSError_8__0l;
    void v50[4] = error;
    id v21 = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_42((uint64_t)v50);
    id v22 = 0;
    id v23 = v47;
    goto LABEL_16;
  }
  uint64_t v25 = v17;
  SecAccessControlSetConstraints();
  id v26 = (id)*MEMORY[0x263F16FB8];
  if (([v48 isEqualToNumber:0x2707DBB50] & 1) == 0
    && ([v48 isEqualToNumber:0x2707DBB68] & 1) == 0)
  {
    if ([v48 isEqualToNumber:0x2707DBB80])
    {
      uint64_t v27 = &unk_2707DBB08;
      goto LABEL_10;
    }
    if ([v48 isEqualToNumber:0x2707DBB98])
    {
      id v43 = (id)*MEMORY[0x263F16FF8];

      uint64_t v27 = &unk_2707DBAF0;
      id v26 = v43;
      goto LABEL_10;
    }
  }
  uint64_t v27 = &unk_2707DBAF0;
LABEL_10:
  uint64_t v28 = *MEMORY[0x263F16F98];
  if (a4)
  {
    v55[0] = *MEMORY[0x263F16FA8];
    v55[1] = v28;
    v56[0] = v26;
    v56[1] = v27;
    uint64_t v29 = *MEMORY[0x263F170D8];
    uint64_t v30 = *MEMORY[0x263F17598];
    v55[2] = *MEMORY[0x263F170D0];
    v55[3] = v30;
    v56[2] = v29;
    void v56[3] = MEMORY[0x263EFFA88];
    v55[4] = *MEMORY[0x263F174B8];
    uint64_t v31 = *MEMORY[0x263F16E70];
    v53[0] = *MEMORY[0x263F16F50];
    v53[1] = v31;
    v54[0] = MEMORY[0x263EFFA80];
    v54[1] = v19;
    uint64_t v32 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
    v56[4] = v32;
    uint64_t v33 = NSDictionary;
    uint64_t v34 = v56;
    uint64_t v35 = v55;
    uint64_t v36 = 5;
  }
  else
  {
    v59[0] = *MEMORY[0x263F16FA8];
    v59[1] = v28;
    v60[0] = v26;
    v60[1] = v27;
    uint64_t v37 = *MEMORY[0x263F170D0];
    v60[2] = *MEMORY[0x263F170D8];
    uint64_t v38 = *MEMORY[0x263F174B8];
    v59[2] = v37;
    v59[3] = v38;
    uint64_t v39 = *MEMORY[0x263F16E70];
    v57[0] = *MEMORY[0x263F16F50];
    v57[1] = v39;
    v58[0] = MEMORY[0x263EFFA80];
    v58[1] = v19;
    uint64_t v32 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
    v60[3] = v32;
    uint64_t v33 = NSDictionary;
    uint64_t v34 = v60;
    uint64_t v35 = v59;
    uint64_t v36 = 4;
  }
  CFDictionaryRef v40 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:v36];

  CFRelease(v19);
  id v22 = SecKeyCreateRandomKey(v40, &error);
  if (!v22)
  {
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_43;
    v49[3] = &__block_descriptor_40_e14___NSError_8__0l;
    void v49[4] = error;
    id v41 = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_43((uint64_t)v49);
  }

  id v23 = v47;
  uint64_t v17 = v25;
LABEL_16:

  return v22;
}

id __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecAccessControlCreateWithFlags."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_42(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecAccessControlSetProtection."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_43(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecKeyCreateRandomKey."];

  v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (__SecKey)createEncryptionKeyForAlgorithm:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  CFErrorRef error = 0;
  id v4 = (id)*MEMORY[0x263F16FB8];
  if (([v3 isEqualToNumber:0x2707DBB50] & 1) != 0
    || ([v3 isEqualToNumber:0x2707DBB68] & 1) != 0)
  {
    goto LABEL_7;
  }
  if ([v3 isEqualToNumber:0x2707DBB80])
  {
    BOOL v5 = &unk_2707DBB08;
    goto LABEL_8;
  }
  if (![v3 isEqualToNumber:0x2707DBB98])
  {
LABEL_7:
    BOOL v5 = &unk_2707DBAF0;
  }
  else
  {
    id v6 = (id)*MEMORY[0x263F16FF8];

    BOOL v5 = &unk_2707DBAF0;
    id v4 = v6;
  }
LABEL_8:
  uint64_t v7 = *MEMORY[0x263F16F98];
  v15[0] = *MEMORY[0x263F16FA8];
  v15[1] = v7;
  v16[0] = v4;
  v16[1] = v5;
  uint64_t v8 = *MEMORY[0x263F17580];
  v15[2] = *MEMORY[0x263F16F50];
  v15[3] = v8;
  v16[2] = MEMORY[0x263EFFA80];
  v16[3] = MEMORY[0x263EFFA88];
  CFDictionaryRef v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  SecAccessControlRef v10 = SecKeyCreateRandomKey(v9, &error);
  if (!v10)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__POSecKeyHelper_createEncryptionKeyForAlgorithm___block_invoke;
    v13[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v13[4] = error;
    id v11 = __50__POSecKeyHelper_createEncryptionKeyForAlgorithm___block_invoke((uint64_t)v13);
  }

  return v10;
}

id __50__POSecKeyHelper_createEncryptionKeyForAlgorithm___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecKeyCreateRandomKey."];

  id v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (BOOL)checkIfBiometricConstraintsForSigningForKey:(__SecKey *)a3
{
  if (!a3) {
    return 0;
  }
  CFDictionaryRef v4 = SecKeyCopyAttributes(a3);
  BOOL v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x263F16E70]];

  if (v5) {
    char v6 = [a1 checkIfBiometricConstraintsForSigning:v5];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)checkIfBiometricConstraintsForSigning:(__SecAccessControl *)a3
{
  id v3 = SecAccessControlGetConstraint();
  CFDictionaryRef v4 = [v3 objectForKeyedSubscript:@"ckon"];
  BOOL v5 = [v4 objectForKeyedSubscript:@"cbio"];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"cwtch"];
    BOOL v6 = v7 != 0;
  }
  return v6;
}

+ (id)dataForKey:(__SecKey *)a3
{
  if (a3)
  {
    CFDictionaryRef v3 = SecKeyCopyAttributes(a3);
    CFDictionaryRef v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x263F170F8]];
  }
  else
  {
    CFDictionaryRef v4 = 0;
  }
  return v4;
}

+ (id)dataForEphemeralKey:(__SecKey *)a3
{
  if (a3)
  {
    CFDataRef v4 = SecKeyCopyExternalRepresentation(a3, 0);
  }
  else
  {
    CFDataRef v4 = 0;
  }
  return v4;
}

+ (__SecKey)keyForData:(id)a3
{
  return (__SecKey *)[a1 keyForData:a3 context:0];
}

+ (__SecKey)keyForData:(id)a3 context:(id)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[POSecKeyHelper keyForData:context:]();
  }

  if (v5)
  {
    CFErrorRef error = 0;
    uint64_t v8 = *MEMORY[0x263F170D8];
    uint64_t v9 = *MEMORY[0x263F170F8];
    v18[0] = *MEMORY[0x263F170D0];
    v18[1] = v9;
    v19[0] = v8;
    v19[1] = v5;
    SecAccessControlRef v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v11 = (void *)[v10 mutableCopy];

    if (v6) {
      [v11 setObject:v6 forKeyedSubscript:*MEMORY[0x263F17558]];
    }
    CFDataRef v12 = [MEMORY[0x263EFF8F8] data];
    id v13 = SecKeyCreateWithData(v12, (CFDictionaryRef)v11, &error);
    if (!v13)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __37__POSecKeyHelper_keyForData_context___block_invoke;
      v16[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v16[4] = error;
      id v14 = __37__POSecKeyHelper_keyForData_context___block_invoke((uint64_t)v16);
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id __37__POSecKeyHelper_keyForData_context___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecKeyCreateWithData."];

  uint64_t v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (__SecKey)systemKeyForData:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  CFDataRef v4 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[POSecKeyHelper systemKeyForData:]();
  }

  if (v3)
  {
    CFErrorRef error = 0;
    uint64_t v5 = *MEMORY[0x263F170F8];
    v13[0] = *MEMORY[0x263F170D0];
    v13[1] = v5;
    v14[0] = *MEMORY[0x263F170D8];
    v14[1] = v3;
    v13[2] = *MEMORY[0x263F17598];
    v14[2] = MEMORY[0x263EFFA88];
    CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    id v7 = objc_alloc_init(MEMORY[0x263EFF8F8]);

    uint64_t v8 = SecKeyCreateWithData((CFDataRef)v7, v6, &error);
    if (!v8)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __35__POSecKeyHelper_systemKeyForData___block_invoke;
      v11[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v11[4] = error;
      id v9 = __35__POSecKeyHelper_systemKeyForData___block_invoke((uint64_t)v11);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __35__POSecKeyHelper_systemKeyForData___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecKeyCreateWithData for system key."];

  id v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (__SecKey)ephemeralKeyForData:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  CFDataRef v3 = (const __CFData *)a3;
  CFDataRef v4 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[POSecKeyHelper ephemeralKeyForData:]();
  }

  if (v3)
  {
    CFErrorRef error = 0;
    uint64_t v5 = *MEMORY[0x263F16F68];
    v13[0] = *MEMORY[0x263F16FA8];
    v13[1] = v5;
    uint64_t v6 = *MEMORY[0x263F16F70];
    v14[0] = *MEMORY[0x263F16FB8];
    v14[1] = v6;
    CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    uint64_t v8 = SecKeyCreateWithData(v3, v7, &error);
    if (!v8)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __38__POSecKeyHelper_ephemeralKeyForData___block_invoke;
      v11[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v11[4] = error;
      id v9 = __38__POSecKeyHelper_ephemeralKeyForData___block_invoke((uint64_t)v11);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __38__POSecKeyHelper_ephemeralKeyForData___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecKeyCreateWithData for ephemeral key."];

  CFDataRef v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (__SecKey)ephemeralPublicKeyForData:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  CFDataRef v3 = (const __CFData *)a3;
  CFDataRef v4 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[POSecKeyHelper ephemeralPublicKeyForData:]();
  }

  if (v3)
  {
    CFErrorRef error = 0;
    uint64_t v5 = *MEMORY[0x263F16F68];
    v13[0] = *MEMORY[0x263F16FA8];
    v13[1] = v5;
    uint64_t v6 = *MEMORY[0x263F16F80];
    v14[0] = *MEMORY[0x263F16FB8];
    v14[1] = v6;
    CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    uint64_t v8 = SecKeyCreateWithData(v3, v7, &error);
    if (!v8)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __44__POSecKeyHelper_ephemeralPublicKeyForData___block_invoke;
      v11[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v11[4] = error;
      id v9 = __44__POSecKeyHelper_ephemeralPublicKeyForData___block_invoke((uint64_t)v11);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __44__POSecKeyHelper_ephemeralPublicKeyForData___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecKeyCreateWithData for ephemeral public key."];

  CFDataRef v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (__SecKey)ephemeralX25529PublicKeyForData:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  CFDataRef v3 = (const __CFData *)a3;
  CFDataRef v4 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[POSecKeyHelper ephemeralX25529PublicKeyForData:]();
  }

  if (v3)
  {
    CFErrorRef error = 0;
    uint64_t v5 = *MEMORY[0x263F16F68];
    v13[0] = *MEMORY[0x263F16FA8];
    v13[1] = v5;
    uint64_t v6 = *MEMORY[0x263F16F80];
    v14[0] = *MEMORY[0x263F16FF8];
    v14[1] = v6;
    CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    uint64_t v8 = SecKeyCreateWithData(v3, v7, &error);
    if (!v8)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __50__POSecKeyHelper_ephemeralX25529PublicKeyForData___block_invoke;
      v11[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v11[4] = error;
      id v9 = __50__POSecKeyHelper_ephemeralX25529PublicKeyForData___block_invoke((uint64_t)v11);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __50__POSecKeyHelper_ephemeralX25529PublicKeyForData___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecKeyCreateWithData for ephemeral public key."];

  CFDataRef v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (id)dataForCertificate:(__SecCertificate *)a3
{
  if (a3)
  {
    CFDataRef v4 = SecCertificateCopyData(a3);
  }
  else
  {
    CFDataRef v4 = 0;
  }
  return v4;
}

+ (__SecCertificate)certificateForData:(id)a3
{
  result = 0;
  if (a3) {
    return SecCertificateCreateWithData(0, (CFDataRef)a3);
  }
  return result;
}

+ (__SecIdentity)identityForKey:(__SecKey *)a3 andCertificate:(__SecCertificate *)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  uint64_t v6 = SecCFAllocatorZeroize();
  return (__SecIdentity *)MEMORY[0x270EFD958](v6, a4, a3);
}

+ (BOOL)evaluateTrustForCertificates:(id)a3 rootCertificates:(id)a4
{
  id v5 = a3;
  CFArrayRef v6 = (const __CFArray *)a4;
  CFArrayRef v7 = v6;
  SecTrustRef trust = 0;
  if (!v5 || ![(__CFArray *)v6 count]) {
    goto LABEL_13;
  }
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  OSStatus v9 = SecTrustCreateWithCertificates(v5, BasicX509, &trust);
  if (BasicX509) {
    CFRelease(BasicX509);
  }
  if (v9)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke;
    v25[3] = &__block_descriptor_36_e14___NSError_8__0l;
    OSStatus v26 = v9;
    id v10 = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke((uint64_t)v25);
LABEL_13:
    BOOL v15 = 0;
    goto LABEL_14;
  }
  OSStatus v11 = SecTrustSetAnchorCertificates(trust, v7);
  if (v11)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_70;
    v23[3] = &__block_descriptor_36_e14___NSError_8__0l;
    OSStatus v24 = v11;
    id v12 = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_70((uint64_t)v23);
    goto LABEL_11;
  }
  OSStatus v13 = SecTrustSetAnchorCertificatesOnly(trust, 1u);
  if (v13)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_74;
    v21[3] = &__block_descriptor_36_e14___NSError_8__0l;
    OSStatus v22 = v13;
    id v14 = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_74((uint64_t)v21);
LABEL_11:
    if (trust) {
      CFRelease(trust);
    }
    goto LABEL_13;
  }
  CFErrorRef error = 0;
  BOOL v17 = SecTrustEvaluateWithError(trust, &error);
  if (v17)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_78;
    void v19[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v19[4] = error;
    id v18 = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_78((uint64_t)v19);
  }
  if (trust)
  {
    CFRelease(trust);
    SecTrustRef trust = 0;
  }
  BOOL v15 = !v17;
LABEL_14:

  return v15;
}

id __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke(uint64_t a1)
{
  v2 = +[POError errorWithCode:-1001 description:@"Error with SecTrustCreateWithCertificates."];
  uint64_t v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);
  }

  return v2;
}

id __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_70(uint64_t a1)
{
  v2 = +[POError errorWithCode:-1001 description:@"Error with SecTrustSetAnchorCertificates."];
  uint64_t v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);
  }

  return v2;
}

id __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_74(uint64_t a1)
{
  v2 = +[POError errorWithCode:-1001 description:@"Error with SecTrustSetAnchorCertificatesOnly."];
  uint64_t v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);
  }

  return v2;
}

id __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_78(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with SecTrustEvaluateWithError."];

  uint64_t v3 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

+ (BOOL)isSEPKey:(__SecKey *)a3
{
  if (!a3) {
    return 0;
  }
  CFDictionaryRef v3 = SecKeyCopyAttributes(a3);
  CFDataRef v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x263F170D0]];
  if ([v4 isEqualToString:*MEMORY[0x263F170D8]]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:*MEMORY[0x263F170E8]];
  }

  return v5;
}

+ (BOOL)isEncryptionAlgorithm:(id)a3 validForKey:(__SecKey *)a4
{
  id v5 = a3;
  CFDictionaryRef v6 = SecKeyCopyAttributes(a4);
  CFArrayRef v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x263F16FA8]];
  uint64_t v8 = [(__CFDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x263F16F98]];
  if ([v7 isEqualToString:*MEMORY[0x263F16FB0]])
  {
    [v7 isEqualToString:*MEMORY[0x263F16FF8]];
LABEL_4:
    int v11 = [v8 intValue];
    if (v11 == 384)
    {
LABEL_8:
      id v12 = &POEncryptionAlgorithmHPKE_P384_SHA384_AES_GCM_256;
      goto LABEL_11;
    }
    if (v11 == 256)
    {
      if (([v5 isEqualToNumber:0x2707DBB50] & 1) != 0
        || ([v5 isEqualToNumber:0x2707DBB68] & 1) != 0)
      {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
LABEL_13:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  int v9 = [v7 isEqualToString:*MEMORY[0x263F16FB8]];
  int v10 = [v7 isEqualToString:*MEMORY[0x263F16FF8]];
  if (v9) {
    goto LABEL_4;
  }
  if (!v10) {
    goto LABEL_13;
  }
  id v12 = &POEncryptionAlgorithmHPKE_Curve25519_SHA256_ChachaPoly;
LABEL_11:
  if (([v5 isEqualToNumber:*v12] & 1) == 0) {
    goto LABEL_13;
  }
LABEL_12:
  BOOL v13 = 1;
LABEL_14:

  return v13;
}

+ (BOOL)_verifyCurve25519SigningKey:(__SecKey *)a3
{
  CFDataRef v4 = objc_alloc_init(_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519);
  LOBYTE(a3) = [(POCryptoKitAlgorithmCurve25519 *)v4 verifyKey:a3];

  return (char)a3;
}

+ (BOOL)_verifyCurve25519EncryptionKey:(__SecKey *)a3
{
  CFDataRef v4 = objc_alloc_init(_TtC15PlatformSSOCore18POCurve25519Verify);
  LOBYTE(a3) = [(POCurve25519Verify *)v4 verifyKey:a3];

  return (char)a3;
}

+ (BOOL)verifyKey:(__SecKey *)a3
{
  CFDictionaryRef v3 = a3;
  if (a3)
  {
    CFDictionaryRef v5 = SecKeyCopyAttributes(a3);
    CFDictionaryRef v6 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x263F16FA8]];
    CFArrayRef v7 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x263F16F98]];
    if ([v6 isEqualToString:*MEMORY[0x263F16FB0]]) {
      int v8 = 1;
    }
    else {
      int v8 = [v6 isEqualToString:*MEMORY[0x263F16FB8]];
    }
    int v9 = [v6 isEqualToString:*MEMORY[0x263F16FF8]];
    int v10 = [v6 isEqualToString:*MEMORY[0x263F16FD0]];
    if (v8)
    {
      int v11 = [v7 intValue];
      if (v11 == 256)
      {
        id v12 = (const __CFString **)MEMORY[0x263F172C0];
        goto LABEL_20;
      }
      if (v11 == 384)
      {
        id v12 = (const __CFString **)MEMORY[0x263F172C8];
LABEL_20:
        CFStringRef v14 = *v12;
        BOOL v15 = [MEMORY[0x263F08C38] UUID];
        uint64_t v16 = [v15 UUIDString];
        CFDataRef v13 = [v16 dataUsingEncoding:4];

        *(void *)buf = 0;
        CFDataRef Signature = SecKeyCreateSignature(v3, v14, v13, (CFErrorRef *)buf);
        if (Signature)
        {
          id v18 = PO_LOG_POSecKeyHelper();
          LOBYTE(v3) = 1;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v25 = 0;
            _os_log_impl(&dword_259DFE000, v18, OS_LOG_TYPE_INFO, "key is valid", v25, 2u);
          }
        }
        else
        {
          id v18 = *(NSObject **)buf;
          uint64_t v19 = [*(id *)buf code];
          LOBYTE(v3) = v19 == -1004;
          if (v19 == -1004)
          {
            id v21 = PO_LOG_POSecKeyHelper();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v25 = 0;
              _os_log_impl(&dword_259DFE000, v21, OS_LOG_TYPE_INFO, "key is valid", v25, 2u);
            }
          }
          else
          {
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __28__POSecKeyHelper_verifyKey___block_invoke;
            v23[3] = &unk_265463860;
            OSStatus v24 = v18;
            id v20 = __28__POSecKeyHelper_verifyKey___block_invoke((uint64_t)v23);
            id v21 = v24;
          }
        }
        goto LABEL_29;
      }
LABEL_18:
      LOBYTE(v3) = 0;
LABEL_30:

      return (char)v3;
    }
    if (v10)
    {
      if (![a1 _verifyCurve25519SigningKey:v3]) {
        goto LABEL_18;
      }
      PO_LOG_POSecKeyHelper();
      CFDataRef v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = 1;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
LABEL_17:
        _os_log_impl(&dword_259DFE000, (os_log_t)v13, OS_LOG_TYPE_INFO, "key is valid", buf, 2u);
      }
    }
    else
    {
      if (!v9 || ![a1 _verifyCurve25519EncryptionKey:v3]) {
        goto LABEL_18;
      }
      PO_LOG_POSecKeyHelper();
      CFDataRef v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = 1;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        goto LABEL_17;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  return (char)v3;
}

id __28__POSecKeyHelper_verifyKey___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1008 underlyingError:*(void *)(a1 + 32) description:@"Failed to validate key"];
  v2 = PO_LOG_POSecKeyHelper();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

+ (id)printKey:(__SecKey *)a3
{
  CFErrorRef error = 0;
  CFDataRef v4 = SecKeyCopyExternalRepresentation(a3, &error);
  CFDataRef v5 = v4;
  if (v4)
  {
    CFDictionaryRef v6 = -[__CFData subdataWithRange:](v4, "subdataWithRange:", 1, 32);
    CFArrayRef v7 = -[__CFData subdataWithRange:](v5, "subdataWithRange:", 33, 32);
    if ([(__CFData *)v5 length] == 97)
    {
      int v8 = -[__CFData subdataWithRange:](v5, "subdataWithRange:", 65, 32);
    }
    else
    {
      int v8 = 0;
    }
    int v10 = objc_opt_new();
    [v10 setObject:@"EC" forKeyedSubscript:@"kty"];
    [v10 setObject:@"P-256" forKeyedSubscript:@"crv"];
    int v11 = objc_msgSend(v6, "psso_base64URLEncodedString");
    [v10 setObject:v11 forKeyedSubscript:@"x"];

    id v12 = objc_msgSend(v7, "psso_base64URLEncodedString");
    [v10 setObject:v12 forKeyedSubscript:@"y"];

    if (v8)
    {
      CFDataRef v13 = objc_msgSend(v8, "psso_base64URLEncodedString");
      [v10 setObject:v13 forKeyedSubscript:@"d"];
    }
    CFStringRef v14 = SecKeyCopyPublicKey(a3);
    CFDataRef v15 = SecKeyCopyExternalRepresentation(v14, 0);
    if (v14) {
      CFRelease(v14);
    }
    uint64_t v16 = [(__CFData *)v15 psso_sha256Hash];
    BOOL v17 = [v16 base64EncodedStringWithOptions:0];
    [v10 setObject:v17 forKeyedSubscript:@"kid"];

    uint64_t v20 = 0;
    id v18 = [MEMORY[0x263F08900] dataWithJSONObject:v10 options:1 error:&v20];
    int v9 = (void *)[[NSString alloc] initWithData:v18 encoding:4];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

+ (void)keyForData:context:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

+ (void)systemKeyForData:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

+ (void)ephemeralKeyForData:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

+ (void)ephemeralPublicKeyForData:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

+ (void)ephemeralX25529PublicKeyForData:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

@end