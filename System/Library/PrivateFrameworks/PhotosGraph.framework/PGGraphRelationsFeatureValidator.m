@interface PGGraphRelationsFeatureValidator
- (int64_t)featureValidatorType;
- (int64_t)isValidEntity:(id)a3 error:(id *)a4;
- (int64_t)isValidEntity:(id)a3 graph:(id)a4 error:(id *)a5;
@end

@implementation PGGraphRelationsFeatureValidator

- (int64_t)featureValidatorType
{
  return 2;
}

- (int64_t)isValidEntity:(id)a3 graph:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = [PGFeatureExtractorGraphRelations alloc];
    v11 = [(PGFeatureValidator *)self featureExtractor];
    v12 = [(PGFeatureExtractorGraphRelations *)v10 initWithGraph:v9 featureExtractor:v11];

    int64_t v13 = [(PGFeatureValidator *)self _isValidEntity:v8 featureExtractor:v12 error:a5];
  }
  else
  {
    [(PGFeatureValidator *)self _generateError:a5 errorCode:3 errorMessage:@"Graph is invalid"];
    int64_t v13 = 0;
  }

  return v13;
}

- (int64_t)isValidEntity:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"[PGGraphRelationsFeatureValidator isValidEntity] method is not available. Please use [PGGraphRelationsFeatureValidator isValidEntity:graph]." userInfo:0];
  objc_exception_throw(v5);
}

@end