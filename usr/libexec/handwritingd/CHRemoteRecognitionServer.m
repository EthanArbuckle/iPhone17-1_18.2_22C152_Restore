@interface CHRemoteRecognitionServer
+ (BOOL)_hasEntitlement:(id)a3 connection:(id)a4;
+ (id)_unableToProcessRequestErrorWithBundleIdentifier:(id)a3;
+ (id)sharedRemoteRecognitionServer;
- (BOOL)_shouldFulfillRemoteRequestForConnection:(id)a3 error:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CHRemoteRecognitionServer)init;
- (void)_synthesizeStyleInventoryIfNeededWithConnection:(id)a3;
- (void)dealloc;
- (void)handleInventoryRequest:(id)a3 withReply:(id)a4;
- (void)handleInventoryStatusRequestWithReply:(id)a3;
- (void)handleLineWrappingRequest:(id)a3 withReply:(id)a4;
- (void)handlePowerLoggingRequest:(id)a3;
- (void)handleRecognitionRequest:(id)a3 withReply:(id)a4;
- (void)handleRequest:(id)a3 withReply:(id)a4;
- (void)handleSessionStateUpdate:(id)a3;
- (void)handleSketchRecognitionRequest:(id)a3 withReply:(id)a4;
- (void)optimizeResourceUsage;
- (void)resumeConnectionIfIdle;
- (void)transcriptionPathsForTokenizedTextResult:(id)a3 recognitionRequest:(id)a4 withReply:(id)a5;
@end

@implementation CHRemoteRecognitionServer

+ (id)sharedRemoteRecognitionServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000808C;
  block[3] = &unk_100024828;
  block[4] = a1;
  if (qword_10002B0F0 == -1)
  {
    v2 = (void *)qword_10002B0E8;
  }
  else
  {
    dispatch_once(&qword_10002B0F0, block);
    v2 = (void *)qword_10002B0E8;
  }
  return v2;
}

- (CHRemoteRecognitionServer)init
{
  v38.receiver = self;
  v38.super_class = (Class)CHRemoteRecognitionServer;
  id v2 = [(CHRemoteRecognitionServer *)&v38 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.handwritingd.remoterecognition"];
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    [*((id *)v2 + 1) setDelegate:v2];
    *((unsigned char *)v2 + 24) = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.handwritingd.ServerQueue", v6);
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    dispatch_workloop_t v9 = dispatch_workloop_create("com.apple.handwritingd.recognitionProcessingWorkloop");
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    dispatch_workloop_t v11 = dispatch_workloop_create("com.apple.handwritingd.synthesisProcessingWorkloop");
    v12 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("com.apple.handwritingd.HighPriorityRecognitionProcessingQueue", v14, *((dispatch_queue_t *)v2 + 6));
    v16 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v15;

    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("com.apple.handwritingd.HighPrioritySynthesisProcessingQueue", v14, *((dispatch_queue_t *)v2 + 13));
    v18 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v21 = dispatch_queue_create_with_target_V2("com.apple.handwritingd.LowPriorityRecognitionProcessingQueue", v20, *((dispatch_queue_t *)v2 + 6));
    v22 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v25 = dispatch_queue_create_with_target_V2("com.apple.handwritingd.BackgroundPriorityRecognitionProcessingQueue", v24, *((dispatch_queue_t *)v2 + 13));
    v26 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v25;

    v27 = [[CHRemoteRecognitionRequestHandler alloc] initWithServerQueue:*((void *)v2 + 2) lowPriorityQueue:*((void *)v2 + 5) highPriorityQueue:*((void *)v2 + 4)];
    v28 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v27;

    v29 = [[CHRemoteSynthesisRequestHandler alloc] initWithServerQueue:*((void *)v2 + 2) lowPriorityQueue:*((void *)v2 + 12) highPriorityQueue:*((void *)v2 + 11) recognitionHandler:*((void *)v2 + 8)];
    v30 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v29;

    v31 = [[CHRemoteLineWrappingRequestHandler alloc] initWithServerQueue:*((void *)v2 + 2) lowPriorityQueue:*((void *)v2 + 5) highPriorityQueue:*((void *)v2 + 4)];
    v32 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v31;

    v33 = [(CHRemoteBasicRequestHandler *)[CHRemotePowerLoggingRequestHandler alloc] initWithServerQueue:*((void *)v2 + 2)];
    v34 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v33;

    id v35 = objc_alloc_init((Class)CHSessionStateCounter);
    v36 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v35;
  }
  return (CHRemoteRecognitionServer *)v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  recognitionProcessingWorkloop = self->_recognitionProcessingWorkloop;
  self->_recognitionProcessingWorkloop = 0;

  highPriorityRecognitionProcessingQueue = self->_highPriorityRecognitionProcessingQueue;
  self->_highPriorityRecognitionProcessingQueue = 0;

  lowPriorityRecognitionProcessingQueue = self->_lowPriorityRecognitionProcessingQueue;
  self->_lowPriorityRecognitionProcessingQueue = 0;

  serverQueue = self->_serverQueue;
  self->_serverQueue = 0;

  v7.receiver = self;
  v7.super_class = (Class)CHRemoteRecognitionServer;
  [(CHRemoteRecognitionServer *)&v7 dealloc];
}

