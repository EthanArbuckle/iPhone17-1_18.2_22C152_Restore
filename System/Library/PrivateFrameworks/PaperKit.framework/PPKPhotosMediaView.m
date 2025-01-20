@interface PPKPhotosMediaView
- (BOOL)isHDRAllowed;
- (BOOL)isImageAnalysisEnabled;
- (PPKPhotosMediaView)initWithFrame:(CGRect)a3;
- (PPKPhotosMediaView)initWithImage:(CGImage *)a3 orientation:(int64_t)a4;
- (PPKPhotosMediaView)initWithImage:(id)a3;
- (PPKPhotosMediaView)initWithImageData:(id)a3;
- (PPKPhotosMediaView)initWithImageURL:(id)a3;
- (PPKPhotosMediaViewImageAnalysisInteractionContext)imageAnalysisContext;
- (PXDisplayAssetView)assetView;
- (_PhotosMediaViewAnalysisController)analysisController;
- (void)_ensureImageAnalysisControllerIfNecessary;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setImage:(CGImage *)a3 orientation:(int64_t)a4;
- (void)setImage:(id)a3;
- (void)setIsHDRAllowed:(BOOL)a3;
- (void)setIsHDRAllowed:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsImageAnalysisEnabled:(BOOL)a3;
- (void)setURL:(id)a3;
@end

@implementation PPKPhotosMediaView

- (PPKPhotosMediaView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PPKPhotosMediaView;
  v3 = -[PPKPhotosMediaView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_isImageAnalysisEnabled = 1;
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v5 = (void *)getPXDisplayAssetViewClass_softClass;
    uint64_t v15 = getPXDisplayAssetViewClass_softClass;
    if (!getPXDisplayAssetViewClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getPXDisplayAssetViewClass_block_invoke;
      v11[3] = &unk_2640D3AD8;
      v11[4] = &v12;
      __getPXDisplayAssetViewClass_block_invoke((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = v5;
    _Block_object_dispose(&v12, 8);
    v7 = (PXDisplayAssetView *)objc_alloc_init(v6);
    assetView = v4->_assetView;
    v4->_assetView = v7;

    [(PPKPhotosMediaView *)v4 setIsHDRAllowed:0 animated:0];
    [(PPKPhotosMediaView *)v4 addSubview:v4->_assetView];
  }
  return v4;
}

- (PPKPhotosMediaView)initWithImageData:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F827E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithData:v5];

  v7 = [(PPKPhotosMediaView *)self initWithImage:v6];
  return v7;
}

- (PPKPhotosMediaView)initWithImageURL:(id)a3
{
  id v4 = a3;
  id v5 = -[PPKPhotosMediaView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    id v6 = objc_alloc_init((Class)getPXFileBackedUIMediaProviderClass());
    v7 = [(PPKPhotosMediaView *)v5 assetView];
    [v7 setMediaProvider:v6];

    v8 = (void *)[objc_alloc((Class)getPXFileBackedAssetClass()) initWithURL:v4];
    v9 = [(PPKPhotosMediaView *)v5 assetView];
    [v9 setAsset:v8];
  }
  return v5;
}

- (PPKPhotosMediaView)initWithImage:(CGImage *)a3 orientation:(int64_t)a4
{
  id v5 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:a3 imageOrientation:a4];
  id v6 = [(PPKPhotosMediaView *)self initWithImage:v5];

  return v6;
}

- (PPKPhotosMediaView)initWithImage:(id)a3
{
  id v4 = a3;
  id v5 = -[PPKPhotosMediaView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    id v6 = objc_alloc_init(_ImageAssetMediaProvider);
    v7 = [(PPKPhotosMediaView *)v5 assetView];
    [v7 setMediaProvider:v6];

    v8 = [[_ImageAsset alloc] initWithImage:v4];
    v9 = [(PPKPhotosMediaView *)v5 assetView];
    [v9 setAsset:v8];
  }
  return v5;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_ImageAssetMediaProvider);
  id v6 = [(PPKPhotosMediaView *)self assetView];
  [v6 setMediaProvider:v5];

  v8 = [[_ImageAsset alloc] initWithImage:v4];
  v7 = [(PPKPhotosMediaView *)self assetView];
  [v7 setAsset:v8];
}

