@interface WBSFaviconProviderPersistenceController
- (NSURL)databaseURL;
- (NSURL)diskCacheURL;
- (WBSFaviconProviderPersistenceController)init;
- (WBSFaviconProviderPersistenceController)initWithPersistenceBaseURL:(id)a3 databaseName:(id)a4 preferredIconSize:(CGSize)a5 isReadOnly:(BOOL)a6;
- (id)_imageFromURL:(id)a3;
- (int64_t)_faviconStatusFromWBSSQLStoreStatus:(int64_t)a3;
- (void)_finishSetUpWithStatus:(int64_t)a3;
- (void)_iconForIconUUID:(id)a3 completionHandler:(id)a4;
- (void)closeWithCompletionHandler:(id)a3;
- (void)dataCacheDidSetUp:(id)a3;
- (void)firstIconForVariantsOfDomainString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5;
- (void)firstIconForVariantsOfPageURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5;
- (void)flushPrivateDataFromMemoryWithCompletionHandler:(id)a3;
- (void)iconForIconURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5;
- (void)iconForPageURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5;
- (void)iconInfoForIconURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5;
- (void)iconInfoForPageURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5;
- (void)linkPageURLString:(id)a3 toIconURLString:(id)a4 isPrivate:(BOOL)a5 completionHandler:(id)a6;
- (void)openAndCheckIntegrity:(BOOL)a3 createIfNeeded:(BOOL)a4 fallBackToMemoryStoreIfError:(BOOL)a5 completionHandler:(id)a6;
- (void)pageURLStringsPrefixedWithVariantsOfDomainString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5;
- (void)rejectedResourceInfosForPageURLString:(id)a3 iconURLString:(id)a4 includingPrivateData:(BOOL)a5 completionHandler:(id)a6;
- (void)removeAllIconsWithCompletionHandler:(id)a3;
- (void)removeIconFilesNotReferencedInDatabaseWithCompletionHandler:(id)a3;
- (void)removeIconWithPageURLString:(id)a3 completionHandler:(id)a4;
- (void)removeIconsWithURLStringsNotFoundIn:(id)a3 completionHandler:(id)a4;
- (void)savePendingChangesBeforeTermination;
- (void)setIconData:(id)a3 forPageURLString:(id)a4 iconURLString:(id)a5 iconSize:(CGSize)a6 hasGeneratedResolutions:(BOOL)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9;
- (void)setIconIsRejectedResource:(BOOL)a3 forPageURLString:(id)a4 iconURLString:(id)a5 isPrivate:(BOOL)a6 completionHandler:(id)a7;
- (void)sqliteStoreDidFailDatabaseIntegrityCheck:(id)a3 completionHandler:(id)a4;
- (void)sqliteStoreDidFallBackToInMemoryStore:(id)a3;
@end

@implementation WBSFaviconProviderPersistenceController

uint64_t __103__WBSFaviconProviderPersistenceController_removeIconFilesNotReferencedInDatabaseWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeEntriesForKeyStringsNotIncludedIn:a2 completionHandler:*(void *)(a1 + 40)];
}

- (void)openAndCheckIntegrity:(BOOL)a3 createIfNeeded:(BOOL)a4 fallBackToMemoryStoreIfError:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke;
  block[3] = &unk_1E5E420A0;
  block[4] = self;
  id v14 = v10;
  BOOL v15 = a3;
  BOOL v16 = a4;
  BOOL v17 = a5;
  id v12 = v10;
  dispatch_async(internalQueue, block);
}

- (void)dataCacheDidSetUp:(id)a3
{
}

- (void)_finishSetUpWithStatus:(int64_t)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__WBSFaviconProviderPersistenceController__finishSetUpWithStatus___block_invoke;
  v4[3] = &unk_1E5E420F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

