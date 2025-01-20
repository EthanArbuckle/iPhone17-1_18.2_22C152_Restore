@interface SSVMediaContentTasteController
+ (id)defaultMediaTasteController;
- (BOOL)_isRetryableError:(id)a3;
- (SSVMediaContentTasteController)init;
- (unint64_t)contentTasteTypeForPlaylistGlobalID:(id)a3;
- (unint64_t)contentTasteTypeForStoreAdamID:(int64_t)a3;
- (void)_contentTasteForItemUpdate:(id)a3 finishedWithError:(id)a4;
- (void)_handleContentTasteItemsUpdateResponse:(id)a3 allowNotifications:(BOOL)a4;
- (void)_refreshContentTasteItems;
- (void)_retryOperationForItemUpdates:(id)a3 finishedWithError:(id)a4;
- (void)_scheduleContentTasteUpdateOperationForFailedItems;
- (void)_sendUpdateWithItemUpdates:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)setContentTasteType:(unint64_t)a3 forPlaylistGlobalID:(id)a4 withCompletionHandler:(id)a5;
- (void)setContentTasteType:(unint64_t)a3 forStoreAdamID:(int64_t)a4 withContentType:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation SSVMediaContentTasteController

- (SSVMediaContentTasteController)init
{
  v22.receiver = self;
  v22.super_class = (Class)SSVMediaContentTasteController;
  v2 = [(SSVMediaContentTasteController *)&v22 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVMediaContentTasteController.accessSerialQueue", 0);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreServices.SSVMediaContentTasteController.calloutSerialQueue", 0);
    calloutSerialQueue = v2->_calloutSerialQueue;
    v2->_calloutSerialQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v7 = (const char *)_SSVMediaContentTasteControllerItemsDidChangeGlobalNotificationName;
    v8 = v2->_accessSerialQueue;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __38__SSVMediaContentTasteController_init__block_invoke;
    v19 = &unk_1E5BA88B8;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v7, &v2->_itemsDidChangeNotifyToken, v8, &v16);
    v2->_havePendingRetryOperation = 0;
    v2->_exponentialBackOffSeconds = 120;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v16, v17, v18, v19);
    contentTasteItemsToRetry = v2->_contentTasteItemsToRetry;
    v2->_contentTasteItemsToRetry = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    storeAdamIDToContentTasteItem = v2->_storeAdamIDToContentTasteItem;
    v2->_storeAdamIDToContentTasteItem = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    storeAdamIDToPendingContentTasteItem = v2->_storeAdamIDToPendingContentTasteItem;
    v2->_storeAdamIDToPendingContentTasteItem = (NSMutableDictionary *)v13;

    [(SSVMediaContentTasteController *)v2 _refreshContentTasteItems];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__SSVMediaContentTasteController_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_27;
  }
  uint64_t state64 = 0;
  notify_get_state(a2, &state64);
  WeakRetained[4] = state64;
  v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  int v6 = [v4 shouldLogToDisk];
  v7 = [v4 OSLogObject];
  v8 = v7;
  if (v6) {
    v5 |= 2u;
  }
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  uint64_t v11 = WeakRetained[3];
  int v37 = 138412802;
  v38 = v10;
  __int16 v39 = 2048;
  uint64_t v40 = state64;
  __int16 v41 = 2048;
  uint64_t v42 = v11;
  LODWORD(v35) = 32;
  v34 = &v37;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v37, v35);
    free(v12);
    SSFileLog(v4, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v8);
LABEL_11:
  }
  if (WeakRetained[7])
  {
    v19 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v19)
    {
      v19 = +[SSLogConfig sharedConfig];
    }
    int v20 = objc_msgSend(v19, "shouldLog", v34);
    int v21 = [v19 shouldLogToDisk];
    objc_super v22 = [v19 OSLogObject];
    v23 = v22;
    if (v21) {
      v20 |= 2u;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      v20 &= 2u;
    }
    if (v20)
    {
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      uint64_t v26 = WeakRetained[7];
      int v37 = 138412546;
      v38 = v25;
      __int16 v39 = 2048;
      uint64_t v40 = v26;
      LODWORD(v35) = 22;
      v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27)
      {
LABEL_23:

        goto LABEL_27;
      }
      v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, &v37, v35);
      free(v27);
      SSFileLog(v19, @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v23);
    }

    goto LABEL_23;
  }
  if (WeakRetained[3] < state64 || state64 == 0xFFFFFFFF) {
    objc_msgSend(WeakRetained, "_refreshContentTasteItems", v34);
  }
LABEL_27:
}

