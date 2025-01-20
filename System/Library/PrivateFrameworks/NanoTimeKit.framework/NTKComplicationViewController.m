@interface NTKComplicationViewController
- (BOOL)forceLivePresentationState;
- (BOOL)touchedDown;
- (CGAffineTransform)_contentTransform;
- (CLKComplicationBackgroundDescriptor)backgroundDescriptor;
- (CLKDevice)device;
- (NTKComplication)complication;
- (NTKComplicationControllerDisplayProperties)displayProperties;
- (NTKComplicationStyle)style;
- (NTKComplicationVariant)variant;
- (NTKComplicationViewController)initWithVariant:(id)a3 device:(id)a4 complication:(id)a5 displayProperties:(id)a6;
- (NTKComplicationViewControllerDelegate)delegate;
- (id)_effectiveMetrics;
- (id)takeTouchCancellationAssertion;
- (unint64_t)presentationState;
- (void)_applyPresentationState;
- (void)_applyStyleIfPossible;
- (void)_applyStyleToDisplay:(id)a3;
- (void)_recreateDisplayIfNecessary;
- (void)_updateController;
- (void)_updatePresentationState;
- (void)_updateWidgetDescriptorForComplication:(id)a3 withProvider:(id)a4;
- (void)complicationController:(id)a3 touchedDownForDisplayWrapper:(id)a4;
- (void)complicationController:(id)a3 touchedUpForDisplayWrapper:(id)a4;
- (void)dealloc;
- (void)descriptorsDidChangeForDescriptorProvider:(id)a3;
- (void)displayWrapperTemplateBackgroundChanged;
- (void)loadView;
- (void)performTapAction;
- (void)setComplication:(id)a3;
- (void)setComplication:(id)a3 displayProperties:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDisplayProperties:(id)a3;
- (void)setForceLivePresentationState:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setTouchedDown:(BOOL)a3;
- (void)updateDisplayPropertiesWithBlock:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)willLaunchAppForComplicationDisplayWrapper:(id)a3;
@end

@implementation NTKComplicationViewController

- (NTKComplicationViewController)initWithVariant:(id)a3 device:(id)a4 complication:(id)a5 displayProperties:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)NTKComplicationViewController;
  v15 = [(NTKComplicationViewController *)&v26 initWithNibName:0 bundle:0];
  v16 = +[NTKWidgetDescriptorProvider sharedInstance];
  [v16 registerObserver:v15];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_variant, a3);
    objc_storeStrong((id *)&v15->_device, a4);
    objc_storeStrong((id *)&v15->_complication, a5);
    uint64_t v17 = objc_opt_new();
    style = v15->_style;
    v15->_style = (NTKComplicationStyle *)v17;

    v19 = [[NTKMonochromeModel alloc] initWithDevice:v12];
    monochromeModel = v15->_monochromeModel;
    v15->_monochromeModel = v19;

    v15->_presentationState = 2;
    v15->_forceLivePresentationState = 0;
    uint64_t v21 = [v14 copy];
    displayProperties = v15->_displayProperties;
    v15->_displayProperties = (NTKComplicationControllerDisplayProperties *)v21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    complication = v15->_complication;
    v24 = +[NTKWidgetDescriptorProvider sharedInstance];
    [(NTKComplicationViewController *)v15 _updateWidgetDescriptorForComplication:complication withProvider:v24];
  }
  return v15;
}

- (void)dealloc
{
  [(NTKComplicationController *)self->_controller removeDisplayWrapper:self->_wrapperView];
  v3.receiver = self;
  v3.super_class = (Class)NTKComplicationViewController;
  [(NTKComplicationViewController *)&v3 dealloc];
}

