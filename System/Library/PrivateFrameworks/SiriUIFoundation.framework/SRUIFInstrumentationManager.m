@interface SRUIFInstrumentationManager
+ (id)sharedManager;
- (AFAnalyticsTurnBasedInstrumentationContext)currentInstrumentationTurnContext;
- (AFAnalyticsTurnBasedInstrumentationContext)previousInstrumentationTurnContext;
- (BOOL)_hasDismissedForTurnContext:(id)a3;
- (BOOL)hasNotYetEmittedLaunchContextEnd;
- (NSString)clientGeneratedDialogIdentifier;
- (SRUIFInstrumentationManager)init;
- (id)_convertVirtualAudioSubTypeToString:(unsigned int)a3;
- (id)_displayedDialogForAssistantUtteranceView:(id)a3;
- (id)_pnrErrorMessageWithError:(id)a3;
- (id)_responseContextWithPresentationType:(int)a3 dialogPhase:(id)a4 mode:(int)a5;
- (id)_routeInfoForOutputRoute;
- (id)associatedDialogIdentifiersForAceObjectIdentifier:(id)a3;
- (id)cardIDforSnippetAceID:(id)a3;
- (id)latestResponseProducingTurn;
- (id)latestStoredTurn;
- (int)currentSiriUIState;
- (void)_barrierWithCompletion:(id)a3;
- (void)_emitInstrumentation:(id)a3 forTurn:(id)a4 atTime:(unint64_t)a5;
- (void)_populateDefaultHardwareInformationWithRouteInfo:(id)a3 forTTSEvent:(id)a4;
- (void)_populateWirelessHardwareInformationWithRouteInfo:(id)a3 forTTSEvent:(id)a4;
- (void)_prepareForTesting;
- (void)_resetBargeInDetectedEvent;
- (void)_storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn;
- (void)_willInstrument:(id)a3 forTurn:(id)a4;
- (void)boostQueuedMessagesAndPerformOnQueueCompletion:(id)a3 timeout:(double)a4;
- (void)emitCasinoRelationshipEventWithViewIDFrom:(id)a3 ViewIDTo:(id)a4 casinoFromType:(int)a5;
- (void)emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier:(id)a3;
- (void)emitInstrumentation:(id)a3;
- (void)emitInstrumentation:(id)a3 atTime:(unint64_t)a4;
- (void)emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier:(id)a3;
- (void)emitPunchOutEventWithURL:(id)a3 appID:(id)a4;
- (void)emitPunchOutEventWithURL:(id)a3 appID:(id)a4 punchoutOrigin:(int)a5;
- (void)emitRequestFailedWithError:(id)a3;
- (void)emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier:(id)a3;
- (void)emitTextToSpeechBeginEvent:(id)a3;
- (void)emitTextToSpeechEndEvent:(id)a3;
- (void)emitTextToSpeechRequestReceivedEventFor:(id)a3 atTime:(unint64_t)a4;
- (void)emitUIStateTransitionEventWithFromState:(int)a3 toState:(int)a4 withPresentationType:(int)a5 machAbsoluteTransitionTime:(double)a6;
- (void)emitUIStateTransitionForSiriDismissalWithReason:(int)a3;
- (void)emitUUFRCasinoCardSelectedEventWithCardSectionID:(id)a3 ordinalCardSectionPosition:(int64_t)a4 snippetAceId:(id)a5;
- (void)emitUUFRPresentedEventWith:(id)a3 snippetClass:(id)a4 dialogIdentifier:(id)a5 dialogPhase:(id)a6;
- (void)emitUUFRShownForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5;
- (void)emitUUFRShownForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6 viewRegion:(int)a7;
- (void)emitUUFRSpokenForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6;
- (void)emitUUFRSpokenForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6 speakableText:(id)a7;
- (void)emitUUFRSpokenForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6 speakableText:(id)a7 dialogIdentifierOverride:(id)a8;
- (void)emitUserBargeInEventForBargedInTurn;
- (void)emitUserBargeInEventForBargedInTurn:(id)a3 machAbsoluteTime:(double)a4;
- (void)emitUserViewRegionInteractionEventWithViewRegion:(int)a3 userViewInteraction:(int)a4;
- (void)emitVRXInstrumentationEvent:(id)a3 aceViewId:(id)a4;
- (void)hostDidBecomeActive;
- (void)hostWillResignActive;
- (void)processSessionEvent:(int64_t)a3 isSpeechSynthesisSpeaking:(BOOL)a4 machAbsoluteTime:(double)a5;
- (void)setClientGeneratedDialogIdentifier:(id)a3;
- (void)setCurrentInstrumentationTurnContext:(id)a3;
- (void)setCurrentSiriUIState:(int)a3;
- (void)setDialogIdentifiers:(id)a3 forAceViewSpeakableTextWithIdentifier:(id)a4;
- (void)setHasNotYetEmittedLaunchContextEnd:(BOOL)a3;
- (void)setPreviousInstrumentationTurnContext:(id)a3;
- (void)storeCardID:(id)a3 forSnippetAceID:(id)a4;
- (void)storeClientGeneratedDUC:(id)a3;
- (void)storeCurrentInstrumentationTurnContext:(id)a3;
@end

@implementation SRUIFInstrumentationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

uint64_t __44__SRUIFInstrumentationManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_alloc_init(SRUIFInstrumentationManager);
  return MEMORY[0x270F9A758]();
}

- (SRUIFInstrumentationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SRUIFInstrumentationManager;
  v2 = [(SRUIFInstrumentationManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentSiriUIState = 0;
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.siri.SerialInstrumentationManagerQueue", v4);
    instrumentationManagerQueue = v3->_instrumentationManagerQueue;
    v3->_instrumentationManagerQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.SiriViewService"];
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = (NSUserDefaults *)v7;

    v3->_shouldInstrument = 1;
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    cardInfo = v3->_cardInfo;
    v3->_cardInfo = (NSMutableDictionary *)v9;
  }
  return v3;
}

- (void)storeCurrentInstrumentationTurnContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = (id)*MEMORY[0x263F28348];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 turnIdentifier];
    *(_DWORD *)buf = 136315394;
    v14 = "-[SRUIFInstrumentationManager storeCurrentInstrumentationTurnContext:]";
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New turn provided %@", buf, 0x16u);
  }
  [(SRUIFInstrumentationManager *)self setPreviousInstrumentationTurnContext:self->_currentInstrumentationTurnContext];
  [(SRUIFInstrumentationManager *)self setCurrentInstrumentationTurnContext:v4];
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__SRUIFInstrumentationManager_storeCurrentInstrumentationTurnContext___block_invoke;
  block[3] = &unk_264785A48;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __70__SRUIFInstrumentationManager_storeCurrentInstrumentationTurnContext___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained[6];
    v6 = WeakRetained;
    id v4 = [*(id *)(a1 + 32) turnIdentifier];
    dispatch_queue_t v5 = [v4 UUIDString];
    [v3 setObject:v5 forKey:@"LastStoredInstrumentationTurn"];

    [v6[6] synchronize];
    WeakRetained = v6;
  }
}

