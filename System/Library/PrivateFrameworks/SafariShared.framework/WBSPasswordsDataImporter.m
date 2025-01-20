@interface WBSPasswordsDataImporter
+ (int64_t)importCredential:(id)a3;
+ (int64_t)importCredential:(id)a3 savedAccountStore:(id)a4;
- (id)_remoteObjectProxyAndSandboxExtensionForFileURL:(id)a3;
- (void)computeNumberOfCredentialsToBeImportedFromCSVWithFileURL:(id)a3 completionHandler:(id)a4;
- (void)fetchLooksLikePasswordsCSVFile:(id)a3 completionHandler:(id)a4;
- (void)importFromCSVWithFileURL:(id)a3 progressHandler:(id)a4;
@end

@implementation WBSPasswordsDataImporter

- (id)_remoteObjectProxyAndSandboxExtensionForFileURL:(id)a3
{
  id v4 = a3;
  v5 = +[WBSCredentialExtractionHelperConnectionManager sharedManager];
  v6 = [v5 credentialExtractionHelperConnectionRequestedByClient:self];
  connectionToCredentialExtractionService = self->_connectionToCredentialExtractionService;
  self->_connectionToCredentialExtractionService = v6;

  id v8 = v4;
  [v8 fileSystemRepresentation];
  v9 = (const char *)sandbox_extension_issue_file();
  if (v9)
  {
    v10 = (void *)[[NSString alloc] initWithBytesNoCopy:v9 length:strlen(v9) encoding:4 freeWhenDone:1];
    v11 = [(NSXPCConnection *)self->_connectionToCredentialExtractionService remoteObjectProxyWithErrorHandler:&__block_literal_global_46];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F97EE0]) initWithFirst:v11 second:v10];
  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordsDataImporter _remoteObjectProxyAndSandboxExtensionForFileURL:]((uint64_t)v8, v13);
    }
    v12 = 0;
  }

  return v12;
}

void __76__WBSPasswordsDataImporter__remoteObjectProxyAndSandboxExtensionForFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__WBSPasswordsDataImporter__remoteObjectProxyAndSandboxExtensionForFileURL___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)fetchLooksLikePasswordsCSVFile:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSPasswordsDataImporter *)self _remoteObjectProxyAndSandboxExtensionForFileURL:v6];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 first];
    v11 = [v9 second];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__WBSPasswordsDataImporter_fetchLooksLikePasswordsCSVFile_completionHandler___block_invoke;
    v12[3] = &unk_1E5C9AD50;
    id v13 = v7;
    [v10 fetchLooksLikePasswordsCSVFile:v6 sandboxExtension:v11 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

uint64_t __77__WBSPasswordsDataImporter_fetchLooksLikePasswordsCSVFile_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)computeNumberOfCredentialsToBeImportedFromCSVWithFileURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSPasswordsDataImporter *)self _remoteObjectProxyAndSandboxExtensionForFileURL:v6];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 first];
    v11 = [v9 second];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __103__WBSPasswordsDataImporter_computeNumberOfCredentialsToBeImportedFromCSVWithFileURL_completionHandler___block_invoke;
    v12[3] = &unk_1E5C9AD78;
    id v13 = v7;
    [v10 fetchExtractedCredentialsFromCSVFile:v6 sandboxExtension:v11 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __103__WBSPasswordsDataImporter_computeNumberOfCredentialsToBeImportedFromCSVWithFileURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 count], v5);
}

- (void)importFromCSVWithFileURL:(id)a3 progressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x5812000000;
  v24 = __Block_byref_object_copy__11;
  v25 = __Block_byref_object_dispose__11;
  v26 = "\"1";
  long long v27 = 0u;
  long long v28 = 0u;
  id v29 = 0;
  *((void *)&v28 + 1) = [MEMORY[0x1E4F1CA48] array];
  id v29 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(WBSPasswordsDataImporter *)self _remoteObjectProxyAndSandboxExtensionForFileURL:v6];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 first];
    v11 = [v9 second];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__WBSPasswordsDataImporter_importFromCSVWithFileURL_progressHandler___block_invoke;
    v14[3] = &unk_1E5C9ADA0;
    id v15 = v7;
    v16 = &v21;
    [v10 fetchExtractedCredentialsFromCSVFile:v6 sandboxExtension:v11 completionHandler:v14];
  }
  else
  {
    v12 = v22;
    long long v17 = *((_OWORD *)v22 + 3);
    id v13 = (void *)v22[9];
    uint64_t v18 = v22[8];
    id v19 = v13;
    id v20 = (id)v12[10];
    (*((void (**)(id, uint64_t, long long *, void))v7 + 2))(v7, 2, &v17, 0);
  }

  _Block_object_dispose(&v21, 8);
}

