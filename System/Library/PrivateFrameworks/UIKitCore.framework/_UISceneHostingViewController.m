@interface _UISceneHostingViewController
+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing;
- (_UIRemoteSheet)_remoteSheet;
- (id)initWithSceneHostingController:(void *)a1;
- (int64_t)interfaceElementCategory;
- (void)_childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:(id)a3;
- (void)loadView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _UISceneHostingViewController

- (id)initWithSceneHostingController:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)_UISceneHostingViewController;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
  v4 = v3;
  if (v3) {
    objc_storeWeak(v3 + 122, a2);
  }
  return v4;
}

- (void)loadView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  v3 = [WeakRetained sceneView];
  [(UIViewController *)self setView:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_UISceneHostingViewController;
  [(UIViewController *)&v15 viewWillAppear:a3];
  p_sceneHostingController = &self->_sceneHostingController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  uint64_t v6 = self;
  v7 = +[_UISceneHostingViewAppearanceActionHostToClient _actionForActionType:](v6, 0);
  [WeakRetained sendAction:v7];

  if (self)
  {
    v8 = [(UIViewController *)self _existingPresentationControllerImmediate:0 effective:1];
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    id v12 = v11;

    id v13 = objc_loadWeakRetained((id *)p_sceneHostingController);
    v14 = [v13 _remoteSheetProvider];

    if (v14)
    {
      if (v12) {
        [v12 _tryToConnectToRemoteSheet:v14];
      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UISceneHostingViewController;
  [(UIViewController *)&v7 viewWillDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  uint64_t v5 = self;
  uint64_t v6 = +[_UISceneHostingViewAppearanceActionHostToClient _actionForActionType:](v5, 1);
  [WeakRetained sendAction:v6];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UISceneHostingViewController;
  [(UIViewController *)&v7 viewDidDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  uint64_t v5 = self;
  uint64_t v6 = +[_UISceneHostingViewAppearanceActionHostToClient _actionForActionType:](v5, 2);
  [WeakRetained sendAction:v6];
}

+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 1;
}

- (void)_childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_UISceneHostingViewController;
  -[UIViewController _childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:](&v16, sel__childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter_);
  id v5 = a3;
  if (v5)
  {
    do
    {
      uint64_t v6 = [v5 _existingView];
      objc_super v7 = [v6 window];

      if (v7) {
        break;
      }
      uint64_t v8 = [v5 parentViewController];

      id v5 = (id)v8;
    }
    while (v8);
  }
  uint64_t v9 = [v5 _existingView];
  id v10 = [v9 window];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  id v12 = WeakRetained;
  if (WeakRetained) {
    id v13 = (void *)*((void *)WeakRetained + 10);
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  objc_super v15 = [v14 _relationshipManagementHostComponent];
  [v15 _willMoveToWindowWithDelayedPresentation:v10];
}

- (int64_t)interfaceElementCategory
{
  return 3;
}

- (_UIRemoteSheet)_remoteSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  v3 = [WeakRetained _remoteSheetProvider];

  return (_UIRemoteSheet *)v3;
}

- (void).cxx_destruct
{
}

@end