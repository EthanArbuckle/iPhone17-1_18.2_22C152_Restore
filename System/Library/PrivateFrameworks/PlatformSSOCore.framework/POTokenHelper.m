@interface POTokenHelper
+ (id)dataToHex:(id)a3;
- (BOOL)canTokenIdLogin:(id)a3 pubKeyHash:(id)a4;
- (BOOL)insertTokenForUser:(id)a3;
- (BOOL)retrieveCertAndKeyForTokenId:(id)a3 context:(id)a4 certificate:(__SecCertificate *)a5 privateKey:(__SecKey *)a6;
- (BOOL)waitForTokenAvailable:(id)a3;
- (POTokenHelper)initWithIdentifierProvider:(id)a3;
- (POUserIdentifierProvider)userIdentifierProvider;
- (id)base64URLtokenHashForUser:(id)a3;
- (id)findInfoForTokenId:(id)a3;
- (id)findTokenIdForSmartCardAMUser:(id)a3 tokenHash:(id *)a4;
- (id)findTokenIdForSmartCardBoundUser:(id)a3 tokenHash:(id *)a4;
- (id)getDriverConfiguration;
- (id)getTokenInfo;
- (id)tokenHashDataForUser:(id)a3;
- (id)tokenHashForUser:(id)a3;
- (void)getDriverConfiguration;
- (void)getTokenInfo;
- (void)postAHPCacheRefreshNotification;
- (void)removeAllTokens;
- (void)removeTokenForUser:(id)a3;
- (void)setUserIdentifierProvider:(id)a3;
@end

@implementation POTokenHelper

- (POTokenHelper)initWithIdentifierProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POTokenHelper;
  v6 = [(POTokenHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userIdentifierProvider, a3);
  }

  return v7;
}

- (id)getDriverConfiguration
{
  v2 = [MEMORY[0x263F048E0] driverConfigurations];
  v3 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(POTokenHelper *)(uint64_t)v2 getDriverConfiguration];
  }

  v4 = [v2 objectForKeyedSubscript:@"com.apple.platformsso"];

  return v4;
}

