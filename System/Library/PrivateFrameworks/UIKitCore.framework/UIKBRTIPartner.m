@interface UIKBRTIPartner
+ (void)registerTextOperationCustomInfo;
- (BOOL)_remoteInputSystemRequiresDocumentStateForAutofill;
- (BOOL)_remoteInputSystemRequiresDocumentStateUpdates;
- (BOOL)_updateRTITraitsIfNecessary;
- (BOOL)applicationStateIsActiveForRTI;
- (BOOL)compareWaitingRTIOutputOperationResponseContext:(id)a3 andExchange:(id)a4;
- (BOOL)documentTraitsDisableAutomaticKeyboardUI;
- (BOOL)inputSystemClientEnabled;
- (BOOL)isNotifyingDelegateOfRemoteOutputOperation;
- (BOOL)isObservingGeometry;
- (BOOL)remoteTextInputClientHasActiveSession;
- (BOOL)synchronousForwardKeyCommandsBeforePublicToUIHost:(id)a3;
- (BOOL)synchronousForwardKeyCommandsToUIHost:(id)a3;
- (BOOL)synchronousForwardKeyInputMethodCommandEventToUIHost:(id)a3 canHandleAppKeyCommand:(BOOL)a4;
- (BOOL)viewServiceStateIsActiveForRTI;
- (CGRect)_selectionClipRect;
- (CGRect)convertRect:(CGRect)a3 from:(id)a4;
- (NSMutableArray)queuedSupplementalLexiconOperations;
- (NSMutableDictionary)rtiSessionMarkers;
- (NSMutableDictionary)supplementalLexicons;
- (NSMutableDictionary)textSuggestions;
- (NSUUID)authenticatingSessionIdentifier;
- (NSUUID)currentSessionIdentifier;
- (RTIDocumentState)rtiDocumentState;
- (RTIDocumentTraits)rtiDocumentTraits;
- (RTIInputSourceState)rtiInputSourceState;
- (RTIInputSystemClient)rtiClient;
- (TIKeyboardOutput)pendingOutputOperation;
- (UIKBRTIPartner)init;
- (UIKBRTIPartnerDelegate)partnerDelegate;
- (UIKeyboardTaskSubqueue)keyboardTaskSubqueue;
- (id)_defaultRTIMachNames;
- (id)_newInputSystemAutoFillUIClient;
- (id)_newInputSystemUIClient;
- (id)_newRTIConnection;
- (id)delegate;
- (id)exchangeWaitingRTIOutputOperationResponseContext:(id)a3;
- (id)inputDelegate;
- (id)inputDelegateView;
- (id)insertionPointColor;
- (id)payloadDelegate;
- (id)textOperation_cancelChooseSupplementalItemToInsert;
- (id)textOperation_chooseSupplementalItem:(id)a3 toReplaceText:(id)a4;
- (id)textOperation_insertAutofillContent:(id)a3;
- (id)textOperation_insertSupplementalCandidate:(id)a3 textToCommit:(id)a4;
- (id)textOperation_insertionPointEnteredText:(id)a3 withSupplementalCandidate:(id)a4;
- (id)textOperation_insertionPointExitedTextWithSupplementalItems;
- (int64_t)_uiTextGranularityForRTITextGranularity:(int64_t)a3;
- (unsigned)_ignoredReasonsForAutoFill;
- (unsigned)_ignoredReasonsForKeyboard;
- (unsigned)_performKeyboardOutputOperations:(id)a3;
- (void)_addAutocorrectStylingToDocumentState:(id)a3;
- (void)_addCharacterRectsToDocumentState:(id)a3 textRange:(id)a4 offset:(int64_t)a5;
- (void)_addFirstSelectionRectToDocumentState:(id)a3;
- (void)_addMergedTextRectsToDocumentState:(id)a3 forWKContext:(id)a4 textInputView:(id)a5 granularity:(int64_t)a6;
- (void)_addTextCheckingAnnotatedStringToDocumentState:(id)a3;
- (void)_applicationDidRemoveDeactivationReason:(id)a3;
- (void)_applicationWillAddDeactivationReason:(id)a3;
- (void)_applicationWillSuspend:(id)a3;
- (void)_createRTIClient;
- (void)_createRTIClientIfNecessary;
- (void)_didAddSupplementalLexicon:(id)a3;
- (void)_didCreateRTIClient:(id)a3;
- (void)_didRemoveSupplementalLexiconWithIdentifier:(unint64_t)a3;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_performDocumentRequest:(id)a3 completion:(id)a4;
- (void)_performQueuedSupplementalLexiconOperations;
- (void)_queryDocumentRequest:(id)a3 completion:(id)a4;
- (void)_queryUIKitDocumentRequest:(id)a3 completion:(id)a4;
- (void)_queryWKDocumentRequest:(id)a3 completion:(id)a4;
- (void)_queueSupplementalLexiconOperation:(unint64_t)a3 lexicon:(id)a4;
- (void)_queued_performTextOperations:(id)a3 resultHandler:(id)a4;
- (void)_screenModeDidChange:(id)a3;
- (void)_updateGeometryObserverIfNecessary;
- (void)_updateRTIAllowedAndNotify:(BOOL)a3 withReason:(id)a4;
- (void)_updateRTIStateWithCompletion:(id)a3;
- (void)_viewServiceHostDidBecomeActive:(id)a3;
- (void)_viewServiceHostWillResignActive:(id)a3;
- (void)addTextSuggestions:(id)a3;
- (void)applyAssistantItem:(id)a3;
- (void)applyRemoteDocumentStateIfNecessary:(id)a3 force:(BOOL)a4;
- (void)applyRemoteDocumentTraitsIfNecessary:(id)a3 force:(BOOL)a4;
- (void)beginAllowingRemoteTextInput:(id)a3;
- (void)beginInputSessionWithIdentifier:(id)a3;
- (void)dealloc;
- (void)defaultDocumentRequestDidChange:(id)a3;
- (void)didAddSupplementalLexicon:(id)a3;
- (void)didRemoveSupplementalLexicon:(id)a3;
- (void)documentStateChanged;
- (void)documentStateChanged:(BOOL)a3;
- (void)documentTraitsChanged;
- (void)endAllowingRemoteTextInput:(id)a3;
- (void)endAllowingRemoteTextInput:(id)a3 waitForReply:(BOOL)a4;
- (void)endInputSessionOnSwitchingApps;
- (void)endInputSessionWithIdentifier:(id)a3;
- (void)endInputSessionWithIdentifier:(id)a3 shouldResign:(BOOL)a4;
- (void)endInputSessionWithIdentifier:(id)a3 shouldResign:(BOOL)a4 waitForReply:(BOOL)a5;
- (void)ensureRTIConnection;
- (void)finishCompletionHandlersIfNeeded;
- (void)forwardApplicationOperation:(SEL)a3 object:(id)a4;
- (void)forwardAutofillPayload:(id)a3 toPayloadDelegate:(id)a4;
- (void)forwardClearForwardingInputDelegateAndResign:(BOOL)a3;
- (void)forwardDictationEventToUIHost:(SEL)a3 withOptionalObject:(id)a4;
- (void)forwardEventCallbackToRemoteSource_didChooseSupplementalItem:(id)a3 toReplaceText:(id)a4;
- (void)forwardEventToRemoteSource_canSuggestSupplementalItemsForCurrentSelection:(BOOL)a3;
- (void)forwardGrammarCorrectionEntries:(id)a3;
- (void)forwardInputDestinationEventToUIHost:(SEL)a3;
- (void)forwardInputDestinationEventToUIHost:(SEL)a3 params:(id)a4;
- (void)forwardKeyboardCameraEvent_startCameraInput:(id)a3;
- (void)forwardKeyboardEventToUIHost:(id)a3;
- (void)forwardKeyboardInputMode:(id)a3;
- (void)forwardKeyboardOperation:(SEL)a3 object:(id)a4;
- (void)forwardKeyboardSuppression:(BOOL)a3 suppressAssistantBar:(BOOL)a4;
- (void)forwardScrollEventToUIHost:(SEL)a3 contentTransform:(CGAffineTransform *)a4 environmentTransform:(CGAffineTransform *)a5;
- (void)forwardSelectorToUIHost:(SEL)a3 completionHandler:(id)a4;
- (void)forwardTypologyLogURL:(id)a3;
- (void)inputSession:(id)a3 didAddRTISupplementalLexicon:(id)a4;
- (void)inputSession:(id)a3 didRemoveRTISupplementalLexicon:(id)a4;
- (void)inputSession:(id)a3 documentStateDidChange:(id)a4;
- (void)inputSession:(id)a3 documentTraitsDidChange:(id)a4;
- (void)inputSession:(id)a3 performInputOperation:(id)a4;
- (void)inputSession:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5;
- (void)inputSession:(id)a3 textSuggestionsChanged:(id)a4;
- (void)invalidate;
- (void)performDocumentRequest:(id)a3 completion:(id)a4;
- (void)performInputOperation:(id)a3;
- (void)performTextOperations:(id)a3;
- (void)performTextOperations:(id)a3 resultHandler:(id)a4;
- (void)removeTextSuggestionsForSessionWithID:(id)a3;
- (void)restartCurrentSession;
- (void)sendAutoFillDidInsertCallbacksWithTextOperations:(id)a3;
- (void)setApplicationStateIsActiveForRTI:(BOOL)a3;
- (void)setAuthenticatingSessionIdentifier:(id)a3;
- (void)setCurrentSessionIdentifier:(id)a3;
- (void)setInputSystemClientEnabled:(BOOL)a3;
- (void)setIsObservingGeometry:(BOOL)a3;
- (void)setKeyboardTaskSubqueue:(id)a3;
- (void)setPartnerDelegate:(id)a3;
- (void)setPendingOutputOperation:(id)a3;
- (void)setQueuedSupplementalLexiconOperations:(id)a3;
- (void)setRtiClient:(id)a3;
- (void)setRtiDocumentState:(id)a3;
- (void)setRtiDocumentTraits:(id)a3;
- (void)setRtiSessionMarkers:(id)a3;
- (void)setSupplementalLexicons:(id)a3;
- (void)setTextSuggestions:(id)a3;
- (void)setViewServiceStateIsActiveForRTI:(BOOL)a3;
- (void)textSuggestionsChanged:(id)a3;
- (void)updateAnimationForOptions:(id)a3;
- (void)updateStateWithCompletion:(id)a3 updateTraits:(BOOL)a4;
- (void)updateTextSuggestionsIfNecessary:(id)a3;
@end

@implementation UIKBRTIPartner

- (BOOL)inputSystemClientEnabled
{
  return self->_inputSystemClientEnabled;
}

- (void)forwardClearForwardingInputDelegateAndResign:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
  v13 = @"resign";
  v6 = [NSNumber numberWithBool:v3];
  v14[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v5 setCustomInfo:v7];

  [v5 setCustomInfoType:@"UIEmojiSearchOperations"];
  v8 = [(UIKBRTIPartner *)self rtiClient];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    v9 = [(UIKBRTIPartner *)self rtiClient];
    v10 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v9 remoteTextInputSessionWithID:v10 performInputOperation:v5];
  }
  v11 = +[UIKeyboardImpl activeInstance];
  v12 = [v11 inputDelegateManager];
  [v12 setShouldRespectForwardingInputDelegate:0];
}

- (void)textSuggestionsChanged:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(UIKBRTIPartner *)self _remoteInputSystemRequiresTextSuggestionUpdates];
  id v5 = v9;
  if (v4)
  {
    if (v9)
    {
      v6 = +[UITextSuggestion encodeTextSuggestions:v9];
    }
    else
    {
      v6 = 0;
    }
    uint64_t v7 = [(UIKBRTIPartner *)self rtiClient];
    v8 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v7 remoteTextInputSessionWithID:v8 textSuggestionsChanged:v6];

    id v5 = v9;
  }
}

- (BOOL)remoteTextInputClientHasActiveSession
{
  BOOL v3 = [(UIKBRTIPartner *)self rtiClient];
  BOOL v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  char v5 = [v3 hasActiveSessionWithID:v4];

  return v5;
}

- (NSUUID)currentSessionIdentifier
{
  return self->_currentSessionIdentifier;
}

- (BOOL)_remoteInputSystemRequiresDocumentStateUpdates
{
  BOOL v3 = [(UIKBRTIPartner *)self rtiClient];

  if (v3)
  {
    if (!+[UIKeyboard usesInputSystemUIForAutoFillOnly]
      || (BOOL v4 = [(UIKBRTIPartner *)self _remoteInputSystemRequiresDocumentStateForAutofill]))
    {
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (RTIInputSystemClient)rtiClient
{
  return self->_rtiClient;
}

- (RTIInputSourceState)rtiInputSourceState
{
  return self->_rtiInputSourceState;
}

- (UIKBRTIPartner)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)UIKBRTIPartner;
  v2 = [(UIKBRTIPartner *)&v11 init];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = _nextInstanceID_count++;
    v2->_int64_t id = v4;
    if (os_variant_has_internal_diagnostics())
    {
      id v9 = _UIKeyboardExtendedLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int64_t id = v3->_id;
        *(_DWORD *)buf = 134217984;
        int64_t v13 = id;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "RTI partner init (id=%ld)", buf, 0xCu);
      }
    }
    [(id)objc_opt_class() registerTextOperationCustomInfo];
    v3->_lock._os_unfair_lock_opaque = 0;
    v3->_applicationStateIsActiveForRTI = [(id)UIApp applicationState] == 0;
    v3->_viewServiceStateIsActiveForRTI = 1;
    char v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    rtiSessionMarkers = v3->_rtiSessionMarkers;
    v3->_rtiSessionMarkers = v5;

    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel__applicationWillSuspend_ name:@"UIApplicationSuspendedNotification" object:0];
    [v7 addObserver:v3 selector:sel__viewServiceHostDidBecomeActive_ name:0x1ED1803A0 object:0];
    [v7 addObserver:v3 selector:sel__viewServiceHostWillResignActive_ name:0x1ED180380 object:0];
    [v7 addObserver:v3 selector:sel__viewServiceHostDidBecomeActive_ name:0x1ED180360 object:0];
    [v7 addObserver:v3 selector:sel__applicationWillAddDeactivationReason_ name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
    [v7 addObserver:v3 selector:sel__applicationDidRemoveDeactivationReason_ name:@"_UIApplicationDidRemoveDeactivationReasonNotification" object:0];
    [v7 addObserver:v3 selector:sel__screenModeDidChange_ name:@"UIScreenModeDidChangeNotification" object:0];
  }
  return v3;
}

+ (void)registerTextOperationCustomInfo
{
  if (registerTextOperationCustomInfo_onceToken != -1) {
    dispatch_once(&registerTextOperationCustomInfo_onceToken, &__block_literal_global_371);
  }
}

void __49__UIKBRTIPartner_registerTextOperationCustomInfo__block_invoke()
{
  v123 = (void *)MEMORY[0x1E4F95F18];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2050000000;
  v8 = (void *)qword_1EB261D28;
  uint64_t v128 = qword_1EB261D28;
  if (!qword_1EB261D28)
  {
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __getAFAnalyticsTurnBasedInstrumentationContextClass_block_invoke;
    v124[3] = &unk_1E52D9900;
    v124[4] = &v125;
    __getAFAnalyticsTurnBasedInstrumentationContextClass_block_invoke((uint64_t)v124);
    v8 = (void *)v126[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v125, 8);
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v10, objc_opt_class(), 0);
  [v123 registerCustomInfoClasses:v11 forType:@"UIDictationRemoteTextOperations"];

  v12 = (void *)MEMORY[0x1E4F95EB8];
  int64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
  [v12 registerCustomInfoClasses:v18 forType:@"UIDictationRemoteInputOperations"];

  v19 = (void *)MEMORY[0x1E4F95EB8];
  v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
  [v19 registerCustomInfoClasses:v23 forType:@"UIUserPencilOperations"];

  v24 = (void *)MEMORY[0x1E4F95EB8];
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  [v24 registerCustomInfoClasses:v28 forType:@"UIEmojiSearchOperations"];

  v29 = (void *)MEMORY[0x1E4F95EB8];
  v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  v35 = objc_msgSend(v30, "setWithObjects:", v31, v32, v33, v34, objc_opt_class(), 0);
  [v29 registerCustomInfoClasses:v35 forType:@"UIUserInteractionRemoteInputOperations"];

  v36 = (void *)MEMORY[0x1E4F95F18];
  v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v36 registerCustomInfoClasses:v37 forType:@"_UIKeyboardIndirectTextSelectionGestureState"];

  v38 = (void *)MEMORY[0x1E4F95F18];
  v39 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v38 registerCustomInfoClasses:v39 forType:@"UITextSuggestion"];

  v40 = (void *)MEMORY[0x1E4F95F18];
  v41 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v40 registerCustomInfoClasses:v41 forType:@"UIPhysicalKeyboardEvent"];

  v42 = (void *)MEMORY[0x1E4F95F18];
  v43 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v42 registerCustomInfoClasses:v43 forType:@"UIKBRTICustomInfoTypeDeleteAction"];

  v44 = (void *)MEMORY[0x1E4F95F18];
  v45 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  v51 = objc_msgSend(v45, "setWithObjects:", v46, v47, v48, v49, v50, objc_opt_class(), 0);
  [v44 registerCustomInfoClasses:v51 forType:@"UIStickerRemoteInputOperations"];

  v52 = (void *)MEMORY[0x1E4F95EB8];
  v53 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  v55 = objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  [v52 registerCustomInfoClasses:v55 forType:@"UIPhysicalKeyboardEvent"];

  v56 = (void *)MEMORY[0x1E4F95EB8];
  v57 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v58 = objc_opt_class();
  v59 = objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
  [v56 registerCustomInfoClasses:v59 forType:@"UIKeyboardCameraRemoteInputOperations"];

  v60 = (void *)MEMORY[0x1E4F95F18];
  v61 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v62 = objc_opt_class();
  uint64_t v63 = objc_opt_class();
  uint64_t v64 = objc_opt_class();
  uint64_t v65 = objc_opt_class();
  v66 = objc_msgSend(v61, "setWithObjects:", v62, v63, v64, v65, objc_opt_class(), 0);
  [v60 registerCustomInfoClasses:v66 forType:@"UISupplementalLexiconOperations"];

  v67 = (void *)MEMORY[0x1E4F95EB8];
  v68 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v69 = objc_opt_class();
  uint64_t v70 = objc_opt_class();
  uint64_t v71 = objc_opt_class();
  uint64_t v72 = objc_opt_class();
  v73 = objc_msgSend(v68, "setWithObjects:", v69, v70, v71, v72, objc_opt_class(), 0);
  [v67 registerCustomInfoClasses:v73 forType:@"UISupplementalLexiconInputOperations"];

  v74 = (void *)MEMORY[0x1E4F95F18];
  v75 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v76 = objc_opt_class();
  uint64_t v77 = objc_opt_class();
  uint64_t v78 = objc_opt_class();
  v79 = objc_msgSend(v75, "setWithObjects:", v76, v77, v78, objc_opt_class(), 0);
  [v74 registerCustomInfoClasses:v79 forType:@"UIKBRTICustomInfoTypeAutofill"];

  v80 = (void *)MEMORY[0x1E4F95F18];
  v81 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v82 = objc_opt_class();
  uint64_t v83 = objc_opt_class();
  uint64_t v84 = objc_opt_class();
  uint64_t v85 = objc_opt_class();
  v86 = objc_msgSend(v81, "setWithObjects:", v82, v83, v84, v85, objc_opt_class(), 0);
  [v80 registerCustomInfoClasses:v86 forType:@"UIWebKitOperations"];

  v87 = (void *)MEMORY[0x1E4F95EB8];
  v88 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v89 = objc_opt_class();
  uint64_t v90 = objc_opt_class();
  uint64_t v91 = objc_opt_class();
  v92 = objc_msgSend(v88, "setWithObjects:", v89, v90, v91, objc_opt_class(), 0);
  [v87 registerCustomInfoClasses:v92 forType:@"UIWebKitOperations"];

  v93 = (void *)MEMORY[0x1E4F95F18];
  v94 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v95 = objc_opt_class();
  v96 = objc_msgSend(v94, "setWithObjects:", v95, objc_opt_class(), 0);
  [v93 registerCustomInfoClasses:v96 forType:@"UIEmojiSearchOperations"];

  v97 = (void *)MEMORY[0x1E4F95F18];
  v98 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v97 registerCustomInfoClasses:v98 forType:@"UIKBRTICustomInfoTypeUpdateInputMode"];

  v99 = (void *)MEMORY[0x1E4F95F18];
  v100 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v101 = objc_opt_class();
  uint64_t v102 = objc_opt_class();
  uint64_t v103 = objc_opt_class();
  uint64_t v104 = objc_opt_class();
  v105 = objc_msgSend(v100, "setWithObjects:", v101, v102, v103, v104, objc_opt_class(), 0);
  [v99 registerCustomInfoClasses:v105 forType:@"UIKBRTICustomInfoTypeKeyboardOperations"];

  v106 = (void *)MEMORY[0x1E4F95EB8];
  v107 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v108 = objc_opt_class();
  uint64_t v109 = objc_opt_class();
  uint64_t v110 = objc_opt_class();
  uint64_t v111 = objc_opt_class();
  v112 = objc_msgSend(v107, "setWithObjects:", v108, v109, v110, v111, objc_opt_class(), 0);
  [v106 registerCustomInfoClasses:v112 forType:@"UIKBRTICustomInfoTypeApplicationOperations"];

  v113 = (void *)MEMORY[0x1E4F95F18];
  v114 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v113 registerCustomInfoClasses:v114 forType:@"UIKBRTICustomInfoTypeTypologyLogOperations"];

  v115 = (void *)MEMORY[0x1E4F95EB8];
  v116 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v117 = objc_opt_class();
  v118 = objc_msgSend(v116, "setWithObjects:", v117, objc_opt_class(), 0);
  [v115 registerCustomInfoClasses:v118 forType:@"UIKBRTICustomInfoTypeAnalyticsOperations"];

  v119 = (void *)MEMORY[0x1E4F95EB8];
  v120 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v121 = objc_opt_class();
  v122 = objc_msgSend(v120, "setWithObjects:", v121, objc_opt_class(), 0);
  [v119 registerCustomInfoClasses:v122 forType:@"UIKBRTICustomInfoTypeGrammarCorrectionOperations"];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    v8 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t id = self->_id;
      *(_DWORD *)buf = 134217984;
      int64_t v12 = id;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "RTI partner dealloc (id=%ld)", buf, 0xCu);
    }
  }
  wkRectTokenizer = self->_wkRectTokenizer;
  if (wkRectTokenizer) {
    CFRelease(wkRectTokenizer);
  }
  uint64_t v4 = [(UIKBRTIPartner *)self rtiClient];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(UIKBRTIPartner *)self currentSessionIdentifier];

    if (v6) {
      [(UIKBRTIPartner *)self endInputSessionWithIdentifier:0];
    }
  }
  uint64_t v7 = [(UIKBRTIPartner *)self rtiClient];
  [v7 invalidateConnections];

  v10.receiver = self;
  v10.super_class = (Class)UIKBRTIPartner;
  [(UIKBRTIPartner *)&v10 dealloc];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    v8 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t id = self->_id;
      int v10 = 134217984;
      int64_t v11 = id;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "RTI partner invalidate (id=%ld)", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIApplicationSuspendedNotification" object:0];
  [v3 removeObserver:self name:0x1ED1803A0 object:0];
  [v3 removeObserver:self name:0x1ED180380 object:0];
  [v3 removeObserver:self name:0x1ED180360 object:0];
  [v3 removeObserver:self name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
  [v3 removeObserver:self name:@"_UIApplicationDidRemoveDeactivationReasonNotification" object:0];
  [v3 removeObserver:self name:@"UIScreenModeDidChangeNotification" object:0];
  uint64_t v4 = [(UIKBRTIPartner *)self rtiClient];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(UIKBRTIPartner *)self currentSessionIdentifier];

    if (v6) {
      [(UIKBRTIPartner *)self endInputSessionWithIdentifier:0];
    }
  }
  [(RTIInputSystemClient *)self->_rtiClient invalidateConnections];
  [(RTIInputSystemClient *)self->_rtiClient setDelegate:self];
  rtiClient = self->_rtiClient;
  self->_rtiClient = 0;
}

- (UIKeyboardTaskSubqueue)keyboardTaskSubqueue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_keyboardTaskSubqueue;
  objc_sync_exit(v2);

  return v3;
}

- (void)setKeyboardTaskSubqueue:(id)a3
{
  uint64_t v4 = (UIKeyboardTaskSubqueue *)a3;
  obj = self;
  objc_sync_enter(obj);
  keyboardTaskSubqueue = obj->_keyboardTaskSubqueue;
  obj->_keyboardTaskSubqueue = v4;

  objc_sync_exit(obj);
}

- (void)_applicationWillSuspend:(id)a3
{
  uint64_t v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];

  if (v4)
  {
    if (+[UIKeyboard usingEndInputSessionCompletion])
    {
      [(UIKBRTIPartner *)self _updateRTIAllowedAndNotify:0 withReason:@"Application will suspend"];
    }
    else
    {
      id v5 = [(UIKBRTIPartner *)self currentSessionIdentifier];
      [(UIKBRTIPartner *)self endAllowingRemoteTextInput:v5];
    }
  }
}

- (void)_viewServiceHostWillResignActive:(id)a3
{
  uint64_t v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v5 = [v4 existingContainerRootController];
  [v5 takeKeyboardSnapshotIgnoringSpotlightCheck:0];

  if (+[UIKeyboard usesInputSystemUIForAutoFillOnly])
  {
    uint64_t v6 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    uint64_t v7 = [(UIKBRTIPartner *)self authenticatingSessionIdentifier];
    char v8 = [v6 isEqual:v7];

    if ((v8 & 1) == 0) {
      [(UIKBRTIPartner *)self forwardInputDestinationEventToUIHost:sel_dismissAutoFillPanel];
    }
  }
  [(UIKBRTIPartner *)self setViewServiceStateIsActiveForRTI:0];
  [(UIKBRTIPartner *)self _updateRTIAllowedAndNotify:0 withReason:@"View service host resigned active"];
}

- (void)_viewServiceHostDidBecomeActive:(id)a3
{
  [(UIKBRTIPartner *)self setViewServiceStateIsActiveForRTI:1];
  [(UIKBRTIPartner *)self _updateRTIAllowedAndNotify:0 withReason:@"View service host became active"];
}

- (unsigned)_ignoredReasonsForKeyboard
{
  if (+[UIKeyboard shouldExtendKeyboardInputUI]) {
    return 4143;
  }
  else {
    return 4134;
  }
}

- (unsigned)_ignoredReasonsForAutoFill
{
  return 4134;
}

- (void)_applicationWillAddDeactivationReason:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 4
    && (+[UIKeyboard usesInputSystemUI]
     || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI]))
  {
    self->_applicationDeactivationReasonAssistant = 1;
    if (self->_dontTakeKeyboardSnapshot)
    {
      uint64_t v7 = _UIKeyboardLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Assistant Keyboard Snapshot triggered", buf, 2u);
      }

      char v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      id v9 = [v8 existingContainerRootController];
      [v9 takeKeyboardSnapshotIgnoringSpotlightCheck:self->_applicationDeactivationReasonAssistant];
    }
  }
  else
  {
    if (+[UIKeyboard usesInputSystemUIForAutoFillOnly])
    {
      int v10 = [(UIKBRTIPartner *)self currentSessionIdentifier];
      int64_t v11 = [(UIKBRTIPartner *)self authenticatingSessionIdentifier];
      char v12 = [v10 isEqual:v11];

      if ((v12 & 1) == 0 && (v6 == 5 || v6 == 0)) {
        [(UIKBRTIPartner *)self forwardInputDestinationEventToUIHost:sel_dismissAutoFillPanel];
      }
    }
    if ((v6 - 1) <= 1) {
      self->_BOOL dontTakeKeyboardSnapshot = 1;
    }
    if (+[UIKeyboard usesInputSystemUI]) {
      int v14 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:withNewReason:", -[UIKBRTIPartner _ignoredReasonsForKeyboard](self, "_ignoredReasonsForKeyboard"), v6);
    }
    else {
      int v14 = 0;
    }
    unsigned int v15 = +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI];
    if (v15) {
      unsigned int v15 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:withNewReason:", -[UIKBRTIPartner _ignoredReasonsForAutoFill](self, "_ignoredReasonsForAutoFill"), v6);
    }
    uint64_t v16 = v14 | v15;
    if ((v6 - 11) > 1)
    {
      if (v6 != 5)
      {
        [(UIKBRTIPartner *)self setApplicationStateIsActiveForRTI:v16];
        [(UIKBRTIPartner *)self _updateRTIAllowedAndNotify:1 withReason:@"Application resigned active"];
      }
    }
    else
    {
      [(UIKBRTIPartner *)self setApplicationStateIsActiveForRTI:v16];
      BOOL dontTakeKeyboardSnapshot = self->_dontTakeKeyboardSnapshot;
      v18 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v19 = [v18 existingContainerRootController];
      v20 = v19;
      if (dontTakeKeyboardSnapshot)
      {
        [v19 clearKeyboardSnapshot];

        v18 = _UIKeyboardLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v21 = 0;
          _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "Keyboard Snapshot is skipped", v21, 2u);
        }
      }
      else
      {
        [v19 takeKeyboardSnapshotIgnoringSpotlightCheck:self->_applicationDeactivationReasonAssistant];
      }
      [(UIKBRTIPartner *)self _updateRTIAllowedAndNotify:0 withReason:@"Application suspended"];
    }
  }
}

- (void)endInputSessionOnSwitchingApps
{
  if ([(UIKBRTIPartner *)self applicationStateIsActiveForRTI])
  {
    [(UIKBRTIPartner *)self setApplicationStateIsActiveForRTI:0];
    [(UIKBRTIPartner *)self _updateRTIAllowedAndNotify:1 withReason:@"Application resigned active"];
  }
}

- (void)_applicationDidRemoveDeactivationReason:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  int v6 = [v5 integerValue];

  if (+[UIKeyboard usesInputSystemUI]) {
    int v7 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:", -[UIKBRTIPartner _ignoredReasonsForKeyboard](self, "_ignoredReasonsForKeyboard"));
  }
  else {
    int v7 = 0;
  }
  int v8 = +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI];
  if (v8) {
    int v8 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:", -[UIKBRTIPartner _ignoredReasonsForAutoFill](self, "_ignoredReasonsForAutoFill"));
  }
  if ((v7 | v8) != 1)
  {
    if ((v6 - 11) < 2) {
      goto LABEL_11;
    }
    if (v6 == 5) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  BOOL v9 = [(UIKBRTIPartner *)self applicationStateIsActiveForRTI];
  if ((v6 - 11) >= 2)
  {
    if (v6 == 5) {
      goto LABEL_19;
    }
    if (v9)
    {
      uint64_t v11 = 1;
LABEL_18:
      [(UIKBRTIPartner *)self setApplicationStateIsActiveForRTI:v11];
      [(UIKBRTIPartner *)self _updateRTIAllowedAndNotify:1 withReason:@"Application became active"];
      goto LABEL_19;
    }
LABEL_17:
    uint64_t v11 = [(id)UIApp _isActivatedIgnoringReason:5];
    goto LABEL_18;
  }
  if (!v9)
  {
LABEL_11:
    uint64_t v10 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:", -[UIKBRTIPartner _ignoredReasonsForKeyboard](self, "_ignoredReasonsForKeyboard"));
    goto LABEL_12;
  }
  uint64_t v10 = 1;
LABEL_12:
  [(UIKBRTIPartner *)self setApplicationStateIsActiveForRTI:v10];
  [(UIKBRTIPartner *)self _updateRTIAllowedAndNotify:0 withReason:@"Application resumed"];
  self->_applicationDeactivationReasonAssistant = 0;
LABEL_19:
  self->_BOOL dontTakeKeyboardSnapshot = 0;
}

