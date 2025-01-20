@interface TPSWidgetController
- (NSMutableDictionary)assetURLSessionMap;
- (TPSDocument)preferredDocument;
- (TPSWidgetController)init;
- (TPSWidgetControllerDelegate)delegate;
- (double)timeSinceOSInstallDate;
- (id)cacheFileURLForAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6;
- (os_unfair_lock_s)documentLock;
- (os_unfair_lock_s)urlSessionLock;
- (void)attemptWidgetUpdateWith:(id)a3;
- (void)dealloc;
- (void)fetchAssetForAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6 completionHandler:(id)a7;
- (void)fetchWidgetAssetsForDocument:(id)a3 preferCacheIfAvailable:(BOOL)a4 completionHandler:(id)a5;
- (void)setAssetURLSessionMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentLock:(os_unfair_lock_s)a3;
- (void)setPreferredDocument:(id)a3;
- (void)setUrlSessionLock:(os_unfair_lock_s)a3;
- (void)updatePreferredWidget:(id)a3 completionHandler:(id)a4;
- (void)updateSessionMapValue:(id)a3 forKey:(id)a4;
- (void)updateWidgetDocumentWithDocumentsMap:(id)a3 documentsDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 preferHardwareWelcome:(BOOL)a6 completionHandler:(id)a7;
- (void)widgetAssetsForDocument:(id)a3 preferCacheIfAvailable:(BOOL)a4 userInterfaceStyle:(int64_t)a5 completionHandler:(id)a6;
@end

@implementation TPSWidgetController

- (TPSDocument)preferredDocument
{
  p_documentLock = &self->_documentLock;
  os_unfair_lock_lock(&self->_documentLock);
  preferredDocument = self->_preferredDocument;
  if (!preferredDocument)
  {
    v5 = +[TPSCommonDefines sharedInstance];
    v6 = [v5 appGroupDefaults];

    v7 = +[TPSSecureArchivingUtilities unarchivedObjectOfClass:objc_opt_class() forKey:@"TPSWidgetDocument" userDefaults:v6];
    v8 = self->_preferredDocument;
    self->_preferredDocument = v7;

    preferredDocument = self->_preferredDocument;
  }
  v9 = (void *)[(TPSDocument *)preferredDocument copy];
  os_unfair_lock_unlock(p_documentLock);
  return (TPSDocument *)v9;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_assetURLSessionMap removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)TPSWidgetController;
  [(TPSWidgetController *)&v3 dealloc];
}

- (TPSWidgetController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TPSWidgetController;
  v2 = [(TPSWidgetController *)&v6 init];
  +[TPSPersonaUtilities _adoptPersonaForContainerLookupIfNeeded];
  if (v2)
  {
    *(void *)&v2->_documentLock._os_unfair_lock_opaque = 0;
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    assetURLSessionMap = v2->_assetURLSessionMap;
    v2->_assetURLSessionMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setPreferredDocument:(id)a3
{
  id v9 = a3;
  p_documentLock = &self->_documentLock;
  os_unfair_lock_lock(&self->_documentLock);
  v5 = (TPSDocument *)[v9 copy];
  preferredDocument = self->_preferredDocument;
  self->_preferredDocument = v5;

  v7 = +[TPSCommonDefines sharedInstance];
  v8 = [v7 appGroupDefaults];

  +[TPSSecureArchivingUtilities archivedDataWithRootObject:v9 forKey:@"TPSWidgetDocument" userDefaults:v8];
  os_unfair_lock_unlock(p_documentLock);
}

- (void)updateSessionMapValue:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  p_urlSessionLock = &self->_urlSessionLock;
  os_unfair_lock_lock(&self->_urlSessionLock);
  v8 = [(TPSWidgetController *)self assetURLSessionMap];
  [v8 setObject:v9 forKeyedSubscript:v6];

  os_unfair_lock_unlock(p_urlSessionLock);
}

- (void)attemptWidgetUpdateWith:(id)a3
{
  id v4 = a3;
  if (+[TPSCommonDefines isInternalBuild])
  {
    if ([v4 hasWidgetContent])
    {
      v5 = +[TPSLogger widget];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[TPSWidgetController attemptWidgetUpdateWith:](v4, v5);
      }

      [(TPSWidgetController *)self updatePreferredWidget:v4 completionHandler:0];
    }
    else
    {
      id v6 = +[TPSLogger widget];
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
      if (v4)
      {
        if (v7) {
          -[TPSWidgetController attemptWidgetUpdateWith:]();
        }
      }
      else if (v7)
      {
        -[TPSWidgetController attemptWidgetUpdateWith:]();
      }
    }
  }
}

