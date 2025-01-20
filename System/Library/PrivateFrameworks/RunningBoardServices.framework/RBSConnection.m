@interface RBSConnection
+ (id)connectionQueue;
+ (id)handshakeQueue;
+ (id)sharedInstance;
+ (id)testConnectionWithConnection:(id)a3;
+ (void)setInDaemon;
- (BOOL)executeTerminateRequest:(id)a3 assertion:(id *)a4 error:(id *)a5;
- (BOOL)invalidateAssertion:(id)a3 error:(id *)a4;
- (BOOL)invalidateAssertionWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isIdentityAnAngel:(id)a3 withError:(id *)a4;
- (BOOL)saveEndowment:(id)a3 withError:(id *)a4;
- (BOOL)subscribeProcessStateMonitor:(id)a3 configuration:(id)a4 error:(id *)a5;
- (RBSConnection)init;
- (id)_connection;
- (id)_initWithConnection:(id)a1;
- (id)acquireAssertion:(id)a3 error:(id *)a4;
- (id)assertionDescriptorsByPidWithFlattenedAttributes:(BOOL)a3 error:(id *)a4;
- (id)busyExtensionInstancesFromSet:(id)a3 error:(id *)a4;
- (id)captureStateForSubsystem:(id)a3 error:(id *)a4;
- (id)executeLaunchRequest:(id)a3;
- (id)handle;
- (id)handleForKey:(id)a3;
- (id)handleForPredicate:(id)a3 error:(id *)a4;
- (id)hostProcessForInstance:(id)a3 error:(id *)a4;
- (id)identifiersForStateCaptureSubsystems:(id *)a3;
- (id)identity;
- (id)infoPlistResultForInstance:(id)a3 forKeys:(id)a4 error:(id *)a5;
- (id)lastExitContextForInstance:(id)a3 error:(id *)a4;
- (id)limitationsForInstance:(id)a3 error:(id *)a4;
- (id)managedEndpointByLaunchIdentifier;
- (id)portForIdentifier:(id)a3;
- (id)preventLaunchPredicatesWithError:(id *)a3;
- (id)processName:(id)a3;
- (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 error:(id *)a5;
- (os_unfair_lock)_lock_connect;
- (uint64_t)cleanOutStateIfNeeded;
- (void)_disconnect;
- (void)_handleDaemonDidStart;
- (void)_handleMessage:(uint64_t)a1;
- (void)_handshake;
- (void)_lock_announceLostInheritances;
- (void)_lock_connect;
- (void)_lock_setConnection:(uint64_t)a1;
- (void)_subscribeToProcessDeath:(void *)a3 handler:;
- (void)async_assertionWillInvalidate:(id)a3;
- (void)async_assertionsDidInvalidate:(id)a3 withError:(id)a4;
- (void)async_didChangeInheritances:(id)a3 completion:(id)a4;
- (void)async_observedPreventLaunchPredicatesUpdate:(id)a3 completion:(id)a4;
- (void)async_observedProcessExitEvents:(id)a3 completion:(id)a4;
- (void)async_observedProcessStatesDidChange:(id)a3 completion:(id)a4;
- (void)async_processDidExit:(id)a3 withContext:(id)a4;
- (void)async_willExpireAssertionsSoon;
- (void)dealloc;
- (void)intendToExit:(id)a3 withStatus:(id)a4;
- (void)observeProcessAssertionsExpirationWarningWithBlock:(uint64_t)a1;
- (void)registerServiceDelegate:(uint64_t)a1;
- (void)reset;
- (void)subscribeToProcessDeath:(id)a3 handler:(id)a4;
- (void)unsubscribeProcessStateMonitor:(id)a3 configuration:(id)a4;
@end

@implementation RBSConnection

void __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) _handleProcessStateChange:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __65__RBSConnection_async_observedProcessStatesDidChange_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_handleProcessStateChange:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __38__RBSConnection_cleanOutStateIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        v13 = objc_msgSend(v6, "process", (void)v14);
        LOBYTE(v12) = [v12 matchesProcess:v13];

        if (v12)
        {

          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(a1 + 40) + 88) removeObjectForKey:v5];
LABEL_11:
}

- (id)handleForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = -[RBSConnection _lock_connect]((os_unfair_lock *)self);
  id v7 = self->_handleConnection;
  if (!v7)
  {
    uint64_t v8 = rbs_connection_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = @"com.apple.runningboard";
      _os_log_impl(&dword_191FE8000, v8, OS_LOG_TYPE_DEFAULT, "Creating side-channel connection to %{public}@", buf, 0xCu);
    }

    mach_service = xpc_connection_create_mach_service((const char *)[@"com.apple.runningboard" UTF8String], 0, 2uLL);
    handleConnection = self->_handleConnection;
    self->_handleConnection = mach_service;

    uint64_t v11 = mach_service;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30__RBSConnection_handleForKey___block_invoke;
    handler[3] = &unk_1E57414F8;
    id v7 = v11;
    long long v17 = v7;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_activate(v7);
  }
  os_unfair_lock_unlock(p_lock);
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lookupHandleForKey_error_, v5, 0);
  uint64_t v12 = (SEL *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = objc_opt_class();
  long long v14 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v12, v7, v13, 0);

  return v14;
}

- (void)_handleMessage:(uint64_t)a1
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    uint64_t v4 = +[RBSXPCMessage messageForXPCMessage:v3];
    uint64_t v5 = [v4 method];
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      id v7 = rbs_connection_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RBSConnection _handleMessage:].cold.4();
      }
    }
    else
    {
      uint64_t v8 = (const char *)v5;
      char v9 = objc_opt_respondsToSelector();
      if (v9)
      {
        uint64_t v10 = rbs_message_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          [(RBSConnection *)a1 _handleMessage:v10];
        }

        uint64_t v11 = [v4 reply];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __32__RBSConnection__handleMessage___block_invoke;
        v57[3] = &unk_1E57413F8;
        id v7 = v11;
        v58 = v7;
        uint64_t v12 = (void *)MEMORY[0x192FEC490](v57);
        v55[0] = 0;
        v55[1] = v55;
        v55[2] = 0x3032000000;
        v55[3] = __Block_byref_object_copy__1;
        v55[4] = __Block_byref_object_dispose__1;
        id v56 = 0;
        if (v8 == sel_async_didChangeInheritances_completion_)
        {
          activity_block[0] = MEMORY[0x1E4F143A8];
          activity_block[1] = 3221225472;
          activity_block[2] = __32__RBSConnection__handleMessage___block_invoke_2;
          activity_block[3] = &unk_1E5741570;
          v53 = v55;
          id v50 = v4;
          uint64_t v51 = a1;
          id v52 = v12;
          v54 = v8;
          _os_activity_initiate(&dword_191FE8000, "didChangeInheritances", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
        }
        else if (v8 == sel_async_willExpireAssertionsSoon)
        {
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __32__RBSConnection__handleMessage___block_invoke_206;
          v48[3] = &unk_1E57413F8;
          v48[4] = a1;
          _os_activity_initiate(&dword_191FE8000, "willExpireAssertionsSoon", OS_ACTIVITY_FLAG_DEFAULT, v48);
        }
        else if (v8 == sel_async_assertionWillInvalidate_)
        {
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __32__RBSConnection__handleMessage___block_invoke_2_209;
          v43[3] = &unk_1E5741598;
          id v44 = v4;
          uint64_t v45 = a1;
          v46 = v55;
          v47 = v8;
          _os_activity_initiate(&dword_191FE8000, "assertionWillInvalidate", OS_ACTIVITY_FLAG_DEFAULT, v43);
        }
        else if (v8 == sel_async_assertionsDidInvalidate_withError_)
        {
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __32__RBSConnection__handleMessage___block_invoke_212;
          v38[3] = &unk_1E5741598;
          id v39 = v4;
          uint64_t v40 = a1;
          v41 = v55;
          v42 = v8;
          _os_activity_initiate(&dword_191FE8000, "assertionsDidInvalidate", OS_ACTIVITY_FLAG_DEFAULT, v38);
        }
        else if (v8 == sel_async_observedProcessStatesDidChange_completion_)
        {
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __32__RBSConnection__handleMessage___block_invoke_215;
          v32[3] = &unk_1E5741570;
          v36 = v55;
          id v33 = v4;
          uint64_t v34 = a1;
          id v35 = v12;
          v37 = v8;
          _os_activity_initiate(&dword_191FE8000, "observedProcessStatesDidChange", OS_ACTIVITY_FLAG_DEFAULT, v32);
        }
        else if (v8 == sel_async_observedProcessExitEvents_completion_)
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __32__RBSConnection__handleMessage___block_invoke_218;
          v26[3] = &unk_1E5741570;
          v30 = v55;
          id v27 = v4;
          uint64_t v28 = a1;
          id v29 = v12;
          v31 = v8;
          _os_activity_initiate(&dword_191FE8000, "observedProcessExitEvents", OS_ACTIVITY_FLAG_DEFAULT, v26);
        }
        else if (v8 == sel_async_observedPreventLaunchPredicatesUpdate_completion_)
        {
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __32__RBSConnection__handleMessage___block_invoke_222;
          v20[3] = &unk_1E5741570;
          v24 = v55;
          id v21 = v4;
          uint64_t v22 = a1;
          id v23 = v12;
          v25 = v8;
          _os_activity_initiate(&dword_191FE8000, "observedPreventLaunchPredicatesUpdate", OS_ACTIVITY_FLAG_DEFAULT, v20);
        }
        else if (v8 == sel_async_processDidExit_withContext_)
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __32__RBSConnection__handleMessage___block_invoke_225;
          v15[3] = &unk_1E5741598;
          id v16 = v4;
          uint64_t v17 = a1;
          v18 = v55;
          uint64_t v19 = v8;
          _os_activity_initiate(&dword_191FE8000, "processDidExit", OS_ACTIVITY_FLAG_DEFAULT, v15);
        }
        else
        {
          uint64_t v13 = rbs_connection_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            long long v14 = NSStringFromSelector(v8);
            [(RBSConnection *)v14 _handleMessage:v13];
          }
        }
        _Block_object_dispose(v55, 8);
      }
      else
      {
        id v7 = rbs_connection_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[RBSConnection _handleMessage:](v8, v7);
        }
      }
    }
  }
}

