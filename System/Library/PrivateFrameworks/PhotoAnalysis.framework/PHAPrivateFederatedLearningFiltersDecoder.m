@interface PHAPrivateFederatedLearningFiltersDecoder
- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5;
- (BOOL)validateFiltersForDatasetName:(id)a3 error:(id *)a4;
- (NSDictionary)assetFeatureExtractorNameToClass;
- (NSDictionary)assetPhotoLibraryFeatureExtractorNameToClass;
- (NSDictionary)facesFeatureExtractorNameToClass;
- (NSDictionary)graphFeatureExtractorNameToClass;
- (NSString)fingerprintVersionString;
- (PHAPrivateFederatedLearningFiltersDecoder)initWithFingeprintVersionString:(id)a3;
- (id)featureExtractorFromName:(id)a3 error:(id *)a4;
- (id)featureValidatorForFilterConfig:(id)a3 featureExtractor:(id)a4 featureValidatorType:(int64_t)a5 featureExtractorType:(int64_t)a6 error:(id *)a7;
- (id)featureValidatorsForFilterConfigList:(id)a3 featureExtractor:(id)a4 featureValidatorType:(int64_t)a5 featureExtractorType:(int64_t)a6 error:(id *)a7;
- (id)filtersByDatasetNameFromDictionary:(id)a3 error:(id *)a4;
- (id)filtersFromDictionary:(id)a3 error:(id *)a4;
- (int64_t)featureExtractorTypeForFeatureExtractorName:(id)a3;
- (int64_t)featureValidatorTypeForFeatureExtractorName:(id)a3;
@end

@implementation PHAPrivateFederatedLearningFiltersDecoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprintVersionString, 0);
  objc_storeStrong((id *)&self->_assetPhotoLibraryFeatureExtractorNameToClass, 0);
  objc_storeStrong((id *)&self->_facesFeatureExtractorNameToClass, 0);
  objc_storeStrong((id *)&self->_graphFeatureExtractorNameToClass, 0);

  objc_storeStrong((id *)&self->_assetFeatureExtractorNameToClass, 0);
}

- (NSString)fingerprintVersionString
{
  return self->_fingerprintVersionString;
}

- (NSDictionary)assetPhotoLibraryFeatureExtractorNameToClass
{
  return self->_assetPhotoLibraryFeatureExtractorNameToClass;
}

- (NSDictionary)facesFeatureExtractorNameToClass
{
  return self->_facesFeatureExtractorNameToClass;
}

- (NSDictionary)graphFeatureExtractorNameToClass
{
  return self->_graphFeatureExtractorNameToClass;
}

- (NSDictionary)assetFeatureExtractorNameToClass
{
  return self->_assetFeatureExtractorNameToClass;
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
    v11 = [v7 errorWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningFiltersDecoder" code:a4 userInfo:v10];

    *a3 = v11;
  }
  return 0;
}

- (BOOL)validateFiltersForDatasetName:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = a3;
  uint64_t v25 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v25)
  {
    v23 = self;
    v24 = a4;
    uint64_t v7 = *(void *)v33;
    v27 = v6;
    uint64_t v22 = *(void *)v33;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v26 = v8;
        uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * v8);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v10 = objc_msgSend(v6, "objectForKeyedSubscript:", v9, v22);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          int v13 = 0;
          uint64_t v14 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v10);
              }
              v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              v17 = [v16 featureName];
              if ([v17 isEqualToString:@"AssetPropertiesFilter"])
              {
                int v18 = 1;
              }
              else
              {
                v19 = [v16 featureName];
                int v18 = [v19 isEqualToString:@"AssetInternalPropertiesFilter"];
              }
              if (v18 & v13)
              {
                [(PHAPrivateFederatedLearningFiltersDecoder *)v23 _generateError:v24 errorCode:4 errorMessage:@"Invalid filters: setting multiple asset properties filters for the same dataset is not allowed."];

                BOOL v20 = 0;
                id v6 = v27;
                goto LABEL_22;
              }
              v13 |= v18;
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v26 + 1;
        id v6 = v27;
        uint64_t v7 = v22;
      }
      while (v26 + 1 != v25);
      BOOL v20 = 1;
      uint64_t v25 = [v27 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v25);
  }
  else
  {
    BOOL v20 = 1;
  }
