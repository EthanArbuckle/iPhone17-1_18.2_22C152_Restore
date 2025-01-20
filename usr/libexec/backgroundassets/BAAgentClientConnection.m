@interface BAAgentClientConnection
- (BAAgentClientConnection)initWithNSXPCConnection:(id)a3 error:(id *)a4;
- (BABlockQueue)exclusiveAccessBlockQueue;
- (BOOL)_entitledForCloudKitWithDownload:(id)a3 outError:(id *)a4;
- (BOOL)connectionIsValid;
- (BOOL)isActive;
- (BOOL)isApplication;
- (NSString)applicationBundleIdentifier;
- (NSString)clientBundleIdentifier;
- (NSString)debugDescription;
- (NSString)signingIdentifier;
- (NSUUID)lastExclusiveAccessBlockToken;
- (OS_dispatch_queue)clientHandlerQueue;
- (OS_dispatch_queue)clientWorkQueue;
- (id)extendClientSandboxForStagedURL:(id)a3 allowWrites:(BOOL)a4;
- (void)_validateAndSetClientIdentifier;
- (void)callBlockWhenConnectionReady:(id)a3 onQueue:(id)a4;
- (void)cancelDownload:(id)a3 reply:(id)a4;
- (void)connectionInvalidated;
- (void)currentDownloads:(id)a3;
- (void)dealloc;
- (void)downloadIdentifier:(id)a3 didFailWithError:(id)a4 wasHandled:(id)a5;
- (void)downloadIdentifier:(id)a3 didReceiveChallenge:(id)a4 authChallengeHandler:(id)a5 withCompletion:(id)a6;
- (void)downloadIdentifier:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)downloadIdentifierDidBegin:(id)a3;
- (void)downloadIdentifierDidFinish:(id)a3 sandboxExtensionToken:(id)a4 wasHandled:(id)a5;
- (void)downloadIdentifierDidPause:(id)a3;
- (void)exclusiveControlExitedWithToken:(id)a3;
- (void)markPurgeableWithFileURL:(id)a3 sandboxToken:(id)a4 reply:(id)a5;
- (void)performWithExclusiveControlBeforeDate:(id)a3 handler:(id)a4;
- (void)performWithExclusiveControlWithHandler:(id)a3;
- (void)removeDownloadIdentifier:(id)a3;
- (void)scheduleDownload:(id)a3 reply:(id)a4;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setClientHandlerQueue:(id)a3;
- (void)setClientWorkQueue:(id)a3;
- (void)setConnectionIsValid:(BOOL)a3;
- (void)setExclusiveAccessBlockQueue:(id)a3;
- (void)setIsApplication:(BOOL)a3;
- (void)setLastExclusiveAccessBlockToken:(id)a3;
- (void)setSigningIdentifier:(id)a3;
- (void)startForegroundDownload:(id)a3 reply:(id)a4;
- (void)syncDownloads:(id)a3;
@end

@implementation BAAgentClientConnection

