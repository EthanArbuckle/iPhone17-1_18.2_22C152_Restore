id getSecKeyPublicBytes(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t vars8;

  if (a1 && a2)
  {
    *a2 = 0;
    v3 = SecKeyCopyPublicBytes();
    v4 = 0;
    *a2 = v4;
    if (v3 || (v5 = 0, !v4))
    {
      v6 = SESDefaultLogObject();
      v5 = SESCreateAndLogError(0, v6, SESErrorDomain, 0, @"Could not retrieve public key bytes : %d", v7, v8, v9, v3);
    }
  }
  else
  {
    v10 = SESDefaultLogObject();
    v5 = SESCreateAndLogError(0, v10, SESErrorDomain, 1, @"Nil parameter to getSecKeyPublicBytes", v11, v12, v13, v15);
  }

  return v5;
}

id ECIES_V1(__SecKey *a1, __SecKey *a2, uint64_t a3, uint64_t a4, unsigned int a5, void *a6, void *a7)
{
  v66[2] = *MEMORY[0x263EF8340];
  id v13 = a6;
  v14 = v13;
  if (!a1 || !a2 || !a3 || !a4 || !v13 || !a7)
  {
    SESDefaultLogObject();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v15, SESErrorDomain, 1, @"Nil parameter to ECIES_V1", v19, v20, v21, v61);
    goto LABEL_10;
  }
  if (a5 >= 2)
  {
    SESDefaultLogObject();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v15, SESErrorDomain, 1, @"Invalid ECIESOperationKind %d", v16, v17, v18, a5);
    v22 = LABEL_10:;
    goto LABEL_23;
  }
  id v64 = 0;
  v23 = getSecKeyPublicBytes(a3, &v64);
  id v15 = v64;
  if (v23)
  {
    SESDefaultLogObject();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = SESErrorDomain;
    uint64_t v26 = [v23 code];
    v22 = SESCreateAndLogError(0, v24, v25, v26, @"Failed to get sender public key data", v27, v28, v29, v61);
  }
  else
  {
    id v63 = 0;
    v23 = getSecKeyPublicBytes(a4, &v63);
    id v24 = v63;
    if (v23)
    {
      v30 = SESDefaultLogObject();
      v31 = SESErrorDomain;
      uint64_t v32 = [v23 code];
      v22 = SESCreateAndLogError(0, v30, v31, v32, @"Failed to get receiver public key data", v33, v34, v35, v61);
    }
    else
    {
      v30 = (void *)[v15 mutableCopy];
      [v30 appendData:v24];
      uint64_t v36 = *MEMORY[0x263F173E0];
      v65[0] = *MEMORY[0x263F173D8];
      v65[1] = v36;
      v66[0] = &unk_270EB3E68;
      v66[1] = v30;
      CFDictionaryRef v37 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
      CFErrorRef error = 0;
      CFDataRef v38 = SecKeyCopyKeyExchangeResult(a1, (SecKeyAlgorithm)*MEMORY[0x263F17290], a2, v37, &error);
      CFDataRef v39 = v38;
      v23 = error;
      if (error || [(__CFData *)v38 length] != 32)
      {
        SESDefaultLogObject();
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        v46 = SESErrorDomain;
        uint64_t v47 = [v23 code];
        v22 = SESCreateAndLogError(0, v44, v46, v47, @"Failed to SecKeyCopyKeyExchangeResult", v48, v49, v50, v61);
      }
      else
      {
        if (a5)
        {
          v40 = [MEMORY[0x263EFF990] dataWithLength:[v14 length] + 16];
          CFDataRef v41 = v39;
          [(__CFData *)v41 bytes];
          [(__CFData *)v41 bytes];
          id v42 = v14;
          [v42 bytes];
          [v42 length];
          id v43 = v40;
          [v43 mutableBytes];
          id v44 = v43;
          [v44 bytes];
          [v42 length];
          uint64_t v45 = CCCryptorGCMOneshotEncrypt();
        }
        else
        {
          v52 = [MEMORY[0x263EFF990] dataWithLength:[v14 length] - 16];
          CFDataRef v53 = v39;
          [(__CFData *)v53 bytes];
          [(__CFData *)v53 bytes];
          id v54 = v14;
          [v54 bytes];
          [v54 length];
          id v44 = v52;
          [v44 mutableBytes];
          id v55 = v54;
          [v55 bytes];
          [v55 length];
          uint64_t v45 = CCCryptorGCMOneshotDecrypt();
        }
        uint64_t v56 = v45;
        if (v45)
        {
          v57 = SESDefaultLogObject();
          v22 = SESCreateAndLogError(0, v57, SESErrorDomain, 0, @"Could not perform privacy operation: %d", v58, v59, v60, v56);
        }
        else
        {
          id v44 = v44;
          v22 = 0;
          *a7 = v44;
        }
      }
    }
  }

LABEL_23:

  return v22;
}