- (WBSFaviconProviderPersistenceController)initWithPersistenceBaseURL:(id)a3 databaseName:(id)a4 preferredIconSize:(CGSize)a5 isReadOnly:(BOOL)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  id v13 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WBSFaviconProviderPersistenceController;
  id v14 = [(WBSFaviconProviderPersistenceController *)&v36 init];
  BOOL v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_baseURL, a3);
    if (v13 && (baseURL = v15->_baseURL) != 0)
    {
      BOOL v17 = [v13 stringByAppendingPathExtension:@"db"];
      uint64_t v18 = [(NSURL *)baseURL URLByAppendingPathComponent:v17 isDirectory:0];
      databaseURL = v15->_databaseURL;
      v15->_databaseURL = (NSURL *)v18;

      uint64_t v20 = [(NSURL *)v15->_baseURL URLByAppendingPathComponent:v13 isDirectory:1];
      diskCacheURL = v15->_diskCacheURL;
      v15->_diskCacheURL = (NSURL *)v20;
    }
    else
    {
      v22 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WBSFaviconProviderPersistenceController initWithPersistenceBaseURL:databaseName:preferredIconSize:isReadOnly:]((uint64_t *)&v15->_baseURL, (uint64_t)v13, v22);
      }
    }
    v15->_controllerState = 0;
    v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v24 = NSString;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    id v27 = [v24 stringWithFormat:@"com.apple.Safari.%@.%p.internalQueue", v26, v15];
    dispatch_queue_t v28 = dispatch_queue_create((const char *)[v27 UTF8String], v23);
    internalQueue = v15->_internalQueue;
    v15->_internalQueue = (OS_dispatch_queue *)v28;

    v30 = objc_alloc_init(WBSFaviconProviderPrivateCache);
    privateCache = v15->_privateCache;
    v15->_privateCache = v30;

    v15->_preferredIconSize.CGFloat width = width;
    v15->_preferredIconSize.CGFloat height = height;
    v15->_isReadOnly = a6;
    uint64_t v32 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    inMemoryImageCache = v15->_inMemoryImageCache;
    v15->_inMemoryImageCache = (NSMapTable *)v32;

    v34 = v15;
  }

  return v15;
}

uint64_t __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = 1;
  uint64_t v2 = MEMORY[0x1AD115160](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 112) && *(void *)(v5 + 104))
  {
    v6 = [[WBSOnDiskDataCache alloc] initWithCacheDirectoryURL:*(void *)(*(void *)(a1 + 32) + 112)];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDataCacheDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 16) setIsInMemoryCacheEnabled:0];
    v9 = [(WBSSQLiteStore *)[WBSFaviconProviderDatabaseController alloc] initWithURL:*(void *)(*(void *)(a1 + 32) + 104)];
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = v9;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
    id v12 = objc_alloc_init(WBSFaviconProviderRecordCache);
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 32);
    *(void *)(v13 + 32) = v12;

    uint64_t v15 = *(void *)(a1 + 32);
    BOOL v16 = *(void **)(v15 + 24);
    uint64_t v17 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v18 = *(unsigned __int8 *)(a1 + 49);
    uint64_t v19 = *(unsigned __int8 *)(a1 + 50);
    BOOL v20 = *(unsigned char *)(v15 + 96) == 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_9;
    v23[3] = &unk_1E5E42078;
    v23[4] = v15;
    return [v16 openAndCheckIntegrity:v17 createIfNeeded:v18 fallBackToMemoryStoreIfError:v19 lockingPolicy:v20 completionHandler:v23];
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_cold_1(v22);
    }
    return [*(id *)(a1 + 32) _finishSetUpWithStatus:3];
  }
}

uint64_t __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_9(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 3)
  {
    if (!a2)
    {
      v4 = *(void **)(*(void *)(result + 32) + 16);
      return [v4 setUp];
    }
  }
  else
  {
    uint64_t v2 = *(void **)(result + 32);
    uint64_t v3 = [v2 _faviconStatusFromWBSSQLStoreStatus:a2];
    return [v2 _finishSetUpWithStatus:v3];
  }
  return result;
}

void __66__WBSFaviconProviderPersistenceController__finishSetUpWithStatus___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;

    uint64_t v6 = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 2;
  }
  *(void *)(v2 + 72) = v6;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 56);
  *(void *)(v7 + 56) = 0;
}

- (void)removeIconFilesNotReferencedInDatabaseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  faviconDatabase = self->_faviconDatabase;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__WBSFaviconProviderPersistenceController_removeIconFilesNotReferencedInDatabaseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E42320;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WBSFaviconProviderDatabaseController *)faviconDatabase fetchAllIconUUIDsWithCompletionHandler:v7];
}

