@interface SYDocumentWorkflowsServiceHandle
- (SYDocumentWorkflowsRepository)repository;
- (SYDocumentWorkflowsServiceHandle)initWithRepository:(id)a3;
- (id)_createOpenLastModifiedDocumentImpl;
- (id)_fallbackUserActivityForDocumentWithAttributes:(id)a3;
- (id)_fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4;
- (void)fetchAttributesForDocumentsWithIndexKeys:(id)a3 completion:(id)a4;
- (void)fetchUserActivityForDocumentIndexKey:(id)a3 completion:(id)a4;
- (void)hasLastModifiedDocument:(id)a3 completion:(id)a4;
- (void)hasOriginalDocumentForFileAtURL:(id)a3 withAttributes:(id)a4 completion:(id)a5;
- (void)openLastModifiedDocument:(id)a3 completion:(id)a4;
- (void)returnToSenderDocument:(id)a3 withAttributes:(id)a4 shouldCreateNewMessage:(BOOL)a5 completion:(id)a6;
- (void)saveUserActivity:(id)a3 forDocumentIndexKey:(id)a4 sourceBundleIdentifier:(id)a5 completion:(id)a6;
- (void)unlinkDocumentsWithRelatedUniqueIdentifiers:(id)a3 completion:(id)a4;
- (void)updateLinkedDocumentsWithCompletion:(id)a3;
@end

@implementation SYDocumentWorkflowsServiceHandle

- (SYDocumentWorkflowsServiceHandle)initWithRepository:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYDocumentWorkflowsServiceHandle;
  v6 = [(SYDocumentWorkflowsServiceHandle *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_repository, a3);
  }

  return v7;
}

- (void)fetchAttributesForDocumentsWithIndexKeys:(id)a3 completion:(id)a4
{
}

- (void)fetchUserActivityForDocumentIndexKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__SYDocumentWorkflowsServiceHandle_fetchUserActivityForDocumentIndexKey_completion___block_invoke;
  v15[3] = &unk_1E6464108;
  id v8 = v7;
  id v16 = v8;
  objc_super v9 = (void (**)(void, void, void))MEMORY[0x1C8769940](v15);
  id v14 = 0;
  v10 = [(SYDocumentWorkflowsServiceHandle *)self _fetchUserActivityWithRelatedUniqueIdentifier:v6 error:&v14];
  id v11 = v14;
  if (v10)
  {
    v12 = [[SYUserActivityWrapper alloc] initWithUserActivity:v10];
    ((void (**)(void, SYUserActivityWrapper *, void))v9)[2](v9, v12, 0);
  }
  else
  {
    v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SYDocumentWorkflowsServiceHandle fetchUserActivityForDocumentIndexKey:completion:]((uint64_t)v6);
    }

    ((void (**)(void, void, id))v9)[2](v9, 0, v11);
  }
}

uint64_t __84__SYDocumentWorkflowsServiceHandle_fetchUserActivityForDocumentIndexKey_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4
{
  return [(SYDocumentWorkflowsRepository *)self->_repository fetchUserActivityWithRelatedUniqueIdentifier:a3 error:a4];
}

- (void)saveUserActivity:(id)a3 forDocumentIndexKey:(id)a4 sourceBundleIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__SYDocumentWorkflowsServiceHandle_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke;
  v22[3] = &unk_1E6463968;
  id v12 = v11;
  id v23 = v12;
  id v13 = a5;
  id v14 = a3;
  v15 = (void (**)(void, void, void))MEMORY[0x1C8769940](v22);
  repository = self->_repository;
  v17 = [v14 userActivity];

  id v21 = 0;
  uint64_t v18 = [(SYDocumentWorkflowsRepository *)repository saveUserActivity:v17 forRelatedUniqueIdentifier:v10 sourceBundleIdentifier:v13 error:&v21];

  id v19 = v21;
  if ((v18 & 1) == 0)
  {
    v20 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SYDocumentWorkflowsServiceHandle saveUserActivity:forDocumentIndexKey:sourceBundleIdentifier:completion:]((uint64_t)v10);
    }
  }
  ((void (**)(void, uint64_t, id))v15)[2](v15, v18, v19);
}

