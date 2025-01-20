@interface PXSplitViewController
+ (void)initialize;
- (BOOL)_isDisplayModeAllVisibleAllowed;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isSidebarVisible;
- (BOOL)wantsSidebarHidden;
- (PXSplitViewController)initWithSidebarNavigationController:(id)a3 contentViewController:(id)a4 compactViewController:(id)a5;
- (UIViewController)contentViewController;
- (UIViewController)sidebarViewController;
- (id)preferredFocusEnvironments;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (int64_t)_splitViewController:(id)a3 overrideProposedPermission:(int64_t)a4 forInteractivePresentationGesture:(id)a5 inView:(id)a6;
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (void)dismissPrimaryColumnIfOverlay;
- (void)registerChangeObserver:(id)a3;
- (void)requestFocusUpdateWithPreferredFocusEnvironment:(id)a3;
- (void)setWantsSidebarHidden:(BOOL)a3;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)toggleSidebarVisibilityAnimated;
- (void)unregisterChangeObserver:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PXSplitViewController

+ (void)initialize
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v4 = @"sidebarHiddenOnLaunch";
    v5[0] = MEMORY[0x1E4F1CC38];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    [v2 registerDefaults:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_preferredFocusEnvironmentForNextRequest, 0);
}

- (BOOL)wantsSidebarHidden
{
  return self->_wantsSidebarHidden;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (UIViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (int64_t)_splitViewController:(id)a3 overrideProposedPermission:(int64_t)a4 forInteractivePresentationGesture:(id)a5 inView:(id)a6
{
  id v7 = a6;
  [a5 locationInView:v7];
  LODWORD(a5) = objc_msgSend(v7, "px_areAllScrollViewsContainingPoint:scrolledAtEdge:", objc_msgSend(v7, "px_leadingEdge"), v8, v9);

  if (a5) {
    return 0;
  }
  else {
    return 2;
  }
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a4;
  double v9 = [v7 array];
  v10 = [(PXSplitViewController *)self sidebarViewController];
  v11 = objc_msgSend(v10, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v8, x, y);
  [v9 addObjectsFromArray:v11];

  v12 = [(PXSplitViewController *)self contentViewController];
  v13 = objc_msgSend(v12, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v8, x, y);

  [v9 addObjectsFromArray:v13];
  return v9;
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(NSHashTable *)self->_changeObservers allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 splitViewControllerWillExpand:self];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return a4;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_inViewWillTransitionToSize)
  {
    dispatch_time_t v7 = dispatch_time(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke;
    block[3] = &unk_1E5DD08D8;
    block[4] = self;
    block[5] = a4;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v8 setBool:a4 == 1 forKey:@"sidebarHiddenOnLaunch"];

  char v9 = PXIsSidebarVisibleWithDisplayMode(a4);
  uint64_t v10 = [(NSHashTable *)self->_changeObservers allObjects];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke_2;
  aBlock[3] = &unk_1E5DCFD90;
  aBlock[4] = self;
  char v28 = v9;
  v11 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v11[2](v11, *(void *)(*((void *)&v23 + 1) + 8 * i));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v14);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke_3;
  v19[3] = &unk_1E5DCFDB8;
  v19[4] = self;
  id v20 = v12;
  id v21 = v11;
  char v22 = v9;
  v17 = v11;
  id v18 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v19);
}

uint64_t __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreferredDisplayMode:*(void *)(a1 + 40) == 1];
}

