@interface CRTest_8185
- (BOOL)shouldRun:(id)a3;
- (CRTest_8185)init;
- (void)run:(id)a3 withContext:(id)a4;
@end

@implementation CRTest_8185

- (CRTest_8185)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8185;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8185"];
    [(CRTest *)v3 setTestId:&off_1000606C0];
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
  v8.super_class = (Class)CRTest_8185;
  if ([(CRTest *)&v8 shouldRun:v4])
  {
    v5 = [v4 partSPC];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"skipStageEAN"];
  v9 = [v6 serialNumber];

  if (v9)
  {
    v10 = [v6 serialNumber];
    [v8 setObject:v10 forKeyedSubscript:@"KGBSerialNumber"];
  }
  uint64_t v11 = [v6 partSPC];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [v6 partSPC];
    id v14 = [v13 count];

    if (v14)
    {
      v15 = [v6 partSPC];
      v16 = [v15 componentsJoinedByString:@","];
      [v8 setObject:v16 forKeyedSubscript:@"partSPC"];
    }
  }
  v17 = [v6 rik];

  if (v17)
  {
    v18 = [v6 rik];
    [v8 setObject:v18 forKeyedSubscript:@"keyBlob"];
  }
  v19 = [(CRTest *)self overrides];

  if (v19)
  {
    v20 = [(CRTest *)self overrides];
    [v8 addEntriesFromDictionary:v20];
  }
  CFStringRef v23 = @"parameters";
  v24 = v8;
  v21 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v22 = [(CRTest *)self testId];
  [v7 startTest:v22 parameters:v21];
}

@end