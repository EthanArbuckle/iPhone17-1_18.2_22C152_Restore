@interface SiriReaderConnection
- (SiriReaderConnection)init;
- (id)readerProtocol;
- (int64_t)getPlaybackStatusForIdentifier:(id)a3;
- (void)dealloc;
- (void)endMediaSessionForIdentifier:(id)a3;
- (void)pausePlaybackForIdentifier:(id)a3;
- (void)readText:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7;
- (void)readText:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7 activationSource:(int64_t)a8;
- (void)resumePlaybackForIdentifier:(id)a3;
@end

@implementation SiriReaderConnection

- (SiriReaderConnection)init
{
  v7.receiver = self;
  v7.super_class = (Class)SiriReaderConnection;
  v2 = [(SiriReaderConnection *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.siri.sirireaderd" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270A99AB0];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global];
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_60];
  }
  return v2;
}

void __28__SiriReaderConnection_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SiriReaderConnection init]_block_invoke";
    _os_log_impl(&dword_25DA7F000, v0, OS_LOG_TYPE_DEFAULT, "%s SiriReaderConnection: connection invalidated", (uint8_t *)&v1, 0xCu);
  }
}

void __28__SiriReaderConnection_init__block_invoke_58()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SiriReaderConnection init]_block_invoke";
    _os_log_impl(&dword_25DA7F000, v0, OS_LOG_TYPE_DEFAULT, "%s SiriReaderConnection: connection invalidated", (uint8_t *)&v1, 0xCu);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SiriReaderConnection;
  [(SiriReaderConnection *)&v3 dealloc];
}

- (id)readerProtocol
{
  return [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_65];
}

void __38__SiriReaderConnection_readerProtocol__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_super v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[SiriReaderConnection readerProtocol]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_25DA7F000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)readText:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7
{
  connection = self->_connection;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  [(NSXPCConnection *)connection resume];
  id v18 = [(SiriReaderConnection *)self readerProtocol];
  [v18 readTextWithTextTitle:v17 textBody:v16 textIdentifier:v15 textLocale:v14 textLeadingImage:v13 activationSource:0];

  [(NSXPCConnection *)self->_connection suspend];
}

- (void)readText:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7 activationSource:(int64_t)a8
{
  connection = self->_connection;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  [(NSXPCConnection *)connection resume];
  id v20 = [(SiriReaderConnection *)self readerProtocol];
  [v20 readTextWithTextTitle:v19 textBody:v18 textIdentifier:v17 textLocale:v16 textLeadingImage:v15 activationSource:a8];

  [(NSXPCConnection *)self->_connection suspend];
}

- (int64_t)getPlaybackStatusForIdentifier:(id)a3
{
  id v4 = a3;
  [(NSXPCConnection *)self->_connection resume];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v5 = [(SiriReaderConnection *)self readerProtocol];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__SiriReaderConnection_getPlaybackStatusForIdentifier___block_invoke;
  v8[3] = &unk_2655120C8;
  v8[4] = &v9;
  [v5 getPlaybackStatusForIdentifierWithTextIdentifier:v4 reply:v8];
  [(NSXPCConnection *)self->_connection suspend];
  int64_t v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __55__SiriReaderConnection_getPlaybackStatusForIdentifier___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)pausePlaybackForIdentifier:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  [(NSXPCConnection *)connection resume];
  id v6 = [(SiriReaderConnection *)self readerProtocol];
  [v6 pausePlaybackForIdentifierWithTextIdentifier:v5];

  [(NSXPCConnection *)self->_connection suspend];
}

- (void)resumePlaybackForIdentifier:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  [(NSXPCConnection *)connection resume];
  id v6 = [(SiriReaderConnection *)self readerProtocol];
  [v6 resumePlaybackForIdentifierWithTextIdentifier:v5];

  [(NSXPCConnection *)self->_connection suspend];
}

- (void)endMediaSessionForIdentifier:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  [(NSXPCConnection *)connection resume];
  id v6 = [(SiriReaderConnection *)self readerProtocol];
  [v6 endMediaSessionForIdentifierWithTextIdentifier:v5];

  [(NSXPCConnection *)self->_connection suspend];
}

- (void).cxx_destruct
{
}

@end