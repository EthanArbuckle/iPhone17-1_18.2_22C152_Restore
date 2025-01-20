@interface PRWidgetIconViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isBackgroundHidden;
- (BOOL)isUserInteractionEnabled;
- (BOOL)isWidgetInteractionDisabled;
- (BOOL)showsSquareCorners;
- (BOOL)useMaterialBackground;
- (BOOL)wantsLabelHidden;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (CGRect)visibleBounds;
- (CHUISWidgetHostViewController)widgetHostViewController;
- (PRComplicationDescriptor)complicationDescriptor;
- (PRWidgetIconViewController)initWithComplicationDescriptor:(id)a3;
- (PRWidgetIconViewController)initWithComplicationDescriptor:(id)a3 contentType:(unint64_t)a4;
- (PRWidgetIconViewController)initWithComplicationDescriptor:(id)a3 contentType:(unint64_t)a4 presentationMode:(unint64_t)a5;
- (PRWidgetIconViewControllerDelegate)delegate;
- (SBIconImageInfo)iconImageInfo;
- (double)continuousCornerRadius;
- (id)_platterVisualStylingProvider;
- (void)_recreateBackgroundView;
- (void)_tapRecognized:(id)a3;
- (void)_updateBackgroundViewAlpha;
- (void)_updatePlatterStylingIfNeeded;
- (void)dealloc;
- (void)invalidate;
- (void)setBackgroundHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)setUseMaterialBackground:(BOOL)a3;
- (void)setVibrancyConfiguration:(id)a3;
- (void)setWidgetInteractionDisabled:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation PRWidgetIconViewController

- (PRWidgetIconViewController)initWithComplicationDescriptor:(id)a3
{
  return [(PRWidgetIconViewController *)self initWithComplicationDescriptor:a3 contentType:0];
}

- (PRWidgetIconViewController)initWithComplicationDescriptor:(id)a3 contentType:(unint64_t)a4
{
  return [(PRWidgetIconViewController *)self initWithComplicationDescriptor:a3 contentType:a4 presentationMode:2];
}

- (PRWidgetIconViewController)initWithComplicationDescriptor:(id)a3 contentType:(unint64_t)a4 presentationMode:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRWidgetIconViewController;
  v10 = [(PRWidgetIconViewController *)&v13 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_complicationDescriptor, a3);
    v11->_contentType = a4;
    v11->_presentationMode = a5;
    v11->_backgroundHidden = 1;
    v11->_useMaterialBackground = 1;
  }

  return v11;
}

- (void)dealloc
{
  [(PRWidgetIconViewController *)self unregisterForTraitChanges:self->_userInterfaceStyleTraitChangeRegistration];
  v3.receiver = self;
  v3.super_class = (Class)PRWidgetIconViewController;
  [(PRWidgetIconViewController *)&v3 dealloc];
}

