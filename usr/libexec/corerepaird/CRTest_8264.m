@interface CRTest_8264
- (BOOL)shouldRun:(id)a3;
- (CRTest_8264)init;
- (void)run:(id)a3 withContext:(id)a4;
@end

@implementation CRTest_8264

- (CRTest_8264)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8264;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8264"];
    [(CRTest *)v3 setTestId:&off_1000607E0];
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
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8264;
  if ([(CRTest *)&v8 shouldRun:v4])
  {
    v5 = [v4 partSPC];

    if (v5)
    {
      v6 = [v4 partSPC];
      LOBYTE(v5) = [v6 containsObject:@"IPHONE COMP BATTERY"];
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

@end