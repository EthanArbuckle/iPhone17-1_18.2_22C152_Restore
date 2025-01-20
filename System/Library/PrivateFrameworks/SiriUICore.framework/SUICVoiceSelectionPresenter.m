@interface SUICVoiceSelectionPresenter
- (SUICVoicePreviewing)voicePreviewer;
- (SUICVoiceSelectionDataManaging)dataManager;
- (SUICVoiceSelectionDisplaying)view;
- (SUICVoiceSelectionPresenter)initWithDataManaging:(id)a3 view:(id)a4 delegate:(id)a5 voicePreviewing:(id)a6 recognitionLanguage:(id)a7;
- (SUICVoiceSelectionPresenterDelegate)delegate;
- (SUICVoiceSelectionViewModel)voiceSelectionViewModel;
- (SUICVoiceSelectionVoiceCollection)voiceCollection;
- (id)_localizedDisplayNameForLanguageCode:(id)a3;
- (id)_voiceCollection;
- (void)_determineVoiceOrdering;
- (void)_logVoicePreview:(id)a3;
- (void)_previewVoice:(id)a3 completion:(id)a4;
- (void)_processVoiceSelection:(id)a3 completion:(id)a4;
- (void)selectRandomVoiceWithCompletion:(id)a3;
- (void)stopVoicePreview;
- (void)voicePreviewerAudioOutputDidChangePowerLevel:(float)a3;
- (void)voiceSelectionDataProviderVoiceCollectionDidChange:(id)a3;
- (void)voiceSelectionView:(id)a3 receivedRequestToSelectLanguage:(id)a4;
- (void)voiceSelectionView:(id)a3 receivedRequestToSelectVoice:(id)a4;
@end

@implementation SUICVoiceSelectionPresenter

- (SUICVoiceSelectionPresenter)initWithDataManaging:(id)a3 view:(id)a4 delegate:(id)a5 voicePreviewing:(id)a6 recognitionLanguage:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SUICVoiceSelectionPresenter;
  v18 = [(SUICVoiceSelectionPresenter *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dataManager, a3);
    objc_storeStrong((id *)&v19->_view, a4);
    objc_storeWeak((id *)&v19->_delegate, v15);
    objc_storeStrong((id *)&v19->_voicePreviewer, a6);
    [(SUICVoicePreviewing *)v19->_voicePreviewer setDelegate:v19];
    [(SUICVoiceSelectionPresenter *)v19 _determineVoiceOrdering];
    [(SUICVoiceSelectionDataManaging *)v19->_dataManager setVoiceSelectionDataProviderObserver:v19];
    [(SUICVoiceSelectionDisplaying *)v19->_view setVoiceSelectionEventHandler:v19];
    [(SUICVoiceSelectionDisplaying *)v19->_view setVoiceSelectionViewModelProvider:v19];
    [(SUICVoiceSelectionDataManaging *)v19->_dataManager setRecognitionLanguageCode:v17];
  }

  return v19;
}

- (void)selectRandomVoiceWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SUICVoiceSelectionDataManaging *)self->_dataManager voiceSelectionVoiceCollection];
  v6 = [v5 randomVoice];

  v7 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[SUICVoiceSelectionPresenter selectRandomVoiceWithCompletion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1A64CC000, v7, OS_LOG_TYPE_DEFAULT, "%s Randomly selected voice:%@", buf, 0x16u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SUICVoiceSelectionPresenter_selectRandomVoiceWithCompletion___block_invoke;
  v10[3] = &unk_1E5C59AD8;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  [(SUICVoiceSelectionPresenter *)self _processVoiceSelection:v9 completion:v10];
}

void __63__SUICVoiceSelectionPresenter_selectRandomVoiceWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = *MEMORY[0x1E4F4E360];
  v7 = *MEMORY[0x1E4F4E360];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 136315650;
      id v11 = "-[SUICVoiceSelectionPresenter selectRandomVoiceWithCompletion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1A64CC000, v6, OS_LOG_TYPE_DEFAULT, "%s Processed randomly selected voice:%@ error:%@", (uint8_t *)&v10, 0x20u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__SUICVoiceSelectionPresenter_selectRandomVoiceWithCompletion___block_invoke_cold_1();
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)stopVoicePreview
{
  if (objc_opt_respondsToSelector())
  {
    voicePreviewer = self->_voicePreviewer;
    [(SUICVoicePreviewing *)voicePreviewer stopVoicePreview];
  }
}

