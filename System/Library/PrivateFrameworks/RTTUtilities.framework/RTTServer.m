@interface RTTServer
+ (id)sharedInstance;
- (BOOL)contactIsTTYContact:(id)a3;
- (BOOL)deleteConversationWithCallUID:(id)a3;
- (BOOL)isEmergencyNumber:(id)a3;
- (RBSAssertion)assertionInCallService;
- (RTTServer)init;
- (id)_createSandboxUrlForVoicemailMessage:(id)a3;
- (id)actionCompletionBlock;
- (id)valueForTTYSetting:(id)a3;
- (void)_managerAXPIDState:(BOOL)a3;
- (void)_registerForServerSettingsUpdates;
- (void)_takeStackshot;
- (void)cancelCallPromptDisplay;
- (void)dealloc;
- (void)displayCallPromptForContact:(id)a3 withCompletion:(id)a4;
- (void)findConversationForCallUID:(id)a3 andResult:(id)a4;
- (void)handleMessageError:(id)a3 destructive:(BOOL)a4;
- (void)handleMessageWithPayload:(id)a3 forIdentifier:(unint64_t)a4;
- (void)primeRTTServer;
- (void)registerForRemoteUpdates:(id)a3 forCallUID:(id)a4;
- (void)registerForServiceUpdates:(id)a3 forCallUID:(id)a4;
- (void)registerForUpdates:(id)a3 forCallUID:(id)a4;
- (void)registerResponseBlock:(id)a3 forUUID:(id)a4;
- (void)resetConnection;
- (void)sendConversationUpdate:(id)a3;
- (void)sendMessageWithPayload:(id)a3 andIdentifier:(unint64_t)a4;
- (void)sendString:(id)a3 forCallUID:(id)a4;
- (void)sendTranscription:(id)a3 forCallUUID:(id)a4 isNew:(BOOL)a5;
- (void)setActionCompletionBlock:(id)a3;
- (void)setAssertionInCallService:(id)a3;
- (void)setShouldSuppressIncomingNotification:(BOOL)a3;
- (void)setSystemOutputAudioMuted:(BOOL)a3 withCallID:(id)a4;
- (void)setTTYDictionaryAvailability:(BOOL)a3;
- (void)setViewControllerIsVisible:(BOOL)a3 withCallID:(id)a4;
- (void)shouldRestartOnInterruption:(id)a3;
- (void)terminateConnectionAndNotify:(BOOL)a3;
@end

@implementation RTTServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_Server;

  return v2;
}

uint64_t __27__RTTServer_sharedInstance__block_invoke()
{
  sharedInstance_Server = objc_alloc_init(RTTServer);

  return MEMORY[0x270F9A758]();
}

- (RTTServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)RTTServer;
  v2 = [(HCServer *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    databaseResponseBlocks = v2->_databaseResponseBlocks;
    v2->_databaseResponseBlocks = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    dataResponseBlocksLock = v2->_dataResponseBlocksLock;
    v2->_dataResponseBlocksLock = v5;

    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("tty_common_queue", v7);
    commonRequestQueue = v2->_commonRequestQueue;
    v2->_commonRequestQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v11 = dispatch_queue_create("tty_msg_processing_queue", v10);
    messageProcessingQueue = v2->_messageProcessingQueue;
    v2->_messageProcessingQueue = (OS_dispatch_queue *)v11;

    [(RTTServer *)v2 _registerForServerSettingsUpdates];
  }
  return v2;
}

- (void)dealloc
{
  [(RTTServer *)self setActionCompletionBlock:0];
  uint64_t v3 = [(RTTServer *)self assertionInCallService];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(RTTServer *)self assertionInCallService];
    int v6 = [v5 isValid];

    if (v6)
    {
      v7 = [(RTTServer *)self assertionInCallService];
      [v7 invalidate];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)RTTServer;
  [(HCServer *)&v8 dealloc];
}

- (void)terminateConnectionAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)RTTServer;
  -[HCServer terminateConnectionAndNotify:](&v6, sel_terminateConnectionAndNotify_);
  v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v8 = v3;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Terminate and notify about heard: %d", buf, 8u);
  }

  if (!v3)
  {
    v5 = +[RTTSettings sharedInstance];
    [v5 clearAllServerSettingsCache];
  }
}

