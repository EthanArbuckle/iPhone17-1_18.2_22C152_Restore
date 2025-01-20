@interface SVXAceViewHandler
- (SVXAceViewHandler)initWithModule:(id)a3 instrumentationUtils:(id)a4 modeProvider:(id)a5 speechSynthesizer:(id)a6 synthesisResultConverter:(id)a7;
- (SVXAceViewHandler)initWithModule:(id)a3 instrumentationUtils:(id)a4 modeProvider:(id)a5 speechSynthesizer:(id)a6 synthesisResultConverter:(id)a7 speakableTextExtractor:(id)a8 afUtilitiesWrapper:(id)a9;
- (void)handleAceView:(id)a3 isExpository:(BOOL)a4 taskTracker:(id)a5 completion:(id)a6;
@end

@implementation SVXAceViewHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisResultConverter, 0);
  objc_storeStrong((id *)&self->_afUtilitiesWrapper, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_modeProvider, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);
  objc_storeStrong((id *)&self->_module, 0);

  objc_storeStrong((id *)&self->_speakableTextExtractor, 0);
}

- (void)handleAceView:(id)a3 isExpository:(BOOL)a4 taskTracker:(id)a5 completion:(id)a6
{
  BOOL v58 = a4;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v59 = a6;
  uint64_t v11 = mach_absolute_time();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v13 = (os_log_t *)MEMORY[0x263F28348];
  if (isKindOfClass & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v14 = [v9 dialogIdentifier];
  }
  else
  {
    v50 = [v9 dialog];

    if (v50)
    {
      os_log_t v51 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG))
      {
        v53 = v51;
        v54 = [v9 dialog];
        v55 = [v54 dialogIdentifier];
        *(_DWORD *)buf = 136315394;
        v78 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]";
        __int16 v79 = 2112;
        v80 = v55;
        _os_log_debug_impl(&dword_220062000, v53, OS_LOG_TYPE_DEBUG, "%s AceView has an SADialog...using the identifier for that: %@", buf, 0x16u);
      }
      v52 = [v9 dialog];
      v14 = [v52 dialogIdentifier];
    }
    else
    {
      v14 = 0;
    }
  }
  if ([(SVXAFUtilitiesWrapper *)self->_afUtilitiesWrapper af_IsInternalInstall])
  {
    v75[0] = @"dialogPhase";
    v15 = [v10 context];
    uint64_t v16 = [v15 dialogPhase];
    v17 = (void *)v16;
    v18 = &stru_26D1E1D80;
    if (v16) {
      v19 = (__CFString *)v16;
    }
    else {
      v19 = &stru_26D1E1D80;
    }
    v75[1] = @"dialogIdentifier";
    v76[0] = v19;
    if (v14) {
      v18 = v14;
    }
    v76[1] = v18;
    v20 = NSDictionary;
    v21 = (__CFString **)v76;
    v22 = (__CFString **)v75;
    uint64_t v23 = 2;
  }
  else
  {
    v73 = @"dialogPhase";
    v15 = [v10 context];
    uint64_t v24 = [v15 dialogPhase];
    v17 = (void *)v24;
    v25 = &stru_26D1E1D80;
    if (v24) {
      v25 = (__CFString *)v24;
    }
    v74 = v25;
    v20 = NSDictionary;
    v21 = &v74;
    v22 = &v73;
    uint64_t v23 = 1;
  }
  v57 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:v23];

  v26 = [v10 context];
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke;
  v68[3] = &unk_264553608;
  uint64_t v72 = v11;
  v27 = v14;
  v69 = v27;
  id v28 = v9;
  id v70 = v28;
  v71 = self;
  uint64_t v29 = [v26 mutatedCopyWithMutator:v68];

  v56 = (void *)v29;
  v30 = [v10 beginChildWithContext:v29];
  v31 = [(SVXAceViewSpeakableTextExtractor *)self->_speakableTextExtractor extractWithAceView:v28];
  v32 = v13;
  v33 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]";
    __int16 v79 = 2112;
    v80 = v31;
    _os_log_impl(&dword_220062000, v33, OS_LOG_TYPE_INFO, "%s speakableText = %@", buf, 0x16u);
  }
  instrumentationUtils = self->_instrumentationUtils;
  v35 = [v10 instrumentationContext];
  v36 = [v10 dialogPhase];
  [(SVXInstrumentationUtilities *)instrumentationUtils emitUUFRSaidWithModeSupport:v35 dialogIdentifier:v27 dialogPhase:v36 speakableText:v31 currentMode:[(MDModeProviding *)self->_modeProvider currentMode]];

  if ([v28 disableDeviceRacing])
  {
    v37 = *v32;
    if (os_log_type_enabled(*v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v78 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]";
      _os_log_impl(&dword_220062000, v37, OS_LOG_TYPE_DEFAULT, "%s disableDeviceRacing found to prefer server side TTS synthesis for music domain. minimizeDeviceUsage in SVXSpeechSynthesisOptions will be set", buf, 0xCu);
    }
  }
  uint64_t v38 = [v28 canUseServerTTS];
  int v39 = [v28 disableDeviceRacing];
  uint64_t v40 = 2;
  if (!v39) {
    uint64_t v40 = 0;
  }
  uint64_t v41 = v40 | v38;
  v42 = [SVXSpeechSynthesisRequest alloc];
  if (v58) {
    uint64_t v43 = 1;
  }
  else {
    uint64_t v43 = 2;
  }
  v44 = [v28 speakableContextInfo];
  v45 = [(SVXSpeechSynthesisRequest *)v42 initWithPriority:v43 options:v41 speakableText:v31 speakableContext:v44 localizationKey:0 presynthesizedAudio:0 streamID:0];

  speechSynthesizer = self->_speechSynthesizer;
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke_13;
  v65[3] = &unk_2645548C8;
  v66 = v45;
  id v67 = v28;
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke_15;
  v60[3] = &unk_264553630;
  v61 = v66;
  id v62 = v67;
  v63 = self;
  id v64 = v59;
  id v47 = v59;
  id v48 = v67;
  v49 = v66;
  [(SVXSpeechSynthesizer *)speechSynthesizer enqueueRequest:v49 languageCode:0 voiceName:0 gender:0 audioSessionID:0 preparation:v65 finalization:v60 taskTracker:v30 analyticsContext:v57];
}

