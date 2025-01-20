@interface WFLinkActionParameterDefinition
- (BOOL)BOOLForTypeSpecificMetadataKey:(id)a3 defaultValue:(BOOL)a4;
- (Class)parameterClass;
- (LNActionParameterMetadata)parameterMetadata;
- (LNValueType)valueType;
- (NSDictionary)typeSpecificMetadata;
- (WFLinkActionParameterDefinition)initWithValueType:(id)a3 parameterMetadata:(id)a4;
- (WFParameterDefinition)parameterDefinitionDictionary;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValues:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)linkValueWithValue:(id)a3;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)objectForTypeSpecificMetadataKey:(id)a3 ofClass:(Class)a4;
- (id)parameterStateFromLinkValue:(id)a3;
- (int64_t)integerForTypeSpecificMetadataKey:(id)a3 defaultValue:(int64_t)a4;
- (void)getLinkArrayValuesFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionParameterDefinition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
}

- (id)objectForTypeSpecificMetadataKey:(id)a3 ofClass:(Class)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(WFLinkActionParameterDefinition *)self typeSpecificMetadata];
  v8 = [v7 objectForKey:v6];

  id v9 = v8;
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315906;
      v15 = "WFEnforceClass";
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2114;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      Class v21 = a4;
      id v12 = v19;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v14, 0x2Au);
    }
    id v10 = 0;
  }
  else
  {
    id v10 = v9;
  }

  return v10;
}

- (NSDictionary)typeSpecificMetadata
{
  v2 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  v3 = [v2 typeSpecificMetadata];

  return (NSDictionary *)v3;
}

- (WFLinkActionParameterDefinition)initWithValueType:(id)a3 parameterMetadata:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFLinkActionParameterDefinition.m", 26, @"Invalid parameter not satisfying: %@", @"valueType" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFLinkActionParameterDefinition.m", 27, @"Invalid parameter not satisfying: %@", @"parameterMetadata" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFLinkActionParameterDefinition;
  v11 = [(WFLinkActionParameterDefinition *)&v17 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_valueType, a3);
    objc_storeStrong((id *)&v12->_parameterMetadata, a4);
    v13 = v12;
  }

  return v12;
}

- (id)linkValueWithValue:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    goto LABEL_30;
  }
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F72E10]);
    id v10 = [MEMORY[0x1E4F72CB8] fileValueType];
    id v5 = (id)[v9 initWithValue:v8 valueType:v10];
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(WFLinkActionParameterDefinition *)self valueType],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v6 value],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v11 objectIsMemberOfType:v12],
        v12,
        v11,
        !v13))
  {
    id v14 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v10 = v15;

    if ([v10 count])
    {
      id v16 = objc_alloc(MEMORY[0x1E4F72E10]);
      id v17 = objc_alloc(MEMORY[0x1E4F72B08]);
      __int16 v18 = [v10 firstObject];
      id v19 = [v18 valueType];
      __int16 v20 = (void *)[v17 initWithMemberValueType:v19];
      id v5 = (id)[v16 initWithValue:v14 valueType:v20];
    }
    else
    {
      Class v21 = [(WFLinkActionParameterDefinition *)self valueType];
      char v22 = [v21 objectIsMemberOfType:v14];

      if ((v22 & 1) == 0)
      {
        v23 = getWFAppIntentsLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          v24 = [(WFLinkActionParameterDefinition *)self valueType];
          int v28 = 136315650;
          v29 = "-[WFLinkActionParameterDefinition linkValueWithValue:]";
          __int16 v30 = 2112;
          id v31 = v14;
          __int16 v32 = 2112;
          v33 = v24;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = getWFAppIntentsLogObject();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          int v28 = 136315138;
          v29 = "-[WFLinkActionParameterDefinition linkValueWithValue:]";
          _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_DEBUG, "%s Temporarily returning nil for a NSDictionary used to initialize a LNValue", (uint8_t *)&v28, 0xCu);
        }

        id v5 = 0;
        goto LABEL_28;
      }
      id v26 = objc_alloc(MEMORY[0x1E4F72E10]);
      __int16 v18 = [(WFLinkActionParameterDefinition *)self valueType];
      id v5 = (id)[v26 initWithValue:v14 valueType:v18];
    }

LABEL_28:
    goto LABEL_29;
  }
  id v5 = v6;
LABEL_29:

LABEL_30:
  return v5;
}

- (WFParameterDefinition)parameterDefinitionDictionary
{
  v3 = objc_opt_new();
  id v4 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  id v5 = [v4 name];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v5, @"Key");

  id v6 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  v7 = objc_msgSend(v6, "wf_localizedTitle");
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, @"Label");

  id v8 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  id v9 = objc_msgSend(v8, "wf_localizedTitle");
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v9, @"Placeholder");

  id v10 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  v11 = objc_msgSend(v10, "wf_localizedDescription");
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v11, @"Description");

  id v12 = NSStringFromClass([(WFLinkActionParameterDefinition *)self parameterClass]);
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v12, @"Class");

  int v13 = [(WFLinkActionParameterDefinition *)self typeSpecificMetadata];
  id v14 = [v13 objectForKey:*MEMORY[0x1E4F72A00]];

  v15 = [(WFLinkActionParameterDefinition *)self defaultSerializedRepresentationFromParameterMetadataDefaultValue:v14];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v15, @"DefaultValue");

  id v16 = [[WFParameterDefinition alloc] initWithDictionary:v3];
  return v16;
}

- (LNActionParameterMetadata)parameterMetadata
{
  return self->_parameterMetadata;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v4 = a3;
  id v5 = [(WFLinkActionParameterDefinition *)self valueType];
  [v5 objectClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = [v7 value];

  id v9 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v8];

  return v9;
}

- (void)getLinkArrayValuesFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
}

- (BOOL)BOOLForTypeSpecificMetadataKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:v6 ofClass:objc_opt_class()];

  if (v7) {
    a4 = [v7 BOOLValue];
  }

  return a4;
}

- (int64_t)integerForTypeSpecificMetadataKey:(id)a3 defaultValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:v6 ofClass:objc_opt_class()];

  if (v7) {
    a4 = [v7 integerValue];
  }

  return a4;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v3 = a3;
  id result = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[WFLinkActionParameterDefinition localizedTitleForValue:parameterMetadata:] must be overridden"];
  __break(1u);
  return result;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  id v3 = a3;
  id result = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[WFLinkActionParameterDefinition parameterStateFromLinkValue:] must be overridden"];
  __break(1u);
  return result;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValues:(id)a3
{
  return 0;
}

- (Class)parameterClass
{
  Class result = (Class)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[WFLinkActionParameterDefinition parameterClassWithParameterMetadata:] must be overridden"];
  __break(1u);
  return result;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v10 = a7;
  id v11 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:a3];
  (*((void (**)(id, id, void))a7 + 2))(v10, v11, 0);
}

@end