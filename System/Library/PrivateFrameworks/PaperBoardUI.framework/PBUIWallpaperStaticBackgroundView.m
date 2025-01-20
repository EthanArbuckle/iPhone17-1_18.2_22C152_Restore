@interface PBUIWallpaperStaticBackgroundView
- (BOOL)_shouldSuspendMotionEffectsForState:(id *)a3;
- (BOOL)_shouldSuspendMotionEffectsForStyle:(int64_t)a3;
- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5;
- (BSInvalidatable)wallpaperStyleAnimationAssertion;
- (PBUIWallpaperStaticBackgroundView)initWithWallpaperPresenter:(id)a3;
- (id)_effectViewForVariant:(int64_t)a3;
- (id)_newEffectViewForVariant:(int64_t)a3 transitionState:(id *)a4;
- (int64_t)variant;
- (void)_beginSuspendingMotionEffectsForStyleIfNeeded;
- (void)_endSuspendingMotionEffectsForStyleIfNeeded;
- (void)_setEffectView:(id)a3 forVariant:(int64_t)a4;
- (void)_updateMotionEffectsForState:(id *)a3;
- (void)dealloc;
- (void)setVariant:(int64_t)a3;
- (void)setVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6;
- (void)setWallpaperStyleAnimationAssertion:(id)a3;
@end

@implementation PBUIWallpaperStaticBackgroundView

- (PBUIWallpaperStaticBackgroundView)initWithWallpaperPresenter:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PBUIWallpaperStaticBackgroundView;
  v6 = [(PBUIWallpaperStaticBackgroundView *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wallpaperPresenter, a3);
    v7->_variant = -1;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v8 = [(PBUIWallpaperStaticBackgroundView *)v7 _newEffectViewForVariant:1 transitionState:&v13];
    homescreenWallpaperEffectView = v7->_homescreenWallpaperEffectView;
    v7->_homescreenWallpaperEffectView = (PBUIWallpaperEffectViewBase *)v8;

    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v10 = [(PBUIWallpaperStaticBackgroundView *)v7 _newEffectViewForVariant:0 transitionState:&v13];
    lockscreenWallpaperEffectView = v7->_lockscreenWallpaperEffectView;
    v7->_lockscreenWallpaperEffectView = (PBUIWallpaperEffectViewBase *)v10;
  }
  return v7;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_wallpaperStyleAnimationAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperStaticBackgroundView;
  [(PBUIWallpaperStaticBackgroundView *)&v3 dealloc];
}

- (void)setVariant:(int64_t)a3
{
}

- (void)setVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(void))a6;
  uint64_t v13 = v12;
  int64_t variant = self->_variant;
  if (variant == a3)
  {
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    self->_int64_t variant = a3;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    char v44 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    char v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    char v40 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke;
    v34[3] = &unk_1E62B4E58;
    v36 = v41;
    v37 = v43;
    v38 = v39;
    v35 = v12;
    uint64_t v15 = (void *)MEMORY[0x1C1872570](v34);
    objc_super v16 = [(PBUIWallpaperStaticBackgroundView *)self _effectViewForVariant:variant];
    v17 = [(PBUIWallpaperStaticBackgroundView *)self _effectViewForVariant:a3];
    id v18 = v10;
    v19 = (void *)MEMORY[0x1E4F4F898];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_2;
    v32[3] = &unk_1E62B2798;
    id v20 = v16;
    id v33 = v20;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_3;
    v30[3] = &unk_1E62B4E80;
    id v21 = v15;
    id v31 = v21;
    v22 = v19;
    id v10 = v18;
    [v22 animateWithFactory:v18 actions:v32 completion:v30];
    [v17 setAlpha:0.0];
    v23 = (void *)MEMORY[0x1E4F4F898];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_4;
    v28[3] = &unk_1E62B2798;
    id v24 = v17;
    id v29 = v24;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_5;
    v26[3] = &unk_1E62B4E80;
    id v25 = v21;
    id v27 = v25;
    [v23 animateWithFactory:v11 actions:v28 completion:v26];

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v41, 8);
    _Block_object_dispose(v43, 8);
  }
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(result + 40);
  }
  else {
    uint64_t v2 = *(void *)(result + 48);
  }
  *(unsigned char *)(*(void *)(v2 + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
    {
      uint64_t v3 = *(void *)(*(void *)(result + 56) + 8);
      if (!*(unsigned char *)(v3 + 24))
      {
        *(unsigned char *)(v3 + 24) = 1;
        result = *(void *)(result + 32);
        if (result) {
          return (*(uint64_t (**)(void))(result + 16))();
        }
      }
    }
  }
  return result;
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  id v8 = a5;
  BOOL v9 = self->_variant == a4;
  id v10 = [(PBUIWallpaperStaticBackgroundView *)self _effectViewForVariant:a4];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3810000000;
  v40[3] = &unk_1BC54E869;
  $1D129F7B4C980C50E70029647222EF17 v41 = *a3;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__7;
  v38 = __Block_byref_object_dispose__7;
  id v39 = 0;
  id v11 = (void *)MEMORY[0x1E4F4F898];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke;
  v28[3] = &unk_1E62B4EA8;
  id v12 = v10;
  id v31 = v40;
  v32 = &v34;
  id v29 = v12;
  v30 = self;
  int64_t v33 = a4;
  [v11 animateWithFactory:0 actions:v28];
  [(PBUIWallpaperStaticBackgroundView *)self _setEffectView:v35[5] forVariant:a4];
  uint64_t v13 = (void *)MEMORY[0x1E4F4F898];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke_2;
  v22[3] = &unk_1E62B4ED0;
  v22[4] = self;
  BOOL v27 = v9;
  int64_t v26 = a4;
  id v24 = v40;
  id v25 = &v34;
  id v23 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke_3;
  v16[3] = &unk_1E62B4EF8;
  id v14 = v23;
  BOOL v21 = v9;
  id v17 = v14;
  id v18 = self;
  v19 = &v34;
  id v20 = v40;
  [v13 animateWithFactory:v8 actions:v22 completion:v16];

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v40, 8);

  return 1;
}

