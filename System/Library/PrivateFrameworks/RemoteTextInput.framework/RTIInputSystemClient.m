@interface RTIInputSystemClient
- (BOOL)_canResumeConnection;
- (BOOL)_remoteTextEditingIsAllowed;
- (BOOL)hasActiveSessionWithID:(id)a3;
- (BOOL)isEnvironmentEnabled;
- (NSArray)machNames;
- (NSMutableDictionary)activeSessions;
- (NSMutableDictionary)connections;
- (NSMutableSet)allowanceRequestors;
- (NSMutableSet)begunSessionIDs;
- (NSMutableSet)endpointConnections;
- (NSMutableSet)invalidatedServices;
- (OS_dispatch_queue)internalQueue;
- (RTIDocumentRequest)defaultDocumentRequest;
- (RTIInputSystemClient)initWithMachNames:(id)a3;
- (RTIInputSystemClientDelegate)delegate;
- (unint64_t)currentEnvironmentOptions;
- (void)_beginAllActiveSessions;
- (void)_beginAllActiveSessionsForServices:(id)a3;
- (void)_beginAllActiveSessionsForServices:(id)a3 force:(BOOL)a4;
- (void)_beginSessionWithID:(id)a3 forServices:(id)a4 force:(BOOL)a5;
- (void)_configureConnection:(id)a3 withMachName:(id)a4;
- (void)_didIntializeConnection:(id)a3 withMachName:(id)a4;
- (void)_endAllActiveSessionsAnimated:(BOOL)a3 completion:(id)a4;
- (void)_endAllActiveSessionsForServices:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_endSessionWithID:(id)a3 forServices:(id)a4 options:(id)a5 completion:(id)a6;
- (void)_initializeConnectionWithMachName:(id)a3;
- (void)_modifyTextEditingAllowedForReason:(id)a3 notify:(BOOL)a4 animated:(BOOL)a5 modifyAllowancesBlock:(id)a6 completion:(id)a7;
- (void)_updateAttributesForSessionWithID:(id)a3;
- (void)_updateTextForSessionWithID:(id)a3;
- (void)addEndpoint:(id)a3;
- (void)beginAllowingRemoteTextInput:(id)a3;
- (void)beginRemoteTextInputSessionWithID:(id)a3 documentTraits:(id)a4 initialDocumentState:(id)a5;
- (void)beginRemoteTextInputSessionWithID:(id)a3 options:(id)a4 documentTraits:(id)a5 initialDocumentState:(id)a6;
- (void)dealloc;
- (void)endAllowingRemoteTextInput:(id)a3;
- (void)endAllowingRemoteTextInput:(id)a3 completion:(id)a4;
- (void)endRemoteTextInputSessionWithID:(id)a3;
- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4;
- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)enumerateConnections:(id)a3 force:(BOOL)a4 withBlock:(id)a5;
- (void)enumerateServices:(id)a3 force:(BOOL)a4 withBlock:(id)a5;
- (void)invalidateConnections;
- (void)notifyServiceOfPause:(BOOL)a3 withReason:(id)a4;
- (void)performDocumentRequest:(id)a3 completion:(id)a4;
- (void)performTextOperations:(id)a3;
- (void)performTextOperations:(id)a3 resultHandler:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 didAddRTISupplementalLexicon:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 didAddSupplementalLexicon:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 didRemoveRTISupplementalLexiconWithIdentifier:(unint64_t)a4;
- (void)remoteTextInputSessionWithID:(id)a3 didRemoveSupplementalLexiconWithIdentifier:(unint64_t)a4;
- (void)remoteTextInputSessionWithID:(id)a3 documentDidChange:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 documentTraitsDidChange:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5;
- (void)remoteTextInputSessionWithID:(id)a3 textSuggestionsChanged:(id)a4;
- (void)removeEndpoint:(id)a3;
- (void)setActiveSessions:(id)a3;
- (void)setAllowanceRequestors:(id)a3;
- (void)setBegunSessionIDs:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDefaultDocumentRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointConnections:(id)a3;
- (void)setEnvironmentEnabled:(BOOL)a3 withReason:(id)a4;
- (void)setEnvironmentOptions:(unint64_t)a3 withReason:(id)a4;
- (void)setEnvironmentOptions:(unint64_t)a3 withReason:(id)a4 completion:(id)a5;
- (void)setMachNames:(id)a3;
- (void)updateDefaultDocumentRequest:(id)a3;
@end

@implementation RTIInputSystemClient

- (RTIInputSystemClient)initWithMachNames:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RTIInputSystemClient;
  v5 = [(RTIInputSystemClient *)&v30 init];
  v6 = v5;
  if (v5)
  {
    v5->_environmentOptions = 1;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeSessions = v6->_activeSessions;
    v6->_activeSessions = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    begunSessionIDs = v6->_begunSessionIDs;
    v6->_begunSessionIDs = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    invalidatedServices = v6->_invalidatedServices;
    v6->_invalidatedServices = v11;

    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.RemoteTextInput.RTIInputSystemClient.Internal", v13);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [v4 copy];
    machNames = v6->_machNames;
    v6->_machNames = (NSArray *)v16;

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](v6->_machNames, "count"));
    connections = v6->_connections;
    v6->_connections = (NSMutableDictionary *)v18;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v20 = v6->_machNames;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          -[RTIInputSystemClient _initializeConnectionWithMachName:](v6, "_initializeConnectionWithMachName:", *(void *)(*((void *)&v26 + 1) + 8 * v24++), (void)v26);
        }
        while (v22 != v24);
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v22);
    }
  }
  return v6;
}

- (void)invalidateConnections
{
  self->_isInvalidated = 1;
  [(NSMutableDictionary *)self->_connections enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1];
  endpointConnections = self->_endpointConnections;
  [(NSMutableSet *)endpointConnections enumerateObjectsUsingBlock:&__block_literal_global_27];
}

