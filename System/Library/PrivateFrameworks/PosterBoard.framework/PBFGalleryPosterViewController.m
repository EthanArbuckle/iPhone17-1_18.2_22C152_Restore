@interface PBFGalleryPosterViewController
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (PBFDisplayContext)displayContext;
- (PBFGalleryPosterViewController)initWithExtensionInstance:(id)a3 preview:(id)a4 definition:(id)a5;
- (PBFGalleryPosterViewControllerDelegate)delegate;
- (PBFPosterPreview)preview;
- (PBFPosterSnapshotDefinition)definition;
- (PFPosterExtensionInstance)extensionInstance;
- (int64_t)state;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setupSceneViewController;
- (void)_updateSceneViewController;
- (void)invalidate;
- (void)sceneSnapshotViewController:(id)a3 stateChangedTo:(int64_t)a4;
- (void)sceneSnapshotViewController:(id)a3 stateWillChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setDisplayContext:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PBFGalleryPosterViewController

- (PBFGalleryPosterViewController)initWithExtensionInstance:(id)a3 preview:(id)a4 definition:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extensionInstance"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryPosterViewController initWithExtensionInstance:preview:definition:]();
    }
LABEL_15:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325B154);
  }
  if (!v10)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"preview"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryPosterViewController initWithExtensionInstance:preview:definition:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325B1B8);
  }
  v12 = v11;
  if (!v11)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"definition"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryPosterViewController initWithExtensionInstance:preview:definition:]();
    }
    goto LABEL_15;
  }
  v22.receiver = self;
  v22.super_class = (Class)PBFGalleryPosterViewController;
  v13 = [(PBFGalleryPosterViewController *)&v22 initWithNibName:0 bundle:0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extensionInstance, a3);
    objc_storeStrong((id *)&v14->_preview, a4);
    objc_storeStrong((id *)&v14->_definition, a5);
    uint64_t v15 = objc_opt_new();
    transformView = v14->_transformView;
    v14->_transformView = (UIView *)v15;

    v17 = v14->_transformView;
    v18 = [MEMORY[0x1E4FB1618] redColor];
    [(UIView *)v17 setBackgroundColor:v18];
  }
  return v14;
}

- (void)setDisplayContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryPosterViewController setDisplayContext:]();
    }
LABEL_13:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325B354);
  }
  id v9 = v5;
  if (([v5 conformsToProtocol:&unk_1F2AE68B8] & 1) == 0)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryPosterViewController setDisplayContext:]();
    }
    goto LABEL_13;
  }

  if (([v9 isEqualToDisplayContext:self->_displayContext] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayContext, a3);
    [(PBFGalleryPosterViewController *)self _updateSceneViewController];
    v6 = [(PBFGalleryPosterViewController *)self view];
    [v6 setNeedsLayout];

    v7 = [(PBFGalleryPosterViewController *)self view];
    [v7 layoutIfNeeded];
  }
}

- (void)_setupSceneViewController
{
  if (self->_displayContext)
  {
    id v10 = [(PBFPosterPreview *)self->_preview posterDescriptorLookupInfo];
    v3 = objc_msgSend(MEMORY[0x1E4F92630], "pbf_configurableOptionsForPreview:", self->_preview);
    v4 = objc_msgSend(MEMORY[0x1E4F92640], "pbf_configuredPropertiesForPreview:", self->_preview);
    id v5 = [_PBFPosterSceneSnapshotViewController alloc];
    extensionInstance = self->_extensionInstance;
    v7 = [v10 posterDescriptorPath];
    v8 = [(_PBFPosterSceneSnapshotViewController *)v5 initWithProvider:extensionInstance contents:v7 configurableOptions:v3 configuredProperties:v4 preview:self->_preview definition:self->_definition];
    sceneViewController = self->_sceneViewController;
    self->_sceneViewController = v8;

    [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController setDisplayContext:self->_displayContext];
    [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController setDelegate:self];
    [(PBFGalleryPosterViewController *)self bs_addChildViewController:self->_sceneViewController withSuperview:self->_transformView];
    [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController bs_beginAppearanceTransition:1 animated:0];
    [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController bs_endAppearanceTransition];
    [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController setScenePresenterIsValid:1];
    [(PRSceneViewController *)self->_sceneViewController setForcesSceneForeground:1];
  }
}

