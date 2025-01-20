@interface _LTLanguageDetectorFeatureCombinationModel
- (_LTLanguageDetectorFeatureCombinationModel)initWithConfig:(id)a3;
- (id)estimateLanguage:(id)a3 languageDetectionResults:(id)a4 partialSpeechResultConfidences:(id)a5 finalSpeechResults:(id)a6 modelVersions:(id)a7 isLowConfidencePair:(BOOL)a8;
- (id)estimateLanguage:(id)a3 languageDetectionResults:(id)a4 partialSpeechResultConfidences:(id)a5 finalSpeechResults:(id)a6 modelVersions:(id)a7 useFinalThresholds:(BOOL)a8 isLowConfidencePair:(BOOL)a9;
- (id)getAcousticLidConfidenceFromResult:(id)a3 locale:(id)a4;
- (id)getModelFeatures:(id)a3 canonicalPair:(id)a4 partialSpeechResultConfidences:(id)a5 finalSpeechResults:(id)a6 modelVersion:(id)a7;
@end

@implementation _LTLanguageDetectorFeatureCombinationModel

- (_LTLanguageDetectorFeatureCombinationModel)initWithConfig:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_LTLanguageDetectorFeatureCombinationModel;
  v5 = [(_LTLanguageDetectorFeatureCombinationModel *)&v50 init];
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v4];
    v9 = [v8 objectForKey:@"features"];
    v10 = [v8 objectForKey:@"compiledModelFile"];
    uint64_t v11 = [v8 objectForKey:@"modelInput"];
    modelInput = v6->_modelInput;
    v6->_modelInput = (NSString *)v11;

    v13 = [v8 objectForKey:@"modelInputIsMatrix"];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      v16 = _LTOSLogLID();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:].cold.6();
      }
      v6->_modelInputIsMatrix = 0;
    }
    else
    {
      v15 = [v8 valueForKey:@"modelInputIsMatrix"];
      v6->_modelInputIsMatrix = [v15 BOOLValue];
    }
    uint64_t v17 = [v8 objectForKey:@"modelOutput"];
    modelOutput = v6->_modelOutput;
    v6->_modelOutput = (NSString *)v17;

    uint64_t v19 = [v8 objectForKey:@"LanguageLocaleToIdentifier"];
    languageLocaleToIdentifier = v6->_languageLocaleToIdentifier;
    v6->_languageLocaleToIdentifier = (NSDictionary *)v19;

    if (v9 && v10 && v6->_modelInput && v6->_modelOutput)
    {
      uint64_t v21 = [v8 objectForKey:@"missingFeatureValueDefault"];
      missingFeatureValueDefault = v6->_missingFeatureValueDefault;
      v6->_missingFeatureValueDefault = (NSNumber *)v21;

      if (!v6->_missingFeatureValueDefault)
      {
        v6->_missingFeatureValueDefault = (NSNumber *)&unk_270C338C8;

        v23 = _LTOSLogLID();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:].cold.5((uint64_t)&v6->_missingFeatureValueDefault, v23);
        }
      }
      uint64_t v24 = [v8 objectForKey:@"missingLanguageDetectionDefault"];
      missingLanguageDetectorDefault = v6->_missingLanguageDetectorDefault;
      v6->_missingLanguageDetectorDefault = (NSNumber *)v24;

      if (!v6->_missingLanguageDetectorDefault)
      {
        v6->_missingLanguageDetectorDefault = (NSNumber *)&unk_270C33828;

        v26 = _LTOSLogLID();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:].cold.4((uint64_t)&v6->_missingLanguageDetectorDefault, v26);
        }
      }
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      char v49 = 0;
      v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      features = v6->_features;
      v6->_features = v27;

      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __61___LTLanguageDetectorFeatureCombinationModel_initWithConfig___block_invoke;
      v43[3] = &unk_2655470E8;
      v29 = v6;
      v44 = v29;
      v45 = &v46;
      [v9 enumerateObjectsUsingBlock:v43];
      if (*((unsigned char *)v47 + 24))
      {
        v7 = 0;
      }
      else
      {
        v32 = [v4 URLByDeletingLastPathComponent];
        v33 = [v32 URLByAppendingPathComponent:v10];

        id v42 = 0;
        uint64_t v34 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v33 error:&v42];
        id v35 = v42;
        id v36 = v29[1];
        v29[1] = (id)v34;

        if (v35 || !v29[1])
        {
          v37 = (id)_LTOSLogLID();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = [v33 path];
            [(_LTLanguageDetectorFeatureCombinationModel *)v38 initWithConfig:v37];
          }

          v7 = 0;
        }
        else
        {
          v39 = (id)_LTOSLogLID();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v40 = [v29[1] modelDescription];
            v41 = [v40 description];
            -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:](v41, (uint64_t)buf, v39, v40);
          }

          v7 = v29;
        }
      }
      _Block_object_dispose(&v46, 8);
    }
    else
    {
      v30 = _LTOSLogLID();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:]();
      }
      v7 = 0;
    }
  }
  return v7;
}