void __69__WBSPasswordsDataImporter_importFromCSVWithFileURL_progressHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v33 = *(_OWORD *)(v8 + 48);
    v9 = *(void **)(v8 + 72);
    uint64_t v34 = *(void *)(v8 + 64);
    id v35 = v9;
    id v36 = *(id *)(v8 + 80);
    (*(void (**)(uint64_t, uint64_t, long long *, uint64_t))(v7 + 16))(v7, 2, &v33, a3);
    goto LABEL_16;
  }
  uint64_t v10 = [v5 count];
  uint64_t v11 = a1 + 40;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = v10;
  if (v10 >= 1)
  {
    uint64_t v12 = v10;
    uint64_t v13 = 0;
    float v14 = (float)v10;
    do
    {
      id v15 = [v6 objectAtIndexedSubscript:v13];
      int64_t v16 = +[WBSPasswordsDataImporter importCredential:v15];
      switch(v16)
      {
        case 2:
          ++*(void *)(*(void *)(*(void *)v11 + 8) + 64);
          break;
        case 1:
          long long v17 = *(void **)(*(void *)(*(void *)v11 + 8) + 80);
          goto LABEL_11;
        case 0:
          long long v17 = *(void **)(*(void *)(*(void *)v11 + 8) + 72);
LABEL_11:
          [v17 addObject:v15];
          break;
      }
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = (float)((float)v13 / v14);
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v29 = *(_OWORD *)(v19 + 48);
      id v20 = *(void **)(v19 + 72);
      uint64_t v30 = *(void *)(v19 + 64);
      id v31 = v20;
      id v32 = *(id *)(v19 + 80);
      (*(void (**)(uint64_t, uint64_t, long long *, void))(v18 + 16))(v18, 1, &v29, 0);

      ++v13;
    }
    while (v12 != v13);
  }
  uint64_t v21 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    __69__WBSPasswordsDataImporter_importFromCSVWithFileURL_progressHandler___block_invoke_cold_1(v21, v6, a1 + 40);
  }
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v25 = *(_OWORD *)(v23 + 48);
  v24 = *(void **)(v23 + 72);
  uint64_t v26 = *(void *)(v23 + 64);
  id v27 = v24;
  id v28 = *(id *)(v23 + 80);
  (*(void (**)(uint64_t, uint64_t, long long *, void))(v22 + 16))(v22, 3, &v25, 0);
LABEL_16:
}

+ (int64_t)importCredential:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F97FD0];
  id v5 = a3;
  id v6 = [v4 sharedStore];
  int64_t v7 = [a1 importCredential:v5 savedAccountStore:v6];

  return v7;
}

