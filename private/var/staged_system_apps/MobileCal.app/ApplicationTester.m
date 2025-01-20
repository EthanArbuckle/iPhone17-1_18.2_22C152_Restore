@interface ApplicationTester
+ (BOOL)testingSessionStarted;
- (ApplicationTester)initWithModel:(id)a3;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (CUIKCalendarModel)model;
- (Class)_testClassForTestName:(id)a3;
- (NSString)extendedLaunchTestName;
- (void)setModel:(id)a3;
@end

@implementation ApplicationTester

- (ApplicationTester)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ApplicationTester;
  v6 = [(ApplicationTester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

+ (BOOL)testingSessionStarted
{
  return byte_100216748;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!self->_model)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"ApplicationTester.m", 39, @"Invalid parameter not satisfying: %@", @"_model != nil" object file lineNumber description];
  }
  v12 = [(ApplicationTester *)self _testClassForTestName:v10];
  v13 = v12;
  if (v12)
  {
    byte_100216748 = 1;
    v14 = (ApplicationTest *)[[v12 alloc] initWithApplication:v9 model:self->_model options:v11];
    currentlyRunningTest = self->_currentlyRunningTest;
    self->_currentlyRunningTest = v14;

    v16 = kCalUILogTestHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Running test: [%{public}@]", buf, 0xCu);
    }
    [(ApplicationTest *)self->_currentlyRunningTest runTest];
  }
  else
  {
    v17 = kCalUILogTestHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v10;
      __int16 v22 = 2114;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not find test class for test name: [%{public}@]. You may need to include this class in the collection returned from your [%{public}@]'s -testClasses method.", buf, 0x16u);
    }
  }

  return v13 != 0;
}

- (NSString)extendedLaunchTestName
{
  return 0;
}

- (Class)_testClassForTestName:(id)a3
{
  v3 = (NSString *)a3;
  v4 = v3;
  if (!v3)
  {
    uint64_t v11 = kCalUILogTestHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      v8 = "nil 'testName' provided.  Will not return a test class.";
      id v9 = v11;
      uint32_t v10 = 2;
      goto LABEL_7;
    }
LABEL_8:
    Class v5 = 0;
    goto LABEL_9;
  }
  Class v5 = NSClassFromString(v3);
  uint64_t v6 = objc_opt_class();
  if (([(objc_class *)v5 isSubclassOfClass:v6] & 1) == 0)
  {
    uint64_t v7 = kCalUILogTestHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412546;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      Class v17 = v5;
      v8 = "Will not provide test class since it is not a subclass of [%@].  Candidate class: [%@]";
      id v9 = v7;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v14, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  v12 = v5;

  return v12;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_currentlyRunningTest, 0);

  objc_storeStrong((id *)&self->_testNamesToTestClasses, 0);
}

@end