uint64_t __45__RTIInputSystemClient_invalidateConnections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

uint64_t __45__RTIInputSystemClient_invalidateConnections__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)dealloc
{
  if (!self->_isInvalidated) {
    [(RTIInputSystemClient *)self invalidateConnections];
  }
  v3.receiver = self;
  v3.super_class = (Class)RTIInputSystemClient;
  [(RTIInputSystemClient *)&v3 dealloc];
}

- (BOOL)_canResumeConnection
{
  return 1;
}

- (void)_initializeConnectionWithMachName:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29268];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithMachServiceName:v5 options:4096];
  [(RTIInputSystemClient *)self _didIntializeConnection:v6 withMachName:v5];
}

- (void)_didIntializeConnection:(id)a3 withMachName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(RTIInputSystemClient *)self _configureConnection:v7 withMachName:v6];
  [(NSMutableDictionary *)self->_connections setObject:v7 forKey:v6];
}

- (void)_configureConnection:(id)a3 withMachName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v6);
    uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEABB8B0];
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEABC9E0];
    [v6 setRemoteObjectInterface:v8];
    [v6 setExportedInterface:v9];
    [v6 setExportedObject:self];
    v13 = (void *)v8;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke;
    v21[3] = &unk_1E583C888;
    objc_copyWeak(&v23, location);
    objc_copyWeak(&v24, &from);
    id v10 = v7;
    id v22 = v10;
    [v6 setInterruptionHandler:v21];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_2;
    v17 = &unk_1E583C888;
    objc_copyWeak(&v19, location);
    objc_copyWeak(&v20, &from);
    id v18 = v10;
    [v6 setInvalidationHandler:&v14];
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.RemoteTextInput.RTIInputSystemClient.incomingXPC", v11);
    [v6 _setQueue:v12];
    if ([(RTIInputSystemClient *)self _canResumeConnection]) {
      objc_msgSend(v6, "resume", v8, v14, v15, v16, v17);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

void __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !WeakRetained[16])
  {
    id v4 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_cold_1();
    }

    id v5 = [WeakRetained delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [WeakRetained delegate];
      [v7 connectionInterrupted:*(void *)(a1 + 32)];
    }
    if (*(void *)(a1 + 32))
    {
      v14[0] = *(void *)(a1 + 32);
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    else
    {
      uint64_t v8 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_125;
    block[3] = &unk_1E583C508;
    id v11 = v3;
    dispatch_queue_t v12 = WeakRetained;
    id v13 = v8;
    id v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_125(uint64_t a1)
{
  [*(id *)(a1 + 32) activate];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _beginAllActiveSessionsForServices:v3 force:1];
}

void __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_2(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && !WeakRetained[16])
  {
    id v4 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[RTIInputSystemClient _configureConnection:withMachName:]_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_19AFFA000, v4, OS_LOG_TYPE_DEFAULT, "%s  Client connection to service was invalidated: %@", buf, 0x16u);
    }

    id v5 = [WeakRetained delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [WeakRetained delegate];
      [v7 connectionInvalidated:a1[4]];
    }
    if (a1[4])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_129;
      v8[3] = &unk_1E583C418;
      v8[4] = WeakRetained;
      id v9 = a1[4];
      dispatch_async(MEMORY[0x1E4F14428], v8);
    }
  }
}

uint64_t __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_129(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) addObject:*(void *)(a1 + 40)];
}

- (void)addEndpoint:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    if (!self->_endpointConnections)
    {
      id v5 = [MEMORY[0x1E4F1CA80] set];
      endpointConnections = self->_endpointConnections;
      self->_endpointConnections = v5;
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v8];
    [(NSMutableSet *)self->_endpointConnections addObject:v7];
    [(RTIInputSystemClient *)self _configureConnection:v7 withMachName:0];

    id v4 = v8;
  }
}

- (void)removeEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  endpointConnections = self->_endpointConnections;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __39__RTIInputSystemClient_removeEndpoint___block_invoke;
  id v11 = &unk_1E583C8B0;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  [(NSMutableSet *)endpointConnections enumerateObjectsUsingBlock:&v8];
  id v7 = (void *)v15[5];
  if (v7)
  {
    objc_msgSend(v7, "invalidate", v8, v9, v10, v11);
    [(NSMutableSet *)self->_endpointConnections removeObject:v15[5]];
  }

  _Block_object_dispose(&v14, 8);
}

void __39__RTIInputSystemClient_removeEndpoint___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 endpoint];
  id v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)beginAllowingRemoteTextInput:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[RTIInputSystemClient beginAllowingRemoteTextInput:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_19AFFA000, v5, OS_LOG_TYPE_DEFAULT, "%s  Begin allowing remote text input: %@", buf, 0x16u);
    }

    if (!self->_allowanceRequestors)
    {
      id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      allowanceRequestors = self->_allowanceRequestors;
      self->_allowanceRequestors = v6;
    }
    id v8 = [NSString stringWithFormat:@"Allower added: %@", v4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__RTIInputSystemClient_beginAllowingRemoteTextInput___block_invoke;
    v9[3] = &unk_1E583C418;
    v9[4] = self;
    id v10 = v4;
    [(RTIInputSystemClient *)self _modifyTextEditingAllowedForReason:v8 notify:0 animated:1 modifyAllowancesBlock:v9 completion:0];
  }
}

uint64_t __53__RTIInputSystemClient_beginAllowingRemoteTextInput___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
}

- (void)endAllowingRemoteTextInput:(id)a3
{
}

