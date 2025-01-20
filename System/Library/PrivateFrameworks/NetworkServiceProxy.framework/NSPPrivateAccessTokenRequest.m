@interface NSPPrivateAccessTokenRequest
- (id)initWithChallenge:(void *)a3 tokenKey:(void *)a4 originNameKey:(void *)a5 selectedOrigin:(void *)a6 blindedMessage:;
- (void)dealloc;
@end

@implementation NSPPrivateAccessTokenRequest

- (void)dealloc
{
  if (self)
  {
    ephemeralPrivateKey = self->_ephemeralPrivateKey;
    if (ephemeralPrivateKey)
    {
      CFRelease(ephemeralPrivateKey);
      self->_ephemeralPrivateKey = 0;
    }
    hpkeContext = self->_hpkeContext;
    if (hpkeContext)
    {
      free(hpkeContext);
      self->_hpkeContext = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NSPPrivateAccessTokenRequest;
  [(NSPPrivateAccessTokenRequest *)&v5 dealloc];
}

- (id)initWithChallenge:(void *)a3 tokenKey:(void *)a4 originNameKey:(void *)a5 selectedOrigin:(void *)a6 blindedMessage:
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (!a1)
  {
    id v36 = 0;
    goto LABEL_47;
  }
  if (!v11)
  {
    v37 = nplog_obj();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)md = 136315138;
    *(void *)&md[4] = "-[NSPPrivateAccessTokenRequest initWithChallenge:tokenKey:originNameKey:selectedOrigin:blindedMessage:]";
    v128 = "%s called with null challenge";
    goto LABEL_116;
  }
  if (!v12)
  {
    v37 = nplog_obj();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)md = 136315138;
    *(void *)&md[4] = "-[NSPPrivateAccessTokenRequest initWithChallenge:tokenKey:originNameKey:selectedOrigin:blindedMessage:]";
    v128 = "%s called with null tokenKey";
    goto LABEL_116;
  }
  if (!v15)
  {
    v37 = nplog_obj();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)md = 136315138;
    *(void *)&md[4] = "-[NSPPrivateAccessTokenRequest initWithChallenge:tokenKey:originNameKey:selectedOrigin:blindedMessage:]";
    v128 = "%s called with null blindedMessage";
    goto LABEL_116;
  }
  if (([v11 isSupportedTokenType] & 1) == 0)
  {
    v37 = nplog_obj();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)md = 136315138;
    *(void *)&md[4] = "-[NSPPrivateAccessTokenRequest initWithChallenge:tokenKey:originNameKey:selectedOrigin:blindedMessage:]";
    v128 = "%s called with null challenge.isSupportedTokenType";
    goto LABEL_116;
  }
  if ([v11 tokenType] == 3)
  {
    v17 = [v11 originName];

    if (v17)
    {
      if (v13) {
        goto LABEL_9;
      }
      v37 = nplog_obj();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)md = 136315138;
      *(void *)&md[4] = "-[NSPPrivateAccessTokenRequest initWithChallenge:tokenKey:originNameKey:selectedOrigin:blindedMessage:]";
      v128 = "%s called with null issuerEncapKey";
    }
    else
    {
      v37 = nplog_obj();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)md = 136315138;
      *(void *)&md[4] = "-[NSPPrivateAccessTokenRequest initWithChallenge:tokenKey:originNameKey:selectedOrigin:blindedMessage:]";
      v128 = "%s called with null challenge.originName";
    }
LABEL_116:
    _os_log_fault_impl(&dword_1A0FEE000, v37, OS_LOG_TYPE_FAULT, v128, md, 0xCu);
    goto LABEL_23;
  }
