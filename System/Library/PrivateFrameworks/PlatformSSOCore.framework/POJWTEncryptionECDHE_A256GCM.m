@interface POJWTEncryptionECDHE_A256GCM
- (BOOL)decodeAndDecryptJWT:(id)a3 privateKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPublicKey:(__SecKey *)a8 error:(id *)a9;
- (NSNumber)encryptionAlgorithm;
- (POJWTEncryptionECDHE_A256GCM)init;
- (id)algValue;
- (id)encodeAndEncryptJWT:(id)a3 publicKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPrivateKey:(__SecKey *)a8 auth_kid:(id)a9 error:(id *)a10;
- (void)addValuesToHeader:(id)a3;
@end

@implementation POJWTEncryptionECDHE_A256GCM

- (POJWTEncryptionECDHE_A256GCM)init
{
  v5.receiver = self;
  v5.super_class = (Class)POJWTEncryptionECDHE_A256GCM;
  v2 = [(POJWTEncryptionECDHE_A256GCM *)&v5 init];
  v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_encryptionAlgorithm, &unk_2707DBB50);
  }
  return v3;
}

- (void)addValuesToHeader:(id)a3
{
  id v3 = a3;
  [v3 setAlg:@"ECDH-ES"];
  [v3 setEnc:@"A256GCM"];
}

- (id)algValue
{
  return @"ECDH-ES";
}