id encryptPrivacyData(void *a1, void *a2, void *a3, void *a4)
{
  v41[2] = *MEMORY[0x263EF8340];
  id v7 = a1;
  CFDataRef v8 = a2;
  CFDataRef v9 = v8;
  if (!v7 || !a3 || !v8 || !a4)
  {
    v23 = SESDefaultLogObject();
    uint64_t v27 = SESCreateAndLogError(0, v23, SESErrorDomain, 1, @"Nil input to encryptPrivacy", v24, v25, v26, v35);

    goto LABEL_13;
  }
  CFErrorRef error = 0;
  uint64_t v10 = *MEMORY[0x263F16FA8];
  uint64_t v11 = *MEMORY[0x263F16FB8];
  uint64_t v12 = *MEMORY[0x263F16F98];
  v40[0] = *MEMORY[0x263F16FA8];
  v40[1] = v12;
  v41[0] = v11;
  v41[1] = &unk_270EB3E80;
  CFDictionaryRef v36 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  SecKeyRef v13 = SecKeyCreateRandomKey(v36, &error);
  v14 = v13;
  CFErrorRef v15 = error;
  if (error || !v13)
  {
    SESDefaultLogObject();
    CFDictionaryRef v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = SESErrorDomain;
    v22 = @"While calling SecKeyCreateRandomKey";
  }
  else
  {
    uint64_t v16 = getSecKeyPublicBytes((uint64_t)v13, a3);
    if (!v16)
    {
      v38[0] = v10;
      v38[1] = v12;
      v39[0] = v11;
      v39[1] = &unk_270EB3E80;
      v38[2] = *MEMORY[0x263F16F68];
      v39[2] = *MEMORY[0x263F16F80];
      CFDictionaryRef v20 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
      uint64_t v29 = SecKeyCreateWithData(v9, v20, &error);
      v30 = v29;
      CFErrorRef v15 = error;
      if (error || !v29)
      {
        v31 = SESDefaultLogObject();
        uint64_t v27 = SESCreateAndLogError(0, v31, SESErrorDomain, 0, @"Could not create server privacy encryption key", v32, v33, v34, v35);
      }
      else
      {
        uint64_t v27 = ECIES_V1(v14, v29, (uint64_t)v14, (uint64_t)v29, 1u, v7, a4);
      }

      goto LABEL_12;
    }
    CFErrorRef v15 = (CFErrorRef)v16;
    SESDefaultLogObject();
    CFDictionaryRef v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = SESErrorDomain;
    v22 = @"While calling getSecKeyPublicBytes";
  }
  uint64_t v27 = SESCreateAndLogError(0, v20, v21, 0, v22, v17, v18, v19, v35);
LABEL_12:

LABEL_13:

  return v27;
}

id decryptPrivacyData(void *a1, void *a2, void *a3, void *a4)
{
  v28[3] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  CFDataRef v9 = a3;
  CFDataRef v10 = v9;
  if (v7 && v8 && v9 && a4)
  {
    uint64_t v11 = *MEMORY[0x263F16FB8];
    uint64_t v12 = *MEMORY[0x263F16F98];
    v27[0] = *MEMORY[0x263F16FA8];
    v27[1] = v12;
    v28[0] = v11;
    v28[1] = &unk_270EB3E80;
    v27[2] = *MEMORY[0x263F16F68];
    v28[2] = *MEMORY[0x263F16F80];
    CFDictionaryRef v13 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
    uint64_t v26 = 0;
    v14 = SecKeyCreateWithData(v10, v13, (CFErrorRef *)&v26);
    CFErrorRef v15 = v14;
    CFErrorRef v16 = (CFErrorRef)v26;
    if (v26 || !v14)
    {
      uint64_t v21 = SESDefaultLogObject();
      uint64_t v17 = SESCreateAndLogError(0, v21, SESErrorDomain, 0, @"Calling SecKeyCreateWithData", v22, v23, v24, v26);
    }
    else
    {
      uint64_t v17 = ECIES_V1(v7, v14, (uint64_t)v14, (uint64_t)v7, 0, v8, a4);
    }
  }
  else
  {
    SESDefaultLogObject();
    CFDictionaryRef v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = SESCreateAndLogError(0, v13, SESErrorDomain, 1, @"Nil input to decryptPrivacyData", v18, v19, v20, v26);
  }

  return v17;
}

