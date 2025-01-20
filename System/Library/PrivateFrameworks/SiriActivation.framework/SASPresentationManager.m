@interface SASPresentationManager
+ (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
+ (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4 presentationIdentifier:(int64_t)a5;
+ (BOOL)_canTransitionToActiveFromState:(int64_t)a3 presentationIdentifier:(int64_t)a4;
+ (BOOL)_canTransitionToHeatedFromState:(int64_t)a3;
+ (BOOL)_canTransitionToOffFromState:(int64_t)a3;
+ (BOOL)_canTransitionToStartingFromState:(int64_t)a3;
+ (BOOL)_canTransitionToStoppingFromState:(int64_t)a3;
+ (BOOL)_shouldKeepPingingForRequestState:(int64_t)a3;
- (BOOL)_shouldShowHintGlow;
- (BOOL)activePresentationsAreIdleAndQuiet;
- (BOOL)shouldRejectNewActivationsForRequestState:(int64_t)a3;
- (NSMutableDictionary)presentations;
- (SASPresentationManager)init;
- (id)_buildPresentationOptionsWithRequestOptions:(id)a3;
- (int64_t)_presentationsLock_nextPresentationToActivate;
- (int64_t)nextPresentationToActivate;
- (int64_t)requestState;
- (void)_forceAllPresentationsOff;
- (void)_informPresentationOfPresentationWithPriority:(id)a3 nextPresentationToActivate:(int64_t)a4;
- (void)_presentationsLock_broadcastPresentationStateForIdentifier:(id)a3 presentationState:(id)a4 presentationIdentifiersToInform:(id)a5;
- (void)_presentationsLock_cancelAllPreheatedPresentations;
- (void)_presentationsLock_nextPresentationToActivateDidChange:(int64_t)a3;
- (void)_requestStateDidChange;
- (void)_sendBlock:(id)a3 toPresentationWithPresentationIdentifier:(int64_t)a4;
- (void)_sendBlockToActivePresentations:(id)a3;
- (void)_sendBlockToStartingPresentations:(id)a3;
- (void)_sendBlockToStoppingPresentations:(id)a3;
- (void)_setupPingTimerForPresentationIdentifier:(int64_t)a3;
- (void)_teardownPingTimerForPresentationIdentifier:(int64_t)a3;
- (void)_transitionPresentationWithPresentationIdentifier:(int64_t)a3 toState:(int64_t)a4;
- (void)_waitForPongFromPresentationWithPresentationIdentifier:(int64_t)a3;
- (void)activeAndStartingPresentations_updateCurrentLockState:(unint64_t)a3;
- (void)activePresentations_bulletinManagerDidChangeBulletins;
- (void)activePresentations_deviceWonMyriadElection;
- (void)activePresentations_handleRequestWithOptions:(id)a3;
- (void)cancelAllPreheatedPresentations;
- (void)pongWithPresentationIdentifier:(int64_t)a3;
- (void)preheatNextPresentationToActivateWithOptions:(id)a3;
- (void)presentationDidUpdateState:(id)a3;
- (void)presentationRequestedWithPresentationIdentifier:(int64_t)a3 presentationOptions:(id)a4 requestOptions:(id)a5;
- (void)presentationWithPresentationIdentifier:(int64_t)a3 activationDeterminedShouldDeferWake:(BOOL)a4;
- (void)presentationWithPresentationIdentifierBecameActive:(int64_t)a3;
- (void)presentationWithPresentationIdentifierBecameOff:(int64_t)a3;
- (void)presentationWithPresentationIdentifierBeganStarting:(int64_t)a3;
- (void)presentationWithPresentationIdentifierBeganStopping:(int64_t)a3;
- (void)presentationWithPresentationIdentifierWakeScreenAfterActivation:(int64_t)a3 reason:(id)a4;
- (void)registerSiriPresentation:(id)a3 withIdentifier:(int64_t)a4;
- (void)requestHintGlowForNextPresentation;
- (void)sendButtonEventCompletionToPresentations:(id)a3 forButtonEventType:(unint64_t)a4;
- (void)setPresentationManagerDelegate:(id)a3;
- (void)setPresentations:(id)a3;
- (void)startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions:(id)a3;
- (void)startingPresentations_cancelPendingActivationWithReason:(unint64_t)a3;
- (void)unregisterSiriPresentationWithIdentifier:(int64_t)a3;
@end

@implementation SASPresentationManager

- (int64_t)requestState
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  v4 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E4F29060];
    v6 = v4;
    v7 = [v5 currentThread];
    *(_DWORD *)buf = 136315394;
    v36 = "-[SASPresentationManager requestState]";
    __int16 v37 = 2048;
    uint64_t v38 = [v7 qualityOfService];
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[SASPresentationManager requestState]";
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v9 = [(NSMutableDictionary *)self->_presentations allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v49 count:16];
  if (!v10)
  {

    uint64_t v15 = 0;
    uint64_t v14 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v32 != v17) {
        objc_enumerationMutation(v9);
      }
      switch([*(id *)(*((void *)&v31 + 1) + 8 * i) requestState])
      {
        case 0:
          ++v14;
          break;
        case 1:
          ++v15;
          break;
        case 2:
          ++v12;
          break;
        case 3:
          ++v16;
          break;
        case 4:
          ++v13;
          break;
        default:
          continue;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v49 count:16];
  }
  while (v11);

  if (v16)
  {
    uint64_t v19 = 3;
    goto LABEL_26;
  }
  if (v12)
  {
    uint64_t v16 = 0;
    uint64_t v19 = 2;
    goto LABEL_26;
  }
  if (!v13)
  {
LABEL_21:
    uint64_t v16 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    uint64_t v19 = 0;
    goto LABEL_26;
  }
  uint64_t v16 = 0;
  uint64_t v12 = 0;
  uint64_t v19 = 4;
LABEL_26:
  os_log_t v20 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)MEMORY[0x1E4F28ED0];
    v22 = v20;
    v23 = [v21 numberWithUnsignedInteger:v16];
    v24 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v12];
    v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v13];
    v26 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v15];
    v3 = (os_log_t *)MEMORY[0x1E4F4E360];
    v27 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v14];
    v28 = SASRequestStateGetName(v19);
    *(_DWORD *)buf = 136316674;
    v36 = "-[SASPresentationManager requestState]";
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v23;
    __int16 v39 = 2112;
    v40 = v24;
    __int16 v41 = 2112;
    v42 = v25;
    __int16 v43 = 2112;
    v44 = v26;
    __int16 v45 = 2112;
    v46 = v27;
    __int16 v47 = 2112;
    v48 = v28;
    _os_log_impl(&dword_1D9588000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation active: %@ | starting: %@ | stopping: %@ | heated: %@ | off: %@ | computed state: %@", buf, 0x48u);
  }
  os_unfair_lock_unlock(&presentationsLock);
  v29 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[SASPresentationManager requestState]";
    _os_log_impl(&dword_1D9588000, v29, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
  return v19;
}

- (BOOL)shouldRejectNewActivationsForRequestState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3;
}

