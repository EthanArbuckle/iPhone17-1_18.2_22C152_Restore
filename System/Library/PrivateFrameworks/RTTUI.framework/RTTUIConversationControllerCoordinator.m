@interface RTTUIConversationControllerCoordinator
+ (id)sharedInstance;
- (BOOL)processingUtteranceBuffer;
- (BOOL)realtimeTextDidChange:(id)a3 forUtterance:(id)a4 lastRowPath:(id)a5;
- (NSIndexPath)inProgressRealTimeIndexPath;
- (NSMutableArray)utteranceBuffer;
- (RTTUIConversationControllerCoordinator)init;
- (RTTUtterance)inProgressRealTimeUtterance;
- (id)conversationControllerForCallUUID:(id)a3;
- (id)conversationControllers;
- (id)recentMessageControllerForCallUUID:(id)a3;
- (id)recentMessageControllers;
- (void)_registerForTranscriptionUpdatesForCall:(id)a3;
- (void)_sendNewUtteranceString:(id)a3 atIndex:(unint64_t)a4 forCellPath:(id)a5 call:(id)a6;
- (void)addConversationController:(id)a3;
- (void)addRecentMessageController:(id)a3;
- (void)hearingServerDidDie:(id)a3;
- (void)processCallScreeningTranscription:(id)a3 transcriptionID:(id)a4 callUUID:(id)a5;
- (void)processUtteranceQueue;
- (void)registerForCallUpdates:(id)a3;
- (void)sendNewUtteranceString:(id)a3 controller:(id)a4;
- (void)setProcessingUtteranceBuffer:(BOOL)a3;
- (void)setUtteranceBuffer:(id)a3;
@end

@implementation RTTUIConversationControllerCoordinator

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__RTTUIConversationControllerCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_Coordinator;
  return v2;
}

uint64_t __56__RTTUIConversationControllerCoordinator_sharedInstance__block_invoke()
{
  sharedInstance_Coordinator = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (RTTUIConversationControllerCoordinator)init
{
  v18.receiver = self;
  v18.super_class = (Class)RTTUIConversationControllerCoordinator;
  v2 = [(RTTUIConversationControllerCoordinator *)&v18 init];
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v4 = dispatch_queue_create("rtt_send_queue", v3);
  utteranceRequestQueue = v2->_utteranceRequestQueue;
  v2->_utteranceRequestQueue = (OS_dispatch_queue *)v4;

  uint64_t v6 = [MEMORY[0x263F08A88] pointerArrayWithOptions:5];
  conversationControllers = v2->_conversationControllers;
  v2->_conversationControllers = (NSPointerArray *)v6;

  uint64_t v8 = [MEMORY[0x263F08A88] pointerArrayWithOptions:5];
  recentMessageControllers = v2->_recentMessageControllers;
  v2->_recentMessageControllers = (NSPointerArray *)v8;

  uint64_t v10 = [MEMORY[0x263EFF980] array];
  utteranceBuffer = v2->_utteranceBuffer;
  v2->_utteranceBuffer = (NSMutableArray *)v10;

  v12 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  realtimeSendLock = v2->_realtimeSendLock;
  v2->_realtimeSendLock = v12;

  uint64_t v14 = [MEMORY[0x263EFF9C0] set];
  registeredCalls = v2->_registeredCalls;
  v2->_registeredCalls = (NSMutableSet *)v14;

  v16 = [MEMORY[0x263F62AE8] sharedInstance];
  [v16 startServerWithDelegate:v2];

  return v2;
}

- (void)addConversationController:(id)a3
{
}

- (void)addRecentMessageController:(id)a3
{
}

- (id)conversationControllers
{
  return [(NSPointerArray *)self->_conversationControllers allObjects];
}

- (id)recentMessageControllers
{
  return [(NSPointerArray *)self->_recentMessageControllers allObjects];
}

- (void)sendNewUtteranceString:(id)a3 controller:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 call];
  v9 = AXLogRTT();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_222978000, v9, OS_LOG_TYPE_INFO, "Sending utterance |%@|", (uint8_t *)&buf, 0xCu);
  }

  if ([v6 length])
  {
    uint64_t v10 = (void *)[v6 copy];
    v11 = (void *)MEMORY[0x263F62B08];
    v12 = [v7 currentContactPath];
    v13 = [v11 utteranceWithContactPath:v12 andText:v10];
    uint64_t v14 = [v7 addUtterance:v13];

    v15 = [v7 utteranceCellAtIndexPath:v14];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy_;
    v38 = __Block_byref_object_dispose_;
    v16 = [v15 utterance];
    v17 = [v16 text];
    id v39 = (id)[v17 copy];

    objc_super v18 = AXLogRTT();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [v15 utterance];
      *(_DWORD *)v29 = 138412802;
      v30 = v15;
      __int16 v31 = 2112;
      v32 = v14;
      __int16 v33 = 2112;
      v34 = v19;
      _os_log_impl(&dword_222978000, v18, OS_LOG_TYPE_INFO, "Got cell %@[%@] with utterance %@", v29, 0x20u);
    }
    utteranceRequestQueue = self->_utteranceRequestQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__RTTUIConversationControllerCoordinator_sendNewUtteranceString_controller___block_invoke;
    block[3] = &unk_2646384B8;
    id v24 = v10;
    v25 = self;
    p_long long buf = &buf;
    id v26 = v14;
    id v27 = v8;
    id v21 = v14;
    id v22 = v10;
    dispatch_async(utteranceRequestQueue, block);

    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __76__RTTUIConversationControllerCoordinator_sendNewUtteranceString_controller___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  }
  NSUInteger v2 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) rangeOfString:*(void *)(a1 + 32) options:4];
  NSUInteger v4 = v3;
  v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12.location = v2;
    v12.length = v4;
    id v6 = NSStringFromRange(v12);
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "Found range of existing utterance: %@", (uint8_t *)&v9, 0xCu);
  }
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v7 = 0;
  }
  else {
    NSUInteger v7 = v2;
  }
  return [*(id *)(a1 + 40) _sendNewUtteranceString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) atIndex:v7 forCellPath:*(void *)(a1 + 48) call:*(void *)(a1 + 56)];
}