+ (int64_t)importCredential:(id)a3 savedAccountStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = [v5 title];
  if (v7)
  {

    goto LABEL_4;
  }
  uint64_t v8 = [v5 url];

  if (v8)
  {
LABEL_4:
    v9 = [v5 url];
    if (v9)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F18D98];
      uint64_t v11 = [v5 url];
      uint64_t v12 = objc_msgSend(v10, "safari_HTMLFormProtectionSpaceForURL:", v11);
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F97FD0] protectionSpaceForNewStandalonePassword];
    }

    uint64_t v13 = [v5 urlCredentialWithPersistence:3];
    if (!v13)
    {
      uint64_t v13 = [v5 encryptedURLCredentialWithPersistence:3];
      if (!v13)
      {
LABEL_41:
        int64_t v39 = 0;
        goto LABEL_66;
      }
    }
    float v14 = [v5 url];

    id v15 = objc_alloc(MEMORY[0x1E4F97FF0]);
    int64_t v16 = [v13 user];
    long long v17 = (void *)[v15 initWithString:v16 matchingType:1];

    id v18 = objc_alloc(MEMORY[0x1E4F97FC8]);
    uint64_t v19 = v18;
    if (!v14)
    {
      long long v29 = (void *)[v18 initWithURL:0 options:64 userNameQuery:v17 passkeyCredentialIdentifier:0 associatedDomainsManager:0 webFrameIdentifier:0];
      id v30 = objc_alloc(MEMORY[0x1E4F97FF0]);
      id v31 = [v5 title];
      id v32 = (void *)[v30 initWithString:v31 matchingType:1];
      [v29 setTitleQuery:v32];

      uint64_t v90 = 0;
      v91 = &v90;
      uint64_t v92 = 0x3032000000;
      v93 = __Block_byref_object_copy__11;
      v94 = __Block_byref_object_dispose__12;
      id v95 = 0;
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __63__WBSPasswordsDataImporter_importCredential_savedAccountStore___block_invoke_3;
      v88[3] = &unk_1E5C9ADC8;
      v88[4] = &v90;
      [v6 getSavedAccountsMatchingCriteria:v29 withSynchronousCompletionHandler:v88];
      long long v33 = [(id)v91[5] exactMatches];
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __63__WBSPasswordsDataImporter_importCredential_savedAccountStore___block_invoke_4;
      v86[3] = &unk_1E5C9AE10;
      id v87 = v5;
      uint64_t v34 = objc_msgSend(v33, "safari_mapAndFilterObjectsUsingBlock:", v86);
      id v35 = [v34 firstObject];

      _Block_object_dispose(&v90, 8);
      if (v35) {
        goto LABEL_50;
      }
LABEL_18:
      [v6 removeDontSaveMarkerForProtectionSpace:v12];
      if ([v12 port])
      {
        id v36 = NSString;
        v37 = [v12 host];
        v38 = [v36 stringWithFormat:@"%@:%ld", v37, objc_msgSend(v12, "port")];
      }
      else
      {
        v38 = [v12 host];
      }
      v43 = [v13 user];
      v44 = [v13 password];
      v45 = [v6 saveUser:v43 password:v44 forUserTypedSite:v38 customTitle:0 notesEntry:0 groupID:0];

      if (v45) {
        goto LABEL_26;
      }
      goto LABEL_41;
    }
    v84 = v13;
    id v20 = [v5 url];
    uint64_t v21 = (void *)[v19 initWithURL:v20 options:16 userNameQuery:v17 passkeyCredentialIdentifier:0 associatedDomainsManager:0 webFrameIdentifier:0];

    uint64_t v90 = 0;
    v91 = &v90;
    uint64_t v92 = 0x3032000000;
    v93 = __Block_byref_object_copy__11;
    v94 = __Block_byref_object_dispose__12;
    id v95 = 0;
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __63__WBSPasswordsDataImporter_importCredential_savedAccountStore___block_invoke;
    v89[3] = &unk_1E5C9ADC8;
    v89[4] = &v90;
    id v22 = v6;
    [v6 getSavedAccountsMatchingCriteria:v21 withSynchronousCompletionHandler:v89];
    uint64_t v23 = v12;
    v24 = [(id)v91[5] exactMatches];
    long long v25 = objc_msgSend(v24, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_16);
    uint64_t v26 = [v25 firstObject];

    if (v26 && ([v26 credentialTypes] & 1) != 0)
    {
      v40 = [v26 password];
      v41 = [v5 password];
      char v42 = [v40 isEqualToString:v41];

      int v27 = 0;
      if ((v42 & 1) == 0)
      {
        int v28 = 1;
        goto LABEL_14;
      }
    }
    else
    {
      int v27 = 1;
    }
    int v28 = v27;
    LOBYTE(v27) = 1;
