@interface CREngineAccurate
+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 extendedTimeoutBlock:(id)a5 error:(id *)a6;
+ (CGSize)detectorImageSizeForOptions:(id)a3 imageSize:(CGSize)a4;
+ (id)supportedComputeDevicesForRevision:(int64_t)a3;
+ (id)supportedLanguagesForRevision:(int64_t)a3 error:(id *)a4;
- (BOOL)shouldCancel;
- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4;
- (CREngineAccurate)initWithOptions:(id)a3 error:(id *)a4;
- (CRFormAnalyzer)formAnalyzer;
- (CRLineWrapper)lineWrapper;
- (CRMultiModelTextRecognizer)ocrRecognizer;
- (CRNeuralTextDetector)ocrDetector;
- (CRPerformanceStatistics)detectorInferenceStats;
- (CRPerformanceStatistics)detectorStats;
- (CRPerformanceStatistics)formAnalyzerStats;
- (CRPerformanceStatistics)formDetectionStats;
- (CRPerformanceStatistics)formPostProcessingStats;
- (CRPerformanceStatistics)lineWrappingStats;
- (CRPerformanceStatistics)orientationCorrectionStats;
- (CRPerformanceStatistics)postProcStats;
- (CRPerformanceStatistics)recognizerDecodingStats;
- (CRPerformanceStatistics)recognizerInferenceStats;
- (CRPerformanceStatistics)recognizerStats;
- (CRPerformanceStatistics)tableStructureRecognitionStats;
- (CRPerformanceStatistics)textGroupingStats;
- (CRTableStructureRecognizer)tableStructureRecognizer;
- (MLComputeDeviceProtocol)requestedComputeDevice;
- (NSDictionary)options;
- (id)_detectorDebugDataForResult:(id)a3;
- (id)_documentOutputRegionResult:(id)a3 imageSize:(CGSize)a4;
- (id)_titleRegionFromRegions:(id)a3;
- (id)documentForLineRegions:(id)a3 recognitionResult:(id)a4;
- (id)resultDocumentForDetectionResult:(id)a3 image:(id)a4 options:(id)a5 progressHandler:(id)a6 error:(id *)a7;
- (id)resultDocumentInImage:(id)a3 options:(id)a4 trackingSession:(id)a5 withProgressHandler:(id)a6 error:(id *)a7;
- (id)textDetectorResultsForImage:(id)a3 error:(id *)a4;
- (id)textDetectorResultsForImage:(id)a3 trackingSession:(id)a4 error:(id *)a5;
- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4;
- (id)trackingResultOnSession:(id)a3 image:(id)a4 options:(id)a5 error:(id *)a6;
- (unint64_t)revision;
- (void)_loadFormAnalyzerIfNeededWithImageReaderOptions:(id)a3 error:(id *)a4;
- (void)cancel;
- (void)setFormAnalyzer:(id)a3;
- (void)setFormAnalyzerStats:(id)a3;
- (void)setFormDetectionStats:(id)a3;
- (void)setFormPostProcessingStats:(id)a3;
- (void)setLineWrapper:(id)a3;
- (void)setLineWrappingStats:(id)a3;
- (void)setOcrDetector:(id)a3;
- (void)setOcrRecognizer:(id)a3;
- (void)setOptions:(id)a3;
- (void)setRecognizerStats:(id)a3;
- (void)setRequestedComputeDevice:(id)a3;
- (void)setRevision:(unint64_t)a3;
- (void)setShouldCancel:(BOOL)a3;
- (void)setTableStructureRecognitionStats:(id)a3;
- (void)setTableStructureRecognizer:(id)a3;
@end

@implementation CREngineAccurate

- (CREngineAccurate)initWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CREngineAccurate;
  v7 = [(CREngineAccurate *)&v37 init];
  if (v7)
  {
    v8 = CROSLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[CREngineAccurate initWithOptions:error:]";
      _os_log_impl(&dword_1DD733000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    [(CREngineAccurate *)v7 setRevision:+[CRImageReader defaultRevisionNumber]];
    v9 = [v6 objectForKeyedSubscript:@"CRImageReaderRevisionKey"];
    BOOL v10 = v9 == 0;

    if (!v10)
    {
      v11 = [v6 objectForKey:@"CRImageReaderRevisionKey"];
      -[CREngineAccurate setRevision:](v7, "setRevision:", [v11 unsignedIntegerValue]);
    }
    if ([(CREngineAccurate *)v7 revision] >= 3) {
      uint64_t v12 = [(CREngineAccurate *)v7 revision];
    }
    else {
      uint64_t v12 = 3;
    }
    v13 = [v6 objectForKeyedSubscript:@"CRImageReaderComputeDeviceKey"];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      v15 = [v6 objectForKeyedSubscript:@"CRImageReaderComputeDeviceKey"];
      v16 = [(id)objc_opt_class() supportedComputeDevicesForRevision:v12];
      char v17 = [v16 containsObject:v15];

      if ((v17 & 1) == 0)
      {
        v35 = CROSLogForCategory(0);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v15;
          _os_log_impl(&dword_1DD733000, v35, OS_LOG_TYPE_ERROR, "Unsupported compute device requested %@", buf, 0xCu);
        }

        if (a4)
        {
          *a4 = +[CRImageReader errorWithErrorCode:-7];
        }

        goto LABEL_25;
      }
      [(CREngineAccurate *)v7 setRequestedComputeDevice:v15];
    }
    v18 = +[CRNeuralTextDetector detectorForRevision:v12 imageReaderOptions:v6 error:a4];
    [(CREngineAccurate *)v7 setOcrDetector:v18];

    uint64_t v19 = +[CRMultiModelTextRecognizer recognizerForRevision:v12 imageReaderOptions:v6 error:a4];
    [(CREngineAccurate *)v7 setOcrRecognizer:v19];

    v20 = [v6 objectForKeyedSubscript:@"CRImageReaderKeepResourcesLoaded"];
    LOBYTE(v19) = v20 == 0;

    if ((v19 & 1) == 0)
    {
      v21 = [v6 objectForKeyedSubscript:@"CRImageReaderKeepResourcesLoaded"];
      uint64_t v22 = [v21 BOOLValue];
      v23 = [(CREngineAccurate *)v7 ocrRecognizer];
      [v23 setKeepAllResourcesLoadedWhenNotInUse:v22];
    }
    v24 = [(CREngineAccurate *)v7 ocrDetector];
    if (v24)
    {
      v25 = [(CREngineAccurate *)v7 ocrRecognizer];
      BOOL v26 = v25 == 0;

      if (!v26)
      {
        v27 = [[CRPerformanceStatistics alloc] initWithName:@"Recognition" measureRecentPeak:0];
        [(CREngineAccurate *)v7 setRecognizerStats:v27];

        [(CREngineAccurate *)v7 setShouldCancel:0];
        if ([(CREngineAccurate *)v7 revision] >= 3)
        {
          v28 = [v6 objectForKeyedSubscript:@"CRImageReaderCoreMode"];
          char v29 = [v28 BOOLValue];

          if ((v29 & 1) == 0)
          {
            v30 = objc_alloc_init(CRLineWrappingConfiguration);
            v31 = [[CRLineWrapper alloc] initWithConfiguration:v30];
            [(CREngineAccurate *)v7 setLineWrapper:v31];

            v32 = [[CRPerformanceStatistics alloc] initWithName:@"Line Wrapping" measureRecentPeak:1];
            [(CREngineAccurate *)v7 setLineWrappingStats:v32];

            v33 = [[CRPerformanceStatistics alloc] initWithName:@"TableStructure" measureRecentPeak:1];
            [(CREngineAccurate *)v7 setTableStructureRecognitionStats:v33];
          }
        }
        goto LABEL_19;
      }
    }
