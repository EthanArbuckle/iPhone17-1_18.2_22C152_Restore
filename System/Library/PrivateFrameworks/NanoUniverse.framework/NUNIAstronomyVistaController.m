@interface NUNIAstronomyVistaController
- (BOOL)forceDisableLocationDot;
- (BOOL)isBacklightTransitionEnabled;
- (BOOL)isPreparedForTransitions;
- (BOOL)shouldShowLocationDot;
- (CLLocation)currentLocation;
- (NSDate)overrideDate;
- (NUNIAegirStyleDefinition)styleDefinition;
- (NUNIAstronomyPulseAnimationDelegate)pulseAnimationDelegate;
- (NUNIAstronomyRotationModel)rotationModel;
- (NUNIAstronomyStyleAnimationDelegate)styleAnimationDelegate;
- (NUNIAstronomyVistaController)initWithVistaView:(id)a3;
- (NUNIAstronomyVistaControllerDelegate)delegate;
- (NUNIAstronomyVistaView)vistaView;
- (UIPanGestureRecognizer)spheroidPanGesture;
- (UITapGestureRecognizer)interactiveModeTapGesture;
- (UITapGestureRecognizer)supplementalModeDoubleTapGesture;
- (double)numberOfPulses;
- (double)pulseAnimationDuration;
- (id)generateAnimationToVista:(unint64_t)a3 styleDefinition:(NUNIAegirStyleDefinition)a4;
- (int64_t)activeModeFrameInterval;
- (int64_t)mode;
- (unint64_t)style;
- (unint64_t)vista;
- (unint64_t)vistaTransitionStyle;
- (void)_animateToStyle:(unint64_t)a3;
- (void)_animateToStyleDefinition:(NUNIAegirStyleDefinition)a3;
- (void)_applyVista:(unint64_t)a3;
- (void)_handleInteractiveModeGesture:(id)a3;
- (void)_handleSpheroidPanGesture:(id)a3;
- (void)_handleSupplementalModeGesture:(id)a3;
- (void)_updateFrameInterval;
- (void)activeMode;
- (void)animateToStyleDefinition:(NUNIAegirStyleDefinition)a3 duration:(float)a4;
- (void)animateToVista:(unint64_t)a3 styleDefinition:(NUNIAegirStyleDefinition)a4 duration:(float)a5;
- (void)animateTransitionToMode:(int64_t)a3;
- (void)applyMode:(int64_t)a3;
- (void)applyStyle:(unint64_t)a3;
- (void)applyStyleDefinition:(NUNIAegirStyleDefinition)a3;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromStyleDefinition:(NUNIAegirStyleDefinition)a4 toStyleDefinition:(NUNIAegirStyleDefinition)a5;
- (void)applyTransitionFraction:(double)a3 fromVista:(unint64_t)a4 fromStyleDefinition:(NUNIAegirStyleDefinition)a5 toVista:(unint64_t)a6 toStyleDefinition:(NUNIAegirStyleDefinition)a7;
- (void)applyTransitionFraction:(double)a3 fromVista:(unint64_t)a4 toVista:(unint64_t)a5;
- (void)astronomyAnimationFinished:(id)a3;
- (void)cleanUpAfterTransitions;
- (void)deactiveMode;
- (void)disableCloudDataFetch:(BOOL)a3;
- (void)hideLocationDotAnimated:(BOOL)a3;
- (void)hideLocationDotPulse;
- (void)interactiveMode;
- (void)prepareForTransitions;
- (void)pulseLocationDot;
- (void)setActiveModeFrameInterval:(int64_t)a3;
- (void)setCacheDirectory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceDisableLocationDot:(BOOL)a3;
- (void)setIsBacklightTransitionEnabled:(BOOL)a3;
- (void)setLocationDotAlpha:(double)a3;
- (void)setNumberOfPulses:(double)a3;
- (void)setOverrideDate:(id)a3;
- (void)setOverrideDate:(id)a3 animated:(BOOL)a4;
- (void)setPreparedForTransitions:(BOOL)a3;
- (void)setPulseAnimationDelegate:(id)a3;
- (void)setPulseAnimationDuration:(double)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setStyleAnimationDelegate:(id)a3;
- (void)setStyleDefinition:(NUNIAegirStyleDefinition)a3;
- (void)setVista:(unint64_t)a3;
- (void)setVistaTransitionStyle:(unint64_t)a3;
- (void)setVistaView:(id)a3;
- (void)showLocationDotAnimated:(BOOL)a3;
- (void)startClockUpdates;
- (void)stopClockUpdates;
- (void)stopLocationDotPulse;
- (void)supplementalMode;
- (void)updateLocation:(id)a3 fallbackLocation:(id)a4;
- (void)updateLocation:(id)a3 fallbackLocation:(id)a4 animated:(BOOL)a5;
- (void)updateTimeAnimated:(BOOL)a3;
@end

@implementation NUNIAstronomyVistaController

