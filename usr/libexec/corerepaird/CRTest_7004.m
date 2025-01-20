@interface CRTest_7004
- (BOOL)shouldRun:(id)a3;
- (CRTest_7004)init;
@end

@implementation CRTest_7004

- (CRTest_7004)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRTest_7004;
  v2 = [(CRTest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CRTest *)v2 setName:@"7004"];
    [(CRTest *)v3 setTestId:&off_1000606F0];
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
  v9.super_class = (Class)CRTest_7004;
  if (![(CRTest *)&v9 shouldRun:v4]) {
    goto LABEL_7;
  }
  v5 = [v4 partSPC];

  if (!v5) {
    goto LABEL_10;
  }
  if (![(CRTest *)self supportLiDAR] && ![(CRTest *)self supportPeCoNet])
  {
LABEL_7:
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  v6 = [v4 partSPC];
  if ([v6 containsObject:@"IPHONE COMP CAMERA"])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v7 = [v4 partSPC];
    LOBYTE(v5) = [v7 containsObject:@"IPHONE COMP RCAM"];
  }
LABEL_10:

  return (char)v5;
}

@end