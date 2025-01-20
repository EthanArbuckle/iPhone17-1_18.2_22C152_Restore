@interface TUISmartReplyGenerator
+ (BOOL)emptyInputContext:(id)a3 withTrimmedCharacters:(id)a4;
+ (id)obscuredArrayDescription:(id)a3;
+ (id)obscuredStringDescription:(id)a3;
+ (id)sharedInstance;
+ (id)stringForSmartReplyType:(int64_t)a3;
- (BOOL)_isGMAvailableForMailReply;
- (BOOL)_isGMAvailableForMailReplyLongFormBasic;
- (BOOL)_isGMAvailableForMessagesReply;
- (BOOL)_queueOnly_isSmartReplyAvailableForClientAndType:(int64_t)a3;
- (BOOL)_queueOnly_shouldAllowResponse:(id)a3;
- (BOOL)_staging_inputContextHistory_IsValid:(id)a3;
- (BOOL)contextHistoryDidChange:(id)a3;
- (BOOL)enabled;
- (BOOL)hasPendingRequestForContext:(id)a3 historyDidChange:(BOOL)a4;
- (BOOL)isClientMail;
- (BOOL)isClientMessages;
- (BOOL)isEnabledForCurrentKeyboardState;
- (NSMutableArray)pendingCallbacks;
- (NSMutableDictionary)acceptedCandidates;
- (NSString)pendingRequestThreadIdentifier;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)generationQueue;
- (OS_dispatch_source)responseTimer;
- (TIInputContextHistory)currentInputContextHistory;
- (TIKeyboardState)currentKeyboardState;
- (TUISmartReplyGenerator)init;
- (_TtC11TextInputUI18TUINetworkObserver)networkObserver;
- (_TtC11TextInputUI31TUITextCompositionClientWrapper)textCompositionClient;
- (id)cachedSmartReplyCandidate;
- (id)createTimerWithDelay:(unint64_t)a3 onQueue:(id)a4 handler:(id)a5;
- (int64_t)candidateSourceType;
- (int64_t)generatedCandidateType;
- (void)_performGenerateCandidatesForKeyboardState:(id)a3 completion:(id)a4;
- (void)candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRequestToken:(id)a5;
- (void)didObserveNetworkAvailabilityChange:(BOOL)a3;
- (void)generateCandidatesForKeyboardState:(id)a3 completion:(id)a4;
- (void)returnResults:(id)a3 requestIDStr:(id)a4 multiStageEntryPointCandidate:(id)a5 smartReplyType:(int64_t)a6 forCompletion:(id)a7 fromTimeout:(BOOL)a8;
- (void)setAcceptedCandidates:(id)a3;
- (void)setCachedSmartReplyCandidate:(id)a3;
- (void)setCurrentInputContextHistory:(id)a3;
- (void)setCurrentKeyboardState:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPendingCallbacks:(id)a3;
- (void)setPendingRequestThreadIdentifier:(id)a3;
- (void)setResponseTimer:(id)a3;
- (void)shouldGenerateCandidatesForKeyboardState:(id)a3 completion:(id)a4;
- (void)syncToKeyboardState:(id)a3;
@end

@implementation TUISmartReplyGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_acceptedCandidates, 0);
  objc_storeStrong((id *)&self->_pendingCallbacks, 0);
  objc_storeStrong((id *)&self->_pendingRequestThreadIdentifier, 0);
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_currentKeyboardState, 0);
  objc_storeStrong((id *)&self->_currentInputContextHistory, 0);
  objc_storeStrong(&self->_cachedSmartReplyCandidate, 0);
  objc_storeStrong((id *)&self->_networkObserver, 0);
  objc_storeStrong((id *)&self->_textCompositionClient, 0);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (OS_dispatch_queue)generationQueue
{
  return self->_generationQueue;
}

- (void)setAcceptedCandidates:(id)a3
{
}

- (NSMutableDictionary)acceptedCandidates
{
  return self->_acceptedCandidates;
}

- (void)setPendingCallbacks:(id)a3
{
}

- (NSMutableArray)pendingCallbacks
{
  return self->_pendingCallbacks;
}

- (void)setPendingRequestThreadIdentifier:(id)a3
{
}

- (NSString)pendingRequestThreadIdentifier
{
  return self->_pendingRequestThreadIdentifier;
}

- (void)setResponseTimer:(id)a3
{
}

- (OS_dispatch_source)responseTimer
{
  return self->_responseTimer;
}

- (TIKeyboardState)currentKeyboardState
{
  return self->_currentKeyboardState;
}

- (void)setCurrentInputContextHistory:(id)a3
{
}

- (void)setCachedSmartReplyCandidate:(id)a3
{
}

- (id)cachedSmartReplyCandidate
{
  return self->_cachedSmartReplyCandidate;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

- (BOOL)enabled
{
  return self->enabled;
}

- (void)didObserveNetworkAvailabilityChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v4 = TUISmartReplyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_debug_impl(&dword_18D47E000, v4, OS_LOG_TYPE_DEBUG, "Observed network availbility: %d", (uint8_t *)v5, 8u);
  }
}

- (BOOL)isClientMail
{
  v2 = [(TUISmartReplyGenerator *)self currentKeyboardState];
  BOOL v3 = [v2 clientIdentifier];
  char v4 = [v3 hasPrefix:@"com.apple.mobilemail"];

  return v4;
}

