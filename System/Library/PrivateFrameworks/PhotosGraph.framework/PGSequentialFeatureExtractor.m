@interface PGSequentialFeatureExtractor
- (BOOL)_generateError:(id *)a3 code:(int64_t)a4 message:(id)a5 underlyingError:(id)a6;
- (MAFeatureExtractor)featureExtractor;
- (NSArray)featureTransformers;
- (PGSequentialFeatureExtractor)initWithFeatureExtractor:(id)a3 featureTransformers:(id)a4;
- (id)_transformFloatVector:(id)a3 error:(id *)a4;
- (id)defaultFloatVectorWithError:(id *)a3;
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGSequentialFeatureExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureTransformers, 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
}

- (NSArray)featureTransformers
{
  return self->_featureTransformers;
}

- (MAFeatureExtractor)featureExtractor
{
  return self->_featureExtractor;
}

- (BOOL)_generateError:(id *)a3 code:(int64_t)a4 message:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    if (v9) {
      [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotosGraph.PGSequentialFeatureExtractor" code:a4 userInfo:v12];
  }
  return 0;
}

- (id)_transformFloatVector:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(PGSequentialFeatureExtractor *)self featureTransformers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_3:
    uint64_t v11 = 0;
    id v12 = v6;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v7);
      }
      id v6 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) floatVectorWithFloatVector:v12 error:a4];

      if (!v6) {
        break;
      }
      ++v11;
      id v12 = v6;
      if (v9 == v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v6;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PGSequentialFeatureExtractor *)self featureExtractor];
  id v15 = 0;
  uint64_t v8 = [v7 floatVectorWithEntity:v6 error:&v15];

  id v9 = v15;
  if (v8)
  {
    uint64_t v10 = [(PGSequentialFeatureExtractor *)self _transformFloatVector:v8 error:a4];
  }
  else
  {
    uint64_t v11 = NSString;
    id v12 = [(PGSequentialFeatureExtractor *)self featureExtractor];
    v13 = [v11 stringWithFormat:@"Feature Extraction for %@ returned nil.", objc_opt_class()];
    [(PGSequentialFeatureExtractor *)self _generateError:a4 code:0 message:v13 underlyingError:v9];

    uint64_t v10 = 0;
  }

  return v10;
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  v5 = [(PGSequentialFeatureExtractor *)self featureExtractor];
  id v6 = [v5 defaultFloatVectorWithError:a3];

  if (v6)
  {
    v7 = [(PGSequentialFeatureExtractor *)self _transformFloatVector:v6 error:a3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)featureLength
{
  v2 = [(PGSequentialFeatureExtractor *)self featureExtractor];
  v3 = [v2 featureNames];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)featureNames
{
  v2 = [(PGSequentialFeatureExtractor *)self featureExtractor];
  v3 = [v2 featureNames];

  return v3;
}

- (id)name
{
  v2 = [(PGSequentialFeatureExtractor *)self featureExtractor];
  v3 = [v2 name];

  return v3;
}

- (PGSequentialFeatureExtractor)initWithFeatureExtractor:(id)a3 featureTransformers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGSequentialFeatureExtractor;
  id v9 = [(PGSequentialFeatureExtractor *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureExtractor, a3);
    objc_storeStrong((id *)&v10->_featureTransformers, a4);
  }

  return v10;
}

@end