@interface NTPersonalizedSectionSortTransformation
- (FCFeedTransforming)sortTransformation;
- (NSOrderedSet)mandatoryArticleIDs;
- (NSOrderedSet)personalizedArticleIDs;
- (NTPersonalizedSectionSortTransformation)init;
- (NTPersonalizedSectionSortTransformation)initWithMandatoryArticleIDs:(id)a3 personalizedArticleIDs:(id)a4 sortTransformation:(id)a5;
- (id)transformFeedItems:(id)a3;
- (void)setMandatoryArticleIDs:(id)a3;
- (void)setPersonalizedArticleIDs:(id)a3;
- (void)setSortTransformation:(id)a3;
@end

@implementation NTPersonalizedSectionSortTransformation

- (NTPersonalizedSectionSortTransformation)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTPersonalizedSectionSortTransformation init]";
    __int16 v9 = 2080;
    v10 = "NTPersonalizedSectionTransformations.m";
    __int16 v11 = 1024;
    int v12 = 23;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTPersonalizedSectionSortTransformation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTPersonalizedSectionSortTransformation)initWithMandatoryArticleIDs:(id)a3 personalizedArticleIDs:(id)a4 sortTransformation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTPersonalizedSectionSortTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:].cold.4();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPersonalizedSectionSortTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:]();
  }
LABEL_6:
  if ([v8 intersectsOrderedSet:v9]
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTPersonalizedSectionSortTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:]();
    if (v10) {
      goto LABEL_11;
    }
  }
  else if (v10)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPersonalizedSectionSortTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:]();
  }
LABEL_11:
  v17.receiver = self;
  v17.super_class = (Class)NTPersonalizedSectionSortTransformation;
  __int16 v11 = [(NTPersonalizedSectionSortTransformation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    mandatoryArticleIDs = v11->_mandatoryArticleIDs;
    v11->_mandatoryArticleIDs = (NSOrderedSet *)v12;

    uint64_t v14 = [v9 copy];
    personalizedArticleIDs = v11->_personalizedArticleIDs;
    v11->_personalizedArticleIDs = (NSOrderedSet *)v14;

    objc_storeStrong((id *)&v11->_sortTransformation, a5);
  }

  return v11;
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPersonalizedSectionSortTransformation transformFeedItems:]();
  }
  v5 = [(NTPersonalizedSectionSortTransformation *)self mandatoryArticleIDs];
  id v6 = [(NTPersonalizedSectionSortTransformation *)self personalizedArticleIDs];
  v7 = objc_opt_new();
  id v8 = objc_opt_new();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke;
  v20[3] = &unk_26475D318;
  id v9 = v5;
  id v21 = v9;
  id v22 = v7;
  id v23 = v6;
  id v24 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  [v4 enumerateObjectsUsingBlock:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke_22;
  v18[3] = &unk_26475D340;
  id v19 = v9;
  id v13 = v9;
  [v12 sortUsingComparator:v18];
  uint64_t v14 = [(NTPersonalizedSectionSortTransformation *)self sortTransformation];
  uint64_t v15 = [v14 transformFeedItems:v10];

  v16 = objc_msgSend(MEMORY[0x263EFF8C0], "fc_arrayByAddingObjectsFromArray:toArray:", v15, v12);

  return v16;
}

void __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 articleID];
  if ([*(id *)(a1 + 32) containsObject:v4])
  {
    v5 = *(void **)(a1 + 40);
LABEL_5:
    [v5 addObject:v3];
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 48) containsObject:v4])
  {
    v5 = *(void **)(a1 + 56);
    goto LABEL_5;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke_cold_1();
  }
LABEL_8:
}

uint64_t __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [a2 articleID];
  id v9 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));
  id v10 = NSNumber;
  id v11 = *(void **)(a1 + 32);
  id v12 = [v7 articleID];

  id v13 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));
  uint64_t v14 = [v9 compare:v13];

  return v14;
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

- (FCFeedTransforming)sortTransformation
{
  return self->_sortTransformation;
}

- (void)setSortTransformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortTransformation, 0);
  objc_storeStrong((id *)&self->_personalizedArticleIDs, 0);

  objc_storeStrong((id *)&self->_mandatoryArticleIDs, 0);
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sortTransformation", v6, 2u);
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![mandatoryArticleIDs intersectsOrderedSet:personalizedArticleIDs]", v6, 2u);
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"personalizedArticleIDs", v6, 2u);
}

- (void)initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:.cold.4()
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

void __62__NTPersonalizedSectionSortTransformation_transformFeedItems___block_invoke_cold_1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
  int v1 = 136315906;
  int v2 = "-[NTPersonalizedSectionSortTransformation transformFeedItems:]_block_invoke";
  __int16 v3 = 2080;
  int v4 = "NTPersonalizedSectionTransformations.m";
  __int16 v5 = 1024;
  int v6 = 84;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end