- (id)conversationControllerForCallUUID:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    -[RTTUIConversationControllerCoordinator conversationControllerForCallUUID:]();
  }
  v5 = [(RTTUIConversationControllerCoordinator *)self conversationControllers];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__RTTUIConversationControllerCoordinator_conversationControllerForCallUUID___block_invoke;
  v10[3] = &unk_2646384E0;
  id v11 = v4;
  id v6 = v4;
  NSUInteger v7 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v10);
  uint64_t v8 = [v7 lastObject];

  return v8;
}

uint64_t __76__RTTUIConversationControllerCoordinator_conversationControllerForCallUUID___block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v3 = [a2 call];
  id v4 = [v3 callUUID];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)recentMessageControllerForCallUUID:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    -[RTTUIConversationControllerCoordinator recentMessageControllerForCallUUID:]();
  }
  uint64_t v5 = [(RTTUIConversationControllerCoordinator *)self recentMessageControllers];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__RTTUIConversationControllerCoordinator_recentMessageControllerForCallUUID___block_invoke;
  v10[3] = &unk_264638508;
  id v11 = v4;
  id v6 = v4;
  NSUInteger v7 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v10);
  uint64_t v8 = [v7 lastObject];

  return v8;
}

uint64_t __77__RTTUIConversationControllerCoordinator_recentMessageControllerForCallUUID___block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v3 = [a2 call];
  id v4 = [v3 callUUID];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)registerForCallUpdates:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSMutableSet *)self->_registeredCalls containsObject:v4])
  {
    [(NSMutableSet *)self->_registeredCalls addObject:v4];
    id v6 = [MEMORY[0x263F62AE8] sharedInstance];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke;
    v21[3] = &unk_264638558;
    v21[4] = self;
    id v7 = v4;
    id v22 = v7;
    [v6 registerForUpdates:v21 forCallUID:v7];

    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v8 = (unsigned int (*)(void))getAXProcessIsInCallServiceSymbolLoc_ptr;
    id v26 = getAXProcessIsInCallServiceSymbolLoc_ptr;
    if (!getAXProcessIsInCallServiceSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v28 = __getAXProcessIsInCallServiceSymbolLoc_block_invoke;
      v29 = &unk_2646386E0;
      v30 = &v23;
      int v9 = (void *)AccessibilityUtilitiesLibrary();
      uint64_t v10 = dlsym(v9, "AXProcessIsInCallService");
      *(void *)(v30[1] + 24) = v10;
      getAXProcessIsInCallServiceSymbolLoc_ptr = *(_UNKNOWN **)(v30[1] + 24);
      uint64_t v8 = (unsigned int (*)(void))v24[3];
    }
    _Block_object_dispose(&v23, 8);
    if (v8)
    {
      if (v8())
      {
        id v11 = [MEMORY[0x263F62AE8] sharedInstance];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_53;
        v19[3] = &unk_2646385A8;
        v19[4] = self;
        id v20 = v7;
        [v11 registerForRemoteUpdates:v19 forCallUID:v20];

LABEL_18:
        v16 = [MEMORY[0x263F62AE8] sharedInstance];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_56;
        v17[3] = &unk_2646385F8;
        v17[4] = self;
        id v18 = v7;
        [v16 registerForServiceUpdates:v17 forCallUID:v18];

        goto LABEL_19;
      }
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x2020000000;
      NSRange v12 = (unsigned int (*)(void))getAXProcessIsRTTNotificationContentExtensionSymbolLoc_ptr;
      id v26 = getAXProcessIsRTTNotificationContentExtensionSymbolLoc_ptr;
      if (!getAXProcessIsRTTNotificationContentExtensionSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v28 = __getAXProcessIsRTTNotificationContentExtensionSymbolLoc_block_invoke;
        v29 = &unk_2646386E0;
        v30 = &v23;
        v13 = (void *)AccessibilityUtilitiesLibrary();
        uint64_t v14 = dlsym(v13, "AXProcessIsRTTNotificationContentExtension");
        *(void *)(v30[1] + 24) = v14;
        getAXProcessIsRTTNotificationContentExtensionSymbolLoc_ptr = *(_UNKNOWN **)(v30[1] + 24);
        NSRange v12 = (unsigned int (*)(void))v24[3];
      }
      _Block_object_dispose(&v23, 8);
      if (v12)
      {
        if (v12())
        {
          [(RTTUIConversationControllerCoordinator *)self _registerForTranscriptionUpdatesForCall:v7];
        }
        else
        {
          v15 = AXLogRTT();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_222978000, v15, OS_LOG_TYPE_INFO, "Not registering for remote updates", (uint8_t *)&buf, 2u);
          }
        }
        goto LABEL_18;
      }
    }
    -[RTTUIConversationControllerCoordinator registerForCallUpdates:]();
    __break(1u);
  }
  uint64_t v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "Already registered to listen for updates from %@", (uint8_t *)&buf, 0xCu);
  }

