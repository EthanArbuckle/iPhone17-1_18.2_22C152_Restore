@interface CRNeuralTextRecognizer
+ (Class)_modelClassForRevision:(int64_t)a3 language:(id)a4 error:(id *)a5;
+ (id)_modelForRevision:(int64_t)a3 configuration:(id)a4 error:(id *)a5;
+ (id)_textDecoderForRevision:(int64_t)a3 configuration:(id)a4 model:(id)a5 error:(id *)a6;
+ (id)localeToModelClassMappingForRevision:(int64_t)a3;
+ (id)recognizerForLocale:(id)a3 imageReaderOptions:(id)a4 error:(id *)a5;
- (BOOL)_isCancelled;
- (BOOL)_loadResourcesWithError:(id *)a3;
- (BOOL)performWithResource:(id)a3 error:(id *)a4;
- (BOOL)preheatWithError:(id *)a3;
- (BOOL)shouldCancel;
- (BOOL)shouldModelSupportCharacterBoxes;
- (BOOL)shouldUseLM;
- (BOOL)unloadResourcesWhenNotInUse;
- (CRNeuralRecognizerConfiguration)configuration;
- (CRNeuralTextRecognizer)init;
- (CRPerformanceStatistics)decodingStats;
- (CRPerformanceStatistics)inferenceStats;
- (CRRecognizerFeatureProviding)featureProvider;
- (CRTextDecoding)textDecoder;
- (CRTextRecognizerModel)model;
- (id)_featureProviderWithError:(id *)a3;
- (id)recognizeInImage:(id)a3 lineRegions:(id)a4 rectifier:(id)a5 progressHandler:(id)a6 error:(id *)a7;
- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4;
- (int64_t)resourceUsers;
- (unsigned)desiredQoS;
- (void)_releaseIntermediateResources;
- (void)_unloadResources;
- (void)cancel;
- (void)setConfiguration:(id)a3;
- (void)setDecodingStats:(id)a3;
- (void)setDesiredQoS:(unsigned int)a3;
- (void)setFeatureProvider:(id)a3;
- (void)setInferenceStats:(id)a3;
- (void)setModel:(id)a3;
- (void)setResourceUsers:(int64_t)a3;
- (void)setShouldCancel:(BOOL)a3;
- (void)setTextDecoder:(id)a3;
- (void)setUnloadResourcesWhenNotInUse:(BOOL)a3;
@end

@implementation CRNeuralTextRecognizer

- (CRNeuralTextRecognizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRNeuralTextRecognizer;
  v2 = [(CRNeuralTextRecognizer *)&v6 init];
  if (v2)
  {
    v3 = [[CRPerformanceStatistics alloc] initWithName:@"Recognition Inference" measureRecentPeak:0];
    [(CRNeuralTextRecognizer *)v2 setInferenceStats:v3];

    v4 = [[CRPerformanceStatistics alloc] initWithName:@"Recognizer Decoding" measureRecentPeak:0];
    [(CRNeuralTextRecognizer *)v2 setDecodingStats:v4];

    [(CRNeuralTextRecognizer *)v2 setShouldCancel:0];
    [(CRNeuralTextRecognizer *)v2 setResourceUsers:0];
    [(CRNeuralTextRecognizer *)v2 setUnloadResourcesWhenNotInUse:0];
  }
  return v2;
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  [(CRNeuralTextRecognizer *)obj setShouldCancel:1];
  objc_sync_exit(obj);
}

