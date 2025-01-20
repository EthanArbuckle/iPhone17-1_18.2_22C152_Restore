void authInstalllogHandler(unsigned int a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x263EF8340];
  if (a1 < 4)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      authInstalllogHandler_cold_1();
    }
  }
  else if (a1 - 4 >= 3)
  {
    if (a1 == 7)
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_8);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEBUG)) {
        authInstalllogHandler_cold_2();
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_11);
      }
      v3 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136446210;
        v5 = a2;
        goto LABEL_20;
      }
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_5);
    }
    v3 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136446210;
      v5 = a2;
LABEL_20:
      _os_log_impl(&dword_2309BC000, v3, OS_LOG_TYPE_DEFAULT, "AMAuthInstall: %{public}s", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __authInstalllogHandler_block_invoke()
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

void __authInstalllogHandler_block_invoke_3()
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

void __authInstalllogHandler_block_invoke_6()
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

void __authInstalllogHandler_block_invoke_9()
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_2309C70D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id OUTLINED_FUNCTION_1_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return [v0 charValue];
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return [v0 doubleValue];
}

void sub_2309CB94C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2309CBB50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2309CBE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_2309CC87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_2_2(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

void safeAssignError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    uint64_t v12 = (objc_class *)MEMORY[0x263F089D8];
    id v13 = a4;
    id v14 = a3;
    v15 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

    v16 = _createError(a2, v14, v15);

    *a1 = v16;
  }
}

id _createError(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = v7;
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (v5) {
    [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.MobileInBoxUpdater.ErrorDomain" code:a1 userInfo:v8];

  return v9;
}

void sub_2309D04FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2309D0DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2309D17D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2309D1D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if (result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if (result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if (result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if (result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if (result) {
              return result;
            }
            uint64_t v3 = 0x1000000000;
          }
          else
          {
            uint64_t v3 = 0x800000000;
          }
        }
        else
        {
          uint64_t v3 = 0x400000000;
        }
      }
      else
      {
        uint64_t v3 = 8;
      }
    }
    else
    {
      uint64_t v3 = 3840;
    }
    *(void *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6)) {
      goto LABEL_3;
    }
    time_t v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      time_t v3 = timegm(&v4);
      double result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(void *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6)) {
          *(void *)(a1 + 240) |= 0x1000000000uLL;
        }
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(unsigned char *)(result + 16))
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!result
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !result)
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !result))
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!result)
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(unsigned char *)(v3 + 17)) {
      double result = X509PolicySetFlagsForTestAnchor((void *)v3, a2);
    }
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0) {
    goto LABEL_15;
  }
  double result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if (result) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(void *)(a2 + 240) = v5;
