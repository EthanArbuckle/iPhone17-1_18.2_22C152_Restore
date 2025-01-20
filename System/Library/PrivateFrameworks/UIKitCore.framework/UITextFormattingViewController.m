@interface UITextFormattingViewController
- (BOOL)_adjustAttributesInTextStorage:(id)a3 atRange:(_NSRange)a4 forChangeValue:(id)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)_useChildViewWidthForContentSize;
- (BOOL)_useLandscapeLayout;
- (BOOL)_useLandscapeLayoutForSize:(CGSize)a3;
- (CGSize)_computeContentSize;
- (CGSize)_formSheetSizeForWindowWithSize:(CGSize)a3 screenSize:(CGSize)a4;
- (UIResponderStandardEditActions)_editResponder;
- (UITextFormattingViewController)init;
- (UITextFormattingViewController)initWithCoder:(id)a3;
- (UITextFormattingViewController)initWithConfiguration:(id)a3;
- (UITextFormattingViewControllerConfiguration)configuration;
- (UITextFormattingViewControllerDelegate)delegate;
- (UITextFormattingViewControllerFormattingDescriptor)formattingDescriptor;
- (UIViewController)_remoteViewController;
- (_UITextFormattingViewControllerInternalDelegate)_internalDelegate;
- (id)_conversionHandler;
- (id)_remoteSheet;
- (id)_scrollView;
- (id)_textView;
- (int64_t)_backdropViewStyle;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_applyTextViewHighlightWithChangeValue:(id)a3;
- (void)_cleanupForEditResponder;
- (void)_commonInit;
- (void)_invokeEditResponderAction:(SEL)a3;
- (void)_modifyKeyboardTrackingIfNeededForKeyboardSuppression;
- (void)_modifyKeyboardTrackingIfNeededForType:(unint64_t)a3 fromFrame:(CGRect)a4 toFrame:(CGRect)a5 start:(BOOL)a6;
- (void)_modifyKeyboardTrackingIfNeededForType:(unint64_t)a3 start:(BOOL)a4;
- (void)_onUserInterfaceStyleChange;
- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4;
- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4;
- (void)_presentTypographySettingsForFont:(id)a3;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)_reconfigureViewHierarchyForParentController:(id)a3;
- (void)_resetDetentsForSheetController:(id)a3 invalidate:(BOOL)a4;
- (void)_resumeKeyboardSuppressionIfNeeded;
- (void)_sendUpdatesToEditResponder:(id)a3;
- (void)_setChildViewController:(id)a3;
- (void)_setEditResponder:(id)a3;
- (void)_setInternalDelegate:(id)a3;
- (void)_setShouldDeferFontPickerPresentationToViewController:(id)a3;
- (void)_setupForEditResponder;
- (void)_startSuppressingKeyboardForTextFormatting;
- (void)_stopSuppressingKeyboardForTextFormatting;
- (void)_textFormattingDidChangeValue:(id)a3 textAttributes:(id)a4;
- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4;
- (void)_textFormattingDidFinish;
- (void)_textFormattingRequestsFirstResponderResignation;
- (void)_textFormattingRequestsFirstResponderRestoration;
- (void)_textViewFormattingDidBegin;
- (void)_textViewFormattingDidEnd;
- (void)_textViewFormattingWillBegin;
- (void)_textViewFormattingWillEnd;
- (void)_typographySettingsViewControllerDidUpdateFont:(id)a3;
- (void)_updateChildControllersConfiguration;
- (void)_updateContentSizeForAppearance:(BOOL)a3;
- (void)_updateDisabledComponents;
- (void)_updateFormattingDescriptor:(id)a3;
- (void)_updateInternalConfigurationProperties;
- (void)_updateNavBarVisibility;
- (void)_updateScrollViewContentSizeIfNeeded;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fontPickerViewControllerDidCancel:(id)a3;
- (void)fontPickerViewControllerDidPickFont:(id)a3;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFormattingDescriptor:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation UITextFormattingViewController

- (void)_modifyKeyboardTrackingIfNeededForType:(unint64_t)a3 start:(BOOL)a4
{
  v6 = self;
  sub_1859A2D58(a3, a4, 0, 0);
}

- (void)_modifyKeyboardTrackingIfNeededForKeyboardSuppression
{
  v2 = self;
  sub_1859A30EC();
}

- (void)_modifyKeyboardTrackingIfNeededForType:(unint64_t)a3 fromFrame:(CGRect)a4 toFrame:(CGRect)a5 start:(BOOL)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  v16 = self;
  sub_1859A3280(a3, a6, v14, v13, v12, v11, x, y, width, height);
}

- (void)_setupForEditResponder
{
  v2 = self;
  sub_1859A3570();
}

- (void)_cleanupForEditResponder
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);
}

- (void)_resumeKeyboardSuppressionIfNeeded
{
  v2 = self;
  sub_1859A38D0();
}

- (BOOL)_adjustAttributesInTextStorage:(id)a3 atRange:(_NSRange)a4 forChangeValue:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  double v11 = self;
  sub_1859F35B4(v9, location, length, v10);
  LOBYTE(length) = v12;

  return length & 1;
}

- (UITextFormattingViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextFormattingViewController *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"UITextFormattingViewControllerConfiguration"];
    v7 = v6;
    if (!v6) {
      v7 = objc_alloc_init(UITextFormattingViewControllerConfiguration);
    }
    objc_storeStrong((id *)&v5->_configuration, v7);
    if (!v6) {
  }
    }
  return v5;
}

- (UITextFormattingViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextFormattingViewController;
  id v5 = [(UIViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (UITextFormattingViewControllerConfiguration *)v6;

    [(UITextFormattingViewController *)v5 _commonInit];
  }

  return v5;
}

- (UITextFormattingViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)UITextFormattingViewController;
  v2 = [(UIViewController *)&v6 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = objc_alloc_init(UITextFormattingViewControllerConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    [(UITextFormattingViewController *)v2 _commonInit];
  }
  return v2;
}

- (void)_commonInit
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v3 = (UIView *)objc_opt_new();
  containerView = self->_containerView;
  self->_containerView = v3;

  id v5 = (UIView *)objc_opt_new();
  contentView = self->_contentView;
  self->_contentView = v5;

  v7 = (UIStackView *)objc_opt_new();
  contentStackView = self->_contentStackView;
  self->_contentStackView = v7;

  [(UIStackView *)self->_contentStackView setAxis:1];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  objc_super v9 = (void *)qword_1EB25C040;
  uint64_t v28 = qword_1EB25C040;
  if (!qword_1EB25C040)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __get_TFTextFormattingContentViewControllerClass_block_invoke;
    v23[3] = &unk_1E52D9900;
    v24 = &v25;
    TextFormattingUILibraryCore();
    v26[3] = (uint64_t)objc_getClass("_TFTextFormattingContentViewController");
    qword_1EB25C040 = *(void *)(v24[1] + 24);
    objc_super v9 = (void *)v26[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v25, 8);
  double v11 = (_TFTextFormattingContentViewController *)objc_alloc_init(v10);
  contentViewController = self->_contentViewController;
  self->_contentViewController = v11;

  double v13 = self->_contentViewController;
  if (v13)
  {
    [(_TFTextFormattingContentViewController *)v13 loadView];
  }
  else
  {
    double v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextFormattingUI", &_MergedGlobals_1_34) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "TextFormattingUI was not loaded!", (uint8_t *)v23, 2u);
    }
  }
  v15 = objc_alloc_init(_UITextFormattingSceneHostingImpl);
  hostingImpl = self->_hostingImpl;
  self->_hostingImpl = (_UITextFormattingViewHostingImpl *)v15;

  [(_UITextFormattingViewHostingImpl *)self->_hostingImpl setDelegateTextFormattingViewController:self];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", 375.0, 196.0);
  v17 = self;
  v30[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v19 = [(UIViewController *)self registerForTraitChanges:v18 withTarget:self action:sel__updateInternalConfigurationProperties];

  v20 = self;
  v29 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  id v22 = [(UIViewController *)self registerForTraitChanges:v21 withTarget:self action:sel__onUserInterfaceStyleChange];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextFormattingViewController *)self configuration];
  [v4 encodeObject:v5 forKey:@"UITextFormattingViewControllerConfiguration"];
}

- (void)dealloc
{
  [(UITextFormattingViewController *)self _cleanupForEditResponder];
  v3.receiver = self;
  v3.super_class = (Class)UITextFormattingViewController;
  [(UIViewController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  [(UIViewController *)&v4 viewWillAppear:a3];
  [(UITextFormattingViewController *)self _textViewFormattingWillBegin];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  [(UIViewController *)&v4 viewIsAppearing:a3];
  [(UITextFormattingViewController *)self _updateNavBarVisibility];
  [(UITextFormattingViewController *)self _updateInternalConfigurationProperties];
  [(UITextFormattingViewController *)self _updateChildControllersConfiguration];
  [(UITextFormattingViewController *)self _updateContentSizeForAppearance:1];
  [(UITextFormattingViewController *)self _updateDisabledComponents];
  [(UITextFormattingViewController *)self _modifyKeyboardTrackingIfNeededForType:2 start:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  [(UIViewController *)&v4 viewDidAppear:a3];
  [(UITextFormattingViewController *)self _modifyKeyboardTrackingIfNeededForType:2 start:0];
  [(UITextFormattingViewController *)self _textViewFormattingDidBegin];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  [(UIViewController *)&v4 viewWillDisappear:a3];
  if ([(UIViewController *)self isBeingDismissed]) {
    [(UITextFormattingViewController *)self _modifyKeyboardTrackingIfNeededForType:3 start:1];
  }
  [(UITextFormattingViewController *)self _textViewFormattingWillEnd];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UITextFormattingViewController;
  [(UIViewController *)&v9 viewDidDisappear:a3];
  if ([(UIViewController *)self isBeingDismissed]) {
    [(UITextFormattingViewController *)self _modifyKeyboardTrackingIfNeededForType:3 start:0];
  }
  if ([(UIViewController *)self isBeingDismissed])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)&self->_internalDelegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_internalDelegate);
        [v8 _textFormattingDidDisappear:self];
      }
    }
  }
  if ([(UIViewController *)self isBeingDismissed]
    && !self->_shouldSkipStoppingKeyboardSuppressionOnDidDisappear)
  {
    [(UITextFormattingViewController *)self _stopSuppressingKeyboardForTextFormatting];
  }
  [(UITextFormattingViewController *)self _textViewFormattingDidEnd];
}