- (WBSFaviconProviderPersistenceController)init
{
  return 0;
}

- (void)closeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E420C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = 3;
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5E420C8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 closeWithCompletionHandler:v3];
}

void __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_3;
  v2[3] = &unk_1E5E420C8;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) savePendingChangesBeforeTearDown];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 64);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_4;
  v4[3] = &unk_1E5E420C8;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);
}

uint64_t __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = 0;

  *(void *)(*(void *)(a1 + 32) + 72) = 0;
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v8();
}

- (void)savePendingChangesBeforeTermination
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSFaviconProviderPersistenceController_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5E40968;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  [(WBSOnDiskDataCache *)self->_faviconDiskCache savePendingChangesBeforeTearDown];
  faviconDiskCache = self->_faviconDiskCache;
  self->_faviconDiskCache = 0;
}

void __78__WBSFaviconProviderPersistenceController_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 72);
  if (v2) {
    BOOL v3 = v2 == 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    *(void *)(v1 + 72) = 3;
    [*(id *)(*(void *)(a1 + 32) + 24) savePendingChangesBeforeTermination];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;

    *(void *)(*(void *)(a1 + 32) + 72) = 0;
  }
}

- (void)flushPrivateDataFromMemoryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__WBSFaviconProviderPersistenceController_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E420C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __91__WBSFaviconProviderPersistenceController_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeAllImageDataWithCompletionHandler:*(void *)(a1 + 40)];
}

- (int64_t)_faviconStatusFromWBSSQLStoreStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (id)_imageFromURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSMapTable *)self->_inMemoryImageCache objectForKey:v4];
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v7];

      if (v8)
      {
        v9 = +[WBSFaviconProviderUtilities imageWithURL:closetToPreferredSize:](WBSFaviconProviderUtilities, "imageWithURL:closetToPreferredSize:", v4, self->_preferredIconSize.width, self->_preferredIconSize.height);
        [(NSMapTable *)self->_inMemoryImageCache setObject:v9 forKey:v4];
        id v6 = v9;
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setIconData:(id)a3 forPageURLString:(id)a4 iconURLString:(id)a5 iconSize:(CGSize)a6 hasGeneratedResolutions:(BOOL)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a9;
  internalQueue = self->_internalQueue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke;
  v26[3] = &unk_1E5E421B8;
  id v29 = v17;
  id v30 = v20;
  v26[4] = self;
  id v27 = v18;
  BOOL v33 = a8;
  id v28 = v19;
  CGFloat v31 = width;
  CGFloat v32 = height;
  BOOL v34 = a7;
  id v22 = v17;
  id v23 = v19;
  id v24 = v18;
  id v25 = v20;
  dispatch_async(internalQueue, v26);
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    BOOL v3 = objc_msgSend(*(id *)(a1 + 48), "safari_stringByFormattingForFaviconDatabase");
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 88))
    {
      [*(id *)(v5 + 40) setIsRejectedResource:0 forPageURLString:v2 iconURLString:v3];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setImageData:forPageURLString:iconURLString:iconSize:hasGeneratedResolutions:", *(void *)(a1 + 56), v2, v4, *(unsigned __int8 *)(a1 + 89), *(double *)(a1 + 72), *(double *)(a1 + 80));
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      uint64_t v7 = *(void **)(v5 + 24);
      uint64_t v8 = *(unsigned __int8 *)(a1 + 89);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_2;
      v9[3] = &unk_1E5E42190;
      v9[4] = v5;
      id v10 = v3;
      id v11 = *(id *)(a1 + 56);
      long long v14 = *(_OWORD *)(a1 + 72);
      id v13 = *(id *)(a1 + 64);
      id v12 = v2;
      objc_msgSend(v7, "linkAndUpdateTimestampForIconWithPageURLString:iconURLString:iconSize:iconHasGeneratedResolutions:completionHandler:", v12, v10, v8, v9, *(double *)(a1 + 72), *(double *)(a1 + 80));
    }
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v6();
  }
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_3;
  block[3] = &unk_1E5E42168;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  long long v19 = *(_OWORD *)(a1 + 72);
  id v18 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 56);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_3(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 32);
    v28[0] = *(void *)(a1 + 32);
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [v2 removeRecordForIconUUIDs:v3];

    id v4 = *(void **)(*(void *)(a1 + 40) + 16);
    uint64_t v27 = *(void *)(a1 + 32);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    [v4 removeEntriesForKeyStrings:v5 completionHandler:0];
  }
  id v6 = *(void **)(*(void *)(a1 + 40) + 32);
  uint64_t v7 = [*(id *)(a1 + 48) dateAdded];
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = [*(id *)(a1 + 48) UUIDString];
  uint64_t v10 = *(void *)(a1 + 64);
  id v11 = (double *)(a1 + 88);
  BOOL v12 = v10 == 0;
  if (v10) {
    uint64_t v13 = (double *)(a1 + 96);
  }
  else {
    uint64_t v13 = (double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (v12) {
    id v11 = (double *)MEMORY[0x1E4F1DB30];
  }
  objc_msgSend(v6, "setDateAdded:forFaviconURLString:iconUUID:iconSize:hasGeneratedResolutions:", v7, v8, v9, objc_msgSend(*(id *)(a1 + 48), "hasGeneratedResolutions"), *v11, *v13);

  uint64_t v14 = [*(id *)(a1 + 64) length];
  id v15 = *(void **)(*(void *)(a1 + 40) + 16);
  if (v14)
  {
    uint64_t v16 = *(void *)(a1 + 64);
    id v17 = [*(id *)(a1 + 48) UUIDString];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4;
    v22[3] = &unk_1E5E42140;
    id v25 = *(id *)(a1 + 80);
    id v18 = *(id *)(a1 + 72);
    uint64_t v19 = *(void *)(a1 + 40);
    id v23 = v18;
    uint64_t v24 = v19;
    [v15 setEntry:v16 forKeyString:v17 completionHandler:v22];

    id v20 = v25;
  }
  else
  {
    id v20 = [*(id *)(a1 + 48) UUIDString];
    v26 = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v15 removeEntriesForKeyStrings:v21 completionHandler:*(void *)(a1 + 80)];
  }
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4_cold_2(v6);
    }
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4_cold_1(a1, v7);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(*(void *)(a1 + 40) + 24);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_16;
    v10[3] = &unk_1E5E42118;
    id v11 = *(id *)(a1 + 48);
    [v9 removePageURLString:v8 completionHandler:v10];
  }
}

