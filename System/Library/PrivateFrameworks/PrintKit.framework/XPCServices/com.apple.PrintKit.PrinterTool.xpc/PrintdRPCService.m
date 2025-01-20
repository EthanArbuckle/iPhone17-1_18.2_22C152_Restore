@interface PrintdRPCService
- (IPPSession)ippNetworkingSession;
- (PrintdRPCService)initWithXPCConnection:(id)a3;
- (id)_ippNetworkingSession:(BOOL)a3;
- (id)getLogCategory;
- (id)getLogLeader;
- (id)ippNetworkingSessionForStreaming;
- (void)_checkAccessState:(id)a3 reply:(id)a4;
- (void)_commonInvalidation;
- (void)_endpointResolve:(id)a3 timeout:(double)a4 reply:(id)a5;
- (void)_getPrinterDescription:(id)a3 assertReachability:(BOOL)a4 reply:(id)a5;
- (void)_identifyPrinter:(id)a3 message:(id)a4 actions:(id)a5;
- (void)_interrupted;
- (void)_invalidated;
- (void)_queryPrinter:(id)a3 attributes:(id)a4 reply:(id)a5;
- (void)_realPathForTmpReply:(id)a3;
- (void)_removeKeychainItem:(id)a3;
- (void)addPrinterToiCloudWithInfo:(id)a3;
- (void)browseInfoForPrinter:(id)a3 timeout:(double)a4 reply:(id)a5;
- (void)cancelJob:(int)a3;
- (void)finishRequestWithCancel:(BOOL)a3 reply:(id)a4;
- (void)getJobUpdateStatus:(int)a3 includeThumbnail:(BOOL)a4 reply:(id)a5;
- (void)getLastUsedPrintersForCurrentNetworkReply:(id)a3;
- (void)getRecentJobsReply:(id)a3;
- (void)getiCloudPrintersReply:(id)a3;
- (void)logiCloudPrintersReply:(id)a3;
- (void)removePrinterFromiCloudWithInfo:(id)a3;
- (void)resetPKCloudData;
- (void)setLastUsedPrintersForCurrentNetwork:(id)a3;
- (void)setiCloudPrinters:(id)a3;
- (void)startBrowsing:(id)a3 provenance:(unint64_t)a4;
- (void)startStreamingRequest:(id)a3 printSettings:(id)a4 reply:(id)a5;
- (void)startStreamingRequestWithPrinter:(id)a3 printSettings:(id)a4 completionHandler:(id)a5;
- (void)translationsForPrinter:(id)a3 languageCode:(id)a4 reply:(id)a5;
- (void)updateiCloudPrinterDisplayName:(id)a3 newDisplayName:(id)a4;
- (void)updateiCloudPrinterLocation:(id)a3 newLocation:(id)a4;
@end

@implementation PrintdRPCService

- (PrintdRPCService)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PrintdRPCService;
  v6 = [(PrintdRPCService *)&v25 init];
  if (v6)
  {
    v7 = objc_opt_class();
    objc_sync_enter(v7);
    int v8 = dword_1000C8920++;
    v6->_uint64_t clientID = v8;
    objc_sync_exit(v7);

    objc_storeStrong((id *)&v6->_connection, a3);
    objc_initWeak(&location, v6);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004D47C;
    v22[3] = &unk_1000A2308;
    objc_copyWeak(&v23, &location);
    [(NSXPCConnection *)v6->_connection setInterruptionHandler:v22];
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_10004D4E8;
    v20 = &unk_1000A2308;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v6->_connection setInvalidationHandler:&v17];
    uint64_t clientID = v6->_clientID;
    id v10 = (id)[(NSXPCConnection *)v6->_connection processIdentifier];
    id v11 = (id)[(NSXPCConnection *)v6->_connection effectiveUserIdentifier];
    uint64_t v12 = +[NSString stringWithFormat:@"<xpc %d from %d/%d>", clientID, v10, v11, v17, v18, v19, v20];
    logLeader = v6->_logLeader;
    v6->_logLeader = (NSString *)v12;

    v14 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      connection = v6->_connection;
      *(_DWORD *)buf = 138543362;
      v27 = connection;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Accepted incoming connection from %{public}@", buf, 0xCu);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)getLogLeader
{
  return self->_logLeader;
}