- (void)endAllowingRemoteTextInput:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    uint64_t v9 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTIInputSystemClient endAllowingRemoteTextInput:completion:]";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_19AFFA000, v9, OS_LOG_TYPE_DEFAULT, "%s  End allowing remote text input: %@", buf, 0x16u);
    }

    id v10 = [NSString stringWithFormat:@"Allower removed: %@", v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__RTIInputSystemClient_endAllowingRemoteTextInput_completion___block_invoke_136;
    v13[3] = &unk_1E583C418;
    v13[4] = self;
    id v14 = v6;
    [(RTIInputSystemClient *)self _modifyTextEditingAllowedForReason:v10 notify:0 animated:1 modifyAllowancesBlock:v13 completion:v8];

    id v11 = v14;
    goto LABEL_7;
  }
  if (v7)
  {
    id v12 = [(RTIInputSystemClient *)self internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__RTIInputSystemClient_endAllowingRemoteTextInput_completion___block_invoke;
    block[3] = &unk_1E583C580;
    id v16 = v8;
    dispatch_async(v12, block);

    id v11 = v16;
LABEL_7:
  }
}

uint64_t __62__RTIInputSystemClient_endAllowingRemoteTextInput_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__RTIInputSystemClient_endAllowingRemoteTextInput_completion___block_invoke_136(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
}

- (void)enumerateServices:(id)a3 force:(BOOL)a4 withBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(RTIInputSystemClient *)self isEnvironmentEnabled];
  if (v9 && (v10 || v6))
  {
    connections = self->_connections;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__RTIInputSystemClient_enumerateServices_force_withBlock___block_invoke;
    v16[3] = &unk_1E583C8D8;
    id v17 = v8;
    id v12 = v9;
    id v18 = v12;
    [(NSMutableDictionary *)connections enumerateKeysAndObjectsUsingBlock:v16];
    endpointConnections = self->_endpointConnections;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __58__RTIInputSystemClient_enumerateServices_force_withBlock___block_invoke_2;
    v14[3] = &unk_1E583C900;
    id v15 = v12;
    [(NSMutableSet *)endpointConnections enumerateObjectsUsingBlock:v14];
  }
}

void __58__RTIInputSystemClient_enumerateServices_force_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (![*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [v5 remoteObjectProxy];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __58__RTIInputSystemClient_enumerateServices_force_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 remoteObjectProxy];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)enumerateConnections:(id)a3 force:(BOOL)a4 withBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(RTIInputSystemClient *)self isEnvironmentEnabled];
  if (v9 && (v10 || v6))
  {
    connections = self->_connections;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__RTIInputSystemClient_enumerateConnections_force_withBlock___block_invoke;
    v16[3] = &unk_1E583C8D8;
    id v17 = v8;
    id v12 = v9;
    id v18 = v12;
    [(NSMutableDictionary *)connections enumerateKeysAndObjectsUsingBlock:v16];
    endpointConnections = self->_endpointConnections;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __61__RTIInputSystemClient_enumerateConnections_force_withBlock___block_invoke_2;
    v14[3] = &unk_1E583C900;
    id v15 = v12;
    [(NSMutableSet *)endpointConnections enumerateObjectsUsingBlock:v14];
  }
}

void __61__RTIInputSystemClient_enumerateConnections_force_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (![*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __61__RTIInputSystemClient_enumerateConnections_force_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_beginSessionWithID:(id)a3 forServices:(id)a4 force:(BOOL)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(RTIInputSystemClient *)self _remoteTextEditingIsAllowed];
  if (!v10 || a5)
  {
    if (!v10) {
      goto LABEL_9;
    }
  }
  else
  {
    id v11 = [(RTIInputSystemClient *)self begunSessionIDs];
    char v12 = [v11 containsObject:v8];

    if (v12) {
      goto LABEL_9;
    }
  }
  __int16 v13 = [(RTIInputSystemClient *)self activeSessions];
  id v14 = [v13 objectForKey:v8];

  id v15 = [v14 beginOptions];
  id v16 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v26 = "-[RTIInputSystemClient _beginSessionWithID:forServices:force:]";
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    objc_super v30 = v15;
    _os_log_impl(&dword_19AFFA000, v16, OS_LOG_TYPE_DEFAULT, "%s  Begin text input session. sessionID = %@, options = %@", buf, 0x20u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__RTIInputSystemClient__beginSessionWithID_forServices_force___block_invoke;
  v21[3] = &unk_1E583C928;
  id v17 = v8;
  id v22 = v17;
  id v23 = v15;
  id v24 = v14;
  id v18 = v14;
  id v19 = v15;
  [(RTIInputSystemClient *)self enumerateServices:v9 force:0 withBlock:v21];
  id v20 = [(RTIInputSystemClient *)self begunSessionIDs];
  [v20 addObject:v17];

LABEL_9:
}

void __62__RTIInputSystemClient__beginSessionWithID_forServices_force___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = a2;
  id v8 = [v5 documentTraits];
  id v7 = [*(id *)(a1 + 48) documentState];
  [v6 beginRemoteTextInputSessionWithID:v3 options:v4 documentTraits:v8 initialDocumentState:v7];
}

- (void)_updateTextForSessionWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(RTIInputSystemClient *)self begunSessionIDs];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(RTIInputSystemClient *)self activeSessions];
    id v8 = [v7 objectForKey:v4];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__RTIInputSystemClient__updateTextForSessionWithID___block_invoke;
    v10[3] = &unk_1E583C950;
    id v11 = v4;
    id v12 = v8;
    id v9 = v8;
    [(RTIInputSystemClient *)self enumerateServices:0 force:0 withBlock:v10];
  }
}

void __52__RTIInputSystemClient__updateTextForSessionWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 documentState];
  [v4 remoteTextInputSessionWithID:v2 documentDidChange:v5];
}

- (void)_updateAttributesForSessionWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(RTIInputSystemClient *)self begunSessionIDs];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(RTIInputSystemClient *)self activeSessions];
    id v8 = [v7 objectForKey:v4];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__RTIInputSystemClient__updateAttributesForSessionWithID___block_invoke;
    v10[3] = &unk_1E583C950;
    id v11 = v4;
    id v12 = v8;
    id v9 = v8;
    [(RTIInputSystemClient *)self enumerateServices:0 force:0 withBlock:v10];
  }
}

