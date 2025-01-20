@interface SBLayoutElementViewController
- (BOOL)_shouldDisplayLayoutElementBecomeActive;
- (BOOL)isDragging;
- (BOOL)supportsReuse;
- (CGRect)referenceFrame;
- (FBSDisplayIdentity)displayIdentity;
- (SBDragPreviewShadowParameters)initialDiffuseShadowParameters;
- (SBDragPreviewShadowParameters)initialRimShadowParameters;
- (SBLayoutElement)layoutElement;
- (SBLayoutElementViewController)initWithCoder:(id)a3;
- (SBLayoutElementViewController)initWithDisplayIdentity:(id)a3;
- (SBLayoutElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBLayoutState)layoutState;
- (UIView)_contentContainerView;
- (id)_newDisplayLayoutElementForEntity:(id)a3;
- (id)_sbWindowScene;
- (id)animationControllerForTransitionRequest:(id)a3;
- (id)containerViewForBlurContentView;
- (id)initialCornerRadiusConfiguration;
- (id)initialDiffuseShadowFilters;
- (id)initialRimShadowFilters;
- (id)mainWorkspaceApplicationSceneLayoutElementViewController;
- (id)sourceView;
- (int64_t)contentWrapperInterfaceOrientation;
- (unint64_t)supportedContentInterfaceOrientations;
- (void)_updateDisplayLayoutElementVisibility;
- (void)_updateDisplayLayoutElementWithBuilder:(id)a3;
- (void)configureWithWorkspaceEntity:(id)a3 forLayoutElement:(id)a4 layoutState:(id)a5 referenceFrame:(CGRect)a6;
- (void)dealloc;
- (void)didEndTransitionToVisible:(BOOL)a3;
- (void)invalidate;
- (void)loadView;
- (void)prepareForReuse;
- (void)setContentWrapperInterfaceOrientation:(int64_t)a3;
- (void)setDragging:(BOOL)a3;
- (void)willBeginTransitionToVisible:(BOOL)a3;
@end

@implementation SBLayoutElementViewController

- (SBLayoutElementViewController)initWithDisplayIdentity:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLayoutElementViewController;
  v6 = [(SBLayoutElementViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayIdentity, a3);
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v7->_referenceFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v7->_referenceFrame.size = v8;
    v7->_supportedContentInterfaceOrientations = 2;
    v7->_contentWrapperInterfaceOrientation = 1;
    v7->_isViewVisible = 0;
    v7->_isTransitioningVisibility = 0;
  }

  return v7;
}

- (SBLayoutElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3A8];
  v7 = (objc_class *)objc_opt_class();
  CGSize v8 = NSStringFromClass(v7);
  [v5 raise:v6, @"%s is not a valid initializer. You must call -[%@ initWithDisplayIdentity:].", "-[SBLayoutElementViewController initWithNibName:bundle:]", v8 format];

  return [(SBLayoutElementViewController *)self initWithDisplayIdentity:0];
}

