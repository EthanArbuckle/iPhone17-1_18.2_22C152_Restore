@interface RCRequestInfo(News)
@end

@implementation RCRequestInfo(News)

- (void)initWithRequestKey:()News responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "responseKey");
  *(_DWORD *)buf = 136315906;
  v2 = "-[RCRequestInfo(News) initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:]";
  __int16 v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCRequestInfo+News.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

- (void)initWithRequestKey:()News responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:.cold.2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "requestKey");
  *(_DWORD *)buf = 136315906;
  v2 = "-[RCRequestInfo(News) initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:]";
  __int16 v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCRequestInfo+News.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

@end