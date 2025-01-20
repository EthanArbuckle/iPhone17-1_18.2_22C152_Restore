@interface VKCTextElementProcessor
+ (id)dataDetectorElementFromVNBarcodeObservation:(id)a3 loggingIndex:(int64_t)a4;
+ (id)dataDetectorsFromCRDocumentOutputRegion:(id)a3 shouldFilter:(BOOL)a4;
+ (id)textElementsFromCRDocumentOutputRegion:(id)a3;
+ (void)addGroupingToDataDetectors:(id)a3 parentDocument:(id)a4;
@end

@implementation VKCTextElementProcessor

+ (id)textElementsFromCRDocumentOutputRegion:(id)a3
{
  id v3 = a3;
  v4 = [v3 contentsWithTypes:8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__VKCTextElementProcessor_textElementsFromCRDocumentOutputRegion___block_invoke;
  v10[3] = &unk_1E6BF1630;
  id v11 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "vk_compactMap:", v10);
  v7 = v6;
  if (!v6) {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v6;

  return v8;
}

id __66__VKCTextElementProcessor_textElementsFromCRDocumentOutputRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VKCTextElement textElementFromCROutputRegion:a2 parentDocument:*(void *)(a1 + 32)];
}

+ (id)dataDetectorsFromCRDocumentOutputRegion:(id)a3 shouldFilter:(BOOL)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1C9C8] now];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v9 = (void *)getDDDetectionControllerClass_softClass;
  uint64_t v30 = getDDDetectionControllerClass_softClass;
  if (!getDDDetectionControllerClass_softClass)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __getDDDetectionControllerClass_block_invoke;
    v26[3] = &unk_1E6BF0A90;
    v26[4] = &v27;
    __getDDDetectionControllerClass_block_invoke((uint64_t)v26);
    v9 = (void *)v28[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v27, 8);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __80__VKCTextElementProcessor_dataDetectorsFromCRDocumentOutputRegion_shouldFilter___block_invoke;
  v20 = &unk_1E6BF1658;
  BOOL v25 = a4;
  id v24 = v10;
  id v21 = v7;
  id v11 = v8;
  id v22 = v11;
  id v12 = v6;
  id v23 = v12;
  id v13 = v7;
  [v12 enumerateContentsWithTypes:2048 usingBlock:&v17];
  if (vk_supportsContextAwareDataDetectors()) {
    objc_msgSend(a1, "addGroupingToDataDetectors:parentDocument:", v11, v12, v17, v18, v19, v20, v21, v22);
  }
  v14 = v23;
  id v15 = v11;

  return v15;
}

void __80__VKCTextElementProcessor_dataDetectorsFromCRDocumentOutputRegion_shouldFilter___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = VKDynamicCast(v4, (uint64_t)v3);

  if (!*(unsigned char *)(a1 + 64)) {
    goto LABEL_4;
  }
  id v6 = [v5 ddResult];

  if (!v6) {
    goto LABEL_4;
  }
  v7 = *(void **)(a1 + 56);
  id v8 = [v5 ddResult];
  v14[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [v7 filterResults:v9 forTypes:0xFFFFLL referenceDate:*(void *)(a1 + 32) referenceTimeZone:0];
  uint64_t v11 = [v10 count];

  if (v11)
  {
LABEL_4:
    id v12 = *(void **)(a1 + 40);
    id v13 = +[VKCTextDataDetectorElement dataDetectorElementFromCROutputRegion:v5 parentDocument:*(void *)(a1 + 48)];
    [v12 addObject:v13];
  }
}

