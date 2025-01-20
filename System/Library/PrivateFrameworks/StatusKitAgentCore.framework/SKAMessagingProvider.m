@interface SKAMessagingProvider
+ (id)_noValidIDSDetintationError;
+ (id)logger;
- (BOOL)_keysharingIsDisabledByServer;
- (BOOL)_selfSharingIsDisabledByServer;
- (BOOL)isFromIDFromSelfAccount:(id)a3;
- (BOOL)isHandleAvailableToMessageFrom:(id)a3;
- (BOOL)isValidURI:(id)a3;
- (BOOL)sendMessage:(id)a3 toHandle:(id)a4 fromHandle:(id)a5 limitToPresenceCapable:(BOOL)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendMessage:(id)a3 toHandles:(id)a4 fromHandle:(id)a5 limitToPresenceCapable:(BOOL)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendMessageToSelfDevices:(id)a3 limitToPresenceCapable:(BOOL)a4 identifier:(id *)a5 error:(id *)a6;
- (IDSService)service;
- (NSArray)idsDevices;
- (NSMutableDictionary)registeredIDSDeviceChangedObservers;
- (NSString)serviceIdentifier;
- (SKAMessagingProvider)initWithDelegate:(id)a3 serviceIdentifier:(id)a4 pushManager:(id)a5 queue:(id)a6;
- (SKAMessagingProvidingDelegate)delegate;
- (SKAPushManaging)pushManager;
- (id)deviceToken;
- (id)deviceTokenForTokenURI:(id)a3;
- (id)handleForTokenURI:(id)a3;
- (id)registerIDSDeviceChangedObserver:(id)a3;
- (id)resolveSenderHandleWithPreferredSenderHandle:(id)a3;
- selfAddressedURIForURI:(id)a3;
- (id)tokenURI;
- (void)_keysharingIsDisabledByServer;
- (void)_selfSharingIsDisabledByServer;
- (void)isHandleMessageable:(id)a3 completion:(id)a4;
- (void)isHandleMessageableForPresence:(id)a3 completion:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setPushManager:(id)a3;
- (void)setRegisteredIDSDeviceChangedObservers:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)signPayload:(id)a3 completion:(id)a4;
- (void)unregisterIDSDeviceChangedObserver:(id)a3;
- (void)verifySignedPayload:(id)a3 matchesPayload:(id)a4 fromTokenURI:(id)a5 completion:(id)a6;
@end

@implementation SKAMessagingProvider

- (SKAMessagingProvider)initWithDelegate:(id)a3 serviceIdentifier:(id)a4 pushManager:(id)a5 queue:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SKAMessagingProvider;
  v14 = [(SKAMessagingProvider *)&v22 init];
  if (v14)
  {
    v15 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Initializing messaging provider with service %@ and delegate %@", buf, 0x16u);
    }

    if ([(SKAMessagingProvider *)v14 _keysharingIsDisabledByServer])
    {
      v16 = +[SKAMessagingProvider logger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SKAMessagingProvider initWithDelegate:serviceIdentifier:pushManager:queue:]();
      }
    }
    else
    {
      objc_storeWeak((id *)&v14->_delegate, v10);
      objc_storeStrong((id *)&v14->_serviceIdentifier, a4);
      objc_storeStrong((id *)&v14->_pushManager, a5);
      v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      registeredIDSDeviceChangedObservers = v14->_registeredIDSDeviceChangedObservers;
      v14->_registeredIDSDeviceChangedObservers = v17;

      uint64_t v19 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:v11];
      service = v14->_service;
      v14->_service = (IDSService *)v19;

      [(IDSService *)v14->_service addDelegate:v14 queue:v13];
    }
  }

  return v14;
}

- (BOOL)sendMessage:(id)a3 toHandle:(id)a4 fromHandle:(id)a5 limitToPresenceCapable:(BOOL)a6 identifier:(id *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v20 = a4;
  v14 = (void *)MEMORY[0x263EFF8C0];
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [v14 arrayWithObjects:&v20 count:1];

  LOBYTE(a8) = -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:](self, "sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:", v17, v18, v15, v10, a7, a8, v20, v21);
  return (char)a8;
}

