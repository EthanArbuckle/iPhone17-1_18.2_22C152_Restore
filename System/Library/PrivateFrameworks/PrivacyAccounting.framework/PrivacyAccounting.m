id logger()
{
  void *v0;
  uint64_t vars8;

  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global_248);
  }
  v0 = (void *)logger_log;

  return v0;
}

id logger_0()
{
  if (logger_onceToken_0 != -1) {
    dispatch_once(&logger_onceToken_0, &__block_literal_global_210);
  }
  v0 = (void *)logger_log_0;

  return v0;
}

id logger_1()
{
  if (logger_onceToken_1 != -1) {
    dispatch_once(&logger_onceToken_1, &__block_literal_global_128);
  }
  v0 = (void *)logger_log_1;

  return v0;
}

id logger_2()
{
  if (logger_onceToken_2 != -1) {
    dispatch_once(&logger_onceToken_2, &__block_literal_global_94);
  }
  v0 = (void *)logger_log_2;

  return v0;
}

void sub_1A8FA7274()
{
  id v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    unsigned int greenTeaDeviceCapability = MobileGestalt_get_greenTeaDeviceCapability();

    qword_1EB2BA1D0 = greenTeaDeviceCapability;
  }
  else
  {
    __break(1u);
  }
}

void sub_1A8FA7DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A8FA803C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8FA80C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A8FA81F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A8FA89C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1A8FA8E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8FA91A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1A8FA9490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_1A8FA9794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void PARegisterUserInfoValueProviderForPAErrorDomain()
{
  if (PARegisterUserInfoValueProviderForPAErrorDomain_registerOnce != -1) {
    dispatch_once(&PARegisterUserInfoValueProviderForPAErrorDomain_registerOnce, &__block_literal_global_9);
  }
}

void sub_1A8FA9CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1A8FAA2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A8FAAE94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __PARegisterUserInfoValueProviderForPAErrorDomain_block_invoke()
{
  return [MEMORY[0x1E4F28C58] setUserInfoValueProviderForDomain:@"PAErrorDomain" provider:&__block_literal_global_19];
}

uint64_t __logger_block_invoke()
{
  logger_log = (uint64_t)os_log_create("com.apple.PrivacyAccounting", "PATCCAccess");

  return MEMORY[0x1F41817F8]();
}

uint64_t __logger_block_invoke_0()
{
  logger_log_0 = (uint64_t)os_log_create("com.apple.PrivacyAccounting", "PAAccessReader");

  return MEMORY[0x1F41817F8]();
}

uint64_t __logger_block_invoke_1()
{
  logger_log_1 = (uint64_t)os_log_create("com.apple.PrivacyAccounting", "PACoalescingIntervalTracker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __logger_block_invoke_2()
{
  logger_log_2 = (uint64_t)os_log_create("com.apple.PrivacyAccounting", "PALSUtils");

  return MEMORY[0x1F41817F8]();
}

void sub_1A8FAC078(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A8FAC220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

PAProcessStateMonitor *PASharedProcessStateMonitor()
{
  return +[PAProcessStateMonitor sharedInstance];
}

void sub_1A8FAD28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A8FAD438(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A8FAF398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PAImplicitClientIdentityForEntitlementDictionary(void *a1, void *a2)
{
  return implicitIdentityForEntitlementDictionary(a1, a2, 0);
}

id implicitIdentityForEntitlementDictionary(void *a1, void *a2, char *a3)
{
  id v5 = a1;
  id v6 = a2;
  v7 = [v5 objectForKeyedSubscript:@"com.apple.private.attribution.app-store-app.usage-reporting-only.implicitly-assumed-identity"];

  if (v7)
  {
    id v8 = [v5 objectForKeyedSubscript:@"com.apple.private.attribution.app-store-app.usage-reporting-only.implicitly-assumed-identity"];
    id v9 = v6;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 hasPrefix:@"/"];
        [v8 UTF8String];
        v14 = (void *)tcc_identity_create();
LABEL_14:

LABEL_15:
        char v15 = 1;
        if (!a3) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      v12 = logger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        implicitIdentityForEntitlementDictionary_cold_1();
      }
    }
    v14 = 0;
    goto LABEL_14;
  }
  v10 = [v5 objectForKeyedSubscript:@"com.apple.private.attribution.usage-reporting-only.implicitly-assumed-identity"];

  if (v10)
  {
    v11 = @"com.apple.private.attribution.usage-reporting-only.implicitly-assumed-identity";
LABEL_13:
    id v8 = [v5 objectForKeyedSubscript:v11];
    v14 = implicitIdentityEntryToTCCIdentity(v8, v6);
    goto LABEL_15;
  }
  v13 = [v5 objectForKeyedSubscript:@"com.apple.private.attribution.implicitly-assumed-identity"];

  if (v13)
  {
    v11 = @"com.apple.private.attribution.implicitly-assumed-identity";
    goto LABEL_13;
  }
  char v15 = 0;
  v14 = 0;
  if (a3) {
LABEL_16:
  }
    *a3 = v15;
LABEL_17:

  return v14;
}

id PAImplicitClientIdentityForBundle(void *a1)
{
  id v1 = a1;
  v2 = [v1 infoDictionary];
  uint64_t v3 = [v1 bundlePath];

  v4 = implicitIdentityForEntitlementDictionary(v2, v3, 0);

  return v4;
}

BOOL PAEntitlementDictionaryBelongsToSystemProcess(void *a1)
{
  id v1 = implicitIdentityForEntitlementDictionary(a1, @"<anonymous entitlement dictionary>", 0);
  if (v1) {
    BOOL v2 = tcc_identity_get_type() != 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

BOOL PABundleRecordBelongsToSystemProcess(void *a1)
{
  id v1 = [a1 entitlements];
  BOOL v2 = [v1 objectForKey:@"com.apple.private.attribution.implicitly-assumed-identity" ofClass:objc_opt_class()];

  if (v2) {
    BOOL v3 = tcc_identity_get_type() != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

id PAAuthenticatedClientIdentity(_OWORD *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v3 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v3;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v5 = a2;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    v7 = v6;
    *(void *)token.val = @"com.apple.private.attribution.explicitly-assumed-identities";
    *(void *)&token.val[2] = @"com.apple.private.attribution.implicitly-assumed-identity";
    *(void *)&token.val[4] = @"com.apple.private.attribution.usage-reporting-only.implicitly-assumed-identity";
    *(void *)&token.val[6] = @"com.apple.private.attribution.app-store-app.usage-reporting-only.implicitly-assumed-identity";
    CFArrayRef v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&token count:4];
    CFErrorRef error = 0;
    CFDictionaryRef v9 = SecTaskCopyValuesForEntitlements(v7, v8, &error);
    v10 = error;
    v11 = v10;
    if (v9) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (!v12)
    {
      v13 = logger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        PAAuthenticatedClientIdentity_cold_1((uint64_t)v11, v13);
      }
    }
    CFRelease(v7);
  }
  else
  {
    logger();
    CFArrayRef v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl(&dword_1A8FA5000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Failed to create SecTaskRef for audit token", (uint8_t *)&token, 2u);
    }
    CFDictionaryRef v9 = 0;
  }

  v14 = [PALazyAuditTokenBasedClientIdentity alloc];
  long long v15 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v15;
  v16 = [(PALazyAuditTokenBasedClientIdentity *)v14 initWithAuditToken:&token];
  v17 = PAAuthenticatedClientIdentityWithClientProperties(v9, v16, v5);

  return v17;
}

id PAAuthenticatedClientIdentityWithClientProperties(void *a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  char v49 = 0;
  CFArrayRef v8 = implicitIdentityForEntitlementDictionary(v5, v6, &v49);
  CFDictionaryRef v9 = v8;
  if (v49) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    goto LABEL_36;
  }
  if (!v8)
  {
    if (v7)
    {
LABEL_14:
      long long v15 = [v5 objectForKeyedSubscript:@"com.apple.private.attribution.explicitly-assumed-identities"];
      id v48 = v7;
      id v16 = v15;
      id v46 = v6;
      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          obj = v16;
          uint64_t v47 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
          if (v47)
          {
            id v42 = v6;
            id v41 = v16;
            id v43 = v7;
            id v44 = v5;
            uint64_t v17 = *(void *)v51;
            v18 = v46;
            while (2)
            {
              for (uint64_t i = 0; i != v47; ++i)
              {
                if (*(void *)v51 != v17) {
                  objc_enumerationMutation(obj);
                }
                v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                id v21 = v48;
                id v22 = v20;
                id v23 = v18;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v24 = v17;
                  v25 = [v22 objectForKeyedSubscript:@"type"];
                  v26 = [v22 objectForKeyedSubscript:@"value"];
                  unint64_t type = tcc_identity_get_type();
                  unint64_t v28 = type;
                  if (type >= 4)
                  {
                    v31 = logger();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                    {
                      int buf = 134217984;
                      unint64_t v56 = v28;
                      _os_log_fault_impl(&dword_1A8FA5000, v31, OS_LOG_TYPE_FAULT, "Unexpected tcc_identity_type_t: %llu", (uint8_t *)&buf, 0xCu);
                    }

                    v29 = 0;
                  }
                  else
                  {
                    v29 = off_1E5D70FA0[type];
                  }
                  if ([v25 isEqual:v29])
                  {
                    v32 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
                    char v33 = [v26 isEqual:v32];

                    if (v33)
                    {

LABEL_51:
                      id v36 = v21;
                      id v7 = v43;
                      id v5 = v44;
                      id v6 = v42;
                      goto LABEL_39;
                    }
                  }
                  char v34 = [v25 isEqual:@"wildcard"];

                  v18 = v46;
                  uint64_t v17 = v24;
                  if (v34) {
                    goto LABEL_51;
                  }
                }
                else
                {
                  v30 = logger();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                  {
                    int buf = 138543618;
                    unint64_t v56 = (unint64_t)v18;
                    __int16 v57 = 2114;
                    id v58 = v22;
                    _os_log_fault_impl(&dword_1A8FA5000, v30, OS_LOG_TYPE_FAULT, "BUG IN %{public}@! They have a malformed explicitly assumed identity entitlement. Each entry should be a dictionary describing an identity, but we got %{public}@", (uint8_t *)&buf, 0x16u);
                  }
                }
              }
              uint64_t v47 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
              if (v47) {
                continue;
              }
              break;
            }
            id v7 = v43;
            id v5 = v44;
            id v16 = v41;
            id v6 = v42;
          }
        }
        else
        {
          obj = logger();
          if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
            PAAuthenticatedClientIdentityWithClientProperties_cold_2();
          }
        }
      }
      v38 = [v46 identity];
      int v39 = areTCCIdentitiesEqual(v48, v38);

      if (v39)
      {
        v35 = v46;
      }
      else
      {
        v40 = logger();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
          PAAuthenticatedClientIdentityWithClientProperties_cold_1();
        }

        v35 = v46;
      }
      goto LABEL_37;
    }
LABEL_36:
    v35 = v6;
LABEL_37:
    id v14 = [v35 identity];
    goto LABEL_38;
  }
  if (v7 && !areTCCIdentitiesEqual(v8, v7))
  {
    v11 = [v5 objectForKeyedSubscript:@"com.apple.private.attribution.permit-mixed-identities"];
    char v12 = [v11 isEqual:MEMORY[0x1E4F1CC38]];

    if ((v12 & 1) == 0)
    {
      v13 = logger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        PAAuthenticatedClientIdentityWithClientProperties_cold_3();
      }

      goto LABEL_12;
    }
    goto LABEL_14;
  }
LABEL_12:
  id v14 = v9;
LABEL_38:
  id v36 = v14;
LABEL_39:

  return v36;
}

uint64_t areTCCIdentitiesEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 == v4) {
    goto LABEL_9;
  }
  if ((v3 == 0) == (v4 != 0)) {
    goto LABEL_8;
  }
  uint64_t type = tcc_identity_get_type();
  if (type != tcc_identity_get_type()) {
    goto LABEL_8;
  }
  id v7 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
  CFArrayRef v8 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
  int v9 = [v7 isEqual:v8];

  if (!v9 || (verifier_uint64_t type = tcc_identity_get_verifier_type(), verifier_type != tcc_identity_get_verifier_type()))
  {
LABEL_8:
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  if (!verifier_type)
  {
LABEL_9:
    uint64_t v13 = 1;
    goto LABEL_10;
  }
  v11 = [NSString stringWithUTF8String:tcc_identity_get_verifier_code_requirement_string()];
  char v12 = [NSString stringWithUTF8String:tcc_identity_get_verifier_code_requirement_string()];
  uint64_t v13 = [v11 isEqual:v12];

LABEL_10:
  return v13;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __lookupTCCIdentity_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    id v7 = logger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __lookupTCCIdentity_block_invoke_cold_1(a3, v7);
    }
  }
}

id implicitIdentityEntryToTCCIdentity(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    CFArrayRef v8 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = logger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      implicitIdentityEntryToTCCIdentity_cold_3();
    }
    CFArrayRef v8 = 0;
    goto LABEL_19;
  }
  id v5 = [v3 objectForKeyedSubscript:@"type"];
  if (tccIdentityTypeForIdentityTypeString_once != -1) {
    dispatch_once(&tccIdentityTypeForIdentityTypeString_once, &__block_literal_global_239);
  }
  id v6 = [(id)tccIdentityTypeForIdentityTypeString_mapping objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = logger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      implicitIdentityEntryToTCCIdentity_cold_1((uint64_t)v4, v3);
    }
    goto LABEL_17;
  }
  [v6 intValue];
  id v7 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v9 = logger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      implicitIdentityEntryToTCCIdentity_cold_2();
    }

LABEL_17:
    CFArrayRef v8 = 0;
    goto LABEL_18;
  }
  id v7 = v7;
  [v7 UTF8String];
  CFArrayRef v8 = (void *)tcc_identity_create();
LABEL_18:

LABEL_19:
LABEL_20:

  return v8;
}

void __tccIdentityTypeForIdentityTypeString_block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"bundleID";
  v2[1] = @"path";
  v3[0] = &unk_1EFF81098;
  v3[1] = &unk_1EFF810B0;
  v2[2] = @"hostedUUID";
  v2[3] = @"fileProviderID";
  v3[2] = &unk_1EFF810C8;
  v3[3] = &unk_1EFF810E0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  id v1 = (void *)tccIdentityTypeForIdentityTypeString_mapping;
  tccIdentityTypeForIdentityTypeString_mapping = v0;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

BOOL PAPBReplayKitAccessReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(PAPBAccess);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (PAPBAccessReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = objc_alloc_init(PAPBApplication);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (PAPBApplicationReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1A8FB18F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 16);
}

void sub_1A8FB1A40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A8FB1F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A8FB2448(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A8FB32D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A8FB350C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A8FB37CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1A8FB3B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1A8FB3B94(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL writeBytesToStream(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  id v7 = a1;
  if (a3)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 512;
    uint64_t v10 = a3;
    while (1)
    {
      uint64_t v11 = [v7 write:a2 + v8 maxLength:v10];
      if (v11 < 0) {
        break;
      }
      if (!v11)
      {
        uint64_t v9 = 640;
        break;
      }
      v10 -= v11;
      if (v10)
      {
        v8 += v11;
        if (v8 < a3) {
          continue;
        }
      }
      goto LABEL_7;
    }
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:v9 userInfo:0];
    BOOL v12 = v13 != 0;
    if (a4 && v13)
    {
      id v13 = v13;
      *a4 = v13;
      BOOL v12 = 1;
    }
  }
  else
  {
LABEL_7:
    BOOL v12 = 0;
    id v13 = 0;
  }
  BOOL v14 = !v12;

  return v14;
}

BOOL PAPBTCCAccessReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(PAPBAccess);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (PAPBAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v17 = *(PAPBAccess **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PAPBAccessReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = objc_alloc_init(PAPBApplication);
          objc_storeStrong((id *)(a1 + 24), v18);
          if PBReaderPlaceMark() && (PAPBApplicationReadFrom((uint64_t)v18, a2))
          {
            PBReaderRecallMark();
            goto LABEL_37;
          }

          return 0;
        case 2u:
          uint64_t v20 = PBReaderReadData();
          id v21 = *(void **)(a1 + 40);
          *(void *)(a1 + 40) = v20;

          continue;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 52) |= 4u;
          while (2)
          {
            uint64_t v25 = *v3;
            uint64_t v26 = *(void *)(a2 + v25);
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
              *(void *)(a2 + v25) = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                BOOL v15 = v23++ >= 9;
                if (v15)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_48;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v24) = 0;
          }
