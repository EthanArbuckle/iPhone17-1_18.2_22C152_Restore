@interface PODeviceConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)authorizationEnabled;
- (BOOL)createUsersEnabled;
- (BOOL)registrationCompleted;
- (BOOL)sharedDeviceKeys;
- (BOOL)supportsAuthorization;
- (BOOL)supportsCreateNewUsers;
- (BOOL)supportsTokenUnlock;
- (NSArray)administratorGroups;
- (NSArray)nonPlatformSSOAccounts;
- (NSArray)otherGroups;
- (NSData)_deviceEncryptionKeyData;
- (NSData)_deviceSigningKeyData;
- (NSDate)authGracePeriodStart;
- (NSDate)lastEncryptionKeyChange;
- (NSDictionary)authorizationGroups;
- (NSDictionary)tokenToUserMapping;
- (NSNumber)encryptionAlgorithm;
- (NSNumber)loginFrequency;
- (NSNumber)pendingEncryptionAlgorithm;
- (NSNumber)pendingSigningAlgorithm;
- (NSNumber)sdkVersionString;
- (NSNumber)signingAlgorithm;
- (NSString)accountDisplayName;
- (NSString)defaultUserDomain;
- (NSString)extensionIdentifier;
- (PODeviceConfiguration)init;
- (PODeviceConfiguration)initWithCoder:(id)a3;
- (PODeviceConfiguration)initWithData:(id)a3;
- (__SecCertificate)deviceEncryptionCertificate;
- (__SecCertificate)deviceSigningCertificate;
- (__SecIdentity)deviceEncryptionIdentity;
- (__SecIdentity)deviceSigningIdentity;
- (__SecKey)deviceEncryptionKey;
- (__SecKey)deviceEncryptionPublicKey;
- (__SecKey)deviceSigningKey;
- (__SecKey)deviceSigningPublicKey;
- (id)dataRepresentation;
- (id)dataRepresentationForDisplay:(BOOL)a3;
- (id)description;
- (int)version;
- (int64_t)newUserAuthorizationMode;
- (int64_t)offlineGracePeriod;
- (int64_t)protocolVersion;
- (int64_t)requireAuthGracePeriod;
- (int64_t)userAuthorizationMode;
- (unint64_t)fileVaultPolicy;
- (unint64_t)loginPolicy;
- (unint64_t)loginType;
- (unint64_t)unlockPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountDisplayName:(id)a3;
- (void)setAdministratorGroups:(id)a3;
- (void)setAuthGracePeriodStart:(id)a3;
- (void)setAuthorizationEnabled:(BOOL)a3;
- (void)setAuthorizationGroups:(id)a3;
- (void)setCreateUsersEnabled:(BOOL)a3;
- (void)setDefaultUserDomain:(id)a3;
- (void)setDeviceEncryptionCertificate:(__SecCertificate *)a3;
- (void)setDeviceEncryptionKey:(__SecKey *)a3;
- (void)setDeviceSigningCertificate:(__SecCertificate *)a3;
- (void)setDeviceSigningKey:(__SecKey *)a3;
- (void)setEncryptionAlgorithm:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setFileVaultPolicy:(unint64_t)a3;
- (void)setLastEncryptionKeyChange:(id)a3;
- (void)setLoginFrequency:(id)a3;
- (void)setLoginPolicy:(unint64_t)a3;
- (void)setLoginType:(unint64_t)a3;
- (void)setNewUserAuthorizationMode:(int64_t)a3;
- (void)setNonPlatformSSOAccounts:(id)a3;
- (void)setOfflineGracePeriod:(int64_t)a3;
- (void)setOtherGroups:(id)a3;
- (void)setPendingEncryptionAlgorithm:(id)a3;
- (void)setPendingSigningAlgorithm:(id)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setRegistrationCompleted:(BOOL)a3;
- (void)setRequireAuthGracePeriod:(int64_t)a3;
- (void)setSdkVersionString:(id)a3;
- (void)setSharedDeviceKeys:(BOOL)a3;
- (void)setSigningAlgorithm:(id)a3;
- (void)setTokenToUserMapping:(id)a3;
- (void)setUnlockPolicy:(unint64_t)a3;
- (void)setUserAuthorizationMode:(int64_t)a3;
- (void)set_deviceEncryptionKeyData:(id)a3;
- (void)set_deviceSigningKeyData:(id)a3;
- (void)supportsAuthorization;
- (void)supportsCreateNewUsers;
- (void)supportsTokenUnlock;
- (void)updateVersion;
@end

@implementation PODeviceConfiguration

- (PODeviceConfiguration)init
{
  v9[2] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)PODeviceConfiguration;
  v2 = [(PODeviceConfiguration *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v8[0] = @"AccountName";
    v8[1] = @"FullName";
    v9[0] = @"preferred_username";
    v9[1] = @"name";
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    tokenToUserMapping = v3->_tokenToUserMapping;
    v3->_tokenToUserMapping = (NSDictionary *)v4;

    objc_storeStrong((id *)&v3->_signingAlgorithm, &unk_2707DBB50);
    objc_storeStrong((id *)&v3->_encryptionAlgorithm, &unk_2707DBB50);
  }
  return v3;
}

- (void)updateVersion
{
  self->_version = 1;
}

- (BOOL)supportsTokenUnlock
{
  v3 = PO_LOG_PODeviceConfiguration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PODeviceConfiguration supportsTokenUnlock](self);
  }

  BOOL v4 = [(PODeviceConfiguration *)self sharedDeviceKeys];
  if (v4) {
    LOBYTE(v4) = [(PODeviceConfiguration *)self protocolVersion] == 1;
  }
  return v4;
}

