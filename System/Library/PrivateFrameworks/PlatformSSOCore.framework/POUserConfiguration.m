@interface POUserConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isNewUser;
- (BOOL)newUser;
- (NSArray)kerberosStatus;
- (NSData)_credential;
- (NSData)_sepKeyData;
- (NSData)smartCardHash;
- (NSData)userDecryptionKeyHash;
- (NSData)userUnlockHash;
- (NSDate)lastLoginDate;
- (NSNumber)pendingSigningAlgorithm;
- (NSNumber)signingAlgorithm;
- (NSString)__ssoExtensionIdentifier;
- (NSString)smartCardTokenId;
- (NSString)ssoExtensionIdentifier;
- (NSString)tokenId;
- (NSString)uniqueIdentifier;
- (NSString)unlockTokenId;
- (NSString)userDecryptionContext;
- (NSString)userUnlockData;
- (POUserConfiguration)init;
- (POUserConfiguration)initWithCoder:(id)a3;
- (POUserConfiguration)initWithData:(id)a3;
- (POUserLoginConfiguration)userLoginConfiguration;
- (__SecCertificate)sepKeyCertificate;
- (__SecCertificate)userDecryptionCertificate;
- (__SecCertificate)userUnlockCertificate;
- (__SecKey)sepKey;
- (__SecKey)sepKeyWithContext:(id)a3;
- (id)dataRepresentation;
- (id)dataRepresentationForDisplay:(BOOL)a3;
- (id)description;
- (int)version;
- (int64_t)state;
- (unint64_t)loginType;
- (void)encodeWithCoder:(id)a3;
- (void)setKerberosStatus:(id)a3;
- (void)setLastLoginDate:(id)a3;
- (void)setLoginType:(unint64_t)a3;
- (void)setPendingSigningAlgorithm:(id)a3;
- (void)setSepKey:(__SecKey *)a3;
- (void)setSepKeyCertificate:(__SecCertificate *)a3;
- (void)setSigningAlgorithm:(id)a3;
- (void)setSmartCardHash:(id)a3;
- (void)setSmartCardTokenId:(id)a3;
- (void)setSsoExtensionIdentifier:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUserDecryptionCertificate:(__SecCertificate *)a3;
- (void)setUserDecryptionContext:(id)a3;
- (void)setUserDecryptionKeyHash:(id)a3;
- (void)setUserLoginConfiguration:(id)a3;
- (void)setUserUnlockCertificate:(__SecCertificate *)a3;
- (void)setUserUnlockData:(id)a3;
- (void)setUserUnlockHash:(id)a3;
- (void)set__ssoExtensionIdentifier:(id)a3;
- (void)set_credential:(id)a3;
- (void)set_sepKeyData:(id)a3;
- (void)updateVersion;
@end

@implementation POUserConfiguration

- (POUserConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)POUserConfiguration;
  v2 = [(POUserConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    objc_storeStrong((id *)&v2->_signingAlgorithm, &unk_2707DBB50);
  }
  return v3;
}

- (BOOL)newUser
{
  return [(POUserConfiguration *)self state] == 4 || [(POUserConfiguration *)self state] == 6;
}

- (void)updateVersion
{
  self->_version = 1;
}

- (__SecKey)sepKey
{
  return [(POUserConfiguration *)self sepKeyWithContext:0];
}

- (__SecKey)sepKeyWithContext:(id)a3
{
  result = +[POSecKeyHelper keyForData:self->__sepKeyData context:a3];
  self->_sepKey = result;
  return result;
}

- (void)setSepKey:(__SecKey *)a3
{
  self->_sepKey = a3;
  if (a3)
  {
    +[POSecKeyHelper dataForKey:](POSecKeyHelper, "dataForKey:");
    self->__sepKeyData = (NSData *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x270F9A758]();
  }
}

- (NSString)__ssoExtensionIdentifier
{
  return self->_ssoExtensionIdentifier;
}

- (void)set__ssoExtensionIdentifier:(id)a3
{
}