- (BAAgentClientConnection)initWithNSXPCConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_1000695D8 != -1) {
    dispatch_once(&qword_1000695D8, &stru_10005D8D8);
  }
  v67.receiver = self;
  v67.super_class = (Class)BAAgentClientConnection;
  v7 = [(BAAgentConnection *)&v67 initWithNSXPCConnection:v6 error:a4];
  if (v7)
  {
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BAAgentClientXPCProtocol];
    v83[0] = objc_opt_class();
    v83[1] = objc_opt_class();
    v83[2] = objc_opt_class();
    v83[3] = objc_opt_class();
    v9 = +[NSArray arrayWithObjects:v83 count:4];
    v10 = +[NSSet setWithArray:v9];
    [v8 setClasses:v10 forSelector:"currentDownloads:" argumentIndex:0 ofReply:1];

    uint64_t v82 = objc_opt_class();
    v11 = +[NSArray arrayWithObjects:&v82 count:1];
    v12 = +[NSSet setWithArray:v11];
    [v8 setClasses:v12 forSelector:"performWithExclusiveControlBeforeDate:handler:" argumentIndex:0 ofReply:0];

    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    v13 = +[NSArray arrayWithObjects:v81 count:2];
    v14 = +[NSSet setWithArray:v13];
    v64 = v8;
    [v8 setClasses:v14 forSelector:"scheduleDownload:reply:" argumentIndex:0 ofReply:0];

    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    v15 = +[NSArray arrayWithObjects:v80 count:2];
    v16 = +[NSSet setWithArray:v15];
    [v8 setClasses:v16 forSelector:"startForegroundDownload:reply:" argumentIndex:0 ofReply:0];

    v17 = [(BAAgentConnection *)v7 connection];
    [v17 setExportedInterface:v8];

    v18 = [(BAAgentConnection *)v7 connection];
    [v18 setExportedObject:v7];

    v19 = [(BAAgentConnection *)v7 connection];
    id v20 = [v19 processIdentifier];
    v21 = +[NSUUID UUID];
    v22 = [v21 UUIDString];
    v23 = +[NSString stringWithFormat:@"%d.%@.worker", v20, v22];

    v24 = [(BAAgentConnection *)v7 connection];
    id v25 = [v24 processIdentifier];
    v26 = +[NSUUID UUID];
    v27 = [v26 UUIDString];
    v28 = +[NSString stringWithFormat:@"%d.%@.handler", v25, v27];

    id v63 = v23;
    dispatch_queue_t v29 = dispatch_queue_create((const char *)[v63 UTF8String], 0);
    [(BAAgentClientConnection *)v7 setClientWorkQueue:v29];

    id v30 = v28;
    dispatch_queue_t v31 = dispatch_queue_create((const char *)[v30 UTF8String], 0);
    [(BAAgentClientConnection *)v7 setClientHandlerQueue:v31];

    v32 = [(BAAgentClientConnection *)v7 clientWorkQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100034ADC;
    block[3] = &unk_10005C998;
    v33 = v7;
    v66 = v33;
    dispatch_async(v32, block);

    v34 = [(BAAgentConnection *)v33 connection];
    v35 = [(BAAgentClientConnection *)v33 clientHandlerQueue];
    [v34 _setQueue:v35];

    v36 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BADownloadManagerSyncProtocol];
    v79[0] = objc_opt_class();
    v79[1] = objc_opt_class();
    v79[2] = objc_opt_class();
    v79[3] = objc_opt_class();
    v37 = +[NSArray arrayWithObjects:v79 count:4];
    v38 = +[NSSet setWithArray:v37];
    [v36 setClasses:v38 forSelector:"syncDownloads:" argumentIndex:0 ofReply:0];

    uint64_t v78 = objc_opt_class();
    v39 = +[NSArray arrayWithObjects:&v78 count:1];
    v40 = +[NSSet setWithArray:v39];
    [v36 setClasses:v40 forSelector:"removeDownloadIdentifier:" argumentIndex:0 ofReply:0];

    uint64_t v77 = objc_opt_class();
    v41 = +[NSArray arrayWithObjects:&v77 count:1];
    v42 = +[NSSet setWithArray:v41];
    [v36 setClasses:v42 forSelector:"downloadIdentifierDidBegin:" argumentIndex:0 ofReply:0];

    uint64_t v76 = objc_opt_class();
    v43 = +[NSArray arrayWithObjects:&v76 count:1];
    v44 = +[NSSet setWithArray:v43];
    [v36 setClasses:v44 forSelector:"downloadIdentifierDidPause:" argumentIndex:0 ofReply:0];

    uint64_t v75 = objc_opt_class();
    v45 = +[NSArray arrayWithObjects:&v75 count:1];
    v46 = +[NSSet setWithArray:v45];
    [v36 setClasses:v46 forSelector:"downloadIdentifier:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:" argumentIndex:0 ofReply:0];

    uint64_t v74 = objc_opt_class();
    v47 = +[NSArray arrayWithObjects:&v74 count:1];
    v48 = +[NSSet setWithArray:v47];
    [v36 setClasses:v48 forSelector:"downloadIdentifier:didReceiveChallenge:authChallengeHandler:" argumentIndex:0 ofReply:0];

    uint64_t v73 = objc_opt_class();
    v49 = +[NSArray arrayWithObjects:&v73 count:1];
    v50 = +[NSSet setWithArray:v49];
    [v36 setClasses:v50 forSelector:"downloadIdentifier:didReceiveChallenge:authChallengeHandler:" argumentIndex:1 ofReply:0];

    uint64_t v72 = objc_opt_class();
    v51 = +[NSArray arrayWithObjects:&v72 count:1];
    v52 = +[NSSet setWithArray:v51];
    [v36 setClasses:v52 forSelector:"downloadIdentifier:didReceiveChallenge:authChallengeHandler:" argumentIndex:1 ofReply:1];

    uint64_t v71 = objc_opt_class();
    v53 = +[NSArray arrayWithObjects:&v71 count:1];
    v54 = +[NSSet setWithArray:v53];
    [v36 setClasses:v54 forSelector:"downloadIdentifier:didFailWithError:wasHandled:" argumentIndex:0 ofReply:0];

    uint64_t v70 = objc_opt_class();
    v55 = +[NSArray arrayWithObjects:&v70 count:1];
    v56 = +[NSSet setWithArray:v55];
    [v36 setClasses:v56 forSelector:"downloadIdentifier:didFailWithError:wasHandled:" argumentIndex:1 ofReply:0];

    uint64_t v69 = objc_opt_class();
    v57 = +[NSArray arrayWithObjects:&v69 count:1];
    v58 = +[NSSet setWithArray:v57];
    [v36 setClasses:v58 forSelector:"downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:" argumentIndex:0 ofReply:0];

    uint64_t v68 = objc_opt_class();
    v59 = +[NSArray arrayWithObjects:&v68 count:1];
    v60 = +[NSSet setWithArray:v59];
    [v36 setClasses:v60 forSelector:"downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:" argumentIndex:1 ofReply:0];

    v61 = [(BAAgentConnection *)v33 connection];
    [v61 setRemoteObjectInterface:v36];
  }
  return v7;
}