- (void)_storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__7;
  objc_super v12 = __Block_byref_object_dispose__7;
  id v13 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  id v3 = (id)*MEMORY[0x263F28348];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(id)v9[5] turnIdentifier];
    *(_DWORD *)buf = 136315394;
    v16 = "-[SRUIFInstrumentationManager _storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn]";
    __int16 v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New turn produced output %@", buf, 0x16u);
  }
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__SRUIFInstrumentationManager__storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn__block_invoke;
  block[3] = &unk_264786718;
  objc_copyWeak(&v7, &location);
  void block[4] = &v8;
  dispatch_async(instrumentationManagerQueue, block);
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
}

void __99__SRUIFInstrumentationManager__storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained[6];
    v6 = WeakRetained;
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) turnIdentifier];
    dispatch_queue_t v5 = [v4 UUIDString];
    [v3 setObject:v5 forKey:@"LatestResponseProducingTurnIdentifier"];

    [v6[6] synchronize];
    WeakRetained = v6;
  }
}

- (id)latestStoredTurn
{
  v2 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"LastStoredInstrumentationTurn"];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];

  return v3;
}

- (id)latestResponseProducingTurn
{
  v2 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"LatestResponseProducingTurnIdentifier"];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];

  return v3;
}

- (void)hostWillResignActive
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[SRUIFInstrumentationManager hostWillResignActive]";
    _os_log_impl(&dword_225FBA000, v2, OS_LOG_TYPE_DEFAULT, "%s #instrumentation", (uint8_t *)&v3, 0xCu);
  }
}

- (void)hostDidBecomeActive
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[SRUIFInstrumentationManager hostDidBecomeActive]";
    _os_log_impl(&dword_225FBA000, v2, OS_LOG_TYPE_DEFAULT, "%s #instrumentation", (uint8_t *)&v3, 0xCu);
  }
}

- (id)cardIDforSnippetAceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_cardInfo objectForKeyedSubscript:v4];
  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_cardInfo objectForKeyedSubscript:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setDialogIdentifiers:(id)a3 forAceViewSpeakableTextWithIdentifier:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
  id v20 = v7;
  v21[0] = v6;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v10 = [v8 dictionaryWithDictionary:v9];
  aceViewDialogIdentifiers = self->_aceViewDialogIdentifiers;
  self->_aceViewDialogIdentifiers = v10;

  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__SRUIFInstrumentationManager_setDialogIdentifiers_forAceViewSpeakableTextWithIdentifier___block_invoke;
  block[3] = &unk_2647859D0;
  objc_copyWeak(&v18, &location);
  id v16 = v7;
  id v17 = v6;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __90__SRUIFInstrumentationManager_setDialogIdentifiers_forAceViewSpeakableTextWithIdentifier___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v3 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = v4;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v6 = [v3 dictionaryWithDictionary:v5];
    id v7 = (void *)WeakRetained[4];
    WeakRetained[4] = v6;
  }
}

- (void)emitInstrumentation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  uint64_t v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SRUIFInstrumentationManager_emitInstrumentation___block_invoke;
  block[3] = &unk_264786A78;
  objc_copyWeak(v13, &location);
  id v11 = v4;
  id v12 = v5;
  v13[1] = v6;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __51__SRUIFInstrumentationManager_emitInstrumentation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _emitInstrumentation:*(void *)(a1 + 32) forTurn:*(void *)(a1 + 40) atTime:*(void *)(a1 + 56)];
}

- (void)emitInstrumentation:(id)a3 atTime:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SRUIFInstrumentationManager_emitInstrumentation_atTime___block_invoke;
  block[3] = &unk_264786A78;
  objc_copyWeak(v14, &location);
  id v12 = v6;
  id v13 = v7;
  v14[1] = (id)a4;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __58__SRUIFInstrumentationManager_emitInstrumentation_atTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _emitInstrumentation:*(void *)(a1 + 32) forTurn:*(void *)(a1 + 40) atTime:*(void *)(a1 + 56)];
}

- (void)_emitInstrumentation:(id)a3 forTurn:(id)a4 atTime:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFInstrumentationManager _emitInstrumentation:forTurn:atTime:](v10);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v12 = [v11 startedOrChanged];

    if (v12 || ([v11 ended], id v13 = objc_claimAutoreleasedReturnValue(), v13, v13)) {
      [(SRUIFInstrumentationManager *)self setHasNotYetEmittedLaunchContextEnd:v12 != 0];
    }
  }
  [(SRUIFInstrumentationManager *)self _willInstrument:v8 forTurn:v9];
  if (self->_shouldInstrument) {
    [v9 emitInstrumentation:v8 machAbsoluteTime:a5];
  }
}

- (void)_willInstrument:(id)a3 forTurn:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [a4 turnIdentifier];
    id v9 = [v5 formattedText];
    int v10 = 136315906;
    id v11 = "-[SRUIFInstrumentationManager _willInstrument:forTurn:]";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_225FBA000, v7, OS_LOG_TYPE_DEFAULT, "%s #noisy #instrumentation %@ in turn %@: \n%@", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)storeClientGeneratedDUC:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SRUIFInstrumentationManager_storeClientGeneratedDUC___block_invoke;
  block[3] = &unk_264785A48;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __55__SRUIFInstrumentationManager_storeClientGeneratedDUC___block_invoke(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v3 = (id *)(WeakRetained + 104);
    if (([*(id *)(a1 + 32) isEqualToString:*((void *)WeakRetained + 13)] & 1) == 0) {
      objc_storeStrong(v3, *(id *)(a1 + 32));
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)storeCardID:(id)a3 forSnippetAceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    objc_initWeak(&location, self);
    instrumentationManagerQueue = self->_instrumentationManagerQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__SRUIFInstrumentationManager_storeCardID_forSnippetAceID___block_invoke;
    v11[3] = &unk_2647859D0;
    objc_copyWeak(&v14, &location);
    id v12 = v8;
    id v13 = v6;
    dispatch_async(instrumentationManagerQueue, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    int v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFInstrumentationManager storeCardID:forSnippetAceID:]((uint64_t)v6, (uint64_t)v8, v10);
    }
  }
}