uint64_t __107__SYDocumentWorkflowsServiceHandle_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)returnToSenderDocument:(id)a3 withAttributes:(id)a4 shouldCreateNewMessage:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  v55[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke;
  v46[3] = &unk_1E6463968;
  id v13 = v12;
  id v47 = v13;
  id v14 = (void (**)(void, void, void))MEMORY[0x1C8769940](v46);
  v15 = [v11 sourceBundleIdentifier];
  if ([v15 length])
  {
    id v45 = 0;
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v15 allowPlaceholder:1 error:&v45];
    id v17 = v45;
    uint64_t v18 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    id v19 = v18;
    if (!v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SYDocumentWorkflowsServiceHandle returnToSenderDocument:withAttributes:shouldCreateNewMessage:completion:]((uint64_t)v15);
      }

      ((void (**)(void, void, id))v14)[2](v14, 0, v17);
      goto LABEL_26;
    }
    BOOL v37 = v7;
    id v39 = v10;
    v20 = v18;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [v11 sender];
      *(_DWORD *)buf = 138412802;
      v49 = v15;
      __int16 v50 = 2112;
      v51 = v39;
      __int16 v52 = 2112;
      v53 = v21;
      _os_log_impl(&dword_1C2C5F000, v20, OS_LOG_TYPE_INFO, "Found record for bundle identifier: %@, to return document: %@, to sender: %@", buf, 0x20u);
    }
    v22 = [v11 indexKey];
    id v44 = 0;
    id v23 = [(SYDocumentWorkflowsServiceHandle *)self _fetchUserActivityWithRelatedUniqueIdentifier:v22 error:&v44];
    id v24 = v44;

    v38 = v24;
    if (v23 || !v24)
    {
      id v10 = v39;
      if (v23)
      {
        id v28 = v23;
        goto LABEL_17;
      }
    }
    else
    {
      v25 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      id v10 = v39;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[SYDocumentWorkflowsServiceHandle returnToSenderDocument:withAttributes:shouldCreateNewMessage:completion:](v11, (uint64_t)v38, v25);
      }
    }
    id v28 = [(SYDocumentWorkflowsServiceHandle *)self _fallbackUserActivityForDocumentWithAttributes:v11];
    if (!v28)
    {
      v34 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SYDocumentWorkflowsServiceHandle returnToSenderDocument:withAttributes:shouldCreateNewMessage:completion:](v11, v34);
      }

      v35 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10;
      v42[3] = &unk_1E64641F8;
      v42[4] = v15;
      v43 = v14;
      [v35 openApplicationWithBundleIdentifier:v15 configuration:0 completionHandler:v42];

      goto LABEL_25;
    }
LABEL_17:
    v36 = v23;
    v29 = [MEMORY[0x1E4F22488] _syReturnToSenderActivityWithOriginalUserActivity:v28];
    v30 = v29;
    if (v10) {
      -[NSUserActivity set_syDocument:](v29, v10);
    }
    objc_msgSend(v30, "set_syShouldCreateNewMessage:", v37);
    v31 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = [v30 _syLoggableDescription];
      *(_DWORD *)buf = 138412546;
      v49 = v15;
      __int16 v50 = 2112;
      v51 = v32;
      _os_log_impl(&dword_1C2C5F000, v31, OS_LOG_TYPE_INFO, "Launching app: %@, with user activity: %@", buf, 0x16u);

      id v10 = v39;
    }

    v33 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_12;
    v40[3] = &unk_1E64641F8;
    v40[4] = v15;
    v41 = v14;
    [v33 openUserActivity:v30 usingApplicationRecord:v16 configuration:0 completionHandler:v40];

    id v23 = v36;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v26 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v54 = *MEMORY[0x1E4F28568];
  v55[0] = @"document source bundle identifier is empty.";
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
  id v17 = [v26 errorWithDomain:@"com.apple.synapse" code:-129 userInfo:v27];

  ((void (**)(void, void, id))v14)[2](v14, 0, v17);
LABEL_27:
}