- (BOOL)insertTokenForUser:(id)a3
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v139 = "-[POTokenHelper insertTokenForUser:]";
    __int16 v140 = 2114;
    id v141 = v4;
    __int16 v142 = 2112;
    v143 = self;
    _os_log_impl(&dword_259DFE000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", buf, 0x20u);
  }

  v6 = [POConfigurationCoreManager alloc];
  v7 = [(POTokenHelper *)self userIdentifierProvider];
  v8 = [(POConfigurationCoreManager *)v6 initWithUserName:v4 identifierProvider:v7 sharedOnly:1];

  objc_super v9 = [(POConfigurationCoreManager *)v8 currentUserConfiguration];
  v10 = v9;
  if (v9)
  {
    if ([v9 userDecryptionCertificate])
    {
      v11 = [v10 userDecryptionKeyHash];

      if (v11)
      {
        v12 = [v10 userUnlockData];

        v13 = [(POTokenHelper *)self getDriverConfiguration];
        v14 = v13;
        if (!v13)
        {
          v126[0] = MEMORY[0x263EF8330];
          v126[1] = 3221225472;
          v126[2] = __36__POTokenHelper_insertTokenForUser___block_invoke;
          v126[3] = &unk_265463860;
          id v127 = v4;
          id v79 = __36__POTokenHelper_insertTokenForUser___block_invoke((uint64_t)v126);
          BOOL v78 = 0;
          v26 = v127;
LABEL_49:

          goto LABEL_50;
        }
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        v15 = [v13 tokenConfigurations];
        v16 = [v15 allKeys];

        uint64_t v17 = [v16 countByEnumeratingWithState:&v122 objects:v137 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v123;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v123 != v19) {
                objc_enumerationMutation(v16);
              }
              [v14 removeTokenConfigurationForTokenInstanceID:*(void *)(*((void *)&v122 + 1) + 8 * i)];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v122 objects:v137 count:16];
          }
          while (v18);
        }

        [v14 removeTokenConfigurationForTokenInstanceID:v4];
        v21 = [v10 userDecryptionKeyHash];
        v22 = +[POTokenHelper dataToHex:v21];
        [v14 removeTokenConfigurationForTokenInstanceID:v22];

        v23 = [v14 tokenConfigurations];
        v24 = [v10 userDecryptionKeyHash];
        v25 = +[POTokenHelper dataToHex:v24];
        v26 = [v23 objectForKeyedSubscript:v25];

        if (v26) {
          goto LABEL_16;
        }
        v27 = [v10 userDecryptionKeyHash];
        v28 = +[POTokenHelper dataToHex:v27];
        v26 = [v14 addTokenConfigurationForTokenInstanceID:v28];

        if (v26)
        {
LABEL_16:
          if (v12)
          {
            v29 = PO_LOG_POTokenHelper();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              -[POTokenHelper insertTokenForUser:]();
            }

            v30 = objc_alloc_init(POMutableTokenConfigJWTBody);
            v31 = [v10 userUnlockData];
            [(POMutableTokenConfigJWTBody *)v30 setUnlockData:v31];

            v32 = [v10 userUnlockHash];
            v33 = +[POTokenHelper dataToHex:v32];
            [(POMutableTokenConfigJWTBody *)v30 setUnlockHash:v33];

            v34 = [v10 unlockTokenId];
            [(POMutableTokenConfigJWTBody *)v30 setIdpTokenId:v34];

            v114 = v30;
            v35 = [(_POJWTBodyBase *)v30 dataRepresentation];
            [v26 setConfigurationData:v35];

            uint64_t v36 = [v10 userDecryptionCertificate];
            id v37 = objc_alloc(MEMORY[0x263F048E8]);
            v38 = NSString;
            v39 = [v10 uniqueIdentifier];
            v40 = [v38 stringWithFormat:@"certificate:%@", v39];
            uint64_t v41 = [v37 initWithCertificate:v36 objectID:v40];

            id v42 = objc_alloc(MEMORY[0x263F048F0]);
            v43 = [v10 userDecryptionKeyHash];
            v44 = (void *)[v42 initWithCertificate:v36 objectID:v43];

            v45 = [v10 userDecryptionKeyHash];
            [v44 setApplicationTag:v45];

            [v44 setSuitableForLogin:1];
            [v44 setCanDecrypt:1];
            [v44 setCanSign:1];
            [v44 setCanPerformKeyExchange:1];
            v135[0] = &unk_2707DBBE0;
            v135[1] = &unk_2707DBBF8;
            v136[0] = @"TOKENS";
            v136[1] = @"TOKENS";
            v46 = [NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:2];
            [v44 setConstraints:v46];

            v115 = (void *)v41;
            v134[0] = v41;
            v134[1] = v44;
            v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v134 count:2];
            [v26 setKeychainItems:v47];

            v48 = [v14 tokenConfigurations];
            v49 = [v10 userUnlockHash];
            v50 = +[POTokenHelper dataToHex:v49];
            v51 = [v48 objectForKeyedSubscript:v50];

            if (v51) {
              goto LABEL_21;
            }
            v52 = [v10 userUnlockHash];
            v53 = +[POTokenHelper dataToHex:v52];
            v51 = [v14 addTokenConfigurationForTokenInstanceID:v53];

            if (v51)
            {
LABEL_21:
              v54 = objc_alloc_init(POMutableTokenConfigJWTBody);
              [(POMutableTokenConfigJWTBody *)v54 setUserName:v4];
              v55 = [v10 userLoginConfiguration];
              uint64_t v56 = [v55 loginUserName];
              v57 = (void *)v56;
              if (v56) {
                id v58 = (id)v56;
              }
              else {
                id v58 = v4;
              }
              [(POMutableTokenConfigJWTBody *)v54 setLoginUserName:v58];

              v59 = [(_POJWTBodyBase *)v54 dataRepresentation];
              [v51 setConfigurationData:v59];

              v60 = (__SecCertificate *)[v10 userUnlockCertificate];
              if (v60)
              {
                SecKeyRef v61 = SecCertificateCopyKey(v60);
                if (v61)
                {
                  v62 = v61;
                  uint64_t v113 = +[POSecKeyHelper dataForEphemeralKey:v61];
                  if (v113)
                  {
                    v111 = v54;
                    CFDictionaryRef v63 = SecKeyCopyAttributes(v62);
                    CFRelease(v62);
                    CFDictionaryRef v112 = v63;
                    if (v63)
                    {
                      id v109 = objc_alloc(MEMORY[0x263F048F0]);
                      v64 = [v10 userUnlockHash];
                      v65 = +[POTokenHelper dataToHex:v64];
                      v110 = (void *)[v109 initWithCertificate:0 objectID:v65];

                      v66 = [(__CFDictionary *)v63 objectForKeyedSubscript:*MEMORY[0x263F175A8]];
                      [v110 setPublicKeyData:v66];

                      v67 = [(__CFDictionary *)v63 objectForKeyedSubscript:*MEMORY[0x263F16EE0]];
                      [v110 setPublicKeyHash:v67];

                      v68 = [(__CFDictionary *)v63 objectForKeyedSubscript:*MEMORY[0x263F16FA8]];
                      [v110 setKeyType:v68];

                      CFDictionaryRef v69 = v63;
                      v70 = v110;
                      v71 = [(__CFDictionary *)v69 objectForKeyedSubscript:*MEMORY[0x263F16F98]];
                      objc_msgSend(v110, "setKeySizeInBits:", objc_msgSend(v71, "unsignedIntegerValue"));

                      v72 = [v10 userUnlockHash];
                      v73 = +[POTokenHelper dataToHex:v72];
                      [v110 setLabel:v73];

                      [v110 setCanDecrypt:1];
                      [v110 setCanPerformKeyExchange:1];
                      v74 = [@"idp" dataUsingEncoding:4];
                      [v110 setApplicationTag:v74];

                      v132 = &unk_2707DBBE0;
                      v133 = @"TOKENS";
                      v75 = [NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
                      [v110 setConstraints:v75];

                      v131 = v110;
                      v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v131 count:1];
                      [v51 setKeychainItems:v76];

                      int v77 = 0;
                    }
                    else
                    {
                      id v116 = v10;
                      id v107 = __36__POTokenHelper_insertTokenForUser___block_invoke_78();
                      int v77 = 1;
                      v70 = v116;
                    }
                    v101 = v114;

                    v54 = v111;
                    CFDictionaryRef v106 = v112;
                  }
                  else
                  {
                    CFRelease(v62);
                    CFDictionaryRef v117 = v10;
                    id v105 = __36__POTokenHelper_insertTokenForUser___block_invoke_74();
                    int v77 = 1;
                    CFDictionaryRef v106 = v117;
                    v101 = v114;
                  }

                  v100 = (void *)v113;
                }
                else
                {
                  id v118 = v10;
                  id v103 = __36__POTokenHelper_insertTokenForUser___block_invoke_69();
                  int v77 = 1;
                  v100 = v118;
                  v101 = v114;
                }
              }
              else
              {
                id v119 = v10;
                id v99 = __36__POTokenHelper_insertTokenForUser___block_invoke_65();
                int v77 = 1;
                v100 = v119;
                v101 = v114;
              }
            }
            else
            {
              id v120 = v10;
              id v104 = __36__POTokenHelper_insertTokenForUser___block_invoke_61();
              int v77 = 1;
              v51 = v120;
              v101 = v114;
            }

            if (v77) {
              goto LABEL_47;
            }
          }
          else
          {
            v80 = objc_alloc_init(POMutableTokenConfigJWTBody);
            [(POMutableTokenConfigJWTBody *)v80 setUserName:v4];
            v81 = [v10 userLoginConfiguration];
            uint64_t v82 = [v81 loginUserName];
            v83 = (void *)v82;
            if (v82) {
              id v84 = (id)v82;
            }
            else {
              id v84 = v4;
            }
            [(POMutableTokenConfigJWTBody *)v80 setLoginUserName:v84];

            v85 = [(_POJWTBodyBase *)v80 dataRepresentation];
            [v26 setConfigurationData:v85];

            uint64_t v86 = [v10 userDecryptionCertificate];
            id v87 = objc_alloc(MEMORY[0x263F048E8]);
            v88 = NSString;
            v89 = [v10 uniqueIdentifier];
            v90 = [v88 stringWithFormat:@"certificate:%@", v89];
            v91 = (void *)[v87 initWithCertificate:v86 objectID:v90];

            id v92 = objc_alloc(MEMORY[0x263F048F0]);
            v93 = [v10 userDecryptionKeyHash];
            v94 = (void *)[v92 initWithCertificate:v86 objectID:v93];

            v95 = [v10 userDecryptionKeyHash];
            v96 = +[POTokenHelper dataToHex:v95];
            [v94 setLabel:v96];

            [v94 setSuitableForLogin:1];
            [v94 setCanDecrypt:1];
            [v94 setCanSign:1];
            [v94 setCanPerformKeyExchange:1];
            v129 = &unk_2707DBBE0;
            v130 = @"TOKENS";
            v97 = [NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
            [v94 setConstraints:v97];

            v128[0] = v91;
            v128[1] = v94;
            v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:2];
            [v26 setKeychainItems:v98];
          }
          BOOL v78 = 1;
          goto LABEL_49;
        }
        id v121 = v10;
        id v102 = __36__POTokenHelper_insertTokenForUser___block_invoke_42();

