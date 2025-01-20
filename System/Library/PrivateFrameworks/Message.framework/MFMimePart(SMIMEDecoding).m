@interface MFMimePart(SMIMEDecoding)
- (SecTrustRef)_signingTrustForAddress:()SMIMEDecoding signatureInfo:encryptionTrust:error:;
- (id)_associateAttachmentsFrom:()SMIMEDecoding to:;
- (id)_decodeApplicationPkcs7MimeWithSecCMS;
- (id)_decodeEncodedData:()SMIMEDecoding detachedContentData:isEncrypted:isSigned:signers:error:;
- (id)_decodeMultipartSignedWithSecCMS;
- (id)_decodeWithBlock:()SMIMEDecoding;
- (id)_messageBodyFromData:()SMIMEDecoding outUnwrappedMessage:;
- (id)_signingErrorWithStatus:()SMIMEDecoding localizedDescription:;
- (id)_verifySignatureWithDecoder:()SMIMEDecoding signedData:error:;
- (id)decodeApplicationPkcs7_mime;
- (id)decodeMultipartSigned;
- (void)_decodeApplicationPkcs7MimeWithSecCMS;
- (void)_decodeMultipartSignedWithSecCMS;
@end

@implementation MFMimePart(SMIMEDecoding)

- (id)decodeMultipartSigned
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v2 = [MEMORY[0x1E4F602E0] preferenceEnabled:28];
  v3 = [MEMORY[0x1E4F73530] log];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v20 = a1;
      _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "[S/MIME] Decoding multipart/signed with MessageSecurity: %@", buf, 0xCu);
    }

    v5 = [a1 firstChildPart];
    v6 = [v5 contentsForTextSystem];
    if (v6)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __50__MFMimePart_SMIMEDecoding__decodeMultipartSigned__block_invoke;
      v18[3] = &unk_1E5D40C98;
      v18[4] = a1;
      uint64_t v7 = [a1 _decodeWithBlock:v18];
      v8 = (void *)v7;
      if (v7) {
        v9 = (void *)v7;
      }
      else {
        v9 = v6;
      }
      id v10 = v9;
    }
    else
    {
      v11 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
      v12 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v11];

      v13 = MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
      [v12 setShortDescription:v13];

      v14 = +[MFActivityMonitor currentMonitor];
      [v14 setError:v12];

      v15 = [MEMORY[0x1E4F73530] log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(v12, "ef_publicDescription");
        *(_DWORD *)buf = 138543362;
        v20 = v16;
        _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "[S/MIME] Failed to decode first child part for multipart/signed with error: %{public}@", buf, 0xCu);
      }
      id v10 = 0;
    }
  }
  else
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v20 = a1;
      _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "[S/MIME] Decoding multipart/signed with SecCMS: %@", buf, 0xCu);
    }

    id v10 = [a1 _decodeMultipartSignedWithSecCMS];
  }
  return v10;
}

- (id)decodeApplicationPkcs7_mime
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v2 = [MEMORY[0x1E4F602E0] preferenceEnabled:28];
  v3 = [MEMORY[0x1E4F73530] log];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v9 = a1;
      _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "[S/MIME] Decoding application/pkcs7-mime with MessageSecurity: %@", buf, 0xCu);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__MFMimePart_SMIMEDecoding__decodeApplicationPkcs7_mime__block_invoke;
    v7[3] = &unk_1E5D40C98;
    v7[4] = a1;
    v5 = [a1 _decodeWithBlock:v7];
  }
  else
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v9 = a1;
      _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "[S/MIME] Decoding application/pkcs7-mime with SecCMS: %@", buf, 0xCu);
    }

    v5 = [a1 _decodeApplicationPkcs7MimeWithSecCMS];
  }
  return v5;
}