- (BOOL)isClientMessages
{
  v2 = [(TUISmartReplyGenerator *)self currentKeyboardState];
  BOOL v3 = [v2 clientIdentifier];
  char v4 = [v3 hasPrefix:@"com.apple.MobileSMS"];

  return v4;
}

- (BOOL)isEnabledForCurrentKeyboardState
{
  if ([(TUISmartReplyGenerator *)self isClientMessages]
    || (int v3 = [(TUISmartReplyGenerator *)self isClientMail]) != 0)
  {
    LOBYTE(v3) = _os_feature_enabled_impl();
  }
  return v3;
}

- (int64_t)candidateSourceType
{
  return 2;
}

- (int64_t)generatedCandidateType
{
  return 2;
}

- (id)createTimerWithDelay:(unint64_t)a3 onQueue:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)a4);
  if (v8)
  {
    dispatch_time_t v9 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

- (TIInputContextHistory)currentInputContextHistory
{
  v2 = [(TUISmartReplyGenerator *)self currentKeyboardState];
  int v3 = [v2 inputContextHistory];

  return (TIInputContextHistory *)v3;
}

- (void)setCurrentKeyboardState:(id)a3
{
}

- (void)syncToKeyboardState:(id)a3
{
  id v4 = a3;
  v5 = [v4 textInputTraits];
  char v6 = [v5 secureTextEntry];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = (void *)[v4 copy];
  }
  v8 = [(TUISmartReplyGenerator *)self generationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__TUISmartReplyGenerator_syncToKeyboardState___block_invoke;
  v10[3] = &unk_1E55942D8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_sync(v8, v10);
}

uint64_t __46__TUISmartReplyGenerator_syncToKeyboardState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentKeyboardState:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) isEnabledForCurrentKeyboardState];
  int v3 = *(void **)(a1 + 32);
  return [v3 setEnabled:v2];
}

- (BOOL)_staging_inputContextHistory_IsValid:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 validateForSmartReplyGeneration];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)shouldGenerateCandidatesForKeyboardState:(id)a3 completion:(id)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (!v6)
  {
    v26 = TUISmartReplyLog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

LABEL_12:
      v7[2](v7, 0);
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v27 = "Cancelled smart reply generation due to no state";
LABEL_10:
    _os_log_impl(&dword_18D47E000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    goto LABEL_11;
  }
  v8 = [v6 textInputTraits];
  int v9 = [v8 secureTextEntry];

  if (v9) {
    goto LABEL_12;
  }
  v10 = [v6 documentState];
  id v11 = [v10 contextBeforeInput];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    v14 = [v6 documentState];
    v15 = [v14 contextBeforeInput];
    v16 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    v55[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
    LOBYTE(v13) = [(id)v13 emptyInputContext:v15 withTrimmedCharacters:v17];

    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
  }
  v18 = [v6 documentState];
  v19 = [v18 contextAfterInput];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    BOOL v21 = [(TUISmartReplyGenerator *)self isClientMail];
    uint64_t v22 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    v23 = (void *)v22;
    if (v21)
    {
      v54[0] = v22;
      v24 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      v54[1] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    }
    else
    {
      uint64_t v53 = v22;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    }

    uint64_t v28 = objc_opt_class();
    v29 = [v6 documentState];
    v30 = [v29 contextAfterInput];
    LOBYTE(v28) = [(id)v28 emptyInputContext:v30 withTrimmedCharacters:v25];

    if ((v28 & 1) == 0) {
      goto LABEL_27;
    }
  }
  v31 = [v6 documentState];
  v32 = [v31 selectedText];
  uint64_t v33 = [v32 length];

  if (!v33) {
    goto LABEL_23;
  }
  BOOL v34 = [(TUISmartReplyGenerator *)self isClientMail];
  uint64_t v35 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  v36 = (void *)v35;
  if (v34)
  {
    v52[0] = v35;
    v37 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    v52[1] = v37;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  }
  else
  {
    uint64_t v51 = v35;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  }

  uint64_t v38 = objc_opt_class();
  v39 = [v6 documentState];
  v40 = [v39 selectedText];
  LOBYTE(v38) = [(id)v38 emptyInputContext:v40 withTrimmedCharacters:v25];

  if ((v38 & 1) == 0)
  {
LABEL_27:
    v7[2](v7, 0);

    goto LABEL_13;
  }

