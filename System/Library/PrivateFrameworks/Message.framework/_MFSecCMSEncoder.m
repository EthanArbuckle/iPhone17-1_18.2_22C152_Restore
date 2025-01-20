@interface _MFSecCMSEncoder
- (id)data;
- (id)initForEncryptionWithCompositionSpecification:(void *)a3 error:;
- (id)initForSigningWithSender:(void *)a3 compositionSpecification:(void *)a4 error:;
- (int64_t)appendData:(id)a3;
- (void)dealloc;
- (void)done;
@end

@implementation _MFSecCMSEncoder

- (id)initForSigningWithSender:(void *)a3 compositionSpecification:(void *)a4 error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1) {
    goto LABEL_30;
  }
  v23.receiver = a1;
  v23.super_class = (Class)_MFSecCMSEncoder;
  a1 = objc_msgSendSuper2(&v23, sel_init);
  if (!a1) {
    goto LABEL_30;
  }
  v9 = (__SecIdentity *)[v8 objectForKey:@"SigningIdentity"];
  if (!v9)
  {
    v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_INFO, "#SMIMEErrors Found no identity for \"%@\"", buf, 0xCu);
    }
    goto LABEL_12;
  }
  uint64_t v10 = SecCmsMessageCreate();
  if (!v10)
  {
    v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsMessageCreate for signing failed", buf, 2u);
    }
LABEL_12:

    goto LABEL_24;
  }
  if (!SecCmsSignedDataCreate())
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsSignedDataCreate failed", buf, 2u);
    }
    goto LABEL_22;
  }
  SecCmsMessageGetContentInfo();
  *((_DWORD *)a1 + 10) = SecCmsContentInfoSetContentSignedData();
  if (*((_DWORD *)a1 + 10))
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.4();
    }
LABEL_22:

LABEL_23:
    SecCmsMessageDestroy();
    goto LABEL_24;
  }
  SecCmsSignedDataGetContentInfo();
  *((_DWORD *)a1 + 10) = SecCmsContentInfoSetContentData();
  if (*((_DWORD *)a1 + 10))
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:]();
    }
    goto LABEL_22;
  }
  uint64_t v17 = SecCmsSignerInfoCreate();
  if (!v17)
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsSignerInfoCreate failed", buf, 2u);
    }
    goto LABEL_22;
  }
  *((_DWORD *)a1 + 10) = SecCmsSignerInfoIncludeCerts();
  if (*((_DWORD *)a1 + 10))
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:]();
    }
    goto LABEL_22;
  }
  *(void *)buf = 0;
  v18 = (__SecIdentity *)[v8 objectForKey:@"EncryptionIdentity"];
  if (v18) {
    SecIdentityCopyCertificate(v18, (SecCertificateRef *)buf);
  }
  SecCertificateRef certificateRef = 0;
  SecIdentityCopyCertificate(v9, &certificateRef);
  if (*(void *)buf) {
    SecCertificateRef v19 = *(SecCertificateRef *)buf;
  }
  else {
    SecCertificateRef v19 = certificateRef;
  }
  MEMORY[0x1AD0E2EA0](v17, v19, 0);
  if (*(void *)buf) {
    SecCertificateRef v20 = *(SecCertificateRef *)buf;
  }
  else {
    SecCertificateRef v20 = certificateRef;
  }
  MEMORY[0x1AD0E2E90](v17, v20, 0);
  if (*(void *)buf && !CFEqual(*(CFTypeRef *)buf, certificateRef)) {
    *((_DWORD *)a1 + 10) = SecCmsSignedDataAddCertChain();
  }
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }
  if (*((_DWORD *)a1 + 10))
  {
    v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:]();
    }

    goto LABEL_23;
  }
  CFAbsoluteTimeGetCurrent();
  SecCmsSignerInfoAddSigningTime();
  *((void *)a1 + 7) = v10;
LABEL_24:
  if (!*((void *)a1 + 6) && !*((void *)a1 + 7) || *((_DWORD *)a1 + 10))
  {
    if (a4)
    {
      v13 = NSString;
      v14 = MFLookupLocalizedString(@"SMIME_CANT_SIGN_MESSAGE", @"An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain.", @"Delayed");
      v15 = objc_msgSend(v13, "stringWithFormat:", v14, v7);
      *a4 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v15];
    }
    a1 = 0;
  }
LABEL_30:

  return a1;
}

