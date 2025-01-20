@interface VSGenericUpdateEndpoint
+ (BOOL)supportsSecureCoding;
+ (id)configuredEndpointWithUpdateHandler:(id)a3 withConnection:(id)a4;
+ (id)remoteUpdateHanderForEndpoint:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)queue;
- (VSGenericUpdateEndpoint)initWithCoder:(id)a3;
- (id)handler;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setEndpoint:(id)a3;
- (void)setHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation VSGenericUpdateEndpoint

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (VSGenericUpdateEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSGenericUpdateEndpoint;
  v5 = [(VSGenericUpdateEndpoint *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endpoint"];
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)invalidate
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  listener = self->_listener;
  self->_listener = 0;

  id handler = self->_handler;
  self->_id handler = 0;

  endpoint = self->_endpoint;
  self->_endpoint = 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  id handler = self->_handler;
  if (handler)
  {
    if (self->_queue) {
      objc_msgSend(v7, "_setQueue:");
    }
    v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C1C31C8];
    [v8 setExportedInterface:v10];

    v11 = [[VSGenericBlockHolder alloc] initWithBlock:self->_handler];
    [v8 setExportedObject:v11];

    [v8 resume];
    id v12 = self->_handler;
    self->_id handler = 0;

    endpoint = self->_endpoint;
    self->_endpoint = 0;
  }
  return handler != 0;
}

- (void)dealloc
{
  [(VSGenericUpdateEndpoint *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VSGenericUpdateEndpoint;
  [(VSGenericUpdateEndpoint *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)remoteUpdateHanderForEndpoint:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x263F08D68];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 endpoint];

  id v7 = (void *)[v5 initWithListenerEndpoint:v6];
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C1C31C8];
  [v7 setRemoteObjectInterface:v8];

  [v7 resume];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__VSGenericUpdateEndpoint_remoteUpdateHanderForEndpoint___block_invoke;
  v13[3] = &unk_2640E8DB8;
  id v14 = v7;
  id v9 = v7;
  v10 = (void *)MEMORY[0x210554730](v13);
  v11 = (void *)MEMORY[0x210554730]();

  return v11;
}

void __57__VSGenericUpdateEndpoint_remoteUpdateHanderForEndpoint___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 remoteObjectProxy];
  [v4 invokeUpdateWithObject:v3];
}

+ (id)configuredEndpointWithUpdateHandler:(id)a3 withConnection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(VSGenericUpdateEndpoint);
  v8 = [MEMORY[0x263F08D88] anonymousListener];
  [v8 setDelegate:v7];
  [v8 resume];
  id v9 = [v5 _queue];

  [(VSGenericUpdateEndpoint *)v7 setQueue:v9];
  [(VSGenericUpdateEndpoint *)v7 setHandler:v6];

  [(VSGenericUpdateEndpoint *)v7 setListener:v8];
  v10 = [v8 endpoint];
  [(VSGenericUpdateEndpoint *)v7 setEndpoint:v10];

  return v7;
}

@end