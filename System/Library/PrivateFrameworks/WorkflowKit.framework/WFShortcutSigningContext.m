@interface WFShortcutSigningContext
+ (id)contextWithAppleIDAccount:(id)a3 signingKey:(__SecKey *)a4;
+ (id)contextWithAuthData:(id)a3;
+ (id)contextWithSigningCertificateChain:(id)a3;
- (BOOL)validateAppleIDCertificatesWithError:(id *)a3;
- (BOOL)validateSigningCertificateChainWithICloudIdentifier:(id *)a3 error:(id *)a4;
- (BOOL)validateWithSigningMethod:(int64_t *)a3 error:(id *)a4;
- (BOOL)validateWithSigningMethod:(int64_t *)a3 iCloudIdentifier:(id *)a4 error:(id *)a5;
- (NSArray)appleIDCertificateChain;
- (NSArray)signingCertificateChain;
- (NSData)signingPublicKeySignature;
- (NSDate)expirationDate;
- (SFAppleIDValidationRecord)appleIDValidationRecord;
- (WFShortcutSigningContext)initWithAppleIDValidationRecord:(id)a3 appleIDCertificateChain:(id)a4 signingPublicKey:(__SecKey *)a5 signingPublicKeyData:(id)a6;
- (WFShortcutSigningContext)initWithSigningCertificateChain:(id)a3;
- (__SecKey)copyPublicKey;
- (__SecKey)signingPublicKey;
- (id)generateAuthData;
- (void)dealloc;
- (void)setSigningPublicKey:(__SecKey *)a3;
- (void)setSigningPublicKeySignature:(id)a3;
- (void)validateAppleIDValidationRecordWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation WFShortcutSigningContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingPublicKeySignature, 0);
  objc_storeStrong((id *)&self->_appleIDCertificateChain, 0);
  objc_storeStrong((id *)&self->_appleIDValidationRecord, 0);
  objc_storeStrong((id *)&self->_signingCertificateChain, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

- (void)setSigningPublicKeySignature:(id)a3
{
}

- (NSData)signingPublicKeySignature
{
  return self->_signingPublicKeySignature;
}

- (void)setSigningPublicKey:(__SecKey *)a3
{
  self->_signingPublicKey = a3;
}

- (__SecKey)signingPublicKey
{
  return self->_signingPublicKey;
}

- (NSArray)appleIDCertificateChain
{
  return self->_appleIDCertificateChain;
}

- (SFAppleIDValidationRecord)appleIDValidationRecord
{
  return self->_appleIDValidationRecord;
}

- (NSArray)signingCertificateChain
{
  return self->_signingCertificateChain;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)validateSigningCertificateChainWithICloudIdentifier:(id *)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v7 = getWFSecurityLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Validating Shortcut Signing Certificate Chain", buf, 0xCu);
  }

  v8 = [(WFShortcutSigningContext *)self signingCertificateChain];
  v9 = objc_msgSend(v8, "if_map:", &__block_literal_global_236);

  SecPolicyRef Revocation = SecPolicyCreateRevocation(3uLL);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = Revocation;
  v11 = (void (**)(void))_Block_copy(aBlock);
  SecTrustRef trust = 0;
  uint64_t v12 = SecTrustCreateWithCertificates(v9, Revocation, &trust);
  if (!v12 || !trust)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke_237;
    v23[3] = &__block_descriptor_40_e5_v8__0l;
    v23[4] = trust;
    v14 = _Block_copy(v23);
    v17 = [v9 objectAtIndexedSubscript:0];

    if (a3)
    {
      *(void *)buf = 0;
      SecCertificateCopyCommonName((SecCertificateRef)v17, (CFStringRef *)buf);
      *a3 = *(id *)buf;
    }
    CFErrorRef v22 = 0;
    if (SecTrustEvaluateWithError(trust, &v22))
    {
      if (SecCertificateCopyExtensionValue())
      {
        v18 = getWFSecurityLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
          _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_DEFAULT, "%s Shortcut Signing Certificate Chain Validated Successfully", buf, 0xCu);
        }
        BOOL v16 = 1;
        goto LABEL_26;
      }
      v18 = WFShortcutSigningContextSigningCertificateChainFailureError(0);
      v20 = getWFSecurityLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
        __int16 v27 = 2112;
        v28 = v18;
        _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s Unrecognized Shortcut Signing Certificate: %@", buf, 0x16u);
      }

      if (a4) {
        goto LABEL_24;
      }
    }
    else
    {
      v18 = WFShortcutSigningContextSigningCertificateChainFailureError(v22);
      v19 = getWFSecurityLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
        __int16 v27 = 2112;
        v28 = v18;
        _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_ERROR, "%s Failed to Evaluate Shortcut Signing Certificate Chain: %@", buf, 0x16u);
      }

      if (a4)
      {
LABEL_24:
        v18 = v18;
        BOOL v16 = 0;
        *a4 = v18;
LABEL_26:

        ((void (*))v14[2].isa)(v14);
        goto LABEL_27;
      }
    }
    BOOL v16 = 0;
    goto LABEL_26;
  }
  v13 = WFErrorFromSecurityOSStatus(v12);
  v14 = WFShortcutSigningContextSigningCertificateChainFailureError(v13);

  if (a4) {
    *a4 = v14;
  }
  v15 = getWFSecurityLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Validating Shortcut Signing Certificate Chain Failed: %@", buf, 0x16u);
  }

  BOOL v16 = 0;
