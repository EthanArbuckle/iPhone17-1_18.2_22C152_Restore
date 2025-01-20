@interface SUScriptObject
+ (BOOL)isKeyExcludedFromWebScript:(const char *)a3;
+ (BOOL)isSelectorExcludedFromWebScript:(SEL)a3;
+ (id)webScriptNameForKey:(const char *)a3;
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)isVisible;
- (BOOL)scriptObjectIsCheckedIn:(id)a3;
- (BOOL)sourceIsTrusted;
- (NSMutableArray)scriptAttributeKeys;
- (NSString)_className;
- (OpaqueJSContext)copyJavaScriptContext;
- (SUClientInterface)clientInterface;
- (SUScriptNativeObject)nativeObject;
- (SUScriptObject)init;
- (SUScriptObject)parentScriptObject;
- (WebFrame)webFrame;
- (id)DOMElementWithElement:(id)a3;
- (id)_copyListenersForName:(id)a3;
- (id)copyObjectForScriptFromPoolWithClass:(Class)a3;
- (id)invocationBatch:(BOOL)a3;
- (id)newImageWithURL:(id)a3;
- (id)newImageWithURL:(id)a3 scale:(double)a4;
- (id)parentViewController;
- (id)viewControllerFactory;
- (id)webThreadMainThreadBatchProxy;
- (void)_checkOutAfterVisibilityChange;
- (void)addListenerForEventWithName:(id)a3 callback:(id)a4 useCapture:(BOOL)a5;
- (void)checkInScriptObject:(id)a3;
- (void)checkInScriptObjects:(id)a3;
- (void)checkOutBatchTarget:(id)a3;
- (void)checkOutScriptObject:(id)a3;
- (void)checkOutScriptObjects:(id)a3;
- (void)dealloc;
- (void)didPerformBatchedInvocations;
- (void)dispatchEvent:(id)a3 forName:(id)a4;
- (void)dispatchEvent:(id)a3 forName:(id)a4 synchronously:(BOOL)a5;
- (void)finalizeForWebScript;
- (void)loadImageWithURL:(id)a3 completionBlock:(id)a4;
- (void)lock;
- (void)removeListenerForEventWithName:(id)a3 callback:(id)a4 useCapture:(BOOL)a5;
- (void)setNativeObject:(id)a3;
- (void)setParentScriptObject:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)tearDownUserInterface;
- (void)unlock;
- (void)willPerformBatchedInvocations;
@end

@implementation SUScriptObject

- (SUScriptObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptObject;
  v2 = [(SUScriptObject *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(SUScriptObject *)self checkOutBatchTarget:self];
  [(SUScriptObjectInvocationBatch *)self->_invocationBatch setRootObject:0];
  invocationBatch = self->_invocationBatch;
  self->_invocationBatch = 0;

  lock = self->_lock;
  self->_lock = 0;

  eventListeners = self->_eventListeners;
  self->_eventListeners = 0;

  [(SUScriptNativeObject *)self->_nativeObject setScriptObject:0];
  nativeObject = self->_nativeObject;
  self->_nativeObject = 0;

  [(NSMutableSet *)self->_scriptObjects makeObjectsPerformSelector:sel_setParentScriptObject_ withObject:0];
  scriptObjects = self->_scriptObjects;
  self->_scriptObjects = 0;

  v8.receiver = self;
  v8.super_class = (Class)SUScriptObject;
  [(SUScriptObject *)&v8 dealloc];
}

- (void)checkInScriptObject:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = (id)objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);

  [(SUScriptObject *)self checkInScriptObjects:v6];
}

- (void)checkInScriptObjects:(id)a3
{
  id v4 = a3;
  [(SUScriptObject *)self lock];
  if (!self->_scriptObjects)
  {
    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    scriptObjects = self->_scriptObjects;
    self->_scriptObjects = v5;
  }
  [v4 makeObjectsPerformSelector:sel_setParentScriptObject_ withObject:self];
  [(NSMutableSet *)self->_scriptObjects addObjectsFromArray:v4];

  [(SUScriptObject *)self unlock];
}

