@interface MFMimePart(SMIMEEncoding)
- (id)_encryptedDataForContentData:()SMIMEEncoding compositionSpecification:contentType:error:;
- (id)_encryptedDataUsingMessageSecurity:()SMIMEEncoding compositionSpecification:contentType:error:;
- (id)_encryptedDataUsingSecCMS:()SMIMEEncoding compositionSpecification:error:;
- (id)_signatureDataForContentData:()SMIMEEncoding forSender:compositionSpecification:outError:;
- (id)_signatureDataUsingMessageSecurity:()SMIMEEncoding forSender:compositionSpecification:outError:;
- (id)_signatureDataUsingSecCMSWithData:()SMIMEEncoding forSender:compositionSpecification:outError:;
- (id)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:;
- (id)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:;
@end

@implementation MFMimePart(SMIMEEncoding)

- (id)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v25 = 0;
  v13 = [a1 _signatureDataForContentData:v10 forSender:v11 compositionSpecification:v12 outError:&v25];
  id v14 = v25;
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "mf_shortDescription");
    BOOL v17 = v16 == 0;

    if (v17)
    {
      v18 = MFLookupLocalizedString(@"SMIME_CANT_SIGN_TITLE", @"Unable to Sign", @"Delayed");
      [v15 setShortDescription:v18];
    }
    -[MFMimePart _setSMIMEError:](a1, v15);
    v19 = +[MFActivityMonitor currentMonitor];
    [v19 setError:v15];

    v20 = [MEMORY[0x1E4F73530] log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEEncoding) newSignedPartWithData:sender:compositionSpecification:signatureData:]();
    }

    id v21 = 0;
  }
  else
  {
    id v21 = objc_alloc_init((Class)objc_opt_class());
    if ([MEMORY[0x1E4F602E0] preferenceEnabled:28]
      && [MEMORY[0x1E4F602E0] preferenceEnabled:30])
    {
      [v21 setType:@"application"];
      [v21 setSubtype:@"pkcs7-mime"];
      [v21 setDisposition:@"attachment"];
      [v21 setDispositionParameter:@"smime.p7m" forKey:@"filename"];
      [v21 setBodyParameter:@"signed-data" forKey:@"smime-type"];
      [v21 setBodyParameter:@"smime.p7m" forKey:@"name"];
      v22 = [MEMORY[0x1E4F73530] log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "[S/MIME] Signing as application/pkcs7-mime.", buf, 2u);
      }
    }
    else
    {
      [v21 setType:@"multipart"];
      [v21 setSubtype:@"signed"];
      [v21 setBodyParameter:@"application/pkcs7-signature" forKey:@"protocol"];
      [v21 setBodyParameter:@"sha-256" forKey:@"micalg"];
      [v21 addSubpart:a1];
      v22 = objc_alloc_init((Class)objc_opt_class());
      [v22 setType:@"application"];
      [v22 setSubtype:@"pkcs7-signature"];
      [v22 setDisposition:@"attachment"];
      [v22 setDispositionParameter:@"smime.p7s" forKey:@"filename"];
      [v22 setBodyParameter:@"smime.p7s" forKey:@"name"];
      [v21 addSubpart:v22];
      v23 = [MEMORY[0x1E4F73530] log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_DEFAULT, "[S/MIME] Signing as multipart/signed.", buf, 2u);
      }
    }
    if (a6) {
      *a6 = v13;
    }
  }

  return v21;
}

- (id)_signatureDataForContentData:()SMIMEEncoding forSender:compositionSpecification:outError:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([MEMORY[0x1E4F602E0] preferenceEnabled:28]) {
    [a1 _signatureDataUsingMessageSecurity:v10 forSender:v11 compositionSpecification:v12 outError:a6];
  }
  else {
  v13 = [a1 _signatureDataUsingSecCMSWithData:v10 forSender:v11 compositionSpecification:v12 outError:a6];
  }

  return v13;
}