- (void)dealloc
{
  [(SBLayoutElementViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBLayoutElementViewController;
  [(SBLayoutElementViewController *)&v3 dealloc];
}

- (SBLayoutElementViewController)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  CGSize v8 = NSStringFromClass(v7);
  [v4 raise:v5, @"%@ does not support unarchiving from a nib.", v8 format];

  v11.receiver = self;
  v11.super_class = (Class)SBLayoutElementViewController;
  v9 = [(SBLayoutElementViewController *)&v11 initWithCoder:v6];

  return v9;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v24 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(SBLayoutElementViewController *)self setView:v24];
  CGSize v8 = (BSUIOrientationTransformWrapperView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8D0]), "initWithFrame:", v4, v5, v6, v7);
  contentWrapperView = self->_contentWrapperView;
  self->_contentWrapperView = v8;

  [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView setContainerOrientation:1];
  [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView setContentOrientation:[(SBLayoutElementViewController *)self contentWrapperInterfaceOrientation]];
  [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v24 addSubview:self->_contentWrapperView];
  objc_super v10 = [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView leftAnchor];
  objc_super v11 = [v24 leftAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  v13 = [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView rightAnchor];
  v14 = [v24 rightAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView topAnchor];
  v17 = [v24 topAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView bottomAnchor];
  v20 = [v24 bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v22;

  [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView addContentView:self->_contentContainerView];
}

- (id)_sbWindowScene
{
  id v3 = [(id)SBApp windowSceneManager];
  double v4 = [v3 windowSceneForDisplayIdentity:self->_displayIdentity];

  return v4;
}

- (void)setContentWrapperInterfaceOrientation:(int64_t)a3
{
  if (self->_contentWrapperInterfaceOrientation != a3)
  {
    self->_contentWrapperInterfaceOrientation = a3;
    if ([(SBLayoutElementViewController *)self isViewLoaded])
    {
      [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView setContentOrientation:a3];
      id v5 = [(SBLayoutElementViewController *)self view];
      [v5 setNeedsLayout];
    }
  }
}

- (BOOL)supportsReuse
{
  return 1;
}

- (void)invalidate
{
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (displayLayoutElementAssertion)
  {
    [(BSInvalidatable *)displayLayoutElementAssertion invalidate];
    displayLayoutElement = self->_displayLayoutElement;
    self->_displayLayoutElement = 0;
  }
  id v5 = self->_displayLayoutElement;
  self->_displayLayoutElement = 0;

  layoutElement = self->_layoutElement;
  self->_layoutElement = 0;

  layoutState = self->_layoutState;
  self->_layoutState = 0;
}

- (void)configureWithWorkspaceEntity:(id)a3 forLayoutElement:(id)a4 layoutState:(id)a5 referenceFrame:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v13 = a3;
  v14 = (SBLayoutElement *)a4;
  v15 = (SBLayoutState *)a5;
  if (self->_layoutElement != v14) {
    objc_storeStrong((id *)&self->_layoutElement, a4);
  }
  if (self->_layoutState != v15) {
    objc_storeStrong((id *)&self->_layoutState, a5);
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  if (!CGRectEqualToRect(self->_referenceFrame, v25))
  {
    self->_referenceFrame.origin.CGFloat x = x;
    self->_referenceFrame.origin.CGFloat y = y;
    self->_referenceFrame.size.CGFloat width = width;
    self->_referenceFrame.size.CGFloat height = height;
  }
  if (!self->_displayLayoutElement)
  {
    v16 = [(SBLayoutElementViewController *)self _newDisplayLayoutElementForEntity:v13];
    displayLayoutElement = self->_displayLayoutElement;
    self->_displayLayoutElement = v16;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106__SBLayoutElementViewController_configureWithWorkspaceEntity_forLayoutElement_layoutState_referenceFrame___block_invoke;
  v19[3] = &unk_1E6B02E40;
  v20 = v14;
  CGFloat v21 = x;
  CGFloat v22 = y;
  CGFloat v23 = width;
  CGFloat v24 = height;
  v18 = v14;
  [(SBLayoutElementViewController *)self _updateDisplayLayoutElementWithBuilder:v19];
}

void __106__SBLayoutElementViewController_configureWithWorkspaceEntity_forLayoutElement_layoutState_referenceFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setLayoutRole:", SBSDisplayLayoutRoleForLayoutRole(objc_msgSend(v3, "layoutRole")));
  [v4 setLevel:1];
  objc_msgSend(v4, "setReferenceFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)animationControllerForTransitionRequest:(id)a3
{
  return 0;
}

- (void)prepareForReuse
{
  self->_isViewVisible = 0;
  self->_isTransitioningVisibilitCGFloat y = 0;
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (displayLayoutElementAssertion)
  {
    [(BSInvalidatable *)displayLayoutElementAssertion invalidate];
    displayLayoutElement = self->_displayLayoutElement;
    self->_displayLayoutElement = 0;
  }
  id v5 = self->_displayLayoutElement;
  self->_displayLayoutElement = 0;

  layoutElement = self->_layoutElement;
  self->_layoutElement = 0;

  layoutState = self->_layoutState;
  self->_layoutState = 0;

  [(SBLayoutElementViewController *)self setContentWrapperInterfaceOrientation:1];
}

- (void)willBeginTransitionToVisible:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    CGSize v8 = [(SBLayoutElementViewController *)self layoutElement];
    v9 = [v8 uniqueIdentifier];
    objc_super v10 = NSStringFromBOOL();
    int v11 = 138543874;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@ will begin transition to visible %{public}@", (uint8_t *)&v11, 0x20u);
  }
  self->_isViewVisible = a3;
  self->_isTransitioningVisibilitCGFloat y = 1;
  [(SBLayoutElementViewController *)self _updateDisplayLayoutElementVisibility];
}

- (void)didEndTransitionToVisible:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    CGSize v8 = [(SBLayoutElementViewController *)self layoutElement];
    v9 = [v8 uniqueIdentifier];
    objc_super v10 = NSStringFromBOOL();
    int v11 = 138543874;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@ did end transition to visible %{public}@", (uint8_t *)&v11, 0x20u);
  }
  self->_isViewVisible = a3;
  self->_isTransitioningVisibilitCGFloat y = 0;
  [(SBLayoutElementViewController *)self _updateDisplayLayoutElementVisibility];
}