uint64_t __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setIconIsRejectedResource:(BOOL)a3 forPageURLString:(id)a4 iconURLString:(id)a5 isPrivate:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke;
  block[3] = &unk_1E5E421E0;
  void block[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  BOOL v23 = a6;
  BOOL v24 = a3;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  dispatch_async(internalQueue, block);
}

void __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    BOOL v3 = objc_msgSend(*(id *)(a1 + 48), "safari_stringByFormattingForFaviconDatabase");
    if (*(unsigned char *)(a1 + 64))
    {
      [*(id *)(*(void *)(a1 + 32) + 40) setIsRejectedResource:*(unsigned __int8 *)(a1 + 65) forPageURLString:v2 iconURLString:v3];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v5 = *(void **)(*(void *)(a1 + 32) + 24);
      if (*(unsigned char *)(a1 + 65))
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke_2;
        v9[3] = &unk_1E5E412A0;
        id v10 = *(id *)(a1 + 56);
        [v5 markRejectedIconAtPageURLString:v2 iconURLString:v3 completionHandler:v9];
        id v6 = v10;
      }
      else
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke_3;
        v7[3] = &unk_1E5E412A0;
        id v8 = *(id *)(a1 + 56);
        [v5 markValidIconAtPageURLString:v2 iconURLString:v3 completionHandler:v7];
        id v6 = v8;
      }
    }
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
}

uint64_t __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectedResourceInfosForPageURLString:(id)a3 iconURLString:(id)a4 includingPrivateData:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __134__WBSFaviconProviderPersistenceController_rejectedResourceInfosForPageURLString_iconURLString_includingPrivateData_completionHandler___block_invoke;
  block[3] = &unk_1E5E42208;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a5;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(internalQueue, block);
}

