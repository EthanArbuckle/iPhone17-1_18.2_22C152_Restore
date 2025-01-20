@interface ISTransitionApplier
+ (ISTransitionApplier)defaultApplier;
- (void)_applyAlpha:(double)a3 blurRadius:(double)a4 toLayer:(id)a5 withTransitionOptions:(id)a6 completion:(id)a7;
- (void)_applyScale:(double)a3 toLayer:(id)a4 withTransitionOptions:(id)a5 completion:(id)a6;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)applyOutputInfo:(id)a3 withTransitionOptions:(id)a4 toPhotoLayer:(id)a5 videoLayer:(id)a6 completion:(id)a7;
- (void)applyScale:(double)a3 withTransitionOptions:(id)a4 toPhotoLayer:(id)a5 videoLayer:(id)a6 completion:(id)a7;
- (void)setValue:(id)a3 forKeyPath:(id)a4 ofLayer:(id)a5 withTransitionOptions:(id)a6 completion:(id)a7;
@end

@implementation ISTransitionApplier

- (void)setValue:(id)a3 forKeyPath:(id)a4 ofLayer:(id)a5 withTransitionOptions:(id)a6 completion:(id)a7
{
  id v24 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  [a6 transitionDuration];
  double v16 = v15;
  uint64_t v17 = [v13 presentationLayer];
  v18 = (void *)v17;
  if (v17) {
    v19 = (void *)v17;
  }
  else {
    v19 = v13;
  }
  id v20 = v19;

  if (v16 <= 0.0)
  {
    [v13 removeAnimationForKey:v12];
    [v13 setValue:v24 forKeyPath:v12];
  }
  else
  {
    v21 = [v20 valueForKeyPath:v12];
    if ([v21 isEqual:v24])
    {
      v22 = 0;
    }
    else
    {
      v22 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v12];
      [v22 setToValue:v24];
      [v22 setDuration:v16];
      [v22 setFromValue:v21];
      if (v14)
      {
        v23 = (void *)[v14 copy];
        [v22 setValue:v23 forKey:@"ISTransitionApplierAnimationCompletionHandlerKey"];
      }
    }

    [v13 setValue:v24 forKeyPath:v12];
    if (v22)
    {
      [v22 setDelegate:self];
      [v13 addAnimation:v22 forKey:v12];

      goto LABEL_14;
    }
  }
  if (v14) {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }
LABEL_14:
}

uint64_t __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (ISTransitionApplier)defaultApplier
{
  if (defaultApplier_onceToken != -1) {
    dispatch_once(&defaultApplier_onceToken, &__block_literal_global_3031);
  }
  uint64_t v2 = (void *)defaultApplier_applier;

  return (ISTransitionApplier *)v2;
}

- (void)applyOutputInfo:(id)a3 withTransitionOptions:(id)a4 toPhotoLayer:(id)a5 videoLayer:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = dispatch_group_create();
  v18 = v17;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 1;
  if (v14)
  {
    dispatch_group_enter(v17);
    [v12 photoBlurRadius];
    double v20 = v19;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke;
    v31[3] = &unk_1E6BECC40;
    v33 = v34;
    v32 = v18;
    [(ISTransitionApplier *)self _applyAlpha:v14 blurRadius:v13 toLayer:v31 withTransitionOptions:1.0 completion:v20];
  }
  if (v15)
  {
    dispatch_group_enter(v18);
    [v12 videoAlpha];
    double v22 = v21;
    [v12 videoBlurRadius];
    double v24 = v23;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_2;
    v28[3] = &unk_1E6BECC40;
    v30 = v34;
    v29 = v18;
    [(ISTransitionApplier *)self _applyAlpha:v15 blurRadius:v13 toLayer:v28 withTransitionOptions:v22 completion:v24];
  }
  if (v16)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_3;
    v25[3] = &unk_1E6BECC68;
    id v26 = v16;
    v27 = v34;
    dispatch_group_notify(v18, MEMORY[0x1E4F14428], v25);
  }
  _Block_object_dispose(v34, 8);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [a3 valueForKey:@"ISTransitionApplierAnimationCompletionHandlerKey"];
  if (v5)
  {
    id v6 = v5;
    v5[2](v5, v4);
    v5 = (void (**)(void, void))v6;
  }
}

