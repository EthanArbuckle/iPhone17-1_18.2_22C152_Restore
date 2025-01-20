@interface MFCertificateTrustInfo
- (BOOL)canSaveCertificateToKeychain;
- (BOOL)hasTrustException;
- (MFCertificateTrustInfo)initWithCertificateType:(unint64_t)a3 trust:(__SecTrust *)a4 sender:(id)a5;
- (NSString)commonName;
- (NSString)emailAddress;
- (NSString)sender;
- (__SecCertificate)certificate;
- (__SecTrust)trust;
- (int)action;
- (unint64_t)certificateType;
- (unint64_t)keychainStatus;
- (void)addTrustException;
- (void)dealloc;
- (void)keychainStatus;
- (void)removeCertificateFromKeychain;
- (void)removeTrustException;
- (void)saveCertificateToKeychain;
@end

@implementation MFCertificateTrustInfo

- (MFCertificateTrustInfo)initWithCertificateType:(unint64_t)a3 trust:(__SecTrust *)a4 sender:(id)a5
{
  id v9 = a5;
  if (!a4)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MFCertificateTrustInfo.m", 28, @"Invalid parameter not satisfying: %@", @"trust" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)MFCertificateTrustInfo;
  v10 = [(MFCertificateTrustInfo *)&v18 init];
  v11 = v10;
  if (v10)
  {
    v10->_certificateType = a3;
    v10->_trust = (__SecTrust *)CFRetain(a4);
    uint64_t v12 = [v9 copy];
    sender = v11->_sender;
    v11->_sender = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v9, "mf_copyUncommentedAddress");
    uncommentedSender = v11->_uncommentedSender;
    v11->_uncommentedSender = (NSString *)v14;
  }
  return v11;
}

- (void)dealloc
{
  CFRelease(self->_trust);
  v3.receiver = self;
  v3.super_class = (Class)MFCertificateTrustInfo;
  [(MFCertificateTrustInfo *)&v3 dealloc];
}

- (__SecCertificate)certificate
{
  return SecTrustGetCertificateAtIndex(self->_trust, 0);
}

- (int)action
{
  id v3 = +[MFMessageKeychainManager newTrustManager];
  LODWORD(self) = [v3 actionForSMIMETrust:self->_trust sender:self->_uncommentedSender];

  return (int)self;
}

- (NSString)commonName
{
  [(MFCertificateTrustInfo *)self certificate];
  v2 = (void *)SecCertificateCopyCommonNames();
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    v4 = (void *)[v3 copy];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)emailAddress
{
  [(MFCertificateTrustInfo *)self certificate];
  v2 = (void *)SecCertificateCopyRFC822Names();
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    v4 = (void *)[v3 copy];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)hasTrustException
{
  id v3 = +[MFMessageKeychainManager newTrustManager];
  LOBYTE(self) = [v3 _hasExceptionsForSMIMETrust:self->_trust sender:self->_uncommentedSender];

  return (char)self;
}

- (void)addTrustException
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = +[MFMessageKeychainManager newTrustManager];
  [v3 addSMIMETrust:self->_trust sender:self->_uncommentedSender];
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sender = self->_sender;
    int v7 = 138412290;
    v8 = sender;
    _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_INFO, "#SMIMEErrors Added trust exception for %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"MFCertificateTrustInfoTrustDidChangeNotification" object:self];
}

- (void)removeTrustException
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = +[MFMessageKeychainManager newTrustManager];
  [v3 removeSMIMETrust:self->_trust sender:self->_uncommentedSender];
  CFArrayRef policies = 0;
  if (!SecTrustCopyPolicies(self->_trust, &policies))
  {
    SecTrustSetPolicies(self->_trust, MEMORY[0x1E4F1CBF0]);
    SecTrustSetPolicies(self->_trust, policies);
    CFRelease(policies);
  }
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sender = self->_sender;
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = sender;
    _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_INFO, "#SMIMEErrors Removed trust exception for %@", buf, 0xCu);
  }

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"MFCertificateTrustInfoTrustDidChangeNotification" object:self];
}

- (BOOL)canSaveCertificateToKeychain
{
  return self->_certificateType == 1;
}

- (unint64_t)keychainStatus
{
  if (self->_certificateType != 1) {
    return 0;
  }
  p_sender = (uint64_t *)&self->_sender;
  sender = self->_sender;
  id v11 = 0;
  v5 = +[MFMessageKeychainManager copyEncryptionCertificateForAddress:sender error:&v11];
  id v6 = v11;
  int v7 = v6;
  if (v5)
  {
    if (CFEqual([(MFCertificateTrustInfo *)self certificate], v5)) {
      unint64_t v8 = 1;
    }
    else {
      unint64_t v8 = 2;
    }
    CFRelease(v5);
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(MFCertificateTrustInfo *)p_sender keychainStatus];
      }
    }
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)saveCertificateToKeychain
{
  if (self->_certificateType == 1) {
    id v2 = +[MFMessageKeychainManager saveEncryptionCertificate:[(MFCertificateTrustInfo *)self certificate] forAddress:self->_sender];
  }
}

- (void)removeCertificateFromKeychain
{
  if (self->_certificateType == 1) {
    id v2 = +[MFMessageKeychainManager saveEncryptionCertificate:0 forAddress:self->_sender];
  }
}

- (unint64_t)certificateType
{
  return self->_certificateType;
}

- (NSString)sender
{
  return self->_sender;
}

- (__SecTrust)trust
{
  return self->_trust;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_uncommentedSender, 0);
}

- (void)keychainStatus
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  v5 = objc_msgSend(a2, "ef_publicDescription");
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1CFCFE000, a3, OS_LOG_TYPE_ERROR, "#SMIMEErrors Error when retrieving encryption certificate for %@: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end