@interface SSEntity
+ (int64_t)_existsMessage;
+ (int64_t)_getExternalValuesMessage;
+ (int64_t)_getValueMessage;
+ (int64_t)_setExternalValuesMessage;
+ (int64_t)_setValuesMessage;
- (BOOL)_isManaged;
- (BOOL)exists;
- (BOOL)isEqual:(id)a3;
- (BOOL)setExternalValuesWithDictionary:(id)a3;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (NSDictionary)_localExternalValues;
- (NSDictionary)_localValues;
- (NSString)description;
- (SSEntity)init;
- (id)_initWithPersistentIdentifier:(int64_t)a3;
- (id)copyXPCEncoding;
- (id)valueForExternalProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)_persistentIdentifier;
- (unint64_t)hash;
- (void)__addCachedExternalValues:(id)a3;
- (void)__addCachedPropertyValues:(id)a3;
- (void)_addCachedExternalValues:(id)a3;
- (void)_addCachedPropertyValues:(id)a3;
- (void)_becomeManagedOnConnection:(id)a3;
- (void)_getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5 message:(int64_t)a6;
- (void)_setDirtyCachedExternalProperties:(id)a3;
- (void)_setDirtyCachedProperties:(id)a3;
- (void)_setLocalExternalValues:(id)a3;
- (void)_setLocalValues:(id)a3;
- (void)dealloc;
- (void)getValues:(id *)a3 forExternalProperties:(const void *)a4 count:(unint64_t)a5;
- (void)getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5;
- (void)resetCachedExternalProperties:(const void *)a3 count:(unint64_t)a4;
- (void)resetCachedProperties:(const void *)a3 count:(unint64_t)a4;
@end

@implementation SSEntity

- (SSEntity)init
{
  CFUUIDRef v3 = CFUUIDCreate(0);
  uint64_t v4 = *(_OWORD *)&CFUUIDGetUUIDBytes(v3);
  CFRelease(v3);
  return (SSEntity *)[(SSEntity *)self _initWithPersistentIdentifier:v4];
}

- (id)_initWithPersistentIdentifier:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSEntity;
  uint64_t v4 = [(SSEntity *)&v6 init];
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSEntity", 0);
    v4->_pid = a3;
  }
  return v4;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)SSEntity;
  [(SSEntity *)&v4 dealloc];
}

- (BOOL)exists
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v6 = v5;
    }
    else {
      int v6 = v5 & 2;
    }
    if (v6)
    {
      LODWORD(v30) = 136446210;
      *(void *)((char *)&v30 + 4) = "-[SSEntity exists]";
      LODWORD(v23) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v30, v23);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  *(void *)&long long v30 = 0;
  *((void *)&v30 + 1) = &v30;
  uint64_t v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__32;
  v33 = __Block_byref_object_dispose__32;
  uint64_t v34 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__SSEntity_exists__block_invoke;
  block[3] = &unk_1E5BA7688;
  block[4] = self;
  block[5] = &v30;
  dispatch_sync(dispatchQueue, block);
  if (*(void *)(*((void *)&v30 + 1) + 40))
  {
    int64_t v17 = [(id)objc_opt_class() _existsMessage];
    if (v17)
    {
      xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v18, "0", v17);
      xpc_dictionary_set_int64(v18, "1", self->_pid);
      v19 = dispatch_semaphore_create(0);
      v20 = *(void **)(*((void *)&v30 + 1) + 40);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __18__SSEntity_exists__block_invoke_2;
      v24[3] = &unk_1E5BAB6E0;
      v24[4] = v19;
      v24[5] = &v26;
      [v20 sendMessage:v18 withReply:v24];
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v19);
      xpc_release(v18);
    }
  }
  char v21 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v26, 8);
  return v21;
}

id __18__SSEntity_exists__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

intptr_t __18__SSEntity_exists__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "0");
  }
  int v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

