@interface TUIRenderReferenceOverrideProvider
- (TUIRenderReferenceOverrideProviderDelegate)delegate;
- (id)renderOverrides;
- (void)_notifyRenderOverrideObservers:(id)a3;
- (void)addRenderOverride:(id)a3;
- (void)removeRenderOverride:(id)a3;
- (void)scrollToItemsMatchingQuery:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6;
- (void)setDelegate:(id)a3;
@end

@implementation TUIRenderReferenceOverrideProvider

- (void)addRenderOverride:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    overrides = self->_overrides;
    id v9 = v4;
    if (!overrides)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_overrides;
      self->_overrides = v6;

      overrides = self->_overrides;
    }
    id v8 = [(NSMutableArray *)overrides indexOfObjectIdenticalTo:v9];
    id v4 = v9;
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->_overrides addObject:v9];
      [(TUIRenderReferenceOverrideProvider *)self _notifyRenderOverrideObservers:v9];
      id v4 = v9;
    }
  }
}

- (void)removeRenderOverride:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    overrides = self->_overrides;
    if (overrides)
    {
      id v8 = v4;
      id v6 = [(NSMutableArray *)overrides indexOfObjectIdenticalTo:v4];
      id v4 = v8;
      if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [(NSMutableArray *)self->_overrides removeObjectIdenticalTo:v8];
        if (![(NSMutableArray *)self->_overrides count])
        {
          v7 = self->_overrides;
          self->_overrides = 0;
        }
        [(TUIRenderReferenceOverrideProvider *)self _notifyRenderOverrideObservers:v8];
        id v4 = v8;
      }
    }
  }
}

- (id)renderOverrides
{
  return self->_overrides;
}

- (void)_notifyRenderOverrideObservers:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained renderReferenceOverrideObservers];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v12 renderReferenceOverridesChanged];
        [v12 invalidateRenderReferenceOverride:v4];
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)scrollToItemsMatchingQuery:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = [WeakRetained renderReferenceOverrideObservers];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v17) scrollToItemsMatchingQuery:v10 atScrollPosition:a4 animated:v7 skipVoiceOverFocus:v6];
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (TUIRenderReferenceOverrideProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIRenderReferenceOverrideProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_overrides, 0);
}

@end