@interface INFile(Workflow)
+ (id)compatibleFileTypeForContentItem:()Workflow availableTypes:;
+ (id)wf_fileWithBookmarkData:()Workflow filename:;
+ (id)wf_fileWithFileRepresentation:()Workflow bookmarkData:displayName:;
+ (id)wf_fileWithFileRepresentation:()Workflow displayName:;
+ (uint64_t)wf_contentItemClass;
+ (uint64_t)wf_processParameterValue:()Workflow parameterState:coerceToSupportedUTIs:array:dynamicOptions:completionHandler:;
+ (void)coerceContentItems:()Workflow toSupportedUTIs:completion:;
+ (void)coerceContentItemsIfAppropriate:()Workflow toSupportedUTIs:withParameterStates:dynamicOptions:completion:;
+ (void)getINFileRepresentationsFromContent:()Workflow byCoercingToSupportedUTIs:withParameterState:dynamicOptions:completion:;
- (id)wf_contentItemWithCodableAttribute:()Workflow;
- (id)wf_fileRepresentation;
- (id)wf_initWithBookmarkData:()Workflow filename:typeIdentifier:removedOnCompletion:;
- (id)wf_initWithData:()Workflow filename:fileURL:typeIdentifier:removedOnCompletion:;
- (void)wf_transformUsingCodableAttribute:()Workflow completionHandler:;
@end

@implementation INFile(Workflow)

- (id)wf_fileRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB4718];
  v3 = [a1 typeIdentifier];
  v4 = [v2 typeWithString:v3];

  v5 = [a1 fileURL];

  if (v5)
  {
    if ([a1 _hasAssociatedAuditToken])
    {
      v6 = [a1 fileURL];
      [a1 _associatedAuditToken];
      int v7 = objc_msgSend(v6, "wf_sandboxAllowsReadingFileWithAuditToken:", v28);

      if (!v7)
      {
        v12 = 0;
        goto LABEL_18;
      }
    }
    if ([a1 removedOnCompletion]) {
      uint64_t v8 = 9;
    }
    else {
      uint64_t v8 = 8;
    }
    v9 = (void *)MEMORY[0x1E4F5A900];
    v10 = [a1 fileURL];
    v11 = [a1 filename];
    v12 = [v9 fileWithURL:v10 options:v8 ofType:v4 proposedFilename:v11];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F5A900];
    v14 = [a1 data];
    v15 = [a1 filename];
    v12 = [v13 fileWithData:v14 ofType:v4 proposedFilename:v15];
  }
  id v16 = a1;
  v17 = [v16 _itemProviderRequestMetadata];
  v18 = [v17 metadata];

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v20 = objc_opt_class();
    v21 = [v16 _itemProviderRequestMetadata];
    v22 = [v21 metadata];
    id v29 = 0;
    v23 = [v19 unarchivedObjectOfClass:v20 fromData:v22 error:&v29];
    id v24 = v29;

    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      v26 = getWFGeneralLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "WFItemProviderRequestMetadataWithINFile";
        __int16 v32 = 2112;
        id v33 = v24;
        _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_ERROR, "%s Could not unarchive item provider metadata with error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v23 = 0;
  }

  [v12 setMetadata:v23];
LABEL_18:

  return v12;
}

- (void)wf_transformUsingCodableAttribute:()Workflow completionHandler:
{
  id v6 = a4;
  id v8 = v6;
  if (!v6)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"INFile+Workflow.m", 107, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    id v6 = 0;
  }
  (*((void (**)(id, uint64_t))v6 + 2))(v6, a1);
}

- (id)wf_contentItemWithCodableAttribute:()Workflow
{
  v1 = (void *)MEMORY[0x1E4F5A848];
  v2 = objc_msgSend(a1, "wf_fileRepresentation");
  v3 = [v1 itemWithFile:v2];

  return v3;
}

- (id)wf_initWithBookmarkData:()Workflow filename:typeIdentifier:removedOnCompletion:
{
  id v6 = (void *)[a1 _initWithBookmarkData:a3 filename:a4 typeIdentifier:a5 removedOnCompletion:a6];
  return v6;
}