+ (BOOL)_hasEntitlement:(id)a3 connection:(id)a4
{
  v5 = (__CFString *)a3;
  id v6 = a4;
  objc_super v7 = v6;
  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  v8 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  dispatch_workloop_t v9 = v8;
  if (v8)
  {
    CFErrorRef error = 0;
    CFBooleanRef v10 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v8, v5, &error);
    CFBooleanRef v11 = v10;
    if (v10)
    {
      CFTypeID v12 = CFGetTypeID(v10);
      BOOL v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue(v11) != 0;
      CFRelease(v11);
    }
    else
    {
      BOOL v13 = 0;
    }
    CFRelease(v9);
    if (error) {
      CFRelease(error);
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldFulfillRemoteRequestForConnection:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", [v5 processIdentifier]);
  objc_super v7 = +[RBSProcessHandle handleForIdentifier:v6 error:0];

  v8 = [v7 currentState];
  dispatch_workloop_t v9 = sub_100007ED4(v5);
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  CFBooleanRef v10 = (id)qword_10002B138;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138412290;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "_shouldFulfillRemoteRequestForConnection bundleIdentifier: %@", (uint8_t *)&v23, 0xCu);
  }

  if ([v8 taskState] == 4 || objc_msgSend(v8, "taskState") == 2)
  {
    CFBooleanRef v11 = [v8 endowmentNamespaces];
    unsigned int v12 = [v11 containsObject:@"com.apple.frontboard.visibility"];

    if (qword_10002B188 == -1) {
      goto LABEL_8;
    }
LABEL_22:
    dispatch_once(&qword_10002B188, &stru_100024A60);
    BOOL v13 = (id)qword_10002B138;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  unsigned int v12 = 0;
  if (qword_10002B188 != -1) {
    goto LABEL_22;
  }
LABEL_8:
  BOOL v13 = (id)qword_10002B138;
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_12;
  }
LABEL_9:
  CFStringRef v14 = @"NO";
  if (v12) {
    CFStringRef v14 = @"YES";
  }
  int v23 = 138412546;
  v24 = v9;
  __int16 v25 = 2112;
  CFStringRef v26 = v14;
  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "_shouldFulfillRemoteRequestForConnection bundleIdentifier: %@ isForegroundClient: %@", (uint8_t *)&v23, 0x16u);
