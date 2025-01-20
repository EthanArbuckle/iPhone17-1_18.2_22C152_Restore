@interface MSNScopedExceptionsServer
+ (id)proxiesForException:(id)a3;
+ (id)proxyForMachServiceName:(id)a3;
+ (id)sharedCamProxy;
+ (id)sharedMicProxy;
+ (id)sharedProxy;
+ (id)validEntitlements;
+ (id)validExceptions;
- (BOOL)isConnectionAllowedToAssertException:(id)a3;
- (BOOL)isExceptionInEffect:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MSNScopedExceptionsServer)initWithQueue:(id)a3;
- (void)beginException:(id)a3;
- (void)endException:(id)a3;
@end

@implementation MSNScopedExceptionsServer

- (MSNScopedExceptionsServer)initWithQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSNScopedExceptionsServer;
  v6 = [(MSNScopedExceptionsServer *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    activeExceptions = v6->_activeExceptions;
    v6->_activeExceptions = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    if (g_serverMode == 2)
    {
      v9 = [@"com.apple.mediasafetynet.exceptions" stringByAppendingString:@".cam"];
    }
    else
    {
      v9 = @"com.apple.mediasafetynet.exceptions";
    }
    v10 = MSNLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[MSNScopedExceptionsServer initWithQueue:]((uint64_t)v9, v10);
    }

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v9];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v11;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    [(NSXPCListener *)v6->_listener resume];
  }
  return v6;
}

+ (id)validEntitlements
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MSNScopedExceptionsServer_validEntitlements__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (validEntitlements_onceToken != -1) {
    dispatch_once(&validEntitlements_onceToken, block);
  }
  v2 = (void *)validEntitlements_validEntitlements;

  return v2;
}

void __46__MSNScopedExceptionsServer_validEntitlements__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(*(id *)(a1 + 32), "validExceptions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [@"com.apple.private.mediasafetynet.exception." stringByAppendingString:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [v2 copy];
  v10 = (void *)validEntitlements_validEntitlements;
  validEntitlements_validEntitlements = v9;
}

+ (id)validExceptions
{
  if (validExceptions_onceToken != -1) {
    dispatch_once(&validExceptions_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)validExceptions_validExceptions;

  return v2;
}

void __44__MSNScopedExceptionsServer_validExceptions__block_invoke()
{
  v4[13] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"announcemessage";
  v4[1] = @"notificationappex";
  v4[2] = @"xctest";
  v4[3] = @"emergency";
  v4[4] = @"audiotesting";
  v4[5] = @"mediacontrol";
  v4[6] = @"shazam";
  v4[7] = @"keyboardcamera";
  v4[8] = @"callsam";
  v4[9] = @"magnifierangel";
  v4[10] = @"findingui";
  v4[11] = @"callbanner";
  v4[12] = @"continuitycapture";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:13];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)validExceptions_validExceptions;
  validExceptions_validExceptions = v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = +[MSNScopedExceptionsServer validEntitlements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [v5 valueForEntitlement:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        char v12 = [v11 BOOLValue];

        if (v12)
        {

          long long v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F37C5D28];
          [v5 setExportedInterface:v14];

          [v5 setExportedObject:self];
          uint64_t v18 = MEMORY[0x1E4F143A8];
          uint64_t v19 = 3221225472;
          v20 = __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke;
          v21 = &unk_1E6CA0180;
          v22 = self;
          id v15 = v5;
          id v23 = v15;
          uint64_t v16 = (void *)MEMORY[0x1E01A2850](&v18);
          objc_msgSend(v15, "setInterruptionHandler:", v16, v18, v19, v20, v21, v22);
          [v15 setInvalidationHandler:v16];
          [v15 resume];

          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

void __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke_77;
  v5[3] = &unk_1E6CA0180;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

void __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke_77(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138543618;
    long long v15 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "connection", v15, (void)v16);
        long long v11 = *(void **)(a1 + 40);

        if (v10 == v11)
        {
          char v12 = MSNLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            BOOL v13 = [v9 exception];
            int v14 = [*(id *)(a1 + 40) processIdentifier];
            *(_DWORD *)buf = v15;
            v21 = v13;
            __int16 v22 = 1024;
            int v23 = v14;
            _os_log_impl(&dword_1DC736000, v12, OS_LOG_TYPE_INFO, "Expiring exception %{public}@ from pid %i due to invalidation.", buf, 0x12u);
          }
          [v2 addObject:v9];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectsInArray:v2];
}

