@interface CRTest_8185_Update
- (BOOL)shouldRun:(id)a3;
- (CRTest_8185_Update)init;
- (void)run:(id)a3 withContext:(id)a4;
@end

@implementation CRTest_8185_Update

- (CRTest_8185_Update)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8185_Update;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8185_Update"];
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
  v9.receiver = self;
  v9.super_class = (Class)CRTest_8185_Update;
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
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enableStagedSeal"];
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"skipStageEAN"];
  objc_super v9 = [v6 serialNumber];

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
  v19 = [v6 PrCL];

  if (v19)
  {
    CFStringRef v28 = @"PrCL";
    v20 = [v6 PrCL];
    v29 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    [v8 setObject:v21 forKeyedSubscript:@"updateProperties"];
  }
  v22 = [(CRTest *)self overrides];

  if (v22)
  {
    v23 = [(CRTest *)self overrides];
    [v8 addEntriesFromDictionary:v23];
  }
  CFStringRef v26 = @"parameters";
  v27 = v8;
  v24 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v25 = [(CRTest *)self testId];
  [v7 startTest:v25 parameters:v24];
}

@end