LABEL_12:

  if (v12)
  {
LABEL_19:
    LOBYTE(v18) = 1;
    goto LABEL_20;
  }
  unsigned int v15 = [(id)objc_opt_class() _hasEntitlement:@"com.apple.handwritingd.allowBackgroundRecognition" connection:v5];
  if (qword_10002B188 == -1)
  {
    v16 = (id)qword_10002B138;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
  }
  else
  {
    dispatch_once(&qword_10002B188, &stru_100024A60);
    v16 = (id)qword_10002B138;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
  }
  CFStringRef v17 = @"NO";
  if (v15) {
    CFStringRef v17 = @"YES";
  }
  int v23 = 138412546;
  v24 = v9;
  __int16 v25 = 2112;
  CFStringRef v26 = v17;
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "_shouldFulfillRemoteRequestForConnection bundleIdentifier: %@ hasBackgroundRecognitionEntitlement: %@", (uint8_t *)&v23, 0x16u);
LABEL_18:

  if (v15) {
    goto LABEL_19;
  }
  LODWORD(v18) = [v9 hasPrefix:@"com.apple.PaperKit.extension"];
  if (qword_10002B188 == -1)
  {
    v20 = (id)qword_10002B138;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
LABEL_26:
      CFStringRef v21 = @"NO";
      if (v18) {
        CFStringRef v21 = @"YES";
      }
      int v23 = 138412546;
      v24 = v9;
      __int16 v25 = 2112;
      CFStringRef v26 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "_shouldFulfillRemoteRequestForConnection bundleIdentifier: %@ is white listed bundle: %@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    dispatch_once(&qword_10002B188, &stru_100024A60);
    v20 = (id)qword_10002B138;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
  }

  if (a4) {
    char v22 = (char)v18;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    v18 = sub_100007ED4(v5);
    *a4 = [(id)objc_opt_class() _unableToProcessRequestErrorWithBundleIdentifier:v18];

    LOBYTE(v18) = 0;
  }
LABEL_20:

  return (char)v18;
}

- (void)_synthesizeStyleInventoryIfNeededWithConnection:(id)a3
{
  id v8 = a3;
  v4 = +[CHSynthesisRequestOptions synthesisOptionsWithSynthesizeCharacterInventoryBehavior:1];
  id v5 = [objc_alloc((Class)CHRemoteSynthesisRequest) initWithString:&stru_1000257A0 drawing:0 options:v4 requestType:0];
  synthesisRequestHandler = self->_synthesisRequestHandler;
  objc_super v7 = sub_100007ED4(v8);
  [(CHRemoteSynthesisRequestHandler *)synthesisRequestHandler handleRequest:v5 withReply:&stru_100024AA0 bundleIdentifier:v7];
}

- (void)handleRecognitionRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, void, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v8 = (id)qword_10002B118;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle recognition requests", buf, 2u);
    }
  }
  dispatch_workloop_t v9 = +[NSXPCConnection currentConnection];
  id v14 = 0;
  unsigned __int8 v10 = [(CHRemoteRecognitionServer *)self _shouldFulfillRemoteRequestForConnection:v9 error:&v14];
  id v11 = v14;
  if (v10)
  {
    recognitionRequestHandler = self->_recognitionRequestHandler;
    BOOL v13 = sub_100007ED4(v9);
    [(CHRemoteRecognitionRequestHandler *)recognitionRequestHandler handleRequest:v6 withReply:v7 bundleIdentifier:v13];
  }
  else
  {
    v7[2](v7, 0, v11);
  }
}

- (void)transcriptionPathsForTokenizedTextResult:(id)a3 recognitionRequest:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_isListening)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v11 = (id)qword_10002B118;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle recognition requests", buf, 2u);
    }
  }
  unsigned int v12 = +[NSXPCConnection currentConnection];
  id v17 = 0;
  unsigned __int8 v13 = [(CHRemoteRecognitionServer *)self _shouldFulfillRemoteRequestForConnection:v12 error:&v17];
  id v14 = v17;
  if (v13)
  {
    recognitionRequestHandler = self->_recognitionRequestHandler;
    v16 = sub_100007ED4(v12);
    [(CHRemoteRecognitionRequestHandler *)recognitionRequestHandler transcriptionPathsForTokenizedTextResult:v8 recognitionRequest:v9 withReply:v10 bundleIdentifier:v16];
  }
  else
  {
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v14);
  }
}