void __58__RTIInputSystemClient__updateAttributesForSessionWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 documentTraits];
  [v4 remoteTextInputSessionWithID:v2 documentTraitsDidChange:v5];
}

- (void)_endSessionWithID:(id)a3 forServices:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[RTIInputSystemClient _endSessionWithID:forServices:options:completion:]";
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_19AFFA000, v14, OS_LOG_TYPE_DEFAULT, "%s  End input session: %@", buf, 0x16u);
  }

  dispatch_group_t v15 = dispatch_group_create();
  dispatch_time_t v16 = dispatch_time(0, 2100000000);
  id v17 = [(RTIInputSystemClient *)self begunSessionIDs];
  int v18 = [v17 containsObject:v10];

  if (v18)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke;
    v27[3] = &unk_1E583C9A0;
    id v31 = v13;
    id v28 = v15;
    id v19 = v10;
    id v29 = v19;
    id v30 = v12;
    [(RTIInputSystemClient *)self enumerateConnections:v11 force:1 withBlock:v27];
    id v20 = [(RTIInputSystemClient *)self begunSessionIDs];
    [v20 removeObject:v19];
  }
  if (v13)
  {
    uint64_t v21 = [(RTIInputSystemClient *)self internalQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_141;
    v22[3] = &unk_1E583C9C8;
    id v23 = v15;
    dispatch_time_t v26 = v16;
    id v24 = v10;
    id v25 = v13;
    dispatch_async(v21, v22);
  }
}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 56))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2;
    v10[3] = &unk_1E583C978;
    id v11 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v10];
    if (v4)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_139;
      v8[3] = &unk_1E583C300;
      id v9 = *(id *)(a1 + 32);
      [v4 endRemoteTextInputSessionWithID:v5 options:v6 completion:v8];
    }
  }
  else
  {
    id v7 = [a2 remoteObjectProxy];
    [v7 endRemoteTextInputSessionWithID:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
  }
}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_139(uint64_t a1)
{
}

uint64_t __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_141(uint64_t a1)
{
  if (dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), *(void *)(a1 + 56)))
  {
    uint64_t v2 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_141_cold_1(a1, v2);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_beginAllActiveSessions
{
}

- (void)_endAllActiveSessionsAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)_beginAllActiveSessionsForServices:(id)a3
{
}

- (void)_beginAllActiveSessionsForServices:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(RTIInputSystemClient *)self activeSessions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        id v13 = [(RTIInputSystemClient *)self activeSessions];
        id v14 = [v13 objectForKey:v12];

        dispatch_group_t v15 = [v14 beginOptions];
        [v15 setAnimated:0];
        [(RTIInputSystemClient *)self _beginSessionWithID:v12 forServices:v6 force:v4];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)_endAllActiveSessionsForServices:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v8 = a5;
  uint64_t v9 = dispatch_group_create();
  dispatch_time_t v17 = dispatch_time(0, 2100000000);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(RTIInputSystemClient *)self activeSessions];
  uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
        if (a4)
        {
          dispatch_group_t v15 = 0;
          if (v8) {
            goto LABEL_8;
          }
        }
        else
        {
          dispatch_group_t v15 = +[RTISessionOptions defaultEndOptions];
          [v15 setAnimated:0];
          if (v8)
          {
LABEL_8:
            dispatch_group_enter(v9);
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke;
            v24[3] = &unk_1E583C300;
            id v25 = v9;
            [(RTIInputSystemClient *)self _endSessionWithID:v14 forServices:v19 options:v15 completion:v24];

            goto LABEL_11;
          }
        }
        [(RTIInputSystemClient *)self _endSessionWithID:v14 forServices:v19 options:v15 completion:0];
LABEL_11:

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  if (v8)
  {
    long long v16 = [(RTIInputSystemClient *)self internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke_2;
    block[3] = &unk_1E583C9F0;
    uint64_t v21 = v9;
    dispatch_time_t v23 = v17;
    id v22 = v8;
    dispatch_async(v16, block);
  }
}

void __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke(uint64_t a1)
{
}

uint64_t __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke_2(uint64_t a1)
{
  if (dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), *(void *)(a1 + 48)))
  {
    uint64_t v2 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke_2_cold_1(v2);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isEnvironmentEnabled
{
  return self->_environmentOptions & 1;
}

- (void)setEnvironmentEnabled:(BOOL)a3 withReason:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__RTIInputSystemClient_setEnvironmentEnabled_withReason___block_invoke;
  v4[3] = &unk_1E583CA18;
  v4[4] = self;
  v4[5] = a3;
  [(RTIInputSystemClient *)self _modifyTextEditingAllowedForReason:a4 notify:1 animated:1 modifyAllowancesBlock:v4 completion:0];
}

uint64_t __57__RTIInputSystemClient_setEnvironmentEnabled_withReason___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 8) = *(void *)(result + 40);
  return result;
}

- (void)setEnvironmentOptions:(unint64_t)a3 withReason:(id)a4
{
}

- (void)setEnvironmentOptions:(unint64_t)a3 withReason:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__RTIInputSystemClient_setEnvironmentOptions_withReason_completion___block_invoke;
  v5[3] = &unk_1E583CA18;
  v5[4] = self;
  v5[5] = a3 & 0xFFFFFFFFFFFFFFFDLL;
  [(RTIInputSystemClient *)self _modifyTextEditingAllowedForReason:a4 notify:(a3 >> 1) & 1 animated:0 modifyAllowancesBlock:v5 completion:a5];
}

uint64_t __68__RTIInputSystemClient_setEnvironmentOptions_withReason_completion___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 8) = *(void *)(result + 40);
  return result;
}

