@interface CRTest
- (BOOL)hasMesa;
- (BOOL)hasMesaDelta;
- (BOOL)promptContinue:(id)a3 withContext:(id)a4;
- (BOOL)shouldRun:(id)a3;
- (BOOL)supportHarvestPearl;
- (BOOL)supportLiDAR;
- (BOOL)supportPeCoNet;
- (CRTest)init;
- (NSDictionary)overrides;
- (NSDictionary)resultData;
- (NSNumber)statusCode;
- (NSNumber)testId;
- (NSString)name;
- (OS_dispatch_semaphore)runningSemaphore;
- (void)run:(id)a3 withContext:(id)a4;
- (void)setName:(id)a3;
- (void)setOverrides:(id)a3;
- (void)setResultData:(id)a3;
- (void)setRunningSemaphore:(id)a3;
- (void)setStatusCode:(id)a3;
- (void)setTestId:(id)a3;
- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5;
@end

@implementation CRTest

- (CRTest)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRTest;
  v2 = [(CRTest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setStatusCode:&off_100060618];
    v4 = objc_opt_new();
    [(CRTest *)v3 setResultData:v4];

    [(CRTest *)v3 setRunningSemaphore:0];
    [(CRTest *)v3 setOverrides:0];
  }
  return v3;
}

- (BOOL)shouldRun:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    unsigned __int8 v8 = 0;
    goto LABEL_9;
  }
  v5 = [(CRTest *)self overrides];

  if (v5)
  {
    objc_super v6 = [(CRTest *)self overrides];
    v7 = [v6 objectForKeyedSubscript:@"enabled"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ![v7 BOOLValue])
    {
      unsigned __int8 v8 = 0;
      goto LABEL_7;
    }
  }
  v7 = [v4 lastTestStatusCode];
  unsigned __int8 v8 = [v7 isEqual:&off_100060630];
LABEL_7:

LABEL_9:
  return v8;
}

- (BOOL)promptContinue:(id)a3 withContext:(id)a4
{
  return 1;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  objc_super v6 = objc_opt_new();
  CFStringRef v9 = @"parameters";
  v10 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  unsigned __int8 v8 = [(CRTest *)self testId];
  [v5 startTest:v8 parameters:v7];
}

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  if (a3 && a5)
  {
    id v8 = a5;
    id v13 = a3;
    CFStringRef v9 = [v8 statusCode];
    [(CRTest *)self setStatusCode:v9];

    v10 = [v8 data];

    [(CRTest *)self setResultData:v10];
    v11 = [(CRTest *)self testId];
    [v13 setLastRunTestId:v11];

    v12 = [(CRTest *)self statusCode];
    [v13 setLastTestStatusCode:v12];

    [v13 setLastRunTestIndex:a4];
  }
}

- (BOOL)supportPeCoNet
{
  return +[CRFDRUtils isDataClassSupported:@"JpCl"];
}

- (BOOL)supportLiDAR
{
  return MGGetBoolAnswer();
}

- (BOOL)hasMesa
{
  return MGGetBoolAnswer();
}

- (BOOL)hasMesaDelta
{
  id v19 = 0;
  v2 = +[CRFDRUtils findUnsealedDataWithError:&v19];
  id v3 = v19;
  id v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    objc_super v6 = handleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003EC2C((uint64_t)v4, v6);
    }
LABEL_7:

LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
  if (![v2 count])
  {
    objc_super v6 = handleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No delta components found", buf, 2u);
    }
    goto LABEL_7;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [&off_1000605A0 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (!v9) {
    goto LABEL_8;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v15;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(&off_1000605A0);
      }
      id v13 = [v2 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];

      if (v13)
      {
        BOOL v7 = 1;
        goto LABEL_9;
      }
    }
    id v10 = [&off_1000605A0 countByEnumeratingWithState:&v14 objects:v20 count:16];
    BOOL v7 = 0;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_9:

  return v7;
}

- (BOOL)supportHarvestPearl
{
  return +[CRFDRUtils isDataClassSupported:@"psd3"];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)testId
{
  return self->_testId;
}

- (void)setTestId:(id)a3
{
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (NSDictionary)resultData
{
  return self->_resultData;
}

- (void)setResultData:(id)a3
{
}

- (OS_dispatch_semaphore)runningSemaphore
{
  return self->_runningSemaphore;
}

- (void)setRunningSemaphore:(id)a3
{
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (void)setOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_runningSemaphore, 0);
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_testId, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end