- (id)initForEncryptionWithCompositionSpecification:(void *)a3 error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_45;
  }
  v31.receiver = a1;
  v31.super_class = (Class)_MFSecCMSEncoder;
  a1 = objc_msgSendSuper2(&v31, sel_init);
  if (!a1) {
    goto LABEL_45;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v25 = a3;
  [v5 objectForKey:@"RecipientCertificates"];
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [v7 objectForKey:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        [v6 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  v12 = (__SecIdentity *)[v5 objectForKey:@"EncryptionIdentity"];
  if (v12 || (v12 = (__SecIdentity *)[v5 objectForKey:@"SigningIdentity"]) != 0)
  {
    certificateRef[0] = 0;
    SecIdentityCopyCertificate(v12, certificateRef);
    if (certificateRef[0])
    {
      objc_msgSend(v6, "addObject:");
      CFRelease(certificateRef[0]);
    }
  }
  CFIndex v13 = [v6 count];
  MEMORY[0x1F4188790](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v16 & 1) == 0) {
    memset(v15, 170, 8 * v13 + 8);
  }
  *(void *)&v15[8 * v13] = 0;
  v34.location = 0;
  v34.length = v13;
  CFArrayGetValues((CFArrayRef)v6, v34, (const void **)v15);
  uint64_t v17 = SecCmsMessageCreate();
  if (!v17)
  {
    SecCertificateRef v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(certificateRef[0]) = 0;
      _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsMessageCreate for encryption failed", (uint8_t *)certificateRef, 2u);
    }

    goto LABEL_38;
  }
  if (!SecCmsEnvelopedDataCreate())
  {
    v18 = MFLogGeneral();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
LABEL_37:

      SecCmsMessageDestroy();
      goto LABEL_38;
    }
    LOWORD(certificateRef[0]) = 0;
    SecCertificateRef v20 = "#SMIMEErrors SecCmsEnvelopedDataCreate failed";
LABEL_26:
    _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)certificateRef, 2u);
    goto LABEL_37;
  }
  SecCmsMessageGetContentInfo();
  *((_DWORD *)a1 + 10) = SecCmsContentInfoSetContentEnvelopedData();
  if (*((_DWORD *)a1 + 10))
  {
    v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:]();
    }
    goto LABEL_37;
  }
  SecCmsEnvelopedDataGetContentInfo();
  *((_DWORD *)a1 + 10) = SecCmsContentInfoSetContentData();
  if (*((_DWORD *)a1 + 10))
  {
    v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:]();
    }
    goto LABEL_37;
  }
  if (v13)
  {
    while (!*((_DWORD *)a1 + 10) && SecCmsRecipientInfoCreate())
    {
      v15 += 8;
      if (!--v13) {
        goto LABEL_34;
      }
    }
    v18 = MFLogGeneral();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      goto LABEL_37;
    }
    LOWORD(certificateRef[0]) = 0;
    SecCertificateRef v20 = "#SMIMEErrors Failed to create all the required recipients";
    goto LABEL_26;
  }
LABEL_34:
  *((void *)a1 + 7) = v17;
LABEL_38:
  if (!*((void *)a1 + 6) && !*((void *)a1 + 7) || *((_DWORD *)a1 + 10))
  {
    if (v25)
    {
      v21 = MFLookupLocalizedString(@"SMIME_CANT_ENCRYPT_MESSAGE", @"An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients.", @"Delayed");
      id v22 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v21];
      *uint64_t v25 = v22;
    }
    a1 = 0;
  }

LABEL_45:
  return a1;
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
  id v4 = a3;
  id v5 = v4;
  if (self->_SecCMSError)
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder appendData:]();
    }
LABEL_4:

    int64_t v7 = -1;
    goto LABEL_11;
  }
  if (!self->_message)
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors -appendData: called twice _MFSecCMSEncoder (only once is allowed for now)!", (uint8_t *)v13, 2u);
    }
    goto LABEL_4;
  }
  int64_t v7 = [v4 length];
  v13[1] = objc_msgSend(v5, "bytes", v7);
  uint64_t v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F73540]);
  singleShot = self->_singleShot;
  self->_singleShot = v8;

  int v10 = SecCmsMessageEncode();
  self->_SecCMSError = v10;
  if (v10)
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_MFSecCMSEncoder appendData:]();
    }

    int64_t v7 = -1;
  }
  SecCmsMessageDestroy();
  self->_message = 0;
LABEL_11:

  return v7;
}

- (void)done
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsEncoderFinish on -done returned %ld", v2, v3, v4, v5, v6);
}

- (id)data
{
  uint64_t v3 = self->_singleShot;
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_MFSecCMSEncoder;
    uint64_t v3 = [(MFBufferedDataConsumer *)&v5 data];
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsSignedDataAddCertChain returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsSignerInfoIncludeCerts returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentData for signing returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentSignedData returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentData for encryption returned %ld", v2, v3, v4, v5, v6);
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentEnvelopedData returned %ld", v2, v3, v4, v5, v6);
}

- (void)appendData:.cold.1()
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#SMIMEErrors SecCmsMessageEncode returned %ld", v2, v3, v4, v5, v6);
}

- (void)appendData:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "#SMIMEErrors -appendData: called on _MFSecCMSEncoder after an error has occurred!", v2, v3, v4, v5, v6);
}

@end