@interface WFLinkActionEntityParameterDefinition
- (BOOL)isUniqueEntity;
- (Class)parameterClass;
- (WFLinkActionEntityParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)entityMetadata;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterStateFromLinkValue:(id)a3;
@end

@implementation WFLinkActionEntityParameterDefinition

- (BOOL)isUniqueEntity
{
  v2 = [(WFLinkActionEntityParameterDefinition *)self entityMetadata];
  v3 = [v2 systemProtocolMetadata];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F72930]];
  BOOL v5 = v4 != 0;

  return v5;
}

- (WFLinkActionEntityParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v5 = a3;
  v6 = [v5 valueType];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v7 = [v5 valueType];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v9 = v8;

    v10 = [v9 memberValueType];

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v11 = v10;
      v6 = v11;
    }
    else
    {

      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"WFLinkActionEntityParameterDefinition.m", 32, @"Invalid parameter not satisfying: %@", @"valueType" object file lineNumber description];
      v6 = 0;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)WFLinkActionEntityParameterDefinition;
  v12 = [(WFLinkActionParameterDefinition *)&v14 initWithValueType:v6 parameterMetadata:v5];

  return v12;
}

- (id)entityMetadata
{
  v2 = [(WFLinkActionParameterDefinition *)self typeSpecificMetadata];
  v3 = [v2 objectForKeyedSubscript:@"LNValueTypeSpecificMetadataKeyLinkEntityMetadata"];

  return v3;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 value];
  if (v5)
  {
    v6 = [(WFLinkActionParameterDefinition *)self valueType];
    char v7 = [v6 objectIsMemberOfType:v5];

    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F72C08]) initWithValue:v4 indentationLevel:0];
      id v9 = [WFLinkDynamicOptionSubstitutableState alloc];
      v10 = [v8 title];
      id v11 = objc_msgSend(v10, "wf_localizedString");
      v12 = [v8 subtitle];
      v13 = objc_msgSend(v12, "wf_localizedString");
      objc_super v14 = [v8 image];
      v15 = objc_msgSend(v14, "wf_image");
      v16 = [(WFLinkDynamicOptionSubstitutableState *)v9 initWithValue:v8 localizedTitle:v11 localizedSubtitle:v13 image:v15];

      goto LABEL_8;
    }
    v17 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [(WFLinkActionParameterDefinition *)self valueType];
      int v20 = 136315650;
      v21 = "-[WFLinkActionEntityParameterDefinition parameterStateFromLinkValue:]";
      __int16 v22 = 2114;
      v23 = v5;
      __int16 v24 = 2114;
      v25 = v18;
        (uint8_t *)&v20,
        0x20u);
    }
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = [v7 value];
    id v9 = [v8 value];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  v3 = [a3 displayRepresentation];
  id v4 = [v3 title];
  id v5 = objc_msgSend(v4, "wf_localizedString");

  return v5;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

@end