@interface CREngineFast
+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 extendedTimeoutBlock:(id)a5 error:(id *)a6;
+ (id)supportedComputeDevicesForRevision:(int64_t)a3;
+ (id)supportedLanguagesForRevision:(int64_t)a3 error:(id *)a4;
- (BOOL)lmValidateProbability:(id)a3 options:(id)a4;
- (BOOL)noLMValidateProbability:(id)a3 options:(id)a4;
- (BOOL)shouldCancel;
- (BOOL)validateProbability:(id)a3 validRangeMin:(double)a4 validRangeMax:(double)a5 options:(id)a6;
- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4;
- (CREngineFast)initWithOptions:(id)a3 error:(id *)a4;
- (CRLanguageCorrection)languageCorrection;
- (CRPerformanceStatistics)languageCorrectionStats;
- (CRPerformanceStatistics)textRecognitionStats;
- (NSDictionary)options;
- (float)highConfidenceThreshold;
- (float)mediumConfidenceThreshold;
- (id)applyLanguageCorrectionToResults:(id)a3 image:(id)a4 latticeResults:(id *)a5 progressHandler:(id)a6;
- (id)computeDevice;
- (id)filterResultsForTextFeatures:(id)a3;
- (id)resultDocumentInImage:(id)a3 options:(id)a4 trackingSession:(id)a5 withProgressHandler:(id)a6 error:(id *)a7;
- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4;
- (unint64_t)revision;
- (void)setLanguageCorrection:(id)a3;
- (void)setLanguageCorrectionStats:(id)a3;
- (void)setOptions:(id)a3;
- (void)setRevision:(unint64_t)a3;
- (void)setShouldCancel:(BOOL)a3;
- (void)setTextRecognitionStats:(id)a3;
@end

@implementation CREngineFast

- (CREngineFast)initWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CREngineFast;
  v6 = [(CREngineFast *)&v23 init];
  v7 = v6;
  if (v6)
  {
    [(CREngineFast *)v6 setOptions:v5];
    [(CREngineFast *)v7 setShouldCancel:0];
    [(CREngineFast *)v7 setRevision:+[CRImageReader defaultRevisionNumber]];
    v8 = [v5 objectForKeyedSubscript:@"CRImageReaderRevisionKey"];

    if (v8)
    {
      v9 = [v5 objectForKey:@"CRImageReaderRevisionKey"];
      -[CREngineFast setRevision:](v7, "setRevision:", [v9 unsignedIntegerValue]);
    }
    v10 = [(CREngineFast *)v7 options];
    v11 = [v10 objectForKeyedSubscript:@"CRImageReaderDisableLanguageCorrection"];
    char v12 = [v11 BOOLValue];

    if ((v12 & 1) == 0)
    {
      v13 = +[CRImageReader languageSetFromOptionsDictionary:v5];
      v14 = [v13 firstObject];

      v15 = [CRLanguageCorrection alloc];
      uint64_t v16 = [(CREngineFast *)v7 revision];
      v17 = [(CREngineFast *)v7 options];
      v18 = [v17 objectForKeyedSubscript:@"CRImageReaderDynamicLexicon"];
      v19 = [(CRLanguageCorrection *)v15 initWithRevision:v16 localeCode:v14 customWords:v18];
      [(CREngineFast *)v7 setLanguageCorrection:v19];
    }
    v20 = [[CRPerformanceStatistics alloc] initWithName:@"Text Recognition" measureRecentPeak:0];
    [(CREngineFast *)v7 setTextRecognitionStats:v20];

    v21 = [[CRPerformanceStatistics alloc] initWithName:@"Language Correction" measureRecentPeak:0];
    [(CREngineFast *)v7 setLanguageCorrectionStats:v21];
  }
  return v7;
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double width = a4.width;
  double height = a4.height;
  result.double height = height;
  result.double width = width;
  return result;
}

+ (id)supportedLanguagesForRevision:(int64_t)a3 error:(id *)a4
{
  return +[CRLanguageCorrection supportedLanguagesForRevision:a3 error:a4];
}

