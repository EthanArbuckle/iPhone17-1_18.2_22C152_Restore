@interface NCNotificationListSupplementaryHostingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_useDefaultLookForColor:(id)a3 materialRecipe:(int64_t)a4 containsUnmanagedContent:(BOOL)a5;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isContentVisible;
- (BOOL)isHostedViewControllerUserInteractionEnabled;
- (CGSize)preferredContentSize;
- (NCNotificationListSupplementaryHostingViewController)initWithHostedViewController:(id)a3 sectionIdentifier:(id)a4;
- (NCNotificationListSupplementaryHostingViewControllerDelegate)delegate;
- (NCNotificationListSupplementaryViewConfiguration)configuration;
- (NSString)debugDescription;
- (NSString)materialGroupNameBase;
- (NSString)sectionIdentifier;
- (PLPlatterView)platterView;
- (UIColor)materialTintColor;
- (UIColor)textColor;
- (UIViewController)hostedViewController;
- (id)_defaultTextColor;
- (id)_logDescription;
- (id)_sanitizedColorFromDeveloperProvidedColor:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)materialRecipe;
- (int64_t)overrideUserInterfaceStyle;
- (void)_configureAuxiliaryViewAnimated:(BOOL)a3;
- (void)_configureHostingViewAnimated:(BOOL)a3;
- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3;
- (void)_showAuxiliaryOptionsView:(BOOL)a3;
- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3;
- (void)loadView;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 animated:(BOOL)a4;
- (void)setContentVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHostedViewControllerUserInteractionEnabled:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setMaterialRecipe:(int64_t)a3;
- (void)setMaterialTintColor:(id)a3;
- (void)supplementaryHostingViewWasTapped:(id)a3;
@end

@implementation NCNotificationListSupplementaryHostingViewController

- (NCNotificationListSupplementaryHostingViewController)initWithHostedViewController:(id)a3 sectionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationListSupplementaryHostingViewController;
  v9 = [(NCNotificationListSupplementaryHostingViewController *)&v13 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    materialGroupNameBase = v9->_materialGroupNameBase;
    v9->_materialGroupNameBase = 0;

    objc_storeStrong((id *)&v10->_hostedViewController, a3);
    [(NCNotificationListSupplementaryHostingViewController *)v10 addChildViewController:v10->_hostedViewController];
    [(UIViewController *)v10->_hostedViewController didMoveToParentViewController:v10];
    objc_storeStrong((id *)&v10->_sectionIdentifier, a4);
  }

  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationListSupplementaryHostingViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(NCNotificationListSupplementaryHostingViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__NCNotificationListSupplementaryHostingViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6A91A68;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __94__NCNotificationListSupplementaryHostingViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) configuration];
  id v4 = (id)[v2 appendObject:v3 withName:@"configuration" skipIfNil:1];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) hostedViewController];
  id v6 = (id)[v5 appendObject:v7 withName:@"hostedViewController"];
}

- (id)succinctDescription
{
  v2 = [(NCNotificationListSupplementaryHostingViewController *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NCNotificationListSupplementaryHostingViewController *)self configuration];
  id v5 = (id)[v3 appendObject:v4 withName:@"configuration" skipIfNil:1];

  id v6 = [(NCNotificationListSupplementaryHostingViewController *)self hostedViewController];
  id v7 = (id)[v3 appendObject:v6 withName:@"hostedViewController"];

  return v3;
}

- (void)setHostedViewControllerUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  [v4 setHostedViewUserInteractionEnabled:v3];
}

- (BOOL)isHostedViewControllerUserInteractionEnabled
{
  v2 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  char v3 = [v2 isHostedViewUserInteractionEnabled];

  return v3;
}