void __32__RBSConnection__handleMessage___block_invoke_215(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  BOOL v6 = [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v5, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v7 = rbs_connection_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_observedProcessStatesDidChange:completion:", v6, *(void *)(a1 + 48));
  }
}

- (id)_connection
{
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 56));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v2 = -[RBSConnection _lock_connect](a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    dispatch_async_and_wait(*(dispatch_queue_t *)(a1 + 64), &__block_literal_global_228);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (os_unfair_lock)_lock_connect
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = (uint64_t)a1;
    os_unfair_lock_assert_owner(a1 + 10);
    id v2 = *(void **)(v1 + 8);
    if (v2)
    {
LABEL_9:
      a1 = v2;
      goto LABEL_10;
    }
    if (*(void *)(v1 + 144) == 3)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    char CanAccessMachService = RBSSandboxCanAccessMachService();
    uint64_t v4 = rbs_connection_log();
    uint64_t v5 = v4;
    if (CanAccessMachService)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        char v9 = @"com.apple.runningboard";
        _os_log_impl(&dword_191FE8000, v5, OS_LOG_TYPE_DEFAULT, "Creating connection to %{public}@", (uint8_t *)&v8, 0xCu);
      }

      xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[@"com.apple.runningboard" UTF8String], *(dispatch_queue_t *)(v1 + 56), 2uLL);
      -[RBSConnection _lock_setConnection:](v1, mach_service);

      id v2 = *(void **)(v1 + 8);
      goto LABEL_9;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[RBSConnection _lock_connect]();
    }

    a1 = 0;
  }
LABEL_10:
  return a1;
}

- (void)_lock_setConnection:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    objc_storeStrong((id *)(a1 + 8), a2);
    xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 8), *(dispatch_queue_t *)(a1 + 56));
    uint64_t v5 = *(_xpc_connection_s **)(a1 + 8);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __37__RBSConnection__lock_setConnection___block_invoke;
    handler[3] = &unk_1E57414F8;
    void handler[4] = a1;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 8));
    BOOL v6 = *(_xpc_connection_s **)(a1 + 8);
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_connection_send_message(v6, v7);
  }
}

void __27__RBSConnection__handshake__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v2 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v3 = *(void *)&(*v2)[36]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(*v2 + 10);
  if (v3 != 3)
  {
    unint64_t v4 = 0;
    uint64_t v71 = v1;
    while (1)
    {
      uint64_t v5 = rbs_connection_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v4 + 1;
        _os_log_impl(&dword_191FE8000, v5, OS_LOG_TYPE_DEFAULT, "Sending handshake request attempt #%lu to server", buf, 0xCu);
      }

      os_unfair_lock_lock(*v2 + 10);
      BOOL v6 = -[RBSConnection _lock_connect](*v2);
      uint64_t v7 = *(void *)&(*v2)[36]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(*v2 + 10);
      if (v7 == 3 || v6 == 0) {
        break;
      }
      +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_handshakeWithRequest_, *(void *)(v1 + 40), 0);
      char v9 = (SEL *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = objc_opt_class();
      id v87 = 0;
      uint64_t v11 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v9, v6, v10, &v87);
      id v12 = v87;
      if (v11)
      {
        uint64_t v13 = rbs_connection_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_191FE8000, v13, OS_LOG_TYPE_DEFAULT, "Handshake succeeded", buf, 2u);
        }

        uint64_t v7 = 2;
      }
      else
      {
        if (v4 >= 0x3E8) {
          __27__RBSConnection__handshake__block_invoke_cold_4();
        }
        long long v14 = rbs_connection_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v12;
          _os_log_error_impl(&dword_191FE8000, v14, OS_LOG_TYPE_ERROR, "Handshake failed with error: <%{public}@>", buf, 0xCu);
        }

        os_unfair_lock_lock(*v2 + 10);
        -[RBSConnection _lock_announceLostInheritances]((uint64_t)*v2);
        os_unfair_lock_unlock(*v2 + 10);
        unsigned int v15 = (unsigned __int16)++v4 / 0xAu;
        if (v15 >= 0xA) {
          uint64_t v16 = 10;
        }
        else {
          uint64_t v16 = v15;
        }
        if (v16)
        {
          uint64_t v17 = rbs_connection_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v16;
            _os_log_impl(&dword_191FE8000, v17, OS_LOG_TYPE_DEFAULT, "Sleeping for %lus before trying to reconnect", buf, 0xCu);
          }

          sleep(v16);
        }
        uint64_t v1 = v71;
      }

      if (v11) {
        goto LABEL_30;
      }
    }
    v18 = rbs_connection_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __27__RBSConnection__handshake__block_invoke_cold_5(&v85, v86, v18);
    }

    -[RBSConnection _disconnect]((uint64_t)*v2);
  }
  uint64_t v11 = 0;
  uint64_t v7 = 3;
LABEL_30:
  os_unfair_lock_lock(*v2 + 10);
  *(void *)&(*v2)[36]._os_unfair_lock_opaque = v7;
  uint64_t v19 = *v2;
  if (*(void *)&(*v2)[36]._os_unfair_lock_opaque != 2) {
    goto LABEL_67;
  }
  uint64_t v20 = [v11 handle];
  id v21 = [v20 identity];
  if (!v21)
  {
    uint64_t v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:*(void *)(v1 + 64) object:*(void *)(v1 + 32) file:@"RBSConnection.m" lineNumber:1450 description:@"No process identity was resolved!"];
  }
  uint64_t v22 = rbs_connection_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_191FE8000, v22, OS_LOG_TYPE_DEFAULT, "Identity resolved as %{public}@", buf, 0xCu);
  }

  id v23 = [*(id *)&(*v2)[6]._os_unfair_lock_opaque identity];
  v24 = v23;
  uint64_t v25 = (uint64_t)*v2;
  if (!*(void *)&(*v2)[6]._os_unfair_lock_opaque)
  {
LABEL_38:
    objc_storeStrong((id *)(v25 + 24), v20);
    v26 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    id v27 = [v11 assertionIdentifiersByOldIdentifier];
    uint64_t v28 = [MEMORY[0x1E4F1CA80] set];
    os_unfair_lock_lock(*v2 + 11);
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __27__RBSConnection__handshake__block_invoke_245;
    v82[3] = &unk_1E57415E0;
    v82[4] = *v2;
    id v69 = v26;
    id v83 = v69;
    id v29 = v28;
    id v84 = v29;
    v70 = v27;
    [v27 enumerateKeysAndObjectsUsingBlock:v82];
    v30 = [v11 assertionErrorsByOldIdentifier];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __27__RBSConnection__handshake__block_invoke_247;
    v81[3] = &unk_1E5741608;
    v81[4] = *v2;
    [v30 enumerateKeysAndObjectsUsingBlock:v81];

    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __27__RBSConnection__handshake__block_invoke_249;
    v78[3] = &unk_1E57413D0;
    id v31 = v29;
    uint64_t v32 = (uint64_t)*v2;
    id v68 = v31;
    id v79 = v31;
    uint64_t v80 = v32;
    +[RBSWorkloop performBackgroundWork:v78];
    if ([*(id *)&(*v2)[18]._os_unfair_lock_opaque count])
    {
      id v33 = rbs_assertion_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        __27__RBSConnection__handshake__block_invoke_cold_2((uint64_t)v2, v33, v34, v35, v36, v37, v38, v39);
      }
    }
    objc_storeStrong((id *)&(*v2)[18], v26);
    if ([*(id *)&(*v2)[18]._os_unfair_lock_opaque count])
    {
      uint64_t v40 = rbs_connection_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = *(void *)&(*v2)[18]._os_unfair_lock_opaque;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v41;
        _os_log_impl(&dword_191FE8000, v40, OS_LOG_TYPE_INFO, "Reacquired assertions: %{public}@", buf, 0xCu);
      }
    }
    os_unfair_lock_unlock(*v2 + 11);
    v42 = [v11 managedEndpointByLaunchIdentifier];
    v43 = v42;
    if (v42)
    {
      id v44 = v42;
    }
    else
    {
      id v44 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    uint64_t v45 = v44;

    v46 = *(void **)&(*v2)[34]._os_unfair_lock_opaque;
    if (v46 && v46 != v45)
    {
      if (v45
        && (CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)&(*v2)[34]._os_unfair_lock_opaque),
            Count == CFDictionaryGetCount((CFDictionaryRef)v45)))
      {
        v65 = v24;
        v66 = v20;
        v67 = v21;
        uint64_t v72 = v1;
        memset(v93, 0, sizeof(v93));
        id v48 = v46;
        uint64_t v49 = [v48 countByEnumeratingWithState:v93 objects:buf count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v73 = **(void **)&v93[1];
          while (2)
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (**(void **)&v93[1] != v73) {
                objc_enumerationMutation(v48);
              }
              uint64_t v52 = *(void *)(*((void *)&v93[0] + 1) + 8 * i);
              v53 = [v48 objectForKey:v52];
              v54 = [v45 objectForKey:v52];
              int v55 = [v53 _isEquivalentToEndpoint:v54];

              if (!v55)
              {

                uint64_t v1 = v72;
                uint64_t v20 = v66;
                id v21 = v67;
                v24 = v65;
                goto LABEL_63;
              }
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:v93 objects:buf count:16];
            if (v50) {
              continue;
            }
            break;
          }
        }

        uint64_t v1 = v72;
        uint64_t v20 = v66;
        id v21 = v67;
        v24 = v65;
      }
      else
      {
LABEL_63:
        id v56 = rbs_connection_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
          __27__RBSConnection__handshake__block_invoke_cold_1((uint64_t)v2, (uint64_t)v45, v56);
        }
      }
    }
    v57 = *(void **)&(*v2)[34]._os_unfair_lock_opaque;
    *(void *)&(*v2)[34]._os_unfair_lock_opaque = v45;

    uint64_t v19 = *v2;
