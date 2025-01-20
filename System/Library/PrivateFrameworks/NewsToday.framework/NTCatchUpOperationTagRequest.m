@interface NTCatchUpOperationTagRequest
- (NSString)tagID;
- (NTCatchUpOperationTagRequest)init;
- (NTCatchUpOperationTagRequest)initWithTagTodaySectionSpecificConfig:(id)a3 tagID:(id)a4;
- (int64_t)cutoffTime;
- (int64_t)fetchingBin;
- (unint64_t)headlinesPerFeedFetchCount;
@end

@implementation NTCatchUpOperationTagRequest

- (NTCatchUpOperationTagRequest)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTCatchUpOperationTagRequest init]";
    __int16 v9 = 2080;
    v10 = "NTCatchUpOperationRequest.m";
    __int16 v11 = 1024;
    int v12 = 133;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTCatchUpOperationTagRequest init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTCatchUpOperationTagRequest)initWithTagTodaySectionSpecificConfig:(id)a3 tagID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationTagRequest initWithTagTodaySectionSpecificConfig:tagID:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationTagRequest initWithTagTodaySectionSpecificConfig:tagID:]();
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NTCatchUpOperationTagRequest;
  v8 = [(NTCatchUpOperationTagRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    tagID = v8->_tagID;
    v8->_tagID = (NSString *)v9;

    v8->_cutoffTime = [v6 cutoffTime];
    v8->_headlinesPerFeedFetchCount = [v6 headlinesPerFeedFetchCount];
    int v11 = [v6 fetchingBin];
    uint64_t v12 = v11 == 1;
    if (v11 == 2) {
      uint64_t v12 = 2;
    }
    v8->_fetchingBin = v12;
  }

  return v8;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (int64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (unint64_t)headlinesPerFeedFetchCount
{
  return self->_headlinesPerFeedFetchCount;
}

- (int64_t)fetchingBin
{
  return self->_fetchingBin;
}

- (void).cxx_destruct
{
}

- (void)initWithTagTodaySectionSpecificConfig:tagID:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID", v6, 2u);
}

- (void)initWithTagTodaySectionSpecificConfig:tagID:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagTodaySectionSpecificConfig", v6, 2u);
}

@end