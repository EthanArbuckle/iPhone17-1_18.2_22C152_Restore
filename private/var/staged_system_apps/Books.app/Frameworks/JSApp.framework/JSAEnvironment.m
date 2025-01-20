@interface JSAEnvironment
+ (void)_exposeObjectsAndClassesToContext:(id)a3;
- (BUOSStateHandler)stateDumpHandle;
- (JSAEnvironment)init;
- (JSAThread)thread;
- (JSContext)context;
- (JSManagedValue)nativeJSObject;
- (NSString)appVersion;
- (NSString)bootURL;
- (id)appForOwnership;
- (int)_exceptionHandlerReentrantCountPtr;
- (void)dealloc;
- (void)loadScript:(id)a3 name:(id)a4 version:(id)a5 isBundled:(BOOL)a6 completion:(id)a7;
- (void)loadScriptFromPackage:(id)a3 completion:(id)a4;
- (void)openURL:(id)a3 referrerURL:(id)a4 referrerApplicationName:(id)a5 options:(id)a6;
- (void)registerObjects:(id)a3;
- (void)setBootURL:(id)a3;
- (void)setNativeJSObject:(id)a3;
- (void)setStateDumpHandle:(id)a3;
@end

@implementation JSAEnvironment

- (JSAEnvironment)init
{
  v19.receiver = self;
  v19.super_class = (Class)JSAEnvironment;
  v2 = [(JSAEnvironment *)&v19 init];
  v3 = v2;
  if (v2)
  {
    appVersion = v2->_appVersion;
    v2->_appVersion = (NSString *)@"undefined";

    atomic_store(0, (unsigned int *)&v3->_exceptionHandlerReentrantCount);
    v5 = [[JSAThread alloc] initWithName:@"com.apple.iBooks.JSAThread"];
    thread = v3->_thread;
    v3->_thread = v5;

    objc_initWeak(&location, v3);
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_7818;
    v16 = &unk_B2248;
    objc_copyWeak(&v17, &location);
    v7 = objc_retainBlock(&v13);
    v8 = +[NSNotificationCenter defaultCenter];
    id v9 = [v8 addObserverForName:UIApplicationDidReceiveMemoryWarningNotification object:0 queue:0 usingBlock:v7];
    sub_7900(v3);
    if (MGGetBoolAnswer())
    {
      v10 = (BUOSStateHandler *)[objc_alloc((Class)BUOSStateHandler) initWithTitle:@"ScriptingLocalStorage" block:&stru_B2288];
      stateDumpHandle = v3->_stateDumpHandle;
      v3->_stateDumpHandle = v10;
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(JSManagedValue *)self->_nativeJSObject value];
  v5 = [v4 context];
  v6 = [v5 virtualMachine];
  [v6 removeManagedReference:self->_nativeJSObject withOwner:self];

  v7.receiver = self;
  v7.super_class = (Class)JSAEnvironment;
  [(JSAEnvironment *)&v7 dealloc];
}

- (id)appForOwnership
{
  v3 = [(JSAEnvironment *)self context];
  v4 = [v3 objectForKeyedSubscript:@"App"];

  v5 = [v4 toObjectOfClass:objc_opt_class()];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = JSALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_845E4(self, v8);
    }

    if (+[JSADevice isInternalBuild])
    {
      v12 = [(JSAEnvironment *)self context];
      BUReportAssertionFailureWithMessage();

      BUCrashBreakpoint();
      id result = (id)BUIsRunningTests();
      if ((result & 1) == 0)
      {
        __break(1u);
        return result;
      }
      v11 = [(JSAEnvironment *)self context];
      BUCrashFinalThrow();
    }
    v10 = [(JSAEnvironment *)self context];
    id v7 = [v10 globalObject];
  }

  return v7;
}

- (void)loadScriptFromPackage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [v7 dataAtPath:@"app.js"];
  v8 = [v7 nameForJSContext];
  id v9 = [v7 version];
  id v10 = [v7 isBundled];

  [(JSAEnvironment *)self loadScript:v11 name:v8 version:v9 isBundled:v10 completion:v6];
}