- (void)_screenModeDidChange:(id)a3
{
}

- (id)delegate
{
  uint64_t v2 = [(UIKBRTIPartner *)self partnerDelegate];
  uint64_t v3 = [v2 delegate];

  return v3;
}

- (void)documentTraitsChanged
{
  if ([(UIKBRTIPartner *)self _updateRTITraitsIfNecessary])
  {
    uint64_t v3 = [(UIKBRTIPartner *)self rtiClient];
    uint64_t v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    id v5 = [(UIKBRTIPartner *)self rtiDocumentTraits];
    [v3 remoteTextInputSessionWithID:v4 documentTraitsDidChange:v5];

    id v7 = [(UIKBRTIPartner *)self rtiDocumentTraits];
    int v6 = [v7 fenceHandle];
    [v6 invalidate];
  }
}

- (void)updateAnimationForOptions:(id)a3
{
  id v5 = a3;
  uint64_t v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v4 = [v3 nextAnimationStyle];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setOffscreenDirection:", objc_msgSend(v4, "outDirection"));
  }
}

- (void)beginInputSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  [(UIKBRTIPartner *)self _createRTIClientIfNecessary];
  [(UIKBRTIPartner *)self setCurrentSessionIdentifier:v4];
  if (!+[UIKeyboard usingEndInputSessionCompletion])
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = [(UIKBRTIPartner *)self rtiSessionMarkers];
    int v6 = objc_opt_new();
    [v5 setObject:v6 forKey:v4];

    os_unfair_lock_unlock(&self->_lock);
  }
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __50__UIKBRTIPartner_beginInputSessionWithIdentifier___block_invoke;
  v21[3] = &unk_1E52E5E48;
  id v7 = v4;
  v23 = self;
  v24 = &v25;
  id v22 = v7;
  [(UIKBRTIPartner *)self updateStateWithCompletion:v21 updateTraits:0];
  if (+[UIKeyboard usingEndInputSessionCompletion])
  {
    *((unsigned char *)v26 + 24) = v7 != 0;
    if (v7)
    {
      int v8 = [(UIKBRTIPartner *)self rtiDocumentState];

      if (!v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F95EA8]);
        [(UIKBRTIPartner *)self setRtiDocumentState:v9];
      }
    }
    uint64_t v10 = [MEMORY[0x1E4F95EF0] defaultBeginOptions];
    uint64_t v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    char v12 = [v11 visualModeManager];
    uint64_t v13 = [v12 windowingModeEnabled];

    [v10 setEnhancedWindowingModeEnabled:v13];
    int v14 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    unsigned int v15 = [v14 nextAnimationStyle];
    LOBYTE(v13) = [v15 animated];

    if ((v13 & 1) == 0) {
      [v10 setAnimated:0];
    }
    [(UIKBRTIPartner *)self updateAnimationForOptions:v10];
    uint64_t v16 = [(UIKBRTIPartner *)self rtiClient];
    uint64_t v17 = [(UIKBRTIPartner *)self rtiDocumentTraits];
    v18 = [(UIKBRTIPartner *)self rtiDocumentState];
    [v16 beginRemoteTextInputSessionWithID:v7 options:v10 documentTraits:v17 initialDocumentState:v18];

    v19 = [(UIKBRTIPartner *)self rtiDocumentTraits];
    v20 = [v19 fenceHandle];
    [v20 invalidate];

    [(UIKBRTIPartner *)self _updateGeometryObserverIfNecessary];
    [(UIKBRTIPartner *)self _performQueuedSupplementalLexiconOperations];
    [(UIKBRTIPartner *)self updateTextSuggestionsIfNecessary:v7];
  }
  _Block_object_dispose(&v25, 8);
}

void __50__UIKBRTIPartner_beginInputSessionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!+[UIKeyboard usingEndInputSessionCompletion])
  {
    int v8 = [*(id *)(a1 + 40) rtiClient];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F95EF0] defaultBeginOptions];
      uint64_t v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      char v12 = [v11 visualModeManager];
      uint64_t v13 = [v12 windowingModeEnabled];

      [v10 setEnhancedWindowingModeEnabled:v13];
      int v14 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      unsigned int v15 = [v14 nextAnimationStyle];
      LOBYTE(v13) = [v15 animated];

      if ((v13 & 1) == 0) {
        [v10 setAnimated:0];
      }
      [*(id *)(a1 + 40) updateAnimationForOptions:v10];
      uint64_t v16 = [*(id *)(a1 + 40) rtiClient];
      uint64_t v17 = *(void *)(a1 + 32);
      v18 = [*(id *)(a1 + 40) rtiDocumentTraits];
      v19 = [*(id *)(a1 + 40) rtiDocumentState];
      [v16 beginRemoteTextInputSessionWithID:v17 options:v10 documentTraits:v18 initialDocumentState:v19];
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 40) rtiClient];
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v16 = [*(id *)(a1 + 40) rtiDocumentTraits];
      v18 = [*(id *)(a1 + 40) rtiDocumentState];
      [v10 beginRemoteTextInputSessionWithID:v20 documentTraits:v16 initialDocumentState:v18];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
    uint64_t v21 = [*(id *)(a1 + 40) rtiSessionMarkers];
    id v5 = [v21 objectForKey:*(void *)(a1 + 32)];

    id v22 = [*(id *)(a1 + 40) rtiSessionMarkers];
    [v22 removeObjectForKey:*(void *)(a1 + 32)];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
    v23 = [v5 completionHandler];

    if (v23)
    {
      v24 = _UIKeyboardLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = *(void *)(a1 + 32);
        int v32 = 138412290;
        uint64_t v33 = v31;
        _os_log_debug_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEBUG, "Performing deferred end session for: %@", (uint8_t *)&v32, 0xCu);
      }

      uint64_t v25 = [v5 completionHandler];
      v25[2]();
    }
    uint64_t v26 = [*(id *)(a1 + 40) rtiDocumentTraits];
    uint64_t v27 = [v26 fenceHandle];
    [v27 invalidate];

    [*(id *)(a1 + 40) _updateGeometryObserverIfNecessary];
    [*(id *)(a1 + 40) _performQueuedSupplementalLexiconOperations];
    [*(id *)(a1 + 40) updateTextSuggestionsIfNecessary:*(void *)(a1 + 32)];
    goto LABEL_18;
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _UIKeyboardInputSessionChangeLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = *(void *)(a1 + 32);
      int v32 = 138412290;
      uint64_t v33 = v30;
      _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "Got state for session with ID: %@", (uint8_t *)&v32, 0xCu);
    }

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v3 = [*(id *)(a1 + 40) currentSessionIdentifier];
      int v4 = [v3 isEqual:*(void *)(a1 + 32)];

      if (v4)
      {
        id v5 = [*(id *)(a1 + 40) rtiClient];
        int v6 = [*(id *)(a1 + 40) currentSessionIdentifier];
        id v7 = [*(id *)(a1 + 40) rtiDocumentState];
        [v5 remoteTextInputSessionWithID:v6 documentDidChange:v7];

LABEL_18:
        return;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        id v5 = _UIKeyboardInputSessionChangeLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = *(void *)(a1 + 32);
          v29 = [*(id *)(a1 + 40) currentSessionIdentifier];
          int v32 = 138412546;
          uint64_t v33 = v28;
          __int16 v34 = 2112;
          v35 = v29;
          _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "WARNING: Got state for session beginning session with ID: %@, but current session has ID: %@", (uint8_t *)&v32, 0x16u);
        }
        goto LABEL_18;
      }
    }
  }
}

- (void)endInputSessionWithIdentifier:(id)a3
{
}

- (void)endInputSessionWithIdentifier:(id)a3 shouldResign:(BOOL)a4
{
}

- (void)endInputSessionWithIdentifier:(id)a3 shouldResign:(BOOL)a4 waitForReply:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (+[UIKeyboard usesInputSystemUI]) {
    BOOL v9 = !v6;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9 && +[UIDictationController isRunning])
  {
    uint64_t v10 = +[UIDictationController sharedInstance];
    [v10 setShadowState:0];
  }
  if (!v8)
  {
    id v8 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  }
  uint64_t v11 = [MEMORY[0x1E4F95EF0] defaultOptions];
  char v12 = v11;
  if (v11)
  {
    [v11 setShouldResign:v6];
    [(UIKBRTIPartner *)self updateAnimationForOptions:v12];
  }
  if (v5
    && ([(UIKBRTIPartner *)self rtiClient],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = objc_opt_respondsToSelector(),
        v13,
        (v14 & 1) != 0))
  {
    unsigned int v15 = _UIKeyboardInputSessionChangeLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v8;
      _os_log_debug_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEBUG, "Waiting on response from -endRemoteTextInputSessionWithID:%@", buf, 0xCu);
    }

    if (qword_1EB261CD0 != -1) {
      dispatch_once(&qword_1EB261CD0, &__block_literal_global_196_1);
    }
    uint64_t v16 = [(UIKBRTIPartner *)self partnerDelegate];
    uint64_t v17 = [v16 taskQueue];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_3;
    v38[3] = &unk_1E52E3678;
    v38[4] = self;
    id v18 = v8;
    id v39 = v18;
    id v40 = v12;
    [v17 performSingleTask:v38 breadcrumb:_MergedGlobals_1150];

    v19 = _UIKeyboardInputSessionChangeLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v18;
      _os_log_debug_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEBUG, "Done blocking on -endRemoteTextInputSessionWithID:%@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    uint64_t v33 = __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_202;
    __int16 v34 = &unk_1E52DCB30;
    v35 = self;
    id v20 = v8;
    id v36 = v20;
    id v37 = v12;
    uint64_t v21 = (void (**)(void))_Block_copy(&v31);
    os_unfair_lock_lock(&self->_lock);
    id v22 = [(UIKBRTIPartner *)self rtiSessionMarkers];
    v23 = [v22 objectForKey:v20];

    if (v23)
    {
      [v23 setCompletionHandler:v21];
      os_unfair_lock_unlock(&self->_lock);
      v24 = _UIKeyboardLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v20;
        _os_log_debug_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEBUG, "Found an active begin session, deferring end: %@", buf, 0xCu);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v21[2](v21);
    }
  }
  [(UIKBRTIPartner *)self finishCompletionHandlersIfNeeded];
  [(UIKBRTIPartner *)self setCurrentSessionIdentifier:0];
  uint64_t v25 = [(UIKBRTIPartner *)self rtiDocumentTraits];
  int v26 = [v25 devicePasscodeEntry];

  if (v26)
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4FAE2A8]);
    uint64_t v28 = [(UIKBRTIPartner *)self rtiDocumentState];
    [v28 setDocumentState:v27];
  }
  cachedHasPreviousKeyResponder = self->_cachedHasPreviousKeyResponder;
  self->_cachedHasPreviousKeyResponder = 0;

  cachedHasNextKeyResponder = self->_cachedHasNextKeyResponder;
  self->_cachedHasNextKeyResponder = 0;

  [(UIKBRTIPartner *)self _updateGeometryObserverIfNecessary];
  [(UIKBRTIPartner *)self removeTextSuggestionsForSessionWithID:v8];
}

void __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_199 copy];
  uint64_t v1 = (void *)_MergedGlobals_1150;
  _MergedGlobals_1150 = v0;
}

uint64_t __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[UIKeyboardTaskSubqueue subqueueWithExecutionContext:a2];
  [*(id *)(a1 + 32) setKeyboardTaskSubqueue:v3];

  int v4 = [*(id *)(a1 + 32) rtiClient];
  BOOL v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_4;
  v9[3] = &unk_1E52D9F98;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  [v4 endRemoteTextInputSessionWithID:v7 options:v6 completion:v9];
}

uint64_t __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  uint64_t v2 = _UIKeyboardInputSessionChangeLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "Got response from -endRemoteTextInputSessionWithID:%@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 40) keyboardTaskSubqueue];
  [v3 returnExecutionToParentQueue];

  return [*(id *)(a1 + 40) setKeyboardTaskSubqueue:0];
}

void __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_202(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rtiClient];
  [v2 endRemoteTextInputSessionWithID:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

- (BOOL)_remoteInputSystemRequiresDocumentStateForAutofill
{
  uint64_t v3 = [(UIKBRTIPartner *)self rtiDocumentTraits];
  if ([v3 autofillMode])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(UIKBRTIPartner *)self rtiDocumentTraits];
    char v4 = [v5 isExplicitAutoFillMode];
  }
  return v4;
}

- (void)documentStateChanged
{
}

- (void)documentStateChanged:(BOOL)a3
{
  uint64_t v5 = [(UIKBRTIPartner *)self rtiClient];

  if (v5)
  {
    int v6 = +[UIKeyboardImpl activeInstance];
    [v6 updateReturnKey:0];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__UIKBRTIPartner_documentStateChanged___block_invoke;
    v7[3] = &unk_1E52D9FC0;
    v7[4] = self;
    BOOL v8 = a3;
    [(UIKBRTIPartner *)self updateStateWithCompletion:v7 updateTraits:1];
  }
}

void __39__UIKBRTIPartner_documentStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) rtiDocumentState];
  [v3 setOriginatedFromSource:v2];

  if ([*(id *)(a1 + 32) _remoteInputSystemRequiresDocumentStateUpdates])
  {
    char v4 = [*(id *)(a1 + 32) rtiClient];
    uint64_t v5 = [*(id *)(a1 + 32) currentSessionIdentifier];
    int v6 = [*(id *)(a1 + 32) rtiDocumentState];
    [v4 remoteTextInputSessionWithID:v5 documentDidChange:v6];
  }
  id v8 = [*(id *)(a1 + 32) rtiDocumentTraits];
  uint64_t v7 = [v8 fenceHandle];
  [v7 invalidate];
}

- (void)performInputOperation:(id)a3
{
  id v8 = a3;
  char v4 = [(UIKBRTIPartner *)self rtiClient];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [(UIKBRTIPartner *)self rtiClient];
    uint64_t v7 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v6 remoteTextInputSessionWithID:v7 performInputOperation:v8];
  }
}

- (void)forwardKeyboardSuppression:(BOOL)a3 suppressAssistantBar:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
  v14[0] = @"suppressSoftwareKeyboard";
  uint64_t v8 = [NSNumber numberWithBool:v5];
  v14[1] = @"suppressAssistantBar";
  v15[0] = v8;
  BOOL v9 = [NSNumber numberWithBool:v4];
  v15[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v7 setCustomInfo:v10];

  [v7 setCustomInfoType:@"UIUserPencilOperations"];
  uint64_t v11 = [(UIKBRTIPartner *)self rtiClient];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    char v12 = [(UIKBRTIPartner *)self rtiClient];
    uint64_t v13 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v12 remoteTextInputSessionWithID:v13 performInputOperation:v7];
  }
}

- (void)forwardApplicationOperation:(SEL)a3 object:(id)a4
{
  id v13 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
  [v6 setActionSelector:a3];
  [v6 setCustomInfoType:@"UIKBRTICustomInfoTypeApplicationOperations"];
  [v6 setCustomInfo:v13];
  id v7 = [(UIKBRTIPartner *)self rtiClient];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    BOOL v9 = [(UIKBRTIPartner *)self rtiClient];
    id v10 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v9 remoteTextInputSessionWithID:v10 performInputOperation:v6];
  }
  if (sel_setRemoteDisableBecomeFirstResponder_ == a3)
  {
    uint64_t v11 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    if (v11) {
      char v12 = 0;
    }
    else {
      char v12 = v13;
    }
    objc_storeStrong((id *)&self->_pendingDisableBecomeFirstResponderParameters, v12);
  }
}

- (void)forwardKeyboardInputMode:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F95EB8];
  id v5 = a3;
  id v9 = objc_alloc_init(v4);
  [v9 setCustomInfoType:@"UIUserPencilOperations"];
  [v9 setActionSelector:sel_setInputMode_];
  [v9 setCustomInfo:v5];

  id v6 = [(UIKBRTIPartner *)self rtiClient];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(UIKBRTIPartner *)self rtiClient];
    char v8 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v7 remoteTextInputSessionWithID:v8 performInputOperation:v9];
  }
}

- (void)forwardKeyboardEventToUIHost:(id)a3
{
  id v9 = a3;
  if (([v9 keyEventForwardedFromInputUIHost] & 1) == 0)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
    [v4 setCustomInfo:v9];
    [v4 setCustomInfoType:@"UIPhysicalKeyboardEvent"];
    id v5 = [(UIKBRTIPartner *)self rtiClient];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(UIKBRTIPartner *)self rtiClient];
      char v8 = [(UIKBRTIPartner *)self currentSessionIdentifier];
      [v7 remoteTextInputSessionWithID:v8 performInputOperation:v4];
    }
  }
}

- (BOOL)synchronousForwardKeyCommandsBeforePublicToUIHost:(id)a3
{
  id v4 = a3;
  if (([v4 keyEventForwardedFromInputUIHost] & 1) == 0)
  {
    [v4 setKeyCommandHandlingBeforePublic:1];
    id v6 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
    [v6 setCustomInfo:v4];
    [v6 setCustomInfoType:@"UIPhysicalKeyboardEvent"];
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    id v7 = [(UIKBRTIPartner *)self rtiClient];
    if ([v7 isEnvironmentEnabled])
    {
      char v8 = [(UIKBRTIPartner *)self currentSessionIdentifier];
      if (v8)
      {
        id v9 = [(UIKBRTIPartner *)self rtiClient];
        char v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) == 0)
        {
LABEL_12:
          uint64_t v16 = [(UIKBRTIPartner *)self partnerDelegate];
          [v16 setInputModeSwitcherVisibleInRemote:*((unsigned __int8 *)v24 + 24)];

          BOOL v5 = *((unsigned char *)v28 + 24) != 0;
LABEL_13:
          _Block_object_dispose(&v23, 8);
          _Block_object_dispose(&v27, 8);

          goto LABEL_14;
        }
        dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
        char v12 = [(UIKBRTIPartner *)self rtiClient];
        id v13 = [(UIKBRTIPartner *)self currentSessionIdentifier];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __68__UIKBRTIPartner_synchronousForwardKeyCommandsBeforePublicToUIHost___block_invoke;
        v19[3] = &unk_1E52FD900;
        uint64_t v21 = &v27;
        id v22 = &v23;
        id v7 = v11;
        id v20 = v7;
        [v12 remoteTextInputSessionWithID:v13 performInputOperation:v6 withResponse:v19];

        dispatch_time_t v14 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v7, v14))
        {
          unsigned int v15 = _UIKeyboardLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v18 = 0;
            _os_log_error_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Synchronous IPC call to forward key commands timed out", v18, 2u);
          }

          BOOL v5 = 1;
          goto LABEL_13;
        }
      }
    }

    goto LABEL_12;
  }
  BOOL v5 = 0;
LABEL_14:

  return v5;
}

intptr_t __68__UIKBRTIPartner_synchronousForwardKeyCommandsBeforePublicToUIHost___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 & 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (a2 & 0x10) != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)synchronousForwardKeyCommandsToUIHost:(id)a3
{
  id v4 = a3;
  if (([v4 keyEventForwardedFromInputUIHost] & 1) == 0)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
    [v6 setCustomInfo:v4];
    [v6 setCustomInfoType:@"UIWebKitOperations"];
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    id v7 = [(UIKBRTIPartner *)self rtiClient];
    if ([v7 isEnvironmentEnabled])
    {
      char v8 = [(UIKBRTIPartner *)self currentSessionIdentifier];
      if (v8)
      {
        id v9 = [(UIKBRTIPartner *)self rtiClient];
        char v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) == 0)
        {
LABEL_12:
          BOOL v5 = *((unsigned char *)v22 + 24) != 0;
LABEL_13:
          _Block_object_dispose(&v21, 8);

          goto LABEL_14;
        }
        dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
        char v12 = [(UIKBRTIPartner *)self rtiClient];
        id v13 = [(UIKBRTIPartner *)self currentSessionIdentifier];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __56__UIKBRTIPartner_synchronousForwardKeyCommandsToUIHost___block_invoke;
        v18[3] = &unk_1E52FD928;
        id v20 = &v21;
        id v7 = v11;
        v19 = v7;
        [v12 remoteTextInputSessionWithID:v13 performInputOperation:v6 withResponse:v18];

        dispatch_time_t v14 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v7, v14))
        {
          unsigned int v15 = _UIKeyboardLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t v17 = 0;
            _os_log_error_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "synchronousForwardKeyCommandsToUIHost timed out", v17, 2u);
          }

          BOOL v5 = 1;
          goto LABEL_13;
        }
      }
    }

    goto LABEL_12;
  }
  BOOL v5 = 0;
LABEL_14:

  return v5;
}

intptr_t __56__UIKBRTIPartner_synchronousForwardKeyCommandsToUIHost___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 & 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)synchronousForwardKeyInputMethodCommandEventToUIHost:(id)a3 canHandleAppKeyCommand:(BOOL)a4
{
  BOOL v4 = a4;
  v30[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
  v29[0] = @"selector";
  v29[1] = @"keyEvent";
  v30[0] = @"_handleKeyInputMethodCommandForEvent:canHandleAppKeyCommand:";
  v30[1] = v6;
  v29[2] = @"canHandleAppKeyCommand";
  char v8 = [NSNumber numberWithBool:v4];
  v30[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];

  [v7 setCustomInfo:v9];
  [v7 setCustomInfoType:@"UIWebKitOperations"];
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  char v10 = [(UIKBRTIPartner *)self rtiClient];
  if (![v10 isEnvironmentEnabled]) {
    goto LABEL_9;
  }
  dispatch_semaphore_t v11 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  if (!v11) {
    goto LABEL_9;
  }
  char v12 = [(UIKBRTIPartner *)self rtiClient];
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
  {
LABEL_10:
    BOOL v19 = *((unsigned char *)v26 + 24) != 0;
    goto LABEL_11;
  }
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  unsigned int v15 = [(UIKBRTIPartner *)self rtiClient];
  uint64_t v16 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__UIKBRTIPartner_synchronousForwardKeyInputMethodCommandEventToUIHost_canHandleAppKeyCommand___block_invoke;
  v22[3] = &unk_1E52FD928;
  char v24 = &v25;
  char v10 = v14;
  uint64_t v23 = v10;
  [v15 remoteTextInputSessionWithID:v16 performInputOperation:v7 withResponse:v22];

  dispatch_time_t v17 = dispatch_time(0, 2000000000);
  if (!dispatch_semaphore_wait(v10, v17))
  {

LABEL_9:
    goto LABEL_10;
  }
  id v18 = _UIKeyboardLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_error_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "synchronousForwardKeyCommandsToUIHost timed out", v21, 2u);
  }

  BOOL v19 = 1;
LABEL_11:
  _Block_object_dispose(&v25, 8);

  return v19;
}

intptr_t __94__UIKBRTIPartner_synchronousForwardKeyInputMethodCommandEventToUIHost_canHandleAppKeyCommand___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 & 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)forwardDictationEventToUIHost:(SEL)a3 withOptionalObject:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F95EB8];
  id v7 = a4;
  id v11 = objc_alloc_init(v6);
  [v11 setActionSelector:a3];
  [v11 setInputModality:2];
  [v11 setCustomInfo:v7];

  [v11 setCustomInfoType:@"UIDictationRemoteInputOperations"];
  char v8 = [(UIKBRTIPartner *)self rtiClient];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v9 = [(UIKBRTIPartner *)self rtiClient];
    char v10 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v9 remoteTextInputSessionWithID:v10 performInputOperation:v11];
  }
}

- (void)forwardInputDestinationEventToUIHost:(SEL)a3
{
}

- (void)forwardInputDestinationEventToUIHost:(SEL)a3 params:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F95EB8];
  id v7 = a4;
  id v11 = objc_alloc_init(v6);
  [v11 setActionSelector:a3];
  [v11 setCustomInfoType:@"UIUserInteractionRemoteInputOperations"];
  [v11 setCustomInfo:v7];

  char v8 = [(UIKBRTIPartner *)self rtiClient];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v9 = [(UIKBRTIPartner *)self rtiClient];
    char v10 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v9 remoteTextInputSessionWithID:v10 performInputOperation:v11];
  }
}

- (void)forwardSelectorToUIHost:(SEL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
  [v7 setActionSelector:a3];
  char v8 = [(UIKBRTIPartner *)self rtiClient];
  if ([v8 isEnvironmentEnabled]
    && ([(UIKBRTIPartner *)self currentSessionIdentifier],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v10 = (void *)v9;
    id v11 = [(UIKBRTIPartner *)self rtiClient];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      char v13 = [(UIKBRTIPartner *)self rtiClient];
      dispatch_semaphore_t v14 = [(UIKBRTIPartner *)self currentSessionIdentifier];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __60__UIKBRTIPartner_forwardSelectorToUIHost_completionHandler___block_invoke;
      void v15[3] = &unk_1E52FDB30;
      id v16 = v6;
      [v13 remoteTextInputSessionWithID:v14 performInputOperation:v7 withResponse:v15];

      goto LABEL_8;
    }
  }
  else
  {
  }
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
LABEL_8:
}

uint64_t __60__UIKBRTIPartner_forwardSelectorToUIHost_completionHandler___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(result + 16))(result, 1, (a2 >> 2) & 1);
  }
  return result;
}

- (void)forwardKeyboardCameraEvent_startCameraInput:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F95EB8];
  id v5 = a3;
  id v9 = objc_alloc_init(v4);
  [v9 setActionSelector:sel_handleRemoteKeyboardCameraEvent_startCameraInput_];
  [v9 setInputModality:1];
  [v9 setCustomInfo:v5];

  [v9 setCustomInfoType:@"UIKeyboardCameraRemoteInputOperations"];
  id v6 = [(UIKBRTIPartner *)self rtiClient];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(UIKBRTIPartner *)self rtiClient];
    char v8 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v7 remoteTextInputSessionWithID:v8 performInputOperation:v9];
  }
}

- (void)forwardScrollEventToUIHost:(SEL)a3 contentTransform:(CGAffineTransform *)a4 environmentTransform:(CGAffineTransform *)a5
{
  if (sel_textSelectionWillScroll == a3)
  {
    uint64_t v9 = 1;
  }
  else if (sel_textSelectionScrolling == a3)
  {
    uint64_t v9 = 2;
  }
  else if (sel_textSelectionDidScroll == a3)
  {
    uint64_t v9 = 3;
  }
  else
  {
    uint64_t v9 = 0;
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    long long v10 = *(_OWORD *)&a4->c;
    v18[0] = *(_OWORD *)&a4->a;
    v18[1] = v10;
    v18[2] = *(_OWORD *)&a4->tx;
    long long v11 = *(_OWORD *)&a5->c;
    v17[0] = *(_OWORD *)&a5->a;
    v17[1] = v11;
    v17[2] = *(_OWORD *)&a5->tx;
    char v12 = [MEMORY[0x1E4F95EB8] scrollingInputOperationWithType:v9 contentTransform:v18 environmentTransform:v17];
    char v13 = [(UIKBRTIPartner *)self rtiClient];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      unsigned int v15 = [(UIKBRTIPartner *)self rtiClient];
      id v16 = [(UIKBRTIPartner *)self currentSessionIdentifier];
      [v15 remoteTextInputSessionWithID:v16 performInputOperation:v12];
    }
  }
  else
  {
    [(UIKBRTIPartner *)self forwardInputDestinationEventToUIHost:a3];
  }
}

- (void)forwardEventCallbackToRemoteSource_didChooseSupplementalItem:(id)a3 toReplaceText:(id)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    char v8 = (void *)v6[1];
  }
  else {
    char v8 = 0;
  }
  id v9 = v8;
  if (v7)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
    [v10 setCustomInfoType:@"UISupplementalLexiconInputOperations"];
    v18[0] = @"selector";
    long long v11 = NSStringFromSelector(sel_handleEventCallbackFromRemoteDestination_didChooseSupplementalItem_toReplaceText_);
    v19[0] = v11;
    v18[1] = @"supplementalItem";
    char v12 = v9;
    if (!v9)
    {
      char v12 = [MEMORY[0x1E4F1CA98] null];
    }
    v18[2] = @"textToReplace";
    v19[1] = v12;
    v19[2] = v7;
    char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    [v10 setCustomInfo:v13];

    if (!v9) {
    char v14 = [(UIKBRTIPartner *)self rtiClient];
    }
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = [(UIKBRTIPartner *)self rtiClient];
      dispatch_time_t v17 = [(UIKBRTIPartner *)self currentSessionIdentifier];
      [v16 remoteTextInputSessionWithID:v17 performInputOperation:v10];
    }
  }
}

- (void)forwardEventToRemoteSource_canSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  BOOL v3 = a3;
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F95EB8]);
  [v5 setCustomInfoType:@"UISupplementalLexiconInputOperations"];
  v12[0] = @"selector";
  uint64_t v6 = NSStringFromSelector(sel_handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection_);
  v12[1] = @"canSuggest";
  v13[0] = v6;
  id v7 = [NSNumber numberWithBool:v3];
  v13[1] = v7;
  char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v5 setCustomInfo:v8];

  id v9 = [(UIKBRTIPartner *)self rtiClient];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v10 = [(UIKBRTIPartner *)self rtiClient];
    long long v11 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v10 remoteTextInputSessionWithID:v11 performInputOperation:v5];
  }
}

- (id)textOperation_insertSupplementalCandidate:(id)a3 textToCommit:(id)a4
{
  BOOL v4 = 0;
  v16[3] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    id v7 = (objc_class *)MEMORY[0x1E4F95F18];
    id v8 = a4;
    id v9 = a3;
    id v10 = [v7 alloc];
    long long v11 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    BOOL v4 = (void *)[v10 initWithTargetSessionUUID:v11];

    [v4 setCustomInfoType:@"UISupplementalLexiconOperations"];
    v15[0] = @"selector";
    char v12 = NSStringFromSelector(sel_handleEventFromRemoteSource_insertSupplementalCandidate_textToCommit_);
    v16[0] = v12;
    v16[1] = v9;
    v15[1] = @"candidate";
    v15[2] = @"textToCommit";
    v16[2] = v8;
    char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

    [v4 setCustomInfo:v13];
  }
  return v4;
}

- (id)textOperation_chooseSupplementalItem:(id)a3 toReplaceText:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*(void *)(*((void *)&v22 + 1) + 8 * i) + 8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v8, "addObject:", v14, (void)v22);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [v8 count];
  id v16 = 0;
  if (v7 && v15)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F95F18]);
    id v18 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    id v16 = (void *)[v17 initWithTargetSessionUUID:v18];

    [v16 setCustomInfoType:@"UISupplementalLexiconOperations"];
    v26[0] = @"selector";
    BOOL v19 = NSStringFromSelector(sel_handleEventFromRemoteSource_chooseSupplementalItem_toReplaceText_);
    v27[0] = v19;
    v27[1] = v8;
    v26[1] = @"supplementalItems";
    v26[2] = @"textToReplace";
    v27[2] = v7;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    [v16 setCustomInfo:v20];
  }
  return v16;
}