- (NUNIAstronomyVistaController)initWithVistaView:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NUNIAstronomyVistaController;
  v5 = [(NUNIAstronomyVistaController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_numberOfPulses = 1.0;
    v5->_pulseAnimationDuration = 1.75;
    uint64_t v7 = objc_opt_new();
    rotationModel = v6->_rotationModel;
    v6->_rotationModel = (NUNIAstronomyRotationModel *)v7;

    [(NUNIAstronomyRotationModel *)v6->_rotationModel setObserver:v6];
    v9 = objc_alloc_init(NUNIAstronomyLocationDotConfiguration);
    v10 = [MEMORY[0x263F82B60] mainScreen];
    [v10 scale];
    -[NUNIAstronomyLocationDotConfiguration setScreenScale:](v9, "setScreenScale:");

    [(NUNIAstronomyVistaController *)v6 setVistaView:v4];
    v6->_isFallbackLocation = 1;
    [(NUNIAstronomyVistaController *)v6 applyMode:1];
    v6->_activeModeFrameInterval = 3;
  }
  return v6;
}

- (void)setPreparedForTransitions:(BOOL)a3
{
  self->_preparedForTransitions = a3;
  [(NUNIAstronomyVistaController *)self _updateFrameInterval];
}

- (void)setActiveModeFrameInterval:(int64_t)a3
{
  if (self->_activeModeFrameInterval != a3)
  {
    self->_activeModeFrameInterval = a3;
    [(NUNIAstronomyVistaController *)self _updateFrameInterval];
  }
}

- (void)_updateFrameInterval
{
  int64_t mode = self->_mode;
  if (mode == 3 || mode == 1)
  {
    int64_t activeModeFrameInterval = 3;
  }
  else if (mode)
  {
    int64_t activeModeFrameInterval = 0;
  }
  else
  {
    int64_t activeModeFrameInterval = self->_activeModeFrameInterval;
  }
  [(NUNIAstronomyVistaView *)self->_vistaView setFrameInterval:activeModeFrameInterval];
}

- (void)prepareForTransitions
{
  [(NUNIAstronomyVistaController *)self setPreparedForTransitions:1];
  v3 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  [v3 setUpdatable:0];

  uint64_t v4 = 0;
  editingVistaAnimations = self->_editingVistaAnimations;
  do
  {
    uint64_t v6 = v4 + 1;
    if (v4 == 9) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v4 + 1;
    }
    uint64_t v8 = [(NUNIAstronomyVistaView *)self->_vistaView generateAnimationArrayFromVista:v4 toVista:v7 transitionStyle:self->_vistaTransitionStyle];
    v9 = editingVistaAnimations[v4];
    editingVistaAnimations[v4] = (NSArray *)v8;

    ++v4;
  }
  while (v6 != 10);
}

- (void)setCacheDirectory:(id)a3
{
}

- (void)disableCloudDataFetch:(BOOL)a3
{
}

- (void)setVistaView:(id)a3
{
  objc_storeStrong((id *)&self->_vistaView, a3);
  id v11 = a3;
  v5 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel__handleSpheroidPanGesture_];
  spheroidPanGesture = self->_spheroidPanGesture;
  self->_spheroidPanGesture = v5;

  [(UIPanGestureRecognizer *)self->_spheroidPanGesture setMaximumNumberOfTouches:1];
  uint64_t v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleSupplementalModeGesture_];
  supplementalModeDoubleTapGesture = self->_supplementalModeDoubleTapGesture;
  self->_supplementalModeDoubleTapGesture = v7;

  [(UITapGestureRecognizer *)self->_supplementalModeDoubleTapGesture setNumberOfTapsRequired:2];
  [(UITapGestureRecognizer *)self->_supplementalModeDoubleTapGesture setNumberOfTouchesRequired:1];
  v9 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleInteractiveModeGesture_];
  interactiveModeTapGesture = self->_interactiveModeTapGesture;
  self->_interactiveModeTapGesture = v9;

  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setNumberOfTouchesRequired:1];
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setCancelsTouchesInView:0];
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture requireGestureRecognizerToFail:self->_supplementalModeDoubleTapGesture];
  [(NUNIAstronomyVistaView *)self->_vistaView addGestureRecognizer:self->_spheroidPanGesture];
  [(NUNIAstronomyVistaView *)self->_vistaView addGestureRecognizer:self->_interactiveModeTapGesture];
  [(NUNIAstronomyVistaView *)self->_vistaView addGestureRecognizer:self->_supplementalModeDoubleTapGesture];
}

- (NUNIAstronomyVistaView)vistaView
{
  return self->_vistaView;
}

- (void)cleanUpAfterTransitions
{
  [(NUNIAstronomyVistaController *)self _applyVista:self->_vista];
  v3 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  [v3 setUpdatable:1];

  for (uint64_t i = 24; i != 104; i += 8)
  {
    v5 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;
  }
  [(NUNIAstronomyVistaController *)self setPreparedForTransitions:0];
}

- (void)setVista:(unint64_t)a3
{
  self->_vista = a3;
  -[NUNIAstronomyVistaController _applyVista:](self, "_applyVista:");
}

- (void)_applyVista:(unint64_t)a3
{
  if (self->_vistaView)
  {
    [(NUNIAstronomyRotationModel *)self->_rotationModel stop];
    id v6 = [(NUNIAstronomyVistaView *)self->_vistaView rotatable:a3];
    [(NUNIAstronomyRotationModel *)self->_rotationModel setRotatable:v6];
    if (v6)
    {
      [v6 homeCoordinate];
      objc_msgSend(v6, "setCenterCoordinate:animated:", 0);
    }
    v5 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
    [v5 removeAllAnimations];

    [(NUNIAstronomyVistaView *)self->_vistaView applyVista:a3 transitionStyle:self->_vistaTransitionStyle];
  }
}

