@interface CRMultiModelTextRecognizer
+ (id)recognizerForRevision:(unint64_t)a3 imageReaderOptions:(id)a4 error:(id *)a5;
+ (id)sortedSupportedLanguages:(id)a3 byPreferredLanguages:(id)a4;
- (BOOL)_isCancelled;
- (BOOL)keepAllResourcesLoadedWhenNotInUse;
- (BOOL)preheatWithError:(id *)a3;
- (BOOL)shouldCancel;
- (CRMultiModelTextFeatureSplitter)textFeatureSplitter;
- (CRMultiModelTextRecognizer)initWithConfigurationOptions:(id)a3;
- (CRPerformanceStatistics)decodingStats;
- (CRPerformanceStatistics)groupingStats;
- (CRPerformanceStatistics)groupingStatsStorage;
- (CRPerformanceStatistics)inferenceStats;
- (CRPerformanceStatistics)orientationStats;
- (CRRecognizerConfiguration)configuration;
- (CRTextOrientationCorrector)orientationCorrector;
- (NSDictionary)configurationOptions;
- (id)identifierForTextRegion:(id)a3;
- (id)pruneSortAndGroupRegions:(id)a3 recognitionResult:(id)a4;
- (id)recognizeInImage:(id)a3 lineRegions:(id)a4 progressHandler:(id)a5 error:(id *)a6;
- (id)recognizerForIdentifier:(id)a3;
- (id)sortAndGroupPrunedRegions:(id)a3 tableGroups:(id)a4;
- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4;
- (id)titleParametersForTextRegion:(id)a3;
- (void)cancel;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationOptions:(id)a3;
- (void)setGroupingStatsStorage:(id)a3;
- (void)setKeepAllResourcesLoadedWhenNotInUse:(BOOL)a3;
- (void)setOrientationCorrector:(id)a3;
- (void)setOrientationStats:(id)a3;
- (void)setShouldCancel:(BOOL)a3;
- (void)setTextFeatureSplitter:(id)a3;
@end

@implementation CRMultiModelTextRecognizer

- (CRMultiModelTextRecognizer)initWithConfigurationOptions:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRMultiModelTextRecognizer;
  v6 = [(CRMultiModelTextRecognizer *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configurationOptions, a3);
    v7->_keepAllResourcesLoadedWhenNotInUse = 0;
    v8 = [v5 objectForKey:@"CRImageReaderRevisionKey"];
    unint64_t v9 = [v8 unsignedIntegerValue];

    if (v9 >= 3)
    {
      v10 = [[CRTextOrientationCorrector alloc] initWithOptions:v5 error:0];
      orientationCorrector = v7->_orientationCorrector;
      v7->_orientationCorrector = v10;

      v12 = [[CRPerformanceStatistics alloc] initWithName:@"Orientation Correction" measureRecentPeak:0];
      orientationStats = v7->_orientationStats;
      v7->_orientationStats = v12;
    }
  }

  return v7;
}

+ (id)sortedSupportedLanguages:(id)a3 byPreferredLanguages:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[v5 mutableCopy];
  v8 = +[CRRecognizerConfiguration languageSetFromInputLanguages:v6 supportedLanguages:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = [v7 indexOfObject:v14];
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v7 removeObjectAtIndex:v15];
          [v7 insertObject:v14 atIndex:v11++];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)recognizerForRevision:(unint64_t)a3 imageReaderOptions:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = [v7 objectForKey:@"CRImageReaderRevisionKey"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (v10 != a3)
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    [v8 setObject:v11 forKeyedSubscript:@"CRImageReaderRevisionKey"];
  }
  if (a3 - 1 < 2) {
    goto LABEL_4;
  }
  if (a3 == 3)
  {
    v13 = [v7 objectForKeyedSubscript:@"CRImageReaderDisableScriptDetection"];
    char v14 = [v13 BOOLValue];

    if (v14)
    {
LABEL_4:
      uint64_t v12 = [[CRSingleLocaleTextRecognizer alloc] initWithImageReaderOptions:v8 error:a5];
      goto LABEL_9;
    }
    uint64_t v15 = +[CRRecognizerConfiguration supportedLanguagesForVersion:3];
    v16 = objc_opt_class();
    long long v17 = [v7 objectForKeyedSubscript:@"CRImageReaderLanguageKey"];
    long long v18 = [v16 sortedSupportedLanguages:v15 byPreferredLanguages:v17];
    [v8 setObject:v18 forKeyedSubscript:@"CRImageReaderLanguageKey"];

    uint64_t v12 = [[CRMultiLocaleTextRecognizer alloc] initWithImageReaderOptions:v8 error:a5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Unexpected Recognizer Revision %ld", a3);
    uint64_t v12 = 0;
  }
LABEL_9:

  return v12;
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  [(CRMultiModelTextRecognizer *)obj setShouldCancel:1];
  objc_sync_exit(obj);
}

