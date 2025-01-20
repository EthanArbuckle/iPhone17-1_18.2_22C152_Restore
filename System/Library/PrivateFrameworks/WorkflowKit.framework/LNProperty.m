@interface LNProperty
@end

@implementation LNProperty

uint64_t __82__LNProperty_WFFetchValue__wf_getValueForEntity_entityMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __82__LNProperty_WFFetchValue__wf_getValueForEntity_entityMetadata_completionHandler___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [*(id *)(a1 + 32) identifier];
      int v9 = 136315650;
      v10 = "-[LNProperty(WFFetchValue) wf_getValueForEntity:entityMetadata:completionHandler:]_block_invoke";
      __int16 v11 = 2112;
      v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Unable to fetch value for property with identifier: %@ - %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end