LABEL_67:
    os_unfair_lock_unlock(v19 + 10);
    if (v7 == 2)
    {
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __27__RBSConnection__handshake__block_invoke_250;
      v74[3] = &unk_1E5741658;
      id v75 = *(id *)(v1 + 48);
      id v58 = *(id *)(v1 + 56);
      uint64_t v59 = *(void *)(v1 + 32);
      id v76 = v58;
      uint64_t v77 = v59;
      +[RBSWorkloop performBackgroundWorkWithServiceClass:33 block:v74];
    }
    return;
  }
  if ([v23 isEqual:v21])
  {
    uint64_t v25 = (uint64_t)*v2;
    goto LABEL_38;
  }
  uint64_t v61 = [v24 hostIdentity];
  if (v61)
  {
    v62 = (void *)v61;
    v63 = [v21 hostIdentity];

    if (!v63)
    {
      v64 = rbs_connection_log();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        __27__RBSConnection__handshake__block_invoke_cold_3();
      }

      abort_with_reason();
    }
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  *(_OWORD *)buf = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  LODWORD(v93[0]) = 138412546;
  *(void *)((char *)v93 + 4) = v21;
  WORD6(v93[0]) = 2112;
  *(void *)((char *)v93 + 14) = v24;
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (BOOL)subscribeProcessStateMonitor:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (subscribeProcessStateMonitor_configuration_error__permanentError)
  {
    BOOL v10 = 0;
    if (a5) {
      *a5 = (id) subscribeProcessStateMonitor_configuration_error__permanentError;
    }
    goto LABEL_20;
  }
  os_unfair_lock_lock(&self->_lock);
  if (![(NSHashTable *)self->_processMonitors containsObject:v8]) {
    [(NSHashTable *)self->_processMonitors addObject:v8];
  }
  uint64_t v11 = (void *)[(NSMutableDictionary *)self->_stateByIdentity copy];
  id v12 = [v8 calloutQueue];
  dispatch_qos_class_t v13 = [v9 serviceClass];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke;
  v35[3] = &unk_1E57413D0;
  id v14 = v11;
  id v36 = v14;
  id v15 = v8;
  id v37 = v15;
  RBSDispatchAsyncWithQoS(v12, v13, v35);

  preventLaunchPredicates = self->_preventLaunchPredicates;
  if (preventLaunchPredicates)
  {
    uint64_t v17 = (void *)[(NSSet *)preventLaunchPredicates copy];
    v18 = [v15 calloutQueue];
    dispatch_qos_class_t v19 = [v9 serviceClass];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke_2;
    v32[3] = &unk_1E57413D0;
    id v33 = v15;
    id v34 = v17;
    id v20 = v17;
    RBSDispatchAsyncWithQoS(v18, v19, v32);
  }
  os_unfair_lock_unlock(&self->_lock);
  int has_internal_content = os_variant_has_internal_content();
  uint64_t v22 = rbs_monitor_log();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (has_internal_content)
  {
    if (v23)
    {
      v24 = [v9 debugDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v24;
LABEL_14:
      _os_log_impl(&dword_191FE8000, v22, OS_LOG_TYPE_DEFAULT, "Updating configuration of monitor %{public}@", buf, 0xCu);
    }
  }
  else if (v23)
  {
    v24 = [v9 description];
    *(_DWORD *)buf = 138543362;
    uint64_t v39 = v24;
    goto LABEL_14;
  }

  -[RBSConnection cleanOutStateIfNeeded]((uint64_t)self);
  uint64_t v25 = +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_void_subscribeToProcessStateChangesWithConfiguration_error_, v9, 0);
  v26 = -[RBSConnection _connection]((uint64_t)self);
  id v31 = 0;
  id v27 = (id)[v25 sendToConnection:v26 error:&v31];
  id v28 = v31;
  id v29 = v31;

  if (objc_msgSend(v29, "rbs_isPermanentFailure")) {
    objc_storeStrong((id *)&subscribeProcessStateMonitor_configuration_error__permanentError, v28);
  }
  if (a5) {
    *a5 = v29;
  }
  BOOL v10 = v29 == 0;

LABEL_20:
  return v10;
}

- (uint64_t)cleanOutStateIfNeeded
{
  if (result)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __38__RBSConnection_cleanOutStateIfNeeded__block_invoke;
    v1[3] = &unk_1E57413F8;
    v1[4] = result;
    return +[RBSWorkloop performBackgroundWorkWithServiceClass:9 block:v1];
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  }
  id v2 = (void *)sharedInstance___sharedInstance_0;
  return v2;
}

- (id)handle
{
  if (a1)
  {
    uint64_t v5 = 0;
    BOOL v6 = &v5;
    uint64_t v7 = 0x3032000000;
    id v8 = __Block_byref_object_copy__1;
    id v9 = __Block_byref_object_dispose__1;
    id v10 = 0;
    uint64_t v1 = *(NSObject **)(a1 + 64);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __23__RBSConnection_handle__block_invoke;
    v4[3] = &unk_1E5741460;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_async_and_wait(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (statesForPredicate_withDescriptor_error__permanentError)
  {
    id v10 = 0;
    if (a5) {
      *a5 = (id) statesForPredicate_withDescriptor_error__permanentError;
    }
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_statesForPredicate_descriptor_error_, v8, v9, 0);
    uint64_t v11 = (SEL *)objc_claimAutoreleasedReturnValue();
    id v12 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v18 = 0;
    id v10 = -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v11, v12, v13, v14, &v18);
    id v15 = v18;

    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      if (objc_msgSend(v15, "rbs_isPermanentFailure")) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = (void *)statesForPredicate_withDescriptor_error__permanentError;
      }
      objc_storeStrong((id *)&statesForPredicate_withDescriptor_error__permanentError, v16);
    }
  }
  return v10;
}

void __38__RBSConnection_cleanOutStateIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  id v2 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 80) allObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v17 + 1) + 8 * v7) configuration];
        id v9 = v8;
        if (v8)
        {
          id v10 = [v8 predicates];
          [v2 addObjectsFromArray:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  uint64_t v11 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) copy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__RBSConnection_cleanOutStateIfNeeded__block_invoke_2;
  v14[3] = &unk_1E5741548;
  uint64_t v12 = *(void *)(a1 + 32);
  id v15 = v2;
  uint64_t v16 = v12;
  id v13 = v2;
  [v11 enumerateKeysAndObjectsUsingBlock:v14];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
}

- (void)async_observedProcessStatesDidChange:(id)a3 completion:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = (void (**)(void))a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v34 = [(NSHashTable *)self->_processMonitors allObjects];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    id v37 = self;
    uint64_t v38 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v12 = rbs_monitor_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v11 process];
          int v14 = objc_msgSend(v13, "rbs_pid");
          id v15 = [v11 process];
          uint64_t v16 = [v15 identity];
          NSStringFromRBSTaskState([v11 taskState]);
          v18 = uint64_t v17 = v8;
          long long v19 = [v11 endowmentNamespaces];
          int v20 = [v19 containsObject:@"com.apple.frontboard.visibility"];
          *(_DWORD *)buf = 67109890;
          id v21 = @"-NotVisible";
          if (v20) {
            id v21 = @"-Visible";
          }
          int v53 = v14;
          __int16 v54 = 2114;
          int v55 = v16;
          __int16 v56 = 2114;
          v57 = v18;
          __int16 v58 = 2114;
          uint64_t v59 = v21;
          _os_log_impl(&dword_191FE8000, v12, OS_LOG_TYPE_DEFAULT, "Received state update for %d (%{public}@, %{public}@%{public}@", buf, 0x26u);

          uint64_t v8 = v17;
          self = v37;
          uint64_t v9 = v38;
        }

        uint64_t v22 = [v11 process];
        BOOL v23 = [v22 identity];

        if (!v23) {
          -[RBSConnection async_observedProcessStatesDidChange:completion:]();
        }
        int v24 = [v11 isEmptyState];
        stateByIdentity = self->_stateByIdentity;
        if (v24) {
          [(NSMutableDictionary *)stateByIdentity removeObjectForKey:v23];
        }
        else {
          [(NSMutableDictionary *)stateByIdentity setObject:v11 forKey:v23];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(lock);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v26 = v34;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        uint64_t v32 = [v31 calloutQueue];
        dispatch_qos_class_t v33 = [v31 serviceClass];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __65__RBSConnection_async_observedProcessStatesDidChange_completion___block_invoke;
        v40[3] = &unk_1E57413D0;
        id v41 = obj;
        v42 = v31;
        RBSDispatchAsyncWithQoS(v32, v33, v40);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v28);
  }

  v36[2](v36);
}

uint64_t __32__RBSConnection__handleMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) send];
}

- (id)handleForPredicate:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lookupHandleForPredicate_error_, v6, 0);
    uint64_t v7 = (SEL *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v9 = objc_opt_class();
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v7, v8, v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28588];
    v14[0] = @"No predicate specified";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = [v10 errorWithDomain:@"RBSRequestErrorDomain" code:1 userInfo:v11];

    a4 = 0;
  }

  return a4;
}

