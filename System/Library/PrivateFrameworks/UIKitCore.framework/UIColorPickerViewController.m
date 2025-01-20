@interface UIColorPickerViewController
+ (BOOL)_useSceneBackedColorPicker;
- (BOOL)_allowsNoColor;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldUseDarkGridInDarkMode;
- (BOOL)_showsGridOnly;
- (BOOL)_supportsEyedropper;
- (BOOL)supportsAlpha;
- (CGSize)_formSheetSizeForWindowWithSize:(CGSize)a3 screenSize:(CGSize)a4;
- (NSArray)_suggestedColors;
- (UIColor)_selectedColor;
- (UIColor)selectedColor;
- (UIColorPickerViewController)init;
- (UIColorPickerViewController)initWithCoder:(id)a3;
- (UIViewController)_childViewController;
- (_UIColorPickerColorQueue)colorQueue;
- (_UIColorPickerViewControllerConfiguration)_remoteConfiguration;
- (_UIColorPickerViewControllerConfiguration)configuration;
- (id)_defaultColor;
- (id)_remoteSheet;
- (id)delegate;
- (int64_t)_userInterfaceStyleForGrid;
- (void)__setSelectedColor:(id)a3 notifyingViewService:(BOOL)a4;
- (void)_commonUIColorPickerViewControllerInit;
- (void)_dequeue_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5;
- (void)_pickerDidDismissEyedropper;
- (void)_pickerDidFinish;
- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5;
- (void)_pickerDidShowEyedropper;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)_selectDefaultColorIfNecessary;
- (void)_setAllowsNoColor:(BOOL)a3;
- (void)_setChildViewController:(id)a3;
- (void)_setRemoteConfiguration:(id)a3;
- (void)_setSelectedColor:(id)a3;
- (void)_setShouldUseDarkGridInDarkMode:(BOOL)a3;
- (void)_setShowsGridOnly:(BOOL)a3;
- (void)_setSuggestedColors:(id)a3;
- (void)_setSupportsEyedropper:(BOOL)a3;
- (void)_setUserInterfaceStyleForGrid:(int64_t)a3;
- (void)_updateConfiguration;
- (void)_updateConfigurationIfNeeded;
- (void)beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)dismissEyedropper:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setColorQueue:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setSupportsAlpha:(BOOL)supportsAlpha;
- (void)setTitle:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation UIColorPickerViewController

+ (BOOL)_useSceneBackedColorPicker
{
  if (qword_1EB25CB50 != -1) {
    dispatch_once(&qword_1EB25CB50, &__block_literal_global_76);
  }
  return _MergedGlobals_3_4;
}

void __57__UIColorPickerViewController__useSceneBackedColorPicker__block_invoke()
{
  _MergedGlobals_3_4 = 1;
}

- (UIColorPickerViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIColorPickerViewController;
  v5 = [(UIViewController *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"UIColorPickerViewControllerConfiguration"];
    v7 = v6;
    if (!v6) {
      v7 = objc_opt_new();
    }
    objc_storeStrong((id *)&v5->_configuration, v7);
    if (!v6) {

    }
    [(UIColorPickerViewController *)v5 _commonUIColorPickerViewControllerInit];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UIColorPickerViewController *)self configuration];
  [v4 encodeObject:v5 forKey:@"UIColorPickerViewControllerConfiguration"];
}

- (UIColorPickerViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIColorPickerViewController;
  v2 = [(UIViewController *)&v6 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = objc_alloc_init(_UIColorPickerViewControllerConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    [(UIColorPickerViewController *)v2 _commonUIColorPickerViewControllerInit];
  }
  return v2;
}

- (void)_commonUIColorPickerViewControllerInit
{
  v3 = objc_alloc_init(_UIColorPickerColorQueue);
  colorQueue = self->_colorQueue;
  self->_colorQueue = v3;

  [(_UIColorPickerColorQueue *)self->_colorQueue setDelegate:self];
  if ([(id)objc_opt_class() _useSceneBackedColorPicker]) {
    id v5 = _UIColorPickerSceneHostingImpl;
  }
  else {
    id v5 = _UIColorPickerRVCHostingImpl;
  }
  objc_super v6 = (_UIColorPickerViewHostingImpl *)objc_alloc_init(v5);
  hostingImpl = self->_hostingImpl;
  self->_hostingImpl = v6;

  [(_UIColorPickerViewHostingImpl *)self->_hostingImpl setDelegateColorPickerViewController:self];
  v8 = self->_hostingImpl;
  [(_UIColorPickerViewHostingImpl *)v8 setupRemoteHosting];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIColorPickerViewController;
  [(UIViewController *)&v4 viewWillAppear:a3];
  [(UIColorPickerViewController *)self _selectDefaultColorIfNecessary];
}

- (id)_defaultColor
{
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 _nativeScreenGamut];

  if (v3) {
    +[UIColor colorWithDisplayP3Red:0.0 green:0.0 blue:0.0 alpha:1.0];
  }
  else {
  objc_super v4 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  }
  return v4;
}