- (BOOL)isConnectionAllowedToAssertException:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v4 = [MEMORY[0x1E4F29268] currentConnection];
    long long v5 = [@"com.apple.private.mediasafetynet.exception." stringByAppendingString:v3];
    uint64_t v6 = [v4 valueForEntitlement:v5];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)beginException:(id)a3
{
  id v4 = a3;
  long long v5 = [MEMORY[0x1E4F29268] currentConnection];
  if ([(MSNScopedExceptionsServer *)self isConnectionAllowedToAssertException:v4])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__MSNScopedExceptionsServer_beginException___block_invoke;
    block[3] = &unk_1E6CA0248;
    id v15 = v4;
    id v16 = v5;
    long long v17 = self;
    dispatch_async(queue, block);
  }
  else
  {
    char v7 = MSNLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MSNScopedExceptionsServer beginException:]((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }

    [v5 invalidate];
  }
}

void __44__MSNScopedExceptionsServer_beginException___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) processIdentifier];
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_INFO, "Beginning exception %{public}@ from pid %i.", (uint8_t *)&v7, 0x12u);
  }

  long long v5 = *(void **)(*(void *)(a1 + 48) + 16);
  uint64_t v6 = [[MSNScopedException alloc] initWithConnection:*(void *)(a1 + 40) exception:*(void *)(a1 + 32)];
  [v5 addObject:v6];
}

- (void)endException:(id)a3
{
  id v4 = a3;
  long long v5 = [MEMORY[0x1E4F29268] currentConnection];
  if ([(MSNScopedExceptionsServer *)self isConnectionAllowedToAssertException:v4])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__MSNScopedExceptionsServer_endException___block_invoke;
    block[3] = &unk_1E6CA0248;
    void block[4] = self;
    id v9 = v5;
    id v10 = v4;
    dispatch_async(queue, block);
  }
  else
  {
    int v7 = MSNLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MSNScopedExceptionsServer endException:]((uint64_t)v4, v5);
    }

    [v5 invalidate];
  }
}

uint64_t __42__MSNScopedExceptionsServer_endException___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 16) count]) {
    goto LABEL_9;
  }
  unint64_t v2 = 0;
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:v2];
    long long v5 = [v4 connection];
    uint64_t v6 = v5;
    if (v5 == *(void **)(a1 + 40))
    {
      int v7 = [v4 exception];
      int v8 = [v7 isEqual:*(void *)(a1 + 48)];

      if (v8) {
        uint64_t v3 = v2;
      }
    }
    else
    {
    }
    ++v2;
  }
  while (v2 < [*(id *)(*(void *)(a1 + 32) + 16) count]);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = MSNLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = [*(id *)(a1 + 40) processIdentifier];
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 1024;
      int v17 = v13;
      _os_log_impl(&dword_1DC736000, v11, OS_LOG_TYPE_INFO, "Ending exception %{public}@ from pid %i.", (uint8_t *)&v14, 0x12u);
    }

    return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectAtIndex:v3];
  }
  else
  {
LABEL_9:
    id v9 = MSNLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __42__MSNScopedExceptionsServer_endException___block_invoke_cold_1(a1);
    }

    return [*(id *)(a1 + 40) invalidate];
  }
}

