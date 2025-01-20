@interface PXSearchSettings
+ (id)sharedInstance;
- (BOOL)disableTopAssetCuration;
- (BOOL)enableAutoCorrect;
- (BOOL)enableEmbeddingSearch;
- (BOOL)forceIndexingFooter;
- (BOOL)forceIndexingPausedTitle;
- (NSString)overrideMatchedQueryText;
- (double)embeddingVectorDistanceThreshold;
- (id)parentSettings;
- (unint64_t)indexingBannerPercentageThreshold;
- (unint64_t)maxNumberOfResultColumns;
- (unint64_t)maxNumberOfTopAssetColumns;
- (unint64_t)maxNumberOfTopAssetRows;
- (unint64_t)queryDepersonalizationType;
- (unint64_t)standardNumberOfTopAssetRows;
- (void)setDefaultValues;
- (void)setDisableTopAssetCuration:(BOOL)a3;
- (void)setEmbeddingVectorDistanceThreshold:(double)a3;
- (void)setEnableAutoCorrect:(BOOL)a3;
- (void)setEnableEmbeddingSearch:(BOOL)a3;
- (void)setForceIndexingFooter:(BOOL)a3;
- (void)setForceIndexingPausedTitle:(BOOL)a3;
- (void)setIndexingBannerPercentageThreshold:(unint64_t)a3;
- (void)setMaxNumberOfResultColumns:(unint64_t)a3;
- (void)setMaxNumberOfTopAssetColumns:(unint64_t)a3;
- (void)setMaxNumberOfTopAssetRows:(unint64_t)a3;
- (void)setOverrideMatchedQueryText:(id)a3;
- (void)setQueryDepersonalizationType:(unint64_t)a3;
- (void)setStandardNumberOfTopAssetRows:(unint64_t)a3;
@end

@implementation PXSearchSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXSearchSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXSearchSettings *)self setIndexingBannerPercentageThreshold:95];
}

- (void)setIndexingBannerPercentageThreshold:(unint64_t)a3
{
  self->_indexingBannerPercentageThreshold = a3;
}

- (void).cxx_destruct
{
}

- (void)setQueryDepersonalizationType:(unint64_t)a3
{
  self->_queryDepersonalizationType = a3;
}

- (unint64_t)queryDepersonalizationType
{
  return self->_queryDepersonalizationType;
}

- (void)setEmbeddingVectorDistanceThreshold:(double)a3
{
  self->_embeddingVectorDistanceThreshold = a3;
}

- (double)embeddingVectorDistanceThreshold
{
  return self->_embeddingVectorDistanceThreshold;
}

- (void)setEnableEmbeddingSearch:(BOOL)a3
{
  self->_enableEmbeddingSearch = a3;
}

- (BOOL)enableEmbeddingSearch
{
  return self->_enableEmbeddingSearch;
}

- (void)setEnableAutoCorrect:(BOOL)a3
{
  self->_enableAutoCorrect = a3;
}

- (BOOL)enableAutoCorrect
{
  return self->_enableAutoCorrect;
}

- (void)setOverrideMatchedQueryText:(id)a3
{
}

- (NSString)overrideMatchedQueryText
{
  return self->_overrideMatchedQueryText;
}

- (void)setForceIndexingPausedTitle:(BOOL)a3
{
  self->_forceIndexingPausedTitle = a3;
}

- (BOOL)forceIndexingPausedTitle
{
  return self->_forceIndexingPausedTitle;
}

- (unint64_t)indexingBannerPercentageThreshold
{
  return self->_indexingBannerPercentageThreshold;
}

- (void)setForceIndexingFooter:(BOOL)a3
{
  self->_forceIndexingFooter = a3;
}

- (BOOL)forceIndexingFooter
{
  return self->_forceIndexingFooter;
}

- (void)setDisableTopAssetCuration:(BOOL)a3
{
  self->_disableTopAssetCuration = a3;
}

- (BOOL)disableTopAssetCuration
{
  return self->_disableTopAssetCuration;
}

- (void)setStandardNumberOfTopAssetRows:(unint64_t)a3
{
  self->_standardNumberOfTopAssetRows = a3;
}

- (void)setMaxNumberOfTopAssetRows:(unint64_t)a3
{
  self->_maxNumberOfTopAssetRows = a3;
}

- (void)setMaxNumberOfResultColumns:(unint64_t)a3
{
  self->_maxNumberOfResultColumns = a3;
}

- (void)setMaxNumberOfTopAssetColumns:(unint64_t)a3
{
  self->_maxNumberOfTopAssetColumns = a3;
}

- (unint64_t)maxNumberOfTopAssetRows
{
  if (self->_maxNumberOfTopAssetRows) {
    return self->_maxNumberOfTopAssetRows;
  }
  else {
    return 3;
  }
}

- (unint64_t)standardNumberOfTopAssetRows
{
  if (self->_standardNumberOfTopAssetRows) {
    return self->_standardNumberOfTopAssetRows;
  }
  else {
    return 2;
  }
}

- (unint64_t)maxNumberOfResultColumns
{
  if (self->_maxNumberOfResultColumns) {
    return self->_maxNumberOfResultColumns;
  }
  else {
    return 6;
  }
}

- (unint64_t)maxNumberOfTopAssetColumns
{
  if (self->_maxNumberOfTopAssetColumns) {
    return self->_maxNumberOfTopAssetColumns;
  }
  else {
    return 6;
  }
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_16003 != -1) {
    dispatch_once(&sharedInstance_onceToken_16003, &__block_literal_global_16004);
  }
  v2 = (void *)sharedInstance_sharedInstance_16005;
  return v2;
}

void __34__PXSearchSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 searchSettings];
  v1 = (void *)sharedInstance_sharedInstance_16005;
  sharedInstance_sharedInstance_16005 = v0;
}

@end