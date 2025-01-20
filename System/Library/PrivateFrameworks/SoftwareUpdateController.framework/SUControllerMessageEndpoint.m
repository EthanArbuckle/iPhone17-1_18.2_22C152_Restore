@interface SUControllerMessageEndpoint
+ (id)sharedEndpoint;
- (IDSService)service;
- (NSMutableDictionary)messageHandlers;
- (NSMutableDictionary)pendingMessageCompletions;
- (NSMutableDictionary)pendingMessageReplies;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_queue)queue;
- (SUControllerMessageEndpoint)init;
- (id)sendMessage:(id)a3 replyingTo:(id)a4 expectingResponse:(BOOL)a5 isCritical:(BOOL)a6 error:(id *)a7;
- (void)resume;
- (void)sendErrorReply:(id)a3 toMessage:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 completion:(id)a5;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)sendReply:(id)a3 toMessage:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setHandler:(id)a3 forMessagesOfType:(id)a4;
- (void)setHandler:(id)a3 forMessagesOfTypes:(id)a4;
- (void)setMessageHandlers:(id)a3;
- (void)setPendingMessageCompletions:(id)a3;
- (void)setPendingMessageReplies:(id)a3;
- (void)suspend;
@end

@implementation SUControllerMessageEndpoint

+ (id)sharedEndpoint
{
  if (sharedEndpoint_endpointOnce != -1) {
    dispatch_once(&sharedEndpoint_endpointOnce, &__block_literal_global_0);
  }
  v2 = (void *)sharedEndpoint_endpoint;

  return v2;
}

uint64_t __45__SUControllerMessageEndpoint_sharedEndpoint__block_invoke()
{
  sharedEndpoint_endpoint = objc_alloc_init(SUControllerMessageEndpoint);

  return MEMORY[0x270F9A758]();
}

- (SUControllerMessageEndpoint)init
{
  v18.receiver = self;
  v18.super_class = (Class)SUControllerMessageEndpoint;
  v2 = [(SUControllerMessageEndpoint *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.otaupdate"];
    service = v2->_service;
    v2->_service = (IDSService *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.sucontroller.SUControllerMessageEndpoint", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.sucontroller.ids_endpoint", MEMORY[0x263EF83A8]);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.sucontrollerd.SUControllerMessageHandler", 0);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingMessageCompletions = v2->_pendingMessageCompletions;
    v2->_pendingMessageCompletions = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingMessageReplies = v2->_pendingMessageReplies;
    v2->_pendingMessageReplies = v15;
  }
  return v2;
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = +[SUControllerLogger sharedLogger];
  v8 = [NSString stringWithUTF8String:SUControllerMessageTypeKey];
  dispatch_queue_t v9 = [v5 objectForKey:v8];
  [v7 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:completion:]", @"Trying to send this message over IDS... %@", v9 label format];

  __assert_rtn("-[SUControllerMessageEndpoint sendMessage:completion:]", "SUControllerMessageEndpoint.m", 92, "false");
}

- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = +[SUControllerLogger sharedLogger];
  dispatch_queue_t v9 = [NSString stringWithUTF8String:SUControllerMessageTypeKey];
  v10 = [v6 objectForKey:v9];
  [v8 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:isCritical:completion:]", @"Trying to send this message over IDS... %@", v10 label format];

  __assert_rtn("-[SUControllerMessageEndpoint sendMessage:isCritical:completion:]", "SUControllerMessageEndpoint.m", 99, "false");
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SUControllerLogger sharedLogger];
  v8 = [NSString stringWithUTF8String:SUControllerMessageTypeKey];
  dispatch_queue_t v9 = [v5 objectForKey:v8];
  [v7 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:withReply:]", @"Trying to send this message over IDS... %@", v9 label format];

  __assert_rtn("-[SUControllerMessageEndpoint sendMessage:withReply:]", "SUControllerMessageEndpoint.m", 120, "false");
}

- (void)sendReply:(id)a3 toMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SUControllerLogger sharedLogger];
  [v7 logAtLevel:0, "-[SUControllerMessageEndpoint sendReply:toMessage:]", @"Trying to send this message over IDS... %@", v5 label format];

  __assert_rtn("-[SUControllerMessageEndpoint sendReply:toMessage:]", "SUControllerMessageEndpoint.m", 142, "false");
}