void __37__RBSConnection__lock_setConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x192FECA30]();
  if (v4 == MEMORY[0x1E4F145A8])
  {
    id v5 = (id)MEMORY[0x1E4F14520];
    id v6 = rbs_connection_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v3 == v5)
    {
      if (v7) {
        __37__RBSConnection__lock_setConnection___block_invoke_cold_1();
      }

      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
      xpc_connection_set_event_handler(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), &__block_literal_global_231);
      xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8));
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 8);
      *(void *)(v8 + 8) = 0;

      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 16);
      *(void *)(v10 + 16) = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
      -[RBSConnection _handshake](*(void *)(a1 + 32));
    }
    else
    {
      if (v7) {
        __37__RBSConnection__lock_setConnection___block_invoke_cold_2();
      }

      -[RBSConnection _disconnect](*(void *)(a1 + 32));
    }
  }
  else if (v4 == MEMORY[0x1E4F14590])
  {
    -[RBSConnection _handleMessage:](*(void *)(a1 + 32), v3);
  }
}

- (id)executeLaunchRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (__CFString *)a3;
  id v5 = [[RBSLaunchResponse alloc] _init];
  id v6 = v5;
  if (executeLaunchRequest__permanentError)
  {
    objc_msgSend(v5, "setError:");
  }
  else
  {
    BOOL v7 = rbs_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v4;
      _os_log_impl(&dword_191FE8000, v7, OS_LOG_TYPE_INFO, "Sending launch request: %{public}@", buf, 0xCu);
    }

    uint64_t v8 = +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_executeLaunchRequest_error_, v4, 0);
    uint64_t v9 = -[RBSConnection _connection]((uint64_t)self);
    id v30 = 0;
    uint64_t v10 = [v8 sendToConnection:v9 error:&v30];
    id v11 = v30;
    uint64_t v12 = (__CFString *)v30;

    [v6 setError:v12];
    if ([(__CFString *)v12 rbs_isPermanentFailure]) {
      objc_storeStrong((id *)&executeLaunchRequest__permanentError, v11);
    }
    uint64_t v13 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"return-value"];
    [v6 setProcess:v13];
    int v14 = rbs_general_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = @"No Error";
      if (!v13) {
        id v15 = v12;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v15;
      _os_log_impl(&dword_191FE8000, v14, OS_LOG_TYPE_INFO, "Received launch request response: <%{public}@>", buf, 0xCu);
    }

    uint64_t v16 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"assertion-identifier"];
    if (v16)
    {
      uint64_t v27 = v13;
      uint64_t v28 = v12;
      uint64_t v29 = v8;
      uint64_t v17 = [(__CFString *)v4 context];
      long long v18 = [v17 identity];
      long long v19 = +[RBSTarget targetWithProcessIdentity:v18];

      int v20 = [v17 explanation];
      id v21 = [v17 attributes];
      uint64_t v22 = +[RBSAssertionDescriptor descriptorWithIdentifier:v16 target:v19 explanation:v20 attributes:v21];

      id v23 = [[RBSAssertion alloc] _initWithServerValidatedDescriptor:v22];
      int v24 = rbs_assertion_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[RBSConnection acquireAssertion:error:]();
      }

      os_unfair_lock_lock(&self->_assertionLock);
      [(NSMapTable *)self->_acquiredAssertionsByIdentifier setObject:v23 forKey:v16];
      os_unfair_lock_unlock(&self->_assertionLock);
      [v6 setAssertion:v23];

      uint64_t v12 = v28;
      uint64_t v8 = v29;
      uint64_t v13 = v27;
    }
    uint64_t v25 = [v10 decodeDictionaryOfClass:objc_opt_class() forKey:@"managed-endpoint-by-launch-identifier"];
    if ([v25 count]) {
      [v6 setManagedEndpointByLaunchIdentifier:v25];
    }
  }
  return v6;
}

- (BOOL)invalidateAssertion:(id)a3 error:(id *)a4
{
  id v6 = [a3 identifier];
  if (v6) {
    BOOL v7 = [(RBSConnection *)self invalidateAssertionWithIdentifier:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)invalidateAssertionWithIdentifier:(id)a3 error:(id *)a4
{
  p_assertionLock = &self->_assertionLock;
  id v7 = a3;
  os_unfair_lock_lock(p_assertionLock);
  [(NSMapTable *)self->_acquiredAssertionsByIdentifier removeObjectForKey:v7];
  os_unfair_lock_unlock(p_assertionLock);
  uint64_t v8 = &selRef_async_invalidateAssertionWithIdentifier_;
  if (a4) {
    uint64_t v8 = &selRef_void_invalidateAssertionWithIdentifier_error_;
  }
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", *v8, v7, 0);
  uint64_t v9 = (SEL *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = -[RBSConnection _connection]((uint64_t)self);
  id v14 = 0;
  id v11 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v9, v10, 0, &v14);
  id v12 = v14;

  if (a4) {
    *a4 = v12;
  }

  return v12 == 0;
}

- (id)acquireAssertion:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v5 = [v19 descriptor];
  id v6 = rbs_assertion_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v5;
    _os_log_impl(&dword_191FE8000, v6, OS_LOG_TYPE_INFO, "Acquiring assertion: %{public}@", buf, 0xCu);
  }

  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_acquireAssertionWithDescriptor_error_, v5, 0);
  id v7 = (SEL *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *MEMORY[0x1E4F281F8];
  while (1)
  {
    uint64_t v9 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v10 = objc_opt_class();
    id v20 = 0;
    id v11 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v7, v9, v10, &v20);
    id v12 = v20;

    if (v11) {
      break;
    }
    if ([v12 code] != 4101) {
      goto LABEL_13;
    }
    uint64_t v13 = [v12 domain];
    int v14 = [v13 isEqualToString:v8];

    if (!v14) {
      goto LABEL_13;
    }
    id v15 = rbs_assertion_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RBSConnection acquireAssertion:error:](buf, &buf[1], v15);
    }

    [MEMORY[0x1E4F29060] sleepForTimeInterval:0.1];
  }
  uint64_t v16 = rbs_assertion_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[RBSConnection acquireAssertion:error:]();
  }

  os_unfair_lock_lock(&self->_assertionLock);
  [(NSMapTable *)self->_acquiredAssertionsByIdentifier setObject:v19 forKey:v11];
  os_unfair_lock_unlock(&self->_assertionLock);
LABEL_13:
  if (a4) {
    *a4 = v12;
  }

  return v11;
}

uint64_t __31__RBSConnection_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_0 = (uint64_t)-[RBSConnection _initWithConnection:]([RBSConnection alloc], 0);
  return MEMORY[0x1F41817F8]();
}

- (id)_initWithConnection:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v29.receiver = a1;
    v29.super_class = (Class)RBSConnection;
    a1 = objc_msgSendSuper2(&v29, sel_init);
    if (a1)
    {
      uint64_t v4 = rbs_connection_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191FE8000, v4, OS_LOG_TYPE_DEFAULT, "Initializing connection", buf, 2u);
      }

      *((_DWORD *)a1 + 10) = 0;
      *((_DWORD *)a1 + 12) = 0;
      *((void *)a1 + 18) = 0;
      uint64_t v5 = +[RBSConnection handshakeQueue];
      id v6 = (void *)*((void *)a1 + 8);
      *((void *)a1 + 8) = v5;

      uint64_t v7 = +[RBSConnection connectionQueue];
      uint64_t v8 = (void *)*((void *)a1 + 7);
      *((void *)a1 + 7) = v7;

      uint64_t v9 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      uint64_t v10 = (void *)*((void *)a1 + 9);
      *((void *)a1 + 9) = v9;

      uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
      id v12 = (void *)*((void *)a1 + 13);
      *((void *)a1 + 13) = v11;

      uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      int v14 = (void *)*((void *)a1 + 10);
      *((void *)a1 + 10) = v13;

      uint64_t v15 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v16 = (void *)*((void *)a1 + 14);
      *((void *)a1 + 14) = v15;

      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v18 = (void *)*((void *)a1 + 15);
      *((void *)a1 + 15) = v17;

      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v20 = (void *)*((void *)a1 + 11);
      *((void *)a1 + 11) = v19;

      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v22 = (void *)*((void *)a1 + 16);
      *((void *)a1 + 16) = v21;

      if (v3)
      {
        os_unfair_lock_lock((os_unfair_lock_t)a1 + 10);
        -[RBSConnection _lock_setConnection:]((uint64_t)a1, v3);
        *((void *)a1 + 18) = 2;
        os_unfair_lock_unlock((os_unfair_lock_t)a1 + 10);
      }
      else
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)__RBSDaemonDidStart, @"com.apple.runningboard.daemonstartup", 0, CFNotificationSuspensionBehaviorCoalesce);
        int v24 = *((void *)a1 + 7);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __37__RBSConnection__initWithConnection___block_invoke;
        block[3] = &unk_1E57413F8;
        a1 = a1;
        id v27 = a1;
        dispatch_sync(v24, block);
      }
    }
  }

  return a1;
}

+ (id)handshakeQueue
{
  if (handshakeQueue_onceToken != -1) {
    dispatch_once(&handshakeQueue_onceToken, &__block_literal_global_59);
  }
  id v2 = (void *)handshakeQueue_queue;
  return v2;
}

+ (id)connectionQueue
{
  if (connectionQueue_onceToken != -1) {
    dispatch_once(&connectionQueue_onceToken, &__block_literal_global_62);
  }
  id v2 = (void *)connectionQueue_queue;
  return v2;
}

void __32__RBSConnection__handleMessage___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  uint64_t v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v6 = rbs_connection_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_didChangeInheritances:completion:", v5, *(void *)(a1 + 48));
  }
}

- (void)async_didChangeInheritances:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = rbs_connection_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[RBSConnection async_didChangeInheritances:completion:]();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  inheritances = self->_inheritances;
  uint64_t v11 = [v6 gainedInheritances];
  [(NSMutableSet *)inheritances unionSet:v11];

  id v12 = self->_inheritances;
  uint64_t v13 = [v6 lostInheritances];
  [(NSMutableSet *)v12 minusSet:v13];

  int v14 = self->_serviceDelegate;
  os_unfair_lock_unlock(p_lock);
  uint64_t v15 = [v6 gainedInheritances];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    id v17 = [v6 gainedInheritances];
    [(RBSConnectionServiceDelegate *)v14 didReceiveInheritances:v17];
  }
  long long v18 = [v6 lostInheritances];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    id v20 = [v6 lostInheritances];
    [(RBSConnectionServiceDelegate *)v14 didLoseInheritances:v20];
  }
  v7[2](v7);
}

