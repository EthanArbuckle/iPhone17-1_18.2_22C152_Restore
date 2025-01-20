@interface SBHarmonyController
+ (id)sharedInstance;
- (BOOL)isWhitePointAdaptationEnabled;
- (BOOL)supportsBlueLightReduction;
- (BOOL)supportsWhitePointAdaptation;
- (SBHarmonyController)init;
- (SBHarmonySettings)harmonySettings;
- (float)whitePointAdaptationStrengthForWhitePointAdaptivityStyle:(int64_t)a3;
- (id)_adaptationClient;
- (int64_t)whitePointAdaptivityStyle;
- (void)setWhitePointAdaptationEnabled:(BOOL)a3;
- (void)setWhitePointAdaptationStrength:(float)a3 forWhitePointAdaptivityStyle:(int64_t)a4;
- (void)setWhitePointAdaptivityStyle:(int64_t)a3;
- (void)setWhitePointAdaptivityStyle:(int64_t)a3 animationSettings:(id)a4;
- (void)setWhitePointAdaptivityStyleWithStyles:(id)a3 animationSettings:(id)a4;
- (void)transitionFromWhitePointAdaptivityStyleWithStyles:(id)a3 toWhitePointAdaptivityStyleWithStyles:(id)a4 fromPercentage:(double)a5 toPercentage:(double)a6 animationSettings:(id)a7;
@end

@implementation SBHarmonyController

- (void)setWhitePointAdaptivityStyleWithStyles:(id)a3 animationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBHarmonyController *)self supportsWhitePointAdaptation])
  {
    uint64_t v8 = [v6 count];
    if (v8)
    {
      uint64_t v9 = v8;
      if (v8 == 1)
      {
        v10 = [v6 firstObject];
        -[SBHarmonyController setWhitePointAdaptivityStyle:animationSettings:](self, "setWhitePointAdaptivityStyle:animationSettings:", [v10 integerValue], v7);
      }
      else
      {
        uint64_t v25 = 0;
        v26 = &v25;
        uint64_t v27 = 0x2020000000;
        v28 = 0;
        uint64_t v11 = 0;
        v28 = malloc_type_malloc(4 * v8, 0x100004052888210uLL);
        do
        {
          v12 = [v6 objectAtIndexedSubscript:v11];
          unint64_t v13 = [v12 integerValue];
          if (v13 < 5) {
            int v14 = v13 + 1;
          }
          else {
            int v14 = 0;
          }
          *(_DWORD *)(v26[3] + 4 * v11) = v14;

          ++v11;
        }
        while (v9 != v11);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __80__SBHarmonyController_setWhitePointAdaptivityStyleWithStyles_animationSettings___block_invoke;
        v21[3] = &unk_1E6B02570;
        v21[4] = self;
        v23 = &v25;
        uint64_t v24 = v9;
        id v15 = v7;
        id v22 = v15;
        v16 = (void (**)(void))MEMORY[0x1D948C7A0](v21);
        [v15 delay];
        if (v17 <= 0.0)
        {
          v16[2](v16);
        }
        else
        {
          dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __80__SBHarmonyController_setWhitePointAdaptivityStyleWithStyles_animationSettings___block_invoke_2;
          block[3] = &unk_1E6AF5300;
          v20 = v16;
          dispatch_after(v18, MEMORY[0x1E4F14428], block);
        }
        _Block_object_dispose(&v25, 8);
      }
    }
  }
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3 animationSettings:(id)a4
{
  id v6 = a4;
  if ([(SBHarmonyController *)self supportsWhitePointAdaptation])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__SBHarmonyController_setWhitePointAdaptivityStyle_animationSettings___block_invoke;
    v13[3] = &unk_1E6AF6FC0;
    v13[4] = self;
    int64_t v15 = a3;
    id v7 = v6;
    id v14 = v7;
    uint64_t v8 = (void (**)(void))MEMORY[0x1D948C7A0](v13);
    [v7 delay];
    if (v9 <= 0.0)
    {
      v8[2](v8);
    }
    else
    {
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __70__SBHarmonyController_setWhitePointAdaptivityStyle_animationSettings___block_invoke_2;
      v11[3] = &unk_1E6AF5300;
      v12 = v8;
      dispatch_after(v10, MEMORY[0x1E4F14428], v11);
    }
  }
}

