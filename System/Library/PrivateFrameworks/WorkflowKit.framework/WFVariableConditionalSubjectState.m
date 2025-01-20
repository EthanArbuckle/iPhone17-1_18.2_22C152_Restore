@interface WFVariableConditionalSubjectState
+ (id)subjectType;
- (BOOL)isCaseInsensitive;
- (BOOL)isEnumeration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIrrational;
- (Class)contentClassProvidingContentProperty;
- (Class)effectiveContentClass;
- (NSArray)containedVariables;
- (WFContentProperty)effectiveContentProperty;
- (WFPropertyListObject)serializedRepresentation;
- (WFVariable)variable;
- (WFVariableConditionalSubjectState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFVariableConditionalSubjectState)initWithVariable:(id)a3;
- (WFVariableConditionalSubjectState)initWithVariableState:(id)a3;
- (WFVariableParameterState)variableState;
- (id)localizedLabelForEnumerationPossibleState:(id)a3;
- (id)supportedComparisonOperators;
- (id)unitType;
- (int64_t)contentType;
- (unint64_t)comparableTimeUnits;
- (unint64_t)displayableTimeUnits;
- (unint64_t)hash;
- (unint64_t)tense;
- (void)getContentWithContext:(id)a3 completionHandler:(id)a4;
- (void)getEnumerationPossibleStatesWithCompletionHandler:(id)a3;
@end

@implementation WFVariableConditionalSubjectState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableState, 0);
  objc_storeStrong((id *)&self->_effectiveContentProperty, 0);
}

- (WFVariableParameterState)variableState
{
  return self->_variableState;
}

- (id)localizedLabelForEnumerationPossibleState:(id)a3
{
  id v4 = a3;
  v5 = [v4 variable];

  if (v5) {
    goto LABEL_2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v4 value];
      v6 = WFLocalizedContentPropertyPossibleValue(v9);
      goto LABEL_11;
    }
LABEL_2:
    v6 = 0;
    goto LABEL_3;
  }
  v8 = [(WFVariableConditionalSubjectState *)self effectiveContentClass];
  if (![(objc_class *)v8 isSubclassOfClass:objc_opt_class()]) {
    goto LABEL_2;
  }
  v9 = [(objc_class *)v8 enumMetadata];
  v10 = [v9 cases];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__WFVariableConditionalSubjectState_localizedLabelForEnumerationPossibleState___block_invoke;
  v14[3] = &unk_1E65581D0;
  id v15 = v4;
  v11 = objc_msgSend(v10, "if_firstObjectPassingTest:", v14);
  v12 = [v11 displayRepresentation];
  v13 = [v12 title];
  v6 = [v13 localizedStringForLocaleIdentifier:0];

LABEL_11:
LABEL_3:

  return v6;
}

uint64_t __79__WFVariableConditionalSubjectState_localizedLabelForEnumerationPossibleState___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  id v4 = *(id *)(a1 + 32);
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

  v7 = [v6 value];

  uint64_t v8 = [v3 isEqualToString:v7];
  return v8;
}

- (void)getEnumerationPossibleStatesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 possibleValues];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__WFVariableConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E6557C60;
    id v13 = v4;
    [v7 getValuesWithCompletionBlock:v12];
  }
  else
  {
    uint64_t v8 = [(WFVariableConditionalSubjectState *)self effectiveContentClass];
    if ([(objc_class *)v8 isSubclassOfClass:objc_opt_class()])
    {
      v9 = [(objc_class *)v8 enumMetadata];
      v10 = [v9 cases];
      v11 = objc_msgSend(v10, "if_map:", &__block_literal_global_66756);
      (*((void (**)(id, void *))v4 + 2))(v4, v11);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __87__WFVariableConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "if_compactMap:", &__block_literal_global_215);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

WFStringSubstitutableState *__87__WFVariableConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v2];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [WFStringSubstitutableState alloc];
      v5 = [v2 spokenPhrase];
      id v3 = [(WFVariableSubstitutableParameterState *)v4 initWithValue:v5];
    }
    else
    {
      id v6 = v2;
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v7 = v6;
        }
        else {
          v7 = 0;
        }
      }
      else
      {
        v7 = 0;
      }
      id v8 = v7;

      v9 = [v8 valueType];

      objc_opt_class();
      LOBYTE(v8) = objc_opt_isKindOfClass();

      if (v8)
      {
        id v10 = v6;
        if (v6)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v11 = v10;
          }
          else {
            v11 = 0;
          }
        }
        else
        {
          v11 = 0;
        }
        id v12 = v11;

        id v13 = [WFLinkEnumerationSubstitutableState alloc];
        v14 = [v12 value];

        id v3 = [(WFVariableSubstitutableParameterState *)v13 initWithValue:v14];
      }
      else
      {
        id v3 = 0;
      }
    }
  }

  return v3;
}