+ (void)addGroupingToDataDetectors:(id)a3 parentDocument:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E10]);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  id v8 = (id *)getkDataDetectorsGroupAllResultsKeySymbolLoc_ptr;
  uint64_t v45 = getkDataDetectorsGroupAllResultsKeySymbolLoc_ptr;
  if (!getkDataDetectorsGroupAllResultsKeySymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getkDataDetectorsGroupAllResultsKeySymbolLoc_block_invoke;
    v40 = &unk_1E6BF0A90;
    v41 = &v42;
    v9 = (void *)DataDetectorsUILibrary_0();
    v43[3] = (uint64_t)dlsym(v9, "kDataDetectorsGroupAllResultsKey");
    getkDataDetectorsGroupAllResultsKeySymbolLoc_ptr = *(void *)(v41[1] + 24);
    id v8 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v8)
  {
    getkDDRVInteractionDidFinishNotification_cold_1();
LABEL_15:
    getkDDRVInteractionDidFinishNotification_cold_1();
LABEL_16:
    getkDDRVInteractionDidFinishNotification_cold_1();
    goto LABEL_17;
  }
  id v10 = *v8;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v11 = (id *)getkDataDetectorsGroupTranscriptKeySymbolLoc_ptr;
  uint64_t v45 = getkDataDetectorsGroupTranscriptKeySymbolLoc_ptr;
  if (!getkDataDetectorsGroupTranscriptKeySymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getkDataDetectorsGroupTranscriptKeySymbolLoc_block_invoke;
    v40 = &unk_1E6BF0A90;
    v41 = &v42;
    id v12 = (void *)DataDetectorsUILibrary_0();
    v43[3] = (uint64_t)dlsym(v12, "kDataDetectorsGroupTranscriptKey");
    getkDataDetectorsGroupTranscriptKeySymbolLoc_ptr = *(void *)(v41[1] + 24);
    uint64_t v11 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v11) {
    goto LABEL_15;
  }
  id v13 = *v11;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  v14 = (id *)getkDataDetectorsGroupCategoryKeySymbolLoc_ptr;
  uint64_t v45 = getkDataDetectorsGroupCategoryKeySymbolLoc_ptr;
  if (!getkDataDetectorsGroupCategoryKeySymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getkDataDetectorsGroupCategoryKeySymbolLoc_block_invoke;
    v40 = &unk_1E6BF0A90;
    v41 = &v42;
    id v15 = (void *)DataDetectorsUILibrary_0();
    v43[3] = (uint64_t)dlsym(v15, "kDataDetectorsGroupCategoryKey");
    getkDataDetectorsGroupCategoryKeySymbolLoc_ptr = *(void *)(v41[1] + 24);
    v14 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v14) {
    goto LABEL_16;
  }
  id v16 = *v14;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v17 = (id *)getkDataDetectorsDocumentLanguageKeySymbolLoc_ptr;
  uint64_t v45 = getkDataDetectorsDocumentLanguageKeySymbolLoc_ptr;
  if (!getkDataDetectorsDocumentLanguageKeySymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getkDataDetectorsDocumentLanguageKeySymbolLoc_block_invoke;
    v40 = &unk_1E6BF0A90;
    v41 = &v42;
    uint64_t v18 = (void *)DataDetectorsUILibrary_0();
    v43[3] = (uint64_t)dlsym(v18, "kDataDetectorsDocumentLanguageKey");
    getkDataDetectorsDocumentLanguageKeySymbolLoc_ptr = *(void *)(v41[1] + 24);
    uint64_t v17 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v17)
  {
LABEL_17:
    uint64_t v27 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v42, 8);
    _Unwind_Resume(v27);
  }
  id v19 = *v17;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke;
  v30[3] = &unk_1E6BF16C8;
  id v31 = v10;
  id v32 = v13;
  id v33 = v16;
  id v34 = v6;
  id v35 = v19;
  id v20 = v7;
  id v36 = v20;
  id v21 = v19;
  id v22 = v6;
  id v23 = v16;
  id v24 = v13;
  id v25 = v10;
  [v22 enumerateContentsWithTypes:4096 usingBlock:v30];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_4;
  v28[3] = &unk_1E6BF16F0;
  id v29 = v20;
  id v26 = v20;
  [v5 enumerateObjectsUsingBlock:v28];
}

void __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = VKDynamicCast(v4, (uint64_t)v3);
  id v6 = [v5 dataDetectorsOutputRegions];
  id v7 = objc_msgSend(v6, "vk_compactMap:", &__block_literal_global_5);

  id v8 = [v3 text];

  uint64_t v9 = [v5 groupType];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 setObject:v7 forKeyedSubscript:*(void *)(a1 + 32)];
  [v10 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:v9];
  [v10 setObject:v11 forKeyedSubscript:*(void *)(a1 + 48)];

  id v12 = [*(id *)(a1 + 56) recognizedLocale];
  if (v12 && [*(id *)(a1 + 56) confidence] == 2) {
    [v10 setObject:v12 forKeyedSubscript:*(void *)(a1 + 64)];
  }
  id v13 = (void *)[v10 copy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_3;
  v15[3] = &unk_1E6BF16A0;
  id v16 = *(id *)(a1 + 72);
  id v17 = v13;
  id v14 = v13;
  [v7 enumerateObjectsUsingBlock:v15];
}

