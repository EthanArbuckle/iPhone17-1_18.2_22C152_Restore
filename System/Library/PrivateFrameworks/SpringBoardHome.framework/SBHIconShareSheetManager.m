@interface SBHIconShareSheetManager
- (BOOL)areAnyAppIconShareSheetsShowing;
- (BOOL)iconShareSheetsAreHiddenForRotation;
- (BOOL)queuedToPresentShareSheet;
- (CGRect)_iconViewFrameInScreenCoordinateSpace:(id)a3;
- (NSString)locationOfIconWithShareSheetHiddenForRotationAnimation;
- (SBHIconManager)iconManager;
- (SBHIconShareSheetManager)initWithIconManager:(id)a3;
- (SBIcon)iconWithShareSheetHidingForRotationAnimation;
- (SBIconView)iconView;
- (UIView)fakeSourceView;
- (UIViewController)shareSheetViewController;
- (id)_shareSheetPresentationViewControllerForIconView:(id)a3;
- (void)_appIconForceTouchControllerDidDismissNotification:(id)a3;
- (void)_createFakeSourceViewForIconView:(id)a3;
- (void)_presentShareSheet:(id)a3 forIconView:(id)a4;
- (void)_queueShareSheetPresentation:(id)a3 forIconView:(id)a4;
- (void)dealloc;
- (void)dismissIconShareSheetsIfNecessaryAndCleanUp;
- (void)hideIconShareSheetsIfAnyForRotationAnimation;
- (void)presentShareSheetForIconView:(id)a3;
- (void)setFakeSourceView:(id)a3;
- (void)setIconManager:(id)a3;
- (void)setIconShareSheetsAreHiddenForRotation:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setIconWithShareSheetHidingForRotationAnimation:(id)a3;
- (void)setLocationOfIconWithShareSheetHiddenForRotationAnimation:(id)a3;
- (void)setQueuedToPresentShareSheet:(BOOL)a3;
- (void)setShareSheetViewController:(id)a3;
- (void)showIconShareSheetsIfAnyWereHiddenForRotationAnimation;
@end

@implementation SBHIconShareSheetManager

- (BOOL)areAnyAppIconShareSheetsShowing
{
  v2 = [(SBHIconShareSheetManager *)self shareSheetViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIViewController)shareSheetViewController
{
  return self->_shareSheetViewController;
}

- (SBHIconShareSheetManager)initWithIconManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconShareSheetManager;
  v5 = [(SBHIconShareSheetManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__appIconForceTouchControllerDidDismissNotification_ name:@"SBIconViewDidDismissContextMenuNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBHIconShareSheetManager;
  [(SBHIconShareSheetManager *)&v4 dealloc];
}

- (void)dismissIconShareSheetsIfNecessaryAndCleanUp
{
  BOOL v3 = [(SBHIconShareSheetManager *)self fakeSourceView];
  [v3 removeFromSuperview];

  [(SBHIconShareSheetManager *)self setFakeSourceView:0];
  id v5 = [(SBHIconShareSheetManager *)self shareSheetViewController];
  objc_super v4 = [v5 presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
  [(SBHIconShareSheetManager *)self setShareSheetViewController:0];
  [(SBHIconShareSheetManager *)self setIconView:0];
}

- (void)presentShareSheetForIconView:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconShareSheetManager *)self iconManager];
  v6 = [v4 icon];
  v7 = [[SBHIconShareSheetActivityItemProvider alloc] initWithIconManager:v5 icon:v6];
  id v8 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v21[0] = v7;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v10 = (void *)[v8 initWithActivityItems:v9 applicationActivities:0];

  if ([v5 isFloatingDockSupported])
  {
    [(SBHIconShareSheetManager *)self _createFakeSourceViewForIconView:v4];
    v11 = [(SBHIconShareSheetManager *)self fakeSourceView];
    v12 = [v10 popoverPresentationController];
    [v12 setSourceView:v11];
    [v11 bounds];
    objc_msgSend(v12, "setSourceRect:");
    [v12 setPermittedArrowDirections:15];
    [v12 setCanOverlapSourceViewRect:1];
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __57__SBHIconShareSheetManager_presentShareSheetForIconView___block_invoke;
  v16 = &unk_1E6AB11E0;
  objc_copyWeak(&v17, &from);
  objc_copyWeak(&v18, &location);
  [v10 setCompletionWithItemsHandler:&v13];
  -[SBHIconShareSheetManager _queueShareSheetPresentation:forIconView:](self, "_queueShareSheetPresentation:forIconView:", v10, v4, v13, v14, v15, v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __57__SBHIconShareSheetManager_presentShareSheetForIconView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained view];
  BOOL v3 = [v2 window];
  if (!v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 dismissIconShareSheetsIfNecessaryAndCleanUp];
  }
}