LABEL_25:
    v34 = 0;
    goto LABEL_26;
  }
LABEL_19:
  v34 = v7;
LABEL_26:

  return v34;
}

- (void)cancel
{
  [(CREngineAccurate *)self setShouldCancel:1];
  id v3 = [(CREngineAccurate *)self ocrDetector];
  [v3 cancel];

  id v4 = [(CREngineAccurate *)self ocrRecognizer];
  [v4 cancel];
}

- (CRPerformanceStatistics)detectorStats
{
  v2 = [(CREngineAccurate *)self ocrDetector];
  id v3 = [v2 detectorStats];

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)postProcStats
{
  v2 = [(CREngineAccurate *)self ocrDetector];
  id v3 = [v2 postProcStats];

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)detectorInferenceStats
{
  v2 = [(CREngineAccurate *)self ocrDetector];
  id v3 = [v2 inferenceStats];

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)recognizerInferenceStats
{
  v2 = [(CREngineAccurate *)self ocrRecognizer];
  id v3 = [v2 inferenceStats];

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)recognizerDecodingStats
{
  v2 = [(CREngineAccurate *)self ocrRecognizer];
  id v3 = [v2 decodingStats];

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)textGroupingStats
{
  v2 = [(CREngineAccurate *)self ocrRecognizer];
  id v3 = [v2 groupingStats];

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)orientationCorrectionStats
{
  v2 = [(CREngineAccurate *)self ocrRecognizer];
  id v3 = [v2 orientationStats];

  return (CRPerformanceStatistics *)v3;
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v8 = [(CREngineAccurate *)self ocrDetector];

  if (v8)
  {
    v9 = [(CREngineAccurate *)self ocrDetector];
    objc_msgSend(v9, "smallestImageSizeForTextWithRelativeHeight:originalImageSize:", a3, width, height);
    double width = v10;
    double height = v11;
  }
  double v12 = width;
  double v13 = height;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)_loadFormAnalyzerIfNeededWithImageReaderOptions:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(CREngineAccurate *)self formAnalyzer];

  if (!v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = [(CREngineAccurate *)v8 formAnalyzer];

    if (!v9)
    {
      double v10 = objc_alloc_init(CRFormAnalyzerConfiguration);
      [(CRFormAnalyzerConfiguration *)v10 setResizeInputImage:0];
      [(CRFormAnalyzerConfiguration *)v10 setTileInputImage:1];
      id v21 = 0;
      unint64_t v11 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:v6 mtlDevice:&v21];
      id v12 = v21;
      [(CRFormAnalyzerConfiguration *)v10 setComputeDeviceType:v11];
      [(CRFormAnalyzerConfiguration *)v10 setMetalDevice:v12];
      double v13 = [[CRPerformanceStatistics alloc] initWithName:@"Form Analysis" measureRecentPeak:1];
      [(CREngineAccurate *)v8 setFormAnalyzerStats:v13];

      BOOL v14 = [[CRPerformanceStatistics alloc] initWithName:@"Form Detection" measureRecentPeak:0];
      [(CREngineAccurate *)v8 setFormDetectionStats:v14];

      v15 = [[CRPerformanceStatistics alloc] initWithName:@"Form PostProcessing" measureRecentPeak:0];
      [(CREngineAccurate *)v8 setFormPostProcessingStats:v15];

      v16 = [CRFormAnalyzer alloc];
      char v17 = [(CREngineAccurate *)v8 formDetectionStats];
      v18 = [(CREngineAccurate *)v8 formPostProcessingStats];
      uint64_t v19 = [(CRFormAnalyzer *)v16 initWithConfiguration:v10 error:a4 detectionStats:v17 postProcessingStats:v18];
      [(CREngineAccurate *)v8 setFormAnalyzer:v19];

      v20 = CROSLogForCategory(6);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[CREngineAccurate _loadFormAnalyzerIfNeededWithImageReaderOptions:error:]";
        _os_log_impl(&dword_1DD733000, v20, OS_LOG_TYPE_DEFAULT, "%s: Form analyzer loaded.", buf, 0xCu);
      }
    }
    objc_sync_exit(v8);
  }
}