- (int64_t)nextPresentationToActivate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  v4 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E4F29060];
    v6 = v4;
    v7 = [v5 currentThread];
    int v12 = 136315394;
    uint64_t v13 = "-[SASPresentationManager nextPresentationToActivate]";
    __int16 v14 = 2048;
    uint64_t v15 = [v7 qualityOfService];
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v12, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SASPresentationManager nextPresentationToActivate]";
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v12, 0xCu);
  }
  int64_t v9 = [(SASPresentationManager *)self _presentationsLock_nextPresentationToActivate];
  os_unfair_lock_unlock(&presentationsLock);
  uint64_t v10 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SASPresentationManager nextPresentationToActivate]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v12, 0xCu);
  }
  return v9;
}

- (int64_t)_presentationsLock_nextPresentationToActivate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(NSMutableDictionary *)self->_presentations allKeys];
  int64_t v3 = +[SASPresentationDecision activationPresentationForPresentationIdentifiers:v2];

  v4 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSString;
    v6 = v4;
    v7 = [v5 stringWithSiriPresentationIdentifier:v3];
    int v9 = 136315394;
    uint64_t v10 = "-[SASPresentationManager _presentationsLock_nextPresentationToActivate]";
    __int16 v11 = 2112;
    int v12 = v7;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation identifier: %@", (uint8_t *)&v9, 0x16u);
  }
  return v3;
}

- (SASPresentationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SASPresentationManager;
  v2 = [(SASPresentationManager *)&v6 init];
  if (v2)
  {
    int64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    presentations = v2->_presentations;
    v2->_presentations = v3;
  }
  return v2;
}

- (void)registerSiriPresentation:(id)a3 withIdentifier:(int64_t)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [NSString stringWithSiriPresentationIdentifier:a4];
  v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  int v9 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[SASPresentationManager registerSiriPresentation:withIdentifier:]";
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v7;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation presentationIdentifierKey: %@", buf, 0x16u);
  }
  os_log_t v10 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = v8;
    int v12 = (void *)MEMORY[0x1E4F29060];
    uint64_t v13 = v10;
    __int16 v14 = [v12 currentThread];
    uint64_t v15 = [v14 qualityOfService];
    *(_DWORD *)buf = 136315394;
    v42 = "-[SASPresentationManager registerSiriPresentation:withIdentifier:]";
    __int16 v43 = 2048;
    uint64_t v44 = v15;
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

    v8 = v11;
  }
  os_unfair_lock_lock(&presentationsLock);
  uint64_t v16 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[SASPresentationManager registerSiriPresentation:withIdentifier:]";
    _os_log_impl(&dword_1D9588000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  int64_t v17 = [(SASPresentationManager *)self _presentationsLock_nextPresentationToActivate];
  v18 = [(NSMutableDictionary *)self->_presentations allKeys];
  int v19 = [v18 containsObject:v7];

  if (v19)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      -[SASPresentationManager registerSiriPresentation:withIdentifier:]();
    }
    [(NSMutableDictionary *)self->_presentations removeObjectForKey:v7];
  }
  [(SASPresentationManager *)self _presentationsLock_cancelAllPreheatedPresentations];
  os_log_t v20 = [[SASPresentationModel alloc] initWithPresentationServer:v6];
  [(NSMutableDictionary *)self->_presentations setObject:v20 forKey:v7];
  int64_t v21 = [(SASPresentationManager *)self _presentationsLock_nextPresentationToActivate];
  if (v17 == v21) {
    -[SASPresentationManager _informPresentationOfPresentationWithPriority:nextPresentationToActivate:](self, "_informPresentationOfPresentationWithPriority:nextPresentationToActivate:", v20, v17, v20, v6);
  }
  else {
    -[SASPresentationManager _presentationsLock_nextPresentationToActivateDidChange:](self, "_presentationsLock_nextPresentationToActivateDidChange:", v21, v20, v6);
  }
  id v22 = v7;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v23 = [(NSMutableDictionary *)self->_presentations allKeys];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if (([v22 isEqualToString:v28] & 1) == 0)
        {
          v29 = [(NSMutableDictionary *)self->_presentations valueForKey:v28];
          v30 = [v29 presentationState];
          id v39 = v22;
          long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
          [(SASPresentationManager *)self _presentationsLock_broadcastPresentationStateForIdentifier:v28 presentationState:v30 presentationIdentifiersToInform:v31];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v25);
  }

  os_unfair_lock_unlock(&presentationsLock);
  long long v32 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[SASPresentationManager registerSiriPresentation:withIdentifier:]";
    _os_log_impl(&dword_1D9588000, v32, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
}

- (void)unregisterSiriPresentationWithIdentifier:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithSiriPresentationIdentifier:a3];
  v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v4;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation presentationIdentifierKey: %@", (uint8_t *)&v22, 0x16u);
  }
  os_log_t v7 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E4F29060];
    int v9 = v7;
    os_log_t v10 = [v8 currentThread];
    uint64_t v11 = [v10 qualityOfService];
    int v22 = 136315394;
    v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v22, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  int v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315138;
    v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v22, 0xCu);
  }
  int64_t v13 = [(SASPresentationManager *)self _presentationsLock_nextPresentationToActivate];
  __int16 v14 = [(NSMutableDictionary *)self->_presentations allKeys];
  char v15 = [v14 containsObject:v4];

  if (v15)
  {
    [(SASPresentationManager *)self _presentationsLock_cancelAllPreheatedPresentations];
    [(NSMutableDictionary *)self->_presentations removeObjectForKey:v4];
    uint64_t v16 = [(NSMutableDictionary *)self->_presentations allKeys];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      int64_t v18 = [(SASPresentationManager *)self _presentationsLock_nextPresentationToActivate];
      if (v13 != v18) {
        [(SASPresentationManager *)self _presentationsLock_nextPresentationToActivateDidChange:v18];
      }
    }
    int v19 = [(NSMutableDictionary *)self->_presentations allKeys];
    [(SASPresentationManager *)self _presentationsLock_broadcastPresentationStateForIdentifier:v4 presentationState:0 presentationIdentifiersToInform:v19];

    os_unfair_lock_unlock(&presentationsLock);
    os_log_t v20 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
      _os_log_impl(&dword_1D9588000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v22, 0xCu);
    }
    [(SASPresentationManager *)self _requestStateDidChange];
  }
  else
  {
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[SASPresentationManager unregisterSiriPresentationWithIdentifier:]();
    }
    os_unfair_lock_unlock(&presentationsLock);
    int64_t v21 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
      _os_log_impl(&dword_1D9588000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)requestHintGlowForNextPresentation
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation tried to request hint glow %@ but it's not a registered presentation", v2, v3, v4, v5, 2u);
}

- (BOOL)_shouldShowHintGlow
{
  return [MEMORY[0x1E4F4E638] isSAEEnabled];
}