uint64_t __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_fallbackUserActivityForDocumentWithAttributes:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sourceBundleIdentifier];
  int v6 = SYIsMailBundleId(v4, v5);

  if (v6)
  {
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.mail.message"];
    id v8 = [v3 indexKey];
    objc_msgSend(v7, "set_syRelatedUniqueIdentifier:", v8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)hasOriginalDocumentForFileAtURL:(id)a3 withAttributes:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __94__SYDocumentWorkflowsServiceHandle_hasOriginalDocumentForFileAtURL_withAttributes_completion___block_invoke;
  v25[3] = &unk_1E6463B08;
  id v10 = v9;
  id v26 = v10;
  id v11 = (void (**)(void, void, void))MEMORY[0x1C8769940](v25);
  id v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v7 path];
    *(_DWORD *)buf = 138412290;
    v29 = v13;
    _os_log_impl(&dword_1C2C5F000, v12, OS_LOG_TYPE_INFO, "Asking for original document of file at url: %@", buf, 0xCu);
  }
  id v14 = [v7 path];
  if (SYPathIsInMailDownloadsDir(v14)) {
    goto LABEL_6;
  }
  v15 = [v7 path];
  if ([v15 hasPrefix:@"/private/var/mobile/tmp/com.apple.email.maild/"])
  {

LABEL_6:
    goto LABEL_7;
  }
  char v18 = [v15 hasPrefix:@"/var/mobile/tmp/com.apple.email.maild/"];

  if ((v18 & 1) == 0)
  {
    id v19 = [v8 indexKey];
    v27 = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__SYDocumentWorkflowsServiceHandle_hasOriginalDocumentForFileAtURL_withAttributes_completion___block_invoke_18;
    v21[3] = &unk_1E6464068;
    id v22 = v7;
    id v23 = v8;
    id v24 = v11;
    +[SYDocumentAttributesFetchRequest fetchAttributesForDocumentsWithIndexKeys:v20 completion:v21];

    goto LABEL_10;
  }
LABEL_7:
  id v16 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v7 path];
    *(_DWORD *)buf = 138412290;
    v29 = v17;
    _os_log_impl(&dword_1C2C5F000, v16, OS_LOG_TYPE_INFO, "Requested original of document considered the original itself, url: %@", buf, 0xCu);
  }
  v11[2](v11, 0, 0);
LABEL_10:
}

uint64_t __94__SYDocumentWorkflowsServiceHandle_hasOriginalDocumentForFileAtURL_withAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __94__SYDocumentWorkflowsServiceHandle_hasOriginalDocumentForFileAtURL_withAttributes_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) path];
  int v8 = [v7 hasPrefix:@"/var/tmp/com.apple.email.maild/"];

  id v9 = [*(id *)(a1 + 40) originalFileURL];
  id v10 = [v9 path];
  int v11 = [v10 hasPrefix:@"/var/mobile/Library/Mail/AttachmentData/"];

  int v12 = v8 & v11;
  id v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = [*(id *)(a1 + 40) indexKey];
    v15 = [v5 firstObject];
    id v16 = [v15 originalFileURL];
    id v17 = [v16 path];
    int v19 = 138412802;
    v20 = v14;
    __int16 v21 = 2112;
    id v22 = v17;
    __int16 v23 = 1024;
    int v24 = v12;
    _os_log_impl(&dword_1C2C5F000, v13, OS_LOG_TYPE_INFO, "Original document version of file with id: %@, found at: %@, suppressed: %{BOOL}d", (uint8_t *)&v19, 0x1Cu);
  }
  if (v12)
  {
    char v18 = 0;
  }
  else
  {
    char v18 = [v5 firstObject];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)hasLastModifiedDocument:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__SYDocumentWorkflowsServiceHandle_hasLastModifiedDocument_completion___block_invoke;
  v14[3] = &unk_1E6464310;
  id v15 = v6;
  id v7 = v6;
  int v8 = (void *)MEMORY[0x1C8769940](v14);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__SYDocumentWorkflowsServiceHandle_hasLastModifiedDocument_completion___block_invoke_2;
  v11[3] = &unk_1E64642C0;
  id v12 = v5;
  id v13 = v8;
  id v9 = v5;
  id v10 = v8;
  +[SYLastModifiedDocumentFetchRequest fetchLastModifiedDocument:v9 completion:v11];
}

uint64_t __71__SYDocumentWorkflowsServiceHandle_hasLastModifiedDocument_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __71__SYDocumentWorkflowsServiceHandle_hasLastModifiedDocument_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    a3;
    id v6 = [v5 fileURL];
    id v7 = [v6 path];
    int v8 = SYPathIsInMailDownloadsDir(v7);

    id v9 = [v5 fileURL];
    id v10 = [v9 path];
    int v11 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    id v12 = [v11 firstObject];

    uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
    id v14 = [(id)v13 URLByAppendingPathComponent:@"Containers/com.apple.Preview/Data/tmp/"];
    id v15 = [v14 path];

    LODWORD(v13) = [v10 hasPrefix:v15];
    int v16 = v8 | v13;
    id v17 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v19 = [v5 fileURL];
      v20 = [v19 path];
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      int v24 = v20;
      __int16 v25 = 1024;
      int v26 = v16;
      _os_log_impl(&dword_1C2C5F000, v17, OS_LOG_TYPE_INFO, "Last document version of file with id: %@, found at: %@, suppressed: %{BOOL}d", buf, 0x1Cu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void, void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, a3);
  }
}

