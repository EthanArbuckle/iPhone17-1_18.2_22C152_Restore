@interface UAPBIRPublicURLConverter
+ (void)registerConverter;
- (id)convertIRDataToPlatform:(id)a3;
- (id)convertPlatformDataToIR:(id)a3;
- (id)typeString;
@end

@implementation UAPBIRPublicURLConverter

+ (void)registerConverter
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _uaGetLogForCategory(@"PBIR");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    v6 = @"public.url";
    __int16 v7 = 2112;
    id v8 = a1;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "Registering converter for type: %@ -> %@", (uint8_t *)&v5, 0x16u);
  }

  v4 = +[UASharedPasteboardIRManager sharedIRManager];
  [v4 registerIRHandlerClass:a1 forType:@"public.url"];
}

- (id)typeString
{
  return @"public.url";
}

- (id)convertPlatformDataToIR:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _uaGetLogForCategory(@"PBIR");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    __int16 v7 = @"public.url";
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEFAULT, "Converting from platform to IR for type: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)convertIRDataToPlatform:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _uaGetLogForCategory(@"PBIR");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    __int16 v7 = @"public.url";
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEFAULT, "Converting from IR to platform for type: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

@end