@interface CRImageReader
+ (BOOL)languageIsArabic:(id)a3;
+ (BOOL)languageIsChinese:(id)a3;
+ (BOOL)languageIsCyrillic:(id)a3;
+ (BOOL)languageIsFrench:(id)a3;
+ (BOOL)languageIsJapanese:(id)a3;
+ (BOOL)languageIsKorean:(id)a3;
+ (BOOL)languageIsLatin:(id)a3;
+ (BOOL)languageIsNorwegian:(id)a3;
+ (BOOL)languageIsThai:(id)a3;
+ (BOOL)languageIsVietnamese:(id)a3;
+ (BOOL)languageSupportsFullWidthPunctuation:(id)a3;
+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 error:(id *)a5;
+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 extendedTimeoutBlock:(id)a5 error:(id *)a6;
+ (CGSize)detectorImageSizeForOptions:(id)a3 imageSize:(CGSize)a4;
+ (Class)_engineClassFromOptions:(id)a3 error:(id *)a4;
+ (id)_engineFromOptions:(id)a3 error:(id *)a4;
+ (id)_jsonStringFromOptions:(id)a3;
+ (id)defaultOptions;
+ (id)descriptionForErrorCode:(int64_t)a3;
+ (id)errorWithErrorCode:(int64_t)a3;
+ (id)languageSetFromOptionsDictionary:(id)a3;
+ (id)prioritizationForOptions:(id)a3;
+ (id)supportedChineseLanguages;
+ (id)supportedComputeDevicesForOptions:(id)a3 revision:(int64_t)a4 error:(id *)a5;
+ (id)supportedLanguagesForOptions:(id)a3 revision:(int64_t)a4 error:(id *)a5;
+ (unint64_t)_typeForFeature:(id)a3 enginePreferredRegionType:(unint64_t)a4;
+ (unint64_t)defaultRevisionNumber;
- (BOOL)purgeCaches:(id)a3;
- (BOOL)shouldCancel;
- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4;
- (CREngine)engine;
- (CRImageReader)initWithOptions:(id)a3;
- (CRImageReader)initWithOptions:(id)a3 error:(id *)a4;
- (NSArray)outputObjectTypes;
- (NSDictionary)userOptions;
- (id)computeDevice;
- (id)detectorInferenceStats;
- (id)detectorStats;
- (id)documentOutputRegionForImage:(id)a3 options:(id)a4 roi:(CGRect)a5 error:(id *)a6 withProgressHandler:(id)a7;
- (id)documentOutputRegionForImage:(id)a3 options:(id)a4 roi:(CGRect)a5 trackingSession:(id)a6 error:(id *)a7 withProgressHandler:(id)a8;
- (id)documentOutputRegionForImage:(id)a3 roi:(CGRect)a4 error:(id *)a5 withProgressHandler:(id)a6;
- (id)documentOutputRegionForTextFeatures:(id)a3 image:(id)a4;
- (id)formAnalyzerStats;
- (id)formDetectionStats;
- (id)formPostProcessingStats;
- (id)lineWrappingStats;
- (id)orientationCorrectionStats;
- (id)postProcStats;
- (id)recognizeDetectedBlocks:(id)a3 inImage:(id)a4 error:(id *)a5 withProgressHandler:(id)a6;
- (id)recognizerDecodingStats;
- (id)recognizerInferenceStats;
- (id)recognizerStats;
- (id)resultDocumentForImage:(id)a3 roi:(CGRect)a4 options:(id)a5 trackingSession:(id)a6 error:(id *)a7 withProgressHandler:(id)a8;
- (id)resultsForCRImage:(id)a3 roi:(CGRect)a4 options:(id)a5 error:(id *)a6 withProgressHandler:(id)a7;
- (id)resultsForPixelBuffer:(__CVBuffer *)a3 options:(id)a4 error:(id *)a5;
- (id)resultsForPixelBuffer:(__CVBuffer *)a3 roi:(CGRect)a4 options:(id)a5 error:(id *)a6;
- (id)resultsForPixelBuffer:(__CVBuffer *)a3 roi:(CGRect)a4 options:(id)a5 error:(id *)a6 withProgressHandler:(id)a7;
- (id)tableStructureRecognitionStats;
- (id)textDetectorResultsForImage:(id)a3 error:(id *)a4;
- (id)textGroupingStats;
- (void)cancel;
- (void)setEngine:(id)a3;
- (void)setOutputObjectTypes:(id)a3;
- (void)setShouldCancel:(BOOL)a3;
- (void)setUserOptions:(id)a3;
@end

@implementation CRImageReader

- (CRImageReader)initWithOptions:(id)a3
{
  return [(CRImageReader *)self initWithOptions:a3 error:0];
}