void __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 splitViewController:*(void *)(a1 + 32) willChangeSidebarVisibility:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1024), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        dispatch_time_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([*(id *)(a1 + 40) containsObject:v7] & 1) == 0) {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        if (objc_opt_respondsToSelector()) {
          [v7 splitViewController:*(void *)(a1 + 32) didChangeSidebarVisibility:*(unsigned __int8 *)(a1 + 56)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  self->_inViewWillTransitionToSize = 1;
  v5.receiver = self;
  v5.super_class = (Class)PXSplitViewController;
  -[PXSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  self->_inViewWillTransitionToSize = 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_toggleSidebar_ == a3
    && ([(PXSplitViewController *)self presentedViewController],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    BOOL v7 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXSplitViewController;
    BOOL v7 = [(PXSplitViewController *)&v10 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_preferredFocusEnvironmentForNextRequest)
  {
    v7[0] = self->_preferredFocusEnvironmentForNextRequest;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    preferredFocusEnvironmentForNextRequest = self->_preferredFocusEnvironmentForNextRequest;
    self->_preferredFocusEnvironmentForNextRequest = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXSplitViewController;
    uint64_t v3 = [(PXSplitViewController *)&v6 preferredFocusEnvironments];
  }
  return v3;
}

- (void)requestFocusUpdateWithPreferredFocusEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFocusEnvironmentForNextRequest, a3);
  id v5 = a3;
  id v6 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];

  [v6 requestFocusUpdateToEnvironment:self];
}

- (void)dismissPrimaryColumnIfOverlay
{
  if ([(PXSplitViewController *)self displayMode] == 3)
  {
    [(PXSplitViewController *)self hideColumn:0];
  }
}

- (void)toggleSidebarVisibilityAnimated
{
  if ([(PXSplitViewController *)self isSidebarVisible])
  {
    [(PXSplitViewController *)self hideColumn:0];
  }
  else
  {
    [(PXSplitViewController *)self showColumn:0];
  }
}

- (void)setWantsSidebarHidden:(BOOL)a3
{
  if (self->_wantsSidebarHidden != a3)
  {
    self->_wantsSidebarHidden = a3;
    if (a3)
    {
      self->_int64_t originalPreferredDisplayMode = [(PXSplitViewController *)self preferredDisplayMode];
      int64_t originalPreferredDisplayMode = 1;
    }
    else
    {
      int64_t originalPreferredDisplayMode = self->_originalPreferredDisplayMode;
    }
    [(PXSplitViewController *)self setPreferredDisplayMode:originalPreferredDisplayMode];
  }
}

- (BOOL)isSidebarVisible
{
  uint64_t v2 = [(PXSplitViewController *)self displayMode];
  return PXIsSidebarVisibleWithDisplayMode(v2);
}

- (void)unregisterChangeObserver:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSplitViewController.m", 99, @"%s must be called on the main thread", "-[PXSplitViewController unregisterChangeObserver:]");
  }
  [(NSHashTable *)self->_changeObservers removeObject:v6];
}

- (void)registerChangeObserver:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSplitViewController.m", 92, @"%s must be called on the main thread", "-[PXSplitViewController registerChangeObserver:]");
  }
  if (![(NSHashTable *)self->_changeObservers containsObject:v6]) {
    [(NSHashTable *)self->_changeObservers addObject:v6];
  }
}

- (BOOL)_isDisplayModeAllVisibleAllowed
{
  int64_t v3 = [(UIViewController *)self px_deprecatedInterfaceOrientation];
  uint64_t v4 = [(PXSplitViewController *)self view];
  [v4 frame];
  double v6 = v5;

  if (v6 <= 980.0) {
    return 0;
  }
  BOOL v7 = [(PXSplitViewController *)self traitCollection];
  BOOL v9 = [v7 horizontalSizeClass] == 2 && (unint64_t)(v3 - 3) < 2;

  return v9;
}

- (PXSplitViewController)initWithSidebarNavigationController:(id)a3 contentViewController:(id)a4 compactViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXSplitViewController;
  id v12 = [(PXSplitViewController *)&v19 initWithStyle:1];
  uint64_t v13 = v12;
  if (v12)
  {
    [(PXSplitViewController *)v12 setViewController:v9 forColumn:0];
    [(PXSplitViewController *)v13 setViewController:v10 forColumn:2];
    [(PXSplitViewController *)v13 setViewController:v11 forColumn:3];
    objc_storeStrong((id *)&v13->_sidebarViewController, a3);
    objc_storeStrong((id *)&v13->_contentViewController, a4);
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    changeObservers = v13->_changeObservers;
    v13->_changeObservers = (NSHashTable *)v14;

    long long v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v17 = [v16 BOOLForKey:@"sidebarHiddenOnLaunch"];

    if (v17) {
      [(PXSplitViewController *)v13 setPreferredDisplayMode:1];
    }
    [(PXSplitViewController *)v13 setDelegate:v13];
  }

  return v13;
}

@end