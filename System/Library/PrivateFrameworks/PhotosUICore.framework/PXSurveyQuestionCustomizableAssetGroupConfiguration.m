@interface PXSurveyQuestionCustomizableAssetGroupConfiguration
- (NSNumber)customMaximumPreviewAssetCount;
- (NSString)keyAssetLocalIdentifier;
- (PXSurveyQuestionCustomizableAssetGroupConfiguration)initWithTitle:(id)a3 assetCollection:(id)a4;
- (PXSurveyQuestionCustomizableAssetGroupConfiguration)initWithTitle:(id)a3 assetCollection:(id)a4 customMaximumPreviewAssetCount:(id)a5 keyAssetLocalIdentifier:(id)a6;
- (id)contentView;
- (id)px_surveyQuestionAssetGroupViewMetadataDateRangeStringWithFormatter:(id)a3 assetGroupView:(id)a4;
- (id)px_surveyQuestionAssetGroupViewMetadataLocationString:(id)a3;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)setCustomMaximumPreviewAssetCount:(id)a3;
- (void)setKeyAssetLocalIdentifier:(id)a3;
@end

@implementation PXSurveyQuestionCustomizableAssetGroupConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_customMaximumPreviewAssetCount, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)setKeyAssetLocalIdentifier:(id)a3
{
}

- (NSString)keyAssetLocalIdentifier
{
  return self->_keyAssetLocalIdentifier;
}

- (void)setCustomMaximumPreviewAssetCount:(id)a3
{
}

- (NSNumber)customMaximumPreviewAssetCount
{
  return self->_customMaximumPreviewAssetCount;
}

- (id)px_surveyQuestionAssetGroupViewMetadataDateRangeStringWithFormatter:(id)a3 assetGroupView:(id)a4
{
  return &stru_1F00B0030;
}

- (id)px_surveyQuestionAssetGroupViewMetadataLocationString:(id)a3
{
  return &stru_1F00B0030;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
}

- (id)contentView
{
  contentView = self->_contentView;
  if (contentView)
  {
    v3 = contentView;
  }
  else
  {
    v5 = [PXSurveyQuestionAssetGroupView alloc];
    v6 = [(PXSurveyQuestionAssetGroupConfiguration *)self assetCollection];
    v7 = [(PXSurveyQuestionCustomizableAssetGroupConfiguration *)self customMaximumPreviewAssetCount];
    v8 = [(PXSurveyQuestionCustomizableAssetGroupConfiguration *)self keyAssetLocalIdentifier];
    v9 = [(PXSurveyQuestionAssetGroupView *)v5 initWithAssetCollection:v6 customMaximumPreviewAssetCount:v7 keyAssetLocalIdentifier:v8];

    [(PXSurveyQuestionAssetGroupView *)v9 setDelegate:self];
    v10 = self->_contentView;
    self->_contentView = v9;
    v11 = v9;

    v3 = self->_contentView;
  }
  return v3;
}

- (PXSurveyQuestionCustomizableAssetGroupConfiguration)initWithTitle:(id)a3 assetCollection:(id)a4
{
  return [(PXSurveyQuestionCustomizableAssetGroupConfiguration *)self initWithTitle:a3 assetCollection:a4 customMaximumPreviewAssetCount:0 keyAssetLocalIdentifier:0];
}

- (PXSurveyQuestionCustomizableAssetGroupConfiguration)initWithTitle:(id)a3 assetCollection:(id)a4 customMaximumPreviewAssetCount:(id)a5 keyAssetLocalIdentifier:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXSurveyQuestionCustomizableAssetGroupConfiguration;
  v13 = [(PXSurveyQuestionAssetGroupConfiguration *)&v18 initWithTitle:a3 assetCollection:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_customMaximumPreviewAssetCount, a5);
    uint64_t v15 = [v12 copy];
    keyAssetLocalIdentifier = v14->_keyAssetLocalIdentifier;
    v14->_keyAssetLocalIdentifier = (NSString *)v15;
  }
  return v14;
}

@end