id getCertificateSubjectCN(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFDataRef v1 = a1;
  v2 = SecCertificateCreateWithData(0, v1);
  if (v2)
  {
    v3 = v2;
    *(void *)id v8 = 0;
    SecCertificateCopyCommonName(v2, (CFStringRef *)v8);
    CFRelease(v3);
    v4 = *(void **)v8;
  }
  else
  {
    v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(__CFData *)v1 asHexString];
      *(_DWORD *)id v8 = 138412290;
      *(void *)&v8[4] = v6;
      _os_log_impl(&dword_263826000, v5, OS_LOG_TYPE_ERROR, "Could not create certificate with data %@", v8, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

id getCertificatePublicKey(void *a1)
{
  v29[9] = *MEMORY[0x263EF8340];
  id v1 = a1;
  v22[0] = [v1 DERItem];
  v22[1] = v2;
  memset(v21, 0, sizeof(v21));
  if (DERParseSequence((uint64_t)v22, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, (unint64_t)v21, 0x30uLL))BOOL v3 = 1; {
  else
  }
    BOOL v3 = *((void *)&v21[0] + 1) == 0;
  if (v3)
  {
    v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [v1 asHexString];
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v5;
      _os_log_impl(&dword_263826000, v4, OS_LOG_TYPE_ERROR, "Could not parse certificate with data %@", (uint8_t *)buf, 0xCu);
    }
    goto LABEL_16;
  }
  memset(v29, 0, 64);
  memset(buf, 0, sizeof(buf));
  int v6 = DERParseSequence((uint64_t)v21, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, (unint64_t)buf, 0xA0uLL);
  if (v6)
  {
    int v7 = v6;
    v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v8 = [MEMORY[0x263EFF8F8] dataWithDERItem:v21];
      uint64_t v9 = [v8 asHexString];
      v27[0] = 67109378;
      v27[1] = v7;
      LOWORD(v27[2]) = 2112;
      *(void *)((char *)&v27[2] + 2) = v9;
      CFDataRef v10 = "Failed (%d) to parse TBS with data %@";
      uint64_t v11 = (uint8_t *)v27;
LABEL_11:
      _os_log_impl(&dword_263826000, v4, OS_LOG_TYPE_ERROR, v10, v11, 0x12u);

LABEL_15:
    }
LABEL_16:

    CFErrorRef v15 = 0;
    goto LABEL_17;
  }
  memset(v27, 0, sizeof(v27));
  unsigned int v12 = DERParseSequenceContent(v29, (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)v27, 0x20uLL);
  if (v12)
  {
    unsigned int v13 = v12;
    v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v14 = [MEMORY[0x263EFF8F8] dataWithDERItem:v29];
      uint64_t v9 = [v14 asHexString];
      *(_DWORD *)uint64_t v23 = 67109378;
      unsigned int v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl(&dword_263826000, v4, OS_LOG_TYPE_ERROR, "Failed (%d) to parse SubjPubKey with data %@", v23, 0x12u);

      goto LABEL_15;
    }
    goto LABEL_16;
  }
  char v20 = 0;
  v19[0] = 0;
  v19[1] = 0;
  unsigned int v17 = DERParseBitString((uint64_t)&v27[4], v19, &v20);
  if (v17)
  {
    unsigned int v18 = v17;
    v4 = SESDefaultLogObject();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    id v8 = [MEMORY[0x263EFF8F8] dataWithDERItem:&v27[4]];
    uint64_t v9 = [v8 asHexString];
    *(_DWORD *)uint64_t v23 = 67109378;
    unsigned int v24 = v18;
    __int16 v25 = 2112;
    uint64_t v26 = v9;
    CFDataRef v10 = "Failed (%d) to parse BITSTRING with data %@";
    uint64_t v11 = v23;
    goto LABEL_11;
  }
  CFErrorRef v15 = [MEMORY[0x263EFF8F8] dataWithDERItem:v19];
LABEL_17:

  return v15;
}

void sub_263828824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t Any(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t All(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9)))
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