- (void)loadView
{
  v45[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  [(UIViewController *)self setView:v3];

  if ([(UITextFormattingViewControllerConfiguration *)self->_configuration _allowContentToScroll])
  {
    objc_super v4 = (UIView *)objc_opt_new();
    [(UIView *)v4 setClipsToBounds:0];
    [(UIView *)v4 setShowsHorizontalScrollIndicator:0];
    [(UIView *)v4 setShowsVerticalScrollIndicator:0];
    [(UIView *)v4 setDirectionalLockEnabled:1];
    [(UIView *)v4 addSubview:self->_contentView];
    containerView = self->_containerView;
    self->_containerView = v4;
  }
  else
  {
    id v6 = (UIView *)objc_opt_new();
    char v7 = self->_containerView;
    self->_containerView = v6;

    [(UIView *)self->_containerView addSubview:self->_contentView];
    [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = (void *)MEMORY[0x1E4F5B268];
    v42 = [(UIView *)self->_contentView topAnchor];
    v40 = [(UIView *)self->_containerView topAnchor];
    v38 = [v42 constraintEqualToAnchor:v40];
    v45[0] = v38;
    v36 = [(UIView *)self->_contentView leadingAnchor];
    v34 = [(UIView *)self->_containerView leadingAnchor];
    id v8 = [v36 constraintEqualToAnchor:v34];
    v45[1] = v8;
    objc_super v9 = [(UIView *)self->_contentView trailingAnchor];
    id v10 = [(UIView *)self->_containerView trailingAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    v45[2] = v11;
    char v12 = [(UIView *)self->_contentView bottomAnchor];
    double v13 = [(UIView *)self->_containerView bottomAnchor];
    double v14 = [v12 constraintEqualToAnchor:v13];
    v45[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    [v32 activateConstraints:v15];
  }
  [(UIView *)self->_contentView addSubview:self->_contentStackView];
  [(UIStackView *)self->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = (void *)MEMORY[0x1E4F5B268];
  v41 = [(UIView *)self->_contentStackView topAnchor];
  v43 = [(UIView *)self->_contentView safeAreaLayoutGuide];
  v39 = [v43 topAnchor];
  v37 = [v41 constraintEqualToAnchor:v39];
  v44[0] = v37;
  v33 = [(UIView *)self->_contentStackView leadingAnchor];
  v35 = [(UIView *)self->_contentView safeAreaLayoutGuide];
  v31 = [v35 leadingAnchor];
  v29 = [v33 constraintEqualToAnchor:v31];
  v44[1] = v29;
  uint64_t v28 = [(UIView *)self->_contentStackView trailingAnchor];
  v16 = [(UIView *)self->_contentView safeAreaLayoutGuide];
  v17 = [v16 trailingAnchor];
  v18 = [v28 constraintEqualToAnchor:v17];
  v44[2] = v18;
  id v19 = [(UIView *)self->_contentStackView bottomAnchor];
  v20 = [(UIView *)self->_contentView safeAreaLayoutGuide];
  v21 = [v20 bottomAnchor];
  id v22 = [v19 constraintEqualToAnchor:v21];
  v44[3] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  [v30 activateConstraints:v23];

  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    uint64_t v25 = [(_TFTextFormattingContentViewController *)contentViewController view];
    [v25 removeFromSuperview];

    [(_TFTextFormattingContentViewController *)self->_contentViewController removeFromParentViewController];
    [(_TFTextFormattingContentViewController *)self->_contentViewController willMoveToParentViewController:self];
    v26 = [(_TFTextFormattingContentViewController *)self->_contentViewController view];
    [(UIViewController *)self addChildViewController:self->_contentViewController];
    [(UIStackView *)self->_contentStackView addArrangedSubview:v26];
    [(_TFTextFormattingContentViewController *)self->_contentViewController didMoveToParentViewController:self];
  }
  uint64_t v27 = [(UIViewController *)self parentViewController];
  [(UITextFormattingViewController *)self _reconfigureViewHierarchyForParentController:v27];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  [(UIViewController *)&v4 viewWillLayoutSubviews];
  [(UITextFormattingViewController *)self _updateScrollViewContentSizeIfNeeded];
  BOOL v3 = [(UITextFormattingViewController *)self _useLandscapeLayout];
  if (v3 != [(UITextFormattingViewControllerConfiguration *)self->_configuration _useLandscapeLayout])
  {
    [(UITextFormattingViewController *)self _updateInternalConfigurationProperties];
    [(UITextFormattingViewController *)self _updateChildControllersConfiguration];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITextFormattingViewController;
  id v4 = a3;
  [(UIViewController *)&v5 willMoveToParentViewController:v4];
  -[UITextFormattingViewController _reconfigureViewHierarchyForParentController:](self, "_reconfigureViewHierarchyForParentController:", v4, v5.receiver, v5.super_class);

  [(UITextFormattingViewControllerConfiguration *)self->_configuration _setHasParentViewController:v4 != 0];
  [(UITextFormattingViewController *)self _updateChildControllersConfiguration];
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITextFormattingViewController;
  id v4 = a3;
  [(UIViewController *)&v5 didMoveToParentViewController:v4];
  -[UITextFormattingViewController _reconfigureViewHierarchyForParentController:](self, "_reconfigureViewHierarchyForParentController:", v4, v5.receiver, v5.super_class);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingViewController;
  [(UIViewController *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(UITextFormattingViewController *)self _updateContentSizeForAppearance:0];
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v6;
    [v5 setPrefersEdgeAttachedInCompactHeight:1];
    [v5 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];
    [(UITextFormattingViewController *)self _resetDetentsForSheetController:v5 invalidate:0];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)UITextFormattingViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v35, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(UIViewController *)self _existingPresentationControllerImmediate:0 effective:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v33[3] = &unk_1E52DB270;
    v33[4] = self;
    id v34 = v8;
    [v7 animateAlongsideTransition:v33 completion:0];
  }
  -[UITextFormattingViewControllerConfiguration _setUseLandscapeLayout:](self->_configuration, "_setUseLandscapeLayout:", -[UITextFormattingViewController _useLandscapeLayoutForSize:](self, "_useLandscapeLayoutForSize:", width, height));
  [(UITextFormattingViewController *)self _updateChildControllersConfiguration];
  v30[0] = 0;
  v30[1] = v30;
  void v30[2] = 0x4010000000;
  v30[3] = &unk_186D7DBA7;
  long long v31 = 0u;
  long long v32 = 0u;
  objc_super v9 = [(UIViewController *)self view];
  id v10 = [(UIViewController *)self view];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = [(UIViewController *)self view];
  v20 = [v19 window];
  objc_msgSend(v9, "convertRect:toView:", v20, v12, v14, v16, v18);
  *(void *)&long long v31 = v21;
  *((void *)&v31 + 1) = v22;
  *(void *)&long long v32 = v23;
  *((void *)&v32 + 1) = v24;

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x4010000000;
  v27[3] = &unk_186D7DBA7;
  long long v28 = 0u;
  long long v29 = 0u;
  v25[6] = v30;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v26[3] = &unk_1E52DC350;
  v26[4] = self;
  v26[5] = v27;
  v26[6] = v30;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v25[3] = &unk_1E52DC350;
  v25[4] = self;
  v25[5] = v27;
  [v7 animateAlongsideTransition:v26 completion:v25];
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v30, 8);
}

uint64_t __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetDetentsForSheetController:*(void *)(a1 + 40) invalidate:0];
}

uint64_t __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [*(id *)(a1 + 32) view];
  double v13 = [v12 window];
  objc_msgSend(v2, "convertRect:toView:", v13, v5, v7, v9, v11);
  double v14 = *(void **)(*(void *)(a1 + 40) + 8);
  v14[4] = v15;
  v14[5] = v16;
  v14[6] = v17;
  v14[7] = v18;

  id v19 = *(double **)(*(void *)(a1 + 48) + 8);
  v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(double **)(*(void *)(a1 + 40) + 8);
  double v22 = v19[4];
  double v23 = v19[5];
  double v24 = v19[6];
  double v25 = v19[7];
  double v26 = v21[4];
  double v27 = v21[5];
  double v28 = v21[6];
  double v29 = v21[7];
  return objc_msgSend(v20, "_modifyKeyboardTrackingIfNeededForType:fromFrame:toFrame:start:", 1, 1, v22, v23, v24, v25, v26, v27, v28, v29);
}

uint64_t __85__UITextFormattingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [*(id *)(a1 + 32) view];
  double v13 = [v12 window];
  objc_msgSend(v2, "convertRect:toView:", v13, v5, v7, v9, v11);
  double v14 = *(void **)(*(void *)(a1 + 40) + 8);
  v14[4] = v15;
  v14[5] = v16;
  v14[6] = v17;
  v14[7] = v18;

  id v19 = *(double **)(*(void *)(a1 + 48) + 8);
  v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(double **)(*(void *)(a1 + 40) + 8);
  double v22 = v19[4];
  double v23 = v19[5];
  double v24 = v19[6];
  double v25 = v19[7];
  double v26 = v21[4];
  double v27 = v21[5];
  double v28 = v21[6];
  double v29 = v21[7];
  return objc_msgSend(v20, "_modifyKeyboardTrackingIfNeededForType:fromFrame:toFrame:start:", 1, 0, v22, v23, v24, v25, v26, v27, v28, v29);
}

