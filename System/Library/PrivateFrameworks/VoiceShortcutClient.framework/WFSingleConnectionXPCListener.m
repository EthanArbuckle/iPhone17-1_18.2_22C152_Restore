@interface WFSingleConnectionXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)activeConnection;
- (NSXPCInterface)exportedInterface;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (WFSingleConnectionXPCListener)initWithExportedObject:(id)a3 exportedInterface:(id)a4;
- (id)exportedObject;
- (void)setActiveConnection:(id)a3;
@end

@implementation WFSingleConnectionXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong(&self->_exportedObject, 0);
}

- (void)setActiveConnection:(id)a3
{
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFSingleConnectionXPCListener *)self activeConnection];

  v9 = getWFVoiceShortcutClientLogObject();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[WFSingleConnectionXPCListener listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_ERROR, "%s Not accepting new connection since there is already an active one.", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFSingleConnectionXPCListener listener:shouldAcceptNewConnection:]";
      __int16 v23 = 2112;
      v24 = self;
      _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEFAULT, "%s Received incoming XPC connection for listener: %@", buf, 0x16u);
    }

    [(WFSingleConnectionXPCListener *)self setActiveConnection:v7];
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__WFSingleConnectionXPCListener_listener_shouldAcceptNewConnection___block_invoke;
    v19[3] = &unk_1E6079818;
    objc_copyWeak(&v20, (id *)buf);
    [v7 setInvalidationHandler:v19];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __68__WFSingleConnectionXPCListener_listener_shouldAcceptNewConnection___block_invoke_12;
    v17 = &unk_1E6079818;
    objc_copyWeak(&v18, (id *)buf);
    [v7 setInterruptionHandler:&v14];
    v11 = [(WFSingleConnectionXPCListener *)self exportedInterface];
    [v7 setExportedInterface:v11];

    v12 = [(WFSingleConnectionXPCListener *)self exportedObject];
    [v7 setExportedObject:v12];

    [v7 resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

  return v8 == 0;
}

void __68__WFSingleConnectionXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[WFSingleConnectionXPCListener listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1B3C5C000, v2, OS_LOG_TYPE_ERROR, "%s Connection to dialog was invalidated.", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setActiveConnection:0];
}

void __68__WFSingleConnectionXPCListener_listener_shouldAcceptNewConnection___block_invoke_12(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[WFSingleConnectionXPCListener listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1B3C5C000, v2, OS_LOG_TYPE_ERROR, "%s Connection to dialog was interrupted", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setActiveConnection:0];
}

- (NSXPCListenerEndpoint)endpoint
{
  v2 = [(WFSingleConnectionXPCListener *)self listener];
  int v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (WFSingleConnectionXPCListener)initWithExportedObject:(id)a3 exportedInterface:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFSingleConnectionXPCListener.m", 29, @"Invalid parameter not satisfying: %@", @"exportedObject" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFSingleConnectionXPCListener.m", 30, @"Invalid parameter not satisfying: %@", @"exportedInterface" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFSingleConnectionXPCListener;
  v11 = [(WFSingleConnectionXPCListener *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_exportedObject, a3);
    objc_storeStrong((id *)&v12->_exportedInterface, a4);
    uint64_t v13 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v12->_listener;
    v12->_listener = (NSXPCListener *)v13;

    [(NSXPCListener *)v12->_listener setDelegate:v12];
    [(NSXPCListener *)v12->_listener resume];
    uint64_t v15 = v12;
  }

  return v12;
}

@end