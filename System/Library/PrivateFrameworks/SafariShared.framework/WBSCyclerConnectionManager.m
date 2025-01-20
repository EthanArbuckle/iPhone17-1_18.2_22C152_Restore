@interface WBSCyclerConnectionManager
+ (BOOL)isBookmarkCyclerEnabled;
+ (BOOL)isExtensionCyclerEnabled;
+ (BOOL)isTabCyclerEnabled;
+ (BOOL)shouldTabCyclerSlowDown;
+ (unint64_t)countOfEnabledCyclers;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (WBSCyclerConnectionManager)init;
- (WBSCyclerConnectionManager)initWithTestTarget:(id)a3;
- (WBSCyclerTestTarget)testTarget;
- (void)connect;
@end

@implementation WBSCyclerConnectionManager

+ (unint64_t)countOfEnabledCyclers
{
  unsigned int v3 = [a1 isBookmarkCyclerEnabled];
  unint64_t v4 = [a1 isTabCyclerEnabled] + (unint64_t)v3;
  return v4 + [a1 isExtensionCyclerEnabled];
}

+ (BOOL)isExtensionCyclerEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSExtensionCyclerEnabled"];

  return v3;
}

+ (BOOL)isBookmarkCyclerEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSBookmarkCyclerEnabled"];

  return v3;
}

+ (BOOL)isTabCyclerEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSTabCyclerEnabled"];

  return v3;
}

+ (BOOL)shouldTabCyclerSlowDown
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = [v2 BOOLForKey:@"WBSTabCyclerSlowedDown"];

  return v3;
}

- (WBSCyclerConnectionManager)init
{
  return 0;
}

- (WBSCyclerConnectionManager)initWithTestTarget:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCyclerConnectionManager;
  v6 = [(WBSCyclerConnectionManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_testTarget, a3);
    v8 = v7;
  }

  return v7;
}

- (void)connect
{
  char v3 = [MEMORY[0x1E4F29290] anonymousListener];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  [(NSXPCListener *)self->_xpcListener resume];
  id v5 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v10 = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Set up XPC listener; sending endpoint to cycler", v10, 2u);
  }
  v6 = objc_alloc_init(WBSCyclerServiceProxy);
  cyclerProxy = self->_cyclerProxy;
  self->_cyclerProxy = v6;

  v8 = self->_cyclerProxy;
  v9 = [(NSXPCListener *)self->_xpcListener endpoint];
  [(WBSCyclerServiceProxy *)v8 setTestTargetEndpoint:v9 reply:&__block_literal_global_36];
}

void __37__WBSCyclerConnectionManager_connect__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  unint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __37__WBSCyclerConnectionManager_connect__block_invoke_cold_1((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Successfully sent endpoint to cycler", v5, 2u);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543362;
    id v13 = v5;
    _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Received new connection %{public}@ from cycler", (uint8_t *)&v12, 0xCu);
  }
  v7 = [v5 valueForEntitlement:@"com.apple.private.Safari.can-use-cycler"];
  char v8 = [v7 BOOLValue];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC332F8];
    [v5 setExportedInterface:v9];

    [v5 setExportedObject:self->_testTarget];
    [v5 resume];
  }
  else
  {
    objc_super v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerConnectionManager listener:shouldAcceptNewConnection:]((uint64_t)v5, v10);
    }
  }

  return v8;
}

- (WBSCyclerTestTarget)testTarget
{
  return self->_testTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testTarget, 0);
  objc_storeStrong((id *)&self->_cyclerProxy, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

void __37__WBSCyclerConnectionManager_connect__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Error sending endpoint to cycler: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Remote process is not entitled to use cycler functionality; rejecting connection %{public}@",
    (uint8_t *)&v2,
    0xCu);
}

@end