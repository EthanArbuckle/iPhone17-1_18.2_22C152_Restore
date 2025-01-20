@interface SYBacklinkIndicatorClient
+ (NSXPCListenerEndpoint)_testingEndpoint;
+ (SYBacklinkIndicatorClient)clientWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4;
+ (SYBacklinkIndicatorClient)clientWithLinkIdentifiers:(id)a3;
+ (void)hideIndicator;
+ (void)hotCornerExited;
+ (void)set_testingEndpoint:(id)a3;
+ (void)toggleIndicator;
+ (void)toggleIndicatorWithDisplayID:(unsigned int)a3 corner:(int64_t)a4;
- (BOOL)_shouldSendIndicatorRequest;
- (BOOL)sentRequest;
- (NSArray)domainIdentifiers;
- (NSArray)linkIdentifiers;
- (NSXPCConnection)connection;
- (SYBacklinkIndicatorClient)init;
- (int64_t)_showIndicatorAction;
- (int64_t)action;
- (int64_t)corner;
- (unsigned)displayID;
- (void)_clearLastShowIndicatorRequestTimestamp;
- (void)_configureConnectionAndResume;
- (void)_createConnectionIfNeeded;
- (void)_recordLastShowIndicatorRequestTimestamp;
- (void)_resetConnectionIfNecessary;
- (void)_sendIndicatorRequestWithCompletion:(id)a3;
- (void)dealloc;
- (void)requestIndicatorWithCompletion:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setConnection:(id)a3;
- (void)setCorner:(int64_t)a3;
- (void)setDisplayID:(unsigned int)a3;
- (void)setDomainIdentifiers:(id)a3;
- (void)setLinkIdentifiers:(id)a3;
- (void)setSentRequest:(BOOL)a3;
@end

@implementation SYBacklinkIndicatorClient

+ (SYBacklinkIndicatorClient)clientWithLinkIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      [v5 addObject:&stru_1F1E16740];
      ++v6;
    }
    while (v6 < [v4 count]);
  }
  v7 = [a1 clientWithDomainIdentifiers:v5 linkIdentifiers:v4];

  return (SYBacklinkIndicatorClient *)v7;
}

+ (SYBacklinkIndicatorClient)clientWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SYBacklinkIndicatorClient.m", 35, @"The domain identifiers count (%ld) does not match the link identifiers count (%ld).", objc_msgSend(v7, "count"), objc_msgSend(v8, "count"));
  }
  id v10 = objc_alloc_init((Class)a1);
  [v10 setDomainIdentifiers:v7];
  [v10 setLinkIdentifiers:v8];
  objc_msgSend(v10, "setAction:", objc_msgSend(v8, "count") != 0);

  return (SYBacklinkIndicatorClient *)v10;
}

- (SYBacklinkIndicatorClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)SYBacklinkIndicatorClient;
  v2 = [(SYBacklinkIndicatorClient *)&v5 init];
  uint64_t v3 = MEMORY[0x1E4F1CBF0];
  [(SYBacklinkIndicatorClient *)v2 setDomainIdentifiers:MEMORY[0x1E4F1CBF0]];
  [(SYBacklinkIndicatorClient *)v2 setLinkIdentifiers:v3];
  [(SYBacklinkIndicatorClient *)v2 setDisplayID:0];
  [(SYBacklinkIndicatorClient *)v2 setCorner:-1];
  [(SYBacklinkIndicatorClient *)v2 setAction:1];
  return v2;
}

+ (void)toggleIndicator
{
}

+ (void)toggleIndicatorWithDisplayID:(unsigned int)a3 corner:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = (id)objc_opt_new();
  [v6 setDisplayID:v5];
  [v6 setCorner:a4];
  [v6 setAction:2];
  [v6 requestIndicatorWithCompletion:0];
}

+ (void)hideIndicator
{
  id v2 = (id)objc_opt_new();
  [v2 setAction:0];
  [v2 requestIndicatorWithCompletion:0];
}