LABEL_48:
          uint64_t v38 = 48;
          goto LABEL_53;
        case 4u:
          *(unsigned char *)(a1 + 52) |= 1u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v31 = 0;
          }
          *(void *)(a1 + 8) = v31;
          continue;
        case 5u:
          PBReaderReadData();
          uint64_t v18 = (PAPBApplication *)objc_claimAutoreleasedReturnValue();
          if (v18) {
            [(id)a1 addAssetIdentifiers:v18];
          }
LABEL_37:

          continue;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 52) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v3;
        uint64_t v35 = *(void *)(a2 + v34);
        unint64_t v36 = v35 + 1;
        if (v35 == -1 || v36 > *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
        *(void *)(a2 + v34) = v36;
        v24 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_50;
        }
        v32 += 7;
        BOOL v15 = v33++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_52;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v24) = 0;
      }
LABEL_52:
      uint64_t v38 = 16;
LABEL_53:
      *(_DWORD *)(a1 + v38) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A8FB5D78(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A8FB5EB8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t PABundleRecordIsVisibleApplication(void *a1)
{
  id v1 = a1;
  if ([v1 conformsToProtocol:&unk_1EFF86FB0]) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 appTags];
    if ([v5 containsObject:@"hidden"])
    {
      uint64_t v6 = 0;
    }
    else
    {
      id v7 = [v4 bundleIdentifier];
      uint64_t v6 = [v7 isEqualToString:@"com.apple.springboard"] ^ 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id PAAssociatedBundleIdentifiersForApplication(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __PAAssociatedBundleIdentifiersForApplication_block_invoke;
    aBlock[3] = &unk_1E5D712D8;
    id v3 = v2;
    id v19 = v3;
    uint64_t v4 = (void (**)(void *, void *))_Block_copy(aBlock);
    id v5 = [v1 bundleIdentifier];
    v4[2](v4, v5);

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = objc_msgSend(v1, "applicationExtensionRecords", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) bundleIdentifier];
          v4[2](v4, v11);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v8);
    }

    id v12 = v3;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v12;
}

uint64_t __PAAssociatedBundleIdentifiersForApplication_block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

id PADefaultBundleRecordRetriever()
{
  if (PADefaultBundleRecordRetriever_once != -1) {
    dispatch_once(&PADefaultBundleRecordRetriever_once, &__block_literal_global_6);
  }
  uint64_t v0 = _Block_copy((const void *)PADefaultBundleRecordRetriever_result);

  return v0;
}

uint64_t __PADefaultBundleRecordRetriever_block_invoke()
{
  PADefaultBundleRecordRetriever_uint64_t result = [&__block_literal_global_91 copy];

  return MEMORY[0x1F41817F8]();
}

id __PADefaultBundleRecordRetriever_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 identifierType];
  if (v3 == 2)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F223F8];
    if (v2) {
      [v2 auditToken];
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    id v11 = 0;
    uint64_t v6 = [v8 bundleRecordForAuditToken:v12 error:&v11];
    uint64_t v7 = v11;
    if (v6) {
      goto LABEL_15;
    }
  }
  else
  {
    if (v3)
    {
      uint64_t v7 = logger_2();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __PADefaultBundleRecordRetriever_block_invoke_2_cold_1((uint64_t)v2, v7);
      }
      goto LABEL_14;
    }
    uint64_t v4 = (void *)MEMORY[0x1E4F223F8];
    id v5 = [v2 bundleID];
    *(void *)&v12[0] = 0;
    uint64_t v6 = [v4 bundleRecordWithBundleIdentifier:v5 allowPlaceholder:0 error:v12];
    uint64_t v7 = *(id *)&v12[0];

    if (v6) {
      goto LABEL_15;
    }
  }
  uint64_t v9 = logger_2();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __PADefaultBundleRecordRetriever_block_invoke_2_cold_2((uint64_t)v2, (uint64_t)v7, v9);
  }

LABEL_14:
  uint64_t v6 = 0;
LABEL_15:

  return v6;
}

void sub_1A8FB72C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

id coalesceGroupedRecordsToRepublish(void *a1, char a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ((unint64_t)[v10 count] < 2)
        {
          uint64_t v18 = [v10 firstObject];
        }
        else
        {
          id v11 = [v10 lastObject];
          id v12 = [v11 access];

          if (a2)
          {
            unint64_t v13 = [v10 lastObject];
            [v13 startTime];
            double v15 = v14;

            long long v16 = [v10 valueForKeyPath:@"@max.endTime"];
            [v16 doubleValue];
          }
          else
          {
            id v19 = [v10 valueForKeyPath:@"@min.startTime"];
            [v19 doubleValue];
            double v15 = v20;

            long long v16 = [v10 lastObject];
            [v16 endTime];
          }
          double v21 = v17;

          uint64_t v18 = -[PACoalescedAccessRecord initWithAccess:startTime:endTime:count:]([PACoalescedAccessRecord alloc], "initWithAccess:startTime:endTime:count:", v12, [v10 count], v15, v21);
        }
        [v4 addObject:v18];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __coalesceGroupedRecordsToRepublish_block_invoke;
  v24[3] = &__block_descriptor_33_e59_q24__0__PACompleteAccessRecord_8__PACompleteAccessRecord_16l;
  char v25 = a2;
  [v4 sortUsingComparator:v24];
  char v22 = (void *)[v4 copy];

  return v22;
}

uint64_t __coalesceGroupedRecordsToRepublish_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 32))
  {
    [v5 startTime];
    double v8 = v7;
    [v6 startTime];
    if (v8 >= v9)
    {
      [v5 startTime];
      double v15 = v14;
      [v6 startTime];
      if (v15 <= v16) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = -1;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    [v5 endTime];
    double v12 = v11;
    [v6 endTime];
    if (v12 >= v13)
    {
      [v5 endTime];
      double v18 = v17;
      [v6 endTime];
      uint64_t v10 = v18 > v19;
    }
    else
    {
      uint64_t v10 = -1;
    }
  }

  return v10;
}

uint64_t PAPBOutOfProcessPickerAccessReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        double v17 = objc_alloc_init(PAPBAccess);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (PAPBAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PAPBLocationAccessReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        double v17 = objc_alloc_init(PAPBAccess);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (PAPBAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *PAApplicationIdentifierTypeToString(unint64_t a1)
{
  if (a1 > 4) {
    return @"unknown";
  }
  else {
    return off_1E5D71588[a1];
  }
}

uint64_t PAPBApplicationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PAErrorBoolValueForUserInfoKey(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 userInfo];
  id v5 = [v4 objectForKeyedSubscript:v3];

  if (_NSIsNSNumber()) {
    uint64_t v6 = [v5 BOOLValue];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t sub_1A8FBC0DC()
{
  if (qword_1EB2BA0E8 != -1) {
    swift_once();
  }
  return qword_1EB2BA1D0;
}

id _PALoggingOptions.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id _PALoggingOptions.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PALoggingOptions();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for _PALoggingOptions()
{
  return self;
}

id _PALoggingOptions.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PALoggingOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for _PALoggingOptions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for _PALoggingOptions);
}

uint64_t dispatch thunk of static _PALoggingOptions.defaultLoggingOptions.getter()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

void type metadata accessor for PAAccessCategory()
{
  if (!qword_1E97AEBC0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E97AEBC0);
    }
  }
}

uint64_t sub_1A8FBC2AC(uint64_t a1, uint64_t a2)
{
  return sub_1A8FBC58C(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1A8FBC2C4(uint64_t a1, id *a2)
{
  uint64_t result = sub_1A8FC75C8();
  *a2 = 0;
  return result;
}

uint64_t sub_1A8FBC33C(uint64_t a1, id *a2)
{
  char v3 = sub_1A8FC75D8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1A8FBC3BC@<X0>(uint64_t *a1@<X8>)
{
  sub_1A8FC75E8();
  uint64_t v2 = sub_1A8FC75B8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A8FBC400@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1A8FC75B8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A8FBC448@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A8FC75E8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A8FBC474(uint64_t a1)
{
  uint64_t v2 = sub_1A8FBC758(&qword_1E97AEBE0);
  uint64_t v3 = sub_1A8FBC758(&qword_1E97AEBE8);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1A8FBC50C()
{
  return sub_1A8FBC758(&qword_1E97AEBC8);
}

uint64_t sub_1A8FBC540()
{
  return sub_1A8FBC758(&qword_1E97AEBD0);
}

uint64_t sub_1A8FBC574(uint64_t a1, uint64_t a2)
{
  return sub_1A8FBC58C(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1A8FBC58C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1A8FC75E8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1A8FBC5D0()
{
  sub_1A8FC75E8();
  sub_1A8FC75F8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A8FBC624()
{
  sub_1A8FC75E8();
  sub_1A8FC7768();
  sub_1A8FC75F8();
  uint64_t v0 = sub_1A8FC7788();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A8FBC698()
{
  uint64_t v0 = sub_1A8FC75E8();
  uint64_t v2 = v1;
  if (v0 == sub_1A8FC75E8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1A8FC7748();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1A8FBC724()
{
  return sub_1A8FBC758(&qword_1E97AEBD8);
}

uint64_t sub_1A8FBC758(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PAAccessCategory();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A8FBC79C()
{
  return 65259;
}

id InitialSwift.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id InitialSwift.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InitialSwift();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for InitialSwift()
{
  return self;
}

id InitialSwift.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InitialSwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for InitialSwift(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InitialSwift);
}

uint64_t dispatch thunk of static InitialSwift.functionalFunction()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t AccessHistory.makeIterator()@<X0>(uint64_t *a1@<X8>)
{
  v7[0] = *v1;
  v7[1] = 0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEBF0);
  unint64_t v4 = sub_1A8FBC9AC();
  a1[3] = v3;
  a1[4] = v4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v3 - 8) + 32))(boxed_opaque_existential_1, v7, v3);
  return swift_bridgeObjectRetain();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1A8FBC9AC()
{
  unint64_t result = qword_1E97AEBF8;
  if (!qword_1E97AEBF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E97AEBF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97AEBF8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1A8FBCA50@<X0>(uint64_t *a1@<X8>)
{
  AccessHistory.makeIterator()(a1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A8FBCA7C()
{
  return 0;
}

uint64_t sub_1A8FBCA84()
{
  return 2;
}

uint64_t sub_1A8FBCA8C()
{
  uint64_t v0 = sub_1A8FC3DCC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A8FBCACC()
{
  return sub_1A8FC7618();
}

uint64_t static AccessHistory<>.forReport.getter@<X0>(void *a1@<X8>)
{
  id v44 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEC00);
  uint64_t v3 = MEMORY[0x1F4188790](v1, v2);
  char v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3, v6);
  char v8 = (char *)&v38 - v7;
  uint64_t v9 = sub_1A8FC7548();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v9, v11);
  BOOL v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12, v15);
  char v17 = (char *)&v38 - v16;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEC08);
  uint64_t v19 = MEMORY[0x1F4188790](v45, v18);
  id v46 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19, v21);
  uint64_t v47 = (uint64_t)&v38 - v22;
  sub_1A8FC74F8();
  sub_1A8FC7508();
  sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
  id v43 = v14;
  uint64_t result = sub_1A8FC75A8();
  if (result)
  {
    uint64_t v24 = *(int *)(v1 + 48);
    char v25 = v8;
    int v39 = v8;
    uint64_t v40 = v10;
    long long v26 = &v8[v24];
    uint64_t v42 = v1;
    uint64_t v27 = v10;
    uint64_t v28 = v1;
    long long v29 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v29(v25, v17, v9);
    unint64_t v30 = v26;
    id v41 = v26;
    v29(v26, v43, v9);
    uint64_t v31 = &v5[*(int *)(v28 + 48)];
    char v32 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
    unsigned int v33 = v39;
    v32(v5, v39, v9);
    v32(v31, v30, v9);
    uint64_t v34 = (uint64_t)v46;
    v29(v46, v5, v9);
    uint64_t v35 = *(void (**)(char *, uint64_t))(v40 + 8);
    v35(v31, v9);
    unint64_t v36 = &v5[*(int *)(v42 + 48)];
    v29(v5, v33, v9);
    v29(v36, v41, v9);
    v29((char *)(v34 + *(int *)(v45 + 36)), v36, v9);
    v35(v5, v9);
    uint64_t v37 = v47;
    sub_1A8FC654C(v34, v47, &qword_1E97AEC08);
    static AccessHistory<>.forReport(in:)(v37, v44);
    return sub_1A8FC65B0(v37, &qword_1E97AEC08);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static AccessHistory<>.forReport(in:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v13[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEC08);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8FC6720(a1, (uint64_t)v7, &qword_1E97AEC08);
  id v8 = objc_msgSend(self, sel_sharedInstance);
  v13[0] = 0;
  id v9 = objc_msgSend(v8, sel_publisherForReportWithError_, v13);

  if (v9)
  {
    id v10 = v13[0];
    return sub_1A8FBD00C((uint64_t)v7, v9, a2);
  }
  else
  {
    id v12 = v13[0];
    sub_1A8FC65B0((uint64_t)v7, &qword_1E97AEC08);
    sub_1A8FC74D8();

    return swift_willThrow();
  }
}

uint64_t sub_1A8FBD00C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEDF0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  id v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AccessRecord(0);
  uint64_t v45 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9, v10);
  uint64_t v46 = (uint64_t)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v13);
  uint64_t v44 = (uint64_t)&v39 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEC08);
  MEMORY[0x1F4188790](v15 - 8, v16);
  uint64_t v41 = (uint64_t)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = MEMORY[0x1E4FBC860];
  long long v52 = (uint64_t (*)(uint64_t))nullsub_1;
  uint64_t v53 = 0;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v49 = 1107296256;
  long long v50 = sub_1A8FBEB9C;
  long long v51 = &block_descriptor;
  uint64_t v19 = _Block_copy(&aBlock);
  long long v52 = sub_1A8FC67E4;
  uint64_t v53 = v18;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v49 = 1107296256;
  long long v50 = sub_1A8FBECA4;
  long long v51 = &block_descriptor_13;
  uint64_t v20 = _Block_copy(&aBlock);
  id v21 = a2;
  swift_retain();
  swift_release();
  id v22 = objc_msgSend(v21, sel_sinkWithCompletion_shouldContinue_, v19, v20);

  _Block_release(v20);
  _Block_release(v19);

  swift_beginAccess();
  unint64_t v23 = *(void *)(v18 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1A8FC7708();
  }
  else
  {
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  id v43 = a3;
  id v40 = v21;
  if (!v24)
  {
    uint64_t v27 = (void *)MEMORY[0x1E4FBC860];
LABEL_18:
    swift_bridgeObjectRelease_n();
    uint64_t v34 = v41;
    uint64_t v33 = v42;
    uint64_t v35 = sub_1A8FC6720(v42, v41, &qword_1E97AEC08);
    MEMORY[0x1F4188790](v35, v36);
    *(&v39 - 2) = v34;
    uint64_t v47 = (void *)sub_1A8FBE378((uint64_t (*)(char *))sub_1A8FC67EC, (uint64_t)(&v39 - 4), (uint64_t)v27);
    swift_bridgeObjectRetain();
    sub_1A8FBFCE8(&v47);
    swift_bridgeObjectRelease();
    uint64_t v37 = v47;
    sub_1A8FC65B0(v34, &qword_1E97AEC08);

    uint64_t result = sub_1A8FC65B0(v33, &qword_1E97AEC08);
    *id v43 = v37;
    return result;
  }
  if (v24 >= 1)
  {
    uint64_t v25 = 0;
    long long v26 = (unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
    uint64_t v27 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v28 = v9;
    do
    {
      if ((v23 & 0xC000000000000001) != 0) {
        long long v29 = (void *)MEMORY[0x1AD0EA720](v25, v23);
      }
      else {
        long long v29 = (void *)swift_unknownObjectRetain();
      }
      sub_1A8FBD550(v29, (uint64_t)v8);
      if ((*v26)(v8, 1, v9) == 1)
      {
        sub_1A8FC65B0((uint64_t)v8, &qword_1E97AEDF0);
      }
      else
      {
        uint64_t v30 = v44;
        sub_1A8FC660C((uint64_t)v8, v44);
        sub_1A8FC660C(v30, v46);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v27 = (void *)sub_1A8FBF920(0, v27[2] + 1, 1, v27);
        }
        unint64_t v32 = v27[2];
        unint64_t v31 = v27[3];
        if (v32 >= v31 >> 1) {
          uint64_t v27 = (void *)sub_1A8FBF920(v31 > 1, v32 + 1, 1, v27);
        }
        v27[2] = v32 + 1;
        sub_1A8FC660C(v46, (uint64_t)v27+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v32);
        uint64_t v9 = v28;
      }
      ++v25;
    }
    while (v24 != v25);
    goto LABEL_18;
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1A8FBD550@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A8FC7578();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  id v8 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AccessRecord(0);
  uint64_t v48 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v10);
  uint64_t v12 = (void *)((char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  self;
  uint64_t v13 = (void *)swift_dynamicCastObjCClass();
  uint64_t v47 = a2;
  if (v13)
  {
    uint64_t v14 = v13;
    objc_msgSend(v13, sel_startTime);
    double v16 = v15;
    objc_msgSend(v14, sel_endTime);
    if (v16 == v17)
    {
      objc_msgSend(v14, sel_startTime);
    }
    else
    {
      objc_msgSend(v14, sel_endTime);
      double v20 = v19;
      objc_msgSend(v14, sel_startTime);
      if (v20 - v21 >= 60.0)
      {
        id v22 = (char *)v12 + *(int *)(v9 + 28);
        v46[1] = &v22[*(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20) + 48)];
        objc_msgSend(v14, sel_startTime);
        sub_1A8FC74E8();
        objc_msgSend(v14, sel_endTime);
        sub_1A8FC74E8();
        type metadata accessor for AccessRecord.Timing(0);
        goto LABEL_9;
      }
      objc_msgSend(v14, sel_endTime);
    }
    sub_1A8FC74E8();
    type metadata accessor for AccessRecord.Timing(0);
LABEL_9:
    swift_storeEnumTagMultiPayload();
    id v23 = objc_msgSend(a1, sel_access);
    id v24 = objc_msgSend(v23, sel_identifier);

    sub_1A8FC7568();
    uint64_t v25 = sub_1A8FC7558();
    uint64_t v27 = v26;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t *v12 = v25;
    v12[1] = v27;
    id v28 = objc_msgSend(a1, sel_access);
    id v29 = objc_msgSend(v28, sel_accessor);

    id v30 = objc_msgSend(v29, sel_bundleID);
    uint64_t v31 = sub_1A8FC75E8();
    uint64_t v33 = v32;

    _OWORD v12[2] = v31;
    v12[3] = v33;
    id v34 = objc_msgSend(a1, sel_access);
    id v35 = objc_msgSend(v34, sel_category);

    v12[4] = (uint64_t)v35;
    id v36 = objc_msgSend(a1, sel_access);
    id v37 = objc_msgSend(v36, sel_accessCount);

    if (v37)
    {
      id v38 = objc_msgSend(a1, sel_access);
      id v39 = objc_msgSend(v38, sel_accessCount);
    }
    else
    {
      id v39 = 0;
    }
    swift_unknownObjectRelease();
    id v40 = (char *)v12 + *(int *)(v9 + 32);
    *(void *)id v40 = v39;
    v40[8] = v37 == 0;
    uint64_t v41 = v47;
    sub_1A8FC660C((uint64_t)v12, v47);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v41, 0, 1, v9);
  }
  self;
  uint64_t v18 = (void *)swift_dynamicCastObjCClass();
  if (v18)
  {
    objc_msgSend(v18, sel_startTime);
    sub_1A8FC74E8();
    type metadata accessor for AccessRecord.Timing(0);
    goto LABEL_9;
  }
  self;
  id v43 = (void *)swift_dynamicCastObjCClass();
  if (v43)
  {
    objc_msgSend(v43, sel_endTime);
    sub_1A8FC74E8();
    type metadata accessor for AccessRecord.Timing(0);
    goto LABEL_9;
  }
  self;
  uint64_t v44 = swift_dynamicCastObjCClass();
  uint64_t result = swift_unknownObjectRelease();
  if (v44)
  {
    __break(1u);
  }
  else
  {
    uint64_t v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56);
    return v45(a2, 1, 1, v9);
  }
  return result;
}

uint64_t sub_1A8FBDA90(uint64_t a1, uint64_t a2)
{
  uint64_t v73 = a2;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEC08);
  uint64_t v4 = MEMORY[0x1F4188790](v70, v3);
  uint64_t v68 = (uint64_t)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v4, v6);
  uint64_t v74 = (uint64_t)&v67 - v8;
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v72 = (uint64_t)&v67 - v10;
  uint64_t v11 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1F4188790](v11, v12);
  uint64_t v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEDE0);
  uint64_t v17 = MEMORY[0x1F4188790](v15 - 8, v16);
  double v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17, v20);
  id v22 = (char *)&v67 - v21;
  uint64_t v23 = sub_1A8FC7548();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v26 = MEMORY[0x1F4188790](v23, v25);
  v69 = (char *)&v67 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x1F4188790](v26, v28);
  v76 = (char *)&v67 - v30;
  uint64_t v32 = MEMORY[0x1F4188790](v29, v31);
  v71 = (char *)&v67 - v33;
  uint64_t v35 = MEMORY[0x1F4188790](v32, v34);
  v78 = (char *)&v67 - v36;
  uint64_t v38 = MEMORY[0x1F4188790](v35, v37);
  id v40 = (char *)&v67 - v39;
  MEMORY[0x1F4188790](v38, v41);
  v77 = (char *)&v67 - v42;
  uint64_t v43 = type metadata accessor for AccessRecord(0);
  sub_1A8FC6670(a1 + *(int *)(v43 + 28), (uint64_t)v14, type metadata accessor for AccessRecord.Timing);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    v67 = &v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20) + 48)];
    uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v44(v40, v14, v23);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v67, v23);
  }
  else
  {
    uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v44(v40, v14, v23);
  }
  v44(v22, v40, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v22, 0, 1, v23);
  uint64_t v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v45(v22, 1, v23) == 1)
  {
    sub_1A8FC74F8();
    sub_1A8FC65B0((uint64_t)v22, &qword_1E97AEDE0);
  }
  else
  {
    v44(v77, v22, v23);
  }
  sub_1A8FBE14C(v19);
  unsigned int v46 = v45(v19, 1, v23);
  uint64_t v75 = v24;
  if (v46 == 1)
  {
    sub_1A8FC7508();
    sub_1A8FC65B0((uint64_t)v19, &qword_1E97AEDE0);
  }
  else
  {
    v44(v78, v19, v23);
  }
  uint64_t v47 = v73;
  uint64_t v48 = sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
  uint64_t v49 = v77;
  char v50 = sub_1A8FC7598();
  long long v51 = *(void (**)(char *, char *, uint64_t))(v75 + 16);
  long long v52 = v71;
  v51(v71, v49, v23);
  uint64_t v53 = v72;
  sub_1A8FC6720(v47, v72, &qword_1E97AEC08);
  uint64_t v73 = v48;
  if (v50) {
    char v54 = sub_1A8FC75A8();
  }
  else {
    char v54 = 0;
  }
  sub_1A8FC65B0(v53, &qword_1E97AEC08);
  v55 = *(void (**)(char *, uint64_t))(v75 + 8);
  v55(v52, v23);
  uint64_t v56 = v47;
  uint64_t v57 = v74;
  sub_1A8FC6720(v56, v74, &qword_1E97AEC08);
  id v58 = v76;
  v51(v76, v78, v23);
  if (v54)
  {
    char v59 = 1;
  }
  else
  {
    char v60 = sub_1A8FC7598();
    v61 = v58;
    char v62 = v60;
    v63 = v69;
    v51(v69, v61, v23);
    uint64_t v64 = v68;
    sub_1A8FC6720(v57, v68, &qword_1E97AEC08);
    if (v62)
    {
      char v65 = sub_1A8FC75A8();
      v63 = v69;
      char v59 = v65;
    }
    else
    {
      char v59 = 0;
    }
    sub_1A8FC65B0(v64, &qword_1E97AEC08);
    v55(v63, v23);
  }
  v55(v76, v23);
  sub_1A8FC65B0(v57, &qword_1E97AEC08);
  v55(v78, v23);
  v55(v77, v23);
  return v59 & 1;
}

