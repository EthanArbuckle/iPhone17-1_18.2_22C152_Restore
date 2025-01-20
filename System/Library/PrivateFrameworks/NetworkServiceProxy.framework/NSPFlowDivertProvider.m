@interface NSPFlowDivertProvider
- (BOOL)handleNewFlow:(id)a3;
- (NSPFlowDivertProvider)init;
- (NSPManager)manager;
- (void)setManager:(id)a3;
- (void)startProxyWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopProxyWithReason:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation NSPFlowDivertProvider

- (NSPFlowDivertProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSPFlowDivertProvider;
  v2 = [(NEProvider *)&v5 init];
  if (v2)
  {
    v3 = +[NSPManager sharedManager];
    [(NSPFlowDivertProvider *)v2 setManager:v3];
  }
  return v2;
}

- (void)startProxyWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_INFO, "%@: NSPFlowDivertProvider: starting with options %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

- (void)stopProxyWithReason:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_INFO, "%@: NSPFlowDivertProvider: stopping with reason %ld", (uint8_t *)&v9, 0x16u);
  }

  v8 = [(NSPFlowDivertProvider *)self manager];
  [v8 stopWithCompletionHandler:v6];
}

- (BOOL)handleNewFlow:(id)a3
{
  id v3 = a3;
  kdebug_trace();
  v4 = [NPAppProxyFlowBridge alloc];
  objc_super v5 = (void *)nw_context_copy_implicit_context();
  id v6 = [(NPAppProxyFlowBridge *)v4 initWithAppProxyFlow:v3 nwContext:v5];

  return 1;
}

- (NSPManager)manager
{
  return (NSPManager *)objc_getProperty(self, a2, 64, 1);
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end