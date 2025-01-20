@interface MIBUCertHelper
+ (BOOL)SUCertPresent;
+ (__SecKey)suCertKeyFromData:(id)a3 isSEPKey:(BOOL)a4 error:(id *)a5;
+ (id)_getCertDataFromPath:(id)a3 error:(id *)a4;
+ (id)_parseDERCertificates:(id)a3 error:(id *)a4;
+ (id)certificatesFromData:(id)a3 error:(id *)a4;
+ (void)deleteSUCert:(id *)a3;
+ (void)readSUIdentityWithCompletion:(id)a3;
+ (void)trustCertificatesWithCompletion:(id)a3;
@end

@implementation MIBUCertHelper

+ (BOOL)SUCertPresent
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (os_variant_has_internal_content()
    && (+[MIBUTestPreferences sharedInstance],
        v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 factorySUCertExist],
        v2,
        v3))
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_13);
    }
    v4 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2309BC000, v4, OS_LOG_TYPE_DEFAULT, "Overriding factory SU certificate existence to YES", buf, 2u);
    }
    return 1;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = (id)suCertPaths;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v19;
      BOOL v5 = 1;
      *(void *)&long long v8 = 138543362;
      long long v17 = v8;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          v13 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v17, (void)v18);
          char v14 = [v13 fileExistsAtPath:v12];

          if ((v14 & 1) == 0)
          {
            if (MIBUOnceToken != -1) {
              dispatch_once(&MIBUOnceToken, &__block_literal_global_11_0);
            }
            v15 = MIBUConnObj;
            BOOL v5 = 0;
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              uint64_t v23 = v12;
              _os_log_impl(&dword_2309BC000, v15, OS_LOG_TYPE_DEFAULT, "Certificate file %{public}@ does not exist", buf, 0xCu);
              BOOL v5 = 0;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v9);
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  return v5;
}

void __31__MIBUCertHelper_SUCertPresent__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __31__MIBUCertHelper_SUCertPresent__block_invoke_9()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

+ (void)readSUIdentityWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *, void *, id))a3;
  if (os_variant_has_internal_content())
  {
    uint64_t v5 = +[MIBUTestPreferences sharedInstance];
    uint64_t v6 = [v5 factorySUCertPath];

    if (v6)
    {
      uint64_t v7 = +[MIBUTestPreferences sharedInstance];
      uint64_t v8 = [v7 factorySUCertPath];

      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_13_1);
      }
      uint64_t v9 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v8;
        _os_log_impl(&dword_2309BC000, v9, OS_LOG_TYPE_DEFAULT, "Overriding SU certificate path to %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v8 = @"/private/var/hardware/factory/su/su0-cert.der";
    }
    uint64_t v11 = +[MIBUTestPreferences sharedInstance];
    uint64_t v12 = [v11 factorySUKeyPath];

    if (v12)
    {
      v13 = +[MIBUTestPreferences sharedInstance];
      uint64_t v10 = [v13 factorySUKeyPath];

      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_16_1);
      }
      char v14 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v10;
        _os_log_impl(&dword_2309BC000, v14, OS_LOG_TYPE_DEFAULT, "Overriding SU key path to %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v10 = @"/private/var/hardware/factory/su/su0-key.der";
    }
  }
  else
  {
    uint64_t v10 = @"/private/var/hardware/factory/su/su0-key.der";
    uint64_t v8 = @"/private/var/hardware/factory/su/su0-cert.der";
  }
  id v23 = 0;
  v15 = [a1 _getCertDataFromPath:v8 error:&v23];
  id v16 = v23;
  if (v16)
  {
    id v20 = v16;
    long long v19 = 0;
    long long v17 = 0;
  }
  else
  {
    id v22 = 0;
    long long v17 = [a1 _parseDERCertificates:v15 error:&v22];
    id v18 = v22;
    if (v18)
    {
      id v20 = v18;
      long long v19 = 0;
    }
    else
    {
      id v21 = 0;
      long long v19 = [a1 _getCertDataFromPath:v10 error:&v21];
      id v20 = v21;
    }
  }
  v4[2](v4, v17, v19, v20);
}

void __47__MIBUCertHelper_readSUIdentityWithCompletion___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __47__MIBUCertHelper_readSUIdentityWithCompletion___block_invoke_14()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

