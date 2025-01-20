@interface SBUIFlashlightController
+ (BOOL)deviceSupportsFlashlight;
+ (id)sharedInstance;
- (BOOL)deviceSupportsDynamicFlashlightInterface;
- (BOOL)isAvailable;
- (BOOL)isBeamWidthSupported;
- (BOOL)isOverheated;
- (SBUIFlashlightController)init;
- (SBUIFlashlightController)initWithFlashlight:(id)a3;
- (float)intensity;
- (float)width;
- (int)_hasRunningFlashlightAnimation;
- (unint64_t)__pendingPowerChange;
- (unint64_t)_loadFlashlightLevel;
- (unint64_t)level;
- (void)_applyPowerChange:(unint64_t)a3;
- (void)_beginFlashlightAnimation;
- (void)_endFlashlightAnimation;
- (void)_loadFlashlightIntensity:(float *)a3 width:(float *)a4;
- (void)_postAvailabilityChangeNotification:(BOOL)a3;
- (void)_postLevelChangeNotification:(unint64_t)a3;
- (void)_postOverheatedChangeNotification:(BOOL)a3;
- (void)_setFlashlightBeamWidth:(float)a3;
- (void)_setFlashlightLevel:(float)a3;
- (void)_setIntensity:(double)a3;
- (void)_setIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5 withPowerChange:(unint64_t)a6;
- (void)_storeFlashlightLevel:(unint64_t)a3;
- (void)_turnPowerOff;
- (void)_turnPowerOn;
- (void)_updateLevelForIntensityChange;
- (void)_updateObservedAvailability:(BOOL)a3 isOverheated:(BOOL)a4;
- (void)_updateObservedBeamWidth:(float)a3;
- (void)_updateObservedFlashlightLevel:(float)a3;
- (void)addObserver:(id)a3;
- (void)coolDown;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllObservers;
- (void)removeObserver:(id)a3;
- (void)setIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5;
- (void)setLevel:(unint64_t)a3;
- (void)storeFlashlightIntensity:(float)a3 width:(float)a4;
- (void)turnFlashlightOffForReason:(id)a3;
- (void)turnFlashlightOffForReason:(id)a3 withCoolDown:(BOOL)a4;
- (void)turnFlashlightOnForReason:(id)a3;
- (void)warmUp;
@end

@implementation SBUIFlashlightController

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (observeValueForKeyPath_ofObject_change_context__onceToken != -1) {
    dispatch_once(&observeValueForKeyPath_ofObject_change_context__onceToken, &__block_literal_global_32);
  }
  if (![(id)observeValueForKeyPath_ofObject_change_context__flashlightKVOKeySet containsObject:v10])goto LABEL_8; {
  if (dispatch_queue_get_label(0) != "com.apple.ControlCenter.FlashlightModule.AVFlashlight")
  }
  {
    if ([(SBUIFlashlightController *)self _hasRunningFlashlightAnimation])
    {
      v13 = CCUILogFlashlightModule;
      if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v10;
        _os_log_impl(&dword_2218C9000, v13, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] Ignoring KVO change during flashlight animation for %@", buf, 0xCu);
      }
      goto LABEL_48;
    }