void __59__SRUIFInstrumentationManager_storeCardID_forSnippetAceID___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v3 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v6 = [v3 dictionaryWithDictionary:v5];
    id v7 = (void *)WeakRetained[5];
    WeakRetained[5] = v6;
  }
}

- (void)emitUIStateTransitionEventWithFromState:(int)a3 toState:(int)a4 withPresentationType:(int)a5 machAbsoluteTransitionTime:(double)a6
{
  id v11 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  id v14[2] = __127__SRUIFInstrumentationManager_emitUIStateTransitionEventWithFromState_toState_withPresentationType_machAbsoluteTransitionTime___block_invoke;
  v14[3] = &unk_264786AA0;
  objc_copyWeak(v16, &location);
  id v15 = v11;
  int v17 = a3;
  int v18 = a4;
  int v19 = a5;
  v16[1] = *(id *)&a6;
  id v13 = v11;
  dispatch_async(instrumentationManagerQueue, v14);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __127__SRUIFInstrumentationManager_emitUIStateTransitionEventWithFromState_toState_withPresentationType_machAbsoluteTransitionTime___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    if (![WeakRetained _hasDismissedForTurnContext:*(void *)(a1 + 32)])
    {
      id v7 = objc_alloc_init(MEMORY[0x263F6EE98]);
      [v7 setPreviousState:*(unsigned int *)(a1 + 56)];
      [v7 setCurrentState:*(unsigned int *)(a1 + 60)];
      id v8 = objc_alloc_init(MEMORY[0x263F6EE90]);
      [v7 setPresenting:v8];
      [v8 setPresentationType:*(unsigned int *)(a1 + 64)];
      objc_msgSend(v3, "setCurrentSiriUIState:", -[NSObject currentState](v7, "currentState"));
      [v3 _emitInstrumentation:v7 forTurn:*(void *)(a1 + 32) atTime:(unint64_t)*(double *)(a1 + 48)];
      int v9 = *(_DWORD *)(a1 + 60);
      BOOL v10 = (v9 & 0xFFFFFFFE) != 2 && (v9 != 5 || *(_DWORD *)(a1 + 64) != 3);
      int v12 = [v3 hasNotYetEmittedLaunchContextEnd];
      if (!v10 && v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x263F6EE50]);
        [v13 setExists:1];
        id v14 = objc_alloc_init(MEMORY[0x263F6EE48]);
        [v14 setEnded:v13];
        [v3 _emitInstrumentation:v14 forTurn:*(void *)(a1 + 32) atTime:(unint64_t)*(double *)(a1 + 48)];
      }
      goto LABEL_22;
    }
    uint64_t v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = *(_DWORD *)(a1 + 56) - 1;
      if (v5 > 4) {
        uint64_t v6 = @"SIRIUISTATE_UNKNOWN_SIRI_UI_STATE";
      }
      else {
        uint64_t v6 = off_264786C78[v5];
      }
      unsigned int v15 = *(_DWORD *)(a1 + 60) - 1;
      if (v15 > 4) {
        __int16 v16 = @"SIRIUISTATE_UNKNOWN_SIRI_UI_STATE";
      }
      else {
        __int16 v16 = off_264786C78[v15];
      }
      int v17 = *(void **)(a1 + 32);
      id v7 = v4;
      int v18 = [v17 turnIdentifier];
      id v8 = [v18 UUIDString];
      int v19 = 136315906;
      id v20 = "-[SRUIFInstrumentationManager emitUIStateTransitionEventWithFromState:toState:withPresentationType:machAbsol"
            "uteTransitionTime:]_block_invoke";
      __int16 v21 = 2112;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v16;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_225FBA000, v7, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Not instrumenting state transition %@ -> %@ for turn %@ after dismissal", (uint8_t *)&v19, 0x2Au);

LABEL_22:
    }
  }
}

- (void)emitUIStateTransitionForSiriDismissalWithReason:(int)a3
{
  objc_initWeak(&location, self);
  unsigned int v5 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  uint64_t v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__SRUIFInstrumentationManager_emitUIStateTransitionForSiriDismissalWithReason___block_invoke;
  block[3] = &unk_264786AC8;
  objc_copyWeak(v11, &location);
  int v12 = a3;
  id v10 = v5;
  v11[1] = v6;
  id v8 = v5;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

uint64_t __79__SRUIFInstrumentationManager_emitUIStateTransitionForSiriDismissalWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v9 = WeakRetained;
    if (([WeakRetained _hasDismissedForTurnContext:*(void *)(a1 + 32)] & 1) == 0)
    {
      id v3 = objc_alloc_init(MEMORY[0x263F6EE98]);
      objc_msgSend(v3, "setPreviousState:", objc_msgSend(v9, "currentSiriUIState"));
      [v3 setCurrentState:4];
      id v4 = objc_alloc_init(MEMORY[0x263F6EE88]);
      [v4 setDismissalReason:*(unsigned int *)(a1 + 56)];
      [v3 setDismissed:v4];
      objc_msgSend(v9, "setCurrentSiriUIState:", objc_msgSend(v3, "currentState"));
      [v9 _emitInstrumentation:v3 forTurn:*(void *)(a1 + 32) atTime:*(void *)(a1 + 48)];
      unsigned int v5 = [*(id *)(a1 + 32) turnIdentifier];
      uint64_t v6 = [v5 UUIDString];
      id v7 = (void *)v9[1];
      v9[1] = v6;
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  uint64_t v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__SRUIFInstrumentationManager_emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke;
  block[3] = &unk_264786A78;
  objc_copyWeak(v13, &location);
  id v11 = v4;
  id v12 = v5;
  v13[1] = v6;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __93__SRUIFInstrumentationManager_emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6EDD0]);
    [v2 setAceID:*(void *)(a1 + 32)];
    [v2 setSpeechTranscriptionType:1];
    [WeakRetained _emitInstrumentation:v2 forTurn:*(void *)(a1 + 40) atTime:*(void *)(a1 + 56)];
  }
}

