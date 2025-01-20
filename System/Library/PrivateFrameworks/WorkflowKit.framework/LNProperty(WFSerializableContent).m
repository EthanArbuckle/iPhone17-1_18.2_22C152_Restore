@interface LNProperty(WFSerializableContent)
+ (id)valueFromSerializedRepresentation:()WFSerializableContent metadata:variableProvider:parameter:;
- (id)wfSerializedRepresentation;
@end

@implementation LNProperty(WFSerializableContent)

- (id)wfSerializedRepresentation
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA60];
  v9 = @"identifier";
  v3 = [a1 identifier];
  v10[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v5 = [v2 dictionaryWithDictionary:v4];

  v6 = [a1 value];
  v7 = [v6 wfSerializedRepresentation];
  objc_msgSend(v5, "if_setValueIfNonNil:forKey:", v7, @"value");

  return v5;
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
  if (![v14 count])
  {
    v22 = 0;
    goto LABEL_16;
  }
  v15 = [v14 objectForKeyedSubscript:@"identifier"];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [v10 identifier];
      int v17 = [v16 isEqualToString:v15];

      if (!v17)
      {
        v22 = 0;
        goto LABEL_15;
      }
      v18 = [v14 objectForKeyedSubscript:@"value"];
      v19 = (void *)MEMORY[0x1E4F72E10];
      v20 = [v10 valueType];
      v21 = [v19 valueFromSerializedRepresentation:v18 valueType:v20 variableProvider:v11 parameter:v12];

      v22 = (void *)[objc_alloc(MEMORY[0x1E4F72D20]) initWithIdentifier:v15 value:v21];
    }
    else
    {
      v22 = 0;
      v18 = v15;
      v15 = 0;
    }
  }
  else
  {
    v18 = 0;
    v22 = 0;
  }

LABEL_15:
LABEL_16:

  return v22;
}

@end