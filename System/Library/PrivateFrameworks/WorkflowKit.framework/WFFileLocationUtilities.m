@interface WFFileLocationUtilities
+ (BOOL)isFileURL:(id)a3 withParentItems:(id)a4 insideFolderType:(unint64_t)a5;
+ (id)bundleIdentifierForItem:(id)a3;
+ (id)cloudDocsURL;
+ (id)desktopDirectory;
+ (id)documentsDirectory;
+ (id)documentsURLForApplicationContainerBundleID:(id)a3;
+ (id)downloadsDirectory;
+ (id)fetchRootItemURLForDomainWithID:(id)a3;
+ (id)iCloudDesktopDirectory;
+ (id)iCloudDocumentsDirectory;
+ (id)iCloudDownloadsDirectory;
+ (id)itemForURL:(id)a3 error:(id *)a4;
+ (id)mobileDocumentsDirectory;
+ (id)parentItemsForItem:(id)a3;
+ (id)rootItemForItem:(id)a3;
+ (void)fetchItemWithIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation WFFileLocationUtilities

+ (BOOL)isFileURL:(id)a3 withParentItems:(id)a4 insideFolderType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  uint64_t v10 = 2;
  if (a5 == 1) {
    uint64_t v10 = 3;
  }
  if (a5 == 2) {
    uint64_t v10 = 4;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__WFFileLocationUtilities_isFileURL_withParentItems_insideFolderType___block_invoke;
  v13[3] = &unk_1E654DDE0;
  v13[4] = &v14;
  v13[5] = v10;
  [v8 enumerateObjectsUsingBlock:v13];
  char v11 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v11;
}

uint64_t __70__WFFileLocationUtilities_isFileURL_withParentItems_insideFolderType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 folderType];
  if (result == *(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (id)mobileDocumentsDirectory
{
  v2 = [a1 cloudDocsURL];
  if (objc_msgSend(v2, "wf_fileExists")) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (id)iCloudDownloadsDirectory
{
  v2 = [a1 cloudDocsURL];
  v3 = [v2 URLByAppendingPathComponent:@"com~apple~CloudDocs/Downloads/"];

  if (objc_msgSend(v3, "wf_fileExists")) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)downloadsDirectory
{
  v2 = [a1 iCloudDownloadsDirectory];
  if (objc_msgSend(v2, "wf_fileExists")) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (id)iCloudDocumentsDirectory
{
  v2 = [a1 cloudDocsURL];
  v3 = [v2 URLByAppendingPathComponent:@"com~apple~CloudDocs/Documents/"];

  if (objc_msgSend(v3, "wf_fileExists")) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)documentsDirectory
{
  v2 = [a1 iCloudDocumentsDirectory];
  if (objc_msgSend(v2, "wf_fileExists")) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (id)iCloudDesktopDirectory
{
  v2 = [a1 cloudDocsURL];
  v3 = [v2 URLByAppendingPathComponent:@"com~apple~CloudDocs/Desktop/"];

  if (objc_msgSend(v3, "wf_fileExists")) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)desktopDirectory
{
  v2 = [a1 iCloudDesktopDirectory];
  if (objc_msgSend(v2, "wf_fileExists")) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (id)cloudDocsURL
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (cloudDocsURL_onceToken != -1) {
    dispatch_once(&cloudDocsURL_onceToken, &__block_literal_global_43);
  }
  v2 = getWFFilesLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    v6 = "+[WFFileLocationUtilities cloudDocsURL]";
    __int16 v7 = 2112;
    uint64_t v8 = cloudDocsURL_URL;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_DEBUG, "%s Got cloud docs url %@", (uint8_t *)&v5, 0x16u);
  }

  v3 = (void *)cloudDocsURL_URL;
  return v3;
}

uint64_t __39__WFFileLocationUtilities_cloudDocsURL__block_invoke()
{
  return MEMORY[0x1F4111D70](&__block_literal_global_46);
}

void __39__WFFileLocationUtilities_cloudDocsURL__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    v6 = getWFFilesLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "+[WFFileLocationUtilities cloudDocsURL]_block_invoke_2";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Could not get url with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  __int16 v7 = (void *)cloudDocsURL_URL;
  cloudDocsURL_URL = (uint64_t)v4;
}

+ (id)documentsURLForApplicationContainerBundleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  id v10 = 0;
  id v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v10];

  id v6 = v10;
  if (v5)
  {
    __int16 v7 = [v5 dataContainerURL];
    int v8 = [v7 URLByAppendingPathComponent:@"Documents"];
  }
  else
  {
    __int16 v7 = getWFFilesLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "+[WFFileLocationUtilities documentsURLForApplicationContainerBundleID:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Could not get application record with error: %@", buf, 0x16u);
    }
    int v8 = 0;
  }

  return v8;
}