LABEL_22:

  return v20;
}

- (id)featureExtractorFromName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@"PhotoLibraryAverage-" withString:&stru_1F2900940];
  uint64_t v8 = [(PHAPrivateFederatedLearningFiltersDecoder *)self assetFeatureExtractorNameToClass];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  v10 = [(PHAPrivateFederatedLearningFiltersDecoder *)self graphFeatureExtractorNameToClass];
  uint64_t v11 = (void *)[v10 objectForKeyedSubscript:v7];

  uint64_t v12 = [(PHAPrivateFederatedLearningFiltersDecoder *)self facesFeatureExtractorNameToClass];
  uint64_t v13 = [v12 objectForKeyedSubscript:v7];

  uint64_t v14 = [(PHAPrivateFederatedLearningFiltersDecoder *)self assetPhotoLibraryFeatureExtractorNameToClass];
  uint64_t v15 = [v14 objectForKeyedSubscript:v7];

  if (v9)
  {
    v16 = (void *)v9;
LABEL_3:
    uint64_t v17 = [v16 featureExtractor];
LABEL_6:
    int v18 = (void *)v17;
    goto LABEL_7;
  }
  if (v11)
  {
    uint64_t v17 = [v11 featureExtractorWithError:a4];
    goto LABEL_6;
  }
  if (v13)
  {
    v16 = (void *)v13;
    goto LABEL_3;
  }
  if (v15)
  {
    v16 = (void *)v15;
    goto LABEL_3;
  }
  BOOL v20 = [NSString stringWithFormat:@"Invalid filters format: feature extractor name %@ is not valid.", v6];
  [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a4 errorCode:0 errorMessage:v20];

  int v18 = 0;
LABEL_7:

  return v18;
}

- (int64_t)featureExtractorTypeForFeatureExtractorName:(id)a3
{
  v4 = [a3 stringByReplacingOccurrencesOfString:@"PhotoLibraryAverage-" withString:&stru_1F2900940];
  v5 = [(PHAPrivateFederatedLearningFiltersDecoder *)self assetFeatureExtractorNameToClass];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    int64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [(PHAPrivateFederatedLearningFiltersDecoder *)self graphFeatureExtractorNameToClass];
    uint64_t v9 = [v8 objectForKeyedSubscript:v4];

    if (v9)
    {
      int64_t v7 = 2;
    }
    else
    {
      v10 = [(PHAPrivateFederatedLearningFiltersDecoder *)self facesFeatureExtractorNameToClass];
      uint64_t v11 = [v10 objectForKeyedSubscript:v4];

      if (v11) {
        int64_t v7 = 3;
      }
      else {
        int64_t v7 = 0;
      }
    }
  }

  return v7;
}

- (int64_t)featureValidatorTypeForFeatureExtractorName:(id)a3
{
  id v4 = a3;
  if ([v4 containsString:@"PhotoLibraryAverage-"])
  {
    int64_t v5 = 6;
  }
  else
  {
    uint64_t v6 = [(PHAPrivateFederatedLearningFiltersDecoder *)self assetPhotoLibraryFeatureExtractorNameToClass];
    uint64_t v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      int64_t v5 = 5;
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F8D638];
      uint64_t v9 = [(PHAPrivateFederatedLearningFiltersDecoder *)self fingerprintVersionString];
      uint64_t v10 = [v8 fingerprintVersionForName:v9];

      if (([MEMORY[0x1E4F8D638] isMomentFingerprintVersion:v10] & 1) != 0
        || ([MEMORY[0x1E4F8D638] isMemoryFingerprintVersion:v10] & 1) != 0)
      {
        int64_t v5 = 4;
      }
      else
      {
        uint64_t v12 = [(PHAPrivateFederatedLearningFiltersDecoder *)self assetFeatureExtractorNameToClass];
        uint64_t v13 = [v12 objectForKeyedSubscript:v4];

        if (v13)
        {
          int64_t v5 = 1;
        }
        else
        {
          uint64_t v14 = [(PHAPrivateFederatedLearningFiltersDecoder *)self graphFeatureExtractorNameToClass];
          uint64_t v15 = [v14 objectForKeyedSubscript:v4];

          if (v15)
          {
            int64_t v5 = 2;
          }
          else
          {
            v16 = [(PHAPrivateFederatedLearningFiltersDecoder *)self facesFeatureExtractorNameToClass];
            uint64_t v17 = [v16 objectForKeyedSubscript:v4];

            if (v17) {
              int64_t v5 = 3;
            }
            else {
              int64_t v5 = 0;
            }
          }
        }
      }
    }
  }

  return v5;
}