void __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 setTimestamp:*(void *)(a1 + 56)];
  [v3 setDialogIdentifier:*(void *)(a1 + 32)];
  v4 = [*(id *)(a1 + 40) aceId];
  [v3 setAceId:v4];

  v5 = [*(id *)(a1 + 40) refId];
  [v3 setRefId:v5];

  v6 = [*(id *)(a1 + 40) listenAfterSpeaking];
  int v7 = [v6 BOOLValue];

  if (!v7) {
    goto LABEL_5;
  }
  v8 = [*(id *)(*(void *)(a1 + 48) + 16) preferences];
  int v9 = [v8 listenAfterSpeakingDisabled];

  if (!v9)
  {
    uint64_t v12 = 1;
    goto LABEL_7;
  }
  id v10 = *MEMORY[0x263F28348];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  uint64_t v12 = 0;
  if (v11)
  {
    int v14 = 136315138;
    v15 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]_block_invoke";
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_DEFAULT, "%s Overriding listenAfterSpeaking due to defaults", (uint8_t *)&v14, 0xCu);
LABEL_5:
    uint64_t v12 = 0;
  }
LABEL_7:
  [v3 setListensAfterSpeaking:v12];
  v13 = [*(id *)(a1 + 40) listenAfterSpeakingBehavior];
  [v3 setListenAfterSpeakingBehavior:v13];
}

void __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 136315650;
    v6 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s Begin TTS request %@ for %@.", (uint8_t *)&v5, 0x20u);
  }
}

void __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke_15(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    uint64_t v10 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s End TTS request %@ for %@ with result %@.", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v7 = a1[7];
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1[6] + 56) toServiceCommandResult:v3];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (SVXAceViewHandler)initWithModule:(id)a3 instrumentationUtils:(id)a4 modeProvider:(id)a5 speechSynthesizer:(id)a6 synthesisResultConverter:(id)a7 speakableTextExtractor:(id)a8 afUtilitiesWrapper:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SVXAceViewHandler;
  v18 = [(SVXAceViewHandler *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_speakableTextExtractor, a8);
    objc_storeStrong((id *)&v19->_module, a3);
    objc_storeStrong((id *)&v19->_instrumentationUtils, a4);
    objc_storeStrong((id *)&v19->_modeProvider, a5);
    objc_storeStrong((id *)&v19->_synthesisResultConverter, a7);
    objc_storeStrong((id *)&v19->_speechSynthesizer, a6);
    objc_storeStrong((id *)&v19->_afUtilitiesWrapper, a9);
  }

  return v19;
}

- (SVXAceViewHandler)initWithModule:(id)a3 instrumentationUtils:(id)a4 modeProvider:(id)a5 speechSynthesizer:(id)a6 synthesisResultConverter:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(SVXAceViewSpeakableTextExtractor);
  v18 = objc_alloc_init(SVXAFUtilitiesWrapper);
  v19 = [(SVXAceViewHandler *)self initWithModule:v16 instrumentationUtils:v15 modeProvider:v14 speechSynthesizer:v13 synthesisResultConverter:v12 speakableTextExtractor:v17 afUtilitiesWrapper:v18];

  return v19;
}

@end