- (void)transitionFromWhitePointAdaptivityStyleWithStyles:(id)a3 toWhitePointAdaptivityStyleWithStyles:(id)a4 fromPercentage:(double)a5 toPercentage:(double)a6 animationSettings:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if ([(SBHarmonyController *)self supportsWhitePointAdaptation])
  {
    uint64_t v14 = [v11 count];
    uint64_t v15 = [v12 count];
    if (v14 | v15)
    {
      uint64_t v16 = v15;
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      uint64_t v47 = 0;
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2020000000;
      uint64_t v43 = 0;
      if (v14)
      {
        double v17 = malloc_type_malloc(4 * v14, 0x100004052888210uLL);
        uint64_t v18 = 0;
        v45[3] = (uint64_t)v17;
        do
        {
          v19 = [v11 objectAtIndexedSubscript:v18];
          unint64_t v20 = [v19 integerValue];
          if (v20 < 5) {
            int v21 = v20 + 1;
          }
          else {
            int v21 = 0;
          }
          *(_DWORD *)(v45[3] + 4 * v18) = v21;

          ++v18;
        }
        while (v14 != v18);
      }
      if (v16)
      {
        id v22 = malloc_type_malloc(4 * v16, 0x100004052888210uLL);
        uint64_t v23 = 0;
        v41[3] = (uint64_t)v22;
        do
        {
          uint64_t v24 = [v12 objectAtIndexedSubscript:v23];
          unint64_t v25 = [v24 integerValue];
          if (v25 < 5) {
            int v26 = v25 + 1;
          }
          else {
            int v26 = 0;
          }
          *(_DWORD *)(v41[3] + 4 * v23) = v26;

          ++v23;
        }
        while (v16 != v23);
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __157__SBHarmonyController_transitionFromWhitePointAdaptivityStyleWithStyles_toWhitePointAdaptivityStyleWithStyles_fromPercentage_toPercentage_animationSettings___block_invoke;
      v33[3] = &unk_1E6B02598;
      v33[4] = self;
      v35 = &v44;
      v36 = &v40;
      uint64_t v37 = v14;
      uint64_t v38 = v16;
      double v39 = a6;
      id v27 = v13;
      id v34 = v27;
      v28 = (void (**)(void))MEMORY[0x1D948C7A0](v33);
      [v27 delay];
      if (v29 <= 0.0)
      {
        v28[2](v28);
      }
      else
      {
        dispatch_time_t v30 = dispatch_time(0, (uint64_t)(v29 * 1000000000.0));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __157__SBHarmonyController_transitionFromWhitePointAdaptivityStyleWithStyles_toWhitePointAdaptivityStyleWithStyles_fromPercentage_toPercentage_animationSettings___block_invoke_2;
        v31[3] = &unk_1E6AF5300;
        v32 = v28;
        dispatch_after(v30, MEMORY[0x1E4F14428], v31);
      }
      _Block_object_dispose(&v40, 8);
      _Block_object_dispose(&v44, 8);
    }
  }
}

- (BOOL)supportsWhitePointAdaptation
{
  return self->_supportsWhitePointAdaptation;
}

void __70__SBHarmonyController_setWhitePointAdaptivityStyle_animationSettings___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _adaptationClient];
  v2 = *(void **)(a1 + 40);
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 < 5) {
    uint64_t v4 = (v3 + 1);
  }
  else {
    uint64_t v4 = 0;
  }
  [v2 duration];
  *(float *)&double v5 = v5;
  [v6 setAdaptationMode:v4 withPeriod:v5];
}