- (BOOL)_remoteTextEditingIsAllowed
{
  uint64_t v3 = [(NSMutableSet *)self->_allowanceRequestors count];
  if (v3)
  {
    LOBYTE(v3) = [(RTIInputSystemClient *)self isEnvironmentEnabled];
  }
  return v3;
}

- (void)_modifyTextEditingAllowedForReason:(id)a3 notify:(BOOL)a4 animated:(BOOL)a5 modifyAllowancesBlock:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (char *)a3;
  id v13 = a7;
  uint64_t v14 = (void (**)(void))a6;
  int v15 = [(RTIInputSystemClient *)self _remoteTextEditingIsAllowed];
  v14[2](v14);

  int v16 = [(RTIInputSystemClient *)self _remoteTextEditingIsAllowed];
  dispatch_time_t v17 = RTILogFacility();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    long long v28 = "-[RTIInputSystemClient _modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:]";
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 1024;
    BOOL v32 = v10;
    __int16 v33 = 1024;
    int v34 = v15;
    __int16 v35 = 1024;
    int v36 = v16;
    _os_log_debug_impl(&dword_19AFFA000, v17, OS_LOG_TYPE_DEBUG, "%s  Re-evaluating if text editing is allowed; reason: '%@'; notify: %d; allowed before: %d, allowed after: %d.",
      buf,
      0x28u);
  }

  if (v15 == v16)
  {
    if (v13)
    {
      id v22 = [(RTIInputSystemClient *)self internalQueue];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __108__RTIInputSystemClient__modifyTextEditingAllowedForReason_notify_animated_modifyAllowancesBlock_completion___block_invoke_2;
      v23[3] = &unk_1E583C580;
      id v24 = v13;
      dispatch_async(v22, v23);

      uint64_t v21 = v24;
      goto LABEL_15;
    }
  }
  else
  {
    long long v18 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = "NO";
      if (v16) {
        id v19 = "YES";
      }
      *(_DWORD *)buf = 136315394;
      long long v28 = "-[RTIInputSystemClient _modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:]";
      __int16 v29 = 2080;
      id v30 = v19;
      _os_log_impl(&dword_19AFFA000, v18, OS_LOG_TYPE_DEFAULT, "%s  Text editing allowed did change (editingAllowedAfter = %s)", buf, 0x16u);
    }

    if (v16)
    {
      [(RTIInputSystemClient *)self _beginAllActiveSessions];
      if (v10) {
        [(RTIInputSystemClient *)self notifyServiceOfPause:0 withReason:v12];
      }
      if (v13)
      {
        id v20 = [(RTIInputSystemClient *)self internalQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __108__RTIInputSystemClient__modifyTextEditingAllowedForReason_notify_animated_modifyAllowancesBlock_completion___block_invoke;
        block[3] = &unk_1E583C580;
        id v26 = v13;
        dispatch_async(v20, block);

        uint64_t v21 = v26;
LABEL_15:
      }
    }
    else
    {
      if (v10) {
        [(RTIInputSystemClient *)self notifyServiceOfPause:1 withReason:v12];
      }
      [(RTIInputSystemClient *)self _endAllActiveSessionsAnimated:v9 completion:v13];
    }
  }
}

uint64_t __108__RTIInputSystemClient__modifyTextEditingAllowedForReason_notify_animated_modifyAllowancesBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __108__RTIInputSystemClient__modifyTextEditingAllowedForReason_notify_animated_modifyAllowancesBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyServiceOfPause:(BOOL)a3 withReason:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(RTIInputSystemClient *)self activeSessions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        uint64_t v12 = [(RTIInputSystemClient *)self begunSessionIDs];
        int v13 = [v12 containsObject:v11];

        if (v13)
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __56__RTIInputSystemClient_notifyServiceOfPause_withReason___block_invoke;
          v15[3] = &unk_1E583CA40;
          v15[4] = v11;
          BOOL v17 = a3;
          id v16 = v5;
          [(RTIInputSystemClient *)self enumerateServices:0 force:1 withBlock:v15];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

void __56__RTIInputSystemClient_notifyServiceOfPause_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 remoteTextInputSessionWithID:*(void *)(a1 + 32) didChangePause:*(unsigned __int8 *)(a1 + 48) withReason:*(void *)(a1 + 40)];
  }
}

- (void)beginRemoteTextInputSessionWithID:(id)a3 documentTraits:(id)a4 initialDocumentState:(id)a5
{
}

- (void)beginRemoteTextInputSessionWithID:(id)a3 options:(id)a4 documentTraits:(id)a5 initialDocumentState:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  invalidatedServices = self->_invalidatedServices;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__RTIInputSystemClient_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke;
  v18[3] = &unk_1E583CA68;
  v18[4] = self;
  [(NSMutableSet *)invalidatedServices enumerateObjectsUsingBlock:v18];
  [(NSMutableSet *)self->_invalidatedServices removeAllObjects];
  int v15 = [(RTIInputSystemClient *)self activeSessions];
  id v16 = [v15 objectForKey:v10];
  if (v16)
  {
    RTIInputSessionChangeLogFacility();
    BOOL v17 = (RTIInputSystemClientSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v20 = "-[RTIInputSystemClient beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:]";
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_19AFFA000, &v17->super, OS_LOG_TYPE_DEFAULT, "%s  Cannot begin a session that is already active. session = %@", buf, 0x16u);
    }
  }
  else
  {
    BOOL v17 = objc_alloc_init(RTIInputSystemClientSession);
    [(RTIInputSystemClientSession *)v17 setBeginOptions:v11];
    [(RTIInputSystemClientSession *)v17 setDocumentTraits:v12];
    [(RTIInputSystemClientSession *)v17 setDocumentState:v13];
    [v15 setObject:v17 forKey:v10];
    [(RTIInputSystemClient *)self _beginSessionWithID:v10 forServices:0 force:0];
  }
}