uint64_t __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 ddResult];
}

uint64_t __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:a2];
}

void __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 scannerResult];
  uint64_t v4 = [v2 objectForKey:v5];
  [v3 setGroupedElementData:v4];
}

+ (id)dataDetectorElementFromVNBarcodeObservation:(id)a3 loggingIndex:(int64_t)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v44 = 0;
  id v6 = [v5 getDataDetectorResults:&v44];
  id v7 = v44;
  id v8 = [v6 firstObject];

  uint64_t v9 = [v8 detectedBarcodeSupportCode];
  id v10 = (void *)v9;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  uint64_t v42 = __Block_byref_object_dispose__3;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__3;
  id v36 = __Block_byref_object_dispose__3;
  id v37 = 0;
  if (v7)
  {
    uint64_t v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:].cold.4((uint64_t)v7, v11);
    }
LABEL_4:

    id v12 = 0;
    goto LABEL_20;
  }
  if (v9)
  {
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    id v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v46 = a4;
      _os_log_impl(&dword_1DB266000, v14, OS_LOG_TYPE_DEFAULT, "Beginning MRC Parsing of element %ld", buf, 0xCu);
    }

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __84__VKCTextElementProcessor_dataDetectorElementFromVNBarcodeObservation_loggingIndex___block_invoke;
    v28 = &unk_1E6BF1718;
    uint64_t v30 = &v32;
    id v31 = &v38;
    id v16 = v15;
    id v29 = v16;
    [v10 parseCodeWithCompletion:&v25];
    dispatch_time_t v17 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v16, v17);
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v25, v26, v27, v28);
    [v18 timeIntervalSinceDate:v13];
    double v20 = v19;

    id v21 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      int64_t v46 = a4;
      __int16 v47 = 2048;
      double v48 = v20;
      _os_log_impl(&dword_1DB266000, v21, OS_LOG_TYPE_DEFAULT, "Completed MRC Parsing of element %ld. Total Time: %f", buf, 0x16u);
    }

    if (!v39[5] && !v33[5])
    {
      id v22 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:]((uint64_t)v10, v22, v20);
      }
    }
  }
  else
  {
    id v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:](v13);
    }
  }

  if (!v39[5])
  {
    uint64_t v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:](v11);
    }
    goto LABEL_4;
  }
  id v23 = [VKCMRCDataDetectorElement alloc];
  id v12 = [(VKCMRCDataDetectorElement *)v23 initWithBarcodeObservation:v5 action:v39[5]];
LABEL_20:
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v12;
}

void __84__VKCTextElementProcessor_dataDetectorElementFromVNBarcodeObservation_loggingIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __84__VKCTextElementProcessor_dataDetectorElementFromVNBarcodeObservation_loggingIndex___block_invoke_cold_1((uint64_t)v7, v8);
    }

    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = a3;
  }
  else
  {
    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v10 = a2;
  }
  objc_storeStrong(v9, v10);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)dataDetectorElementFromVNBarcodeObservation:(os_log_t)log loggingIndex:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Processed BCSCode, but there was no resulting action", v1, 2u);
}

+ (void)dataDetectorElementFromVNBarcodeObservation:(os_log_t)log loggingIndex:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Processing a VNBarcodeObservation, but no resulting BCSDetectedCode", v1, 2u);
}

+ (void)dataDetectorElementFromVNBarcodeObservation:(double)a3 loggingIndex:.cold.3(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "No Action or error from processing code %@. Processing time: %f", (uint8_t *)&v3, 0x16u);
}

+ (void)dataDetectorElementFromVNBarcodeObservation:(uint64_t)a1 loggingIndex:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Error getting mrc data detector results: %@", (uint8_t *)&v2, 0xCu);
}

void __84__VKCTextElementProcessor_dataDetectorElementFromVNBarcodeObservation_loggingIndex___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Error parsing BCS code: %@", (uint8_t *)&v2, 0xCu);
}

@end