LABEL_19:
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = v6;
  id v7 = v6;
  id v8 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  NSUInteger v2 = [*(id *)(a1 + 32) conversationControllerForCallUUID:*(void *)(a1 + 40)];
  NSUInteger v3 = [*(id *)(a1 + 32) recentMessageControllerForCallUUID:*(void *)(a1 + 40)];
  [v3 deviceDidReceiveString:*(void *)(a1 + 48) forUtterance:*(void *)(a1 + 56)];
  id v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    NSRange v12 = v2;
    _os_log_impl(&dword_222978000, v4, OS_LOG_TYPE_INFO, "Got local update callback: %@ %@ for %@", (uint8_t *)&v7, 0x20u);
  }

  [v2 deviceDidReceiveString:*(void *)(a1 + 48) forUtterance:*(void *)(a1 + 56)];
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = v6;
  id v7 = v6;
  id v8 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_2_54(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  NSUInteger v2 = [*(id *)(a1 + 32) conversationControllerForCallUUID:*(void *)(a1 + 40)];
  NSUInteger v3 = [*(id *)(a1 + 32) recentMessageControllerForCallUUID:*(void *)(a1 + 40)];
  id v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v20 = 138413058;
    uint64_t v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v2;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_222978000, v4, OS_LOG_TYPE_INFO, "Got remote update callback: %@ %@ for vc %@, %@", (uint8_t *)&v20, 0x2Au);
  }

  uint64_t v7 = *(void *)(a1 + 64);
  switch(v7)
  {
    case 3:
      id v15 = (id)[v2 addTranscriptionText:*(void *)(a1 + 56) isNew:0];
      uint64_t v16 = *(void *)(a1 + 56);
      v17 = v3;
      uint64_t v18 = 0;
LABEL_9:
      [v17 addTranscriptionText:v16 isNew:v18];
      break;
    case 2:
      id v19 = (id)[v2 addTranscriptionText:*(void *)(a1 + 56) isNew:1];
      uint64_t v16 = *(void *)(a1 + 56);
      v17 = v3;
      uint64_t v18 = 1;
      goto LABEL_9;
    case 1:
      id v8 = (void *)MEMORY[0x263F62B08];
      id v9 = [v2 currentContactPath];
      uint64_t v10 = [v8 utteranceWithContactPath:v9 andText:*(void *)(a1 + 48)];
      id v11 = (id)[v2 addUtterance:v10];

      NSRange v12 = (void *)MEMORY[0x263F62B08];
      uint64_t v13 = [v3 currentContactPath];
      uint64_t v14 = [v12 utteranceWithContactPath:v13 andText:*(void *)(a1 + 48)];
      [v3 addUtterance:v14];

      break;
  }
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = v6;
  id v7 = v6;
  id v8 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_2_57(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  NSUInteger v2 = [*(id *)(a1 + 32) conversationControllerForCallUUID:*(void *)(a1 + 40)];
  int v3 = *(unsigned __int8 *)(a1 + 64);
  id v4 = AXLogRTT();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      id v11 = v2;
      _os_log_impl(&dword_222978000, v4, OS_LOG_TYPE_INFO, "Adding service update %@ for vc: %@", (uint8_t *)&v8, 0x16u);
    }

    [v2 addServiceCellWithUpdate:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v2;
      _os_log_impl(&dword_222978000, v4, OS_LOG_TYPE_INFO, "Removing service update %@ for vc: %@", (uint8_t *)&v8, 0x16u);
    }

    [v2 removeServiceCellWithUpdate:*(void *)(a1 + 48)];
  }
}