- (BOOL)sendMessage:(id)a3 toHandles:(id)a4 fromHandle:(id)a5 limitToPresenceCapable:(BOOL)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([(SKAMessagingProvider *)self _keysharingIsDisabledByServer])
  {
    v14 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:]();
    }
    LOBYTE(v15) = 0;
  }
  else
  {
    v37 = self;
    v39 = v13;
    id v40 = v11;
    v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          objc_super v22 = objc_msgSend(v21, "idsDestination", v37);
          if ([v22 length])
          {
            [v14 addObject:v22];
          }
          else
          {
            v23 = +[SKAMessagingProvider logger];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v49 = v21;
              _os_log_error_impl(&dword_22480C000, v23, OS_LOG_TYPE_ERROR, "Failed to generate IDS destination for handle: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v18);
    }

    if ([v14 count])
    {
      id v24 = [v39 idsDestination];
      uint64_t v54 = *MEMORY[0x263F49F10];
      id v55 = v24;
      __int16 v25 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      id v26 = (void *)[v25 mutableCopy];

      uint64_t v27 = +[SKAMessagingProvider logger];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v49 = v40;
        __int16 v50 = 2112;
        v51 = v14;
        __int16 v52 = 2112;
        v53 = v26;
        _os_log_impl(&dword_22480C000, v27, OS_LOG_TYPE_DEFAULT, "Sending message %@ to destinations %@ options: %@", buf, 0x20u);
      }

      service = v37->_service;
      id v42 = 0;
      id v43 = 0;
      int v15 = [(IDSService *)service sendMessage:v40 toDestinations:v14 priority:300 options:v26 identifier:&v43 error:&v42];
      id v29 = v43;
      id v30 = v42;
      v31 = +[SKAMessagingProvider logger];
      v32 = v31;
      if (v15)
      {
        v33 = a8;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v29;
          _os_log_impl(&dword_22480C000, v32, OS_LOG_TYPE_DEFAULT, "Successfully sent invitation message, assigned message identifier: %@", buf, 0xCu);
        }
      }
      else
      {
        v33 = a8;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:]();
        }
      }

      if (a7) {
        *a7 = v29;
      }
      id v13 = v39;
      if (v33) {
        id *v33 = v30;
      }

      id v11 = v40;
    }
    else
    {
      v34 = +[SKAMessagingProvider logger];
      id v13 = v39;
      id v11 = v40;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:]();
      }

      v35 = +[SKAMessagingProvider _noValidIDSDetintationError];
      id v24 = v35;
      if (a8)
      {
        id v24 = v35;
        LOBYTE(v15) = 0;
        *a8 = v24;
      }
      else
      {
        LOBYTE(v15) = 0;
      }
    }
  }
  return v15;
}

- (BOOL)sendMessageToSelfDevices:(id)a3 limitToPresenceCapable:(BOOL)a4 identifier:(id *)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if ([(SKAMessagingProvider *)self _selfSharingIsDisabledByServer])
  {
    BOOL v10 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SKAMessagingProvider sendMessageToSelfDevices:limitToPresenceCapable:identifier:error:]();
    }
    LOBYTE(v11) = 0;
  }
  else
  {
    BOOL v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v12 = [(SKAMessagingProvider *)self service];
    id v13 = [v12 devices];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = (void *)IDSCopyIDForDevice();
          if (v18) {
            [v10 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v15);
    }

    if ([v10 count])
    {
      id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v20 = +[SKAMessagingProvider logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v36 = v9;
        __int16 v37 = 2112;
        v38 = v10;
        __int16 v39 = 2112;
        id v40 = v19;
        _os_log_impl(&dword_22480C000, v20, OS_LOG_TYPE_DEFAULT, "Sending message %@ to destinations %@ options: %@", buf, 0x20u);
      }

      service = self->_service;
      id v29 = 0;
      id v30 = 0;
      int v11 = [(IDSService *)service sendMessage:v9 toDestinations:v10 priority:300 options:v19 identifier:&v30 error:&v29];
      id v22 = v30;
      id v23 = v29;
      id v24 = +[SKAMessagingProvider logger];
      __int16 v25 = v24;
      if (v11)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v22;
          _os_log_impl(&dword_22480C000, v25, OS_LOG_TYPE_DEFAULT, "Successfully sent invitation message, assigned message identifier: %@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:]();
      }

      if (a5) {
        *a5 = v22;
      }
      if (a6) {
        *a6 = v23;
      }
    }
    else
    {
      id v26 = +[SKAMessagingProvider logger];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[SKAMessagingProvider sendMessageToSelfDevices:limitToPresenceCapable:identifier:error:]();
      }

      uint64_t v27 = +[SKAMessagingProvider _noValidIDSDetintationError];
      id v19 = v27;
      if (a6)
      {
        id v19 = v27;
        LOBYTE(v11) = 0;
        *a6 = v19;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
  }
  return v11;
}

