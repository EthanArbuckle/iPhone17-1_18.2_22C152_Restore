@interface CRFormAnalyzer
+ (void)_saveAllDebugImagesForRegions:(id)a3 image:(id)a4 afterPostProcessing:(BOOL)a5;
+ (void)_saveDebugImageForRegions:(id)a3 image:(id)a4 suffix:(id)a5 displayTypes:(BOOL)a6;
- (BOOL)shouldRunDetectionForDocument:(id)a3;
- (CRFormAnalyzer)initWithConfiguration:(id)a3 error:(id *)a4 detectionStats:(id)a5 postProcessingStats:(id)a6;
- (CRFormAnalyzerConfiguration)configuration;
- (CRFormContourBasedDetector)contourBasedDetector;
- (CRFormDetector)modelDetector;
- (CRFormPostProcessingManager)postProcessingManager;
- (CRFormTextBasedDetector)textBasedDetector;
- (CRPerformanceStatistics)formDetectionStats;
- (CRPerformanceStatistics)formPostProcessingStats;
- (id)fetchSerializedResultsForImage:(id)a3;
- (void)analyzeImage:(id)a3 outputRegion:(id)a4;
- (void)exportSerializedResults:(id)a3 forImage:(id)a4;
@end

@implementation CRFormAnalyzer

- (CRFormAnalyzer)initWithConfiguration:(id)a3 error:(id *)a4 detectionStats:(id)a5 postProcessingStats:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CRFormAnalyzer;
  v14 = [(CRFormAnalyzer *)&v26 init];
  v15 = v14;
  v16 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    if ([v11 useModelBasedDetection])
    {
      v17 = [[CRFormDetector alloc] initWithConfiguration:v11 error:a4];
      modelDetector = v16->_modelDetector;
      v16->_modelDetector = v17;
    }
    if ([v11 useContourBasedDetection])
    {
      v19 = [[CRFormContourBasedDetector alloc] initWithConfiguration:v11 error:a4];
      contourBasedDetector = v16->_contourBasedDetector;
      v16->_contourBasedDetector = v19;
    }
    if ([v11 useTextBasedDetection])
    {
      v21 = [[CRFormTextBasedDetector alloc] initWithConfiguration:v11 error:a4];
      textBasedDetector = v16->_textBasedDetector;
      v16->_textBasedDetector = v21;
    }
    uint64_t v23 = +[CRFormPostProcessingManager postProcessingManagerWithDefaultSequence];
    postProcessingManager = v16->_postProcessingManager;
    v16->_postProcessingManager = (CRFormPostProcessingManager *)v23;

    objc_storeStrong((id *)&v15->_formDetectionStats, a5);
    objc_storeStrong((id *)&v15->_formPostProcessingStats, a6);
  }

  return v16;
}