- (CRImageReader)initWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v6 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v8 = (id)CRSignpostLog_signPostOSLog;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "OCRInitializationTime", "", buf, 2u);
  }

  v10 = CROSLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(id)objc_opt_class() _jsonStringFromOptions:v27];
    uint64_t v12 = [v11 UTF8String];
    *(_DWORD *)buf = 136315394;
    v31 = "-[CRImageReader initWithOptions:error:]";
    __int16 v32 = 2080;
    uint64_t v33 = v12;
    _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEFAULT, "%s: options=%s", buf, 0x16u);
  }
  v29.receiver = self;
  v29.super_class = (Class)CRImageReader;
  v13 = [(CRImageReader *)&v29 init];
  v14 = v13;
  if (!v13) {
    goto LABEL_13;
  }
  [(CRImageReader *)v13 setShouldCancel:0];
  v15 = [(id)objc_opt_class() defaultOptions];
  v16 = (void *)[v15 mutableCopy];

  [v16 addEntriesFromDictionary:v27];
  [(CRImageReader *)v14 setUserOptions:v16];
  v17 = objc_opt_class();
  v18 = [(CRImageReader *)v14 userOptions];
  id v28 = 0;
  v19 = [v17 _engineFromOptions:v18 error:&v28];
  id v20 = v28;
  [(CRImageReader *)v14 setEngine:v19];

  v21 = [(CRImageReader *)v14 engine];
  LODWORD(v18) = v21 == 0;

  if (!v18)
  {

LABEL_13:
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v22 = (id)CRSignpostLog_signPostOSLog;
    v23 = v22;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v23, OS_SIGNPOST_INTERVAL_END, v7, "OCRInitializationTime", "", buf, 2u);
    }

    v24 = v14;
    goto LABEL_24;
  }
  if (a4) {
    *a4 = v20;
  }
  v25 = CROSLogForCategory(0);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = (const char *)v16;
    _os_log_impl(&dword_1DD733000, v25, OS_LOG_TYPE_FAULT, "Unable to initialize CREngine with options: %@", buf, 0xCu);
  }

  v24 = 0;
LABEL_24:

  return v24;
}

- (NSArray)outputObjectTypes
{
  return self->_outputObjectTypes;
}

- (void)setOutputObjectTypes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v11 = (NSArray *)a3;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v8 isEqualToString:@"CROutputTypeText"] & 1) == 0)
        {
          v9 = CROSLogForCategory(0);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v8;
            _os_log_impl(&dword_1DD733000, v9, OS_LOG_TYPE_ERROR, "Output object type %@ not supported by CRImageReader", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }

  outputObjectTypes = self->_outputObjectTypes;
  self->_outputObjectTypes = v11;
}

- (id)resultsForPixelBuffer:(__CVBuffer *)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v5 = -[CRImageReader resultsForPixelBuffer:roi:options:error:](self, "resultsForPixelBuffer:roi:options:error:", a3, a4, a5, 0.0, 0.0, 1.0, 1.0);
  return v5;
}

- (id)resultsForPixelBuffer:(__CVBuffer *)a3 roi:(CGRect)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v6 = -[CRImageReader resultsForPixelBuffer:roi:options:error:withProgressHandler:](self, "resultsForPixelBuffer:roi:options:error:withProgressHandler:", a3, a5, a6, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return v6;
}

- (id)resultsForPixelBuffer:(__CVBuffer *)a3 roi:(CGRect)a4 options:(id)a5 error:(id *)a6 withProgressHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a7;
  v17 = [[CRImage_PixelBuffer alloc] initWithCVPixelBuffer:a3];
  v18 = CROSLogForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [(CRImage_PixelBuffer *)v17 width];
    uint64_t v20 = [(CRImage_PixelBuffer *)v17 height];
    id v21 = [(id)objc_opt_class() _jsonStringFromOptions:v15];
    int v24 = 136316930;
    v25 = "-[CRImageReader resultsForPixelBuffer:roi:options:error:withProgressHandler:]";
    __int16 v26 = 2048;
    uint64_t v27 = v19;
    __int16 v28 = 2048;
    uint64_t v29 = v20;
    __int16 v30 = 2048;
    double v31 = x;
    __int16 v32 = 2048;
    double v33 = y;
    __int16 v34 = 2048;
    double v35 = width;
    __int16 v36 = 2048;
    double v37 = height;
    __int16 v38 = 2080;
    uint64_t v39 = [v21 UTF8String];
    _os_log_impl(&dword_1DD733000, v18, OS_LOG_TYPE_DEFAULT, "%s: image={w:%lu,h:%lu} roi={x:%lf,y:%lf,w:%lf,h:%lf} options=%s", (uint8_t *)&v24, 0x52u);
  }
  v22 = -[CRImageReader resultsForCRImage:roi:options:error:withProgressHandler:](self, "resultsForCRImage:roi:options:error:withProgressHandler:", v17, v15, a6, v16, x, y, width, height);

  return v22;
}