LABEL_15:
  if (*(unsigned char *)(v3 + 16))
  {
    if (*(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!result
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !result)
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !result))
      {
        *(void *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(unsigned char *)(v3 + 16) && *(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!result) {
        *(void *)(a2 + 240) |= 0x6400000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForTestAnchor(void *a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  uint64_t result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!result)
  {
    uint64_t result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!result)
    {
      uint64_t result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!result) {
        *(void *)(a2 + 240) |= a1[1];
      }
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2 = 0;
  while (1)
  {
    uint64_t result = (int *)compare_octet_string_raw((uint64_t)&digests[v2 / 4 + 2], *(const void **)a1, *(void *)(a1 + 8));
    if (!result) {
      break;
    }
    v2 += 32;
    if (v2 == 160) {
      return 0;
    }
  }
  if (v2 <= ~(unint64_t)digests) {
    return &digests[v2 / 4];
  }
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1 = 0;
  while (digests[v1 / 4] != result)
  {
    v1 += 32;
    if (v1 == 160) {
      return 0;
    }
  }
  if (v1 <= ~(unint64_t)digests) {
    return &digests[v1 / 4];
  }
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, void *a2)
{
  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    id v6 = &CTOidSha1;
    uint64_t v4 = 5;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    id v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    id v6 = &CTOidSha256;
LABEL_18:
    uint64_t v4 = 9;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    id v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    id v6 = &CTOidSha384;
    goto LABEL_18;
  }
  uint64_t v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL)) {
      return 0;
    }
    id v6 = &CTOidSha512;
    goto LABEL_18;
  }
  id v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t result = 0;
  uint64_t v27 = *MEMORY[0x263EF8340];
  char v23 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            unint64_t result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!result
              || (unint64_t result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), result))
            {
              unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v10 = a5[9];
              uint64_t v9 = a5[10];
              if (__CFADD__(v10, v9)) {
                goto LABEL_31;
              }
              if (v10 > v10 + v9) {
                goto LABEL_32;
              }
              unint64_t v21 = a5[9];
              unint64_t v22 = v10 + v9;
              if (!v9 || (unint64_t result = ccder_blob_check_null(), result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    unint64_t result = ccder_decode_rsa_pub_n();
                    if (!result) {
                      return result;
                    }
                    unint64_t v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    unint64_t v12 = result << 6;
                    if (result << 6 < 0x400) {
                      return 0;
                    }
                    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
                    __int16 v26 = -21846;
                    char v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      unint64_t v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          uint64_t v14 = __memcpy_chk();
                          if (v12 > 0x1068) {
                            return 0;
                          }
                          unint64_t result = MEMORY[0x270FA5388](v14);
                          v16 = (unint64_t *)((char *)&v20 - v15);
                          unint64_t v17 = 0;
                          *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            v19 = &v16[v17 / 8];
                            *(_OWORD *)v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32;
                          }
                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            unint64_t *v16 = v11;
                            if (ccrsa_import_pub()) {
                              return 0;
                            }
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs()) {
                              return v23 != 0;
                            }
                            unint64_t result = 0;
                            char v23 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0;
  BOOL v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3)) {
      break;
    }
    BOOL v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0 = ccec_x963_import_pub_size();
  int is_supported = ccec_keysize_is_supported();
  unint64_t v2 = &CTOidSECP256r1;
  uint64_t v3 = &CTOidSECP521r1;
  uint64_t v4 = &CTOidSECP384r1;
  if (v0 != 384) {
    uint64_t v4 = 0;
  }
  if (v0 != 521) {
    uint64_t v3 = v4;
  }
  if (v0 != 256) {
    unint64_t v2 = v3;
  }
  if (is_supported) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (uint64_t result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), result))
            {
              uint64_t result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                uint64_t v8 = *(void *)result;
                if (*(void *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  uint64_t v9 = 24 * v8;
                  BOOL v10 = __CFADD__(v9, 16);
                  unint64_t v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0)
                  {
                    uint64_t result = MEMORY[0x270FA5388](result);
                    uint64_t v14 = (uint64_t *)((char *)&v17 - v12);
                    unint64_t v15 = 0;
                    do
                    {
                      v16 = &v14[v15 / 8];
                      uint64_t *v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16;
                    }
                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      *uint64_t v14 = result;
                      if (v12 >= 1)
                      {
                        if (!MEMORY[0x230FC4320]())
                        {
                          uint64_t result = ccec_x963_import_pub_size();
                          if (result == 256 && *(void *)(a5 + 96) == 64)
                          {
                            if (*(void *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite()) {
                                return HIBYTE(v17) != 0;
                              }
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify()) {
LABEL_24:
                          }
                            HIBYTE(v17) = 0;
                        }
                        return HIBYTE(v17) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  if (!a1) {
    return 0;
  }
  unint64_t v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(void *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793) {
      JUMPOUT(0x230FC42E0);
    }
    return 0;
  }
  uint64_t v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497) {
    JUMPOUT(0x230FC42F0);
  }
  int v5 = *v3;
  int v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713) {
    return 0;
  }
  return MEMORY[0x270ED8AA8]();
}

uint64_t compressECPublicKey(void *a1, int **a2, uint64_t a3, uint64_t a4)
{
  v19[1] = *MEMORY[0x263EF8340];
  BOOL v7 = (void *)ccec_cp_for_oid(a2);
  if (!v7) {
    return 655366;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *v7;
  if (*v7 >> 61 || !is_mul_ok(8 * v9, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  uint64_t v10 = 24 * v9;
  BOOL v11 = __CFADD__(v10, 16);
  unint64_t v12 = v10 + 16;
  if (v11 || v12 >= 0xFFFFFFFFFFFFFFF0) {
LABEL_19:
  }
    __break(0x5500u);
  uint64_t result = MEMORY[0x270FA5388]();
  v16 = (void *)((char *)v19 - v14);
  unint64_t v17 = 0;
  do
  {
    uint64_t v18 = &v16[v17 / 8];
    *uint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    v17 += 16;
  }
  while (v14 != v17);
  if (v15 < 0x10) {
    goto LABEL_21;
  }
  void *v16 = v8;
  if (v14 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t result = MEMORY[0x230FC4320](v8, a1[1], *a1, (char *)v19 - v14);
  if (!result)
  {
    uint64_t result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub();
      }
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  int v6 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v6) {
    return 655366;
  }
  uint64_t v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v8 = 24 * v7;
  BOOL v9 = __CFADD__(v8, 16);
  unint64_t v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  unint64_t result = MEMORY[0x270FA5388]();
  uint64_t v14 = (void *)((char *)v18 - v12);
  unint64_t v15 = 0;
  do
  {
    v16 = &v14[v15 / 8];
    unint64_t *v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16;
  }
  while (v12 != v15);
  if (v13 < 0x10) {
    goto LABEL_24;
  }
  *uint64_t v14 = result;
  if (v12 >= 1)
  {
    uint64_t v17 = ccec_compressed_x962_import_pub();
    if (!v17)
    {
      unint64_t result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = 393220;
          }
          ccec_export_pub();
          return v17;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v17;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(unsigned __int8 *a1, uint64_t a2, unint64_t *a3, char a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v28 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v29 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_114;
  }
  if (&a1[a2] < a1) {
    goto LABEL_112;
  }
  int v4 = 65537;
  v28 = a1;
  v29 = &a1[a2];
  __int16 v27 = 0;
  size_t v26 = 0xAAAAAAAAAAAAAAAALL;
  int v7 = ccder_blob_decode_ber_tl(&v28, 0x2000000000000010, (unsigned char *)&v27 + 1, &v26);
  uint64_t result = 65537;
  if (v7)
  {
    char v24 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v25 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26)) {
      goto LABEL_114;
    }
    if (v28 > &v28[v26] || &v28[v26] > v29) {
      goto LABEL_112;
    }
    char v24 = v28;
    unint64_t v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24) {
        goto LABEL_112;
      }
      if (compare_octet_string_raw((uint64_t)&pkcs7_signedData_oid, v24, v26)) {
        return 65539;
      }
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      v24 += v26;
      if (!ccder_blob_decode_ber_tl(&v24, 0xA000000000000000, &v27, &v26)) {
        return 65540;
      }
      unint64_t v22 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      char v23 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      unint64_t v22 = v24;
      char v23 = &v24[v26];
      __int16 v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((ccder_blob_decode_ber_tl(&v22, 0x2000000000000010, (unsigned char *)&v31 + 1, v30) & 1) == 0) {
        return 131073;
      }
      if (__CFADD__(v22, v30[0])) {
        goto LABEL_114;
      }
      uint64_t v9 = 131080;
      if (&v22[v30[0]] != v23) {
        return 131082;
      }
      unint64_t v10 = a3 + 11;
      if (!ccder_blob_decode_uint64()) {
        return 131074;
      }
      uint64_t result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!ccder_blob_eat_ber_inner(&v22, 0x2000000000000011, 0, 125)) {
          return 131075;
        }
        unsigned __int8 v35 = 0;
        size_t v34 = 0;
        if ((ccder_blob_decode_ber_tl(&v22, 0x2000000000000010, &v35, &v34) & 1) == 0) {
          return 131076;
        }
        v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34)) {
          goto LABEL_114;
        }
        if (v22 > &v22[v34] || &v22[v34] > v23) {
          goto LABEL_112;
        }
        v32 = v22;
        v33 = &v22[v34];
        if (!ccder_blob_decode_tl()) {
          return 131077;
        }
        if (v33 < v32 || v34 > v33 - v32) {
          goto LABEL_112;
        }
        if (compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v32, v34)) {
          return 131078;
        }
        if (__CFADD__(v32, v34)) {
          goto LABEL_114;
        }
        BOOL v11 = &v32[v34];
        if (v32 > &v32[v34] || v11 > v33) {
          goto LABEL_112;
        }
        v32 += v34;
        int v12 = v35;
        if (v11 != v33 || v35)
        {
          unsigned __int8 v40 = 0;
          v38 = v33;
          unint64_t v39 = 0;
          v37 = v11;
          if (ccder_blob_decode_ber_tl(&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39)) {
                goto LABEL_114;
              }
              if (&v37[v39] != v33) {
                return v9;
              }
            }
            if (v37 > v38) {
              goto LABEL_112;
            }
            v32 = v37;
            v33 = v38;
            unsigned __int8 v36 = 0;
            int v16 = v40;
            if (v40 && !ccder_blob_decode_ber_tl(&v32, 0x2000000000000004, &v36, &v39)) {
              return 131079;
            }
            unint64_t v41 = 0;
            if (!ccder_blob_decode_tl()) {
              return 131090;
            }
            uint64_t v17 = v32;
            uint64_t v18 = v33;
            if (v33 < v32) {
              goto LABEL_112;
            }
            unint64_t v19 = v41;
            if (v41 > v33 - v32) {
              goto LABEL_112;
            }
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            uint64_t v20 = &v17[v19];
            if (v20 > v18 || v17 > v20) {
              goto LABEL_112;
            }
            v32 = v20;
            if ((ccder_blob_decode_eoc((unint64_t *)&v32, v36) & 1) == 0) {
              return 131089;
            }
          }
          else
          {
            if (!v12) {
              return v9;
            }
            int v16 = v40;
          }
          if ((ccder_blob_decode_eoc((unint64_t *)&v32, v16 != 0) & 1) == 0) {
            return 131088;
          }
          BOOL v11 = v32;
        }
        if (v11 > v23 || v22 > v11) {
          goto LABEL_112;
        }
        unint64_t v22 = v11;
        if ((ccder_blob_decode_eoc((unint64_t *)&v22, v12 != 0) & 1) == 0) {
          return 131081;
        }
        v37 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        v38 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23) {
          goto LABEL_112;
        }
        v37 = v22;
        v38 = v23;
        if ((ccder_blob_decode_ber_tl(&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          unint64_t v13 = v22;
          unint64_t v15 = v23;
          goto LABEL_86;
        }
        v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38) {
            goto LABEL_112;
          }
          v32 = v37;
          v33 = &v37[v30[0]];
          if (!CMSParseImplicitCertificateSet(&v32, a3[1], *a3, a3 + 3, a3 + 2)) {
            return 131085;
          }
          if (!ccder_blob_decode_eoc((unint64_t *)&v32, v31)) {
            return 131086;
          }
          unint64_t v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32) {
              goto LABEL_112;
            }
            unint64_t v15 = v38;
            if (v32 > v38) {
              goto LABEL_112;
            }
            unint64_t v22 = v32;
            char v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              v37 = v13;
              v38 = v15;
              if (ccder_blob_eat_ber_inner(&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38) {
                  goto LABEL_112;
                }
                unint64_t v22 = v37;
                char v23 = v38;
              }
              if (!ccder_blob_eat_ber_inner(&v22, 0x2000000000000011, (unsigned __int8 **)&v30[1], 125)) {
                return 131083;
              }
              if (v30[2] >= v30[1])
              {
                unint64_t v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((ccder_blob_decode_eoc((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0) {
                    return 131084;
                  }
                  if (!ccder_blob_decode_eoc((unint64_t *)&v22, v27)) {
                    return 65541;
                  }
                  if (v22 <= v25 && v24 <= v22)
                  {
                    char v24 = v22;
                    if (ccder_blob_decode_eoc((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29) {
                        return 65543;
                      }
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t ccder_blob_decode_ber_tl(unsigned __int8 **a1, uint64_t a2, unsigned char *a3, unint64_t *a4)
{
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL) {
      return ccder_blob_decode_ber_len(a1, a3, a4);
    }
  }
  return result;
}

uint64_t ccder_blob_decode_eoc(unint64_t *a1, int a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v4 = *a1;
  if (*a1 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  unint64_t v5 = v4 - 0x5555555555555556;
  if (v4 > v4 - 0x5555555555555556 || v5 > a1[1]) {
    goto LABEL_12;
  }
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(unsigned __int8 *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, long long *))
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  v84 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v85 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if (__CFADD__(v4, v3)) {
    goto LABEL_93;
  }
  if (v4 > v4 + v3) {
    goto LABEL_92;
  }
  v84 = *(unsigned __int8 **)(a1 + 40);
  v85 = (unsigned __int8 *)(v4 + v3);
  unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    unsigned int v48 = 0;
    uint64_t result = 0;
    if (v3) {
      return (v48 << 8) | 0x30008;
    }
    return result;
  }
  unsigned int v6 = 0;
  unsigned __int8 v60 = 0;
  int v7 = 256;
  while (1)
  {
    unsigned __int8 v71 = 0;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((ccder_blob_decode_ber_tl(&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      int v49 = 196609;
      return v7 | v49;
    }
    v69 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    v70 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72)) {
      goto LABEL_93;
    }
    if (v84 > &v84[v72] || &v84[v72] > v85) {
      goto LABEL_92;
    }
    v69 = v84;
    v70 = &v84[v72];
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      int v49 = 196610;
      return v7 | v49;
    }
    uint64_t v9 = v69;
    int v8 = v70;
    v67 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    v67 = v69;
    unint64_t v68 = (unint64_t)v70;
    v65 = v69;
    v66 = v70;
    if (!ccder_blob_decode_tl()) {
      break;
    }
    unint64_t v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9)) {
      goto LABEL_94;
    }
    if (v72 + v10 - v9 > v8 - v9) {
      goto LABEL_92;
    }
    *((void *)&v73 + 1) = v9;
    *(void *)&long long v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72)) {
      goto LABEL_93;
    }
    if (v10 > &v10[v72] || &v10[v72] > v70) {
      goto LABEL_92;
    }
    v69 = &v10[v72];
    if (!ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v74 + 1))
    {
      int v49 = 196612;
      return v7 | v49;
    }
    v63 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    v64 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    v63 = v69;
    v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63) {
        goto LABEL_92;
      }
      *((void *)&v75 + 1) = v63;
      *(void *)&long long v76 = v72;
      if (__CFADD__(v63, v72)) {
        goto LABEL_93;
      }
      if (v63 > &v63[v72] || &v63[v72] > v64) {
        goto LABEL_92;
      }
      v69 = &v63[v72];
      v70 = v64;
    }
    else
    {
      *((void *)&v75 + 1) = 0;
      *(void *)&long long v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      int v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      int v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69) {
      goto LABEL_92;
    }
    *((void *)&v78 + 1) = v69;
    *(void *)&long long v79 = v72;
    if (__CFADD__(v69, v72)) {
      goto LABEL_93;
    }
    int v12 = &v69[v72];
    if (v69 > &v69[v72] || v12 > v70) {
      goto LABEL_92;
    }
    v69 += v72;
    v63 = v12;
    v64 = v70;
    if (ccder_blob_eat_ber_inner(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64) {
        goto LABEL_92;
      }
      v69 = v63;
      v70 = v64;
    }
    if ((ccder_blob_decode_eoc((unint64_t *)&v69, v71) & 1) == 0)
    {
      int v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      uint64_t v14 = digest;
      unsigned int v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        uint64_t result = a3(a2, a1, &v73);
        if (result != 327710)
        {
          if (result) {
            return result;
          }
          unint64_t v17 = *(void *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              int v29 = v60 - 1;
              unint64_t v30 = *(void *)(a1 + 56);
              uint64_t v31 = 176 * v29;
              if (__CFADD__(v30, v31)) {
                goto LABEL_93;
              }
              unint64_t v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30) {
                goto LABEL_92;
              }
              v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  unsigned int v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    unint64_t v35 = *(void *)(a1 + 56);
                    if (__CFADD__(v35, v31)) {
                      goto LABEL_93;
                    }
                    unsigned __int8 v36 = (_OWORD *)(v35 + 176 * v29);
                    unint64_t v37 = v35 + 176 * *(void *)(a1 + 64);
                    BOOL v38 = v37 >= (unint64_t)v36;
                    unint64_t v39 = v37 - (void)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0) {
                      goto LABEL_92;
                    }
                    long long v40 = v73;
                    long long v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    *unsigned __int8 v36 = v40;
                    long long v42 = v76;
                    long long v43 = v77;
                    long long v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    long long v45 = v80;
                    long long v46 = v81;
                    long long v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            unsigned int v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              uint64_t v19 = *(void *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60)) {
                goto LABEL_93;
              }
              uint64_t v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0) {
                goto LABEL_92;
              }
              long long v21 = v73;
              long long v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *uint64_t v20 = v21;
              long long v23 = v76;
              long long v24 = v77;
              long long v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              long long v26 = v80;
              long long v27 = v81;
              long long v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69) {
      goto LABEL_92;
    }
    v84 = v69;
    unsigned int v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85) {
        continue;
      }
    }
    if (v69 == v85)
    {
      if (v60) {
        return 0;
      }
      uint64_t v50 = *(void *)(a1 + 64);
      if (!v50) {
        return 0;
      }
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        uint64_t result = 0;
        v51 = *(_OWORD **)(a1 + 56);
        long long v52 = v73;
        long long v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        _OWORD *v51 = v52;
        long long v54 = v76;
        long long v55 = v77;
        long long v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        long long v57 = v80;
        long long v58 = v81;
        long long v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v67;
    BOOL v11 = (unsigned __int8 *)v68;
LABEL_17:
    if (v10 > v11) {
      goto LABEL_92;
    }
    v69 = v10;
    v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v65;
    BOOL v11 = v66;
    goto LABEL_17;
  }
  int v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = *(void *)(a3 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  if (__CFADD__(v3, v4)) {
LABEL_49:
  }
    __break(0x5513u);
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_48;
  }
  unint64_t v20 = *(void *)(a3 + 8);
  unint64_t v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)a3 != 3)
  {
    if (*(void *)a3 != 1) {
      return 524289;
    }
    uint64_t v8 = 524293;
    if (!ccder_blob_decode_tl()) {
      return 524290;
    }
    if (!ccder_blob_decode_tl()) {
      return 524291;
    }
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      unint64_t v15 = v20;
      unint64_t v16 = v19;
      if (__CFADD__(v20, v19)) {
        goto LABEL_49;
      }
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl()) {
          return 524292;
        }
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          unint64_t v17 = v20;
          unint64_t v18 = v19;
          if (__CFADD__(v20, v19)) {
            goto LABEL_49;
          }
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            uint64_t v9 = *(void **)(a2 + 24);
            if (!v9) {
              return v8;
            }
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              uint64_t v9 = (void *)v9[34];
              if (!v9) {
                return v8;
              }
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(void *)(a2 + 88) == 1) {
    return 524298;
  }
  unint64_t v15 = v3;
  unint64_t v16 = v5;
  if (ccder_blob_decode_tl())
  {
    unint64_t v11 = v20;
    unint64_t v10 = v21;
    goto LABEL_29;
  }
  uint64_t v8 = 524294;
  if (!ccder_blob_decode_tl() || !ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = v15;
  unint64_t v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  unint64_t v20 = v15;
  unint64_t v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11) {
    goto LABEL_48;
  }
  unint64_t v17 = v11;
  unint64_t v18 = v19;
  if (__CFADD__(v11, v19)) {
    goto LABEL_49;
  }
  if (v11 > v11 + v19 || v11 + v19 > v10) {
    goto LABEL_48;
  }
  unint64_t v20 = v11 + v19;
  uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier) {
    return 524295;
  }
  uint64_t v9 = (void *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21) {
    return 524543;
  }
  uint64_t v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (void *)(a3 + 152));
  uint64_t v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681) {
    *(_DWORD *)(a3 + 168) = v13;
  }
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3 + 24;
  digest = find_digest(a3 + 24);
  if (!digest) {
    return 327682;
  }
  uint64_t v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  uint64_t v9 = v8;
  memset(v86, 0, sizeof(v86));
  unint64_t v10 = (_OWORD *)a2[13];
  unint64_t v11 = a2[14];
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      unint64_t v10 = v86;
      uint64_t v13 = ccdigest();
      unint64_t v11 = *v9;
      if (*v9 >= 0x41) {
        goto LABEL_180;
      }
      goto LABEL_16;
    }
    if (!v10) {
      goto LABEL_144;
    }
  }
  if (*v8 != v11)
  {
LABEL_144:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40) {
    goto LABEL_180;
  }
  uint64_t v13 = __memcpy_chk();