- (void)setConfiguration:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (NCNotificationListSupplementaryViewConfiguration *)[v6 copy];
  configuration = self->_configuration;
  self->_configuration = v7;

  v9 = [v6 tintColor];
  if (-[NCNotificationListSupplementaryHostingViewController _useDefaultLookForColor:materialRecipe:containsUnmanagedContent:](self, "_useDefaultLookForColor:materialRecipe:containsUnmanagedContent:", v9, [v6 materialRecipe], objc_msgSend(v6, "containsUnmanagedContent")))
  {
    materialTintColor = self->_materialTintColor;
    self->_materialTintColor = 0;

    id v11 = [(NCNotificationListSupplementaryHostingViewController *)self _defaultTextColor];
    textColor = self->_textColor;
    self->_textColor = v11;

    self->_materialRecipe = 1;
    objc_super v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    auxiliaryOptionsBackgroundColor = self->_auxiliaryOptionsBackgroundColor;
    self->_auxiliaryOptionsBackgroundColor = v13;

    objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, (id)*MEMORY[0x1E4F3A2E0]);
    goto LABEL_19;
  }
  self->_materialRecipe = [(NCNotificationListSupplementaryViewConfiguration *)self->_configuration materialRecipe];
  objc_storeStrong((id *)&self->_materialTintColor, v9);
  double v32 = 0.0;
  double v33 = 0.0;
  v15 = self->_materialTintColor;
  if (!v15)
  {
    double v33 = 0.0;
LABEL_8:
    v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    v17 = self->_auxiliaryOptionsBackgroundColor;
    self->_auxiliaryOptionsBackgroundColor = v19;
    v18 = (id *)MEMORY[0x1E4F3A2E0];
    goto LABEL_9;
  }
  [(UIColor *)v15 getWhite:&v33 alpha:&v32];
  if (v33 > 0.2 || v32 > 0.4) {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 1.0);
  v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
  v17 = self->_auxiliaryOptionsBackgroundColor;
  self->_auxiliaryOptionsBackgroundColor = v16;
  v18 = (id *)MEMORY[0x1E4F3A2E8];
LABEL_9:

  v20 = (NSString *)*v18;
  auxiliaryOptionsBackgroundCompositingFilter = self->_auxiliaryOptionsBackgroundCompositingFilter;
  self->_auxiliaryOptionsBackgroundCompositingFilter = v20;

  v22 = [v6 textColor];
  v23 = [(NCNotificationListSupplementaryHostingViewController *)self _sanitizedColorFromDeveloperProvidedColor:v22];
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    v25 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v26 = v25;

  uint64_t v30 = 0;
  double v31 = 0.0;
  [(UIColor *)v26 getWhite:&v31 alpha:&v30];
  if (vabdd_f64(v31, v33) < 0.25 && v32 > 0.5)
  {
    if (v33 < 0.5) {
      objc_msgSend(MEMORY[0x1E4FB1618], "whiteColor", v33, 0.5, v32);
    }
    else {
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4FB1618], "blackColor", v33, 0.5, v32);
    }

    v26 = (UIColor *)v27;
  }
  v28 = self->_textColor;
  self->_textColor = v26;

LABEL_19:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained supplementaryHostingViewControllerPreferredContentSizeChanged:self];
  }
  [(NCNotificationListSupplementaryHostingViewController *)self _configureHostingViewAnimated:v4];
}

- (PLPlatterView)platterView
{
  v2 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  char v3 = [v2 platterView];

  return (PLPlatterView *)v3;
}

- (void)setContentVisible:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_contentVisible != a3)
  {
    BOOL v3 = a3;
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [(NCNotificationListSupplementaryHostingViewController *)self _logDescription];
      id v8 = NSStringFromBOOL();
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      objc_super v13 = v8;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting content visible %{public}@", (uint8_t *)&v10, 0x16u);
    }
    self->_contentVisible = v3;
    v9 = self->_hostedViewController;
    if (objc_opt_respondsToSelector()) {
      [(UIViewController *)v9 notificationListSupplementaryViewPresentableContentWillBecomeVisible:v3];
    }
  }
}