- (void)_registerForServerSettingsUpdates
{
}

void __46__RTTServer__registerForServerSettingsUpdates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v2;
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Received server settings update for %@", (uint8_t *)&v11, 0xCu);
  }

  v4 = +[RTTSettings sharedInstance];
  v5 = [v2 objectForKeyedSubscript:@"preferenceKey"];
  [v4 clearServerSettingsCacheForKey:v5];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v7 = +[RTTSettings sharedInstance];
  BOOL v8 = +[RTTSettings sharedInstance];
  uint64_t v9 = [v2 objectForKeyedSubscript:@"preferenceKey"];
  objc_msgSend(v7, "notificationForSelector:", objc_msgSend(v8, "selectorForPreferenceKey:", v9));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v10, 0, 0, 1u);
}

- (void)resetConnection
{
  BOOL v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Connection reset", buf, 2u);
  }

  v14.receiver = self;
  v14.super_class = (Class)RTTServer;
  [(HCServer *)&v14 resetConnection];
  [(NSLock *)self->_dataResponseBlocksLock lock];
  v4 = [MEMORY[0x263EFF980] array];
  databaseResponseBlocks = self->_databaseResponseBlocks;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __28__RTTServer_resetConnection__block_invoke;
  int v11 = &unk_264540450;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)databaseResponseBlocks enumerateKeysAndObjectsUsingBlock:&v8];
  -[NSMutableDictionary removeObjectsForKeys:](self->_databaseResponseBlocks, "removeObjectsForKeys:", v6, v8, v9, v10, v11, v12);
  [(NSLock *)self->_dataResponseBlocksLock unlock];
  v7 = +[RTTSettings sharedInstance];
  [v7 clearAllServerSettingsCache];
}

void __28__RTTServer_resetConnection__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 hasPrefix:@"axtty_conversation_updates"])
  {
    v4 = [NSString stringWithFormat:@"%@_", @"axtty_conversation_updates"];
    v5 = [v3 stringByReplacingOccurrencesOfString:v4 withString:&stru_26D1B01C8];

    id v6 = *(void **)(a1 + 32);
    v10 = v5;
    int v11 = @"axtty_conversation_updates";
    uint64_t v9 = @"axtty_callID";
    v7 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v12[0] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v6 sendMessageWithPayload:v8 andIdentifier:0x800000000];
  }
  if ([v3 hasPrefix:@"axtty_settings_key"]) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)_managerAXPIDState:(BOOL)a3
{
  BOOL v3 = a3;
  if (_AXSVoiceOverTouchEnabled() || _AXSAssistiveTouchScannerEnabled()) {
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x263EFFE88], 0.25, 0);
  }
  uint64_t v4 = getpid();
  if (v3)
  {
    MEMORY[0x270F09840](v4, 0);
  }
  else
  {
    MEMORY[0x270F09848](v4, 0);
  }
}

- (void)sendMessageWithPayload:(id)a3 andIdentifier:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 0x200000000000)
  {
    uint64_t v7 = [(RTTServer *)self _createSandboxUrlForVoicemailMessage:v6];

    id v6 = (id)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)RTTServer;
  [(HCServer *)&v8 sendMessageWithPayload:v6 andIdentifier:a4];
}

- (void)handleMessageWithPayload:(id)a3 forIdentifier:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if ((uint64_t)a4 > 0xFFFFFFFFFFLL)
  {
    if (a4 == 0x10000000000 || a4 == 0x20000000000) {
      goto LABEL_9;
    }
    uint64_t v8 = 0x40000000000;
  }
  else
  {
    if (a4 == 0x800000000)
    {
LABEL_9:
      uint64_t v9 = AXLogRTT();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = a4;
        _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Handling message update: %d", buf, 8u);
      }

      messageProcessingQueue = self->_messageProcessingQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke_37;
      block[3] = &unk_2645404A0;
      id v15 = v7;
      v16 = self;
      unint64_t v17 = a4;
      dispatch_async(messageProcessingQueue, block);
      id v11 = v15;
LABEL_12:

      goto LABEL_13;
    }
    if (a4 == 0x1000000000)
    {
      id v12 = [v6 valueForKey:@"result"];
      id v13 = AXLogRTT();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl(&dword_21FEA9000, v13, OS_LOG_TYPE_INFO, "Got result for action sheet: %@", buf, 0xCu);
      }

      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke;
      v21 = &unk_2645400C0;
      v22 = v12;
      v23 = self;
      id v11 = v12;
      AXPerformBlockAsynchronouslyOnMainThread();

      goto LABEL_12;
    }
    uint64_t v8 = 0x4000000000;
  }
  if (a4 == v8) {
    goto LABEL_9;
  }
