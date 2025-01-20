@interface _LTMultilingualSpeechRecognizer
- (_LTMultilingualSpeechRecognizer)initWithModelURLs:(id)a3 modelVersions:(id)a4;
- (id)loadedRecognizers;
- (void)addSpeechAudioData:(id)a3;
- (void)cancelRecognition;
- (void)endAudio;
- (void)setLanguagesRecognized:(id)a3;
- (void)startRecognitionForLocale:(id)a3 autoEndpoint:(BOOL)a4 resultHandler:(id)a5;
@end

@implementation _LTMultilingualSpeechRecognizer

- (_LTMultilingualSpeechRecognizer)initWithModelURLs:(id)a3 modelVersions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_LTMultilingualSpeechRecognizer;
  v8 = [(_LTMultilingualSpeechRecognizer *)&v18 init];
  if (v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67___LTMultilingualSpeechRecognizer_initWithModelURLs_modelVersions___block_invoke;
    v15[3] = &unk_265547158;
    id v16 = v7;
    v10 = v9;
    v17 = v10;
    [v6 enumerateKeysAndObjectsUsingBlock:v15];
    recognizers = v8->_recognizers;
    v8->_recognizers = v10;
    v12 = v10;

    v13 = v8;
  }

  return v8;
}

- (void)startRecognitionForLocale:(id)a3 autoEndpoint:(BOOL)a4 resultHandler:(id)a5
{
  BOOL v30 = a4;
  v59[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v31 = a5;
  recognizers = self->_recognizers;
  v29 = v7;
  if (v7)
  {
    v9 = [(NSDictionary *)recognizers objectForKeyedSubscript:v7];
    v59[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
  }
  else
  {
    v10 = [(NSDictionary *)recognizers allValues];
  }
  queue = dispatch_queue_create("com.apple.multilingualrecognition.results", 0);
  v11 = dispatch_group_create();
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__5;
  v53[4] = __Block_byref_object_dispose__5;
  id v54 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v52[3] = 0;
  v12 = (id)_LTOSLogSpeech();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[_LTMultilingualSpeechRecognizer startRecognitionForLocale:autoEndpoint:resultHandler:](v58, [v10 count], v12);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v49 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        dispatch_group_enter(v11);
        objc_super v18 = [v17 language];
        v19 = [v18 localeIdentifier];

        v20 = _LTOSLogSpeech();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v56 = v19;
          _os_log_debug_impl(&dword_2600DC000, v20, OS_LOG_TYPE_DEBUG, "Starting recognizer: %{public}@", buf, 0xCu);
        }
        v21 = _LTOSLogSpeech();
        os_signpost_id_t v22 = os_signpost_id_generate(v21);
        v23 = v21;
        v24 = v23;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          *(_DWORD *)buf = 138543362;
          v56 = v19;
          _os_signpost_emit_with_name_impl(&dword_2600DC000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "ASR", "Starting ASR for %{public}@", buf, 0xCu);
        }

        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke;
        v37[3] = &unk_2655471A8;
        v45 = v53;
        v25 = v24;
        v38 = v25;
        os_signpost_id_t v47 = v22;
        id v26 = v19;
        id v39 = v26;
        v40 = queue;
        id v44 = v31;
        v41 = v11;
        id v27 = v13;
        id v42 = v27;
        v43 = v17;
        v46 = v52;
        [v17 startRecognitionWithAutoStop:v30 resultHandler:v37];
      }
      uint64_t v14 = [v27 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v14);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_9;
  block[3] = &unk_2655471D0;
  v35 = v53;
  v36 = v52;
  id v34 = v31;
  id v28 = v31;
  dispatch_group_notify(v11, queue, block);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v53, 8);
}

- (void)addSpeechAudioData:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(NSDictionary *)self->_recognizers allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) addSpeechAudioData:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)endAudio
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Propagate endAudio to recognizers", v2, v3, v4, v5, v6);
}

- (void)cancelRecognition
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(NSDictionary *)self->_recognizers allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cancelRecognition];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)loadedRecognizers
{
  return [(NSDictionary *)self->_recognizers allKeys];
}

- (void)setLanguagesRecognized:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _LTOSLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_LTMultilingualSpeechRecognizer setLanguagesRecognized:]();
  }
  if ([v4 isFinal] && objc_msgSend(v4, "isConfident"))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = [(NSDictionary *)self->_recognizers allValues];
    uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      v17 = &v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v11 = objc_msgSend(v10, "language", v17);
          uint64_t v12 = [v11 _ltLocaleIdentifier];
          long long v13 = [v4 dominantLanguage];
          uint64_t v14 = [v13 _ltLocaleIdentifier];
          char v15 = [v12 isEqualToString:v14];

          if ((v15 & 1) == 0)
          {
            id v16 = _LTOSLogSpeech();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              -[_LTMultilingualSpeechRecognizer setLanguagesRecognized:](v23, v16, v10, v17);
            }
            [v10 cancelRecognition];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v7);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)startRecognitionForLocale:(uint8_t *)buf autoEndpoint:(uint64_t)a2 resultHandler:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Starting recognition for %zu recognizers", buf, 0xCu);
}

- (void)setLanguagesRecognized:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 language];
  long long v9 = [v8 _ltLocaleIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a4 = v9;
  _os_log_debug_impl(&dword_2600DC000, v7, OS_LOG_TYPE_DEBUG, "Trying to cancel recognition for %{public}@", a1, 0xCu);
}

- (void)setLanguagesRecognized:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Received new language detection result", v2, v3, v4, v5, v6);
}

@end