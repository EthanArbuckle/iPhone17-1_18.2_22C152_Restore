@interface _MFSecCMSDecoder
- (char)initWithPartData:(void *)a3 error:;
- (id)data;
- (id)verifyAgainstSenders:(id *)a3 signingError:;
- (int64_t)appendData:(id)a3;
- (void)dealloc;
- (void)done;
- (void)signedData;
@end

@implementation _MFSecCMSDecoder

- (char)initWithPartData:(void *)a3 error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    if (a3) {
      *a3 = 0;
    }
    v19.receiver = a1;
    v19.super_class = (Class)_MFSecCMSDecoder;
    a1 = (char *)objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      int v6 = SecCmsDecoderCreate();
      *((_DWORD *)a1 + 2) = v6;
      v7 = (int *)(a1 + 8);
      if (v6)
      {
        v8 = MFLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[_MFSecCMSDecoder initWithPartData:error:]();
        }
      }
      else
      {
        id v9 = v5;
        [v9 bytes];
        [v9 length];
        int v10 = SecCmsDecoderUpdate();
        int *v7 = v10;
        if (v10)
        {
          v11 = MFLogGeneral();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[_MFSecCMSDecoder initWithPartData:error:](*v7, buf, [v9 length], v11);
          }
        }
        else
        {
          int v14 = SecCmsDecoderFinish();
          int *v7 = v14;
          if (*((void *)a1 + 2))
          {
            a1[56] = SecCmsMessageIsEncrypted() != 0;
            int v14 = *((_DWORD *)a1 + 2);
          }
          if (v14)
          {
            v15 = MFLogGeneral();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[_MFSecCMSDecoder initWithPartData:error:]();
            }
          }
          *((void *)a1 + 6) = _ExtractContentWithTag(*((void *)a1 + 2), 27);
          uint64_t ContentWithTag = _ExtractContentWithTag(*((void *)a1 + 2), 26);
          *((void *)a1 + 5) = ContentWithTag;
          if (ContentWithTag)
          {
            if (!SecCmsSignedDataHasDigests())
            {
              SecCmsSignedDataGetDigestAlgs();
              uint64_t started = SecCmsDigestContextStartMultiple();
              *((void *)a1 + 3) = started;
              if (!started)
              {

                v18 = MFLogGeneral();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsDigestContextStartMultiple failed", buf, 2u);
                }

                if (a3)
                {
                  +[MFError errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:0];
                  a1 = 0;
                  *a3 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  a1 = 0;
                }
              }
            }
          }
        }
      }
      if (a1 && a3 && *((_DWORD *)a1 + 2))
      {
        v12 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
        *a3 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v12];
      }
    }
  }

  return a1;
}

