@interface SBIsolatedSceneOrientationFollowingContainerView
- (BOOL)needsCounterRotation;
- (BOOL)shouldAllowTouchPassthroughIfTransparent;
- (BOOL)shouldLayoutOverlayImmediatelyForContainerGeometryChange;
- (SBIsolatedSceneOrientationFollowingContainerView)initWithFrame:(CGRect)a3 wrapperViewController:(id)a4;
- (SBIsolatedSceneOrientationFollowingWrapperViewController)wrapperViewController;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)hostOrientation;
- (void)addObserver:(id)a3;
- (void)notifyObserversViewRotatedToOrientation:(int64_t)a3;
- (void)removeObserver:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setHostOrientation:(int64_t)a3;
- (void)setShouldAllowTouchPassthroughIfTransparent:(BOOL)a3;
- (void)setShouldLayoutOverlayImmediatelyForContainerGeometryChange:(BOOL)a3;
@end

@implementation SBIsolatedSceneOrientationFollowingContainerView

- (SBIsolatedSceneOrientationFollowingContainerView)initWithFrame:(CGRect)a3 wrapperViewController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBIsolatedSceneOrientationFollowingContainerView;
  v10 = -[SBIsolatedSceneOrientationFollowingContainerView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_wrapperViewController, v9);
    v11->_shouldLayoutOverlayImmediatelyForContainerGeometryChange = 1;
  }

  return v11;
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v7.receiver = self;
  v7.super_class = (Class)SBIsolatedSceneOrientationFollowingContainerView;
  -[SBIsolatedSceneOrientationFollowingContainerView setCenter:](&v7, sel_setCenter_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrapperViewController);
  objc_msgSend(WeakRetained, "_containerViewDidSetCenter:", x, y);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)SBIsolatedSceneOrientationFollowingContainerView;
  -[SBIsolatedSceneOrientationFollowingContainerView setBounds:](&v9, sel_setBounds_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrapperViewController);
  objc_msgSend(WeakRetained, "_containerViewDidSetBounds:", x, y, width, height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBIsolatedSceneOrientationFollowingContainerView;
  -[SBIsolatedSceneOrientationFollowingContainerView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBIsolatedSceneOrientationFollowingContainerView *)objc_claimAutoreleasedReturnValue();
  if ([(SBIsolatedSceneOrientationFollowingContainerView *)self shouldAllowTouchPassthroughIfTransparent]&& v5 == self)
  {
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (void)setHostOrientation:(int64_t)a3
{
  self->_hostOrientation = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrapperViewController);
  [WeakRetained _containerViewDidSetHostOrientation:a3];
}

- (BOOL)needsCounterRotation
{
  return 1;
}

- (void)setShouldAllowTouchPassthroughIfTransparent:(BOOL)a3
{
  if (self->_shouldAllowTouchPassthroughIfTransparent != a3)
  {
    self->_shouldAllowTouchPassthroughIfTransparent = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_wrapperViewController);
    [WeakRetained _containerViewDidSetAllowsTouchPassthrough:self->_shouldAllowTouchPassthroughIfTransparent];
  }
}

- (void)notifyObserversViewRotatedToOrientation:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = (void *)[(NSHashTable *)self->_observers copy];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) overlayViewDidRotate:self toInterfaceOrientation:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_observers removeObject:v4];
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    id v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      id v4 = v7;
    }
  }
}

- (SBIsolatedSceneOrientationFollowingWrapperViewController)wrapperViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrapperViewController);
  return (SBIsolatedSceneOrientationFollowingWrapperViewController *)WeakRetained;
}

- (int64_t)hostOrientation
{
  return self->_hostOrientation;
}

- (BOOL)shouldLayoutOverlayImmediatelyForContainerGeometryChange
{
  return self->_shouldLayoutOverlayImmediatelyForContainerGeometryChange;
}

- (void)setShouldLayoutOverlayImmediatelyForContainerGeometryChange:(BOOL)a3
{
  self->_shouldLayoutOverlayImmediatelyForContainerGeometryChange = a3;
}

- (BOOL)shouldAllowTouchPassthroughIfTransparent
{
  return self->_shouldAllowTouchPassthroughIfTransparent;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wrapperViewController);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end