LABEL_8:
    if ([v10 isEqualToString:@"flashlightLevel"])
    {
      v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
      uint64_t v15 = objc_opt_class();
      id v16 = v14;
      if (v15)
      {
        if (objc_opt_isKindOfClass()) {
          v17 = v16;
        }
        else {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
      id v26 = v17;

      if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEBUG)) {
        -[SBUIFlashlightController observeValueForKeyPath:ofObject:change:context:]();
      }
      [v26 floatValue];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_35;
      v46[3] = &unk_2645D40E0;
      v46[4] = self;
      int v47 = v27;
      v28 = MEMORY[0x263EF83A0];
      v29 = v46;
    }
    else if ([v10 isEqualToString:@"beamWidth"])
    {
      v18 = [v12 objectForKey:*MEMORY[0x263F081B8]];
      uint64_t v19 = objc_opt_class();
      id v20 = v18;
      if (v19)
      {
        if (objc_opt_isKindOfClass()) {
          v21 = v20;
        }
        else {
          v21 = 0;
        }
      }
      else
      {
        v21 = 0;
      }
      id v26 = v21;

      if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEBUG)) {
        -[SBUIFlashlightController observeValueForKeyPath:ofObject:change:context:]();
      }
      [v26 floatValue];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_36;
      v44[3] = &unk_2645D40E0;
      v44[4] = self;
      int v45 = v34;
      v28 = MEMORY[0x263EF83A0];
      v29 = v44;
    }
    else if ([v10 isEqualToString:@"available"])
    {
      v22 = [v12 objectForKey:*MEMORY[0x263F081B8]];
      uint64_t v23 = objc_opt_class();
      id v24 = v22;
      if (v23)
      {
        if (objc_opt_isKindOfClass()) {
          v25 = v24;
        }
        else {
          v25 = 0;
        }
      }
      else
      {
        v25 = 0;
      }
      id v26 = v25;

      v35 = CCUILogFlashlightModule;
      if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v26;
        _os_log_impl(&dword_2218C9000, v35, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] observed available change to: %@", buf, 0xCu);
      }
      char v36 = [v26 BOOLValue];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_37;
      v42[3] = &unk_2645D4108;
      v42[4] = self;
      char v43 = v36;
      v28 = MEMORY[0x263EF83A0];
      v29 = v42;
    }
    else
    {
      if (![v10 isEqualToString:@"overheated"])
      {
        v39.receiver = self;
        v39.super_class = (Class)SBUIFlashlightController;
        [(SBUIFlashlightController *)&v39 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
        goto LABEL_48;
      }
      v30 = [v12 objectForKey:*MEMORY[0x263F081B8]];
      uint64_t v31 = objc_opt_class();
      id v32 = v30;
      if (v31)
      {
        if (objc_opt_isKindOfClass()) {
          v33 = v32;
        }
        else {
          v33 = 0;
        }
      }
      else
      {
        v33 = 0;
      }
      id v26 = v33;

      v37 = CCUILogFlashlightModule;
      if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v26;
        _os_log_impl(&dword_2218C9000, v37, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] observed overheated change to: %@", buf, 0xCu);
      }
      char v38 = [v26 BOOLValue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_38;
      block[3] = &unk_2645D4108;
      block[4] = self;
      char v41 = v38;
      v28 = MEMORY[0x263EF83A0];
      v29 = block;
    }
    dispatch_async(v28, v29);

    goto LABEL_48;
  }
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEBUG)) {
    -[SBUIFlashlightController observeValueForKeyPath:ofObject:change:context:]();
  }
LABEL_48:
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (BOOL)isOverheated
{
  return self->_overheated;
}

double __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_2_45(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  double v3 = *(float *)(a1 + 40);
  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_37(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [v1[1] isOverheated];

  return [v1 _updateObservedAvailability:v2 isOverheated:v3];
}

- (unint64_t)level
{
  float intensity = self->_intensity;
  if (intensity == 0.0) {
    return 0;
  }
  if (intensity < 0.5) {
    return 1;
  }
  if (intensity < 0.85) {
    return 2;
  }
  if (intensity >= 1.0) {
    return 4;
  }
  return 3;
}

uint64_t __41__SBUIFlashlightController__turnPowerOff__block_invoke(uint64_t a1)
{
  uint64_t v2 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2218C9000, v2, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] Power Off", v4, 2u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) turnPowerOff];
}

void __48__SBUIFlashlightController__setFlashlightLevel___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  id v5 = 0;
  char v3 = [v2 setFlashlightLevel:&v5 withError:a2];
  id v4 = v5;
  if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_ERROR)) {
    __48__SBUIFlashlightController__setFlashlightLevel___block_invoke_cold_1();
  }
}

uint64_t __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_44(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_2_45;
  v3[3] = &__block_descriptor_44_e9_v16__0_d8l;
  v3[4] = *(void *)(a1 + 40);
  int v4 = *(_DWORD *)(a1 + 48);
  return [v1 _mutateValue:v3];
}

- (void)_updateObservedAvailability:(BOOL)a3 isOverheated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL overheated = self->_overheated;
  if (overheated != a4) {
    self->_BOOL overheated = a4;
  }
  uint64_t v7 = a3 & ~a4;
  int available = self->_available;
  if (available != v7)
  {
    self->_int available = a3 & ~a4;
    if ((a3 & ~a4 & 1) == 0)
    {
      v9 = CCUILogFlashlightModule;
      if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_2218C9000, v9, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] Flashlight became unavailable", v10, 2u);
      }
      [(SBUIFlashlightController *)self _setIntensity:0 width:2 animated:0.0 withPowerChange:self->_width];
    }
  }
  if (overheated != v4) {
    [(SBUIFlashlightController *)self _postOverheatedChangeNotification:v4];
  }
  if (available != v7) {
    [(SBUIFlashlightController *)self _postAvailabilityChangeNotification:v7];
  }
}

