@interface TUIKeyboardCandidateMultiplexer
- (BOOL)_queueOnly_willHandleDeliveryForCandidates:(id)a3 requestToken:(id)a4;
- (BOOL)enableKbdSource;
- (BOOL)willHandleDeliveryForCandidates:(id)a3 requestToken:(id)a4;
- (NSMutableDictionary)generators;
- (NSString)debugDescription;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)receiverQueue;
- (TUIKeyboardCandidateMultiplexer)init;
- (TUIKeyboardCandidateReceiver)candidateReceiver;
- (_TUIKeyboardCorrectionListAccumulatorCache)pendingRequests;
- (id)_queueOnly_correctionListAccumulatorFor:(id)a3 keyboardState:(id)a4 type:(int)a5;
- (id)_queueOnly_enabledCandidateSources;
- (id)_queueOnly_enabledGenerators;
- (id)_queueOnly_mergeKBDCorrections:(id)a3 withTextEffectsCorrections:(id)a4;
- (void)_queueOnly_candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRequestToken:(id)a5;
- (void)_queueOnly_generateCandidatesForKeyboardState:(id)a3 requestToken:(id)a4;
- (void)_queueOnly_performUpdatesToCandidateReceiverForRequest:(id)a3 type:(int)a4;
- (void)_sendSmartRepliesTelemetryForCandidates:(id)a3 forKeyboardState:(id)a4;
- (void)addGenerator:(id)a3;
- (void)candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRequestToken:(id)a5;
- (void)generateCandidatesForKeyboardState:(id)a3 requestToken:(id)a4;
- (void)generateCandidatesForKeyboardState:(id)a3 requestToken:(id)a4 fromCandidate:(id)a5;
- (void)receiveExternalAutocorrectionUpdate:(id)a3 requestToken:(id)a4;
- (void)setCandidateReceiver:(id)a3;
- (void)setEnableKbdSource:(BOOL)a3;
- (void)setGenerators:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)syncToKeyboardState:(id)a3;
@end

@implementation TUIKeyboardCandidateMultiplexer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_generators, 0);
  objc_destroyWeak((id *)&self->_candidateReceiver);
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setPendingRequests:(id)a3
{
}

- (_TUIKeyboardCorrectionListAccumulatorCache)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setGenerators:(id)a3
{
}

- (NSMutableDictionary)generators
{
  return self->_generators;
}

- (void)setEnableKbdSource:(BOOL)a3
{
  self->_enableKbdSource = a3;
}

- (BOOL)enableKbdSource
{
  return self->_enableKbdSource;
}

- (void)setCandidateReceiver:(id)a3
{
}

- (TUIKeyboardCandidateReceiver)candidateReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_candidateReceiver);
  return (TUIKeyboardCandidateReceiver *)WeakRetained;
}

- (NSString)debugDescription
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4503;
  v11 = __Block_byref_object_dispose__4504;
  id v12 = 0;
  v3 = [(TUIKeyboardCandidateMultiplexer *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__TUIKeyboardCandidateMultiplexer_debugDescription__block_invoke;
  block[3] = &unk_1E5593B60;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(v3, block);

  v4 = [NSString stringWithFormat:@"<%@: %p, enabledGenerators: %@>", objc_opt_class(), self, v8[5]];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __51__TUIKeyboardCandidateMultiplexer_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queueOnly_enabledGenerators");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)_queueOnly_willHandleDeliveryForCandidates:(id)a3 requestToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 predictions];
  uint64_t v9 = [v8 lastObject];

  v10 = -[TUIKeyboardCandidateMultiplexer _queueOnly_correctionListAccumulatorFor:keyboardState:type:](self, "_queueOnly_correctionListAccumulatorFor:keyboardState:type:", v6, 0, ([v9 customInfoType] >> 5) & 1);

  [v10 updateWithCorrections:v7 forType:0];
  return 1;
}

- (BOOL)willHandleDeliveryForCandidates:(id)a3 requestToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v8 = [(TUIKeyboardCandidateMultiplexer *)self internalQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__TUIKeyboardCandidateMultiplexer_willHandleDeliveryForCandidates_requestToken___block_invoke;
  v12[3] = &unk_1E5593B38;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v6) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

uint64_t __80__TUIKeyboardCandidateMultiplexer_willHandleDeliveryForCandidates_requestToken___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queueOnly_willHandleDeliveryForCandidates:requestToken:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)syncToKeyboardState:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  v5 = [(TUIKeyboardCandidateMultiplexer *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__TUIKeyboardCandidateMultiplexer_syncToKeyboardState___block_invoke;
  v7[3] = &unk_1E55942D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__TUIKeyboardCandidateMultiplexer_syncToKeyboardState___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "generators", 0);
  uint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 syncToKeyboardState:*(void *)(a1 + 40)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_sendSmartRepliesTelemetryForCandidates:(id)a3 forKeyboardState:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 inputContextHistory];
  id v12 = [v6 threadIdentifier];

  uint64_t v7 = [v5 corrections];

  id v8 = [(id)v7 alternateCorrections];

  long long v9 = [v8 firstObject];
  LOBYTE(v7) = [v9 candidateProperty];

  if ((v7 & 2) != 0 && v12)
  {
    long long v10 = [MEMORY[0x1E4F28B50] mainBundle];
    long long v11 = [v10 bundleIdentifier];
    +[TUIInputAnalytics didHandleSmartReplyAnalyticsEventOfType:4 withBundleId:v11 withInputContextHistoryRequestId:0 withMsgOrMailThreadId:v12 withSmartReplyResponse:0];
  }
}