- (id)resultsForCRImage:(id)a3 roi:(CGRect)a4 options:(id)a5 error:(id *)a6 withProgressHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v42 = a5;
  id v15 = a7;
  id v16 = (void *)MEMORY[0x1E4F1CAD0];
  id v43 = v15;
  v17 = [(CRImageReader *)self outputObjectTypes];
  v18 = [v16 setWithArray:v17];
  int v19 = [v18 containsObject:@"CROutputTypeText"];

  if (v19)
  {
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    uint64_t v20 = (id)CRSignpostLog_signPostOSLog;
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v22 = (id)CRSignpostLog_signPostOSLog;
    v23 = v22;
    unint64_t v39 = v21 - 1;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "OCREndToEndTime", "", buf, 2u);
    }

    int v24 = -[CRImageReader resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:](self, "resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:", v41, v42, 0, a6, v43, x, y, width, height);
    uint64_t v40 = [v24 contentsWithTypes:8];
    v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v40, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = v40;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v26);
          }
          __int16 v30 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          double v31 = objc_msgSend(v24, "title", v39);
          BOOL v32 = v31 == v30;

          double v33 = +[CRImageReaderOutput outputWithType:@"CROutputTypeText" outputRegion:v30 isTitle:v32];
          [v25 addObject:v33];
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v27);
    }

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    __int16 v34 = (id)CRSignpostLog_signPostOSLog;
    double v35 = v34;
    if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v35, OS_SIGNPOST_INTERVAL_END, v21, "OCREndToEndTime", "", buf, 2u);
    }

    __int16 v36 = [MEMORY[0x1E4F1C978] arrayWithArray:v25];

    double v37 = v43;
  }
  else
  {
    if (a6)
    {
      *a6 = +[CRImageReader errorWithErrorCode:-1];
    }
    double v37 = v43;
    if (v43) {
      (*((void (**)(id, void, double))v43 + 2))(v43, 0, 0.0);
    }
    __int16 v36 = 0;
  }

  return v36;
}

- (id)documentOutputRegionForImage:(id)a3 options:(id)a4 roi:(CGRect)a5 error:(id *)a6 withProgressHandler:(id)a7
{
  os_signpost_id_t v7 = -[CRImageReader documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:](self, "documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:", a3, a4, 0, a6, a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return v7;
}

- (id)documentOutputRegionForImage:(id)a3 options:(id)a4 roi:(CGRect)a5 trackingSession:(id)a6 error:(id *)a7 withProgressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a8;
  os_signpost_id_t v21 = CROSLogForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [v17 width];
    uint64_t v23 = [v17 height];
    id v24 = [(id)objc_opt_class() _jsonStringFromOptions:v18];
    int v27 = 136316930;
    uint64_t v28 = "-[CRImageReader documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:]";
    __int16 v29 = 2048;
    uint64_t v30 = v22;
    __int16 v31 = 2048;
    uint64_t v32 = v23;
    __int16 v33 = 2048;
    double v34 = x;
    __int16 v35 = 2048;
    double v36 = y;
    __int16 v37 = 2048;
    double v38 = width;
    __int16 v39 = 2048;
    double v40 = height;
    __int16 v41 = 2080;
    uint64_t v42 = [v24 UTF8String];
    _os_log_impl(&dword_1DD733000, v21, OS_LOG_TYPE_DEFAULT, "%s: image={w:%lu,h:%lu} roi={x:%lf,y:%lf,w:%lf,h:%lf} options=%s", (uint8_t *)&v27, 0x52u);
  }
  v25 = -[CRImageReader resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:](self, "resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:", v17, v18, v19, a7, v20, x, y, width, height);

  return v25;
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  os_signpost_id_t v7 = [(CRImageReader *)self engine];
  objc_msgSend(v7, "smallestImageSizeForTextWithRelativeHeight:originalImageSize:", a3, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (id)supportedLanguagesForOptions:(id)a3 revision:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  double v9 = (void *)[a1 _engineClassFromOptions:v8 error:a5];
  if (v9)
  {
    double v10 = [v9 supportedLanguagesForRevision:a4 error:a5];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

+ (id)supportedComputeDevicesForOptions:(id)a3 revision:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  double v9 = (void *)[a1 _engineClassFromOptions:v8 error:a5];
  if (v9)
  {
    double v10 = [v9 supportedComputeDevicesForRevision:a4];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)computeDevice
{
  v2 = [(CRImageReader *)self engine];
  v3 = [v2 computeDevice];

  return v3;
}

+ (unint64_t)defaultRevisionNumber
{
  return 3;
}

+ (id)languageSetFromOptionsDictionary:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  uint64_t v23 = [v22 objectForKey:@"CRImageReaderLanguageKey"];
  uint64_t v4 = [a1 defaultRevisionNumber];
  uint64_t v5 = [v22 objectForKeyedSubscript:@"CRImageReaderRevisionKey"];

  if (v5)
  {
    uint64_t v6 = [v22 objectForKey:@"CRImageReaderRevisionKey"];
    uint64_t v4 = [v6 unsignedIntegerValue];
  }
  os_signpost_id_t v7 = [a1 supportedLanguagesForOptions:v22 revision:v4 error:0];
  id v8 = objc_opt_new();
  double v9 = v8;
  if (!v23)
  {
    [v8 addObject:@"en-US"];
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = (void *)MEMORY[0x1E4F28B50];
    v30[0] = v23;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    id v12 = [v10 preferredLocalizationsFromArray:v7 forPreferences:v11];

    if ([v12 count])
    {
      double v13 = [v12 firstObject];
      [v9 addObject:v13];
    }
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v23;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = (void *)MEMORY[0x1E4F28B50];
          uint64_t v28 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
          id v19 = [v17 preferredLocalizationsFromArray:v7 forPreferences:v18];

          if ([v19 count])
          {
            id v20 = [v19 firstObject];
            [v9 addObject:v20];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v14);
    }
    goto LABEL_20;
  }
LABEL_21:

  return v9;
}