void __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) prepareToAnimateToTransitionState:*(void *)(*(void *)(a1 + 48) + 8) + 32])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 64);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v8 = *(_OWORD *)(v4 + 32);
    uint64_t v9 = *(void *)(v4 + 48);
    uint64_t v5 = [v3 _newEffectViewForVariant:v2 transitionState:&v8];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v9 = *(_OWORD *)(v3 + 32);
  uint64_t v10 = *(void *)(v3 + 48);
  if (([v2 _shouldSuspendMotionEffectsForState:&v9] & 1) == 0 && *(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) _endSuspendingMotionEffectsForStyleIfNeeded];
  }
  uint64_t v4 = [*(id *)(a1 + 32) _effectViewForVariant:*(void *)(a1 + 64)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v9 = *(_OWORD *)(v5 + 32);
  uint64_t v10 = *(void *)(v5 + 48);
  [v4 setTransitionState:&v9];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAlpha:1.0];
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v9 = *(_OWORD *)(v7 + 32);
  uint64_t v10 = *(void *)(v7 + 48);
  [v6 setTransitionState:&v9];
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!result) {
    return [*(id *)(a1 + 40) setAlpha:0.0];
  }
  if (result != *(void *)(a1 + 40))
  {
    uint64_t result = [(id)result currentTransitionStateIsOpaque];
    if ((result & 1) == 0) {
      return [*(id *)(a1 + 40) setAlpha:0.0];
    }
  }
  return result;
}

void *__102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result != *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    uint64_t result = (void *)[result removeFromSuperview];
  }
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v5 = *(_OWORD *)(v4 + 32);
    uint64_t v6 = *(void *)(v4 + 48);
    return (void *)[v3 _updateMotionEffectsForState:&v5];
  }
  return result;
}

- (void)_beginSuspendingMotionEffectsForStyleIfNeeded
{
  uint64_t v3 = [(PBUIWallpaperStaticBackgroundView *)self wallpaperStyleAnimationAssertion];

  if (!v3)
  {
    uint64_t v4 = PBUILogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1BC4B3000, v4, OS_LOG_TYPE_INFO, "Disabling parallax because of requested wallpaper style", v6, 2u);
    }

    long long v5 = [(PBUIWallpaperPresenting *)self->_wallpaperPresenter suspendWallpaperAnimationForReason:@"PBUIWallpaperEffectViewIsDarkOrHiddenReason"];
    [(PBUIWallpaperStaticBackgroundView *)self setWallpaperStyleAnimationAssertion:v5];
  }
}

