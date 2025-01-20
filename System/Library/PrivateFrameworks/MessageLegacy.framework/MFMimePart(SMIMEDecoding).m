@interface MFMimePart(SMIMEDecoding)
- (uint64_t)decodeApplicationPkcs7_mime;
- (uint64_t)decodeMultipartSigned;
- (void)decodeApplicationPkcs7_mime;
- (void)decodeMultipartSigned;
@end

@implementation MFMimePart(SMIMEDecoding)

- (uint64_t)decodeMultipartSigned
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v31 = 0;
  v2 = (void *)[a1 firstChildPart];
  uint64_t v3 = [v2 contentsForTextSystem];
  if (v3)
  {
    if (![a1 _needsSignatureVerification:&v31]
      || ![a1 usesKnownSignatureProtocol])
    {
      goto LABEL_42;
    }
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"), "dataForMimePart:", a1);
    if ([v4 length])
    {
      v5 = (void *)[[NSString alloc] initWithFormat:@"--%@", objc_msgSend(a1, "bodyParameterForKey:", @"boundary"];
      uint64_t v6 = objc_msgSend(v5, "mf_dataUsingEncoding:", 4);

      uint64_t v7 = objc_msgSend(v4, "mf_rangeOfData:options:range:", v6, 0, 0, objc_msgSend(v4, "length"));
      if (v7 == 0x7FFFFFFFFFFFFFFFLL || !v8) {
        goto LABEL_21;
      }
      uint64_t v9 = v7 + v8;
      uint64_t v10 = [v4 length];
      uint64_t v11 = [v4 bytes];
      while (1)
      {
        int v12 = *(unsigned __int8 *)(v11 + v9);
        if (v12 != 13 && v12 != 10) {
          break;
        }
        ++v9;
      }
      uint64_t v16 = v10 - v9;
      v4 = objc_msgSend(v4, "mf_subdataWithRange:", v9, v16);
      uint64_t v17 = objc_msgSend(v4, "mf_rangeOfData:options:range:", v6, 0, 0, v16);
      if (!v17) {
        goto LABEL_24;
      }
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_21:
        if (v4)
        {
          if (v31)
          {
LABEL_23:
            v18 = 0;
            goto LABEL_38;
          }
LABEL_27:
          uint64_t v20 = objc_msgSend((id)objc_msgSend(v2, "nextSiblingPart"), "bodyData");
          if (v20)
          {
            v18 = [[_MFSecCMSDecoder alloc] initWithPartData:v20 error:&v31];
            if (v31)
            {
LABEL_38:
              if (!v31)
              {
                *(void *)buf = 0;
                [(_MFSecCMSDecoder *)v18 done];
                v31 = -[_MFSecCMSDecoder verifyAgainstSenders:signingError:](v18, "verifyAgainstSenders:signingError:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"), "senders"), buf);
                objc_msgSend(a1, "_setSigners:", -[_MFSecCMSDecoder signers](v18, "signers"));
                if (!v31) {
                  v31 = *(MFError **)buf;
                }
              }

              [a1 _setSMIMEError:v31];
LABEL_42:
              v14 = v31;
              if (!v31) {
                return v3;
              }
              goto LABEL_43;
            }
          }
          else
          {
            v21 = MFLogGeneral();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CFCFE000, v21, OS_LOG_TYPE_INFO, "#SMIMEErrors Missing signature part!", buf, 2u);
            }
            v18 = 0;
            v31 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
            if (v31) {
              goto LABEL_38;
            }
          }
          objc_msgSend(v4, "mf_dataByConvertingUnixNewlinesToNetwork");
          if (MFDataConsumerConsumeCompleteData() < 0)
          {
            int v22 = [(_MFSecCMSDecoder *)v18 lastSecCMSError];
            if (v22)
            {
              uint64_t v23 = v22;
              id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
              v25 = (void *)[v24 initWithDomain:*MEMORY[0x1E4F28760] code:v23 userInfo:0];
              uint64_t v32 = *MEMORY[0x1E4F28A50];
              v33[0] = v25;
              uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
            }
            else
            {
              uint64_t v26 = 0;
            }
            v31 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 userInfo:v26];
            [(MFError *)v31 setLocalizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
          }
          goto LABEL_38;
        }