- (id)resultDocumentForDetectionResult:(id)a3 image:(id)a4 options:(id)a5 progressHandler:(id)a6 error:(id *)a7
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v73 = a5;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__16;
  v100 = __Block_byref_object_dispose__16;
  id v101 = 0;
  id v68 = a6;
  BOOL v14 = [(CREngineAccurate *)self recognizerStats];
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke;
  v90[3] = &unk_1E6CDBC68;
  v94 = &v96;
  v90[4] = self;
  id v15 = v13;
  id v91 = v15;
  id v16 = v12;
  id v92 = v16;
  v70 = a7;
  id v71 = v68;
  id v93 = v71;
  v95 = a7;
  [v14 measureBlock:v90];

  v74 = [MEMORY[0x1E4F1CA48] array];
  if (v16)
  {
    char v17 = (void *)[v16 tableRegions];
    if (v17[1] != *v17)
    {
      v18 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v19 = (void *)[v16 tableRegions];
      uint64_t v20 = [v18 arrayWithCapacity:(uint64_t)(v19[1] - *v19) >> 3];

      v74 = (void *)v20;
      id v21 = CROSLogForCategory(5);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = (void *)[v16 tableRegions];
        uint64_t v23 = (uint64_t)(v22[1] - *v22) >> 3;
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v23;
        _os_log_impl(&dword_1DD733000, v21, OS_LOG_TYPE_DEBUG, "Processing %lu tables", (uint8_t *)&buf, 0xCu);
      }

      for (unint64_t i = 0; ; ++i)
      {
        v25 = (void *)[v16 tableRegions];
        if (i >= (uint64_t)(v25[1] - *v25) >> 3) {
          break;
        }
        BOOL v26 = [(CREngineAccurate *)self tableStructureRecognizer];
        BOOL v27 = v26 == 0;

        if (v27)
        {
          id v89 = 0;
          unint64_t v28 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:v73 mtlDevice:&v89];
          id v29 = v89;
          v30 = [[CRTableStructureRecognizer alloc] initWithComputeDeviceType:v28 metalDevice:v29];
          [(CREngineAccurate *)self setTableStructureRecognizer:v30];
        }
        v31 = [(CREngineAccurate *)self tableStructureRecognitionStats];
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_59;
        v83[3] = &unk_1E6CDBC90;
        v83[4] = self;
        id v84 = v16;
        v87 = &v96;
        unint64_t v88 = i;
        id v85 = v15;
        id v86 = v74;
        [v31 measureBlock:v83];
      }
    }
  }
  v32 = objc_opt_new();
  v33 = [(CREngineAccurate *)self ocrRecognizer];
  v34 = [v33 sortAndGroupPrunedRegions:v97[5] tableGroups:v74];

  [v32 setBlocks:v34];
  v35 = [v16 lines];
  uint64_t v36 = [v35 count];
  objc_super v37 = [v32 lines];
  objc_msgSend(v32, "setFilteredFeatureCount:", v36 - objc_msgSend(v37, "count"));

  v38 = [v32 lines];
  v39 = [(CREngineAccurate *)self _titleRegionFromRegions:v38];
  [v32 setTitleRegion:v39];

  [v15 size];
  v72 = -[CREngineAccurate _documentOutputRegionResult:imageSize:](self, "_documentOutputRegionResult:imageSize:", v32);
  uint64_t v40 = [v15 url];
  v41 = [v40 URLByDeletingPathExtension];
  v42 = [v41 lastPathComponent];
  v43 = v42;
  if (!v42)
  {
    v43 = objc_msgSend(NSString, "stringWithFormat:", @"null%lu", objc_msgSend(v15, "hash"));
  }
  [v72 setImagePath:v43];
  if (!v42) {

  }
  v44 = [(CREngineAccurate *)self lineWrapper];
  BOOL v45 = v44 == 0;

  if (!v45)
  {
    v46 = [(CREngineAccurate *)self lineWrappingStats];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_65;
    v80[3] = &unk_1E6CDB820;
    id v81 = v72;
    v82 = self;
    [v46 measureBlock:v80];
  }
  if (os_variant_has_internal_diagnostics())
  {
    v47 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v48 = [v47 objectForKey:@"com.apple.CoreRecognition.load_cached_form_detection"];
    BYTE4(v69) = [v48 BOOLValue];

    v49 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v50 = [v49 objectForKey:@"com.apple.CoreRecognition.save_cached_form_detection"];
    LODWORD(v69) = [v50 BOOLValue];
  }
  else
  {
    uint64_t v69 = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__16;
  v109 = __Block_byref_object_dispose__16;
  id v110 = 0;
  v51 = [v73 objectForKeyedSubscript:@"CRImageReaderDetectForms"];
  if ([v51 BOOLValue])
  {

LABEL_22:
    [(CREngineAccurate *)self _loadFormAnalyzerIfNeededWithImageReaderOptions:v73 error:v70];
    v55 = CROSLogForCategory(6);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = [v73 objectForKeyedSubscript:@"CRImageReaderDetectForms"];
      int v57 = [v56 BOOLValue];
      *(_DWORD *)v102 = 136315394;
      v103 = "-[CREngineAccurate resultDocumentForDetectionResult:image:options:progressHandler:error:]";
      __int16 v104 = 1024;
      int v105 = v57;
      _os_log_impl(&dword_1DD733000, v55, OS_LOG_TYPE_DEFAULT, "%s: Form detection is enabled (CRImageReaderDetectForms:%d).", v102, 0x12u);
    }
    v58 = [(CREngineAccurate *)self formAnalyzerStats];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_77;
    v75[3] = &unk_1E6CDBCB8;
    char v79 = BYTE4(v69);
    p_long long buf = &buf;
    v75[4] = self;
    id v76 = v15;
    id v77 = v72;
    [v58 measureBlock:v75];

    goto LABEL_28;
  }
  v52 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v53 = [v52 objectForKey:@"com.apple.CoreRecognition.force_form_detection"];
  int v54 = [v53 BOOLValue];

  if (v54) {
    goto LABEL_22;
  }
  v60 = CROSLogForCategory(6);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v102 = 136315138;
    v103 = "-[CREngineAccurate resultDocumentForDetectionResult:image:options:progressHandler:error:]";
    _os_log_impl(&dword_1DD733000, v60, OS_LOG_TYPE_DEFAULT, "%s: Form detection is disabled.", v102, 0xCu);
  }

LABEL_28:
  v61 = *(void **)(*((void *)&buf + 1) + 40);
  if (!v61)
  {
    CRLogger = CRLogger::getCRLogger(v59);
    if (*CRLogger && (CRLogger[8] & 0x20) != 0)
    {
      id v63 = (id)[v72 contentsWithTypes:4096];
      +[CRDataDetectorUtilities debugDataDetectorForRegion:v72 withImage:v15 ddQOS:2];
    }
    v64 = [(CREngineAccurate *)self _detectorDebugDataForResult:v16];
    [v72 setDetectorResults:v64];

    v61 = v72;
    if (v69)
    {
      v65 = [(CREngineAccurate *)self formAnalyzer];
      [v65 exportSerializedResults:v72 forImage:v15];

      v61 = v72;
    }
  }
  id v66 = v61;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v96, 8);
  return v66;
}

void __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRRecognizerTime", "", buf, 2u);
  }

  id v6 = [*(id *)(a1 + 32) ocrRecognizer];
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = [*(id *)(a1 + 48) lines];
  uint64_t v9 = [v6 recognizeInImage:v7 lineRegions:v8 progressHandler:*(void *)(a1 + 56) error:*(void *)(a1 + 72)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  unint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v12 = (id)CRSignpostLog_signPostOSLog;
  id v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)BOOL v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRRecognizerTime", "", v14, 2u);
  }
}