- (void)emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  uint64_t v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__SRUIFInstrumentationManager_emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke;
  block[3] = &unk_264786A78;
  objc_copyWeak(v13, &location);
  id v11 = v4;
  id v12 = v5;
  v13[1] = v6;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __91__SRUIFInstrumentationManager_emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6EDD0]);
    [v2 setAceID:*(void *)(a1 + 32)];
    [v2 setSpeechTranscriptionType:2];
    [WeakRetained _emitInstrumentation:v2 forTurn:*(void *)(a1 + 40) atTime:*(void *)(a1 + 56)];
  }
}

- (void)emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  uint64_t v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__SRUIFInstrumentationManager_emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke;
  block[3] = &unk_264786A78;
  objc_copyWeak(v13, &location);
  id v11 = v4;
  id v12 = v5;
  v13[1] = v6;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __92__SRUIFInstrumentationManager_emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6EDD0]);
    [v2 setAceID:*(void *)(a1 + 32)];
    [v2 setSpeechTranscriptionType:3];
    [WeakRetained _emitInstrumentation:v2 forTurn:*(void *)(a1 + 40) atTime:*(void *)(a1 + 56)];
  }
}

- (void)emitTextToSpeechRequestReceivedEventFor:(id)a3 atTime:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __78__SRUIFInstrumentationManager_emitTextToSpeechRequestReceivedEventFor_atTime___block_invoke;
  v11[3] = &unk_264786AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  unint64_t v15 = a4;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(instrumentationManagerQueue, v11);
}

void __78__SRUIFInstrumentationManager_emitTextToSpeechRequestReceivedEventFor_atTime___block_invoke(uint64_t a1)
{
  id v8 = objc_alloc_init(MEMORY[0x263F6EDA0]);
  id v2 = [*(id *)(a1 + 32) valueForKey:@"voice_asset_key"];
  [v8 setVoiceAssetKey:v2];

  id v3 = [*(id *)(a1 + 32) valueForKey:@"voice_resource_asset_key"];
  [v8 setVoiceResourceAssetKey:v3];

  id v4 = [*(id *)(a1 + 32) valueForKey:@"is_warm_start"];
  objc_msgSend(v8, "setIsWarmStart:", objc_msgSend(v4, "BOOLValue"));

  unsigned int v5 = [*(id *)(a1 + 32) valueForKey:@"is_synthesis_cached"];
  objc_msgSend(v8, "setIsSynthesisCached:", objc_msgSend(v5, "BOOLValue"));

  id v6 = [*(id *)(a1 + 32) valueForKey:@"source_of_tts"];
  objc_msgSend(v8, "setSourceOfTTS:", objc_msgSend(v6, "intValue"));

  id v7 = [*(id *)(a1 + 32) valueForKey:@"error_code"];
  objc_msgSend(v8, "setSpeechError:", objc_msgSend(v7, "intValue"));

  [*(id *)(a1 + 40) _emitInstrumentation:v8 forTurn:*(void *)(a1 + 48) atTime:*(void *)(a1 + 56)];
}

- (void)emitTextToSpeechBeginEvent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  id v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__SRUIFInstrumentationManager_emitTextToSpeechBeginEvent___block_invoke;
  v10[3] = &unk_264786B18;
  objc_copyWeak(v14, &location);
  id v11 = v4;
  id v12 = self;
  id v13 = v5;
  v14[1] = v6;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(instrumentationManagerQueue, v10);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __58__SRUIFInstrumentationManager_emitTextToSpeechBeginEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = objc_alloc_init(MEMORY[0x263F6EDF0]);
    [v3 setAceID:*(void *)(a1 + 32)];
    id v4 = [*(id *)(a1 + 40) _routeInfoForOutputRoute];
    unsigned int v5 = [v4 valueForKey:*MEMORY[0x263F54458]];
    if ([v5 isEqual:*MEMORY[0x263F543D8]])
    {
      [*(id *)(a1 + 40) _populateDefaultHardwareInformationWithRouteInfo:v4 forTTSEvent:v3];
    }
    else if ([v5 isEqual:*MEMORY[0x263F543E8]])
    {
      [*(id *)(a1 + 40) _populateWirelessHardwareInformationWithRouteInfo:v4 forTTSEvent:v3];
    }
    [v6 _emitInstrumentation:v3 forTurn:*(void *)(a1 + 48) atTime:*(void *)(a1 + 64)];

    id WeakRetained = v6;
  }
}

- (id)_routeInfoForOutputRoute
{
  id v2 = [MEMORY[0x263F544E0] sharedAVSystemController];
  id v3 = [v2 attributeForKey:*MEMORY[0x263F543F8]];

  return v3;
}

- (void)_populateDefaultHardwareInformationWithRouteInfo:(id)a3 forTTSEvent:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [v15 valueForKey:*MEMORY[0x263F54420]];
  if (([v7 isEqualToString:@"Speaker"] & 1) == 0
    && ([v7 isEqualToString:@"CarAudioOutput"] & 1) == 0)
  {
    id v8 = [v15 valueForKey:*MEMORY[0x263F54450]];
    id v9 = [(SRUIFInstrumentationManager *)self _convertVirtualAudioSubTypeToString:1751410292];
    if (([v8 isEqualToString:v9] & 1) == 0)
    {
      id v10 = [(SRUIFInstrumentationManager *)self _convertVirtualAudioSubTypeToString:1214539380];
      if (([v8 isEqualToString:v10] & 1) == 0)
      {
        id v11 = [(SRUIFInstrumentationManager *)self _convertVirtualAudioSubTypeToString:1752709424];
        if ([v8 isEqualToString:v11])
        {
        }
        else
        {
          id v12 = [(SRUIFInstrumentationManager *)self _convertVirtualAudioSubTypeToString:2004367664];
          char v13 = [v8 isEqualToString:v12];

          if (v13)
          {
LABEL_11:

            goto LABEL_12;
          }
          id v9 = objc_alloc_init(MEMORY[0x263F6ED58]);
          id v10 = [v15 valueForKey:*MEMORY[0x263F54428]];
          id v14 = [&unk_26D9B6058 stringValue];
          [v9 setInterfaceVendorID:v14];

          [v9 setInterfaceProductID:v10];
          [v6 setHardwareInterfaceVendorID:v9];
        }
      }
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_populateWirelessHardwareInformationWithRouteInfo:(id)a3 forTTSEvent:(id)a4
{
  unsigned int v5 = (objc_class *)MEMORY[0x263F6ED58];
  id v6 = a4;
  id v7 = a3;
  id v12 = objc_alloc_init(v5);
  id v8 = [v7 valueForKey:*MEMORY[0x263F54428]];

  id v9 = [v8 componentsSeparatedByString:@","];
  id v10 = [v9 firstObject];
  id v11 = [v9 lastObject];
  [v12 setInterfaceVendorID:v10];
  [v12 setInterfaceProductID:v11];
  [v6 setHardwareInterfaceVendorID:v12];
}

- (id)_convertVirtualAudioSubTypeToString:(unsigned int)a3
{
  if (a3)
  {
    cStr[0] = HIBYTE(a3);
    cStr[1] = BYTE2(a3);
    cStr[2] = BYTE1(a3);
    cStr[3] = a3;
    cStr[4] = 0;
    id v4 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)emitTextToSpeechEndEvent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  id v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SRUIFInstrumentationManager_emitTextToSpeechEndEvent___block_invoke;
  block[3] = &unk_264786A78;
  objc_copyWeak(v13, &location);
  id v11 = v4;
  id v12 = v5;
  v13[1] = v6;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __56__SRUIFInstrumentationManager_emitTextToSpeechEndEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6EDF8]);
    [v2 setAceID:*(void *)(a1 + 32)];
    [WeakRetained _emitInstrumentation:v2 forTurn:*(void *)(a1 + 40) atTime:*(void *)(a1 + 56)];
  }
}