LABEL_24:
        v19 = MFLogGeneral();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CFCFE000, v19, OS_LOG_TYPE_INFO, "#SMIMEErrors Missing signed data!", buf, 2u);
        }
        v4 = 0;
        v31 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
        if (v31) {
          goto LABEL_23;
        }
        goto LABEL_27;
      }
      uint64_t v15 = objc_msgSend(v4, "mf_subdataWithRange:", 0, v17 - 1);
    }
    else
    {
      uint64_t v15 = [a1 signedData];
    }
    v4 = (void *)v15;
    goto LABEL_21;
  }
  v14 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
  v31 = v14;
  if (!v14) {
    return v3;
  }
LABEL_43:
  if (![(MFError *)v14 mf_shortDescription]) {
    [(MFError *)v31 setShortDescription:MFLookupLocalizedString(@"SMIME_SIG_TITLE", @"Unable to verify message signature", @"Delayed")];
  }
  id v27 = +[MFActivityMonitor currentMonitor];
  [v27 setError:v31];
  v28 = MFLogGeneral();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    [(MFMimePart(SMIMEDecoding) *)(void **)&v31 decodeMultipartSigned];
  }
  return v3;
}

- (uint64_t)decodeApplicationPkcs7_mime
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  unint64_t v60 = [a1 SMIMEError];
  uint64_t v4 = [a1 decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if (!(v60 | v4))
  {
    unint64_t v59 = 0;
    uint64_t v5 = [a1 bodyData];
    uint64_t v6 = v5 != 0;
    if (!v5)
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
      unint64_t v60 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_MESSAGE", @"This message is encrypted.  Install a profile containing your encryption identity to decrypt this message.", @"Delayed")];
      uint64_t v8 = 1;
      uint64_t v13 = 1;
      goto LABEL_48;
    }
    uint64_t v7 = [[_MFSecCMSDecoder alloc] initWithPartData:v5 error:&v60];
    objc_msgSend(-[_MFSecCMSDecoder signedData](v7, "signedData"), "mf_dataByConvertingUnixNewlinesToNetwork");
    if (MFDataConsumerConsumeCompleteData() < 0)
    {
      int v14 = [(_MFSecCMSDecoder *)v7 lastSecCMSError];
      if (v14)
      {
        uint64_t v15 = v14;
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = (void *)[v16 initWithDomain:*MEMORY[0x1E4F28760] code:v15 userInfo:0];
        id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v19 = objc_msgSend(v18, "initWithObjectsAndKeys:", v17, *MEMORY[0x1E4F28A50], 0);
      }
      else
      {
        v19 = 0;
      }
      unint64_t v60 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 userInfo:v19];
      [(id)v60 setLocalizedDescription:MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_MESSAGE", @"This message is encrypted.  Install a profile containing your encryption identity to decrypt this message.", @"Delayed"];

      uint64_t v9 = 0;
      uint64_t v8 = 1;
    }
    else
    {
      [(_MFSecCMSDecoder *)v7 done];
      uint64_t v8 = [(_MFSecCMSDecoder *)v7 isContentEncrypted];
      if (![(_MFSecCMSDecoder *)v7 isContentSigned])
      {
        uint64_t v13 = 0;
        uint64_t v9 = 0;
LABEL_20:
        if (v60)
        {
          uint64_t v20 = 0;
        }
        else
        {
          id v21 = [(_MFSecCMSDecoder *)v7 data];
          if (!v21) {
            id v21 = [(_MFSecCMSDecoder *)v7 signedData];
          }
          uint64_t v20 = (void *)[v21 mutableCopy];
          objc_msgSend(v20, "mf_convertNetworkLineEndingsToUnix");
          objc_msgSend(v20, "mf_makeImmutable");
        }

        uint64_t v10 = 0;
        if (v20 && !v60)
        {
          unsigned int v52 = v13;
          int v22 = [(MFDataMessageStore *)[_MFSecDataMessageStore alloc] initWithData:v20];
          +[MFMessage setMessageClassForStore:v22];
          -[MFDataMessageStore setStoragePath:](v22, "setStoragePath:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"), "attachmentStorageLocation"));
          id v23 = [(MFDataMessageStore *)v22 message];
          objc_msgSend(v23, "setMessagePropertiesFromMessage:", objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"));
          id v24 = objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message");
          uint64_t v54 = a2;
          unsigned int v53 = v8;
          if ([v24 isLibraryMessage]) {
            uint64_t v25 = [MEMORY[0x1E4F1CB10] URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"%@://%@", @"x-attach-SMIME", objc_msgSend(v24, "messageID"))];
          }
          else {
            uint64_t v25 = [v24 messageURL];
          }
          [v23 setMessageURL:v25];
          uint64_t v10 = [v23 messageBody];
          uint64_t v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v10, "topLevelPart"), "attachmentURLs"), "lastObject"), "URLByDeletingLastPathComponent");
          if (v26)
          {
            uint64_t v27 = v26;
            unsigned int v51 = v6;
            v28 = [[MFDecryptedAttachmentDataProvider alloc] initWithDecryptedMessage:v23];
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v29 = +[MFAttachmentManager allManagers];
            uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v61 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v56;
              do
              {
                for (uint64_t i = 0; i != v31; ++i)
                {
                  if (*(void *)v56 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  [*(id *)(*((void *)&v55 + 1) + 8 * i) addProvider:v28 forBaseURL:v27];
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v61 count:16];
              }
              while (v31);
            }

            uint64_t v6 = v51;
          }
          a2 = v54;
          uint64_t v13 = v52;
          uint64_t v8 = v53;
        }

        if (!v60)
        {
          unint64_t v60 = v59;
          if (!(v10 | v59))
          {
            v34 = MFLogGeneral();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              [(MFMimePart(SMIMEDecoding) *)v34 decodeApplicationPkcs7_mime];
            }
            if ((v8 | v13 ^ 1))
            {
              v42 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_MESSAGE", @"This message is encrypted.  Install a profile containing your encryption identity to decrypt this message.", @"Delayed")];
            }
            else
            {
              v42 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed")];
              uint64_t v8 = 0;
            }
            uint64_t v10 = 0;
            unint64_t v60 = (unint64_t)v42;
          }
        }