- (CGSize)_formSheetSizeForWindowWithSize:(CGSize)a3 screenSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  if ([(UITextFormattingViewControllerConfiguration *)self->_configuration _textViewConfiguration])
  {
    +[UIViewController defaultFormSheetSizeForScreenSize:](UIViewController, "defaultFormSheetSizeForScreenSize:", width, height);
    double v10 = 656.0;
    if (v7 <= 656.0) {
      double v10 = v7;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UITextFormattingViewController;
    -[UIViewController _formSheetSizeForWindowWithSize:screenSize:](&v11, sel__formSheetSizeForWindowWithSize_screenSize_, v7, v6, width, height);
  }
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (void)setConfiguration:(id)a3
{
  double v4 = (UITextFormattingViewControllerConfiguration *)[a3 copy];
  configuration = self->_configuration;
  self->_configuration = v4;

  [(UITextFormattingViewController *)self _updateChildControllersConfiguration];
}

- (void)_setChildViewController:(id)a3
{
  double v5 = (UIViewController *)a3;
  p_remoteViewController = &self->_remoteViewController;
  remoteViewController = self->_remoteViewController;
  if (remoteViewController != v5)
  {
    double v10 = v5;
    double v8 = [(UIViewController *)remoteViewController view];
    [v8 removeFromSuperview];

    [(UIViewController *)*p_remoteViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    double v5 = v10;
    if (*p_remoteViewController)
    {
      [(UIViewController *)v10 willMoveToParentViewController:self];
      double v9 = [(UIViewController *)v10 view];
      [(UIViewController *)self addChildViewController:v10];
      [(UIStackView *)self->_contentStackView addArrangedSubview:v9];
      [(UIViewController *)v10 didMoveToParentViewController:self];
      [(UITextFormattingViewController *)self _computeContentSize];
      -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");

      double v5 = v10;
    }
  }
}

- (UITextFormattingViewControllerFormattingDescriptor)formattingDescriptor
{
  v2 = (void *)[(UITextFormattingViewControllerFormattingDescriptor *)self->_formattingDescriptor copy];
  return (UITextFormattingViewControllerFormattingDescriptor *)v2;
}

- (void)setFormattingDescriptor:(id)a3
{
  id conversionHandler = self->__conversionHandler;
  self->__id conversionHandler = 0;
  id v5 = a3;

  double v6 = (UITextFormattingViewControllerFormattingDescriptor *)[v5 copy];
  formattingDescriptor = self->_formattingDescriptor;
  self->_formattingDescriptor = v6;

  double v8 = self->_formattingDescriptor;
  [(UITextFormattingViewController *)self _updateFormattingDescriptor:v8];
}

- (void)_setEditResponder:(id)a3
{
  id v4 = a3;
  [(UITextFormattingViewController *)self _cleanupForEditResponder];
  objc_storeWeak((id *)&self->__editResponder, v4);

  [(UITextFormattingViewController *)self _setupForEditResponder];
}

- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  double v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  if (v5)
  {
    id v20 = 0;
    uint64_t v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v15 fromData:v5 error:&v20];
    id v17 = v20;
  }
  else
  {
    id v17 = 0;
    uint64_t v16 = 0;
  }
  [(UITextFormattingViewController *)self _textFormattingDidChangeValue:v19 textAttributes:v16];
}

- (void)_textFormattingDidFinish
{
  BOOL v3 = [(UITextFormattingViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UITextFormattingViewController *)self delegate];
    [v5 textFormattingDidFinish:self];
  }
  [(UIViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_textFormattingRequestsFirstResponderRestoration
{
  p_internalDelegate = &self->_internalDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_internalDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_internalDelegate);
      [v8 _textFormattingRequestsFirstResponderRestoration:self];
    }
  }
}

- (void)_textFormattingRequestsFirstResponderResignation
{
  p_internalDelegate = &self->_internalDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_internalDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_internalDelegate);
      [v8 _textFormattingRequestsFirstResponderResignation:self];
    }
  }
}

- (void)_startSuppressingKeyboardForTextFormatting
{
  p_internalDelegate = &self->_internalDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_internalDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_internalDelegate);
      [v8 _startSuppressingKeyboardForTextFormatting:self];

      [(UITextFormattingViewController *)self _modifyKeyboardTrackingIfNeededForKeyboardSuppression];
    }
  }
}

- (void)_stopSuppressingKeyboardForTextFormatting
{
  p_internalDelegate = &self->_internalDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_internalDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_internalDelegate);
      [v8 _stopSuppressingKeyboardForTextFormatting:self];
    }
  }
}

- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  uint64_t v13 = objc_alloc_init(UIColorPickerViewController);
  [(UIColorPickerViewController *)v13 setSelectedColor:v12];
  [(UIColorPickerViewController *)v13 setSupportsAlpha:0];
  [(UIColorPickerViewController *)v13 _setSupportsEyedropper:0];
  uint64_t v14 = [(UITextFormattingViewController *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0
    || ([(UITextFormattingViewController *)self delegate],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 textFormattingViewController:self shouldPresentColorPicker:v13],
        v16,
        v17))
  {
    [(UIColorPickerViewController *)v13 setSelectedColor:v12];
    [(UIColorPickerViewController *)v13 setSupportsAlpha:0];
    [(UIColorPickerViewController *)v13 _setSupportsEyedropper:0];
    [(UIColorPickerViewController *)v13 setDelegate:self];
    [(UIViewController *)v13 setModalPresentationStyle:7];
    uint64_t v18 = [(UIViewController *)v13 popoverPresentationController];
    id v19 = [(UIViewController *)self view];
    [v18 setSourceView:v19];

    id v20 = [(UIViewController *)v13 popoverPresentationController];
    BOOL v21 = [(UIViewController *)self _isInPopoverPresentation];
    if (v21)
    {
      char v4 = [(UIViewController *)self view];
      id v5 = [v4 window];
      id v6 = [(UIViewController *)self view];
      objc_msgSend(v5, "convertRect:toView:", v6, x, y, width, height);
      double x = v22;
      double y = v23;
      double width = v24;
      double height = v25;
    }
    objc_msgSend(v20, "setSourceRect:", x, y, width, height);
    if (v21)
    {
    }
    double v26 = [(UIViewController *)v13 popoverPresentationController];
    [v26 setPermittedArrowDirections:15];

    [(UIColorPickerViewController *)v13 _setShowsGridOnly:1];
    if (![(UIViewController *)self _isInPopoverPresentation])
    {
      [(UITextFormattingViewController *)self _stopSuppressingKeyboardForTextFormatting];
      [(UITextFormattingViewController *)self _textFormattingRequestsFirstResponderResignation];
    }
    [(UITextFormattingViewController *)self _modifyKeyboardTrackingIfNeededForType:2 start:1];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __68__UITextFormattingViewController__presentColorPicker_selectedColor___block_invoke;
    v27[3] = &unk_1E52D9F70;
    void v27[4] = self;
    [(UIViewController *)self presentViewController:v13 animated:1 completion:v27];
    objc_storeStrong((id *)&self->_colorPicker, v13);
  }
}

uint64_t __68__UITextFormattingViewController__presentColorPicker_selectedColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifyKeyboardTrackingIfNeededForType:2 start:0];
}

- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v6 = a4;
  char v7 = [(UITextFormattingViewController *)self configuration];
  uint64_t v8 = [v7 fontPickerConfiguration];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = v44;
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  id v11 = v10;

  id v12 = [[UIFontPickerViewController alloc] initWithConfiguration:v11];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke;
  v54[3] = &unk_1E5311798;
  id v14 = v13;
  id v55 = v14;
  [v6 enumerateObjectsUsingBlock:v54];
  [(UIFontPickerViewController *)v12 _setSelectedFontDescriptors:v14];
  char v15 = [(UITextFormattingViewController *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0
    || ([(UITextFormattingViewController *)self delegate],
        int v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 textFormattingViewController:self shouldPresentFontPicker:v12],
        v17,
        v18))
  {
    -[UIFontPickerViewController _setSelectedFontDescriptors:](v12, "_setSelectedFontDescriptors:", v14, v44);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredFontPickerPresentationViewController);
    if (WeakRetained)
    {
      id v20 = (UITextFormattingViewController *)objc_loadWeakRetained((id *)&self->_preferredFontPickerPresentationViewController);
      if (v20 == self)
      {
      }
      else
      {
        id v21 = objc_loadWeakRetained((id *)&self->_internalDelegate);
        BOOL v22 = v21 == 0;

        if (!v22)
        {
          id v23 = objc_loadWeakRetained((id *)&self->_preferredFontPickerPresentationViewController);
          double v24 = [(UITextFormattingViewController *)self _editResponder];
          self->_shouldSkipStoppingKeyboardSuppressionOnDidDisappear = 1;
          id v25 = objc_loadWeakRetained((id *)&self->_internalDelegate);
          objc_initWeak(&location, v25);
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_2;
          v47[3] = &unk_1E53117C0;
          id v48 = v6;
          id v26 = v24;
          id v49 = v26;
          v50 = v12;
          id v27 = v23;
          id v51 = v27;
          objc_copyWeak(&v52, &location);
          [(UIViewController *)self dismissViewControllerAnimated:1 completion:v47];
          objc_destroyWeak(&v52);

          objc_destroyWeak(&location);
          goto LABEL_16;
        }
      }
    }
    [(UIFontPickerViewController *)v12 setDelegate:self];
    [(UITextFormattingViewController *)self _stopSuppressingKeyboardForTextFormatting];
    [(UITextFormattingViewController *)self _textFormattingRequestsFirstResponderResignation];
    [(UIViewController *)self preferredContentSize];
    double v29 = v28;
    BOOL v30 = [(UITextFormattingViewControllerConfiguration *)self->_configuration _useLandscapeLayout];
    double v31 = 0.0;
    if (v30) {
      double v31 = 25.0;
    }
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_4;
    v46[3] = &__block_descriptor_40_e65_d16__0____UISheetPresentationControllerDetentResolutionContext__8l;
    *(double *)&v46[4] = v29 + v31;
    long long v32 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:@"com.apple.UIKit.textFormattingFontPicker" resolver:v46];
    v56[0] = v32;
    v33 = +[UISheetPresentationControllerDetent largeDetent];
    v56[1] = v33;
    id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
    objc_super v35 = [(UIViewController *)v12 sheetPresentationController];
    [v35 setDetents:v34];

    v36 = [(UIViewController *)v12 sheetPresentationController];
    [v36 setLargestUndimmedDetentIdentifier:0];

    v37 = [(UIViewController *)v12 sheetPresentationController];
    [v37 setPrefersEdgeAttachedInCompactHeight:1];

    v38 = [(UIViewController *)v12 sheetPresentationController];
    [v38 setWidthFollowsPreferredContentSizeWhenEdgeAttached:0];

    v39 = [(UIViewController *)v12 sheetPresentationController];
    [v39 setPrefersGrabberVisible:1];

    [(UIViewController *)self->_remoteViewController preferredContentSize];
    -[UIViewController setPreferredContentSize:](v12, "setPreferredContentSize:");
    [(UITextFormattingViewController *)self _modifyKeyboardTrackingIfNeededForType:2 start:1];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_5;
    v45[3] = &unk_1E52D9F70;
    v45[4] = self;
    [(UIViewController *)self presentViewController:v12 animated:1 completion:v45];
    objc_storeStrong((id *)&self->_fontPicker, v12);
    v40 = [v6 firstObject];
    if (v40)
    {
      v41 = [v6 firstObject];
      [v41 pointSize];
      self->_selectedFontSize = v42;
    }
    else
    {
      [off_1E52D39B8 defaultFontSize];
      self->_selectedFontSize = v43;
    }
  }