WFLinkEnumerationSubstitutableState *__87__WFVariableConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [WFLinkEnumerationSubstitutableState alloc];
  id v4 = [v2 identifier];

  v5 = [(WFVariableSubstitutableParameterState *)v3 initWithValue:v4];
  return v5;
}

- (BOOL)isEnumeration
{
  id v3 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  BOOL v4 = ([v3 hasPossibleValues] & 1) != 0
    || [(WFVariableConditionalSubjectState *)self contentType] == 8;

  return v4;
}

- (unint64_t)comparableTimeUnits
{
  id v3 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  if (v3)
  {
    BOOL v4 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
    unint64_t v5 = [v4 comparableUnits];
  }
  else
  {
    unint64_t v5 = 8444;
  }

  return v5;
}

- (unint64_t)displayableTimeUnits
{
  id v3 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  if (v3)
  {
    BOOL v4 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
    unint64_t v5 = [v4 timeUnits];
  }
  else
  {
    unint64_t v5 = 8444;
  }

  return v5;
}

- (unint64_t)tense
{
  id v3 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  if (v3)
  {
    BOOL v4 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
    unint64_t v5 = [v4 tense];
  }
  else
  {
    unint64_t v5 = 3;
  }

  return v5;
}

- (BOOL)isIrrational
{
  id v3 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  if (v3)
  {
    BOOL v4 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
    char v5 = [v4 isIrrational];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)unitType
{
  id v3 = [(WFVariableConditionalSubjectState *)self variable];
  BOOL v4 = [v3 aggrandizements];
  if ([v4 count])
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v6 = [v3 action];
      uint64_t v7 = [v6 outputMeasurementUnitType];
LABEL_7:
      v9 = (void *)v7;
      goto LABEL_9;
    }
  }
  id v8 = [v3 aggrandizements];
  id v6 = [v8 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 unitType];
    goto LABEL_7;
  }
  id v10 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  v9 = [v10 measurementUnitType];

LABEL_9:
  return v9;
}

- (BOOL)isCaseInsensitive
{
  id v3 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  if (v3)
  {
    BOOL v4 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
    char v5 = [v4 caseInsensitive];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (Class)effectiveContentClass
{
  id v3 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];

  if (v3)
  {
    BOOL v4 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
    uint64_t v5 = [v4 propertyClass];
  }
  else
  {
    id v6 = [(WFVariableConditionalSubjectState *)self variable];
    BOOL v4 = [v6 possibleAggrandizedContentClasses];

    if ((unint64_t)[v4 count] > 1)
    {
      uint64_t v7 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = [v4 firstObject];
  }
  uint64_t v7 = (void *)v5;
LABEL_7:

  return (Class)v7;
}

- (id)supportedComparisonOperators
{
  id v3 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  BOOL v4 = [v3 allowedOperators];

  if ([v4 count])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFVariableConditionalSubjectState;
    id v5 = [(WFConditionalSubjectParameterState *)&v8 supportedComparisonOperators];
  }
  id v6 = v5;

  return v6;
}

- (WFContentProperty)effectiveContentProperty
{
  effectiveContentProperty = self->_effectiveContentProperty;
  if (effectiveContentProperty) {
    goto LABEL_4;
  }
  BOOL v4 = [(WFVariableConditionalSubjectState *)self variable];
  id v5 = [v4 aggrandizements];
  id v6 = [v5 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 propertyName];
    objc_super v8 = [(objc_class *)[(WFVariableConditionalSubjectState *)self contentClassProvidingContentProperty] propertyForName:v7];
    v9 = self->_effectiveContentProperty;
    self->_effectiveContentProperty = v8;

    effectiveContentProperty = self->_effectiveContentProperty;
LABEL_4:
    id v10 = effectiveContentProperty;
    goto LABEL_5;
  }
  id v12 = [v4 aggrandizements];
  if ([v12 count]) {
    goto LABEL_9;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v10 = 0;
    goto LABEL_11;
  }
  id v12 = [v4 action];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    id v10 = 0;
  }
  else
  {
    id v10 = [v12 selectedProperty];
  }