- (BOOL)realtimeTextDidChange:(id)a3 forUtterance:(id)a4 lastRowPath:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v33 = [v8 call];
  BOOL v11 = [(NSLock *)self->_realtimeSendLock tryLock];
  if (v11)
  {
    if ([v9 isMe] && (objc_msgSend(v9, "hasTimedOut") & 1) == 0)
    {
      v17 = [v9 text];
      uint64_t v18 = [v8 textViewUtterance];
      [v9 updateText:v18];
      id v19 = [v33 callUUID];
      v32 = [(RTTUIConversationControllerCoordinator *)self recentMessageControllerForCallUUID:v19];

      [v32 didSendString:v18];
      objc_storeStrong((id *)&self->_inProgressRealTimeIndexPath, a5);
      int v20 = (RTTUtterance *)[v9 copy];
      inProgressRealTimeUtterance = self->_inProgressRealTimeUtterance;
      self->_inProgressRealTimeUtterance = v20;

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v50 = 0x2020000000;
      uint64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
      __int16 v22 = AXLogRTT();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v45 = 138740227;
        v46 = v17;
        __int16 v47 = 2117;
        v48 = v18;
        _os_log_impl(&dword_222978000, v22, OS_LOG_TYPE_INFO, "KNOWN |%{sensitive}@| NEW |%{sensitive}@|", v45, 0x16u);
      }

      uint64_t v23 = [v17 length];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke;
      v42[3] = &unk_264638620;
      id v24 = v18;
      id v43 = v24;
      p_long long buf = &buf;
      objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v23, 2, v42);
      uint64_t v25 = [MEMORY[0x263F089D8] string];
      if (*(void *)(*((void *)&buf + 1) + 24) == 0x7FFFFFFFFFFFFFFFLL)
      {
        __int16 v26 = objc_msgSend(v24, "substringFromIndex:", objc_msgSend(v17, "length"));
        [v25 appendString:v26];
      }
      else
      {
        uint64_t v27 = [v17 length];
        uint64_t v28 = *(void *)(*((void *)&buf + 1) + 24);
        uint64_t v29 = v27 - v28;
        if (v27 != v28)
        {
          do
          {
            objc_msgSend(v25, "appendFormat:", @"%c", 8);
            --v29;
          }
          while (v29);
          uint64_t v27 = *(void *)(*((void *)&buf + 1) + 24);
        }
        __int16 v26 = [v24 substringFromIndex:v27];
        [v25 appendString:v26];
      }

      utteranceRequestQueue = self->_utteranceRequestQueue;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke_64;
      v38[3] = &unk_264638530;
      v38[4] = self;
      id v31 = v25;
      id v39 = v31;
      id v40 = v10;
      id v41 = v33;
      dispatch_async(utteranceRequestQueue, v38);
      if (![v31 length]) {
        [(NSLock *)self->_realtimeSendLock unlock];
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v12 = AXLogRTT();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_222978000, v12, OS_LOG_TYPE_INFO, "Nothing to send. Releasing lock", (uint8_t *)&buf, 2u);
      }

      [(NSLock *)self->_realtimeSendLock unlock];
    }
  }
  else
  {
    uint64_t v13 = AXLogRTT();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v8 textViewUtterance];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_222978000, v13, OS_LOG_TYPE_INFO, "Collision, trying again |%@|", (uint8_t *)&buf, 0xCu);
    }
    dispatch_time_t v15 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke_65;
    block[3] = &unk_264638530;
    void block[4] = self;
    id v35 = v8;
    id v36 = v9;
    id v37 = v10;
    dispatch_after(v15, MEMORY[0x263EF83A0], block);
  }
  return v11;
}