- (BOOL)decodeAndDecryptJWT:(id)a3 privateKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPublicKey:(__SecKey *)a8 error:(id *)a9
{
  v80[3] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  v13 = [v11 rawHeader];
  v14 = [v13 dataUsingEncoding:1];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263EFF8F8]);
    v16 = [v11 rawIV];
    v17 = objc_msgSend(v15, "psso_initWithBase64URLEncodedString:", v16);

    if (!v17)
    {
      __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_46();
      LOBYTE(v23) = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    id v18 = objc_alloc(MEMORY[0x263EFF8F8]);
    v19 = [v11 rawCipherText];
    v20 = objc_msgSend(v18, "psso_initWithBase64URLEncodedString:", v19);

    if (!v20)
    {
      __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_52();
      LOBYTE(v23) = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

      goto LABEL_29;
    }
    id v21 = objc_alloc(MEMORY[0x263EFF8F8]);
    v22 = [v11 rawAuthenticationTag];
    objc_msgSend(v21, "psso_initWithBase64URLEncodedString:", v22);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    id v72 = v23;
    if (v23)
    {
      v24 = [v11 decodedHeader];
      v25 = [v24 epk];

      if (v25)
      {
        v70 = v20;
        CFErrorRef error = 0;
        v26 = (__SecKey *)[v11 decodeEphemeralPublicKey];
        if (!v26)
        {
          uint64_t v27 = *MEMORY[0x263F16F98];
          v79[0] = *MEMORY[0x263F16FA8];
          v79[1] = v27;
          v80[0] = *MEMORY[0x263F16FB8];
          v80[1] = &unk_2707DBBC8;
          v79[2] = *MEMORY[0x263F16F50];
          v80[2] = MEMORY[0x263EFFA80];
          CFDictionaryRef v28 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:3];
          v29 = SecKeyCreateRandomKey(v28, &error);
          if (v29)
          {
            v30 = v29;
            v26 = SecKeyCopyPublicKey(v29);
            CFRelease(v30);
          }
          else
          {
            v26 = 0;
          }
        }
        uint64_t v77 = *MEMORY[0x263F173D8];
        v78 = &unk_2707DBBC8;
        CFDictionaryRef v32 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        if (!v26
          || (CFDataRef v33 = SecKeyCopyKeyExchangeResult(a4, (SecKeyAlgorithm)*MEMORY[0x263F17280], v26, v32, &error),
              CFRelease(v26),
              (CFDataRef v71 = v33) == 0))
        {
          v75[0] = MEMORY[0x263EF8330];
          v75[1] = 3221225472;
          v75[2] = __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_72;
          v75[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v75[4] = error;
          __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_72((uint64_t)v75);
          *a9 = (id)objc_claimAutoreleasedReturnValue();
          v34 = [MEMORY[0x263EFF990] dataWithLength:32];
          v35 = (const __SecRandom *)*MEMORY[0x263F17510];
          CFDataRef v71 = v34;
          SecRandomCopyBytes(v35, 0x20uLL, (void *)[(__CFData *)v71 mutableBytes]);
        }
        objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(v20, "length"));
        id v64 = (id)objc_claimAutoreleasedReturnValue();
        v36 = [v11 decodedHeader];
        v37 = [v36 enc];
        v69 = [v37 dataUsingEncoding:1];

        id v38 = objc_alloc(MEMORY[0x263EFF8F8]);
        v39 = [v11 decodedHeader];
        v40 = [v39 apu];
        v68 = objc_msgSend(v38, "psso_initWithBase64URLEncodedString:", v40);

        id v41 = objc_alloc(MEMORY[0x263EFF8F8]);
        v42 = v41;
        CFDictionaryRef v67 = v32;
        if (v12)
        {
          uint64_t v43 = objc_msgSend(v41, "psso_initWithBase64URLEncodedString:", v12);
        }
        else
        {
          v44 = [v11 decodedHeader];
          v45 = [v44 apv];
          uint64_t v43 = objc_msgSend(v42, "psso_initWithBase64URLEncodedString:", v45);
        }
        v66 = (void *)v43;
        id v23 = +[POConcatKDF concatKDFWithKey:v71 algorithm:v69 partyUInfo:v68 partyVInfo:v43];
        [v23 bytes];
        [v23 length];
        id v46 = v17;
        [v46 bytes];
        [v46 length];
        id v47 = v14;
        [v47 bytes];
        [v47 length];
        id v48 = v20;
        [v48 bytes];
        uint64_t v49 = [v48 length];
        id v65 = v64;
        uint64_t v50 = [v65 mutableBytes];
        id v51 = v72;
        uint64_t v52 = [v51 bytes];
        uint64_t v63 = [v51 length];
        uint64_t v62 = v50;
        int v53 = CCCryptorGCMOneshotDecrypt();
        id v54 = v23;
        memset_s(objc_msgSend(v54, "mutableBytes", v49, v62, v52, v63), objc_msgSend(v54, "length"), 0, objc_msgSend(v54, "length"));
        LOBYTE(v23) = v53 == 0;
        if (v53)
        {
          v73[0] = MEMORY[0x263EF8330];
          v73[1] = 3221225472;
          v73[2] = __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_79;
          v73[3] = &__block_descriptor_36_e14___NSError_8__0l;
          int v74 = v53;
          __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_79((uint64_t)v73);
          id v55 = (id)objc_claimAutoreleasedReturnValue();
          v56 = a9;
          v57 = v65;
        }
        else
        {
          CFAllocatorRef Default = CFAllocatorGetDefault();
          CFAllocatorRef v59 = (const __CFAllocator *)SecCFAllocatorZeroize();
          CFAllocatorSetDefault(v59);
          v57 = v65;
          v60 = objc_msgSend(v65, "psso_base64URLEncodedString");
          [v11 setRawBody:v60];

          CFAllocatorSetDefault(Default);
          [v11 updateDecodedBody];
          id v55 = 0;
          v56 = a9;
        }
        id *v56 = v55;

        v20 = v70;
        goto LABEL_27;
      }
      __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_64();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v23) = 0;
    }
    else
    {
      __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_58();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a9 = v31;
LABEL_27:

    goto LABEL_28;
  }
  __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke();
  LOBYTE(v23) = 0;
  *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return (char)v23;
}

