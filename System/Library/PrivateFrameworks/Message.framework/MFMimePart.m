@interface MFMimePart
- (BOOL)_needsSignatureVerification:(void *)a1;
- (void)_setSMIMEError:(void *)a1;
- (void)_setSignatureInfo:(void *)a1;
- (void)_setSigners:(void *)a1;
@end

@implementation MFMimePart

id __50__MFMimePart_SMIMEDecoding__decodeMultipartSigned__block_invoke(uint64_t a1, unsigned char *a2, unsigned char *a3, void *a4, void *a5)
{
  id v9 = a4;
  *a2 = 0;
  *a3 = 1;
  v10 = [*(id *)(a1 + 32) signedData];
  v11 = [*(id *)(a1 + 32) firstChildPart];
  v12 = [v11 nextSiblingPart];
  v13 = [v12 bodyData];

  v14 = objc_msgSend(v10, "mf_dataByConvertingUnixNewlinesToNetwork");
  if ([v13 length] && v14)
  {
    v15 = [*(id *)(a1 + 32) _decodeEncodedData:v13 detachedContentData:v14 isEncrypted:a2 isSigned:a3 signers:v9 error:a5];
    if (v15) {
      v16 = v10;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;
  }
  else
  {
    v15 = MFLookupLocalizedString(@"SMIME_UNREADABLE_SIG", @"There was a problem reading the digital signature for this message.", @"Delayed");
    +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1036 localizedDescription:v15];
    id v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

id __56__MFMimePart_SMIMEDecoding__decodeApplicationPkcs7_mime__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  v10 = [*(id *)(a1 + 32) bodyData];
  if (v10)
  {
    v11 = [*(id *)(a1 + 32) _decodeEncodedData:v10 detachedContentData:0 isEncrypted:a2 isSigned:a3 signers:v9 error:a5];
    v12 = v11;
    if (v11)
    {
      v13 = (void *)[v11 mutableCopy];
      objc_msgSend(v13, "mf_convertNetworkLineEndingsToUnix");
      objc_msgSend(v13, "mf_makeImmutable");
      id v14 = v13;

      v15 = v14;
    }
    else
    {
      id v14 = 0;
      v15 = 0;
    }
  }
  else
  {
    MFLookupLocalizedString(@"SMIME_CANT_DECRYPT_MESSAGE", @"This message is encrypted.  Install a profile containing your encryption identity to decrypt this message.", @"Delayed");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v14];
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)_setSignatureInfo:(void *)a1
{
  id v3 = a2;
  if (a1) {
    [a1 _setObjectInOtherIvars:v3 forKey:@"x-apple-smime-signature-info"];
  }
}

- (void)_setSigners:(void *)a1
{
  id v3 = a2;
  if (a1) {
    [a1 _setObjectInOtherIvars:v3 forKey:@"x-apple-smime-signers"];
  }
}

- (void)_setSMIMEError:(void *)a1
{
  id v3 = a2;
  if (a1) {
    [a1 _setObjectInOtherIvars:v3 forKey:@"x-apple-smime-error"];
  }
}

MFMessageSigner *__74__MFMimePart_SMIMEDecoding___verifySignatureWithDecoder_signedData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (v6)
  {
LABEL_2:
    v7 = 0;
    goto LABEL_3;
  }
  id obj = 0;
  CFTypeRef cf = 0;
  id v9 = (const void *)[*(id *)(a1 + 32) _signingTrustForAddress:*(void *)(a1 + 40) signatureInfo:v3 encryptionTrust:&cf error:&obj];
  objc_storeStrong(v5, obj);
  if (!v9)
  {
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_2;
  }
  v10 = [MFMessageSigner alloc];
  v7 = [(MFMessageSigner *)v10 initWithSender:*(void *)(a1 + 48) signingTrust:v9 encryptionTrust:cf verification:1];
  CFRelease(v9);
  if (cf) {
    CFRelease(cf);
  }
LABEL_3:

  return v7;
}

- (BOOL)_needsSignatureVerification:(void *)a1
{
  BOOL v2 = (BOOL)a1;
  if (a1)
  {
    id v4 = [a1 _objectInOtherIvarsForKey:@"x-apple-smime-error"];
    *a2 = v4;
    if (v4)
    {
      return 0;
    }
    else
    {
      v5 = [(id)v2 _objectInOtherIvarsForKey:@"x-apple-smime-signers"];
      BOOL v2 = v5 == 0;
    }
  }
  return v2;
}

void __107__MFMimePart_SMIMEEncoding___encryptedDataUsingMessageSecurity_compositionSpecification_contentType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  v8 = [v7 capabilities];

  if (*(unsigned char *)(a1 + 56) && ([v8 containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    if (v8)
    {
      id v9 = (void *)[v8 mutableCopy];
      [v9 addObject:*(void *)(a1 + 40)];

      v8 = v9;
    }
    else
    {
      v13[0] = *(void *)(a1 + 40);
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    }
  }
  id v10 = objc_alloc(MEMORY[0x1E4F607E8]);
  v11 = [v6 firstObject];
  v12 = (void *)[v10 initWithAddress:v5 certificate:v11 capabilities:v8];

  [*(id *)(a1 + 48) addObject:v12];
}

@end