void __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v11 = a2;
  if (a3 + a4 > (unint64_t)[*(id *)(a1 + 32) length]
    || (objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 caseInsensitiveCompare:v11],
        v12,
        v13))
  {
    unint64_t v14 = [*(id *)(a1 + 32) length];
    dispatch_time_t v15 = AXLogRTT();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (a3 + a4 <= v14)
    {
      if (v16)
      {
        uint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
        int v19 = 138412546;
        *(void *)int v20 = v18;
        *(_WORD *)&v20[8] = 2112;
        id v21 = v11;
        _os_log_impl(&dword_222978000, v15, OS_LOG_TYPE_INFO, "NOT EQUAL |%@| = |%@|", (uint8_t *)&v19, 0x16u);
      }
    }
    else if (v16)
    {
      int v17 = [*(id *)(a1 + 32) length];
      int v19 = 67109376;
      *(_DWORD *)int v20 = a3;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v17;
      _os_log_impl(&dword_222978000, v15, OS_LOG_TYPE_INFO, "NOT EQUAL %d, %d", (uint8_t *)&v19, 0xEu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a7 = 1;
  }
}

uint64_t __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke_64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendNewUtteranceString:*(void *)(a1 + 40) atIndex:0 forCellPath:*(void *)(a1 + 48) call:*(void *)(a1 + 56)];
}

uint64_t __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke_65(uint64_t a1)
{
  return [*(id *)(a1 + 32) realtimeTextDidChange:*(void *)(a1 + 40) forUtterance:*(void *)(a1 + 48) lastRowPath:*(void *)(a1 + 56)];
}

