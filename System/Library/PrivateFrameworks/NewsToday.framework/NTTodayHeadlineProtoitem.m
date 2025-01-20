@interface NTTodayHeadlineProtoitem
- (BOOL)isEqual:(id)a3;
- (FCHeadlineProviding)headline;
- (NSString)identifier;
- (NSURL)actionURL;
- (NTTodayHeadlineProtoitem)init;
- (NTTodayHeadlineProtoitem)initWithIdentifier:(id)a3 headline:(id)a4 actionURL:(id)a5;
- (NTTodayHeadlineProtoitem)itemWithContentContext:(id)a3 operationInfo:(id)a4 sectionDescriptor:(id)a5 todayData:(id)a6 assetFileURLsByRemoteURL:(id)a7;
- (id)assetHandlesWithOperationInfo:(id)a3;
- (unint64_t)hash;
@end

@implementation NTTodayHeadlineProtoitem

- (NTTodayHeadlineProtoitem)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTTodayHeadlineProtoitem init]";
    __int16 v9 = 2080;
    v10 = "NTTodayHeadlineProtoitem.m";
    __int16 v11 = 1024;
    int v12 = 28;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTTodayHeadlineProtoitem init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTTodayHeadlineProtoitem)initWithIdentifier:(id)a3 headline:(id)a4 actionURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayHeadlineProtoitem initWithIdentifier:headline:actionURL:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayHeadlineProtoitem initWithIdentifier:headline:actionURL:]();
  }
LABEL_6:
  v19.receiver = self;
  v19.super_class = (Class)NTTodayHeadlineProtoitem;
  __int16 v11 = [(NTTodayHeadlineProtoitem *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    headline = v11->_headline;
    v11->_headline = (FCHeadlineProviding *)v14;

    uint64_t v16 = [v10 copy];
    actionURL = v11->_actionURL;
    v11->_actionURL = (NSURL *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5)
  {
    id v6 = [(NTTodayHeadlineProtoitem *)self identifier];
    v7 = [v5 identifier];
    if ([v6 isEqual:v7])
    {
      id v8 = [(NTTodayHeadlineProtoitem *)self headline];
      id v9 = [v5 headline];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(NTTodayHeadlineProtoitem *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(NTTodayHeadlineProtoitem *)self headline];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)assetHandlesWithOperationInfo:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayHeadlineProtoitem assetHandlesWithOperationInfo:]();
  }
  v5 = [(NTTodayHeadlineProtoitem *)self headline];
  unint64_t v6 = (void *)MEMORY[0x263EFF8C0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__NTTodayHeadlineProtoitem_assetHandlesWithOperationInfo___block_invoke;
  v11[3] = &unk_26475C020;
  id v12 = v4;
  id v13 = v5;
  id v7 = v5;
  id v8 = v4;
  id v9 = objc_msgSend(v6, "fc_array:", v11);

  return v9;
}

void __58__NTTodayHeadlineProtoitem_assetHandlesWithOperationInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) thumbnailSizePreset];
  v5 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) dynamicThumbnailSizeMinimumSizeInPixels];
  unint64_t v6 = NTHeadlineThumbnailFromFCHeadline(v5, v4);
  id v7 = [v6 thumbnailAssetHandle];

  id v8 = NTSharedLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v17 = 138412290;
      uint64_t v18 = v10;
      _os_log_impl(&dword_22592C000, v8, OS_LOG_TYPE_INFO, "Including thumbnailAssetHandle for headline: %@", (uint8_t *)&v17, 0xCu);
    }

    [v3 addObject:v7];
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v17 = 138412290;
      uint64_t v18 = v11;
      _os_log_impl(&dword_22592C000, v8, OS_LOG_TYPE_INFO, "Missing thumbnailAssetHandle for headline: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  id v12 = NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline(*(void **)(a1 + 40), [*(id *)(a1 + 32) sourceNameImageSizePreset]);
  id v13 = NTSharedLog();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      int v17 = 138412290;
      uint64_t v18 = v15;
      _os_log_impl(&dword_22592C000, v13, OS_LOG_TYPE_INFO, "Including nameImageMaskAssetHandle for headline: %@", (uint8_t *)&v17, 0xCu);
    }

    [v3 addObject:v12];
  }
  else
  {
    if (v14)
    {
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = 138412290;
      uint64_t v18 = v16;
      _os_log_impl(&dword_22592C000, v13, OS_LOG_TYPE_INFO, "Missing nameImageMaskAssetHandle for headline: %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (NTTodayHeadlineProtoitem)itemWithContentContext:(id)a3 operationInfo:(id)a4 sectionDescriptor:(id)a5 todayData:(id)a6 assetFileURLsByRemoteURL:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v28 = a6;
  id v15 = a7;
  uint64_t v16 = v12;
  if (!v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayHeadlineProtoitem itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:].cold.4();
    if (v13) {
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayHeadlineProtoitem itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:]();
  }
LABEL_6:
  if (!v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayHeadlineProtoitem itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:]();
    if (v15) {
      goto LABEL_11;
    }
  }
  else if (v15)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayHeadlineProtoitem itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:]();
  }
LABEL_11:
  int v17 = [(NTTodayHeadlineProtoitem *)self headline];
  v27 = NTHeadlineAdElementFromFCHeadline(v17);
  uint64_t v18 = NTHeadlineAnalyticsElementFromFCHeadline(v17, [v14 seenArticlesFilterMethod]);
  uint64_t v19 = NTHeadlineBackingElementFromFCHeadline(v17);
  v20 = [(NTTodayHeadlineProtoitem *)self actionURL];
  uint64_t v21 = [v13 thumbnailSizePreset];
  [v13 dynamicThumbnailSizeMinimumSizeInPixels];
  uint64_t v22 = [v13 sourceNameImageSizePreset];
  [v13 assetsDirectoryFileURL];
  v23 = v26 = v14;
  v24 = NTHeadlineFromFCHeadline(v17, v20, v16, v21, v22, v27, v18, v19, v28, v23, v15);

  return (NTTodayHeadlineProtoitem *)v24;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_headline, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:headline:actionURL:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

- (void)initWithIdentifier:headline:actionURL:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);
}

- (void)assetHandlesWithOperationInfo:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);
}

- (void)itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetFileURLsByRemoteURL", v6, 2u);
}

- (void)itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptor", v6, 2u);
}

- (void)itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);
}

- (void)itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);
}

@end