uint64_t free_CertificateSerialNumber()
{
  return _asn1_free_top();
}

uint64_t decode_AlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t nsheim_decode_ContentInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];

  return _asn1_decode_top();
}

uint64_t free_ContentInfo()
{
  return _asn1_free_top();
}

id decodeEmbeddedCMSContent(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (!v8) {
    goto LABEL_23;
  }
  if ([v7 isEqualToString:@"1.2.840.113549.1.7.2"])
  {
    v10 = MSCMSSignedData;
LABEL_6:
    v11 = [(__objc2_class *)v10 decodeMessageSecurityObject:v8 options:v9 error:a4];
    goto LABEL_24;
  }
  if ([v7 isEqualToString:@"1.2.840.113549.1.7.3"])
  {
    v10 = MSCMSEnvelopedData;
    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"1.2.840.113549.1.7.5"])
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6);
    }
    v12 = MS_DEFAULT_LOG_INTERNAL;
    if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    LOWORD(v18) = 0;
    v13 = "Found unsupported content type: DigestedData";
    goto LABEL_22;
  }
  if ([v7 isEqualToString:@"1.2.840.113549.1.7.6"])
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6_1);
    }
    v12 = MS_DEFAULT_LOG_INTERNAL;
    if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    LOWORD(v18) = 0;
    v13 = "Found unimplemented contented type: EncryptedData";
    goto LABEL_22;
  }
  if ([v7 isEqualToString:@"1.2.840.113549.1.9.16.1.2"])
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_9);
    }
    v12 = MS_DEFAULT_LOG_INTERNAL;
    if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    LOWORD(v18) = 0;
    v13 = "Found unsupported content type: AuthenticatedData";
LABEL_22:
    _os_log_impl(&dword_20D8A1000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v18, 2u);
    goto LABEL_23;
  }
  if ([v7 isEqualToString:@"1.2.840.113549.1.9.16.1.23"])
  {
    v10 = MSCMSAuthEnvelopedData;
    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"1.2.840.113549.1.9.16.1.9"])
  {
    v10 = MSCMSCompressedData;
    goto LABEL_6;
  }
  if (MS_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_14_0);
  }
  v15 = (void *)MS_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    v16 = v15;
    v17 = [v7 OIDString];
    int v18 = 138412290;
    v19 = v17;
    _os_log_impl(&dword_20D8A1000, v16, OS_LOG_TYPE_ERROR, "Found unknown content type: %@", (uint8_t *)&v18, 0xCu);
  }
LABEL_23:
  v11 = 0;
LABEL_24:

  return v11;
}

void sub_20D8A428C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t copy_AlgorithmIdentifier()
{
  return _asn1_copy_top();
}

void *NSDataFromAny(void *a1)
{
  if (a1)
  {
    a1 = [MEMORY[0x263EFF8F8] dataWithBytes:a1[1] length:*a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_20D8A4908(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id NSDataFromIntegerArray(_DWORD *a1, unint64_t a2)
{
  if (a2 >= 2 && *a1 <= 6u && (unsigned int v3 = a1[1], v3 <= 0x27))
  {
    char v14 = v3 + 40 * *a1;
    v4 = [MEMORY[0x263EFF990] dataWithBytes:&v14 length:1];
    if (a2 >= 3)
    {
      unint64_t v7 = 2;
      do
      {
        uint64_t v8 = 0;
        unsigned int v9 = a1[v7];
        char v13 = v9 & 0x7F;
        int16x8_t v10 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v9), (uint32x4_t)xmmword_20D8E1B60);
        v10.i64[0] = *(void *)&vmovn_s32((int32x4_t)v10) | 0x80008000800080;
        unsigned __int32 v12 = vmovn_s16(v10).u32[0];
        do
          int v11 = *((unsigned __int8 *)&v12 + v8++);
        while (v11 == 128);
        [v4 appendBytes:(char *)&v12 + v8 - 1 length:6 - v8];
        unint64_t v7 = (v7 + 1);
      }
      while (v7 < a2);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id NSStringFromOIDData(void *a1)
{
  id v1 = a1;
  if (![v1 length] || (unint64_t)objc_msgSend(v1, "length") > 0x20)
  {
    id v2 = 0;
    goto LABEL_20;
  }
  id v3 = v1;
  unsigned int v4 = *(unsigned __int8 *)[v3 bytes];
  id v5 = v3;
  unsigned __int8 v6 = *(unsigned char *)[v5 bytes] % 0x28u;
  unsigned int v7 = 40 * (v4 / 0x28) - 80;
  if (v4 <= 0x77) {
    uint64_t v8 = v4 / 0x28;
  }
  else {
    uint64_t v8 = 2;
  }
  if (v4 <= 0x77) {
    unsigned int v7 = 0;
  }
  unsigned int v9 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%u.%u", v8, v7 + v6);
  if ((unint64_t)[v5 length] < 2)
  {
LABEL_17:
    id v2 = v9;
    goto LABEL_19;
  }
  int v10 = 0;
  int v11 = 0;
  unsigned int v12 = 2;
  uint64_t v13 = 1;
  unsigned int v14 = 2;
  while (1)
  {
    id v15 = v5;
    uint64_t v16 = *(unsigned char *)([v15 bytes] + v13) & 0x7F | (v11 << 7);
    id v17 = v15;
    if (*(char *)([v17 bytes] + v13) < 0) {
      break;
    }
    objc_msgSend(v9, "appendFormat:", @".%u", v16);
    if (v14 > 0x13) {
      goto LABEL_18;
    }
    int v10 = 0;
    int v11 = 0;
    ++v14;
LABEL_16:
    uint64_t v13 = v12;
    if ([v17 length] <= (unint64_t)v12++) {
      goto LABEL_17;
    }
  }
  if (++v10 != 4)
  {
    int v11 = v16;
    goto LABEL_16;
  }
LABEL_18:
  id v2 = 0;
LABEL_19:

LABEL_20:

  return v2;
}

uint64_t nsheim_decode_CMSSignedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];

  return _asn1_decode_top();
}

uint64_t free_CMSSignedData()
{
  return _asn1_free_top();
}

uint64_t free_AlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t findCertificateForIdentifier(uint64_t a1, void *a2, void *a3, id *a4)
{
  id v7 = a2;
  id v8 = a3;
  unsigned int v9 = +[MSCMSIdentifier decodeIdentifier:a1 error:a4];
  int v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  int v11 = [v9 type];
  if (v11 == 2)
  {
    uint64_t CertificateBySubjectKeyID = findCertificateBySubjectKeyID((void *)[v10 subjectKeyId], v7, v8, a4);
    goto LABEL_6;
  }
  if (v11 != 1)
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:*a4 description:@"unable to find certificate by identifier; invalid choice in encoding"];
      uint64_t v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  uint64_t CertificateBySubjectKeyID = findCertificateByIssuerAndSerialNumber((void *)[v10 issuerAndSerialNumber], v7, v8, a4);
LABEL_6:
  uint64_t v13 = CertificateBySubjectKeyID;
LABEL_10:

  return v13;
}

uint64_t free_CMSIdentifier()
{
  return _asn1_free_top();
}

uint64_t decode_CMSIdentifier()
{
  return _asn1_decode_top();
}

id CertificateSerialNumberData(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = der_length_heim_integer();
    if (v1)
    {
      uint64_t v2 = v1;
      id v3 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:v1];
      if (v3)
      {
        id v4 = v3;
        [v4 mutableBytes];
        if (der_put_heim_integer()) {
          BOOL v5 = 0;
        }
        else {
          BOOL v5 = v2 == 0;
        }
        if (v5) {
          goto LABEL_9;
        }
      }
    }
  }
  id v4 = 0;
LABEL_9:

  return v4;
}

uint64_t findCertificateByIssuerAndSerialNumber(void *a1, void *a2, void *a3, id *a4)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v41 = a2;
  id v39 = a3;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  v36 = a4;
  if (a4 && *a4) {
    id v7 = (void *)[*a4 copy];
  }
  else {
    id v7 = 0;
  }
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__3;
  v63 = __Block_byref_object_dispose__3;
  NSDataFromInteger(a1 + 2);
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:a1[1] length:*a1];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__3;
  v57 = __Block_byref_object_dispose__3;
  id v58 = (id)SecDistinguishedNameCopyNormalizedSequence();
  v38 = [MEMORY[0x263EFF980] array];
  if (v41 && [v41 count])
  {
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __findCertificateByIssuerAndSerialNumber_block_invoke;
    v48[3] = &unk_26411CCA8;
    v50 = &v53;
    v51 = &v59;
    v52 = &v65;
    id v49 = v38;
    [v41 enumerateObjectsUsingBlock:v48];
  }
  v37 = (void *)v8;
  uint64_t v9 = v66[3];
  if (v9)
  {
    id v40 = v7;
  }
  else
  {
    int v10 = [MEMORY[0x263EFF9A0] dictionary];
    [v10 setObject:*MEMORY[0x263F171C0] forKey:*MEMORY[0x263F171B8]];
    if (v54[5]) {
      int v11 = (void *)v54[5];
    }
    else {
      int v11 = v37;
    }
    [v10 setObject:v11 forKey:*MEMORY[0x263F16F58]];
    [v10 setObject:v60[5] forKey:*MEMORY[0x263F17080]];
    [v10 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F17530]];
    if (v39) {
      [v10 setObject:v39 forKey:*MEMORY[0x263F17558]];
    }
    v47 = v7;
    v35 = v10;
    CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v10);
    id v40 = v7;

    if (ItemInAllAvailableKeychains)
    {
      CFTypeID v13 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v13 == SecCertificateGetTypeID()) {
        v66[3] = (uint64_t)ItemInAllAvailableKeychains;
      }
      else {
        CFRelease(ItemInAllAvailableKeychains);
      }
    }
    if (!v66[3])
    {
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_46);
      }
      unsigned int v14 = (id)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [(id)v60[5] asMessageSecurityHexString];
        *(_DWORD *)buf = 141558274;
        uint64_t v71 = 1752392040;
        __int16 v72 = 2112;
        v73 = v15;
        _os_log_impl(&dword_20D8A1000, v14, OS_LOG_TYPE_INFO, "QuerySN = %{mask.hash}@", buf, 0x16u);
      }
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_49);
      }
      uint64_t v16 = (id)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = [(id)v54[5] asMessageSecurityHexString];
        *(_DWORD *)buf = 141558274;
        uint64_t v71 = 1752392040;
        __int16 v72 = 2112;
        v73 = v17;
        _os_log_impl(&dword_20D8A1000, v16, OS_LOG_TYPE_INFO, "QueryIssuer = %{mask.hash}@", buf, 0x16u);
      }
      dumpNSData("QuerySN", (void *)v60[5]);
      dumpNSData("QueryIssuer", (void *)v54[5]);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v38;
      uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v69 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v44;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v44 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v43 + 1) + 8 * v20);
            if (MS_DEFAULT_LOG_BLOCK != -1) {
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_54);
            }
            v22 = (id)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v23 = [v21 objectAtIndexedSubscript:0];
              v24 = [v23 asMessageSecurityHexString];
              *(_DWORD *)buf = 141558274;
              uint64_t v71 = 1752392040;
              __int16 v72 = 2112;
              v73 = v24;
              _os_log_impl(&dword_20D8A1000, v22, OS_LOG_TYPE_INFO, "BundledSN = %{mask.hash}@", buf, 0x16u);
            }
            if (MS_DEFAULT_LOG_BLOCK != -1) {
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_57);
            }
            v25 = (id)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = [v21 objectAtIndexedSubscript:1];
              v27 = [v26 asMessageSecurityHexString];
              *(_DWORD *)buf = 141558274;
              uint64_t v71 = 1752392040;
              __int16 v72 = 2112;
              v73 = v27;
              _os_log_impl(&dword_20D8A1000, v25, OS_LOG_TYPE_INFO, "BundledIssuer = %{mask.hash}@", buf, 0x16u);
            }
            v28 = [v21 objectAtIndexedSubscript:0];
            dumpNSData("BundledSN", v28);

            v29 = [v21 objectAtIndexedSubscript:1];
            dumpNSData("BundledIssuer", v29);

            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v69 count:16];
        }
        while (v18);
      }

      v30 = MSErrorKeychainDomain[0];
      v31 = NSStringFromDERIntegerData((void *)v60[5]);
      v32 = NSSStringFromIssuerName((void *)v54[5]);
      uint64_t v33 = +[MSError MSErrorWithDomain:v30, -25300, 1, v40, @"%s did not find IssuerAndSerialNumber %@ %@", "findCertificateByIssuerAndSerialNumber", v31, v32 code errorLevel underlyingError description];

      id v40 = (id)v33;
    }
    if (v36 && v40) {
      id *v36 = v40;
    }
    uint64_t v9 = v66[3];
  }
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v9;
}

void sub_20D8A6B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t copy_SignerInfo()
{
  return _asn1_copy_top();
}

void *NSDataFromOctetString(void *a1)
{
  if (a1)
  {
    a1 = [MEMORY[0x263EFF8F8] dataWithBytes:a1[1] length:*a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

void *NSDataFromInteger(void *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (*a1 && !*((_DWORD *)a1 + 4) && *(char *)a1[1] < 0)
    {
      char v4 = 0;
      id v3 = [MEMORY[0x263EFF990] dataWithBytes:&v4 length:1];
      [v3 appendBytes:v1[1] length:*v1];
      uint64_t v1 = [MEMORY[0x263EFF8F8] dataWithData:v3];
    }
    else
    {
      uint64_t v1 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a1[1]);
    }
  }

  return v1;
}

void dumpNSData(const char *a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v43 = a2;
  if (a1 && v43)
  {
    int v2 = os_variant_allows_internal_security_policies();
    CFPropertyListRef v3 = CFPreferencesCopyValue(@"logCMSDecodingFailures", @"com.apple.messagesecurity", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE68]);
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE48];
    CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"logCMSDecodingFailures", (CFStringRef)*MEMORY[0x263EFFE48]);
    int IsForced = CFPreferencesAppValueIsForced(@"logCMSDecodingFailures", v4);
    if (v2 && v3 && (CFTypeID v7 = CFGetTypeID(v3), TypeID = CFBooleanGetTypeID(), v9 = (const __CFBoolean *)v3, v7 == TypeID)
      || (IsForced ? (BOOL v10 = v5 == 0) : (BOOL v10 = 1),
          !v10 && (v11 = CFGetTypeID(v5), v12 = CFBooleanGetTypeID(), CFBooleanRef v9 = (const __CFBoolean *)v5, v11 == v12)))
    {
      int Value = CFBooleanGetValue(v9);
    }
    else
    {
      int Value = 0;
    }
    unsigned int v14 = &MS_DEFAULT_LOG_BLOCK;
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_212);
    }
    id v15 = (id *)&MS_DEFAULT_LOG_INTERNAL;
    uint64_t v16 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEBUG))
    {
      id v17 = v16;
      uint64_t v18 = [@"logCMSDecodingFailures" cString];
      *(_DWORD *)buf = 136316674;
      v48 = "valueForBooleanDefault";
      uint64_t v19 = "NULL";
      __int16 v49 = 2080;
      uint64_t v50 = v18;
      if (v3) {
        uint64_t v20 = "NOT_NULL";
      }
      else {
        uint64_t v20 = "NULL";
      }
      *(_DWORD *)v52 = v2;
      __int16 v51 = 1024;
      if (v5) {
        uint64_t v19 = "NOT_NULL";
      }
      *(_WORD *)&v52[4] = 2080;
      *(void *)&v52[6] = v20;
      *(_WORD *)&v52[14] = 1024;
      *(_DWORD *)&v52[16] = IsForced;
      *(_WORD *)uint64_t v53 = 2080;
      *(void *)&v53[2] = v19;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = Value;
      _os_log_impl(&dword_20D8A1000, v17, OS_LOG_TYPE_DEBUG, "%s %s isInternal: %d val: %s isForced: %d appVal: %s result: %d", buf, 0x3Cu);
    }
    if (v3) {
      CFRelease(v3);
    }
    if (v5) {
      CFRelease(v5);
    }
    if (Value)
    {
      id v21 = v43;
      v22 = (unsigned __int8 *)[v21 bytes];
      uint64_t v23 = [v21 length];
      v24 = (char *)&log_buffer;
      bzero(&log_buffer, 0x2711uLL);
      if (v23)
      {
        uint64_t v25 = 0;
        long long v46 = 0;
        v26 = v22 + 1;
        v27 = "0x%02x,";
        do
        {
          unsigned int v28 = *v22++;
          int v29 = snprintf(&v24[v25], 10001 - v25, v27, v28);
          if (!--v23 || (v25 += v29, (unint64_t)(v25 - 9996) <= 5))
          {
            if (*v14 != -1) {
              dispatch_once(v14, &__block_literal_global_186);
            }
            v30 = *v15;
            v31 = v26;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              long long v45 = v22;
              v32 = v24;
              uint64_t v33 = v15;
              id v34 = v21;
              uint64_t v44 = [v34 bytes];
              id v35 = v34;
              v36 = v27;
              id v37 = v21;
              v38 = v14;
              id v39 = &v26[-[v35 bytes]];
              id v40 = v35;
              id v15 = v33;
              v24 = v32;
              v22 = v45;
              uint64_t v41 = [v40 length];
              *(_DWORD *)buf = 136316418;
              v48 = a1;
              __int16 v49 = 2048;
              uint64_t v50 = v44;
              __int16 v51 = 2048;
              *(void *)v52 = v46;
              *(_WORD *)&v52[8] = 2048;
              *(void *)&v52[10] = v39;
              unsigned int v14 = v38;
              id v21 = v37;
              v27 = v36;
              *(_WORD *)&v52[18] = 2048;
              *(void *)uint64_t v53 = v41;
              *(_WORD *)&v53[8] = 2080;
              v54 = v24;
              _os_log_impl(&dword_20D8A1000, v30, OS_LOG_TYPE_ERROR, "logging %s 0x%zx [%ld-%ld)/%ld %s", buf, 0x3Eu);
              v31 = v45;
            }

            long long v46 = &v31[-[v21 bytes]];
            bzero(v24, 0x2711uLL);
            uint64_t v25 = 0;
          }
          ++v26;
        }
        while (v23);
      }
    }
  }
}

uint64_t decode_CertificateSerialNumber()
{
  return _asn1_decode_top();
}

void sub_20D8A78C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __findCertificateByIssuerAndSerialNumber_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  certificate = a2;
  CFDataRef v6 = SecCertificateCopyNormalizedIssuerSequence(certificate);
  CFDataRef v7 = SecCertificateCopySerialNumberData(certificate, 0);
  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToData:v6]
    || ![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToData:v7])
  {
    CFBooleanRef v9 = [MEMORY[0x263EFF980] array];
    BOOL v10 = v9;
    if (v7)
    {
      [v9 addObject:v7];
      if (v6)
      {
LABEL_8:
        [v10 addObject:v6];
LABEL_11:
        [*(id *)(a1 + 32) addObject:v10];

        goto LABEL_12;
      }
    }
    else
    {
      CFTypeID v11 = [MEMORY[0x263EFF8F8] data];
      [v10 addObject:v11];

      if (v6) {
        goto LABEL_8;
      }
    }
    CFTypeID v12 = [MEMORY[0x263EFF8F8] data];
    [v10 addObject:v12];

    goto LABEL_11;
  }
  uint64_t v8 = certificate;
  if (certificate)
  {
    CFRetain(certificate);
    uint64_t v8 = certificate;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
  *a4 = 1;
LABEL_12:
}

uint64_t free_SignerInfo()
{
  return _asn1_free_top();
}

void _MSLog(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  switch(a1)
  {
    case 1:
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEBUG))
      {
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_5);
        }
        uint64_t v4 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEBUG))
        {
          int v10 = 138543362;
          id v11 = v3;
          CFPropertyListRef v5 = v4;
          os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
          goto LABEL_25;
        }
      }
      break;
    case 2:
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
      {
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_5);
        }
        uint64_t v7 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
        {
          int v10 = 138543362;
          id v11 = v3;
          CFPropertyListRef v5 = v7;
          os_log_type_t v6 = OS_LOG_TYPE_INFO;
          goto LABEL_25;
        }
      }
      break;
    case 3:
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_8);
      }
      uint64_t v8 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v3;
        goto LABEL_20;
      }
      break;
    case 4:
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_11);
      }
      uint64_t v8 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v3;
LABEL_20:
        CFPropertyListRef v5 = v8;
        os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_25;
      }
      break;
    case 5:
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_14);
      }
      uint64_t v9 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138543362;
        id v11 = v3;
        CFPropertyListRef v5 = v9;
        os_log_type_t v6 = OS_LOG_TYPE_ERROR;
LABEL_25:
        _os_log_impl(&dword_20D8A1000, v5, v6, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
      break;
    default:
      break;
  }
}

void sub_20D8A9388(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id findBestMutuallySupportedSignatureAlgorithm(__SecCertificate *a1, void *a2)
{
  id v3 = a2;
  uint64_t KeyTypeForCertificate = getKeyTypeForCertificate(a1);
  if (KeyTypeForCertificate == 1)
  {
    uint64_t v8 = findBestMutuallySupportedRSASignatureAlgorithm_onceToken;
    id v9 = v3;
    if (v8 != -1) {
      dispatch_once(&findBestMutuallySupportedRSASignatureAlgorithm_onceToken, &__block_literal_global_15);
    }
    uint64_t v7 = &findBestMutuallySupportedRSASignatureAlgorithm_rsaPreferences;
    goto LABEL_9;
  }
  if (KeyTypeForCertificate == 3)
  {
    uint64_t v5 = findBestMutuallySupportedECSignatureAlgorithm_onceToken;
    id v6 = v3;
    if (v5 != -1) {
      dispatch_once(&findBestMutuallySupportedECSignatureAlgorithm_onceToken, &__block_literal_global_13);
    }
    uint64_t v7 = &findBestMutuallySupportedECSignatureAlgorithm_ecPreferences;
LABEL_9:
    int v10 = findBestMutuallySupportAlgorithm((void *)*v7, v3);

    goto LABEL_11;
  }
  int v10 = 0;
LABEL_11:

  return v10;
}

uint64_t getKeyTypeForCertificate(__SecCertificate *a1)
{
  if (!a1) {
    return -1;
  }
  SecKeyRef v1 = SecCertificateCopyKey(a1);
  if (!v1) {
    return -1;
  }
  SecKeyRef v2 = v1;
  uint64_t AlgorithmId = SecKeyGetAlgorithmId();
  CFRelease(v2);
  return AlgorithmId;
}

id findBestMutuallySupportedKeyEncryptionAlgorithm(void *a1)
{
  uint64_t v1 = findBestMutuallySupportedKeyEncryptionAlgorithm_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&findBestMutuallySupportedKeyEncryptionAlgorithm_onceToken, &__block_literal_global);
  }
  id v3 = findBestMutuallySupportAlgorithm((void *)findBestMutuallySupportedKeyEncryptionAlgorithm_keyEncryptionPreferences, v2);

  return v3;
}

void __findBestMutuallySupportedKeyEncryptionAlgorithm_block_invoke()
{
  v0 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  uint64_t v1 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.45" error:0];
  [v0 addObject:v1];

  id v2 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.25" error:0];
  [v0 addObject:v2];

  id v3 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.5" error:0];
  [v0 addObject:v3];

  uint64_t v4 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.16.3.7" error:0];
  [v0 addObject:v4];

  uint64_t v5 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.42" error:0];
  [v0 addObject:v5];

  id v6 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.22" error:0];
  [v0 addObject:v6];

  uint64_t v7 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.2" error:0];
  [v0 addObject:v7];

  uint64_t v8 = +[MSOID OIDWithString:@"1.2.840.113549.3.7" error:0];
  [v0 addObject:v8];

  id v9 = +[MSOID OIDWithString:@"1.2.840.113549.3.2" error:0];
  [v0 addObject:v9];

  int v10 = (void *)findBestMutuallySupportedKeyEncryptionAlgorithm_keyEncryptionPreferences;
  findBestMutuallySupportedKeyEncryptionAlgorithm_keyEncryptionPreferences = (uint64_t)v0;
}

id findBestMutuallySupportAlgorithm(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v13 = 0;
    unsigned int v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy_;
    id v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __findBestMutuallySupportAlgorithm_block_invoke;
    v8[3] = &unk_26411C720;
    id v9 = v4;
    int v10 = &v13;
    id v11 = v12;
    [v3 enumerateObjectsUsingBlock:v8];
    id v6 = (id)v14[5];

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v6 = [v3 objectAtIndex:0];
  }

  return v6;
}

void sub_20D8AA1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id findBestMutuallySupportedEncryptionAlgorithm(void *a1)
{
  uint64_t v1 = findBestMutuallySupportedEncryptionAlgorithm_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&findBestMutuallySupportedEncryptionAlgorithm_onceToken, &__block_literal_global_3);
  }
  id v3 = findBestMutuallySupportAlgorithm((void *)findBestMutuallySupportedEncryptionAlgorithm_keyEncryptionPreferences, v2);

  return v3;
}

void __findBestMutuallySupportedEncryptionAlgorithm_block_invoke()
{
  v0 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  uint64_t v1 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.42" error:0];
  [v0 addObject:v1];

  id v2 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.22" error:0];
  [v0 addObject:v2];

  id v3 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.2" error:0];
  [v0 addObject:v3];

  id v4 = +[MSOID OIDWithString:@"1.2.840.113549.3.7" error:0];
  [v0 addObject:v4];

  uint64_t v5 = +[MSOID OIDWithString:@"1.2.840.113549.3.2" error:0];
  [v0 addObject:v5];

  id v6 = (void *)findBestMutuallySupportedEncryptionAlgorithm_keyEncryptionPreferences;
  findBestMutuallySupportedEncryptionAlgorithm_keyEncryptionPreferences = (uint64_t)v0;
}

id MSDecryptGCMOneShot(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)MEMORY[0x263EFF990];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  unsigned int v14 = objc_msgSend(v9, "dataWithLength:", objc_msgSend(v10, "length"));
  id v15 = v13;
  [v15 bytes];
  [v15 length];

  id v16 = v12;
  [v16 bytes];
  [v16 length];

  id v17 = v10;
  [v17 bytes];
  uint64_t v18 = [v17 length];

  id v19 = v14;
  uint64_t v20 = [v19 mutableBytes];
  id v21 = v11;
  uint64_t v22 = [v21 bytes];
  uint64_t v23 = [v21 length];

  uint64_t v30 = v22;
  uint64_t v24 = CCCryptorGCMOneshotDecrypt();
  if (v24)
  {
    uint64_t v25 = v24;
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6);
    }
    v26 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v33 = v25;
      _os_log_impl(&dword_20D8A1000, v26, OS_LOG_TYPE_ERROR, "Error decrypting underlying crypto error %d", buf, 8u);
    }
    if (a6)
    {
      id v27 = +[MSError MSErrorWithDomain:MSErrorCryptoDomain[0], (int)v25, *a6, @"MSDecryptGCM error: %d", v25, v20, v30, v23 code underlyingError description];
      *a6 = v27;
    }
    else
    {
      id v27 = +[MSError MSErrorWithDomain:MSErrorCryptoDomain[0], (int)v25, 0, @"MSDecryptGCM error: %d", v25, v20, v30, v23 code underlyingError description];
    }

    unsigned int v28 = 0;
  }
  else
  {
    unsigned int v28 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithData:", v19, v18, v20, v22, v23);
  }

  return v28;
}

uint64_t __MSDecryptGCMOneShot_block_invoke()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

void __findBestMutuallySupportedECSignatureAlgorithm_block_invoke()
{
  v0 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  uint64_t v1 = +[MSOID OIDWithString:@"1.2.840.10045.4.3.3" error:0];
  [v0 addObject:v1];

  id v2 = +[MSOID OIDWithString:@"1.2.840.10045.4.3.2" error:0];
  [v0 addObject:v2];

  id v3 = +[MSOID OIDWithString:@"1.2.840.10045.4.3.4" error:0];
  [v0 addObject:v3];

  id v4 = +[MSOID OIDWithString:@"1.2.840.10045.4.3.1" error:0];
  [v0 addObject:v4];

  uint64_t v5 = +[MSOID OIDWithString:@"1.2.840.10045.4.1" error:0];
  [v0 addObject:v5];

  id v6 = (void *)findBestMutuallySupportedECSignatureAlgorithm_ecPreferences;
  findBestMutuallySupportedECSignatureAlgorithm_ecPreferences = (uint64_t)v0;
}

void __findBestMutuallySupportedRSASignatureAlgorithm_block_invoke()
{
  v0 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  uint64_t v1 = +[MSOID OIDWithString:@"1.2.840.113549.1.1.12" error:0];
  [v0 addObject:v1];

  id v2 = +[MSOID OIDWithString:@"1.2.840.113549.1.1.11" error:0];
  [v0 addObject:v2];

  id v3 = +[MSOID OIDWithString:@"1.2.840.113549.1.1.13" error:0];
  [v0 addObject:v3];

  id v4 = +[MSOID OIDWithString:@"1.2.840.113549.1.1.14" error:0];
  [v0 addObject:v4];

  uint64_t v5 = +[MSOID OIDWithString:@"1.2.840.113549.1.1.5" error:0];
  [v0 addObject:v5];

  id v6 = (void *)findBestMutuallySupportedRSASignatureAlgorithm_rsaPreferences;
  findBestMutuallySupportedRSASignatureAlgorithm_rsaPreferences = (uint64_t)v0;
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

void __findBestMutuallySupportAlgorithm_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __findBestMutuallySupportAlgorithm_block_invoke_2;
  id v16 = &unk_26411C6F8;
  id v9 = v7;
  id v17 = v9;
  uint64_t v18 = &v19;
  [v8 enumerateObjectsUsingBlock:&v13];
  uint64_t v10 = v20[3];
  if (v10 == objc_msgSend(*(id *)(a1 + 32), "count", v13, v14, v15, v16))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  unint64_t v11 = v20[3];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v11 > *(void *)(v12 + 24))
  {
    *(void *)(v12 + 24) = v11;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  _Block_object_dispose(&v19, 8);
}

void sub_20D8AAACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __findBestMutuallySupportAlgorithm_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 32)];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

void __algorithmOIDToParameters_block_invoke()
{
  v3[27] = *MEMORY[0x263EF8340];
  v2[0] = @"1.2.840.113549.2.5";
  v2[1] = @"1.3.14.3.2.26";
  v3[0] = MEMORY[0x263EFFA80];
  v3[1] = MEMORY[0x263EFFA88];
  v2[2] = @"2.16.840.1.101.3.4.2.4";
  v2[3] = @"2.16.840.1.101.3.4.2.1";
  v3[2] = MEMORY[0x263EFFA88];
  v3[3] = MEMORY[0x263EFFA88];
  v2[4] = @"2.16.840.1.101.3.4.2.2";
  v2[5] = @"2.16.840.1.101.3.4.2.3";
  v3[4] = MEMORY[0x263EFFA88];
  v3[5] = MEMORY[0x263EFFA88];
  v2[6] = @"1.2.840.113549.1.1.4";
  v2[7] = @"1.2.840.113549.1.1.5";
  v3[6] = MEMORY[0x263EFFA80];
  v3[7] = MEMORY[0x263EFFA80];
  v2[8] = @"1.2.840.113549.1.1.14";
  v2[9] = @"1.2.840.113549.1.1.11";
  v3[8] = MEMORY[0x263EFFA80];
  v3[9] = MEMORY[0x263EFFA80];
  v2[10] = @"1.2.840.113549.1.1.12";
  v2[11] = @"1.2.840.113549.1.1.13";
  v3[10] = MEMORY[0x263EFFA80];
  v3[11] = MEMORY[0x263EFFA80];
  v2[12] = @"1.2.840.10045.4.1";
  v2[13] = @"1.2.840.10045.4.3.1";
  v3[12] = MEMORY[0x263EFFA88];
  v3[13] = MEMORY[0x263EFFA88];
  v2[14] = @"1.2.840.10045.4.3.2";
  v2[15] = @"1.2.840.10045.4.3.3";
  v3[14] = MEMORY[0x263EFFA88];
  v3[15] = MEMORY[0x263EFFA88];
  v2[16] = @"1.2.840.10045.4.3.4";
  v2[17] = @"1.2.840.113549.1.1.1";
  v3[16] = MEMORY[0x263EFFA88];
  v3[17] = MEMORY[0x263EFFA80];
  v2[18] = @"2.16.840.1.101.3.4.1.2";
  v2[19] = @"2.16.840.1.101.3.4.1.22";
  v3[18] = MEMORY[0x263EFFA80];
  v3[19] = MEMORY[0x263EFFA80];
  v2[20] = @"2.16.840.1.101.3.4.1.42";
  v2[21] = @"2.16.840.1.101.3.4.1.6";
  v3[20] = MEMORY[0x263EFFA80];
  v3[21] = MEMORY[0x263EFFA80];
  v2[22] = @"2.16.840.1.101.3.4.1.26";
  v2[23] = @"2.16.840.1.101.3.4.1.46";
  v3[22] = MEMORY[0x263EFFA80];
  v3[23] = MEMORY[0x263EFFA80];
  v2[24] = @"2.16.840.1.101.3.4.1.5";
  v2[25] = @"2.16.840.1.101.3.4.1.25";
  v3[24] = MEMORY[0x263EFFA88];
  v3[25] = MEMORY[0x263EFFA88];
  v2[26] = @"2.16.840.1.101.3.4.1.45";
  v3[26] = MEMORY[0x263EFFA88];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:27];
  uint64_t v1 = (void *)algorithmOIDToParameters_sAlgorithmOIDStringIsAbsentParameters;
  algorithmOIDToParameters_sAlgorithmOIDStringIsAbsentParameters = v0;
}