- (void)preheatNextPresentationToActivateWithOptions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    v23 = "-[SASPresentationManager preheatNextPresentationToActivateWithOptions:]";
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v4;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #preheat preheatNextPresentationToActivateWithOptions: %@", (uint8_t *)&v22, 0x16u);
  }
  os_log_t v7 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E4F29060];
    int v9 = v7;
    os_log_t v10 = [v8 currentThread];
    uint64_t v11 = [v10 qualityOfService];
    int v22 = 136315394;
    v23 = "-[SASPresentationManager preheatNextPresentationToActivateWithOptions:]";
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v22, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  int v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315138;
    v23 = "-[SASPresentationManager preheatNextPresentationToActivateWithOptions:]";
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v22, 0xCu);
  }
  int64_t v13 = [(SASPresentationManager *)self _presentationsLock_nextPresentationToActivate];
  __int16 v14 = [NSString stringWithSiriPresentationIdentifier:v13];
  char v15 = [(NSMutableDictionary *)self->_presentations objectForKey:v14];
  uint64_t v16 = v15;
  if (v15)
  {
    if ([v15 requestState])
    {
      os_log_t v17 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
        [(SASPresentationManager *)(uint64_t)v14 preheatNextPresentationToActivateWithOptions:v16];
      }
      os_unfair_lock_unlock(&presentationsLock);
      int64_t v18 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315138;
        v23 = "-[SASPresentationManager preheatNextPresentationToActivateWithOptions:]";
LABEL_19:
        _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      int v19 = [v16 presentationServer];
      os_log_t v20 = [v19 connection];
      int64_t v21 = [v20 remoteTarget];
      [v21 preheatWithOptions:v4];

      [v16 setRequestState:1];
      os_unfair_lock_unlock(&presentationsLock);
      int64_t v18 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315138;
        v23 = "-[SASPresentationManager preheatNextPresentationToActivateWithOptions:]";
        goto LABEL_19;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[SASPresentationManager preheatNextPresentationToActivateWithOptions:]();
    }
    os_unfair_lock_unlock(&presentationsLock);
    int64_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "-[SASPresentationManager preheatNextPresentationToActivateWithOptions:]";
      goto LABEL_19;
    }
  }
}

- (void)cancelAllPreheatedPresentations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v4 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F29060];
    id v6 = v4;
    os_log_t v7 = [v5 currentThread];
    int v10 = 136315394;
    uint64_t v11 = "-[SASPresentationManager cancelAllPreheatedPresentations]";
    __int16 v12 = 2048;
    uint64_t v13 = [v7 qualityOfService];
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SASPresentationManager cancelAllPreheatedPresentations]";
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v10, 0xCu);
  }
  [(SASPresentationManager *)self _presentationsLock_cancelAllPreheatedPresentations];
  os_unfair_lock_unlock(&presentationsLock);
  int v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SASPresentationManager cancelAllPreheatedPresentations]";
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_presentationsLock_cancelAllPreheatedPresentations
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_presentations allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v5 = 136315650;
    long long v19 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        int v10 = -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v9, v19);
        uint64_t v11 = [v10 requestState];
        __int16 v12 = *MEMORY[0x1E4F4E360];
        BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT);
        if (v11 == 1)
        {
          if (v13)
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v25 = "-[SASPresentationManager _presentationsLock_cancelAllPreheatedPresentations]";
            __int16 v26 = 2112;
            uint64_t v27 = v9;
            _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation cancelling preheat for presentation: %@", buf, 0x16u);
          }
          uint64_t v14 = [v10 presentationServer];
          char v15 = [v14 connection];
          uint64_t v16 = [v15 remoteTarget];
          [v16 cancelPreheat];

          [v10 setRequestState:0];
        }
        else if (v13)
        {
          os_log_t v17 = v12;
          int64_t v18 = SASRequestStateGetName([v10 requestState]);
          *(_DWORD *)buf = v19;
          uint64_t v25 = "-[SASPresentationManager _presentationsLock_cancelAllPreheatedPresentations]";
          __int16 v26 = 2112;
          uint64_t v27 = v9;
          __int16 v28 = 2112;
          v29 = v18;
          _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy not cancelling preheat for presentation: %@ because it appears to be %@", buf, 0x20u);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v6);
  }
}

- (void)setPresentationManagerDelegate:(id)a3
{
  id obj = a3;
  p_presentationManagerDelegate = &self->_presentationManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_presentationManagerDelegate);

  uint64_t v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_presentationManagerDelegate, obj);
    uint64_t v6 = obj;
  }
}

- (void)_requestStateDidChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(SASPresentationManager *)self requestState];
  BOOL v4 = [(SASPresentationManager *)self shouldRejectNewActivationsForRequestState:v3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__SASPresentationManager__requestStateDidChange__block_invoke;
  v11[3] = &unk_1E6B67C20;
  BOOL v12 = !v4;
  v11[4] = self;
  v11[5] = v3;
  id v5 = +[SASPresentationAggregateState newWithBuilder:v11];
  lastReportedState = self->lastReportedState;
  if (!lastReportedState
    || (uint64_t v7 = [(SASPresentationAggregateState *)lastReportedState requestState],
        v7 != [v5 requestState]))
  {
    v8 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = self->lastReportedState;
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "-[SASPresentationManager _requestStateDidChange]";
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation: oldAggregateState %@ | newAggregateState: %@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    [WeakRetained presentationManager:self didChangeAggregateState:v5];

    objc_storeStrong((id *)&self->lastReportedState, v5);
  }
}

void __48__SASPresentationManager__requestStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setRequestState:*(void *)(a1 + 40)];
  [v5 setCanAcceptNewActivations:*(unsigned __int8 *)(a1 + 48)];
  int64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v3) {
    BOOL v4 = *(unsigned __int8 *)(a1 + 48) != [v3 canAcceptNewActivations];
  }
  else {
    BOOL v4 = 1;
  }
  [v5 setDidNewActivationAcceptanceChange:v4];
}

- (void)_sendBlock:(id)a3 toPresentationWithPresentationIdentifier:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *))a3;
  uint64_t v7 = [NSString stringWithSiriPresentationIdentifier:a4];
  v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    BOOL v12 = [v10 currentThread];
    int v20 = 136315394;
    long long v21 = "-[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:]";
    __int16 v22 = 2048;
    uint64_t v23 = [v12 qualityOfService];
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v20, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  BOOL v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    long long v21 = "-[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v14 = [(NSMutableDictionary *)self->_presentations objectForKey:v7];
  __int16 v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 presentationServer];
    v6[2](v6, v16);

    os_unfair_lock_unlock(&presentationsLock);
    __int16 v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      long long v21 = "-[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:]";
      _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:]();
    }
    os_unfair_lock_unlock(&presentationsLock);
    id v18 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      long long v21 = "-[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:]";
      _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v20, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    [WeakRetained presentationManager:self didEncounterError:2];
  }
}

- (void)_sendBlockToActivePresentations:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F29060];
    v8 = v6;
    uint64_t v9 = [v7 currentThread];
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "-[SASPresentationManager _sendBlockToActivePresentations:]";
    __int16 v26 = 2048;
    uint64_t v27 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  int v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[SASPresentationManager _sendBlockToActivePresentations:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [(NSMutableDictionary *)self->_presentations allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v16 requestState] == 3)
        {
          __int16 v17 = [v16 presentationServer];
          v4[2](v4, v17);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(&presentationsLock);
  id v18 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[SASPresentationManager _sendBlockToActivePresentations:]";
    _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
}