LABEL_27:

  v11[2](v11);
  return v16;
}

void __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke_2(uint64_t a1)
{
}

void __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke_237(uint64_t a1)
{
}

uint64_t __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 certificate];
}

- (void)validateAppleIDValidationRecordWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFSecurityLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Validating AppleID Validation Record", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F9F668]);
  v7 = [v6 myAccountWithError:0];
  v8 = [v7 altDSID];
  v9 = [(WFShortcutSigningContext *)self appleIDValidationRecord];
  v10 = [v9 altDSID];
  int v11 = [v8 isEqualToString:v10];

  if (v11)
  {
    uint64_t v12 = getWFSecurityLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]";
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s Found the current user's AppleID Validation Record", buf, 0xCu);
    }

    (*((void (**)(id, uint64_t, uint64_t, void, void))v4 + 2))(v4, 1, 3, 0, 0);
  }
  else if (+[WFSharingSettings isPrivateSharingEnabled])
  {
    v13 = [(WFShortcutSigningContext *)self appleIDValidationRecord];
    v14 = [v13 validatedEmailHashes];
    v15 = WFCombinedHashStringFromArray(v14);

    BOOL v16 = [(WFShortcutSigningContext *)self appleIDValidationRecord];
    v17 = [v16 validatedPhoneHashes];
    v18 = WFCombinedHashStringFromArray(v17);

    id v19 = objc_alloc_init(MEMORY[0x1E4F9F688]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__WFShortcutSigningContext_validateAppleIDValidationRecordWithCompletion___block_invoke;
    v22[3] = &unk_1E6558C90;
    id v23 = v4;
    [v19 contactIDForEmailHash:v15 phoneHash:v18 completion:v22];
  }
  else
  {
    v20 = getWFSecurityLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]";
      _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_DEFAULT, "%s Skipping AppleID Validation Record due to Private Sharing Disabled", buf, 0xCu);
    }

    v21 = +[WFSharingSettings privateSharingDisabledErrorWithShortcutName:0];
    (*((void (**)(id, void, uint64_t, void, void *))v4 + 2))(v4, 0, 2, 0, v21);
  }
}