LABEL_13:
}

void __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) actionCompletionBlock];

    if (v2)
    {
      [*(id *)(a1 + 40) _managerAXPIDState:0];
      BOOL v3 = [*(id *)(a1 + 40) actionCompletionBlock];
      v3[2](v3, [*(id *)(a1 + 32) unsignedIntegerValue]);

      uint64_t v4 = *(void **)(a1 + 40);
      [v4 setActionCompletionBlock:0];
    }
  }
}

uint64_t __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke_37(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke_2;
  v6[3] = &unk_264540478;
  v6[4] = *(void *)(a1 + 40);
  uint64_t result = [v2 enumerateKeysAndObjectsUsingBlock:v6];
  if (*(void *)(a1 + 48) == 0x4000000000)
  {
    [*(id *)(*(void *)(a1 + 40) + 48) lock];
    uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 56);
    v5 = [*(id *)(a1 + 32) allKeys];
    [v4 removeObjectsForKeys:v5];

    return [*(id *)(*(void *)(a1 + 40) + 48) unlock];
  }
  return result;
}

void __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(a1 + 32) + 48) lock];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v5];
  uint64_t v8 = (void (**)(void, void))[v7 copy];

  [*(id *)(*(void *)(a1 + 32) + 48) unlock];
  uint64_t v9 = AXLogRTT();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)MEMORY[0x223C608D0](v8);
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    objc_super v14 = v10;
    _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Handling response for %@ with %@", (uint8_t *)&v11, 0x16u);
  }
  if (v8) {
    ((void (**)(void, id))v8)[2](v8, v6);
  }
}

- (void)handleMessageError:(id)a3 destructive:(BOOL)a4
{
  id v4 = a3;
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[RTTServer handleMessageError:destructive:]();
  }
}

- (void)shouldRestartOnInterruption:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F472B0];
  id v4 = (void (**)(id, uint64_t))a3;
  v4[2](v4, [v3 currentProcessIsInCallService]);
}

- (BOOL)isEmergencyNumber:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F7E1B0]) init];
  id v5 = [v4 telephonyProvider];
  id v6 = [v5 prioritizedSenderIdentities];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F7E290]) init];
  if ([v6 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "UUID", (void)v17);
          char v14 = [v7 isEmergencyNumberForDigits:v3 senderIdentityUUID:v13];

          if (v14)
          {

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    goto LABEL_14;
  }
  if (([v7 isEmergencyNumberForDigits:v3 senderIdentityUUID:0] & 1) == 0)
  {
LABEL_14:
    BOOL v15 = 0;
    goto LABEL_15;
  }
LABEL_13:
  BOOL v15 = 1;
LABEL_15:

  return v15;
}

