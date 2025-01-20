@interface SBHRecentsDocumentExtensionWrappingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isTransparent;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)usesIntrinsicContentSizeBasedOnScreenSize;
- (SBHRecentsDocumentExtensionWrappingViewController)init;
- (SBHRecentsDocumentExtensionWrappingViewControllerDelegate)delegate;
- (_UIRemoteViewController)wrappedRemoteViewController;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (void)_updateViewIntrinsicContentSize:(CGSize)a3;
- (void)dealloc;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setUsesIntrinsicContentSizeBasedOnScreenSize:(BOOL)a3;
- (void)wrapRemoteViewController:(id)a3;
@end

@implementation SBHRecentsDocumentExtensionWrappingViewController

- (SBHRecentsDocumentExtensionWrappingViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHRecentsDocumentExtensionWrappingViewController;
  v2 = [(SBHRecentsDocumentExtensionWrappingViewController *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    constraints = v2->_constraints;
    v2->_constraints = v3;
  }
  return v2;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_touchCancellationAssertionsToTokens;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMapTable *)self->_touchCancellationAssertionsToTokens removeAllObjects];
  v8.receiver = self;
  v8.super_class = (Class)SBHRecentsDocumentExtensionWrappingViewController;
  [(SBHRecentsDocumentExtensionWrappingViewController *)&v8 dealloc];
}

- (void)loadView
{
  if ([(SBHRecentsDocumentExtensionWrappingViewController *)self usesIntrinsicContentSizeBasedOnScreenSize])
  {
    int v4 = __sb__runningInSpringBoard();
    char v5 = v4;
    if (v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v2 _referenceBounds];
    }
    float v12 = CGRectGetWidth(*(CGRect *)&v6) * 0.46;
    double v10 = floorf(v12);
    double v11 = 220.5;
    if ((v5 & 1) == 0) {
  }
    }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v13 = -[_SBHRecentsDocumentView initWithFrame:]([_SBHRecentsDocumentView alloc], "initWithFrame:", 0.0, 0.0, v10, v11);
  [(_SBHRecentsDocumentView *)v13 setAutoresizingMask:18];
  [(SBHRecentsDocumentExtensionWrappingViewController *)self setView:v13];
  -[SBHRecentsDocumentExtensionWrappingViewController _updateViewIntrinsicContentSize:](self, "_updateViewIntrinsicContentSize:", v10, v11);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBHRecentsDocumentExtensionWrappingViewController;
  id v4 = a3;
  [(SBHRecentsDocumentExtensionWrappingViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[SBHRecentsDocumentExtensionWrappingViewController _updateViewIntrinsicContentSize:](self, "_updateViewIntrinsicContentSize:", v6, v8);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)SBHRecentsDocumentExtensionWrappingViewController;
  -[SBHRecentsDocumentExtensionWrappingViewController setPreferredContentSize:](&v12, sel_setPreferredContentSize_);
  double v6 = [(SBHRecentsDocumentExtensionWrappingViewController *)self view];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(SBHRecentsDocumentExtensionWrappingViewController *)self view];
  objc_msgSend(v11, "setFrame:", v8, v10, width, height);
}

- (void)_updateViewIntrinsicContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v7 = [(SBHRecentsDocumentExtensionWrappingViewController *)self view];
  objc_msgSend(v7, "setIntrinsicContentSize:", width, height);
  -[SBHRecentsDocumentExtensionWrappingViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height);
  double v6 = [(SBHRecentsDocumentExtensionWrappingViewController *)self view];
  [v6 setNeedsUpdateConstraints];
}