+ (id)supportedComputeDevicesForRevision:(int64_t)a3
{
  v3 = +[CRComputeDeviceUtilities allComputeDevices];
  v4 = +[CRComputeDeviceUtilities computeDevices:v3 ofTypes:1];

  return v4;
}

+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 extendedTimeoutBlock:(id)a5 error:(id *)a6
{
  return 1;
}

- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4
{
  id v5 = [CRConfidenceThresholds alloc];
  [(CREngineFast *)self mediumConfidenceThreshold];
  int v7 = v6;
  [(CREngineFast *)self highConfidenceThreshold];
  LODWORD(v9) = v8;
  LODWORD(v10) = v7;
  v11 = [(CRConfidenceThresholds *)v5 initWithMediumThreshold:v10 highThreshold:v9];
  return v11;
}

- (float)mediumConfidenceThreshold
{
  v2 = [(CREngineFast *)self languageCorrection];

  float result = 0.8;
  if (v2) {
    return 0.25;
  }
  return result;
}

- (float)highConfidenceThreshold
{
  v2 = [(CREngineFast *)self languageCorrection];

  float result = 0.4;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (id)resultDocumentInImage:(id)a3 options:(id)a4 trackingSession:(id)a5 withProgressHandler:(id)a6 error:(id *)a7
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v54 = a4;
  v52 = v11;
  id v53 = a6;
  if (![(CREngineFast *)self shouldCancel])
  {
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__19;
    v72 = __Block_byref_object_dispose__19;
    id v73 = 0;
    v13 = [(CREngineFast *)self textRecognitionStats];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __88__CREngineFast_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke;
    v64[3] = &unk_1E6CDC3D8;
    v67 = &v68;
    id v14 = v11;
    id v65 = v14;
    id v15 = v54;
    id v66 = v15;
    [v13 measureBlock:v64];

    uint64_t v16 = [v15 objectForKeyedSubscript:@"CRImageReaderMinimumTextHeight"];
    [v16 floatValue];
    float v18 = v17;

    if (v18 > 0.0)
    {
      v19 = [MEMORY[0x1E4F1CA48] array];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v20 = [(id)v69[5] detectorResults];
      v21 = [v20 textFeatures];

      v50 = a7;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v60 objects:v75 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v61 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            objc_msgSend(v25, "calculateTextBoxHeightForImageWidth:imageHeight:", objc_msgSend(v14, "width"), objc_msgSend(v14, "height"));
            if ((float)(v26 / (float)(unint64_t)[v14 height]) >= v18) {
              [v19 addObject:v25];
            }
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v60 objects:v75 count:16];
        }
        while (v22);
      }

      a7 = v50;
      v27 = [(id)v69[5] detectorResults];
      [v27 setTextFeatures:v19];
    }
    if ([(CREngineFast *)self shouldCancel])
    {
      if (a7)
      {
        +[CRImageReader errorWithErrorCode:-3];
        char v12 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v12 = 0;
      }
LABEL_48:

      _Block_object_dispose(&v68, 8);
      goto LABEL_49;
    }
    v28 = [v15 objectForKey:@"CRImageReaderSaveLatticeInfo"];
    int v29 = [v28 BOOLValue];

    v30 = [v15 objectForKeyedSubscript:@"CRImageReaderDetectionOnly"];
    int v31 = [v30 BOOLValue];

    if (v31)
    {
      v32 = [(id)v69[5] detectorResults];
      v51 = [v32 textFeatures];
      id v49 = 0;
LABEL_33:

      if (v29)
      {
        v38 = [(id)v69[5] recognizerResults];
        [v38 setLatticeResults:v49];
      }
      if ([(CREngineFast *)self shouldCancel])
      {
        if (a7)
        {
          +[CRImageReader errorWithErrorCode:-3];
          char v12 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        v39 = [(id)v69[5] recognizerResults];
        [v39 setTextFeatures:v51];

        [(id)v69[5] setTextFeatures:v51];
        v40 = objc_opt_new();
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v41 = v51;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v74 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v56 != v43) {
                objc_enumerationMutation(v41);
              }
              uint64_t v45 = *(void *)(*((void *)&v55 + 1) + 8 * j);
              [v14 size];
              v46 = +[CRLineOutputRegion lineWithTextFeature:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:](CRLineOutputRegion, "lineWithTextFeature:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:", v45, 32, self, 0);
              [v40 addObject:v46];
            }
            uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v74 count:16];
          }
          while (v42);
        }

        [v14 size];
        char v12 = +[CRDocumentOutputRegion documentWithLines:title:confidence:imageSize:](CRDocumentOutputRegion, "documentWithLines:title:confidence:imageSize:", v40, 0, 2);
        v47 = [(id)v69[5] detectorResults];
        [v12 setDetectorResults:v47];
      }
      goto LABEL_48;
    }
    v33 = [(CREngineFast *)self languageCorrection];
    BOOL v34 = v33 == 0;

    v35 = (void *)v69[5];
    if (v34)
    {
      v32 = [v35 detectorResults];
      v36 = [v32 textFeatures];
      v51 = [(CREngineFast *)self filterResultsForTextFeatures:v36];
    }
    else
    {
      v32 = [v35 detectorResults];
      v36 = [v32 textFeatures];
      if (v29) {
        v37 = &v59;
      }
      else {
        v37 = 0;
      }
      if (v29) {
        id v59 = 0;
      }
      v51 = [(CREngineFast *)self applyLanguageCorrectionToResults:v36 image:v14 latticeResults:v37 progressHandler:v53];
      if (v29)
      {
        id v49 = v59;
LABEL_32:

        goto LABEL_33;
      }
    }
    id v49 = 0;
    goto LABEL_32;
  }
  if (a7)
  {
    +[CRImageReader errorWithErrorCode:-3];
    char v12 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v12 = 0;
  }