- (id)featureValidatorForFilterConfig:(id)a3 featureExtractor:(id)a4 featureValidatorType:(int64_t)a5 featureExtractorType:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v12 objectForKeyedSubscript:@"featureName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v12 objectForKeyedSubscript:@"predicate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:v15];
        switch(a5)
        {
          case 0:
            [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a7 errorCode:3 errorMessage:@"Unknown feature validator type is unsupported"];
            a7 = 0;
            break;
          case 1:
            uint64_t v17 = (objc_class *)MEMORY[0x1E4F8D628];
            goto LABEL_14;
          case 2:
            uint64_t v17 = (objc_class *)MEMORY[0x1E4F8D6D8];
            goto LABEL_14;
          case 3:
            uint64_t v17 = (objc_class *)MEMORY[0x1E4F8D3F0];
            goto LABEL_14;
          case 4:
            int v18 = (objc_class *)MEMORY[0x1E4F8D330];
            goto LABEL_16;
          case 5:
            uint64_t v17 = (objc_class *)MEMORY[0x1E4F8D348];
LABEL_14:
            v19 = (id *)[[v17 alloc] initWithPredicate:v16 featureExtractor:v13 featureName:v14];
            goto LABEL_17;
          case 6:
            int v18 = (objc_class *)MEMORY[0x1E4F8D880];
LABEL_16:
            v19 = (id *)[[v18 alloc] initWithPredicate:v16 featureExtractor:v13 featureExtractorType:a6 featureName:v14];
LABEL_17:
            a7 = v19;
            break;
          default:
            break;
        }
      }
      else
      {
        [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a7 errorCode:1 errorMessage:@"Invalid filter config format: predicate is not a string."];
        a7 = 0;
      }
    }
    else
    {
      [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a7 errorCode:1 errorMessage:@"Invalid filter config format: feature name is not a string."];
      a7 = 0;
    }
  }
  else
  {
    [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a7 errorCode:1 errorMessage:@"Invalid filter config format: filter configuration is not dictionary."];
    a7 = 0;
  }

  return a7;
}

- (id)featureValidatorsForFilterConfigList:(id)a3 featureExtractor:(id)a4 featureValidatorType:(int64_t)a5 featureExtractorType:(int64_t)a6 error:(id *)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v23 = v12;
    id obj = v12;
    uint64_t v15 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = -[PHAPrivateFederatedLearningFiltersDecoder featureValidatorForFilterConfig:featureExtractor:featureValidatorType:featureExtractorType:error:](self, "featureValidatorForFilterConfig:featureExtractor:featureValidatorType:featureExtractorType:error:", *(void *)(*((void *)&v25 + 1) + 8 * i), v13, a5, a6, a7, v23);
          if (!v19)
          {

            id v21 = 0;
            goto LABEL_13;
          }
          BOOL v20 = (void *)v19;
          [v14 addObject:v19];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v21 = v14;
LABEL_13:

    id v12 = v23;
  }
  else
  {
    [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a7 errorCode:1 errorMessage:@"Invalid filters format: value for filter config is not an array."];
    id v21 = 0;
  }

  return v21;
}

- (id)filtersFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v22 = v6;
      uint64_t v23 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v23) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid filters format: value for feature extractor name is not a string."];