- (void)handleRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, void, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v8 = (id)qword_10002B118;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle synthesis requests", buf, 2u);
    }
  }
  id v9 = +[NSXPCConnection currentConnection];
  id v16 = 0;
  unsigned __int8 v10 = [(CHRemoteRecognitionServer *)self _shouldFulfillRemoteRequestForConnection:v9 error:&v16];
  id v11 = v16;
  if (v10)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    unsigned int v12 = (id)qword_10002B118;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Handling remote synthesis request: %@", buf, 0xCu);
    }

    synthesisRequestHandler = self->_synthesisRequestHandler;
    id v14 = sub_100007ED4(v9);
    [(CHRemoteSynthesisRequestHandler *)synthesisRequestHandler handleRequest:v6 withReply:v7 bundleIdentifier:v14];
  }
  else
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    unsigned int v15 = (id)qword_10002B160;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handling remote synthesis request was not fullfilled due to: %@", buf, 0xCu);
    }

    v7[2](v7, 0, v11);
  }
}

- (void)handleInventoryRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, void, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v8 = (id)qword_10002B118;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle inventory requests", buf, 2u);
    }
  }
  if (qword_10002B100 != -1) {
    dispatch_once(&qword_10002B100, &stru_100024AC0);
  }
  id v9 = +[NSXPCConnection currentConnection];
  id v17 = 0;
  unsigned int v10 = [(CHRemoteRecognitionServer *)self _shouldFulfillRemoteRequestForConnection:v9 error:&v17];
  id v11 = v17;
  if (!v10) {
    goto LABEL_18;
  }
  unsigned int v12 = sub_100007ED4(v9);
  unsigned int v13 = [(id)qword_10002B0F8 containsObject:v12];
  if (!v12)
  {
    if ((os_variant_has_internal_diagnostics() | v13)) {
      goto LABEL_12;
    }
LABEL_18:
    v7[2](v7, 0, v11);
    goto LABEL_19;
  }

  if ((v13 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_12:
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v14 = (id)qword_10002B118;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Handling remote inventory request: %@", buf, 0xCu);
  }

  synthesisRequestHandler = self->_synthesisRequestHandler;
  id v16 = sub_100007ED4(v9);
  [(CHRemoteSynthesisRequestHandler *)synthesisRequestHandler handleInventoryRequest:v6 withReply:v7 bundleIdentifier:v16];

  [(CHRemoteRecognitionServer *)self _synthesizeStyleInventoryIfNeededWithConnection:v9];
LABEL_19:
}

- (void)handleInventoryStatusRequestWithReply:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  if (!self->_isListening)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v5 = (id)qword_10002B118;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle inventory status requests", buf, 2u);
    }
  }
  id v6 = +[NSXPCConnection currentConnection];
  id v13 = 0;
  unsigned __int8 v7 = [(CHRemoteRecognitionServer *)self _shouldFulfillRemoteRequestForConnection:v6 error:&v13];
  id v8 = v13;
  if (v7)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v9 = (id)qword_10002B118;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unsigned int v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Handling remote inventory status request", v12, 2u);
    }

    synthesisRequestHandler = self->_synthesisRequestHandler;
    id v11 = sub_100007ED4(v6);
    [(CHRemoteSynthesisRequestHandler *)synthesisRequestHandler handleInventoryStatusRequestWithReply:v4 bundleIdentifier:v11];
  }
  else
  {
    v4[2](v4, 0, v8);
  }
}

- (void)handleSketchRecognitionRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v8 = (id)qword_10002B118;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle sketch recognition requests", buf, 2u);
    }
  }
  id v9 = +[NSXPCConnection currentConnection];
  id v14 = 0;
  unsigned __int8 v10 = [(CHRemoteRecognitionServer *)self _shouldFulfillRemoteRequestForConnection:v9 error:&v14];
  id v11 = v14;
  if (v10)
  {
    recognitionRequestHandler = self->_recognitionRequestHandler;
    id v13 = sub_100007ED4(v9);
    [(CHRemoteRecognitionRequestHandler *)recognitionRequestHandler handleSketchRequest:v6 withReply:v7 bundleIdentifier:v13];
  }
  else
  {
    v7[2](v7, 0, v11);
  }
}

