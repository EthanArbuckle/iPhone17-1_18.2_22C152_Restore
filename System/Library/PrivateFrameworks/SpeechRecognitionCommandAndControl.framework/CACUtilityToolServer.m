@interface CACUtilityToolServer
+ (id)sharedInstance;
- (CACUtilityToolServer)init;
- (NSMutableSet)xpcClients;
- (NSString)phoneticAlternative;
- (id)dictationStatus;
- (id)drillStatus;
- (id)gridNumberToHitRect:(CGRect)a3 displayID:(unsigned int)a4;
- (id)listeningStatus;
- (id)numbersForOnboardingElements;
- (id)overlayStatus;
- (id)recognizedCommandIdentifier;
- (void)addClient:(id)a3;
- (void)notifyClients:(id)a3;
- (void)notifyCorrectionForString;
- (void)notifyDictationModeChanged;
- (void)notifyDidDictateText;
- (void)notifyDrilled;
- (void)notifyListeningStatusChanged;
- (void)notifyNumbersForOnboardingElements;
- (void)notifyOverlayStatusChanged;
- (void)notifyRecognizedCommandIdentifier;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeClient:(id)a3;
- (void)setPhoneticAlternative:(id)a3;
- (void)setXpcClients:(id)a3;
- (void)startObserving;
@end

@implementation CACUtilityToolServer

+ (id)sharedInstance
{
  if (sharedInstance_singletonInit != -1) {
    dispatch_once(&sharedInstance_singletonInit, &__block_literal_global_28);
  }
  v2 = (void *)sCACUtilityToolServer;
  return v2;
}

uint64_t __38__CACUtilityToolServer_sharedInstance__block_invoke()
{
  sCACUtilityToolServer = objc_alloc_init(CACUtilityToolServer);
  return MEMORY[0x270F9A758]();
}

- (CACUtilityToolServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)CACUtilityToolServer;
  id v2 = [(CACUtilityToolServer *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__getNumbersForElements name:@"SOLabeledElementsOverlayDidUpdateElementsNotification" object:0];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.speech.ToolServerQueue", 0);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    v6 = objc_opt_new();
    [v2 setXpcClients:v6];

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.speech.CommandAndControl.utility", *((dispatch_queue_t *)v2 + 1), 1uLL);
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = mach_service;

    xpc_connection_set_event_handler(*((xpc_connection_t *)v2 + 2), &__block_literal_global_10);
    xpc_connection_resume(*((xpc_connection_t *)v2 + 2));
  }
  return (CACUtilityToolServer *)v2;
}

void __28__CACUtilityToolServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (MEMORY[0x23EC8F590]() == MEMORY[0x263EF86F0])
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __utility_tool_event_handler_block_invoke;
    handler[3] = &unk_264D12558;
    id v3 = v2;
    id v7 = v3;
    xpc_connection_set_event_handler((xpc_connection_t)v3, handler);
    dispatch_queue_t v4 = dispatch_get_global_queue(21, 0);
    xpc_connection_set_target_queue((xpc_connection_t)v3, v4);

    xpc_connection_resume((xpc_connection_t)v3);
    v5 = +[CACUtilityToolServer sharedInstance];
    [v5 addClient:v3];
  }
}

- (void)startObserving
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CACUtilityToolServer_startObserving__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __38__CACUtilityToolServer_startObserving__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CACUtilityToolServer_startObserving__block_invoke_2;
  block[3] = &unk_264D115D0;
  block[4] = *(void *)(a1 + 32);
  if (startObserving_onceToken != -1) {
    dispatch_once(&startObserving_onceToken, block);
  }
}

