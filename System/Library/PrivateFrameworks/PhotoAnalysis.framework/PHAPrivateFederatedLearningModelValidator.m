@interface PHAPrivateFederatedLearningModelValidator
- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6;
- (BOOL)_isFingerprintVersionSupported:(int64_t)a3;
- (BOOL)isValidWithFingerprintVersionName:(id)a3 modelInputName:(id)a4 modelOutputName:(id)a5 labelName:(id)a6 labelPolicyName:(id)a7 lossName:(id)a8 layersToTrain:(id)a9 error:(id *)a10;
- (NSURL)espressoModelShapeURL;
- (NSURL)espressoModelURL;
- (PHAPrivateFederatedLearningModelValidator)initWithEspressoModelURL:(id)a3 espressoModelShapeURL:(id)a4;
- (id)_dictionaryForJSONFileURL:(id)a3 error:(id *)a4;
- (id)_layerConfigForLabelName:(id)a3 modelConfig:(id)a4 error:(id *)a5;
- (id)_layerConfigForLayerName:(id)a3 modelConfig:(id)a4 error:(id *)a5;
- (id)_layerConfigForModelInputName:(id)a3 modelConfig:(id)a4 error:(id *)a5;
- (id)_layerConfigForModelOutputName:(id)a3 modelConfig:(id)a4 error:(id *)a5;
- (id)_layerConfigForName:(id)a3 modelConfig:(id)a4 attributeName:(id)a5 useEquality:(BOOL)a6 error:(id *)a7;
- (id)_sizeForLayerName:(id)a3 modelShape:(id)a4 error:(id *)a5;
- (int64_t)_featureVectorSizeForFingerprintVersionName:(id)a3 error:(id *)a4;
@end

@implementation PHAPrivateFederatedLearningModelValidator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoModelShapeURL, 0);

  objc_storeStrong((id *)&self->_espressoModelURL, 0);
}

- (NSURL)espressoModelShapeURL
{
  return self->_espressoModelShapeURL;
}

- (NSURL)espressoModelURL
{
  return self->_espressoModelURL;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];

    if (v9) {
      [v12 setObject:v9 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningModelValidator" code:a4 userInfo:v12];
  }
  return 0;
}

- (BOOL)_isFingerprintVersionSupported:(int64_t)a3
{
  if ((unint64_t)(a3 - 201) <= 0x1B && ((1 << (a3 + 55)) & 0xF003F79) != 0) {
    return 0;
  }
  if ((unint64_t)a3 <= 0x19 && ((1 << a3) & 0x200F6F3) != 0) {
    return 0;
  }
  BOOL result = 1;
  if ((unint64_t)(a3 - 101) <= 0x18 && ((1 << (a3 - 101)) & 0x1003F29) != 0) {
    return 0;
  }
  return result;
}

- (id)_sizeForLayerName:(id)a3 modelShape:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 objectForKeyedSubscript:@"layer_shapes"];
  v10 = [v9 objectForKeyedSubscript:v8];

  if (v10)
  {
    id v11 = [v10 objectForKeyedSubscript:@"k"];
    if ([v11 integerValue] > 0)
    {
      id v11 = v11;
      id v12 = v11;
      goto LABEL_7;
    }
    v13 = [NSString stringWithFormat:@"Layer size not found or invalid (%@) for layer name '%@'", v11, v8];
    [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a5 errorCode:9 errorMessage:v13 underlyingError:0];
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"Shape not found for layer name '%@'", v8];
    [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a5 errorCode:8 errorMessage:v11 underlyingError:0];
  }
  id v12 = 0;
LABEL_7:

  return v12;
}

