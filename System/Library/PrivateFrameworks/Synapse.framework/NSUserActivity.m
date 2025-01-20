@interface NSUserActivity
- (id)_syDocument;
- (void)set_syDocument:(void *)a1;
@end

@implementation NSUserActivity

void __82__NSUserActivity_SYInternalExtensions___syFetchCurrentUserActivityWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__NSUserActivity_SYInternalExtensions___syFetchCurrentUserActivityWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_syDocument
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    v2 = [v1 _payloadForIdentifier:@"com.apple.synapse.document"];
    if (v2)
    {
      v3 = +[SYDocument documentFromData:v2];
    }
    else
    {
      v3 = 0;
    }

    objc_sync_exit(v1);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)set_syDocument:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    id v8 = 0;
    id v5 = [v3 dataRepresentationWithError:&v8];
    id v6 = v8;
    if (v6)
    {
      v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NSUserActivity set_syDocument:]((uint64_t)v6, v7);
      }
    }
    if (v5) {
      [v4 _setPayload:v5 object:0 identifier:@"com.apple.synapse.document"];
    }

    objc_sync_exit(v4);
  }
}

void __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = SYCanUseObjectInContextInfo(v7);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_5;
  }
  v9 = os_log_create("com.apple.synapse", "");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke_cold_2((uint64_t)v7, v9);
  }

  *a4 = 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = SYCanUseObjectInContextInfo(v8);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      v10 = os_log_create("com.apple.synapse", "");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke_cold_1((uint64_t)v7, v10);
      }

      *a4 = 1;
    }
  }
}

- (void)set_syDocument:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Unable to encode document, error: %@", (uint8_t *)&v2, 0xCu);
}

void __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v5 = 138412290;
  id v6 = (id)objc_opt_class();
  id v3 = v6;
  OUTLINED_FUNCTION_0_3(&dword_1C2C5F000, a2, v4, "Invalid value of class %@ in linkContextInfo dictionary.", (uint8_t *)&v5);
}

void __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v5 = 138412290;
  id v6 = (id)objc_opt_class();
  id v3 = v6;
  OUTLINED_FUNCTION_0_3(&dword_1C2C5F000, a2, v4, "Invalid key of class %@ in linkContextInfo dictionary.", (uint8_t *)&v5);
}

void __82__NSUserActivity_SYInternalExtensions___syFetchCurrentUserActivityWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C2C5F000, a2, a3, "Fetching current user activity failed with error: %@", (uint8_t *)&v3);
}

@end