void __74__WFShortcutSigningContext_validateAppleIDValidationRecordWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = getWFSecurityLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s Found contact matching with AppleID Validation Record", (uint8_t *)&v11, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    v13[0] = *MEMORY[0x1E4F28568];
    v9 = WFLocalizedString(@"This shortcut cannot be opened because it was shared by someone who is not in your contacts.");
    v13[1] = *MEMORY[0x1E4F28A50];
    v14[0] = v9;
    v14[1] = v5;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v7 = [v8 errorWithDomain:@"WFWorkflowErrorDomain" code:5 userInfo:v10];

    id v6 = getWFSecurityLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s Contact with matching AppleID Validation Record Couldn't be found", (uint8_t *)&v11, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)validateAppleIDCertificatesWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = getWFSecurityLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[WFShortcutSigningContext validateAppleIDCertificatesWithError:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Validating AppleID Certificate Chain", buf, 0xCu);
  }

  id v6 = [(WFShortcutSigningContext *)self appleIDCertificateChain];
  v7 = objc_msgSend(v6, "if_map:", &__block_literal_global_224_72554);

  id v8 = v7;
  SecTrustRef trust = 0;
  CFErrorRef error = 0;
  if (!v8)
  {
    int v14 = 0;
    CFErrorRef v12 = 0;
    LODWORD(v13) = -6705;
    goto LABEL_15;
  }
  AppleIDAuthorityPolicy = (const void *)SecPolicyCreateAppleIDAuthorityPolicy();
  if (AppleIDAuthorityPolicy)
  {
    OSStatus v10 = SecTrustCreateWithCertificates(v8, AppleIDAuthorityPolicy, &trust);
    if (v10)
    {
      OSStatus v26 = v10;
      v24 = getWFSecurityLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "WFAppleIDVerifyCertificateChain";
        __int16 v35 = 1024;
        LODWORD(v36) = v26;
        v25 = "%s Signed Shortcut File Apple Account Certificate Chain Verification: SecTrustCreateWithCertificates failed with error %d";
        __int16 v27 = v24;
        uint32_t v28 = 18;
LABEL_40:
        _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_ERROR, v25, buf, v28);
      }
    }
    else
    {
      if (trust)
      {
        if (SecTrustEvaluateWithError(trust, &error)
          || (CFErrorDomain Domain = CFErrorGetDomain(error), CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E4F28760]))
          && CFErrorGetCode(error) == -67818)
        {
          CFErrorRef v12 = 0;
          LODWORD(v13) = 0;
          int v14 = 1;
        }
        else
        {
          CFErrorRef v12 = error;
          uint64_t v13 = getWFSecurityLogObject();
          if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "WFAppleIDVerifyCertificateChain";
            __int16 v35 = 2112;
            v36 = v12;
            _os_log_impl(&dword_1C7F0A000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "%s Signed Shortcut File Apple Account Certificate Chain Verification: SecTrustEvaluateWithError failed with error %@", buf, 0x16u);
          }

          LODWORD(v13) = NSErrorToOSStatus();
          int v14 = 0;
        }
        goto LABEL_11;
      }
      v24 = getWFSecurityLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "WFAppleIDVerifyCertificateChain";
        v25 = "%s Signed Shortcut File Apple Account Certificate Chain Verification: SecTrustCreateWithCertificates returned NULL trust";
        goto LABEL_39;
      }
    }
  }
  else
  {
    v24 = getWFSecurityLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "WFAppleIDVerifyCertificateChain";
      v25 = "%s Signed Shortcut File Apple Account Certificate Chain Verification: SecPolicyCreateAppleIDAuthorityPolicy failed";
LABEL_39:
      __int16 v27 = v24;
      uint32_t v28 = 12;
      goto LABEL_40;
    }
  }

  int v14 = 0;
  CFErrorRef v12 = 0;
  LODWORD(v13) = -6762;
LABEL_11:
  if (trust) {
    CFRelease(trust);
  }
  if (AppleIDAuthorityPolicy) {
    CFRelease(AppleIDAuthorityPolicy);
  }
LABEL_15:
  if (v13) {
    int v15 = 1;
  }
  else {
    int v15 = v14;
  }
  if (v15) {
    uint64_t v13 = v13;
  }
  else {
    uint64_t v13 = 4294960596;
  }

  if (v13) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v14;
  }
  if (v16)
  {
    v17 = getWFSecurityLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[WFShortcutSigningContext validateAppleIDCertificatesWithError:]";
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_DEFAULT, "%s Shortcut AppleID Certificate Chain Validated Successfully", buf, 0xCu);
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    v31[0] = *MEMORY[0x1E4F28568];
    id v19 = WFLocalizedString(@"Failed to verify Apple Account information of this shortcut");
    v32[0] = v19;
    v31[1] = *MEMORY[0x1E4F28A50];
    v20 = WFErrorFromSecurityOSStatus(v13);
    v32[1] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v17 = [v18 errorWithDomain:@"WFWorkflowErrorDomain" code:5 userInfo:v21];

    CFErrorRef v22 = getWFSecurityLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFShortcutSigningContext validateAppleIDCertificatesWithError:]";
      __int16 v35 = 2112;
      v36 = v17;
      _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to Evaluate AppleID Certificate Chain: %@", buf, 0x16u);
    }

    if (a3)
    {
      v17 = v17;
      *a3 = v17;
    }
  }

  return v16;
}