+ (void)_saveDebugImageForRegions:(id)a3 image:(id)a4 suffix:(id)a5 displayTypes:(BOOL)a6
{
  BOOL v6 = a6;
  v89[1] = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v9 = a4;
  id v66 = a5;
  CGColorRef GenericRGB = CGColorCreateGenericRGB(0.2, 0.2, 1.0, 0.8);
  CGColorRef v65 = CGColorCreateGenericRGB(0.6, 0.6, 0.6, 0.8);
  id v10 = v9;
  v69 = v10;
  if (v6)
  {
    uint64_t v88 = *MEMORY[0x1E4F24740];
    uint64_t v11 = v88;
    v89[0] = GenericRGB;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
    v72 = (void *)[v12 mutableCopy];

    uint64_t v86 = v11;
    CGColorRef v87 = v65;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    v78 = (void *)[v13 mutableCopy];

    v68 = objc_opt_new();
    v76 = objc_opt_new();
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id obj = v67;
    uint64_t v14 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
    if (v14)
    {
      uint64_t v71 = 1;
      uint64_t v74 = *MEMORY[0x1E4F243F0];
      uint64_t v75 = *(void *)v82;
      do
      {
        uint64_t v77 = v14;
        for (uint64_t i = 0; i != v77; ++i)
        {
          if (*(void *)v82 != v75) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          v17 = CRCastAsClass<CRFormFieldOutputRegion>(v16);
          v18 = v17;
          if (v17)
          {
            v19 = [v17 labelRegion];
            BOOL v20 = v19 == 0;

            if (!v20)
            {
              v21 = [v18 labelRegion];
              [v68 addObject:v21];
            }
          }
          if ([v16 fieldType] == 1) {
            uint64_t v22 = [v16 textContentType];
          }
          else {
            uint64_t v22 = 0;
          }
          uint64_t v23 = +[CRFormContentTypeUtilities stringFromContentType:v22];
          v80 = [v23 stringByReplacingOccurrencesOfString:@"CRFormContentType" withString:&stru_1F38EED68];

          if (v18)
          {
            v24 = [v18 labelRegion];
            v25 = [v24 text];
            objc_super v26 = [v18 labelRegion];
            v27 = [v26 text];
            unint64_t v28 = [v27 length];
            if (v28 >= 0xA) {
              uint64_t v29 = 10;
            }
            else {
              uint64_t v29 = v28;
            }
            v79 = [v25 substringToIndex:v29];
          }
          else
          {
            v79 = 0;
          }
          v30 = @"×";
          if ([v16 fieldType] == 1)
          {
            [v16 suggestedLineHeight];
            double v32 = v31 * (double)(unint64_t)[v69 height] * 0.75;
            CTFontRef v33 = CTFontCreateWithName(@"Menlo", v32, 0);
            if (v33)
            {
              [v72 setObject:v33 forKeyedSubscript:v74];
            }
            CTFontRef v34 = CTFontCreateWithName(@"Menlo", v32, 0);
            if (v34)
            {
              [v78 setObject:v34 forKeyedSubscript:v74];
            }
            uint64_t v35 = v71 + i;
            v36 = NSString;
            if (v79) {
              v37 = v79;
            }
            else {
              v37 = &stru_1F38EED68;
            }
            if (v18)
            {
              v38 = [v18 labelRegion];
              uint64_t v39 = [v38 recognizedLocale];
              v40 = (void *)v39;
              v41 = &stru_1F38EED68;
              if (v39) {
                v41 = (__CFString *)v39;
              }
              v73 = v41;
              if (v33) {
                CGFloat Size = CTFontGetSize(v33);
              }
              else {
                CGFloat Size = 0.0;
              }
              v30 = [v36 stringWithFormat:@"%lu: %@ (%@) (%@) %3.1f [%d, %d]", v35, v80, v37, v73, *(void *)&Size, objc_msgSend(v16, "hasBoundedWidth"), objc_msgSend(v16, "hasBoundedHeight")];
            }
            else
            {
              if (v33) {
                CGFloat v43 = CTFontGetSize(v33);
              }
              else {
                CGFloat v43 = 0.0;
              }
              v30 = [v36 stringWithFormat:@"%lu: %@ (%@) %3.1f [%d, %d]", v35, v80, v37, *(void *)&v43, objc_msgSend(v16, "hasBoundedWidth"), objc_msgSend(v16, "hasBoundedHeight")];
            }
          }
          if (+[CRFormContentTypeUtilities contentTypeIsAutoFillable:](CRFormContentTypeUtilities, "contentTypeIsAutoFillable:", v22)&& ([v16 autofillNewContextStart] & 1) == 0)
          {
            id v44 = objc_alloc(MEMORY[0x1E4F28B18]);
            v45 = v72;
          }
          else
          {
            id v44 = objc_alloc(MEMORY[0x1E4F28B18]);
            v45 = v78;
          }
          v46 = (void *)[v44 initWithString:v30 attributes:v45];
          [v76 addObject:v46];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
        v71 += i;
      }
      while (v14);
    }

    v47 = [v69 imageByOverlayingRegions:obj strings:v76 lineWidth:2.0 red:0.2 green:0.2 blue:1.0 alpha:0.8];

    v48 = [v47 imageByOverlayingRegions:v68 strings:0 lineWidth:2.0 red:0.2 green:1.0 blue:0.2 alpha:0.8];

    v49 = [v69 url];
    v50 = [v49 URLByDeletingPathExtension];
    v51 = [v50 lastPathComponent];
    v52 = v51;
    if (v51)
    {
      id v53 = v51;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"null%lu", objc_msgSend(v69, "hash"));
      id v53 = (id)objc_claimAutoreleasedReturnValue();
    }
    v62 = v53;

    v63 = [NSString stringWithFormat:@"/tmp/form_%@_%@.png", v62, v66];
    [v48 writeToFile:v63];
  }
  else
  {
    v54 = v10;
    v48 = [v10 imageByOverlayingRegions:v67 strings:0 lineWidth:2.0 red:0.2 green:0.2 blue:1.0 alpha:0.8];

    v55 = [v54 url];
    v56 = [v55 URLByDeletingPathExtension];
    v57 = [v56 lastPathComponent];
    v58 = v57;
    if (v57)
    {
      id v59 = v57;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"null%lu", objc_msgSend(v69, "hash"));
      id v59 = (id)objc_claimAutoreleasedReturnValue();
    }
    v60 = v59;

    v61 = [NSString stringWithFormat:@"/tmp/form_%@_%@.png", v60, v66];
    [v48 writeToFile:v61];
  }
}

