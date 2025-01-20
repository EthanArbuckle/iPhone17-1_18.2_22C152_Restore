@interface PGFeatureExtractorAssetCollectionAverage
- (BOOL)_generateError:(id *)a3 code:(int64_t)a4 message:(id)a5 underlyingError:(id)a6;
- (MAFeatureExtractor)assetFeatureExtractor;
- (NSArray)assetFetchOptionPropertySet;
- (PGFeatureExtractorAssetCollectionAverage)initWithAssetFeatureExtractor:(id)a3 assetFetchOptionPropertySet:(id)a4 name:(id)a5;
- (id)featureNames;
- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetCollectionAverage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_assetFetchOptionPropertySet, 0);
  objc_storeStrong((id *)&self->_assetFeatureExtractor, 0);
}

- (id)name
{
  return self->_name;
}

- (NSArray)assetFetchOptionPropertySet
{
  return self->_assetFetchOptionPropertySet;
}

- (MAFeatureExtractor)assetFeatureExtractor
{
  return self->_assetFeatureExtractor;
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
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotosGraph.PGFeatureExtractorAssetCollectionAverage" code:a4 userInfo:v12];
  }
  return 0;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F71EF0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[PGFeatureExtractorAssetCollectionAverage floatVectorWithEntity:error:](self, "floatVectorWithEntity:error:", *(void *)(*((void *)&v18 + 1) + 8 * i), a5, (void)v18);
        if (!v14)
        {

          id v16 = 0;
          goto LABEL_11;
        }
        v15 = (void *)v14;
        [v8 appendRow:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v16 = v8;
LABEL_11:

  return v16;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [v6 photoLibrary];
  id v9 = [v8 librarySpecificFetchOptions];

  uint64_t v10 = [(PGFeatureExtractorAssetCollectionAverage *)self assetFetchOptionPropertySet];

  if (v10)
  {
    uint64_t v11 = [(PGFeatureExtractorAssetCollectionAverage *)self assetFetchOptionPropertySet];
    [v9 setFetchPropertySets:v11];
  }
  uint64_t v12 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v9];
  if ([v12 count])
  {
    v24 = a4;
    v25 = v9;
    id v26 = v6;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          long long v19 = [(PGFeatureExtractorAssetCollectionAverage *)self assetFeatureExtractor];
          id v27 = 0;
          long long v20 = [v19 floatVectorWithEntity:v18 error:&v27];
          id v21 = v27;

          if (!v20)
          {
            [(PGFeatureExtractorAssetCollectionAverage *)self _generateError:v24 code:1 message:@"Unable to extract feature vector for asset. Returning nil for the asset collection print." underlyingError:v21];

            v22 = 0;
            goto LABEL_14;
          }
          [v7 addObject:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v22 = [MEMORY[0x1E4F71ED0] meanVectorWithFloatVectors:v7];
LABEL_14:
    id v9 = v25;
    id v6 = v26;
  }
  else
  {
    [(PGFeatureExtractorAssetCollectionAverage *)self _generateError:a4 code:0 message:@"No assets could be fetched from the asset collection." underlyingError:0];
    v22 = 0;
  }

  return v22;
}

- (int64_t)featureLength
{
  v2 = [(PGFeatureExtractorAssetCollectionAverage *)self assetFeatureExtractor];
  v3 = [v2 featureNames];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)featureNames
{
  v2 = [(PGFeatureExtractorAssetCollectionAverage *)self assetFeatureExtractor];
  v3 = [v2 featureNames];

  return v3;
}

- (PGFeatureExtractorAssetCollectionAverage)initWithAssetFeatureExtractor:(id)a3 assetFetchOptionPropertySet:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGFeatureExtractorAssetCollectionAverage;
  uint64_t v12 = [(PGFeatureExtractorAssetCollectionAverage *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetFeatureExtractor, a3);
    objc_storeStrong((id *)&v13->_assetFetchOptionPropertySet, a4);
    objc_storeStrong((id *)&v13->_name, a5);
  }

  return v13;
}

@end