+ (void)trustCertificatesWithCompletion:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *, void *, id))a3;
  if (!os_variant_has_internal_content())
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    v31 = 0;
    uint64_t v8 = 0;
    uint64_t v12 = @"retail-wifi-cert.apple.com";
    goto LABEL_31;
  }
  uint64_t v5 = +[MIBUTestPreferences sharedInstance];
  uint64_t v6 = [v5 iseTrustCertPaths];

  if (v6)
  {
    uint64_t v7 = +[MIBUTestPreferences sharedInstance];
    uint64_t v8 = [v7 iseTrustCertPaths];

    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_21_0);
    }
    uint64_t v9 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = (uint64_t)v8;
      _os_log_impl(&dword_2309BC000, v9, OS_LOG_TYPE_DEFAULT, "Overriding ISE trust certificate paths to: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  v13 = +[MIBUTestPreferences sharedInstance];
  char v14 = [v13 iseTrustCertName];

  if (!v14)
  {
    uint64_t v12 = @"retail-wifi-cert.apple.com";
    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  v15 = +[MIBUTestPreferences sharedInstance];
  uint64_t v16 = [v15 iseTrustCertName];

  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_24_2);
  }
  long long v17 = MIBUConnObj;
  if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (__CFString *)v16;
    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v40 = v16;
  uint64_t v12 = (__CFString *)v16;
  _os_log_impl(&dword_2309BC000, v17, OS_LOG_TYPE_DEFAULT, "Overriding ISE trust certificate name to: %{public}@", buf, 0xCu);
  if (v8)
  {
LABEL_16:
    v29 = v12;
    v30 = v4;
    v31 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v28 = v8;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      uint64_t v21 = *(void *)v35;
      while (2)
      {
        uint64_t v22 = 0;
        id v23 = v11;
        v24 = v10;
        do
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * v22);
          id v33 = 0;
          uint64_t v10 = objc_msgSend(a1, "_getCertDataFromPath:error:", v25, &v33, v28);
          id v26 = v33;

          if (v26)
          {
            uint64_t v11 = v23;
LABEL_34:
            uint64_t v8 = v18;

            v27 = 0;
            uint64_t v12 = v29;
            uint64_t v4 = v30;
            goto LABEL_32;
          }
          id v32 = 0;
          uint64_t v11 = [a1 _parseDERCertificates:v10 error:&v32];
          id v26 = v32;

          if (v26) {
            goto LABEL_34;
          }
          [v31 addObjectsFromArray:v11];
          ++v22;
          id v23 = v11;
          v24 = v10;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v10 = 0;
    }

    uint64_t v12 = v29;
    uint64_t v4 = v30;
    uint64_t v8 = v28;
    if (!v29) {
      goto LABEL_28;
    }
LABEL_31:
    v27 = objc_opt_new();
    [v27 addObject:v12];
    id v26 = 0;
    goto LABEL_32;
  }
LABEL_27:
  v31 = 0;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  if (v12) {
    goto LABEL_31;
  }
LABEL_28:
  id v26 = 0;
  v27 = 0;
LABEL_32:
  v4[2](v4, v31, v27, v26);
}

void __50__MIBUCertHelper_trustCertificatesWithCompletion___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __50__MIBUCertHelper_trustCertificatesWithCompletion___block_invoke_22()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

+ (__SecKey)suCertKeyFromData:(id)a3 isSEPKey:(BOOL)a4 error:(id *)a5
{
  v43[2] = *MEMORY[0x263EF8340];
  CFDataRef v7 = (const __CFData *)a3;
  CFErrorRef error = 0;
  if (!os_variant_has_internal_content() || a4)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_34_2);
    }
    uint64_t v20 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2309BC000, v20, OS_LOG_TYPE_DEFAULT, "Factory SU key is SEP key", buf, 2u);
    }
    SecAccessControlRef v21 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EB8], 0x40000000uLL, &error);
    if (v21)
    {
      uint64_t v26 = *MEMORY[0x263F170D0];
      v40[0] = *MEMORY[0x263F16F50];
      v40[1] = v26;
      uint64_t v27 = *MEMORY[0x263F170D8];
      v41[0] = MEMORY[0x263EFFA80];
      v41[1] = v27;
      uint64_t v28 = *MEMORY[0x263F16E70];
      v40[2] = *MEMORY[0x263F170F8];
      v40[3] = v28;
      v41[2] = v7;
      v41[3] = v21;
      CFDictionaryRef v19 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
      long long v17 = SecKeyCreateWithData((CFDataRef)[MEMORY[0x263EFF8F8] data], v19, &error);
      if (v17)
      {
        id v18 = 0;
      }
      else
      {
        id v35 = 0;
        safeAssignError(&v35, 50331648, error, @"Failed to convert RK data blob.", v29, v30, v31, v32, v34);
        id v18 = v35;
      }
    }
    else
    {
      id v36 = 0;
      safeAssignError(&v36, 0x1000000, error, @"Failed to create access control.", v22, v23, v24, v25, v34);
      id v18 = v36;
      CFDictionaryRef v19 = 0;
      long long v17 = 0;
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_27_0);
    }
    uint64_t v8 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2309BC000, v8, OS_LOG_TYPE_DEFAULT, "Factory SU key is not SEP key", buf, 2u);
    }
    uint64_t v9 = *MEMORY[0x263F16FE0];
    uint64_t v10 = *MEMORY[0x263F16F68];
    v42[0] = *MEMORY[0x263F17108];
    v42[1] = v10;
    uint64_t v11 = *MEMORY[0x263F16F70];
    v43[0] = v9;
    v43[1] = v11;
    CFDictionaryRef v12 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    long long v17 = SecKeyCreateWithData(v7, v12, &error);
    if (!v17 || error)
    {
      id v37 = 0;
      safeAssignError(&v37, 50331648, error, @"Failed to create SecKeyRef with data", v13, v14, v15, v16, v34);
      id v18 = v37;
    }
    else
    {
      id v18 = 0;
    }

    CFDictionaryRef v19 = 0;
  }
  if (a5) {
    *a5 = v18;
  }

  return v17;
}