+ (void)_saveAllDebugImagesForRegions:(id)a3 image:(id)a4 afterPostProcessing:(BOOL)a5
{
  BOOL v5 = a5;
  id v20 = a3;
  v7 = (CRLogger *)a4;
  CRLogger = CRLogger::getCRLogger(v7);
  if (*CRLogger && (CRLogger[8] & 0x10) != 0)
  {
    id v9 = @"a_before_pp";
    if (v5) {
      id v9 = @"b_after_pp";
    }
    id v10 = v9;
    uint64_t v11 = [v20 _fieldsOfSource:1];
    id v12 = [v20 _fieldsOfSource:2];
    id v13 = [v20 _fieldsOfSource:3];
    uint64_t v14 = objc_opt_class();
    v15 = [@"mlfields_" stringByAppendingString:v10];
    [v14 _saveDebugImageForRegions:v11 image:v7 suffix:v15 displayTypes:0];

    v16 = objc_opt_class();
    v17 = [@"contourfields_" stringByAppendingString:v10];
    [v16 _saveDebugImageForRegions:v12 image:v7 suffix:v17 displayTypes:0];

    v18 = objc_opt_class();
    v19 = [@"textBasedfields_" stringByAppendingString:v10];
    [v18 _saveDebugImageForRegions:v13 image:v7 suffix:v19 displayTypes:0];

    if (v5) {
      [(id)objc_opt_class() _saveDebugImageForRegions:v11 image:v7 suffix:@"mlfields_with_types" displayTypes:1];
    }
  }
}