- (void)invalidate
{
  id v2 = [(PRWidgetIconViewController *)self widgetHostViewController];
  [v2 invalidate];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)PRWidgetIconViewController;
  [(PRWidgetIconViewController *)&v33 viewDidLoad];
  objc_initWeak(&location, self);
  objc_super v3 = self;
  v34[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __41__PRWidgetIconViewController_viewDidLoad__block_invoke;
  v30 = &unk_1E54DC9E8;
  objc_copyWeak(&v31, &location);
  v5 = [(PRWidgetIconViewController *)self registerForTraitChanges:v4 withHandler:&v27];
  userInterfaceStyleTraitChangeRegistration = self->_userInterfaceStyleTraitChangeRegistration;
  self->_userInterfaceStyleTraitChangeRegistration = v5;

  if (self->_backgroundView)
  {
    v7 = [(PRWidgetIconViewController *)self view];
    [v7 addSubview:self->_backgroundView];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F58F58]);
  objc_msgSend(v8, "pr_initWithComplicationDescriptor:", self->_complicationDescriptor);
  id v9 = (CHUISWidgetHostViewController *)objc_claimAutoreleasedReturnValue();
  widgetHostViewController = self->_widgetHostViewController;
  self->_widgetHostViewController = v9;

  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setInteractionDisabled:self->_widgetInteractionDisabled];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setDrawSystemBackgroundMaterialIfNecessary:0];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setVisibility:2];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setContentType:self->_contentType];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setColorScheme:2];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setSupportsLowLuminance:1];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setPrefersUnredactedContentInLowLuminanceEnvironment:1];
  v11 = NSString;
  v12 = [(PRComplicationDescriptor *)self->_complicationDescriptor widget];
  objc_super v13 = [v12 extensionBundleIdentifier];
  v14 = [(PRComplicationDescriptor *)self->_complicationDescriptor widget];
  v15 = [v14 kind];
  v16 = [v11 stringWithFormat:@"%@:%@", v13, v15, v27, v28, v29, v30];

  v17 = [(CHUISWidgetHostViewController *)self->_widgetHostViewController view];
  [v17 setAccessibilityIdentifier:v16];

  v18 = [(CHUISWidgetHostViewController *)self->_widgetHostViewController view];
  [v18 setAccessibilityValue:@"Widget"];

  id v19 = objc_alloc(MEMORY[0x1E4F58EE8]);
  v20 = [MEMORY[0x1E4F4F6E0] blackColor];
  v21 = (void *)[v19 initWithPrimaryTintColor:0 secondaryTintColor:v20 filterStyle:2 fallbackFilterStyle:2 fraction:1.0];

  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setTintParameters:v21];
  v22 = self->_widgetHostViewController;
  v23 = [(PRWidgetIconViewController *)self vibrancyConfiguration];
  [(CHUISWidgetHostViewController *)v22 setVibrancyConfiguration:v23];

  v24 = (void *)[objc_alloc(MEMORY[0x1E4F58EE0]) initWithRenderingMode:1 backgroundViewPolicy:1];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setRenderScheme:v24];
  [(PRWidgetIconViewController *)self bs_addChildViewController:self->_widgetHostViewController];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setCanAppearInSecureEnvironment:1];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setShouldShareTouchesWithHost:1];
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController setPresentationMode:self->_presentationMode];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__tapRecognized_];
  v26 = [(PRWidgetIconViewController *)self view];
  [v26 addGestureRecognizer:v25];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __41__PRWidgetIconViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[123];
    WeakRetained[123] = 0;
    id v3 = WeakRetained;

    [v3 _updatePlatterStylingIfNeeded];
    WeakRetained = v3;
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PRWidgetIconViewController;
  [(PRWidgetIconViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(PRWidgetIconViewController *)self _updatePlatterStylingIfNeeded];
  }
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PRWidgetIconViewController;
  [(PRWidgetIconViewController *)&v11 viewDidLayoutSubviews];
  backgroundView = self->_backgroundView;
  v4 = [(PRWidgetIconViewController *)self view];
  [v4 bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");

  v5 = [(CHUISWidgetHostViewController *)self->_widgetHostViewController metrics];
  [v5 size];
  double v7 = v6;
  double v9 = v8;

  v10 = [(CHUISWidgetHostViewController *)self->_widgetHostViewController view];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v9);
}

- (CHUISWidgetHostViewController)widgetHostViewController
{
  [(PRWidgetIconViewController *)self loadViewIfNeeded];
  widgetHostViewController = self->_widgetHostViewController;
  return widgetHostViewController;
}

- (void)setUseMaterialBackground:(BOOL)a3
{
  if (self->_useMaterialBackground != a3)
  {
    self->_useMaterialBackground = a3;
    [(PRWidgetIconViewController *)self _recreateBackgroundView];
    id v6 = [(PRWidgetIconViewController *)self viewIfLoaded];
    backgroundView = self->_backgroundView;
    v5 = [(CHUISWidgetHostViewController *)self->_widgetHostViewController view];
    [v6 insertSubview:backgroundView belowSubview:v5];
  }
}

- (void)_recreateBackgroundView
{
  [(UIView *)self->_backgroundView removeFromSuperview];
  if (self->_useMaterialBackground)
  {
    id v3 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:101];
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(UIView *)v3 setGroupNameBase:v5];
  }
  else
  {
    id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  }
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  [(UIView *)self->_backgroundView _setContinuousCornerRadius:self->_iconImageInfo.continuousCornerRadius];
  [(PRWidgetIconViewController *)self _updatePlatterStylingIfNeeded];
  [(PRWidgetIconViewController *)self _updateBackgroundViewAlpha];
}