- (void)hideIconShareSheetsIfAnyForRotationAnimation
{
  BOOL v3 = [(SBHIconShareSheetManager *)self areAnyAppIconShareSheetsShowing];
  BOOL v4 = [(SBHIconShareSheetManager *)self iconShareSheetsAreHiddenForRotation];
  if (v3 || !v4)
  {
    [(SBHIconShareSheetManager *)self setIconShareSheetsAreHiddenForRotation:1];
    id v8 = [(SBHIconShareSheetManager *)self iconView];
    id v5 = [v8 icon];
    v6 = [v8 location];
    [(SBHIconShareSheetManager *)self setIconWithShareSheetHidingForRotationAnimation:v5];
    [(SBHIconShareSheetManager *)self setLocationOfIconWithShareSheetHiddenForRotationAnimation:v6];
    v7 = [(SBHIconShareSheetManager *)self fakeSourceView];
    objc_msgSend(v7, "setFrame:", -10000.0, -10000.0, 100.0, 100.0);
  }
}

- (void)showIconShareSheetsIfAnyWereHiddenForRotationAnimation
{
  BOOL v3 = [(SBHIconShareSheetManager *)self areAnyAppIconShareSheetsShowing];
  BOOL v4 = [(SBHIconShareSheetManager *)self iconShareSheetsAreHiddenForRotation];
  if (v3 || v4)
  {
    [(SBHIconShareSheetManager *)self setIconShareSheetsAreHiddenForRotation:0];
    id v9 = [(SBHIconShareSheetManager *)self iconManager];
    id v5 = [(SBHIconShareSheetManager *)self iconWithShareSheetHidingForRotationAnimation];
    v6 = [(SBHIconShareSheetManager *)self locationOfIconWithShareSheetHiddenForRotationAnimation];
    v7 = [v9 iconViewForIcon:v5 location:v6];
    if (v7)
    {
      [(SBHIconShareSheetManager *)self setIconView:v7];
      id v8 = [(SBHIconShareSheetManager *)self fakeSourceView];
      [(SBHIconShareSheetManager *)self _iconViewFrameInScreenCoordinateSpace:v7];
      objc_msgSend(v8, "setFrame:");

      [(SBHIconShareSheetManager *)self setIconWithShareSheetHidingForRotationAnimation:0];
      [(SBHIconShareSheetManager *)self setLocationOfIconWithShareSheetHiddenForRotationAnimation:0];
    }
    else
    {
      [(SBHIconShareSheetManager *)self dismissIconShareSheetsIfNecessaryAndCleanUp];
    }
  }
}

- (id)_shareSheetPresentationViewControllerForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconShareSheetManager *)self iconManager];
  if ([v5 isFloatingDockSupported])
  {
    v6 = [v5 floatingDockViewControllerForView:v4];
  }
  else
  {
    v7 = [v4 window];

    v6 = [v7 rootViewController];
    id v4 = v7;
  }

  return v6;
}

- (void)_queueShareSheetPresentation:(id)a3 forIconView:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(SBHIconShareSheetManager *)self setShareSheetViewController:v8];
  [(SBHIconShareSheetManager *)self setIconView:v6];
  v7 = [(SBHIconShareSheetManager *)self iconManager];
  if ([v7 isFloatingDockSupported]
    && [v7 isShowingIconContextMenu])
  {
    [(SBHIconShareSheetManager *)self setQueuedToPresentShareSheet:1];
  }
  else
  {
    [(SBHIconShareSheetManager *)self _presentShareSheet:v8 forIconView:v6];
  }
}