- (id)getAcousticLidConfidenceFromResult:(id)a3 locale:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = [a3 confidences];
    v8 = [v7 objectForKey:v6];

    missingLanguageDetectorDefault = v8;
    if (!v8) {
      missingLanguageDetectorDefault = self->_missingLanguageDetectorDefault;
    }
    v10 = missingLanguageDetectorDefault;
  }
  else
  {
    v10 = self->_missingLanguageDetectorDefault;
  }
  return v10;
}

- (id)getModelFeatures:(id)a3 canonicalPair:(id)a4 partialSpeechResultConfidences:(id)a5 finalSpeechResults:(id)a6 modelVersion:(id)a7
{
  v60[2] = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v12 = a4;
  id v41 = a5;
  id v13 = a6;
  id v40 = a7;
  LODWORD(a7) = self->_modelInputIsMatrix;
  id v14 = objc_alloc(MEMORY[0x263F00DA8]);
  if (a7)
  {
    v60[0] = &unk_270C338E0;
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_features, "count"));
    v60[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
    uint64_t v57 = 0;
    uint64_t v17 = (void *)[v14 initWithShape:v16 dataType:65600 error:&v57];
    v18 = (id *)&v57;
  }
  else
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_features, "count"));
    v59 = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
    uint64_t v56 = 0;
    uint64_t v17 = (void *)[v14 initWithShape:v16 dataType:65600 error:&v56];
    v18 = (id *)&v56;
  }
  id v19 = *v18;

  if (v19)
  {
    id v20 = 0;
  }
  else
  {
    uint64_t v21 = [v12 sourceLocale];
    v38 = [v41 objectForKeyedSubscript:v21];

    v22 = [v12 targetLocale];
    v23 = [v41 objectForKeyedSubscript:v22];

    uint64_t v24 = [v12 sourceLocale];
    v25 = [v13 objectForKeyedSubscript:v24];

    v26 = [v12 targetLocale];
    v27 = [v13 objectForKeyedSubscript:v26];

    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    char v55 = 0;
    features = self->_features;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke;
    v42[3] = &unk_265547110;
    v42[4] = self;
    id v37 = v25;
    id v43 = v37;
    id v29 = v17;
    id v44 = v29;
    v51 = &v52;
    id v30 = v27;
    id v45 = v30;
    id v46 = v39;
    id v47 = v12;
    id v31 = v38;
    id v48 = v31;
    id v32 = v23;
    id v49 = v32;
    id v50 = v40;
    [(NSMutableArray *)features enumerateObjectsUsingBlock:v42];
    if (*((unsigned char *)v53 + 24))
    {
      v33 = (id)_LTOSLogLID();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = [v29 description];
        -[_LTLanguageDetectorFeatureCombinationModel getModelFeatures:canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:](v34, (uint64_t)v58, v33);
      }

      id v20 = v29;
    }
    else
    {
      id v35 = _LTOSLogLID();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[_LTLanguageDetectorFeatureCombinationModel getModelFeatures:canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:]();
      }
      id v20 = 0;
    }

    _Block_object_dispose(&v52, 8);
  }

  return v20;
}