- (void)analyzeImage:(id)a3 outputRegion:(id)a4
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__15;
  v55[4] = __Block_byref_object_dispose__15;
  id v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__15;
  id v53 = __Block_byref_object_dispose__15;
  id v54 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__15;
  v47 = __Block_byref_object_dispose__15;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__15;
  v41 = __Block_byref_object_dispose__15;
  id v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__15;
  v35[4] = __Block_byref_object_dispose__15;
  id v36 = 0;
  formDetectionStats = self->_formDetectionStats;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __44__CRFormAnalyzer_analyzeImage_outputRegion___block_invoke;
  v27[3] = &unk_1E6CDBC18;
  v30 = &v43;
  v27[4] = self;
  id v9 = v6;
  id v28 = v9;
  id v10 = v7;
  id v29 = v10;
  double v31 = v55;
  double v32 = &v37;
  CTFontRef v33 = v35;
  CTFontRef v34 = &v49;
  [(CRPerformanceStatistics *)formDetectionStats measureBlock:v27];
  [(id)objc_opt_class() _saveAllDebugImagesForRegions:v50[5] image:v9 afterPostProcessing:0];
  v65[0] = @"ShouldSurfaceContourBasedFormFieldsOption";
  v65[1] = @"ShouldSurfaceTextBasedFormFieldsOption";
  v66[0] = MEMORY[0x1E4F1CC38];
  v66[1] = MEMORY[0x1E4F1CC38];
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
  formPostProcessingStats = self->_formPostProcessingStats;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __44__CRFormAnalyzer_analyzeImage_outputRegion___block_invoke_117;
  uint64_t v22 = &unk_1E6CDBC40;
  objc_super v26 = &v49;
  uint64_t v23 = self;
  id v13 = v10;
  id v24 = v13;
  id v14 = v11;
  id v25 = v14;
  [(CRPerformanceStatistics *)formPostProcessingStats measureBlock:&v19];
  objc_msgSend((id)objc_opt_class(), "_saveAllDebugImagesForRegions:image:afterPostProcessing:", v50[5], v9, 1, v19, v20, v21, v22, v23);
  v15 = CROSLogForCategory(6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [(id)v44[5] count];
    uint64_t v17 = [(id)v38[5] count];
    int v18 = [v13 formness];
    *(_DWORD *)buf = 136315906;
    v58 = "-[CRFormAnalyzer analyzeImage:outputRegion:]";
    __int16 v59 = 2048;
    uint64_t v60 = v16;
    __int16 v61 = 2048;
    uint64_t v62 = v17;
    __int16 v63 = 1024;
    int v64 = v18;
    _os_log_impl(&dword_1DD733000, v15, OS_LOG_TYPE_DEFAULT, "%s: %lu ML fields detected; %lu contour-based fields detected; formness: %d;",
      buf,
      0x26u);
  }

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(v55, 8);
}

void __44__CRFormAnalyzer_analyzeImage_outputRegion___block_invoke(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v4 = (id)CRSignpostLog_signPostOSLog;
  BOOL v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRFormDetection", "", buf, 2u);
  }

  id v6 = (void *)MEMORY[0x1E01BF820]();
  id v7 = [*(id *)(a1 + 32) modelDetector];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = [v7 detectFormFieldsInImage:v8 document:v9 outputCandidateResults:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    id v14 = [*(id *)(a1 + 32) contourBasedDetector];
    uint64_t v15 = [v14 detectFormFieldsInImage:*(void *)(a1 + 40)];
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    int v18 = [*(id *)(a1 + 32) textBasedDetector];
    uint64_t v19 = [v18 detectFormFieldsInImage:*(void *)(a1 + 40) document:*(void *)(a1 + 48) candidateFields:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v22) {
      uint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v23 = v22;
    id v24 = v23;
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v25 = objc_msgSend(v23, "arrayByAddingObjectsFromArray:");

      id v24 = (void *)v25;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      uint64_t v26 = objc_msgSend(v24, "arrayByAddingObjectsFromArray:");

      id v24 = (void *)v26;
    }
    uint64_t v27 = +[CRFormParser convertDetectedFields:v24];
    uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
    id v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v30 = (id)CRSignpostLog_signPostOSLog;
    double v31 = v30;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)double v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v31, OS_SIGNPOST_INTERVAL_END, v3, "OCRFormDetection", "", v32, 2u);
    }
  }
  else
  {
  }
}

void __44__CRFormAnalyzer_analyzeImage_outputRegion___block_invoke_117(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v4 = (id)CRSignpostLog_signPostOSLog;
  BOOL v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRFormPostProcessing", "", buf, 2u);
  }

  id v6 = (void *)MEMORY[0x1E01BF820]();
  id v7 = [*(id *)(a1 + 32) postProcessingManager];
  uint64_t v8 = [v7 process:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) document:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [*(id *)(a1 + 40) setFormFieldRegions:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v11 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v12, OS_SIGNPOST_INTERVAL_END, v3, "OCRFormPostProcessing", "", v13, 2u);
  }
}