LABEL_47:
        BOOL v78 = 0;
        goto LABEL_49;
      }
    }
  }
  v14 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[POTokenHelper insertTokenForUser:]();
  }
  BOOL v78 = 0;
LABEL_50:

  return v78;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke(uint64_t a1)
{
  v2 = +[POError errorWithCode:-1001 description:@"No driver config for user."];
  v3 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __36__POTokenHelper_insertTokenForUser___block_invoke_cold_1((uint64_t)v2, a1, v3);
  }

  return v2;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_42()
{
  v0 = +[POError errorWithCode:-1001 description:@"No token config for token id."];
  v1 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __36__POTokenHelper_insertTokenForUser___block_invoke_42_cold_1();
  }

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_61()
{
  v0 = +[POError errorWithCode:-1001 description:@"No unlock token config for idp token id."];
  v1 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __36__POTokenHelper_insertTokenForUser___block_invoke_61_cold_1();
  }

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_65()
{
  v0 = +[POError errorWithCode:-1005 description:@"Missing unlock certificate."];
  v1 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __36__POTokenHelper_insertTokenForUser___block_invoke_61_cold_1();
  }

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_69()
{
  v0 = +[POError errorWithCode:-1005 description:@"Missing unlock public key."];
  v1 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __36__POTokenHelper_insertTokenForUser___block_invoke_61_cold_1();
  }

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_74()
{
  v0 = +[POError errorWithCode:-1005 description:@"Missing unlock public key data."];
  v1 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __36__POTokenHelper_insertTokenForUser___block_invoke_61_cold_1();
  }

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_78()
{
  v0 = +[POError errorWithCode:-1005 description:@"Missing unlock public key attributes."];
  v1 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __36__POTokenHelper_insertTokenForUser___block_invoke_61_cold_1();
  }

  return v0;
}

