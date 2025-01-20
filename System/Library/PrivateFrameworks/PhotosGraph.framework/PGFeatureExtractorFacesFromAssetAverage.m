@interface PGFeatureExtractorFacesFromAssetAverage
- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5 underlyingError:(id)a6;
- (MAFeatureExtractor)faceFeatureExtractor;
- (NSString)name;
- (PGFeatureExtractorFacesFromAssetAverage)initWithFaceFeatureExtractor:(id)a3 name:(id)a4;
- (id)featureNames;
- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)floatVectorWithFaces:(id)a3 error:(id *)a4;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorFacesFromAssetAverage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_faceFeatureExtractor, 0);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (MAFeatureExtractor)faceFeatureExtractor
{
  return (MAFeatureExtractor *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5 underlyingError:(id)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v18 = v10;
    v19[0] = a5;
    v11 = NSString;
    id v12 = a5;
    v13 = [v11 stringWithFormat:@"%@", a6, v17, v18, v19[0]];
    v19[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v17 count:2];
    v15 = [v9 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureExtractorFacesFromAssetAverage" code:a4 userInfo:v14];

    *a3 = v15;
  }
  return 1;
}

- (id)floatVectorWithFaces:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v6 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v26 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v25 = a4;
      id v10 = 0;
      uint64_t v11 = *(void *)v30;
      while (2)
      {
        uint64_t v12 = 0;
        v13 = v10;
        do
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
          v15 = [(PGFeatureExtractorFacesFromAssetAverage *)self faceFeatureExtractor];
          id v28 = v13;
          v16 = [v15 floatVectorWithEntity:v14 error:&v28];
          id v10 = v28;

          if (!v16)
          {
            uint64_t v17 = NSString;
            uint64_t v18 = [v14 localIdentifier];
            v19 = [v17 stringWithFormat:@"Unable to retrieve face feature vector from face %@. Returning nil.", v18];
            [(PGFeatureExtractorFacesFromAssetAverage *)self _generateError:v25 withCode:0 andMessage:v19 underlyingError:v10];

            v20 = 0;
            goto LABEL_16;
          }
          [v7 addObject:v16];

          ++v12;
          v13 = v10;
        }
        while (v9 != v12);
        uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v10 = 0;
    }

    v20 = [MEMORY[0x1E4F71ED0] meanVectorWithFloatVectors:v7];
LABEL_16:
    id v6 = v26;
  }
  else
  {
    v21 = [(PGFeatureExtractorFacesFromAssetAverage *)self faceFeatureExtractor];
    id v33 = 0;
    v20 = [v21 defaultFloatVectorWithError:&v33];
    id v10 = v33;

    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      v23 = [NSString stringWithFormat:@"Unable to retrieve default face feature vector. Returning nil."];
      [(PGFeatureExtractorFacesFromAssetAverage *)self _generateError:a4 withCode:1 andMessage:v23 underlyingError:v10];
    }
  }

  return v20;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F71EF0]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  v21 = a5;
  id v10 = 0;
  uint64_t v11 = *(void *)v26;
  while (2)
  {
    uint64_t v12 = 0;
    v13 = v10;
    do
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
      v15 = objc_msgSend(v14, "photoLibrary", v21);
      v16 = [v15 librarySpecificFetchOptions];

      if (!v16)
      {
        v16 = v7;
        id v10 = v13;
LABEL_14:

        id v7 = 0;
        goto LABEL_15;
      }
      uint64_t v17 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v14 options:v16];
      uint64_t v18 = [v17 fetchedObjects];
      id v24 = v13;
      v19 = [(PGFeatureExtractorFacesFromAssetAverage *)self floatVectorWithFaces:v18 error:&v24];
      id v10 = v24;

      if (!v19)
      {

        goto LABEL_14;
      }
      [v7 appendRow:v19];

      ++v12;
      v13 = v10;
    }
    while (v9 != v12);
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_15:
  a5 = v21;
LABEL_16:

  if (a5) {
    *a5 = v10;
  }

  return v7;
}

- (id)featureNames
{
  v2 = [(PGFeatureExtractorFacesFromAssetAverage *)self faceFeatureExtractor];
  v3 = [v2 featureNames];

  return v3;
}

- (int64_t)featureLength
{
  v2 = [(PGFeatureExtractorFacesFromAssetAverage *)self faceFeatureExtractor];
  v3 = [v2 featureNames];
  int64_t v4 = [v3 count];

  return v4;
}

- (PGFeatureExtractorFacesFromAssetAverage)initWithFaceFeatureExtractor:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGFeatureExtractorFacesFromAssetAverage;
  uint64_t v9 = [(PGFeatureExtractorFacesFromAssetAverage *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceFeatureExtractor, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

@end