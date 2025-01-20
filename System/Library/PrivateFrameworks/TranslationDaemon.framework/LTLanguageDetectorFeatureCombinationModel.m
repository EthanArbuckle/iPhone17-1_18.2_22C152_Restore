@interface LTLanguageDetectorFeatureCombinationModel
@end

@implementation LTLanguageDetectorFeatureCombinationModel

void __61___LTLanguageDetectorFeatureCombinationModel_initWithConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t ModelFeature = getModelFeature(v3);
  if (ModelFeature > 0x13)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v7 = _LTOSLogLID();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61___LTLanguageDetectorFeatureCombinationModel_initWithConfig___block_invoke_cold_1((uint64_t)v3, v7);
    }
  }
  else
  {
    v5 = *(void **)(*(void *)(a1 + 32) + 40);
    v6 = [NSNumber numberWithUnsignedInt:ModelFeature];
    [v5 addObject:v6];
  }
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = *(id *)(*(void *)(a1 + 32) + 48);
  switch([a2 integerValue])
  {
    case 0:
      v7 = *(void **)(a1 + 40);
      if (v7)
      {
        v8 = NSNumber;
        v9 = [v7 bestTranscription];
        [v9 minConfidence];
        objc_msgSend(v8, "numberWithDouble:");
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        id v6 = v9;
      }
      else
      {
        id v10 = *(id *)(*(void *)(a1 + 32) + 48);
      }

      v70 = _LTOSLogLID();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_1(v70);
      }
      goto LABEL_98;
    case 1:
      v11 = *(void **)(a1 + 40);
      if (v11)
      {
        v12 = NSNumber;
        v13 = [v11 bestTranscription];
        [v13 maxConfidence];
        objc_msgSend(v12, "numberWithDouble:");
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        id v6 = v13;
      }
      else
      {
        id v10 = *(id *)(*(void *)(a1 + 32) + 48);
      }

      v71 = _LTOSLogLID();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_2(v71);
      }
      goto LABEL_98;
    case 2:
      v14 = *(void **)(a1 + 40);
      if (v14)
      {
        v15 = NSNumber;
        v16 = [v14 bestTranscription];
        [v16 confidence];
        objc_msgSend(v15, "numberWithDouble:");
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        id v6 = v16;
      }
      else
      {
        id v10 = *(id *)(*(void *)(a1 + 32) + 48);
      }

      v72 = _LTOSLogLID();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_3(v72);
      }
      goto LABEL_98;
    case 3:
      if (*(void *)(a1 + 40))
      {
        v17 = NSNumber;
        v18 = [*(id *)(a1 + 56) bestTranscription];
        [v18 minConfidence];
        objc_msgSend(v17, "numberWithDouble:");
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        id v6 = v18;
      }
      else
      {
        id v10 = *(id *)(*(void *)(a1 + 32) + 48);
      }

      v73 = _LTOSLogLID();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_4(v73);
      }
      goto LABEL_98;
    case 4:
      if (*(void *)(a1 + 40))
      {
        v19 = NSNumber;
        v20 = [*(id *)(a1 + 56) bestTranscription];
        [v20 maxConfidence];
        objc_msgSend(v19, "numberWithDouble:");
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        id v6 = v20;
      }
      else
      {
        id v10 = *(id *)(*(void *)(a1 + 32) + 48);
      }

      v74 = _LTOSLogLID();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_5(v74);
      }
      goto LABEL_98;
    case 5:
      if (*(void *)(a1 + 40))
      {
        v21 = NSNumber;
        v22 = [*(id *)(a1 + 56) bestTranscription];
        [v22 confidence];
        objc_msgSend(v21, "numberWithDouble:");
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        id v6 = v22;
      }
      else
      {
        id v10 = *(id *)(*(void *)(a1 + 32) + 48);
      }

      v75 = _LTOSLogLID();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_6(v75);
      }
      goto LABEL_98;
    case 6:
      v23 = *(void **)(a1 + 32);
      uint64_t v24 = [*(id *)(a1 + 64) count];
      if (v24)
      {
        v25 = [*(id *)(a1 + 64) lastObject];
      }
      else
      {
        v25 = 0;
      }
      v77 = [*(id *)(a1 + 72) sourceLocale];
      id v10 = [v23 getAcousticLidConfidenceFromResult:v25 locale:v77];

      if (v24) {
      v78 = _LTOSLogLID();
      }
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_7(v78);
      }
      goto LABEL_110;
    case 7:
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 64), "count"));
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      v26 = _LTOSLogLID();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_8(v26, v10);
      }
      [*(id *)(a1 + 48) setObject:v10 atIndexedSubscript:a3];
      uint64_t v27 = *(void *)(*(void *)(a1 + 104) + 8);
      if (*(unsigned char *)(v27 + 24)) {
        goto LABEL_111;
      }
      BOOL v28 = [*(id *)(a1 + 64) count] != 0;
      uint64_t v27 = *(void *)(*(void *)(a1 + 104) + 8);
      goto LABEL_114;
    case 8:
      v29 = *(void **)(a1 + 32);
      uint64_t v30 = [*(id *)(a1 + 64) count];
      if (v30)
      {
        v31 = [*(id *)(a1 + 64) objectAtIndex:0];
      }
      else
      {
        v31 = 0;
      }
      v79 = [*(id *)(a1 + 72) sourceLocale];
      id v10 = [v29 getAcousticLidConfidenceFromResult:v31 locale:v79];

      if (v30) {
      v80 = _LTOSLogLID();
      }
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_9(v80);
      }
      goto LABEL_110;
    case 9:
      v32 = *(void **)(a1 + 32);
      unint64_t v33 = [*(id *)(a1 + 64) count];
      if (v33 < 2)
      {
        v34 = 0;
      }
      else
      {
        v34 = [*(id *)(a1 + 64) objectAtIndex:1];
      }
      v66 = [*(id *)(a1 + 72) sourceLocale];
      id v10 = [v32 getAcousticLidConfidenceFromResult:v34 locale:v66];

      if (v33 >= 2) {
      v67 = _LTOSLogLID();
      }
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_10(v67);
      }
      goto LABEL_110;
    case 10:
      v35 = *(void **)(a1 + 32);
      unint64_t v36 = [*(id *)(a1 + 64) count];
      if (v36 < 3)
      {
        v37 = 0;
      }
      else
      {
        v37 = [*(id *)(a1 + 64) objectAtIndex:2];
      }
      v68 = [*(id *)(a1 + 72) sourceLocale];
      id v10 = [v35 getAcousticLidConfidenceFromResult:v37 locale:v68];

      if (v36 >= 3) {
      v69 = _LTOSLogLID();
      }
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_11(v69);
      }
