@interface SBDynamicFlashlightActivityElementView
- (BOOL)isExpanded;
- (BOOL)isTouching;
- (BOOL)sensorShadowHidden;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBDynamicFlashlightActivityElementView)initWithBeamState:(CGPoint)a3 optionsProvider:(id)a4;
- (SBDynamicFlashlightActivityElementView)initWithFrame:(CGRect)a3 beamState:(CGPoint)a4 optionsProvider:(id)a5;
- (id)_flashlightStateForWidth:(double)a3 intensity:(double)a4;
- (void)_applyBeamState;
- (void)_layoutSensorShadow;
- (void)_setupBeamState:(CGPoint)a3;
- (void)_setupLayers;
- (void)_transitionToCollapsedState;
- (void)_transitionToExpandedStateWithIntensity:(double)a3 width:(double)a4;
- (void)layoutSubviews;
- (void)setBeamState:(CGPoint)a3;
- (void)setExpanded:(BOOL)a3 intensity:(double)a4 width:(double)a5;
- (void)setSensorShadowHidden:(BOOL)a3;
- (void)setTouching:(BOOL)a3;
@end

@implementation SBDynamicFlashlightActivityElementView

- (SBDynamicFlashlightActivityElementView)initWithBeamState:(CGPoint)a3 optionsProvider:(id)a4
{
  return -[SBDynamicFlashlightActivityElementView initWithFrame:beamState:optionsProvider:](self, "initWithFrame:beamState:optionsProvider:", a4, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 238.666667, 339.333333, a3.x, a3.y);
}

- (SBDynamicFlashlightActivityElementView)initWithFrame:(CGRect)a3 beamState:(CGPoint)a4 optionsProvider:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  id v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)SBDynamicFlashlightActivityElementView;
  v14 = -[SBDynamicFlashlightActivityElementView initWithFrame:](&v25, sel_initWithFrame_, v11, v10, width, height);
  v15 = v14;
  if (v14)
  {
    packageState = v14->_packageState;
    v14->_packageState = (NSString *)@"State 0";

    v15->_isExpanded = 0;
    objc_storeStrong((id *)&v15->_optionsProvider, a5);
    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = [v17 URLForResource:@"Flashlight-Dynamic" withExtension:@"ca"];

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F4F8A0]) initWithURL:v18];
    packageView = v15->_packageView;
    v15->_packageView = (BSUICAPackageView *)v19;

    v21 = [[SBDynamicFlashlightActivityElementPackageLayerController alloc] initWithPackageView:v15->_packageView];
    layerManager = v15->_layerManager;
    v15->_layerManager = v21;

    [(SBDynamicFlashlightActivityElementView *)v15 _setupLayers];
    -[SBDynamicFlashlightActivityElementView _setupBeamState:](v15, "_setupBeamState:", x, y);
    v23 = [MEMORY[0x1E4F428B8] blackColor];
    [(SBDynamicFlashlightActivityElementView *)v15 setBackgroundColor:v23];

    [(SBDynamicFlashlightActivityElementView *)v15 setNeedsLayout];
  }

  return v15;
}

- (void)_setupLayers
{
  [(SBDynamicFlashlightActivityElementView *)self addSubview:self->_packageView];
  v3 = [(SBDynamicFlashlightActivityElementPackageLayerController *)self->_layerManager sensorShadowPortalLayer];
  sensorShadowLayer = self->_sensorShadowLayer;
  self->_sensorShadowLayer = v3;

  v5 = [(SBDynamicFlashlightActivityElementView *)self layer];
  [v5 addSublayer:self->_sensorShadowLayer];

  [(SBDynamicFlashlightActivityElementView *)self setNeedsLayout];
}

