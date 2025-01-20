@interface CRTest_8259
- (CRTest_8259)init;
- (void)run:(id)a3 withContext:(id)a4;
- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5;
@end

@implementation CRTest_8259

- (CRTest_8259)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8259;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8259"];
    [(CRTest *)v3 setTestId:&off_100060648];
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
  v7 = [(CRTest *)self overrides];

  if (v7)
  {
    objc_super v8 = [(CRTest *)self overrides];
    [v6 addEntriesFromDictionary:v8];
  }
  else
  {
    [v6 setObject:&off_1000605B8 forKeyedSubscript:@"endpointURLs"];
  }
  CFStringRef v11 = @"parameters";
  v12 = v6;
  v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v10 = [(CRTest *)self testId];
  [v5 startTest:v10 parameters:v9];
}

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    CFStringRef v11 = [v9 statusCode];
    unsigned __int8 v12 = [v11 isEqual:&off_100060630];

    if ((v12 & 1) == 0) {
      [v10 setStatusCode:&off_100060660];
    }
    v13.receiver = self;
    v13.super_class = (Class)CRTest_8259;
    [(CRTest *)&v13 update:v8 testIndex:a4 testResult:v10];
  }
}

@end