void __23__RBSConnection_handle__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && *(void *)(*(void *)(a1 + 32) + 144) == 3)
  {
    id v2 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v2 executablePath];

    uint64_t v3 = +[RBSProcessIdentity identityForExecutablePath:v7 pid:getpid() auid:0];
    uint64_t v4 = [[RBSProcessHandle alloc] initWithIdentity:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)identity
{
  if (a1)
  {
    uint64_t v1 = -[RBSConnection handle](a1);
    id v2 = [v1 identity];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void __37__RBSConnection__initWithConnection___block_invoke(uint64_t a1)
{
}

uint64_t __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePreventLaunchUpdate:*(void *)(a1 + 40)];
}

- (id)infoPlistResultForInstance:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (infoPlistResultForInstance_forKeys_error__permanentError)
  {
    uint64_t v10 = 0;
    if (a5) {
      *a5 = (id) infoPlistResultForInstance_forKeys_error__permanentError;
    }
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_infoPlistResultForInstance_forKeys_error_, v8, v9, 0);
    uint64_t v11 = (SEL *)objc_claimAutoreleasedReturnValue();
    id v12 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v13 = objc_opt_class();
    id v18 = 0;
    int v14 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v11, v12, v13, &v18);
    id v15 = v18;

    uint64_t v10 = [v14 value];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v10 = 0;
    }
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      if (objc_msgSend(v15, "rbs_isPermanentFailure")) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = (void *)infoPlistResultForInstance_forKeys_error__permanentError;
      }
      objc_storeStrong((id *)&infoPlistResultForInstance_forKeys_error__permanentError, v16);
    }
  }
  return v10;
}

uint64_t __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke()
{
  subscribeToProcessDeath_handler__processDeathQueue = (uint64_t)+[RBSWorkloop createCalloutQueue:]((uint64_t)RBSWorkloop, @"RBSProcessDeathQueue");
  return MEMORY[0x1F41817F8]();
}

- (void)unsubscribeProcessStateMonitor:(id)a3 configuration:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSHashTable *)self->_processMonitors containsObject:v6]) {
    [(NSHashTable *)self->_processMonitors removeObject:v6];
  }
  os_unfair_lock_unlock(&self->_lock);
  id v8 = rbs_monitor_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_191FE8000, v8, OS_LOG_TYPE_DEFAULT, "unsubscribing configuration of monitor %{public}@", buf, 0xCu);
  }

  -[RBSConnection cleanOutStateIfNeeded]((uint64_t)self);
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "identifier"));
  uint64_t v10 = +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_async_unsubscribeFromProcessStateChangesWithIdentifier_, v9, 0);

  uint64_t v11 = -[RBSConnection _connection]((uint64_t)self);
  id v12 = (id)[v10 sendToConnection:v11 error:0];
}

- (id)processName:(id)a3
{
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lookupProcessName_error_, a3, 0);
  uint64_t v4 = (SEL *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = -[RBSConnection _connection]((uint64_t)self);
  uint64_t v6 = objc_opt_class();
  id v11 = 0;
  id v7 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v4, v5, v6, &v11);
  id v8 = v11;

  if (v8)
  {
    id v9 = rbs_process_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSConnection processName:]();
    }
  }
  return v7;
}

void __32__RBSConnection_connectionQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.runningboardservices.connection.incoming", v2);
  uint64_t v1 = (void *)connectionQueue_queue;
  connectionQueue_queue = (uint64_t)v0;
}

void __31__RBSConnection_handshakeQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.runningboardservices.connection.outgoing", v2);
  uint64_t v1 = (void *)handshakeQueue_queue;
  handshakeQueue_queue = (uint64_t)v0;
}

- (void)_handshake
{
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_191FE8000, v0, OS_LOG_TYPE_FAULT, "Handshake called in runningboardd", v1, 2u);
}

- (void)_lock_announceLostInheritances
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    id v3 = *(id *)(a1 + 32);
    id v2 = (void *)[*(id *)(a1 + 104) copy];
    if ([v2 count]) {
      [v3 didLoseInheritances:v2];
    }
  }
}

- (void)subscribeToProcessDeath:(id)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = subscribeToProcessDeath_handler__onceToken;
  id v8 = a3;
  if (v7 != -1) {
    dispatch_once(&subscribeToProcessDeath_handler__onceToken, &__block_literal_global_134);
  }
  qos_class_t v9 = qos_class_self();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_2;
  v12[3] = &unk_1E5741520;
  qos_class_t v14 = v9;
  id v13 = v6;
  id v10 = v6;
  id v11 = (void *)[v12 copy];
  -[RBSConnection _subscribeToProcessDeath:handler:]((uint64_t)self, v8, v11);
}

- (void)_subscribeToProcessDeath:(void *)a3 handler:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void (**)(void, void, void))v6;
  if (!a1) {
    goto LABEL_21;
  }
  if (!v5)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:sel__subscribeToProcessDeath_handler_, a1, @"RBSConnection.m", 550, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v7) {
      goto LABEL_4;
    }
LABEL_23:
    int v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:sel__subscribeToProcessDeath_handler_, a1, @"RBSConnection.m", 551, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v6) {
    goto LABEL_23;
  }
LABEL_4:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  id v8 = [*(id *)(a1 + 120) objectForKey:v5];
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 120) setObject:v8 forKey:v5];
    qos_class_t v9 = rbs_process_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v5;
      _os_log_impl(&dword_191FE8000, v9, OS_LOG_TYPE_INFO, "Subscribing to death of process %{public}@", buf, 0xCu);
    }
  }
  id v10 = (void *)MEMORY[0x192FEC490](v7);
  [v8 addObject:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_subscribeToProcessDeath_error_, v5, 0);
  id v11 = (SEL *)objc_claimAutoreleasedReturnValue();
  id v12 = -[RBSConnection _connection](a1);
  uint64_t v13 = objc_opt_class();
  id v25 = 0;
  qos_class_t v14 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v11, v12, v13, &v25);
  id v15 = v25;

  if (v14
    || ([v15 domain],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isEqualToString:@"RBSRequestErrorDomain"],
        v16,
        v17))
  {
    id v18 = rbs_process_log();
    uint64_t v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[RBSConnection _subscribeToProcessDeath:handler:]();
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v5;
      _os_log_impl(&dword_191FE8000, v19, OS_LOG_TYPE_INFO, "Process %{public}@ is already exited, no need to subscribe", buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v20 = (void *)MEMORY[0x192FEC490](v7);
    uint64_t v21 = [v8 indexOfObjectIdenticalTo:v20];

    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = (void *)MEMORY[0x192FEC490](v7);
      [v8 removeObjectIdenticalTo:v22];

      if (![v8 count]) {
        [*(id *)(a1 + 120) removeObjectForKey:v5];
      }
      ((void (**)(void, void *, id))v7)[2](v7, v14, v15);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }

LABEL_21:
}

- (id)limitationsForInstance:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (limitationsForInstance_error__permanentError)
  {
    uint64_t v7 = 0;
    if (a4) {
      *a4 = (id) limitationsForInstance_error__permanentError;
    }
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_limitationsForInstance_error_, v6, 0);
    id v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    qos_class_t v9 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v10 = objc_opt_class();
    id v14 = 0;
    uint64_t v7 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    id v11 = v14;

    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      if (objc_msgSend(v11, "rbs_isPermanentFailure")) {
        id v12 = v11;
      }
      else {
        id v12 = (void *)limitationsForInstance_error__permanentError;
      }
      objc_storeStrong((id *)&limitationsForInstance_error__permanentError, v12);
    }
  }
  return v7;
}

- (id)hostProcessForInstance:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (hostProcessForInstance_error__permanentError)
  {
    uint64_t v7 = 0;
    if (a4) {
      *a4 = (id) hostProcessForInstance_error__permanentError;
    }
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_hostProcessForInstance_error_, v6, 0);
    id v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    qos_class_t v9 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v10 = objc_opt_class();
    id v14 = 0;
    uint64_t v7 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    id v11 = v14;

    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      if (objc_msgSend(v11, "rbs_isPermanentFailure")) {
        id v12 = v11;
      }
      else {
        id v12 = (void *)hostProcessForInstance_error__permanentError;
      }
      objc_storeStrong((id *)&hostProcessForInstance_error__permanentError, v12);
    }
  }
  return v7;
}

void __27__RBSConnection__handshake__block_invoke_249(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "invalidateAssertionWithIdentifier:error:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)registerServiceDelegate:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__RBSConnection_registerServiceDelegate___block_invoke;
    block[3] = &unk_1E5741488;
    void block[4] = a1;
    long long v8 = sel_registerServiceDelegate_;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

- (void)observeProcessAssertionsExpirationWarningWithBlock:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = (os_unfair_lock_s *)(a1 + 48);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    uint64_t v5 = [_RBSExpirationWarningClient alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__RBSConnection_observeProcessAssertionsExpirationWarningWithBlock___block_invoke;
    v9[3] = &unk_1E57414B0;
    v9[4] = a1;
    uint64_t v6 = -[_RBSExpirationWarningClient initWithBlock:invalidationBlock:](v5, v4, v9);

    [*(id *)(a1 + 112) addObject:v6];
    os_unfair_lock_unlock(v3);
    id v7 = rbs_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_191FE8000, v7, OS_LOG_TYPE_DEFAULT, "Added observer for process assertions expiration warning: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

void __41__RBSConnection_registerServiceDelegate___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 32), *(void *)(a1 + 40));

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 32), *(id *)(a1 + 40));
  id v4 = (id)[*(id *)(*(void *)(a1 + 32) + 104) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if ([v4 count]) {
    [*(id *)(a1 + 40) didReceiveInheritances:v4];
  }
}

