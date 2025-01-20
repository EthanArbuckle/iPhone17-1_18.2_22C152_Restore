@interface NTFeedTransformationItemFeedTransformation
- (FCFeedTransforming)feedItemTransformation;
- (NTFeedTransformationItemFeedTransformation)init;
- (NTFeedTransformationItemFeedTransformation)initWithFeedItemTransformation:(id)a3;
- (id)transformFeedItems:(id)a3;
- (void)setFeedItemTransformation:(id)a3;
@end

@implementation NTFeedTransformationItemFeedTransformation

- (NTFeedTransformationItemFeedTransformation)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTFeedTransformationItemFeedTransformation init]";
    __int16 v9 = 2080;
    v10 = "NTFeedTransformationUtilities.m";
    __int16 v11 = 1024;
    int v12 = 25;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTFeedTransformationItemFeedTransformation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTFeedTransformationItemFeedTransformation)initWithFeedItemTransformation:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)NTFeedTransformationItemFeedTransformation;
  id v6 = [(NTFeedTransformationItemFeedTransformation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_feedItemTransformation, a3);
  }

  return v7;
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTFeedTransformationItemFeedTransformation transformFeedItems:]();
  }
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_9)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTFeedTransformationItemFeedTransformation transformFeedItems:]();
  }
  id v5 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  id v6 = objc_opt_new();
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __65__NTFeedTransformationItemFeedTransformation_transformFeedItems___block_invoke_18;
  v16 = &unk_26475D050;
  id v17 = v5;
  id v18 = v6;
  id v7 = v6;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:&v13];
  objc_super v9 = [(NTFeedTransformationItemFeedTransformation *)self feedItemTransformation];
  v10 = [v9 transformFeedItems:v7];

  __int16 v11 = objc_msgSend(v8, "fc_objectsForKeys:", v10);

  return v11;
}

BOOL __65__NTFeedTransformationItemFeedTransformation_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 feedTransformationItem];
  BOOL v3 = v2 == 0;

  return v3;
}

void __65__NTFeedTransformationItemFeedTransformation_transformFeedItems___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 feedTransformationItem];
  [*(id *)(a1 + 32) setObject:v3 forKey:v4];

  [*(id *)(a1 + 40) addObject:v4];
}

- (FCFeedTransforming)feedItemTransformation
{
  return self->_feedItemTransformation;
}

- (void)setFeedItemTransformation:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithFeedItemTransformation:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedItemTransformation", v6, 2u);
}

- (void)transformFeedItems:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![items fc_containsObjectPassingTest:^BOOL(id<NTFeedTransformationItem> item) { return item.feedTransformationItem == nil; }]",
    v6,
    2u);
}

- (void)transformFeedItems:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);
}

@end