- (void)setURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)getPXFileBackedUIMediaProviderClass());
  id v6 = [(PPKPhotosMediaView *)self assetView];
  [v6 setMediaProvider:v5];

  id v8 = (id)[objc_alloc((Class)getPXFileBackedAssetClass()) initWithURL:v4];
  v7 = [(PPKPhotosMediaView *)self assetView];
  [v7 setAsset:v8];
}

- (void)setImage:(CGImage *)a3 orientation:(int64_t)a4
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:a3 imageOrientation:a4];
  [(PPKPhotosMediaView *)self setImage:v5];
}

- (void)layoutSubviews
{
  [(PPKPhotosMediaView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(PPKPhotosMediaView *)self assetView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (PPKPhotosMediaViewImageAnalysisInteractionContext)imageAnalysisContext
{
  [(PPKPhotosMediaView *)self _ensureImageAnalysisControllerIfNecessary];
  return (PPKPhotosMediaViewImageAnalysisInteractionContext *)[(PPKPhotosMediaView *)self analysisController];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PPKPhotosMediaView;
  [(PPKPhotosMediaView *)&v4 didMoveToWindow];
  double v3 = [(PPKPhotosMediaView *)self window];

  if (v3) {
    [(PPKPhotosMediaView *)self _ensureImageAnalysisControllerIfNecessary];
  }
}

- (void)_ensureImageAnalysisControllerIfNecessary
{
  analysisController = [(PPKPhotosMediaView *)self analysisController];
  if (!analysisController)
  {
    if (![(PPKPhotosMediaView *)self isImageAnalysisEnabled]) {
      return;
    }
    objc_super v4 = [[_PhotosMediaViewAnalysisController alloc] initWithAssetView:self->_assetView];
    analysisController = self->_analysisController;
    self->_analysisController = v4;
  }
}

- (void)setIsImageAnalysisEnabled:(BOOL)a3
{
  self->_isImageAnalysisEnabled = a3;
  if (a3)
  {
    [(PPKPhotosMediaView *)self _ensureImageAnalysisControllerIfNecessary];
  }
  else
  {
    self->_analysisController = 0;
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)isHDRAllowed
{
  v2 = [(PPKPhotosMediaView *)self assetView];
  BOOL v3 = [v2 preferredImageDynamicRange] == 2;

  return v3;
}

- (void)setIsHDRAllowed:(BOOL)a3
{
}

- (void)setIsHDRAllowed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ((_os_feature_enabled_impl() & a3) != 0) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }
  double v7 = [(PPKPhotosMediaView *)self assetView];
  uint64_t v8 = [v7 preferredImageDynamicRange];

  if (v8 != v6)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__PPKPhotosMediaView_setIsHDRAllowed_animated___block_invoke;
    aBlock[3] = &unk_2640D3D70;
    aBlock[4] = self;
    aBlock[5] = v6;
    double v9 = (void (**)(void))_Block_copy(aBlock);
    double v10 = v9;
    if (v4)
    {
      id v11 = (void *)MEMORY[0x263F82E00];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __47__PPKPhotosMediaView_setIsHDRAllowed_animated___block_invoke_2;
      v12[3] = &unk_2640D3D98;
      v13 = v9;
      [v11 animateWithSpringDuration:0 bounce:v12 initialSpringVelocity:0 delay:2.0 options:0.0 animations:0.0 completion:0.0];
    }
    else
    {
      v9[2](v9);
    }
  }
}

void __47__PPKPhotosMediaView_setIsHDRAllowed_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) assetView];
  [v2 setPreferredImageDynamicRange:v1];
}

uint64_t __47__PPKPhotosMediaView_setIsHDRAllowed_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isImageAnalysisEnabled
{
  return self->_isImageAnalysisEnabled;
}

- (PXDisplayAssetView)assetView
{
  return self->_assetView;
}

- (_PhotosMediaViewAnalysisController)analysisController
{
  return self->_analysisController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisController, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
}

@end