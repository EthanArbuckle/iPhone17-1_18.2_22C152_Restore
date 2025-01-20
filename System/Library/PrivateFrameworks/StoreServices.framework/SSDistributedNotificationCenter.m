@interface SSDistributedNotificationCenter
- (NSString)namedPort;
- (SSDistributedNotificationCenter)init;
- (SSDistributedNotificationCenter)initWithNamedPort:(id)a3;
- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5;
- (void)_distributedNotificationMessage:(id)a3 connection:(id)a4;
- (void)_sendRegistrationMessage:(int64_t)a3 name:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation SSDistributedNotificationCenter

- (SSDistributedNotificationCenter)init
{
  return [(SSDistributedNotificationCenter *)self initWithNamedPort:0];
}

- (SSDistributedNotificationCenter)initWithNamedPort:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v23 = 136446210;
      v24 = "-[SSDistributedNotificationCenter initWithNamedPort:]";
      LODWORD(v21) = 12;
      v20 = &v23;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v23, v21);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  if (objc_msgSend(a3, "length", v20))
  {
    v22.receiver = self;
    v22.super_class = (Class)SSDistributedNotificationCenter;
    v18 = [(SSDistributedNotificationCenter *)&v22 init];
    if (v18)
    {
      v18->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSDistributedNotificationCenter", 0);
      v18->_observers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v18->_portName = (NSString *)[a3 copy];
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid port name"];
    return 0;
  }
  return v18;
}

- (void)dealloc
{
  [(SSXPCServer *)self->_server removeObserver:self selector:sel__distributedNotificationMessage_connection_ forMessage:1009];

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)SSDistributedNotificationCenter;
  [(SSDistributedNotificationCenter *)&v4 dealloc];
}

- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v9 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v12 = v11;
    }
    else {
      int v12 = v11 & 2;
    }
    if (v12)
    {
      LODWORD(v28) = 136446210;
      *(void *)((char *)&v28 + 4) = "-[SSDistributedNotificationCenter addObserverForName:queue:usingBlock:]";
      LODWORD(v26) = 12;
      uint64_t v25 = &v28;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v28, v26);
        free(v14);
        SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
  if (!objc_msgSend(a3, "length", v25))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid name"];
LABEL_21:
    objc_super v22 = 0;
    return v22;
  }
  if (!a5)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid block"];
    goto LABEL_21;
  }
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = &v28;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  objc_super v22 = [[SSDistributedNotificationCenterObserver alloc] initWithName:a3 queue:a4 block:a5];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SSDistributedNotificationCenter_addObserverForName_queue_usingBlock___block_invoke;
  block[3] = &unk_1E5BABD40;
  block[4] = self;
  block[5] = a3;
  block[6] = v22;
  block[7] = &v28;
  dispatch_sync(dispatchQueue, block);
  if (*(unsigned char *)(*((void *)&v28 + 1) + 24)) {
    [(SSDistributedNotificationCenter *)self _sendRegistrationMessage:42 name:a3];
  }
  _Block_object_dispose(&v28, 8);
  return v22;
}

uint64_t __71__SSDistributedNotificationCenter_addObserverForName_queue_usingBlock___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 32))
  {
    *(void *)(a1[4] + 32) = [[SSXPCServer alloc] initWithServiceName:*(void *)(a1[4] + 24) entitlement:0 queue:*(void *)(a1[4] + 8)];
    [*(id *)(a1[4] + 32) addObserver:a1[4] selector:sel__distributedNotificationMessage_connection_ forMessage:1009];
    uint64_t v2 = a1[4];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = *(void **)(v2 + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "name"), "isEqualToString:", a1[5]))
        {
          *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
          return [*(id *)(a1[4] + 16) addObject:a1[6]];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  return [*(id *)(a1[4] + 16) addObject:a1[6]];
}

- (NSString)namedPort
{
  uint64_t v2 = self->_portName;
  return v2;
}

- (void)removeObserver:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      LODWORD(v25) = 136446210;
      *(void *)((char *)&v25 + 4) = "-[SSDistributedNotificationCenter removeObserver:]";
      LODWORD(v19) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        long long v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v25, v19);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = &v25;
  uint64_t v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__38;
  long long v28 = __Block_byref_object_dispose__38;
  uint64_t v29 = 0;
  uint64_t v21 = 0;
  objc_super v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SSDistributedNotificationCenter_removeObserver___block_invoke;
  block[3] = &unk_1E5BABD68;
  block[4] = self;
  block[5] = a3;
  block[6] = &v25;
  block[7] = &v21;
  dispatch_sync(dispatchQueue, block);
  if (*((unsigned char *)v22 + 24)) {
    [(SSDistributedNotificationCenter *)self _sendRegistrationMessage:43 name:*(void *)(*((void *)&v25 + 1) + 40)];
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

uint64_t __50__SSDistributedNotificationCenter_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) indexOfObjectIdenticalTo:*(void *)(a1 + 40)];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = result;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[*(id *)(a1 + 40) name];
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectAtIndex:v3];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v9;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "name"), "isEqualToString:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
          if (result)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            return result;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v5 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (void)_distributedNotificationMessage:(id)a3 connection:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  CFArrayRef v6 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
  if ([(__CFArray *)v6 length])
  {
    uint64_t v7 = self;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    observers = self->_observers;
    uint64_t v9 = [(NSMutableArray *)observers countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(observers);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v13, "name"), "isEqualToString:", v6))
          {
            global_queue = [v13 dispatchQueue];
            if (global_queue || (global_queue = dispatch_get_global_queue(0, 0)) != 0) {
              dispatch_async(global_queue, (dispatch_block_t)[v13 block]);
            }
          }
        }
        uint64_t v10 = [(NSMutableArray *)observers countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)_sendRegistrationMessage:(int64_t)a3 name:(id)a4
{
  uint64_t v7 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, "0", a3);
  SSXPCDictionarySetCFObject(v8, "1", (__CFString *)self->_portName);
  SSXPCDictionarySetCFObject(v8, "2", (__CFString *)a4);
  uint64_t v9 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SSDistributedNotificationCenter__sendRegistrationMessage_name___block_invoke;
  v10[3] = &unk_1E5BAA290;
  v10[4] = v9;
  [(SSXPCConnection *)v7 sendMessage:v8 withReply:v10];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  xpc_release(v8);
}

intptr_t __65__SSDistributedNotificationCenter__sendRegistrationMessage_name___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end