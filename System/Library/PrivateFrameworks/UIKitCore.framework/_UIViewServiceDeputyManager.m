@interface _UIViewServiceDeputyManager
+ (id)exportedInterfaceSupportingDeputyInterfaces:(id)a3;
+ (void)initialize;
- (Class)_deputyClassForConnectionSelector:(SEL)a3;
- (_UIViewServiceDeputyManager)init;
- (id)delegate;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)__requestConnectionToDeputyOfClass:(Class)a3 fromHostObject:(id)a4 replyHandler:(id)a5;
- (void)_invalidateUnconditionallyThen:(id)a3;
- (void)_objc_initiateDealloc;
- (void)checkDeputyForRotation:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)invalidate;
- (void)registerDeputyClass:(Class)a3 withConnectionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)unregisterDeputyClass:(Class)a3;
- (void)viewControllerOperator:(id)a3 didCreateServiceViewControllerOfClass:(Class)a4;
@end

@implementation _UIViewServiceDeputyManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _class_setCustomDeallocInitiation();
  }
}

- (void)_objc_initiateDealloc
{
  id v3 = [(_UIAsyncInvocation *)self->_invalidationInvocation invoke];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52___UIViewServiceDeputyManager__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v4[4] = self;
  [v3 whenCompleteDo:v4];
}

- (_UIViewServiceDeputyManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIViewServiceDeputyManager;
  v2 = [(_UIViewServiceDeputyManager *)&v8 init];
  if (v2)
  {
    id v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = (const char *)[(id)objc_msgSend(v3 stringWithFormat:@"com.apple.uikit.%@ %p", NSStringFromClass(v4), v2), "UTF8String"];
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create(v5, 0);
    v2->_connectionHandlers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_connectionHandlersLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v2->_deputies = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35___UIViewServiceDeputyManager_init__block_invoke;
    v7[3] = &__block_descriptor_40_e14_v16__0___v___8ls32l8;
    v7[4] = v2;
    v2->_invalidationInvocation = +[_UIAsyncInvocation invocationWithBlock:v7];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);

  self->_deputies = 0;
  self->_connectionHandlers = 0;

  self->_connectionHandlersLock = 0;
  self->_invalidationInvocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceDeputyManager;
  [(_UIViewServiceDeputyManager *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)_invalidateUnconditionallyThen:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke;
  v4[3] = &unk_1E530DB88;
  v4[4] = a3;
  void v4[5] = self;
  dispatch_async(queue, v4);
}

+ (id)exportedInterfaceSupportingDeputyInterfaces:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "connectionProtocol"));
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
  [v4 addObject:&unk_1ED701A20];
  v9 = (void *)[MEMORY[0x1E4F29280] interfaceWithProtocol:_UIProtocolConformingToProtocols(v4)];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(a3);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        uint64_t v15 = [v14 hostObjectInterface];
        if (v15) {
          objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v15, objc_msgSend(v14, "connectionSelector"), 0, 0);
        }
        uint64_t v16 = [v14 exportedInterface];
        if (v16) {
          objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v16, objc_msgSend(v14, "connectionSelector"), 0, 1);
        }
      }
      uint64_t v11 = [a3 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v11);
  }
  return v9;
}

- (Class)_deputyClassForConnectionSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_connectionHandlersLock lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  connectionHandlers = self->_connectionHandlers;
  uint64_t v6 = [(NSMutableDictionary *)connectionHandlers countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(connectionHandlers);
      }
      Class v10 = NSClassFromString(*(NSString **)(*((void *)&v12 + 1) + 8 * v9));
      if (sel_isEqual(a3, (SEL)objc_msgSend((id)-[objc_class XPCInterface](v10, "XPCInterface"), "connectionSelector"))) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableDictionary *)connectionHandlers countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    Class v10 = 0;
  }
  [(NSLock *)self->_connectionHandlersLock unlock];
  return v10;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result = [(_UIViewServiceDeputyManager *)self _deputyClassForConnectionSelector:a3];
  if (result)
  {
    v4 = objc_opt_class();
    return (id)[v4 instanceMethodSignatureForSelector:sel___prototype_requestConnectionToDeputyFromHostObject_replyHandler_];
  }
  return result;
}