+ (id)recognizerForLocale:(id)a3 imageReaderOptions:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_new();
  v10 = [v7 objectForKeyedSubscript:@"CRImageReaderRevisionKey"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  [v9 setDesiredQoS:0];
  v12 = [[CRNeuralRecognizerConfiguration alloc] initWithLocale:v8 imageReaderOptions:v7 error:a5];

  [v9 setConfiguration:v12];
  v13 = [v9 configuration];

  if (v13)
  {
    v14 = [v7 objectForKeyedSubscript:@"CRImageReaderDisableScriptDetection"];
    int v15 = [v14 BOOLValue];

    if (!v8 && v11 == 3 && !v15 || (id v16 = 0, [v9 _loadResourcesWithError:0])) {
      id v16 = v9;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)localeToModelClassMappingForRevision:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = +[CRRecognizerConfiguration supportedLanguagesForVersion:](CRRecognizerConfiguration, "supportedLanguagesForVersion:");
  objc_super v6 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v16 = 0;
        uint64_t v13 = [a1 _modelClassForRevision:a3 language:v12 error:&v16];
        id v14 = v16;
        if (v13) {
          [v6 setObject:v13 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)recognizeInImage:(id)a3 lineRegions:(id)a4 rectifier:(id)a5 progressHandler:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v40 = a6;
  qos_class_t v15 = [(CRNeuralTextRecognizer *)self desiredQoS];
  if (![(CRNeuralTextRecognizer *)self desiredQoS]) {
    qos_class_t v15 = qos_class_self();
  }
  id v16 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], v15, 0);
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.CoreRecognition.recognizeText", v16);
  dispatch_group_t v18 = dispatch_group_create();
  if ([(CRNeuralTextRecognizer *)self _isCancelled])
  {
    if (a7)
    {
      +[CRImageReader errorWithErrorCode:-3];
      long long v19 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v19 = 0;
    }
    goto LABEL_24;
  }
  v38 = v14;
  v39 = v13;
  long long v20 = [(CRNeuralTextRecognizer *)self configuration];
  v37 = objc_msgSend(v12, "imageByConvertingToColorSpace:", objc_msgSend(v20, "colorSpace"));

  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__1;
  v56 = __Block_byref_object_dispose__1;
  id v57 = 0;
  v21 = [(CRNeuralTextRecognizer *)self configuration];
  uint64_t v22 = [v21 locale];
  if (+[CRImageReader languageIsLatin:v22])
  {
  }
  else
  {
    v23 = [(CRNeuralTextRecognizer *)self configuration];
    v24 = [v23 locale];
    BOOL v25 = +[CRImageReader languageIsCyrillic:v24];

    if (!v25)
    {
      char v31 = 0;
      v30 = 0;
      goto LABEL_19;
    }
  }
  v26 = [(CRNeuralTextRecognizer *)self configuration];
  if ((unint64_t)[v26 revision] < 3) {
    goto LABEL_16;
  }
  v27 = [(CRNeuralTextRecognizer *)self configuration];
  if (([v27 decodeWithLM] & 1) == 0)
  {

LABEL_16:
    v30 = 0;
    goto LABEL_17;
  }
  v28 = [(CRNeuralTextRecognizer *)self textDecoder];
  char v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) == 0)
  {
    v30 = 0;
    goto LABEL_18;
  }
  v26 = [(CRNeuralTextRecognizer *)self textDecoder];
  v30 = (void *)[v26 newLanguageRecognizerSession];
LABEL_17:

LABEL_18:
  char v31 = 1;
LABEL_19:
  v32 = objc_alloc_init(CRMutableRecognitionResult);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke;
  v41[3] = &unk_1E6CDAB88;
  v41[4] = self;
  id v12 = v37;
  id v42 = v12;
  id v43 = v39;
  id v44 = v38;
  id v33 = v30;
  char v51 = v31;
  id v45 = v33;
  v50 = &v52;
  v46 = v18;
  v47 = v17;
  v34 = v32;
  v48 = v34;
  id v49 = v40;
  [(CRNeuralTextRecognizer *)self performWithResource:v41 error:a7];
  if (a7 && (v35 = (void *)v53[5]) != 0)
  {
    long long v19 = 0;
    *a7 = v35;
  }
  else
  {
    long long v19 = v34;
  }
  id v14 = v38;
  id v13 = v39;

  _Block_object_dispose(&v52, 8);