- (id)_decodeWithBlock:()SMIMEDecoding
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v40 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [a1 SMIMEError];
  uint64_t v6 = [a1 decryptedMessageBodyIsEncrypted:0 isSigned:0];
  unsigned __int8 v44 = 1;
  unsigned __int8 v43 = 1;
  if (!(v5 | v6))
  {
    id v42 = 0;
    uint64_t v7 = v40[2](v40, &v44, &v43, v4, &v42);
    uint64_t v5 = (uint64_t)v42;
    if (v7)
    {
      id v41 = 0;
      uint64_t v6 = [a1 _messageBodyFromData:v7 outUnwrappedMessage:&v41];
      id v8 = v41;
      v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 subject];
        [a1 _setWrappedSubject:v10];
      }
      if (v6)
      {
        uint64_t v11 = v5;
      }
      else
      {
        v12 = [MEMORY[0x1E4F73530] log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[MFMimePart(SMIMEDecoding) _decodeWithBlock:]();
        }

        if (v44 || !v43)
        {
          v13 = MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_MESSAGE", @"This message is encrypted.  Install a profile containing your encryption identity to decrypt this message.", @"Delayed");
          uint64_t v14 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v13];
        }
        else
        {
          v13 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
          uint64_t v14 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v13];
        }
        uint64_t v11 = v14;
      }
      uint64_t v5 = v11;
    }
    else
    {
      uint64_t v6 = 0;
    }
    [a1 _setDecryptedMessageBody:v6 isEncrypted:v44 isSigned:v43];
  }
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:a2 object:a1 file:@"SecureMimePart.m" lineNumber:337 description:@"The message body should be a MFMimeBody."];
    }
    v15 = [(id)v6 topLevelPart];
    v16 = [v15 contentsForTextSystem];
    v17 = (void *)[v15 copySigners];
    [v4 addObjectsFromArray:v17];

    if (!v5)
    {
      uint64_t v5 = [v15 SMIMEError];
    }
    v18 = [v15 wrappedSubject];
    if (v18)
    {
      v19 = [a1 wrappedSubject];
      BOOL v20 = v19 == 0;

      if (v20)
      {
        uint64_t v21 = [v15 wrappedSubject];
        [a1 _setWrappedSubject:v21];
      }
    }
    v22 = [v15 signatureInfo];
    if (v22)
    {
      v23 = [a1 signatureInfo];
      BOOL v24 = v23 == 0;

      if (v24)
      {
        v25 = [v15 signatureInfo];
        -[MFMimePart _setSignatureInfo:](a1, v25);
      }
    }
  }
  else
  {
    v16 = 0;
  }
  if ([v4 count])
  {
    -[MFMimePart _setSigners:](a1, v4);
    v26 = [a1 mimeBody];
    [v26 setSigners:v4];
  }
  int v27 = v44;
  v28 = [a1 mimeBody];
  [v28 setIsEncrypted:v27 != 0];

  if (v5)
  {
    v29 = objc_msgSend((id)v5, "mf_shortDescription");
    BOOL v30 = v29 == 0;

    if (v30)
    {
      if ([(id)v5 code] == 1036) {
        MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
      }
      else {
      v31 = MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_TITLE", @"Unable to decrypt message", @"Delayed");
      }
      [(id)v5 setShortDescription:v31];
    }
    -[MFMimePart _setSMIMEError:](a1, (void *)v5);
    v32 = +[MFActivityMonitor currentMonitor];
    [v32 setError:v5];

    v33 = [MEMORY[0x1E4F73530] log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v5, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEDecoding) _decodeWithBlock:]();
    }
  }
  v34 = [MEMORY[0x1E4F29060] currentThread];
  v35 = [v34 threadDictionary];

  v36 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  [v35 setObject:v36 forKey:*MEMORY[0x1E4F73458]];

  return v16;
}

- (id)_decodeEncodedData:()SMIMEDecoding detachedContentData:isEncrypted:isSigned:signers:error:
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v28 = a4;
  id v29 = a7;
  id v32 = 0;
  int v27 = v14;
  v15 = [MEMORY[0x1E4F607D8] decoderForEncodedData:v14 detachedContentData:v28 outError:&v32];
  id v16 = v32;
  if (!v15)
  {
    id v20 = 0;
    id v21 = 0;
    if (!a8) {
      goto LABEL_22;
    }
LABEL_16:
    if (v16)
    {
      v23 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
      uint64_t v33 = *MEMORY[0x1E4F28A50];
      v34[0] = v16;
      BOOL v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      *a8 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v23 title:0 userInfo:v24];

      id v21 = 0;
    }
    else
    {
      id v21 = 0;
      *a8 = 0;
    }
    goto LABEL_22;
  }
  int v17 = [v15 isEncrypted];
  int v18 = [v15 isSigned];
  char v19 = v18;
  if (v17)
  {
    id v20 = [v15 decryptedContentData];
    goto LABEL_19;
  }
  if (!v18)
  {
    id v20 = 0;
LABEL_19:
    id v21 = 0;
    if (!a5) {
      goto LABEL_11;
    }
LABEL_10:
    *a5 = v17;
    goto LABEL_11;
  }
  id v30 = 0;
  id v31 = 0;
  v22 = [a1 _verifySignatureWithDecoder:v15 signedData:&v31 error:&v30];
  id v20 = v31;
  id v21 = v30;
  if (v22) {
    [v29 addObjectsFromArray:v22];
  }

  if (a5) {
    goto LABEL_10;
  }
