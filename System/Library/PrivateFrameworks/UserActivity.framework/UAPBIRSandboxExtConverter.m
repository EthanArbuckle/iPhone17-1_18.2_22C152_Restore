@interface UAPBIRSandboxExtConverter
+ (void)registerConverter;
- (id)convertIRDataToPlatform:(id)a3;
- (id)convertPlatformDataToIR:(id)a3;
- (id)typeString;
@end

@implementation UAPBIRSandboxExtConverter

+ (void)registerConverter
{
  id v3 = +[UASharedPasteboardIRManager sharedIRManager];
  [v3 registerIRHandlerClass:a1 forType:@"com.apple.security.sandbox-extension-dict"];
}

- (id)typeString
{
  return @"com.apple.security.sandbox-extension-dict";
}

- (id)convertPlatformDataToIR:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)convertIRDataToPlatform:(id)a3
{
  id v3 = a3;

  return v3;
}

@end