- (id)verifyAgainstSenders:(id *)a3 signingError:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  if (a1)
  {
    if (a3) {
      *a3 = 0;
    }
    id v5 = (int *)(a1 + 8);
    if (*(_DWORD *)(a1 + 8))
    {
      int v6 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
      id v42 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v6];

      v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[_MFSecCMSDecoder verifyAgainstSenders:signingError:]();
      }
      goto LABEL_66;
    }
    if ([v41 count])
    {
      v7 = [v41 objectAtIndex:0];
    }
    else
    {
      v7 = 0;
    }
    if (SecCmsSignedDataHasDigests())
    {
      if (v7)
      {
        int v8 = SecCmsSignedDataSignerInfoCount();
        v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
        if (v8)
        {
          v40 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:v7];
          if (v8 >= 1)
          {
            int v39 = v8;
            int v10 = 0;
            id v42 = 0;
            *(void *)&long long v9 = 67109120;
            long long v37 = v9;
            while (1)
            {
              uint64_t SignerInfo = SecCmsSignedDataGetSignerInfo();
              int v12 = SecCmsSignedDataVerifySignerInfo();
              *id v5 = v12;
              if (!v12) {
                break;
              }
              v13 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
              uint64_t v14 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v13];

              if (SignerInfo) {
                SignerEmailAddress = (MFMessageSigner *)SecCmsSignerInfoGetSignerEmailAddress();
              }
              else {
                SignerEmailAddress = 0;
              }
              v23 = MFLogGeneral();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                uint64_t v30 = *v5;
                v31 = @"(Unknown)";
                if (!SignerEmailAddress) {
                  v31 = 0;
                }
                *(_DWORD *)trust = 134218498;
                *(void *)&trust[4] = v30;
                __int16 v46 = 1024;
                int v47 = v10;
                __int16 v48 = 2112;
                v49 = v31;
                _os_log_error_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecCmsSignedDataVerifySignerInfo returned %ld for #%d:%@", trust, 0x1Cu);
              }

              id v42 = (id)v14;
LABEL_43:

              if (v39 == ++v10) {
                goto LABEL_62;
              }
            }
            if (!SignerInfo)
            {
              v24 = v7;
              v22 = 0;
              uint64_t VerificationStatus = 2;
              goto LABEL_35;
            }
            uint64_t VerificationStatus = SecCmsSignerInfoGetVerificationStatus();
            v17 = v7;
            ValueAtIndex = (const void *)SecCmsSignerInfoCopyCertFromEncryptionKeyPreference();
            if (!ValueAtIndex)
            {
              CFArrayRef v25 = SecTrustCopyCertificateChain(0);
              CFArrayRef v26 = v25;
              if (v25)
              {
                if (CFArrayGetCount(v25) < 1)
                {
                  int v27 = 0;
                  ValueAtIndex = 0;
                }
                else
                {
                  ValueAtIndex = CFArrayGetValueAtIndex(v26, 0);
                  if (ValueAtIndex && (SecCertificateGetKeyUsage() & 0x14) != 0)
                  {
                    ValueAtIndex = CFRetain(ValueAtIndex);
                    int v27 = 1;
                  }
                  else
                  {
                    int v27 = 0;
                  }
                }
                CFRelease(v26);
                if (!v27)
                {
LABEL_24:
                  v22 = 0;
LABEL_35:

                  SignerEmailAddress = [[MFMessageSigner alloc] initWithSender:v7 signingTrust:0 encryptionTrust:v22 verification:VerificationStatus];
                  if (v22) {
                    CFRelease(v22);
                  }
                  if (a3)
                  {
                    id v28 = [(MFMessageSigner *)SignerEmailAddress error];
                    *a3 = v28;
                    if (v28)
                    {
                      v29 = MFLogGeneral();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(*a3, "ef_publicDescription");
                        objc_claimAutoreleasedReturnValue();
                        -[_MFSecCMSDecoder verifyAgainstSenders:signingError:]();
                      }
                    }
                  }
                  objc_msgSend(v38, "addObject:", SignerEmailAddress, v37);
                  goto LABEL_43;
                }
              }
              else
              {
                ValueAtIndex = 0;
              }
            }
            objc_super v19 = +[MFMessageKeychainManager copySMIMEEncryptionPolicyForAddress:](MFMessageKeychainManager, "copySMIMEEncryptionPolicyForAddress:", v17, v37);
            *(void *)trust = 0;
            OSStatus v20 = SecTrustCreateWithCertificates(ValueAtIndex, v19, (SecTrustRef *)trust);
            CFRelease(v19);
            CFRelease(ValueAtIndex);
            if (v20)
            {
              uint64_t v21 = MFLogGeneral();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v37;
                OSStatus v51 = v20;
                _os_log_error_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned %d", buf, 8u);
              }
            }
            else
            {
              v22 = *(const void **)trust;
              if (*(void *)trust) {
                goto LABEL_35;
              }
              uint64_t v21 = MFLogGeneral();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                -[_MFSecCMSDecoder verifyAgainstSenders:signingError:](&v43, v44, v21);
              }
            }

            goto LABEL_24;
          }
          id v42 = 0;