- (id)textOperation_cancelChooseSupplementalItemToInsert
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F95F18]);
  BOOL v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  id v5 = (void *)[v3 initWithTargetSessionUUID:v4];

  [v5 setCustomInfoType:@"UISupplementalLexiconOperations"];
  id v9 = @"selector";
  id v6 = NSStringFromSelector(sel_handleEventFromRemoteSource_cancelChooseSupplementalItemToInsert);
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 setCustomInfo:v7];

  return v5;
}

- (id)textOperation_insertionPointEnteredText:(id)a3 withSupplementalCandidate:(id)a4
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F95F18]);
    id v9 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    uint64_t v10 = (void *)[v8 initWithTargetSessionUUID:v9];

    [v10 setCustomInfoType:@"UISupplementalLexiconOperations"];
    v14[0] = @"selector";
    uint64_t v11 = NSStringFromSelector(sel_handleEventFromRemoteSource_insertionPointEnteredText_withSupplementalCandidate_);
    v15[0] = v11;
    v15[1] = v6;
    v14[1] = @"text";
    void v14[2] = @"candidate";
    v15[2] = v7;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    [v10 setCustomInfo:v12];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)textOperation_insertionPointExitedTextWithSupplementalItems
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F95F18]);
  BOOL v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  id v5 = (void *)[v3 initWithTargetSessionUUID:v4];

  [v5 setCustomInfoType:@"UISupplementalLexiconOperations"];
  id v9 = @"selector";
  id v6 = NSStringFromSelector(sel_handleEventFromRemoteSource_insertionPointExitedTextWithSupplementalItems);
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 setCustomInfo:v7];

  return v5;
}

- (id)textOperation_insertAutofillContent:(id)a3
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (objc_class *)MEMORY[0x1E4F95F18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  id v8 = (void *)[v6 initWithTargetSessionUUID:v7];

  [v8 setCustomInfoType:@"UIKBRTICustomInfoTypeAutofill"];
  v13[0] = @"selector";
  id v9 = NSStringFromSelector(sel_handleEventFromRemoteSource_insertAutofillContent_);
  v13[1] = @"autofillContent";
  v14[0] = v9;
  uint64_t v10 = (void *)[v5 copy];

  v14[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v8 setCustomInfo:v11];

  return v8;
}

- (id)payloadDelegate
{
  uint64_t v2 = [(UIKBRTIPartner *)self partnerDelegate];
  id v3 = [v2 inputSystemSourceSession];

  BOOL v4 = [v3 sessionIndependentPayloadDelegate];

  return v4;
}

- (void)forwardAutofillPayload:(id)a3 toPayloadDelegate:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v10 count];
  if (v6 && v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F95ED8]);
    id v9 = [(UIKBRTIPartner *)self textOperation_insertAutofillContent:v10];
    [v8 setTextOperations:v9];

    [v6 handleTextActionPayload:v8];
  }
}

- (void)forwardKeyboardOperation:(SEL)a3 object:(id)a4
{
  id v9 = a4;
  id v6 = [(UIKBRTIPartner *)self partnerDelegate];
  uint64_t v7 = [v6 inputSystemSourceSession];

  if (v7)
  {
    id v8 = [v7 textOperations];
    [v8 setEditingActionSelector:a3];
    [v8 setCustomInfoType:@"UIKBRTICustomInfoTypeKeyboardOperations"];
    [v8 setCustomInfo:v9];
    [v7 flushOperations];
  }
}

- (void)forwardTypologyLogURL:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(UIKBRTIPartner *)self partnerDelegate];
  id v5 = [v4 inputSystemSourceSession];

  if (v5)
  {
    id v6 = [v5 textOperations];
    [v6 setCustomInfoType:@"UIKBRTICustomInfoTypeTypologyLogOperations"];
    [v6 setCustomInfo:v7];
    [v5 flushOperations];
  }
}

- (void)forwardGrammarCorrectionEntries:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F95EB8];
  id v5 = a3;
  id v9 = objc_alloc_init(v4);
  [v9 setActionSelector:sel_handleGrammarCorrectionEntries_];
  [v9 setCustomInfo:v5];

  [v9 setCustomInfoType:@"UIKBRTICustomInfoTypeGrammarCorrectionOperations"];
  id v6 = [(UIKBRTIPartner *)self rtiClient];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(UIKBRTIPartner *)self rtiClient];
    id v8 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v7 remoteTextInputSessionWithID:v8 performInputOperation:v9];
  }
}

- (void)updateTextSuggestionsIfNecessary:(id)a3
{
  id v11 = a3;
  id v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  if (v4 == v11)
  {
    id v5 = [(UIKBRTIPartner *)self textSuggestions];
    id v6 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    id v7 = [v5 objectForKey:v6];

    if (!v7) {
      goto LABEL_5;
    }
    id v8 = [(UIKBRTIPartner *)self textSuggestions];
    id v9 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    id v10 = [v8 objectForKey:v9];
    [(UIKBRTIPartner *)self textSuggestionsChanged:v10];

    id v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [(UIKBRTIPartner *)self removeTextSuggestionsForSessionWithID:v4];
  }

LABEL_5:
}

- (void)addTextSuggestions:(id)a3
{
  id v9 = a3;
  id v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];

  if (v4)
  {
    id v5 = [(UIKBRTIPartner *)self textSuggestions];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(UIKBRTIPartner *)self setTextSuggestions:v6];
    }
    id v7 = [(UIKBRTIPartner *)self textSuggestions];
    id v8 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v7 setObject:v9 forKey:v8];
  }
}

- (void)removeTextSuggestionsForSessionWithID:(id)a3
{
  id v7 = a3;
  id v4 = [(UIKBRTIPartner *)self textSuggestions];
  id v5 = [v4 objectForKey:v7];

  if (v5)
  {
    id v6 = [(UIKBRTIPartner *)self textSuggestions];
    [v6 removeObjectForKey:v7];
  }
}

- (void)_queueSupplementalLexiconOperation:(unint64_t)a3 lexicon:(id)a4
{
  uint64_t v12 = (id *)a4;
  id v6 = [(UIKBRTIPartner *)self queuedSupplementalLexiconOperations];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(UIKBRTIPartner *)self setQueuedSupplementalLexiconOperations:v7];
  }
  id v8 = v12;
  if (v12)
  {
    if (a3 == 1)
    {
      id v9 = -[_UISupplementalLexiconOperation initRemoveOperationWithLexiconIdentifier:]([_UISupplementalLexiconOperation alloc], "initRemoveOperationWithLexiconIdentifier:", [v12[1] identifier]);
    }
    else
    {
      if (a3) {
        goto LABEL_10;
      }
      id v9 = [[_UISupplementalLexiconOperation alloc] initAddOperationWithLexicon:v12];
    }
    id v10 = v9;
    id v8 = v12;
    if (v10)
    {
      id v11 = [(UIKBRTIPartner *)self queuedSupplementalLexiconOperations];
      [v11 addObject:v10];

      id v8 = v12;
    }
  }
LABEL_10:
}

- (void)_performQueuedSupplementalLexiconOperations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKBRTIPartner *)self queuedSupplementalLexiconOperations];
  [(UIKBRTIPartner *)self setQueuedSupplementalLexiconOperations:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "type", (void)v13);
        if (v10 == 1)
        {
          -[UIKBRTIPartner _didRemoveSupplementalLexiconWithIdentifier:](self, "_didRemoveSupplementalLexiconWithIdentifier:", [v9 lexiconIdentifier]);
        }
        else if (!v10)
        {
          id v11 = [v9 lexicon];
          if (v11)
          {
            uint64_t v12 = [v9 lexicon];
            [(UIKBRTIPartner *)self _didAddSupplementalLexicon:v12];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)didAddSupplementalLexicon:(id)a3
{
  id v5 = a3;
  id v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];

  if (v4) {
    [(UIKBRTIPartner *)self _didAddSupplementalLexicon:v5];
  }
  else {
    [(UIKBRTIPartner *)self _queueSupplementalLexiconOperation:0 lexicon:v5];
  }
}

- (void)didRemoveSupplementalLexicon:(id)a3
{
  uint64_t v7 = a3;
  id v4 = [(UIKBRTIPartner *)self currentSessionIdentifier];

  if (v4)
  {
    id v5 = (void *)v7[1];

    uint64_t v6 = [v5 identifier];
    [(UIKBRTIPartner *)self _didRemoveSupplementalLexiconWithIdentifier:v6];
  }
  else
  {
    [(UIKBRTIPartner *)self _queueSupplementalLexiconOperation:1 lexicon:v7];
  }
}

- (void)_didAddSupplementalLexicon:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F95F08];
  id v5 = *((id *)a3 + 1);
  id v8 = (id)[[v4 alloc] initWithTISupplementalLexicon:v5 iconProvider:&__block_literal_global_292];

  uint64_t v6 = [(UIKBRTIPartner *)self rtiClient];
  uint64_t v7 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  [v6 remoteTextInputSessionWithID:v7 didAddRTISupplementalLexicon:v8];
}

id __45__UIKBRTIPartner__didAddSupplementalLexicon___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = supplementalItem(a2);
  id v3 = v2;
  if (v2 && ([v2 icon], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    id v5 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v6 = [v3 icon];
    uint64_t v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F95F00]);
      id v9 = (void *)[v8 initWithDataType:*MEMORY[0x1E4F95F50] data:v7];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_didRemoveSupplementalLexiconWithIdentifier:(unint64_t)a3
{
  id v6 = [(UIKBRTIPartner *)self rtiClient];
  id v5 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  [v6 remoteTextInputSessionWithID:v5 didRemoveRTISupplementalLexiconWithIdentifier:a3];
}

- (void)_updateRTIAllowedAndNotify:(BOOL)a3 withReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = +[UIScreen mainScreen];
  id v8 = [v7 currentMode];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  BOOL v13 = v12 > 0.0 && v10 > 0.0;
  long long v14 = +[UIWindow _applicationKeyWindow];
  long long v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v17 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v16 = [v17 existingContainerWindow];
  }
  int v18 = [v16 _isHostedInAnotherProcess];
  if (v18) {
    BOOL v19 = [(UIKBRTIPartner *)self viewServiceStateIsActiveForRTI];
  }
  else {
    BOOL v19 = [(UIKBRTIPartner *)self applicationStateIsActiveForRTI];
  }
  uint64_t v20 = v13 & v19;
  if (v4) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 0;
  }
  long long v22 = [(UIKBRTIPartner *)self rtiClient];
  if (![v22 isEnvironmentEnabled] || (v20 & 1) != 0)
  {
  }
  else
  {

    if (v16)
    {
      if (v18) {
        uint64_t v23 = 2;
      }
      else {
        uint64_t v23 = 1;
      }
      +[UIDictationController inputSystemSessionWillEndForReason:v23];
    }
  }
  uint64_t v24 = v21 | v20;
  BOOL v25 = +[UIKeyboard usingEndInputSessionCompletion];
  char v26 = [(UIKBRTIPartner *)self rtiClient];
  uint64_t v27 = v26;
  if (v25)
  {

    if (v27)
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v32 = _UIKeyboardExtendedLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = "Disabled";
          int64_t id = self->_id;
          *(_DWORD *)buf = 136315650;
          if (v20) {
            uint64_t v33 = "Enabled";
          }
          id v39 = v33;
          __int16 v40 = 2112;
          id v41 = v6;
          __int16 v42 = 2048;
          int64_t v43 = id;
          _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_DEFAULT, "RTIPartner setEnvironmentOptions:%s withReason:%@ (id=%ld)", buf, 0x20u);
        }
      }
      char v28 = _UIKeyboardInputSessionChangeLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1853B0000, v28, OS_LOG_TYPE_DEBUG, "Waiting on response from -setEnvironmentOptions:withReason:completion:", buf, 2u);
      }

      if (qword_1EB261CE0 != -1) {
        dispatch_once(&qword_1EB261CE0, &__block_literal_global_301_0);
      }
      uint64_t v29 = [(UIKBRTIPartner *)self partnerDelegate];
      char v30 = [v29 taskQueue];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke_3;
      v35[3] = &unk_1E52E3CD0;
      v35[4] = self;
      uint64_t v37 = v24;
      id v36 = v6;
      [v30 performSingleTask:v35 breadcrumb:qword_1EB261CD8];

      uint64_t v31 = _UIKeyboardInputSessionChangeLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1853B0000, v31, OS_LOG_TYPE_DEBUG, "Done blocking on -setEnvironmentOptions:withReason:completion:", buf, 2u);
      }
    }
  }
  else
  {
    [v26 setEnvironmentOptions:v24 withReason:v6];
  }
}

void __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_303_0 copy];
  uint64_t v1 = (void *)qword_1EB261CD8;
  qword_1EB261CD8 = v0;
}

uint64_t __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = +[UIKeyboardTaskSubqueue subqueueWithExecutionContext:a2];
  [*(id *)(a1 + 32) setKeyboardTaskSubqueue:v3];

  BOOL v4 = [*(id *)(a1 + 32) rtiClient];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke_4;
  v7[3] = &unk_1E52D9F70;
  v7[4] = *(void *)(a1 + 32);
  [v4 setEnvironmentOptions:v5 withReason:v6 completion:v7];
}

uint64_t __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke_4(uint64_t a1)
{
  dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  uint64_t v2 = _UIKeyboardInputSessionChangeLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "Got response from -setEnvironmentOptions:withReason:completion:", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) keyboardTaskSubqueue];
  [v3 returnExecutionToParentQueue];

  return [*(id *)(a1 + 32) setKeyboardTaskSubqueue:0];
}

- (id)_defaultRTIMachNames
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F95F40];
  v5[0] = *MEMORY[0x1E4F95F48];
  v5[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (id)_newInputSystemUIClient
{
  id v2 = objc_alloc(MEMORY[0x1E4F95EE0]);
  id v3 = (void *)[v2 initWithUIHostMachName:*MEMORY[0x1E4F95F38]];
  BOOL v4 = _UIKeyboardLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "creating new systemUI connection", v6, 2u);
  }

  return v3;
}

- (id)_newInputSystemAutoFillUIClient
{
  id v2 = objc_alloc(MEMORY[0x1E4F95EC8]);
  id v3 = (void *)[v2 initWithUIHostMachName:*MEMORY[0x1E4F95F38]];
  BOOL v4 = _UIKeyboardLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "creating new AutofillUI connection", v6, 2u);
  }

  return v3;
}

- (id)_newRTIConnection
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    return [(UIKBRTIPartner *)self _newInputSystemUIClient];
  }
  else if (+[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI])
  {
    return [(UIKBRTIPartner *)self _newInputSystemAutoFillUIClient];
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F95ED0]);
    uint64_t v5 = [(UIKBRTIPartner *)self _defaultRTIMachNames];
    uint64_t v6 = (void *)[v4 initWithMachNames:v5];

    return v6;
  }
}

- (void)_didCreateRTIClient:(id)a3
{
  [a3 setDelegate:self];
  [(UIKBRTIPartner *)self _updateRTIAllowedAndNotify:0 withReason:@"Synchronize with initial Application state"];
}

- (void)_createRTIClient
{
  id v3 = [(UIKBRTIPartner *)self _newRTIConnection];
  [(UIKBRTIPartner *)self setRtiClient:v3];

  id v4 = [(UIKBRTIPartner *)self rtiClient];
  [(UIKBRTIPartner *)self _didCreateRTIClient:v4];
}

- (void)_createRTIClientIfNecessary
{
  id v3 = [(UIKBRTIPartner *)self rtiClient];
  if (v3)
  {
  }
  else if ([(UIKBRTIPartner *)self inputSystemClientEnabled])
  {
    id v4 = _UIKeyboardLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Creating a new RTI client", v5, 2u);
    }

    [(UIKBRTIPartner *)self _createRTIClient];
  }
}

- (void)ensureRTIConnection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = CatalystTextInputLog_UIKit();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(UIKBRTIPartner *)self delegate];
    id v8 = [(UIKBRTIPartner *)self rtiClient];
    int v9 = 138543618;
    double v10 = v7;
    __int16 v11 = 2114;
    double v12 = v8;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "RTI XPCEndpoint available: self.delegate: %{public}@, self.rtiClient: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v4 = [(UIKBRTIPartner *)self rtiClient];
  if (!v4)
  {
    uint64_t v5 = [(UIKBRTIPartner *)self delegate];

    if (!v5) {
      return;
    }
    uint64_t v6 = CatalystTextInputLog_UIKit();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "RTIClient not around when we have a delegate! Attempting to recover...", (uint8_t *)&v9, 2u);
    }

    id v4 = [(UIKBRTIPartner *)self partnerDelegate];
    [v4 resetInputDelegate];
  }
}

- (void)beginAllowingRemoteTextInput:(id)a3
{
  id v4 = a3;
  [(UIKBRTIPartner *)self _createRTIClientIfNecessary];
  uint64_t v5 = [(UIKBRTIPartner *)self rtiClient];
  [v5 beginAllowingRemoteTextInput:v4];

  [(UIKBRTIPartner *)self _updateGeometryObserverIfNecessary];
}

- (void)endAllowingRemoteTextInput:(id)a3
{
}

- (void)endAllowingRemoteTextInput:(id)a3 waitForReply:(BOOL)a4
{
  id v7 = a3;
  uint64_t v5 = [(UIKBRTIPartner *)self rtiClient];

  if (v5)
  {
    uint64_t v6 = [(UIKBRTIPartner *)self rtiClient];
    [v6 endAllowingRemoteTextInput:v7];

    [(UIKBRTIPartner *)self _updateGeometryObserverIfNecessary];
  }
  [(UIKBRTIPartner *)self finishCompletionHandlersIfNeeded];
}

- (void)restartCurrentSession
{
  uint64_t v3 = [(UIKBRTIPartner *)self rtiClient];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(UIKBRTIPartner *)self currentSessionIdentifier];

    if (v5)
    {
      uint64_t v6 = [(UIKBRTIPartner *)self currentSessionIdentifier];
      [(UIKBRTIPartner *)self beginAllowingRemoteTextInput:v6];

      [(UIKBRTIPartner *)self documentStateChanged];
    }
  }
}

- (void)updateStateWithCompletion:(id)a3 updateTraits:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if ([(UIKBRTIPartner *)self _updateRTITraitsIfNecessary] && v4)
  {
    uint64_t v6 = [(UIKBRTIPartner *)self rtiClient];
    id v7 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    id v8 = [(UIKBRTIPartner *)self rtiDocumentTraits];
    [v6 remoteTextInputSessionWithID:v7 documentTraitsDidChange:v8];
  }
  [(UIKBRTIPartner *)self _updateRTIStateWithCompletion:v9];
}

- (BOOL)documentTraitsDisableAutomaticKeyboardUI
{
  id v2 = [(UIKBRTIPartner *)self rtiDocumentTraits];
  char v3 = [v2 disableAutomaticKeyboardUI];

  return v3;
}

- (BOOL)_updateRTITraitsIfNecessary
{
  uint64_t v199 = *MEMORY[0x1E4F143B8];
  char v3 = [(UIKBRTIPartner *)self rtiClient];

  if (!v3)
  {
    LOBYTE(v51) = 0;
    return v51;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F95EB0]);
  uint64_t v5 = [(UIKBRTIPartner *)self partnerDelegate];
  uint64_t v6 = [v5 keyboardState];

  id v7 = [v6 textInputTraits];
  id v8 = (void *)[v7 copy];
  [v4 setTextInputTraits:v8];

  id v9 = [(UIKBRTIPartner *)self partnerDelegate];
  double v10 = [v9 delegateAsResponder];

  if (objc_opt_respondsToSelector())
  {
    __int16 v11 = [v10 textInputContextIdentifier];
    [v4 setTextInputContextIdentifier:v11];
  }
  double v12 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v13 = [v12 textInputModeForResponder:v10];

  if (v13)
  {
    long long v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:0];
    if (v14) {
      [v4 setTextInputModeData:v14];
    }
  }
  v185 = (void *)v13;
  v188 = v10;
  long long v15 = [v10 _additionalTextInputLocales];
  id v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v189 objects:v198 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v190;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v190 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = [*(id *)(*((void *)&v189 + 1) + 8 * i) localeIdentifier];
        [v16 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v189 objects:v198 count:16];
    }
    while (v19);
  }

  if ([v16 count]) {
    [v4 setAdditionalLocaleIdentifiers:v16];
  }
  uint64_t v23 = [v6 recipientIdentifier];
  [v4 setRecipientId:v23];

  uint64_t v24 = [v6 responseContext];
  [v4 setResponseContext:v24];

  BOOL v25 = [v6 inputContextHistory];
  char v26 = (void *)[v25 copy];
  [v4 setInputContextHistory:v26];

  uint64_t v27 = [v6 supportedPayloadIds];
  [v4 setSupportedPayloadIds:v27];

  char v28 = +[UIKeyboardImpl activeInstance];
  uint64_t v29 = [v28 textInputTraits];
  uint64_t v30 = [v29 hidePrediction];

  uint64_t v31 = [(UIKBRTIPartner *)self rtiDocumentTraits];
  int v32 = v30;
  if (v31)
  {
    uint64_t v33 = [(UIKBRTIPartner *)self rtiDocumentTraits];
    int v32 = v30 | [v33 hidePrediction];
  }
  [v4 setHidePrediction:v30];
  __int16 v34 = +[UIKeyboardImpl activeInstance];
  v35 = [v34 textInputTraits];
  uint64_t v36 = [v35 disablePrediction];

  uint64_t v37 = [(UIKBRTIPartner *)self rtiDocumentTraits];
  if (v37)
  {
    v38 = [(UIKBRTIPartner *)self rtiDocumentTraits];
    v32 |= v36 ^ [v38 disablePrediction];
  }
  int v184 = v32;

  [v4 setDisablePrediction:v36];
  id v39 = +[UIKeyboardImpl activeInstance];
  __int16 v40 = [v39 inputDelegate];
  id v41 = [v40 textInputView];
  objc_msgSend(v4, "setShouldReverseLayoutDirection:", objc_msgSend(v41, "_shouldReverseLayoutDirection"));

  objc_msgSend(v4, "setAutofillMode:", objc_msgSend(v6, "autofillMode"));
  objc_msgSend(v4, "setAutofillSubMode:", objc_msgSend(v6, "autofillSubMode"));
  if ([v6 autofillMode] && objc_msgSend(v6, "autofillMode") != 8)
  {
    __int16 v42 = [(UIKBRTIPartner *)self partnerDelegate];
    int64_t v43 = [v42 textContentTypeForCurrentInputDelegate];
    uint64_t v44 = [v4 textInputTraits];
    [v44 setTextContentType:v43];
  }
  v45 = [v6 autofillContext];
  [v4 setAutofillContext:v45];

  uint64_t v46 = +[UIKeyboardImpl activeInstance];
  uint64_t v47 = [v46 _passwordRules];
  [v4 setPasswordRules:v47];

  uint64_t v48 = +[UIKeyboardImpl activeInstance];
  objc_msgSend(v4, "setShouldLoadAutofillSignUp:", objc_msgSend(v48, "shouldLoadAutofillSignUpInputViewController"));

  if ([v6 supplementalLexiconIdentifier])
  {
    uint64_t v49 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "supplementalLexiconIdentifier"));
    v197 = v49;
    uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v197 count:1];
    [v4 setEnabledSupplementalLexiconIdentifiers:v50];
  }
  else
  {
    [v4 setEnabledSupplementalLexiconIdentifiers:0];
  }
  v52 = [(UIKBRTIPartner *)self partnerDelegate];
  objc_msgSend(v4, "setDelegateConformanceType:", objc_msgSend(v52, "delegateConformanceType"));

  v53 = [(UIKBRTIPartner *)self partnerDelegate];
  uint64_t v54 = [v53 inputDelegate];
  char v55 = objc_opt_respondsToSelector();

  if (v55)
  {
    v56 = [(UIKBRTIPartner *)self partnerDelegate];
    v57 = [v56 inputDelegate];
    objc_msgSend(v4, "setDisableAutomaticKeyboardUI:", objc_msgSend(v57, "_disableAutomaticKeyboardUI"));
  }
  uint64_t v58 = [(UIKBRTIPartner *)self rtiClient];
  if (v58)
  {
    v59 = (void *)v58;
    BOOL v60 = +[UIKeyboard usesInputSystemUI];

    if (v60)
    {
      v61 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      uint64_t v62 = [v61 remoteInputViewHost];

      uint64_t v63 = [v62 inputViewInfo];
      uint64_t v64 = [v63 rtiInputViewInfo];
      [v4 setInputViewInfo:v64];

      uint64_t v65 = [v62 assistantViewInfo];
      v66 = [v65 rtiInputViewInfo];
      [v4 setAssistantViewInfo:v66];

      v67 = [(UIKBRTIPartner *)self delegate];
      v68 = [v62 remoteAssistantItemForResponder:v67];
      [v4 setAssistantItem:v68];
    }
  }
  uint64_t v69 = v188;
  uint64_t v70 = [v188 _responderWindow];
  v182 = [v70 windowScene];
  v181 = [v182 _sceneIdentifier];
  objc_msgSend(v4, "setSceneID:");
  objc_msgSend(v4, "setContextID:", objc_msgSend(v70, "_contextId"));
  v183 = v70;
  uint64_t v71 = [v70 layer];
  [v4 setLayerID:CALayerGetRenderId()];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v72 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v73 = [v72 hardwareKeyboardExclusivityIdentifier];
    [v4 setSceneExclusivityIdentifier:v73];
  }
  v74 = [(UIKBRTIPartner *)self partnerDelegate];
  objc_msgSend(v4, "setSupportsImagePaste:", objc_msgSend(v74, "delegateSupportsImagePaste"));

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_47;
    }
    v75 = [(UIKBRTIPartner *)self partnerDelegate];
    if ([v75 canInsertAdaptiveImageGlyph])
    {
      [v4 setSupportsEmojiImageTextAttachments:1];
      goto LABEL_46;
    }
    uint64_t v76 = [(UIKBRTIPartner *)self partnerDelegate];
    objc_msgSend(v4, "setSupportsEmojiImageTextAttachments:", objc_msgSend(v76, "canInsertEmojiImageTextAttachment"));
LABEL_45:

    goto LABEL_46;
  }
  v75 = [(UIKBRTIPartner *)self partnerDelegate];
  if (![v75 canInsertAdaptiveImageGlyph])
  {
    uint64_t v76 = [(UIKBRTIPartner *)self partnerDelegate];
    if ([v76 canInsertEmojiImageTextAttachment])
    {
      [v4 setSupportsAdaptiveImageGlyph:1];
    }
    else
    {
      uint64_t v77 = [(UIKBRTIPartner *)self partnerDelegate];
      objc_msgSend(v4, "setSupportsAdaptiveImageGlyph:", objc_msgSend(v77, "canInsertStickerAsTextInputPayload"));

      uint64_t v69 = v188;
    }
    goto LABEL_45;
  }
  [v4 setSupportsAdaptiveImageGlyph:1];
LABEL_46:

LABEL_47:
  uint64_t v78 = [(UIKBRTIPartner *)self partnerDelegate];
  v79 = [v78 textInputTraits];
  objc_msgSend(v4, "setDevicePasscodeEntry:", objc_msgSend(v79, "isDevicePasscodeEntry"));

  v80 = [(UIKBRTIPartner *)self partnerDelegate];
  v81 = [v80 textInputTraits];
  objc_msgSend(v4, "setDisableInputBars:", objc_msgSend(v81, "disableInputBars"));

  uint64_t v82 = +[UIKeyboardImpl activeInstance];
  uint64_t v83 = [v82 delegateAsResponder];

  v195[0] = 0x1ED125520;
  uint64_t v84 = NSNumber;
  v179 = [(UIKBRTIPartner *)self partnerDelegate];
  v178 = [v179 textInputTraits];
  v177 = objc_msgSend(v84, "numberWithBool:", objc_msgSend(v178, "forceFloatingKeyboard"));
  v196[0] = v177;
  v195[1] = 0x1ED125540;
  uint64_t v85 = NSNumber;
  v176 = [(UIKBRTIPartner *)self partnerDelegate];
  v175 = [v176 textInputTraits];
  v174 = objc_msgSend(v85, "numberWithBool:", objc_msgSend(v175, "forceDisableDictation"));
  v196[1] = v174;
  v195[2] = 0x1ED125560;
  v86 = NSNumber;
  v173 = [(UIKBRTIPartner *)self partnerDelegate];
  v172 = [v173 textInputTraits];
  v171 = objc_msgSend(v86, "numberWithBool:", objc_msgSend(v172, "useAutomaticEndpointing"));
  v196[2] = v171;
  v195[3] = 0x1ED125580;
  v87 = NSNumber;
  v170 = [(UIKBRTIPartner *)self partnerDelegate];
  v169 = [v170 textInputTraits];
  v168 = objc_msgSend(v87, "numberWithBool:", objc_msgSend(v169, "acceptsDictationSearchResults"));
  v196[3] = v168;
  v195[4] = 0x1ED1255A0;
  v88 = NSNumber;
  NSClassFromString(&cfstr_Uisearchtextfi_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v141 = [(UIKBRTIPartner *)self partnerDelegate];
    v140 = [v141 textInputTraits];
    uint64_t v89 = [v140 showDictationButton];
  }
  else
  {
    uint64_t v89 = 0;
  }
  v166 = [v88 numberWithInt:v89];
  v196[4] = v166;
  v195[5] = 0x1ED125600;
  uint64_t v90 = NSNumber;
  v165 = [(UIKBRTIPartner *)self partnerDelegate];
  v164 = [v165 textInputTraits];
  v163 = objc_msgSend(v90, "numberWithBool:", objc_msgSend(v164, "forceEnableDictation"));
  v196[5] = v163;
  v195[6] = 0x1ED1255C0;
  uint64_t v91 = NSNumber;
  v162 = +[UIDictationController activeInstance];
  v161 = objc_msgSend(v91, "numberWithBool:", objc_msgSend(v162, "shouldSuppressSoftwareKeyboard"));
  v196[6] = v161;
  v195[7] = 0x1ED1255E0;
  v92 = NSNumber;
  v160 = +[UIKeyboardCameraSession activeSession];
  v159 = objc_msgSend(v92, "numberWithBool:", objc_msgSend(v160, "shouldSuppressSoftwareKeyboard"));
  v196[7] = v159;
  v195[8] = 0x1ED125620;
  v93 = NSNumber;
  v158 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v157 = objc_msgSend(v93, "numberWithBool:", objc_msgSend(v158, "hasCustomInputViewController"));
  v196[8] = v157;
  v195[9] = 0x1ED125640;
  v94 = NSNumber;
  v156 = +[UIKeyboardImpl activeInstance];
  v155 = objc_msgSend(v94, "numberWithBool:", objc_msgSend(v156, "_shouldSuppressAssistantBar"));
  v196[9] = v155;
  v195[10] = 0x1ED125660;
  uint64_t v95 = NSNumber;
  v154 = +[UIKeyboardImpl activeInstance];
  v153 = objc_msgSend(v95, "numberWithBool:", objc_msgSend(v154, "_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:", 0));
  v196[10] = v153;
  v195[11] = 0x1ED125680;
  if (v69)
  {
    v96 = (objc_class *)objc_opt_class();
    NSStringFromClass(v96);
    v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v97 = &stru_1ED0E84C0;
  }
  v146 = v97;
  v196[11] = v97;
  v195[12] = 0x1ED1256A0;
  cachedHasPreviousKeyResponder = self->_cachedHasPreviousKeyResponder;
  if (cachedHasPreviousKeyResponder)
  {
    BOOL v151 = 0;
    uint64_t v99 = (uint64_t)self->_cachedHasPreviousKeyResponder;
  }
  else
  {
    v100 = NSNumber;
    uint64_t v101 = [v83 _previousKeyResponder];
    BOOL v151 = v101 != 0;
    v139 = (void *)v101;
    if (v101)
    {
      v136 = [v83 _previousKeyResponder];
      BOOL v102 = v136 != v83;
    }
    else
    {
      BOOL v102 = 0;
    }
    uint64_t v99 = [v100 numberWithInt:v102];
  }
  v145 = (void *)v99;
  v196[12] = v99;
  v195[13] = 0x1ED1256C0;
  *(void *)&v150[4] = self->_cachedHasNextKeyResponder;
  if (*(void *)&v150[4])
  {
    *(_DWORD *)v150 = 0;
    uint64_t cachedHasNextKeyResponder = (uint64_t)self->_cachedHasNextKeyResponder;
  }
  else
  {
    uint64_t v104 = NSNumber;
    uint64_t v105 = [v83 _nextKeyResponder];
    *(void *)v150 = v105 != 0;
    v138 = (void *)v105;
    if (v105)
    {
      v135 = [v83 _nextKeyResponder];
      BOOL v106 = v135 != v83;
    }
    else
    {
      BOOL v106 = 0;
    }
    uint64_t cachedHasNextKeyResponder = [v104 numberWithInt:v106];
  }
  v144 = (void *)cachedHasNextKeyResponder;
  v196[13] = cachedHasNextKeyResponder;
  v195[14] = 0x1ED1256E0;
  v107 = NSNumber;
  v149 = [(UIKBRTIPartner *)self partnerDelegate];
  v148 = objc_msgSend(v107, "numberWithBool:", objc_msgSend(v149, "returnKeyEnabled"));
  v196[14] = v148;
  v195[15] = 0x1ED125700;
  v186 = self;
  v187 = v6;
  pendingDisableBecomeFirstResponderParameters = self->_pendingDisableBecomeFirstResponderParameters;
  v180 = v83;
  v152 = cachedHasPreviousKeyResponder;
  if (pendingDisableBecomeFirstResponderParameters)
  {
    BOOL v147 = 0;
    uint64_t v109 = self->_pendingDisableBecomeFirstResponderParameters;
  }
  else
  {
    v193 = @"disabled";
    uint64_t v110 = NSNumber;
    BOOL v147 = +[UIKeyboard inputUIOOP];
    if (v147)
    {
      v143 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v142 = [v143 keyboardArbiterClient];
      uint64_t v111 = [v142 disableBecomeFirstResponder];
    }
    else
    {
      uint64_t v111 = 0;
    }
    v137 = [v110 numberWithInt:v111];
    v194 = v137;
    uint64_t v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
  }
  v196[15] = v109;
  v195[16] = 0x1ED125720;
  v112 = NSNumber;
  v113 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v114 = [v113 existingContainerRootController];
  v115 = objc_msgSend(v112, "numberWithInt:", objc_msgSend(v114, "hiddenCount"));
  v196[16] = v115;
  v195[17] = 0x1ED125740;
  v116 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v187, "wordLearningEnabled"));
  v196[17] = v116;
  uint64_t v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v196 forKeys:v195 count:18];
  [v4 setUserInfo:v117];

  if (!pendingDisableBecomeFirstResponderParameters)
  {
  }
  v118 = v186;
  v119 = v188;
  if (v147)
  {
  }
  if (!*(void *)&v150[4]) {

  }
  if (!*(_DWORD *)v150)
  {
    if (*(void *)&v150[4]) {
      goto LABEL_79;
    }
LABEL_94:

    if (v152) {
      goto LABEL_80;
    }
    goto LABEL_95;
  }

  if (!*(void *)&v150[4]) {
    goto LABEL_94;
  }
