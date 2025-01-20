@interface BADownloaderExtensionProxy
- (BAApplicationInfo)applicationInfo;
- (BADownloaderExtensionProxy)initWithExtension:(id)a3 XPCConnection:(id)a4 applicationInfo:(id)a5;
- (BOOL)sendAuthenticationChallenge:(id)a3 download:(id)a4 completionHandler:(id)a5;
- (BOOL)sentTerminatonMessage;
- (BOOL)sentWillTerminateMessage;
- (NSString)debugDescription;
- (NSString)identifier;
- (NSTimer)exitTimer;
- (NSXPCConnection)extensionConnection;
- (OS_dispatch_queue)shutdownQueue;
- (_EXExtensionProcess)extensionProcess;
- (id)extendClientSandboxForStagedURL:(id)a3 allowWrites:(BOOL)a4;
- (unint64_t)extensionActiveCalls;
- (unint64_t)extensionWakeAssertions;
- (void)_checkForExit;
- (void)_sendingMessage;
- (void)_startExitTimer;
- (void)backgroundDownload:(id)a3 failedWithError:(id)a4 completionHandler:(id)a5;
- (void)backgroundDownload:(id)a3 finishedWithSandboxToken:(id)a4 completionHandler:(id)a5;
- (void)decrementWakeAssertionWithReply:(id)a3;
- (void)extensionWillTerminate;
- (void)incrementWakeAssertionWithReply:(id)a3;
- (void)invalidate;
- (void)markPurgeableWithFileURL:(id)a3 sandboxToken:(id)a4 reply:(id)a5;
- (void)requestDownloadsWithContentRequest:(int64_t)a3 manifestURL:(id)a4 extensionInfo:(id)a5 completion:(id)a6;
- (void)setApplicationInfo:(id)a3;
- (void)setExitTimer:(id)a3;
- (void)setExtensionActiveCalls:(unint64_t)a3;
- (void)setExtensionConnection:(id)a3;
- (void)setExtensionProcess:(id)a3;
- (void)setExtensionWakeAssertions:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setSentTerminatonMessage:(BOOL)a3;
- (void)setSentWillTerminateMessage:(BOOL)a3;
- (void)setShutdownQueue:(id)a3;
- (void)wakeupForTokenWithReply:(id)a3;
@end

@implementation BADownloaderExtensionProxy