- (void)displayCallPromptForContact:(id)a3 withCompletion:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  if ([(RTTServer *)self isEmergencyNumber:v6])
  {
    id v8 = AXLogRTT();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v6;
      _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_DEFAULT, "Contact matching emergency number, dialing through RTT immediately: %@", buf, 0xCu);
    }

    if (+[RTTTelephonyUtilities shouldUseRTT]) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    v7[2](v7, v9);
  }
  else
  {
    [(RTTServer *)self _managerAXPIDState:1];
    uint64_t v10 = AXLogRTT();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v6;
      _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Display call prompt for %@", buf, 0xCu);
    }

    uint64_t v11 = (__CFString *)v6;
    if (v11) {
      id v12 = v11;
    }
    else {
      id v12 = &stru_26D1B01C8;
    }
    objc_initWeak(&location, self);
    __int16 v13 = [(RTTServer *)self assertionInCallService];
    if (v13)
    {
      char v14 = [(RTTServer *)self assertionInCallService];
      int v15 = [v14 isValid];

      if (v15)
      {
        v16 = [(RTTServer *)self assertionInCallService];
        [v16 invalidate];
      }
    }
    long long v17 = [MEMORY[0x263F64630] targetWithPid:getpid()];
    long long v18 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.Accessibility" name:@"CallTypeSelection"];
    id v19 = objc_alloc(MEMORY[0x263F64408]);
    v36 = v18;
    long long v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
    v21 = (void *)[v19 initWithExplanation:@"Prevent InCallService from sleeping to receive call type selection" target:v17 attributes:v20];
    [(RTTServer *)self setAssertionInCallService:v21];

    uint64_t v22 = [(RTTServer *)self assertionInCallService];
    id v32 = 0;
    int v23 = [v22 acquireWithError:&v32];
    id v24 = v32;

    if (v23)
    {
      v25 = AXLogRTT();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = [(RTTServer *)self assertionInCallService];
        *(_DWORD *)buf = 138412290;
        id v38 = v26;
        _os_log_impl(&dword_21FEA9000, v25, OS_LOG_TYPE_INFO, "Took out assertion so that InCallService doesn't go to sleep on us: %@", buf, 0xCu);
      }
    }
    else
    {
      v27 = AXLogRTT();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[RTTServer displayCallPromptForContact:withCompletion:]();
      }

      v25 = [(RTTServer *)self assertionInCallService];
      [v25 invalidate];
    }

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __56__RTTServer_displayCallPromptForContact_withCompletion___block_invoke;
    v29[3] = &unk_2645404C8;
    v30 = v7;
    objc_copyWeak(&v31, &location);
    [(RTTServer *)self setActionCompletionBlock:v29];
    v34[0] = @"shouldShow";
    v34[1] = @"title";
    v35[0] = MEMORY[0x263EFFA88];
    v35[1] = v12;
    v28 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    [(RTTServer *)self sendMessageWithPayload:v28 andIdentifier:0x1000000000];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

void __56__RTTServer_displayCallPromptForContact_withCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained assertionInCallService];
  [v2 invalidate];
}

- (void)cancelCallPromptDisplay
{
  [(RTTServer *)self _managerAXPIDState:0];

  [(RTTServer *)self sendMessageWithPayload:&unk_26D1B3A80 andIdentifier:0x1000000000];
}

- (void)setShouldSuppressIncomingNotification:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"shouldSuppress";
  id v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(RTTServer *)self sendMessageWithPayload:v5 andIdentifier:0x8000000000];
}

- (void)registerResponseBlock:(id)a3 forUUID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && [v6 length])
  {
    uint64_t v7 = (void *)[v10 copy];
    [(NSLock *)self->_dataResponseBlocksLock lock];
    databaseResponseBlocks = self->_databaseResponseBlocks;
    uint64_t v9 = (void *)MEMORY[0x223C608D0](v7);
    [(NSMutableDictionary *)databaseResponseBlocks setObject:v9 forKey:v6];

    [(NSLock *)self->_dataResponseBlocksLock unlock];
  }
}

- (id)_createSandboxUrlForVoicemailMessage:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v3];
  id v5 = [v3 objectForKey:@"axtty_voicemail_message_url"];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F7E288]) initWithURL:v5 withExtensionType:0];
    id v21 = 0;
    uint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v21];
    id v8 = v21;
    if (v8)
    {
      uint64_t v9 = AXLogRTT();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RTTServer _createSandboxUrlForVoicemailMessage:]();
      }

      id v10 = v3;
    }
    else
    {
      [v4 setValue:v7 forKey:@"axtty_voicemail_message_url"];
      id v10 = v4;
    }
    id v19 = v10;
  }
  else
  {
    uint64_t v11 = AXLogRTT();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RTTServer _createSandboxUrlForVoicemailMessage:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    id v19 = v3;
  }

  return v19;
}

- (void)findConversationForCallUID:(id)a3 andResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v7 && v8)
  {
    uint64_t v9 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__RTTServer_findConversationForCallUID_andResult___block_invoke;
    block[3] = &unk_264540518;
    id v11 = v6;
    uint64_t v12 = self;
    id v13 = v7;
    dispatch_async(v9, block);
  }
}