LABEL_23:
  v41 = [v6 inputContextHistory];

  if (!v41)
  {
    v26 = TUISmartReplyLog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v27 = "Cancelled smart reply generation due to nil ICH";
    goto LABEL_10;
  }
  v42 = [v6 inputContextHistory];
  BOOL v43 = [(TUISmartReplyGenerator *)self _staging_inputContextHistory_IsValid:v42];

  if (!v43)
  {
    v26 = TUISmartReplyLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v45 = [v6 inputContextHistory];
      v46 = [v45 debugDescription];
      *(_DWORD *)buf = 138477827;
      v50 = v46;
      _os_log_impl(&dword_18D47E000, v26, OS_LOG_TYPE_DEFAULT, "Cancelled smart reply generation due to invalid ICH %{private}@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if ([(TUISmartReplyGenerator *)self isClientMail])
  {
    v44 = [(TUISmartReplyGenerator *)self networkObserver];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __78__TUISmartReplyGenerator_shouldGenerateCandidatesForKeyboardState_completion___block_invoke;
    v47[3] = &unk_1E5594020;
    v48 = v7;
    [v44 isNetworkAvailableWithCompletion:v47];
  }
  else
  {
    v7[2](v7, 1);
  }
LABEL_13:
}

uint64_t __78__TUISmartReplyGenerator_shouldGenerateCandidatesForKeyboardState_completion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = TUISmartReplyLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18D47E000, v3, OS_LOG_TYPE_DEFAULT, "Cancelled smart reply generation due to network access", v5, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)returnResults:(id)a3 requestIDStr:(id)a4 multiStageEntryPointCandidate:(id)a5 smartReplyType:(int64_t)a6 forCompletion:(id)a7 fromTimeout:(BOOL)a8
{
  BOOL v8 = a8;
  *(void *)&long long v59 = a6;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  *((void *)&v59 + 1) = a5;
  id v58 = a7;
  v15 = TUISmartReplyLog();
  v62 = self;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(id)objc_opt_class() obscuredArrayDescription:v13];
    v17 = [(id)objc_opt_class() stringForSmartReplyType:(void)v59];
    v18 = objc_opt_class();
    v19 = [*((id *)&v59 + 1) candidate];
    uint64_t v20 = [v18 obscuredStringDescription:v19];
    *(_DWORD *)buf = 138413315;
    id v88 = v14;
    __int16 v89 = 2113;
    v90 = v16;
    __int16 v91 = 2112;
    v92 = v17;
    __int16 v93 = 2113;
    v94 = v20;
    __int16 v95 = 1024;
    BOOL v96 = v8;
    _os_log_impl(&dword_18D47E000, v15, OS_LOG_TYPE_DEFAULT, "Returning new smart reply candidates for request (ID: %@): %{private}@ type: %@, entry point candidate: %{private}@, timeout: %d", buf, 0x30u);

    self = v62;
  }

  BOOL v21 = [(TUISmartReplyGenerator *)self responseTimer];

  if (v21)
  {
    uint64_t v22 = [(TUISmartReplyGenerator *)self responseTimer];
    dispatch_source_cancel(v22);

    [(TUISmartReplyGenerator *)self setResponseTimer:0];
  }
  if ([v13 count])
  {
    id v57 = v14;
    obuint64_t j = [MEMORY[0x1E4F1CA48] array];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v23 = v13;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v80 objects:v86 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v81 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v80 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_respondsToSelector())
          {
            if (v59 == 0)
            {
              BOOL v29 = [(TUISmartReplyGenerator *)v62 isClientMail];
              uint64_t v30 = 2;
              if (v29) {
                uint64_t v30 = 18;
              }
            }
            else
            {
              uint64_t v30 = 2;
            }
            if ((void)v59 == 1) {
              uint64_t v32 = v30 | 0x40;
            }
            else {
              uint64_t v32 = v30;
            }
            uint64_t v31 = [MEMORY[0x1E4FAE318] candidateWithCandidate:v28 forInput:&stru_1EDC653C0 property:v32];
          }
          else
          {
            uint64_t v31 = [MEMORY[0x1E4FAE318] candidateWithCandidate:v28 forInput:&stru_1EDC653C0];
          }
          uint64_t v33 = (void *)v31;
          if (*((void *)&v59 + 1) && (objc_opt_respondsToSelector() & 1) != 0) {
            [v33 setSmartReplySourceCandidate:*((void *)&v59 + 1)];
          }
          [obj addObject:v33];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v80 objects:v86 count:16];
      }
      while (v25);
    }

    uint64_t v34 = [objc_alloc(MEMORY[0x1E4FAE2A0]) initWithAutocorrection:0 alternateCorrections:obj];
    uint64_t v35 = 0;
    if ((unint64_t)v59 <= 1)
    {
      uint64_t v35 = [MEMORY[0x1E4FAE278] listWithCorrections:v34 predictions:obj emojiList:0 inlineCompletions:0];
    }
    v60 = (void *)v34;
    if (v58)
    {
      v36 = (void *)[v58 copy];
      v37 = [(TUISmartReplyGenerator *)v62 callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke;
      block[3] = &unk_1E5593540;
      id v79 = v36;
      id v78 = v35;
      id v38 = v36;
      dispatch_async(v37, block);
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v39 = [(TUISmartReplyGenerator *)v62 pendingCallbacks];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v74 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v73 + 1) + 8 * j);
          v45 = [(TUISmartReplyGenerator *)v62 callbackQueue];
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_2;
          v70[3] = &unk_1E5593540;
          uint64_t v72 = v44;
          id v71 = v35;
          dispatch_async(v45, v70);
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v73 objects:v85 count:16];
      }
      while (v41);
    }

    id v14 = v57;