- (void)setStyleDefinition:(NUNIAegirStyleDefinition)a3
{
  uint64_t v4 = v3;
  long long v5 = v3[1];
  *(_OWORD *)&self->_styleDefinition.orbit = *v3;
  *(_OWORD *)&self[1]._vistaView = v5;
  id v8 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  long long v6 = v4[1];
  v9[0] = *v4;
  v9[1] = v6;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v9, v7, v8);
  [v8 updateCamera];
}

- (void)applyTransitionFraction:(double)a3 fromVista:(unint64_t)a4 toVista:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a4 + 1 == a5)
  {
    id v8 = self->_editingVistaAnimations[a4];
  }
  else if (a5 + 1 == a4)
  {
    id v8 = self->_editingVistaAnimations[a5];
    a3 = 1.0 - a3;
  }
  else
  {
    if (a4 != a5) {
      return;
    }
    id v8 = self->_editingVistaAnimations[a4];
    a3 = 0.0;
    if (self->_vista != a4) {
      [(NUNIAstronomyVistaController *)self setVista:a4];
    }
  }
  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = v8;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      float v13 = a3;
      float v14 = (float)(v13 * v13) * (float)((float)(v13 * -2.0) + 3.0);
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v9);
          }
          *(float *)&double v11 = v14;
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "apply:", v11, (void)v17);
        }
        while (v12 != v16);
        uint64_t v12 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  unint64_t vista = self->_vista;
  long long v6 = (char *)&_NUNIGetAegirStyleDefinition_earthDefinitions;
  if (vista == 1) {
    long long v6 = (char *)&_NUNIGetAegirStyleDefinition_lunaDefinitions;
  }
  if (vista == 2) {
    uint64_t v7 = (char *)&_NUNIGetAegirStyleDefinition_orreryDefinitions;
  }
  else {
    uint64_t v7 = v6;
  }
  id v8 = &v7[32 * a4];
  long long v9 = *((_OWORD *)v8 + 1);
  v13[0] = *(_OWORD *)v8;
  v13[1] = v9;
  uint64_t v10 = &v7[32 * a5];
  long long v11 = *((_OWORD *)v10 + 1);
  v12[0] = *(_OWORD *)v10;
  v12[1] = v11;
  [(NUNIAstronomyVistaController *)self applyTransitionFraction:v13 fromStyleDefinition:v12 toStyleDefinition:a3];
}

- (void)applyTransitionFraction:(double)a3 fromStyleDefinition:(NUNIAegirStyleDefinition)a4 toStyleDefinition:(NUNIAegirStyleDefinition)a5
{
  uint64_t v7 = v6;
  id v8 = v5;
  id v21 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  float v11 = a3;
  float v12 = (float)(v11 * v11) * (float)((float)(v11 * -2.0) + 3.0);
  float32x2_t v13 = vmla_n_f32(v8[1], vsub_f32(v7[1], v8[1]), v12);
  float32x2_t v14 = vmla_n_f32(v8[2], vsub_f32(v7[2], v8[2]), v12);
  *(float *)&unsigned int v15 = v8->f32[0] + (float)(v12 * (float)(v7->f32[0] - v8->f32[0]));
  float v16 = 1.0 - v12;
  float v17 = v12 * v7[3].f32[0];
  float v18 = v8[3].f32[0];
  v22[0] = (float32x2_t)v15;
  v22[1] = v13;
  v22[2] = v14;
  float v23 = v17 + (float)(v18 * v16);
  int v24 = 0;
  NUNIAstronomyVistaController_ApplyStyleDefinition(v22, v19, v21);
  long long v20 = [(NUNIAstronomyRotationModel *)self->_rotationModel rotatable];
  [v21 offsetCoordinate];
  [v20 homeCoordinate];
  objc_msgSend(v20, "setCenterCoordinate:");
  [v21 updateCamera];
}

- (void)applyTransitionFraction:(double)a3 fromVista:(unint64_t)a4 fromStyleDefinition:(NUNIAegirStyleDefinition)a5 toVista:(unint64_t)a6 toStyleDefinition:(NUNIAegirStyleDefinition)a7
{
  long long v9 = v8;
  uint64_t v10 = v7;
  uint64_t v39 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__NUNIAstronomyVistaController_applyTransitionFraction_fromVista_fromStyleDefinition_toVista_toStyleDefinition___block_invoke;
  aBlock[3] = &__block_descriptor_72_e19_v16__0__NUNIScene_8l;
  long long v14 = *(_OWORD *)(a6 + 16);
  long long v35 = *(_OWORD *)a6;
  long long v36 = v14;
  unint64_t v37 = a4;
  unsigned int v15 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __112__NUNIAstronomyVistaController_applyTransitionFraction_fromVista_fromStyleDefinition_toVista_toStyleDefinition___block_invoke_2;
  v30[3] = &__block_descriptor_72_e19_v16__0__NUNIScene_8l;
  long long v16 = v9[1];
  long long v31 = *v9;
  long long v32 = v16;
  uint64_t v33 = v10;
  float v17 = _Block_copy(v30);
  float v18 = [(NUNIAstronomyVistaView *)self->_vistaView generateAnimationArrayFromVista:a4 fromSceneBlock:v15 toVista:v10 toSceneBlock:v17 transitionStyle:self->_vistaTransitionStyle];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    float v22 = a3;
    float v23 = (float)(v22 * v22) * (float)((float)(v22 * -2.0) + 3.0);
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v18);
        }
        *(float *)&double v20 = v23;
        [*(id *)(*((void *)&v26 + 1) + 8 * v25++) apply:v20];
      }
      while (v21 != v25);
      uint64_t v21 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }
}