LABEL_16:
}

void __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 fontDescriptor];
  [v2 addObject:v3];
}

void __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_2(uint64_t a1)
{
  v2 = objc_alloc_init(_UITextFormattingDeferredFontPickingDelegate);
  id v3 = [*(id *)(a1 + 32) firstObject];
  if (v3)
  {
    char v4 = [*(id *)(a1 + 32) firstObject];
    [v4 pointSize];
    -[_UITextFormattingDeferredFontPickingDelegate setFontSize:](v2, "setFontSize:");
  }
  else
  {
    [off_1E52D39B8 defaultFontSize];
    -[_UITextFormattingDeferredFontPickingDelegate setFontSize:](v2, "setFontSize:");
  }

  [(_UITextFormattingDeferredFontPickingDelegate *)v2 setEditResponder:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setDelegate:v2];
  uint64_t v6 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_3;
  v7[3] = &unk_1E52DC308;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  [v5 presentViewController:v6 animated:1 completion:v7];
  objc_destroyWeak(&v8);
}

void __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = WeakRetained;
    char v3 = objc_opt_respondsToSelector();
    v2 = v4;
    if (v3)
    {
      [v4 _stopSuppressingKeyboardForTextFormatting:0];
      v2 = v4;
    }
  }
}

double __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

uint64_t __84__UITextFormattingViewController__presentFontPickerWithConfiguration_selectedFonts___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifyKeyboardTrackingIfNeededForType:2 start:0];
}

- (void)_presentTypographySettingsForFont:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v5 = (void *)get_TFTypographySettingsContentViewControllerClass_softClass;
  uint64_t v26 = get_TFTypographySettingsContentViewControllerClass_softClass;
  if (!get_TFTypographySettingsContentViewControllerClass_softClass)
  {
    v21[5] = MEMORY[0x1E4F143A8];
    v21[6] = 3221225472;
    v21[7] = __get_TFTypographySettingsContentViewControllerClass_block_invoke;
    v21[8] = &unk_1E52D9900;
    BOOL v22 = &v23;
    TextFormattingUILibraryCore();
    v24[3] = (uint64_t)objc_getClass("_TFTypographySettingsContentViewController");
    get_TFTypographySettingsContentViewControllerClass_softClass = *(void *)(v22[1] + 24);
    id v5 = (void *)v24[3];
  }
  uint64_t v6 = v5;
  _Block_object_dispose(&v23, 8);
  id v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "set_delegate:", self);
  id v8 = [[UINavigationController alloc] initWithRootViewController:v7];
  if ([(UITextFormattingViewControllerConfiguration *)self->_configuration _hasPopoverPresentation])
  {
    [(UIViewController *)v8 setModalPresentationStyle:1];
  }
  else
  {
    [(UIViewController *)self preferredContentSize];
    double v10 = v9;
    BOOL v11 = [(UITextFormattingViewControllerConfiguration *)self->_configuration _useLandscapeLayout];
    double v12 = 0.0;
    if (v11) {
      double v12 = 25.0;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__UITextFormattingViewController__presentTypographySettingsForFont___block_invoke;
    v21[3] = &__block_descriptor_40_e65_d16__0____UISheetPresentationControllerDetentResolutionContext__8l;
    *(double *)&v21[4] = v10 + v12;
    uint64_t v13 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:@"com.apple.UIKit.textFormattingFontPicker" resolver:v21];
    v27[0] = v13;
    id v14 = +[UISheetPresentationControllerDetent largeDetent];
    v27[1] = v14;
    char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    char v16 = [(UIViewController *)v8 sheetPresentationController];
    [v16 setDetents:v15];

    int v17 = [(UIViewController *)v8 sheetPresentationController];
    [v17 setLargestUndimmedDetentIdentifier:@"com.apple.UIKit.textFormattingFontPicker"];

    int v18 = [(UIViewController *)v8 sheetPresentationController];
    [v18 setPrefersEdgeAttachedInCompactHeight:1];

    id v19 = [(UIViewController *)v8 sheetPresentationController];
    [v19 setWidthFollowsPreferredContentSizeWhenEdgeAttached:0];

    id v20 = [(UIViewController *)v8 sheetPresentationController];
    [v20 setPrefersGrabberVisible:1];
  }
  [(UIViewController *)self presentViewController:v8 animated:1 completion:0];
  [v7 _setSelectedFont:v4];
}

double __68__UITextFormattingViewController__presentTypographySettingsForFont___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (void)_setShouldDeferFontPickerPresentationToViewController:(id)a3
{
  objc_storeWeak((id *)&self->_preferredFontPickerPresentationViewController, a3);
  [(UITextFormattingViewController *)self _updateChildControllersConfiguration];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_resetDetentsForSheetController:(id)a3 invalidate:(BOOL)a4
{
  BOOL v4 = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v7 = [v6 detents];
  BOOL v8 = [v7 count] == 0;

  if (!v8)
  {
    double v9 = [v6 detents];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__UITextFormattingViewController__resetDetentsForSheetController_invalidate___block_invoke;
    v15[3] = &unk_1E53117E8;
    v15[4] = &v16;
    [v9 enumerateObjectsUsingBlock:v15];
  }
  if (*((unsigned char *)v17 + 24))
  {
    [(UIViewController *)self preferredContentSize];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__UITextFormattingViewController__resetDetentsForSheetController_invalidate___block_invoke_2;
    v14[3] = &__block_descriptor_40_e65_d16__0____UISheetPresentationControllerDetentResolutionContext__8l;
    v14[4] = v10;
    BOOL v11 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:@"com.apple.UIKit.textFormatting" resolver:v14];
    v20[0] = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v6 setDetents:v12];

    if ([(UITextFormattingViewControllerConfiguration *)self->_configuration _preferringDimmingVisible])
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = @"com.apple.UIKit.textFormatting";
    }
    [v6 setLargestUndimmedDetentIdentifier:v13];
    if (v4) {
      [v6 invalidateDetents];
    }
  }
  _Block_object_dispose(&v16, 8);
}

void __77__UITextFormattingViewController__resetDetentsForSheetController_invalidate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v6 = [v9 identifier];
  if (v6 != @"com.apple.UIKit.textFormatting")
  {
    id v7 = v6;
    BOOL v8 = [v9 identifier];

    if (v8 != @"com.apple.UIKit.large")
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

double __77__UITextFormattingViewController__resetDetentsForSheetController_invalidate___block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (BOOL)_useLandscapeLayout
{
  char v3 = [(UIViewController *)self _window];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 frame];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    id v9 = [(UIViewController *)self view];
    [v9 frame];
    double v6 = v10;
    double v8 = v11;
  }
  return -[UITextFormattingViewController _useLandscapeLayoutForSize:](self, "_useLandscapeLayoutForSize:", v6, v8);
}

- (BOOL)_useLandscapeLayoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(UIViewController *)self _isInPopoverPresentation]) {
    return 0;
  }
  double v6 = +[UIDevice currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  double v8 = +[UIDevice currentDevice];
  [v8 orientation];

  BOOL v10 = height < width && v7 == 0;
  return width > 480.0 && v10;
}

