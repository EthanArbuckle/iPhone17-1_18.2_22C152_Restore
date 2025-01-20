@interface KTStaticKeyMock
+ (id)mockStaticKeyWithNotificationCenter:(id)a3;
- (BOOL)codeFailure;
- (BOOL)delayCode;
- (KTAccountPublicID)peerID;
- (KTNotificationCenter)notificationCenter;
- (NSMutableDictionary)mockHandles;
- (OS_dispatch_queue)mockQueue;
- (OS_dispatch_queue)mockWork;
- (void)codeAvailable:(id)a3 code:(id)a4;
- (void)deleteKTSession:(id)a3 complete:(id)a4;
- (void)getKTSessionByHandle:(id)a3 complete:(id)a4;
- (void)getKTSessionByID:(id)a3 complete:(id)a4;
- (void)listKTSessions:(id)a3;
- (void)postNotification:(id)a3 state:(id)a4;
- (void)setCodeFailure:(BOOL)a3;
- (void)setDelayCode:(BOOL)a3;
- (void)setMockHandles:(id)a3;
- (void)setMockQueue:(id)a3;
- (void)setMockWork:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setupCode:(id)a3;
- (void)setupKTSession:(id)a3 complete:(id)a4;
@end

@implementation KTStaticKeyMock

+ (id)mockStaticKeyWithNotificationCenter:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(KTStaticKeyMock);
  if (v4)
  {
    v5 = [MEMORY[0x263F80D08] ktAccountPublicIDWithPKIString:@"apple-ktpki:YYGzMIGwAgEBAgEBBEEEzJxLXIZEEoaCbsZDjEf3lyd1CXEzzmihWMdRIRaqb2osfA3PJfg6dEVWUChkxJvAqUZG5u5FOxHwQoADqkoNOqFlMGMEFNk5nRWE6ZOuRDPPUCgu5P4sN9TbAgEBBEgwRgIhAPNU82BqsYeOt3XF1ph1a3cLXuJc2qcPsCNDXJDsCxf3AiEA4iSOYBMONpNBZ7p4hz2cprQMT7P/fPZCuPtPrHWeDj5NiQ==" error:0];
    [(KTStaticKeyMock *)v4 setPeerID:v5];

    dispatch_queue_t v6 = dispatch_queue_create("KTStaticKeyMock", 0);
    [(KTStaticKeyMock *)v4 setMockQueue:v6];

    dispatch_queue_t v7 = dispatch_queue_create("KTStaticKeyMock-WorkQueue", 0);
    [(KTStaticKeyMock *)v4 setMockWork:v7];

    v8 = [MEMORY[0x263EFF9A0] dictionary];
    [(KTStaticKeyMock *)v4 setMockHandles:v8];

    [(KTStaticKeyMock *)v4 setNotificationCenter:v3];
    [(KTStaticKeyMock *)v4 setDelayCode:0];
    [(KTStaticKeyMock *)v4 setCodeFailure:0];
    v9 = v4;
  }

  return v4;
}

- (void)postNotification:(id)a3 state:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = *MEMORY[0x263F80DD8];
  v12[0] = v6;
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = (void *)[v8 mutableCopy];

  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F80DE0]];
  }
  v10 = [(KTStaticKeyMock *)self notificationCenter];
  [v10 postNotificationName:*MEMORY[0x263F80DD0] object:0 userInfo:v9 deliverImmediately:0];
}

- (void)codeAvailable:(id)a3 code:(id)a4
{
  id v9 = a3;
  v5 = [(KTStaticKeyMock *)self mockQueue];
  dispatch_assert_queue_V2(v5);

  if ([(KTStaticKeyMock *)self codeFailure])
  {
    [v9 setState:*MEMORY[0x263F80DF0]];
  }
  else
  {
    [v9 setState:*MEMORY[0x263F80DE8]];
    [v9 setSasCode:@"123456"];
    id v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:600.0];
    [v9 setSessionExpire:v6];
  }
  id v7 = [v9 sessionID];
  v8 = [v9 state];
  [(KTStaticKeyMock *)self postNotification:v7 state:v8];
}

- (void)setupCode:(id)a3
{
  id v4 = a3;
  v5 = [(KTStaticKeyMock *)self mockQueue];
  dispatch_assert_queue_V2(v5);

  if ([(KTStaticKeyMock *)self delayCode])
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    id v7 = [(KTStaticKeyMock *)self mockQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__KTStaticKeyMock_setupCode___block_invoke;
    v8[3] = &unk_265553010;
    v8[4] = self;
    id v9 = v4;
    dispatch_after(v6, v7, v8);
  }
  else
  {
    [(KTStaticKeyMock *)self codeAvailable:v4 code:@"123456"];
  }
}

uint64_t __29__KTStaticKeyMock_setupCode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) codeAvailable:*(void *)(a1 + 40) code:@"123456"];
}

- (void)setupKTSession:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  id v9 = [(KTStaticKeyMock *)self mockQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__KTStaticKeyMock_setupKTSession_complete___block_invoke;
  block[3] = &unk_265553060;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_after(v8, v9, block);
}