+ (id)supportedChineseLanguages
{
  if (qword_1EB58C958 != -1) {
    dispatch_once(&qword_1EB58C958, &__block_literal_global_6);
  }
  v2 = (void *)_MergedGlobals_11;
  return v2;
}

void __42__CRImageReader_supportedChineseLanguages__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"zh-Hans";
  v2[1] = @"zh-Hant";
  v2[2] = @"yue-Hans";
  v2[3] = @"yue-Hant";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v0;
}

+ (BOOL)languageIsChinese:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 supportedChineseLanguages];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)languageIsLatin:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"en-US"] & 1) != 0
    || ([v3 isEqualToString:@"fr-FR"] & 1) != 0
    || ([v3 isEqualToString:@"it-IT"] & 1) != 0
    || ([v3 isEqualToString:@"de-DE"] & 1) != 0
    || ([v3 isEqualToString:@"es-ES"] & 1) != 0
    || ([v3 isEqualToString:@"pt-BR"] & 1) != 0
    || ([v3 isEqualToString:@"vi-VT"] & 1) != 0
    || ([v3 isEqualToString:@"tr-TR"] & 1) != 0
    || ([v3 isEqualToString:@"id-ID"] & 1) != 0
    || ([v3 isEqualToString:@"cs-CZ"] & 1) != 0
    || ([v3 isEqualToString:@"da-DK"] & 1) != 0
    || ([v3 isEqualToString:@"nl-NL"] & 1) != 0
    || ([v3 isEqualToString:@"no-NO"] & 1) != 0
    || ([v3 isEqualToString:@"nn-NO"] & 1) != 0
    || ([v3 isEqualToString:@"nb-NO"] & 1) != 0
    || ([v3 isEqualToString:@"ms-MY"] & 1) != 0
    || ([v3 isEqualToString:@"pl-PL"] & 1) != 0
    || ([v3 isEqualToString:@"ro-RO"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"sv-SE"];
  }

  return v4;
}

+ (BOOL)languageIsCyrillic:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ru-RU"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"uk-UA"];
  }

  return v4;
}

+ (BOOL)languageIsFrench:(id)a3
{
  return [a3 isEqualToString:@"fr-FR"];
}

+ (BOOL)languageIsKorean:(id)a3
{
  return [a3 isEqualToString:@"ko-KR"];
}

+ (BOOL)languageIsJapanese:(id)a3
{
  return [a3 isEqualToString:@"ja-JP"];
}

+ (BOOL)languageIsThai:(id)a3
{
  return [a3 isEqualToString:@"th-TH"];
}

+ (BOOL)languageIsVietnamese:(id)a3
{
  return [a3 isEqualToString:@"vi-VT"];
}

+ (BOOL)languageIsArabic:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ar-SA"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"ars-SA"];
  }

  return v4;
}

+ (BOOL)languageIsNorwegian:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"no-NO"] & 1) != 0
    || ([v3 isEqualToString:@"nb-NO"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"nn-NO"];
  }

  return v4;
}

+ (BOOL)languageSupportsFullWidthPunctuation:(id)a3
{
  id v4 = a3;
  if ([a1 languageIsChinese:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 languageIsJapanese:v4];
  }

  return v5;
}

- (BOOL)purgeCaches:(id)a3
{
  return 1;
}

