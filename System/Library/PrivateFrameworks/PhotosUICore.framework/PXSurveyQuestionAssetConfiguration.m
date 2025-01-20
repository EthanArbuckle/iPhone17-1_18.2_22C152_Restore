@interface PXSurveyQuestionAssetConfiguration
+ (void)configureViewForAsset:(id)a3;
- (BOOL)isStale;
- (BOOL)needsQuestionInvalidationForChange:(id)a3;
- (CGRect)assetContentsRect;
- (CGRect)contentRectForOneUp;
- (NSString)title;
- (PXDisplayAsset)asset;
- (PXSurveyQuestionAssetConfiguration)init;
- (PXSurveyQuestionAssetConfiguration)initWithTitle:(id)a3 asset:(id)a4;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (UIImage)contentImageForOneUp;
- (UIView)contentView;
- (void)_handleDidSelectAssetView;
- (void)dealloc;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)setHandlers:(id)a3;
- (void)setIsStale:(BOOL)a3;
@end

@implementation PXSurveyQuestionAssetConfiguration

- (NSString)title
{
  return self->_title;
}

- (UIView)contentView
{
  assetView = self->_assetView;
  if (!assetView)
  {
    v4 = [(PXSurveyQuestionAssetConfiguration *)self asset];
    v5 = +[PXDisplayAssetContentView checkOutViewForAsset:v4 withPlaybackStyle:1];
    v6 = self->_assetView;
    self->_assetView = v5;

    +[PXSurveyQuestionAssetConfiguration configureViewForAsset:self->_assetView];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDidSelectAssetView];
    [(PXDisplayAssetContentView *)self->_assetView addGestureRecognizer:v7];

    assetView = self->_assetView;
  }
  return (UIView *)assetView;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

+ (void)configureViewForAsset:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  v4 = [v3 quaternarySystemFillColor];
  [v6 setBackgroundColor:v4];

  [v6 setCanDisplayLoadingIndicator:1];
  [v6 setHidden:0];
  v5 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  [v6 setMediaProvider:v5];

  [v6 setPlaceholderTransitionDuration:0.2];
  [v6 setContentMode:2];
}

- (void)setHandlers:(id)a3
{
}

- (PXSurveyQuestionAssetConfiguration)initWithTitle:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSurveyQuestionAssetConfiguration;
  v8 = [(PXSurveyQuestionAssetConfiguration *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_asset, a4);
    v8->_isStale = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
}

- (CGRect)assetContentsRect
{
  double x = self->_assetContentsRect.origin.x;
  double y = self->_assetContentsRect.origin.y;
  double width = self->_assetContentsRect.size.width;
  double height = self->_assetContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  v3 = [a3 changeDetailsForObject:self->_asset];
  char v4 = [v3 objectWasDeleted];

  return v4;
}

- (void)_handleDidSelectAssetView
{
  v3 = [(PXSurveyQuestionAssetConfiguration *)self handlers];
  char v4 = [v3 didSelectAssetHandler];

  if (v4)
  {
    id v6 = [(PXSurveyQuestionAssetConfiguration *)self handlers];
    v5 = [v6 didSelectAssetHandler];
    ((void (**)(void, PXDisplayAsset *))v5)[2](v5, self->_asset);
  }
}

- (CGRect)contentRectForOneUp
{
  assetView = self->_assetView;
  if (assetView)
  {
    [(PXDisplayAssetContentView *)assetView currentContentsRect];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (UIImage)contentImageForOneUp
{
  return [(PXDisplayAssetContentView *)self->_assetView currentImage];
}

- (void)layoutContentViewInRect:(CGRect)a3
{
}

- (void)dealloc
{
  double v3 = self->_assetView;
  if (v3)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __45__PXSurveyQuestionAssetConfiguration_dealloc__block_invoke;
    v8 = &unk_1E5DD36F8;
    uint64_t v9 = v3;
    px_dispatch_on_main_queue();
  }

  v4.receiver = self;
  v4.super_class = (Class)PXSurveyQuestionAssetConfiguration;
  [(PXSurveyQuestionAssetConfiguration *)&v4 dealloc];
}

uint64_t __45__PXSurveyQuestionAssetConfiguration_dealloc__block_invoke(uint64_t a1)
{
  return +[PXDisplayAssetContentView checkInView:*(void *)(a1 + 32)];
}

- (PXSurveyQuestionAssetConfiguration)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionAssetConfiguration.m", 36, @"%s is not available as initializer", "-[PXSurveyQuestionAssetConfiguration init]");

  abort();
}

@end