- (void)emitUUFRPresentedEventWith:(id)a3 snippetClass:(id)a4 dialogIdentifier:(id)a5 dialogPhase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  id v15 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __100__SRUIFInstrumentationManager_emitUUFRPresentedEventWith_snippetClass_dialogIdentifier_dialogPhase___block_invoke;
  v22[3] = &unk_264786B40;
  objc_copyWeak(v28, &location);
  id v23 = v10;
  id v24 = v11;
  id v25 = v13;
  id v26 = v12;
  id v27 = v14;
  v28[1] = v15;
  id v17 = v14;
  id v18 = v12;
  id v19 = v13;
  id v20 = v11;
  id v21 = v10;
  dispatch_async(instrumentationManagerQueue, v22);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __100__SRUIFInstrumentationManager_emitUUFRPresentedEventWith_snippetClass_dialogIdentifier_dialogPhase___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = objc_alloc_init(MEMORY[0x263F6EF00]);
    [v3 setViewID:*(void *)(a1 + 32)];
    [v3 setSnippetClass:*(void *)(a1 + 40)];
    id v4 = [*(id *)(a1 + 48) aceDialogPhaseValue];
    [v3 setDialogPhase:v4];

    if (*(void *)(a1 + 56))
    {
      objc_msgSend(v3, "setDialogIdentifier:");
    }
    else if ([*(id *)(a1 + 48) isErrorDialogPhase] && v7[13])
    {
      objc_msgSend(v3, "setDialogIdentifier:");
      unsigned int v5 = (void *)v7[13];
      v7[13] = 0;
    }
    id v6 = objc_alloc_init(MEMORY[0x263F6EEB0]);
    [v6 setViewContainer:v3];
    [v7 _emitInstrumentation:v6 forTurn:*(void *)(a1 + 64) atTime:*(void *)(a1 + 80)];

    id WeakRetained = v7;
  }
}

- (void)emitCasinoRelationshipEventWithViewIDFrom:(id)a3 ViewIDTo:(id)a4 casinoFromType:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  id v11 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__SRUIFInstrumentationManager_emitCasinoRelationshipEventWithViewIDFrom_ViewIDTo_casinoFromType___block_invoke;
  block[3] = &unk_264786B68;
  objc_copyWeak(v20, &location);
  id v17 = v8;
  id v18 = v9;
  int v21 = a5;
  id v19 = v10;
  v20[1] = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __97__SRUIFInstrumentationManager_emitCasinoRelationshipEventWithViewIDFrom_ViewIDTo_casinoFromType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6ED18]);
    [v2 setViewIDFrom:*(void *)(a1 + 32)];
    [v2 setViewIDTo:*(void *)(a1 + 40)];
    [v2 setCasinoFromType:*(unsigned int *)(a1 + 72)];
    [WeakRetained _emitInstrumentation:v2 forTurn:*(void *)(a1 + 48) atTime:*(void *)(a1 + 64)];
  }
}

- (void)emitUserViewRegionInteractionEventWithViewRegion:(int)a3 userViewInteraction:(int)a4
{
  id v7 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  id v8 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__SRUIFInstrumentationManager_emitUserViewRegionInteractionEventWithViewRegion_userViewInteraction___block_invoke;
  block[3] = &unk_264786B90;
  objc_copyWeak(v13, &location);
  int v14 = a3;
  int v15 = a4;
  id v12 = v7;
  v13[1] = v8;
  id v10 = v7;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __100__SRUIFInstrumentationManager_emitUserViewRegionInteractionEventWithViewRegion_userViewInteraction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6EEE8]);
    [v2 setViewRegionDesignation:*(unsigned int *)(a1 + 56)];
    [v2 setUserViewInteraction:*(unsigned int *)(a1 + 60)];
    [WeakRetained _emitInstrumentation:v2 forTurn:*(void *)(a1 + 32) atTime:*(void *)(a1 + 48)];
  }
}

- (void)emitUUFRShownForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5
{
}