LABEL_48:
        [a1 _setDecryptedMessageBody:v10 isEncrypted:v8 isSigned:v13];
        if (!v10) {
          goto LABEL_49;
        }
        goto LABEL_7;
      }
      unint64_t v60 = -[_MFSecCMSDecoder verifyAgainstSenders:signingError:](v7, "verifyAgainstSenders:signingError:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"), "senders"), &v59);
      uint64_t v9 = [(_MFSecCMSDecoder *)v7 signers];
    }
    uint64_t v13 = 1;
    goto LABEL_20;
  }
  uint64_t v10 = v4;
  uint64_t v9 = 0;
  uint64_t v6 = 1;
  if (!v4)
  {
LABEL_49:
    uint64_t v12 = 0;
    goto LABEL_50;
  }
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SecureMimePart.m", 472, @"The message body should be a MFMimeBody.");
  }
  uint64_t v11 = (void *)[(id)v10 topLevelPart];
  uint64_t v12 = [v11 contentsForTextSystem];
  if (!v9) {
    uint64_t v9 = (NSArray *)(id)[v11 copySigners];
  }
  if (!v60) {
    unint64_t v60 = [v11 SMIMEError];
  }
LABEL_50:
  if (v9) {
    [a1 _setSigners:v9];
  }
  if (v60)
  {
    objc_msgSend(a1, "_setSMIMEError:");
    if (v60)
    {
      if (!objc_msgSend((id)v60, "mf_shortDescription"))
      {
        v43 = (void *)v60;
        if ([(id)v60 code] == 1036)
        {
          v44 = @"SMIME_SIG_TITLE";
          v45 = @"Unable to verify message signature";
        }
        else
        {
          v44 = @"SMIME_CANT_DECRYPT_TITLE";
          v45 = @"Unable to decrypt message";
        }
        objc_msgSend(v43, "setShortDescription:", MFLookupLocalizedString((uint64_t)v44, (uint64_t)v45, @"Delayed"));
      }
      id v46 = +[MFActivityMonitor currentMonitor];
      [v46 setError:v60];
      v47 = MFLogGeneral();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        [(MFMimePart(SMIMEDecoding) *)(void **)&v60 decodeApplicationPkcs7_mime];
      }
    }
  }
  v48 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  uint64_t v49 = [NSNumber numberWithBool:v6];
  [v48 setObject:v49 forKey:*MEMORY[0x1E4F73458]];
  return v12;
}

- (void)decodeMultipartSigned
{
  OUTLINED_FUNCTION_6_0(a1);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_4(&dword_1CFCFE000, a2, v3, "#SMIMEErrors decodeMultipartSigned failed with %{public}@", v4);
}

- (void)decodeApplicationPkcs7_mime
{
}

@end