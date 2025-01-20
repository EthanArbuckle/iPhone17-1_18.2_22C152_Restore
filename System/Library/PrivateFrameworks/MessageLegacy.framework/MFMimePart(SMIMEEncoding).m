@interface MFMimePart(SMIMEEncoding)
- (id)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:;
- (id)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:;
@end

@implementation MFMimePart(SMIMEEncoding)

- (id)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:
{
  v22 = 0;
  id v10 = [[_MFSecCMSEncoder alloc] initForSigningWithSender:a4 compositionSpecification:a5 error:&v22];
  id v11 = 0;
  if (!v22)
  {
    objc_msgSend(a3, "mf_dataByConvertingUnixNewlinesToNetwork");
    if (MFDataConsumerConsumeCompleteData() < 0)
    {
      int v12 = [v10 lastSecCMSError];
      if (v12)
      {
        uint64_t v13 = v12;
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        v15 = (void *)[v14 initWithDomain:*MEMORY[0x1E4F28760] code:v13 userInfo:0];
        id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v17 = objc_msgSend(v16, "initWithObjectsAndKeys:", v15, *MEMORY[0x1E4F28A50], 0);
      }
      else
      {
        v17 = 0;
      }
      v22 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 userInfo:v17];
      -[MFError setLocalizedDescription:](v22, "setLocalizedDescription:", [NSString stringWithFormat:MFLookupLocalizedString(@"SMIME_CANT_SIGN_MESSAGE", @"An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain.", @"Delayed", a4]);
    }
    if (v22)
    {
      id v11 = 0;
    }
    else
    {
      id v11 = objc_alloc_init((Class)objc_opt_class());
      [v11 setType:@"multipart"];
      [v11 setSubtype:@"signed"];
      [v11 setBodyParameter:@"application/pkcs7-signature" forKey:@"protocol"];
      [v11 setBodyParameter:@"sha1" forKey:@"micalg"];
      [v11 addSubpart:a1];
      id v18 = objc_alloc_init((Class)objc_opt_class());
      [v18 setType:@"application"];
      [v18 setSubtype:@"pkcs7-signature"];
      [v18 setDisposition:@"attachment"];
      [v18 setDispositionParameter:@"smime.p7s" forKey:@"filename"];
      [v18 setBodyParameter:@"smime.p7s" forKey:@"name"];
      [v11 addSubpart:v18];

      if (a6)
      {
        [v10 done];
        *a6 = (id)[v10 data];
      }
    }
  }

  if (v22)
  {
    if (![(MFError *)v22 mf_shortDescription]) {
      [(MFError *)v22 setShortDescription:MFLookupLocalizedString(@"SMIME_CANT_SIGN_TITLE", @"Unable to Sign", @"Delayed")];
    }
    [a1 _setSMIMEError:v22];
    id v19 = +[MFActivityMonitor currentMonitor];
    [v19 setError:v22];
    v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MFMimePart(SMIMEEncoding) newSignedPartWithData:sender:compositionSpecification:signatureData:]((void **)&v22, v20);
    }
  }
  return v11;
}

- (id)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:
{
  id v19 = 0;
  id v8 = [[_MFSecCMSEncoder alloc] initForEncryptionWithCompositionSpecification:a4 error:&v19];
  id v9 = 0;
  if (!v19)
  {
    objc_msgSend(a3, "mf_dataByConvertingUnixNewlinesToNetwork");
    if (MFDataConsumerConsumeCompleteData() < 0)
    {
      int v10 = [v8 lastSecCMSError];
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v13 = (void *)[v12 initWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
        id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v15 = objc_msgSend(v14, "initWithObjectsAndKeys:", v13, *MEMORY[0x1E4F28A50], 0);
      }
      else
      {
        v15 = 0;
      }
      id v19 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 userInfo:v15];
      [(MFError *)v19 setLocalizedDescription:MFLookupLocalizedString(@"SMIME_CANT_ENCRYPT_MESSAGE", @"An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients.", @"Delayed")];
    }
    if (v19)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = objc_alloc_init((Class)objc_opt_class());
      [v9 setType:@"application"];
      [v9 setSubtype:@"pkcs7-mime"];
      [v9 setDisposition:@"attachment"];
      [v9 setDispositionParameter:@"smime.p7m" forKey:@"filename"];
      [v9 setBodyParameter:@"enveloped-data" forKey:@"smime-type"];
      [v9 setBodyParameter:@"smime.p7m" forKey:@"name"];
      if (a5)
      {
        [v8 done];
        *a5 = (id)[v8 data];
      }
    }
  }

  if (v19)
  {
    if (![(MFError *)v19 mf_shortDescription]) {
      [(MFError *)v19 setShortDescription:MFLookupLocalizedString(@"SMIME_CANT_ENCRYPT_TITLE", @"Unable to Encrypt", @"Delayed")];
    }
    [a1 _setSMIMEError:v19];
    id v16 = +[MFActivityMonitor currentMonitor];
    [v16 setError:v19];
    v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MFMimePart(SMIMEEncoding) newEncryptedPartWithData:compositionSpecification:encryptedData:]((void **)&v19, v17);
    }
  }
  return v9;
}

- (void)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:.cold.1(void **a1, NSObject *a2)
{
  OUTLINED_FUNCTION_6_0(a1);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_4(&dword_1CFCFE000, a2, v3, "#SMIMEErrors newSignedPart... failed with %{public}@", v4);
}

- (void)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:.cold.1(void **a1, NSObject *a2)
{
  OUTLINED_FUNCTION_6_0(a1);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_4(&dword_1CFCFE000, a2, v3, "#SMIMEErrors newEncryptedPart... failed with %{public}@", v4);
}

@end