void __51__MIBUCertHelper_suCertKeyFromData_isSEPKey_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __51__MIBUCertHelper_suCertKeyFromData_isSEPKey_error___block_invoke_32()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

+ (id)certificatesFromData:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        SecCertificateRef v11 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((void *)&v20 + 1) + 8 * i));
        if (!v11)
        {
          id v19 = 0;
          safeAssignError(&v19, 50331648, 0, @"Failed to create certificate from data.", v12, v13, v14, v15, v18);
          id v8 = v19;
          goto LABEL_11;
        }
        SecCertificateRef v16 = v11;
        [v6 addObject:v11];
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (a4) {
    *a4 = v8;
  }

  return v6;
}

+ (void)deleteSUCert:(id *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_46_0);
  }
  uint64_t v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2309BC000, v3, OS_LOG_TYPE_DEFAULT, "Deleting SU Certificate ...", buf, 2u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = (id)suCertPaths;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
        SecCertificateRef v11 = [MEMORY[0x263F08850] defaultManager];
        char v12 = [v11 fileExistsAtPath:v10];

        if (v12)
        {
          uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
          id v23 = v7;
          char v14 = [v13 removeItemAtPath:v10 error:&v23];
          id v15 = v23;

          if ((v14 & 1) == 0)
          {
            if (MIBUOnceToken != -1) {
              dispatch_once(&MIBUOnceToken, &__block_literal_global_52_1);
            }
            SecCertificateRef v16 = MIBUConnObj;
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v29 = v10;
              __int16 v30 = 2114;
              id v31 = v15;
              _os_log_error_impl(&dword_2309BC000, v16, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@ with error: %{public}@", buf, 0x16u);
            }
            safeAssignError(a3, 50331650, v15, @"Failed to delete %@", v17, v18, v19, v20, v10);
          }
          id v7 = v15;
        }
        else
        {
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_49_0);
          }
          long long v21 = MIBUConnObj;
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v29 = v10;
            _os_log_impl(&dword_2309BC000, v21, OS_LOG_TYPE_DEFAULT, "Certificate file %{public}@ does not exist, skip deletion...", buf, 0xCu);
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
}

void __31__MIBUCertHelper_deleteSUCert___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __31__MIBUCertHelper_deleteSUCert___block_invoke_47()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __31__MIBUCertHelper_deleteSUCert___block_invoke_50()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

+ (id)_getCertDataFromPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v5];
    if (v8) {
      goto LABEL_3;
    }
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_63_0);
    }
    id v15 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      +[MIBUCertHelper _getCertDataFromPath:error:]((uint64_t)v5, v15);
    }
    safeAssignError(a4, 50331648, 0, @"Failed to load %@", v16, v17, v18, v19, (uint64_t)v5);
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_57_0);
    }
    uint64_t v10 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      +[MIBUCertHelper _getCertDataFromPath:error:]((uint64_t)v5, v10);
    }
    safeAssignError(a4, 50331649, 0, @"%@ does not exist", v11, v12, v13, v14, (uint64_t)v5);
  }
  uint64_t v8 = 0;
LABEL_3:

  return v8;
}

void __45__MIBUCertHelper__getCertDataFromPath_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __45__MIBUCertHelper__getCertDataFromPath_error___block_invoke_61()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

+ (id)_parseDERCertificates:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  memset(v19, 0, sizeof(v19));
  unint64_t v18 = 0;
  id v5 = a3;
  unint64_t v6 = [v5 bytes];
  uint64_t v7 = CTParseCertificateSet(v6, v6 + [v5 length], v19, 3, &v18);
  if (v7) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v18 == 0;
  }
  if (v12)
  {
    safeAssignError(a4, 50331648, 0, @"Failed to parse certificate set: 0x%08x", v8, v9, v10, v11, v7);
    id v13 = 0;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v13 && v18)
    {
      uint64_t v14 = 0;
      int v15 = 0;
      do
      {
        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:*(void *)&v19[v14] length:*((void *)&v19[v14] + 1)];
        [v13 setObject:v16 atIndexedSubscript:v14];

        uint64_t v14 = ++v15;
      }
      while (v18 > v15);
    }
  }

  return v13;
}

+ (void)_getCertDataFromPath:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2309BC000, a2, OS_LOG_TYPE_ERROR, "Failed to load %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_getCertDataFromPath:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2309BC000, a2, OS_LOG_TYPE_ERROR, "Certificate file %{public}@ does not exist", (uint8_t *)&v2, 0xCu);
}

@end