void __50__RTTServer_findConversationForCallUID_andResult___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v2 = [NSString stringWithFormat:@"%@_%@", @"axtty_read_action", *(void *)(a1 + 32)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__RTTServer_findConversationForCallUID_andResult___block_invoke_2;
  v8[3] = &unk_2645404F0;
  id v3 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [v3 registerResponseBlock:v8 forUUID:v2];
  uint64_t v12 = @"axtty_read_action";
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v10 = @"axtty_callID";
  uint64_t v11 = v4;
  id v6 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v5 sendMessageWithPayload:v7 andIdentifier:0x800000000];
}

void __50__RTTServer_findConversationForCallUID_andResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:@"axtty_conversation"];
  id v5 = [MEMORY[0x263EFF9D0] null];

  if (v4 == v5)
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F08928]);
    id v7 = [v3 objectForKey:@"axtty_conversation"];
    id v13 = 0;
    uint64_t v8 = (void *)[v6 initForReadingFromData:v7 error:&v13];
    id v9 = v13;

    if (v9)
    {
      id v10 = AXLogRTT();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __39__RTTController_handleDatabaseRequest___block_invoke_cold_2();
      }

      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v11 = [v8 decodeObjectOfClasses:v12 forKey:*MEMORY[0x263F081D0]];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSystemOutputAudioMuted:(BOOL)a3 withCallID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v16 = v4;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "requesting server to toggle mute: %d %@", buf, 0x12u);
  }

  id v13 = @"axtty_media_action";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", v4, @"axtty_value");
  v11[1] = @"axtty_callID";
  v12[0] = v8;
  v12[1] = v6;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v14 = v9;
  id v10 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [(RTTServer *)self sendMessageWithPayload:v10 andIdentifier:0x80000000000];
}

- (void)setViewControllerIsVisible:(BOOL)a3 withCallID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = AXLogRTT();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v13 = v4;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Requesting server to toggle view visibility: %d %@", buf, 0x12u);
    }

    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", v4, @"axtty_callID", @"axtty_is_viewcontrollervisible_key", v6);
    v11[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:2];
    [(RTTServer *)self sendMessageWithPayload:v9 andIdentifier:0x100000000000];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[RTTServer setViewControllerIsVisible:withCallID:]();
  }
}

- (void)sendString:(id)a3 forCallUID:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F472B0];
  id v7 = a4;
  id v8 = a3;
  int v9 = [v6 currentProcessIsRTTExternsion];
  id v15 = @"axtty_conversation_updates";
  v13[0] = @"axtty_callID";
  v13[1] = @"axtty_value";
  v14[0] = v7;
  v14[1] = v8;
  uint64_t v10 = &unk_26D1B3B80;
  if (!v9) {
    uint64_t v10 = &unk_26D1B3B98;
  }
  void v13[2] = @"axtty_sender_type";
  v13[3] = @"axtty_message_type";
  v14[2] = v10;
  v14[3] = &unk_26D1B3B98;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  v16[0] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  [(RTTServer *)self sendMessageWithPayload:v12 andIdentifier:0x800000000];
}

- (void)sendTranscription:(id)a3 forCallUUID:(id)a4 isNew:(BOOL)a5
{
  BOOL v5 = a5;
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = (void *)MEMORY[0x263F472B0];
  id v9 = a4;
  id v10 = a3;
  int v11 = [v8 currentProcessIsRTTExternsion];
  id v18 = @"axtty_conversation_updates";
  v16[0] = @"axtty_callID";
  v16[1] = @"axtty_value";
  v17[0] = v9;
  v17[1] = v10;
  uint64_t v12 = &unk_26D1B3B98;
  if (v11) {
    uint64_t v12 = &unk_26D1B3B80;
  }
  void v16[2] = @"axtty_sender_type";
  v16[3] = @"axtty_message_type";
  BOOL v13 = &unk_26D1B3BB0;
  if (v5) {
    BOOL v13 = &unk_26D1B3B80;
  }
  v17[2] = v12;
  v17[3] = v13;
  __int16 v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
  v19[0] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  [(RTTServer *)self sendMessageWithPayload:v15 andIdentifier:0x800000000];
}