- (void)_queueOnly_performUpdatesToCandidateReceiverForRequest:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v4 == 1
    || ([(_TUIKeyboardCorrectionListAccumulatorCache *)self->_pendingRequests accumulatorForToken:v6 type:1], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    id v8 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self->_pendingRequests accumulatorForToken:v6 type:v4];
    long long v9 = v8;
    if (!v8) {
      goto LABEL_14;
    }
    if ([v8 hasCorrectionsForCandidateSource:2])
    {
      long long v10 = [v9 correctionsForCandidateSource:2];
      long long v11 = [v9 keyboardState];
      [(TUIKeyboardCandidateMultiplexer *)self _sendSmartRepliesTelemetryForCandidates:v10 forKeyboardState:v11];
      goto LABEL_12;
    }
    if ([v9 hasCorrectionsForCandidateSource:1])
    {
      id v12 = v9;
      uint64_t v13 = 1;
    }
    else
    {
      if ([v9 hasCorrectionsForCandidateSource:3])
      {
        long long v11 = [v9 correctionsForCandidateSource:3];
        uint64_t v14 = [v9 correctionsForCandidateSource:0];
        long long v10 = [(TUIKeyboardCandidateMultiplexer *)self _queueOnly_mergeKBDCorrections:v14 withTextEffectsCorrections:v11];

LABEL_12:
        if (v10)
        {
LABEL_13:
          v15 = [(TUIKeyboardCandidateMultiplexer *)self receiverQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __95__TUIKeyboardCandidateMultiplexer__queueOnly_performUpdatesToCandidateReceiverForRequest_type___block_invoke;
          block[3] = &unk_1E5593FA8;
          block[4] = self;
          id v18 = v10;
          id v19 = v6;
          id v16 = v10;
          dispatch_async(v15, block);
        }
LABEL_14:

        goto LABEL_15;
      }
      if (![v9 hasCorrectionsForCandidateSource:0]) {
        goto LABEL_14;
      }
      id v12 = v9;
      uint64_t v13 = 0;
    }
    long long v10 = [v12 correctionsForCandidateSource:v13];
    if (!v10) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_15:
}

void __95__TUIKeyboardCandidateMultiplexer__queueOnly_performUpdatesToCandidateReceiverForRequest_type___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) candidateReceiver];
  [v2 pushAutocorrections:*(void *)(a1 + 40) requestToken:*(void *)(a1 + 48)];
}

- (id)_queueOnly_mergeKBDCorrections:(id)a3 withTextEffectsCorrections:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = (void *)v6;
  if (!(v5 | v6))
  {
    id v8 = 0;
    goto LABEL_18;
  }
  if (!v5)
  {
    id v25 = (id)v6;
LABEL_17:
    id v8 = v25;
    goto LABEL_18;
  }
  if (!v6)
  {
    id v25 = (id)v5;
    goto LABEL_17;
  }
  long long v9 = [(id)v6 corrections];

  if (v9) {
    long long v10 = v7;
  }
  else {
    long long v10 = (void *)v5;
  }
  long long v11 = [v10 corrections];
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = [v7 predictions];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    v15 = [v7 predictions];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      v17 = [v7 predictions];
      id v18 = [v17 objectAtIndexedSubscript:0];
      [v12 addObject:v18];
    }
  }
  uint64_t v19 = [(id)v5 predictions];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(id)v5 predictions];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      v23 = [(id)v5 predictions];
      v24 = [v23 objectAtIndexedSubscript:0];
      [v12 addObject:v24];
    }
  }
  id v8 = [MEMORY[0x1E4FAE278] listWithCorrections:v11 predictions:v12];