- (void)_sendBlockToStartingPresentations:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F29060];
    v8 = v6;
    uint64_t v9 = [v7 currentThread];
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "-[SASPresentationManager _sendBlockToStartingPresentations:]";
    __int16 v26 = 2048;
    uint64_t v27 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  int v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[SASPresentationManager _sendBlockToStartingPresentations:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [(NSMutableDictionary *)self->_presentations allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v16 requestState] == 2)
        {
          __int16 v17 = [v16 presentationServer];
          v4[2](v4, v17);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(&presentationsLock);
  id v18 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[SASPresentationManager _sendBlockToStartingPresentations:]";
    _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
}

- (void)_sendBlockToStoppingPresentations:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F29060];
    v8 = v6;
    uint64_t v9 = [v7 currentThread];
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "-[SASPresentationManager _sendBlockToStoppingPresentations:]";
    __int16 v26 = 2048;
    uint64_t v27 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  int v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[SASPresentationManager _sendBlockToStoppingPresentations:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [(NSMutableDictionary *)self->_presentations allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v16 requestState] == 4)
        {
          __int16 v17 = [v16 presentationServer];
          v4[2](v4, v17);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(&presentationsLock);
  id v18 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[SASPresentationManager _sendBlockToStoppingPresentations:]";
    _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
}

- (void)sendButtonEventCompletionToPresentations:(id)a3 forButtonEventType:(unint64_t)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a3;
  uint64_t v6 = *MEMORY[0x1E4F4E360];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT);
  unint64_t v46 = a4;
  if (a4)
  {
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F29060];
      uint64_t v9 = v6;
      int v10 = [v8 currentThread];
      *(_DWORD *)buf = 136315394;
      v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
      __int16 v54 = 2048;
      uint64_t v55 = [v10 qualityOfService];
      _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
    }
    os_unfair_lock_lock(&presentationsLock);
    uint64_t v11 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
      _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = [(NSMutableDictionary *)self->_presentations allKeys];
    uint64_t v12 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = *(void *)v49;
      *(void *)&long long v13 = 136315650;
      long long v44 = v13;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(obj);
          }
          __int16 v17 = *(void **)(*((void *)&v48 + 1) + 8 * v16);
          id v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_presentations, "objectForKeyedSubscript:", v17, v44);
          uint64_t v19 = [v18 requestState];
          long long v20 = (void *)*MEMORY[0x1E4F4E360];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
          {
            long long v21 = v20;
            long long v22 = SASButtonEventTypeGetName(v46);
            uint64_t v23 = SASRequestStateGetName(v19);
            *(_DWORD *)buf = 136315906;
            v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
            __int16 v54 = 2112;
            uint64_t v55 = (uint64_t)v17;
            __int16 v56 = 2112;
            v57 = v22;
            __int16 v58 = 2112;
            v59 = v23;
            _os_log_impl(&dword_1D9588000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation presentation: %@, type: %@, state: %@", buf, 0x2Au);
          }
          if ([v18 requestState] == 3)
          {
            uint64_t v24 = [v18 presentationServer];
            v5[2](v5, v24);
LABEL_26:

            goto LABEL_27;
          }
          if ([v18 requestState] == 2)
          {
            uint64_t v25 = (void *)*MEMORY[0x1E4F4E360];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
            {
              __int16 v26 = v25;
              uint64_t v27 = SASRequestStateGetName(3);
              *(_DWORD *)buf = 136315394;
              v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
              __int16 v54 = 2112;
              uint64_t v55 = (uint64_t)v27;
              _os_log_impl(&dword_1D9588000, v26, OS_LOG_TYPE_DEFAULT, "%s #activation enqueuing button event completion until State is %@.", buf, 0x16u);
              goto LABEL_23;
            }
            goto LABEL_24;
          }
          uint64_t v28 = [v18 requestState];
          if (v46 == 2 && !v28)
          {
            v29 = [NSString stringWithSiriPresentationIdentifier:2];
            int v30 = [v17 isEqualToString:v29];

            if (v30)
            {
              uint64_t v31 = (void *)*MEMORY[0x1E4F4E360];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
              {
                __int16 v26 = v31;
                uint64_t v27 = SASButtonEventTypeGetName(2);
                long long v32 = SASRequestStateGetName(v19);
                *(_DWORD *)buf = v44;
                v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
                __int16 v54 = 2112;
                uint64_t v55 = (uint64_t)v27;
                __int16 v56 = 2112;
                v57 = v32;
                _os_log_impl(&dword_1D9588000, v26, OS_LOG_TYPE_DEFAULT, "%s #activation received %@ while request state is %@, enqueueing.", buf, 0x20u);

LABEL_23:
              }
LABEL_24:
              uint64_t v24 = [v18 enqueuedButtonEventCompletions];
              long long v33 = _Block_copy(v5);
              [v24 addObject:v33];
LABEL_25:

              goto LABEL_26;
            }
          }
          BOOL v34 = [(SASPresentationManager *)self _shouldShowHintGlow];
          if (v46 == 2 && v34)
          {
            long long v35 = [NSString stringWithSiriPresentationIdentifier:1];
            int v36 = [v17 isEqualToString:v35];

            if (v36)
            {
              long long v37 = *MEMORY[0x1E4F4E360];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
                _os_log_impl(&dword_1D9588000, v37, OS_LOG_TYPE_DEFAULT, "%s #activation cancel hint glow activation for button up event", buf, 0xCu);
              }
              uint64_t v24 = [v18 presentationServer];
              long long v33 = [v24 connection];
              long long v38 = [v33 remoteTarget];
              [v38 cancelActivatedHintGlow];

              goto LABEL_25;
            }
          }
          id v39 = *MEMORY[0x1E4F4E360];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
            _os_log_impl(&dword_1D9588000, v39, OS_LOG_TYPE_DEFAULT, "%s #activation unhandled button event, ignoring.", buf, 0xCu);
          }
LABEL_27:

          ++v16;
        }
        while (v14 != v16);
        uint64_t v40 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
        uint64_t v14 = v40;
      }
      while (v40);
    }

    os_unfair_lock_unlock(&presentationsLock);
    __int16 v41 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
      v42 = "%s #activation #locks #noisy presentationsLock unlocked";
      __int16 v43 = v41;
LABEL_42:
      _os_log_impl(&dword_1D9588000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
    }
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
    v42 = "%s Received unknown button event type. Ignoring.";
    __int16 v43 = v6;
    goto LABEL_42;
  }
}

- (void)activePresentations_handleRequestWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __71__SASPresentationManager_activePresentations_handleRequestWithOptions___block_invoke;
  int v10 = &unk_1E6B67C48;
  id v11 = v4;
  uint64_t v12 = self;
  id v5 = v4;
  uint64_t v6 = _Block_copy(&v7);
  -[SASPresentationManager _sendBlockToActivePresentations:](self, "_sendBlockToActivePresentations:", v6, v7, v8, v9, v10);
}

void __71__SASPresentationManager_activePresentations_handleRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) requestSource] == 53)
  {
    int64_t v3 = [*(id *)(a1 + 40) _buildPresentationOptionsWithRequestOptions:*(void *)(a1 + 32)];
    id v4 = [v6 connection];
    id v5 = [v4 remoteTarget];
    [v5 handleRequestWithPresentationOptionsUpdate:v3 requestOptions:*(void *)(a1 + 32)];
  }
  else
  {
    int64_t v3 = [v6 connection];
    id v4 = [v3 remoteTarget];
    [v4 handleRequestWithOptions:*(void *)(a1 + 32)];
  }
}