- (void)connectionInvalidated
{
  v5.receiver = self;
  v5.super_class = (Class)BAAgentClientConnection;
  [(BAAgentConnection *)&v5 connectionInvalidated];
  v3 = [(BAAgentClientConnection *)self clientWorkQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034C2C;
  block[3] = &unk_10005C998;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)dealloc
{
  v3 = [(BAAgentClientConnection *)self exclusiveAccessBlockQueue];

  if (v3)
  {
    v4 = (void *)qword_1000695E0;
    objc_super v5 = [(BAAgentClientConnection *)self exclusiveAccessBlockQueue];
    [v4 invalidateBlockQueue:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)BAAgentClientConnection;
  [(BAAgentClientConnection *)&v6 dealloc];
}

- (void)currentDownloads:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BAAgentClientConnection *)self clientWorkQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034DFC;
  v7[3] = &unk_10005D900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)scheduleDownload:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAAgentClientConnection *)self clientWorkQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034FD8;
  block[3] = &unk_10005D928;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)performWithExclusiveControlWithHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BAAgentClientConnection *)self clientWorkQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035314;
  v7[3] = &unk_10005D900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)performWithExclusiveControlBeforeDate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAAgentClientConnection *)self clientWorkQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035604;
  block[3] = &unk_10005D928;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)exclusiveControlExitedWithToken:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BAAgentClientConnection *)self clientWorkQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000358D4;
  v7[3] = &unk_10005CA10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_validateAndSetClientIdentifier
{
  memset(&audittoken, 0, sizeof(audittoken));
  v3 = [(BAAgentConnection *)self connection];
  id v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&audittoken, 0, sizeof(audittoken));
  }

  CFTypeRef cf = 0;
  SecStaticCodeRef staticCode = 0;
  bzero(buffer, 0x400uLL);
  if (proc_pidpath_audittoken(&audittoken, buffer, 0x400u) < 0)
  {
    id v6 = sub_100013B54();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003B974();
    }
    goto LABEL_16;
  }
  objc_super v5 = +[NSString stringWithUTF8String:buffer];
  id v6 = v5;
  if (!v5 || ![v5 length])
  {
    id v13 = sub_100013B54();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003B9A8();
    }
    goto LABEL_13;
  }
  audit_token_t token = audittoken;
  SecTaskRef v7 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (!v7)
  {
    id v13 = sub_100013B54();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003B9DC();
    }