- (void)isHandleMessageable:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(SKAMessagingProvider *)self _keysharingIsDisabledByServer])
  {
    v8 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:]();
    }

    v7[2](v7, 0);
  }
  else
  {
    id v9 = [v6 idsDestination];
    BOOL v10 = [(SKAMessagingProvider *)self serviceIdentifier];
    int v11 = NSString;
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 stringWithFormat:@"%@_%p", v13, self];

    uint64_t v15 = [MEMORY[0x263F4A058] sharedInstance];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__SKAMessagingProvider_isHandleMessageable_completion___block_invoke;
    v16[3] = &unk_2646E0FF0;
    uint64_t v17 = v7;
    [v15 refreshIDStatusForDestination:v9 service:v10 listenerID:v14 queue:MEMORY[0x263EF83A0] completionBlock:v16];
  }
}

uint64_t __55__SKAMessagingProvider_isHandleMessageable_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isHandleMessageableForPresence:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(SKAMessagingProvider *)self _keysharingIsDisabledByServer])
  {
    v8 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAMessagingProvider sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:]();
    }

    v7[2](v7, 0);
  }
  else
  {
    id v9 = [v6 idsDestination];
    BOOL v10 = [(SKAMessagingProvider *)self serviceIdentifier];
    int v11 = NSString;
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 stringWithFormat:@"%@_%p", v13, self];

    uint64_t v15 = [MEMORY[0x263F4A058] sharedInstance];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __66__SKAMessagingProvider_isHandleMessageableForPresence_completion___block_invoke;
    v16[3] = &unk_2646E0FF0;
    uint64_t v17 = v7;
    [v15 refreshIDStatusForDestination:v9 service:v10 listenerID:v14 queue:MEMORY[0x263EF83A0] completionBlock:v16];
  }
}

uint64_t __66__SKAMessagingProvider_isHandleMessageableForPresence_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isHandleAvailableToMessageFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F4A258]);
  id v6 = [v4 normalizedHandleString];
  v7 = (void *)[v5 initWithUnprefixedURI:v6];

  v8 = [(SKAMessagingProvider *)self service];
  id v9 = [v8 URIs];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "isEqualToURI:", v7, (void)v19))
        {
          uint64_t v17 = +[SKAMessagingProvider logger];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v4;
            _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Sender handle \"%@\" is a valid sender handle for active iCloud account", buf, 0xCu);
          }

          BOOL v16 = 1;
          uint64_t v15 = v10;
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = +[SKAMessagingProvider logger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Sender handle \"%@\" is not a valid sender handle for active iCloud account", buf, 0xCu);
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)isFromIDFromSelfAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(SKAMessagingProvider *)self service];
  id v6 = [v5 deviceForFromID:v4];

  return v6 != 0;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = +[SKAMessagingProvider logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Received incoming message: %@ fromID: %@", (uint8_t *)&v20, 0x16u);
  }

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if ([(SKAMessagingProvider *)self _keysharingIsDisabledByServer])
    {
      BOOL v16 = +[SKAMessagingProvider logger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SKAMessagingProvider service:account:incomingMessage:fromID:context:]();
      }
    }
    else
    {
      BOOL v16 = [v12 serviceIdentifier];
      uint64_t v17 = [v12 originalGUID];
      uint64_t v18 = [v12 toID];
      id v19 = objc_loadWeakRetained((id *)p_delegate);
      [v19 service:v16 didReceiveIncomingMessage:v10 fromID:v11 toID:v18 messageGuid:v17];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a8;
  id v14 = a3;
  uint64_t v15 = +[SKAMessagingProvider logger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v12;
    __int16 v22 = 1024;
    BOOL v23 = v9;
    _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Message: %@ did send with success: %d", (uint8_t *)&v20, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v17 = [v14 serviceIdentifier];

  uint64_t v18 = [v13 fromID];
  id v19 = [v13 toID];

  [WeakRetained service:v17 outgoingMessageWithIdentifier:v12 fromID:v18 toID:v19 didSendWithSuccess:v9];
}

- (void)service:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4
{
  id v5 = +[SKAMessagingProvider logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Received didHintCheckingTransportLogWithReason", v9, 2u);
  }

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 networkBecameReachable];
  }
}