- (void)checkOutScriptObject:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = (id)objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);

  [(SUScriptObject *)self checkOutScriptObjects:v6];
}

- (void)checkOutScriptObjects:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SUScriptObject *)self lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_scriptObjects, "containsObject:", v10, (void)v11))
        {
          [v10 setParentScriptObject:0];
          [(NSMutableSet *)self->_scriptObjects removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(SUScriptObject *)self unlock];
}

- (SUClientInterface)clientInterface
{
  v2 = [(SUScriptObject *)self parentScriptObject];
  v3 = [v2 clientInterface];

  return (SUClientInterface *)v3;
}

- (OpaqueJSContext)copyJavaScriptContext
{
  v2 = [(SUScriptObject *)self parentScriptObject];
  v3 = (OpaqueJSContext *)[v2 copyJavaScriptContext];

  return v3;
}

- (id)copyObjectForScriptFromPoolWithClass:(Class)a3
{
  id v5 = [(SUScriptObject *)self parentViewController];
  id v6 = (id)[v5 copyObjectForScriptFromPoolWithClass:a3];

  if (!v6) {
    id v6 = objc_alloc_init(a3);
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v7 = [(SUScriptObject *)self clientInterface];
    uint64_t v8 = [v7 appearance];
    [v8 styleBarButtonItem:v6];
  }
  return v6;
}

- (void)dispatchEvent:(id)a3 forName:(id)a4
{
}

- (void)dispatchEvent:(id)a3 forName:(id)a4 synchronously:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(SUScriptObject *)self _copyListenersForName:a4];
  if (v5 && (WebThreadIsCurrent() & 1) == 0) {
    WebThreadLock();
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", self, v8, 0);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        if (v5)
        {
          uint64_t v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) callback];
          id v17 = (id)[v16 callWebScriptMethod:@"call" withArguments:v10];
        }
        else
        {
          id v18 = v10;
          WebThreadRun();
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }
}

void __54__SUScriptObject_dispatchEvent_forName_synchronously___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) callback];
  id v2 = (id)[v3 callWebScriptMethod:@"call" withArguments:*(void *)(a1 + 40)];
}

- (id)DOMElementWithElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUScriptObject *)self parentScriptObject];
  id v6 = [v5 DOMElementWithElement:v4];

  return v6;
}

- (BOOL)isVisible
{
  [(SUScriptObject *)self lock];
  char v3 = *((unsigned char *)self + 56);
  [(SUScriptObject *)self unlock];
  if ((v3 & 2) != 0) {
    return 1;
  }
  id v4 = [(SUScriptObject *)self parentScriptObject];
  char v5 = [v4 isVisible];

  return v5;
}

- (void)loadImageWithURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F89528]);
  id v8 = +[ISDataProvider provider];
  [v7 setDataProvider:v8];

  [v7 setUrlKnownToBeTrusted:1];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:v5];
  [v9 setAllowedRetryCount:0];
  [v9 setTimeoutInterval:10.0];
  [v7 setRequestProperties:v9];
  v10 = [MEMORY[0x263F7B420] weakReferenceWithObject:v7];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __51__SUScriptObject_loadImageWithURL_completionBlock___block_invoke;
  v25 = &unk_264812420;
  id v11 = v10;
  id v26 = v11;
  id v12 = v6;
  id v27 = v12;
  [v7 setCompletionBlock:&v22];
  uint64_t v13 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  uint64_t v16 = [v13 OSLogObject];
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    v15 &= 2u;
  }
  if (!v15) {
    goto LABEL_9;
  }
  id v17 = objc_opt_class();
  int v28 = 138412546;
  v29 = v17;
  __int16 v30 = 2112;
  id v31 = v5;
  id v18 = v17;
  LODWORD(v21) = 22;
  long long v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v28, v21, v22, v23, v24, v25, v26);
    free(v19);
    SSFileLog();
LABEL_9:
  }
  long long v20 = [MEMORY[0x263F894E0] mainQueue];
  [v20 addOperation:v7];
}

void __51__SUScriptObject_loadImageWithURL_completionBlock___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) object];
  if ([v6 success])
  {
    id v2 = [v6 dataProvider];
    char v3 = [v2 output];
  }
  else
  {
    char v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [v6 error];
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);
}

