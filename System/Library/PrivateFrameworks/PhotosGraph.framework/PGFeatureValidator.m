@interface PGFeatureValidator
- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5;
- (NSPredicate)predicate;
- (NSString)featureName;
- (PGFeatureExtractor)featureExtractor;
- (PGFeatureValidator)initWithPredicate:(id)a3 featureExtractor:(id)a4 featureName:(id)a5;
- (int64_t)_isValidEntity:(id)a3 featureExtractor:(id)a4 error:(id *)a5;
- (int64_t)featureValidatorType;
- (int64_t)isValidEntity:(id)a3 error:(id *)a4;
@end

@implementation PGFeatureValidator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (PGFeatureExtractor)featureExtractor
{
  return self->_featureExtractor;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (int64_t)featureValidatorType
{
  return 1;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = a5;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = a5;
    v10 = [v8 dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = [v7 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureValidator" code:a4 userInfo:v10];

    *a3 = v11;
  }
  return 0;
}

- (int64_t)_isValidEntity:(id)a3 featureExtractor:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 featureLength] >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      v11 = [(PGFeatureValidator *)self featureName];
      v12 = [v9 featureNames];
      uint64_t v13 = [v12 objectAtIndexedSubscript:v10];
      char v14 = [v11 isEqualToString:v13];

      if (v14) {
        break;
      }
      if (++v10 >= [v9 featureLength]) {
        goto LABEL_5;
      }
    }
    v20 = [v9 floatVectorWithEntity:v8 error:a5];
    v21 = v20;
    if (v20)
    {
      uint64_t v22 = [v20 count];
      if (!a5 || v10 < v22)
      {
        v28 = [(PGFeatureValidator *)self predicate];
        v29 = NSNumber;
        [v21 floatAtIndex:v10];
        v30 = objc_msgSend(v29, "numberWithFloat:");
        int v31 = [v28 evaluateWithObject:v30];

        if (v31) {
          int64_t v19 = 1;
        }
        else {
          int64_t v19 = 2;
        }
        goto LABEL_14;
      }
      v23 = NSString;
      v24 = [v9 name];
      v25 = [v23 stringWithFormat:@"Feature index %lu out of bounds for feature extractor '%@'", v10, v24];

      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v34[0] = v25;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      *a5 = [v26 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureValidator" code:1 userInfo:v27];
    }
    int64_t v19 = 0;
LABEL_14:

    goto LABEL_15;
  }
LABEL_5:
  v15 = NSString;
  v16 = [(PGFeatureValidator *)self featureName];
  v17 = [v9 name];
  v18 = [v15 stringWithFormat:@"Feature '%@' not found in feature extractor '%@'", v16, v17];
  [(PGFeatureValidator *)self _generateError:a5 errorCode:0 errorMessage:v18];

  int64_t v19 = 0;
LABEL_15:

  return v19;
}

- (int64_t)isValidEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PGFeatureValidator *)self featureExtractor];
  int64_t v8 = [(PGFeatureValidator *)self _isValidEntity:v6 featureExtractor:v7 error:a4];

  return v8;
}

- (PGFeatureValidator)initWithPredicate:(id)a3 featureExtractor:(id)a4 featureName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGFeatureValidator;
  v12 = [(PGFeatureValidator *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_predicate, a3);
    objc_storeStrong((id *)&v13->_featureExtractor, a4);
    objc_storeStrong((id *)&v13->_featureName, a5);
  }

  return v13;
}

@end