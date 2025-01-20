@interface _LTSpeechRecognizer
- (NSLocale)language;
- (NSString)modelVersion;
- (NSURL)modelURL;
- (_LTSpeechRecognizer)initWithModelURL:(id)a3 language:(id)a4 modelVersion:(id)a5;
- (id)recognitionHandler;
- (void)_recognizedResult:(id)a3 error:(id)a4;
- (void)addSpeechAudioData:(id)a3;
- (void)cancelRecognition;
- (void)endAudio;
- (void)setRecognitionHandler:(id)a3;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
- (void)startRecognitionWithAutoStop:(BOOL)a3 resultHandler:(id)a4;
- (void)triggerServerSideEndPointer;
@end

@implementation _LTSpeechRecognizer

- (_LTSpeechRecognizer)initWithModelURL:(id)a3 language:(id)a4 modelVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)_LTSpeechRecognizer;
  v12 = [(_LTSpeechRecognizer *)&v36 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelURL, a3);
    objc_storeStrong((id *)&v13->_modelVersion, a5);
    objc_storeStrong((id *)&v13->_language, a4);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.translation.speech", 0);
    recognitionQueue = v13->_recognitionQueue;
    v13->_recognitionQueue = (OS_dispatch_queue *)v14;

    v16 = [v9 URLByAppendingPathComponent:@"mini.json"];
    v17 = objc_opt_class();
    v18 = [v16 path];
    int v19 = [v17 supportedByQuasarConfig:v18];

    v20 = _LTOSLogSpeech();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v21) {
        -[_LTSpeechRecognizer initWithModelURL:language:modelVersion:](v20);
      }
      id v22 = objc_alloc(MEMORY[0x263F3B410]);
      v23 = [v16 path];
      uint64_t v24 = [v22 initWithConfiguration:v23 useQuasarFormatter:1];
      recognizer = v13->_recognizer;
      v13->_recognizer = (_EARSpeechRecognizer *)v24;
    }
    else
    {
      id v35 = v10;
      if (v21) {
        -[_LTSpeechRecognizer initWithModelURL:language:modelVersion:](v20);
      }
      v26 = [v9 path];
      v23 = [v26 stringByAppendingPathComponent:@"ncs"];

      recognizer = [v23 stringByAppendingPathComponent:@"dispatch.voc"];
      v27 = [v23 stringByAppendingPathComponent:@"lexicon.enh"];
      v28 = [v23 stringByAppendingPathComponent:@"itn_s.enh"];
      id v29 = objc_alloc(MEMORY[0x263F3B410]);
      v30 = [v16 path];
      uint64_t v31 = [v29 initWithConfiguration:v30 overrideConfigFiles:0 generalVoc:recognizer lexiconEnh:v27 itnEnh:v28];
      v32 = v13->_recognizer;
      v13->_recognizer = (_EARSpeechRecognizer *)v31;

      id v10 = v35;
    }

    v33 = v13;
  }

  return v13;
}

- (void)startRecognitionWithAutoStop:(BOOL)a3 resultHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66___LTSpeechRecognizer_startRecognitionWithAutoStop_resultHandler___block_invoke;
  v9[3] = &unk_2655480B8;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  BOOL v12 = a3;
  id v8 = v6;
  dispatch_async(recognitionQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42___LTSpeechRecognizer_addSpeechAudioData___block_invoke;
  block[3] = &unk_265545C70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(recognitionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)endAudio
{
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31___LTSpeechRecognizer_endAudio__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(recognitionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelRecognition
{
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40___LTSpeechRecognizer_cancelRecognition__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(recognitionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)triggerServerSideEndPointer
{
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50___LTSpeechRecognizer_triggerServerSideEndPointer__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(recognitionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_recognizedResult:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recognitionQueue);
  v7 = [(_LTSpeechRecognizer *)self recognitionHandler];

  if (v7)
  {
    id v8 = [(_LTSpeechRecognizer *)self recognitionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v10, v6);

    if (v6 || v10 && [v10 isFinal])
    {
      id recognitionHandler = self->_recognitionHandler;
      self->_id recognitionHandler = 0;
    }
  }
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70___LTSpeechRecognizer_speechRecognizer_didFinishRecognitionWithError___block_invoke;
  v8[3] = &unk_2655470C0;
  objc_copyWeak(&v11, &location);
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(recognitionQueue, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71___LTSpeechRecognizer_speechRecognizer_didRecognizeFinalResultPackage___block_invoke;
  v8[3] = &unk_2655470C0;
  objc_copyWeak(&v10, &location);
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(recognitionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66___LTSpeechRecognizer_speechRecognizer_didRecognizePartialResult___block_invoke;
  v8[3] = &unk_2655470C0;
  objc_copyWeak(&v11, &location);
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(recognitionQueue, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSLocale)language
{
  return self->_language;
}

- (id)recognitionHandler
{
  return self->_recognitionHandler;
}

- (void)setRecognitionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recognitionHandler, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_finalResult, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (void)initWithModelURL:(os_log_t)log language:modelVersion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Initializing recognition with Quasar formatter", v1, 2u);
}

- (void)initWithModelURL:(os_log_t)log language:modelVersion:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Initializing recognition with config based formatter", v1, 2u);
}

@end