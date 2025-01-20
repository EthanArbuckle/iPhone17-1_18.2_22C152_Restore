@interface TFMultiDelegate
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSHashTable)children;
- (Protocol)delegateProtocol;
- (TFMultiDelegate)initWithDelegate:(id)a3 delegateProtocol:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)addDelegate:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)replaceDelegate:(id)a3 withDelegate:(id)a4;
@end

@implementation TFMultiDelegate

- (TFMultiDelegate)initWithDelegate:(id)a3 delegateProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TFMultiDelegate;
  v8 = [(TFMultiDelegate *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    children = v8->_children;
    v8->_children = (NSHashTable *)v9;

    [(NSHashTable *)v8->_children addObject:v6];
    objc_storeStrong((id *)&v8->_delegateProtocol, a4);
  }

  return v8;
}

- (void)addDelegate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(TFMultiDelegate *)self children];
    [v5 addObject:v4];
  }
}

- (NSHashTable)children
{
  return self->_children;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TFMultiDelegate;
  if ([(TFMultiDelegate *)&v8 conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else if (v4)
  {
    id v6 = [(TFMultiDelegate *)self delegateProtocol];
    BOOL v5 = v6 == v4;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (Protocol)delegateProtocol
{
  return self->_delegateProtocol;
}

- (void)removeDelegate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(TFMultiDelegate *)self children];
    [v5 removeObject:v4];
  }
}

- (void)replaceDelegate:(id)a3 withDelegate:(id)a4
{
  if (a3 != a4)
  {
    id v7 = a4;
    [(TFMultiDelegate *)self removeDelegate:a3];
    [(TFMultiDelegate *)self addDelegate:v7];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)TFMultiDelegate;
  if (-[TFMultiDelegate respondsToSelector:](&v15, sel_respondsToSelector_)) {
    return 1;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(TFMultiDelegate *)self children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(void *)(*((void *)&v11 + 1) + 8 * i) && (objc_opt_respondsToSelector() & 1) != 0)
        {
          BOOL v4 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v4 = 0;
LABEL_14:

  return v4;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)TFMultiDelegate;
  -[TFMultiDelegate methodSignatureForSelector:](&v16, sel_methodSignatureForSelector_);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(TFMultiDelegate *)self children];
    id v5 = (id)[v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (v9)
          {
            v10 = [v9 methodSignatureForSelector:a3];
            if (v10)
            {
              id v5 = v10;

              uint64_t v6 = v5;
              goto LABEL_13;
            }
          }
        }
        id v5 = (id)[v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(TFMultiDelegate *)self children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        if (v10)
        {
          [v4 selector];
          if (objc_opt_respondsToSelector()) {
            [v4 invokeWithTarget:v10];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateProtocol, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end