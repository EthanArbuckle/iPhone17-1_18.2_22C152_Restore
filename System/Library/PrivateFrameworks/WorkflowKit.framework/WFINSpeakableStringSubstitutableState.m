@interface WFINSpeakableStringSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (BOOL)stateIsEquivalent:(id)a3;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFINSpeakableStringSubstitutableState

- (BOOL)stateIsEquivalent:(id)a3
{
  id v4 = a3;
  v5 = [(WFVariableSubstitutableParameterState *)self value];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

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
  id v10 = v9;

  char v11 = 0;
  if (v7 && v10)
  {
    v12 = [v7 vocabularyIdentifier];
    v13 = [v10 vocabularyIdentifier];
    if ([v12 isEqualToString:v13])
    {
      char v11 = 1;
    }
    else
    {
      v14 = [v7 spokenPhrase];
      v15 = [v10 spokenPhrase];
      char v11 = [v14 isEqualToString:v15];
    }
  }

  return v11;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  char v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      v14 = [(WFVariableSubstitutableParameterState *)self variable];
      uint64_t v15 = objc_opt_class();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __98__WFINSpeakableStringSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_1E65504F0;
      v17[4] = self;
      id v18 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v17];

      v12 = v18;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFINSpeakableStringSubstitutableState;
    [(WFVariableSubstitutableParameterState *)&v16 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
}

void __98__WFINSpeakableStringSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v7;
  if (v7)
  {
    id v9 = a5;
    id v10 = objc_alloc((Class)[(id)objc_opt_class() processingValueClass]);
    char v11 = objc_msgSend(v10, "wf_initWithIdentifier:displayString:", 0, v13);
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v11, v9);
  }
  else
  {
    v12 = *(void (**)(uint64_t, void, id))(v8 + 16);
    id v10 = a5;
    v12(v8, 0, v10);
  }
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6 = a3;
  id v7 = WFINObjectFromSerializedRepresentation(v6, (objc_class *)[a1 processingValueClass]);

  return v7;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  return WFSerializedRepresentationFromWFINObject(a3);
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end