- (void)_updateSceneViewController
{
  if (self->_sceneViewController) {
    [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController setDisplayContext:self->_displayContext];
  }
  else {
    [(PBFGalleryPosterViewController *)self _setupSceneViewController];
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PBFGalleryPosterViewController;
  [(PBFGalleryPosterViewController *)&v8 viewDidLoad];
  v3 = [(PBFGalleryPosterViewController *)self view];
  [v3 addSubview:self->_transformView];

  transformView = self->_transformView;
  id v5 = [(PBFGalleryPosterViewController *)self view];
  [v5 bounds];
  -[UIView setFrame:](transformView, "setFrame:");

  v6 = self->_transformView;
  v7 = [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController view];
  [(UIView *)v6 addSubview:v7];
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PBFGalleryPosterViewController;
  [(PBFGalleryPosterViewController *)&v24 viewDidLayoutSubviews];
  v3 = [(PBFGalleryPosterViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  -[UIView setFrame:](self->_transformView, "setFrame:");
  objc_super v8 = [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController view];
  [(PBFDisplayContext *)self->_displayContext pbf_frame];
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(v8, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeScale(&v23, v5 / v10, v7 / v12);
  memset(&v22, 0, sizeof(v22));
  uint64_t v13 = [(PBFGalleryPosterViewController *)self interfaceOrientation];
  double v14 = 0.0;
  if (v13 != 1)
  {
    if ([(PBFGalleryPosterViewController *)self interfaceOrientation] == 4)
    {
      double v14 = -1.57079633;
    }
    else if ([(PBFGalleryPosterViewController *)self interfaceOrientation] == 3)
    {
      double v14 = 1.57079633;
    }
    else
    {
      uint64_t v15 = [(PBFGalleryPosterViewController *)self interfaceOrientation];
      double v14 = 3.14159265;
      if (v15 != 2) {
        double v14 = 0.0;
      }
    }
  }
  CGAffineTransformMakeRotation(&v20, v14);
  UIIntegralTransform();
  CGAffineTransformInvert(&v22, &v21);
  CGAffineTransform t1 = v23;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransform v17 = v22;
  CGAffineTransformConcat(&v19, &t1, &v17);
  transformView = self->_transformView;
  CGAffineTransform t1 = v19;
  [(UIView *)transformView setTransform:&t1];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(PBFGalleryPosterViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)sceneSnapshotViewController:(id)a3 stateWillChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 galleryPosterViewController:self stateWillChangeFrom:a4 to:a5];
  }
}

- (void)sceneSnapshotViewController:(id)a3 stateChangedTo:(int64_t)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 galleryPosterViewController:self stateChangedTo:a4];
  }
  if (a4 == 1 && !self->_isInvalidated)
  {
    posterRuntimeAssertion = self->_posterRuntimeAssertion;
    if (posterRuntimeAssertion) {
      [(RBSAssertion *)posterRuntimeAssertion invalidate];
    }
    double v12 = [(PFPosterExtensionInstance *)self->_extensionInstance processIdentity];
    uint64_t v13 = [MEMORY[0x1E4F96478] targetWithProcessIdentity:v12];
    objc_msgSend(MEMORY[0x1E4F96318], "pf_posterUpdateRuntimeAssertionForTarget:explanation:", v13, @"Gallery Poster View Controller Wants This To Run");
    double v14 = (RBSAssertion *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = self->_posterRuntimeAssertion;
    self->_posterRuntimeAssertion = v14;

    v16 = self->_posterRuntimeAssertion;
    uint64_t v18 = 0;
    [(RBSAssertion *)v16 acquireWithError:&v18];
    if (v18)
    {
      CGAffineTransform v17 = self->_posterRuntimeAssertion;
      self->_posterRuntimeAssertion = 0;
    }
  }
  else
  {
    [(RBSAssertion *)self->_posterRuntimeAssertion invalidate];
    char v10 = self->_posterRuntimeAssertion;
    self->_posterRuntimeAssertion = 0;
  }
}

- (int64_t)state
{
  return [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController state];
}

- (void)invalidate
{
  self->_isInvalidated = 1;
  [(_PBFPosterSceneSnapshotViewController *)self->_sceneViewController invalidate];
  [(RBSAssertion *)self->_posterRuntimeAssertion invalidate];
  posterRuntimeAssertion = self->_posterRuntimeAssertion;
  self->_posterRuntimeAssertion = 0;
}

- (PBFGalleryPosterViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBFGalleryPosterViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (PBFPosterPreview)preview
{
  return self->_preview;
}

- (PBFPosterSnapshotDefinition)definition
{
  return self->_definition;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_posterRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
}

- (void)initWithExtensionInstance:preview:definition:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionInstance:preview:definition:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionInstance:preview:definition:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setDisplayContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end