void __157__SBHarmonyController_transitionFromWhitePointAdaptivityStyleWithStyles_toWhitePointAdaptivityStyleWithStyles_fromPercentage_toPercentage_animationSettings___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _adaptationClient];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v4 = *(unsigned int *)(a1 + 64);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v6 = *(unsigned int *)(a1 + 72);
  float updated = SBSampleValueWithWhitePointAdaptationInteractiveUpdateTimingFunction(*(double *)(a1 + 80));
  [*(id *)(a1 + 40) duration];
  *(float *)&double v9 = v8;
  *(float *)&double v8 = updated;
  [v2 animateFromWeakestAdaptationModeInArray:v3 withLength:v4 toWeakestInArray:v5 withLength:v6 withProgress:v8 andPeriod:v9];

  if (*(void *)(a1 + 64))
  {
    free(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  if (*(void *)(a1 + 72))
  {
    free(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (id)_adaptationClient
{
  return (id)[(CBClient *)self->_client adaptationClient];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_23 != -1) {
    dispatch_once(&sharedInstance_onceToken_23, &__block_literal_global_167);
  }
  v2 = (void *)sharedInstance___sharedInstance_13;
  return v2;
}

- (SBHarmonySettings)harmonySettings
{
  harmonySettings = self->_harmonySettings;
  if (!harmonySettings)
  {
    uint64_t v4 = [(PTSettings *)[SBHarmonySettings alloc] initWithDefaultValues];
    uint64_t v5 = self->_harmonySettings;
    self->_harmonySettings = v4;

    harmonySettings = self->_harmonySettings;
  }
  return harmonySettings;
}

void __37__SBHarmonyController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBHarmonyController);
  v1 = (void *)sharedInstance___sharedInstance_13;
  sharedInstance___sharedInstance_13 = (uint64_t)v0;
}

- (SBHarmonyController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHarmonyController;
  v2 = [(SBHarmonyController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = (CBClient *)objc_alloc_init(MEMORY[0x1E4F5B2A8]);
    client = v2->_client;
    v2->_client = v3;

    v2->_supportsWhitePointAdaptation = [MEMORY[0x1E4F5B298] supportsAdaptation];
    v2->_supportsBlueLightReduction = [MEMORY[0x1E4F5B2A0] supportsBlueLightReduction];
    *(int64x2_t *)&v2->_suppressedWhitePointAdaptationEnabled = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return v2;
}

- (BOOL)isWhitePointAdaptationEnabled
{
  BOOL v3 = [(SBHarmonyController *)self supportsWhitePointAdaptation];
  if (v3)
  {
    uint64_t v4 = [(SBHarmonyController *)self _adaptationClient];
    char v5 = [v4 getEnabled];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setWhitePointAdaptationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBHarmonyController *)self supportsWhitePointAdaptation])
  {
    id v5 = [(SBHarmonyController *)self _adaptationClient];
    [v5 setEnabled:v3];
  }
}

- (int64_t)whitePointAdaptivityStyle
{
  if (![(SBHarmonyController *)self supportsWhitePointAdaptation]) {
    return -1;
  }
  BOOL v3 = [(SBHarmonyController *)self _adaptationClient];
  unsigned int v4 = [v3 getAdaptationMode];
  if (v4 > 6) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = qword_1D8FD1870[v4];
  }

  return v5;
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
}

uint64_t __70__SBHarmonyController_setWhitePointAdaptivityStyle_animationSettings___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__SBHarmonyController_setWhitePointAdaptivityStyleWithStyles_animationSettings___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _adaptationClient];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  [*(id *)(a1 + 40) duration];
  *(float *)&double v5 = v5;
  [v2 setWeakestAdaptationModeFromArray:v3 withLength:v4 andPeriod:v5];

  free(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

uint64_t __80__SBHarmonyController_setWhitePointAdaptivityStyleWithStyles_animationSettings___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __157__SBHarmonyController_transitionFromWhitePointAdaptivityStyleWithStyles_toWhitePointAdaptivityStyleWithStyles_fromPercentage_toPercentage_animationSettings___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)supportsBlueLightReduction
{
  return self->_supportsBlueLightReduction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressionAssertions, 0);
  objc_storeStrong((id *)&self->_harmonySettings, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (float)whitePointAdaptationStrengthForWhitePointAdaptivityStyle:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(SBHarmonyController *)self supportsWhitePointAdaptation]) {
    return NAN;
  }
  double v5 = [(SBHarmonyController *)self _adaptationClient];
  int v6 = [v5 getStrengths:v9 nStrengths:6];

  if (!v6) {
    return NAN;
  }
  if ((unint64_t)a3 < 5) {
    int64_t v7 = a3 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  return *(float *)&v9[v7];
}

- (void)setWhitePointAdaptationStrength:(float)a3 forWhitePointAdaptivityStyle:(int64_t)a4
{
  float v9 = a3;
  if ([(SBHarmonyController *)self supportsWhitePointAdaptation])
  {
    if ((unint64_t)a4 < 5) {
      int v6 = a4 + 1;
    }
    else {
      int v6 = 0;
    }
    int v8 = v6;
    int64_t v7 = [(SBHarmonyController *)self _adaptationClient];
    [v7 overrideStrengths:&v9 forModes:&v8 nModes:1];
  }
}

@end