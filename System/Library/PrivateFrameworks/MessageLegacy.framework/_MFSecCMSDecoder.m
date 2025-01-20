@interface _MFSecCMSDecoder
- (BOOL)isContentEncrypted;
- (BOOL)isContentSigned;
- (NSArray)signers;
- (_MFSecCMSDecoder)initWithPartData:(id)a3 error:(id *)a4;
- (id)data;
- (id)signedData;
- (id)verifyAgainstSenders:(id)a3 signingError:(id *)a4;
- (int)lastSecCMSError;
- (int64_t)appendData:(id)a3;
- (void)dealloc;
- (void)done;
@end

@implementation _MFSecCMSDecoder

- (_MFSecCMSDecoder)initWithPartData:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  v19.receiver = self;
  v19.super_class = (Class)_MFSecCMSDecoder;
  id v6 = [(_MFSecCMSDecoder *)&v19 init];
  if (v6)
  {
    uint64_t v18 = 0;
    int v7 = SecCmsDecoderCreate();
    *((_DWORD *)v6 + 2) = v7;
    if (v7)
    {
      v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_MFSecCMSDecoder initWithPartData:error:]();
      }
    }
    else
    {
      [a3 bytes];
      [a3 length];
      int v9 = SecCmsDecoderUpdate();
      *((_DWORD *)v6 + 2) = v9;
      if (v9)
      {
        v10 = MFLogGeneral();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[_MFSecCMSDecoder initWithPartData:error:]((int *)v6 + 2, a3, v10);
        }
      }
      else
      {
        int v12 = SecCmsDecoderFinish();
        *((_DWORD *)v6 + 2) = v12;
        uint64_t v18 = 0;
        if (*((void *)v6 + 2))
        {
          *((unsigned char *)v6 + 56) = SecCmsMessageIsEncrypted() != 0;
          int v12 = *((_DWORD *)v6 + 2);
        }
        if (v12)
        {
          v13 = MFLogGeneral();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[_MFSecCMSDecoder initWithPartData:error:]();
          }
        }
        *((void *)v6 + 6) = _ExtractContentWithTag(*((void *)v6 + 2), 27);
        uint64_t ContentWithTag = _ExtractContentWithTag(*((void *)v6 + 2), 26);
        *((void *)v6 + 5) = ContentWithTag;
        if (ContentWithTag)
        {
          if (!SecCmsSignedDataHasDigests())
          {
            SecCmsSignedDataGetDigestAlgs();
            uint64_t started = SecCmsDigestContextStartMultiple();
            *((void *)v6 + 3) = started;
            if (!started)
            {

              v16 = MFLogGeneral();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v17 = 0;
                _os_log_impl(&dword_1CFCFE000, v16, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsDigestContextStartMultiple failed", v17, 2u);
              }
              id v6 = 0;
              if (a4) {
                *a4 = +[MFError errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:0];
              }
            }
          }
        }
      }
    }
    if (v18) {
      SecCmsDecoderDestroy();
    }
    if (v6 && a4 && *((_DWORD *)v6 + 2)) {
      *a4 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
    }
  }
  return (_MFSecCMSDecoder *)v6;
}

- (void)dealloc
{
  digest = self->_digest;
  if (digest) {
    MEMORY[0x1D25DD250](digest, a2);
  }
  if (self->_message) {
    SecCmsMessageDestroy();
  }

  v4.receiver = self;
  v4.super_class = (Class)_MFSecCMSDecoder;
  [(_MFSecCMSDecoder *)&v4 dealloc];
}

- (int64_t)appendData:(id)a3
{
  if (self->_SecCMSError)
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSDecoder appendData:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
    return -1;
  }
  if (self->_signedData)
  {
    int64_t v11 = [a3 length];
    if (self->_digest)
    {
      [a3 bytes];
      SecCmsDigestContextUpdate();
    }
    return v11;
  }
  if (!self->_envelopedData)
  {
    v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1CFCFE000, v15, OS_LOG_TYPE_INFO, "#SMIMEErrors -appendData: called on _MFSecCMSDecoder with no signed or enveloped data!", v16, 2u);
    }
    return -1;
  }
  return [a3 length];
}

