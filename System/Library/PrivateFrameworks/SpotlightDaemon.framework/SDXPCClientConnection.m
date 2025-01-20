@interface SDXPCClientConnection
- (OS_dispatch_queue)clientQueue;
- (SDXPCClientConnection)initWithServiceName:(id)a3 clientType:(int64_t)a4;
- (void)handleError:(id)a3;
- (void)invalidationHandler;
@end

@implementation SDXPCClientConnection

- (void)invalidationHandler
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 serviceName];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_ERROR, "##### connection invalidated \"%@\"", (uint8_t *)&v4, 0xCu);
}

- (void)handleError:(id)a3
{
  string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x263EF86B0]);
  v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(SpotlightReceiverConnection *)(uint64_t)string handleError:v5];
  }
}

- (SDXPCClientConnection)initWithServiceName:(id)a3 clientType:(int64_t)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SDXPCClientConnection;
  uint64_t v6 = [(CSXPCConnection *)&v12 initWithMachServiceName:v5];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v5 UTF8String], v8);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v9;
  }
  return v6;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void).cxx_destruct
{
}

@end