- (id)_platterVisualStylingProvider
{
  platterVisualStylingProvider = self->_platterVisualStylingProvider;
  if (!platterVisualStylingProvider)
  {
    v4 = [(PRWidgetIconViewController *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];
    id v6 = @"widgetGalleryPlatterLight";
    if (v5 == 2) {
      id v6 = @"widgetGalleryPlatterDark";
    }
    double v7 = v6;

    double v8 = (void *)MEMORY[0x1E4F743E8];
    double v9 = PRBundle();
    v10 = [v8 _visualStylingProviderForStyleSetNamed:v7 inBundle:v9];

    objc_super v11 = self->_platterVisualStylingProvider;
    self->_platterVisualStylingProvider = v10;

    platterVisualStylingProvider = self->_platterVisualStylingProvider;
  }
  return platterVisualStylingProvider;
}

- (void)_updatePlatterStylingIfNeeded
{
  if (!self->_useMaterialBackground)
  {
    [(UIView *)self->_backgroundView mt_removeAllVisualStyling];
    backgroundView = self->_backgroundView;
    id v5 = [(PRWidgetIconViewController *)self _platterVisualStylingProvider];
    v4 = [v5 _visualStylingForStyle:0];
    [(UIView *)backgroundView mt_replaceVisualStyling:v4];
  }
}

- (void)setBackgroundHidden:(BOOL)a3
{
  if (self->_backgroundHidden != a3)
  {
    self->_backgroundHidden = a3;
    if (!self->_backgroundView)
    {
      [(PRWidgetIconViewController *)self _recreateBackgroundView];
      v4 = [(PRWidgetIconViewController *)self viewIfLoaded];
      backgroundView = self->_backgroundView;
      id v6 = [(CHUISWidgetHostViewController *)self->_widgetHostViewController view];
      [v4 insertSubview:backgroundView belowSubview:v6];
    }
    [(PRWidgetIconViewController *)self _updateBackgroundViewAlpha];
  }
}

- (BOOL)wantsLabelHidden
{
  return 1;
}

- (void)setWidgetInteractionDisabled:(BOOL)a3
{
  if (self->_widgetInteractionDisabled != a3)
  {
    self->_widgetInteractionDisabled = a3;
    -[CHUISWidgetHostViewController setInteractionDisabled:](self->_widgetHostViewController, "setInteractionDisabled:");
  }
}

- (void)_updateBackgroundViewAlpha
{
  BOOL v3 = [(PRWidgetIconViewController *)self isBackgroundHidden];
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  backgroundView = self->_backgroundView;
  [(UIView *)backgroundView setAlpha:v4];
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  double v7 = (BSUIVibrancyConfiguration *)[v4 copyWithGroupName:v6];

  vibrancyConfiguration = self->_vibrancyConfiguration;
  self->_vibrancyConfiguration = v7;

  id v9 = [(PRWidgetIconViewController *)self widgetHostViewController];
  [v9 setVibrancyConfiguration:self->_vibrancyConfiguration];
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  CGFloat v9 = v4;
  CGFloat v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if ((SBIconImageInfoEqualToIconImageInfo() & 1) == 0)
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    backgroundView = self->_backgroundView;
    [(UIView *)backgroundView _setContinuousCornerRadius:v7];
  }
}

- (void)_tapRecognized:(id)a3
{
  double v4 = [(PRWidgetIconViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PRWidgetIconViewController *)self delegate];
    [v6 widgetIconViewControllerDidReceiveTap:self];
  }
}

- (BOOL)isUserInteractionEnabled
{
  return !self->_widgetInteractionDisabled;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (PRComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (BOOL)useMaterialBackground
{
  return self->_useMaterialBackground;
}

- (BOOL)isBackgroundHidden
{
  return self->_backgroundHidden;
}

- (BOOL)isWidgetInteractionDisabled
{
  return self->_widgetInteractionDisabled;
}

- (PRWidgetIconViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRWidgetIconViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_widgetHostViewController, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_platterVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleTraitChangeRegistration, 0);
}

@end