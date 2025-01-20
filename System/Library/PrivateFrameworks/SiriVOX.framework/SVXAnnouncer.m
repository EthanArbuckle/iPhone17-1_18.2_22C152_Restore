@interface SVXAnnouncer
+ (id)protocol;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSHashTable)listeners;
- (SVXAnnouncer)init;
- (__CFDictionary)protocolOptionalInstanceMethodSignaturesBySelector;
- (__CFDictionary)protocolRequiredInstanceMethodSignaturesBySelector;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_accessListenersUsingBlock:(id)a3;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)removeAllListeners;
- (void)removeListener:(id)a3;
- (void)setListeners:(id)a3;
- (void)setProtocolOptionalInstanceMethodSignaturesBySelector:(__CFDictionary *)a3;
- (void)setProtocolRequiredInstanceMethodSignaturesBySelector:(__CFDictionary *)a3;
@end

@implementation SVXAnnouncer

- (void).cxx_destruct
{
}

- (void)setListeners:(id)a3
{
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setProtocolOptionalInstanceMethodSignaturesBySelector:(__CFDictionary *)a3
{
  self->_protocolOptionalInstanceMethodSignaturesBySelector = a3;
}

- (__CFDictionary)protocolOptionalInstanceMethodSignaturesBySelector
{
  return self->_protocolOptionalInstanceMethodSignaturesBySelector;
}

- (void)setProtocolRequiredInstanceMethodSignaturesBySelector:(__CFDictionary *)a3
{
  self->_protocolRequiredInstanceMethodSignaturesBySelector = a3;
}

- (__CFDictionary)protocolRequiredInstanceMethodSignaturesBySelector
{
  return self->_protocolRequiredInstanceMethodSignaturesBySelector;
}

- (void)_accessListenersUsingBlock:(id)a3
{
  if (a3)
  {
    listeners = self->_listeners;
    id v5 = a3;
    id v6 = [(NSHashTable *)listeners setRepresentation];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = (const void *)[v4 selector];
  if (CFDictionaryContainsKey(self->_protocolRequiredInstanceMethodSignaturesBySelector, v5))
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __34__SVXAnnouncer_forwardInvocation___block_invoke;
    v10[3] = &unk_2645521A0;
    v12 = v5;
    id v11 = v4;
    [(SVXAnnouncer *)self _accessListenersUsingBlock:v10];
    id v6 = v11;
  }
  else
  {
    if (!CFDictionaryContainsKey(self->_protocolOptionalInstanceMethodSignaturesBySelector, v5))
    {
      [(SVXAnnouncer *)self doesNotRecognizeSelector:v5];
      goto LABEL_6;
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__SVXAnnouncer_forwardInvocation___block_invoke_15;
    v7[3] = &unk_2645521A0;
    v9 = v5;
    id v8 = v4;
    [(SVXAnnouncer *)self _accessListenersUsingBlock:v7];
    id v6 = v8;
  }

LABEL_6:
}

void __34__SVXAnnouncer_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 40);
    id v6 = v4;
    v7 = NSStringFromSelector(v5);
    *(_DWORD *)buf = 136315650;
    v19 = "-[SVXAnnouncer forwardInvocation:]_block_invoke";
    __int16 v20 = 2112;
    v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = [v3 count];
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_DEFAULT, "%s Announcing %@ to %tu listeners.", buf, 0x20u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

void __34__SVXAnnouncer_forwardInvocation___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 40);
    id v6 = v4;
    v7 = NSStringFromSelector(v5);
    *(_DWORD *)buf = 136315650;
    __int16 v20 = "-[SVXAnnouncer forwardInvocation:]_block_invoke";
    __int16 v21 = 2112;
    __int16 v22 = v7;
    __int16 v23 = 2048;
    uint64_t v24 = [v3 count];
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_DEFAULT, "%s Announcing %@ to %tu listeners.", buf, 0x20u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", v13, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5 = CFDictionaryGetValue(self->_protocolRequiredInstanceMethodSignaturesBySelector, a3);
  if (!v5)
  {
    id v5 = CFDictionaryGetValue(self->_protocolOptionalInstanceMethodSignaturesBySelector, a3);
    if (!v5)
    {
      v7.receiver = self;
      v7.super_class = (Class)SVXAnnouncer;
      id v5 = [(SVXAnnouncer *)&v7 methodSignatureForSelector:a3];
    }
  }

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (CFDictionaryContainsKey(self->_protocolRequiredInstanceMethodSignaturesBySelector, a3)
    || CFDictionaryContainsKey(self->_protocolOptionalInstanceMethodSignaturesBySelector, a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SVXAnnouncer;
  return [(SVXAnnouncer *)&v6 respondsToSelector:a3];
}

- (void)removeAllListeners
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[SVXAnnouncer removeAllListeners]";
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(NSHashTable *)self->_listeners removeAllObjects];
}

