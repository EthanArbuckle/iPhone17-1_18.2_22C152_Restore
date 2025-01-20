@interface WFConditionalSubjectParameterState
+ (Class)processingValueClass;
+ (id)subjectClasses;
+ (id)subjectType;
- (BOOL)isCaseInsensitive;
- (BOOL)isEnumeration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIrrational;
- (NSArray)containedVariables;
- (NSNumber)maximumLength;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (NSString)homeIdentifier;
- (NSString)unitType;
- (WFConditionalSubjectParameterState)initWithHomeIdentifier:(id)a3;
- (WFConditionalSubjectParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFConditionalSubjectParameterState)initWithVariable:(id)a3;
- (WFPropertyListObject)serializedRepresentation;
- (WFVariable)variable;
- (id)localizedLabelForEnumerationPossibleState:(id)a3;
- (id)supportedComparisonOperators;
- (int64_t)contentType;
- (unint64_t)comparableTimeUnits;
- (unint64_t)displayableTimeUnits;
- (unint64_t)hash;
- (unint64_t)tense;
- (void)getContentWithContext:(id)a3 completionHandler:(id)a4;
- (void)getEnumerationPossibleStatesWithCompletionHandler:(id)a3;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)setHomeIdentifier:(id)a3;
@end

@implementation WFConditionalSubjectParameterState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_unitType, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_maximumLength, 0);
}

- (void)setHomeIdentifier:(id)a3
{
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (BOOL)isEnumeration
{
  return self->_enumeration;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (NSString)unitType
{
  return self->_unitType;
}

- (unint64_t)comparableTimeUnits
{
  return self->_comparableTimeUnits;
}

- (unint64_t)displayableTimeUnits
{
  return self->_displayableTimeUnits;
}

- (unint64_t)tense
{
  return self->_tense;
}

- (BOOL)isIrrational
{
  return self->_irrational;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (BOOL)isCaseInsensitive
{
  return self->_caseInsensitive;
}

- (NSNumber)maximumLength
{
  return self->_maximumLength;
}

- (id)localizedLabelForEnumerationPossibleState:(id)a3
{
  return 0;
}

- (void)getEnumerationPossibleStatesWithCompletionHandler:(id)a3
{
}

- (id)supportedComparisonOperators
{
  uint64_t v3 = [(WFConditionalSubjectParameterState *)self contentType];
  char v4 = [(WFConditionalSubjectParameterState *)self isEnumeration];
  char v5 = [(WFConditionalSubjectParameterState *)self isIrrational];
  char v6 = [(WFConditionalSubjectParameterState *)self tense];
  return WFSupportedContentOperatorsForContentType(v3, v4, v5, v6);
}

- (int64_t)contentType
{
  return 0;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__WFConditionalSubjectParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v9[3] = &unk_1E6556C08;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [(WFConditionalSubjectParameterState *)self getContentWithContext:a3 completionHandler:v9];
}

void __95__WFConditionalSubjectParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = (uint64_t)v9;
    if (!v9) {
      uint64_t v6 = objc_opt_new();
    }
    id v9 = (id)v6;
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = -[WFConditionalSubjectValue initWithContent:contentType:caseInsensitive:comparableTimeUnits:]([WFConditionalSubjectValue alloc], "initWithContent:contentType:caseInsensitive:comparableTimeUnits:", v6, [*(id *)(a1 + 32) contentType], objc_msgSend(*(id *)(a1 + 32), "isCaseInsensitive"), objc_msgSend(*(id *)(a1 + 32), "comparableTimeUnits"));
    (*(void (**)(uint64_t, WFConditionalSubjectValue *, void))(v7 + 16))(v7, v8, 0);
  }
}

- (void)getContentWithContext:(id)a3 completionHandler:(id)a4
{
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 0;
}

- (WFPropertyListObject)serializedRepresentation
{
  id v3 = objc_opt_new();
  char v4 = [(id)objc_opt_class() subjectType];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"Type"];
  }
  id v5 = [(WFConditionalSubjectParameterState *)self homeIdentifier];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"HomeIdentifier"];
  }

  return (WFPropertyListObject *)v3;
}

- (WFConditionalSubjectParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v12 = v8;
  if (v12)
  {
    if (objc_opt_isKindOfClass())
    {
      v13 = [v12 objectForKey:@"Type"];
      v14 = [v12 objectForKey:@"HomeIdentifier"];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v15 = [(id)objc_opt_class() subjectClasses];
      v16 = (WFConditionalSubjectParameterState *)[v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16)
      {
        v25 = v14;
        id v26 = v9;
        v27 = self;
        uint64_t v17 = *(void *)v29;
        while (2)
        {
          for (i = 0; i != v16; i = (WFConditionalSubjectParameterState *)((char *)i + 1))
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v20 = [v19 subjectType];
            int v21 = [v20 isEqualToString:v13];

            if (v21)
            {
              id v9 = v26;
              v16 = (WFConditionalSubjectParameterState *)[objc_alloc((Class)v19) initWithSerializedRepresentation:v12 variableProvider:v26 parameter:v10];
              self = v27;
              goto LABEL_17;
            }
          }
          v16 = (WFConditionalSubjectParameterState *)[v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        id v9 = v26;
        self = v27;
LABEL_17:
        v14 = v25;
      }

      if (v16) {
        BOOL v23 = 1;
      }
      else {
        BOOL v23 = v14 == 0;
      }
      if (!v23) {
        v16 = [[WFConditionalSubjectParameterState alloc] initWithHomeIdentifier:v14];
      }
    }
    else
    {
      v13 = getWFGeneralLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v34 = "WFEnforceClass";
        __int16 v35 = 2114;
        id v36 = v12;
        __int16 v37 = 2114;
        id v38 = (id)objc_opt_class();
        __int16 v39 = 2114;
        uint64_t v40 = v11;
        id v22 = v38;
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (WFConditionalSubjectParameterState)initWithHomeIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFConditionalSubjectParameterState.m", 75, @"Invalid parameter not satisfying: %@", @"homeIdentifier" object file lineNumber description];

    if (!self) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (self)
  {
LABEL_3:
    objc_storeStrong((id *)&self->_homeIdentifier, a3);
    uint64_t v7 = self;
  }
LABEL_4:

  return self;
}

- (WFConditionalSubjectParameterState)initWithVariable:(id)a3
{
  id v4 = a3;
  id v5 = [[WFVariableConditionalSubjectState alloc] initWithVariable:v4];

  return &v5->super;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)subjectType
{
  return @"Default";
}

+ (id)subjectClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

@end