- (void)__requestConnectionToDeputyOfClass:(Class)a3 fromHostObject:(id)a4 replyHandler:(id)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke;
  block[3] = &unk_1E530DFE8;
  block[4] = self;
  block[5] = a3;
  block[7] = a5;
  block[8] = a2;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v5 = -[_UIViewServiceDeputyManager _deputyClassForConnectionSelector:](self, "_deputyClassForConnectionSelector:", [a3 selector]);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    [a3 getArgument:&v8 atIndex:2];
    [a3 getArgument:&v7 atIndex:3];
    [(_UIViewServiceDeputyManager *)self __requestConnectionToDeputyOfClass:v6 fromHostObject:v8 replyHandler:v7];
  }
}

- (void)registerDeputyClass:(Class)a3 withConnectionHandler:(id)a4
{
  uint64_t v8 = NSStringFromClass(a3);
  [(NSLock *)self->_connectionHandlersLock lock];
  if ([(NSMutableDictionary *)self->_connectionHandlers objectForKey:v8])
  {
    uint64_t v9 = objc_opt_class();
    Class v10 = NSStringFromSelector(a2);
    NSLog(&cfstr_Newdeputyclass.isa, v9, v10, a3);
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_connectionHandlers, "setObject:forKey:", (id)[a4 copy], v8);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_connectionHandlers, "count"));
      connectionHandlers = self->_connectionHandlers;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __73___UIViewServiceDeputyManager_registerDeputyClass_withConnectionHandler___block_invoke;
      v13[3] = &unk_1E530E010;
      v13[4] = v11;
      [(NSMutableDictionary *)connectionHandlers enumerateKeysAndObjectsUsingBlock:v13];
      objc_msgSend(self->_delegate, "deputyManager:didUpdateExportedInterface:", self, objc_msgSend((id)objc_opt_class(), "exportedInterfaceSupportingDeputyInterfaces:", v11));
    }
  }
  [(NSLock *)self->_connectionHandlersLock unlock];
}

- (void)unregisterDeputyClass:(Class)a3
{
  [(NSLock *)self->_connectionHandlersLock lock];
  uint64_t v5 = NSStringFromClass(a3);
  id v6 = (id)[(NSMutableDictionary *)self->_connectionHandlers objectForKey:v5];
  [(NSMutableDictionary *)self->_connectionHandlers removeObjectForKey:v5];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_connectionHandlers, "count"));
    connectionHandlers = self->_connectionHandlers;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53___UIViewServiceDeputyManager_unregisterDeputyClass___block_invoke;
    v9[3] = &unk_1E530E010;
    v9[4] = v7;
    [(NSMutableDictionary *)connectionHandlers enumerateKeysAndObjectsUsingBlock:v9];
    objc_msgSend(self->_delegate, "deputyManager:didUpdateExportedInterface:", self, objc_msgSend((id)objc_opt_class(), "exportedInterfaceSupportingDeputyInterfaces:", v7));
  }
  [(NSLock *)self->_connectionHandlersLock unlock];
}

- (void)checkDeputyForRotation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([a3 conformsToProtocol:&unk_1ED689058])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    deputies = self->_deputies;
    uint64_t v6 = [(NSMutableSet *)deputies countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(deputies);
          }
          Class v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v10 conformsToProtocol:&unk_1ED6872C0]) {
            [a3 addDeputyRotationDelegate:v10];
          }
        }
        uint64_t v7 = [(NSMutableSet *)deputies countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
  }
  if ([a3 conformsToProtocol:&unk_1ED6872C0])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = self->_deputies;
    uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * j);
          if ([v16 conformsToProtocol:&unk_1ED689058]) {
            [v16 addDeputyRotationDelegate:a3];
          }
        }
        uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
  }
}

- (void)viewControllerOperator:(id)a3 didCreateServiceViewControllerOfClass:(Class)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke;
  v4[3] = &unk_1E530E088;
  v4[4] = self;
  void v4[5] = a4;
  void v4[6] = a3;
  [(_UIViewServiceDeputyManager *)self registerDeputyClass:a4 withConnectionHandler:v4];
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

@end