- (NSString)tokenId
{
  v3 = [(POUserConfiguration *)self userDecryptionKeyHash];

  if (v3)
  {
    v4 = NSString;
    objc_super v5 = [(POUserConfiguration *)self userDecryptionKeyHash];
    v6 = +[POTokenHelper dataToHex:v5];
    v7 = [v4 stringWithFormat:@"com.apple.platformsso:%@", v6];
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (NSString)unlockTokenId
{
  v3 = [(POUserConfiguration *)self userUnlockHash];

  if (v3)
  {
    v4 = NSString;
    objc_super v5 = [(POUserConfiguration *)self userUnlockHash];
    v6 = +[POTokenHelper dataToHex:v5];
    v7 = [v4 stringWithFormat:@"com.apple.platformsso:%@", v6];
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (id)dataRepresentation
{
  return [(POUserConfiguration *)self dataRepresentationForDisplay:0];
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v5 setFormatOptions:1907];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7 = [NSNumber numberWithInt:self->_version];
  v8 = NSStringFromSelector(sel_version);
  [v6 setObject:v7 forKeyedSubscript:v8];

  v9 = [(POUserLoginConfiguration *)self->_userLoginConfiguration dictionaryRepresentationForDisplay:v3];
  v10 = NSStringFromSelector(sel_userLoginConfiguration);
  [v6 setObject:v9 forKeyedSubscript:v10];

  uniqueIdentifier = self->_uniqueIdentifier;
  v12 = NSStringFromSelector(sel_uniqueIdentifier);
  [v6 setObject:uniqueIdentifier forKeyedSubscript:v12];

  ssoExtensionIdentifier = self->_ssoExtensionIdentifier;
  v14 = NSStringFromSelector(sel_ssoExtensionIdentifier);
  [v6 setObject:ssoExtensionIdentifier forKeyedSubscript:v14];

  unint64_t loginType = self->_loginType;
  if (v3) {
    +[POConstantCoreUtil stringForLoginType:loginType];
  }
  else {
  v16 = [NSNumber numberWithUnsignedInteger:loginType];
  }
  v17 = NSStringFromSelector(sel_loginType);
  [v6 setObject:v16 forKeyedSubscript:v17];

  lastLoginDate = self->_lastLoginDate;
  if (lastLoginDate)
  {
    v19 = [v5 stringFromDate:self->_lastLoginDate];
  }
  else
  {
    v19 = 0;
  }
  v20 = NSStringFromSelector(sel_lastLoginDate);
  [v6 setObject:v19 forKeyedSubscript:v20];

  if (lastLoginDate) {
  int64_t state = self->_state;
  }
  if (v3) {
    +[POConstantCoreUtil stringForUserState:state];
  }
  else {
  v22 = [NSNumber numberWithInteger:state];
  }
  v23 = NSStringFromSelector(sel_state);
  [v6 setObject:v22 forKeyedSubscript:v23];

  if (v3) {
    [(NSData *)self->__sepKeyData psso_sha256HashString];
  }
  else {
  v24 = [(NSData *)self->__sepKeyData psso_base64URLEncodedString];
  }
  v25 = NSStringFromSelector(sel__sepKeyData);
  [v6 setObject:v24 forKeyedSubscript:v25];

  [(POUserConfiguration *)self signingAlgorithm];
  if (v3) {
    v24 = {;
  }
    +[POConstantCoreUtil stringForSigningAlgorithm:v24];
  v26 = };
  v27 = NSStringFromSelector(sel_signingAlgorithm);
  [v6 setObject:v26 forKeyedSubscript:v27];

  if (v3)
  {

    v24 = [(POUserConfiguration *)self pendingSigningAlgorithm];
    +[POConstantCoreUtil stringForSigningAlgorithm:v24];
  }
  else
  {
    [(POUserConfiguration *)self pendingSigningAlgorithm];
  v28 = };
  v29 = NSStringFromSelector(sel_pendingSigningAlgorithm);
  [v6 setObject:v28 forKeyedSubscript:v29];

  if (v3)
  {

    v28 = v24;
  }

  v30 = +[POSecKeyHelper dataForCertificate:self->_sepKeyCertificate];
  v31 = objc_msgSend(v30, "psso_base64URLEncodedString");
  v32 = NSStringFromSelector(sel_sepKeyCertificate);
  [v6 setObject:v31 forKeyedSubscript:v32];

  smartCardTokenId = self->_smartCardTokenId;
  v34 = NSStringFromSelector(sel_smartCardTokenId);
  [v6 setObject:smartCardTokenId forKeyedSubscript:v34];

  if (v3) {
    +[POTokenHelper dataToHex:self->_smartCardHash];
  }
  else {
  v35 = [(NSData *)self->_smartCardHash psso_base64URLEncodedString];
  }
  v36 = NSStringFromSelector(sel_smartCardHash);
  [v6 setObject:v35 forKeyedSubscript:v36];

  if (v3) {
    [(NSData *)self->__credential psso_sha256HashString];
  }
  else {
  v37 = [(NSData *)self->__credential psso_base64URLEncodedString];
  }
  v38 = NSStringFromSelector(sel__credential);
  [v6 setObject:v37 forKeyedSubscript:v38];

  id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v40 = self->_kerberosStatus;
  uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v73 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = [*(id *)(*((void *)&v72 + 1) + 8 * i) dictionaryRepresentation];
        [v39 addObject:v45];
      }
      uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v72 objects:v76 count:16];
    }
    while (v42);
  }

  if ([v39 count])
  {
    v46 = NSStringFromSelector(sel_kerberosStatus);
    [v6 setObject:v39 forKeyedSubscript:v46];
  }
  if (v3) {
    +[POTokenHelper dataToHex:self->_userDecryptionKeyHash];
  }
  else {
  v47 = [(NSData *)self->_userDecryptionKeyHash psso_base64URLEncodedString];
  }
  v48 = NSStringFromSelector(sel_userDecryptionKeyHash);
  [v6 setObject:v47 forKeyedSubscript:v48];

  v49 = +[POSecKeyHelper dataForCertificate:self->_userDecryptionCertificate];
  v50 = objc_msgSend(v49, "psso_base64URLEncodedString");
  v51 = NSStringFromSelector(sel_userDecryptionCertificate);
  [v6 setObject:v50 forKeyedSubscript:v51];

  userDecryptionContext = self->_userDecryptionContext;
  if (v3)
  {
    v49 = [(NSString *)self->_userDecryptionContext dataUsingEncoding:4];
    userDecryptionContext = objc_msgSend(v49, "psso_sha256HashString");
  }
  v53 = NSStringFromSelector(sel_userDecryptionContext);
  [v6 setObject:userDecryptionContext forKeyedSubscript:v53];

  if (v3)
  {

    v49 = [(NSString *)self->_userUnlockData dataUsingEncoding:4];
    userUnlockData = objc_msgSend(v49, "psso_sha256HashString");
  }
  else
  {
    userUnlockData = self->_userUnlockData;
  }
  v55 = NSStringFromSelector(sel_userUnlockData);
  [v6 setObject:userUnlockData forKeyedSubscript:v55];

  if (v3)
  {

    +[POTokenHelper dataToHex:self->_userUnlockHash];
  }
  else
  {
    [(NSData *)self->_userUnlockHash psso_base64URLEncodedString];
  v56 = };
  v57 = NSStringFromSelector(sel_userUnlockHash);
  [v6 setObject:v56 forKeyedSubscript:v57];

  v58 = +[POSecKeyHelper dataForCertificate:self->_userUnlockCertificate];
  v59 = objc_msgSend(v58, "psso_base64URLEncodedString");
  v60 = NSStringFromSelector(sel_userUnlockCertificate);
  [v6 setObject:v59 forKeyedSubscript:v60];

  v61 = [MEMORY[0x263EFF910] date];
  v62 = [v5 stringFromDate:v61];
  [v6 setObject:v62 forKeyedSubscript:@"created"];

  id v71 = 0;
  v63 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:11 error:&v71];
  id v64 = v71;
  v65 = v64;
  if (v64)
  {
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __52__POUserConfiguration_dataRepresentationForDisplay___block_invoke;
    v69[3] = &unk_265463860;
    id v70 = v64;
    id v66 = __52__POUserConfiguration_dataRepresentationForDisplay___block_invoke((uint64_t)v69);

    id v67 = 0;
  }
  else
  {
    id v67 = v63;
  }

  return v67;
}

