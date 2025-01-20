@interface SYFileExtendedAttributes
+ (void)fetchPrivateAttributesForFileURL:(id)a3 completion:(id)a4;
+ (void)setPrivateAttributes:(id)a3 forFileURL:(id)a4 completion:(id)a5;
@end

@implementation SYFileExtendedAttributes

+ (void)fetchPrivateAttributesForFileURL:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"fileURL must not be nil" userInfo:0];
    objc_exception_throw(v12);
  }
  v7 = v6;
  v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v5 path];
    *(_DWORD *)buf = 138477827;
    v16 = v9;
    _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_INFO, "Fetching private attributes for url path: %{private}@", buf, 0xCu);
  }
  v13 = v5;
  v14 = v7;
  id v10 = v7;
  id v11 = v5;
  _MDItemFetchPrivateAttributesForURL();
}

void __72__SYFileExtendedAttributes_fetchPrivateAttributesForFileURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [*(id *)(a1 + 32) path];
    int v10 = 138478339;
    id v11 = v8;
    __int16 v12 = 2113;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "Finished fetching private attributes for url path: %{private}@, attrs: %{private}@, error: %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

+ (void)setPrivateAttributes:(id)a3 forFileURL:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    id v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3B8];
    uint64_t v17 = @"attributes must not be nil";
    goto LABEL_8;
  }
  if (!v8)
  {
    id v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3B8];
    uint64_t v17 = @"fileURL must not be nil";
LABEL_8:
    id v18 = [v15 exceptionWithName:v16 reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  int v10 = v9;
  id v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = [v8 path];
    *(_DWORD *)buf = 138478083;
    id v22 = v7;
    __int16 v23 = 2113;
    v24 = v12;
    _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_INFO, "Setting private attributes: %{private}@, for url path: %{private}@", buf, 0x16u);
  }
  v19 = v8;
  v20 = v10;
  id v13 = v10;
  id v14 = v8;
  _MDItemSetPrivateAttributesForURL();
}

void __71__SYFileExtendedAttributes_setPrivateAttributes_forFileURL_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) path];
    int v7 = 138478083;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_INFO, "Finished setting private attributes for url path: %{private}@, error: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

@end