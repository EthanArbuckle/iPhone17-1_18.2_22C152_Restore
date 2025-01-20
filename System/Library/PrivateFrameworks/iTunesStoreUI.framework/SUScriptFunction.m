@interface SUScriptFunction
- (BOOL)callWithArguments:(id)a3;
- (BOOL)callWithArguments:(id)a3 completionBlock:(id)a4;
- (SUScriptFunction)init;
- (SUScriptFunction)initWithScriptObject:(id)a3;
- (WebScriptObject)scriptObject;
- (id)_copyAdjustedArgumentsForArguments:(id)a3;
- (id)callSynchronouslyWithArguments:(id)a3;
- (id)thisObject;
- (void)dealloc;
- (void)lock;
- (void)setScriptObject:(id)a3;
- (void)setThisObject:(id)a3;
- (void)unlock;
@end

@implementation SUScriptFunction

- (SUScriptFunction)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptFunction;
  v2 = [(SUScriptFunction *)&v4 init];
  if (v2) {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  }
  return v2;
}

- (SUScriptFunction)initWithScriptObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v4 = [(SUScriptFunction *)self init];
  if (v4)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        int v6 = [v5 shouldLog];
        if ([v5 shouldLogToDisk]) {
          int v7 = v6 | 2;
        }
        else {
          int v7 = v6;
        }
        if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_FAULT)) {
          v7 &= 2u;
        }
        if (v7)
        {
          int v14 = 138543618;
          uint64_t v15 = objc_opt_class();
          __int16 v16 = 2114;
          uint64_t v17 = objc_opt_class();
          LODWORD(v13) = 22;
          v12 = &v14;
          uint64_t v8 = _os_log_send_and_compose_impl();
          if (v8)
          {
            v9 = (void *)v8;
            uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v14, v13);
            free(v9);
            v12 = (int *)v10;
            SSFileLog();
          }
        }
        objc_msgSend(MEMORY[0x263F1FA90], "throwException:", @"Invalid argument", v12);
        a3 = 0;
      }
    }
    v4->_function = (WebScriptObject *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptFunction;
  [(SUScriptFunction *)&v3 dealloc];
}

- (BOOL)callWithArguments:(id)a3
{
  return [(SUScriptFunction *)self callWithArguments:a3 completionBlock:0];
}

- (BOOL)callWithArguments:(id)a3 completionBlock:(id)a4
{
  int v6 = [(SUScriptFunction *)self scriptObject];
  if (v6)
  {
    id v7 = [(SUScriptFunction *)self _copyAdjustedArgumentsForArguments:a3];
    WebThreadRun();
  }
  return v6 != 0;
}

void __54__SUScriptFunction_callWithArguments_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) callWebScriptMethod:@"call" withArguments:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __54__SUScriptFunction_callWithArguments_completionBlock___block_invoke_2;
    v4[3] = &unk_264812A00;
    v4[4] = v2;
    v4[5] = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

uint64_t __54__SUScriptFunction_callWithArguments_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)callSynchronouslyWithArguments:(id)a3
{
  id result = [(SUScriptFunction *)self scriptObject];
  if (result)
  {
    id v6 = result;
    if ((WebThreadIsCurrent() & 1) == 0) {
      WebThreadLock();
    }
    id v7 = [(SUScriptFunction *)self _copyAdjustedArgumentsForArguments:a3];
    uint64_t v8 = (void *)[v6 callWebScriptMethod:@"call" withArguments:v7];

    return v8;
  }
  return result;
}

- (void)lock
{
}

- (WebScriptObject)scriptObject
{
  [(SUScriptFunction *)self lock];
  uint64_t v3 = self->_function;
  [(SUScriptFunction *)self unlock];
  return v3;
}

- (void)setScriptObject:(id)a3
{
  [(SUScriptFunction *)self lock];
  function = self->_function;
  if (function != a3)
  {

    self->_function = (WebScriptObject *)a3;
  }

  [(SUScriptFunction *)self unlock];
}

- (void)setThisObject:(id)a3
{
  [(SUScriptFunction *)self lock];
  self->_thisObject = (SUScriptObject *)a3;

  [(SUScriptFunction *)self unlock];
}

- (id)thisObject
{
  [(SUScriptFunction *)self lock];
  uint64_t v3 = self->_thisObject;
  [(SUScriptFunction *)self unlock];
  return v3;
}

- (void)unlock
{
}

- (id)_copyAdjustedArgumentsForArguments:(id)a3
{
  id v5 = a3;
  id v6 = [(SUScriptFunction *)self thisObject];
  if (v6)
  {
    id v7 = v6;
    if (a3) {
      id v8 = (id)[a3 mutableCopy];
    }
    else {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    v9 = v8;
    [v8 insertObject:v7 atIndex:0];

    return v9;
  }
  return v5;
}

@end