- (void)_applyScale:(double)a3 toLayer:(id)a4 withTransitionOptions:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 1;
    id v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    id v14 = [NSNumber numberWithDouble:a3];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__ISTransitionApplier__applyScale_toLayer_withTransitionOptions_completion___block_invoke;
    v22[3] = &unk_1E6BECC40;
    double v24 = v25;
    id v15 = v13;
    double v23 = v15;
    [(ISTransitionApplier *)self setValue:v14 forKeyPath:@"transform.scale" ofLayer:v10 withTransitionOptions:v11 completion:v22];

    if (v12)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __76__ISTransitionApplier__applyScale_toLayer_withTransitionOptions_completion___block_invoke_2;
      double v19 = &unk_1E6BECC68;
      id v20 = v12;
      double v21 = v25;
      dispatch_group_notify(v15, MEMORY[0x1E4F14428], &v16);
    }
    objc_msgSend(MEMORY[0x1E4F39CF8], "commit", v16, v17, v18, v19);

    _Block_object_dispose(v25, 8);
  }
}

void __76__ISTransitionApplier__applyScale_toLayer_withTransitionOptions_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__ISTransitionApplier__applyScale_toLayer_withTransitionOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)_applyAlpha:(double)a3 blurRadius:(double)a4 toLayer:(id)a5 withTransitionOptions:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (v12)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    id v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 1;
    uint64_t v16 = [NSNumber numberWithDouble:a3];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke;
    v26[3] = &unk_1E6BECC40;
    v28 = v29;
    uint64_t v17 = v15;
    v27 = v17;
    [(ISTransitionApplier *)self setValue:v16 forKeyPath:@"opacity" ofLayer:v12 withTransitionOptions:v13 completion:v26];

    objc_msgSend(v12, "is_addBlurFilterIfNeeded");
    dispatch_group_enter(v17);
    v18 = [NSNumber numberWithDouble:a4];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke_2;
    v23[3] = &unk_1E6BECC40;
    v25 = v29;
    double v19 = v17;
    double v24 = v19;
    [(ISTransitionApplier *)self setValue:v18 forKeyPath:@"filters.LivePhotoBlur.inputRadius" ofLayer:v12 withTransitionOptions:v13 completion:v23];

    if (v14)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke_3;
      block[3] = &unk_1E6BECC68;
      id v21 = v14;
      double v22 = v29;
      dispatch_group_notify(v19, MEMORY[0x1E4F14428], block);
    }
    [MEMORY[0x1E4F39CF8] commit];

    _Block_object_dispose(v29, 8);
  }
}

void __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)applyScale:(double)a3 withTransitionOptions:(id)a4 toPhotoLayer:(id)a5 videoLayer:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  uint64_t v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 1;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke;
  v28[3] = &unk_1E6BECC40;
  char v30 = v31;
  uint64_t v17 = v16;
  v29 = v17;
  [(ISTransitionApplier *)self _applyScale:v13 toLayer:v12 withTransitionOptions:v28 completion:a3];
  dispatch_group_enter(v17);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_2;
  void v25[3] = &unk_1E6BECC40;
  v27 = v31;
  v18 = v17;
  char v26 = v18;
  [(ISTransitionApplier *)self _applyScale:v14 toLayer:v12 withTransitionOptions:v25 completion:a3];
  if (v15)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_3;
    double v22 = &unk_1E6BECC68;
    id v23 = v15;
    double v24 = v31;
    dispatch_group_notify(v18, MEMORY[0x1E4F14428], &v19);
  }
  objc_msgSend(MEMORY[0x1E4F39CF8], "commit", v19, v20, v21, v22);

  _Block_object_dispose(v31, 8);
}

void __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t __37__ISTransitionApplier_defaultApplier__block_invoke()
{
  v0 = objc_alloc_init(ISTransitionApplier);
  uint64_t v1 = defaultApplier_applier;
  defaultApplier_applier = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end