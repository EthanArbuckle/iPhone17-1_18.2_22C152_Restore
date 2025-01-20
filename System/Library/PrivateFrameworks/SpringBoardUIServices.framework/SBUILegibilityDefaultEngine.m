@interface SBUILegibilityDefaultEngine
+ (id)defaultEngine;
- (BOOL)useMinFillHeightForTemplateGeneration;
- (CGSize)calculateShadowImageViewSizeForOriginalImage:(id)a3 shadowImage:(id)a4 settings:(id)a5;
- (NSString)description;
- (SBUILegibilityDefaultEngine)initWithEngineIdentifier:(id)a3;
- (id)applyStrength:(double)a3 toImage:(id)a4 settings:(id)a5;
- (id)executeAsyncLegibilityUpdateForContainer:(id)a3 image:(id)a4 settings:(id)a5 strength:(double *)a6 completion:(id)a7;
- (void)_teardownCaches:(id)a3;
- (void)executeLegibilityUpdateForContainer:(id)a3 forImage:(id)a4 settings:(id)a5 strength:(double *)a6 engineResult:(id *)a7;
- (void)prewarmForSettings:(id)a3 maxSize:(CGSize)a4 minSize:(CGSize)a5 scale:(double)a6;
- (void)setUseMinFillHeightForTemplateGeneration:(BOOL)a3;
@end

@implementation SBUILegibilityDefaultEngine

void __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_24(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_2;
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

void __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_2(uint64_t a1)
{
  id v14 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if ([v14 isCancelled] && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:SBUILegibilityErrorDomain code:3072 userInfo:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    v4 = *(void **)(v3 + 40);
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
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

void __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if ([v2 isCancelled])
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:SBUILegibilityErrorDomain code:3072 userInfo:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v6 = SBLogLegibility();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

    double Current = 0.0;
    if (v7) {
      double Current = CFAbsoluteTimeGetCurrent();
    }
    [*(id *)(a1 + 32) size];
    double v10 = SBUILegibilityImageSizeForContentSizeAndSettings(*(void **)(a1 + 40), v9);
    double v12 = v11;
    v13 = *(void **)(*(void *)(a1 + 48) + 8);
    [*(id *)(a1 + 32) scale];
    v15 = objc_msgSend(v13, "memoryPoolForGraphicsContextType:matchingSize:scale:", 4, v10, v12, v14);
    v16 = (void *)MEMORY[0x1E4F42A80];
    double v17 = *(double *)(a1 + 88);
    v19 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    [v19 size];
    uint64_t v22 = objc_msgSend(v16, "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:strength:type:pool:", v18, v19, 0, 0, 4, v15, v17, v20, v21);
    uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    v25 = *(double **)(a1 + 96);
    if (v25)
    {
      v26 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v27 = *(void *)(a1 + 40);
      double v28 = *v25;
      [v26 size];
      uint64_t v31 = objc_msgSend(v26, "sbui_strikeImageForLegibilitySettings:strength:size:type:pool:", v27, 4, v15, v28, v29, v30);
      uint64_t v32 = *(void *)(*(void *)(a1 + 80) + 8);
      v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;
    }
    v34 = SBLogLegibility();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);

    if (v35)
    {
      double v36 = CFAbsoluteTimeGetCurrent();
      v37 = SBLogLegibility();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = *(void *)(a1 + 32);
        uint64_t v39 = *(void *)(a1 + 40);
        int v40 = 138412802;
        uint64_t v41 = v38;
        __int16 v42 = 2048;
        uint64_t v43 = v39;
        __int16 v44 = 2048;
        double v45 = v36 - Current;
        _os_log_impl(&dword_1A7607000, v37, OS_LOG_TYPE_DEFAULT, "Async Shadow Draw time for image '%@', settings '%p': '%f' seconds", (uint8_t *)&v40, 0x20u);
      }
    }
  }
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
  result.width = v11;
  return result;
}