LABEL_13:

LABEL_16:
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  id v8 = v7;
  CFURLRef v9 = +[NSURL fileURLWithPath:v6];
  OSStatus v10 = SecStaticCodeCreateWithPath(v9, 0, &staticCode);
  if (v10)
  {
    int v11 = v10;
    id v12 = sub_100013B54();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003C09C(v11, v12);
    }
LABEL_27:
    v17 = 0;
    goto LABEL_28;
  }
  OSStatus v15 = SecCodeCopySigningInformation(staticCode, 0, (CFDictionaryRef *)&cf);
  if (v15)
  {
    int v16 = v15;
    id v12 = sub_100013B54();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003C024(v16, v12);
    }
    goto LABEL_27;
  }
  v18 = CFDictionaryGetValue((CFDictionaryRef)cf, kSecCodeInfoPList);
  if (!v18)
  {
    id v12 = sub_100013B54();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003BA10();
    }
    goto LABEL_27;
  }
  v17 = v18;
  v19 = [v18 objectForKey:@"EXAppExtensionAttributes"];
  if (v19)
  {
  }
  else
  {
    id v20 = [v17 objectForKey:@"NSExtension"];

    if (!v20)
    {
      id v69 = 0;
      audit_token_t token = audittoken;
      v37 = +[LSBundleRecord bundleRecordForAuditToken:&token error:&v69];
      id v12 = v69;
      if (v37)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v38 = [v37 bundleIdentifier];
          [(BAAgentClientConnection *)self setApplicationBundleIdentifier:v38];

          v39 = [(BAAgentClientConnection *)self applicationBundleIdentifier];
          [(BAAgentClientConnection *)self setClientBundleIdentifier:v39];

          v40 = [(BAAgentClientConnection *)self applicationBundleIdentifier];

          if (v40)
          {
            [(BAAgentClientConnection *)self setIsApplication:1];

            goto LABEL_65;
          }
          v57 = sub_100013B54();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
            sub_10003BAB0();
          }
        }
        else
        {
          v57 = sub_100013B54();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
            sub_10003BE44();
          }
        }
      }
      else
      {
        v57 = sub_100013B54();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          sub_10003BA44();
        }
      }

LABEL_96:
      goto LABEL_28;
    }
  }
  uint64_t v21 = [v17 objectForKey:kCFBundleIdentifierKey];
  if (!v21)
  {
    id v12 = sub_100013B54();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003BECC();
    }
    goto LABEL_28;
  }
  v22 = (void *)v21;
  id v70 = 0;
  audit_token_t token = audittoken;
  v23 = +[LSBundleRecord bundleRecordForAuditToken:&token error:&v70];
  id v24 = v70;
  if (!v23)
  {
    dispatch_queue_t v31 = sub_100013B54();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10003BA44();
    }
    goto LABEL_62;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    dispatch_queue_t v31 = sub_100013B54();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10003BF9C();
    }
    goto LABEL_62;
  }
  id v25 = [v23 bundleIdentifier];
  [(BAAgentClientConnection *)self setClientBundleIdentifier:v25];

  uint64_t v26 = [(BAAgentClientConnection *)self clientBundleIdentifier];
  if (!v26) {
    goto LABEL_60;
  }
  v27 = (void *)v26;
  [(BAAgentClientConnection *)self clientBundleIdentifier];
  v28 = id v66 = v24;
  id v29 = [v28 length];

  id v24 = v66;
  if (!v29)
  {
LABEL_60:
    dispatch_queue_t v31 = sub_100013B54();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10003BF00();
    }