- (id)_buildPresentationOptionsWithRequestOptions:(id)a3
{
  id v3 = a3;
  id v4 = [[SiriPresentationOptions alloc] initWithBuilder:0];
  id v5 = [v3 uiPresentationIdentifier];
  if ([v5 isEqualToString:@"com.apple.siri.Compact"])
  {
    unint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"com.apple.siri.SystemAssistantExperience"])
  {
    unint64_t v6 = 2;
  }
  else
  {
    unint64_t v6 = 1;
  }
  uint64_t v7 = (NSObject **)MEMORY[0x1E4F4E360];
  uint64_t v8 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG)) {
    [(SASPresentationManager *)v8 _buildPresentationOptionsWithRequestOptions:(uint64_t)v5];
  }
  uint64_t v9 = [v3 requestSource];
  int v10 = *v7;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SASPresentationManager _buildPresentationOptionsWithRequestOptions:](v9 == 53, v10);
  }
  char v11 = [MEMORY[0x1E4F4E638] isSAEEnabled];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__SASPresentationManager__buildPresentationOptionsWithRequestOptions___block_invoke;
  v16[3] = &unk_1E6B67C70;
  BOOL v19 = v9 == 53;
  char v12 = v11 ^ 1;
  if (v9 == 53) {
    char v12 = 1;
  }
  char v20 = v12;
  char v21 = 1;
  id v17 = v3;
  unint64_t v18 = v6;
  id v13 = v3;
  uint64_t v14 = [(SiriPresentationOptions *)v4 mutatedCopyWithMutator:v16];

  return v14;
}

void __70__SASPresentationManager__buildPresentationOptionsWithRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = a2;
  [v4 setHideOtherWindowsDuringAppearance:v3];
  [v4 setShouldDeactivateScenesBelow:*(unsigned __int8 *)(a1 + 49)];
  [v4 setWakeScreen:*(unsigned __int8 *)(a1 + 50)];
  [v4 setRotationStyle:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setRequestSource:", objc_msgSend(*(id *)(a1 + 32), "requestSource"));
  objc_msgSend(v4, "setInputType:", objc_msgSend(*(id *)(a1 + 32), "inputType"));
  id v5 = [*(id *)(a1 + 32) launchActions];
  [v4 setLaunchActions:v5];
}

- (void)startingPresentations_cancelPendingActivationWithReason:(unint64_t)a3
{
  id v4 = [[SiriPresentationActivationCancelReasonTransport alloc] initWithSiriPresentationActivationCancelReason:a3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__SASPresentationManager_startingPresentations_cancelPendingActivationWithReason___block_invoke;
  aBlock[3] = &unk_1E6B67C98;
  uint64_t v8 = v4;
  id v5 = v4;
  unint64_t v6 = _Block_copy(aBlock);
  [(SASPresentationManager *)self _sendBlockToStartingPresentations:v6];
}

void __82__SASPresentationManager_startingPresentations_cancelPendingActivationWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 connection];
  uint64_t v3 = [v4 remoteTarget];
  [v3 cancelPendingActivationEventWithReason:*(void *)(a1 + 32)];
}

- (void)activePresentations_deviceWonMyriadElection
{
}

void __69__SASPresentationManager_activePresentations_deviceWonMyriadElection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 connection];
  uint64_t v2 = [v3 remoteTarget];
  [v2 deviceWonMyriadElection];
}

- (void)activeAndStartingPresentations_updateCurrentLockState:(unint64_t)a3
{
  id v4 = [[SASLockStateTransport alloc] initWithSASLockState:a3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__SASPresentationManager_activeAndStartingPresentations_updateCurrentLockState___block_invoke;
  aBlock[3] = &unk_1E6B67C98;
  uint64_t v8 = v4;
  id v5 = v4;
  unint64_t v6 = _Block_copy(aBlock);
  [(SASPresentationManager *)self _sendBlockToActivePresentations:v6];
  [(SASPresentationManager *)self _sendBlockToStartingPresentations:v6];
}

void __80__SASPresentationManager_activeAndStartingPresentations_updateCurrentLockState___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 connection];
  id v3 = [v4 remoteTarget];
  [v3 updateCurrentLockState:*(void *)(a1 + 32)];
}

- (void)startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__SASPresentationManager_startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions___block_invoke;
  aBlock[3] = &unk_1E6B67C98;
  id v8 = v4;
  id v5 = v4;
  unint64_t v6 = _Block_copy(aBlock);
  [(SASPresentationManager *)self _sendBlockToStartingPresentations:v6];
  [(SASPresentationManager *)self _sendBlockToActivePresentations:v6];
  [(SASPresentationManager *)self _sendBlockToStoppingPresentations:v6];
}

void __110__SASPresentationManager_startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 connection];
  id v3 = [v4 remoteTarget];
  [v3 presentationDismissalRequestedWithOptions:*(void *)(a1 + 32)];
}

- (void)activePresentations_bulletinManagerDidChangeBulletins
{
}

void __79__SASPresentationManager_activePresentations_bulletinManagerDidChangeBulletins__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 connection];
  uint64_t v2 = [v3 remoteTarget];
  [v2 bulletinManagerDidChangeBulletins];
}

- (BOOL)activePresentationsAreIdleAndQuiet
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v4 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)MEMORY[0x1E4F29060];
    unint64_t v6 = v4;
    uint64_t v7 = [v5 currentThread];
    *(_DWORD *)buf = 136315394;
    v29 = "-[SASPresentationManager activePresentationsAreIdleAndQuiet]";
    __int16 v30 = 2048;
    uint64_t v31 = [v7 qualityOfService];
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  id v8 = *v3;
  uint64_t v9 = &off_1D95D8000;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[SASPresentationManager activePresentationsAreIdleAndQuiet]";
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v10 = [(NSMutableDictionary *)self->_presentations allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v15 requestState] == 3)
        {
          uint64_t v16 = [v15 presentationServer];
          id v17 = [v16 connection];
          unint64_t v18 = [v17 remoteTarget];
          int v19 = [v18 presentationisIdleAndQuiet];

          if (!v19)
          {
            BOOL v20 = 0;
            goto LABEL_16;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v20 = 1;
LABEL_16:
    uint64_t v9 = &off_1D95D8000;
  }
  else
  {
    BOOL v20 = 1;
  }

  os_unfair_lock_unlock(&presentationsLock);
  char v21 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v9 + 39);
    v29 = "-[SASPresentationManager activePresentationsAreIdleAndQuiet]";
    _os_log_impl(&dword_1D9588000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
  return v20;
}

+ (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  return [a1 _canTransitionFromState:a3 toState:a4 presentationIdentifier:0];
}