void *NSDataFromBaseData(void *a1)
{
  if (a1)
  {
    a1 = [MEMORY[0x263EFF8F8] dataWithBytes:a1[1] length:*a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

void *NSDataFromBitString(void *a1)
{
  if (a1)
  {
    a1 = [MEMORY[0x263EFF8F8] dataWithBytes:a1[1] length:*a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

void *NSDataFromAnySet(void *a1)
{
  if (a1)
  {
    a1 = [MEMORY[0x263EFF8F8] dataWithBytes:a1[1] length:*a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

void *NSStringFromUTF8String(void *a1)
{
  if (a1)
  {
    a1 = [NSString stringWithUTF8String:*a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_20D8B1904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_20D8B1AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8B1C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8B20B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_20D8B222C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8B3000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_20D8B325C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8B3E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_20D8B42E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20D8B47AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id generalizedTimeStringFromDate(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x263F08790];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v3 setLocale:v4];

  [v3 setDateFormat:@"yyyyMMddHHmmss'Z'"];
  uint64_t v5 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v5];

  id v6 = [v3 stringFromDate:v2];

  return v6;
}

id UTCStringFromDate(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x263F08790];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v3 setLocale:v4];

  [v3 setDateFormat:@"yyMMddHHmmss'Z'"];
  uint64_t v5 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v5];

  id v6 = [v3 stringFromDate:v2];

  return v6;
}

void sub_20D8B714C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8B9B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_20D8BA460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8BA640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8BA988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D8BAD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20D8BB144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __decodeEmbeddedCMSContent_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __decodeEmbeddedCMSContent_block_invoke_4()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __decodeEmbeddedCMSContent_block_invoke_7()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __decodeEmbeddedCMSContent_block_invoke_12()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

SecCertificateRef MSSecIdentityCopyCertificateWithError(__SecIdentity *a1, void *a2)
{
  SecCertificateRef certificateRef = 0;
  OSStatus v3 = SecIdentityCopyCertificate(a1, &certificateRef);
  if (!v3) {
    return certificateRef;
  }
  if (!a2) {
    return 0;
  }
  id v4 = +[MSError MSErrorWithDomain:*MEMORY[0x263F08410] code:v3 underlyingError:*a2 description:@"unable to get certificate from provided identity"];
  SecCertificateRef result = 0;
  *a2 = v4;
  return result;
}

SecKeyRef MSSecIdentityCopyKeyWithError(__SecIdentity *a1, void *a2)
{
  SecKeyRef privateKeyRef = 0;
  OSStatus v3 = SecIdentityCopyPrivateKey(a1, &privateKeyRef);
  if (!v3) {
    return privateKeyRef;
  }
  if (!a2) {
    return 0;
  }
  id v4 = +[MSError MSErrorWithDomain:*MEMORY[0x263F08410] code:v3 underlyingError:*a2 description:@"unable to get private key from provided identity"];
  SecKeyRef result = 0;
  *a2 = v4;
  return result;
}

SecTrustRef MSSecTrustCreateWithError(uint64_t a1, void *a2, void *a3, void *a4, id *a5)
{
  id v9 = a2;
  CFDateRef v10 = a3;
  id v11 = a4;
  SecTrustRef trust = 0;
  if (a5 && *a5) {
    uint64_t v12 = (void *)[*a5 copy];
  }
  else {
    uint64_t v12 = 0;
  }
  if (v9) {
    [MEMORY[0x263EFF980] arrayWithArray:v9];
  }
  else {
  uint64_t v13 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  }
  [v13 insertObject:a1 atIndex:0];
  OSStatus v14 = SecTrustCreateWithCertificates(v13, v11, &trust);
  if (v14)
  {
    uint64_t v17 = @"unable to create trust object";
  }
  else
  {
    if (!v10 || (OSStatus v14 = SecTrustSetVerifyDate(trust, v10)) == 0)
    {
      if (!a5) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    uint64_t v17 = @"unable to set verify date on trust object";
  }
  uint64_t v18 = +[MSError MSErrorWithDomain:*MEMORY[0x263F08410] code:v14 underlyingError:v12 description:v17];

  uint64_t v12 = (void *)v18;
  if (!a5) {
    goto LABEL_14;
  }
LABEL_12:
  if (v12) {
    *a5 = v12;
  }
LABEL_14:
  SecTrustRef v15 = trust;

  return v15;
}

CFTypeRef findItemInAllAvailableKeychains(void *a1)
{
  id v1 = a1;
  CFTypeRef result = 0;
  id v2 = [MEMORY[0x263EFF980] array];
  OSStatus v3 = [v1 objectForKeyedSubscript:*MEMORY[0x263F17400]];
  int v4 = [v3 isEqual:*MEMORY[0x263F17408]];
  uint64_t v5 = *MEMORY[0x263F17580];
  uint64_t v6 = [v1 objectForKeyedSubscript:*MEMORY[0x263F17580]];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [v1 objectForKeyedSubscript:v5];
    int v9 = [v8 BOOLValue];

    if (!v9)
    {
      CFDateRef v10 = 0;
      goto LABEL_23;
    }
  }
  CFDateRef v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v1];
  [v10 setObject:MEMORY[0x263EFFA88] forKey:v5];
  [v10 setObject:*MEMORY[0x263F170B8] forKey:*MEMORY[0x263F170B0]];
  if (SecItemCopyMatching((CFDictionaryRef)v10, &result)) {
    int v11 = 1;
  }
  else {
    int v11 = v4;
  }
  if (v11 != 1)
  {
    uint64_t v16 = 0;
    id v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_47;
  }
  CFTypeRef v12 = result;
  if (result) {
    int v13 = v4;
  }
  else {
    int v13 = 0;
  }
  if (v13 == 1)
  {
    CFTypeID v14 = CFGetTypeID(result);
    CFTypeID TypeID = CFArrayGetTypeID();
    CFTypeRef v12 = result;
    if (v14 == TypeID)
    {
      [v2 addObjectsFromArray:result];
LABEL_20:
      CFTypeRef v12 = result;
      goto LABEL_21;
    }
  }
  if (v12) {
    int v19 = v4;
  }
  else {
    int v19 = 0;
  }
  if (v19 == 1)
  {
    objc_msgSend(v2, "addObject:");
    goto LABEL_20;
  }
LABEL_21:
  if (v12)
  {
    CFTypeRef result = 0;
    CFRelease(v12);
  }
LABEL_23:
  uint64_t v20 = (void *)_SecSecuritydCopyWhoAmI();
  uint64_t v18 = v20;
  uint64_t v16 = 0;
  if (!v20)
  {
    id v17 = 0;
    goto LABEL_47;
  }
  id v17 = [v20 objectForKey:@"status"];

  if (!v17)
  {
LABEL_46:
    uint64_t v16 = 0;
    goto LABEL_47;
  }
  id v17 = [v18 objectForKey:@"musr"];
  uint64_t v21 = [v18 objectForKey:@"system-keychain"];
  if (!v21 || !v17 || [v17 length] != 16)
  {

    goto LABEL_46;
  }
  id v17 = v17;
  uint64_t v22 = [v17 bytes];
  BOOL v24 = *(void *)v22 != 0x104B57A5353A5AA7 || *(_DWORD *)(v22 + 8) != -1803342146;

  if (v24) {
    goto LABEL_46;
  }
  uint64_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v1];
  [v16 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F17590]];
  if (SecItemCopyMatching((CFDictionaryRef)v16, &result)) {
    int v25 = 1;
  }
  else {
    int v25 = v4;
  }
  if (v25 != 1) {
    goto LABEL_47;
  }
  CFTypeRef v26 = result;
  if (result) {
    int v27 = v4;
  }
  else {
    int v27 = 0;
  }
  if (v27 == 1)
  {
    CFTypeID v28 = CFGetTypeID(result);
    CFTypeID v29 = CFArrayGetTypeID();
    CFTypeRef v26 = result;
    if (v28 == v29)
    {
      [v2 addObjectsFromArray:result];
LABEL_57:
      CFTypeRef v26 = result;
      goto LABEL_58;
    }
  }
  if (v26) {
    int v32 = v4;
  }
  else {
    int v32 = 0;
  }
  if (v32 == 1)
  {
    objc_msgSend(v2, "addObject:");
    goto LABEL_57;
  }
LABEL_58:
  if (v26)
  {
    CFTypeRef result = 0;
    CFRelease(v26);
  }
LABEL_47:
  CFTypeRef v30 = result;
  if (v4)
  {
    if (result)
    {
      CFTypeRef result = 0;
      CFRelease(v30);
    }
    CFTypeRef v30 = v2;
    CFTypeRef result = v30;
  }

  return v30;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __findCertificateByIssuerAndSerialNumber_block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __findCertificateByIssuerAndSerialNumber_block_invoke_47()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __findCertificateByIssuerAndSerialNumber_block_invoke_52()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __findCertificateByIssuerAndSerialNumber_block_invoke_55()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

__CFString *NSStringFromDERIntegerData(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
    [v3 bytes];
    [v3 length];
    if (der_get_integer() || [v3 length])
    {
      uint64_t v4 = [v3 asMessageSecurityHexString];
    }
    else
    {
      uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", 0);
    }
    uint64_t v5 = (__CFString *)v4;
  }
  else
  {
    uint64_t v5 = @"NULL";
  }

  return v5;
}

__CFString *NSSStringFromIssuerName(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v31 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    id v24 = v1;
    id v2 = @"INVALID_ISSUER";
    if (!nsheim_decode_Name(v1) && v30 == 1)
    {
      unint64_t v3 = DWORD2(v30);
      if (DWORD2(v30))
      {
        unint64_t v4 = 0;
        id v2 = &stru_26C22FEE0;
        do
        {
          uint64_t v5 = (unsigned int *)(v31 + 16 * v4);
          uint64_t v6 = *v5;
          if (v6)
          {
            unint64_t v25 = v4;
            id v7 = (long long *)*((void *)v5 + 1);
            do
            {
              uint64_t v8 = v2;
              uint64_t v28 = 0;
              long long v26 = 0u;
              *(_OWORD *)__s = 0u;
              long long v9 = *v7;
              long long v10 = v7[1];
              uint64_t v28 = *((void *)v7 + 4);
              long long v26 = v9;
              *(_OWORD *)__s = v10;
              int v11 = [[MSOID alloc] initWithAsn1OID:&v26 error:0];
              CFTypeRef v12 = v11;
              if (v11)
              {
                int v13 = [(MSOID *)v11 OIDString];
              }
              else
              {
                int v13 = @"INVALID_OID";
              }
              switch(LODWORD(__s[0]))
              {
                case 1:
                case 3:
                  id v14 = [NSString alloc];
                  uint64_t v16 = __s[1];
                  uint64_t v15 = v28;
                  uint64_t v17 = 1;
                  goto LABEL_18;
                case 2:
                  int v19 = [MEMORY[0x263EFF8F8] dataWithBytes:__s[1] length:strlen(__s[1])];
                  uint64_t v18 = [v19 asMessageSecurityHexString];

                  break;
                case 4:
                  id v14 = [NSString alloc];
                  uint64_t v16 = __s[1];
                  uint64_t v15 = v28;
                  uint64_t v17 = 2348810496;
                  goto LABEL_18;
                case 5:
                  id v20 = [NSString alloc];
                  uint64_t v21 = [v20 initWithUTF8String:__s[1]];
                  goto LABEL_19;
                case 6:
                  id v14 = [NSString alloc];
                  uint64_t v16 = __s[1];
                  uint64_t v15 = v28;
                  uint64_t v17 = 10;
LABEL_18:
                  uint64_t v21 = [v14 initWithBytes:v15 length:v16 encoding:v17];
LABEL_19:
                  uint64_t v18 = (__CFString *)v21;
                  break;
                default:
                  uint64_t v18 = @"UNEXPECTED_VALUE";
                  break;
              }
              id v2 = [(__CFString *)v8 stringByAppendingFormat:@"%@:%@ ", v13, v18];

              id v7 = (long long *)((char *)v7 + 40);
              --v6;
            }
            while (v6);
            unint64_t v3 = DWORD2(v30);
            unint64_t v4 = v25;
          }
          if (++v4 < v3)
          {
            uint64_t v22 = [(__CFString *)v2 stringByAppendingFormat:@"| "];

            unint64_t v3 = DWORD2(v30);
            id v2 = (__CFString *)v22;
          }
        }
        while (v4 < v3);
      }
      else
      {
        id v2 = &stru_26C22FEE0;
      }
    }
    id v1 = v24;
  }
  else
  {
    id v2 = @"NULL";
  }

  return v2;
}

uint64_t findCertificateBySubjectKeyID(void *a1, void *a2, void *a3, id *a4)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v30 = a2;
  id v29 = a3;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__3;
  uint64_t v44 = __Block_byref_object_dispose__3;
  NSDataFromOctetString(a1);
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  int v27 = a4;
  if (a4 && *a4) {
    id v7 = (void *)[*a4 copy];
  }
  else {
    id v7 = 0;
  }
  uint64_t v28 = [MEMORY[0x263EFF980] array];
  if (v30 && [v30 count])
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __findCertificateBySubjectKeyID_block_invoke;
    v36[3] = &unk_26411CCD0;
    v38 = &v40;
    uint64_t v39 = &v46;
    id v37 = v28;
    [v30 enumerateObjectsUsingBlock:v36];
  }
  uint64_t v8 = v47[3];
  if (!v8)
  {
    long long v9 = [MEMORY[0x263EFF9A0] dictionary];
    [v9 setObject:*MEMORY[0x263F171C0] forKey:*MEMORY[0x263F171B8]];
    [v9 setObject:v41[5] forKey:*MEMORY[0x263F170A0]];
    [v9 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F17530]];
    if (v29) {
      [v9 setObject:v29 forKey:*MEMORY[0x263F17558]];
    }
    id v35 = v7;
    unint64_t v25 = v9;
    CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v9);
    id v26 = v7;

    if (ItemInAllAvailableKeychains)
    {
      CFTypeID v11 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v11 == SecCertificateGetTypeID()) {
        v47[3] = (uint64_t)ItemInAllAvailableKeychains;
      }
      else {
        CFRelease(ItemInAllAvailableKeychains);
      }
    }
    if (v47[3])
    {
      id v7 = v26;
    }
    else
    {
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_64);
      }
      CFTypeRef v12 = (id)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = [(id)v41[5] asMessageSecurityHexString];
        *(_DWORD *)buf = 141558274;
        uint64_t v52 = 1752392040;
        __int16 v53 = 2112;
        v54 = v13;
        _os_log_impl(&dword_20D8A1000, v12, OS_LOG_TYPE_INFO, "QuerySKID = %{mask.hash}@", buf, 0x16u);
      }
      dumpNSData("QuerySKID", (void *)v41[5]);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v28;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v50 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v32;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * v17);
            if (MS_DEFAULT_LOG_BLOCK != -1) {
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_68);
            }
            int v19 = (id)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              id v20 = [v18 asMessageSecurityHexString];
              *(_DWORD *)buf = 141558274;
              uint64_t v52 = 1752392040;
              __int16 v53 = 2112;
              v54 = v20;
              _os_log_impl(&dword_20D8A1000, v19, OS_LOG_TYPE_INFO, "BundledSKID = %{mask.hash}@", buf, 0x16u);
            }
            dumpNSData("BundledSKID", v18);
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v50 count:16];
        }
        while (v15);
      }

      uint64_t v21 = MSErrorKeychainDomain[0];
      uint64_t v22 = v41[5];
      if (v22)
      {
        uint64_t v23 = [(id)v41[5] asMessageSecurityHexString];
      }
      else
      {
        uint64_t v23 = @"NULL";
      }
      id v7 = +[MSError MSErrorWithDomain:v21, -25300, 1, v26, @"%s did not find SubjectKeyIdentifier %@", "findCertificateBySubjectKeyID", v23, v9 code errorLevel underlyingError description];

      if (v22) {
    }
      }
    if (v27 && v7) {
      id *v27 = v7;
    }
    uint64_t v8 = v47[3];
  }
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v8;
}

void sub_20D8BC768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void __findCertificateBySubjectKeyID_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id cf = a2;
  SubjectKeyID = (void *)SecCertificateGetSubjectKeyID();
  id v7 = SubjectKeyID;
  if (SubjectKeyID) {
    CFRetain(SubjectKeyID);
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v8 && [v8 isEqualToData:v7])
  {
    id v9 = cf;
    if (cf)
    {
      CFRetain(cf);
      id v9 = cf;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
    *a4 = 1;
  }
  else
  {
    long long v10 = *(void **)(a1 + 32);
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      CFTypeID v11 = [MEMORY[0x263EFF8F8] data];
      [v10 addObject:v11];
    }
  }
}

uint64_t __findCertificateBySubjectKeyID_block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __findCertificateBySubjectKeyID_block_invoke_66()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t findCertificateByEmailAddress(void *a1, void *a2, void **a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__3;
  __int16 v51 = __Block_byref_object_dispose__3;
  if (a3)
  {
    id v7 = *a3;
    if (*a3) {
      id v7 = (void *)[v7 copy];
    }
  }
  else
  {
    id v7 = 0;
  }
  id v52 = v7;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__3;
  id v45 = __Block_byref_object_dispose__3;
  id v46 = 0;
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:*MEMORY[0x263F171C0] forKey:*MEMORY[0x263F171B8]];
  [v8 setObject:*MEMORY[0x263F17408] forKey:*MEMORY[0x263F17400]];
  [v8 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F17530]];
  if (v6) {
    [v8 setObject:v6 forKey:*MEMORY[0x263F17558]];
  }
  id v9 = (id *)(v48 + 5);
  id obj = (id)v48[5];
  CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v8);
  objc_storeStrong(v9, obj);
  if (ItemInAllAvailableKeychains)
  {
    CFTypeID v11 = CFGetTypeID(ItemInAllAvailableKeychains);
    if (v11 == SecCertificateGetTypeID())
    {
      uint64_t v12 = [MEMORY[0x263EFF980] arrayWithObject:ItemInAllAvailableKeychains];
    }
    else
    {
      CFTypeID v15 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v15 != CFArrayGetTypeID())
      {
        uint64_t v16 = 0;
LABEL_16:
        CFRelease(ItemInAllAvailableKeychains);
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_84);
        }
        uint64_t v17 = (id)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = [v16 count];
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_20D8A1000, v17, OS_LOG_TYPE_DEBUG, "found %lu candidate email certs from keychain", (uint8_t *)&buf, 0xCu);
        }

        uint64_t v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v16, "count"));
        id v20 = (void *)v42[5];
        v42[5] = v19;

        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __findCertificateByEmailAddress_block_invoke_85;
        v37[3] = &unk_26411CD20;
        id v21 = v5;
        id v38 = v21;
        uint64_t v39 = &v41;
        [v16 enumerateObjectsUsingBlock:v37];
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_88);
        }
        uint64_t v22 = (id)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = [v16 count];
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v23;
          _os_log_impl(&dword_20D8A1000, v22, OS_LOG_TYPE_DEBUG, "found %lu candidate certs from keychain with matching email addresses", (uint8_t *)&buf, 0xCu);
        }

        id v13 = (id)v42[5];
        if ([v13 count] == 1)
        {
          id v24 = [v13 objectAtIndex:0];
          v54[3] = (uint64_t)v24;
        }
        else
        {
          if (![v13 count])
          {
            if (a3)
            {
              +[MSError MSErrorWithDomain:MSErrorKeychainDomain[0], -25300, 1, v48[5], @"unable to find any certificates with email address %@", v21 code errorLevel underlyingError description];
              uint64_t v14 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v14 = 0;
            }
            goto LABEL_34;
          }
          uint64_t v25 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          id v26 = (void *)v42[5];
          v42[5] = v25;

          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __findCertificateByEmailAddress_block_invoke_92;
          v36[3] = &unk_26411CD48;
          void v36[4] = &v47;
          v36[5] = &v41;
          [v13 enumerateObjectsUsingBlock:v36];
          if (MS_DEFAULT_LOG_BLOCK != -1) {
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_95);
          }
          int v27 = (id)MS_DEFAULT_LOG_INTERNAL;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v28 = [v13 count];
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v28;
            _os_log_impl(&dword_20D8A1000, v27, OS_LOG_TYPE_DEBUG, "found %lu valid email candidate certs", (uint8_t *)&buf, 0xCu);
          }

          uint64_t v29 = [(id)v42[5] count];
          id v30 = (void *)v42[5];
          if (v29 != 1)
          {
            if ([v30 count])
            {
              id v33 = (id)v42[5];

              id v13 = v33;
            }
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v58 = 0x2020000000;
            uint64_t v59 = 0;
            v35[0] = MEMORY[0x263EF8330];
            v35[1] = 3221225472;
            v35[2] = __findCertificateByEmailAddress_block_invoke_96;
            v35[3] = &unk_26411CD48;
            v35[4] = &buf;
            v35[5] = &v53;
            [v13 enumerateObjectsUsingBlock:v35];
            if (a3)
            {
              long long v34 = (void *)v48[5];
              if (v34) {
                *a3 = v34;
              }
            }
            uint64_t v14 = v54[3];
            _Block_object_dispose(&buf, 8);
            goto LABEL_34;
          }
          id v31 = [v30 objectAtIndex:0];
          v54[3] = (uint64_t)v31;
        }
        uint64_t v14 = v54[3];
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v12 = [MEMORY[0x263EFF980] arrayWithArray:ItemInAllAvailableKeychains];
    }
    uint64_t v16 = (void *)v12;
    goto LABEL_16;
  }
  if (a3)
  {
    +[MSError MSErrorWithDomain:MSErrorKeychainDomain[0] code:-25300 errorLevel:1 underlyingError:v48[5] description:@"unable to find any certificates in keychain"];
    id v13 = 0;
    uint64_t v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
    uint64_t v14 = 0;
  }
LABEL_35:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v14;
}

void sub_20D8BD070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __findCertificateByEmailAddress_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __findCertificateByEmailAddress_block_invoke_85(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = SecCertificateCopyRFC822Names();
    if (v4)
    {
      id v5 = (void *)v4;
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __findCertificateByEmailAddress_block_invoke_2;
      v6[3] = &unk_26411CCF8;
      id v7 = *(id *)(a1 + 32);
      if ([v5 indexOfObjectPassingTest:v6] != 0x7FFFFFFFFFFFFFFFLL) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
      }
    }
  }
}

BOOL __findCertificateByEmailAddress_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

uint64_t __findCertificateByEmailAddress_block_invoke_3()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __findCertificateByEmailAddress_block_invoke_92(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = MSSecTrustCreateWithError((uint64_t)v3, 0, 0, 0, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    if (SecTrustEvaluateWithError(v5, 0)) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
    }
    CFRelease(v5);
  }
}

uint64_t __findCertificateByEmailAddress_block_invoke_2_93()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __findCertificateByEmailAddress_block_invoke_96(uint64_t a1, void *a2)
{
  CFTypeRef cf = a2;
  SecCertificateNotValidAfter();
  uint64_t v4 = cf;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v3;
    id v6 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v6)
    {
      CFRelease(v6);
      uint64_t v4 = cf;
    }
    if (v4)
    {
      CFRetain(v4);
      uint64_t v4 = cf;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }

  return MEMORY[0x270F9A758]();
}

const void *findIdentityByCertificate(__SecCertificate *a1, void *a2, id *a3)
{
  id v5 = a2;
  CFErrorRef error = 0;
  if (a3 && *a3) {
    id v6 = (id)[*a3 copy];
  }
  else {
    id v6 = 0;
  }
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  CFDataRef v8 = SecCertificateCopySerialNumberData(a1, &error);
  CFDataRef v9 = v8;
  CFErrorRef v10 = error;
  if (error || !v8)
  {

    id v6 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:-26275 underlyingError:v10 description:@"Unable to get serial number from certificate"];

    CFDataRef v11 = 0;
  }
  else
  {
    CFDataRef v11 = SecCertificateCopyNormalizedIssuerSequence(a1);
    if (v11)
    {
      [v7 setObject:*MEMORY[0x263F171D0] forKey:*MEMORY[0x263F171B8]];
      [v7 setObject:v11 forKey:*MEMORY[0x263F16F58]];
      [v7 setObject:v9 forKey:*MEMORY[0x263F17080]];
      [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F17530]];
      if (v5) {
        [v7 setObject:v5 forKey:*MEMORY[0x263F17558]];
      }
      CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v7);
      if (ItemInAllAvailableKeychains)
      {
        id v13 = ItemInAllAvailableKeychains;
        CFTypeID v14 = CFGetTypeID(ItemInAllAvailableKeychains);
        if (v14 == SecIdentityGetTypeID()) {
          goto LABEL_18;
        }
        CFRelease(v13);
      }
    }
    else
    {
      uint64_t v15 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:-26275 underlyingError:v6 description:@"Unable to get issuer sequence from certificate"];

      id v6 = (id)v15;
    }
  }
  uint64_t v16 = v6;
  uint64_t v17 = MSErrorKeychainDomain[0];
  uint64_t v18 = NSStringFromDERIntegerData(v9);
  uint64_t v19 = NSSStringFromIssuerName(v11);
  id v6 = +[MSError MSErrorWithDomain:v17, -25300, 1, v6, @"%s did not find IssuerAndSerialNumber %@ %@", "findIdentityByCertificate", v18, v19 code errorLevel underlyingError description];

  id v13 = 0;
  if (a3 && v6)
  {
    id v6 = v6;
    id v13 = 0;
    *a3 = v6;
  }
LABEL_18:

  return v13;
}

uint64_t findIdentityByEmailAddress(void *a1, void *a2, void **a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = (id *)&v43;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__3;
  uint64_t v47 = __Block_byref_object_dispose__3;
  if (a3)
  {
    id v7 = *a3;
    if (*a3) {
      id v7 = (void *)[v7 copy];
    }
  }
  else
  {
    id v7 = 0;
  }
  id v48 = v7;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__3;
  uint64_t v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  CFDataRef v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:*MEMORY[0x263F171D0] forKey:*MEMORY[0x263F171B8]];
  [v8 setObject:*MEMORY[0x263F17408] forKey:*MEMORY[0x263F17400]];
  [v8 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F17530]];
  if (v6) {
    [v8 setObject:v6 forKey:*MEMORY[0x263F17558]];
  }
  CFDataRef v9 = v44;
  id obj = v44[5];
  CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v8);
  objc_storeStrong(v9 + 5, obj);
  if (ItemInAllAvailableKeychains)
  {
    CFTypeID v11 = CFGetTypeID(ItemInAllAvailableKeychains);
    if (v11 == SecIdentityGetTypeID())
    {
      uint64_t v12 = [MEMORY[0x263EFF980] arrayWithObject:ItemInAllAvailableKeychains];
    }
    else
    {
      CFTypeID v15 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v15 != CFArrayGetTypeID())
      {
        uint64_t v16 = 0;
LABEL_16:
        CFRelease(ItemInAllAvailableKeychains);
        uint64_t v17 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v16, "count"));
        uint64_t v18 = (void *)v38[5];
        v38[5] = v17;

        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __findIdentityByEmailAddress_block_invoke;
        v32[3] = &unk_26411CD70;
        long long v34 = &v43;
        id v19 = v5;
        id v33 = v19;
        uint64_t v35 = &v37;
        [v16 enumerateObjectsUsingBlock:v32];
        id v13 = (id)v38[5];

        if ([v13 count] == 1)
        {
          id v20 = [v13 objectAtIndex:0];
        }
        else
        {
          if (![v13 count])
          {
            if (a3)
            {
              +[MSError MSErrorWithDomain:MSErrorKeychainDomain[0], -25300, 1, v44[5], @"unable to find any identities with email address %@", v19 code errorLevel underlyingError description];
              uint64_t v14 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v14 = 0;
            }
            goto LABEL_22;
          }
          uint64_t v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          uint64_t v22 = (void *)v38[5];
          v38[5] = v21;

          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __findIdentityByEmailAddress_block_invoke_3;
          v31[3] = &unk_26411CD48;
          v31[4] = &v43;
          v31[5] = &v37;
          [v13 enumerateObjectsUsingBlock:v31];
          uint64_t v23 = [(id)v38[5] count];
          id v24 = (void *)v38[5];
          if (v23 != 1)
          {
            if ([v24 count])
            {
              id v27 = (id)v38[5];

              id v13 = v27;
            }
            v30[0] = 0;
            v30[1] = v30;
            v30[2] = 0x2020000000;
            v30[3] = 0;
            v29[0] = MEMORY[0x263EF8330];
            v29[1] = 3221225472;
            v29[2] = __findIdentityByEmailAddress_block_invoke_4;
            v29[3] = &unk_26411CD98;
            v29[4] = &v43;
            v29[5] = v30;
            v29[6] = &v49;
            [v13 enumerateObjectsUsingBlock:v29];
            if (a3)
            {
              id v28 = v44[5];
              if (v28) {
                *a3 = v28;
              }
            }
            uint64_t v14 = v50[3];
            _Block_object_dispose(v30, 8);
            goto LABEL_22;
          }
          id v20 = [v24 objectAtIndex:0];
        }
        id v25 = v20;
        v50[3] = (uint64_t)v25;

        uint64_t v14 = v50[3];
LABEL_22:

        goto LABEL_23;
      }
      uint64_t v12 = [MEMORY[0x263EFF980] arrayWithArray:ItemInAllAvailableKeychains];
    }
    uint64_t v16 = (void *)v12;
    goto LABEL_16;
  }
  if (a3)
  {
    +[MSError MSErrorWithDomain:MSErrorKeychainDomain[0] code:-25300 errorLevel:1 underlyingError:v44[5] description:@"unable to find any identities in keychain"];
    id v13 = 0;
    uint64_t v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
    uint64_t v14 = 0;
  }
LABEL_23:

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  return v14;
}

void sub_20D8BDBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

void __findIdentityByEmailAddress_block_invoke(uint64_t a1, void *a2)
{
  double v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  SecCertificateRef v5 = MSSecIdentityCopyCertificateWithError(v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    uint64_t v6 = SecCertificateCopyRFC822Names();
    if (v6)
    {
      id v7 = (void *)v6;
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      CFErrorRef v10 = __findIdentityByEmailAddress_block_invoke_2;
      CFTypeID v11 = &unk_26411CCF8;
      id v12 = *(id *)(a1 + 32);
      if ([v7 indexOfObjectPassingTest:&v8] != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addObject:", v3, v8, v9, v10, v11);
      }
      CFRelease(v5);
    }
    else
    {
      CFRelease(v5);
    }
  }
}

BOOL __findIdentityByEmailAddress_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

void __findIdentityByEmailAddress_block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v4 + 40);
  SecCertificateRef v5 = MSSecIdentityCopyCertificateWithError(v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(id *)(v6 + 40);
  id v7 = MSSecTrustCreateWithError((uint64_t)v5, 0, 0, 0, &v8);
  objc_storeStrong((id *)(v6 + 40), v8);
  if (v7)
  {
    if (SecTrustEvaluateWithError(v7, 0)) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
    }
    CFRelease(v7);
  }
  if (v5) {
    CFRelease(v5);
  }
}

void __findIdentityByEmailAddress_block_invoke_4(void *a1, void *a2)
{
  double v3 = a2;
  uint64_t v4 = *(void *)(a1[4] + 8);
  id obj = *(id *)(v4 + 40);
  SecCertificateRef v5 = MSSecIdentityCopyCertificateWithError(v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  SecCertificateNotValidAfter();
  uint64_t v7 = *(void *)(a1[5] + 8);
  if (v6 > *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    id v8 = *(const void **)(*(void *)(a1[6] + 8) + 24);
    if (v8) {
      CFRelease(v8);
    }
    *(void *)(*(void *)(a1[6] + 8) + 24) = CFRetain(v3);
  }
  if (v5) {
    CFRelease(v5);
  }
}

id asn1ErrorToNSError(id result, void *a2)
{
  double v3 = @"ASN1_BAD_TIMEFORMAT";
  switch((int)result)
  {
    case 1859794432:
      break;
    case 1859794433:
      double v3 = @"ASN1_MISSING_FIELD";
      break;
    case 1859794434:
      double v3 = @"ASN1_MISPLACED_FIELD";
      break;
    case 1859794435:
      double v3 = @"ASN1_TYPE_MISMATCH";
      break;
    case 1859794436:
      double v3 = @"ASN1_OVERFLOW";
      break;
    case 1859794437:
      double v3 = @"ASN1_OVERRUN";
      break;
    case 1859794438:
      double v3 = @"ASN1_BAD_ID";
      break;
    case 1859794439:
      double v3 = @"ASN1_BAD_LENGTH";
      break;
    case 1859794440:
      double v3 = @"ASN1_BAD_FORMAT";
      break;
    case 1859794441:
      double v3 = @"ASN1_PARSE_ERROR";
      break;
    case 1859794442:
      double v3 = @"ASN1_EXTRA_DATA";
      break;
    case 1859794443:
      double v3 = @"ASN1_BAD_CHARACTER";
      break;
    case 1859794444:
      double v3 = @"ASN1_MIN_CONSTRAINT";
      break;
    case 1859794445:
      double v3 = @"ASN1_MAX_CONSTRAINT";
      break;
    case 1859794446:
      double v3 = @"ASN1_EXACT_CONSTRAINT";
      break;
    case 1859794447:
      double v3 = @"ASN1_INDEF_OVERRUN";
      break;
    case 1859794448:
      double v3 = @"ASN1_INDEF_UNDERRUN";
      break;
    case 1859794449:
      double v3 = @"ASN1_GOT_BER";
      break;
    case 1859794450:
      double v3 = @"ASN1_INDEF_EXTRA_DATA";
      break;
    case 1859794451:
      double v3 = @"ASN1_INVALID_CHOICE";
      break;
    case 1859794452:
      double v3 = @"ASN1_GOT_INDEFINITE";
      break;
    default:
      double v3 = @"Unknown ASN1 error";
      if (!result) {
        double v3 = @"ASN1 success";
      }
      break;
  }
  if (a2)
  {
    CFTypeRef result = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0], result, *a2, @"%@", v3 code underlyingError description];
    *a2 = result;
  }
  return result;
}

uint64_t uint32ToNetworkByteOrder(uint64_t result, uint64_t a2, uint64_t a3)
{
  {
    *(unsigned char *)(a2 - 1 + a3) = result;
    CFTypeRef result = result >> 8;
  }
  return result;
}

uint64_t __dumpNSData_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __valueForBooleanDefault_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_20D8C2984(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t nsheim_decode_CMSVersion(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CMSVersion()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSVersion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CMSVersion, a1, a2, a3, a4);
}

uint64_t length_CMSVersion(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CMSVersion, a1);
}

uint64_t free_CMSVersion()
{
  return _asn1_free_top();
}

uint64_t copy_CMSVersion()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DigestAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DigestAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_DigestAlgorithmIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DigestAlgorithmIdentifier, a1, a2, a3, a4);
}

uint64_t length_DigestAlgorithmIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DigestAlgorithmIdentifier, a1);
}

uint64_t free_DigestAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_DigestAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DigestAlgorithmIdentifiers(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DigestAlgorithmIdentifiers()
{
  return _asn1_decode_top();
}

uint64_t encode_DigestAlgorithmIdentifiers(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DigestAlgorithmIdentifiers, a1, a2, a3, a4);
}

uint64_t length_DigestAlgorithmIdentifiers(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DigestAlgorithmIdentifiers, a1);
}

uint64_t free_DigestAlgorithmIdentifiers()
{
  return _asn1_free_top();
}

uint64_t copy_DigestAlgorithmIdentifiers()
{
  return _asn1_copy_top();
}

uint64_t add_DigestAlgorithmIdentifiers(unsigned int *a1)
{
  uint64_t v2 = malloc_type_realloc(*((void **)a1 + 1), 24 * *a1 + 24, 0x9EF01670uLL);
  if (!v2) {
    return 12;
  }
  *((void *)a1 + 1) = v2;
  uint64_t result = _asn1_copy_top();
  if (!result) {
    ++*a1;
  }
  return result;
}

uint64_t remove_DigestAlgorithmIdentifiers(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    return 1859794437;
  }
  _asn1_free_top();
  unsigned int v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove((void *)(*(void *)(a1 + 8) + 24 * a2), (const void *)(*(void *)(a1 + 8) + 24 * (a2 + 1)), 24 * (v4 - a2));
    unsigned int v4 = *(_DWORD *)a1;
  }
  SecCertificateRef v5 = malloc_type_realloc(*(void **)(a1 + 8), 24 * v4, 0x148F2CF7uLL);
  if (!v5 && *(_DWORD *)a1) {
    return 0;
  }
  uint64_t result = 0;
  *(void *)(a1 + 8) = v5;
  return result;
}

uint64_t nsheim_decode_SignatureAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SignatureAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_SignatureAlgorithmIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SignatureAlgorithmIdentifier, a1, a2, a3, a4);
}

uint64_t length_SignatureAlgorithmIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SignatureAlgorithmIdentifier, a1);
}

uint64_t free_SignatureAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_SignatureAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ContentType(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ContentType()
{
  return _asn1_decode_top();
}

uint64_t encode_ContentType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ContentType, a1, a2, a3, a4);
}

uint64_t length_ContentType(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ContentType, a1);
}

uint64_t free_ContentType()
{
  return _asn1_free_top();
}

uint64_t copy_ContentType()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MessageDigest(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_MessageDigest()
{
  return _asn1_decode_top();
}

uint64_t encode_MessageDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_MessageDigest, a1, a2, a3, a4);
}

uint64_t length_MessageDigest(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_MessageDigest, a1);
}

uint64_t free_MessageDigest()
{
  return _asn1_free_top();
}

uint64_t copy_MessageDigest()
{
  return _asn1_copy_top();
}

uint64_t decode_ContentInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_ContentInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ContentInfo, a1, a2, a3, a4);
}

uint64_t length_ContentInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ContentInfo, a1);
}

uint64_t copy_ContentInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DataContent(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DataContent()
{
  return _asn1_decode_top();
}

uint64_t encode_DataContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DataContent, a1, a2, a3, a4);
}

uint64_t length_DataContent(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DataContent, a1);
}

uint64_t free_DataContent()
{
  return _asn1_free_top();
}

uint64_t copy_DataContent()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncapsulatedContentInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_EncapsulatedContentInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_EncapsulatedContentInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_EncapsulatedContentInfo, a1, a2, a3, a4);
}

uint64_t length_EncapsulatedContentInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_EncapsulatedContentInfo, a1);
}

uint64_t free_EncapsulatedContentInfo()
{
  return _asn1_free_top();
}

uint64_t copy_EncapsulatedContentInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateChoices(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CertificateChoices()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateChoices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CertificateChoices, a1, a2, a3, a4);
}

uint64_t length_CertificateChoices(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CertificateChoices, a1);
}

uint64_t free_CertificateChoices()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateChoices()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateSet(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CertificateSet()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateSet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CertificateSet, a1, a2, a3, a4);
}

uint64_t length_CertificateSet(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CertificateSet, a1);
}

uint64_t free_CertificateSet()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateSet()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateList(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CertificateList()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CertificateList, a1, a2, a3, a4);
}

uint64_t length_CertificateList(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CertificateList, a1);
}

uint64_t free_CertificateList()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateList()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateRevocationLists(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CertificateRevocationLists()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateRevocationLists(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CertificateRevocationLists, a1, a2, a3, a4);
}

uint64_t length_CertificateRevocationLists(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CertificateRevocationLists, a1);
}

uint64_t free_CertificateRevocationLists()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateRevocationLists()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_IssuerAndSerialNumber(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_IssuerAndSerialNumber()
{
  return _asn1_decode_top();
}

uint64_t encode_IssuerAndSerialNumber(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_IssuerAndSerialNumber, a1, a2, a3, a4);
}

uint64_t length_IssuerAndSerialNumber(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_IssuerAndSerialNumber, a1);
}

uint64_t free_IssuerAndSerialNumber()
{
  return _asn1_free_top();
}

uint64_t copy_IssuerAndSerialNumber()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t encode_CMSIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CMSIdentifier, a1, a2, a3, a4);
}

uint64_t length_CMSIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CMSIdentifier, a1);
}

uint64_t copy_CMSIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignerIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SignerIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_SignerIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SignerIdentifier, a1, a2, a3, a4);
}

uint64_t length_SignerIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SignerIdentifier, a1);
}

uint64_t free_SignerIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_SignerIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RecipientIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RecipientIdentifier, a1, a2, a3, a4);
}

uint64_t length_RecipientIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RecipientIdentifier, a1);
}

uint64_t free_RecipientIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSAttributes(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CMSAttributes()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSAttributes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CMSAttributes, a1, a2, a3, a4);
}

uint64_t length_CMSAttributes(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CMSAttributes, a1);
}

uint64_t free_CMSAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_CMSAttributes()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSOrderedAttributes(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CMSOrderedAttributes()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSOrderedAttributes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CMSOrderedAttributes, a1, a2, a3, a4);
}

uint64_t length_CMSOrderedAttributes(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CMSOrderedAttributes, a1);
}

uint64_t free_CMSOrderedAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_CMSOrderedAttributes()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignatureValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SignatureValue()
{
  return _asn1_decode_top();
}

uint64_t encode_SignatureValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SignatureValue, a1, a2, a3, a4);
}

uint64_t length_SignatureValue(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SignatureValue, a1);
}

uint64_t free_SignatureValue()
{
  return _asn1_free_top();
}

uint64_t copy_SignatureValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignerInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SignerInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SignerInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SignerInfo, a1, a2, a3, a4);
}

uint64_t length_SignerInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SignerInfo, a1);
}

uint64_t nsheim_decode_SignerInfos(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SignerInfos()
{
  return _asn1_decode_top();
}

uint64_t encode_SignerInfos(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SignerInfos, a1, a2, a3, a4);
}

uint64_t length_SignerInfos(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SignerInfos, a1);
}

uint64_t free_SignerInfos()
{
  return _asn1_free_top();
}

uint64_t copy_SignerInfos()
{
  return _asn1_copy_top();
}

uint64_t decode_CMSSignedData()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSSignedData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CMSSignedData, a1, a2, a3, a4);
}

uint64_t length_CMSSignedData(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CMSSignedData, a1);
}

uint64_t copy_CMSSignedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OriginatorInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_OriginatorInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_OriginatorInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_OriginatorInfo, a1, a2, a3, a4);
}

uint64_t length_OriginatorInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_OriginatorInfo, a1);
}

uint64_t free_OriginatorInfo()
{
  return _asn1_free_top();
}

uint64_t copy_OriginatorInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyEncryptionAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyEncryptionAlgorithmIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_KeyEncryptionAlgorithmIdentifier, a1, a2, a3, a4);
}

uint64_t length_KeyEncryptionAlgorithmIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_KeyEncryptionAlgorithmIdentifier, a1);
}

uint64_t free_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ContentEncryptionAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_ContentEncryptionAlgorithmIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ContentEncryptionAlgorithmIdentifier, a1, a2, a3, a4);
}

uint64_t length_ContentEncryptionAlgorithmIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ContentEncryptionAlgorithmIdentifier, a1);
}

uint64_t free_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncryptedKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_EncryptedKey()
{
  return _asn1_decode_top();
}

uint64_t encode_EncryptedKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_EncryptedKey, a1, a2, a3, a4);
}

uint64_t length_EncryptedKey(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_EncryptedKey, a1);
}

uint64_t free_EncryptedKey()
{
  return _asn1_free_top();
}

uint64_t copy_EncryptedKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyTransRecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_KeyTransRecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyTransRecipientInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_KeyTransRecipientInfo, a1, a2, a3, a4);
}

uint64_t length_KeyTransRecipientInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_KeyTransRecipientInfo, a1);
}

uint64_t free_KeyTransRecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_KeyTransRecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_ECC_CMS_SharedInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_ECC_CMS_SharedInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SecCMS_ECC_CMS_SharedInfo, a1, a2, a3, a4);
}

uint64_t length_SecCMS_ECC_CMS_SharedInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SecCMS_ECC_CMS_SharedInfo, a1);
}

uint64_t free_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECC_CMS_SharedInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ECC_CMS_SharedInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_ECC_CMS_SharedInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ECC_CMS_SharedInfo, a1, a2, a3, a4);
}

uint64_t length_ECC_CMS_SharedInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ECC_CMS_SharedInfo, a1);
}

uint64_t free_ECC_CMS_SharedInfo()
{
  return _asn1_free_top();
}

uint64_t copy_ECC_CMS_SharedInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OtherKeyAttribute(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_OtherKeyAttribute()
{
  return _asn1_decode_top();
}

uint64_t encode_OtherKeyAttribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_OtherKeyAttribute, a1, a2, a3, a4);
}

uint64_t length_OtherKeyAttribute(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_OtherKeyAttribute, a1);
}

uint64_t free_OtherKeyAttribute()
{
  return _asn1_free_top();
}

uint64_t copy_OtherKeyAttribute()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientKeyIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RecipientKeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientKeyIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RecipientKeyIdentifier, a1, a2, a3, a4);
}

uint64_t length_RecipientKeyIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RecipientKeyIdentifier, a1);
}

uint64_t free_RecipientKeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientKeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyAgreeRecipientIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_KeyAgreeRecipientIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyAgreeRecipientIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_KeyAgreeRecipientIdentifier, a1, a2, a3, a4);
}

uint64_t length_KeyAgreeRecipientIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_KeyAgreeRecipientIdentifier, a1);
}