- (void)_setIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5 withPowerChange:(unint64_t)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  double v11 = fmin(fmax(a3, 0.0), 1.0);
  double v12 = fmin(fmax(a4, 0.0), 1.0);
  float v13 = v11;
  self->_float intensity = v13;
  self->_pendingPowerChange = a6;
  if (self->_beamWidthSupported) {
    float maxBeamWidth = v12 * self->_maxBeamWidth + (1.0 - v12) * self->_minBeamWidth;
  }
  else {
    float maxBeamWidth = self->_maxBeamWidth;
  }
  float v15 = v12;
  self->_width = v15;
  [(SBUIFlashlightController *)self _updateLevelForIntensityChange];
  id v16 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219264;
    double v26 = a3;
    __int16 v27 = 2048;
    double v28 = v11;
    __int16 v29 = 2048;
    double v30 = a4;
    __int16 v31 = 2048;
    double v32 = maxBeamWidth;
    __int16 v33 = 1024;
    BOOL v34 = v7;
    __int16 v35 = 2048;
    unint64_t v36 = a6;
    _os_log_debug_impl(&dword_2218C9000, v16, OS_LOG_TYPE_DEBUG, "[Flashlight Controller] _setIntensity:%0.3f(%0.3f) width:%0.3f(%0.3f) animated:%{BOOL}u withPowerChange:%lu", buf, 0x3Au);
  }
  if (!v7)
  {
    if (self->_dynamicInterfaceEnabled)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_44;
      v20[3] = &unk_2645D4150;
      v20[4] = self;
      *(double *)&v20[5] = v11;
      float v21 = maxBeamWidth;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v20];
      if (!a6) {
        return;
      }
LABEL_15:
      [(SBUIFlashlightController *)self _applyPowerChange:a6];
      return;
    }
LABEL_14:
    *(float *)&double v17 = v11;
    [(SBUIFlashlightController *)self _setFlashlightLevel:v17];
    if (!a6) {
      return;
    }
    goto LABEL_15;
  }
  if (!self->_dynamicInterfaceEnabled) {
    goto LABEL_14;
  }
  int animationCount = self->_animationCount;
  self->_int animationCount = animationCount + 1;
  if (!animationCount) {
    [(SBUIFlashlightController *)self _beginFlashlightAnimation];
  }
  springBehavior = self->_springBehavior;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke;
  v23[3] = &unk_2645D4150;
  v23[4] = self;
  *(double *)&v23[5] = v11;
  float v24 = maxBeamWidth;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_3;
  v22[3] = &unk_2645D4178;
  v22[4] = self;
  v22[5] = a6;
  [MEMORY[0x263F1CB60] _animateUsingSpringBehavior:springBehavior tracking:0 animations:v23 completion:v22];
}

- (void)_updateLevelForIntensityChange
{
  float intensity = self->_intensity;
  if (intensity == 0.0)
  {
    unint64_t v4 = 0;
  }
  else if (intensity >= 0.5)
  {
    uint64_t v5 = 4;
    if (intensity < 1.0) {
      uint64_t v5 = 3;
    }
    if (intensity >= 0.85) {
      unint64_t v4 = v5;
    }
    else {
      unint64_t v4 = 2;
    }
  }
  else
  {
    unint64_t v4 = 1;
  }
  if (self->_level != v4)
  {
    self->_level = v4;
    [(SBUIFlashlightController *)self _postLevelChangeNotification:v4];
    if (!self->_dynamicInterfaceEnabled)
    {
      [(SBUIFlashlightController *)self _storeFlashlightLevel:v4];
    }
  }
}

- (void)_postAvailabilityChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v17 = v3;
    _os_log_impl(&dword_2218C9000, v5, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] posting available change to: %u", buf, 8u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) flashlightAvailabilityDidChange:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_applyPowerChange:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_2218C9000, v5, OS_LOG_TYPE_DEFAULT, "Applying power change: %lu", (uint8_t *)&v6, 0xCu);
  }
  if (a3 == 2)
  {
    [(SBUIFlashlightController *)self _turnPowerOff];
  }
  else if (a3 == 1)
  {
    [(SBUIFlashlightController *)self _setFlashlightLevel:0.0];
  }
  self->_pendingPowerChange = 0;
}