LABEL_24:

  return v19;
}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke(uint64_t a1)
{
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2810000000;
  v21[3] = &unk_1DD8FDA7A;
  int v22 = 0;
  v2 = [*(id *)(a1 + 32) featureProvider];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_2;
  v9[3] = &unk_1E6CDAB60;
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  char v20 = *(unsigned char *)(a1 + 112);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  uint64_t v17 = *(void *)(a1 + 104);
  id v12 = v8;
  id v13 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 80);
  id v15 = *(id *)(a1 + 88);
  id v16 = *(id *)(a1 + 96);
  dispatch_group_t v18 = v21;
  long long v19 = v23;
  [v2 enumerateInputsForImage:v3 lineRegions:v4 rectifier:v5 usingBlock:v9];

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 72), 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_2(uint64_t a1, void *a2, int a3, double a4)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__1;
  id v57 = __Block_byref_object_dispose__1;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  char v51 = __Block_byref_object_dispose__1;
  id v52 = 0;
  if (*(void *)(a1 + 32)) {
    BOOL v8 = *(unsigned char *)(a1 + 112) != 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = [*(id *)(a1 + 40) inferenceStats];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_3;
  v43[3] = &unk_1E6CDAAE8;
  uint64_t v10 = *(void *)(a1 + 40);
  id v45 = &v47;
  v43[4] = v10;
  id v11 = v7;
  id v44 = v11;
  v46 = &v53;
  [v9 measureBlock:v43];

  if (v54[5])
  {
    id v12 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    objc_sync_enter(v12);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), (id)v54[5]);
    objc_sync_exit(v12);
  }
  else
  {
    if (v8)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v13 = (id)v48[5];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v59 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            dispatch_group_t v18 = [*(id *)(a1 + 40) textDecoder];
            uint64_t v19 = *(void *)(a1 + 32);
            [*(id *)(a1 + 48) size];
            objc_msgSend(v18, "computeLanguageRecognitionForSession:output:imageSize:", v19, v17);
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v59 count:16];
        }
        while (v14);
      }

      if (a3) {
        [*(id *)(a1 + 32) completeSession];
      }
    }
    if ([*(id *)(a1 + 40) _isCancelled])
    {
      id v20 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      objc_sync_enter(v20);
      uint64_t v21 = +[CRImageReader errorWithErrorCode:-3];
      uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
      v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      objc_sync_exit(v20);
    }
    else
    {
      v24 = *(NSObject **)(a1 + 56);
      BOOL v25 = *(NSObject **)(a1 + 64);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_14;
      v30[3] = &unk_1E6CDAB38;
      v26 = *(void **)(a1 + 48);
      v30[4] = *(void *)(a1 + 40);
      v34 = &v47;
      v35 = &v53;
      id v31 = v26;
      id v27 = *(id *)(a1 + 72);
      char v29 = *(void **)(a1 + 80);
      uint64_t v28 = *(void *)(a1 + 88);
      id v32 = v27;
      uint64_t v36 = v28;
      id v33 = v29;
      long long v37 = *(_OWORD *)(a1 + 96);
      double v38 = a4;
      dispatch_group_async(v24, v25, v30);
    }
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);
}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_3(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v4 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRRecognizerInferenceTime", "", buf, 2u);
  }

  id v6 = [*(id *)(a1 + 32) model];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 predictFromInputs:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v12 = (id)CRSignpostLog_signPostOSLog;
  id v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRRecognizerInferenceTime", "", v14, 2u);
  }
}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_14(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) decodingStats];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_2_15;
  v6[3] = &unk_1E6CDAB10;
  os_signpost_id_t v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 64);
  id v7 = v3;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 80);
  id v8 = v4;
  uint64_t v10 = v5;
  [v2 measureBlock:v6];

  if (*(void *)(a1 + 56))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
    *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 104)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                            + 24);
    (*(void (**)(double))(*(void *)(a1 + 56) + 16))(*(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                             + 24));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
  }
}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_2_15(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v4 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v5 = v4;
  unint64_t v33 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRRecognizerDecoderTime", "", buf, 2u);
  }
  os_signpost_id_t v34 = v3;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    uint64_t v35 = *(void *)v45;
    uint64_t v36 = v6;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v37 = v8;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
        if (objc_msgSend(*(id *)(a1 + 32), "_isCancelled", v33))
        {
          uint64_t v12 = +[CRImageReader errorWithErrorCode:-3];
          uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
          uint64_t v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;
        }
        else
        {
          uint64_t v38 = v10;
          uint64_t v15 = [*(id *)(a1 + 32) textDecoder];
          [*(id *)(a1 + 40) size];
          uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
          id obj = *(id *)(v16 + 40);
          objc_msgSend(v15, "decodeOutput:imageSize:error:", v11, &obj);
          objc_storeStrong((id *)(v16 + 40), obj);

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v14 = [v11 textFeatureInfo];
          uint64_t v17 = [v14 countByEnumeratingWithState:&v39 objects:v50 count:16];
          if (v17)
          {
            uint64_t v19 = v17;
            uint64_t v20 = *(void *)v40;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v40 != v20) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v22 = *(void **)(*((void *)&v39 + 1) + 8 * v21);
                if (v22) {
                  id Property = objc_getProperty(*(id *)(*((void *)&v39 + 1) + 8 * v21), v18, 64, 1);
                }
                else {
                  id Property = 0;
                }
                id v24 = Property;

                if (v24)
                {
                  BOOL v25 = *(void **)(a1 + 48);
                  if (v22) {
                    id v26 = objc_getProperty(v22, v18, 64, 1);
                  }
                  else {
                    id v26 = 0;
                  }
                  id v27 = v26;
                  id v49 = v27;
                  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
                  char v29 = [v22 lineRegion];
                  [v25 addRecognizedRegions:v28 detectedRegion:v29];
                }
                ++v21;
              }
              while (v19 != v21);
              uint64_t v30 = [v14 countByEnumeratingWithState:&v39 objects:v50 count:16];
              uint64_t v19 = v30;
            }
            while (v30);
            uint64_t v9 = v35;
            id v6 = v36;
          }
          uint64_t v8 = v37;
          uint64_t v10 = v38;
        }

        if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
        {
          id v32 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          objc_sync_enter(v32);
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
          objc_sync_exit(v32);

          goto LABEL_42;
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v31 = (id)CRSignpostLog_signPostOSLog;
  id v6 = v31;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v6, OS_SIGNPOST_INTERVAL_END, v34, "OCRRecognizerDecoderTime", "", buf, 2u);
  }
