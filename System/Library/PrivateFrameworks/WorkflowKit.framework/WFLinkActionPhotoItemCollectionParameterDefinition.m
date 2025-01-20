@interface WFLinkActionPhotoItemCollectionParameterDefinition
- (Class)parameterClass;
- (WFLinkActionPhotoItemCollectionParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)linkValueFromParameterState:(id)a3;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionPhotoItemCollectionParameterDefinition

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [a3 value];
  if (!v4)
  {
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  v5 = [(WFLinkActionParameterDefinition *)self valueType];
  char v6 = [v5 objectIsMemberOfType:v4];

  if ((v6 & 1) == 0)
  {
    v12 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(WFLinkActionParameterDefinition *)self valueType];
      int v15 = 136315650;
      v16 = "-[WFLinkActionPhotoItemCollectionParameterDefinition parameterStateFromLinkValue:]";
      __int16 v17 = 2114;
      v18 = v4;
      __int16 v19 = 2114;
      v20 = v13;
        (uint8_t *)&v15,
        0x20u);
    }
    goto LABEL_12;
  }
  id v7 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = 0;
  if (isKindOfClass) {
    v11 = [(WFVariableSubstitutableParameterState *)[WFPhotoItemCollectionParameterState alloc] initWithValue:v7];
  }

LABEL_13:
  return v11;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void *, void))a7;
  id v16 = v11;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v15 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v16];
    v14[2](v14, v15, 0);
  }
  else
  {

    v14[2](v14, 0, 0);
  }
}

- (id)linkValueFromParameterState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  id v7 = [v6 value];

  if (v7)
  {
    v8 = [v6 value];
    v9 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 items];
    v5 = [v4 firstObject];

    if (v5)
    {
      id v6 = [MEMORY[0x1E4F5AA10] sharedLibrary];
      id v18 = 0;
      id v7 = [v6 systemPhotoLibraryWithError:&v18];
      id v8 = v18;

      if (v7)
      {
        v9 = [v7 librarySpecificFetchOptions];
        uint64_t v19 = 0;
        v20 = &v19;
        uint64_t v21 = 0x2050000000;
        id v10 = (void *)getPHAssetCollectionClass_softClass;
        uint64_t v22 = getPHAssetCollectionClass_softClass;
        if (!getPHAssetCollectionClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getPHAssetCollectionClass_block_invoke;
          v25 = &unk_1E6558B78;
          v26 = &v19;
          __getPHAssetCollectionClass_block_invoke((uint64_t)buf);
          id v10 = (void *)v20[3];
        }
        id v11 = v10;
        _Block_object_dispose(&v19, 8);
        id v12 = [v5 identifier];
        v23 = v12;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
        v14 = [v11 fetchAssetCollectionsWithLocalIdentifiers:v13 options:v9];
        int v15 = [v14 firstObject];

        id v16 = [v15 localizedTitle];
      }
      else
      {
        v9 = getWFGeneralLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[WFLinkActionPhotoItemCollectionParameterDefinition localizedTitleForLinkValue:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get library: %@", buf, 0x16u);
        }
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {

    id v16 = 0;
  }

  return v16;
}

- (id)parameterDefinitionDictionary
{
  int64_t v3 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A68] defaultValue:1];
  id v4 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A60] ofClass:objc_opt_class()];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSNumber numberWithInteger:v3];
  [v5 setValue:v6 forKey:@"PhotoItemCollectionPickerSelectionLimit"];

  [v5 setValue:v4 forKey:@"PhotoItemCollectionPickerMode"];
  v10.receiver = self;
  v10.super_class = (Class)WFLinkActionPhotoItemCollectionParameterDefinition;
  id v7 = [(WFLinkActionParameterDefinition *)&v10 parameterDefinitionDictionary];
  id v8 = [v7 definitionByAddingEntriesInDictionary:v5];

  return v8;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionPhotoItemCollectionParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F72B70];
  id v5 = a3;
  id v6 = [v4 photoItemCollectionValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionPhotoItemCollectionParameterDefinition;
  id v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end