- (void)_endSuspendingMotionEffectsForStyleIfNeeded
{
  uint64_t v3 = [(PBUIWallpaperStaticBackgroundView *)self wallpaperStyleAnimationAssertion];

  if (v3)
  {
    uint64_t v4 = PBUILogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1BC4B3000, v4, OS_LOG_TYPE_INFO, "Enabling parallax because of requested wallpaper style", v6, 2u);
    }

    long long v5 = [(PBUIWallpaperStaticBackgroundView *)self wallpaperStyleAnimationAssertion];
    [v5 invalidate];

    [(PBUIWallpaperStaticBackgroundView *)self setWallpaperStyleAnimationAssertion:0];
  }
}

- (void)_updateMotionEffectsForState:(id *)a3
{
  $1D129F7B4C980C50E70029647222EF17 v4 = *a3;
  if ([(PBUIWallpaperStaticBackgroundView *)self _shouldSuspendMotionEffectsForState:&v4])
  {
    [(PBUIWallpaperStaticBackgroundView *)self _beginSuspendingMotionEffectsForStyleIfNeeded];
  }
  else
  {
    [(PBUIWallpaperStaticBackgroundView *)self _endSuspendingMotionEffectsForStyleIfNeeded];
  }
}

- (id)_effectViewForVariant:(int64_t)a3
{
  if (a3 == 1)
  {
    $1D129F7B4C980C50E70029647222EF17 v4 = &OBJC_IVAR___PBUIWallpaperStaticBackgroundView__homescreenWallpaperEffectView;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.isa + *v4);
    return v5;
  }
  if (!a3)
  {
    $1D129F7B4C980C50E70029647222EF17 v4 = &OBJC_IVAR___PBUIWallpaperStaticBackgroundView__lockscreenWallpaperEffectView;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (void)_setEffectView:(id)a3 forVariant:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 1)
  {
    id v9 = v7;
    long long v8 = &OBJC_IVAR___PBUIWallpaperStaticBackgroundView__homescreenWallpaperEffectView;
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v9 = v7;
    long long v8 = &OBJC_IVAR___PBUIWallpaperStaticBackgroundView__lockscreenWallpaperEffectView;
  }
  objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v8), a3);
  id v7 = v9;
LABEL_6:
}

- (id)_newEffectViewForVariant:(int64_t)a3 transitionState:(id *)a4
{
  uint64_t v6 = [[PBUIWallpaperEffectViewBase alloc] initWithWallpaperPresenter:self->_wallpaperPresenter variant:a3 transformOptions:0];
  [(PBUIWallpaperEffectViewBase *)v6 setForcesOpaque:1];
  $1D129F7B4C980C50E70029647222EF17 v8 = *a4;
  [(PBUIWallpaperEffectViewBase *)v6 setTransitionState:&v8];
  [(PBUIWallpaperStaticBackgroundView *)self bounds];
  -[PBUIWallpaperEffectViewBase setFrame:](v6, "setFrame:");
  [(PBUIWallpaperEffectViewBase *)v6 setAutoresizingMask:18];
  [(PBUIWallpaperEffectViewBase *)v6 setAlpha:0.0];
  [(PBUIWallpaperStaticBackgroundView *)self addSubview:v6];
  return v6;
}

- (BOOL)_shouldSuspendMotionEffectsForStyle:(int64_t)a3
{
  BOOL result = _WallpaperStyleHasDarkBlur(a3);
  if ((unint64_t)(a3 - 1) < 2) {
    return 1;
  }
  return result;
}

- (BOOL)_shouldSuspendMotionEffectsForState:(id *)a3
{
  BOOL v5 = [(PBUIWallpaperStaticBackgroundView *)self _shouldSuspendMotionEffectsForStyle:a3->var0];
  BOOL v6 = [(PBUIWallpaperStaticBackgroundView *)self _shouldSuspendMotionEffectsForStyle:a3->var1];
  double var2 = a3->var2;
  if (fabs(var2 + -1.0) < 2.22044605e-16 && v6) {
    return 1;
  }
  char v9 = fabs(var2) < 2.22044605e-16 || v6;
  return v5 & v9;
}

- (int64_t)variant
{
  return self->_variant;
}

- (BSInvalidatable)wallpaperStyleAnimationAssertion
{
  return self->_wallpaperStyleAnimationAssertion;
}

- (void)setWallpaperStyleAnimationAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperStyleAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_homescreenWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_lockscreenWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperPresenter, 0);
}

@end