- (void)sendConversationUpdate:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v9 = 0;
  BOOL v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = AXLogRTT();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[RTTServer sendConversationUpdate:]();
    }
  }
  else
  {
    int v11 = v5;
    uint64_t v12 = @"axtty_write_action";
    id v10 = @"axtty_conversation";
    id v7 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [(RTTServer *)self sendMessageWithPayload:v8 andIdentifier:0x800000000];
  }
}

- (void)registerForUpdates:(id)a3 forCallUID:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@"%@_%@", @"axtty_conversation_updates", v7];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__RTTServer_registerForUpdates_forCallUID___block_invoke;
    v18[3] = &unk_2645404F0;
    id v19 = v6;
    [(RTTServer *)self registerResponseBlock:v18 forUUID:v8];
    id v21 = v7;
    uint64_t v22 = @"axtty_conversation_updates";
    long long v20 = @"axtty_callID";
    id v9 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v23[0] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [(RTTServer *)self sendMessageWithPayload:v10 andIdentifier:0x800000000];
  }
  else
  {
    id v8 = AXLogRTT();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RTTServer registerForUpdates:forCallUID:](v8, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void __43__RTTServer_registerForUpdates_forCallUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 objectForKey:@"axtty_result"];
  id v4 = [v3 objectForKey:@"axtty_value"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerForRemoteUpdates:(id)a3 forCallUID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@"%@_%@", @"axtty_remote_conversation_updates", v7];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __49__RTTServer_registerForRemoteUpdates_forCallUID___block_invoke;
    v19[3] = &unk_2645404F0;
    id v20 = v6;
    [(RTTServer *)self registerResponseBlock:v19 forUUID:v8];
    id v9 = AXLogRTT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v7;
      _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Registered for remote updates for: %@", buf, 0xCu);
    }

    id v22 = v7;
    int v23 = @"axtty_remote_conversation_updates";
    id v21 = @"axtty_callID";
    id v10 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v24 = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [(RTTServer *)self sendMessageWithPayload:v11 andIdentifier:0x10000000000];
  }
  else
  {
    id v8 = AXLogRTT();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RTTServer registerForUpdates:forCallUID:](v8, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __49__RTTServer_registerForRemoteUpdates_forCallUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 objectForKey:@"axtty_result"];
  id v4 = [v3 objectForKey:@"axtty_value"];
  id v5 = [v3 objectForKey:@"axtty_message_type"];

  [v5 integerValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerForServiceUpdates:(id)a3 forCallUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"%@_%@", @"axtty_service_message_updates", v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __50__RTTServer_registerForServiceUpdates_forCallUID___block_invoke;
  v13[3] = &unk_2645404F0;
  id v14 = v6;
  id v9 = v6;
  [(RTTServer *)self registerResponseBlock:v13 forUUID:v8];
  id v10 = AXLogRTT();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Registered for service updates for: %@", buf, 0xCu);
  }

  id v16 = v7;
  uint64_t v17 = @"axtty_service_message_updates";
  uint64_t v15 = @"axtty_callID";
  uint64_t v11 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  uint64_t v18 = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [(RTTServer *)self sendMessageWithPayload:v12 andIdentifier:0x20000000000];
}

void __50__RTTServer_registerForServiceUpdates_forCallUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 objectForKey:@"axtty_result"];
  id v4 = [v3 objectForKey:@"axtty_value"];
  id v5 = [v3 objectForKey:@"axtty_set_visible_service_update"];

  [v5 BOOLValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)deleteConversationWithCallUID:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = @"axtty_delete_action";
  id v9 = @"axtty_callID";
  id v4 = NSDictionary;
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v12[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [(RTTServer *)self sendMessageWithPayload:v7 andIdentifier:0x800000000];
  return 1;
}