LABEL_42:
}

- (BOOL)shouldUseLM
{
  v2 = [(CRNeuralTextRecognizer *)self textDecoder];
  char v3 = [v2 shouldDecodeWithLM];

  return v3;
}

- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4
{
  id v5 = a4;
  id v6 = [(CRNeuralTextRecognizer *)self configuration];
  uint64_t v7 = [v6 decodeWithLM];

  uint64_t v8 = confidenceThresholds();
  uint64_t v9 = NSNumber;
  uint64_t v21 = self;
  uint64_t v10 = [(CRNeuralTextRecognizer *)self configuration];
  id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "revision"));
  uint64_t v12 = [v11 stringValue];
  uint64_t v13 = [v8 objectForKeyedSubscript:v12];
  uint64_t v14 = [NSNumber numberWithBool:v7];
  uint64_t v15 = [v14 stringValue];
  uint64_t v16 = [v13 objectForKeyedSubscript:v15];
  uint64_t v17 = [v16 objectForKeyedSubscript:v5];

  if (v17)
  {
    id v18 = v17;
  }
  else
  {
    uint64_t v19 = [(CRNeuralTextRecognizer *)v21 configuration];
    id v18 = [v19 confidenceThresholds];
  }
  return v18;
}

- (BOOL)_isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CRNeuralTextRecognizer *)v2 shouldCancel];
  objc_sync_exit(v2);

  return v3;
}

+ (Class)_modelClassForRevision:(int64_t)a3 language:(id)a4 error:(id *)a5
{
  id v7 = a4;
  switch(a3)
  {
    case 3:
      if (!+[CRImageReader languageIsChinese:v7]
        && !+[CRImageReader languageIsKorean:v7]
        && !+[CRImageReader languageIsJapanese:v7]
        && !+[CRImageReader languageIsThai:v7])
      {
        +[CRImageReader languageIsArabic:v7];
      }
      goto LABEL_11;
    case 2:
      uint64_t v9 = CROSLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1DD733000, v9, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V2 recognizer", v12, 2u);
      }

      +[CRImageReader languageIsChinese:v7];
      goto LABEL_11;
    case 1:
      uint64_t v8 = CROSLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v8, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V1 recognizer", buf, 2u);
      }