uint64_t __65__WFShortcutSigningContext_validateAppleIDCertificatesWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 certificate];
}

- (BOOL)validateWithSigningMethod:(int64_t *)a3 iCloudIdentifier:(id *)a4 error:(id *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__72568;
  v42 = __Block_byref_object_dispose__72569;
  id v43 = 0;
  v9 = getWFSecurityLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFShortcutSigningContext validateWithSigningMethod:iCloudIdentifier:error:]";
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Start validating Shortcut Signing Context", (uint8_t *)&buf, 0xCu);
  }

  OSStatus v10 = [(WFShortcutSigningContext *)self appleIDValidationRecord];

  if (v10)
  {
    v45[3] = 2;
    BOOL v11 = [(WFShortcutSigningContext *)self validateAppleIDCertificatesWithError:a5];
    *((unsigned char *)v49 + 24) = v11;
    if (v11)
    {
      CFErrorRef v12 = [(WFShortcutSigningContext *)self appleIDValidationRecord];

      if (v12)
      {
        dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v57 = 0x3032000000;
        v58 = __Block_byref_object_copy__72568;
        v59 = __Block_byref_object_dispose__72569;
        id v60 = 0;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        void v32[2] = __77__WFShortcutSigningContext_validateWithSigningMethod_iCloudIdentifier_error___block_invoke;
        v32[3] = &unk_1E6558C48;
        v34 = &v48;
        p_long long buf = &buf;
        v36 = &v44;
        uint64_t v37 = &v38;
        int v14 = v13;
        v33 = v14;
        [(WFShortcutSigningContext *)self validateAppleIDValidationRecordWithCompletion:v32];
        dispatch_time_t v15 = dispatch_time(0, 30000000000);
        intptr_t v16 = dispatch_semaphore_wait(v14, v15);
        if (*((unsigned char *)v49 + 24)) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        char v18 = v17;
        *((unsigned char *)v49 + 24) = v18;
        if (a5 && (v18 & 1) == 0)
        {
          id v19 = *(void **)(*((void *)&buf + 1) + 40);
          if (v19)
          {
            *a5 = v19;
          }
          else
          {
            v25 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v54 = *MEMORY[0x1E4F28568];
            OSStatus v26 = WFLocalizedString(@"Failed to verify Apple Account information of this shortcut");
            v55 = v26;
            __int16 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
            id v28 = [v25 errorWithDomain:@"WFWorkflowErrorDomain" code:5 userInfo:v27];
            *a5 = v28;
          }
        }

        _Block_object_dispose(&buf, 8);
      }
      else
      {
        *((unsigned char *)v49 + 24) = 0;
        if (a5)
        {
          CFErrorRef v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v52 = *MEMORY[0x1E4F28568];
          id v23 = WFLocalizedString(@"This shortcut file data is corrupted");
          v53 = v23;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          *a5 = [v22 errorWithDomain:@"WFWorkflowErrorDomain" code:5 userInfo:v24];
        }
      }
    }
  }
  else
  {
    v45[3] = 1;
    v20 = (id *)(v39 + 5);
    id obj = (id)v39[5];
    BOOL v21 = [(WFShortcutSigningContext *)self validateSigningCertificateChainWithICloudIdentifier:&obj error:a5];
    objc_storeStrong(v20, obj);
    *((unsigned char *)v49 + 24) = v21;
  }
  if (a3) {
    *a3 = v45[3];
  }
  if (a4) {
    *a4 = (id) v39[5];
  }
  BOOL v29 = *((unsigned char *)v49 + 24) != 0;
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v29;
}