- (void)_sendNewUtteranceString:(id)a3 atIndex:(unint64_t)a4 forCellPath:(id)a5 call:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = AXLogRTT();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412802;
    id v30 = v10;
    __int16 v31 = 1024;
    int v32 = a4;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_impl(&dword_222978000, v13, OS_LOG_TYPE_INFO, "_sending new utterance: %@ at index: %d for path: %@", buf, 0x1Cu);
  }

  unint64_t v14 = [v10 length];
  if (v14 > a4)
  {
    unint64_t v15 = v14;
    do
    {
      BOOL v16 = [(RTTUIConversationControllerCoordinator *)self utteranceBuffer];
      int v17 = +[RTTUtteranceRequest utteranceRequestWithIndex:a4 forString:v10 inCellPath:v11 call:v12];
      [v16 addObject:v17];

      uint64_t v18 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", a4, 1);
      a4 = v18 + v19;
    }
    while (v18 + v19 < v15);
  }
  if (+[RTTUIUtilities ttyShouldBeRealtimeForCall:v12])
  {
    [(NSLock *)self->_realtimeSendLock unlock];
  }
  else
  {
    int v20 = AXLogRTT();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_222978000, v20, OS_LOG_TYPE_INFO, "Sending trailing space", buf, 2u);
    }

    id v21 = [(RTTUIConversationControllerCoordinator *)self utteranceBuffer];
    uint64_t v22 = +[RTTUtteranceRequest utteranceRequestWithIndex:0 forString:@" " inCellPath:0 call:v12];
    [v21 addObject:v22];

    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __91__RTTUIConversationControllerCoordinator__sendNewUtteranceString_atIndex_forCellPath_call___block_invoke;
    __int16 v26 = &unk_264638648;
    uint64_t v27 = self;
    id v28 = v11;
    dispatch_async(MEMORY[0x263EF83A0], &v23);
  }
  if (![(RTTUIConversationControllerCoordinator *)self processingUtteranceBuffer])[(RTTUIConversationControllerCoordinator *)self processUtteranceQueue]; {
}
  }

void __91__RTTUIConversationControllerCoordinator__sendNewUtteranceString_atIndex_forCellPath_call___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  NSUInteger v2 = [*(id *)(a1 + 32) conversationControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 138412546;
    long long v14 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "utteranceCellAtIndexPath:", *(void *)(a1 + 40), v14);
        id v10 = AXLogRTT();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = v14;
          int v20 = v8;
          __int16 v21 = 2112;
          uint64_t v22 = v9;
          _os_log_impl(&dword_222978000, v10, OS_LOG_TYPE_INFO, "Updated controller with text: %@ -> %@", buf, 0x16u);
        }

        id v11 = [v9 utterance];
        id v12 = [v11 text];
        uint64_t v13 = [v12 stringByAppendingString:@" "];
        [v11 updateText:v13];
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v5);
  }
}