uint64_t sub_1A8FBE14C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1F4188790](v4, v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A8FC7548();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8FC6670(v2, (uint64_t)v7, type metadata accessor for AccessRecord.Timing);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, 1, 1, v8);
      return sub_1A8FC64EC((uint64_t)v7, type metadata accessor for AccessRecord.Timing);
    }
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v15(v12, &v7[*(int *)(v16 + 48)], v8);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  else
  {
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v15(v12, v7, v8);
  }
  v15(a1, v12, v8);
  return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
}

uint64_t sub_1A8FBE378(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for AccessRecord(0);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v25 = (uint64_t)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v9, v11);
  uint64_t v14 = (char *)v22 - v13;
  uint64_t v15 = MEMORY[0x1E4FBC860];
  uint64_t v27 = MEMORY[0x1E4FBC860];
  uint64_t v24 = *(void *)(a3 + 16);
  if (v24)
  {
    unint64_t v16 = 0;
    uint64_t v17 = MEMORY[0x1E4FBC860];
    v22[1] = a2;
    uint64_t v23 = a3;
    v22[0] = a1;
    while (v16 < *(void *)(a3 + 16))
    {
      unint64_t v18 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
      uint64_t v15 = *(void *)(v26 + 72);
      sub_1A8FC6670(a3 + v18 + v15 * v16, (uint64_t)v14, type metadata accessor for AccessRecord);
      char v19 = a1(v14);
      if (v3)
      {
        sub_1A8FC64EC((uint64_t)v14, type metadata accessor for AccessRecord);
        swift_release();
        swift_bridgeObjectRelease();
        return v15;
      }
      if (v19)
      {
        sub_1A8FC660C((uint64_t)v14, v25);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1A8FBFAF4(0, *(void *)(v17 + 16) + 1, 1);
        }
        uint64_t v17 = v27;
        unint64_t v21 = *(void *)(v27 + 16);
        unint64_t v20 = *(void *)(v27 + 24);
        if (v21 >= v20 >> 1)
        {
          sub_1A8FBFAF4(v20 > 1, v21 + 1, 1);
          uint64_t v17 = v27;
        }
        *(void *)(v17 + 16) = v21 + 1;
        uint64_t result = sub_1A8FC660C(v25, v17 + v18 + v21 * v15);
        a3 = v23;
        a1 = (uint64_t (*)(char *))v22[0];
      }
      else
      {
        uint64_t result = sub_1A8FC64EC((uint64_t)v14, type metadata accessor for AccessRecord);
      }
      if (v24 == ++v16)
      {
        uint64_t v15 = v27;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t AccessIterator.next()()
{
  __swift_mutable_project_boxed_opaque_existential_1(v0, *(void *)(v0 + 24));
  return sub_1A8FC7688();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t AccessRecord.identifier.getter()
{
  return sub_1A8FC7698();
}

uint64_t AccessRecord.accessorID.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t AccessRecord.AccessorID.hash(into:)()
{
  sub_1A8FC7778();

  return sub_1A8FC75F8();
}

uint64_t static AccessRecord.AccessorID.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1A8FC7748();
  }
}

uint64_t AccessRecord.AccessorID.hashValue.getter()
{
  return sub_1A8FC7788();
}

uint64_t sub_1A8FBE7C8()
{
  return sub_1A8FC7788();
}

uint64_t sub_1A8FBE828()
{
  sub_1A8FC7778();

  return sub_1A8FC75F8();
}

uint64_t sub_1A8FBE87C()
{
  return sub_1A8FC7788();
}

uint64_t sub_1A8FBE8D8(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1A8FC7748();
  }
}

id AccessRecord.category.getter()
{
  return *(id *)(v0 + 32);
}

uint64_t AccessRecord.timing.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AccessRecord(0);
  return sub_1A8FC6670(v1 + *(int *)(v3 + 28), a1, type metadata accessor for AccessRecord.Timing);
}

uint64_t type metadata accessor for AccessRecord(uint64_t a1)
{
  return sub_1A8FC6424(a1, qword_1E97AED30);
}

uint64_t type metadata accessor for AccessRecord.Timing(uint64_t a1)
{
  return sub_1A8FC6424(a1, qword_1E97AED48);
}

uint64_t AccessRecord.accessCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AccessRecord(0) + 32));
}

uint64_t PAAccessReader._accessRecordsForReport(from:to:)(uint64_t a1, uint64_t a2)
{
  return sub_1A8FC3DD0(a1, a2);
}

void sub_1A8FBEB9C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1A8FBEC04(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x1AD0EA6A0](v3);
  if (*(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_1A8FC7658();
  sub_1A8FC7678();
  sub_1A8FC7648();
  swift_endAccess();
  return 1;
}

uint64_t sub_1A8FBECA4(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t sub_1A8FBEF88@<X0>(char *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1F4188790](v3, v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A8FC7548();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v1
      + OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record;
  uint64_t v13 = type metadata accessor for AccessRecord(0);
  sub_1A8FC6670(v12 + *(int *)(v13 + 28), (uint64_t)v6, type metadata accessor for AccessRecord.Timing);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    uint64_t v15 = &v6[*(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20) + 48)];
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v14(v11, v6, v7);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v14(v11, v6, v7);
  }
  v14(a1, v11, v7);
  return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
}

id sub_1A8FBF1A4(void *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEDE0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a1;
  a3();

  uint64_t v10 = sub_1A8FC7548();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    uint64_t v12 = (void *)sub_1A8FC7518();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }

  return v12;
}

uint64_t sub_1A8FBF2D0@<X0>(char *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1F4188790](v3, v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A8FC7548();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v1
      + OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record;
  uint64_t v13 = type metadata accessor for AccessRecord(0);
  sub_1A8FC6670(v12 + *(int *)(v13 + 28), (uint64_t)v6, type metadata accessor for AccessRecord.Timing);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, 1, 1, v7);
      return sub_1A8FC64EC((uint64_t)v6, type metadata accessor for AccessRecord.Timing);
    }
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
    unint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v16(v11, &v6[*(int *)(v17 + 48)], v7);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    unint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v16(v11, v6, v7);
  }
  v16(a1, v11, v7);
  return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
}