- (void)removeTokenForUser:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    uint64_t v17 = "-[POTokenHelper removeTokenForUser:]";
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_259DFE000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", (uint8_t *)&v16, 0x20u);
  }

  v6 = [(POTokenHelper *)self getDriverConfiguration];
  v7 = v6;
  if (v6)
  {
    [v6 removeTokenConfigurationForTokenInstanceID:v4];
    v8 = [POConfigurationCoreManager alloc];
    objc_super v9 = [(POTokenHelper *)self userIdentifierProvider];
    v10 = [(POConfigurationCoreManager *)v8 initWithUserName:v4 identifierProvider:v9 sharedOnly:1];

    v11 = [v10 currentUserConfiguration];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 userDecryptionKeyHash];

      if (v13)
      {
        v14 = [v12 userDecryptionKeyHash];
        v15 = +[POTokenHelper dataToHex:v14];
        [v7 removeTokenConfigurationForTokenInstanceID:v15];
      }
    }
  }
  else
  {
    v10 = PO_LOG_POTokenHelper();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[POTokenHelper removeTokenForUser:]((uint64_t)v4, v10);
    }
  }
}

- (void)removeAllTokens
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "no driver config", v2, v3, v4, v5, v6);
}

- (id)tokenHashForUser:(id)a3
{
  uint64_t v3 = [(POTokenHelper *)self tokenHashDataForUser:a3];
  uint64_t v4 = +[POTokenHelper dataToHex:v3];

  return v4;
}

- (id)base64URLtokenHashForUser:(id)a3
{
  uint64_t v3 = [(POTokenHelper *)self tokenHashDataForUser:a3];
  uint64_t v4 = objc_msgSend(v3, "psso_base64URLEncodedString");

  return v4;
}

- (id)tokenHashDataForUser:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    int v16 = "-[POTokenHelper tokenHashDataForUser:]";
    __int16 v17 = 2114;
    id v18 = v4;
    __int16 v19 = 2112;
    __int16 v20 = self;
    _os_log_impl(&dword_259DFE000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", (uint8_t *)&v15, 0x20u);
  }

  uint8_t v6 = [POConfigurationCoreManager alloc];
  v7 = [(POTokenHelper *)self userIdentifierProvider];
  v8 = [(POConfigurationCoreManager *)v6 initWithUserName:v4 identifierProvider:v7 sharedOnly:1];

  objc_super v9 = [(POConfigurationCoreManager *)v8 currentUserConfiguration];
  v10 = v9;
  if (v9
    && [v9 userDecryptionCertificate]
    && ([v10 userDecryptionKeyHash],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    if ([v10 userDecryptionCertificate])
    {
      v12 = (void *)SecCertificateCopyPublicKeySHA1Digest();
      goto LABEL_11;
    }
    v13 = PO_LOG_POTokenHelper();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[POTokenHelper tokenHashDataForUser:]();
    }
  }
  else
  {
    v13 = PO_LOG_POTokenHelper();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[POTokenHelper insertTokenForUser:]();
    }
  }

  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)dataToHex:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 length];
    uint8_t v6 = [MEMORY[0x263F089D8] stringWithCapacity:2 * v5];
    id v7 = v4;
    uint64_t v8 = [v7 bytes];
    if ([v7 length])
    {
      unint64_t v9 = 0;
      do
        objc_msgSend(v6, "appendFormat:", @"%02lX", *(unsigned __int8 *)(v8 + v9++));
      while (v9 < [v7 length]);
    }
  }
  else
  {
    uint8_t v6 = 0;
  }

  return v6;
}