- (id)getLogCategory
{
  return PKLogCategoryDefault[0];
}

- (void)_commonInvalidation
{
  spoolClient = self->_spoolClient;
  if (spoolClient) {
    [(job_spool_client_t *)spoolClient invalidate];
  }
  browser = self->_browser;
  if (browser)
  {
    [(BrowseService *)browser stopBrowsing];
    id v5 = self->_browser;
    self->_browser = 0;
  }
  if (self->_standardSession)
  {
    v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      standardSession = self->_standardSession;
      int v12 = 138543362;
      v13 = standardSession;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Releasing standard session %{public}@", (uint8_t *)&v12, 0xCu);
    }

    int v8 = self->_standardSession;
    self->_standardSession = 0;
  }
  if (self->_streamingSession)
  {
    v9 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      streamingSession = self->_streamingSession;
      int v12 = 138543362;
      v13 = streamingSession;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Releasing streaming session %{public}@", (uint8_t *)&v12, 0xCu);
    }

    id v11 = self->_streamingSession;
    self->_streamingSession = 0;
  }
}

- (void)_interrupted
{
  v3 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "interrupted", v5, 2u);
  }

  [(PrintdRPCService *)self _commonInvalidation];
  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;
  }
}

- (void)_invalidated
{
  v3 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invalidated", v5, 2u);
  }

  [(PrintdRPCService *)self _commonInvalidation];
  connection = self->_connection;
  self->_connection = 0;
}

- (IPPSession)ippNetworkingSession
{
  standardSession = self->_standardSession;
  if (!standardSession)
  {
    v4 = [(PrintdRPCService *)self _ippNetworkingSession:0];
    id v5 = self->_standardSession;
    self->_standardSession = v4;

    standardSession = self->_standardSession;
  }

  return standardSession;
}

- (id)ippNetworkingSessionForStreaming
{
  streamingSession = self->_streamingSession;
  if (!streamingSession)
  {
    v4 = [(PrintdRPCService *)self _ippNetworkingSession:1];
    id v5 = self->_streamingSession;
    self->_streamingSession = v4;

    streamingSession = self->_streamingSession;
  }

  return streamingSession;
}

- (id)_ippNetworkingSession:(BOOL)a3
{
  BOOL v3 = a3;
  memset(&v18, 0, sizeof(v18));
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  if ((*(void *)v18.val & *(void *)&v18.val[2] & *(void *)&v18.val[4] & *(void *)&v18.val[6]) != -1)
  {
    audit_token_t token = v18;
    v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    v7 = v6;
    if (v6)
    {
      CFStringRef v8 = SecTaskCopySigningIdentifier(v6, 0);
      CFRelease(v7);
      if (v8)
      {
        v9 = &off_100094CE0;
        if (!v3) {
          v9 = off_100094CD8;
        }
        id v10 = (IPPControlLogging *)objc_alloc(*v9);
        id v11 = [(IPPControlLogging *)v10 initWithBundleIdentifier:v8 clientID:self->_clientID];
        if (PreserveControlFiles)
        {
          int v12 = +[NSString stringWithFormat:@"%@-%d", v8, self->_clientID];
          v13 = [[IPPControlLogging alloc] initWithIdentifier:v12];
          [(IPPControlLogging *)v11 setControlLogging:v13];
        }
        CFRelease(v8);
        goto LABEL_15;
      }
    }
  }
  v14 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No bundle identifier for %{public}@, using the global session", buf, 0xCu);
  }

  id v11 = +[IPPSession globalSession];
  if (PreserveControlFiles)
  {
    id v10 = [[IPPControlLogging alloc] initWithIdentifier:@"PrinterToolGlobal"];
    [(IPPControlLogging *)v11 setControlLogging:v10];
LABEL_15:
  }
  v15 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = (PrintdRPCService *)v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created ipp session %{public}@", buf, 0xCu);
  }

  return v11;
}