- (BOOL)isExceptionInEffect:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v5 = self->_activeExceptions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "exception", (void)v15);
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          int v13 = MSNLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v20 = v4;
            _os_log_impl(&dword_1DC736000, v13, OS_LOG_TYPE_INFO, "Found exception %{public}@", buf, 0xCu);
          }

          BOOL v12 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  MSNLog();
  long long v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEBUG)) {
    -[MSNScopedExceptionsServer isExceptionInEffect:]((uint64_t)v4, &v5->super.super);
  }
  BOOL v12 = 0;
LABEL_15:

  return v12;
}

+ (id)proxyForMachServiceName:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v3 options:0];
  long long v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F37C5D28];
  [v4 setRemoteObjectInterface:v5];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__MSNScopedExceptionsServer_proxyForMachServiceName___block_invoke;
  v15[3] = &unk_1E6CA01D0;
  id v6 = v3;
  id v16 = v6;
  [v4 setInterruptionHandler:v15];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  BOOL v12 = __53__MSNScopedExceptionsServer_proxyForMachServiceName___block_invoke_82;
  int v13 = &unk_1E6CA01D0;
  id v14 = v6;
  id v7 = v6;
  [v4 setInvalidationHandler:&v10];
  objc_msgSend(v4, "resume", v10, v11, v12, v13);
  uint64_t v8 = [v4 remoteObjectProxy];

  return v8;
}

void __53__MSNScopedExceptionsServer_proxyForMachServiceName___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_INFO, "Interrupted (%@): If this happens at connection-time or when setting an exception, a required entitlement is likely missing.", (uint8_t *)&v4, 0xCu);
  }
}

void __53__MSNScopedExceptionsServer_proxyForMachServiceName___block_invoke_82(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_INFO, "Invalidated (%@).", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)sharedProxy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MSNScopedExceptionsServer_sharedProxy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedProxy_onceToken != -1) {
    dispatch_once(&sharedProxy_onceToken, block);
  }
  unint64_t v2 = (void *)sharedProxy_sharedProxy;

  return v2;
}

uint64_t __40__MSNScopedExceptionsServer_sharedProxy__block_invoke(uint64_t a1)
{
  sharedProxy_sharedProxy = [*(id *)(a1 + 32) proxyForMachServiceName:@"com.apple.mediasafetynet.exceptions"];

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedMicProxy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MSNScopedExceptionsServer_sharedMicProxy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedMicProxy_onceToken != -1) {
    dispatch_once(&sharedMicProxy_onceToken, block);
  }
  unint64_t v2 = (void *)sharedMicProxy_sharedProxy;

  return v2;
}

uint64_t __43__MSNScopedExceptionsServer_sharedMicProxy__block_invoke(uint64_t a1)
{
  sharedMicProxy_sharedProxy = [*(id *)(a1 + 32) proxyForMachServiceName:@"com.apple.mediasafetynet.exceptions"];

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedCamProxy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MSNScopedExceptionsServer_sharedCamProxy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedCamProxy_onceToken != -1) {
    dispatch_once(&sharedCamProxy_onceToken, block);
  }
  unint64_t v2 = (void *)sharedCamProxy_sharedProxy;

  return v2;
}

void __43__MSNScopedExceptionsServer_sharedCamProxy__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  unint64_t v2 = @".cam";
  if ((_os_feature_enabled_impl() & 1) == 0 && !_os_feature_enabled_impl()) {
    unint64_t v2 = &stru_1F37C3948;
  }
  id v5 = [@"com.apple.mediasafetynet.exceptions" stringByAppendingString:v2];
  uint64_t v3 = [v1 proxyForMachServiceName:v5];
  int v4 = (void *)sharedCamProxy_sharedProxy;
  sharedCamProxy_sharedProxy = v3;
}

