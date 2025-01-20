@interface SUScriptTextFieldDelegate
- (BOOL)respondsToSelector:(SEL)a3;
- (SUScriptTextFieldDelegate)init;
- (id)methodSignatureForSelector:(SEL)a3;
- (int64_t)numberOfDelegates;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation SUScriptTextFieldDelegate

- (SUScriptTextFieldDelegate)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptTextFieldDelegate;
  v2 = [(SUScriptTextFieldDelegate *)&v4 init];
  if (v2) {
    v2->_delegates = (NSHashTable *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:513 capacity:1];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldDelegate;
  [(SUScriptTextFieldDelegate *)&v3 dealloc];
}

- (void)addDelegate:(id)a3
{
}

- (int64_t)numberOfDelegates
{
  return [(NSHashTable *)self->_delegates count];
}

- (void)removeDelegate:(id)a3
{
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v19 = 1;
  int v5 = strcmp((const char *)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "methodReturnType"), "B");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  delegates = self->_delegates;
  uint64_t v7 = [(NSHashTable *)delegates countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(delegates);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        [a3 selector];
        if (objc_opt_respondsToSelector())
        {
          [a3 invokeWithTarget:v12];
          if (!v5)
          {
            char v14 = 0;
            [a3 getReturnValue:&v14];
            if (v10) {
              BOOL v13 = v14 == 0;
            }
            else {
              BOOL v13 = 1;
            }
            char v10 = !v13;
            char v19 = v10;
          }
        }
      }
      uint64_t v8 = [(NSHashTable *)delegates countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
  if (!v5) {
    [a3 setReturnValue:&v19];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptTextFieldDelegate;
  id result = -[SUScriptTextFieldDelegate methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_26DC32D40, a3, 0, 1);
    id result = (id)MethodDescription.name;
    if (MethodDescription.name) {
      return (id)[MEMORY[0x263EFF970] signatureWithObjCTypes:MethodDescription.types];
    }
  }
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)SUScriptTextFieldDelegate;
  unsigned __int8 v4 = -[SUScriptTextFieldDelegate respondsToSelector:](&v15, sel_respondsToSelector_);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  delegates = self->_delegates;
  uint64_t v6 = [(NSHashTable *)delegates countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(delegates);
        }
        if (v4) {
          unsigned __int8 v4 = 1;
        }
        else {
          unsigned __int8 v4 = objc_opt_respondsToSelector();
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)delegates countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
  return v4 & 1;
}

@end