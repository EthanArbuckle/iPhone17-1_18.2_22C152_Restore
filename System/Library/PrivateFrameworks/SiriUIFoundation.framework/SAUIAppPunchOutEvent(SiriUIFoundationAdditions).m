@interface SAUIAppPunchOutEvent(SiriUIFoundationAdditions)
+ (id)sruif_appPunchOutEventWithRefId:()SiriUIFoundationAdditions URL:appDisplayName:bundleId:;
@end

@implementation SAUIAppPunchOutEvent(SiriUIFoundationAdditions)

+ (id)sruif_appPunchOutEventWithRefId:()SiriUIFoundationAdditions URL:appDisplayName:bundleId:
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4)
  {
    v12 = NSString;
    v13 = [a4 scheme];
    v14 = [v12 stringWithFormat:@"%@://%@", v13, @"#TRUNCATED"];

    a4 = [NSURL URLWithString:v14];
  }
  id v15 = objc_alloc_init(MEMORY[0x263F64EE8]);
  v16 = [MEMORY[0x263F08C38] UUID];
  v17 = [v16 UUIDString];
  [v15 setAceId:v17];

  [v15 setRefId:v9];
  [v15 setPunchOutUri:a4];
  [v15 setAppDisplayName:v10];
  [v15 setBundleId:v11];

  return v15;
}

@end