- (void)updateWidgetDocumentWithDocumentsMap:(id)a3 documentsDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 preferHardwareWelcome:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v39 = a4;
  id v40 = a5;
  id v41 = a7;
  v46 = v11;
  v44 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v43 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v45 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__1;
  v62[4] = __Block_byref_object_dispose__1;
  v12 = [v45 objectForKey:@"TPSWidgetShownTips"];
  v13 = (void *)MEMORY[0x1E4F1CA48];
  if (v12)
  {
    v14 = [v45 objectForKey:@"TPSWidgetShownTips"];
    id v63 = [v13 arrayWithArray:v14];
  }
  else
  {
    id v63 = [MEMORY[0x1E4F1CA48] array];
  }

  v15 = +[TPSDefaultsManager widgetDocument];
  if (v15)
  {
    v16 = [v46 objectForKeyedSubscript:v15];
    if ([v16 hasWidgetContent])
    {
      v17 = +[TPSLogger widget];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v35 = [v16 identifier];
        v36 = [v16 widgetContent];
        v37 = [v36 titleContent];
        *(_DWORD *)buf = 138412546;
        v67 = v35;
        __int16 v68 = 2112;
        v69 = v37;
        _os_log_debug_impl(&dword_19C8DC000, v17, OS_LOG_TYPE_DEBUG, "Found override widget content (%@). TitleContent: %@", buf, 0x16u);
      }
      [v44 addObject:v16];
    }
    else
    {
      if (v16)
      {
        v18 = +[TPSLogger widget];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[TPSWidgetController updateWidgetDocumentWithDocumentsMap:documentsDeliveryInfoMap:deliveryInfoMap:preferHardwareWelcome:completionHandler:]();
        }
      }
      else
      {
        v18 = +[TPSLogger widget];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[TPSWidgetController updateWidgetDocumentWithDocumentsMap:documentsDeliveryInfoMap:deliveryInfoMap:preferHardwareWelcome:completionHandler:]();
        }
      }
    }
  }
  else
  {
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke;
    v57[3] = &unk_1E59075D0;
    v57[4] = self;
    v60 = v62;
    id v58 = v43;
    BOOL v61 = a6;
    id v59 = v44;
    [v46 enumerateKeysAndObjectsUsingBlock:v57];
  }
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"widgetContent" ascending:0];
  v20 = (void *)MEMORY[0x1E4F1CA48];
  v65 = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  v22 = [v44 sortedArrayUsingDescriptors:v21];
  v23 = [v20 arrayWithArray:v22];

  v64 = v19;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  v42 = [v43 sortedArrayUsingDescriptors:v24];

  [v23 addObjectsFromArray:v42];
  uint64_t v25 = [v23 count];
  if (v25)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_26;
    aBlock[3] = &unk_1E5907620;
    id v26 = v23;
    id v53 = v26;
    v54 = self;
    id v55 = v39;
    id v56 = v40;
    v27 = (void (**)(void *, void *))_Block_copy(aBlock);
    unint64_t v28 = 0;
    while (v28 < [v26 count])
    {
      v29 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v28, v25 - v28);
      v30 = v27[2](v27, v29);
      if (!v30)
      {
        v31 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v28);
        v30 = v27[2](v27, v31);
      }
      uint64_t v32 = [v26 indexOfObject:v30];

      unint64_t v28 = v32 + 1;
      if (v30)
      {
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_3;
        v47[3] = &unk_1E5907648;
        id v50 = v41;
        v51 = v62;
        id v33 = v30;
        id v48 = v33;
        id v49 = v45;
        [(TPSWidgetController *)self updatePreferredWidget:v33 completionHandler:v47];

        goto LABEL_28;
      }
    }
    (*((void (**)(id, void, void, void))v41 + 2))(v41, 0, 0, 0);