id sub_1A8FBF5B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s18AccessRecordObjectCMa(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1A8FBF628(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEE08);
  uint64_t v2 = sub_1A8FC7718();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1A8FC6720(v6, (uint64_t)&v15, &qword_1E97AEE10);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1A8FBF760(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1A8FC6784(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1A8FBF760(uint64_t a1, uint64_t a2)
{
  sub_1A8FC7768();
  sub_1A8FC75F8();
  uint64_t v4 = sub_1A8FC7788();

  return sub_1A8FBF7D8(a1, a2, v4);
}

unint64_t sub_1A8FBF7D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1A8FC7748() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1A8FC7748() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_1A8FC7748()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

size_t sub_1A8FBF920(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    BOOL v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEE18);
  uint64_t v10 = *(void *)(type metadata accessor for AccessRecord(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  BOOL v13 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  id v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for AccessRecord(0) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

size_t sub_1A8FBFAF4(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_1A8FBFB14(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_1A8FBFB14(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    BOOL v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEE18);
  uint64_t v10 = *(void *)(type metadata accessor for AccessRecord(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  BOOL v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  id v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for AccessRecord(0) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_1A8FBFCE8(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for AccessRecord(0) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_1A8FC37F4(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_1A8FBFD90(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_1A8FBFD90(uint64_t *a1)
{
  uint64_t v340 = type metadata accessor for AccessRecord.Timing(0);
  uint64_t v3 = MEMORY[0x1F4188790](v340, v2);
  uint64_t v332 = (uint64_t)&v283 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v3, v5);
  uint64_t v336 = (uint64_t)&v283 - v7;
  uint64_t v9 = MEMORY[0x1F4188790](v6, v8);
  uint64_t v308 = (uint64_t)&v283 - v10;
  uint64_t v12 = MEMORY[0x1F4188790](v9, v11);
  uint64_t v311 = (uint64_t)&v283 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12, v14);
  uint64_t v289 = (uint64_t)&v283 - v16;
  MEMORY[0x1F4188790](v15, v17);
  uint64_t v295 = (uint64_t)&v283 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEDE0);
  uint64_t v21 = MEMORY[0x1F4188790](v19 - 8, v20);
  v319 = (char *)&v283 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x1F4188790](v21, v23);
  v321 = (char *)&v283 - v25;
  uint64_t v27 = MEMORY[0x1F4188790](v24, v26);
  uint64_t v29 = (char *)&v283 - v28;
  uint64_t v31 = MEMORY[0x1F4188790](v27, v30);
  v301 = (char *)&v283 - v32;
  uint64_t v34 = MEMORY[0x1F4188790](v31, v33);
  uint64_t v36 = (char *)&v283 - v35;
  uint64_t v38 = MEMORY[0x1F4188790](v34, v37);
  id v40 = (char *)&v283 - v39;
  uint64_t v42 = MEMORY[0x1F4188790](v38, v41);
  v288 = (char *)&v283 - v43;
  uint64_t v45 = MEMORY[0x1F4188790](v42, v44);
  v291 = (char *)&v283 - v46;
  MEMORY[0x1F4188790](v45, v47);
  uint64_t v292 = (uint64_t)&v283 - v48;
  uint64_t v327 = sub_1A8FC7548();
  unint64_t v341 = *(void *)(v327 - 8);
  uint64_t v50 = MEMORY[0x1F4188790](v327, v49);
  v318 = (char *)&v283 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = MEMORY[0x1F4188790](v50, v52);
  v316 = (char *)&v283 - v54;
  uint64_t v56 = MEMORY[0x1F4188790](v53, v55);
  v323 = (char *)&v283 - v57;
  uint64_t v59 = MEMORY[0x1F4188790](v56, v58);
  v331 = (char *)&v283 - v60;
  uint64_t v62 = MEMORY[0x1F4188790](v59, v61);
  uint64_t v64 = (char *)&v283 - v63;
  uint64_t v66 = MEMORY[0x1F4188790](v62, v65);
  v296 = (char *)&v283 - v67;
  uint64_t v69 = MEMORY[0x1F4188790](v66, v68);
  v71 = (char *)&v283 - v70;
  uint64_t v73 = MEMORY[0x1F4188790](v69, v72);
  v307 = (char *)&v283 - v74;
  uint64_t v76 = MEMORY[0x1F4188790](v73, v75);
  v78 = (char *)&v283 - v77;
  uint64_t v80 = MEMORY[0x1F4188790](v76, v79);
  v287 = (char *)&v283 - v81;
  uint64_t v83 = MEMORY[0x1F4188790](v80, v82);
  v85 = (char *)&v283 - v84;
  MEMORY[0x1F4188790](v83, v86);
  v290 = (char *)&v283 - v87;
  uint64_t v328 = type metadata accessor for AccessRecord(0);
  uint64_t v313 = *(void *)(v328 - 8);
  uint64_t v89 = MEMORY[0x1F4188790](v328, v88);
  uint64_t v306 = (uint64_t)&v283 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = MEMORY[0x1F4188790](v89, v91);
  uint64_t v330 = (uint64_t)&v283 - v93;
  uint64_t v95 = MEMORY[0x1F4188790](v92, v94);
  uint64_t v335 = (uint64_t)&v283 - v96;
  uint64_t v98 = MEMORY[0x1F4188790](v95, v97);
  uint64_t v342 = (uint64_t)&v283 - v99;
  uint64_t v101 = MEMORY[0x1F4188790](v98, v100);
  v299 = (char *)&v283 - v102;
  uint64_t v104 = MEMORY[0x1F4188790](v101, v103);
  uint64_t v314 = (uint64_t)&v283 - v105;
  uint64_t v107 = MEMORY[0x1F4188790](v104, v106);
  uint64_t v294 = (uint64_t)&v283 - v108;
  MEMORY[0x1F4188790](v107, v109);
  uint64_t v298 = (uint64_t)&v283 - v110;
  v111 = a1;
  uint64_t v112 = a1[1];
  uint64_t result = sub_1A8FC7738();
  if (result >= v112)
  {
    if ((v112 & 0x8000000000000000) == 0)
    {
      if (v112) {
        return sub_1A8FC1BD4(0, v112, 1, v111);
      }
      return result;
    }
    goto LABEL_194;
  }
  if (v112 >= 0) {
    uint64_t v114 = v112;
  }
  else {
    uint64_t v114 = v112 + 1;
  }
  if (v112 < -1) {
    goto LABEL_193;
  }
  v320 = v29;
  v297 = v36;
  v304 = v40;
  uint64_t v286 = result;
  v293 = v64;
  v302 = v71;
  v284 = v78;
  if (v112 > 1)
  {
    uint64_t v115 = v114 >> 1;
    uint64_t result = sub_1A8FC7668();
    *(void *)(result + 16) = v115;
    uint64_t v116 = *(unsigned __int8 *)(v313 + 80);
    uint64_t v285 = result;
    unint64_t v312 = result + ((v116 + 32) & ~v116);
    uint64_t v117 = v327;
LABEL_12:
    uint64_t v118 = 0;
    v329 = (void (**)(uint64_t, uint64_t))(v341 + 8);
    v337 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v341 + 56);
    v338 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v341 + 48);
    v119 = (char *)MEMORY[0x1E4FBC860];
    v341 += 32;
    uint64_t v317 = v341 & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    v120 = v111;
    v326 = v111;
    v310 = v85;
    uint64_t v121 = v112;
    while (1)
    {
      uint64_t v123 = v118 + 1;
      v305 = v119;
      uint64_t v309 = v118;
      uint64_t v325 = v121;
      if (v118 + 1 >= v121)
      {
        uint64_t v132 = v118 + 1;
        goto LABEL_105;
      }
      uint64_t v124 = *v120;
      uint64_t v125 = *(void *)(v313 + 72);
      sub_1A8FC6670(*v120 + v125 * v123, v298, type metadata accessor for AccessRecord);
      uint64_t v300 = v124;
      uint64_t v339 = v125;
      uint64_t v126 = v124 + v125 * v118;
      uint64_t v127 = v294;
      sub_1A8FC6670(v126, v294, type metadata accessor for AccessRecord);
      uint64_t v128 = *(int *)(v328 + 28);
      sub_1A8FC6670(v127 + v128, v295, type metadata accessor for AccessRecord.Timing);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload)
      {
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v130 = v117;
          v131 = v291;
          v333 = *v337;
          v333(v291, 1, 1, v130);
          sub_1A8FC64EC(v295, type metadata accessor for AccessRecord.Timing);
          goto LABEL_23;
        }
        uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
        uint64_t v135 = v295;
        v133 = *(void (**)(uint64_t, char *, uint64_t))v341;
        (*(void (**)(char *, uint64_t, uint64_t))v341)(v85, v295 + *(int *)(v134 + 48), v117);
        (*v329)(v135, v117);
      }
      else
      {
        v133 = *(void (**)(uint64_t, char *, uint64_t))v341;
        (*(void (**)(char *, uint64_t, uint64_t))v341)(v85, v295, v117);
      }
      uint64_t v130 = v117;
      v131 = v291;
      v133((uint64_t)v291, v85, v130);
      v333 = *v337;
      v333(v131, 0, 1, v130);
LABEL_23:
      uint64_t v136 = (uint64_t)v131;
      uint64_t v137 = v292;
      sub_1A8FC654C(v136, v292, &qword_1E97AEDE0);
      v334 = *v338;
      if (v334(v137, 1, v130) != 1)
      {
        uint64_t v138 = v298 + v128;
        v139 = *(void (**)(char *, uint64_t, uint64_t))v341;
        (*(void (**)(char *, uint64_t, uint64_t))v341)(v290, v137, v130);
        sub_1A8FC6670(v138, v289, type metadata accessor for AccessRecord.Timing);
        int v140 = swift_getEnumCaseMultiPayload();
        uint64_t v117 = v130;
        if (v140)
        {
          if (v140 == 1)
          {
            uint64_t v141 = (uint64_t)v288;
            v333(v288, 1, 1, v130);
            sub_1A8FC64EC(v289, type metadata accessor for AccessRecord.Timing);
            goto LABEL_31;
          }
          uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
          uint64_t v144 = v289;
          v142 = v284;
          v139(v284, v289 + *(int *)(v143 + 48), v117);
          (*v329)(v144, v117);
        }
        else
        {
          v142 = v284;
          v139(v284, v289, v117);
        }
        uint64_t v141 = (uint64_t)v288;
        v139(v288, (uint64_t)v142, v117);
        v333((char *)v141, 0, 1, v117);
LABEL_31:
        if (v334(v141, 1, v117) == 1)
        {
          sub_1A8FC65B0(v141, &qword_1E97AEDE0);
          (*v329)((uint64_t)v290, v117);
          LODWORD(v324) = 1;
        }
        else
        {
          v145 = v287;
          v139(v287, v141, v117);
          sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
          v146 = v290;
          int v147 = sub_1A8FC7588();
          uint64_t v117 = v327;
          LODWORD(v324) = v147 ^ 1;
          v148 = *v329;
          (*v329)((uint64_t)v145, v327);
          v148((uint64_t)v146, v117);
        }
        goto LABEL_34;
      }
      sub_1A8FC65B0(v137, &qword_1E97AEDE0);
      LODWORD(v324) = 0;
      uint64_t v117 = v130;
LABEL_34:
      uint64_t v149 = (uint64_t)v299;
      uint64_t v118 = v309;
      sub_1A8FC64EC(v294, type metadata accessor for AccessRecord);
      uint64_t result = sub_1A8FC64EC(v298, type metadata accessor for AccessRecord);
      uint64_t v132 = v118 + 2;
      uint64_t v150 = v325;
      if (v118 + 2 >= v325) {
        goto LABEL_57;
      }
      uint64_t v322 = v339 * v123;
      uint64_t v151 = v300;
      uint64_t v303 = v339 * v132;
      uint64_t v152 = (uint64_t)v297;
      while (1)
      {
        sub_1A8FC6670(v151 + v303, v314, type metadata accessor for AccessRecord);
        sub_1A8FC6670(v151 + v322, v149, type metadata accessor for AccessRecord);
        uint64_t v153 = *(int *)(v328 + 28);
        sub_1A8FC6670(v149 + v153, v311, type metadata accessor for AccessRecord.Timing);
        int v154 = swift_getEnumCaseMultiPayload();
        if (v154)
        {
          v155 = (void (**)(char *, uint64_t, uint64_t))v341;
          if (v154 == 1)
          {
            v333((char *)v152, 1, 1, v117);
            sub_1A8FC64EC(v311, type metadata accessor for AccessRecord.Timing);
            uint64_t v156 = v117;
            goto LABEL_42;
          }
          uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
          uint64_t v160 = v311;
          v157 = *v155;
          v158 = v302;
          v157(v302, v311 + *(int *)(v159 + 48), v117);
          uint64_t v161 = v160;
          uint64_t v152 = (uint64_t)v297;
          (*v329)(v161, v117);
        }
        else
        {
          v157 = *(void (**)(char *, uint64_t, uint64_t))v341;
          v158 = v302;
          (*(void (**)(char *, uint64_t, uint64_t))v341)(v302, v311, v117);
        }
        v157((char *)v152, (uint64_t)v158, v117);
        v333((char *)v152, 0, 1, v117);
        uint64_t v156 = v117;
        v155 = (void (**)(char *, uint64_t, uint64_t))v341;
LABEL_42:
        uint64_t v162 = (uint64_t)v304;
        sub_1A8FC654C(v152, (uint64_t)v304, &qword_1E97AEDE0);
        if (v334(v162, 1, v156) == 1)
        {
          sub_1A8FC65B0(v162, &qword_1E97AEDE0);
          int v163 = 0;
          uint64_t v117 = v156;
          goto LABEL_53;
        }
        uint64_t v164 = v314 + v153;
        v165 = *v155;
        v165(v307, v162, v156);
        sub_1A8FC6670(v164, v308, type metadata accessor for AccessRecord.Timing);
        int v166 = swift_getEnumCaseMultiPayload();
        uint64_t v117 = v156;
        if (v166)
        {
          if (v166 == 1)
          {
            uint64_t v167 = (uint64_t)v301;
            v333(v301, 1, 1, v156);
            sub_1A8FC64EC(v308, type metadata accessor for AccessRecord.Timing);
            goto LABEL_50;
          }
          uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
          uint64_t v170 = v308;
          v168 = v293;
          v165(v293, v308 + *(int *)(v169 + 48), v117);
          (*v329)(v170, v117);
        }
        else
        {
          v168 = v293;
          v165(v293, v308, v117);
        }
        uint64_t v167 = (uint64_t)v301;
        v165(v301, (uint64_t)v168, v117);
        v333((char *)v167, 0, 1, v117);
LABEL_50:
        if (v334(v167, 1, v117) == 1)
        {
          sub_1A8FC65B0(v167, &qword_1E97AEDE0);
          (*v329)((uint64_t)v307, v117);
          int v163 = 1;
        }
        else
        {
          v171 = v296;
          v165(v296, v167, v117);
          sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
          v172 = v307;
          int v173 = sub_1A8FC7588();
          uint64_t v117 = v327;
          int v163 = v173 ^ 1;
          v174 = *v329;
          (*v329)((uint64_t)v171, v327);
          v175 = v172;
          uint64_t v149 = (uint64_t)v299;
          v174((uint64_t)v175, v117);
        }
LABEL_53:
        v120 = v326;
        sub_1A8FC64EC(v149, type metadata accessor for AccessRecord);
        uint64_t result = sub_1A8FC64EC(v314, type metadata accessor for AccessRecord);
        if ((v324 ^ v163)) {
          break;
        }
        ++v132;
        v151 += v339;
        uint64_t v150 = v325;
        if (v325 == v132)
        {
          uint64_t v132 = v325;
          v85 = v310;
          uint64_t v118 = v309;
          goto LABEL_57;
        }
      }
      v85 = v310;
      uint64_t v118 = v309;
      uint64_t v150 = v325;
LABEL_57:
      if ((v324 & 1) == 0) {
        goto LABEL_70;
      }
      if (v132 < v118) {
        goto LABEL_195;
      }
      if (v118 >= v132)
      {
LABEL_70:
        v186 = v323;
        if (v132 >= v150) {
          goto LABEL_105;
        }
        goto LABEL_73;
      }
      uint64_t v176 = 0;
      uint64_t v177 = v339 * (v132 - 1);
      uint64_t v178 = v118;
      uint64_t v179 = v132 * v339;
      uint64_t v180 = v178;
      uint64_t v181 = v178 * v339;
      do
      {
        if (v180 != v132 + v176 - 1)
        {
          uint64_t v183 = v300;
          if (!v300) {
            goto LABEL_200;
          }
          uint64_t v184 = v132;
          unint64_t v185 = v300 + v181;
          v334 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))(v300 + v177);
          sub_1A8FC660C(v300 + v181, v306);
          if (v181 < v177 || v185 >= v183 + v179)
          {
            uint64_t v182 = (uint64_t)v334;
            swift_arrayInitWithTakeFrontToBack();
          }
          else
          {
            uint64_t v182 = (uint64_t)v334;
            if (v181 != v177) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          uint64_t result = sub_1A8FC660C(v306, v182);
          uint64_t v132 = v184;
        }
        ++v180;
        --v176;
        v177 -= v339;
        v179 -= v339;
        v181 += v339;
      }
      while (v180 < v132 + v176);
      v186 = v323;
      v85 = v310;
      uint64_t v118 = v309;
      v120 = v326;
      if (v132 >= v325) {
        goto LABEL_105;
      }
LABEL_73:
      if (__OFSUB__(v132, v118)) {
        goto LABEL_192;
      }
      if (v132 - v118 >= v286) {
        goto LABEL_105;
      }
      if (__OFADD__(v118, v286)) {
        goto LABEL_196;
      }
      uint64_t v187 = v325;
      if (v118 + v286 < v325) {
        uint64_t v187 = v118 + v286;
      }
      if (v187 < v118) {
        goto LABEL_197;
      }
      if (v132 == v187) {
        goto LABEL_105;
      }
      uint64_t v188 = *(void *)(v313 + 72);
      uint64_t v189 = v188 * (v132 - 1);
      uint64_t v322 = v188;
      uint64_t v339 = v132 * v188;
      uint64_t v303 = v187;
      while (2)
      {
        uint64_t v191 = 0;
        uint64_t v324 = v189;
        uint64_t v325 = v132;
        while (2)
        {
          uint64_t v192 = *v120;
          v334 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))(v339 + v191);
          sub_1A8FC6670(v339 + v191 + v192, v342, type metadata accessor for AccessRecord);
          v333 = (void (*)(char *, uint64_t, uint64_t, uint64_t))(v189 + v191);
          uint64_t v193 = v189 + v191 + v192;
          uint64_t v194 = v335;
          sub_1A8FC6670(v193, v335, type metadata accessor for AccessRecord);
          uint64_t v195 = *(int *)(v328 + 28);
          sub_1A8FC6670(v194 + v195, v336, type metadata accessor for AccessRecord.Timing);
          int v196 = swift_getEnumCaseMultiPayload();
          if (v196)
          {
            uint64_t v197 = (uint64_t)v321;
            if (v196 == 1)
            {
              v198 = *v337;
              (*v337)(v321, 1, 1, v117);
              sub_1A8FC64EC(v336, type metadata accessor for AccessRecord.Timing);
              goto LABEL_91;
            }
            uint64_t v200 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
            uint64_t v201 = v336;
            v199 = *(void (**)(uint64_t, char *, uint64_t))v341;
            (*(void (**)(char *, uint64_t, uint64_t))v341)(v186, v336 + *(int *)(v200 + 48), v117);
            (*v329)(v201, v117);
          }
          else
          {
            v199 = *(void (**)(uint64_t, char *, uint64_t))v341;
            (*(void (**)(char *, uint64_t, uint64_t))v341)(v186, v336, v117);
            uint64_t v197 = (uint64_t)v321;
          }
          v199(v197, v186, v117);
          v198 = *v337;
          (*v337)((char *)v197, 0, 1, v117);
LABEL_91:
          uint64_t v202 = v117;
          uint64_t v203 = (uint64_t)v320;
          sub_1A8FC654C(v197, (uint64_t)v320, &qword_1E97AEDE0);
          v204 = *v338;
          if ((*v338)(v203, 1, v202) == 1)
          {
            sub_1A8FC65B0(v203, &qword_1E97AEDE0);
            sub_1A8FC64EC(v335, type metadata accessor for AccessRecord);
            uint64_t result = sub_1A8FC64EC(v342, type metadata accessor for AccessRecord);
            uint64_t v190 = v325;
            v120 = v326;
            uint64_t v117 = v202;
            v186 = v323;
            uint64_t v189 = v324;
            goto LABEL_82;
          }
          uint64_t v205 = v342 + v195;
          v206 = *(void (**)(char *, uint64_t, uint64_t))v341;
          (*(void (**)(char *, uint64_t, uint64_t))v341)(v331, v203, v202);
          sub_1A8FC6670(v205, v332, type metadata accessor for AccessRecord.Timing);
          int v207 = swift_getEnumCaseMultiPayload();
          uint64_t v117 = v202;
          if (v207)
          {
            v208 = v318;
            if (v207 == 1)
            {
              uint64_t v209 = (uint64_t)v319;
              v198(v319, 1, 1, v117);
              sub_1A8FC64EC(v332, type metadata accessor for AccessRecord.Timing);
              goto LABEL_98;
            }
            uint64_t v210 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
            uint64_t v211 = v332;
            v206(v208, v332 + *(int *)(v210 + 48), v117);
            (*v329)(v211, v117);
          }
          else
          {
            v208 = v318;
            v206(v318, v332, v117);
          }
          uint64_t v209 = (uint64_t)v319;
          v206(v319, (uint64_t)v208, v117);
          v198((char *)v209, 0, 1, v117);
LABEL_98:
          if (v204(v209, 1, v117) == 1)
          {
            sub_1A8FC65B0(v209, &qword_1E97AEDE0);
            (*v329)((uint64_t)v331, v117);
            sub_1A8FC64EC(v335, type metadata accessor for AccessRecord);
            uint64_t result = sub_1A8FC64EC(v342, type metadata accessor for AccessRecord);
            v120 = v326;
            v186 = v323;
            uint64_t v189 = v324;
            goto LABEL_101;
          }
          v212 = v316;
          v206(v316, v209, v117);
          sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
          v213 = v331;
          char v214 = sub_1A8FC7588();
          uint64_t v117 = v327;
          char v215 = v214;
          v216 = *v329;
          (*v329)((uint64_t)v212, v327);
          v216((uint64_t)v213, v117);
          sub_1A8FC64EC(v335, type metadata accessor for AccessRecord);
          uint64_t result = sub_1A8FC64EC(v342, type metadata accessor for AccessRecord);
          v120 = v326;
          v186 = v323;
          uint64_t v189 = v324;
          if ((v215 & 1) == 0)
          {
LABEL_101:
            uint64_t v217 = *v120;
            if (!*v120) {
              goto LABEL_198;
            }
            uint64_t v218 = v217 + v189 + v191;
            sub_1A8FC660C(v217 + v339 + v191, v330);
            swift_arrayInitWithTakeFrontToBack();
            uint64_t result = sub_1A8FC660C(v330, v218);
            v191 -= v322;
            ++v118;
            uint64_t v190 = v325;
            if (v325 == v118) {
              goto LABEL_82;
            }
            continue;
          }
          break;
        }
        uint64_t v190 = v325;
LABEL_82:
        uint64_t v132 = v190 + 1;
        v189 += v322;
        v339 += v322;
        uint64_t v118 = v309;
        if (v132 != v303) {
          continue;
        }
        break;
      }
      uint64_t v132 = v303;
      v85 = v310;
LABEL_105:
      if (v132 < v118)
      {
LABEL_187:
        __break(1u);
LABEL_188:
        __break(1u);
LABEL_189:
        __break(1u);
LABEL_190:
        __break(1u);
LABEL_191:
        __break(1u);
LABEL_192:
        __break(1u);
LABEL_193:
        __break(1u);
LABEL_194:
        __break(1u);
LABEL_195:
        __break(1u);
LABEL_196:
        __break(1u);
LABEL_197:
        __break(1u);
LABEL_198:
        __break(1u);
LABEL_199:
        __break(1u);
LABEL_200:
        __break(1u);
LABEL_201:
        __break(1u);
        return result;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v325 = v132;
      if (result)
      {
        v119 = v305;
      }
      else
      {
        uint64_t result = (uint64_t)sub_1A8FC3600(0, *((void *)v305 + 2) + 1, 1, v305);
        v119 = (char *)result;
      }
      unint64_t v220 = *((void *)v119 + 2);
      unint64_t v219 = *((void *)v119 + 3);
      unint64_t v122 = v220 + 1;
      if (v220 >= v219 >> 1)
      {
        uint64_t result = (uint64_t)sub_1A8FC3600((char *)(v219 > 1), v220 + 1, 1, v119);
        v119 = (char *)result;
      }
      *((void *)v119 + 2) = v122;
      v221 = v119 + 32;
      v222 = &v119[16 * v220 + 32];
      uint64_t v223 = v325;
      *(void *)v222 = v118;
      *((void *)v222 + 1) = v223;
      if (v220)
      {
        while (1)
        {
          unint64_t v224 = v122 - 1;
          if (v122 >= 4)
          {
            v229 = &v221[16 * v122];
            uint64_t v230 = *((void *)v229 - 8);
            uint64_t v231 = *((void *)v229 - 7);
            BOOL v235 = __OFSUB__(v231, v230);
            uint64_t v232 = v231 - v230;
            if (v235) {
              goto LABEL_176;
            }
            uint64_t v234 = *((void *)v229 - 6);
            uint64_t v233 = *((void *)v229 - 5);
            BOOL v235 = __OFSUB__(v233, v234);
            uint64_t v227 = v233 - v234;
            char v228 = v235;
            if (v235) {
              goto LABEL_177;
            }
            unint64_t v236 = v122 - 2;
            v237 = &v221[16 * v122 - 32];
            uint64_t v239 = *(void *)v237;
            uint64_t v238 = *((void *)v237 + 1);
            BOOL v235 = __OFSUB__(v238, v239);
            uint64_t v240 = v238 - v239;
            if (v235) {
              goto LABEL_178;
            }
            BOOL v235 = __OFADD__(v227, v240);
            uint64_t v241 = v227 + v240;
            if (v235) {
              goto LABEL_180;
            }
            if (v241 >= v232)
            {
              v259 = &v221[16 * v224];
              uint64_t v261 = *(void *)v259;
              uint64_t v260 = *((void *)v259 + 1);
              BOOL v235 = __OFSUB__(v260, v261);
              uint64_t v262 = v260 - v261;
              if (v235) {
                goto LABEL_186;
              }
              BOOL v252 = v227 < v262;
              goto LABEL_142;
            }
          }
          else
          {
            if (v122 != 3)
            {
              uint64_t v253 = *((void *)v119 + 4);
              uint64_t v254 = *((void *)v119 + 5);
              BOOL v235 = __OFSUB__(v254, v253);
              uint64_t v246 = v254 - v253;
              char v247 = v235;
              goto LABEL_136;
            }
            uint64_t v226 = *((void *)v119 + 4);
            uint64_t v225 = *((void *)v119 + 5);
            BOOL v235 = __OFSUB__(v225, v226);
            uint64_t v227 = v225 - v226;
            char v228 = v235;
          }
          if (v228) {
            goto LABEL_179;
          }
          unint64_t v236 = v122 - 2;
          v242 = &v221[16 * v122 - 32];
          uint64_t v244 = *(void *)v242;
          uint64_t v243 = *((void *)v242 + 1);
          BOOL v245 = __OFSUB__(v243, v244);
          uint64_t v246 = v243 - v244;
          char v247 = v245;
          if (v245) {
            goto LABEL_181;
          }
          v248 = &v221[16 * v224];
          uint64_t v250 = *(void *)v248;
          uint64_t v249 = *((void *)v248 + 1);
          BOOL v235 = __OFSUB__(v249, v250);
          uint64_t v251 = v249 - v250;
          if (v235) {
            goto LABEL_183;
          }
          if (__OFADD__(v246, v251)) {
            goto LABEL_185;
          }
          if (v246 + v251 >= v227)
          {
            BOOL v252 = v227 < v251;
LABEL_142:
            if (v252) {
              unint64_t v224 = v236;
            }
            goto LABEL_144;
          }
LABEL_136:
          if (v247) {
            goto LABEL_182;
          }
          v255 = &v221[16 * v224];
          uint64_t v257 = *(void *)v255;
          uint64_t v256 = *((void *)v255 + 1);
          BOOL v235 = __OFSUB__(v256, v257);
          uint64_t v258 = v256 - v257;
          if (v235) {
            goto LABEL_184;
          }
          if (v258 < v246) {
            goto LABEL_14;
          }
LABEL_144:
          unint64_t v263 = v224 - 1;
          if (v224 - 1 >= v122)
          {
            __break(1u);
LABEL_173:
            __break(1u);
LABEL_174:
            __break(1u);
LABEL_175:
            __break(1u);
LABEL_176:
            __break(1u);
LABEL_177:
            __break(1u);
LABEL_178:
            __break(1u);
LABEL_179:
            __break(1u);
LABEL_180:
            __break(1u);
LABEL_181:
            __break(1u);
LABEL_182:
            __break(1u);
LABEL_183:
            __break(1u);
LABEL_184:
            __break(1u);
LABEL_185:
            __break(1u);
LABEL_186:
            __break(1u);
            goto LABEL_187;
          }
          uint64_t v264 = *v120;
          if (!*v120) {
            goto LABEL_199;
          }
          v265 = v119;
          v266 = &v221[16 * v263];
          uint64_t v267 = *(void *)v266;
          v268 = v221;
          unint64_t v269 = v224;
          v270 = &v221[16 * v224];
          uint64_t v271 = *((void *)v270 + 1);
          uint64_t v272 = v315;
          uint64_t result = sub_1A8FC24DC(v264 + *(void *)(v313 + 72) * *(void *)v266, v264 + *(void *)(v313 + 72) * *(void *)v270, v264 + *(void *)(v313 + 72) * v271, v312);
          if (v272)
          {
            uint64_t v274 = v285;
LABEL_154:
            swift_bridgeObjectRelease();
            *(void *)(v274 + 16) = 0;
            return swift_bridgeObjectRelease();
          }
          if (v271 < v267) {
            goto LABEL_173;
          }
          if (v269 > *((void *)v265 + 2)) {
            goto LABEL_174;
          }
          *(void *)v266 = v267;
          *(void *)&v268[16 * v263 + 8] = v271;
          unint64_t v273 = *((void *)v265 + 2);
          if (v269 >= v273) {
            goto LABEL_175;
          }
          uint64_t v315 = 0;
          unint64_t v122 = v273 - 1;
          uint64_t result = (uint64_t)memmove(v270, v270 + 16, 16 * (v273 - 1 - v269));
          v221 = v268;
          v119 = v265;
          *((void *)v265 + 2) = v273 - 1;
          v85 = v310;
          v120 = v326;
          if (v273 <= 2) {
            goto LABEL_14;
          }
        }
      }
      unint64_t v122 = 1;
LABEL_14:
      uint64_t v121 = v120[1];
      uint64_t v118 = v325;
      if (v325 >= v121) {
        goto LABEL_156;
      }
    }
  }
  unint64_t v312 = MEMORY[0x1E4FBC860]
       + ((*(unsigned __int8 *)(v313 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v313 + 80));
  uint64_t v117 = v327;
  uint64_t v285 = MEMORY[0x1E4FBC860];
  if (v112 == 1) {
    goto LABEL_12;
  }
  unint64_t v122 = *(void *)(MEMORY[0x1E4FBC860] + 16);
  v119 = (char *)MEMORY[0x1E4FBC860];
  v120 = v111;
LABEL_156:
  if (v122 >= 2)
  {
    uint64_t v275 = *v120;
    uint64_t v274 = v285;
    while (1)
    {
      unint64_t v276 = v122 - 2;
      if (v122 < 2) {
        goto LABEL_188;
      }
      if (!v275) {
        goto LABEL_201;
      }
      uint64_t v277 = (uint64_t)v119;
      uint64_t v278 = *(void *)&v119[16 * v276 + 32];
      uint64_t v279 = *(void *)&v119[16 * v122 + 24];
      uint64_t v280 = v315;
      uint64_t result = sub_1A8FC24DC(v275 + *(void *)(v313 + 72) * v278, v275 + *(void *)(v313 + 72) * *(void *)&v119[16 * v122 + 16], v275 + *(void *)(v313 + 72) * v279, v312);
      if (v280) {
        goto LABEL_154;
      }
      if (v279 < v278) {
        goto LABEL_189;
      }
      uint64_t v315 = 0;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1A8FC37E0(v277);
        uint64_t v277 = result;
      }
      if (v276 >= *(void *)(v277 + 16)) {
        goto LABEL_190;
      }
      v281 = (void *)(v277 + 32 + 16 * v276);
      void *v281 = v278;
      v281[1] = v279;
      unint64_t v282 = *(void *)(v277 + 16);
      if (v122 > v282) {
        goto LABEL_191;
      }
      uint64_t result = (uint64_t)memmove((void *)(v277 + 32 + 16 * (v122 - 1)), (const void *)(v277 + 32 + 16 * v122), 16 * (v282 - v122));
      v119 = (char *)v277;
      *(void *)(v277 + 16) = v282 - 1;
      unint64_t v122 = v282 - 1;
      if (v282 <= 2) {
        goto LABEL_169;
      }
    }
  }
  uint64_t v274 = v285;
LABEL_169:
  swift_bridgeObjectRelease();
  *(void *)(v274 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A8FC1BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v99 = a4;
  uint64_t v81 = a1;
  uint64_t v102 = type metadata accessor for AccessRecord.Timing(0);
  uint64_t v7 = MEMORY[0x1F4188790](v102, v6);
  uint64_t v96 = &v79[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = &v79[-v10];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEDE0);
  uint64_t v14 = MEMORY[0x1F4188790](v12 - 8, v13);
  uint64_t v84 = &v79[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = MEMORY[0x1F4188790](v14, v16);
  uint64_t v88 = &v79[-v18];
  MEMORY[0x1F4188790](v17, v19);
  uint64_t v21 = &v79[-v20];
  uint64_t v22 = sub_1A8FC7548();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v25 = MEMORY[0x1F4188790](v22, v24);
  uint64_t v27 = &v79[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v29 = MEMORY[0x1F4188790](v25, v28);
  uint64_t v82 = &v79[-v30];
  uint64_t v32 = MEMORY[0x1F4188790](v29, v31);
  uint64_t v34 = &v79[-v33];
  MEMORY[0x1F4188790](v32, v35);
  uint64_t v95 = &v79[-v36];
  uint64_t v92 = type metadata accessor for AccessRecord(0);
  uint64_t v38 = MEMORY[0x1F4188790](v92, v37);
  uint64_t v94 = &v79[-((v39 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v41 = MEMORY[0x1F4188790](v38, v40);
  uint64_t v43 = &v79[-v42];
  uint64_t result = MEMORY[0x1F4188790](v41, v44);
  uint64_t v105 = &v79[-v47];
  uint64_t v90 = a3;
  uint64_t v80 = a2;
  if (a3 != a2)
  {
    uint64_t v48 = *(void *)(v46 + 72);
    uint64_t v49 = v23;
    uint64_t v50 = (void (**)(void, void, void))(v23 + 32);
    uint64_t v93 = (void (**)(unsigned char *, uint64_t))(v49 + 8);
    uint64_t v100 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48);
    uint64_t v101 = (void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v49 + 56);
    uint64_t v89 = v48;
    uint64_t v103 = v48 * v90;
    uint64_t v104 = v48 * (v90 - 1);
    uint64_t v86 = v11;
    uint64_t v87 = v21;
    uint64_t v83 = v27;
    uint64_t v91 = v34;
    v85 = v43;
LABEL_6:
    uint64_t v51 = 0;
    uint64_t v52 = v81;
    while (1)
    {
      uint64_t v53 = *v99;
      uint64_t v98 = v103 + v51;
      sub_1A8FC6670(v103 + v51 + v53, (uint64_t)v105, type metadata accessor for AccessRecord);
      uint64_t v97 = v104 + v51;
      sub_1A8FC6670(v104 + v51 + v53, (uint64_t)v43, type metadata accessor for AccessRecord);
      uint64_t v54 = *(int *)(v92 + 28);
      sub_1A8FC6670((uint64_t)&v43[v54], (uint64_t)v11, type metadata accessor for AccessRecord.Timing);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload)
      {
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v56 = *v101;
          uint64_t v57 = v88;
          (*v101)(v88, 1, 1, v22);
          uint64_t v58 = (uint64_t)v11;
          uint64_t v59 = (uint64_t)v57;
          sub_1A8FC64EC(v58, type metadata accessor for AccessRecord.Timing);
          goto LABEL_14;
        }
        uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
        uint64_t v60 = (void (*)(unsigned char *, unsigned char *, uint64_t))*v50;
        (*v50)(v34, &v11[*(int *)(v61 + 48)], v22);
        (*v93)(v11, v22);
      }
      else
      {
        uint64_t v60 = (void (*)(unsigned char *, unsigned char *, uint64_t))*v50;
        (*v50)(v34, v11, v22);
      }
      uint64_t v59 = (uint64_t)v88;
      v60(v88, v34, v22);
      uint64_t v56 = *v101;
      (*v101)(v59, 0, 1, v22);
LABEL_14:
      uint64_t v62 = (uint64_t)v87;
      sub_1A8FC654C(v59, (uint64_t)v87, &qword_1E97AEDE0);
      uint64_t v63 = *v100;
      if ((*v100)(v62, 1, v22) == 1)
      {
        sub_1A8FC65B0(v62, &qword_1E97AEDE0);
        uint64_t v43 = v85;
        sub_1A8FC64EC((uint64_t)v85, type metadata accessor for AccessRecord);
        uint64_t result = sub_1A8FC64EC((uint64_t)v105, type metadata accessor for AccessRecord);
        uint64_t v11 = v86;
LABEL_5:
        v104 += v89;
        v103 += v89;
        if (++v90 == v80) {
          return result;
        }
        goto LABEL_6;
      }
      uint64_t v64 = (uint64_t)&v105[v54];
      uint64_t v65 = v62;
      uint64_t v66 = (void (*)(unsigned char *, unsigned char *, uint64_t))*v50;
      (*v50)(v95, v65, v22);
      sub_1A8FC6670(v64, (uint64_t)v96, type metadata accessor for AccessRecord.Timing);
      int v67 = swift_getEnumCaseMultiPayload();
      if (v67)
      {
        if (v67 == 1)
        {
          uint64_t v68 = (uint64_t)v84;
          v56(v84, 1, 1, v22);
          sub_1A8FC64EC((uint64_t)v96, type metadata accessor for AccessRecord.Timing);
          goto LABEL_21;
        }
        uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
        v71 = v96;
        uint64_t v69 = v83;
        v66(v83, &v96[*(int *)(v70 + 48)], v22);
        (*v93)(v71, v22);
      }
      else
      {
        uint64_t v69 = v83;
        v66(v83, v96, v22);
      }
      uint64_t v68 = (uint64_t)v84;
      v66(v84, v69, v22);
      v56((unsigned char *)v68, 0, 1, v22);
      uint64_t v34 = v91;
LABEL_21:
      if (v63(v68, 1, v22) == 1)
      {
        sub_1A8FC65B0(v68, &qword_1E97AEDE0);
        (*v93)(v95, v22);
        uint64_t v43 = v85;
        sub_1A8FC64EC((uint64_t)v85, type metadata accessor for AccessRecord);
        uint64_t result = sub_1A8FC64EC((uint64_t)v105, type metadata accessor for AccessRecord);
        uint64_t v11 = v86;
      }
      else
      {
        uint64_t v72 = v82;
        v66(v82, (unsigned char *)v68, v22);
        sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
        uint64_t v73 = v95;
        char v74 = sub_1A8FC7588();
        uint64_t v75 = *v93;
        uint64_t v76 = v72;
        uint64_t v34 = v91;
        (*v93)(v76, v22);
        v75(v73, v22);
        uint64_t v43 = v85;
        sub_1A8FC64EC((uint64_t)v85, type metadata accessor for AccessRecord);
        uint64_t result = sub_1A8FC64EC((uint64_t)v105, type metadata accessor for AccessRecord);
        uint64_t v11 = v86;
        if (v74) {
          goto LABEL_5;
        }
      }
      uint64_t v77 = *v99;
      if (!*v99)
      {
        __break(1u);
        return result;
      }
      uint64_t v78 = v77 + v104 + v51;
      sub_1A8FC660C(v77 + v103 + v51, (uint64_t)v94);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_1A8FC660C((uint64_t)v94, v78);
      v51 -= v89;
      if (v90 == ++v52) {
        goto LABEL_5;
      }
    }
  }
  return result;
}

uint64_t sub_1A8FC24DC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v172 = a4;
  uint64_t v171 = type metadata accessor for AccessRecord.Timing(0);
  uint64_t v8 = MEMORY[0x1F4188790](v171, v7);
  uint64_t v153 = &v148[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v167 = &v148[-v12];
  uint64_t v14 = MEMORY[0x1F4188790](v11, v13);
  v158 = &v148[-v15];
  MEMORY[0x1F4188790](v14, v16);
  int v166 = &v148[-v17];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEDE0);
  uint64_t v20 = MEMORY[0x1F4188790](v18 - 8, v19);
  int v154 = &v148[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = MEMORY[0x1F4188790](v20, v22);
  uint64_t v160 = &v148[-v24];
  uint64_t v26 = MEMORY[0x1F4188790](v23, v25);
  uint64_t v28 = &v148[-v27];
  uint64_t v30 = MEMORY[0x1F4188790](v26, v29);
  v155 = &v148[-v31];
  uint64_t v33 = MEMORY[0x1F4188790](v30, v32);
  uint64_t v163 = (uint64_t)&v148[-v34];
  MEMORY[0x1F4188790](v33, v35);
  uint64_t v162 = &v148[-v36];
  uint64_t v37 = sub_1A8FC7548();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v40 = MEMORY[0x1F4188790](v37, v39);
  uint64_t v42 = &v148[-((v41 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v44 = MEMORY[0x1F4188790](v40, v43);
  uint64_t v150 = &v148[-v45];
  uint64_t v47 = MEMORY[0x1F4188790](v44, v46);
  uint64_t v161 = &v148[-v48];
  uint64_t v50 = MEMORY[0x1F4188790](v47, v49);
  v157 = &v148[-v51];
  uint64_t v53 = MEMORY[0x1F4188790](v50, v52);
  uint64_t v152 = &v148[-v54];
  uint64_t v56 = MEMORY[0x1F4188790](v53, v55);
  uint64_t v149 = &v148[-v57];
  uint64_t v59 = MEMORY[0x1F4188790](v56, v58);
  uint64_t v159 = &v148[-v60];
  MEMORY[0x1F4188790](v59, v61);
  uint64_t v156 = &v148[-v62];
  uint64_t v173 = type metadata accessor for AccessRecord(0);
  uint64_t v64 = MEMORY[0x1F4188790](v173, v63);
  v168 = &v148[-((v65 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v67 = MEMORY[0x1F4188790](v64, v66);
  uint64_t v170 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v148[-v68];
  uint64_t v70 = MEMORY[0x1F4188790](v67, v69);
  uint64_t v72 = &v148[-v71];
  uint64_t result = MEMORY[0x1F4188790](v70, v73);
  uint64_t v169 = &v148[-v75];
  uint64_t v164 = *(void *)(v76 + 72);
  if (!v164)
  {
    __break(1u);
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  if (a2 - a1 == 0x8000000000000000 && v164 == -1) {
    goto LABEL_94;
  }
  int64_t v77 = a3 - a2;
  if (a3 - a2 != 0x8000000000000000 || v164 != -1)
  {
    uint64_t v78 = (uint64_t)(a2 - a1) / v164;
    uint64_t v176 = (unsigned char *)a1;
    v175 = (unsigned char *)v172;
    if (v78 < v77 / v164)
    {
      uint64_t v79 = v78 * v164;
      if (v172 < a1 || a1 + v79 <= v172)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v172 != a1)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      uint64_t v167 = (unsigned char *)(v172 + v79);
      unint64_t v174 = v172 + v79;
      if (v79 >= 1 && a2 < a3)
      {
        uint64_t v82 = (void (**)(char *, char *, uint64_t))(v38 + 32);
        uint64_t v170 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56);
        v168 = (void *)(v38 + 48);
        uint64_t v160 = (unsigned char *)((v38 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000);
        uint64_t v161 = (unsigned char *)(v38 + 8);
        unint64_t v165 = a3;
        while (1)
        {
          sub_1A8FC6670(a2, (uint64_t)v169, type metadata accessor for AccessRecord);
          sub_1A8FC6670(v172, (uint64_t)v72, type metadata accessor for AccessRecord);
          uint64_t v83 = *(int *)(v173 + 28);
          sub_1A8FC6670((uint64_t)&v72[v83], (uint64_t)v166, type metadata accessor for AccessRecord.Timing);
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          if (EnumCaseMultiPayload)
          {
            uint64_t v85 = v163;
            uint64_t v86 = v159;
            if (EnumCaseMultiPayload == 1)
            {
              uint64_t v87 = *v170;
              (*v170)(v163, 1, 1, v37);
              sub_1A8FC64EC((uint64_t)v166, type metadata accessor for AccessRecord.Timing);
              goto LABEL_27;
            }
            uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
            uint64_t v90 = v166;
            uint64_t v88 = *v82;
            (*v82)(v86, (char *)v166 + *(int *)(v89 + 48), v37);
            (*(void (**)(void *, uint64_t))v161)(v90, v37);
          }
          else
          {
            uint64_t v88 = *v82;
            uint64_t v86 = v159;
            (*v82)(v159, (char *)v166, v37);
            uint64_t v85 = v163;
          }
          v88((char *)v85, v86, v37);
          uint64_t v87 = *v170;
          (*v170)(v85, 0, 1, v37);
LABEL_27:
          uint64_t v91 = v162;
          sub_1A8FC654C(v85, (uint64_t)v162, &qword_1E97AEDE0);
          uint64_t v92 = (unsigned int (*)(unsigned char *, uint64_t, uint64_t))*v168;
          if (((unsigned int (*)(char *, uint64_t, uint64_t))*v168)(v91, 1, v37) == 1)
          {
            sub_1A8FC65B0((uint64_t)v91, &qword_1E97AEDE0);
            sub_1A8FC64EC((uint64_t)v72, type metadata accessor for AccessRecord);
            sub_1A8FC64EC((uint64_t)v169, type metadata accessor for AccessRecord);
            uint64_t v93 = v164;
            unint64_t v94 = v165;
LABEL_29:
            unint64_t v95 = (unint64_t)v176;
            uint64_t v96 = &v175[v93];
            if (v176 < v175 || v176 >= v96)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v176 != v175)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v175 = v96;
            unint64_t v102 = a2;
            goto LABEL_50;
          }
          uint64_t v97 = (uint64_t)&v169[v83];
          uint64_t v98 = v91;
          uint64_t v99 = *v82;
          (*v82)(v156, v98, v37);
          sub_1A8FC6670(v97, (uint64_t)v158, type metadata accessor for AccessRecord.Timing);
          int v100 = swift_getEnumCaseMultiPayload();
          if (v100)
          {
            if (v100 == 1)
            {
              uint64_t v101 = (uint64_t)v155;
              v87((uint64_t)v155, 1, 1, v37);
              sub_1A8FC64EC((uint64_t)v158, type metadata accessor for AccessRecord.Timing);
              goto LABEL_41;
            }
            uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
            uint64_t v105 = v158;
            uint64_t v103 = v152;
            v99(v152, &v158[*(int *)(v104 + 48)], v37);
            (*(void (**)(unsigned char *, uint64_t))v161)(v105, v37);
          }
          else
          {
            uint64_t v103 = v152;
            v99(v152, v158, v37);
          }
          uint64_t v101 = (uint64_t)v155;
          v99(v155, v103, v37);
          v87(v101, 0, 1, v37);
LABEL_41:
          if (v92((unsigned char *)v101, 1, v37) == 1)
          {
            sub_1A8FC65B0(v101, &qword_1E97AEDE0);
            (*(void (**)(char *, uint64_t))v161)(v156, v37);
            sub_1A8FC64EC((uint64_t)v72, type metadata accessor for AccessRecord);
            sub_1A8FC64EC((uint64_t)v169, type metadata accessor for AccessRecord);
            uint64_t v93 = v164;
            unint64_t v94 = v165;
          }
          else
          {
            uint64_t v106 = v149;
            v99(v149, (char *)v101, v37);
            sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
            uint64_t v107 = v156;
            char v108 = sub_1A8FC7588();
            uint64_t v109 = *(void (**)(unsigned char *, uint64_t))v161;
            (*(void (**)(unsigned char *, uint64_t))v161)(v106, v37);
            v109(v107, v37);
            sub_1A8FC64EC((uint64_t)v72, type metadata accessor for AccessRecord);
            sub_1A8FC64EC((uint64_t)v169, type metadata accessor for AccessRecord);
            uint64_t v93 = v164;
            unint64_t v94 = v165;
            if (v108) {
              goto LABEL_29;
            }
          }
          unint64_t v95 = (unint64_t)v176;
          unint64_t v102 = a2 + v93;
          if ((unint64_t)v176 < a2 || (unint64_t)v176 >= v102)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v176 == (unsigned char *)a2)
          {
            unint64_t v95 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
LABEL_50:
          uint64_t v176 = (unsigned char *)(v95 + v93);
          unint64_t v172 = (unint64_t)v175;
          if (v175 < v167)
          {
            a2 = v102;
            if (v102 < v94) {
              continue;
            }
          }
          goto LABEL_92;
        }
      }
      goto LABEL_92;
    }
    uint64_t v80 = v77 / v164 * v164;
    uint64_t v159 = v28;
    uint64_t v151 = v42;
    if (v172 < a2 || a2 + v80 <= v172)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v172 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v110 = v172 + v80;
    unint64_t v174 = v172 + v80;
    uint64_t v176 = (unsigned char *)a2;
    BOOL v111 = v80 < 1 || a1 >= a2;
    uint64_t v112 = v161;
    if (v111)
    {
LABEL_92:
      sub_1A8FC36FC((unint64_t *)&v176, (unint64_t *)&v175, (uint64_t *)&v174);
      return 1;
    }
    uint64_t v113 = -v164;
    uint64_t v114 = v38;
    unint64_t v115 = v38 + 32;
    v158 = (unsigned char *)(v114 + 8);
    int v166 = (void *)(v114 + 56);
    uint64_t v163 = -v164;
    uint64_t v164 = v114 + 48;
    v155 = (char *)(v115 & 0xFFFFFFFFFFFFLL | 0x48D8000000000000);
    uint64_t v156 = (char *)a1;
    uint64_t v162 = (char *)v115;
    while (1)
    {
      sub_1A8FC6670(v110 + v113, (uint64_t)v170, type metadata accessor for AccessRecord);
      uint64_t v116 = v168;
      sub_1A8FC6670(a2 + v113, (uint64_t)v168, type metadata accessor for AccessRecord);
      uint64_t v117 = *(int *)(v173 + 28);
      sub_1A8FC6670((uint64_t)v116 + v117, (uint64_t)v167, type metadata accessor for AccessRecord.Timing);
      int v118 = swift_getEnumCaseMultiPayload();
      uint64_t v169 = (unsigned char *)(a2 + v113);
      if (v118)
      {
        if (v118 == 1)
        {
          unint64_t v119 = a2;
          v120 = (void (*)(unsigned char *, uint64_t, uint64_t, uint64_t))*v166;
          uint64_t v121 = v160;
          ((void (*)(unsigned char *, uint64_t, uint64_t, uint64_t))*v166)(v160, 1, 1, v37);
          sub_1A8FC64EC((uint64_t)v167, type metadata accessor for AccessRecord.Timing);
          goto LABEL_65;
        }
        uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
        uint64_t v124 = v167;
        unint64_t v122 = *(void (**)(void))v115;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))v115)(v112, &v167[*(int *)(v123 + 48)], v37);
        (*(void (**)(unsigned char *, uint64_t))v158)(v124, v37);
      }
      else
      {
        unint64_t v122 = *(void (**)(void))v115;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))v115)(v112, v167, v37);
      }
      unint64_t v119 = a2;
      uint64_t v121 = v160;
      v122();
      v120 = (void (*)(unsigned char *, uint64_t, uint64_t, uint64_t))*v166;
      ((void (*)(unsigned char *, void, uint64_t, uint64_t))*v166)(v121, 0, 1, v37);
LABEL_65:
      uint64_t v125 = (uint64_t)v121;
      uint64_t v126 = v159;
      sub_1A8FC654C(v125, (uint64_t)v159, &qword_1E97AEDE0);
      uint64_t v127 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v164;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))v164)(v126, 1, v37) != 1)
      {
        unint64_t v165 = a3;
        v131 = (char *)v170 + v117;
        uint64_t v132 = *(void (**)(void))v115;
        (*(void (**)(unsigned char *, char *, uint64_t))v115)(v157, v126, v37);
        uint64_t v133 = (uint64_t)v131;
        uint64_t v134 = v153;
        sub_1A8FC6670(v133, (uint64_t)v153, type metadata accessor for AccessRecord.Timing);
        int v135 = swift_getEnumCaseMultiPayload();
        if (v135)
        {
          v129 = (unsigned char *)v119;
          if (v135 == 1)
          {
            uint64_t v136 = v154;
            v120(v154, 1, 1, v37);
            uint64_t v137 = (uint64_t)v134;
            uint64_t v138 = (uint64_t)v136;
            sub_1A8FC64EC(v137, type metadata accessor for AccessRecord.Timing);
            uint64_t v130 = v169;
LABEL_73:
            int v141 = v127(v138, 1, v37);
            uint64_t v113 = v163;
            if (v141 == 1)
            {
              sub_1A8FC65B0(v138, &qword_1E97AEDE0);
              (*(void (**)(unsigned char *, uint64_t))v158)(v157, v37);
              char v128 = 1;
            }
            else
            {
              v142 = v150;
              ((void (*)(unsigned char *, uint64_t, uint64_t))v132)(v150, v138, v37);
              sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
              uint64_t v143 = v157;
              char v128 = sub_1A8FC7588() ^ 1;
              uint64_t v144 = *(void (**)(unsigned char *, uint64_t))v158;
              (*(void (**)(unsigned char *, uint64_t))v158)(v142, v37);
              v144(v143, v37);
            }
            a3 = v165;
            uint64_t v112 = v161;
            goto LABEL_77;
          }
          uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
          v139 = v151;
          ((void (*)(unsigned char *, unsigned char *, uint64_t))v132)(v151, &v134[*(int *)(v140 + 48)], v37);
          (*(void (**)(unsigned char *, uint64_t))v158)(v134, v37);
        }
        else
        {
          v139 = v151;
          ((void (*)(unsigned char *, unsigned char *, uint64_t))v132)(v151, v134, v37);
          v129 = (unsigned char *)v119;
        }
        uint64_t v130 = v169;
        uint64_t v138 = (uint64_t)v154;
        ((void (*)(unsigned char *, unsigned char *, uint64_t))v132)(v154, v139, v37);
        v120((unsigned char *)v138, 0, 1, v37);
        goto LABEL_73;
      }
      sub_1A8FC65B0((uint64_t)v126, &qword_1E97AEDE0);
      char v128 = 0;
      uint64_t v112 = v161;
      uint64_t v113 = v163;
      v129 = (unsigned char *)v119;
      uint64_t v130 = v169;
LABEL_77:
      unint64_t v145 = a3 + v113;
      sub_1A8FC64EC((uint64_t)v168, type metadata accessor for AccessRecord);
      sub_1A8FC64EC((uint64_t)v170, type metadata accessor for AccessRecord);
      if (v128)
      {
        if (a3 < (unint64_t)v129 || v145 >= (unint64_t)v129)
        {
          swift_arrayInitWithTakeFrontToBack();
          v146 = v156;
          unint64_t v115 = (unint64_t)v162;
          uint64_t v113 = v163;
        }
        else
        {
          v146 = v156;
          unint64_t v115 = (unint64_t)v162;
          uint64_t v113 = v163;
          if ((unsigned char *)a3 != v129) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v176 += v113;
      }
      else
      {
        unint64_t v147 = v174;
        v174 += v113;
        if (a3 < v147 || v145 >= v147)
        {
          swift_arrayInitWithTakeFrontToBack();
          uint64_t v130 = v129;
          v146 = v156;
          unint64_t v115 = (unint64_t)v162;
        }
        else
        {
          v146 = v156;
          unint64_t v115 = (unint64_t)v162;
          if (a3 != v147) {
            swift_arrayInitWithTakeBackToFront();
          }
          uint64_t v130 = v129;
        }
      }
      unint64_t v110 = v174;
      if (v174 > v172)
      {
        a2 = (unint64_t)v130;
        a3 = v145;
        if (v130 > v146) {
          continue;
        }
      }
      goto LABEL_92;
    }
  }
LABEL_95:
  __break(1u);
  return result;
}

char *sub_1A8FC3600(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AEE20);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1A8FC36FC(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for AccessRecord(0);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_17;
  }
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1A8FC37E0(uint64_t a1)
{
  return sub_1A8FC3600(0, *(void *)(a1 + 16), 0, (char *)a1);
}

size_t sub_1A8FC37F4(void *a1)
{
  return sub_1A8FBFB14(0, a1[2], 0, a1);
}

uint64_t _s17PrivacyAccounting12AccessRecordV6TimingO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v68 = a2;
  uint64_t v3 = sub_1A8FC7548();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v66 = v3;
  uint64_t v67 = v4;
  uint64_t v6 = MEMORY[0x1F4188790](v3, v5);
  uint64_t v63 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6, v8);
  uint64_t v64 = (char *)&v63 - v10;
  uint64_t v12 = MEMORY[0x1F4188790](v9, v11);
  uint64_t v65 = (char *)&v63 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12, v14);
  uint64_t v17 = (char *)&v63 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)&v63 - v19;
  uint64_t v21 = type metadata accessor for AccessRecord.Timing(0);
  uint64_t v23 = MEMORY[0x1F4188790](v21, v22);
  uint64_t v25 = (char *)&v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x1F4188790](v23, v26);
  uint64_t v29 = (char *)&v63 - v28;
  MEMORY[0x1F4188790](v27, v30);
  uint64_t v32 = (char *)&v63 - v31;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEDE8);
  uint64_t v35 = MEMORY[0x1F4188790](v33 - 8, v34);
  uint64_t v37 = (char *)&v63 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = (uint64_t)&v37[*(int *)(v35 + 56)];
  sub_1A8FC6670(a1, (uint64_t)v37, type metadata accessor for AccessRecord.Timing);
  sub_1A8FC6670(v68, v38, type metadata accessor for AccessRecord.Timing);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_1A8FC6670((uint64_t)v37, (uint64_t)v32, type metadata accessor for AccessRecord.Timing);
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v60 = v66;
      uint64_t v59 = v67;
      (*(void (**)(char *, uint64_t, uint64_t))(v67 + 32))(v20, v38, v66);
      char v42 = sub_1A8FC7528();
      uint64_t v61 = *(void (**)(char *, uint64_t))(v59 + 8);
      v61(v20, v60);
      v61(v32, v60);
      goto LABEL_16;
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v32, v66);
    goto LABEL_13;
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_1A8FC6670((uint64_t)v37, (uint64_t)v29, type metadata accessor for AccessRecord.Timing);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v41 = v66;
      uint64_t v40 = v67;
      (*(void (**)(char *, uint64_t, uint64_t))(v67 + 32))(v17, v38, v66);
      char v42 = sub_1A8FC7528();
      uint64_t v43 = *(void (**)(char *, uint64_t))(v40 + 8);
      v43(v17, v41);
      v43(v29, v41);