- (id)_signatureDataUsingMessageSecurity:()SMIMEEncoding forSender:compositionSpecification:outError:
{
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(a3, "mf_dataByConvertingUnixNewlinesToNetwork");
  id v12 = (__SecIdentity *)[v10 objectForKey:@"SigningIdentity"];
  if (v12)
  {
    v13 = (__SecIdentity *)[v10 objectForKey:@"EncryptionIdentity"];
    SecCertificateRef certificateRef = 0;
    if (v13)
    {
      SecIdentityCopyCertificate(v13, &certificateRef);
    }
    else
    {
      SecIdentityCopyCertificate(v12, &certificateRef);
      if ((SecCertificateGetKeyUsage() & 0x14) == 0)
      {
        v18 = [MEMORY[0x1E4F73530] log];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[MFMimePart(SMIMEEncoding) _signatureDataUsingMessageSecurity:forSender:compositionSpecification:outError:]();
        }

        CFRelease(certificateRef);
        SecCertificateRef certificateRef = 0;
      }
    }
    __int16 v21 = 0;
    [MEMORY[0x1E4F60458] encryptionLevelForSender:v9 forAdvertisement:1 useGCM:(char *)&v21 + 1 encryptSubject:&v21];
    v19 = [MEMORY[0x1E4F607E0] oidsForEncryptWithGCM:HIBYTE(v21) encryptSubject:v21];
    if ([MEMORY[0x1E4F602E0] preferenceEnabled:30]) {
      [MEMORY[0x1E4F607E0] signedDataFromNetworkContentData:v11 forSender:v9 identity:v12 encryptionCertificate:certificateRef capabilities:v19 outError:a6];
    }
    else {
    BOOL v17 = [MEMORY[0x1E4F607E0] signatureDataFromNetworkContentData:v11 forSender:v9 identity:v12 encryptionCertificate:certificateRef capabilities:v19 outError:a6];
    }
    if (certificateRef) {
      CFRelease(certificateRef);
    }
  }
  else
  {
    id v14 = NSString;
    v15 = MFLookupLocalizedString(@"SMIME_CANT_SIGN_MESSAGE", @"An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain.", @"Delayed");
    v16 = objc_msgSend(v14, "stringWithFormat:", v15, v9);
    *a6 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v16];

    BOOL v17 = 0;
  }

  return v17;
}

- (id)_signatureDataUsingSecCMSWithData:()SMIMEEncoding forSender:compositionSpecification:outError:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (int *)-[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:]([_MFSecCMSEncoder alloc], v10, v11, a6);
  if (!*a6)
  {
    v13 = objc_msgSend(v9, "mf_dataByConvertingUnixNewlinesToNetwork");
    uint64_t v14 = MFDataConsumerConsumeCompleteData();

    if (v14 < 0)
    {
      if (v12 && (uint64_t v15 = v12[10], v15))
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        BOOL v17 = (void *)[v16 initWithDomain:*MEMORY[0x1E4F28760] code:v15 userInfo:0];
        id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v19 = objc_msgSend(v18, "initWithObjectsAndKeys:", v17, *MEMORY[0x1E4F28A50], 0);
      }
      else
      {
        v19 = 0;
      }
      id v20 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 userInfo:v19];
      *a6 = v20;
      __int16 v21 = NSString;
      v22 = MFLookupLocalizedString(@"SMIME_CANT_SIGN_MESSAGE", @"An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain.", @"Delayed");
      v23 = objc_msgSend(v21, "stringWithFormat:", v22, v10);
      [v20 setLocalizedDescription:v23];
    }
  }
  [v12 done];
  v24 = [v12 data];

  return v24;
}