- (void)_determineVoiceOrdering
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_BOOL reverseVoiceOrder = 0;
  v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    BOOL reverseVoiceOrder = self->_reverseVoiceOrder;
    int v5 = 136315394;
    v6 = "-[SUICVoiceSelectionPresenter _determineVoiceOrdering]";
    __int16 v7 = 1024;
    BOOL v8 = reverseVoiceOrder;
    _os_log_impl(&dword_1A64CC000, v3, OS_LOG_TYPE_DEFAULT, "%s Should reverse order: %d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)voiceSelectionDataProviderVoiceCollectionDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  __int16 v7 = [v5 voiceSelectionVoiceCollection];

  BOOL v8 = [v7 currentVoice];
  [WeakRetained presenter:self didChangeVoiceSelection:v8];

  view = self->_view;

  [(SUICVoiceSelectionDisplaying *)view voiceSelectionViewModelDidChange];
}

- (void)voiceSelectionView:(id)a3 receivedRequestToSelectVoice:(id)a4
{
  objc_msgSend(a4, "voiceInfo", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SUICVoiceSelectionPresenter *)self _processVoiceSelection:v5 completion:0];
}

- (void)_processVoiceSelection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  dataManager = self->_dataManager;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SUICVoiceSelectionPresenter__processVoiceSelection_completion___block_invoke;
  v11[3] = &unk_1E5C59B00;
  id v9 = v7;
  id v13 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v6;
  id v12 = v10;
  [(SUICVoiceSelectionDataManaging *)dataManager changeSiriVoiceToVoice:v10 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__SUICVoiceSelectionPresenter__processVoiceSelection_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _previewVoice:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      __65__SUICVoiceSelectionPresenter__processVoiceSelection_completion___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_previewVoice:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(AFVoiceInfo *)self->_voiceBeingPreviewed isEqual:v7])
  {
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      -[SUICVoiceSelectionPresenter _previewVoice:completion:]();
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_voiceBeingPreviewed, a3);
    [(SUICVoiceSelectionPresenter *)self _logVoicePreview:v7];
    objc_initWeak(&location, self);
    voicePreviewer = self->_voicePreviewer;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke;
    v10[3] = &unk_1E5C59B50;
    objc_copyWeak(&v13, &location);
    id v11 = v7;
    id v12 = v8;
    [(SUICVoicePreviewing *)voicePreviewer previewVoice:v11 completion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke_2;
  block[3] = &unk_1E5C59B28;
  objc_copyWeak(&v12, a1 + 6);
  id v6 = a1[4];
  char v13 = a2;
  id v9 = v6;
  id v10 = v5;
  id v11 = a1[5];
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) isEqual:WeakRetained[1]])
    {
      v3 = (void *)WeakRetained[1];
      WeakRetained[1] = 0;
    }
    if (!*(unsigned char *)(a1 + 64) && os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke_2_cold_1();
    }
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 40));
    }
  }
}

- (void)voiceSelectionView:(id)a3 receivedRequestToSelectLanguage:(id)a4
{
  dataManager = self->_dataManager;
  objc_msgSend(a4, "languageCode", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SUICVoiceSelectionDataManaging *)dataManager changeSiriDialectLanguageToLanguageIdentifiedByLanguageCode:v5 completion:&__block_literal_global_4];
}