LABEL_49:
    self = v62;
    v46 = v58;
    goto LABEL_50;
  }
  v46 = v58;
  if (v58)
  {
    v47 = [(TUISmartReplyGenerator *)self callbackQueue];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_3;
    v68[3] = &unk_1E55934A0;
    id v69 = v58;
    dispatch_async(v47, v68);
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = [(TUISmartReplyGenerator *)self pendingCallbacks];
  uint64_t v48 = [obj countByEnumeratingWithState:&v64 objects:v84 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    id v50 = v14;
    uint64_t v51 = *(void *)v65;
    do
    {
      for (uint64_t k = 0; k != v49; ++k)
      {
        if (*(void *)v65 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = *(void *)(*((void *)&v64 + 1) + 8 * k);
        v54 = [(TUISmartReplyGenerator *)v62 callbackQueue];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_4;
        v63[3] = &unk_1E55934A0;
        v63[4] = v53;
        dispatch_async(v54, v63);
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v64 objects:v84 count:16];
    }
    while (v49);
    id v14 = v50;
    goto LABEL_49;
  }
LABEL_50:

  [(TUISmartReplyGenerator *)self setPendingRequestThreadIdentifier:0];
  v55 = [(TUISmartReplyGenerator *)self pendingCallbacks];
  [v55 removeAllObjects];

  v56 = [(TUISmartReplyGenerator *)self acceptedCandidates];
  [v56 removeAllObjects];
}

uint64_t __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRequestToken:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(TUISmartReplyGenerator *)self generationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__TUISmartReplyGenerator_candidateAccepted_keyboardState_candidateRequestToken___block_invoke;
  block[3] = &unk_1E5593FA8;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __80__TUISmartReplyGenerator_candidateAccepted_keyboardState_candidateRequestToken___block_invoke(id *a1)
{
  if (([a1[4] candidateProperty] & 0x10) != 0)
  {
    uint64_t v2 = [a1[5] acceptedCandidates];
    [v2 removeAllObjects];

    id v3 = a1[4];
    id v6 = [a1[5] acceptedCandidates];
    char v4 = [a1[6] inputContextHistory];
    v5 = [v4 threadIdentifier];
    [v6 setObject:v3 forKeyedSubscript:v5];
  }
}

- (BOOL)_queueOnly_shouldAllowResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 1) {
    goto LABEL_5;
  }
  if (!v5)
  {
    unint64_t v6 = [v4 contentWarning] + 1;
    if (v6 < 4)
    {
      BOOL v3 = (v6 & 0xF) == 1;
      goto LABEL_6;
    }
LABEL_5:
    BOOL v3 = (([v4 contentWarning] + 1) & 0xFFFFFFFFFFFFFFFDLL) != 0;
  }
LABEL_6:

  return v3;
}