- (void)setHandler:(id)a3 forMessagesOfType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SUControllerMessageEndpoint *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SUControllerMessageEndpoint_setHandler_forMessagesOfType___block_invoke;
  block[3] = &unk_26551C0A8;
  id v12 = v7;
  id v13 = v6;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __60__SUControllerMessageEndpoint_setHandler_forMessagesOfType___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) messageHandlers];
  v2 = (void *)MEMORY[0x2611CCDC0](*(void *)(a1 + 48));
  [v3 setObject:v2 forKey:*(void *)(a1 + 40)];
}

- (void)setHandler:(id)a3 forMessagesOfTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SUControllerMessageEndpoint *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SUControllerMessageEndpoint_setHandler_forMessagesOfTypes___block_invoke;
  block[3] = &unk_26551C0D0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __61__SUControllerMessageEndpoint_setHandler_forMessagesOfTypes___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        v8 = objc_msgSend(*(id *)(a1 + 40), "messageHandlers", (void)v10);
        id v9 = (void *)MEMORY[0x2611CCDC0](*(void *)(a1 + 48));
        [v8 setObject:v9 forKey:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)sendMessage:(id)a3 replyingTo:(id)a4 expectingResponse:(BOOL)a5 isCritical:(BOOL)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v17 = a4;
  if (v12)
  {
    objc_super v18 = [MEMORY[0x263EFF9A0] dictionary];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __89__SUControllerMessageEndpoint_sendMessage_replyingTo_expectingResponse_isCritical_error___block_invoke;
    v60[3] = &unk_26551C038;
    id v19 = v18;
    id v61 = v19;
    [v12 enumerateKeysAndObjectsUsingBlock:v60];
    id v59 = 0;
    v20 = [MEMORY[0x263F08AC0] dataWithPropertyList:v19 format:200 options:0 error:&v59];
    id v25 = v59;
    if (v20)
    {
      v55 = v20;
      uint64_t v54 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
      v26 = (void *)MEMORY[0x263EFF9A0];
      [NSNumber numberWithBool:v9];
      v27 = id v56 = v17;
      v28 = [v26 dictionaryWithObject:v27 forKey:*MEMORY[0x263F49EE8]];

      if (v56) {
        [v28 setObject:v56 forKeyedSubscript:*MEMORY[0x263F49F40]];
      }
      v29 = (void *)MEMORY[0x263F49F80];
      if (a6)
      {
        v30 = &unk_270AE9A88;
        uint64_t v31 = 300;
      }
      else
      {
        v35 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
        [v28 setObject:v35 forKeyedSubscript:*v29];

        v30 = (void *)MEMORY[0x263EFFA88];
        v29 = (void *)MEMORY[0x263F49EF8];
        uint64_t v31 = 200;
      }
      [v28 setObject:v30 forKeyedSubscript:*v29];
      [v28 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F49ED8]];
      v36 = [(SUControllerMessageEndpoint *)self service];
      id v57 = v25;
      id v58 = 0;
      v34 = (void *)v54;
      char v37 = [v36 sendData:v20 toDestinations:v54 priority:v31 options:v28 identifier:&v58 error:&v57];
      id v53 = v58;
      id v38 = v57;

      v39 = +[SUControllerLogger sharedLogger];
      if (v37)
      {
        v40 = [NSString stringWithUTF8String:SUControllerMessageTypeKey];
        v41 = [v12 objectForKeyedSubscript:v40];
        if (v41)
        {
          v42 = [NSString stringWithUTF8String:SUControllerMessageTypeKey];
          v43 = [v12 objectForKeyedSubscript:v42];
          v44 = v53;
          [v39 logAtLevel:2, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", @"Sent message:%@ %@", v43, v53 label format];

          v34 = (void *)v54;
        }
        else
        {
          v44 = v53;
          [v39 logAtLevel:2, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", @"Sent message:%@ %@", &stru_270AE53E8, v53 label format];
        }
        id v17 = v56;

        id v33 = v44;
        v50 = v44;
        v20 = v55;
      }
      else
      {
        objc_msgSend(v39, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", @"Failed to send message: %ld", objc_msgSend(v38, "code"));

        if (a7)
        {
          SUControllerError(@"SUControllerError", 2, v38, @"Failed to send message: %@", v45, v46, v47, v48, (uint64_t)v38);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        v49 = +[SUControllerLogger sharedLogger];
        [v49 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", @"Failed to send message: %@", v38 label format];

        id v33 = 0;
        id v17 = v56;
        v50 = v53;
      }

      id v25 = v38;
    }
    else
    {
      if (a7)
      {
        SUControllerError(@"SUControllerError", 1, v25, @"Failed to serialize message '%@'", v21, v22, v23, v24, (uint64_t)v12);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = +[SUControllerLogger sharedLogger];
      [v34 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", @"Failed to serialize message '%@'", v12 label format];
      id v33 = 0;
    }
  }
  else
  {
    if (a7)
    {
      SUControllerError(@"SUControllerError", 1, 0, @"Cannot send nil message", v13, v14, v15, v16, v52);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = +[SUControllerLogger sharedLogger];
    [v32 logAtLevel:0 label:"-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]" format:@"Cannot send nil message"];

    id v33 = 0;
  }

  return v33;
}

void __89__SUControllerMessageEndpoint_sendMessage_replyingTo_expectingResponse_isCritical_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  v8 = [MEMORY[0x263EFF9D0] null];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v7 forKey:v10];
  }
  *a4 = 0;
}

- (void)sendErrorReply:(id)a3 toMessage:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    if (v8)
    {
      char v9 = [NSString stringWithUTF8String:SUControllerMessageErrorKey];
      uint64_t v15 = v9;
      v16[0] = v8;
      id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v14 = 0;
      long long v11 = [(SUControllerMessageEndpoint *)self sendMessage:v10 replyingTo:v7 expectingResponse:0 isCritical:1 error:&v14];
      id v12 = v14;

      if (!v11)
      {
        uint64_t v13 = +[SUControllerLogger sharedLogger];
        [v13 logAtLevel:2, "-[SUControllerMessageEndpoint sendErrorReply:toMessage:]", @"Failed to send error reply: %@", v12 label format];
      }
    }
    else
    {
      id v12 = +[SUControllerLogger sharedLogger];
      [v12 logAtLevel:2, "-[SUControllerMessageEndpoint sendErrorReply:toMessage:]", @"Failed to archive error '%@'", v6 label format];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a7;
  id v51 = 0;
  id v10 = [MEMORY[0x263F08AC0] propertyListWithData:a5 options:0 format:0 error:&v51];
  id v11 = v51;
  if (!v10)
  {
    id v12 = +[SUControllerLogger sharedLogger];
    id v13 = [v9 outgoingResponseIdentifier];
    uint64_t v41 = [v13 UTF8String];
    [v11 code];
    [v12 logAtLevel:0 label:"-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]" format:@"Failed to parse IDS message %s: %ld"];
  }
  id v14 = [v9 incomingResponseIdentifier];

  if (v14)
  {
    id v19 = [(SUControllerMessageEndpoint *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__SUControllerMessageEndpoint_service_account_incomingData_fromID_context___block_invoke;
    block[3] = &unk_26551C0F8;
    void block[4] = self;
    id v48 = v9;
    id v49 = v11;
    id v50 = v10;
    dispatch_async(v19, block);
  }
  else
  {
    if (v10)
    {
      v20 = [NSString stringWithUTF8String:SUControllerMessageTypeKey];
      uint64_t v21 = [v10 objectForKeyedSubscript:v20];

      if (v21)
      {
        uint64_t v22 = [(SUControllerMessageEndpoint *)self messageHandlers];
        id v23 = [v22 objectForKeyedSubscript:v21];

        if (v23)
        {
          uint64_t v24 = [(SUControllerMessageEndpoint *)self processingQueue];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __75__SUControllerMessageEndpoint_service_account_incomingData_fromID_context___block_invoke_2;
          v42[3] = &unk_26551C120;
          id v43 = v21;
          id v23 = v23;
          id v46 = v23;
          id v44 = v10;
          id v45 = v9;
          dispatch_async(v24, v42);

          id v25 = v43;
        }
        else
        {
          id v33 = +[SUControllerLogger sharedLogger];
          id v34 = [v9 outgoingResponseIdentifier];
          uint64_t v35 = [v34 UTF8String];
          objc_msgSend(v33, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]", @"No handler for message %s of type %s", v35, SUControllerMessageTypeKey);

          id v25 = SUControllerError(@"SUControllerError", 1, 0, @"No handler for message type '%@'", v36, v37, v38, v39, (uint64_t)v21);
          v40 = [v9 outgoingResponseIdentifier];
          [(SUControllerMessageEndpoint *)self sendErrorReply:v25 toMessage:v40];
        }
      }
      else
      {
        v26 = +[SUControllerLogger sharedLogger];
        id v27 = [v9 outgoingResponseIdentifier];
        uint64_t v28 = [v27 UTF8String];
        objc_msgSend(v26, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]", @"Got message %s without %s key", v28, SUControllerMessageTypeKey);

        SUControllerError(@"SUControllerError", 1, 0, @"Dropping message without '%@' key", v29, v30, v31, v32, (uint64_t)SUControllerMessageTypeKey);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        id v25 = [v9 outgoingResponseIdentifier];
        [(SUControllerMessageEndpoint *)self sendErrorReply:v23 toMessage:v25];
      }
    }
    else
    {
      uint64_t v21 = SUControllerError(@"SUControllerError", 1, v11, @"Unparseable IDS message", v15, v16, v17, v18, v41);
      id v23 = [v9 outgoingResponseIdentifier];
      [(SUControllerMessageEndpoint *)self sendErrorReply:v21 toMessage:v23];
    }
  }
}

void __75__SUControllerMessageEndpoint_service_account_incomingData_fromID_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingMessageReplies];
  uint64_t v3 = [*(id *)(a1 + 40) incomingResponseIdentifier];
  id v14 = [v2 objectForKeyedSubscript:v3];

  if (!v14)
  {
    uint64_t v4 = +[SUControllerLogger sharedLogger];
    id v5 = [*(id *)(a1 + 40) incomingResponseIdentifier];
    objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]_block_invoke", @"No reply handler set for message identifier %s", objc_msgSend(v5, "UTF8String"));
LABEL_8:

    goto LABEL_9;
  }
  if (*(void *)(a1 + 48))
  {
    v14[2](v14, 0);
    goto LABEL_10;
  }
  id v6 = *(void **)(a1 + 56);
  id v7 = [NSString stringWithUTF8String:SUControllerMessageErrorKey];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    ((void (*)(void (**)(id, void), void, void))v14[2])(v14, *(void *)(a1 + 56), 0);
    uint64_t v4 = [*(id *)(a1 + 32) pendingMessageReplies];
    id v5 = [*(id *)(a1 + 40) incomingResponseIdentifier];
    [v4 removeObjectForKey:v5];
    goto LABEL_8;
  }
  id v9 = (void *)MEMORY[0x263F08928];
  uint64_t v10 = objc_opt_class();
  id v11 = *(void **)(a1 + 56);
  id v12 = [NSString stringWithUTF8String:SUControllerMessageErrorKey];
  id v13 = [v11 objectForKeyedSubscript:v12];
  uint64_t v4 = [v9 unarchivedObjectOfClass:v10 fromData:v13 error:0];

  ((void (*)(void (**)(id, void), void, void *))v14[2])(v14, 0, v4);
LABEL_9:

LABEL_10:
}

void __75__SUControllerMessageEndpoint_service_account_incomingData_fromID_context___block_invoke_2(uint64_t a1)
{
  id v2 = +[SUControllerLogger sharedLogger];
  [v2 logAtLevel:2, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]_block_invoke_2", @"Received message: %@", *(void *)(a1 + 32) label format];

  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) outgoingResponseIdentifier];
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, v4, v5);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  id v12 = [(SUControllerMessageEndpoint *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__SUControllerMessageEndpoint_service_account_identifier_didSendWithSuccess_error___block_invoke;
  v15[3] = &unk_26551C148;
  id v16 = v11;
  uint64_t v17 = self;
  id v18 = v10;
  BOOL v19 = a6;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, v15);
}