- (void)handleLineWrappingRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v8 = (id)qword_10002B118;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle line wrapping requests", buf, 2u);
    }
  }
  id v9 = +[NSXPCConnection currentConnection];
  id v14 = 0;
  unsigned __int8 v10 = [(CHRemoteRecognitionServer *)self _shouldFulfillRemoteRequestForConnection:v9 error:&v14];
  id v11 = v14;
  if (v10)
  {
    lineWrappingHandler = self->_lineWrappingHandler;
    id v13 = sub_100007ED4(v9);
    [(CHRemoteLineWrappingRequestHandler *)lineWrappingHandler handleRequest:v6 withReply:v7 bundleIdentifier:v13];
  }
  else
  {
    v7[2](v7, 0, v11);
  }
}

- (void)handleSessionStateUpdate:(id)a3
{
  id v4 = a3;
  if (!self->_isListening)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v5 = (id)qword_10002B118;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle recognition requests", buf, 2u);
    }
  }
  serverQueue = self->_serverQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009B90;
  v8[3] = &unk_100024AE8;
  id v9 = v4;
  unsigned __int8 v10 = self;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)serverQueue, v8);
}

- (void)handlePowerLoggingRequest:(id)a3
{
  id v4 = a3;
  if (!self->_isListening)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v5 = (id)qword_10002B118;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "The listener must be resumed to power logging requests", v6, 2u);
    }
  }
  [(CHRemotePowerLoggingRequestHandler *)self->_powerLoggingRequestHandler handleRequest:v4];
}

- (void)optimizeResourceUsage
{
  dispatch_time_t v3 = dispatch_time(0, 12000000000);
  serverQueue = self->_serverQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009ED0;
  block[3] = &unk_100024B10;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)serverQueue, block);
}

- (void)resumeConnectionIfIdle
{
  if (!self->_isListening)
  {
    [(NSXPCListener *)self->_listener resume];
    self->_isListening = 1;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CHRemoteRequestProtocol];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

+ (id)_unableToProcessRequestErrorWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:@"Unable to fulfill request for %@. The application does not have permission to run remote recognition or synthesis at this time", v3];
  v8[0] = NSLocalizedDescriptionKey;
  v8[1] = NSLocalizedFailureReasonErrorKey;
  v9[0] = v4;
  v9[1] = @"Requests cannot be executed because this app may not have permission to run remote recognition or synthesis in the background, or at all.";
  v8[2] = NSLocalizedRecoverySuggestionErrorKey;
  v9[2] = @"Re-submit the request from a permitted client application in an acceptable state";
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v6 = +[NSError errorWithDomain:@"com.apple.corehandwriting" code:-1003 userInfo:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisRequestHandler, 0);
  objc_storeStrong((id *)&self->_synthesisProcessingWorkloop, 0);
  objc_storeStrong((id *)&self->_backgroundPrioritySynthesisProcessingQueue, 0);
  objc_storeStrong((id *)&self->_highPrioritySynthesisProcessingQueue, 0);
  objc_storeStrong((id *)&self->_powerLoggingRequestHandler, 0);
  objc_storeStrong((id *)&self->_lineWrappingHandler, 0);
  objc_storeStrong((id *)&self->_recognitionRequestHandler, 0);
  objc_storeStrong((id *)&self->_activeSessionCounter, 0);
  objc_storeStrong((id *)&self->_recognitionProcessingWorkloop, 0);
  objc_storeStrong((id *)&self->_lowPriorityRecognitionProcessingQueue, 0);
  objc_storeStrong((id *)&self->_highPriorityRecognitionProcessingQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end