- (void)executeLegibilityUpdateForContainer:(id)a3 forImage:(id)a4 settings:(id)a5 strength:(double *)a6 engineResult:(id *)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
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
  double v17 = [v12 _screen];
  if (v17) {
    [v12 _screen];
  }
  else {
  uint64_t v18 = [MEMORY[0x1E4F42D90] mainScreen];
  }
  [v18 scale];
  double v20 = v19;

  if (!self->_useMinFillHeightForTemplateGeneration) {
    goto LABEL_12;
  }
  double v21 = [v12 image];
  if (!BSEqualObjects())
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v22 = [v12 legibilityEngine];
  if (v22 != self)
  {

    goto LABEL_11;
  }
  double v30 = [v12 legibilitySettings];
  int v31 = BSEqualObjects();

  if (!v31)
  {
LABEL_12:
    if (v16)
    {
      uint64_t v23 = SBLogLegibility();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v33 = self;
        __int16 v34 = 2112;
        id v35 = v12;
        __int16 v36 = 2112;
        id v37 = v13;
        __int16 v38 = 2048;
        id v39 = v14;
        _os_log_debug_impl(&dword_1A7607000, v23, OS_LOG_TYPE_DEBUG, "(%@) Legibility background image already prepared for view '%@' / image '%@', settings '%p'", buf, 0x2Au);
      }

      v24 = v16;
      if (a7)
      {
        a7->var0 = 1;
        v24 = v16;
      }
      if (a6)
      {
LABEL_18:
        v25 = [(SBUILegibilityDefaultEngine *)self applyStrength:v24 toImage:v14 settings:*a6];
LABEL_23:
        [v12 updateOrigImage:v13 shadowImage:v24 strengthenedShadowImage:v25 settings:v14 engine:self isTemplate:v16 != 0 withStrength:a6 context:0];
        goto LABEL_24;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1E4F42A80];
      [v13 size];
      v24 = objc_msgSend(v26, "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:type:pool:", v14, v13, 1, 4, 0, v20, v27, v28);
      double v29 = SBLogLegibility();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v33 = self;
        __int16 v34 = 2112;
        id v35 = v12;
        __int16 v36 = 2112;
        id v37 = v13;
        __int16 v38 = 2048;
        id v39 = v14;
        _os_log_impl(&dword_1A7607000, v29, OS_LOG_TYPE_DEFAULT, "(%@) Drew legibility background image for view '%@' / image '%@', settings '%p'", buf, 0x2Au);
      }

      if (a6) {
        goto LABEL_18;
      }
    }
    v25 = 0;
    goto LABEL_23;
  }
  v25 = SBLogLegibility();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v33 = self;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    id v37 = v13;
    __int16 v38 = 2048;
    id v39 = v14;
    _os_log_debug_impl(&dword_1A7607000, v25, OS_LOG_TYPE_DEBUG, "(%@) Skipping legibility background image generation for view '%@' / image '%@', settings '%p'; this is redundent",
      buf,
      0x2Au);
  }
  v24 = v16;
LABEL_24:
}

- (id)applyStrength:(double)a3 toImage:(id)a4 settings:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  legibilityCache = self->_legibilityCache;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__SBUILegibilityDefaultEngine_applyStrength_toImage_settings___block_invoke;
  v15[3] = &unk_1E5CCE430;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v11 = v9;
  id v12 = v8;
  id v13 = [(SBUILegibilityCache *)legibilityCache cachedStrengthForImage:v12 strength:v15 generator:a3];

  return v13;
}

- (id)executeAsyncLegibilityUpdateForContainer:(id)a3 image:(id)a4 settings:(id)a5 strength:(double *)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v32 = a7;
  v15 = [v12 _screen];
  if (v15) {
    objc_msgSend(v12, "_screen", v12);
  }
  else {
  id v16 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", v12);
  }
  [v16 scale];
  uint64_t v18 = v17;

  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__4;
  v67[4] = __Block_byref_object_dispose__4;
  id v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__4;
  v65[4] = __Block_byref_object_dispose__4;
  id v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__4;
  v63[4] = __Block_byref_object_dispose__4;
  id v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2810000000;
  v61[3] = &unk_1A76B6969;
  char v62 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__4;
  v59 = __Block_byref_object_dispose__4;
  id v60 = 0;
  double v19 = (void *)MEMORY[0x1E4F28B48];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke;
  v45[3] = &unk_1E5CCE3E0;
  v49 = &v55;
  v50 = v63;
  id v20 = v13;
  id v46 = v20;
  id v21 = v14;
  id v47 = v21;
  v48 = self;
  uint64_t v53 = v18;
  v54 = a6;
  v51 = v67;
  v52 = v65;
  uint64_t v22 = [v19 blockOperationWithBlock:v45];
  uint64_t v23 = (void *)v56[5];
  v56[5] = v22;

  objc_initWeak(&location, self);
  v24 = (void *)v56[5];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_24;
  v33[3] = &unk_1E5CCE0B0;
  __int16 v38 = &v55;
  id v39 = v63;
  id v25 = v31;
  id v34 = v25;
  id v26 = v20;
  id v35 = v26;
  uint64_t v40 = v67;
  uint64_t v41 = v65;
  id v27 = v21;
  id v36 = v27;
  objc_copyWeak(v43, &location);
  v43[1] = a6;
  id v28 = v32;
  id v37 = v28;
  __int16 v42 = v61;
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