- (id)_layerConfigForName:(id)a3 modelConfig:(id)a4 attributeName:(id)a5 useEquality:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  v14 = [a4 objectForKeyedSubscript:@"layers"];
  v15 = v14;
  if (v14)
  {
    v29 = self;
    v30 = a7;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v31 = v14;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v22 = [v21 objectForKeyedSubscript:v13];
          v23 = v22;
          if (v8) {
            char v24 = [v22 isEqualToString:v12];
          }
          else {
            char v24 = [v22 containsString:v12];
          }
          char v25 = v24;

          if (v25)
          {
            id v27 = v21;

            goto LABEL_15;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    v26 = [NSString stringWithFormat:@"Unable to find a layer with attribute '%@' == '%@'", v13, v12];
    [(PHAPrivateFederatedLearningModelValidator *)v29 _generateError:v30 errorCode:7 errorMessage:v26 underlyingError:0];

    id v27 = 0;
LABEL_15:
    v15 = v31;
  }
  else
  {
    [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a7 errorCode:6 errorMessage:@"Model config does not have layers key" underlyingError:0];
    id v27 = 0;
  }

  return v27;
}

- (id)_layerConfigForLayerName:(id)a3 modelConfig:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForName:v8 modelConfig:v9 attributeName:@"name" useEquality:1 error:a5];
  if (!v10)
  {
    id v11 = [v8 stringByReplacingOccurrencesOfString:@"/" withString:@"\\/"];
    v10 = [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForName:v11 modelConfig:v9 attributeName:@"name" useEquality:1 error:a5];
  }

  return v10;
}

- (id)_layerConfigForLabelName:(id)a3 modelConfig:(id)a4 error:(id *)a5
{
  return [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForName:a3 modelConfig:a4 attributeName:@"bottom" useEquality:0 error:a5];
}

- (id)_layerConfigForModelOutputName:(id)a3 modelConfig:(id)a4 error:(id *)a5
{
  return [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForName:a3 modelConfig:a4 attributeName:@"top" useEquality:1 error:a5];
}

- (id)_layerConfigForModelInputName:(id)a3 modelConfig:(id)a4 error:(id *)a5
{
  return [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForName:a3 modelConfig:a4 attributeName:@"bottom" useEquality:1 error:a5];
}

- (id)_dictionaryForJSONFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6];
    if (v7)
    {
      id v14 = 0;
      id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v14];
      id v9 = v14;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v12 = [NSString stringWithFormat:@"Error parsing file %@", v6];
        [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a4 errorCode:5 errorMessage:v12 underlyingError:v9];
      }
    }
    else
    {
      id v11 = [NSString stringWithFormat:@"Error reading file %@", v6];
      [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a4 errorCode:4 errorMessage:v11 underlyingError:0];

      id v8 = 0;
    }
  }
  else
  {
    [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a4 errorCode:3 errorMessage:@"JSON file url is nil." underlyingError:0];
    id v8 = 0;
  }

  return v8;
}