+ (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4 presentationIdentifier:(int64_t)a5
{
  switch(a4)
  {
    case 0:
      BOOL result = [a1 _canTransitionToOffFromState:a3];
      break;
    case 1:
      BOOL result = [a1 _canTransitionToHeatedFromState:a3];
      break;
    case 2:
      BOOL result = [a1 _canTransitionToStartingFromState:a3];
      break;
    case 3:
      BOOL result = [a1 _canTransitionToActiveFromState:a3 presentationIdentifier:a5];
      break;
    case 4:
      BOOL result = [a1 _canTransitionToStoppingFromState:a3];
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

+ (BOOL)_canTransitionToOffFromState:(int64_t)a3
{
  return a3 != 3 && a3 != 0;
}

+ (BOOL)_canTransitionToHeatedFromState:(int64_t)a3
{
  return (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFCLL;
}

+ (BOOL)_canTransitionToStartingFromState:(int64_t)a3
{
  return (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFDLL;
}

+ (BOOL)_canTransitionToStoppingFromState:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (BOOL)_canTransitionToActiveFromState:(int64_t)a3 presentationIdentifier:(int64_t)a4
{
  if ((unint64_t)a3 < 2) {
    return 0;
  }
  if (a3 == 4) {
    return a4 == 4;
  }
  return a3 != 3;
}

- (void)presentationWithPresentationIdentifierBeganStarting:(int64_t)a3
{
}

- (void)presentationWithPresentationIdentifierBeganStopping:(int64_t)a3
{
}

- (void)presentationWithPresentationIdentifierBecameActive:(int64_t)a3
{
}

- (void)presentationWithPresentationIdentifierBecameOff:(int64_t)a3
{
}

- (void)_transitionPresentationWithPresentationIdentifier:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend(NSString, "stringWithSiriPresentationIdentifier:");
  id v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    uint64_t v12 = [v10 currentThread];
    int v33 = 136315394;
    BOOL v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
    __int16 v35 = 2048;
    uint64_t v36 = [v12 qualityOfService];
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v33, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  uint64_t v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136315138;
    BOOL v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v33, 0xCu);
  }
  uint64_t v14 = [(NSMutableDictionary *)self->_presentations objectForKey:v7];
  uint64_t v15 = v14;
  if (!v14)
  {
    long long v23 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315394;
      BOOL v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v7;
      _os_log_impl(&dword_1D9588000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ isn't registered", (uint8_t *)&v33, 0x16u);
    }
    os_unfair_lock_unlock(&presentationsLock);
    long long v24 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315138;
      BOOL v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
      _os_log_impl(&dword_1D9588000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v33, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    long long v26 = WeakRetained;
    uint64_t v27 = self;
    uint64_t v28 = 1;
    goto LABEL_26;
  }
  BOOL v16 = +[SASPresentationManager _canTransitionFromState:toState:presentationIdentifier:](SASPresentationManager, "_canTransitionFromState:toState:presentationIdentifier:", [v14 requestState], a4, a3);
  os_log_t v17 = *v8;
  BOOL v18 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
  if (!v16)
  {
    if (v18)
    {
      v29 = v17;
      __int16 v30 = SASRequestStateGetName(a4);
      uint64_t v31 = SASRequestStateGetName([v15 requestState]);
      int v33 = 136315906;
      BOOL v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v7;
      __int16 v37 = 2112;
      long long v38 = v30;
      __int16 v39 = 2112;
      uint64_t v40 = v31;
      _os_log_impl(&dword_1D9588000, v29, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ can't transition to state: %@ from state: %@", (uint8_t *)&v33, 0x2Au);
    }
    os_unfair_lock_unlock(&presentationsLock);
    uint64_t v32 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315138;
      BOOL v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
      _os_log_impl(&dword_1D9588000, v32, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v33, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    long long v26 = WeakRetained;
    uint64_t v27 = self;
    uint64_t v28 = 0;
LABEL_26:
    [WeakRetained presentationManager:v27 didEncounterError:v28];

    goto LABEL_27;
  }
  if (v18)
  {
    int v19 = v17;
    BOOL v20 = SASRequestStateGetName([v15 requestState]);
    char v21 = SASRequestStateGetName(a4);
    int v33 = 136315906;
    BOOL v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
    __int16 v35 = 2112;
    uint64_t v36 = (uint64_t)v7;
    __int16 v37 = 2112;
    long long v38 = v20;
    __int16 v39 = 2112;
    uint64_t v40 = v21;
    _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation %@: transitioning from %@ to %@", (uint8_t *)&v33, 0x2Au);
  }
  [v15 setRequestState:a4];
  if (a4 == 3) {
    [v15 flushEnqueuedButtonEventCompletions];
  }
  os_unfair_lock_unlock(&presentationsLock);
  long long v22 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136315138;
    BOOL v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
    _os_log_impl(&dword_1D9588000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v33, 0xCu);
  }
  [(SASPresentationManager *)self _requestStateDidChange];
  if (a4)
  {
    if (a4 == 2) {
      [(SASPresentationManager *)self _setupPingTimerForPresentationIdentifier:a3];
    }
  }
  else
  {
    [(SASPresentationManager *)self _teardownPingTimerForPresentationIdentifier:a3];
  }
LABEL_27:
}

- (void)_presentationsLock_nextPresentationToActivateDidChange:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMutableDictionary *)self->_presentations allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 siriPresentationIdentifier] != 3)
        {
          uint64_t v11 = [(NSMutableDictionary *)self->_presentations objectForKey:v10];
          [(SASPresentationManager *)self _informPresentationOfPresentationWithPriority:v11 nextPresentationToActivate:a3];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_informPresentationOfPresentationWithPriority:(id)a3 nextPresentationToActivate:(int64_t)a4
{
  id v5 = a3;
  uint64_t v9 = [[SiriPresentationIdentifierTransport alloc] initWithSiriPresentationIdentifier:a4];
  uint64_t v6 = [v5 presentationServer];

  uint64_t v7 = [v6 connection];
  uint64_t v8 = [v7 remoteTarget];
  [v8 presentationActivationPriorityDidChange:v9];
}

- (void)presentationRequestedWithPresentationIdentifier:(int64_t)a3 presentationOptions:(id)a4 requestOptions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __109__SASPresentationManager_presentationRequestedWithPresentationIdentifier_presentationOptions_requestOptions___block_invoke;
  BOOL v16 = &unk_1E6B67C48;
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  long long v12 = _Block_copy(&v13);
  -[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:](self, "_sendBlock:toPresentationWithPresentationIdentifier:", v12, a3, v13, v14, v15, v16);
}

void __109__SASPresentationManager_presentationRequestedWithPresentationIdentifier_presentationOptions_requestOptions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 connection];
  id v3 = [v4 remoteTarget];
  [v3 presentationRequestedWithPresentationOptions:*(void *)(a1 + 32) requestOptions:*(void *)(a1 + 40)];
}

- (void)presentationWithPresentationIdentifier:(int64_t)a3 activationDeterminedShouldDeferWake:(BOOL)a4
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__SASPresentationManager_presentationWithPresentationIdentifier_activationDeterminedShouldDeferWake___block_invoke;
  aBlock[3] = &__block_descriptor_33_e31_v16__0__SASPresentationServer_8l;
  BOOL v8 = a4;
  uint64_t v6 = _Block_copy(aBlock);
  [(SASPresentationManager *)self _sendBlock:v6 toPresentationWithPresentationIdentifier:a3];
}

