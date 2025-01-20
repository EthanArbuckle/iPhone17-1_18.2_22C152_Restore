@interface PXDisplayAssetImageAnalysisOverlayView
+ (BOOL)changedImageAnalysisOverlayNeededForViewModelChange:(unint64_t)a3;
+ (BOOL)isImageAnalysisOverlayNeededForViewModel:(id)a3;
- (PXDisplayAssetImageAnalysisOverlayView)initWithViewModel:(id)a3;
- (PXDisplayAssetViewModel)viewModel;
@end

@implementation PXDisplayAssetImageAnalysisOverlayView

- (void).cxx_destruct
{
}

- (PXDisplayAssetViewModel)viewModel
{
  return self->_viewModel;
}

- (PXDisplayAssetImageAnalysisOverlayView)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDisplayAssetImageAnalysisOverlayView;
  v6 = -[PXDisplayAssetImageAnalysisOverlayView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewModel, a3);
  }

  return v7;
}

+ (BOOL)changedImageAnalysisOverlayNeededForViewModelChange:(unint64_t)a3
{
  return 0;
}

+ (BOOL)isImageAnalysisOverlayNeededForViewModel:(id)a3
{
  if (isImageAnalysisOverlayNeededForViewModel__onceToken != -1) {
    dispatch_once(&isImageAnalysisOverlayNeededForViewModel__onceToken, &__block_literal_global_187810);
  }
  return 0;
}

void __83__PXDisplayAssetImageAnalysisOverlayView_isImageAnalysisOverlayNeededForViewModel___block_invoke()
{
  v0 = PLOneUpGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A9AE7000, v0, OS_LOG_TYPE_ERROR, "image analysis overlay isn't available yet on the current platform", v1, 2u);
  }
}

@end