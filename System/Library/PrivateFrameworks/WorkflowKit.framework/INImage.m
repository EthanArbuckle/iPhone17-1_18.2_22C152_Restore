@interface INImage
@end

@implementation INImage

void __73__INImage_Workflow__wf_transformUsingCodableAttribute_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v7 = getWFIntentExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[INImage(Workflow) wf_transformUsingCodableAttribute:completionHandler:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to retrieve INImage data with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end