void __101__SASPresentationManager_presentationWithPresentationIdentifier_activationDeterminedShouldDeferWake___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 connection];
  id v3 = [v5 remoteTarget];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  [v3 activationDeterminedShouldDeferWake:v4];
}

- (void)presentationWithPresentationIdentifierWakeScreenAfterActivation:(int64_t)a3 reason:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__SASPresentationManager_presentationWithPresentationIdentifierWakeScreenAfterActivation_reason___block_invoke;
  aBlock[3] = &unk_1E6B67C98;
  id v10 = v6;
  id v7 = v6;
  BOOL v8 = _Block_copy(aBlock);
  [(SASPresentationManager *)self _sendBlock:v8 toPresentationWithPresentationIdentifier:a3];
}

void __97__SASPresentationManager_presentationWithPresentationIdentifierWakeScreenAfterActivation_reason___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 connection];
  id v3 = [v4 remoteTarget];
  [v3 wakeScreenAfterActivationWithReason:*(void *)(a1 + 32)];
}

- (void)_setupPingTimerForPresentationIdentifier:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(NSString, "stringWithSiriPresentationIdentifier:");
  id v6 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v7 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = (void *)MEMORY[0x1E4F29060];
    id v9 = v7;
    id v10 = [v8 currentThread];
    *(_DWORD *)buf = 136315394;
    __int16 v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
    __int16 v31 = 2048;
    uint64_t v32 = [v10 qualityOfService];
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  id v11 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  long long v12 = [(NSMutableDictionary *)self->_presentations objectForKey:v5];
  uint64_t v13 = v12;
  if (v12)
  {
    if (+[SASPresentationManager _shouldKeepPingingForRequestState:](SASPresentationManager, "_shouldKeepPingingForRequestState:", [v12 requestState]))
    {
      objc_initWeak((id *)buf, self);
      uint64_t v14 = (void *)MEMORY[0x1E4F1CB00];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__SASPresentationManager__setupPingTimerForPresentationIdentifier___block_invoke;
      v26[3] = &unk_1E6B67D00;
      id v15 = v13;
      id v27 = v15;
      objc_copyWeak(v28, (id *)buf);
      v28[1] = (id)a3;
      BOOL v16 = [v14 timerWithTimeInterval:0 repeats:v26 block:1.0];
      id v17 = [v15 pingTimer];
      [v17 invalidate];

      [v15 setPingTimer:v16];
      id v18 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v18 addTimer:v16 forMode:*MEMORY[0x1E4F1C4B0]];

      objc_destroyWeak(v28);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      os_log_t v22 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = v22;
        long long v24 = SASRequestStateGetName([v13 requestState]);
        *(_DWORD *)buf = 136315650;
        __int16 v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v5;
        __int16 v33 = 2112;
        BOOL v34 = v24;
        _os_log_impl(&dword_1D9588000, v23, OS_LOG_TYPE_DEFAULT, "%s #pingpong not returning ping because presentation with identifier %@ is in request state %@", buf, 0x20u);
      }
    }
    os_unfair_lock_unlock(&presentationsLock);
    long long v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
      _os_log_impl(&dword_1D9588000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
    }
  }
  else
  {
    int v19 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v5;
      _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ isn't registered", buf, 0x16u);
    }
    os_unfair_lock_unlock(&presentationsLock);
    BOOL v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
      _os_log_impl(&dword_1D9588000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    [WeakRetained presentationManager:self didEncounterError:3];
  }
}

void __67__SASPresentationManager__setupPingTimerForPresentationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 presentationServer];
    id v6 = [*(id *)(a1 + 32) presentationServer];
    id v7 = [v6 connection];
    BOOL v8 = [*(id *)(a1 + 32) presentationServer];
    id v9 = [v8 connection];
    id v10 = [v9 remoteTarget];
    int v15 = 136316162;
    BOOL v16 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    BOOL v20 = v5;
    __int16 v21 = 2112;
    os_log_t v22 = v7;
    __int16 v23 = 2112;
    long long v24 = v10;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #pingpong sending ping and waiting for pong - model: %@ | server: %@ | connection: %@ | remoteTarget: %@", (uint8_t *)&v15, 0x34u);
  }
  id v11 = [*(id *)(a1 + 32) presentationServer];
  long long v12 = [v11 connection];
  uint64_t v13 = [v12 remoteTarget];
  [v13 ping];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _waitForPongFromPresentationWithPresentationIdentifier:*(void *)(a1 + 48)];
}

- (void)_waitForPongFromPresentationWithPresentationIdentifier:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithSiriPresentationIdentifier:a3];
  id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)MEMORY[0x1E4F29060];
    BOOL v8 = v6;
    id v9 = [v7 currentThread];
    *(_DWORD *)buf = 136315394;
    long long v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
    __int16 v27 = 2048;
    uint64_t v28 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  id v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  id v11 = [(NSMutableDictionary *)self->_presentations objectForKey:v4];
  if (v11)
  {
    objc_initWeak(&location, self);
    long long v12 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    __int16 v21 = __81__SASPresentationManager__waitForPongFromPresentationWithPresentationIdentifier___block_invoke;
    os_log_t v22 = &unk_1E6B67D28;
    objc_copyWeak(&v23, &location);
    uint64_t v13 = [v12 scheduledTimerWithTimeInterval:0 repeats:&v19 block:2.0];
    uint64_t v14 = objc_msgSend(v11, "pingTimer", v19, v20, v21, v22);
    [v14 invalidate];

    [v11 setPingTimer:v13];
    os_unfair_lock_unlock(&presentationsLock);
    int v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
      _os_log_impl(&dword_1D9588000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v4;
      _os_log_impl(&dword_1D9588000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ isn't registered", buf, 0x16u);
    }
    os_unfair_lock_unlock(&presentationsLock);
    __int16 v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
      _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    [WeakRetained presentationManager:self didEncounterError:3];
  }
}

void __81__SASPresentationManager__waitForPongFromPresentationWithPresentationIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      __81__SASPresentationManager__waitForPongFromPresentationWithPresentationIdentifier___block_invoke_cold_1(v2);
    }
    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    [v3 presentationManager:WeakRetained didEncounterError:5];

    [WeakRetained _forceAllPresentationsOff];
  }
}

- (void)_teardownPingTimerForPresentationIdentifier:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    os_log_t v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #pingpong", (uint8_t *)&v21, 0xCu);
  }
  id v7 = [NSString stringWithSiriPresentationIdentifier:a3];
  os_log_t v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x1E4F29060];
    id v10 = v8;
    id v11 = [v9 currentThread];
    uint64_t v12 = [v11 qualityOfService];
    int v21 = 136315394;
    os_log_t v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v21, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  uint64_t v13 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    os_log_t v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v14 = [(NSMutableDictionary *)self->_presentations objectForKey:v7];
  int v15 = v14;
  if (v14)
  {
    BOOL v16 = [v14 pingTimer];
    [v16 invalidate];

    [v15 setPingTimer:0];
    os_unfair_lock_unlock(&presentationsLock);
    __int16 v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      os_log_t v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
      _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    id v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315394;
      os_log_t v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v7;
      _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ isn't registered", (uint8_t *)&v21, 0x16u);
    }
    os_unfair_lock_unlock(&presentationsLock);
    uint64_t v19 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      os_log_t v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
      _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v21, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    [WeakRetained presentationManager:self didEncounterError:4];
  }
}