LABEL_16:

            id v20 = 0;
            id v6 = v22;
            goto LABEL_17;
          }
          id v13 = [(PHAPrivateFederatedLearningFiltersDecoder *)self featureExtractorFromName:v12 error:a4];
          int64_t v14 = [(PHAPrivateFederatedLearningFiltersDecoder *)self featureValidatorTypeForFeatureExtractorName:v12];
          int64_t v15 = [(PHAPrivateFederatedLearningFiltersDecoder *)self featureExtractorTypeForFeatureExtractorName:v12];
          if (!v13) {
            goto LABEL_16;
          }
          int64_t v16 = v15;
          uint64_t v17 = [v8 objectForKeyedSubscript:v12];
          uint64_t v18 = [(PHAPrivateFederatedLearningFiltersDecoder *)self featureValidatorsForFilterConfigList:v17 featureExtractor:v13 featureValidatorType:v14 featureExtractorType:v16 error:a4];
          if (!v18)
          {

            goto LABEL_16;
          }
          uint64_t v19 = (void *)v18;
          [v7 addObjectsFromArray:v18];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        id v6 = v22;
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v20 = v7;
LABEL_17:
  }
  else
  {
    [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid filters format: value for feature extractor config is not a dictionary."];
    id v20 = 0;
  }

  return v20;
}