LABEL_62:
          if (v40) {
            CFRelease(v40);
          }
        }
        else
        {
          id v42 = 0;
        }
        v33 = *(NSObject **)(a1 + 32);
        *(void *)(a1 + 32) = v38;
LABEL_65:

LABEL_66:
        goto LABEL_67;
      }
      v35 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
      id v42 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v35];

      v33 = MFLogGeneral();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
        goto LABEL_65;
      }
      *(_WORD *)trust = 0;
      v34 = "#SMIMEErrors The message sender is missing";
    }
    else
    {
      v32 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
      id v42 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v32];

      v33 = MFLogGeneral();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
        goto LABEL_65;
      }
      *(_WORD *)trust = 0;
      v34 = "#SMIMEErrors There were no digests in the message";
    }
    _os_log_impl(&dword_1A7EFF000, v33, OS_LOG_TYPE_INFO, v34, trust, 2u);
    goto LABEL_65;
  }
  id v42 = 0;
LABEL_67:

  return v42;
}

- (void)signedData
{
  if (InnerContent)
  {
    InnerContent = (void *)InnerContent[5];
    if (InnerContent)
    {
      SecCmsSignedDataGetContentInfo();
      InnerContent = (void *)SecCmsContentInfoGetInnerContent();
      if (InnerContent) {
        InnerContent = (void *)[objc_alloc(MEMORY[0x1E4F73540]) initWithBytesNoCopy:InnerContent[1] length:*InnerContent freeWhenDone:0];
      }
    }
    uint64_t v1 = vars8;
  }
  return InnerContent;
}

- (void)dealloc
{
  digest = self->_digest;
  if (digest) {
    MEMORY[0x1AD0E2D00](digest, a2);
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
  id v4 = a3;
  id v5 = v4;
  if (self->_SecCMSError)
  {
    int v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSDecoder appendData:]();
    }
LABEL_4:

    int64_t v7 = -1;
    goto LABEL_5;
  }
  if (!self->_signedData)
  {
    if (self->_envelopedData)
    {
      int64_t v7 = [v4 length];
      goto LABEL_5;
    }
    int v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors -appendData: called on _MFSecCMSDecoder with no signed or enveloped data!", v9, 2u);
    }
    goto LABEL_4;
  }
  int64_t v7 = [v4 length];
  if (self->_digest)
  {
    [v5 bytes];
    SecCmsDigestContextUpdate();
  }
LABEL_5:

  return v7;
}

- (void)done
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsSignedDataSetDigestContext on -done returned %ld", v2, v3, v4, v5, v6);
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

- (void).cxx_destruct
{
}

- (void)initWithPartData:error:.cold.1()
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsDecoderFinish returned %ld", v2, v3, v4, v5, v6);
}

- (void)initWithPartData:(uint64_t)a3 error:(os_log_t)log .cold.2(int a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecCmsDecoderUpdate returned %ld for %lu bytes", buf, 0x16u);
}

- (void)initWithPartData:error:.cold.3()
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsDecoderCreate returned %ld", v2, v3, v4, v5, v6);
}

- (void)verifyAgainstSenders:signingError:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  *uint64_t v1 = 138543362;
  *uint64_t v3 = v2;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v5, (uint64_t)v3, "#SMIMEErrors There was a signing error %{public}@", v4);
}

- (void)verifyAgainstSenders:(os_log_t)log signingError:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned a null SecTrustRef", buf, 2u);
}

- (void)verifyAgainstSenders:signingError:.cold.3()
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors _MFSecCMSDecoder asked to verify with pending error (%ld)", v2, v3, v4, v5, v6);
}

- (void)appendData:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "#SMIMEErrors -appendData: called on _MFSecCMSDecoder after an error has occurred!", v2, v3, v4, v5, v6);
}

@end