LABEL_16:
      sub_1A8FC64EC((uint64_t)v37, type metadata accessor for AccessRecord.Timing);
      return v42 & 1;
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v29, v66);
    goto LABEL_13;
  }
  sub_1A8FC6670((uint64_t)v37, (uint64_t)v25, type metadata accessor for AccessRecord.Timing);
  uint64_t v44 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20) + 48);
  uint64_t v45 = &v25[v44];
  if (swift_getEnumCaseMultiPayload() != 2)
  {
    uint64_t v56 = *(void (**)(char *, uint64_t))(v67 + 8);
    uint64_t v57 = v45;
    uint64_t v58 = v66;
    v56(v57, v66);
    v56(v25, v58);
LABEL_13:
    sub_1A8FC65B0((uint64_t)v37, &qword_1E97AEDE8);
    goto LABEL_14;
  }
  uint64_t v46 = v38 + v44;
  uint64_t v48 = v66;
  uint64_t v47 = v67;
  uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v67 + 32);
  uint64_t v50 = v65;
  v49(v65, v38, v66);
  uint64_t v51 = v64;
  v49(v64, (uint64_t)v45, v48);
  uint64_t v52 = v63;
  v49(v63, v46, v48);
  uint64_t v53 = v52;
  LOBYTE(v52) = sub_1A8FC7528();
  uint64_t v54 = *(void (**)(char *, uint64_t))(v47 + 8);
  v54(v25, v48);
  if (v52)
  {
    uint64_t v55 = v51;
    char v42 = sub_1A8FC7528();
    v54(v53, v48);
    v54(v55, v48);
    v54(v50, v48);
    goto LABEL_16;
  }
  v54(v53, v48);
  v54(v51, v48);
  v54(v50, v48);
  sub_1A8FC64EC((uint64_t)v37, type metadata accessor for AccessRecord.Timing);
