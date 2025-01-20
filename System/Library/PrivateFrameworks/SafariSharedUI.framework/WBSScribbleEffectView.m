@interface WBSScribbleEffectView
+ (BOOL)_prewarmSceneAndEffect;
+ (CGImage)imageForScribbleEffectWithElementSnapshot:(CGImage *)a3 elementFrame:(CGRect)a4 webViewSize:(CGSize)a5 webViewScale:(double)a6;
+ (void)_prewarmSceneAndEffect;
+ (void)discardPrewarmedContent;
+ (void)prewarm;
- (BOOL)_loadSceneAndEffect;
- (BOOL)_loadTextureWithImage:(CGImage *)a3;
- (WBSScribbleEffectView)initWithImage:(CGImage *)a3 frame:(CGRect)a4;
- (void)_bindAspectRatio;
- (void)_setUpSceneWithImage:(CGImage *)a3;
- (void)startEffectWithCompletion:(id)a3;
@end

@implementation WBSScribbleEffectView

+ (void)discardPrewarmedContent
{
  v2 = prewarmingQueue();
  dispatch_async(v2, &__block_literal_global_60);
}

void __48__WBSScribbleEffectView_discardPrewarmedContent__block_invoke()
{
  v0 = (void *)prewarmedEffect;
  prewarmedEffect = 0;

  v1 = (void *)prewarmedScene;
  prewarmedScene = 0;
}

+ (CGImage)imageForScribbleEffectWithElementSnapshot:(CGImage *)a3 elementFrame:(CGRect)a4 webViewSize:(CGSize)a5 webViewScale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  CGFloat v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v15 = [v14 BOOLForKey:@"ScribbleReduceSnapshotScale"];

  if (v15) {
    double v16 = 1.0;
  }
  else {
    double v16 = a6;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v18 = CGBitmapContextCreate(0, (unint64_t)(width * v16), (unint64_t)(height * v16), 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.double width = v10;
  v24.size.double height = v9;
  CGFloat v19 = v16 * CGRectGetMinX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.double width = v10;
  v25.size.double height = v9;
  CGFloat v20 = v16 * (height - CGRectGetMaxY(v25));
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.double width = v10;
  v26.size.double height = v9;
  CGFloat v21 = v16 * CGRectGetWidth(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.double width = v10;
  v27.size.double height = v9;
  v28.size.double height = v16 * CGRectGetHeight(v27);
  v28.origin.CGFloat x = v19;
  v28.origin.CGFloat y = v20;
  v28.size.double width = v21;
  CGContextDrawImage(v18, v28, a3);
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  return Image;
}

+ (void)prewarm
{
  v3 = prewarmingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__WBSScribbleEffectView_prewarm__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
}

uint64_t __32__WBSScribbleEffectView_prewarm__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prewarmSceneAndEffect];
}

- (WBSScribbleEffectView)initWithImage:(CGImage *)a3 frame:(CGRect)a4
{
  v39.receiver = self;
  v39.super_class = (Class)WBSScribbleEffectView;
  v5 = -[WBSScribbleEffectView initWithFrame:](&v39, sel_initWithFrame_, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (v5)
  {
    v6 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v5->_device;
    v5->_device = v6;

    uint64_t v8 = [MEMORY[0x1E4F39BE8] layer];
    imageLayer = v5->_imageLayer;
    v5->_imageLayer = (CALayer *)v8;

    [(CALayer *)v5->_imageLayer setContentsGravity:*MEMORY[0x1E4F3A3D8]];
    CGFloat v10 = [(WBSScribbleEffectView *)v5 layer];
    [v10 addSublayer:v5->_imageLayer];

    [(WBSScribbleEffectView *)v5 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    CGFloat v19 = (Class *)MEMORY[0x1E4F39CF8];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __45__WBSScribbleEffectView_initWithImage_frame___block_invoke;
    v32 = &unk_1E5E45DF0;
    CGFloat v20 = v5;
    v33 = v20;
    double v34 = v12;
    double v35 = v14;
    double v36 = v16;
    double v37 = v18;
    v38 = a3;
    [(Class *)v19 safari_performWithActionsDisabled:&v29];
    gotLoadHelper_x22__OBJC_CLASS___VFXView(v21);
    if (objc_opt_class())
    {
      id v22 = objc_alloc(v19[312]);
      uint64_t v23 = objc_msgSend(v22, "initWithFrame:", v12, v14, v16, v18, v29, v30, v31, v32);
      id v24 = v20[56];
      v20[56] = (id)v23;

      CGRect v25 = [MEMORY[0x1E4F428B8] clearColor];
      [v20[56] setBackgroundColor:v25];

      CGRect v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      objc_msgSend(v20[56], "setPreferredFramesPerSecond:", objc_msgSend(v26, "integerForKey:", @"ScribbleOverrideFPS"));

      [v20 addSubview:v20[56]];
    }
    objc_msgSend(v20, "_setUpSceneWithImage:", a3, v29, v30, v31, v32);
    CGRect v27 = v20;
  }
  return v5;
}

uint64_t __45__WBSScribbleEffectView_initWithImage_frame___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v2 = *(void *)(a1 + 72);
  v3 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v3 setContents:v2];
}