- (void)exportSerializedResults:(id)a3 forImage:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 bufferHash];
  if (qword_1EB58CCA0 != -1) {
    dispatch_once(&qword_1EB58CCA0, &__block_literal_global_28);
  }
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"form_result_%lX.dat", v7);
  id v9 = (id)[v5 writeToFileInFolder:_MergedGlobals_28 basename:v8];
  uint64_t v10 = CROSLogForCategory(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[CRFormAnalyzer exportSerializedResults:forImage:]";
    __int16 v13 = 2112;
    uint64_t v14 = _MergedGlobals_28;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEBUG, "%s: Saving serialized result at location: %@/%@", buf, 0x20u);
  }
}

void __51__CRFormAnalyzer_exportSerializedResults_forImage___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  NSTemporaryDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = objc_msgSend(v0, "fileURLWithPath:");
  v2 = (void *)_MergedGlobals_28;
  _MergedGlobals_28 = v1;
}

- (id)fetchSerializedResultsForImage:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  uint64_t v3 = [v33 bufferHash];
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/AppleInternal/Library/Frameworks/CoreRecognitionToolkit.framework/"];
  double v32 = objc_msgSend(NSString, "stringWithFormat:", @"FormSerializedResults/form_result_%lX.dat", v3);
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"FormSerializedResults/form_result_%lX.dat", v3);
  uint64_t v35 = [v4 URLByAppendingPathComponent:v5];

  id v6 = CROSLogForCategory(6);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [v4 absoluteString];
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = "-[CRFormAnalyzer fetchSerializedResultsForImage:]";
    __int16 v40 = 2112;
    v41 = v7;
    __int16 v42 = 2112;
    uint64_t v43 = v32;
    _os_log_impl(&dword_1DD733000, v6, OS_LOG_TYPE_DEBUG, "%s: Attempting to fetch serialized result from location: %@/%@", buf, 0x20u);
  }
  id v37 = 0;
  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v35 options:0 error:&v37];
  id v34 = v37;
  if (v8) {
    goto LABEL_6;
  }
  id v9 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v10 = [NSString stringWithFormat:@"%@/Resources/", @"/AppleInternal/Library/Frameworks/CoreRecognitionToolkit.framework/"];
  uint64_t v11 = [v9 fileURLWithPath:v10];

  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"FormSerializedResults/form_result_%lX.dat", v3);
  __int16 v13 = [v11 URLByAppendingPathComponent:v12];

  id v36 = v34;
  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v13 options:0 error:&v36];
  id v14 = v36;

  if (v8)
  {
    v4 = v11;
    id v34 = v14;
    uint64_t v35 = v13;
LABEL_6:
    __int16 v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:0];
    uint64_t v16 = CROSLogForCategory(6);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v35 absoluteString];
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = "-[CRFormAnalyzer fetchSerializedResultsForImage:]";
      __int16 v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_DEBUG, "%s: Successfully fetched serialized result from location: %@", buf, 0x16u);
    }
    int v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    [v33 size];
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v23 = 0;
    uint64_t v24 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v25 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:]([CRNormalizedQuad alloc], "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", (double)v23 * 0.02 + 0.9, 0.9, (double)v23 * 0.02 + 0.91, 0.9, (double)v23 * 0.02 + 0.91, 0.91, (double)v23 * 0.02 + 0.9, 0.91, v20, v22);
      uint64_t v26 = [(CRFormFieldOutputRegion *)[CRFormTextFieldOutputRegion alloc] initWithQuad:v25 labelRegion:0 subFields:v24 source:1];
      [v18 addObject:v26];

      ++v23;
    }
    while (v23 != 3);
    uint64_t v27 = [v15 formFieldRegions];
    uint64_t v28 = [v27 arrayByAddingObjectsFromArray:v18];
    [v15 setFormFieldRegions:v28];

    goto LABEL_11;
  }
  int v18 = CROSLogForCategory(6);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v30 = [v13 absoluteString];
    double v31 = [v14 description];
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = "-[CRFormAnalyzer fetchSerializedResultsForImage:]";
    __int16 v40 = 2112;
    v41 = v30;
    __int16 v42 = 2112;
    uint64_t v43 = v31;
    _os_log_impl(&dword_1DD733000, v18, OS_LOG_TYPE_DEBUG, "%s: Unable to fetch serialized result from tentative location: %@, error = %@", buf, 0x20u);
  }
  uint64_t v8 = 0;
  __int16 v15 = 0;
  v4 = v11;
  id v34 = v14;
  uint64_t v35 = v13;
