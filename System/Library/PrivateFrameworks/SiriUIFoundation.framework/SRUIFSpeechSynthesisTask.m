@interface SRUIFSpeechSynthesisTask
- (BOOL)canUseServerTTS;
- (BOOL)durationHasElapsed;
- (BOOL)isDelayed;
- (BOOL)isEligibleForProcessing;
- (BOOL)isEligibleForSynthesis;
- (BOOL)isPhonetic;
- (BOOL)isProvisional;
- (BOOL)preparationBlockCompleted;
- (BOOL)shouldCache;
- (NSDictionary)analyticsContext;
- (NSDictionary)speakableContextInfo;
- (NSError)synthesisError;
- (NSString)gender;
- (NSString)identifier;
- (NSString)language;
- (NSString)sessionId;
- (NSString)text;
- (SAUIAudioData)audioData;
- (SAVoice)preferredVoice;
- (SRUIFSpeechSynthesisTask)initWithText:(id)a3 audioData:(id)a4 identifier:(id)a5 sessionId:(id)a6 preferredVoice:(id)a7 language:(id)a8 gender:(id)a9 provisional:(BOOL)a10 eligibleAfterDuration:(double)a11 delayed:(BOOL)a12 preparation:(id)a13 completion:(id)a14 analyticsContext:(id)a15 speakableContextInfo:(id)a16 canUseServerTTS:(BOOL)a17 eligibilityChangedQueue:(id)a18;
- (SRUIFSpeechSynthesisTaskDelegate)delegate;
- (SiriTTSBaseRequest)ttsSessionRequest;
- (id)_completion;
- (id)description;
- (int64_t)synthesisResult;
- (void)_setDurationHasElapsed:(BOOL)a3;
- (void)_setEligibleForProcessing:(BOOL)a3;
- (void)_setEligibleForSynthesis:(BOOL)a3;
- (void)_setPreparationBlockCompleted:(BOOL)a3;
- (void)_setText:(id)a3;
- (void)_updateSynthesisEligibility;
- (void)executeCompletion;
- (void)setCanUseServerTTS:(BOOL)a3;
- (void)setDelayed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPhonetic:(BOOL)a3;
- (void)setShouldCache:(BOOL)a3;
- (void)setSpeakableContextInfo:(id)a3;
- (void)setSynthesisError:(id)a3;
- (void)setSynthesisResult:(int64_t)a3;
- (void)setTtsSessionRequest:(id)a3;
@end

@implementation SRUIFSpeechSynthesisTask