+ (void)hotCornerExited
{
  id v2 = (id)objc_opt_new();
  [v2 setAction:3];
  [v2 requestIndicatorWithCompletion:0];
}

- (void)dealloc
{
  uint64_t v3 = [(SYBacklinkIndicatorClient *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SYBacklinkIndicatorClient;
  [(SYBacklinkIndicatorClient *)&v4 dealloc];
}

- (void)_createConnectionIfNeeded
{
  uint64_t v3 = [(SYBacklinkIndicatorClient *)self connection];

  if (!v3)
  {
    objc_super v4 = [(id)objc_opt_class() _testingEndpoint];

    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    id v6 = v5;
    if (v4)
    {
      id v7 = [(id)objc_opt_class() _testingEndpoint];
      id v8 = (void *)[v6 initWithListenerEndpoint:v7];
      [(SYBacklinkIndicatorClient *)self setConnection:v8];
    }
    else
    {
      id v7 = (void *)[v5 initWithMachServiceName:@"com.apple.synapse.backlinkindicator" options:0];
      [(SYBacklinkIndicatorClient *)self setConnection:v7];
    }

    [(SYBacklinkIndicatorClient *)self _configureConnectionAndResume];
  }
}

- (void)_configureConnectionAndResume
{
  objc_super v4 = [(SYBacklinkIndicatorClient *)self connection];

  if (!v4)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SYBacklinkIndicatorClient.m" lineNumber:97 description:@"the XPC connection is unexpectedly nil"];
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__SYBacklinkIndicatorClient__configureConnectionAndResume__block_invoke;
  v13[3] = &unk_1E64637D0;
  objc_copyWeak(&v14, &location);
  id v5 = [(SYBacklinkIndicatorClient *)self connection];
  [v5 setInvalidationHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__SYBacklinkIndicatorClient__configureConnectionAndResume__block_invoke_2;
  v11[3] = &unk_1E64637D0;
  objc_copyWeak(&v12, &location);
  id v6 = [(SYBacklinkIndicatorClient *)self connection];
  [v6 setInterruptionHandler:v11];

  id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2E058];
  id v8 = [(SYBacklinkIndicatorClient *)self connection];
  [v8 setRemoteObjectInterface:v7];

  uint64_t v9 = [(SYBacklinkIndicatorClient *)self connection];
  [v9 resume];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __58__SYBacklinkIndicatorClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnectionIfNecessary];
}

void __58__SYBacklinkIndicatorClient__configureConnectionAndResume__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnectionIfNecessary];
}

- (void)_resetConnectionIfNecessary
{
  if ([(SYBacklinkIndicatorClient *)self sentRequest])
  {
    uint64_t v3 = [(SYBacklinkIndicatorClient *)self connection];
    [v3 invalidate];

    [(SYBacklinkIndicatorClient *)self setConnection:0];
    [(SYBacklinkIndicatorClient *)self setSentRequest:0];
  }
}