- (void)setDelegate:(id)delegate
{
  p_delegate = &self->_delegate;
  id v5 = delegate;
  objc_storeWeak((id *)p_delegate, v5);
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v6;
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
  char v7 = objc_opt_respondsToSelector();

  if (v7) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v8;
  if ((unint64_t)_UIApplicationPackedMinimumDeploymentVersion() >= 0xF0000
    && (~*(unsigned char *)&self->_flags & 3) == 0)
  {
    objc_super v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIColorPicker", &setDelegate____s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "UIColorPickerViewControllerDelegate implements colorPickerViewControllerDidSelectColor: and colorPickerViewController:didSelectColor:continuously:, only colorPickerViewController:didSelectColor:continuous: will be called.", v10, 2u);
    }
  }
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)UIColorPickerViewController;
  [(UIViewController *)&v5 loadView];
  uint64_t v3 = [(UIViewController *)self view];
  [v3 setBackgroundColor:0];

  objc_super v4 = [(UIViewController *)self view];
  [v4 setAccessibilityIdentifier:@"UIColorPicker"];
}

- (void)didMoveToParentViewController:(id)a3
{
  if (!a3)
  {
    objc_super v5 = [(UIColorPickerViewController *)self configuration];
    objc_msgSend(v5, "set_isEmbedded:", 0);

    [(UIColorPickerViewController *)self _updateConfiguration];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(UIColorPickerViewController *)self configuration];
    objc_msgSend(v4, "set_isEmbedded:", 1);

    [(UIColorPickerViewController *)self _updateConfiguration];
  }
}

- (void)_updateConfiguration
{
  uint64_t v3 = [(UIViewController *)self view];
  [v3 frame];
  double Width = CGRectGetWidth(v29);

  id v27 = [(UIViewController *)self activePresentationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    [v27 _currentPresentedViewFrame];
    double Width = CGRectGetWidth(v30);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v27;
      uint64_t v7 = 1;
      [v6 _setIgnoresKeyboardNotifications:1];
      [v6 _proposedSize];
      double Width = v8;

      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  if (Width > 0.0)
  {
    objc_super v9 = [(UIColorPickerViewController *)self configuration];
    int v10 = [v9 _isEmbedded];

    v11 = [(UIViewController *)self _window];
    v12 = v11;
    if (v11)
    {
      [v11 frame];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
    }
    else
    {
      v21 = [(UIViewController *)self view];
      [v21 frame];
      CGFloat v14 = v22;
      CGFloat v16 = v23;
      CGFloat v18 = v24;
      CGFloat v20 = v25;
    }
    BOOL v26 = ((v7 | v10) & 1) == 0
       && (v31.origin.x = v14,
           v31.origin.y = v16,
           v31.size.width = v18,
           v31.size.height = v20,
           CGRectGetHeight(v31) < Width)
       && Width >= 550.0;
    [(_UIColorPickerViewControllerConfiguration *)self->_configuration set_preferredWidth:Width];
    [(_UIColorPickerViewControllerConfiguration *)self->_configuration set_isInPopoverPresentation:v7];
    [(_UIColorPickerViewControllerConfiguration *)self->_configuration set_useLandscapeLayout:v26];
    [(_UIColorPickerViewControllerConfiguration *)self->_configuration set_isInSheetPresentation:isKindOfClass & 1];
    [(UIColorPickerViewController *)self _setRemoteConfiguration:self->_configuration];
    [(_UIColorPickerViewHostingImpl *)self->_hostingImpl setRemoteConfiguration:self->_configuration];
  }
}

- (void)_updateConfigurationIfNeeded
{
  if (self)
  {
    if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1) {
      [(UIColorPickerViewController *)self _updateConfiguration];
    }
  }
}

