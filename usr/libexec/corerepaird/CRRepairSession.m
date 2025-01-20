@interface CRRepairSession
+ (BOOL)supportsSecureCoding;
- (ASTRepairSessionProvider)delegate;
- (BOOL)isSSRBootIntentSet;
- (CRRepairSession)initWithCoder:(id)a3;
- (CRRepairSession)initWithDelegate:(id)a3;
- (CRTestSequencer)testSequencer;
- (NSNumber)suiteId;
- (OS_dispatch_queue)testSequencerQueue;
- (void)encodeWithCoder:(id)a3;
- (void)endWithCompletionHandler:(id)a3;
- (void)ping:(id)a3;
- (void)requestAsset:(id)a3 withCompletion:(id)a4;
- (void)requestSuiteResult:(id)a3 withCompletion:(id)a4;
- (void)requestSuiteStart:(id)a3 withCompletionHandler:(id)a4;
- (void)requestSuitesAvailableWithCompletionHandler:(id)a3;
- (void)requestTermsAndConditionsWithCompletion:(id)a3;
- (void)sendTestResult:(id)a3 withCompletion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSuiteId:(id)a3;
- (void)setTestSequencer:(id)a3;
- (void)setTestSequencerQueue:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation CRRepairSession

- (CRRepairSession)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRRepairSession;
  v5 = [(CRRepairSession *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(CRRepairSession *)v5 setDelegate:v4];
    v7 = [[CRTestSequencer alloc] initWithDelegate:v4];
    [(CRRepairSession *)v6 setTestSequencer:v7];

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.corerepair.testSequencerQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(CRRepairSession *)v6 setTestSequencerQueue:v8];

    [(CRRepairSession *)v6 setSuiteId:&off_1000605E8];
  }

  return v6;
}

- (void)endWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, void))a3;
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CRRepairSession endWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3, 0);
}

- (void)requestAsset:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CRRepairSession requestAsset:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", buf, 0xCu);
  }

  dispatch_queue_t v8 = [@"/System/Library/PrivateFrameworks/CoreRepairCore.framework" stringByAppendingPathComponent:v5];
  id v12 = 0;
  v9 = +[NSData dataWithContentsOfFile:v8 options:2 error:&v12];
  id v10 = v12;
  if (v10)
  {
    v11 = handleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003EB78((uint64_t)v5, v10, v11);
    }
  }
  v6[2](v6, v9, v10);
}

- (void)requestSuiteResult:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, void *, void))a4;
  v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CRRepairSession requestSuiteResult:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v9, 0xCu);
  }

  v7 = [(CRRepairSession *)self testSequencer];
  dispatch_queue_t v8 = [v7 suiteResult];
  v5[2](v5, v8, 0);
}

- (void)requestSuiteStart:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = (void (**)(id, void *, const __CFString *, const __CFString *, void))a4;
  v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CRRepairSession requestSuiteStart:withCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", buf, 0xCu);
  }

  v7 = [(CRRepairSession *)self suiteId];
  v5[2](v5, v7, @"START_SUITE", @"SSR suite", 0);

  dispatch_queue_t v8 = [(CRRepairSession *)self testSequencerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D08C;
  block[3] = &unk_100058CA8;
  block[4] = self;
  dispatch_async(v8, block);
}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CRRepairSession requestSuitesAvailableWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", buf, 0xCu);
  }

  v6 = objc_opt_new();
  unsigned int v7 = [v6 deviceSupportsRepairBootIntent];

  if (v7)
  {
    if (![(CRRepairSession *)self isSSRBootIntentSet])
    {
      dispatch_queue_t v8 = handleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Boot intent not set, check for unsealed data", buf, 2u);
      }

      id v18 = 0;
      int v9 = +[CRFDRUtils findUnsealedDataWithError:&v18];
      id v10 = v18;
      v11 = v10;
      if (!v9 || v10)
      {
        v17 = handleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10003EC2C((uint64_t)v11, v17);
        }
      }
      else
      {
        if ([v9 count])
        {

          goto LABEL_11;
        }
        v17 = handleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No delta components found", buf, 2u);
        }
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      goto LABEL_18;
    }
LABEL_11:
    id v12 = objc_alloc((Class)ASTSuite);
    v13 = [(CRRepairSession *)self suiteId];
    id v14 = [v12 initWithId:v13 suiteNameLocalizedString:&stru_10005A7F8 suiteDescriptionLocalizedString:&stru_10005A7F8 estimatedCompletionTimeLocalizedString:0 primaryAssetLocator:0 secondaryAssetLocator:0];

    v15 = +[NSArray arrayWithObject:v14];
    (*((void (**)(id, void *, void))v4 + 2))(v4, v15, 0);

    goto LABEL_18;
  }
  v16 = handleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10003ECA4(v16);
  }

  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
LABEL_18:
}

- (void)requestTermsAndConditionsWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    unsigned int v7 = "-[CRRepairSession requestTermsAndConditionsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[CRLocalization localizedStringWithKey:@"CR_TERMS_CONDITIONS"];
  v3[2](v3, v5, 0);
}

- (void)sendTestResult:(id)a3 withCompletion:(id)a4
{
  int v6 = (char *)a3;
  unsigned int v7 = (void (**)(id, void))a4;
  dispatch_queue_t v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CRRepairSession sendTestResult:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", buf, 0xCu);
  }

  int v9 = handleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "testResult:%@", buf, 0xCu);
  }

  v7[2](v7, 0);
  id v10 = [(CRRepairSession *)self testSequencerQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D650;
  v12[3] = &unk_100058CD0;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  dispatch_async(v10, v12);
}

- (void)startWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, void))a3;
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CRRepairSession startWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3, 0);
}

- (void)ping:(id)a3
{
  v3 = (void (**)(id, void))a3;
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CRRepairSession ping:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3, 0);
}

- (BOOL)isSSRBootIntentSet
{
  v2 = +[NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist", @"com.apple.CheckerBoard"];
  v3 = +[NSDictionary dictionaryWithContentsOfFile:v2];
  id v4 = [v3 objectForKey:@"persistedBootIntentReason"];
  int v5 = v4;
  BOOL v6 = v4 && ([v4 isEqualToNumber:&off_100060600] & 1) != 0;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CRRepairSession *)self delegate];
  [v4 encodeObject:v5 forKey:@"delegate"];
}

- (CRRepairSession)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"delegate"];

  v13 = [[CRRepairSession alloc] initWithDelegate:v12];
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTRepairSessionProvider)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (CRTestSequencer)testSequencer
{
  return self->_testSequencer;
}

- (void)setTestSequencer:(id)a3
{
}

- (OS_dispatch_queue)testSequencerQueue
{
  return self->_testSequencerQueue;
}

- (void)setTestSequencerQueue:(id)a3
{
}

- (NSNumber)suiteId
{
  return self->_suiteId;
}

- (void)setSuiteId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suiteId, 0);
  objc_storeStrong((id *)&self->_testSequencerQueue, 0);
  objc_storeStrong((id *)&self->_testSequencer, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end