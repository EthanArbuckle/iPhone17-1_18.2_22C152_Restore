@interface _MFSecCMSEncoder
- (id)data;
- (id)initForEncryptionWithCompositionSpecification:(id)a3 error:(id *)a4;
- (id)initForSigningWithSender:(id)a3 compositionSpecification:(id)a4 error:(id *)a5;
- (int)lastSecCMSError;
- (int64_t)appendData:(id)a3;
- (void)_appendBytes:(const void *)a3 length:(unint64_t)a4;
- (void)dealloc;
- (void)done;
@end

@implementation _MFSecCMSEncoder

- (id)initForSigningWithSender:(id)a3 compositionSpecification:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)_MFSecCMSEncoder;
  v8 = [(MFBufferedDataConsumer *)&v35 init];
  if (!v8) {
    return v8;
  }
  uint64_t v9 = [a4 objectForKey:@"SigningIdentity"];
  if (!v9)
  {
    v16 = MFLogGeneral();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = a3;
    v17 = "#SMIMEErrors Found no identity for \"%@\"";
    v18 = v16;
    uint32_t v19 = 12;
LABEL_12:
    _os_log_impl(&dword_1CFCFE000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
    goto LABEL_20;
  }
  v10 = (__SecIdentity *)v9;
  uint64_t v11 = SecCmsMessageCreate();
  if (!v11)
  {
    v20 = MFLogGeneral();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v17 = "#SMIMEErrors SecCmsMessageCreate for signing failed";
    v18 = v20;
    uint32_t v19 = 2;
    goto LABEL_12;
  }
  v12 = (SecCmsMessageStr *)v11;
  if (!SecCmsSignedDataCreate())
  {
    v21 = MFLogGeneral();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
LABEL_19:
      SecCmsMessageDestroy();
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v22 = "#SMIMEErrors SecCmsSignedDataCreate failed";
LABEL_15:
    _os_log_impl(&dword_1CFCFE000, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
    goto LABEL_19;
  }
  SecCmsMessageGetContentInfo();
  int v13 = SecCmsContentInfoSetContentSignedData();
  p_SecCMSError = &v8->_SecCMSError;
  v8->_SecCMSError = v13;
  if (v13)
  {
    v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.4();
    }
    goto LABEL_19;
  }
  SecCmsSignedDataGetContentInfo();
  int v23 = SecCmsContentInfoSetContentData();
  int *p_SecCMSError = v23;
  if (v23)
  {
    v24 = MFLogGeneral();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:]();
    }
    goto LABEL_19;
  }
  uint64_t v26 = SecCmsSignerInfoCreate();
  if (!v26)
  {
    v21 = MFLogGeneral();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v22 = "#SMIMEErrors SecCmsSignerInfoCreate failed";
    goto LABEL_15;
  }
  uint64_t v27 = v26;
  int v28 = SecCmsSignerInfoIncludeCerts();
  int *p_SecCMSError = v28;
  if (v28)
  {
    v29 = MFLogGeneral();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:]();
    }
    goto LABEL_19;
  }
  *(void *)buf = 0;
  v30 = (__SecIdentity *)[a4 objectForKey:@"EncryptionIdentity"];
  if (v30) {
    SecIdentityCopyCertificate(v30, (SecCertificateRef *)buf);
  }
  SecCertificateRef certificateRef = 0;
  SecIdentityCopyCertificate(v10, &certificateRef);
  if (*(void *)buf) {
    SecCertificateRef v31 = *(SecCertificateRef *)buf;
  }
  else {
    SecCertificateRef v31 = certificateRef;
  }
  MEMORY[0x1D25DD3E0](v27, v31, 0);
  if (*(void *)buf) {
    SecCertificateRef v32 = *(SecCertificateRef *)buf;
  }
  else {
    SecCertificateRef v32 = certificateRef;
  }
  MEMORY[0x1D25DD3D0](v27, v32, 0);
  if (*(void *)buf && !CFEqual(*(CFTypeRef *)buf, certificateRef)) {
    int *p_SecCMSError = SecCmsSignedDataAddCertChain();
  }
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }
  if (*p_SecCMSError)
  {
    v33 = MFLogGeneral();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:]();
    }
    goto LABEL_19;
  }
  CFAbsoluteTimeGetCurrent();
  SecCmsSignerInfoAddSigningTime();
  v8->_message = v12;
LABEL_20:
  if (!v8->_encoder && !v8->_message || v8->_SecCMSError)
  {
    if (a5) {
      *a5 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1036, [NSString stringWithFormat:MFLookupLocalizedString(@"SMIME_CANT_SIGN_MESSAGE", @"An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain.", @"Delayed", a3]);
    }

    return 0;
  }
  return v8;
}