void __102__RTIInputSystemClient_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[RTIInputSystemClient beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19AFFA000, v4, OS_LOG_TYPE_DEFAULT, "%s  Connection to service with mach name %@ was invalidated. Attempting to create a new connection.", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 32) _initializeConnectionWithMachName:v3];
}

- (void)remoteTextInputSessionWithID:(id)a3 documentDidChange:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(RTIInputSystemClient *)self activeSessions];
    uint64_t v9 = [v8 objectForKey:v6];

    if (v9)
    {
      [v9 setDocumentState:v7];
      [(RTIInputSystemClient *)self _updateTextForSessionWithID:v6];
    }
    else
    {
      id v10 = RTILogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        id v12 = "-[RTIInputSystemClient remoteTextInputSessionWithID:documentDidChange:]";
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_19AFFA000, v10, OS_LOG_TYPE_DEFAULT, "%s  Can only update text of an active session. sessionID = %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 documentTraitsDidChange:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(RTIInputSystemClient *)self activeSessions];
    uint64_t v9 = [v8 objectForKey:v6];

    if (v9)
    {
      [v9 setDocumentTraits:v7];
      [(RTIInputSystemClient *)self _updateAttributesForSessionWithID:v6];
    }
    else
    {
      id v10 = RTILogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        id v12 = "-[RTIInputSystemClient remoteTextInputSessionWithID:documentTraitsDidChange:]";
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_19AFFA000, v10, OS_LOG_TYPE_DEFAULT, "%s  Can only update attributes of an active session. sessionID = %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (void)endRemoteTextInputSessionWithID:(id)a3
{
}

- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4
{
}

- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v30 = "-[RTIInputSystemClient endRemoteTextInputSessionWithID:options:completion:]";
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl(&dword_19AFFA000, v11, OS_LOG_TYPE_DEFAULT, "%s  Ending text input session. sessionID = %@, options = %@", buf, 0x20u);
  }

  if (v8)
  {
    id v12 = [(RTIInputSystemClient *)self activeSessions];
    __int16 v13 = [v12 objectForKey:v8];
    if (v13)
    {
      [v12 removeObjectForKey:v8];
      [(RTIInputSystemClient *)self _endSessionWithID:v8 forServices:0 options:v9 completion:v10];
    }
    else
    {
      uint64_t v23 = RTIInputSessionChangeLogFacility();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[RTIInputSystemClient endRemoteTextInputSessionWithID:options:completion:]();
      }

      if (v10)
      {
        id v24 = [(RTIInputSystemClient *)self internalQueue];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __75__RTIInputSystemClient_endRemoteTextInputSessionWithID_options_completion___block_invoke_148;
        v25[3] = &unk_1E583C580;
        id v26 = v10;
        dispatch_async(v24, v25);
      }
    }

    goto LABEL_15;
  }
  id v14 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[RTIInputSystemClient endRemoteTextInputSessionWithID:options:completion:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

  if (v10)
  {
    id v22 = [(RTIInputSystemClient *)self internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__RTIInputSystemClient_endRemoteTextInputSessionWithID_options_completion___block_invoke;
    block[3] = &unk_1E583C580;
    id v28 = v10;
    dispatch_async(v22, block);

    id v12 = v28;
LABEL_15:
  }
}

uint64_t __75__RTIInputSystemClient_endRemoteTextInputSessionWithID_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__RTIInputSystemClient_endRemoteTextInputSessionWithID_options_completion___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remoteTextInputSessionWithID:(id)a3 textSuggestionsChanged:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = RTILogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[RTIInputSystemClient remoteTextInputSessionWithID:textSuggestionsChanged:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19AFFA000, v8, OS_LOG_TYPE_DEFAULT, "%s  Text input session suggestions changed. sessionID = %@", buf, 0x16u);
  }

  if (v6)
  {
    id v9 = [(RTIInputSystemClient *)self activeSessions];
    id v10 = [v9 objectForKey:v6];

    if (v10)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __76__RTIInputSystemClient_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke;
      v12[3] = &unk_1E583C950;
      __int16 v13 = v6;
      id v14 = v7;
      [(RTIInputSystemClient *)self enumerateServices:0 force:0 withBlock:v12];

      int v11 = v13;
    }
    else
    {
      int v11 = RTILogFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RTIInputSystemClient remoteTextInputSessionWithID:textSuggestionsChanged:]();
      }
    }
  }
}

void __76__RTIInputSystemClient_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 remoteTextInputSessionWithID:*(void *)(a1 + 32) textSuggestionsChanged:*(void *)(a1 + 40)];
  }
}

- (BOOL)hasActiveSessionWithID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  int v5 = [(RTIInputSystemClient *)self activeSessions];
  id v6 = [v5 objectForKey:v4];

  BOOL v7 = v6 != 0;
  return v7;
}