- (id)estimateLanguage:(id)a3 languageDetectionResults:(id)a4 partialSpeechResultConfidences:(id)a5 finalSpeechResults:(id)a6 modelVersions:(id)a7 useFinalThresholds:(BOOL)a8 isLowConfidencePair:(BOOL)a9
{
  BOOL v91 = a8;
  v120[1] = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = [a3 localePair];
  id v19 = [v18 canonicalLocalePair];

  id v20 = [v19 sourceLocale];
  uint64_t v21 = [v17 objectForKeyedSubscript:v20];
  if (v21) {
    [v19 sourceLocale];
  }
  else {
  v22 = [v19 targetLocale];
  }
  v23 = [v17 objectForKeyedSubscript:v22];

  uint64_t v24 = [v19 sourceLocale];
  v97 = _LTPreferencesLanguageDetectorFeatureCombinationThresholdVersionForASRDataPack(v24, v23);

  v25 = [v19 sourceLocale];
  v26 = [v16 objectForKeyedSubscript:v25];

  v27 = [v19 targetLocale];
  v28 = [v16 objectForKeyedSubscript:v27];

  if (v26 && ([v26 isFinal] & 1) != 0)
  {
    int v89 = 1;
  }
  else if (v28)
  {
    int v89 = [v28 isFinal];
  }
  else
  {
    int v89 = 0;
  }
  id v29 = [(_LTLanguageDetectorFeatureCombinationModel *)self getModelFeatures:v14 canonicalPair:v19 partialSpeechResultConfidences:v15 finalSpeechResults:v16 modelVersion:v23];
  if (v29)
  {
    v92 = v26;
    id v93 = v14;
    id v30 = v17;
    id v31 = v28;
    id v96 = v15;
    id v32 = objc_alloc(MEMORY[0x263F00D38]);
    modelInput = self->_modelInput;
    v120[0] = v29;
    v33 = [NSDictionary dictionaryWithObjects:v120 forKeys:&modelInput count:1];
    id v98 = 0;
    uint64_t v34 = [v32 initWithDictionary:v33 error:&v98];
    id v35 = v98;

    v94 = v35;
    v95 = (void *)v34;
    if (v35)
    {
      id v36 = _LTOSLogLID();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:].cold.5();
      }
      id v37 = 0;
      id v15 = v96;
      v28 = v31;
      id v17 = v30;
      v26 = v92;
      id v14 = v93;
    }
    else
    {
      id v88 = objc_alloc_init(MEMORY[0x263F00DC8]);
      id v39 = -[MLModel predictionFromFeatures:options:error:](self->_mlModel, "predictionFromFeatures:options:error:", v34);
      v86 = v39;
      id v87 = 0;
      if (v87)
      {
        id v40 = _LTOSLogLID();
        id v14 = v93;
        id v15 = v96;
        v28 = v31;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:].cold.4();
        }
        id v37 = 0;
        id v17 = v30;
        v26 = v92;
      }
      else
      {
        id v41 = [v39 featureValueForName:self->_modelOutput];
        id v15 = v96;
        v28 = v31;
        v85 = v41;
        if (!v41) {
          goto LABEL_33;
        }
        id v42 = v41;
        uint64_t v43 = [v41 multiArrayValue];
        if (!v43) {
          goto LABEL_33;
        }
        id v44 = (void *)v43;
        id v45 = [v42 multiArrayValue];
        uint64_t v46 = [v45 count];

        BOOL v47 = v46 == 2;
        id v15 = v96;
        if (v47)
        {
          id v48 = [v42 multiArrayValue];
          id v49 = [v48 objectAtIndexedSubscript:0];

          id v50 = [v42 multiArrayValue];
          v84 = [v50 objectAtIndexedSubscript:1];

          id v17 = v30;
          v83 = v49;
          if (v49 && v84 && ([v49 doubleValue], v51 != INFINITY))
          {
            [v49 doubleValue];
            float v55 = _LTPreferencesLanguageDetectorFeatureCombinationModelThresholdsForLocale(v19, v97, v91);
            uint64_t v56 = [v19 sourceLocale];
            [v49 doubleValue];
            double v57 = v55;
            v26 = v92;
            if (v58 < v55)
            {
              uint64_t v59 = [v19 targetLocale];

              uint64_t v56 = (void *)v59;
            }
            id v60 = objc_alloc(MEMORY[0x263F1C0F8]);
            uint64_t v61 = [v19 oppositeToLocale:v56];
            v62 = v56;
            v63 = (void *)v61;
            v81 = v62;
            v64 = objc_msgSend(v60, "initWithSourceLocale:targetLocale:");

            float v65 = _LTPreferencesLanguageDetectorFeatureCombinationModelConfidenceThresholdsForLocale(v64, v97, v91);
            float v66 = v65;
            v80 = v64;
            if (a9)
            {
              BOOL v82 = 0;
              v67 = v49;
            }
            else
            {
              double v68 = v65;
              v67 = v49;
              [v49 doubleValue];
              BOOL v82 = vabdd_f64(v57, v69) >= v68;
            }
            v70 = [v19 sourceLocale];
            v117[0] = v70;
            v118[0] = v67;
            v71 = [v19 targetLocale];
            v117[1] = v71;
            v118[1] = v84;
            v90 = [NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:2];

            v72 = _LTOSLogLID();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              v73 = v72;
              v74 = [v81 _ltLocaleIdentifier];
              v79 = [v90 objectForKeyedSubscript:v81];
              [v79 doubleValue];
              uint64_t v76 = v75;
              v78 = [v19 sourceLocale];
              *(_DWORD *)buf = 138545410;
              v77 = @"1.0-";
              v100 = v97;
              if (v81 == v78) {
                v77 = &stru_270C008E8;
              }
              __int16 v101 = 1024;
              BOOL v102 = v91;
              __int16 v103 = 1024;
              int v104 = v89;
              __int16 v105 = 2114;
              v106 = v74;
              __int16 v107 = 2048;
              uint64_t v108 = v76;
              __int16 v109 = 2114;
              v110 = v77;
              __int16 v111 = 2048;
              double v112 = v57;
              __int16 v113 = 2048;
              double v114 = v66;
              __int16 v115 = 1024;
              BOOL v116 = v82;
              _os_log_debug_impl(&dword_2600DC000, v73, OS_LOG_TYPE_DEBUG, "Queried LID threshold version '%{public}@'; useFinalThresholds: %{BOOL}i; isFinalASR: %{BOOL}i; detected"
                " %{public}@, with score %f using discriminator threshold %{public}@%f and confidence offset %f (confident: %{BOOL}i)",
                buf,
                0x50u);
            }
            id v37 = (void *)[objc_alloc(MEMORY[0x263F1C0D0]) initWithConfidences:v90 isConfident:v82 dominantLanguage:v81 isFinal:1];

            id v14 = v93;
            id v15 = v96;
          }
          else
          {
            uint64_t v52 = _LTOSLogLID();
            v26 = v92;
            id v14 = v93;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
              -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:]();
            }
            id v37 = 0;
          }
        }
        else
        {
LABEL_33:
          v53 = _LTOSLogLID();
          id v17 = v30;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
            -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:]();
          }
          id v37 = 0;
          v26 = v92;
          id v14 = v93;
        }
      }
    }
  }
  else
  {
    v38 = _LTOSLogLID();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:]();
    }
    id v37 = 0;
  }

  return v37;
}