LABEL_11:
LABEL_5:
  return v10;
}

- (Class)contentClassProvidingContentProperty
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFVariableConditionalSubjectState *)self variable];
  int v4 = [v3 isAvailable];

  if (!v4)
  {
    id v15 = 0;
    goto LABEL_19;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(WFVariableConditionalSubjectState *)self variable];
  id v6 = [v5 aggrandizements];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {

LABEL_15:
    v16 = [(WFVariableConditionalSubjectState *)self variable];
    v9 = [v16 possibleContentClasses];

    v17 = (void *)[v9 firstObject];
    if (v17 == objc_opt_class())
    {
      objc_opt_class();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = v17;
    }
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;

        v9 = v13;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v8);

  if (!v9) {
    goto LABEL_15;
  }
  id v14 = [v9 coercionItemClass];
LABEL_18:
  id v15 = v14;

LABEL_19:
  return (Class)v15;
}

- (int64_t)contentType
{
  id v3 = [(WFVariableConditionalSubjectState *)self effectiveContentProperty];
  int v4 = v3;
  if (v3)
  {
    id v5 = (void *)[v3 propertyClass];
    if ([v5 isSubclassOfClass:objc_opt_class()])
    {
      int64_t v6 = 8;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v6 = 9;
      }
      else
      {
        int64_t v6 = 1;
        uint64_t v10 = [NSNumber numberWithBool:1];
        char v11 = [v5 isSubclassOfClass:objc_opt_class()];

        if ((v11 & 1) == 0)
        {
          if (([v5 isSubclassOfClass:objc_opt_class()] & 1) != 0
            || ([v5 isSubclassOfClass:objc_opt_class()] & 1) != 0
            || ([v5 isSubclassOfClass:objc_opt_class()] & 1) != 0
            || ([v5 isSubclassOfClass:objc_opt_class()] & 1) != 0
            || ([v5 isSubclassOfClass:objc_opt_class()] & 1) != 0
            || ([v5 isSubclassOfClass:objc_opt_class()] & 1) != 0
            || ([v5 isSubclassOfClass:objc_opt_class()] & 1) != 0)
          {
            int64_t v6 = 2;
          }
          else if ([v5 isSubclassOfClass:objc_opt_class()])
          {
            int64_t v6 = 3;
          }
          else if ([v5 isSubclassOfClass:objc_opt_class()])
          {
            int64_t v6 = 5;
          }
          else if ([v5 isSubclassOfClass:objc_opt_class()])
          {
            int64_t v6 = 6;
          }
          else if ([v5 isSubclassOfClass:objc_opt_class()])
          {
            int64_t v6 = 7;
          }
          else if ([v5 isSubclassOfClass:objc_opt_class()])
          {
            int64_t v6 = 4;
          }
          else if ([v5 isSubclassOfClass:objc_opt_class()])
          {
            int64_t v6 = 4;
          }
          else
          {
            int64_t v6 = 0;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v7 = [(WFVariableConditionalSubjectState *)self variable];
    uint64_t v8 = [v7 possibleAggrandizedContentClasses];

    if ((unint64_t)[v8 count] <= 1)
    {
      v9 = (void *)[v8 firstObject];
      if ([v9 isSubclassOfClass:objc_opt_class()])
      {
        int64_t v6 = 1;
      }
      else if (v9 == objc_opt_class() {
             || ([v9 isSubclassOfClass:objc_opt_class()] & 1) != 0
      }
             || ([v9 isSubclassOfClass:objc_opt_class()] & 1) != 0
             || ([v9 isSubclassOfClass:objc_opt_class()] & 1) != 0
             || ([v9 isSubclassOfClass:objc_opt_class()] & 1) != 0
             || ([v9 isSubclassOfClass:objc_opt_class()] & 1) != 0)
      {
        int64_t v6 = 2;
      }
      else if ([v9 isSubclassOfClass:objc_opt_class()])
      {
        int64_t v6 = 9;
      }
      else if ([v9 isSubclassOfClass:objc_opt_class()])
      {
        int64_t v6 = 3;
      }
      else if ([v9 isSubclassOfClass:objc_opt_class()])
      {
        int64_t v6 = 5;
      }
      else if ([v9 isSubclassOfClass:objc_opt_class()])
      {
        int64_t v6 = 6;
      }
      else if ([v9 isSubclassOfClass:objc_opt_class()])
      {
        int64_t v6 = 7;
      }
      else if ([v9 isSubclassOfClass:objc_opt_class()])
      {
        int64_t v6 = 4;
      }
      else if ([v9 isSubclassOfClass:objc_opt_class()])
      {
        int64_t v6 = 8;
      }
      else
      {
        int64_t v6 = 0;
      }
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  return v6;
}

- (void)getContentWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFVariableConditionalSubjectState *)self variable];
  [v8 getContentWithContext:v7 completionHandler:v6];
}

- (NSArray)containedVariables
{
  id v2 = [(WFVariableConditionalSubjectState *)self variableState];
  id v3 = [v2 containedVariables];

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  id v2 = [(WFVariableConditionalSubjectState *)self variableState];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (WFVariableConditionalSubjectState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFVariableConditionalSubjectState *)self variableState];
      id v6 = [(WFVariableConditionalSubjectState *)v4 variableState];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (WFVariable)variable
{
  id v2 = [(WFVariableConditionalSubjectState *)self variableState];
  unint64_t v3 = [v2 variable];

  return (WFVariable *)v3;
}

- (WFPropertyListObject)serializedRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)WFVariableConditionalSubjectState;
  unint64_t v3 = [(WFConditionalSubjectParameterState *)&v8 serializedRepresentation];
  int v4 = (void *)[v3 mutableCopy];

  id v5 = [(WFVariableConditionalSubjectState *)self variableState];
  id v6 = [v5 serializedRepresentation];
  [v4 setValue:v6 forKey:@"Variable"];

  return (WFPropertyListObject *)v4;
}