- (void)_performGenerateCandidatesForKeyboardState:(id)a3 completion:(id)a4
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUISmartReplyGenerator *)self generationQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = [(TUISmartReplyGenerator *)self acceptedCandidates];
  id v78 = v6;
  id v10 = [v6 inputContextHistory];
  id v11 = [v10 threadIdentifier];
  uint64_t v12 = [v9 objectForKeyedSubscript:v11];

  if (v12 && [(TUISmartReplyGenerator *)self isClientMail]) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  BOOL v14 = v13 != 0;
  if ([(TUISmartReplyGenerator *)self _queueOnly_isSmartReplyAvailableForClientAndType:v14])
  {
    id v15 = [(TUISmartReplyGenerator *)self textCompositionClient];
    uint64_t v16 = [v15 generateRequestToken];

    uint64_t v73 = v16;
    v77 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v16);
    v17 = TUISmartReplyLog();
    BOOL v75 = v13 != 0;
    long long v76 = v7;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = @"not nil";
      if (!v78) {
        v18 = @"nil";
      }
      v68 = v18;
      long long v67 = [v78 inputContextHistory];
      id v69 = [v78 inputContextHistory];
      [v69 threadIdentifier];
      v19 = id v71 = v13;
      uint64_t v20 = objc_opt_class();
      BOOL v21 = [v12 candidate];
      uint64_t v22 = [v20 obscuredStringDescription:v21];
      id v23 = objc_opt_class();
      uint64_t v24 = [v78 inputContextHistory];
      [v24 mostRecentNonSenderTextEntry];
      v26 = uint64_t v25 = v12;
      v27 = [v23 obscuredStringDescription:v26];
      *(_DWORD *)buf = 138413571;
      BOOL v96 = v77;
      __int16 v97 = 2112;
      v98 = v68;
      __int16 v99 = 2048;
      v100 = v67;
      __int16 v101 = 2113;
      v102 = v19;
      __int16 v103 = 2113;
      v104 = v22;
      __int16 v105 = 2113;
      v106 = v27;
      _os_log_impl(&dword_18D47E000, v17, OS_LOG_TYPE_DEFAULT, "Preparing smart reply candidate generation request (ID: %@) for state: (%@),  context: <TIInputContextHistory: %p, id: %{private}@>, candidate: %{private}@, lastEntry: %{private}@", buf, 0x3Eu);

      uint64_t v12 = v25;
      BOOL v14 = v75;

      id v13 = v71;
    }

    uint64_t v28 = TUISmartReplyLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      long long v65 = [v78 inputContextHistory];
      long long v66 = [v65 mostRecentTextEntryLogString];
      *(_DWORD *)buf = 138477827;
      BOOL v96 = v66;
      _os_log_debug_impl(&dword_18D47E000, v28, OS_LOG_TYPE_DEBUG, "   Supplemental privacy lastEntry: %{private}@", buf, 0xCu);
    }
    BOOL v29 = [v78 inputContextHistory];
    BOOL v30 = [(TUISmartReplyGenerator *)self contextHistoryDidChange:v29];

    if (v7
      && ([v78 inputContextHistory],
          uint64_t v31 = objc_claimAutoreleasedReturnValue(),
          BOOL v32 = [(TUISmartReplyGenerator *)self hasPendingRequestForContext:v31 historyDidChange:v30], v31, v32))
    {
      uint64_t v33 = TUISmartReplyLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v96 = v77;
        _os_log_impl(&dword_18D47E000, v33, OS_LOG_TYPE_DEFAULT, "Ignored smart reply candidate generation request (ID: %@) due to pending request", buf, 0xCu);
      }

      uint64_t v34 = [(TUISmartReplyGenerator *)self pendingCallbacks];
      id v35 = (id)[v7 copy];
      [v34 addObject:v35];
    }
    else
    {
      [(TUISmartReplyGenerator *)self setCurrentKeyboardState:v78];
      id v40 = objc_alloc(MEMORY[0x1E4FAE1D0]);
      uint64_t v41 = [(TUISmartReplyGenerator *)self currentInputContextHistory];
      uint64_t v42 = [v40 initWithTIInputContextHistory:v41];

      if (v7)
      {
        BOOL v43 = [(TUISmartReplyGenerator *)self responseTimer];

        if (v43)
        {
          uint64_t v44 = [(TUISmartReplyGenerator *)self responseTimer];
          dispatch_source_cancel(v44);

          [(TUISmartReplyGenerator *)self setResponseTimer:0];
        }
        v45 = [(TUISmartReplyGenerator *)self generationQueue];
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __80__TUISmartReplyGenerator__performGenerateCandidatesForKeyboardState_completion___block_invoke_21;
        v85[3] = &unk_1E55934C8;
        id v86 = v77;
        v87 = self;
        uint64_t v91 = v73;
        BOOL v92 = v14;
        id v88 = v78;
        id v89 = v13;
        id v90 = v7;
        v46 = [(TUISmartReplyGenerator *)self createTimerWithDelay:5 onQueue:v45 handler:v85];
        [(TUISmartReplyGenerator *)self setResponseTimer:v46];
      }
      uint64_t v72 = (void *)v42;
      v47 = TUISmartReplyLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = [(TUISmartReplyGenerator *)self currentInputContextHistory];
        uint64_t v49 = objc_opt_class();
        id v50 = [v13 candidate];
        uint64_t v51 = [v49 obscuredStringDescription:v50];
        *(_DWORD *)buf = 138412803;
        BOOL v96 = v77;
        __int16 v97 = 2048;
        v98 = v48;
        __int16 v99 = 2113;
        v100 = v51;
        _os_log_impl(&dword_18D47E000, v47, OS_LOG_TYPE_DEFAULT, "Smart reply generation requested (ID: %@) for context: <TIInputContextHistory %p>, entryPoint: %{private}@", buf, 0x20u);
      }
      v52 = [(TUISmartReplyGenerator *)self currentInputContextHistory];
      uint64_t v53 = [v52 threadIdentifier];
      [(TUISmartReplyGenerator *)self setPendingRequestThreadIdentifier:v53];

      if (!v13)
      {
        v54 = [v78 clientIdentifier];
        v55 = [v78 inputContextHistory];
        v56 = [v55 threadIdentifier];
        +[TUIInputAnalytics didHandleSmartReplyAnalyticsEventOfType:0 withBundleId:v54 withInputContextHistoryRequestId:v77 withMsgOrMailThreadId:v56 withSmartReplyResponse:0];
      }
      BOOL v70 = v13 == 0;
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v57 = [NSNumber numberWithUnsignedInteger:v73];
      [v35 setObject:v57 forKeyedSubscript:*MEMORY[0x1E4FAE228]];

      id v58 = [NSNumber numberWithInt:getpid()];
      [v35 setObject:v58 forKeyedSubscript:*MEMORY[0x1E4FAE210]];

      long long v59 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v78, "autocapitalizationEnabled"));
      [v35 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4FAE220]];

      long long v74 = [(TUISmartReplyGenerator *)self textCompositionClient];
      v60 = [v78 clientIdentifier];
      [(TUISmartReplyGenerator *)self currentInputContextHistory];
      v62 = v61 = v13;
      v63 = [v62 threadIdentifier];
      long long v64 = [v12 candidate];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __80__TUISmartReplyGenerator__performGenerateCandidatesForKeyboardState_completion___block_invoke_24;
      v79[3] = &unk_1E5593518;
      v79[4] = self;
      id v80 = v77;
      id v81 = v78;
      BOOL v84 = v75;
      id v82 = v61;
      id v83 = v76;
      uint64_t v34 = v72;
      [v74 requestSmartRepliesWithInputContextHistory:v72 shortForm:v70 clientID:v60 threadIdentifier:v63 candidateString:v64 options:v35 completion:v79];

      id v13 = v61;
      id v7 = v76;
    }
    v39 = v77;
  }
  else
  {
    v36 = TUISmartReplyLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [(id)objc_opt_class() stringForSmartReplyType:v13 != 0];
      *(_DWORD *)buf = 138543362;
      BOOL v96 = v37;
      _os_log_impl(&dword_18D47E000, v36, OS_LOG_TYPE_DEFAULT, "Feature unavailable for client and reply type %{public}@", buf, 0xCu);
    }
    id v38 = [(TUISmartReplyGenerator *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__TUISmartReplyGenerator__performGenerateCandidatesForKeyboardState_completion___block_invoke;
    block[3] = &unk_1E55934A0;
    id v94 = v7;
    dispatch_async(v38, block);

    v39 = v94;
  }
}

