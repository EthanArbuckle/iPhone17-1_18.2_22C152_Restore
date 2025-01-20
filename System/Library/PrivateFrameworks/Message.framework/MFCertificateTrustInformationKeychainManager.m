@interface MFCertificateTrustInformationKeychainManager
+ (OS_os_log)log;
- (BOOL)canSaveCertificateToKeychain;
- (BOOL)hasTrustException;
- (MFCertificateTrustInformationKeychainManager)initWithTrustInformation:(id)a3;
- (NSString)addressForSaving;
- (int)action;
- (unint64_t)keychainStatus;
- (void)addTrustException;
- (void)keychainStatus;
- (void)removeCertificateFromKeychain;
- (void)removeTrustException;
- (void)saveCertificateToKeychain;
@end

@implementation MFCertificateTrustInformationKeychainManager

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MFCertificateTrustInformationKeychainManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1) {
    dispatch_once(&log_onceToken_11, block);
  }
  v2 = (void *)log_log_11;
  return (OS_os_log *)v2;
}

void __51__MFCertificateTrustInformationKeychainManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_11;
  log_log_11 = (uint64_t)v1;
}

- (MFCertificateTrustInformationKeychainManager)initWithTrustInformation:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MFCertificateTrustInformationKeychainManager;
  v6 = [(MFCertificateTrustInformationKeychainManager *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trustInformation, a3);
    v8 = +[MFMessageKeychainManager newTrustManager];
    keychainManager = v7->_keychainManager;
    v7->_keychainManager = v8;

    id v10 = [(EMCertificateTrustInformation *)v7->_trustInformation sender];
    v11 = [v10 emailAddressValue];
    v12 = [v11 simpleAddress];
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      v14 = [v10 stringValue];
    }
    v15 = v14;

    addressForSaving = v7->_addressForSaving;
    v7->_addressForSaving = v15;
  }
  return v7;
}

- (BOOL)canSaveCertificateToKeychain
{
  if (self) {
    self = (MFCertificateTrustInformationKeychainManager *)self->_trustInformation;
  }
  return [(MFCertificateTrustInformationKeychainManager *)self certificateType] == 1;
}

- (int)action
{
  if (self)
  {
    id v3 = self->_keychainManager;
    trustInformation = self->_trustInformation;
  }
  else
  {
    id v3 = 0;
    trustInformation = 0;
  }
  id v5 = trustInformation;
  uint64_t v6 = [(EMCertificateTrustInformation *)v5 trust];
  v7 = [(MFCertificateTrustInformationKeychainManager *)self addressForSaving];
  LODWORD(v6) = [(CertUITrustManager *)v3 actionForSMIMETrust:v6 sender:v7];

  return v6;
}

- (BOOL)hasTrustException
{
  if (self)
  {
    id v3 = self->_keychainManager;
    trustInformation = self->_trustInformation;
  }
  else
  {
    id v3 = 0;
    trustInformation = 0;
  }
  id v5 = trustInformation;
  uint64_t v6 = [(EMCertificateTrustInformation *)v5 trust];
  v7 = [(MFCertificateTrustInformationKeychainManager *)self addressForSaving];
  LOBYTE(v6) = [(CertUITrustManager *)v3 _hasExceptionsForSMIMETrust:v6 sender:v7];

  return v6;
}

- (void)addTrustException
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v3 = self->_keychainManager;
    trustInformation = self->_trustInformation;
  }
  else
  {
    id v3 = 0;
    trustInformation = 0;
  }
  id v5 = trustInformation;
  uint64_t v6 = [(EMCertificateTrustInformation *)v5 trust];
  v7 = [(MFCertificateTrustInformationKeychainManager *)self addressForSaving];
  [(CertUITrustManager *)v3 addSMIMETrust:v6 sender:v7];

  v8 = +[MFCertificateTrustInformationKeychainManager log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(MFCertificateTrustInformationKeychainManager *)self addressForSaving];
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "Added trust exception for %@", (uint8_t *)&v11, 0xCu);
  }
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"MFCertificateTrustDidChangeNotification" object:self];
}

