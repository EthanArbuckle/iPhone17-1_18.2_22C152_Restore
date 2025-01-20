@interface WBSSearchHelperConnectionManager
+ (id)sharedManager;
- (NSXPCConnection)searchHelperConnection;
- (WBSSearchHelperConnectionManager)init;
- (id)searchHelperConnectionRequestedByClient:(id)a3;
- (void)removeClient:(id)a3;
- (void)setSearchHelperConnection:(id)a3;
@end

@implementation WBSSearchHelperConnectionManager

+ (id)sharedManager
{
  {
    v2 = (WBSSearchHelperConnectionManager *)+[WBSSearchHelperConnectionManager sharedManager]::manager;
  }
  else
  {
    v2 = objc_alloc_init(WBSSearchHelperConnectionManager);
    +[WBSSearchHelperConnectionManager sharedManager]::manager = (uint64_t)v2;
  }
  return v2;
}

- (WBSSearchHelperConnectionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSSearchHelperConnectionManager;
  v2 = [(WBSSearchHelperConnectionManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    clients = v2->_clients;
    v2->_clients = (NSMutableSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)searchHelperConnectionRequestedByClient:(id)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  [(NSMutableSet *)self->_clients addObject:a3];
  searchHelperConnection = self->_searchHelperConnection;
  if (searchHelperConnection)
  {
    v5 = searchHelperConnection;
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.Safari.SearchHelper"];
    objc_super v7 = self->_searchHelperConnection;
    self->_searchHelperConnection = v6;

    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC6D0E8];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
    v11 = [v9 setWithArray:v10];
    [v8 setClasses:v11 forSelector:sel_fetchOpenSearchDescriptionWithURL_completionHandler_ argumentIndex:0 ofReply:1];

    v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    [v8 setClasses:v12 forSelector:sel_updateSuggestionsRequestWithSearchTerms_suggestionsURLTemplate_userAgentString_completionHandler_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)self->_searchHelperConnection setRemoteObjectInterface:v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__WBSSearchHelperConnectionManager_searchHelperConnectionRequestedByClient___block_invoke;
    v14[3] = &unk_1E5C8E340;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)self->_searchHelperConnection setInvalidationHandler:v14];
    [(NSXPCConnection *)self->_searchHelperConnection resume];
    v5 = self->_searchHelperConnection;
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  return v5;
}

void __76__WBSSearchHelperConnectionManager_searchHelperConnectionRequestedByClient___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSSearchHelperConnectionManager_searchHelperConnectionRequestedByClient___block_invoke_2;
  block[3] = &unk_1E5C8E340;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __76__WBSSearchHelperConnectionManager_searchHelperConnectionRequestedByClient___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSearchHelperConnection:0];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  -[NSMutableSet removeObject:](self->_clients, "removeObject:");
  if (![(NSMutableSet *)self->_clients count]) {
    [(NSXPCConnection *)self->_searchHelperConnection invalidate];
  }
}

- (NSXPCConnection)searchHelperConnection
{
  return self->_searchHelperConnection;
}

- (void)setSearchHelperConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchHelperConnection, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end