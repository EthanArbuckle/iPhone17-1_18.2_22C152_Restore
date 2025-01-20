@interface SafariFetcherServerProxy
- (SafariFetcherServerProxy)init;
- (WebBookmarksClientDelegateProtocol)delegate;
- (void)clearAllReadingListArchives;
- (void)clearReadingListArchiveWithUUID:(id)a3;
- (void)connection:(id)a3 didCloseWithError:(id)a4;
- (void)didFinishFetching;
- (void)didStartFetchingReadingListItemWithMessage:(id)a3;
- (void)didStopFetchingReadingListItemWithMessage:(id)a3;
- (void)didUpdateProgressWithMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startReadingListFetcher;
@end

@implementation SafariFetcherServerProxy

- (SafariFetcherServerProxy)init
{
  v3 = +[WBFeatureManager sharedFeatureManager];
  int v4 = [v3 isOfflineReadingListAvailable];

  if (v4
    && (v23.receiver = self,
        v23.super_class = (Class)SafariFetcherServerProxy,
        (self = [(SafariFetcherServerProxy *)&v23 init]) != 0))
  {
    objc_initWeak(&location, self);
    v5 = [WebBookmarksXPCConnection alloc];
    v6 = [(WebBookmarksXPCConnection *)v5 initClientForMachService:kSafariFetcherDServiceName];
    connection = self->_connection;
    self->_connection = v6;

    [(WebBookmarksXPCConnection *)self->_connection setDelegate:self];
    v8 = self->_connection;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __32__SafariFetcherServerProxy_init__block_invoke;
    v20[3] = &unk_2643DBE48;
    objc_copyWeak(&v21, &location);
    [(WebBookmarksXPCConnection *)v8 setHandler:v20 forMessageNamed:kSafariFetcherDidFinishFetchingMessageName];
    v9 = self->_connection;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __32__SafariFetcherServerProxy_init__block_invoke_2;
    v18[3] = &unk_2643DBE48;
    objc_copyWeak(&v19, &location);
    [(WebBookmarksXPCConnection *)v9 setHandler:v18 forMessageNamed:kSafariFetcherDidUpdateProgressMessageName];
    v10 = self->_connection;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __32__SafariFetcherServerProxy_init__block_invoke_3;
    v16[3] = &unk_2643DBE48;
    objc_copyWeak(&v17, &location);
    [(WebBookmarksXPCConnection *)v10 setHandler:v16 forMessageNamed:kSafariFetcherDidStartFetchingItemMessageName];
    v11 = self->_connection;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __32__SafariFetcherServerProxy_init__block_invoke_4;
    v14[3] = &unk_2643DBE48;
    objc_copyWeak(&v15, &location);
    [(WebBookmarksXPCConnection *)v11 setHandler:v14 forMessageNamed:kSafariFetcherDidStopFetchingItemMessageName];
    self = self;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __32__SafariFetcherServerProxy_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didFinishFetching];
}

void __32__SafariFetcherServerProxy_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained didUpdateProgressWithMessage:v4];
}

void __32__SafariFetcherServerProxy_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained didStartFetchingReadingListItemWithMessage:v4];
}

void __32__SafariFetcherServerProxy_init__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained didStopFetchingReadingListItemWithMessage:v4];
}

- (void)connection:(id)a3 didCloseWithError:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    connection = self->_connection;
    id v7 = [(WebBookmarksXPCConnection *)connection messageWithName:kSafariFetcherRegisterForReadingListFetcherUpdatesMessageName];
    [(WebBookmarksXPCConnection *)connection sendMessage:v7];
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = objc_storeWeak((id *)&self->_delegate, a3);
  v5 = &kSafariFetcherUnregisterForReadingListFetcherUpdatesMessageName;
  if (a3) {
    v5 = &kSafariFetcherRegisterForReadingListFetcherUpdatesMessageName;
  }
  v6 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:*v5];
  [(WebBookmarksXPCConnection *)self->_connection sendMessage:v6];
}

- (void)startReadingListFetcher
{
  id v3 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kSafariFetcherStartReadingListFetcherMessageName];
  [(WebBookmarksXPCConnection *)self->_connection sendMessage:v3];
}

- (void)clearAllReadingListArchives
{
  id v3 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kSafariFetcherClearAllReadingListArchivesMessageName];
  [(WebBookmarksXPCConnection *)self->_connection sendMessage:v3];
}

- (void)clearReadingListArchiveWithUUID:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kSafariFetcherClearReadingListArchiveMessageName];
    xpc_dictionary_set_string(v4, kWebBookmarksUUIDKey, (const char *)[v5 UTF8String]);
    [(WebBookmarksXPCConnection *)self->_connection sendMessage:v4];
  }
}

- (void)didStartFetchingReadingListItemWithMessage:(id)a3
{
  xpc_object_t xdict = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, kWebBookmarksUUIDKey));
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 bookmarksServerProxy:self didStartFetchingReadingListItem:v6];
  }
}

- (void)didStopFetchingReadingListItemWithMessage:(id)a3
{
  xpc_object_t xdict = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, kWebBookmarksUUIDKey));
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 bookmarksServerProxy:self didStopFetchingReadingListItem:v6];
  }
}

- (void)didUpdateProgressWithMessage:(id)a3
{
  xpc_object_t xdict = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = xpc_dictionary_get_double(xdict, kWebBookmarksProgressKey);
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 bookmarksServerProxy:self didUpdateReadingListFetchingProgress:v6];
  }
}

- (void)didFinishFetching
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 bookmarksServerProxyDidFinishFetching:self];
  }
}

- (WebBookmarksClientDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WebBookmarksClientDelegateProtocol *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end