id Find(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

id Filter(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = a2;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

id Transform(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = a2;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

id TransformIf(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = a2;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

id getSBUserNotificationDismissOnLock()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getSBUserNotificationDismissOnLockSymbolLoc_ptr;
  uint64_t v7 = getSBUserNotificationDismissOnLockSymbolLoc_ptr;
  if (!getSBUserNotificationDismissOnLockSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSBUserNotificationDismissOnLockSymbolLoc_block_invoke;
    v3[3] = &unk_2655D65A0;
    v3[4] = &v4;
    __getSBUserNotificationDismissOnLockSymbolLoc_block_invoke((uint64_t)v3);
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getSBUserNotificationDismissOnLock_cold_1();
  }
  id v1 = *v0;

  return v1;
}

void sub_26382A140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NFTTRUserNotificationCallback(uint64_t a1, uint64_t a2)
{
  return +[SESTapToRadar handleCallback:a2];
}

uint64_t SpringBoardServicesLibraryCore()
{
  if (!SpringBoardServicesLibraryCore_frameworkLibrary) {
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SpringBoardServicesLibraryCore_frameworkLibrary;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSBUserNotificationDismissOnLockSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardServicesLibraryCore();
  if (!v2)
  {
    uint64_t v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "SBUserNotificationDismissOnLock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBUserNotificationDismissOnLockSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPublicKeyBytes(unint64_t a1, unint64_t a2)
{
  v17[3] = *MEMORY[0x263EF8340];
  v14[0] = a1;
  v14[1] = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v2 = DERParseSequenceContent(v14, (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v12, 0);
  if (v2)
  {
    unsigned int v3 = v2;
    uint64_t v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v17[0]) = 67109120;
      HIDWORD(v17[0]) = v3;
      id v5 = "Could not extract pubKeyInfo : %d\n";
      uint64_t v6 = (uint8_t *)v17;
LABEL_7:
      _os_log_impl(&dword_263826000, v4, OS_LOG_TYPE_ERROR, v5, v6, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v17[0] = 0;
  v17[1] = 0;
  char v11 = 0;
  int v7 = DERParseBitString((uint64_t)&v13, v17, &v11);
  if (v7)
  {
    int v8 = v7;
    uint64_t v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = v8;
      id v5 = "Could not extract publicKey bytes : %d\n";
      uint64_t v6 = buf;
      goto LABEL_7;
    }
LABEL_8:

    uint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithDERItem:v17];
LABEL_9:

  return v9;
}

id encodeSequenceSpec(unint64_t a1, uint64_t a2)
{
  return encodeSequence(0x2000000000000010, a1, *(unsigned __int16 *)(a2 + 8), *(void *)a2);
}

id encodeSequence(uint64_t a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v14 = DERLengthOfEncodedSequence(a1, a2, a3, a4);
  id v8 = [MEMORY[0x263EFF990] dataWithLength:v14];
  int v9 = DEREncodeSequence(a1, a2, a3, a4, [v8 mutableBytes], (unint64_t *)&v14);
  if (v9)
  {
    int v10 = v9;
    char v11 = SESDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = v10;
      _os_log_impl(&dword_263826000, v11, OS_LOG_TYPE_ERROR, "while encoding extensions : %d", buf, 8u);
    }

    id v12 = 0;
  }
  else
  {
    id v12 = v8;
  }

  return v12;
}

id encodeSequenceSpec(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return encodeSequence(a1, a2, *(unsigned __int16 *)(a3 + 8), *(void *)a3);
}

id encodeSequence(unint64_t a1, unsigned int a2, uint64_t a3)
{
  return encodeSequence(0x2000000000000010, a1, a2, a3);
}

id encodeSequenceContentSpec(unint64_t a1, uint64_t a2)
{
  encodeSequence(0x2000000000000010, a1, *(unsigned __int16 *)(a2 + 8), *(void *)a2);
  unsigned int v2 = (NSData *)objc_claimAutoreleasedReturnValue();
  unsigned int v3 = DERDecodeData(v2, -1);

  return v3;
}

id DERDecodeData(NSData *a1)
{
  return DERDecodeData(a1, -1);
}

id encodeItem(unint64_t a1, unint64_t a2, const void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v12 = DERLengthOfItem(a1, a2);
  id v6 = [MEMORY[0x263EFF990] dataWithLength:v12];
  int v7 = DEREncodeItem(a1, a2, a3, [v6 mutableBytes], &v12);
  if (v7 || (uint64_t v8 = [v6 length], v8 != v12))
  {
    int v10 = SESDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v7;
      _os_log_impl(&dword_263826000, v10, OS_LOG_TYPE_ERROR, "while encoding item : %d\n", buf, 8u);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

id encodeNSData(unint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 length];
  id v5 = v3;
  id v6 = (const void *)[v5 bytes];

  return encodeItem(a1, v4, v6);
}

id encodeDERItem(unint64_t a1, const void *a2, unint64_t a3)
{
  return encodeItem(a1, a3, a2);
}

id DERDecodeData(const DERItem *a1)
{
  return DERDecodeData(a1, -1);
}

id DERDecodeData(const DERItem *a1, uint64_t a2)
{
  unint64_t v6 = 0;
  v7[0] = 0;
  v7[1] = 0;
  int v3 = DERDecodeItem((uint64_t)a1, &v6);
  unint64_t v4 = 0;
  if (!v3)
  {
    if (a2 == -1 || v6 == a2)
    {
      unint64_t v4 = [MEMORY[0x263EFF8F8] dataWithDERItem:v7];
    }
    else
    {
      unint64_t v4 = 0;
    }
  }

  return v4;
}

id DERDecodeData(NSData *a1, uint64_t a2)
{
  unint64_t v8 = 0;
  v9[0] = 0;
  v9[1] = 0;
  v7[0] = [(NSData *)a1 DERItem];
  v7[1] = v3;
  int v4 = DERDecodeItem((uint64_t)v7, &v8);
  id v5 = 0;
  if (!v4)
  {
    if (a2 == -1 || v8 == a2)
    {
      id v5 = [MEMORY[0x263EFF8F8] dataWithDERItem:v9];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

uint64_t DERDecodeData(void *a1, unint64_t *a2)
{
  v5[0] = [a1 DERItem];
  v5[1] = v3;
  return DERDecodeItem((uint64_t)v5, a2);
}

id DERDecodeAdvance(uint64_t *a1, uint64_t a2, char a3)
{
  unint64_t v13 = 0;
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  int v6 = DERDecodeItem((uint64_t)a1, &v13);
  int v7 = 0;
  if (!v6)
  {
    if (a2 == -1 || v13 == a2)
    {
      unint64_t v8 = DERLengthOfItem(v13, v15);
      if (a3)
      {
        uint64_t v9 = *a1;
        unint64_t v10 = v8;
      }
      else
      {
        uint64_t v9 = v14;
        unint64_t v10 = v15;
      }
      int v7 = [MEMORY[0x263EFF8F8] dataWithBytes:v9 length:v10];
      unint64_t v11 = a1[1] - v8;
      *a1 += v8;
      a1[1] = v11;
    }
    else
    {
      int v7 = 0;
    }
  }

  return v7;
}

uint64_t DERParseSequenceSpec(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  bzero(a4, a5);
  unint64_t v11 = 0;
  v12[0] = 0;
  v12[1] = 0;
  uint64_t result = DERDecodeItem(a2, &v11);
  if (!result)
  {
    if (v11 == a1) {
      return (uint64_t)DERParseSequenceContent(v12, *(unsigned __int16 *)(a3 + 8), *(void *)a3, (unint64_t)a4, a5);
    }
    else {
      return 2;
    }
  }
  return result;
}

unint64_t *DERParseSequenceSpecContent(unint64_t *a1, uint64_t a2, unint64_t a3, size_t a4)
{
  return DERParseSequenceContent(a1, *(unsigned __int16 *)(a2 + 8), *(void *)a2, a3, a4);
}

uint64_t DERParseSequenceSpec(uint64_t a1, void *a2, uint64_t a3, void *a4, size_t a5)
{
  v11[0] = [a2 DERItem];
  v11[1] = v9;
  return DERParseSequenceSpec(a1, (uint64_t)v11, a3, a4, a5);
}

uint64_t DERParseSequenceSpec(uint64_t a1, uint64_t a2, void *a3, size_t a4)
{
  return DERParseSequenceSpec(0x2000000000000010, a1, a2, a3, a4);
}

uint64_t DERParseSequenceSpec(void *a1, uint64_t a2, void *a3, size_t a4)
{
  v9[0] = [a1 DERItem];
  v9[1] = v7;
  return DERParseSequenceSpec(0x2000000000000010, (uint64_t)v9, a2, a3, a4);
}

unint64_t *DERParseSequenceSpecContent(void *a1, uint64_t a2, unint64_t a3, size_t a4)
{
  v9[0] = [a1 DERItem];
  v9[1] = v7;
  return DERParseSequenceContent(v9, *(unsigned __int16 *)(a2 + 8), *(void *)a2, a3, a4);
}

void sub_26382E744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_263830ACC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_263830C00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_263831010(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_263831088(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_263831100(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_26383115C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2638311E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id SESDefaultLogObject()
{
  if (SESDefaultLogObject_once != -1) {
    dispatch_once(&SESDefaultLogObject_once, &__block_literal_global_3);
  }
  v0 = (void *)SESDefaultLogObject_log;

  return v0;
}

uint64_t __SESDefaultLogObject_block_invoke()
{
  SESDefaultLogObject_log = (uint64_t)os_log_create("com.apple.seserviced", "default");

  return MEMORY[0x270F9A758]();
}

id SESCreateAndLogError(void *a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v13 = a1;
  uint64_t v14 = a2;
  unint64_t v15 = (objc_class *)NSString;
  id v16 = a5;
  id v17 = a3;
  uint64_t v18 = (void *)[[v15 alloc] initWithFormat:v16 arguments:&a9];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v18;
    _os_log_impl(&dword_263826000, v14, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  if (v13)
  {
    uint64_t v19 = *MEMORY[0x263F08608];
    v29[0] = *MEMORY[0x263F08320];
    v29[1] = v19;
    v30[0] = v18;
    v30[1] = v13;
    char v20 = NSDictionary;
    uint64_t v21 = (void **)v30;
    uint64_t v22 = v29;
    uint64_t v23 = 2;
  }
  else
  {
    uint64_t v27 = *MEMORY[0x263F08320];
    uint64_t v28 = v18;
    char v20 = NSDictionary;
    uint64_t v21 = &v28;
    uint64_t v22 = &v27;
    uint64_t v23 = 1;
  }
  unsigned int v24 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:v23];
  __int16 v25 = [MEMORY[0x263F087E8] errorWithDomain:v17 code:a4 userInfo:v24];

  return v25;
}

id SESEnsureError(void *a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  unsigned int v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    int v4 = (void *)MEMORY[0x263F087E8];
    id v5 = SESErrorDomain;
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = @"No Valid Error Set";
    int v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v3 = [v4 errorWithDomain:v5 code:-1 userInfo:v6];
  }

  return v3;
}

uint64_t SESInternalVariant()
{
  if (SESInternalVariant_onceToken != -1) {
    dispatch_once(&SESInternalVariant_onceToken, &__block_literal_global_4);
  }
  return SESInternalVariant_ret;
}

uint64_t __SESInternalVariant_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  SESInternalVariant_ret = result;
  return result;
}

uint64_t ReadS32BE(const unsigned __int8 *a1)
{
  return bswap32(*(_DWORD *)a1);
}

uint64_t ReadS32BE(const DERItem *a1)
{
  return bswap32(*(_DWORD *)a1->data);
}

uint64_t ReadU16BE(const unsigned __int8 *a1)
{
  return bswap32(*(unsigned __int16 *)a1) >> 16;
}

uint64_t ReadU16BE(const DERItem *a1)
{
  return bswap32(*(unsigned __int16 *)a1->data) >> 16;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  int v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  id v5 = &v4[v3];
  int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    unint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    unint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  int v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  id v5 = &v4[v3];
  int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    unint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    unint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  void v9[2] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t DERLengthOfLength(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1;
  }
  unint64_t v2 = a1;
  uint64_t result = 1;
  do
  {
    ++result;
    BOOL v3 = v2 > 0xFF;
    v2 >>= 8;
  }
  while (v3);
  return result;
}

unint64_t DEREncodeLength(unint64_t a1, unint64_t a2, unint64_t *a3)
{
  return DEREncodeLengthSized(a1, a2, *a3, (uint64_t *)a3);
}

unint64_t DEREncodeLengthSized(unint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (result >= 0x80)
  {
    uint64_t v5 = 0;
    unint64_t v6 = result;
    do
    {
      --v5;
      BOOL v7 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v7);
    unint64_t v8 = -v5;
    uint64_t v9 = 7;
    if (-v5 < a3 && v8 <= 0x7E)
    {
      if (*a4)
      {
        uint64_t v4 = 1 - v5;
        *(unsigned char *)a2 = -(char)v5 | 0x80;
        if (v8 < ~a2)
        {
          unint64_t v10 = (unsigned char *)(a2 - v5);
          if (a2 - v5 != -2)
          {
            unint64_t v11 = (unsigned char *)(a2 + *a4);
            while (v10 != (unsigned char *)-1)
            {
              if (v10 >= v11 || (unint64_t)v10 < a2) {
                goto LABEL_23;
              }
              *v10-- = result;
              BOOL v7 = result > 0xFF;
              result >>= 8;
              if (!v7)
              {
                if (v8 >= *a4) {
                  goto LABEL_23;
                }
                goto LABEL_19;
              }
            }
          }
        }
        __break(0x5513u);
      }
      goto LABEL_23;
    }
    return v9;
  }
  if (!a3) {
    return 7;
  }
  if (*a4)
  {
    *(unsigned char *)a2 = result;
    if (*a4)
    {
      uint64_t v4 = 1;
LABEL_19:
      uint64_t v9 = 0;
      *a4 = v4;
      return v9;
    }
  }
LABEL_23:
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfItem(unint64_t result, unint64_t a2)
{
  unint64_t v2 = result & 0x1FFFFFFFFFFFFFFFLL;
  uint64_t v3 = 1;
  if ((result & 0x1FFFFFFFFFFFFFFFLL) >= 0x1F)
  {
    do
    {
      ++v3;
      BOOL v4 = v2 > 0x7F;
      v2 >>= 7;
    }
    while (v4);
  }
  uint64_t v5 = 1;
  if (a2 >= 0x80)
  {
    unint64_t v6 = a2;
    do
    {
      ++v5;
      BOOL v4 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v4);
  }
  BOOL v7 = __CFADD__(v3, v5);
  uint64_t v8 = v3 + v5;
  if (v7 || (uint64_t result = v8 + a2, __CFADD__(v8, a2))) {
    __break(0x5500u);
  }
  return result;
}

uint64_t DEREncodeItem(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t *a5)
{
  return DEREncodeItemSized(a1, a2, a3, a4, *a5, a5);
}

uint64_t DEREncodeItemSized(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t a5, unint64_t *a6)
{
  v22[1] = *MEMORY[0x263EF8340];
  unint64_t v12 = *a6;
  unint64_t v13 = DERLengthOfItem(a1, a2);
  if (v13 > a5) {
    return 7;
  }
  unint64_t v15 = v13;
  if (v13 > *a6) {
    goto LABEL_20;
  }
  *a6 = v13;
  v22[0] = v13;
  if (v13 > v12) {
    goto LABEL_20;
  }
  uint64_t result = DEREncodeTag(a1, a4, (unint64_t *)v22);
  if (result) {
    return result;
  }
  uint64_t v16 = v22[0];
  if (__CFADD__(a4, v22[0]))
  {
LABEL_21:
    __break(0x5513u);
    goto LABEL_22;
  }
  BOOL v17 = v15 >= v22[0];
  unint64_t v18 = v15 - v22[0];
  if (!v17) {
    goto LABEL_22;
  }
  unint64_t v19 = a4 + v12;
  unint64_t v20 = a4 + v22[0];
  v22[0] = v18;
  if (a4 + v16 > a4 + v12 || v20 < a4 || v18 > v19 - v20) {
LABEL_20:
  }
    __break(0x5519u);
  uint64_t result = DEREncodeLengthSized(a2, v20, v18, v22);
  if (result) {
    return result;
  }
  if (__CFADD__(v20, v22[0])) {
    goto LABEL_21;
  }
  if (v18 < v22[0])
  {
LABEL_22:
    __break(0x5515u);
    return result;
  }
  uint64_t v21 = (void *)(v20 + v22[0]);
  if (v19 < v20 + v22[0] || (unint64_t)v21 < a4 || v19 - (v20 + v22[0]) < a2) {
    goto LABEL_20;
  }
  memmove(v21, a3, a2);
  return 0;
}

uint64_t DEREncodeTag(uint64_t result, unint64_t a2, unint64_t *a3)
{
  unint64_t v3 = result & 0x1FFFFFFFFFFFFFFFLL;
  if ((result & 0x1FFFFFFFFFFFFFFFuLL) < 0x1F)
  {
    if (*a3)
    {
      *(unsigned char *)a2 = HIBYTE(result) & 0xE0 | result;
      unint64_t v8 = 1;
      goto LABEL_17;
    }
    return 7;
  }
  unint64_t v4 = 0;
  unint64_t v5 = result & 0x1FFFFFFFFFFFFFFFLL;
  do
  {
    ++v4;
    BOOL v6 = v5 > 0x7F;
    v5 >>= 7;
  }
  while (v6);
  unint64_t v7 = *a3;
  if (v4 >= *a3) {
    return 7;
  }
  if (v4 >= ~a2 || (*(unsigned char *)a2 = HIBYTE(result) | 0x1F, a2 + v4 == -2))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }
  if (a2 + v4 >= a2)
  {
    unint64_t v8 = v4 + 1;
    *(unsigned char *)(a2 + v4) = result & 0x7F;
    if (v3 >= 0x80)
    {
      uint64_t v9 = (unsigned char *)(a2 + v4 - 1);
      unint64_t v10 = (unsigned char *)(a2 + v7);
      while (v9 != (unsigned char *)-2)
      {
        if (v9 >= v10 || (unint64_t)v9 < a2) {
          goto LABEL_21;
        }
        unint64_t v11 = v3 >> 14;
        v3 >>= 7;
        *v9-- = v3 | 0x80;
        if (!v11) {
          goto LABEL_17;
        }
      }
      goto LABEL_20;
    }
LABEL_17:
    if (v8 <= *a3)
    {
      uint64_t result = 0;
      *a3 = v8;
      return result;
    }
  }
LABEL_21:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t *a8)
{
  v45[1] = *MEMORY[0x263EF8340];
  unint64_t v8 = ~a6;
  if (~a6 < a7) {
    goto LABEL_73;
  }
  unint64_t v11 = *a8;
  unint64_t v44 = a7;
  v45[0] = 0;
  if (v11 < a7) {
    goto LABEL_74;
  }
  uint64_t result = DEREncodeTag(a1, a6, &v44);
  if (result) {
    return result;
  }
  if (v44 > v8) {
    goto LABEL_73;
  }
  unint64_t v17 = a7 - v44;
  if (a7 < v44) {
    goto LABEL_75;
  }
  unint64_t v18 = a6 + a7;
  unint64_t v19 = a6 + v44;
  if (a6 + v44 < v18)
  {
    uint64_t result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v45);
    if (result) {
      return result;
    }
    unint64_t v44 = v17;
    if (v19 > a6 + v11 || v19 < a6 || v17 > a6 + v11 - v19) {
      goto LABEL_74;
    }
    unint64_t v42 = a6 + v11;
    unint64_t v20 = v45[0];
    uint64_t result = DEREncodeLengthSized(v45[0], v19, v17, (uint64_t *)&v44);
    if (result) {
      return result;
    }
    unint64_t v21 = v42;
    if (__CFADD__(v19, v44))
    {
LABEL_73:
      __break(0x5513u);
      goto LABEL_74;
    }
    unint64_t v22 = v17 - v44;
    if (v17 >= v44)
    {
      uint64_t v23 = (unsigned char *)(v19 + v44);
      if (!__CFADD__(v19 + v44, v20))
      {
        if ((unint64_t)&v23[v20] > v18) {
          return 7;
        }
        if (a4)
        {
          unint64_t v24 = 0;
          unint64_t v25 = a2 + a3;
          uint64_t v41 = 24 * a4;
          while (1)
          {
            if (v24 > ~a5) {
              goto LABEL_73;
            }
            unint64_t v26 = *(void *)(a5 + v24);
            if (v26 > ~a2) {
              goto LABEL_73;
            }
            __int16 v27 = (const void **)(a2 + v26);
            __int16 v28 = *(_WORD *)(a5 + v24 + 16);
            if ((v28 & 0x200) != 0) {
              break;
            }
            if ((v28 & 1) == 0) {
              goto LABEL_29;
            }
            if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
              goto LABEL_74;
            }
            if (v27[1])
            {
LABEL_29:
              unint64_t v44 = v22;
              if ((unint64_t)v23 > v21 || (unint64_t)v23 < a6 || v22 > v21 - (unint64_t)v23) {
                goto LABEL_74;
              }
              uint64_t result = DEREncodeTag(*(void *)(a5 + v24 + 8), (unint64_t)v23, &v44);
              if (result) {
                return result;
              }
              if (__CFADD__(v23, v44)) {
                goto LABEL_73;
              }
              unint64_t v30 = v22 - v44;
              if (v22 < v44) {
                goto LABEL_75;
              }
              if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
                goto LABEL_74;
              }
              unint64_t v31 = (unint64_t)v27[1];
              v45[0] = v31;
              char v32 = 1;
              if ((v28 & 0x100) != 0 && v31 && *(char *)*v27 < 0)
              {
                char v32 = 0;
                v45[0] = ++v31;
              }
              unint64_t v33 = (unint64_t)&v23[v44];
              unint64_t v44 = v30;
              if (v33 > v42 || v33 < a6 || v30 > v42 - v33) {
                goto LABEL_74;
              }
              uint64_t result = DEREncodeLengthSized(v31, v33, v30, (uint64_t *)&v44);
              if (result) {
                return result;
              }
              unint64_t v34 = v44;
              if (__CFADD__(v33, v44)) {
                goto LABEL_73;
              }
              unint64_t v35 = v30 - v44;
              if (v30 < v44) {
                goto LABEL_75;
              }
              uint64_t v23 = (unsigned char *)(v33 + v44);
              if ((v32 & 1) == 0)
              {
                if (v23 == (unsigned char *)-1) {
                  goto LABEL_73;
                }
                if ((unint64_t)v23 >= v42 || (unint64_t)v23 < a6) {
                  goto LABEL_74;
                }
                unsigned char *v23 = 0;
                --v35;
                if (v30 == v34) {
                  goto LABEL_75;
                }
                ++v23;
              }
              if ((unint64_t)v23 > v42) {
                goto LABEL_74;
              }
              if ((unint64_t)v23 < a6) {
                goto LABEL_74;
              }
              size_t v36 = (size_t)v27[1];
              if (v36 > v42 - (unint64_t)v23) {
                goto LABEL_74;
              }
              uint64_t result = (uint64_t)memmove(v23, *v27, v36);
              unint64_t v21 = v42;
              unint64_t v37 = (unint64_t)v27[1];
              if (__CFADD__(v23, v37)) {
                goto LABEL_73;
              }
              unint64_t v22 = v35 - v37;
              if (v35 < v37) {
                goto LABEL_75;
              }
              goto LABEL_69;
            }
LABEL_70:
            v24 += 24;
            if (v41 == v24) {
              goto LABEL_71;
            }
          }
          if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
            goto LABEL_74;
          }
          if ((unint64_t)v23 > v21) {
            goto LABEL_74;
          }
          if ((unint64_t)v23 < a6) {
            goto LABEL_74;
          }
          size_t v39 = (size_t)v27[1];
          if (v39 > v21 - (unint64_t)v23) {
            goto LABEL_74;
          }
          uint64_t result = (uint64_t)memmove(v23, *v27, v39);
          unint64_t v21 = v42;
          unint64_t v37 = (unint64_t)v27[1];
          if (__CFADD__(v23, v37)) {
            goto LABEL_73;
          }
          BOOL v40 = v22 >= v37;
          v22 -= v37;
          if (!v40) {
            goto LABEL_75;
          }
LABEL_69:
          v23 += v37;
          goto LABEL_70;
        }
LABEL_71:
        if ((unint64_t)&v23[-a6] <= *a8)
        {
          uint64_t result = 0;
          *a8 = (unint64_t)&v23[-a6];
          return result;
        }
LABEL_74:
        __break(0x5519u);
      }
      goto LABEL_73;
    }
LABEL_75:
    __break(0x5515u);
    return result;
  }
  return 7;
}

unint64_t DERContentLengthOfEncodedSequence(unint64_t result, unint64_t a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v5 = 0;
  if (!a3)
  {
LABEL_38:
    uint64_t result = 0;
LABEL_40:
    *a5 = v5;
    return result;
  }
  unsigned int v6 = 0;
  unint64_t v7 = result + a2;
  while (24 * (unint64_t)v6 <= ~a4)
  {
    unint64_t v8 = *(void *)(a4 + 24 * v6);
    BOOL v9 = v8 > 0xFFFFFFFFFFFFFFEFLL || v8 + 16 > a2;
    if (v9)
    {
      uint64_t v5 = 0;
      uint64_t result = 7;
      goto LABEL_40;
    }
    if (v8 > ~result) {
      break;
    }
    unint64_t v10 = (unsigned __int8 **)(result + v8);
    __int16 v11 = *(_WORD *)(a4 + 24 * v6 + 16);
    if ((v11 & 0x200) == 0)
    {
      if (v11)
      {
        if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
          goto LABEL_43;
        }
        if (!v10[1]) {
          goto LABEL_37;
        }
      }
      unint64_t v13 = *(void *)(a4 + 24 * v6 + 8) & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v14 = 1;
      if (v13 >= 0x1F)
      {
        do
        {
          ++v14;
          BOOL v9 = v13 > 0x7F;
          v13 >>= 7;
        }
        while (v9);
      }
      BOOL v15 = __CFADD__(v5, v14);
      uint64_t v16 = v5 + v14;
      if (v15) {
        goto LABEL_42;
      }
      if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
        goto LABEL_43;
      }
      unint64_t v17 = (unint64_t)v10[1];
      if ((*(_WORD *)(a4 + 24 * v6 + 16) & 0x100) != 0)
      {
        if (v17)
        {
          v17 += (unint64_t)**v10 >> 7;
          goto LABEL_24;
        }
LABEL_25:
        uint64_t v18 = 1;
      }
      else
      {
LABEL_24:
        if (v17 < 0x80) {
          goto LABEL_25;
        }
        uint64_t v18 = 1;
        unint64_t v21 = v17;
        do
        {
          ++v18;
          BOOL v9 = v21 > 0xFF;
          v21 >>= 8;
        }
        while (v9);
      }
      BOOL v15 = __CFADD__(v16, v18);
      uint64_t v22 = v16 + v18;
      if (v15) {
        goto LABEL_42;
      }
      BOOL v15 = __CFADD__(v22, v17);
      uint64_t v5 = v22 + v17;
      if (v15) {
        goto LABEL_42;
      }
      goto LABEL_37;
    }
    if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
      goto LABEL_43;
    }
    unint64_t v20 = v10[1];
    BOOL v15 = __CFADD__(v5, v20);
    v5 += (uint64_t)v20;
    if (v15) {
      goto LABEL_42;
    }
LABEL_37:
    if (++v6 == a3) {
      goto LABEL_38;
    }
  }
  __break(0x5513u);
LABEL_42:
  __break(0x5500u);
LABEL_43:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequence(uint64_t result, unint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) >= a2) {
    return DEREncodeSequenceFromObject(result, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, a5, *a6, a6);
  }
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfEncodedSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  v17[1] = *MEMORY[0x263EF8340];
  v17[0] = 0;
  unint64_t result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v17);
  if (!result)
  {
    unint64_t v9 = a1 & 0x1FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 1;
    if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >= 0x1F)
    {
      do
      {
        ++v10;
        BOOL v11 = v9 > 0x7F;
        v9 >>= 7;
      }
      while (v11);
    }
    uint64_t v12 = 1;
    if (v17[0] >= 0x80uLL)
    {
      unint64_t v13 = v17[0];
      do
      {
        ++v12;
        BOOL v11 = v13 > 0xFF;
        v13 >>= 8;
      }
      while (v11);
    }
    BOOL v14 = __CFADD__(v10, v12);
    uint64_t v15 = v10 + v12;
    if (v14 || (v14 = __CFADD__(v15, v17[0]), uint64_t v16 = v15 + v17[0], v14))
    {
      __break(0x5500u);
    }
    else
    {
      unint64_t result = 0;
      *a6 = v16;
    }
  }
  return result;
}

uint64_t DERLengthOfEncodedSequence(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) < a2) {
    __break(0x5519u);
  }
  if (DERLengthOfEncodedSequenceFromObject(a1, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, v5)) {
    return 0;
  }
  else {
    return v5[0];
  }
}

void getSBUserNotificationDismissOnLock_cold_1()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x270ED7910]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x270ED7918]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B48](data, *(void *)&len, md);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x270EFD6E8](certificate, commonName);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

CFDataRef SecKeyCopyKeyExchangeResult(SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B8](privateKey, algorithm, publicKey, parameters, error);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x270EFD9C8]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
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

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x270EDBF60]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}