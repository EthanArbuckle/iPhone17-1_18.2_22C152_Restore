@interface WFWorkflowDatabaseRunDescriptor
@end

@implementation WFWorkflowDatabaseRunDescriptor

void __116__WFWorkflowDatabaseRunDescriptor_Conversion__donateRunInteractionWithDatabase_workflowReference_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getWFGeneralLogObject();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = [*(id *)(a1 + 32) identifier];
      int v14 = 136315650;
      v15 = "-[WFWorkflowDatabaseRunDescriptor(Conversion) donateRunInteractionWithDatabase:workflowReference:completionH"
            "andler:]_block_invoke";
      __int16 v16 = 2112;
      v17 = v6;
      __int16 v18 = 2114;
      id v19 = v3;
      v7 = "%s Failed to donate interaction for %@: %{public}@";
      v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 32;
LABEL_6:
      _os_log_impl(&dword_1C7F0A000, v8, v9, v7, (uint8_t *)&v14, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [*(id *)(a1 + 32) identifier];
    int v14 = 136315394;
    v15 = "-[WFWorkflowDatabaseRunDescriptor(Conversion) donateRunInteractionWithDatabase:workflowReference:completionHan"
          "dler:]_block_invoke";
    __int16 v16 = 2112;
    v17 = v6;
    v7 = "%s Successfully donated interaction for %@";
    v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v11, v12, v13);
}

@end