uint64_t __80__TUISmartReplyGenerator__performGenerateCandidatesForKeyboardState_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __80__TUISmartReplyGenerator__performGenerateCandidatesForKeyboardState_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUISmartReplyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_18D47E000, v2, OS_LOG_TYPE_DEFAULT, "Smart reply generation timed out for request (ID: %@)", (uint8_t *)&v11, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) textCompositionClient];
  [v4 cancelRequestWithToken:*(void *)(a1 + 72)];

  uint64_t v5 = *(void *)(a1 + 80);
  if (!v5)
  {
    id v6 = [*(id *)(a1 + 48) clientIdentifier];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 48) inputContextHistory];
    int v9 = [v8 threadIdentifier];
    +[TUIInputAnalytics didHandleSmartReplyAnalyticsEventOfType:3 withBundleId:v6 withInputContextHistoryRequestId:v7 withMsgOrMailThreadId:v9 withSmartReplyResponse:0];

    uint64_t v5 = *(void *)(a1 + 80);
  }
  return [*(id *)(a1 + 40) returnResults:0 requestIDStr:*(void *)(a1 + 32) multiStageEntryPointCandidate:*(void *)(a1 + 56) smartReplyType:v5 forCompletion:*(void *)(a1 + 64) fromTimeout:1];
}

void __80__TUISmartReplyGenerator__performGenerateCandidatesForKeyboardState_completion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) generationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__TUISmartReplyGenerator__performGenerateCandidatesForKeyboardState_completion___block_invoke_2;
  block[3] = &unk_1E55934F0;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  id v12 = v5;
  uint64_t v15 = v6;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v7 = v3;
  dispatch_async(v4, block);
}