- (SRUIFSpeechSynthesisTask)initWithText:(id)a3 audioData:(id)a4 identifier:(id)a5 sessionId:(id)a6 preferredVoice:(id)a7 language:(id)a8 gender:(id)a9 provisional:(BOOL)a10 eligibleAfterDuration:(double)a11 delayed:(BOOL)a12 preparation:(id)a13 completion:(id)a14 analyticsContext:(id)a15 speakableContextInfo:(id)a16 canUseServerTTS:(BOOL)a17 eligibilityChangedQueue:(id)a18
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v60 = a4;
  id v64 = a5;
  id v63 = a6;
  id v58 = a7;
  id v62 = a8;
  id v61 = a9;
  v25 = (void (**)(id, void *))a13;
  id v65 = a14;
  id v26 = a15;
  id v27 = a16;
  v28 = a18;
  v73.receiver = self;
  v73.super_class = (Class)SRUIFSpeechSynthesisTask;
  v29 = [(SRUIFSpeechSynthesisTask *)&v73 init];
  if (v29)
  {
    uint64_t v30 = [v24 copy];
    text = v29->_text;
    v29->_text = (NSString *)v30;

    uint64_t v32 = [v64 copy];
    identifier = v29->_identifier;
    v29->_identifier = (NSString *)v32;

    uint64_t v34 = [v63 copy];
    sessionId = v29->_sessionId;
    v29->_sessionId = (NSString *)v34;

    objc_storeStrong((id *)&v29->_preferredVoice, a7);
    v29->_canUseServerTTS = 1;
    v29->_provisional = a10;
    v29->_delayed = a12;
    uint64_t v36 = MEMORY[0x22A643DA0](v65);
    id completion = v29->_completion;
    v29->_id completion = (id)v36;

    uint64_t v38 = [v26 copy];
    analyticsContext = v29->_analyticsContext;
    v29->_analyticsContext = (NSDictionary *)v38;

    uint64_t v40 = [v27 copy];
    speakableContextInfo = v29->_speakableContextInfo;
    v29->_speakableContextInfo = (NSDictionary *)v40;

    uint64_t v42 = [v62 copy];
    language = v29->_language;
    v29->_language = (NSString *)v42;

    uint64_t v44 = [v61 copy];
    gender = v29->_gender;
    v29->_gender = (NSString *)v44;

    uint64_t v46 = [v60 copy];
    audioData = v29->_audioData;
    v29->_audioData = (SAUIAudioData *)v46;

    v29->_shouldCache = 1;
    v29->_canUseServerTTS = a17;
    [(SRUIFSpeechSynthesisTask *)v29 _setDurationHasElapsed:a11 <= 0.0];
    [(SRUIFSpeechSynthesisTask *)v29 _setPreparationBlockCompleted:v25 == 0];
    if ([(SRUIFSpeechSynthesisTask *)v29 preparationBlockCompleted]) {
      uint64_t v48 = [(SRUIFSpeechSynthesisTask *)v29 durationHasElapsed];
    }
    else {
      uint64_t v48 = 0;
    }
    [(SRUIFSpeechSynthesisTask *)v29 _setEligibleForProcessing:v48];
    if ([(SRUIFSpeechSynthesisTask *)v29 preparationBlockCompleted]
      && [(SRUIFSpeechSynthesisTask *)v29 durationHasElapsed])
    {
      uint64_t v49 = [(SRUIFSpeechSynthesisTask *)v29 isDelayed] ^ 1;
    }
    else
    {
      uint64_t v49 = 0;
    }
    [(SRUIFSpeechSynthesisTask *)v29 _setEligibleForSynthesis:v49];
    v50 = (os_log_t *)MEMORY[0x263F28348];
    v51 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v52 = v51;
      v53 = (SRUIFSpeechSynthesisTask *)MEMORY[0x22A643DA0](v25);
      v54 = v29->_identifier;
      *(_DWORD *)buf = 136315906;
      v75 = "-[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provis"
            "ional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServe"
            "rTTS:eligibilityChangedQueue:]";
      __int16 v76 = 2112;
      v77 = v53;
      __int16 v78 = 2048;
      double v79 = a11;
      __int16 v80 = 2112;
      v81 = v54;
      _os_log_impl(&dword_225FBA000, v52, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Preparation: %@, Eligibility delay: %f - %@", buf, 0x2Au);
    }
    objc_initWeak(&location, v29);
    if (v25)
    {
      v55 = *v50;
      if (os_log_type_enabled(*v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:prov"
              "isional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseS"
              "erverTTS:eligibilityChangedQueue:]";
        __int16 v76 = 2112;
        v77 = v29;
        _os_log_impl(&dword_225FBA000, v55, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Executing preparation block for %@", buf, 0x16u);
      }
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke;
      v69[3] = &unk_264786A10;
      v70 = v28;
      objc_copyWeak(&v71, &location);
      v25[2](v25, v69);
      objc_destroyWeak(&v71);
    }
    if (a11 > 0.0)
    {
      dispatch_time_t v56 = dispatch_time(0, (uint64_t)(a11 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke_2;
      block[3] = &unk_264786A38;
      v67 = v29;
      objc_copyWeak(&v68, &location);
      dispatch_after(v56, v28, block);
      objc_destroyWeak(&v68);
    }
    objc_destroyWeak(&location);
  }

  return v29;
}

void __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke_2;
  block[3] = &unk_2647859A8;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v9 = v5;
  char v11 = a3;
  id v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
}

void __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      v12 = "-[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provis"
            "ional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServe"
            "rTTS:eligibilityChangedQueue:]_block_invoke_2";
      __int16 v13 = 2112;
      v14 = WeakRetained;
      _os_log_impl(&dword_225FBA000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Preparation complete for %@", (uint8_t *)&v11, 0x16u);
    }
    id v5 = objc_loadWeakRetained(v2);
    [v5 _setText:*(void *)(a1 + 32)];

    id v6 = objc_loadWeakRetained(v2);
    [v6 _setPreparationBlockCompleted:1];

    id v7 = objc_loadWeakRetained(v2);
    [v7 _updateSynthesisEligibility];

    id v8 = objc_loadWeakRetained(v2);
    id v9 = v8;
    if (WeakRetained[21]) {
      BOOL v10 = *(unsigned char *)(a1 + 48) == 0;
    }
    else {
      BOOL v10 = 0;
    }
    [v8 setCanUseServerTTS:v10];
  }
}