- (CGSize)preferredContentSize
{
  [(UIViewController *)self->_hostedViewController preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v5 supplementaryHostingViewControllerPreferredContentSizeChanged:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (int64_t)overrideUserInterfaceStyle
{
  return [(UIViewController *)self->_hostedViewController overrideUserInterfaceStyle];
}

- (void)loadView
{
  BOOL v4 = objc_alloc_init(NCNotificationListSupplementaryHostingView);
  [(NCNotificationListSupplementaryHostingViewController *)self setView:v4];
  [(NCNotificationListSupplementaryHostingView *)v4 setDelegate:self];
  double v3 = [(UIViewController *)self->_hostedViewController view];
  [(NCNotificationListSupplementaryHostingView *)v4 setHostedView:v3];

  [(NCNotificationListSupplementaryHostingViewController *)self _configureHostingViewAnimated:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)supplementaryHostingViewWasTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v5 supplementaryHostingViewControllerWasTapped:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)adjustsFontForContentSizeCategory
{
  double v2 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  char v3 = [v2 adjustsFontForContentSizeCategory];

  return v3;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  [v4 setAdjustsFontForContentSizeCategory:v3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  double v2 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  [v2 adjustForContentSizeCategoryChange];

  return 1;
}

- (void)setMaterialRecipe:(int64_t)a3
{
  self->_materialRecipe = a3;
  id v4 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  [v4 setMaterialRecipe:self->_materialRecipe];
}

- (void)setMaterialTintColor:(id)a3
{
  p_materialTintColor = &self->_materialTintColor;
  objc_storeStrong((id *)&self->_materialTintColor, a3);
  id v6 = a3;
  id v7 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  [v7 setMaterialTintColor:*p_materialTintColor];
}

- (void)setMaterialGroupNameBase:(id)a3
{
  p_materialGroupNameBase = &self->_materialGroupNameBase;
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  id v6 = a3;
  id v7 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  [v7 setMaterialGroupNameBase:*p_materialGroupNameBase];
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  id v4 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  long long v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  [v4 configureStackDimmingForTransform:v6];
}

- (void)_configureHostingViewAnimated:(BOOL)a3
{
  if (self->_configuration)
  {
    BOOL v3 = a3;
    id v5 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
    [v5 setMaterialRecipe:self->_materialRecipe];
    [v5 setMaterialTintColor:self->_materialTintColor];
    [v5 setMaterialGroupNameBase:self->_materialGroupNameBase];
    objc_msgSend(v5, "setClipsToBounds:", -[NCNotificationListSupplementaryViewConfiguration containsUnmanagedContent](self->_configuration, "containsUnmanagedContent"));
    [(NCNotificationListSupplementaryHostingViewController *)self _configureAuxiliaryViewAnimated:v3];
  }
}

- (void)_configureAuxiliaryViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  id v6 = [(NCNotificationListSupplementaryViewConfiguration *)self->_configuration auxiliaryOptionActions];
  LODWORD(v7) = v6 != 0;

  id v8 = [v5 auxiliaryOptionActions];
  BOOL v9 = v8 == 0;

  int v10 = v7 ^ v9;
  id v11 = [(NCNotificationListSupplementaryViewConfiguration *)self->_configuration auxiliaryOptionActions];
  __int16 v12 = [v5 auxiliaryOptionActions];
  v21 = v5;
  if (BSEqualArrays())
  {
  }
  else
  {
    uint64_t v7 = [(NCNotificationListSupplementaryViewConfiguration *)self->_configuration auxiliaryOptionsSummaryText];
    [v5 auxiliaryOptionsSummaryText];
    v14 = BOOL v13 = v3;
    int v15 = BSEqualStrings();

    BOOL v3 = v13;
    LOBYTE(v7) = v6 != 0;

    if (v10) {
      BOOL v16 = v15 == 0;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16) {
      goto LABEL_11;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained supplementaryHostingViewControllerPreferredContentSizeChanged:self];
  }

LABEL_11:
  if ((!v3 | v10))
  {
    [(NCNotificationListSupplementaryHostingViewController *)self _showAuxiliaryOptionsView:v6 != 0];
    v18 = v21;
  }
  else
  {
    BOOL v19 = [(NCNotificationListSupplementaryViewConfiguration *)self->_configuration containsUnmanagedContent];
    v18 = v21;
    [v21 setClipsToBounds:1];
    if (v6) {
      [(NCNotificationListSupplementaryHostingViewController *)self _showAuxiliaryOptionsView:1];
    }
    v20 = (void *)MEMORY[0x1E4FB1EB0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88__NCNotificationListSupplementaryHostingViewController__configureAuxiliaryViewAnimated___block_invoke;
    v26[3] = &unk_1E6A946B0;
    id v27 = v21;
    char v28 = v7;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__NCNotificationListSupplementaryHostingViewController__configureAuxiliaryViewAnimated___block_invoke_2;
    v22[3] = &unk_1E6A94EB0;
    char v24 = v7;
    v22[4] = self;
    id v23 = v27;
    BOOL v25 = v19;
    [v20 animateWithDuration:v26 animations:v22 completion:0.25];
  }
}

uint64_t __88__NCNotificationListSupplementaryHostingViewController__configureAuxiliaryViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAuxiliaryOptionsVisible:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __88__NCNotificationListSupplementaryHostingViewController__configureAuxiliaryViewAnimated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (!*(unsigned char *)(result + 48))
    {
      [*(id *)(result + 32) _showAuxiliaryOptionsView:0];
      BOOL v3 = *(void **)(v2 + 40);
      uint64_t v4 = *(unsigned __int8 *)(v2 + 49);
      return [v3 setClipsToBounds:v4];
    }
  }
  return result;
}

- (void)_showAuxiliaryOptionsView:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(NCNotificationListSupplementaryHostingViewController *)self _hostingView];
  id v5 = [(NCNotificationListSupplementaryViewConfiguration *)self->_configuration auxiliaryOptionActions];
  [v7 setAuxiliaryOptionActions:v5];

  id v6 = [(NCNotificationListSupplementaryViewConfiguration *)self->_configuration auxiliaryOptionsSummaryText];
  [v7 setAuxiliaryOptionsSummaryText:v6];

  [v7 setAuxiliaryOptionsVisible:v3];
  [v7 setAuxiliaryOptionsTextColor:self->_textColor];
  [v7 setMaterialTintColor:self->_materialTintColor];
  [v7 setAuxiliaryOptionsBackgroundColor:self->_auxiliaryOptionsBackgroundColor];
  [v7 setAuxiliaryOptionsBackgroundCompositingFilter:self->_auxiliaryOptionsBackgroundCompositingFilter];
  [v7 setMaterialRecipe:self->_materialRecipe];
  [v7 setMaterialGroupNameBase:self->_materialGroupNameBase];
}