LABEL_79:
  if (v152) {
    goto LABEL_80;
  }
LABEL_95:

LABEL_80:
  if (!v151)
  {
    if (v152) {
      goto LABEL_82;
    }
LABEL_97:

    if (!v188) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }

  if (!v152) {
    goto LABEL_97;
  }
LABEL_82:
  if (v188) {
LABEL_83:
  }

LABEL_84:
  if (isKindOfClass)
  {
  }
  v120 = [v4 userInfo];
  uint64_t v121 = [v120 objectForKeyedSubscript:0x1ED1256A0];
  v122 = v186->_cachedHasPreviousKeyResponder;
  v186->_cachedHasPreviousKeyResponder = (NSNumber *)v121;

  v123 = [v4 userInfo];
  uint64_t v124 = [v123 objectForKeyedSubscript:0x1ED1256C0];
  uint64_t v125 = v186->_cachedHasNextKeyResponder;
  v186->_uint64_t cachedHasNextKeyResponder = (NSNumber *)v124;

  v126 = +[UIKeyboardImpl activeInstance];
  uint64_t v127 = [v126 textInputTraits];
  objc_msgSend(v4, "setSingleLineDocument:", objc_msgSend(v127, "isSingleLineDocument"));

  uint64_t v128 = _UIMainBundleIdentifier();
  [v4 setBundleId:v128];

  if (v184 && +[UIKeyboard usesInputSystemUI])
  {
    v129 = [(UIKBRTIPartner *)v186 delegate];
    v130 = [v129 _responderWindow];
    v131 = [v130 windowScene];
    v132 = [v131 _synchronizeDrawingAndReturnFence];
    [v4 setFenceHandle:v132];

    v118 = v186;
    v119 = v188;
  }
  v133 = [(UIKBRTIPartner *)v118 rtiDocumentTraits];
  int v51 = [v4 isEqual:v133] ^ 1 | v184;

  if (v51 == 1) {
    [(UIKBRTIPartner *)v118 setRtiDocumentTraits:v4];
  }

  return v51;
}

- (id)inputDelegate
{
  id v2 = [(UIKBRTIPartner *)self partnerDelegate];
  char v3 = [v2 inputDelegate];

  return v3;
}

- (id)inputDelegateView
{
  id v2 = [(UIKBRTIPartner *)self partnerDelegate];
  char v3 = [v2 inputDelegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 textInputView];
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)_updateRTIStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIKBRTIPartner *)self rtiClient];
  id v6 = [v5 defaultDocumentRequest];

  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F95EA0]);
    [v6 setTextGranularity:2];
    [v6 setRectGranularity:1];
    if (qword_1EB261D40 != -1) {
      dispatch_once(&qword_1EB261D40, &__block_literal_global_1092_0);
    }
    [v6 setSurroundingGranularityCount:qword_1EB261D38];
    if (qword_1EB261D50 != -1) {
      dispatch_once(&qword_1EB261D50, &__block_literal_global_1107_0);
    }
    [v6 setRectCountBefore:qword_1EB261D48];
    if (qword_1EB261D60 != -1) {
      dispatch_once(&qword_1EB261D60, &__block_literal_global_1117_0);
    }
    [v6 setRectCountAfter:qword_1EB261D58];
    [v6 setFlags:49];
    if (+[UIKeyboard inputUIOOP]) {
      objc_msgSend(v6, "setFlags:", objc_msgSend(v6, "flags") | 4);
    }
  }
  id v7 = [(UIKBRTIPartner *)self partnerDelegate];
  id v8 = [v7 delegateAsResponder];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__UIKBRTIPartner__updateRTIStateWithCompletion___block_invoke;
  v11[3] = &unk_1E52FD970;
  id v12 = v8;
  uint64_t v13 = self;
  id v14 = v4;
  id v9 = v4;
  id v10 = v8;
  [(UIKBRTIPartner *)self _queryDocumentRequest:v6 completion:v11];
}

void __48__UIKBRTIPartner__updateRTIStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) partnerDelegate];
  id v6 = [v5 delegateAsResponder];

  if (v4 == v6)
  {
    [*(id *)(a1 + 40) setRtiDocumentState:v3];
    id v8 = [v3 documentState];
    id v9 = [v8 contextBeforeInput];
    [v9 hasSuffix:@"\n"];

    id v10 = [*(id *)(a1 + 40) rtiDocumentState];
    [v10 setDocumentState:v8];

    __int16 v11 = [*(id *)(a1 + 40) partnerDelegate];
    uint64_t v12 = [v11 canSuggestSupplementalItemsForCurrentSelection];
    uint64_t v13 = [*(id *)(a1 + 40) rtiDocumentState];
    [v13 setCanSuggestSupplementalItemsForCurrentSelection:v12];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = _UIKeyboardInputSessionChangeLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v14 = 0;
      _os_log_debug_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEBUG, "Got document state but inputDelegate changed in meantime (not an error)", v14, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_addCharacterRectsToDocumentState:(id)a3 textRange:(id)a4 offset:(int64_t)a5
{
  id v64 = a3;
  id v8 = a4;
  id v9 = [(UIKBRTIPartner *)self inputDelegate];
  id v10 = [v9 selectionRectsForRange:v8];

  __int16 v11 = [v10 lastObject];
  unsigned int v63 = [v11 isVertical];

  if (v8)
  {
    if ([v8 isEmpty])
    {
      if (![v8 isEmpty]) {
        goto LABEL_15;
      }
      uint64_t v12 = [(UIKBRTIPartner *)self inputDelegate];
      uint64_t v13 = [v12 textInputView];

      id v14 = [(UIKBRTIPartner *)self inputDelegate];
      long long v15 = [v8 start];
      [v14 caretRectForPosition:v15];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;

      uint64_t v24 = [v13 window];
      objc_msgSend(v13, "convertRect:toView:", v24, v17, v19, v21, v23);
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;

      objc_msgSend(v64, "addTextRect:forCharacterRange:granularity:isVertical:", a5, 0, 0, v63, v26, v28, v30, v32);
    }
    else
    {
      uint64_t v33 = [(UIKBRTIPartner *)self partnerDelegate];
      uint64_t v13 = [v33 inputDelegate];

      __int16 v34 = [v13 textInputView];
      v35 = [(UIKBRTIPartner *)self inputDelegate];
      uint64_t v36 = [v8 start];
      uint64_t v37 = [v8 end];
      uint64_t v38 = [v35 offsetFromPosition:v36 toPosition:v37];

      id v39 = [v8 start];
      if (v38 >= 1)
      {
        uint64_t v62 = v10;
        id v40 = 0;
        while (1)
        {
          id v41 = [v13 positionFromPosition:v39 offset:1];

          if (!v41) {
            break;
          }
          uint64_t v42 = [v13 textRangeFromPosition:v39 toPosition:v41];
          if (!v42) {
            break;
          }
          int64_t v43 = (void *)v42;
          uint64_t v44 = [(UIKBRTIPartner *)self inputDelegate];
          [v44 firstRectForRange:v43];
          double v46 = v45;
          double v48 = v47;
          double v50 = v49;
          double v52 = v51;

          v53 = [v34 window];
          objc_msgSend(v34, "convertRect:toView:", v53, v46, v48, v50, v52);
          double v55 = v54;
          double v57 = v56;
          double v59 = v58;
          double v61 = v60;

          objc_msgSend(v64, "addTextRect:forCharacterRange:granularity:isVertical:", a5, 1, 0, v63, v55, v57, v59, v61);
          id v40 = v41;

          ++a5;
          id v39 = v40;
          if (!--v38) {
            goto LABEL_12;
          }
        }
        id v40 = v39;
LABEL_12:

        id v39 = v40;
        id v10 = v62;
      }
    }
  }
LABEL_15:
}

- (void)_addTextCheckingAnnotatedStringToDocumentState:(id)a3
{
  id v25 = a3;
  [v25 setTextCheckingAnnotatedString:0];
  id v4 = [(UIKBRTIPartner *)self inputDelegate];
  char v5 = objc_opt_respondsToSelector();

  id v6 = v25;
  if (v5)
  {
    id v7 = [(UIKBRTIPartner *)self partnerDelegate];
    id v8 = [v7 inputDelegate];

    id v9 = [v8 markedTextRange];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v8 selectedTextRange];
    }
    uint64_t v12 = v11;

    uint64_t v13 = [v25 documentState];
    id v14 = [v13 contextBeforeInput];

    long long v15 = [v25 documentState];
    double v16 = [v15 contextAfterInput];

    if (v12)
    {
      double v17 = [v12 start];
      double v18 = objc_msgSend(v8, "positionFromPosition:offset:", v17, -objc_msgSend(v14, "length"));

      double v19 = [v12 end];
      double v20 = objc_msgSend(v8, "positionFromPosition:offset:", v19, objc_msgSend(v16, "length"));

      if (v18)
      {
        if (v20)
        {
          uint64_t v21 = [v8 textRangeFromPosition:v18 toPosition:v20];
          if (v21)
          {
            double v22 = (void *)v21;
            double v23 = [(UIKBRTIPartner *)self inputDelegate];
            uint64_t v24 = [v23 annotatedSubstringForRange:v22];
            [v25 setTextCheckingAnnotatedString:v24];
          }
        }
      }
    }
    id v6 = v25;
  }
}

- (void)applyRemoteDocumentTraitsIfNecessary:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    id v7 = [(UIKBRTIPartner *)self partnerDelegate];
    id v6 = [v7 inputSystemSourceSession];

    if (!v6) {
      return;
    }
  }
  BOOL v185 = v4;
  id v8 = [(UIKBRTIPartner *)self partnerDelegate];
  id v9 = [v8 keyboardState];

  id v10 = [(UIKBRTIPartner *)self partnerDelegate];
  id v11 = [v10 textInputTraits];

  uint64_t v12 = (void *)[v11 copy];
  remoteDocumentTraits = self->_remoteDocumentTraits;
  id v14 = [v6 documentTraits];

  v187 = v9;
  if (remoteDocumentTraits == v14)
  {
    BOOL v178 = 0;
    int v188 = 0;
  }
  else
  {
    v183 = v12;
    long long v15 = v11;
    double v16 = [v6 documentTraits];
    double v17 = [v16 inputViewInfo];
    double v18 = [(RTIDocumentTraits *)self->_remoteDocumentTraits inputViewInfo];
    if (v17 == v18)
    {
      int v188 = 0;
    }
    else
    {
      double v19 = [v6 documentTraits];
      double v20 = [v19 inputViewInfo];
      uint64_t v21 = [(RTIDocumentTraits *)self->_remoteDocumentTraits inputViewInfo];
      int v188 = [v20 isEqual:v21] ^ 1;
    }
    double v22 = [v6 documentTraits];
    double v23 = [v22 textInputModeData];
    if (v23)
    {
      uint64_t v24 = [(RTIDocumentTraits *)self->_remoteDocumentTraits textInputModeData];
      if (v24)
      {
        id v25 = [v6 documentTraits];
        double v26 = [v25 textInputModeData];
        double v27 = [(RTIDocumentTraits *)self->_remoteDocumentTraits textInputModeData];
        v188 |= [v26 isEqualToData:v27] ^ 1;
      }
      id v11 = v15;

      id v9 = v187;
    }
    else
    {
      id v9 = v187;
      id v11 = v15;
    }
    uint64_t v12 = v183;

    uint64_t v28 = [(RTIDocumentTraits *)self->_remoteDocumentTraits autofillMode];
    double v29 = [v6 documentTraits];
    BOOL v178 = v28 != [v29 autofillMode];

    double v30 = self->_remoteDocumentTraits;
    double v31 = [v6 documentTraits];
    [(RTIDocumentTraits *)v30 isEqual:v31];

    double v32 = [v6 documentTraits];
    uint64_t v33 = self->_remoteDocumentTraits;
    self->_remoteDocumentTraits = v32;
  }
  uint64_t v34 = [v11 keyboardAppearance];
  uint64_t v180 = [v11 keyboardType];
  uint64_t v179 = [v11 returnKeyType];
  v35 = [v6 documentTraits];

  uint64_t v36 = &off_1E52D3000;
  if (v35)
  {
    uint64_t v37 = [v6 documentTraits];
    uint64_t v38 = [v37 textInputTraits];
    [v12 overlayWithTITextInputTraits:v38];

    id v39 = [v6 documentTraits];
    id v40 = [v39 PINEntrySeparatorIndexes];
    [v12 setPINEntrySeparatorIndexes:v40];

    id v41 = [v6 documentTraits];
    uint64_t v42 = [v41 validTextRange];
    objc_msgSend(v12, "setValidTextRange:", v42, v43);

    uint64_t v44 = [v6 documentTraits];
    double v45 = [v44 recipientId];
    [v12 setAutocorrectionContext:v45];

    double v46 = [v6 documentTraits];
    double v47 = [v46 recipientId];
    [v9 setRecipientIdentifier:v47];

    double v48 = [v6 documentTraits];
    double v49 = [v48 responseContext];
    [v12 setResponseContext:v49];

    double v50 = [v6 documentTraits];
    double v51 = [v50 responseContext];
    [v9 setResponseContext:v51];

    double v52 = [UIInputContextHistory alloc];
    v53 = [v6 documentTraits];
    double v54 = [v53 inputContextHistory];
    double v55 = [(UIInputContextHistory *)v52 initWithInputContextHistory:v54];
    [v12 setInputContextHistory:v55];

    double v56 = [v6 documentTraits];
    double v57 = [v56 inputContextHistory];
    double v58 = (void *)[v57 copy];
    [v9 setInputContextHistory:v58];

    double v59 = [v6 documentTraits];
    double v60 = [v59 supportedPayloadIds];
    [v9 setSupportedPayloadIds:v60];

    double v61 = [v6 documentTraits];
    objc_msgSend(v12, "setDevicePasscodeEntry:", objc_msgSend(v61, "devicePasscodeEntry"));

    uint64_t v62 = [v6 documentTraits];
    objc_msgSend(v12, "setDisableInputBars:", objc_msgSend(v62, "disableInputBars"));

    unsigned int v63 = [v6 documentTraits];
    objc_msgSend(v12, "setDisablePrediction:", objc_msgSend(v63, "disablePrediction"));

    if (+[UIKeyboard isKeyboardProcess])
    {
      uint64_t v64 = [v6 documentTraits];
      objc_msgSend(v12, "setHidePrediction:", objc_msgSend((id)v64, "hidePrediction"));

      LODWORD(v64) = [v11 hidePrediction];
      uint64_t v65 = [v6 documentTraits];
      int v66 = v64 ^ [v65 hidePrediction];

      int v67 = v188 & ~v66;
      uint64_t v36 = &off_1E52D3000;
      int v188 = v67;
      v68 = [v6 documentTraits];
      objc_msgSend(v12, "setDisablePrediction:", objc_msgSend(v68, "disablePrediction"));
    }
    uint64_t v69 = [v6 documentTraits];
    uint64_t v70 = [v69 fenceHandle];
    BOOL v181 = v70 != 0;
  }
  else
  {
    BOOL v181 = 0;
  }
  if (([v36[479] isInputSystemUI] & 1) == 0) {
    [v12 setKeyboardAppearance:v34];
  }
  uint64_t v71 = [v6 documentTraits];
  objc_msgSend(v9, "setAutofillMode:", objc_msgSend(v71, "autofillMode"));

  uint64_t v72 = [v6 documentTraits];
  objc_msgSend(v9, "setAutofillSubMode:", objc_msgSend(v72, "autofillSubMode"));

  v73 = [v6 documentTraits];
  v74 = [v73 enabledSupplementalLexiconIdentifiers];

  v186 = v11;
  int v184 = v74;
  if ([v74 count])
  {
    v75 = [v74 firstObject];
    objc_msgSend(v9, "setSupplementalLexiconIdentifier:", objc_msgSend(v75, "unsignedLongLongValue"));
  }
  else
  {
    [v9 setSupplementalLexiconIdentifier:0];
  }
  uint64_t v76 = [v6 documentTraits];
  uint64_t v77 = [v76 autofillContext];
  uint64_t v78 = (void *)[v77 mutableCopy];

  if (!v78)
  {
    v79 = [v6 documentTraits];
    char v80 = [v79 shouldLoadAutofillSignUp];

    if (v80)
    {
      uint64_t v78 = 0;
    }
    else
    {
      uint64_t v78 = [MEMORY[0x1E4F1CA60] dictionary];
    }
  }
  v81 = [v6 documentTraits];
  uint64_t v82 = [v81 appId];

  if (v82)
  {
    uint64_t v83 = [v6 documentTraits];
    uint64_t v84 = [v83 appId];

    [v78 setObject:v84 forKey:@"_AppId"];
    if ([v36[479] isKeyboardProcess]) {
      [v9 setClientIdentifier:v84];
    }
  }
  uint64_t v85 = [v6 documentTraits];
  v86 = [v85 bundleId];

  if (v86)
  {
    v87 = [v6 documentTraits];
    v88 = [v87 bundleId];

    [v78 setObject:v88 forKey:@"_BundleId"];
  }
  uint64_t v89 = [v6 documentTraits];
  uint64_t v90 = [v89 associatedDomains];

  if (v90) {
    [v78 setObject:v90 forKey:@"_AssociatedDomains"];
  }
  v182 = (void *)v90;
  [v9 setAutofillContext:v78];
  uint64_t v91 = [(UIKBRTIPartner *)self currentSessionIdentifier];

  if (v91)
  {
    v92 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    [v9 setDocumentIdentifier:v92];
  }
  v93 = [v6 documentTraits];
  v94 = [v93 userInfo];

  uint64_t v95 = off_1E52D4000;
  if (v94)
  {
    v96 = [v94 objectForKeyedSubscript:0x1ED125520];
    objc_msgSend(v12, "setForceFloatingKeyboard:", objc_msgSend(v96, "BOOLValue"));

    v97 = [v94 objectForKeyedSubscript:0x1ED125540];
    objc_msgSend(v12, "setForceDisableDictation:", objc_msgSend(v97, "BOOLValue"));

    v98 = [v94 objectForKeyedSubscript:0x1ED125560];
    objc_msgSend(v12, "setUseAutomaticEndpointing:", objc_msgSend(v98, "BOOLValue"));

    uint64_t v99 = [v94 objectForKeyedSubscript:0x1ED125580];
    objc_msgSend(v12, "setAcceptsDictationSearchResults:", objc_msgSend(v99, "BOOLValue"));

    v100 = [v94 objectForKeyedSubscript:0x1ED125600];
    objc_msgSend(v12, "setForceEnableDictation:", objc_msgSend(v100, "BOOLValue"));

    uint64_t v101 = +[UIKeyboardImpl activeInstance];
    int v102 = [v101 isSettingDelegate];

    if (v102)
    {
      uint64_t v103 = [v94 objectForKeyedSubscript:0x1ED1255C0];
      int v104 = [v103 BOOLValue];

      if (v104)
      {
        uint64_t v105 = +[UIDictationController sharedInstance];
        BOOL v106 = v105;
        uint64_t v107 = 1;
      }
      else
      {
        uint64_t v105 = +[UIDictationController activeInstance];
        BOOL v106 = v105;
        uint64_t v107 = 0;
      }
      [v105 setShouldSuppressSoftwareKeyboard:v107];
    }
    uint64_t v108 = [v94 objectForKeyedSubscript:0x1ED125680];
    uint64_t v109 = +[UIDictationController sharedInstance];
    objc_msgSend(v109, "set_inputDelegateClassName:", v108);

    uint64_t v110 = [v94 objectForKeyedSubscript:0x1ED1255A0];
    uint64_t v111 = [v110 BOOLValue];
    v112 = +[UIDictationController sharedInstance];
    objc_msgSend(v112, "set_shouldUseDictationSearchFieldBehavior:", v111);

    v113 = +[UIKeyboardImpl activeInstance];
    LODWORD(v111) = [v113 isSettingDelegate];

    if (v111)
    {
      v114 = [v94 objectForKeyedSubscript:0x1ED1255E0];
      int v115 = [v114 BOOLValue];

      if (v115)
      {
        v116 = +[UIKeyboardCameraSession sharedSession];
        uint64_t v117 = v116;
        uint64_t v118 = 1;
      }
      else
      {
        v116 = +[UIKeyboardCameraSession activeSession];
        uint64_t v117 = v116;
        uint64_t v118 = 0;
      }
      [v116 setShouldSuppressSoftwareKeyboard:v118];
    }
    v119 = [v94 objectForKeyedSubscript:0x1ED125620];
    uint64_t v120 = [v119 BOOLValue];
    uint64_t v121 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v121 setHasCustomInputViewController:v120];

    v122 = +[UIKeyboardImpl activeInstance];
    v123 = [v94 objectForKeyedSubscript:0x1ED125640];
    objc_msgSend(v122, "_setShouldSuppressAssistantBar:", objc_msgSend(v123, "BOOLValue"));

    uint64_t v124 = +[UIKeyboardImpl activeInstance];
    uint64_t v125 = [v94 objectForKeyedSubscript:0x1ED125660];
    objc_msgSend(v124, "_setShouldSuppressSoftwareKeyboard:", objc_msgSend(v125, "BOOLValue"));

    v126 = +[UIKeyboardImpl activeInstance];
    [v126 _suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:0];

    uint64_t v127 = [v94 objectForKeyedSubscript:0x1ED1256A0];
    uint64_t v128 = [v127 BOOLValue];
    v129 = +[UIKeyboardImpl activeInstance];
    [v129 setHasPreviousKeyResponder:v128];

    v130 = [v94 objectForKeyedSubscript:0x1ED1256C0];
    uint64_t v131 = [v130 BOOLValue];
    v132 = +[UIKeyboardImpl activeInstance];
    [v132 setHasNextKeyResponder:v131];

    v133 = +[UIKeyboardImpl activeInstance];
    v134 = [v94 objectForKeyedSubscript:0x1ED1256E0];
    objc_msgSend(v133, "setReturnKeyEnabled:", objc_msgSend(v134, "BOOLValue"));

    v135 = +[UIKeyboardImpl activeInstance];
    v136 = [v94 objectForKeyedSubscript:0x1ED125740];
    objc_msgSend(v135, "setCorrectionLearningAllowed:", objc_msgSend(v136, "BOOLValue"));

    v137 = [v94 objectForKeyedSubscript:0x1ED125700];
    v138 = v137;
    if (!v137) {
      goto LABEL_57;
    }
    v139 = [v137 objectForKeyedSubscript:@"disabled"];

    if (!v139) {
      goto LABEL_57;
    }
    v140 = [v138 objectForKeyedSubscript:@"disabled"];
    uint64_t v141 = [v140 BOOLValue];

    v142 = [v138 objectForKeyedSubscript:@"forSuppressionAssertion"];
    int v143 = [v142 BOOLValue];

    v144 = [v138 objectForKeyedSubscript:@"updatePlacement"];
    uint64_t v145 = [v144 BOOLValue];

    if (v143)
    {
      v146 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      [v146 setDisableBecomeFirstResponder:v141 forSuppressionAssertion:1 updatePlacement:v145];
    }
    else
    {
      if (!+[UIKeyboard inputUIOOP]) {
        goto LABEL_57;
      }
      BOOL v147 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v148 = [v147 keyboardArbiterClient];
      int v149 = [v148 disableBecomeFirstResponder];

      if (v141 == v149) {
        goto LABEL_57;
      }
      v146 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      [v146 setDisableBecomeFirstResponder:v141 forSuppressionAssertion:0];
    }

LABEL_57:
    v150 = [v94 objectForKeyedSubscript:0x1ED125720];
    uint64_t v151 = [v150 BOOLValue];
    v152 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v153 = [v152 existingContainerRootController];
    [v153 setHiddenCount:v151];

    id v9 = v187;
    uint64_t v95 = off_1E52D4000;
  }
  v154 = +[UIKeyboardImpl activeInstance];
  int v155 = [v154 showingEmojiSearch];

  v156 = [(UIKBRTIPartner *)self partnerDelegate];
  v157 = v156;
  if (v155)
  {
    v195[0] = MEMORY[0x1E4F143A8];
    v195[1] = 3221225472;
    v195[2] = __61__UIKBRTIPartner_applyRemoteDocumentTraitsIfNecessary_force___block_invoke;
    v195[3] = &unk_1E52FD998;
    id v196 = v12;
    uint64_t v197 = v179;
    uint64_t v198 = v180;
    [v157 modifyTextInputTraits:v195 forceSync:v185];
  }
  else
  {
    [v156 updateInputDelegateForRemoteTraitChange:v12 forceSync:v185];
  }
  if (+[UIKeyboard isInputSystemUI])
  {
    v158 = [v6 documentTraits];
    v159 = [v158 assistantItem];
    [(UIKBRTIPartner *)self applyAssistantItem:v159];

    v160 = [v6 documentTraits];
    v161 = [v160 assistantViewInfo];
    v162 = [v6 documentTraits];
    v163 = objc_msgSend(v161, "uiRemoteInputViewInfoForProcessId:", objc_msgSend(v162, "processId"));

    uint64_t v95 = off_1E52D4000;
    v164 = [(UIKBRTIPartner *)self partnerDelegate];
    [v164 updateAssistantViewInfo:v163];

    char v165 = v188;
    BOOL v166 = v181;
    if ((v188 | v181) == 1)
    {
      if (v181)
      {
        v167 = [v6 documentTraits];
        v168 = [v167 fenceHandle];
        int v169 = [v168 isUsable];

        if (v169)
        {
          v170 = [v6 documentTraits];
          v171 = [v170 fenceHandle];
          v172 = (void *)[v171 copy];
        }
        else
        {
          v172 = 0;
        }
        char v165 = v188;
        BOOL v166 = v181;
        uint64_t v95 = off_1E52D4000;
      }
      else
      {
        v172 = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__UIKBRTIPartner_applyRemoteDocumentTraitsIfNecessary_force___block_invoke_2;
      block[3] = &unk_1E52DAD98;
      BOOL v193 = v166;
      id v190 = v172;
      long long v191 = self;
      id v192 = v6;
      char v194 = v165;
      id v173 = v172;
      dispatch_async(MEMORY[0x1E4F14428], block);

      id v9 = v187;
    }
    v174 = [(UIKBRTIPartner *)self partnerDelegate];
    v175 = [v6 documentTraits];
    objc_msgSend(v174, "setRemoteDelegateSupportsImagePaste:", objc_msgSend(v175, "supportsImagePaste"));

    v176 = [(__objc2_class *)v95[12] activeInstance];
    [v176 _updateDelegateRequiresKeyEventsFromRemoteTextInput];
  }
  if (!+[UIKeyboard useAutoFillUIRTIInterfaceForIphone]
    && +[UIKeyboard supportsAutoFillPanel]
    && v178)
  {
    v177 = [(__objc2_class *)v95[12] activeInstance];
    [v177 displayAutoFillPopoverIfAutoFillModeDetected];
  }
}

void __61__UIKBRTIPartner_applyRemoteDocumentTraitsIfNecessary_force___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  objc_msgSend(v4, "setKeyboardAppearance:", objc_msgSend(v3, "keyboardAppearance"));
  [v4 setReturnKeyType:a1[5]];
  [v4 setKeyboardType:a1[6]];
}