void __43__KTStaticKeyMock_setupKTSession_complete___block_invoke(id *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F80D10]);
  id v3 = [a1[4] peer];
  [v2 setPeerHandle:v3];

  id v4 = (void *)MEMORY[0x263EFF9C0];
  v5 = [a1[4] peer];
  id v6 = [v4 setWithObject:v5];
  id v7 = [a1[4] otherNamesForPeer];
  dispatch_time_t v8 = [v6 setByAddingObjectsFromSet:v7];
  [v2 setExpectedPeerHandles:v8];

  id v9 = [a1[5] mockHandles];
  id v10 = [v2 sessionID];
  [v9 setObject:v2 forKeyedSubscript:v10];

  id v11 = [a1[5] peerID];
  [v2 setPeerAccountIdentity:v11];

  [a1[5] codeAvailable:v2 code:@"123456"];
  v12 = [a1[5] mockWork];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __43__KTStaticKeyMock_setupKTSession_complete___block_invoke_2;
  v15[3] = &unk_265553038;
  id v13 = a1[6];
  id v16 = v2;
  id v17 = v13;
  id v14 = v2;
  dispatch_async(v12, v15);
}

uint64_t __43__KTStaticKeyMock_setupKTSession_complete___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)deleteKTSession:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  id v9 = [(KTStaticKeyMock *)self mockQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__KTStaticKeyMock_deleteKTSession_complete___block_invoke;
  block[3] = &unk_265553060;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_after(v8, v9, block);
}

void __44__KTStaticKeyMock_deleteKTSession_complete___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mockHandles];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mockHandles];
    [v4 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];

    [v3 setState:*MEMORY[0x263F80DF8]];
    v5 = *(void **)(a1 + 32);
    id v6 = [v3 sessionID];
    id v7 = [v3 state];
    [v5 postNotification:v6 state:v7];
  }
  dispatch_time_t v8 = [*(id *)(a1 + 32) mockWork];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__KTStaticKeyMock_deleteKTSession_complete___block_invoke_2;
  v9[3] = &unk_265553088;
  id v10 = *(id *)(a1 + 48);
  BOOL v11 = v3 != 0;
  dispatch_async(v8, v9);
}

uint64_t __44__KTStaticKeyMock_deleteKTSession_complete___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)listKTSessions:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  id v6 = [(KTStaticKeyMock *)self mockQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__KTStaticKeyMock_listKTSessions___block_invoke;
  v8[3] = &unk_2655530B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, v6, v8);
}

void __34__KTStaticKeyMock_listKTSessions___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mockWork];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__KTStaticKeyMock_listKTSessions___block_invoke_2;
  v4[3] = &unk_265553038;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __34__KTStaticKeyMock_listKTSessions___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) mockHandles];
  id v2 = [v3 allValues];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

- (void)getKTSessionByHandle:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  id v9 = [(KTStaticKeyMock *)self mockQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__KTStaticKeyMock_getKTSessionByHandle_complete___block_invoke;
  block[3] = &unk_265553060;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_after(v8, v9, block);
}

void __49__KTStaticKeyMock_getKTSessionByHandle_complete___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [*(id *)(a1 + 32) mockHandles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        id v9 = [*(id *)(a1 + 32) mockHandles];
        id v10 = [v9 objectForKeyedSubscript:v8];

        id v11 = [v10 expectedPeerHandles];
        int v12 = [v11 containsObject:*(void *)(a1 + 40)];

        if (v12) {
          [v2 addObject:v10];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  id v13 = [*(id *)(a1 + 32) mockWork];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__KTStaticKeyMock_getKTSessionByHandle_complete___block_invoke_2;
  v16[3] = &unk_265553038;
  id v14 = *(id *)(a1 + 48);
  id v17 = v2;
  id v18 = v14;
  id v15 = v2;
  dispatch_async(v13, v16);
}

uint64_t __49__KTStaticKeyMock_getKTSessionByHandle_complete___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getKTSessionByID:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  id v9 = [(KTStaticKeyMock *)self mockQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__KTStaticKeyMock_getKTSessionByID_complete___block_invoke;
  block[3] = &unk_265553100;
  id v13 = v6;
  id v14 = v7;
  void block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_after(v8, v9, block);
}

void __45__KTStaticKeyMock_getKTSessionByID_complete___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mockWork];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__KTStaticKeyMock_getKTSessionByID_complete___block_invoke_2;
  block[3] = &unk_2655530D8;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  void block[4] = v4;
  id v7 = v5;
  dispatch_async(v2, block);
}

void __45__KTStaticKeyMock_getKTSessionByID_complete___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) mockHandles];
  id v3 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (OS_dispatch_queue)mockQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMockQueue:(id)a3
{
}

- (OS_dispatch_queue)mockWork
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMockWork:(id)a3
{
}

- (NSMutableDictionary)mockHandles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMockHandles:(id)a3
{
}

- (KTNotificationCenter)notificationCenter
{
  return (KTNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNotificationCenter:(id)a3
{
}

- (KTAccountPublicID)peerID
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeerID:(id)a3
{
}

- (BOOL)delayCode
{
  return self->_delayCode;
}

- (void)setDelayCode:(BOOL)a3
{
  self->_delayCode = a3;
}

- (BOOL)codeFailure
{
  return self->_codeFailure;
}

- (void)setCodeFailure:(BOOL)a3
{
  self->_codeFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_mockHandles, 0);
  objc_storeStrong((id *)&self->_mockWork, 0);
  objc_storeStrong((id *)&self->_mockQueue, 0);
}

@end