uint64_t free_KeyAgreeRecipientIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_KeyAgreeRecipientIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientEncryptedKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RecipientEncryptedKey()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientEncryptedKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RecipientEncryptedKey, a1, a2, a3, a4);
}

uint64_t length_RecipientEncryptedKey(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RecipientEncryptedKey, a1);
}

uint64_t free_RecipientEncryptedKey()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientEncryptedKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientEncryptedKeys(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RecipientEncryptedKeys()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientEncryptedKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RecipientEncryptedKeys, a1, a2, a3, a4);
}

uint64_t length_RecipientEncryptedKeys(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RecipientEncryptedKeys, a1);
}

uint64_t free_RecipientEncryptedKeys()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientEncryptedKeys()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_UserKeyingMaterial(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_UserKeyingMaterial()
{
  return _asn1_decode_top();
}

uint64_t encode_UserKeyingMaterial(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_UserKeyingMaterial, a1, a2, a3, a4);
}

uint64_t length_UserKeyingMaterial(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_UserKeyingMaterial, a1);
}

uint64_t free_UserKeyingMaterial()
{
  return _asn1_free_top();
}

uint64_t copy_UserKeyingMaterial()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OriginatorPublicKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_OriginatorPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_OriginatorPublicKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_OriginatorPublicKey, a1, a2, a3, a4);
}

uint64_t length_OriginatorPublicKey(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_OriginatorPublicKey, a1);
}

uint64_t free_OriginatorPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_OriginatorPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_OriginatorIdentifierOrKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_OriginatorIdentifierOrKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SecCMS_OriginatorIdentifierOrKey, a1, a2, a3, a4);
}

uint64_t length_SecCMS_OriginatorIdentifierOrKey(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SecCMS_OriginatorIdentifierOrKey, a1);
}

uint64_t free_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OriginatorIdentifierOrKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_OriginatorIdentifierOrKey()
{
  return _asn1_decode_top();
}

uint64_t encode_OriginatorIdentifierOrKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_OriginatorIdentifierOrKey, a1, a2, a3, a4);
}

uint64_t length_OriginatorIdentifierOrKey(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_OriginatorIdentifierOrKey, a1);
}

uint64_t free_OriginatorIdentifierOrKey()
{
  return _asn1_free_top();
}

uint64_t copy_OriginatorIdentifierOrKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_KeyAgreeRecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_KeyAgreeRecipientInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SecCMS_KeyAgreeRecipientInfo, a1, a2, a3, a4);
}

uint64_t length_SecCMS_KeyAgreeRecipientInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SecCMS_KeyAgreeRecipientInfo, a1);
}

uint64_t free_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyAgreeRecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_KeyAgreeRecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyAgreeRecipientInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_KeyAgreeRecipientInfo, a1, a2, a3, a4);
}

uint64_t length_KeyAgreeRecipientInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_KeyAgreeRecipientInfo, a1);
}

uint64_t free_KeyAgreeRecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_KeyAgreeRecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_RecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_RecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_RecipientInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SecCMS_RecipientInfo, a1, a2, a3, a4);
}

uint64_t length_SecCMS_RecipientInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SecCMS_RecipientInfo, a1);
}

uint64_t free_SecCMS_RecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_RecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RecipientInfo, a1, a2, a3, a4);
}

uint64_t length_RecipientInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RecipientInfo, a1);
}

uint64_t free_RecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_RecipientInfos(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_RecipientInfos()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_RecipientInfos(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SecCMS_RecipientInfos, a1, a2, a3, a4);
}

uint64_t length_SecCMS_RecipientInfos(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SecCMS_RecipientInfos, a1);
}

uint64_t free_SecCMS_RecipientInfos()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_RecipientInfos()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientInfos(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RecipientInfos()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientInfos(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RecipientInfos, a1, a2, a3, a4);
}

uint64_t length_RecipientInfos(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RecipientInfos, a1);
}

uint64_t free_RecipientInfos()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientInfos()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncryptedContent(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_EncryptedContent()
{
  return _asn1_decode_top();
}

uint64_t encode_EncryptedContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_EncryptedContent, a1, a2, a3, a4);
}

uint64_t length_EncryptedContent(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_EncryptedContent, a1);
}

uint64_t free_EncryptedContent()
{
  return _asn1_free_top();
}

uint64_t copy_EncryptedContent()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncryptedContentInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_EncryptedContentInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_EncryptedContentInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_EncryptedContentInfo, a1, a2, a3, a4);
}

uint64_t length_EncryptedContentInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_EncryptedContentInfo, a1);
}

uint64_t free_EncryptedContentInfo()
{
  return _asn1_free_top();
}

uint64_t copy_EncryptedContentInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_UnprotectedAttributes(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_UnprotectedAttributes()
{
  return _asn1_decode_top();
}

uint64_t encode_UnprotectedAttributes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_UnprotectedAttributes, a1, a2, a3, a4);
}

uint64_t length_UnprotectedAttributes(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_UnprotectedAttributes, a1);
}

uint64_t free_UnprotectedAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_UnprotectedAttributes()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSEncryptedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CMSEncryptedData()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSEncryptedData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CMSEncryptedData, a1, a2, a3, a4);
}

uint64_t length_CMSEncryptedData(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CMSEncryptedData, a1);
}

uint64_t free_CMSEncryptedData()
{
  return _asn1_free_top();
}

uint64_t copy_CMSEncryptedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_EnvelopedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_EnvelopedData()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_EnvelopedData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SecCMS_EnvelopedData, a1, a2, a3, a4);
}

uint64_t length_SecCMS_EnvelopedData(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SecCMS_EnvelopedData, a1);
}

uint64_t free_SecCMS_EnvelopedData()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_EnvelopedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EnvelopedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_EnvelopedData()
{
  return _asn1_decode_top();
}

uint64_t encode_EnvelopedData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_EnvelopedData, a1, a2, a3, a4);
}

uint64_t length_EnvelopedData(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_EnvelopedData, a1);
}

uint64_t free_EnvelopedData()
{
  return _asn1_free_top();
}

uint64_t copy_EnvelopedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MessageAuthenticationCode(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_MessageAuthenticationCode()
{
  return _asn1_decode_top();
}

uint64_t encode_MessageAuthenticationCode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_MessageAuthenticationCode, a1, a2, a3, a4);
}

uint64_t length_MessageAuthenticationCode(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_MessageAuthenticationCode, a1);
}

uint64_t free_MessageAuthenticationCode()
{
  return _asn1_free_top();
}

uint64_t copy_MessageAuthenticationCode()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AuthEnvelopedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AuthEnvelopedData()
{
  return _asn1_decode_top();
}

uint64_t encode_AuthEnvelopedData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AuthEnvelopedData, a1, a2, a3, a4);
}

uint64_t length_AuthEnvelopedData(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AuthEnvelopedData, a1);
}

uint64_t free_AuthEnvelopedData()
{
  return _asn1_free_top();
}

uint64_t copy_AuthEnvelopedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AES_CCM_ICVlen(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AES_CCM_ICVlen()
{
  return _asn1_decode_top();
}

uint64_t encode_AES_CCM_ICVlen(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AES_CCM_ICVlen, a1, a2, a3, a4);
}

uint64_t length_AES_CCM_ICVlen(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AES_CCM_ICVlen, a1);
}

uint64_t free_AES_CCM_ICVlen()
{
  return _asn1_free_top();
}

uint64_t copy_AES_CCM_ICVlen()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CCMParameters(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CCMParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_CCMParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CCMParameters, a1, a2, a3, a4);
}

uint64_t length_CCMParameters(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CCMParameters, a1);
}

uint64_t free_CCMParameters()
{
  return _asn1_free_top();
}

uint64_t copy_CCMParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AES_GCM_ICVlen(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AES_GCM_ICVlen()
{
  return _asn1_decode_top();
}

uint64_t encode_AES_GCM_ICVlen(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AES_GCM_ICVlen, a1, a2, a3, a4);
}

uint64_t length_AES_GCM_ICVlen(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AES_GCM_ICVlen, a1);
}

uint64_t free_AES_GCM_ICVlen()
{
  return _asn1_free_top();
}

uint64_t copy_AES_GCM_ICVlen()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GCMParameters(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_GCMParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_GCMParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_GCMParameters, a1, a2, a3, a4);
}

uint64_t length_GCMParameters(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_GCMParameters, a1);
}

uint64_t free_GCMParameters()
{
  return _asn1_free_top();
}

uint64_t copy_GCMParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSRC2CBCParameter(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CMSRC2CBCParameter()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSRC2CBCParameter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CMSRC2CBCParameter, a1, a2, a3, a4);
}

uint64_t length_CMSRC2CBCParameter(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CMSRC2CBCParameter, a1);
}

uint64_t free_CMSRC2CBCParameter()
{
  return _asn1_free_top();
}

uint64_t copy_CMSRC2CBCParameter()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSCBCParameter(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CMSCBCParameter()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSCBCParameter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CMSCBCParameter, a1, a2, a3, a4);
}

uint64_t length_CMSCBCParameter(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CMSCBCParameter, a1);
}

uint64_t free_CMSCBCParameter()
{
  return _asn1_free_top();
}

uint64_t copy_CMSCBCParameter()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CompressionAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CompressionAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_CompressionAlgorithmIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CompressionAlgorithmIdentifier, a1, a2, a3, a4);
}

uint64_t length_CompressionAlgorithmIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CompressionAlgorithmIdentifier, a1);
}

uint64_t free_CompressionAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_CompressionAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CompressedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CompressedData()
{
  return _asn1_decode_top();
}

uint64_t encode_CompressedData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CompressedData, a1, a2, a3, a4);
}

uint64_t length_CompressedData(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CompressedData, a1);
}

uint64_t free_CompressedData()
{
  return _asn1_free_top();
}

uint64_t copy_CompressedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_SMIMEEncryptionKeyPreference(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_SMIMEEncryptionKeyPreference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SecCMS_SMIMEEncryptionKeyPreference, a1, a2, a3, a4);
}

uint64_t length_SecCMS_SMIMEEncryptionKeyPreference(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SecCMS_SMIMEEncryptionKeyPreference, a1);
}

uint64_t free_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SMIMEEncryptionKeyPreference(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SMIMEEncryptionKeyPreference()
{
  return _asn1_decode_top();
}

uint64_t encode_SMIMEEncryptionKeyPreference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SMIMEEncryptionKeyPreference, a1, a2, a3, a4);
}

uint64_t length_SMIMEEncryptionKeyPreference(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SMIMEEncryptionKeyPreference, a1);
}

uint64_t free_SMIMEEncryptionKeyPreference()
{
  return _asn1_free_top();
}

uint64_t copy_SMIMEEncryptionKeyPreference()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SMIMECapability(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SMIMECapability()
{
  return _asn1_decode_top();
}

uint64_t encode_SMIMECapability(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SMIMECapability, a1, a2, a3, a4);
}

uint64_t length_SMIMECapability(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SMIMECapability, a1);
}

uint64_t free_SMIMECapability()
{
  return _asn1_free_top();
}

uint64_t copy_SMIMECapability()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SMIMECapabilities(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SMIMECapabilities()
{
  return _asn1_decode_top();
}

uint64_t encode_SMIMECapabilities(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SMIMECapabilities, a1, a2, a3, a4);
}

uint64_t length_SMIMECapabilities(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SMIMECapabilities, a1);
}

uint64_t free_SMIMECapabilities()
{
  return _asn1_free_top();
}

uint64_t copy_SMIMECapabilities()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignAttrsHash(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SignAttrsHash()
{
  return _asn1_decode_top();
}

uint64_t encode_SignAttrsHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SignAttrsHash, a1, a2, a3, a4);
}

uint64_t length_SignAttrsHash(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SignAttrsHash, a1);
}

uint64_t free_SignAttrsHash()
{
  return _asn1_free_top();
}

uint64_t copy_SignAttrsHash()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MultipleSignatures(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_MultipleSignatures()
{
  return _asn1_decode_top();
}

uint64_t encode_MultipleSignatures(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_MultipleSignatures, a1, a2, a3, a4);
}

uint64_t length_MultipleSignatures(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_MultipleSignatures, a1);
}

uint64_t free_MultipleSignatures()
{
  return _asn1_free_top();
}

uint64_t copy_MultipleSignatures()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MessageImprint(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_MessageImprint()
{
  return _asn1_decode_top();
}

uint64_t encode_MessageImprint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_MessageImprint, a1, a2, a3, a4);
}

uint64_t length_MessageImprint(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_MessageImprint, a1);
}

uint64_t free_MessageImprint()
{
  return _asn1_free_top();
}

uint64_t copy_MessageImprint()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TSAPolicyId(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_TSAPolicyId()
{
  return _asn1_decode_top();
}

uint64_t encode_TSAPolicyId(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_TSAPolicyId, a1, a2, a3, a4);
}

uint64_t length_TSAPolicyId(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_TSAPolicyId, a1);
}

uint64_t free_TSAPolicyId()
{
  return _asn1_free_top();
}

uint64_t copy_TSAPolicyId()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TimeStampReq(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_TimeStampReq()
{
  return _asn1_decode_top();
}

uint64_t encode_TimeStampReq(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_TimeStampReq, a1, a2, a3, a4);
}

uint64_t length_TimeStampReq(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_TimeStampReq, a1);
}

uint64_t free_TimeStampReq()
{
  return _asn1_free_top();
}

uint64_t copy_TimeStampReq()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIStatus(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_PKIStatus()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_PKIStatus, a1, a2, a3, a4);
}

uint64_t length_PKIStatus(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_PKIStatus, a1);
}

uint64_t free_PKIStatus()
{
  return _asn1_free_top();
}

uint64_t copy_PKIStatus()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIFailureInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_PKIFailureInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIFailureInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_PKIFailureInfo, a1, a2, a3, a4);
}

uint64_t length_PKIFailureInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_PKIFailureInfo, a1);
}

uint64_t free_PKIFailureInfo()
{
  return _asn1_free_top();
}

uint64_t copy_PKIFailureInfo()
{
  return _asn1_copy_top();
}

uint64_t PKIFailureInfo2int(int a1)
{
  return a1 & 0x203C025;
}

uint64_t int2PKIFailureInfo(int a1)
{
  return a1 & 0x203C025;
}

uint64_t nsheim_decode_PKIFreeText(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_PKIFreeText()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIFreeText(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_PKIFreeText, a1, a2, a3, a4);
}

uint64_t length_PKIFreeText(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_PKIFreeText, a1);
}

uint64_t free_PKIFreeText()
{
  return _asn1_free_top();
}

uint64_t copy_PKIFreeText()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIStatusInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_PKIStatusInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIStatusInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_PKIStatusInfo, a1, a2, a3, a4);
}

uint64_t length_PKIStatusInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_PKIStatusInfo, a1);
}

uint64_t free_PKIStatusInfo()
{
  return _asn1_free_top();
}

uint64_t copy_PKIStatusInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TimeStampToken(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_TimeStampToken()
{
  return _asn1_decode_top();
}

uint64_t encode_TimeStampToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_TimeStampToken, a1, a2, a3, a4);
}

uint64_t length_TimeStampToken(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_TimeStampToken, a1);
}

uint64_t free_TimeStampToken()
{
  return _asn1_free_top();
}

uint64_t copy_TimeStampToken()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Accuracy(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Accuracy()
{
  return _asn1_decode_top();
}

uint64_t encode_Accuracy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Accuracy, a1, a2, a3, a4);
}

uint64_t length_Accuracy(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Accuracy, a1);
}

uint64_t free_Accuracy()
{
  return _asn1_free_top();
}

uint64_t copy_Accuracy()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TSTInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_TSTInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_TSTInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_TSTInfo, a1, a2, a3, a4);
}

uint64_t length_TSTInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_TSTInfo, a1);
}

uint64_t free_TSTInfo()
{
  return _asn1_free_top();
}

uint64_t copy_TSTInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TimeStampResp(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_TimeStampResp()
{
  return _asn1_decode_top();
}

uint64_t encode_TimeStampResp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_TimeStampResp, a1, a2, a3, a4);
}

uint64_t length_TimeStampResp(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_TimeStampResp, a1);
}

uint64_t free_TimeStampResp()
{
  return _asn1_free_top();
}

uint64_t copy_TimeStampResp()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Version(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Version()
{
  return _asn1_decode_top();
}

uint64_t encode_Version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Version, a1, a2, a3, a4);
}

uint64_t length_Version(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Version, a1);
}

uint64_t free_Version()
{
  return _asn1_free_top();
}

uint64_t copy_Version()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t encode_AlgorithmIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AlgorithmIdentifier, a1, a2, a3, a4);
}

uint64_t length_AlgorithmIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AlgorithmIdentifier, a1);
}

uint64_t nsheim_decode_AttributeType(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AttributeType()
{
  return _asn1_decode_top();
}

uint64_t encode_AttributeType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AttributeType, a1, a2, a3, a4);
}

uint64_t length_AttributeType(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AttributeType, a1);
}

uint64_t free_AttributeType()
{
  return _asn1_free_top();
}

uint64_t copy_AttributeType()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AttributeValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AttributeValue()
{
  return _asn1_decode_top();
}

uint64_t encode_AttributeValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AttributeValue, a1, a2, a3, a4);
}

uint64_t length_AttributeValue(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AttributeValue, a1);
}

uint64_t free_AttributeValue()
{
  return _asn1_free_top();
}

uint64_t copy_AttributeValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DirectoryString(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DirectoryString()
{
  return _asn1_decode_top();
}

uint64_t encode_DirectoryString(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DirectoryString, a1, a2, a3, a4);
}

uint64_t length_DirectoryString(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DirectoryString, a1);
}

uint64_t free_DirectoryString()
{
  return _asn1_free_top();
}

uint64_t copy_DirectoryString()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Attribute(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Attribute()
{
  return _asn1_decode_top();
}

uint64_t encode_Attribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Attribute, a1, a2, a3, a4);
}

uint64_t length_Attribute(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Attribute, a1);
}

uint64_t free_Attribute()
{
  return _asn1_free_top();
}

uint64_t copy_Attribute()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AttributeTypeAndValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AttributeTypeAndValue()
{
  return _asn1_decode_top();
}

uint64_t encode_AttributeTypeAndValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AttributeTypeAndValue, a1, a2, a3, a4);
}

uint64_t length_AttributeTypeAndValue(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AttributeTypeAndValue, a1);
}

uint64_t free_AttributeTypeAndValue()
{
  return _asn1_free_top();
}

uint64_t copy_AttributeTypeAndValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RelativeDistinguishedName(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RelativeDistinguishedName()
{
  return _asn1_decode_top();
}

uint64_t encode_RelativeDistinguishedName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RelativeDistinguishedName, a1, a2, a3, a4);
}

uint64_t length_RelativeDistinguishedName(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RelativeDistinguishedName, a1);
}

uint64_t free_RelativeDistinguishedName()
{
  return _asn1_free_top();
}

uint64_t copy_RelativeDistinguishedName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RDNSequence(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RDNSequence()
{
  return _asn1_decode_top();
}

uint64_t encode_RDNSequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RDNSequence, a1, a2, a3, a4);
}

uint64_t length_RDNSequence(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RDNSequence, a1);
}

uint64_t free_RDNSequence()
{
  return _asn1_free_top();
}

uint64_t copy_RDNSequence()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Name(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Name()
{
  return _asn1_decode_top();
}

uint64_t encode_Name(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Name, a1, a2, a3, a4);
}

uint64_t length_Name(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Name, a1);
}

uint64_t free_Name()
{
  return _asn1_free_top();
}

uint64_t copy_Name()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateSerialNumber(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t encode_CertificateSerialNumber(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CertificateSerialNumber, a1, a2, a3, a4);
}

uint64_t length_CertificateSerialNumber(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CertificateSerialNumber, a1);
}

uint64_t copy_CertificateSerialNumber()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Time(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Time()
{
  return _asn1_decode_top();
}

uint64_t encode_Time(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Time, a1, a2, a3, a4);
}

uint64_t length_Time(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Time, a1);
}

uint64_t free_Time()
{
  return _asn1_free_top();
}

uint64_t copy_Time()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Validity(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Validity()
{
  return _asn1_decode_top();
}

uint64_t encode_Validity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Validity, a1, a2, a3, a4);
}

uint64_t length_Validity(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Validity, a1);
}

uint64_t free_Validity()
{
  return _asn1_free_top();
}

uint64_t copy_Validity()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_UniqueIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_UniqueIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_UniqueIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_UniqueIdentifier, a1, a2, a3, a4);
}

uint64_t length_UniqueIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_UniqueIdentifier, a1);
}

uint64_t free_UniqueIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_UniqueIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SubjectPublicKeyInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SubjectPublicKeyInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SubjectPublicKeyInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SubjectPublicKeyInfo, a1, a2, a3, a4);
}

uint64_t length_SubjectPublicKeyInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SubjectPublicKeyInfo, a1);
}

uint64_t free_SubjectPublicKeyInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SubjectPublicKeyInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Extension(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Extension()
{
  return _asn1_decode_top();
}

uint64_t encode_Extension(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Extension, a1, a2, a3, a4);
}

uint64_t length_Extension(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Extension, a1);
}

uint64_t free_Extension()
{
  return _asn1_free_top();
}

uint64_t copy_Extension()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Extensions(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Extensions()
{
  return _asn1_decode_top();
}

uint64_t encode_Extensions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Extensions, a1, a2, a3, a4);
}

uint64_t length_Extensions(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Extensions, a1);
}

uint64_t free_Extensions()
{
  return _asn1_free_top();
}

uint64_t copy_Extensions()
{
  return _asn1_copy_top();
}

uint64_t add_Extensions(unsigned int *a1)
{
  uint64_t v2 = malloc_type_realloc(*((void **)a1 + 1), 40 * *a1 + 40, 0xCAB23D5CuLL);
  if (!v2) {
    return 12;
  }
  *((void *)a1 + 1) = v2;
  uint64_t result = _asn1_copy_top();
  if (!result) {
    ++*a1;
  }
  return result;
}

uint64_t remove_Extensions(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    return 1859794437;
  }
  _asn1_free_top();
  unsigned int v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove((void *)(*(void *)(a1 + 8) + 40 * a2), (const void *)(*(void *)(a1 + 8) + 40 * (a2 + 1)), 40 * (v4 - a2));
    unsigned int v4 = *(_DWORD *)a1;
  }
  SecCertificateRef v5 = malloc_type_realloc(*(void **)(a1 + 8), 40 * v4, 0x66CF9F7DuLL);
  if (!v5 && *(_DWORD *)a1) {
    return 0;
  }
  uint64_t result = 0;
  *(void *)(a1 + 8) = v5;
  return result;
}

uint64_t nsheim_decode_TBSCertificate(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_TBSCertificate()
{
  return _asn1_decode_top();
}

uint64_t encode_TBSCertificate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_TBSCertificate, a1, a2, a3, a4);
}

uint64_t length_TBSCertificate(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_TBSCertificate, a1);
}

uint64_t free_TBSCertificate()
{
  return _asn1_free_top();
}

uint64_t copy_TBSCertificate()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Certificate(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Certificate()
{
  return _asn1_decode_top();
}

uint64_t encode_Certificate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Certificate, a1, a2, a3, a4);
}

uint64_t length_Certificate(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Certificate, a1);
}

uint64_t free_Certificate()
{
  return _asn1_free_top();
}

uint64_t copy_Certificate()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Certificates(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_Certificates()
{
  return _asn1_decode_top();
}

uint64_t encode_Certificates(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Certificates, a1, a2, a3, a4);
}

uint64_t length_Certificates(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Certificates, a1);
}

uint64_t free_Certificates()
{
  return _asn1_free_top();
}

uint64_t copy_Certificates()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ValidationParms(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ValidationParms()
{
  return _asn1_decode_top();
}

uint64_t encode_ValidationParms(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ValidationParms, a1, a2, a3, a4);
}

uint64_t length_ValidationParms(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ValidationParms, a1);
}

uint64_t free_ValidationParms()
{
  return _asn1_free_top();
}

uint64_t copy_ValidationParms()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DomainParameters(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DomainParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_DomainParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DomainParameters, a1, a2, a3, a4);
}

uint64_t length_DomainParameters(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DomainParameters, a1);
}

uint64_t free_DomainParameters()
{
  return _asn1_free_top();
}

uint64_t copy_DomainParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DHParameter(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DHParameter()
{
  return _asn1_decode_top();
}

uint64_t encode_DHParameter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DHParameter, a1, a2, a3, a4);
}

uint64_t length_DHParameter(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DHParameter, a1);
}

uint64_t free_DHParameter()
{
  return _asn1_free_top();
}

uint64_t copy_DHParameter()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DHPublicKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DHPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_DHPublicKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DHPublicKey, a1, a2, a3, a4);
}

uint64_t length_DHPublicKey(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DHPublicKey, a1);
}

uint64_t free_DHPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_DHPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OtherName(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_OtherName()
{
  return _asn1_decode_top();
}

uint64_t encode_OtherName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_OtherName, a1, a2, a3, a4);
}

uint64_t length_OtherName(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_OtherName, a1);
}

uint64_t free_OtherName()
{
  return _asn1_free_top();
}

uint64_t copy_OtherName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralName(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_GeneralName()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_GeneralName, a1, a2, a3, a4);
}

uint64_t length_GeneralName(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_GeneralName, a1);
}

uint64_t free_GeneralName()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralNames(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_GeneralNames()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralNames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_GeneralNames, a1, a2, a3, a4);
}

uint64_t length_GeneralNames(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_GeneralNames, a1);
}

uint64_t free_GeneralNames()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralNames()
{
  return _asn1_copy_top();
}

uint64_t add_GeneralNames(unsigned int *a1)
{
  uint64_t v2 = malloc_type_realloc(*((void **)a1 + 1), 40 * *a1 + 40, 0xEE883072uLL);
  if (!v2) {
    return 12;
  }
  *((void *)a1 + 1) = v2;
  uint64_t result = _asn1_copy_top();
  if (!result) {
    ++*a1;
  }
  return result;
}

uint64_t remove_GeneralNames(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    return 1859794437;
  }
  _asn1_free_top();
  unsigned int v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove((void *)(*(void *)(a1 + 8) + 40 * a2), (const void *)(*(void *)(a1 + 8) + 40 * (a2 + 1)), 40 * (v4 - a2));
    unsigned int v4 = *(_DWORD *)a1;
  }
  SecCertificateRef v5 = malloc_type_realloc(*(void **)(a1 + 8), 40 * v4, 0x24FFAD1DuLL);
  if (!v5 && *(_DWORD *)a1) {
    return 0;
  }
  uint64_t result = 0;
  *(void *)(a1 + 8) = v5;
  return result;
}

uint64_t nsheim_decode_KeyUsage(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_KeyUsage()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyUsage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_KeyUsage, a1, a2, a3, a4);
}

uint64_t length_KeyUsage(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_KeyUsage, a1);
}

uint64_t free_KeyUsage()
{
  return _asn1_free_top();
}

uint64_t copy_KeyUsage()
{
  return _asn1_copy_top();
}

uint64_t KeyUsage2int(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t int2KeyUsage(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t nsheim_decode_KeyIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_KeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_KeyIdentifier, a1, a2, a3, a4);
}

uint64_t length_KeyIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_KeyIdentifier, a1);
}

uint64_t free_KeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_KeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AuthorityKeyIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AuthorityKeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_AuthorityKeyIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AuthorityKeyIdentifier, a1, a2, a3, a4);
}

uint64_t length_AuthorityKeyIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AuthorityKeyIdentifier, a1);
}

uint64_t free_AuthorityKeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_AuthorityKeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SubjectKeyIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_SubjectKeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_SubjectKeyIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_SubjectKeyIdentifier, a1, a2, a3, a4);
}

uint64_t length_SubjectKeyIdentifier(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_SubjectKeyIdentifier, a1);
}

uint64_t free_SubjectKeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_SubjectKeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_BasicConstraints(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_BasicConstraints()
{
  return _asn1_decode_top();
}

uint64_t encode_BasicConstraints(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_BasicConstraints, a1, a2, a3, a4);
}

uint64_t length_BasicConstraints(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_BasicConstraints, a1);
}

uint64_t free_BasicConstraints()
{
  return _asn1_free_top();
}

uint64_t copy_BasicConstraints()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_BaseDistance(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_BaseDistance()
{
  return _asn1_decode_top();
}

uint64_t encode_BaseDistance(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_BaseDistance, a1, a2, a3, a4);
}

uint64_t length_BaseDistance(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_BaseDistance, a1);
}

uint64_t free_BaseDistance()
{
  return _asn1_free_top();
}

uint64_t copy_BaseDistance()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralSubtree(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_GeneralSubtree()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralSubtree(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_GeneralSubtree, a1, a2, a3, a4);
}

uint64_t length_GeneralSubtree(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_GeneralSubtree, a1);
}

uint64_t free_GeneralSubtree()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralSubtree()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralSubtrees(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_GeneralSubtrees()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralSubtrees(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_GeneralSubtrees, a1, a2, a3, a4);
}

uint64_t length_GeneralSubtrees(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_GeneralSubtrees, a1);
}

uint64_t free_GeneralSubtrees()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralSubtrees()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_NameConstraints(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_NameConstraints()
{
  return _asn1_decode_top();
}

uint64_t encode_NameConstraints(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NameConstraints, a1, a2, a3, a4);
}

uint64_t length_NameConstraints(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NameConstraints, a1);
}

uint64_t free_NameConstraints()
{
  return _asn1_free_top();
}

uint64_t copy_NameConstraints()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ExtKeyUsage(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ExtKeyUsage()
{
  return _asn1_decode_top();
}

uint64_t encode_ExtKeyUsage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ExtKeyUsage, a1, a2, a3, a4);
}

uint64_t length_ExtKeyUsage(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ExtKeyUsage, a1);
}

uint64_t free_ExtKeyUsage()
{
  return _asn1_free_top();
}

uint64_t copy_ExtKeyUsage()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DistributionPointReasonFlags(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DistributionPointReasonFlags()
{
  return _asn1_decode_top();
}

uint64_t encode_DistributionPointReasonFlags(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DistributionPointReasonFlags, a1, a2, a3, a4);
}

uint64_t length_DistributionPointReasonFlags(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DistributionPointReasonFlags, a1);
}

uint64_t free_DistributionPointReasonFlags()
{
  return _asn1_free_top();
}

uint64_t copy_DistributionPointReasonFlags()
{
  return _asn1_copy_top();
}

uint64_t DistributionPointReasonFlags2int(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t int2DistributionPointReasonFlags(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t nsheim_decode_DistributionPointName(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DistributionPointName()
{
  return _asn1_decode_top();
}

uint64_t encode_DistributionPointName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DistributionPointName, a1, a2, a3, a4);
}

uint64_t length_DistributionPointName(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DistributionPointName, a1);
}

uint64_t free_DistributionPointName()
{
  return _asn1_free_top();
}

uint64_t copy_DistributionPointName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DistributionPoint(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DistributionPoint()
{
  return _asn1_decode_top();
}

uint64_t encode_DistributionPoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DistributionPoint, a1, a2, a3, a4);
}

uint64_t length_DistributionPoint(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DistributionPoint, a1);
}

uint64_t free_DistributionPoint()
{
  return _asn1_free_top();
}

uint64_t copy_DistributionPoint()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CRLDistributionPoints(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CRLDistributionPoints()
{
  return _asn1_decode_top();
}

uint64_t encode_CRLDistributionPoints(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CRLDistributionPoints, a1, a2, a3, a4);
}

uint64_t length_CRLDistributionPoints(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CRLDistributionPoints, a1);
}

uint64_t free_CRLDistributionPoints()
{
  return _asn1_free_top();
}

uint64_t copy_CRLDistributionPoints()
{
  return _asn1_copy_top();
}

uint64_t add_CRLDistributionPoints(unsigned int *a1)
{
  uint64_t v2 = malloc_type_realloc(*((void **)a1 + 1), 24 * *a1 + 24, 0x6273E012uLL);
  if (!v2) {
    return 12;
  }
  *((void *)a1 + 1) = v2;
  uint64_t result = _asn1_copy_top();
  if (!result) {
    ++*a1;
  }
  return result;
}

uint64_t remove_CRLDistributionPoints(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    return 1859794437;
  }
  _asn1_free_top();
  unsigned int v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove((void *)(*(void *)(a1 + 8) + 24 * a2), (const void *)(*(void *)(a1 + 8) + 24 * (a2 + 1)), 24 * (v4 - a2));
    unsigned int v4 = *(_DWORD *)a1;
  }
  SecCertificateRef v5 = malloc_type_realloc(*(void **)(a1 + 8), 24 * v4, 0xC1F12376uLL);
  if (!v5 && *(_DWORD *)a1) {
    return 0;
  }
  uint64_t result = 0;
  *(void *)(a1 + 8) = v5;
  return result;
}

uint64_t nsheim_decode_DSASigValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DSASigValue()
{
  return _asn1_decode_top();
}

uint64_t encode_DSASigValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DSASigValue, a1, a2, a3, a4);
}

uint64_t length_DSASigValue(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DSASigValue, a1);
}

uint64_t free_DSASigValue()
{
  return _asn1_free_top();
}

uint64_t copy_DSASigValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DSAPublicKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DSAPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_DSAPublicKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DSAPublicKey, a1, a2, a3, a4);
}

uint64_t length_DSAPublicKey(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DSAPublicKey, a1);
}

uint64_t free_DSAPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_DSAPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DSAParams(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DSAParams()
{
  return _asn1_decode_top();
}

uint64_t encode_DSAParams(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DSAParams, a1, a2, a3, a4);
}

uint64_t length_DSAParams(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DSAParams, a1);
}

uint64_t free_DSAParams()
{
  return _asn1_free_top();
}

uint64_t copy_DSAParams()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECPoint(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ECPoint()
{
  return _asn1_decode_top();
}

uint64_t encode_ECPoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ECPoint, a1, a2, a3, a4);
}

uint64_t length_ECPoint(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ECPoint, a1);
}

uint64_t free_ECPoint()
{
  return _asn1_free_top();
}

uint64_t copy_ECPoint()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECParameters(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ECParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_ECParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ECParameters, a1, a2, a3, a4);
}

uint64_t length_ECParameters(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ECParameters, a1);
}

uint64_t free_ECParameters()
{
  return _asn1_free_top();
}

uint64_t copy_ECParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECDSA_Sig_Value(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ECDSA_Sig_Value()
{
  return _asn1_decode_top();
}

uint64_t encode_ECDSA_Sig_Value(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ECDSA_Sig_Value, a1, a2, a3, a4);
}

uint64_t length_ECDSA_Sig_Value(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ECDSA_Sig_Value, a1);
}

uint64_t free_ECDSA_Sig_Value()
{
  return _asn1_free_top();
}

uint64_t copy_ECDSA_Sig_Value()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RSAPublicKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RSAPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_RSAPublicKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RSAPublicKey, a1, a2, a3, a4);
}

uint64_t length_RSAPublicKey(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RSAPublicKey, a1);
}

uint64_t free_RSAPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_RSAPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RSAPrivateKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_RSAPrivateKey()
{
  return _asn1_decode_top();
}

uint64_t encode_RSAPrivateKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_RSAPrivateKey, a1, a2, a3, a4);
}

uint64_t length_RSAPrivateKey(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_RSAPrivateKey, a1);
}

uint64_t free_RSAPrivateKey()
{
  return _asn1_free_top();
}

uint64_t copy_RSAPrivateKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DigestInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_DigestInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_DigestInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_DigestInfo, a1, a2, a3, a4);
}

uint64_t length_DigestInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_DigestInfo, a1);
}

uint64_t free_DigestInfo()
{
  return _asn1_free_top();
}

uint64_t copy_DigestInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TBSCRLCertList(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_TBSCRLCertList()
{
  return _asn1_decode_top();
}

uint64_t encode_TBSCRLCertList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_TBSCRLCertList, a1, a2, a3, a4);
}

uint64_t length_TBSCRLCertList(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_TBSCRLCertList, a1);
}

uint64_t free_TBSCRLCertList()
{
  return _asn1_free_top();
}

uint64_t copy_TBSCRLCertList()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CRLCertificateList(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CRLCertificateList()
{
  return _asn1_decode_top();
}

uint64_t encode_CRLCertificateList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CRLCertificateList, a1, a2, a3, a4);
}

uint64_t length_CRLCertificateList(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CRLCertificateList, a1);
}

uint64_t free_CRLCertificateList()
{
  return _asn1_free_top();
}

uint64_t copy_CRLCertificateList()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CRLReason(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_CRLReason()
{
  return _asn1_decode_top();
}

uint64_t encode_CRLReason(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_CRLReason, a1, a2, a3, a4);
}

uint64_t length_CRLReason(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_CRLReason, a1);
}

uint64_t free_CRLReason()
{
  return _asn1_free_top();
}

uint64_t copy_CRLReason()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIXXmppAddr(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_PKIXXmppAddr()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIXXmppAddr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_PKIXXmppAddr, a1, a2, a3, a4);
}

uint64_t length_PKIXXmppAddr(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_PKIXXmppAddr, a1);
}

uint64_t free_PKIXXmppAddr()
{
  return _asn1_free_top();
}

uint64_t copy_PKIXXmppAddr()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AccessDescription(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AccessDescription()
{
  return _asn1_decode_top();
}

uint64_t encode_AccessDescription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AccessDescription, a1, a2, a3, a4);
}

uint64_t length_AccessDescription(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AccessDescription, a1);
}

uint64_t free_AccessDescription()
{
  return _asn1_free_top();
}

uint64_t copy_AccessDescription()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AuthorityInfoAccessSyntax(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AuthorityInfoAccessSyntax()
{
  return _asn1_decode_top();
}

uint64_t encode_AuthorityInfoAccessSyntax(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AuthorityInfoAccessSyntax, a1, a2, a3, a4);
}

uint64_t length_AuthorityInfoAccessSyntax(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AuthorityInfoAccessSyntax, a1);
}

uint64_t free_AuthorityInfoAccessSyntax()
{
  return _asn1_free_top();
}

uint64_t copy_AuthorityInfoAccessSyntax()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ProxyPolicy(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ProxyPolicy()
{
  return _asn1_decode_top();
}

uint64_t encode_ProxyPolicy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ProxyPolicy, a1, a2, a3, a4);
}

uint64_t length_ProxyPolicy(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ProxyPolicy, a1);
}

uint64_t free_ProxyPolicy()
{
  return _asn1_free_top();
}

uint64_t copy_ProxyPolicy()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ProxyCertInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_ProxyCertInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_ProxyCertInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ProxyCertInfo, a1, a2, a3, a4);
}

uint64_t length_ProxyCertInfo(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ProxyCertInfo, a1);
}

uint64_t free_ProxyCertInfo()
{
  return _asn1_free_top();
}

uint64_t copy_ProxyCertInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AppleHashAgilityValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AppleHashAgilityValue()
{
  return _asn1_decode_top();
}

uint64_t encode_AppleHashAgilityValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AppleHashAgilityValue, a1, a2, a3, a4);
}

uint64_t length_AppleHashAgilityValue(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AppleHashAgilityValue, a1);
}

uint64_t free_AppleHashAgilityValue()
{
  return _asn1_free_top();
}