- (id)resolveSenderHandleWithPreferredSenderHandle:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F4A258]);
    id v6 = [v4 handleString];
    id v7 = (id)[v5 initWithUnprefixedURI:v6];

    if (v7
      && ([v7 unprefixedURI],
          id v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 length],
          v8,
          v9))
    {
      id v10 = v4;
    }
    else
    {
      id v11 = +[SKAMessagingProvider logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SKAMessagingProvider resolveSenderHandleWithPreferredSenderHandle:]();
      }

      id v10 = 0;
    }
  }
  else
  {
    id v12 = [(IDSService *)self->_service URIs];
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = v12;
    uint64_t v14 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v7);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "unprefixedURI", (void)v24);
          if (v18) {
            [v13 addObject:v18];
          }
        }
        uint64_t v15 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v15);
    }

    id v19 = (void *)[v13 copy];
    int v20 = (void *)_IDSCopyCallerID();

    if ([v20 length])
    {
      id v21 = IDSCopyRawAddressForDestination();
      __int16 v22 = +[SKAMessagingProvider logger];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v21;
        _os_log_impl(&dword_22480C000, v22, OS_LOG_TYPE_DEFAULT, "Resolved default caller ID: %@", buf, 0xCu);
      }

      id v10 = (id)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v21];
    }
    else
    {
      id v21 = +[SKAMessagingProvider logger];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SKAMessagingProvider resolveSenderHandleWithPreferredSenderHandle:]();
      }
      id v10 = 0;
    }
  }
  return v10;
}

- (id)tokenURI
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(IDSService *)self->_service URIs];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "unprefixedURI", (void)v21);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  id v12 = (void *)_IDSCopyCallerID();

  id v13 = [(SKAMessagingProvider *)self deviceToken];
  uint64_t v14 = 0;
  if (v13 && v12)
  {
    long long v25 = v12;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    uint64_t v16 = (void *)_IDSCopyOrderedAliases();
    uint64_t v17 = [v16 firstObject];

    uint64_t v18 = (void *)MEMORY[0x22A6198E0](v13, v17);
    uint64_t v14 = v18;
    if (v18) {
      id v19 = v18;
    }
  }
  return v14;
}

- (BOOL)isValidURI:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if ([v4 isTokenURI])
    {
      uint64_t v6 = +[SKAMessagingProvider logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v52 = v5;
        _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Stripping token from: %@", buf, 0xCu);
      }

      uint64_t v7 = [v5 tokenFreeURI];

      id v5 = v7;
    }
    [(IDSService *)self->_service accounts];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v45;