+ (id)bundleIdentifierForItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "fp_appContainerBundleIdentifier");
  uint64_t v5 = [v4 length];

  if (v5)
  {
    objc_msgSend(v3, "fp_appContainerBundleIdentifier");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    __int16 v13 = __Block_byref_object_copy__6254;
    id v14 = __Block_byref_object_dispose__6255;
    id v15 = 0;
    __int16 v7 = +[WFFileLocationUtilities parentItemsForItem:v3];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__WFFileLocationUtilities_bundleIdentifierForItem___block_invoke;
    v9[3] = &unk_1E654DD98;
    v9[4] = &v10;
    [v7 enumerateObjectsUsingBlock:v9];
    id v6 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return v6;
}

void __51__WFFileLocationUtilities_bundleIdentifierForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = objc_msgSend(v10, "fp_appContainerBundleIdentifier");

  if (v6)
  {
    uint64_t v7 = objc_msgSend(v10, "fp_appContainerBundleIdentifier");
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

+ (id)itemForURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F25D38];
  id v6 = a3;
  uint64_t v7 = [v5 defaultManager];
  uint64_t v8 = [v7 itemForURL:v6 error:a4];

  return v8;
}

+ (id)rootItemForItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v14 = 0;
  id v4 = [MEMORY[0x1E4F25D68] providerDomainForItem:v3 error:&v14];
  id v5 = v14;
  if (v4)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__6254;
    char v17 = __Block_byref_object_dispose__6255;
    id v18 = 0;
    uint64_t v7 = [MEMORY[0x1E4F25D38] defaultManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__WFFileLocationUtilities_rootItemForItem___block_invoke;
    v11[3] = &unk_1E65531C8;
    __int16 v13 = buf;
    uint64_t v8 = v6;
    uint64_t v12 = v8;
    [v7 fetchRootItemForProviderDomain:v4 completionHandler:v11];

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    id v9 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v8 = getWFFilesLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "+[WFFileLocationUtilities rootItemForItem:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Could not get domain with error: %@", buf, 0x16u);
    }
    id v9 = 0;
  }

  return v9;
}

void __43__WFFileLocationUtilities_rootItemForItem___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)parentItemsForItem:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__6254;
  char v17 = __Block_byref_object_dispose__6255;
  id v18 = 0;
  id v5 = [MEMORY[0x1E4F25D38] defaultManager];
  dispatch_semaphore_t v6 = [v3 itemID];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__WFFileLocationUtilities_parentItemsForItem___block_invoke;
  v10[3] = &unk_1E654DD70;
  uint64_t v12 = &v13;
  uint64_t v7 = v4;
  id v11 = v7;
  [v5 fetchParentsForItemID:v6 recursively:1 completionHandler:v10];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __46__WFFileLocationUtilities_parentItemsForItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = getWFFilesLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      uint64_t v12 = "+[WFFileLocationUtilities parentItemsForItem:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Could not fetch parent items due to error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)fetchRootItemURLForDomainWithID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__6254;
    v23 = __Block_byref_object_dispose__6255;
    id v24 = 0;
    id v18 = 0;
    id v5 = [MEMORY[0x1E4F25D68] providerDomainWithID:v3 error:&v18];
    id v6 = v18;
    if (v5)
    {
      uint64_t v7 = [MEMORY[0x1E4F25D38] defaultManager];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__WFFileLocationUtilities_fetchRootItemURLForDomainWithID___block_invoke;
      v14[3] = &unk_1E654DD48;
      uint64_t v15 = v5;
      char v17 = &v19;
      uint64_t v8 = v4;
      uint64_t v16 = v8;
      [v7 fetchRootItemForProviderDomain:v15 completionHandler:v14];

      dispatch_time_t v9 = dispatch_time(0, 3000000000);
      dispatch_semaphore_wait(v8, v9);
      id v10 = (void *)v20[5];
      if (v10) {
        id v11 = v10;
      }

      uint64_t v12 = v15;
    }
    else
    {
      uint64_t v12 = getWFFilesLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "+[WFFileLocationUtilities fetchRootItemURLForDomainWithID:]";
        __int16 v27 = 2112;
        id v28 = v3;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s Could not fetch provider domain: %@ with error: %@", buf, 0x20u);
      }
      id v10 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __59__WFFileLocationUtilities_fetchRootItemURLForDomainWithID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = getWFFilesLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 136315650;
      __int16 v13 = "+[WFFileLocationUtilities fetchRootItemURLForDomainWithID:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Could not fetch root item for providerDomain: %@ error: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v9 = [v5 fileURL];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (void)fetchItemWithIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v16)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFFileLocationUtilities.m", 52, @"Invalid parameter not satisfying: %@", @"domainIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, a1, @"WFFileLocationUtilities.m", 51, @"Invalid parameter not satisfying: %@", @"itemIdentifier" object file lineNumber description];

  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"WFFileLocationUtilities.m", 53, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F25D30]) initWithProviderDomainID:v9 itemIdentifier:v16];
  int v12 = [MEMORY[0x1E4F25D38] defaultManager];
  [v12 fetchItemForItemID:v11 completionHandler:v10];
}

@end