void __134__WBSFaviconProviderPersistenceController_rejectedResourceInfosForPageURLString_iconURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 48), "safari_stringByFormattingForFaviconDatabase");
    if (*(unsigned char *)(a1 + 64))
    {
      BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 40) rejectedResourceInfosForPageURLString:v5 iconURLString:v2];
      if ([v3 count])
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_10:

        return;
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 24) rejectedResourceIconInfosForPageURLString:v5 iconURLString:v2 completionHandler:*(void *)(a1 + 56)];
    goto LABEL_10;
  }
  id v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  v4();
}

- (void)linkPageURLString:(id)a3 toIconURLString:(id)a4 isPrivate:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke;
  block[3] = &unk_1E5E42208;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a5;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(internalQueue, block);
}

void __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    BOOL v3 = objc_msgSend(*(id *)(a1 + 48), "safari_stringByFormattingForFaviconDatabase");
    if (*(unsigned char *)(a1 + 64))
    {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), [*(id *)(*(void *)(a1 + 32) + 40) linkPageURLString:v2 toIconURLString:v3]);
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 24);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke_2;
      v7[3] = &unk_1E5E42258;
      void v7[4] = v5;
      id v8 = *(id *)(a1 + 56);
      [v6 linkPageURLString:v2 toExistingIconURLString:v3 completionHandler:v7];
    }
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
}

void __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke_3;
  v10[3] = &unk_1E5E42230;
  char v14 = a2;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v8;
  id v13 = v7;
  id v9 = v5;
  dispatch_async(v6, v10);
}

uint64_t __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke_3(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 32);
      v9[0] = *(void *)(a1 + 32);
      BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      [v2 removeRecordForIconUUIDs:v3];

      id v4 = *(void **)(*(void *)(a1 + 40) + 16);
      uint64_t v8 = *(void *)(a1 + 32);
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
      [v4 removeEntriesForKeyStrings:v5 completionHandler:0];
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v7();
  }
}

- (void)removeIconWithPageURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5E422A8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    [*(id *)(*(void *)(a1 + 32) + 40) removeImageDataForPageURLString:v2];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke_2;
    v6[3] = &unk_1E5E42280;
    v6[4] = v3;
    id v7 = *(id *)(a1 + 48);
    [v4 removePageURLString:v2 completionHandler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke_3;
  block[3] = &unk_1E5E40940;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke_3(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    uint64_t v2 = *(void **)(a1[5] + 32);
    v8[0] = a1[4];
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v2 removeRecordForIconUUIDs:v3];

    uint64_t v4 = *(void **)(a1[5] + 16);
    uint64_t v7 = a1[4];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [v4 removeEntriesForKeyStrings:v5 completionHandler:0];
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)removeAllIconsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E420C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 72) == 2)
  {
    uint64_t v2 = *(void **)(v1 + 40);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E5E422D0;
    v4[4] = v1;
    id v5 = *(id *)(a1 + 40);
    [v2 removeAllImageDataWithCompletionHandler:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E5E420C8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 removeAllPageURLStringsWithCompletionHandler:v3];
}

void __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 64);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_4;
  v3[3] = &unk_1E5E420C8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllRecords];
  [*(id *)(*(void *)(a1 + 32) + 16) reset];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)removeIconsWithURLStringsNotFoundIn:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke;
  block[3] = &unk_1E5E422A8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "safari_stringByFormattingForFaviconDatabase");
          [v2 addObject:v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }

    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 24);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_2;
    v14[3] = &unk_1E5E42370;
    v14[4] = v9;
    id v11 = *(id *)(a1 + 48);
    id v15 = v2;
    id v16 = v11;
    id v12 = v2;
    [v10 fetchAllKnownPageURLStringsWithCompletionHandler:v14];
  }
  else
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v13();
  }
}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5E42348;
  void v7[4] = v4;
  id v10 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_4;
    v9[3] = &unk_1E5E422F8;
    uint64_t v2 = *(void **)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v3 = [v2 objectsPassingTest:v9];
    if ([v3 count])
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 24);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_5;
      v7[3] = &unk_1E5E42320;
      void v7[4] = v4;
      id v8 = *(id *)(a1 + 56);
      [v5 removePageURLStrings:v3 completionHandler:v7];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