void __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_59(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTableStructureRecognitionTime", "", buf, 2u);
  }

  id v6 = [*(id *)(a1 + 32) tableStructureRecognizer];
  uint64_t v7 = [v6 recognizeDetectedTableInRegion:*(void *)(a1 + 40) filteredResults:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) tableIndex:*(void *)(a1 + 72) image:*(void *)(a1 + 48)];

  if (v7)
  {
    v8 = [*(id *)(a1 + 32) tableStructureRecognizer];
    uint64_t v9 = [v8 tableGroupRegionFromResult:v7 recognizedLines:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

    [*(id *)(a1 + 56) addObject:v9];
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v10 = (id)CRSignpostLog_signPostOSLog;
  unint64_t v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)id v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v11, OS_SIGNPOST_INTERVAL_END, v3, "OCRTableStructureRecognitionTime", "", v12, 2u);
  }
}

void __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_65(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRLineWrappingTime", "", buf, 2u);
  }

  id v6 = [*(id *)(a1 + 32) contentsWithTypes:2];
  uint64_t v7 = [*(id *)(a1 + 40) lineWrapper];
  [v7 predictLineWrappingTypesForAllLinesInGroups:v6 useHandwritingConfig:0];

  [*(id *)(a1 + 32) _invalidateTranscript];
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v8 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v9, OS_SIGNPOST_INTERVAL_END, v3, "OCRLineWrappingTime", "", v10, 2u);
  }
}

void __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_77(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRFormDetection", "", (uint8_t *)&v21, 2u);
  }

  if (!*(unsigned char *)(a1 + 64)) {
    goto LABEL_10;
  }
  id v6 = [*(id *)(a1 + 32) formAnalyzer];
  uint64_t v7 = [v6 fetchSerializedResultsForImage:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
LABEL_10:
    uint64_t v10 = [*(id *)(a1 + 32) formAnalyzer];
    int v11 = [v10 shouldRunDetectionForDocument:*(void *)(a1 + 48)];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) formAnalyzer];
      [v12 analyzeImage:*(void *)(a1 + 40) outputRegion:*(void *)(a1 + 48)];

      id v13 = CROSLogForCategory(6);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v14 = [*(id *)(a1 + 48) formFieldRegions];
        uint64_t v15 = [v14 count];
        id v16 = [*(id *)(a1 + 48) uuid];
        int v21 = 136315650;
        uint64_t v22 = "-[CREngineAccurate resultDocumentForDetectionResult:image:options:progressHandler:error:]_block_invoke";
        __int16 v23 = 2048;
        uint64_t v24 = v15;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v16;
        _os_log_impl(&dword_1DD733000, v13, OS_LOG_TYPE_DEFAULT, "%s: Storing %lu parsed fields in %@.", (uint8_t *)&v21, 0x20u);
      }
    }
    else
    {
      id v13 = CROSLogForCategory(6);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        char v17 = [*(id *)(a1 + 48) uuid];
        uint64_t v18 = [*(id *)(a1 + 48) numberOfLines];
        int v21 = 136315650;
        uint64_t v22 = "-[CREngineAccurate resultDocumentForDetectionResult:image:options:progressHandler:error:]_block_invoke";
        __int16 v23 = 2112;
        uint64_t v24 = (uint64_t)v17;
        __int16 v25 = 2048;
        uint64_t v26 = v18;
        _os_log_impl(&dword_1DD733000, v13, OS_LOG_TYPE_DEFAULT, "%s: Skipping running form field detection for %@ (line count: %lu).", (uint8_t *)&v21, 0x20u);
      }
    }

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    uint64_t v19 = (id)CRSignpostLog_signPostOSLog;
    uint64_t v20 = v19;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v20, OS_SIGNPOST_INTERVAL_END, v3, "OCRFormDetection", "", (uint8_t *)&v21, 2u);
    }
  }
}

- (id)documentForLineRegions:(id)a3 recognitionResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = [(CREngineAccurate *)self ocrRecognizer];
    uint64_t v10 = [v9 pruneSortAndGroupRegions:v6 recognitionResult:v7];
    [v8 setBlocks:v10];

    uint64_t v11 = [v6 count];
    id v12 = [v8 lines];
    objc_msgSend(v8, "setFilteredFeatureCount:", v11 - objc_msgSend(v12, "count"));

    id v13 = [v8 lines];
    BOOL v14 = [(CREngineAccurate *)self _titleRegionFromRegions:v13];
    [v8 setTitleRegion:v14];

    uint64_t v15 = [v6 firstObject];
    id v16 = [v15 boundingQuad];
    [v16 normalizationSize];
    char v17 = -[CREngineAccurate _documentOutputRegionResult:imageSize:](self, "_documentOutputRegionResult:imageSize:", v8);

    uint64_t v18 = [(CREngineAccurate *)self lineWrapper];

    if (v18)
    {
      uint64_t v19 = [(CREngineAccurate *)self lineWrappingStats];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __61__CREngineAccurate_documentForLineRegions_recognitionResult___block_invoke;
      v23[3] = &unk_1E6CDB820;
      id v24 = v17;
      __int16 v25 = self;
      [v19 measureBlock:v23];
    }
    uint64_t v20 = [[CRDetectionResult alloc] initWithLines:v6];
    int v21 = [(CREngineAccurate *)self _detectorDebugDataForResult:v20];
    [v17 setDetectorResults:v21];
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

void __61__CREngineAccurate_documentForLineRegions_recognitionResult___block_invoke(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRLineWrappingTime", "", buf, 2u);
  }

  id v6 = [*(id *)(a1 + 32) contentsWithTypes:2];
  id v7 = [*(id *)(a1 + 40) lineWrapper];
  [v7 predictLineWrappingTypesForAllLinesInGroups:v6 useHandwritingConfig:0];

  [*(id *)(a1 + 32) _invalidateTranscript];
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v8 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v9, OS_SIGNPOST_INTERVAL_END, v3, "OCRLineWrappingTime", "", v10, 2u);
  }
}

- (id)textDetectorResultsForImage:(id)a3 error:(id *)a4
{
  id v4 = [(CREngineAccurate *)self textDetectorResultsForImage:a3 trackingSession:0 error:a4];
  return v4;
}

- (id)textDetectorResultsForImage:(id)a3 trackingSession:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CREngineAccurate *)self ocrDetector];
  uint64_t v11 = [v10 detectInImage:v8 trackingSession:v9 error:a5];

  return v11;
}