void __61__UIKBRTIPartner_applyRemoteDocumentTraitsIfNecessary_force___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    if ([*(id *)(a1 + 32) isUsable])
    {
      id v2 = [*(id *)(a1 + 40) delegate];
      id v3 = [v2 _responderWindow];
      id v4 = [v3 windowScene];
      [v4 _synchronizeDrawingUsingFence:*(void *)(a1 + 32)];
    }
    [*(id *)(a1 + 32) invalidate];
    char v5 = [*(id *)(a1 + 48) documentTraits];
    id v6 = [v5 fenceHandle];
    [v6 invalidate];
  }
  if (*(unsigned char *)(a1 + 57))
  {
    id v7 = [*(id *)(a1 + 40) delegate];
    [v7 reloadInputViews];
  }
  else
  {
    id v7 = +[UIKeyboardImpl activeInstance];
    [v7 updateAssistantView];
  }
}

- (void)applyAssistantItem:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKBRTIPartner *)self partnerDelegate];
  [v5 applyAssistantItem:v4];
}

- (void)applyRemoteDocumentStateIfNecessary:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    id v7 = [(UIKBRTIPartner *)self partnerDelegate];
    id v24 = [v7 inputSystemSourceSession];

    id v6 = v24;
  }
  id v25 = v6;
  id v8 = [v6 documentState];
  int v9 = [v8 originatedFromSource];

  id v10 = v25;
  if (v25)
  {
    id v11 = [v25 documentState];
    uint64_t v12 = [v11 documentState];

    id v10 = v25;
    if (v12)
    {
      uint64_t v13 = [v25 documentState];
      id v14 = [v13 documentState];
      long long v15 = [v25 documentState];
      uint64_t v16 = [v15 selectedTextRange];
      uint64_t v18 = v17;

      uint64_t v19 = [v13 hasText];
      self->_isNotifyingDelegateOfRemoteOutputOperation = 1;
      if (v9)
      {
        double v20 = [(UIKBRTIPartner *)self partnerDelegate];
        objc_msgSend(v20, "updateForExpectedRemoteDocumentStateChange:selectedTextRange:forceSync:", v14, v16, v18, v4);
      }
      else
      {
        uint64_t v21 = v19;
        uint64_t v22 = [v13 canSuggestSupplementalItemsForCurrentSelection];
        double v23 = [(UIKBRTIPartner *)self partnerDelegate];
        [v23 setCanSuggestSupplementalItemsForCurrentSelection:v22];

        double v20 = [(UIKBRTIPartner *)self partnerDelegate];
        objc_msgSend(v20, "updateInputDelegateForRemoteDocumentStateChange:selectedTextRange:hasText:forceSync:", v14, v16, v18, v21, v4);
      }

      self->_isNotifyingDelegateOfRemoteOutputOperation = 0;
      id v10 = v25;
    }
  }
}

- (void)sendAutoFillDidInsertCallbacksWithTextOperations:(id)a3
{
  id v19 = a3;
  char v4 = objc_opt_respondsToSelector();
  id v5 = v19;
  if (v4)
  {
    int v6 = [v19 isAutoFillTextOperation];
    id v5 = v19;
    if (v6)
    {
      id v7 = [v19 textToAssert];
      if ([v7 length])
      {

        id v5 = v19;
      }
      else
      {
        id v8 = [v19 keyboardOutput];
        int v9 = [v8 insertionText];
        uint64_t v10 = [v9 length];

        id v5 = v19;
        if (!v10) {
          goto LABEL_12;
        }
      }
      int v11 = [v5 isExplicitAutoFillInvocation];
      uint64_t v12 = [(UIKBRTIPartner *)self partnerDelegate];
      uint64_t v13 = [v12 inputDelegate];
      char v14 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v5 = v19;
        if ((v14 & 1) == 0) {
          goto LABEL_12;
        }
        long long v15 = [(UIKBRTIPartner *)self partnerDelegate];
        uint64_t v16 = [v15 inputDelegate];
        uint64_t v17 = v16;
        uint64_t v18 = 1;
      }
      else
      {
        id v5 = v19;
        if ((v14 & 1) == 0) {
          goto LABEL_12;
        }
        long long v15 = [(UIKBRTIPartner *)self partnerDelegate];
        uint64_t v16 = [v15 inputDelegate];
        uint64_t v17 = v16;
        uint64_t v18 = 0;
      }
      [v16 autoFillDidInsertWithExplicitInvocationMode:v18];

      id v5 = v19;
    }
  }
LABEL_12:
}

- (void)inputSession:(id)a3 documentTraitsDidChange:(id)a4
{
}

- (void)inputSession:(id)a3 documentStateDidChange:(id)a4
{
}

- (void)inputSession:(id)a3 performInputOperation:(id)a4
{
  id v5 = a4;
  int v6 = [v5 customInfoType];
  int v7 = [v6 isEqualToString:@"UIPhysicalKeyboardEvent"];

  if (!v7)
  {
    uint64_t v10 = [v5 customInfoType];
    int v11 = [v10 isEqualToString:@"UISupplementalLexiconInputOperations"];

    if (v11)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_2;
      aBlock[3] = &unk_1E52D9F98;
      id v73 = v5;
      v74 = self;
      uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
      if (pthread_main_np() == 1) {
        v12[2](v12);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], v12);
      }

      uint64_t v16 = v73;
      goto LABEL_41;
    }
    uint64_t v13 = [v5 customInfoType];
    int v14 = [v13 isEqualToString:@"UIDictationRemoteInputOperations"];

    if (v14)
    {
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_3;
      v69[3] = &unk_1E52D9F98;
      id v70 = v5;
      uint64_t v71 = self;
      long long v15 = (void (**)(void))_Block_copy(v69);
      if (pthread_main_np() == 1) {
        v15[2](v15);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], v15);
      }

      uint64_t v16 = v70;
      goto LABEL_41;
    }
    uint64_t v17 = [v5 customInfoType];
    int v18 = [v17 isEqualToString:@"UIUserInteractionRemoteInputOperations"];

    if (v18)
    {
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_395;
      v66[3] = &unk_1E52D9F98;
      id v67 = v5;
      v68 = self;
      id v19 = (void (**)(void))_Block_copy(v66);
      if (pthread_main_np() == 1) {
        v19[2](v19);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], v19);
      }

      uint64_t v16 = v67;
      goto LABEL_41;
    }
    double v20 = [v5 customInfoType];
    int v21 = [v20 isEqualToString:@"UIKeyboardCameraRemoteInputOperations"];

    if (v21)
    {
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_437;
      v63[3] = &unk_1E52D9F98;
      id v64 = v5;
      uint64_t v65 = self;
      uint64_t v22 = (void (**)(void))_Block_copy(v63);
      if (pthread_main_np() == 1) {
        v22[2](v22);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], v22);
      }

      uint64_t v16 = v64;
      goto LABEL_41;
    }
    double v23 = [v5 customInfoType];
    int v24 = [v23 isEqualToString:@"UIEmojiSearchOperations"];

    if (v24)
    {
      id v25 = [v5 customInfo];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_42;
      }
      double v27 = [v5 customInfo];
      uint64_t v28 = [v27 objectForKeyedSubscript:@"resign"];
      if (!v28) {
        goto LABEL_53;
      }
      double v29 = +[UIKeyboardImpl activeInstance];
      objc_msgSend(v29, "clearForwardingInputDelegateAndResign:", objc_msgSend(v28, "BOOLValue"));
    }
    else
    {
      double v30 = [v5 customInfoType];
      int v31 = [v30 isEqualToString:@"UIUserPencilOperations"];

      if (v31)
      {
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_2_438;
        v60[3] = &unk_1E52D9F98;
        id v61 = v5;
        uint64_t v62 = self;
        double v32 = (void (**)(void))_Block_copy(v60);
        if (pthread_main_np() == 1) {
          v32[2](v32);
        }
        else {
          dispatch_async(MEMORY[0x1E4F14428], v32);
        }

        uint64_t v16 = v61;
        goto LABEL_41;
      }
      uint64_t v33 = [v5 customInfoType];
      int v34 = [v33 isEqualToString:@"UIKBRTICustomInfoTypeApplicationOperations"];

      v35 = (char *)[v5 actionSelector];
      if (!v34)
      {
        if (!v35 || (char *)[v5 actionSelector] != sel_acceptAutocorrection)
        {
          uint64_t v37 = [v5 customInfoType];
          int v38 = [v37 isEqualToString:@"UIWebKitOperations"];

          if (v38)
          {
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_4;
            v57[3] = &unk_1E52D9F70;
            id v58 = v5;
            id v39 = (void (**)(void))_Block_copy(v57);
            if (pthread_main_np() == 1) {
              v39[2](v39);
            }
            else {
              dispatch_async(MEMORY[0x1E4F14428], v39);
            }

            uint64_t v16 = v58;
          }
          else
          {
            id v40 = [v5 customInfoType];
            int v41 = [v40 isEqualToString:@"UIKBRTICustomInfoTypeAnalyticsOperations"];

            if (v41)
            {
              v55[0] = MEMORY[0x1E4F143A8];
              v55[1] = 3221225472;
              v55[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_5;
              v55[3] = &unk_1E52D9F70;
              id v56 = v5;
              uint64_t v42 = (void (**)(void))_Block_copy(v55);
              if (pthread_main_np() == 1) {
                v42[2](v42);
              }
              else {
                dispatch_async(MEMORY[0x1E4F14428], v42);
              }

              uint64_t v16 = v56;
            }
            else
            {
              double v47 = [v5 customInfoType];
              int v48 = [v47 isEqualToString:@"UIKBRTICustomInfoTypeGrammarCorrectionOperations"];

              if (!v48)
              {
                double v50 = [v5 keyboardInput];
                id v8 = [v50 output];

                if (!v8) {
                  goto LABEL_9;
                }
                int v9 = [(UIKBRTIPartner *)self partnerDelegate];
                double v51 = [v5 keyboardInput];
                [v9 undoWithKeyboardInput:v51];

                goto LABEL_4;
              }
              v52[0] = MEMORY[0x1E4F143A8];
              v52[1] = 3221225472;
              v52[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_6;
              v52[3] = &unk_1E52D9F98;
              id v53 = v5;
              double v54 = self;
              double v49 = (void (**)(void))_Block_copy(v52);
              if (pthread_main_np() == 1) {
                v49[2](v49);
              }
              else {
                dispatch_async(MEMORY[0x1E4F14428], v49);
              }

              uint64_t v16 = v53;
            }
          }
LABEL_41:

          goto LABEL_42;
        }
        if (pthread_main_np() != 1)
        {
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_3_449;
          v59[3] = &unk_1E52D9F70;
          v59[4] = self;
          dispatch_async(MEMORY[0x1E4F14428], v59);
          goto LABEL_42;
        }
        double v27 = [(UIKBRTIPartner *)self partnerDelegate];
        [v27 acceptAutocorrection];
LABEL_54:

        goto LABEL_42;
      }
      if (v35 == sel_setRemoteDisableBecomeFirstResponder_)
      {
        double v27 = [v5 customInfo];
        uint64_t v28 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
        double v29 = [v27 objectForKeyedSubscript:@"disabled"];
        uint64_t v43 = [v29 BOOLValue];
        uint64_t v44 = [v27 objectForKeyedSubscript:@"forSuppressionAssertion"];
        uint64_t v45 = [v44 BOOLValue];
        double v46 = [v27 objectForKeyedSubscript:@"updatePlacement"];
        objc_msgSend(v28, "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:", v43, v45, objc_msgSend(v46, "BOOLValue"));
      }
      else
      {
        if ((char *)[v5 actionSelector] == sel_verifyPlacement)
        {
          double v27 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
          [v27 verifyPlacement];
          goto LABEL_54;
        }
        if ((char *)[v5 actionSelector] != sel_setInputViewsHidden_) {
          goto LABEL_42;
        }
        double v27 = [v5 customInfo];
        uint64_t v28 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v29 = [v28 existingContainerRootController];
        uint64_t v36 = [v27 objectForKeyedSubscript:@"hidden"];
        objc_msgSend(v29, "setInputViewsHidden:", objc_msgSend(v36, "BOOLValue"));
      }
    }

LABEL_53:
    goto LABEL_54;
  }
  id v8 = [v5 customInfo];
  if (pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke;
    block[3] = &unk_1E52D9F98;
    void block[4] = self;
    id v76 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);

    goto LABEL_9;
  }
  int v9 = [(UIKBRTIPartner *)self partnerDelegate];
  [v9 performKeyboardEvent:v8];
LABEL_4:

LABEL_9:
LABEL_42:
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) partnerDelegate];
  [v2 performKeyboardEvent:*(void *)(a1 + 40)];
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = [*(id *)(a1 + 32) customInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v3 = v12;
  if (isKindOfClass)
  {
    char v4 = [v12 objectForKeyedSubscript:@"selector"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v12 objectForKeyedSubscript:@"selector"];
      int v6 = NSSelectorFromString(v5);

      if (sel_isEqual(v6, sel_handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection_))
      {
        int v7 = [v12 objectForKey:@"canSuggest"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_15:

          goto LABEL_16;
        }
        uint64_t v8 = [v7 BOOLValue];
        int v9 = [*(id *)(a1 + 40) partnerDelegate];
        objc_msgSend(v9, "handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection:", v8);
LABEL_14:

        goto LABEL_15;
      }
      if (sel_isEqual(v6, sel_handleEventCallbackFromRemoteDestination_didChooseSupplementalItem_toReplaceText_))
      {
        int v7 = [v12 objectForKey:@"supplementalItem"];
        int v9 = [v12 objectForKey:@"textToReplace"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = supplementalItem([v7 identifier]);
        }
        else
        {
          uint64_t v10 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v11 = [*(id *)(a1 + 40) partnerDelegate];
            objc_msgSend(v11, "handleEventCallbackFromRemoteDestination_didChooseSupplementalItem:toReplaceText:", v10, v9);
          }
        }

        goto LABEL_14;
      }
    }
LABEL_16:

    id v3 = v12;
  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_3(uint64_t a1)
{
  if (![*(id *)(a1 + 32) actionSelector]) {
    return;
  }
  id v2 = (char *)[*(id *)(a1 + 32) actionSelector];
  id v3 = *(void **)(a1 + 32);
  if (v2 == sel_handleRemoteDictationEvent_switchToDictationInputModeWithOptions_)
  {
    int v11 = [v3 customInfo];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v21 = v11;
    }
    else {
      id v21 = 0;
    }
    uint64_t v12 = [*(id *)(a1 + 40) partnerDelegate];
    objc_msgSend(v12, "handleRemoteDictationEvent_switchToDictationInputModeWithOptions:", v21);

    goto LABEL_38;
  }
  if ((char *)[v3 actionSelector] == sel_handleRemoteDictationEvent_switchToDictationLanguage_)
  {
    id v21 = [*(id *)(a1 + 40) partnerDelegate];
    uint64_t v13 = [*(id *)(a1 + 32) customInfo];
    objc_msgSend(v21, "handleRemoteDictationEvent_switchToDictationLanguage:", v13);
LABEL_37:

    goto LABEL_38;
  }
  if ((char *)[*(id *)(a1 + 32) actionSelector] == sel_handleRemoteDictationEvent_startDictation)
  {
    id v21 = [*(id *)(a1 + 40) partnerDelegate];
    objc_msgSend(v21, "handleRemoteDictationEvent_startDictation");
    goto LABEL_38;
  }
  char v4 = (char *)[*(id *)(a1 + 32) actionSelector];
  id v5 = *(void **)(a1 + 32);
  if (v4 == sel_handleRemoteDictationEvent_stopDictation_)
  {
    id v21 = [v5 customInfo];
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v14 = [v21 BOOLValue];
    }
    else {
      uint64_t v14 = 1;
    }
    uint64_t v13 = [*(id *)(a1 + 40) partnerDelegate];
    objc_msgSend(v13, "handleRemoteDictationEvent_stopDictation:", v14);
    goto LABEL_37;
  }
  if ((char *)[v5 actionSelector] == sel_handleRemoteDictationEvent_cancelDictation)
  {
    id v21 = [*(id *)(a1 + 40) partnerDelegate];
    objc_msgSend(v21, "handleRemoteDictationEvent_cancelDictation");
    goto LABEL_38;
  }
  if ((char *)[*(id *)(a1 + 32) actionSelector] == sel_handleRemoteDictationEvent_movePopoverView_)
  {
    id v21 = [*(id *)(a1 + 40) partnerDelegate];
    uint64_t v13 = [*(id *)(a1 + 32) customInfo];
    objc_msgSend(v21, "handleRemoteDictationEvent_movePopoverView:", v13);
    goto LABEL_37;
  }
  if ((char *)[*(id *)(a1 + 32) actionSelector] == sel_handleRemoteDictationEvent_setEditMenuFrame_)
  {
    id v21 = [*(id *)(a1 + 40) partnerDelegate];
    uint64_t v13 = [*(id *)(a1 + 32) customInfo];
    objc_msgSend(v21, "handleRemoteDictationEvent_setEditMenuFrame:", v13);
    goto LABEL_37;
  }
  if ((char *)[*(id *)(a1 + 32) actionSelector] == sel_handleRemoteDictationEvent_handleTip_)
  {
    id v21 = [*(id *)(a1 + 40) partnerDelegate];
    uint64_t v13 = [*(id *)(a1 + 32) customInfo];
    objc_msgSend(v21, "handleRemoteDictationEvent_handleTip:", v13);
    goto LABEL_37;
  }
  int v6 = (char *)[*(id *)(a1 + 32) actionSelector];
  int v7 = *(void **)(a1 + 32);
  if (v6 != sel_handleRemoteDictationEvent_updateIdleDetection_)
  {
    uint64_t v8 = (char *)[v7 actionSelector];
    int v9 = *(void **)(a1 + 32);
    if (v8 == sel_setKeyboardMinimizedByDictation_)
    {
      id v21 = [v9 customInfo];
      uint64_t v13 = +[UIKeyboardImpl sharedInstance];
      objc_msgSend(v13, "setKeyboardMinimizedByDictation:", objc_msgSend(v21, "BOOLValue"));
    }
    else
    {
      if ((char *)[v9 actionSelector] == sel_handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases)
      {
        id v21 = [*(id *)(a1 + 40) partnerDelegate];
        objc_msgSend(v21, "handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases");
        goto LABEL_38;
      }
      if ((char *)[*(id *)(a1 + 32) actionSelector] == sel_handleRemoteDictationEvent_resumeDictation)
      {
        id v21 = [*(id *)(a1 + 40) partnerDelegate];
        objc_msgSend(v21, "handleRemoteDictationEvent_resumeDictation");
        goto LABEL_38;
      }
      if ((char *)[*(id *)(a1 + 32) actionSelector] != sel_handleDictationShouldPause_withNewDelagate_)
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v20 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)double v23 = 0;
            _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Unrecognized selector for dictation event", v23, 2u);
          }
        }
        else
        {
          uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke___s_category)+ 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Unrecognized selector for dictation event", buf, 2u);
          }
        }
        return;
      }
      id v21 = [*(id *)(a1 + 32) customInfo];
      uint64_t v13 = +[UIDictationController activeInstance];
      uint64_t v17 = [v21 objectForKeyedSubscript:@"shouldPause"];
      uint64_t v18 = [v17 BOOLValue];
      id v19 = [v21 objectForKeyedSubscript:@"withNewDelagate"];
      objc_msgSend(v13, "handleDictationShouldPause:withNewDelagate:", v18, objc_msgSend(v19, "BOOLValue"));
    }
    goto LABEL_37;
  }
  long long v15 = [v7 customInfo];
  uint64_t v16 = [v15 integerValue];

  id v21 = [*(id *)(a1 + 40) partnerDelegate];
  objc_msgSend(v21, "handleRemoteDictationEvent_updateIdleDetection:", v16);
LABEL_38:
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_395(uint64_t a1)
{
  if (![*(id *)(a1 + 32) actionSelector]) {
    return;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_acceptAutocorrection)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 acceptAutocorrection];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_handleEmojiPopoverKeyCommand)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 handleEmojiPopoverKeyCommand];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_handleAutoFillContactPopoverCommand)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 handleAutoFillContactPopoverCommand];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_handleAutoFillCreditCardPopoverCommand)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 handleAutoFillCreditCardPopoverCommand];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_handleAutoFillPasswordPopoverCommand)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 handleAutoFillPasswordPopoverCommand];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_handleAutoFillContactDetected)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 handleAutoFillContactDetected];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_handleAutoFillCreditCardDetected)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 handleAutoFillCreditCardDetected];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_handleAutoFillPasswordDetected)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 handleAutoFillPasswordDetected];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_performStopAutoDeleteAtDocumentStart)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 performStopAutoDeleteAtDocumentStart];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_ejectKeyDown)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 ejectKeyDown];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_textSelectionWillScroll)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 textWillScroll];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_textSelectionDidScroll)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 textDidScroll];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_removeInlineTextCompletionPrompt)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 removeInlineTextCompletionPrompt];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_beginAcceptingInlineCompletionByDirectTap)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 beginAcceptingInlineCompletionByDirectTap];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_endAcceptingInlineCompletionByDirectTap)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 endAcceptingInlineCompletionByDirectTap];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_presentTextChoicePromptForRange_)
  {
    id v11 = [*(id *)(a1 + 32) customInfo];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v9 = [*(id *)(a1 + 40) partnerDelegate];
        [v9 presentTextChoicePromptForRange:v11];
      }
    }
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && (char *)[*(id *)(a1 + 32) actionSelector] == sel_dismissTextChoicePrompt)
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 dismissTextChoicePrompt];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && sel_isEqual((SEL)[*(id *)(a1 + 32) actionSelector], sel_clearShiftState))
  {
    id v11 = [*(id *)(a1 + 40) partnerDelegate];
    [v11 clearShiftState];
LABEL_69:

    return;
  }
  if ([*(id *)(a1 + 32) actionSelector]
    && sel_isEqual((SEL)[*(id *)(a1 + 32) actionSelector], sel_setKeyboardInputMode_userInitiated_))
  {
    id v2 = [*(id *)(a1 + 32) customInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
    id v11 = [*(id *)(a1 + 32) customInfo];
    char v4 = [v11 objectForKeyedSubscript:@"inputMode"];
    uint64_t v5 = [v11 objectForKeyedSubscript:@"isUserInitiated"];
    int v6 = (void *)v5;
    if (v4 && v5)
    {
      int v7 = [*(id *)(a1 + 40) partnerDelegate];
      objc_msgSend(v7, "setKeyboardInputMode:userInitiated:", v4, objc_msgSend(v6, "BOOLValue"));
    }
    goto LABEL_69;
  }
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v10 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Unrecognized selector for user interaction event", v13, 2u);
    }
  }
  else
  {
    uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke_2___s_category)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unrecognized selector for user interaction event", buf, 2u);
    }
  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_437(uint64_t a1)
{
  if ([*(id *)(a1 + 32) actionSelector])
  {
    id v2 = [*(id *)(a1 + 32) customInfo];
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v4 = v2;
    }
    else {
      id v4 = 0;
    }
    if ((char *)[*(id *)(a1 + 32) actionSelector] == sel_handleRemoteKeyboardCameraEvent_startCameraInput_)
    {
      id v3 = [*(id *)(a1 + 40) partnerDelegate];
      objc_msgSend(v3, "handleRemoteKeyboardCameraEvent_startCameraInput:", v4);
    }
  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_2_438(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) actionSelector];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if ((char *)[v3 actionSelector] != sel_setInputMode_) {
      return;
    }
    id v9 = [*(id *)(a1 + 32) customInfo];
    id v4 = [*(id *)(a1 + 40) partnerDelegate];
    uint64_t v5 = [v9 objectForKeyedSubscript:@"inputMode"];
    uint64_t v8 = [v9 objectForKeyedSubscript:@"userInitiated"];
    objc_msgSend(v4, "setInputMode:userInitiated:", v5, objc_msgSend(v8, "BOOLValue"));
    goto LABEL_7;
  }
  id v9 = [v3 customInfo];
  id v4 = [v9 objectForKeyedSubscript:@"suppressAssistantBar"];
  uint64_t v5 = [v9 objectForKeyedSubscript:@"suppressSoftwareKeyboard"];
  if (v4)
  {
    int v6 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v6, "_setShouldSuppressAssistantBar:", objc_msgSend(v4, "BOOLValue"));

    int v7 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v7, "_setShouldSuppressSoftwareKeyboard:", objc_msgSend(v5, "BOOLValue"));

    uint64_t v8 = +[UIKeyboardImpl activeInstance];
    [v8 _suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:0];
LABEL_7:
  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_3_449(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) partnerDelegate];
  [v1 acceptAutocorrection];
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_4(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) customInfo];
  id v1 = [v13 objectForKeyedSubscript:@"selector"];
  if (v1)
  {
    uint64_t v2 = [v13 objectForKeyedSubscript:@"selector"];
    id v3 = NSSelectorFromString(v2);
  }
  else
  {
    id v3 = 0;
  }

  if (sel_isEqual(v3, sel__addInputString_withFlags_withInputManagerHint_withInputSource_))
  {
    id v4 = [v13 objectForKeyedSubscript:@"inputManagerHint"];
    if (![v4 length])
    {

      id v4 = 0;
    }
    uint64_t v5 = [v13 objectForKeyedSubscript:@"flags"];
    uint64_t v6 = [v5 unsignedIntegerValue];

    int v7 = [v13 objectForKeyedSubscript:@"string"];
    uint64_t v8 = [v13 objectForKeyedSubscript:@"source"];
    uint64_t v9 = [v8 unsignedIntegerValue];

    uint64_t v10 = +[UIKeyboardImpl activeInstance];
    [v10 _addInputString:v7 withFlags:v6 withInputManagerHint:v4 withInputSource:v9];
  }
  else
  {
    if (!sel_isEqual(v3, sel__deleteFromInputWithFlags_)) {
      goto LABEL_11;
    }
    id v11 = [v13 objectForKeyedSubscript:@"flags"];
    uint64_t v12 = [v11 unsignedIntegerValue];

    id v4 = +[UIKeyboardImpl activeInstance];
    [v4 _deleteFromInputWithFlags:v12];
  }

LABEL_11:
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_5(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) customInfo];
  if ((char *)[*(id *)(a1 + 32) actionSelector] == sel_acceptingCandidateWithTrigger_)
  {
    id v4 = [v6 objectForKeyedSubscript:@"candidateAcceptedTrigger"];
    uint64_t v5 = +[UIKeyboardImpl activeInstance];
    [v5 acceptingCandidateWithTrigger:v4];
    goto LABEL_6;
  }
  BOOL v2 = [*(id *)(a1 + 32) actionSelector] == (void)sel_changingContextWithTrigger_;
  id v3 = v6;
  if (v2)
  {
    id v4 = [v6 objectForKeyedSubscript:@"contextChangeTrigger"];
    uint64_t v5 = +[UIKeyboardImpl activeInstance];
    [v5 changingContextWithTrigger:v4];
LABEL_6:

    id v3 = v6;
  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_6(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) customInfo];
  if ((char *)[*(id *)(a1 + 32) actionSelector] == sel_handleGrammarCorrectionEntries_)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v2 = [*(id *)(a1 + 40) partnerDelegate];
      [v2 handleGrammarCorrectionEntries:v3];
    }
  }
}

- (void)inputSession:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIKBRTIPartner_inputSession_performInputOperation_withResponse___block_invoke;
  aBlock[3] = &unk_1E52E3298;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  if (pthread_main_np() == 1) {
    v11[2](v11);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __66__UIKBRTIPartner_inputSession_performInputOperation_withResponse___block_invoke(id *a1)
{
  BOOL v2 = [a1[4] customInfoType];
  int v3 = [v2 isEqualToString:@"UIPhysicalKeyboardEvent"];

  id v4 = a1[4];
  if (v3)
  {
    id v28 = [v4 customInfo];
    uint64_t v5 = [a1[5] partnerDelegate];
    int v6 = [v5 performKeyboardEvent:v28];

    if (a1[6])
    {
      if (v6 && [v28 keyCommandHandlingBeforePublic])
      {
        id v7 = [a1[5] partnerDelegate];
        [v7 inputModeSwitcherVisible];
      }
      (*((void (**)(void))a1[6] + 2))();
    }

    return;
  }
  if ([v4 actionSelector]
    && (char *)[a1[4] actionSelector] == sel_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination_)
  {
    uint64_t v16 = [a1[5] partnerDelegate];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __66__UIKBRTIPartner_inputSession_performInputOperation_withResponse___block_invoke_2;
    v30[3] = &unk_1E52D9FE8;
    id v31 = a1[6];
    [v16 acceptAutocorrectionWithCompletionHandler:v30 requestedByRemoteInputDestination:1];

    return;
  }
  id v8 = [a1[4] customInfoType];
  int v9 = [v8 isEqualToString:@"UIWebKitOperations"];

  if (v9)
  {
    id v10 = [a1[4] customInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v12 = [a1[4] customInfo];
    if (isKindOfClass)
    {
      id v13 = +[UIKeyboardImpl activeInstance];
      [v13 _handleKeyCommand:v12];
    }
    else
    {
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0)
      {
LABEL_33:
        id v25 = a1[6];
        if (v25)
        {
          double v26 = (void (*)(void))*((void *)v25 + 2);
          v26();
        }
        return;
      }
      uint64_t v12 = [a1[4] customInfo];
      uint64_t v18 = [v12 objectForKeyedSubscript:@"selector"];
      if (v18)
      {
        id v19 = [v12 objectForKeyedSubscript:@"selector"];
        double v20 = NSSelectorFromString(v19);
      }
      else
      {
        double v20 = 0;
      }

      if (sel_isEqual(v20, sel__handleKeyInputMethodCommandForEvent_canHandleAppKeyCommand_))
      {
        id v13 = +[UIKeyboardImpl activeInstance];
        id v21 = [v12 objectForKeyedSubscript:@"keyEvent"];
        uint64_t v22 = [v12 objectForKeyedSubscript:@"canHandleAppKeyCommand"];
        objc_msgSend(v13, "_handleKeyInputMethodCommandForEvent:canHandleAppKeyCommand:", v21, objc_msgSend(v22, "BOOLValue"));
      }
      else
      {
        if (!sel_isEqual(v20, sel__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers_)) {
          goto LABEL_32;
        }
        id v13 = [a1[5] partnerDelegate];
        id v21 = [v12 objectForKeyedSubscript:@"keyEvent"];
        uint64_t v22 = [v12 objectForKeyedSubscript:@"webEventType"];
        double v23 = [v12 objectForKeyedSubscript:@"inputString"];
        int v24 = [v12 objectForKeyedSubscript:@"inputStringIgnoringModifiers"];
        [v13 _handleWebKeyEvent:v21 withEventType:v22 withInputString:v23 withInputStringIgnoringModifiers:v24];
      }
    }

LABEL_32:
    goto LABEL_33;
  }
  if (os_variant_has_internal_diagnostics())
  {
    double v27 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v27, OS_LOG_TYPE_FAULT, "Unrecognized event sent to ui host", buf, 2u);
    }
  }
  else
  {
    uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke_3___s_category)+ 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Unrecognized event sent to ui host", buf, 2u);
    }
  }
  id v15 = (void (**)(id, void))a1[6];
  if (v15) {
    v15[2](v15, 0);
  }
}