uint64_t __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_6;
  block[3] = &unk_1E5E40940;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 32);
    uint64_t v4 = [v2 allObjects];
    [v3 removeRecordForIconUUIDs:v4];

    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 16);
    id v6 = [*(id *)(a1 + 32) allObjects];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_7;
    v8[3] = &unk_1E5E41548;
    id v9 = *(id *)(a1 + 48);
    [v5 removeEntriesForKeyStrings:v6 completionHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

uint64_t __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)iconForPageURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5E40CF0;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalQueue, v13);
}

void __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    if (*(unsigned char *)(a1 + 56))
    {
      id v3 = [*(id *)(*(void *)(a1 + 32) + 40) imageDataForPageURLString:v2];
      if (v3)
      {
        uint64_t v4 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v3];
        if (v4)
        {
          uint64_t v5 = (void *)v4;
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_11:
          return;
        }
      }
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5E423C0;
    void v9[4] = v7;
    id v10 = *(id *)(a1 + 48);
    [v8 iconInfoForPageURLString:v2 completionHandler:v9];

    goto LABEL_11;
  }
  id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v6();
}

void __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_3;
  block[3] = &unk_1E5E422A8;
  void block[4] = v4;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = [*(id *)(a1 + 40) UUIDString];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_4;
    v6[3] = &unk_1E5E42398;
    id v3 = *(void **)(a1 + 32);
    id v7 = v2;
    id v8 = v3;
    id v9 = *(id *)(a1 + 48);
    id v4 = v2;
    [v3 _iconForIconUUID:v4 completionHandler:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2 || (uint64_t v2 = *(void *)(a1 + 32)) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 40) _imageFromURL:a2];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
  else
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_5;
    v6[3] = &unk_1E5E41548;
    id v7 = *(id *)(a1 + 48);
    [v3 removeAllDataForIconUUID:v2 completionHandler:v6];
  }
}

uint64_t __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)iconForIconURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5E40CF0;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalQueue, v13);
}

void __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    if (*(unsigned char *)(a1 + 56))
    {
      id v3 = [*(id *)(*(void *)(a1 + 32) + 40) imageDataForIconURLString:v2];
      if (v3)
      {
        uint64_t v4 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v3];
        if (v4)
        {
          id v5 = (void *)v4;
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_11:
          return;
        }
      }
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5E423C0;
    void v9[4] = v7;
    id v10 = *(id *)(a1 + 48);
    [v8 iconInfoForIconURLString:v2 completionHandler:v9];

    goto LABEL_11;
  }
  id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v6();
}

void __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_3;
  block[3] = &unk_1E5E422A8;
  void block[4] = v4;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = [*(id *)(a1 + 40) UUIDString];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_4;
    v6[3] = &unk_1E5E42398;
    id v3 = *(void **)(a1 + 32);
    id v7 = v2;
    id v8 = v3;
    id v9 = *(id *)(a1 + 48);
    id v4 = v2;
    [v3 _iconForIconUUID:v4 completionHandler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2 || (uint64_t v2 = *(void *)(a1 + 32)) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 40) _imageFromURL:a2];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
  else
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_5;
    v6[3] = &unk_1E5E41548;
    id v7 = *(id *)(a1 + 48);
    [v3 removeAllDataForIconUUID:v2 completionHandler:v6];
  }
}

uint64_t __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_iconForIconUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3)
  {
    faviconDiskCache = self->_faviconDiskCache;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __78__WBSFaviconProviderPersistenceController__iconForIconUUID_completionHandler___block_invoke;
    v9[3] = &unk_1E5E42410;
    void v9[4] = self;
    id v10 = v6;
    [(WBSOnDiskDataCache *)faviconDiskCache getEntryURLForKeyString:a3 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __78__WBSFaviconProviderPersistenceController__iconForIconUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSFaviconProviderPersistenceController__iconForIconUUID_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5E423E8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __78__WBSFaviconProviderPersistenceController__iconForIconUUID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)iconInfoForPageURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5E40CF0;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalQueue, v13);
}