void __112__NUNIAstronomyVistaController_applyTransitionFraction_fromVista_fromStyleDefinition_toVista_toStyleDefinition___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v3[0] = *(_OWORD *)(a1 + 32);
  v3[1] = v2;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v3, (uint64_t)a2, a2);
}

void __112__NUNIAstronomyVistaController_applyTransitionFraction_fromVista_fromStyleDefinition_toVista_toStyleDefinition___block_invoke_2(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v3[0] = *(_OWORD *)(a1 + 32);
  v3[1] = v2;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v3, (uint64_t)a2, a2);
}

- (void)startClockUpdates
{
  objc_initWeak(&location, self);
  if (!self->_clockTimerToken)
  {
    v3 = [MEMORY[0x263EFCF88] sharedInstance];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__NUNIAstronomyVistaController_startClockUpdates__block_invoke;
    v6[3] = &unk_2644CDF08;
    objc_copyWeak(&v7, &location);
    uint64_t v4 = [v3 startUpdatesWithUpdateFrequency:0 withHandler:v6 identificationLog:&__block_literal_global_0];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __49__NUNIAstronomyVistaController_startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateTimeAnimated:", objc_msgSend(WeakRetained, "isPreparedForTransitions") ^ 1);
}

__CFString *__49__NUNIAstronomyVistaController_startClockUpdates__block_invoke_13()
{
  return @"astronomy face view";
}

- (void)stopClockUpdates
{
  if (self->_clockTimerToken)
  {
    v3 = [MEMORY[0x263EFCF88] sharedInstance];
    [v3 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)updateLocation:(id)a3 fallbackLocation:(id)a4
{
}

- (void)updateLocation:(id)a3 fallbackLocation:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  vistaView = self->_vistaView;
  id v9 = a4;
  id v10 = a3;
  float v11 = [(NUNIAstronomyVistaView *)vistaView rotatable:0];
  if (v10)
  {
    self->_isFallbackLocation = 0;
    [v10 coordinate];
    objc_msgSend(v11, "setHomeCoordinate:");
    [v10 coordinate];
    objc_msgSend(v11, "setCenterCoordinate:");
    [(NUNIAstronomyVistaController *)self showLocationDotAnimated:v5];
    float v12 = v10;
  }
  else
  {
    self->_isFallbackLocation = 1;
    [v9 coordinate];
    objc_msgSend(v11, "setHomeCoordinate:");
    [v9 coordinate];
    objc_msgSend(v11, "setCenterCoordinate:");
    [(NUNIAstronomyVistaController *)self hideLocationDotAnimated:v5];
    float v12 = v9;
  }
  objc_storeStrong((id *)&self->_currentLocation, v12);

  [(NUNIAstronomyVistaController *)self updateTimeAnimated:v5];
  [(NUNIAstronomyVistaController *)self styleDefinition];
  [(NUNIAstronomyVistaController *)self applyStyleDefinition:&v13];
}

- (void)updateTimeAnimated:(BOOL)a3
{
}

- (void)_handleSpheroidPanGesture:(id)a3
{
  id v4 = a3;
  if (self->_vista == 2 || self->_overrideDate) {
    goto LABEL_17;
  }
  id v25 = v4;
  BOOL v5 = [(NUNIAstronomyRotationModel *)self->_rotationModel rotatable];
  id v6 = [(NUNIAstronomyRotationModel *)self->_rotationModel interactionSettings];
  unint64_t vista = self->_vista;
  if (!vista)
  {
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  if (vista != 2)
  {
    uint64_t v8 = 1;
LABEL_7:
    [(NUNIAstronomyRotationModel *)self->_rotationModel setPulling:v8];
  }
  uint64_t v9 = [v25 state];
  switch(v9)
  {
    case 3:
      rotationModel = self->_rotationModel;
      uint64_t v13 = [v25 view];
      [v25 velocityInView:v13];
      v15.f64[1] = v14;
      [(NUNIAstronomyRotationModel *)rotationModel push:COERCE_DOUBLE(vmul_f32(*(float32x2_t *)&v6->var2, vcvt_f32_f64(v15)))];

      break;
    case 2:
      long long v16 = [v25 view];
      [v25 translationInView:v16];
      v18.f64[1] = v17;
      float32x2_t v19 = vcvt_f32_f64(v18);

      float32x2_t v20 = vsub_f32(*(float32x2_t *)self->_previousTranslation, v19);
      float v21 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v20, v20).i32[1]), v20.f32[0], v20.f32[0]));
      float recentMovement = self->_recentMovement;
      if (recentMovement != 0.0) {
        float v21 = (float)(recentMovement * 0.6) + (float)(v21 * 0.4);
      }
      self->_float recentMovement = v21;
      float32x2_t v23 = vmul_f32(*(float32x2_t *)&v6->var0, v19);
      *(float32x2_t *)self->_previousTranslation = v19;
      float latitude = self->_initialCoordinate.latitude;
      objc_msgSend(v5, "setCenterCoordinate:", NUNIAstronomyClampLatitude(v23.f32[1] + latitude), self->_initialCoordinate.longitude + v23.f32[0]);
      break;
    case 1:
      [(NUNIAstronomyRotationModel *)self->_rotationModel stop];
      [v5 centerCoordinate];
      self->_initialCoordinate.float latitude = v10;
      self->_initialCoordinate.longitude = v11;
      self->_float recentMovement = 0.0;
      *(void *)self->_previousTranslation = 0;
      break;
  }

  id v4 = v25;