- (void)startStreamingRequestWithPrinter:(id)a3 printSettings:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [[job_spool_client_t alloc] initWithClientID:self->_clientID printer:v8 printSettings:v9];
  spoolClient = self->_spoolClient;
  self->_spoolClient = v11;

  v13 = self->_spoolClient;
  if (v13)
  {
    [(job_spool_client_t *)v13 startStreamingCompletionHandler:v10];
  }
  else
  {
    v14 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [v9 debugDescription];
      int v16 = 138543618;
      id v17 = v8;
      __int16 v18 = 2114;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not create spool for printer %{public}@ and print settings %{public}@", (uint8_t *)&v16, 0x16u);
    }
    v10[2](v10, 0);
  }
}

- (void)startStreamingRequest:(id)a3 printSettings:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "startStreamingRequest", (uint8_t *)buf, 2u);
  }

  if (self->_spoolClient)
  {
    int v12 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Only one spool client allowed at a time", (uint8_t *)buf, 2u);
    }

    v10[2](v10, 0);
  }
  else
  {
    objc_initWeak(buf, self);
    v13 = [(PrintdRPCService *)self ippNetworkingSessionForStreaming];
    v14 = [v13 ippEndpoint:v8];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004DF9C;
    v15[3] = &unk_1000A34D8;
    objc_copyWeak(&v19, buf);
    id v16 = v9;
    __int16 v18 = v10;
    id v17 = v8;
    +[lite_printer_t withLitePrinterForSessionEndpoint:v14 completionHandler:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
  }
}

- (void)finishRequestWithCancel:(BOOL)a3 reply:(id)a4
{
  v6 = (void (**)(id, void))a4;
  v7 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "finishRequestWithCancel", v12, 2u);
  }

  spoolClient = self->_spoolClient;
  if (spoolClient)
  {
    id v9 = spoolClient;
    id v10 = self->_spoolClient;
    self->_spoolClient = 0;

    if (a3)
    {
      [(job_spool_client_t *)v9 invalidate];
      v6[2](v6, 0);
    }
    else
    {
      id v11 = [(PrintdRPCService *)self ippNetworkingSessionForStreaming];
      [(job_spool_client_t *)v9 submitRequestWithSession:v11 completionHandler:v6];
    }
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)translationsForPrinter:(id)a3 languageCode:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "translationsForPrinter", buf, 2u);
  }

  [(PrintdRPCService *)self ippNetworkingSession];
  id v12 = [(id)objc_claimAutoreleasedReturnValue() ippURL:v8];
  id v13 = v9;
  id v14 = v10;
  sub_100014980(buf, 0xBu, @"translationsForPrinter");
}

- (void)cancelJob:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cancelJob", (uint8_t *)&v10, 2u);
  }

  v6 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.printing.getjoblist"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    +[lite_job_t cancelJob:v3];
  }
  else
  {
    id v8 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      int v10 = 138543362;
      id v11 = connection;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Client %{public}@ doesn't have getjoblist entitlement", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)getRecentJobsReply:(id)a3
{
  id v4 = a3;
  id v5 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getRecentJobsReply", (uint8_t *)&v10, 2u);
  }

  v6 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.printing.getjoblist"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    +[lite_job_t getAllJobsCompletionHandler:v4];
  }
  else
  {
    id v8 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      int v10 = 138543362;
      id v11 = connection;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Client %{public}@ doesn't have getjoblist entitlement", (uint8_t *)&v10, 0xCu);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)getJobUpdateStatus:(int)a3 includeThumbnail:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = (void (**)(id, void))a5;
  id v9 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "getJobUpdateStatus:includeThumbnail:reply:", (uint8_t *)&v14, 2u);
  }

  int v10 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.printing.getjoblist"];
  unsigned __int8 v11 = [v10 BOOLValue];

  if (v11)
  {
    +[lite_job_t getJobAttributes:v6 includeThumbnail:v5 completionHandler:v8];
  }
  else
  {
    id v12 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      int v14 = 138543362;
      v15 = connection;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Client %{public}@ doesn't have getjoblist entitlement", (uint8_t *)&v14, 0xCu);
    }

    v8[2](v8, 0);
  }
}