- (BOOL)contactIsTTYContact:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v5 = [v4 identifier];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    commonRequestQueue = self->_commonRequestQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __33__RTTServer_contactIsTTYContact___block_invoke;
    v13[3] = &unk_2645405B8;
    id v14 = v4;
    uint64_t v15 = self;
    dispatch_semaphore_t v16 = v7;
    uint64_t v17 = &v18;
    id v9 = v7;
    dispatch_async(commonRequestQueue, v13);
    dispatch_time_t v10 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v9, v10);
  }
  char v11 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __33__RTTServer_contactIsTTYContact___block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x263EFE070];
  v37[0] = *MEMORY[0x263EFE070];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  LODWORD(v3) = [v3 areKeysAvailable:v5];

  if (v3)
  {
    uint64_t v6 = [*(id *)(a1 + 32) phoneNumbers];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __33__RTTServer_contactIsTTYContact___block_invoke_2;
    v29[3] = &unk_264540540;
    dispatch_semaphore_t v7 = &v30;
    id v30 = v2;
    [v6 enumerateObjectsUsingBlock:v29];
  }
  else
  {
    uint64_t v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
    id v8 = [v6 contactStore];
    id v9 = (void *)MEMORY[0x263EFE9F8];
    dispatch_time_t v10 = [*(id *)(a1 + 32) identifier];
    v36 = v10;
    char v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
    uint64_t v12 = [v9 predicateForContactsWithIdentifiers:v11];
    uint64_t v35 = v4;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
    id v14 = [v8 unifiedContactsMatchingPredicate:v12 keysToFetch:v13 error:0];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __33__RTTServer_contactIsTTYContact___block_invoke_3;
    v27[3] = &unk_264540568;
    dispatch_semaphore_t v7 = &v28;
    id v28 = v2;
    [v14 enumerateObjectsUsingBlock:v27];
  }
  if ([v2 count])
  {
    uint64_t v15 = NSString;
    dispatch_semaphore_t v16 = [*(id *)(a1 + 32) identifier];
    uint64_t v17 = [v15 stringWithFormat:@"%@_%@", @"axtty_contact_path_search_action", v16];

    uint64_t v18 = *(void **)(a1 + 40);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __33__RTTServer_contactIsTTYContact___block_invoke_5;
    v25[3] = &unk_264540590;
    long long v24 = *(_OWORD *)(a1 + 48);
    id v19 = (id)v24;
    long long v26 = v24;
    [v18 registerResponseBlock:v25 forUUID:v17];
    v33 = @"axtty_contact_path_search_action";
    v31[0] = @"axtty_contactID";
    uint64_t v20 = *(void **)(a1 + 40);
    char v21 = [*(id *)(a1 + 32) identifier];
    v31[1] = @"axtty_value";
    v32[0] = v21;
    v32[1] = v2;
    id v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    v34 = v22;
    int v23 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v20 sendMessageWithPayload:v23 andIdentifier:0x800000000];
  }
}

void __33__RTTServer_contactIsTTYContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 value];
  id v3 = [v4 stringValue];
  [v2 addObject:v3];
}

void __33__RTTServer_contactIsTTYContact___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 phoneNumbers];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__RTTServer_contactIsTTYContact___block_invoke_4;
  v4[3] = &unk_264540540;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __33__RTTServer_contactIsTTYContact___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 value];
  id v3 = [v4 stringValue];
  [v2 addObject:v3];
}

intptr_t __33__RTTServer_contactIsTTYContact___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"axtty_result"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLValue];

  id v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

- (id)valueForTTYSetting:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1;
  id v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  if ([v4 length])
  {
    id v5 = dispatch_get_current_queue();
    specific = dispatch_queue_get_specific(v5, &valueForTTYSetting__SemaphoreKey);
    if (specific)
    {
      dispatch_semaphore_t v7 = specific;
    }
    else
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      dispatch_queue_set_specific(v5, &valueForTTYSetting__SemaphoreKey, v7, (dispatch_function_t)destructor);
      id v8 = AXLogRTT();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v4;
        _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Making new semaphore for this request: %@", buf, 0xCu);
      }
    }
    id v9 = AXLogRTT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v4;
      _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Requesting value remotely: %@", buf, 0xCu);
    }

    commonRequestQueue = self->_commonRequestQueue;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __32__RTTServer_valueForTTYSetting___block_invoke;
    id v19 = &unk_264540608;
    uint64_t v20 = self;
    int v23 = &v24;
    id v21 = v4;
    char v11 = v7;
    id v22 = v11;
    dispatch_async(commonRequestQueue, &v16);
    dispatch_time_t v12 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v11, v12))
    {
      uint64_t v13 = AXLogRTT();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[RTTServer valueForTTYSetting:]();
      }

      dispatch_queue_set_specific(v5, &valueForTTYSetting__SemaphoreKey, 0, (dispatch_function_t)destructor);
      if (objc_msgSend(MEMORY[0x263F472B0], "isInternalInstall", v16, v17, v18, v19, v20, v21)) {
        [(RTTServer *)self _takeStackshot];
      }
    }
  }
  id v14 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __32__RTTServer_valueForTTYSetting___block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x263EF8340];
  id v2 = [NSString stringWithFormat:@"%@_%lld", @"axtty_settings_key", ++valueForTTYSetting__AtomicCount];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __32__RTTServer_valueForTTYSetting___block_invoke_2;
  v7[3] = &unk_2645405E0;
  uint64_t v10 = *(void *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [v3 registerResponseBlock:v7 forUUID:v2];
  v13[0] = @"axtty_uuid";
  v13[1] = @"axtty_settings_key";
  uint64_t v4 = *(void *)(a1 + 40);
  v14[0] = v2;
  v14[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v6 = AXLogRTT();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    dispatch_time_t v12 = v5;
    _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Dispatch requesting: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) sendMessageWithPayload:v5 andIdentifier:0x4000000000];
}