- (id)documentOutputRegionForTextFeatures:(id)a3 image:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v57 = v5;
  v66 = objc_opt_new();
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v5;
  uint64_t v58 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
  if (v58)
  {
    v68 = 0;
    uint64_t v60 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v81 != v60) {
          objc_enumerationMutation(obj);
        }
        v87 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        os_signpost_id_t v7 = v87;
        id v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
        if ([v7 type] == 1)
        {
          id v8 = [v7 subFeatures];
        }
        else
        {
          id v8 = v63;
        }
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v64 = v8;
        uint64_t v67 = [v64 countByEnumeratingWithState:&v76 objects:v86 count:16];
        if (v67)
        {
          uint64_t v65 = *(void *)v77;
          do
          {
            for (uint64_t j = 0; j != v67; ++j)
            {
              if (*(void *)v77 != v65) {
                objc_enumerationMutation(v64);
              }
              double v9 = *(void **)(*((void *)&v76 + 1) + 8 * j);
              [v6 size];
              v70 = +[CRNeuralTextDetector _lineRegionFromLineTextFeature:imageSize:](CRNeuralTextDetector, "_lineRegionFromLineTextFeature:imageSize:", v9);
              objc_msgSend(v66, "addObject:");
              double v10 = [v9 stringValue];
              BOOL v11 = v10 == 0;

              if (!v11)
              {
                if (!v68) {
                  v68 = objc_alloc_init(CRMutableRecognitionResult);
                }
                v71 = [(CRRecognizedTextRegion *)[CRMutableRecognizedTextRegion alloc] initWithType:2 detectedLineRegion:v70];
                id v12 = [v9 stringValue];
                [(CRRecognizedTextRegion *)v71 setText:v12];

                double v13 = [v9 candidateProbs];
                uint64_t v14 = [v13 firstObject];
                [v14 doubleValue];
                -[CRRecognizedTextRegion setConfidence:](v71, "setConfidence:");

                uint64_t v15 = [v9 candidateProbs];
                id v16 = [v15 firstObject];
                [v16 doubleValue];
                -[CRRecognizedTextRegion setActivationProbability:](v71, "setActivationProbability:");

                id v17 = [v9 selectedLocale];
                [(CRRecognizedTextRegion *)v71 setLocale:v17];

                id v18 = objc_opt_new();
                long long v74 = 0u;
                long long v75 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
                id v19 = [v9 subFeatures];
                uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v85 count:16];
                if (v20)
                {
                  uint64_t v21 = *(void *)v73;
                  do
                  {
                    for (uint64_t k = 0; k != v20; ++k)
                    {
                      if (*(void *)v73 != v21) {
                        objc_enumerationMutation(v19);
                      }
                      uint64_t v23 = *(void **)(*((void *)&v72 + 1) + 8 * k);
                      long long v24 = objc_alloc_init(CRMutableRecognizedTextRegion);
                      long long v25 = [CRNormalizedQuad alloc];
                      [v23 topLeft];
                      double v27 = v26;
                      double v29 = v28;
                      [v23 topRight];
                      double v31 = v30;
                      double v33 = v32;
                      [v23 bottomRight];
                      double v35 = v34;
                      double v37 = v36;
                      [v23 bottomLeft];
                      double v39 = v38;
                      double v41 = v40;
                      [v6 size];
                      long long v44 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v25, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v27, v29, v31, v33, v35, v37, v39, v41, v42, v43, v57);
                      [(CRRecognizedTextRegion *)v24 setBoundingQuad:v44];

                      long long v45 = [v23 stringValue];
                      [(CRRecognizedTextRegion *)v24 setText:v45];

                      long long v46 = [v9 selectedLocale];
                      [(CRRecognizedTextRegion *)v24 setLocale:v46];

                      -[CRRecognizedTextRegion setTextRegionType:](v24, "setTextRegionType:", [v23 type] == 3);
                      [v18 addObject:v24];
                    }
                    uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v85 count:16];
                  }
                  while (v20);
                }

                [(CRRecognizedTextRegion *)v71 setSubregions:v18];
                v84 = v71;
                long long v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
                [(CRMutableRecognitionResult *)v68 addRecognizedRegions:v47 detectedRegion:v70];
              }
            }
            uint64_t v67 = [v64 countByEnumeratingWithState:&v76 objects:v86 count:16];
          }
          while (v67);
        }
      }
      uint64_t v58 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
    }
    while (v58);

    if (v68)
    {
      v48 = [(CRImageReader *)self engine];
      char v49 = objc_opt_respondsToSelector();

      if ((v49 & 1) == 0)
      {
        v51 = 0;
        goto LABEL_36;
      }
      uint64_t v50 = [(CRImageReader *)self engine];
      v51 = [(CRDetectionResult *)v50 documentForLineRegions:v66 recognitionResult:v68];
LABEL_35:

LABEL_36:
      v55 = v68;
      goto LABEL_38;
    }
  }
  else
  {
  }
  v52 = [(CRImageReader *)self engine];
  char v53 = objc_opt_respondsToSelector();

  if (v53)
  {
    uint64_t v50 = [[CRDetectionResult alloc] initWithLines:v66];
    v54 = [(CRImageReader *)self engine];
    v51 = [v54 resultDocumentForDetectionResult:v50 image:v6 options:0 progressHandler:0 error:0];

    v68 = 0;
    goto LABEL_35;
  }
  v55 = 0;
  v51 = 0;
LABEL_38:

  return v51;
}

- (id)textDetectorResultsForImage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  os_signpost_id_t v7 = [(CRImageReader *)self engine];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(CRImageReader *)self engine];
    double v10 = [v9 textDetectorResultsForImage:v6 error:a4];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)recognizeDetectedBlocks:(id)a3 inImage:(id)a4 error:(id *)a5 withProgressHandler:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v30 = a4;
  id v31 = a6;
  double v35 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke;
        v45[3] = &unk_1E6CDB140;
        id v46 = v35;
        [v14 enumerateContentsWithTypes:8 usingBlock:v45];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(CRImageReader *)self engine];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    double v27 = objc_opt_new();
    double v28 = [[CRDetectionResult alloc] initWithLines:v35];
    id v17 = [(CRImageReader *)self engine];
    double v29 = [v17 resultDocumentForDetectionResult:v28 image:v30 options:0 progressHandler:v31 error:a5];

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke_2;
    v43[3] = &unk_1E6CDB140;
    id v18 = v27;
    id v44 = v18;
    [v29 enumerateContentsWithTypes:8 usingBlock:v43];
    id v33 = (id)objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v32 = obj;
    uint64_t v19 = [v32 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v32);
          }
          id v22 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          uint64_t v23 = objc_opt_new();
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke_3;
          v36[3] = &unk_1E6CDB168;
          id v37 = v18;
          id v24 = v23;
          id v38 = v24;
          [v22 enumerateContentsWithTypes:8 usingBlock:v36];
          long long v25 = +[CRBlockOutputRegion blockWithBlock:v22 children:v24];
          [v33 addObject:v25];
        }
        uint64_t v19 = [v32 countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v19);
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Recognition of detected regions is not supported for this CRImageReader configuration"];
    id v33 = 0;
  }

  return v33;
}

