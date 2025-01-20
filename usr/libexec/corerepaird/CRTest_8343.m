@interface CRTest_8343
- (BOOL)shouldRun:(id)a3;
- (CRTest_8343)init;
@end

@implementation CRTest_8343

- (CRTest_8343)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8343;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"8343"];
    [(CRTest *)v3 setTestId:&off_1000606D8];
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
  v10.super_class = (Class)CRTest_8343;
  if ([(CRTest *)&v10 shouldRun:v4]
    && ([v4 partSPC], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = [v4 partSPC];
    if ([v6 containsObject:@"IPHONE COMP FACEID"])
    {
      unsigned __int8 v7 = 1;
    }
    else
    {
      objc_super v8 = [v4 partSPC];
      unsigned __int8 v7 = [v8 containsObject:@"IPAD FRONT CAMERA"];
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

@end