- (void)beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIColorPickerViewController;
  [(UIViewController *)&v6 beginAppearanceTransition:a3 animated:a4];
  if (v4) {
    [(UIColorPickerViewController *)self _updateConfiguration];
  }
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    [v6 setPrefersEdgeAttachedInCompactHeight:1];
    [v6 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__UIColorPickerViewController__presentationController_prepareAdaptivePresentationController___block_invoke;
    v9[3] = &unk_1E52DF960;
    v9[4] = self;
    uint64_t v7 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:0 resolver:v9];
    v10[0] = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v6 setDetents:v8];
  }
}

double __93__UIColorPickerViewController__presentationController_prepareAdaptivePresentationController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredContentSize];
  return v1;
}

- (CGSize)_formSheetSizeForWindowWithSize:(CGSize)a3 screenSize:(CGSize)a4
{
  +[UIViewController defaultFormSheetSizeForScreenSize:](UIViewController, "defaultFormSheetSizeForScreenSize:", a4.width, a4.height);
  double v6 = fmax(v5, 550.0);
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIColorPickerViewController;
  [(UIViewController *)&v3 viewWillLayoutSubviews];
  [(UIColorPickerViewController *)self _updateConfiguration];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  [a3 preferredContentSize];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_setChildViewController:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  double v5 = (UIViewController *)a3;
  p_childViewController = &self->_childViewController;
  childViewController = self->_childViewController;
  if (childViewController != v5)
  {
    [(UIViewController *)childViewController willMoveToParentViewController:0];
    double v8 = [(UIViewController *)*p_childViewController view];
    [v8 removeFromSuperview];

    [(UIViewController *)*p_childViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_childViewController, a3);
    if (*p_childViewController)
    {
      objc_super v9 = [(UIViewController *)self view];
      int v10 = [(UIViewController *)*p_childViewController view];
      [(UIViewController *)self addChildViewController:*p_childViewController];
      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v9 addSubview:v10];
      v21 = (void *)MEMORY[0x1E4F5B268];
      BOOL v26 = [v10 topAnchor];
      double v25 = [v9 topAnchor];
      double v24 = [v26 constraintEqualToAnchor:v25];
      v27[0] = v24;
      double v23 = [v10 leadingAnchor];
      double v22 = [v9 leadingAnchor];
      CGFloat v20 = [v23 constraintEqualToAnchor:v22];
      v27[1] = v20;
      CGFloat v18 = [v10 trailingAnchor];
      v11 = [v9 trailingAnchor];
      v12 = [v18 constraintEqualToAnchor:v11];
      v27[2] = v12;
      double v13 = [v10 bottomAnchor];
      CGFloat v14 = [v9 bottomAnchor];
      [v13 constraintEqualToAnchor:v14];
      double v19 = self;
      v16 = double v15 = v5;
      v27[3] = v16;
      double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
      [v21 activateConstraints:v17];

      double v5 = v15;
      [(UIViewController *)*p_childViewController didMoveToParentViewController:v19];
    }
  }
}

- (void)_selectDefaultColorIfNecessary
{
  if (!self->_selectedColor && ![(UIColorPickerViewController *)self _allowsNoColor])
  {
    id v3 = [(UIColorPickerViewController *)self _defaultColor];
    [(UIColorPickerViewController *)self setSelectedColor:v3];
  }
}

- (UIColor)selectedColor
{
  selectedColor = self->_selectedColor;
  if (selectedColor)
  {
    id v3 = selectedColor;
  }
  else
  {
    id v3 = [(UIColorPickerViewController *)self _defaultColor];
  }
  return v3;
}

- (void)_setSelectedColor:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(UIColorPickerViewController *)self _allowsNoColor];
  double v5 = v6;
  if (v6 || v4)
  {
    [(UIColorPickerViewController *)self __setSelectedColor:v6 notifyingViewService:1];
    double v5 = v6;
  }
}