- (void)_turnPowerOff
{
  [(SBUIFlashlightController *)self _setFlashlightLevel:0.0];
  flashlightQueue = self->_flashlightQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SBUIFlashlightController__turnPowerOff__block_invoke;
  block[3] = &unk_2645D3CD0;
  block[4] = self;
  dispatch_async(flashlightQueue, block);
}

- (void)_setFlashlightLevel:(float)a3
{
  flashlightQueue = self->_flashlightQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SBUIFlashlightController__setFlashlightLevel___block_invoke;
  v4[3] = &unk_2645D40E0;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(flashlightQueue, v4);
}

+ (BOOL)deviceSupportsFlashlight
{
  return [MEMORY[0x263EFA710] hasFlashlight];
}

- (BOOL)deviceSupportsDynamicFlashlightInterface
{
  uint64_t v2 = SBFEffectiveArtworkSubtype();
  if (v2 > 2795)
  {
    if (v2 != 2868 && v2 != 2796) {
      return 0;
    }
  }
  else if (v2 != 2556 && v2 != 2622)
  {
    return 0;
  }

  return MEMORY[0x270ED8070]("SpringBoard", "DynamicFlashlight");
}

- (void)dealloc
{
  [(AVFlashlight *)self->_flashlight removeObserver:self forKeyPath:@"available"];
  [(AVFlashlight *)self->_flashlight removeObserver:self forKeyPath:@"overheated"];
  [(AVFlashlight *)self->_flashlight removeObserver:self forKeyPath:@"flashlightLevel"];
  if (self->_beamWidthSupported) {
    [(AVFlashlight *)self->_flashlight removeObserver:self forKeyPath:@"beamWidth"];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBUIFlashlightController;
  [(SBUIFlashlightController *)&v3 dealloc];
}

- (SBUIFlashlightController)init
{
  id v3 = objc_alloc_init(MEMORY[0x263EFA710]);
  unint64_t v4 = [(SBUIFlashlightController *)self initWithFlashlight:v3];

  return v4;
}

- (SBUIFlashlightController)initWithFlashlight:(id)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SBUIFlashlightController;
  int v6 = [(SBUIFlashlightController *)&v42 init];
  unint64_t v7 = v6;
  if (!v6) {
    goto LABEL_26;
  }
  *(void *)&v6->_lock._os_unfair_lock_opaque = 0;
  p_flashlight = (id *)&v6->_flashlight;
  objc_storeStrong((id *)&v6->_flashlight, a3);
  [*p_flashlight addObserver:v7 forKeyPath:@"available" options:1 context:0];
  [*p_flashlight addObserver:v7 forKeyPath:@"overheated" options:1 context:0];
  [*p_flashlight addObserver:v7 forKeyPath:@"flashlightLevel" options:1 context:0];
  v7->_BOOL overheated = [*p_flashlight isOverheated];
  if ([*p_flashlight isAvailable]) {
    BOOL v9 = !v7->_overheated;
  }
  else {
    BOOL v9 = 0;
  }
  v7->_int available = v9;
  [(AVFlashlight *)v7->_flashlight flashlightLevel];
  v7->_float intensity = v10;
  if (v10 == 0.0)
  {
    uint64_t v11 = 0;
  }
  else if (v10 >= 0.5)
  {
    uint64_t v11 = 2;
    uint64_t v12 = 4;
    if (v10 < 1.0) {
      uint64_t v12 = 3;
    }
    if (v10 >= 0.85) {
      uint64_t v11 = v12;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }
  v7->_level = v11;
  long long v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  long long v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v15 = dispatch_queue_create("com.apple.ControlCenter.FlashlightModule.AVFlashlight", v14);
  flashlightQueue = v7->_flashlightQueue;
  v7->_flashlightQueue = (OS_dispatch_queue *)v15;

  if (!CCUILogFlashlightModule)
  {
    os_log_t v17 = os_log_create("com.apple.ControlCenter", "Flashlight");
    uint64_t v18 = (void *)CCUILogFlashlightModule;
    CCUILogFlashlightModule = (uint64_t)v17;
  }
  if (![(SBUIFlashlightController *)v7 deviceSupportsDynamicFlashlightInterface])
  {
    p_beamWidthSupported = &v7->_beamWidthSupported;
    goto LABEL_21;
  }
  int v19 = [(AVFlashlight *)v7->_flashlight beamWidthControlSupported];
  v7->_beamWidthSupported = v19;
  p_beamWidthSupported = &v7->_beamWidthSupported;
  if (!v19)
  {
LABEL_22:
    *(void *)&v7->_minBeamWidth = 0x3F80000000000000;
    v7->_width = 1.0;
    float v24 = 1.0;
    goto LABEL_23;
  }
  [(AVFlashlight *)v7->_flashlight minBeamWidth];
  v7->_minBeamWidth = v21;
  [(AVFlashlight *)v7->_flashlight maxBeamWidth];
  v7->_float maxBeamWidth = v22;
  if (v22 == v7->_minBeamWidth)
  {
LABEL_21:
    BOOL *p_beamWidthSupported = 0;
    goto LABEL_22;
  }
  [(AVFlashlight *)v7->_flashlight addObserver:v7 forKeyPath:@"beamWidth" options:1 context:0];
  [(AVFlashlight *)v7->_flashlight beamWidth];
  float v24 = v23;
  float v25 = fmax(fmin((v23 - v7->_minBeamWidth) / (v7->_maxBeamWidth - v7->_minBeamWidth), 1.0), 0.0);
  v7->_width = v25;
  if (!v7->_beamWidthSupported) {
    goto LABEL_22;
  }
LABEL_23:
  BOOL v26 = [(SBUIFlashlightController *)v7 deviceSupportsDynamicFlashlightInterface];
  v7->_dynamicInterfaceEnabled = v26;
  if (v26)
  {
    uint64_t v27 = [MEMORY[0x263F1CB80] behaviorWithDampingRatio:1.0 response:0.3];
    springBehavior = v7->_springBehavior;
    v7->_springBehavior = (UIViewSpringAnimationBehavior *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x263F1CB88]) initWithLength:2];
    animatableProperties = v7->_animatableProperties;
    v7->_animatableProperties = (UIViewVectorAnimatableProperty *)v29;

    __int16 v31 = v7->_animatableProperties;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __47__SBUIFlashlightController_initWithFlashlight___block_invoke;
    v39[3] = &unk_2645D4090;
    double v32 = v7;
    v40 = v32;
    float v41 = v24;
    [(UIViewVectorAnimatableProperty *)v31 _mutateValue:v39];
    objc_initWeak(&location, v32);
    __int16 v33 = (void *)MEMORY[0x263F1CB60];
    v43[0] = v7->_animatableProperties;
    BOOL v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __47__SBUIFlashlightController_initWithFlashlight___block_invoke_2;
    v36[3] = &unk_2645D40B8;
    objc_copyWeak(&v37, &location);
    [v33 _createTransformerWithInputAnimatableProperties:v34 presentationValueChangedCallback:v36];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
LABEL_26:

  return v7;
}

