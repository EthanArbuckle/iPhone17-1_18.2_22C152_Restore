@interface ICScrollViewDelegateMultiplexer
- (BOOL)respondsToSelector:(SEL)a3;
- (ICScrollViewDelegateMultiplexer)initWithForwardingTargets:(id)a3;
- (NSArray)forwardingTargets;
- (NSArray)wrappedForwardingTargets;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setWrappedForwardingTargets:(id)a3;
@end

@implementation ICScrollViewDelegateMultiplexer

- (ICScrollViewDelegateMultiplexer)initWithForwardingTargets:(id)a3
{
  objc_msgSend(a3, "ic_map:", &__block_literal_global_15);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  wrappedForwardingTargets = self->_wrappedForwardingTargets;
  self->_wrappedForwardingTargets = v4;

  return self;
}

id __61__ICScrollViewDelegateMultiplexer_initWithForwardingTargets___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F83800];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithObject:v3];

  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(ICScrollViewDelegateMultiplexer *)self wrappedForwardingTargets];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) object];
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(ICScrollViewDelegateMultiplexer *)self wrappedForwardingTargets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v10 object];
        char v12 = objc_opt_respondsToSelector();

        if (v12)
        {
          long long v13 = [v10 object];
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v4 count] == 1)
  {
    long long v14 = [v4 firstObject];
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(ICScrollViewDelegateMultiplexer *)self wrappedForwardingTargets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v10 = [v9 object];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          long long v13 = [v9 object];
          char v12 = [v13 methodSignatureForSelector:a3];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  char v12 = 0;
LABEL_11:

  return v12;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(ICScrollViewDelegateMultiplexer *)self wrappedForwardingTargets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v11 = [v10 object];
        [v4 selector];
        char v12 = objc_opt_respondsToSelector();

        if (v12)
        {
          long long v13 = [v10 object];
          [v4 invokeWithTarget:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (NSArray)forwardingTargets
{
  v2 = [(ICScrollViewDelegateMultiplexer *)self wrappedForwardingTargets];
  id v3 = objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_4);

  return (NSArray *)v3;
}

uint64_t __52__ICScrollViewDelegateMultiplexer_forwardingTargets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (NSArray)wrappedForwardingTargets
{
  return self->_wrappedForwardingTargets;
}

- (void)setWrappedForwardingTargets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end