LABEL_16:
  *(void *)(a3 + 128) = v10;
  *(void *)(a3 + 136) = v11;
  unint64_t v15 = (void *)(a3 + 128);
  uint64_t v16 = *(void *)(a3 + 48);
  if (!v16) {
    goto LABEL_159;
  }
  uint64_t v71 = a1;
  long long v79 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v80 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = *(void *)(a3 + 40);
  if (__CFADD__(v17, v16)) {
    goto LABEL_181;
  }
  unint64_t v18 = v17 + v16;
  if (v17 > v18)
  {
LABEL_180:
    __break(0x5519u);
    goto LABEL_181;
  }
  long long v79 = *(char **)(a3 + 40);
  unint64_t v80 = v18;
  unint64_t v78 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 < v18)
  {
    int v19 = 0;
    uint64_t v74 = 0x2000000000000010;
    unsigned int v70 = 262146;
    unsigned int v73 = 262147;
    unsigned int v72 = 262148;
    do
    {
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = 262145;
        goto LABEL_176;
      }
      if (__CFADD__(v79, v78)) {
        goto LABEL_181;
      }
      unint64_t v20 = &v79[v78];
      long long v77 = (char *)0xAAAAAAAAAAAAAAAALL;
      long long v76 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (v79 > &v79[v78] || (unint64_t)v20 > v80) {
        goto LABEL_180;
      }
      long long v76 = v79;
      long long v77 = &v79[v78];
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = v70;
        goto LABEL_176;
      }
      uint64_t v22 = v76;
      if (__CFADD__(v76, v78)) {
        goto LABEL_181;
      }
      if (v76 > &v76[v78] || &v76[v78] > v77) {
        goto LABEL_180;
      }
      v76 += v78;
      if (v78 != 9) {
        goto LABEL_147;
      }
      if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 3)
      {
        if (v19) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v33 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v33)
        {
          if (CMSAttributeParseContentType(&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 1u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 4)
      {
        if ((v19 & 2) != 0) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v36 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v36)
        {
          if (CMSAttributeParseMessageDigest((uint64_t)&v76, v34, v35, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 2u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 2)
      {
        if ((v19 & 0x10) != 0) {
          goto LABEL_149;
        }
        unint64_t v83 = 0xAAAAAAAAAAAAAAAALL;
        int v37 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v37)
        {
          BOOL v38 = v76;
          unint64_t v39 = v77;
          if (v76 >= v77)
          {
LABEL_111:
            if (v38 == v39) {
              uint64_t result = 0;
            }
            else {
              uint64_t result = 262155;
            }
          }
          else
          {
            while (1)
            {
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262157;
                goto LABEL_134;
              }
              memset(v84, 170, 16);
              if (__CFADD__(v76, v83)) {
                goto LABEL_181;
              }
              if (v76 > &v76[v83] || &v76[v83] > v77) {
                goto LABEL_180;
              }
              *(void *)v84 = v76;
              *(void *)&v84[8] = &v76[v83];
              if ((ccder_blob_decode_tl() & 1) == 0)
              {
                uint64_t result = 262151;
                goto LABEL_134;
              }
              long long v81 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              long long v82 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              if (*(void *)&v84[8] < *(void *)v84 || v83 > *(void *)&v84[8] - *(void *)v84) {
                goto LABEL_180;
              }
              long long v81 = *(unsigned char **)v84;
              long long v82 = (unsigned char *)v83;
              if (__CFADD__(*(void *)v84, v83)) {
                goto LABEL_181;
              }
              if (*(void *)v84 > *(void *)v84 + v83 || *(void *)v84 + v83 > *(void *)&v84[8]) {
                goto LABEL_180;
              }
              *(void *)v84 += v83;
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262152;
                goto LABEL_134;
              }
              uint64_t v41 = *(void *)v84;
              if (__CFADD__(*(void *)v84, v83)) {
                goto LABEL_181;
              }
              unint64_t v42 = *(void *)v84 + v83;
              if (*(void *)v84 > *(void *)v84 + v83) {
                goto LABEL_180;
              }
              uint64_t v43 = *(void *)&v84[8];
              if (v42 > *(void *)&v84[8]) {
                goto LABEL_180;
              }
              *(void *)v84 += v83;
              if (v42 != *(void *)&v84[8]) {
                break;
              }
              long long v44 = find_digest((uint64_t)&v81);
              if (v44)
              {
                unsigned int v45 = *v44;
                if (*v44 > *(_DWORD *)(a3 + 104))
                {
                  unsigned int v46 = *(_DWORD *)(v71 + 8);
                  if (!v46 || v45 <= v46)
                  {
                    *(_DWORD *)(a3 + 104) = v45;
                    unint64_t v47 = v83;
                    if (v83 > v43 - v41) {
                      goto LABEL_180;
                    }
                    *(void *)(a3 + 112) = v41;
                    *(void *)(a3 + 120) = v47;
                  }
                }
              }
              BOOL v38 = *(char **)v84;
              unint64_t v39 = v77;
              if (*(void *)v84 > (unint64_t)v77 || (unint64_t)v76 > *(void *)v84) {
                goto LABEL_180;
              }
              long long v76 = *(char **)v84;
              if (*(void *)v84 >= (unint64_t)v77) {
                goto LABEL_111;
              }
            }
            uint64_t result = 262153;
          }
        }
LABEL_134:
        v19 |= 0x10u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 5)
      {
        if ((v19 & 4) != 0) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v48 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v48)
        {
          if (CMSAttributeParseSigningTime((unint64_t *)&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 4u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 1)
      {
        if ((v19 & 8) != 0) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v51 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v51)
        {
          if (CMSAttributeParseAppleHashAgility((unint64_t *)&v76, v49, v50, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 8u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 52)
      {
        if ((v19 & 0x20) != 0)
        {
LABEL_149:
          uint64_t result = 262149;
          goto LABEL_176;
        }
        v19 |= 0x20u;
      }
      else
      {
        uint64_t v29 = *(void *)v22;
        int v30 = v22[8];
        if (v29 != 0x9010DF78648862ALL || v30 != 15)
        {
LABEL_147:
          uint64_t result = 262150;
          goto LABEL_176;
        }
        if ((v19 & 0x40) != 0) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v32 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v32)
        {
          if (CMSAttributeParseSMIMECapabilities(&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 0x40u;
        if (result) {
          goto LABEL_176;
        }
      }
      if ((unint64_t)v20 > v80 || v79 > v20) {
        goto LABEL_180;
      }
      long long v79 = v20;
    }
    while ((unint64_t)v20 < v80);
    if ((~v19 & 3) == 0)
    {
      uint64_t v53 = ccder_sizeof_tag();
      uint64_t v54 = ccder_sizeof_len();
      BOOL v55 = __CFADD__(v53, v54);
      unint64_t v56 = v53 + v54;
      if (v55) {
        goto LABEL_182;
      }
      if (v56 > 0x14)
      {
        uint64_t result = 327689;
        goto LABEL_176;
      }
      memset(v84, 170, sizeof(v84));
      long long v81 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      long long v82 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v84, v56))
      {
        if (&v84[v56] <= (unsigned char *)&v85 && v84 <= &v84[v56])
        {
          long long v81 = v84;
          long long v82 = &v84[v56];
          uint64_t v57 = ccder_blob_encode_tl();
          if (!v57)
          {
            uint64_t result = 327688;
            goto LABEL_176;
          }
          unint64_t v58 = v9[1];
          BOOL v55 = __CFADD__(v58, 8);
          unint64_t v59 = v58 + 8;
          if (!v55)
          {
            unint64_t v60 = v9[2];
            BOOL v55 = __CFADD__(v59, v60);
            unint64_t v61 = v59 + v60;
            if (!v55)
            {
              BOOL v55 = __CFADD__(v61, 4);
              unint64_t v62 = v61 + 4;
              if (!v55 && v62 < 0xFFFFFFFFFFFFFFF8)
              {
                MEMORY[0x270FA5388](v57);
                v64 = (char *)&v69 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
                memset(v64, 170, ((v65 - 9) & 0xFFFFFFFFFFFFFFF8) + 8);
                ccdigest_init();
                ccdigest_update();
                ccdigest_update();
                uint64_t v13 = ((uint64_t (*)(unint64_t *, char *, _OWORD *))v9[7])(v9, v64, v86);
LABEL_159:
                uint64_t result = CMSBuildPath(v13, (uint64_t)a2, a3);
                switch((int)result)
                {
                  case 524293:
                  case 524295:
                    *(_DWORD *)(a3 + 168) = result;
                    return 0;
                  case 524294:
                    goto LABEL_176;
                  case 524296:
                    if (*(_DWORD *)(a3 + 168) != 458753) {
                      goto LABEL_167;
                    }
                    int v66 = 524296;
LABEL_166:
                    *(_DWORD *)(a3 + 168) = v66;
LABEL_167:
                    unint64_t v67 = *v9;
                    if (*v9 > 0x40) {
                      goto LABEL_180;
                    }
                    v75[0] = v86;
                    v75[1] = v67;
                    uint64_t result = X509CertificateCheckSignatureDigest(29, *(void *)(a3 + 152), v75, v6);
                    if (!result || result == 655648 || result == 655632)
                    {
                      int v68 = *(_DWORD *)(a3 + 168);
                      if (!v68 || v68 == 458753 || v68 == 327681) {
                        *(_DWORD *)(a3 + 168) = result;
                      }
                      uint64_t result = 0;
                    }
                    break;
                  case 524297:
                    int v66 = 524297;
                    goto LABEL_166;
                  default:
                    if (result) {
                      goto LABEL_176;
                    }
                    goto LABEL_167;
                }
                goto LABEL_176;
              }
            }
          }
LABEL_182:
          __break(0x5500u);
          JUMPOUT(0x2309D6438);
        }
        goto LABEL_180;
      }
LABEL_181:
      __break(0x5513u);
    }
  }
  uint64_t result = 262156;
LABEL_176:
  if ((_OWORD *)*v15 == v86)
  {
    void *v15 = 0;
    *(void *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!v5)
  {
    int v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168)) {
        *(_DWORD *)(a3 + 168) = v7;
      }
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  v9[0] = 0;
  return CMSVerify(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t CMSVerify(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v19, 0, sizeof(v19));
  long long v27 = v19;
  *(void *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0) {
    goto LABEL_19;
  }
  uint64_t result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if (result) {
    return result;
  }
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0) {
    return result;
  }
  if (a4 < 0) {
LABEL_19:
  }
    __break(0x5519u);
  *((void *)&v28[0] + 1) = a3;
  *(void *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  uint64_t result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, long long *))validateSignerInfoAndChain);
  if (!result)
  {
    uint64_t result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7) {
        uint64_t result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      }
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            uint64_t v18 = *(void *)&v28[1];
            if (*(void *)&v28[1])
            {
              if (*((void *)&v28[0] + 1))
              {
                *a8 = *((void *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  v9[0] = 0;
  uint64_t v8 = 0;
  return CMSVerify(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(unsigned __int8 *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  v7[0] = 0;
  return CMSVerify(a1, a2, 0, 0, a5, &v6, v7, a3, a4);
}

uint64_t ccder_blob_decode_ber_len(unsigned __int8 **a1, unsigned char *a2, unint64_t *a3)
{
  *a2 = 0;
  unint64_t v3 = *a1;
  if (!*a1) {
    return 0;
  }
  unint64_t v4 = (unint64_t)a1[1];
  if ((unint64_t)v3 >= v4) {
    return 0;
  }
  if (v3 == (unsigned __int8 *)-1)
  {
LABEL_42:
    __break(0x5513u);
    JUMPOUT(0x2309D6974);
  }
  uint64_t v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
    goto LABEL_42;
  }
  *a1 = v5;
  unint64_t v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        unint64_t v7 = v4 - (void)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (void)v5) < 1) {
          return 0;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        uint64_t v9 = v3 + 2;
        if (v5 > v9 || (unint64_t)v9 > v4) {
          goto LABEL_41;
        }
        *a1 = v9;
        unint64_t v7 = *v5;
        uint64_t v5 = v9;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (void)v5) < 2) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = (unint64_t)v3[1] << 8;
        uint64_t v12 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (void)v5) < 3) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        uint64_t v12 = v3[3];
LABEL_40:
        unint64_t v7 = v11 | v12;
        *a1 = v10;
        uint64_t v5 = v10;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7) {
    return 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t CMSParseImplicitCertificateSet(unsigned __int8 **a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  int v30 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *a1;
  unint64_t v6 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  int v30 = *a1;
  unint64_t v31 = v6;
  BOOL v7 = (unint64_t)v5 >= v6 || a3 == 0;
  if (v7)
  {
    unint64_t v12 = 0;
LABEL_8:
    if (a5) {
      *a5 = v12;
    }
    return 1;
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v13 = 304 * a3;
    unint64_t v14 = a2 + 304 * a3;
    unint64_t v25 = ~a2;
    long long v27 = (unint64_t **)(a4 + 1);
    long long v23 = (unint64_t *)(a2 + 272);
    unint64_t v15 = a2;
    while (1)
    {
      char v29 = 0;
      if (!ccder_blob_decode_tag()) {
        return 0;
      }
      if (!v32) {
        goto LABEL_8;
      }
      if (!ccder_blob_decode_ber_len(&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010) {
        return 0;
      }
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25) {
        goto LABEL_44;
      }
      if (v15 > v14) {
        goto LABEL_43;
      }
      if (v15 < a2) {
        goto LABEL_43;
      }
      BOOL v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16) {
        goto LABEL_43;
      }
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)unint64_t v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        *(void *)(v15 + 272) = 0;
        unint64_t v17 = *v27;
        *(void *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *unint64_t v17 = v15;
        *long long v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        unint64_t v18 = *a4;
        *long long v23 = *a4;
        int v19 = (unint64_t **)(v18 + 280);
        BOOL v7 = v18 == 0;
        long long v20 = v27;
        if (!v7) {
          long long v20 = v19;
        }
        *long long v20 = v23;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *a4 = v15;
        *(void *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, (unint64_t *)&v30, 0, 0)) {
        return 0;
      }
      if (v6 < (unint64_t)v5) {
        goto LABEL_43;
      }
      long long v21 = v30;
      uint64_t v22 = (unsigned __int8 *)(v30 - v5);
      if (v30 - v5 > v6 - (unint64_t)v5) {
        goto LABEL_43;
      }
      if (v15 + 304 > v14) {
        goto LABEL_43;
      }
      *(void *)unint64_t v15 = v5;
      *(void *)(v15 + 8) = v22;
      unint64_t v6 = v31;
      if ((unint64_t)v21 > v31) {
        goto LABEL_43;
      }
      *a1 = v21;
      a1[1] = (unsigned __int8 *)v6;
      ++v12;
      if ((unint64_t)v21 < v6)
      {
        v15 += 304;
        uint64_t v5 = v21;
        if (v12 < a3) {
          continue;
        }
      }
      goto LABEL_8;
    }
  }
}

