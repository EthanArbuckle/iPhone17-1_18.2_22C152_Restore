@interface SystemInfo
+ (id)buildString;
+ (id)deviceName;
@end

@implementation SystemInfo

+ (id)deviceName
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(&v4, 0, 512);
  uname(&v4);
  v2 = [NSString stringWithCString:v4.machine encoding:4];

  return v2;
}

+ (id)buildString
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  v3 = [v2 operatingSystemVersionString];
  utsname v4 = [v3 componentsSeparatedByString:@" "];

  uint64_t v5 = [v4 lastObject];
  v6 = [v4 lastObject];
  v7 = [v5 substringToIndex:[v6 length] - 1];

  return v7;
}

@end