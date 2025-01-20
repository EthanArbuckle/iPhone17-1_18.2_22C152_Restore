@interface NSMutableURLRequest
+ (id)_gkHTTPRequestWithURL:(id)a3 postData:(id)a4 protocolVersion:(id)a5;
@end

@implementation NSMutableURLRequest

+ (id)_gkHTTPRequestWithURL:(id)a3 postData:(id)a4 protocolVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 _gkIsValidServerURL])
  {
    v11 = +[GKPreferences shared];
    [v11 operationTimeout];
    v12 = [a1 requestWithURL:v8 cachePolicy:1];
  }
  else
  {
    v12 = 0;
  }
  [v12 setLocale:0];
  v13 = +[GKPreferences shared];
  [v12 setInternal:[v13 useInternalHeader]];

  v14 = +[GKDevice currentDevice];
  v15 = [v14 userAgentWithProcessName:@"gamed" protocolVersion:v10];

  [v12 setHTTPUserAgent:v15];
  [v12 setHTTPShouldHandleCookies:0];
  if (v9)
  {
    [v12 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"content-type"];
    [v12 setHTTPMethod:@"POST"];
    [v12 setHTTPBody:v9];
  }
  else
  {
    [v12 setHTTPMethod:@"GET"];
  }
  v16 = +[NSUUID UUID];
  v17 = [v16 UUIDString];
  [v12 setValue:v17 forHTTPHeaderField:@"X-Apple-Request-UUID"];

  v18 = +[GKPreferences shared];
  v19 = [v18 testRunID];

  if (v19) {
    [v12 setValue:v19 forHTTPHeaderField:@"x-gk-test-run-id"];
  }

  return v12;
}

@end