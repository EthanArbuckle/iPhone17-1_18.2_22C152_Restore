@interface NSPTokenFetchAnalytics
- (NSString)authenticationType;
- (NSString)proxyURL;
- (NSString)proxyVendor;
- (NSString)requestedServerUUID;
- (NSString)tierType;
- (double)latency;
- (id)analyticsDict;
- (id)eventName;
- (int64_t)httpCode;
- (int64_t)nsurlErrorCode;
- (unint64_t)activatedCount;
- (unint64_t)requestedTokenCount;
- (void)setActivatedCount:(unint64_t)a3;
- (void)setAuthenticationType:(id)a3;
- (void)setHttpCode:(int64_t)a3;
- (void)setLatency:(double)a3;
- (void)setNsurlErrorCode:(int64_t)a3;
- (void)setProxyURL:(id)a3;
- (void)setProxyVendor:(id)a3;
- (void)setRequestedServerUUID:(id)a3;
- (void)setRequestedTokenCount:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPTokenFetchAnalytics

- (id)eventName
{
  return @"com.apple.nsp.tokenFetch";
}

- (id)analyticsDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(NSPTokenFetchAnalytics *)self proxyURL];
  [v3 setObject:v4 forKeyedSubscript:@"ProxyURL"];

  v5 = [(NSPTokenFetchAnalytics *)self proxyVendor];
  [v3 setObject:v5 forKeyedSubscript:@"ProxyVendor"];

  v6 = [(NSPTokenFetchAnalytics *)self tierType];
  [v3 setObject:v6 forKeyedSubscript:@"TierType"];

  v7 = [(NSPTokenFetchAnalytics *)self authenticationType];
  [v3 setObject:v7 forKeyedSubscript:@"AuthenticationType"];

  v8 = [(NSPTokenFetchAnalytics *)self requestedServerUUID];
  [v3 setObject:v8 forKeyedSubscript:@"RequestedServerUUID"];

  v9 = +[NSNumber numberWithUnsignedInteger:[(NSPTokenFetchAnalytics *)self requestedTokenCount]];
  [v3 setObject:v9 forKeyedSubscript:@"RequestedTokenCount"];

  v10 = +[NSNumber numberWithUnsignedInteger:[(NSPTokenFetchAnalytics *)self activatedCount]];
  [v3 setObject:v10 forKeyedSubscript:@"ActivatedTokenCount"];

  v11 = +[NSNumber numberWithInteger:[(NSPTokenFetchAnalytics *)self httpCode]];
  [v3 setObject:v11 forKeyedSubscript:@"HTTPCode"];

  v12 = +[NSNumber numberWithInteger:[(NSPTokenFetchAnalytics *)self nsurlErrorCode]];
  [v3 setObject:v12 forKeyedSubscript:@"NSURLErrorCode"];

  [(NSPTokenFetchAnalytics *)self latency];
  v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:@"Latency"];

  return v3;
}

- (NSString)proxyURL
{
  return self->_proxyURL;
}

- (void)setProxyURL:(id)a3
{
}

- (NSString)proxyVendor
{
  return self->_proxyVendor;
}

- (void)setProxyVendor:(id)a3
{
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
}

- (NSString)requestedServerUUID
{
  return self->_requestedServerUUID;
}

- (void)setRequestedServerUUID:(id)a3
{
  self->_requestedServerUUID = (NSString *)a3;
}

- (unint64_t)requestedTokenCount
{
  return self->_requestedTokenCount;
}

- (void)setRequestedTokenCount:(unint64_t)a3
{
  self->_requestedTokenCount = a3;
}

- (unint64_t)activatedCount
{
  return self->_activatedCount;
}

- (void)setActivatedCount:(unint64_t)a3
{
  self->_activatedCount = a3;
}

- (int64_t)httpCode
{
  return self->_httpCode;
}

- (void)setHttpCode:(int64_t)a3
{
  self->_httpCode = a3;
}

- (int64_t)nsurlErrorCode
{
  return self->_nsurlErrorCode;
}

- (void)setNsurlErrorCode:(int64_t)a3
{
  self->_nsurlErrorCode = a3;
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_tierType, 0);
  objc_storeStrong((id *)&self->_proxyVendor, 0);

  objc_storeStrong((id *)&self->_proxyURL, 0);
}

@end