- (void)emitUUFRShownForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6 viewRegion:(int)a7
{
  id v12 = a3;
  id v13 = a5;
  int v14 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  int v15 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__SRUIFInstrumentationManager_emitUUFRShownForAceObject_presentationType_dialogPhase_mode_viewRegion___block_invoke;
  block[3] = &unk_264786BB8;
  id v21 = v12;
  v22 = self;
  id v23 = v13;
  int v26 = a4;
  int v27 = a6;
  int v28 = a7;
  id v17 = v13;
  id v18 = v12;
  objc_copyWeak(v25, &location);
  id v24 = v14;
  v25[1] = v15;
  id v19 = v14;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __102__SRUIFInstrumentationManager_emitUUFRShownForAceObject_presentationType_dialogPhase_mode_viewRegion___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) _uufrShownRequestedByInstrumentationManager:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 40) _responseContextWithPresentationType:*(unsigned int *)(a1 + 80) dialogPhase:*(void *)(a1 + 48) mode:*(unsigned int *)(a1 + 84)];
  [v9 setSiriResponseContext:v2];
  [v9 setViewRegionDesignation:*(unsigned int *)(a1 + 88)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(id *)(a1 + 32);
    if ([v3 canUseServerTTS])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      unsigned int v5 = [WeakRetained _displayedDialogForAssistantUtteranceView:v3];

      if (v5)
      {
        id v6 = [v5 linkId];
        [v9 setLinkId:v6];

        id v7 = objc_loadWeakRetained((id *)(a1 + 64));
        [v7 _emitInstrumentation:v9 forTurn:*(void *)(a1 + 56) atTime:*(void *)(a1 + 72)];

        id v8 = objc_loadWeakRetained((id *)(a1 + 64));
        [v8 _emitInstrumentation:v5 forTurn:*(void *)(a1 + 56) atTime:*(void *)(a1 + 72)];

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  unsigned int v5 = objc_loadWeakRetained((id *)(a1 + 64));
  [v5 _emitInstrumentation:v9 forTurn:*(void *)(a1 + 56) atTime:*(void *)(a1 + 72)];
LABEL_7:

  [*(id *)(a1 + 40) _storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn];
}

- (id)_displayedDialogForAssistantUtteranceView:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F6EED0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc(MEMORY[0x263F6EEE0]);
  id v7 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v8 = (void *)[v6 initWithNSUUID:v7];

  id v9 = [v4 text];

  [v5 setDisplayedSiriDialogOutput:v9];
  [v5 setLinkId:v8];

  return v5;
}

- (void)emitUUFRSpokenForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6
{
}

- (void)emitUUFRSpokenForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6 speakableText:(id)a7
{
}

- (void)emitUUFRSpokenForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6 speakableText:(id)a7 dialogIdentifierOverride:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  objc_initWeak(&location, self);
  id v18 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  id v19 = (void *)mach_absolute_time();
  queue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __131__SRUIFInstrumentationManager_emitUUFRSpokenForAceObject_presentationType_dialogPhase_mode_speakableText_dialogIdentifierOverride___block_invoke;
  block[3] = &unk_264786BE0;
  objc_copyWeak(v33, &location);
  int v34 = a4;
  int v35 = a6;
  id v27 = v15;
  id v28 = v14;
  id v29 = v16;
  id v30 = v18;
  v33[1] = v19;
  id v31 = v17;
  v32 = self;
  id v20 = v17;
  id v21 = v18;
  id v22 = v16;
  id v23 = v14;
  id v24 = v15;
  dispatch_async(queue, block);

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
}

void __131__SRUIFInstrumentationManager_emitUUFRSpokenForAceObject_presentationType_dialogPhase_mode_speakableText_dialogIdentifierOverride___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _responseContextWithPresentationType:*(unsigned int *)(a1 + 96) dialogPhase:*(void *)(a1 + 32) mode:*(unsigned int *)(a1 + 100)];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v5 = objc_msgSend(*(id *)(a1 + 40), "sruif__uufrSaid");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v10 setSiriResponseContext:v4];
          if ([*(id *)(a1 + 48) containsString:@"\\audio=/successSonicResponse"])
          {
            [v10 setHasSonicResponse:1];
            if ([*(id *)(a1 + 48) containsString:@"\\audio=/successSonicResponse&overlap"])uint64_t v11 = 2; {
            else
            }
              uint64_t v11 = 4;
            [v10 setSonicResponse:v11];
          }
          [v3 _emitInstrumentation:v10 forTurn:*(void *)(a1 + 56) atTime:*(void *)(a1 + 88)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    id v12 = (void *)v3[4];
    id v13 = [*(id *)(a1 + 40) aceId];
    id v14 = [v12 objectForKeyedSubscript:v13];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = v14;
    uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          id v20 = objc_alloc_init(MEMORY[0x263F6EEB8]);
          id v21 = *(void **)(a1 + 64);
          if (!v21) {
            id v21 = v19;
          }
          id v22 = v21;
          [v20 setDialogIdentifier:v22];
          id v23 = [*(id *)(a1 + 40) aceId];
          [v20 setAceViewID:v23];

          id v24 = [*(id *)(a1 + 40) encodedClassName];
          [v20 setAceViewClass:v24];

          [v20 setSiriResponseContext:v4];
          [v3 _emitInstrumentation:v20 forTurn:*(void *)(a1 + 56) atTime:*(void *)(a1 + 88)];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v16);
    }

    [*(id *)(a1 + 72) _storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn];
  }
}

- (void)emitUUFRCasinoCardSelectedEventWithCardSectionID:(id)a3 ordinalCardSectionPosition:(int64_t)a4 snippetAceId:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)mach_absolute_time();
  uint64_t v11 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__SRUIFInstrumentationManager_emitUUFRCasinoCardSelectedEventWithCardSectionID_ordinalCardSectionPosition_snippetAceId___block_invoke;
  block[3] = &unk_264786C08;
  objc_copyWeak(v20, &location);
  id v17 = v8;
  id v18 = v9;
  v20[1] = (id)a4;
  id v20[2] = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __120__SRUIFInstrumentationManager_emitUUFRCasinoCardSelectedEventWithCardSectionID_ordinalCardSectionPosition_snippetAceId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6EEC0]);
    id v3 = objc_alloc_init(MEMORY[0x263F6EEA0]);
    [v3 setCardSectionId:*(void *)(a1 + 32)];
    [v3 setOrdinalCardSectionPosition:*(unsigned int *)(a1 + 64)];
    [v3 setSnippetAceId:*(void *)(a1 + 40)];
    [v2 setCasinoCardSelected:v3];
    [WeakRetained _emitInstrumentation:v2 forTurn:*(void *)(a1 + 48) atTime:*(void *)(a1 + 72)];
  }
}

- (void)emitUserBargeInEventForBargedInTurn
{
  id v3 = [(SRUIFInstrumentationManager *)self previousInstrumentationTurnContext];
  [(SRUIFInstrumentationManager *)self emitUserBargeInEventForBargedInTurn:v3 machAbsoluteTime:(double)mach_absolute_time()];
}

- (void)emitUserBargeInEventForBargedInTurn:(id)a3 machAbsoluteTime:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __84__SRUIFInstrumentationManager_emitUserBargeInEventForBargedInTurn_machAbsoluteTime___block_invoke;
  v9[3] = &unk_264785980;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = *(id *)&a4;
  id v8 = v6;
  dispatch_async(instrumentationManagerQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __84__SRUIFInstrumentationManager_emitUserBargeInEventForBargedInTurn_machAbsoluteTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6EE78]);
    [v2 setExists:1];
    [WeakRetained _emitInstrumentation:v2 forTurn:*(void *)(a1 + 32) atTime:(unint64_t)*(double *)(a1 + 48)];
  }
}

