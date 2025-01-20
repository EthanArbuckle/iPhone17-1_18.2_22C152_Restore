@interface PGFeatureAggregationValidator
- (PGFeatureAggregationValidator)initWithPredicate:(id)a3 featureExtractor:(id)a4 featureExtractorType:(int64_t)a5 featureName:(id)a6;
- (id)_composeFeatureExtractorWithGraph:(id)a3 error:(id *)a4;
- (int64_t)featureExtractorType;
- (int64_t)featureValidatorType;
- (int64_t)isValidEntity:(id)a3 error:(id *)a4;
- (int64_t)isValidEntity:(id)a3 graph:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6;
@end

@implementation PGFeatureAggregationValidator

- (int64_t)featureExtractorType
{
  return self->_featureExtractorType;
}

- (id)_composeFeatureExtractorWithGraph:(id)a3 error:(id *)a4
{
  id v6 = a3;
  switch([(PGFeatureAggregationValidator *)self featureExtractorType])
  {
    case 0:
      v7 = @"Unknown feature vector type is not supported";
      v8 = self;
      v9 = a4;
      uint64_t v10 = 2;
      goto LABEL_9;
    case 1:
      self = [(PGFeatureValidator *)self featureExtractor];
      goto LABEL_10;
    case 2:
      if (v6)
      {
        v11 = [PGFeatureExtractorGraphRelations alloc];
        v12 = [(PGFeatureValidator *)self featureExtractor];
        v13 = [(PGFeatureExtractorGraphRelations *)v11 initWithGraph:v6 featureExtractor:v12];
LABEL_7:
        self = v13;
      }
      else
      {
        v7 = @"Graph is invalid";
        v8 = self;
        v9 = a4;
        uint64_t v10 = 3;
LABEL_9:
        [(PGFeatureValidator *)v8 _generateError:v9 errorCode:v10 errorMessage:v7];
        self = 0;
      }
LABEL_10:

      return self;
    case 3:
      v14 = [PGFeatureExtractorFacesFromAssetAverage alloc];
      v12 = [(PGFeatureValidator *)self featureExtractor];
      v13 = [(PGFeatureExtractorFacesFromAssetAverage *)v14 initWithFaceFeatureExtractor:v12 name:@"FacesAverage"];
      goto LABEL_7;
    default:
      goto LABEL_10;
  }
}

- (int64_t)isValidEntity:(id)a3 graph:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v13 = *MEMORY[0x1E4F1C3B8];
  v14 = NSString;
  v15 = NSStringFromSelector(a2);
  v16 = [v14 stringWithFormat:@"Subclasses must override %@", v15];
  id v17 = [v12 exceptionWithName:v13 reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (int64_t)isValidEntity:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"isValidEntity:error method is not available. Please use isValidEntity:graph:assetFetchOptionPropertySet." userInfo:0];
  objc_exception_throw(v5);
}

- (int64_t)featureValidatorType
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"Subclasses must override %@", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (PGFeatureAggregationValidator)initWithPredicate:(id)a3 featureExtractor:(id)a4 featureExtractorType:(int64_t)a5 featureName:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PGFeatureAggregationValidator;
  result = [(PGFeatureValidator *)&v8 initWithPredicate:a3 featureExtractor:a4 featureName:a6];
  if (result) {
    result->_featureExtractorType = a5;
  }
  return result;
}

@end