void __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 detectedLineRegion];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  id v5 = [v3 detectedLineRegion];
  id v6 = [v5 uuid];
  [v4 setObject:v7 forKey:v6];
}

void __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 detectedLineRegion];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 uuid];
    id v7 = [v5 objectForKey:v6];

    if (v7)
    {
      char v8 = [v9 uuid];
      [v7 setUuid:v8];

      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

+ (id)errorWithErrorCode:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = +[CRImageReader descriptionForErrorCode:](CRImageReader, "descriptionForErrorCode:");
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v5 errorWithDomain:@"CRImageReaderErrorDomain" code:a3 userInfo:v6];

  return v7;
}

+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  LOBYTE(a5) = [(id)objc_opt_class() preheatModelsForOptions:v7 revision:a4 extendedTimeoutBlock:0 error:a5];

  return (char)a5;
}

+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 extendedTimeoutBlock:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [(id)objc_opt_class() defaultOptions];
  double v13 = (void *)[v12 mutableCopy];

  [v13 addEntriesFromDictionary:v10];
  uint64_t v14 = (void *)[a1 _engineClassFromOptions:v13 error:a6];
  if (v14) {
    char v15 = [v14 preheatModelsForOptions:v13 revision:a4 extendedTimeoutBlock:v11 error:a6];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

+ (CGSize)detectorImageSizeForOptions:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  char v8 = [(id)objc_opt_class() defaultOptions];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [v9 addEntriesFromDictionary:v7];
  objc_msgSend((id)objc_msgSend(a1, "_engineClassFromOptions:error:", v9, 0), "detectorImageSizeForOptions:imageSize:", v9, width, height);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

+ (id)prioritizationForOptions:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:v3 mtlDevice:0];
  id v5 = [v3 objectForKeyedSubscript:@"CRImageReaderPrioritizationKey"];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = @"CRImageReaderPrioritizationAuto";
  }
  if ([(__CFString *)v7 isEqualToString:@"CRImageReaderPrioritizationAuto"])
  {
    unint64_t v8 = v4 - 1;
    uint64_t v9 = @"CRImageReaderPrioritizationPerformance";
    if (v8 >= 2 && deviceHasAppleNeuralEngine()) {
      uint64_t v9 = @"CRImageReaderPrioritizationAccuracy";
    }

    id v7 = v9;
  }

  return v7;
}

+ (id)defaultOptions
{
  v21[22] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"com.apple.CoreRecognition.disable_language_correction"];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = [v2 objectForKey:@"com.apple.CoreRecognition.use_ci_detector"];
  LODWORD(v3) = [v5 BOOLValue];

  id v6 = [v2 objectForKey:@"com.apple.CoreRecognition.use_futhark_recognizer"];
  int v7 = [v6 BOOLValue];

  unint64_t v8 = @"CRImageReaderTextDetectorCR";
  if (v3) {
    unint64_t v8 = @"CRImageReaderTextDetectorCI";
  }
  uint64_t v9 = v8;
  double v10 = @"CRImageReaderTextRecognizerCR";
  if (v7) {
    double v10 = @"CRImageReaderTextRecognizerCI";
  }
  double v11 = v10;
  double v12 = [v2 objectForKey:@"com.apple.CoreRecognition.use_form_detection"];
  uint64_t v13 = [v12 BOOLValue];

  uint64_t v14 = MEMORY[0x1E4F1CC28];
  v20[0] = @"CRImageReaderLanguageKey";
  v20[1] = @"CRImageReaderImageCaptureOrientation";
  v21[0] = @"en-US";
  v21[1] = &unk_1F3932E18;
  v20[2] = @"CRImageReaderTextDetector";
  v20[3] = @"CREnableLogIntermediateDetectorResult";
  v21[2] = v9;
  v21[3] = &unk_1F3932E30;
  v20[4] = @"CRTextDetectorDisableLineGrouping";
  v20[5] = @"CRImagePyramidMaxNumScales";
  v21[4] = MEMORY[0x1E4F1CC28];
  v21[5] = &unk_1F3932E48;
  v20[6] = @"CRImagePyramidScaleFactor";
  v20[7] = @"CRImagePyramidMinDim";
  v21[6] = &unk_1F393B0E0;
  v21[7] = &unk_1F3932E60;
  v20[8] = @"CRImageReaderTextRecognizer";
  v20[9] = @"CRImageReaderRecognitionMethod";
  v21[8] = v11;
  v21[9] = @"CRImageReaderRecognitionMethodSingleChar";
  v21[10] = &unk_1F3932E78;
  v20[10] = @"CRTextRecognizerNumberResultsNeeded";
  v20[11] = @"CRImageReaderDisableLanguageCorrection";
  double v15 = [NSNumber numberWithBool:v4];
  v21[11] = v15;
  v21[12] = MEMORY[0x1E4F1CC38];
  v20[12] = @"CRImageReaderDisableWordLevelModelling";
  v20[13] = @"CRImageReaderDisableFalsePositivePostFilter";
  v21[13] = v14;
  v21[14] = &unk_1F3932E90;
  v20[14] = @"CRImageReaderRevisionKey";
  v20[15] = @"CRImageReaderPrecisionThresholdKey";
  v21[15] = &unk_1F393B0F0;
  v21[16] = @"CRImageReaderPrioritizationAuto";
  v20[16] = @"CRImageReaderPrioritizationKey";
  v20[17] = @"CRImageReaderSkipRecognition";
  v21[17] = v14;
  v20[18] = @"CRImageReaderRectifyPolygons";
  char v16 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  v21[18] = v16;
  v20[19] = @"CRImageReaderDetectForms";
  id v17 = [NSNumber numberWithBool:v13];
  v21[19] = v17;
  v21[20] = v14;
  v20[20] = @"CRImageReaderSkipVerticalText";
  v20[21] = @"CRImageReaderCoreMode";
  v21[21] = v14;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:22];

  return v18;
}