- (void)dealloc
{
  notify_cancel(self->_itemsDidChangeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)SSVMediaContentTasteController;
  [(SSVMediaContentTasteController *)&v3 dealloc];
}

+ (id)defaultMediaTasteController
{
  return 0;
}

- (unint64_t)contentTasteTypeForPlaylistGlobalID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__7;
  uint64_t v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SSVMediaContentTasteController_contentTasteTypeForPlaylistGlobalID___block_invoke;
  block[3] = &unk_1E5BA88E0;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(accessSerialQueue, block);
  unint64_t v7 = [(id)v13[5] tasteType];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __70__SSVMediaContentTasteController_contentTasteTypeForPlaylistGlobalID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 72) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1[4] + 64) objectForKey:a1[5]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (unint64_t)contentTasteTypeForStoreAdamID:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__7;
  uint64_t v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SSVMediaContentTasteController_contentTasteTypeForStoreAdamID___block_invoke;
  block[3] = &unk_1E5BA8908;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(accessSerialQueue, block);
  unint64_t v4 = [(id)v8[5] tasteType];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__SSVMediaContentTasteController_contentTasteTypeForStoreAdamID___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 96);
  id v10 = [NSNumber numberWithLongLong:a1[6]];
  uint64_t v3 = objc_msgSend(v2, "objectForKey:");
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v6 = *(void **)(a1[4] + 88);
    id v11 = [NSNumber numberWithLongLong:a1[6]];
    uint64_t v7 = objc_msgSend(v6, "objectForKey:");
    uint64_t v8 = *(void *)(a1[5] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (void)setContentTasteType:(unint64_t)a3 forPlaylistGlobalID:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    accessSerialQueue = self->_accessSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5BA89D0;
    block[4] = self;
    id v15 = v8;
    unint64_t v17 = a3;
    id v16 = v10;
    dispatch_async(accessSerialQueue, block);

    id v12 = v15;
LABEL_5:

    goto LABEL_6;
  }
  if (v9)
  {
    calloutSerialQueue = self->_calloutSerialQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E5BA8930;
    id v19 = v9;
    dispatch_async(calloutSerialQueue, v18);
    id v12 = v19;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 72))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = v2;
  }
  uint64_t v5 = objc_alloc_init(SSVMediaContentTasteItemUpdate);
  uint64_t v6 = objc_alloc_init(SSVMutableMediaContentTasteItem);
  [(SSVMutableMediaContentTasteItem *)v6 setPlaylistGlobalID:*(void *)(a1 + 40)];
  [(SSVMutableMediaContentTasteItem *)v6 setContentType:4];
  [(SSVMutableMediaContentTasteItem *)v6 setTasteType:*(void *)(a1 + 56)];
  [(SSVMediaContentTasteItemUpdate *)v5 setItem:v6];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [(SSVMediaContentTasteItemUpdate *)v5 setUpdateDate:v7];

  [*(id *)(*(void *)(a1 + 32) + 72) setObject:v6 forKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 80) removeObjectForKey:*(void *)(a1 + 40)];
  id v8 = *(void **)(a1 + 32);
  v16[0] = v5;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E5BA89A8;
  id v10 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v10;
  id v11 = v5;
  uint64_t v14 = v11;
  id v15 = *(id *)(a1 + 48);
  [v8 _sendUpdateWithItemUpdates:v9 completionHandler:v12];
}

void __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_4;
  block[3] = &unk_1E5BA8958;
  block[4] = v4;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v6 = v3;
  id v17 = v6;
  dispatch_async(v5, block);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_5;
  v11[3] = &unk_1E5BA8980;
  v11[4] = v7;
  id v9 = *(id *)(a1 + 56);
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  dispatch_async(v8, v11);
}

uint64_t __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_4(void *a1)
{
  [*(id *)(a1[4] + 72) removeObjectForKey:a1[5]];
  if (![*(id *)(a1[4] + 72) count])
  {
    uint64_t v2 = a1[4];
    id v3 = *(void **)(v2 + 72);
    *(void *)(v2 + 72) = 0;
  }
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  return [v4 _contentTasteForItemUpdate:v5 finishedWithError:v6];
}

