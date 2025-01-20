@interface CRTest_6002
- (BOOL)shouldRun:(id)a3;
- (CRTest_6002)init;
- (void)run:(id)a3 withContext:(id)a4;
- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5;
@end

@implementation CRTest_6002

- (CRTest_6002)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_6002;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"6002"];
    [(CRTest *)v3 setTestId:&off_100060708];
    if (os_variant_has_internal_content())
    {
      id v4 = [objc_alloc((Class)CRUserDefaults) initWithSuiteName:@"com.apple.corerepaird.test"];
      v5 = [(CRTest *)v3 name];
      v6 = [v4 dictionaryForKey:v5];
      [(CRTest *)v3 setOverrides:v6];
    }
  }
  return v3;
}

- (BOOL)shouldRun:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRTest_6002;
  if ([(CRTest *)&v11 shouldRun:v4])
  {
    v5 = [v4 partSPC];

    if (v5)
    {
      if (![(CRTest *)self supportPeCoNet])
      {
        v6 = handleForCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PeCoNet not supported", v10, 2u);
        }
        LOBYTE(v5) = 0;
        goto LABEL_13;
      }
      v6 = [v4 partSPC];
      if (([v6 containsObject:@"IPHONE COMP CAMERA"] & 1) == 0)
      {
        v7 = [v4 partSPC];
        if (![v7 containsObject:@"IPHONE COMP RCAM"])
        {
          objc_super v8 = [v4 partSPC];
          LOBYTE(v5) = [v8 containsObject:@"IPAD REAR CAMERA"];

          goto LABEL_13;
        }
      }
      LOBYTE(v5) = 1;
LABEL_13:
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setObject:&off_100060720 forKeyedSubscript:@"sessionTimeOut"];
  [v6 setObject:&off_100060738 forKeyedSubscript:@"sceneErrorTimeOut"];
  [v6 setObject:&off_100060750 forKeyedSubscript:@"userNotMovingTimeout"];
  [v6 setObject:&off_100060918 forKeyedSubscript:@"noMovementAttitudeChangeMinThreshold"];
  [v6 setObject:&off_100060768 forKeyedSubscript:@"sceneErrorWarningThreshold"];
  CFStringRef v9 = @"parameters";
  v10 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  objc_super v8 = [(CRTest *)self testId];
  [v5 startTest:v8 parameters:v7];
}

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  id v8 = a3;
  if (v8 && a5)
  {
    v17.receiver = self;
    v17.super_class = (Class)CRTest_6002;
    [(CRTest *)&v17 update:v8 testIndex:a4 testResult:a5];
    CFStringRef v9 = [(CRTest *)self resultData];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"patchItem"];
    if (!v10)
    {
LABEL_6:

      goto LABEL_7;
    }
    objc_super v11 = (void *)v10;
    v12 = [(CRTest *)self resultData];
    v13 = [v12 objectForKeyedSubscript:@"patchItem"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CFStringRef v9 = [v8 patchItems];
      v15 = [(CRTest *)self resultData];
      v16 = [v15 objectForKeyedSubscript:@"patchItem"];
      [v9 addObject:v16];

      goto LABEL_6;
    }
  }
LABEL_7:
}

@end