- (id)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v16 = 0;
  id v17 = 0;
  id v10 = [a1 _encryptedDataForContentData:v8 compositionSpecification:v9 contentType:&v17 error:&v16];
  id v11 = v17;
  id v12 = v16;
  if (v12)
  {
    v13 = [MEMORY[0x1E4F73530] log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEEncoding) newEncryptedPartWithData:compositionSpecification:encryptedData:]();
    }
    id v14 = 0;
  }
  else
  {
    id v14 = objc_alloc_init((Class)objc_opt_class());
    [v14 setType:@"application"];
    [v14 setSubtype:@"pkcs7-mime"];
    [v14 setDisposition:@"attachment"];
    [v14 setDispositionParameter:@"smime.p7m" forKey:@"filename"];
    [v14 setBodyParameter:v11 forKey:@"smime-type"];
    [v14 setBodyParameter:@"smime.p7m" forKey:@"name"];
    if (a5) {
      *a5 = v10;
    }
    v13 = [MEMORY[0x1E4F73530] log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v11;
      _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "[S/MIME] Encrypted as multipart/pkcs7-mime (smime-type=%{public}@).", buf, 0xCu);
    }
  }

  return v14;
}

- (id)_encryptedDataForContentData:()SMIMEEncoding compositionSpecification:contentType:error:
{
  id v10 = a3;
  id v11 = a4;
  if ([MEMORY[0x1E4F602E0] preferenceEnabled:28])
  {
    id v12 = [a1 _encryptedDataUsingMessageSecurity:v10 compositionSpecification:v11 contentType:a5 error:a6];
  }
  else
  {
    id v12 = [a1 _encryptedDataUsingSecCMS:v10 compositionSpecification:v11 error:a6];
    if (a5) {
      *a5 = @"enveloped-data";
    }
  }

  return v12;
}

- (id)_encryptedDataUsingSecCMS:()SMIMEEncoding compositionSpecification:error:
{
  v30[4] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[MFMimePart(SMIMEEncoding) _encryptedDataUsingSecCMS:compositionSpecification:error:]();
  }

  v30[0] = 0;
  id v11 = (int *)-[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:]([_MFSecCMSEncoder alloc], v9, v30);
  id v12 = v30[0];
  if (v12) {
    goto LABEL_4;
  }
  __int16 v21 = objc_msgSend(v8, "mf_dataByConvertingUnixNewlinesToNetwork");
  uint64_t v22 = MFDataConsumerConsumeCompleteData();

  if (v22 >= 0) {
    goto LABEL_12;
  }
  if (v11 && (uint64_t v24 = v11[10], v24))
  {
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    v26 = (void *)[v25 initWithDomain:*MEMORY[0x1E4F28760] code:v24 userInfo:0];
    id v27 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v28 = objc_msgSend(v27, "initWithObjectsAndKeys:", v26, *MEMORY[0x1E4F28A50], 0);
  }
  else
  {
    v28 = 0;
  }
  id v12 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 userInfo:v28];
  v29 = MFLookupLocalizedString(@"SMIME_CANT_ENCRYPT_MESSAGE", @"An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients.", @"Delayed");
  [v12 setLocalizedDescription:v29];

  if (v12)
  {
LABEL_4:
    v13 = objc_msgSend(v12, "mf_shortDescription");
    BOOL v14 = v13 == 0;

    if (v14)
    {
      uint64_t v15 = MFLookupLocalizedString(@"SMIME_CANT_ENCRYPT_TITLE", @"Unable to Encrypt", @"Delayed");
      [v12 setShortDescription:v15];
    }
    -[MFMimePart _setSMIMEError:](a1, v12);
    id v16 = +[MFActivityMonitor currentMonitor];
    [v16 setError:v12];

    id v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEEncoding) _encryptedDataUsingSecCMS:compositionSpecification:error:]();
    }

    int v18 = 0;
    id v19 = v12;
    if (a5)
    {
LABEL_13:
      *a5 = v19;
      if (!v18) {
        goto LABEL_14;
      }
LABEL_10:
      [v11 done];
      uint64_t v20 = [v11 data];
      goto LABEL_15;
    }
  }
  else
  {
LABEL_12:
    id v19 = 0;
    int v18 = 1;
    if (a5) {
      goto LABEL_13;
    }
  }
  if (v18) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v20 = 0;
LABEL_15:

  return v20;
}