void __32__RTTServer_valueForTTYSetting___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:@"axtty_result"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_semaphore_t v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "Received remote RTT setting: %@={%@}", (uint8_t *)&v9, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_takeStackshot
{
  id v2 = AXLogRTT();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Writing out stackshot", v6, 2u);
  }

  id v3 = (void (*)(__CFString *, uint64_t))_takeStackshot___gWriteStackshotReportFunction;
  if (_takeStackshot___gWriteStackshotReportFunction) {
    goto LABEL_7;
  }
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  if (v4)
  {
    uint64_t v5 = v4;
    _takeStackshot___gWriteStackshotReportFunction = dlsym(v4, "WriteStackshotReport");
    dlclose(v5);
  }
  id v3 = (void (*)(__CFString *, uint64_t))_takeStackshot___gWriteStackshotReportFunction;
  if (_takeStackshot___gWriteStackshotReportFunction) {
LABEL_7:
  }
    v3(@"Timeout waiting for heard to respond", 3131746989);
}

- (void)setTTYDictionaryAvailability:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = @"shouldBeAvailable";
  uint64_t v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(RTTServer *)self sendMessageWithPayload:v5 andIdentifier:0x2000000000];
}

- (void)primeRTTServer
{
  void v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"axtty_uuid";
  id v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = [v3 UUIDString];
  v6[1] = @"axtty_settings_key";
  v7[0] = v4;
  v7[1] = kAXSRTTSettingsVersionPreference;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(RTTServer *)self sendMessageWithPayload:v5 andIdentifier:0x4000000000];
}

- (id)actionCompletionBlock
{
  return self->_actionCompletionBlock;
}

- (void)setActionCompletionBlock:(id)a3
{
}

- (RBSAssertion)assertionInCallService
{
  return self->_assertionInCallService;
}

- (void)setAssertionInCallService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionInCallService, 0);
  objc_storeStrong(&self->_actionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_messageProcessingQueue, 0);
  objc_storeStrong((id *)&self->_commonRequestQueue, 0);
  objc_storeStrong((id *)&self->_databaseResponseBlocks, 0);

  objc_storeStrong((id *)&self->_dataResponseBlocksLock, 0);
}

- (void)handleMessageError:destructive:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)displayCallPromptForContact:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Failed to aquire CallTypeSelection assertion: %@", v2, v3, v4, v5, v6);
}

- (void)_createSandboxUrlForVoicemailMessage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createSandboxUrlForVoicemailMessage:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Failed to archive sandbox url data with error %@", v2, v3, v4, v5, v6);
}

- (void)setViewControllerIsVisible:withCallID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "No call id available to set view controller visible: %@", v2, v3, v4, v5, v6);
}

- (void)sendConversationUpdate:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21FEA9000, v1, OS_LOG_TYPE_ERROR, "Failed to archive RTTConversation %@ with error %@", v2, 0x16u);
}

- (void)registerForUpdates:(uint64_t)a3 forCallUID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)valueForTTYSetting:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Timeout waiting for setting: %@", v2, v3, v4, v5, v6);
}

@end