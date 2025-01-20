@interface NTCatchUpOperationArticleIDsRequest
- (NSCopying)identifier;
- (NSDictionary)overrideHeadlineMetadataByArticleID;
- (NSOrderedSet)articleIDs;
- (NTCatchUpOperationArticleIDsRequest)init;
- (NTCatchUpOperationArticleIDsRequest)initWithArticleIDs:(id)a3 overrideHeadlineMetadataByArticleID:(id)a4;
- (void)setArticleIDs:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOverrideHeadlineMetadataByArticleID:(id)a3;
@end

@implementation NTCatchUpOperationArticleIDsRequest

- (NTCatchUpOperationArticleIDsRequest)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTCatchUpOperationArticleIDsRequest init]";
    __int16 v9 = 2080;
    v10 = "NTCatchUpOperationRequest.m";
    __int16 v11 = 1024;
    int v12 = 99;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTCatchUpOperationArticleIDsRequest init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTCatchUpOperationArticleIDsRequest)initWithArticleIDs:(id)a3 overrideHeadlineMetadataByArticleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationArticleIDsRequest initWithArticleIDs:overrideHeadlineMetadataByArticleID:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationArticleIDsRequest initWithArticleIDs:overrideHeadlineMetadataByArticleID:]();
  }
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)NTCatchUpOperationArticleIDsRequest;
  v8 = [(NTCatchUpOperationArticleIDsRequest *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F08C38] UUID];
    identifier = v8->_identifier;
    v8->_identifier = (NSCopying *)v9;

    uint64_t v11 = [v6 copy];
    articleIDs = v8->_articleIDs;
    v8->_articleIDs = (NSOrderedSet *)v11;

    uint64_t v13 = [v7 copy];
    overrideHeadlineMetadataByArticleID = v8->_overrideHeadlineMetadataByArticleID;
    v8->_overrideHeadlineMetadataByArticleID = (NSDictionary *)v13;
  }
  return v8;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSOrderedSet)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
}

- (NSDictionary)overrideHeadlineMetadataByArticleID
{
  return self->_overrideHeadlineMetadataByArticleID;
}

- (void)setOverrideHeadlineMetadataByArticleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHeadlineMetadataByArticleID, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithArticleIDs:overrideHeadlineMetadataByArticleID:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"overrideHeadlineMetadataByArticleID", v6, 2u);
}

- (void)initWithArticleIDs:overrideHeadlineMetadataByArticleID:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleIDs", v6, 2u);
}

@end