LABEL_49:

  return v12;
}

void __88__CREngineFast_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke(void *a1)
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
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTextRecognitionTime", "", buf, 2u);
  }

  uint64_t v6 = +[CRFuthark detectAndRecognizeTextInImage:a1[4] options:a1[5]];
  uint64_t v7 = *(void *)(a1[6] + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  double v9 = (id)CRSignpostLog_signPostOSLog;
  double v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v10, OS_SIGNPOST_INTERVAL_END, v3, "OCRTextRecognitionTime", "", v11, 2u);
  }
}

- (id)computeDevice
{
  v2 = [(CREngineFast *)self options];
  os_signpost_id_t v3 = [v2 objectForKeyedSubscript:@"CRImageReaderComputeDeviceKey"];

  return v3;
}

- (id)filterResultsForTextFeatures:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  BOOL v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v33, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v33;
  uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v46;
    v38 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ([(CREngineFast *)self shouldCancel])
        {

          id v31 = 0;
          v30 = v34;
          goto LABEL_27;
        }
        uint64_t v6 = [v40 stringValue];
        v52 = v6;
        uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
        [v40 setStringValueCandidates:v7];

        int v8 = [v40 subFeatures];
        v51 = v8;
        double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
        [v40 setSubFeatureCandidates:v9];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        double v10 = [v40 subFeatures];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v42;
          double v13 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v42 != v12) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v41 + 1) + 8 * j);
              uint64_t v16 = [v15 candidateProbs];
              uint64_t v17 = [v16 count];
              if (v17)
              {
                os_signpost_id_t v3 = [v15 candidateProbs];
                v4 = [v3 objectAtIndexedSubscript:0];
                float v18 = v4;
              }
              else
              {
                float v18 = &unk_1F3933250;
              }
              [v15 setConfidence:v18];
              if (v17)
              {
              }
              v19 = [v15 confidence];
              [v19 doubleValue];
              double v21 = v20;

              double v13 = v13 + v21;
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v11);
        }
        else
        {
          double v13 = 0.0;
        }

        uint64_t v22 = NSNumber;
        uint64_t v23 = [v40 subFeatures];
        v24 = objc_msgSend(v22, "numberWithDouble:", v13 / (double)(unint64_t)objc_msgSend(v23, "count"));
        [v40 setConfidence:v24];

        v25 = [v40 confidence];
        id v49 = v25;
        float v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
        [v40 setCandidateProbs:v26];

        v27 = [v40 confidence];
        v28 = [(CREngineFast *)v38 options];
        BOOL v29 = [(CREngineFast *)v38 noLMValidateProbability:v27 options:v28];

        if (v29) {
          [v34 addObject:v40];
        }
        self = v38;
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }

  v30 = v34;
  id v31 = v34;