+ (id)descriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 < 0xFFFFFFFFFFFFFFF8) {
    return @"Unknown error";
  }
  else {
    return off_1E6CDB188[a3 + 8];
  }
}

+ (id)_jsonStringFromOptions:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"CRImageReaderComputeDeviceKey"];

  if (v4) {
    [v3 removeObjectForKey:@"CRImageReaderComputeDeviceKey"];
  }
  if (v3 && [MEMORY[0x1E4F28D90] isValidJSONObject:v3])
  {
    id v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:2 error:0];
    id v6 = (__CFString *)[[NSString alloc] initWithData:v5 encoding:4];
  }
  else
  {
    id v6 = @"<not serializable>";
  }

  return v6;
}

- (id)resultDocumentForImage:(id)a3 roi:(CGRect)a4 options:(id)a5 trackingSession:(id)a6 error:(id *)a7 withProgressHandler:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a5;
  id v57 = a6;
  uint64_t v19 = (void (**)(id, void, double))a8;
  if (!os_variant_has_internal_diagnostics()
    || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        [v20 objectForKey:@"com.apple.CoreRecognition.save_inputs_outputs"],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v21 BOOLValue],
        v21,
        v20,
        !v22))
  {
    int v27 = 0;
    uint64_t v56 = 0;
    if (!v19) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v56 = [v17 bufferHash];
  if (qword_1EB58C968 != -1) {
    dispatch_once(&qword_1EB58C968, &__block_literal_global_398);
  }
  uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"ocr_input_%lX.png", v56);
  id v24 = [(id)qword_1EB58C960 URLByAppendingPathComponent:v23];
  [v17 writeToURL:v24];
  long long v25 = CROSLogForCategory(6);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    double v26 = [v24 absoluteString];
    *(_DWORD *)buf = 136315394;
    v59 = "-[CRImageReader resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:]";
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v26;
    _os_log_impl(&dword_1DD733000, v25, OS_LOG_TYPE_DEBUG, "%s: Saving image at location: %@", buf, 0x16u);
  }
  int v27 = 1;
  if (v19) {
LABEL_10:
  }
    v19[2](v19, 0, 0.0);
LABEL_11:
  unint64_t v28 = [v17 width];
  unint64_t v29 = [v17 height];
  unint64_t v30 = [v17 width];
  unint64_t v31 = [v17 height];
  v66.origin.double x = x * (double)v28;
  v66.origin.double y = y * (double)v29;
  v66.size.double width = width * (double)v30;
  v66.size.double height = height * (double)v31;
  CGRect v67 = CGRectIntegral(v66);
  double v32 = v67.origin.x;
  double v33 = v67.origin.y;
  double v34 = v67.size.width;
  double v35 = v67.size.height;
  unint64_t v36 = [v17 width];
  unint64_t v37 = [v17 height];
  v69.size.double width = (double)v36;
  v69.size.double height = (double)v37;
  v69.origin.double x = 0.0;
  v69.origin.double y = 0.0;
  v68.origin.double x = v32;
  v68.origin.double y = v33;
  v68.size.double width = v34;
  v68.size.double height = v35;
  BOOL v38 = CGRectEqualToRect(v68, v69);
  if (v38)
  {
    long long v39 = v17;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v17, "imageByCroppingRectangle:iosurfaceBacking:", 1, v32, v33, v34, v35);
    }
    else {
    long long v39 = objc_msgSend(v17, "imageByCroppingRectangle:", v32, v33, v34, v35);
    }
  }
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v41 = [(CRImageReader *)self userOptions];
  [v40 addEntriesFromDictionary:v41];

  [v40 addEntriesFromDictionary:v18];
  id v42 = v40;

  uint64_t v43 = [v42 objectForKey:@"CRImageReaderImageCaptureOrientation"];
  BOOL v44 = v43 == 0;

  if (v44)
  {
    long long v48 = [v42 objectForKey:@"CRImageReaderImageCaptureOrientationPortrait"];
    int v49 = [v48 BOOLValue];

    if (!v49) {
      goto LABEL_25;
    }
    uint64_t v47 = [v39 imageByRotating90CW];

    goto LABEL_22;
  }
  long long v45 = [v42 objectForKey:@"CRImageReaderImageCaptureOrientation"];
  uint64_t v46 = [v45 intValue];

  if ((v46 - 1) <= 7)
  {
    uint64_t v47 = [v39 imageByCorrectingFromOrientation:v46];

LABEL_22:
    long long v39 = (void *)v47;
    goto LABEL_25;
  }
  if (a7)
  {
    *a7 = +[CRImageReader errorWithErrorCode:-2];
  }