uint64_t __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSVMediaContentTasteControllerItemsDidChangeNotification" object:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)setContentTasteType:(unint64_t)a3 forStoreAdamID:(int64_t)a4 withContentType:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = v10;
  if (a4)
  {
    accessSerialQueue = self->_accessSerialQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5BA8A48;
    unint64_t v18 = a5;
    unint64_t v19 = a3;
    int64_t v17 = a4;
    v15[4] = self;
    id v16 = v10;
    dispatch_async(accessSerialQueue, v15);
    id v13 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if (v10)
  {
    calloutSerialQueue = self->_calloutSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke;
    block[3] = &unk_1E5BA8930;
    id v21 = v10;
    dispatch_async(calloutSerialQueue, block);
    id v13 = v21;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_2(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_alloc_init(SSVMediaContentTasteItemUpdate);
  id v3 = objc_alloc_init(SSVMutableMediaContentTasteItem);
  [(SSVMutableMediaContentTasteItem *)v3 setStoreAdamID:*(void *)(a1 + 48)];
  [(SSVMutableMediaContentTasteItem *)v3 setContentType:*(void *)(a1 + 56)];
  [(SSVMutableMediaContentTasteItem *)v3 setTasteType:*(void *)(a1 + 64)];
  [(SSVMediaContentTasteItemUpdate *)v2 setItem:v3];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [(SSVMediaContentTasteItemUpdate *)v2 setUpdateDate:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 96);
  uint64_t v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  [v5 setObject:v3 forKey:v6];

  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 80);
  id v8 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  [v7 removeObjectForKey:v8];

  id v9 = *(void **)(a1 + 32);
  v17[0] = v2;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_3;
  v13[3] = &unk_1E5BA8A20;
  uint64_t v11 = *(void *)(a1 + 48);
  v13[4] = *(void *)(a1 + 32);
  uint64_t v16 = v11;
  id v12 = v2;
  uint64_t v14 = v12;
  id v15 = *(id *)(a1 + 40);
  [v9 _sendUpdateWithItemUpdates:v10 completionHandler:v13];
}

void __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_4;
  block[3] = &unk_1E5BA89F8;
  uint64_t v6 = *(void *)(a1 + 56);
  void block[4] = v4;
  uint64_t v18 = v6;
  id v16 = *(id *)(a1 + 40);
  id v7 = v3;
  id v17 = v7;
  dispatch_async(v5, block);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_5;
  v12[3] = &unk_1E5BA8980;
  v12[4] = v8;
  id v10 = *(id *)(a1 + 48);
  id v13 = v7;
  id v14 = v10;
  id v11 = v7;
  dispatch_async(v9, v12);
}

uint64_t __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_4(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 96);
  id v3 = [NSNumber numberWithLongLong:a1[7]];
  [v2 removeObjectForKey:v3];

  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  return [v4 _contentTasteForItemUpdate:v5 finishedWithError:v6];
}

uint64_t __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSVMediaContentTasteControllerItemsDidChangeNotification" object:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_handleContentTasteItemsUpdateResponse:(id)a3 allowNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [v6 responseRevisionID];
  if (self->_currentResponseRevisionID < v7)
  {
    self->_currentResponseRevisionID = v7;
    [(NSMutableDictionary *)self->_storeAdamIDToContentTasteItem removeAllObjects];
    [(NSMutableDictionary *)self->_playlistGlobalIDToContentTasteItem removeAllObjects];
    BOOL v22 = v4;
    [v6 contentTasteItems];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v13 = [v12 playlistGlobalID];
          if ([v13 length])
          {
            playlistGlobalIDToContentTasteItem = self->_playlistGlobalIDToContentTasteItem;
            if (!playlistGlobalIDToContentTasteItem)
            {
              id v15 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
              id v16 = self->_playlistGlobalIDToContentTasteItem;
              self->_playlistGlobalIDToContentTasteItem = v15;

              playlistGlobalIDToContentTasteItem = self->_playlistGlobalIDToContentTasteItem;
            }
            [(NSMutableDictionary *)playlistGlobalIDToContentTasteItem setObject:v12 forKey:v13];
          }
          else
          {
            uint64_t v17 = [v12 storeAdamID];
            if (v17)
            {
              storeAdamIDToContentTasteItem = self->_storeAdamIDToContentTasteItem;
              unint64_t v19 = [NSNumber numberWithLongLong:v17];
              [(NSMutableDictionary *)storeAdamIDToContentTasteItem setObject:v12 forKey:v19];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    if (![(NSMutableDictionary *)self->_playlistGlobalIDToContentTasteItem count])
    {
      int v20 = self->_playlistGlobalIDToContentTasteItem;
      self->_playlistGlobalIDToContentTasteItem = 0;
    }
    if (v22)
    {
      calloutSerialQueue = self->_calloutSerialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__SSVMediaContentTasteController__handleContentTasteItemsUpdateResponse_allowNotifications___block_invoke;
      block[3] = &unk_1E5BA8A70;
      void block[4] = self;
      dispatch_async(calloutSerialQueue, block);
    }
  }
}

void __92__SSVMediaContentTasteController__handleContentTasteItemsUpdateResponse_allowNotifications___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSVMediaContentTasteControllerItemsDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_refreshContentTasteItems
{
  id v3 = objc_alloc_init(SSVMediaContentTasteUpdateRequest);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SSVMediaContentTasteController__refreshContentTasteItems__block_invoke;
  v4[3] = &unk_1E5BA8AC0;
  v4[4] = self;
  [(SSVMediaContentTasteUpdateRequest *)v3 startWithResponseBlock:v4];
}

void __59__SSVMediaContentTasteController__refreshContentTasteItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5 && !a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__SSVMediaContentTasteController__refreshContentTasteItems__block_invoke_2;
    v9[3] = &unk_1E5BA8A98;
    v9[4] = v7;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

uint64_t __59__SSVMediaContentTasteController__refreshContentTasteItems__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleContentTasteItemsUpdateResponse:*(void *)(a1 + 40) allowNotifications:1];
}