- (void)pongWithPresentationIdentifier:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSString;
    id v7 = v5;
    os_log_t v8 = [v6 stringWithSiriPresentationIdentifier:a3];
    int v9 = 136315394;
    id v10 = "-[SASPresentationManager pongWithPresentationIdentifier:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #pingpong received pong with presentation identifier: %@", (uint8_t *)&v9, 0x16u);
  }
  [(SASPresentationManager *)self _setupPingTimerForPresentationIdentifier:a3];
}

- (void)_forceAllPresentationsOff
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v27 = "-[SASPresentationManager _forceAllPresentationsOff]";
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #pingpong", buf, 0xCu);
  }
  os_log_t v5 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x1E4F29060];
    id v7 = v5;
    os_log_t v8 = [v6 currentThread];
    uint64_t v9 = [v8 qualityOfService];
    *(_DWORD *)buf = 136315394;
    __int16 v27 = "-[SASPresentationManager _forceAllPresentationsOff]";
    __int16 v28 = 2048;
    uint64_t v29 = v9;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  id v10 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v27 = "-[SASPresentationManager _forceAllPresentationsOff]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  __int16 v11 = [(NSMutableDictionary *)self->_presentations allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        BOOL v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v16 requestState] == 1)
        {
          __int16 v17 = [v16 presentationServer];
          id v18 = [v17 connection];
          uint64_t v19 = [v18 remoteTarget];
          [v19 cancelPreheat];
        }
        [v16 setRequestState:0];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(&presentationsLock);
  uint64_t v20 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v27 = "-[SASPresentationManager _forceAllPresentationsOff]";
    _os_log_impl(&dword_1D9588000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
  [(SASPresentationManager *)self _requestStateDidChange];
}

+ (BOOL)_shouldKeepPingingForRequestState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3;
}

- (void)presentationDidUpdateState:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_log_t v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)MEMORY[0x1E4F29060];
    os_log_t v8 = v6;
    uint64_t v9 = [v7 currentThread];
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[SASPresentationManager presentationDidUpdateState:]";
    __int16 v34 = 2048;
    uint64_t v35 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&presentationsLock);
  id v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v33 = "-[SASPresentationManager presentationDidUpdateState:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  presentations = self->_presentations;
  uint64_t v12 = [v4 presentationIdentifier];
  uint64_t v13 = [(NSMutableDictionary *)presentations objectForKey:v12];

  long long v26 = v13;
  [v13 setPresentationState:v4];
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v15 = self;
  BOOL v16 = [(NSMutableDictionary *)self->_presentations allKeys];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * v20);
        long long v22 = [v4 presentationIdentifier];
        char v23 = [v22 isEqualToString:v21];

        if ((v23 & 1) == 0) {
          [v14 addObject:v21];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }

  long long v24 = [v4 presentationIdentifier];
  [(SASPresentationManager *)v15 _presentationsLock_broadcastPresentationStateForIdentifier:v24 presentationState:v4 presentationIdentifiersToInform:v14];

  os_unfair_lock_unlock(&presentationsLock);
  uint64_t v25 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v33 = "-[SASPresentationManager presentationDidUpdateState:]";
    _os_log_impl(&dword_1D9588000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
}

- (void)_presentationsLock_broadcastPresentationStateForIdentifier:(id)a3 presentationState:(id)a4 presentationIdentifiersToInform:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v25;
    *(void *)&long long v10 = 136315906;
    long long v21 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * v13);
        int v15 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v21;
          long long v29 = "-[SASPresentationManager _presentationsLock_broadcastPresentationStateForIdentifier:presentationState:pr"
                "esentationIdentifiersToInform:]";
          __int16 v30 = 2112;
          uint64_t v31 = v14;
          __int16 v32 = 2112;
          id v33 = v7;
          __int16 v34 = 2112;
          id v35 = v8;
          _os_log_impl(&dword_1D9588000, v15, OS_LOG_TYPE_DEFAULT, "%s Sending <%@>'s state --> <%@>: %@", buf, 0x2Au);
        }
        BOOL v16 = -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v14, v21);
        uint64_t v17 = -[SiriPresentationIdentifierTransport initWithSiriPresentationIdentifier:]([SiriPresentationIdentifierTransport alloc], "initWithSiriPresentationIdentifier:", [v7 siriPresentationIdentifier]);
        uint64_t v18 = [v16 presentationServer];
        uint64_t v19 = [v18 connection];
        uint64_t v20 = [v19 remoteTarget];
        [v20 presentationWithIdentifier:v17 didUpdatePresentationState:v8];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v11);
  }
}

- (NSMutableDictionary)presentations
{
  return self->_presentations;
}

- (void)setPresentations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentations, 0);
  objc_destroyWeak((id *)&self->_presentationManagerDelegate);
  objc_storeStrong((id *)&self->lastReportedState, 0);
}

- (void)registerSiriPresentation:withIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation Registration of '%@' when it is already connected. Removing.", v2, v3, v4, v5, 2u);
}

- (void)unregisterSiriPresentationWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation Unregister request of '%@' when it is not connected.", v2, v3, v4, v5, 2u);
}

- (void)preheatNextPresentationToActivateWithOptions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation #preheat tried to preheat %@ but it's not a registered presentation", v2, v3, v4, v5, 2u);
}

- (void)preheatNextPresentationToActivateWithOptions:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = SASRequestStateGetName([a3 requestState]);
  int v7 = 136315650;
  id v8 = "-[SASPresentationManager preheatNextPresentationToActivateWithOptions:]";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1D9588000, v5, OS_LOG_TYPE_ERROR, "%s #activation #preheat tried to preheat %@ but it's request state is %@", (uint8_t *)&v7, 0x20u);
}

- (void)_sendBlock:toPresentationWithPresentationIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation presentation with identifier %@ isn't registered", v2, v3, v4, v5, 2u);
}

- (void)_buildPresentationOptionsWithRequestOptions:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[SASPresentationManager _buildPresentationOptionsWithRequestOptions:]";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_1D9588000, a2, OS_LOG_TYPE_DEBUG, "%s #activation is Visual Intelligence Launch: %d", (uint8_t *)&v2, 0x12u);
}

- (void)_buildPresentationOptionsWithRequestOptions:(uint64_t)a3 .cold.2(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = a1;
  uint64_t v6 = SiriPresentationRotationStyleGetName(a2);
  v8[0] = 136315650;
  OUTLINED_FUNCTION_1();
  __int16 v9 = v7;
  uint64_t v10 = a3;
  _os_log_debug_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEBUG, "%s #activation Setting rotation style for presentation { rotationStyle: %@, presentation: %@ }", (uint8_t *)v8, 0x20u);
}

void __81__SASPresentationManager__waitForPongFromPresentationWithPresentationIdentifier___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]_block_invoke";
  _os_log_error_impl(&dword_1D9588000, log, OS_LOG_TYPE_ERROR, "%s #pingpong timed out waiting for pong", (uint8_t *)&v1, 0xCu);
}

@end