- (void)_updateInternalConfigurationProperties
{
  [(UITextFormattingViewControllerConfiguration *)self->_configuration _setHasPopoverPresentation:[(UIViewController *)self _isInPopoverPresentation]];
  [(UITextFormattingViewControllerConfiguration *)self->_configuration _setUseLandscapeLayout:[(UITextFormattingViewController *)self _useLandscapeLayout]];
  char v3 = [(UITextFormattingViewController *)self configuration];
  int v4 = [v3 _isTextAnimationsConfiguration];

  if (v4)
  {
    if ([(UIViewController *)self _isInPopoverPresentation])
    {
      BOOL v5 = 0;
    }
    else
    {
      +[UIKeyboard sizeForInterfaceOrientation:[(UIViewController *)self interfaceOrientation]];
      BOOL v5 = v7 <= 320.0;
    }
    double v8 = +[UIDevice currentDevice];
    id v9 = [v8 _deviceInfoForKey:@"main-screen-class"];
    int v10 = [v9 integerValue];

    BOOL v6 = v10 == 28 || (v10 & 0xFFFFFFFE) == 6;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v5 = 0;
  }
  configuration = self->_configuration;
  [(UITextFormattingViewControllerConfiguration *)configuration set_useReducedMetrics:v5 | v6];
}

- (void)_updateChildControllersConfiguration
{
  [(_UITextFormattingViewHostingImpl *)self->_hostingImpl setRemoteConfiguration:self->_configuration];
  contentViewController = self->_contentViewController;
  configuration = self->_configuration;
  [(_TFTextFormattingContentViewController *)contentViewController _setConfiguration:configuration];
}

- (void)_sendUpdatesToEditResponder:(id)a3
{
  id v12 = a3;
  int v4 = [(UITextFormattingViewController *)self _textView];
  if (v12 && v4)
  {
    BOOL v5 = [v4 selectedTextRange];
    int v6 = [v5 isEmpty];

    if (v6)
    {
      MakeConversionHandler(v12);
      double v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      double v8 = [v4 typingAttributes];
      id v9 = ((void (**)(void, void *))v7)[2](v7, v8);
      [v4 setTypingAttributes:v9];

      if (objc_opt_respondsToSelector()) {
        [v4 performSelector:sel__textFormattingOptionsNeedUpdate_ withObject:0];
      }
    }
  }
  else if (!v12)
  {
    goto LABEL_10;
  }
  int v10 = [(UITextFormattingViewController *)self _editResponder];

  if (v10)
  {
    double v11 = [(UITextFormattingViewController *)self _editResponder];
    SendUpdatesToEditResponder(v12, v11);
  }
LABEL_10:
}

- (void)_updateNavBarVisibility
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if ([(UIViewController *)self _isInPopoverPresentation]
    || ([(UIViewController *)self parentViewController],
        char v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    navBar = self->_navBar;
    if (navBar) {
      [(UIView *)navBar removeFromSuperview];
    }
  }
  else
  {
    BOOL v5 = self->_navBar;
    if (!v5)
    {
      int v6 = (UINavigationBar *)objc_opt_new();
      double v7 = self->_navBar;
      self->_navBar = v6;

      double v8 = objc_opt_new();
      [v8 configureWithTransparentBackground];
      [(UINavigationBar *)self->_navBar setStandardAppearance:v8];
      id v9 = objc_opt_new();
      [v9 setLeftItemsSupplementBackButton:0];
      int v10 = self->_navBar;
      v27[0] = v9;
      double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [(UINavigationBar *)v10 setItems:v11];

      id v12 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:24 primaryAction:0];
      [(UIBarButtonItem *)v12 setAction:sel__textFormattingDidFinish];
      [(UIBarButtonItem *)v12 setTarget:self];
      [v9 setRightBarButtonItem:v12];
      uint64_t v13 = objc_opt_new();
      id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v15 = [v14 localizedStringForKey:@"TEXT_FORMATTING_FORMAT" value:@"Format" table:@"Localizable"];
      [v13 setText:v15];

      uint64_t v16 = [off_1E52D39B8 systemFontOfSize:21.0 weight:*(double *)off_1E52D6C00];
      [v13 setFont:v16];

      int v17 = [[UIBarButtonItem alloc] initWithCustomView:v13];
      [v9 setLeftBarButtonItem:v17];

      BOOL v5 = self->_navBar;
    }
    uint64_t v18 = [(UIView *)v5 superview];

    if (!v18) {
      [(UIStackView *)self->_contentStackView insertArrangedSubview:self->_navBar atIndex:0];
    }
    char v19 = [(UIViewController *)self navigationItem];
    [v19 setTitle:0];
  }
  id v20 = self->_navBar;
  id v21 = [(UIViewController *)self navigationItem];
  BOOL v22 = v21;
  if (v20)
  {
    [v21 setTitle:0];

    uint64_t v23 = [(UIViewController *)self navigationItem];
    [(UIBarButtonItem *)v23 setRightBarButtonItem:0];
  }
  else
  {
    double v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v25 = [v24 localizedStringForKey:@"TEXT_FORMATTING_FORMAT" value:@"Format" table:@"Localizable"];
    [v22 setTitle:v25];

    uint64_t v23 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:0 primaryAction:0];
    [(UIBarButtonItem *)v23 setAction:sel__textFormattingDidFinish];
    [(UIBarButtonItem *)v23 setTarget:self];
    uint64_t v26 = [(UIViewController *)self navigationItem];
    [v26 setRightBarButtonItem:v23];
  }
}

- (BOOL)_useChildViewWidthForContentSize
{
  BOOL v3 = [(UITextFormattingViewController *)self _useLandscapeLayout];
  if (v3)
  {
    BOOL v3 = [(UITextFormattingViewControllerConfiguration *)self->_configuration _isTextViewConfiguration];
    if (v3) {
      LOBYTE(v3) = ![(UITextFormattingViewControllerConfiguration *)self->_configuration _isTextAnimationsConfiguration];
    }
  }
  return v3;
}

- (CGSize)_computeContentSize
{
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    [(UIViewController *)remoteViewController preferredContentSize];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    [(_TFTextFormattingContentViewController *)contentViewController preferredContentSize];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if ([(UITextFormattingViewController *)self _useChildViewWidthForContentSize])
  {
    if (v5 < v10) {
      double v5 = v10;
    }
  }
  else
  {
    uint64_t v13 = [(UIViewController *)self view];
    [v13 frame];
    double v5 = v14;
  }
  navBar = self->_navBar;
  double v16 = 0.0;
  if (navBar)
  {
    int v17 = [(UIView *)navBar superview];

    if (v17)
    {
      uint64_t v18 = self->_navBar;
      [(UIView *)v18 frame];
      -[UINavigationBar sizeThatFits:](v18, "sizeThatFits:", v19, v20);
      double v16 = v21;
    }
  }
  double v22 = v7 + v12 + v16;
  double v23 = v5;
  result.double height = v22;
  result.double width = v23;
  return result;
}

- (void)_updateContentSizeForAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("TextFormattingUI", &qword_1EB25C030);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v72 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      remoteViewController = self->_remoteViewController;
      v74 = v72;
      [(UIViewController *)remoteViewController preferredContentSize];
      uint64_t v76 = v75;
      [(UIViewController *)self->_remoteViewController preferredContentSize];
      int v84 = 134218240;
      uint64_t v85 = v76;
      __int16 v86 = 2048;
      uint64_t v87 = v77;
      _os_log_impl(&dword_1853B0000, v74, OS_LOG_TYPE_ERROR, "Remote child view content size is %f by %f", (uint8_t *)&v84, 0x16u);
    }
  }
  unint64_t v6 = __UILogGetCategoryCachedImpl("TextFormattingUI", &qword_1EB25C038);
  if (*(unsigned char *)v6)
  {
    v78 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      contentViewController = self->_contentViewController;
      v80 = v78;
      [(_TFTextFormattingContentViewController *)contentViewController preferredContentSize];
      uint64_t v82 = v81;
      [(_TFTextFormattingContentViewController *)self->_contentViewController preferredContentSize];
      int v84 = 134218240;
      uint64_t v85 = v82;
      __int16 v86 = 2048;
      uint64_t v87 = v83;
      _os_log_impl(&dword_1853B0000, v80, OS_LOG_TYPE_ERROR, "In-process child view content size is %f by %f", (uint8_t *)&v84, 0x16u);
    }
  }
  double v7 = self->_remoteViewController;
  if (v7)
  {
    double v8 = [(UIViewController *)v7 view];
    [v8 frame];
    double v10 = v9;
    [(UIViewController *)self->_remoteViewController preferredContentSize];
    double v12 = v11;

    if (v10 != v12)
    {
      uint64_t v13 = [(UIViewController *)self->_remoteViewController view];
      [v13 frame];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      [(UIViewController *)self->_remoteViewController preferredContentSize];
      double v21 = v20;
      double v22 = [(UIViewController *)self->_remoteViewController view];
      objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

      double v23 = [(UIStackView *)self->_contentStackView arrangedSubviews];
      double v24 = [(UIViewController *)self->_remoteViewController view];
      uint64_t v25 = [v23 indexOfObject:v24];

      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v26 = [(UIViewController *)self->_remoteViewController view];
        [v26 removeFromSuperview];

        contentStackView = self->_contentStackView;
        double v28 = [(UIViewController *)self->_remoteViewController view];
        [(UIStackView *)contentStackView insertArrangedSubview:v28 atIndex:v25];
      }
    }
  }
  double v29 = self->_contentViewController;
  if (v29)
  {
    BOOL v30 = [(_TFTextFormattingContentViewController *)v29 view];
    [v30 frame];
    double v32 = v31;
    [(_TFTextFormattingContentViewController *)self->_contentViewController preferredContentSize];
    double v34 = v33;

    if (v32 != v34)
    {
      objc_super v35 = [(_TFTextFormattingContentViewController *)self->_contentViewController view];
      [v35 frame];
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;

      [(_TFTextFormattingContentViewController *)self->_contentViewController preferredContentSize];
      double v43 = v42;
      id v44 = [(_TFTextFormattingContentViewController *)self->_contentViewController view];
      objc_msgSend(v44, "setFrame:", v37, v39, v41, v43);

      v45 = [(UIStackView *)self->_contentStackView arrangedSubviews];
      v46 = [(_TFTextFormattingContentViewController *)self->_contentViewController view];
      uint64_t v47 = [v45 indexOfObject:v46];

      if (v47 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v48 = [(_TFTextFormattingContentViewController *)self->_contentViewController view];
        [v48 removeFromSuperview];

        id v49 = self->_contentStackView;
        v50 = [(_TFTextFormattingContentViewController *)self->_contentViewController view];
        [(UIStackView *)v49 insertArrangedSubview:v50 atIndex:v47];
      }
    }
  }
  [(UITextFormattingViewController *)self _computeContentSize];
  double v52 = v51;
  double v54 = v53;
  if (![(UITextFormattingViewController *)self _useChildViewWidthForContentSize])
  {
    [(UIViewController *)self preferredContentSize];
    if ((v56 != v54 || v55 != v52) && v3)
    {
      if ([(UIViewController *)self _isInPopoverPresentation])
      {
        v58 = [(UIViewController *)self popoverPresentationController];

        if (v58)
        {
          v59 = [(UIViewController *)self popoverPresentationController];
          uint64_t v60 = [v59 arrowDirection];

          if (v60 == 8 || v60 == 4)
          {
            v61 = [(UIViewController *)self view];
            [v61 bounds];
            double v63 = v62;
            v64 = [(UIViewController *)self view];
            [v64 safeAreaInsets];
            double v66 = v63 - v65;
            v67 = [(UIViewController *)self view];
            [v67 safeAreaInsets];
            double v52 = v66 - v68;
          }
        }
      }
    }
  }
  [(UIViewController *)self preferredContentSize];
  if (v70 != v52 || v69 != v54)
  {
    -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v52, v54);
    [(UITextFormattingViewController *)self _updateScrollViewContentSizeIfNeeded];
    v71 = [(UIViewController *)self _existingPresentationControllerImmediate:1 effective:1];
    if (v71)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(UITextFormattingViewController *)self _resetDetentsForSheetController:v71 invalidate:1];
      }
    }
  }
}