LABEL_17:
}

- (void)_handleInteractiveModeGesture:(id)a3
{
  if ([a3 state] != 3) {
    return;
  }
  int64_t mode = self->_mode;
  if ((unint64_t)(mode - 2) >= 2)
  {
    if (mode) {
      goto LABEL_7;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained astronomyVistaControllerWillEnterInteractiveMode:self];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained astronomyVistaControllerWillLeaveInteractiveMode:self];
  }

  int64_t mode = self->_mode;
LABEL_7:
  if (mode)
  {
    [(NUNIAstronomyVistaController *)self _updateFrameInterval];
  }
}

- (void)_handleSupplementalModeGesture:(id)a3
{
  if ([a3 state] != 3 || self->_vista != 2) {
    return;
  }
  int64_t mode = self->_mode;
  if (mode)
  {
    if (mode == 3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained astronomyVistaControllerWillLeaveSupplementalMode:self];
      goto LABEL_9;
    }
    if (mode != 2) {
      return;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained astronomyVistaControllerWillEnterSupplementalMode:self];
LABEL_9:
}

- (void)animateTransitionToMode:(int64_t)a3
{
  int64_t mode = self->_mode;
  if (mode == 1) {
    [(NUNIAstronomyVistaView *)self->_vistaView startAnimation];
  }
  if ((unint64_t)a3 < 2) {
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    if (mode == 3) {
      [(NUNIAstronomyVistaView *)self->_vistaView updateSunLocationAnimated:1];
    }
    [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:1];
    v7[0] = _NUNIAegirStyleInteractiveDefinition;
    v7[1] = unk_21E8F2B68;
    [(NUNIAstronomyVistaController *)self _animateToStyleDefinition:v7];
  }
  else if (a3 == 3)
  {
LABEL_6:
    [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:0];
    [(NUNIAstronomyVistaView *)self->_vistaView updateSunLocationAnimated:1];
    [(NUNIAstronomyVistaController *)self _animateToStyle:self->_style];
  }
  [(UITapGestureRecognizer *)self->_supplementalModeDoubleTapGesture setEnabled:0];
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setEnabled:0];
  if (self->_vista != 2
    && ![(NUNIAstronomyRotationModel *)self->_rotationModel isAtHomeCoordinate])
  {
    [(NUNIAstronomyRotationModel *)self->_rotationModel stop];
    id v6 = [(NUNIAstronomyRotationModel *)self->_rotationModel rotatable];
    [v6 homeCoordinate];
    objc_msgSend(v6, "setCenterCoordinate:animated:", 1);
  }
  [(NUNIAstronomyVistaView *)self->_vistaView showSupplemental:a3 == 3 animated:1];
}

- (void)activeMode
{
  [(NUNIAstronomyVistaView *)self->_vistaView updateSunLocationAnimated:0];
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setEnabled:1];
  [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:0];
  [(NUNIAstronomyVistaController *)self showLocationDotAnimated:0];
  [(NUNIAstronomyVistaController *)self _updateFrameInterval];
  [(NUNIAstronomyVistaView *)self->_vistaView startAnimation];
  [(NUNIAstronomyVistaController *)self startClockUpdates];
}

- (void)deactiveMode
{
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setEnabled:0];
  [(UITapGestureRecognizer *)self->_supplementalModeDoubleTapGesture setEnabled:0];
  [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:0];
  if (!self->_isBacklightTransitionEnabled) {
    [(NUNIAstronomyVistaController *)self hideLocationDotAnimated:0];
  }
  [(NUNIAstronomyVistaController *)self _updateFrameInterval];
  [(NUNIAstronomyVistaView *)self->_vistaView stopAnimation];
  [(NUNIAstronomyVistaController *)self stopClockUpdates];
}

- (void)interactiveMode
{
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setEnabled:1];
  [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:1];
  [(NUNIAstronomyVistaController *)self showLocationDotAnimated:0];
  [(NUNIAstronomyVistaController *)self _updateFrameInterval];
  [(NUNIAstronomyVistaView *)self->_vistaView startAnimation];
  [(NUNIAstronomyVistaController *)self startClockUpdates];
}

- (void)supplementalMode
{
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setEnabled:1];
  [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:0];
  [(NUNIAstronomyVistaController *)self hideLocationDotAnimated:0];
  [(NUNIAstronomyVistaController *)self _updateFrameInterval];
  [(NUNIAstronomyVistaView *)self->_vistaView startAnimation];
  [(NUNIAstronomyVistaController *)self startClockUpdates];
}