uint64_t ccder_blob_eat_ber_inner(unsigned __int8 **a1, uint64_t a2, unsigned __int8 **a3, int a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v15 = 0;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8 && v14 == a2)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t result = ccder_blob_decode_ber_len(a1, &v15, &v13);
    if ((result & 1) == 0) {
      return 0;
    }
    if (a3)
    {
      unint64_t v10 = a1[1];
      if (*a1 > v10) {
        goto LABEL_18;
      }
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        uint64_t result = ccder_blob_eat_ber_inner(a1, 0, 0, (char)(a4 - 1));
        if (!result) {
          return result;
        }
        return (ccder_blob_decode_eoc((unint64_t *)a1, 1) & 1) != 0;
      }
      return 0;
    }
    unint64_t v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = &v11[v13];
    if (v11 <= &v11[v13] && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t CMSAttributeParseContentType(char **a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if ((unint64_t)*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v3 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (v3 <= v3 - 0x5555555555555556) {
        return compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v3, 0xAAAAAAAAAAAAAAAALL) == 0;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t CMSAttributeParseMessageDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*(void *)a1 >= 0x5555555555555556uLL)
    {
      __break(0x5513u);
    }
    else if (*(void *)a1 - 0x5555555555555556 == *(void *)(a1 + 8))
    {
      uint64_t result = (uint64_t)find_digest(a4 + 24);
      if (result)
      {
        if (*(void *)(a4 + 136) != 0xAAAAAAAAAAAAAAAALL
          || *(void *)(*(uint64_t (**)(void))(result + 24))() != 0xAAAAAAAAAAAAAAAALL
          || memcmp(*(const void **)(a4 + 128), *(const void **)a1, 0xAAAAAAAAAAAAAAAALL))
        {
          *(_DWORD *)(a4 + 168) = 458754;
        }
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CMSAttributeParseSigningTime(unint64_t *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_10;
  }
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    goto LABEL_7;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v3 = v4;
  if (v4 > v5) {
LABEL_10:
  }
    __break(0x5519u);
  *a1 = v4;
  a1[1] = v5;
LABEL_7:
  if (v3 < 0x5555555555555556) {
    return v3 - 0x5555555555555556 == a1[1];
  }
  __break(0x5513u);
  return result;
}

uint64_t CMSAttributeParseAppleHashAgility(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v7 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (*(_DWORD *)(a4 + 104)) {
        return 1;
      }
      if (v7 <= v7 - 0x5555555555555556)
      {
        *(void *)(a4 + 112) = v7;
        *(void *)(a4 + 120) = 0xAAAAAAAAAAAAAAAALL;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t CMSAttributeParseSMIMECapabilities(void *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 >= 0x5555555555555556uLL) {
      __break(0x5513u);
    }
    else {
      return *a1 - 0x5555555555555556 == a1[1];
    }
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!result) {
        return result;
      }
      if (v5 != v6) {
        return 0;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(void *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_6;
  }
  if (ccder_blob_decode_tl()) {
    return 0;
  }
  if (*a1 > a1[1]) {
LABEL_6:
  }
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      unint64_t v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1;
      }
LABEL_42:
      __break(0x5519u);
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v11 = *a1;
    unint64_t v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v11;
      if (v16 < v11) {
        goto LABEL_42;
      }
      *a3 = v11;
      a3[1] = 0;
      int v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v12 = *a1;
    unint64_t v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v12;
      if (v17 < v12) {
        goto LABEL_42;
      }
      *a3 = v12;
      a3[1] = 0;
      int v8 = 2;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v13 = *a1;
    unint64_t v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v13;
      if (v18 < v13) {
        goto LABEL_42;
      }
      *a3 = v13;
      a3[1] = 0;
      int v8 = 4;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 5;
      goto LABEL_23;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v14 = *a1;
    unint64_t v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v14;
      if (v19 < v14) {
        goto LABEL_42;
      }
      *a3 = v14;
      a3[1] = 0;
      int v8 = 6;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v15 = *a1;
    unint64_t v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v15;
      if (v20 < v15) {
        goto LABEL_42;
      }
      *a3 = v15;
      a3[1] = 0;
      int v8 = 7;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      int v9 = 8;
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if (result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3) {
        __break(0x5519u);
      }
      *unint64_t v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    uint64_t result = 0;
    if (a5) {
      *a5 = v6;
    }
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_11;
  }
  v10[0] = a1;
  v10[1] = a1 + a2;
  uint64_t result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!result)
  {
    uint64_t result = 720914;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = v13;
      if ((void)v13)
      {
        uint64_t result = 0;
        if (a5)
        {
          if (a6)
          {
            uint64_t result = 0;
            *a5 = *((void *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_7;
  }
  v7[0] = a1;
  v7[1] = a1 + a2;
  uint64_t result = X509CertificateParse((unint64_t *)v8, v7);
  if (!result) {
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  }
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateCertifiedChip(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  __b[152] = *MEMORY[0x263EF8340];
  uint64_t result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_34;
  }
  if (a1 + a2 < a1) {
    goto LABEL_35;
  }
  unint64_t v30 = a1;
  unint64_t v31 = a1 + a2;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if (result) {
    return result;
  }
  uint64_t result = 327690;
  if (v30 != v31) {
    return result;
  }
  if (v32 != 2) {
    return 327692;
  }
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  uint64_t v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *uint64_t v22 = (uint64_t)&__b[74];
  if ((void *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL) {
LABEL_34:
  }
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(void *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  uint64_t result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if (result) {
    return result;
  }
  uint64_t v23 = **(void **)(v33[1] + 8);
  uint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0) {
    goto LABEL_35;
  }
  uint64_t v28 = a3;
  unint64_t v29 = a4;
  long long v24 = oidForPubKeyLength();
  uint64_t result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, (uint64_t)v24, v23 + 16, v23 + 40);
  if (result) {
    return result;
  }
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0) {
      goto LABEL_35;
    }
    if (compare_octet_string_raw(v23 + 248, a9, a10)) {
      return 590085;
    }
  }
  unint64_t v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  int v26 = result;
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 327691;
  }
  if (!v25 || v26) {
    return result;
  }
  if (a11) {
    *a11 = (*(void *)(v25 + 240) & a13) != 0;
  }
  if (!a7 || !a8) {
    return 0;
  }
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304) {
    goto LABEL_35;
  }
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if (result) {
    return result;
  }
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  uint64_t result = CTCopyUID((uint64_t)v27, a7, a8);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, BOOL *a7)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicyYonkers, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, void *a7, void *a8, unsigned char *a9, uint64_t a10, BOOL *a11)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&X509PolicySensor, 0x10000000000);
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, void *a10, long long *a11)
{
  v41[116] = *MEMORY[0x263EF8340];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v36 = a1 + a2;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = a1;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if (result) {
    return result;
  }
  if (v35 != v36) {
    return 327690;
  }
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    uint64_t v20 = v38[0];
    long long v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0]) {
      long long v21 = &v38[1];
    }
    *long long v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7) {
      BOOL v23 = a8 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    long long v31 = *a11;
    v32[0] = *((unsigned char *)a11 + 16);
    if (v23) {
      char v25 = a3;
    }
    else {
      char v25 = 1;
    }
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(long long *)((char *)a11 + 24);
      long long v27 = (_UNKNOWN **)*((void *)a11 + 5);
    }
    else
    {
      uint64_t v26 = *((void *)a11 + 4);
      *(void *)&v32[8] = v34;
      *(void *)&v32[16] = v26;
      long long v27 = oidForPubKeyLength();
    }
    uint64_t v28 = *((void *)a11 + 6);
    *(void *)&v32[24] = v27;
    uint64_t v33 = v28;
    uint64_t result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!result)
    {
      unint64_t v29 = (void *)v38[0];
      if (!a5 || !a6 || !v38[0] || (uint64_t result = X509CertificateParseKey(v38[0], a5, a6), !result))
      {
        if (a10 && v29)
        {
          uint64_t v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        uint64_t result = 0;
        if (a9)
        {
          if (v29)
          {
            uint64_t result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      uint64_t v22 = (unsigned char *)v38[2];
      while (v22[265])
      {
        uint64_t v22 = (unsigned char *)*((void *)v22 + 34);
        if (!v22)
        {
          uint64_t v22 = (unsigned char *)v38[2];
          break;
        }
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = v39;
  }
  uint64_t result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, void *a4, void *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, X509PolicySatori);
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, X509PolicyACRT);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, X509PolicyUcrt);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, X509PolicyUcrt);
}