LABEL_28:
  }
  else
  {
    v34 = +[TPSLogger widget];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C8DC000, v34, OS_LOG_TYPE_DEFAULT, "No suitable widget tip found", buf, 2u);
    }

    (*((void (**)(id, void, void, void))v41 + 2))(v41, 0, 0, 0);
  }

  _Block_object_dispose(v62, 8);
}

void __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if ([v11 hasWidgetContent])
  {
    [*(id *)(a1 + 32) timeSinceOSInstallDate];
    double v5 = v4;
    double v6 = *(double *)&TPSAcceptableWelcomeTimeframe;
    if (![v11 isWelcome] || v5 < v6)
    {
      BOOL v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v8 = [v11 identifier];
      if ([v7 containsObject:v8])
      {
        char v9 = [v11 isWelcome];

        if ((v9 & 1) == 0)
        {
          v10 = (id *)(a1 + 40);
LABEL_15:
          [*v10 addObject:v11];
          goto LABEL_16;
        }
      }
      else
      {
      }
      if (![v11 isWelcome]
        || (([v11 isSwitcherWelcome] & 1) != 0 || objc_msgSend(v11, "isSoftwareWelcome"))
        && !*(unsigned char *)(a1 + 64)
        || [v11 isHardwareWelcome] && *(unsigned char *)(a1 + 64))
      {
        v10 = (id *)(a1 + 48);
        goto LABEL_15;
      }
    }
  }
LABEL_16:
}

id __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_2;
  v9[3] = &unk_1E59075F8;
  v14 = &v15;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  [v3 enumerateIndexesUsingBlock:v9];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) notification];

  if (v8)
  {
    char v9 = [*(id *)(a1 + 40) delegate];
    char v10 = [v9 widgetController:*(void *)(a1 + 40) validForDocument:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) documentDeliveryInfoMap:*(void *)(a1 + 48) deliveryInfoMap:*(void *)(a1 + 56)];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;
    }
  }
  *a3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
}

void __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v19 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v13 = [*(id *)(a1 + 32) identifier];
    LODWORD(v12) = [v12 containsObject:v13];

    if (v12)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v18 = [*(id *)(a1 + 32) identifier];
    [v17 addObject:v18];

    [*(id *)(a1 + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:@"TPSWidgetShownTips"];
    [*(id *)(a1 + 40) synchronize];
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v11();
}

- (void)updatePreferredWidget:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke;
  v10[3] = &unk_1E5907698;
  id v8 = v7;
  id v12 = v8;
  objc_copyWeak(&v13, &location);
  id v9 = v6;
  id v11 = v9;
  [(TPSWidgetController *)self fetchWidgetAssetsForDocument:v9 preferCacheIfAvailable:0 completionHandler:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5907670;
  id v14 = v9;
  id v18 = a1[5];
  id v10 = v9;
  objc_copyWeak(&v19, a1 + 6);
  id v15 = a1[4];
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v19);
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)
    && +[TPSNetworkPathMonitor isNetworkError:](TPSNetworkPathMonitor, "isNetworkError:"))
  {
    v2 = +[TPSLogger widget];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_4();
    }

    uint64_t v3 = *(void *)(a1 + 64);
    if (v3) {
      (*(void (**)(uint64_t, void, void, void, void))(v3 + 16))(v3, 0, 0, 0, *(void *)(a1 + 32));
    }
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained setPreferredDocument:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 40) widgetContent];
  int v6 = [v5 hasAssets];

  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (!*(void *)(a1 + 48))
  {
    id v9 = +[TPSLogger default];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v10) {
        __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_2();
      }
      id v8 = @"widgetDocumentAssetErrorLight";
    }
    else
    {
      if (v10) {
        __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_1();
      }
      id v8 = @"widgetDocumentAssetErrorBoth";
    }
    goto LABEL_21;
  }
  if (!v7)
  {
    id v9 = +[TPSLogger default];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_3();
    }
    id v8 = @"widgetDocumentAssetErrorDark";
LABEL_21:

    goto LABEL_22;
  }