- (void)applyMode:(int64_t)a3
{
  self->_int64_t mode = a3;
  switch(a3)
  {
    case 0:
      [(NUNIAstronomyVistaController *)self activeMode];
      break;
    case 1:
      [(NUNIAstronomyVistaController *)self deactiveMode];
      break;
    case 2:
      v5[0] = _NUNIAegirStyleInteractiveDefinition;
      v5[1] = unk_21E8F2B68;
      [(NUNIAstronomyVistaController *)self applyStyleDefinition:v5];
      [(NUNIAstronomyVistaController *)self interactiveMode];
      break;
    case 3:
      [(NUNIAstronomyVistaController *)self supplementalMode];
      break;
    default:
      break;
  }
  [(NUNIAstronomyVistaView *)self->_vistaView applyVista:self->_vista transitionStyle:self->_vistaTransitionStyle];
  [(NUNIAstronomyVistaView *)self->_vistaView showSupplemental:a3 == 3 animated:0];
}

- (BOOL)shouldShowLocationDot
{
  return !self->_forceDisableLocationDot && !self->_isFallbackLocation && self->_vista == 0;
}

- (void)setForceDisableLocationDot:(BOOL)a3
{
  self->_forceDisableLocationDot = a3;
  if (a3) {
    [(NUNIAstronomyVistaController *)self hideLocationDotAnimated:0];
  }
  else {
    [(NUNIAstronomyVistaController *)self showLocationDotAnimated:1];
  }
}

- (void)hideLocationDotAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  id v10 = v5;
  if (v3 && (BOOL v6 = [(NUNIAstronomyVistaController *)self shouldShowLocationDot], v5 = v10, v6))
  {
    id v7 = [[NUNIAnimation alloc] initWithAnimatable:v10 value:8 key:0.0];
    LODWORD(v8) = 1050253722;
    [(NUNIAnimation *)v7 setDuration:v8];
    [v10 addAnimation:v7];
  }
  else
  {
    [v5 removeAllAnimationsFor:v5 withKeys:1792];
    [v10 setLocationDotPulse:0.0];
    LODWORD(v9) = 1.0;
    [v10 setLocationDotPulseOverrideAlpha:v9];
    [v10 setLocationDotAlpha:0.0];
  }
}

- (void)setLocationDotAlpha:(double)a3
{
  id v7 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  BOOL v5 = [(NUNIAstronomyVistaController *)self shouldShowLocationDot];
  *(float *)&double v6 = a3;
  if (!v5) {
    *(float *)&double v6 = 0.0;
  }
  [v7 setLocationDotAlpha:v6];
}

- (void)showLocationDotAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v16 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  if ([(NUNIAstronomyVistaController *)self shouldShowLocationDot])
  {
    if (v3)
    {
      BOOL v5 = [NUNIAnimation alloc];
      __asm { FMOV            V0.4S, #1.0 }
      CLLocationDegrees v11 = [(NUNIAnimation *)v5 initWithAnimatable:v16 value:8 key:*(double *)&_Q0];
      LODWORD(v12) = 1050253722;
      [(NUNIAnimation *)v11 setDuration:v12];
      [v16 addAnimation:v11];

      goto LABEL_7;
    }
    [v16 removeAllAnimationsFor:v16 withKeys:1792];
    [v16 setLocationDotPulse:0.0];
    LODWORD(v15) = 1.0;
    [v16 setLocationDotPulseOverrideAlpha:v15];
    LODWORD(v14) = 1.0;
  }
  else
  {
    [v16 removeAllAnimationsFor:v16 withKeys:1792];
    [v16 setLocationDotPulse:0.0];
    LODWORD(v13) = 1.0;
    [v16 setLocationDotPulseOverrideAlpha:v13];
    double v14 = 0.0;
  }
  [v16 setLocationDotAlpha:v14];
LABEL_7:
}

- (void)pulseLocationDot
{
  id v8 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  if ([(NUNIAstronomyVistaController *)self shouldShowLocationDot])
  {
    BOOL v3 = [NUNIAnimation alloc];
    double numberOfPulses = self->_numberOfPulses;
    *(float *)&double numberOfPulses = numberOfPulses;
    BOOL v5 = [(NUNIAnimation *)v3 initWithAnimatable:v8 value:9 key:*(double *)vdupq_lane_s32(*(int32x2_t *)&numberOfPulses, 0).i64];
    double pulseAnimationDuration = self->_pulseAnimationDuration;
    *(float *)&double pulseAnimationDuration = pulseAnimationDuration;
    [(NUNIAnimation *)v5 setDuration:pulseAnimationDuration];
    [(NUNIAnimation *)v5 setObserver:self];
    [v8 addAnimation:v5];
  }
  else
  {
    [v8 removeAllAnimationsFor:v8 withKeys:1792];
    [v8 setLocationDotPulse:0.0];
    LODWORD(v7) = 1.0;
    [v8 setLocationDotPulseOverrideAlpha:v7];
    [v8 setLocationDotAlpha:0.0];
  }
}

- (void)stopLocationDotPulse
{
  id v3 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  [v3 removeAllAnimationsFor:v3 withKeys:1536];
  [v3 setLocationDotPulse:0.0];
  LODWORD(v2) = 1.0;
  [v3 setLocationDotPulseOverrideAlpha:v2];
}