+ (id)supportedLanguagesForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v5 = +[CRRecognizerConfiguration supportedLanguagesForVersion:a3];
  id v6 = (void *)v5;
  if (a4 && !v5)
  {
    *a4 = +[CRImageReader errorWithErrorCode:-4];
  }
  return v6;
}

+ (id)supportedComputeDevicesForRevision:(int64_t)a3
{
  os_signpost_id_t v3 = +[CRComputeDeviceUtilities allComputeDevices];
  id v4 = +[CRComputeDeviceUtilities computeDevices:v3 ofTypes:7];

  return v4;
}

+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 extendedTimeoutBlock:(id)a5 error:(id *)a6
{
  return 1;
}

+ (CGSize)detectorImageSizeForOptions:(id)a3 imageSize:(CGSize)a4
{
  +[CRNeuralTextDetector scaledImageSizeForOptions:imageSize:](CRNeuralTextDetector, "scaledImageSizeForOptions:imageSize:", a3, a4.width, a4.height);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CREngineAccurate *)self ocrRecognizer];
  id v9 = [v8 thresholdsForTextRegion:v6 withLocale:v7];

  return v9;
}

- (id)trackingResultOnSession:(id)a3 image:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (double *)a3;
  id v34 = a4;
  id v32 = a5;
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v11 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v13 = (id)CRSignpostLog_signPostOSLog;
  BOOL v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    uint64_t v15 = objc_msgSend(v10, "latestResult", v32, v34);
    id v16 = [v15 trackedRegions];
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v16 count];
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "OCRTrackingE2E", "tracked quads: %d", (uint8_t *)&buf, 8u);
  }
  id v17 = objc_initWeak(&buf, v10);
  objc_sync_enter(v10);
  id v18 = objc_loadWeakRetained(&buf);
  [v18 setDidDispatchOCROnFrame:0];

  id v19 = objc_loadWeakRetained(&buf);
  [v19 setDidRunAssociationOnFrame:0];

  id v20 = objc_loadWeakRetained(&buf);
  -[CRImageReaderTrackingSession applyOpticalFlowTrackingForFrame:]((uint64_t)v20, v34);

  objc_sync_exit(v10);
  if (-[CRImageReaderTrackingSession shouldRunOCROnCurrentFrame]((uint64_t)v10))
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __64__CREngineAccurate_trackingResultOnSession_image_options_error___block_invoke;
    v35[3] = &unk_1E6CDBD08;
    v35[4] = self;
    id v36 = v34;
    objc_copyWeak(v39, &buf);
    v39[1] = a6;
    id v37 = v32;
    int v21 = v10;
    v38 = v21;
    if (-[CRImageReaderTrackingSession dispatchIfReady:]((uint64_t)v21, v35))
    {
      [v21 setDidDispatchOCROnFrame:1];
      -[CRImageReaderTrackingSession prepareSessionForOCRDispatch]((uint64_t)v21);
    }

    objc_destroyWeak(v39);
  }
  if (objc_msgSend(v10, "usesGroupedRegions", v32))
  {
    uint64_t v22 = [v10 latestResult];
    __int16 v23 = [v22 regionTrackingGroups];
    +[CRTrackedDocumentOutputRegion documentWithTrackedRegionGroups:v23];
  }
  else
  {
    uint64_t v22 = [v10 latestResult];
    __int16 v23 = [v22 trackedRegions];
    +[CRTrackedDocumentOutputRegion documentWithTrackedRegions:v23];
  id v24 = };

  double Current = CFAbsoluteTimeGetCurrent();
  if (v10) {
    uint8_t v10[16] = Current;
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v26 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v27 = v26;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    unint64_t v28 = [v10 latestResult];
    id v29 = [v28 trackedRegions];
    int v30 = [v29 count];
    *(_DWORD *)uint64_t v40 = 67109120;
    int v41 = v30;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v27, OS_SIGNPOST_INTERVAL_END, v12, "OCRTrackingE2E", "tracked quads: %d", v40, 8u);
  }
  objc_destroyWeak(&buf);

  return v24;
}

void __64__CREngineAccurate_trackingResultOnSession_image_options_error___block_invoke(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  double v4 = (id)CRSignpostLog_signPostOSLog;
  double v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRE2EDetectionTime", "", buf, 2u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v10 = [v6 textDetectorResultsForImage:v7 trackingSession:WeakRetained error:*(void *)(a1 + 72)];

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v11 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v12, OS_SIGNPOST_INTERVAL_END, v3, "OCRE2EDetectionTime", "", buf, 2u);
  }

  id v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"CRImageReaderDetectionOnly"];
  char v14 = [v13 BOOLValue];

  if (v14)
  {
    uint64_t v15 = objc_opt_new();
    id v16 = [*(id *)(a1 + 32) textGroupingStats];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __64__CREngineAccurate_trackingResultOnSession_image_options_error___block_invoke_81;
    v50[3] = &unk_1E6CDBCE0;
    id v51 = v10;
    id v17 = v15;
    uint64_t v18 = *(void *)(a1 + 32);
    id v52 = v17;
    uint64_t v53 = v18;
    [v16 measureBlock:v50];

    id v19 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) size];
    id v20 = objc_msgSend(v19, "_documentOutputRegionResult:imageSize:", v17);
  }
  else
  {
    id v20 = [*(id *)(a1 + 32) resultDocumentForDetectionResult:v10 image:*(void *)(a1 + 40) options:0 progressHandler:0 error:*(void *)(a1 + 72)];
  }
  id v21 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v22 = -[CRImageReaderTrackingSession trackedRegionType]((uint64_t)v21);
  id v23 = objc_loadWeakRetained((id *)(a1 + 64));
  id v24 = objc_msgSend(v20, "trackingDocumentWithTrackedType:includeLines:", v22, objc_msgSend(v23, "shouldIncludeLinesInTrackingResult"));

  id v25 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_sync_enter(v25);
  uint64_t v26 = (char *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v27 = v26;
  if (v26)
  {
    objc_copyStruct(buf, v26 + 208, 48, 1, 0);
    long long v41 = *(_OWORD *)buf;
    long long v44 = v55;
    long long v47 = v56;
  }
  else
  {
    long long v44 = 0u;
    long long v47 = 0u;
    long long v41 = 0u;
  }
  unint64_t v28 = (char *)objc_loadWeakRetained((id *)(a1 + 64));
  id v29 = v28;
  *(_OWORD *)id buf = v41;
  long long v55 = v44;
  long long v56 = v47;
  if (v28) {
    objc_copyStruct(v28 + 256, buf, 48, 1, 0);
  }

  if (v24)
  {
    id v30 = objc_loadWeakRetained((id *)(a1 + 64));
    v31 = [v30 latestResult];
    id v32 = (char *)objc_loadWeakRetained((id *)(a1 + 64));
    v33 = v32;
    if (v32)
    {
      objc_copyStruct(buf, v32 + 256, 48, 1, 0);
      uint64_t v34 = objc_msgSend(*(id *)(a1 + 56), "usesGroupedRegions", *(void *)buf, *(void *)&buf[8], v55, v56);
    }
    else
    {
      uint64_t v34 = objc_msgSend(*(id *)(a1 + 56), "usesGroupedRegions", 0, 0, 0, 0, 0, 0);
    }
    v35 = objc_msgSend(v31, "resultByUpdatingWithDocument:sceneHomography:usesGroupedRegions:", v24, v34, v42, v45, v48);
    id v36 = objc_loadWeakRetained(v8);
    [v36 setLatestResult:v35];

    id v37 = objc_loadWeakRetained(v8);
    [v37 setDidRunAssociationOnFrame:1];

    long long v46 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    long long v49 = *MEMORY[0x1E4F14998];
    long long v43 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
    v38 = (char *)objc_loadWeakRetained(v8);
    v39 = v38;
    *(_OWORD *)id buf = v49;
    long long v55 = v46;
    long long v56 = v43;
    if (v38) {
      objc_copyStruct(v38 + 208, buf, 48, 1, 0);
    }

    id v40 = objc_loadWeakRetained(v8);
    -[CRImageReaderTrackingSession saveQuadsAfterAssociation]((uint64_t)v40);
  }
  objc_sync_exit(v25);
}

