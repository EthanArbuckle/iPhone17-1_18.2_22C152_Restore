@interface WFNextStaccatoActionStreamObserver
- (BOOL)isObserving;
- (LNMetadataProvider)metadataProvider;
- (LNTranscriptObservingProvider)observingProvider;
- (NSMutableSet)trackingActivityIDs;
- (NSUUID)connectionUUID;
- (WFConfiguredSystemIntentAction)baseAction;
- (WFNextStaccatoActionStreamObserver)init;
- (WFNextStaccatoActionStreamObserverDelegate)delegate;
- (void)didReceiveNextAction:(id)a3 baseAction:(id)a4 forAppWithBundleIdentifier:(id)a5 associatedLiveActivityIdentifier:(id)a6;
- (void)observingProviderObservationDidInterrupted:(id)a3;
- (void)removeTrackingActivityID:(id)a3;
- (void)setBaseAction:(id)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObservingProvider:(id)a3;
- (void)setTrackingActivityIDs:(id)a3;
- (void)startObservingWithCompletion:(id)a3;
- (void)stopObservingWithCompletion:(id)a3;
@end

@implementation WFNextStaccatoActionStreamObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingActivityIDs, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_observingProvider, 0);
  objc_storeStrong((id *)&self->_baseAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTrackingActivityIDs:(id)a3
{
}

- (NSMutableSet)trackingActivityIDs
{
  return self->_trackingActivityIDs;
}

- (LNMetadataProvider)metadataProvider
{
  return self->_metadataProvider;
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setObservingProvider:(id)a3
{
}

- (LNTranscriptObservingProvider)observingProvider
{
  return self->_observingProvider;
}

- (void)setBaseAction:(id)a3
{
}

- (WFConfiguredSystemIntentAction)baseAction
{
  return self->_baseAction;
}

- (void)setDelegate:(id)a3
{
}

- (WFNextStaccatoActionStreamObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFNextStaccatoActionStreamObserverDelegate *)WeakRetained;
}

- (void)observingProviderObservationDidInterrupted:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315138;
    v10 = "-[WFNextStaccatoActionStreamObserver observingProviderObservationDidInterrupted:]";
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_ERROR, "%s Next Action Observation Stream interrupted", (uint8_t *)&v9, 0xCu);
  }

  v5 = [(WFNextStaccatoActionStreamObserver *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F729A0] code:1001 userInfo:0];
    v8 = [(WFNextStaccatoActionStreamObserver *)self delegate];
    [v8 nextActionStreamObserver:self didStopObservingWithError:v7];
  }
}

- (void)didReceiveNextAction:(id)a3 baseAction:(id)a4 forAppWithBundleIdentifier:(id)a5 associatedLiveActivityIdentifier:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v62 = "-[WFNextStaccatoActionStreamObserver didReceiveNextAction:baseAction:forAppWithBundleIdentifier:associatedLive"
          "ActivityIdentifier:]";
    _os_log_impl(&dword_1B3C5C000, v14, OS_LOG_TYPE_DEBUG, "%s Received Next Action entry", buf, 0xCu);
  }

  v15 = [(WFNextStaccatoActionStreamObserver *)self baseAction];

  if (!v15) {
    goto LABEL_16;
  }
  v16 = [(WFNextStaccatoActionStreamObserver *)self baseAction];
  v17 = [v16 associatedBundleIdentifier];
  int v18 = [v17 isEqualToString:v12];

  if (!v18) {
    goto LABEL_25;
  }
  if (v13)
  {
    v19 = [(WFNextStaccatoActionStreamObserver *)self trackingActivityIDs];
    if ([v19 containsObject:v13])
    {

LABEL_16:
      v28 = [(WFNextStaccatoActionStreamObserver *)self delegate];
      char v29 = objc_opt_respondsToSelector();

      if (v29)
      {
        id v58 = v11;
        v30 = [(WFNextStaccatoActionStreamObserver *)self metadataProvider];
        v31 = [v10 identifier];
        id v60 = 0;
        v32 = [v30 actionForBundleIdentifier:v12 andActionIdentifier:v31 error:&v60];
        id v33 = v60;

        if (v32)
        {
          v34 = +[VCVoiceShortcutClient standardClient];
          id v59 = v33;
          v35 = [v34 serializedParametersForLinkAction:v10 actionMetadata:v32 error:&v59];
          id v36 = v59;

          if (v35)
          {
            id v52 = v36;
            v54 = v34;
            if (v13)
            {
              v37 = [(WFNextStaccatoActionStreamObserver *)self trackingActivityIDs];
              char v38 = [v37 containsObject:v13];

              if ((v38 & 1) == 0)
              {
                v39 = [(WFNextStaccatoActionStreamObserver *)self trackingActivityIDs];
                [v39 addObject:v13];
              }
            }
            id v40 = objc_alloc(MEMORY[0x1E4F302B8]);
            v41 = [v10 identifier];
            id v56 = v10;
            v42 = (void *)[v40 initWithAppBundleIdentifier:v12 appIntentIdentifier:v41 serializedParameters:v35];

            v43 = [v32 title];
            v44 = [v43 localizedStringForLocaleIdentifier:0];

            v45 = [WFConfiguredActionButtonIntentAction alloc];
            v46 = [(WFNextStaccatoActionStreamObserver *)self baseAction];
            v47 = [v46 previewIcon];
            v48 = [(WFConfiguredStaccatoIntentAction *)v45 initWithIntent:v42 named:v44 previewIcon:v47 appShortcutIdentifier:0 templateParameterValues:0 contextualParameters:0 shortcutsMetadata:0 colorScheme:0];

            v49 = [(WFNextStaccatoActionStreamObserver *)self delegate];
            [v49 nextActionStreamObserver:self didReceiveNextAction:v48 associatedLiveActivityIdentifier:v13];

            v34 = v54;
            id v10 = v56;
            id v36 = v52;
          }

          id v33 = v36;
        }

        id v11 = v58;
      }
      goto LABEL_25;
    }
    v53 = v19;
    v55 = v10;
    v57 = v11;
  }
  else
  {
    v55 = v10;
    v57 = v11;
  }
  v20 = [(WFNextStaccatoActionStreamObserver *)self baseAction];
  v21 = [v20 intent];
  v22 = [v21 appIntentIdentifier];
  v23 = [v57 identifier];
  if ([v22 isEqualToString:v23])
  {
    char v24 = 0;
  }
  else
  {
    v50 = [(WFNextStaccatoActionStreamObserver *)self baseAction];
    v25 = [v50 intent];
    [v25 appIntentIdentifier];
    v26 = v51 = v20;
    v27 = [v55 identifier];
    char v24 = [v26 isEqualToString:v27] ^ 1;

    v20 = v51;
  }

  if (v13) {
  id v10 = v55;
  }
  id v11 = v57;
  if ((v24 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_25:
}

- (void)removeTrackingActivityID:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNextStaccatoActionStreamObserver *)self trackingActivityIDs];
  [v5 removeObject:v4];
}