uint64_t __66__UIKBRTIPartner_inputSession_performInputOperation_withResponse___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = 8;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)inputSession:(id)a3 textSuggestionsChanged:(id)a4
{
  id v5 = a4;
  if (pthread_main_np() == 1)
  {
    int v6 = [(UIKBRTIPartner *)self partnerDelegate];
    id v7 = +[UITextSuggestion decodeTextSuggestions:v5];
    [v6 setSuggestions:v7];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__UIKBRTIPartner_inputSession_textSuggestionsChanged___block_invoke;
    v8[3] = &unk_1E52D9F98;
    v8[4] = self;
    id v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __54__UIKBRTIPartner_inputSession_textSuggestionsChanged___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) partnerDelegate];
  BOOL v2 = +[UITextSuggestion decodeTextSuggestions:*(void *)(a1 + 40)];
  [v3 setSuggestions:v2];
}

- (void)inputSession:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  id v5 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__UIKBRTIPartner_inputSession_didAddRTISupplementalLexicon___block_invoke;
  aBlock[3] = &unk_1E52FD9C0;
  void aBlock[4] = self;
  int v6 = (void (**)(void *, id))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
  {
    v6[2](v6, v5);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__UIKBRTIPartner_inputSession_didAddRTISupplementalLexicon___block_invoke_2;
    block[3] = &unk_1E52DB330;
    id v9 = v6;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __60__UIKBRTIPartner_inputSession_didAddRTISupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  id v10 = [[_UISupplementalLexicon alloc] initWithRTISupplementalLexicon:v3];

  id v5 = v10;
  if (v10)
  {
    int v6 = [*(id *)(a1 + 32) supplementalLexicons];

    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*(id *)(a1 + 32) setSupplementalLexicons:v7];
    }
    id v8 = [*(id *)(a1 + 32) supplementalLexicons];
    id v9 = [NSNumber numberWithUnsignedLongLong:v4];
    [v8 setObject:v10 forKey:v9];

    id v5 = v10;
  }
}

uint64_t __60__UIKBRTIPartner_inputSession_didAddRTISupplementalLexicon___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)inputSession:(id)a3 didRemoveRTISupplementalLexicon:(id)a4
{
  id v5 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__UIKBRTIPartner_inputSession_didRemoveRTISupplementalLexicon___block_invoke;
  aBlock[3] = &unk_1E52FD9C0;
  void aBlock[4] = self;
  int v6 = (void (**)(void *, id))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
  {
    v6[2](v6, v5);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__UIKBRTIPartner_inputSession_didRemoveRTISupplementalLexicon___block_invoke_2;
    block[3] = &unk_1E52DB330;
    id v9 = v6;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __63__UIKBRTIPartner_inputSession_didRemoveRTISupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [*(id *)(a1 + 32) supplementalLexicons];
  id v5 = [NSNumber numberWithUnsignedLongLong:v3];
  id v8 = [v4 objectForKey:v5];

  if (v8)
  {
    int v6 = [*(id *)(a1 + 32) supplementalLexicons];
    id v7 = [NSNumber numberWithUnsignedLongLong:v3];
    [v6 removeObjectForKey:v7];
  }
}

uint64_t __63__UIKBRTIPartner_inputSession_didRemoveRTISupplementalLexicon___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)compareWaitingRTIOutputOperationResponseContext:(id)a3 andExchange:(id)a4
{
  id v7 = a4;
  id v8 = self;
  id v9 = (UIKeyboardTaskExecutionContext *)a3;
  objc_sync_enter(v8);
  waitingRTIOutputOperationResponseContext = v8->_waitingRTIOutputOperationResponseContext;

  if (waitingRTIOutputOperationResponseContext == v9) {
    objc_storeStrong((id *)&v8->_waitingRTIOutputOperationResponseContext, a4);
  }
  objc_sync_exit(v8);

  return waitingRTIOutputOperationResponseContext == v9;
}

- (id)exchangeWaitingRTIOutputOperationResponseContext:(id)a3
{
  uint64_t v4 = (UIKeyboardTaskExecutionContext *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  int v6 = v5->_waitingRTIOutputOperationResponseContext;
  waitingRTIOutputOperationResponseContext = v5->_waitingRTIOutputOperationResponseContext;
  v5->_waitingRTIOutputOperationResponseContext = v4;
  id v8 = v4;

  objc_sync_exit(v5);
  return v6;
}

- (void)finishCompletionHandlersIfNeeded
{
  BOOL v2 = [(UIKBRTIPartner *)self exchangeWaitingRTIOutputOperationResponseContext:0];
  if (v2)
  {
    id v3 = v2;
    if (qword_1EB261CF0 != -1) {
      dispatch_once(&qword_1EB261CF0, &__block_literal_global_495);
    }
    [v3 transferExecutionToMainThreadWithTask:&__block_literal_global_499 breadcrumb:qword_1EB261CE8];
    BOOL v2 = v3;
  }
}

void __50__UIKBRTIPartner_finishCompletionHandlersIfNeeded__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_497 copy];
  id v1 = (void *)qword_1EB261CE8;
  qword_1EB261CE8 = v0;
}

uint64_t __50__UIKBRTIPartner_finishCompletionHandlersIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __50__UIKBRTIPartner_finishCompletionHandlersIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

- (void)performTextOperations:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 customInfoType];
  if ([v4 isEqualToString:@"UIEmojiSearchOperations"])
  {
    id v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    int v6 = [v5 scene];
    uint64_t v7 = [v6 activationState];

    id v8 = v9;
    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(UIKBRTIPartner *)self performTextOperations:v9 resultHandler:&__block_literal_global_501];
  id v8 = v9;
LABEL_6:
}

- (void)performTextOperations:(id)a3 resultHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  if (!+[UIKeyboard usingEndInputSessionCompletion])
  {
    id v9 = [(UIKBRTIPartner *)self exchangeWaitingRTIOutputOperationResponseContext:0];
    if (v9)
    {
      id v10 = [v6 keyboardOutput];
      [(UIKBRTIPartner *)self setPendingOutputOperation:v10];

      v7[2](v7, 255);
      if (qword_1EB261D20 != -1) {
        dispatch_once(&qword_1EB261D20, &__block_literal_global_519_1);
      }
      [v9 transferExecutionToMainThreadWithTask:&__block_literal_global_525_0 breadcrumb:qword_1EB261D18];
      goto LABEL_23;
    }
    if (pthread_main_np() == 1)
    {
      [(UIKBRTIPartner *)self _queued_performTextOperations:v6 resultHandler:v7];
LABEL_23:

      goto LABEL_24;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_4;
    void v15[3] = &unk_1E52E3298;
    void v15[4] = self;
    id v16 = v6;
    char v17 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v15);

    uint64_t v12 = v16;
LABEL_22:

    goto LABEL_23;
  }
  if (pthread_main_np() != 1)
  {
    id v9 = [(UIKBRTIPartner *)self keyboardTaskSubqueue];
    if (v9)
    {
      id v11 = _UIKeyboardInputSessionChangeLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v27 = v6;
        __int16 v28 = 2112;
        double v29 = v9;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Dispatching -_queued_performTextOperations:%p as main-thread task on keyboard task subqueue: %@", buf, 0x16u);
      }

      if (qword_1EB261D00 != -1) {
        dispatch_once(&qword_1EB261D00, &__block_literal_global_503);
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_3;
      v21[3] = &unk_1E52DC7E8;
      id v22 = v6;
      id v23 = v9;
      int v24 = self;
      id v25 = v7;
      [v23 dispatchAsync:v21 breadcrumb:qword_1EB261CF8];

      uint64_t v12 = v22;
    }
    else
    {
      if (qword_1EB261D10 != -1) {
        dispatch_once(&qword_1EB261D10, &__block_literal_global_510_0);
      }
      id v13 = [(UIKBRTIPartner *)self partnerDelegate];
      uint64_t v14 = [v13 taskQueue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_3_514;
      void v18[3] = &unk_1E52FCBC8;
      void v18[4] = self;
      id v19 = v6;
      double v20 = v7;
      [v14 addTask:v18 breadcrumb:qword_1EB261D08];

      uint64_t v12 = v19;
    }
    goto LABEL_22;
  }
  id v8 = _UIKeyboardLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unexpected call to UIKBRTIPartner's -performTextOperations:resultHandler: on main thread.", buf, 2u);
  }

  [(UIKBRTIPartner *)self _queued_performTextOperations:v6 resultHandler:v7];
LABEL_24:
}

void __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_505 copy];
  id v1 = (void *)qword_1EB261CF8;
  qword_1EB261CF8 = v0;
}

uint64_t __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v2 = _UIKeyboardInputSessionChangeLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Now performing -_queued_performTextOperations:%p as main-thread task on keyboard task subqueue: %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "_queued_performTextOperations:resultHandler:", *(void *)(a1 + 32), *(void *)(a1 + 56));
}

void __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_508()
{
  uint64_t v0 = [&__block_literal_global_513 copy];
  id v1 = (void *)qword_1EB261D08;
  qword_1EB261D08 = v0;
}

uint64_t __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_2_511(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_3_514(void *a1, void *a2)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v5 = a2;
  objc_msgSend(v2, "_queued_performTextOperations:resultHandler:", v3, v4);
  [v5 returnExecutionToParent];
}

void __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_517()
{
  uint64_t v0 = [&__block_literal_global_522 copy];
  id v1 = (void *)qword_1EB261D18;
  qword_1EB261D18 = v0;
}

uint64_t __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_2_520(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_3_523(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

uint64_t __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queued_performTextOperations:resultHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queued_performTextOperations:(id)a3 resultHandler:(id)a4
{
  uint64_t v244 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, unint64_t))a4;
  __int16 v8 = [v6 inputSourceState];

  if (v8)
  {
    rtiInputSourceState = self->_rtiInputSourceState;
    if (rtiInputSourceState)
    {
      uint64_t v10 = [v6 inputSourceState];
      int v11 = [(RTIInputSourceState *)rtiInputSourceState isEqual:v10] ^ 1;
    }
    else
    {
      int v11 = 0;
    }
    uint64_t v12 = [v6 inputSourceState];
    id v13 = self->_rtiInputSourceState;
    self->_rtiInputSourceState = v12;

    uint64_t v14 = _UIKeyboardLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v92 = self->_rtiInputSourceState;
      *(_DWORD *)buf = 138412290;
      v241 = v92;
      _os_log_debug_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEBUG, "Received input source state: %@", buf, 0xCu);
    }
  }
  else
  {
    int v11 = 0;
  }
  id v15 = [(UIKBRTIPartner *)self partnerDelegate];
  id v16 = [v6 targetSessionUUID];
  if (v16)
  {
    char v17 = [(UIKBRTIPartner *)self currentSessionIdentifier];
    int v18 = [v16 isEqual:v17];

    if (!v15) {
      goto LABEL_24;
    }
  }
  else
  {
    int v18 = 1;
    if (!v15)
    {
LABEL_24:
      uint64_t v45 = _UIKeyboardLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        double v46 = [(UIKBRTIPartner *)self currentSessionIdentifier];
        *(_DWORD *)buf = 138412546;
        v241 = (RTIInputSourceState *)v16;
        __int16 v242 = 2112;
        v243 = v46;
        _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_DEFAULT, "Skipping performing textoperation targetsessionid: %@, currentSessionID: %@", buf, 0x16u);
      }
      unint64_t v47 = 0;
      goto LABEL_97;
    }
  }
  if (!v18) {
    goto LABEL_24;
  }
  [(UIKBRTIPartner *)self sendAutoFillDidInsertCallbacksWithTextOperations:v6];
  if (os_variant_has_internal_diagnostics())
  {
    v168 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v168, OS_LOG_TYPE_DEFAULT, "performing keyboard output", buf, 2u);
    }
  }
  int v226 = v11;
  id v19 = [(UIKBRTIPartner *)self partnerDelegate];
  [v19 setPerformingRemoteTextOperations:1];

  self->_isNotifyingDelegateOfRemoteOutputOperation = 1;
  double v20 = [(UIKBRTIPartner *)self rtiDocumentState];
  int v225 = [v20 canSuggestSupplementalItemsForCurrentSelection];

  uint64_t v21 = [v6 editingActionSelector] == 0;
  id v22 = [(UIKBRTIPartner *)self rtiDocumentState];
  uint64_t v23 = [v6 selectionRangeToAssert];
  v229 = self;
  uint64_t v25 = objc_msgSend(v22, "deltaForSelectionRange:", v23, v24);
  uint64_t v27 = v26;

  __int16 v28 = [(UIKBRTIPartner *)v229 partnerDelegate];
  double v29 = [v6 textToAssert];
  uint64_t v30 = v25;
  id v31 = v229;
  LODWORD(v21) = objc_msgSend(v28, "assertTextForRemoteDocument:withSelectionDelta:updatingSelection:", v29, v30, v27, v21);

  if (v21) {
    uint64_t v32 = 2;
  }
  else {
    uint64_t v32 = 0;
  }
  char v228 = [(UIKBRTIPartner *)v229 _performKeyboardOutputOperations:v6];
  if ((v228 & 1) != 0 && +[UIKeyboard inputUIOOP])
  {
    uint64_t v33 = +[UIKeyboardImpl sharedInstance];
    [v33 triggerPendingKeyup];
  }
  int v34 = [v6 styledIntermediateText];

  if (v34)
  {
    v219 = v16;
    v35 = v7;
    uint64_t v36 = [v6 styledIntermediateText];
    uint64_t v37 = [v6 customInfoType];
    int v38 = [v37 isEqualToString:@"UIKBRTICustomInfoInlineCompletionAsMarkedText"];

    id v39 = [v36 displayString];
    uint64_t v40 = [v36 selectedRange];
    uint64_t v42 = v41;
    uint64_t v43 = [v36 inputString];
    uint64_t v44 = [v36 searchString];
    if (v38) {
      objc_msgSend(v15, "setInlineCompletionAsMarkedText:selectedRange:inputString:searchString:", v39, v40, v42, v43, v44);
    }
    else {
      objc_msgSend(v15, "setAttributedMarkedText:selectedRange:inputString:searchString:", v39, v40, v42, v43, v44);
    }

    uint64_t v50 = [v36 cursorVisibility];
    uint64_t v7 = v35;
    if (v50) {
      [v15 setCaretVisible:v50 == 1];
    }
    unint64_t v47 = 2;
    id v16 = v219;
    id v31 = v229;
    goto LABEL_33;
  }
  unint64_t v47 = v32 | (2 * (v228 & 1u));
  int v48 = [v6 intermediateText];

  if (v48)
  {
    uint64_t v36 = [v6 intermediateText];
    char v49 = [v15 assertIntermediateText:v36];
    v47 |= 2 * (v49 & 1u);
    v228 |= v49;
LABEL_33:
  }
  if ([v6 editingActionSelector])
  {
    double v51 = [v6 customInfoType];
    char v52 = [v51 isEqualToString:@"UIKBRTICustomInfoTypeKeyboardOperations"];

    if ((v52 & 1) == 0)
    {
      objc_msgSend(v15, "performTextOperationActionSelector:", objc_msgSend(v6, "editingActionSelector"));
      v47 |= 1uLL;
    }
  }
  [v6 enumerateImagesAndUserInfosUsingBlock:&__block_literal_global_528];
  if (objc_opt_respondsToSelector())
  {
    v238[0] = MEMORY[0x1E4F143A8];
    v238[1] = 3221225472;
    v238[2] = __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke_2;
    v238[3] = &unk_1E52FDA08;
    v238[4] = v31;
    [v6 enumerateAdaptiveImageGlyphsUsingBlock:v238];
  }
  if (objc_opt_respondsToSelector())
  {
    v237[0] = MEMORY[0x1E4F143A8];
    v237[1] = 3221225472;
    v237[2] = __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke_3;
    v237[3] = &unk_1E52FDA30;
    v237[4] = v31;
    [v6 enumerateTextAttachmentsUsingBlock:v237];
  }
  id v53 = [v6 inputSourceState];
  uint64_t v45 = [v53 inputMode];

  if (v45)
  {
    double v54 = +[UIKeyboardInputModeController sharedInputModeController];
    double v55 = [v54 currentInputMode];
    id v56 = [v55 identifier];

    if (([(RTIInputSourceState *)v56 isEqualToString:v45] & 1) == 0)
    {
      double v57 = v15;
      id v58 = v7;
      double v59 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v45];
      double v60 = _UIKeyboardLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v241 = v56;
        __int16 v242 = 2112;
        v243 = v45;
        _os_log_debug_impl(&dword_1853B0000, v60, OS_LOG_TYPE_DEBUG, "Detected an input mode change: %@->%@", buf, 0x16u);
      }

      id v61 = +[UIKeyboardImpl activeInstance];
      [v61 setKeyboardInputMode:v59 userInitiated:0];

      uint64_t v7 = v58;
      id v15 = v57;
      id v31 = v229;
    }
  }
  uint64_t v62 = [v6 customInfoType];
  unsigned int v63 = [v6 customInfo];
  v227 = v62;
  if ([v62 isEqualToString:@"UIDictationRemoteTextOperations"])
  {
    v216 = v7;
    v220 = v63;
    id v64 = v63;
    uint64_t v65 = [v64 objectForKeyedSubscript:@"selector"];
    if (v65)
    {
      int v66 = [v64 objectForKeyedSubscript:@"selector"];
      id v67 = NSSelectorFromString(v66);
    }
    else
    {
      id v67 = 0;
    }

    if (sel_isEqual(v67, sel_updateLastHypothesis_WithNewHypothesis_))
    {
      v79 = +[UIDictationController sharedInstance];
      char v80 = [v64 objectForKeyedSubscript:@"lastHypothesis"];
      v81 = [v64 objectForKeyedSubscript:@"newHypothesis"];
      [v79 updateLastHypothesis:v80 WithNewHypothesis:v81];

LABEL_57:
LABEL_58:
      uint64_t v7 = v216;
LABEL_84:

LABEL_85:
      id v31 = v229;
      unsigned int v63 = v220;
      goto LABEL_86;
    }
    uint64_t v7 = v216;
    if (sel_isEqual(v67, sel_resetLastHypothesis))
    {
      v79 = +[UIDictationController sharedInstance];
      [v79 resetLastHypothesis];
      goto LABEL_84;
    }
    if (sel_isEqual(v67, sel_setCandidateDictationSerializableResults_))
    {
      v79 = +[UIDictationController sharedInstance];
      uint64_t v91 = [v64 objectForKeyedSubscript:@"candidateDictationSerializableResults"];
      [v79 setCandidateDictationSerializableResults:v91];
      goto LABEL_83;
    }
    if (sel_isEqual(v67, sel_postNotificationName_object_userInfo_))
    {
      v79 = +[UIDictationController sharedInstance];
      uint64_t v91 = [v64 objectForKeyedSubscript:@"notificationName"];
      uint64_t v101 = [v64 objectForKeyedSubscript:@"userInfo"];
      [v79 postNotificationName:v91 userInfo:v101];
    }
    else
    {
      if (!sel_isEqual(v67, sel_insertSerializedDictationResult_withCorrectionIdentifier_))
      {
        if (sel_isEqual(v67, sel_startLandingIfNecessary))
        {
          v79 = +[UIDictationLandingView sharedInstance];
          [v79 startLandingIfNecessary];
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_stopLanding))
        {
          v79 = +[UIDictationLandingView sharedInstance];
          [v79 stopLanding];
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_stopLandingForError))
        {
          v79 = +[UIDictationLandingView sharedInstance];
          [v79 stopLandingForError];
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_resignFirstResponderWhenIdleIfNeeded))
        {
          v79 = +[UIDictationController sharedInstance];
          [v79 resignFirstResponderWhenIdleIfNeeded];
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_setRemoteDictationPopover_))
        {
          v79 = +[UIKeyboardImpl sharedInstance];
          [v79 setRemoteDictationPopover:v64];
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_setKeyboardMinimizedByDictation_))
        {
          v79 = +[UIKeyboardImpl sharedInstance];
          uint64_t v91 = [v64 objectForKeyedSubscript:@"minimized"];
          objc_msgSend(v79, "setKeyboardMinimizedByDictation:", objc_msgSend(v91, "BOOLValue"));
          goto LABEL_83;
        }
        if (sel_isEqual(v67, sel_setShadowState_))
        {
          v79 = +[UIDictationController sharedInstance];
          uint64_t v91 = [v64 objectForKeyedSubscript:@"state"];
          objc_msgSend(v79, "setShadowState:", objc_msgSend(v91, "integerValue"));
          goto LABEL_83;
        }
        if (sel_isEqual(v67, sel_presentDictationMenuTip_))
        {
          v79 = +[UIKeyboardImpl activeInstance];
          [v79 presentDictationMenuTip:v64];
          goto LABEL_58;
        }
        if (sel_isEqual(v67, sel_dismissDictationMenu))
        {
          v79 = +[UIKeyboardImpl activeInstance];
          [v79 dismissDictationMenu];
          goto LABEL_58;
        }
        if (sel_isEqual(v67, sel_setUsingTypeAndTalk_))
        {
          v79 = [v64 objectForKeyedSubscript:@"usingTypeAndTalk"];
          uint64_t v170 = [v79 BOOLValue];
          v171 = +[UIKeyboardInputMode dictationInputMode];
          [v171 setUsingTypeAndTalk:v170];
        }
        else
        {
          if (!sel_isEqual(v67, sel_setIsCurrentDictationLanguageOnDevice_))
          {
            if (sel_isEqual(v67, sel_updateCaretRectInWindowIfNeeded))
            {
              BOOL v178 = +[UIKeyboardImpl activeInstance];
              v79 = [v178 inputDelegate];

              uint64_t v179 = [v79 textInputView];
              uint64_t v180 = [v79 selectedTextRange];
              BOOL v181 = [v180 start];
              [v79 caretRectForPosition:v181];
              objc_msgSend(v179, "convertRect:toView:", 0);
              double v183 = v182;

              int v184 = [v64 objectForKeyedSubscript:@"caretRectInWindow.y"];
              [v184 floatValue];
              double v186 = v185;

              if (vabdd_f64(v186, v183) > 2.0) {
                [(UIKBRTIPartner *)v229 documentStateChanged];
              }
              goto LABEL_58;
            }
            if (sel_isEqual(v67, sel_setCurrentInstrumentationContext_))
            {
              v79 = +[UIDictationController sharedInstance];
              char v80 = [v64 objectForKeyedSubscript:@"instrumentationContext"];
              [v79 setCurrentInstrumentationContext:v80];
              goto LABEL_57;
            }
            if (sel_isEqual(v67, sel_setLocalSpeechRecognitionForced_))
            {
              v79 = +[UIDictationController sharedInstance];
              char v80 = [v64 objectForKeyedSubscript:@"forceOfflineRecognition"];
              [v79 setLocalSpeechRecognitionForced:v80 != 0];
              goto LABEL_57;
            }
            if (sel_isEqual(v67, sel_setInteractionIdentifier_))
            {
              v79 = +[UIDictationController sharedInstance];
              char v80 = [v64 objectForKeyedSubscript:@"interactionIdentifier"];
              [v79 setInteractionIdentifier:v80];
              goto LABEL_57;
            }
            if (sel_isEqual(v67, sel_didRecognizeCommandWithIdentifier_strings_parameters_voiceCommandUUID_gazeRangeAtCommandRecognitionTime_))
            {
              v79 = +[UIDictationController sharedInstance];
              id objb = [v64 objectForKeyedSubscript:@"identifier"];
              v212 = [v64 objectForKeyedSubscript:@"strings"];
              id v196 = [v64 objectForKeyedSubscript:@"parameters"];
              uint64_t v197 = [v64 objectForKeyedSubscript:@"voiceCommandUUID"];
              uint64_t v198 = [v64 objectForKeyedSubscript:@"gazeRangeAtCommandRecognitionTime"];
              [v79 didRecognizeCommandWithIdentifier:objb strings:v212 parameters:v196 voiceCommandUUID:v197 gazeRangeAtCommandRecognitionTime:v198];

              goto LABEL_58;
            }
            if (sel_isEqual(v67, sel_setIdleTimerDisabled_forReason_))
            {
              v79 = +[UIDictationController sharedInstance];
              char v80 = [v64 objectForKeyedSubscript:@"disabled"];
              uint64_t v199 = [v80 BOOLValue];
              v200 = [v64 objectForKeyedSubscript:@"reason"];
              [v79 setIdleTimerDisabled:v199 forReason:v200];

              goto LABEL_57;
            }
            uint64_t v7 = v216;
            if (!sel_isEqual(v67, sel_showLowStorageUserAlertWithLanguage_)) {
              goto LABEL_85;
            }
            v79 = +[UIDictationController sharedInstance];
            uint64_t v201 = [v64 objectForKeyedSubscript:@"language"];
            uint64_t v91 = (void *)v201;
            if (v201) {
              v202 = (__CFString *)v201;
            }
            else {
              v202 = &stru_1ED0E84C0;
            }
            [v79 showLowStorageUserAlertWithLanguage:v202];
LABEL_83:

            goto LABEL_84;
          }
          v79 = [v64 objectForKeyedSubscript:@"isCurrentDictationLanguageOnDevice"];
          uint64_t v173 = [v79 BOOLValue];
          v171 = +[UIKeyboardInputMode dictationInputMode];
          [v171 setIsCurrentDictationLanguageOnDevice:v173];
        }

        goto LABEL_58;
      }
      v79 = +[UIDictationController sharedInstance];
      uint64_t v91 = [v64 objectForKeyedSubscript:@"dictationResult"];
      uint64_t v101 = [v64 objectForKeyedSubscript:@"correctionIdentifier"];
      [v79 insertSerializedDictationResult:v91 withCorrectionIdentifier:v101];
    }

    goto LABEL_83;
  }
  if (![v62 isEqualToString:@"_UIKeyboardIndirectTextSelectionGestureState"])
  {
    if ([v62 isEqualToString:@"UITextSuggestion"])
    {
      id v70 = v63;
      v230 = [(UIKBRTIPartner *)v31 inputDelegate];
      [(UIKBRTIPartner *)v31 partnerDelegate];
      uint64_t v71 = v16;
      uint64_t v72 = v7;
      id v73 = v15;
      v74 = v45;
      unint64_t v75 = v47;
      v77 = id v76 = v63;
      [v77 insertCustomTextSuggestion:v70];

      unsigned int v63 = v76;
      unint64_t v78 = v75;
      uint64_t v45 = v74;
      id v15 = v73;
      uint64_t v7 = v72;
      id v16 = v71;
      unint64_t v47 = v78 | 2;

      goto LABEL_86;
    }
    if ([v62 isEqualToString:@"UIStickerRemoteInputOperations"])
    {
      uint64_t v82 = _UIStickerCreateStickerFromTextInputPayload(v63);
      v231 = [(UIKBRTIPartner *)v31 inputDelegate];
      [(UIKBRTIPartner *)v31 partnerDelegate];
      uint64_t v83 = v16;
      uint64_t v84 = v7;
      uint64_t v85 = v15;
      v86 = v45;
      unint64_t v87 = v47;
      uint64_t v89 = v88 = v63;
      [v89 insertSticker:v82];

      unsigned int v63 = v88;
      unint64_t v90 = v87;
      uint64_t v45 = v86;
      id v15 = v85;
      uint64_t v7 = v84;
      id v16 = v83;
      unint64_t v47 = v90 | 2;

LABEL_63:
      goto LABEL_86;
    }
    if ([v62 isEqualToString:@"UIKBRTICustomInfoTypeAutofill"])
    {
      objc_opt_class();
      v221 = v63;
      if (objc_opt_isKindOfClass()) {
        v93 = v63;
      }
      else {
        v93 = 0;
      }
      id v94 = v93;
      uint64_t v95 = [v94 objectForKeyedSubscript:@"selector"];
      objc_opt_class();
      v96 = 0;
      if (objc_opt_isKindOfClass())
      {
        [v94 objectForKeyedSubscript:@"selector"];
        id v97 = v94;
        v98 = (NSString *)objc_claimAutoreleasedReturnValue();
        v96 = NSSelectorFromString(v98);

        id v94 = v97;
      }

      if (sel_isEqual(v96, sel_handleEventFromRemoteSource_insertAutofillContent_))
      {
        uint64_t v99 = [v94 objectForKeyedSubscript:@"autofillContent"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v100 = [(UIKBRTIPartner *)v229 partnerDelegate];
          [v100 handleEventFromRemoteSource_insertAutofillContent:v99];
          goto LABEL_130;
        }
        v100 = _UIKeyboardLog();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
          goto LABEL_130;
        }
        *(_WORD *)buf = 0;
        uint64_t v120 = "Value for 'autofillContent' is not a dictionary (customInfoType: Autofill)";
      }
      else
      {
        unsigned int v63 = v221;
        if (!sel_isEqual(v96, sel_handleEventFromRemoteSource_autoFillAuthentication_))
        {
          if (sel_isEqual(v96, sel_handleEventFromRemoteSource_autoFillIsMenuPresented_))
          {
            uint64_t v99 = [(UIKBRTIPartner *)v229 partnerDelegate];
            [v94 objectForKeyedSubscript:@"isMenuPresented"];
            v122 = id v121 = v94;
            -[NSObject handleEventFromRemoteSource_autoFillIsMenuPresented:](v99, "handleEventFromRemoteSource_autoFillIsMenuPresented:", [v122 BOOLValue]);

            id v94 = v121;
          }
          else
          {
            uint64_t v99 = _UIKeyboardLog();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1853B0000, v99, OS_LOG_TYPE_ERROR, "Unexpected value for 'selector' (customInfoType: Autofill)", buf, 2u);
            }
          }
          goto LABEL_131;
        }
        uint64_t v99 = [v94 objectForKeyedSubscript:@"isAuthenticating"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v99 BOOLValue])
          {
            uint64_t v117 = v229;
            uint64_t v118 = v16;
          }
          else
          {
            uint64_t v117 = v229;
            uint64_t v118 = 0;
          }
          [(UIKBRTIPartner *)v117 setAuthenticatingSessionIdentifier:v118];
          goto LABEL_131;
        }
        v100 = _UIKeyboardLog();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
LABEL_130:

          unsigned int v63 = v221;
LABEL_131:

LABEL_132:
          id v31 = v229;
          goto LABEL_86;
        }
        *(_WORD *)buf = 0;
        uint64_t v120 = "Value for 'isAuthenticating' is not a NSNumber (customInfoType: Autofill)";
      }
      _os_log_error_impl(&dword_1853B0000, v100, OS_LOG_TYPE_ERROR, v120, buf, 2u);
      goto LABEL_130;
    }
    if ([v62 isEqualToString:@"UISupplementalLexiconOperations"])
    {
      v222 = v63;
      id v102 = v63;
      uint64_t v103 = [v102 objectForKeyedSubscript:@"selector"];
      if (v103)
      {
        int v104 = [v102 objectForKeyedSubscript:@"selector"];
        uint64_t v105 = NSSelectorFromString(v104);
      }
      else
      {
        uint64_t v105 = 0;
      }

      if (sel_isEqual(v105, sel_handleEventFromRemoteSource_insertSupplementalCandidate_textToCommit_))
      {
        id v119 = [v102 objectForKeyedSubscript:@"candidate"];
        uint64_t v131 = [v102 objectForKeyedSubscript:@"textToCommit"];
        objc_opt_class();
        id v31 = v229;
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(UIKBRTIPartner *)v229 partnerDelegate];
            v132 = id v205 = v119;
            objc_msgSend(v132, "handleEventFromRemoteSource_insertSupplementalCandidate:textToCommit:", v205, v131);

            id v119 = v205;
            v47 |= 2uLL;
          }
        }
      }
      else
      {
        id v31 = v229;
        if (!sel_isEqual(v105, sel_handleEventFromRemoteSource_insertionPointEnteredText_withSupplementalCandidate_))
        {
          if (sel_isEqual(v105, sel_handleEventFromRemoteSource_insertionPointExitedTextWithSupplementalItems))
          {
            id v119 = [(UIKBRTIPartner *)v229 partnerDelegate];
            objc_msgSend(v119, "handleEventFromRemoteSource_insertionPointExitedTextWithSupplementalItems");
          }
          else
          {
            if (sel_isEqual(v105, sel_handleEventFromRemoteSource_chooseSupplementalItem_toReplaceText_))
            {
              v146 = [v102 objectForKeyedSubscript:@"supplementalItems"];
              v204 = [v102 objectForKeyedSubscript:@"textToReplace"];
              id v147 = objc_alloc(MEMORY[0x1E4F1CA48]);
              uint64_t v148 = [v146 count];
              int v149 = v147;
              id v119 = v146;
              v210 = (void *)[v149 initWithCapacity:v148];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v203 = v102;
                long long v235 = 0u;
                long long v236 = 0u;
                long long v233 = 0u;
                long long v234 = 0u;
                v207 = v146;
                id obj = v146;
                uint64_t v150 = [obj countByEnumeratingWithState:&v233 objects:v239 count:16];
                if (v150)
                {
                  uint64_t v151 = v150;
                  uint64_t v152 = *(void *)v234;
                  do
                  {
                    for (uint64_t i = 0; i != v151; ++i)
                    {
                      if (*(void *)v234 != v152) {
                        objc_enumerationMutation(obj);
                      }
                      v154 = *(void **)(*((void *)&v233 + 1) + 8 * i);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v155 = supplementalItem([v154 identifier]);
                        if (v155) {
                          [v210 addObject:v155];
                        }
                      }
                    }
                    uint64_t v151 = [obj countByEnumeratingWithState:&v233 objects:v239 count:16];
                  }
                  while (v151);
                }

                id v31 = v229;
                id v102 = v203;
                id v119 = v207;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v63 = v222;
                if ([v210 count])
                {
                  [(UIKBRTIPartner *)v31 partnerDelegate];
                  v156 = id v208 = v119;
                  objc_msgSend(v156, "handleEventFromRemoteSource_chooseSupplementalItem:toReplaceText:", v210, v204);

                  id v119 = v208;
                  v47 |= 2uLL;
                }
              }
              else
              {
                unsigned int v63 = v222;
              }

              goto LABEL_127;
            }
            if (!sel_isEqual(v105, sel_handleEventFromRemoteSource_cancelChooseSupplementalItemToInsert))
            {
              unsigned int v63 = v222;
              goto LABEL_128;
            }
            id v119 = [(UIKBRTIPartner *)v229 partnerDelegate];
            objc_msgSend(v119, "handleEventFromRemoteSource_cancelChooseSupplementalItemToInsert");
          }
          goto LABEL_126;
        }
        id v119 = [v102 objectForKeyedSubscript:@"text"];
        uint64_t v131 = [v102 objectForKeyedSubscript:@"candidate"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(UIKBRTIPartner *)v229 partnerDelegate];
            v133 = id v206 = v119;
            objc_msgSend(v133, "handleEventFromRemoteSource_insertionPointEnteredText:withSupplementalCandidate:", v206, v131);

            id v119 = v206;
          }
        }
      }

LABEL_126:
      unsigned int v63 = v222;
      goto LABEL_127;
    }
    if ([v62 isEqualToString:@"UIPhysicalKeyboardEvent"])
    {
      id v119 = v63;
      id v102 = [(UIKBRTIPartner *)v31 partnerDelegate];
      [v102 performKeyboardEvent:v119];
LABEL_127:

      goto LABEL_128;
    }
    if ([v62 isEqualToString:@"UIKBRTICustomInfoTypeDeleteAction"])
    {
      id v123 = v63;
      id v102 = [(UIKBRTIPartner *)v31 partnerDelegate];
      v223 = v16;
      uint64_t v124 = v7;
      uint64_t v125 = v15;
      v126 = v45;
      unint64_t v127 = v47;
      uint64_t v128 = v63;
      uint64_t v129 = [v123 integerValue];

      uint64_t v130 = v129;
      unsigned int v63 = v128;
      unint64_t v47 = v127;
      uint64_t v45 = v126;
      id v15 = v125;
      uint64_t v7 = v124;
      id v16 = v223;
      [v102 handleAutoDeleteContinuationOnDestinationWithDeletionCount:v130];
LABEL_128:

      goto LABEL_86;
    }
    if ([v62 isEqualToString:@"UIWebKitOperations"])
    {
      v217 = v7;
      v220 = v63;
      id v64 = v63;
      v134 = [v64 objectForKeyedSubscript:@"selector"];
      if (v134)
      {
        v135 = [v64 objectForKeyedSubscript:@"selector"];
        v136 = NSSelectorFromString(v135);
      }
      else
      {
        v136 = 0;
      }

      if (sel_isEqual(v136, sel__handleWebKeyEvent_withIndex_inInputString_))
      {
        uint64_t v158 = [v64 objectForKeyedSubscript:@"event"];
        v159 = [v64 objectForKeyedSubscript:@"index"];
        uint64_t v160 = [v159 unsignedIntegerValue];

        v161 = (void *)v158;
        uint64_t v162 = [v64 objectForKeyedSubscript:@"inputString"];
        v163 = +[UIKeyboardImpl activeInstance];
        uint64_t v164 = v160;
        char v165 = (void *)v162;
        [v163 _handleWebKeyEvent:v161 withIndex:v164 inInputString:v162];
        uint64_t v7 = v217;
      }
      else
      {
        BOOL isEqual = sel_isEqual(v136, sel__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers_);
        uint64_t v7 = v217;
        if (!isEqual) {
          goto LABEL_85;
        }
        id obja = [v64 objectForKeyedSubscript:@"keyEvent"];
        v167 = [v64 objectForKeyedSubscript:@"webEventType"];
        uint64_t v211 = [v167 unsignedIntegerValue];

        char v165 = [v64 objectForKeyedSubscript:@"inputString"];
        v163 = [v64 objectForKeyedSubscript:@"inputStringIgnoringModifiers"];
        v209 = +[UIKeyboardImpl activeInstance];
        v161 = obja;
        [v209 _handleWebKeyEvent:obja withEventType:v211 withInputString:v165 withInputStringIgnoringModifiers:v163];
      }
      goto LABEL_85;
    }
    if ([v62 isEqualToString:@"UIEmojiSearchOperations"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v232 = [v63 BOOLValue];
        v137 = +[UIKeyboardImpl activeInstance];
        [v137 inputDelegateManager];
        v138 = v16;
        v139 = v7;
        v140 = v15;
        uint64_t v141 = v45;
        unint64_t v142 = v47;
        v144 = int v143 = v63;
        [v144 setShouldRespectForwardingInputDelegate:v232];

        unsigned int v63 = v143;
        unint64_t v47 = v142;
        uint64_t v45 = v141;
        id v15 = v140;
        uint64_t v7 = v139;
        id v16 = v138;
      }
      uint64_t v145 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      id v102 = [v145 remoteInputViewHost];

      [v102 updateInputViewsIfNecessary];
      goto LABEL_128;
    }
    if ([v62 isEqualToString:@"UIKBRTICustomInfoTypeUpdateInputMode"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_86;
      }
      uint64_t v82 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v63];
      v157 = +[UIKeyboardImpl activeInstance];
      [v157 setKeyboardInputMode:v82 userInitiated:1];

      goto LABEL_63;
    }
    if ([v62 isEqualToString:@"UIKBRTICustomInfoTypeTypologyLogOperations"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_86;
      }
      uint64_t v82 = +[UIKeyboardImpl activeInstance];
      [v82 presentKeyboardFeedbackAssistantViewControllerForLogURL:v63];
      goto LABEL_63;
    }
    if (![v62 isEqualToString:@"UIKBRTICustomInfoTypeKeyboardOperations"]) {
      goto LABEL_86;
    }
    id v224 = v6;
    if (sel_isEqual((SEL)[v6 editingActionSelector], sel_setFloating_))
    {
      +[UIKeyboardImpl setFloating:](UIKeyboardImpl, "setFloating:", [v63 BOOLValue]);
      goto LABEL_217;
    }
    if (sel_isEqual((SEL)[v6 editingActionSelector], sel_updateTextInputKeyboardSource_))
    {
      int v169 = +[UIKeyboardImpl activeInstance];
      [v169 updateTextInputKeyboardSource:v63];
    }
    else if (sel_isEqual((SEL)[v6 editingActionSelector], sel_becomeFirstResponderAndMakeVisible_))
    {
      int v169 = +[UIKeyboardImpl activeInstance];
      objc_msgSend(v169, "becomeFirstResponderAndMakeVisible:", objc_msgSend(v63, "BOOLValue"));
    }
    else
    {
      if (sel_isEqual((SEL)[v6 editingActionSelector], sel_resignFirstResponder))
      {
        int v169 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        v172 = [v169 responder];
        [v172 resignFirstResponder];
      }
      else
      {
        if (sel_isEqual((SEL)[v6 editingActionSelector], sel_postNotificationName_))
        {
          v174 = (void *)MEMORY[0x1E4F28EB8];
          id v175 = v63;
          int v169 = [v174 defaultCenter];
          v176 = [v175 objectForKeyedSubscript:@"name"];
          v177 = [v175 objectForKeyedSubscript:@"objecrt"];

          [v169 postNotificationName:v176 object:v177];
          goto LABEL_216;
        }
        if (sel_isEqual((SEL)[v6 editingActionSelector], sel_setIsExtended_))
        {
          id v31 = v229;
          v187 = [(UIKBRTIPartner *)v229 partnerDelegate];
          objc_msgSend(v187, "setCandidateDisplayIsExtended:", objc_msgSend(v63, "BOOLValue"));

          goto LABEL_86;
        }
        [v6 editingActionSelector];
        if (objc_opt_respondsToSelector())
        {
          +[UIAssistantBarButtonItemProvider performSelector:](UIAssistantBarButtonItemProvider, "performSelector:", [v6 editingActionSelector]);
          goto LABEL_132;
        }
        if (sel_isEqual((SEL)[v6 editingActionSelector], sel_setShiftStatesNeededInDestination_autoShifted_shiftLocked_))
        {
          int v188 = [v6 customInfo];
          long long v189 = v188;
          if (v188)
          {
            id v190 = [v188 objectForKeyedSubscript:@"autoShift"];
            unsigned int v218 = [v190 BOOLValue];

            long long v191 = [v189 objectForKeyedSubscript:@"shiftLocked"];
            uint64_t v192 = [v191 BOOLValue];

            BOOL v193 = [v189 objectForKeyedSubscript:@"shift"];
            uint64_t v194 = [v193 BOOLValue];

            v195 = [(UIKBRTIPartner *)v229 partnerDelegate];
            [v195 setShiftStatesNeededInDestination:v194 autoShifted:v218 shiftLocked:v192];
          }
          goto LABEL_217;
        }
        if (!sel_isEqual((SEL)[v6 editingActionSelector], sel_clearKeyboardSnapshot))
        {
LABEL_217:
          id v6 = v224;
          goto LABEL_132;
        }
        int v169 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        v172 = [v169 existingContainerRootController];
        [v172 clearKeyboardSnapshot];
      }
    }
LABEL_216:

    goto LABEL_217;
  }
  v68 = [(UIKBRTIPartner *)v31 partnerDelegate];
  [v68 setPerformingRemoteTextOperations:0];

  v31->_isNotifyingDelegateOfRemoteOutputOperation = 0;
  [v15 handleRemoteIndirectGestureWithState:v63];
  uint64_t v69 = [(UIKBRTIPartner *)v31 partnerDelegate];
  [v69 setPerformingRemoteTextOperations:1];

  v31->_isNotifyingDelegateOfRemoteOutputOperation = 1;
LABEL_86:
  [v15 _updateCanSuggestSupplementalItemsForCurrentSelection];
  uint64_t v106 = [v15 canSuggestSupplementalItemsForCurrentSelection];
  if (v225 != v106) {
    [(UIKBRTIPartner *)v31 forwardEventToRemoteSource_canSuggestSupplementalItemsForCurrentSelection:v106];
  }
  [v15 provideAutoFillTypingUpdatesIfNecessary];
  v31->_isNotifyingDelegateOfRemoteOutputOperation = 0;
  uint64_t v107 = [(UIKBRTIPartner *)v31 partnerDelegate];
  [v107 setPerformingRemoteTextOperations:0];

  uint64_t v108 = v227;
  if ((v47 & 2) != 0 || (v228 & 2) != 0) {
    [(UIKBRTIPartner *)v31 documentStateChanged:(v228 & 2) == 0];
  }
  if (((v47 >> 1) | v226) == 1)
  {
    id v109 = v6;
    uint64_t v110 = v16;
    uint64_t v111 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v112 = [v111 existingContainerRootController];
    v113 = [v112 presentedViewController];

    char v114 = [v113 conformsToProtocol:&unk_1ED5FDD50];
    if (v113 && (v114 & 1) == 0)
    {
      int v115 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v116 = [v115 existingContainerRootController];
      [v116 dismissViewControllerAnimated:1 completion:0];
    }
    id v16 = v110;
    id v6 = v109;
    uint64_t v108 = v227;
  }

LABEL_97:
  if (v7) {
    v7[2](v7, v47);
  }
}

void __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.png-sticker"])
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:@"url"];
    __int16 v8 = [v6 objectForKeyedSubscript:@"accessibilityLabel"];
    uint64_t v9 = +[UIKeyboardMediaController sharedKeyboardMediaController];
    [v9 stageStickerWithFileHandle:v10 url:v7 accessibilityLabel:v8];
  }
}

void __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([off_1E52D2A88 prefersTextAttachment])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v3 nominalTextAttachment], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      __int16 v8 = 0;
      goto LABEL_9;
    }
    id v5 = (void *)v4;
    id v6 = (void *)MEMORY[0x1E4F28B18];
    uint64_t v10 = *(void *)off_1E52D1F50;
    v11[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    __int16 v8 = [v6 attributedStringWithAttachment:v5 attributes:v7];

    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  __int16 v8 = [MEMORY[0x1E4F28B18] attributedStringWithAdaptiveImageGlyph:v3 attributes:MEMORY[0x1E4F1CC08]];
  if (v8)
  {
LABEL_7:
    uint64_t v9 = [*(id *)(a1 + 32) partnerDelegate];
    [v9 insertAttributedText:v8];
  }
LABEL_9:
}

void __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [*(id *)(a1 + 32) partnerDelegate];
    [v4 insertEmojiImageTextAttachment:v3];
  }
  else
  {
    __int16 v10 = -4;
    id v5 = [NSString stringWithCharacters:&v10 length:1];
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v11 = *(void *)off_1E52D1F50;
    v12[0] = v3;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    __int16 v8 = (void *)[v6 initWithString:v5 attributes:v7];

    uint64_t v9 = [*(id *)(a1 + 32) partnerDelegate];
    [v9 insertAttributedText:v8];
  }
}

- (unsigned)_performKeyboardOutputOperations:(id)a3
{
  id v4 = a3;
  id v5 = [v4 keyboardOutput];
  id v6 = v5;
  if (v5 && ([v5 _isEmpty] & 1) == 0)
  {
    __int16 v8 = UIKeyboardGetCurrentInputMode();
    uint64_t v9 = [v4 customInfoType];
    int v10 = [v9 isEqualToString:@"UIDictationRemoteTextOperations"];

    uint64_t v11 = [v4 multilingualLanguages];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v13 = UIKeyboardGetCurrentInputMode();
      int v14 = [v8 isEqualToString:v13];

      if (v14)
      {
        id v15 = +[UIKeyboardInputModeController sharedInputModeController];
        id v16 = [v15 currentInputMode];

        char v17 = [v4 multilingualLanguages];
        if ([v17 count])
        {
          int v18 = [v4 multilingualLanguages];
          [v16 setMultilingualLanguages:v18];
        }
        else
        {
          [v16 setMultilingualLanguages:0];
        }
      }
    }
    id v19 = [(UIKBRTIPartner *)self partnerDelegate];
    double v20 = v19;
    if (v10)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __51__UIKBRTIPartner__performKeyboardOutputOperations___block_invoke;
      uint64_t v27 = &unk_1E52D9F98;
      __int16 v28 = self;
      id v29 = v6;
      [v20 performOperations:&v24 withTextInputSource:2];

      unsigned int v7 = 1;
    }
    else
    {
      int v21 = [v19 performKeyboardOutput:v6 checkingDelegate:1 forwardToRemoteInputSource:0];

      if (v21) {
        unsigned int v7 = 1;
      }
      else {
        unsigned int v7 = 3;
      }
    }
    id v22 = [(UIKBRTIPartner *)self partnerDelegate];
    [v22 updateDocumentViewsAfterKeyboardOutput:v6];
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

void __51__UIKBRTIPartner__performKeyboardOutputOperations___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) partnerDelegate];
  [v2 performKeyboardOutput:*(void *)(a1 + 40) checkingDelegate:1 forwardToRemoteInputSource:0];
}

- (void)defaultDocumentRequestDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__UIKBRTIPartner_defaultDocumentRequestDidChange___block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __50__UIKBRTIPartner_defaultDocumentRequestDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateGeometryObserverIfNecessary];
  id v2 = *(void **)(a1 + 32);
  return [v2 documentStateChanged];
}

- (void)_performDocumentRequest:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void))a4;
  if (+[UIKeyboard isKeyboardProcess])
  {
    unsigned int v7 = [(UIKBRTIPartner *)self payloadDelegate];
    __int16 v8 = v7;
    if (v7)
    {
      [v7 performDocumentRequest:v9 completion:v6];
    }
    else if (v6)
    {
      v6[2](v6, 0);
    }
  }
  else
  {
    [(UIKBRTIPartner *)self performDocumentRequest:v9 completion:v6];
  }
}

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UIKBRTIPartner_performDocumentRequest_completion___block_invoke;
  block[3] = &unk_1E52E3298;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__UIKBRTIPartner_performDocumentRequest_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryDocumentRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_queryDocumentRequest:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(UIKBRTIPartner *)self partnerDelegate];
    id v8 = [v7 inputDelegateManager];
    int v9 = [v8 hasAsyncCapableInputDelegate];

    if (v9) {
      [(UIKBRTIPartner *)self _queryWKDocumentRequest:v10 completion:v6];
    }
    else {
      [(UIKBRTIPartner *)self _queryUIKitDocumentRequest:v10 completion:v6];
    }
  }
}

- (int64_t)_uiTextGranularityForRTITextGranularity:(int64_t)a3
{
  if ((unint64_t)a3 >= 6) {
    return 1;
  }
  else {
    return a3;
  }
}

- (CGRect)_selectionClipRect
{
  id v3 = [(UIKBRTIPartner *)self inputDelegate];
  char v4 = objc_opt_respondsToSelector();

  id v5 = [(UIKBRTIPartner *)self inputDelegate];
  id v6 = v5;
  if (v4)
  {
    [v5 selectionClipRect];
LABEL_5:
    CGFloat v12 = v7;
    CGFloat v13 = v8;
    CGFloat v14 = v9;
    CGFloat v15 = v10;

    goto LABEL_7;
  }
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v6 = [(UIKBRTIPartner *)self inputDelegate];
    [v6 _selectionClipRect];
    goto LABEL_5;
  }
  CGFloat v12 = *MEMORY[0x1E4F1DB20];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_7:
  v26.origin.x = v12;
  v26.origin.y = v13;
  v26.size.width = v14;
  v26.size.height = v15;
  if (CGRectIsNull(v26))
  {
    id v16 = [(UIKBRTIPartner *)self inputDelegate];
    char v17 = [v16 textInputView];
    [v17 bounds];
    CGFloat v12 = v18;
    CGFloat v13 = v19;
    CGFloat v14 = v20;
    CGFloat v15 = v21;
  }
  double v22 = v12;
  double v23 = v13;
  double v24 = v14;
  double v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)_addFirstSelectionRectToDocumentState:(id)a3
{
  id v76 = a3;
  char v4 = [(UIKBRTIPartner *)self inputDelegate];
  id v5 = [v4 textInputView];

  id v6 = [(UIKBRTIPartner *)self partnerDelegate];
  [v6 correctionRect];
  -[UIKBRTIPartner convertRect:from:](self, "convertRect:from:", v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(v76, "setFirstSelectionRectInWindow:", v8, v10, v12, v14);
  [(UIKBRTIPartner *)self _selectionClipRect];
  -[UIKBRTIPartner convertRect:from:](self, "convertRect:from:", v5);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  objc_msgSend(v76, "setClientFrameInWindow:");
  double v23 = [(UIKBRTIPartner *)self inputDelegate];
  double v24 = [(UIKBRTIPartner *)self inputDelegate];
  double v25 = [v24 selectedTextRange];
  CGRect v26 = [v25 start];
  [v23 caretRectForPosition:v26];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  -[UIKBRTIPartner convertRect:from:](self, "convertRect:from:", v5, v28, v30, v32, v34);
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  objc_msgSend(v76, "setCaretRectInWindow:");
  uint64_t v43 = [(UIKBRTIPartner *)self inputDelegate];
  uint64_t v44 = [(UIKBRTIPartner *)self inputDelegate];
  uint64_t v45 = [v44 beginningOfDocument];
  double v46 = [(UIKBRTIPartner *)self inputDelegate];
  unint64_t v47 = [v46 selectedTextRange];
  int v48 = [v47 start];
  uint64_t v49 = [v43 offsetFromPosition:v45 toPosition:v48];

  objc_msgSend(v76, "addTextRect:forCharacterRange:granularity:isVertical:", v49, 0, 0, 0, v36, v38, v40, v42);
  uint64_t v50 = [(UIKBRTIPartner *)self partnerDelegate];
  double v51 = [v50 textInputTraits];
  char v52 = [v51 insertionPointColor];

  id v53 = (void *)MEMORY[0x1E4F95E98];
  id v54 = v52;
  double v55 = objc_msgSend(v53, "colorWithCGColor:", objc_msgSend(v54, "CGColor"));
  [v76 setInsertionPointColor:v55];
  id v56 = [v5 window];
  double v57 = [v5 window];
  id v58 = [v57 screen];
  double v59 = [v58 coordinateSpace];
  objc_msgSend(v56, "convertRect:toCoordinateSpace:", v59, v16, v18, v20, v22);
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;

  v68 = [v5 window];
  LODWORD(v57) = [v68 _isHostedInAnotherProcess];

  if (v57)
  {
    uint64_t v69 = [v5 window];
    id v70 = [v69 windowScene];
    uint64_t v71 = +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:v70];
    [v71 hostedViewReference];
    double v73 = v72;
    double v75 = v74;

    double v61 = v61 + v73;
    double v63 = v63 + v75;
  }
  objc_msgSend(v76, "setClientFrameInEntitySpace:", v61, v63, v65, v67);
}

- (void)_addAutocorrectStylingToDocumentState:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKBRTIPartner *)self inputDelegate];
  id v26 = [v5 _fontForCaretSelection];

  id v6 = (void *)MEMORY[0x1E4F95F20];
  char v7 = [v26 isSystemFont];
  if (v7)
  {
    double v8 = 0;
  }
  else
  {
    double v8 = [v26 fontName];
  }
  [v26 pointSize];
  double v10 = v9;
  double v11 = [v26 fontDescriptor];
  double v12 = [v11 objectForKey:*(void *)off_1E52D6C08];
  [v12 doubleValue];
  double v14 = [v6 textStylingWithFontName:v8 fontSize:v10 fontWeight:v13];

  if ((v7 & 1) == 0) {
  [v4 setAutocorrectBubbleStyling:v14];
  }
  double v15 = [(UIKBRTIPartner *)self inputDelegate];
  double v16 = [v15 _textColorForCaretSelection];

  double v17 = (void *)MEMORY[0x1E4F95E98];
  id v18 = v16;
  double v19 = objc_msgSend(v17, "colorWithCGColor:", objc_msgSend(v18, "CGColor"));
  [v4 setAutocorrectTextColor:v19];
  double v20 = [(UIKBRTIPartner *)self partnerDelegate];
  double v21 = [v20 textInputTraits];
  double v22 = [v21 selectionHighlightColor];

  double v23 = (void *)MEMORY[0x1E4F95E98];
  id v24 = v22;
  double v25 = objc_msgSend(v23, "colorWithCGColor:", objc_msgSend(v24, "CGColor"));
  [v4 setAutocorrectTextBackgroundColor:v25];
}

- (void)_addMergedTextRectsToDocumentState:(id)a3 forWKContext:(id)a4 textInputView:(id)a5 granularity:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = [v11 fullText];
  CFIndex v14 = [(__CFString *)v13 length];
  wkRectTokenizer = self->_wkRectTokenizer;
  if (wkRectTokenizer)
  {
    v35.location = 0;
    v35.length = v14;
    CFStringTokenizerSetString(wkRectTokenizer, v13, v35);
  }
  else
  {
    if ((unint64_t)(a6 - 1) > 3) {
      CFOptionFlags v16 = 0;
    }
    else {
      CFOptionFlags v16 = qword_186B9AD18[a6 - 1];
    }
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFLocaleRef v18 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
    v36.location = 0;
    v36.length = v14;
    self->_wkRectTokenizer = CFStringTokenizerCreate(v17, v13, v36, v16, v18);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__UIKBRTIPartner__addMergedTextRectsToDocumentState_forWKContext_textInputView_granularity___block_invoke;
  aBlock[3] = &unk_1E52FDA58;
  void aBlock[4] = self;
  double v19 = _Block_copy(aBlock);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x4010000000;
  v31[3] = &unk_186D7DBA7;
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v32 = *MEMORY[0x1E4F1DB20];
  long long v33 = v20;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3010000000;
  v30[0] = 0;
  v30[1] = 0;
  void v29[3] = &unk_186D7DBA7;
  if ((*((uint64_t (**)(void *, void *))v19 + 2))(v19, v30))
  {
    uint64_t v21 = [(__CFString *)v13 length];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92__UIKBRTIPartner__addMergedTextRectsToDocumentState_forWKContext_textInputView_granularity___block_invoke_2;
    v22[3] = &unk_1E52FDA80;
    id v26 = v29;
    id v25 = v19;
    double v27 = v31;
    id v23 = v10;
    id v24 = v12;
    int64_t v28 = a6;
    objc_msgSend(v11, "enumerateLayoutRectsWithOptions:characterRange:block:", 0, 0, v21, v22);
  }
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

BOOL __92__UIKBRTIPartner__addMergedTextRectsToDocumentState_forWKContext_textInputView_granularity___block_invoke(uint64_t a1, CFRange *a2)
{
  CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)(*(void *)(a1 + 32) + 32));
  if (Token) {
    *a2 = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(void *)(*(void *)(a1 + 32) + 32));
  }
  return Token != 0;
}

void __92__UIKBRTIPartner__addMergedTextRectsToDocumentState_forWKContext_textInputView_granularity___block_invoke_2(void *a1, unint64_t a2, uint64_t a3, unsigned char *a4, double x, double y, double width, double height)
{
  while (1)
  {
    uint64_t v16 = *(void *)(a1[7] + 8);
    unint64_t v17 = *(void *)(v16 + 32);
    if (*(void *)(v16 + 40) + v17 >= a2) {
      break;
    }
    if (((*(uint64_t (**)(void))(a1[6] + 16))() & 1) == 0) {
      goto LABEL_3;
    }
  }
  unint64_t v18 = a2 + a3;
  if (v18 > v17)
  {
    if (!CGRectIsNull(*(CGRect *)(*(void *)(a1[8] + 8) + 32)))
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      CGRect v26 = CGRectUnion(*(CGRect *)(*(void *)(a1[8] + 8) + 32), v27);
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
    }
    double v19 = *(double **)(a1[8] + 8);
    void v19[4] = x;
    v19[5] = y;
    v19[6] = width;
    v19[7] = height;
    if (v18 == *(void *)(*(void *)(a1[7] + 8) + 40) + *(void *)(*(void *)(a1[7] + 8) + 32))
    {
      long long v20 = (void *)a1[4];
      uint64_t v21 = (void *)a1[5];
      double v22 = *(double **)(a1[8] + 8);
      id v23 = [v21 window];
      objc_msgSend(v21, "convertRect:toView:", v23, v22[4], v22[5], v22[6], v22[7]);
      [v20 addTextRect:*(void *)(*(void *)(a1[7] + 8) + 32) forCharacterRange:*(void *)(*(void *)(a1[7] + 8) + 40) granularity:a1[9] isVertical:0];

      uint64_t v24 = *(void *)(a1[8] + 8);
      long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)(v24 + 32) = *MEMORY[0x1E4F1DB20];
      *(_OWORD *)(v24 + 48) = v25;
      if (((*(uint64_t (**)(void))(a1[6] + 16))() & 1) == 0) {
LABEL_3:
      }
        *a4 = 1;
    }
  }
}

- (void)_queryWKDocumentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UIKBRTIPartner *)self inputDelegate];
  double v9 = [v8 textInputView];
  id v10 = _UIKeyboardLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = _UIKeyboardLog();
  double v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "queryWKDocument", "", buf, 2u);
  }

  CFIndex v14 = objc_alloc_init(UIWKDocumentRequest);
  int64_t v15 = -[UIKBRTIPartner _uiTextGranularityForRTITextGranularity:](self, "_uiTextGranularityForRTITextGranularity:", [v6 textGranularity]);
  char v16 = [v6 flags];
  uint64_t v17 = [v6 flags] & 2 | v16 & 1;
  if (([v6 flags] & 4) != 0) {
    unint64_t v18 = v17 | 0x24;
  }
  else {
    unint64_t v18 = v17;
  }
  if (_os_feature_enabled_impl()) {
    unint64_t v18 = v18 & 0xFFFFFFFFFFFFFFBFLL | ((((unint64_t)[v6 flags] >> 3) & 1) << 6);
  }
  -[UIWKDocumentRequest setFlags:](v14, "setFlags:", [v6 flags] & 0x10 | v18);
  [(UIWKDocumentRequest *)v14 setSurroundingGranularity:v15];
  -[UIWKDocumentRequest setGranularityCount:](v14, "setGranularityCount:", [v6 surroundingGranularityCount]);
  if (([v6 flags] & 8) != 0)
  {
    double v19 = [(UIKBRTIPartner *)self partnerDelegate];
    long long v20 = [v19 inputDelegateManager];
    [v20 visibleTextRect];
    -[UIWKDocumentRequest setDocumentRect:](v14, "setDocumentRect:");
  }
  int64_t v21 = -[UIKBRTIPartner _uiTextGranularityForRTITextGranularity:](self, "_uiTextGranularityForRTITextGranularity:", [v6 rectGranularity]);
  unsigned int v22 = [v6 flags];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__UIKBRTIPartner__queryWKDocumentRequest_completion___block_invoke;
  aBlock[3] = &unk_1E52FDAD0;
  id v35 = v6;
  id v36 = v8;
  int v23 = (v21 != 0) & (v22 >> 2);
  if (v21 == v15) {
    LOBYTE(v23) = 0;
  }
  char v43 = v23;
  double v37 = self;
  id v38 = v9;
  int64_t v40 = v21;
  int64_t v41 = v15;
  os_signpost_id_t v42 = v11;
  id v24 = v7;
  id v39 = v24;
  id v25 = v9;
  id v26 = v8;
  id v27 = v6;
  int64_t v28 = _Block_copy(aBlock);
  double v29 = [(UIKBRTIPartner *)self partnerDelegate];
  double v30 = [v29 inputDelegateManager];
  double v31 = [v30 asyncCapableInputDelegate];

  if (v31)
  {
    long long v32 = [(UIKBRTIPartner *)self partnerDelegate];
    long long v33 = [v32 inputDelegateManager];
    [v33 requestDocumentContext:v14 completionHandler:v28];
  }
  else
  {
    (*((void (**)(id, void))v24 + 2))(v24, 0);
  }
}

