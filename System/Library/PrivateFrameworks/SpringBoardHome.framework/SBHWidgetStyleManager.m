@interface SBHWidgetStyleManager
- (BOOL)needsGradientBackground;
- (NSString)description;
- (NSString)gridSizeClass;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageStyleConfiguration)imageStyleConfiguration;
- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration;
- (SBHWidgetIconStyleConfiguration)widgetIconStyleConfiguration;
- (SBHWidgetStyleManager)initWithWidgetViewController:(id)a3 widgetDataSource:(id)a4 gridSizeClass:(id)a5 iconImageInfo:(SBIconImageInfo *)a6 delegate:(id)a7;
- (SBHWidgetStyleManagerDelegate)delegate;
- (SBIconImageInfo)iconImageInfo;
- (SBLeafIconDataSource)widgetDataSource;
- (UIView)backgroundView;
- (UIViewController)widgetViewController;
- (id)effectiveWidgetViewController;
- (id)imageAppearance;
- (id)makeBackgroundViewForType:(int64_t)a3 frame:(CGRect)a4;
- (id)succinctDescription;
- (id)widgetHostViewController;
- (int64_t)userInterfaceStyle;
- (void)appendDescriptionToStream:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setOverrideIconImageStyleConfiguration:(id)a3;
- (void)setWidgetIconStyleConfiguration:(id)a3;
- (void)updateConfiguration;
@end

@implementation SBHWidgetStyleManager

- (SBHWidgetStyleManager)initWithWidgetViewController:(id)a3 widgetDataSource:(id)a4 gridSizeClass:(id)a5 iconImageInfo:(SBIconImageInfo *)a6 delegate:(id)a7
{
  double v12 = v10;
  double v13 = v9;
  CGFloat v14 = v8;
  CGFloat v15 = v7;
  v35[2] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  v23 = a6;
  v34.receiver = self;
  v34.super_class = (Class)SBHWidgetStyleManager;
  v24 = [(SBHWidgetStyleManager *)&v34 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_widgetViewController, a3);
    objc_storeStrong((id *)&v25->_widgetDataSource, a4);
    uint64_t v26 = [v22 copy];
    gridSizeClass = v25->_gridSizeClass;
    v25->_gridSizeClass = (NSString *)v26;

    v25->_iconImageInfo.size.width = v15;
    v25->_iconImageInfo.size.height = v14;
    v25->_iconImageInfo.scale = v13;
    v25->_iconImageInfo.continuousCornerRadius = v12;
    objc_storeWeak((id *)&v25->_delegate, v23);
    [(SBHWidgetStyleManager *)v25 updateConfiguration];
    v28 = [(SBHWidgetStyleManager *)v25 widgetHostViewController];
    objc_msgSend(v28, "sbh_addObserver:", v25);
    v29 = self;
    v35[0] = v29;
    v30 = self;
    v35[1] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    id v32 = (id)[v20 registerForTraitChanges:v31 withTarget:v25 action:sel_updateConfiguration];
  }
  return v25;
}

- (int64_t)userInterfaceStyle
{
  v2 = [(SBHWidgetStyleManager *)self widgetViewController];
  v3 = [v2 traitCollection];
  int64_t v4 = [v3 userInterfaceStyle];

  return v4;
}

- (id)imageAppearance
{
  int64_t v3 = [(SBHWidgetStyleManager *)self userInterfaceStyle];
  int64_t v4 = [(SBHWidgetStyleManager *)self imageStyleConfiguration];
  v5 = [v4 widgetAppearanceWithUserInterfaceStyle:v3];

  return v5;
}

- (BOOL)needsGradientBackground
{
  v2 = [(SBHWidgetStyleManager *)self widgetIconStyleConfiguration];
  BOOL v3 = [v2 backgroundType] == 2;

  return v3;
}

- (id)effectiveWidgetViewController
{
  v2 = [(SBHWidgetStyleManager *)self widgetViewController];
  if (objc_msgSend(v2, "sbh_isMultiplexingViewController"))
  {
    uint64_t v3 = [v2 multiplexedViewController];

    v2 = (void *)v3;
  }
  int64_t v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v2 contentViewController];

    v2 = (void *)v6;
  }
  return v2;
}

