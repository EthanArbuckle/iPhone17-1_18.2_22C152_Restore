@interface _LTOfflineSpeechSynthesizer
- (_LTOfflineSpeechSynthesizer)initWithCompletion:(id)a3;
- (void)cancel;
- (void)speak:(id)a3 withContext:(id)a4;
@end

@implementation _LTOfflineSpeechSynthesizer

- (_LTOfflineSpeechSynthesizer)initWithCompletion:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_LTOfflineSpeechSynthesizer;
  v5 = [(_LTOfflineSpeechSynthesizer *)&v14 init];
  if (v5)
  {
    v6 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x263F74E28]);
    session = v5->_session;
    v5->_session = v6;

    uint64_t v8 = [v4 copy];
    id completion = v5->_completion;
    v5->_id completion = (id)v8;

    v10 = objc_alloc_init(_LTAudioDecoder);
    audioDecoder = v5->_audioDecoder;
    v5->_audioDecoder = v10;

    v12 = v5;
  }

  return v5;
}

- (void)speak:(id)a3 withContext:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  currentAudioData = self->_currentAudioData;
  self->_currentAudioData = v9;

  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  currentWordTimingInfo = self->_currentWordTimingInfo;
  self->_currentWordTimingInfo = v11;

  v13 = [v7 localePair];
  objc_super v14 = [v13 targetLocale];
  v15 = _LTLocaleMappedForTTS();

  if ((unint64_t)[v6 length] <= 0x14)
  {
    id v29 = v6;
  }
  else
  {
    v16 = [v6 substringToIndex:20];
    id v29 = [v16 stringByAppendingString:@"..."];
  }
  v17 = _LTOSLogTTS();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    v19 = [v15 localeIdentifier];
    *(_DWORD *)buf = 138740227;
    id v38 = v29;
    __int16 v39 = 2114;
    v40 = v19;
    _os_log_impl(&dword_2600DC000, v18, OS_LOG_TYPE_INFO, "Speaking: %{sensitive}@ language code %{public}@", buf, 0x16u);
  }
  if ([v6 length])
  {
    v20 = [v15 localeIdentifier];
    v21 = +[_LTDTTSAssetService voiceForLocaleIdentifier:v20];

    if (v21)
    {
      v22 = (void *)[objc_alloc(MEMORY[0x263F74E90]) initWithText:v6 voice:v21];
      v23 = [v7 outputFileURL];
      [v22 setOutputPath:v23];

      [v7 ttsPlaybackRate];
      *(float *)&double v24 = v24;
      [v22 setRate:v24];
      [v22 setPrivacySensitive:1];
      [v22 setDidReportInstrument:&__block_literal_global_19];
      objc_storeStrong((id *)&self->_currentRequest, v22);
      objc_initWeak((id *)buf, self);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_9;
      v35[3] = &unk_265547488;
      objc_copyWeak(&v36, (id *)buf);
      [(SiriTTSSynthesisRequest *)self->_currentRequest setDidGenerateAudio:v35];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_11;
      v33[3] = &unk_2655474B0;
      objc_copyWeak(&v34, (id *)buf);
      [(SiriTTSSynthesisRequest *)self->_currentRequest setDidGenerateWordTimings:v33];
      session = self->_session;
      v25 = self->_currentRequest;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_2;
      v30[3] = &unk_265547528;
      objc_copyWeak(&v32, (id *)buf);
      id v31 = v6;
      [(SiriTTSDaemonSession *)session synthesizeWithRequest:v25 didFinish:v30];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v28 = _LTOSLogTTS();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[_LTOfflineSpeechSynthesizer speak:withContext:](v28, v15);
      }
    }
  }
  else
  {
    v27 = _LTOSLogTTS();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v27, OS_LOG_TYPE_INFO, "Received zero-length or nil text speak request", buf, 2u);
    }
  }
}

- (void)cancel
{
  v3 = _LTOSLogTTS();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "TTS cancelled", v4, 2u);
  }
  [(SiriTTSDaemonSession *)self->_session cancelWithRequest:self->_currentRequest];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDecoder, 0);
  objc_storeStrong((id *)&self->_currentWordTimingInfo, 0);
  objc_storeStrong((id *)&self->_currentAudioData, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)speak:(void *)a1 withContext:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 localeIdentifier];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_2600DC000, v3, OS_LOG_TYPE_ERROR, "No synthesis voice found for %{public}@", (uint8_t *)&v5, 0xCu);
}

@end