LABEL_9:
  v148.receiver = (id)a1;
  v148.super_class = (Class)NSPPrivateAccessTokenRequest;
  v18 = objc_msgSendSuper2(&v148, sel_init);
  if (!v18)
  {
    a1 = nplog_obj();
    if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)md = 0;
      _os_log_fault_impl(&dword_1A0FEE000, (os_log_t)a1, OS_LOG_TYPE_FAULT, "[super init] failed", md, 2u);
    }
    goto LABEL_24;
  }
  a1 = (uint64_t)v18;
  v18[5] = [v11 tokenType];
  v19 = [v11 originNames];
  unint64_t v20 = [v19 count];

  if (!v14 || v20 < 2)
  {
    v24 = [v11 originName];
    objc_setProperty_atomic((id)a1, v25, v24, 56);

LABEL_15:
    memset(md, 0, sizeof(md));
    CC_SHA256((const void *)[v12 bytes], objc_msgSend(v12, "length"), md);
    unsigned __int8 v147 = md[31];
    *(unsigned char *)(a1 + 9) = md[31];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    __int16 v146 = __rev16(*(unsigned __int16 *)(a1 + 10));
    [v26 appendBytes:&v146 length:2];
    objc_setProperty_atomic((id)a1, v27, v16, 32);
    if (*(_WORD *)(a1 + 10) != 3)
    {
      [v26 appendBytes:&v147 length:1];
      [v26 appendData:v16];
LABEL_20:
      objc_setProperty_atomic((id)a1, v35, v26, 24);
      id v36 = (id)a1;
LABEL_45:

      goto LABEL_46;
    }
    id v145 = v13;
    id v28 = v13;
    unint64_t v29 = [v28 length];
    uint64_t v30 = [v28 bytes];
    if (v29 <= 0x26)
    {
      v31 = nplog_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v29;
        v32 = "Config length is too short: %zu";
        v33 = v31;
        uint32_t v34 = 12;
LABEL_42:
        _os_log_error_impl(&dword_1A0FEE000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
      }
LABEL_43:
      id v13 = v145;

      v58 = nplog_obj();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
LABEL_44:

        id v36 = 0;
        goto LABEL_45;
      }
      *(_WORD *)buf = 0;
      v60 = "Failed to parse origin name key";
      goto LABEL_49;
    }
    uint64_t v38 = v30;
    if (*(_WORD *)(v30 + 1) == 0x2000)
    {
      if (*(_WORD *)(v30 + 35) == 256)
      {
        if (*(_WORD *)(v30 + 37) == 256)
        {
          *(unsigned char *)(a1 + 8) = *(unsigned char *)v30;
          *(_WORD *)(a1 + 12) = *(_WORD *)(v30 + 1);
          *(_WORD *)(a1 + 14) = *(_WORD *)(v30 + 35);
          *(_WORD *)(a1 + 16) = *(_WORD *)(v30 + 37);
          v39 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v30 + 3 length:32];
          objc_setProperty_atomic((id)a1, v40, v39, 40);

          if (objc_getProperty((id)a1, v41, 72, 1)) {
            goto LABEL_29;
          }
          v63 = (__SecKey *)+[NSPPrivateAccessTokenClientState clientPrivateKey]();
          if (v63)
          {
            SecKeyRef v64 = SecKeyCopyPublicKey(v63);
            if (v64)
            {
              SecKeyRef v65 = v64;
              *(void *)&long long v160 = *MEMORY[0x1E4F3B718];
              uint64_t v66 = *MEMORY[0x1E4F3B740];
              *((void *)&v160 + 1) = *MEMORY[0x1E4F3B708];
              *(void *)buf = v66;
              *(void *)&buf[8] = &unk_1EF43BD48;
              CFDictionaryRef v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v160 count:2];
              SecKeyRef RandomKey = SecKeyCreateRandomKey(v67, 0);
              if (RandomKey)
              {
                CFDictionaryRef v138 = v67;
                SecKeyRef v69 = RandomKey;
                id v70 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
                __int16 v155 = __rev16(*(unsigned __int16 *)(a1 + 10));
                [v70 appendBytes:&v155 length:2];
                [v70 appendBytes:"ClientBlind" length:11];
                id v149 = 0;
                SecKeyRef cfa = v69;
                v71 = (const void *)[MEMORY[0x1E4F5E528] blindPublicKey:v65 withPrivateKey:v69 context:v70 error:&v149];
                id v143 = v149;
                CFRelease(v65);
                if (v71)
                {
                  v72 = [MEMORY[0x1E4F5E528] compressedRepresentationFromSecKey:v71];
                  objc_setProperty_atomic((id)a1, v73, v72, 72);

                  CFRelease(v71);
                  if (objc_getProperty((id)a1, v74, 72, 1))
                  {
                    *(void *)(a1 + 88) = cfa;

LABEL_29:
                    objc_msgSend(v26, "appendData:", objc_getProperty((id)a1, v42, 72, 1));
                    *(_OWORD *)buf = 0u;
                    long long v157 = 0u;
                    CC_SHA256((const void *)[v28 bytes], objc_msgSend(v28, "length"), buf);
                    v43 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:32];
                    objc_setProperty_atomic((id)a1, v44, v43, 48);

                    objc_msgSend(v26, "appendData:", objc_getProperty((id)a1, v45, 48, 1));
                    id v47 = objc_getProperty((id)a1, v46, 40, 1);
                    if (!v47)
                    {
                      v129 = nplog_obj();
                      if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT))
                      {
                        LODWORD(v160) = 136315138;
                        *(void *)((char *)&v160 + 4) = "-[NSPPrivateAccessTokenRequest encryptTokenRequest]";
                        _os_log_fault_impl(&dword_1A0FEE000, v129, OS_LOG_TYPE_FAULT, "%s called with null issuerEncapKey", (uint8_t *)&v160, 0xCu);
                      }

                      v54 = 0;
                      id v13 = v145;
                      goto LABEL_34;
                    }
                    v48 = v47;
                    cchpke_params_x25519_AESGCM128_HKDF_SHA256();
                    size_t v142 = cchpke_params_sizeof_kem_enc();
                    cf = malloc_type_calloc(1uLL, 0x60uLL, 0x10600407D690DC1uLL);
                    v49 = malloc_type_calloc(1uLL, v142, 0xA84F7AE9uLL);
                    *(_DWORD *)v159 = 0;
                    ccrng();
                    v137 = v48;
                    [v48 bytes];
                    int v50 = cchpke_initiator_setup();
                    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", v49, v142, v49);
                    objc_setProperty_atomic((id)a1, v52, v51, 104);

                    free(v49);
                    if (v50)
                    {
                      v53 = nplog_obj();
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                      {
                        LODWORD(v160) = 67109120;
                        DWORD1(v160) = v50;
                        _os_log_error_impl(&dword_1A0FEE000, v53, OS_LOG_TYPE_ERROR, "Setup error: %d", (uint8_t *)&v160, 8u);
                      }

                      free(cf);
                      id v13 = v145;
                      v54 = v48;
LABEL_34:

LABEL_78:
                      v58 = nplog_obj();
                      if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_44;
                      }
                      LOWORD(v160) = 0;
                      v60 = "Failed to encrypt the token request";
                      goto LABEL_80;
                    }
                    *(void *)(a1 + 96) = cf;
                    id v75 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
                    char v154 = *(unsigned char *)(a1 + 8);
                    [v75 appendBytes:&v154 length:1];
                    LOWORD(v149) = *(_WORD *)(a1 + 12);
                    [v75 appendBytes:&v149 length:2];
                    __int16 v155 = *(_WORD *)(a1 + 14);
                    [v75 appendBytes:&v155 length:2];
                    __int16 v153 = *(_WORD *)(a1 + 16);
                    [v75 appendBytes:&v153 length:2];
                    __int16 v152 = __rev16(*(unsigned __int16 *)(a1 + 10));
                    v144 = v75;
                    [v75 appendBytes:&v152 length:2];
                    objc_msgSend(v75, "appendData:", objc_getProperty((id)a1, v76, 72, 1));
                    objc_msgSend(v75, "appendData:", objc_getProperty((id)a1, v77, 48, 1));
                    id v78 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
                    char v151 = *(unsigned char *)(a1 + 9);
                    id v79 = v78;
                    id cfb = v78;
                    [v78 appendBytes:&v151 length:1];
                    objc_msgSend(v79, "appendData:", objc_getProperty((id)a1, v80, 32, 1));
                    id v132 = objc_getProperty((id)a1, v81, 56, 1);
                    v82 = (const char *)[v132 UTF8String];
                    size_t v83 = strlen(v82);
                    size_t v84 = v83;
                    uint64_t v85 = -(int)v83 & 0x1FLL;
                    if (!v83) {
                      uint64_t v85 = 32;
                    }
                    size_t v86 = v85 + v83;
                    v87 = malloc_type_calloc(1uLL, v85 + v83, 0x9E6B45D0uLL);
                    memcpy(v87, v82, v84);
                    __int16 v150 = bswap32(v86) >> 16;
                    [cfb appendBytes:&v150 length:2];
                    [cfb appendBytes:v87 length:v86];
                    free(v87);
                    v133 = malloc_type_calloc(1uLL, [cfb length], 0xE7BC633CuLL);
                    size_t v88 = cchpke_params_sizeof_aead_tag();
                    v135 = malloc_type_calloc(1uLL, v88, 0xD91403DCuLL);
                    [v144 length];
                    [v144 bytes];
                    [cfb length];
                    [cfb bytes];
                    size_t v131 = v88;
                    int v89 = cchpke_initiator_encrypt();
                    if (v89)
                    {
                      int v90 = v89;
                      v91 = cfb;
                      v92 = nplog_obj();
                      id v13 = v145;
                      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                      {
                        LODWORD(v160) = 67109120;
                        DWORD1(v160) = v90;
                        _os_log_error_impl(&dword_1A0FEE000, v92, OS_LOG_TYPE_ERROR, "Encrypt error: %d", (uint8_t *)&v160, 8u);
                      }

                      free(v135);
                      free(v133);
                      BOOL v93 = 0;
                      unint64_t v94 = 0x1E4F1C000;
                    }
                    else
                    {
                      id v97 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
                      objc_msgSend(v97, "appendData:", objc_getProperty((id)a1, v98, 104, 1));
                      v91 = cfb;
                      objc_msgSend(v97, "appendBytes:length:", v133, objc_msgSend(cfb, "length"));
                      [v97 appendBytes:v135 length:v131];
                      free(v135);
                      free(v133);
                      objc_setProperty_atomic((id)a1, v99, v97, 64);
                      id Property = objc_getProperty((id)a1, v100, 64, 1);
                      BOOL v136 = Property != 0;
                      id v13 = v145;
                      if (!Property)
                      {
                        v134 = v97;
                        v102 = nplog_obj();
                        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                        {
                          LOWORD(v160) = 0;
                          _os_log_error_impl(&dword_1A0FEE000, v102, OS_LOG_TYPE_ERROR, "Error creating encrypted token request", (uint8_t *)&v160, 2u);
                        }

                        id v97 = v134;
                      }

                      unint64_t v94 = 0x1E4F1C000uLL;
                      BOOL v93 = v136;
                    }

                    if (!v93) {
                      goto LABEL_78;
                    }
                    __int16 v153 = bswap32(objc_msgSend(objc_getProperty((id)a1, v103, 64, 1), "length")) >> 16;
                    [v26 appendBytes:&v153 length:2];
                    objc_msgSend(v26, "appendData:", objc_getProperty((id)a1, v104, 64, 1));
                    if (objc_getProperty((id)a1, v105, 72, 1))
                    {
                      if (objc_getProperty((id)a1, v106, 48, 1))
                      {
                        if (objc_getProperty((id)a1, v107, 64, 1))
                        {
                          if (*(void *)(a1 + 88))
                          {
                            uint64_t v108 = +[NSPPrivateAccessTokenClientState clientPrivateKey]();
                            if (v108)
                            {
                              uint64_t v109 = v108;
                              unint64_t v110 = v94;
                              id v111 = objc_alloc_init(*(Class *)(v94 + 2648));
                              LOWORD(v149) = __rev16(*(unsigned __int16 *)(a1 + 10));
                              [v111 appendBytes:&v149 length:2];
                              objc_msgSend(v111, "appendData:", objc_getProperty((id)a1, v112, 72, 1));
                              objc_msgSend(v111, "appendData:", objc_getProperty((id)a1, v113, 48, 1));
                              __int16 v155 = bswap32(objc_msgSend(objc_getProperty((id)a1, v114, 64, 1), "length")) >> 16;
                              [v111 appendBytes:&v155 length:2];
                              objc_msgSend(v111, "appendData:", objc_getProperty((id)a1, v115, 64, 1));
                              id v116 = objc_alloc_init(*(Class *)(v110 + 2648));
                              [v116 appendBytes:&v149 length:2];
                              [v116 appendBytes:"ClientBlind" length:11];
                              uint64_t v117 = *(void *)(a1 + 88);
                              *(void *)v159 = 0;
                              v118 = [MEMORY[0x1E4F5E528] blindSignMessage:v111 blindedBy:v117 withKey:v109 context:v116 error:v159];
                              id v119 = *(id *)v159;
                              objc_setProperty_atomic((id)a1, v120, v118, 80);

                              if (objc_getProperty((id)a1, v121, 80, 1))
                              {

                                objc_msgSend(v26, "appendData:", objc_getProperty((id)a1, v122, 80, 1));
                                id v13 = v145;
                                goto LABEL_20;
                              }
                              v127 = nplog_obj();
                              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                              {
                                LODWORD(v160) = 138412290;
                                *(void *)((char *)&v160 + 4) = v119;
                                _os_log_error_impl(&dword_1A0FEE000, v127, OS_LOG_TYPE_ERROR, "generate signature: SecKeyCopyExternalRepresentation failed: %@", (uint8_t *)&v160, 0xCu);
                              }

                              id v13 = v145;
LABEL_97:
                              v58 = nplog_obj();
                              if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
                                goto LABEL_44;
                              }
                              LOWORD(v160) = 0;
                              v60 = "Failed to generate the request signature";
LABEL_80:
                              v61 = (uint8_t *)&v160;
                              goto LABEL_50;
                            }
                            v124 = nplog_obj();
                            if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
                            {
                              LOWORD(v160) = 0;
                              _os_log_error_impl(&dword_1A0FEE000, v124, OS_LOG_TYPE_ERROR, "generate signature: Failed to access stored client key", (uint8_t *)&v160, 2u);
                            }
LABEL_90:

                            goto LABEL_97;
                          }
                          v124 = nplog_obj();
                          if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT))
                          {
                            LODWORD(v160) = 136315138;
                            *(void *)((char *)&v160 + 4) = "-[NSPPrivateAccessTokenRequest generateRequestSignature]";
                            v130 = "%s called with null self.ephemeralPrivateKey";
                            goto LABEL_130;
                          }
LABEL_131:
                          id v13 = v145;
                          goto LABEL_90;
                        }
                        v124 = nplog_obj();
                        if (!os_log_type_enabled(v124, OS_LOG_TYPE_FAULT)) {
                          goto LABEL_131;
                        }
                        LODWORD(v160) = 136315138;
                        *(void *)((char *)&v160 + 4) = "-[NSPPrivateAccessTokenRequest generateRequestSignature]";
                        v130 = "%s called with null self.encryptedTokenRequest";
                      }
                      else
                      {
                        v124 = nplog_obj();
                        if (!os_log_type_enabled(v124, OS_LOG_TYPE_FAULT)) {
                          goto LABEL_131;
                        }
                        LODWORD(v160) = 136315138;
                        *(void *)((char *)&v160 + 4) = "-[NSPPrivateAccessTokenRequest generateRequestSignature]";
                        v130 = "%s called with null self.issuerEncapKeyID";
                      }
                    }
                    else
                    {
                      v124 = nplog_obj();
                      if (!os_log_type_enabled(v124, OS_LOG_TYPE_FAULT)) {
                        goto LABEL_131;
                      }
                      LODWORD(v160) = 136315138;
                      *(void *)((char *)&v160 + 4) = "-[NSPPrivateAccessTokenRequest generateRequestSignature]";
                      v130 = "%s called with null self.requestKey";
                    }