- (id)initForEncryptionWithCompositionSpecification:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)_MFSecCMSEncoder;
  v6 = [(MFBufferedDataConsumer *)&v39 init];
  if (!v6) {
    return v6;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = (void *)[a3 objectForKey:@"RecipientCertificates"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v35 + 1) + 8 * i)));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }
  int v13 = (__SecIdentity *)[a3 objectForKey:@"EncryptionIdentity"];
  if (v13 || (int v13 = (__SecIdentity *)[a3 objectForKey:@"SigningIdentity"]) != 0)
  {
    SecCertificateRef certificateRef = 0;
    SecIdentityCopyCertificate(v13, &certificateRef);
    if (certificateRef)
    {
      objc_msgSend(v7, "addObject:");
      CFRelease(certificateRef);
    }
  }
  CFIndex v14 = [v7 count];
  MEMORY[0x1F4188790]();
  v17 = (const void **)&buf[-v16];
  if (v15 >= 0x200) {
    size_t v18 = 512;
  }
  else {
    size_t v18 = v15;
  }
  bzero(&buf[-v16], v18);
  v17[v14] = 0;
  v42.location = 0;
  v42.length = v14;
  CFArrayGetValues((CFArrayRef)v7, v42, v17);
  LODWORD(certificateRef) = 128;
  int v33 = 184;
  int v19 = SecSMIMEFindBulkAlgForRecipients();
  p_SecCMSError = &v6->_SecCMSError;
  v6->_SecCMSError = v19;
  if (v19)
  {
    v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:]();
    }
    goto LABEL_33;
  }
  uint64_t v22 = SecCmsMessageCreate();
  if (!v22)
  {
    uint64_t v26 = MFLogGeneral();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFCFE000, v26, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsMessageCreate for encryption failed", buf, 2u);
    }
    goto LABEL_33;
  }
  int v23 = (SecCmsMessageStr *)v22;
  if (!SecCmsEnvelopedDataCreate())
  {
    uint64_t v27 = MFLogGeneral();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
LABEL_32:
      SecCmsMessageDestroy();
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    int v28 = "#SMIMEErrors SecCmsEnvelopedDataCreate failed";
LABEL_28:
    _os_log_impl(&dword_1CFCFE000, v27, OS_LOG_TYPE_INFO, v28, buf, 2u);
    goto LABEL_32;
  }
  SecCmsMessageGetContentInfo();
  int v24 = SecCmsContentInfoSetContentEnvelopedData();
  int *p_SecCMSError = v24;
  if (v24)
  {
    v25 = MFLogGeneral();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:]();
    }
    goto LABEL_32;
  }
  SecCmsEnvelopedDataGetContentInfo();
  int v29 = SecCmsContentInfoSetContentData();
  int *p_SecCMSError = v29;
  if (v29)
  {
    v30 = MFLogGeneral();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:]();
    }
    goto LABEL_32;
  }
  if (v14)
  {
    do
    {
      if (!SecCmsRecipientInfoCreate()) {
        break;
      }
      if (!--v14) {
        goto LABEL_46;
      }
      ++v17;
    }
    while (!*p_SecCMSError);
    uint64_t v27 = MFLogGeneral();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    int v28 = "#SMIMEErrors Failed to create all the required recipients";
    goto LABEL_28;
  }
LABEL_46:
  v6->_message = v23;
LABEL_33:

  if (!v6->_encoder && !v6->_message || *p_SecCMSError)
  {
    if (a4) {
      *a4 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:MFLookupLocalizedString(@"SMIME_CANT_ENCRYPT_MESSAGE", @"An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients.", @"Delayed")];
    }

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  if (self->_encoder) {
    SecCmsEncoderDestroy();
  }
  if (self->_message) {
    SecCmsMessageDestroy();
  }

  v3.receiver = self;
  v3.super_class = (Class)_MFSecCMSEncoder;
  [(MFBufferedDataConsumer *)&v3 dealloc];
}

- (int64_t)appendData:(id)a3
{
  p_SecCMSError = &self->_SecCMSError;
  if (self->_SecCMSError)
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder appendData:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
    return -1;
  }
  if (!self->_message)
  {
    size_t v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl(&dword_1CFCFE000, v18, OS_LOG_TYPE_INFO, "#SMIMEErrors -appendData: called twice _MFSecCMSEncoder (only once is allowed for now)!", (uint8_t *)v19, 2u);
    }
    return -1;
  }
  int64_t v12 = [a3 length];
  v19[1] = objc_msgSend(a3, "bytes", v12);
  self->_singleShot = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F73540]);
  int v15 = SecCmsMessageEncode();
  int *p_SecCMSError = v15;
  if (v15)
  {
    uint64_t v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder appendData:]();
    }
    int64_t v12 = -1;
  }
  SecCmsMessageDestroy();
  self->_message = 0;
  return v12;
}

- (void)done
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsEncoderFinish on -done returned %ld", v2, v3, v4, v5, v6);
}

- (void)_appendBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F734C0]) initWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  v6.receiver = self;
  v6.super_class = (Class)_MFSecCMSEncoder;
  [(MFBufferedDataConsumer *)&v6 appendData:v5];
}

- (id)data
{
  id result = self->_singleShot;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)_MFSecCMSEncoder;
    return [(MFBufferedDataConsumer *)&v4 data];
  }
  return result;
}

- (int)lastSecCMSError
{
  return self->_SecCMSError;
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsSignedDataAddCertChain returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.2()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsSignerInfoIncludeCerts returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.3()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentData for signing returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.4()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentSignedData returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentData for encryption returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.2()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentEnvelopedData returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.3()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecSMIMEFindBulkAlgForRecipients returned %ld", v2, v3, v4, v5, v6);
}

- (void)appendData:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1CFCFE000, v0, v1, "#SMIMEErrors SecCmsMessageEncode returned %ld", v2, v3, v4, v5, v6);
}

- (void)appendData:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end