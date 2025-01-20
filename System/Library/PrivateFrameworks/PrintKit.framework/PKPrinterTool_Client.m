@interface PKPrinterTool_Client
+ (id)sharedClient;
- (PKPrinterTool_Client)init;
- (id)ptConn;
- (id)ptConn_locked;
- (void)addPrinterToiCloud:(id)a3;
- (void)browseInfoForPrinter:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)cancelJob:(int)a3;
- (void)endpointResolve:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)finishRequestWithCancel:(BOOL)a3 completionHandler:(id)a4;
- (void)getJobUpdateStatus:(int)a3 includeThumbnail:(BOOL)a4 completionHandler:(id)a5;
- (void)getLastUsedPrintersForCurrentNetworkCompletionHandler:(id)a3;
- (void)getRecentJobsCompletionHandler:(id)a3;
- (void)getiCloudPrintersWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)logiCloudPrintersCompletionHandler:(id)a3;
- (void)printerTool_checkAccessState:(id)a3 completionHandler:(id)a4;
- (void)printerTool_getPrinterDescription:(id)a3 assertReachability:(BOOL)a4 completionHandler:(id)a5;
- (void)printerTool_identifyPrinter:(id)a3 message:(id)a4 actions:(id)a5;
- (void)printerTool_queryPrinter:(id)a3 attributes:(id)a4 completionHandler:(id)a5;
- (void)printerTool_realPathForTmp:(id)a3;
- (void)printerTool_removeKeychainItem:(id)a3;
- (void)ptConn_locked;
- (void)removePrinterFromiCloud:(id)a3;
- (void)resetPKCloudData;
- (void)setLastUsedPrintersForCurrentNetwork:(id)a3;
- (void)setiCloudPrinters:(id)a3;
- (void)startStreamingRequest:(id)a3 printSettings:(id)a4 completionHandler:(id)a5;
- (void)updateiCloudPrinterDisplayName:(id)a3 newDisplayName:(id)a4;
- (void)updateiCloudPrinterLocation:(id)a3 location:(id)a4;
@end

@implementation PKPrinterTool_Client

- (PKPrinterTool_Client)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPrinterTool_Client;
  return [(PKPrinterTool_Client *)&v3 init];
}

+ (id)sharedClient
{
  if (+[PKPrinterTool_Client sharedClient]::sOnce != -1) {
    dispatch_once(&+[PKPrinterTool_Client sharedClient]::sOnce, &__block_literal_global);
  }
  v2 = (void *)+[PKPrinterTool_Client sharedClient]::sSharedClient;

  return v2;
}

- (id)ptConn
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(PKPrinterTool_Client *)v2 ptConn_locked];
  objc_sync_exit(v2);

  return v3;
}

- (id)ptConn_locked
{
  conn_needsLock = self->_conn_needsLock;
  if (!conn_needsLock)
  {
    v4 = +[PKDefaults listenerProxy];
    if (v4)
    {
      id v5 = objc_alloc(MEMORY[0x263F08D68]);
      v6 = [v4 endpoint];
      v7 = (NSXPCConnection *)[v5 initWithListenerEndpoint:v6];
      v8 = self->_conn_needsLock;
      self->_conn_needsLock = v7;

      if (!self->_conn_needsLock)
      {
        v9 = _PKLogCategory(PKLogCategoryDefault[0]);
        -[PKPrinterTool_Client ptConn_locked](v9);

        abort();
      }
    }
    else
    {
      v10 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.PrintKit.PrinterTool"];
      v11 = self->_conn_needsLock;
      self->_conn_needsLock = v10;
    }
    v12 = getPrintdRPCProtocolInterface();
    [(NSXPCConnection *)self->_conn_needsLock setRemoteObjectInterface:v12];

    v13 = self->_conn_needsLock;
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __37__PKPrinterTool_Client_ptConn_locked__block_invoke;
    v20[3] = &unk_2649E1630;
    v14 = v13;
    v21 = v14;
    objc_copyWeak(&v22, &location);
    [(NSXPCConnection *)self->_conn_needsLock setInvalidationHandler:v20];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __37__PKPrinterTool_Client_ptConn_locked__block_invoke_4;
    v17[3] = &unk_2649E1630;
    v15 = v14;
    v18 = v15;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)self->_conn_needsLock setInterruptionHandler:v17];
    [(NSXPCConnection *)self->_conn_needsLock activate];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    conn_needsLock = self->_conn_needsLock;
  }

  return conn_needsLock;
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  v4 = v2->_conn_needsLock;
  conn_needsLock = v2->_conn_needsLock;
  v2->_conn_needsLock = 0;

  objc_sync_exit(v2);
  if (v4) {
    [(NSXPCConnection *)v4 invalidate];
  }
}