LABEL_11:
  if (a6) {
    *a6 = v19;
  }
  if (a8)
  {
    if (v21)
    {
      id v21 = v21;
      *a8 = v21;
      goto LABEL_22;
    }
    goto LABEL_16;
  }
LABEL_22:
  id v25 = v20;

  return v25;
}

- (id)_verifySignatureWithDecoder:()SMIMEDecoding signedData:error:
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v28 = 0;
  uint64_t v7 = [a3 extractSignatureInfoAndSignedData:a4 outError:&v28];
  id v8 = v28;
  if (v7)
  {
    v9 = [a1 mimeBody];
    uint64_t v10 = [v9 message];
    uint64_t v11 = [v10 firstSender];

    id v12 = v11;
    v13 = [v12 emailAddressValue];
    id v14 = [v13 simpleAddress];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v12 stringValue];
    }
    char v19 = v16;

    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x3032000000;
    id v32 = __Block_byref_object_copy__19;
    uint64_t v33 = __Block_byref_object_dispose__19;
    id v34 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__MFMimePart_SMIMEDecoding___verifySignatureWithDecoder_signedData_error___block_invoke;
    v24[3] = &unk_1E5D40CC0;
    int v27 = &v29;
    v24[4] = a1;
    id v20 = v19;
    id v25 = v20;
    id v18 = v12;
    id v26 = v18;
    id v21 = objc_msgSend(v7, "ef_compactMap:", v24);
    if ([v7 count])
    {
      v22 = [v7 firstObject];
      -[MFMimePart _setSignatureInfo:](a1, v22);
    }
    if (a5) {
      *a5 = (id) v30[5];
    }

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    int v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEDecoding) _verifySignatureWithDecoder:signedData:error:]();
    }

    if (!a5)
    {
      id v21 = 0;
      goto LABEL_19;
    }
    if (v8)
    {
      uint64_t v35 = *MEMORY[0x1E4F28A50];
      v36[0] = v8;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    }
    else
    {
      id v18 = 0;
    }
    MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v20 title:0 userInfo:v18];
    id v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_19:
  return v21;
}

- (SecTrustRef)_signingTrustForAddress:()SMIMEDecoding signatureInfo:encryptionTrust:error:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (const void *)[v11 signingCertificate];
  if (!v12)
  {
    int v17 = MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
    id v18 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v17];
    goto LABEL_8;
  }
  SecTrustRef trust = 0;
  v13 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:v10];
  uint64_t v14 = SecTrustCreateWithCertificates(v12, v13, &trust);
  if (v13) {
    CFRelease(v13);
  }
  if (!v14)
  {
    id v21 = trust;
    if (trust)
    {
      v22 = [a1 mimeBody];
      v23 = [v22 message];
      OSStatus v24 = SecTrustSetVerifyDate(v21, (CFDateRef)[v23 dateReceived]);

      if (!v24)
      {
        id v25 = (const void *)[v11 preferredEncryptionCertificate];
        if (v25)
        {
          id v26 = +[MFMessageKeychainManager copySMIMEEncryptionPolicyForAddress:v10];
          SecTrustRef v28 = 0;
          uint64_t v27 = SecTrustCreateWithCertificates(v25, v26, &v28);
          if (v26) {
            CFRelease(v26);
          }
          if (v27)
          {
            v15 = MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
            id v16 = [a1 _signingErrorWithStatus:v27 localizedDescription:v15];
            goto LABEL_6;
          }
          if (a5) {
            *a5 = v28;
          }
        }
        SecTrustRef v19 = trust;
        goto LABEL_10;
      }
    }
    int v17 = MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
    id v18 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v17];
LABEL_8:
    *a6 = v18;

    goto LABEL_9;
  }
  v15 = MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
  id v16 = [a1 _signingErrorWithStatus:v14 localizedDescription:v15];
LABEL_6:
  *a6 = v16;

LABEL_9:
  SecTrustRef v19 = 0;
LABEL_10:

  return v19;
}

