@interface PGAssetCollectionAverageFeatureValidator
- (int64_t)featureValidatorType;
- (int64_t)isValidEntity:(id)a3 graph:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6;
@end

@implementation PGAssetCollectionAverageFeatureValidator

- (int64_t)featureValidatorType
{
  return 4;
}

- (int64_t)isValidEntity:(id)a3 graph:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = [(PGFeatureAggregationValidator *)self _composeFeatureExtractorWithGraph:a4 error:a6];
  if (v12)
  {
    v13 = [[PGFeatureExtractorAssetCollectionAverage alloc] initWithAssetFeatureExtractor:v12 assetFetchOptionPropertySet:v11 name:@"AssetCollectionAverage"];
    int64_t v14 = [(PGFeatureValidator *)self _isValidEntity:v10 featureExtractor:v13 error:a6];
  }
  else
  {
    int64_t v14 = 0;
  }

  return v14;
}

@end