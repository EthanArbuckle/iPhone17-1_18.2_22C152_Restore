@interface _UIBackdropContentView
- (_UIBackdropContentView)initWithFrame:(CGRect)a3;
- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)backdropView:(id)a3 recursivelyUpdateMaskViewsForView:(id)a4;
- (void)didMoveToWindow;
- (void)recursivelyRemoveBackdropMaskViewsForView:(id)a3;
@end

@implementation _UIBackdropContentView

- (_UIBackdropContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBackdropContentView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 _setMonitorsSubtree:1];
    v4->_isForcingLayout = 0;
  }
  return v4;
}

- (void)backdropView:(id)a3 recursivelyUpdateMaskViewsForView:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!self->_isForcingLayout)
  {
    self->_isForcingLayout = 1;
    [v7 layoutBelowIfNeeded];
    [v6 updateMaskViewsForView:v8];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v9 = objc_msgSend(v8, "subviews", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [(_UIBackdropContentView *)self backdropView:v6 recursivelyUpdateMaskViewsForView:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }

    self->_isForcingLayout = 0;
  }
}

- (void)recursivelyRemoveBackdropMaskViewsForView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 _removeBackdropMaskViews];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = objc_msgSend(v4, "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(_UIBackdropContentView *)self recursivelyRemoveBackdropMaskViewsForView:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIBackdropContentView;
  id v9 = a4;
  [(UIView *)&v11 _monitoredView:v8 didMoveFromSuperview:v9 toSuperview:a5];
  LOBYTE(a5) = objc_msgSend(v9, "isDescendantOfView:", self, v11.receiver, v11.super_class);

  if ((a5 & 1) == 0)
  {
    long long v10 = [(UIView *)self superview];
    [(_UIBackdropContentView *)self backdropView:v10 recursivelyUpdateMaskViewsForView:v8];
  }
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIBackdropContentView;
  id v9 = a5;
  [(UIView *)&v10 _monitoredView:v8 willMoveFromSuperview:a4 toSuperview:v9];
  LOBYTE(a4) = objc_msgSend(v9, "isDescendantOfView:", self, v10.receiver, v10.super_class);

  if ((a4 & 1) == 0) {
    [(_UIBackdropContentView *)self recursivelyRemoveBackdropMaskViewsForView:v8];
  }
}

- (void)didMoveToWindow
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(UIView *)self window];

  if (v3)
  {
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    id v4 = [(UIView *)self subviews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          objc_super v10 = [(UIView *)self superview];
          [(_UIBackdropContentView *)self backdropView:v10 recursivelyUpdateMaskViewsForView:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }
  }
  else
  {
    long long v17 = 0uLL;
    long long v18 = 0uLL;
    *((void *)&v15 + 1) = 0;
    long long v16 = 0uLL;
    id v4 = [(UIView *)self subviews];
    uint64_t v11 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v4);
          }
          [(_UIBackdropContentView *)self recursivelyRemoveBackdropMaskViewsForView:*(void *)(*((void *)&v15 + 1) + 8 * j)];
        }
        uint64_t v12 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

@end