LABEL_130:
                    _os_log_fault_impl(&dword_1A0FEE000, v124, OS_LOG_TYPE_FAULT, v130, (uint8_t *)&v160, 0xCu);
                    goto LABEL_131;
                  }
                  v125 = nplog_obj();
                  id v13 = v145;
                  CFDictionaryRef v126 = v138;
                  if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)v159 = 0;
                    _os_log_error_impl(&dword_1A0FEE000, v125, OS_LOG_TYPE_ERROR, "generate key: compressedRepresentationFromSecKey failed", v159, 2u);
                  }
                }
                else
                {
                  v125 = nplog_obj();
                  if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v159 = 138412290;
                    *(void *)&v159[4] = v143;
                    _os_log_error_impl(&dword_1A0FEE000, v125, OS_LOG_TYPE_ERROR, "generate key: blindPublicKey failed: %@", v159, 0xCu);
                  }
                  id v13 = v145;
                  CFDictionaryRef v126 = v138;
                }

                CFRelease(cfa);
              }
              else
              {
                CFRelease(v65);
                v123 = nplog_obj();
                if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v159 = 0;
                  _os_log_error_impl(&dword_1A0FEE000, v123, OS_LOG_TYPE_ERROR, "generate key: SecKeyCreateRandomKey failed", v159, 2u);
                }

                id v13 = v145;
              }