- (BOOL)supportsAuthorization
{
  v3 = PO_LOG_PODeviceConfiguration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PODeviceConfiguration supportsAuthorization](self);
  }

  BOOL v4 = [(PODeviceConfiguration *)self sharedDeviceKeys];
  if (v4) {
    LOBYTE(v4) = [(PODeviceConfiguration *)self authorizationEnabled];
  }
  return v4;
}

- (BOOL)supportsCreateNewUsers
{
  v3 = PO_LOG_PODeviceConfiguration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PODeviceConfiguration supportsCreateNewUsers](self);
  }

  BOOL v4 = [(PODeviceConfiguration *)self sharedDeviceKeys];
  if (v4) {
    LOBYTE(v4) = [(PODeviceConfiguration *)self createUsersEnabled];
  }
  return v4;
}

- (NSNumber)loginFrequency
{
  if (self->_loginFrequency) {
    return self->_loginFrequency;
  }
  else {
    return (NSNumber *)&unk_2707DBAA8;
  }
}

- (__SecKey)deviceSigningKey
{
  result = self->_deviceSigningKey;
  if (!result)
  {
    BOOL v4 = [(PODeviceConfiguration *)self sharedDeviceKeys];
    deviceSigningKeyData = self->__deviceSigningKeyData;
    if (v4) {
      result = +[POSecKeyHelper systemKeyForData:deviceSigningKeyData];
    }
    else {
      result = +[POSecKeyHelper keyForData:deviceSigningKeyData];
    }
    self->_deviceSigningKey = result;
  }
  return result;
}

- (void)setDeviceSigningKey:(__SecKey *)a3
{
  self->_deviceSigningKey = a3;
  if (a3)
  {
    +[POSecKeyHelper dataForKey:](POSecKeyHelper, "dataForKey:");
    self->__deviceSigningKeyData = (NSData *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x270F9A758]();
  }
}

- (__SecKey)deviceSigningPublicKey
{
  result = [(PODeviceConfiguration *)self deviceSigningKey];
  if (result)
  {
    BOOL v4 = [(PODeviceConfiguration *)self deviceSigningKey];
    return SecKeyCopyPublicKey(v4);
  }
  return result;
}

- (__SecKey)deviceEncryptionKey
{
  result = self->_deviceEncryptionKey;
  if (!result)
  {
    BOOL v4 = [(PODeviceConfiguration *)self sharedDeviceKeys];
    deviceEncryptionKeyData = self->__deviceEncryptionKeyData;
    if (v4) {
      result = +[POSecKeyHelper systemKeyForData:deviceEncryptionKeyData];
    }
    else {
      result = +[POSecKeyHelper keyForData:deviceEncryptionKeyData];
    }
    self->_deviceEncryptionKey = result;
  }
  return result;
}

- (void)setDeviceEncryptionKey:(__SecKey *)a3
{
  self->_deviceEncryptionKey = a3;
  if (a3)
  {
    +[POSecKeyHelper dataForKey:](POSecKeyHelper, "dataForKey:");
    self->__deviceEncryptionKeyData = (NSData *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x270F9A758]();
  }
}

- (__SecKey)deviceEncryptionPublicKey
{
  result = [(PODeviceConfiguration *)self deviceEncryptionKey];
  if (result)
  {
    BOOL v4 = [(PODeviceConfiguration *)self deviceEncryptionKey];
    return SecKeyCopyPublicKey(v4);
  }
  return result;
}

- (__SecIdentity)deviceSigningIdentity
{
  v3 = [(PODeviceConfiguration *)self deviceSigningKey];
  deviceSigningCertificate = self->_deviceSigningCertificate;
  return +[POSecKeyHelper identityForKey:v3 andCertificate:deviceSigningCertificate];
}

- (__SecIdentity)deviceEncryptionIdentity
{
  v3 = [(PODeviceConfiguration *)self deviceEncryptionKey];
  deviceEncryptionCertificate = self->_deviceEncryptionCertificate;
  return +[POSecKeyHelper identityForKey:v3 andCertificate:deviceEncryptionCertificate];
}