- (BADownloaderExtensionProxy)initWithExtension:(id)a3 XPCConnection:(id)a4 applicationInfo:(id)a5
{
  id v64 = a3;
  id v65 = a4;
  id v66 = a5;
  v84.receiver = self;
  v84.super_class = (Class)BADownloaderExtensionProxy;
  v8 = [(BADownloaderExtensionProxy *)&v84 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_21;
  }
  [(BADownloaderExtensionProxy *)v8 setExtensionConnection:v65];
  [(BADownloaderExtensionProxy *)v9 setExtensionProcess:v64];
  [(BADownloaderExtensionProxy *)v9 setApplicationInfo:v66];
  v63 = [v66 applicationIdentifier];
  v62 = [v63 _baassets_validUTI];
  if (([v62 isEqualToString:v63] & 1) == 0)
  {

LABEL_22:
    v60 = 0;
    goto LABEL_23;
  }
  [(BADownloaderExtensionProxy *)v9 setIdentifier:v62];
  v10 = [(BADownloaderExtensionProxy *)v9 identifier];
  id v11 = +[NSString stringWithFormat:@"com.apple.backgroundassets.extension.%@.shutdown_queue", v10];
  dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
  [(BADownloaderExtensionProxy *)v9 setShutdownQueue:v12];

  v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BADownloaderExtensionSyncProtocol];
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v13 setClasses:v14 forSelector:"downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:" argumentIndex:1 ofReply:0];

  v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v13 setClasses:v15 forSelector:"downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:" argumentIndex:2 ofReply:0];

  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v13 setClasses:v16 forSelector:"downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:" argumentIndex:3 ofReply:0];

  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, objc_opt_class(), 0);
  [v13 setClasses:v19 forSelector:"downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:" argumentIndex:1 ofReply:1];

  v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v13 setClasses:v20 forSelector:"receivedAuthenticationChallenge:download:completionHandler:" argumentIndex:0 ofReply:0];

  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
  [v13 setClasses:v24 forSelector:"receivedAuthenticationChallenge:download:completionHandler:" argumentIndex:1 ofReply:0];

  v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v13 setClasses:v25 forSelector:"receivedAuthenticationChallenge:download:completionHandler:" argumentIndex:1 ofReply:1];

  v87[0] = objc_opt_class();
  v87[1] = objc_opt_class();
  v87[2] = objc_opt_class();
  v87[3] = objc_opt_class();
  v26 = +[NSArray arrayWithObjects:v87 count:4];
  v27 = +[NSSet setWithArray:v26];
  [v13 setClasses:v27 forSelector:"backgroundDownload:failedWithError:completionHandler:" argumentIndex:0 ofReply:0];

  v86[0] = objc_opt_class();
  v86[1] = objc_opt_class();
  v86[2] = objc_opt_class();
  v86[3] = objc_opt_class();
  v28 = +[NSArray arrayWithObjects:v86 count:4];
  v29 = +[NSSet setWithArray:v28];
  [v13 setClasses:v29 forSelector:"backgroundDownload:finishedWithSandboxToken:completionHandler:" argumentIndex:0 ofReply:0];

  uint64_t v85 = objc_opt_class();
  v30 = +[NSArray arrayWithObjects:&v85 count:1];
  v31 = +[NSSet setWithArray:v30];
  [v13 setClasses:v31 forSelector:"backgroundDownload:finishedWithSandboxToken:completionHandler:" argumentIndex:1 ofReply:0];

  v32 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BADownloaderExtensionClientSyncProtocol];
  v33 = [(BADownloaderExtensionProxy *)v9 extensionConnection];
  [v33 setRemoteObjectInterface:v13];

  v34 = [(BADownloaderExtensionProxy *)v9 extensionConnection];
  [v34 setExportedInterface:v32];

  v35 = [(BADownloaderExtensionProxy *)v9 extensionConnection];
  [v35 setExportedObject:v9];

  v36 = v9;
  v37 = [(BADownloaderExtensionProxy *)v36 extensionConnection];
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_100009630;
  v81[3] = &unk_10005CA10;
  id v38 = v62;
  id v82 = v38;
  v39 = v36;
  v83 = v39;
  [v37 setInterruptionHandler:v81];

  v40 = [(BADownloaderExtensionProxy *)v39 extensionConnection];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100009684;
  v78[3] = &unk_10005CA10;
  id v41 = v38;
  id v79 = v41;
  v42 = v39;
  v80 = v42;
  [v40 setInvalidationHandler:v78];

  v43 = [(BADownloaderExtensionProxy *)v42 extensionConnection];
  [v43 resume];

  v44 = sub_100013B54();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Attempting to wakeup extension connection.\n", buf, 2u);
  }

  *(void *)buf = 0;
  v75 = buf;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  dispatch_semaphore_t v45 = dispatch_semaphore_create(0);
  v46 = [(BADownloaderExtensionProxy *)v42 extensionConnection];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100009754;
  v72[3] = &unk_10005CA38;
  v47 = v45;
  v73 = v47;
  v48 = [v46 remoteObjectProxyWithErrorHandler:v72];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000097BC;
  v69[3] = &unk_10005CA60;
  v71 = buf;
  v49 = v47;
  v70 = v49;
  [v48 wakeupForTokenWithReply:v69];

  dispatch_time_t v50 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v49, v50))
  {
    v51 = sub_100013B54();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_1000387A0(v51);
    }
LABEL_8:

    v52 = [(BADownloaderExtensionProxy *)v42 extensionConnection];
    [v52 invalidate];

    v53 = [(BADownloaderExtensionProxy *)v42 exitTimer];
    [v53 invalidate];

    char v54 = 0;
    goto LABEL_20;
  }
  if (!v75[24])
  {
    v51 = sub_100013B54();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_10003875C(v51);
    }
    goto LABEL_8;
  }
  v55 = sub_100013B54();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v68 = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Wakeup extension succeeded.\n", v68, 2u);
  }

  v56 = [(BADownloaderExtensionProxy *)v42 applicationInfo];
  [v56 willLaunchExtension];

  v57 = [(BADownloaderExtensionProxy *)v42 applicationInfo];
  v58 = [(BADownloaderExtensionProxy *)v42 extensionConnection];
  v59 = v58;
  if (v58) {
    [v58 auditToken];
  }
  else {
    memset(v67, 0, sizeof(v67));
  }
  [v57 determineInstallSourceIfUnsetFromAuditToken:v67];

  [(BADownloaderExtensionProxy *)v42 _startExitTimer];
  char v54 = 1;
