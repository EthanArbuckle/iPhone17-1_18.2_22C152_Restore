@interface CRTest_8268
- (BOOL)shouldRun:(id)a3;
- (CRTest_8268)init;
- (void)run:(id)a3 withContext:(id)a4;
@end

@implementation CRTest_8268

- (CRTest_8268)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8268;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8268"];
    [(CRTest *)v3 setTestId:&off_1000607B0];
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
  v14.receiver = self;
  v14.super_class = (Class)CRTest_8268;
  if (![(CRTest *)&v14 shouldRun:v4]) {
    goto LABEL_10;
  }
  v5 = [v4 partSPC];

  if (!v5) {
    goto LABEL_10;
  }
  v6 = [v4 partSPC];
  unsigned __int8 v7 = [v6 containsObject:@"MPU"];

  if ((v7 & 1) == 0)
  {
    objc_super v8 = [v4 partSPC];
    unsigned __int8 v9 = [v8 containsObject:@"IPAD TOUCH ID"];

    if ((v9 & 1) == 0)
    {
      v11 = [v4 partSPC];
      if ([v11 containsObject:@"IPHONE COMP DISPLAY"])
      {
        unsigned int v12 = [(CRTest *)self hasMesa];

        if (v12)
        {
          BOOL v10 = [(CRTest *)self hasMesaDelta];
          goto LABEL_11;
        }
      }
      else
      {
      }
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  unsigned __int8 v9 = [v6 rik];

  if (v9)
  {
    BOOL v10 = [v6 rik];
    [v8 setObject:v10 forKeyedSubscript:@"keyBlob"];
  }
  v11 = [(CRTest *)self overrides];

  if (v11)
  {
    unsigned int v12 = [(CRTest *)self overrides];
    [v8 addEntriesFromDictionary:v12];
  }
  CFStringRef v15 = @"parameters";
  v16 = v8;
  v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  objc_super v14 = [(CRTest *)self testId];
  [v7 startTest:v14 parameters:v13];
}

@end