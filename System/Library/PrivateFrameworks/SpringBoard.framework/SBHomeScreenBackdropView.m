@interface SBHomeScreenBackdropView
- (BOOL)isOpaque;
- (NSString)materialRecipeName;
- (SBHomeScreenBackdropView)initWithFrame:(CGRect)a3;
- (SBHomeScreenBackdropView)initWithFrame:(CGRect)a3 materialRecipe:(int64_t)a4 scaleAdjustment:(id)a5;
- (id)homeScreenBlurredContentSnapshotImage;
- (void)_configureBackdropAnimatableProperty;
- (void)_invalidateBackdropSnapshot;
- (void)_resetHomeScreenBlurredContentSnapshotImage;
- (void)_setupBackdropViewWithRecipe:(int64_t)a3 scaleAdjustment:(id)a4;
- (void)_updateBackdropViewIfNeeded;
- (void)_updateBackdropViewIfNeededInvalidatingSnapshot:(BOOL)a3;
- (void)beginRequiringBackdropViewForReason:(id)a3;
- (void)beginRequiringLiveBackdropViewForReason:(id)a3;
- (void)cancelInProcessAnimations;
- (void)endRequiringBackdropViewForReason:(id)a3;
- (void)endRequiringLiveBackdropViewForReason:(id)a3;
- (void)setBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setMaterialRecipeName:(id)a3;
@end

@implementation SBHomeScreenBackdropView

- (void)setBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  unint64_t materialViewAnimationCount = self->_materialViewAnimationCount;
  char v19 = 0;
  self->_unint64_t materialViewAnimationCount = materialViewAnimationCount + 1;
  v10 = (void *)MEMORY[0x1E4F42FF0];
  v11 = [(SBHomeScreenBackdropViewBase *)self backdropBlurSettings];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__SBHomeScreenBackdropView_setBlurProgress_behaviorMode_completion___block_invoke;
  v15[3] = &unk_1E6B05570;
  *(double *)&v15[6] = a3;
  v15[4] = self;
  v15[5] = &v16;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__SBHomeScreenBackdropView_setBlurProgress_behaviorMode_completion___block_invoke_2;
  v13[3] = &unk_1E6AFA340;
  v13[4] = self;
  id v12 = v8;
  id v14 = v12;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v11, a4, v15, v13);

  if (*((unsigned char *)v17 + 24)) {
    [(SBHomeScreenBackdropView *)self _updateBackdropViewIfNeededInvalidatingSnapshot:1];
  }

  _Block_object_dispose(&v16, 8);
}

void __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[60];
    if (v4)
    {
      v5 = v3;
      [v4 value];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      objc_msgSend(v5[55], "setAlpha:");
      v3 = v5;
    }
  }
}

void __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[60];
    if (v4)
    {
      v7 = v3;
      [v4 presentationValue];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      v5 = (void *)v7[55];
      v6 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v5 _setPresentationValue:v6 forKey:@"opacity"];

      v3 = v7;
    }
  }
}

double __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke(double a1)
{
  double result = 1.0;
  if (a1 < 0.05) {
    return a1 / 0.05 + 0.0;
  }
  return result;
}

uint64_t __68__SBHomeScreenBackdropView_setBlurProgress_behaviorMode_completion___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  [*(id *)(*(void *)(a1 + 32) + 440) weighting];
  if (v2 != v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  [*(id *)(*(void *)(a1 + 32) + 440) setWeighting:*(double *)(a1 + 48)];
  id v4 = *(void **)(*(void *)(a1 + 32) + 480);
  double v5 = *(double *)(a1 + 48);
  return [v4 setValue:v5];
}

- (void)_updateBackdropViewIfNeededInvalidatingSnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBHomeScreenBackdropViewBase *)self requiresLiveBackdropView];
  BOOL v6 = v5 || [(SBHomeScreenBackdropViewBase *)self requiresBackdropView];
  BOOL v7 = [(SBHomeScreenBackdropView *)self isOpaque];
  if (v3) {
    [(SBHomeScreenBackdropView *)self _invalidateBackdropSnapshot];
  }
  if (v5)
  {
    [(MTMaterialView *)self->_materialView setHidden:0];
    [(SBHomeScreenBackdropView *)self _invalidateBackdropSnapshot];
    goto LABEL_19;
  }
  if (!v6)
  {
    [(SBHomeScreenBackdropView *)self _invalidateBackdropSnapshot];
    materialView = self->_materialView;
    uint64_t v10 = 1;
LABEL_18:
    [materialView setHidden:v10];
    goto LABEL_19;
  }
  if (![(UIImageView *)self->_blurredContentSnapshotImageView isHidden]) {
    goto LABEL_19;
  }
  if (([(MTMaterialView *)self->_materialView isHidden] & 1) == 0
    && !self->_materialViewAnimationCount
    && !self->_waitingForBackdropViewToRender)
  {
    blurredContentSnapshotImageView = self->_blurredContentSnapshotImageView;
    v17 = [(SBHomeScreenBackdropView *)self homeScreenBlurredContentSnapshotImage];
    [(UIImageView *)blurredContentSnapshotImageView setImage:v17];

    uint64_t v18 = [(UIImageView *)self->_blurredContentSnapshotImageView layer];
    [v18 setContentsOpaque:1];

    [(MTMaterialView *)self->_materialView setHidden:1];
    materialView = self->_blurredContentSnapshotImageView;
    uint64_t v10 = 0;
    goto LABEL_18;
  }
  if ([(MTMaterialView *)self->_materialView isHidden]) {
    self->_waitingForBackdropViewToRender = 1;
  }
  [(MTMaterialView *)self->_materialView setHidden:0];
  [(UIImageView *)self->_blurredContentSnapshotImageView setHidden:1];
  if (self->_waitingForBackdropViewToRender)
  {
    id v8 = (void *)*MEMORY[0x1E4F43630];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__SBHomeScreenBackdropView__updateBackdropViewIfNeededInvalidatingSnapshot___block_invoke;
    v19[3] = &unk_1E6AF4AC0;
    v19[4] = self;
    objc_msgSend(v8, "sb_performBlockAfterCATransactionSynchronizedCommit:", v19);
  }