- (void)_updateScrollViewContentSizeIfNeeded
{
  [(UITextFormattingViewController *)self _computeContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(UITextFormattingViewController *)self _scrollView];
  if (v7)
  {
    id v16 = v7;
    [v7 contentSize];
    if (v9 != v4 || v8 != v6) {
      objc_msgSend(v16, "setContentSize:", v4, v6);
    }
    [(UIView *)self->_contentView frame];
    BOOL v13 = v12 == v4 && v11 == v6;
    double v7 = v16;
    if (!v13)
    {
      [(UIView *)self->_contentView frame];
      double v15 = v14;
      [(UIView *)self->_contentView frame];
      [(UIView *)self->_contentView setFrame:v15];
      double v7 = v16;
    }
  }
}

- (id)_scrollView
{
  if (self->_containerView)
  {
    double v3 = self;
    if (objc_opt_isKindOfClass()) {
      containerView = self->_containerView;
    }
    else {
      containerView = 0;
    }
    double v5 = containerView;
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (void)_invokeEditResponderAction:(SEL)a3
{
  uint64_t v5 = [(UITextFormattingViewController *)self _editResponder];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(UITextFormattingViewController *)self _editResponder];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(UITextFormattingViewController *)self _editResponder];
      objc_msgSend(v9, a3, self);
    }
  }
}

- (void)_applyTextViewHighlightWithChangeValue:(id)a3
{
  id v13 = a3;
  double v4 = [(UITextFormattingViewController *)self _textView];
  uint64_t v5 = v4;
  if (v4)
  {
    double v6 = [v4 selectedTextRange];
    double v7 = _NSTextHighlightColorSchemeForTextFormattingChangeValue(v13);
    if ([v6 isEmpty])
    {
      char v8 = objc_opt_new();
      id v9 = v8;
      if (v7)
      {
        [v8 setObject:*(void *)off_1E52D2320 forKey:*(void *)off_1E52D2318];
        [v9 setObject:v7 forKey:*(void *)off_1E52D22D8];
      }
      else
      {
        double v11 = [MEMORY[0x1E4F1CA98] null];
        [v9 setObject:v11 forKey:*(void *)off_1E52D2318];

        double v12 = [MEMORY[0x1E4F1CA98] null];
        [v9 setObject:v12 forKey:*(void *)off_1E52D22D8];
      }
      [(UITextFormattingViewController *)self _sendUpdatesToEditResponder:v9];
    }
    else if (v7)
    {
      uint64_t v10 = *(void *)off_1E52D2320;
      id v9 = [v5 selectedTextRange];
      [v5 _applyHighlightStyle:v10 colorScheme:v7 toTextRange:v9];
    }
    else
    {
      id v9 = [v5 selectedTextRange];
      [v5 _removeHighlightsFromTextRange:v9];
    }
  }
}

- (void)_textFormattingDidChangeValue:(id)a3 textAttributes:(id)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (unint64_t)v7;
  if (v7)
  {
    id v9 = MakeConversionHandler(v7);
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = _Block_copy(v9);
  id conversionHandler = self->__conversionHandler;
  self->__id conversionHandler = v10;

  if (v8) {
  uint64_t v12 = [(UITextFormattingViewController *)self _editResponder];
  }
  if (!v12)
  {
LABEL_15:
    double v22 = [(UITextFormattingViewController *)self delegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      double v19 = [(UITextFormattingViewController *)self delegate];
      [v19 textFormattingViewController:self didChangeValue:v6];
      goto LABEL_39;
    }
    double v24 = [(UITextFormattingViewController *)self configuration];
    int v25 = [v24 _isTextAnimationsConfiguration];

    if (v25 && ([v6 _textAnimationAttributes], uint64_t v26 = objc_claimAutoreleasedReturnValue(), v8 | v26))
    {
      double v19 = (void *)v26;
      if (v26) {
        uint64_t v34 = v26;
      }
      else {
        uint64_t v34 = v8;
      }
      objc_super v35 = self;
    }
    else
    {
      double v19 = [(UITextFormattingViewController *)self _textView];
      id v27 = [v6 changeType];
      int v28 = [v27 isEqualToString:@"UITextFormattingViewControllerIncreaseFontSizeChange"];

      if (v28)
      {
        double v29 = [(UITextFormattingViewController *)self _editResponder];

        if (!v29) {
          goto LABEL_39;
        }
        BOOL v30 = [(UITextFormattingViewController *)self _editResponder];
        [v30 increaseSize:self];
LABEL_38:

        goto LABEL_39;
      }
      double v31 = [v6 changeType];
      int v32 = [v31 isEqualToString:@"UITextFormattingViewControllerDecreaseFontSizeChange"];

      if (v32)
      {
        double v33 = [(UITextFormattingViewController *)self _editResponder];

        if (!v33) {
          goto LABEL_39;
        }
        BOOL v30 = [(UITextFormattingViewController *)self _editResponder];
        [v30 decreaseSize:self];
        goto LABEL_38;
      }
      double v36 = [v6 changeType];
      int v37 = [v36 isEqualToString:@"UITextFormattingViewControllerFontSizeChange"];

      if (v37)
      {
        uint64_t v38 = [(UITextFormattingViewController *)self _editResponder];
        if (v38)
        {
          double v39 = (void *)v38;
          double v40 = [v6 numberValue];

          if (v40)
          {
            double v70 = @"_UITextFormattingSizeAttributeName";
            double v41 = [v6 numberValue];
            v71[0] = v41;
            double v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];

            [(UITextFormattingViewController *)self _sendUpdatesToEditResponder:v42];
          }
        }
        goto LABEL_39;
      }
      double v43 = [v6 changeType];
      int v44 = [v43 isEqualToString:@"UITextFormattingViewControllerSetBoldChange"];

      if (v44
        || ([v6 changeType],
            v45 = objc_claimAutoreleasedReturnValue(),
            int v46 = [v45 isEqualToString:@"UITextFormattingViewControllerRemoveBoldChange"],
            v45,
            v46))
      {
        uint64_t v47 = [(UITextFormattingViewController *)self _editResponder];

        if (!v47) {
          goto LABEL_39;
        }
        BOOL v30 = [(UITextFormattingViewController *)self _editResponder];
        [v30 toggleBoldface:self];
        goto LABEL_38;
      }
      double v51 = [v6 changeType];
      int v52 = [v51 isEqualToString:@"UITextFormattingViewControllerSetItalicChange"];

      if (v52
        || ([v6 changeType],
            double v53 = objc_claimAutoreleasedReturnValue(),
            int v54 = [v53 isEqualToString:@"UITextFormattingViewControllerRemoveItalicChange"],
            v53,
            v54))
      {
        double v55 = [(UITextFormattingViewController *)self _editResponder];

        if (!v55) {
          goto LABEL_39;
        }
        BOOL v30 = [(UITextFormattingViewController *)self _editResponder];
        [v30 toggleItalics:self];
        goto LABEL_38;
      }
      double v56 = [v6 changeType];
      int v57 = [v56 isEqualToString:@"UITextFormattingViewControllerSetUnderlineChange"];

      if (v57
        || ([v6 changeType],
            v58 = objc_claimAutoreleasedReturnValue(),
            int v59 = [v58 isEqualToString:@"UITextFormattingViewControllerRemoveUnderlineChange"],
            v58,
            v59))
      {
        uint64_t v60 = [(UITextFormattingViewController *)self _editResponder];

        if (!v60) {
          goto LABEL_39;
        }
        BOOL v30 = [(UITextFormattingViewController *)self _editResponder];
        [v30 toggleUnderline:self];
        goto LABEL_38;
      }
      v61 = [v6 changeType];
      int v62 = [v61 isEqualToString:@"UITextFormattingViewControllerTextAlignmentChange"];

      if (v62)
      {
        if ([v6 textAlignment])
        {
          if ([v6 textAlignment] == 1)
          {
            double v63 = sel_alignCenter_;
          }
          else if ([v6 textAlignment] == 2)
          {
            double v63 = sel_alignRight_;
          }
          else
          {
            if ([v6 textAlignment] != 3) {
              goto LABEL_39;
            }
            double v63 = sel_alignJustified_;
          }
        }
        else
        {
          double v63 = sel_alignLeft_;
        }
        [(UITextFormattingViewController *)self _invokeEditResponderAction:v63];
        goto LABEL_39;
      }
      if (v19)
      {
        v64 = [v6 changeType];
        int v65 = [v64 isEqualToString:@"UITextFormattingViewControllerHighlightChange"];

        if (v65)
        {
          [(UITextFormattingViewController *)self _applyTextViewHighlightWithChangeValue:v6];
          goto LABEL_39;
        }
        v67 = [v19 textStorage];
        uint64_t v68 = [v19 selectedRange];
        BOOL v66 = -[UITextFormattingViewController _adjustAttributesInTextStorage:atRange:forChangeValue:](self, "_adjustAttributesInTextStorage:atRange:forChangeValue:", v67, v68, v69, v6);
      }
      else
      {
        BOOL v66 = 0;
      }
      if (!v8 || v66) {
        goto LABEL_39;
      }
      objc_super v35 = self;
      uint64_t v34 = v8;
    }
    [(UITextFormattingViewController *)v35 _sendUpdatesToEditResponder:v34];
    goto LABEL_39;
  }
  id v13 = (void *)v12;
  double v14 = [(UITextFormattingViewController *)self _editResponder];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_15;
  }
  double v15 = [(UITextFormattingViewController *)self _editResponder];
  uint64_t v16 = [v15 performSelector:sel__shouldHandleTextFormattingChangeValue_ withObject:v6];

  if (v16) {
    goto LABEL_15;
  }
  if ([(UITextFormattingViewControllerConfiguration *)self->_configuration _isTextAnimationsConfiguration])
  {
    double v17 = [v6 changeType];

    if (v17 == @"UITextFormattingViewControllerCustomComponentSelectedChange")
    {
      double v18 = [(UITextFormattingViewController *)self _textView];
      double v19 = v18;
      if (v18)
      {
        double v20 = [v18 selectedTextRange];
        int v21 = [v20 isEmpty];

        if (v21)
        {
          [(UITextFormattingViewController *)self _textFormattingDidFinish];
LABEL_39:

          goto LABEL_40;
        }
      }
    }
  }
  id v48 = [(UITextFormattingViewController *)self _editResponder];
  char v49 = objc_opt_respondsToSelector();

  if (v49)
  {
    v50 = [(UITextFormattingViewController *)self _editResponder];
    [v50 performSelector:sel__textFormattingOptionsNeedUpdate_ withObject:0];
  }