LABEL_10:
  id v8 = 0;
LABEL_22:
  id v11 = [*(id *)(a1 + 40) identifier];
  id v12 = [*(id *)(a1 + 40) correlationID];
  id v13 = +[TPSAnalyticsEventContentRetrieved eventWithTipID:v11 correlationID:v12 serviceError:v8];
  [v13 log];

  id v14 = +[TPSLogger widget];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [*(id *)(a1 + 40) identifier];
    id v16 = [*(id *)(a1 + 40) widgetContent];
    id v17 = [v16 titleContent];
    int v23 = 138412546;
    v24 = v15;
    __int16 v25 = 2112;
    id v26 = v17;
    _os_log_impl(&dword_19C8DC000, v14, OS_LOG_TYPE_DEFAULT, "Reloading timeline with preferred document (%@). TitleContent: %@", (uint8_t *)&v23, 0x16u);
  }
  id v18 = objc_alloc(MEMORY[0x1E4F58DA0]);
  id v19 = +[TPSCommonDefines clientBundleIdentifier];
  id v20 = (void *)[v18 initWithExtensionBundleIdentifier:@"com.apple.tips.TipsSwift" kind:v19];

  id v21 = (id)[v20 reloadTimelineWithReason:@"client update"];
  uint64_t v22 = *(void *)(a1 + 64);
  if (v22) {
    (*(void (**)(uint64_t, void, void, void, void))(v22 + 16))(v22, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), 0);
  }
}

- (void)widgetAssetsForDocument:(id)a3 preferCacheIfAvailable:(BOOL)a4 userInterfaceStyle:(int64_t)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = [v10 widgetContent];
  id v13 = [v12 assets];

  id v14 = [v10 language];
  if (!v8) {
    goto LABEL_8;
  }
  id v15 = [v10 assetFileInfoManager];
  id v16 = [(TPSWidgetController *)self cacheFileURLForAssets:v13 language:v14 userInterfaceStyle:a5 assetFileInfoManager:v15];

  id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v18 = [v16 path];
  char v19 = [v17 fileExistsAtPath:v18];

  if ((v19 & 1) == 0)
  {

    goto LABEL_8;
  }
  if (!v16)
  {
LABEL_8:
    id v21 = [v10 assetFileInfoManager];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __107__TPSWidgetController_widgetAssetsForDocument_preferCacheIfAvailable_userInterfaceStyle_completionHandler___block_invoke;
    v22[3] = &unk_1E59076C0;
    int64_t v24 = a5;
    id v23 = v11;
    [(TPSWidgetController *)self fetchAssetForAssets:v13 language:v14 userInterfaceStyle:a5 assetFileInfoManager:v21 completionHandler:v22];

    id v16 = v23;
    goto LABEL_9;
  }
  id v20 = +[TPSLogger widget];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v26 = a5;
    __int16 v27 = 2112;
    unint64_t v28 = v16;
    _os_log_impl(&dword_19C8DC000, v20, OS_LOG_TYPE_DEFAULT, "Asset with interface %ld found in cache %@", buf, 0x16u);
  }

  (*((void (**)(id, void *, void))v11 + 2))(v11, v16, 0);
LABEL_9:
}

