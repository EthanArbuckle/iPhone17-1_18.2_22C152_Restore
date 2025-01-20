@interface WFVariableStringParameterState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSerializeAsPlainString;
- (NSArray)containedVariables;
- (WFPropertyListObject)serializedRepresentation;
- (WFVariable)variable;
- (WFVariableString)variableString;
- (WFVariableStringParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFVariableStringParameterState)initWithVariable:(id)a3;
- (WFVariableStringParameterState)initWithVariableString:(id)a3;
- (WFVariableStringParameterState)initWithVariableString:(id)a3 userInputInsertionIndex:(int64_t)a4;
- (id)parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex;
- (id)stateByReplacingVariable:(id)a3 withVariable:(id)a4;
- (int64_t)userInputInsertionIndex;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFVariableStringParameterState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_variableString, 0);
}

- (WFVariable)variable
{
  return self->_variable;
}

- (int64_t)userInputInsertionIndex
{
  return self->_userInputInsertionIndex;
}

- (WFVariableString)variableString
{
  return self->_variableString;
}

- (BOOL)shouldSerializeAsPlainString
{
  v2 = [(WFVariableStringParameterState *)self variableString];
  v3 = [v2 variables];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = -1;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v2 = [(WFVariableStringParameterState *)self variableString];
  v3 = [v2 stringsAndVariables];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__WFVariableStringParameterState_parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex__block_invoke;
  v9[3] = &unk_1E6550070;
  v9[4] = &v11;
  v9[5] = v10;
  BOOL v4 = objc_msgSend(v3, "if_map:", v9);
  v5 = [[WFVariableString alloc] initWithStringsAndVariables:v4];
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)[v6 initWithVariableString:v5 userInputInsertionIndex:v12[3]];

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  return v7;
}

__CFString *__97__WFVariableStringParameterState_parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v4 = v3;
    }
    else {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 type];
  int v7 = [v6 isEqualToString:@"Ask"];

  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    v8 = &stru_1F229A4D8;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += objc_msgSend(v3, "wf_lengthInVariableString");
    v8 = (__CFString *)v3;
  }

  return v8;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void *))a4;
  id v10 = a5;
  uint64_t v11 = [(WFVariableStringParameterState *)self variableString];

  if (v11)
  {
    v12 = [(WFVariableStringParameterState *)self variableString];
    uint64_t v13 = [v12 variablesOfType:@"Ask"];
    uint64_t v14 = [v13 firstObject];

    if (v14 && [v8 isInputParameter])
    {
      v15 = [(WFVariableStringParameterState *)self parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex];
      v16 = [v14 prompt];
      v9[2](v9, v16, v15);
    }
    else
    {
      v17 = [(WFVariableStringParameterState *)self variableString];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __91__WFVariableStringParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v19[3] = &unk_1E65502E8;
      id v20 = v14;
      v21 = self;
      v22 = v9;
      id v23 = v10;
      id v18 = v14;
      [v17 processWithContext:v8 completionHandler:v19];
    }
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __91__WFVariableStringParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v16 = a4;
  if (a1[4])
  {
    uint64_t v9 = a1[6];
    id v10 = a2;
    id v11 = objc_alloc((Class)objc_opt_class());
    v12 = [[WFVariableString alloc] initWithString:v10];

    uint64_t v13 = (void *)[v11 initWithVariableString:v12 userInputInsertionIndex:a3];
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v16, v13);
  }
  else
  {
    uint64_t v14 = a1[7];
    v15 = *(void (**)(uint64_t, WFVariableString *, uint64_t))(v14 + 16);
    v12 = a2;
    v15(v14, v12, a5);
  }
}

- (NSArray)containedVariables
{
  v2 = [(WFVariableStringParameterState *)self variableString];
  id v3 = [v2 variables];

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  v2 = [(WFVariableStringParameterState *)self variableString];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (WFVariableStringParameterState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFVariableStringParameterState *)v4 variableString];
      id v6 = [(WFVariableStringParameterState *)self variableString];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)stateByReplacingVariable:(id)a3 withVariable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFVariableStringParameterState *)self variableString];
  uint64_t v9 = [v8 stringsAndVariables];
  id v10 = (void *)[v9 mutableCopy];

  if (v6 && (uint64_t v11 = [v10 indexOfObject:v6], v11 != 0x7FFFFFFFFFFFFFFFLL))
  {
    if (v7) {
      [v10 replaceObjectAtIndex:v11 withObject:v7];
    }
    else {
      [v10 removeObjectAtIndex:v11];
    }
    v12 = [[WFVariableString alloc] initWithStringsAndVariables:v10];
  }
  else if (v7)
  {
    v12 = [[WFVariableString alloc] initWithVariable:v7];
  }
  else
  {
    v12 = objc_alloc_init(WFVariableString);
  }
  uint64_t v13 = v12;
  uint64_t v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithVariableString:v12];

  return v14;
}

- (WFPropertyListObject)serializedRepresentation
{
  unint64_t v3 = [(WFVariableStringParameterState *)self variableString];
  BOOL v4 = [v3 variables];
  uint64_t v5 = [v4 count];

  id v6 = [(WFVariableStringParameterState *)self variableString];
  id v7 = v6;
  if (v5) {
    WFSerializedVariableObject(v6);
  }
  else {
  id v8 = [v6 stringByRemovingVariables];
  }

  return (WFPropertyListObject *)v8;
}

- (WFVariableStringParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [[WFVariableString alloc] initWithString:v8];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_9;
    }
    WFDeserializedVariableObject(v8, v9, v10);
    uint64_t v11 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_4;
    }
  }
  self = [(WFVariableStringParameterState *)self initWithVariableString:v11];
  v12 = self;
LABEL_4:

LABEL_9:
  return v12;
}

- (WFVariableStringParameterState)initWithVariable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[WFVariableString alloc] initWithVariable:v4];

  id v6 = [(WFVariableStringParameterState *)self initWithVariableString:v5];
  return v6;
}

- (WFVariableStringParameterState)initWithVariableString:(id)a3
{
  return [(WFVariableStringParameterState *)self initWithVariableString:a3 userInputInsertionIndex:-1];
}

- (WFVariableStringParameterState)initWithVariableString:(id)a3 userInputInsertionIndex:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFVariableStringParameterState.m", 22, @"Invalid parameter not satisfying: %@", @"variableString" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFVariableStringParameterState;
  id v8 = [(WFVariableStringParameterState *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    variableString = v8->_variableString;
    v8->_variableString = (WFVariableString *)v9;

    v8->_userInputInsertionIndex = a4;
    uint64_t v11 = [v7 variables];
    uint64_t v12 = [v11 firstObject];
    variable = v8->_variable;
    v8->_variable = (WFVariable *)v12;

    uint64_t v14 = v8;
  }

  return v8;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end