- (id)_signingErrorWithStatus:()SMIMEDecoding localizedDescription:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v7 = (void *)[v6 initWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:0];
  uint64_t v11 = *MEMORY[0x1E4F28A50];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v5 title:0 userInfo:v8];

  return v9;
}

- (id)_messageBodyFromData:()SMIMEDecoding outUnwrappedMessage:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 mimeBody];
  id v8 = [v7 message];

  v9 = +[MFMessage messageWithRFC822Data:v6 withParentPart:a1];
  [v9 setMessagePropertiesFromMessage:v8];
  id v10 = [a1 _associateAttachmentsFrom:v8 to:v9];
  uint64_t v11 = [v9 messageStore];
  id v12 = [v11 bodyDataForMessage:v9 isComplete:0 isPartial:0 downloadIfNecessary:0];

  if (v12 && _os_feature_enabled_impl())
  {
    id v21 = [v10 topLevelPart];
    v13 = [v21 type];
    if ([v13 isEqualToString:@"message"])
    {
      uint64_t v14 = [v21 subtype];
      int v15 = [v14 isEqualToString:@"rfc822"];

      if (v15)
      {
        id v16 = [MEMORY[0x1E4F73530] log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = a1;
          _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "[S/MIME] Unwrapping message: %@", buf, 0xCu);
        }

        uint64_t v17 = +[MFMessage messageWithRFC822Data:v12];

        uint64_t v18 = [a1 _associateAttachmentsFrom:v8 to:v17];

        int v15 = 1;
        v9 = (void *)v17;
        id v10 = (void *)v18;
      }
    }
    else
    {

      int v15 = 0;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (a4)
  {
    if (v15) {
      SecTrustRef v19 = v9;
    }
    else {
      SecTrustRef v19 = 0;
    }
    *a4 = v19;
  }

  return v10;
}

- (id)_associateAttachmentsFrom:()SMIMEDecoding to:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isLibraryMessage])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = NSString;
    v9 = [v5 messageID];
    id v10 = [v8 stringWithFormat:@"%@://%@", @"x-attach-SMIME", v9];
    uint64_t v11 = [v7 URLWithString:v10];
  }
  else
  {
    uint64_t v11 = [v5 messageURL];
  }
  [v6 setMessageURL:v11];
  id v12 = [v6 messageBody];
  v13 = [v12 topLevelPart];
  uint64_t v14 = [v13 attachmentURLs];
  int v15 = [v14 lastObject];
  id v16 = [v15 URLByDeletingLastPathComponent];

  if (v16)
  {
    uint64_t v17 = [[MFDecryptedAttachmentDataProvider alloc] initWithDecryptedMessage:v6];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v18 = +[MFAttachmentManager allManagers];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) addProvider:v17 forBaseURL:v16];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }
  }
  return v12;
}

- (id)_decodeMultipartSignedWithSecCMS
{
  v62[1] = *MEMORY[0x1E4F143B8];
  char v2 = [a1 firstChildPart];
  id v56 = [v2 contentsForTextSystem];
  if (!v56)
  {
    id v21 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
    id v4 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v21];

    v22 = objc_msgSend(v4, "mf_shortDescription");

    if (!v22)
    {
      long long v23 = MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
      [v4 setShortDescription:v23];

      if (!v4) {
        goto LABEL_40;
      }
      goto LABEL_37;
    }
    goto LABEL_15;
  }
  id v59 = 0;
  BOOL v3 = -[MFMimePart _needsSignatureVerification:](a1, &v59);
  id v4 = v59;
  if (!v3 || ![a1 usesKnownSignatureProtocol])
  {
LABEL_15:
    if (!v4) {
      goto LABEL_40;
    }
    goto LABEL_37;
  }
  id v5 = [a1 mimeBody];
  id v6 = [v5 message];
  uint64_t v7 = [v6 dataForMimePart:a1];

  if (![v7 length])
  {
    long long v24 = [a1 signedData];
    id v10 = v7;
    goto LABEL_26;
  }
  id v8 = [NSString alloc];
  v9 = [a1 bodyParameterForKey:@"boundary"];
  id v10 = (void *)[v8 initWithFormat:@"--%@", v9];

  uint64_t v11 = objc_msgSend(v10, "mf_dataUsingEncoding:", 4);
  uint64_t v13 = objc_msgSend(v7, "mf_rangeOfData:options:range:", v11, 0, 0, objc_msgSend(v7, "length"));
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = v12;
    if (v12)
    {
      uint64_t v15 = [v7 length];
      id v16 = v7;
      uint64_t v17 = [v16 bytes];
      for (uint64_t i = v13 + v14; ; ++i)
      {
        int v19 = *(unsigned __int8 *)(v17 + i);
        if (v19 != 13 && v19 != 10) {
          break;
        }
      }
      uint64_t v25 = v15 - i;
      uint64_t v7 = objc_msgSend(v16, "mf_subdataWithRange:");

      uint64_t v26 = objc_msgSend(v7, "mf_rangeOfData:options:range:", v11, 0, 0, v25);
      if (!v26)
      {
        uint64_t v27 = 0;
        goto LABEL_24;
      }
      if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v27 = objc_msgSend(v7, "mf_subdataWithRange:", 0, v26 - 1);
LABEL_24:

        uint64_t v7 = (void *)v27;
      }
    }
  }

  long long v24 = v7;