- (void)_contentTasteForItemUpdate:(id)a3 finishedWithError:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (!v6 || ![(SSVMediaContentTasteController *)self _isRetryableError:v6]) {
    goto LABEL_18;
  }
  uint64_t v7 = [v19 item];
  uint64_t v8 = [v7 storeAdamID];

  if (v8)
  {
    uint64_t v9 = NSNumber;
    id v10 = [v19 item];
    uint64_t v11 = objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v10, "storeAdamID"));
  }
  else
  {
    id v12 = [v19 item];
    id v13 = [v12 playlistGlobalID];

    if (!v13)
    {
      id v14 = 0;
      goto LABEL_11;
    }
    id v10 = [v19 item];
    uint64_t v11 = [v10 playlistGlobalID];
  }
  id v14 = (void *)v11;

  if (v14)
  {
    id v13 = [(NSMutableDictionary *)self->_contentTasteItemsToRetry objectForKey:v14];
    char v15 = 0;
    goto LABEL_12;
  }
  id v13 = 0;
LABEL_11:
  char v15 = 1;
LABEL_12:
  id v16 = [v19 updateDate];
  if (!v13
    || ([v13 updateDate],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v16 compare:v17],
        v17,
        v18 == 1))
  {
    if ((v15 & 1) == 0) {
      [(NSMutableDictionary *)self->_contentTasteItemsToRetry setObject:v19 forKey:v14];
    }
    [(SSVMediaContentTasteController *)self _scheduleContentTasteUpdateOperationForFailedItems];
  }

LABEL_18:
}

- (void)_retryOperationForItemUpdates:(id)a3 finishedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(SSVMediaContentTasteController *)self _isRetryableError:v7])
    {
      int exponentialBackOffSeconds = self->_exponentialBackOffSeconds;
      if (exponentialBackOffSeconds <= 1799) {
        int v9 = 2 * exponentialBackOffSeconds;
      }
      else {
        int v9 = 3600;
      }
      self->_int exponentialBackOffSeconds = v9;
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
      self->_int exponentialBackOffSeconds = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    self->_int exponentialBackOffSeconds = 120;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__SSVMediaContentTasteController__retryOperationForItemUpdates_finishedWithError___block_invoke;
  v11[3] = &unk_1E5BA8AE8;
  v11[4] = self;
  void v11[5] = v10;
  [v6 enumerateObjectsUsingBlock:v11];
}

void __82__SSVMediaContentTasteController__retryOperationForItemUpdates_finishedWithError___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 item];
  BOOL v4 = [v12 updateDate];
  if ([v3 storeAdamID])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "storeAdamID"));
  }
  else
  {
    id v6 = [v3 playlistGlobalID];

    if (!v6)
    {
LABEL_10:
      uint64_t v8 = 0;
      goto LABEL_11;
    }
    uint64_t v5 = [v3 playlistGlobalID];
  }
  id v6 = (void *)v5;
  if (!v5) {
    goto LABEL_10;
  }
  id v7 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v5];
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = [v7 updateDate];
    uint64_t v10 = [v4 compare:v9];

    if (v10 == 1)
    {
      uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 80);
      if (*(void *)(a1 + 40)) {
        [v11 setObject:v12 forKey:v6];
      }
      else {
        [v11 removeObjectForKey:v6];
      }
    }
  }
LABEL_11:
}

