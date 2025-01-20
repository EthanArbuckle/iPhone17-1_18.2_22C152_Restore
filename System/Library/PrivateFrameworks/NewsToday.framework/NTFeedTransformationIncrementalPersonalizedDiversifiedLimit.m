@interface NTFeedTransformationIncrementalPersonalizedDiversifiedLimit
- (FCFeedTransforming)privateLimitTransformation;
- (NSArray)priorFeedItems;
- (NTFeedTransformationIncrementalPersonalizedDiversifiedLimit)init;
- (NTFeedTransformationIncrementalPersonalizedDiversifiedLimit)initWithFunctionProvider:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5;
- (id)transformFeedItems:(id)a3;
- (void)setPriorFeedItems:(id)a3;
- (void)setPrivateLimitTransformation:(id)a3;
@end

@implementation NTFeedTransformationIncrementalPersonalizedDiversifiedLimit

- (NTFeedTransformationIncrementalPersonalizedDiversifiedLimit)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit init]";
    __int16 v9 = 2080;
    v10 = "NTFeedTransformationIncrementalPersonalizedDiversifiedLimit.m";
    __int16 v11 = 1024;
    int v12 = 25;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTFeedTransformationIncrementalPersonalizedDiversifiedLimit)initWithFunctionProvider:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit initWithFunctionProvider:limit:priorFeedItems:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit initWithFunctionProvider:limit:priorFeedItems:]();
  }
LABEL_6:
  v17.receiver = self;
  v17.super_class = (Class)NTFeedTransformationIncrementalPersonalizedDiversifiedLimit;
  v10 = [(NTFeedTransformationIncrementalPersonalizedDiversifiedLimit *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    priorFeedItems = v10->_priorFeedItems;
    v10->_priorFeedItems = (NSArray *)v11;

    uint64_t v13 = [v9 count];
    uint64_t v14 = [MEMORY[0x263F59498] transformationWithFunctionProvider:v8 limit:v13 + a4];
    privateLimitTransformation = v10->_privateLimitTransformation;
    v10->_privateLimitTransformation = (FCFeedTransforming *)v14;
  }
  return v10;
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit transformFeedItems:]();
  }
  v5 = [(NTFeedTransformationIncrementalPersonalizedDiversifiedLimit *)self priorFeedItems];
  id v6 = objc_msgSend(MEMORY[0x263EFF8C0], "fc_arrayByAddingObjectsFromArray:toArray:", v4, v5);
  v7 = [(NTFeedTransformationIncrementalPersonalizedDiversifiedLimit *)self privateLimitTransformation];
  id v8 = [v7 transformFeedItems:v6];

  if ((objc_msgSend(v8, "fc_containsObjectsAtFront:", v5) & 1) == 0
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit transformFeedItems:]();
  }
  id v9 = objc_msgSend(v8, "fc_arrayByRemovingObjectsInArray:", v5);

  return v9;
}

- (NSArray)priorFeedItems
{
  return self->_priorFeedItems;
}

- (void)setPriorFeedItems:(id)a3
{
}

- (FCFeedTransforming)privateLimitTransformation
{
  return self->_privateLimitTransformation;
}

- (void)setPrivateLimitTransformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateLimitTransformation, 0);

  objc_storeStrong((id *)&self->_priorFeedItems, 0);
}

- (void)initWithFunctionProvider:limit:priorFeedItems:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"priorFeedItems", v6, 2u);
}

- (void)initWithFunctionProvider:limit:priorFeedItems:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"functionProvider", v6, 2u);
}

- (void)transformFeedItems:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"private transformation must return the prior items at the start of the array"];
  int v1 = 136315906;
  int v2 = "-[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit transformFeedItems:]";
  __int16 v3 = 2080;
  int v4 = "NTFeedTransformationIncrementalPersonalizedDiversifiedLimit.m";
  __int16 v5 = 1024;
  int v6 = 57;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

- (void)transformFeedItems:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedItems", v6, 2u);
}

@end