- (void)_updateDisplayLayoutElementVisibility
{
  if (!self->_isViewVisible || self->_isTransitioningVisibility)
  {
    if (self->_isViewVisible) {
      goto LABEL_6;
    }
LABEL_10:
    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;
    goto LABEL_12;
  }
  if (![(SBLayoutElementViewController *)self _shouldDisplayLayoutElementBecomeActive])goto LABEL_10; {
LABEL_6:
  }
  if (!self->_displayLayoutElement || self->_displayLayoutElementAssertion) {
    return;
  }
  id v8 = [(SBLayoutElementViewController *)self _sbWindowScene];
  id v5 = [v8 displayLayoutPublisher];
  double v6 = [v5 addElement:self->_displayLayoutElement];
  double v7 = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = v6;

  displayLayoutElementAssertion = (BSInvalidatable *)v8;
LABEL_12:
}

- (void)_updateDisplayLayoutElementWithBuilder:(id)a3
{
  if (self->_displayLayoutElementAssertion)
  {
    id v4 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    id v5 = [(SBLayoutElementViewController *)self _sbWindowScene];
    id v13 = [v5 displayLayoutPublisher];

    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    id v8 = [v13 transitionAssertionWithReason:v7];

    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v4[2](v4, self->_displayLayoutElement);
    objc_super v10 = [v13 addElement:self->_displayLayoutElement];
    int v11 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v10;

    [v8 invalidate];
  }
  else
  {
    v12 = (void (*)(void))*((void *)a3 + 2);
    id v13 = a3;
    v12();
  }
}

- (id)_newDisplayLayoutElementForEntity:(id)a3
{
  return 0;
}

- (BOOL)_shouldDisplayLayoutElementBecomeActive
{
  return 1;
}

- (id)sourceView
{
  return self->_contentContainerView;
}

- (id)initialCornerRadiusConfiguration
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4F700]) initWithCornerRadius:0.0];
  return v2;
}

- (SBDragPreviewShadowParameters)initialDiffuseShadowParameters
{
  return self;
}

- (SBDragPreviewShadowParameters)initialRimShadowParameters
{
  return self;
}

- (id)initialDiffuseShadowFilters
{
  return 0;
}

- (id)initialRimShadowFilters
{
  return 0;
}

- (id)containerViewForBlurContentView
{
  return self->_contentContainerView;
}

- (UIView)_contentContainerView
{
  return self->_contentContainerView;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (SBLayoutElement)layoutElement
{
  return self->_layoutElement;
}

- (SBLayoutState)layoutState
{
  return self->_layoutState;
}

- (CGRect)referenceFrame
{
  double x = self->_referenceFrame.origin.x;
  double y = self->_referenceFrame.origin.y;
  double width = self->_referenceFrame.size.width;
  double height = self->_referenceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)supportedContentInterfaceOrientations
{
  return self->_supportedContentInterfaceOrientations;
}

- (int64_t)contentWrapperInterfaceOrientation
{
  return self->_contentWrapperInterfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong((id *)&self->_layoutElement, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
}

- (id)mainWorkspaceApplicationSceneLayoutElementViewController
{
  return 0;
}

@end