void __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    if (*(unsigned char *)(a1 + 56)
      && ([*(id *)(*(void *)(a1 + 32) + 40) imageInfoForPageURLString:v2],
          (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v4 = (void *)v3;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 24);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke_2;
      v8[3] = &unk_1E5E423C0;
      void v8[4] = v6;
      id v9 = *(id *)(a1 + 48);
      [v7 iconInfoForPageURLString:v2 completionHandler:v8];
    }
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke_3;
  block[3] = &unk_1E5E422A8;
  void block[4] = v4;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    id v9 = [*(id *)(a1 + 40) UUIDString];
    if (v9)
    {
      uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
      id v3 = [*(id *)(a1 + 40) dateAdded];
      uint64_t v4 = [*(id *)(a1 + 40) iconURLString];
      id v5 = objc_msgSend(v4, "safari_stringByFormattingForFaviconDatabase");
      [*(id *)(a1 + 40) size];
      objc_msgSend(v2, "setDateAdded:forFaviconURLString:iconUUID:iconSize:hasGeneratedResolutions:", v3, v5, v9, objc_msgSend(*(id *)(a1 + 40), "hasGeneratedResolutions"), v6, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v8();
  }
}

- (void)iconInfoForIconURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5E40CF0;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalQueue, v13);
}

void __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    if (*(unsigned char *)(a1 + 56)
      && ([*(id *)(*(void *)(a1 + 32) + 40) imageInfoForIconURLString:v2],
          (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([*(id *)(*(void *)(a1 + 32) + 32) iconInfoForURLString:v2],
          (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v4 = (void *)v3;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 32);
      double v7 = *(void **)(v6 + 24);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke_2;
      v8[3] = &unk_1E5E42438;
      void v8[4] = v6;
      id v10 = *(id *)(a1 + 48);
      id v9 = v2;
      [v7 iconInfoForIconURLString:v9 completionHandler:v8];
    }
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5E42348;
  void v7[4] = v4;
  id v10 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    id v8 = [*(id *)(a1 + 40) UUIDString];
    if (v8)
    {
      uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
      id v3 = [*(id *)(a1 + 40) dateAdded];
      uint64_t v4 = *(void *)(a1 + 48);
      [*(id *)(a1 + 40) size];
      objc_msgSend(v2, "setDateAdded:forFaviconURLString:iconUUID:iconSize:hasGeneratedResolutions:", v3, v4, v8, objc_msgSend(*(id *)(a1 + 40), "hasGeneratedResolutions"), v5, v6);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    double v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v7();
  }
}

- (void)firstIconForVariantsOfPageURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5E40CF0;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalQueue, v13);
}

void __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_urlStringVariantsForFaviconDatabase");
    if (*(unsigned char *)(a1 + 56))
    {
      id v3 = *(void **)(*(void *)(a1 + 32) + 40);
      id v13 = 0;
      uint64_t v4 = [v3 firstImageDataMatchingPageURLStringIn:v2 matchedPageURLString:&v13];
      id v5 = v13;
      if (v4)
      {
        uint64_t v6 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v4];
        if (v6)
        {
          double v7 = (void *)v6;
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_11:
          return;
        }
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5E42488;
    v11[4] = v9;
    id v12 = *(id *)(a1 + 48);
    [v10 firstIconUUIDMatchingPageURLStringIn:v2 completionHandler:v11];

    goto LABEL_11;
  }
  id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v8();
}

void __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 64);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_3;
  v12[3] = &unk_1E5E42348;
  v12[4] = v7;
  id v9 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v9;
  id v13 = v6;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[9] == 2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_4;
    v7[3] = &unk_1E5E42460;
    id v10 = *(id *)(a1 + 56);
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = v4;
    uint64_t v9 = v5;
    [v2 _iconForIconUUID:v3 completionHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

void __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) _imageFromURL:a2];
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, v2, v4);
}

- (void)firstIconForVariantsOfDomainString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke;
  block[3] = &unk_1E5E422A8;
  id v13 = v7;
  id v14 = v8;
  void block[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(internalQueue, block);
}