- (id)widgetHostViewController
{
  v2 = [(SBHWidgetStyleManager *)self effectiveWidgetViewController];
  uint64_t v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (SBHIconImageStyleConfiguration)imageStyleConfiguration
{
  uint64_t v3 = [(SBHWidgetStyleManager *)self overrideIconImageAppearance];
  if (!v3
    || (int64_t v4 = (void *)v3,
        +[SBHIconImageStyleConfiguration styleConfigurationWithIconImageAppearance:v3], id v5 = objc_claimAutoreleasedReturnValue(), v4, !v5))
  {
    id v5 = [(SBHWidgetStyleManager *)self overrideIconImageStyleConfiguration];
    if (!v5)
    {
      uint64_t v6 = [(SBHWidgetStyleManager *)self widgetViewController];
      double v7 = [v6 traitCollection];
      id v5 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageStyleConfigurationFromTraitCollection:", v7);
    }
  }
  return (SBHIconImageStyleConfiguration *)v5;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    int64_t v4 = (SBHIconImageAppearance *)[v6 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    [(SBHWidgetStyleManager *)self updateConfiguration];
  }
}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    int64_t v4 = (SBHIconImageStyleConfiguration *)[v6 copy];
    overrideIconImageStyleConfiguration = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguration = v4;

    [(SBHWidgetStyleManager *)self updateConfiguration];
  }
}

- (void)updateConfiguration
{
  id v41 = [(SBHWidgetStyleManager *)self effectiveWidgetViewController];
  uint64_t v3 = [(SBHWidgetStyleManager *)self widgetHostViewController];
  int64_t v4 = objc_msgSend(v3, "sbh_customDisplayConfiguration");
  id v5 = [(SBHWidgetStyleManager *)self imageStyleConfiguration];
  int64_t v6 = [(SBHWidgetStyleManager *)self userInterfaceStyle];
  if (v4)
  {
    uint64_t v34 = [v4 colorScheme];
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v5 configurationType];
    if ((unint64_t)(v8 - 3) >= 2) {
      uint64_t v9 = v8 == 2;
    }
    else {
      uint64_t v9 = 2;
    }
    uint64_t v34 = v9;
  }
  double v10 = [v5 widgetAppearanceWithUserInterfaceStyle:v7];
  uint64_t v11 = [v10 appearanceType];
  if (v11 == 2)
  {
    id v40 = [v10 tintColor];
  }
  else
  {
    id v40 = 0;
  }
  uint64_t v12 = [(SBHWidgetStyleManager *)self widgetDataSource];
  uint64_t v13 = [(SBHWidgetStyleManager *)self gridSizeClass];
  objc_msgSend(v3, "sbh_widgetExtensionProvider");
  v38 = (void *)v13;
  v37 = v39 = (void *)v12;
  CGFloat v14 = [[SBHWidgetIconStyleConfiguration alloc] initWithWidgetDataSource:v12 gridSizeClass:v13 widgetViewController:v41 widgetExtensionProvider:v37 imageAppearance:v10 customDisplayConfiguration:v4];
  CGFloat v15 = [(SBHWidgetStyleManager *)self widgetIconStyleConfiguration];
  v16 = v10;
  if (![(SBHWidgetIconStyleConfiguration *)v14 isEqualToWidgetIconStyleConfiguration:v15])
  {
    v36 = v5;
    if (v3)
    {
      [v3 setColorScheme:v34];
    }
    else
    {
      v17 = v4;
      v18 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        objc_msgSend(v41, "tintWithHomeScreenTintColor:", objc_msgSend(v40, "CGColor"));
      }
      else {
        [v41 setOverrideUserInterfaceStyle:v7];
      }
      int64_t v4 = v17;
    }
    v33 = [v15 imageAppearance];
    uint64_t v20 = [v33 appearanceType];
    id v21 = [(SBHWidgetStyleManager *)self delegate];
    v35 = [v3 view];
    uint64_t v22 = [(SBHWidgetIconStyleConfiguration *)v14 backgroundType];
    if (v22 != [v15 backgroundType] || v11 != v20)
    {
      v23 = [(SBHWidgetStyleManager *)self backgroundView];
      if (v23 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v21 widgetStyleManager:self needsToRemoveBackgroundView:v23];
      }
      [v35 bounds];
      v24 = -[SBHWidgetStyleManager makeBackgroundViewForType:frame:](self, "makeBackgroundViewForType:frame:", v22);
      if (v24 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v21 widgetStyleManager:self needsToAddBackgroundView:v24];
      }
      [(SBHWidgetStyleManager *)self setBackgroundView:v24];
    }
    v25 = [(SBHWidgetIconStyleConfiguration *)v14 appropriateColorFilter];
    uint64_t v26 = [v15 appropriateColorFilter];
    id v5 = v36;
    if ((BSEqualObjects() & 1) == 0)
    {
      if (v26 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v21 widgetStyleManager:self needsToRemoveFilter:v26];
      }
      if (v25 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v21 widgetStyleManager:self needsToAddFilter:v25];
      }
    }
    if (v3)
    {
      id v32 = v4;
      v27 = [(SBHWidgetIconStyleConfiguration *)v14 appropriateWidgetRenderScheme];
      v28 = v27;
      if (v27) {
        id v29 = v27;
      }
      else {
        id v29 = (id)objc_opt_new();
      }
      v30 = v29;

      v31 = [(SBHWidgetIconStyleConfiguration *)v14 appropriateWidgetTintParameters];
      [v3 setRenderScheme:v30];
      [v3 setTintParameters:v31 fencingAnimations:1];

      int64_t v4 = v32;
      id v5 = v36;
    }
    [(SBHWidgetStyleManager *)self setWidgetIconStyleConfiguration:v14];
    if (objc_opt_respondsToSelector()) {
      [v21 widgetStyleManagerDidUpdateConfiguration:self];
    }
  }
}