- (void)loadScript:(id)a3 name:(id)a4 version:(id)a5 isBundled:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = JSALog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v30 = "-[JSAEnvironment loadScript:name:version:isBundled:completion:]";
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "JSAEnvironment %{public}s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v17 = [(JSAEnvironment *)self thread];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_86D8;
  v22[3] = &unk_B2300;
  objc_copyWeak(&v27, (id *)buf);
  id v18 = v12;
  id v23 = v18;
  id v19 = v13;
  id v24 = v19;
  id v20 = v14;
  id v25 = v20;
  BOOL v28 = a6;
  id v21 = v15;
  id v26 = v21;
  [v17 enqueueBlock:v22];

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (void)openURL:(id)a3 referrerURL:(id)a4 referrerApplicationName:(id)a5 options:(id)a6
{
}

- (void)registerObjects:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(JSAEnvironment *)self thread];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_8B18;
    v6[3] = &unk_B2050;
    v6[4] = self;
    id v7 = v4;
    [v5 enqueueBlock:v6];
  }
}

+ (void)_exposeObjectsAndClassesToContext:(id)a3
{
  id v3 = a3;
  id v4 = JSASignpostExecution();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = JSASignpostExecution();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Expose Objects", "", buf, 2u);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_956C;
  v29[3] = &unk_B2328;
  v8 = objc_alloc_init(JSAFoundation);
  v30 = v8;
  id v9 = objc_retainBlock(v29);
  [v3 setObject:v9 forKeyedSubscript:@"setInterval"];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_9578;
  v27[3] = &unk_B2350;
  id v10 = v8;
  BOOL v28 = v10;
  id v11 = objc_retainBlock(v27);
  [v3 setObject:v11 forKeyedSubscript:@"clearInterval"];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_9584;
  v25[3] = &unk_B2328;
  id v12 = v10;
  id v26 = v12;
  id v13 = objc_retainBlock(v25);
  [v3 setObject:v13 forKeyedSubscript:@"setTimeout"];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_9590;
  v23[3] = &unk_B2350;
  id v14 = v12;
  id v24 = v14;
  id v15 = objc_retainBlock(v23);
  [v3 setObject:v15 forKeyedSubscript:@"clearTimeout"];

  v16 = +[JSValue valueWithNewObjectInContext:v3];
  [v3 setObject:v16 forKeyedSubscript:@"native"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"AccountController"];
  [v16 setObject:&stru_B2390 forKeyedSubscript:@"currentPackage"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_95F0;
  v21[3] = &unk_B2408;
  id v17 = v3;
  id v22 = v17;
  id v18 = objc_retainBlock(v21);
  [v16 setObject:v18 forKeyedSubscript:@"templateRegistrationPromise"];

  [v16 setObject:objc_opt_class() forKeyedSubscript:@"MetricsController"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Store"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Account"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Application"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"AssetRequest"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Base64"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Calendar"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Cookie"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"DateComponentsFormatter"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"DateFormatter"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Device"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"FamilySharing"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Locale"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"OSLog"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Network"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"ParentalApproval"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Persistence"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"PostReviewRequest"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"ProfileBagKeyEntry"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"ProfileBagManager"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Share"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"StoreContentLookupRequest"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"StoreHTTPRequest"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"StoreHTTPResponse"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"Timer"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"URLParser"];
  [v16 setObject:objc_opt_class() forKeyedSubscript:@"UserDefaults"];
  [v16 setObject:&off_B9AD8 forKeyedSubscript:@"nativeAPIVersion"];
  id v19 = JSASignpostExecution();
  id v20 = v19;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v20, OS_SIGNPOST_INTERVAL_END, v5, "Expose Objects", "", buf, 2u);
  }
}

- (int)_exceptionHandlerReentrantCountPtr
{
  return &self->_exceptionHandlerReentrantCount;
}

- (JSContext)context
{
  return self->_context;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (JSManagedValue)nativeJSObject
{
  return self->_nativeJSObject;
}

- (void)setNativeJSObject:(id)a3
{
}

- (BUOSStateHandler)stateDumpHandle
{
  return self->_stateDumpHandle;
}

- (void)setStateDumpHandle:(id)a3
{
}

- (NSString)bootURL
{
  return self->_bootURL;
}

- (void)setBootURL:(id)a3
{
}

- (JSAThread)thread
{
  return self->_thread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_bootURL, 0);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_nativeJSObject, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end