@interface CRTest_8276
- (BOOL)shouldRun:(id)a3;
- (CRTest_8276)init;
- (void)run:(id)a3 withContext:(id)a4;
- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5;
@end

@implementation CRTest_8276

- (CRTest_8276)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8276;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8276"];
    [(CRTest *)v3 setTestId:&off_100060780];
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
  v9.receiver = self;
  v9.super_class = (Class)CRTest_8276;
  if (![(CRTest *)&v9 shouldRun:v4]) {
    goto LABEL_4;
  }
  v5 = [v4 partSPC];

  if (v5)
  {
    if ([(CRTest *)self supportPeCoNet])
    {
LABEL_4:
      LOBYTE(v5) = 0;
      goto LABEL_5;
    }
    if ([(CRTest *)self supportLiDAR])
    {
      v7 = [v4 partSPC];
      LOBYTE(v5) = [v7 containsObject:@"IPHONE COMP CAMERA"];
    }
    else
    {
      v7 = handleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "LiDAR not supported", v8, 2u);
      }
      LOBYTE(v5) = 0;
    }
  }
LABEL_5:

  return (char)v5;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setObject:&off_100060798 forKeyedSubscript:@"sessionTimeOut"];
  [v6 setObject:&off_100060738 forKeyedSubscript:@"sceneErrorTimeOut"];
  [v6 setObject:&off_100060750 forKeyedSubscript:@"userNotMovingTimeout"];
  [v6 setObject:&off_100060928 forKeyedSubscript:@"noMovementAttitudeChangeMinThreshold"];
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
    v16.receiver = self;
    v16.super_class = (Class)CRTest_8276;
    [(CRTest *)&v16 update:v8 testIndex:a4 testResult:a5];
    CFStringRef v9 = [(CRTest *)self resultData];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"PrCL"];
    if (!v10)
    {
LABEL_6:

      goto LABEL_7;
    }
    v11 = (void *)v10;
    v12 = [(CRTest *)self resultData];
    v13 = [v12 objectForKeyedSubscript:@"PrCL"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CFStringRef v9 = [(CRTest *)self resultData];
      v15 = [v9 objectForKeyedSubscript:@"PrCL"];
      [v8 setPrCL:v15];

      goto LABEL_6;
    }
  }
LABEL_7:
}

@end