LABEL_20:

  _Block_object_dispose(buf, 8);
  if ((v54 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_21:
  v60 = v9;
LABEL_23:

  return v60;
}

- (void)requestDownloadsWithContentRequest:(int64_t)a3 manifestURL:(id)a4 extensionInfo:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(BADownloaderExtensionProxy *)self extendClientSandboxForStagedURL:v10 allowWrites:0];
  if (v13)
  {
    [(BADownloaderExtensionProxy *)self _sendingMessage];
    v14 = [(BADownloaderExtensionProxy *)self extensionConnection];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000099CC;
    v21[3] = &unk_10005CA88;
    v21[4] = self;
    id v15 = v12;
    id v22 = v15;
    v16 = [v14 remoteObjectProxyWithErrorHandler:v21];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100009A6C;
    v19[3] = &unk_10005CAB0;
    v19[4] = self;
    id v20 = v15;
    [v16 downloadsForRequest:a3 manifestURL:v10 manifestToken:v13 extensionInfo:v11 completionHandler:v19];
  }
  else
  {
    uint64_t v17 = sub_100013B54();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000388D8();
    }

    uint64_t v18 = +[NSSet set];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v18);
  }
}

- (BOOL)sendAuthenticationChallenge:(id)a3 download:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  [(BADownloaderExtensionProxy *)self _sendingMessage];
  id v11 = [(BADownloaderExtensionProxy *)self extensionConnection];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009C48;
  v17[3] = &unk_10005CAD8;
  v17[4] = self;
  v17[5] = &v18;
  id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009CC0;
  v15[3] = &unk_10005CB00;
  id v13 = v10;
  v15[4] = self;
  id v16 = v13;
  [v12 receivedAuthenticationChallenge:v8 download:v9 completionHandler:v15];

  LOBYTE(self) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)self;
}

- (void)extensionWillTerminate
{
  v3 = [(BADownloaderExtensionProxy *)self extensionConnection];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009D9C;
  v5[3] = &unk_10005CA38;
  v5[4] = self;
  v4 = [v3 remoteObjectProxyWithErrorHandler:v5];
  [v4 extensionWillTerminate];
}

- (void)backgroundDownload:(id)a3 failedWithError:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(BADownloaderExtensionProxy *)self _sendingMessage];
  id v11 = [(BADownloaderExtensionProxy *)self extensionConnection];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009F60;
  v17[3] = &unk_10005CA88;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009FE0;
  v15[3] = &unk_10005CB28;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 backgroundDownload:v10 failedWithError:v9 completionHandler:v15];
}

- (void)backgroundDownload:(id)a3 finishedWithSandboxToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(BADownloaderExtensionProxy *)self _sendingMessage];
  id v11 = [(BADownloaderExtensionProxy *)self extensionConnection];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000A184;
  v17[3] = &unk_10005CA88;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A204;
  v15[3] = &unk_10005CB28;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 backgroundDownload:v10 finishedWithSandboxToken:v9 completionHandler:v15];
}

- (void)wakeupForTokenWithReply:(id)a3
{
  id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"wakeupForTokenWithReply should never be called on the proxy object, it is for internal use only" userInfo:0];
  [v3 raise];
}