- (void)startBrowsing:(id)a3 provenance:(unint64_t)a4
{
  id v6 = a3;
  unsigned __int8 v7 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "startBrowsing", v14, 2u);
  }

  id v8 = getPrintdRPCBrowseProtocolInterface();
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v8];

  id v9 = [BrowseService alloc];
  int v10 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  unsigned __int8 v11 = [(PrintdRPCService *)self ippNetworkingSession];
  id v12 = [(BrowseService *)v9 initWithProxy:v10 session:v11];
  browser = self->_browser;
  self->_browser = v12;

  [(BrowseService *)self->_browser startBrowsing:v6 provenance:a4];
}

- (void)browseInfoForPrinter:(id)a3 timeout:(double)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "browseInfoForPrinter: %{public}@", buf, 0xCu);
  }

  int v10 = +[lite_printer_t existingPrinterWithEndpoint:v7];
  unsigned __int8 v11 = v10;
  if (v10)
  {
    id v12 = [v10 browseInfo];
    v8[2](v8, v12);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10004EE38;
    v13[3] = &unk_1000A3500;
    int v14 = v8;
    [v7 resolveWithinPrinterToolWithTimeout:v13 completionHandler:a4];
    id v12 = v14;
  }
}

- (void)_endpointResolve:(id)a3 timeout:(double)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_endpointResolve: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  +[PKPrinterBonjourEndpoint resolveEndpoint:v7 timeout:v8 completionHandler:a4];
}

- (void)getLastUsedPrintersForCurrentNetworkReply:(id)a3
{
  uint64_t v3 = (void (**)(id, void *, void *))a3;
  id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getLastUsedPrintersForCurrentNetworkReply", v8, 2u);
  }

  BOOL v5 = liteGetPrintersForCurrentNetwork();
  id v6 = [v5 networkName];
  id v7 = [v5 printers];
  v3[2](v3, v6, v7);
}

- (void)setLastUsedPrintersForCurrentNetwork:(id)a3
{
  uint64_t v3 = (NSDictionary *)a3;
  id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setLastUsedPrintersForCurrentNetwork", v5, 2u);
  }

  liteAddPrinterForCurrentNetwork(v3);
}

- (void)getiCloudPrintersReply:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getiCloudPrintersReply", v6, 2u);
  }

  BOOL v5 = liteGetiCloudPrinters();
  v3[2](v3, v5);
}

- (void)setiCloudPrinters:(id)a3
{
  uint64_t v3 = (NSArray *)a3;
  id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setiCloudPrinters", v5, 2u);
  }

  liteSetiCloudPrinters(v3);
}

- (void)addPrinterToiCloudWithInfo:(id)a3
{
  uint64_t v3 = (NSDictionary *)a3;
  id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "addPrinterToiCloudWithInfo", v5, 2u);
  }

  liteAddPrinterToiCloudWithInfo(v3);
}

- (void)removePrinterFromiCloudWithInfo:(id)a3
{
  uint64_t v3 = (NSDictionary *)a3;
  id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "addPrinterToiCloudWithInfo", v5, 2u);
  }

  liteRemovePrinterFromiCloudWithInfo(v3);
}

- (void)updateiCloudPrinterDisplayName:(id)a3 newDisplayName:(id)a4
{
  BOOL v5 = (NSDictionary *)a3;
  id v6 = (NSString *)a4;
  id v7 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updateiCloudPrinterDisplayName", v8, 2u);
  }

  liteUpdateiCloudPrinterDisplayName(v5, v6);
}