- (id)wf_initWithData:()Workflow filename:fileURL:typeIdentifier:removedOnCompletion:
{
  int v7 = (void *)[a1 _initWithData:a3 filename:a4 fileURL:a5 typeIdentifier:a6 removedOnCompletion:a7];
  return v7;
}

+ (id)compatibleFileTypeForContentItem:()Workflow availableTypes:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 preferredFileType];
  if ([v7 conformsToTypes:v6])
  {
    id v8 = v7;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = objc_msgSend(v5, "supportedTypes", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v17 + 1) + 8 * i);
          if (v14)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v15 = v14;
            }
            else {
              v15 = 0;
            }
          }
          else
          {
            v15 = 0;
          }
          id v8 = v15;

          if ([v8 conformsToTypes:v6])
          {

            goto LABEL_18;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v8 = 0;
  }
LABEL_18:

  return v8;
}

+ (void)coerceContentItems:()Workflow toSupportedUTIs:completion:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_msgSend(v8, "if_map:", &__block_literal_global_190_64904);
  id v12 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v13 = objc_msgSend(v11, "if_compactMap:", &__block_literal_global_194);
  id v14 = (void *)[v12 initWithArray:v13];

  v15 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "+[INFile(Workflow) coerceContentItems:toSupportedUTIs:completion:]";
    __int16 v32 = 2114;
    id v33 = v8;
    __int16 v34 = 2114;
    v35 = v14;
    _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEBUG, "%s Mapped UTIs: %{public}@ to content items: %{public}@", buf, 0x20u);
  }

  id v16 = (void *)MEMORY[0x1E4F5A7E0];
  long long v17 = [v14 array];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_197;
  v24[3] = &unk_1E6557498;
  id v26 = v9;
  uint64_t v27 = a1;
  id v25 = v11;
  id v18 = v11;
  id v19 = v9;
  long long v20 = [v16 requestForCoercingToContentClasses:v17 completionHandler:v24];

  v21 = (void *)MEMORY[0x1E4F5A7D8];
  uint64_t v28 = *MEMORY[0x1E4F5AAC0];
  uint64_t v29 = *MEMORY[0x1E4F5AB88];
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v23 = [v21 optionsWithDictionary:v22];
  [v20 setOptions:v23];

  [v10 performCoercion:v20];
}

+ (void)coerceContentItemsIfAppropriate:()Workflow toSupportedUTIs:withParameterStates:dynamicOptions:completion:
{
  id v13 = a4;
  id v11 = a7;
  id v12 = a3;
  if (![v13 count] || a6) {
    [v12 getFileRepresentations:v11 forType:0];
  }
  else {
    [a1 coerceContentItems:v12 toSupportedUTIs:v13 completion:v11];
  }
}

+ (void)getINFileRepresentationsFromContent:()Workflow byCoercingToSupportedUTIs:withParameterState:dynamicOptions:completion:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [v14 parameterStates];
    long long v17 = [v16 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      id v19 = v16;
    }
    else {
      id v19 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25[0] = v14;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    }
    else
    {
      id v19 = 0;
    }
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __127__INFile_Workflow__getINFileRepresentationsFromContent_byCoercingToSupportedUTIs_withParameterState_dynamicOptions_completion___block_invoke;
  v22[3] = &unk_1E6558040;
  id v23 = v19;
  id v24 = v15;
  id v20 = v19;
  id v21 = v15;
  [a1 coerceContentItemsIfAppropriate:v12 toSupportedUTIs:v13 withParameterStates:v20 dynamicOptions:a6 completion:v22];
}