- (void)lock
{
}

- (SUScriptNativeObject)nativeObject
{
  [(SUScriptObject *)self lock];
  char v3 = self->_nativeObject;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (id)newImageWithURL:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F1C920];
  id v5 = a3;
  id v6 = [v4 mainScreen];
  [v6 scale];
  id v7 = -[SUScriptObject newImageWithURL:scale:](self, "newImageWithURL:scale:", v5);

  return v7;
}

- (id)newImageWithURL:(id)a3 scale:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 scheme];
    uint64_t v9 = [v8 caseInsensitiveCompare:@"data"];

    if (v9)
    {
      v10 = [v7 host];

      if (!v10)
      {
        int v14 = 0;
        goto LABEL_11;
      }
      id v11 = [(SUScriptObject *)self webFrame];
      id v12 = [v11 dataSource];

      uint64_t v13 = [v12 subresourceForURL:v7];
      int v14 = [v13 data];

      if (!v14) {
        goto LABEL_7;
      }
LABEL_9:
      v10 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) _initWithData:v14 scale:a4];
      objc_setAssociatedObject(v10, "com.apple.iTunesStoreUI.SUScriptObject.imageURL", v7, (void *)0x303);
      goto LABEL_11;
    }
    int v14 = SUGetDataForDataURL((uint64_t)v7, 0);
    if (v14) {
      goto LABEL_9;
    }
  }
  else
  {
    int v14 = 0;
  }
LABEL_7:
  v10 = 0;
LABEL_11:

  return v10;
}

- (SUScriptObject)parentScriptObject
{
  [(SUScriptObject *)self lock];
  char v3 = self->_parentScriptObject;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (id)parentViewController
{
  id v2 = [(SUScriptObject *)self parentScriptObject];
  char v3 = [v2 parentViewController];

  return v3;
}

- (BOOL)scriptObjectIsCheckedIn:(id)a3
{
  id v4 = a3;
  [(SUScriptObject *)self lock];
  char v5 = [(NSMutableSet *)self->_scriptObjects containsObject:v4];
  [(SUScriptObject *)self unlock];
  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [(SUScriptObject *)self parentScriptObject];
    char v6 = [v7 scriptObjectIsCheckedIn:v4];
  }
  return v6;
}

- (void)setNativeObject:(id)a3
{
  char v6 = (SUScriptNativeObject *)a3;
  [(SUScriptObject *)self lock];
  nativeObject = self->_nativeObject;
  if (nativeObject != v6)
  {
    [(SUScriptNativeObject *)nativeObject setScriptObject:0];
    objc_storeStrong((id *)&self->_nativeObject, a3);
    [(SUScriptNativeObject *)self->_nativeObject setScriptObject:self];
  }
  [(SUScriptObject *)self unlock];
}

- (void)setParentScriptObject:(id)a3
{
  id v4 = (SUScriptObject *)a3;
  [(SUScriptObject *)self lock];
  parentScriptObject = self->_parentScriptObject;
  self->_parentScriptObject = v4;

  [(SUScriptObject *)self unlock];
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUScriptObject *)self lock];
  char v5 = *((unsigned char *)self + 56);
  if ((((v5 & 2) == 0) ^ v3))
  {
    [(SUScriptObject *)self unlock];
  }
  else
  {
    if (v3) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 56) = v5 & 0xFD | v6;
    [(SUScriptObject *)self unlock];
    if (!v3)
    {
      [(SUScriptObject *)self _checkOutAfterVisibilityChange];
    }
  }
}

- (BOOL)sourceIsTrusted
{
  id v2 = [(SUScriptObject *)self webFrame];
  BOOL v3 = [v2 dataSource];
  id v4 = [v3 mainResource];
  char v5 = [v4 URL];
  char v6 = [v5 scheme];
  char v7 = [v6 isEqualToString:@"https"];

  return v7;
}

- (void)tearDownUserInterface
{
  [(SUScriptObject *)self lock];
  id v4 = (id)[(NSMutableSet *)self->_scriptObjects copy];
  [(SUScriptObject *)self unlock];
  [v4 makeObjectsPerformSelector:a2];
}

