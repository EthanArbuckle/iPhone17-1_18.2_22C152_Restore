@interface NTLocalNewsPromotionTransformation
- (NSString)localNewsTagID;
- (NTFeedTransforming)baseTransformation;
- (NTLocalNewsPromotionTransformation)init;
- (NTLocalNewsPromotionTransformation)initWithLocalNewsTagID:(id)a3 localNewsPromotionIndex:(unint64_t)a4 baseTransformation:(id)a5;
- (id)transformFeedItems:(id)a3;
- (unint64_t)localNewsPromotionIndex;
@end

@implementation NTLocalNewsPromotionTransformation

- (NTLocalNewsPromotionTransformation)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTLocalNewsPromotionTransformation init]";
    __int16 v9 = 2080;
    v10 = "NTLocalNewsPromotionTransformation.m";
    __int16 v11 = 1024;
    int v12 = 29;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTLocalNewsPromotionTransformation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTLocalNewsPromotionTransformation)initWithLocalNewsTagID:(id)a3 localNewsPromotionIndex:(unint64_t)a4 baseTransformation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTLocalNewsPromotionTransformation initWithLocalNewsTagID:localNewsPromotionIndex:baseTransformation:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)NTLocalNewsPromotionTransformation;
  v10 = [(NTLocalNewsPromotionTransformation *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    localNewsTagID = v10->_localNewsTagID;
    v10->_localNewsTagID = (NSString *)v11;

    v10->_localNewsPromotionIndex = a4;
    objc_storeStrong((id *)&v10->_baseTransformation, a5);
  }

  return v10;
}

- (id)transformFeedItems:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NTLocalNewsPromotionTransformation *)self baseTransformation];
  id v6 = [v5 transformFeedItems:v4];

  v7 = [(NTLocalNewsPromotionTransformation *)self localNewsTagID];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_14;
    v25[3] = &unk_26475C638;
    id v10 = v9;
    id v26 = v10;
    uint64_t v11 = objc_msgSend(v4, "fc_firstObjectPassingTest:", v25);
    if (v11)
    {
      int v12 = (void *)[v6 mutableCopy];
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_16;
      v21 = &unk_26475C638;
      __int16 v13 = &v22;
      id v22 = v10;
      objc_msgSend(v12, "fc_removeObjectsPassingTest:", &v18);
      unint64_t v14 = objc_msgSend(v12, "count", v18, v19, v20, v21);
      unint64_t v15 = [(NTLocalNewsPromotionTransformation *)self localNewsPromotionIndex];
      if (v14 >= v15) {
        unint64_t v14 = v15;
      }
      [v11 markAsLocal];
      [v12 insertObject:v11 atIndex:v14];
      v16 = NTSharedLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v30 = v14;
        _os_log_impl(&dword_22592C000, v16, OS_LOG_TYPE_INFO, "inserting local news article into For You at position %ld", buf, 0xCu);
      }
    }
    else
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_2;
      v23[3] = &unk_26475D0E8;
      __int16 v13 = &v24;
      id v24 = v6;
      int v12 = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_2((uint64_t)v23);
    }
  }
  else
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke;
    v27[3] = &unk_26475D0E8;
    id v28 = v6;
    int v12 = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke((uint64_t)v27);
    id v10 = v28;
  }

  return v12;
}

id __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke(uint64_t a1)
{
  v2 = NTSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22592C000, v2, OS_LOG_TYPE_INFO, "returning For You without regard for local news because we have no tag ID", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);

  return v3;
}

uint64_t __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_14(uint64_t a1, void *a2)
{
  v3 = [a2 surfacedByChannelID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_2(uint64_t a1)
{
  v2 = NTSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22592C000, v2, OS_LOG_TYPE_ERROR, "returning For You without regard for local news because we could not find any articles for the local news channel", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);

  return v3;
}

uint64_t __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_16(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (NSString)localNewsTagID
{
  return self->_localNewsTagID;
}

- (unint64_t)localNewsPromotionIndex
{
  return self->_localNewsPromotionIndex;
}

- (NTFeedTransforming)baseTransformation
{
  return self->_baseTransformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseTransformation, 0);

  objc_storeStrong((id *)&self->_localNewsTagID, 0);
}

- (void)initWithLocalNewsTagID:localNewsPromotionIndex:baseTransformation:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "baseTransformation");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTLocalNewsPromotionTransformation initWithLocalNewsTagID:localNewsPromotionIndex:baseTransformation:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTLocalNewsPromotionTransformation.m";
  __int16 v5 = 1024;
  int v6 = 36;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end