void __64__CREngineAccurate_trackingResultOnSession_image_options_error___block_invoke_81(id *a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  double v4 = (id)CRSignpostLog_signPostOSLog;
  double v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTextGroupingTime", "", buf, 2u);
  }

  id v6 = [a1[4] lines];

  if (v6)
  {
    uint64_t v7 = [a1[6] ocrRecognizer];
    id v8 = [v7 configuration];
    id v9 = [v8 textFeatureOrder];
    uint64_t v10 = [a1[4] lines];
    uint64_t v11 = [v9 orderAndGroupRegions:v10];
    [a1[5] setBlocks:v11];
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  os_signpost_id_t v12 = (id)CRSignpostLog_signPostOSLog;
  id v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)char v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRTextGroupingTime", "", v14, 2u);
  }
}

- (id)resultDocumentInImage:(id)a3 options:(id)a4 trackingSession:(id)a5 withProgressHandler:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void (**)(id, void, double))a6;
  if (v14)
  {
    id v16 = [(CREngineAccurate *)self ocrRecognizer];
    uint64_t v17 = [v16 keepAllResourcesLoadedWhenNotInUse];

    uint64_t v18 = [(CREngineAccurate *)self ocrRecognizer];
    [v18 setKeepAllResourcesLoadedWhenNotInUse:1];

    id v19 = [(CREngineAccurate *)self trackingResultOnSession:v14 image:v12 options:v13 error:a7];
    id v20 = [(CREngineAccurate *)self ocrRecognizer];
    [v20 setKeepAllResourcesLoadedWhenNotInUse:v17];
  }
  else
  {
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    id v21 = (id)CRSignpostLog_signPostOSLog;
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    id v23 = (id)CRSignpostLog_signPostOSLog;
    id v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "OCRE2EDetectionTime", "", buf, 2u);
    }

    id v36 = objc_opt_new();
    id v25 = [(CREngineAccurate *)self textDetectorResultsForImage:v12 trackingSession:0 error:a7];
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    uint64_t v26 = (id)CRSignpostLog_signPostOSLog;
    uint64_t v27 = v26;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v27, OS_SIGNPOST_INTERVAL_END, v22, "OCRE2EDetectionTime", "", buf, 2u);
    }

    id v20 = v36;
    if (v15 && v25) {
      v15[2](v15, 0, 0.5);
    }
    if ([(CREngineAccurate *)self shouldCancel])
    {
      if (a7)
      {
        +[CRImageReader errorWithErrorCode:-3];
        id v19 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = 0;
      }
    }
    else
    {
      unint64_t v28 = [v13 objectForKeyedSubscript:@"CRImageReaderDetectionOnly"];
      char v29 = [v28 BOOLValue];

      if (v29)
      {
        id v30 = [(CREngineAccurate *)self textGroupingStats];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __92__CREngineAccurate_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke_2;
        v37[3] = &unk_1E6CDBCE0;
        id v31 = v25;
        id v38 = v31;
        id v32 = v36;
        id v39 = v32;
        id v40 = self;
        [v30 measureBlock:v37];

        [v12 size];
        id v19 = -[CREngineAccurate _documentOutputRegionResult:imageSize:](self, "_documentOutputRegionResult:imageSize:", v32);
        v33 = [(CREngineAccurate *)self _detectorDebugDataForResult:v31];
        [v19 setDetectorResults:v33];
      }
      else
      {
        if (v15)
        {
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __92__CREngineAccurate_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke;
          v41[3] = &unk_1E6CDBD30;
          double v42 = v15;
          int v43 = 1056964608;
          uint64_t v34 = (void *)MEMORY[0x1E01BFAC0](v41);
        }
        else
        {
          uint64_t v34 = 0;
        }
        id v19 = [(CREngineAccurate *)self resultDocumentForDetectionResult:v25 image:v12 options:v13 progressHandler:v34 error:a7];
      }
    }
  }
  return v19;
}

uint64_t __92__CREngineAccurate_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 * 0.5 + *(float *)(a1 + 40));
}

void __92__CREngineAccurate_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke_2(id *a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  double v4 = (id)CRSignpostLog_signPostOSLog;
  double v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTextGroupingTime", "", buf, 2u);
  }

  id v6 = [a1[4] lines];

  if (v6)
  {
    uint64_t v7 = [a1[6] ocrRecognizer];
    id v8 = [v7 configuration];
    id v9 = [v8 textFeatureOrder];
    uint64_t v10 = [a1[4] lines];
    uint64_t v11 = [v9 orderAndGroupRegions:v10];
    [a1[5] setBlocks:v11];
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v12 = (id)CRSignpostLog_signPostOSLog;
  id v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRTextGroupingTime", "", v14, 2u);
  }
}