- (id)_encryptedDataUsingMessageSecurity:()SMIMEEncoding compositionSpecification:contentType:error:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = MFLogGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[MFMimePart(SMIMEEncoding) _encryptedDataUsingMessageSecurity:compositionSpecification:contentType:error:]();
  }

  SecCertificateRef certificateRef = 0;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13 = [v10 objectForKey:@"AddressMetadata"];
  BOOL v14 = (__SecIdentity *)[v10 objectForKey:@"EncryptionIdentity"];
  if (v14 || (BOOL v14 = (__SecIdentity *)[v10 objectForKey:@"SigningIdentity"]) != 0)
  {
    SecIdentityCopyCertificate(v14, &certificateRef);
    if (certificateRef)
    {
      int v15 = [MEMORY[0x1E4F602E0] preferenceEnabled:34];
      char v16 = v15;
      if (v15)
      {
        id v17 = [MEMORY[0x1E4F607E0] oidStringsForAuthenticatedEncryption];
        int v18 = [v17 firstObject];
      }
      else
      {
        int v18 = 0;
      }
      __int16 v21 = [v10 objectForKey:@"RecipientCertificates"];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __107__MFMimePart_SMIMEEncoding___encryptedDataUsingMessageSecurity_compositionSpecification_contentType_error___block_invoke;
      v31[3] = &unk_1E5D40CE8;
      char v35 = v16;
      id v32 = v13;
      id v33 = v18;
      id v22 = v12;
      id v34 = v22;
      id v23 = v18;
      [v21 enumerateKeysAndObjectsUsingBlock:v31];

      buf[0] = 0;
      unsigned __int8 v30 = 0;
      [MEMORY[0x1E4F60458] encryptionLevelForSender:0 forAdvertisement:0 useGCM:buf encryptSubject:&v30];
      uint64_t v24 = [MEMORY[0x1E4F607E0] oidsForEncryptWithGCM:buf[0] encryptSubject:v30];
      char v29 = 0;
      id v25 = [MEMORY[0x1E4F607E0] encryptedDataFromContentData:v9 senderCertificate:certificateRef senderCapabilities:v24 recipients:v22 outIsAuthenticated:&v29 outError:a6];
      CFRelease(certificateRef);
      if (a5)
      {
        if (v29) {
          v26 = @"authEnveloped-data";
        }
        else {
          v26 = @"enveloped-data";
        }
        *a5 = v26;
      }

      goto LABEL_23;
    }
    id v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = "#SMIMEErrors Failed to obtain sender certificate for encryption";
LABEL_19:
      _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_INFO, v20, buf, 2u);
    }
  }
  else
  {
    id v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = "#SMIMEErrors sender SecIdentityRef for encryption is nil";
      goto LABEL_19;
    }
  }

  if (a6)
  {
    id v27 = MFLookupLocalizedString(@"SMIME_CANT_ENCRYPT_MESSAGE", @"An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients.", @"Delayed");
    *a6 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v27];
  }
  id v25 = 0;
LABEL_23:

  return v25;
}

- (void)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "[S/MIME] Signing failed with error: %{public}@", v4);
}

- (void)_signatureDataUsingMessageSecurity:()SMIMEEncoding forSender:compositionSpecification:outError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "[S/MIME] No encryption certificate found when signing.", v2, v3, v4, v5, v6);
}

- (void)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "[S/MIME] Encryption failed with error: %{public}@", v4);
}

- (void)_encryptedDataUsingSecCMS:()SMIMEEncoding compositionSpecification:error:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "#SMIMEErrors newEncryptedPart... failed with %{public}@", v4);
}

- (void)_encryptedDataUsingSecCMS:()SMIMEEncoding compositionSpecification:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_DEBUG, "#SMIMEErrors encrypting data using SecCMS", v1, 2u);
}

- (void)_encryptedDataUsingMessageSecurity:()SMIMEEncoding compositionSpecification:contentType:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_DEBUG, "#SMIMEErrors encrypting data using message security", v1, 2u);
}

@end