@interface SBUILegibilityMetalEngine
- (BOOL)useMinFillHeightForTemplateGeneration;
- (CGSize)calculateShadowImageViewSizeForOriginalImage:(id)a3 shadowImage:(id)a4 settings:(id)a5;
- (NSString)description;
- (SBUILegibilityMetalEngine)initWithEngineIdentifier:(id)a3;
- (SBUILegibilityMetalEngine)initWithEngineIdentifier:(id)a3 algorithm:(int64_t)a4;
- (id)_findEngineConfigurationMatchingScreen:(id)a3 settings:(id)a4;
- (id)applyStrength:(double)a3 toImage:(id)a4 settings:(id)a5;
- (id)executeAsyncLegibilityUpdateForContainer:(id)a3 image:(id)a4 settings:(id)a5 strength:(double *)a6 completion:(id)a7;
- (int64_t)algorithm;
- (void)_teardownCaches:(id)a3;
- (void)executeLegibilityUpdateForContainer:(id)a3 forImage:(id)a4 settings:(id)a5 strength:(double *)a6 engineResult:(id *)a7;
- (void)prewarmForSettings:(id)a3 maxSize:(CGSize)a4 minSize:(CGSize)a5 scale:(double)a6;
- (void)setUseMinFillHeightForTemplateGeneration:(BOOL)a3;
@end

@implementation SBUILegibilityMetalEngine

- (SBUILegibilityMetalEngine)initWithEngineIdentifier:(id)a3
{
  return [(SBUILegibilityMetalEngine *)self initWithEngineIdentifier:a3 algorithm:0];
}

- (SBUILegibilityMetalEngine)initWithEngineIdentifier:(id)a3 algorithm:(int64_t)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBUILegibilityMetalEngine;
  v7 = [(SBUILegibilityMetalEngine *)&v18 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    engineIdentifier = v7->_engineIdentifier;
    v7->_engineIdentifier = (NSString *)v8;

    v7->_algorithm = a4;
    v10 = [[SBUILegibilityCache alloc] initWithEngine:v7];
    legibilityCache = v7->_legibilityCache;
    v7->_legibilityCache = v10;

    uint64_t v12 = [MEMORY[0x1E4F42D90] mainScreen];
    screen = v7->_screen;
    v7->_screen = (UIScreen *)v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    asyncOperationQueue = v7->_asyncOperationQueue;
    v7->_asyncOperationQueue = v14;

    [(NSOperationQueue *)v7->_asyncOperationQueue setMaxConcurrentOperationCount:10];
    [(NSOperationQueue *)v7->_asyncOperationQueue setQualityOfService:17];
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v7 selector:sel__teardownCaches_ name:@"SBUILegibilityEngineShouldClearCachesNotification" object:0];
  }
  return v7;
}