{
  NSObject *v2;
  uint64_t v3;
  id *v4;
  id WeakRetained;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  int v11 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void *)(a1 + 32);
    id v7 = 136315394;
    id v8 = "-[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provision"
         "al:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServerTTS:e"
         "ligibilityChangedQueue:]_block_invoke";
    id v9 = 2112;
    BOOL v10 = v3;
    _os_log_impl(&dword_225FBA000, v2, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Eligibility delay elapsed %@", (uint8_t *)&v7, 0x16u);
  }
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _setDurationHasElapsed:1];

  id v6 = objc_loadWeakRetained(v4);
  [v6 _updateSynthesisEligibility];
}

- (void)setDelayed:(BOOL)a3
{
  if (self->_delayed != a3)
  {
    self->_delayed = a3;
    if (!a3) {
      [(SRUIFSpeechSynthesisTask *)self _updateSynthesisEligibility];
    }
  }
}

- (id)description
{
  if ([(SRUIFSpeechSynthesisTask *)self canUseServerTTS])
  {
    v21 = [(SRUIFSpeechSynthesisTask *)self text];
  }
  else
  {
    v21 = @"<private>";
  }
  v22 = [(SRUIFSpeechSynthesisTask *)self identifier];
  v20 = [(SRUIFSpeechSynthesisTask *)self sessionId];
  v3 = [(SAUIAudioData *)self->_audioData audioBuffer];
  uint64_t v19 = [v3 length];

  v16 = [(SRUIFSpeechSynthesisTask *)self language];
  v18 = [(SRUIFSpeechSynthesisTask *)self gender];
  [(SRUIFSpeechSynthesisTask *)self isDelayed];
  [(SRUIFSpeechSynthesisTask *)self isProvisional];
  [(SRUIFSpeechSynthesisTask *)self canUseServerTTS];
  [(SRUIFSpeechSynthesisTask *)self isEligibleForProcessing];
  [(SRUIFSpeechSynthesisTask *)self isEligibleForSynthesis];
  __int16 v13 = [(SRUIFSpeechSynthesisTask *)self synthesisError];
  v14 = [(SRUIFSpeechSynthesisTask *)self _completion];
  v17 = NSString;
  uint64_t v15 = objc_opt_class();
  v12 = NSStringFromBOOL();
  v4 = NSStringFromBOOL();
  id v5 = NSStringFromBOOL();
  id v6 = NSStringFromBOOL();
  id v7 = NSStringFromBOOL();
  id v8 = [NSNumber numberWithUnsignedInteger:v19];
  id v9 = (void *)MEMORY[0x22A643DA0](v14);
  objc_msgSend(v17, "stringWithFormat:", @"<%@ %p; text=\"%@\"; identifier=%@; sessionId=%@; delayed=%@; provisional=%@; eligibleForProcessing=%@; eligibleForSynthesis=%@; canUseServerTTS=%@; language=%@; gender=%@; audioByteCount=%@; error=%@; completion=%p>",
    v15,
    self,
    v21,
    v22,
    v20,
    v12,
    v4,
    v5,
    v6,
    v7,
    v16,
    v18,
    v8,
    v13,
  BOOL v10 = v9);

  return v10;
}

- (void)executeCompletion
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_completion)
  {
    v3 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int64_t synthesisResult = self->_synthesisResult;
      id v5 = v3;
      id v6 = SRUIFSpeechSynthesisResultGetName(synthesisResult);
      synthesisError = self->_synthesisError;
      id v8 = [(SRUIFSpeechSynthesisTask *)self identifier];
      int v10 = 136315906;
      int v11 = "-[SRUIFSpeechSynthesisTask executeCompletion]";
      __int16 v12 = 2112;
      __int16 v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = synthesisError;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Completion Result: %@ Error: %@, Task: %@", (uint8_t *)&v10, 0x2Au);
    }
    (*((void (**)(void))self->_completion + 2))();
    id completion = self->_completion;
    self->_id completion = 0;
  }
}