+ (id)proxiesForException:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl())
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v48[0] = @"announcemessage";
    v48[1] = @"notificationappex";
    v49[0] = &unk_1F37C49F8;
    v49[1] = &unk_1F37C4A10;
    v48[2] = @"xctest";
    v48[3] = @"emergency";
    v49[2] = &unk_1F37C4A28;
    v49[3] = &unk_1F37C4A40;
    v48[4] = @"audiotesting";
    v48[5] = @"shazam";
    v49[4] = &unk_1F37C4A58;
    v49[5] = &unk_1F37C4A70;
    v48[6] = @"mediacontrol";
    v48[7] = @"keyboardcamera";
    v49[6] = &unk_1F37C4A88;
    v49[7] = &unk_1F37C4AA0;
    v48[8] = @"magnifierangel";
    v48[9] = @"findingui";
    v49[8] = &unk_1F37C4AB8;
    v49[9] = &unk_1F37C4AD0;
    v48[10] = @"callbanner";
    v48[11] = @"continuitycapture";
    v49[10] = &unk_1F37C4AE8;
    v49[11] = &unk_1F37C4B00;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:12];
    id v7 = v4;
    uint64_t v8 = [v6 objectForKeyedSubscript:v4];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v41;
      *(void *)&long long v10 = 138412546;
      long long v39 = v10;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
          long long v15 = MSNLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v19 = [v14 integerValue];
            if (v19 >= 3)
            {
              qword_1EAA9AC80 = (uint64_t)"Unknown mode";
              long long v24 = MSNLog();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                ServerModeDescription_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
              }
LABEL_29:

              abort();
            }
            id v20 = off_1E6CA04C0[v19];
            *(_DWORD *)buf = v39;
            id v45 = v7;
            __int16 v46 = 2080;
            v47 = v20;
            _os_log_debug_impl(&dword_1DC736000, v15, OS_LOG_TYPE_DEBUG, "Exception %@ with uses server %s", buf, 0x16u);
          }

          int v16 = [v14 integerValue];
          if (v16 == 1)
          {
            uint64_t v17 = [a1 sharedMicProxy];
          }
          else
          {
            if (v16 != 2)
            {
              qword_1EAA9AC80 = (uint64_t)"Only Cam and Mic servers can be requested.";
              long long v24 = MSNLog();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                +[MSNScopedExceptionsServer proxiesForException:](v24, v32, v33, v34, v35, v36, v37, v38);
              }
              goto LABEL_29;
            }
            uint64_t v17 = [a1 sharedCamProxy];
          }
          long long v18 = (void *)v17;
          objc_msgSend(v5, "addObject:", v17, v39);

          ++v13;
        }
        while (v11 != v13);
        uint64_t v21 = [v8 countByEnumeratingWithState:&v40 objects:v50 count:16];
        uint64_t v11 = v21;
      }
      while (v21);
    }

    uint64_t v22 = MSNLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v4 = v7;
      id v45 = v7;
      __int16 v46 = 2112;
      v47 = (char *)v5;
      _os_log_impl(&dword_1DC736000, v22, OS_LOG_TYPE_INFO, "Asserting exception %@ with servers %@", buf, 0x16u);
    }
    else
    {
      id v4 = v7;
    }
  }
  else
  {
    uint64_t v22 = [a1 sharedProxy];
    v51[0] = v22;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeExceptions, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)initWithQueue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DC736000, a2, OS_LOG_TYPE_DEBUG, "MSN exceptions listening to Mach service name '%@'.", (uint8_t *)&v2, 0xCu);
}

void __64__MSNScopedExceptionsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DC736000, log, OS_LOG_TYPE_DEBUG, "Connection gone.", v1, 2u);
}

- (void)beginException:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)endException:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  [a2 processIdentifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1DC736000, v2, v3, "Missing entitlement for exception %{public}@ from pid %i. Invalidating connection.", v4, v5, v6, v7, v8);
}

void __42__MSNScopedExceptionsServer_endException___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 40) processIdentifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1DC736000, v1, v2, "Ending nonexistent exception %{public}@ from pid %i.", v3, v4, v5, v6, v7);
}

- (void)isExceptionInEffect:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DC736000, a2, OS_LOG_TYPE_DEBUG, "No exception %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)proxiesForException:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end