- (id)estimateLanguage:(id)a3 languageDetectionResults:(id)a4 partialSpeechResultConfidences:(id)a5 finalSpeechResults:(id)a6 modelVersions:(id)a7 isLowConfidencePair:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = [v13 localePair];
  id v19 = [v18 canonicalLocalePair];

  id v20 = [v19 sourceLocale];
  uint64_t v21 = [v16 objectForKeyedSubscript:v20];

  v22 = [v19 targetLocale];
  v23 = [v16 objectForKeyedSubscript:v22];

  if (v21 && ([v21 isFinal] & 1) != 0)
  {
    uint64_t v24 = 1;
  }
  else if (v23)
  {
    uint64_t v24 = [v23 isFinal];
  }
  else
  {
    uint64_t v24 = 0;
  }
  LOBYTE(v27) = a8;
  v25 = [(_LTLanguageDetectorFeatureCombinationModel *)self estimateLanguage:v13 languageDetectionResults:v14 partialSpeechResultConfidences:v15 finalSpeechResults:v16 modelVersions:v17 useFinalThresholds:v24 isLowConfidencePair:v27];

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageLocaleToIdentifier, 0);
  objc_storeStrong((id *)&self->_missingLanguageDetectorDefault, 0);
  objc_storeStrong((id *)&self->_missingFeatureValueDefault, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_modelOutput, 0);
  objc_storeStrong((id *)&self->_modelInput, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Missing necessary configuration values", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Unable to load CoreML model from path: %@", buf, 0xCu);
}

- (void)initWithConfig:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_4(&dword_2600DC000, a3, (uint64_t)a3, "CoreML model loaded: %@", (uint8_t *)a2);
}

- (void)initWithConfig:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  uint64_t v3 = OUTLINED_FUNCTION_10(a1, a2);
  [v2 floatValue];
  OUTLINED_FUNCTION_1_7(v4);
  OUTLINED_FUNCTION_2_4(&dword_2600DC000, v3, v5, "Setting default value for missing language detector result to %f", v6);
}

- (void)initWithConfig:(uint64_t)a1 .cold.5(uint64_t a1, void *a2)
{
  uint64_t v3 = OUTLINED_FUNCTION_10(a1, a2);
  [v2 floatValue];
  OUTLINED_FUNCTION_1_7(v4);
  OUTLINED_FUNCTION_2_4(&dword_2600DC000, v3, v5, "Setting default value for missing feature value to %f", v6);
}

- (void)initWithConfig:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2600DC000, v0, OS_LOG_TYPE_DEBUG, "Setting default value for input is matrix to NO", v1, 2u);
}

- (void)getModelFeatures:canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2600DC000, v0, OS_LOG_TYPE_DEBUG, "Discarded CoreML features, as all values were defaults", v1, 2u);
}

- (void)getModelFeatures:(NSObject *)a3 canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_4(&dword_2600DC000, a3, (uint64_t)a3, "Created CoreML features: %@", (uint8_t *)a2);
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unable to compile CoreML input features", v2, v3, v4, v5, v6);
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Was unable to extract CoreML prediction", v2, v3, v4, v5, v6);
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Was unable to extract posterior values from prediction results", v2, v3, v4, v5, v6);
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unable to perform inference on CoreML model", v2, v3, v4, v5, v6);
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unable to construct CoreML feature provider", v2, v3, v4, v5, v6);
}

@end