void __107__TPSWidgetController_widgetAssetsForDocument_preferCacheIfAvailable_userInterfaceStyle_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[TPSLogger widget];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 134218242;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19C8DC000, v7, OS_LOG_TYPE_DEFAULT, "Asset with interface %ld fetched and stored at %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWidgetAssetsForDocument:(id)a3 preferCacheIfAvailable:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 widgetContent];
  __int16 v11 = [v10 assets];

  if (v11)
  {
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = __Block_byref_object_copy__1;
    v49[4] = __Block_byref_object_dispose__1;
    id v50 = 0;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy__1;
    void v47[4] = __Block_byref_object_dispose__1;
    id v48 = 0;
    id v12 = +[TPSLogger widget];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [v11 debugDescription];
      -[TPSWidgetController fetchWidgetAssetsForDocument:preferCacheIfAvailable:completionHandler:](v13, (uint64_t)v51, v12);
    }

    objc_initWeak(&location, self);
    id v14 = [TPSAsyncBlockOperation alloc];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke;
    v41[3] = &unk_1E5907710;
    objc_copyWeak(&v44, &location);
    id v15 = v8;
    BOOL v45 = a4;
    id v42 = v15;
    v43 = v49;
    id v16 = [(TPSAsyncBlockOperation *)v14 initWithAsyncBlock:v41];
    id v17 = [TPSAsyncBlockOperation alloc];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_3;
    v36[3] = &unk_1E5907710;
    objc_copyWeak(&v39, &location);
    id v18 = v15;
    BOOL v40 = a4;
    id v37 = v18;
    v38 = v47;
    char v19 = [(TPSAsyncBlockOperation *)v17 initWithAsyncBlock:v36];
    id v20 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_5;
    v30 = &unk_1E5907738;
    id v21 = v16;
    v31 = v21;
    uint64_t v22 = v19;
    uint64_t v32 = v22;
    id v33 = v9;
    v34 = v49;
    v35 = v47;
    id v23 = [v20 blockOperationWithBlock:&v27];
    objc_msgSend(v23, "addDependency:", v21, v27, v28, v29, v30);
    [v23 addDependency:v22];
    id v24 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v24 setMaxConcurrentOperationCount:4];
    [v24 setSuspended:1];
    [v24 addOperation:v21];
    [v24 addOperation:v22];
    [v24 addOperation:v23];
    [v24 setSuspended:0];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
    _Block_object_dispose(v47, 8);

    _Block_object_dispose(v49, 8);
  }
  else
  {
    __int16 v25 = +[TPSLogger widget];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[TPSWidgetController fetchWidgetAssetsForDocument:preferCacheIfAvailable:completionHandler:](v8, v25);
    }

    int64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.tips.TPSWidgetController" code:1 userInfo:0];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v26);
  }
}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_2;
  v9[3] = &unk_1E59076E8;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [WeakRetained widgetAssetsForDocument:v7 preferCacheIfAvailable:v5 userInterfaceStyle:0 completionHandler:v9];
}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_4;
  v9[3] = &unk_1E59076E8;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [WeakRetained widgetAssetsForDocument:v7 preferCacheIfAvailable:v5 userInterfaceStyle:1 completionHandler:v9];
}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) error];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) error];
  }
  id v5 = v4;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchAssetForAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6 completionHandler:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, void, void *))a7;
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  id v16 = [[TPSAssetsConfiguration alloc] initWithAssets:v12 language:v13 userInterfaceStyle:a5 assetFileInfoManager:v14];
  id v17 = [(TPSAssetsConfiguration *)v16 cacheIdentifierForType:0];
  id v18 = +[TPSContentURLController assetPathFromAssetConfiguration:v16 type:0];
  objc_initWeak(&location, self);
  if (v18) {
    BOOL v19 = v17 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    id v20 = +[TPSLogger widget];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[TPSWidgetController fetchAssetForAssets:language:userInterfaceStyle:assetFileInfoManager:completionHandler:]();
    }

    id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.tips.TPSWidgetController" code:2 userInfo:0];
    v15[2](v15, 0, v21);
  }
  else
  {
    uint64_t v22 = +[TPSLogger widget];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v18;
      _os_log_impl(&dword_19C8DC000, v22, OS_LOG_TYPE_DEFAULT, "widget asset path: %@", buf, 0xCu);
    }

    id v24 = +[TPSAssetCacheController sharedInstance];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke;
    v30[3] = &unk_1E5907760;
    objc_copyWeak(&v33, &location);
    int v25 = *MEMORY[0x1E4F28A00];
    id v26 = v17;
    id v31 = v26;
    uint64_t v32 = v15;
    LODWORD(v27) = v25;
    id v21 = [v24 formattedDataForPath:v18 identifier:v26 attributionIdentifier:0 priority:v30 completionHandler:v27];

    [(TPSWidgetController *)self updateSessionMapValue:v21 forKey:v26];
    objc_destroyWeak(&v33);
  }

  objc_destroyWeak(&location);
}

