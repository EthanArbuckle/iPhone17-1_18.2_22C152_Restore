@interface CRTest_8185_Patch
- (BOOL)shouldRun:(id)a3;
- (CRTest_8185_Patch)init;
- (void)run:(id)a3 withContext:(id)a4;
@end

@implementation CRTest_8185_Patch

- (CRTest_8185_Patch)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8185_Patch;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8185_Patch"];
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
  v10.receiver = self;
  v10.super_class = (Class)CRTest_8185_Patch;
  if (![(CRTest *)&v10 shouldRun:v4]) {
    goto LABEL_6;
  }
  v5 = [v4 partSPC];

  if (!v5) {
    goto LABEL_7;
  }
  if (![(CRTest *)self supportPeCoNet])
  {
LABEL_6:
    LOBYTE(v5) = 0;
    goto LABEL_7;
  }
  v6 = [v4 partSPC];
  if ([v6 containsObject:@"IPHONE COMP CAMERA"])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_super v8 = [v4 partSPC];
    if ([v8 containsObject:@"IPHONE COMP RCAM"])
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v9 = [v4 partSPC];
      LOBYTE(v5) = [v9 containsObject:@"IPAD REAR CAMERA"];
    }
  }

LABEL_7:
  return (char)v5;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enableStagedSeal"];
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"skipStageEAN"];
  v9 = [v6 serialNumber];

  if (v9)
  {
    objc_super v10 = [v6 serialNumber];
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
  uint64_t v19 = [v6 patchItems];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [v6 patchItems];
    id v22 = [v21 count];

    if (v22)
    {
      v23 = [v6 patchItems];
      [v8 setObject:v23 forKeyedSubscript:@"patchItems"];
    }
  }
  v24 = [(CRTest *)self overrides];

  if (v24)
  {
    v25 = [(CRTest *)self overrides];
    [v8 addEntriesFromDictionary:v25];
  }
  CFStringRef v28 = @"parameters";
  v29 = v8;
  v26 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v27 = [(CRTest *)self testId];
  [v7 startTest:v27 parameters:v26];
}

@end