- (void)processSessionEvent:(int64_t)a3 isSpeechSynthesisSpeaking:(BOOL)a4 machAbsoluteTime:(double)a5
{
  id v9 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__SRUIFInstrumentationManager_processSessionEvent_isSpeechSynthesisSpeaking_machAbsoluteTime___block_invoke;
  v12[3] = &unk_264786C30;
  objc_copyWeak(v14, &location);
  BOOL v15 = a4;
  id v14[2] = *(id *)&a5;
  v14[1] = (id)a3;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(instrumentationManagerQueue, v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __94__SRUIFInstrumentationManager_processSessionEvent_isSpeechSynthesisSpeaking_machAbsoluteTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 == 13)
    {
      if (!*((unsigned char *)WeakRetained + 57)) {
        goto LABEL_13;
      }
      id v4 = WeakRetained;
      [WeakRetained _resetBargeInDetectedEvent];
      goto LABEL_12;
    }
    if (v3 == 12)
    {
      if (!*((unsigned char *)WeakRetained + 57)) {
        goto LABEL_13;
      }
      *((unsigned char *)WeakRetained + 57) = 0;
      id v4 = WeakRetained;
      [WeakRetained emitUserBargeInEventForBargedInTurn:*((void *)WeakRetained + 9) machAbsoluteTime:*((double *)WeakRetained + 8)];
      [v4 _resetBargeInDetectedEvent];
      goto LABEL_12;
    }
    if (v3 == 11 && *(unsigned char *)(a1 + 64) && !*((unsigned char *)WeakRetained + 57))
    {
      *((unsigned char *)WeakRetained + 57) = 1;
      *((void *)WeakRetained + 8) = *(void *)(a1 + 56);
      id v4 = WeakRetained;
      objc_storeStrong((id *)WeakRetained + 9, *(id *)(a1 + 32));
LABEL_12:
      id WeakRetained = v4;
    }
  }
LABEL_13:
}

- (void)emitPunchOutEventWithURL:(id)a3 appID:(id)a4
{
}

- (void)emitPunchOutEventWithURL:(id)a3 appID:(id)a4 punchoutOrigin:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  id v11 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__SRUIFInstrumentationManager_emitPunchOutEventWithURL_appID_punchoutOrigin___block_invoke;
  block[3] = &unk_264786B68;
  objc_copyWeak(v20, &location);
  id v17 = v8;
  id v18 = v9;
  int v21 = a5;
  id v19 = v10;
  v20[1] = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __77__SRUIFInstrumentationManager_emitPunchOutEventWithURL_appID_punchoutOrigin___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = NSString;
      id v5 = [v3 scheme];
      id v6 = [v4 stringWithFormat:@"%@://%@", v5, @"#TRUNCATED"];

      uint64_t v7 = [NSURL URLWithString:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v8 = objc_alloc_init(MEMORY[0x263F6EDB0]);
    id v9 = [v7 absoluteString];
    [v8 setUrlScheme:v9];

    [v8 setAppID:*(void *)(a1 + 40)];
    [v8 setPunchOutUI:*(unsigned int *)(a1 + 72)];
    [v10 _emitInstrumentation:v8 forTurn:*(void *)(a1 + 48) atTime:*(void *)(a1 + 64)];

    id WeakRetained = v10;
  }
}

- (void)emitVRXInstrumentationEvent:(id)a3 aceViewId:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = +[VRXFeedbackConverter convertFeedbackToVRX:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 requiresNewTurn])
    {
      id v9 = [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationTurnContext turnIdentifier];
      id v10 = (void *)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v9];
      objc_storeStrong((id *)&self->_currentInstrumentationTurnContext, v10);
      id v11 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        currentInstrumentationTurnContext = self->_currentInstrumentationTurnContext;
        id v13 = v11;
        id v14 = [(AFAnalyticsTurnBasedInstrumentationContext *)currentInstrumentationTurnContext turnIdentifier];
        int v17 = 136315650;
        id v18 = "-[SRUIFInstrumentationManager emitVRXInstrumentationEvent:aceViewId:]";
        __int16 v19 = 2112;
        id v20 = v14;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl(&dword_225FBA000, v13, OS_LOG_TYPE_INFO, "%s #noisy #instrumentation New Turn %@ <-> Old Turn %@", (uint8_t *)&v17, 0x20u);
      }
    }
    id v15 = [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationTurnContext turnIdentifier];
    if (v6) {
      [v8 emitWithTurnIdentifier:v15 aceViewId:v6];
    }
    else {
      [v8 emitWithTurnIdentifier:v15];
    }
  }
  else
  {
    uint64_t v16 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      id v18 = "-[SRUIFInstrumentationManager emitVRXInstrumentationEvent:aceViewId:]";
      _os_log_impl(&dword_225FBA000, v16, OS_LOG_TYPE_INFO, "%s #noisy #instrumentation Instrumentation event skipped, not a VRXTurnBasedInstrumentationEvent", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)emitRequestFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(SRUIFInstrumentationManager *)self currentInstrumentationTurnContext];
  id v6 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SRUIFInstrumentationManager_emitRequestFailedWithError___block_invoke;
  block[3] = &unk_264786A78;
  objc_copyWeak(v13, &location);
  id v11 = v4;
  id v12 = v5;
  v13[1] = v6;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __58__SRUIFInstrumentationManager_emitRequestFailedWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F6EEA8]);
    objc_msgSend(v2, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
    uint64_t v3 = [*(id *)(a1 + 32) domain];
    [v2 setErrorDomain:v3];

    id v4 = [WeakRetained _pnrErrorMessageWithError:*(void *)(a1 + 32)];
    [WeakRetained _emitInstrumentation:v2 forTurn:*(void *)(a1 + 40) atTime:*(void *)(a1 + 56)];
    [WeakRetained _emitInstrumentation:v4 forTurn:*(void *)(a1 + 40) atTime:*(void *)(a1 + 56)];
  }
}

- (BOOL)_hasDismissedForTurnContext:(id)a3
{
  id v4 = [a3 turnIdentifier];
  id v5 = [v4 UUIDString];

  lastDismissedIdentifier = self->_lastDismissedIdentifier;
  if (lastDismissedIdentifier) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7 && [(NSString *)lastDismissedIdentifier isEqualToString:v5];

  return v8;
}