- (void)_setupBeamState:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v16[1] = *MEMORY[0x1E4F143B8];
  v6 = (UIViewVectorAnimatableProperty *)[objc_alloc(MEMORY[0x1E4F43018]) initWithLength:2];
  p_beamState = &self->_beamState;
  beamState = self->_beamState;
  self->_beamState = v6;

  v9 = self->_beamState;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__SBDynamicFlashlightActivityElementView__setupBeamState___block_invoke;
  v15[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v15[4] = x;
  *(CGFloat *)&v15[5] = y;
  [(UIViewVectorAnimatableProperty *)v9 _mutateValue:v15];
  objc_initWeak(&location, self);
  double v10 = (void *)MEMORY[0x1E4F42FF0];
  v16[0] = *p_beamState;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SBDynamicFlashlightActivityElementView__setupBeamState___block_invoke_2;
  v12[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v13, &location);
  [v10 _createTransformerWithInputAnimatableProperties:v11 presentationValueChangedCallback:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

double __58__SBDynamicFlashlightActivityElementView__setupBeamState___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

void __58__SBDynamicFlashlightActivityElementView__setupBeamState___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _applyBeamState];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 238.666667;
  double v4 = 339.333333;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBDynamicFlashlightActivityElementView;
  [(SBDynamicFlashlightActivityElementView *)&v4 layoutSubviews];
  [(SBDynamicFlashlightActivityElementView *)self bounds];
  packageView = self->_packageView;
  BSRectWithSize();
  -[BSUICAPackageView setBounds:](packageView, "setBounds:");
  BSRectGetCenter();
  -[BSUICAPackageView setCenter:](self->_packageView, "setCenter:");
  if (![(CALayer *)self->_sensorShadowLayer isHidden]) {
    [(SBDynamicFlashlightActivityElementView *)self _layoutSensorShadow];
  }
}

- (void)_layoutSensorShadow
{
  double v3 = [(id)SBApp systemApertureControllerForMainDisplay];
  [v3 defaultIslandFrameInCoordinateSpace:self];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v19.origin.CGFloat x = v5;
  v19.origin.CGFloat y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  if (!CGRectEqualToRect(self->_sensorAreaRect, v19))
  {
    self->_sensorAreaRect.origin.CGFloat x = v5;
    self->_sensorAreaRect.origin.CGFloat y = v7;
    self->_sensorAreaRect.size.double width = v9;
    self->_sensorAreaRect.size.double height = v11;
    BSRectGetCenter();
    double v13 = v12;
    double v15 = v14;
    [(CALayer *)self->_sensorShadowLayer frame];
    sensorShadowLayer = self->_sensorShadowLayer;
    -[CALayer setPosition:](sensorShadowLayer, "setPosition:", v13, v15 + v16 * 0.5);
  }
}

- (void)setSensorShadowHidden:(BOOL)a3
{
  self->_sensorShadowHidden = a3;
  -[CALayer setHidden:](self->_sensorShadowLayer, "setHidden:");
}

- (void)setExpanded:(BOOL)a3 intensity:(double)a4 width:(double)a5
{
  BOOL v7 = a3;
  CGFloat v9 = SBLogFlashlightHUD();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SBDynamicFlashlightActivityElementView setExpanded:intensity:width:](v7, v9);
  }

  self->_isExpanded = v7;
  if (v7) {
    [(SBDynamicFlashlightActivityElementView *)self _transitionToExpandedStateWithIntensity:a4 width:a5];
  }
  else {
    [(SBDynamicFlashlightActivityElementView *)self _transitionToCollapsedState];
  }
}

