@interface PXSurveyQuestionMemoryConfiguration
- (BOOL)isStale;
- (BOOL)needsQuestionInvalidationForChange:(id)a3;
- (CGRect)contentRectForOneUp;
- (NSString)songAdamId;
- (NSString)title;
- (PHMemory)memory;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (PXSurveyQuestionMemoryConfiguration)init;
- (PXSurveyQuestionMemoryConfiguration)initWithTitle:(id)a3 memory:(id)a4 songAdamId:(id)a5 customKeyAssetIdentifier:(id)a6;
- (UIImage)contentImageForOneUp;
- (UIView)contentView;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)presentDetailsForMemoryView:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setIsStale:(BOOL)a3;
@end

@implementation PXSurveyQuestionMemoryConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songAdamId, 0);
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_customKeyAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_memoryView, 0);
}

- (NSString)songAdamId
{
  return self->_songAdamId;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setHandlers:(id)a3
{
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (NSString)title
{
  return self->_title;
}

- (void)presentDetailsForMemoryView:(id)a3
{
  id v9 = +[PXPhotosDetailsContext photosDetailsContextForMemory:self->_memory];
  v4 = [[PXPhotosDetailsUIViewController alloc] initWithContext:v9 options:0];
  v5 = [(PXSurveyQuestionMemoryConfiguration *)self handlers];
  v6 = [v5 pushViewControllerHandler];

  if (v6)
  {
    v7 = [(PXSurveyQuestionMemoryConfiguration *)self handlers];
    v8 = [v7 pushViewControllerHandler];
    ((void (**)(void, PXPhotosDetailsUIViewController *, PHMemory *))v8)[2](v8, v4, self->_memory);
  }
}

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  v3 = [a3 changeDetailsForObject:self->_memory];
  char v4 = [v3 objectWasDeleted];

  return v4;
}

- (CGRect)contentRectForOneUp
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  if (a3.size.height >= a3.size.width)
  {
    if (a3.size.height > a3.size.width)
    {
      a3.origin.y = a3.origin.y + (a3.size.height - a3.size.width) * 0.5 + 8.0;
      a3.size.height = a3.size.width;
    }
  }
  else
  {
    a3.origin.x = a3.origin.x + (a3.size.width - a3.size.height) * 0.5;
    a3.origin.y = a3.origin.y + 8.0;
    a3.size.width = a3.size.height;
  }
  -[PXMemoryView setFrame:](self->_memoryView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIView)contentView
{
  v17[1] = *MEMORY[0x1E4F143B8];
  memoryView = self->_memoryView;
  if (!memoryView)
  {
    double v4 = +[PXMemoryInfo memoryInfoWithMemory:self->_memory];
    if (self->_customKeyAssetIdentifier)
    {
      double v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      v6 = (void *)MEMORY[0x1E4F38EB8];
      v17[0] = self->_customKeyAssetIdentifier;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      v8 = [v6 fetchAssetsWithUUIDs:v7 options:v5];

      uint64_t v9 = [v4 memoryInfoWithUpdatedKeyAssetFetchResult:v8];

      double v4 = (void *)v9;
    }
    v10 = objc_alloc_init(PXMemoryViewModel);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__PXSurveyQuestionMemoryConfiguration_contentView__block_invoke;
    v15[3] = &unk_1E5DCE318;
    id v16 = v4;
    id v11 = v4;
    [(PXMemoryViewModel *)v10 performChanges:v15];
    v12 = objc_alloc_init(PXMemoryView);
    v13 = self->_memoryView;
    self->_memoryView = v12;

    [(PXMemoryView *)self->_memoryView setViewModel:v10];
    [(PXMemoryView *)self->_memoryView setPresentationDelegate:self];

    memoryView = self->_memoryView;
  }
  return (UIView *)memoryView;
}

void __50__PXSurveyQuestionMemoryConfiguration_contentView__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v8 = a2;
  double v4 = [v3 localizedDateText];
  [v8 setLocalizedDateText:v4];

  double v5 = [*(id *)(a1 + 32) localizedTitle];
  [v8 setLocalizedTitle:v5];

  v6 = [*(id *)(a1 + 32) keyAssetFetchResult];
  v7 = [v6 firstObject];
  [v8 setKeyAsset:v7];

  [v8 setSpecSet:1];
}

- (PXSurveyQuestionMemoryConfiguration)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionMemoryConfiguration.m", 52, @"%s is not available as initializer", "-[PXSurveyQuestionMemoryConfiguration init]");

  abort();
}

- (PXSurveyQuestionMemoryConfiguration)initWithTitle:(id)a3 memory:(id)a4 songAdamId:(id)a5 customKeyAssetIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PXSurveyQuestionMemoryConfiguration;
  v14 = [(PXSurveyQuestionMemoryConfiguration *)&v21 init];
  if (!v14) {
    goto LABEL_4;
  }
  uint64_t v15 = [v10 copy];
  title = v14->_title;
  v14->_title = (NSString *)v15;

  objc_storeStrong((id *)&v14->_memory, a4);
  objc_storeStrong((id *)&v14->_songAdamId, a5);
  v14->_isStale = 0;
  objc_storeStrong((id *)&v14->_customKeyAssetIdentifier, a6);
  if (!v14->_customKeyAssetIdentifier) {
    goto LABEL_4;
  }
  uint64_t v17 = [(PHMemory *)v14->_memory photoLibrary];
  photoLibrary = v14->_photoLibrary;
  v14->_photoLibrary = (PHPhotoLibrary *)v17;

  if (!v14->_photoLibrary) {
    v19 = 0;
  }
  else {
LABEL_4:
  }
    v19 = v14;

  return v19;
}

@end