LABEL_14:
  char v42 = 0;
  return v42 & 1;
}

uint64_t sub_1A8FC3DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A8FC74A8();
  uint64_t v64 = *(void (***)(char *, uint64_t))(v4 - 8);
  uint64_t v65 = v4;
  MEMORY[0x1F4188790](v4, v5);
  uint64_t v63 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEDF0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v57 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for AccessRecord(0);
  uint64_t v56 = *(void *)(v67 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v67, v10);
  uint64_t v55 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v13);
  uint64_t v15 = (void (**)(char *, uint64_t))((char *)&v55 - v14);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEC00);
  uint64_t v17 = MEMORY[0x1F4188790](v66, v16);
  uint64_t v58 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17, v19);
  uint64_t v21 = (char *)&v55 - v20;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEC08);
  uint64_t v23 = MEMORY[0x1F4188790](v59, v22);
  uint64_t v60 = (char *)&v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23, v25);
  uint64_t v61 = (uint64_t)&v55 - v26;
  uint64_t v27 = sub_1A8FC7548();
  sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
  if (sub_1A8FC7588())
  {
    LODWORD(v69[0]) = 22;
    sub_1A8FBF628(MEMORY[0x1E4FBC860]);
    sub_1A8FC66D8(&qword_1E97AEE00, MEMORY[0x1E4F26C30]);
    uint64_t v28 = v63;
    uint64_t v29 = v65;
    sub_1A8FC74B8();
    sub_1A8FC7498();
    v64[1](v28, v29);
    return swift_willThrow();
  }
  else
  {
    uint64_t result = sub_1A8FC75A8();
    if (result)
    {
      uint64_t v64 = v15;
      uint64_t v31 = v66;
      uint64_t v32 = &v21[*(int *)(v66 + 48)];
      uint64_t v33 = *(void **)(v27 - 8);
      uint64_t v34 = (void (*)(char *, uint64_t, uint64_t))v33[2];
      v34(v21, a1, v27);
      uint64_t v35 = v32;
      uint64_t v65 = (uint64_t)v32;
      v34(v32, a2, v27);
      uint64_t v36 = v58;
      uint64_t v37 = &v58[*(int *)(v31 + 48)];
      v34(v58, (uint64_t)v21, v27);
      v34(v37, (uint64_t)v35, v27);
      uint64_t v38 = (void (*)(char *, char *, uint64_t))v33[4];
      uint64_t v39 = (uint64_t)v60;
      v38(v60, v36, v27);
      uint64_t v40 = (void (*)(char *, uint64_t))v33[1];
      v40(v37, v27);
      uint64_t v41 = &v36[*(int *)(v66 + 48)];
      v38(v36, v21, v27);
      v38(v41, (char *)v65, v27);
      v38((char *)(v39 + *(int *)(v59 + 36)), v41, v27);
      v40(v36, v27);
      uint64_t v42 = v61;
      sub_1A8FC654C(v39, v61, &qword_1E97AEC08);
      uint64_t v43 = v62;
      static AccessHistory<>.forReport(in:)(v42, &v73);
      uint64_t result = sub_1A8FC65B0(v42, &qword_1E97AEC08);
      if (!v43)
      {
        uint64_t v66 = 0;
        uint64_t v44 = v73;
        uint64_t v72 = MEMORY[0x1E4FBC860];
        sub_1A8FC76D8();
        uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEBF0);
        uint64_t v70 = v45;
        unint64_t v71 = sub_1A8FBC9AC();
        v69[0] = v44;
        v69[1] = 0;
        uint64_t v65 = v44;
        swift_bridgeObjectRetain();
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v69, v45);
        uint64_t v46 = (uint64_t)v57;
        sub_1A8FC7688();
        uint64_t v47 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48);
        int v48 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v46, 1, v67);
        uint64_t v49 = (uint64_t)v55;
        uint64_t v50 = (uint64_t)v64;
        if (v48 != 1)
        {
          do
          {
            sub_1A8FC660C(v46, v50);
            sub_1A8FC6670(v50, v49, type metadata accessor for AccessRecord);
            uint64_t v51 = (objc_class *)_s18AccessRecordObjectCMa(0);
            id v52 = objc_allocWithZone(v51);
            sub_1A8FC6670(v49, (uint64_t)v52+ OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record, type metadata accessor for AccessRecord);
            v68.receiver = v52;
            v68.super_class = v51;
            objc_msgSendSuper2(&v68, sel_init);
            sub_1A8FC64EC(v49, type metadata accessor for AccessRecord);
            sub_1A8FC64EC(v50, type metadata accessor for AccessRecord);
            sub_1A8FC76B8();
            sub_1A8FC76E8();
            sub_1A8FC76F8();
            sub_1A8FC76C8();
            __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v69, v70);
            sub_1A8FC7688();
          }
          while ((*v47)(v46, 1, v67) != 1);
        }
        sub_1A8FC65B0((uint64_t)v69, &qword_1E97AEDF8);
        sub_1A8FC65B0(v46, &qword_1E97AEDF0);
        swift_bridgeObjectRelease();
        _s18AccessRecordObjectCMa(0);
        uint64_t v53 = (void *)sub_1A8FC7638();
        swift_release();
        id v54 = objc_msgSend(v53, sel_objectEnumerator);

        return (uint64_t)v54;
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t _s17PrivacyAccounting20ReverseChronologicalO15isOrderedBeforeySbAA12AccessRecordV6TimingO_AHtFZ_0(uint64_t a1, uint64_t a2)
{
  v40[1] = a1;
  uint64_t v3 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1F4188790](v3, v4);
  uint64_t v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97AEDE0);
  uint64_t v9 = MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v11 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v9, v12);
  uint64_t v15 = (char *)v40 - v14;
  MEMORY[0x1F4188790](v13, v16);
  uint64_t v18 = (char *)v40 - v17;
  uint64_t v19 = sub_1A8FC7548();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v22 = MEMORY[0x1F4188790](v19, v21);
  v40[0] = (char *)v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v22, v24);
  uint64_t v27 = (char *)v40 - v26;
  MEMORY[0x1F4188790](v25, v28);
  uint64_t v30 = (char *)v40 - v29;
  sub_1A8FC6670(a2, (uint64_t)v6, type metadata accessor for AccessRecord.Timing);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v15, 1, 1, v19);
      sub_1A8FC64EC((uint64_t)v6, type metadata accessor for AccessRecord.Timing);
      goto LABEL_7;
    }
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v32(v27, &v6[*(int *)(v33 + 48)], v19);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v19);
  }
  else
  {
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v32(v27, v6, v19);
  }
  v32(v15, v27, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v15, 0, 1, v19);