- (void)remoteTextInputSessionWithID:(id)a3 didAddSupplementalLexicon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(RTIInputSystemClient *)self activeSessions];
    id v9 = [v8 objectForKey:v6];

    if (v9)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __79__RTIInputSystemClient_remoteTextInputSessionWithID_didAddSupplementalLexicon___block_invoke;
      v18[3] = &unk_1E583C950;
      uint64_t v19 = v6;
      id v20 = v7;
      [(RTIInputSystemClient *)self enumerateServices:0 force:1 withBlock:v18];

      id v10 = v19;
    }
    else
    {
      id v10 = RTILogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[RTIInputSystemClient remoteTextInputSessionWithID:didAddSupplementalLexicon:]();
      }
    }
  }
  else
  {
    id v9 = RTILogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemClient remoteTextInputSessionWithID:didAddSupplementalLexicon:](v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void __79__RTIInputSystemClient_remoteTextInputSessionWithID_didAddSupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 remoteTextInputSessionWithID:*(void *)(a1 + 32) didAddSupplementalLexicon:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(RTIInputSystemClient *)self activeSessions];
    id v9 = [v8 objectForKey:v6];

    if (v9)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __82__RTIInputSystemClient_remoteTextInputSessionWithID_didAddRTISupplementalLexicon___block_invoke;
      v18[3] = &unk_1E583C950;
      uint64_t v19 = v6;
      id v20 = v7;
      [(RTIInputSystemClient *)self enumerateServices:0 force:1 withBlock:v18];

      id v10 = v19;
    }
    else
    {
      id v10 = RTILogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[RTIInputSystemClient remoteTextInputSessionWithID:didAddRTISupplementalLexicon:]();
      }
    }
  }
  else
  {
    id v9 = RTILogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemClient remoteTextInputSessionWithID:didAddRTISupplementalLexicon:](v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void __82__RTIInputSystemClient_remoteTextInputSessionWithID_didAddRTISupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 remoteTextInputSessionWithID:*(void *)(a1 + 32) didAddRTISupplementalLexicon:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 didRemoveSupplementalLexiconWithIdentifier:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(RTIInputSystemClient *)self activeSessions];
    id v8 = [v7 objectForKey:v6];

    if (v8)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __96__RTIInputSystemClient_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke;
      v17[3] = &unk_1E583CA90;
      id v18 = v6;
      unint64_t v19 = a4;
      [(RTIInputSystemClient *)self enumerateServices:0 force:1 withBlock:v17];
      id v9 = v18;
    }
    else
    {
      id v9 = RTILogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RTIInputSystemClient remoteTextInputSessionWithID:didRemoveSupplementalLexiconWithIdentifier:]();
      }
    }
  }
  else
  {
    id v8 = RTILogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemClient remoteTextInputSessionWithID:didRemoveSupplementalLexiconWithIdentifier:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __96__RTIInputSystemClient_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 remoteTextInputSessionWithID:*(void *)(a1 + 32) didRemoveSupplementalLexiconWithIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 didRemoveRTISupplementalLexiconWithIdentifier:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(RTIInputSystemClient *)self activeSessions];
    id v8 = [v7 objectForKey:v6];

    if (v8)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __99__RTIInputSystemClient_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke;
      v17[3] = &unk_1E583CA90;
      id v18 = v6;
      unint64_t v19 = a4;
      [(RTIInputSystemClient *)self enumerateServices:0 force:1 withBlock:v17];
      id v9 = v18;
    }
    else
    {
      id v9 = RTILogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RTIInputSystemClient remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:]();
      }
    }
  }
  else
  {
    id v8 = RTILogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemClient remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __99__RTIInputSystemClient_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 remoteTextInputSessionWithID:*(void *)(a1 + 32) didRemoveRTISupplementalLexiconWithIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(RTIInputSystemClient *)self activeSessions];
    id v9 = [v8 objectForKey:v6];

    if (v9)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __75__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation___block_invoke;
      v11[3] = &unk_1E583C950;
      uint64_t v12 = v6;
      id v13 = v7;
      [(RTIInputSystemClient *)self enumerateServices:0 force:0 withBlock:v11];

      uint64_t v10 = v12;
    }
    else
    {
      uint64_t v10 = RTILogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]();
      }
    }
  }
  else
  {
    id v9 = RTILogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:](v7, v9);
    }
  }
}

void __75__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 remoteTextInputSessionWithID:*(void *)(a1 + 32) performInputOperation:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = [(RTIInputSystemClient *)self activeSessions];
    uint64_t v12 = [v11 objectForKey:v8];

    if (v12)
    {
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __88__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke;
      v17[3] = &unk_1E583CAE0;
      id v18 = v8;
      id v19 = v9;
      id v13 = v10;
      id v20 = v13;
      uint64_t v21 = &v22;
      [(RTIInputSystemClient *)self enumerateServices:0 force:0 withBlock:v17];
      if (v13 && !*((unsigned char *)v23 + 24))
      {
        uint64_t v14 = RTILogFacility();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:withResponse:]();
        }

        (*((void (**)(id, uint64_t))v13 + 2))(v13, 128);
      }

      _Block_object_dispose(&v22, 8);
    }
    else
    {
      uint64_t v16 = RTILogFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:withResponse:]();
      }

      if (v10) {
        (*((void (**)(id, uint64_t))v10 + 2))(v10, 128);
      }
    }
  }
  else
  {
    uint64_t v15 = RTILogFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:withResponse:](v9, v15);
    }

    if (v10) {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 128);
    }
  }
}

void __88__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2;
  v6[3] = &unk_1E583CAB8;
  id v7 = *(id *)(a1 + 48);
  [a2 remoteTextInputSessionWithID:v4 performInputOperation:v5 withResponse:v6];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

uint64_t __88__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performTextOperations:(id)a3
{
  id v10 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 performTextOperations:v10];
    }
  }
}

- (void)performTextOperations:(id)a3 resultHandler:(id)a4
{
  id v18 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained
    && (id v9 = WeakRetained,
        id v10 = objc_loadWeakRetained((id *)p_delegate),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 performTextOperations:v18 resultHandler:v6];
  }
  else
  {
    id v13 = objc_loadWeakRetained((id *)p_delegate);
    if (v13
      && (uint64_t v14 = v13,
          id v15 = objc_loadWeakRetained((id *)p_delegate),
          char v16 = objc_opt_respondsToSelector(),
          v15,
          v14,
          (v16 & 1) != 0))
    {
      id v17 = objc_loadWeakRetained((id *)p_delegate);
      [v17 performTextOperations:v18];

      if (v6) {
        v6[2](v6, 255);
      }
    }
    else if (v6)
    {
      v6[2](v6, 0);
    }
  }
}