void __77__WFShortcutSigningContext_validateWithSigningMethod_iCloudIdentifier_error___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v15 = a5;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v10 + 24)) {
    char v11 = a2;
  }
  else {
    char v11 = 0;
  }
  *(unsigned char *)(v10 + 24) = v11;
  if ((a2 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  dispatch_semaphore_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
  id v14 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)validateWithSigningMethod:(int64_t *)a3 error:(id *)a4
{
  return [(WFShortcutSigningContext *)self validateWithSigningMethod:a3 iCloudIdentifier:0 error:a4];
}

- (void)validateWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, BOOL, uint64_t, id, id))a3;
  id v5 = getWFSecurityLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    CFErrorRef v22 = "-[WFShortcutSigningContext validateWithCompletion:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Start validating Shortcut Signing Context", buf, 0xCu);
  }

  id v6 = [(WFShortcutSigningContext *)self appleIDCertificateChain];

  if (!v6)
  {
    id v16 = 0;
    id v17 = 0;
    BOOL v7 = [(WFShortcutSigningContext *)self validateSigningCertificateChainWithICloudIdentifier:&v17 error:&v16];
    id v10 = v17;
    id v8 = v16;
    uint64_t v11 = 1;
LABEL_10:
    v4[2](v4, v7, v11, v10, v8);

    goto LABEL_11;
  }
  id v18 = 0;
  BOOL v7 = [(WFShortcutSigningContext *)self validateAppleIDCertificatesWithError:&v18];
  id v8 = v18;
  if (!v7)
  {
    id v10 = 0;
    uint64_t v11 = 2;
    goto LABEL_10;
  }
  id v9 = [(WFShortcutSigningContext *)self appleIDValidationRecord];

  if (!v9)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    dispatch_semaphore_t v13 = WFLocalizedString(@"This shortcut file data is corrupted");
    v20 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v15 = [v12 errorWithDomain:@"WFWorkflowErrorDomain" code:5 userInfo:v14];

    id v10 = 0;
    BOOL v7 = 0;
    uint64_t v11 = 2;
    id v8 = (id)v15;
    goto LABEL_10;
  }
  [(WFShortcutSigningContext *)self validateAppleIDValidationRecordWithCompletion:v4];
LABEL_11:
}

- (__SecKey)copyPublicKey
{
  v3 = [(WFShortcutSigningContext *)self signingCertificateChain];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(WFShortcutSigningContext *)self signingCertificateChain];
    id v6 = [v5 firstObject];
    BOOL v7 = (__SecKey *)[v6 copyPublicKey];

    return v7;
  }
  else
  {
    id v9 = [(WFShortcutSigningContext *)self signingPublicKey];
    return (__SecKey *)CFRetain(v9);
  }
}

- (void)dealloc
{
  signingPublicKey = self->_signingPublicKey;
  if (signingPublicKey) {
    CFRelease(signingPublicKey);
  }
  v4.receiver = self;
  v4.super_class = (Class)WFShortcutSigningContext;
  [(WFShortcutSigningContext *)&v4 dealloc];
}

- (WFShortcutSigningContext)initWithSigningCertificateChain:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFShortcutSigningContext;
  id v5 = [(WFShortcutSigningContext *)&v10 init];
  if (v5 && [v4 count])
  {
    uint64_t v6 = [v4 copy];
    signingCertificateChain = v5->_signingCertificateChain;
    v5->_signingCertificateChain = (NSArray *)v6;

    id v8 = v5;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (WFShortcutSigningContext)initWithAppleIDValidationRecord:(id)a3 appleIDCertificateChain:(id)a4 signingPublicKey:(__SecKey *)a5 signingPublicKeyData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WFShortcutSigningContext;
  id v14 = [(WFShortcutSigningContext *)&v22 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_appleIDValidationRecord, a3);
    uint64_t v16 = [v12 copy];
    appleIDCertificateChain = v15->_appleIDCertificateChain;
    v15->_appleIDCertificateChain = (NSArray *)v16;

    v15->_signingPublicKey = (__SecKey *)CFRetain(a5);
    uint64_t v18 = [v13 copy];
    signingPublicKeySignature = v15->_signingPublicKeySignature;
    v15->_signingPublicKeySignature = (NSData *)v18;

    v20 = v15;
  }

  return v15;
}