LABEL_7:
  sub_1A8FC654C((uint64_t)v15, (uint64_t)v18, &qword_1E97AEDE0);
  uint64_t v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  if (v34(v18, 1, v19) == 1)
  {
    sub_1A8FC65B0((uint64_t)v18, &qword_1E97AEDE0);
    char v35 = 0;
  }
  else
  {
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v36(v30, v18, v19);
    sub_1A8FBE14C(v11);
    if (v34(v11, 1, v19) == 1)
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v30, v19);
      sub_1A8FC65B0((uint64_t)v11, &qword_1E97AEDE0);
      char v35 = 1;
    }
    else
    {
      uint64_t v37 = v40[0];
      v36((char *)v40[0], v11, v19);
      sub_1A8FC66D8(&qword_1E97AEC10, MEMORY[0x1E4F27928]);
      char v35 = sub_1A8FC7588() ^ 1;
      uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v38(v37, v19);
      v38((uint64_t)v30, v19);
    }
  }
  return v35 & 1;
}

uint64_t sub_1A8FC49E4()
{
  return swift_getWitnessTable();
}

unint64_t sub_1A8FC4A04()
{
  unint64_t result = qword_1E97AEC18[0];
  if (!qword_1E97AEC18[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E97AEC18);
  }
  return result;
}