- (void)_appIconForceTouchControllerDidDismissNotification:(id)a3
{
  if ([(SBHIconShareSheetManager *)self queuedToPresentShareSheet])
  {
    [(SBHIconShareSheetManager *)self setQueuedToPresentShareSheet:0];
    id v5 = [(SBHIconShareSheetManager *)self shareSheetViewController];
    id v4 = [(SBHIconShareSheetManager *)self iconView];
    [(SBHIconShareSheetManager *)self _presentShareSheet:v5 forIconView:v4];
  }
}

- (void)_presentShareSheet:(id)a3 forIconView:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(SBHIconShareSheetManager *)self _iconViewFrameInScreenCoordinateSpace:v6];
  if (CGRectIsEmpty(v10))
  {
    [(SBHIconShareSheetManager *)self dismissIconShareSheetsIfNecessaryAndCleanUp];
  }
  else
  {
    v7 = [(SBHIconShareSheetManager *)self _shareSheetPresentationViewControllerForIconView:v6];
    [v7 presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_createFakeSourceViewForIconView:(id)a3
{
  id v4 = a3;
  [(SBHIconShareSheetManager *)self _iconViewFrameInScreenCoordinateSpace:v4];
  id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
  id v9 = [(SBHIconShareSheetManager *)self _shareSheetPresentationViewControllerForIconView:v4];

  CGRect v10 = [v9 view];
  [v10 addSubview:v11];
  [(SBHIconShareSheetManager *)self setFakeSourceView:v11];
}

- (CGRect)_iconViewFrameInScreenCoordinateSpace:(id)a3
{
  id v3 = a3;
  id v4 = [v3 window];
  double v5 = [v4 screen];
  [v3 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 iconImageFrame];
  double Height = CGRectGetHeight(v27);
  uint64_t v13 = [v3 superview];

  uint64_t v14 = [v5 coordinateSpace];
  objc_msgSend(v13, "convertRect:toCoordinateSpace:", v14, v7, v9, v11, Height);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void)setIconManager:(id)a3
{
}

- (SBIconView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  return (SBIconView *)WeakRetained;
}

- (void)setIconView:(id)a3
{
}

- (SBIcon)iconWithShareSheetHidingForRotationAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconWithShareSheetHidingForRotationAnimation);
  return (SBIcon *)WeakRetained;
}

- (void)setIconWithShareSheetHidingForRotationAnimation:(id)a3
{
}

- (NSString)locationOfIconWithShareSheetHiddenForRotationAnimation
{
  return self->_locationOfIconWithShareSheetHiddenForRotationAnimation;
}

- (void)setLocationOfIconWithShareSheetHiddenForRotationAnimation:(id)a3
{
}

- (UIView)fakeSourceView
{
  return self->_fakeSourceView;
}

- (void)setFakeSourceView:(id)a3
{
}

- (void)setShareSheetViewController:(id)a3
{
}

- (BOOL)queuedToPresentShareSheet
{
  return self->_queuedToPresentShareSheet;
}

- (void)setQueuedToPresentShareSheet:(BOOL)a3
{
  self->_queuedToPresentShareSheet = a3;
}

- (BOOL)iconShareSheetsAreHiddenForRotation
{
  return self->_iconShareSheetsAreHiddenForRotation;
}

- (void)setIconShareSheetsAreHiddenForRotation:(BOOL)a3
{
  self->_iconShareSheetsAreHiddenForRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareSheetViewController, 0);
  objc_storeStrong((id *)&self->_fakeSourceView, 0);
  objc_storeStrong((id *)&self->_locationOfIconWithShareSheetHiddenForRotationAnimation, 0);
  objc_destroyWeak((id *)&self->_iconWithShareSheetHidingForRotationAnimation);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_iconManager);
}

@end