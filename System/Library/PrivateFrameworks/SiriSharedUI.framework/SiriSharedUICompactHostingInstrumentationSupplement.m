@interface SiriSharedUICompactHostingInstrumentationSupplement
- (BOOL)_shouldCreateNewTurnForSiriViewControllerInteraction:(id)a3 sashItem:(id)a4;
- (SiriSharedUICompactHostingInstrumentationSupplement)initWithInstrumentationManager:(id)a3;
- (int)viewRegionForPresentedAceObject:(id)a3 resultTrasncriptItems:(id)a4 conversationTranscriptItems:(id)a5 serverUtterances:(id)a6;
- (void)_logPunchOutEventForSiriViewController:(id)a3 aceCommand:(id)a4 URL:(id)a5 appID:(id)a6 sashItem:(id)a7 shouldCreateNewTurn:(BOOL)a8;
- (void)configureSiriViewControllerWithCurrentTurn:(id)a3;
- (void)logDrillInInteractionForSnippetViewControllerIfNecessary:(id)a3;
- (void)logPunchOutEventForSiriViewController:(id)a3 aceCommand:(id)a4 URL:(id)a5 appID:(id)a6 sashItem:(id)a7;
- (void)logPunchOutEventForSiriViewController:(id)a3 aceCommands:(id)a4 sashItem:(id)a5;
@end

@implementation SiriSharedUICompactHostingInstrumentationSupplement

- (SiriSharedUICompactHostingInstrumentationSupplement)initWithInstrumentationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUICompactHostingInstrumentationSupplement;
  v6 = [(SiriSharedUICompactHostingInstrumentationSupplement *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_instrumentationManager, a3);
  }

  return v7;
}

- (int)viewRegionForPresentedAceObject:(id)a3 resultTrasncriptItems:(id)a4 conversationTranscriptItems:(id)a5 serverUtterances:(id)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v47 + 1) + 8 * i) aceObject];
        v19 = [v18 aceId];

        v20 = [v9 aceId];
        char v21 = [v19 isEqualToString:v20];

        if (v21)
        {
          LODWORD(v31) = 2;
          id v22 = v13;
          goto LABEL_29;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  v38 = v12;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v22 = v11;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v44;
LABEL_11:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v44 != v25) {
        objc_enumerationMutation(v22);
      }
      v27 = [*(id *)(*((void *)&v43 + 1) + 8 * v26) aceObject];
      v28 = [v27 aceId];

      v29 = [v9 aceId];
      char v30 = [v28 isEqualToString:v29];

      if (v30) {
        break;
      }
      if (v24 == ++v26)
      {
        uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v24) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v12 = v38;
    id v22 = v38;
    uint64_t v31 = [v22 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (!v31) {
      goto LABEL_29;
    }
    uint64_t v32 = *(void *)v40;
LABEL_19:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v40 != v32) {
        objc_enumerationMutation(v22);
      }
      v34 = [*(id *)(*((void *)&v39 + 1) + 8 * v33) aceId];
      v35 = [v9 aceId];
      char v36 = [v34 isEqualToString:v35];

      if (v36) {
        break;
      }
      if (v31 == ++v33)
      {
        uint64_t v31 = [v22 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v31) {
          goto LABEL_19;
        }
        goto LABEL_28;
      }
    }
  }
  LODWORD(v31) = 1;
LABEL_28:
  id v12 = v38;
LABEL_29:

  return v31;
}

- (void)logDrillInInteractionForSnippetViewControllerIfNecessary:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SiriSharedUICompactHostingInstrumentationSupplement *)self _shouldCreateNewTurnForSiriViewControllerInteraction:v4 sashItem:0])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F6ED78]);
    [v5 setInvocationSource:11];
    if (objc_opt_respondsToSelector())
    {
      v6 = [v4 instrumentationTurnIdentifier];
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v6];
    v8 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      id v10 = [v7 turnIdentifier];
      int v11 = 136315650;
      id v12 = "-[SiriSharedUICompactHostingInstrumentationSupplement logDrillInInteractionForSnippetViewControllerIfNecessary:]";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_20C9D5000, v9, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v11, 0x20u);
    }
    [(SRUIFInstrumentationManager *)self->_instrumentationManager storeCurrentInstrumentationTurnContext:v7];
    [(SRUIFInstrumentationManager *)self->_instrumentationManager emitInstrumentation:v5];
  }
}