- (id)extendClientSandboxForStagedURL:(id)a3 allowWrites:(BOOL)a4
{
  [a3 fileSystemRepresentation];
  v5 = [(BADownloaderExtensionProxy *)self extensionConnection];
  v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  v7 = (void *)sandbox_extension_issue_file_to_process();

  if (v7)
  {
    id v8 = +[NSString stringWithCString:v7 encoding:4];
    free(v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)invalidate
{
  id v3 = sub_100013BEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(BADownloaderExtensionProxy *)self identifier];
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating connection to extension: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v5 = [(BADownloaderExtensionProxy *)self extensionConnection];
  [v5 invalidate];

  [(BADownloaderExtensionProxy *)self setExtensionConnection:0];
  v6 = [(BADownloaderExtensionProxy *)self extensionProcess];
  [v6 invalidate];

  [(BADownloaderExtensionProxy *)self setExtensionProcess:0];
}

- (void)_sendingMessage
{
  id v3 = [(BADownloaderExtensionProxy *)self shutdownQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A52C;
  block[3] = &unk_10005C998;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_checkForExit
{
  id v3 = [(BADownloaderExtensionProxy *)self shutdownQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A604;
  block[3] = &unk_10005C998;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_startExitTimer
{
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  v4 = [(BADownloaderExtensionProxy *)self shutdownQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A734;
  block[3] = &unk_10005C998;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (NSString)debugDescription
{
  dispatch_time_t v3 = [(BADownloaderExtensionProxy *)self exitTimer];
  v4 = [v3 fireDate];

  [v4 timeIntervalSinceNow];
  uint64_t v6 = v5;
  int v7 = [(BADownloaderExtensionProxy *)self identifier];
  id v8 = [(BADownloaderExtensionProxy *)self extensionConnection];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Extension Proxy\nIdentifier: %@\nPID: %d\nExtension Termination Time: %@ (%.2lf seconds remaining)\n", v7, [v8 processIdentifier], v4, v6);

  return (NSString *)v9;
}

- (void)markPurgeableWithFileURL:(id)a3 sandboxToken:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  [a4 UTF8String];
  if (sandbox_extension_consume() == -1)
  {
    uint64_t v15 = *__error();
    CFStringRef v23 = @"FileURL";
    id v16 = v7;
    if (!v7)
    {
      id v16 = +[NSNull null];
    }
    v24 = v16;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v18 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v15 userInfo:v17];

    if (!v7) {
    v19 = sub_100029C14(@"BAErrorDomain", -108, v18);
    }
    v8[2](v8, 0, v19);
  }
  else
  {
    uint64_t v20 = 66564;
    id v9 = v7;
    if (fsctl((const char *)objc_msgSend(v9, "fileSystemRepresentation", 66564), 0xC0084A44uLL, &v20, 0))
    {
      uint64_t v10 = *__error();
      CFStringRef v21 = @"FileURL";
      id v11 = v9;
      if (!v9)
      {
        id v11 = +[NSNull null];
      }
      id v22 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v13 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v10 userInfo:v12];

      if (!v9) {
      sandbox_extension_release();
      }
      id v14 = sub_100029C14(@"BAErrorDomain", -57, v13);
      v8[2](v8, 0, v14);
    }
    else
    {
      sandbox_extension_release();
      v8[2](v8, 1, 0);
    }
  }
}

- (void)decrementWakeAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  uint64_t v5 = [(BADownloaderExtensionProxy *)self shutdownQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AD90;
  block[3] = &unk_10005C998;
  block[4] = self;
  dispatch_sync(v5, block);

  [(BADownloaderExtensionProxy *)self _checkForExit];
  v4[2](v4);
}

- (void)incrementWakeAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  uint64_t v5 = [(BADownloaderExtensionProxy *)self shutdownQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AEC8;
  block[3] = &unk_10005C998;
  block[4] = self;
  dispatch_sync(v5, block);

  v4[2](v4);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (OS_dispatch_queue)shutdownQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setShutdownQueue:(id)a3
{
}

- (NSXPCConnection)extensionConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtensionConnection:(id)a3
{
}

- (BAApplicationInfo)applicationInfo
{
  return (BAApplicationInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationInfo:(id)a3
{
}

- (NSTimer)exitTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExitTimer:(id)a3
{
}

- (_EXExtensionProcess)extensionProcess
{
  return (_EXExtensionProcess *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtensionProcess:(id)a3
{
}

- (unint64_t)extensionActiveCalls
{
  return self->_extensionActiveCalls;
}

- (void)setExtensionActiveCalls:(unint64_t)a3
{
  self->_extensionActiveCalls = a3;
}

- (unint64_t)extensionWakeAssertions
{
  return self->_extensionWakeAssertions;
}

- (void)setExtensionWakeAssertions:(unint64_t)a3
{
  self->_extensionWakeAssertions = a3;
}

- (BOOL)sentWillTerminateMessage
{
  return self->_sentWillTerminateMessage;
}

- (void)setSentWillTerminateMessage:(BOOL)a3
{
  self->_sentWillTerminateMessage = a3;
}

- (BOOL)sentTerminatonMessage
{
  return self->_sentTerminatonMessage;
}

- (void)setSentTerminatonMessage:(BOOL)a3
{
  self->_sentTerminatonMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_exitTimer, 0);
  objc_storeStrong((id *)&self->_applicationInfo, 0);
  objc_storeStrong((id *)&self->_extensionConnection, 0);
  objc_storeStrong((id *)&self->_shutdownQueue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end