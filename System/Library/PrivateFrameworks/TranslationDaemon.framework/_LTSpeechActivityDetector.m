@interface _LTSpeechActivityDetector
- (_LTSpeechActivityDetector)initWithDelegate:(id)a3;
- (id)nativeAudioFormat;
- (void)addSpeechAudioData:(id)a3;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
@end

@implementation _LTSpeechActivityDetector

- (_LTSpeechActivityDetector)initWithDelegate:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTSpeechActivityDetector;
  v5 = [(_LTSpeechActivityDetector *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = objc_alloc(MEMORY[0x263F179B8]);
    v8 = [(_LTSpeechActivityDetector *)v6 nativeAudioFormat];
    uint64_t v9 = [v7 initWithFormat:v8];
    streamAnalyzer = v6->_streamAnalyzer;
    v6->_streamAnalyzer = (SNAudioStreamAnalyzer *)v9;

    id v11 = objc_alloc(MEMORY[0x263F179F0]);
    v12 = (void *)[v11 initWithSoundIdentifier:*MEMORY[0x263F17A80]];
    [(SNAudioStreamAnalyzer *)v6->_streamAnalyzer addRequest:v12 withObserver:v6 error:0];
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.translation.AnalysisQueue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v15 = v6;
  }

  return v6;
}

- (id)nativeAudioFormat
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:&SupportedASBD];
  return v2;
}

- (void)addSpeechAudioData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48___LTSpeechActivityDetector_addSpeechAudioData___block_invoke;
  v7[3] = &unk_265548000;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  if (objc_msgSend(a4, "detected", a3))
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 speechActivityDetected];
    }
  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  v5 = _LTOSLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_LTSpeechActivityDetector request:didFailWithError:]((uint64_t)v4, v5);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)request:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "SNAudioStreamAnalyzer failure: %@", (uint8_t *)&v2, 0xCu);
}

@end