- (void)openLastModifiedDocument:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke;
  v13[3] = &unk_1E6463968;
  id v14 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1C8769940](v13);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke_2;
  v11[3] = &unk_1E64642C0;
  void v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  +[SYLastModifiedDocumentFetchRequest fetchLastModifiedDocument:v8 completion:v11];
}

uint64_t __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _createOpenLastModifiedDocumentImpl];
    id v5 = [v3 fileURL];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke_3;
    v6[3] = &unk_1E6463968;
    id v7 = *(id *)(a1 + 40);
    [v4 revealDocumentAtURL:v5 completion:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createOpenLastModifiedDocumentImpl
{
  v2 = objc_alloc_init(SYOpenLastModifiedDocumentImplUIKit);
  return v2;
}

- (void)updateLinkedDocumentsWithCompletion:(id)a3
{
  id v3 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke;
  v9[3] = &unk_1E6463968;
  id v10 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1C8769940](v9);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6464180;
  id v8 = v5;
  id v6 = v5;
  +[SYDocumentFetchRequest fetchAllDocumentsMatchingAnyIndexIdWithCompletion:v7];
}

uint64_t __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = [v5 count];
    _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "Found %ld linked document(s) matching any index key", buf, 0xCu);
  }

  if (v5 && [v5 count])
  {
    id v8 = [MEMORY[0x1E4F1CA80] set];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_31;
    v18[3] = &unk_1E6464960;
    id v9 = v8;
    id v19 = v9;
    [v5 enumerateObjectsUsingBlock:v18];
    id v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v5 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_1C2C5F000, v10, OS_LOG_TYPE_INFO, "Found %ld linked document(s) with index keys: %@", buf, 0x16u);
    }

    id v12 = [v9 allObjects];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_33;
    v14[3] = &unk_1E6464988;
    id v15 = v9;
    id v17 = *(id *)(a1 + 32);
    id v16 = v5;
    id v13 = v9;
    +[SYDocumentAttributesFetchRequest fetchAttributesForDocumentsWithIndexKeys:v12 completion:v14];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_31(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 documentId];
  [v2 addObject:v3];
}

void __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v26 = v6;
    v33 = (void *)[*(id *)(a1 + 32) mutableCopy];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v27 = v5;
    id obj = v5;
    uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    id v8 = 0;
    if (v31)
    {
      uint64_t v29 = *(void *)v42;
      int v9 = 1;
      uint64_t v30 = a1;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = v10;
          v34 = *(void **)(*((void *)&v41 + 1) + 8 * v10);
          uint64_t v11 = [v34 indexKey];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v35 = *(id *)(a1 + 40);
          uint64_t v12 = [v35 countByEnumeratingWithState:&v37 objects:v47 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v38 != v14) {
                  objc_enumerationMutation(v35);
                }
                id v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                id v17 = [v16 documentId];
                int v18 = [v17 isEqualToString:v11];

                if (v18)
                {
                  id v19 = os_log_create("com.apple.synapse", "DocumentWorkflows");
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                  {
                    v20 = [v16 fileURL];
                    uint64_t v21 = [v20 path];
                    *(_DWORD *)buf = 138412290;
                    v46 = v21;
                    _os_log_impl(&dword_1C2C5F000, v19, OS_LOG_TYPE_INFO, "Linking: %@", buf, 0xCu);
                  }
                  __int16 v22 = [v16 fileURL];
                  uint64_t v36 = 0;
                  unsigned int v23 = [v34 saveToFileURL:v22 error:&v36];

                  v8 += v23;
                  v9 &= v23;
                  [v33 removeObject:v11];
                }
              }
              uint64_t v13 = [v35 countByEnumeratingWithState:&v37 objects:v47 count:16];
            }
            while (v13);
          }

          uint64_t v10 = v32 + 1;
          a1 = v30;
        }
        while (v32 + 1 != v31);
        uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v31);
    }

    __int16 v25 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v46 = v8;
      _os_log_impl(&dword_1C2C5F000, v25, OS_LOG_TYPE_INFO, "Linked %ld documents.", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v7 = v26;
    id v5 = v27;
  }
  else
  {
    uint64_t v24 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_33_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)unlinkDocumentsWithRelatedUniqueIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v5;
    _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "Unlinking documents with ids: %{public}@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__SYDocumentWorkflowsServiceHandle_unlinkDocumentsWithRelatedUniqueIdentifiers_completion___block_invoke;
  v15[3] = &unk_1E6463968;
  id v16 = v6;
  id v8 = v6;
  int v9 = (void *)MEMORY[0x1C8769940](v15);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__SYDocumentWorkflowsServiceHandle_unlinkDocumentsWithRelatedUniqueIdentifiers_completion___block_invoke_2;
  v12[3] = &unk_1E6464488;
  id v13 = v5;
  id v14 = v9;
  id v10 = v9;
  id v11 = v5;
  +[SYDocumentFetchRequest fetchDocumentsWithIndexIds:v11 completion:v12];
}