- (void)setComplication:(id)a3 displayProperties:(id)a4
{
  id v6 = a3;
  v7 = (NTKComplicationControllerDisplayProperties *)[a4 copy];
  displayProperties = self->_displayProperties;
  self->_displayProperties = v7;

  [(NTKComplicationViewController *)self setComplication:v6];
  controller = self->_controller;
  v10 = self->_displayProperties;
  wrapperView = self->_wrapperView;

  [(NTKComplicationController *)controller setDisplayProperties:v10 forDisplayWrapper:wrapperView];
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationViewController;
  [(NTKComplicationViewController *)&v13 loadView];
  objc_super v3 = [[NTKComplicationDisplayWrapperView alloc] initWithFamily:[(NTKComplicationVariant *)self->_variant family]];
  wrapperView = self->_wrapperView;
  self->_wrapperView = v3;

  objc_initWeak(&location, self);
  v5 = self->_wrapperView;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __41__NTKComplicationViewController_loadView__block_invoke;
  v10 = &unk_1E62C90F0;
  objc_copyWeak(&v11, &location);
  [(NTKComplicationDisplayWrapperView *)v5 setDisplayConfigurationHandler:&v7];
  -[NTKComplicationDisplayWrapperView addBackgroundObserver:](self->_wrapperView, "addBackgroundObserver:", self, v7, v8, v9, v10);
  [(NTKComplicationViewController *)self _updatePresentationState];
  id v6 = [(NTKComplicationViewController *)self view];
  [v6 addSubview:self->_wrapperView];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __41__NTKComplicationViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _applyStyleToDisplay:v5];
  }
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationViewController;
  [(NTKComplicationViewController *)&v13 viewDidLayoutSubviews];
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v5 = [(NTKComplicationViewController *)self _effectiveMetrics];
  [v5 size];
  -[NTKComplicationDisplayWrapperView setBounds:](self->_wrapperView, "setBounds:", v3, v4, v6, v7);

  [(NTKComplicationViewController *)self _contentTransform];
  wrapperView = self->_wrapperView;
  v12[0] = v12[3];
  v12[1] = v12[4];
  v12[2] = v12[5];
  [(NTKComplicationDisplayWrapperView *)wrapperView setContentTransform:v12];
  v9 = [(NTKComplicationViewController *)self view];
  [v9 bounds];
  double MidX = CGRectGetMidX(v14);
  id v11 = [(NTKComplicationViewController *)self view];
  [v11 bounds];
  -[NTKComplicationDisplayWrapperView setCenter:](self->_wrapperView, "setCenter:", MidX, CGRectGetMidY(v15));
}

- (void)performTapAction
{
}

- (id)takeTouchCancellationAssertion
{
  return 0;
}

- (void)setStyle:(id)a3
{
  id v6 = a3;
  if (!-[NTKComplicationStyle isEqual:](self->_style, "isEqual:"))
  {
    double v4 = (NTKComplicationStyle *)[v6 copy];
    style = self->_style;
    self->_style = v4;

    [(NTKComplicationViewController *)self _applyStyleIfPossible];
  }
}

- (void)setComplication:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = +[NTKWidgetDescriptorProvider sharedInstance];
    [(NTKComplicationViewController *)self _updateWidgetDescriptorForComplication:v8 withProvider:v4];
  }
  if (([v8 isEqual:self->_complication] & 1) == 0)
  {
    id v5 = (NTKComplication *)[v8 copy];
    complication = self->_complication;
    self->_complication = v5;

    [(NTKComplicationViewController *)self _updatePresentationState];
    [(NTKComplicationViewController *)self _updateController];
    double v7 = [(NTKComplicationViewController *)self view];
    [v7 setNeedsLayout];
  }
}

- (void)setDisplayProperties:(id)a3
{
  id v6 = a3;
  if ((NTKEqualObjects(self->_displayProperties, v6) & 1) == 0)
  {
    double v4 = (NTKComplicationControllerDisplayProperties *)[v6 copy];
    displayProperties = self->_displayProperties;
    self->_displayProperties = v4;

    [(NTKComplicationController *)self->_controller setDisplayProperties:self->_displayProperties forDisplayWrapper:self->_wrapperView];
  }
}

- (void)updateDisplayPropertiesWithBlock:(id)a3
{
  displayProperties = self->_displayProperties;
  id v5 = (void (**)(id, id))a3;
  id v6 = (id)[(NTKComplicationControllerDisplayProperties *)displayProperties mutableCopy];
  v5[2](v5, v6);

  [(NTKComplicationViewController *)self setDisplayProperties:v6];
}

- (void)setForceLivePresentationState:(BOOL)a3
{
  if (self->_forceLivePresentationState != a3) {
    self->_forceLivePresentationState = a3;
  }
  double v4 = [(NTKComplicationViewController *)self viewIfLoaded];

  if (v4)
  {
    [(NTKComplicationViewController *)self _updatePresentationState];
  }
}