void __38__CACUtilityToolServer_startObserving__block_invoke_2(uint64_t a1)
{
  id v2 = +[CACDisplayManager sharedManager];
  [v2 addObserver:*(void *)(a1 + 32) forKeyPath:@"_statusIndicatorType" options:3 context:0];

  id v3 = +[CACDisplayManager sharedManager];
  [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"statusIndicatorType" options:3 context:0];

  dispatch_queue_t v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v4 addObserver:*(void *)(a1 + 32) forKeyPath:@"_recognizerInteractionLevels" options:3 context:0];

  v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v5 addObserver:*(void *)(a1 + 32) forKeyPath:@"transientOverlayType" options:3 context:0];

  v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v6 addObserver:*(void *)(a1 + 32) forKeyPath:@"dictationRecognizerMode" options:3 context:0];

  id v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v7 addObserver:*(void *)(a1 + 32) forKeyPath:@"previousTextInsertionSpecifier" options:3 context:0];

  v8 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v8 addObserver:*(void *)(a1 + 32) forKeyPath:@"recognizedCommandIdentifier" options:3 context:0];

  v9 = +[CACUtilityToolServer sharedInstance];
  [v9 addObserver:*(void *)(a1 + 32) forKeyPath:@"phoneticAlternative" options:3 context:0];

  id v10 = +[CACDisplayManager sharedManager];
  [v10 addObserver:*(void *)(a1 + 32) forKeyPath:@"gridDidDrill" options:3 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v12 = a3;
  uint64_t v8 = *MEMORY[0x263F081C8];
  id v9 = a5;
  id v10 = [v9 objectForKeyedSubscript:v8];
  v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

  if (v10 != v11 && ([v10 isEqual:v11] & 1) == 0)
  {
    if (([v12 isEqual:@"waitingForWakeUpCommand"] & 1) != 0
      || ([v12 isEqual:@"_recognizerInteractionLevels"] & 1) != 0
      || [v12 isEqual:@"statusIndicatorType"])
    {
      [(CACUtilityToolServer *)self notifyListeningStatusChanged];
    }
    else if ([v12 isEqual:@"transientOverlayType"])
    {
      [(CACUtilityToolServer *)self notifyOverlayStatusChanged];
    }
    else if ([v12 isEqual:@"dictationRecognizerMode"])
    {
      [(CACUtilityToolServer *)self notifyDictationModeChanged];
    }
    else if ([v12 isEqual:@"previousTextInsertionSpecifier"])
    {
      [(CACUtilityToolServer *)self notifyDidDictateText];
    }
    else if ([v12 isEqual:@"recognizedCommandIdentifier"])
    {
      [(CACUtilityToolServer *)self notifyRecognizedCommandIdentifier];
    }
    else if ([v12 isEqual:@"phoneticAlternative"])
    {
      [(CACUtilityToolServer *)self notifyCorrectionForString];
    }
    else if ([v12 isEqual:@"gridDidDrill"])
    {
      [(CACUtilityToolServer *)self notifyDrilled];
    }
  }
}

- (void)notifyNumbersForOnboardingElements
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(CACUtilityToolServer *)self numbersForOnboardingElements];
  dispatch_queue_t v4 = v3;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = [v3 allKeys];
    uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v10 = NSString;
          v11 = [v4 valueForKey:v9];
          id v12 = [v10 stringWithFormat:@"%@ : %@", v9, v11];

          v19 = @"NumbersForOnboardingElements";
          v20 = v12;
          v13 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
          [(CACUtilityToolServer *)self notifyClients:v13];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v6);
    }
  }
}

- (id)gridNumberToHitRect:(CGRect)a3 displayID:(unsigned int)a4
{
  dispatch_queue_t v4 = &unk_26EB4D170;
  if (a3.size.width > 0.0)
  {
    double height = a3.size.height;
    if (a3.size.height > 0.0)
    {
      uint64_t v6 = *(void *)&a4;
      double width = a3.size.width;
      double y = a3.origin.y;
      double x = a3.origin.x;
      id v10 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v11 = [v10 isActiveOverlayType:@"NumberedGrid"];

      if (v11)
      {
        id v12 = +[CACDisplayManager sharedManager];
        dispatch_queue_t v4 = objc_msgSend(v12, "gridNumberForRect:displayID:", v6, x, y, width, height);
      }
      else
      {
        dispatch_queue_t v4 = &unk_26EB4D198;
      }
    }
  }
  return v4;
}

- (id)numbersForOnboardingElements
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = +[CACDisplayManager sharedManager];
  dispatch_queue_t v4 = [v3 labeledElementsForItemNumbers];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "axIdentifier", (void)v16);
        id v12 = v11;
        if (v11 && [v11 rangeOfString:@"AX_ONBOARDING"] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = [v10 numberedLabel];
          [v2 setObject:v13 forKey:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v2 count]) {
    id v14 = v2;
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (id)overlayStatus
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v3 = [v2 activeOverlayType];
  dispatch_queue_t v4 = v3;
  if (!v3) {
    id v3 = @"none";
  }
  id v5 = v3;

  return v5;
}

- (id)drillStatus
{
  id v2 = +[CACDisplayManager sharedManager];
  if ([v2 gridDidDrill]) {
    id v3 = @"1";
  }
  else {
    id v3 = @"0";
  }
  dispatch_queue_t v4 = v3;

  return v4;
}

- (void)notifyDictationModeChanged
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CACUtilityToolServer *)self dictationStatus];
  dispatch_queue_t v4 = (void *)v3;
  if (v3)
  {
    uint64_t v6 = @"DictationStatusString";
    v7[0] = v3;
    id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(CACUtilityToolServer *)self notifyClients:v5];
  }
}