LABEL_62:
    int v36 = 2;
    goto LABEL_63;
  }
  id v30 = [v23 containingBundleRecord];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v30 bundleIdentifier], (dispatch_queue_t v31 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v32 = sub_100013B54();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10003BF68();
    }

    dispatch_queue_t v31 = [v22 _baassets_stringByRemovingLastIdentifierComponent];
  }
  v65 = v30;
  [(BAAgentClientConnection *)self setApplicationBundleIdentifier:v31];
  uint64_t v33 = [(BAAgentClientConnection *)self applicationBundleIdentifier];
  if (v33
    && (v34 = (void *)v33,
        [(BAAgentClientConnection *)self applicationBundleIdentifier],
        v35 = objc_claimAutoreleasedReturnValue(),
        id v64 = [v35 length],
        v35,
        v34,
        v64))
  {
    [(BAAgentClientConnection *)self setIsApplication:0];
    int v36 = 0;
  }
  else
  {
    v59 = sub_100013B54();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_10003BF34();
    }

    int v36 = 2;
  }

  id v24 = v66;
LABEL_63:

  if (v36)
  {
    uint64_t v14 = 0;
    goto LABEL_30;
  }
LABEL_65:
  v41 = [(BAAgentClientConnection *)self applicationBundleIdentifier];
  id v12 = +[LSApplicationProxy applicationProxyForIdentifier:v41];

  if (!v12)
  {
    id v12 = sub_100013B54();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003BB1C(self);
    }
    goto LABEL_28;
  }
  v42 = [objc_alloc((Class)FBSApplicationInfo) initWithApplicationProxy:v12];
  if (!v42)
  {
    v37 = sub_100013B54();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10003BBA0(self);
    }
    goto LABEL_96;
  }
  v37 = v42;
  if ([v42 unauthoritativeTrustState] != (id)8)
  {
    v58 = sub_100013B54();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_10003BD98(self);
    }

    goto LABEL_96;
  }
  objc_super v67 = v37;
  v43 = [(BAAgentClientConnection *)self applicationBundleIdentifier];
  v44 = [(BAAgentClientConnection *)self applicationBundleIdentifier];
  v45 = [v44 _baassets_validUTI];
  unsigned __int8 v46 = [v43 isEqualToString:v45];

  if (v46)
  {
    v47 = [(BAAgentClientConnection *)self clientBundleIdentifier];
    v48 = [(BAAgentClientConnection *)self clientBundleIdentifier];
    v49 = [v48 _baassets_validUTI];
    unsigned __int8 v50 = [v47 isEqualToString:v49];

    if (v50)
    {
      CFErrorRef error = 0;
      v51 = (__CFString *)SecTaskCopySigningIdentifier(v8, &error);
      [(BAAgentClientConnection *)self setSigningIdentifier:v51];

      v52 = [(BAAgentClientConnection *)self signingIdentifier];

      CFErrorRef v53 = error;
      if (v52)
      {
        if (error) {
          CFRelease(error);
        }
        unsigned int v54 = [(BAAgentClientConnection *)self isApplication];
        v55 = +[BAAgentCore sharedCore];
        v56 = [(BAAgentClientConnection *)self applicationBundleIdentifier];
        if (v54)
        {
          [v55 handleApplicationLaunched:v56];
        }
        else
        {
          id v63 = [v55 applicationInfoForIdentifier:v56];

          [v63 setApplicationExtensionState:4];
        }

        uint64_t v14 = 1;
        goto LABEL_29;
      }
      v62 = sub_100013B54();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        sub_10003BC24();
      }
    }
    else
    {
      v61 = sub_100013B54();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        sub_10003BC90(self);
      }

      [(BAAgentClientConnection *)self setClientBundleIdentifier:0];
    }
  }
  else
  {
    v60 = sub_100013B54();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      sub_10003BD14(self);
    }

    [(BAAgentClientConnection *)self setApplicationBundleIdentifier:0];
  }