- (void)_updateWidgetDescriptorForComplication:(id)a3 withProvider:(id)a4
{
  v23 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 descriptorsByExtensionIdentifier];
  double v7 = [v5 extensionBundleIdentifier];
  id v8 = [v6 objectForKey:v7];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    id v24 = v9;
    id v25 = v5;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        CGRect v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        CGRect v15 = objc_msgSend(v5, "kind", v23);
        v16 = [v14 kind];
        if (![v15 isEqual:v16]) {
          goto LABEL_11;
        }
        uint64_t v17 = [v5 containerBundleIdentifier];
        v18 = [v14 containerBundleIdentifier];
        if (![v17 isEqual:v18])
        {

LABEL_11:
          continue;
        }
        v19 = [v5 extensionBundleIdentifier];
        [v14 extensionBundleIdentifier];
        uint64_t v20 = v11;
        v22 = uint64_t v21 = v12;
        int v26 = [v19 isEqual:v22];

        uint64_t v12 = v21;
        uint64_t v11 = v20;

        id v9 = v24;
        id v5 = v25;

        if (v26)
        {
          objc_storeStrong((id *)&v23->_widgetDescriptor, v14);
          [(NTKComplicationViewController *)v23 displayWrapperTemplateBackgroundChanged];
          goto LABEL_14;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }
LABEL_14:
}

- (void)_updatePresentationState
{
  v13[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NTKComplicationVariant *)self->_variant family];
  double v4 = +[NTKComplicationProvider providerForDevice:self->_device];
  complication = self->_complication;
  id v6 = [NSNumber numberWithInteger:v3];
  v13[0] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  LOBYTE(complication) = [v4 isComplicationAvailable:complication forFamilies:v7];

  if ((complication & 1) != 0 || self->_forceLivePresentationState)
  {
    id v8 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = self->_complication;
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Presentation state update for %@", (uint8_t *)&v11, 0xCu);
    }

    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v10 = 1;
  }
  if (self->_presentationState != v10)
  {
    self->_presentationState = v10;
    [(NTKComplicationViewController *)self _applyPresentationState];
  }
}

- (void)_applyPresentationState
{
  [(NTKComplicationViewController *)self _updateController];
  unint64_t presentationState = self->_presentationState;
  if (presentationState == 2)
  {
    wrapperView = self->_wrapperView;
    [(NTKComplicationDisplayWrapperView *)wrapperView setCustomDisplay:0];
  }
  else if (presentationState == 1)
  {
    id v5 = +[NTKComplicationPlaceholderController templateForFamily:[(NTKComplicationVariant *)self->_variant family] complication:self->_complication variant:self->_variant];
    [(NTKComplicationDisplayWrapperView *)self->_wrapperView setComplicationTemplate:v5 reason:0 animation:0];
  }
}

- (void)_updateController
{
  if (self->_presentationState)
  {
    int64_t v3 = 0;
  }
  else
  {
    int64_t v3 = +[NTKComplicationController controllerForComplication:self->_complication variant:self->_variant device:self->_device];
  }
  p_controller = &self->_controller;
  controller = self->_controller;
  if (controller != v3)
  {
    obj = v3;
    if (controller && self->_wrapperView) {
      -[NTKComplicationController removeDisplayWrapper:](controller, "removeDisplayWrapper:");
    }
    objc_storeStrong((id *)&self->_controller, obj);
    [(NTKComplicationViewController *)self _recreateDisplayIfNecessary];
    [(NTKComplicationController *)*p_controller addDisplayWrapper:self->_wrapperView withDisplayProperties:self->_displayProperties];
    [(NTKComplicationController *)*p_controller setTouchObserver:self forDisplayWrapper:self->_wrapperView];
    int64_t v3 = obj;
  }
}

- (void)_recreateDisplayIfNecessary
{
  int64_t v3 = [(NTKComplicationController *)self->_controller richComplicationDisplayViewClass];
  if (v3)
  {
    double v4 = v3;
    if ([(objc_class *)v3 instancesRespondToSelector:sel_initWithFamily_]) {
      id v5 = (id)objc_msgSend([v4 alloc], "initWithFamily:", -[NTKComplicationVariant family](self->_variant, "family"));
    }
    else {
      id v5 = objc_alloc_init(v4);
    }
    id v6 = v5;
    [(NTKComplicationDisplayWrapperView *)self->_wrapperView setCustomDisplay:v5];
  }
}

- (void)_applyStyleIfPossible
{
  wrapperView = self->_wrapperView;
  if (wrapperView)
  {
    id v4 = [(NTKComplicationDisplayWrapperView *)wrapperView display];
    [(NTKComplicationViewController *)self _applyStyleToDisplay:v4];
  }
}

