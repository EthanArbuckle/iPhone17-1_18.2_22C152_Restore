@interface UAPBIRFileURLConverter
+ (void)registerConverter;
- (id)convertIRDataToPlatform:(id)a3;
- (id)convertPlatformDataToIR:(id)a3;
- (id)typeString;
@end

@implementation UAPBIRFileURLConverter

+ (void)registerConverter
{
  id v3 = +[UASharedPasteboardIRManager sharedIRManager];
  [v3 registerIRHandlerClass:a1 forType:@"public.file-url"];
}

- (id)typeString
{
  return @"public.file-url";
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