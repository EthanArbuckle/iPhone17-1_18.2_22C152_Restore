@interface LNEntity
@end

@implementation LNEntity

uint64_t __61__LNEntity_WFSerializableContent__wfSerializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 wfSerializedRepresentation];
}

id __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;
  v6 = [v5 objectForKeyedSubscript:@"identifier"];
  v7 = [*(id *)(a1 + 32) properties];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke_3;
  v12[3] = &unk_1E6557128;
  id v13 = v6;
  id v8 = v6;
  v9 = objc_msgSend(v7, "if_firstObjectPassingTest:", v12);

  v10 = [MEMORY[0x1E4F72D20] valueFromSerializedRepresentation:v5 metadata:v9 variableProvider:*(void *)(a1 + 40) parameter:*(void *)(a1 + 48)];

  return v10;
}

uint64_t __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke(int a1, id a2, void *a3, void *a4, void *a5)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  *a4 = v8;
  v15 = a3;
  v16[0] = @"identifier";
  v16[1] = @"value";
  v17[0] = v8;
  v14 = @"value";
  v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a3;
  id v11 = v8;
  v12 = [v9 dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  *a5 = v13;
}

@end