- (id)_responseContextWithPresentationType:(int)a3 dialogPhase:(id)a4 mode:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F6EDC8]);
  [v8 setSiriResponseMode:v5];
  if (v7)
  {
    id v9 = [v7 aceDialogPhaseValue];
    [v8 setDialogPhase:v9];
  }
  [v8 setPresentationType:v6];

  return v8;
}

- (id)_pnrErrorMessageWithError:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F6ED90];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x263F6ED98]);
  id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", objc_msgSend(v5, "code"));
  [v7 setErrorCode:v8];

  id v9 = [v5 domain];
  [v7 setErrorDomain:v9];

  [v6 setError:v7];
  id v10 = [v5 userInfo];

  id v11 = [v10 objectForKey:*MEMORY[0x263F08608]];

  if (v11)
  {
    id v12 = [(SRUIFInstrumentationManager *)self _pnrErrorMessageWithError:v11];
    id v13 = [v12 error];

    if (v13)
    {
      id v14 = [v12 error];
      [v6 setUnderlyingError:v14];
    }
    id v15 = [v12 underlyingError];

    if (v15)
    {
      uint64_t v16 = [v12 underlyingError];
      [v6 setUnderUnderlyingError:v16];
    }
  }

  return v6;
}

- (void)_resetBargeInDetectedEvent
{
  self->_potentialBargeInDetected = 0;
  self->_potentialBargeInDetectedTime = 0.0;
  self->_potentialBargedInTurn = 0;
  MEMORY[0x270F9A758]();
}

- (id)associatedDialogIdentifiersForAceObjectIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_aceViewDialogIdentifiers objectForKeyedSubscript:a3];
}

- (void)_prepareForTesting
{
  userDefaults = self->_userDefaults;
  self->_userDefaults = 0;

  self->_shouldInstrument = 0;
}

- (void)_barrierWithCompletion:(id)a3
{
  id v4 = a3;
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SRUIFInstrumentationManager__barrierWithCompletion___block_invoke;
  block[3] = &unk_264785BB8;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(instrumentationManagerQueue, block);
}

uint64_t __54__SRUIFInstrumentationManager__barrierWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)boostQueuedMessagesAndPerformOnQueueCompletion:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__91;
  v23[4] = __Block_byref_object_dispose__92;
  id v24 = (id)MEMORY[0x22A643DA0]();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke;
  v22[3] = &unk_264786C58;
  void v22[4] = v23;
  id v7 = (void *)MEMORY[0x22A643DA0](v22);
  id v8 = [MEMORY[0x263F08C38] UUID];
  id v9 = [v8 UUIDString];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_3;
  block[3] = &unk_264785E90;
  id v10 = v9;
  id v20 = v10;
  id v11 = v7;
  id v21 = v11;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async((dispatch_queue_t)self->_instrumentationManagerQueue, v12);
  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  id v16[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_94;
  v16[3] = &unk_264785E90;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  dispatch_after(v13, MEMORY[0x263EF83A0], v16);

  _Block_object_dispose(v23, 8);
}

void __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_2;
  v1[3] = &unk_264786C58;
  v1[4] = *(void *)(a1 + 32);
  SRUIFInvokeOnMainQueue(v1);
}

void __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void (***)(void))(v2 + 40);
  if (v3)
  {
    v3[2]();
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v3 = *(void (***)(void))(v2 + 40);
  }
  *(void *)(v2 + 40) = 0;
}

void __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F283F8] sharedAnalytics];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_4;
  v3[3] = &unk_264785E90;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 boostQueuedEvents:v3];
}

uint64_t __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SRUIFInstrumentationManager boostQueuedMessagesAndPerformOnQueueCompletion:timeout:]_block_invoke_4";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_225FBA000, v2, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Flushed queued events - %@", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_94(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SRUIFInstrumentationManager boostQueuedMessagesAndPerformOnQueueCompletion:timeout:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_225FBA000, v2, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Instrumentation message flush timeout - %@", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (AFAnalyticsTurnBasedInstrumentationContext)currentInstrumentationTurnContext
{
  return (AFAnalyticsTurnBasedInstrumentationContext *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentInstrumentationTurnContext:(id)a3
{
}

- (AFAnalyticsTurnBasedInstrumentationContext)previousInstrumentationTurnContext
{
  return (AFAnalyticsTurnBasedInstrumentationContext *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPreviousInstrumentationTurnContext:(id)a3
{
}

- (int)currentSiriUIState
{
  return self->_currentSiriUIState;
}

- (void)setCurrentSiriUIState:(int)a3
{
  self->_currentSiriUIState = a3;
}

- (NSString)clientGeneratedDialogIdentifier
{
  return self->_clientGeneratedDialogIdentifier;
}

- (void)setClientGeneratedDialogIdentifier:(id)a3
{
}

- (BOOL)hasNotYetEmittedLaunchContextEnd
{
  return self->_hasNotYetEmittedLaunchContextEnd;
}

- (void)setHasNotYetEmittedLaunchContextEnd:(BOOL)a3
{
  self->_hasNotYetEmittedLaunchContextEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientGeneratedDialogIdentifier, 0);
  objc_storeStrong((id *)&self->_previousInstrumentationTurnContext, 0);
  objc_storeStrong((id *)&self->_currentInstrumentationTurnContext, 0);
  objc_storeStrong((id *)&self->_potentialBargedInTurn, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_cardInfo, 0);
  objc_storeStrong((id *)&self->_aceViewDialogIdentifiersForMessageConstruction, 0);
  objc_storeStrong((id *)&self->_aceViewDialogIdentifiers, 0);
  objc_storeStrong((id *)&self->_instrumentationManagerQueue, 0);
  objc_storeStrong((id *)&self->_lastDismissedIdentifier, 0);
}

- (void)_emitInstrumentation:(os_log_t)log forTurn:atTime:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SRUIFInstrumentationManager _emitInstrumentation:forTurn:atTime:]";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s #noisy #instrumentation Emit instrumentation event requested but turn context provided is nil", (uint8_t *)&v1, 0xCu);
}

- (void)storeCardID:(os_log_t)log forSnippetAceID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "-[SRUIFInstrumentationManager storeCardID:forSnippetAceID:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s SiriIUIInstrumentationManager: Attempted to store cardID or aceID that was nil: %@ %@", (uint8_t *)&v3, 0x20u);
}

@end