LABEL_14:
    uint64_t v12 = v23;

    _Block_object_dispose(&v90, 8);
    id v6 = v22;
    if ((v27 & 1) == 0)
    {
      int64_t v39 = 1;
      uint64_t v13 = v84;
LABEL_66:

      goto LABEL_67;
    }
    uint64_t v13 = v84;
    if (!v28)
    {
LABEL_26:
      uint64_t v46 = [v5 otpAuthURL];

      v47 = [v5 notesEntry];
      uint64_t v48 = [v47 length];

      BOOL v49 = (v48 | v46) != 0;
      v50 = [v5 title];
      uint64_t v51 = [v50 length];

      if (v51)
      {
        uint64_t v80 = v48;
        v83 = v12;
        id v85 = v6;
        v52 = [v5 url];
        v53 = [v52 host];
        v54 = objc_msgSend(v53, "safari_highLevelDomainFromHost");
        v55 = [v5 user];
        v56 = [MEMORY[0x1E4F1CA48] array];
        v57 = v56;
        if (v54) {
          [v56 addObject:v54];
        }
        if (v55) {
          [v57 addObject:v55];
        }
        if ([v54 length] && objc_msgSend(v55, "length"))
        {
          v58 = (void *)[[NSString alloc] initWithFormat:@"%@ (%@)", v54, v55];
          [v57 addObject:v58];
        }
        uint64_t v82 = v46;
        if ([v53 length] && objc_msgSend(v55, "length"))
        {
          v59 = (void *)[[NSString alloc] initWithFormat:@"%@ (%@)", v53, v55];
          [v57 addObject:v59];
        }
        BOOL v60 = v49;
        v81 = v52;
        v61 = [v52 absoluteString];
        if (v61) {
          [v57 addObject:v61];
        }
        uint64_t v62 = [v5 title];
        int v63 = [v57 containsObject:v62] ^ 1;

        int v79 = v63;
        LOBYTE(v62) = v63 | v60;

        uint64_t v12 = v83;
        id v6 = v85;
        uint64_t v46 = v82;
        if ((v62 & 1) == 0) {
          goto LABEL_50;
        }
LABEL_44:
        v64 = [v6 savedAccountWithAllMetadataForURLCredential:v13 protectionSpace:v12];
        if (!v64)
        {
          v64 = [v6 savedAccountForURLCredential:v13 protectionSpace:v12];
        }
        if (v46)
        {
          id v65 = objc_alloc(MEMORY[0x1E4F97FF8]);
          v66 = [v5 otpAuthURL];
          v67 = (void *)[v65 initWithOTPAuthURL:v66];

          v68 = [v64 totpGenerators];
          v69 = [v68 firstObject];

          if (v69)
          {
            if (([v69 generatesIdenticalCodesToGenerator:v67] & 1) == 0)
            {

LABEL_62:
              int64_t v39 = 1;
LABEL_65:

              goto LABEL_66;
            }
          }
          else if (v67)
          {
            [v6 saveTOTPGenerator:v67 forSavedAccount:v64];
          }
        }
        if (v80)
        {
          v70 = [v5 notesEntry];
          v71 = [v64 notesEntry];
          if (v71)
          {
            v72 = v71;
            int v73 = [v71 isEqualToString:v70];

            if (!v73) {
              goto LABEL_62;
            }
          }
          else
          {
            v74 = [v5 notesEntry];
            [v6 saveNotesEntry:v74 forSavedAccount:v64];
          }
        }
        if (v79)
        {
          v75 = [v5 title];
          v76 = [v64 customTitle];
          if ([v76 length])
          {
            int v77 = [v76 isEqualToString:v75];

            if (!v77) {
              goto LABEL_62;
            }
          }
          else
          {
            [v6 saveCustomTitle:v75 forSavedAccount:v64];
          }
        }
        int64_t v39 = 2;
        goto LABEL_65;
      }
      if (v48 | v46)
      {
        uint64_t v80 = v48;
        int v79 = 0;
        goto LABEL_44;
      }
LABEL_50:
      int64_t v39 = 2;
      goto LABEL_66;
    }
    goto LABEL_18;
  }
  int64_t v39 = 0;
LABEL_67:

  return v39;
}

void __63__WBSPasswordsDataImporter_importCredential_savedAccountStore___block_invoke(uint64_t a1, void *a2)
{
}

id __63__WBSPasswordsDataImporter_importCredential_savedAccountStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 savedAccount];
  if ([v2 isSavedInPersonalKeychain]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void __63__WBSPasswordsDataImporter_importCredential_savedAccountStore___block_invoke_3(uint64_t a1, void *a2)
{
}

id __63__WBSPasswordsDataImporter_importCredential_savedAccountStore___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 savedAccount];
  if (![v3 isSavedInPersonalKeychain]) {
    goto LABEL_6;
  }
  uint64_t v4 = [*(id *)(a1 + 32) password];
  id v5 = [v3 password];
  int v6 = WBSIsEqual();

  if (!v6) {
    goto LABEL_6;
  }
  int64_t v7 = [*(id *)(a1 + 32) notesEntry];
  uint64_t v8 = [v3 notesEntry];
  int v9 = WBSIsEqual();

  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = [*(id *)(a1 + 32) otpAuthURL];
  uint64_t v11 = [v3 totpGenerators];
  uint64_t v12 = [v11 firstObject];
  uint64_t v13 = [v12 originalURL];
  int v14 = WBSIsEqual();

  if (v14) {
    id v15 = v3;
  }
  else {
LABEL_6:
  }
    id v15 = 0;

  return v15;
}

- (void).cxx_destruct
{
}

- (void)_remoteObjectProxyAndSandboxExtensionForFileURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Could not create sandbox extension for file URL %@.", (uint8_t *)&v2, 0xCu);
}

void __76__WBSPasswordsDataImporter__remoteObjectProxyAndSandboxExtensionForFileURL___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to get remote object proxy for CredentialExtractionHelper with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __69__WBSPasswordsDataImporter_importFromCSVWithFileURL_progressHandler___block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v6 = [a2 count];
  uint64_t v7 = *(void *)(*(void *)a3 + 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = [*(id *)(v7 + 80) count];
  uint64_t v10 = [*(id *)(*(void *)(*(void *)a3 + 8) + 72) count];
  int v11 = 134218752;
  uint64_t v12 = v6;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  __int16 v15 = 2048;
  uint64_t v16 = v9;
  __int16 v17 = 2048;
  uint64_t v18 = v10;
  _os_log_debug_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEBUG, "Parsed %lu credentials from CSV file. Imported %lu into keychain, while ignoring %lu conflicting credentials and %lu credentials with errors.", (uint8_t *)&v11, 0x2Au);
}

@end