LABEL_8:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v44 + 1) + 8 * v12);
        if ([v5 IDSIDType] == 7)
        {
          long long v42 = 0uLL;
          long long v43 = 0uLL;
          long long v40 = 0uLL;
          long long v41 = 0uLL;
          uint64_t v14 = [v13 pseudonyms];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v35 = v11;
            uint64_t v17 = *(void *)v41;
LABEL_14:
            uint64_t v18 = 0;
            while (1)
            {
              if (*(void *)v41 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = [*(id *)(*((void *)&v40 + 1) + 8 * v18) URI];
              char v20 = [v19 isEqualToURI:v5];

              if (v20) {
                break;
              }
              if (v16 == ++v18)
              {
                uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
                if (v16) {
                  goto LABEL_14;
                }
                uint64_t v11 = v35;
                goto LABEL_29;
              }
            }
LABEL_34:

            BOOL v26 = 1;
            long long v25 = v8;
            goto LABEL_35;
          }
        }
        else
        {
          long long v38 = 0uLL;
          long long v39 = 0uLL;
          long long v36 = 0uLL;
          long long v37 = 0uLL;
          uint64_t v14 = [v13 handles];
          uint64_t v21 = [v14 countByEnumeratingWithState:&v36 objects:v48 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v37;
LABEL_23:
            uint64_t v24 = 0;
            while (1)
            {
              if (*(void *)v37 != v23) {
                objc_enumerationMutation(v14);
              }
              if ([*(id *)(*((void *)&v36 + 1) + 8 * v24) isEqualToURI:v5]) {
                goto LABEL_34;
              }
              if (v22 == ++v24)
              {
                uint64_t v22 = [v14 countByEnumeratingWithState:&v36 objects:v48 count:16];
                if (v22) {
                  goto LABEL_23;
                }
                break;
              }
            }
          }
        }
LABEL_29:

        if (++v12 == v10)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
          if (v10) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

    long long v25 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SKAMessagingProvider isValidURI:]();
    }
    BOOL v26 = 0;
LABEL_35:
  }
  else
  {
    id v5 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SKAMessagingProvider isValidURI:](v5, v27, v28, v29, v30, v31, v32, v33);
    }
    BOOL v26 = 0;
  }

  return v26;
}

- selfAddressedURIForURI:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F4A238]);
  uint64_t v6 = [(SKAMessagingProvider *)self deviceToken];
  uint64_t v7 = (void *)[v5 initWithData:v6];

  if (v7 && ([v7 rawToken], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    if ([v4 isTokenURI])
    {
      uint64_t v9 = [v4 tokenFreeURI];

      id v4 = (id)v9;
    }
    uint64_t v10 = [v4 URIByAddingPushToken:v7];
    uint64_t v11 = [v10 prefixedURI];
  }
  else
  {
    uint64_t v12 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SKAMessagingProvider selfAddressedURIForURI:]();
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)deviceToken
{
  return (id)[(SKAPushManaging *)self->_pushManager pushToken];
}

- (id)deviceTokenForTokenURI:(id)a3
{
  id v3 = (id)IDSCopyTokenAndIDForTokenWithID();
  id v4 = 0;
  return v4;
}

- (id)handleForTokenURI:(id)a3
{
  id v3 = (void *)IDSCopyRawAddressForDestination();
  id v4 = (void *)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v3];

  return v4;
}

- (void)signPayload:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SKAMessagingProvider *)self service];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__SKAMessagingProvider_signPayload_completion___block_invoke;
  v10[3] = &unk_2646E1018;
  id v11 = v6;
  id v9 = v6;
  [v8 signData:v7 withAlgorithm:2 completion:v10];
}

uint64_t __47__SKAMessagingProvider_signPayload_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifySignedPayload:(id)a3 matchesPayload:(id)a4 fromTokenURI:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = (objc_class *)MEMORY[0x263F4A258];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = (void *)[[v11 alloc] initWithPrefixedURI:v12];

  uint64_t v16 = [(SKAMessagingProvider *)self service];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__SKAMessagingProvider_verifySignedPayload_matchesPayload_fromTokenURI_completion___block_invoke;
  v18[3] = &unk_2646E1040;
  id v19 = v10;
  id v17 = v10;
  [v16 verifySignedData:v14 matchesExpectedData:v13 withTokenURI:v15 forAlgorithm:2 completion:v18];
}