- (void)removeListener:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      objc_super v7 = "-[SVXAnnouncer removeListener:]";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
    }
    [(NSHashTable *)self->_listeners removeObject:v4];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    objc_super v7 = "-[SVXAnnouncer removeListener:]";
    __int16 v8 = 2112;
    id v9 = 0;
    _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s listener %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)addListener:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() protocol];
  char v6 = [v4 conformsToProtocol:v5];
  objc_super v7 = *MEMORY[0x263F28348];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[SVXAnnouncer addListener:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v10, 0x16u);
    }
    [(NSHashTable *)self->_listeners addObject:v4];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    __int16 v8 = v7;
    id v9 = NSStringFromProtocol(v5);
    int v10 = 136315650;
    uint64_t v11 = "-[SVXAnnouncer addListener:]";
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    long long v15 = v9;
    _os_log_error_impl(&dword_220062000, v8, OS_LOG_TYPE_ERROR, "%s listener %@ does NOT conform to protocol %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)dealloc
{
  CFRelease(self->_protocolRequiredInstanceMethodSignaturesBySelector);
  self->_protocolRequiredInstanceMethodSignaturesBySelector = 0;
  CFRelease(self->_protocolOptionalInstanceMethodSignaturesBySelector);
  self->_protocolOptionalInstanceMethodSignaturesBySelector = 0;
  v3.receiver = self;
  v3.super_class = (Class)SVXAnnouncer;
  [(SVXAnnouncer *)&v3 dealloc];
}

- (SVXAnnouncer)init
{
  v15.receiver = self;
  v15.super_class = (Class)SVXAnnouncer;
  objc_super v3 = [(SVXAnnouncer *)&v15 init];
  if (v3)
  {
    id v4 = [(id)objc_opt_class() protocol];
    if (!v4)
    {
      __int16 v8 = [MEMORY[0x263F08690] currentHandler];
      id v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      [v8 handleFailureInMethod:a2, v3, @"SVXAnnouncer.m", 32, @"Announcer class %@ is expected to override +[SVXAnnouncer protocol] method and return a non null protocol.", v10 object file lineNumber description];
    }
    if (([(SVXAnnouncer *)v3 conformsToProtocol:v4] & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
      __int16 v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      __int16 v14 = NSStringFromProtocol(v4);
      [v11 handleFailureInMethod:a2, v3, @"SVXAnnouncer.m", 33, @"Announcer class %@ is expected to conform to protocol %@.", v13, v14 object file lineNumber description];
    }
    v3->_protocolRequiredInstanceMethodSignaturesBySelector = _SVXAnnouncerCreateInstanceMethodSignatureMap(v4, 1);
    v3->_protocolOptionalInstanceMethodSignaturesBySelector = _SVXAnnouncerCreateInstanceMethodSignatureMap(v4, 0);
    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    listeners = v3->_listeners;
    v3->_listeners = (NSHashTable *)v5;
  }
  return v3;
}

+ (id)protocol
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  id v4 = NSStringFromClass((Class)a1);
  [v2 raise:v3, @"Subclass Responsibility: Announcer class %@ is expected to override +[SVXAnnouncer protocol] method and return a non null protocol.", v4 format];

  return 0;
}

@end