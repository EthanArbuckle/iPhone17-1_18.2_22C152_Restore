@interface WebDefaultResourceLoadDelegate
+ (id)sharedResourceLoadDelegate;
- (BOOL)webView:(id)a3 resource:(id)a4 canAuthenticateAgainstProtectionSpace:(id)a5 forDataSource:(id)a6;
- (BOOL)webView:(id)a3 resource:(id)a4 shouldUseCredentialStorageForDataSource:(id)a5;
- (id)webView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5;
- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5;
- (id)webView:(id)a3 resource:(id)a4 willCacheResponse:(id)a5 fromDataSource:(id)a6;
- (id)webView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7;
@end

@implementation WebDefaultResourceLoadDelegate

+ (id)sharedResourceLoadDelegate
{
  id result = (id)sharedResourceLoadDelegate_sharedDelegate;
  if (!sharedResourceLoadDelegate_sharedDelegate)
  {
    id result = objc_alloc_init(WebDefaultResourceLoadDelegate);
    sharedResourceLoadDelegate_sharedDelegate = (uint64_t)result;
  }
  return result;
}

- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5
{
  return 0;
}

- (id)webView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  return a5;
}

- (BOOL)webView:(id)a3 resource:(id)a4 canAuthenticateAgainstProtectionSpace:(id)a5 forDataSource:(id)a6
{
  return 0;
}

- (id)webView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5
{
  return 0;
}

- (BOOL)webView:(id)a3 resource:(id)a4 shouldUseCredentialStorageForDataSource:(id)a5
{
  return 1;
}

- (id)webView:(id)a3 resource:(id)a4 willCacheResponse:(id)a5 fromDataSource:(id)a6
{
  return a5;
}

@end