LABEL_83:
              v58 = nplog_obj();
              if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
                goto LABEL_44;
              }
              *(_WORD *)buf = 0;
              v60 = "Failed to generate the request key";
LABEL_49:
              v61 = buf;
LABEL_50:
              _os_log_error_impl(&dword_1A0FEE000, v58, OS_LOG_TYPE_ERROR, v60, v61, 2u);
              goto LABEL_44;
            }
            v95 = nplog_obj();
            if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
            {
LABEL_82:
              id v13 = v145;

              goto LABEL_83;
            }
            *(_WORD *)v159 = 0;
            v96 = "generate key: SecKeyCopyPublicKey failed";
          }
          else
          {
            v95 = nplog_obj();
            if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
              goto LABEL_82;
            }
            *(_WORD *)v159 = 0;
            v96 = "generate key: Failed to access stored client key";
          }
          _os_log_error_impl(&dword_1A0FEE000, v95, OS_LOG_TYPE_ERROR, v96, v159, 2u);
          goto LABEL_82;
        }
        v31 = nplog_obj();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        unsigned int v57 = bswap32(*(unsigned __int16 *)(v38 + 37)) >> 16;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v57;
        v32 = "AEAD %u is not supported";
      }
      else
      {
        v31 = nplog_obj();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        unsigned int v56 = bswap32(*(unsigned __int16 *)(v38 + 35)) >> 16;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v56;
        v32 = "KDF %u is not supported";
      }
    }
    else
    {
      v31 = nplog_obj();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      unsigned int v55 = bswap32(*(unsigned __int16 *)(v38 + 1)) >> 16;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v55;
      v32 = "KEM %u is not supported";
    }
    v33 = v31;
    uint32_t v34 = 8;
    goto LABEL_42;
  }
  v21 = [v11 originNames];
  char v22 = [v21 containsObject:v14];

  if (v22)
  {
    objc_setProperty_atomic((id)a1, v23, v14, 56);
    goto LABEL_15;
  }
  v37 = nplog_obj();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v62 = [v11 originNames];
    *(_DWORD *)md = 138412546;
    *(void *)&md[4] = v14;
    *(_WORD *)&md[12] = 2112;
    *(void *)&md[14] = v62;
    _os_log_error_impl(&dword_1A0FEE000, v37, OS_LOG_TYPE_ERROR, "Failed to find origin name %@ in %@", md, 0x16u);
  }
LABEL_23:

LABEL_24:
  id v36 = 0;
LABEL_46:

LABEL_47:
  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hpkeEnc, 0);
  objc_storeStrong((id *)&self->_requestSignature, 0);
  objc_storeStrong((id *)&self->_requestKey, 0);
  objc_storeStrong((id *)&self->_encryptedTokenRequest, 0);
  objc_storeStrong((id *)&self->_originName, 0);
  objc_storeStrong((id *)&self->_issuerEncapKeyID, 0);
  objc_storeStrong((id *)&self->_issuerEncapKey, 0);
  objc_storeStrong((id *)&self->_blindedRequest, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end