LABEL_27:

  return v31;
}

- (id)applyLanguageCorrectionToResults:(id)a3 image:(id)a4 latticeResults:(id *)a5 progressHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  double v10 = (NSArray *)a3;
  v30 = (CRImage *)a4;
  id v28 = a6;
  float v26 = v10;
  BOOL v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v10, "count"));
  if (![(NSArray *)v10 count]) {
    goto LABEL_19;
  }
  if (a5)
  {
    v27 = objc_alloc_init(CRLatticeResults);
    *a5 = v27;
  }
  else
  {
    v27 = 0;
  }
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0xB012000000;
  v52[3] = __Block_byref_object_copy__17;
  v52[4] = __Block_byref_object_dispose__18;
  v52[5] = "\"4";
  Segmenter::Segmenter((Segmenter *)v53, v10, v30, 0, 0, 0, 0, 1, 0);
  uint64_t v11 = [(CREngineFast *)self options];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"CRTextRecognizerNumberResultsNeeded"];
  uint64_t v13 = [v12 integerValue];
  if (v13 <= 4) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = v13;
  }

  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  int v50 = 1;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  int v48 = 1060320051;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v15 = v26;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        if ([(CREngineFast *)self shouldCancel])
        {
          char v22 = 0;
          goto LABEL_18;
        }
        double v20 = [(CREngineFast *)self languageCorrectionStats];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __86__CREngineFast_applyLanguageCorrectionToResults_image_latticeResults_progressHandler___block_invoke;
        v31[3] = &unk_1E6CDC400;
        v31[4] = v19;
        v31[5] = self;
        v32 = v30;
        uint64_t v37 = v52;
        v38 = v51;
        uint64_t v41 = v14;
        id v33 = v27;
        id v34 = v29;
        id v36 = v28;
        v39 = v47;
        v40 = v49;
        double v21 = v15;
        v35 = v21;
        uint64_t v42 = 0x3FE6666666666666;
        [v20 measureBlock:v31];
      }
      uint64_t v16 = [(NSArray *)v21 countByEnumeratingWithState:&v43 objects:v54 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  char v22 = 1;
LABEL_18:

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v52, 8);
  Segmenter::~Segmenter((Segmenter *)v53);

  if ((v22 & 1) == 0)
  {
    id v24 = 0;
    uint64_t v23 = v29;
  }
  else
  {
LABEL_19:
    uint64_t v23 = v29;
    id v24 = v29;
  }

  return v24;
}