void __53__UIKBRTIPartner__queryWKDocumentRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F95EA8] documentStateWithRequest:*(void *)(a1 + 32)];
  id v22 = objc_alloc(MEMORY[0x1E4FAE2A8]);
  int v23 = [v3 contextBefore];
  id v5 = _stringForObject(v23);
  id v6 = [v3 markedText];
  id v7 = _stringForObject(v6);
  double v8 = [v3 selectedText];
  double v9 = _stringForObject(v8);
  id v10 = [v3 contextAfter];
  os_signpost_id_t v11 = _stringForObject(v10);
  id v24 = v3;
  uint64_t v12 = [v3 selectedRangeInMarkedText];
  CFIndex v14 = objc_msgSend(v22, "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", v5, v7, v9, v11, v12, v13);

  [v4 setDocumentState:v14];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "setHasText:", objc_msgSend(*(id *)(a1 + 40), "hasText"));
  }
  int64_t v15 = [v24 annotatedText];
  [v4 setTextCheckingAnnotatedString:v15];

  [*(id *)(a1 + 48) _addFirstSelectionRectToDocumentState:v4];
  if (([*(id *)(a1 + 32) flags] & 0x20) != 0) {
    [*(id *)(a1 + 48) _addAutocorrectStylingToDocumentState:v4];
  }
  if (*(unsigned char *)(a1 + 96))
  {
    [*(id *)(a1 + 48) _addMergedTextRectsToDocumentState:v4 forWKContext:v24 textInputView:*(void *)(a1 + 56) granularity:*(void *)(a1 + 72)];
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __53__UIKBRTIPartner__queryWKDocumentRequest_completion___block_invoke_2;
    void v26[3] = &unk_1E52FDAA8;
    char v16 = *(void **)(a1 + 56);
    v26[4] = *(void *)(a1 + 48);
    id v27 = v16;
    id v17 = v4;
    uint64_t v18 = *(void *)(a1 + 80);
    id v28 = v17;
    uint64_t v29 = v18;
    [v24 enumerateLayoutRects:v26];
  }
  double v19 = _UIKeyboardLog();
  long long v20 = v19;
  os_signpost_id_t v21 = *(void *)(a1 + 88);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v20, OS_SIGNPOST_INTERVAL_END, v21, "queryWKDocument", "", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __53__UIKBRTIPartner__queryWKDocumentRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "convertRect:from:", *(void *)(a1 + 40));
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  return [v6 addTextRect:a2 forCharacterRange:a3 granularity:v7 isVertical:0];
}

- (void)_queryUIKitDocumentRequest:(id)a3 completion:(id)a4
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  double v8 = _UIKeyboardLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = _UIKeyboardLog();
  os_signpost_id_t v11 = v10;
  unint64_t v185 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "queryUIKitDocument", "", buf, 2u);
  }
  spint64_t id = v9;

  uint64_t v12 = [(UIKBRTIPartner *)self inputDelegate];
  long long v189 = [v12 textInputView];
  int64_t v13 = -[UIKBRTIPartner _uiTextGranularityForRTITextGranularity:](self, "_uiTextGranularityForRTITextGranularity:", [v6 textGranularity]);
  CFIndex v14 = [(UIKBRTIPartner *)self partnerDelegate];
  int64_t v15 = [v14 textInputTraits];

  if (([v15 isSecureTextEntry] & 1) != 0
    || ([v15 recentInputIdentifier],
        char v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v16))
  {
    int64_t v13 = 5;
  }
  id v17 = [v12 selectedTextRange];
  uint64_t v18 = [v12 markedTextRange];
  long long v191 = self;
  if (v18)
  {
    double v19 = (void *)v18;
    long long v20 = [v12 markedTextRange];
    char v21 = [v20 isEmpty];

    if (v21)
    {
      int v183 = 0;
    }
    else
    {
      uint64_t v22 = [v12 markedTextRange];

      int v183 = 1;
      id v17 = (void *)v22;
    }
    self = v191;
  }
  else
  {
    int v183 = 0;
  }
  int v23 = [MEMORY[0x1E4F95EA8] documentStateWithRequest:v6];
  if (!v17)
  {
    id v38 = _UIKeyboardLog();
    id v39 = v38;
    if (v185 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    goto LABEL_50;
  }
  char v168 = [v6 flags];
  if ((v168 & 8) == 0)
  {
    id v24 = [v17 start];
    id v25 = v17;
    id v26 = [v17 end];
    goto LABEL_16;
  }
  int64_t v40 = [(UIKBRTIPartner *)self partnerDelegate];
  int64_t v41 = [v40 inputDelegateManager];
  [v41 visibleTextRect];
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;

  v206.origin.x = v43;
  v206.origin.y = v45;
  v206.size.width = v47;
  v206.size.height = v49;
  double MinX = CGRectGetMinX(v206);
  v207.origin.x = v43;
  v207.origin.y = v45;
  v207.size.width = v47;
  v207.size.height = v49;
  uint64_t v51 = objc_msgSend(v12, "closestPositionToPoint:", MinX, CGRectGetMinY(v207));
  if (!v51)
  {
    uint64_t v69 = _UIKeyboardLog();
    id v39 = v69;
    if (v185 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v69)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
LABEL_50:
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v39, OS_SIGNPOST_INTERVAL_END, spid, "queryUIKitDocument", "", buf, 2u);
LABEL_51:

    v7[2](v7, v23);
    goto LABEL_159;
  }
  id v24 = (void *)v51;
  id v25 = v17;
  if ([v12 baseWritingDirectionForPosition:v51 inDirection:0] == 1)
  {
    v208.origin.x = v43;
    v208.origin.y = v45;
    v208.size.width = v47;
    v208.size.height = v49;
    double MaxX = CGRectGetMaxX(v208);
    v209.origin.x = v43;
    v209.origin.y = v45;
    v209.size.width = v47;
    v209.size.height = v49;
    uint64_t v53 = objc_msgSend(v12, "closestPositionToPoint:", MaxX, CGRectGetMinY(v209));

    id v24 = (void *)v53;
  }
  v210.origin.x = v43;
  v210.origin.y = v45;
  v210.size.width = v47;
  v210.size.height = v49;
  double v54 = CGRectGetMaxX(v210);
  v211.origin.x = v43;
  v211.origin.y = v45;
  v211.size.width = v47;
  v211.size.height = v49;
  uint64_t v55 = objc_msgSend(v12, "closestPositionToPoint:", v54, CGRectGetMaxY(v211));
  if (v55)
  {
    id v26 = (void *)v55;
    if ([v12 baseWritingDirectionForPosition:v55 inDirection:0] == 1)
    {
      v212.origin.x = v43;
      v212.origin.y = v45;
      v212.size.width = v47;
      v212.size.height = v49;
      double v56 = CGRectGetMinX(v212);
      v213.origin.x = v43;
      v213.origin.y = v45;
      v213.size.width = v47;
      v213.size.height = v49;
      uint64_t v57 = objc_msgSend(v12, "closestPositionToPoint:", v56, CGRectGetMaxY(v213));

      id v26 = (void *)v57;
    }
LABEL_16:
    int v188 = v23;
    uint64_t v170 = v15;
    uint64_t v173 = v7;
    if (([v6 surroundingGranularityCount] & 0x8000000000000000) == 0)
    {
      uint64_t v27 = 0;
      while (1)
      {
        id v28 = [v12 tokenizer];
        uint64_t v29 = [v28 positionFromPosition:v24 toBoundary:v13 inDirection:1];

        double v30 = [v12 tokenizer];
        uint64_t v31 = [v30 positionFromPosition:v26 toBoundary:v13 inDirection:0];

        if (!(v29 | v31)) {
          break;
        }
        if (v29) {
          long long v32 = (void *)v29;
        }
        else {
          long long v32 = v24;
        }
        id v33 = v32;

        if (v31) {
          double v34 = (void *)v31;
        }
        else {
          double v34 = v26;
        }
        id v35 = v34;

        ++v27;
        uint64_t v36 = [v6 surroundingGranularityCount];
        id v37 = v35;
        id v24 = v33;
        id v26 = v37;
        if (v36 < v27) {
          goto LABEL_37;
        }
      }
    }
    id v37 = v26;
    id v33 = v24;
LABEL_37:
    double v182 = v37;
    int v184 = v33;
    id v17 = v25;
    id v58 = [v25 start];
    id v59 = [v25 end];
    if (v58 || !v59)
    {
      double v60 = v173;
      if (v59 || !v58)
      {
LABEL_43:
        id v61 = v59;
        id v62 = v25;
        id v63 = v62;
        double v64 = 0;
        uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
        BOOL v181 = v58;
        v167 = v62;
        double v66 = 0;
        if (!v58)
        {
          uint64_t v67 = 0;
          uint64_t v180 = v62;
          v68 = 0;
          goto LABEL_78;
        }
        uint64_t v67 = 0;
        uint64_t v180 = v62;
        v68 = 0;
        if (!v61) {
          goto LABEL_78;
        }
        if (([v6 flags] & 1) == 0)
        {
          double v64 = 0;
          double v66 = 0;
          uint64_t v67 = 0;
          v68 = 0;
          uint64_t v180 = v63;
          goto LABEL_78;
        }
        uint64_t v70 = [v12 comparePosition:v184 toPosition:v181];
        uint64_t v71 = [v12 comparePosition:v184 toPosition:v61];
        uint64_t v72 = [v12 comparePosition:v182 toPosition:v181];
        uint64_t v73 = [v12 comparePosition:v182 toPosition:v61];
        if (v70 == 1 && v71 == 1)
        {
          double v74 = [v12 textRangeFromPosition:v184 toPosition:v182];
          uint64_t v75 = [v12 textInRange:v74];
          v174 = 0;
LABEL_63:
          uint64_t v176 = 0;
LABEL_64:
          uint64_t v180 = v167;
LABEL_65:

          goto LABEL_66;
        }
        if (v70 == 1 && v73 == 1)
        {
          double v74 = [v12 textRangeFromPosition:v184 toPosition:v61];
          v174 = [v12 textInRange:v74];
          unint64_t v78 = [v12 textRangeFromPosition:v61 toPosition:v182];
          uint64_t v75 = [v12 textInRange:v78];

          goto LABEL_63;
        }
        if (v70 != 1 && v73 != -1)
        {
          double v74 = [v12 textRangeFromPosition:v184 toPosition:v181];
          uint64_t v176 = [v12 textInRange:v74];
          uint64_t v84 = [v12 textRangeFromPosition:v181 toPosition:v61];

          uint64_t v180 = (void *)v84;
          v174 = [v12 textInRange:v84];
          uint64_t v85 = [v12 textRangeFromPosition:v61 toPosition:v182];
          uint64_t v75 = [v12 textInRange:v85];

          goto LABEL_65;
        }
        if (v72 == 1 && v73 != 1)
        {
          double v74 = [v12 textRangeFromPosition:v184 toPosition:v181];
          uint64_t v176 = [v12 textInRange:v74];
          uint64_t v158 = [v12 textRangeFromPosition:v181 toPosition:v182];
          v174 = [v12 textInRange:v158];

LABEL_166:
          uint64_t v75 = 0;
          goto LABEL_64;
        }
        uint64_t v75 = 0;
        if (v72 == 1)
        {
          uint64_t v180 = v167;
          v174 = 0;
          uint64_t v176 = 0;
        }
        else
        {
          uint64_t v180 = v167;
          v174 = 0;
          uint64_t v176 = 0;
          if (v73 != 1)
          {
            double v74 = [v12 textRangeFromPosition:v184 toPosition:v182];
            [v12 textInRange:v74];
            uint64_t v176 = v174 = 0;
            goto LABEL_166;
          }
        }
LABEL_66:
        uint64_t v171 = v75;
        if (v183)
        {
          v79 = [v12 selectedTextRange];
          char v80 = [v79 start];
          uint64_t v65 = [v12 offsetFromPosition:v181 toPosition:v80];

          v81 = [v79 start];
          [v79 end];
          v83 = uint64_t v82 = v17;
          uint64_t v67 = [v12 offsetFromPosition:v81 toPosition:v83];

          id v17 = v82;
        }
        else
        {
          uint64_t v67 = 0;
          uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v174)
        {
          if ([v174 length])
          {
            double v64 = (void *)v176;
            v68 = v174;
LABEL_77:
            double v66 = (void *)v171;
            double v60 = v173;
LABEL_78:
            v86 = v68;
            id v87 = objc_alloc(MEMORY[0x1E4FAE2A8]);
            if (v183) {
              v88 = v86;
            }
            else {
              v88 = 0;
            }
            id v175 = v86;
            v177 = v64;
            if (v183) {
              uint64_t v89 = 0;
            }
            else {
              uint64_t v89 = v86;
            }
            int v169 = objc_msgSend(v87, "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", v64, v88, v89, v66, v65, v67);
            objc_msgSend(v188, "setDocumentState:");
            objc_msgSend(v188, "setHasText:", objc_msgSend(v12, "hasText"));
            [(UIKBRTIPartner *)v191 _addFirstSelectionRectToDocumentState:v188];
            if (([v6 flags] & 0x10) != 0) {
              [(UIKBRTIPartner *)v191 _addTextCheckingAnnotatedStringToDocumentState:v188];
            }
            v172 = v66;
            unint64_t v90 = v181;
            uint64_t v91 = v61;
            int v23 = v188;
            if (([v6 flags] & 0x20) != 0) {
              [(UIKBRTIPartner *)v191 _addAutocorrectStylingToDocumentState:v188];
            }
            uint64_t v7 = v60;
            if (([v6 flags] & 4) == 0) {
              goto LABEL_153;
            }
            v92 = _UIKeyboardLog();
            os_signpost_id_t v93 = os_signpost_id_generate(v92);

            id v94 = _UIKeyboardLog();
            uint64_t v95 = v94;
            unint64_t v96 = v93 - 1;
            if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1853B0000, v95, OS_SIGNPOST_INTERVAL_BEGIN, v93, "queryUIKitDocument.addRects", "", buf, 2u);
            }

            uint64_t v190 = -[UIKBRTIPartner _uiTextGranularityForRTITextGranularity:](v191, "_uiTextGranularityForRTITextGranularity:", [v6 rectGranularity]);
            if (v190 == 5)
            {
              uint64_t v97 = [v12 offsetFromPosition:v184 toPosition:v182];
              [v12 firstRectForRange:v167];
              -[UIKBRTIPartner convertRect:from:](v191, "convertRect:from:", v189);
              [v188 addTextRect:0 forCharacterRange:v97 granularity:5];
              os_signpost_id_t v98 = v93;
              unint64_t v90 = v181;
LABEL_141:
              if (v183)
              {
                id v147 = [v12 markedTextRange];
                -[UIKBRTIPartner _addCharacterRectsToDocumentState:textRange:offset:](v191, "_addCharacterRectsToDocumentState:textRange:offset:", v23, v147, [v177 length]);
              }
              else if ((v168 & 8) == 0)
              {
                uint64_t v148 = [v177 length];
                [v167 isEmpty];
                if (v91)
                {
                  int v149 = [v12 _rangeOfEnclosingWord:v91];
                  uint64_t v150 = v149;
                  if (v149)
                  {
                    unint64_t v166 = v96;
                    id v151 = v149;

                    uint64_t v152 = [v151 start];
                    uint64_t v148 = [v12 offsetFromPosition:v184 toPosition:v152];

                    int v23 = v188;
                    uint64_t v180 = v151;
                    unint64_t v96 = v166;
                  }

                  unint64_t v90 = v181;
                }
                -[UIKBRTIPartner _addCharacterRectsToDocumentState:textRange:offset:](v191, "_addCharacterRectsToDocumentState:textRange:offset:", v23, v180, v148, v159);
              }
LABEL_149:
              v153 = _UIKeyboardLog();
              v154 = v153;
              if (v96 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v153))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1853B0000, v154, OS_SIGNPOST_INTERVAL_END, v98, "queryUIKitDocument.addRects", "", buf, 2u);
              }

LABEL_153:
              if (objc_opt_respondsToSelector())
              {
                int v155 = [(UIKBRTIPartner *)v191 partnerDelegate];
                objc_msgSend(v23, "setScrolling:", objc_msgSend(v155, "selectionScrolling"));
              }
              v156 = _UIKeyboardLog();
              v157 = v156;
              if (v185 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v156))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1853B0000, v157, OS_SIGNPOST_INTERVAL_END, spid, "queryUIKitDocument", "", buf, 2u);
              }

              v7[2](v7, v23);
              int64_t v15 = v170;
              goto LABEL_159;
            }
            os_signpost_id_t v161 = v93;
            uint64_t v162 = v91;
            v163 = v17;
            uint64_t v99 = v12;
            uint64_t v100 = [v6 rectCountBefore];
            uint64_t v101 = v100;
            uint64_t v102 = *MEMORY[0x1E4F95F28];
            if (v100 <= *MEMORY[0x1E4F95F28]) {
              uint64_t v103 = *MEMORY[0x1E4F95F28];
            }
            else {
              uint64_t v103 = v100;
            }
            [v6 surroundingGranularityCount];
            uint64_t v104 = [v6 rectCountAfter];
            uint64_t v105 = v104;
            if (v104 <= v102) {
              uint64_t v106 = v102;
            }
            else {
              uint64_t v106 = v104;
            }
            uint64_t v186 = v106;
            unint64_t v165 = v96;
            if (v102 >= v101)
            {
              id v111 = v184;
            }
            else
            {
              uint64_t v107 = [v180 start];
              if ((v103 & 0x8000000000000000) == 0)
              {
                uint64_t v108 = 0;
                while (1)
                {
                  id v109 = [v99 tokenizer];
                  uint64_t v110 = [v109 positionFromPosition:v107 toBoundary:v190 inDirection:1];

                  if (!v110 || [v99 comparePosition:v110 toPosition:v184] == -1) {
                    break;
                  }
                  id v111 = v110;

                  ++v108;
                  uint64_t v107 = v111;
                  if (v103 < v108) {
                    goto LABEL_110;
                  }
                }
              }
              id v111 = v107;
            }
LABEL_110:
            if (v102 >= v105)
            {
              id v118 = v182;
              uint64_t v12 = v99;
            }
            else
            {
              uint64_t v112 = [v180 end];
              v113 = (void *)v112;
              uint64_t v12 = v99;
              if ((v186 & 0x8000000000000000) == 0)
              {
                uint64_t v114 = 0;
                int v115 = v184;
                while (1)
                {
                  v116 = [v99 tokenizer];
                  uint64_t v117 = [v116 positionFromPosition:v113 toBoundary:v190 inDirection:0];

                  if (!v117 || [v99 comparePosition:v182 toPosition:v117] == -1) {
                    break;
                  }
                  id v118 = v117;

                  ++v114;
                  v113 = v118;
                  if (v186 < v114) {
                    goto LABEL_121;
                  }
                }

                id v118 = v113;
LABEL_121:
                id v119 = v111;
                uint64_t v120 = [v12 offsetFromPosition:v115 toPosition:v119];
                if (v120 < 0)
                {
                  v122 = _UIKeyboardLog();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315906;
                    uint64_t v198 = "-[UIKBRTIPartner _queryUIKitDocumentRequest:completion:]";
                    __int16 v199 = 2048;
                    uint64_t v200 = v120;
                    __int16 v201 = 2112;
                    v202 = v115;
                    __int16 v203 = 2112;
                    id v204 = v119;
                    _os_log_error_impl(&dword_1853B0000, v122, OS_LOG_TYPE_ERROR, "%s negative offset=%lu from start=%@ to rectStart=%@", buf, 0x2Au);
                  }
                }
                id v164 = v6;
                id v123 = 0;
                uint64_t v124 = 0;
                uint64_t v125 = v120 & ~(v120 >> 63);
                *(void *)&long long v121 = 136315394;
                long long v159 = v121;
                uint64_t v160 = v119;
                v126 = v119;
                id v179 = v118;
                do
                {
                  unint64_t v127 = v123;
                  id v123 = v126;

                  uint64_t v128 = [v12 tokenizer];
                  v126 = [v128 positionFromPosition:v123 toBoundary:v190 inDirection:0];

                  if (!v126) {
                    break;
                  }
                  uint64_t v129 = [v12 textRangeFromPosition:v123 toPosition:v126];
                  uint64_t v130 = _UIKeyboardLog();
                  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = v159;
                    uint64_t v198 = "-[UIKBRTIPartner _queryUIKitDocumentRequest:completion:]";
                    __int16 v199 = 2112;
                    uint64_t v200 = v129;
                    _os_log_debug_impl(&dword_1853B0000, v130, OS_LOG_TYPE_DEBUG, "%s calling selectionRectsForRange:%@", buf, 0x16u);
                  }
                  v125 += v124;

                  v187 = (void *)v129;
                  uint64_t v131 = [v12 selectionRectsForRange:v129];
                  long long v192 = 0u;
                  long long v193 = 0u;
                  long long v194 = 0u;
                  long long v195 = 0u;
                  id v132 = v131;
                  uint64_t v133 = [v132 countByEnumeratingWithState:&v192 objects:v196 count:16];
                  if (v133)
                  {
                    uint64_t v134 = v133;
                    uint64_t v135 = *(void *)v193;
                    do
                    {
                      for (uint64_t i = 0; i != v134; ++i)
                      {
                        if (*(void *)v193 != v135) {
                          objc_enumerationMutation(v132);
                        }
                        v137 = *(void **)(*((void *)&v192 + 1) + 8 * i);
                        objc_msgSend(v137, "rect", v159);
                        if (v138 != 0.0)
                        {
                          [v137 rect];
                          -[UIKBRTIPartner convertRect:from:](v191, "convertRect:from:", v189);
                          double v140 = v139;
                          double v142 = v141;
                          double v144 = v143;
                          double v146 = v145;
                          uint64_t v124 = [v99 offsetFromPosition:v123 toPosition:v126];
                          objc_msgSend(v188, "addTextRect:forCharacterRange:granularity:isVertical:", v125, v124, v190, objc_msgSend(v137, "isVertical"), v140, v142, v144, v146);
                        }
                      }
                      uint64_t v134 = [v132 countByEnumeratingWithState:&v192 objects:v196 count:16];
                    }
                    while (v134);
                  }

                  uint64_t v12 = v99;
                  id v118 = v179;
                  if (![v99 comparePosition:v126 toPosition:v123]) {
                    break;
                  }
                }
                while ([v99 comparePosition:v126 toPosition:v179] == -1);

                id v17 = v163;
                id v6 = v164;
                uint64_t v7 = v173;
                int v23 = v188;
                unint64_t v90 = v181;
                os_signpost_id_t v98 = v161;
                uint64_t v91 = v162;
                unint64_t v96 = v165;
                if (!v190) {
                  goto LABEL_149;
                }
                goto LABEL_141;
              }
              id v118 = (id)v112;
            }
            int v115 = v184;
            goto LABEL_121;
          }
        }
        v68 = 0;
        double v64 = (void *)v176;
        goto LABEL_77;
      }
    }
    else
    {
      id v58 = v59;
      double v60 = v173;
    }
    id v59 = v58;
    id v58 = v59;
    goto LABEL_43;
  }
  id v76 = _UIKeyboardLog();
  uint64_t v77 = v76;
  if (v185 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v77, OS_SIGNPOST_INTERVAL_END, spid, "queryUIKitDocument", "", buf, 2u);
  }

  v7[2](v7, v23);
LABEL_159:
}

- (CGRect)convertRect:(CGRect)a3 from:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = [v9 window];
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = [v9 window];

  LODWORD(v9) = [v19 _isRemoteInputHostWindow];
  if (v9)
  {
    long long v20 = [(UIKBRTIPartner *)self rtiDocumentTraits];
    char v21 = [v20 assistantViewInfo];

    uint64_t v22 = +[UIScreen mainScreen];
    [v22 bounds];
    double v24 = v23;
    [v21 insets];
    double v26 = v24 - v25;
    [v21 size];
    double v14 = v14 + v26 - v27;
  }
  double v28 = v12;
  double v29 = v14;
  double v30 = v16;
  double v31 = v18;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (void)_updateGeometryObserverIfNecessary
{
  id v3 = [(UIKBRTIPartner *)self rtiClient];
  id v4 = [v3 defaultDocumentRequest];
  if (v4)
  {
    id v5 = [(UIKBRTIPartner *)self rtiClient];
    id v6 = [v5 defaultDocumentRequest];
    BOOL v7 = ([v6 flags] & 4) == 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  if (+[UIKeyboard supportsAutoFillPanel]) {
    BOOL v8 = +[UIKeyboard isAlwaysAllowedAutoFillPanelClient];
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = [(UIKBRTIPartner *)self rtiClient];
  if (![v9 isEnvironmentEnabled])
  {

    if (!v8) {
      goto LABEL_16;
    }
LABEL_24:
    double v18 = [(UIKBRTIPartner *)self inputDelegate];
    double v19 = [v18 textInputView];
    -[UIView _addGeometryChangeObserver:](v19, self);

    double v16 = self;
    uint64_t v17 = 1;
    goto LABEL_25;
  }
  id v10 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  if (v10) {
    char v11 = v7;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0 && ![(UIKBRTIPartner *)self isObservingGeometry])
  {

    goto LABEL_24;
  }

  if (v8) {
    goto LABEL_24;
  }
LABEL_16:
  id v21 = [(UIKBRTIPartner *)self rtiClient];
  if (![v21 isEnvironmentEnabled])
  {
    BOOL v13 = [(UIKBRTIPartner *)self isObservingGeometry];

    if (!v13) {
      return;
    }
LABEL_22:
    double v14 = [(UIKBRTIPartner *)self inputDelegate];
    double v15 = [v14 textInputView];
    -[UIView _removeGeometryChangeObserver:](v15, self);

    double v16 = self;
    uint64_t v17 = 0;
LABEL_25:
    [(UIKBRTIPartner *)v16 setIsObservingGeometry:v17];
    return;
  }
  double v12 = [(UIKBRTIPartner *)self currentSessionIdentifier];
  if (!v12)
  {
    BOOL v20 = [(UIKBRTIPartner *)self isObservingGeometry];

    if (!v20) {
      return;
    }
    goto LABEL_22;
  }
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 6) != 0) {
    [(UIKBRTIPartner *)self documentStateChanged];
  }
}

- (id)insertionPointColor
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v3 = +[UIKeyboard currentDocumentState];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 insertionPointColor];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v5 cgColor]);
        goto LABEL_7;
      }
    }
  }
  id v4 = [(UIKBRTIPartner *)self partnerDelegate];
  id v6 = [v4 textInputTraits];
  uint64_t v7 = [v6 insertionPointColor];
LABEL_7:
  BOOL v8 = (void *)v7;

  return v8;
}

- (UIKBRTIPartnerDelegate)partnerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_partnerDelegate);
  return (UIKBRTIPartnerDelegate *)WeakRetained;
}

- (void)setPartnerDelegate:(id)a3
{
}

- (void)setInputSystemClientEnabled:(BOOL)a3
{
  self->_inputSystemClientEnabled = a3;
}

- (BOOL)isNotifyingDelegateOfRemoteOutputOperation
{
  return self->_isNotifyingDelegateOfRemoteOutputOperation;
}

- (void)setRtiClient:(id)a3
{
}

- (RTIDocumentTraits)rtiDocumentTraits
{
  return self->_rtiDocumentTraits;
}

- (void)setRtiDocumentTraits:(id)a3
{
}

- (RTIDocumentState)rtiDocumentState
{
  return self->_rtiDocumentState;
}

- (void)setRtiDocumentState:(id)a3
{
}

- (BOOL)applicationStateIsActiveForRTI
{
  return self->_applicationStateIsActiveForRTI;
}

- (void)setApplicationStateIsActiveForRTI:(BOOL)a3
{
  self->_applicationStateIsActiveForRTI = a3;
}

- (BOOL)viewServiceStateIsActiveForRTI
{
  return self->_viewServiceStateIsActiveForRTI;
}

- (void)setViewServiceStateIsActiveForRTI:(BOOL)a3
{
  self->_viewServiceStateIsActiveForRTI = a3;
}

- (TIKeyboardOutput)pendingOutputOperation
{
  return self->_pendingOutputOperation;
}

- (void)setPendingOutputOperation:(id)a3
{
}

- (void)setCurrentSessionIdentifier:(id)a3
{
}

- (BOOL)isObservingGeometry
{
  return self->_isObservingGeometry;
}

- (void)setIsObservingGeometry:(BOOL)a3
{
  self->_isObservingGeometrdouble y = a3;
}

- (NSMutableDictionary)rtiSessionMarkers
{
  return self->_rtiSessionMarkers;
}

- (void)setRtiSessionMarkers:(id)a3
{
}

- (NSMutableDictionary)supplementalLexicons
{
  return self->_supplementalLexicons;
}

- (void)setSupplementalLexicons:(id)a3
{
}

- (NSMutableDictionary)textSuggestions
{
  return self->_textSuggestions;
}

- (void)setTextSuggestions:(id)a3
{
}

- (NSMutableArray)queuedSupplementalLexiconOperations
{
  return self->_queuedSupplementalLexiconOperations;
}

- (void)setQueuedSupplementalLexiconOperations:(id)a3
{
}

- (NSUUID)authenticatingSessionIdentifier
{
  return self->_authenticatingSessionIdentifier;
}

- (void)setAuthenticatingSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_queuedSupplementalLexiconOperations, 0);
  objc_storeStrong((id *)&self->_textSuggestions, 0);
  objc_storeStrong((id *)&self->_supplementalLexicons, 0);
  objc_storeStrong((id *)&self->_rtiSessionMarkers, 0);
  objc_storeStrong((id *)&self->_currentSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingOutputOperation, 0);
  objc_storeStrong((id *)&self->_rtiInputSourceState, 0);
  objc_storeStrong((id *)&self->_rtiDocumentState, 0);
  objc_storeStrong((id *)&self->_rtiDocumentTraits, 0);
  objc_storeStrong((id *)&self->_rtiClient, 0);
  objc_destroyWeak((id *)&self->_partnerDelegate);
  objc_storeStrong((id *)&self->_pendingDisableBecomeFirstResponderParameters, 0);
  objc_storeStrong((id *)&self->_keyboardTaskSubqueue, 0);
  objc_storeStrong((id *)&self->_waitingRTIOutputOperationResponseContext, 0);
  objc_storeStrong((id *)&self->_cachedHasNextKeyResponder, 0);
  objc_storeStrong((id *)&self->_cachedHasPreviousKeyResponder, 0);
  objc_storeStrong((id *)&self->_remoteDocumentTraits, 0);
}

@end