- (void)_applyStyleToDisplay:(id)a3
{
  id v9 = a3;
  if ([v9 conformsToProtocol:&unk_1FCD6BD68])
  {
    id v4 = v9;
    id v5 = [(NTKComplicationViewController *)self style];
    id v6 = [v5 circularPlatterColor];
    [v4 setPlatterColor:v6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v9;
    id v8 = [(NTKComplicationViewController *)self style];
    objc_msgSend(v7, "setFontStyle:", objc_msgSend(v8, "fontStyle"));

    [v7 setFilterProvider:self->_monochromeModel];
    [v7 transitionToMonochromeWithFraction:0.0];
  }
}

- (CGAffineTransform)_contentTransform
{
  result = [(NTKComplication *)self->_complication complicationType];
  if (result == (CGAffineTransform *)56)
  {
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  }
  else
  {
    id v8 = [(NTKComplicationViewController *)self variant];
    uint64_t v9 = [v8 family];
    unint64_t v10 = [(NTKComplicationViewController *)self device];
    id v33 = +[NTKComplicationMetrics defaultMetricsForFamily:v9 device:v10];

    int v11 = [(NTKComplicationViewController *)self variant];
    uint64_t v12 = [v11 metrics];

    [v33 size];
    double v14 = v13;
    [v33 size];
    double v16 = v15;
    [v33 safeAreaInsets];
    double v19 = v14 - (v17 + v18);
    double v22 = v16 - (v20 + v21);
    [v12 size];
    double v24 = v23;
    [v12 size];
    double v26 = v25;
    [v12 safeAreaInsets];
    double v31 = (v24 - (v27 + v28)) / v19;
    double v32 = (v26 - (v29 + v30)) / v22;
    if (v31 < v32) {
      double v32 = v31;
    }
    CGAffineTransformMakeScale(retstr, v32, v32);
  }
  return result;
}

- (id)_effectiveMetrics
{
  if ([(NTKComplication *)self->_complication complicationType] == 56)
  {
    int64_t v3 = [(NTKComplicationViewController *)self variant];
    id v4 = [v3 metrics];
  }
  else
  {
    int64_t v3 = [(NTKComplicationViewController *)self variant];
    uint64_t v5 = [v3 family];
    uint64_t v6 = [(NTKComplicationViewController *)self device];
    id v4 = +[NTKComplicationMetrics defaultMetricsForFamily:v5 device:v6];
  }

  return v4;
}

- (void)displayWrapperTemplateBackgroundChanged
{
  id v3 = [(NTKComplicationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 complicationViewControllerBackgroundChanged:self];
  }
}

- (CLKComplicationBackgroundDescriptor)backgroundDescriptor
{
  id v3 = [(NTKComplicationDisplayWrapperView *)self->_wrapperView complicationTemplate];
  id v4 = [v3 backgroundDescriptor];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = [(NTKComplicationVariant *)self->_variant metrics];
    int v7 = [v6 opaque];

    id v8 = objc_alloc(MEMORY[0x1E4F196C0]);
    if (v7) {
      id v5 = (id)[v8 initWithMaterialBackground];
    }
    else {
      id v5 = (id)[v8 initWithClearBackground];
    }
  }
  uint64_t v9 = v5;

  return (CLKComplicationBackgroundDescriptor *)v9;
}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__NTKComplicationViewController_descriptorsDidChangeForDescriptorProvider___block_invoke;
  v6[3] = &unk_1E62C09C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __75__NTKComplicationViewController_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = v3[127];
    return [v3 _updateWidgetDescriptorForComplication:v5 withProvider:v4];
  }
  return result;
}

- (void)complicationController:(id)a3 touchedUpForDisplayWrapper:(id)a4
{
  -[NTKComplicationViewController setTouchedDown:](self, "setTouchedDown:", 0, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained complicationViewControllerTouchedDownChanged:self];
  }
}

- (void)complicationController:(id)a3 touchedDownForDisplayWrapper:(id)a4
{
  -[NTKComplicationViewController setTouchedDown:](self, "setTouchedDown:", 1, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained complicationViewControllerTouchedDownChanged:self];
  }
}

- (void)willLaunchAppForComplicationDisplayWrapper:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained complicationViewControllerWillPerformAppLaunch:self];
  }
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (NTKComplicationVariant)variant
{
  return self->_variant;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NTKComplicationStyle)style
{
  return self->_style;
}

- (NTKComplicationControllerDisplayProperties)displayProperties
{
  return self->_displayProperties;
}

- (NTKComplicationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKComplicationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (BOOL)forceLivePresentationState
{
  return self->_forceLivePresentationState;
}

- (BOOL)touchedDown
{
  return self->_touchedDown;
}

- (void)setTouchedDown:(BOOL)a3
{
  self->_touchedDown = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayProperties, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_storeStrong((id *)&self->_monochromeModel, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end