- (void)_updateSynthesisEligibility
{
  BOOL eligibleForProcessing = self->_eligibleForProcessing;
  BOOL eligibleForSynthesis = self->_eligibleForSynthesis;
  if ([(SRUIFSpeechSynthesisTask *)self preparationBlockCompleted]) {
    BOOL v5 = [(SRUIFSpeechSynthesisTask *)self durationHasElapsed];
  }
  else {
    BOOL v5 = 0;
  }
  [(SRUIFSpeechSynthesisTask *)self _setEligibleForProcessing:v5];
  if ([(SRUIFSpeechSynthesisTask *)self preparationBlockCompleted]
    && [(SRUIFSpeechSynthesisTask *)self durationHasElapsed])
  {
    uint64_t v6 = [(SRUIFSpeechSynthesisTask *)self isDelayed] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(SRUIFSpeechSynthesisTask *)self _setEligibleForSynthesis:v6];
  if (eligibleForProcessing != self->_eligibleForProcessing || eligibleForSynthesis != self->_eligibleForSynthesis)
  {
    id v7 = [(SRUIFSpeechSynthesisTask *)self delegate];
    [v7 taskEligibilityDidChange:self];
  }
}

- (void)_setEligibleForProcessing:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_eligibleForProcessing != a3)
  {
    self->_BOOL eligibleForProcessing = a3;
    if (a3)
    {
      v4 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315394;
        uint64_t v6 = "-[SRUIFSpeechSynthesisTask _setEligibleForProcessing:]";
        __int16 v7 = 2112;
        id v8 = self;
        _os_log_impl(&dword_225FBA000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Processing eligibility updated %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

- (void)_setEligibleForSynthesis:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_eligibleForSynthesis != a3)
  {
    self->_BOOL eligibleForSynthesis = a3;
    if (a3)
    {
      v4 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315394;
        uint64_t v6 = "-[SRUIFSpeechSynthesisTask _setEligibleForSynthesis:]";
        __int16 v7 = 2112;
        id v8 = self;
        _os_log_impl(&dword_225FBA000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Synthesis eligibility updated %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

- (NSString)text
{
  return self->_text;
}

- (void)_setText:(id)a3
{
}

- (SAUIAudioData)audioData
{
  return self->_audioData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (SAVoice)preferredVoice
{
  return self->_preferredVoice;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)gender
{
  return self->_gender;
}

- (BOOL)isPhonetic
{
  return self->_isPhonetic;
}

- (void)setIsPhonetic:(BOOL)a3
{
  self->_isPhonetic = a3;
}

- (BOOL)isEligibleForSynthesis
{
  return self->_eligibleForSynthesis;
}

- (BOOL)isEligibleForProcessing
{
  return self->_eligibleForProcessing;
}

- (BOOL)isProvisional
{
  return self->_provisional;
}

- (BOOL)isDelayed
{
  return self->_delayed;
}

- (BOOL)canUseServerTTS
{
  return self->_canUseServerTTS;
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  self->_canUseServerTTS = a3;
}

- (SiriTTSBaseRequest)ttsSessionRequest
{
  return self->_ttsSessionRequest;
}

- (void)setTtsSessionRequest:(id)a3
{
}

- (int64_t)synthesisResult
{
  return self->_synthesisResult;
}

- (void)setSynthesisResult:(int64_t)a3
{
  self->_int64_t synthesisResult = a3;
}

- (NSError)synthesisError
{
  return self->_synthesisError;
}

- (void)setSynthesisError:(id)a3
{
}

- (SRUIFSpeechSynthesisTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFSpeechSynthesisTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)analyticsContext
{
  return self->_analyticsContext;
}

- (NSDictionary)speakableContextInfo
{
  return self->_speakableContextInfo;
}

- (void)setSpeakableContextInfo:(id)a3
{
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

- (id)_completion
{
  return self->_completion;
}

- (BOOL)preparationBlockCompleted
{
  return self->_preparationBlockCompleted;
}

- (void)_setPreparationBlockCompleted:(BOOL)a3
{
  self->_preparationBlockCompleted = a3;
}

- (BOOL)durationHasElapsed
{
  return self->_durationHasElapsed;
}

- (void)_setDurationHasElapsed:(BOOL)a3
{
  self->_durationHasElapsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_speakableContextInfo, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_synthesisError, 0);
  objc_storeStrong((id *)&self->_ttsSessionRequest, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_preferredVoice, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end