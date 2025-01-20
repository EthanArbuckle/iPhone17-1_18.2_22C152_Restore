@interface SBHReusableViewMap
- (BOOL)isViewRecycled:(id)a3;
- (NSString)description;
- (SBHReusableViewMap)init;
- (SBHReusableViewMap)initWithDelegate:(id)a3;
- (SBHReusableViewMapDelegate)delegate;
- (id)dequeueReusableViewOfClass:(Class)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)newViewOfClass:(Class)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)viewOfClass:(Class)a3;
- (unint64_t)recycledViewCount;
- (unint64_t)viewRecyclingCount;
- (void)addRecycledViewsOfClass:(Class)a3 upToCount:(unint64_t)a4;
- (void)dealloc;
- (void)enumerateRecycledViewsUsingBlock:(id)a3;
- (void)invalidate;
- (void)purgeAllViews;
- (void)purgeView:(id)a3;
- (void)purgeViewsForClass:(Class)a3;
- (void)recycleView:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBHReusableViewMap

- (void)recycleView:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(SBHReusableViewMap *)self delegate];
    if (self->_invalidated)
    {
      int v6 = 0;
    }
    else
    {
      uint64_t v7 = objc_opt_class();
      v8 = [(NSMapTable *)self->_recycledViewsByClass objectForKey:v7];
      unint64_t v9 = [v8 count];
      if (v9 >= [v5 viewMap:self maxRecycledViewsOfClass:v7]
        || (objc_opt_respondsToSelector() & 1) != 0
        && ![v5 viewMap:self shouldRecycleView:v4])
      {
        v12 = SBLogReusableViewCache();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v24 = self;
          __int16 v25 = 2112;
          uint64_t v26 = v7;
          __int16 v27 = 2048;
          id v28 = v4;
          _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "(%p) will not recycle reusable view of class: %@/%p", buf, 0x20u);
        }
        int v6 = 0;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E4FB1EB0];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __34__SBHReusableViewMap_recycleView___block_invoke;
        v21[3] = &unk_1E6AAC810;
        v11 = v4;
        v22 = v11;
        [v10 performWithoutAnimation:v21];
        if (v8)
        {
          [v8 addObject:v11];
        }
        else
        {
          recycledViewsByClass = self->_recycledViewsByClass;
          v14 = [MEMORY[0x1E4F1CA80] setWithObject:v11];
          [(NSMapTable *)recycledViewsByClass setObject:v14 forKey:v7];
        }
        v15 = SBLogReusableViewCache();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v24 = self;
          __int16 v25 = 2112;
          uint64_t v26 = v7;
          __int16 v27 = 2048;
          id v28 = (id)(v9 + 1);
          _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "(%p) recycled reusable view of class: %@ (%lu total)", buf, 0x20u);
        }

        int v6 = 1;
        v12 = v22;
      }
    }
    v16 = [v5 recycledViewsContainerProviderForViewMap:self];
    v17 = [v16 recycledViewsContainer];
    v18 = v17;
    if (v6
      && v17
      && ([v17 window],
          v19 = objc_claimAutoreleasedReturnValue(),
          [v4 window],
          v20 = objc_claimAutoreleasedReturnValue(),
          v20,
          v19,
          v19 == v20))
    {
      [v18 addSubview:v4];
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        [v5 viewMap:self willDiscardView:v4];
      }
      [v4 removeFromSuperview];
    }
  }
}

- (SBHReusableViewMapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHReusableViewMapDelegate *)WeakRetained;
}

uint64_t __34__SBHReusableViewMap_recycleView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareForReuse];
}

- (id)dequeueReusableViewOfClass:(Class)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = -[NSMapTable objectForKey:](self->_recycledViewsByClass, "objectForKey:");
  int v6 = [v5 anyObject];
  if (v6)
  {
    [v5 removeObject:v6];
    uint64_t v7 = [v6 layer];
    [v7 clearHasBeenCommitted];

    v8 = SBLogReusableViewCache();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v13 = 134218498;
    v14 = self;
    __int16 v15 = 2112;
    Class v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = [v5 count];
    unint64_t v9 = "(%p) dequeued reusable view of class: %@ (%lu remaining)";
    v10 = v8;
    uint32_t v11 = 32;
  }
  else
  {
    v8 = SBLogReusableViewCache();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v13 = 134218242;
    v14 = self;
    __int16 v15 = 2112;
    Class v16 = a3;
    unint64_t v9 = "(%p) could not dequeue reusable view of class: %@";
    v10 = v8;
    uint32_t v11 = 22;
  }
  _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