- (void)processUtteranceQueue
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(RTTUIConversationControllerCoordinator *)self utteranceBuffer];
  uint64_t v4 = [v3 count];

  [(NSMutableArray *)self->_utteranceBuffer ax_removeObjectsFromArrayUsingBlock:&__block_literal_global];
  uint64_t v5 = [(RTTUIConversationControllerCoordinator *)self utteranceBuffer];
  uint64_t v6 = [v5 count];

  if (v4 != v6)
  {
    uint64_t v7 = AXLogRTT();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v40) = v4 - v6;
      _os_log_impl(&dword_222978000, v7, OS_LOG_TYPE_INFO, "Discarded %d utterance requests from disconnected calls", buf, 8u);
    }
  }
  if (!v6)
  {
    inProgressRealTimeUtterance = self->_inProgressRealTimeUtterance;
    self->_inProgressRealTimeUtterance = 0;

    inProgressRealTimeIndexPath = self->_inProgressRealTimeIndexPath;
    self->_inProgressRealTimeIndexPath = 0;

    [(RTTUIConversationControllerCoordinator *)self setProcessingUtteranceBuffer:0];
    return;
  }
  [(RTTUIConversationControllerCoordinator *)self setProcessingUtteranceBuffer:1];
  id v8 = [(RTTUIConversationControllerCoordinator *)self utteranceBuffer];
  id v9 = [v8 firstObject];

  id v10 = [v9 string];
  uint64_t v11 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", objc_msgSend(v9, "index"), 1);
  uint64_t v13 = v12;

  long long v14 = [v9 string];
  objc_msgSend(v14, "substringWithRange:", v11, v13);
  long long v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  long long v16 = AXLogRTT();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = [(__CFString *)v15 characterAtIndex:0];
    long long v18 = @"BACKSPACE";
    if (v17 != 8) {
      long long v18 = v15;
    }
    *(_DWORD *)long long buf = 138412546;
    id v40 = v18;
    __int16 v41 = 2112;
    v42 = v9;
    _os_log_impl(&dword_222978000, v16, OS_LOG_TYPE_INFO, "Sending %@ - %@", buf, 0x16u);
  }

  uint64_t v19 = [MEMORY[0x263F62AE8] sharedInstance];
  int v20 = [v9 call];
  __int16 v21 = [v20 callUUID];
  [v19 sendString:v15 forCallUID:v21];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke_74;
  block[3] = &unk_264638648;
  void block[4] = self;
  id v22 = v9;
  id v38 = v22;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v23 = [(RTTUIConversationControllerCoordinator *)self utteranceBuffer];
  [v23 removeObject:v22];

  uint64_t v24 = [(RTTUIConversationControllerCoordinator *)self utteranceBuffer];
  if ([v24 count])
  {
    uint64_t v25 = [v22 call];
    int v26 = [v25 status];

    if (v26 == 1)
    {
      uint64_t v27 = [v22 call];
      int v28 = [v27 isTTY];

      if (v28) {
        int64_t v29 = 200000000;
      }
      else {
        int64_t v29 = 50000000;
      }
      dispatch_time_t v30 = dispatch_time(0, v29);
      utteranceRequestQueue = self->_utteranceRequestQueue;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke_75;
      v36[3] = &unk_264638690;
      v36[4] = self;
      dispatch_after(v30, utteranceRequestQueue, v36);
      goto LABEL_19;
    }
  }
  else
  {
  }
  id v34 = self->_inProgressRealTimeUtterance;
  self->_inProgressRealTimeUtterance = 0;

  uint64_t v35 = self->_inProgressRealTimeIndexPath;
  self->_inProgressRealTimeIndexPath = 0;

  [(RTTUIConversationControllerCoordinator *)self setProcessingUtteranceBuffer:0];
LABEL_19:
}

BOOL __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v2 = [a2 call];
  BOOL v3 = [v2 status] == 6;

  return v3;
}

void __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke_74(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  NSUInteger v2 = [*(id *)(a1 + 32) conversationControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v4 = 134218499;
    long long v15 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "cellIndexPath", v15);
        id v10 = [v8 utteranceCellAtIndexPath:v9];

        uint64_t v11 = AXLogRTT();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [v10 utterance];
          uint64_t v13 = [v12 text];
          int v14 = [*(id *)(a1 + 40) index];
          *(_DWORD *)long long buf = v15;
          __int16 v21 = v8;
          __int16 v22 = 2117;
          uint64_t v23 = v13;
          __int16 v24 = 1024;
          int v25 = v14;
          _os_log_impl(&dword_222978000, v11, OS_LOG_TYPE_INFO, "Process utterance queue: %p for cell %{sensitive}@ with index: %d", buf, 0x1Cu);
        }
        objc_msgSend(v10, "setSendProgressIndex:", objc_msgSend(*(id *)(a1 + 40), "index"));

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v5);
  }
}

uint64_t __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke_75(uint64_t a1)
{
  return [*(id *)(a1 + 32) processUtteranceQueue];
}

- (void)_registerForTranscriptionUpdatesForCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F62AE8] sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__RTTUIConversationControllerCoordinator__registerForTranscriptionUpdatesForCall___block_invoke;
  v7[3] = &unk_2646385A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 registerForRemoteUpdates:v7 forCallUID:v6];
}

void __82__RTTUIConversationControllerCoordinator__registerForTranscriptionUpdatesForCall___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v9 = *(id *)(a1 + 40);
    id v10 = v7;
    id v11 = v8;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

void __82__RTTUIConversationControllerCoordinator__registerForTranscriptionUpdatesForCall___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  NSUInteger v2 = [*(id *)(a1 + 32) conversationControllerForCallUUID:*(void *)(a1 + 40)];
  uint64_t v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v2;
    _os_log_impl(&dword_222978000, v3, OS_LOG_TYPE_INFO, "Got remote update callback: %@ %@ for vc %@", (uint8_t *)&v7, 0x20u);
  }

  id v6 = (id)[v2 addTranscriptionText:*(void *)(a1 + 56) isNew:*(void *)(a1 + 64) == 2];
}