- (void)hideLocationDotPulse
{
  if ([(NUNIAstronomyVistaController *)self shouldShowLocationDot])
  {
    [(NUNIAstronomyVistaController *)self hideLocationDotAnimated:0];
  }
  else
  {
    id v5 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
    id v3 = [[NUNIAnimation alloc] initWithAnimatable:v5 value:10 key:0.0];
    LODWORD(v4) = 1.0;
    [(NUNIAnimation *)v3 setDuration:v4];
    [(NUNIAnimation *)v3 setObserver:self];
    [v5 addAnimation:v3];
  }
}

- (void)astronomyAnimationFinished:(id)a3
{
  if ((unint64_t)([a3 key] - 8) <= 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pulseAnimationDelegate);
    [WeakRetained pulseAnimationDidFinish];
  }
  if (self->_isAnimatingStyleDefinition)
  {
    p_styleAnimationDelegate = &self->_styleAnimationDelegate;
    id v6 = objc_loadWeakRetained((id *)p_styleAnimationDelegate);

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_styleAnimationDelegate);
      [v7 styleAnimationDidFinish];
    }
  }
}

- (void)applyStyle:(unint64_t)a3
{
  self->_style = a3;
  id v3 = (char *)&_NUNIGetAegirStyleDefinition_earthDefinitions;
  unint64_t vista = self->_vista;
  if (vista == 1) {
    id v3 = (char *)&_NUNIGetAegirStyleDefinition_lunaDefinitions;
  }
  if (vista == 2) {
    id v3 = (char *)&_NUNIGetAegirStyleDefinition_orreryDefinitions;
  }
  id v5 = &v3[32 * a3];
  long long v6 = *((_OWORD *)v5 + 1);
  v7[0] = *(_OWORD *)v5;
  v7[1] = v6;
  [(NUNIAstronomyVistaController *)self applyStyleDefinition:v7];
}

- (void)applyStyleDefinition:(NUNIAegirStyleDefinition)a3
{
  double v4 = v3;
  long long v6 = v3[1];
  *(_OWORD *)&self->_styleDefinition.orbit = *v3;
  *(_OWORD *)&self[1]._vistaView = v6;
  id v10 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  long long v7 = v4[1];
  v11[0] = *v4;
  v11[1] = v7;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v11, v8, v10);
  double v9 = [(NUNIAstronomyRotationModel *)self->_rotationModel rotatable];
  [v9 homeCoordinate];
  objc_msgSend(v9, "setCenterCoordinate:");
  [v10 updateCamera];
}

- (void)_animateToStyle:(unint64_t)a3
{
  id v3 = (char *)&_NUNIGetAegirStyleDefinition_earthDefinitions;
  unint64_t vista = self->_vista;
  if (vista == 1) {
    id v3 = (char *)&_NUNIGetAegirStyleDefinition_lunaDefinitions;
  }
  if (vista == 2) {
    id v3 = (char *)&_NUNIGetAegirStyleDefinition_orreryDefinitions;
  }
  id v5 = &v3[32 * a3];
  long long v6 = *((_OWORD *)v5 + 1);
  v7[0] = *(_OWORD *)v5;
  v7[1] = v6;
  [(NUNIAstronomyVistaController *)self _animateToStyleDefinition:v7];
}

- (void)_animateToStyleDefinition:(NUNIAegirStyleDefinition)a3
{
  long long v4 = v3[1];
  v5[0] = *v3;
  v5[1] = v4;
  [(NUNIAstronomyVistaController *)self animateToStyleDefinition:v5 duration:COERCE_DOUBLE(__PAIR64__(DWORD1(v5[0]), 1.0))];
}

- (void)animateToStyleDefinition:(NUNIAegirStyleDefinition)a3 duration:(float)a4
{
  uint64_t v6 = v4;
  self->_isAnimatingStyleDefinition = 1;
  id v32 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  float32x2_t v8 = *(float32x2_t *)(v6 + 16);
  double v31 = *(double *)(v6 + 8);
  uint64_t v9 = [(NUNIAstronomyVistaController *)self vista];
  id v10 = [v32 spheroidOfType:3];
  if (v10)
  {
    CLLocationDegrees v11 = [NUNIAnimation alloc];
    double v12 = (const float *)(v6 + 24);
    *(void *)&double v13 = vld1q_dup_f32(v12).u64[0];
    double v14 = [(NUNIAnimation *)v11 initWithAnimatable:v10 value:12 key:v13];
    LODWORD(v15) = a3;
    [(NUNIAnimation *)v14 setDuration:v15];
    [v32 addAnimation:v14];
  }
  __asm { FMOV            V1.2S, #-15.0 }
  double v30 = COERCE_DOUBLE(vbsl_s8((int8x8_t)vceqd_s64(v9, 1), (int8x8_t)v8, (int8x8_t)vmul_f32(v8, _D1)));
  float v21 = [NUNIAnimation alloc];
  *(void *)&double v22 = vld1q_dup_f32((const float *)v6).u64[0];
  float32x2_t v23 = [(NUNIAnimation *)v21 initWithAnimatable:v32 value:5 key:v22];
  LODWORD(v24) = a3;
  [(NUNIAnimation *)v23 setDuration:v24];
  [v32 addAnimation:v23];
  id v25 = [[NUNIAnimation alloc] initWithAnimatable:v32 value:6 key:v31];
  LODWORD(v26) = a3;
  [(NUNIAnimation *)v25 setDuration:v26];
  [v32 addAnimation:v25];
  long long v27 = [[NUNIAnimation alloc] initWithAnimatable:v32 value:7 key:v30];
  LODWORD(v28) = a3;
  [(NUNIAnimation *)v27 setDuration:v28];
  [v32 addAnimation:v27];
  long long v29 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)&self->_styleDefinition.orbit = *(_OWORD *)v6;
  *(_OWORD *)&self[1]._vistaView = v29;
}