- (id)dataRepresentation
{
  return [(PODeviceConfiguration *)self dataRepresentationForDisplay:0];
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v5 setFormatOptions:1907];
  id v6 = objc_alloc_init(MEMORY[0x263F08780]);
  [v6 setUnitsStyle:3];
  [v6 setAllowedUnits:48];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [NSNumber numberWithInt:self->_version];
  v9 = NSStringFromSelector(sel_version);
  [v7 setObject:v8 forKeyedSubscript:v9];

  deviceSigningKeyData = self->__deviceSigningKeyData;
  if (v3) {
    [(NSData *)deviceSigningKeyData psso_sha256HashString];
  }
  else {
  v11 = [(NSData *)deviceSigningKeyData psso_base64URLEncodedString];
  }
  v12 = NSStringFromSelector(sel__deviceSigningKeyData);
  [v7 setObject:v11 forKeyedSubscript:v12];

  v13 = +[POSecKeyHelper dataForCertificate:self->_deviceSigningCertificate];
  v14 = objc_msgSend(v13, "psso_base64URLEncodedString");
  v15 = NSStringFromSelector(sel_deviceSigningCertificate);
  [v7 setObject:v14 forKeyedSubscript:v15];

  [(PODeviceConfiguration *)self signingAlgorithm];
  if (v3) {
    v13 = {;
  }
    +[POConstantCoreUtil stringForSigningAlgorithm:v13];
  v16 = };
  v17 = NSStringFromSelector(sel_signingAlgorithm);
  [v7 setObject:v16 forKeyedSubscript:v17];

  if (v3)
  {

    v13 = [(PODeviceConfiguration *)self pendingSigningAlgorithm];
    +[POConstantCoreUtil stringForSigningAlgorithm:v13];
  }
  else
  {
    [(PODeviceConfiguration *)self pendingSigningAlgorithm];
  v18 = };
  v19 = NSStringFromSelector(sel_pendingSigningAlgorithm);
  [v7 setObject:v18 forKeyedSubscript:v19];

  if (v3)
  {

    [(NSData *)self->__deviceEncryptionKeyData psso_sha256HashString];
  }
  else
  {
    [(NSData *)self->__deviceEncryptionKeyData psso_base64URLEncodedString];
  v20 = };
  v21 = NSStringFromSelector(sel__deviceEncryptionKeyData);
  [v7 setObject:v20 forKeyedSubscript:v21];

  v22 = +[POSecKeyHelper dataForCertificate:self->_deviceEncryptionCertificate];
  v23 = objc_msgSend(v22, "psso_base64URLEncodedString");
  v24 = NSStringFromSelector(sel_deviceEncryptionCertificate);
  [v7 setObject:v23 forKeyedSubscript:v24];

  [(PODeviceConfiguration *)self encryptionAlgorithm];
  if (v3) {
    v22 = {;
  }
    +[POConstantCoreUtil stringForEncryptionAlgorithm:v22];
  v25 = };
  v26 = NSStringFromSelector(sel_encryptionAlgorithm);
  [v7 setObject:v25 forKeyedSubscript:v26];

  if (v3)
  {

    v22 = [(PODeviceConfiguration *)self pendingEncryptionAlgorithm];
    +[POConstantCoreUtil stringForEncryptionAlgorithm:v22];
  }
  else
  {
    [(PODeviceConfiguration *)self pendingEncryptionAlgorithm];
  v27 = };
  v28 = NSStringFromSelector(sel_pendingEncryptionAlgorithm);
  [v7 setObject:v27 forKeyedSubscript:v28];

  if (v3)
  {

    v29 = [(PODeviceConfiguration *)self lastEncryptionKeyChange];
    [v5 stringFromDate:v29];
  }
  else
  {
    v30 = NSNumber;
    v29 = [(PODeviceConfiguration *)self lastEncryptionKeyChange];
    [v29 timeIntervalSince1970];
    objc_msgSend(v30, "numberWithDouble:");
  v31 = };
  v32 = NSStringFromSelector(sel_lastEncryptionKeyChange);
  [v7 setObject:v31 forKeyedSubscript:v32];

  extensionIdentifier = self->_extensionIdentifier;
  v34 = NSStringFromSelector(sel_extensionIdentifier);
  [v7 setObject:extensionIdentifier forKeyedSubscript:v34];

  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[PODeviceConfiguration registrationCompleted](self, "registrationCompleted"));
  v36 = NSStringFromSelector(sel_registrationCompleted);
  [v7 setObject:v35 forKeyedSubscript:v36];

  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[PODeviceConfiguration sharedDeviceKeys](self, "sharedDeviceKeys"));
  v38 = NSStringFromSelector(sel_sharedDeviceKeys);
  [v7 setObject:v37 forKeyedSubscript:v38];

  v39 = objc_msgSend(NSNumber, "numberWithInteger:", -[PODeviceConfiguration protocolVersion](self, "protocolVersion"));
  v40 = NSStringFromSelector(sel_protocolVersion);
  [v7 setObject:v39 forKeyedSubscript:v40];

  v41 = [(PODeviceConfiguration *)self sdkVersionString];
  v42 = NSStringFromSelector(sel_sdkVersionString);
  [v7 setObject:v41 forKeyedSubscript:v42];

  unint64_t loginType = self->_loginType;
  if (v3) {
    +[POConstantCoreUtil stringForLoginType:loginType];
  }
  else {
  v44 = [NSNumber numberWithUnsignedInteger:loginType];
  }
  v45 = NSStringFromSelector(sel_loginType);
  [v7 setObject:v44 forKeyedSubscript:v45];

  v46 = objc_msgSend(NSNumber, "numberWithBool:", -[PODeviceConfiguration createUsersEnabled](self, "createUsersEnabled"));
  v47 = NSStringFromSelector(sel_createUsersEnabled);
  [v7 setObject:v46 forKeyedSubscript:v47];

  v48 = objc_msgSend(NSNumber, "numberWithBool:", -[PODeviceConfiguration authorizationEnabled](self, "authorizationEnabled"));
  v49 = NSStringFromSelector(sel_authorizationEnabled);
  [v7 setObject:v48 forKeyedSubscript:v49];

  v50 = [(PODeviceConfiguration *)self tokenToUserMapping];
  v51 = NSStringFromSelector(sel_tokenToUserMapping);
  [v7 setObject:v50 forKeyedSubscript:v51];

  if (v3) {
    +[POConstantCoreUtil stringForUserAuthorizationMode:[(PODeviceConfiguration *)self newUserAuthorizationMode]];
  }
  else {
  v52 = objc_msgSend(NSNumber, "numberWithInteger:", -[PODeviceConfiguration newUserAuthorizationMode](self, "newUserAuthorizationMode"));
  }
  v53 = NSStringFromSelector(sel_newUserAuthorizationMode);
  [v7 setObject:v52 forKeyedSubscript:v53];

  if (v3) {
    +[POConstantCoreUtil stringForUserAuthorizationMode:[(PODeviceConfiguration *)self userAuthorizationMode]];
  }
  else {
  v54 = objc_msgSend(NSNumber, "numberWithInteger:", -[PODeviceConfiguration userAuthorizationMode](self, "userAuthorizationMode"));
  }
  v55 = NSStringFromSelector(sel_userAuthorizationMode);
  [v7 setObject:v54 forKeyedSubscript:v55];

  v56 = [(PODeviceConfiguration *)self administratorGroups];
  v57 = NSStringFromSelector(sel_administratorGroups);
  [v7 setObject:v56 forKeyedSubscript:v57];

  v58 = [(PODeviceConfiguration *)self authorizationGroups];
  v59 = NSStringFromSelector(sel_authorizationGroups);
  [v7 setObject:v58 forKeyedSubscript:v59];

  v60 = [(PODeviceConfiguration *)self otherGroups];
  v61 = NSStringFromSelector(sel_otherGroups);
  [v7 setObject:v60 forKeyedSubscript:v61];

  v62 = [(PODeviceConfiguration *)self defaultUserDomain];
  v63 = NSStringFromSelector(sel_defaultUserDomain);
  [v7 setObject:v62 forKeyedSubscript:v63];

  v64 = [(PODeviceConfiguration *)self accountDisplayName];
  v65 = NSStringFromSelector(sel_accountDisplayName);
  [v7 setObject:v64 forKeyedSubscript:v65];

  v66 = [(PODeviceConfiguration *)self loginFrequency];
  v67 = NSStringFromSelector(sel_loginFrequency);
  [v7 setObject:v66 forKeyedSubscript:v67];

  if (v3) {
    +[POConstantCoreUtil stringForLoginPolicy:[(PODeviceConfiguration *)self fileVaultPolicy]];
  }
  else {
  v68 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PODeviceConfiguration fileVaultPolicy](self, "fileVaultPolicy"));
  }
  v69 = NSStringFromSelector(sel_fileVaultPolicy);
  [v7 setObject:v68 forKeyedSubscript:v69];

  if (v3) {
    +[POConstantCoreUtil stringForLoginPolicy:[(PODeviceConfiguration *)self loginPolicy]];
  }
  else {
  v70 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PODeviceConfiguration loginPolicy](self, "loginPolicy"));
  }
  v71 = NSStringFromSelector(sel_loginPolicy);
  [v7 setObject:v70 forKeyedSubscript:v71];

  if (v3) {
    +[POConstantCoreUtil stringForLoginPolicy:[(PODeviceConfiguration *)self unlockPolicy]];
  }
  else {
  v72 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PODeviceConfiguration unlockPolicy](self, "unlockPolicy"));
  }
  v73 = NSStringFromSelector(sel_unlockPolicy);
  [v7 setObject:v72 forKeyedSubscript:v73];

  if (v3) {
    objc_msgSend(v6, "stringFromTimeInterval:", (double)-[PODeviceConfiguration offlineGracePeriod](self, "offlineGracePeriod"));
  }
  else {
  v74 = objc_msgSend(NSNumber, "numberWithInteger:", -[PODeviceConfiguration offlineGracePeriod](self, "offlineGracePeriod"));
  }
  v75 = NSStringFromSelector(sel_offlineGracePeriod);
  [v7 setObject:v74 forKeyedSubscript:v75];

  if (v3) {
    objc_msgSend(v6, "stringFromTimeInterval:", (double)-[PODeviceConfiguration requireAuthGracePeriod](self, "requireAuthGracePeriod"));
  }
  else {
  v76 = objc_msgSend(NSNumber, "numberWithInteger:", -[PODeviceConfiguration requireAuthGracePeriod](self, "requireAuthGracePeriod"));
  }
  v77 = NSStringFromSelector(sel_requireAuthGracePeriod);
  [v7 setObject:v76 forKeyedSubscript:v77];

  v78 = [(PODeviceConfiguration *)self authGracePeriodStart];
  if (v78)
  {
    v77 = [(PODeviceConfiguration *)self authGracePeriodStart];
    v79 = [v5 stringFromDate:v77];
  }
  else
  {
    v79 = 0;
  }
  v80 = NSStringFromSelector(sel_authGracePeriodStart);
  [v7 setObject:v79 forKeyedSubscript:v80];

  if (v78)
  {
  }
  v81 = [(PODeviceConfiguration *)self nonPlatformSSOAccounts];
  v82 = NSStringFromSelector(sel_nonPlatformSSOAccounts);
  [v7 setObject:v81 forKeyedSubscript:v82];

  v83 = [MEMORY[0x263EFF910] date];
  v84 = [v5 stringFromDate:v83];
  [v7 setObject:v84 forKeyedSubscript:@"created"];

  uint64_t v90 = 0;
  v85 = [MEMORY[0x263F08900] dataWithJSONObject:v7 options:11 error:&v90];
  v86 = v85;
  if (v90)
  {
    id v87 = __54__PODeviceConfiguration_dataRepresentationForDisplay___block_invoke();
    id v88 = 0;
  }
  else
  {
    id v88 = v85;
  }

  return v88;
}