LABEL_110:
      [*(id *)(a1 + 48) setObject:v10 atIndexedSubscript:a3];
      uint64_t v27 = *(void *)(*(void *)(a1 + 104) + 8);
      if (*(unsigned char *)(v27 + 24)) {
        goto LABEL_111;
      }
      id v76 = *(id *)(*(void *)(a1 + 32) + 56);
      goto LABEL_113;
    case 11:
      v38 = *(void **)(a1 + 80);
      if (v38 && [v38 count])
      {
        id v39 = [*(id *)(a1 + 80) lastObject];
      }
      else
      {
        id v39 = *(id *)(*(void *)(a1 + 32) + 48);
      }
      id v10 = v39;

      v60 = _LTOSLogLID();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_12(v60);
      }
      goto LABEL_98;
    case 12:
      v40 = *(void **)(a1 + 80);
      if (v40 && [v40 count])
      {
        id v41 = [*(id *)(a1 + 80) valueForKeyPath:@"@max.doubleValue"];
      }
      else
      {
        id v41 = *(id *)(*(void *)(a1 + 32) + 48);
      }
      id v10 = v41;

      v61 = _LTOSLogLID();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_13(v61);
      }
      goto LABEL_98;
    case 13:
      v42 = *(void **)(a1 + 80);
      if (v42 && [v42 count])
      {
        id v43 = [*(id *)(a1 + 80) valueForKeyPath:@"@avg.doubleValue"];
      }
      else
      {
        id v43 = *(id *)(*(void *)(a1 + 32) + 48);
      }
      id v10 = v43;

      v62 = _LTOSLogLID();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_14(v62);
      }
      goto LABEL_98;
    case 14:
      v44 = *(void **)(a1 + 88);
      if (v44 && [v44 count])
      {
        id v45 = [*(id *)(a1 + 88) lastObject];
      }
      else
      {
        id v45 = *(id *)(*(void *)(a1 + 32) + 48);
      }
      id v10 = v45;

      v63 = _LTOSLogLID();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_15(v63);
      }
      goto LABEL_98;
    case 15:
      v46 = *(void **)(a1 + 88);
      if (v46 && [v46 count])
      {
        id v47 = [*(id *)(a1 + 88) valueForKeyPath:@"@max.doubleValue"];
      }
      else
      {
        id v47 = *(id *)(*(void *)(a1 + 32) + 48);
      }
      id v10 = v47;

      v64 = _LTOSLogLID();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_16(v64);
      }
      goto LABEL_98;
    case 16:
      v48 = *(void **)(a1 + 88);
      if (v48 && [v48 count])
      {
        id v49 = [*(id *)(a1 + 88) valueForKeyPath:@"@avg.doubleValue"];
      }
      else
      {
        id v49 = *(id *)(*(void *)(a1 + 32) + 48);
      }
      id v10 = v49;

      v65 = _LTOSLogLID();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_17(v65);
      }