- (void)unlock
{
}

- (id)viewControllerFactory
{
  BOOL v3 = [(SUScriptObject *)self parentViewController];
  id v4 = [v3 viewControllerFactory];

  if (!v4)
  {
    char v5 = [(SUScriptObject *)self clientInterface];
    id v4 = [v5 viewControllerFactory];
  }

  return v4;
}

- (WebFrame)webFrame
{
  id v2 = [(SUScriptObject *)self parentScriptObject];
  BOOL v3 = [v2 webFrame];

  return (WebFrame *)v3;
}

- (void)addListenerForEventWithName:(id)a3 callback:(id)a4 useCapture:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v10 = (void *)MEMORY[0x263F1FA90];
  if ((isKindOfClass & 1) == 0)
  {
    int v15 = @"Invalid event name";
LABEL_8:
    [v10 throwException:v15];
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x263F1FA90];
    int v15 = @"Invalid event callback";
    goto LABEL_8;
  }
  id v11 = objc_alloc_init(SUScriptEventListener);
  [(SUScriptEventListener *)v11 setCallback:v8];
  [(SUScriptEventListener *)v11 setName:v16];
  [(SUScriptEventListener *)v11 setShouldUseCapture:v5];
  [(SUScriptObject *)self lock];
  eventListeners = self->_eventListeners;
  if (!eventListeners)
  {
    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    int v14 = self->_eventListeners;
    self->_eventListeners = v13;

    eventListeners = self->_eventListeners;
  }
  [(NSMutableArray *)eventListeners addObject:v11];
  [(SUScriptObject *)self unlock];

LABEL_9:
}

- (void)removeListenerForEventWithName:(id)a3 callback:(id)a4 useCapture:(BOOL)a5
{
  int v5 = a5;
  id v18 = a3;
  id v8 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v10 = (void *)MEMORY[0x263F1FA90];
  if ((isKindOfClass & 1) == 0)
  {
    id v17 = @"Invalid event name";
LABEL_15:
    [v10 throwException:v17];
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x263F1FA90];
    id v17 = @"Invalid event callback";
    goto LABEL_15;
  }
  [(SUScriptObject *)self lock];
  uint64_t v11 = [(NSMutableArray *)self->_eventListeners count];
  if (v11 >= 1)
  {
    for (unint64_t i = v11 + 1; i > 1; --i)
    {
      uint64_t v13 = [(NSMutableArray *)self->_eventListeners objectAtIndex:i - 2];
      int v14 = [v13 name];
      if ([v14 isEqualToString:v18])
      {
        int v15 = [v13 callback];
        if ([v15 isEqual:v8])
        {
          int v16 = [v13 shouldUseCapture];

          if (v16 == v5)
          {
            [v13 setCallback:0];
            [(NSMutableArray *)self->_eventListeners removeObjectAtIndex:i - 2];
          }
          goto LABEL_11;
        }
      }
LABEL_11:
    }
  }
  [(SUScriptObject *)self unlock];
LABEL_16:
}

- (NSString)_className
{
  return (NSString *)@"iTunesObject";
}

- (void)_checkOutAfterVisibilityChange
{
  if ([(SUScriptObject *)self isVisible])
  {
    [0 makeObjectsPerformSelector:a2];
    id v4 = 0;
  }
  else
  {
    [(SUScriptObject *)self lock];
    char v5 = *((unsigned char *)self + 56);
    *((unsigned char *)self + 56) = v5 & 0xFE;
    id v7 = (id)[(NSMutableSet *)self->_scriptObjects copy];
    [(SUScriptObject *)self unlock];
    [v7 makeObjectsPerformSelector:a2];
    if (v5)
    {
      char v6 = [(SUScriptObject *)self parentScriptObject];
      [v6 checkOutScriptObject:self];
    }
    id v4 = v7;
  }
}