void __82__SUICVoiceSelectionPresenter_voiceSelectionView_receivedRequestToSelectLanguage___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      id v7 = "-[SUICVoiceSelectionPresenter voiceSelectionView:receivedRequestToSelectLanguage:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A64CC000, v5, OS_LOG_TYPE_DEFAULT, "%s Error changing Siri Output Accent: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (SUICVoiceSelectionViewModel)voiceSelectionViewModel
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [(SUICVoiceSelectionPresenter *)self _voiceCollection];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v3 languageCode];
  uint64_t v6 = [(SUICVoiceSelectionPresenter *)self _localizedDisplayNameForLanguageCode:v5];

  id v7 = [SUICVoiceSelectionViewModelLanguage alloc];
  __int16 v8 = [v3 languageCode];
  v36 = (void *)v6;
  uint64_t v9 = [(SUICVoiceSelectionViewModelLanguage *)v7 initWithLanguageCode:v8 localizedDisplayName:v6 isCurrentOutputLanguage:1];

  v35 = (void *)v9;
  [v4 addObject:v9];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v10 = [v3 dialectLanguageCodes];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v16 = [(SUICVoiceSelectionPresenter *)self _localizedDisplayNameForLanguageCode:v15];
        uint64_t v17 = [[SUICVoiceSelectionViewModelLanguage alloc] initWithLanguageCode:v15 localizedDisplayName:v16 isCurrentOutputLanguage:0];
        [v4 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v12);
  }

  [v4 sortUsingComparator:&__block_literal_global_17];
  BOOL reverseVoiceOrder = self->_reverseVoiceOrder;
  id v18 = v3;
  v19 = [MEMORY[0x1E4F1CA80] set];
  v20 = [v18 alternativeVoices];
  [v19 unionSet:v20];

  v34 = v18;
  objc_super v21 = [v18 currentVoice];
  if (v21) {
    [v19 addObject:v21];
  }
  v22 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v19, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v23 = v19;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v44 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [[SUICVoiceSelectionViewModelVoice alloc] initWithVoice:*(void *)(*((void *)&v43 + 1) + 8 * j) isCurrentSiriVoice:*(void *)(*((void *)&v43 + 1) + 8 * j) == (void)v21];
        [v22 addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v25);
  }

  v29 = [v22 allObjects];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = ___SUICGetViewModelVoicesForVoiceCollection_block_invoke;
  v41[3] = &__block_descriptor_33_e11_q24__0_8_16l;
  BOOL v42 = reverseVoiceOrder;
  v30 = [v29 sortedArrayUsingComparator:v41];

  v31 = [[SUICVoiceSelectionViewModel alloc] initWithLanguages:v4 voices:v30];

  return v31;
}

uint64_t __54__SUICVoiceSelectionPresenter_voiceSelectionViewModel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localizedDisplayName];
  uint64_t v6 = [v4 localizedDisplayName];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_localizedDisplayNameForLanguageCode:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F4E4C8];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  uint64_t v6 = [v5 localizedNameForSiriLanguage:v4 inDisplayLanguage:0];

  return v6;
}

- (id)_voiceCollection
{
  return (id)[(SUICVoiceSelectionDataManaging *)self->_dataManager voiceSelectionVoiceCollection];
}

- (void)voicePreviewerAudioOutputDidChangePowerLevel:(float)a3
{
  id v5 = [(SUICVoiceSelectionPresenter *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(SUICVoiceSelectionPresenter *)self delegate];
    *(float *)&double v7 = a3;
    [v8 presenter:self didChangeAudioOutputPowerLevel:v7];
  }
}

- (void)_logVoicePreview:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __48__SUICVoiceSelectionPresenter__logVoicePreview___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [*(id *)(a1 + 32) languageCode];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) languageCode];
    [v2 setObject:v4 forKey:@"languageCode"];
  }
  id v5 = [*(id *)(a1 + 32) name];

  if (v5)
  {
    char v6 = [*(id *)(a1 + 32) name];
    [v2 setObject:v6 forKey:@"voiceName"];
  }
  double v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16)];
  [v2 setObject:v7 forKey:@"isOrderReversed"];

  return v2;
}

- (SUICVoiceSelectionDataManaging)dataManager
{
  return self->_dataManager;
}

- (SUICVoiceSelectionVoiceCollection)voiceCollection
{
  return self->_voiceCollection;
}

- (SUICVoiceSelectionDisplaying)view
{
  return self->_view;
}

- (SUICVoicePreviewing)voicePreviewer
{
  return self->_voicePreviewer;
}

- (SUICVoiceSelectionPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUICVoiceSelectionPresenterDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_voicePreviewer, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_voiceCollection, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);

  objc_storeStrong((id *)&self->_voiceBeingPreviewed, 0);
}

void __63__SUICVoiceSelectionPresenter_selectRandomVoiceWithCompletion___block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_1_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1A64CC000, v2, OS_LOG_TYPE_ERROR, "%s Failed to process randomly selected voice:%@ error:%@", (uint8_t *)v3, 0x20u);
}

void __65__SUICVoiceSelectionPresenter__processVoiceSelection_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A64CC000, v0, v1, "%s Error changing Siri voice: %@", v2, v3, v4, v5, 2u);
}

- (void)_previewVoice:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A64CC000, v0, v1, "%s Voice reselected while previewing %@", v2, v3, v4, v5, 2u);
}

void __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A64CC000, v0, v1, "%s Error previewing voice: %@", v2, v3, v4, v5, 2u);
}

@end