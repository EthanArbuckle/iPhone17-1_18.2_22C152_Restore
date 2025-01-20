@interface NSError(WBNSErrorExtras)
+ (id)wb_databaseOpenError;
+ (id)wb_featureDisabledError;
+ (id)wb_lockError;
- (id)wb_privacyPreservingDescription;
@end

@implementation NSError(WBNSErrorExtras)

+ (id)wb_databaseOpenError
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08338];
  v5[0] = @"Failed to open database";
  v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v2 = [v0 errorWithDomain:@"com.apple.WebBookmarks.TabGroupSyncAgent.ErrorDomain" code:3 userInfo:v1];

  return v2;
}

+ (id)wb_featureDisabledError
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08338];
  v5[0] = @"The feature is disabled";
  v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v2 = [v0 errorWithDomain:@"com.apple.WebBookmarks.TabGroupSyncAgent.ErrorDomain" code:2 userInfo:v1];

  return v2;
}

+ (id)wb_lockError
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08338];
  v5[0] = @"Failed to acquire the lock on the database";
  v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v2 = [v0 errorWithDomain:@"com.apple.WebBookmarks.TabGroupSyncAgent.ErrorDomain" code:1 userInfo:v1];

  return v2;
}

- (id)wb_privacyPreservingDescription
{
  v2 = NSString;
  v3 = [a1 domain];
  uint64_t v4 = [v2 stringWithFormat:@"Error: domain=%@, code=%ld", v3, objc_msgSend(a1, "code")];

  return v4;
}

@end