LABEL_40:
}

- (id)_textView
{
  double v3 = [(UITextFormattingViewController *)self _editResponder];
  if (v3)
  {
    double v4 = v3;
    uint64_t v5 = [(UITextFormattingViewController *)self _editResponder];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v3 = [(UITextFormattingViewController *)self _editResponder];
    }
    else
    {
      double v3 = 0;
    }
  }
  return v3;
}

- (void)_reconfigureViewHierarchyForParentController:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIViewController *)self view];
  id v6 = [v5 subviews];
  id v7 = [v6 firstObject];
  unint64_t v8 = v7;
  id v9 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
  if (v4)
  {
    containerView = self->_containerView;

    if (v8 == containerView) {
      goto LABEL_21;
    }
  }
  else if (v7)
  {
    double v11 = [(UIViewController *)self view];
    uint64_t v12 = [v11 subviews];
    id v13 = [v12 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  double v15 = [(UIViewController *)self view];
  uint64_t v16 = [v15 subviews];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v93 objects:v100 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v94 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v93 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v93 objects:v100 count:16];
    }
    while (v18);
  }

  backdropView = self->_backdropView;
  self->_backdropView = 0;

  unint64_t v22 = 0x1E4F5B000uLL;
  id v92 = v4;
  if (v4)
  {
    char v23 = [(UITextFormattingViewController *)self configuration];
    int v24 = [v23 _isTextAnimationsConfiguration];

    if (v24)
    {
      int v25 = [UIKBVisualEffectView alloc];
      uint64_t v26 = [(UIViewController *)self view];
      [v26 bounds];
      id v27 = -[UIVisualEffectView initWithFrame:](v25, "initWithFrame:");

      [(UIKBBackdropView *)v27 transitionToStyle:[(UITextFormattingViewController *)self _backdropViewStyle]];
      int v28 = self->_backdropView;
      self->_backdropView = v27;
      double v29 = v27;

      BOOL v30 = [(UIViewController *)self view];
      [v30 addSubview:v29];

      [(UIView *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v69 = (void *)MEMORY[0x1E4F5B268];
      __int16 v86 = [(UIView *)v29 topAnchor];
      v89 = [(UIViewController *)self view];
      uint64_t v83 = [v89 topAnchor];
      v80 = [v86 constraintEqualToAnchor:v83];
      v99[0] = v80;
      v74 = [(UIView *)v29 leadingAnchor];
      uint64_t v77 = [(UIViewController *)self view];
      v71 = [v77 leadingAnchor];
      v67 = [v74 constraintEqualToAnchor:v71];
      v99[1] = v67;
      int v65 = [(UIView *)v29 trailingAnchor];
      double v31 = [(UIViewController *)self view];
      int v32 = [v31 trailingAnchor];
      double v33 = [v65 constraintEqualToAnchor:v32];
      v99[2] = v33;
      uint64_t v34 = [(UIView *)v29 bottomAnchor];
      objc_super v35 = [(UIViewController *)self view];
      double v36 = [v35 bottomAnchor];
      int v37 = [v34 constraintEqualToAnchor:v36];
      v99[3] = v37;
      uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:4];
      [v69 activateConstraints:v38];

      id v9 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
      unint64_t v39 = 0x1E4F1C000;

      unint64_t v22 = 0x1E4F5B000;
      double v40 = [(UIVisualEffectView *)v29 contentView];
      double v41 = +[UIColor clearColor];

      double v42 = [(UIViewController *)self view];
      [v42 setBackgroundColor:v41];
    }
    else
    {
      double v40 = [(UIViewController *)self view];
      double v41 = +[UIColor systemBackgroundColor];
      [v40 setBackgroundColor:v41];
      unint64_t v39 = 0x1E4F1C000uLL;
    }
  }
  else
  {
    double v41 = [[UIVisualEffectView alloc] initWithEffect:0];
    v90 = +[UIBlurEffect effectWithStyle:9];
    [(UIVisualEffectView *)v41 setEffect:v90];
    double v43 = [(UIViewController *)self view];
    [v43 addSubview:v41];

    [(UIView *)v41 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v68 = (void *)MEMORY[0x1E4F5B268];
    int v84 = [(UIView *)v41 topAnchor];
    uint64_t v87 = [(UIViewController *)self view];
    uint64_t v81 = [v87 topAnchor];
    v78 = [v84 constraintEqualToAnchor:v81];
    v98[0] = v78;
    v72 = [(UIView *)v41 leadingAnchor];
    uint64_t v75 = [(UIViewController *)self view];
    double v70 = [v75 leadingAnchor];
    BOOL v66 = [v72 constraintEqualToAnchor:v70];
    v98[1] = v66;
    v64 = [(UIView *)v41 trailingAnchor];
    int v44 = [(UIViewController *)self view];
    v45 = [v44 trailingAnchor];
    int v46 = [v64 constraintEqualToAnchor:v45];
    v98[2] = v46;
    uint64_t v47 = [(UIView *)v41 bottomAnchor];
    id v48 = [(UIViewController *)self view];
    char v49 = [v48 bottomAnchor];
    v50 = [v47 constraintEqualToAnchor:v49];
    v98[3] = v50;
    double v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:4];
    [v68 activateConstraints:v51];

    id v9 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
    unint64_t v39 = 0x1E4F1C000;

    unint64_t v22 = 0x1E4F5B000;
    double v40 = [(UIVisualEffectView *)v41 contentView];
    int v52 = +[UIColor clearColor];
    double v53 = [(UIViewController *)self view];
    [v53 setBackgroundColor:v52];
  }
  uint64_t v54 = v9[590];
  [v40 addSubview:*(Class *)((char *)&self->super.super.super.isa + v54)];
  [*(id *)((char *)&self->super.super.super.isa + v54) setTranslatesAutoresizingMaskIntoConstraints:0];
  v73 = *(void **)(v22 + 616);
  uint64_t v88 = [*(id *)((char *)&self->super.super.super.isa + v54) topAnchor];
  v91 = [v40 safeAreaLayoutGuide];
  uint64_t v85 = [v91 topAnchor];
  uint64_t v82 = [v88 constraintEqualToAnchor:v85];
  v97[0] = v82;
  v79 = [*(id *)((char *)&self->super.super.super.isa + v54) leadingAnchor];
  uint64_t v76 = [v40 leadingAnchor];
  double v55 = [v79 constraintEqualToAnchor:v76];
  v97[1] = v55;
  double v56 = [*(id *)((char *)&self->super.super.super.isa + v54) trailingAnchor];
  int v57 = [v40 trailingAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  v97[2] = v58;
  int v59 = [*(id *)((char *)&self->super.super.super.isa + v54) bottomAnchor];
  uint64_t v60 = [v40 safeAreaLayoutGuide];
  v61 = [v60 bottomAnchor];
  int v62 = [v59 constraintEqualToAnchor:v61];
  v97[3] = v62;
  double v63 = [*(id *)(v39 + 2424) arrayWithObjects:v97 count:4];
  [v73 activateConstraints:v63];

  id v4 = v92;
LABEL_21:
}

- (void)_textViewFormattingWillBegin
{
  double v3 = [(UITextFormattingViewController *)self _textView];
  if (v3)
  {
    id v8 = v3;
    id v4 = [v3 tintColor];
    uint64_t v5 = [(UIViewController *)self view];
    [v5 setTintColor:v4];

    id v6 = [v8 delegate];
    if (objc_opt_respondsToSelector())
    {
      [v6 textView:v8 willBeginFormattingWithViewController:self];
    }
    else
    {
      id v7 = [v8 delegate];
      if (objc_opt_respondsToSelector()) {
        [v7 _textView:v8 willBeginFormatting:self];
      }
    }
    double v3 = v8;
  }
}

- (void)_textViewFormattingDidBegin
{
  double v3 = [(UITextFormattingViewController *)self _textView];
  if (v3)
  {
    id v6 = v3;
    id v4 = [v3 delegate];
    if (objc_opt_respondsToSelector())
    {
      [v4 textView:v6 didBeginFormattingWithViewController:self];
    }
    else
    {
      uint64_t v5 = [v6 delegate];
      if (objc_opt_respondsToSelector()) {
        [v5 _textView:v6 didBeginFormatting:self];
      }
    }
    double v3 = v6;
  }
}

- (void)_textViewFormattingWillEnd
{
  double v3 = [(UITextFormattingViewController *)self _textView];
  if (v3)
  {
    id v6 = v3;
    id v4 = [v3 delegate];
    if (objc_opt_respondsToSelector())
    {
      [v4 textView:v6 willEndFormattingWithViewController:self];
    }
    else
    {
      uint64_t v5 = [v6 delegate];
      if (objc_opt_respondsToSelector()) {
        [v5 _textView:v6 willEndFormatting:self];
      }
    }
    double v3 = v6;
  }
}

- (void)_textViewFormattingDidEnd
{
  double v3 = [(UITextFormattingViewController *)self _textView];
  if (v3)
  {
    id v6 = v3;
    id v4 = [v3 delegate];
    if (objc_opt_respondsToSelector())
    {
      [v4 textView:v6 didEndFormattingWithViewController:self];
    }
    else
    {
      uint64_t v5 = [v6 delegate];
      if (objc_opt_respondsToSelector()) {
        [v5 _textView:v6 didEndFormatting:self];
      }
    }
    double v3 = v6;
  }
}

- (int64_t)_backdropViewStyle
{
  double v3 = +[UISubstituteKeyboardSession sharedSession];
  id v4 = [v3 _textFormattingViewController];

  if (v4 != self) {
    goto LABEL_8;
  }
  uint64_t v5 = +[UISubstituteKeyboardSession sharedSession];
  id v6 = [v5 _textFormattingResponder];

  if (!v6
    || (objc_opt_respondsToSelector() & 1) == 0
    || ![v6 _shouldReplaceKeyboardForTextFormattingKeyboardSessionIfApplicable])
  {

LABEL_8:
    id v6 = [(UIViewController *)self view];
    id v7 = [v6 _inheritedRenderConfig];
    int64_t v8 = [v7 backdropStyle];
    goto LABEL_9;
  }
  id v7 = [(UIViewController *)self traitCollection];
  if ([v7 userInterfaceStyle] == 2) {
    +[UIKBRenderConfig darkConfig];
  }
  else {
  uint64_t v10 = +[UIKBRenderConfig defaultEmojiConfig];
  }
  int64_t v8 = [v10 backdropStyle];

LABEL_9:
  return v8;
}

- (void)_onUserInterfaceStyleChange
{
  backdropView = self->_backdropView;
  if (backdropView)
  {
    int64_t v3 = [(UITextFormattingViewController *)self _backdropViewStyle];
    [(UIKBBackdropView *)backdropView transitionToStyle:v3];
  }
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    uint64_t v10 = *(void *)off_1E52D2048;
    v11[0] = a4;
    id v6 = (void *)MEMORY[0x1E4F1C9E8];
    id v7 = a4;
    int64_t v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = [[UITextFormattingViewControllerChangeValue alloc] initWithTextColor:v7];

    [(UITextFormattingViewController *)self _textFormattingDidChangeValue:v9 textAttributes:v8];
  }
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *(void *)off_1E52D2048;
  id v4 = a3;
  uint64_t v5 = [v4 selectedColor];
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  id v7 = [UITextFormattingViewControllerChangeValue alloc];
  int64_t v8 = [v4 selectedColor];

  id v9 = [(UITextFormattingViewControllerChangeValue *)v7 initWithTextColor:v8];
  [(UITextFormattingViewController *)self _textFormattingDidChangeValue:v9 textAttributes:v6];
  colorPicker = self->_colorPicker;
  self->_colorPicker = 0;

  [(UITextFormattingViewController *)self _textFormattingRequestsFirstResponderRestoration];
  [(UITextFormattingViewController *)self _startSuppressingKeyboardForTextFormatting];
}