- (void)done
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsSignedDataSetDigestContext on -done returned %ld", v2, v3, v4, v5, v6);
}

- (id)data
{
  envelopedData = self->_envelopedData;
  if (envelopedData)
  {
    SecCmsEnvelopedDataGetContentInfo();
    envelopedData = (void *)SecCmsContentInfoGetInnerContent();
    if (envelopedData) {
      envelopedData = (void *)[objc_alloc(MEMORY[0x1E4F73540]) initWithBytesNoCopy:envelopedData[1] length:*envelopedData freeWhenDone:0];
    }
  }
  return envelopedData;
}

- (id)verifyAgainstSenders:(id)a3 signingError:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  if (!self->_SecCMSError)
  {
    if ([a3 count]) {
      uint64_t v10 = [a3 objectAtIndex:0];
    }
    else {
      uint64_t v10 = 0;
    }
    if (SecCmsSignedDataHasDigests())
    {
      if (v10)
      {
        int v11 = SecCmsSignedDataSignerInfoCount();
        int v12 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
        if (v11)
        {
          v13 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:v10];
          v14 = v13;
          int v36 = v11;
          if (v11 >= 1)
          {
            int v15 = 0;
            uint64_t v7 = 0;
            int v16 = v36;
            v37 = v13;
            while (1)
            {
              SignerInfo = (const void *)SecCmsSignedDataGetSignerInfo();
              int v18 = SecCmsSignedDataVerifySignerInfo();
              self->_uint64_t SecCMSError = v18;
              if (!v18)
              {
                if (SignerInfo)
                {
                  uint64_t VerificationStatus = SecCmsSignerInfoGetVerificationStatus();
                  SignerInfo = (const void *)SecCmsSignerInfoCopyCertFromEncryptionKeyPreference();
                  if (SignerInfo)
                  {
LABEL_22:
                    v22 = v12;
                    uint64_t v23 = v10;
                    v24 = +[MFMessageKeychainManager copySMIMEEncryptionPolicyForAddress:v10];
                    *(void *)trust = 0;
                    OSStatus v25 = SecTrustCreateWithCertificates(SignerInfo, v24, (SecTrustRef *)trust);
                    CFRelease(v24);
                    CFRelease(SignerInfo);
                    if (v25)
                    {
                      v26 = MFLogGeneral();
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67109120;
                        OSStatus v48 = v25;
                        _os_log_error_impl(&dword_1CFCFE000, v26, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned %d", buf, 8u);
                      }
                      SignerInfo = 0;
                      uint64_t v10 = v23;
                      int v12 = v22;
                      int v16 = v36;
                    }
                    else
                    {
                      SignerInfo = *(const void **)trust;
                      uint64_t v10 = v23;
                      int v12 = v22;
                      int v16 = v36;
                      if (!*(void *)trust)
                      {
                        v28 = MFLogGeneral();
                        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                          -[_MFSecCMSDecoder verifyAgainstSenders:signingError:](&v38, v39, v28);
                        }
                        SignerInfo = 0;
                      }
                    }
                  }
                  else
                  {
                    SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(0, 0);
                    if ((SecCertificateGetKeyUsage() & 4) != 0)
                    {
                      SignerInfo = CFRetain(CertificateAtIndex);
                      goto LABEL_22;
                    }
                  }
                }
                else
                {
                  uint64_t VerificationStatus = 2;
                }
                v29 = [[MFMessageSigner alloc] initWithSender:v10 signingTrust:0 encryptionTrust:SignerInfo verification:VerificationStatus];
                if (SignerInfo) {
                  CFRelease(SignerInfo);
                }
                if (a4)
                {
                  v30 = [(MFMessageSigner *)v29 error];
                  *a4 = v30;
                  if (v30)
                  {
                    v31 = MFLogGeneral();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                      [(_MFSecCMSDecoder *)v40 verifyAgainstSenders:&v41 signingError:v31];
                    }
                  }
                }
                [(NSArray *)v12 addObject:v29];

                goto LABEL_42;
              }
              uint64_t v7 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
              objc_super v19 = SignerInfo ? (const void *)SecCmsSignerInfoGetSignerEmailAddress() : 0;
              v27 = MFLogGeneral();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                break;
              }
              if (v19) {
                goto LABEL_29;
              }
LABEL_42:
              v14 = v37;
              if (v16 == ++v15) {
                goto LABEL_55;
              }
            }
            uint64_t SecCMSError = self->_SecCMSError;
            v33 = @"(Unknown)";
            if (!v19) {
              v33 = 0;
            }
            *(_DWORD *)trust = 134218498;
            *(void *)&trust[4] = SecCMSError;
            __int16 v43 = 1024;
            int v44 = v15;
            __int16 v45 = 2112;
            v46 = v33;
            _os_log_error_impl(&dword_1CFCFE000, v27, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecCmsSignedDataVerifySignerInfo returned %ld for #%d:%@", trust, 0x1Cu);
            if (!v19) {
              goto LABEL_42;
            }
LABEL_29:
            CFRelease(v19);
            goto LABEL_42;
          }
          uint64_t v7 = 0;
LABEL_55:
          if (v14) {
            CFRelease(v14);
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
        self->_signers = v12;
        return v7;
      }
      uint64_t v7 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
      v34 = MFLogGeneral();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
        return v7;
      }
      *(_WORD *)trust = 0;
      v35 = "#SMIMEErrors The message sender is missing";
    }
    else
    {
      uint64_t v7 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
      v34 = MFLogGeneral();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
        return v7;
      }
      *(_WORD *)trust = 0;
      v35 = "#SMIMEErrors There were no digests in the message";
    }
    _os_log_impl(&dword_1CFCFE000, v34, OS_LOG_TYPE_INFO, v35, trust, 2u);
    return v7;
  }
  uint64_t v7 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
  uint64_t v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_MFSecCMSDecoder verifyAgainstSenders:signingError:]();
  }
  return v7;
}