void __86__CREngineFast_applyLanguageCorrectionToResults_image_latticeResults_progressHandler___block_invoke(uint64_t a1)
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
  id v5 = v4;
  unint64_t v47 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRLanguageCorrectionTime", "", buf, 2u);
  }

  uint64_t v6 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v7 = [*(id *)(a1 + 40) languageCorrection];
  uint64_t v8 = *(void *)(a1 + 48);
  double v9 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 72) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 88) + 8);
  unint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  if (*(unsigned char *)(v10 + 162))
  {
    double v12 = *(double *)(*(void *)(v10 + 112) + 8 * v11);
    double v13 = v12 + v12;
  }
  else
  {
    double v13 = -1.0;
  }
  uint64_t v14 = *(void *)(v10 + 136);
  if (v11 >= (*(void *)(v10 + 144) - v14) >> 3) {
    std::vector<double>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v15 = *(void *)(v10 + 48);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v10 + 56) - v15) >> 3) <= v11) {
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  }
  double v16 = *(double *)(v14 + 8 * v11);
  uint64_t v17 = [*(id *)(a1 + 40) options];
  LODWORD(v45) = 2;
  BYTE4(v44) = 1;
  LODWORD(v44) = *(void *)(a1 + 120);
  float v18 = objc_msgSend(v7, "correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:", v6, v8, v9, v15 + 24 * v11, v10 + 48, v17, v13, v16, v44, v45, *(void *)(a1 + 56));

  uint64_t v19 = *(void **)(a1 + 40);
  double v20 = [v18 confidence];
  double v21 = [*(id *)(a1 + 40) options];
  LODWORD(v19) = [v19 lmValidateProbability:v20 options:v21];

  if (v19)
  {
    char v22 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    id v24 = objc_opt_new();
    os_signpost_id_t v46 = v3;
    for (unint64_t i = 0; ; ++i)
    {
      float v26 = [v18 stringValueCandidates];
      unint64_t v27 = [v26 count];

      if (i >= v27) {
        break;
      }
      id v28 = *(void **)(a1 + 40);
      BOOL v29 = [v18 candidateProbs];
      v30 = [v29 objectAtIndex:i];
      id v31 = [*(id *)(a1 + 40) options];
      LODWORD(v28) = [v28 lmValidateProbability:v30 options:v31];

      if (v28)
      {
        v32 = [v18 candidateProbs];
        id v33 = [v32 objectAtIndex:i];
        [v22 addObject:v33];

        id v34 = [v18 stringValueCandidates];
        v35 = [v34 objectAtIndex:i];
        [v23 addObject:v35];

        id v36 = [v18 subFeatureCandidates];
        uint64_t v37 = [v36 objectAtIndex:i];
        [v24 addObject:v37];
      }
    }
    os_signpost_id_t v3 = v46;
    if ([v23 count])
    {
      v38 = [v23 objectAtIndex:0];
      [v18 setStringValue:v38];

      [v18 setStringValueCandidates:v23];
      [v18 setCandidateProbs:v22];
      v39 = [v24 firstObject];
      [v18 setSubFeatures:v39];

      [v18 setSubFeatureCandidates:v24];
      [*(id *)(a1 + 64) addObject:v18];
    }
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  if (*(void *)(a1 + 80))
  {
    int v40 = *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    float v41 = *(double *)(a1 + 128)
        + (double)v40
        / (double)(unint64_t)[*(id *)(a1 + 72) count]
        * (1.0 - *(double *)(a1 + 128));
    *(float *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v41;
    (*(void (**)(double))(*(void *)(a1 + 80) + 16))(*(float *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                            + 24));
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v42 = (id)CRSignpostLog_signPostOSLog;
  long long v43 = v42;
  if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)int v48 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v43, OS_SIGNPOST_INTERVAL_END, v3, "OCRLanguageCorrectionTime", "", v48, 2u);
  }
}

- (BOOL)lmValidateProbability:(id)a3 options:(id)a4
{
  return [(CREngineFast *)self validateProbability:a3 validRangeMin:a4 validRangeMax:0.0 options:1.0];
}

- (BOOL)noLMValidateProbability:(id)a3 options:(id)a4
{
  return [(CREngineFast *)self validateProbability:a3 validRangeMin:a4 validRangeMax:0.0 options:1.0];
}

- (BOOL)validateProbability:(id)a3 validRangeMin:(double)a4 validRangeMax:(double)a5 options:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  unint64_t v11 = [v10 objectForKey:@"CRImageReaderPrecisionThresholdKey"];
  [v11 doubleValue];
  double v13 = v12;

  [v9 doubleValue];
  LOBYTE(v11) = v14 >= a4 + v13 * (a5 - a4);

  return (char)v11;
}

- (CRPerformanceStatistics)textRecognitionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTextRecognitionStats:(id)a3
{
}

- (CRPerformanceStatistics)languageCorrectionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLanguageCorrectionStats:(id)a3
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

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOptions:(id)a3
{
}

- (CRLanguageCorrection)languageCorrection
{
  return self->_languageCorrection;
}

- (void)setLanguageCorrection:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCorrection, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_languageCorrectionStats, 0);
  objc_storeStrong((id *)&self->_textRecognitionStats, 0);
}

@end