- (void)_setUpSceneWithImage:(CGImage *)a3
{
  gotLoadHelper_x8__OBJC_CLASS____TtC3VFX8VFXScene(v3);
  if (objc_opt_class() && [(WBSScribbleEffectView *)self _loadSceneAndEffect])
  {
    if ([(WBSScribbleEffectView *)self _loadTextureWithImage:a3])
    {
      [(WBSScribbleEffectView *)self _bindAspectRatio];
      self->_sceneIsSetUp = 1;
    }
  }
}

- (BOOL)_loadSceneAndEffect
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v4 = v3;
  uint64_t v8 = 0;
  CGFloat v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5 = prewarmingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke;
  block[3] = &unk_1E5E45E18;
  block[6] = v4;
  block[4] = self;
  void block[5] = &v8;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

void __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke(uint64_t a1)
{
  if (prewarmedScene)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke_cold_2(v2, a1);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(id)objc_opt_class() _prewarmSceneAndEffect];
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke_cold_1(a1 + 40, v3, a1);
    }
  }
  if (prewarmedScene)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 440), (id)prewarmedScene);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 432), (id)prewarmedEffect);
    uint64_t v4 = (void *)prewarmedScene;
    prewarmedScene = 0;

    v5 = (void *)prewarmedEffect;
    prewarmedEffect = 0;
  }
}

+ (BOOL)_prewarmSceneAndEffect
{
  uint64_t v2 = prewarmingQueue();
  dispatch_assert_queue_V2(v2);

  if (prewarmedScene) {
    return 1;
  }
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXScribble();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[WBSScribbleEffectView _prewarmSceneAndEffect](v4);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F983D8]);
  [v5 setHandler:&__block_literal_global_19_0];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 URLForResource:@"DustEffect25_6" withExtension:@"vfx"];
  gotLoadHelper_x8__OBJC_CLASS___VFXSceneLoadOptions(v8);
  id v10 = objc_alloc_init(*(Class *)(v9 + 2480));
  id v11 = MTLCreateSystemDefaultDevice();
  [v10 setDevice:v11];

  gotLoadHelper_x8__OBJC_CLASS____TtC3VFX8VFXScene(v12);
  double v14 = (void *)[objc_alloc(*(Class *)(v13 + 2520)) initWithOptions:v10];
  id v19 = 0;
  double v15 = [v14 addEffectFrom:v7 error:&v19];
  id v16 = v19;
  BOOL v3 = v16 == 0;
  if (v16)
  {
    double v17 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[WBSScribbleEffectView _prewarmSceneAndEffect];
    }
  }
  else
  {
    objc_storeStrong((id *)&prewarmedScene, v14);
    objc_storeStrong((id *)&prewarmedEffect, v15);
  }

  return v3;
}

void __47__WBSScribbleEffectView__prewarmSceneAndEffect__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXScribble();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __47__WBSScribbleEffectView__prewarmSceneAndEffect__block_invoke_cold_1(v0);
  }
}