uint64_t CTEvaluatePragueSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_2309E1FA0;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_2309E1FB0;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(void *a1, uint64_t a2)
{
  uint64_t result = 327700;
  unint64_t v4 = a1[31];
  unint64_t v5 = a1[32];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 327707;
  }
  uint64_t v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0) {
      return result;
    }
    if (!__CFADD__(v4, v5))
    {
      unint64_t v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13) {
          return 327704;
        }
        uint64_t v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          uint64_t v10 = 0;
          uint64_t v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            int v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6) {
              return 327705;
            }
            if (v17 == 20) {
              break;
            }
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14) {
              goto LABEL_39;
            }
            unint64_t v19 = (v18 - 48);
            unint64_t v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20)) {
              goto LABEL_40;
            }
            unint64_t v21 = v19 * v20;
            BOOL v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15) {
              goto LABEL_38;
            }
            ++v17;
            if ((unint64_t)--v16 < v4) {
              goto LABEL_23;
            }
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5)) {
    goto LABEL_41;
  }
  unint64_t v8 = v4 + v5;
  if (v4 + v5 == -1) {
    goto LABEL_41;
  }
  unint64_t v9 = (unsigned char *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    char v12 = 0;
    unint64_t v13 = 0;
    uint64_t v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      unint64_t v14 = (unint64_t)(*v9 & 0x7F) << v12;
      BOOL v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15) {
        goto LABEL_38;
      }
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4) {
          continue;
        }
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  uint64_t v10 = 0;
LABEL_23:
  if (v10 == a2) {
    return 0;
  }
  else {
    return 589829;
  }
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = 327702;
  if (*(void *)(a1 + 232) && *(void *)(a1 + 224))
  {
    v7[1] = a3;
    unint64_t v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    unsigned int v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(void, int *, uint64_t))CTCompareGeneralNameToHostname, (uint64_t)v7);
    if ((_BYTE)v8) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = 327706;
    }
    if (v4) {
      return v4;
    }
    else {
      return v5;
    }
  }
  return v3;
}