- (id)generateAuthData
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WFShortcutSigningContext *)self signingCertificateChain];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v13 = [(WFShortcutSigningContext *)self appleIDValidationRecord];

    if (!v13)
    {
      id v12 = 0;
      goto LABEL_10;
    }
    id v14 = [(WFShortcutSigningContext *)self appleIDCertificateChain];
    uint64_t v6 = objc_msgSend(v14, "if_compactMap:", &__block_literal_global_175_72585);

    uint64_t v15 = [v6 count];
    uint64_t v16 = [(WFShortcutSigningContext *)self appleIDCertificateChain];
    uint64_t v17 = [v16 count];

    if (v15 == v17)
    {
      id v11 = SecKeyCopyExternalRepresentation([(WFShortcutSigningContext *)self signingPublicKey], 0);
      uint64_t v18 = (void *)MEMORY[0x1E4F1CA60];
      v25[0] = @"AppleIDCertificateChain";
      v25[1] = @"SigningPublicKey";
      v26[0] = v6;
      v26[1] = v11;
      v25[2] = @"SigningPublicKeySignature";
      uint64_t v19 = [(WFShortcutSigningContext *)self signingPublicKeySignature];
      v26[2] = v19;
      v25[3] = @"AppleIDValidationRecord";
      v20 = [(WFShortcutSigningContext *)self appleIDValidationRecord];
      BOOL v21 = [v20 data];
      v26[3] = v21;
      objc_super v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
      id v12 = [v18 dictionaryWithDictionary:v22];

      goto LABEL_7;
    }
LABEL_8:

    uint64_t v23 = 0;
    goto LABEL_11;
  }
  id v5 = [(WFShortcutSigningContext *)self signingCertificateChain];
  uint64_t v6 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_72583);

  uint64_t v7 = [v6 count];
  id v8 = [(WFShortcutSigningContext *)self signingCertificateChain];
  uint64_t v9 = [v8 count];

  if (v7 != v9) {
    goto LABEL_8;
  }
  objc_super v10 = (void *)MEMORY[0x1E4F1CA60];
  __int16 v27 = @"SigningCertificateChain";
  v28[0] = v6;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  id v12 = [v10 dictionaryWithDictionary:v11];
LABEL_7:

LABEL_10:
  uint64_t v23 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v12 format:200 options:0 error:0];

LABEL_11:
  return v23;
}

uint64_t __44__WFShortcutSigningContext_generateAuthData__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 generateAuthData];
}

uint64_t __44__WFShortcutSigningContext_generateAuthData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 generateAuthData];
}

+ (id)contextWithSigningCertificateChain:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithSigningCertificateChain:v4];

  return v5;
}

