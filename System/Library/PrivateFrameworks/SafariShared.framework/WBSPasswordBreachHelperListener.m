@interface WBSPasswordBreachHelperListener
- (BOOL)_connectionHasValidEntitlements:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (WBSPasswordBreachHelperListener)init;
@end

@implementation WBSPasswordBreachHelperListener

- (WBSPasswordBreachHelperListener)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBSPasswordBreachHelperListener;
  v2 = [(WBSPasswordBreachHelperListener *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x1E4F98138]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v6 = v2;
  }

  return v2;
}

- (BOOL)_connectionHasValidEntitlements:(id)a3
{
  id v3 = [a3 valueForEntitlement:@"com.apple.private.Safari.PasswordBreachHelper"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(WBSPasswordBreachHelperListener *)self _connectionHasValidEntitlements:v5];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC47010];
    objc_super v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    [v7 setClasses:v15 forSelector:sel_getPasswordEvaluationsForPersistentIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
    [v7 setClasses:v23 forSelector:sel_writePasswordEvaluationsToCache_completionHandler_ argumentIndex:0 ofReply:0];

    [v5 setExportedInterface:v7];
    v24 = objc_alloc_init(WBSPasswordBreachHelper);
    [v5 setExportedObject:v24];
    [v5 resume];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[WBSPasswordBreachHelperListener listener:shouldAcceptNewConnection:]();
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A6B5F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Connection to PasswordBreachHelper denied: Missing entitlement.", v0, 2u);
}

@end