void __80__TUISmartReplyGenerator__performGenerateCandidatesForKeyboardState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUISmartReplyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v41 = *(__CFString **)(a1 + 40);
    id v4 = objc_opt_class();
    id v5 = [*(id *)(a1 + 40) srResponse];
    uint64_t v6 = [v5 responseTexts];
    id v7 = [v4 obscuredArrayDescription:v6];
    uint64_t v8 = [*(id *)(a1 + 40) contentWarning];
    id v9 = [*(id *)(a1 + 56) inputContextHistory];
    id v10 = [*(id *)(a1 + 56) inputContextHistory];
    uint64_t v11 = [v10 threadIdentifier];
    *(_DWORD *)buf = 138413571;
    BOOL v43 = v3;
    __int16 v44 = 2048;
    v45 = v41;
    __int16 v46 = 2113;
    v47 = v7;
    __int16 v48 = 2048;
    uint64_t v49 = v8;
    __int16 v50 = 2048;
    uint64_t v51 = v9;
    __int16 v52 = 2113;
    uint64_t v53 = v11;
    _os_log_impl(&dword_18D47E000, v2, OS_LOG_TYPE_DEFAULT, "Smart reply generation response for (ID: %@): <TUISmartReplyResponse %p> with text: %{private}@ (contentWarning: %ld) for context: <TIInputContextHistory %p, threadId: %{private}@>", buf, 0x3Eu);
  }
  id v12 = [*(id *)(a1 + 40) srResponse];
  id v13 = TUISmartReplyLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v38 = [*(id *)(a1 + 40) threadIdentifier];
    v39 = [*(id *)(a1 + 48) currentInputContextHistory];
    id v40 = [v39 threadIdentifier];
    *(_DWORD *)buf = 138478083;
    BOOL v43 = v38;
    __int16 v44 = 2113;
    v45 = v40;
    _os_log_debug_impl(&dword_18D47E000, v13, OS_LOG_TYPE_DEBUG, "srResponse.threadIdentifier=\"%{private}@\" self.currentInputContextHistory.threadIdentifier=\"%{private}@\"", buf, 0x16u);
  }
  id v14 = [*(id *)(a1 + 40) threadIdentifier];
  uint64_t v15 = [*(id *)(a1 + 48) currentInputContextHistory];
  uint64_t v16 = [v15 threadIdentifier];
  if ([v14 isEqualToString:v16])
  {

LABEL_7:
    if (!*(void *)(a1 + 80))
    {
      uint64_t v17 = [v12 responseTexts];
      if (v17
        && (v18 = (void *)v17,
            [v12 responseTexts],
            v19 = objc_claimAutoreleasedReturnValue(),
            uint64_t v20 = [v19 count],
            v19,
            v18,
            v20))
      {
        id v14 = [*(id *)(a1 + 56) clientIdentifier];
        uint64_t v21 = *(void *)(a1 + 32);
        uint64_t v15 = [*(id *)(a1 + 56) inputContextHistory];
        uint64_t v16 = [v15 threadIdentifier];
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t v23 = 1;
      }
      else
      {
        id v14 = [*(id *)(a1 + 56) clientIdentifier];
        uint64_t v21 = *(void *)(a1 + 32);
        uint64_t v15 = [*(id *)(a1 + 56) inputContextHistory];
        uint64_t v16 = [v15 threadIdentifier];
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t v23 = 2;
      }
      +[TUIInputAnalytics didHandleSmartReplyAnalyticsEventOfType:v23 withBundleId:v14 withInputContextHistoryRequestId:v21 withMsgOrMailThreadId:v16 withSmartReplyResponse:v22];
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v24 = [*(id *)(a1 + 40) threadIdentifier];
  if (![v24 isEqualToString:&stru_1EDC653C0])
  {

LABEL_17:
    goto LABEL_18;
  }
  uint64_t v25 = [*(id *)(a1 + 48) currentInputContextHistory];
  uint64_t v26 = [v25 threadIdentifier];

  if (!v26) {
    goto LABEL_7;
  }
LABEL_18:
  if (objc_msgSend(*(id *)(a1 + 48), "_queueOnly_shouldAllowResponse:", *(void *)(a1 + 40))
    && ([*(id *)(a1 + 48) currentInputContextHistory],
        v27 = objc_claimAutoreleasedReturnValue(),
        char v28 = [v27 mostRecentTextEntryIsByMe],
        v27,
        (v28 & 1) == 0))
  {
    v36 = *(void **)(a1 + 48);
    v37 = [v12 responseTexts];
    [v36 returnResults:v37 requestIDStr:*(void *)(a1 + 32) multiStageEntryPointCandidate:*(void *)(a1 + 64) smartReplyType:*(void *)(a1 + 80) forCompletion:*(void *)(a1 + 72) fromTimeout:0];
  }
  else
  {
    BOOL v29 = TUISmartReplyLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v30 = *(void **)(a1 + 32);
      uint64_t v31 = [*(id *)(a1 + 40) type];
      BOOL v32 = @"Long";
      if (!v31) {
        BOOL v32 = @"Short";
      }
      uint64_t v33 = v32;
      uint64_t v34 = [*(id *)(a1 + 40) contentWarning];
      if ((unint64_t)(v34 + 1) > 3) {
        id v35 = @"None";
      }
      else {
        id v35 = off_1E5593560[v34 + 1];
      }
      *(_DWORD *)buf = 138412802;
      BOOL v43 = v30;
      __int16 v44 = 2112;
      v45 = v33;
      __int16 v46 = 2112;
      v47 = v35;
      _os_log_impl(&dword_18D47E000, v29, OS_LOG_TYPE_DEFAULT, "Smart reply generation response for (ID: %@): suppressing response for replyType=%@ contentWarning=%@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) returnResults:0 requestIDStr:*(void *)(a1 + 32) multiStageEntryPointCandidate:*(void *)(a1 + 64) smartReplyType:*(void *)(a1 + 80) forCompletion:*(void *)(a1 + 72) fromTimeout:1];
  }
}

- (void)generateCandidatesForKeyboardState:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__967;
  v12[4] = __Block_byref_object_dispose__968;
  id v7 = a3;
  id v13 = (id)[v7 copy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke;
  v9[3] = &unk_1E5593478;
  id v10 = v6;
  uint64_t v11 = v12;
  v9[4] = self;
  id v8 = v6;
  [(TUISmartReplyGenerator *)self shouldGenerateCandidatesForKeyboardState:v7 completion:v9];

  _Block_object_dispose(v12, 8);
}

void __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) generationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_2;
    block[3] = &unk_1E5593450;
    void block[4] = *(void *)(a1 + 32);
    long long v7 = *(_OWORD *)(a1 + 40);
    id v4 = (id)v7;
    long long v10 = v7;
    dispatch_async(v3, block);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
    id v6 = TUISmartReplyLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D47E000, v6, OS_LOG_TYPE_DEFAULT, "Cancelled generateCandidates", buf, 2u);
    }
  }
}

uint64_t __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performGenerateCandidatesForKeyboardState:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) completion:*(void *)(a1 + 40)];
}

- (BOOL)hasPendingRequestForContext:(id)a3 historyDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v7 = [v6 threadIdentifier];
  if ([v7 length])
  {
    id v8 = [v6 threadIdentifier];
    id v9 = [(TUISmartReplyGenerator *)self pendingRequestThreadIdentifier];
    BOOL v10 = [v8 isEqualToString:v9] & !v4;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)contextHistoryDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 threadIdentifier];
  id v6 = [(TUISmartReplyGenerator *)self currentInputContextHistory];
  long long v7 = [v6 threadIdentifier];
  int v8 = [v5 isEqualToString:v7];

  if (v8
    && ([(TUISmartReplyGenerator *)self currentInputContextHistory],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v4 isEqual:v9],
        v9,
        v10))
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__967;
    v27 = __Block_byref_object_dispose__968;
    id v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    uint64_t v11 = [(TUISmartReplyGenerator *)self currentInputContextHistory];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __50__TUISmartReplyGenerator_contextHistoryDidChange___block_invoke;
    v22[3] = &unk_1E5593428;
    v22[4] = &v23;
    [v11 enumerateAllContextEntriesWithEntryId:v22];

    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__967;
    uint64_t v20 = __Block_byref_object_dispose__968;
    id v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__TUISmartReplyGenerator_contextHistoryDidChange___block_invoke_2;
    v15[3] = &unk_1E5593428;
    v15[4] = &v16;
    [v4 enumerateAllContextEntriesWithEntryId:v15];
    [(id)v17[5] timeIntervalSinceDate:v24[5]];
    BOOL v13 = v12 != 0.0;
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