LABEL_11:

  return v15;
}

- (BOOL)shouldRunDetectionForDocument:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CRFormAnalyzer *)self configuration];
  char v6 = [v5 gatingWithOCRResults];

  if (v6)
  {
    uint64_t v7 = [v4 text];
    unint64_t v8 = [v7 length];

    if (v8 <= 0x4F)
    {
      log = CROSLogForCategory(6);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [v4 text];
        *(_DWORD *)buf = 136315394;
        id v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
        __int16 v67 = 2048;
        double v68 = COERCE_DOUBLE([v9 length]);
        _os_log_impl(&dword_1DD733000, log, OS_LOG_TYPE_DEBUG, "%s: Gated by character count %lu", buf, 0x16u);
      }
      BOOL v10 = 0;
      goto LABEL_55;
    }
    log = [v4 contentsWithTypes:8];
    if ((unint64_t)[log count] <= 3)
    {
      id v54 = CROSLogForCategory(6);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        id v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
        __int16 v67 = 2048;
        double v68 = COERCE_DOUBLE([log count]);
        _os_log_impl(&dword_1DD733000, v54, OS_LOG_TYPE_DEBUG, "%s: Gated by line count %lu", buf, 0x16u);
      }
LABEL_15:
      BOOL v10 = 0;
LABEL_54:

LABEL_55:
      goto LABEL_56;
    }
    id v54 = [v4 contentsWithTypes:2];
    if ((unint64_t)[v54 count] <= 1
      && (unint64_t)[log count] <= 7)
    {
      uint64_t v11 = CROSLogForCategory(6);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        id v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
        __int16 v67 = 2048;
        double v68 = COERCE_DOUBLE([v54 count]);
        __int16 v69 = 2048;
        double v70 = COERCE_DOUBLE([log count]);
        _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_DEBUG, "%s: Gated by block count %lu and line count %lu", buf, 0x20u);
      }

      goto LABEL_15;
    }
    __p = 0;
    uint64_t v62 = 0;
    unint64_t v63 = 0;
    std::vector<double>::reserve(&__p, [log count]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v12 = log;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v64 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v58;
      double v56 = 1.0;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 1.0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v58 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v20 = [v19 boundingQuad];
          [v20 topLeft];
          double v22 = v21;

          uint64_t v23 = [v19 boundingQuad];
          [v23 topRight];
          double v25 = v24;

          uint64_t v26 = [v19 boundingQuad];
          [v26 topLeft];
          double v28 = v27;

          id v29 = [v19 boundingQuad];
          [v29 bottomLeft];
          double v31 = v30;

          [v19 visualTextAngle];
          float v33 = fabsf(v32);
          id v34 = v62;
          if ((unint64_t)v62 >= v63)
          {
            id v36 = (double *)__p;
            int64_t v37 = ((char *)v62 - (unsigned char *)__p) >> 3;
            unint64_t v38 = v37 + 1;
            if ((unint64_t)(v37 + 1) >> 61) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v39 = v63 - (void)__p;
            if ((uint64_t)(v63 - (void)__p) >> 2 > v38) {
              unint64_t v38 = v39 >> 2;
            }
            if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v40 = v38;
            }
            if (v40)
            {
              v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v63, v40);
              id v36 = (double *)__p;
              id v34 = v62;
            }
            else
            {
              v41 = 0;
            }
            __int16 v42 = (double *)&v41[8 * v37];
            *__int16 v42 = v33;
            uint64_t v35 = v42 + 1;
            while (v34 != v36)
            {
              uint64_t v43 = *((void *)v34-- - 1);
              *((void *)v42-- - 1) = v43;
            }
            __p = v42;
            uint64_t v62 = v35;
            unint64_t v63 = (unint64_t)&v41[8 * v40];
            if (v36) {
              operator delete(v36);
            }
          }
          else
          {
            double *v62 = v33;
            uint64_t v35 = v34 + 1;
          }
          double v56 = fmin(v56, v22);
          double v15 = fmax(v15, v25);
          double v17 = fmin(v17, v28);
          double v16 = fmax(v16, v31);
          uint64_t v62 = v35;
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v64 count:16];
      }
      while (v13);

      if (v56 <= 0.5 && v17 <= 0.5)
      {
        if (v15 - v56 >= 0.22 && v16 - v17 >= 0.04)
        {
          unint64_t v44 = ((unint64_t)[v12 count] >> 1) - 1;
          uint64_t v45 = (double *)__p;
          v46 = (double *)((char *)__p + 8 * v44);
          if (v46 != v62)
          {
            std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>((uint64_t)__p, v46, v62);
            uint64_t v45 = (double *)__p;
          }
          double v47 = v45[v44];
          if (v47 <= 0.1)
          {
            char v48 = 1;
            goto LABEL_53;
          }
          uint64_t v49 = CROSLogForCategory(6);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
            __int16 v67 = 2048;
            double v68 = v47;
            v50 = "%s: Gated by insufficient horizontality in the text, median line deviation is %lf";
            uint64_t v51 = v49;
            uint32_t v52 = 22;
            goto LABEL_51;
          }
LABEL_52:

          char v48 = 0;
          BOOL v10 = 0;
          uint64_t v45 = (double *)__p;
          if (!__p) {
            goto LABEL_54;
          }
LABEL_53:
          uint64_t v62 = v45;
          operator delete(v45);
          BOOL v10 = v48;
          goto LABEL_54;
        }
        uint64_t v49 = CROSLogForCategory(6);
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_52;
        }
        *(_DWORD *)buf = 136315650;
        id v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
        __int16 v67 = 2048;
        double v68 = v15 - v56;
        __int16 v69 = 2048;
        double v70 = v16 - v17;
        v50 = "%s: Gated by x-range %lf and y-range %lf";