- (id)filtersByDatasetNameFromDictionary:(id)a3 error:(id *)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v28[0] = @"positive";
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v28[1] = @"negative";
  v29[0] = v6;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v29[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v24;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      int64_t v14 = *(__CFString **)(*((void *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid filters format: value for dataset name is not a string."];
LABEL_18:

        goto LABEL_19;
      }
      if (([(__CFString *)v14 isEqualToString:@"all"] & 1) == 0
        && ([(__CFString *)v14 isEqualToString:@"positive"] & 1) == 0
        && ([(__CFString *)v14 isEqualToString:@"negative"] & 1) == 0)
      {
        id v21 = [NSString stringWithFormat:@"Dataset name %@ is not a supported.", v14];
        [(PHAPrivateFederatedLearningFiltersDecoder *)self _generateError:a4 errorCode:2 errorMessage:v21];

        goto LABEL_18;
      }
      int64_t v15 = [v9 objectForKeyedSubscript:v14];
      int64_t v16 = [(PHAPrivateFederatedLearningFiltersDecoder *)self filtersFromDictionary:v15 error:a4];

      if (!v16) {
        goto LABEL_18;
      }
      if ([(__CFString *)v14 isEqualToString:@"all"])
      {
        uint64_t v17 = [v8 objectForKeyedSubscript:@"positive"];
        [v17 addObjectsFromArray:v16];

        int64_t v14 = @"negative";
      }
      uint64_t v18 = [v8 objectForKeyedSubscript:v14];
      [v18 addObjectsFromArray:v16];
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_15:

  if ([(PHAPrivateFederatedLearningFiltersDecoder *)self validateFiltersForDatasetName:v8 error:a4])
  {
    id v19 = v8;
  }
  else
  {
LABEL_19:
    id v19 = 0;
  }

  return v19;
}

- (PHAPrivateFederatedLearningFiltersDecoder)initWithFingeprintVersionString:(id)a3
{
  v25[55] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHAPrivateFederatedLearningFiltersDecoder;
  id v6 = [(PHAPrivateFederatedLearningFiltersDecoder *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fingerprintVersionString, a3);
    v24[0] = *MEMORY[0x1E4F8DAC0];
    v25[0] = objc_opt_class();
    v24[1] = *MEMORY[0x1E4F8DB20];
    v25[1] = objc_opt_class();
    v24[2] = *MEMORY[0x1E4F8DA08];
    v25[2] = objc_opt_class();
    v24[3] = *MEMORY[0x1E4F8DA10];
    v25[3] = objc_opt_class();
    v24[4] = *MEMORY[0x1E4F8DA20];
    v25[4] = objc_opt_class();
    v24[5] = *MEMORY[0x1E4F8DA30];
    v25[5] = objc_opt_class();
    v24[6] = *MEMORY[0x1E4F8D9A0];
    v25[6] = objc_opt_class();
    v24[7] = *MEMORY[0x1E4F8DB50];
    v25[7] = objc_opt_class();
    v24[8] = *MEMORY[0x1E4F8DA00];
    v25[8] = objc_opt_class();
    v24[9] = *MEMORY[0x1E4F8D9F0];
    v25[9] = objc_opt_class();
    v24[10] = *MEMORY[0x1E4F8DA90];
    v25[10] = objc_opt_class();
    v24[11] = *MEMORY[0x1E4F8DA68];
    v25[11] = objc_opt_class();
    v24[12] = *MEMORY[0x1E4F8DA18];
    v25[12] = objc_opt_class();
    v24[13] = *MEMORY[0x1E4F8DA70];
    v25[13] = objc_opt_class();
    v24[14] = *MEMORY[0x1E4F8DA98];
    v25[14] = objc_opt_class();
    v24[15] = *MEMORY[0x1E4F8DAD0];
    v25[15] = objc_opt_class();
    v24[16] = *MEMORY[0x1E4F8DB28];
    v25[16] = objc_opt_class();
    v24[17] = *MEMORY[0x1E4F8DB58];
    v25[17] = objc_opt_class();
    v24[18] = *MEMORY[0x1E4F8D9F8];
    v25[18] = objc_opt_class();
    v24[19] = *MEMORY[0x1E4F8DB48];
    v25[19] = objc_opt_class();
    v24[20] = *MEMORY[0x1E4F8DA58];
    v25[20] = objc_opt_class();
    v24[21] = *MEMORY[0x1E4F8D9A8];
    v25[21] = objc_opt_class();
    v24[22] = *MEMORY[0x1E4F8DAE8];
    v25[22] = objc_opt_class();
    v24[23] = *MEMORY[0x1E4F8DB68];
    v25[23] = objc_opt_class();
    v24[24] = *MEMORY[0x1E4F8DB60];
    v25[24] = objc_opt_class();
    v24[25] = *MEMORY[0x1E4F8DB70];
    v25[25] = objc_opt_class();
    v24[26] = *MEMORY[0x1E4F8DB30];
    v25[26] = objc_opt_class();
    v24[27] = *MEMORY[0x1E4F8DA60];
    v25[27] = objc_opt_class();
    v24[28] = *MEMORY[0x1E4F8DB08];
    v25[28] = objc_opt_class();
    v24[29] = *MEMORY[0x1E4F8DAA0];
    v25[29] = objc_opt_class();
    v24[30] = *MEMORY[0x1E4F8DB10];
    v25[30] = objc_opt_class();
    v24[31] = *MEMORY[0x1E4F8DAF0];
    v25[31] = objc_opt_class();
    v24[32] = *MEMORY[0x1E4F8DA78];
    v25[32] = objc_opt_class();
    v24[33] = *MEMORY[0x1E4F8DAF8];
    v25[33] = objc_opt_class();
    v24[34] = *MEMORY[0x1E4F8DB00];
    v25[34] = objc_opt_class();
    v24[35] = *MEMORY[0x1E4F8DAB8];
    v25[35] = objc_opt_class();
    v24[36] = *MEMORY[0x1E4F8DAE0];
    v25[36] = objc_opt_class();
    v24[37] = *MEMORY[0x1E4F8DA80];
    v25[37] = objc_opt_class();
    v24[38] = *MEMORY[0x1E4F8DA88];
    v25[38] = objc_opt_class();
    v24[39] = *MEMORY[0x1E4F8DAD8];
    v25[39] = objc_opt_class();
    v24[40] = *MEMORY[0x1E4F8DAB0];
    v25[40] = objc_opt_class();
    v24[41] = *MEMORY[0x1E4F8D9D8];
    v25[41] = objc_opt_class();
    v24[42] = *MEMORY[0x1E4F8D9D0];
    v25[42] = objc_opt_class();
    v24[43] = *MEMORY[0x1E4F8D9C8];
    v25[43] = objc_opt_class();
    v24[44] = *MEMORY[0x1E4F8D9B0];
    v25[44] = objc_opt_class();
    v24[45] = *MEMORY[0x1E4F8D9E8];
    v25[45] = objc_opt_class();
    v24[46] = *MEMORY[0x1E4F8D9E0];
    v25[46] = objc_opt_class();
    v24[47] = *MEMORY[0x1E4F8D9B8];
    v25[47] = objc_opt_class();
    v24[48] = *MEMORY[0x1E4F8D9C0];
    v25[48] = objc_opt_class();
    v24[49] = *MEMORY[0x1E4F8DB38];
    v25[49] = objc_opt_class();
    v24[50] = *MEMORY[0x1E4F8DAA8];
    v25[50] = objc_opt_class();
    v24[51] = *MEMORY[0x1E4F8DB40];
    v25[51] = objc_opt_class();
    v24[52] = *MEMORY[0x1E4F8DB18];
    v25[52] = objc_opt_class();
    v24[53] = @"AssetPropertiesFilter";
    v25[53] = objc_opt_class();
    v24[54] = @"AssetInternalPropertiesFilter";
    v25[54] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:55];
    assetFeatureExtractorNameToClass = v7->_assetFeatureExtractorNameToClass;
    v7->_assetFeatureExtractorNameToClass = (NSDictionary *)v8;

    v22[0] = @"Meaning";
    v23[0] = objc_opt_class();
    v22[1] = @"InvariantFamily";
    v23[1] = objc_opt_class();
    v22[2] = @"InvariantCoworker";
    v23[2] = objc_opt_class();
    v22[3] = @"InvariantPartner";
    v23[3] = objc_opt_class();
    v22[4] = @"PublicEventCategory";
    v23[4] = objc_opt_class();
    v22[5] = @"BusinessCategory";
    v23[5] = objc_opt_class();
    v22[6] = @"InvariantPet";
    v23[6] = objc_opt_class();
    v22[7] = @"InvariantBaby";
    v23[7] = objc_opt_class();
    v22[8] = @"Scene";
    v23[8] = objc_opt_class();
    v22[9] = @"MyHome";
    v23[9] = objc_opt_class();
    v22[10] = @"MyWork";
    v23[10] = objc_opt_class();
    v22[11] = @"Mobility";
    v23[11] = objc_opt_class();
    v22[12] = @"PartOfDay";
    v23[12] = objc_opt_class();
    v22[13] = @"Season";
    v23[13] = objc_opt_class();
    v22[14] = @"Weekend";
    v23[14] = objc_opt_class();
    v22[15] = @"Weekday";
    v23[15] = objc_opt_class();
    v22[16] = @"POI";
    v23[16] = objc_opt_class();
    v22[17] = @"ROI";
    v23[17] = objc_opt_class();
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:18];
    graphFeatureExtractorNameToClass = v7->_graphFeatureExtractorNameToClass;
    v7->_graphFeatureExtractorNameToClass = (NSDictionary *)v10;

    v20[0] = *MEMORY[0x1E4F8DA48];
    v21[0] = objc_opt_class();
    v20[1] = *MEMORY[0x1E4F8DA40];
    v21[1] = objc_opt_class();
    v20[2] = *MEMORY[0x1E4F8DA50];
    v21[2] = objc_opt_class();
    v20[3] = *MEMORY[0x1E4F8DA38];
    v21[3] = objc_opt_class();
    v20[4] = *MEMORY[0x1E4F8DA28];
    v21[4] = objc_opt_class();
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
    facesFeatureExtractorNameToClass = v7->_facesFeatureExtractorNameToClass;
    v7->_facesFeatureExtractorNameToClass = (NSDictionary *)v12;

    uint64_t v18 = *MEMORY[0x1E4F8DAC8];
    uint64_t v19 = objc_opt_class();
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    assetPhotoLibraryFeatureExtractorNameToClass = v7->_assetPhotoLibraryFeatureExtractorNameToClass;
    v7->_assetPhotoLibraryFeatureExtractorNameToClass = (NSDictionary *)v14;
  }
  return v7;
}

@end