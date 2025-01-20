@interface INFile
@end

@implementation INFile

void __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_197(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8 = [v6 items];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_2_198;
    v9[3] = &unk_1E6557470;
    uint64_t v11 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 32);
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v9, *(void *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_2_198(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  v8 = [*(id *)(a1 + 40) compatibleFileTypeForContentItem:v6 availableTypes:*(void *)(a1 + 32)];
  if (!v8)
  {
    v9 = getWFIntentExecutionLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = [v6 supportedTypes];
      *(_DWORD *)buf = 136315906;
      v16 = "+[INFile(Workflow) coerceContentItems:toSupportedUTIs:completion:]_block_invoke_2";
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2114;
      uint64_t v20 = v10;
      __int16 v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Unable to find matching type for content item: %{public}@. Requested types: %{public}@, Supported types: %{public}@", buf, 0x2Au);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_199;
  v13[3] = &unk_1E6557448;
  id v14 = v7;
  id v12 = v7;
  [v6 getFileRepresentation:v13 forType:v8];
}

uint64_t __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_199(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F5A858];
  id v3 = a2;
  v4 = [v2 sharedRegistry];
  v5 = [v4 contentItemClassForType:v3];

  return v5;
}

uint64_t __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB4718] typeWithString:a2];
}

void __127__INFile_Workflow__getINFileRepresentationsFromContent_byCoercingToSupportedUTIs_withParameterState_dynamicOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __127__INFile_Workflow__getINFileRepresentationsFromContent_byCoercingToSupportedUTIs_withParameterState_dynamicOptions_completion___block_invoke_2;
    v6[3] = &unk_1E65573E0;
    id v7 = *(id *)(a1 + 32);
    v4 = objc_msgSend(a2, "if_compactMap:", v6);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

id __127__INFile_Workflow__getINFileRepresentationsFromContent_byCoercingToSupportedUTIs_withParameterState_dynamicOptions_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  id v7 = [v6 value];
  id v8 = v5;
  v9 = [v7 bookmarkData];

  uint64_t v10 = (void *)MEMORY[0x1E4F30420];
  if (v9)
  {
    uint64_t v11 = [v7 bookmarkData];
    id v12 = [v7 displayName];
    v13 = objc_msgSend(v10, "wf_fileWithFileRepresentation:bookmarkData:displayName:", v8, v11, v12);
  }
  else
  {
    uint64_t v11 = [v7 displayName];
    v13 = objc_msgSend(v10, "wf_fileWithFileRepresentation:displayName:", v8, v11);
    id v12 = v8;
  }

  objc_setAssociatedObject(v13, sel_wf_fileWithFileRepresentation_displayName_, v8, (void *)1);
  return v13;
}

void __121__INFile_Workflow__wf_processParameterValue_parameterState_coerceToSupportedUTIs_array_dynamicOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    int v6 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
    else
    {
      id v8 = [v9 firstObject];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __121__INFile_Workflow__wf_processParameterValue_parameterState_coerceToSupportedUTIs_array_dynamicOptions_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5A848] itemWithFile:a2];
}

@end