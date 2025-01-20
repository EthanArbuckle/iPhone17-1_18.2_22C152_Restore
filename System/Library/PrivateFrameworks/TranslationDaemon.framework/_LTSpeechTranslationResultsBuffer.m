@interface _LTSpeechTranslationResultsBuffer
- (BOOL)hasFailed;
- (BOOL)hasFinished;
- (BOOL)hasResults;
- (_LTSpeechTranslationDelegate)delegate;
- (_LTSpeechTranslationResultsBuffer)init;
- (void)setDelegate:(id)a3;
- (void)signalDelegateWhenFinished;
- (void)speechRecognitionResult:(id)a3;
- (void)stopBuffering;
- (void)translationDidFinishWithError:(id)a3;
- (void)translatorDidTranslate:(id)a3;
@end

@implementation _LTSpeechTranslationResultsBuffer

- (_LTSpeechTranslationResultsBuffer)init
{
  v7.receiver = self;
  v7.super_class = (Class)_LTSpeechTranslationResultsBuffer;
  v2 = [(_LTSpeechTranslationResultsBuffer *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    lastASRResults = v2->_lastASRResults;
    v2->_lastASRResults = v3;

    v2->_isBuffering = 1;
    *(_WORD *)&v2->_didFinish = 0;
    v5 = v2;
  }

  return v2;
}

- (void)signalDelegateWhenFinished
{
  self->_signalDelegateWhenFinished = 1;
}

- (void)stopBuffering
{
  v3 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    lastASRResults = self->_lastASRResults;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50___LTSpeechTranslationResultsBuffer_stopBuffering__block_invoke;
    v12[3] = &unk_265548158;
    v12[4] = self;
    [(NSMutableDictionary *)lastASRResults enumerateKeysAndObjectsUsingBlock:v12];
  }
  if (self->_translationResult)
  {
    v6 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
      [v8 translatorDidTranslate:self->_translationResult];
    }
  }
  if (self->_didFinish)
  {
    v9 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
      [v11 translationDidFinishWithError:self->_error];
    }
  }
  self->_isBuffering = 0;
  self->_signalDelegateWhenFinished = 1;
}

- (BOOL)hasFailed
{
  return self->_error != 0;
}

- (BOOL)hasFinished
{
  return self->_didFinish;
}

- (BOOL)hasResults
{
  return [(NSMutableDictionary *)self->_lastASRResults count] || self->_translationResult != 0;
}

- (void)speechRecognitionResult:(id)a3
{
  id v4 = a3;
  if (self->_isBuffering)
  {
    if (!v4) {
      goto LABEL_7;
    }
    lastASRResults = self->_lastASRResults;
    id v9 = v4;
    v6 = [v4 locale];
    [(NSMutableDictionary *)lastASRResults setObject:v9 forKeyedSubscript:v6];
  }
  else
  {
    id v9 = v4;
    char v7 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    id v4 = v9;
    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
    v6 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
    [v6 speechRecognitionResult:v9];
  }

  id v4 = v9;
LABEL_7:
}

- (void)translatorDidTranslate:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_isBuffering)
  {
    v5 = (_LTTranslationResult *)v4;
    translationResult = self->_translationResult;
    self->_translationResult = v5;
  }
  else
  {
    char v7 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_6;
    }
    translationResult = [(_LTSpeechTranslationResultsBuffer *)self delegate];
    [translationResult translatorDidTranslate:v9];
  }

LABEL_6:
}

- (void)translationDidFinishWithError:(id)a3
{
  id v5 = a3;
  if (self->_signalDelegateWhenFinished)
  {
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Offline translation finished, informing delegate that we are all done.", v13, 2u);
    }
    char v7 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      BOOL isBuffering = self->_isBuffering;
      char v10 = [(_LTSpeechTranslationResultsBuffer *)self delegate];
      v11 = v10;
      if (isBuffering) {
        id v12 = 0;
      }
      else {
        id v12 = v5;
      }
      [v10 translationDidFinishWithError:v12];
    }
  }
  else
  {
    self->_didFinish = 1;
    objc_storeStrong((id *)&self->_error, a3);
  }
}

- (_LTSpeechTranslationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_LTSpeechTranslationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_translationResult, 0);
  objc_storeStrong((id *)&self->_lastASRResults, 0);
}

@end