LABEL_7:

  return v6;
}

- (id)viewOfClass:(Class)a3
{
  -[SBHReusableViewMap dequeueReusableViewOfClass:](self, "dequeueReusableViewOfClass:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    id v5 = [(SBHReusableViewMap *)self newViewOfClass:a3];
  }
  return v5;
}

- (id)newViewOfClass:(Class)a3
{
  id v5 = [(SBHReusableViewMap *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v5 viewMap:self makeNewViewOfClass:a3], (id v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = objc_alloc_init(a3);
  }

  return v6;
}

- (SBHReusableViewMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHReusableViewMap;
  v2 = [(SBHReusableViewMap *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    recycledViewsByClass = v2->_recycledViewsByClass;
    v2->_recycledViewsByClass = (NSMapTable *)v3;
  }
  return v2;
}

- (SBHReusableViewMap)initWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHReusableViewMap *)self init];
  objc_super v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = [(NSMapTable *)self->_recycledViewsByClass objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * v13++) removeFromSuperview];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  v14.receiver = self;
  v14.super_class = (Class)SBHReusableViewMap;
  [(SBHReusableViewMap *)&v14 dealloc];
}

- (BOOL)isViewRecycled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHReusableViewMap *)self delegate];
  uint64_t v6 = [v5 recycledViewsContainerProviderForViewMap:self];
  uint64_t v7 = [v6 recycledViewsContainer];
  if (v7) {
    char v8 = [v4 isDescendantOfView:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (void)purgeViewsForClass:(Class)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogReusableViewCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v17 = self;
    __int16 v18 = 2112;
    Class v19 = a3;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "(%p) purge reusable views of class: %@", buf, 0x16u);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = -[NSMapTable objectForKey:](self->_recycledViewsByClass, "objectForKey:", a3, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) removeFromSuperview];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(NSMapTable *)self->_recycledViewsByClass removeObjectForKey:a3];
}

- (void)purgeView:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogReusableViewCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = self;
    __int16 v21 = 2048;
    id v22 = v4;
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "(%p) purging %p / %@", buf, 0x20u);
  }
  [v4 removeFromSuperview];
  [v4 prepareForReuse];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_recycledViewsByClass keyEnumerator];
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
        long long v13 = [(NSMapTable *)self->_recycledViewsByClass objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * v12)];
        [v13 removeObject:v4];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)purgeAllViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SBLogReusableViewCache();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    long long v15 = self;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "(%p) purge all reusable views", buf, 0xCu);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMapTable *)self->_recycledViewsByClass keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBHReusableViewMap *)self purgeViewsForClass:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMapTable *)self->_recycledViewsByClass removeAllObjects];
}

- (void)invalidate
{
  self->_invalidated = 1;
}

- (void)addRecycledViewsOfClass:(Class)a3 upToCount:(unint64_t)a4
{
  NSUInteger v7 = [(NSMapTable *)self->_recycledViewsByClass count];
  unint64_t v8 = a4 - v7;
  if (a4 > v7)
  {
    do
    {
      id v9 = [(SBHReusableViewMap *)self newViewOfClass:a3];
      if (v9) {
        [(SBHReusableViewMap *)self recycleView:v9];
      }

      --v8;
    }
    while (v8);
  }
}

- (void)enumerateRecycledViewsUsingBlock:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  char v24 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [(NSMapTable *)self->_recycledViewsByClass objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v17;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v17 != v14) {
                objc_enumerationMutation(v11);
              }
              v4[2](v4, *(void *)(*((void *)&v16 + 1) + 8 * j), &v24);
              if (v24)
              {

                goto LABEL_18;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }
LABEL_18:
}

- (unint64_t)recycledViewCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_recycledViewsByClass;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = -[NSMapTable objectForKey:](self->_recycledViewsByClass, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        v6 += [v9 count];
      }
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)viewRecyclingCount
{
  return -1;
}

- (NSString)description
{
  return (NSString *)[(SBHReusableViewMap *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHReusableViewMap *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBHReusableViewMap *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBHReusableViewMap *)self succinctDescriptionBuilder];
  id v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHReusableViewMap recycledViewCount](self, "recycledViewCount"), @"recycledViewCount");
  id v6 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHReusableViewMap viewRecyclingCount](self, "viewRecyclingCount"), @"viewRecyclingCount");
  return v4;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recycledViewsByClass, 0);
}

@end