- (BOOL)_useDefaultLookForColor:(id)a3 materialRecipe:(int64_t)a4 containsUnmanagedContent:(BOOL)a5
{
  if (!a5) {
    return 0;
  }
  id v6 = (void *)MEMORY[0x1E4FB1618];
  id v7 = a3;
  id v8 = [v6 systemBackgroundColor];
  char v9 = [v7 isEqual:v8];

  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = (unint64_t)a4 >= 2;
  }
  char v11 = !v10;
  if (v9) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11;
  }

  return v12;
}

- (id)_sanitizedColorFromDeveloperProvidedColor:(id)a3
{
  uint64_t v4 = a3;
  if (a3)
  {
    var8[0] = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    [a3 getRed:var8 green:&v7 blue:&v6 alpha:0];
    uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:var8[0] green:v7 blue:v6 alpha:1.0];
    double v3 = var8[2];
  }
  return v4;
}

- (id)_logDescription
{
  double v3 = [(NCNotificationListSupplementaryHostingViewController *)self configuration];
  uint64_t v4 = [v3 groupingIdentifier];
  id v5 = (void *)v4;
  double v6 = @"<Group w/ No ID>";
  if (v4) {
    double v6 = (__CFString *)v4;
  }
  double v7 = v6;

  id v8 = NSString;
  char v9 = (objc_class *)objc_opt_class();
  BOOL v10 = NSStringFromClass(v9);
  char v11 = [v8 stringWithFormat:@"%@ (addr:%p) [%@: %@]", v10, self, self->_sectionIdentifier, v7];

  return v11;
}

- (id)_defaultTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (UIViewController)hostedViewController
{
  return self->_hostedViewController;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (UIColor)materialTintColor
{
  return self->_materialTintColor;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NCNotificationListSupplementaryViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NCNotificationListSupplementaryHostingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListSupplementaryHostingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)isContentVisible
{
  return self->_contentVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_materialTintColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundColor, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);

  objc_storeStrong((id *)&self->_hostedViewController, 0);
}

@end