id __54__PODeviceConfiguration_dataRepresentationForDisplay___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error serializing device config."];
  v1 = PO_LOG_PODeviceConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v0, v1);
  }

  return v0;
}

- (PODeviceConfiguration)initWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(PODeviceConfiguration *)self init];
  if (!v5)
  {
LABEL_70:
    v11 = v5;
    goto LABEL_71;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v6 setFormatOptions:1907];
  id v160 = 0;
  id v7 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:16 error:&v160];
  id v8 = v160;
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
    v16 = NSStringFromSelector(sel__deviceSigningKeyData);
    v17 = [v7 objectForKeyedSubscript:v16];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263EFF8F8]);
      v19 = NSStringFromSelector(sel__deviceSigningKeyData);
      v20 = [v7 objectForKeyedSubscript:v19];
      uint64_t v21 = objc_msgSend(v18, "psso_initWithBase64URLEncodedString:", v20);

      deviceSigningKeyData = v5->__deviceSigningKeyData;
      v5->__deviceSigningKeyData = (NSData *)v21;
    }
    v23 = NSStringFromSelector(sel_deviceSigningCertificate);
    v24 = [v7 objectForKeyedSubscript:v23];

    if (v24)
    {
      id v25 = objc_alloc(MEMORY[0x263EFF8F8]);
      v26 = NSStringFromSelector(sel_deviceSigningCertificate);
      v27 = [v7 objectForKeyedSubscript:v26];
      v28 = objc_msgSend(v25, "psso_initWithBase64URLEncodedString:", v27);

      v5->_deviceSigningCertificate = +[POSecKeyHelper certificateForData:v28];
    }
    v29 = NSStringFromSelector(sel_signingAlgorithm);
    v30 = [v7 objectForKeyedSubscript:v29];

    if (v30)
    {
      v31 = NSStringFromSelector(sel_signingAlgorithm);
      uint64_t v32 = [v7 objectForKeyedSubscript:v31];

      signingAlgorithm = v5->_signingAlgorithm;
      v5->_signingAlgorithm = (NSNumber *)v32;
    }
    else
    {
      id v34 = &unk_2707DBB50;
      signingAlgorithm = v5->_signingAlgorithm;
      v5->_signingAlgorithm = (NSNumber *)v34;
    }

    v35 = NSStringFromSelector(sel_pendingSigningAlgorithm);
    v36 = [v7 objectForKeyedSubscript:v35];

    if (v36)
    {
      v37 = NSStringFromSelector(sel_pendingSigningAlgorithm);
      uint64_t v38 = [v7 objectForKeyedSubscript:v37];

      pendingSigningAlgorithm = v5->_pendingSigningAlgorithm;
      v5->_pendingSigningAlgorithm = (NSNumber *)v38;
    }
    v40 = NSStringFromSelector(sel__deviceEncryptionKeyData);
    v41 = [v7 objectForKeyedSubscript:v40];

    if (v41)
    {
      id v42 = objc_alloc(MEMORY[0x263EFF8F8]);
      v43 = NSStringFromSelector(sel__deviceEncryptionKeyData);
      v44 = [v7 objectForKeyedSubscript:v43];
      uint64_t v45 = objc_msgSend(v42, "psso_initWithBase64URLEncodedString:", v44);

      deviceEncryptionKeyData = v5->__deviceEncryptionKeyData;
      v5->__deviceEncryptionKeyData = (NSData *)v45;
    }
    v47 = NSStringFromSelector(sel_deviceEncryptionCertificate);
    v48 = [v7 objectForKeyedSubscript:v47];

    if (v48)
    {
      id v49 = objc_alloc(MEMORY[0x263EFF8F8]);
      v50 = NSStringFromSelector(sel_deviceEncryptionCertificate);
      v51 = [v7 objectForKeyedSubscript:v50];
      v52 = objc_msgSend(v49, "psso_initWithBase64URLEncodedString:", v51);

      v5->_deviceEncryptionCertificate = +[POSecKeyHelper certificateForData:v52];
    }
    v53 = NSStringFromSelector(sel_encryptionAlgorithm);
    v54 = [v7 objectForKeyedSubscript:v53];

    if (v54)
    {
      v55 = NSStringFromSelector(sel_encryptionAlgorithm);
      uint64_t v56 = [v7 objectForKeyedSubscript:v55];

      encryptionAlgorithm = v5->_encryptionAlgorithm;
      v5->_encryptionAlgorithm = (NSNumber *)v56;
    }
    else
    {
      id v58 = &unk_2707DBB50;
      encryptionAlgorithm = v5->_encryptionAlgorithm;
      v5->_encryptionAlgorithm = (NSNumber *)v58;
    }

    v59 = NSStringFromSelector(sel_pendingEncryptionAlgorithm);
    v60 = [v7 objectForKeyedSubscript:v59];

    if (v60)
    {
      v61 = NSStringFromSelector(sel_pendingEncryptionAlgorithm);
      uint64_t v62 = [v7 objectForKeyedSubscript:v61];

      pendingEncryptionAlgorithm = v5->_pendingEncryptionAlgorithm;
      v5->_pendingEncryptionAlgorithm = (NSNumber *)v62;
    }
    v64 = NSStringFromSelector(sel_lastEncryptionKeyChange);
    v65 = [v7 objectForKeyedSubscript:v64];

    if (v65)
    {
      v66 = NSStringFromSelector(sel_lastEncryptionKeyChange);
      v67 = [v7 objectForKeyedSubscript:v66];

      uint64_t v68 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v67, "intValue"));
      lastEncryptionKeyChange = v5->_lastEncryptionKeyChange;
      v5->_lastEncryptionKeyChange = (NSDate *)v68;
    }
    v70 = NSStringFromSelector(sel_extensionIdentifier);
    uint64_t v71 = [v7 objectForKeyedSubscript:v70];
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v71;

    v73 = NSStringFromSelector(sel_registrationCompleted);
    v74 = [v7 objectForKeyedSubscript:v73];

    if (v74)
    {
      v75 = NSStringFromSelector(sel_registrationCompleted);
      v76 = [v7 objectForKeyedSubscript:v75];

      v5->_registrationCompleted = [v76 BOOLValue];
    }
    else
    {
      v5->_registrationCompleted = 0;
    }
    v77 = NSStringFromSelector(sel_sharedDeviceKeys);
    v78 = [v7 objectForKeyedSubscript:v77];

    if (v78)
    {
      v79 = NSStringFromSelector(sel_sharedDeviceKeys);
      v80 = [v7 objectForKeyedSubscript:v79];

      v5->_sharedDeviceKeys = [v80 BOOLValue];
    }
    else
    {
      v5->_sharedDeviceKeys = 0;
    }
    v81 = NSStringFromSelector(sel_protocolVersion);
    v82 = [v7 objectForKeyedSubscript:v81];

    if (v82)
    {
      v83 = NSStringFromSelector(sel_protocolVersion);
      v84 = [v7 objectForKeyedSubscript:v83];

      v5->_protocolVersion = (int)[v84 intValue];
    }
    else
    {
      v5->_protocolVersion = 0;
    }
    v85 = NSStringFromSelector(sel_sdkVersionString);
    uint64_t v86 = [v7 objectForKeyedSubscript:v85];
    sdkVersionString = v5->_sdkVersionString;
    v5->_sdkVersionString = (NSNumber *)v86;

    if (!v5->_sdkVersionString)
    {
      v5->_sdkVersionString = (NSNumber *)&unk_2707DBAC0;
    }
    id v88 = NSStringFromSelector(sel_loginType);
    v89 = [v7 objectForKeyedSubscript:v88];
    v5->_unint64_t loginType = (int)[v89 intValue];

    uint64_t v90 = NSStringFromSelector(sel_createUsersEnabled);
    v91 = [v7 objectForKeyedSubscript:v90];

    if (v91)
    {
      v92 = NSStringFromSelector(sel_createUsersEnabled);
      v93 = [v7 objectForKeyedSubscript:v92];

      v5->_createUsersEnabled = [v93 BOOLValue];
    }
    else
    {
      v5->_createUsersEnabled = 0;
    }
    v94 = NSStringFromSelector(sel_authorizationEnabled);
    v95 = [v7 objectForKeyedSubscript:v94];

    if (v95)
    {
      v96 = NSStringFromSelector(sel_authorizationEnabled);
      v97 = [v7 objectForKeyedSubscript:v96];

      v5->_authorizationEnabled = [v97 BOOLValue];
    }
    else
    {
      v5->_authorizationEnabled = 0;
    }
    v98 = NSStringFromSelector(sel_tokenToUserMapping);
    uint64_t v99 = [v7 objectForKeyedSubscript:v98];
    tokenToUserMapping = v5->_tokenToUserMapping;
    v5->_tokenToUserMapping = (NSDictionary *)v99;

    v101 = NSStringFromSelector(sel_newUserAuthorizationMode);
    v102 = [v7 objectForKeyedSubscript:v101];

    if (v102)
    {
      v103 = NSStringFromSelector(sel_newUserAuthorizationMode);
      v104 = [v7 objectForKeyedSubscript:v103];

      v5->_newUserAuthorizationMode = (int)[v104 intValue];
    }
    else
    {
      v5->_newUserAuthorizationMode = 0;
    }
    v105 = NSStringFromSelector(sel_userAuthorizationMode);
    v106 = [v7 objectForKeyedSubscript:v105];

    if (v106)
    {
      v107 = NSStringFromSelector(sel_userAuthorizationMode);
      v108 = [v7 objectForKeyedSubscript:v107];

      v5->_userAuthorizationMode = (int)[v108 intValue];
    }
    else
    {
      v5->_userAuthorizationMode = 0;
    }
    v109 = NSStringFromSelector(sel_administratorGroups);
    uint64_t v110 = [v7 objectForKeyedSubscript:v109];
    administratorGroups = v5->_administratorGroups;
    v5->_administratorGroups = (NSArray *)v110;

    v112 = NSStringFromSelector(sel_authorizationGroups);
    uint64_t v113 = [v7 objectForKeyedSubscript:v112];
    authorizationGroups = v5->_authorizationGroups;
    v5->_authorizationGroups = (NSDictionary *)v113;

    v115 = NSStringFromSelector(sel_otherGroups);
    uint64_t v116 = [v7 objectForKeyedSubscript:v115];
    otherGroups = v5->_otherGroups;
    v5->_otherGroups = (NSArray *)v116;

    v118 = NSStringFromSelector(sel_defaultUserDomain);
    uint64_t v119 = [v7 objectForKeyedSubscript:v118];
    defaultUserDomain = v5->_defaultUserDomain;
    v5->_defaultUserDomain = (NSString *)v119;

    v121 = NSStringFromSelector(sel_accountDisplayName);
    uint64_t v122 = [v7 objectForKeyedSubscript:v121];
    accountDisplayName = v5->_accountDisplayName;
    v5->_accountDisplayName = (NSString *)v122;

    v124 = NSStringFromSelector(sel_loginFrequency);
    uint64_t v125 = [v7 objectForKeyedSubscript:v124];
    loginFrequency = v5->_loginFrequency;
    v5->_loginFrequency = (NSNumber *)v125;

    v127 = NSStringFromSelector(sel_fileVaultPolicy);
    v128 = [v7 objectForKeyedSubscript:v127];

    if (v128)
    {
      v129 = NSStringFromSelector(sel_fileVaultPolicy);
      v130 = [v7 objectForKeyedSubscript:v129];

      v5->_fileVaultPolicy = (int)[v130 intValue];
    }
    else
    {
      v5->_fileVaultPolicy = 0;
    }
    v131 = NSStringFromSelector(sel_loginPolicy);
    v132 = [v7 objectForKeyedSubscript:v131];

    if (v132)
    {
      v133 = NSStringFromSelector(sel_loginPolicy);
      v134 = [v7 objectForKeyedSubscript:v133];

      v5->_loginPolicy = (int)[v134 intValue];
    }
    else
    {
      v5->_loginPolicy = 0;
    }
    v135 = NSStringFromSelector(sel_unlockPolicy);
    v136 = [v7 objectForKeyedSubscript:v135];

    if (v136)
    {
      v137 = NSStringFromSelector(sel_unlockPolicy);
      v138 = [v7 objectForKeyedSubscript:v137];

      v5->_unlockPolicy = (int)[v138 intValue];
    }
    else
    {
      v5->_unlockPolicy = 0;
    }
    v139 = NSStringFromSelector(sel_offlineGracePeriod);
    v140 = [v7 objectForKeyedSubscript:v139];

    if (v140)
    {
      v141 = NSStringFromSelector(sel_offlineGracePeriod);
      v142 = [v7 objectForKeyedSubscript:v141];

      v5->_offlineGracePeriod = (int)[v142 intValue];
    }
    else
    {
      v5->_offlineGracePeriod = 604800;
    }
    v143 = NSStringFromSelector(sel_requireAuthGracePeriod);
    v144 = [v7 objectForKeyedSubscript:v143];

    if (v144)
    {
      v145 = NSStringFromSelector(sel_requireAuthGracePeriod);
      v146 = [v7 objectForKeyedSubscript:v145];

      v5->_requireAuthGracePeriod = (int)[v146 intValue];
    }
    else
    {
      v5->_requireAuthGracePeriod = 604800;
    }
    v147 = NSStringFromSelector(sel_authGracePeriodStart);
    v148 = [v7 objectForKeyedSubscript:v147];

    if (v148)
    {
      uint64_t v149 = [v6 dateFromString:v148];
      authGracePeriodStart = v5->_authGracePeriodStart;
      v5->_authGracePeriodStart = (NSDate *)v149;
    }
    id v151 = objc_alloc_init(MEMORY[0x263EFF980]);
    v152 = NSStringFromSelector(sel_nonPlatformSSOAccounts);
    v153 = [v7 objectForKeyedSubscript:v152];

    v156[0] = MEMORY[0x263EF8330];
    v156[1] = 3221225472;
    v156[2] = __38__PODeviceConfiguration_initWithData___block_invoke_102;
    v156[3] = &unk_265463978;
    id v154 = v151;
    id v157 = v154;
    [v153 enumerateObjectsUsingBlock:v156];
    if ([v154 count]) {
      objc_storeStrong((id *)&v5->_nonPlatformSSOAccounts, v151);
    }

    goto LABEL_70;
  }
  v158[0] = MEMORY[0x263EF8330];
  v158[1] = 3221225472;
  v158[2] = __38__PODeviceConfiguration_initWithData___block_invoke;
  v158[3] = &unk_265463860;
  id v159 = v8;
  id v9 = v8;
  id v10 = __38__PODeviceConfiguration_initWithData___block_invoke((uint64_t)v158);

  v11 = 0;