id __62__SBUILegibilityDefaultEngine_applyStrength_toImage_settings___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 size];
  double v8 = SBUILegibilityImageSizeForContentSizeAndSettings(*(void **)(a1 + 40), v7);
  double v10 = v9;
  id v11 = *(void **)(*(void *)(a1 + 48) + 8);
  [*(id *)(a1 + 32) scale];
  id v13 = objc_msgSend(v11, "memoryPoolForGraphicsContextType:matchingSize:scale:", 4, v8, v10, v12);
  uint64_t v14 = *(void *)(a1 + 40);
  [v6 size];
  uint64_t v17 = objc_msgSend(v6, "sbui_strikeImageForLegibilitySettings:strength:size:type:pool:", v14, 4, v13, a3, v15, v16);

  SBFPreheatImageData();
  return v17;
}

- (void)prewarmForSettings:(id)a3 maxSize:(CGSize)a4 minSize:(CGSize)a5 scale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.height;
  double v10 = a4.width;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  if (!v28)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SBUILegibilityDefaultEngine.m", 191, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];
  }
  if (v10 > 0.0 && v9 > 0.0 && self->_useMinFillHeightForTemplateGeneration)
  {
    id v13 = self;
    objc_sync_enter(v13);
    if ([(SBUILegibilityCache *)v13->_legibilityCache containsTemplateForSettings:v28])
    {
      uint64_t v14 = SBLogLegibility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v52.double width = v10;
        v52.double height = v9;
        double v15 = NSStringFromCGSize(v52);
        *(_DWORD *)buf = 138412802;
        id v46 = v13;
        __int16 v47 = 2048;
        id v48 = v28;
        __int16 v49 = 2112;
        v50 = v15;
        _os_log_debug_impl(&dword_1A7607000, v14, OS_LOG_TYPE_DEBUG, "(%@) Bailing; templateImageForSettings already exists for settings %p, maxSize %@",
          buf,
          0x20u);
      }
    }
    else
    {
      double v16 = SBLogLegibility();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

      CFAbsoluteTime Current = 0.0;
      if (v17) {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      }
      double v19 = dispatch_group_create();
      id v20 = -[SBUILegibilityCache memoryPoolForGraphicsContextType:matchingSize:scale:](v13->_legibilityCache, "memoryPoolForGraphicsContextType:matchingSize:scale:", 4, SBUILegibilityImageSizeForContentSizeAndSettings(v28, v10));
      for (uint64_t i = 0; i != 10; ++i)
      {
        dispatch_group_enter(v19);
        uint64_t v22 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __72__SBUILegibilityDefaultEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke;
        block[3] = &unk_1E5CCE408;
        uint64_t v37 = i;
        double v38 = width;
        double v39 = height;
        double v40 = v10 - width;
        double v41 = a6;
        double v42 = v9 - height;
        id v23 = v28;
        id v33 = v23;
        id v24 = v20;
        id v34 = v24;
        id v35 = v13;
        double v43 = v10;
        double v44 = v9;
        uint64_t v14 = v19;
        id v36 = v14;
        dispatch_async(v22, block);
      }
      id v25 = SBLogLegibility();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);

      if (v26)
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __72__SBUILegibilityDefaultEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke_28;
        v29[3] = &unk_1E5CCC7D8;
        CFAbsoluteTime v31 = Current;
        v29[4] = v13;
        id v30 = v23;
        dispatch_group_notify(v14, MEMORY[0x1E4F14428], v29);
      }
    }

    objc_sync_exit(v13);
  }
}

+ (id)defaultEngine
{
  if (defaultEngine_onceToken != -1) {
    dispatch_once(&defaultEngine_onceToken, &__block_literal_global_31);
  }
  id v2 = (void *)defaultEngine_defaultEngine;
  return v2;
}