void __50__TUISmartReplyGenerator_contextHistoryDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [v6 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  if (v5 > 0.0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

void __50__TUISmartReplyGenerator_contextHistoryDidChange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [v6 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  if (v5 > 0.0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (BOOL)_queueOnly_isSmartReplyAvailableForClientAndType:(int64_t)a3
{
  if ([(TUISmartReplyGenerator *)self isClientMessages])
  {
    if (!a3)
    {
      return [(TUISmartReplyGenerator *)self _isGMAvailableForMessagesReply];
    }
    return 0;
  }
  if (![(TUISmartReplyGenerator *)self isClientMail]) {
    return 0;
  }
  if (a3 == 1)
  {
    return [(TUISmartReplyGenerator *)self _isGMAvailableForMailReplyLongFormBasic];
  }
  else
  {
    if (a3) {
      return 0;
    }
    return [(TUISmartReplyGenerator *)self _isGMAvailableForMailReply];
  }
}

- (BOOL)_isGMAvailableForMailReplyLongFormBasic
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[TUITextCompositionClientWrapper isGMAvailableForMailReplyLongFormBasic];
  id v3 = TUISmartReplyLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "NO";
    if (v2) {
      id v4 = "YES";
    }
    int v6 = 136315138;
    long long v7 = v4;
    _os_log_impl(&dword_18D47E000, v3, OS_LOG_TYPE_DEFAULT, "Feature available for MailReplyLongFormBasic: %s", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)_isGMAvailableForMailReply
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[TUITextCompositionClientWrapper isGMAvailableForMailReply];
  id v3 = TUISmartReplyLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "NO";
    if (v2) {
      id v4 = "YES";
    }
    int v6 = 136315138;
    long long v7 = v4;
    _os_log_impl(&dword_18D47E000, v3, OS_LOG_TYPE_DEFAULT, "Feature available for MailReply: %s", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)_isGMAvailableForMessagesReply
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[TUITextCompositionClientWrapper isGMAvailableForMessagesReply];
  id v3 = TUISmartReplyLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "NO";
    if (v2) {
      id v4 = "YES";
    }
    int v6 = 136315138;
    long long v7 = v4;
    _os_log_impl(&dword_18D47E000, v3, OS_LOG_TYPE_DEFAULT, "Feature available for MessagesReply: %s", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (_TtC11TextInputUI31TUITextCompositionClientWrapper)textCompositionClient
{
  textCompositionClient = self->_textCompositionClient;
  if (!textCompositionClient)
  {
    id v4 = objc_alloc_init(_TtC11TextInputUI31TUITextCompositionClientWrapper);
    double v5 = self->_textCompositionClient;
    self->_textCompositionClient = v4;

    textCompositionClient = self->_textCompositionClient;
  }
  return textCompositionClient;
}

- (_TtC11TextInputUI18TUINetworkObserver)networkObserver
{
  networkObserver = self->_networkObserver;
  if (!networkObserver)
  {
    id v4 = objc_alloc_init(_TtC11TextInputUI18TUINetworkObserver);
    double v5 = self->_networkObserver;
    self->_networkObserver = v4;

    [(TUINetworkObserver *)self->_networkObserver setDelegate:self];
    networkObserver = self->_networkObserver;
  }
  return networkObserver;
}

- (TUISmartReplyGenerator)init
{
  v12.receiver = self;
  v12.super_class = (Class)TUISmartReplyGenerator;
  BOOL v2 = [(TUISmartReplyGenerator *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    pendingCallbacks = v2->_pendingCallbacks;
    v2->_pendingCallbacks = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    acceptedCandidates = v2->_acceptedCandidates;
    v2->_acceptedCandidates = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.TextInputUI.SmartReplyGenerator.Generation", 0);
    generationQueue = v2->_generationQueue;
    v2->_generationQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.TextInputUI.SmartReplyGenerator.Callback", MEMORY[0x1E4F14430]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

+ (id)obscuredStringDescription:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 length])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<Privacy Hash: %lu>", objc_msgSend(v4, "hash"));
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v5 = @"<empty_string>";
    }
  }
  else
  {
    uint64_t v5 = @"<nil_string>";
  }

  return v5;
}

+ (id)obscuredArrayDescription:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
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
          int v10 = objc_msgSend((id)objc_opt_class(), "obscuredStringDescription:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)stringForSmartReplyType:(int64_t)a3
{
  if (a3) {
    return @"long";
  }
  else {
    return @"short";
  }
}

+ (BOOL)emptyInputContext:(id)a3 withTrimmedCharacters:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "formUnionWithCharacterSet:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  long long v13 = [v5 stringByTrimmingCharactersInSet:v7];
  BOOL v14 = [v13 length] == 0;

  return v14;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_990);
  }
  BOOL v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __40__TUISmartReplyGenerator_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(TUISmartReplyGenerator);
  return MEMORY[0x1F41817F8]();
}

@end