uint64_t __27__RBSConnection__handshake__block_invoke_250(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        [(RBSProcessMonitor *)*(void **)(*((void *)&v11 + 1) + 8 * v7++) _reconnect];
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__RBSConnection__handshake__block_invoke_2_251;
  v10[3] = &unk_1E5741630;
  long long v8 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 48);
  return [v8 enumerateKeysAndObjectsUsingBlock:v10];
}

- (void)acquireAssertion:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_191FE8000, v0, v1, "Adding assertion %{public}@ to dictionary", v2, v3, v4, v5, v6);
}

+ (id)testConnectionWithConnection:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSConnection _initWithConnection:]([RBSConnection alloc], v3);

  return v4;
}

+ (void)setInDaemon
{
  inRunningBoardDaemon = 1;
}

- (RBSConnection)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSConnection.m" lineNumber:197 description:@"cannot call -init on RBSConnection"];

  return 0;
}

- (void)dealloc
{
  xpc_connection_cancel(self->_connection);
  v3.receiver = self;
  v3.super_class = (Class)RBSConnection;
  [(RBSConnection *)&v3 dealloc];
}

- (id)managedEndpointByLaunchIdentifier
{
  if (a1)
  {
    uint64_t v5 = 0;
    uint8_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    long long v8 = __Block_byref_object_copy__1;
    long long v9 = __Block_byref_object_dispose__1;
    id v10 = 0;
    uint64_t v1 = *(NSObject **)(a1 + 64);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__RBSConnection_managedEndpointByLaunchIdentifier__block_invoke;
    v4[3] = &unk_1E5741460;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_async_and_wait(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void __50__RBSConnection_managedEndpointByLaunchIdentifier__block_invoke(uint64_t a1)
{
}

void __68__RBSConnection_observeProcessAssertionsExpirationWarningWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  id v4 = rbs_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_191FE8000, v4, OS_LOG_TYPE_DEFAULT, "Removed observer for process assertions expiration warning: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 112) removeObject:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
}

- (id)assertionDescriptorsByPidWithFlattenedAttributes:(BOOL)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError)
  {
    id v6 = 0;
    if (a4) {
      *a4 = (id) assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError;
    }
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithBool:a3];
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_assertionDescriptorsWithFlattenedAttributes_error_, v7, 0);
    long long v8 = (SEL *)objc_claimAutoreleasedReturnValue();

    long long v9 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v31 = 0;
    id v26 = v8;
    long long v12 = -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v8, v9, v10, v11, &v31);
    id v13 = v31;

    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
      if (objc_msgSend(v13, "rbs_isPermanentFailure")) {
        long long v14 = v13;
      }
      else {
        long long v14 = (void *)assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError;
      }
      objc_storeStrong((id *)&assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError, v14);
    }
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v12;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v21 = NSNumber;
          uint64_t v22 = [v20 identifier];
          uint64_t v23 = objc_msgSend(v21, "numberWithInt:", objc_msgSend(v22, "clientPid"));

          int v24 = [v6 objectForKey:v23];
          if (!v24)
          {
            int v24 = [MEMORY[0x1E4F1CA80] set];
            [v6 setObject:v24 forKey:v23];
          }
          [v24 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v17);
    }
  }
  return v6;
}

- (BOOL)executeTerminateRequest:(id)a3 assertion:(id *)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v9 = (__CFString *)a3;
  if (executeTerminateRequest_assertion_error__permanentError)
  {
    LOBYTE(v10) = 0;
    if (a5) {
      *a5 = (id) executeTerminateRequest_assertion_error__permanentError;
    }
  }
  else
  {
    uint64_t v11 = rbs_general_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v37 = v9;
      _os_log_impl(&dword_191FE8000, v11, OS_LOG_TYPE_INFO, "Sending terminate request: %{public}@", buf, 0xCu);
    }

    id v34 = [(__CFString *)v9 context];
    long long v12 = [v34 attributes];
    uint64_t v13 = [v12 count];

    uint64_t v33 = a4;
    if (!a4 && v13)
    {
      long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"RBSConnection.m" lineNumber:414 description:@"Cannot attempt to create a prevent launch assertion if the client will not retain the assertion"];
    }
    id v15 = +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_executeTerminateRequest_identifier_error_, v9, 0);
    uint64_t v16 = -[RBSConnection _connection]((uint64_t)self);
    id v35 = 0;
    uint64_t v17 = [v15 sendToConnection:v16 error:&v35];
    id obj = v35;
    uint64_t v18 = (__CFString *)v35;

    int v10 = [v17 decodeBoolForKey:@"return-value"];
    uint64_t v19 = rbs_general_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = @"Success";
      if (!v10) {
        id v20 = v18;
      }
      *(_DWORD *)buf = 138543362;
      id v37 = v20;
      _os_log_impl(&dword_191FE8000, v19, OS_LOG_TYPE_INFO, "Received terminate request response: <%{public}@>", buf, 0xCu);
    }

    uint64_t v21 = [v17 decodeObjectOfClass:objc_opt_class() forKey:@"assertion-identifier"];
    if (v21)
    {
      long long v29 = v18;
      long long v30 = v17;
      id v31 = v15;
      uint64_t v22 = +[RBSTarget systemTarget];
      uint64_t v23 = [v34 explanation];
      int v24 = [v34 attributes];
      id v25 = +[RBSAssertionDescriptor descriptorWithIdentifier:v21 target:v22 explanation:v23 attributes:v24];

      id v26 = [[RBSAssertion alloc] _initWithServerValidatedDescriptor:v25];
      long long v27 = rbs_assertion_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[RBSConnection acquireAssertion:error:]();
      }

      os_unfair_lock_lock(&self->_assertionLock);
      [(NSMapTable *)self->_acquiredAssertionsByIdentifier setObject:v26 forKey:v21];
      os_unfair_lock_unlock(&self->_assertionLock);
      if (v33) {
        *uint64_t v33 = v26;
      }

      uint64_t v17 = v30;
      id v15 = v31;
      uint64_t v18 = v29;
    }
    if ([(__CFString *)v18 rbs_isPermanentFailure]) {
      objc_storeStrong((id *)&executeTerminateRequest_assertion_error__permanentError, obj);
    }
    if (a5) {
      *a5 = v18;
    }
  }
  return v10;
}

void __30__RBSConnection_handleForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x192FECA30]() == MEMORY[0x1E4F145A8])
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
  else
  {
    uint64_t v4 = MEMORY[0x192FECA30](v3);
    if (v4 == MEMORY[0x1E4F14590])
    {
      long long v9 = rbs_connection_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __30__RBSConnection_handleForKey___block_invoke_cold_1();
      }

      xpc_dictionary_apply(v3, &__block_literal_global_116);
    }
    else
    {
      uint64_t v5 = v4;
      uint64_t v6 = MEMORY[0x1E4F14578];
      uint64_t v7 = rbs_connection_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_FAULT);
      if (v5 == v6)
      {
        if (v8) {
          __30__RBSConnection_handleForKey___block_invoke_cold_2();
        }
      }
      else if (v8)
      {
        __30__RBSConnection_handleForKey___block_invoke_cold_3();
      }
    }
  }
}

uint64_t __30__RBSConnection_handleForKey___block_invoke_113(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = rbs_connection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_191FE8000, v5, OS_LOG_TYPE_DEFAULT, "errant message dictionary key:'%s' value:%@", (uint8_t *)&v7, 0x16u);
  }

  return 1;
}

- (id)portForIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = rbs_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v4;
    _os_log_impl(&dword_191FE8000, v5, OS_LOG_TYPE_INFO, "Fetching port for identifier: %{public}@", buf, 0xCu);
  }

  uint64_t v6 = +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lookupPortForIdentifier_error_, v4, 0);
  int v7 = -[RBSConnection _connection]((uint64_t)self);
  id v14 = 0;
  uint64_t v8 = [v6 sendToConnection:v7 error:&v14];
  id v9 = v14;

  id v10 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"return-value"];
  uint64_t v11 = rbs_general_log();
  long long v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[RBSConnection portForIdentifier:]();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v10;
    _os_log_impl(&dword_191FE8000, v12, OS_LOG_TYPE_INFO, "Received port for identifier response: <%{public}@>", buf, 0xCu);
  }

  return v10;
}

void __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)subscribeToProcessDeath_handler__processDeathQueue;
  dispatch_qos_class_t v8 = *(_DWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_3;
  v12[3] = &unk_1E5741380;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  RBSDispatchAsyncWithQoS(v7, v8, v12);
}

uint64_t __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)intendToExit:(id)a3 withStatus:(id)a4
{
  id v6 = a3;
  int v7 = +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_void_intendToExit_withStatus_, v6, a4, 0);
  dispatch_qos_class_t v8 = -[RBSConnection _connection]((uint64_t)self);
  id v12 = 0;
  id v9 = (id)[v7 sendToConnection:v8 error:&v12];
  id v10 = v12;

  if (v10)
  {
    id v11 = rbs_process_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RBSConnection intendToExit:withStatus:]();
    }
  }
}

- (id)lastExitContextForInstance:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (lastExitContextForInstance_error__permanentError)
  {
    int v7 = 0;
    if (a4) {
      *a4 = (id) lastExitContextForInstance_error__permanentError;
    }
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lastExitContextForInstance_error_, v6, 0);
    dispatch_qos_class_t v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    id v9 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v10 = objc_opt_class();
    id v14 = 0;
    int v7 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    id v11 = v14;

    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      if (objc_msgSend(v11, "rbs_isPermanentFailure")) {
        id v12 = v11;
      }
      else {
        id v12 = (void *)lastExitContextForInstance_error__permanentError;
      }
      objc_storeStrong((id *)&lastExitContextForInstance_error__permanentError, v12);
    }
  }
  return v7;
}

