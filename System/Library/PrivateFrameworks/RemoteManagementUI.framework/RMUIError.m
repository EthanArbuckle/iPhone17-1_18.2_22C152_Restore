@interface RMUIError
+ (id)legacyProfilesInvalidURLForDeclarationID:(id)a3 urlString:(id)a4;
+ (id)legacyProfilesNoDeclarationToSetActivated:(BOOL)a3;
+ (id)legacyProfilesNoObserverStoreForDeclarationID:(id)a3;
@end

@implementation RMUIError

+ (id)legacyProfilesInvalidURLForDeclarationID:(id)a3 urlString:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  v4 = [NSString stringWithFormat:@"Invalid profile URL for declaration %@: %@", a3, a4];
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v4;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v5 errorWithDomain:@"RMUILegacyProfilesErrorDomain" code:0 userInfo:v6];

  return v7;
}

+ (id)legacyProfilesNoObserverStoreForDeclarationID:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = [NSString stringWithFormat:@"No observer store for declaration %@", a3];
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"RMUILegacyProfilesErrorDomain" code:2 userInfo:v5];

  return v6;
}

+ (id)legacyProfilesNoDeclarationToSetActivated:(BOOL)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"No declaration to set activation %d", a3);
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"RMUILegacyProfilesErrorDomain" code:3 userInfo:v5];

  return v6;
}

@end