- (void)processCallScreeningTranscription:(id)a3 transcriptionID:(id)a4 callUUID:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [NSString stringWithFormat:@"%@_%@", v10, v9];
  uint64_t v12 = [v11 isEqualToString:self->_latestCallScreeningTranscriptionID] ^ 1;
  uint64_t v13 = NSString;
  int v14 = ttyLocString();
  long long v15 = objc_msgSend(v13, "stringWithFormat:", v14, v8);

  objc_storeStrong((id *)&self->_latestCallScreeningTranscriptionID, v11);
  long long v16 = AXLogRTT();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    long long v17 = [NSNumber numberWithBool:v12];
    *(_DWORD *)long long buf = 138413058;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    int v28 = v17;
    _os_log_impl(&dword_222978000, v16, OS_LOG_TYPE_INFO, "Received call screening RTT transcript: %@ (id %@), callID: %@, isNew: %@", buf, 0x2Au);
  }
  int v20 = v10;
  id v18 = v15;
  id v19 = v10;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __101__RTTUIConversationControllerCoordinator_processCallScreeningTranscription_transcriptionID_callUUID___block_invoke(uint64_t a1)
{
  NSUInteger v2 = [*(id *)(a1 + 32) conversationControllerForCallUUID:*(void *)(a1 + 40)];
  id v3 = (id)[v2 addTranscriptionText:*(void *)(a1 + 48) isNew:*(unsigned __int8 *)(a1 + 56)];

  id v4 = [MEMORY[0x263F62AE8] sharedInstance];
  [v4 sendTranscription:*(void *)(a1 + 48) forCallUUID:*(void *)(a1 + 40) isNew:*(unsigned __int8 *)(a1 + 56)];
}

- (void)hearingServerDidDie:(id)a3
{
  id v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_222978000, v4, OS_LOG_TYPE_INFO, "heard died, sending it the up-to-date conversations to save to database", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__RTTUIConversationControllerCoordinator_hearingServerDidDie___block_invoke;
  block[3] = &unk_264638690;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__RTTUIConversationControllerCoordinator_hearingServerDidDie___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "conversationControllers", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
        int v7 = [MEMORY[0x263F62AE8] sharedInstance];
        id v8 = [v6 conversation];
        [v7 sendConversationUpdate:v8];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (NSIndexPath)inProgressRealTimeIndexPath
{
  return self->_inProgressRealTimeIndexPath;
}

- (RTTUtterance)inProgressRealTimeUtterance
{
  return self->_inProgressRealTimeUtterance;
}

- (NSMutableArray)utteranceBuffer
{
  return self->_utteranceBuffer;
}

- (void)setUtteranceBuffer:(id)a3
{
}

- (BOOL)processingUtteranceBuffer
{
  return self->_processingUtteranceBuffer;
}

- (void)setProcessingUtteranceBuffer:(BOOL)a3
{
  self->_processingUtteranceBuffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceBuffer, 0);
  objc_storeStrong((id *)&self->_latestCallScreeningTranscriptionID, 0);
  objc_storeStrong((id *)&self->_registeredCalls, 0);
  objc_storeStrong((id *)&self->_inProgressRealTimeUtterance, 0);
  objc_storeStrong((id *)&self->_inProgressRealTimeIndexPath, 0);
  objc_storeStrong((id *)&self->_realtimeSendLock, 0);
  objc_storeStrong((id *)&self->_recentMessageControllers, 0);
  objc_storeStrong((id *)&self->_conversationControllers, 0);
  objc_storeStrong((id *)&self->_utteranceRequestQueue, 0);
}

- (void)conversationControllerForCallUUID:.cold.1()
{
}

- (void)recentMessageControllerForCallUUID:.cold.1()
{
}

- (uint64_t)registerForCallUpdates:.cold.1()
{
  dlerror();
  v0 = abort_report_np();
  return -[RTTUIConversationViewController isCurrentCallReceivingOnHold](v0);
}

@end