- (id)captureStateForSubsystem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (captureStateForSubsystem_error__permanentError)
  {
    int v7 = 0;
    if (a4) {
      *a4 = (id) captureStateForSubsystem_error__permanentError;
    }
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_captureStateForSubsystem_error_, v6, 0);
    dispatch_qos_class_t v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    id v9 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v10 = objc_opt_class();
    id v14 = 0;
    int v7 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    id v11 = v14;

    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      if (objc_msgSend(v11, "rbs_isPermanentFailure")) {
        id v12 = v11;
      }
      else {
        id v12 = (void *)captureStateForSubsystem_error__permanentError;
      }
      objc_storeStrong((id *)&captureStateForSubsystem_error__permanentError, v12);
    }
  }
  return v7;
}

- (id)identifiersForStateCaptureSubsystems:(id *)a3
{
  if (identifiersForStateCaptureSubsystems__permanentError)
  {
    id v5 = 0;
    if (a3) {
      *a3 = (id) identifiersForStateCaptureSubsystems__permanentError;
    }
  }
  else
  {
    id v6 = +[RBSXPCMessage messageForMethod:sel_identifiersForStateCaptureSubsystemsWithError_ varguments:0];
    int v7 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v13 = 0;
    id v5 = -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v6, v7, v8, v9, &v13);
    id v10 = v13;

    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      if (objc_msgSend(v10, "rbs_isPermanentFailure")) {
        id v11 = v10;
      }
      else {
        id v11 = (void *)identifiersForStateCaptureSubsystems__permanentError;
      }
      objc_storeStrong((id *)&identifiersForStateCaptureSubsystems__permanentError, v11);
    }
  }
  return v5;
}

- (id)busyExtensionInstancesFromSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (busyExtensionInstancesFromSet_error__permanentError)
  {
    int v7 = 0;
    if (a4) {
      *a4 = (id) busyExtensionInstancesFromSet_error__permanentError;
    }
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_busyExtensionInstancesFromSet_error_, v6, 0);
    uint64_t v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v15 = 0;
    int v7 = -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v8, v9, v10, v11, &v15);
    id v12 = v15;

    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      if (objc_msgSend(v12, "rbs_isPermanentFailure")) {
        id v13 = v12;
      }
      else {
        id v13 = (void *)busyExtensionInstancesFromSet_error__permanentError;
      }
      objc_storeStrong((id *)&busyExtensionInstancesFromSet_error__permanentError, v13);
    }
  }
  return v7;
}

- (id)preventLaunchPredicatesWithError:(id *)a3
{
  if (preventLaunchPredicatesWithError__permanentError)
  {
    id v5 = 0;
    if (a3) {
      *a3 = (id) preventLaunchPredicatesWithError__permanentError;
    }
  }
  else
  {
    id v6 = +[RBSXPCMessage messageForMethod:sel_preventLaunchPredicatesWithError_ varguments:0];
    int v7 = -[RBSConnection _connection]((uint64_t)self);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v13 = 0;
    id v5 = -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v6, v7, v8, v9, &v13);
    id v10 = v13;

    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      if (objc_msgSend(v10, "rbs_isPermanentFailure")) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = (void *)preventLaunchPredicatesWithError__permanentError;
      }
      objc_storeStrong((id *)&preventLaunchPredicatesWithError__permanentError, v11);
    }
  }
  return v5;
}

- (void)reset
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  id v4 = "-[RBSConnection reset]";
  OUTLINED_FUNCTION_6(&dword_191FE8000, a1, a3, "%s no longer does anything", (uint8_t *)&v3);
}

- (BOOL)saveEndowment:(id)a3 withError:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"RBSConnection.m", 901, @"Invalid parameter not satisfying: %@", @"savedEndowment" object file lineNumber description];
  }
  if (saveEndowment_withError__permanentError)
  {
    LOBYTE(v8) = 0;
    if (a4) {
      *a4 = (id) saveEndowment_withError__permanentError;
    }
  }
  else
  {
    uint64_t v9 = -[RBSConnection _connection]((uint64_t)self);
    os_unfair_lock_lock(&self->_savedEndowmentLock);
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_saveEndowment_withError_, v7, 0);
    id v10 = (SEL *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_opt_class();
    id v17 = 0;
    id v12 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v10, v9, v11, &v17);
    id v13 = v17;
    id v14 = v17;

    if (objc_msgSend(v14, "rbs_isPermanentFailure")) {
      objc_storeStrong((id *)&saveEndowment_withError__permanentError, v13);
    }
    if (a4) {
      *a4 = v14;
    }
    int v8 = [v12 BOOLValue];
    if (v8) {
      [(NSMutableArray *)self->_savedEndowments addObject:v7];
    }
    os_unfair_lock_unlock(&self->_savedEndowmentLock);
  }
  return v8;
}

- (void)async_willExpireAssertionsSoon
{
  int v3 = rbs_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191FE8000, v3, OS_LOG_TYPE_DEFAULT, "Received process assertions expiration warning!", buf, 2u);
  }

  p_processExpirationLock = &self->_processExpirationLock;
  os_unfair_lock_lock(&self->_processExpirationLock);
  uint64_t v5 = (void *)[(NSHashTable *)self->_expirationWarningClients copy];
  os_unfair_lock_unlock(p_processExpirationLock);
  id v6 = rbs_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191FE8000, v6, OS_LOG_TYPE_DEFAULT, "Notifying client of imminent expiration of assertion", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__RBSConnection_async_willExpireAssertionsSoon__block_invoke;
  v8[3] = &unk_1E57413F8;
  id v9 = v5;
  id v7 = v5;
  +[RBSWorkloop performCalloutWithServiceClass:block:]((uint64_t)RBSWorkloop, QOS_CLASS_USER_INITIATED, v8);
}

void __47__RBSConnection_async_willExpireAssertionsSoon__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * v5);
        if (v6) {
          uint64_t v7 = *(void *)(v6 + 8);
        }
        else {
          uint64_t v7 = 0;
        }
        (*(void (**)(void))(v7 + 16))();
        ++v5;
      }
      while (v3 != v5);
      uint64_t v8 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v3 = v8;
    }
    while (v8);
  }

  id v9 = rbs_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_191FE8000, v9, OS_LOG_TYPE_DEFAULT, "Expiration notification complete", v10, 2u);
  }
}

- (void)async_assertionsDidInvalidate:(id)a3 withError:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_lock_lock(&self->_assertionLock);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * v13);
        id v15 = rbs_assertion_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v14;
          _os_log_debug_impl(&dword_191FE8000, v15, OS_LOG_TYPE_DEBUG, "Assertion %{public}@ did invalidate", buf, 0xCu);
        }

        uint64_t v16 = [(NSMapTable *)self->_acquiredAssertionsByIdentifier objectForKey:v14];
        id v17 = rbs_assertion_log();
        uint64_t v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v34 = v14;
            _os_log_debug_impl(&dword_191FE8000, v18, OS_LOG_TYPE_DEBUG, "Removing assertion %{public}@ from dictionary", buf, 0xCu);
          }

          [(NSMapTable *)self->_acquiredAssertionsByIdentifier removeObjectForKey:v14];
          [v8 addObject:v16];
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v34 = v14;
            _os_log_impl(&dword_191FE8000, v18, OS_LOG_TYPE_INFO, "Client is not tracking assertion %{public}@", buf, 0xCu);
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_assertionLock);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = v8;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) _serverInvalidateWithError:v7];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v21);
  }
}

- (void)async_assertionWillInvalidate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = rbs_assertion_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RBSConnection async_assertionWillInvalidate:]();
  }

  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  id v7 = [(NSMapTable *)self->_acquiredAssertionsByIdentifier objectForKey:v4];
  os_unfair_lock_unlock(p_assertionLock);
  -[RBSAssertion _serverWillInvalidate]((uint64_t)v7);
}

- (void)async_observedProcessExitEvents:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v16 = (void (**)(void))a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = [(NSHashTable *)self->_processMonitors allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "calloutQueue", v16);
        dispatch_qos_class_t v15 = [v13 serviceClass];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __60__RBSConnection_async_observedProcessExitEvents_completion___block_invoke;
        v18[3] = &unk_1E57413D0;
        id v19 = v6;
        uint64_t v20 = v13;
        RBSDispatchAsyncWithQoS(v14, v15, v18);
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  v16[2](v16);
}

void __60__RBSConnection_async_observedProcessExitEvents_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_handleExitEvent:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)async_observedPreventLaunchPredicatesUpdate:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSSet *)a3;
  long long v7 = (void (**)(void))a4;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preventLaunchPredicates = self->_preventLaunchPredicates;
  if (v6 == preventLaunchPredicates || v6 && preventLaunchPredicates && -[NSSet isEqual:](v6, "isEqual:"))
  {
    os_unfair_lock_unlock(&self->_lock);
    v7[2](v7);
  }
  else
  {
    uint64_t v18 = v7;
    objc_storeStrong((id *)&self->_preventLaunchPredicates, v6);
    long long v10 = [(NSHashTable *)self->_processMonitors allObjects];
    os_unfair_lock_unlock(p_lock);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(obj);
          }
          dispatch_qos_class_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "calloutQueue", v18);
          dispatch_qos_class_t v17 = [v15 serviceClass];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __72__RBSConnection_async_observedPreventLaunchPredicatesUpdate_completion___block_invoke;
          v20[3] = &unk_1E57413D0;
          void v20[4] = v15;
          long long v21 = v6;
          RBSDispatchAsyncWithQoS(v16, v17, v20);
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    long long v7 = v18;
    v18[2](v18);
  }
}

