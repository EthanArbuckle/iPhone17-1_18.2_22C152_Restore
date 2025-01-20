@interface SBSceneViewController
- (CGSize)contentReferenceSize;
- (SBSceneHandle)sceneHandle;
- (SBScenePlaceholderContentContext)placeholderContentContext;
- (SBSceneView)_sceneView;
- (SBSceneViewController)initWithCoder:(id)a3;
- (SBSceneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBSceneViewController)initWithSceneHandle:(id)a3;
- (UIView)customContentView;
- (id)newSnapshot;
- (id)newSnapshotView;
- (id)sceneViewPresentationIdentifier:(id)a3;
- (int64_t)containerOrientation;
- (int64_t)contentOrientation;
- (int64_t)displayMode;
- (int64_t)sceneViewPresentationPriority:(id)a3;
- (void)_setSceneView:(id)a3;
- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4;
- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5;
- (void)setCustomContentView:(id)a3;
- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5;
- (void)setPlaceholderContentContext:(id)a3;
- (void)viewDidLoad;
@end

@implementation SBSceneViewController

- (SBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBSceneView)_sceneView
{
  return self->_sceneView;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  id v10 = a4;
  v8 = (void (**)(void))a5;
  if (self->_displayMode == a3
    || (self->_displayMode = a3, ![(SBSceneViewController *)self isViewLoaded]))
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    v9 = [(SBSceneViewController *)self _sceneView];
    [v9 setDisplayMode:a3 animationFactory:v10 completion:v8];
  }
}

- (void)setPlaceholderContentContext:(id)a3
{
  v5 = (SBScenePlaceholderContentContext *)a3;
  if (self->_placeholderContentContext != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_placeholderContentContext, a3);
    if ([(SBSceneViewController *)self isViewLoaded])
    {
      v6 = [(SBSceneViewController *)self _sceneView];
      [v6 setPlaceholderContentContext:v7];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  BOOL v9 = self->_contentReferenceSize.width != a3.width;
  if (self->_contentReferenceSize.height != a3.height) {
    BOOL v9 = 1;
  }
  if (v9) {
    self->_contentReferenceSize = a3;
  }
  if (self->_contentOrientation != a4)
  {
    self->_contentOrientation = a4;
    BOOL v9 = 1;
  }
  if (self->_containerOrientation != a5) {
    self->_containerOrientation = a5;
  }
  if (v9 && [(SBSceneViewController *)self isViewLoaded])
  {
    id v10 = [(SBSceneViewController *)self _sceneView];
    objc_msgSend(v10, "_updateReferenceSize:andOrientation:", a4, width, height);
  }
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return 0;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (SBSceneViewController)initWithSceneHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneViewController;
  v6 = [(SBSceneViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneHandle, a3);
    v7->_displayMode = 0;
    v7->_contentReferenceSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v7->_containerOrientation = 1;
    v7->_contentOrientation = 1;
  }

  return v7;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)SBSceneViewController;
  [(SBSceneViewController *)&v28 viewDidLoad];
  v3 = [(SBSceneViewController *)self view];
  sceneView = self->_sceneView;
  if (sceneView)
  {
    [(SBSceneViewController *)self contentReferenceSize];
    -[SBSceneView _updateReferenceSize:andOrientation:](sceneView, "_updateReferenceSize:andOrientation:", [(SBSceneViewController *)self contentOrientation], v5, v6);
  }
  else
  {
    sceneHandle = self->_sceneHandle;
    [(SBSceneViewController *)self contentReferenceSize];
    id v10 = -[SBSceneHandle newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:](sceneHandle, "newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:", [(SBSceneViewController *)self contentOrientation], [(SBSceneViewController *)self containerOrientation], self, v8, v9);
    v11 = self->_sceneView;
    self->_sceneView = v10;
  }
  v12 = self->_sceneView;
  v13 = [(SBSceneViewController *)self customContentView];
  [(SBSceneView *)v12 setCustomContentView:v13];

  v14 = self->_sceneView;
  v15 = [(SBSceneViewController *)self placeholderContentContext];
  [(SBSceneView *)v14 setPlaceholderContentContext:v15];

  [(SBSceneView *)self->_sceneView setDisplayMode:[(SBSceneViewController *)self displayMode] animationFactory:0 completion:0];
  [(SBSceneView *)self->_sceneView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_sceneView];
  v16 = [(SBSceneView *)self->_sceneView leftAnchor];
  v17 = [v3 leftAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(SBSceneView *)self->_sceneView rightAnchor];
  v20 = [v3 rightAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [(SBSceneView *)self->_sceneView topAnchor];
  v23 = [v3 topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = [(SBSceneView *)self->_sceneView bottomAnchor];
  v26 = [v3 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v27 setActive:1];
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return self->_placeholderContentContext;
}

- (UIView)customContentView
{
  return self->_customContentView;
}

- (CGSize)contentReferenceSize
{
  double width = self->_contentReferenceSize.width;
  double height = self->_contentReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  v3 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v3);
}

- (SBSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3A8];
  v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  [v5 raise:v6, @"%s is not a valid initializer. You must call -[%@ initWithSceneHandle:].", "-[SBSceneViewController initWithNibName:bundle:]", v8 format];

  return [(SBSceneViewController *)self initWithSceneHandle:0];
}

