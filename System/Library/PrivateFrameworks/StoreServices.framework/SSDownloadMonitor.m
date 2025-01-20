@interface SSDownloadMonitor
- (SSDownloadMonitor)init;
- (SSDownloadMonitorDelegate)delegate;
- (id)_connection;
- (id)_copyItemsWithReply:(id)a3 error:(id *)a4;
- (void)_reloadForChangeNotification;
- (void)dealloc;
- (void)getMonitorItemsWithCompletionBlock:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SSDownloadMonitor

- (SSDownloadMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)SSDownloadMonitor;
  v2 = [(SSDownloadMonitor *)&v9 init];
  if (v2)
  {
    v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSDownloadMonitor.%p", v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v3 UTF8String], 0);

    v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSDownloadMonitor.%p.delegate", v2);
    v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    v2->_delegateQueue = (OS_dispatch_queue *)v5;
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v5, global_queue);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__DownloadMonitorChanged, @"com.apple.itunesstored.downloadmonitorchanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunesstored.downloadmonitorchanged", 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue) {
    dispatch_release(delegateQueue);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadMonitor;
  [(SSDownloadMonitor *)&v6 dealloc];
}

- (SSDownloadMonitorDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  objc_super v9 = __Block_byref_object_copy__83;
  v10 = __Block_byref_object_dispose__83;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__SSDownloadMonitor_delegate__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSDownloadMonitorDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __29__SSDownloadMonitor_delegate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)getMonitorItemsWithCompletionBlock:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke;
  v4[3] = &unk_1E5BAA2E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = SSXPCCreateMessageDictionary(109);
  v3 = (void *)[*(id *)(a1 + 32) _connection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E5BA7750;
  long long v5 = *(_OWORD *)(a1 + 32);
  [v3 sendMessage:v2 withReply:v4];
  xpc_release(v2);
}

void __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = 0;
    v3 = (void *)[*(id *)(a1 + 32) _copyItemsWithReply:a2 error:&v7];
    v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E5BA8608;
    uint64_t v5 = *(void *)(a1 + 40);
    v6[4] = v3;
    v6[5] = v7;
    v6[6] = v5;
    dispatch_async(v4, v6);
  }
}

uint64_t __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setDelegate:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SSDownloadMonitor_setDelegate___block_invoke;
  v4[3] = &unk_1E5BA7448;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __33__SSDownloadMonitor_setDelegate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(result + 40);
  return result;
}

- (id)_connection
{
  id result = self->_connection;
  if (!result)
  {
    v4 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    self->_connection = v4;
    [(SSXPCConnection *)v4 setReplyQueue:self->_dispatchQueue];
    return self->_connection;
  }
  return result;
}

- (id)_copyItemsWithReply:(id)a3 error:(id *)a4
{
  if (a3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = 121;
LABEL_6:
    CFArrayRef v8 = (CFArrayRef)[v6 errorWithDomain:@"SSErrorDomain" code:v7 userInfo:0];
    id v9 = 0;
    if (!a4) {
      return v9;
    }
    goto LABEL_7;
  }
  if (!a3 || MEMORY[0x1A62689E0](a3, a2) != MEMORY[0x1E4F14590])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = 111;
    goto LABEL_6;
  }
  xpc_object_t value = xpc_dictionary_get_value(a3, "0");
  id v9 = value;
  if (value)
  {
    if (MEMORY[0x1A62689E0](value) == MEMORY[0x1E4F14568])
    {
      uint64_t v12 = objc_opt_class();
      id v9 = SSXPCCreateNSArrayFromXPCEncodedArray(v9, v12);
    }
    else
    {
      id v9 = 0;
    }
  }
  objc_opt_class();
  CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
  CFArrayRef v13 = v8;
  if (a4)
  {
LABEL_7:
    if (!v9) {
      *a4 = v8;
    }
  }
  return v9;
}

- (void)_reloadForChangeNotification
{
  if (objc_opt_respondsToSelector())
  {
    xpc_object_t v3 = SSXPCCreateMessageDictionary(109);
    id v4 = [(SSDownloadMonitor *)self _connection];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__SSDownloadMonitor__reloadForChangeNotification__block_invoke;
    v5[3] = &unk_1E5BAA290;
    v5[4] = self;
    [v4 sendMessage:v3 withReply:v5];
    xpc_release(v3);
  }
}

void __49__SSDownloadMonitor__reloadForChangeNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _copyItemsWithReply:a2 error:0];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSObject **)(v5 + 24);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__SSDownloadMonitor__reloadForChangeNotification__block_invoke_2;
    v7[3] = &unk_1E5BA7448;
    v7[4] = v5;
    v7[5] = v4;
    dispatch_async(v6, v7);
  }
}

uint64_t __49__SSDownloadMonitor__reloadForChangeNotification__block_invoke_2(uint64_t a1)
{
  xpc_object_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v2 downloadMonitor:v5 didReloadWithItems:v6];
  }
  return result;
}

@end