- (void)updateiCloudPrinterLocation:(id)a3 newLocation:(id)a4
{
  BOOL v5 = (NSDictionary *)a3;
  id v6 = (NSString *)a4;
  id v7 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updateiCloudPrinterDisplayName", v8, 2u);
  }

  liteUpdateiCloudPrinterLocation(v5, v6);
}

- (void)resetPKCloudData
{
  v2 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "resetPKCloudData", v3, 2u);
  }

  liteResetPKCloudData();
}

- (void)logiCloudPrintersReply:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "logiCloudPrinters", v6, 2u);
  }

  BOOL v5 = liteLogiCloudPrinters();
  v3[2](v3, v5);
}

- (void)_checkAccessState:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_checkAccessState: %{public}@", buf, 0xCu);
  }

  id v9 = [(PrintdRPCService *)self ippNetworkingSession];
  int v10 = [v9 ippEndpoint:v6];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004F8C4;
  v12[3] = &unk_1000A3528;
  id v11 = v7;
  v12[4] = self;
  id v13 = v11;
  +[lite_printer_t withLitePrinterForSessionEndpoint:v10 completionHandler:v12];
}

- (void)_identifyPrinter:(id)a3 message:(id)a4 actions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_identifyPrinter: %{public}@", buf, 0xCu);
  }

  id v12 = [(PrintdRPCService *)self ippNetworkingSession];
  id v13 = [v12 ippEndpoint:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004FB58;
  v16[3] = &unk_1000A3550;
  v16[4] = self;
  id v14 = v9;
  id v17 = v14;
  id v15 = v10;
  id v18 = v15;
  +[lite_printer_t withLitePrinterForSessionEndpoint:v13 completionHandler:v16];
}

- (void)_getPrinterDescription:(id)a3 assertReachability:(BOOL)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_getPrinterDescription: %{public}@", buf, 0xCu);
  }

  id v11 = [(PrintdRPCService *)self ippNetworkingSession];
  id v12 = [v11 ippEndpoint:v8];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004FDA4;
  v14[3] = &unk_1000A3578;
  id v13 = v9;
  BOOL v16 = a4;
  v14[4] = self;
  id v15 = v13;
  +[lite_printer_t withLitePrinterForSessionEndpoint:v12 completionHandler:v14];
}

- (void)_queryPrinter:(id)a3 attributes:(id)a4 reply:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSString stringWithFormat:@"_queryPrinter(%@)", self->_logLeader];
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d/%@", "-[PrintdRPCService _queryPrinter:attributes:reply:]", 587, v10);

  id v12 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v13 = [(PrintdRPCService *)self ippNetworkingSession];
  id v14 = [v13 ippEndpoint:v18];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005011C;
  v19[3] = &unk_1000A35C8;
  id v15 = v9;
  id v23 = v15;
  id v16 = v11;
  id v20 = v16;
  id v17 = v8;
  id v21 = v17;
  v22 = self;
  +[lite_printer_t withLitePrinterForSessionEndpoint:v14 completionHandler:v19];
}

- (void)_removeKeychainItem:(id)a3
{
  id v3 = a3;
  id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_removeKeychainItem: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  BOOL v5 = +[lite_printer_t existingPrinterWithEndpoint:v3];
  id v6 = v5;
  if (v5) {
    liteNotifyClearPassword(v5);
  }
}

- (void)_realPathForTmpReply:(id)a3
{
  BOOL v5 = (void (**)(id, void *))a3;
  id v3 = NSTemporaryDirectory();
  id v4 = +[NSURL fileURLWithPath:v3];
  v5[2](v5, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingSession, 0);
  objc_storeStrong((id *)&self->_standardSession, 0);
  objc_storeStrong((id *)&self->_debugDict, 0);
  objc_storeStrong((id *)&self->_logLeader, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_spoolClient, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end