LABEL_18:
  return v8;
}

- (void)_queueOnly_candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRequestToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(TUIKeyboardCandidateMultiplexer *)self _queueOnly_enabledGenerators];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__TUIKeyboardCandidateMultiplexer__queueOnly_candidateAccepted_keyboardState_candidateRequestToken___block_invoke;
  v15[3] = &unk_1E5593B10;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 enumerateObjectsUsingBlock:v15];
}

void __100__TUIKeyboardCandidateMultiplexer__queueOnly_candidateAccepted_keyboardState_candidateRequestToken___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 candidateAccepted:a1[4] keyboardState:a1[5] candidateRequestToken:a1[6]];
  }
}

- (void)candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRequestToken:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[a4 copy];
  long long v11 = [(TUIKeyboardCandidateMultiplexer *)self internalQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__TUIKeyboardCandidateMultiplexer_candidateAccepted_keyboardState_candidateRequestToken___block_invoke;
  v15[3] = &unk_1E5593FD0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __89__TUIKeyboardCandidateMultiplexer_candidateAccepted_keyboardState_candidateRequestToken___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queueOnly_candidateAccepted:keyboardState:candidateRequestToken:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t result = [*(id *)(a1 + 40) candidateProperty];
  if ((result & 0x10) != 0)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 generateCandidatesForKeyboardState:v4 requestToken:v5];
  }
  return result;
}

- (void)_queueOnly_generateCandidatesForKeyboardState:(id)a3 requestToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUIKeyboardCandidateMultiplexer *)self _queueOnly_enabledGenerators];
  if ([v8 count])
  {
    id v9 = [(TUIKeyboardCandidateMultiplexer *)self candidateReceiver];

    if (v7 && v9)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__4503;
      void v15[4] = __Block_byref_object_dispose__4504;
      id v16 = [(TUIKeyboardCandidateMultiplexer *)self _queueOnly_correctionListAccumulatorFor:v7 keyboardState:v6 type:0];
      id v10 = [(TUIKeyboardCandidateMultiplexer *)self _queueOnly_enabledGenerators];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke;
      v11[3] = &unk_1E5593AE8;
      id v12 = v6;
      id v13 = self;
      id v14 = v15;
      [v10 enumerateObjectsUsingBlock:v11];

      _Block_object_dispose(v15, 8);
    }
  }
  else
  {
  }
}

void __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke_2;
  v8[3] = &unk_1E5593AC0;
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v6 = a1[6];
  id v9 = v3;
  uint64_t v10 = v6;
  v8[4] = v4;
  id v7 = v3;
  [v7 generateCandidatesForKeyboardState:v5 completion:v8];
}

void __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke_3;
  block[3] = &unk_1E5593A98;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) candidateSourceType];
  return [v1 updateWithCorrections:v2 forType:v3];
}

