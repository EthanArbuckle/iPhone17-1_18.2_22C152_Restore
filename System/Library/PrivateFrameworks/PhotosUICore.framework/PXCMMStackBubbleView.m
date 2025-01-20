@interface PXCMMStackBubbleView
+ (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PHMomentShare)momentShare;
- (PXCMMStackBubbleView)initWithCoder:(id)a3;
- (PXCMMStackBubbleView)initWithFrame:(CGRect)a3;
- (PXPhotoKitAssetsDataSourceManager)dataSourceManager;
- (PXPhotoKitUIMediaProvider)mediaProvider;
- (double)maximumHeight;
- (void)_updateSubviews;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDataSourceManager:(id)a3;
- (void)setMaximumHeight:(double)a3;
- (void)setMomentShare:(id)a3;
@end

@implementation PXCMMStackBubbleView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (PXPhotoKitAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (PXPhotoKitUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)DataSourceManagerObservationContext_162201 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXCMMStackBubbleView.m" lineNumber:125 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXCMMStackBubbleView *)self _updateSubviews];
    id v9 = v11;
  }
}

- (void)layoutSubviews
{
  [(PXCMMStackBubbleView *)self bounds];
  -[PXMessagesStackView setFrame:](self->_stackView, "setFrame:");
  [(PXCMMStackBubbleView *)self bounds];
  -[UIActivityIndicatorView setFrame:](self->_activityIndicatorView, "setFrame:");
  v3.receiver = self;
  v3.super_class = (Class)PXCMMStackBubbleView;
  [(PXCMMStackBubbleView *)&v3 layoutSubviews];
}

- (void)_updateSubviews
{
  objc_super v3 = [(PXCMMStackBubbleView *)self dataSourceManager];
  v4 = [v3 dataSource];
  int v5 = [v4 containsAnyItems];

  stackView = self->_stackView;
  if (v5)
  {
    if (!stackView)
    {
      v7 = [PXMessagesStackView alloc];
      v8 = -[PXMessagesStackView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      id v9 = self->_stackView;
      self->_stackView = v8;

      v10 = [(PXCMMStackBubbleView *)self mediaProvider];
      [(PXMessagesStackView *)self->_stackView setMediaProvider:v10];

      id v11 = [(PXCMMStackBubbleView *)self dataSourceManager];
      [(PXBaseMessagesStackView *)self->_stackView setDataSourceManager:v11];

      [(PXCMMStackBubbleView *)self addSubview:self->_stackView];
    }
    activityIndicatorView = self->_activityIndicatorView;
    if (activityIndicatorView)
    {
      [(UIActivityIndicatorView *)activityIndicatorView removeFromSuperview];
      v13 = self->_activityIndicatorView;
      self->_activityIndicatorView = 0;
    }
  }
  else
  {
    if (stackView)
    {
      [(PXMessagesStackView *)stackView removeFromSuperview];
      v14 = self->_stackView;
      self->_stackView = 0;
    }
    if (!self->_activityIndicatorView)
    {
      v15 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
      v16 = self->_activityIndicatorView;
      self->_activityIndicatorView = v15;

      [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
      v17 = self->_activityIndicatorView;
      [(PXCMMStackBubbleView *)self addSubview:v17];
    }
  }
}

- (void)setDataSourceManager:(id)a3
{
  int v5 = (PXPhotoKitAssetsDataSourceManager *)a3;
  dataSourceManager = self->_dataSourceManager;
  if (dataSourceManager != v5)
  {
    v7 = v5;
    [(PXSectionedDataSourceManager *)dataSourceManager unregisterChangeObserver:self context:DataSourceManagerObservationContext_162201];
    objc_storeStrong((id *)&self->_dataSourceManager, a3);
    [(PXSectionedDataSourceManager *)self->_dataSourceManager registerChangeObserver:self context:DataSourceManagerObservationContext_162201];
    [(PXCMMStackBubbleView *)self _updateSubviews];
    int v5 = v7;
  }
}

- (void)setMomentShare:(id)a3
{
  id v8 = a3;
  if ((-[PHMomentShare isEqual:](self->_momentShare, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_momentShare, a3);
    if (v8)
    {
      int v5 = PXCuratedAssetsWithFallbackForMomentShare(v8, 1);
      LOBYTE(v7) = 0;
      char v6 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:v8 existingAssetsFetchResult:v5 existingKeyAssetsFetchResult:0 fetchPropertySets:0 basePredicate:0 options:0 ignoreSharedLibraryFilters:v7];
      if ([v8 status] == 2) {
        [v8 acceptMomentShareWithCompletion:&__block_literal_global_162214];
      }
    }
    else
    {
      char v6 = 0;
    }
    [(PXCMMStackBubbleView *)self setDataSourceManager:v6];
  }
}

void __39__PXCMMStackBubbleView_setMomentShare___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    int v5 = PLSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to accept CMM with error %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXCMMStackBubbleView *)self maximumHeight];
  if (height >= v5) {
    double height = v5;
  }
  int v6 = objc_opt_class();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (PXCMMStackBubbleView)initWithCoder:(id)a3
{
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMStackBubbleView.m", 43, @"%s is not available as initializer", "-[PXCMMStackBubbleView initWithCoder:]");

  abort();
}

- (PXCMMStackBubbleView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXCMMStackBubbleView;
  objc_super v3 = -[PXCMMStackBubbleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
    uint64_t v5 = +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:v4];
    mediaProvider = v3->_mediaProvider;
    v3->_mediaProvider = (PXPhotoKitUIMediaProvider *)v5;

    v3->_maximumHeight = 1.79769313e308;
  }
  return v3;
}

+ (CGSize)sizeThatFits:(CGSize)a3
{
}

@end