- (BOOL)preheatWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v20 = [(CRMultiModelTextRecognizer *)self configuration];
  v3 = +[CRNeuralTextRecognizer localeToModelClassMappingForRevision:](CRNeuralTextRecognizer, "localeToModelClassMappingForRevision:", [v20 revision]);
  v4 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v23 = 0;
    uint64_t v7 = *(void *)v26;
    int v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKeyedSubscript:v10];
        if ([v4 containsObject:v11])
        {
          uint64_t v12 = CROSLogForCategory(3);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v10;
            _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_DEFAULT, "Skipping preheat for %@, model already loaded", buf, 0xCu);
          }
        }
        else
        {
          [v4 addObject:v11];
          v13 = CROSLogForCategory(3);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v10;
            _os_log_impl(&dword_1DD733000, v13, OS_LOG_TYPE_DEFAULT, "Preheating %@ model", buf, 0xCu);
          }

          uint64_t v12 = [(CRMultiModelTextRecognizer *)self recognizerForIdentifier:v10];
          id v24 = 0;
          int v14 = [v12 preheatWithError:&v24];
          id v15 = v24;
          v8 &= v14;
          v16 = CROSLogForCategory(3);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v30 = v10;
            __int16 v31 = 1024;
            int v32 = v8;
            __int16 v33 = 2112;
            id v34 = v15;
            _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_DEFAULT, "Preheating %@ model complete (success=%d | err=%@)", buf, 0x1Cu);
          }

          if (v15)
          {
            id v17 = v15;

            id v23 = v17;
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v6);
  }
  else
  {
    id v23 = 0;
    LOBYTE(v8) = 1;
  }

  if (a3) {
    *a3 = v23;
  }

  return v8 & 1;
}

- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(CRMultiModelTextRecognizer *)self identifierForTextRegion:a3];
  int v8 = [CRNeuralRecognizerConfiguration alloc];
  uint64_t v9 = [(CRMultiModelTextRecognizer *)self configurationOptions];
  id v26 = 0;
  uint64_t v10 = [(CRNeuralRecognizerConfiguration *)v8 initWithLocale:v7 imageReaderOptions:v9 error:&v26];
  id v11 = v26;

  if (v10)
  {
    id v25 = v11;
    uint64_t v12 = [(CRNeuralRecognizerConfiguration *)v10 decodeWithLM];
    v13 = confidenceThresholds();
    int v14 = NSNumber;
    id v15 = [(CRMultiModelTextRecognizer *)self configuration];
    v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "revision"));
    id v17 = [v13 objectForKeyedSubscript:v16];
    long long v18 = [NSNumber numberWithBool:v12];
    long long v19 = [v17 objectForKeyedSubscript:v18];
    long long v20 = [v19 objectForKeyedSubscript:v6];

    if (v20)
    {
      id v21 = v20;
    }
    else
    {
      id v21 = [(CRNeuralRecognizerConfiguration *)v10 confidenceThresholds];
    }
    id v23 = v21;

    id v11 = v25;
  }
  else
  {
    uint64_t v22 = CROSLogForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v28 = v7;
      _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_FAULT, "Unable to create neural recognizer configuration for ID %@", buf, 0xCu);
    }

    id v23 = +[CRConfidenceThresholds defaultConfidenceThresholds];
  }

  return v23;
}