- (int64_t)_featureVectorSizeForFingerprintVersionName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F8D638] fingerprintVersionForName:v6];
  if ([(PHAPrivateFederatedLearningModelValidator *)self _isFingerprintVersionSupported:v7])
  {
    id v8 = (void *)MEMORY[0x1E4F8D638];
    id v9 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    id v20 = 0;
    id v10 = [v8 featureExtractorForFingerprintVersion:v7 withGraph:v9 withTransformers:0 error:&v20];
    id v11 = v20;

    if (v10)
    {
      id v12 = [v10 featureNames];
      int64_t v13 = [v12 count];

      if (v13)
      {
LABEL_8:

        goto LABEL_9;
      }
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Feature vector has size 0 for fingerprint version %lu", v7);
      v15 = self;
      id v16 = a4;
      uint64_t v17 = 2;
    }
    else
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Error getting feature extractor for fingerprint version %lu", v7);
      v15 = self;
      id v16 = a4;
      uint64_t v17 = 1;
    }
    [(PHAPrivateFederatedLearningModelValidator *)v15 _generateError:v16 errorCode:v17 errorMessage:v14 underlyingError:v11];

    int64_t v13 = 0;
    goto LABEL_8;
  }
  uint64_t v18 = [NSString stringWithFormat:@"Fingerprint version %@ is not supported by PFL. If you really want to use it, please disable validation.", v6];
  [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a4 errorCode:15 errorMessage:v18 underlyingError:0];

  int64_t v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)isValidWithFingerprintVersionName:(id)a3 modelInputName:(id)a4 modelOutputName:(id)a5 labelName:(id)a6 labelPolicyName:(id)a7 lossName:(id)a8 layersToTrain:(id)a9 error:(id *)a10
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  int64_t v22 = [(PHAPrivateFederatedLearningModelValidator *)self _featureVectorSizeForFingerprintVersionName:a3 error:a10];
  if (v22)
  {
    int64_t v23 = v22;
    id v76 = v18;
    char v24 = [(PHAPrivateFederatedLearningModelValidator *)self espressoModelURL];
    char v25 = [(PHAPrivateFederatedLearningModelValidator *)self _dictionaryForJSONFileURL:v24 error:a10];

    if (!v25)
    {
      BOOL v48 = 0;
      id v18 = v76;
LABEL_60:

      goto LABEL_61;
    }
    v74 = v21;
    v26 = v20;
    id v27 = v17;
    id v28 = v19;
    v29 = [(PHAPrivateFederatedLearningModelValidator *)self espressoModelShapeURL];
    uint64_t v30 = [(PHAPrivateFederatedLearningModelValidator *)self _dictionaryForJSONFileURL:v29 error:a10];

    v75 = (void *)v30;
    if (!v30)
    {
      BOOL v48 = 0;
      id v18 = v76;
      id v19 = v28;
      id v17 = v27;
      id v20 = v26;
      id v21 = v74;
LABEL_59:

      goto LABEL_60;
    }
    v31 = [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForModelInputName:v16 modelConfig:v25 error:a10];
    id v18 = v76;
    if (!v31)
    {
      BOOL v48 = 0;
      id v19 = v28;
      id v17 = v27;
      id v20 = v26;
      id v21 = v74;
LABEL_58:

      goto LABEL_59;
    }
    id v73 = v31;
    long long v32 = [(PHAPrivateFederatedLearningModelValidator *)self _sizeForLayerName:v16 modelShape:v30 error:a10];
    if (v32)
    {
      long long v33 = v32;
      if ([v32 integerValue] == v23)
      {
        v68 = v33;
        long long v34 = [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForModelOutputName:v27 modelConfig:v25 error:a10];
        long long v35 = v34;
        v69 = v28;
        if (!v34)
        {
          BOOL v48 = 0;
          id v17 = v27;
          id v20 = v26;
          id v21 = v74;
LABEL_56:

          long long v32 = v68;
          id v19 = v69;
          goto LABEL_57;
        }
        v36 = [v34 objectForKeyedSubscript:@"attributes"];
        uint64_t v37 = [v36 objectForKeyedSubscript:@"is_output"];

        if ([v37 integerValue] != 1)
        {
          v51 = [NSString stringWithFormat:@"Output layer is not set as an output of the model (%@)", v37];
          [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a10 errorCode:11 errorMessage:v51 underlyingError:0];

          BOOL v48 = 0;
          id v18 = v76;
          id v17 = v27;
          id v20 = v26;
          id v21 = v74;
LABEL_55:

          goto LABEL_56;
        }
        id v17 = v27;
        v38 = [(PHAPrivateFederatedLearningModelValidator *)self _sizeForLayerName:v27 modelShape:v75 error:a10];
        if (!v38)
        {
          BOOL v48 = 0;
          id v18 = v76;
          id v20 = v26;
          id v21 = v74;
LABEL_54:

          goto LABEL_55;
        }
        id v64 = v38;
        id v20 = v26;
        char v39 = [v26 isEqualToString:@"mse"];
        id v21 = v74;
        if (v39 & 1) != 0 || ([v20 isEqualToString:@"cross_entropy"])
        {
LABEL_12:
          v61 = v37;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id obj = v74;
          uint64_t v40 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            id v70 = *(id *)v78;
            v62 = v35;
            while (2)
            {
              for (uint64_t i = 0; i != v41; ++i)
              {
                if (*(id *)v78 != v70) {
                  objc_enumerationMutation(obj);
                }
                v43 = [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForLayerName:*(void *)(*((void *)&v77 + 1) + 8 * i) modelConfig:v25 error:a10];

                if (!v43)
                {

                  BOOL v48 = 0;
                  id v18 = v76;
                  uint64_t v37 = v61;
                  long long v35 = v62;
                  goto LABEL_53;
                }
              }
              long long v35 = v62;
              uint64_t v41 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
              if (v41) {
                continue;
              }
              break;
            }
          }

          id v18 = v76;
          v44 = [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForLabelName:v76 modelConfig:v25 error:0];
          if (!v44)
          {
            BOOL v48 = 1;
            uint64_t v37 = v61;
LABEL_52:

            goto LABEL_53;
          }
          id v71 = v44;
          v45 = [(PHAPrivateFederatedLearningModelValidator *)self _sizeForLayerName:v76 modelShape:v75 error:a10];
          if (v45)
          {
            id obja = v45;
            int64_t v46 = +[PHAPrivateFederatedLearningRecipeOptions labelPolicyForLabelPolicyName:v69];
            if (v46 == 1)
            {
              uint64_t v37 = v61;
              if ([obja integerValue] != 2)
              {
                v47 = @"One-hot label policy requires label size to be 2 (%@)";
                goto LABEL_50;
              }
            }
            else
            {
              uint64_t v37 = v61;
              if (!v46 && [obja integerValue] != 1)
              {
                v47 = @"Indexed label policy requires label size to be 1 (%@)";
LABEL_50:
                v59 = objc_msgSend(NSString, "stringWithFormat:", v47, obja);
                [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a10 errorCode:14 errorMessage:v59 underlyingError:0];

                v45 = obja;
                BOOL v48 = 0;
                id v18 = v76;
                goto LABEL_51;
              }
            }
            BOOL v48 = 1;
            v45 = obja;
          }
          else
          {
            BOOL v48 = 0;
            uint64_t v37 = v61;
          }
LABEL_51:

          v44 = v71;
          goto LABEL_52;
        }
        v52 = [(PHAPrivateFederatedLearningModelValidator *)self _layerConfigForModelOutputName:v20 modelConfig:v25 error:a10];
        if (v52)
        {
          id objb = v52;
          v53 = [v52 objectForKeyedSubscript:@"attributes"];
          id v72 = [v53 objectForKeyedSubscript:@"is_output"];

          v54 = v72;
          if ([v72 integerValue] == 1)
          {
            v63 = v35;
            v55 = [(PHAPrivateFederatedLearningModelValidator *)self _sizeForLayerName:v20 modelShape:v75 error:a10];
            v56 = v55;
            if (v55)
            {
              if ([v55 integerValue] == 1)
              {

                long long v35 = v63;
                goto LABEL_12;
              }
              v58 = [NSString stringWithFormat:@"Loss size (%@) is different than 1", v56];
              [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a10 errorCode:12 errorMessage:v58 underlyingError:0];

              v54 = v72;
            }

            BOOL v48 = 0;
            id v18 = v76;
            long long v35 = v63;
LABEL_53:
            v38 = v64;
            goto LABEL_54;
          }
          v57 = [NSString stringWithFormat:@"Loss layer is not set as an output of the model (%@)", v72];
          [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a10 errorCode:13 errorMessage:v57 underlyingError:0];
        }
        BOOL v48 = 0;
        id v18 = v76;
        goto LABEL_53;
      }
      v49 = [NSString stringWithFormat:@"Input size (%@) does not match feature vector size (%lu)", v33, v23];
      [(PHAPrivateFederatedLearningModelValidator *)self _generateError:a10 errorCode:10 errorMessage:v49 underlyingError:0];

      id v18 = v76;
      BOOL v48 = 0;
      v50 = v28;
      id v17 = v27;
      id v20 = v26;
      id v21 = v74;
      long long v32 = v33;
      id v19 = v50;
    }
    else
    {
      BOOL v48 = 0;
      id v19 = v28;
      id v17 = v27;
      id v20 = v26;
      id v21 = v74;
    }
LABEL_57:

    v31 = v73;
    goto LABEL_58;
  }
  BOOL v48 = 0;
LABEL_61:

  return v48;
}

- (PHAPrivateFederatedLearningModelValidator)initWithEspressoModelURL:(id)a3 espressoModelShapeURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningModelValidator;
  id v9 = [(PHAPrivateFederatedLearningModelValidator *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_espressoModelURL, a3);
    objc_storeStrong((id *)&v10->_espressoModelShapeURL, a4);
  }

  return v10;
}

@end