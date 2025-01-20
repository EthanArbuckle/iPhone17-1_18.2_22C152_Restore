@interface ICUserNotificationManager
+ (ICUserNotificationManager)sharedManager;
- (ICUserNotificationManager)init;
- (void)_handleCallbackForUserNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)displayUserNotification:(__CFUserNotification *)a3 withCompletionHandler:(id)a4;
@end

@implementation ICUserNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_contextForUserNotification, 0);
}

- (void)_handleCallbackForUserNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__ICUserNotificationManager__handleCallbackForUserNotification_responseFlags___block_invoke;
  v5[3] = &unk_1E5ACA7A8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a2;
  v5[7] = a4;
  dispatch_async(accessQueue, v5);
}

void __78__ICUserNotificationManager__handleCallbackForUserNotification_responseFlags___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  if (!v2)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a1[6], a1[4], @"ICUserNotificationManager.m", 85, @"no dialog info for user notification %@", a1[5] object file lineNumber description];
  }
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  [v2 clearRunLoop];
  v3 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ICUserNotificationManager__handleCallbackForUserNotification_responseFlags___block_invoke_2;
  block[3] = &unk_1E5ACCD30;
  uint64_t v4 = a1[7];
  id v8 = v2;
  uint64_t v9 = v4;
  id v5 = v2;
  dispatch_async(v3, block);
}

void __78__ICUserNotificationManager__handleCallbackForUserNotification_responseFlags___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), 0);
}

- (void)displayUserNotification:(__CFUserNotification *)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ICUserNotificationManager_displayUserNotification_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5ACA780;
  id v10 = v6;
  v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

void __75__ICUserNotificationManager_displayUserNotification_withCompletionHandler___block_invoke(uint64_t a1)
{
  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, *(CFUserNotificationRef *)(a1 + 48), (CFUserNotificationCallBack)_UserNotificationCallback, 0);
  if (RunLoopSource)
  {
    v3 = RunLoopSource;
    v7 = objc_alloc_init(ICUserNotificationContext);
    [(ICUserNotificationContext *)v7 setRunLoopSourceRef:v3];
    [(ICUserNotificationContext *)v7 setCompletionHandler:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v7 forKey:*(void *)(a1 + 48)];
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v3, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  }
  else
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__ICUserNotificationManager_displayUserNotification_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5ACA758;
    *(_OWORD *)id v8 = *(_OWORD *)(a1 + 40);
    id v6 = v8[0];
    long long v10 = *(_OWORD *)v8;
    dispatch_async(v5, block);
  }
}

void __75__ICUserNotificationManager_displayUserNotification_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  SInt32 v2 = CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 40), 3600.0, &responseFlags);
  uint64_t v3 = *(void *)(a1 + 32);
  CFOptionFlags v4 = responseFlags;
  if (v2)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7003 userInfo:0];
    (*(void (**)(uint64_t, CFOptionFlags, void *))(v3 + 16))(v3, v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t, CFOptionFlags, void))(v3 + 16))(v3, responseFlags, 0);
  }
}

- (ICUserNotificationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ICUserNotificationManager;
  SInt32 v2 = [(ICUserNotificationManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:2];
    contextForUserNotification = v2->_contextForUserNotification;
    v2->_contextForUserNotification = (NSMapTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICUserNotificationManager.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICUserNotificationManager.notification", MEMORY[0x1E4F14430]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (ICUserNotificationManager)sharedManager
{
  if (sharedManager_sOnceToken_28109 != -1) {
    dispatch_once(&sharedManager_sOnceToken_28109, &__block_literal_global_28110);
  }
  SInt32 v2 = (void *)sharedManager_sSharedManager_28111;

  return (ICUserNotificationManager *)v2;
}

uint64_t __42__ICUserNotificationManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(ICUserNotificationManager);
  uint64_t v1 = sharedManager_sSharedManager_28111;
  sharedManager_sSharedManager_28111 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end