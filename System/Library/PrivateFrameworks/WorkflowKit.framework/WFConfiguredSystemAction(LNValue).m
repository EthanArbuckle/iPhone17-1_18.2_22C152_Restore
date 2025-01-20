@interface WFConfiguredSystemAction(LNValue)
+ (id)systemActionWithLegacyEntity:()LNValue;
+ (id)systemActionWithValue:()LNValue;
- (id)asLNValue;
@end

@implementation WFConfiguredSystemAction(LNValue)

- (id)asLNValue
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = [a1 identifier];
  id v37 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v37];
  id v4 = v37;
  if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F72E10]);
    v6 = [v3 base64EncodedStringWithOptions:0];
    id v36 = v4;
    v7 = [MEMORY[0x1E4F72D18] stringValueType];
    v8 = [v5 initWithValue:v6 valueType:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F72E10]);
    v10 = [a1 identifier];
    v11 = [MEMORY[0x1E4F72D18] stringValueType];
    v35 = (void *)[v9 initWithValue:v10 valueType:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F72E10]);
    v13 = [a1 name];
    v14 = [MEMORY[0x1E4F72D18] stringValueType];
    v34 = (void *)[v12 initWithValue:v13 valueType:v14];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F72C30]) initWithTypeIdentifier:@"ConfiguredShortcut" instanceIdentifier:v2];
    id v16 = objc_alloc(MEMORY[0x1E4F72C28]);
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F72D20]) initWithIdentifier:@"identifier" value:v35];
    v38[0] = v17;
    v18 = v2;
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F72D20]) initWithIdentifier:@"name" value:v34];
    v38[1] = v19;
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F72D20]) initWithIdentifier:@"encodedSystemAction" value:v8];
    v38[2] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
    v22 = (void *)[v16 initWithTransient:1 identifier:v15 properties:v21 managedAccountIdentifier:0];

    id v23 = objc_alloc(MEMORY[0x1E4F72C00]);
    id v24 = objc_alloc(MEMORY[0x1E4F72DA0]);
    v25 = [a1 name];
    v26 = [a1 name];
    v27 = (void *)[v24 initWithKey:v25 defaultValue:v26 table:0 bundleURL:0];
    v28 = (void *)[v23 initWithTitle:v27 subtitle:0 image:0];

    id v29 = objc_alloc(MEMORY[0x1E4F72E10]);
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F72C58]) initWithIdentifier:@"ConfiguredShortcut"];
    v31 = v29;
    v2 = v18;
    v32 = (void *)[v31 initWithValue:v22 valueType:v30 displayRepresentation:v28];

    id v4 = v36;
  }
  else
  {
    v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v40 = "-[WFConfiguredSystemAction(LNValue) asLNValue]";
      __int16 v41 = 2112;
      v42 = a1;
      __int16 v43 = 2114;
      id v44 = v4;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Could not archive system action: %@ with error: %{public}@", buf, 0x20u);
    }
    v32 = 0;
  }

  return v32;
}

+ (id)systemActionWithLegacyEntity:()LNValue
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 identifier];
  id v5 = [v4 typeIdentifier];
  if (v5 == @"ConfiguredShortcut")
  {
  }
  else
  {
    v6 = v5;
    if (!v5)
    {

LABEL_10:
      id v9 = getWFGeneralLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = [v3 identifier];
        v14 = [v13 typeIdentifier];
        int v17 = 136315394;
        v18 = "+[WFConfiguredSystemAction(LNValue) systemActionWithLegacyEntity:]";
        __int16 v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Could not create system action from entity because the type identifier is of %{public}@ and not ConfiguredShortcut", (uint8_t *)&v17, 0x16u);
      }
      id v12 = 0;
      goto LABEL_21;
    }
    char v7 = [@"ConfiguredShortcut" isEqualToString:v5];

    if ((v7 & 1) == 0) {
      goto LABEL_10;
    }
  }
  v8 = [v3 identifier];
  id v9 = [v8 instanceIdentifier];

  if (v9)
  {
    v10 = +[WFDatabase defaultDatabase];
    v11 = [v10 referenceForWorkflowID:v9 includingTombstones:0];
    if (v11)
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB4620]) initWithWorkflow:v11 shortcutsMetadata:0];
    }
    else
    {
      v15 = getWFGeneralLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        v18 = "+[WFConfiguredSystemAction(LNValue) systemActionWithLegacyEntity:]";
        __int16 v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Could not create reference for workflowID: %@", (uint8_t *)&v17, 0x16u);
      }

      id v12 = 0;
    }
  }
  else
  {
    v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      v18 = "+[WFConfiguredSystemAction(LNValue) systemActionWithLegacyEntity:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Could not create reference due to missing workflow identifier", (uint8_t *)&v17, 0xCu);
    }
    id v12 = 0;
  }

LABEL_21:
  return v12;
}

+ (id)systemActionWithValue:()LNValue
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 value];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [v5 properties];
    char v7 = objc_msgSend(v6, "if_firstObjectPassingTest:", &__block_literal_global_59755);

    if (v7)
    {
      v8 = [v7 value];
      id v9 = [v8 value];

      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
        v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:0];
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          id v12 = getWFGeneralLogObject();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            int v15 = 136315138;
            id v16 = "+[WFConfiguredSystemAction(LNValue) systemActionWithValue:]";
            _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Could not get system action from data", (uint8_t *)&v15, 0xCu);
          }

          v11 = 0;
        }
      }
      else
      {

        id v9 = getWFGeneralLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136315394;
          id v16 = "+[WFConfiguredSystemAction(LNValue) systemActionWithValue:]";
          __int16 v17 = 2112;
          v18 = v7;
          _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Could not create system action from property: %@", (uint8_t *)&v15, 0x16u);
        }
        v11 = 0;
      }
    }
    else
    {
      v13 = getWFGeneralLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315394;
        id v16 = "+[WFConfiguredSystemAction(LNValue) systemActionWithValue:]";
        __int16 v17 = 2112;
        v18 = v5;
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEFAULT, "%s Could not create system action from LNEntity: %@, attempting legacy deserialization", (uint8_t *)&v15, 0x16u);
      }

      v11 = [a1 systemActionWithLegacyEntity:v5];
    }
  }
  else
  {

    id v5 = getWFGeneralLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      id v16 = "+[WFConfiguredSystemAction(LNValue) systemActionWithValue:]";
      __int16 v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Could not create system action from value: %@", (uint8_t *)&v15, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

@end