void __83__SKAMessagingProvider_verifySignedPayload_matchesPayload_fromTokenURI_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SKAMessagingProvider logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Signature verification returned with result: %d", (uint8_t *)v7, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(SKAMessagingProvider *)self registeredIDSDeviceChangedObservers];
  id v5 = [v4 allValues];

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
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (id)_noValidIDSDetintationError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79860];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"No valid IDS destinations could be determined";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 errorWithDomain:v3 code:-4002 userInfo:v4];

  return v5;
}

- (BOOL)_keysharingIsDisabledByServer
{
  v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"status-kit-keysharing-disabled"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 BOOLValue])
  {
    id v4 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SKAMessagingProvider _keysharingIsDisabledByServer]();
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_selfSharingIsDisabledByServer
{
  v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"status-kit-selfsharing-disabled"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 BOOLValue])
  {
    id v4 = +[SKAMessagingProvider logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SKAMessagingProvider _selfSharingIsDisabledByServer]();
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSArray)idsDevices
{
  return (NSArray *)[(IDSService *)self->_service devices];
}

- (id)registerIDSDeviceChangedObserver:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = _Block_copy(v5);

  [(NSMutableDictionary *)self->_registeredIDSDeviceChangedObservers setObject:v7 forKeyedSubscript:v6];
  return v6;
}

- (void)unregisterIDSDeviceChangedObserver:(id)a3
{
}

+ (id)logger
{
  if (logger_onceToken_6 != -1) {
    dispatch_once(&logger_onceToken_6, &__block_literal_global_6);
  }
  v2 = (void *)logger__logger_6;
  return v2;
}

uint64_t __30__SKAMessagingProvider_logger__block_invoke()
{
  logger__logger_6 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAMessagingProvider");
  return MEMORY[0x270F9A758]();
}

- (SKAMessagingProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAMessagingProvidingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (SKAPushManaging)pushManager
{
  return self->_pushManager;
}

- (void)setPushManager:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSMutableDictionary)registeredIDSDeviceChangedObservers
{
  return self->_registeredIDSDeviceChangedObservers;
}

- (void)setRegisteredIDSDeviceChangedObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredIDSDeviceChangedObservers, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_pushManager, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:serviceIdentifier:pushManager:queue:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Keysharing has been disabled by the server! Not initializing messaging service", v2, v3, v4, v5, v6);
}

- (void)sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Keysharing has been disabled by the server! Not sending message", v2, v3, v4, v5, v6);
}

- (void)sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "No valid IDS destinations generated from handles: %@", v2, v3, v4, v5, v6);
}

- (void)sendMessage:toHandles:fromHandle:limitToPresenceCapable:identifier:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to send invitation message with error: %@", v2, v3, v4, v5, v6);
}

- (void)sendMessageToSelfDevices:limitToPresenceCapable:identifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Self sharing has been disabled by the server! Not sending message", v2, v3, v4, v5, v6);
}

- (void)sendMessageToSelfDevices:limitToPresenceCapable:identifier:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "No destinations for self devices", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingMessage:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Keysharing has been disabled by the server! Dropping incoming message", v2, v3, v4, v5, v6);
}

- (void)resolveSenderHandleWithPreferredSenderHandle:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Unable to determine default caller ID among URIs: %@", v2, v3, v4, v5, v6);
}

- (void)resolveSenderHandleWithPreferredSenderHandle:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invalid preferred sender handle %@, unprefixed URI is blank", v2, v3, v4, v5, v6);
}

- (void)isValidURI:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isValidURI:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not validate URI %@", v2, v3, v4, v5, v6);
}

- (void)selfAddressedURIForURI:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Device token is %@", v2, v3, v4, v5, v6);
}

- (void)_keysharingIsDisabledByServer
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Keysharing has been disabled in the server bag!", v2, v3, v4, v5, v6);
}

- (void)_selfSharingIsDisabledByServer
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Self sharing has been disabled in the server bag!", v2, v3, v4, v5, v6);
}

@end