- (void)wrapRemoteViewController:(id)a3
{
  double v5 = (_UIRemoteViewController *)a3;
  p_wrappedRemoteViewController = &self->_wrappedRemoteViewController;
  wrappedRemoteViewController = self->_wrappedRemoteViewController;
  v37 = v5;
  if (wrappedRemoteViewController != v5)
  {
    [(_UIRemoteViewController *)wrappedRemoteViewController willMoveToParentViewController:0];
    double v8 = [(_UIRemoteViewController *)*p_wrappedRemoteViewController view];
    [v8 removeFromSuperview];

    [(_UIRemoteViewController *)*p_wrappedRemoteViewController removeFromParentViewController];
  }
  objc_storeStrong((id *)&self->_wrappedRemoteViewController, a3);
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  double v9 = [(_UIRemoteViewController *)v37 view];
  [v9 setAccessibilityIdentifier:@"Icon Pop Over"];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v10 = [(SBHRecentsDocumentExtensionWrappingViewController *)self view];
  double v11 = (void *)v10;
  if (v9 && v10)
  {
    [(_UIRemoteViewController *)v37 bs_endAppearanceTransition:1];
    objc_super v12 = [(SBHRecentsDocumentExtensionWrappingViewController *)self view];
    [(SBHRecentsDocumentExtensionWrappingViewController *)self bs_addChildViewController:v37 withSuperview:v12];

    constraints = self->_constraints;
    uint64_t v14 = [v9 topAnchor];
    v15 = [v11 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [(NSMutableArray *)constraints addObject:v16];

    v17 = self->_constraints;
    v18 = [v9 bottomAnchor];
    v19 = [v11 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [(NSMutableArray *)v17 addObject:v20];

    v21 = self->_constraints;
    v22 = [v9 leadingAnchor];
    v23 = [v11 leadingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [(NSMutableArray *)v21 addObject:v24];

    v25 = self->_constraints;
    v26 = [v9 trailingAnchor];
    v27 = [v11 trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    [(NSMutableArray *)v25 addObject:v28];

    v29 = self->_constraints;
    v30 = [v9 widthAnchor];
    v31 = [v11 widthAnchor];
    v32 = [v30 constraintEqualToAnchor:v31 multiplier:1.0];
    [(NSMutableArray *)v29 addObject:v32];

    v33 = self->_constraints;
    v34 = [v9 heightAnchor];
    v35 = [v11 heightAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 multiplier:1.0];
    [(NSMutableArray *)v33 addObject:v36];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  wrappedRemoteViewController = self->_wrappedRemoteViewController;
  if (wrappedRemoteViewController
    && ([(_UIRemoteViewController *)wrappedRemoteViewController _cancelTouchesForCurrentEventInHostedContent], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v5 = (void *)v4;
    if (!self->_touchCancellationAssertionsToTokens)
    {
      double v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      touchCancellationAssertionsToTokens = self->_touchCancellationAssertionsToTokens;
      self->_touchCancellationAssertionsToTokens = v6;
    }
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x1E4F4F838]);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __96__SBHRecentsDocumentExtensionWrappingViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke;
    uint64_t v14 = &unk_1E6AAD538;
    objc_copyWeak(&v15, &location);
    double v9 = (void *)[v8 initWithIdentifier:@"recentsDocumentExtension.cancelTouchesAssertion" forReason:@"cancelTouches" invalidationBlock:&v11];
    -[NSMapTable setObject:forKey:](self->_touchCancellationAssertionsToTokens, "setObject:forKey:", v5, v9, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

void __96__SBHRecentsDocumentExtensionWrappingViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[123] removeObjectForKey:v5];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isTransparent
{
  v2 = self;
  v3 = [(SBHRecentsDocumentExtensionWrappingViewController *)self delegate];
  LOBYTE(v2) = [v3 recentsDocumentExtensionWrappingViewControllerHasTransparentContent:v2];

  return (char)v2;
}

- (_UIRemoteViewController)wrappedRemoteViewController
{
  return self->_wrappedRemoteViewController;
}

- (SBHRecentsDocumentExtensionWrappingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHRecentsDocumentExtensionWrappingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)usesIntrinsicContentSizeBasedOnScreenSize
{
  return self->_usesIntrinsicContentSizeBasedOnScreenSize;
}

- (void)setUsesIntrinsicContentSizeBasedOnScreenSize:(BOOL)a3
{
  self->_usesIntrinsicContentSizeBasedOnScreenSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wrappedRemoteViewController, 0);
  objc_storeStrong((id *)&self->_touchCancellationAssertionsToTokens, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end