+ (id)contextWithAppleIDAccount:(id)a3 signingKey:(__SecKey *)a4
{
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 identity];
  if (v7)
  {
    id v8 = [v6 identity];
    uint64_t v9 = [v8 copyCertificate];

    objc_super v10 = [v6 identity];
    uint64_t v11 = [v10 copyIntermediateCertificate];

    id v12 = 0;
    if (v9 && v11)
    {
      v25 = [[WFShortcutSigningCertificate alloc] initWithCertificate:v9];
      id v13 = [[WFShortcutSigningCertificate alloc] initWithCertificate:v11];
      uint64_t v14 = [v7 copyPrivateKey];
      if (v14)
      {
        uint64_t v15 = (__SecKey *)v14;
        uint64_t v16 = SecKeyCopyPublicKey(a4);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __65__WFShortcutSigningContext_contextWithAppleIDAccount_signingKey___block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = v16;
        uint64_t v17 = (void (**)(void))_Block_copy(aBlock);
        CFDataRef v18 = SecKeyCopyExternalRepresentation(v16, 0);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __65__WFShortcutSigningContext_contextWithAppleIDAccount_signingKey___block_invoke_2;
        v26[3] = &__block_descriptor_40_e5_v8__0l;
        void v26[4] = v18;
        uint64_t v19 = (void (**)(void))_Block_copy(v26);
        CFDataRef Signature = SecKeyCreateSignature(v15, (SecKeyAlgorithm)*MEMORY[0x1E4F3BB00], v18, 0);
        v28[0] = v25;
        v28[1] = v13;
        BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
        id v22 = objc_alloc((Class)a1);
        uint64_t v23 = [v6 validationRecord];
        id v12 = (void *)[v22 initWithAppleIDValidationRecord:v23 appleIDCertificateChain:v21 signingPublicKey:v16 signingPublicKeyData:Signature];

        v19[2](v19);
        v17[2](v17);
      }
      else
      {
        id v12 = 0;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __65__WFShortcutSigningContext_contextWithAppleIDAccount_signingKey___block_invoke(uint64_t a1)
{
}

void __65__WFShortcutSigningContext_contextWithAppleIDAccount_signingKey___block_invoke_2(uint64_t a1)
{
}

+ (id)contextWithAuthData:(id)a3
{
  v73[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    a1 = 0;
    goto LABEL_22;
  }
  id v6 = [v5 objectForKeyedSubscript:@"SigningCertificateChain"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_180_72612);
      uint64_t v8 = [v7 count];
      if (v8 == [v6 count])
      {
        a1 = [a1 contextWithSigningCertificateChain:v7];
      }
      else
      {
        a1 = 0;
      }

      goto LABEL_21;
    }
  }

  uint64_t v9 = [v5 objectForKeyedSubscript:@"AppleIDCertificateChain"];

  if (v9)
  {
    objc_super v10 = [v5 objectForKeyedSubscript:@"AppleIDCertificateChain"];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = objc_msgSend(v10, "if_compactMap:", &__block_literal_global_183_72613);
        uint64_t v12 = [v11 count];
        if (v12 == [v10 count])
        {
          id v13 = [v5 objectForKeyedSubscript:@"SigningPublicKey"];
          if (v13)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v14 = v13;
            }
            else {
              uint64_t v14 = 0;
            }
          }
          else
          {
            uint64_t v14 = 0;
          }
          CFDataRef v16 = v14;

          uint64_t v17 = [v5 objectForKeyedSubscript:@"SigningPublicKeySignature"];
          if (v17)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              CFDataRef v18 = v17;
            }
            else {
              CFDataRef v18 = 0;
            }
          }
          else
          {
            CFDataRef v18 = 0;
          }
          CFDataRef signature = v18;

          uint64_t v19 = [v11 firstObject];
          v20 = (__SecKey *)[v19 copyPublicKey];

          uint64_t v21 = *MEMORY[0x1E4F3B740];
          uint64_t v22 = *MEMORY[0x1E4F3B6D8];
          v72[0] = *MEMORY[0x1E4F3B718];
          v72[1] = v22;
          uint64_t v23 = *MEMORY[0x1E4F3B6F0];
          v73[0] = v21;
          v73[1] = v23;
          CFDictionaryRef v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
          SecKeyRef v55 = SecKeyCreateWithData(v16, v24, 0);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __48__WFShortcutSigningContext_contextWithAuthData___block_invoke_3;
          aBlock[3] = &__block_descriptor_40_e5_v8__0l;
          aBlock[4] = v55;
          v25 = (void (**)(void))_Block_copy(aBlock);
          if (!SecKeyVerifySignature(v20, (SecKeyAlgorithm)*MEMORY[0x1E4F3BB00], v16, signature, 0))
          {
            char v36 = 0;
            a1 = 0;
            goto LABEL_58;
          }
          OSStatus v26 = [v5 objectForKeyedSubscript:@"AppleIDValidationRecord"];

          if (!v26)
          {
            char v36 = 1;
            goto LABEL_58;
          }
          uint64_t v27 = [v5 objectForKeyedSubscript:@"AppleIDValidationRecord"];
          id v28 = (void *)v27;
          if (v27)
          {
            CFDataRef v52 = v16;
            CFDictionaryRef v53 = v24;
            BOOL v29 = (void *)v27;
            uint64_t v65 = 0;
            v66 = &v65;
            uint64_t v67 = 0x3032000000;
            v68 = __Block_byref_object_copy__72568;
            v69 = __Block_byref_object_dispose__72569;
            id v70 = 0;
            uint64_t v61 = 0;
            v62 = &v61;
            uint64_t v63 = 0x2020000000;
            int v64 = 1;
            v49 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
            dispatch_queue_t v30 = dispatch_queue_create("SFAppleIDQueue", v49);
            dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __48__WFShortcutSigningContext_contextWithAuthData___block_invoke_187;
            v57[3] = &unk_1E6558C18;
            v59 = &v65;
            id v60 = &v61;
            v32 = v31;
            v58 = v32;
            uint64_t v48 = v29;
            dispatch_queue_t v50 = v30;
            WFAppleIDParseValidationRecordData(v29, v30, v57);
            dispatch_time_t v33 = dispatch_time(0, 30000000000);
            char v51 = v32;
            intptr_t v34 = dispatch_semaphore_wait(v32, v33);
            char v35 = 0;
            uint64_t v54 = 0;
            CFDataRef v16 = v52;
            CFDictionaryRef v24 = v53;
            if (v66[5] && !v34)
            {
              if (*((_DWORD *)v62 + 6))
              {
                uint64_t v54 = 0;
                char v35 = 0;
              }
              else
              {
                id v37 = objc_alloc(MEMORY[0x1E4F9F670]);
                uint64_t v54 = (void *)[v37 initWithDictionary:v66[5]];
                uint64_t v38 = [(id)v66[5] objectForKeyedSubscript:@"altDsID"];
                [v54 setAltDSID:v38];

                v39 = [(id)v66[5] objectForKeyedSubscript:@"SuggestValidDuration"];
                if (v39)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    uint64_t v40 = v39;
                  }
                  else {
                    uint64_t v40 = 0;
                  }
                }
                else
                {
                  uint64_t v40 = 0;
                }
                id v41 = v40;

                objc_msgSend(v54, "setSuggestedValidDuration:", objc_msgSend(v41, "unsignedIntValue"));
                v42 = [(id)v66[5] objectForKeyedSubscript:@"ValidatedEmailHashes"];
                if ([v42 count]) {
                  id v43 = v42;
                }
                else {
                  id v43 = 0;
                }
                [v54 setValidatedEmailHashes:v43];
                uint64_t v46 = [(id)v66[5] objectForKeyedSubscript:@"ValidatedPhoneHashes"];

                if ([v46 count]) {
                  uint64_t v44 = v46;
                }
                else {
                  uint64_t v44 = 0;
                }
                objc_msgSend(v54, "setValidatedPhoneHashes:", v44, v46);
                v45 = [(id)v66[5] objectForKeyedSubscript:@"ValidAsOf"];
                [v54 setValidStartDate:v45];

                char v35 = 1;
              }
            }

            _Block_object_dispose(&v61, 8);
            _Block_object_dispose(&v65, 8);

            if ((v35 & 1) == 0)
            {
              a1 = 0;
              id v28 = v48;
              goto LABEL_57;
            }
            id v28 = v48;
          }
          else
          {
            uint64_t v54 = 0;
          }
          a1 = (id)[objc_alloc((Class)a1) initWithAppleIDValidationRecord:v54 appleIDCertificateChain:v11 signingPublicKey:v55 signingPublicKeyData:signature];
LABEL_57:

          char v36 = 0;
LABEL_58:
          v25[2](v25);

          if ((v36 & 1) == 0) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
      }
    }
  }
LABEL_20:
  a1 = 0;
LABEL_21:

LABEL_22:
  return a1;
}

void __48__WFShortcutSigningContext_contextWithAuthData___block_invoke_3(uint64_t a1)
{
}

void __48__WFShortcutSigningContext_contextWithAuthData___block_invoke_187(uint64_t a1, void *a2, int a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

WFShortcutSigningCertificate *__48__WFShortcutSigningContext_contextWithAuthData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFShortcutSigningCertificate alloc] initWithCertificateData:v2];

  return v3;
}

WFShortcutSigningCertificate *__48__WFShortcutSigningContext_contextWithAuthData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFShortcutSigningCertificate alloc] initWithCertificateData:v2];

  return v3;
}

@end