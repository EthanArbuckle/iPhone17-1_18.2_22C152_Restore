@interface WBSCredentialExtractionHelperConnectionManager
+ (id)sharedManager;
- (NSXPCConnection)credentialExtractionHelperConnection;
- (WBSCredentialExtractionHelperConnectionManager)init;
- (id)credentialExtractionHelperConnectionRequestedByClient:(id)a3;
- (void)removeClient:(id)a3;
- (void)setCredentialExtractionHelperConnection:(id)a3;
@end

@implementation WBSCredentialExtractionHelperConnectionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_32);
  }
  v2 = (void *)sharedManager_manager_0;
  return v2;
}

void __63__WBSCredentialExtractionHelperConnectionManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSCredentialExtractionHelperConnectionManager);
  v1 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = (uint64_t)v0;
}

- (WBSCredentialExtractionHelperConnectionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSCredentialExtractionHelperConnectionManager;
  v2 = [(WBSCredentialExtractionHelperConnectionManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    clients = v2->_clients;
    v2->_clients = (NSMutableSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)credentialExtractionHelperConnectionRequestedByClient:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_clients addObject:v4];
  credentialExtractionHelperConnection = self->_credentialExtractionHelperConnection;
  if (credentialExtractionHelperConnection)
  {
    v6 = credentialExtractionHelperConnection;
  }
  else
  {
    objc_super v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.Safari.CredentialExtractionHelper"];
    v8 = self->_credentialExtractionHelperConnection;
    self->_credentialExtractionHelperConnection = v7;

    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC6CF68];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v12 = [v10 setWithArray:v11];
    [v9 setClasses:v12 forSelector:sel_fetchExtractedCredentialsFromCSVFile_sandboxExtension_completionHandler_ argumentIndex:0 ofReply:1];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v15 = [v13 setWithArray:v14];
    [v9 setClasses:v15 forSelector:sel_fetchExtractedCredentialsFromCSVFile_sandboxExtension_completionHandler_ argumentIndex:0 ofReply:0];

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v18 = [v16 setWithArray:v17];
    [v9 setClasses:v18 forSelector:sel_fetchExtractedCredentialsFromCSVFile_sandboxExtension_completionHandler_ argumentIndex:1 ofReply:0];

    [(NSXPCConnection *)self->_credentialExtractionHelperConnection setRemoteObjectInterface:v9];
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __104__WBSCredentialExtractionHelperConnectionManager_credentialExtractionHelperConnectionRequestedByClient___block_invoke;
    v20[3] = &unk_1E5C8E0B0;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)self->_credentialExtractionHelperConnection setInvalidationHandler:v20];
    [(NSXPCConnection *)self->_credentialExtractionHelperConnection resume];
    v6 = self->_credentialExtractionHelperConnection;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __104__WBSCredentialExtractionHelperConnectionManager_credentialExtractionHelperConnectionRequestedByClient___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__WBSCredentialExtractionHelperConnectionManager_credentialExtractionHelperConnectionRequestedByClient___block_invoke_2;
  block[3] = &unk_1E5C8E0B0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __104__WBSCredentialExtractionHelperConnectionManager_credentialExtractionHelperConnectionRequestedByClient___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCredentialExtractionHelperConnection:0];
}

- (void)removeClient:(id)a3
{
  [(NSMutableSet *)self->_clients removeObject:a3];
  if (![(NSMutableSet *)self->_clients count])
  {
    credentialExtractionHelperConnection = self->_credentialExtractionHelperConnection;
    [(NSXPCConnection *)credentialExtractionHelperConnection invalidate];
  }
}

- (NSXPCConnection)credentialExtractionHelperConnection
{
  return self->_credentialExtractionHelperConnection;
}

- (void)setCredentialExtractionHelperConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialExtractionHelperConnection, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end