uint64_t copy_AppleHashAgilityValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AppleAgileHash(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!v2)
  {
    if ([v1 length]) {
      uint64_t v2 = 1859794442;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t decode_AppleAgileHash()
{
  return _asn1_decode_top();
}

uint64_t encode_AppleAgileHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_AppleAgileHash, a1, a2, a3, a4);
}

uint64_t length_AppleAgileHash(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_AppleAgileHash, a1);
}

uint64_t free_AppleAgileHash()
{
  return _asn1_free_top();
}

uint64_t copy_AppleAgileHash()
{
  return _asn1_copy_top();
}

uint64_t sub_20D8CD5D8()
{
  uint64_t v0 = sub_20D8DF178();
  __swift_allocate_value_buffer(v0, qword_26771A088);
  __swift_project_value_buffer(v0, (uint64_t)qword_26771A088);
  return sub_20D8DF168();
}

uint64_t sub_20D8CD65C(uint64_t a1)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = (void *)sub_20D8DF128();
  double v3 = (void *)sub_20D8DF128();
  unsigned int v4 = (void *)sub_20D8DF128();
  SecCertificateRef v5 = (void *)sub_20D8DF128();
  v13[0] = 0;
  id v6 = MSDecryptGCMOneShot(a1, v2, v3, v4, v5, v13);

  id v7 = v13[0];
  uint64_t v8 = sub_20D8DF148();
  unint64_t v10 = v9;

  if (v7)
  {
    id v11 = v7;
    swift_willThrow();
    sub_20D8CD7B8(v8, v10);
  }
  return v8;
}

uint64_t sub_20D8CD7B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_20D8CD810()
{
  return 0;
}