- (void)executeLegibilityUpdateForContainer:(id)a3 forImage:(id)a4 settings:(id)a5 strength:(double *)a6 engineResult:(id *)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  [v13 size];
  if (self->_useMinFillHeightForTemplateGeneration)
  {
    v15 = -[SBUILegibilityCache templateImageForSettings:matchingSize:](self->_legibilityCache, "templateImageForSettings:matchingSize:", v14);
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;
  if (!self->_useMinFillHeightForTemplateGeneration) {
    goto LABEL_9;
  }
  v17 = [v12 shadowImage];
  if (!BSEqualObjects())
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_super v18 = [v12 legibilityEngine];
  if (v18 != self)
  {

    goto LABEL_8;
  }
  v27 = [v12 legibilitySettings];
  int v28 = BSEqualObjects();

  if (!v28)
  {
LABEL_9:
    if (v16)
    {
      v19 = SBLogLegibility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v30 = self;
        __int16 v31 = 2112;
        id v32 = v12;
        __int16 v33 = 2112;
        id v34 = v13;
        __int16 v35 = 2048;
        id v36 = v14;
        _os_log_debug_impl(&dword_1A7607000, v19, OS_LOG_TYPE_DEBUG, "(%@) Legibility background image already prepared for view '%@' / image '%@', settings '%p'", buf, 0x2Au);
      }

      v20 = v16;
      if (a7)
      {
        a7->var0 = 1;
        v20 = v16;
      }
      if (a6)
      {
LABEL_15:
        v21 = [(SBUILegibilityMetalEngine *)self applyStrength:v20 toImage:v14 settings:*a6];
LABEL_22:
        [v12 updateOrigImage:v13 shadowImage:v20 strengthenedShadowImage:v21 settings:v14 engine:self isTemplate:v16 != 0 withStrength:a6 context:0];
        goto LABEL_23;
      }
    }
    else
    {
      v22 = [v12 _screen];
      screen = v22;
      if (!v22) {
        screen = self->_screen;
      }
      v24 = screen;

      v25 = [(SBUILegibilityMetalEngine *)self _findEngineConfigurationMatchingScreen:v24 settings:v14];
      v20 = [v25 executeBlurForImage:v13 settings:v14];
      v26 = SBLogLegibility();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v30 = self;
        __int16 v31 = 2112;
        id v32 = v12;
        __int16 v33 = 2112;
        id v34 = v13;
        __int16 v35 = 2048;
        id v36 = v14;
        _os_log_impl(&dword_1A7607000, v26, OS_LOG_TYPE_DEFAULT, "(%@) Drew legibility background image for view '%@' / image '%@', settings '%p'", buf, 0x2Au);
      }

      if (a6) {
        goto LABEL_15;
      }
    }
    v21 = 0;
    goto LABEL_22;
  }
  v21 = SBLogLegibility();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v30 = self;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2048;
    id v36 = v14;
    _os_log_debug_impl(&dword_1A7607000, v21, OS_LOG_TYPE_DEBUG, "(%@) Skipping legibility background image generation for view '%@' / image '%@', settings '%p'; this is redundent",
      buf,
      0x2Au);
  }
  v20 = v16;
LABEL_23:
}

- (id)executeAsyncLegibilityUpdateForContainer:(id)a3 image:(id)a4 settings:(id)a5 strength:(double *)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v32 = a7;
  v15 = [v12 _screen];
  screen = v15;
  if (!v15) {
    screen = self->_screen;
  }
  v17 = screen;

  objc_super v18 = [(SBUILegibilityMetalEngine *)self _findEngineConfigurationMatchingScreen:v17 settings:v14];
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__2;
  v67[4] = __Block_byref_object_dispose__2;
  id v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__2;
  v65[4] = __Block_byref_object_dispose__2;
  id v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__2;
  v63[4] = __Block_byref_object_dispose__2;
  id v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2810000000;
  v61[3] = &unk_1A76B6969;
  char v62 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__2;
  v59 = __Block_byref_object_dispose__2;
  id v60 = 0;
  v19 = (void *)MEMORY[0x1E4F28B48];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke;
  v45[3] = &unk_1E5CCE088;
  v50 = &v55;
  v51 = v63;
  v52 = v67;
  id v31 = v18;
  id v46 = v31;
  id v20 = v13;
  id v47 = v20;
  id v21 = v14;
  v53 = v65;
  v54 = a6;
  id v48 = v21;
  v49 = self;
  uint64_t v22 = [v19 blockOperationWithBlock:v45];
  v23 = (void *)v56[5];
  v56[5] = v22;

  objc_initWeak(&location, self);
  v24 = (void *)v56[5];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_2;
  v33[3] = &unk_1E5CCE0B0;
  v38 = &v55;
  v39 = v63;
  id v25 = v12;
  id v34 = v25;
  id v26 = v20;
  id v35 = v26;
  v40 = v67;
  v41 = v65;
  id v27 = v21;
  id v36 = v27;
  objc_copyWeak(v43, &location);
  v43[1] = a6;
  id v28 = v32;
  id v37 = v28;
  v42 = v61;
  [v24 setCompletionBlock:v33];
  [(NSOperationQueue *)self->_asyncOperationQueue addOperation:v56[5]];
  id v29 = (id)v56[5];

  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);

  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);

  return v29;
}