- (void)getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v9 = [(id)objc_opt_class() _getValueMessage];
  [(SSEntity *)self _getValues:a3 forProperties:a4 count:a5 message:v9];
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (!a3) {
    a3 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", a3, a4, 0);
  BOOL v9 = [(SSEntity *)self setValuesWithDictionary:v8];

  return v9;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  int64_t v17 = __Block_byref_object_copy__32;
  xpc_object_t v18 = __Block_byref_object_dispose__32;
  uint64_t v19 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SSEntity_setValuesWithDictionary___block_invoke;
  block[3] = &unk_1E5BAB708;
  block[4] = self;
  block[5] = a3;
  void block[6] = &v14;
  block[7] = &v20;
  dispatch_sync(dispatchQueue, block);
  if (v15[5])
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    int64_t v7 = [(id)objc_opt_class() _setValuesMessage];
    xpc_dictionary_set_int64(v6, "0", v7);
    xpc_dictionary_set_int64(v6, "1", self->_pid);
    SSXPCDictionarySetCFObject(v6, "2", (__CFString *)a3);
    v8 = dispatch_semaphore_create(0);
    BOOL v9 = (void *)v15[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__SSEntity_setValuesWithDictionary___block_invoke_2;
    v12[3] = &unk_1E5BAB6E0;
    v12[4] = v8;
    v12[5] = &v20;
    [v9 sendMessage:v6 withReply:v12];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
    xpc_release(v6);
  }
  char v10 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v10;
}

id __36__SSEntity_setValuesWithDictionary___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(void **)(v2 + 8);
  if (v3)
  {
    id result = v3;
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  }
  else
  {
    int v5 = *(void **)(v2 + 32);
    if (!v5)
    {
      *(void *)(a1[4] + 32) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v5 = *(void **)(a1[4] + 32);
    }
    id result = (id)[v5 addEntriesFromDictionary:a1[5]];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  return result;
}

intptr_t __36__SSEntity_setValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "0");
  }
  int v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

- (id)valueForProperty:(id)a3
{
  int v4 = 0;
  id v5 = a3;
  [(SSEntity *)self getValues:&v4 forProperties:&v5 count:1];
  return v4;
}

- (void)getValues:(id *)a3 forExternalProperties:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v9 = [(id)objc_opt_class() _getExternalValuesMessage];
  [(SSEntity *)self _getValues:a3 forProperties:a4 count:a5 message:v9];
}

- (void)resetCachedExternalProperties:(const void *)a3 count:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SSEntity_resetCachedExternalProperties_count___block_invoke;
  block[3] = &unk_1E5BAA0D0;
  block[4] = self;
  block[5] = a4;
  void block[6] = a3;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __48__SSEntity_resetCachedExternalProperties_count___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 8))
  {
    v1 = (void *)result;
    if (*(void *)(result + 40))
    {
      unint64_t v2 = 0;
      do
        id result = [*(id *)(v1[4] + 24) removeObjectForKey:*(void *)(v1[6] + 8 * v2++)];
      while (v2 < v1[5]);
    }
  }
  return result;
}

- (void)resetCachedProperties:(const void *)a3 count:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSEntity_resetCachedProperties_count___block_invoke;
  block[3] = &unk_1E5BAA0D0;
  block[4] = self;
  block[5] = a4;
  void block[6] = a3;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __40__SSEntity_resetCachedProperties_count___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 8))
  {
    v1 = (void *)result;
    if (*(void *)(result + 40))
    {
      unint64_t v2 = 0;
      do
        id result = [*(id *)(v1[4] + 32) removeObjectForKey:*(void *)(v1[6] + 8 * v2++)];
      while (v2 < v1[5]);
    }
  }
  return result;
}

- (BOOL)setExternalValuesWithDictionary:(id)a3
{
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  int64_t v17 = __Block_byref_object_copy__32;
  xpc_object_t v18 = __Block_byref_object_dispose__32;
  uint64_t v19 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SSEntity_setExternalValuesWithDictionary___block_invoke;
  block[3] = &unk_1E5BAB708;
  block[4] = self;
  block[5] = a3;
  void block[6] = &v14;
  void block[7] = &v20;
  dispatch_sync(dispatchQueue, block);
  if (v15[5])
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    int64_t v7 = [(id)objc_opt_class() _setExternalValuesMessage];
    xpc_dictionary_set_int64(v6, "0", v7);
    xpc_dictionary_set_int64(v6, "1", self->_pid);
    SSXPCDictionarySetCFObject(v6, "2", (__CFString *)a3);
    v8 = dispatch_semaphore_create(0);
    uint64_t v9 = (void *)v15[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__SSEntity_setExternalValuesWithDictionary___block_invoke_2;
    v12[3] = &unk_1E5BAB6E0;
    v12[4] = v8;
    v12[5] = &v20;
    [v9 sendMessage:v6 withReply:v12];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
    xpc_release(v6);
  }
  char v10 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v10;
}

