@interface NSError(PNRResourceManager)
+ (id)_PNRAssetQueryErrorWithUserInfo:()PNRResourceManager;
+ (id)_PNRAssetUnavailableErrorWithUserInfo:()PNRResourceManager;
+ (id)_PNRBadMagicErrorWithUserInfo:()PNRResourceManager;
+ (id)_PNRNotFoundErrorWithUserInfo:()PNRResourceManager;
@end

@implementation NSError(PNRResourceManager)

+ (id)_PNRAssetQueryErrorWithUserInfo:()PNRResourceManager
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:@"asset query" forKeyedSubscript:*MEMORY[0x263F07F80]];
  [v5 addEntriesFromDictionary:v4];

  v6 = (void *)MEMORY[0x263F087E8];
  v7 = PNRResourceManagerErrorDomain;
  v8 = (void *)[v5 copy];
  v9 = [v6 errorWithDomain:v7 code:3 userInfo:v8];

  return v9;
}

+ (id)_PNRBadMagicErrorWithUserInfo:()PNRResourceManager
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:@"bad magic" forKeyedSubscript:*MEMORY[0x263F07F80]];
  [v5 addEntriesFromDictionary:v4];

  v6 = (void *)MEMORY[0x263F087E8];
  v7 = PNRResourceManagerErrorDomain;
  v8 = (void *)[v5 copy];
  v9 = [v6 errorWithDomain:v7 code:1 userInfo:v8];

  return v9;
}

+ (id)_PNRNotFoundErrorWithUserInfo:()PNRResourceManager
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:@"not found" forKeyedSubscript:*MEMORY[0x263F07F80]];
  [v5 addEntriesFromDictionary:v4];

  v6 = (void *)MEMORY[0x263F087E8];
  v7 = PNRResourceManagerErrorDomain;
  v8 = (void *)[v5 copy];
  v9 = [v6 errorWithDomain:v7 code:2 userInfo:v8];

  return v9;
}

+ (id)_PNRAssetUnavailableErrorWithUserInfo:()PNRResourceManager
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:@"asset unavailable" forKeyedSubscript:*MEMORY[0x263F07F80]];
  [v5 addEntriesFromDictionary:v4];

  v6 = (void *)MEMORY[0x263F087E8];
  v7 = PNRResourceManagerErrorDomain;
  v8 = (void *)[v5 copy];
  v9 = [v6 errorWithDomain:v7 code:4 userInfo:v8];

  return v9;
}

@end