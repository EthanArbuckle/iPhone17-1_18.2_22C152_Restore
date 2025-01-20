@interface NTPersonalizedSectionLimitTransformation
- (NSOrderedSet)mandatoryArticleIDs;
- (NSOrderedSet)personalizedArticleIDs;
- (NTPersonalizedSectionLimitTransformation)init;
- (NTPersonalizedSectionLimitTransformation)initWithMandatoryArticleIDs:(id)a3 personalizedArticleIDs:(id)a4 limit:(unint64_t)a5;
- (id)transformFeedItems:(id)a3;
- (unint64_t)limit;
- (void)setLimit:(unint64_t)a3;
- (void)setMandatoryArticleIDs:(id)a3;
- (void)setPersonalizedArticleIDs:(id)a3;
@end

@implementation NTPersonalizedSectionLimitTransformation

- (NTPersonalizedSectionLimitTransformation)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTPersonalizedSectionLimitTransformation init]";
    __int16 v9 = 2080;
    v10 = "NTPersonalizedSectionTransformations.m";
    __int16 v11 = 1024;
    int v12 = 116;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTPersonalizedSectionLimitTransformation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTPersonalizedSectionLimitTransformation)initWithMandatoryArticleIDs:(id)a3 personalizedArticleIDs:(id)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTPersonalizedSectionLimitTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:limit:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPersonalizedSectionLimitTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:limit:]();
  }
LABEL_6:
  if ([v8 intersectsOrderedSet:v9]
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTPersonalizedSectionLimitTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:limit:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)NTPersonalizedSectionLimitTransformation;
  v10 = [(NTPersonalizedSectionLimitTransformation *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    mandatoryArticleIDs = v10->_mandatoryArticleIDs;
    v10->_mandatoryArticleIDs = (NSOrderedSet *)v11;

    uint64_t v13 = [v9 copy];
    personalizedArticleIDs = v10->_personalizedArticleIDs;
    v10->_personalizedArticleIDs = (NSOrderedSet *)v13;

    v10->_limit = a5;
  }

  return v10;
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPersonalizedSectionLimitTransformation transformFeedItems:]();
  }
  v5 = [(NTPersonalizedSectionLimitTransformation *)self mandatoryArticleIDs];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = -1;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __63__NTPersonalizedSectionLimitTransformation_transformFeedItems___block_invoke;
  v19 = &unk_26475D368;
  id v6 = v5;
  id v20 = v6;
  v21 = &v22;
  [v4 enumerateObjectsWithOptions:2 usingBlock:&v16];
  unint64_t v7 = [(NTPersonalizedSectionLimitTransformation *)self limit];
  uint64_t v8 = v23[3];
  uint64_t v9 = v8 + 1;
  unint64_t v10 = v7 - (v8 + 1);
  if (v7 <= v8 + 1)
  {
    v14 = objc_msgSend(v4, "fc_subarrayUpToCountInclusive:", v7);
  }
  else
  {
    uint64_t v11 = objc_msgSend(v4, "fc_subarrayUpToCountInclusive:", v8 + 1);
    int v12 = objc_msgSend(v4, "fc_safeSubarrayWithCountFromBack:", objc_msgSend(v4, "count") - v9);
    uint64_t v13 = objc_msgSend(v12, "fc_subarrayWithMaxCount:", v10);

    v14 = objc_msgSend(MEMORY[0x263EFF8C0], "fc_arrayByAddingObjectsFromArray:toArray:", v13, v11);
  }
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __63__NTPersonalizedSectionLimitTransformation_transformFeedItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [a2 articleID];
  LODWORD(v7) = [v7 containsObject:v8];

  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (NSOrderedSet)mandatoryArticleIDs
{
  return self->_mandatoryArticleIDs;
}

- (void)setMandatoryArticleIDs:(id)a3
{
}

- (NSOrderedSet)personalizedArticleIDs
{
  return self->_personalizedArticleIDs;
}

- (void)setPersonalizedArticleIDs:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedArticleIDs, 0);

  objc_storeStrong((id *)&self->_mandatoryArticleIDs, 0);
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:limit:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![mandatoryArticleIDs intersectsOrderedSet:personalizedArticleIDs]", v6, 2u);
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:limit:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"personalizedArticleIDs", v6, 2u);
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:limit:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"mandatoryArticleIDs", v6, 2u);
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