id __44__SSEntity_setExternalValuesWithDictionary___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(void **)(v2 + 8);
  if (v3)
  {
    id result = v3;
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  }
  else
  {
    id v5 = *(void **)(v2 + 24);
    if (!v5)
    {
      *(void *)(a1[4] + 24) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v5 = *(void **)(a1[4] + 24);
    }
    id result = (id)[v5 addEntriesFromDictionary:a1[5]];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  return result;
}

intptr_t __44__SSEntity_setExternalValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "0");
  }
  int v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

- (id)valueForExternalProperty:(id)a3
{
  int v4 = 0;
  id v5 = a3;
  [(SSEntity *)self getValues:&v4 forExternalProperties:&v5 count:1];
  return v4;
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)SSEntity;
  return (NSString *)[NSString stringWithFormat:@"%@: %lld", -[SSEntity description](&v3, sel_description), self->_pid];
}

- (unint64_t)hash
{
  return self->_pid;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  int64_t v7 = [(SSEntity *)self _persistentIdentifier];
  return v7 == [a3 _persistentIdentifier];
}

+ (int64_t)_existsMessage
{
  return 0;
}

+ (int64_t)_getExternalValuesMessage
{
  return 0;
}

+ (int64_t)_getValueMessage
{
  return 0;
}

+ (int64_t)_setExternalValuesMessage
{
  return 0;
}

+ (int64_t)_setValuesMessage
{
  return 0;
}

- (void)_addCachedExternalValues:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SSEntity__addCachedExternalValues___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __37__SSEntity__addCachedExternalValues___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__addCachedExternalValues:", *(void *)(a1 + 40));
}

- (void)_addCachedPropertyValues:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SSEntity__addCachedPropertyValues___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __37__SSEntity__addCachedPropertyValues___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 32) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 addEntriesFromDictionary:v3];
}

- (void)_becomeManagedOnConnection:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSEntity__becomeManagedOnConnection___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __39__SSEntity__becomeManagedOnConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[1];
  if (v3 != *(void **)(a1 + 40))
  {

    *(void *)(*(void *)(a1 + 32) + 8) = *(id *)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 32);
  }
  return [v2 _resetLocalIVars];
}

- (NSDictionary)_localExternalValues
{
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__32;
  char v10 = __Block_byref_object_dispose__32;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SSEntity__localExternalValues__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSEntity__localExternalValues__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSDictionary)_localValues
{
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__32;
  char v10 = __Block_byref_object_dispose__32;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__SSEntity__localValues__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__SSEntity__localValues__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_isManaged
{
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__SSEntity__isManaged__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__SSEntity__isManaged__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) != 0;
  return result;
}

- (int64_t)_persistentIdentifier
{
  return self->_pid;
}

- (void)_setDirtyCachedExternalProperties:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SSEntity__setDirtyCachedExternalProperties___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __46__SSEntity__setDirtyCachedExternalProperties___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 48);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 48) = result;
  }
  return result;
}

- (void)_setDirtyCachedProperties:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__SSEntity__setDirtyCachedProperties___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __38__SSEntity__setDirtyCachedProperties___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 56);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 56) = result;
  }
  return result;
}

- (void)_setLocalExternalValues:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SSEntity__setLocalExternalValues___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __36__SSEntity__setLocalExternalValues___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 24);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) mutableCopy];
    *(void *)(*(void *)(v2 + 32) + 24) = result;
  }
  return result;
}

- (void)_setLocalValues:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__SSEntity__setLocalValues___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __28__SSEntity__setLocalValues___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 32);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) mutableCopy];
    *(void *)(*(void *)(v2 + 32) + 32) = result;
  }
  return result;
}

- (void)__addCachedExternalValues:(id)a3
{
  localExternalValues = self->_localExternalValues;
  if (!localExternalValues)
  {
    localExternalValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_localExternalValues = localExternalValues;
  }
  [(NSMutableDictionary *)localExternalValues addEntriesFromDictionary:a3];
}