- (id)generateAnimationToVista:(unint64_t)a3 styleDefinition:(NUNIAegirStyleDefinition)a4
{
  id v5 = v4;
  unint64_t vista = self->_vista;
  uint64_t v9 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  id v10 = [v9 packIntoBlob];
  [(NUNIAstronomyVistaController *)self setVista:a3];
  long long v11 = v5[1];
  v16[0] = *v5;
  v16[1] = v11;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v16, v12, v9);
  [v9 updateCamera];
  double v13 = [v9 packIntoBlob];
  if (self->_vistaTransitionStyle) {
    NUNIAstronomyVistaView_GenerateCarouselAnimationArrayFromSceneBlob(v9, v10, v13);
  }
  else {
  double v14 = NUNIAstronomyVistaView_GenerateZoomAnimationArrayFromSceneBlob(v9, v10, v13);
  }
  [v9 unpackFromBlob:v10];
  self->_unint64_t vista = vista;

  return v14;
}

- (void)animateToVista:(unint64_t)a3 styleDefinition:(NUNIAegirStyleDefinition)a4 duration:(float)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v9 = v5[1];
  v23[0] = *v5;
  v23[1] = v9;
  id v10 = [(NUNIAstronomyVistaController *)self generateAnimationToVista:a3 styleDefinition:v23];
  long long v11 = [(NUNIAstronomyVistaView *)self->_vistaView scene];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v12);
        }
        float64x2_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        LODWORD(v14) = a4;
        objc_msgSend(v18, "setDuration:", v14, (void)v19);
        [v11 addAnimation:v18];
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v15);
  }

  self->_unint64_t vista = a3;
}

- (void)setOverrideDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(NUNIAstronomyVistaController *)self setOverrideDate:a3];
  vistaView = self->_vistaView;
  [(NUNIAstronomyVistaView *)vistaView updateSunLocationAnimated:v4];
}

- (NUNIAstronomyVistaControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NUNIAstronomyVistaControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NUNIAstronomyRotationModel)rotationModel
{
  return self->_rotationModel;
}

- (UIPanGestureRecognizer)spheroidPanGesture
{
  return self->_spheroidPanGesture;
}

- (UITapGestureRecognizer)supplementalModeDoubleTapGesture
{
  return self->_supplementalModeDoubleTapGesture;
}

- (UITapGestureRecognizer)interactiveModeTapGesture
{
  return self->_interactiveModeTapGesture;
}

- (int64_t)mode
{
  return self->_mode;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NUNIAegirStyleDefinition)styleDefinition
{
  long long v3 = *(_OWORD *)&self->_styleDefinition.orbit;
  long long v4 = *(_OWORD *)&self[1]._vistaView;
  *double v2 = v3;
  v2[1] = v4;
  return (NUNIAegirStyleDefinition)v3;
}

- (NUNIAstronomyStyleAnimationDelegate)styleAnimationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleAnimationDelegate);
  return (NUNIAstronomyStyleAnimationDelegate *)WeakRetained;
}

- (void)setStyleAnimationDelegate:(id)a3
{
}

- (NUNIAstronomyPulseAnimationDelegate)pulseAnimationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pulseAnimationDelegate);
  return (NUNIAstronomyPulseAnimationDelegate *)WeakRetained;
}

- (void)setPulseAnimationDelegate:(id)a3
{
}

- (BOOL)forceDisableLocationDot
{
  return self->_forceDisableLocationDot;
}

- (unint64_t)vista
{
  return self->_vista;
}

- (unint64_t)vistaTransitionStyle
{
  return self->_vistaTransitionStyle;
}

- (void)setVistaTransitionStyle:(unint64_t)a3
{
  self->_vistaTransitionStyle = a3;
}

- (BOOL)isBacklightTransitionEnabled
{
  return self->_isBacklightTransitionEnabled;
}

- (void)setIsBacklightTransitionEnabled:(BOOL)a3
{
  self->_isBacklightTransitionEnabled = a3;
}

- (int64_t)activeModeFrameInterval
{
  return self->_activeModeFrameInterval;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (BOOL)isPreparedForTransitions
{
  return self->_preparedForTransitions;
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (double)numberOfPulses
{
  return self->_numberOfPulses;
}

- (void)setNumberOfPulses:(double)a3
{
  self->_double numberOfPulses = a3;
}

- (double)pulseAnimationDuration
{
  return self->_pulseAnimationDuration;
}

- (void)setPulseAnimationDuration:(double)a3
{
  self->_double pulseAnimationDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_destroyWeak((id *)&self->_pulseAnimationDelegate);
  objc_destroyWeak((id *)&self->_styleAnimationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_interactiveModeTapGesture, 0);
  objc_storeStrong((id *)&self->_supplementalModeDoubleTapGesture, 0);
  objc_storeStrong((id *)&self->_spheroidPanGesture, 0);
  objc_storeStrong((id *)&self->_rotationModel, 0);
  for (uint64_t i = 104; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_vistaView, 0);
}

@end