uint64_t __72__RBSConnection_async_observedPreventLaunchPredicatesUpdate_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePreventLaunchUpdate:*(void *)(a1 + 40)];
}

- (void)async_processDidExit:(id)a3 withContext:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = rbs_process_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v6;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl(&dword_191FE8000, v8, OS_LOG_TYPE_DEFAULT, "Firing exit handlers for %{public}@ with context %{public}@", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  long long v9 = [(NSMutableDictionary *)self->_deathHandlers objectForKey:v6];
  long long v10 = (void *)[v9 copy];

  [(NSMutableDictionary *)self->_deathHandlers removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * v15));
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

uint64_t __32__RBSConnection__handleMessage___block_invoke_206(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "async_willExpireAssertionsSoon");
}

void __32__RBSConnection__handleMessage___block_invoke_2_209(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id obj = 0;
  uint64_t v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = rbs_connection_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_209_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_assertionWillInvalidate:", v5);
  }
}

void __32__RBSConnection__handleMessage___block_invoke_212(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id obj = 0;
  id v6 = [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v5, obj);
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = objc_opt_class();
  long long v9 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v12 = 0;
  long long v10 = [v7 decodeArgumentWithClass:v8 atIndex:1 allowNil:0 error:&v12];
  objc_storeStrong(v9, v12);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v11 = rbs_connection_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_209_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_assertionsDidInvalidate:withError:", v6, v10);
  }
}

void __32__RBSConnection__handleMessage___block_invoke_218(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v6 = [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v5, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v7 = rbs_connection_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_observedProcessExitEvents:completion:", v6, *(void *)(a1 + 48));
  }
}

void __32__RBSConnection__handleMessage___block_invoke_222(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v6 = [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:1 error:&obj];
  objc_storeStrong(v5, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v7 = rbs_connection_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_observedPreventLaunchPredicatesUpdate:completion:", v6, *(void *)(a1 + 48));
  }
}

void __32__RBSConnection__handleMessage___block_invoke_225(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id obj = 0;
  uint64_t v5 = [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  objc_storeStrong(v4, obj);
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v11 = 0;
  long long v9 = [v6 decodeArgumentWithClass:v7 atIndex:1 allowNil:0 error:&v11];
  objc_storeStrong(v8, v11);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v10 = rbs_connection_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_209_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_processDidExit:withContext:", v5, v9);
  }
}

- (void)_disconnect
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    uint64_t v3 = *(_xpc_connection_s **)(a1 + 8);
    if (v3)
    {
      xpc_connection_set_event_handler(v3, &__block_literal_global_260);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 8));
      uint64_t v4 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0;

      uint64_t v5 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
    }
    *(void *)(a1 + 144) = 3;
    os_unfair_lock_unlock(v2);
  }
}

void __27__RBSConnection__handshake__block_invoke_245(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v5];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __27__RBSConnection__handshake__block_invoke_2;
    uint64_t v15 = &unk_1E57413D0;
    long long v9 = v7;
    long long v16 = v9;
    id v10 = v6;
    id v17 = v10;
    +[RBSWorkloop performBackgroundWork:&v12];
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v10, v12, v13, v14, v15);

    id v11 = v16;
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v6];
    id v11 = rbs_connection_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __27__RBSConnection__handshake__block_invoke_245_cold_1();
    }
  }
}

void __27__RBSConnection__handshake__block_invoke_2(uint64_t a1)
{
}

void __27__RBSConnection__handshake__block_invoke_247(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = rbs_connection_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_191FE8000, v7, OS_LOG_TYPE_DEFAULT, "Failed to reconnect assertion %{public}@ with error <%{public}@>", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v5];
  [v8 _serverInvalidateWithError:v6];
}

void __27__RBSConnection__handshake__block_invoke_2_251(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[RBSConnection _subscribeToProcessDeath:handler:](*(void *)(a1 + 32), v5, *(void **)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)isIdentityAnAngel:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (isIdentityAnAngel_withError__permanentError)
  {
    char v7 = 0;
    if (a4) {
      *a4 = (id) isIdentityAnAngel_withError__permanentError;
    }
  }
  else
  {
    uint64_t v8 = -[RBSConnection _connection]((uint64_t)self);
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_isIdentityAnAngel_withError_, v6, 0);
    uint64_t v9 = (SEL *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    id v15 = 0;
    long long v11 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v9, v8, v10, &v15);
    id v12 = v15;
    id v13 = v15;

    if (objc_msgSend(v13, "rbs_isPermanentFailure")) {
      objc_storeStrong((id *)&isIdentityAnAngel_withError__permanentError, v12);
    }
    if (a4) {
      *a4 = v13;
    }
    char v7 = [v11 BOOLValue];
  }
  return v7;
}

- (void)_handleDaemonDidStart
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (*(void *)(a1 + 144) == 3)
    {
      uint64_t v3 = rbs_connection_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_191FE8000, v3, OS_LOG_TYPE_DEFAULT, "runningboardd is back; connection can be restored",
          v4,
          2u);
      }

      *(void *)(a1 + 144) = 0;
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_deathHandlers, 0);
  objc_storeStrong((id *)&self->_expirationWarningClients, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
  objc_storeStrong((id *)&self->_preventLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_stateByIdentity, 0);
  objc_storeStrong((id *)&self->_processMonitors, 0);
  objc_storeStrong((id *)&self->_acquiredAssertionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_handshakeQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceDelegate, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_handleConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)acquireAssertion:(os_log_t)log error:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "XPC failed, retrying assertion acquisition", buf, 2u);
}

- (void)_lock_connect
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_191FE8000, v0, v1, "The sandbox in this process does not allow access to RunningBoard.", v2, v3, v4, v5, v6);
}

void __30__RBSConnection_handleForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10(&dword_191FE8000, v0, v1, "This connection is not supposed to receive any messages, got dictionary: %{public}@", v2, v3, v4, v5, v6);
}

void __30__RBSConnection_handleForKey___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10(&dword_191FE8000, v0, v1, "This connection is not supposed to receive any messages, got connection: %{public}@", v2, v3, v4, v5, v6);
}

void __30__RBSConnection_handleForKey___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10(&dword_191FE8000, v0, v1, "This connection is not supposed to receive any messages got unknown: %{public}@", v2, v3, v4, v5, v6);
}

- (void)processName:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_191FE8000, v0, v1, "Could not get process name: <%{public}@>", v2);
}

- (void)portForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13(&dword_191FE8000, v0, v1, "Received port for identifier response: <%{public}@> with error:%{public}@");
}

- (void)_subscribeToProcessDeath:handler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_191FE8000, v0, v1, "Error subscribing to death of process %{public}@: <%{public}@>");
}

- (void)intendToExit:withStatus:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_191FE8000, v0, v1, "Could not set intended exit for %{public}@ because %{public}@");
}

- (void)async_didChangeInheritances:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_191FE8000, v0, v1, "didChangeInheritances: %{public}@", v2, v3, v4, v5, v6);
}

- (void)async_assertionWillInvalidate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_191FE8000, v0, v1, "Assertion %{public}@ will invalidate", v2, v3, v4, v5, v6);
}

- (void)async_observedProcessStatesDidChange:completion:.cold.1()
{
  __assert_rtn("-[RBSConnection async_observedProcessStatesDidChange:completion:]", "RBSConnection.m", 1022, "identity != nil");
}

- (void)_handleMessage:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_191FE8000, a3, (uint64_t)a3, "*** Unhandled message from server: %{public}@", (uint8_t *)a2);
}

- (void)_handleMessage:(NSObject *)a3 .cold.2(uint64_t a1, SEL aSelector, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = NSStringFromSelector(aSelector);
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_191FE8000, a3, OS_LOG_TYPE_DEBUG, "PERF: %{public}@ Received message from runningboardd: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_handleMessage:(const char *)a1 .cold.3(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_191FE8000, a2, v4, "Dropping message from server: The client is missing an implementation for %{public}@", v5);
}

- (void)_handleMessage:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_191FE8000, v0, v1, "Dropping message from server that does not conform to expectations", v2, v3, v4, v5, v6);
}

void __32__RBSConnection__handleMessage___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_11(v1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_191FE8000, v3, v4, "decodeArgumentsWithClass failed for method %{public}@ with error %{public}@", v5, v6, v7, v8, v9);
}

void __32__RBSConnection__handleMessage___block_invoke_2_209_cold_1()
{
  OUTLINED_FUNCTION_9();
  NSStringFromSelector(*(SEL *)(v1 + 56));
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_191FE8000, v2, v3, "decodeArgumentsWithClass failed for method %{public}@ with error %{public}@", v4, v5, v6, v7, v8);
}

void __37__RBSConnection__lock_setConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_191FE8000, v0, v1, "Connection interrupted: will attempt to reconnect", v2, v3, v4, v5, v6);
}

void __37__RBSConnection__lock_setConnection___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_191FE8000, v0, v1, "Connection invalidated!", v2, v3, v4, v5, v6);
}

void __27__RBSConnection__handshake__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 136);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_13(&dword_191FE8000, a2, a3, "managedEndpointByLaunchIdentifier mismatch : previous=%{public}@ new=%{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __27__RBSConnection__handshake__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __27__RBSConnection__handshake__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_191FE8000, v0, v1, "attempted handshake from xpc service with no host process, aborting", v2, v3, v4, v5, v6);
}

void __27__RBSConnection__handshake__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_9();
  uint64_t v3 = v2;
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(v3 + 64), *v1, @"RBSConnection.m", 1413, @"BUG IN RUNNINGBOARD %d RunningBoard handshakes failed", v0);

  abort();
}

void __27__RBSConnection__handshake__block_invoke_cold_5(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "Handshake aborted as the connection has been invalidated", buf, 2u);
}

void __27__RBSConnection__handshake__block_invoke_245_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_191FE8000, v0, v1, "No old assertion found for %{public}@; new assertion %{public}@ will be invalidated");
}

@end