- (id)makeBackgroundViewForType:(int64_t)a3 frame:(CGRect)a4
{
  double continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  if (a3 == 1)
  {
    int64_t v6 = [(SBHWidgetStyleManager *)self imageAppearance];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_userInterfaceStyleForIconImageAppearance:", v6);
    uint64_t v8 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v7];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__22;
    id v21 = __Block_byref_object_dispose__22;
    id v22 = 0;
    uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__SBHWidgetStyleManager_makeBackgroundViewForType_frame___block_invoke;
    v12[3] = &unk_1E6AB5010;
    CGFloat v14 = &v17;
    id v10 = v8;
    id v13 = v10;
    double v15 = continuousCornerRadius;
    uint64_t v16 = v7;
    [v9 performWithoutAnimation:v12];
    id v5 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else if (a3 == 2)
  {
    +[SBHWidgetContainerViewController buildGradientBackgroundViewWithFrame:continuousCornerRadius:](SBHWidgetContainerViewController, "buildGradientBackgroundViewWithFrame:continuousCornerRadius:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, continuousCornerRadius);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __57__SBHWidgetStyleManager_makeBackgroundViewForType_frame___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:3 compatibleWithTraitCollection:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setContinuousCornerRadius:*(double *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setGroupNameBase:@"SBIconWidget"];
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) traitOverrides];
  [v5 setUserInterfaceStyle:*(void *)(a1 + 56)];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4F720];
  int64_t v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBHWidgetStyleManager_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AACA90;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

void __51__SBHWidgetStyleManager_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) widgetViewController];
  id v4 = (id)[v2 appendObject:v3 withName:@"widgetViewController"];

  id v5 = *(void **)(a1 + 32);
  int64_t v6 = [*(id *)(a1 + 40) widgetDataSource];
  id v7 = (id)[v5 appendObject:v6 withName:@"widgetDataSource"];

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) gridSizeClass];
  id v10 = (id)[v8 appendObject:v9 withName:@"gridSizeClass"];

  uint64_t v11 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) iconImageInfo];
  uint64_t v16 = SBHStringForIconImageInfo(v12, v13, v14, v15);
  id v17 = (id)[v11 appendObject:v16 withName:@"iconImageInfo"];

  v18 = *(void **)(a1 + 32);
  id v20 = [*(id *)(a1 + 40) imageAppearance];
  id v19 = (id)[v18 appendObject:v20 withName:@"imageAppearance"];
}

- (UIViewController)widgetViewController
{
  return self->_widgetViewController;
}

- (SBLeafIconDataSource)widgetDataSource
{
  return self->_widgetDataSource;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (SBHWidgetStyleManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHWidgetStyleManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (SBHWidgetIconStyleConfiguration)widgetIconStyleConfiguration
{
  return self->_widgetIconStyleConfiguration;
}

- (void)setWidgetIconStyleConfiguration:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_widgetIconStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_widgetDataSource, 0);
  objc_storeStrong((id *)&self->_widgetViewController, 0);
}

@end