void __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2 && [*(id *)(a1 + 40) length])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "safari_domainFaviconURLStringVariantsForFaviconDatabase");
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_2;
    v5[3] = &unk_1E5E423C0;
    v5[4] = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 48);
    [v2 firstIconInfoMatchingIconURLStringIn:v3 completionHandler:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

void __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_3;
  block[3] = &unk_1E5E422A8;
  void block[4] = v4;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[9] == 2)
  {
    id v3 = [*(id *)(a1 + 40) UUIDString];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_4;
    v6[3] = &unk_1E5E424B0;
    id v4 = *(id *)(a1 + 48);
    void v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    [v2 _iconForIconUUID:v3 completionHandler:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _imageFromURL:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)pageURLStringsPrefixedWithVariantsOfDomainString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __131__WBSFaviconProviderPersistenceController_pageURLStringsPrefixedWithVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5E40CF0;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalQueue, v13);
}

void __131__WBSFaviconProviderPersistenceController_pageURLStringsPrefixedWithVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) == 2 && [*(id *)(a1 + 40) length])
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
    id v3 = objc_msgSend(*(id *)(a1 + 40), "safari_domainURLStringPrefixVariantsForFaviconDatabase");
    if (*(unsigned char *)(a1 + 56))
    {
      id v4 = [*(id *)(*(void *)(a1 + 32) + 40) pageURLStringsWithPrefixesIn:v3];
      [v2 addObjectsFromArray:v4];
    }
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __131__WBSFaviconProviderPersistenceController_pageURLStringsPrefixedWithVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_2;
    v8[3] = &unk_1E5E422D0;
    id v9 = v2;
    id v10 = *(id *)(a1 + 48);
    id v6 = v2;
    [v5 fetchPageURLStringsWithPrefixesIn:v3 completionHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

void __131__WBSFaviconProviderPersistenceController_pageURLStringsPrefixedWithVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObjectsFromArray:a2];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) allObjects];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

- (void)sqliteStoreDidFailDatabaseIntegrityCheck:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void (**)(void))a4;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  databaseURL = self->_databaseURL;
  p_databaseURL = (void **)&self->_databaseURL;
  id v9 = [(NSURL *)databaseURL path];
  id v13 = 0;
  char v10 = [v6 removeItemAtPath:v9 error:&v13];
  id v11 = v13;

  if ((v10 & 1) == 0)
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderPersistenceController sqliteStoreDidFailDatabaseIntegrityCheck:completionHandler:](p_databaseURL, v12);
    }
  }
  v5[2](v5);
}

- (void)sqliteStoreDidFallBackToInMemoryStore:(id)a3
{
  id v4 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[WBSFaviconProviderPersistenceController sqliteStoreDidFallBackToInMemoryStore:]((uint64_t)self, v4);
  }
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (NSURL)diskCacheURL
{
  return self->_diskCacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCacheURL, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_setUpCompletionHandler, 0);
  objc_storeStrong((id *)&self->_inMemoryImageCache, 0);
  objc_storeStrong((id *)&self->_privateCache, 0);
  objc_storeStrong((id *)&self->_recordsCache, 0);
  objc_storeStrong((id *)&self->_faviconDatabase, 0);
  objc_storeStrong((id *)&self->_faviconDiskCache, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)initWithPersistenceBaseURL:(os_log_t)log databaseName:preferredIconSize:isReadOnly:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Unexpected nil args for base url (%p) or name (%p)", (uint8_t *)&v4, 0x16u);
}

void __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Cannot open, required database urls are nil", v1, 2u);
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4_cold_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  int v6 = 138478083;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEBUG, "Failed to write icon data for page url %{private}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4_cold_2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Failed to write icon data, error: %{public}@", v6, v7, v8, v9, 2u);
}

- (void)sqliteStoreDidFailDatabaseIntegrityCheck:(void *)a1 completionHandler:(void *)a2 .cold.1(void **a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *a1;
  uint64_t v3 = a2;
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  int v5 = 138543618;
  uint64_t v6 = v2;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to remove corrupted database at %{public}@, error: %{public}@", (uint8_t *)&v5, 0x16u);
}

- (void)sqliteStoreDidFallBackToInMemoryStore:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_3() path];
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Using in-memory representation for database %{public}@", v7, v8, v9, v10, 2u);
}

@end