uint64_t __91__SYDocumentWorkflowsServiceHandle_unlinkDocumentsWithRelatedUniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __91__SYDocumentWorkflowsServiceHandle_unlinkDocumentsWithRelatedUniqueIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  os_log_t v8 = v7;
  if (v5)
  {
    id v33 = v6;
    int v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v5 count];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v43 = v10;
      __int16 v44 = 2114;
      uint64_t v45 = v11;
      _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_INFO, "Found %ld documents to unlink for ids: %{public}@", buf, 0x16u);
    }
    uint64_t v32 = a1;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v34 = v5;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v38;
      id v17 = "com.apple.synapse";
      id v18 = "DocumentWorkflows";
      unint64_t v19 = 0x1E6463000uLL;
      do
      {
        uint64_t v20 = 0;
        uint64_t v35 = v14;
        do
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v21 = [*(id *)(*((void *)&v37 + 1) + 8 * v20) fileURL];
          __int16 v22 = os_log_create(v17, v18);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            [v21 path];
            uint64_t v23 = v16;
            unint64_t v24 = v19;
            __int16 v25 = v18;
            id v26 = v17;
            id v28 = v27 = v12;
            *(_DWORD *)buf = 138477827;
            uint64_t v43 = (uint64_t)v28;
            _os_log_impl(&dword_1C2C5F000, v22, OS_LOG_TYPE_INFO, "Unlinking: %{private}@", buf, 0xCu);

            id v12 = v27;
            id v17 = v26;
            id v18 = v25;
            unint64_t v19 = v24;
            uint64_t v16 = v23;
            uint64_t v14 = v35;
          }

          uint64_t v29 = *(void **)(v19 + 1040);
          uint64_t v36 = 0;
          v15 += [v29 _removeDocumentAttributesForFileAtURL:v21 keepDocumentRelatedUniqueIdentifierKey:1 error:&v36];

          ++v20;
        }
        while (v14 != v20);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v14);
    }
    else
    {
      id v15 = 0;
    }

    uint64_t v30 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = [v12 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = (uint64_t)v15;
      __int16 v44 = 2048;
      uint64_t v45 = v31;
      _os_log_impl(&dword_1C2C5F000, v30, OS_LOG_TYPE_INFO, "Unlinked %ld/%ld documents.", buf, 0x16u);
    }

    [v12 count];
    (*(void (**)(void))(*(void *)(v32 + 40) + 16))();
    id v6 = v33;
    id v5 = v34;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_33_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (SYDocumentWorkflowsRepository)repository
{
  return self->_repository;
}

- (void).cxx_destruct
{
}

- (void)fetchUserActivityForDocumentIndexKey:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v1, v2, "Unable to fetch user activity for index key: %@, error: %@", (void)v3, DWORD2(v3));
}

- (void)saveUserActivity:(uint64_t)a1 forDocumentIndexKey:sourceBundleIdentifier:completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v1, v2, "Unable to save user activity for document index key: %@, error: %@", (void)v3, DWORD2(v3));
}

- (void)returnToSenderDocument:(uint64_t)a1 withAttributes:shouldCreateNewMessage:completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v1, v2, "Unable to find record for bundle identifier: %@, to return document back to sender, error: %@", (void)v3, DWORD2(v3));
}

- (void)returnToSenderDocument:(void *)a1 withAttributes:(NSObject *)a2 shouldCreateNewMessage:completion:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v3 = [a1 indexKey];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Unable to find original user activity for document with index key: %@", (uint8_t *)&v4, 0xCu);
}

- (void)returnToSenderDocument:(NSObject *)a3 withAttributes:shouldCreateNewMessage:completion:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 indexKey];
  int v6 = 138412546;
  os_log_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1C2C5F000, a3, OS_LOG_TYPE_ERROR, "Unable to fetch original user activity for index key: %@, error: %@", (uint8_t *)&v6, 0x16u);
}

void __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v0, v1, "Unable to launch app with bundle identifier: %@, error: %@");
}

void __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v0, v1, "Unable to fetch documents with index keys: %@, error: %@");
}

@end