LABEL_98:
      [*(id *)(a1 + 48) setObject:v10 atIndexedSubscript:a3];
      uint64_t v27 = *(void *)(*(void *)(a1 + 104) + 8);
      if (*(unsigned char *)(v27 + 24))
      {
LABEL_111:
        BOOL v28 = 1;
      }
      else
      {
        id v76 = *(id *)(*(void *)(a1 + 32) + 48);
LABEL_113:
        BOOL v28 = v10 != v76;
      }
LABEL_114:
      *(unsigned char *)(v27 + 24) = v28;
      break;
    case 17:
      v50 = *(void **)(*(void *)(a1 + 32) + 64);
      v51 = [*(id *)(a1 + 72) sourceLocale];
      v52 = [v51 localeIdentifier];
      id v10 = [v50 objectForKeyedSubscript:v52];

      v53 = _LTOSLogLID();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_18(a1 + 72, v53, v10);
      }
      goto LABEL_51;
    case 18:
      v54 = *(void **)(*(void *)(a1 + 32) + 64);
      v55 = [*(id *)(a1 + 72) targetLocale];
      v56 = [v55 localeIdentifier];
      id v10 = [v54 objectForKeyedSubscript:v56];

      v57 = _LTOSLogLID();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_19(a1 + 72, v57, v10);
      }
      goto LABEL_51;
    case 19:
      v58 = [*(id *)(a1 + 72) sourceLocale];
      _LTPreferencesLanguageDetectorFeatureCombinationASRTypeIdentifierForASRDataPack(v58, *(void **)(a1 + 96));
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      v59 = _LTOSLogLID();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_20((uint64_t *)(a1 + 96), v59);
      }
LABEL_51:
      [*(id *)(a1 + 48) setObject:v10 atIndexedSubscript:a3];
      break;
    default:
      id v10 = v6;
      break;
  }
}

void __61___LTLanguageDetectorFeatureCombinationModel_initWithConfig___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Unknown feature in model file: %@", (uint8_t *)&v2, 0xCu);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Min confidence source: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_2(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Max confidence source: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_3(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Average confidence source: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_4(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Min confidence target: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_5(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Max confidence target: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_6(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Average confidence target: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_7(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v3, v4, "Acoustic LID: %f", v5, v6, v7, v8, v9);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_8(void *a1, void *a2)
{
  id v3 = a1;
  [a2 integerValue];
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Acoustic LID count: %zd", v6, v7, v8, v9, 0);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_9(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v3, v4, "Acoustic LID0: %f", v5, v6, v7, v8, v9);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_10(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v3, v4, "Acoustic LID1: %f", v5, v6, v7, v8, v9);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_11(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v3, v4, "Acoustic LID2: %f", v5, v6, v7, v8, v9);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_12(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Most recent partial confidence source: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_13(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Max partial confidence source: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_14(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Average partial confidence source: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_15(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Most recent partial confidence target: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_16(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Max partial confidence target: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_17(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_7(v3);
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Average partial confidence target: %f", v6, v7, v8, v9, v10);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = OUTLINED_FUNCTION_10(a1, a2);
  uint64_t v6 = [v3 sourceLocale];
  uint64_t v7 = [v6 localeIdentifier];
  [a3 floatValue];
  OUTLINED_FUNCTION_7(v8);
  OUTLINED_FUNCTION_1_4(&dword_2600DC000, v9, v10, "Language %{public}@ locale identifier source: %f", v11, v12, v13, v14, v15);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_19(uint64_t a1, void *a2, void *a3)
{
  id v5 = OUTLINED_FUNCTION_10(a1, a2);
  uint64_t v6 = [v3 targetLocale];
  uint64_t v7 = [v6 localeIdentifier];
  [a3 floatValue];
  OUTLINED_FUNCTION_7(v8);
  OUTLINED_FUNCTION_1_4(&dword_2600DC000, v9, v10, "Language %{public}@ locale identifier source: %f", v11, v12, v13, v14, v15);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_20(uint64_t *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  id v4 = a2;
  OUTLINED_FUNCTION_4_2();
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  double v9 = v5;
  _os_log_debug_impl(&dword_2600DC000, v2, OS_LOG_TYPE_DEBUG, "ASR-type identifier for model version=%{public}@ -> feature: %f", (uint8_t *)&v6, 0x16u);
}

@end