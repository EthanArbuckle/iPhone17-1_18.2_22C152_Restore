@interface WFLinkActionDateComponentsParameterDefinition
- (Class)parameterClass;
- (WFLinkActionDateComponentsParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)dateComponentsFromDateValue:(id)a3;
- (id)dateComponentsFromStringValue:(id)a3 error:(id *)a4;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (int64_t)dateFormat;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionDateComponentsParameterDefinition

- (int64_t)dateFormat
{
  return [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729E0] defaultValue:2];
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(WFLinkActionDateComponentsParameterDefinition *)self dateFormat];
  int64_t v6 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729E8] defaultValue:0];
  v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v8 = [v4 value];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  id v11 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v12 = v11;
  if (v6 == 1)
  {
    [v11 setCalendar:v7];
    [v12 setUnitsStyle:2];
    uint64_t v13 = 252;
    if (!v5) {
      uint64_t v13 = 28;
    }
    if (v5 == 1) {
      uint64_t v14 = 224;
    }
    else {
      uint64_t v14 = v13;
    }
    [v12 setAllowedUnits:v14];
    v15 = [v12 stringFromDateComponents:v10];
  }
  else
  {
    v16 = [WFDateFieldParameter alloc];
    v17 = [(WFLinkActionDateComponentsParameterDefinition *)self parameterDefinitionDictionary];
    v18 = [(WFDateFieldParameter *)v16 initWithDefinition:v17];

    v19 = [v7 dateFromComponents:v10];

    v20 = [(WFDateFieldParameter *)v18 hintDateFormatter];
    v15 = [v20 stringFromDate:v19];

    v10 = v18;
  }

  return v15;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 value];
  if (!v4)
  {
LABEL_16:
    v20 = 0;
    goto LABEL_19;
  }
  int64_t v5 = [(WFLinkActionParameterDefinition *)self valueType];
  char v6 = [v5 objectIsMemberOfType:v4];

  if ((v6 & 1) == 0)
  {
    v18 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [(WFLinkActionParameterDefinition *)self valueType];
      int v28 = 136315650;
      v29 = "-[WFLinkActionDateComponentsParameterDefinition parameterStateFromLinkValue:]";
      __int16 v30 = 2114;
      v31 = v4;
      __int16 v32 = 2114;
      v33 = v19;
        (uint8_t *)&v28,
        0x20u);
    }
    goto LABEL_16;
  }
  int64_t v7 = [(WFLinkActionDateComponentsParameterDefinition *)self dateFormat];
  int64_t v8 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729E8] defaultValue:0];
  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v10 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  id v13 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  uint64_t v14 = v13;
  if (v8 == 1)
  {
    [v13 setCalendar:v9];
    [v14 setUnitsStyle:2];
    uint64_t v15 = 252;
    if (!v7) {
      uint64_t v15 = 28;
    }
    if (v7 == 1) {
      uint64_t v16 = 224;
    }
    else {
      uint64_t v16 = v15;
    }
    [v14 setAllowedUnits:v16];
    v17 = [v14 stringFromDateComponents:v12];
  }
  else
  {
    v21 = [WFDateFieldParameter alloc];
    v22 = [(WFLinkActionDateComponentsParameterDefinition *)self parameterDefinitionDictionary];
    v23 = [(WFDateFieldParameter *)v21 initWithDefinition:v22];

    v24 = [v9 dateFromComponents:v12];
    v25 = [(WFDateFieldParameter *)v23 hintDateFormatter];
    v17 = [v25 stringFromDate:v24];
  }
  v26 = [[WFVariableString alloc] initWithString:v17];
  v20 = [(WFVariableStringParameterState *)[WFDateFieldParameterState alloc] initWithVariableString:v26];

LABEL_19:
  return v20;
}

- (id)dateComponentsFromDateValue:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  char v6 = [v4 currentCalendar];
  int64_t v7 = [(WFLinkActionDateComponentsParameterDefinition *)self dateFormat];
  uint64_t v8 = 252;
  if (!v7) {
    uint64_t v8 = 28;
  }
  if (v7 == 1) {
    uint64_t v9 = 224;
  }
  else {
    uint64_t v9 = v8;
  }
  id v10 = [v6 components:v9 fromDate:v5];

  return v10;
}