- (void)__setSelectedColor:(id)a3 notifyingViewService:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (UIColor *)a3;
  p_selectedColor = &self->_selectedColor;
  if (self->_selectedColor != v7)
  {
    int v10 = v7;
    if (v7)
    {
      [(UIColorPickerViewController *)self willChangeValueForKey:@"selectedColor"];
      [(UIColorPickerViewController *)self willChangeValueForKey:@"_selectedColor"];
      objc_storeStrong((id *)&self->_selectedColor, a3);
      [(UIColorPickerViewController *)self didChangeValueForKey:@"selectedColor"];
    }
    else
    {
      [(UIColorPickerViewController *)self willChangeValueForKey:@"_selectedColor"];
      objc_super v9 = *p_selectedColor;
      *p_selectedColor = 0;
    }
    [(UIColorPickerViewController *)self didChangeValueForKey:@"_selectedColor"];
    uint64_t v7 = v10;
    if (v4)
    {
      [(_UIColorPickerViewHostingImpl *)self->_hostingImpl setRemoteSelectedColor:v10];
      uint64_t v7 = v10;
    }
  }
}

- (void)dismissEyedropper:(BOOL)a3
{
  if (a3) {
    char v3 = 0;
  }
  else {
    char v3 = 8;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
  -[_UIColorPickerViewHostingImpl dismissEyedropper:](self->_hostingImpl, "dismissEyedropper:");
}

- (void)setSupportsAlpha:(BOOL)supportsAlpha
{
  BOOL v3 = supportsAlpha;
  double v5 = [(UIColorPickerViewController *)self configuration];
  [v5 setShowsAlpha:v3];

  [(UIColorPickerViewController *)self _updateConfigurationIfNeeded];
}

- (BOOL)supportsAlpha
{
  v2 = [(UIColorPickerViewController *)self configuration];
  char v3 = [v2 showsAlpha];

  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  double v5 = [(UIColorPickerViewController *)self configuration];
  [v5 setTitle:v4];

  v6.receiver = self;
  v6.super_class = (Class)UIColorPickerViewController;
  [(UIViewController *)&v6 setTitle:v4];

  [(UIColorPickerViewController *)self _updateConfigurationIfNeeded];
}

- (void)_setShouldUseDarkGridInDarkMode:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIColorPickerViewController *)self configuration];
  objc_msgSend(v5, "set_shouldUseDarkGridInDarkMode:", v3);

  [(UIColorPickerViewController *)self _updateConfigurationIfNeeded];
}

- (BOOL)_shouldUseDarkGridInDarkMode
{
  v2 = [(UIColorPickerViewController *)self configuration];
  char v3 = [v2 _shouldUseDarkGridInDarkMode];

  return v3;
}

- (void)_setUserInterfaceStyleForGrid:(int64_t)a3
{
  double v5 = [(UIColorPickerViewController *)self configuration];
  objc_msgSend(v5, "set_userInterfaceStyleForGrid:", a3);

  [(UIColorPickerViewController *)self _updateConfigurationIfNeeded];
}

- (int64_t)_userInterfaceStyleForGrid
{
  v2 = [(UIColorPickerViewController *)self configuration];
  int64_t v3 = [v2 _userInterfaceStyleForGrid];

  return v3;
}

- (void)_setSuggestedColors:(id)a3
{
  id v4 = a3;
  double v5 = [(UIColorPickerViewController *)self configuration];
  objc_msgSend(v5, "set_suggestedColors:", v4);

  [(UIColorPickerViewController *)self _updateConfigurationIfNeeded];
}

- (NSArray)_suggestedColors
{
  v2 = [(UIColorPickerViewController *)self configuration];
  int64_t v3 = [v2 _suggestedColors];

  return (NSArray *)v3;
}

- (void)_setAllowsNoColor:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIColorPickerViewController *)self configuration];
  objc_msgSend(v5, "set_allowsNoColor:", v3);

  [(UIColorPickerViewController *)self _updateConfigurationIfNeeded];
}

- (BOOL)_allowsNoColor
{
  v2 = [(UIColorPickerViewController *)self configuration];
  char v3 = [v2 _allowsNoColor];

  return v3;
}

- (BOOL)_supportsEyedropper
{
  v2 = [(UIColorPickerViewController *)self configuration];
  char v3 = [v2 _showsEyedropper];

  return v3;
}

- (void)_setSupportsEyedropper:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIColorPickerViewController *)self configuration];
  objc_msgSend(v5, "set_showsEyedropper:", v3);

  [(UIColorPickerViewController *)self _updateConfigurationIfNeeded];
}

- (BOOL)_showsGridOnly
{
  v2 = [(UIColorPickerViewController *)self configuration];
  char v3 = [v2 _showsGridOnly];

  return v3;
}

- (void)_setShowsGridOnly:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIColorPickerViewController *)self configuration];
  objc_msgSend(v5, "set_showsGridOnly:", v3);

  [(UIColorPickerViewController *)self _updateConfigurationIfNeeded];
}