id __52__POUserConfiguration_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error serializing user config."];
  v2 = PO_LOG_POUserConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (POUserConfiguration)initWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(POUserConfiguration *)self init];
  if (!v5)
  {
LABEL_39:
    v11 = v5;
    goto LABEL_40;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v6 setFormatOptions:1907];
  id v121 = 0;
  v7 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:16 error:&v121];
  id v8 = v121;
  if (!v8)
  {
    v12 = NSStringFromSelector(sel_version);
    v13 = [v7 objectForKeyedSubscript:v12];

    if (v13)
    {
      v14 = NSStringFromSelector(sel_version);
      v15 = [v7 objectForKeyedSubscript:v14];

      v5->_version = [v15 intValue];
    }
    else
    {
      v5->_version = 0;
    }
    v16 = NSStringFromSelector(sel_userLoginConfiguration);
    uint64_t v17 = [v7 objectForKeyedSubscript:v16];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[POUserLoginConfiguration alloc] initWithDictionary:v17];
      userLoginConfiguration = v5->_userLoginConfiguration;
      v5->_userLoginConfiguration = v18;
    }
    if (!v5->_version)
    {
      v20 = [v7 objectForKeyedSubscript:@"loginUserName"];
      if (v20)
      {
        v21 = [[POUserLoginConfiguration alloc] initWithLoginUserName:v20];
        v22 = v5->_userLoginConfiguration;
        v5->_userLoginConfiguration = v21;
      }
    }
    v23 = NSStringFromSelector(sel_uniqueIdentifier);
    uint64_t v24 = [v7 objectForKeyedSubscript:v23];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v24;

    v26 = NSStringFromSelector(sel_ssoExtensionIdentifier);
    uint64_t v27 = [v7 objectForKeyedSubscript:v26];
    ssoExtensionIdentifier = v5->_ssoExtensionIdentifier;
    v5->_ssoExtensionIdentifier = (NSString *)v27;

    v29 = NSStringFromSelector(sel_loginType);
    v30 = [v7 objectForKeyedSubscript:v29];
    v5->_unint64_t loginType = (int)[v30 intValue];

    v31 = NSStringFromSelector(sel_state);
    v32 = [v7 objectForKeyedSubscript:v31];
    v5->_int64_t state = (int)[v32 intValue];

    v33 = NSStringFromSelector(sel_smartCardTokenId);
    uint64_t v34 = [v7 objectForKeyedSubscript:v33];
    smartCardTokenId = v5->_smartCardTokenId;
    v5->_smartCardTokenId = (NSString *)v34;

    v36 = NSStringFromSelector(sel_smartCardHash);
    v37 = [v7 objectForKeyedSubscript:v36];

    if (v37)
    {
      id v38 = objc_alloc(MEMORY[0x263EFF8F8]);
      id v39 = NSStringFromSelector(sel_smartCardHash);
      v40 = [v7 objectForKeyedSubscript:v39];
      uint64_t v41 = objc_msgSend(v38, "psso_initWithBase64URLEncodedString:", v40);

      smartCardHash = v5->_smartCardHash;
      v5->_smartCardHash = (NSData *)v41;
    }
    uint64_t v43 = NSStringFromSelector(sel_lastLoginDate);
    uint64_t v44 = [v7 objectForKeyedSubscript:v43];

    if (v44)
    {
      uint64_t v45 = [v6 dateFromString:v44];
      lastLoginDate = v5->_lastLoginDate;
      v5->_lastLoginDate = (NSDate *)v45;
    }
    v47 = NSStringFromSelector(sel__credential);
    v48 = [v7 objectForKeyedSubscript:v47];

    if (v48)
    {
      id v49 = objc_alloc(MEMORY[0x263EFF8F8]);
      v50 = NSStringFromSelector(sel__credential);
      v51 = [v7 objectForKeyedSubscript:v50];
      uint64_t v52 = objc_msgSend(v49, "psso_initWithBase64URLEncodedString:", v51);

      credential = v5->__credential;
      v5->__credential = (NSData *)v52;
    }
    v54 = NSStringFromSelector(sel__sepKeyData);
    v55 = [v7 objectForKeyedSubscript:v54];

    if (v55)
    {
      id v56 = objc_alloc(MEMORY[0x263EFF8F8]);
      v57 = NSStringFromSelector(sel__sepKeyData);
      v58 = [v7 objectForKeyedSubscript:v57];
      uint64_t v59 = objc_msgSend(v56, "psso_initWithBase64URLEncodedString:", v58);

      sepKeyData = v5->__sepKeyData;
      v5->__sepKeyData = (NSData *)v59;
    }
    v61 = NSStringFromSelector(sel_signingAlgorithm);
    v62 = [v7 objectForKeyedSubscript:v61];

    if (v62)
    {
      v63 = NSStringFromSelector(sel_signingAlgorithm);
      uint64_t v64 = [v7 objectForKeyedSubscript:v63];

      signingAlgorithm = v5->_signingAlgorithm;
      v5->_signingAlgorithm = (NSNumber *)v64;
    }
    else
    {
      id v66 = &unk_2707DBB50;
      signingAlgorithm = v5->_signingAlgorithm;
      v5->_signingAlgorithm = (NSNumber *)v66;
    }

    id v67 = NSStringFromSelector(sel_pendingSigningAlgorithm);
    v68 = [v7 objectForKeyedSubscript:v67];

    if (v68)
    {
      v69 = NSStringFromSelector(sel_pendingSigningAlgorithm);
      uint64_t v70 = [v7 objectForKeyedSubscript:v69];

      pendingSigningAlgorithm = v5->_pendingSigningAlgorithm;
      v5->_pendingSigningAlgorithm = (NSNumber *)v70;
    }
    long long v72 = NSStringFromSelector(sel_sepKeyCertificate);
    long long v73 = [v7 objectForKeyedSubscript:v72];

    if (v73)
    {
      id v74 = objc_alloc(MEMORY[0x263EFF8F8]);
      long long v75 = NSStringFromSelector(sel_sepKeyCertificate);
      v76 = [v7 objectForKeyedSubscript:v75];
      uint64_t v77 = objc_msgSend(v74, "psso_initWithBase64URLEncodedString:", v76);

      v5->_sepKeyCertificate = +[POSecKeyHelper certificateForData:v77];
    }
    v115 = (void *)v44;
    v116 = (void *)v17;
    id v78 = objc_alloc_init(MEMORY[0x263EFF980]);
    v79 = NSStringFromSelector(sel_kerberosStatus);
    v80 = [v7 objectForKeyedSubscript:v79];

    v117[0] = MEMORY[0x263EF8330];
    v117[1] = 3221225472;
    v117[2] = __36__POUserConfiguration_initWithData___block_invoke_147;
    v117[3] = &unk_265463978;
    id v81 = v78;
    id v118 = v81;
    [v80 enumerateObjectsUsingBlock:v117];
    if ([v81 count]) {
      objc_storeStrong((id *)&v5->_kerberosStatus, v78);
    }
    v82 = NSStringFromSelector(sel_userDecryptionKeyHash);
    v83 = [v7 objectForKeyedSubscript:v82];

    if (v83)
    {
      id v84 = objc_alloc(MEMORY[0x263EFF8F8]);
      v85 = NSStringFromSelector(sel_userDecryptionKeyHash);
      v86 = [v7 objectForKeyedSubscript:v85];
      uint64_t v87 = objc_msgSend(v84, "psso_initWithBase64URLEncodedString:", v86);

      userDecryptionKeyHash = v5->_userDecryptionKeyHash;
      v5->_userDecryptionKeyHash = (NSData *)v87;
    }
    v89 = NSStringFromSelector(sel_userDecryptionCertificate);
    v90 = [v7 objectForKeyedSubscript:v89];

    if (v90)
    {
      id v91 = objc_alloc(MEMORY[0x263EFF8F8]);
      v92 = NSStringFromSelector(sel_userDecryptionCertificate);
      v93 = [v7 objectForKeyedSubscript:v92];
      v94 = objc_msgSend(v91, "psso_initWithBase64URLEncodedString:", v93);

      v5->_userDecryptionCertificate = +[POSecKeyHelper certificateForData:v94];
    }
    v95 = NSStringFromSelector(sel_userDecryptionContext);
    uint64_t v96 = [v7 objectForKeyedSubscript:v95];
    userDecryptionContext = v5->_userDecryptionContext;
    v5->_userDecryptionContext = (NSString *)v96;

    v98 = NSStringFromSelector(sel_userUnlockData);
    uint64_t v99 = [v7 objectForKeyedSubscript:v98];
    userUnlockData = v5->_userUnlockData;
    v5->_userUnlockData = (NSString *)v99;

    v101 = NSStringFromSelector(sel_userUnlockHash);
    v102 = [v7 objectForKeyedSubscript:v101];

    if (v102)
    {
      id v103 = objc_alloc(MEMORY[0x263EFF8F8]);
      v104 = NSStringFromSelector(sel_userUnlockHash);
      v105 = [v7 objectForKeyedSubscript:v104];
      uint64_t v106 = objc_msgSend(v103, "psso_initWithBase64URLEncodedString:", v105);

      userUnlockHash = v5->_userUnlockHash;
      v5->_userUnlockHash = (NSData *)v106;
    }
    v108 = NSStringFromSelector(sel_userUnlockCertificate);
    v109 = [v7 objectForKeyedSubscript:v108];

    if (v109)
    {
      id v110 = objc_alloc(MEMORY[0x263EFF8F8]);
      v111 = NSStringFromSelector(sel_userUnlockCertificate);
      v112 = [v7 objectForKeyedSubscript:v111];
      v113 = objc_msgSend(v110, "psso_initWithBase64URLEncodedString:", v112);

      v5->_userUnlockCertificate = +[POSecKeyHelper certificateForData:v113];
    }

    goto LABEL_39;
  }
  v119[0] = MEMORY[0x263EF8330];
  v119[1] = 3221225472;
  v119[2] = __36__POUserConfiguration_initWithData___block_invoke;
  v119[3] = &unk_265463860;
  id v120 = v8;
  id v9 = v8;
  id v10 = __36__POUserConfiguration_initWithData___block_invoke((uint64_t)v119);

  v11 = 0;