- (void)getRecentJobsCompletionHandler:(id)a3
{
  id v5 = a3;
  v6 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __55__PKPrinterTool_Client_getRecentJobsCompletionHandler___block_invoke;
  v12 = &unk_2649E1658;
  SEL v14 = a2;
  id v7 = v5;
  id v13 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:&v9];

  if (v8) {
    objc_msgSend(v8, "getRecentJobsReply:", v7, v9, v10, v11, v12);
  }
  else {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)getJobUpdateStatus:(int)a3 includeThumbnail:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v9 = a5;
  uint64_t v10 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __78__PKPrinterTool_Client_getJobUpdateStatus_includeThumbnail_completionHandler___block_invoke;
  v16 = &unk_2649E1658;
  SEL v18 = a2;
  id v11 = v9;
  id v17 = v11;
  v12 = [v10 remoteObjectProxyWithErrorHandler:&v13];

  if (v12) {
    objc_msgSend(v12, "getJobUpdateStatus:includeThumbnail:reply:", v6, v5, v11, v13, v14, v15, v16);
  }
  else {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

- (void)cancelJob:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(PKPrinterTool_Client *)self ptConn];
  id v5 = [v4 remoteObjectProxy];

  if (v5) {
    [v5 cancelJob:v3];
  }
}

- (void)getLastUsedPrintersForCurrentNetworkCompletionHandler:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __78__PKPrinterTool_Client_getLastUsedPrintersForCurrentNetworkCompletionHandler___block_invoke;
  v12 = &unk_2649E1658;
  SEL v14 = a2;
  id v7 = v5;
  id v13 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:&v9];

  if (v8) {
    objc_msgSend(v8, "getLastUsedPrintersForCurrentNetworkReply:", v7, v9, v10, v11, v12);
  }
  else {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)setLastUsedPrintersForCurrentNetwork:(id)a3
{
  id v6 = a3;
  v4 = [(PKPrinterTool_Client *)self ptConn];
  id v5 = [v4 remoteObjectProxy];

  if (v5) {
    [v5 setLastUsedPrintersForCurrentNetwork:v6];
  }
}

- (void)getiCloudPrintersWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __63__PKPrinterTool_Client_getiCloudPrintersWithCompletionHandler___block_invoke;
  v12 = &unk_2649E1658;
  SEL v14 = a2;
  id v7 = v5;
  id v13 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:&v9];

  if (v8) {
    objc_msgSend(v8, "getiCloudPrintersReply:", v7, v9, v10, v11, v12);
  }
  else {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)addPrinterToiCloud:(id)a3
{
  id v7 = a3;
  v4 = [(PKPrinterTool_Client *)self ptConn];
  id v5 = [v4 remoteObjectProxy];

  if (v5)
  {
    id v6 = [v7 iCloudInfo];
    [v5 addPrinterToiCloudWithInfo:v6];
  }
}

- (void)removePrinterFromiCloud:(id)a3
{
  id v7 = a3;
  v4 = [(PKPrinterTool_Client *)self ptConn];
  id v5 = [v4 remoteObjectProxy];

  if (v5)
  {
    id v6 = [v7 iCloudInfo];
    [v5 removePrinterFromiCloudWithInfo:v6];
  }
}

- (void)updateiCloudPrinterDisplayName:(id)a3 newDisplayName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PKPrinterTool_Client *)self ptConn];
  v8 = [v7 remoteObjectProxy];

  if (v8)
  {
    uint64_t v9 = [v10 iCloudInfo];
    [v8 updateiCloudPrinterDisplayName:v9 newDisplayName:v6];
  }
}

- (void)updateiCloudPrinterLocation:(id)a3 location:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PKPrinterTool_Client *)self ptConn];
  v8 = [v7 remoteObjectProxy];

  if (v8)
  {
    uint64_t v9 = [v10 iCloudInfo];
    [v8 updateiCloudPrinterLocation:v9 newLocation:v6];
  }
}

- (void)setiCloudPrinters:(id)a3
{
  id v6 = a3;
  v4 = [(PKPrinterTool_Client *)self ptConn];
  id v5 = [v4 remoteObjectProxy];

  if (v5) {
    [v5 setiCloudPrinters:v6];
  }
}

- (void)resetPKCloudData
{
  v2 = [(PKPrinterTool_Client *)self ptConn];
  id v3 = [v2 remoteObjectProxy];

  if (v3) {
    [v3 resetPKCloudData];
  }
}