LABEL_28:
  uint64_t v14 = 0;
LABEL_29:

LABEL_30:
  CFRelease(v8);

  id v6 = v17;
LABEL_17:

  if (staticCode) {
    CFRelease(staticCode);
  }
  if (cf) {
    CFRelease(cf);
  }
  -[BAAgentClientConnection setConnectionIsValid:](self, "setConnectionIsValid:", v14, v64);
}

- (BOOL)_entitledForCloudKitWithDownload:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  SecTaskRef v7 = [(BAAgentConnection *)self connection];
  id v8 = [v7 valueForEntitlement:@"com.apple.developer.icloud-services"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v34;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          if (![*(id *)(*((void *)&v33 + 1) + 8 * i) caseInsensitiveCompare:@"CloudKit"])
          {

            goto LABEL_16;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 caseInsensitiveCompare:@"CloudKit"])
  {
LABEL_13:
    if (a4)
    {
      sub_100029C00(-52);
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
    goto LABEL_35;
  }
LABEL_16:
  OSStatus v15 = [(BAAgentConnection *)self connection];
  int v16 = [v15 valueForEntitlement:@"com.apple.developer.icloud-container-identifiers"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 count])
  {
    v27 = a4;
    v28 = v16;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v30;
      while (2)
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
          v23 = [v6 containerID:v27];
          id v24 = [v23 containerIdentifier];
          LOBYTE(v22) = [v24 isEqualToString:v22];

          if (v22)
          {

            id v25 = [(BAAgentClientConnection *)self signingIdentifier];
            [v6 setMasqueradeIdentifier:v25];

            BOOL v14 = 1;
            goto LABEL_33;
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    if (v27)
    {
      sub_100029C00(-54);
      BOOL v14 = 0;
      id *v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
LABEL_33:
    int v16 = v28;
  }
  else if (a4)
  {
    sub_100029C00(-53);
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

LABEL_35:
  return v14;
}

- (BOOL)isActive
{
  unsigned int v3 = [(BAAgentClientConnection *)self isApplication];
  id v4 = +[BAAgentCore sharedCore];
  objc_super v5 = [(BAAgentClientConnection *)self applicationBundleIdentifier];
  if (v3) {
    id v6 = [v4 applicationStateForIdentifier:v5];
  }
  else {
    id v6 = [v4 applicationExtensionStateForIdentifier:v5];
  }
  unint64_t v7 = (unint64_t)v6;

  return (v7 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)startForegroundDownload:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAAgentClientConnection *)self clientWorkQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000367F4;
  block[3] = &unk_10005D928;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)cancelDownload:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAAgentClientConnection *)self clientWorkQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036A68;
  block[3] = &unk_10005D1B8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)markPurgeableWithFileURL:(id)a3 sandboxToken:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BAAgentClientConnection *)self clientWorkQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100036CC0;
  v15[3] = &unk_10005D9A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)syncDownloads:(id)a3
{
  id v4 = a3;
  id v6 = [(BAAgentConnection *)self connection];
  objc_super v5 = [v6 remoteObjectProxyWithErrorHandler:&stru_10005D9C0];
  [v5 syncDownloads:v4];
}

- (void)callBlockWhenConnectionReady:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAAgentClientConnection *)self clientWorkQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003717C;
  block[3] = &unk_10005D1B8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeDownloadIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BAAgentConnection *)self connection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100037300;
  v8[3] = &unk_10005CA38;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 removeDownloadIdentifier:v6];
}

- (void)downloadIdentifierDidBegin:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BAAgentConnection *)self connection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003742C;
  v8[3] = &unk_10005CA38;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 downloadIdentifierDidBegin:v6];
}

- (void)downloadIdentifierDidPause:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BAAgentConnection *)self connection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100037558;
  v8[3] = &unk_10005CA38;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 downloadIdentifierDidPause:v6];
}