uint64_t sub_1A8FC4A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t type metadata accessor for AccessHistory()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A8FC4A78(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1A8FC4B00(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *sub_1A8FC4B58(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1A8FC4DC4(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t sub_1A8FC4E00(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1A8FC4E48(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AccessIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for AccessRecord(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  long long v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    uint64_t *v4 = *a2;
    long long v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    int v9 = (void *)a2[4];
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    a1[4] = (uint64_t)v9;
    type metadata accessor for AccessRecord.Timing(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v13 = v9;
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v16 = sub_1A8FC7548();
      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
      v17(v11, v12, v16);
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
      v17(&v11[*(int *)(v18 + 48)], &v12[*(int *)(v18 + 48)], v16);
    }
    else
    {
      uint64_t v14 = sub_1A8FC7548();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v11, v12, v14);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v19 = *(int *)(a3 + 32);
    uint64_t v20 = (char *)v4 + v19;
    uint64_t v21 = (char *)a2 + v19;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
  }
  return v4;
}

uint64_t destroy for AccessRecord(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 28);
  type metadata accessor for AccessRecord.Timing(0);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v10 = sub_1A8FC7548();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v11)((void *)(v10 - 8), v4, v10);
    uint64_t v9 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20) + 48);
    uint64_t v8 = v10;
    uint64_t v7 = v11;
  }
  else
  {
    if (result > 1) {
      return result;
    }
    uint64_t v6 = sub_1A8FC7548();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    uint64_t v8 = v6;
    uint64_t v9 = v4;
  }

  return v7(v9, v8);
}

void *initializeWithCopy for AccessRecord(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = (void *)a2[4];
  a1[4] = v8;
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  type metadata accessor for AccessRecord.Timing(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v12 = v8;
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v14 = sub_1A8FC7548();
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
    v15(v10, v11, v14);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
    v15(&v10[*(int *)(v16 + 48)], &v11[*(int *)(v16 + 48)], v14);
  }
  else
  {
    uint64_t v13 = sub_1A8FC7548();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v10, v11, v13);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = *(int *)(a3 + 32);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  return a1;
}

void *assignWithCopy for AccessRecord(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[4];
  uint64_t v7 = (void *)a1[4];
  a1[4] = v6;
  id v8 = v6;

  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    sub_1A8FC64EC((uint64_t)a1 + v9, type metadata accessor for AccessRecord.Timing);
    type metadata accessor for AccessRecord.Timing(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v13 = sub_1A8FC7548();
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
      v14(v10, v11, v13);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
      v14(&v10[*(int *)(v15 + 48)], &v11[*(int *)(v15 + 48)], v13);
    }
    else
    {
      uint64_t v12 = sub_1A8FC7548();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v16 = *(int *)(a3 + 32);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = *(void *)v18;
  v17[8] = v18[8];
  *(void *)uint64_t v17 = v19;
  return a1;
}

uint64_t initializeWithTake for AccessRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  type metadata accessor for AccessRecord.Timing(0);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v11 = sub_1A8FC7548();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32);
    v12(v8, v9, v11);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
    v12(v8 + *(int *)(v13 + 48), v9 + *(int *)(v13 + 48), v11);
  }
  else
  {
    uint64_t v10 = sub_1A8FC7548();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  return a1;
}

void *assignWithTake for AccessRecord(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)a1[4];
  a1[4] = a2[4];

  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    sub_1A8FC64EC((uint64_t)a1 + v9, type metadata accessor for AccessRecord.Timing);
    type metadata accessor for AccessRecord.Timing(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v13 = sub_1A8FC7548();
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
      v14(v10, v11, v13);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
      v14(&v10[*(int *)(v15 + 48)], &v11[*(int *)(v15 + 48)], v13);
    }
    else
    {
      uint64_t v12 = sub_1A8FC7548();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v16 = *(int *)(a3 + 32);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A8FC5810);
}

uint64_t sub_1A8FC5810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for AccessRecord.Timing(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AccessRecord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A8FC58D4);
}

uint64_t sub_1A8FC58D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for AccessRecord.Timing(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1A8FC597C()
{
  uint64_t result = type metadata accessor for AccessRecord.Timing(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AccessRecord.AccessorID(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AccessRecord.AccessorID()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AccessRecord.AccessorID(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AccessRecord.AccessorID(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessRecord.AccessorID(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccessRecord.AccessorID(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1A8FC5B68()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccessRecord.AccessorID()
{
  return &type metadata for AccessRecord.AccessorID;
}

uint64_t *initializeBufferWithCopyOfBuffer for AccessRecord.Timing(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v8 = sub_1A8FC7548();
      uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16);
      v9(a1, a2, v8);
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
      v9((uint64_t *)((char *)a1 + *(int *)(v10 + 48)), (uint64_t *)((char *)a2 + *(int *)(v10 + 48)), v8);
    }
    else
    {
      uint64_t v6 = sub_1A8FC7548();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for AccessRecord.Timing(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v7 = sub_1A8FC7548();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v7 - 8), a1, v7);
    uint64_t v6 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20) + 48);
    uint64_t v5 = v7;
    unint64_t v4 = v8;
  }
  else
  {
    if (result > 1) {
      return result;
    }
    uint64_t v3 = sub_1A8FC7548();
    unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    uint64_t v5 = v3;
    uint64_t v6 = a1;
  }

  return v4(v6, v5);
}

uint64_t initializeWithCopy for AccessRecord.Timing(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v5 = sub_1A8FC7548();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
    v6(a1, a2, v5);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
    v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
  }
  else
  {
    uint64_t v4 = sub_1A8FC7548();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for AccessRecord.Timing(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_1A8FC64EC(a1, type metadata accessor for AccessRecord.Timing);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v5 = sub_1A8FC7548();
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
      v6(a1, a2, v5);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
      v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
    }
    else
    {
      uint64_t v4 = sub_1A8FC7548();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for AccessRecord.Timing(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v5 = sub_1A8FC7548();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
    v6(a1, a2, v5);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
    v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
  }
  else
  {
    uint64_t v4 = sub_1A8FC7548();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for AccessRecord.Timing(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_1A8FC64EC(a1, type metadata accessor for AccessRecord.Timing);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v5 = sub_1A8FC7548();
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
      v6(a1, a2, v5);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20);
      v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
    }
    else
    {
      uint64_t v4 = sub_1A8FC7548();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessRecord.Timing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AccessRecord.Timing(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1A8FC632C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1A8FC633C()
{
  uint64_t result = sub_1A8FC7548();
  if (v1 <= 0x3F)
  {
    uint64_t v3 = *(void *)(result - 8) + 64;
    uint64_t v4 = v3;
    swift_getTupleTypeLayout2();
    uint64_t v5 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of static AccessOrder.isOrderedBefore(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for ReverseChronological()
{
  return &type metadata for ReverseChronological;
}

uint64_t sub_1A8FC63FC()
{
  return _s18AccessRecordObjectCMa(0);
}

uint64_t _s18AccessRecordObjectCMa(uint64_t a1)
{
  return sub_1A8FC6424(a1, (uint64_t *)&unk_1E97AEDD0);
}

uint64_t sub_1A8FC6424(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A8FC645C()
{
  uint64_t result = type metadata accessor for AccessRecord(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1A8FC64EC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A8FC654C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A8FC65B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A8FC660C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccessRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A8FC6670(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A8FC66D8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A8FC6720(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_1A8FC6784(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1A8FC6794()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1A8FC67E4(uint64_t a1)
{
  return sub_1A8FBEC04(a1, v1);
}

uint64_t sub_1A8FC67EC(uint64_t a1)
{
  return sub_1A8FBDA90(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void implicitIdentityForEntitlementDictionary_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A8FA5000, v0, v1, "BUG IN %{public}@! Encountered malformed implicitly assumed identity (app store app version) entitlement. The value is not a string %{public}@");
}

void PAAuthenticatedClientIdentity_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A8FA5000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve entitlements for process.  Got %@", (uint8_t *)&v2, 0xCu);
}

void PAAuthenticatedClientIdentityWithClientProperties_cold_1()
{
  uint64_t v0 = (void *)tcc_object_copy_description();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1A8FA5000, v1, v2, "BUG IN %@! They are attempting to assume an identity that they aren't entitled to: %{public}@", v3, v4, v5, v6, v7);
}

void PAAuthenticatedClientIdentityWithClientProperties_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A8FA5000, v0, v1, "BUG IN %{public}@! They have a malformed explicitly assumed identity entitlement. The value is not an array: %{public}@");
}

void PAAuthenticatedClientIdentityWithClientProperties_cold_3()
{
  uint64_t v0 = (void *)tcc_object_copy_description();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1A8FA5000, v1, v2, "BUG IN %{public}@! They attempted to provide a runtime-determined identity (%{public}@) while using the assumed-identity entitlement", v3, v4, v5, v6, v7);
}

void __lookupTCCIdentity_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A8FA5000, a2, OS_LOG_TYPE_ERROR, "TCC attribution for client failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void implicitIdentityEntryToTCCIdentity_cold_1(uint64_t a1, void *a2)
{
  int v2 = [a2 objectForKeyedSubscript:@"type"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1A8FA5000, v3, v4, "BUG IN %{public}@! Encountered malformed implicitly assumed identity entitlement. Bad identity type: %{public}@", v5, v6, v7, v8, v9);
}

void implicitIdentityEntryToTCCIdentity_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A8FA5000, v0, v1, "BUG IN %{public}@! Encountered malformed implicitly assumed identity entitlement. Bad identity value: %{public}@");
}

void implicitIdentityEntryToTCCIdentity_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A8FA5000, v0, v1, "BUG IN %{public}@! Encountered malformed implicitly assumed identity entitlement. The value is not a dictionary describing the identity: %{public}@");
}

void __PADefaultBundleRecordRetriever_block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A8FA5000, a2, OS_LOG_TYPE_DEBUG, "Skipping LS lookup for application=%{public}@", (uint8_t *)&v2, 0xCu);
}

void __PADefaultBundleRecordRetriever_block_invoke_2_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A8FA5000, log, OS_LOG_TYPE_ERROR, "Failed to fetch LS record for application=%{public}@ with error=%{public}@", (uint8_t *)&v3, 0x16u);
}

uint64_t sub_1A8FC7498()
{
  return MEMORY[0x1F40E2E28]();
}

uint64_t sub_1A8FC74A8()
{
  return MEMORY[0x1F40E2E50]();
}

uint64_t sub_1A8FC74B8()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1A8FC74C8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1A8FC74D8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1A8FC74E8()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1A8FC74F8()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1A8FC7508()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1A8FC7518()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1A8FC7528()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1A8FC7538()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1A8FC7548()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A8FC7558()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1A8FC7568()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1A8FC7578()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A8FC7588()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1A8FC7598()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1A8FC75A8()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1A8FC75B8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A8FC75C8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1A8FC75D8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1A8FC75E8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A8FC75F8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A8FC7608()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_1A8FC7618()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1A8FC7628()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A8FC7638()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1A8FC7648()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A8FC7658()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A8FC7668()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A8FC7678()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A8FC7688()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1A8FC7698()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1A8FC76A8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A8FC76B8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A8FC76C8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A8FC76D8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1A8FC76E8()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A8FC76F8()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A8FC7708()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A8FC7718()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A8FC7738()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1A8FC7748()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A8FC7758()
{
  return MEMORY[0x1F4185CF8]();
}

uint64_t sub_1A8FC7768()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A8FC7778()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A8FC7788()
{
  return MEMORY[0x1F4185EF8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter(CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78D0](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1F40D78D8](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1F417CE98]();
}

uint64_t MobileGestalt_get_greenTeaDeviceCapability()
{
  return MEMORY[0x1F417CEC8]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1F40F7150](task, entitlements, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8C0](audittoken, buffer, *(void *)&buffersize);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t tcc_authorization_record_get_service()
{
  return MEMORY[0x1F415CC80]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1F415CC90]();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1F415CCA8]();
}

uint64_t tcc_identity_copy_external_representation()
{
  return MEMORY[0x1F415CCE8]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1F415CCF0]();
}

uint64_t tcc_identity_create_from_external_representation()
{
  return MEMORY[0x1F415CCF8]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1F415CD00]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x1F415CD08]();
}

uint64_t tcc_identity_get_verifier_code_requirement_string()
{
  return MEMORY[0x1F415CD10]();
}

uint64_t tcc_identity_get_verifier_type()
{
  return MEMORY[0x1F415CD18]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1F415CD20]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1F415CD50]();
}

uint64_t tcc_object_copy_description()
{
  return MEMORY[0x1F415CD70]();
}

uint64_t tcc_server_message_get_identity_for_credential()
{
  return MEMORY[0x1F415CDA0]();
}

uint64_t tcc_server_singleton_default()
{
  return MEMORY[0x1F415CDD0]();
}

uint64_t tcc_service_get_CF_name()
{
  return MEMORY[0x1F415CDD8]();
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}