- (void)updateDefaultDocumentRequest:(id)a3
{
  [(RTIInputSystemClient *)self setDefaultDocumentRequest:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 defaultDocumentRequestDidChange:self->_defaultDocumentRequest];
    }
  }
}

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v15)
  {
    id v7 = v15;
  }
  else
  {
    id v7 = [(RTIInputSystemClient *)self defaultDocumentRequest];
  }
  id v8 = v7;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained
    && (char v11 = WeakRetained,
        id v12 = objc_loadWeakRetained((id *)p_delegate),
        char v13 = objc_opt_respondsToSelector(),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    id v14 = objc_loadWeakRetained((id *)p_delegate);
    [v14 performDocumentRequest:v8 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (unint64_t)currentEnvironmentOptions
{
  return self->_currentEnvironmentOptions;
}

- (RTIInputSystemClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RTIInputSystemClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RTIDocumentRequest)defaultDocumentRequest
{
  return self->_defaultDocumentRequest;
}

- (void)setDefaultDocumentRequest:(id)a3
{
}

- (NSMutableDictionary)activeSessions
{
  return self->_activeSessions;
}

- (void)setActiveSessions:(id)a3
{
}

- (NSMutableSet)begunSessionIDs
{
  return self->_begunSessionIDs;
}

- (void)setBegunSessionIDs:(id)a3
{
}

- (NSMutableSet)allowanceRequestors
{
  return self->_allowanceRequestors;
}

- (void)setAllowanceRequestors:(id)a3
{
}

- (NSArray)machNames
{
  return self->_machNames;
}

- (void)setMachNames:(id)a3
{
}

- (NSMutableSet)invalidatedServices
{
  return self->_invalidatedServices;
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (NSMutableSet)endpointConnections
{
  return self->_endpointConnections;
}

- (void)setEndpointConnections:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_invalidatedServices, 0);
  objc_storeStrong((id *)&self->_machNames, 0);
  objc_storeStrong((id *)&self->_allowanceRequestors, 0);
  objc_storeStrong((id *)&self->_begunSessionIDs, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_defaultDocumentRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Client connection to service was interrupted: %@", v2, v3, v4, v5, 2u);
}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Error sending -[service endRemoteTextInputSessionWithID:] message: %@", v2, v3, v4, v5, 2u);
}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_141_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 136315394;
  uint64_t v4 = "-[RTIInputSystemClient _endSessionWithID:forServices:options:completion:]_block_invoke_2";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_fault_impl(&dword_19AFFA000, a2, OS_LOG_TYPE_FAULT, "%s  Timeout while waiting to end session. sessionID = %@", (uint8_t *)&v3, 0x16u);
}

void __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[RTIInputSystemClient _endAllActiveSessionsForServices:animated:completion:]_block_invoke_2";
  _os_log_fault_impl(&dword_19AFFA000, log, OS_LOG_TYPE_FAULT, "%s  Timeout while waiting to end all active sessions.", (uint8_t *)&v1, 0xCu);
}

- (void)endRemoteTextInputSessionWithID:(uint64_t)a3 options:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)endRemoteTextInputSessionWithID:options:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Can only end an active session. sessionID = %@", v2, v3, v4, v5, 2u);
}

- (void)remoteTextInputSessionWithID:textSuggestionsChanged:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Can only set suggestions for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
}

- (void)remoteTextInputSessionWithID:(uint64_t)a3 didAddSupplementalLexicon:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)remoteTextInputSessionWithID:didAddSupplementalLexicon:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Can only didAddSupplementalLexicon for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
}

- (void)remoteTextInputSessionWithID:(uint64_t)a3 didAddRTISupplementalLexicon:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)remoteTextInputSessionWithID:didAddRTISupplementalLexicon:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Can only didAddRTISupplementalLexicon for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
}

- (void)remoteTextInputSessionWithID:(uint64_t)a3 didRemoveSupplementalLexiconWithIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)remoteTextInputSessionWithID:didRemoveSupplementalLexiconWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Can only didRemoveSupplementalLexiconWithIdentifier for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
}

- (void)remoteTextInputSessionWithID:(uint64_t)a3 didRemoveRTISupplementalLexiconWithIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Can only didRemoveRTISupplementalLexiconWithIdentifier for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
}

- (void)remoteTextInputSessionWithID:(void *)a1 performInputOperation:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _RTI_NSStringFromRTIInputModality([a1 inputModality]);
  sel_getName((SEL)[a1 actionSelector]);
  uint64_t v5 = [a1 customInfoType];
  int v6 = 136315906;
  uint64_t v7 = "-[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]";
  __int16 v8 = 2112;
  id v9 = v4;
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_19AFFA000, a2, OS_LOG_TYPE_ERROR, "%s  perform input operation requires a valid sessionID. inputModality = %@, inputOperation = %s, customInfoType = %@", (uint8_t *)&v6, 0x2Au);
}

- (void)remoteTextInputSessionWithID:performInputOperation:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Can only perform input operation for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
}

- (void)remoteTextInputSessionWithID:(void *)a1 performInputOperation:(NSObject *)a2 withResponse:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _RTI_NSStringFromRTIInputModality([a1 inputModality]);
  sel_getName((SEL)[a1 actionSelector]);
  uint64_t v5 = [a1 customInfoType];
  int v6 = 136315906;
  uint64_t v7 = "-[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:withResponse:]";
  __int16 v8 = 2112;
  id v9 = v4;
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_19AFFA000, a2, OS_LOG_TYPE_ERROR, "%s  perform input operation requires a valid sessionID. inputModality = %@, inputOperation = %s, customInfoType = %@", (uint8_t *)&v6, 0x2Au);
}

- (void)remoteTextInputSessionWithID:performInputOperation:withResponse:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Can only perform input operation for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
}

- (void)remoteTextInputSessionWithID:performInputOperation:withResponse:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  No services for this session. sessionID = %@", v2, v3, v4, v5, 2u);
}

@end