- (id)_remoteSheet
{
  return (id)[(_UIColorPickerViewHostingImpl *)self->_hostingImpl _remoteSheet];
}

- (void)_dequeue_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v14 = v10;
  if (v9)
  {
    UISCreateCachedColorTransform();
    id v11 = v10;
    [v11 CGColor];
    uint64_t v12 = CGColorTransformConvertColor();
    CGColorTransformRelease();
    id v10 = +[UIColor colorWithCGColor:v12];
  }
  kdebug_trace();
  [(UIColorPickerViewController *)self __setSelectedColor:v10 notifyingViewService:0];
  if (v10)
  {
    if (*(unsigned char *)&self->_flags)
    {
      WeakRetained = [(UIColorPickerViewController *)self delegate];
      [WeakRetained colorPickerViewController:self didSelectColor:v10 continuously:v5];
    }
    else
    {
      if ((*(unsigned char *)&self->_flags & 2) == 0) {
        goto LABEL_11;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained colorPickerViewControllerDidSelectColor:self];
    }
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_11;
    }
    WeakRetained = [(UIColorPickerViewController *)self delegate];
    [WeakRetained _colorPickerViewControllerDidDeselectColor:self];
  }

LABEL_11:
  kdebug_trace();
}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
}

- (void)_pickerDidShowEyedropper
{
  id obj = [(UIViewController *)self _existingPresentationControllerImmediate:0 effective:1 includesRoot:1];
  BOOL v3 = [obj presentedView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  uint64_t v12 = [(UIViewController *)self view];
  [v12 bounds];
  v24.origin.x = v13;
  v24.origin.y = v14;
  v24.size.width = v15;
  v24.size.height = v16;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  BOOL v17 = CGRectEqualToRect(v23, v24);

  if (v17)
  {
    if (obj)
    {
      objc_storeStrong((id *)&self->_presentationController, obj);
      [(UIViewController *)self dismissViewControllerAnimated:1 completion:0];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id obj = 0;
LABEL_6:
  CGFloat v18 = [(UIColorPickerViewController *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    CGFloat v20 = [(UIColorPickerViewController *)self delegate];
    [v20 _colorPickerViewControllerDidShowEyedropper:self];
  }
}

- (void)_pickerDidDismissEyedropper
{
  presentationController = self->_presentationController;
  if (presentationController)
  {
    double v4 = [(UIViewController *)self activePresentationController];
    CGFloat v5 = v4;
    if ((*(unsigned char *)&self->_flags & 8) == 0
      && (!v4 || ([v4 dismissing] & 1) != 0 || objc_msgSend(v5, "dismissed")))
    {
      double v6 = [(UIPresentationController *)self->_presentationController presentedViewController];
      [v6 _setTemporaryPresentationController:self->_presentationController];

      CGFloat v7 = [(UIPresentationController *)self->_presentationController presentingViewController];
      double v8 = [(UIPresentationController *)self->_presentationController presentedViewController];
      [v7 presentViewController:v8 animated:1 completion:0];
    }
    CGFloat v9 = [(UIColorPickerViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      CGFloat v11 = [(UIColorPickerViewController *)self delegate];
      [v11 _colorPickerViewControllerDidHideEyedropper:self];
    }
    presentationController = self->_presentationController;
  }
  self->_presentationController = 0;

  *(unsigned char *)&self->_flags &= ~8u;
}

- (void)_pickerDidFinish
{
  if (![(_UIColorPickerViewControllerConfiguration *)self->_configuration _isEmbedded])
  {
    BOOL v3 = [(UIViewController *)self presentingViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
  double v4 = [(UIColorPickerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIColorPickerViewController *)self delegate];
    [v6 colorPickerViewControllerDidFinish:self];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (_UIColorPickerViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (UIColor)_selectedColor
{
  return self->_selectedColor;
}

- (UIViewController)_childViewController
{
  return self->_childViewController;
}

- (_UIColorPickerColorQueue)colorQueue
{
  return self->_colorQueue;
}

- (void)setColorQueue:(id)a3
{
}

- (_UIColorPickerViewControllerConfiguration)_remoteConfiguration
{
  return self->__remoteConfiguration;
}

- (void)_setRemoteConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remoteConfiguration, 0);
  objc_storeStrong((id *)&self->_colorQueue, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostingImpl, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
}

@end