- (id)titleParametersForTextRegion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = [(CRMultiModelTextRecognizer *)self identifierForTextRegion:a3];
  uint64_t v5 = [CRNeuralRecognizerConfiguration alloc];
  id v6 = [(CRMultiModelTextRecognizer *)self configurationOptions];
  id v13 = 0;
  uint64_t v7 = [(CRNeuralRecognizerConfiguration *)v5 initWithLocale:v4 imageReaderOptions:v6 error:&v13];
  id v8 = v13;

  if (v7)
  {
    uint64_t v9 = [(CRNeuralRecognizerConfiguration *)v7 titleParameters];
  }
  else
  {
    uint64_t v10 = CROSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_FAULT, "Unable to create neural recognizer configuration for ID %@", buf, 0xCu);
    }

    uint64_t v9 = +[CRTitleParameters defaultTitleParameters];
  }
  id v11 = (void *)v9;

  return v11;
}

- (id)recognizeInImage:(id)a3 lineRegions:(id)a4 progressHandler:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(CRMultiModelTextRecognizer *)self _isCancelled])
  {
    if (a6)
    {
      +[CRImageReader errorWithErrorCode:-3];
      id v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = 0;
    }
  }
  else if ([v11 count])
  {
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__18;
    v66 = __Block_byref_object_dispose__18;
    id v67 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v61[3] = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2810000000;
    v59[3] = &unk_1DD8FDA7A;
    int v60 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(2);
    qos_class_t v15 = qos_class_self();
    uint64_t v30 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], v15, 0);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.CoreRecognition.multiModelRecognizeText", v30);
    dispatch_group_t v31 = dispatch_group_create();
    uint64_t v53 = 0;
    v54 = (id *)&v53;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__18;
    v57 = __Block_byref_object_dispose__18;
    id v58 = 0;
    uint64_t v16 = objc_opt_new();
    id v17 = [(CRMultiModelTextRecognizer *)self configuration];
    char v18 = [v17 skipRecognition];

    if ((v18 & 1) == 0)
    {
      long long v19 = [(CRMultiModelTextRecognizer *)self configuration];
      long long v20 = objc_msgSend(v10, "imageByConvertingToColorSpace:", objc_msgSend(v19, "colorSpace"));

      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x3032000000;
      v51[3] = __Block_byref_object_copy__18;
      v51[4] = __Block_byref_object_dispose__18;
      id v52 = 0;
      id v21 = [(CRMultiModelTextRecognizer *)self orientationCorrector];

      if (v21)
      {
        uint64_t v22 = [(CRMultiModelTextRecognizer *)self orientationStats];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke;
        v45[3] = &unk_1E6CDC238;
        id v46 = v11;
        v47 = self;
        v49 = v51;
        id v48 = v20;
        v50 = &v53;
        [v22 measureBlock:v45];
      }
      if (!v54[5]) {
        objc_storeStrong(v54 + 5, a4);
      }
      id v23 = [(CRMultiModelTextRecognizer *)self textFeatureSplitter];
      id v24 = v54[5];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_23;
      v33[3] = &unk_1E6CDC2D0;
      id v25 = v31;
      id v34 = v25;
      v35 = v32;
      uint64_t v36 = v29;
      v37 = self;
      v41 = &v62;
      id v10 = v20;
      id v38 = v10;
      v42 = v51;
      id v40 = v12;
      v43 = v59;
      v44 = v61;
      id v39 = v16;
      [v23 enumerateLineRegions:v24 usingBlock:v33];

      dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
      if (a6)
      {
        id v26 = (void *)v63[5];
        if (v26) {
          *a6 = v26;
        }
      }

      _Block_object_dispose(v51, 8);
      dispatch_semaphore_t v14 = v29;
    }
    if (v54[5])
    {
      long long v27 = [(CRMultiModelTextRecognizer *)self textFeatureSplitter];
      id v13 = [v27 pruneAndFilterLineRegions:v54[5] recognitionResult:v16];
    }
    else
    {
      id v13 = 0;
    }

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(v59, 8);
    _Block_object_dispose(v61, 8);
    _Block_object_dispose(&v62, 8);
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

