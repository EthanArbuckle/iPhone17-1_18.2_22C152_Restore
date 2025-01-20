@interface SUScriptOperation
+ (Class)postOperationClassForType:(id)a3;
+ (void)registerPostOperationClass:(Class)a3 forType:(id)a4;
- (SUScriptOperation)initWithOperation:(id)a3 callback:(id)a4;
- (SUScriptOperation)initWithOperation:(id)a3 options:(id)a4;
- (SUScriptOperation)initWithPostType:(id)a3 options:(id)a4;
- (id)_scriptOptions;
- (void)_sendCompletionCallback;
- (void)dealloc;
- (void)run;
- (void)setScriptOptions:(id)a3;
@end

@implementation SUScriptOperation

- (SUScriptOperation)initWithOperation:(id)a3 options:(id)a4
{
  v6 = [(SUScriptOperation *)self init];
  if (v6)
  {
    v6->_options = a4;
    v7 = (ISOperation *)a3;
    v6->_wrappedOperation = v7;
    [(ISOperation *)v7 setScriptOptions:v6->_options];
  }
  return v6;
}

- (SUScriptOperation)initWithOperation:(id)a3 callback:(id)a4
{
  v5 = [(SUScriptOperation *)self initWithOperation:a3 options:0];
  if (v5) {
    v5->_callbackFunction = (WebScriptObject *)a4;
  }
  return v5;
}

- (SUScriptOperation)initWithPostType:(id)a3 options:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v7 = (objc_class *)[(id)objc_opt_class() postOperationClassForType:a3];
  if (v7)
  {
    id v8 = objc_alloc_init(v7);
    v9 = [(SUScriptOperation *)self initWithOperation:v8 options:a4];

    return v9;
  }
  else
  {
    v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      int v17 = 138412546;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 2112;
      id v20 = a3;
      LODWORD(v16) = 22;
      uint64_t v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v17, v16);
        free(v15);
        SSFileLog();
      }
    }

    return 0;
  }
}

- (void)dealloc
{
  self->_options = 0;
  self->_wrappedOperation = 0;

  self->_callbackFunction = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptOperation;
  [(SUScriptOperation *)&v3 dealloc];
}

+ (Class)postOperationClassForType:(id)a3
{
  _os_nospin_lock_lock();
  v4 = (objc_class *)(id)[(id)__OperationClasses objectForKey:a3];
  _os_nospin_lock_unlock();
  return v4;
}

+ (void)registerPostOperationClass:(Class)a3 forType:(id)a4
{
  _os_nospin_lock_lock();
  id v6 = (id)__OperationClasses;
  if (__OperationClasses)
  {
    if (a3)
    {
LABEL_3:
      [v6 setObject:a3 forKey:a4];
      goto LABEL_6;
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    __OperationClasses = (uint64_t)v6;
    if (a3) {
      goto LABEL_3;
    }
  }
  [v6 removeObjectForKey:a4];
LABEL_6:

  _os_nospin_lock_unlock();
}

- (void)run
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v5 &= 2u;
  }
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    wrappedOperation = self->_wrappedOperation;
    int v22 = 138412546;
    uint64_t v23 = v6;
    __int16 v24 = 2112;
    v25 = wrappedOperation;
    LODWORD(v20) = 22;
    uint64_t v18 = &v22;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v22, v20);
      free(v9);
      uint64_t v18 = (int *)v10;
      SSFileLog();
    }
  }
  uint64_t v21 = 0;
  if (-[SUScriptOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", self->_wrappedOperation, &v21, v18))
  {
    [(SUScriptOperation *)self setSuccess:1];
  }
  else
  {
    v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v13 &= 2u;
    }
    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      int v22 = 138412546;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      v25 = v21;
      LODWORD(v20) = 22;
      __int16 v19 = &v22;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v22, v20);
        free(v16);
        __int16 v19 = (int *)v17;
        SSFileLog();
      }
    }
    -[SUScriptOperation setError:](self, "setError:", v21, v19);
  }
  [(SUScriptOperation *)self performSelectorOnMainThread:sel__sendCompletionCallback withObject:0 waitUntilDone:1];
}

- (void)setScriptOptions:(id)a3
{
  [(SUScriptOperation *)self lock];
  id options = self->_options;
  if (options != a3)
  {

    self->_id options = a3;
  }

  [(SUScriptOperation *)self unlock];
}

- (id)_scriptOptions
{
  [(SUScriptOperation *)self lock];
  id v3 = self->_options;
  [(SUScriptOperation *)self unlock];
  return v3;
}

- (void)_sendCompletionCallback
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(SUScriptOperation *)self _scriptOptions];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (!self->_callbackFunction)
    {
      int v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v5 = [v4 shouldLog];
      if ([v4 shouldLogToDisk]) {
        int v6 = v5 | 2;
      }
      else {
        int v6 = v5;
      }
      if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v6 &= 2u;
      }
      if (v6)
      {
        *(_DWORD *)v28 = 138412290;
        *(void *)&v28[4] = objc_opt_class();
        LODWORD(v27) = 12;
        uint64_t v26 = v28;
        uint64_t v7 = _os_log_send_and_compose_impl();
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, v28, v27);
          free(v8);
          uint64_t v26 = (unsigned char *)v9;
          SSFileLog();
        }
      }
      self->_callbackFunction = (WebScriptObject *)(id)objc_msgSend(v3, "safeValueForKey:", @"completionCallback", v26);
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v13 &= 2u;
    }
    if (isKindOfClass)
    {
      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        int v15 = [(SUScriptOperation *)self success];
        *(_DWORD *)v28 = 138412546;
        *(void *)&v28[4] = v14;
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = v15;
        LODWORD(v27) = 18;
        uint64_t v26 = v28;
        uint64_t v16 = _os_log_send_and_compose_impl();
        if (v16)
        {
          uint64_t v17 = (void *)v16;
          uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v28, v27);
          free(v17);
          uint64_t v26 = (unsigned char *)v18;
          SSFileLog();
        }
      }
      wrappedOperation = (SUScriptOperation *)self->_wrappedOperation;
      if (!wrappedOperation) {
        wrappedOperation = self;
      }
      -[ISOperation sendCompletionCallback:](wrappedOperation, "sendCompletionCallback:", self->_callbackFunction, v26);
      return;
    }
    if (!v13) {
      return;
    }
    uint64_t v20 = objc_opt_class();
    *(_DWORD *)v28 = 138412290;
    *(void *)&v28[4] = v20;
    LODWORD(v27) = 12;
    goto LABEL_34;
  }
  uint64_t v21 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v22 = [v21 shouldLog];
  if ([v21 shouldLogToDisk]) {
    int v23 = v22 | 2;
  }
  else {
    int v23 = v22;
  }
  if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v23 &= 2u;
  }
  if (v23)
  {
    *(_DWORD *)v28 = 138412290;
    *(void *)&v28[4] = objc_opt_class();
    LODWORD(v27) = 12;
LABEL_34:
    uint64_t v24 = _os_log_send_and_compose_impl();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, v28, v27, *(_OWORD *)v28);
      free(v25);
      SSFileLog();
    }
  }
}

@end