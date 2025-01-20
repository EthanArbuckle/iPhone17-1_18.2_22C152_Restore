@interface NTCatchUpOperationForYouFetchInfo
- (BOOL)attemptedCachedOnly;
- (NSDictionary)feedContextByFeedID;
- (NTCatchUpOperationForYouFetchInfo)init;
- (NTCatchUpOperationForYouFetchInfo)initWithAttemptedCachedOnly:(BOOL)a3 feedContextByFeedID:(id)a4;
@end

@implementation NTCatchUpOperationForYouFetchInfo

- (NTCatchUpOperationForYouFetchInfo)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTCatchUpOperationForYouFetchInfo init]";
    __int16 v9 = 2080;
    v10 = "NTCatchUpOperation.m";
    __int16 v11 = 1024;
    int v12 = 576;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTCatchUpOperationForYouFetchInfo init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTCatchUpOperationForYouFetchInfo)initWithAttemptedCachedOnly:(BOOL)a3 feedContextByFeedID:(id)a4
{
  id v6 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationForYouFetchInfo initWithAttemptedCachedOnly:feedContextByFeedID:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)NTCatchUpOperationForYouFetchInfo;
  v7 = [(NTCatchUpOperationForYouFetchInfo *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_attemptedCachedOnly = a3;
    uint64_t v9 = [v6 copy];
    feedContextByFeedID = v8->_feedContextByFeedID;
    v8->_feedContextByFeedID = (NSDictionary *)v9;
  }
  return v8;
}

- (BOOL)attemptedCachedOnly
{
  return self->_attemptedCachedOnly;
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void).cxx_destruct
{
}

- (void)initWithAttemptedCachedOnly:feedContextByFeedID:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedContextByFeedID", v6, 2u);
}

@end