- (void)requestIndicatorWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void))a3;
  if ([(SYBacklinkIndicatorClient *)self _shouldSendIndicatorRequest])
  {
    [(SYBacklinkIndicatorClient *)self _sendIndicatorRequestWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
}

- (void)_sendIndicatorRequestWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void (**)(id, BOOL))a3;
  [(SYBacklinkIndicatorClient *)self _createConnectionIfNeeded];
  if (![(SYBacklinkIndicatorClient *)self sentRequest])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id v5 = [(SYBacklinkIndicatorClient *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__SYBacklinkIndicatorClient__sendIndicatorRequestWithCompletion___block_invoke;
    v15[3] = &unk_1E6463A38;
    v15[4] = &v16;
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v15];

    if (!*((unsigned char *)v17 + 24))
    {
      int64_t v7 = [(SYBacklinkIndicatorClient *)self _showIndicatorAction];
      os_log_t v8 = os_log_create("com.apple.synapse", "BacklinkMonitor");
      uint64_t v9 = v8;
      if (v7)
      {
        id v10 = v8;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = [(SYBacklinkIndicatorClient *)self linkIdentifiers];
          uint64_t v12 = [v11 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v21 = v12;
          _os_log_impl(&dword_1C2C5F000, v10, OS_LOG_TYPE_DEFAULT, "BacklinkIndicatorClient: Will call showIndicatorForBacklink on service. Link identifier count: %ld", buf, 0xCu);
        }
        [(SYBacklinkIndicatorClient *)self _recordLastShowIndicatorRequestTimestamp];
        v13 = [(SYBacklinkIndicatorClient *)self domainIdentifiers];
        id v14 = [(SYBacklinkIndicatorClient *)self linkIdentifiers];
        objc_msgSend(v6, "showIndicatorForBacklinkWithDomainIdentifiers:linkIdentifiers:displayID:corner:action:", v13, v14, -[SYBacklinkIndicatorClient displayID](self, "displayID"), -[SYBacklinkIndicatorClient corner](self, "corner"), v7);
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_DEFAULT, "BacklinkIndicatorClient: Will call hideIndicator on service.", buf, 2u);
        }

        [(SYBacklinkIndicatorClient *)self _clearLastShowIndicatorRequestTimestamp];
        [v6 hideIndicator];
      }
      [(SYBacklinkIndicatorClient *)self setSentRequest:1];
    }

    _Block_object_dispose(&v16, 8);
  }
  if (v4) {
    v4[2](v4, [(SYBacklinkIndicatorClient *)self sentRequest]);
  }
}

void __65__SYBacklinkIndicatorClient__sendIndicatorRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__SYBacklinkIndicatorClient__sendIndicatorRequestWithCompletion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (int64_t)_showIndicatorAction
{
  id v3 = [(SYBacklinkIndicatorClient *)self linkIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  return [(SYBacklinkIndicatorClient *)self action];
}

- (void)_recordLastShowIndicatorRequestTimestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setDouble:@"lastShowIndicatorTime" forKey:v3];
}

- (void)_clearLastShowIndicatorRequestTimestamp
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 removeObjectForKey:@"lastShowIndicatorTime"];
}

- (BOOL)_shouldSendIndicatorRequest
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(SYBacklinkIndicatorClient *)self _showIndicatorAction]) {
    return 1;
  }
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"lastShowIndicatorTime"];
  double v4 = v3;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5 - v4;
  if (v6 < 60.0) {
    return 1;
  }
  if (v4 <= 0.0)
  {
    os_log_t v8 = &stru_1F1E16740;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @" Last was %0.1fs ago.", *(void *)&v6);
    os_log_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_INFO, "BacklinkIndicatorClient: Will not send request to service, no recent show indicator requests.%@", buf, 0xCu);
  }

  return 0;
}

- (NSArray)domainIdentifiers
{
  return self->_domainIdentifiers;
}

- (void)setDomainIdentifiers:(id)a3
{
}

- (NSArray)linkIdentifiers
{
  return self->_linkIdentifiers;
}

- (void)setLinkIdentifiers:(id)a3
{
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displayID = a3;
}

- (int64_t)corner
{
  return self->_corner;
}

- (void)setCorner:(int64_t)a3
{
  self->_corner = a3;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)sentRequest
{
  return self->_sentRequest;
}

- (void)setSentRequest:(BOOL)a3
{
  self->_sentRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_linkIdentifiers, 0);
  objc_storeStrong((id *)&self->_domainIdentifiers, 0);
}

+ (NSXPCListenerEndpoint)_testingEndpoint
{
  return (NSXPCListenerEndpoint *)(id)__testingEndpoint;
}

+ (void)set_testingEndpoint:(id)a3
{
}

void __65__SYBacklinkIndicatorClient__sendIndicatorRequestWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Error creating remote object for backlink indicator: %@", (uint8_t *)&v2, 0xCu);
}

@end