- (id)_copyListenersForName:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(SUScriptObject *)self lock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v6 = self->_eventListeners;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "name", (void)v15);
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(SUScriptObject *)self unlock];
  return v5;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)a3
{
  return 0;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)a3
{
  id v5 = objc_msgSend(a1, "webScriptNameForSelector:");

  if (v5) {
    return 0;
  }
  uint64_t v7 = NSStringFromSelector(a3);
  if ([v7 hasSuffix:@":"])
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v8 = [a1 webScriptNameForKeyName:v7];
    BOOL v6 = v8 == 0;
  }
  return v6;
}

+ (id)webScriptNameForKey:(const char *)a3
{
  id v4 = (void *)[[NSString alloc] initWithUTF8String:a3];
  id v5 = [a1 webScriptNameForKeyName:v4];

  return v5;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  return (id)[(id)__KeyMapping_8 objectForKey:a3];
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  return (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_6, 4);
}

- (NSMutableArray)scriptAttributeKeys
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v3 = [(id)__KeyMapping_8 allKeys];
  [v2 addObjectsFromArray:v3];

  return (NSMutableArray *)v2;
}

- (void)finalizeForWebScript
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUScriptObject_finalizeForWebScript__block_invoke;
  block[3] = &unk_2648123D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __38__SUScriptObject_finalizeForWebScript__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isVisible];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(v3 + 56);
  if (v2)
  {
    *(unsigned char *)(v3 + 56) = v4 | 1;
  }
  else
  {
    *(unsigned char *)(v3 + 56) = v4 & 0xFE;
    id v5 = [*(id *)(a1 + 32) parentScriptObject];
    [v5 checkOutScriptObject:*(void *)(a1 + 32)];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_6 = (uint64_t)sel_addListenerForEventWithName_callback_useCapture_;
    *(void *)algn_2681B4828 = @"addEventListener";
    qword_2681B4830 = (uint64_t)sel_equals_;
    unk_2681B4838 = @"equals";
    qword_2681B4840 = (uint64_t)sel_removeListenerForEventWithName_callback_useCapture_;
    unk_2681B4848 = @"removeEventListener";
    qword_2681B4850 = (uint64_t)sel_stringRepresentation;
    unk_2681B4858 = @"toString";
    __KeyMapping_8 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"className", @"_className", 0);
    MEMORY[0x270F9A758]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_scriptObjects, 0);
  objc_storeStrong((id *)&self->_parentScriptObject, 0);
  objc_storeStrong((id *)&self->_nativeObject, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_invocationBatch, 0);

  objc_storeStrong((id *)&self->_eventListeners, 0);
}

- (void)checkOutBatchTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(SUScriptObject *)self invocationBatch:0];
  [v5 checkOutBatchTarget:v4];
}

- (void)didPerformBatchedInvocations
{
  [(SUScriptObject *)self lock];
  id v4 = (id)[(NSMutableSet *)self->_scriptObjects copy];
  [(SUScriptObject *)self unlock];
  [v4 makeObjectsPerformSelector:a2];
}

- (id)invocationBatch:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUScriptObject *)self parentScriptObject];
  BOOL v6 = [v5 invocationBatch:v3];

  if (!v6)
  {
    [(SUScriptObject *)self lock];
    invocationBatch = self->_invocationBatch;
    if (invocationBatch) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !v3;
    }
    if (!v8)
    {
      uint64_t v9 = objc_alloc_init(SUScriptObjectInvocationBatch);
      v10 = self->_invocationBatch;
      self->_invocationBatch = v9;

      [(SUScriptObjectInvocationBatch *)self->_invocationBatch setRootObject:self];
      invocationBatch = self->_invocationBatch;
    }
    BOOL v6 = invocationBatch;
    [(SUScriptObject *)self unlock];
  }

  return v6;
}

- (id)webThreadMainThreadBatchProxy
{
  BOOL v3 = [(SUScriptObject *)self invocationBatch:1];
  id v4 = [v3 batchProxyForObject:self];

  return v4;
}

- (void)willPerformBatchedInvocations
{
  [(SUScriptObject *)self lock];
  id v4 = (id)[(NSMutableSet *)self->_scriptObjects copy];
  [(SUScriptObject *)self unlock];
  [v4 makeObjectsPerformSelector:a2];
}

@end