- (void)__addCachedPropertyValues:(id)a3
{
  localValues = self->_localValues;
  if (!localValues)
  {
    localValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_localValues = localValues;
  }
  [(NSMutableDictionary *)localValues addEntriesFromDictionary:a3];
}

- (void)_getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5 message:(int64_t)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v11 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v14 = v13;
    }
    else {
      int v14 = v13 & 2;
    }
    if (v14)
    {
      LODWORD(v57) = 136446210;
      *(void *)((char *)&v57 + 4) = "-[SSEntity _getValues:forProperties:count:message:]";
      LODWORD(v41) = 12;
      v40 = &v57;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v57, v41);
        free(v16);
        SSFileLog(v11, @"%@", v18, v19, v20, v21, v22, v23, v17);
      }
    }
  }
  *(void *)&long long v57 = 0;
  *((void *)&v57 + 1) = &v57;
  uint64_t v58 = 0x3052000000;
  v59 = __Block_byref_object_copy__32;
  v60 = __Block_byref_object_dispose__32;
  uint64_t v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3052000000;
  v53 = __Block_byref_object_copy__32;
  v54 = __Block_byref_object_dispose__32;
  uint64_t v55 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SSEntity__getValues_forProperties_count_message___block_invoke;
  block[3] = &unk_1E5BAB730;
  void block[8] = a5;
  block[9] = a4;
  block[10] = a3;
  block[4] = self;
  block[5] = &v57;
  void block[6] = &v50;
  void block[7] = a6;
  dispatch_sync(dispatchQueue, block);
  if (*(void *)(*((void *)&v57 + 1) + 40))
  {
    xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v25, "0", a6);
    xpc_dictionary_set_int64(v25, "1", self->_pid);
    xpc_object_t v26 = xpc_array_create(0, 0);
    if (a5)
    {
      v27 = (__CFString **)a4;
      unint64_t v28 = a5;
      do
      {
        SSXPCArraySetCFObject(v26, 0xFFFFFFFFFFFFFFFFLL, *v27++);
        --v28;
      }
      while (v28);
    }
    v42 = self;
    int64_t v29 = a6;
    long long v30 = a4;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v31 = (void *)v51[5];
    uint64_t v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v56, 16, v40);
    if (v32)
    {
      uint64_t v33 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(v31);
          }
          SSXPCArraySetCFObject(v26, 0xFFFFFFFFFFFFFFFFLL, *(__CFString **)(*((void *)&v45 + 1) + 8 * i));
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v56 count:16];
      }
      while (v32);
    }
    xpc_dictionary_set_value(v25, "2", v26);
    xpc_release(v26);
    if (v51[5]) {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v35 = 0;
    }
    v36 = dispatch_semaphore_create(0);
    v37 = *(void **)(*((void *)&v57 + 1) + 40);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __51__SSEntity__getValues_forProperties_count_message___block_invoke_2;
    v44[3] = &unk_1E5BAB758;
    v44[6] = &v50;
    v44[7] = a5;
    v44[8] = a3;
    v44[4] = v35;
    v44[5] = v36;
    [v37 sendMessage:v25 withReply:v44];
    dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v36);
    if ([v35 count])
    {
      v38 = v42->_dispatchQueue;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __51__SSEntity__getValues_forProperties_count_message___block_invoke_3;
      v43[3] = &unk_1E5BAB7A8;
      v43[8] = a5;
      v43[9] = v30;
      v43[4] = v42;
      v43[5] = v35;
      v43[6] = &v50;
      v43[7] = v29;
      dispatch_sync(v38, v43);
    }

    xpc_release(v25);
  }
  for (; a5; --a5)
    id v39 = *a3++;

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v57, 8);
}

