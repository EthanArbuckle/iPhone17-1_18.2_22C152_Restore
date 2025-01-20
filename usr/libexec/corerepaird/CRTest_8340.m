@interface CRTest_8340
- (BOOL)shouldRun:(id)a3;
- (CRTest_8340)init;
- (void)run:(id)a3 withContext:(id)a4;
@end

@implementation CRTest_8340

- (CRTest_8340)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8340;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8340"];
    [(CRTest *)v3 setTestId:&off_1000606A8];
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
  v9.super_class = (Class)CRTest_8340;
  if (![(CRTest *)&v9 shouldRun:v4]) {
    goto LABEL_4;
  }
  v5 = [v4 partSPC];

  if (v5)
  {
    if ([(CRTest *)self supportHarvestPearl])
    {
LABEL_4:
      LOBYTE(v5) = 0;
      goto LABEL_5;
    }
    v7 = [v4 partSPC];
    if ([v7 containsObject:@"IPHONE COMP FACEID"])
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      objc_super v8 = [v4 partSPC];
      LOBYTE(v5) = [v8 containsObject:@"IPAD FRONT CAMERA"];
    }
  }
LABEL_5:

  return (char)v5;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  objc_super v9 = [v6 rik];

  if (v9)
  {
    v10 = [v6 rik];
    [v8 setObject:v10 forKeyedSubscript:@"keyBlob"];
  }
  v11 = [(CRTest *)self overrides];

  if (v11)
  {
    v12 = [(CRTest *)self overrides];
    [v8 addEntriesFromDictionary:v12];
  }
  CFStringRef v15 = @"parameters";
  v16 = v8;
  v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v14 = [(CRTest *)self testId];
  [v7 startTest:v14 parameters:v13];
}

@end