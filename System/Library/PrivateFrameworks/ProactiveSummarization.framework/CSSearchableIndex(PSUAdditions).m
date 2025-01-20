@interface CSSearchableIndex(PSUAdditions)
+ (id)psu_criticalIndexWithName:()PSUAdditions protectionClass:bundleIdentifier:;
@end

@implementation CSSearchableIndex(PSUAdditions)

+ (id)psu_criticalIndexWithName:()PSUAdditions protectionClass:bundleIdentifier:
{
  v7 = (objc_class *)MEMORY[0x263F02AD8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] _initWithName:v10 protectionClass:v9 bundleIdentifier:v8 options:32];

  return v11;
}

@end