id __51__SSEntity__getValues_forProperties_count_message___block_invoke(void *a1)
{
  id v2 = (id)a1[7];
  id result = (id)[(id)objc_opt_class() _getValueMessage];
  if (v2 == result)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 32);
    if (*(void *)(v4 + 56))
    {
LABEL_3:
      id result = (id)objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
      uint64_t v6 = result;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  id v7 = (id)a1[7];
  id result = (id)[(id)objc_opt_class() _getExternalValuesMessage];
  if (v7 == result)
  {
    uint64_t v8 = a1[4];
    uint64_t v5 = *(void **)(v8 + 24);
    if (*(void *)(v8 + 48)) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = 0;
  uint64_t v5 = 0;
LABEL_8:
  if (a1[8])
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = *MEMORY[0x1E4F1D260];
    do
    {
      int v12 = [v6 containsObject:*(void *)(a1[9] + 8 * v9)];
      uint64_t v13 = *(void *)(a1[9] + 8 * v9);
      if (v12)
      {
        [v6 removeObject:v13];
        int v14 = 0;
      }
      else
      {
        uint64_t v15 = [v5 objectForKey:v13];
        if (v15) {
          ++v10;
        }
        if (v15 == v11) {
          int v14 = 0;
        }
        else {
          int v14 = (void *)v15;
        }
      }
      id result = v14;
      *(void *)(a1[10] + 8 * v9++) = result;
      unint64_t v16 = a1[8];
    }
    while (v9 < v16);
    if (v10 < v16)
    {
      *(void *)(*(void *)(a1[5] + 8) + 40) = *(id *)(a1[4] + 8);
      id result = (id)[v6 allObjects];
      *(void *)(*(void *)(a1[6] + 8) + 40) = result;
    }
  }
  return result;
}

intptr_t __51__SSEntity__getValues_forProperties_count_message___block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590])
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "0");
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    if (value)
    {
      uint64_t v9 = v8;
      if (MEMORY[0x1A62689E0](value) == MEMORY[0x1E4F14568])
      {
        uint64_t v10 = v9 + v7;
        if (xpc_array_get_count(value) == v9 + v7 && v10 != 0)
        {
          size_t v12 = 0;
          CFArrayRef v13 = (const __CFArray *)*MEMORY[0x1E4F1D260];
          do
          {
            CFDictionaryRef v14 = (const __CFDictionary *)xpc_array_get_value(value, v12);
            CFArrayRef v15 = SSXPCCreateCFObjectFromXPCObject(v14);
            CFArrayRef v16 = v15;
            if (v12 < *(void *)(a1 + 56) && v15 != v13)
            {

              *(void *)(*(void *)(a1 + 64) + 8 * v12) = v16;
            }
            [*(id *)(a1 + 32) addObject:v16];

            ++v12;
          }
          while (v10 != v12);
        }
      }
    }
  }
  uint64_t v4 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v4);
}

void __51__SSEntity__getValues_forProperties_count_message___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3 == [(id)objc_opt_class() _getValueMessage])
  {
    uint64_t v4 = 56;
LABEL_5:
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(*(void *)(a1 + 32) + v4)];

    *(void *)(*(void *)(a1 + 32) + v4) = 0;
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 == [(id)objc_opt_class() _getExternalValuesMessage])
  {
    uint64_t v4 = 48;
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_7:
  unint64_t v7 = *(void *)(a1 + 64);
  if (v7)
  {
    for (unint64_t i = 0; i < v7; ++i)
    {
      if ([v6 containsObject:*(void *)(*(void *)(a1 + 72) + 8 * i)]) {
        objc_msgSend(v2, "setObject:forKey:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", i), *(void *)(*(void *)(a1 + 72) + 8 * i));
      }
      unint64_t v7 = *(void *)(a1 + 64);
    }
  }
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__SSEntity__getValues_forProperties_count_message___block_invoke_4;
  v13[3] = &unk_1E5BAB780;
  uint64_t v10 = *(void *)(a1 + 40);
  v13[4] = v2;
  v13[5] = v10;
  v13[6] = v7;
  [v9 enumerateObjectsUsingBlock:v13];
  if ([v2 count])
  {
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11 == [(id)objc_opt_class() _getValueMessage])
    {
      objc_msgSend(*(id *)(a1 + 32), "__addCachedPropertyValues:", v2);
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 56);
      if (v12 == [(id)objc_opt_class() _getExternalValuesMessage]) {
        objc_msgSend(*(id *)(a1 + 32), "__addCachedExternalValues:", v2);
      }
    }
  }
}

uint64_t __51__SSEntity__getValues_forProperties_count_message___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) objectAtIndex:*(void *)(a1 + 48) + a3];
  return [v4 setObject:v5 forKey:a2];
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_pid);
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__SSEntity_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __27__SSEntity_copyXPCEncoding__block_invoke(uint64_t a1)
{
}

@end