- (void)stopObservingWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFNextStaccatoActionStreamObserver *)self observingProvider];

  if (v5)
  {
    char v6 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[WFNextStaccatoActionStreamObserver stopObservingWithCompletion:]";
      _os_log_impl(&dword_1B3C5C000, v6, OS_LOG_TYPE_INFO, "%s Stopping Next Action Observation", buf, 0xCu);
    }

    v7 = [(WFNextStaccatoActionStreamObserver *)self observingProvider];
    v8 = [(WFNextStaccatoActionStreamObserver *)self connectionUUID];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__WFNextStaccatoActionStreamObserver_stopObservingWithCompletion___block_invoke;
    v9[3] = &unk_1E6079AC8;
    v9[4] = self;
    id v10 = v4;
    [v7 stopObservingNextActionStreamWithConnectionUUID:v8 completion:v9];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __66__WFNextStaccatoActionStreamObserver_stopObservingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getWFStaccatoLogObject();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[WFNextStaccatoActionStreamObserver stopObservingWithCompletion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_ERROR, "%s Failed to stop Next Action Observation: %@", (uint8_t *)&v10, 0x16u);
    }

    char v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[WFNextStaccatoActionStreamObserver stopObservingWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_INFO, "%s Next Action Observation stopped successfully", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) setObservingProvider:0];
    [*(id *)(a1 + 32) setConnectionUUID:0];
    v7 = [*(id *)(a1 + 32) delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      int v9 = [*(id *)(a1 + 32) delegate];
      [v9 nextActionStreamObserver:*(void *)(a1 + 32) didStopObservingWithError:0];
    }
    char v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

- (void)startObservingWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F72DE8]) initWithObserver:self];
  [(WFNextStaccatoActionStreamObserver *)self setObservingProvider:v5];

  char v6 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v12 = "-[WFNextStaccatoActionStreamObserver startObservingWithCompletion:]";
    _os_log_impl(&dword_1B3C5C000, v6, OS_LOG_TYPE_INFO, "%s Starting Next Action Observation", buf, 0xCu);
  }

  v7 = [(WFNextStaccatoActionStreamObserver *)self observingProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__WFNextStaccatoActionStreamObserver_startObservingWithCompletion___block_invoke;
  v9[3] = &unk_1E6078C90;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 startObservingNextActionStreamWithCompletion:v9];
}

void __67__WFNextStaccatoActionStreamObserver_startObservingWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) setConnectionUUID:a2];
  char v6 = [*(id *)(a1 + 32) connectionUUID];

  v7 = getWFStaccatoLogObject();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      v16 = "-[WFNextStaccatoActionStreamObserver startObservingWithCompletion:]_block_invoke";
      int v9 = "%s Next Action Observation started successfully";
      id v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1B3C5C000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    v16 = "-[WFNextStaccatoActionStreamObserver startObservingWithCompletion:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    int v9 = "%s Failed to start Next Action Observation: %@";
    id v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v13, v14);
}

- (WFNextStaccatoActionStreamObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFNextStaccatoActionStreamObserver;
  v2 = [(WFNextStaccatoActionStreamObserver *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F72CE0]) initWithOptions:0];
    metadataProvider = v2->_metadataProvider;
    v2->_metadataProvider = (LNMetadataProvider *)v3;

    uint64_t v5 = objc_opt_new();
    trackingActivityIDs = v2->_trackingActivityIDs;
    v2->_trackingActivityIDs = (NSMutableSet *)v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)isObserving
{
  v2 = [(WFNextStaccatoActionStreamObserver *)self connectionUUID];
  BOOL v3 = v2 != 0;

  return v3;
}

@end