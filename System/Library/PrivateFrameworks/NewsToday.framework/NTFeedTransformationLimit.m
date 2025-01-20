@interface NTFeedTransformationLimit
- (NTFeedTransformationLimit)init;
- (NTFeedTransformationLimit)initWithLimit:(unint64_t)a3;
- (id)transformFeedItems:(id)a3;
- (unint64_t)limit;
- (void)setLimit:(unint64_t)a3;
@end

@implementation NTFeedTransformationLimit

- (NTFeedTransformationLimit)initWithLimit:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTFeedTransformationLimit;
  result = [(NTFeedTransformationLimit *)&v5 init];
  if (result) {
    result->_limit = a3;
  }
  return result;
}

- (NTFeedTransformationLimit)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTFeedTransformationLimit init]";
    __int16 v9 = 2080;
    v10 = "NTFeedTransformationUtilities.m";
    __int16 v11 = 1024;
    int v12 = 79;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  objc_super v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTFeedTransformationLimit init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTFeedTransformationLimit transformFeedItems:]();
  }
  objc_super v5 = objc_msgSend(v4, "fc_subarrayWithMaxCount:", -[NTFeedTransformationLimit limit](self, "limit"));

  return v5;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void)transformFeedItems:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedItems", v6, 2u);
}

@end