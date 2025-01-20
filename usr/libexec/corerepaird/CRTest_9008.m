@interface CRTest_9008
- (BOOL)shouldRun:(id)a3;
- (CRTest_9008)init;
- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5;
@end

@implementation CRTest_9008

- (CRTest_9008)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_9008;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"9008"];
    [(CRTest *)v3 setTestId:&off_100060690];
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
  v10.receiver = self;
  v10.super_class = (Class)CRTest_9008;
  if ([(CRTest *)&v10 shouldRun:v4])
  {
    uint64_t v5 = [v4 rik];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 partSPC];
      BOOL v8 = v7 == 0;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  id v8 = a3;
  if (!v8 || !a5) {
    goto LABEL_11;
  }
  v23.receiver = self;
  v23.super_class = (Class)CRTest_9008;
  [(CRTest *)&v23 update:v8 testIndex:a4 testResult:a5];
  v9 = [(CRTest *)self resultData];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"preflightPartSPC"];
  if (!v10) {
    goto LABEL_6;
  }
  v11 = (void *)v10;
  v12 = [(CRTest *)self resultData];
  v13 = [v12 objectForKeyedSubscript:@"preflightPartSPC"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [(CRTest *)self resultData];
    v15 = [v9 objectForKeyedSubscript:@"preflightPartSPC"];
    [v8 setPartSPC:v15];

LABEL_6:
  }
  v16 = [(CRTest *)self resultData];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"preflightRIK"];
  if (!v17)
  {
LABEL_10:

    goto LABEL_11;
  }
  v18 = (void *)v17;
  v19 = [(CRTest *)self resultData];
  v20 = [v19 objectForKeyedSubscript:@"preflightRIK"];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v21)
  {
    v16 = [(CRTest *)self resultData];
    v22 = [v16 objectForKeyedSubscript:@"preflightRIK"];
    [v8 setRik:v22];

    goto LABEL_10;
  }
LABEL_11:
}

@end