- (id)dictationStatus
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  unsigned int v3 = [v2 dictationRecognizerMode];

  if (v3 > 3) {
    return @"Default";
  }
  else {
    return off_264D12578[v3];
  }
}

- (void)notifyDidDictateText
{
  v8[1] = *MEMORY[0x263EF8340];
  unsigned int v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  dispatch_queue_t v4 = [v3 previousTextInsertionSpecifier];

  id v5 = [v4 insertedString];
  if ([v5 length])
  {
    uint64_t v7 = @"DidDictateText";
    v8[0] = v5;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [(CACUtilityToolServer *)self notifyClients:v6];
  }
}

- (void)notifyOverlayStatusChanged
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"OverlayStatusString";
  unsigned int v3 = [(CACUtilityToolServer *)self overlayStatus];
  v6[0] = v3;
  dispatch_queue_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(CACUtilityToolServer *)self notifyClients:v4];
}

- (void)notifyDrilled
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"DrilledAtNumber";
  unsigned int v3 = [(CACUtilityToolServer *)self drillStatus];
  v6[0] = v3;
  dispatch_queue_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(CACUtilityToolServer *)self notifyClients:v4];
}

- (id)listeningStatus
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v3 = [v2 isListening];

  if (!v3) {
    return @"Off";
  }
  dispatch_queue_t v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v5 = [v4 currentInteractionLevel];

  if ((v5 - 1) >= 2) {
    return @"Listening";
  }
  else {
    return @"Sleeping";
  }
}

- (void)notifyListeningStatusChanged
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CACUtilityToolServer *)self listeningStatus];
  dispatch_queue_t v4 = (void *)v3;
  if (v3)
  {
    uint64_t v6 = @"ListeningStatusString";
    v7[0] = v3;
    int v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(CACUtilityToolServer *)self notifyClients:v5];
  }
}

- (void)notifyRecognizedCommandIdentifier
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CACUtilityToolServer *)self recognizedCommandIdentifier];
  dispatch_queue_t v4 = (void *)v3;
  if (v3)
  {
    uint64_t v6 = @"RecognizedCommandIdentifierString";
    v7[0] = v3;
    int v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(CACUtilityToolServer *)self notifyClients:v5];
  }
}

- (id)recognizedCommandIdentifier
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v3 = [v2 recognizedCommandIdentifier];

  if (v3
    && (long long v12 = 0u,
        long long v13 = 0u,
        long long v10 = 0u,
        long long v11 = 0u,
        (uint64_t v4 = [&unk_26EB4D0D0 countByEnumeratingWithState:&v10 objects:v14 count:16]) != 0))
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    uint64_t v7 = @"OtherIdentifier";
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&unk_26EB4D0D0);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isEqualToString:v3])
        {
          uint64_t v7 = v3;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [&unk_26EB4D0D0 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = @"OtherIdentifier";
  }
LABEL_13:

  return v7;
}

- (void)notifyCorrectionForString
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CACUtilityToolServer *)self phoneticAlternative];

  if (v3)
  {
    uint64_t v6 = @"PhoneticAlternative";
    uint64_t v4 = [(CACUtilityToolServer *)self phoneticAlternative];
    v7[0] = v4;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(CACUtilityToolServer *)self notifyClients:v5];
  }
}

- (void)notifyClients:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)CACCreateSerializedObject((uint64_t)a3);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(CACUtilityToolServer *)self xpcClients];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(*((void *)&v10 + 1) + 8 * v9++), v4);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CACUtilityToolServer *)self startObserving];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __34__CACUtilityToolServer_addClient___block_invoke;
    v5[3] = &unk_264D117C0;
    id v6 = v4;
    uint64_t v7 = self;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

void __34__CACUtilityToolServer_addClient___block_invoke(uint64_t a1)
{
  if (utility_tool_connection_entitled())
  {
    id v2 = [*(id *)(a1 + 40) xpcClients];
    [v2 addObject:*(void *)(a1 + 32)];
  }
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __37__CACUtilityToolServer_removeClient___block_invoke;
    v6[3] = &unk_264D117C0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __37__CACUtilityToolServer_removeClient___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcClients];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (NSMutableSet)xpcClients
{
  return self->_xpcClients;
}

- (void)setXpcClients:(id)a3
{
}

- (NSString)phoneticAlternative
{
  return self->_phoneticAlternative;
}

- (void)setPhoneticAlternative:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticAlternative, 0);
  objc_storeStrong((id *)&self->_xpcClients, 0);
  objc_storeStrong((id *)&self->_feedbackListener, 0);
  objc_storeStrong((id *)&self->_toolServerDispatchQueue, 0);
}

@end