LABEL_26:

  if (v24)
  {
    id v28 = v4;
  }
  else
  {
    uint64_t v29 = MFLogGeneral();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v29, OS_LOG_TYPE_INFO, "#SMIMEErrors Missing signed data!", buf, 2u);
    }

    id v30 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
    id v28 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v30];
  }
  if (v28)
  {
    uint64_t v31 = 0;
LABEL_33:

    id v4 = v28;
LABEL_34:
    id v32 = objc_msgSend(v4, "mf_shortDescription");
    BOOL v33 = v32 == 0;

    if (v33)
    {
      id v34 = MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
      [v4 setShortDescription:v34];
    }
    -[MFMimePart _setSMIMEError:](a1, v4);
LABEL_37:
    uint64_t v35 = +[MFActivityMonitor currentMonitor];
    [v35 setError:v4];

    v36 = MFLogGeneral();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEDecoding) _decodeMultipartSignedWithSecCMS]();
    }

    goto LABEL_40;
  }
  v38 = [v2 nextSiblingPart];
  v39 = [v38 bodyData];

  if (!v39)
  {
    id v42 = MFLogGeneral();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v42, OS_LOG_TYPE_INFO, "#SMIMEErrors Missing signature part!", buf, 2u);
    }

    unsigned __int8 v43 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
    id v28 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v43];

    uint64_t v31 = 0;
LABEL_53:
    if (v28) {
      goto LABEL_33;
    }
    goto LABEL_54;
  }
  id v58 = 0;
  uint64_t v31 = -[_MFSecCMSDecoder initWithPartData:error:]((char *)[_MFSecCMSDecoder alloc], v39, &v58);
  id v28 = v58;

  if (v28) {
    goto LABEL_33;
  }
  if (v31)
  {
    if (*((void *)v31 + 2))
    {
      InnerContent = (void *)SecCmsContentInfoGetInnerContent();
      if (InnerContent)
      {
        if (*InnerContent)
        {
          id v28 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 userInfo:0];
          id v41 = MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
          [v28 setLocalizedDescription:v41];

          goto LABEL_53;
        }
      }
    }
  }
LABEL_54:
  unsigned __int8 v44 = objc_msgSend(v24, "mf_dataByConvertingUnixNewlinesToNetwork");
  uint64_t v45 = MFDataConsumerConsumeCompleteData();

  if (v45 < 0)
  {
    if (v31 && (uint64_t v51 = *((int *)v31 + 2), v51))
    {
      id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
      v53 = (void *)[v52 initWithDomain:*MEMORY[0x1E4F28760] code:v51 userInfo:0];
      uint64_t v61 = *MEMORY[0x1E4F28A50];
      v62[0] = v53;
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    }
    else
    {
      v54 = 0;
    }
    id v28 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 userInfo:v54];
    v55 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
    [v28 setLocalizedDescription:v55];

    if (v28) {
      goto LABEL_33;
    }
  }
  [v31 done];
  v46 = [a1 mimeBody];
  v47 = [v46 message];
  v48 = [v47 senders];
  id v57 = 0;
  -[_MFSecCMSDecoder verifyAgainstSenders:signingError:]((uint64_t)v31, v48, &v57);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v49 = v57;

  if (v31) {
    v50 = (void *)*((void *)v31 + 4);
  }
  else {
    v50 = 0;
  }
  -[MFMimePart _setSigners:](a1, v50);
  if (!v4) {
    id v4 = v49;
  }

  if (v4) {
    goto LABEL_34;
  }