double __47__SBUIFlashlightController_initWithFlashlight___block_invoke(uint64_t a1, double *a2)
{
  double result = *(float *)(*(void *)(a1 + 32) + 108);
  double v3 = *(float *)(a1 + 40);
  *a2 = result;
  a2[1] = v3;
  return result;
}

void __47__SBUIFlashlightController_initWithFlashlight___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v2 = [WeakRetained[9] _presentationValue];
    double v3 = *(double *)v2;
    *(float *)&double v3 = *(double *)v2;
    [v5 _setFlashlightLevel:v3];
    double v4 = *(double *)(v2 + 8);
    *(float *)&double v4 = v4;
    [v5 _setFlashlightBeamWidth:v4];
    WeakRetained = v5;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)sharedInstance__instance;

  return v2;
}

uint64_t __42__SBUIFlashlightController_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance__instance;
  sharedInstance__instance = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)turnFlashlightOnForReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float intensity = self->_intensity;
  int v6 = CCUILogFlashlightModule;
  BOOL v7 = os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT);
  if (intensity <= 0.0)
  {
    if (v7)
    {
      *(float *)buf = 5.7779e-34;
      id v10 = v4;
      _os_log_impl(&dword_2218C9000, v6, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] turnFlashlightOnForReason: %@", buf, 0xCu);
    }
    if (self->_dynamicInterfaceEnabled)
    {
      float v8 = 0.0;
      *(float *)buf = 0.0;
      [(SBUIFlashlightController *)self _loadFlashlightIntensity:buf width:&v8];
      [(SBUIFlashlightController *)self _setIntensity:1 width:0 animated:*(float *)buf withPowerChange:v8];
    }
    else
    {
      [(SBUIFlashlightController *)self setLevel:[(SBUIFlashlightController *)self _loadFlashlightLevel]];
    }
  }
  else if (v7)
  {
    *(float *)buf = 5.7779e-34;
    id v10 = v4;
    _os_log_impl(&dword_2218C9000, v6, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] Already turned on, got redundant request: %@", buf, 0xCu);
  }
}

