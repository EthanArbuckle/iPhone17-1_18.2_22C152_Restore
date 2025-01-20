@interface SBElasticBrightnessViewController
- (BOOL)updateActiveRouteDisplay:(id *)a3;
- (SBElasticBrightnessViewController)initWithDataSource:(id)a3;
- (id)dataSource;
- (id)sliderAccessibilityIdentifier;
- (unint64_t)layoutAxisForInterfaceOrientation:(int64_t)a3;
- (void)_debugHandleNextRoute;
- (void)_debugHandleResetRoute;
- (void)noteContinuousValueInteractionDidEnd;
- (void)noteContinuousValueInteractionWillBegin;
- (void)viewDidLoad;
@end

@implementation SBElasticBrightnessViewController

- (SBElasticBrightnessViewController)initWithDataSource:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBElasticBrightnessViewController;
  result = [(SBElasticValueViewController *)&v4 initWithDataSource:a3];
  if (result)
  {
    result->_activeBrightnessRoute = 0;
    result->_debugOverrideBrightnessRoute = 0;
  }
  return result;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SBElasticBrightnessViewController;
  [(SBElasticValueViewController *)&v2 viewDidLoad];
}

- (id)dataSource
{
  v4.receiver = self;
  v4.super_class = (Class)SBElasticBrightnessViewController;
  objc_super v2 = [(SBElasticValueViewController *)&v4 dataSource];
  return v2;
}

- (BOOL)updateActiveRouteDisplay:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [(SBElasticBrightnessViewController *)self dataSource];
  uint64_t v6 = [v5 elasticBrightnessViewControllerBrightnessRouteType:self];

  if (SBBrightnessRouteTypeIsValid(v6)) {
    int64_t debugOverrideBrightnessRoute = v6;
  }
  else {
    int64_t debugOverrideBrightnessRoute = 1;
  }
  if (SBBrightnessRouteTypeIsValid(self->_debugOverrideBrightnessRoute)) {
    int64_t debugOverrideBrightnessRoute = self->_debugOverrideBrightnessRoute;
  }
  int64_t activeBrightnessRoute = self->_activeBrightnessRoute;
  self->_int64_t activeBrightnessRoute = debugOverrideBrightnessRoute;
  v9 = NSLocalizedStringFromSBBrightnessRouteType(debugOverrideBrightnessRoute);
  v10 = CCUICAPackageDescriptionForSBBrightnessRouteType(debugOverrideBrightnessRoute);
  if (v10)
  {
    v11 = SBGlyphStateValueTransformerForBrightnessRouteType();
    +[SBElasticRouteDisplayContext routeContextWithName:v9 valueTransformer:v11 glyphPackage:v10];
  }
  else
  {
    v11 = UIImageSymbolForSBBrightnessRouteType();
    +[SBElasticRouteDisplayContext routeContextWithName:v9 glyphImage:v11];
  v12 = };

  id v13 = v12;
  *a3 = v13;
  v14 = [(SBElasticBrightnessViewController *)self log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = NSStringFromSBBrightnessRouteType(debugOverrideBrightnessRoute);
    int v17 = 138412546;
    v18 = v15;
    __int16 v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Updated route display info for brightness route (%@): '%@'", (uint8_t *)&v17, 0x16u);
  }
  return activeBrightnessRoute != debugOverrideBrightnessRoute;
}

- (unint64_t)layoutAxisForInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)noteContinuousValueInteractionWillBegin
{
  id v3 = [(SBElasticBrightnessViewController *)self dataSource];
  [v3 elasticBrightnessViewControllerValueUpdatesWillBegin:self];
}

- (void)noteContinuousValueInteractionDidEnd
{
  id v3 = [(SBElasticBrightnessViewController *)self dataSource];
  [v3 elasticBrightnessViewControllerValueUpdatesDidEnd:self];
}

- (id)sliderAccessibilityIdentifier
{
  return @"sb-brightness-hud";
}

- (void)_debugHandleNextRoute
{
  int64_t debugOverrideBrightnessRoute = self->_debugOverrideBrightnessRoute;
  if (!SBBrightnessRouteTypeIsValid(debugOverrideBrightnessRoute)) {
    int64_t debugOverrideBrightnessRoute = self->_activeBrightnessRoute;
  }
  int64_t v4 = 1;
  if (debugOverrideBrightnessRoute <= 1) {
    int64_t v4 = debugOverrideBrightnessRoute + 1;
  }
  self->_int64_t debugOverrideBrightnessRoute = v4;
}

- (void)_debugHandleResetRoute
{
  self->_int64_t debugOverrideBrightnessRoute = 0;
}

@end