- (id)encodeAndEncryptJWT:(id)a3 publicKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPrivateKey:(__SecKey *)a8 auth_kid:(id)a9 error:(id *)a10
{
  v127[3] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v15 = [v13 header];

  if (!v15)
  {
    __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke();
    id v41 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  v115 = a10;
  v16 = [v13 header];
  [(POJWTEncryptionECDHE_A256GCM *)self addValuesToHeader:v16];

  v17 = [v13 header];
  id v18 = [v17 kid];
  uint64_t v19 = [v18 length];

  if (!v19)
  {
    CFDataRef v20 = SecKeyCopyExternalRepresentation(a4, 0);
    id v21 = [(__CFData *)v20 psso_sha256Hash];
    v22 = [v21 base64EncodedStringWithOptions:0];
    id v23 = [v13 header];
    [v23 setKid:v22];
  }
  CFErrorRef error = 0;
  uint64_t v24 = *MEMORY[0x263F16FB8];
  uint64_t v25 = *MEMORY[0x263F16F98];
  v126[0] = *MEMORY[0x263F16FA8];
  v126[1] = v25;
  v127[0] = v24;
  v127[1] = &unk_2707DBBC8;
  v126[2] = *MEMORY[0x263F16F50];
  v127[2] = MEMORY[0x263EFFA80];
  CFDictionaryRef v26 = [NSDictionary dictionaryWithObjects:v127 forKeys:v126 count:3];
  uint64_t v27 = SecKeyCreateRandomKey(v26, &error);
  if (v27)
  {
    CFDictionaryRef v28 = v27;
    SecKeyRef v29 = SecKeyCopyPublicKey(v27);
    if (v29)
    {
      v30 = v29;
      id v31 = [v13 header];
      [v31 addEphemeralPublicKey:v30];

      CFDataRef v32 = SecKeyCopyExternalRepresentation(v30, &error);
      CFRelease(v30);
      if (!v32)
      {
        CFRelease(v28);
        v121[0] = MEMORY[0x263EF8330];
        v121[1] = 3221225472;
        v121[2] = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_100;
        v121[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v121[4] = error;
        __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_100((uint64_t)v121);
        id v41 = 0;
        void *v115 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

        goto LABEL_41;
      }
      id v114 = v14;
      CFDataRef v33 = [@"APPLE" dataUsingEncoding:4];
      id v34 = objc_alloc_init(MEMORY[0x263EFF990]);
      unsigned int v120 = bswap32([v33 length]);
      [v34 appendBytes:&v120 length:4];
      v113 = v33;
      [v34 appendData:v33];
      unsigned int v119 = bswap32([(__CFData *)v32 length]);
      [v34 appendBytes:&v119 length:4];
      [v34 appendData:v32];
      v35 = objc_msgSend(v34, "psso_base64URLEncodedString");
      v36 = [v13 header];
      [v36 setApu:v35];

      uint64_t v124 = *MEMORY[0x263F173D8];
      v125 = &unk_2707DBBC8;
      CFDictionaryRef v37 = [NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
      CFDataRef v38 = SecKeyCopyKeyExchangeResult(v28, (SecKeyAlgorithm)*MEMORY[0x263F17280], a4, v37, &error);
      CFRelease(v28);
      if (!v38)
      {
        v118[0] = MEMORY[0x263EF8330];
        v118[1] = 3221225472;
        v118[2] = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_107;
        v118[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v118[4] = error;
        __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_107((uint64_t)v118);
        id v41 = 0;
        void *v115 = (id)objc_claimAutoreleasedReturnValue();
        v42 = v113;
        goto LABEL_39;
      }
      uint64_t v39 = [v13 setRawEncryptedKey:&stru_2707C1488];
      MEMORY[0x270FA5388](v39);
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 0xCuLL, v92))
      {
        __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_114();
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        id v41 = 0;
        void *v115 = v40;
        v42 = v113;
LABEL_39:

        id v14 = v114;
        goto LABEL_40;
      }
      v44 = [MEMORY[0x263EFF8F8] dataWithBytes:v92 length:12];
      v45 = objc_msgSend(v44, "psso_base64URLEncodedString");
      [v13 setRawIV:v45];

      id v41 = [v13 rawIV];

      if (!v41)
      {
        __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_120();
        id v53 = (id)objc_claimAutoreleasedReturnValue();
        void *v115 = v53;
        v42 = v113;
LABEL_38:

        goto LABEL_39;
      }
      id v46 = [v13 header];
      id v47 = [v46 dataRepresentation];

      id v48 = objc_msgSend(v47, "psso_base64URLEncodedString");
      [v13 setRawHeader:v48];

      id v41 = [v13 rawHeader];

      id v112 = v47;
      if (!v41)
      {
        __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_126();
        id v54 = (id)objc_claimAutoreleasedReturnValue();
        void *v115 = v54;
        v42 = v113;
LABEL_37:

        goto LABEL_38;
      }
      v111 = v44;
      uint64_t v49 = [v13 body];

      if (v49)
      {
        uint64_t v50 = [v13 body];
        id v51 = [v50 dataRepresentation];
        uint64_t v52 = (void *)[v51 mutableCopy];
      }
      else
      {
        id v55 = [v13 bodyData];

        if (!v55) {
          goto LABEL_27;
        }
        uint64_t v50 = [v13 bodyData];
        uint64_t v52 = (void *)[v50 mutableCopy];
      }

      if (v52)
      {
        v56 = [v13 rawHeader];
        id v108 = [v56 dataUsingEncoding:1];

        id v107 = [MEMORY[0x263EFF990] dataWithLength:16];
        id v105 = v52;
        objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(v52, "length"));
        id v106 = (id)objc_claimAutoreleasedReturnValue();
        v57 = [v13 header];
        v58 = [v57 enc];
        id v110 = [v58 dataUsingEncoding:1];

        id v59 = objc_alloc(MEMORY[0x263EFF8F8]);
        v60 = [v13 header];
        v61 = [v60 apu];
        objc_msgSend(v59, "psso_initWithBase64URLEncodedString:", v61);
        id v109 = (id)objc_claimAutoreleasedReturnValue();

        id v62 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v63 = v62;
        if (v114)
        {
          id v64 = objc_msgSend(v62, "psso_initWithBase64URLEncodedString:");
        }
        else
        {
          id v104 = [v13 header];
          v66 = [v104 apv];
          id v64 = objc_msgSend(v63, "psso_initWithBase64URLEncodedString:", v66);
        }
        id v104 = v64;
        CFDictionaryRef v67 = +[POConcatKDF concatKDFWithKey:v38 algorithm:v110 partyUInfo:v109 partyVInfo:v64];
        v68 = v111;
        id v103 = v67;
        if (v67)
        {
          id v69 = v67;
          v102 = v69;
          v101 = (void *)[v69 bytes];
          id v100 = (id)[v69 length];
          id v70 = v68;
          [v70 bytes];
          uint64_t v99 = [v70 length];
          id v71 = v108;
          uint64_t v98 = [v71 bytes];
          uint64_t v97 = [v71 length];
          id v72 = v105;
          uint64_t v96 = [v72 bytes];
          uint64_t v95 = [v72 length];
          id v94 = v106;
          [v94 mutableBytes];
          id v93 = v107;
          [v93 mutableBytes];
          int v73 = CCCryptorGCMOneshotEncrypt();
          id v74 = v72;
          v101 = (void *)[v74 mutableBytes];
          rsize_t v75 = [v74 length];
          rsize_t v76 = [v74 length];
          memset_s(v101, v75, 0, v76);
          uint64_t v77 = v102;
          v102 = (void *)[v77 mutableBytes];
          rsize_t v78 = [v77 length];
          rsize_t v79 = [v77 length];
          memset_s(v102, v78, 0, v79);
          if (v73)
          {
            v116[0] = MEMORY[0x263EF8330];
            v116[1] = 3221225472;
            v116[2] = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_144;
            v116[3] = &__block_descriptor_36_e14___NSError_8__0l;
            int v117 = v73;
            __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_144((uint64_t)v116);
            id v80 = (id)objc_claimAutoreleasedReturnValue();
            id v41 = 0;
            void *v115 = v80;
          }
          else
          {
            v86 = objc_msgSend(v94, "psso_base64URLEncodedString");
            [v13 setRawCipherText:v86];

            v87 = objc_msgSend(v93, "psso_base64URLEncodedString");
            [v13 setRawAuthenticationTag:v87];

            void *v115 = 0;
            v101 = NSString;
            v115 = [v13 rawHeader];
            v102 = [v13 rawEncryptedKey];
            v88 = [v13 rawIV];
            v89 = [v13 rawCipherText];
            id v100 = v89;
            v90 = [v13 rawAuthenticationTag];
            id v41 = [v101 stringWithFormat:@"%@.%@.%@.%@.%@", v115, v102, v88, v89, v90];
          }
          id v82 = v105;
        }
        else
        {
          __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_138();
          id v81 = (id)objc_claimAutoreleasedReturnValue();
          void *v115 = v81;
          id v82 = v105;
          id v83 = v105;
          v115 = (void *)[v83 mutableBytes];
          rsize_t v84 = [v83 length];
          rsize_t v85 = [v83 length];
          memset_s(v115, v84, 0, v85);
          id v41 = 0;
        }

        goto LABEL_36;
      }
LABEL_27:
      __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_132();
      id v65 = (id)objc_claimAutoreleasedReturnValue();
      id v41 = 0;
      void *v115 = v65;
LABEL_36:
      v42 = v113;
      v44 = v111;
      goto LABEL_37;
    }
    CFRelease(v28);
    uint64_t v43 = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_94();
  }
  else
  {
    v122[0] = MEMORY[0x263EF8330];
    v122[1] = 3221225472;
    v122[2] = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_90;
    v122[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v122[4] = error;
    uint64_t v43 = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_90((uint64_t)v122);
  }
  id v41 = 0;
  void *v115 = v43;
LABEL_41:

LABEL_42:
  return v41;
}

- (NSNumber)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void).cxx_destruct
{
}

@end