- (void)turnFlashlightOffForReason:(id)a3
{
}

- (void)turnFlashlightOffForReason:(id)a3 withCoolDown:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v6 = (__CFString *)a3;
  unint64_t pendingPowerChange = self->_pendingPowerChange;
  float v8 = CCUILogFlashlightModule;
  BOOL v9 = os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT);
  if (pendingPowerChange)
  {
    if (v9)
    {
      int v12 = 138412290;
      long long v13 = v6;
      _os_log_impl(&dword_2218C9000, v8, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] Already turning off, got redundant request: %@", (uint8_t *)&v12, 0xCu);
    }
    if (v4) {
      self->_unint64_t pendingPowerChange = 2;
    }
  }
  else
  {
    if (v9)
    {
      id v10 = &stru_26D3ED7F8;
      if (v4) {
        id v10 = @" (with coolDown)";
      }
      int v12 = 138412546;
      long long v13 = v10;
      __int16 v14 = 2112;
      dispatch_queue_t v15 = v6;
      _os_log_impl(&dword_2218C9000, v8, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] turnFlashlightOffForReason%@: %@", (uint8_t *)&v12, 0x16u);
    }
    if (v4) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    if (self->_intensity <= 0.0) {
      [(SBUIFlashlightController *)self _applyPowerChange:v11];
    }
    else {
      [(SBUIFlashlightController *)self _setIntensity:1 width:v11 animated:0.0 withPowerChange:self->_width];
    }
  }
}

- (void)setLevel:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    unint64_t v8 = a3;
    _os_log_impl(&dword_2218C9000, v5, OS_LOG_TYPE_INFO, "[Flashlight Controller] setLevel: %lu", (uint8_t *)&v7, 0xCu);
  }
  double v6 = 0.0;
  if (a3 - 1 <= 3) {
    double v6 = dbl_2218E4718[a3 - 1];
  }
  [(SBUIFlashlightController *)self _setIntensity:v6];
}

- (void)setIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
}

- (void)warmUp
{
  double v3 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2218C9000, v3, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] warmUp", v4, 2u);
  }
  [(SBUIFlashlightController *)self _turnPowerOn];
}

- (void)coolDown
{
  double v3 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2218C9000, v3, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] coolDown", v4, 2u);
  }
  if (self->_intensity <= 0.0)
  {
    if (self->_pendingPowerChange) {
      self->_unint64_t pendingPowerChange = 2;
    }
    else {
      [(SBUIFlashlightController *)self _turnPowerOff];
    }
  }
  else
  {
    [(SBUIFlashlightController *)self _setIntensity:0 width:2 animated:0.0 withPowerChange:self->_width];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    double v6 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    int v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)removeAllObservers
{
}

uint64_t __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"flashlightLevel", @"beamWidth", 0);
  uint64_t v1 = observeValueForKeyPath_ofObject_change_context__flashlightKVOKeySet;
  observeValueForKeyPath_ofObject_change_context__flashlightKVOKeySet = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_35(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) _updateObservedFlashlightLevel:a2];
}

uint64_t __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_36(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) _updateObservedBeamWidth:a2];
}

uint64_t __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_38(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = [v2[1] isAvailable];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v2 _updateObservedAvailability:v3 isOverheated:v4];
}

- (void)_updateObservedFlashlightLevel:(float)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = a3;
    _os_log_impl(&dword_2218C9000, v5, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] Got KVO intensity change to: %f", (uint8_t *)&v6, 0xCu);
  }
  if (self->_intensity != a3)
  {
    self->_float intensity = a3;
    [(SBUIFlashlightController *)self _updateLevelForIntensityChange];
  }
}