void __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) sortedArrayUsingComparator:&__block_literal_global_37];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (!v2) {
    goto LABEL_19;
  }
  uint64_t v3 = v2;
  char v4 = 0;
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v9 = *(void *)v60;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v60 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      uint64_t v12 = [v11 polygon];
      if (v12)
      {
        id v13 = (void *)v12;
        dispatch_semaphore_t v14 = [v11 polygon];
        if ((unint64_t)[v14 pointCount] <= 3)
        {
        }
        else
        {
          qos_class_t v15 = [*(id *)(a1 + 40) configuration];
          int v16 = [v15 rectifyPolygons];

          if (v16)
          {
            id v17 = [v11 polygon];
            char v18 = [v17 denormalizedPolyline];
            [v18 boundingRect];
            goto LABEL_13;
          }
        }
      }
      id v23 = [v11 boundingQuad];
      [v23 baselineAngle];
      double v25 = fabs(v24);
      id v26 = [*(id *)(a1 + 40) configuration];
      [v26 angleThresholdForRotatedCrops];
      double v28 = v27;

      if (v25 <= v28) {
        continue;
      }
      id v17 = [v11 boundingQuad];
      char v18 = [v17 denormalizedQuad];
      [v18 boundingBox];
LABEL_13:
      v69.origin.double x = v19;
      v69.origin.double y = v20;
      v69.size.double width = v21;
      v69.size.double height = v22;
      v67.origin.double x = x;
      v67.origin.double y = y;
      v67.size.double width = width;
      v67.size.double height = height;
      CGRect v68 = CGRectUnion(v67, v69);
      double x = v68.origin.x;
      double y = v68.origin.y;
      double width = v68.size.width;
      double height = v68.size.height;

      char v4 = 1;
    }
    uint64_t v3 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  }
  while (v3);
  if ((v4 & 1) != 0 && _os_feature_enabled_impl())
  {
    uint64_t v29 = [CRMetalPolygonRectifier alloc];
    uint64_t v30 = [*(id *)(a1 + 40) configuration];
    dispatch_group_t v31 = [v30 metalDevice];
    uint64_t v32 = -[CRMetalPolygonRectifier initWithDevice:sourceImage:regionOfInterest:](v29, "initWithDevice:sourceImage:regionOfInterest:", v31, *(void *)(a1 + 48), x, y, width, height);
    uint64_t v33 = *(void *)(*(void *)(a1 + 56) + 8);
    id v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;
  }