uint64_t CTCompareGeneralNameToHostname(uint64_t result, void *a2, unint64_t a3)
{
  if (result != 2) {
    return 1;
  }
  unsigned int v4 = *(char **)a3;
  size_t v5 = *(void *)(a3 + 8);
  size_t v6 = ~*(void *)a3;
  if (v5 > v6) {
    goto LABEL_50;
  }
  uint64_t v7 = &v4[v5];
  if (&v4[v5] == (char *)-1) {
    goto LABEL_50;
  }
  unint64_t v8 = v7 - 1;
  if (v7) {
    BOOL v9 = v8 >= v4;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9 || a3 + 24 < a3) {
    goto LABEL_49;
  }
  int v11 = *v8;
  uint64_t result = compare_octet_string((uint64_t)a2, a3);
  if (!result) {
    goto LABEL_48;
  }
  if (v11 != 46) {
    goto LABEL_15;
  }
  size_t v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      uint64_t result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if (result)
      {
LABEL_15:
        unint64_t v13 = a2[1];
        if (v13 < 3) {
          return 1;
        }
        unint64_t v14 = (unsigned char *)*a2;
        if (*(unsigned char *)*a2 != 42) {
          return 1;
        }
        if (v14 != (unsigned char *)-1)
        {
          BOOL v15 = v14 + 1;
          if (v14[1] == 46)
          {
            uint64_t v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL) {
              uint64_t v16 = (uint64_t)v14;
            }
            uint64_t v17 = -v16;
            uint64_t v18 = 2;
            uint64_t result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14) {
                goto LABEL_49;
              }
              if (v14[v18] == 46)
              {
                if (v13 == v18) {
                  return 1;
                }
                size_t v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    unint64_t v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4) {
                      goto LABEL_49;
                    }
                    if (*v20 == 46) {
                      break;
                    }
                    if (v5 == ++v19)
                    {
                      size_t v19 = v5;
                      break;
                    }
                  }
                }
                size_t v22 = v13 - 1;
                BOOL v9 = v5 >= v19;
                size_t v23 = v5 - v19;
                if (!v9) {
                  goto LABEL_51;
                }
                if (v22 == v23)
                {
                  if (v19 > v6) {
                    goto LABEL_50;
                  }
                  uint64_t result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!result) {
                    goto LABEL_48;
                  }
                }
                if (v11 != 46) {
                  return 1;
                }
                if (!v23) {
                  goto LABEL_51;
                }
                if (v22 != v23 - 1) {
                  return 1;
                }
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22)) {
                    goto LABEL_48;
                  }
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18) {
                return result;
              }
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      uint64_t result = 0;
      *(unsigned char *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v20 = 0xAAAAAAAA00AAAA01;
  unint64_t v21 = &null_octet;
  long long v19 = xmmword_2309E1FC0;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  size_t v22 = &null_octet;
  size_t v23 = &null_octet;
  long long v24 = &CTOctetServerAuthEKU;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!result)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      uint64_t result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!result)
      {
        uint64_t result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!result) {
          return CTVerifyHostname((uint64_t)v16, a3, a4);
        }
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTGetSEKType(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_10:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_10;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3)) {
    return 0;
  }
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKTestRootSKID)) {
    return compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKProdRootSKID) == 0;
  }
  return 2;
}

uint64_t CTEvaluateSEK(char a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = 327712;
  if ((a1 & 3) != 0)
  {
    if ((a1 & 1) == 0
      || (uint64_t result = CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, 0, 0, 0, 0, X509PolicySEK), result))
    {
      if ((a1 & 2) != 0) {
        return CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, (uint64_t)&_sek_test_root_public_key, 97, 0, 0, X509PolicySEK);
      }
    }
  }
  return result;
}

uint64_t CTCopyUID(uint64_t result, unsigned char *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  if (__CFADD__(*(void *)result, v4)) {
    goto LABEL_31;
  }
  unint64_t v6 = v5 + v4;
  uint64_t v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      int v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6) {
        continue;
      }
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1) {
    goto LABEL_31;
  }
  unint64_t v8 = v7 + 1;
  int v3 = 327693;
  uint64_t result = 327693;
  if ((unint64_t)(v7 + 1) >= v6) {
    return result;
  }
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (void)v8)) {
    goto LABEL_31;
  }
  if (v6 - (void)v8 != 2 * a3) {
    return (v3 + 1);
  }
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  BOOL v9 = v7 + 2;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3]) {
      return result;
    }
    int v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8) {
      goto LABEL_34;
    }
    size_t v12 = &asciiNibbleToByte[*v11];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v12 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v12 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    if (v11 < v7) {
      goto LABEL_34;
    }
    unint64_t v14 = &asciiNibbleToByte[*v9];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v14 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v14 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    unsigned int v15 = *v12;
    uint64_t result = 327695;
    if (v15 > 0xF) {
      return result;
    }
    unsigned int v16 = *v14;
    if (v16 > 0xF) {
      return result;
    }
    if (v10 < a2) {
      goto LABEL_34;
    }
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9) {
      goto LABEL_31;
    }
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  unint64_t v68 = 0;
  uint64_t v69 = 0;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl()) {
    return 720917;
  }
  unint64_t v18 = v64;
  unint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  unint64_t v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  unint64_t v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152))) {
    return 720918;
  }
  if (!ccder_blob_decode_tl()) {
    return 720919;
  }
  unint64_t v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  unint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  unint64_t v64 = v24;
  if (!ccder_blob_decode_tl()) {
    return 720920;
  }
  unint64_t v26 = v64;
  unint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  unint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  unint64_t v64 = v28;
  if (!ccder_blob_decode_tl()) {
    return 720921;
  }
  unint64_t v29 = v64;
  unint64_t v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  unint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  unint64_t v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return 720922;
  }
  unint64_t v33 = v64;
  unint64_t v34 = v68;
  unint64_t v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    unint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    unint64_t v63 = v65;
    unint64_t v64 = v36;
    unint64_t v62 = v36;
    if (ccder_blob_decode_tl()) {
      return 720923;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl()) {
      return 720924;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v60 = v62;
      unint64_t v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68) {
        return 720925;
      }
      unint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      unint64_t v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      unint64_t v61 = v60 + v68;
      *(unsigned char *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        BOOL v39 = a4 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      int v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        unsigned __int8 v53 = 0;
        int v41 = 0;
        do
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          char v57 = 0;
          uint64_t v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926;
          }
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          unint64_t v54 = v60;
          unint64_t v55 = v60 + v56;
          if (!ccder_blob_decode_tl()) {
            return 720927;
          }
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          unint64_t v58 = v54;
          unint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (!der_get_BOOLean(&v54, 1, &v57)) {
            return 720928;
          }
          if (!ccder_blob_decode_tl()) {
            return 720929;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929;
          }
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            unint64_t v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v54;
            *(void *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 15)
            {
              uint64_t v16 = 720930;
              if ((v41 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 19)
            {
              uint64_t v16 = 720931;
              if ((v41 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v54, (void *)(a1 + 200), (unsigned char *)(a1 + 265)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 35)
            {
              uint64_t v16 = 720932;
              if ((v41 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 14)
            {
              uint64_t v16 = 720933;
              if ((v41 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 37)
            {
              uint64_t v16 = 720934;
              if ((v41 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 17)
            {
              uint64_t v16 = 720935;
              if ((v41 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            uint64_t v16 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v58, (uint64_t)v70, v53)) {
              return v16;
            }
            uint64_t result = X509ExtensionParseAppleExtension((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(unsigned char *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          unint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          unint64_t v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38) {
        return 720925;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      unint64_t v64 = v37;
    }
    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v16 = 720915;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40))) {
        return 720937;
      }
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = 0;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!result) {
        return 720938;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          unint64_t v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            unint64_t v52 = v67;
            if (v66 <= v67)
            {
              uint64_t v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(void *a1, int a2, unsigned char *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if (result) {
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    uint64_t result = der_get_BOOLean(a1, 1, a3);
    if (result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556 != a1[1]) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16 * a3);
      *unint64_t v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_275;
    }
LABEL_159:
    int v44 = 0;
LABEL_160:
    if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 27)
    {
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        unint64_t v52 = *(void *)result;
        unint64_t v51 = *(void *)(result + 8);
        if (a5)
        {
          if (v52 > v51) {
            goto LABEL_281;
          }
          *a5 = v52;
          a5[1] = v51 - v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if (v52 <= v51)
        {
          *(void *)uint64_t result = v51;
          return 1;
        }
LABEL_281:
        __break(0x5519u);
        return result;
      }
    }
LABEL_242:
    unint64_t v52 = *(void *)result;
    unint64_t v51 = *(void *)(result + 8);
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0;
LABEL_205:
      uint64_t v24 = v54 | v55;
LABEL_275:
      *a4 = v24;
      return 1;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_209;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      return X509ExtensionParseGenericSSLMarker();
    }
    int v44 = 1;
    goto LABEL_160;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_242;
    }
    goto LABEL_159;
  }
  if (*(void *)a2 == 0xB6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    char v56 = 0;
    uint64_t result = der_get_BOOLean((void *)result, 0, &v56);
    if (result)
    {
      uint64_t v53 = 0x10000080002;
      if (!v56) {
        uint64_t v53 = 0x20000040001;
      }
      *a4 |= v53;
    }
    return result;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 44)
  {
    return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x8000000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xA6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_242;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 29)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }

  return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  if (!ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  uint64_t v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
    goto LABEL_31;
  }
  unint64_t v6 = v4 + v5;
  if (v4 > v6) {
    goto LABEL_30;
  }
  uint64_t v10 = 655361;
  unint64_t v14 = *a1;
  unint64_t v15 = v6;
  if (!ccder_blob_decode_tl()) {
    return v10;
  }
  if (!ccder_blob_decode_tl()) {
    return 655363;
  }
  if (v14 >= 0x5555555555555556) {
LABEL_31:
  }
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15) {
    goto LABEL_30;
  }
  unint64_t v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl()) {
    return 655362;
  }
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  unint64_t v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13) {
    goto LABEL_30;
  }
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13) {
    goto LABEL_30;
  }
  if (!ccder_blob_decode_bitstring()) {
    return 655364;
  }
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15) {
    return 0;
  }
  else {
    return 655365;
  }
}