void __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke(uint64_t a1)
{
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if ([v10 isCancelled])
  {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:SBUILegibilityErrorDomain code:3072 userInfo:0];
    uint64_t v3 = *(void *)(a1 + 72);
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) executeBlurForImage:*(void *)(a1 + 40) settings:*(void *)(a1 + 48)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    v7 = *(double **)(a1 + 96);
    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v2 = [*(id *)(a1 + 56) applyStrength:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) toImage:*(void *)(a1 + 48) settings:*v7];
    uint64_t v3 = *(void *)(a1 + 88);
  }
  uint64_t v8 = *(void *)(v3 + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v2;

LABEL_6:
}

void __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_3;
  block[3] = &unk_1E5CCE0B0;
  long long v9 = *(_OWORD *)(a1 + 64);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  long long v10 = *(_OWORD *)(a1 + 80);
  id v7 = *(id *)(a1 + 48);
  objc_copyWeak(v12, (id *)(a1 + 104));
  v12[1] = *(id *)(a1 + 112);
  id v2 = *(id *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 96);
  id v8 = v2;
  uint64_t v11 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v12);
}

void __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_3(uint64_t a1)
{
  id v14 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if ([v14 isCancelled] && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:SBUILegibilityErrorDomain code:3072 userInfo:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    [v5 updateOrigImage:v6 shadowImage:v7 strengthenedShadowImage:v8 settings:v9 engine:WeakRetained isTemplate:0 withStrength:*(void *)(a1 + 112) context:v14];
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, void, void, void, void, id, void))(v11 + 16))(v11, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 112), v14, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

- (void)prewarmForSettings:(id)a3 maxSize:(CGSize)a4 minSize:(CGSize)a5 scale:(double)a6
{
  double size = a4.height;
  double width = a4.width;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBUILegibilityMetalEngine.m", 409, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];
  }
  if (width > 0.0 && size > 0.0 && self->_useMinFillHeightForTemplateGeneration)
  {
    if (-[SBUILegibilityCache containsTemplateForSettings:](self->_legibilityCache, "containsTemplateForSettings:", v10, size))
    {
      uint64_t v11 = SBLogLegibility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v33.double width = width;
        v33.height = size;
        id v21 = NSStringFromCGSize(v33);
        *(_DWORD *)buf = 138412802;
        id v27 = self;
        __int16 v28 = 2048;
        id v29 = v10;
        __int16 v30 = 2112;
        id v31 = v21;
        _os_log_debug_impl(&dword_1A7607000, v11, OS_LOG_TYPE_DEBUG, "(%@) Bailing; templateImageForSettings already exists for settings %p, maxSize %@",
          buf,
          0x20u);
      }
    }
    else
    {
      [(UIScreen *)self->_screen scale];
      if (v12 != a6)
      {
        v23 = [NSString stringWithFormat:@"Screen scale is not what configured with!"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[SBUILegibilityMetalEngine prewarmForSettings:maxSize:minSize:scale:](a2, (uint64_t)self, (uint64_t)v23);
        }
        [v23 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A765E0F8);
      }
      uint64_t v11 = -[SBUILegibilityCache memoryPoolForGraphicsContextType:matchingSize:scale:](self->_legibilityCache, "memoryPoolForGraphicsContextType:matchingSize:scale:", 4, SBUILegibilityImageSizeForContentSizeAndSettings(v10, width));
      for (uint64_t i = 0; i != 10; ++i)
      {
        UIRoundToScale();
        double v15 = v14;
        UIRoundToScale();
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __70__SBUILegibilityMetalEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke;
        v25[3] = &__block_descriptor_48_e5_v8__0l;
        *(double *)&v25[4] = v15;
        *(double *)&v25[5] = v16;
        v17 = objc_msgSend(MEMORY[0x1E4F42A80], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 4, v11, v25, v15, v16, a6);
        objc_super v18 = [(SBUILegibilityMetalEngine *)self _findEngineConfigurationMatchingScreen:self->_screen settings:v10];
        v19 = [v18 executeBlurForImage:v17 settings:v10];
        if (v19)
        {
          -[SBUILegibilityCache cacheTemplateShadowImage:settings:maxSize:](self->_legibilityCache, "cacheTemplateShadowImage:settings:maxSize:", v19, v10, width, size);
          id v20 = SBLogLegibility();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v27 = self;
            __int16 v28 = 2048;
            id v29 = v10;
            _os_log_impl(&dword_1A7607000, v20, OS_LOG_TYPE_DEFAULT, "(%@) Prewarmed legibility background for settings %p", buf, 0x16u);
          }
        }
        else
        {
          id v20 = SBLogLegibility();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v27 = self;
            __int16 v28 = 2048;
            id v29 = v10;
            _os_log_error_impl(&dword_1A7607000, v20, OS_LOG_TYPE_ERROR, "(%@) FAILED to Prewarm legibility background for settings %p", buf, 0x16u);
          }
        }
      }
    }
  }
}