- (void)logiCloudPrintersCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __59__PKPrinterTool_Client_logiCloudPrintersCompletionHandler___block_invoke;
  v12 = &unk_2649E1658;
  SEL v14 = a2;
  id v7 = v5;
  id v13 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:&v9];

  if (v8) {
    objc_msgSend(v8, "logiCloudPrintersReply:", v7, v9, v10, v11, v12);
  }
  else {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)browseInfoForPrinter:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __71__PKPrinterTool_Client_browseInfoForPrinter_timeout_completionHandler___block_invoke;
  id v17 = &unk_2649E1658;
  SEL v19 = a2;
  id v12 = v10;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:&v14];

  if (v13) {
    objc_msgSend(v13, "browseInfoForPrinter:timeout:reply:", v9, v12, a4, v14, v15, v16, v17);
  }
  else {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

- (void)endpointResolve:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __66__PKPrinterTool_Client_endpointResolve_timeout_completionHandler___block_invoke;
  id v17 = &unk_2649E1658;
  SEL v19 = a2;
  id v12 = v10;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:&v14];

  if (v13) {
    objc_msgSend(v13, "_endpointResolve:timeout:reply:", v9, v12, a4, v14, v15, v16, v17);
  }
  else {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

- (void)printerTool_realPathForTmp:(id)a3
{
  id v5 = a3;
  id v6 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __51__PKPrinterTool_Client_printerTool_realPathForTmp___block_invoke;
  id v12 = &unk_2649E1658;
  SEL v14 = a2;
  id v7 = v5;
  id v13 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:&v9];

  if (v8) {
    objc_msgSend(v8, "_realPathForTmpReply:", v7, v9, v10, v11, v12);
  }
  else {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)printerTool_removeKeychainItem:(id)a3
{
  id v6 = a3;
  v4 = [(PKPrinterTool_Client *)self ptConn];
  id v5 = [v4 remoteObjectProxy];

  if (v5) {
    [v5 _removeKeychainItem:v6];
  }
}

- (void)printerTool_identifyPrinter:(id)a3 message:(id)a4 actions:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(PKPrinterTool_Client *)self ptConn];
  id v11 = [v10 remoteObjectProxy];

  if (v11) {
    [v11 _identifyPrinter:v12 message:v8 actions:v9];
  }
}

- (void)printerTool_getPrinterDescription:(id)a3 assertReachability:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __95__PKPrinterTool_Client_printerTool_getPrinterDescription_assertReachability_completionHandler___block_invoke;
  id v17 = &unk_2649E1658;
  SEL v19 = a2;
  id v12 = v10;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:&v14];

  if (v13) {
    objc_msgSend(v13, "_getPrinterDescription:assertReachability:reply:", v9, v6, v12, v14, v15, v16, v17);
  }
  else {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

- (void)printerTool_queryPrinter:(id)a3 attributes:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(PKPrinterTool_Client *)self ptConn];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__PKPrinterTool_Client_printerTool_queryPrinter_attributes_completionHandler___block_invoke;
  v17[3] = &unk_2649E1658;
  SEL v19 = a2;
  id v13 = v11;
  id v18 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v17];

  if (v14)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __78__PKPrinterTool_Client_printerTool_queryPrinter_attributes_completionHandler___block_invoke_2;
    v15[3] = &unk_2649E1680;
    id v16 = v13;
    [v14 _queryPrinter:v9 attributes:v10 reply:v15];
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

- (void)printerTool_checkAccessState:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __71__PKPrinterTool_Client_printerTool_checkAccessState_completionHandler___block_invoke;
  uint64_t v15 = &unk_2649E1658;
  SEL v17 = a2;
  id v10 = v8;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:&v12];

  if (v11) {
    objc_msgSend(v11, "_checkAccessState:reply:", v7, v10, v12, v13, v14, v15);
  }
  else {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 3);
  }
}

- (void)startStreamingRequest:(id)a3 printSettings:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  SEL v17 = __78__PKPrinterTool_Client_startStreamingRequest_printSettings_completionHandler___block_invoke;
  id v18 = &unk_2649E1658;
  SEL v20 = a2;
  id v13 = v11;
  id v19 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:&v15];

  if (v14) {
    objc_msgSend(v14, "startStreamingRequest:printSettings:reply:", v9, v10, v13, v15, v16, v17, v18);
  }
  else {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

- (void)finishRequestWithCancel:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  streamHandle = self->_streamHandle;
  if (streamHandle)
  {
    [(NSFileHandle *)streamHandle closeFile];
    id v9 = self->_streamHandle;
    self->_streamHandle = 0;
  }
  id v10 = [(PKPrinterTool_Client *)self ptConn];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __66__PKPrinterTool_Client_finishRequestWithCancel_completionHandler___block_invoke;
  uint64_t v16 = &unk_2649E1658;
  SEL v18 = a2;
  id v11 = v7;
  id v17 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:&v13];

  if (v12) {
    objc_msgSend(v12, "finishRequestWithCancel:reply:", v4, v11, v13, v14, v15, v16);
  }
  else {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamHandle, 0);

  objc_storeStrong((id *)&self->_conn_needsLock, 0);
}

- (void)ptConn_locked
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22EA54000, a1, OS_LOG_TYPE_DEFAULT, "Couldn't create an XLC connection from proxy listener", v2, 2u);
  }
}

@end