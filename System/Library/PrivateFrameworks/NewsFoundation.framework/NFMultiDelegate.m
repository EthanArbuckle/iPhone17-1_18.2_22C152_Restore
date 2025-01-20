@interface NFMultiDelegate
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NFMultiDelegate)initWithDelegate:(id)a3 delegateProtocol:(id)a4;
- (NFMultiDelegate)initWithDelegate:(id)a3 delegateProtocol:(id)a4 options:(unint64_t)a5;
- (NFUnfairLock)lock;
- (NSHashTable)children;
- (Protocol)delegateProtocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)addDelegate:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)replaceDelegate:(id)a3 withDelegate:(id)a4;
- (void)setLock:(id)a3;
@end

@implementation NFMultiDelegate

- (NFMultiDelegate)initWithDelegate:(id)a3 delegateProtocol:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NFMultiDelegate;
  v10 = [(NFMultiDelegate *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    children = v10->_children;
    v10->_children = (NSHashTable *)v11;

    if (v8) {
      [(NSHashTable *)v10->_children addObject:v8];
    }
    objc_storeStrong((id *)&v10->_delegateProtocol, a4);
    if (v5)
    {
      v13 = objc_alloc_init(NFUnfairLock);
      lock = v10->_lock;
      v10->_lock = v13;
    }
  }

  return v10;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)NFMultiDelegate;
  char v5 = -[NFMultiDelegate methodSignatureForSelector:](&v21, sel_methodSignatureForSelector_);
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    [(NFUnfairLock *)self->_lock lock];
    v7 = [(NFMultiDelegate *)self children];
    id v8 = (void *)[v7 copy];

    [(NFUnfairLock *)self->_lock unlock];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v14)
          {
            v15 = objc_msgSend(v14, "methodSignatureForSelector:", a3, (void)v17);
            if (v15)
            {
              id v6 = v15;
              goto LABEL_14;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v6 = 0;
LABEL_14:
  }
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NFUnfairLock *)self->_lock lock];
  char v5 = [(NFMultiDelegate *)self children];
  id v6 = (void *)[v5 copy];

  [(NFUnfairLock *)self->_lock unlock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
        if (v12)
        {
          objc_msgSend(v4, "selector", (void)v13);
          if (objc_opt_respondsToSelector()) {
            [v4 invokeWithTarget:v12];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)addDelegate:(id)a3
{
  if (a3)
  {
    lock = self->_lock;
    id v5 = a3;
    [(NFUnfairLock *)lock lock];
    id v6 = [(NFMultiDelegate *)self children];
    [v6 addObject:v5];

    id v7 = self->_lock;
    [(NFUnfairLock *)v7 unlock];
  }
}

- (NSHashTable)children
{
  return self->_children;
}

- (NFMultiDelegate)initWithDelegate:(id)a3 delegateProtocol:(id)a4
{
  return [(NFMultiDelegate *)self initWithDelegate:a3 delegateProtocol:a4 options:0];
}

- (void)removeDelegate:(id)a3
{
  if (a3)
  {
    lock = self->_lock;
    id v5 = a3;
    [(NFUnfairLock *)lock lock];
    id v6 = [(NFMultiDelegate *)self children];
    [v6 removeObject:v5];

    id v7 = self->_lock;
    [(NFUnfairLock *)v7 unlock];
  }
}

- (void)replaceDelegate:(id)a3 withDelegate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 != v6)
  {
    [(NFUnfairLock *)self->_lock lock];
    if (v9)
    {
      id v7 = [(NFMultiDelegate *)self children];
      [v7 removeObject:v9];
    }
    if (v6)
    {
      uint64_t v8 = [(NFMultiDelegate *)self children];
      [v8 addObject:v6];
    }
    [(NFUnfairLock *)self->_lock unlock];
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NFMultiDelegate;
  if ([(NFMultiDelegate *)&v8 conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else if (v4)
  {
    id v6 = [(NFMultiDelegate *)self delegateProtocol];
    BOOL v5 = v6 == v4;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)NFMultiDelegate;
  if (-[NFMultiDelegate respondsToSelector:](&v17, sel_respondsToSelector_)) {
    return 1;
  }
  [(NFUnfairLock *)self->_lock lock];
  BOOL v5 = [(NFMultiDelegate *)self children];
  id v6 = (void *)[v5 copy];

  [(NFUnfairLock *)self->_lock unlock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        if (*(void *)(*((void *)&v13 + 1) + 8 * i) && (objc_opt_respondsToSelector() & 1) != 0)
        {
          BOOL v4 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v4 = 0;
LABEL_14:

  return v4;
}

- (Protocol)delegateProtocol
{
  return self->_delegateProtocol;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_delegateProtocol, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end