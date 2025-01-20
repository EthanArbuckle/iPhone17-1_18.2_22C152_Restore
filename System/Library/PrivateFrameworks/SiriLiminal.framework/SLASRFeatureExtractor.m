@interface SLASRFeatureExtractor
+ (id)_getLastTokenForPath:(id)a3 fromPhrases:(id)a4;
+ (id)_getTokenConfidenceForPath:(id)a3 fromPhrases:(id)a4;
+ (id)extractASRFaturesFrom:(id)a3;
+ (id)extractLRNNFaturesFrom:(id)a3;
+ (id)getBestSpeechRecognitionTextFromPackage:(id)a3;
@end

@implementation SLASRFeatureExtractor

+ (id)extractLRNNFaturesFrom:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    v6 = "+[SLASRFeatureExtractor extractLRNNFaturesFrom:]";
    _os_log_error_impl(&dword_21EFF4000, v3, OS_LOG_TYPE_ERROR, "%s Unimplemented method called", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

+ (id)getBestSpeechRecognitionTextFromPackage:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v31 = a3;
  v3 = [v31 recognition];
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  int v5 = [v3 utterances];
  v6 = [v5 firstObject];

  v30 = v3;
  uint64_t v7 = [v3 phrases];
  id v8 = 0;
  if ([v7 count])
  {
    unint64_t v9 = 0;
    v32 = v7;
    v33 = v6;
    do
    {
      v10 = [v6 interpretationIndices];
      unint64_t v11 = [v10 count];

      if (v9 >= v11) {
        break;
      }
      v12 = [v7 objectAtIndex:v9];
      v13 = [v6 interpretationIndices];
      v14 = [v13 objectAtIndex:v9];
      unint64_t v15 = [v14 unsignedIntegerValue];

      v16 = [v12 interpretations];
      unint64_t v17 = [v16 count];

      if (v15 >= v17)
      {

        v28 = &stru_26D09E668;
        goto LABEL_19;
      }
      v35 = v12;
      v18 = [v12 interpretations];
      v19 = [v18 objectAtIndex:v15];

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v34 = v19;
      v20 = [v19 tokens];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            v25 = v8;
            if (*(void *)v37 != v23) {
              objc_enumerationMutation(v20);
            }
            v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (([v26 removeSpaceBefore] & 1) == 0
              && ([v25 removeSpaceAfter] & 1) == 0
              && v25)
            {
              [v4 appendString:@" "];
            }
            v27 = [v26 text];
            [v4 appendString:v27];
            id v8 = v26;
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v22);
      }

      ++v9;
      uint64_t v7 = v32;
      v6 = v33;
    }
    while (v9 < [v32 count]);
  }
  v28 = (__CFString *)v4;
LABEL_19:

  return v28;
}

+ (id)_getTokenConfidenceForPath:(id)a3 fromPhrases:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = [MEMORY[0x263EFF980] array];
  unint64_t v9 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    unint64_t v11 = [v5 dictionaryRepresentation];
    *(_DWORD *)buf = 136315394;
    v24 = "+[SLASRFeatureExtractor _getTokenConfidenceForPath:fromPhrases:]";
    __int16 v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_21EFF4000, v10, OS_LOG_TYPE_INFO, "%s Constructing tokens for speech path %{public}@", buf, 0x16u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __64__SLASRFeatureExtractor__getTokenConfidenceForPath_fromPhrases___block_invoke;
  v20[3] = &unk_2644FFE48;
  id v21 = v5;
  id v22 = v8;
  id v12 = v8;
  id v13 = v5;
  [v6 enumerateObjectsUsingBlock:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__SLASRFeatureExtractor__getTokenConfidenceForPath_fromPhrases___block_invoke_2;
  v18[3] = &unk_2644FFE70;
  id v14 = v7;
  id v19 = v14;
  [v12 enumerateObjectsUsingBlock:v18];
  unint64_t v15 = v19;
  id v16 = v14;

  return v16;
}

void __64__SLASRFeatureExtractor__getTokenConfidenceForPath_fromPhrases___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 interpretationIndices];
  id v8 = [v7 objectAtIndexedSubscript:a3];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [v6 interpretations];

  unint64_t v11 = [v10 objectAtIndexedSubscript:v9];
  id v13 = [v11 tokens];

  id v12 = v13;
  if (v13)
  {
    [*(id *)(a1 + 40) addObjectsFromArray:v13];
    id v12 = v13;
  }
}

void __64__SLASRFeatureExtractor__getTokenConfidenceForPath_fromPhrases___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "confidenceScore"));
  [*(id *)(a1 + 32) addObject:v4];
  id v5 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = [v3 confidenceScore];
    id v8 = [v3 text];
    int v9 = 136315650;
    v10 = "+[SLASRFeatureExtractor _getTokenConfidenceForPath:fromPhrases:]_block_invoke_2";
    __int16 v11 = 2050;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_21EFF4000, v6, OS_LOG_TYPE_INFO, "%s Adding score %{public}ld for token %@", (uint8_t *)&v9, 0x20u);
  }
}