- (id)_documentOutputRegionResult:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v39 = objc_opt_new();
  char v29 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = [v30 blocks];
  uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v33)
  {
    uint64_t v34 = 0;
    uint64_t v32 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = v6;
          uint64_t v7 = objc_opt_new();
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v37 = [v35 cells];
          uint64_t v8 = [v37 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v42 != v9) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                id v12 = [(CREngineAccurate *)self _blockFromGroup:v11 engineResult:0 titleRegion:0 canWrapToNextBlock:0];
                [v39 addObject:v12];
                id v13 = [CRTableCellOutputRegion alloc];
                id v14 = [v11 boundingQuad];
                uint64_t v15 = [v11 rows];
                uint64_t v17 = v16;
                uint64_t v18 = [v11 columns];
                id v20 = -[CRTableCellOutputRegion initWithBlock:quad:rowRange:colRange:](v13, "initWithBlock:quad:rowRange:colRange:", v12, v14, v15, v17, v18, v19);

                [v7 addObject:v20];
              }
              uint64_t v8 = [v37 countByEnumeratingWithState:&v41 objects:v49 count:16];
            }
            while (v8);
          }

          id v21 = [CRTableOutputRegion alloc];
          os_signpost_id_t v22 = [v35 boundingQuad];
          id v23 = [v35 rowQuads];
          id v24 = [v35 columnQuads];
          id v25 = [(CRTableOutputRegion *)v21 initWithCells:v7 quad:v22 rowQuads:v23 colQuads:v24];

          [v29 addObject:v25];
        }
        else
        {
          id v40 = v34;
          id v35 = [(CREngineAccurate *)self _blockFromGroup:v6 engineResult:v30 titleRegion:&v40 canWrapToNextBlock:1];
          id v26 = v40;

          [v39 addObject:v35];
          uint64_t v34 = v26;
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v33);
  }
  else
  {
    uint64_t v34 = 0;
  }

  uint64_t v27 = +[CRDocumentOutputRegion documentWithRegions:title:confidence:imageSize:](CRDocumentOutputRegion, "documentWithRegions:title:confidence:imageSize:", v39, v34, 2, width, height);
  [v27 setTableRegions:v29];
  objc_msgSend(v27, "collectMetadataForNumFilteredRegions:", objc_msgSend(v30, "filteredFeatureCount"));

  return v27;
}

- (id)_detectorDebugDataForResult:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  long long v46 = objc_alloc_init(CRTextDetectorResults);
  long long v49 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obunint64_t j = [v47 lines];
  uint64_t v3 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v51 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v7 = [CRTextFeature alloc];
        uint64_t v8 = [v6 boundingQuad];
        [v8 topLeft];
        double v10 = v9;
        double v12 = v11;
        id v13 = [v6 boundingQuad];
        [v13 topRight];
        double v15 = v14;
        double v17 = v16;
        uint64_t v18 = [v6 boundingQuad];
        [v18 bottomLeft];
        double v20 = v19;
        double v22 = v21;
        id v23 = [v6 boundingQuad];
        [v23 bottomRight];
        id v26 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:](v7, "initWithTopLeft:topRight:bottomLeft:bottomRight:", v10, v12, v15, v17, v20, v22, v24, v25);

        -[CRTextFeature setNmsOutputScale:](v26, "setNmsOutputScale:", [v6 nmsOutputScale]);
        -[CRTextFeature setTextType:](v26, "setTextType:", [v6 textType]);
        uint64_t v27 = [v6 scriptCategoryResults];
        [(CRTextFeature *)v26 setScriptCategoryResults:v27];

        unint64_t v28 = [v6 scriptCategoryCounts];
        [(CRTextFeature *)v26 setScriptCounts:v28];

        char v29 = [v6 topScriptCategory];
        [(CRTextFeature *)v26 setSelectedScriptCategory:v29];

        [v49 addObject:v26];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v3);
  }

  id v30 = [v47 pyramidScaleSize];
  [(CRTextDetectorResults *)v46 setPyramidScaleSize:v30];

  id v31 = [v47 pyramidScaleName];
  [(CRTextDetectorResults *)v46 setPyramidScaleName:v31];

  uint64_t v32 = [v47 pyramidPreIntraScaleNMSTextFeatures];
  [(CRTextDetectorResults *)v46 setPyramidPreIntraScaleNMSTextFeatures:v32];

  [(CRTextDetectorResults *)v46 setTextFeatures:v49];
  if (v47)
  {
    uint64_t v33 = (void *)[v47 tableRegions];
    if (v33[1] != *v33)
    {
      uint64_t v34 = (void *)MEMORY[0x1E4F1CA48];
      id v35 = (void *)[v47 tableRegions];
      id v36 = [v34 arrayWithCapacity:(uint64_t)(v35[1] - *v35) >> 3];
      for (unint64_t j = 0; ; ++j)
      {
        id v38 = objc_msgSend(v47, "tableRegions", v46);
        if (j >= (uint64_t)(v38[1] - *v38) >> 3) {
          break;
        }
        id v39 = *(id *)(*(void *)[v47 tableRegions] + 8 * j);
        id v40 = [CRTableOutputRegion alloc];
        long long v41 = objc_opt_new();
        long long v42 = objc_opt_new();
        long long v43 = objc_opt_new();
        long long v44 = [(CRTableOutputRegion *)v40 initWithCells:v41 quad:v39 rowQuads:v42 colQuads:v43];

        [v36 addObject:v44];
      }
      [(CRTextDetectorResults *)v46 setDetectedTables:v36];
    }
  }

  return v46;
}