- (void)generateCandidatesForKeyboardState:(id)a3 requestToken:(id)a4
{
  id v6 = a4;
  long long v7 = (void *)[a3 copy];
  id v8 = [(TUIKeyboardCandidateMultiplexer *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__TUIKeyboardCandidateMultiplexer_generateCandidatesForKeyboardState_requestToken___block_invoke;
  block[3] = &unk_1E5593FA8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __83__TUIKeyboardCandidateMultiplexer_generateCandidatesForKeyboardState_requestToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueOnly_generateCandidatesForKeyboardState:requestToken:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)generateCandidatesForKeyboardState:(id)a3 requestToken:(id)a4 fromCandidate:(id)a5
{
  id v7 = a4;
  id v8 = (void *)[a3 copy];
  id v9 = [(TUIKeyboardCandidateMultiplexer *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__TUIKeyboardCandidateMultiplexer_generateCandidatesForKeyboardState_requestToken_fromCandidate___block_invoke;
  block[3] = &unk_1E5593FA8;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

uint64_t __97__TUIKeyboardCandidateMultiplexer_generateCandidatesForKeyboardState_requestToken_fromCandidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueOnly_generateCandidatesForKeyboardState:requestToken:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)_queueOnly_correctionListAccumulatorFor:(id)a3 keyboardState:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self->_pendingRequests accumulatorForToken:v8 type:v5];

  if (!v10)
  {
    id v11 = [(TUIKeyboardCandidateMultiplexer *)self _queueOnly_enabledCandidateSources];
    id v12 = +[_TUIKeyboardCorrectionListAccumulatorPolicy standard];
    if ([v11 containsObject:&unk_1EDC79A10]) {
      [v12 setAccumulatorTimeout:3.0];
    }
    id v13 = [v9 textInputTraits];
    char v14 = [v13 secureTextEntry];

    if (v14) {
      id v15 = 0;
    }
    else {
      id v15 = v9;
    }
    id v16 = [_TUIKeyboardCorrectionListAccumulator alloc];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_correctionListAccumulatorFor_keyboardState_type___block_invoke;
    v20[3] = &unk_1E5593A70;
    v20[4] = self;
    id v21 = v8;
    int v22 = v5;
    id v17 = [(_TUIKeyboardCorrectionListAccumulator *)v16 initWithRequestToken:v21 keyboardState:v15 enabledCandidateSources:v11 policy:v12 onComplete:v20];
    [(_TUIKeyboardCorrectionListAccumulatorCache *)self->_pendingRequests addToCache:v17 type:v5];
  }
  id v18 = [(_TUIKeyboardCorrectionListAccumulatorCache *)self->_pendingRequests accumulatorForToken:v8 type:v5];

  return v18;
}

void __94__TUIKeyboardCandidateMultiplexer__queueOnly_correctionListAccumulatorFor_keyboardState_type___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_correctionListAccumulatorFor_keyboardState_type___block_invoke_2;
  block[3] = &unk_1E5593A48;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  int v6 = *(_DWORD *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __94__TUIKeyboardCandidateMultiplexer__queueOnly_correctionListAccumulatorFor_keyboardState_type___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueOnly_performUpdatesToCandidateReceiverForRequest:type:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

- (id)_queueOnly_enabledCandidateSources
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = v3;
  if (self->_enableKbdSource) {
    [v3 addObject:&unk_1EDC799F8];
  }
  id v5 = [(TUIKeyboardCandidateMultiplexer *)self _queueOnly_enabledGenerators];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__TUIKeyboardCandidateMultiplexer__queueOnly_enabledCandidateSources__block_invoke;
  v9[3] = &unk_1E5593A20;
  id v10 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = [v6 allObjects];

  return v7;
}

void __69__TUIKeyboardCandidateMultiplexer__queueOnly_enabledCandidateSources__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "candidateSourceType"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (id)_queueOnly_enabledGenerators
{
  uint64_t v2 = [(TUIKeyboardCandidateMultiplexer *)self generators];
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_4527];
  id v5 = [v3 objectsAtIndexes:v4];

  return v5;
}

uint64_t __63__TUIKeyboardCandidateMultiplexer__queueOnly_enabledGenerators__block_invoke(uint64_t a1, void *a2)
{
  return [a2 enabled];
}

- (void)addGenerator:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIKeyboardCandidateMultiplexer *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__TUIKeyboardCandidateMultiplexer_addGenerator___block_invoke;
  v7[3] = &unk_1E55942D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__TUIKeyboardCandidateMultiplexer_addGenerator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) generators];
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "candidateSourceType"));
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    id v5 = TUICandidateGenerationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_18D47E000, v5, OS_LOG_TYPE_ERROR, "generator of same source type already exists, should only be one per source", v9, 2u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) generators];
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "candidateSourceType"));
  [v7 setObject:v6 forKeyedSubscript:v8];
}

- (void)receiveExternalAutocorrectionUpdate:(id)a3 requestToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_enableKbdSource)
  {
    id v8 = [(TUIKeyboardCandidateMultiplexer *)self internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__TUIKeyboardCandidateMultiplexer_receiveExternalAutocorrectionUpdate_requestToken___block_invoke;
    block[3] = &unk_1E5593FA8;
    void block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

void __84__TUIKeyboardCandidateMultiplexer_receiveExternalAutocorrectionUpdate_requestToken___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queueOnly_correctionListAccumulatorFor:keyboardState:type:", *(void *)(a1 + 40), 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateWithCorrections:*(void *)(a1 + 48) forType:0];
}

- (TUIKeyboardCandidateMultiplexer)init
{
  v13.receiver = self;
  v13.super_class = (Class)TUIKeyboardCandidateMultiplexer;
  id v2 = [(TUIKeyboardCandidateMultiplexer *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    generators = v2->_generators;
    v2->_generators = (NSMutableDictionary *)v3;

    id v5 = [[_TUIKeyboardCorrectionListAccumulatorCache alloc] initWithSize:20];
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v5;

    v2->_enableKbdSource = 0;
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.TextInputUI.CandidateMux.Internal", v7);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.TextInputUI.CandidateMux.Receiver", v7);
    receiverQueue = v2->_receiverQueue;
    v2->_receiverQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

@end