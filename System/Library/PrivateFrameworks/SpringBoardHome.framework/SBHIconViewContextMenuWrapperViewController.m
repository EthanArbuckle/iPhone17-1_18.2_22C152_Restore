@interface SBHIconViewContextMenuWrapperViewController
- (NSString)groupNameBase;
- (UIViewController)contentViewController;
- (double)backgroundScale;
- (double)continuousCornerRadius;
- (void)_applyContinuousCornerRadius;
- (void)_applyPreferredContentSizeChange:(CGSize)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)recentsDocumentExtensionViewControllerRequestsDismiss:(id)a3;
- (void)setBackgroundScale:(double)a3;
- (void)setContentViewController:(id)a3;
- (void)setContinuousCornerRadius:(double)a3;
- (void)setGroupNameBase:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBHIconViewContextMenuWrapperViewController

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)SBHIconViewContextMenuWrapperViewController;
  [(SBHIconViewContextMenuWrapperViewController *)&v14 viewDidLoad];
  v3 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:3];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v5 = self->_backgroundView;
  v6 = [(SBHIconViewContextMenuWrapperViewController *)self view];
  [v6 bounds];
  -[MTMaterialView setFrame:](v5, "setFrame:");

  v7 = self->_backgroundView;
  v8 = [(SBHIconViewContextMenuWrapperViewController *)self groupNameBase];
  [(MTMaterialView *)v7 setGroupNameBase:v8];

  v9 = self->_backgroundView;
  [(SBHIconViewContextMenuWrapperViewController *)self backgroundScale];
  -[MTMaterialView setContentScaleFactor:](v9, "setContentScaleFactor:");
  [(MTMaterialView *)self->_backgroundView _setLayoutDebuggingIdentifier:@"backgroundView"];
  [(MTMaterialView *)self->_backgroundView setClipsToBounds:1];
  [(MTMaterialView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(SBHIconViewContextMenuWrapperViewController *)self view];
  [v10 addSubview:self->_backgroundView];

  v11 = self->_backgroundView;
  v12 = [(SBHIconViewContextMenuWrapperViewController *)self view];
  id v13 = SBHPinViewWithinView(v11, v12);

  [(SBHIconViewContextMenuWrapperViewController *)self _applyContinuousCornerRadius];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconViewContextMenuWrapperViewController;
  [(SBHIconViewContextMenuWrapperViewController *)&v3 viewWillAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconViewContextMenuWrapperViewController;
  [(SBHIconViewContextMenuWrapperViewController *)&v3 viewWillDisappear:a3];
}

- (void)setContentViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  if (self->_contentViewController != v5)
  {
    v12 = v5;
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_layoutConstraints];
    layoutConstraints = self->_layoutConstraints;
    self->_layoutConstraints = 0;

    v8 = [(SBHIconViewContextMenuWrapperViewController *)self view];
    v9 = [(UIViewController *)v12 view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBHIconViewContextMenuWrapperViewController *)self bs_removeChildViewController:*p_contentViewController];
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (v12)
    {
      [(UIViewController *)v12 preferredContentSize];
      -[SBHIconViewContextMenuWrapperViewController _applyPreferredContentSizeChange:](self, "_applyPreferredContentSizeChange:");
      [(SBHIconViewContextMenuWrapperViewController *)self bs_addChildViewController:*p_contentViewController withSuperview:v8];
      [v8 bringSubviewToFront:v9];
      SBHPinViewWithinView(v9, v8);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v11 = self->_layoutConstraints;
      self->_layoutConstraints = v10;
    }
    [(SBHIconViewContextMenuWrapperViewController *)self _applyContinuousCornerRadius];

    v5 = v12;
  }
}

- (void)setContinuousCornerRadius:(double)a3
{
  self->_continuousCornerRadius = a3;
  if ([(SBHIconViewContextMenuWrapperViewController *)self isViewLoaded])
  {
    [(SBHIconViewContextMenuWrapperViewController *)self _applyContinuousCornerRadius];
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHIconViewContextMenuWrapperViewController;
  [(SBHIconViewContextMenuWrapperViewController *)&v13 preferredContentSizeDidChangeForChildContentContainer:v4];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __101__SBHIconViewContextMenuWrapperViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v10 = &unk_1E6AACA90;
  v11 = self;
  id v5 = v4;
  id v12 = v5;
  v6 = (void (**)(void))_Block_copy(&v7);
  if (-[SBHIconViewContextMenuWrapperViewController isViewLoaded](self, "isViewLoaded", v7, v8, v9, v10, v11))objc_msgSend(MEMORY[0x1E4FB1EB0], "_animateUsingSpringWithDampingRatio:response:tracking:initialDampingRatio:initialResponse:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v6, 0, 1.0, 0.34024, 0.0, 0.0, 0.0, {
      0.0,
  }
      0.0,
      0.0);
  else {
    v6[2](v6);
  }
}

uint64_t __101__SBHIconViewContextMenuWrapperViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) preferredContentSize];
  return objc_msgSend(v1, "_applyPreferredContentSizeChange:");
}

- (void)recentsDocumentExtensionViewControllerRequestsDismiss:(id)a3
{
}

- (void)_applyPreferredContentSizeChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] == a3.width && v6 == height)
  {
    uint64_t v8 = [(UIViewController *)self->_contentViewController view];
    objc_msgSend(v8, "systemLayoutSizeFittingSize:", 398.0, 0.0);
    double width = v9;
    double height = v10;
  }
  -[SBHIconViewContextMenuWrapperViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height);
  v11 = [(UIViewController *)self->_contentViewController view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;

  v16 = [(UIViewController *)self->_contentViewController view];
  objc_msgSend(v16, "setFrame:", v13, v15, width, height);

  [(MTMaterialView *)self->_backgroundView frame];
  -[MTMaterialView setFrame:](self->_backgroundView, "setFrame:");
  id v17 = [(SBHIconViewContextMenuWrapperViewController *)self view];
  [v17 frame];
  objc_msgSend(v17, "setFrame:");
  [v17 setNeedsLayout];
  [v17 layoutIfNeeded];
}

- (void)_applyContinuousCornerRadius
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(SBHIconViewContextMenuWrapperViewController *)self isViewLoaded])
  {
    [(SBHIconViewContextMenuWrapperViewController *)self continuousCornerRadius];
    double v4 = v3;
    id v5 = objc_opt_new();
    double v6 = [(SBHIconViewContextMenuWrapperViewController *)self view];
    objc_msgSend(v5, "bs_safeAddObject:", v6);

    uint64_t v7 = [(SBHIconViewContextMenuWrapperViewController *)self contentViewController];
    uint64_t v8 = [v7 view];
    objc_msgSend(v5, "bs_safeAddObject:", v8);

    objc_msgSend(v5, "bs_safeAddObject:", self->_backgroundView);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v5;
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
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "_setContinuousCornerRadius:", v4, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (NSString)groupNameBase
{
  return self->_groupNameBase;
}

- (void)setGroupNameBase:(id)a3
{
}

- (double)backgroundScale
{
  return self->_backgroundScale;
}

- (void)setBackgroundScale:(double)a3
{
  self->_backgroundScale = a3;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupNameBase, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end