- (void)configureSiriViewControllerWithCurrentTurn:(id)a3
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(SRUIFInstrumentationManager *)self->_instrumentationManager currentInstrumentationTurnContext];
    id v5 = [v4 turnIdentifier];
    [v6 setInstrumentationTurnIdentifier:v5];
  }
}

- (void)logPunchOutEventForSiriViewController:(id)a3 aceCommands:(id)a4 sashItem:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = self;
  BOOL v12 = [(SiriSharedUICompactHostingInstrumentationSupplement *)self _shouldCreateNewTurnForSiriViewControllerInteraction:v8 sashItem:v10];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v17;
          v19 = [v18 punchOutUri];
          id v20 = [v18 bundleId];
          [(SiriSharedUICompactHostingInstrumentationSupplement *)v11 _logPunchOutEventForSiriViewController:v8 aceCommand:v18 URL:v19 appID:v20 sashItem:v10 shouldCreateNewTurn:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          id v20 = v17;
          v19 = [v20 appId];
          [(SiriSharedUICompactHostingInstrumentationSupplement *)v11 _logPunchOutEventForSiriViewController:v8 aceCommand:v20 URL:0 appID:v19 sashItem:v10 shouldCreateNewTurn:v12];
        }

        BOOL v12 = 0;
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)logPunchOutEventForSiriViewController:(id)a3 aceCommand:(id)a4 URL:(id)a5 appID:(id)a6 sashItem:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  [(SiriSharedUICompactHostingInstrumentationSupplement *)self _logPunchOutEventForSiriViewController:v16 aceCommand:v15 URL:v14 appID:v13 sashItem:v12 shouldCreateNewTurn:[(SiriSharedUICompactHostingInstrumentationSupplement *)self _shouldCreateNewTurnForSiriViewControllerInteraction:v16 sashItem:v12]];
}

- (void)_logPunchOutEventForSiriViewController:(id)a3 aceCommand:(id)a4 URL:(id)a5 appID:(id)a6 sashItem:(id)a7 shouldCreateNewTurn:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v8)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = [v13 instrumentationTurnIdentifier];
    }
    else
    {
      uint64_t v17 = 0;
    }
    id v18 = (void *)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v17];
    v19 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      char v21 = [v18 turnIdentifier];
      int v26 = 136315650;
      uint64_t v27 = "-[SiriSharedUICompactHostingInstrumentationSupplement _logPunchOutEventForSiriViewController:aceCommand:URL:"
            "appID:sashItem:shouldCreateNewTurn:]";
      __int16 v28 = 2112;
      v29 = v21;
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      _os_log_impl(&dword_20C9D5000, v20, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v26, 0x20u);
    }
    [(SRUIFInstrumentationManager *)self->_instrumentationManager storeCurrentInstrumentationTurnContext:v18];
    id v22 = objc_alloc_init(MEMORY[0x263F6ED78]);
    [v22 setInvocationSource:11];
    [(SRUIFInstrumentationManager *)self->_instrumentationManager emitInstrumentation:v22];
  }
  long long v23 = [v16 applicationBundleIdentifier];
  int v24 = [v23 isEqualToString:@"com.apple.MobileSMS"];

  if (v24) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 0;
  }
  [(SRUIFInstrumentationManager *)self->_instrumentationManager emitPunchOutEventWithURL:v14 appID:v15 punchoutOrigin:v25];
}

- (BOOL)_shouldCreateNewTurnForSiriViewControllerInteraction:(id)a3 sashItem:(id)a4
{
  id v5 = a3;
  id v6 = [v5 aceObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v8 = [v5 aceObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    BOOL v9 = a4 != 0;
    id v10 = [v5 aceObject];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
    {
      char v12 = v9 | isKindOfClass ^ 1;
      goto LABEL_6;
    }
  }
  char v12 = 0;
LABEL_6:

  return v12 & 1;
}

- (void).cxx_destruct
{
}

@end