+ (id)_getLastTokenForPath:(id)a3 fromPhrases:(id)a4
{
  id v5 = a4;
  id v6 = [a3 interpretationIndices];
  uint64_t v7 = [v6 lastObject];
  uint64_t v8 = [v7 unsignedIntegerValue];

  int v9 = [v5 lastObject];

  v10 = [v9 interpretations];
  __int16 v11 = [v10 objectAtIndex:v8];

  uint64_t v12 = [v11 tokens];
  __int16 v13 = [v12 firstObject];

  return v13;
}

+ (id)extractASRFaturesFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(SLASRFeatures);
  if (v4)
  {
    id v6 = [v4 recognition];
    uint64_t v7 = [v6 utterances];
    unint64_t v8 = [v7 count];

    if (v8 >= 0xB) {
      uint64_t v9 = 11;
    }
    else {
      uint64_t v9 = v8;
    }
    v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v9];
    __int16 v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v9];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v9];
    __int16 v13 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v9];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__212;
    v47 = __Block_byref_object_dispose__213;
    id v48 = 0;
    uint64_t v38 = 0;
    long long v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = __Block_byref_object_copy__212;
    v42 = __Block_byref_object_dispose__213;
    id v43 = 0;
    uint64_t v27 = [v6 utterances];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __47__SLASRFeatureExtractor_extractASRFaturesFrom___block_invoke;
    v28[3] = &unk_2644FFE20;
    id v36 = a1;
    id v14 = v6;
    id v29 = v14;
    id v15 = v10;
    id v30 = v15;
    id v16 = v11;
    id v31 = v16;
    id v17 = v12;
    id v32 = v17;
    id v18 = v13;
    int v37 = -8388608;
    id v33 = v18;
    p_long long buf = &buf;
    v35 = &v38;
    [v27 enumerateObjectsUsingBlock:v28];
    [(SLASRFeatures *)v5 setLatticePathMaxScores:v15];
    [(SLASRFeatures *)v5 setLatticePathMeanScores:v17];
    [(SLASRFeatures *)v5 setLatticePathMinScores:v16];
    [(SLASRFeatures *)v5 setLatticePathVarScores:v18];
    [(SLASRFeatures *)v5 setTopLatticePathScores:*(void *)(*((void *)&buf + 1) + 40)];
    -[SLASRFeatures setTopLatticePathTokenCount:](v5, "setTopLatticePathTokenCount:", [*(id *)(*((void *)&buf + 1) + 40) count]);
    id v19 = [v4 audioAnalytics];
    [v19 snr];
    *(float *)&double v20 = v20;
    [(SLASRFeatures *)v5 setSnr:v20];

    [(id)v39[5] endTime];
    double v22 = v21;
    [(id)v39[5] silenceStartTime];
    double v24 = v22 - v23;
    *(float *)&double v24 = v24;
    [(SLASRFeatures *)v5 setTrailingSilence:v24];

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    __int16 v25 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[SLASRFeatureExtractor extractASRFaturesFrom:]";
      _os_log_error_impl(&dword_21EFF4000, v25, OS_LOG_TYPE_ERROR, "%s Received nil recog candidate, nothing to extract", (uint8_t *)&buf, 0xCu);
    }
  }

  return v5;
}

void __47__SLASRFeatureExtractor_extractASRFaturesFrom___block_invoke(uint64_t a1, void *a2)
{
  id v32 = a2;
  id v3 = *(void **)(a1 + 88);
  id v4 = [*(id *)(a1 + 32) phrases];
  uint64_t v5 = [v3 _getTokenConfidenceForPath:v32 fromPhrases:v4];

  id v6 = (void *)MEMORY[0x263EFF8C0];
  id obj = (id)v5;
  uint64_t v7 = [MEMORY[0x263F087F0] expressionForConstantValue:v5];
  unint64_t v8 = [v6 arrayWithObject:v7];

  uint64_t v9 = [MEMORY[0x263F087F0] expressionForFunction:@"max:" arguments:v8];
  v10 = [MEMORY[0x263F087F0] expressionForFunction:@"min:" arguments:v8];
  __int16 v11 = [MEMORY[0x263F087F0] expressionForFunction:@"stddev:" arguments:v8];
  uint64_t v12 = [MEMORY[0x263F087F0] expressionForFunction:@"average:" arguments:v8];
  id v30 = v9;
  __int16 v13 = [v9 expressionValueWithObject:0 context:0];
  if (v13) {
    [*(id *)(a1 + 40) addObject:v13];
  }
  id v14 = objc_msgSend(v10, "expressionValueWithObject:context:", 0, 0, v10);
  if (v14) {
    [*(id *)(a1 + 48) addObject:v14];
  }
  id v15 = [v12 expressionValueWithObject:0 context:0];
  if (v15) {
    [*(id *)(a1 + 56) addObject:v15];
  }
  id v16 = [v11 expressionValueWithObject:0 context:0];
  id v17 = v16;
  if (v16)
  {
    id v18 = NSNumber;
    [v16 doubleValue];
    double v20 = v19;
    [v17 doubleValue];
    double v22 = [v18 numberWithDouble:v20 * v21];
    [*(id *)(a1 + 64) addObject:v22];
  }
  [v15 floatValue];
  if (v23 > *(float *)(a1 + 96))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), obj);
    double v24 = *(void **)(a1 + 88);
    __int16 v25 = [*(id *)(a1 + 32) phrases];
    uint64_t v26 = [v24 _getLastTokenForPath:v32 fromPhrases:v25];
    uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
}

@end