void __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v9 = a3;
  id v10 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v12 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained updateSessionMapValue:0 forKey:*(void *)(a1 + 32)];
  }
  id v13 = +[TPSLogger widget];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke_cold_2(v9, v13);
  }

  if (v10)
  {
    id v14 = +[TPSLogger widget];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke_cold_1((uint64_t)v10, v14, v15);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)cacheFileURLForAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[TPSAssetsConfiguration alloc] initWithAssets:v11 language:v10 userInterfaceStyle:a5 assetFileInfoManager:v9];

  id v13 = [(TPSAssetsConfiguration *)v12 cacheIdentifierForType:0];
  id v14 = +[TPSAssetCacheController sharedInstance];
  uint64_t v15 = [v14 cacheFileURLForIdentifier:v13];

  return v15;
}

- (double)timeSinceOSInstallDate
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"TPSWelcomeNotificationStartDate"];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;
  }
  else
  {
    double v6 = *(double *)&TPSAcceptableWelcomeTimeframe;
  }

  return v6;
}

- (TPSWidgetControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSWidgetControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)documentLock
{
  return self->_documentLock;
}

- (void)setDocumentLock:(os_unfair_lock_s)a3
{
  self->_documentLock = a3;
}

- (os_unfair_lock_s)urlSessionLock
{
  return self->_urlSessionLock;
}

- (void)setUrlSessionLock:(os_unfair_lock_s)a3
{
  self->_urlSessionLock = a3;
}

- (NSMutableDictionary)assetURLSessionMap
{
  return self->_assetURLSessionMap;
}

- (void)setAssetURLSessionMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURLSessionMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredDocument, 0);
}

- (void)attemptWidgetUpdateWith:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 identifier];
  double v5 = [a1 widgetContent];
  double v6 = [v5 titleContent];
  int v7 = 138412546;
  id v8 = v4;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_debug_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_DEBUG, "Overriding widget document from client: (%@). TitleContent: %@", (uint8_t *)&v7, 0x16u);
}

- (void)attemptWidgetUpdateWith:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "Overriding widget document from client failed. Document invalid not found in documents map", v2, v3, v4, v5, v6);
}

- (void)attemptWidgetUpdateWith:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "Overriding widget document from client failed. Document does not have widget content", v2, v3, v4, v5, v6);
}

- (void)updateWidgetDocumentWithDocumentsMap:documentsDeliveryInfoMap:deliveryInfoMap:preferHardwareWelcome:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "Override widget content not found in tips map", v2, v3, v4, v5, v6);
}

- (void)updateWidgetDocumentWithDocumentsMap:documentsDeliveryInfoMap:deliveryInfoMap:preferHardwareWelcome:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "Override widget content does not have valid widget content configured?", v2, v3, v4, v5, v6);
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "ERROR: failed to download both widget assets", v2, v3, v4, v5, v6);
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "ERROR: failed to download light widget assets", v2, v3, v4, v5, v6);
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "ERROR: failed to download dark widget assets", v2, v3, v4, v5, v6);
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "Network unreachable...skipping widget update", v2, v3, v4, v5, v6);
}

- (void)fetchWidgetAssetsForDocument:(void *)a1 preferCacheIfAvailable:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  int v5 = 138412290;
  uint8_t v6 = v3;
  OUTLINED_FUNCTION_2(&dword_19C8DC000, a2, v4, "Asset not available in document %@", (uint8_t *)&v5);
}

- (void)fetchWidgetAssetsForDocument:(void *)a1 preferCacheIfAvailable:(uint64_t)a2 completionHandler:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_19C8DC000, a3, (uint64_t)a3, "Asset available %@", (uint8_t *)a2);
}

- (void)fetchAssetForAssets:language:userInterfaceStyle:assetFileInfoManager:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "Cannot generate asset path to fetch", v2, v3, v4, v5, v6);
}

void __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_2(&dword_19C8DC000, a2, a3, "widget asset error: %@", (uint8_t *)&v3);
}

void __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 absoluteString];
  int v5 = 138412290;
  uint8_t v6 = v3;
  OUTLINED_FUNCTION_2(&dword_19C8DC000, a2, v4, "widget asset file url: %@", (uint8_t *)&v5);
}

@end