LABEL_19:
  v35 = [*(id *)(a1 + 40) orientationCorrector];
  uint64_t v36 = *(void *)(a1 + 48);
  uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v58 = 0;
  uint64_t v38 = [v35 regionsByCorrectingOrientationOnSortedRegions:obj correctAllRegions:0 image:v36 rectifier:v37 error:&v58];
  id v39 = v58;
  uint64_t v40 = *(void *)(*(void *)(a1 + 64) + 8);
  v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = v38;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v42 = CROSLogForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = [v39 description];
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = v43;
      _os_log_impl(&dword_1DD733000, v42, OS_LOG_TYPE_ERROR, "Encountered error during orientation correction. %@", buf, 0xCu);
    }
  }
  v44 = [*(id *)(a1 + 40) configuration];
  char v45 = [v44 scriptDetectionDisabled];

  if ((v45 & 1) != 0 || !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v51 = 0;
  }
  else
  {
    id v46 = [*(id *)(a1 + 40) orientationCorrector];
    uint64_t v47 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v48 = *(void *)(a1 + 48);
    uint64_t v49 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v57 = 0;
    uint64_t v50 = [v46 regionsByCorrectingSequenceScriptOnSortedRegions:v47 correctAllRegions:0 image:v48 rectifier:v49 error:&v57];
    id v51 = v57;
    uint64_t v52 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v53 = *(void **)(v52 + 40);
    *(void *)(v52 + 40) = v50;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      v54 = CROSLogForCategory(0);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        uint64_t v55 = [v51 description];
        *(_DWORD *)buf = 138412290;
        uint64_t v64 = v55;
        _os_log_impl(&dword_1DD733000, v54, OS_LOG_TYPE_ERROR, "Encountered error during sequence script correction. %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 aspectRatio];
  double v6 = v5;
  [v4 aspectRatio];
  double v8 = v7;

  if (v6 > v8) {
    return 1;
  }
  else {
    return -1;
  }
}

void __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_23(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(NSObject **)(a1 + 32);
  id v10 = *(NSObject **)(a1 + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_2_24;
  v17[3] = &unk_1E6CDC2A8;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v13 = *(void **)(a1 + 64);
  id v18 = v11;
  uint64_t v19 = v12;
  uint64_t v14 = *(void *)(a1 + 88);
  id v20 = v7;
  uint64_t v25 = v14;
  id v21 = v13;
  id v22 = v8;
  uint64_t v26 = *(void *)(a1 + 96);
  id v24 = *(id *)(a1 + 80);
  long long v27 = *(_OWORD *)(a1 + 104);
  double v28 = a4;
  id v23 = *(id *)(a1 + 72);
  id v15 = v8;
  id v16 = v7;
  dispatch_group_async(v9, v10, v17);
}

void __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_2_24(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = [*(id *)(a1 + 40) recognizerForIdentifier:*(void *)(a1 + 48)];
  if (!v2)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    uint64_t v3 = -5;
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 40) _isCancelled])
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    uint64_t v3 = -3;
LABEL_5:
    uint64_t v4 = +[CRImageReader errorWithErrorCode:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
    double v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    goto LABEL_10;
  }
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_3;
  v14[3] = &unk_1E6CDC260;
  id v15 = *(id *)(a1 + 80);
  long long v16 = *(_OWORD *)(a1 + 104);
  uint64_t v18 = *(void *)(a1 + 120);
  id v17 = v19;
  id v13 = 0;
  id v10 = [v2 recognizeInImage:v7 lineRegions:v8 rectifier:v9 progressHandler:v14 error:&v13];
  id v11 = v13;
  id v12 = v13;
  [*(id *)(a1 + 72) addContentsOfRecognitionResult:v10 shouldOverwriteExistingHandler:&__block_literal_global_28_1];
  if (v12 || !v10) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v11);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  _Block_object_dispose(v19, 8);
LABEL_10:
}

void __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_3(uint64_t a1, double a2)
{
  if (*(void *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24)
                                                                + *(double *)(a1 + 64)
                                                                * (a2
                                                                 - *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                             + 24));
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                             + 24));
    uint64_t v4 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    os_unfair_lock_unlock(v4);
  }
}

BOOL __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v6 = [v5 firstObject];
  uint64_t v7 = [v6 text];
  if ([v7 length])
  {
    uint64_t v8 = [v5 firstObject];
    [v8 activationProbability];
    double v10 = v9;
    id v11 = [v4 firstObject];
    [v11 activationProbability];
    BOOL v13 = v10 > v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)pruneSortAndGroupRegions:(id)a3 recognitionResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__18;
  id v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  uint64_t v8 = [(CRMultiModelTextRecognizer *)self groupingStats];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__CRMultiModelTextRecognizer_pruneSortAndGroupRegions_recognitionResult___block_invoke;
  v13[3] = &unk_1E6CDC2F8;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  long long v16 = &v17;
  [v8 measureBlock:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __73__CRMultiModelTextRecognizer_pruneSortAndGroupRegions_recognitionResult___block_invoke(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v4 = (id)CRSignpostLog_signPostOSLog;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTextGroupingTime", "", buf, 2u);
  }

  id v6 = [*(id *)(a1 + 32) textFeatureSplitter];
  id v7 = [v6 pruneAndFilterLineRegions:*(void *)(a1 + 40) recognitionResult:*(void *)(a1 + 48)];

  uint64_t v8 = [*(id *)(a1 + 32) textFeatureSplitter];
  uint64_t v9 = [v8 groupLineRegions:v7];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  double v12 = (id)CRSignpostLog_signPostOSLog;
  BOOL v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRTextGroupingTime", "", v14, 2u);
  }
}