LABEL_40:

  return v11;
}

id __36__POUserConfiguration_initWithData___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing user config."];
  v2 = PO_LOG_POUserConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

void __36__POUserConfiguration_initWithData___block_invoke_147(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = *(void **)(a1 + 32);
    id v4 = [[POKerberosStatus alloc] initWithDictionary:v5];
    [v3 addObject:v4];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(POUserConfiguration *)self dataRepresentationForDisplay:1];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POUserConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_dataRepresentation);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = [(POUserConfiguration *)self initWithData:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(POUserConfiguration *)self dataRepresentation];
  uint64_t v5 = NSStringFromSelector(sel_dataRepresentation);
  [v4 encodeObject:v6 forKey:v5];
}

- (int)version
{
  return self->_version;
}

- (POUserLoginConfiguration)userLoginConfiguration
{
  return (POUserLoginConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserLoginConfiguration:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSDate)lastLoginDate
{
  return self->_lastLoginDate;
}

- (void)setLastLoginDate:(id)a3
{
}

- (unint64_t)loginType
{
  return self->_loginType;
}

- (void)setLoginType:(unint64_t)a3
{
  self->_unint64_t loginType = a3;
}

- (NSNumber)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (void)setSigningAlgorithm:(id)a3
{
}

- (NSNumber)pendingSigningAlgorithm
{
  return self->_pendingSigningAlgorithm;
}

- (void)setPendingSigningAlgorithm:(id)a3
{
}

- (__SecCertificate)sepKeyCertificate
{
  return self->_sepKeyCertificate;
}

- (void)setSepKeyCertificate:(__SecCertificate *)a3
{
  self->_sepKeyCertificate = a3;
}

- (NSString)smartCardTokenId
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSmartCardTokenId:(id)a3
{
}

- (NSData)smartCardHash
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSmartCardHash:(id)a3
{
}

- (NSData)_credential
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)set_credential:(id)a3
{
}