- (id)_titleRegionFromRegions:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  if (![v59 count])
  {
    id v21 = 0;
    goto LABEL_56;
  }
  std::vector<float>::vector(&v74, [v59 count]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v4 = v59;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v5)
  {
    int v6 = 0;
    uint64_t v7 = *(void *)v71;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v71 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = [*(id *)(*((void *)&v70 + 1) + 8 * v8) boundingQuad];
        [v10 size];
        double v12 = v11;

        float v13 = v12;
        int v6 = v9 + 1;
        *((float *)v74 + v9) = v13;
        ++v8;
        ++v9;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v5);
  }

  __p = 0;
  id v68 = 0;
  uint64_t v69 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v74, (uint64_t)v75, (v75 - (unsigned char *)v74) >> 2);
  std::__sort<std::__less<float,float> &,float *>();
  float v14 = *(float *)((char *)__p + (((v68 - (unsigned char *)__p) >> 1) & 0xFFFFFFFFFFFFFFFCLL));
  v66[0] = 0;
  v66[1] = 0;
  unint64_t v64 = 0;
  v65 = (uint64_t *)v66;
  double v15 = v74;
  double v16 = v75;
  if (v74 == v75) {
    goto LABEL_27;
  }
  unint64_t v17 = 0;
  double v18 = v14 * 1.7;
  float v19 = v18;
  int v20 = -1;
  do
  {
    LODWORD(v18) = *v15;
    if (*(float *)v15 > v19)
    {
      std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v65, &v64, (uint64_t *)&v64);
      unint64_t v17 = v64;
      if (v20 == -1) {
        int v20 = v64;
      }
    }
    unint64_t v64 = ++v17;
    ++v15;
  }
  while (v15 != v16);
  if (v20 == -1) {
    goto LABEL_27;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", v20, v18);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  double v22 = [(CREngineAccurate *)self ocrRecognizer];
  id v23 = [v22 titleParametersForTextRegion:v21];

  double v24 = [v21 boundingQuad];
  [v24 bottomLeft];
  if (v25 >= 0.5) {
    goto LABEL_25;
  }
  id v26 = [v21 boundingQuad];
  [v26 bottomRight];
  if (v27 >= 0.5)
  {
LABEL_24:

LABEL_25:
LABEL_26:

LABEL_27:
    unint64_t v64 = 0;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v23 = v4;
    uint64_t v36 = [v23 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v61;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v61 != v37) {
            objc_enumerationMutation(v23);
          }
          id v39 = *(void **)(*((void *)&v60 + 1) + 8 * v38);
          id v40 = [(CREngineAccurate *)self ocrRecognizer];
          long long v41 = [v40 titleParametersForTextRegion:v39];

          long long v42 = [v39 text];
          unint64_t v43 = [v42 length];
          if (v43 >= [v41 minTitleLength])
          {
            [v39 activationProbability];
            double v45 = v44;
            [v41 minTitleProbability];
            if (v45 > v46)
            {

LABEL_51:
              id v21 = v39;

              goto LABEL_52;
            }
          }
          id v47 = v66[0];
          if (!v66[0]) {
            goto LABEL_43;
          }
          long long v48 = v66;
          do
          {
            long long v49 = v47;
            long long v50 = v48;
            unint64_t v51 = v47[4];
            long long v52 = v47 + 1;
            if (v51 >= v64)
            {
              long long v52 = v49;
              long long v48 = (void **)v49;
            }
            id v47 = (void *)*v52;
          }
          while (v47);
          if (v48 == v66) {
            goto LABEL_43;
          }
          if (v51 < v64) {
            long long v49 = v50;
          }
          if (v64 >= v49[4])
          {
            [v39 activationProbability];
            double v54 = v53;
            [v41 minTitleProbability];
            BOOL v56 = v54 > v55;

            if (v56) {
              goto LABEL_51;
            }
          }
          else
          {
LABEL_43:
          }
          ++v64;

          ++v38;
        }
        while (v38 != v36);
        uint64_t v57 = [v23 countByEnumeratingWithState:&v60 objects:v76 count:16];
        uint64_t v36 = v57;
      }
      while (v57);
    }
    id v21 = 0;
    goto LABEL_52;
  }
  unint64_t v28 = [v21 boundingQuad];
  [v28 topLeft];
  if (v29 >= 0.5)
  {

    goto LABEL_24;
  }
  id v30 = [v21 boundingQuad];
  [v30 topRight];
  BOOL v32 = v31 < 0.5;

  if (!v32) {
    goto LABEL_26;
  }
  [v21 activationProbability];
  double v34 = v33;
  [v23 minTitleProbability];
  if (v34 <= v35) {
    goto LABEL_26;
  }
LABEL_52:

  std::__tree<CRCHuint128>::destroy((uint64_t)&v65, v66[0]);
  if (__p)
  {
    id v68 = __p;
    operator delete(__p);
  }
  if (v74)
  {
    v75 = v74;
    operator delete(v74);
  }
LABEL_56:

  return v21;
}

- (CRPerformanceStatistics)recognizerStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRecognizerStats:(id)a3
{
}

- (CRPerformanceStatistics)lineWrappingStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLineWrappingStats:(id)a3
{
}

- (CRPerformanceStatistics)tableStructureRecognitionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTableStructureRecognitionStats:(id)a3
{
}

- (CRPerformanceStatistics)formAnalyzerStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFormAnalyzerStats:(id)a3
{
}

- (CRPerformanceStatistics)formDetectionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFormDetectionStats:(id)a3
{
}

- (CRPerformanceStatistics)formPostProcessingStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFormPostProcessingStats:(id)a3
{
}

- (CRNeuralTextDetector)ocrDetector
{
  return (CRNeuralTextDetector *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOcrDetector:(id)a3
{
}

- (CRMultiModelTextRecognizer)ocrRecognizer
{
  return (CRMultiModelTextRecognizer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOcrRecognizer:(id)a3
{
}

- (CRLineWrapper)lineWrapper
{
  return (CRLineWrapper *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLineWrapper:(id)a3
{
}

- (CRTableStructureRecognizer)tableStructureRecognizer
{
  return (CRTableStructureRecognizer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTableStructureRecognizer:(id)a3
{
}

- (CRFormAnalyzer)formAnalyzer
{
  return (CRFormAnalyzer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFormAnalyzer:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOptions:(id)a3
{
}

- (unint64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(unint64_t)a3
{
  self->_revision = a3;
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (MLComputeDeviceProtocol)requestedComputeDevice
{
  return (MLComputeDeviceProtocol *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRequestedComputeDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedComputeDevice, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_formAnalyzer, 0);
  objc_storeStrong((id *)&self->_tableStructureRecognizer, 0);
  objc_storeStrong((id *)&self->_lineWrapper, 0);
  objc_storeStrong((id *)&self->_ocrRecognizer, 0);
  objc_storeStrong((id *)&self->_ocrDetector, 0);
  objc_storeStrong((id *)&self->_formPostProcessingStats, 0);
  objc_storeStrong((id *)&self->_formDetectionStats, 0);
  objc_storeStrong((id *)&self->_formAnalyzerStats, 0);
  objc_storeStrong((id *)&self->_tableStructureRecognitionStats, 0);
  objc_storeStrong((id *)&self->_lineWrappingStats, 0);
  objc_storeStrong((id *)&self->_recognizerStats, 0);
}

@end