LABEL_19:
  BOOL v11 = [(SBHomeScreenBackdropView *)self isOpaque];
  if (v7 != v11)
  {
    BOOL v12 = v11;
    v13 = [(SBHomeScreenBackdropViewBase *)self delegate];
    [v13 homeScreenBackdropView:self opaquenessDidChange:v12];
  }
  id v14 = self->_materialView;
  [(SBHomeScreenBackdropView *)self bounds];
  -[MTMaterialView setFrame:](v14, "setFrame:");
  v15 = self->_blurredContentSnapshotImageView;
  [(SBHomeScreenBackdropView *)self bounds];
  -[UIImageView setFrame:](v15, "setFrame:");
}

- (BOOL)isOpaque
{
  return [(UIImageView *)self->_blurredContentSnapshotImageView isHidden] ^ 1;
}

- (void)_invalidateBackdropSnapshot
{
  [(UIImageView *)self->_blurredContentSnapshotImageView setImage:0];
  [(SBHomeScreenBackdropView *)self _resetHomeScreenBlurredContentSnapshotImage];
  blurredContentSnapshotImageView = self->_blurredContentSnapshotImageView;
  [(UIImageView *)blurredContentSnapshotImageView setHidden:1];
}

- (void)_resetHomeScreenBlurredContentSnapshotImage
{
  blurredContentSnapshotImage = self->_blurredContentSnapshotImage;
  self->_blurredContentSnapshotImage = 0;
}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropView;
  [(SBHomeScreenBackdropViewBase *)&v4 beginRequiringLiveBackdropViewForReason:a3];
  [(SBHomeScreenBackdropView *)self _updateBackdropViewIfNeeded];
}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropView;
  [(SBHomeScreenBackdropViewBase *)&v4 beginRequiringBackdropViewForReason:a3];
  [(SBHomeScreenBackdropView *)self _updateBackdropViewIfNeeded];
}

uint64_t __68__SBHomeScreenBackdropView_setBlurProgress_behaviorMode_completion___block_invoke_2(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 464);
  [*(id *)(a1 + 32) _updateBackdropViewIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_updateBackdropViewIfNeeded
{
}

- (void)setMaterialRecipeName:(id)a3
{
  id v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_super v4 = (NSString *)[v6 copy];
    materialRecipeName = self->_materialRecipeName;
    self->_materialRecipeName = v4;

    [(MTMaterialView *)self->_materialView setRecipeName:self->_materialRecipeName];
  }
}

uint64_t __76__SBHomeScreenBackdropView__updateBackdropViewIfNeededInvalidatingSnapshot___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 472) = 0;
  return [*(id *)(a1 + 32) _updateBackdropViewIfNeeded];
}

double __73__SBHomeScreenBackdropView__setupBackdropViewWithRecipe_scaleAdjustment___block_invoke()
{
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sbf_animatedBlurRadiusGraphicsQuality");

  double v2 = +[SBIconController sharedInstance];
  BOOL v3 = [v2 iconManager];
  objc_super v4 = [v3 openedFolder];

  if (v4) {
    BOOL v5 = v1 == 40;
  }
  else {
    BOOL v5 = 0;
  }
  double result = 0.3;
  if (!v5) {
    return 0.5;
  }
  return result;
}

uint64_t __53__SBHomeScreenBackdropView_cancelInProcessAnimations__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 480);
  [v1 value];
  return objc_msgSend(v1, "setValue:");
}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropView;
  [(SBHomeScreenBackdropViewBase *)&v4 endRequiringLiveBackdropViewForReason:a3];
  [(SBHomeScreenBackdropView *)self _updateBackdropViewIfNeeded];
}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropView;
  [(SBHomeScreenBackdropViewBase *)&v4 endRequiringBackdropViewForReason:a3];
  [(SBHomeScreenBackdropView *)self _updateBackdropViewIfNeeded];
}

- (void)cancelInProcessAnimations
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__SBHomeScreenBackdropView_cancelInProcessAnimations__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v2];
}

