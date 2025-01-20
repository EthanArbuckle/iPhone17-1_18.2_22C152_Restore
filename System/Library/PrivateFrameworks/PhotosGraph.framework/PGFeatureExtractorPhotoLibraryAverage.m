@interface PGFeatureExtractorPhotoLibraryAverage
+ (BOOL)preCalculateFeatureVectorWithPhotoLibrary:(id)a3 assetFeatureExtractor:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6;
+ (id)preCalculatedFloatVector;
+ (void)resetPreCalculatedFeatureVector;
+ (void)setPreCalculatedFloatVector:(id)a3;
- (MAFeatureExtractor)assetFeatureExtractor;
- (NSArray)assetFetchOptionPropertySet;
- (NSArray)featureNames;
- (PGFeatureExtractorPhotoLibraryAverage)initWithAssetFeatureExtractor:(id)a3 assetFetchOptionPropertySet:(id)a4;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorPhotoLibraryAverage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_assetFetchOptionPropertySet, 0);
  objc_storeStrong((id *)&self->_assetFeatureExtractor, 0);
}

- (NSArray)assetFetchOptionPropertySet
{
  return self->_assetFetchOptionPropertySet;
}

- (MAFeatureExtractor)assetFeatureExtractor
{
  return self->_assetFeatureExtractor;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() preCalculatedFloatVector];

  if (v7) {
    goto LABEL_3;
  }
  v8 = objc_opt_class();
  v9 = [(PGFeatureExtractorPhotoLibraryAverage *)self assetFeatureExtractor];
  v10 = [(PGFeatureExtractorPhotoLibraryAverage *)self assetFetchOptionPropertySet];
  int v11 = [v8 preCalculateFeatureVectorWithPhotoLibrary:v6 assetFeatureExtractor:v9 assetFetchOptionPropertySet:v10 error:a4];

  if (v11)
  {
LABEL_3:
    v12 = [(id)objc_opt_class() preCalculatedFloatVector];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)featureLength
{
  v2 = [(PGFeatureExtractorPhotoLibraryAverage *)self assetFeatureExtractor];
  v3 = [v2 featureNames];
  int64_t v4 = [v3 count];

  return v4;
}

- (NSArray)featureNames
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  featureNames = self->_featureNames;
  if (!featureNames)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v5 = [(PGFeatureExtractorPhotoLibraryAverage *)self assetFeatureExtractor];
    id v6 = [v5 featureNames];
    v7 = (NSArray *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v6, "count"));

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = [(PGFeatureExtractorPhotoLibraryAverage *)self assetFeatureExtractor];
    v9 = [v8 featureNames];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [NSString stringWithFormat:@"PhotoLibraryAverage-%@", *(void *)(*((void *)&v17 + 1) + 8 * v13)];
          [(NSArray *)v7 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    v15 = self->_featureNames;
    self->_featureNames = v7;

    featureNames = self->_featureNames;
  }
  return featureNames;
}

- (id)name
{
  v2 = NSString;
  v3 = [(PGFeatureExtractorPhotoLibraryAverage *)self assetFeatureExtractor];
  id v4 = [v3 name];
  v5 = [v2 stringWithFormat:@"PhotoLibraryAverage-%@", v4];

  return v5;
}

- (PGFeatureExtractorPhotoLibraryAverage)initWithAssetFeatureExtractor:(id)a3 assetFetchOptionPropertySet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGFeatureExtractorPhotoLibraryAverage;
  v9 = [(PGFeatureExtractorPhotoLibraryAverage *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetFeatureExtractor, a3);
    objc_storeStrong((id *)&v10->_assetFetchOptionPropertySet, a4);
  }

  return v10;
}

+ (void)setPreCalculatedFloatVector:(id)a3
{
}

+ (id)preCalculatedFloatVector
{
  return (id)preCalculatedFloatVector;
}

+ (void)resetPreCalculatedFeatureVector
{
}

+ (BOOL)preCalculateFeatureVectorWithPhotoLibrary:(id)a3 assetFeatureExtractor:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v43 = a4;
  id v11 = a5;
  [a1 resetPreCalculatedFeatureVector];
  objc_super v12 = [v10 librarySpecificFetchOptions];
  [v12 setChunkSizeForFetch:100];
  [v12 setCacheSizeForFetch:100];
  if (v11) {
    [v12 setFetchPropertySets:v11];
  }
  v42 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v12];
  uint64_t v13 = [v42 count];
  if (!a6 || v13)
  {
    id v36 = a1;
    v37 = a6;
    v38 = v12;
    id v39 = v11;
    id v40 = v10;
    long long v17 = [v43 featureNames];
    uint64_t v18 = [v17 count];

    v41 = [MEMORY[0x1E4F71EF8] vectorRepeatingFloat:v18 count:0.0];
    unint64_t v19 = [v42 count];
    if (v19)
    {
      id v15 = 0;
      uint64_t v21 = 0;
      unint64_t v22 = 0;
      do
      {
        v23 = v15;
        v24 = (void *)MEMORY[0x1D25FED50]();
        v25 = [v42 objectAtIndexedSubscript:v21];
        id v44 = v15;
        v26 = [v43 floatVectorWithEntity:v25 error:&v44];
        id v15 = v44;

        if (v26 && [v26 count] == v18)
        {
          [v41 addVector:v26];
          ++v22;
        }
        else
        {
          v27 = +[PGLogging sharedLogging];
          v28 = [v27 loggingConnection];

          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = [v25 localIdentifier];
            *(_DWORD *)buf = 138412546;
            v48 = v29;
            __int16 v49 = 2112;
            id v50 = v15;
            _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "Failed to calculate feature vector for asset %@: %@", buf, 0x16u);
          }
        }

        ++v21;
      }
      while (v19 != v21);
    }
    else
    {
      unint64_t v22 = 0;
      id v15 = 0;
    }
    if (v37)
    {
      v30 = (__CFString *)v15;
      id *v37 = v30;
      objc_super v12 = v38;
      id v11 = v39;
      if (v22 <= v19 >> 1)
      {
        v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = *MEMORY[0x1E4F28A50];
        v45[0] = *MEMORY[0x1E4F28568];
        v45[1] = v32;
        v33 = @"nil";
        if (v30) {
          v33 = v30;
        }
        v46[0] = @"Failed to compute mean of asset feature vectors. More than half of the asset feature vector extraction failed. Error: ";
        v46[1] = v33;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
        [v31 errorWithDomain:@"com.apple.PhotoAnalysis.PGFeatureExtractorPhotoLibraryAverageDomain" code:2 userInfo:v34];
        BOOL v16 = 0;
        id *v37 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else
    {
      objc_super v12 = v38;
      id v11 = v39;
      if (v22 <= v19 >> 1)
      {
        BOOL v16 = 0;
        goto LABEL_25;
      }
    }
    *(float *)&double v20 = (float)v22;
    v34 = [v41 vectorByDividingByScalar:v20];
    [v36 setPreCalculatedFloatVector:v34];
    BOOL v16 = 1;
LABEL_24:

LABEL_25:
    id v10 = v40;
    goto LABEL_26;
  }
  v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  v52[0] = @"Library contains no assets.";
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  [v14 errorWithDomain:@"com.apple.PhotoAnalysis.PGFeatureExtractorPhotoLibraryAverageDomain" code:1 userInfo:v15];
  BOOL v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v16;
}

@end