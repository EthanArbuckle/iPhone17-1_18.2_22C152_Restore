@interface PXSurveyQuestionAssetGroupConfiguration
- (BOOL)isStale;
- (CGRect)contentRectForOneUp;
- (NSString)title;
- (PHAssetCollection)assetCollection;
- (PXSurveyQuestionAssetGroupConfiguration)init;
- (PXSurveyQuestionAssetGroupConfiguration)initWithTitle:(id)a3 assetCollection:(id)a4;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (UIImage)contentImageForOneUp;
- (UIView)contentView;
- (id)px_surveyQuestionAssetGroupViewMetadataDateRangeStringWithFormatter:(id)a3 assetGroupView:(id)a4;
- (id)px_surveyQuestionAssetGroupViewMetadataLocationString:(id)a3;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)px_surveyQuestionAssetGroupViewWasTapped:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setIsStale:(BOOL)a3;
@end

@implementation PXSurveyQuestionAssetGroupConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (NSString)title
{
  return self->_title;
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

- (void)px_surveyQuestionAssetGroupViewWasTapped:(id)a3
{
  id v14 = [(PXSurveyQuestionAssetGroupConfiguration *)self assetCollection];
  v4 = (void *)MEMORY[0x1E4F38EB8];
  v5 = [v14 photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];
  v7 = [v4 fetchAssetsInAssetCollection:v14 options:v6];

  v8 = PXPhotosViewConfigurationForAssetCollectionWithExistingAssetsFetchResult(v14, v7, 0, 0, 1);
  v9 = [[PXPhotosUIViewController alloc] initWithConfiguration:v8];
  v10 = [(PXSurveyQuestionAssetGroupConfiguration *)self handlers];
  v11 = [v10 pushViewControllerHandler];

  if (v11)
  {
    v12 = [(PXSurveyQuestionAssetGroupConfiguration *)self handlers];
    v13 = [v12 pushViewControllerHandler];
    ((void (**)(void, PXPhotosUIViewController *, id))v13)[2](v13, v9, v14);
  }
}

- (id)px_surveyQuestionAssetGroupViewMetadataDateRangeStringWithFormatter:(id)a3 assetGroupView:(id)a4
{
  id v5 = a3;
  v6 = [(PXSurveyQuestionAssetGroupConfiguration *)self assetCollection];
  v7 = [v6 startDate];
  v8 = [v5 stringFromDate:v7];

  v9 = [(PXSurveyQuestionAssetGroupConfiguration *)self assetCollection];
  v10 = [v9 endDate];
  v11 = [v5 stringFromDate:v10];

  v12 = [NSString stringWithFormat:@"%@ - %@", v8, v11];

  return v12;
}

- (id)px_surveyQuestionAssetGroupViewMetadataLocationString:(id)a3
{
  v3 = [(PXSurveyQuestionAssetGroupConfiguration *)self assetCollection];
  v4 = [v3 localizedLocationNames];
  id v5 = [v4 firstObject];

  return v5;
}

- (UIImage)contentImageForOneUp
{
  return 0;
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

- (void)layoutContentViewInRect:(CGRect)a3
{
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (contentView)
  {
    double v3 = contentView;
  }
  else
  {
    double v5 = [PXSurveyQuestionAssetGroupView alloc];
    v6 = [(PXSurveyQuestionAssetGroupConfiguration *)self assetCollection];
    v7 = [(PXSurveyQuestionAssetGroupView *)v5 initWithAssetCollection:v6];

    [(PXSurveyQuestionAssetGroupView *)v7 setDelegate:self];
    v8 = self->_contentView;
    self->_contentView = v7;
    v9 = v7;

    double v3 = self->_contentView;
  }
  return (UIView *)v3;
}

- (PXSurveyQuestionAssetGroupConfiguration)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionAssetGroupConfiguration.m", 45, @"%s is not available as initializer", "-[PXSurveyQuestionAssetGroupConfiguration init]");

  abort();
}

- (PXSurveyQuestionAssetGroupConfiguration)initWithTitle:(id)a3 assetCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSurveyQuestionAssetGroupConfiguration;
  v8 = [(PXSurveyQuestionAssetGroupConfiguration *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v8->_isStale = 0;
    objc_storeStrong((id *)&v8->_assetCollection, a4);
  }

  return v8;
}

@end