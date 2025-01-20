@interface SSMutableURLRequestProperties(RadioRequestAdditions)
+ (id)newForRadioRequestURL:()RadioRequestAdditions accountUniqueIdentifier:;
+ (uint64_t)newForRadioRequestURL:()RadioRequestAdditions;
@end

@implementation SSMutableURLRequestProperties(RadioRequestAdditions)

+ (uint64_t)newForRadioRequestURL:()RadioRequestAdditions
{
  v4 = (void *)MEMORY[0x263F7B0E8];
  id v5 = a3;
  v6 = [v4 defaultStore];
  v7 = [v6 activeAccount];

  v8 = [v7 uniqueIdentifier];
  uint64_t v9 = [a1 newForRadioRequestURL:v5 accountUniqueIdentifier:v8];

  return v9;
}

+ (id)newForRadioRequestURL:()RadioRequestAdditions accountUniqueIdentifier:
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x263F7B290];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setHTTPMethod:@"POST"];
  [v8 setURL:v7];

  [v8 setITunesStoreRequest:1];
  [v8 setShouldDisableCellularFallback:CFPreferencesGetAppBooleanValue(@"RadioUseCellularData", @"com.apple.mobileipod", 0) == 0];
  if (v5)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v5, "longLongValue"));
    [v8 setValue:v9 forHTTPHeaderField:*MEMORY[0x263F7B7C0]];
  }
  v10 = SSVDefaultUserAgent();
  if (v10) {
    [v8 setValue:v10 forHTTPHeaderField:*MEMORY[0x263F7B788]];
  }
  v11 = [MEMORY[0x263F7B148] currentDevice];
  v12 = [v11 storeFrontIdentifier];

  if (v12) {
    [v8 setValue:v12 forHTTPHeaderField:*MEMORY[0x263F7B808]];
  }
  if (newForRadioRequestURL_accountUniqueIdentifier____once != -1) {
    dispatch_once(&newForRadioRequestURL_accountUniqueIdentifier____once, &__block_literal_global_89);
  }
  if (newForRadioRequestURL_accountUniqueIdentifier____deviceGUID) {
    [v8 setValue:newForRadioRequestURL_accountUniqueIdentifier____deviceGUID forHTTPHeaderField:@"X-Guid"];
  }

  return v8;
}

@end