void __70__SBUILegibilityMetalEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F428B8] blackColor];
  [v2 setFill];

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  UIRectFill(*(CGRect *)&v5);
}

- (id)applyStrength:(double)a3 toImage:(id)a4 settings:(id)a5
{
  id v8 = a5;
  legibilityCache = self->_legibilityCache;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__SBUILegibilityMetalEngine_applyStrength_toImage_settings___block_invoke;
  v13[3] = &unk_1E5CCE0F8;
  id v14 = v8;
  id v10 = v8;
  uint64_t v11 = [(SBUILegibilityCache *)legibilityCache cachedStrengthForImage:a4 strength:v13 generator:a3];

  return v11;
}

id __60__SBUILegibilityMetalEngine_applyStrength_toImage_settings___block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 size];
  id v8 = objc_msgSend(v5, "sbui_strikeImageForLegibilitySettings:strength:size:type:pool:", v4, 4, 0, a3, v6, v7);

  SBFPreheatImageData();
  return v8;
}

- (CGSize)calculateShadowImageViewSizeForOriginalImage:(id)a3 shadowImage:(id)a4 settings:(id)a5
{
  id v6 = a5;
  [a3 size];
  double v8 = SBUILegibilityImageSizeForContentSizeAndSettings(v6, v7);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (id)_findEngineConfigurationMatchingScreen:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  enginesForSettingsForScreen = self->_enginesForSettingsForScreen;
  if (!enginesForSettingsForScreen)
  {
    double v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    double v10 = self->_enginesForSettingsForScreen;
    self->_enginesForSettingsForScreen = v9;

    enginesForSettingsForScreen = self->_enginesForSettingsForScreen;
  }
  double v11 = [(NSMapTable *)enginesForSettingsForScreen objectForKey:v7];
  uint64_t v12 = [v11 objectForKey:v6];
  if (v12)
  {
    id v13 = (_SBUILegibilityMetalEngineConfiguration *)v12;
  }
  else
  {
    if (!v11)
    {
      double v11 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      [(NSMapTable *)self->_enginesForSettingsForScreen setObject:v11 forKey:v7];
    }
    id v13 = [[_SBUILegibilityMetalEngineConfiguration alloc] initWithScreen:v6 settings:v7 algo:self->_algorithm];
    [v11 setObject:v13 forKey:v6];
  }
  id v14 = v13;

  return v14;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_engineIdentifier withName:@"engineIdentifier"];
  if (self->_algorithm) {
    uint64_t v4 = @"Gaussian";
  }
  else {
    uint64_t v4 = @"Tent";
  }
  [v3 appendString:v4 withName:@"algorithm"];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (void)_teardownCaches:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSOperationQueue *)self->_asyncOperationQueue cancelAllOperations];
  [(SBUILegibilityCache *)self->_legibilityCache removeAllObjects];
  id v5 = SBLogLegibility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "(%@) Cache teardown complete; requested by %@",
      (uint8_t *)&v6,
      0x16u);
  }
}

- (BOOL)useMinFillHeightForTemplateGeneration
{
  return self->_useMinFillHeightForTemplateGeneration;
}

- (void)setUseMinFillHeightForTemplateGeneration:(BOOL)a3
{
  self->_useMinFillHeightForTemplateGeneration = a3;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncOperationQueue, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_enginesForSettingsForScreen, 0);
  objc_storeStrong((id *)&self->_legibilityCache, 0);
  objc_storeStrong((id *)&self->_engineIdentifier, 0);
}

- (void)prewarmForSettings:(uint64_t)a3 maxSize:minSize:scale:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  int v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  double v15 = @"SBUILegibilityMetalEngine.m";
  __int16 v16 = 1024;
  int v17 = 423;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A7607000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end