- (id)dateComponentsFromStringValue:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [MEMORY[0x1E4F5A8B0] datesInString:v6 error:a4];
  uint64_t v8 = [v7 firstObject];

  if (v8)
  {
    uint64_t v9 = [(WFLinkActionDateComponentsParameterDefinition *)self dateComponentsFromDateValue:v8];
    goto LABEL_10;
  }
  id v10 = getWFActionsLogObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (a4)
  {
    if (v11)
    {
      id v12 = *a4;
      int v17 = 136315650;
      v18 = "-[WFLinkActionDateComponentsParameterDefinition dateComponentsFromStringValue:error:]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v12;
      id v13 = "%s Unable to detect dates from parameter string value: %@ with error: %@";
      uint64_t v14 = v10;
      uint32_t v15 = 32;
LABEL_8:
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
    }
  }
  else if (v11)
  {
    int v17 = 136315394;
    v18 = "-[WFLinkActionDateComponentsParameterDefinition dateComponentsFromStringValue:error:]";
    __int16 v19 = 2112;
    id v20 = v6;
    id v13 = "%s Unable to detect dates from parameter string value: %@";
    uint64_t v14 = v10;
    uint32_t v15 = 22;
    goto LABEL_8;
  }

  uint64_t v9 = 0;
LABEL_10:

  return v9;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void *, void))a7;
  id v15 = v11;
  id v21 = v15;
  if (!v15) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v21];
    v14[2](v14, v16, 0);

    goto LABEL_7;
  }

  id v17 = v21;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v15 = v21;
  if (isKindOfClass)
  {
    __int16 v19 = [(WFLinkActionDateComponentsParameterDefinition *)self dateComponentsFromDateValue:v17];
    id v20 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v19];
    v14[2](v14, v20, 0);
  }
  else
  {
LABEL_6:

    v14[2](v14, 0, 0);
  }
LABEL_7:
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v9 = [v8 variableString];
    id v10 = [v9 stringByRemovingVariables];

    if (v10)
    {
      id v11 = [(WFLinkActionDateComponentsParameterDefinition *)self dateComponentsFromStringValue:v10 error:0];
      id v12 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v11];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)parameterDefinitionDictionary
{
  unint64_t v3 = [(WFLinkActionDateComponentsParameterDefinition *)self dateFormat];
  int64_t v4 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729E8] defaultValue:0];
  int64_t v5 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729D0] defaultValue:2];
  int64_t v6 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729D8] defaultValue:2];
  id v7 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F729F0] ofClass:objc_opt_class()];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setValue:*MEMORY[0x1E4FB4E60] forKey:@"TextAlignment"];
  if (v3 > 2) {
    uint64_t v9 = WFDateFieldHintDateModeDateAndTime;
  }
  else {
    uint64_t v9 = off_1E6551408[v3];
  }
  [v8 setValue:*v9 forKey:@"HintDateMode"];
  id v10 = [NSNumber numberWithBool:v4 == 1];
  [v8 setValue:v10 forKey:@"DateFormatterAllowsRelative"];

  [v8 setValue:v7 forKey:@"DateFormatterTemplate"];
  id v11 = [NSNumber numberWithUnsignedInteger:v5];
  [v8 setValue:v11 forKey:@"DateFormatterDateStyle"];

  id v12 = [NSNumber numberWithUnsignedInteger:v6];
  [v8 setValue:v12 forKey:@"DateFormatterTimeStyle"];

  v16.receiver = self;
  v16.super_class = (Class)WFLinkActionDateComponentsParameterDefinition;
  id v13 = [(WFLinkActionParameterDefinition *)&v16 parameterDefinitionDictionary];
  uint64_t v14 = [v13 definitionByAddingEntriesInDictionary:v8];

  return v14;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionDateComponentsParameterDefinition)initWithParameterMetadata:(id)a3
{
  int64_t v4 = (void *)MEMORY[0x1E4F72D18];
  id v5 = a3;
  int64_t v6 = [v4 dateComponentsValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionDateComponentsParameterDefinition;
  id v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end