- (id)sortAndGroupPrunedRegions:(id)a3 tableGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__18;
  id v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  uint64_t v8 = [(CRMultiModelTextRecognizer *)self groupingStats];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__CRMultiModelTextRecognizer_sortAndGroupPrunedRegions_tableGroups___block_invoke;
  v13[3] = &unk_1E6CDC2F8;
  long long v16 = &v17;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  [v8 measureBlock:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __68__CRMultiModelTextRecognizer_sortAndGroupPrunedRegions_tableGroups___block_invoke(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v4 = (id)CRSignpostLog_signPostOSLog;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTextGroupingTime", "", buf, 2u);
  }

  id v6 = [*(id *)(a1 + 32) textFeatureSplitter];
  uint64_t v7 = [v6 groupLineRegions:*(void *)(a1 + 40) tableGroups:*(void *)(a1 + 48)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v10 = (id)CRSignpostLog_signPostOSLog;
  id v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)double v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v11, OS_SIGNPOST_INTERVAL_END, v3, "OCRTextGroupingTime", "", v12, 2u);
  }
}

- (id)recognizerForIdentifier:(id)a3
{
  return 0;
}

- (CRPerformanceStatistics)inferenceStats
{
  return 0;
}

- (CRPerformanceStatistics)decodingStats
{
  return 0;
}

- (CRPerformanceStatistics)groupingStats
{
  os_signpost_id_t v3 = [(CRMultiModelTextRecognizer *)self groupingStatsStorage];

  if (!v3)
  {
    id v4 = [[CRPerformanceStatistics alloc] initWithName:@"Text Grouping" measureRecentPeak:0];
    [(CRMultiModelTextRecognizer *)self setGroupingStatsStorage:v4];
  }
  return [(CRMultiModelTextRecognizer *)self groupingStatsStorage];
}

- (id)identifierForTextRegion:(id)a3
{
  return 0;
}

- (BOOL)_isCancelled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CRMultiModelTextRecognizer *)v2 shouldCancel];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)keepAllResourcesLoadedWhenNotInUse
{
  return self->_keepAllResourcesLoadedWhenNotInUse;
}

- (void)setKeepAllResourcesLoadedWhenNotInUse:(BOOL)a3
{
  self->_keepAllResourcesLoadedWhenNotInUse = a3;
}

- (CRPerformanceStatistics)orientationStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOrientationStats:(id)a3
{
}

- (CRRecognizerConfiguration)configuration
{
  return (CRRecognizerConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSDictionary)configurationOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigurationOptions:(id)a3
{
}

- (CRMultiModelTextFeatureSplitter)textFeatureSplitter
{
  return (CRMultiModelTextFeatureSplitter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTextFeatureSplitter:(id)a3
{
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (CRPerformanceStatistics)groupingStatsStorage
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGroupingStatsStorage:(id)a3
{
}

- (CRTextOrientationCorrector)orientationCorrector
{
  return (CRTextOrientationCorrector *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOrientationCorrector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationCorrector, 0);
  objc_storeStrong((id *)&self->_groupingStatsStorage, 0);
  objc_storeStrong((id *)&self->_textFeatureSplitter, 0);
  objc_storeStrong((id *)&self->_configurationOptions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_orientationStats, 0);
}

@end