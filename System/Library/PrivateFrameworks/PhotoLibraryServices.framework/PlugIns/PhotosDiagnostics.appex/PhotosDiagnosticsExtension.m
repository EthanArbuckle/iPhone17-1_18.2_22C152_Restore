@interface PhotosDiagnosticsExtension
- (PhotosDiagnosticsExtension)init;
- (id)_bundleIDFromParameters:(id)a3;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)latestArchiveWithinTimeCutoff:(double)a3 nameExclude:(id)a4;
- (id)photosDiagnosticIncludingDatabases:(BOOL)a3 bundleID:(id)a4;
- (void)diagnosticServiceStateDidChange:(char)a3 outputURL:(id)a4 error:(id)a5;
- (void)photosDiagnosticDone;
@end

@implementation PhotosDiagnosticsExtension

- (void).cxx_destruct
{
}

- (void)diagnosticServiceStateDidChange:(char)a3 outputURL:(id)a4 error:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v6)
  {
LABEL_7:
    [(PhotosDiagnosticsExtension *)self photosDiagnosticDone];
    goto LABEL_8;
  }
  if (v6 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v9 localizedFailureReason];
      v11 = (void *)v10;
      CFStringRef v12 = @"<unknown reason>";
      if (v10) {
        CFStringRef v12 = (const __CFString *)v10;
      }
      int v13 = 138543362;
      CFStringRef v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error running diagnose: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_bundleIDFromParameters:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"DEExtensionAttachmentsParamBundleIDKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(&off_1000045D0, "containsObject:", v9, (void)v12) & 1) == 0)
          {
            id v10 = v9;
            goto LABEL_13;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v10 = 0;
LABEL_13:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  if ([v5 isEqualToString:@"com.apple.symptomsd-diag"]) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = [v5 isEqualToString:@"com.apple.symptomsd"];
  }
  uint64_t v7 = [(PhotosDiagnosticsExtension *)self latestArchiveWithinTimeCutoff:0 nameExclude:600.0];
  BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v7) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "running for %@", buf, 0xCu);
    }
    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "running for symptomsd/AutoBugCapture: skip databases and deleteOnAttach", buf, 2u);
    }
    id v10 = [(PhotosDiagnosticsExtension *)self _bundleIDFromParameters:v4];
    uint64_t v11 = [(PhotosDiagnosticsExtension *)self photosDiagnosticIncludingDatabases:v6 ^ 1 bundleID:v10];

    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Returning %@ as attachment", buf, 0xCu);
      }
      long long v13 = +[DEAttachmentItem attachmentWithPath:v11];
      long long v14 = v13;
      if (v6) {
        [v13 setDeleteOnAttach:&__kCFBooleanTrue];
      }
      v17 = v14;
      long long v15 = +[NSArray arrayWithObjects:&v17 count:1];

      uint64_t v7 = (void *)v11;
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = CPLDiagnosticsService;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ did not generate a Photos Diagnostic", buf, 0xCu);
      }
      uint64_t v7 = 0;
      long long v15 = &__NSArray0__struct;
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = CPLDiagnosticsName;
      __int16 v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "found recent %@: %@", buf, 0x16u);
    }
    id v10 = +[DEAttachmentItem attachmentWithPath:v7];
    v18 = v10;
    long long v15 = +[NSArray arrayWithObjects:&v18 count:1];
  }

  return v15;
}

- (id)attachmentList
{
  v3 = +[PLDiagnostics logDirectoryURL];
  id v4 = +[PLDiagnostics matchingNameExpression];
  id v5 = +[PLDiagnostics excludingNameExpression];
  unsigned int v6 = [(PhotosDiagnosticsExtension *)self filesInDir:v3 matchingPattern:v4 excludingPattern:v5];

  return v6;
}

- (void)photosDiagnosticDone
{
  doneHandler = (void (**)(id, SEL))self->_doneHandler;
  if (doneHandler)
  {
    doneHandler[2](doneHandler, a2);
    id v4 = self->_doneHandler;
    self->_doneHandler = 0;
  }
}

- (id)photosDiagnosticIncludingDatabases:(BOOL)a3 bundleID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "run photos diagnostics", buf, 2u);
  }
  id v7 = objc_alloc((Class)NSXPCConnection);
  id v8 = [v7 initWithServiceName:CPLDiagnosticsService];
  BOOL v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPLDiagnoseServiceProtocol];
  [v8 setRemoteObjectInterface:v9];

  id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPLDiagnoseServiceClientProtocol];
  [v8 setExportedInterface:v10];

  [v8 setExportedObject:self];
  [v8 resume];
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  BOOL v12 = +[NSNumber numberWithBool:v4];
  [v11 setObject:v12 forKeyedSubscript:@"IncludeDatabases"];

  if (v6)
  {
    [v11 setObject:v6 forKeyedSubscript:@"DiagnosticBundleID"];
    [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ExcludeSPLAndSyndication"];
  }
  [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:@"IncludeSysdiagnose"];
  dispatch_block_t v13 = dispatch_block_create((dispatch_block_flags_t)0, &stru_100004200);
  id doneHandler = self->_doneHandler;
  self->_id doneHandler = v13;

  id v15 = objc_retainBlock(v13);
  *(void *)buf = 0;
  v22 = buf;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100002830;
  v25 = sub_100002840;
  id v26 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100002848;
  v20[3] = &unk_100004228;
  v20[4] = self;
  v16 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100002924;
  v19[3] = &unk_100004250;
  v19[4] = buf;
  [v16 runDiagnoseWithOptions:v11 replyHandler:v19];

  if (*((void *)v22 + 5)) {
    dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
  [v8 invalidate];
  id v17 = *((id *)v22 + 5);
  _Block_object_dispose(buf, 8);

  return v17;
}

- (id)latestArchiveWithinTimeCutoff:(double)a3 nameExclude:(id)a4
{
  id v5 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100002830;
  v25 = sub_100002840;
  id v26 = +[NSDate distantPast];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100002830;
  v19 = sub_100002840;
  id v20 = 0;
  NSURLResourceKey v27 = NSURLCreationDateKey;
  id v6 = +[NSArray arrayWithObjects:&v27 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100002CE0;
  v11[3] = &unk_1000041C0;
  id v7 = v5;
  id v12 = v7;
  dispatch_block_t v13 = &v21;
  long long v14 = &v15;
  +[PLDiagnostics enumerateDiagnosticsURLsIncludingPropertyiesForKeys:v6 handler:v11];

  id v8 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:-a3];
  if ([(id)v22[5] compare:v8] == (id)1)
  {
    BOOL v9 = [(id)v16[5] path];
  }
  else
  {
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (PhotosDiagnosticsExtension)init
{
  v5.receiver = self;
  v5.super_class = (Class)PhotosDiagnosticsExtension;
  v2 = [(PhotosDiagnosticsExtension *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PhotosDiagnosticsExtension *)v2 setLoggingConsent:CPLDiagnosticsConsentText];
  }
  return v3;
}

@end