LABEL_40:

  return v56;
}

- (id)_decodeApplicationPkcs7MimeWithSecCMS
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [a1 SMIMEError];
  uint64_t v6 = [a1 decryptedMessageBodyIsEncrypted:0 isSigned:0];
  uint64_t v69 = a2;
  if (v5 | v6)
  {
    BOOL v14 = 1;
    uint64_t v8 = 1;
    goto LABEL_45;
  }
  uint64_t v7 = [a1 bodyData];
  uint64_t v8 = v7 != 0;
  if (v7)
  {
    id v77 = 0;
    v9 = -[_MFSecCMSDecoder initWithPartData:error:]((char *)[_MFSecCMSDecoder alloc], v7, &v77);
    id v10 = v77;
    uint64_t v70 = (uint64_t)v9;
    uint64_t v11 = -[_MFSecCMSDecoder signedData](v9);
    uint64_t v12 = objc_msgSend(v11, "mf_dataByConvertingUnixNewlinesToNetwork");
    uint64_t v13 = MFDataConsumerConsumeCompleteData();

    if (v13 >= 0)
    {
      [(id)v70 done];
      if (v70)
      {
        BOOL v14 = *(unsigned char *)(v70 + 56) != 0;
        if (*(void *)(v70 + 40))
        {
          uint64_t v15 = [a1 mimeBody];
          id v16 = [v15 message];
          uint64_t v17 = [v16 senders];
          id v76 = 0;
          uint64_t v5 = -[_MFSecCMSDecoder verifyAgainstSenders:signingError:](v70, v17, &v76);
          id v71 = v76;

          [v4 addObjectsFromArray:*(void *)(v70 + 32)];
          goto LABEL_14;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
      unsigned int v68 = 0;
      id v71 = 0;
      uint64_t v5 = (uint64_t)v10;
      if (v10) {
        goto LABEL_15;
      }
      goto LABEL_18;
    }
    if (v70 && (uint64_t v20 = *(int *)(v70 + 8), v20))
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      v22 = (void *)[v21 initWithDomain:*MEMORY[0x1E4F28760] code:v20 userInfo:0];
      id v23 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      long long v24 = objc_msgSend(v23, "initWithObjectsAndKeys:", v22, *MEMORY[0x1E4F28A50], 0);
    }
    else
    {
      long long v24 = 0;
    }
    uint64_t v5 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 userInfo:v24];

    uint64_t v25 = MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_MESSAGE", @"This message is encrypted.  Install a profile containing your encryption identity to decrypt this message.", @"Delayed");
    [(id)v5 setLocalizedDescription:v25];

    id v71 = 0;
    BOOL v14 = 1;
LABEL_14:
    unsigned int v68 = 1;
    if (v5)
    {
LABEL_15:
      uint64_t v26 = 0;
      uint64_t v6 = 0;
LABEL_43:

      uint64_t v19 = v68;
      goto LABEL_44;
    }
LABEL_18:
    uint64_t v27 = [(id)v70 data];
    if (!v27)
    {
      uint64_t v27 = -[_MFSecCMSDecoder signedData]((void *)v70);
    }
    id v28 = (void *)[v27 mutableCopy];
    objc_msgSend(v28, "mf_convertNetworkLineEndingsToUnix");
    objc_msgSend(v28, "mf_makeImmutable");
    v67 = v28;

    if (v28)
    {
      uint64_t v29 = [a1 mimeBody];
      v64 = [v29 message];

      v66 = +[MFMessage messageWithRFC822Data:v28 withParentPart:a1];
      [v66 setMessagePropertiesFromMessage:v64];
      if ([v64 isLibraryMessage])
      {
        id v30 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v31 = NSString;
        id v32 = [v64 messageID];
        BOOL v33 = [v31 stringWithFormat:@"%@://%@", @"x-attach-SMIME", v32];
        uint64_t v34 = [v30 URLWithString:v33];

        uint64_t v35 = v34;
      }
      else
      {
        uint64_t v35 = [v64 messageURL];
      }
      v65 = (void *)v35;
      objc_msgSend(v66, "setMessageURL:");
      uint64_t v6 = [v66 messageBody];
      v36 = [(id)v6 topLevelPart];
      v37 = [v36 attachmentURLs];
      v38 = [v37 lastObject];
      v39 = [v38 URLByDeletingLastPathComponent];

      if (v39)
      {
        v40 = [[MFDecryptedAttachmentDataProvider alloc] initWithDecryptedMessage:v66];
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        v63 = v7;
        id v41 = +[MFAttachmentManager allManagers];
        BOOL v62 = v7 != 0;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v72 objects:v78 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v73 != v43) {
                objc_enumerationMutation(v41);
              }
              [*(id *)(*((void *)&v72 + 1) + 8 * i) addProvider:v40 forBaseURL:v39];
            }
            uint64_t v42 = [v41 countByEnumeratingWithState:&v72 objects:v78 count:16];
          }
          while (v42);
        }

        uint64_t v7 = v63;
        uint64_t v8 = v62;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v5 = (uint64_t)v71;
    if (!(v5 | v6))
    {
      uint64_t v45 = MFLogGeneral();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[MFMimePart(SMIMEDecoding) _decodeApplicationPkcs7MimeWithSecCMS]();
      }

      if (v14 | v68 ^ 1)
      {
        v46 = MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_MESSAGE", @"This message is encrypted.  Install a profile containing your encryption identity to decrypt this message.", @"Delayed");
        +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v46];
      }
      else
      {
        v46 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
        +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v46];
      uint64_t v5 = };

      uint64_t v6 = 0;
    }
    uint64_t v26 = v67;
    goto LABEL_43;
  }
  uint64_t v18 = MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_MESSAGE", @"This message is encrypted.  Install a profile containing your encryption identity to decrypt this message.", @"Delayed");
  uint64_t v5 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v18];

  uint64_t v6 = 0;
  id v71 = 0;
  BOOL v14 = 1;
  uint64_t v19 = 1;
