@interface MFMessageSigner
- (BOOL)hasSeparateSigningAndEncryptionCertificates;
- (MFCertificateTrustInfo)encryptionCertificateTrustInfo;
- (MFCertificateTrustInfo)signingCertificateTrustInfo;
- (MFError)error;
- (MFMessageSigner)initWithSender:(id)a3 signingTrust:(__SecTrust *)a4 encryptionTrust:(__SecTrust *)a5 verification:(int)a6;
- (void)dealloc;
@end

@implementation MFMessageSigner

- (MFMessageSigner)initWithSender:(id)a3 signingTrust:(__SecTrust *)a4 encryptionTrust:(__SecTrust *)a5 verification:(int)a6
{
  v10 = [(MFMessageSigner *)self init];
  v11 = v10;
  if (v10)
  {
    v10->_status = a6;
    if (a4) {
      v10->_signingCertificateTrustInfo = [[MFCertificateTrustInfo alloc] initWithCertificateType:0 trust:a4 sender:a3];
    }
    if (a5) {
      v11->_encryptionCertificateTrustInfo = [[MFCertificateTrustInfo alloc] initWithCertificateType:1 trust:a5 sender:a3];
    }
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageSigner;
  [(MFMessageSigner *)&v3 dealloc];
}

- (BOOL)hasSeparateSigningAndEncryptionCertificates
{
  signingCertificateTrustInfo = self->_signingCertificateTrustInfo;
  if (signingCertificateTrustInfo)
  {
    if (!self->_encryptionCertificateTrustInfo
      || (v4 = [(MFCertificateTrustInfo *)signingCertificateTrustInfo trust],
          signingCertificateTrustInfo = [(MFCertificateTrustInfo *)self->_encryptionCertificateTrustInfo trust],
          v4 == (__SecTrust *)signingCertificateTrustInfo))
    {
      LOBYTE(signingCertificateTrustInfo) = 0;
    }
    else
    {
      v5 = (__SecTrust *)signingCertificateTrustInfo;
      LOBYTE(signingCertificateTrustInfo) = 1;
      if (v4 && v5)
      {
        SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(v4, 0);
        SecCertificateRef v7 = SecTrustGetCertificateAtIndex(v5, 0);
        LOBYTE(signingCertificateTrustInfo) = CFEqual(CertificateAtIndex, v7) == 0;
      }
    }
  }
  return (char)signingCertificateTrustInfo;
}

- (MFError)error
{
  v2 = 0;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int status = self->_status;
  if (status <= 0xC)
  {
    int v5 = 1 << status;
    if ((v5 & 0x1DFC) != 0)
    {
      id v6 = (id)[[NSString alloc] initWithFormat:MFLookupLocalizedString(@"SMIME_DAMAGED_SIG", @"The digital signature for this message is incorrect. The message may have been tampered with or corrupted since being signed by “%@”.", @"Delayed", -[MFCertificateTrustInfo sender](self->_signingCertificateTrustInfo, "sender")];
      SecCertificateRef v7 = MFLogGeneral();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
      uint64_t v8 = self->_status;
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v8;
      v9 = "#SMIMEErrors Verification was not good (%ld)";
    }
    else
    {
      if ((v5 & 0x201) == 0) {
        return v2;
      }
      id v6 = (id)MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
      SecCertificateRef v7 = MFLogGeneral();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
      uint64_t v11 = self->_status;
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v11;
      v9 = "#SMIMEErrors Verification went south (%ld)";
    }
    _os_log_impl(&dword_1CFCFE000, v7, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
LABEL_6:
    if (v6)
    {
      v2 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v6];

      [(MFError *)v2 setShortDescription:MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed")];
      [(MFError *)v2 setUserInfoObject:self forKey:@"MFSignerInfoErrorKey"];
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (MFCertificateTrustInfo)signingCertificateTrustInfo
{
  return self->_signingCertificateTrustInfo;
}

- (MFCertificateTrustInfo)encryptionCertificateTrustInfo
{
  return self->_encryptionCertificateTrustInfo;
}

@end