LABEL_71:

  return v11;
}

id __38__PODeviceConfiguration_initWithData___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing device config."];
  v2 = PO_LOG_PODeviceConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2);
  }

  return v1;
}

void __38__PODeviceConfiguration_initWithData___block_invoke_102(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(PODeviceConfiguration *)self dataRepresentationForDisplay:1];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PODeviceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_dataRepresentation);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = [(PODeviceConfiguration *)self initWithData:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(PODeviceConfiguration *)self dataRepresentation];
  uint64_t v5 = NSStringFromSelector(sel_dataRepresentation);
  [v4 encodeObject:v6 forKey:v5];
}

- (int)version
{
  return self->_version;
}

- (NSString)accountDisplayName
{
  return self->_accountDisplayName;
}

- (void)setAccountDisplayName:(id)a3
{
}

- (void)setLoginFrequency:(id)a3
{
}

- (__SecCertificate)deviceSigningCertificate
{
  return self->_deviceSigningCertificate;
}

- (void)setDeviceSigningCertificate:(__SecCertificate *)a3
{
  self->_deviceSigningCertificate = a3;
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

- (__SecCertificate)deviceEncryptionCertificate
{
  return self->_deviceEncryptionCertificate;
}

- (void)setDeviceEncryptionCertificate:(__SecCertificate *)a3
{
  self->_deviceEncryptionCertificate = a3;
}

- (NSNumber)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(id)a3
{
}

- (NSNumber)pendingEncryptionAlgorithm
{
  return self->_pendingEncryptionAlgorithm;
}

- (void)setPendingEncryptionAlgorithm:(id)a3
{
}

- (NSDate)lastEncryptionKeyChange
{
  return self->_lastEncryptionKeyChange;
}

- (void)setLastEncryptionKeyChange:(id)a3
{
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (BOOL)registrationCompleted
{
  return self->_registrationCompleted;
}

- (void)setRegistrationCompleted:(BOOL)a3
{
  self->_registrationCompleted = a3;
}

- (unint64_t)loginType
{
  return self->_loginType;
}

- (void)setLoginType:(unint64_t)a3
{
  self->_unint64_t loginType = a3;
}

- (BOOL)sharedDeviceKeys
{
  return self->_sharedDeviceKeys;
}

- (void)setSharedDeviceKeys:(BOOL)a3
{
  self->_sharedDeviceKeys = a3;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (NSNumber)sdkVersionString
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSdkVersionString:(id)a3
{
}

- (BOOL)createUsersEnabled
{
  return self->_createUsersEnabled;
}

- (void)setCreateUsersEnabled:(BOOL)a3
{
  self->_createUsersEnabled = a3;
}

- (BOOL)authorizationEnabled
{
  return self->_authorizationEnabled;
}

- (void)setAuthorizationEnabled:(BOOL)a3
{
  self->_authorizationEnabled = a3;
}

- (NSString)defaultUserDomain
{
  return self->_defaultUserDomain;
}

- (void)setDefaultUserDomain:(id)a3
{
}

- (NSDictionary)tokenToUserMapping
{
  return self->_tokenToUserMapping;
}

- (void)setTokenToUserMapping:(id)a3
{
}

- (int64_t)newUserAuthorizationMode
{
  return self->_newUserAuthorizationMode;
}

- (void)setNewUserAuthorizationMode:(int64_t)a3
{
  self->_newUserAuthorizationMode = a3;
}

- (int64_t)userAuthorizationMode
{
  return self->_userAuthorizationMode;
}

- (void)setUserAuthorizationMode:(int64_t)a3
{
  self->_userAuthorizationMode = a3;
}

- (NSArray)administratorGroups
{
  return self->_administratorGroups;
}

- (void)setAdministratorGroups:(id)a3
{
}

- (NSArray)otherGroups
{
  return self->_otherGroups;
}

- (void)setOtherGroups:(id)a3
{
}

- (NSDictionary)authorizationGroups
{
  return self->_authorizationGroups;
}

- (void)setAuthorizationGroups:(id)a3
{
}

- (unint64_t)fileVaultPolicy
{
  return self->_fileVaultPolicy;
}

- (void)setFileVaultPolicy:(unint64_t)a3
{
  self->_fileVaultPolicy = a3;
}

- (unint64_t)loginPolicy
{
  return self->_loginPolicy;
}

- (void)setLoginPolicy:(unint64_t)a3
{
  self->_loginPolicy = a3;
}

- (unint64_t)unlockPolicy
{
  return self->_unlockPolicy;
}

- (void)setUnlockPolicy:(unint64_t)a3
{
  self->_unlockPolicy = a3;
}

- (int64_t)offlineGracePeriod
{
  return self->_offlineGracePeriod;
}

- (void)setOfflineGracePeriod:(int64_t)a3
{
  self->_offlineGracePeriod = a3;
}

- (int64_t)requireAuthGracePeriod
{
  return self->_requireAuthGracePeriod;
}

- (void)setRequireAuthGracePeriod:(int64_t)a3
{
  self->_requireAuthGracePeriod = a3;
}

- (NSDate)authGracePeriodStart
{
  return self->_authGracePeriodStart;
}

- (void)setAuthGracePeriodStart:(id)a3
{
}

- (NSArray)nonPlatformSSOAccounts
{
  return self->_nonPlatformSSOAccounts;
}

- (void)setNonPlatformSSOAccounts:(id)a3
{
}

- (NSData)_deviceSigningKeyData
{
  return self->__deviceSigningKeyData;
}

- (void)set_deviceSigningKeyData:(id)a3
{
}

- (NSData)_deviceEncryptionKeyData
{
  return self->__deviceEncryptionKeyData;
}

- (void)set_deviceEncryptionKeyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deviceEncryptionKeyData, 0);
  objc_storeStrong((id *)&self->__deviceSigningKeyData, 0);
  objc_storeStrong((id *)&self->_nonPlatformSSOAccounts, 0);
  objc_storeStrong((id *)&self->_authGracePeriodStart, 0);
  objc_storeStrong((id *)&self->_authorizationGroups, 0);
  objc_storeStrong((id *)&self->_otherGroups, 0);
  objc_storeStrong((id *)&self->_administratorGroups, 0);
  objc_storeStrong((id *)&self->_tokenToUserMapping, 0);
  objc_storeStrong((id *)&self->_defaultUserDomain, 0);
  objc_storeStrong((id *)&self->_sdkVersionString, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_lastEncryptionKeyChange, 0);
  objc_storeStrong((id *)&self->_pendingEncryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_encryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_pendingSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_signingAlgorithm, 0);
  objc_storeStrong((id *)&self->_loginFrequency, 0);
  objc_storeStrong((id *)&self->_accountDisplayName, 0);
}

- (void)supportsTokenUnlock
{
  objc_msgSend(v1, "numberWithBool:", OUTLINED_FUNCTION_2_0(a1, *MEMORY[0x263EF8340]));
  objc_claimAutoreleasedReturnValue();
  id v3 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend((id)OUTLINED_FUNCTION_3(), "protocolVersion"));
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_259DFE000, v4, v5, "%s shared = %{public}@, protocolversion = %{public}@ on %@", v6, v7, v8, v9, 2u);
}

- (void)supportsAuthorization
{
  objc_msgSend(v1, "numberWithBool:", OUTLINED_FUNCTION_2_0(a1, *MEMORY[0x263EF8340]));
  objc_claimAutoreleasedReturnValue();
  id v3 = objc_msgSend(v2, "numberWithBool:", objc_msgSend((id)OUTLINED_FUNCTION_3(), "authorizationEnabled"));
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_259DFE000, v4, v5, "%s shared = %{public}@, authorizationEnabled = %{public}@ on %@", v6, v7, v8, v9, 2u);
}

- (void)supportsCreateNewUsers
{
  objc_msgSend(v1, "numberWithBool:", OUTLINED_FUNCTION_2_0(a1, *MEMORY[0x263EF8340]));
  objc_claimAutoreleasedReturnValue();
  id v3 = objc_msgSend(v2, "numberWithBool:", objc_msgSend((id)OUTLINED_FUNCTION_3(), "createUsersEnabled"));
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_259DFE000, v4, v5, "%s shared = %{public}@, createUsersEnabled = %{public}@ on %@", v6, v7, v8, v9, 2u);
}

@end