- (WFVariableConditionalSubjectState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  id v12 = v8;
  if (v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = getWFGeneralLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v20 = 136315906;
      long long v21 = "WFEnforceClass";
      __int16 v22 = 2114;
      id v23 = v12;
      __int16 v24 = 2114;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      id v15 = v25;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v20, 0x2Au);
    }
    id v13 = 0;
  }
  else
  {
    id v13 = v12;
  }

  v16 = [v13 objectForKey:@"Variable"];
  v17 = [[WFVariableParameterState alloc] initWithSerializedRepresentation:v16 variableProvider:v10 parameter:v9];

  if (v17)
  {
    self = [(WFVariableConditionalSubjectState *)self initWithVariableState:v17];
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (WFVariableConditionalSubjectState)initWithVariable:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFVariableConditionalSubjectState.m", 54, @"Invalid parameter not satisfying: %@", @"variable" object file lineNumber description];
  }
  id v6 = [[WFVariableParameterState alloc] initWithVariable:v5];
  char v7 = [(WFVariableConditionalSubjectState *)self initWithVariableState:v6];

  return v7;
}

- (WFVariableConditionalSubjectState)initWithVariableState:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFVariableConditionalSubjectState.m", 43, @"Invalid parameter not satisfying: %@", @"variableState" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFVariableConditionalSubjectState;
  char v7 = [(WFVariableConditionalSubjectState *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_variableState, a3);
    id v9 = v8;
  }

  return v8;
}

+ (id)subjectType
{
  return @"Variable";
}

@end