- (void)downloadIdentifier:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v10 = a3;
  id v11 = [(BAAgentConnection *)self connection];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000376A4;
  v14[3] = &unk_10005CA38;
  id v15 = v10;
  id v12 = v10;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v14];
  [v13 downloadIdentifier:v12 didWriteBytes:a4 totalBytesWritten:a5 totalBytesExpectedToWrite:a6];
}

- (void)downloadIdentifier:(id)a3 didReceiveChallenge:(id)a4 authChallengeHandler:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = dispatch_queue_create("com.apple.BAAgentClientConnection.AuthChallengeWaiter", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037830;
  block[3] = &unk_10005DA10;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)downloadIdentifier:(id)a3 didFailWithError:(id)a4 wasHandled:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(BAAgentConnection *)self connection];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100037B28;
  v18[3] = &unk_10005CA88;
  id v19 = v8;
  id v12 = v9;
  id v20 = v12;
  id v13 = v8;
  id v14 = [v11 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100037BA0;
  v16[3] = &unk_10005DA38;
  id v17 = v12;
  id v15 = v12;
  [v14 downloadIdentifier:v13 didFailWithError:v10 wasHandled:v16];
}

- (void)downloadIdentifierDidFinish:(id)a3 sandboxExtensionToken:(id)a4 wasHandled:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(BAAgentConnection *)self connection];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100037D18;
  v18[3] = &unk_10005CA88;
  id v19 = v8;
  id v12 = v9;
  id v20 = v12;
  id v13 = v8;
  id v14 = [v11 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100037D90;
  v16[3] = &unk_10005DA38;
  id v17 = v12;
  id v15 = v12;
  [v14 downloadIdentifierDidFinish:v13 sandboxExtensionToken:v10 wasHandled:v16];
}

- (id)extendClientSandboxForStagedURL:(id)a3 allowWrites:(BOOL)a4
{
  [a3 fileSystemRepresentation];
  objc_super v5 = [(BAAgentConnection *)self connection];
  id v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  id v7 = (void *)sandbox_extension_issue_file_to_process();

  int v8 = *__error();
  if (v7)
  {
    id v9 = +[NSString stringWithCString:v7 encoding:4];
    free(v7);
  }
  else
  {
    id v9 = 0;
  }
  *__error() = v8;

  return v9;
}

- (NSString)debugDescription
{
  unsigned int v3 = [(BAAgentClientConnection *)self applicationBundleIdentifier];
  id v4 = [(BAAgentClientConnection *)self clientBundleIdentifier];
  objc_super v5 = [(BAAgentConnection *)self connection];
  id v6 = [v5 processIdentifier];
  unsigned int v7 = [(BAAgentClientConnection *)self isApplication];
  CFStringRef v8 = @"NO";
  if (v7) {
    CFStringRef v8 = @"YES";
  }
  id v9 = +[NSString stringWithFormat:@"Client Connection\nApp Identifier: %@\nClient Identifier: %@\nPID: %d\nIs Client App: %@", v3, v4, v6, v8];

  return (NSString *)v9;
}

- (BOOL)isApplication
{
  return self->_isApplication;
}

- (void)setIsApplication:(BOOL)a3
{
  self->_isApplication = a3;
}

- (NSString)applicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (OS_dispatch_queue)clientHandlerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)clientWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientWorkQueue:(id)a3
{
}

- (BOOL)connectionIsValid
{
  return self->_connectionIsValid;
}

- (void)setConnectionIsValid:(BOOL)a3
{
  self->_connectionIsValid = a3;
}

- (NSString)signingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSigningIdentifier:(id)a3
{
}

- (BABlockQueue)exclusiveAccessBlockQueue
{
  return (BABlockQueue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExclusiveAccessBlockQueue:(id)a3
{
}

- (NSUUID)lastExclusiveAccessBlockToken
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastExclusiveAccessBlockToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExclusiveAccessBlockToken, 0);
  objc_storeStrong((id *)&self->_exclusiveAccessBlockQueue, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_clientWorkQueue, 0);
  objc_storeStrong((id *)&self->_clientHandlerQueue, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end