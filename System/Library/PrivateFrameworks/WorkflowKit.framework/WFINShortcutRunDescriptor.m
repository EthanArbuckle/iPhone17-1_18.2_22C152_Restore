@interface WFINShortcutRunDescriptor
@end

@implementation WFINShortcutRunDescriptor

void __110__WFINShortcutRunDescriptor_Conversion__donateRunInteractionWithDatabase_workflowReference_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getWFGeneralLogObject();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v15 = 136315650;
      v16 = "-[WFINShortcutRunDescriptor(Conversion) donateRunInteractionWithDatabase:workflowReference:completionHandler:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      __int16 v19 = 2114;
      id v20 = v3;
      v7 = "%s Failed to donate interaction for %@: %{public}@";
      v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 32;
LABEL_6:
      _os_log_impl(&dword_1C7F0A000, v8, v9, v7, (uint8_t *)&v15, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v15 = 136315394;
    v16 = "-[WFINShortcutRunDescriptor(Conversion) donateRunInteractionWithDatabase:workflowReference:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    v7 = "%s Successfully donated interaction for %@";
    v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v12, v13, v14);
}

@end