LABEL_50:
        uint64_t v51 = v49;
        uint32_t v52 = 32;
LABEL_51:
        _os_log_impl(&dword_1DD733000, v51, OS_LOG_TYPE_DEBUG, v50, buf, v52);
        goto LABEL_52;
      }
    }
    else
    {

      double v17 = 1.0;
      double v56 = 1.0;
    }
    uint64_t v49 = CROSLogForCategory(6);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_52;
    }
    *(_DWORD *)buf = 136315650;
    id v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
    __int16 v67 = 2048;
    double v68 = v56;
    __int16 v69 = 2048;
    double v70 = v17;
    v50 = "%s: Gated by min-x %lf and min-y %lf";
    goto LABEL_50;
  }
  BOOL v10 = 1;
LABEL_56:

  return v10;
}

- (CRFormAnalyzerConfiguration)configuration
{
  return self->_configuration;
}

- (CRFormDetector)modelDetector
{
  return self->_modelDetector;
}

- (CRFormContourBasedDetector)contourBasedDetector
{
  return self->_contourBasedDetector;
}

- (CRFormTextBasedDetector)textBasedDetector
{
  return self->_textBasedDetector;
}

- (CRFormPostProcessingManager)postProcessingManager
{
  return self->_postProcessingManager;
}

- (CRPerformanceStatistics)formDetectionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 48, 1);
}

- (CRPerformanceStatistics)formPostProcessingStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formPostProcessingStats, 0);
  objc_storeStrong((id *)&self->_formDetectionStats, 0);
  objc_storeStrong((id *)&self->_postProcessingManager, 0);
  objc_storeStrong((id *)&self->_textBasedDetector, 0);
  objc_storeStrong((id *)&self->_contourBasedDetector, 0);
  objc_storeStrong((id *)&self->_modelDetector, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end