- (void)_updateFormattingDescriptor:(id)a3
{
  if (a3)
  {
    hostingImpl = self->_hostingImpl;
    id v5 = a3;
    [(_UITextFormattingViewHostingImpl *)hostingImpl setRemoteFormattingDescriptor:v5];
    [(_TFTextFormattingContentViewController *)self->_contentViewController _setFormattingDescriptor:v5];

    [(UITextFormattingViewController *)self _updateDisabledComponents];
  }
}

- (void)_updateDisabledComponents
{
  int64_t v3 = [(UITextFormattingViewController *)self _editResponder];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UITextFormattingViewController *)self _editResponder];
    id v12 = [v5 performSelector:sel__disabledComponentsForTextFormattingOptions];

    id v6 = v12;
  }
  else
  {
    id v6 = 0;
  }
  id v13 = v6;
  if ([v6 count]
    || ([(UITextFormattingViewController *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) == 0))
  {
    uint64_t v11 = v13;
    if (!v13) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v9 = [(UITextFormattingViewController *)self delegate];
  uint64_t v10 = [v9 _disabledComponentsForTextFormattingViewController:self];

  uint64_t v11 = (void *)v10;
  if (v10)
  {
LABEL_9:
    id v14 = v11;
    [(_TFTextFormattingContentViewController *)self->_contentViewController _setDisabledComponents:v11];
    uint64_t v11 = v14;
  }
LABEL_10:
}

- (void)fontPickerViewControllerDidCancel:(id)a3
{
  fontPicker = self->_fontPicker;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__UITextFormattingViewController_fontPickerViewControllerDidCancel___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  [(UIViewController *)fontPicker dismissViewControllerAnimated:1 completion:v6];
  id v5 = self->_fontPicker;
  self->_fontPicker = 0;

  [(UITextFormattingViewController *)self _textFormattingRequestsFirstResponderRestoration];
  [(UITextFormattingViewController *)self _startSuppressingKeyboardForTextFormatting];
}

uint64_t __68__UITextFormattingViewController_fontPickerViewControllerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifyKeyboardTrackingIfNeededForType:2 start:0];
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  char v4 = [a3 selectedFontDescriptor];
  if (v4)
  {
    id v5 = [off_1E52D39B8 fontWithDescriptor:v4 size:self->_selectedFontSize];
    uint64_t v12 = *(void *)off_1E52D2040;
    v13[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v7 = [[UITextFormattingViewControllerChangeValue alloc] initWithFont:v5];
    [(UITextFormattingViewController *)self _textFormattingDidChangeValue:v7 textAttributes:v6];
  }
  dispatch_time_t v8 = dispatch_time(0, 300000000);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__UITextFormattingViewController_fontPickerViewControllerDidPickFont___block_invoke;
  block[3] = &unk_1E52DC308;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __70__UITextFormattingViewController_fontPickerViewControllerDidPickFont___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    int64_t v3 = (void *)WeakRetained[132];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __70__UITextFormattingViewController_fontPickerViewControllerDidPickFont___block_invoke_2;
    v5[3] = &unk_1E52D9F70;
    v5[4] = v2;
    [v3 dismissViewControllerAnimated:1 completion:v5];
    char v4 = (void *)v2[132];
    v2[132] = 0;

    [v2 _textFormattingRequestsFirstResponderRestoration];
    [v2 _startSuppressingKeyboardForTextFormatting];
  }
}

uint64_t __70__UITextFormattingViewController_fontPickerViewControllerDidPickFont___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifyKeyboardTrackingIfNeededForType:2 start:0];
}

- (void)_typographySettingsViewControllerDidUpdateFont:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v8 = *(void *)off_1E52D2040;
    v9[0] = a3;
    char v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v7 = [[UITextFormattingViewControllerChangeValue alloc] initWithFont:v5];

    [(UITextFormattingViewController *)self _textFormattingDidChangeValue:v7 textAttributes:v6];
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v5 = [(UITextFormattingViewController *)self configuration];
  if (([v5 _isTextAnimationsConfiguration] & 1) != 0
    && ([(UIViewController *)self view], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(UIViewController *)self view];
    id v9 = [v8 traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (v10 == 1) {
      return -1;
    }
    else {
      return -2;
    }
  }
  else
  {

    return -2;
  }
}

- (id)_remoteSheet
{
  return 0;
}

- (UITextFormattingViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (UITextFormattingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UITextFormattingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (_UITextFormattingViewControllerInternalDelegate)_internalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  return (_UITextFormattingViewControllerInternalDelegate *)WeakRetained;
}

- (void)_setInternalDelegate:(id)a3
{
}

- (id)_conversionHandler
{
  return self->__conversionHandler;
}

- (UIResponderStandardEditActions)_editResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__editResponder);
  return (UIResponderStandardEditActions *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__editResponder);
  objc_storeStrong(&self->__conversionHandler, 0);
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formattingDescriptor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_hostingImpl, 0);
  objc_storeStrong((id *)&self->_fontPicker, 0);
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_destroyWeak((id *)&self->_preferredFontPickerPresentationViewController);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end