+ (uint64_t)wf_processParameterValue:()Workflow parameterState:coerceToSupportedUTIs:array:dynamicOptions:completionHandler:
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__INFile_Workflow__wf_processParameterValue_parameterState_coerceToSupportedUTIs_array_dynamicOptions_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6557398;
  id v18 = v17;
  id v50 = v18;
  char v51 = a6;
  id v19 = _Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = (void *)MEMORY[0x1E4F5A830];
    [MEMORY[0x1E4F5A848] itemWithFile:v14];
    id v43 = v14;
    id v21 = v18;
    uint64_t v22 = a7;
    id v23 = v19;
    id v24 = v16;
    v26 = id v25 = v15;
    v53[0] = v26;
    uint64_t v27 = 1;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    uint64_t v29 = [v20 collectionWithItems:v28];

    id v15 = v25;
    id v16 = v24;
    id v19 = v23;
    uint64_t v30 = v22;
    id v18 = v21;
    id v14 = v43;
    [a1 getINFileRepresentationsFromContent:v29 byCoercingToSupportedUTIs:v16 withParameterState:v15 dynamicOptions:v30 completion:v23];

    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [v14 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v33 = (void *)MEMORY[0x1E4F5A830];
      __int16 v34 = objc_msgSend(v14, "if_map:", &__block_literal_global_64913);
      v35 = [v33 collectionWithItems:v34];

      [a1 getINFileRepresentationsFromContent:v35 byCoercingToSupportedUTIs:v16 withParameterState:v15 dynamicOptions:a7 completion:v19];
LABEL_10:
      uint64_t v27 = 1;
      goto LABEL_11;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 getINFileRepresentationsFromContent:v14 byCoercingToSupportedUTIs:v16 withParameterState:v15 dynamicOptions:a7 completion:v19];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*((void (**)(id, id, void))v18 + 2))(v18, v14, 0);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = v15;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v37 = v14;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v46;
      while (2)
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = objc_opt_class();
          if (v42 == objc_opt_class())
          {
            (*((void (**)(id, id, void))v18 + 2))(v18, v37, 0);

            uint64_t v27 = 1;
            goto LABEL_24;
          }
          ++v41;
        }
        while (v39 != v41);
        uint64_t v39 = [v37 countByEnumeratingWithState:&v45 objects:v52 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }

    uint64_t v27 = 0;
LABEL_24:
    id v15 = v44;
  }
  else
  {
    uint64_t v27 = 0;
  }
LABEL_11:

  return v27;
}

+ (uint64_t)wf_contentItemClass
{
  return objc_opt_class();
}

+ (id)wf_fileWithBookmarkData:()Workflow filename:
{
  id v5 = (objc_class *)MEMORY[0x1E4F30420];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = objc_msgSend(v8, "wf_initWithBookmarkData:filename:typeIdentifier:removedOnCompletion:", v7, v6, 0, 0);

  return v9;
}

+ (id)wf_fileWithFileRepresentation:()Workflow bookmarkData:displayName:
{
  id v7 = a3;
  id v8 = (objc_class *)MEMORY[0x1E4F30420];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 alloc];
  id v12 = v9;
  if (!v9)
  {
    id v12 = [v7 filename];
  }
  id v13 = [v7 wfType];
  id v14 = [v13 string];
  id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "deletesFileOnDeallocation"));
  id v16 = objc_msgSend(v11, "wf_initWithBookmarkData:filename:typeIdentifier:removedOnCompletion:", v10, v12, v14, v15);

  if (!v9) {
  id v17 = WFINItemProviderRequestMetadataWithFileRepresentation(v7);
  }
  [v16 _setItemProviderRequestMetadata:v17];

  if ([v7 deletesFileOnDeallocation]) {
    [v16 _setMarkedForDeletionOnDeallocation:1];
  }

  return v16;
}

+ (id)wf_fileWithFileRepresentation:()Workflow displayName:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 filename];
  }
  id v9 = v8;
  uint64_t v10 = [v5 initialRepresentationType];
  id v11 = objc_alloc(MEMORY[0x1E4F30420]);
  if (v10)
  {
    id v12 = [v5 fileURL];
    id v13 = [v5 wfType];
    id v14 = [v13 string];
    id v15 = v11;
    id v16 = 0;
    id v17 = v9;
    id v18 = v12;
  }
  else
  {
    id v12 = [v5 data];
    id v13 = [v5 wfType];
    id v14 = [v13 string];
    id v15 = v11;
    id v16 = v12;
    id v17 = v9;
    id v18 = 0;
  }
  id v19 = objc_msgSend(v15, "wf_initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:", v16, v17, v18, v14, 0);

  id v20 = WFINItemProviderRequestMetadataWithFileRepresentation(v5);
  [v19 _setItemProviderRequestMetadata:v20];

  if ([v5 deletesFileOnDeallocation]) {
    [v19 _setMarkedForDeletionOnDeallocation:1];
  }

  return v19;
}

@end