- (BOOL)_loadTextureWithImage:(CGImage *)a3
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F353C0]) initWithDevice:self->_device];
  id v10 = 0;
  v6 = (void *)[v5 newTextureWithCGImage:a3 options:0 error:&v10];
  id v7 = v10;
  if (v7)
  {
    double v8 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSScribbleEffectView _loadTextureWithImage:](v8, v7);
    }
  }
  else
  {
    [(_TtC3VFX9VFXEffect *)self->_vfxEffect setClientTextureWithId:[(_TtC3VFX9VFXEffect *)self->_vfxEffect fetchClientTextureIDWithNamed:@"erasedImage"] texture:v6];
  }

  return v7 == 0;
}

- (void)_bindAspectRatio
{
  BOOL v3 = [(_TtC3VFX9VFXEffect *)self->_vfxEffect firstBindingWithName:@"viewRatioX"];
  [(WBSScribbleEffectView *)self bounds];
  float v6 = v4 / v5;
  vfxEffect = self->_vfxEffect;
  uint64_t v8 = [v3 objectID];
  uint64_t v9 = [v3 type];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__WBSScribbleEffectView__bindAspectRatio__block_invoke;
  v10[3] = &__block_descriptor_44_e12_v24__0_v8Q16l;
  v10[4] = 4;
  float v11 = v6;
  [(_TtC3VFX9VFXEffect *)vfxEffect setParameterOf:v8 named:@"viewRatioX" type:v9 size:4 with:v10];
}

void *__41__WBSScribbleEffectView__bindAspectRatio__block_invoke(void *result, void *__dst, size_t a3)
{
  if (result[4] == a3) {
    return memcpy(__dst, result + 5, a3);
  }
  return result;
}

- (void)startEffectWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_sceneIsSetUp)
  {
    [(_TtC3VFX8VFXScene *)self->_vfxScene setIsPlaying:1];
    LODWORD(v5) = 1067869798;
    [(_TtC3VFX8VFXScene *)self->_vfxScene setTimeScale:v5];
    [(VFXView *)self->_vfxView setScene:self->_vfxScene];
  }
  imageLayer = self->_imageLayer;
  id v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v7 setDuration:0.5];
  uint64_t v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v7 setTimingFunction:v8];

  [v7 setFromValue:&unk_1F0341940];
  [v7 setToValue:&unk_1F0341958];
  [v7 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v7 setRemovedOnCompletion:0];
  [(CALayer *)imageLayer addAnimation:v7 forKey:0];

  dispatch_time_t v9 = dispatch_time(0, 1200000000);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__WBSScribbleEffectView_startEffectWithCompletion___block_invoke;
  v11[3] = &unk_1E5E420C8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_after(v9, MEMORY[0x1E4F14428], v11);
}

uint64_t __51__WBSScribbleEffectView_startEffectWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vfxView, 0);
  objc_storeStrong((id *)&self->_vfxScene, 0);
  objc_storeStrong((id *)&self->_vfxEffect, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)a1 + 8) + 24)) {
    id v4 = @"succeeded";
  }
  else {
    id v4 = @"failed";
  }
  double v5 = (void *)MEMORY[0x1E4F1C9C8];
  float v6 = a2;
  [v5 timeIntervalSinceReferenceDate];
  double v8 = (v7 - *(double *)(a3 + 48)) * 1000.0;
  int v9 = 138412546;
  id v10 = v4;
  __int16 v11 = 2048;
  double v12 = v8;
  _os_log_debug_impl(&dword_1ABB70000, v6, OS_LOG_TYPE_DEBUG, "Synchronously loaded hiding effect (%@) (%.0f ms)", (uint8_t *)&v9, 0x16u);
}

void __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke_cold_2(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a1;
  [v3 timeIntervalSinceReferenceDate];
  double v6 = (v5 - *(double *)(a2 + 48)) * 1000.0;
  int v7 = 134217984;
  double v8 = v6;
  _os_log_debug_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_DEBUG, "Used a prewarmed hiding effect (%.0f ms)", (uint8_t *)&v7, 0xCu);
}

+ (void)_prewarmSceneAndEffect
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "Prewarming hiding effect…", v1, 2u);
}

void __47__WBSScribbleEffectView__prewarmSceneAndEffect__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "Done prewarming.", v1, 2u);
}

- (void)_loadTextureWithImage:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Failed to load texture for snapshot: %{public}@", v7, v8, v9, v10, 2u);
}

@end