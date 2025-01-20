@interface NTKSwatchRenderer
+ (BOOL)containsSwatchForKey:(id)a3;
+ (id)_sharedRenderer;
+ (id)cachedSwatchForKey:(id)a3;
+ (id)renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7;
+ (void)renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7 completion:(id)a8;
- (BOOL)_isCATransactionCommitting;
- (id)_ca_renderSwatchUsingCARenderServer:(id)a3 size:(CGSize)a4 forDevice:(id)a5;
- (id)_cachedSwatchImageForKey:(id)a3;
- (id)_init;
- (id)_renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7;
- (id)_ui_renderSwatchUsingUIGraphicsImageRenderer:(id)a3;
- (void)_renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7 completion:(id)a8;
- (void)_setSwatchImage:(id)a3 forKey:(id)a4;
@end

@implementation NTKSwatchRenderer

+ (id)_sharedRenderer
{
  if (_sharedRenderer_onceToken != -1) {
    dispatch_once(&_sharedRenderer_onceToken, &__block_literal_global);
  }
  v2 = (void *)_sharedRenderer_sharedRenderer;
  return v2;
}

void __36__NTKSwatchRenderer__sharedRenderer__block_invoke()
{
  id v0 = [[NTKSwatchRenderer alloc] _init];
  v1 = (void *)_sharedRenderer_sharedRenderer;
  _sharedRenderer_sharedRenderer = (uint64_t)v0;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKSwatchRenderer;
  v2 = [(NTKSwatchRenderer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__NTKSwatchRenderer__init__block_invoke;
    block[3] = &unk_1E62BFF20;
    v6 = v2;
    if (_init_onceToken != -1) {
      dispatch_once(&_init_onceToken, block);
    }
  }
  return v3;
}

void __26__NTKSwatchRenderer__init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

+ (BOOL)containsSwatchForKey:(id)a3
{
  uint64_t v3 = [a1 cachedSwatchForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)cachedSwatchForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 _sharedRenderer];
  v6 = [v5 _cachedSwatchImageForKey:v4];

  return v6;
}

+ (id)renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = [a1 _sharedRenderer];
  v17 = objc_msgSend(v16, "_renderSwatchForView:size:device:key:using:", v15, v14, v13, a7, width, height);

  return v17;
}

+ (void)renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7 completion:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [a1 _sharedRenderer];
  objc_msgSend(v19, "_renderSwatchForView:size:device:key:using:completion:", v18, v17, v16, a7, v15, width, height);
}

- (id)_cachedSwatchImageForKey:(id)a3
{
  return [(NSCache *)self->_swatchCache objectForKey:a3];
}

- (void)_setSwatchImage:(id)a3 forKey:(id)a4
{
}

- (BOOL)_isCATransactionCommitting
{
  return ([MEMORY[0x1E4F39CF8] currentState] >> 3) & 1;
}

- (void)_renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7 completion:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v16 = a8;
  -[NTKSwatchRenderer _renderSwatchForView:size:device:key:using:](self, "_renderSwatchForView:size:device:key:using:", a3, a5, a6, a7, width, height);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a8 + 2))(v16, v17);
}

- (id)_renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315650;
    v22 = "-[NTKSwatchRenderer _renderSwatchForView:size:device:key:using:]";
    __int16 v23 = 2112;
    id v24 = v15;
    __int16 v25 = 2048;
    unint64_t v26 = a7;
    _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_INFO, "%s — rendering swatch for %@ using %ld", (uint8_t *)&v21, 0x20u);
  }

  if (a7 == 1)
  {
    uint64_t v17 = [(NTKSwatchRenderer *)self _ui_renderSwatchUsingUIGraphicsImageRenderer:v13];
  }
  else
  {
    if (a7) {
      goto LABEL_9;
    }
    uint64_t v17 = -[NTKSwatchRenderer _ca_renderSwatchUsingCARenderServer:size:forDevice:](self, "_ca_renderSwatchUsingCARenderServer:size:forDevice:", v13, v14, width, height);
  }
  id v18 = (void *)v17;
  if (v17)
  {
    [(NTKSwatchRenderer *)self _setSwatchImage:v17 forKey:v15];
    goto LABEL_12;
  }