- (BOOL)isContentEncrypted
{
  return self->_isEncrypted;
}

- (BOOL)isContentSigned
{
  return self->_signedData != 0;
}

- (id)signedData
{
  signedData = self->_signedData;
  if (signedData)
  {
    SecCmsSignedDataGetContentInfo();
    signedData = (void *)SecCmsContentInfoGetInnerContent();
    if (signedData) {
      signedData = (void *)[objc_alloc(MEMORY[0x1E4F73540]) initWithBytesNoCopy:signedData[1] length:*signedData freeWhenDone:0];
    }
  }
  return signedData;
}

- (int)lastSecCMSError
{
  return self->_SecCMSError;
}

- (NSArray)signers
{
  return self->_signers;
}

- (void)initWithPartData:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsDecoderFinish returned %ld", v2, v3, v4, v5, v6);
}

- (void)initWithPartData:(NSObject *)a3 error:.cold.2(int *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  int v5 = 134218240;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 length];
  _os_log_error_impl(&dword_1CFCFE000, a3, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecCmsDecoderUpdate returned %ld for %lu bytes", (uint8_t *)&v5, 0x16u);
}

- (void)initWithPartData:error:.cold.3()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsDecoderCreate returned %ld", v2, v3, v4, v5, v6);
}

- (void)appendData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyAgainstSenders:(uint64_t *)a3 signingError:(NSObject *)a4 .cold.1(uint8_t *a1, id *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = objc_msgSend(*a2, "ef_publicDescription");
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1CFCFE000, a4, OS_LOG_TYPE_ERROR, "#SMIMEErrors There was a signing error %{public}@", a1, 0xCu);
}

- (void)verifyAgainstSenders:(os_log_t)log signingError:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1CFCFE000, log, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned a null SecTrustRef", buf, 2u);
}

- (void)verifyAgainstSenders:signingError:.cold.3()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors _MFSecCMSDecoder asked to verify with pending error (%ld)", v2, v3, v4, v5, v6);
}

@end