- (void)removeTrustException
{
  v2 = self;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (MFCertificateTrustInformationKeychainManager *)self->_trustInformation;
  }
  id v3 = (__SecTrust *)[(MFCertificateTrustInformationKeychainManager *)self trust];
  if (v2) {
    keychainManager = v2->_keychainManager;
  }
  else {
    keychainManager = 0;
  }
  id v5 = keychainManager;
  uint64_t v6 = [(MFCertificateTrustInformationKeychainManager *)v2 addressForSaving];
  [(CertUITrustManager *)v5 removeSMIMETrust:v3 sender:v6];

  CFArrayRef policies = 0;
  if (!SecTrustCopyPolicies(v3, &policies))
  {
    SecTrustSetPolicies(v3, MEMORY[0x1E4F1CBF0]);
    SecTrustSetPolicies(v3, policies);
    CFRelease(policies);
  }
  v7 = +[MFCertificateTrustInformationKeychainManager log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(MFCertificateTrustInformationKeychainManager *)v2 addressForSaving];
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Removed trust exception for %@", buf, 0xCu);
  }
  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"MFCertificateTrustDidChangeNotification" object:v2];
}

- (void)saveCertificateToKeychain
{
  if ([(MFCertificateTrustInformationKeychainManager *)self canSaveCertificateToKeychain])
  {
    if (self) {
      trustInformation = self->_trustInformation;
    }
    else {
      trustInformation = 0;
    }
    v7 = trustInformation;
    uint64_t v4 = [(EMCertificateTrustInformation *)v7 certificate];
    id v5 = [(MFCertificateTrustInformationKeychainManager *)self addressForSaving];
    id v6 = +[MFMessageKeychainManager saveEncryptionCertificate:v4 forAddress:v5];
  }
}

- (void)removeCertificateFromKeychain
{
  if ([(MFCertificateTrustInformationKeychainManager *)self canSaveCertificateToKeychain])
  {
    id v4 = [(MFCertificateTrustInformationKeychainManager *)self addressForSaving];
    id v3 = +[MFMessageKeychainManager saveEncryptionCertificate:forAddress:](MFMessageKeychainManager, "saveEncryptionCertificate:forAddress:", 0);
  }
}

- (unint64_t)keychainStatus
{
  v2 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (MFCertificateTrustInformationKeychainManager *)self->_trustInformation;
  }
  if ([(MFCertificateTrustInformationKeychainManager *)self certificateType] != 1) {
    return 0;
  }
  id v3 = [(MFCertificateTrustInformationKeychainManager *)v2 addressForSaving];
  id v14 = 0;
  id v4 = +[MFMessageKeychainManager copyEncryptionCertificateForAddress:v3 error:&v14];
  id v5 = v14;

  if (v4)
  {
    if (v2) {
      trustInformation = v2->_trustInformation;
    }
    else {
      trustInformation = 0;
    }
    v7 = trustInformation;
    int v8 = CFEqual((CFTypeRef)[(EMCertificateTrustInformation *)v7 certificate], v4);

    CFRelease(v4);
    if (v8) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = 2;
    }
  }
  else
  {
    if (v5)
    {
      id v10 = +[MFCertificateTrustInformationKeychainManager log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = [(MFCertificateTrustInformationKeychainManager *)v2 addressForSaving];
        v12 = objc_msgSend(v5, "ef_publicDescription");
        [(MFCertificateTrustInformationKeychainManager *)v11 keychainStatus];
      }
    }
    unint64_t v9 = 0;
  }

  return v9;
}

- (NSString)addressForSaving
{
  return self->_addressForSaving;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_trustInformation, 0);
  objc_storeStrong((id *)&self->_addressForSaving, 0);
}

- (void)keychainStatus
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Error when retrieving encryption certificate for %@: %{public}@", buf, 0x16u);
}

@end