@interface LNEntity(WFSerializableContent)
+ (id)valueFromSerializedRepresentation:()WFSerializableContent metadata:variableProvider:parameter:;
- (id)wfSerializedRepresentation;
@end

@implementation LNEntity(WFSerializableContent)

- (id)wfSerializedRepresentation
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if ([a1 isTransient])
  {
    v17[0] = @"typeIdentifier";
    v2 = [a1 identifier];
    v3 = [v2 typeIdentifier];
    v17[1] = @"instanceIdentifier";
    v18[0] = v3;
    v4 = [a1 identifier];
    v5 = [v4 instanceIdentifier];
    v18[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

    v7 = [a1 properties];
    v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_64082);

    v9 = (void *)MEMORY[0x1E4F1CA60];
    v15[0] = @"identifier";
    v15[1] = @"properties";
    v16[0] = v6;
    v16[1] = v8;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    v11 = [v9 dictionaryWithDictionary:v10];

    v12 = [a1 managedAccountIdentifier];
    objc_msgSend(v11, "if_setValueIfNonNil:forKey:", v12, @"managedAccountIdentifier");

    v13 = [a1 prototypeMangledTypeName];
    objc_msgSend(v11, "if_setValueIfNonNil:forKey:", v13, @"prototypeMangledTypeName");
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)valueFromSerializedRepresentation:()WFSerializableContent metadata:variableProvider:parameter:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v9;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;
  if ([v14 count])
  {
    v15 = [v14 objectForKeyedSubscript:@"identifier"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = [v15 objectForKeyedSubscript:@"typeIdentifier"];
      id v17 = [v15 objectForKeyedSubscript:@"instanceIdentifier"];
    }
    else
    {

      v16 = [v10 identifier];
      v15 = [v14 objectForKeyedSubscript:@"identifier"];
      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v18 = v15;
        }
        else {
          v18 = 0;
        }
      }
      else
      {
        v18 = 0;
      }
      id v17 = v18;
    }
    v20 = v17;

    v19 = 0;
    if (v16 && v20)
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F72C30]) initWithTypeIdentifier:v16 instanceIdentifier:v20];
      if (v10 && ([v10 isTransient] & 1) != 0)
      {
        v22 = [v14 objectForKeyedSubscript:@"properties"];
        id v40 = v11;
        if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          id v23 = v14;
          if (v23)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v24 = v23;
            }
            else {
              v24 = 0;
            }
          }
          else
          {
            v24 = 0;
          }
          id v25 = v24;

          v26 = objc_msgSend(v25, "if_compactMap:", &__block_literal_global_278_64116);

          v22 = [v26 allValues];

          id v11 = v40;
        }
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __105__LNEntity_WFSerializableContent__valueFromSerializedRepresentation_metadata_variableProvider_parameter___block_invoke_2;
        v41[3] = &unk_1E65570C0;
        id v42 = v10;
        id v43 = v11;
        id v44 = v12;
        v39 = v22;
        uint64_t v27 = objc_msgSend(v22, "if_compactMap:", v41);
        v28 = [v14 objectForKeyedSubscript:@"prototypeMangledTypeName"];
        if (v28)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v29 = v28;
          }
          else {
            v29 = 0;
          }
        }
        else
        {
          v29 = 0;
        }
        id v30 = v29;

        v31 = [v14 objectForKeyedSubscript:@"managedAccountIdentifier"];
        id v38 = v12;
        v32 = v30;
        v33 = (void *)v27;
        v34 = v21;
        if (v31)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v35 = v31;
          }
          else {
            v35 = 0;
          }
        }
        else
        {
          v35 = 0;
        }
        id v36 = v35;

        v19 = (void *)[objc_alloc(MEMORY[0x1E4F72C28]) initWithTransient:1 identifier:v34 properties:v33 prototypeMangledTypeName:v32 managedAccountIdentifier:v36];
        v21 = v34;

        id v11 = v40;
        id v12 = v38;
      }
      else
      {
        v19 = (void *)[objc_alloc(MEMORY[0x1E4F72C28]) initWithIdentifier:v21];
      }
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end