void __83__SUControllerMessageEndpoint_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = *(void **)(a1 + 32);
  if (v9)
  {
    SUControllerError(@"SUControllerError", 2, v9, @"failed to send message", a5, a6, a7, a8, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }
  id v10 = [*(id *)(a1 + 40) pendingMessageCompletions];
  id v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (v11)
  {
    ((void (**)(void, id))v11)[2](v11, v17);
    id v12 = [*(id *)(a1 + 40) pendingMessageCompletions];
    [v12 removeObjectForKey:*(void *)(a1 + 48)];
  }
  id v13 = [*(id *)(a1 + 40) pendingMessageReplies];
  id v14 = [v13 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (!*(unsigned char *)(a1 + 56) && v14)
  {
    ((void (**)(void, void, id))v14)[2](v14, 0, v17);
    uint64_t v15 = [*(id *)(a1 + 40) pendingMessageReplies];
    [v15 removeObjectForKey:*(void *)(a1 + 48)];
  }
}

- (IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (NSMutableDictionary)messageHandlers
{
  return self->_messageHandlers;
}

- (void)setMessageHandlers:(id)a3
{
}

- (NSMutableDictionary)pendingMessageCompletions
{
  return self->_pendingMessageCompletions;
}

- (void)setPendingMessageCompletions:(id)a3
{
}

- (NSMutableDictionary)pendingMessageReplies
{
  return self->_pendingMessageReplies;
}

- (void)setPendingMessageReplies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessageReplies, 0);
  objc_storeStrong((id *)&self->_pendingMessageCompletions, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end