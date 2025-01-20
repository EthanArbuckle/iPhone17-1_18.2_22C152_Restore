@interface _UIVisualEffectContentView
- (BOOL)disableGroupFiltering;
- (_UIVisualEffectContentView)initWithFrame:(CGRect)a3;
- (id)description;
- (void)_didInvalidateIntrinsicContentSize;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_notifyContentViewMonitors;
- (void)applyIdentityFilterEffects;
- (void)applyRequestedFilterEffects;
- (void)didAddSubview:(id)a3;
- (void)setDisableGroupFiltering:(BOOL)a3;
- (void)setFilters:(id)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation _UIVisualEffectContentView

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIVisualEffectContentView;
  [(UIView *)&v4 _intrinsicContentSizeInvalidatedForChildView:a3];
  [(_UIVisualEffectContentView *)self _notifyContentViewMonitors];
}

- (void)didAddSubview:(id)a3
{
  id v6 = a3;
  [(_UIVisualEffectContentView *)self _notifyContentViewMonitors];
  if (self->_disableGroupFiltering && [(NSArray *)self->super._filters count])
  {
    objc_super v4 = _UIVisualEffectSubviewConvertToCAFilterArray(self->super._filters);
    v5 = [v6 layer];
    [v5 setFilters:v4];

    _UIVisualEffectSubviewApplyFilters(v6, self->super._filters, self->_currentlyDisplayingRequestedEffects);
  }
}

- (void)_notifyContentViewMonitors
{
  id v2 = [(UIView *)self superview];
  [v2 _didUpdateContentView];
}

- (_UIVisualEffectContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectContentView;
  v3 = -[_UIVisualEffectSubview initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:1];
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      [(UIView *)v4 setClipsToBounds:1];
    }
  }
  return v4;
}

- (void)setFilters:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_disableGroupFiltering)
  {
    objc_super v4 = (NSArray *)[a3 copy];
    filters = self->super._filters;
    self->super._filters = v4;

    objc_super v6 = [(UIView *)self subviews];
    if ([v6 count])
    {
      v7 = _UIVisualEffectSubviewConvertToCAFilterArray(self->super._filters);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "layer", (void)v14);
            [v13 setFilters:v7];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v10);
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_UIVisualEffectContentView;
    [(_UIVisualEffectSubview *)&v18 setFilters:a3];
  }
}

- (void)applyRequestedFilterEffects
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_currentlyDisplayingRequestedEffects = 1;
  if (self->_disableGroupFiltering)
  {
    v3 = [(UIView *)self subviews];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          _UIVisualEffectSubviewApplyFilters(*(void **)(*((void *)&v8 + 1) + 8 * i), self->super._filters, self->_currentlyDisplayingRequestedEffects);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIVisualEffectContentView;
    [(_UIVisualEffectSubview *)&v12 applyRequestedFilterEffects];
  }
}

- (void)setDisableGroupFiltering:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->super._filters count])
  {
    if (!self->_disableGroupFiltering && v3)
    {
      objc_super v12 = [(UIView *)self subviews];
      if ([v12 count])
      {
        BOOL v23 = v3;
        v13 = _UIVisualEffectSubviewConvertToCAFilterArray(self->super._filters);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v22 = v12;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v20 = [v19 layer];
              [v20 setFilters:v13];

              _UIVisualEffectSubviewApplyFilters(v19, self->super._filters, self->_currentlyDisplayingRequestedEffects);
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }
          while (v16);
        }

        LOBYTE(v3) = v23;
        objc_super v12 = v22;
      }
      id v21 = _UIVisualEffectSubviewSetFilters(self, self->super._filters, MEMORY[0x1E4F1CBF0]);
LABEL_27:

      goto LABEL_28;
    }
    if (self->_disableGroupFiltering && !v3)
    {
      objc_super v12 = [(UIView *)self subviews];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v6 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v7; ++j)
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v12);
            }
            long long v10 = [*(id *)(*((void *)&v24 + 1) + 8 * j) layer];
            [v10 setFilters:0];
          }
          uint64_t v7 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v7);
      }
      id v11 = _UIVisualEffectSubviewSetFilters(self, MEMORY[0x1E4F1CBF0], self->super._filters);
      _UIVisualEffectSubviewApplyFilters(self, self->super._filters, self->_currentlyDisplayingRequestedEffects);
      goto LABEL_27;
    }
  }
LABEL_28:
  self->_disableGroupFiltering = v3;
}

- (void)applyIdentityFilterEffects
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_currentlyDisplayingRequestedEffects = 0;
  if (self->_disableGroupFiltering)
  {
    BOOL v3 = [(UIView *)self subviews];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          _UIVisualEffectSubviewApplyFilters(*(void **)(*((void *)&v8 + 1) + 8 * i), self->super._filters, self->_currentlyDisplayingRequestedEffects);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIVisualEffectContentView;
    [(_UIVisualEffectSubview *)&v12 applyIdentityFilterEffects];
  }
}

- (BOOL)disableGroupFiltering
{
  return self->_disableGroupFiltering;
}

- (void)willRemoveSubview:(id)a3
{
  id v5 = a3;
  [(_UIVisualEffectContentView *)self _notifyContentViewMonitors];
  if (self->_disableGroupFiltering)
  {
    uint64_t v4 = [v5 layer];
    [v4 setFilters:0];
  }
}

- (void)_didInvalidateIntrinsicContentSize
{
  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectContentView;
  [(UIView *)&v3 _didInvalidateIntrinsicContentSize];
  [(_UIVisualEffectContentView *)self _notifyContentViewMonitors];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UIVisualEffectContentView;
  objc_super v3 = [(UIView *)&v7 description];
  uint64_t v4 = v3;
  if (self->_disableGroupFiltering)
  {
    uint64_t v5 = [v3 stringByAppendingString:@" disablesGroupFiltering"];

    uint64_t v4 = (void *)v5;
  }
  return v4;
}

@end