uint64_t MSCMSAuthEnvelopedData.dataContent.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  sub_20D8CD904(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_20D8CD904(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t MSCMSAuthEnvelopedData.dataContent.setter(uint64_t a1, uint64_t a2)
{
  SecCertificateRef v5 = (uint64_t *)(v2 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
  swift_beginAccess();
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  *SecCertificateRef v5 = a1;
  v5[1] = a2;
  return sub_20D8CD7B8(v6, v7);
}

uint64_t (*MSCMSAuthEnvelopedData.dataContent.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20D8CDAA0()
{
  return MEMORY[0x263F8EE78];
}

uint64_t MSCMSAuthEnvelopedData.recipients.getter()
{
  return sub_20D8CDF74();
}

uint64_t MSCMSAuthEnvelopedData.recipients.setter(uint64_t a1)
{
  return sub_20D8CE038(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_recipients);
}

uint64_t (*MSCMSAuthEnvelopedData.recipients.modify())()
{
  return j__swift_endAccess;
}

id MSCMSAuthEnvelopedData.encryptionAlgorithm.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void MSCMSAuthEnvelopedData.encryptionAlgorithm.setter(void *a1)
{
}

uint64_t (*MSCMSAuthEnvelopedData.encryptionAlgorithm.modify())()
{
  return j_j__swift_endAccess;
}

id sub_20D8CDC90(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  swift_beginAccess();
  sub_20D8D58FC(0, a4);
  swift_bridgeObjectRetain();
  SecCertificateRef v5 = (void *)sub_20D8DF1E8();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t MSCMSAuthEnvelopedData.protectedAttributes.getter()
{
  return sub_20D8CDF74();
}

uint64_t sub_20D8CDD50(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, void *a6)
{
  sub_20D8D58FC(0, a4);
  uint64_t v8 = sub_20D8DF1F8();
  unint64_t v9 = (uint64_t *)(a1 + *a6);
  swift_beginAccess();
  *unint64_t v9 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t MSCMSAuthEnvelopedData.protectedAttributes.setter(uint64_t a1)
{
  return sub_20D8CE038(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes);
}

uint64_t (*MSCMSAuthEnvelopedData.protectedAttributes.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MSCMSAuthEnvelopedData.unprotectedAttributes.getter()
{
  return sub_20D8CDF74();
}

uint64_t MSCMSAuthEnvelopedData.unprotectedAttributes.setter(uint64_t a1)
{
  return sub_20D8CE038(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes);
}

uint64_t (*MSCMSAuthEnvelopedData.unprotectedAttributes.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MSCMSAuthEnvelopedData.originatorCertificates.getter()
{
  return sub_20D8CDF74();
}

uint64_t sub_20D8CDF74()
{
  return swift_bridgeObjectRetain();
}

uint64_t MSCMSAuthEnvelopedData.originatorCertificates.setter(uint64_t a1)
{
  return sub_20D8CE038(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates);
}

uint64_t sub_20D8CE038(uint64_t a1, void *a2)
{
  unsigned int v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MSCMSAuthEnvelopedData.originatorCertificates.modify())()
{
  return j_j__swift_endAccess;
}

id MSCMSAuthEnvelopedData.contentType.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void MSCMSAuthEnvelopedData.contentType.setter(void *a1)
{
}

void sub_20D8CE1A0(void *a1, void *a2)
{
  unsigned int v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  SecCertificateRef v5 = *v4;
  void *v4 = a1;
}

uint64_t (*MSCMSAuthEnvelopedData.contentType.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20D8CE24C()
{
  return 0;
}

uint64_t MSCMSAuthEnvelopedData.embeddedContent.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t MSCMSAuthEnvelopedData.embeddedContent.setter(uint64_t a1)
{
  double v3 = (void *)(v1 + OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent);
  swift_beginAccess();
  *double v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MSCMSAuthEnvelopedData.embeddedContent.modify())()
{
  return j_j__swift_endAccess;
}

void *sub_20D8CE414()
{
  return &unk_20D8E2220;
}

uint64_t sub_20D8CE420()
{
  return 16;
}

id MSCMSAuthEnvelopedData.__allocating_init(encryptionAlgorithm:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_20D8D26B4(a1);

  return v4;
}

id MSCMSAuthEnvelopedData.init(encryptionAlgorithm:)(void *a1)
{
  id v2 = sub_20D8D26B4(a1);

  return v2;
}

id MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:)(uint64_t a1, unint64_t a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_20D8D2820(a1, a2, a3);

  sub_20D8CD7B8(a1, a2);
  return v8;
}

id MSCMSAuthEnvelopedData.init(dataContent:recipient:)(uint64_t a1, unint64_t a2, void *a3)
{
  id v6 = sub_20D8D2820(a1, a2, a3);

  sub_20D8CD7B8(a1, a2);
  return v6;
}

id MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:encryptionAlgorithm:)(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  id v10 = sub_20D8D2AE8(a1, a2, a3, a4);

  sub_20D8CD7B8(a1, a2);
  return v10;
}

id MSCMSAuthEnvelopedData.init(dataContent:recipient:encryptionAlgorithm:)(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  id v8 = sub_20D8D2AE8(a1, a2, a3, a4);

  sub_20D8CD7B8(a1, a2);
  return v8;
}

id MSCMSAuthEnvelopedData.__allocating_init(embeddedContent:recipient:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  sub_20D8DF198();
  sub_20D8DF188();
  swift_bridgeObjectRelease();
  sub_20D8DF1A8();
  id v6 = objc_allocWithZone((Class)MSOID);
  id v7 = sub_20D8D1F7C();
  id v8 = objc_msgSend(v5, sel_initWithEmbeddedContent_recipient_encryptionAlgorithm_, a1, a2, v7);

  swift_unknownObjectRelease();
  return v8;
}

id MSCMSAuthEnvelopedData.init(embeddedContent:recipient:)(uint64_t a1, void *a2)
{
  id v3 = v2;
  sub_20D8DF198();
  sub_20D8DF188();
  swift_bridgeObjectRelease();
  sub_20D8DF1A8();
  id v6 = objc_allocWithZone((Class)MSOID);
  id v7 = sub_20D8D1F7C();
  id v8 = objc_msgSend(v3, sel_initWithEmbeddedContent_recipient_encryptionAlgorithm_, a1, a2, v7);

  swift_unknownObjectRelease();
  return v8;
}

id MSCMSAuthEnvelopedData.__allocating_init(embeddedContent:recipient:encryptionAlgorithm:)(void *a1, void *a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_20D8D2D28(a1, a2, a3);
  swift_unknownObjectRelease();

  return v8;
}

id MSCMSAuthEnvelopedData.init(embeddedContent:recipient:encryptionAlgorithm:)(void *a1, void *a2, void *a3)
{
  id v5 = sub_20D8D2D28(a1, a2, a3);
  swift_unknownObjectRelease();

  return v5;
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.addRecipient(_:)(MSCMSRecipientInfo *a1)
{
}

Swift::OpaquePointer_optional __swiftcall MSCMSAuthEnvelopedData.getAttributes(OID:)(MSOID *OID)
{
  unint64_t v23 = MEMORY[0x263F8EE78];
  id v2 = (uint64_t *)(v1 + OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes);
  swift_beginAccess();
  uint64_t v3 = *v2;
  if ((unint64_t)*v2 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v4 = sub_20D8DF2D8();
    if (!v4) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v4) {
      goto LABEL_14;
    }
  }
  id v5 = (void *)sub_20D8D58FC(0, (unint64_t *)&unk_267719CE0);
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_29;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v8 = (id)MEMORY[0x21055F860](i, v3);
    }
    else {
      id v8 = *(id *)(v3 + 8 * i + 32);
    }
    id v9 = v8;
    id v10 = objc_msgSend(v8, sel_attributeType);
    char v11 = sub_20D8DF268();

    if (v11)
    {
      id v12 = v9;
      MEMORY[0x21055F780]();
      if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_20D8DF218();
      }
      sub_20D8DF238();
      sub_20D8DF208();
    }
  }
LABEL_14:
  swift_bridgeObjectRelease_n();
  id v13 = (uint64_t *)(v22 + OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes);
  swift_beginAccess();
  uint64_t v14 = *v13;
  if ((unint64_t)*v13 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_20D8DF2D8();
    if (v15)
    {
LABEL_16:
      id v5 = (void *)sub_20D8D58FC(0, (unint64_t *)&unk_267719CE0);
      if (v15 >= 1)
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if ((v14 & 0xC000000000000001) != 0) {
            id v17 = (id)MEMORY[0x21055F860](j, v14);
          }
          else {
            id v17 = *(id *)(v14 + 8 * j + 32);
          }
          uint64_t v18 = v17;
          id v19 = objc_msgSend(v17, sel_attributeType);
          char v20 = sub_20D8DF268();

          if (v20)
          {
            id v21 = v18;
            MEMORY[0x21055F780]();
            if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_20D8DF218();
            }
            sub_20D8DF238();
            sub_20D8DF208();
          }
        }
        goto LABEL_27;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v15) {
      goto LABEL_16;
    }
  }
LABEL_27:
  swift_bridgeObjectRelease_n();
  id v5 = (void *)v23;
LABEL_30:
  result.value._rawint Value = v5;
  result.is_nil = v6;
  return result;
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.addProtectedAttribute(_:)(MSCMSAttribute *a1)
{
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.addUnprotectedAttribute(_:)(MSCMSAttribute *a1)
{
}

uint64_t sub_20D8CEFC4(void *a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  id v5 = a1;
  MEMORY[0x21055F780]();
  if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_20D8DF218();
  }
  sub_20D8DF238();
  sub_20D8DF208();
  return swift_endAccess();
}

void sub_20D8CF06C(char *a1, uint64_t a2, void *a3, void *a4)
{
  Swift::Bool v6 = &a1[*a4];
  swift_beginAccess();
  id v7 = a3;
  id v8 = a1;
  MEMORY[0x21055F780]();
  if (*(void *)((*(void *)v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v6 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_20D8DF218();
  sub_20D8DF238();
  sub_20D8DF208();
  swift_endAccess();
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.setContentType(type:)(MSOID *type)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = type;
  id v5 = type;
}

void sub_20D8CF18C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  Swift::Bool v6 = *v5;
  *id v5 = a3;
  id v7 = a3;
}

unint64_t MSCMSAuthEnvelopedData.encodeMessageSecurityObject()()
{
  uint64_t v2 = v1;
  uint64_t v162 = *MEMORY[0x263EF8340];
  int v155 = 0;
  uint64_t v156 = 0;
  int v157 = 0;
  memset(v158, 0, sizeof(v158));
  long long v159 = 0u;
  long long v160 = 0u;
  v161 = 0;
  unint64_t v3 = 0x26411C000uLL;
  id v139 = objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_init);
  int v154 = 0;
  memset(v153, 0, sizeof(v153));
  v152[0] = 0;
  v152[1] = 0;
  uint64_t v4 = (unint64_t *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_recipients);
  swift_beginAccess();
  if (!(*v4 >> 62))
  {
    if (*(uint64_t *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1) {
      goto LABEL_3;
    }
LABEL_120:
    if (qword_26771A080 != -1) {
      swift_once();
    }
    uint64_t v102 = sub_20D8DF178();
    __swift_project_value_buffer(v102, (uint64_t)qword_26771A088);
    unint64_t v0 = sub_20D8DF158();
    os_log_type_t v103 = sub_20D8DF248();
    if (os_log_type_enabled((os_log_t)v0, v103))
    {
      v104 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v104 = 0;
      _os_log_impl(&dword_20D8A1000, (os_log_t)v0, v103, "No recipient found", v104, 2u);
      MEMORY[0x210560550](v104, -1, -1);
    }

    sub_20D8D2F08();
    swift_allocError();
    *(_OWORD *)uint64_t v105 = xmmword_20D8E2190;
    *(unsigned char *)(v105 + 16) = 48;
    swift_willThrow();
    goto LABEL_176;
  }
  while (2)
  {
    swift_bridgeObjectRetain();
    uint64_t v101 = sub_20D8DF2D8();
    swift_bridgeObjectRelease();
    if (v101 < 1) {
      goto LABEL_120;
    }
LABEL_3:
    v131 = v4;
    v151[0] = 0;
    long long v148 = 0uLL;
    uint64_t v149 = 0;
    id v5 = (id *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
    swift_beginAccess();
    v132 = v5;
    *(void *)&long long v147 = objc_msgSend(*v5, sel_Asn1OID);
    *((void *)&v147 + 1) = v6;
    uint64_t v150 = swift_slowAlloc();
    id v7 = (void *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
    swift_beginAccess();
    id v8 = objc_msgSend(objc_allocWithZone(*(Class *)(v3 + 976)), sel_initWithOID_, *v7);
    unint64_t v9 = v3;
    id v10 = objc_msgSend(v8, sel_keySize_, 0);

    *(void *)&long long v145 = sub_20D8D2F5C((uint64_t)v10);
    *((void *)&v145 + 1) = v11;
    sub_20D8D2048(&v145, 0);
    uint64_t v12 = v2;
    long long v146 = v145;
    id v13 = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 976)), sel_initWithOID_, *v7);
    unint64_t v3 = (unint64_t)objc_msgSend(v13, sel_blockSize_, 0);

    uint64_t v14 = (void *)swift_slowAlloc();
    v153[0] = v3;
    v153[1] = v14;
    uint64_t v15 = swift_allocObject();
    int v16 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], v3, v14);
    *(_DWORD *)(v15 + 16) = v16;
    id v17 = (_DWORD *)(v15 + 16);
    if (v16)
    {
      if (qword_26771A080 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_20D8DF178();
      __swift_project_value_buffer(v18, (uint64_t)qword_26771A088);
      id v19 = sub_20D8DF158();
      os_log_type_t v20 = sub_20D8DF248();
      if (os_log_type_enabled(v19, v20))
      {
        id v21 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)id v21 = 67109120;
        unint64_t v3 = (unint64_t)(v21 + 8);
        swift_beginAccess();
        LODWORD(v145) = *v17;
        sub_20D8DF288();
        _os_log_impl(&dword_20D8A1000, v19, v20, "Unable to generate nonce underlying crypto error %d", v21, 8u);
        MEMORY[0x210560550](v21, -1, -1);
      }

      swift_beginAccess();
      unint64_t v0 = *(unsigned int *)(v15 + 16);
      sub_20D8D2F08();
      uint64_t v12 = swift_allocError();
      *(void *)uint64_t v22 = v0;
      *(void *)(v22 + 8) = 0;
      *(unsigned char *)(v22 + 16) = 0;
      swift_willThrow();
      swift_release();
      if (!v153[1])
      {
        __break(1u);
        goto LABEL_194;
      }
      MEMORY[0x210560550](v153[1], -1, -1);
      sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
      if (v150) {
        goto LABEL_175;
      }
      __break(1u);
    }
    uint64_t v23 = length_GCMParameters((uint64_t)v153);
    id v24 = (unint64_t *)swift_slowAlloc();
    uint64_t v138 = 0;
    int v25 = encode_GCMParameters((uint64_t)v24 + v23 - 1, v23, (uint64_t)v153, (uint64_t)&v138);
    _DWORD *v17 = v25;
    if (v25)
    {
      if (qword_26771A080 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_20D8DF178();
      __swift_project_value_buffer(v26, (uint64_t)qword_26771A088);
      unint64_t v0 = sub_20D8DF158();
      os_log_type_t v27 = sub_20D8DF248();
      if (os_log_type_enabled((os_log_t)v0, v27))
      {
        id v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v28 = 0;
        _os_log_impl(&dword_20D8A1000, (os_log_t)v0, v27, "Invalid data - Error encoding GCM parameters", v28, 2u);
        MEMORY[0x210560550](v28, -1, -1);
      }

      sub_20D8D2F08();
      uint64_t v12 = swift_allocError();
      *(_OWORD *)uint64_t v29 = xmmword_20D8E21A0;
      *(unsigned char *)(v29 + 16) = 48;
      swift_willThrow();
      MEMORY[0x210560550](v24, -1, -1);
      swift_release();
      if (v153[1])
      {
        MEMORY[0x210560550](v153[1], -1, -1);
        sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
        if (v150) {
          goto LABEL_175;
        }
        __break(1u);
        goto LABEL_19;
      }
LABEL_194:
      __break(1u);
LABEL_195:
      __break(1u);
LABEL_196:
      __break(1u);
LABEL_197:
      __break(1u);
      goto LABEL_198;
    }
LABEL_19:
    v128 = v24;
    uint64_t v30 = sub_20D8D30D0(v24, v138);
    unint64_t v129 = v31;
    uint64_t v130 = v30;
    long long v143 = xmmword_20D8E21B0;
    long long v32 = *v132;
    sub_20D8DF198();
    unint64_t v33 = v32;
    long long v34 = (void *)sub_20D8DF188();
    swift_bridgeObjectRelease();
    uint64_t v4 = (unint64_t *)objc_msgSend((id)v33, sel_isEqualToString_, v34);

    if (v4)
    {
      uint64_t v35 = (void *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
      swift_beginAccess();
      unint64_t v33 = v35[1];
      *(void *)&long long v143 = *v35;
      v36 = (unint64_t *)v143;
      *((void *)&v143 + 1) = v33;
      sub_20D8CD904(v143, v33);
LABEL_24:
      uint64_t v4 = 0;
      switch(v33 >> 62)
      {
        case 1uLL:
          goto LABEL_31;
        case 2uLL:
          unint64_t v47 = v36[2];
          unint64_t v46 = v36[3];
          uint64_t v4 = (unint64_t *)(v46 - v47);
          if (!__OFSUB__(v46, v47)) {
            goto LABEL_34;
          }
          goto LABEL_130;
        default:
          goto LABEL_34;
      }
    }
    uint64_t v37 = (void **)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent);
    swift_beginAccess();
    id v38 = *v37;
    if (*v37)
    {
      v144[0] = 0;
      id v39 = objc_msgSend(v38, sel_encodeMessageSecurityObject_, v144);
      uint64_t v40 = (unint64_t *)v144[0];
      if (v39)
      {
        v36 = (unint64_t *)sub_20D8DF148();
        unint64_t v33 = v41;

        *(void *)&long long v143 = v36;
        *((void *)&v143 + 1) = v33;
        goto LABEL_24;
      }
      uint64_t v4 = v40;
      uint64_t v12 = sub_20D8DF0D8();

      swift_willThrow();
      sub_20D8CD7B8(v130, v129);
      MEMORY[0x210560550](v128, -1, -1);
      swift_release();
      if (v153[1])
      {
        MEMORY[0x210560550](v153[1], -1, -1);
        sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
        id v55 = (id)v150;
        if (v150) {
          goto LABEL_175;
        }
        __break(1u);
        goto LABEL_52;
      }
      goto LABEL_197;
    }
    v36 = v128;
    if (qword_26771A080 != -1) {
      goto LABEL_128;
    }
    while (1)
    {
      uint64_t v42 = sub_20D8DF178();
      __swift_project_value_buffer(v42, (uint64_t)qword_26771A088);
      unint64_t v0 = sub_20D8DF158();
      os_log_type_t v43 = sub_20D8DF248();
      if (os_log_type_enabled((os_log_t)v0, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl(&dword_20D8A1000, (os_log_t)v0, v43, "Invalid input data/embedded data", v44, 2u);
        MEMORY[0x210560550](v44, -1, -1);
      }

      sub_20D8D2F08();
      uint64_t v12 = swift_allocError();
      *(void *)uint64_t v45 = 0;
      *(void *)(v45 + 8) = 0;
      *(unsigned char *)(v45 + 16) = 48;
      swift_willThrow();
      sub_20D8CD7B8(v130, v129);
      sub_20D8D3184(v143, *((unint64_t *)&v143 + 1));
      MEMORY[0x210560550](v36, -1, -1);
      swift_release();
      if (!v153[1]) {
        goto LABEL_196;
      }
      MEMORY[0x210560550](v153[1], -1, -1);
      sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
      if (v150) {
        goto LABEL_175;
      }
      __break(1u);
LABEL_31:
      if (__OFSUB__(HIDWORD(v36), v36))
      {
        __break(1u);
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
        goto LABEL_133;
      }
LABEL_34:
      *(void *)&long long v125 = v33;
      *((void *)&v125 + 1) = v36;
      uint64_t v133 = swift_slowAlloc();
      uint64_t v137 = v133;
      *(void *)&long long v160 = 16;
      uint64_t v48 = swift_slowAlloc();
      *((void *)&v160 + 1) = v48;
      uint64_t v49 = (char *)(id)v0;
      unint64_t v0 = v129;
      sub_20D8CD904(v130, v129);
      sub_20D8D3350((uint64_t *)&v146, (uint64_t *)&v143, &v139, v49, v130, v129, (uint64_t)v151, (uint64_t)&v147, v15, (uint64_t)v153, v3, (uint64_t)&v137, (uint64_t)&v155);
      if (v12)
      {
        sub_20D8CD7B8(v130, v129);

        MEMORY[0x210560550](v48, -1, -1);
        MEMORY[0x210560550](v133, -1, -1);
        sub_20D8CD7B8(v130, v129);
        sub_20D8D3184(*((uint64_t *)&v125 + 1), v125);
        MEMORY[0x210560550](v128, -1, -1);
        swift_release();
        if (!v153[1]) {
          goto LABEL_195;
        }
        MEMORY[0x210560550](v153[1], -1, -1);
        sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
        if (v150) {
          goto LABEL_175;
        }
        __break(1u);
      }
      unint64_t v123 = v48;
      uint64_t v4 = (unint64_t *)v133;
      sub_20D8CD7B8(v130, v129);
      v120 = v49;

      int v155 = 0;
      unint64_t v33 = v150;
      *(_OWORD *)&v158[1] = v147;
      *(_OWORD *)&v158[3] = v148;
      v158[5] = v149;
      *(void *)&long long v159 = v150;
      uint64_t v156 = 0;
      long long v142 = xmmword_20D8E21C0;
      v36 = v131;
      swift_beginAccess();
      unint64_t v50 = *v131;
      if ((*v131 & 0xC000000000000001) != 0) {
        goto LABEL_126;
      }
      if (*(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_128:
      swift_once();
    }
    for (id i = *(id *)(v50 + 32); ; id i = (id)MEMORY[0x21055F860](0))
    {
      uint64_t v52 = i;
      swift_endAccess();
      unint64_t v0 = (unint64_t)objc_msgSend(v52, sel_originatorIdentity);

      if (v0)
      {
        swift_beginAccess();
        unint64_t v53 = *v36;
        if ((*v36 & 0xC000000000000001) != 0)
        {
LABEL_133:
          id v54 = (id)MEMORY[0x21055F860](0);
        }
        else
        {
          if (!*(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_135:
            id v57 = (id)MEMORY[0x21055F860](0);
            goto LABEL_56;
          }
          id v54 = *(id *)(v53 + 32);
        }
        id v39 = v54;
        swift_endAccess();
        id v55 = sub_20D8D7544(v0);
        if (v12)
        {

          MEMORY[0x210560550](v123, -1, -1);
          MEMORY[0x210560550](v4, -1, -1);
          sub_20D8CD7B8(v130, v129);
          sub_20D8D3184(*((uint64_t *)&v125 + 1), v125);
          MEMORY[0x210560550](v128, -1, -1);
          swift_release();
          if (v153[1])
          {
            MEMORY[0x210560550](v153[1], -1, -1);
            sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
            if (v33) {
              goto LABEL_175;
            }
LABEL_199:
            __break(1u);
LABEL_200:
            __break(1u);
LABEL_201:
            __break(1u);
LABEL_202:
            __break(1u);
            goto LABEL_203;
          }
LABEL_198:
          __break(1u);
          goto LABEL_199;
        }
LABEL_52:
        unint64_t v3 = (unint64_t)v55;
        objc_msgSend(v39, sel_setOriginator_, v55);

        v36 = v131;
      }
      swift_beginAccess();
      unint64_t v56 = *v36;
      unint64_t v119 = v33;
      if ((*v36 & 0xC000000000000001) != 0) {
        goto LABEL_135;
      }
      if (!*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_137;
      }
      id v57 = *(id *)(v56 + 32);
LABEL_56:
      uint64_t v58 = v57;
      swift_endAccess();
      unint64_t v3 = (unint64_t)&selRef_digestAlgorithmWithSignatureAlgorithm_error_;
      id v59 = objc_msgSend(v58, sel_originator);

      if (!v59) {
        goto LABEL_75;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_267719CF0);
      unint64_t v0 = swift_allocObject();
      *(_OWORD *)(v0 + 16) = xmmword_20D8E21D0;
      swift_beginAccess();
      unint64_t v60 = *v36;
      if ((*v36 & 0xC000000000000001) == 0)
      {
        if (!*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_139;
        }
        id v61 = *(id *)(v60 + 32);
        goto LABEL_60;
      }
LABEL_137:
      id v61 = (id)MEMORY[0x21055F860](0);
LABEL_60:
      v62 = v61;
      swift_endAccess();
      id v63 = [v62 *(SEL *)(v3 + 2688)];

      if (!v63) {
        goto LABEL_200;
      }
      id v64 = self;
      type metadata accessor for SecCertificate();
      *(void *)(v0 + 56) = v65;
      *(void *)(v0 + 32) = v63;
      unint64_t v3 = sub_20D8DF1E8();
      swift_bridgeObjectRelease();
      v144[0] = 0;
      id v66 = objc_msgSend(v64, sel_encodeOriginatorInfoCertificates_error_, v3, v144);

      id v67 = v144[0];
      if (v66)
      {
        unint64_t v0 = sub_20D8DF148();
        unint64_t v3 = v68;

        *(void *)&long long v142 = v0;
        *((void *)&v142 + 1) = v3;
        uint64_t v69 = 0;
        id v66 = (id)v130;
        switch(v3 >> 62)
        {
          case 1uLL:
            goto LABEL_67;
          case 2uLL:
            uint64_t v71 = *(void *)(v0 + 16);
            uint64_t v70 = *(void *)(v0 + 24);
            uint64_t v69 = v70 - v71;
            if (!__OFSUB__(v70, v71)) {
              goto LABEL_70;
            }
            goto LABEL_191;
          case 3uLL:
            goto LABEL_70;
          default:
            uint64_t v69 = BYTE6(v3);
            goto LABEL_70;
        }
      }
      unint64_t v0 = (unint64_t)v67;
      uint64_t v12 = sub_20D8DF0D8();

      swift_willThrow();
      MEMORY[0x210560550](v123, -1, -1);
      MEMORY[0x210560550](v4, -1, -1);
      sub_20D8CD7B8(v130, v129);
      sub_20D8D3184(*((uint64_t *)&v125 + 1), v125);
      MEMORY[0x210560550](v128, -1, -1);
      swift_release();
      if (!v153[1]) {
        goto LABEL_202;
      }
      MEMORY[0x210560550](v153[1], -1, -1);
      sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
      if (v119) {
        goto LABEL_175;
      }
      __break(1u);
LABEL_67:
      if (__OFSUB__(HIDWORD(v0), v0))
      {
        __break(1u);
LABEL_191:
        __break(1u);
        goto LABEL_192;
      }
      uint64_t v69 = HIDWORD(v0) - (int)v0;
LABEL_70:
      sub_20D8D223C((uint64_t *)&v142, v152, v69, (uint64_t)&v155);
      if (v12)
      {
        sub_20D8CD7B8(v142, *((unint64_t *)&v142 + 1));
        MEMORY[0x210560550](v123, -1, -1);
        MEMORY[0x210560550](v4, -1, -1);
        sub_20D8CD7B8((uint64_t)v66, v129);
        sub_20D8D3184(*((uint64_t *)&v125 + 1), v125);
        MEMORY[0x210560550](v128, -1, -1);
        swift_release();
        if (!v153[1]) {
          goto LABEL_201;
        }
        MEMORY[0x210560550](v153[1], -1, -1);
        sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
        if (v119) {
          goto LABEL_175;
        }
        __break(1u);
      }
      v36 = v131;
LABEL_75:
      unint64_t v0 = *v36;
      if (!(*v36 >> 62))
      {
        uint64_t v72 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_77;
      }
LABEL_139:
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_20D8DF2D8();
      swift_bridgeObjectRelease();
LABEL_77:
      if ((unsigned __int128)(v72 * (__int128)112) >> 64 == (112 * v72) >> 63)
      {
        unint64_t v0 = swift_slowAlloc();
        unint64_t v33 = *v36;
        if (!(*v36 >> 62))
        {
          uint64_t v73 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          unint64_t v117 = v15;
          unint64_t v118 = v0;
          if (!v73) {
            goto LABEL_93;
          }
          goto LABEL_80;
        }
      }
      else
      {
        __break(1u);
      }
      swift_bridgeObjectRetain();
      uint64_t v73 = sub_20D8DF2D8();
      unint64_t v117 = v15;
      unint64_t v118 = v0;
      if (!v73)
      {
LABEL_93:
        swift_bridgeObjectRelease();
        if (*v36 >> 62)
        {
          swift_bridgeObjectRetain();
          unint64_t v87 = sub_20D8DF2D8();
          swift_bridgeObjectRelease();
          if ((v87 & 0x8000000000000000) != 0) {
            goto LABEL_213;
          }
        }
        else
        {
          unint64_t v87 = *(void *)((*v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (!HIDWORD(v87))
        {
          int v157 = v87;
          v158[0] = v118;
          v88 = (_DWORD *)swift_slowAlloc();
          v89 = &v120[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes];
          swift_beginAccess();
          if (*(void *)v89 >> 62)
          {
            swift_bridgeObjectRetain();
            unint64_t v90 = sub_20D8DF2D8();
            swift_bridgeObjectRelease();
            if ((v90 & 0x8000000000000000) != 0) {
              goto LABEL_213;
            }
          }
          else
          {
            unint64_t v90 = *(void *)((*(void *)v89 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          if (!HIDWORD(v90))
          {
            _DWORD *v88 = v90;
            v126 = v89;
            v127 = v88;
            if (!v90) {
              goto LABEL_149;
            }
            unint64_t v0 = swift_slowAlloc();
            uint64_t v91 = *(void *)v89;
            if (*(void *)v89 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v92 = sub_20D8DF2D8();
              unint64_t v135 = v0;
              if (!v92) {
                goto LABEL_148;
              }
LABEL_102:
              if (v92 >= 1)
              {
                uint64_t v93 = 0;
                unint64_t v94 = v91 & 0xC000000000000001;
                unint64_t v95 = v0;
                uint64_t v96 = v91;
                do
                {
                  if (v94) {
                    id v97 = (id)MEMORY[0x21055F860](v93, v91);
                  }
                  else {
                    id v97 = *(id *)(v91 + 8 * v93 + 32);
                  }
                  v98 = v97;
                  ++v93;
                  objc_msgSend(v97, sel_generateAttributeStruct);
                  copy_Attribute();
                  free_Attribute();

                  v95 += 32;
                  uint64_t v91 = v96;
                }
                while (v92 != v93);
                goto LABEL_148;
              }
              __break(1u);
              goto LABEL_188;
            }
            uint64_t v92 = *(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            unint64_t v135 = v0;
            if (v92) {
              goto LABEL_102;
            }
LABEL_148:
            swift_bridgeObjectRelease();
            v89 = v126;
            v88 = v127;
            v36 = v131;
            *((void *)v127 + 1) = v135;
LABEL_149:
            v161 = v88;
            v106 = (_DWORD *)swift_slowAlloc();
            v107 = (uint64_t *)&v120[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes];
            swift_beginAccess();
            v136 = v107;
            if ((unint64_t)*v107 >> 62)
            {
              swift_bridgeObjectRetain();
              unint64_t v0 = sub_20D8DF2D8();
              swift_bridgeObjectRelease();
              if ((v0 & 0x8000000000000000) != 0) {
                goto LABEL_213;
              }
            }
            else
            {
              unint64_t v0 = *(void *)((*v107 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            if (!HIDWORD(v0))
            {
              _DWORD *v106 = v0;
              if (!v0) {
                goto LABEL_165;
              }
              v89 = (char *)swift_slowAlloc();
              uint64_t v92 = *v136;
              v124 = v106;
              if (!((unint64_t)*v136 >> 62))
              {
                uint64_t v108 = *(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                v122 = v89;
                if (v108) {
                  goto LABEL_155;
                }
LABEL_164:
                swift_bridgeObjectRelease();
                v106 = v124;
                *((void *)v124 + 1) = v122;
                v36 = v131;
                v89 = v126;
                v88 = v127;
LABEL_165:
                uint64_t v92 = (uint64_t)v106;
                *((void *)&v159 + 1) = v106;
                uint64_t v114 = length_AuthEnvelopedData((uint64_t)&v155);
                uint64_t v140 = sub_20D8D2F5C(v114);
                unint64_t v141 = v115;
                MEMORY[0x270FA5388](v140, v115);
                sub_20D8DF138();
                if (v12)
                {
                  sub_20D8CD7B8(v140, v141);
                  if ((unint64_t)*v136 >> 62)
                  {
                    swift_bridgeObjectRetain();
                    sub_20D8DF2D8();
                    swift_bridgeObjectRelease();
                  }
                  MEMORY[0x210560550](v106, -1, -1);
                  if (*(void *)v89 >> 62)
                  {
                    swift_bridgeObjectRetain();
                    sub_20D8DF2D8();
                    swift_bridgeObjectRelease();
                  }
                  MEMORY[0x210560550](v88, -1, -1);
                  unint64_t v0 = *v36;
                  if (*v36 >> 62)
                  {
                    swift_bridgeObjectRetain();
                    sub_20D8DF2D8();
                    swift_bridgeObjectRelease();
                  }
                  MEMORY[0x210560550](v118, -1, -1);
                  sub_20D8CD7B8(v142, *((unint64_t *)&v142 + 1));
                  if (*((void *)&v160 + 1))
                  {
                    MEMORY[0x210560550](*((void *)&v160 + 1), -1, -1);
                    MEMORY[0x210560550](v137, -1, -1);
                    sub_20D8CD7B8(v130, v129);
                    sub_20D8D3184(v143, *((unint64_t *)&v143 + 1));
                    MEMORY[0x210560550](v128, -1, -1);
                    swift_release();
                    if (v153[1])
                    {
                      MEMORY[0x210560550](v153[1], -1, -1);
                      sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
                      if (v119) {
                        goto LABEL_175;
                      }
                      goto LABEL_205;
                    }
LABEL_204:
                    __break(1u);
LABEL_205:
                    __break(1u);
LABEL_206:
                    __break(1u);
                    goto LABEL_207;
                  }
LABEL_203:
                  __break(1u);
                  goto LABEL_204;
                }
                unint64_t v0 = v140;
                if (!((unint64_t)*v136 >> 62))
                {
LABEL_179:
                  MEMORY[0x210560550](v92, -1, -1);
                  if (*(void *)v89 >> 62)
                  {
                    swift_bridgeObjectRetain();
                    sub_20D8DF2D8();
                    swift_bridgeObjectRelease();
                  }
                  MEMORY[0x210560550](v88, -1, -1);
                  if (*v131 >> 62)
                  {
                    swift_bridgeObjectRetain();
                    sub_20D8DF2D8();
                    swift_bridgeObjectRelease();
                  }
                  MEMORY[0x210560550](v118, -1, -1);
                  sub_20D8CD7B8(v142, *((unint64_t *)&v142 + 1));
                  if (*((void *)&v160 + 1))
                  {
                    MEMORY[0x210560550](*((void *)&v160 + 1), -1, -1);
                    MEMORY[0x210560550](v137, -1, -1);
                    sub_20D8CD7B8(v130, v129);
                    sub_20D8D3184(v143, *((unint64_t *)&v143 + 1));
                    MEMORY[0x210560550](v128, -1, -1);
                    swift_release();
                    if (v153[1])
                    {
                      MEMORY[0x210560550](v153[1], -1, -1);
                      sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
                      if (v119)
                      {
                        MEMORY[0x210560550](v119, -1, -1);

                        return v0;
                      }
                      goto LABEL_210;
                    }
LABEL_209:
                    __break(1u);
LABEL_210:
                    __break(1u);
LABEL_211:
                    __break(1u);
                    goto LABEL_212;
                  }
LABEL_208:
                  __break(1u);
                  goto LABEL_209;
                }
LABEL_189:
                swift_bridgeObjectRetain();
                sub_20D8DF2D8();
                swift_bridgeObjectRelease();
                goto LABEL_179;
              }
              swift_bridgeObjectRetain();
              uint64_t v108 = sub_20D8DF2D8();
              v122 = v89;
              if (!v108) {
                goto LABEL_164;
              }
LABEL_155:
              if (v108 >= 1)
              {
                uint64_t v109 = 0;
                unint64_t v110 = v92 & 0xC000000000000001;
                uint64_t v111 = v92;
                do
                {
                  if (v110) {
                    id v112 = (id)MEMORY[0x21055F860](v109, v92);
                  }
                  else {
                    id v112 = *(id *)(v92 + 8 * v109 + 32);
                  }
                  v113 = v112;
                  ++v109;
                  objc_msgSend(v112, sel_generateAttributeStruct);
                  copy_Attribute();
                  free_Attribute();

                  v89 += 32;
                  uint64_t v92 = v111;
                }
                while (v108 != v109);
                goto LABEL_164;
              }
LABEL_188:
              __break(1u);
              goto LABEL_189;
            }
          }
        }
LABEL_213:
        sub_20D8DF2C8();
        __break(1u);
        JUMPOUT(0x20D8D0DD0);
      }
LABEL_80:
      unint64_t v123 = v33 & 0xC000000000000001;
      long long v125 = v146;
      uint64_t v74 = 4;
      uint64_t v15 = v0;
      unint64_t v121 = v33;
LABEL_81:
      uint64_t v75 = v74 - 4;
      uint64_t v134 = v74;
      v76 = v123
          ? (unint64_t *)MEMORY[0x21055F860](v74 - 4, v33)
          : (unint64_t *)*(id *)(v33 + 8 * v74);
      v36 = v76;
      uint64_t v77 = v75 + 1;
      if (!__OFADD__(v75, 1)) {
        break;
      }
      __break(1u);
LABEL_126:
      ;
    }
    sub_20D8CD904(v125, *((unint64_t *)&v125 + 1));
    v78 = (void *)sub_20D8DF128();
    sub_20D8CD7B8(v125, *((unint64_t *)&v125 + 1));
    uint64_t v4 = (unint64_t *)objc_msgSend(v36, sel_encryptBulkKey_, v78);

    unint64_t v3 = sub_20D8DF148();
    unint64_t v0 = v79;

    switch(v0 >> 62)
    {
      case 1uLL:
        LODWORD(v80) = HIDWORD(v3) - v3;
        if (__OFSUB__(HIDWORD(v3), v3)) {
          goto LABEL_132;
        }
        uint64_t v80 = (int)v80;
LABEL_90:
        if (v80 >= 1)
        {
          v84 = (void *)sub_20D8DF128();
          v144[0] = 0;
          unsigned int v85 = objc_msgSend(v36, sel_encodeRecipientInfo_recipientInfo_error_, v84, v15, v144);

          uint64_t v4 = (unint64_t *)v144[0];
          if (!v85) {
            goto LABEL_114;
          }
          id v86 = v144[0];
          sub_20D8CD7B8(v3, v0);

          v36 = v131;
          uint64_t v74 = v134 + 1;
          v15 += 112;
          unint64_t v33 = v121;
          if (v77 == v73) {
            goto LABEL_93;
          }
          goto LABEL_81;
        }
LABEL_108:
        swift_bridgeObjectRelease();
        sub_20D8D2F08();
        swift_allocError();
        *(_OWORD *)uint64_t v99 = xmmword_20D8E21E0;
        *(unsigned char *)(v99 + 16) = 48;
        swift_willThrow();
        sub_20D8CD7B8(v3, v0);

        if (*v131 >> 62)
        {
          swift_bridgeObjectRetain();
          sub_20D8DF2D8();
          swift_bridgeObjectRelease();
        }
        MEMORY[0x210560550](v118, -1, -1);
        sub_20D8CD7B8(v142, *((unint64_t *)&v142 + 1));
        unint64_t v0 = v117;
        v36 = v128;
        if (!*((void *)&v160 + 1)) {
          goto LABEL_206;
        }
        MEMORY[0x210560550](*((void *)&v160 + 1), -1, -1);
        MEMORY[0x210560550](v137, -1, -1);
        sub_20D8CD7B8(v130, v129);
        sub_20D8D3184(v143, *((unint64_t *)&v143 + 1));
        MEMORY[0x210560550](v128, -1, -1);
        swift_release();
        if (!v153[1])
        {
LABEL_207:
          __break(1u);
          goto LABEL_208;
        }
        MEMORY[0x210560550](v153[1], -1, -1);
        sub_20D8CD7B8(v146, *((unint64_t *)&v146 + 1));
        if (v150) {
          goto LABEL_175;
        }
        __break(1u);
LABEL_114:
        v100 = v4;
        swift_bridgeObjectRelease();
        sub_20D8DF0D8();

        swift_willThrow();
        sub_20D8CD7B8(v3, v0);

        if (*v131 >> 62)
        {
LABEL_192:
          swift_bridgeObjectRetain();
          sub_20D8DF2D8();
          swift_bridgeObjectRelease();
        }
        MEMORY[0x210560550](v118, -1, -1);
        sub_20D8CD7B8(v142, *((unint64_t *)&v142 + 1));
        unint64_t v0 = v117;
        uint64_t v2 = (uint64_t)v128;
        if (!*((void *)&v160 + 1)) {
          goto LABEL_211;
        }
        MEMORY[0x210560550](*((void *)&v160 + 1), -1, -1);
        MEMORY[0x210560550](v137, -1, -1);
        sub_20D8CD7B8(v130, v129);
        sub_20D8D3184(v143, *((unint64_t *)&v143 + 1));
        MEMORY[0x210560550](v128, -1, -1);
        swift_release();
        if (!v153[1])
        {
LABEL_212:
          __break(1u);
          goto LABEL_213;
        }
        MEMORY[0x210560550](v153[1], -1, -1);
        sub_20D8CD7B8(v125, *((unint64_t *)&v125 + 1));
        if (!v119)
        {
          __break(1u);
          continue;
        }
LABEL_175:
        MEMORY[0x210560550]();

LABEL_176:
        return v0;
      case 2uLL:
        uint64_t v82 = *(void *)(v3 + 16);
        uint64_t v81 = *(void *)(v3 + 24);
        BOOL v83 = __OFSUB__(v81, v82);
        uint64_t v80 = v81 - v82;
        if (!v83) {
          goto LABEL_90;
        }
        goto LABEL_131;
      case 3uLL:
        goto LABEL_108;
      default:
        uint64_t v80 = BYTE6(v0);
        goto LABEL_90;
    }
  }
}

uint64_t sub_20D8D0E00@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, id *a4@<X3>, uint64_t a5@<X5>, unint64_t a6@<X6>, unsigned char *a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  v65[2] = *MEMORY[0x263EF8340];
  unint64_t v14 = a3[1];
  if (v14 >> 60 == 15)
  {
    *a7 = 1;
  }
  else
  {
    id v19 = (void *)result;
    uint64_t v20 = *a3;
    uint64_t v21 = MEMORY[0x270FA5388](a12, a13);
    uint64_t v64 = v28;
    v62 = v29;
    id v63 = v24;
    switch(v14 >> 62)
    {
      case 1uLL:
        if (v20 >> 32 < (int)v20) {
          __break(1u);
        }
        id v34 = v24;
        sub_20D8CD904(a5, a6);
        swift_retain();
        id v35 = v34;
        sub_20D8CD904(a5, a6);
        swift_retain();
        sub_20D8D5990(v20, v14);
        char v36 = sub_20D8D3198((int)v20, v20 >> 32, v14 & 0x3FFFFFFFFFFFFFFFLL, (void (*)(uint64_t, uint64_t))sub_20D8D594C);
        if (v13) {
          goto LABEL_9;
        }
        char v37 = v36;
        goto LABEL_13;
      case 2uLL:
        uint64_t v38 = *(void *)(v20 + 24);
        uint64_t v61 = *(void *)(v20 + 16);
        id v39 = v24;
        sub_20D8CD904(a5, a6);
        swift_retain();
        id v40 = v39;
        sub_20D8CD904(a5, a6);
        swift_retain();
        sub_20D8D5990(v20, v14);
        swift_retain();
        swift_retain();
        char v37 = sub_20D8D3198(v61, v38, v14 & 0x3FFFFFFFFFFFFFFFLL, (void (*)(uint64_t, uint64_t))sub_20D8D594C);
        swift_release();
        swift_release();
        if (v13)
        {
LABEL_9:
          sub_20D8D3184(v20, v14);
          long long v32 = v63;
        }
        else
        {
LABEL_13:
          long long v32 = v63;
          char v42 = v37 & 1;
          sub_20D8D3184(v20, v14);

LABEL_14:
          unsigned char *v62 = v42;
        }
LABEL_15:
        sub_20D8CD7B8(a5, a6);
        swift_release();

        sub_20D8CD7B8(a5, a6);
        Swift::OpaquePointer_optional result = swift_release();
        break;
      case 3uLL:
        memset(v65, 0, 14);
        id v59 = v25;
        uint64_t v60 = v26;
        uint64_t v58 = v27;
        uint64_t v54 = v22;
        unint64_t v56 = (uint64_t *)v21;
        uint64_t v52 = v23;
        id v41 = v24;
        sub_20D8CD904(a5, a6);
        swift_retain();
        id v31 = v41;
        sub_20D8CD904(a5, a6);
        swift_retain();
        uint64_t v50 = v52;
        uint64_t v49 = v54;
        uint64_t v48 = v56;
        uint64_t v47 = a11;
        unint64_t v33 = (char *)v65;
        uint64_t v45 = a2;
        uint64_t v46 = v58;
        long long v32 = v63;
        uint64_t v43 = v64;
        uint64_t v44 = v19;
        goto LABEL_11;
      default:
        v65[0] = v20;
        LOWORD(v65[1]) = v14;
        BYTE2(v65[1]) = BYTE2(v14);
        BYTE3(v65[1]) = BYTE3(v14);
        BYTE4(v65[1]) = BYTE4(v14);
        BYTE5(v65[1]) = BYTE5(v14);
        uint64_t v51 = v23;
        id v59 = v25;
        uint64_t v60 = v26;
        uint64_t v57 = v27;
        uint64_t v53 = v22;
        id v55 = (uint64_t *)v21;
        id v30 = v24;
        sub_20D8CD904(a5, a6);
        swift_retain();
        id v31 = v30;
        sub_20D8CD904(a5, a6);
        swift_retain();
        uint64_t v50 = v51;
        uint64_t v49 = v53;
        uint64_t v48 = v55;
        uint64_t v47 = a11;
        uint64_t v45 = a2;
        uint64_t v46 = v57;
        long long v32 = v63;
        uint64_t v43 = v64;
        uint64_t v44 = v19;
        unint64_t v33 = (char *)v65 + BYTE6(v14);
LABEL_11:
        sub_20D8D12D0((uint64_t)v65, (uint64_t)v33, a4, (uint64_t)v31, a5, a6, v59, v60, v43, v44, v45, v46, v47, v48, v49, v50);
        sub_20D8D3184(v20, v14);

        if (v13) {
          goto LABEL_15;
        }
        char v42 = 0;
        goto LABEL_14;
    }
  }
  return result;
}

void *sub_20D8D12D0(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, uint64_t a5, unint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t *a14, uint64_t a15, uint64_t a16)
{
  v59[6] = *MEMORY[0x263EF8340];
  uint64_t v21 = (void **)(a4 + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
  swift_beginAccess();
  uint64_t v22 = *v21;
  id v23 = objc_allocWithZone((Class)MSAlgorithmIdentifier);
  id v24 = v22;
  sub_20D8CD904(a5, a6);
  int v25 = (void *)sub_20D8DF128();
  sub_20D8CD7B8(a5, a6);
  id v26 = objc_msgSend(v23, sel_initWithOID_parameters_, v24, v25);

  id v27 = *a3;
  *a3 = v26;

  id v28 = *a3;
  v59[0] = *a7;
  unsigned int v29 = objc_msgSend(v28, sel_ccAlgorithm_, v59);
  id v30 = (void *)v59[0];
  id v31 = (void *)*a7;
  *a7 = v59[0];
  id v32 = v30;

  id v33 = *a3;
  v59[0] = *a7;
  unsigned int v34 = objc_msgSend(v33, sel_ccMode_, v59);
  id v35 = (void *)v59[0];
  char v36 = (void *)*a7;
  *a7 = v59[0];
  id v37 = v35;

  if (v29 || v34 != 11)
  {
    if (qword_26771A080 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_20D8DF178();
    __swift_project_value_buffer(v45, (uint64_t)qword_26771A088);
    uint64_t v46 = sub_20D8DF158();
    os_log_type_t v47 = sub_20D8DF248();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 67109120;
      LODWORD(v59[0]) = v29;
      sub_20D8DF288();
      _os_log_impl(&dword_20D8A1000, v46, v47, "Invalid input algorithm %u", v48, 8u);
      MEMORY[0x210560550](v48, -1, -1);
    }

    sub_20D8D2F08();
    swift_allocError();
    *(void *)uint64_t v49 = 0;
    *(void *)(v49 + 8) = 0;
    *(unsigned char *)(v49 + 16) = 48;
    return (void *)swift_willThrow();
  }
  Swift::OpaquePointer_optional result = objc_msgSend(*a3, sel_asn1AlgId);
  uint64_t v39 = result[2];
  *(_OWORD *)(a8 + 16) = *(_OWORD *)result;
  *(void *)(a8 + 32) = v39;
  if (a10)
  {
    int v40 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], a11 - (void)a10, a10);
    swift_beginAccess();
    *(_DWORD *)(a9 + 16) = v40;
    if (v40)
    {
      if (qword_26771A080 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_20D8DF178();
      __swift_project_value_buffer(v41, (uint64_t)qword_26771A088);
      swift_retain();
      char v42 = sub_20D8DF158();
      os_log_type_t v43 = sub_20D8DF248();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 67109120;
        swift_beginAccess();
        sub_20D8DF288();
        swift_release();
        _os_log_impl(&dword_20D8A1000, v42, v43, "Unable to generate key underlying crypto error %d", v44, 8u);
        MEMORY[0x210560550](v44, -1, -1);
      }
      else
      {

        swift_release();
      }
      swift_beginAccess();
      uint64_t v55 = *(unsigned int *)(a9 + 16);
LABEL_22:
      sub_20D8D2F08();
      swift_allocError();
      *(void *)uint64_t v56 = v55;
      *(void *)(v56 + 8) = 0;
      *(unsigned char *)(v56 + 16) = 0;
      return (void *)swift_willThrow();
    }
    Swift::OpaquePointer_optional result = (void *)CCCryptorGCMOneshotEncrypt();
    if (result)
    {
      unsigned int v50 = result;
      if (qword_26771A080 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_20D8DF178();
      __swift_project_value_buffer(v51, (uint64_t)qword_26771A088);
      uint64_t v52 = sub_20D8DF158();
      os_log_type_t v53 = sub_20D8DF248();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v54 = 67109120;
        sub_20D8DF288();
        _os_log_impl(&dword_20D8A1000, v52, v53, "Error encrypting underlying crypto error %d", v54, 8u);
        MEMORY[0x210560550](v54, -1, -1);
      }

      uint64_t v55 = v50;
      goto LABEL_22;
    }
    uint64_t v57 = *(void **)(a8 + 40);
    if (v57)
    {
      uint64_t v58 = *a14;
      *uint64_t v57 = a16;
      v57[1] = v58;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *static MSCMSAuthEnvelopedData.decodeMessageSecurityObject(_:options:)(void *a1, void *a2)
{
  return sub_20D8D3BEC(a1, a2);
}

uint64_t sub_20D8D197C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_20D8DF2D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_20D8D2524(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x21055F860](i, a1);
        type metadata accessor for SecCertificate();
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_20D8D2524(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_20D8D2524(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_20D8D5938(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      id v8 = (id *)(a1 + 32);
      type metadata accessor for SecCertificate();
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_20D8D2524(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_20D8D2524(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_20D8D5938(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

void __swiftcall MSCMSAuthEnvelopedData.type()(MSOID *__return_ptr retstr)
{
  sub_20D8DF198();
  sub_20D8DF188();
  swift_bridgeObjectRelease();
  sub_20D8DF1A8();
  id v1 = objc_allocWithZone((Class)MSOID);
  sub_20D8D1F7C();
}

id MSCMSAuthEnvelopedData.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MSCMSAuthEnvelopedData.init()()
{
}

id MSCMSAuthEnvelopedData.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_20D8D1F7C()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = (void *)sub_20D8DF188();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithString_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_20D8DF0D8();

    swift_willThrow();
  }
  return v2;
}

void *sub_20D8D2048(void *result, int __c)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v2 = result[1];
  id v4 = result;
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t result = sub_20D8D2490((int *)&__b, __c);
      uint64_t v5 = __b;
      unint64_t v6 = v19 | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_20D8DF0F8();
      uint64_t v7 = v19;
      uint64_t v8 = *(void *)(__b + 16);
      uint64_t v9 = *(void *)(__b + 24);
      uint64_t v10 = sub_20D8DF048();
      if (!v10)
      {
        __break(1u);
        JUMPOUT(0x20D8D222CLL);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_20D8DF078();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = sub_20D8DF068();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      uint64_t result = memset((void *)(v11 + v13), __c, v17);
      void *v4 = __b;
      v4[1] = v7 | 0x8000000000000000;
      return result;
    case 3uLL:
      return result;
    default:
      uint64_t __b = *result;
      LOWORD(v19) = v2;
      BYTE2(v19) = BYTE2(v2);
      BYTE3(v19) = BYTE3(v2);
      BYTE4(v19) = BYTE4(v2);
      BYTE5(v19) = BYTE5(v2);
      BYTE6(v19) = BYTE6(v2);
      uint64_t result = memset(&__b, __c, BYTE6(v2));
      uint64_t v5 = __b;
      unint64_t v6 = v19 | ((unint64_t)BYTE4(v19) << 32) | ((unint64_t)BYTE5(v19) << 40) | ((unint64_t)BYTE6(v19) << 48);
LABEL_4:
      void *v4 = v5;
      v4[1] = v6;
      return result;
  }
}

uint64_t *sub_20D8D223C(uint64_t *result, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v5 = *result;
  unint64_t v4 = result[1];
  uint64_t v9 = result;
  switch(v4 >> 62)
  {
    case 1uLL:
      uint64_t v11 = v4 & 0x3FFFFFFFFFFFFFFFLL;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v13 = v5 >> 32;
      uint64_t v25 = a4;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_18;
      }
      if (v13 < (int)v5) {
        goto LABEL_29;
      }
      if (sub_20D8DF048() && __OFSUB__((int)v5, sub_20D8DF078())) {
        goto LABEL_30;
      }
      sub_20D8DF088();
      swift_allocObject();
      uint64_t v20 = sub_20D8DF028();
      swift_release();
      uint64_t v11 = v20;
      uint64_t v13 = v5 >> 32;
LABEL_18:
      if (v13 < (int)v5) {
        goto LABEL_27;
      }
      uint64_t v21 = sub_20D8DF048();
      if (!v21) {
        goto LABEL_32;
      }
      uint64_t v22 = v21;
      uint64_t v23 = sub_20D8DF078();
      if (__OFSUB__((int)v5, v23)) {
        goto LABEL_28;
      }
      uint64_t v24 = v22 + (int)v5 - v23;
      uint64_t result = (uint64_t *)sub_20D8DF068();
      *a2 = a3;
      a2[1] = v24;
      if (a3 >= 1) {
        *(void *)(v25 + 8) = a2;
      }
      unint64_t v10 = v11 | 0x4000000000000000;
      break;
    case 2uLL:
      uint64_t v26 = *result;
      uint64_t v27 = v4 & 0x3FFFFFFFFFFFFFFFLL;
      sub_20D8DF0F8();
      uint64_t v5 = v26;
      uint64_t v14 = v27;
      uint64_t v15 = *(void *)(v26 + 16);
      uint64_t v16 = sub_20D8DF048();
      if (!v16)
      {
        __break(1u);
LABEL_32:
        __break(1u);
        JUMPOUT(0x20D8D2480);
      }
      uint64_t v17 = v16;
      uint64_t v18 = sub_20D8DF078();
      if (__OFSUB__(v15, v18))
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
      }
      uint64_t v19 = v17 + v15 - v18;
      uint64_t result = (uint64_t *)sub_20D8DF068();
      *a2 = a3;
      a2[1] = v19;
      if (a3 >= 1) {
        *(void *)(a4 + 8) = a2;
      }
      unint64_t v10 = v14 | 0x8000000000000000;
      break;
    case 3uLL:
      *a2 = a3;
      a2[1] = (uint64_t)&v26;
      if (a3 >= 1) {
        *(void *)(a4 + 8) = a2;
      }
      return result;
    default:
      *a2 = a3;
      a2[1] = (uint64_t)&v26;
      if (a3 > 0) {
        *(void *)(a4 + 8) = a2;
      }
      unint64_t v10 = v4 & 0xFFFFFFFFFFFFFFLL;
      break;
  }
  *uint64_t v9 = v5;
  v9[1] = v10;
  return result;
}

char *sub_20D8D2490(int *a1, int a2)
{
  uint64_t result = (char *)sub_20D8DF108();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = (char *)sub_20D8DF048();
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  uint64_t result = (char *)sub_20D8DF078();
  uint64_t v8 = v5 - (void)result;
  if (__OFSUB__(v5, result))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v9 = v6 - v5;
  uint64_t v10 = sub_20D8DF068();
  if (v10 >= v9) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v10;
  }

  return (char *)memset(&v7[v8], a2, v11);
}

uint64_t sub_20D8D2524(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_20D8D2544(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_20D8D2544(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267719CF0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_20D8DF318();
  __break(1u);
  return result;
}

id sub_20D8D26B4(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_20D8E21C0;
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients] = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v4;
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v4;
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v4;
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0;
  *(_OWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_20D8E21C0;
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = a1;
  sub_20D8DF198();
  uint64_t v5 = v1;
  id v6 = a1;
  sub_20D8DF188();
  swift_bridgeObjectRelease();
  sub_20D8DF1A8();
  id v7 = objc_allocWithZone((Class)MSOID);
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = sub_20D8D1F7C();

  v9.receiver = v5;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_init);
}

id sub_20D8D2820(uint64_t a1, unint64_t a2, void *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = (uint64_t *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent];
  *(_OWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_20D8E21C0;
  id v7 = &v3[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients] = MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v8;
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v8;
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v8;
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0;
  *(_OWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_20D8E21C0;
  sub_20D8DF198();
  objc_super v9 = v3;
  sub_20D8DF188();
  swift_bridgeObjectRelease();
  sub_20D8DF1A8();
  id v10 = objc_allocWithZone((Class)MSOID);
  id v11 = sub_20D8D1F7C();
  *(void *)&v9[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = v11;
  sub_20D8DF198();
  id v17 = v11;
  sub_20D8DF188();
  swift_bridgeObjectRelease();
  sub_20D8DF1A8();
  id v12 = objc_allocWithZone((Class)MSOID);
  *(void *)&v9[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = sub_20D8D1F7C();
  swift_beginAccess();
  uint64_t v13 = *v6;
  unint64_t v14 = v6[1];
  *id v6 = a1;
  v6[1] = a2;
  sub_20D8CD904(a1, a2);
  sub_20D8CD7B8(v13, v14);
  swift_beginAccess();
  id v15 = a3;
  MEMORY[0x21055F780]();
  if (*(void *)((*(void *)v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v7 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_20D8DF218();
  sub_20D8DF238();
  sub_20D8DF208();
  swift_endAccess();

  v20.receiver = v9;
  v20.super_class = ObjectType;
  return objc_msgSendSuper2(&v20, sel_init);
}

id sub_20D8D2AE8(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  id v10 = (uint64_t *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent];
  *(_OWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_20D8E21C0;
  uint64_t v11 = MEMORY[0x263F8EE78];
  id v12 = &v5[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients] = MEMORY[0x263F8EE78];
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v11;
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v11;
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v11;
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0;
  *(_OWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_20D8E21C0;
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = a4;
  sub_20D8DF198();
  uint64_t v13 = v5;
  id v14 = a4;
  sub_20D8DF188();
  swift_bridgeObjectRelease();
  sub_20D8DF1A8();
  id v15 = objc_allocWithZone((Class)MSOID);
  *(void *)&v13[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = sub_20D8D1F7C();
  swift_beginAccess();
  uint64_t v16 = *v10;
  unint64_t v17 = v10[1];
  uint64_t *v10 = a1;
  v10[1] = a2;
  sub_20D8CD904(a1, a2);
  sub_20D8CD7B8(v16, v17);
  if (a3)
  {
    swift_beginAccess();
    id v18 = a3;
    MEMORY[0x21055F780]();
    if (*(void *)((*(void *)v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v12 & 0xFFFFFFFFFFFFFF8)
                                                                                 + 0x18) >> 1)
      sub_20D8DF218();
    sub_20D8DF238();
    sub_20D8DF208();
    swift_endAccess();
  }

  v21.receiver = v13;
  v21.super_class = ObjectType;
  return objc_msgSendSuper2(&v21, sel_init);
}

id sub_20D8D2D28(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_20D8E21C0;
  objc_super v9 = &v3[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  uint64_t v10 = MEMORY[0x263F8EE78];
  *(void *)objc_super v9 = MEMORY[0x263F8EE78];
  *(void *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v10;
  *(void *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v10;
  *(void *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v10;
  uint64_t v11 = &v4[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent];
  *(void *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0;
  *(_OWORD *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_20D8E21C0;
  swift_beginAccess();
  *(void *)uint64_t v11 = a1;
  id v12 = v4;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  id v13 = objc_msgSend(a1, sel_type);
  *(void *)&v12[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = v13;
  swift_beginAccess();
  id v14 = a2;
  MEMORY[0x21055F780]();
  if (*(void *)((*(void *)v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v9 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_20D8DF218();
  sub_20D8DF238();
  sub_20D8DF208();
  swift_endAccess();
  *(void *)&v12[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = a3;
  id v15 = a3;

  v17.receiver = v12;
  v17.super_class = ObjectType;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_20D8D2F08()
{
  unint64_t result = qword_267719E00;
  if (!qword_267719E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267719E00);
  }
  return result;
}

uint64_t sub_20D8D2F5C(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_20D8DF088();
      swift_allocObject();
      sub_20D8DF058();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_20D8DF118();
        unint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_20D8D2FFC()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_20D8D300C(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_20D8D30D0(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_20D8D300C(__src, &__src[a2]);
  }
  sub_20D8DF088();
  swift_allocObject();
  sub_20D8DF038();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_20D8DF118();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_20D8D3184(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_20D8CD7B8(a1, a2);
  }
  return a1;
}

uint64_t sub_20D8D3198(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t result = sub_20D8DF048();
  uint64_t v8 = result;
  if (result)
  {
    uint64_t result = sub_20D8DF078();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v8 += a1 - result;
  }
  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v11 = sub_20D8DF068();
  if (v11 >= v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = v8 + v12;
  if (v8) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  a4(v8, v14);
  return 0;
}

uint64_t sub_20D8D3240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, id *a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t result = sub_20D8DF048();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v21 = result;
  uint64_t result = sub_20D8DF078();
  uint64_t v22 = a1 - result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v23 = __OFSUB__(a2, a1);
  uint64_t v24 = a2 - a1;
  if (v23)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v25 = sub_20D8DF068();
  if (v25 >= v24) {
    uint64_t v26 = v24;
  }
  else {
    uint64_t v26 = v25;
  }
  uint64_t result = sub_20D8D0E00(v21 + v22, v21 + v22 + v26, a4, a5, a7, a8, &v29, a10, a11, a12, a13, a14, a15);
  if (!v15) {
    return v29;
  }
  return result;
}

uint64_t sub_20D8D3350(uint64_t *a1, uint64_t *a2, id *a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v15 = *a1;
  unint64_t v14 = a1[1];
  uint64_t v16 = v13;
  switch(v14 >> 62)
  {
    case 1uLL:
      uint64_t v27 = v14 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_20D8E21C0;
      id v28 = a4;
      sub_20D8CD904(a5, a6);
      swift_retain();
      id v47 = v28;
      sub_20D8CD904(a5, a6);
      swift_retain();
      uint64_t v48 = v27;
      uint64_t v16 = v15 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_19;
      }
      if (v16 < (int)v15) {
        goto LABEL_26;
      }
      if (sub_20D8DF048() && __OFSUB__((int)v15, sub_20D8DF078())) {
        goto LABEL_27;
      }
      sub_20D8DF088();
      swift_allocObject();
      uint64_t v41 = sub_20D8DF028();
      swift_release();
      uint64_t v48 = v41;
LABEL_19:
      if (v16 < (int)v15)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
      }
      char v42 = a2;
      id v43 = v47;
      sub_20D8CD904(a5, a6);
      swift_retain();
      char v44 = sub_20D8D3240((int)v15, v15 >> 32, v48, v42, a3, (uint64_t)v43, a5, a6, a7, a8, a9, a10, a11, a12, a13);
      if (v13)
      {
        swift_release();
      }
      else
      {
        char v45 = v44;
        swift_release();
        uint64_t v16 = v45 & 1;
      }
      sub_20D8CD7B8(a5, a6);

      sub_20D8CD7B8(a5, a6);
      swift_release();
      sub_20D8CD7B8(a5, a6);
      *a1 = v15;
      a1[1] = v48 | 0x4000000000000000;
      goto LABEL_24;
    case 2uLL:
      os_log_type_t v53 = a1;
      *(void *)&long long v59 = *a1;
      *((void *)&v59 + 1) = v14 & 0x3FFFFFFFFFFFFFFFLL;
      id v29 = a4;
      sub_20D8CD904(a5, a6);
      swift_retain();
      unsigned int v50 = a3;
      id v30 = v29;
      sub_20D8CD904(a5, a6);
      swift_retain();
      sub_20D8DF0F8();
      id v31 = a2;
      uint64_t v23 = v15;
      uint64_t v16 = *((void *)&v59 + 1);
      uint64_t v32 = *(void *)(v15 + 16);
      uint64_t v33 = *(void *)(v15 + 24);
      id v34 = v30;
      sub_20D8CD904(a5, a6);
      swift_retain();
      char v35 = sub_20D8D3240(v32, v33, *((uint64_t *)&v59 + 1), v31, v50, (uint64_t)v34, a5, a6, a7, a8, a9, a10, a11, a12, a13);
      if (v13)
      {
        swift_release();
        sub_20D8CD7B8(a5, a6);

        sub_20D8CD7B8(a5, a6);
        swift_release();
        sub_20D8CD7B8(a5, a6);
        unint64_t v26 = *((void *)&v59 + 1) | 0x8000000000000000;
        goto LABEL_11;
      }
      char v40 = v35;
      swift_release();
      uint64_t v16 = v40 & 1;
      sub_20D8CD7B8(a5, a6);

      sub_20D8CD7B8(a5, a6);
      swift_release();
      sub_20D8CD7B8(a5, a6);
      unint64_t v39 = *((void *)&v59 + 1) | 0x8000000000000000;
      goto LABEL_16;
    case 3uLL:
      *(void *)((char *)&v59 + 7) = 0;
      *(void *)&long long v59 = 0;
      id v36 = a4;
      sub_20D8CD904(a5, a6);
      swift_retain();
      sub_20D8D0E00((uint64_t)&v59, (uint64_t)&v59, a2, a3, a5, a6, &v60, a8, a9, a10, a11, a12, a13);

      sub_20D8CD7B8(a5, a6);
      if (!v13) {
        uint64_t v16 = v60;
      }
      goto LABEL_24;
    default:
      os_log_type_t v53 = a1;
      *(void *)&long long v59 = *a1;
      WORD4(v59) = v14;
      BYTE10(v59) = BYTE2(v14);
      BYTE11(v59) = BYTE3(v14);
      BYTE12(v59) = BYTE4(v14);
      BYTE13(v59) = BYTE5(v14);
      BYTE14(v59) = BYTE6(v14);
      uint64_t v21 = (char *)&v59 + BYTE6(v14);
      id v22 = a4;
      sub_20D8CD904(a5, a6);
      swift_retain();
      sub_20D8D0E00((uint64_t)&v59, (uint64_t)v21, a2, a3, a5, a6, &v60, a8, a9, a10, a11, a12, a13);
      if (v13)
      {
        uint64_t v23 = v59;
        uint64_t v57 = DWORD2(v59);
        uint64_t v24 = BYTE12(v59);
        uint64_t v16 = BYTE13(v59);
        uint64_t v25 = BYTE14(v59);

        sub_20D8CD7B8(a5, a6);
        unint64_t v26 = v57 | (v24 << 32) | (v16 << 40) | (v25 << 48);
LABEL_11:
        *os_log_type_t v53 = v23;
        v53[1] = v26;
      }
      else
      {
        uint64_t v16 = v60;
        uint64_t v23 = v59;
        uint64_t v58 = DWORD2(v59);
        uint64_t v55 = BYTE12(v59);
        uint64_t v37 = BYTE13(v59);
        uint64_t v38 = BYTE14(v59);

        sub_20D8CD7B8(a5, a6);
        unint64_t v39 = v58 | (v55 << 32) | (v37 << 40) | (v38 << 48);
LABEL_16:
        *os_log_type_t v53 = v23;
        v53[1] = v39;
      }
LABEL_24:
      swift_release();
      return v16;
  }
}

uint64_t sub_20D8D3A1C(uint64_t a1)
{
  uint64_t result = encode_AuthEnvelopedData(a1 + v1[2] - 1, v1[2], v1[3], v1[4]);
  if (result)
  {
    if (qword_26771A080 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_20D8DF178();
    __swift_project_value_buffer(v3, (uint64_t)qword_26771A088);
    uint64_t v4 = sub_20D8DF158();
    os_log_type_t v5 = sub_20D8DF248();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_20D8A1000, v4, v5, "Invalid data - error encoding AuthEnvelopedData", v6, 2u);
      MEMORY[0x210560550](v6, -1, -1);
    }

    sub_20D8D2F08();
    swift_allocError();
    *(_OWORD *)uint64_t v7 = xmmword_20D8E21A0;
    *(unsigned char *)(v7 + 16) = 48;
    return swift_willThrow();
  }
  return result;
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

void type metadata accessor for SecCertificate()
{
  if (!qword_267719D08)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267719D08);
    }
  }
}

void *sub_20D8D3BEC(void *a1, void *a2)
{
  uint64_t v185 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0x26411C000uLL;
  id v6 = objc_msgSend(objc_allocWithZone((Class)MSCMSRecipientInfo), sel_init);
  unint64_t v7 = 0x26411C000uLL;
  v163 = (uint64_t *)objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_init);
  id v8 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_init);
  int v177 = 0;
  uint64_t v178 = 0;
  int v179 = 0;
  long long v180 = 0u;
  memset(v181, 0, sizeof(v181));
  long long v182 = 0u;
  long long v183 = 0u;
  v184 = 0;
  if (nsheim_decode_AuthEnvelopedData(a1))
  {
    if (qword_26771A080 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_20D8DF178();
    __swift_project_value_buffer(v9, (uint64_t)qword_26771A088);
    uint64_t v10 = sub_20D8DF158();
    os_log_type_t v11 = sub_20D8DF248();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_20D8A1000, v10, v11, "Invalid data - error decoding AuthEnvelopedData", v12, 2u);
      MEMORY[0x210560550](v12, -1, -1);
    }

    dumpNSData("AuthEnvelopedData", a1);
    sub_20D8D2F08();
    swift_allocError();
    *(_OWORD *)uint64_t v13 = xmmword_20D8E21F0;
    *(unsigned char *)(v13 + 16) = 48;
    swift_willThrow();

    unint64_t v14 = v163;
    goto LABEL_7;
  }
  id v16 = objc_allocWithZone((Class)type metadata accessor for MSCMSAuthEnvelopedData());
  id v17 = v8;
  id v18 = (char *)sub_20D8D26B4(v17);
  v158 = v17;

  long long v160 = v18;
  int v157 = a2;
  uint64_t v19 = v18;
  id v159 = v2;
  a2 = 0;
  swift_bridgeObjectRelease();
  unint64_t v20 = (unint64_t)&v18[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  swift_beginAccess();
  if (*(void *)v20 >> 62) {
    goto LABEL_99;
  }
  if (*(uint64_t *)((*(void *)v20 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
  {
LABEL_100:

    if (qword_26771A080 != -1) {
      swift_once();
    }
    uint64_t v132 = sub_20D8DF178();
    __swift_project_value_buffer(v132, (uint64_t)qword_26771A088);
    uint64_t v133 = sub_20D8DF158();
    os_log_type_t v134 = sub_20D8DF248();
    if (os_log_type_enabled(v133, v134))
    {
      unint64_t v135 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v135 = 0;
      _os_log_impl(&dword_20D8A1000, v133, v134, "Invalid data - no recipients found", v135, 2u);
      MEMORY[0x210560550](v135, -1, -1);
    }

    sub_20D8D2F08();
    swift_allocError();
    *(_OWORD *)uint64_t v136 = xmmword_20D8E21F0;
    *(unsigned char *)(v136 + 16) = 48;
    swift_willThrow();

    return a2;
  }
LABEL_11:
  v170 = (uint64_t *)v20;
  if (!(void)v182) {
    goto LABEL_119;
  }
  uint64_t v21 = *((void *)&v180 + 1);
  uint64_t v150 = v181[0];
  unint64_t v20 = NSDataFromOctetString((void *)v182);
  uint64_t v22 = sub_20D8DF148();
  uint64_t v24 = v23;

  uint64_t v25 = (uint64_t *)&v160[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent];
  uint64_t v26 = *(void *)&v160[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent];
  unint64_t v27 = *(void *)&v160[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent + 8];
  uint64_t *v25 = v22;
  v25[1] = v24;
  sub_20D8CD7B8(v26, v27);
  *(void *)&long long v174 = a2;
  id v28 = objc_msgSend(objc_allocWithZone(*(Class *)(v7 + 976)), sel_initWithAsn1AlgId_error_, &v181[1], &v174);

  v161 = (uint64_t *)(id)v174;
  id v29 = v28;
  id v30 = NSDataFromOctetString(&v183);
  uint64_t v5 = sub_20D8DF148();
  unint64_t v7 = v31;

  switch(v7 >> 62)
  {
    case 1uLL:
      uint64_t v42 = (int)v5;
      uint64_t v43 = v5 >> 32;
      goto LABEL_23;
    case 2uLL:
      uint64_t v42 = *(void *)(v5 + 16);
      uint64_t v43 = *(void *)(v5 + 24);
LABEL_23:
      if (v42 == v43) {
        goto LABEL_24;
      }
      goto LABEL_14;
    case 3uLL:
      goto LABEL_24;
    default:
      if ((v7 & 0xFF000000000000) == 0)
      {
LABEL_24:

        a2 = v160;
        if (qword_26771A080 != -1) {
          swift_once();
        }
        uint64_t v44 = sub_20D8DF178();
        __swift_project_value_buffer(v44, (uint64_t)qword_26771A088);
        char v45 = sub_20D8DF158();
        os_log_type_t v46 = sub_20D8DF248();
        if (os_log_type_enabled(v45, v46))
        {
          id v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v47 = 0;
          _os_log_impl(&dword_20D8A1000, v45, v46, "Error extracting MAC", v47, 2u);
          MEMORY[0x210560550](v47, -1, -1);
        }

        sub_20D8D2F08();
        swift_allocError();
        *(void *)uint64_t v48 = 0;
        *(void *)(v48 + 8) = 0;
        *(unsigned char *)(v48 + 16) = 48;
        swift_willThrow();

        sub_20D8CD7B8(v5, v7);
        unint64_t v14 = v161;
        goto LABEL_7;
      }
LABEL_14:
      v168 = v29;
      uint64_t v32 = *((void *)&v182 + 1);
      uint64_t v162 = v5;
      uint64_t v147 = v21;
      unint64_t v155 = v7;
      if (*((void *)&v182 + 1))
      {
        int v149 = 0;
        uint64_t v33 = *(long long **)(*((void *)&v182 + 1) + 8);
        if (v33)
        {
          uint64_t v34 = **((_DWORD **)&v182 + 1);
          if (v34)
          {
            char v35 = &v160[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes];
            int v36 = *((_DWORD *)v33 + 4);
            uint64_t v37 = *((void *)v33 + 3);
            long long v174 = *v33;
            LODWORD(v175) = v36;
            *((void *)&v175 + 1) = v37;
            a2 = (void *)0x26411C000;
            uint64_t v38 = self;
            v172[0] = v161;
            id v39 = objc_msgSend(v38, sel_decodeAttribute_error_, &v174, v172);
            id v40 = v172[0];

            swift_beginAccess();
            id v41 = v39;
            MEMORY[0x21055F780]();
            unint64_t v20 = *(void *)((*(void *)v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v20 >= *(void *)((*(void *)v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_20D8DF218();
            }
            sub_20D8DF238();
            sub_20D8DF208();
            swift_endAccess();
            v166 = v41;

            if (v34 != 1)
            {
              uint64_t v49 = 0;
              uint64_t v5 = v34 - 1;
              while (1)
              {
                uint64_t v50 = *(void *)(v32 + 8);
                if (!v50) {
                  break;
                }
                uint64_t v51 = v50 + v49;
                int v52 = *(_DWORD *)(v51 + 48);
                uint64_t v53 = *(void *)(v51 + 56);
                long long v174 = *(_OWORD *)(v51 + 32);
                LODWORD(v175) = v52;
                *((void *)&v175 + 1) = v53;
                uint64_t v54 = self;
                v172[0] = v40;
                id v55 = objc_msgSend(v54, sel_decodeAttribute_error_, &v174, v172);
                id v56 = v172[0];

                swift_beginAccess();
                unint64_t v20 = (unint64_t)v55;
                MEMORY[0x21055F780]();
                if (*(void *)((*(void *)v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v35 & 0xFFFFFFFFFFFFFF8)
                                                                                             + 0x18) >> 1)
                  sub_20D8DF218();
                sub_20D8DF238();
                sub_20D8DF208();
                swift_endAccess();
                v166 = (void *)v20;

                v49 += 32;
                id v40 = v56;
                if (!--v5)
                {
                  v161 = (uint64_t *)v56;
                  int v149 = 1;
                  unint64_t v7 = v155;
                  goto LABEL_38;
                }
              }
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
              swift_once();
              uint64_t v137 = sub_20D8DF178();
              __swift_project_value_buffer(v137, (uint64_t)qword_26771A088);
              uint64_t v138 = sub_20D8DF158();
              os_log_type_t v139 = sub_20D8DF248();
              if (os_log_type_enabled(v138, v139))
              {
                uint64_t v140 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v140 = 0;
                _os_log_impl(&dword_20D8A1000, v138, v139, "Invalid data - no certificate in originatorCertificates", v140, 2u);
                MEMORY[0x210560550](v140, -1, -1);
              }

              sub_20D8D2F08();
              swift_allocError();
              *(_OWORD *)uint64_t v141 = xmmword_20D8E2200;
              *(unsigned char *)(v141 + 16) = 48;
              swift_willThrow();

              unint64_t v14 = v170;
LABEL_7:

              return a2;
            }
            int v149 = 1;
            v161 = (uint64_t *)v40;
            uint64_t v5 = v162;
            unint64_t v7 = v155;
          }
          else
          {
LABEL_38:
            uint64_t v5 = v162;
          }
        }
      }
      else
      {
        int v149 = 0;
      }
      uint64_t v57 = v184;
      if (v184)
      {
        int v58 = 0;
        long long v59 = (long long *)*((void *)v184 + 1);
        if (v59)
        {
          uint64_t v60 = *v184;
          if (v60)
          {
            uint64_t v61 = &v160[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes];
            int v62 = *((_DWORD *)v59 + 4);
            uint64_t v63 = *((void *)v59 + 3);
            long long v174 = *v59;
            LODWORD(v175) = v62;
            *((void *)&v175 + 1) = v63;
            a2 = (void *)0x26411C000;
            uint64_t v64 = self;
            v172[0] = v161;
            id v65 = objc_msgSend(v64, sel_decodeAttribute_error_, &v174, v172);
            id v66 = (uint64_t *)v172[0];

            swift_beginAccess();
            id v67 = v65;
            MEMORY[0x21055F780]();
            unint64_t v20 = *(void *)((*(void *)v61 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v20 >= *(void *)((*(void *)v61 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_20D8DF218();
            }
            sub_20D8DF238();
            sub_20D8DF208();
            swift_endAccess();
            v167 = v67;

            if (v60 == 1)
            {
              int v58 = 1;
              v161 = v66;
            }
            else
            {
              uint64_t v68 = 0;
              uint64_t v5 = v60 - 1;
              do
              {
                uint64_t v69 = *((void *)v57 + 1);
                if (!v69) {
                  goto LABEL_118;
                }
                uint64_t v70 = v69 + v68;
                int v71 = *(_DWORD *)(v70 + 48);
                uint64_t v72 = *(void *)(v70 + 56);
                long long v174 = *(_OWORD *)(v70 + 32);
                LODWORD(v175) = v71;
                *((void *)&v175 + 1) = v72;
                uint64_t v73 = self;
                v172[0] = v66;
                id v74 = objc_msgSend(v73, sel_decodeAttribute_error_, &v174, v172);
                uint64_t v75 = (uint64_t *)v172[0];

                swift_beginAccess();
                unint64_t v20 = (unint64_t)v74;
                MEMORY[0x21055F780]();
                if (*(void *)((*(void *)v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v61 & 0xFFFFFFFFFFFFFF8)
                                                                                             + 0x18) >> 1)
                  sub_20D8DF218();
                sub_20D8DF238();
                sub_20D8DF208();
                swift_endAccess();
                v167 = (void *)v20;

                v68 += 32;
                id v66 = v75;
                --v5;
              }
              while (v5);
              v161 = v75;
              int v58 = 1;
              unint64_t v7 = v155;
            }
          }
          uint64_t v5 = v162;
        }
      }
      else
      {
        int v58 = 0;
      }
      uint64_t v76 = *v170;
      uint64_t v77 = v168;
      int v148 = v58;
      if ((unint64_t)*v170 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v78 = sub_20D8DF2D8();
        a2 = v160;
        if (!v78)
        {
LABEL_109:

          swift_bridgeObjectRelease();
          if (qword_26771A080 != -1) {
            swift_once();
          }
          uint64_t v142 = sub_20D8DF178();
          __swift_project_value_buffer(v142, (uint64_t)qword_26771A088);
          long long v143 = sub_20D8DF158();
          os_log_type_t v144 = sub_20D8DF248();
          if (os_log_type_enabled(v143, v144))
          {
            long long v145 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)long long v145 = 0;
            _os_log_impl(&dword_20D8A1000, v143, v144, "Error decrypting encoded content", v145, 2u);
            MEMORY[0x210560550](v145, -1, -1);
          }

          sub_20D8D2F08();
          swift_allocError();
          *(_OWORD *)uint64_t v146 = xmmword_20D8E21F0;
          *(unsigned char *)(v146 + 16) = 48;
          swift_willThrow();

          sub_20D8CD7B8(v5, v7);
          if (v149) {

          }
          unint64_t v14 = (uint64_t *)v167;
          if (!v148) {
            return a2;
          }
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v78 = *(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        a2 = v160;
        if (!v78) {
          goto LABEL_109;
        }
      }
      unint64_t v165 = v76 & 0xC000000000000001;
      uint64_t v79 = 4;
      v163 = (uint64_t *)v78;
      uint64_t v164 = v76;
      break;
  }
  while (1)
  {
    if (v165) {
      id v82 = (id)MEMORY[0x21055F860](v79 - 4, v76);
    }
    else {
      id v82 = *(id *)(v76 + 8 * v79);
    }
    a2 = v82;
    if (__OFADD__(v79 - 4, 1))
    {
      __break(1u);
LABEL_99:
      swift_bridgeObjectRetain();
      uint64_t v131 = sub_20D8DF2D8();
      swift_bridgeObjectRelease();
      if (v131 < 1) {
        goto LABEL_100;
      }
      goto LABEL_11;
    }
    uint64_t v169 = v79 - 3;
    *(void *)&long long v174 = 0;
    unsigned int v83 = objc_msgSend(v77, sel_ccAlgorithm_, &v174);
    unint64_t v20 = (unint64_t)(id)v174;
    unsigned int v84 = objc_msgSend(v77, sel_ccMode_, &v174);
    id v171 = (id)v174;

    if (!v83 && v84 == 11) {
      break;
    }
    if (qword_26771A080 != -1) {
      swift_once();
    }
    uint64_t v92 = sub_20D8DF178();
    __swift_project_value_buffer(v92, (uint64_t)qword_26771A088);
    uint64_t v93 = sub_20D8DF158();
    os_log_type_t v94 = sub_20D8DF248();
    unint64_t v20 = v94;
    if (os_log_type_enabled(v93, v94))
    {
      unint64_t v95 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v95 = 67109120;
      LODWORD(v174) = v83;
      sub_20D8DF288();
      _os_log_impl(&dword_20D8A1000, v93, (os_log_type_t)v20, "Invalid encryption algorithm %u", v95, 8u);
      MEMORY[0x210560550](v95, -1, -1);
    }

    sub_20D8D2F08();
    uint64_t v81 = (void *)swift_allocError();
    *(void *)uint64_t v80 = 0;
    *(void *)(v80 + 8) = 0;
LABEL_60:
    *(unsigned char *)(v80 + 16) = 48;
    swift_willThrow();

    uint64_t v76 = v164;
    if (!v81)
    {
      int v154 = a2;
      goto LABEL_85;
    }

    id v159 = 0;
    ++v79;
    uint64_t v77 = v168;
    a2 = v160;
    if (v169 == v78) {
      goto LABEL_109;
    }
  }
  int v176 = 0;
  long long v174 = 0u;
  long long v175 = 0u;
  id v85 = objc_msgSend(v77, sel_parameters);
  if (v85)
  {
    uint64_t v86 = sub_20D8DF148();
    unint64_t v20 = v87;

    id v85 = (id)sub_20D8DF128();
    sub_20D8CD7B8(v86, v20);
  }
  int v88 = nsheim_decode_GCMParameters(v85);

  if (v88)
  {
    if (qword_26771A080 != -1) {
      swift_once();
    }
    uint64_t v89 = sub_20D8DF178();
    __swift_project_value_buffer(v89, (uint64_t)qword_26771A088);
    unint64_t v90 = sub_20D8DF158();
    os_log_type_t v91 = sub_20D8DF248();
    if (os_log_type_enabled(v90, v91))
    {
      unint64_t v20 = swift_slowAlloc();
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl(&dword_20D8A1000, v90, v91, "Invalid data - error decoding GCMParameters", (uint8_t *)v20, 2u);
      MEMORY[0x210560550](v20, -1, -1);
    }

    sub_20D8D2F08();
    uint64_t v81 = (void *)swift_allocError();
    *(_OWORD *)uint64_t v80 = xmmword_20D8E2210;
    goto LABEL_60;
  }
  uint64_t v96 = NSDataFromOctetString(&v174);
  uint64_t v156 = sub_20D8DF148();
  unint64_t v98 = v97;

  id v99 = [a2 key];
  uint64_t v100 = sub_20D8DF148();
  unint64_t v102 = v101;

  os_log_type_t v103 = (uint64_t *)&v160[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent];
  uint64_t v104 = *(void *)&v160[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent];
  unint64_t v105 = *(void *)&v160[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent + 8];
  sub_20D8CD904(v104, v105);
  uint64_t v152 = v100;
  unint64_t v153 = v102;
  unint64_t v7 = v155;
  uint64_t v106 = sub_20D8CD65C(0);
  int v154 = a2;
  if (v159)
  {
    sub_20D8CD7B8(v104, v105);
    id v108 = objc_msgSend(a2, sel_key_, 1, v105);
    unint64_t v151 = v98;
    uint64_t v109 = sub_20D8DF148();
    unint64_t v111 = v110;

    uint64_t v113 = *v103;
    unint64_t v112 = v103[1];
    sub_20D8CD904(*v103, v112);
    uint64_t v114 = sub_20D8CD65C(0);
    unint64_t v116 = v115;
    sub_20D8CD7B8(v152, v153);
    sub_20D8CD7B8(v156, v151);
    unint64_t v165 = v116;
    uint64_t v169 = v114;
    sub_20D8CD7B8(v109, v111);

    sub_20D8CD7B8(v113, v112);
    unint64_t v7 = v155;
  }
  else
  {
    unint64_t v165 = v107;
    uint64_t v169 = v106;
    sub_20D8CD7B8(v152, v102);
    sub_20D8CD7B8(v156, v98);
    sub_20D8CD7B8(v104, v105);
  }

LABEL_85:
  a2 = v160;
  swift_bridgeObjectRelease();

  v173[0] = v147;
  v173[1] = v150;
  *(void *)&long long v174 = v161;
  id v117 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_initWithAsn1OID_error_, v173, &v174);
  id v118 = (id)v174;

  unint64_t v119 = (void **)&v160[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType];
  swift_beginAccess();
  v120 = *v119;
  *unint64_t v119 = v117;
  id v121 = v117;

  sub_20D8DF198();
  v122 = (void *)sub_20D8DF188();
  swift_bridgeObjectRelease();
  LOBYTE(v119) = objc_msgSend(v121, sel_isEqualToString_, v122);

  if (v119)
  {

    sub_20D8CD7B8(v162, v7);
    unint64_t v123 = (uint64_t *)&v160[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent];
    swift_beginAccess();
    uint64_t v124 = *v123;
    unint64_t v125 = v123[1];
    *unint64_t v123 = v169;
    v123[1] = v165;
    sub_20D8CD7B8(v124, v125);

    goto LABEL_89;
  }
  v126 = (void *)sub_20D8DF128();
  v172[0] = v118;
  id v127 = decodeEmbeddedCMSContent(v121, v126, v157, (uint64_t)v172);

  id v128 = v172[0];
  if (v127)
  {
    swift_unknownObjectRetain();
    sub_20D8CD7B8(v169, v165);

    sub_20D8CD7B8(v162, v7);
    swift_unknownObjectRelease();
    unint64_t v129 = &v160[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent];
    swift_beginAccess();
    id v118 = v128;
    *(void *)unint64_t v129 = v127;

    swift_unknownObjectRelease();
LABEL_89:

    if (v149) {
    if (v148)
    }
  }
  else
  {

    sub_20D8D2F08();
    swift_allocError();
    *(_OWORD *)uint64_t v130 = xmmword_20D8E21F0;
    *(unsigned char *)(v130 + 16) = 48;
    swift_willThrow();

    sub_20D8CD7B8(v169, v165);
    sub_20D8CD7B8(v162, v7);

    if (v149) {
    if (v148)
    }
  }
  return a2;
}

uint64_t type metadata accessor for MSCMSAuthEnvelopedData()
{
  return self;
}

uint64_t method lookup function for MSCMSAuthEnvelopedData(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MSCMSAuthEnvelopedData);
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(encryptionAlgorithm:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:encryptionAlgorithm:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(embeddedContent:recipient:encryptionAlgorithm:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t sub_20D8D58FC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_OWORD *sub_20D8D5938(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_20D8D594C(uint64_t a1, uint64_t a2)
{
  return sub_20D8D12D0(a1, a2, *(id **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void **)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(void **)(v2 + 72), *(void *)(v2 + 80), *(void *)(v2 + 88), *(void *)(v2 + 96), *(uint64_t **)(v2 + 104), *(void *)(v2 + 112), *(void *)(v2 + 120));
}

uint64_t sub_20D8D5990(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_20D8CD904(a1, a2);
  }
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id MSCMSCompressedData.type.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___MSCMSCompressedData_type);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void MSCMSCompressedData.type.setter(void *a1)
{
}

uint64_t (*MSCMSCompressedData.type.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20D8D5B28()
{
  return 0;
}

uint64_t MSCMSCompressedData.dataContent.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___MSCMSCompressedData_dataContent;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  sub_20D8D5990(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t MSCMSCompressedData.dataContent.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR___MSCMSCompressedData_dataContent);
  swift_beginAccess();
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_20D8D3184(v6, v7);
}

uint64_t (*MSCMSCompressedData.dataContent.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MSCMSCompressedData.embeddedContent.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t MSCMSCompressedData.embeddedContent.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___MSCMSCompressedData_embeddedContent);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MSCMSCompressedData.embeddedContent.modify())()
{
  return j_j__swift_endAccess;
}

id MSCMSCompressedData.contentType.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void MSCMSCompressedData.contentType.setter(void *a1)
{
}

uint64_t (*MSCMSCompressedData.contentType.modify())()
{
  return j__swift_endAccess;
}

id MSCMSCompressedData.__allocating_init(dataContent:)(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return MSCMSCompressedData.init(dataContent:)(a1, a2);
}

id MSCMSCompressedData.init(dataContent:)(uint64_t a1, unint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = &v2[OBJC_IVAR___MSCMSCompressedData_dataContent];
  *(_OWORD *)&v2[OBJC_IVAR___MSCMSCompressedData_dataContent] = xmmword_20D8E21B0;
  unint64_t v7 = &v2[OBJC_IVAR___MSCMSCompressedData_embeddedContent];
  *(void *)&v2[OBJC_IVAR___MSCMSCompressedData_embeddedContent] = 0;
  swift_beginAccess();
  uint64_t v9 = *(void *)v6;
  unint64_t v8 = *((void *)v6 + 1);
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  uint64_t v10 = v2;
  sub_20D8CD904(a1, a2);
  sub_20D8D3184(v9, v8);
  swift_beginAccess();
  *(void *)unint64_t v7 = 0;
  swift_unknownObjectRelease();
  sub_20D8DF198();
  id v11 = objc_allocWithZone((Class)MSOID);
  id v12 = sub_20D8D1F7C();
  if (v3)
  {
    sub_20D8CD7B8(a1, a2);
    sub_20D8D3184(*(void *)v6, *((void *)v6 + 1));
    swift_unknownObjectRelease();
    id v15 = v10;

    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)&v10[OBJC_IVAR___MSCMSCompressedData_contentType] = v12;
    sub_20D8DF198();
    id v13 = objc_allocWithZone((Class)MSOID);
    *(void *)&v10[OBJC_IVAR___MSCMSCompressedData_type] = sub_20D8D1F7C();

    v16.receiver = v10;
    v16.super_class = ObjectType;
    id v15 = objc_msgSendSuper2(&v16, sel_init);
    sub_20D8CD7B8(a1, a2);
  }
  return v15;
}

objc_class *MSCMSCompressedData.__allocating_init(embeddedContent:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return MSCMSCompressedData.init(embeddedContent:)(a1);
}

objc_class *MSCMSCompressedData.init(embeddedContent:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v5 = &v1[OBJC_IVAR___MSCMSCompressedData_dataContent];
  *(_OWORD *)&v1[OBJC_IVAR___MSCMSCompressedData_dataContent] = xmmword_20D8E21B0;
  uint64_t v6 = &v1[OBJC_IVAR___MSCMSCompressedData_embeddedContent];
  *(void *)&v1[OBJC_IVAR___MSCMSCompressedData_embeddedContent] = 0;
  swift_beginAccess();
  uint64_t v7 = *(void *)v5;
  unint64_t v8 = *((void *)v5 + 1);
  *(_OWORD *)id v5 = xmmword_20D8E21B0;
  uint64_t v9 = v1;
  sub_20D8D3184(v7, v8);
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  id v10 = objc_msgSend(a1, sel_type);
  uint64_t v11 = OBJC_IVAR___MSCMSCompressedData_contentType;
  *(void *)&v9[OBJC_IVAR___MSCMSCompressedData_contentType] = v10;
  sub_20D8DF198();
  id v12 = objc_allocWithZone((Class)MSOID);
  id v13 = sub_20D8D1F7C();
  if (v2)
  {
    swift_unknownObjectRelease();
    sub_20D8D3184(*(void *)v5, *((void *)v5 + 1));
    swift_unknownObjectRelease();
    unint64_t v14 = *(void **)&v9[v11];

    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)&v9[OBJC_IVAR___MSCMSCompressedData_type] = v13;

    v16.receiver = v9;
    v16.super_class = ObjectType;
    ObjectType = (objc_class *)objc_msgSendSuper2(&v16, sel_init);
    swift_unknownObjectRelease();
  }
  return ObjectType;
}

char *MSCMSCompressedData.encodeSecurityObject()()
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  LODWORD(v24) = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  long long v25 = asn1_oid_id_alg_zlibCompress;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v2 = (void **)&v0[OBJC_IVAR___MSCMSCompressedData_contentType];
  swift_beginAccess();
  id v3 = *v2;
  sub_20D8DF198();
  id v4 = v3;
  id v5 = (void *)sub_20D8DF188();
  swift_bridgeObjectRelease();
  unsigned int v6 = objc_msgSend(v4, sel_isEqualToString_, v5);

  if (v6)
  {
    uint64_t v7 = &v0[OBJC_IVAR___MSCMSCompressedData_dataContent];
    swift_beginAccess();
    unint64_t v8 = *(void **)v7;
    unint64_t v9 = *((void *)v7 + 1);
    sub_20D8D5990((uint64_t)v8, v9);
  }
  else
  {
    id v10 = (void **)&v0[OBJC_IVAR___MSCMSCompressedData_embeddedContent];
    swift_beginAccess();
    uint64_t v11 = *v10;
    if (!*v10)
    {
LABEL_7:
      sub_20D8D2F08();
      swift_allocError();
      *(_OWORD *)uint64_t v15 = xmmword_20D8E22B0;
      *(unsigned char *)(v15 + 16) = 48;
LABEL_8:
      swift_willThrow();
      return v0;
    }
    id v22 = 0;
    id v12 = objc_msgSend(v11, sel_encodeMessageSecurityObject_, &v22);
    id v13 = v22;
    if (!v12)
    {
      id v17 = v13;
      sub_20D8DF0D8();

      goto LABEL_8;
    }
    unint64_t v8 = (void *)sub_20D8DF148();
    unint64_t v9 = v14;
  }
  if (v9 >> 60 == 15) {
    goto LABEL_7;
  }
  id v22 = v8;
  unint64_t v23 = v9;
  uint64_t v16 = 0;
  switch(v9 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v8), v8))
      {
        __break(1u);
LABEL_21:
        __break(1u);
      }
      uint64_t v16 = HIDWORD(v8) - (int)v8;
LABEL_15:
      sub_20D8CD904((uint64_t)v8, v9);
LABEL_16:
      sub_20D8D6D78((uint64_t *)&v22, v16, v0, &v24, (uint64_t *)&v21);
      sub_20D8D3184((uint64_t)v8, v9);
      if (!v1) {
        uint64_t v0 = v21;
      }
      sub_20D8CD7B8((uint64_t)v22, v23);
      break;
    case 2uLL:
      uint64_t v19 = v8[2];
      uint64_t v18 = v8[3];
      uint64_t v16 = v18 - v19;
      if (!__OFSUB__(v18, v19)) {
        goto LABEL_15;
      }
      goto LABEL_21;
    case 3uLL:
      goto LABEL_16;
    default:
      uint64_t v16 = BYTE6(v9);
      goto LABEL_16;
  }
  return v0;
}

void sub_20D8D68B4(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  v19[4] = *MEMORY[0x263EF8340];
  unint64_t v9 = (id *)(a2 + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  a3[4] = objc_msgSend(*v9, sel_Asn1OID);
  a3[5] = v10;
  a3[6] = a1;
  uint64_t v11 = length_CompressedData((uint64_t)a3);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF990]), sel_initWithLength_, v11);
  if (!v12)
  {
    sub_20D8D2F08();
    uint64_t v15 = swift_allocError();
    *(_OWORD *)uint64_t v17 = xmmword_20D8E22C0;
    *(unsigned char *)(v17 + 16) = 48;
    swift_willThrow();
    goto LABEL_8;
  }
  id v13 = v12;
  v19[0] = 0;
  if (encode_CompressedData((uint64_t)objc_msgSend(v13, sel_mutableBytes) + v11 - 1, v11, (uint64_t)a3, (uint64_t)v19))BOOL v14 = 0; {
  else
  }
    BOOL v14 = v19[0] == v11;
  if (!v14)
  {
    sub_20D8D2F08();
    uint64_t v15 = swift_allocError();
    *(_OWORD *)uint64_t v16 = xmmword_20D8E22B0;
    *(unsigned char *)(v16 + 16) = 48;
    swift_willThrow();

LABEL_8:
    *a4 = v15;
    return;
  }
  *a5 = sub_20D8DF148();
  a5[1] = v18;
}

objc_class *static MSCMSCompressedData.decodeSecurityObject(_:options:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_20D8D7124(a1, a2, a3);
}

id MSCMSCompressedData.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MSCMSCompressedData.init()()
{
}

id MSCMSCompressedData.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_20D8D6D78(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v6 = a1[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      uint64_t v28 = *a1;
      uint64_t v29 = v6 & 0x3FFFFFFFFFFFFFFFLL;
      id v11 = a3;
      sub_20D8D702C((int *)&v28, a2, v11, a4, a5);

      uint64_t v12 = v29 | 0x4000000000000000;
      *a1 = v28;
      a1[1] = v12;
      break;
    case 2uLL:
      uint64_t v28 = *a1;
      uint64_t v29 = v6 & 0x3FFFFFFFFFFFFFFFLL;
      sub_20D8DF0F8();
      uint64_t v13 = v29;
      uint64_t v25 = v28;
      uint64_t v14 = *(void *)(v28 + 16);
      uint64_t v15 = sub_20D8DF048();
      if (!v15)
      {
        __break(1u);
        JUMPOUT(0x20D8D701CLL);
      }
      uint64_t v16 = v15;
      uint64_t v17 = sub_20D8DF078();
      if (__OFSUB__(v14, v17)) {
        __break(1u);
      }
      uint64_t v18 = v16 + v14 - v17;
      sub_20D8DF068();
      *(void *)&long long v27 = a2;
      *((void *)&v27 + 1) = v18;
      sub_20D8D68B4((uint64_t)&v27, (uint64_t)a3, a4, &v26, a5);

      unint64_t v24 = v13 | 0x8000000000000000;
      *a1 = v25;
      goto LABEL_8;
    case 3uLL:
      *(void *)((char *)&v27 + 7) = 0;
      *(void *)&long long v27 = 0;
      uint64_t v28 = a2;
      uint64_t v29 = (uint64_t)&v27;
      sub_20D8D68B4((uint64_t)&v28, (uint64_t)a3, a4, &v26, a5);

      break;
    default:
      *(void *)&long long v27 = *a1;
      WORD4(v27) = v6;
      BYTE10(v27) = BYTE2(v6);
      BYTE11(v27) = BYTE3(v6);
      BYTE12(v27) = BYTE4(v6);
      BYTE13(v27) = BYTE5(v6);
      BYTE14(v27) = BYTE6(v6);
      uint64_t v28 = a2;
      uint64_t v29 = (uint64_t)&v27;
      sub_20D8D68B4((uint64_t)&v28, (uint64_t)a3, a4, &v26, a5);
      uint64_t v19 = v27;
      uint64_t v20 = DWORD2(v27);
      uint64_t v21 = BYTE12(v27);
      uint64_t v22 = BYTE13(v27);
      uint64_t v23 = BYTE14(v27);

      unint64_t v24 = v20 | (v21 << 32) | (v22 << 40) | (v23 << 48);
      *a1 = v19;
LABEL_8:
      a1[1] = v24;
      break;
  }
}

void sub_20D8D702C(int *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
  v16[2] = *MEMORY[0x263EF8340];
  sub_20D8DF108();
  uint64_t v10 = *a1;
  if (a1[1] < (int)v10)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v11 = sub_20D8DF048();
  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = v11;
  uint64_t v13 = sub_20D8DF078();
  if (__OFSUB__(v10, v13))
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }
  uint64_t v14 = v12 + v10 - v13;
  sub_20D8DF068();
  v16[0] = a2;
  v16[1] = v14;
  sub_20D8D68B4((uint64_t)v16, (uint64_t)a3, a4, &v15, a5);
}

objc_class *sub_20D8D7124(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v30 = 0;
  memset(v31, 0, sizeof(v31));
  unint64_t v6 = (void *)sub_20D8DF128();
  int v7 = nsheim_decode_CompressedData(v6);

  if (v7)
  {
    sub_20D8D2F08();
    swift_allocError();
    *(_OWORD *)uint64_t v8 = xmmword_20D8E22C0;
    *(unsigned char *)(v8 + 16) = 48;
    swift_willThrow();
LABEL_3:
    free_CompressedData();
    return v4;
  }
  id v10 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_initWithAsn1OID_error_, v31, 0);
  long long v29 = asn1_oid_id_alg_zlibCompress;
  id v11 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_initWithAsn1OID_error_, &v29, 0);
  if (!objc_msgSend(v10, sel_isEqual_, v11))
  {
    sub_20D8D2F08();
    swift_allocError();
    *(_OWORD *)uint64_t v17 = xmmword_20D8E22C0;
    *(unsigned char *)(v17 + 16) = 48;
    swift_willThrow();

    goto LABEL_3;
  }
  uint64_t v12 = (uint64_t *)*((void *)&v31[2] + 1);
  long long v28 = *(_OWORD *)((char *)&v31[1] + 8);
  uint64_t result = (objc_class *)objc_msgSend(objc_allocWithZone((Class)MSOID), sel_initWithAsn1OID_error_, &v28, 0);
  if (v12)
  {
    uint64_t v13 = result;
    if (!*v12)
    {
      uint64_t v14 = 0;
      unint64_t v16 = 0xC000000000000000;
LABEL_12:
      sub_20D8DF198();
      uint64_t v18 = (void *)sub_20D8DF188();
      swift_bridgeObjectRelease();
      unsigned __int8 v19 = -[objc_class isEqualToString:](v13, sel_isEqualToString_, v18, v28, v29);

      if (v19)
      {
        id v20 = objc_allocWithZone((Class)type metadata accessor for MSCMSCompressedData());
        uint64_t v21 = (objc_class *)MSCMSCompressedData.init(dataContent:)(v14, v16);
        if (!v3)
        {
          id v4 = v21;

LABEL_22:
          free_CompressedData();
          return v4;
        }
      }
      else
      {
        uint64_t v22 = (void *)sub_20D8DF128();
        id v23 = decodeEmbeddedCMSContent(v13, v22, a3, 0);

        if (v23)
        {
          id v24 = objc_allocWithZone((Class)type metadata accessor for MSCMSCompressedData());
          uint64_t v25 = (void *)swift_unknownObjectRetain();
          uint64_t v26 = MSCMSCompressedData.init(embeddedContent:)(v25);
          if (!v3)
          {
            id v4 = v26;
            sub_20D8CD7B8(v14, v16);

            swift_unknownObjectRelease();
            goto LABEL_22;
          }
          sub_20D8CD7B8(v14, v16);

          swift_unknownObjectRelease();
LABEL_20:

          goto LABEL_3;
        }
        sub_20D8D2F08();
        swift_allocError();
        *(_OWORD *)uint64_t v27 = xmmword_20D8E22C0;
        *(unsigned char *)(v27 + 16) = 48;
        swift_willThrow();
        sub_20D8CD7B8(v14, v16);
      }

      goto LABEL_20;
    }
    uint64_t result = (objc_class *)v12[1];
    if (result)
    {
      uint64_t v14 = sub_20D8D30D0(result, *v12);
      unint64_t v16 = v15;
      goto LABEL_12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for MSCMSCompressedData()
{
  return self;
}

uint64_t method lookup function for MSCMSCompressedData(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MSCMSCompressedData);
}

uint64_t dispatch thunk of MSCMSCompressedData.__allocating_init(dataContent:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of MSCMSCompressedData.__allocating_init(embeddedContent:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t static MSCMSSignedData.isImplementedInSwift()()
{
  return 1;
}

id sub_20D8D7544(uint64_t a1)
{
  return sub_20D8D760C(a1, MEMORY[0x263F16DD0], 16);
}

id sub_20D8D75A8(uint64_t a1)
{
  return sub_20D8D760C(a1, MEMORY[0x263F16DD8], 24);
}

id sub_20D8D760C(uint64_t a1, uint64_t (*a2)(uint64_t, id *), char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  v10[0] = 0;
  unsigned int v4 = a2(a1, v10);
  id v5 = v10[0];
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v10[0] == 0;
  }
  if (v6)
  {
    uint64_t v7 = v4;
    sub_20D8D2F08();
    swift_allocError();
    *(void *)uint64_t v8 = v7;
    *(void *)(v8 + 8) = 0;
    *(unsigned char *)(v8 + 16) = a3;
    swift_willThrow();
  }
  return v5;
}

id sub_20D8D76D4()
{
  id v1 = (void **)(v0 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  objc_super v2 = *v1;

  return v2;
}

void sub_20D8D772C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  unsigned int v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_20D8D7780())()
{
  return j__swift_endAccess;
}

id MSCMSEnvelopedDataInternal.__allocating_init(envelopedData:)(uint64_t a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id MSCMSEnvelopedDataInternal.init(envelopedData:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

NSData __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MSCMSEnvelopedDataInternal.encodeMessageSecurityObject()()
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v41[1] = 0;
  int v42 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  objc_super v2 = (id *)&v0[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData];
  swift_beginAccess();
  id v3 = objc_msgSend(*v2, sel_getRecipients);
  sub_20D8D58FC(0, &qword_267719D18);
  unint64_t v4 = sub_20D8DF1F8();

  if (!(v4 >> 62))
  {
    if (*(uint64_t *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1) {
      goto LABEL_3;
    }
LABEL_34:
    swift_bridgeObjectRelease();
    sub_20D8D2F08();
    swift_allocError();
    *(_OWORD *)uint64_t v36 = xmmword_20D8E21E0;
    *(unsigned char *)(v36 + 16) = 48;
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_20D8DF2D8();
  swift_bridgeObjectRelease();
  if (v35 < 1) {
    goto LABEL_34;
  }
LABEL_3:
  id v5 = objc_msgSend(*v2, sel_version);
  unsigned int v6 = objc_msgSend(v5, sel_unsignedIntValue);

  LODWORD(v41[0]) = v6;
  long long v40 = xmmword_20D8E21C0;
  unint64_t v7 = v4 & 0xC000000000000001;
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v8 = (id)MEMORY[0x21055F860](0, v4);
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
    }
    id v8 = *(id *)(v4 + 32);
  }
  unint64_t v9 = v8;
  id v10 = objc_msgSend(v8, sel_originatorIdentity);

  if (!v10) {
    goto LABEL_13;
  }
  if (v7) {
    id v11 = (id)MEMORY[0x21055F860](0, v4);
  }
  else {
    id v11 = *(id *)(v4 + 32);
  }
  uint64_t v12 = v11;
  id v13 = sub_20D8D7544((uint64_t)v10);
  if (!v1)
  {
    uint64_t v14 = v13;
    objc_msgSend(v12, sel_setOriginator_, v13);

LABEL_13:
    if (v7) {
      id v15 = (id)MEMORY[0x21055F860](0, v4);
    }
    else {
      id v15 = *(id *)(v4 + 32);
    }
    unint64_t v16 = v15;
    id v17 = objc_msgSend(v15, sel_originator);

    if (!v17)
    {
      uint64_t v20 = 0;
      id v38 = 0;
      uint64_t v39 = 0;
      goto LABEL_29;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_267719CF0);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_20D8E21D0;
    if (v7) {
      id v19 = (id)MEMORY[0x21055F860](0, v4);
    }
    else {
      id v19 = *(id *)(v4 + 32);
    }
    uint64_t v21 = v19;
    id v22 = objc_msgSend(v19, sel_originator);

    if (!v22)
    {
      __break(1u);
      goto LABEL_42;
    }
    id v23 = self;
    type metadata accessor for SecCertificate();
    *(void *)(v18 + 56) = v24;
    *(void *)(v18 + 32) = v22;
    uint64_t v25 = (void *)sub_20D8DF1E8();
    swift_bridgeObjectRelease();
    id v38 = 0;
    id v26 = objc_msgSend(v23, sel_encodeOriginatorInfoCertificates_error_, v25, &v38);

    id v27 = v38;
    if (v26)
    {
      uint64_t v28 = sub_20D8DF148();
      unint64_t v30 = v29;

      *(void *)&long long v40 = v28;
      *((void *)&v40 + 1) = v30;
      id v38 = 0;
      uint64_t v39 = 0;
      uint64_t v20 = 0;
      switch(v30 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v28), v28)) {
            goto LABEL_39;
          }
          uint64_t v20 = HIDWORD(v28) - (int)v28;
          break;
        case 2uLL:
          uint64_t v33 = *(void *)(v28 + 16);
          uint64_t v32 = *(void *)(v28 + 24);
          uint64_t v20 = v32 - v33;
          if (!__OFSUB__(v32, v33)) {
            break;
          }
          goto LABEL_40;
        case 3uLL:
          break;
        default:
          uint64_t v20 = BYTE6(v30);
          break;
      }
LABEL_29:
      uint64_t v34 = v0;
      uint64_t v0 = (char *)sub_20D8D9C84((uint64_t *)&v40, (uint64_t *)&v38, v20, v41, v34, v4);

      swift_bridgeObjectRelease();
      if (v1 || v0)
      {
        sub_20D8CD7B8(v40, *((unint64_t *)&v40 + 1));
        return (NSData)v0;
      }
LABEL_42:
      __break(1u);
      JUMPOUT(0x20D8D7D80);
    }
    unint64_t v31 = v27;
    swift_bridgeObjectRelease();
    sub_20D8DF0D8();

LABEL_35:
    swift_willThrow();
    return (NSData)v0;
  }

  swift_bridgeObjectRelease();
  return (NSData)v0;
}

uint64_t sub_20D8D7D90@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v9 = v7;
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a3 <= 0) {
    a1 = 0;
  }
  a2[1] = a1;
  id v15 = (void **)&a4[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData];
  swift_beginAccess();
  unint64_t v16 = *v15;
  v30[0] = 0;
  id v17 = objc_msgSend(v16, sel_encryptContent_, v30);
  id v18 = v30[0];
  if (v17)
  {
    uint64_t v19 = sub_20D8DF148();
    unint64_t v21 = v20;

    uint64_t v31 = v19;
    unint64_t v32 = v21;
    v30[1] = 0;
    unint64_t v22 = 0;
    switch(v21 >> 62)
    {
      case 1uLL:
        LODWORD(v22) = HIDWORD(v19) - v19;
        if (__OFSUB__(HIDWORD(v19), v19))
        {
          __break(1u);
LABEL_16:
          __break(1u);
        }
        unint64_t v22 = (int)v22;
LABEL_11:
        v30[0] = (id)v22;
        uint64_t v28 = a4;
        swift_bridgeObjectRetain();
        uint64_t v29 = sub_20D8D96D0(&v31, (uint64_t)v30, a2, v28, a5);

        swift_bridgeObjectRelease();
        if (v7)
        {
          uint64_t result = sub_20D8CD7B8(v31, v32);
          goto LABEL_13;
        }
        *a7 = v29;
        uint64_t result = sub_20D8CD7B8(v31, v32);
        break;
      case 2uLL:
        uint64_t v26 = *(void *)(v19 + 16);
        uint64_t v25 = *(void *)(v19 + 24);
        BOOL v27 = __OFSUB__(v25, v26);
        unint64_t v22 = v25 - v26;
        if (!v27) {
          goto LABEL_11;
        }
        goto LABEL_16;
      case 3uLL:
        goto LABEL_11;
      default:
        unint64_t v22 = BYTE6(v21);
        goto LABEL_11;
    }
  }
  else
  {
    id v23 = v18;
    uint64_t v9 = sub_20D8DF0D8();

    uint64_t result = swift_willThrow();
LABEL_13:
    *a6 = v9;
  }
  return result;
}

uint64_t sub_20D8D7F80@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X2>, unint64_t a4@<X3>, void *a5@<X4>, void *a6@<X8>)
{
  id v36 = a3;
  a2[9] = a1;
  uint64_t v9 = (id *)&a3[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData];
  swift_beginAccess();
  id v10 = objc_msgSend(*v9, sel_contentType);
  id v11 = objc_msgSend(v10, sel_Asn1OID);
  uint64_t v13 = v12;

  a2[4] = v11;
  a2[5] = v13;
  id v14 = objc_msgSend(*v9, sel_encryptionAlgorithm);
  id v15 = objc_msgSend(v14, sel_algorithm);

  id v16 = objc_msgSend(v15, sel_Asn1OID);
  uint64_t v18 = v17;

  a2[6] = v16;
  a2[7] = v18;
  id v19 = objc_msgSend(*v9, sel_encryptionAlgorithm);
  id v20 = objc_msgSend(v19, sel_parameters);

  if (v20)
  {
    uint64_t v21 = sub_20D8DF148();
    unint64_t v23 = v22;

    uint64_t v34 = v21;
    unint64_t v35 = v23;
    uint64_t v24 = 0;
    switch(v23 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v21), v21))
        {
          __break(1u);
LABEL_12:
          __break(1u);
          JUMPOUT(0x20D8D81ACLL);
        }
        uint64_t v24 = HIDWORD(v21) - (int)v21;
LABEL_8:
        swift_bridgeObjectRetain();
        id v30 = v36;
        uint64_t v26 = sub_20D8D9268(&v34, v24, a2, a4, v30);
        swift_bridgeObjectRelease();

        uint64_t v25 = v34;
        unint64_t v27 = v35;
        if (!v6) {
          goto LABEL_10;
        }
        uint64_t result = sub_20D8D3184(v34, v35);
        *a5 = v6;
        break;
      case 2uLL:
        uint64_t v29 = *(void *)(v21 + 16);
        uint64_t v28 = *(void *)(v21 + 24);
        uint64_t v24 = v28 - v29;
        if (!__OFSUB__(v28, v29)) {
          goto LABEL_8;
        }
        goto LABEL_12;
      case 3uLL:
        goto LABEL_8;
      default:
        uint64_t v24 = BYTE6(v23);
        goto LABEL_8;
    }
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    unint64_t v27 = 0xF000000000000000;
LABEL_10:
    *a6 = v26;
    return sub_20D8D3184(v25, v27);
  }
  return result;
}

uint64_t sub_20D8D81BC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  id v9 = v6;
  uint64_t v10 = a3;
  id v11 = a2;
  v52[4] = *MEMORY[0x263EF8340];
  a2[8] = a1;
  if (a3 >> 62) {
    goto LABEL_39;
  }
  unint64_t v13 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  if (HIDWORD(v13)) {
    goto LABEL_41;
  }
  id v41 = (void *)a6;
  unint64_t v42 = (unint64_t)v11;
  uint64_t v43 = (uint64_t)v9;
  long long v44 = (void *)a5;
  v11[4] = v13;
  if (v13)
  {
    type metadata accessor for RecipientInfo(0);
    uint64_t v14 = sub_20D8DF228();
    uint64_t v7 = (char *)v14;
    *(void *)(v14 + 16) = v13;
    uint64_t v15 = 32;
    do
    {
      uint64_t v16 = v14 + v15;
      *(_DWORD *)uint64_t v16 = 0;
      *(_OWORD *)(v16 + 88) = 0uLL;
      *(_OWORD *)(v16 + 72) = 0uLL;
      *(void *)(v16 + 104) = 0;
      *(_OWORD *)(v16 + 56) = 0uLL;
      *(_OWORD *)(v16 + 40) = 0uLL;
      *(_OWORD *)(v16 + 24) = 0uLL;
      v15 += 112;
      *(_OWORD *)(v16 + 8) = 0uLL;
      --v13;
    }
    while (v13);
  }
  else
  {
    uint64_t v7 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v47 = *((void *)v7 + 2);
  if (!v47)
  {
LABEL_28:
    uint64_t v50 = v7;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_42;
    }
    goto LABEL_29;
  }
  uint64_t v48 = (id *)(a4 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  unint64_t v49 = v10 & 0xC000000000000001;
  swift_beginAccess();
  unint64_t v17 = 0;
  uint64_t v46 = v10 & 0xFFFFFFFFFFFFFF8;
  uint64_t v18 = v7 + 32;
  uint64_t v19 = v10;
  while (2)
  {
    if (v49)
    {
      id v20 = (id)MEMORY[0x21055F860](v17, v10);
    }
    else
    {
      if (v17 >= *(void *)(v46 + 16)) {
        goto LABEL_36;
      }
      id v20 = *(id *)(v10 + 8 * v17 + 32);
    }
    uint64_t v21 = v20;
    uint64_t v10 = v17 + 1;
    id v22 = objc_msgSend(*v48, sel_encryptionKey);
    uint64_t v23 = sub_20D8DF148();
    id v11 = v24;

    uint64_t v25 = (void *)sub_20D8DF128();
    sub_20D8CD7B8(v23, (unint64_t)v11);
    id v9 = objc_msgSend(v21, sel_encryptBulkKey_, v25);

    a6 = sub_20D8DF148();
    a5 = v26;

    switch(a5 >> 62)
    {
      case 1uLL:
        LODWORD(v27) = HIDWORD(a6) - a6;
        if (__OFSUB__(HIDWORD(a6), a6)) {
          goto LABEL_37;
        }
        uint64_t v27 = (int)v27;
        goto LABEL_20;
      case 2uLL:
        uint64_t v29 = *(void *)(a6 + 16);
        uint64_t v28 = *(void *)(a6 + 24);
        BOOL v30 = __OFSUB__(v28, v29);
        uint64_t v27 = v28 - v29;
        if (v30) {
          goto LABEL_38;
        }
        goto LABEL_20;
      case 3uLL:
        goto LABEL_31;
      default:
        uint64_t v27 = BYTE6(a5);
LABEL_20:
        if (v27 < 1)
        {
LABEL_31:
          swift_bridgeObjectRelease();
          sub_20D8D2F08();
          uint64_t v36 = swift_allocError();
          *(_OWORD *)uint64_t v38 = xmmword_20D8E21E0;
          *(unsigned char *)(v38 + 16) = 48;
          swift_willThrow();
          uint64_t result = sub_20D8CD7B8(a6, a5);
LABEL_32:
          *long long v44 = v36;
          return result;
        }
        if (v17 < *((void *)v7 + 2))
        {
          if (v49) {
            id v31 = (id)MEMORY[0x21055F860](v17, v19);
          }
          else {
            id v31 = *(id *)(v19 + 8 * v17 + 32);
          }
          unint64_t v32 = v31;
          id v9 = (id)sub_20D8DF128();
          v51[0] = 0;
          id v11 = objc_msgSend(v32, sel_encodeRecipientInfo_recipientInfo_error_, v9, v18, v51);

          if (!v11)
          {
            id v39 = v51[0];
            uint64_t v40 = sub_20D8DF0D8();

            swift_willThrow();
            *long long v44 = v40;
            sub_20D8CD7B8(a6, a5);
            return swift_bridgeObjectRelease();
          }
          id v33 = v51[0];
          sub_20D8CD7B8(a6, a5);
          v18 += 112;
          unint64_t v17 = v10;
          BOOL v34 = v47 == v10;
          uint64_t v10 = v19;
          if (v34) {
            goto LABEL_28;
          }
          continue;
        }
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        swift_bridgeObjectRetain();
        unint64_t v13 = sub_20D8DF2D8();
        swift_bridgeObjectRelease();
        if ((v13 & 0x8000000000000000) == 0) {
          goto LABEL_3;
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        uint64_t v7 = sub_20D8D8F48((uint64_t)v7);
LABEL_29:
        unint64_t v35 = (void *)*((void *)v7 + 2);
        v51[0] = v7 + 32;
        v51[1] = v35;
        sub_20D8D8648(v51, v42, a4, &v50, v10, (uint64_t)v52);
        uint64_t v36 = v43;
        if (v43)
        {
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          goto LABEL_32;
        }
        swift_bridgeObjectRelease();
        *id v41 = v52[0];
        return swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_20D8D8648@<X0>(void *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, char **a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7 = v6;
  uint64_t v60 = a5;
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v59 = sub_20D8DF0E8();
  id v56 = *(void (***)(char **, uint64_t))(v59 - 8);
  MEMORY[0x270FA5388](v59, v13);
  uint64_t v15 = (char **)((char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)(a2 + 24) = *a1;
  id v65 = 0;
  uint64_t v16 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  id v17 = objc_msgSend(*v16, sel_unprotectedAttributes);
  uint64_t v54 = (void *)a6;
  if (!v17)
  {
    int v64 = 0;
    a6 = MEMORY[0x263F8EE78];
    LODWORD(v20) = 1;
    goto LABEL_18;
  }
  uint64_t v18 = v17;
  id v57 = (id)a3;
  unint64_t v19 = (unint64_t)objc_msgSend(v17, sel_count);

  if ((v19 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_60;
  }
  if (HIDWORD(v19))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  int v64 = v19;
  if (v19)
  {
    type metadata accessor for Attribute(0);
    a6 = sub_20D8DF228();
    *(void *)(a6 + 16) = v19;
    LODWORD(v20) = a6 + 32;
    unint64_t v21 = v19;
    uint64_t v22 = a6 + 32;
    do
    {
      *(void *)(v22 + 24) = 0;
      *(void *)uint64_t v22 = 0;
      *(void *)(v22 + 8) = 0;
      *(_DWORD *)(v22 + 16) = 0;
      v22 += 32;
      --v21;
    }
    while (v21);
    if (v19)
    {
      id v23 = objc_msgSend(*v16, sel_unprotectedAttributes);
      if (v23)
      {
        unint64_t v55 = a2;
        int v58 = v6;
        id v24 = v23;
        sub_20D8DF258();
        id v53 = v24;

        sub_20D8DA150();
        sub_20D8DF278();
        if ((void)v68)
        {
          a2 = -1;
          a3 = MEMORY[0x263F8EE58] + 8;
          do
          {
            sub_20D8D5938(&v66, v63);
            sub_20D8DA1A8((uint64_t)v63, (uint64_t)v62);
            sub_20D8D58FC(0, &qword_267719D10);
            swift_dynamicCast();
            id v25 = v61;
            objc_msgSend(v61, sel_generateAttributeStruct);

            if (++a2 >= *(void *)(a6 + 16)) {
              goto LABEL_57;
            }
            copy_Attribute();
            free_Attribute();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v63);
            sub_20D8DF278();
            LODWORD(v20) = v20 + 32;
          }
          while ((void)v68);
        }
        v56[1](v15, v59);

        LODWORD(v20) = 0;
        uint64_t v7 = v58;
        a2 = v55;
      }
      else
      {
        LODWORD(v20) = 0;
      }
      goto LABEL_17;
    }
  }
  else
  {
    a6 = MEMORY[0x263F8EE78];
  }
  LODWORD(v20) = 1;
LABEL_17:
  a3 = (unint64_t)v57;
LABEL_18:
  uint64_t v15 = v7;
  swift_bridgeObjectRetain();
  unint64_t v26 = (char *)a6;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_58;
  }
  while (1)
  {
    id v65 = v26 + 32;
    uint64_t v27 = &v64;
    if (v20) {
      uint64_t v27 = 0;
    }
    *(void *)(a2 + 80) = v27;
    uint64_t v28 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
    swift_beginAccess();
    if (objc_msgSend(*v28, sel_legacyASN1Encoding))
    {
      uint64_t v29 = *(void *)(a2 + 8);
      int v30 = *(_DWORD *)(a2 + 16);
      LODWORD(v66) = *(_DWORD *)a2;
      *((void *)&v66 + 1) = v29;
      int v67 = v30;
      long long v68 = *(_OWORD *)(a2 + 24);
      long long v69 = *(_OWORD *)(a2 + 40);
      long long v70 = *(_OWORD *)(a2 + 56);
      long long v71 = *(_OWORD *)(a2 + 72);
      uint64_t v31 = length_SecCMS_EnvelopedData((uint64_t)&v66);
    }
    else
    {
      uint64_t v31 = length_EnvelopedData(a2);
    }
    unint64_t v32 = (char **)v31;
    id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF990]), sel_initWithLength_, v31);
    if (!v33)
    {
      sub_20D8D2F08();
      swift_allocError();
      *(_OWORD *)uint64_t v40 = xmmword_20D8E21E0;
      *(unsigned char *)(v40 + 16) = 48;
      swift_willThrow();
      goto LABEL_53;
    }
    uint64_t v59 = (uint64_t)v26;
    int v58 = v15;
    id v56 = (void (**)(char **, uint64_t))v33;
    uint64_t v15 = v32;
    BOOL v34 = (char *)v32 + (void)objc_msgSend(v56, sel_mutableBytes) - 1;
    id v61 = 0;
    unint64_t v35 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
    swift_beginAccess();
    unsigned int v36 = objc_msgSend(*v35, sel_legacyASN1Encoding);
    id v57 = v15;
    if (v36)
    {
      uint64_t v37 = *(void *)(a2 + 8);
      int v38 = *(_DWORD *)(a2 + 16);
      LODWORD(v66) = *(_DWORD *)a2;
      *((void *)&v66 + 1) = v37;
      int v67 = v38;
      long long v68 = *(_OWORD *)(a2 + 24);
      long long v69 = *(_OWORD *)(a2 + 40);
      long long v70 = *(_OWORD *)(a2 + 56);
      long long v71 = *(_OWORD *)(a2 + 72);
      int v39 = encode_SecCMS_EnvelopedData((uint64_t)v34, (uint64_t)v15, (uint64_t)&v66, (uint64_t)&v61);
    }
    else
    {
      int v39 = encode_EnvelopedData((uint64_t)v34, (uint64_t)v15, a2, (uint64_t)&v61);
    }
    LODWORD(v55) = v39;
    uint64_t v41 = v60;
    unint64_t v42 = *a4;
    a2 = *((void *)*a4 + 2);
    if (!a2) {
      break;
    }
    uint64_t v16 = (id *)(v60 & 0xC000000000000001);
    if ((v60 & 0xC000000000000001) != 0 || a2 <= *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      unint64_t v20 = 0;
      a3 = 32;
      uint64_t v15 = &selRef_digestAlgorithmWithSignatureAlgorithm_error_;
      while (1)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a4 = v42;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          unint64_t v42 = sub_20D8D8F48((uint64_t)v42);
          *a4 = v42;
        }
        if (v20 >= *((void *)v42 + 2)) {
          break;
        }
        if (v16) {
          id v43 = (id)MEMORY[0x21055F860](v20, v41);
        }
        else {
          id v43 = *(id *)(v41 + 8 * v20 + 32);
        }
        long long v44 = v43;
        ++v20;
        objc_msgSend(v43, sel_freeRecipientInfo_, &v42[a3]);

        unint64_t v42 = *a4;
        a3 += 112;
        uint64_t v41 = v60;
        if (a2 == v20) {
          goto LABEL_40;
        }
      }
      __break(1u);
      goto LABEL_56;
    }
LABEL_61:
    __break(1u);
LABEL_62:
    a6 = (uint64_t)sub_20D8D8F5C(a6);
LABEL_42:
    a3 = 0;
    LODWORD(v20) = a6 + 32;
    while (a3 < *(void *)(a6 + 16))
    {
      ++a3;
      free_Attribute();
      LODWORD(v20) = v20 + 32;
      if (v16 == (id *)a3) {
        goto LABEL_47;
      }
    }
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    unint64_t v26 = sub_20D8D8F5C(a6);
  }
LABEL_40:
  uint64_t v16 = *(id **)(a6 + 16);
  if (v16)
  {
    char v46 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = v58;
    if (v46) {
      goto LABEL_42;
    }
    goto LABEL_62;
  }
  uint64_t v15 = v58;
LABEL_47:
  uint64_t v47 = v56;
  if (v55 || v61 != v57)
  {
    sub_20D8D2F08();
    swift_allocError();
    *(_OWORD *)uint64_t v49 = xmmword_20D8E21E0;
    *(unsigned char *)(v49 + 16) = 48;
    swift_willThrow();
  }
  else
  {
    uint64_t v48 = v56;
    if (v15)
    {
    }
    else
    {
      uint64_t v50 = v48;

      void *v54 = v50;
    }
  }
LABEL_53:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id MSCMSEnvelopedDataInternal.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MSCMSEnvelopedDataInternal.init()()
{
}

id MSCMSEnvelopedDataInternal.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_20D8D8F48(uint64_t a1)
{
  return sub_20D8D8F70(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_20D8D8F5C(uint64_t a1)
{
  return sub_20D8D908C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_20D8D8F70(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267719E88);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 112);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[112 * v8]) {
      memmove(v12, v13, 112 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 112 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_20D8D908C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267719E80);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 32 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_20D8D9188(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, unint64_t a6)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v12 = sub_20D8DF048();
  if (!v12) {
LABEL_6:
  }
    __break(1u);
  uint64_t v13 = v12;
  uint64_t v14 = sub_20D8DF078();
  if (__OFSUB__(a1, v14))
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v15 = v13 + a1 - v14;
  sub_20D8DF068();
  v19[0] = a3;
  v19[1] = v15;
  uint64_t result = sub_20D8D81BC((uint64_t)v19, a4, a5, a6, (unint64_t)&v17, (uint64_t)&v18);
  if (!v6) {
    return v18;
  }
  return result;
}

void *sub_20D8D9268(uint64_t *a1, uint64_t a2, void *a3, unint64_t a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v7 = *a1;
  unint64_t v6 = a1[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      uint64_t v19 = v6 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_20D8E21C0;
      swift_bridgeObjectRetain_n();
      id v20 = a5;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v22 = v7 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_17;
      }
      id v37 = v20;
      if (v22 < (int)v7) {
        goto LABEL_26;
      }
      if (sub_20D8DF048() && __OFSUB__((int)v7, sub_20D8DF078())) {
        goto LABEL_27;
      }
      sub_20D8DF088();
      swift_allocObject();
      uint64_t v33 = sub_20D8DF028();
      swift_release();
      uint64_t v19 = v33;
      uint64_t v22 = v7 >> 32;
      id v20 = v37;
LABEL_17:
      if (v22 < (int)v7)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
      }
      swift_bridgeObjectRetain();
      id v34 = v20;
      uint64_t v35 = sub_20D8D9188((int)v7, v19, a2, a3, a4, (unint64_t)v34);
      if (v5)
      {
        swift_bridgeObjectRelease_n();

        unint64_t v18 = v19 | 0x4000000000000000;
        goto LABEL_20;
      }
      a3 = (void *)v35;
      swift_bridgeObjectRelease_n();

      unint64_t v32 = v19 | 0x4000000000000000;
      goto LABEL_23;
    case 2uLL:
      uint64_t v42 = *a1;
      unint64_t v43 = v6 & 0x3FFFFFFFFFFFFFFFLL;
      swift_bridgeObjectRetain_n();
      id v23 = a5;
      sub_20D8DF0F8();
      uint64_t v7 = v42;
      uint64_t v24 = *(void *)(v42 + 16);
      swift_bridgeObjectRetain();
      id v25 = v23;
      uint64_t v26 = sub_20D8D9188(v24, v43, a2, a3, a4, (unint64_t)v25);
      if (v5)
      {
        swift_bridgeObjectRelease_n();

        unint64_t v18 = v43 | 0x8000000000000000;
LABEL_20:
        *a1 = v7;
        goto LABEL_21;
      }
      a3 = (void *)v26;
      swift_bridgeObjectRelease_n();

      unint64_t v32 = v43 | 0x8000000000000000;
LABEL_23:
      *a1 = v7;
      a1[1] = v32;
      break;
    case 3uLL:
      memset(v40, 0, 15);
      uint64_t v42 = a2;
      unint64_t v43 = (unint64_t)v40;
      swift_bridgeObjectRetain();
      id v27 = a5;
      sub_20D8D81BC((uint64_t)&v42, a3, a4, (unint64_t)v27, (unint64_t)&v39, (uint64_t)&v41);

      swift_bridgeObjectRelease();
      if (!v5) {
        return v41;
      }
      return a3;
    default:
      v40[0] = *a1;
      LOWORD(v40[1]) = v6;
      BYTE2(v40[1]) = BYTE2(v6);
      BYTE3(v40[1]) = BYTE3(v6);
      BYTE4(v40[1]) = BYTE4(v6);
      BYTE5(v40[1]) = BYTE5(v6);
      BYTE6(v40[1]) = BYTE6(v6);
      uint64_t v42 = a2;
      unint64_t v43 = (unint64_t)v40;
      swift_bridgeObjectRetain();
      id v13 = a5;
      sub_20D8D81BC((uint64_t)&v42, a3, a4, (unint64_t)v13, (unint64_t)&v39, (uint64_t)&v41);
      if (v5)
      {
        a3 = (void *)v40[0];
        uint64_t v14 = LODWORD(v40[1]);
        uint64_t v15 = BYTE4(v40[1]);
        uint64_t v16 = BYTE5(v40[1]);
        uint64_t v17 = BYTE6(v40[1]);

        swift_bridgeObjectRelease();
        unint64_t v18 = v14 | (v15 << 32) | (v16 << 40) | (v17 << 48);
        *a1 = (uint64_t)a3;
LABEL_21:
        a1[1] = v18;
      }
      else
      {
        a3 = v41;
        uint64_t v38 = v40[0];
        uint64_t v28 = LODWORD(v40[1]);
        uint64_t v29 = BYTE4(v40[1]);
        uint64_t v30 = BYTE5(v40[1]);
        uint64_t v31 = BYTE6(v40[1]);

        swift_bridgeObjectRelease();
        *a1 = v38;
        a1[1] = v28 | (v29 << 32) | (v30 << 40) | (v31 << 48);
      }
      break;
  }
  return a3;
}

uint64_t sub_20D8D96D0(uint64_t *a1, uint64_t a2, void *a3, void *a4, unint64_t a5)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v7 = *a1;
  unint64_t v6 = a1[1];
  uint64_t v10 = a2;
  switch(v6 >> 62)
  {
    case 1uLL:
      uint64_t v18 = v6 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_20D8E21C0;
      id v19 = a4;
      swift_bridgeObjectRetain_n();
      id v20 = v19;
      uint64_t v21 = v7 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_19;
      }
      id v44 = v20;
      if (v21 < (int)v7) {
        goto LABEL_32;
      }
      if (sub_20D8DF048() && __OFSUB__((int)v7, sub_20D8DF078())) {
        goto LABEL_33;
      }
      sub_20D8DF088();
      swift_allocObject();
      uint64_t v37 = sub_20D8DF028();
      swift_release();
      uint64_t v18 = v37;
      id v20 = v44;
LABEL_19:
      if (v21 < (int)v7) {
        goto LABEL_30;
      }
      uint64_t v38 = (char *)v20;
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_20D8DF048();
      if (!v39) {
        goto LABEL_35;
      }
      uint64_t v40 = v39;
      uint64_t v41 = sub_20D8DF078();
      if (__OFSUB__((int)v7, v41)) {
        goto LABEL_31;
      }
      uint64_t v42 = v40 + (int)v7 - v41;
      sub_20D8DF068();
      *(void *)(v10 + 8) = v42;
      sub_20D8D7F80(v10, a3, v38, a5, &v49, &v50);
      if (v5)
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();

        unint64_t v17 = v18 | 0x4000000000000000;
        goto LABEL_24;
      }

      swift_bridgeObjectRelease();
      uint64_t v10 = v50;
      swift_bridgeObjectRelease_n();

      unint64_t v36 = v18 | 0x4000000000000000;
      goto LABEL_27;
    case 2uLL:
      *(void *)&long long v50 = *a1;
      *((void *)&v50 + 1) = v6 & 0x3FFFFFFFFFFFFFFFLL;
      id v22 = a4;
      swift_bridgeObjectRetain_n();
      id v23 = v22;
      sub_20D8DF0F8();
      uint64_t v24 = *((void *)&v50 + 1);
      uint64_t v25 = *(void *)(v7 + 16);
      uint64_t v26 = (char *)v23;
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_20D8DF048();
      if (!v27)
      {
        __break(1u);
LABEL_35:
        __break(1u);
        JUMPOUT(0x20D8D9BB0);
      }
      uint64_t v28 = v27;
      uint64_t v29 = sub_20D8DF078();
      if (__OFSUB__(v25, v29))
      {
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
      }
      uint64_t v30 = v28 + v25 - v29;
      sub_20D8DF068();
      *(void *)(v10 + 8) = v30;
      sub_20D8D7F80(v10, a3, v26, a5, &v48, &v49);
      if (v5)
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        unint64_t v17 = v24 | 0x8000000000000000;
LABEL_24:
        *a1 = v7;
        goto LABEL_25;
      }

      swift_bridgeObjectRelease_n();
      uint64_t v10 = v49;
      swift_bridgeObjectRelease();
      unint64_t v36 = v24 | 0x8000000000000000;
LABEL_27:
      *a1 = v7;
      a1[1] = v36;
      break;
    case 3uLL:
      *(void *)((char *)&v50 + 7) = 0;
      *(void *)&long long v50 = 0;
      *(void *)(a2 + 8) = &v50;
      uint64_t v31 = a4;
      swift_bridgeObjectRetain();
      sub_20D8D7F80(v10, a3, v31, a5, &v48, &v49);
      swift_bridgeObjectRelease();

      if (!v5) {
        return v49;
      }
      return v10;
    default:
      *(void *)&long long v50 = *a1;
      WORD4(v50) = v6;
      BYTE10(v50) = BYTE2(v6);
      BYTE11(v50) = BYTE3(v6);
      BYTE12(v50) = BYTE4(v6);
      BYTE13(v50) = BYTE5(v6);
      BYTE14(v50) = BYTE6(v6);
      *(void *)(a2 + 8) = &v50;
      uint64_t v12 = a4;
      swift_bridgeObjectRetain();
      sub_20D8D7F80(v10, a3, v12, a5, &v48, &v49);
      if (v5)
      {
        uint64_t v10 = v50;
        uint64_t v13 = DWORD2(v50);
        uint64_t v14 = BYTE12(v50);
        uint64_t v15 = BYTE13(v50);
        uint64_t v16 = BYTE14(v50);
        swift_bridgeObjectRelease();

        unint64_t v17 = v13 | (v14 << 32) | (v15 << 40) | (v16 << 48);
        *a1 = v10;
LABEL_25:
        a1[1] = v17;
      }
      else
      {
        uint64_t v10 = v49;
        uint64_t v47 = v50;
        uint64_t v32 = DWORD2(v50);
        uint64_t v33 = BYTE12(v50);
        uint64_t v34 = BYTE13(v50);
        uint64_t v35 = BYTE14(v50);
        swift_bridgeObjectRelease();

        *a1 = v47;
        a1[1] = v32 | (v33 << 32) | (v34 << 40) | (v35 << 48);
      }
      break;
  }
  return v10;
}

uint64_t sub_20D8D9BC0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, void *a5, char *a6, unint64_t a7)
{
  uint64_t result = sub_20D8DF048();
  if (!result) {
    goto LABEL_6;
  }
  uint64_t v15 = result;
  uint64_t result = sub_20D8DF078();
  if (__OFSUB__(a1, result))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    return result;
  }
  uint64_t v16 = v15 + a1 - result;
  sub_20D8DF068();
  *a3 = a4;
  a3[1] = v16;
  uint64_t result = sub_20D8D7D90((uint64_t)a3, a5, a4, a6, a7, &v17, &v18);
  if (!v7) {
    return v18;
  }
  return result;
}

uint64_t sub_20D8D9C84(uint64_t *a1, uint64_t *a2, uint64_t a3, void *a4, void *a5, unint64_t a6)
{
  v46[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *a1;
  unint64_t v7 = a1[1];
  id v9 = v6;
  switch(v7 >> 62)
  {
    case 1uLL:
      uint64_t v20 = v7 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_20D8E21C0;
      id v21 = a5;
      swift_bridgeObjectRetain_n();
      id v22 = v21;
      uint64_t v23 = v8 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_18;
      }
      id v40 = v22;
      if (v23 < (int)v8) {
        goto LABEL_22;
      }
      if (sub_20D8DF048() && __OFSUB__((int)v8, sub_20D8DF078())) {
        goto LABEL_23;
      }
      sub_20D8DF088();
      swift_allocObject();
      uint64_t v37 = sub_20D8DF028();
      swift_release();
      uint64_t v20 = v37;
      id v22 = v40;
LABEL_18:
      if (v23 < (int)v8)
      {
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
      }
      uint64_t v38 = (char *)v22;
      swift_bridgeObjectRetain();
      id v9 = (id)sub_20D8D9BC0((int)v8, v20, a2, a3, a4, v38, a6);

      swift_bridgeObjectRelease_n();
      *a1 = v8;
      a1[1] = v20 | 0x4000000000000000;
      return (uint64_t)v9;
    case 2uLL:
      *(void *)&long long v45 = *a1;
      *((void *)&v45 + 1) = v7 & 0x3FFFFFFFFFFFFFFFLL;
      id v24 = a5;
      swift_bridgeObjectRetain_n();
      uint64_t v25 = v6;
      id v9 = v24;
      sub_20D8DF0F8();
      uint64_t v26 = *((void *)&v45 + 1);
      uint64_t v43 = v45;
      uint64_t v27 = *(void *)(v45 + 16);
      uint64_t v28 = a3;
      uint64_t v29 = (char *)v9;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_20D8D9BC0(v27, *((uint64_t *)&v45 + 1), a2, v28, a4, v29, a6);
      if (v25)
      {

        swift_bridgeObjectRelease_n();
        *a1 = v45;
        a1[1] = v26 | 0x8000000000000000;
        return (uint64_t)v9;
      }
      id v9 = (id)v30;

      swift_bridgeObjectRelease_n();
      unint64_t v36 = *((void *)&v45 + 1) | 0x8000000000000000;
      goto LABEL_15;
    case 3uLL:
      *(void *)((char *)&v45 + 7) = 0;
      *(void *)&long long v45 = 0;
      *a2 = a3;
      a2[1] = (uint64_t)&v45;
      uint64_t v31 = a5;
      swift_bridgeObjectRetain();
      sub_20D8D7D90((uint64_t)a2, a4, a3, v31, a6, &v44, v46);
      swift_bridgeObjectRelease();

      if (!v6) {
        return v46[0];
      }
      return (uint64_t)v9;
    default:
      *(void *)&long long v45 = *a1;
      WORD4(v45) = v7;
      BYTE10(v45) = BYTE2(v7);
      BYTE11(v45) = BYTE3(v7);
      BYTE12(v45) = BYTE4(v7);
      BYTE13(v45) = BYTE5(v7);
      BYTE14(v45) = BYTE6(v7);
      *a2 = a3;
      a2[1] = (uint64_t)&v45;
      uint64_t v15 = a5;
      swift_bridgeObjectRetain();
      sub_20D8D7D90((uint64_t)a2, a4, a3, v15, a6, &v44, v46);
      if (v6)
      {
        id v9 = (id)v45;
        uint64_t v16 = DWORD2(v45);
        uint64_t v17 = BYTE12(v45);
        uint64_t v18 = BYTE13(v45);
        uint64_t v19 = BYTE14(v45);
        swift_bridgeObjectRelease();

        *a1 = (uint64_t)v9;
        a1[1] = v16 | (v17 << 32) | (v18 << 40) | (v19 << 48);
      }
      else
      {
        id v9 = (id)v46[0];
        uint64_t v43 = v45;
        uint64_t v32 = DWORD2(v45);
        uint64_t v33 = BYTE12(v45);
        uint64_t v34 = BYTE13(v45);
        uint64_t v35 = BYTE14(v45);
        swift_bridgeObjectRelease();

        unint64_t v36 = v32 | (v33 << 32) | (v34 << 40) | (v35 << 48);
LABEL_15:
        *a1 = v43;
        a1[1] = v36;
      }
      return (uint64_t)v9;
  }
}

uint64_t type metadata accessor for MSCMSEnvelopedDataInternal()
{
  return self;
}

uint64_t method lookup function for MSCMSEnvelopedDataInternal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MSCMSEnvelopedDataInternal);
}

uint64_t dispatch thunk of MSCMSEnvelopedDataInternal.__allocating_init(envelopedData:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void type metadata accessor for RecipientInfo(uint64_t a1)
{
}

unint64_t sub_20D8DA150()
{
  unint64_t result = qword_267719E78;
  if (!qword_267719E78)
  {
    sub_20D8DF0E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267719E78);
  }
  return result;
}

uint64_t sub_20D8DA1A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for Attribute(uint64_t a1)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_20D8DA278(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_20D8DA298(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

__n128 __swift_memcpy112_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t sub_20D8DA2E8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 112)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_20D8DA308(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 112) = v3;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for Attribute_value(uint64_t a1)
{
}

void type metadata accessor for heim_oid(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_20D8DA3E4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 104)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_20D8DA404(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 104) = v3;
  return result;
}

void type metadata accessor for RecipientInfo.__Unnamed_union_u(uint64_t a1)
{
}

void type metadata accessor for RecipientInfo_enum(uint64_t a1)
{
}

uint64_t sub_20D8DA470(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_20D8DA490(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for heim_base_data(uint64_t a1)
{
}

void sub_20D8DA4CC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_20D8DA520(uint64_t a1)
{
  unint64_t v2 = sub_20D8DC804();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_20D8DA55C(uint64_t a1)
{
  unint64_t v2 = sub_20D8DC804();

  return MEMORY[0x270EF2668](a1, v2);
}

unint64_t MSCMSContentError.errorDescription.getter()
{
  unint64_t result = 0xD000000000000014;
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
      sub_20D8DF328();
      sub_20D8DF1C8();
      swift_bridgeObjectRelease();
      unint64_t result = 0x72726520314E5341;
      break;
    case 2:
      unint64_t result = 0x2064696C61766E49;
      break;
    case 3:
      if (*(_OWORD *)v0 == 0) {
        unint64_t result = 0x746E6F63206C694ELL;
      }
      else {
        unint64_t result = 0xD000000000000010;
      }
      break;
    default:
      return result;
  }
  return result;
}

unint64_t static MSCMSContentError.errorDomain.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t MSCMSContentError.errorCode.getter()
{
  uint64_t result = 1;
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
      uint64_t result = 2;
      break;
    case 2:
      uint64_t result = 4;
      break;
    case 3:
      if (*(_OWORD *)v0 == 0) {
        uint64_t result = 3;
      }
      else {
        uint64_t result = 5;
      }
      break;
    default:
      return result;
  }
  return result;
}

unint64_t MSCMSContentError.errorUserInfo.getter()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  int v3 = *(unsigned __int8 *)(v0 + 16);
  unint64_t v4 = sub_20D8DAAE8(MEMORY[0x263F8EE78]);
  unint64_t v29 = v4;
  *(void *)&long long v31 = v1;
  *((void *)&v31 + 1) = v2;
  char v32 = v3;
  unint64_t v5 = MSCMSContentError.errorDescription.getter();
  if (v6)
  {
    unint64_t v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = sub_20D8DF198();
    uint64_t v11 = v10;
    unint64_t v33 = MEMORY[0x263F8D310];
    *(void *)&long long v31 = v7;
    *((void *)&v31 + 1) = v8;
    sub_20D8D5938(&v31, v30);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20D8DBEDC(v30, v9, v11, isUniquelyReferenced_nonNull_native);
    unint64_t v29 = v4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  switch(v3)
  {
    case 2:
      unint64_t v33 = MEMORY[0x263F8E8F8];
      LODWORD(v31) = v1;
      sub_20D8D5938(&v31, v30);
      char v13 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v28 = v29;
      uint64_t v15 = 0x5664696C61766E49;
      uint64_t v14 = 0xEE006E6F69737265;
      goto LABEL_8;
    case 1:
      uint64_t v16 = sub_20D8DF198();
      uint64_t v18 = v17;
      id v19 = objc_allocWithZone(MEMORY[0x263F087E8]);
      uint64_t v20 = (void *)sub_20D8DF188();
      id v21 = objc_msgSend(v19, sel_initWithDomain_code_userInfo_, v20, (int)v1, 0);

      unint64_t v22 = sub_20D8DC030();
      unint64_t v33 = v22;
      *(void *)&long long v31 = v21;
      sub_20D8D5938(&v31, v30);
      char v23 = swift_isUniquelyReferenced_nonNull_native();
      sub_20D8DBEDC(v30, v16, v18, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v1 & 0x80000000) != 0) {
        __break(1u);
      }
      *(void *)&long long v31 = 0;
      asn1ErrorToNSError(v1, &v31);
      id v24 = (void *)v31;
      if ((void)v31)
      {
        unint64_t v33 = v22;
        sub_20D8D5938(&v31, v30);
        id v25 = v24;
        char v26 = swift_isUniquelyReferenced_nonNull_native();
        sub_20D8DBEDC(v30, 0x6F727245314E5341, 0xE900000000000072, v26);
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_20D8DB900(0x6F727245314E5341, 0xE900000000000072, &v31);
        sub_20D8DC070((uint64_t)&v31);
      }

      break;
    case 0:
      unint64_t v33 = MEMORY[0x263F8D310];
      *(void *)&long long v31 = v1;
      *((void *)&v31 + 1) = v2;
      sub_20D8D5938(&v31, v30);
      swift_bridgeObjectRetain();
      char v13 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v28 = v29;
      uint64_t v14 = 0x800000020D8E6250;
      uint64_t v15 = 0xD000000000000015;
LABEL_8:
      sub_20D8DBEDC(v30, v15, v14, v13);
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      break;
  }
  return v29;
}

unint64_t sub_20D8DAAE8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267719F00);
  uint64_t v2 = sub_20D8DF308();
  int v3 = (void *)v2;
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
    sub_20D8DCB90(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_20D8DB888(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_20D8D5938(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_20D8DAC14()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_20D8DAC30()
{
  uint64_t result = 1;
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
      uint64_t result = 2;
      break;
    case 2:
      uint64_t result = 4;
      break;
    case 3:
      if (*(_OWORD *)v0 == 0) {
        uint64_t result = 3;
      }
      else {
        uint64_t result = 5;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_20D8DAC98(uint64_t a1)
{
  unint64_t v2 = sub_20D8DC7B0();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_20D8DACD4(uint64_t a1)
{
  unint64_t v2 = sub_20D8DC7B0();

  return MEMORY[0x270EF2668](a1, v2);
}

unint64_t MSCMSContentTypeError.errorDescription.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 16) >> 6;
  unint64_t v2 = 0xD000000000000010;
  if (v1 != 1) {
    unint64_t v2 = 0xD000000000000014;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0xD000000000000014;
  }
}

unint64_t static MSCMSContentTypeError.errorDomain.getter()
{
  return 0xD00000000000002FLL;
}

unint64_t MSCMSContentTypeError.errorCode.getter()
{
  return ((unint64_t)*(unsigned __int8 *)(v0 + 16) >> 6) + 1;
}

unint64_t MSCMSContentTypeError.errorUserInfo.getter()
{
  uint64_t v2 = *(void *)v0;
  uint64_t v1 = *(void *)(v0 + 8);
  unsigned int v3 = *(unsigned __int8 *)(v0 + 16);
  unint64_t v4 = sub_20D8DAAE8(MEMORY[0x263F8EE78]);
  if (v3 >> 6)
  {
    if (v3 >> 6 == 1)
    {
      unint64_t v5 = 0xD000000000000010;
      unint64_t v6 = 0x800000020D8E6290;
      goto LABEL_7;
    }
    uint64_t v7 = "TimeStampToken error";
  }
  else
  {
    uint64_t v7 = "Unknown content type";
  }
  unint64_t v6 = (unint64_t)(v7 - 32) | 0x8000000000000000;
  unint64_t v5 = 0xD000000000000014;
LABEL_7:
  uint64_t v8 = sub_20D8DF198();
  uint64_t v10 = v9;
  uint64_t v11 = (ValueMetadata *)MEMORY[0x263F8D310];
  char v23 = (ValueMetadata *)MEMORY[0x263F8D310];
  *(void *)&long long v21 = v5;
  *((void *)&v21 + 1) = v6;
  sub_20D8D5938(&v21, v20);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_20D8DBEDC(v20, v8, v10, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3 > 0x3F)
  {
    uint64_t v15 = sub_20D8DF198();
    uint64_t v17 = v16;
    char v23 = &type metadata for MSCMSContentError;
    *(void *)&long long v21 = v2;
    *((void *)&v21 + 1) = v1;
    char v22 = v3 & 0x3F;
    sub_20D8D5938(&v21, v20);
    sub_20D8DC0D0(v2, v1, v3);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    sub_20D8DBEDC(v20, v15, v17, v18);
    unint64_t v14 = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    char v23 = v11;
    *(void *)&long long v21 = v2;
    *((void *)&v21 + 1) = v1;
    sub_20D8D5938(&v21, v20);
    swift_bridgeObjectRetain();
    char v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_20D8DBEDC(v20, 0xD000000000000015, 0x800000020D8E6300, v13);
    unint64_t v14 = v4;
  }
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_20D8DAFA0()
{
  return 0xD00000000000002FLL;
}

unint64_t sub_20D8DAFBC()
{
  return ((unint64_t)*(unsigned __int8 *)(v0 + 16) >> 6) + 1;
}

uint64_t sub_20D8DAFD0(uint64_t a1)
{
  unint64_t v2 = sub_20D8DC75C();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_20D8DB00C(uint64_t a1)
{
  unint64_t v2 = sub_20D8DC75C();

  return MEMORY[0x270EF2668](a1, v2);
}

unint64_t MSCMSError.errorDescription.getter()
{
  unint64_t v1 = 0xD000000000000010;
  uint64_t v2 = *v0;
  unsigned int v3 = *((unsigned __int8 *)v0 + 16);
  switch((v3 >> 3) & 7)
  {
    case 1u:
      sub_20D8DF2A8();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD000000000000016;
      goto LABEL_6;
    case 2u:
      sub_20D8DF2A8();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD00000000000001CLL;
      goto LABEL_6;
    case 3u:
      sub_20D8DF2A8();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD000000000000014;
      goto LABEL_6;
    case 4u:
    case 5u:
      return v1;
    case 6u:
      uint64_t v5 = v0[1];
      if (v3 == 48 && (v5 | v2) == 0) {
        return 0xD000000000000011;
      }
      if (v3 == 48 && v2 == 1 && !v5) {
        return 0xD000000000000014;
      }
      if (v3 == 48 && v2 == 2 && !v5) {
        return 0xD000000000000022;
      }
      if (v3 == 48 && v2 == 3 && !v5) {
        return 0xD00000000000001FLL;
      }
      if (v3 == 48 && v2 == 4 && !v5) {
        return 0xD00000000000002BLL;
      }
      if (v3 == 48 && v2 == 5 && !v5) {
        return 0xD000000000000011;
      }
      if (v3 == 48 && v2 == 6 && !v5) {
        return 0xD000000000000017;
      }
      if (v3 == 48 && v2 == 7 && !v5) {
        return 0xD000000000000013;
      }
      if (v3 == 48 && v2 == 8 && !v5 || v3 == 48 && v2 == 9 && !v5) {
        return 0xD000000000000020;
      }
      BOOL v8 = v3 == 48;
      BOOL v10 = v2 == 10 && v5 == 0;
      if (v8 && v10) {
        return 0xD00000000000001FLL;
      }
      return v1;
    default:
      sub_20D8DF2A8();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD000000000000013;
LABEL_6:
      unint64_t v11 = v4;
      sub_20D8DF328();
      sub_20D8DF1C8();
      swift_bridgeObjectRelease();
      return v11;
  }
}

unint64_t static MSCMSError.errorDomain.getter()
{
  return 0xD000000000000019;
}

uint64_t MSCMSError.errorCode.getter()
{
  uint64_t v1 = *v0;
  unsigned int v2 = *((unsigned __int8 *)v0 + 16);
  uint64_t result = -6;
  switch((v2 >> 3) & 7)
  {
    case 1u:
      uint64_t result = -7;
      break;
    case 2u:
      uint64_t result = -15;
      break;
    case 3u:
      uint64_t result = -16;
      break;
    case 4u:
      uint64_t result = 1;
      break;
    case 5u:
      uint64_t result = 2;
      break;
    case 6u:
      uint64_t v4 = v0[1];
      if (v2 == 48 && (v4 | v1) == 0)
      {
        uint64_t result = -1;
      }
      else if (v2 == 48 && v1 == 1 && v4 == 0)
      {
        uint64_t result = -2;
      }
      else if (v2 == 48 && v1 == 2 && !v4)
      {
        uint64_t result = -3;
      }
      else if (v2 == 48 && v1 == 3 && !v4)
      {
        uint64_t result = -4;
      }
      else if (v2 == 48 && v1 == 4 && !v4)
      {
        uint64_t result = -5;
      }
      else if (v2 == 48 && v1 == 5 && !v4)
      {
        uint64_t result = -8;
      }
      else if (v2 == 48 && v1 == 6 && !v4)
      {
        uint64_t result = -9;
      }
      else if (v2 == 48 && v1 == 7 && !v4)
      {
        uint64_t result = -10;
      }
      else if (v2 == 48 && v1 == 8 && !v4)
      {
        uint64_t result = -11;
      }
      else if (v2 == 48 && v1 == 9 && !v4)
      {
        uint64_t result = -12;
      }
      else
      {
        if (v4) {
          BOOL v8 = 0;
        }
        else {
          BOOL v8 = v1 == 10;
        }
        if (v8 && v2 == 48) {
          uint64_t result = -13;
        }
        else {
          uint64_t result = -14;
        }
      }
      break;
    default:
      return result;
  }
  return result;
}

unint64_t MSCMSError.errorUserInfo.getter()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  unint64_t v4 = sub_20D8DAAE8(MEMORY[0x263F8EE78]);
  *(void *)&long long v19 = v1;
  *((void *)&v19 + 1) = v2;
  char v20 = v3;
  unint64_t v5 = MSCMSError.errorDescription.getter();
  if (v6)
  {
    unint64_t v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = sub_20D8DF198();
    uint64_t v11 = v10;
    long long v21 = (ValueMetadata *)MEMORY[0x263F8D310];
    *(void *)&long long v19 = v7;
    *((void *)&v19 + 1) = v8;
    sub_20D8D5938(&v19, v18);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20D8DBEDC(v18, v9, v11, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if ((v3 & 0x30) == 0x20)
  {
    uint64_t v13 = sub_20D8DF198();
    uint64_t v15 = v14;
    long long v21 = &type metadata for MSCMSContentTypeError;
    *(void *)&long long v19 = v1;
    *((void *)&v19 + 1) = v2;
    char v20 = v3 & 0xC7;
    sub_20D8D5938(&v19, v18);
    sub_20D8DC110(v1, v2, v3);
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    sub_20D8DBEDC(v18, v13, v15, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t sub_20D8DB6C4()
{
  return 0xD000000000000019;
}

uint64_t sub_20D8DB6E0()
{
  uint64_t v1 = *v0;
  unsigned int v2 = *((unsigned __int8 *)v0 + 16);
  uint64_t result = -6;
  switch((v2 >> 3) & 7)
  {
    case 1u:
      uint64_t result = -7;
      break;
    case 2u:
      uint64_t result = -15;
      break;
    case 3u:
      uint64_t result = -16;
      break;
    case 4u:
      uint64_t result = 1;
      break;
    case 5u:
      uint64_t result = 2;
      break;
    case 6u:
      uint64_t v4 = v0[1];
      if (v2 == 48 && (v4 | v1) == 0)
      {
        uint64_t result = -1;
      }
      else if (v2 == 48 && v1 == 1 && v4 == 0)
      {
        uint64_t result = -2;
      }
      else if (v2 == 48 && v1 == 2 && !v4)
      {
        uint64_t result = -3;
      }
      else if (v2 == 48 && v1 == 3 && !v4)
      {
        uint64_t result = -4;
      }
      else if (v2 == 48 && v1 == 4 && !v4)
      {
        uint64_t result = -5;
      }
      else if (v2 == 48 && v1 == 5 && !v4)
      {
        uint64_t result = -8;
      }
      else if (v2 == 48 && v1 == 6 && !v4)
      {
        uint64_t result = -9;
      }
      else if (v2 == 48 && v1 == 7 && !v4)
      {
        uint64_t result = -10;
      }
      else if (v2 == 48 && v1 == 8 && !v4)
      {
        uint64_t result = -11;
      }
      else if (v2 == 48 && v1 == 9 && !v4)
      {
        uint64_t result = -12;
      }
      else
      {
        if (v4) {
          BOOL v8 = 0;
        }
        else {
          BOOL v8 = v1 == 10;
        }
        if (v8 && v2 == 48) {
          uint64_t result = -13;
        }
        else {
          uint64_t result = -14;
        }
      }
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_20D8DB888(uint64_t a1, uint64_t a2)
{
  sub_20D8DF398();
  sub_20D8DF1B8();
  uint64_t v4 = sub_20D8DF3A8();

  return sub_20D8DC8C4(a1, a2, v4);
}

double sub_20D8DB900@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_20D8DB888(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_20D8DC9A8();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_20D8D5938((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_20D8DBD04(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_20D8DBA04(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267719F00);
  uint64_t v6 = sub_20D8DF2F8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              char v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      long long v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      id v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_20D8D5938(v24, v35);
      }
      else
      {
        sub_20D8DA1A8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_20D8DF398();
      sub_20D8DF1B8();
      uint64_t result = sub_20D8DF3A8();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_20D8D5938(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

unint64_t sub_20D8DBD04(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_20D8DF298();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_20D8DF398();
        swift_bridgeObjectRetain();
        sub_20D8DF1B8();
        uint64_t v10 = sub_20D8DF3A8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            _OWORD *v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            _OWORD *v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_20D8DBEDC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_20D8DB888(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_20D8DC9A8();
      goto LABEL_7;
    }
    sub_20D8DBA04(v15, a4 & 1);
    unint64_t v21 = sub_20D8DB888(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_20D8DF348();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_20D8D5938(a1, v19);
  }
LABEL_13:
  sub_20D8DC858(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

unint64_t sub_20D8DC030()
{
  unint64_t result = qword_267719EC8;
  if (!qword_267719EC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267719EC8);
  }
  return result;
}

uint64_t sub_20D8DC070(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267719ED0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D8DC0D0(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  int v3 = a3 >> 6;
  if (v3 == 2 || v3 == 1) {
    return sub_20D8DC0FC(result, a2, a3 & 0x3F);
  }
  if (!(a3 >> 6)) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_20D8DC0FC(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_20D8DC110(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 0x30) == 0x20) {
    return sub_20D8DC0D0(result, a2, a3 & 0xC7);
  }
  return result;
}

unint64_t sub_20D8DC12C()
{
  unint64_t result = qword_267719ED8;
  if (!qword_267719ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267719ED8);
  }
  return result;
}

unint64_t sub_20D8DC184()
{
  unint64_t result = qword_267719EE0;
  if (!qword_267719EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267719EE0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSContentError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_20D8DC4FC(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_20D8DC0FC);
}

uint64_t destroy for MSCMSContentError(uint64_t a1)
{
  return sub_20D8DC204(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_20D8DC204(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *assignWithCopy for MSCMSContentError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_20D8DC578(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_20D8DC0FC, (void (*)(uint64_t, uint64_t, uint64_t))sub_20D8DC204);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for MSCMSContentError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_20D8DC5FC(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_20D8DC204);
}

uint64_t getEnumTagSinglePayload for MSCMSContentError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MSCMSContentError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_20D8DC2FC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_20D8DC318(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MSCMSContentError()
{
  return &type metadata for MSCMSContentError;
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSContentTypeError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_20D8DC4FC(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_20D8DC0D0);
}

uint64_t destroy for MSCMSContentTypeError(uint64_t a1)
{
  return sub_20D8DC368(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_20D8DC368(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  int v3 = a3 >> 6;
  if (v3 == 2 || v3 == 1) {
    return sub_20D8DC204(result, a2, a3 & 0x3F);
  }
  if (!(a3 >> 6)) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *assignWithCopy for MSCMSContentTypeError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_20D8DC578(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_20D8DC0D0, (void (*)(uint64_t, uint64_t, uint64_t))sub_20D8DC368);
}

uint64_t *assignWithTake for MSCMSContentTypeError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_20D8DC5FC(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_20D8DC368);
}

uint64_t getEnumTagSinglePayload for MSCMSContentTypeError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3E && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 62);
  }
  unsigned int v3 = (*(unsigned char *)(a1 + 16) & 0x3C | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0x3F;
  if (v3 >= 0x3D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MSCMSContentTypeError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3D)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 62;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3E) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3E) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_20D8DC47C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_20D8DC488(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_20D8DC498(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = *(unsigned char *)(result + 16) & 3 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for MSCMSContentTypeError()
{
  return &type metadata for MSCMSContentTypeError;
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_20D8DC4FC(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_20D8DC110);
}

uint64_t destroy for MSCMSError(uint64_t a1)
{
  return sub_20D8DC4E4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_20D8DC4E4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 0x30) == 0x20) {
    return sub_20D8DC368(result, a2, a3 & 0xC7);
  }
  return result;
}

uint64_t sub_20D8DC4FC(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for MSCMSError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_20D8DC578(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_20D8DC110, (void (*)(uint64_t, uint64_t, uint64_t))sub_20D8DC4E4);
}

uint64_t *sub_20D8DC578(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  uint64_t v12 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for MSCMSError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_20D8DC5FC(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_20D8DC4E4);
}

uint64_t *sub_20D8DC5FC(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5 = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MSCMSError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xA && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 10);
  }
  unsigned int v3 = ((2 * *(unsigned __int8 *)(a1 + 16)) & 8 | (*(unsigned __int8 *)(a1 + 16) >> 3) & 7) ^ 0xF;
  if (v3 >= 9) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MSCMSError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 9)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 10;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xA) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xA) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = 4 * ((((-a2 & 8) != 0) - 2 * a2) & 0xF);
    }
  }
  return result;
}

uint64_t sub_20D8DC6F0(uint64_t a1)
{
  unsigned int v1 = (*(unsigned __int8 *)(a1 + 16) >> 3) & 7;
  if (v1 <= 5) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 6);
  }
}

uint64_t sub_20D8DC70C(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0xC7u;
  return result;
}

uint64_t sub_20D8DC71C(uint64_t result, unsigned int a2)
{
  if (a2 < 6)
  {
    *(unsigned char *)(result + 16) = *(unsigned char *)(result + 16) & 0xC3 | (8 * (a2 & 7));
  }
  else
  {
    *(void *)__n128 result = a2 - 6;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 48;
  }
  return result;
}

ValueMetadata *type metadata accessor for MSCMSError()
{
  return &type metadata for MSCMSError;
}

unint64_t sub_20D8DC75C()
{
  unint64_t result = qword_267719EE8;
  if (!qword_267719EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267719EE8);
  }
  return result;
}

unint64_t sub_20D8DC7B0()
{
  unint64_t result = qword_267719EF0;
  if (!qword_267719EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267719EF0);
  }
  return result;
}

unint64_t sub_20D8DC804()
{
  unint64_t result = qword_267719EF8;
  if (!qword_267719EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267719EF8);
  }
  return result;
}

_OWORD *sub_20D8DC858(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  unint64_t result = sub_20D8D5938(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_20D8DC8C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_20D8DF338() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_20D8DF338() & 1) == 0);
    }
  }
  return v6;
}

void *sub_20D8DC9A8()
{
  unsigned int v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267719F00);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_20D8DF2E8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_28:
    *unsigned int v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_20D8DA1A8(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_20D8D5938(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    unsigned int v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_20D8DCB90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267719F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id MSCMSTimestampAttributeInternal.attributeType.getter()
{
  unsigned int v1 = (void **)(v0 + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void MSCMSTimestampAttributeInternal.attributeType.setter(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
}

uint64_t (*MSCMSTimestampAttributeInternal.attributeType.modify())()
{
  return j_j__swift_endAccess;
}

__n128 sub_20D8DCDAC@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
  swift_beginAccess();
  long long v4 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(a1 + 112) = v4;
  *(void *)(a1 + 128) = *(void *)(v3 + 128);
  long long v5 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  long long v6 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = *(__n128 *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

__n128 sub_20D8DCE1C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
  swift_beginAccess();
  long long v4 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v3 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v3 + 112) = v4;
  *(void *)(v3 + 128) = *(void *)(a1 + 128);
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 48) = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 80) = v6;
  __n128 result = *(__n128 *)(a1 + 16);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)a1;
  *(__n128 *)(v3 + 16) = result;
  return result;
}

uint64_t (*sub_20D8DCE8C())()
{
  return j_j__swift_endAccess;
}

void *sub_20D8DCEE8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_20D8DCF38(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
  swift_beginAccess();
  long long v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_20D8DCF8C())()
{
  return j__swift_endAccess;
}

id MSCMSTimestampAttributeInternal.__deallocating_deinit()
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_beginAccess();
  free_TSTInfo();
  swift_endAccess();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void MSCMSTimestampAttributeInternal.__allocating_init(attribute:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  MSCMSTimestampAttributeInternal.init(attribute:)(a1);
}

void MSCMSTimestampAttributeInternal.init(attribute:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  long long v5 = (void **)&v1[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData];
  *(void *)&v1[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData] = 0;
  long long v6 = v1;
  id v7 = objc_msgSend(a1, sel_attributeType);
  sub_20D8DF198();
  uint64_t v8 = (void *)sub_20D8DF188();
  swift_bridgeObjectRelease();
  unsigned int v9 = objc_msgSend(v7, sel_isEqualToString_, v8);

  if (!v9)
  {
    sub_20D8D2F08();
    swift_allocError();
    *(void *)uint64_t v19 = 0;
    *(void *)(v19 + 8) = 0;
    *(unsigned char *)(v19 + 16) = 48;
    swift_willThrow();
LABEL_9:

    unint64_t v21 = *v5;
    swift_deallocPartialClassInstance();
    return;
  }
  id v10 = objc_msgSend(a1, sel_attributeType);
  uint64_t v11 = OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType;
  *(void *)&v6[OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType] = v10;
  id v12 = objc_msgSend(a1, sel_attributeValues);
  uint64_t v13 = sub_20D8DF1F8();

  uint64_t v14 = *(void *)(v13 + 16);
  swift_bridgeObjectRelease();
  if (v14 != 1)
  {
    sub_20D8D2F08();
    swift_allocError();
    *(void *)uint64_t v20 = 0;
    *(void *)(v20 + 8) = 0;
    *(unsigned char *)(v20 + 16) = 48;
    swift_willThrow();

    goto LABEL_8;
  }
  id v15 = objc_msgSend(a1, sel_attributeValues);
  uint64_t v16 = (void *)sub_20D8DF1F8();

  if (v16[2])
  {
    uint64_t v17 = v16[4];
    unint64_t v18 = v16[5];
    sub_20D8CD904(v17, v18);
    swift_bridgeObjectRelease();
    sub_20D8DE30C((uint64_t)v31);
    if (v2)
    {

      sub_20D8CD7B8(v17, v18);
LABEL_8:
      a1 = *(void **)&v6[v11];
      goto LABEL_9;
    }
    sub_20D8CD7B8(v17, v18);
    sub_20D8DE834((uint64_t)&v33, (uint64_t)v34);
    swift_beginAccess();
    int64_t v22 = *v5;
    sub_20D8DE834((uint64_t)v34, (uint64_t)v5);

    unint64_t v23 = &v6[OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo];
    *(_OWORD *)unint64_t v23 = v31[0];
    long long v24 = v31[4];
    long long v26 = v31[1];
    long long v25 = v31[2];
    *((_OWORD *)v23 + 3) = v31[3];
    *((_OWORD *)v23 + 4) = v24;
    *((_OWORD *)v23 + 1) = v26;
    *((_OWORD *)v23 + 2) = v25;
    long long v27 = v31[6];
    long long v28 = v31[7];
    long long v29 = v31[5];
    *((void *)v23 + 16) = v32;
    *((_OWORD *)v23 + 6) = v27;
    *((_OWORD *)v23 + 7) = v28;
    *((_OWORD *)v23 + 5) = v29;

    v30.receiver = v6;
    v30.super_class = ObjectType;
    objc_msgSendSuper2(&v30, sel_init);
  }
  else
  {
    __break(1u);
  }
}

__n128 sub_20D8DD478@<Q0>(uint64_t a1@<X8>)
{
  sub_20D8DE30C((uint64_t)v7);
  if (!v1)
  {
    long long v4 = v7[7];
    *(_OWORD *)(a1 + 96) = v7[6];
    *(_OWORD *)(a1 + 112) = v4;
    *(_OWORD *)(a1 + 128) = v7[8];
    long long v5 = v7[3];
    *(_OWORD *)(a1 + 32) = v7[2];
    *(_OWORD *)(a1 + 48) = v5;
    long long v6 = v7[5];
    *(_OWORD *)(a1 + 64) = v7[4];
    *(_OWORD *)(a1 + 80) = v6;
    __n128 result = (__n128)v7[1];
    *(_OWORD *)a1 = v7[0];
    *(__n128 *)(a1 + 16) = result;
  }
  return result;
}

uint64_t MSCMSTimestampAttributeInternal.__allocating_init(timestampToken:)(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return MSCMSTimestampAttributeInternal.init(timestampToken:)(a1, a2);
}

uint64_t MSCMSTimestampAttributeInternal.init(timestampToken:)(uint64_t a1, unint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  long long v6 = (void **)&v2[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData];
  *(void *)&v2[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData] = 0;
  sub_20D8DF198();
  objc_allocWithZone((Class)MSOID);
  id v7 = v2;
  id v8 = sub_20D8D1F7C();
  if (v3)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    *(void *)&v7[OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType] = v8;
    sub_20D8DE30C((uint64_t)v20);
    sub_20D8DE834((uint64_t)&v22, (uint64_t)v23);
    swift_beginAccess();
    unsigned int v9 = *v6;
    sub_20D8DE834((uint64_t)v23, (uint64_t)v6);

    id v10 = &v7[OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo];
    *(_OWORD *)id v10 = v20[0];
    long long v11 = v20[4];
    long long v13 = v20[1];
    long long v12 = v20[2];
    *((_OWORD *)v10 + 3) = v20[3];
    *((_OWORD *)v10 + 4) = v11;
    *((_OWORD *)v10 + 1) = v13;
    *((_OWORD *)v10 + 2) = v12;
    long long v14 = v20[6];
    long long v15 = v20[7];
    long long v16 = v20[5];
    *((void *)v10 + 16) = v21;
    *((_OWORD *)v10 + 6) = v14;
    *((_OWORD *)v10 + 7) = v15;
    *((_OWORD *)v10 + 5) = v16;

    v19.receiver = v7;
    v19.super_class = ObjectType;
    id v17 = objc_msgSendSuper2(&v19, sel_init);
    sub_20D8CD7B8(a1, a2);
    return (uint64_t)v17;
  }
  return result;
}

__n128 sub_20D8DD824@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 112) = v2;
  *(void *)(a1 + 128) = *(void *)(v1 + 128);
  long long v3 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  long long v4 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  __n128 result = *(__n128 *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

__n128 sub_20D8DD850(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v1 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v1 + 112) = v2;
  *(void *)(v1 + 128) = *(void *)(a1 + 128);
  long long v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v1 + 48) = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v1 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v1 + 80) = v4;
  __n128 result = *(__n128 *)(a1 + 16);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)a1;
  *(__n128 *)(v1 + 16) = result;
  return result;
}

uint64_t (*sub_20D8DD87C())()
{
  return nullsub_1;
}

void *sub_20D8DD89C()
{
  uint64_t v1 = *(void **)(v0 + 136);
  id v2 = v1;
  return v1;
}

void sub_20D8DD8C4(uint64_t a1)
{
  *(void *)(v1 + 136) = a1;
}

uint64_t (*sub_20D8DD8F0())()
{
  return nullsub_1;
}

__n128 sub_20D8DD910@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a3 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a3 + 112) = v3;
  uint64_t v4 = *(void *)(a1 + 128);
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a3 + 48) = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a3 + 80) = v6;
  __n128 result = *(__n128 *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(__n128 *)(a3 + 16) = result;
  *(void *)(a3 + 128) = v4;
  *(void *)(a3 + 136) = a2;
  return result;
}

void MSCMSTimestampAttributeInternal.verifyTimestamp(expectedMessageDigest:)(uint64_t a1, unint64_t a2)
{
  v19[6] = *(id *)MEMORY[0x263EF8340];
  long long v5 = (void **)(v2 + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
  swift_beginAccess();
  long long v6 = *v5;
  if (*v5)
  {
    v19[0] = 0;
    id v7 = v6;
    unsigned int v8 = objc_msgSend(v7, sel_verifySignatures_, v19);
    id v9 = v19[0];
    if (v8)
    {
      uint64_t v10 = v2 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
      swift_beginAccess();
      id v11 = v9;
      long long v12 = NSDataFromOctetString((void *)(v10 + 48));
      swift_endAccess();
      uint64_t v13 = sub_20D8DF148();
      unint64_t v15 = v14;

      if ((sub_20D8DE954(a1, a2, v13, v15) & 1) == 0)
      {
        sub_20D8DC184();
        swift_allocError();
        *(_OWORD *)uint64_t v16 = xmmword_20D8E2740;
        *(unsigned char *)(v16 + 16) = -125;
        swift_willThrow();
      }
      sub_20D8CD7B8(v13, v15);
    }
    else
    {
      id v18 = v19[0];
      sub_20D8DF0D8();

      swift_willThrow();
    }
  }
  else
  {
    sub_20D8DC184();
    swift_allocError();
    *(_OWORD *)uint64_t v17 = xmmword_20D8E2740;
    *(unsigned char *)(v17 + 16) = 67;
    swift_willThrow();
  }
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MSCMSTimestampAttributeInternal.encodeAttribute()(MSCMSAttribute *__return_ptr retstr)
{
  sub_20D8D2F08();
  swift_allocError();
  *(void *)uint64_t v1 = 0;
  *(void *)(v1 + 8) = 0;
  *(unsigned char *)(v1 + 16) = 48;
  swift_willThrow();
}

NSDate __swiftcall MSCMSTimestampAttributeInternal.timestampToken()()
{
  uint64_t v1 = v0 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
  swift_beginAccess();
  return (NSDate)objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_initWithTimeIntervalSince1970_, (double)*(uint64_t *)(v1 + 88));
}

id MSCMSTimestampAttributeInternal.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MSCMSTimestampAttributeInternal.init()()
{
}

uint64_t sub_20D8DDE68@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_20D8CD904(a2, a3);
      uint64_t v10 = (char *)sub_20D8DF048();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_20D8DF078();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_20D8DF068();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x20D8DE0CCLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_20D8CD7B8(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_20D8DF048();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_20D8DF078();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_20D8DF068();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_20D8DE0DC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_20D8CD904(a1, a2);
      char v5 = sub_20D8DE89C((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_20D8CD7B8(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_20D8DE89C(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_20D8CD7B8(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_20D8DDE68((uint64_t)__s1, a3, a4, &v14);
      sub_20D8CD7B8(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

void sub_20D8DE30C(uint64_t a1@<X8>)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  long long v3 = (void *)sub_20D8DF128();
  id v45 = 0;
  id v4 = objc_msgSend(v2, sel_decodeMessageSecurityObject_options_error_, v3, 0, &v45);

  if (!v4)
  {
    id v22 = v45;
    int64_t v20 = (void *)sub_20D8DF0D8();

    swift_willThrow();
    goto LABEL_15;
  }
  id v5 = v45;
  id v6 = objc_msgSend(v4, sel_contentType);
  sub_20D8DF198();
  id v7 = (void *)sub_20D8DF188();
  swift_bridgeObjectRelease();
  unsigned int v8 = objc_msgSend(v6, sel_isEqualToString_, v7);

  if (!v8)
  {
    id v23 = objc_msgSend(v4, sel_contentType);
    id v24 = objc_msgSend(v23, sel_OIDString);

    uint64_t v25 = sub_20D8DF198();
    uint64_t v27 = v26;

    sub_20D8D2F08();
    int64_t v20 = (void *)swift_allocError();
    *(void *)uint64_t v28 = v25;
    *(void *)(v28 + 8) = v27;
    char v29 = 96;
LABEL_14:
    *(unsigned char *)(v28 + 16) = v29;
    swift_willThrow();

    goto LABEL_15;
  }
  if (!objc_msgSend(v4, sel_embeddedContent))
  {
LABEL_13:
    sub_20D8D2F08();
    int64_t v20 = (void *)swift_allocError();
    *(void *)uint64_t v28 = 0;
    *(void *)(v28 + 8) = 0;
    char v29 = 99;
    goto LABEL_14;
  }
  self;
  uint64_t v9 = (void *)swift_dynamicCastObjCClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  uint64_t v10 = v9;
  uint64_t v44 = a1;
  id v11 = objc_msgSend(v9, sel_contentType);
  sub_20D8DF198();
  uint64_t v12 = (void *)sub_20D8DF188();
  swift_bridgeObjectRelease();
  unsigned int v13 = objc_msgSend(v11, sel_isEqualToString_, v12);

  if (v13)
  {
    LODWORD(v45) = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    memset(v49, 0, 28);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v14 = objc_msgSend(v10, sel_dataContent);
    if (v14)
    {
      uint64_t v15 = sub_20D8DF148();
      unint64_t v17 = v16;

      id v14 = (id)sub_20D8DF128();
      sub_20D8CD7B8(v15, v17);
    }
    unsigned int v18 = nsheim_decode_TSTInfo(v14);

    if (v18)
    {
      sub_20D8DC12C();
      int64_t v20 = (void *)swift_allocError();
      *(void *)uint64_t v19 = v18;
      *(void *)(v19 + 8) = 0;
      char v21 = 1;
    }
    else
    {
      uint64_t v41 = v45;
      if (v45 == 1)
      {

        uint64_t v42 = *(void *)&v49[1];
        int v43 = DWORD2(v49[1]);
        *(_DWORD *)uint64_t v44 = 1;
        *(_OWORD *)(v44 + 8) = v46;
        *(_OWORD *)(v44 + 24) = v47;
        *(_OWORD *)(v44 + 40) = v48;
        *(_OWORD *)(v44 + 56) = v49[0];
        *(void *)(v44 + 72) = v42;
        *(_DWORD *)(v44 + 80) = v43;
        *(_OWORD *)(v44 + 88) = v50;
        *(_OWORD *)(v44 + 104) = v51;
        *(_OWORD *)(v44 + 120) = v52;
        *(void *)(v44 + 136) = v10;
        return;
      }
      sub_20D8DC12C();
      int64_t v20 = (void *)swift_allocError();
      *(void *)uint64_t v19 = v41;
      *(void *)(v19 + 8) = 0;
      char v21 = 2;
    }
    *(unsigned char *)(v19 + 16) = v21;
  }
  else
  {
    id v35 = objc_msgSend(v10, sel_contentType);
    id v36 = objc_msgSend(v35, sel_OIDString);

    uint64_t v37 = sub_20D8DF198();
    uint64_t v39 = v38;

    sub_20D8DC12C();
    int64_t v20 = (void *)swift_allocError();
    *(void *)uint64_t v40 = v37;
    *(void *)(v40 + 8) = v39;
    *(unsigned char *)(v40 + 16) = 0;
  }
  swift_willThrow();

  swift_unknownObjectRelease();
LABEL_15:
  id v30 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267719F30);
  if (swift_dynamicCast())
  {

    id v31 = v45;
    uint64_t v32 = v46;
    char v33 = BYTE8(v46) | 0xA0;
    sub_20D8D2F08();
    swift_allocError();
    *(void *)uint64_t v34 = v31;
    *(void *)(v34 + 8) = v32;
    *(unsigned char *)(v34 + 16) = v33;
    swift_willThrow();
  }
}

uint64_t sub_20D8DE834(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267718E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D8DE89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_20D8DF048();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_20D8DF078();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_20D8DF068();
  sub_20D8DDE68(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_20D8DE954(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x20D8DEA90);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_20D8CD904(a3, a4);
              char v15 = sub_20D8DE0DC(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t type metadata accessor for MSCMSTimestampAttributeInternal()
{
  return self;
}

uint64_t method lookup function for MSCMSTimestampAttributeInternal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MSCMSTimestampAttributeInternal);
}

uint64_t dispatch thunk of MSCMSTimestampAttributeInternal.__allocating_init(attribute:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MSCMSTimestampAttributeInternal.__allocating_init(timestampToken:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void destroy for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1)
{
}

uint64_t initializeWithCopy for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  id v7 = *(void **)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v7;
  id v8 = v7;
  return a1;
}

uint64_t assignWithCopy for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  long long v3 = *(void **)(a1 + 136);
  long long v4 = *(void **)(a2 + 136);
  *(void *)(a1 + 136) = v4;
  id v5 = v4;

  return a1;
}

__n128 __swift_memcpy144_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  long long v3 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);

  return a1;
}

uint64_t getEnumTagSinglePayload for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 144)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 136);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 144) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 144) = 0;
    }
    if (a2) {
      *(void *)(result + 136) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MSCMSTimestampAttributeInternal.decodedAttribute()
{
  return &type metadata for MSCMSTimestampAttributeInternal.decodedAttribute;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t sub_20D8DEE1C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_20D8DEE3C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 136) = v3;
  return result;
}

void type metadata accessor for TSTInfo(uint64_t a1)
{
}

void type metadata accessor for Extensions(uint64_t a1)
{
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

uint64_t sub_20D8DEEC4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_20D8DEEE4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 40) = v3;
  return result;
}

void type metadata accessor for GeneralName(uint64_t a1)
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for Accuracy(uint64_t a1)
{
}

uint64_t sub_20D8DEF54(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_20D8DEF74(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for heim_integer(uint64_t a1)
{
}

void type metadata accessor for MessageImprint(uint64_t a1)
{
}

void type metadata accessor for Extension(uint64_t a1)
{
}

void type metadata accessor for GeneralName.__Unnamed_union_u(uint64_t a1)
{
}

void type metadata accessor for GeneralName_enum(uint64_t a1)
{
}

void type metadata accessor for AlgorithmIdentifier(uint64_t a1)
{
}

uint64_t sub_20D8DF028()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_20D8DF038()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_20D8DF048()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_20D8DF058()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_20D8DF068()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_20D8DF078()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_20D8DF088()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_20D8DF098()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_20D8DF0A8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_20D8DF0B8()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_20D8DF0C8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_20D8DF0D8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_20D8DF0E8()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_20D8DF0F8()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_20D8DF108()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_20D8DF118()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_20D8DF128()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_20D8DF138()
{
  return MEMORY[0x270EF0140]();
}

uint64_t sub_20D8DF148()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_20D8DF158()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_20D8DF168()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_20D8DF178()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_20D8DF188()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_20D8DF198()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_20D8DF1A8()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_20D8DF1B8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_20D8DF1C8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_20D8DF1D8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_20D8DF1E8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_20D8DF1F8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_20D8DF208()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_20D8DF218()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_20D8DF228()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_20D8DF238()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_20D8DF248()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_20D8DF258()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_20D8DF268()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_20D8DF278()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_20D8DF288()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_20D8DF298()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_20D8DF2A8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_20D8DF2B8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_20D8DF2C8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_20D8DF2D8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_20D8DF2E8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_20D8DF2F8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_20D8DF308()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_20D8DF318()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_20D8DF328()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_20D8DF338()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_20D8DF348()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_20D8DF378()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_20D8DF388()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_20D8DF398()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_20D8DF3A8()
{
  return MEMORY[0x270F9FC90]();
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78C8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78D0](*(void *)&op, *(void *)&mode, *(void *)&alg, *(void *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78E8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x270ED7910]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x270ED7918]();
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x270ED7930](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

int CCSymmetricKeyUnwrap(CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *wrappedKey, size_t wrappedKeyLen, uint8_t *rawKey, size_t *rawKeyLen)
{
  return MEMORY[0x270ED7A88](*(void *)&algorithm, iv, ivLen, kek, kekLen, wrappedKey, wrappedKeyLen, rawKey);
}

int CCSymmetricKeyWrap(CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *rawKey, size_t rawKeyLen, uint8_t *wrappedKey, size_t *wrappedKeyLen)
{
  return MEMORY[0x270ED7A90](*(void *)&algorithm, iv, ivLen, kek, kekLen, rawKey, rawKeyLen, wrappedKey);
}

size_t CCSymmetricUnwrappedSize(CCWrappingAlgorithm algorithm, size_t wrappedKeyLen)
{
  return MEMORY[0x270ED7A98](*(void *)&algorithm, wrappedKeyLen);
}

size_t CCSymmetricWrappedSize(CCWrappingAlgorithm algorithm, size_t rawKeyLen)
{
  return MEMORY[0x270ED7AA0](*(void *)&algorithm, rawKeyLen);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x270EE4C98](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

uint64_t SecCertificateCopyIssuerSequence()
{
  return MEMORY[0x270EFD740]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x270EFD758](certificate);
}

CFDataRef SecCertificateCopyNormalizedIssuerSequence(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD768](certificate);
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x270EFD790]();
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD7A8](certificate, error);
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x270EFD7D8]();
}

uint64_t SecCertificateGetBytePtr()
{
  return MEMORY[0x270EFD7F8]();
}

uint64_t SecCertificateGetKeyUsage()
{
  return MEMORY[0x270EFD800]();
}

uint64_t SecCertificateGetLength()
{
  return MEMORY[0x270EFD808]();
}

uint64_t SecCertificateGetSubjectKeyID()
{
  return MEMORY[0x270EFD820]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x270EFD828]();
}

uint64_t SecCertificateIsSelfSigned()
{
  return MEMORY[0x270EFD840]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x270EFD858]();
}

uint64_t SecCertificateVersion()
{
  return MEMORY[0x270EFD868]();
}

uint64_t SecDistinguishedNameCopyNormalizedSequence()
{
  return MEMORY[0x270EFD928]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x270EFD950](identityRef, privateKeyRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x270EFD960]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

CFDataRef SecKeyCopyKeyExchangeResult(SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B8](privateKey, algorithm, publicKey, parameters, error);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x270EFD9C8]();
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9F8](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA10](key, algorithm, plaintext, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

uint64_t SecKeyGetAlgorithmId()
{
  return MEMORY[0x270EFDA88]();
}

uint64_t SecKeySetParameter()
{
  return MEMORY[0x270EFDAC0]();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x270EFDCF8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x270EFDDA8](trust, anchorCertificates);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x270EFDDF8](trust, verifyDate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SecSecuritydCopyWhoAmI()
{
  return MEMORY[0x270EFDE78]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _asn1_copy_top()
{
  return MEMORY[0x270F992B8]();
}

uint64_t _asn1_decode_top()
{
  return MEMORY[0x270F992C0]();
}

uint64_t _asn1_free_top()
{
  return MEMORY[0x270F992D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t asn1_abort()
{
  return MEMORY[0x270F992E0]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t copy_heim_any()
{
  return MEMORY[0x270F992E8]();
}

uint64_t copy_heim_any_set()
{
  return MEMORY[0x270F992F0]();
}

uint64_t der_copy_oid()
{
  return MEMORY[0x270F99310]();
}

uint64_t der_free_octet_string()
{
  return MEMORY[0x270F99328]();
}

uint64_t der_free_oid()
{
  return MEMORY[0x270F99330]();
}

uint64_t der_get_integer()
{
  return MEMORY[0x270F99338]();
}

uint64_t der_get_length()
{
  return MEMORY[0x270F99340]();
}

uint64_t der_get_octet_string_ber()
{
  return MEMORY[0x270F99348]();
}

uint64_t der_get_tag()
{
  return MEMORY[0x270F99358]();
}

uint64_t der_length_heim_integer()
{
  return MEMORY[0x270F99388]();
}

uint64_t der_put_heim_integer()
{
  return MEMORY[0x270F993C8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
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
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}