- (BOOL)retrieveCertAndKeyForTokenId:(id)a3 context:(id)a4 certificate:(__SecCertificate *)a5 privateKey:(__SecKey *)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    v14 = "-[POTokenHelper retrieveCertAndKeyForTokenId:context:certificate:privateKey:]";
    __int16 v15 = 2114;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = self;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_DEFAULT, "%s tokenName = %{public}@ on %@", (uint8_t *)&v13, 0x20u);
  }

  if (*a5)
  {
    CFRelease(*a5);
    *a5 = 0;
  }
  if (*a6)
  {
    CFRelease(*a6);
    *a6 = 0;
  }
  v11 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[POTokenHelper retrieveCertAndKeyForTokenId:context:certificate:privateKey:]();
  }

  return 0;
}

- (id)findTokenIdForSmartCardBoundUser:(id)a3 tokenHash:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POTokenHelper findTokenIdForSmartCardBoundUser:tokenHash:]();
  }

  return 0;
}

- (id)findTokenIdForSmartCardAMUser:(id)a3 tokenHash:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POTokenHelper findTokenIdForSmartCardAMUser:tokenHash:]();
  }

  return 0;
}

- (id)findInfoForTokenId:(id)a3
{
  id v3 = a3;
  id v4 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[POTokenHelper findInfoForTokenId:]();
  }

  return 0;
}

- (BOOL)canTokenIdLogin:(id)a3 pubKeyHash:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F048D0]) initWithTokenID:v5];
  uint64_t v8 = [v7 sessionWithLAContext:0 error:0];

  if (v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = [v8 keys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v21 = v5;
      uint64_t v12 = *(void *)v23;
      uint64_t v13 = *MEMORY[0x263F16EE0];
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v15 keyUsage])
          {
            id v16 = [v15 keychainAttributes];
            __int16 v17 = [v16 objectForKeyedSubscript:v13];
            char v18 = [v17 isEqual:v6];

            if (v18)
            {
              BOOL v19 = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      BOOL v19 = 0;
LABEL_14:
      id v5 = v21;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)postAHPCacheRefreshNotification
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_259DFE000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

- (id)getTokenInfo
{
  uint64_t v2 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[POTokenHelper getTokenInfo]();
  }

  return 0;
}

- (BOOL)waitForTokenAvailable:(id)a3
{
  id v3 = a3;
  id v4 = PO_LOG_POTokenHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[POTokenHelper waitForTokenAvailable:]();
  }

  return 1;
}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getDriverConfiguration
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "driver config value %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)insertTokenForUser:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "user not configured for decryption", v2, v3, v4, v5, v6);
}

- (void)insertTokenForUser:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "Adding unlock key", v2, v3, v4, v5, v6);
}

void __36__POTokenHelper_insertTokenForUser___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_259DFE000, log, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v4, 0x16u);
}

void __36__POTokenHelper_insertTokenForUser___block_invoke_42_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_3_4(v0, v1), "tokenId");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);
}

void __36__POTokenHelper_insertTokenForUser___block_invoke_61_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_3_4(v0, v1), "unlockTokenId");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeTokenForUser:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "no driver config for user: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)tokenHashDataForUser:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "No certificate", v2, v3, v4, v5, v6);
}

- (void)retrieveCertAndKeyForTokenId:context:certificate:privateKey:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "No Identity found", v2, v3, v4, v5, v6);
}

- (void)findTokenIdForSmartCardBoundUser:tokenHash:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s userName = %{public}@ on %@", v2);
}

- (void)findTokenIdForSmartCardAMUser:tokenHash:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s userName = %{public}@ on %@", v2);
}

- (void)findInfoForTokenId:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s tokenId = %{public}@ on %@", v2);
}

- (void)getTokenInfo
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_259DFE000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

- (void)waitForTokenAvailable:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s tokenId = %{public}@ on %@", v2);
}

@end