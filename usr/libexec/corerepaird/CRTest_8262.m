@interface CRTest_8262
- (CRTest_8262)init;
- (void)run:(id)a3 withContext:(id)a4;
- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5;
@end

@implementation CRTest_8262

- (CRTest_8262)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8262;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8262"];
    [(CRTest *)v3 setTestId:&off_1000607C8];
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

- (void)run:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"needRequestURL"];
  v7 = [(CRTest *)self overrides];

  if (v7)
  {
    objc_super v8 = [(CRTest *)self overrides];
    [v6 addEntriesFromDictionary:v8];
  }
  CFStringRef v11 = @"parameters";
  v12 = v6;
  v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v10 = [(CRTest *)self testId];
  [v5 startTest:v10 parameters:v9];
}

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  id v6 = a5;
  v7 = v6;
  if (a3)
  {
    if (v6)
    {
      objc_super v8 = [v6 statusCode];
      unsigned __int8 v9 = [v8 isEqual:&off_100060630];

      if ((v9 & 1) == 0)
      {
        v10 = handleForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10003ECE8(v7, v10);
        }
      }
    }
  }
}

@end