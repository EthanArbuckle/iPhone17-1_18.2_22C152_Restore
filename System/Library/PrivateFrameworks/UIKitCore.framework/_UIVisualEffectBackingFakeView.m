@interface _UIVisualEffectBackingFakeView
- (NSArray)filters;
- (NSArray)viewEffects;
- (UIView)clientView;
- (_UIVisualEffectBackingFakeView)initWithClientView:(id)a3;
- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup;
- (_UIVisualEffectViewParticipating)containedView;
- (uint64_t)_clientViewShouldBeOptedOutOfViewEffects;
- (void)_receiveVisitor:(id)a3;
- (void)applyIdentityFilterEffects;
- (void)applyIdentityViewEffects;
- (void)applyRequestedFilterEffects;
- (void)applyRequestedViewEffects;
- (void)setClientView:(id)a3;
- (void)setContainedView:(id)a3;
- (void)setFilters:(id)a3;
- (void)setPrimaryCaptureGroup:(id)a3;
- (void)setViewEffects:(id)a3;
@end

@implementation _UIVisualEffectBackingFakeView

- (_UIVisualEffectBackingFakeView)initWithClientView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIVisualEffectBackingFakeView;
  v5 = [(UIView *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_clientView, v4);
  }

  return v6;
}

- (uint64_t)_clientViewShouldBeOptedOutOfViewEffects
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 440));
    v2 = self;
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)setViewEffects:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  viewEffects = self->_viewEffects;
  v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (!viewEffects) {
    viewEffects = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v7 = viewEffects;
  if (v4) {
    objc_super v8 = v4;
  }
  else {
    objc_super v8 = v6;
  }
  id v9 = v8;
  if (-[_UIVisualEffectBackingFakeView _clientViewShouldBeOptedOutOfViewEffects]((uint64_t)self))
  {
    v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_269];
    uint64_t v11 = [v9 filteredArrayUsingPredicate:v10];

    id v9 = (id)v11;
  }
  if (![(NSArray *)v7 isEqualToArray:v9])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v12 = v7;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v18 = [(_UIVisualEffectBackingFakeView *)self clientView];
          [v17 removeEffectFromView:v18];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v14);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          v25 = [(_UIVisualEffectBackingFakeView *)self clientView];
          [v24 addEffectToView:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v21);
    }

    v26 = (NSArray *)[v19 copy];
    v27 = self->_viewEffects;
    self->_viewEffects = v26;
  }
}

- (void)setFilters:(id)a3
{
  id v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_filters, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_filters, a3);
    v5 = _UIVisualEffectSubviewConvertToCAFilterArray(v8);
    v6 = [(_UIVisualEffectBackingFakeView *)self clientView];
    v7 = -[UIView _backing_outermostLayer](v6);
    [v7 setFilters:v5];
  }
}

- (void)applyIdentityFilterEffects
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIVisualEffectBackingFakeView *)self clientView];
  id v4 = -[UIView _backing_outermostLayer](v3);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_filters;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = NSString;
        v12 = [v10 filterName];
        uint64_t v13 = [v11 stringWithFormat:@"filters.%@.", v12];

        uint64_t v14 = [v10 valueAsRequested:0];
        _UIVisualEffectSubviewApplyFilterValues(v4, v14, v13);
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)applyRequestedFilterEffects
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIVisualEffectBackingFakeView *)self clientView];
  id v4 = -[UIView _backing_outermostLayer](v3);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_filters;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = NSString;
        v12 = [v10 filterName];
        uint64_t v13 = [v11 stringWithFormat:@"filters.%@.", v12];

        uint64_t v14 = [v10 valueAsRequested:1];
        _UIVisualEffectSubviewApplyFilterValues(v4, v14, v13);
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)applyIdentityViewEffects
{
  if ((-[_UIVisualEffectBackingFakeView _clientViewShouldBeOptedOutOfViewEffects]((uint64_t)self) & 1) == 0)
  {
    id v3 = [(_UIVisualEffectBackingFakeView *)self clientView];
    _UIVisualEffectSubviewApplyViewEffects(v3, self->_viewEffects, 0);
  }
}

- (void)applyRequestedViewEffects
{
  if ((-[_UIVisualEffectBackingFakeView _clientViewShouldBeOptedOutOfViewEffects]((uint64_t)self) & 1) == 0)
  {
    id v3 = [(_UIVisualEffectBackingFakeView *)self clientView];
    _UIVisualEffectSubviewApplyViewEffects(v3, self->_viewEffects, 1);
  }
}

- (void)_receiveVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIVisualEffectBackingFakeView *)self clientView];
  +[_UIViewVisitor _startTraversalOfVisitor:v4 withView:v5];
}

- (_UIVisualEffectViewParticipating)containedView
{
  return self->_containedView;
}

- (void)setContainedView:(id)a3
{
}

- (NSArray)filters
{
  return self->_filters;
}

- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup
{
  return self->_primaryCaptureGroup;
}

- (void)setPrimaryCaptureGroup:(id)a3
{
}

- (NSArray)viewEffects
{
  return self->_viewEffects;
}

- (UIView)clientView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientView);
  return (UIView *)WeakRetained;
}

- (void)setClientView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientView);
  objc_storeStrong((id *)&self->_viewEffects, 0);
  objc_storeStrong((id *)&self->_primaryCaptureGroup, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_containedView, 0);
}

@end