LABEL_11:
      uint64_t v10 = objc_opt_class();
      goto LABEL_12;
  }
  if (a5)
  {
    +[CRImageReader errorWithErrorCode:-4];
    uint64_t v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_12:

  return (Class)v10;
}

+ (id)_modelForRevision:(int64_t)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [v8 locale];
  uint64_t v10 = (objc_class *)[a1 _modelClassForRevision:a3 language:v9 error:a5];

  if (v10) {
    id v11 = (void *)[[v10 alloc] initWithConfiguration:v8 error:a5];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)preheatWithError:(id *)a3
{
  id v4 = [(CRNeuralTextRecognizer *)self model];
  LOBYTE(a3) = [v4 preheatWithError:a3];

  return (char)a3;
}

- (id)_featureProviderWithError:(id *)a3
{
  id v5 = [(CRNeuralTextRecognizer *)self configuration];
  unint64_t v6 = [v5 revision];

  if (v6 > 3)
  {
    if (a3)
    {
      +[CRImageReader errorWithErrorCode:-4];
      uint64_t v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    id v7 = [CRRecognizerAsyncFeatureBatchProviderV1 alloc];
    id v8 = [(CRNeuralTextRecognizer *)self configuration];
    uint64_t v9 = [(CRNeuralTextRecognizer *)self model];
    uint64_t v10 = [(CRRecognizerAsyncFeatureBatchProviderV1 *)v7 initWithConfiguration:v8 inputProvider:v9 error:a3];
  }
  return v10;
}

+ (id)_textDecoderForRevision:(int64_t)a3 configuration:(id)a4 model:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  switch(a3)
  {
    case 3:
LABEL_10:
      uint64_t v13 = [(CRCTCCVNLPTextDecoder *)[CRCTCTextDecoderV3 alloc] initWithConfiguration:v9 model:v10 error:a6];
      goto LABEL_12;
    case 2:
LABEL_7:
      uint64_t v12 = CROSLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V2 decoder", v15, 2u);
      }

      goto LABEL_10;
    case 1:
      id v11 = CROSLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V1 decoder", buf, 2u);
      }

      goto LABEL_7;
  }
  +[CRImageReader errorWithErrorCode:-4];
  uint64_t v13 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v13;
}

- (BOOL)performWithResource:(id)a3 error:(id *)a4
{
  unint64_t v6 = (void (**)(void))a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(CRNeuralTextRecognizer *)v7 model];

  if (v8 || [(CRNeuralTextRecognizer *)v7 _loadResourcesWithError:a4])
  {
    [(CRNeuralTextRecognizer *)v7 setResourceUsers:[(CRNeuralTextRecognizer *)v7 resourceUsers] + 1];
    objc_sync_exit(v7);

    v6[2](v6);
    id v9 = v7;
    objc_sync_enter(v9);
    [(CRNeuralTextRecognizer *)v9 setResourceUsers:[(CRNeuralTextRecognizer *)v9 resourceUsers] - 1];
    if (![(CRNeuralTextRecognizer *)v9 resourceUsers])
    {
      if ([(CRNeuralTextRecognizer *)v9 unloadResourcesWhenNotInUse]) {
        [(CRNeuralTextRecognizer *)v9 _unloadResources];
      }
      else {
        [(CRNeuralTextRecognizer *)v9 _releaseIntermediateResources];
      }
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }
  objc_sync_exit(v7);

  return v10;
}