- (NSArray)kerberosStatus
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setKerberosStatus:(id)a3
{
}

- (NSData)userDecryptionKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUserDecryptionKeyHash:(id)a3
{
}

- (__SecCertificate)userDecryptionCertificate
{
  return self->_userDecryptionCertificate;
}

- (void)setUserDecryptionCertificate:(__SecCertificate *)a3
{
  self->_userDecryptionCertificate = a3;
}

- (NSString)userDecryptionContext
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUserDecryptionContext:(id)a3
{
}

- (NSString)userUnlockData
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUserUnlockData:(id)a3
{
}

- (NSData)userUnlockHash
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setUserUnlockHash:(id)a3
{
}

- (__SecCertificate)userUnlockCertificate
{
  return self->_userUnlockCertificate;
}

- (void)setUserUnlockCertificate:(__SecCertificate *)a3
{
  self->_userUnlockCertificate = a3;
}

- (BOOL)isNewUser
{
  return self->_newUser;
}

- (NSString)ssoExtensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSsoExtensionIdentifier:(id)a3
{
}

- (NSData)_sepKeyData
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)set_sepKeyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sepKeyData, 0);
  objc_storeStrong((id *)&self->_ssoExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_userUnlockHash, 0);
  objc_storeStrong((id *)&self->_userUnlockData, 0);
  objc_storeStrong((id *)&self->_userDecryptionContext, 0);
  objc_storeStrong((id *)&self->_userDecryptionKeyHash, 0);
  objc_storeStrong((id *)&self->_kerberosStatus, 0);
  objc_storeStrong((id *)&self->__credential, 0);
  objc_storeStrong((id *)&self->_smartCardHash, 0);
  objc_storeStrong((id *)&self->_smartCardTokenId, 0);
  objc_storeStrong((id *)&self->_pendingSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_signingAlgorithm, 0);
  objc_storeStrong((id *)&self->_lastLoginDate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_userLoginConfiguration, 0);
}

@end