- (void)_transitionToExpandedStateWithIntensity:(double)a3 width:(double)a4
{
  [(BSUICAPackageView *)self->_packageView setState:@"State 0" animated:0];
  [(SBDynamicFlashlightActivityElementPackageLayerController *)self->_layerManager setBeamIntensity:0 width:a3 animated:a4];
  [MEMORY[0x1E4F39CF8] begin];
  BOOL v7 = [(SBDynamicFlashlightActivityElementView *)self _flashlightStateForWidth:a4 intensity:a3];
  double v8 = SBLogFlashlightHUD();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBDynamicFlashlightActivityElementView _transitionToExpandedStateWithIntensity:width:]((uint64_t)v7, v8);
  }

  [(BSUICAPackageView *)self->_packageView setState:v7];
  packageState = self->_packageState;
  self->_packageState = v7;
  double v10 = v7;

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)_transitionToCollapsedState
{
  [MEMORY[0x1E4F39CF8] begin];
  [(BSUICAPackageView *)self->_packageView setState:@"State 0" animated:1];
  double v3 = (void *)MEMORY[0x1E4F39CF8];
  [v3 commit];
}

- (void)setBeamState:(CGPoint)a3
{
  beamState = self->_beamState;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SBDynamicFlashlightActivityElementView_setBeamState___block_invoke;
  v4[3] = &__block_descriptor_48_e9_v16__0_d8l;
  CGPoint v5 = a3;
  [(UIViewVectorAnimatableProperty *)beamState _mutateValue:v4];
}

__n128 __55__SBDynamicFlashlightActivityElementView_setBeamState___block_invoke(__n128 *a1, __n128 *a2)
{
  __n128 result = a1[2];
  *a2 = result;
  return result;
}

- (void)_applyBeamState
{
  double v3 = (double *)[(UIViewVectorAnimatableProperty *)self->_beamState _presentationValue];
  double v4 = *v3;
  double v5 = v3[1];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v6 = [(SBDynamicFlashlightActivityElementView *)self _flashlightStateForWidth:v4 intensity:v5];
  if (([v6 isEqualToString:self->_packageState] & 1) == 0)
  {
    BOOL v7 = SBLogFlashlightHUD();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SBDynamicFlashlightActivityElementView _transitionToExpandedStateWithIntensity:width:]((uint64_t)v6, v7);
    }

    [(BSUICAPackageView *)self->_packageView setState:v6];
    objc_storeStrong((id *)&self->_packageState, v6);
  }
  [(SBDynamicFlashlightActivityElementPackageLayerController *)self->_layerManager setBeamIntensity:0 width:v5 animated:v4];
  [(SBDynamicFlashlightActivityElementPackageLayerController *)self->_layerManager setTouching:self->_touching animated:1];
  [(SBDynamicFlashlightActivityElementView *)self _layoutSensorShadow];
  [MEMORY[0x1E4F39CF8] commit];
}

- (id)_flashlightStateForWidth:(double)a3 intensity:(double)a4
{
  [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider minimumIntensity];
  BOOL v7 = @"State 1";
  if (a3 < 0.12) {
    BOOL v7 = @"State 1 - narrowest";
  }
  if (v6 <= a4) {
    return v7;
  }
  else {
    return @"Off";
  }
}

- (void)setTouching:(BOOL)a3
{
  double v5 = SBLogFlashlightHUD();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBDynamicFlashlightActivityElementView setTouching:](a3, v5);
  }

  self->_touching = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (BOOL)isTouching
{
  return self->_touching;
}

- (BOOL)sensorShadowHidden
{
  return self->_sensorShadowHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageState, 0);
  objc_storeStrong((id *)&self->_optionsProvider, 0);
  objc_storeStrong((id *)&self->_sensorShadowLayer, 0);
  objc_storeStrong((id *)&self->_layerManager, 0);
  objc_storeStrong((id *)&self->_beamState, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
}

- (void)setExpanded:(char)a1 intensity:(NSObject *)a2 width:.cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "View Expanded -> %{BOOL}i", (uint8_t *)v2, 8u);
}

- (void)_transitionToExpandedStateWithIntensity:(uint64_t)a1 width:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "View State -> %@", (uint8_t *)&v2, 0xCu);
}

- (void)setTouching:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "View Touching -> %{BOOL}u", (uint8_t *)v2, 8u);
}

@end