- (BOOL)_loadResourcesWithError:(id *)a3
{
  id v5 = objc_opt_class();
  unint64_t v6 = [(CRNeuralTextRecognizer *)self configuration];
  uint64_t v7 = [v6 revision];
  id v8 = [(CRNeuralTextRecognizer *)self configuration];
  id v26 = 0;
  id v9 = [v5 _modelForRevision:v7 configuration:v8 error:&v26];
  id v10 = v26;
  [(CRNeuralTextRecognizer *)self setModel:v9];

  id v11 = [(CRNeuralTextRecognizer *)self model];

  if (v11)
  {
    id v25 = v10;
    uint64_t v12 = [(CRNeuralTextRecognizer *)self _featureProviderWithError:&v25];
    id v13 = v25;

    [(CRNeuralTextRecognizer *)self setFeatureProvider:v12];
    uint64_t v14 = [(CRNeuralTextRecognizer *)self featureProvider];

    if (v14)
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = [(CRNeuralTextRecognizer *)self configuration];
      uint64_t v17 = [v16 revision];
      id v18 = [(CRNeuralTextRecognizer *)self configuration];
      uint64_t v19 = [(CRNeuralTextRecognizer *)self model];
      id v24 = v13;
      uint64_t v20 = [v15 _textDecoderForRevision:v17 configuration:v18 model:v19 error:&v24];
      id v10 = v24;

      [(CRNeuralTextRecognizer *)self setTextDecoder:v20];
      uint64_t v21 = [(CRNeuralTextRecognizer *)self textDecoder];

      if (v21)
      {
        BOOL v22 = 1;
LABEL_14:
        id v13 = v10;
        goto LABEL_15;
      }
      if (a3) {
        *a3 = v10;
      }
      [(CRNeuralTextRecognizer *)self _unloadResources];
LABEL_13:
      BOOL v22 = 0;
      goto LABEL_14;
    }
    if (a3) {
      *a3 = v13;
    }
    [(CRNeuralTextRecognizer *)self _unloadResources];
    BOOL v22 = 0;
  }
  else
  {
    if (!a3) {
      goto LABEL_13;
    }
    id v13 = v10;
    BOOL v22 = 0;
    *a3 = v13;
  }
LABEL_15:

  return v22;
}

- (void)_unloadResources
{
  [(CRNeuralTextRecognizer *)self setModel:0];
  [(CRNeuralTextRecognizer *)self setFeatureProvider:0];
  [(CRNeuralTextRecognizer *)self setTextDecoder:0];
}

- (void)_releaseIntermediateResources
{
  BOOL v3 = [(CRNeuralTextRecognizer *)self model];
  [v3 releaseIntermediateBuffers];

  id v4 = [(CRNeuralTextRecognizer *)self textDecoder];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRNeuralTextRecognizer *)self textDecoder];
    [v6 releaseUnusedResources];
  }
}

- (BOOL)shouldModelSupportCharacterBoxes
{
  BOOL v3 = [(CRNeuralTextRecognizer *)self model];
  if ([v3 supportCharacterBoxes]) {
    BOOL v4 = ![(CRNeuralTextRecognizer *)self shouldUseLM];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (CRPerformanceStatistics)inferenceStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInferenceStats:(id)a3
{
}

- (CRPerformanceStatistics)decodingStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDecodingStats:(id)a3
{
}

- (CRNeuralRecognizerConfiguration)configuration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)unloadResourcesWhenNotInUse
{
  return self->_unloadResourcesWhenNotInUse;
}

- (void)setUnloadResourcesWhenNotInUse:(BOOL)a3
{
  self->_unloadResourcesWhenNotInUse = a3;
}

- (CRRecognizerFeatureProviding)featureProvider
{
  return (CRRecognizerFeatureProviding *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFeatureProvider:(id)a3
{
}

- (CRTextRecognizerModel)model
{
  return (CRTextRecognizerModel *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
}

- (CRTextDecoding)textDecoder
{
  return (CRTextDecoding *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTextDecoder:(id)a3
{
}

- (int64_t)resourceUsers
{
  return self->_resourceUsers;
}

- (void)setResourceUsers:(int64_t)a3
{
  self->_resourceUsers = a3;
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (unsigned)desiredQoS
{
  return self->_desiredQoS;
}

- (void)setDesiredQoS:(unsigned int)a3
{
  self->_desiredQoS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDecoder, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_featureProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_decodingStats, 0);
  objc_storeStrong((id *)&self->_inferenceStats, 0);
}

@end