uint64_t X509CertificateParseKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = 327691;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!result)
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v16 = 0uLL;
  long long v15 = 0uLL;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v7 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v16, (unint64_t *)&v15, &v13);
  if (v7) {
    return v7;
  }
  uint64_t v7 = 655632;
  int v9 = compare_octet_string((uint64_t)&v16, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string((uint64_t)&v16, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return 655617;
    }
  }
  unint64_t v12 = v10;
  if (((a1 & 1) == 0 || compare_octet_string_raw(a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw(a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw(a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw(a4, &CTOidSha512, 9uLL)))
  {
    return v7;
  }
  uint64_t result = v13;
  if ((v14 || !v13) && (a3[1] || !*a3))
  {
    if (v12(v13)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v10[2] = v6;
  v10[3] = v6;
  v10[0] = v6;
  v10[1] = v6;
  v9[0] = v10;
  v9[1] = 64;
  v8[0] = 0;
  v8[1] = 0;
  uint64_t result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v9, v8);
  if (!result) {
    return X509CertificateCheckSignatureDigest(a1, a2, v9, (uint64_t)v8);
  }
  return result;
}

uint64_t X509MatchSignatureAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(void *)(a3 + 8) < 0x20uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_12;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(void *)(a3 + 8) < 0x14uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!result) {
    goto LABEL_10;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if (result) {
    return 656640;
  }
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(void *)(a3 + 8) >= 0x30uLL)
  {
    *(void *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[2] = v7;
  v16[3] = v7;
  v16[0] = v7;
  v16[1] = v7;
  uint64_t v14 = v16;
  uint64_t v15 = 64;
  long long v13 = 0uLL;
  uint64_t matched = X509MatchSignatureAlgorithm(a4, a5, (uint64_t)&v14, &v13);
  if (matched) {
    return matched;
  }
  uint64_t matched = 655617;
  int v9 = compare_octet_string(a2, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string(a2, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return matched;
    }
  }
  uint64_t result = *a1;
  if ((a1[1] || !result) && (!v14 || v15))
  {
    if (v10(result)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(void, int *, uint64_t), uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = *(void *)(a1 + 224);
  uint64_t v4 = *(void *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_11;
  }
  unint64_t v10 = *(void *)(a1 + 224);
  unint64_t v11 = v5;
  while (1)
  {
    if (v10 >= v11) {
      return 0;
    }
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0) {
      break;
    }
    if ((a2(v9[0], &v9[1], a3) & 1) == 0) {
      return 0;
    }
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v20 = v3;
  if (__CFADD__(*a1, v3)) {
    goto LABEL_59;
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  uint64_t v6 = 720901;
  unint64_t v18 = *a1;
  unint64_t v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20) {
        return 720898;
      }
      unint64_t v2 = v18;
      if (__CFADD__(v18, v20)) {
        break;
      }
      unint64_t v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19) {
        goto LABEL_58;
      }
      unint64_t v16 = v18;
      unint64_t v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl()) {
          return 720899;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20 || v16 + v20 > v17) {
          goto LABEL_58;
        }
        unint64_t v15 = v16 + v20;
        if (!ccder_blob_decode_tl()) {
          return 720900;
        }
        unint64_t v2 = v16 + v20;
        if (v16 > v15) {
          goto LABEL_58;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20) {
          goto LABEL_58;
        }
        unint64_t v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(unsigned char *)(v16 + 2) == 3)
        {
          unint64_t v12 = v16 + v20;
          unint64_t v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15) {
              goto LABEL_58;
            }
            unint64_t v12 = v16 + v20;
            unint64_t v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15) {
                goto LABEL_58;
              }
              unint64_t v12 = v16 + v20;
              unint64_t v13 = v16 + v20;
              if (!ccder_blob_decode_tl()) {
                return v6;
              }
            }
          }
          if (__CFADD__(v12, v20)) {
            goto LABEL_59;
          }
          unint64_t v2 = v12 + v20;
          if (v15 != v12 + v20) {
            return 720902;
          }
          if (v13 < v12 || v20 > v13 - v12) {
            goto LABEL_58;
          }
          *a2 = v12;
          a2[1] = v20;
        }
        unint64_t v7 = v18 + v20;
        if (v2 > v17 || v16 > v2) {
          goto LABEL_58;
        }
        unint64_t v16 = v2;
      }
      if (v2 != v7) {
        return 720903;
      }
      unint64_t v4 = v19;
      if (v2 > v19 || v18 > v2) {
        goto LABEL_58;
      }
      unint64_t v18 = v2;
      if (v2 >= v19) {
        goto LABEL_46;
      }
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4) {
    return 720904;
  }
  if (a2[1] && *a2) {
    return 0;
  }
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  BOOL result = 0;
  v6[1] = *MEMORY[0x263EF8340];
  time_t v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1) {
    return !X509CertificateGetNotBefore(a1, v6)
  }
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x263EF8340];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x263EF8340];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2 = time(0);

  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  time_t v6[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = 720906;
  if (!result) {
    return v1;
  }
  unint64_t v2 = *(void *)(result + 72);
  uint64_t v3 = *(void *)(result + 80);
  if (!v2 || v3 == 0) {
    return v1;
  }
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(void *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6)) {
        return 720907;
      }
      if (ccder_blob_decode_Time(v6)) {
        return 0;
      }
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = 720909;
  if (!a1) {
    return v2;
  }
  unint64_t v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF) {
    return v2;
  }
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  unint64_t v7 = *a1;
  if (v4 == (const char *)13)
  {
    uint64_t result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150) {
      v11.tm_year -= 100;
    }
  }
  else
  {
    uint64_t result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  int v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(void)*a1]) {
      return 720910;
    }
    time_t v10 = timegm(&v11);
    if (v10 == -1) {
      return 720911;
    }
    uint64_t v2 = 0;
    if (a2) {
      *a2 = v10;
    }
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if (ccder_blob_decode_tl()) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }
  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    unint64_t v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556) {
        return 0;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556) {
        return 0;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if (result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if ((unint64_t)v12 >= v10 - 1) {
        break;
      }
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0;
      }
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          unint64_t v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *X509ExtensionParseMFI4Properties(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  BOOL v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      uint64_t result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    unint64_t v9 = result;
    uint64_t v10 = 0;
    unint64_t v11 = a2 + 304 * a3;
    unint64_t v12 = ~a2;
    BOOL v13 = a4 + 1;
    BOOL v14 = (void *)(a2 + 272);
    uint64_t v15 = a3 - 1;
    unint64_t v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      unint64_t v16 = v14 - 34;
      if (v14 != (void *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      uint64_t result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if (result) {
        return result;
      }
      if (v10)
      {
        if ((unint64_t)v16 < a2) {
          goto LABEL_30;
        }
        if ((unint64_t)(v14 + 4) > v11) {
          goto LABEL_30;
        }
        unint64_t v17 = (void *)*v13;
        *BOOL v14 = 0;
        v14[1] = v17;
        if (v14 != (void *)272 && (unint64_t)v16 >= v11) {
          goto LABEL_30;
        }
        *unint64_t v17 = v16;
        *BOOL v13 = (unint64_t)v14;
      }
      else
      {
        uint64_t v18 = *a4;
        *(void *)(a2 + 272) = *a4;
        if (v18) {
          unint64_t v19 = (unint64_t *)(v18 + 280);
        }
        else {
          unint64_t v19 = v13;
        }
        unint64_t *v19 = v21;
        *a4 = v16;
        *(void *)(a2 + 280) = a4;
      }
      uint64_t v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        BOOL v6 = v15 == v10++;
        if (!v6) {
          continue;
        }
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  for (uint64_t i = *a1; i; uint64_t i = *(void *)(i + 272))
  {
    if (*(void *)(i + 192) && !compare_octet_string(a2, i + 184)) {
      break;
    }
  }
  return i;
}

void *X509ChainResetChain(void *result, void *a2)
{
  *uint64_t result = 0;
  result[1] = result;
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      uint64_t v2 = (void *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (!a1) {
    return 327691;
  }
  unint64_t v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  uint64_t v8 = (uint64_t)(a1 + 15);
  uint64_t result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if (result)
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (unint64_t v7 = (void *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        unint64_t v7 = (void *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1)) {
            return 0;
          }
          uint64_t BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4) {
            unsigned int v16 = 0;
          }
          else {
            unsigned int v16 = 524296;
          }
          if (BAARootUsingKeyIdentifier) {
            return 0;
          }
          else {
            return v16;
          }
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          unint64_t v7 = (void *)v7[34];
          if (!v7) {
            goto LABEL_16;
          }
        }
      }
      unint64_t v12 = (void *)*a3;
      if (*a3) {
        break;
      }
LABEL_13:
      BOOL v13 = (void *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *BOOL v13 = v7;
      a3[1] = v7 + 36;
      uint64_t v8 = (uint64_t)(v7 + 15);
      int v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      uint64_t result = 0;
      if (!v14) {
        return result;
      }
    }
    while (v12 != v7)
    {
      unint64_t v12 = (void *)v12[36];
      if (!v12) {
        goto LABEL_13;
      }
    }
    return 524297;
  }
  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  uint64_t v2 = &numAppleRoots;
  if (!a2) {
    uint64_t v2 = &numAppleProdRoots;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = result;
    for (uint64_t i = (uint64_t *)&AppleRoots; i < (uint64_t *)&UcrtRootPublicKey && i >= (uint64_t *)&AppleRoots; ++i)
    {
      uint64_t v7 = *i;
      uint64_t result = compare_octet_string(v4, *i + 184);
      if (!result) {
        return v7;
      }
      if (!--v3) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1 = numBAARoots;
  if (numBAARoots)
  {
    uint64_t v2 = result;
    for (uint64_t i = (uint64_t *)&BAARoots; i < (uint64_t *)&SEKTestRootPublicKey && i >= (uint64_t *)&BAARoots; ++i)
    {
      uint64_t v5 = *i;
      uint64_t result = compare_octet_string(v2, *i + 184);
      if (!result) {
        return v5;
      }
      if (!--v1) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(void *a1, uint64_t *a2, void *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a2;
  v35[4] = *MEMORY[0x263EF8340];
  uint64_t v8 = *a2;
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 48);
    if (v9)
    {
      if (*(void *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208)) {
          return 327701;
        }
        uint64_t v8 = *v6;
      }
    }
  }
  if (v8)
  {
    unint64_t v31 = v6;
    unint64_t v32 = a4;
    unint64_t v11 = 0;
    int v12 = 0;
    char v33 = 0;
    uint64_t v13 = -1;
    while (1)
    {
      unint64_t v14 = *(void *)(v8 + 288);
      unint64_t v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        char v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        char v16 = 0;
        unint64_t v15 = v8 + 304;
        unint64_t v14 = v8;
        goto LABEL_11;
      }
      if (!a3) {
        return v12 | 0x9000Du;
      }
      if (*(unsigned char *)(a3 + 16))
      {
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(void *)(a3 + 24)) {
          goto LABEL_58;
        }
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }
      unint64_t v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      unint64_t v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier) {
        goto LABEL_10;
      }
LABEL_58:
      if (!*(unsigned char *)(a3 + 19)) {
        return v12 | 0x9000Du;
      }
      unint64_t v14 = 0;
      char v16 = 1;
LABEL_11:
      if (v11 && *(void *)(v8 + 32) >= 2uLL)
      {
        if (!*(unsigned char *)(v8 + 265))
        {
          int v30 = 589825;
          return v12 | v30;
        }
        if ((*(unsigned char *)(v8 + 264) & 4) == 0)
        {
          int v30 = 589826;
          return v12 | v30;
        }
      }
      unint64_t v17 = *(void *)(v8 + 200);
      if (v17) {
        BOOL v18 = v17 >= v11;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        int v30 = 589827;
        return v12 | v30;
      }
      if (*(unsigned char *)(v8 + 266))
      {
        int v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        int v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(void *)(v8 + 168) && *(void *)(v8 + 176))
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        if (compare_octet_string(v8 + 168, v14 + 184)) {
          return v12 | 0x9000Au;
        }
      }
      if (a3 && v11 && (*(void *)(v8 + 240) & *(void *)(a3 + 8)) == 0) {
        X509PolicySetFlagsForCommonNames(v8);
      }
      if (v14 == v8 && !*(void *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(unsigned char *)(a3 + 18) && !X509CertificateIsValid(v8)) {
            return v12 | 0x90009u;
          }
          uint64_t v19 = *(void *)(a3 + 8);
          if (!v11 && (*(void *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            uint64_t v19 = *(void *)(a3 + 8);
          }
          v13 &= *(void *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            int v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(void *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        uint64_t result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40);
        if (result) {
          return result;
        }
      }
      unint64_t v21 = v11 + 1;
      if (v11 == -1) {
        goto LABEL_99;
      }
      uint64_t v8 = *(void *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        BOOL v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3) {
          goto LABEL_61;
        }
        goto LABEL_87;
      }
    }
  }
  unint64_t v21 = 0;
  uint64_t v13 = -1;
  if (!a3) {
    goto LABEL_87;
  }
LABEL_61:
  if (*(void *)a3)
  {
    unint64_t v22 = v21;
    if (v8)
    {
      unint64_t v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(void *)a3 != v22) {
      return (v22 << 8) | 0x90006u;
    }
  }
  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 || !*(void *)(v23 + 8))
  {
    if (!*(unsigned char *)(a3 + 16)) {
      goto LABEL_87;
    }
    int v24 = v21 << 8;
    uint64_t v25 = **(void **)(v6[1] + 8);
LABEL_75:
    uint64_t v27 = 184;
    if (v8) {
      uint64_t v27 = 168;
    }
    uint64_t v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28) {
      return v24 | 0x9000Bu;
    }
    uint64_t v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40))
    {
      goto LABEL_87;
    }
    int v26 = 589836;
    return v24 | v26;
  }
  int v24 = v21 << 8;
  uint64_t v25 = **(void **)(v6[1] + 8);
  if (*(unsigned char *)(a3 + 16)) {
    goto LABEL_75;
  }
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    int v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(void *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(void *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(void *)(a3 + 32), *(void *)(a3 + 40), v25 + 16, v25 + 40))goto LABEL_72; {
  }
    }
  else if (!compare_octet_string(*(void *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(void *)(a3 + 40));
  }
LABEL_87:
  uint64_t result = 0;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

void authInstalllogHandler_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2309BC000, v0, v1, "AMAuthInstall: %{public}s", v2, v3, v4, v5, v6);
}