- (void)_updateObservedBeamWidth:(float)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_beamWidthSupported)
  {
    double minBeamWidth = self->_minBeamWidth;
    double maxBeamWidth = self->_maxBeamWidth;
    float v6 = self->_width * maxBeamWidth + (1.0 - self->_width) * minBeamWidth;
    if (v6 != a3)
    {
      double v7 = a3;
      float v8 = fmax(fmin((a3 - minBeamWidth) / (maxBeamWidth - minBeamWidth), 1.0), 0.0);
      self->_double width = v8;
      uint64_t v9 = CCUILogFlashlightModule;
      if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
      {
        double width = self->_width;
        int v11 = 134218240;
        double v12 = width;
        __int16 v13 = 2048;
        double v14 = v7;
        _os_log_impl(&dword_2218C9000, v9, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] Got KVO width change to: %f beamWidth: %f", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (void)_postOverheatedChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v18 = v3;
    _os_log_impl(&dword_2218C9000, v5, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] posting overheated change to: %u", buf, 8u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  float v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 flashlightOverheatedDidChange:v3];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_postLevelChangeNotification:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v17 = a3;
    _os_log_impl(&dword_2218C9000, v5, OS_LOG_TYPE_INFO, "[Flashlight Controller] posting level change to: %lu", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  float v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) flashlightLevelDidChange:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_setIntensity:(double)a3
{
}

uint64_t __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 72);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_2;
  v3[3] = &__block_descriptor_44_e9_v16__0_d8l;
  v3[4] = *(void *)(a1 + 40);
  int v4 = *(_DWORD *)(a1 + 48);
  return [v1 _mutateValue:v3];
}

double __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_2(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  double v3 = *(float *)(a1 + 40);
  *a2 = result;
  a2[1] = v3;
  return result;
}

void __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1 + 32;
  --*(_DWORD *)(*(void *)(a1 + 32) + 80);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 80))
  {
    int v4 = *(NSObject **)(v2 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_4;
    block[3] = &unk_2645D3CD0;
    block[4] = v2;
    dispatch_async(v4, block);
    id v5 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEBUG)) {
      __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_3_cold_1(v1, v5, v6, v7, v8, v9, v10, v11);
    }
    long long v12 = *(float **)v1;
    if (*(void *)(*(void *)v1 + 88))
    {
      if (v12[27] == 0.0)
      {
        objc_msgSend(v12, "_applyPowerChange:");
      }
      else
      {
        long long v13 = CCUILogFlashlightModule;
        if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 40);
          double v15 = *(float *)(*(void *)(a1 + 32) + 108);
          *(_DWORD *)buf = 134218240;
          uint64_t v18 = v14;
          __int16 v19 = 2048;
          double v20 = v15;
          _os_log_impl(&dword_2218C9000, v13, OS_LOG_TYPE_DEFAULT, "Aborting requested power change (%lu) because intensity is nonzero: %0.3f", buf, 0x16u);
        }
        *(void *)(*(void *)v1 + 88) = 0;
      }
    }
  }
}

uint64_t __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endFlashlightAnimation];
}

- (void)_beginFlashlightAnimation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_lock_flashlightAnimationCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)_endFlashlightAnimation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  --self->_lock_flashlightAnimationCount;

  os_unfair_lock_unlock(p_lock);
}

- (int)_hasRunningFlashlightAnimation
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_lock_flashlightAnimationCount;
  os_unfair_lock_unlock(p_lock);
  return (int)v2 > 0;
}

- (void)_setFlashlightBeamWidth:(float)a3
{
  if (self->_beamWidthSupported)
  {
    float v3 = fmaxf(self->_minBeamWidth, fminf(a3, self->_maxBeamWidth));
    flashlightQueue = self->_flashlightQueue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__SBUIFlashlightController__setFlashlightBeamWidth___block_invoke;
    v5[3] = &unk_2645D40E0;
    v5[4] = self;
    float v6 = v3;
    dispatch_async(flashlightQueue, v5);
  }
}

uint64_t __52__SBUIFlashlightController__setFlashlightBeamWidth___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 8) setBeamWidth:a2];
}

- (void)_turnPowerOn
{
  float v3 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218C9000, v3, OS_LOG_TYPE_DEFAULT, "[Flashlight Controller] Power On", buf, 2u);
  }
  flashlightQueue = self->_flashlightQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SBUIFlashlightController__turnPowerOn__block_invoke;
  block[3] = &unk_2645D3CD0;
  block[4] = self;
  dispatch_async(flashlightQueue, block);
}

void __40__SBUIFlashlightController__turnPowerOn__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = 0;
  char v2 = [v1 turnPowerOnWithError:&v4];
  id v3 = v4;
  if ((v2 & 1) == 0 && os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_ERROR)) {
    __40__SBUIFlashlightController__turnPowerOn__block_invoke_cold_1();
  }
}