LABEL_44:
  [a1 _setDecryptedMessageBody:v6 isEncrypted:v14 isSigned:v19];

LABEL_45:
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v61 = [MEMORY[0x1E4F28B00] currentHandler];
      [v61 handleFailureInMethod:v69 object:a1 file:@"SecureMimePart.m" lineNumber:860 description:@"The message body should be a MFMimeBody."];
    }
    v47 = [(id)v6 topLevelPart];
    v48 = [v47 contentsForTextSystem];
    id v49 = (void *)[v47 copySigners];
    [v4 addObjectsFromArray:v49];

    if (!v5)
    {
      uint64_t v5 = [v47 SMIMEError];
    }
  }
  else
  {
    v48 = 0;
  }
  if ([v4 count])
  {
    -[MFMimePart _setSigners:](a1, v4);
    v50 = [a1 mimeBody];
    [v50 setSigners:v4];
  }
  uint64_t v51 = [a1 mimeBody];
  [v51 setIsEncrypted:v14];

  if (v5)
  {
    id v52 = objc_msgSend((id)v5, "mf_shortDescription");
    BOOL v53 = v52 == 0;

    if (v53)
    {
      if ([(id)v5 code] == 1036) {
        MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed");
      }
      else {
      v54 = MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_TITLE", @"Unable to decrypt message", @"Delayed");
      }
      [(id)v5 setShortDescription:v54];
    }
    -[MFMimePart _setSMIMEError:](a1, (void *)v5);
    v55 = +[MFActivityMonitor currentMonitor];
    [v55 setError:v5];

    id v56 = MFLogGeneral();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v5, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEDecoding) _decodeApplicationPkcs7MimeWithSecCMS]();
    }
  }
  id v57 = [MEMORY[0x1E4F29060] currentThread];
  id v58 = [v57 threadDictionary];

  id v59 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
  [v58 setObject:v59 forKey:*MEMORY[0x1E4F73458]];

  return v48;
}

- (void)_decodeWithBlock:()SMIMEDecoding .cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "[S/MIME] Failed to decode part with error: %{public}@", v4);
}

- (void)_decodeWithBlock:()SMIMEDecoding .cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "[S/MIME] There was no error while decrypting the message but there was no body either!", v2, v3, v4, v5, v6);
}

- (void)_verifySignatureWithDecoder:()SMIMEDecoding signedData:error:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "#SMIMEErrors Signature verification failed: %{public}@", v4);
}

- (void)_decodeMultipartSignedWithSecCMS
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "#SMIMEErrors decodeMultipartSigned failed with %{public}@", v4);
}

- (void)_decodeApplicationPkcs7MimeWithSecCMS
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "#SMIMEErrors There was no error while decrypting the message but there was no body either!", v2, v3, v4, v5, v6);
}

@end