void authInstalllogHandler_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_2309BC000, v0, OS_LOG_TYPE_DEBUG, "AMAuthInstall: %{public}s", v1, 0xCu);
}

void __authInstalllogHandler_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return MEMORY[0x270F980B0]();
}

uint64_t AMAuthInstallApImg4ForceServerSigning()
{
  return MEMORY[0x270F980C0]();
}

uint64_t AMAuthInstallApImg4ServerRequestAddRequiredTags()
{
  return MEMORY[0x270F980D8]();
}

uint64_t AMAuthInstallApSetParameters()
{
  return MEMORY[0x270F980E0]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x270F980F0]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x270F980F8]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x270F98118]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x270F98120]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x270F98128]();
}

uint64_t AMAuthInstallSupportGetLibraryVersionString()
{
  return MEMORY[0x270F98148]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x270F97B40]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x270F4A8C0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t SBGetScreenLockStatus()
{
  return MEMORY[0x270F770E8]();
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return MEMORY[0x270F771E0]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x270EFD650](allocator, protection, flags, error);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x270ED8888]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x270ED88B0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x270ED88B8]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x270ED88C0]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x270ED88E8]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x270ED8918]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x270ED89A0]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x270ED89B8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x270ED8A70]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x270ED8A78]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x270ED8A80]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x270ED8A98]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x270ED8AA0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x270ED8AB8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x270ED8AD8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x270ED8AE0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x270ED8B00]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x270ED8B08]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x270ED8B28]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x270ED8D08]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x270ED8D40]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x270ED8D60]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x270ED8E70]();
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x270EDB670](a1, a2, a3);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x270EDB938](a1);
}