- (BOOL)_isRetryableError:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (!v5)
  {
    id v7 = [v3 domain];
    if ([v7 isEqualToString:@"SSErrorDomain"])
    {
      uint64_t v8 = [v3 code];

      if (v8 == 109)
      {
        int v9 = [v3 userInfo];
        uint64_t v10 = [v9 valueForKey:@"SSErrorHTTPStatusCodeKey"];
        BOOL v6 = [v10 integerValue] == 500;

        goto LABEL_8;
      }
    }
    else
    {
    }
    BOOL v6 = 0;
    goto LABEL_8;
  }
  BOOL v6 = (([v3 code] + 1009) & 0xFFFFFFFFFFFFFFF7) == 0;
LABEL_8:

  return v6;
}

- (void)_scheduleContentTasteUpdateOperationForFailedItems
{
  if (!self->_havePendingRetryOperation)
  {
    self->_havePendingRetryOperation = 1;
    dispatch_time_t v3 = dispatch_time(0, 1000000000 * self->_exponentialBackOffSeconds);
    accessSerialQueue = self->_accessSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke;
    block[3] = &unk_1E5BA8A70;
    void block[4] = self;
    dispatch_after(v3, accessSerialQueue, block);
  }
}

void __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    BOOL v4 = [*(id *)(v3 + 80) allValues];
    int v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "count"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_2;
    v11[3] = &unk_1E5BA8B10;
    id v6 = v5;
    id v12 = v6;
    [v4 enumerateObjectsUsingBlock:v11];
    id v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_3;
    v9[3] = &unk_1E5BA8B60;
    v9[4] = v7;
    id v8 = v6;
    id v10 = v8;
    [v7 _sendUpdateWithItemUpdates:v8 completionHandler:v9];
  }
  else
  {
    *(unsigned char *)(v3 + 40) = 0;
  }
}

void __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_alloc_init(SSVMediaContentTasteItemUpdate);
  BOOL v4 = [v7 item];
  int v5 = (void *)[v4 copy];
  [(SSVMediaContentTasteItemUpdate *)v3 setItem:v5];

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [(SSVMediaContentTasteItemUpdate *)v3 setUpdateDate:v6];

  [*(id *)(a1 + 32) addObject:v3];
}

void __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_4;
  block[3] = &unk_1E5BA8B38;
  void block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _retryOperationForItemUpdates:*(void *)(a1 + 40) finishedWithError:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _scheduleContentTasteUpdateOperationForFailedItems];
  }
  return result;
}

- (void)_sendUpdateWithItemUpdates:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ++self->_pendingMutateRequestCount;
  id v8 = objc_alloc_init(SSVMediaContentTasteUpdateRequest);
  [(SSVMediaContentTasteUpdateRequest *)v8 setContentTasteItemUpdates:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke;
  v10[3] = &unk_1E5BA8BB0;
  v10[4] = self;
  id v9 = v7;
  id v11 = v9;
  [(SSVMediaContentTasteUpdateRequest *)v8 startWithResponseBlock:v10];
}

void __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke_2;
  block[3] = &unk_1E5BA8B38;
  id v8 = v6;
  id v17 = v8;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 32);
  id v18 = v9;
  uint64_t v19 = v10;
  dispatch_async(v7, block);
  id v11 = *(void **)(a1 + 40);
  if (v11)
  {
    id v12 = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke_3;
    v13[3] = &unk_1E5BA8B88;
    id v15 = v11;
    id v14 = v8;
    dispatch_async(v12, v13);
  }
}

uint64_t __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (!*(void *)(result + 32))
  {
    uint64_t v2 = *(void *)(result + 40);
    if (v2) {
      uint64_t result = [*(id *)(result + 48) _handleContentTasteItemsUpdateResponse:v2 allowNotifications:0];
    }
  }
  uint64_t v3 = *(void *)(v1 + 48);
  uint64_t v4 = *(void *)(v3 + 56);
  BOOL v5 = v4 < 1;
  uint64_t v6 = v4 - 1;
  if (!v5)
  {
    *(void *)(v3 + 56) = v6;
    uint64_t result = *(void *)(v1 + 48);
    if (!*(void *)(result + 56) && *(void *)(result + 32) > *(void *)(result + 24))
    {
      return [(id)result _refreshContentTasteItems];
    }
  }
  return result;
}

uint64_t __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAdamIDToPendingContentTasteItem, 0);
  objc_storeStrong((id *)&self->_storeAdamIDToContentTasteItem, 0);
  objc_storeStrong((id *)&self->_contentTasteItemsToRetry, 0);
  objc_storeStrong((id *)&self->_playlistGlobalIDToPendingContentTasteItem, 0);
  objc_storeStrong((id *)&self->_playlistGlobalIDToContentTasteItem, 0);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end