@interface SBFluidSwitcherScreenEdgePanGestureRecognizer
- (SBFluidSwitcherViewController)switcherViewController;
- (id)viewForTouchHistory;
- (int64_t)_touchInterfaceOrientation;
- (void)reset;
- (void)setState:(int64_t)a3;
- (void)setSwitcherViewController:(id)a3;
@end

@implementation SBFluidSwitcherScreenEdgePanGestureRecognizer

- (id)viewForTouchHistory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
  v3 = [WeakRetained view];

  return v3;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherScreenEdgePanGestureRecognizer;
  [(SBHomeGesturePanGestureRecognizer *)&v3 reset];
  self->_touchInterfaceOrientationWhenGestureBegan = 0;
}

- (void)setState:(int64_t)a3
{
  if (a3 == 1) {
    self->_touchInterfaceOrientationWhenGestureBegan = [(SBFluidSwitcherScreenEdgePanGestureRecognizer *)self _touchInterfaceOrientation];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherScreenEdgePanGestureRecognizer;
  [(SBFluidSwitcherScreenEdgePanGestureRecognizer *)&v5 setState:a3];
}

- (int64_t)_touchInterfaceOrientation
{
  int64_t touchInterfaceOrientationWhenGestureBegan = self->_touchInterfaceOrientationWhenGestureBegan;
  if (!touchInterfaceOrientationWhenGestureBegan)
  {
    v4 = [(SBFluidSwitcherScreenEdgePanGestureRecognizer *)self switcherViewController];
    objc_super v5 = v4;
    if (v4)
    {
      v6 = [v4 dataSource];
      v7 = [v5 _sbWindowScene];
      v8 = [v7 transientOverlayPresenter];

      if ([v8 hasActivePresentation])
      {
        uint64_t v9 = [v8 topmostViewControllerInterfaceOrientation];
      }
      else
      {
        v10 = [v5 layoutContext];
        v11 = [v10 layoutState];
        uint64_t v12 = [v11 unlockedEnvironmentMode];

        if (v12 == 1) {
          uint64_t v9 = [v6 homeScreenInterfaceOrientationForContentController:v5];
        }
        else {
          uint64_t v9 = [v6 switcherInterfaceOrientationForSwitcherContentController:v5];
        }
      }
      int64_t touchInterfaceOrientationWhenGestureBegan = v9;
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)SBFluidSwitcherScreenEdgePanGestureRecognizer;
      int64_t touchInterfaceOrientationWhenGestureBegan = [(SBHomeGesturePanGestureRecognizer *)&v14 _touchInterfaceOrientation];
    }
  }
  return touchInterfaceOrientationWhenGestureBegan;
}

- (SBFluidSwitcherViewController)switcherViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
  return (SBFluidSwitcherViewController *)WeakRetained;
}

- (void)setSwitcherViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end