LABEL_25:
  long long v50 = [(CRImageReader *)self engine];
  v51 = [v50 resultDocumentInImage:v39 options:v42 trackingSession:v57 withProgressHandler:v19 error:a7];

  if (!v38) {
    objc_msgSend(v51, "scaleBy:normalizedOffset:", width, height, x, y);
  }
  if (v27)
  {
    v52 = objc_msgSend(NSString, "stringWithFormat:", @"ocr_output_%lX.dat", v56);
    id v53 = (id)[v51 writeToFileInFolder:qword_1EB58C960 basename:v52];
    v54 = CROSLogForCategory(6);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v59 = "-[CRImageReader resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:]";
      __int16 v60 = 2112;
      uint64_t v61 = qword_1EB58C960;
      __int16 v62 = 2112;
      id v63 = v52;
      _os_log_impl(&dword_1DD733000, v54, OS_LOG_TYPE_DEBUG, "%s: Saving OCR output result at location: %@/%@", buf, 0x20u);
    }
  }
  return v51;
}

void __94__CRImageReader_resultDocumentForImage_roi_options_trackingSession_error_withProgressHandler___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CB10];
  NSTemporaryDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = objc_msgSend(v0, "fileURLWithPath:");
  v2 = (void *)qword_1EB58C960;
  qword_1EB58C960 = v1;
}

- (void)cancel
{
  id v3 = [(CRImageReader *)self engine];
  [v3 cancel];

  [(CRImageReader *)self setShouldCancel:1];
}

- (id)detectorStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 detectorStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)postProcStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 postProcStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)recognizerStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 recognizerStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)recognizerInferenceStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 recognizerInferenceStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)recognizerDecodingStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 recognizerDecodingStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)detectorInferenceStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 detectorInferenceStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)textGroupingStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 textGroupingStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)orientationCorrectionStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 orientationCorrectionStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)lineWrappingStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 lineWrappingStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)tableStructureRecognitionStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 tableStructureRecognitionStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)formAnalyzerStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 formAnalyzerStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)formDetectionStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 formDetectionStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)formPostProcessingStats
{
  id v3 = [(CRImageReader *)self engine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CRImageReader *)self engine];
    id v6 = [v5 formPostProcessingStats];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (Class)_engineClassFromOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [a1 defaultOptions];
  unint64_t v8 = (void *)[v7 mutableCopy];

  [v8 addEntriesFromDictionary:v6];
  uint64_t v9 = [v8 objectForKey:@"CRImageReaderTextDetector"];
  int v10 = [v9 isEqualToString:@"CRImageReaderTextDetectorCR"];

  double v11 = [v8 objectForKey:@"CRImageReaderTextRecognizer"];
  int v12 = [v11 isEqualToString:@"CRImageReaderTextRecognizerCR"];

  if ((v12 & v10 & 1) != 0 || ((v12 | v10) & 1) == 0)
  {
    uint64_t v13 = objc_opt_class();
  }
  else if (a4)
  {
    +[CRImageReader errorWithErrorCode:-7];
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }

  return (Class)v13;
}

+ (id)_engineFromOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (objc_class *)[a1 _engineClassFromOptions:v6 error:a4];
  if (v7) {
    unint64_t v8 = (void *)[[v7 alloc] initWithOptions:v6 error:a4];
  }
  else {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (unint64_t)_typeForFeature:(id)a3 enginePreferredRegionType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!a4)
  {
    if ([v5 subFeatureType] == 4) {
      a4 = 32;
    }
    else {
      a4 = 16;
    }
  }

  return a4;
}

- (id)documentOutputRegionForImage:(id)a3 roi:(CGRect)a4 error:(id *)a5 withProgressHandler:(id)a6
{
  id v6 = -[CRImageReader documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:](self, "documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:", a3, MEMORY[0x1E4F1CC08], 0, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return v6;
}

- (NSDictionary)userOptions
{
  return self->_userOptions;
}

- (void)setUserOptions:(id)a3
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

- (CREngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_userOptions, 0);
  objc_storeStrong((id *)&self->_outputObjectTypes, 0);
}

@end