LABEL_9:
  id v19 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[NTKSwatchRenderer _renderSwatchForView:size:device:key:using:]((uint64_t)v15, v19);
  }

  id v18 = 0;
LABEL_12:

  return v18;
}

- (id)_ui_renderSwatchUsingUIGraphicsImageRenderer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [v4 bounds];
  v8 = objc_msgSend(v5, "initWithSize:", v6, v7);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__NTKSwatchRenderer__ui_renderSwatchUsingUIGraphicsImageRenderer___block_invoke;
  v12[3] = &unk_1E62BFF48;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  v10 = [v8 imageWithActions:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

void __66__NTKSwatchRenderer__ui_renderSwatchUsingUIGraphicsImageRenderer___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) layer];
    objc_msgSend(v4, "renderInContext:", objc_msgSend(v5, "CGContext"));
  }
}

- (id)_ca_renderSwatchUsingCARenderServer:(id)a3 size:(CGSize)a4 forDevice:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  if ([(NTKSwatchRenderer *)self _isCATransactionCommitting])
  {
    v11 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NTKSwatchRenderer _ca_renderSwatchUsingCARenderServer:size:forDevice:](v11);
    }

    v12 = 0;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1C1875BE0]();
    [v9 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1EC0]) initWithNibName:0 bundle:0];
    __int16 v23 = [v22 view];
    objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

    id v24 = [v22 view];
    [v24 addSubview:v9];

    __int16 v25 = [NTKFaceSnapshottingWindow alloc];
    unint64_t v26 = -[NTKFaceSnapshottingWindow initWithFrame:](v25, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v19, v21);
    [(NTKFaceSnapshottingWindow *)v26 updateForDevice:v10];
    [(NTKFaceSnapshottingWindow *)v26 setHidden:0];
    uint64_t v27 = [MEMORY[0x1E4FB1618] clearColor];
    [(NTKFaceSnapshottingWindow *)v26 setBackgroundColor:v27];

    _UIAppSetStatusBarOrientation();
    _UIAppSetStatusBarHeight();
    [(NTKFaceSnapshottingWindow *)v26 setRootViewController:v22];
    [(NTKFaceSnapshottingWindow *)v26 setHidden:0];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(NTKFaceSnapshottingWindow *)v26 setNeedsLayout];
    [(NTKFaceSnapshottingWindow *)v26 layoutIfNeeded];
    [(NTKFaceSnapshottingWindow *)v26 setNeedsDisplay];
    [MEMORY[0x1E4F39CF8] commit];
    [MEMORY[0x1E4F39CF8] flush];
    [MEMORY[0x1E4F39CF8] synchronize];
    v28 = NTKRenderSnapshotFromWindow(v26, 2);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:", 0.0, 0.0, width, height);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __72__NTKSwatchRenderer__ca_renderSwatchUsingCARenderServer_size_forDevice___block_invoke;
    v31[3] = &unk_1E62BFF70;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    id v32 = v28;
    double v35 = width;
    double v36 = height;
    v12 = [v29 imageWithActions:v31];
    [v9 removeFromSuperview];
    [(NTKFaceSnapshottingWindow *)v26 setRootViewController:0];
    [(NTKFaceSnapshottingWindow *)v26 setHidden:1];
  }

  return v12;
}

uint64_t __72__NTKSwatchRenderer__ca_renderSwatchUsingCARenderServer_size_forDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void).cxx_destruct
{
}

- (void)_renderSwatchForView:(uint64_t)a1 size:(NSObject *)a2 device:key:using:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[NTKSwatchRenderer _renderSwatchForView:size:device:key:using:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "%s — swatchImage returned nil for %@", (uint8_t *)&v2, 0x16u);
}

- (void)_ca_renderSwatchUsingCARenderServer:(os_log_t)log size:forDevice:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[NTKSwatchRenderer _ca_renderSwatchUsingCARenderServer:size:forDevice:]";
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "%s — currently kCATransactionCommitting; aborting swatch render",
    (uint8_t *)&v1,
    0xCu);
}

@end