- (void)_storeFlashlightLevel:(unint64_t)a3
{
  if (a3)
  {
    id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 setInteger:a3 forKey:@"FlashlightLevel"];
  }
}

- (unint64_t)_loadFlashlightLevel
{
  char v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  unint64_t v3 = [v2 integerForKey:@"FlashlightLevel"];

  if (v3 - 1 >= 4) {
    return SBUIFlashlightLevelDefault;
  }
  else {
    return v3;
  }
}

- (void)storeFlashlightIntensity:(float)a3 width:(float)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3 > 0.0)
  {
    double v7 = a3;
    uint64_t v8 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      int v15 = 134218240;
      double v16 = v7;
      __int16 v17 = 2048;
      double v18 = a4;
      _os_log_impl(&dword_2218C9000, v8, OS_LOG_TYPE_INFO, "[Flashlight Controller] Persisting intensity: %f, width: %f", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    *(float *)&double v10 = a3;
    [v9 setFloat:@"FlashlightIntensity" forKey:v10];

    if (a3 == 0.0)
    {
      uint64_t v11 = 0;
    }
    else if (a3 >= 0.5)
    {
      uint64_t v12 = 4;
      if (a3 < 1.0) {
        uint64_t v12 = 3;
      }
      if (v7 >= 0.85) {
        uint64_t v11 = v12;
      }
      else {
        uint64_t v11 = 2;
      }
    }
    else
    {
      uint64_t v11 = 1;
    }
    [(SBUIFlashlightController *)self _storeFlashlightLevel:v11];
    long long v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    *(float *)&double v14 = a4;
    [v13 setFloat:@"FlashlightWidth" forKey:v14];
  }
}

- (void)_loadFlashlightIntensity:(float *)a3 width:(float *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  float v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v7 = v6;
  if (a3)
  {
    uint64_t v8 = [v6 objectForKey:@"FlashlightIntensity"];

    if (v8)
    {
      [v7 floatForKey:@"FlashlightIntensity"];
      float v10 = fminf(fmaxf(v9, 0.0), 1.0);
    }
    else
    {
      float v10 = 1.0;
    }
    *a3 = v10;
    uint64_t v11 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      double v12 = *a3;
      int v18 = 134217984;
      double v19 = v12;
      _os_log_impl(&dword_2218C9000, v11, OS_LOG_TYPE_INFO, "[Flashlight Controller] Loaded intensity: %f", (uint8_t *)&v18, 0xCu);
    }
  }
  if (a4)
  {
    long long v13 = [v7 objectForKey:@"FlashlightWidth"];

    if (v13)
    {
      [v7 floatForKey:@"FlashlightWidth"];
      float v15 = fminf(fmaxf(v14, 0.0), 1.0);
    }
    else
    {
      float v15 = 0.5;
    }
    *a4 = v15;
    double v16 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      double v17 = *a4;
      int v18 = 134217984;
      double v19 = v17;
      _os_log_impl(&dword_2218C9000, v16, OS_LOG_TYPE_INFO, "[Flashlight Controller] Loaded width: %f", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (unint64_t)__pendingPowerChange
{
  return self->_pendingPowerChange;
}

- (BOOL)isBeamWidthSupported
{
  return self->_beamWidthSupported;
}

- (float)intensity
{
  return self->_intensity;
}

- (float)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatableProperties, 0);
  objc_storeStrong((id *)&self->_springBehavior, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_flashlightQueue, 0);

  objc_storeStrong((id *)&self->_flashlight, 0);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2218C9000, v0, v1, "[Flashlight Controller] Ignoring flashlight queue KVO to %@", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2218C9000, v0, v1, "[Flashlight Controller] observed flashlightLevel change to: %@", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2218C9000, v0, v1, "[Flashlight Controller] observed beamWidth change to: %@", v2, v3, v4, v5, v6);
}

double __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2218C9000, a2, a3, "[Flashlight Controller] Animations Finished; _float intensity = %f",
    a5,
    a6,
    a7,
    a8,
    0);
  return result;
}

void __48__SBUIFlashlightController__setFlashlightLevel___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2218C9000, v0, OS_LOG_TYPE_ERROR, "Error setting flashlight level: %@", v1, 0xCu);
}

void __40__SBUIFlashlightController__turnPowerOn__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2218C9000, v0, OS_LOG_TYPE_ERROR, "Error turning on flashlight power: %@", v1, 0xCu);
}

@end