- (void)invalidate
{
}

- (void)dealloc
{
  if ([(SBSceneViewController *)self isViewLoaded]) {
    [(SBSceneView *)self->_sceneView invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBSceneViewController;
  [(SBSceneViewController *)&v3 dealloc];
}

- (SBSceneViewController)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  [v4 raise:v5, @"%@ does not support unarchiving from a nib.", v8 format];

  v11.receiver = self;
  v11.super_class = (Class)SBSceneViewController;
  double v9 = [(SBSceneViewController *)&v11 initWithCoder:v6];

  return v9;
}

- (void)setCustomContentView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  if (self->_customContentView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_customContentView, a3);
    if ([(SBSceneViewController *)self isViewLoaded])
    {
      id v6 = [(SBSceneViewController *)self _sceneView];
      [v6 setCustomContentView:v7];
    }
  }
  MEMORY[0x1F4181820]();
}

- (id)newSnapshot
{
  return [(SBSceneView *)self->_sceneView newSnapshot];
}

- (id)newSnapshotView
{
  id v3 = [(SBSceneView *)self->_sceneView newSnapshot];
  v4 = v3;
  if (v3)
  {
    [v3 capture];
    uint64_t v5 = [(SBSceneHandle *)self->_sceneHandle sceneIfExists];
    id v6 = [v5 uiPresentationManager];
    v7 = [v6 snapshotPresentationForSnapshot:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4
{
  v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBSceneViewController.m", 106, @"Invalid parameter not satisfying: %@", @"snapshotViewBlock" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"SBSceneViewController.m", 107, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  id v9 = [(SBSceneView *)self->_sceneView newSnapshot];
  id v10 = v9;
  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SBSceneViewController_newSnapshotViewOnQueue_withCompletion___block_invoke;
    block[3] = &unk_1E6AFCAC8;
    id v14 = v9;
    v15 = self;
    id v16 = v8;
    dispatch_async(v7, block);
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __63__SBSceneViewController_newSnapshotViewOnQueue_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) capture];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SBSceneViewController_newSnapshotViewOnQueue_withCompletion___block_invoke_2;
  block[3] = &unk_1E6AF5A00;
  id v6 = *(id *)(a1 + 48);
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__SBSceneViewController_newSnapshotViewOnQueue_withCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  id v5 = [*(id *)(a1[4] + 976) sceneIfExists];
  int8x16_t v3 = [v5 uiPresentationManager];
  v4 = [v3 snapshotPresentationForSnapshot:a1[5]];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
}

- (void)_setSceneView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_placeholderContentContext, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end