- (SBHomeScreenBackdropView)initWithFrame:(CGRect)a3 materialRecipe:(int64_t)a4 scaleAdjustment:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBHomeScreenBackdropView;
  BOOL v12 = -[SBHomeScreenBackdropViewBase initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12) {
    [(SBHomeScreenBackdropView *)v12 _setupBackdropViewWithRecipe:a4 scaleAdjustment:v11];
  }

  return v13;
}

- (SBHomeScreenBackdropView)initWithFrame:(CGRect)a3
{
  return -[SBHomeScreenBackdropView initWithFrame:materialRecipe:scaleAdjustment:](self, "initWithFrame:materialRecipe:scaleAdjustment:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setupBackdropViewWithRecipe:(int64_t)a3 scaleAdjustment:(id)a4
{
  id v6 = a4;
  if (!v6) {
    id v6 = &__block_literal_global_223;
  }
  id v20 = v6;
  materialRecipeName = self->_materialRecipeName;
  self->_materialRecipeName = 0;

  if (a3)
  {
    id v8 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:a3 options:2 initialWeighting:v20 scaleAdjustment:0.0];
    materialView = self->_materialView;
    self->_materialView = v8;
  }
  else
  {
    SBHomeScreenBackdropMaterialRecipeName();
    uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v11 = self->_materialRecipeName;
    self->_materialRecipeName = v10;

    BOOL v12 = (void *)MEMORY[0x1E4F743C8];
    v13 = self->_materialRecipeName;
    materialView = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = [v12 materialViewWithRecipeNamed:v13 inBundle:materialView options:2 initialWeighting:v20 scaleAdjustment:0.0];
    objc_super v15 = self->_materialView;
    self->_materialView = v14;
  }
  [(MTMaterialView *)self->_materialView setShouldCrossfade:0];
  uint64_t v16 = self->_materialView;
  [(SBHomeScreenBackdropView *)self bounds];
  -[MTMaterialView setFrame:](v16, "setFrame:");
  [(MTMaterialView *)self->_materialView setAutoresizingMask:18];
  [(MTMaterialView *)self->_materialView setHidden:1];
  [(SBHomeScreenBackdropView *)self addSubview:self->_materialView];
  [(SBHomeScreenBackdropView *)self _configureBackdropAnimatableProperty];
  id v17 = objc_alloc(MEMORY[0x1E4F42AA0]);
  [(SBHomeScreenBackdropView *)self bounds];
  uint64_t v18 = (UIImageView *)objc_msgSend(v17, "initWithFrame:");
  blurredContentSnapshotImageView = self->_blurredContentSnapshotImageView;
  self->_blurredContentSnapshotImageView = v18;

  [(UIImageView *)self->_blurredContentSnapshotImageView setHidden:1];
  [(SBHomeScreenBackdropView *)self addSubview:self->_blurredContentSnapshotImageView];
}

- (void)_configureBackdropAnimatableProperty
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!SBReduceMotion())
  {
    BOOL v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
    backdropFloatAnimatablePropertdouble y = self->_backdropFloatAnimatableProperty;
    self->_backdropFloatAnimatablePropertdouble y = v3;

    BOOL v5 = self->_backdropFloatAnimatableProperty;
    [(MTMaterialView *)self->_materialView weighting];
    -[UIViewFloatAnimatableProperty setValue:](v5, "setValue:");
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F42FF0];
    v15[0] = self->_backdropFloatAnimatableProperty;
    BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke_2;
    v11[3] = &unk_1E6AF8068;
    objc_copyWeak(&v13, &location);
    id v12 = &__block_literal_global_17_1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke_3;
    v8[3] = &unk_1E6AF8068;
    objc_copyWeak(&v10, &location);
    id v9 = &__block_literal_global_17_1;
    [v6 _createTransformerWithInputAnimatableProperties:v7 modelValueSetter:v11 presentationValueSetter:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (id)homeScreenBlurredContentSnapshotImage
{
  blurredContentSnapshotImage = self->_blurredContentSnapshotImage;
  if (!blurredContentSnapshotImage)
  {
    objc_super v4 = [(SBHomeScreenBackdropView *)self window];
    uint64_t v5 = [v4 interfaceOrientation];

    if ((unint64_t)(v5 - 2) >= 3) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v5 - 1;
    }
    BOOL v7 = [(SBHomeScreenBackdropView *)self window];
    SBCreateSnapshotBelowWindowWithOptions(v7, 1, v6, 0, 1u, 0.25);
    id v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v9 = self->_blurredContentSnapshotImage;
    self->_blurredContentSnapshotImage = v8;

    blurredContentSnapshotImage = self->_blurredContentSnapshotImage;
  }
  return blurredContentSnapshotImage;
}

- (NSString)materialRecipeName
{
  return self->_materialRecipeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialRecipeName, 0);
  objc_storeStrong((id *)&self->_backdropFloatAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_blurredContentSnapshotImageView, 0);
  objc_storeStrong((id *)&self->_blurredContentSnapshotImage, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end