void __44__SBUILegibilityDefaultEngine_defaultEngine__block_invoke()
{
  v0 = [[SBUILegibilityDefaultEngine alloc] initWithEngineIdentifier:@"Default Engine"];
  [(SBUILegibilityDefaultEngine *)v0 setUseMinFillHeightForTemplateGeneration:1];
  v1 = (void *)defaultEngine_defaultEngine;
  defaultEngine_defaultEngine = (uint64_t)v0;
}

- (SBUILegibilityDefaultEngine)initWithEngineIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBUILegibilityDefaultEngine.m", 50, @"Invalid parameter not satisfying: %@", @"engineIdentifier" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBUILegibilityDefaultEngine;
  id v6 = [(SBUILegibilityDefaultEngine *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    engineIdentifier = v6->_engineIdentifier;
    v6->_engineIdentifier = (NSString *)v7;

    double v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    asyncOperationQueue = v6->_asyncOperationQueue;
    v6->_asyncOperationQueue = v9;

    [(NSOperationQueue *)v6->_asyncOperationQueue setMaxConcurrentOperationCount:4];
    [(NSOperationQueue *)v6->_asyncOperationQueue setQualityOfService:25];
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__teardownCaches_ name:@"SBUILegibilityEngineShouldClearCachesNotification" object:0];

    double v12 = [[SBUILegibilityCache alloc] initWithEngine:v6];
    legibilityCache = v6->_legibilityCache;
    v6->_legibilityCache = v12;
  }
  return v6;
}

void __72__SBUILegibilityDefaultEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  UIRoundToScale();
  CGFloat v3 = v2;
  UIRoundToScale();
  v22.size.double height = v4;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.double width = v3;
  CGRect v23 = CGRectIntegral(v22);
  id v5 = objc_msgSend(MEMORY[0x1E4F42A80], "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:type:pool:", *(void *)(a1 + 32), 0, 1, 4, *(void *)(a1 + 40), *(double *)(a1 + 96), v23.size.width, v23.size.height);
  if (v5)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "cacheTemplateShadowImage:settings:maxSize:", v5, *(void *)(a1 + 32), *(double *)(a1 + 112), *(double *)(a1 + 120));
    id v6 = SBLogLegibility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 64);
      uint64_t v9 = *(void *)(a1 + 32);
      int v13 = 138413058;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = 10;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_DEFAULT, "(%@) Prewarmed %lu / %lu legibility background for settings %p", (uint8_t *)&v13, 0x2Au);
    }
  }
  else
  {
    id v6 = SBLogLegibility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138413058;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = 10;
      __int16 v19 = 2048;
      uint64_t v20 = v12;
      _os_log_error_impl(&dword_1A7607000, v6, OS_LOG_TYPE_ERROR, "(%@) FAILED to Prewarm legibility background %lu / %lu for settings %p", (uint8_t *)&v13, 0x2Au);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __72__SBUILegibilityDefaultEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke_28(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = *(double *)(a1 + 48);
  CGFloat v4 = SBLogLegibility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138413058;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = 10;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    double v14 = Current - v3;
    _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "(%@) Finished prewarm of %lu legibility backgrounds for settings %p in %f seconds", (uint8_t *)&v7, 0x2Au);
  }
}

- (void)_teardownCaches:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSOperationQueue *)self->_asyncOperationQueue cancelAllOperations];
  [(SBUILegibilityCache *)self->_legibilityCache removeAllObjects];
  uint64_t v5 = SBLogLegibility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "(%@) Cache teardown complete; requested by %@",
      (uint8_t *)&v6,
      0x16u);
  }
}

- (NSString)description
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_engineIdentifier withName:@"engineIdentifier"];
  id v4 = [v3 build];

  return (NSString *)v4;
}

- (BOOL)useMinFillHeightForTemplateGeneration
{
  return self->_useMinFillHeightForTemplateGeneration;
}

- (void)setUseMinFillHeightForTemplateGeneration:(BOOL)a3
{
  self->_useMinFillHeightForTemplateGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncOperationQueue, 0);
  objc_storeStrong((id *)&self->_engineIdentifier, 0);
  objc_storeStrong((id *)&self->_legibilityCache, 0);
}

@end