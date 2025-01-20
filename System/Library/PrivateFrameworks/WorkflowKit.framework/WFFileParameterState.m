@interface WFFileParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (id)processForMultipleStateWithContext:(id)a3 error:(id *)a4 resolution:(int64_t *)a5;
- (id)resolveFileURLWithContext:(id)a3 error:(id *)a4;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)requestAccessToFileWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WFFileParameterState

- (void)requestAccessToFileWithContext:(id)a3 completionHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFVariableSubstitutableParameterState *)self value];
  v9 = [v8 fileLocation];

  if (v9)
  {
    v10 = [v6 variableSource];
    v11 = [v8 fileLocation];
    v17[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__WFFileParameterState_requestAccessToFileWithContext_completionHandler___block_invoke;
    v13[3] = &unk_1E654F070;
    id v16 = v7;
    id v14 = v6;
    id v15 = v8;
    [v10 requestAccessToFileAtLocations:v12 completionHandler:v13];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __73__WFFileParameterState_requestAccessToFileWithContext_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) parameter];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;

    v9 = [v8 workflow];

    v10 = [v9 workflowID];

    v11 = *(void **)(a1 + 40);
    id v14 = v5;
    v12 = [v11 resolveURLWithWorkflowID:v10 error:&v14];
    id v13 = v14;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = v13;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)resolveFileURLWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(WFVariableSubstitutableParameterState *)self value];
  if (![v7 isSupportedOnCurrentDevice])
  {
    v10 = 0;
    goto LABEL_16;
  }
  id v8 = [v6 parameter];
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
  id v11 = v9;

  v12 = [v11 workflow];

  id v13 = [v12 workflowID];

  id v14 = [v7 resolveURLWithWorkflowID:v13 error:a4];
  if (!v14)
  {
    v18 = [v7 fileLocation];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v10 = 0;
      goto LABEL_15;
    }
    v20 = [v7 fileLocation];
    uint64_t v22 = 0;
    v17 = [v20 resolveLocationWithError:&v22];

    v10 = [MEMORY[0x1E4F5A900] fileWithURL:v17 options:8];
    goto LABEL_13;
  }
  v10 = [MEMORY[0x1E4F5A900] fileWithURL:v14 options:8];
  id v15 = [v10 fileURL];
  int v16 = objc_msgSend(v15, "wf_fileIsDirectory");

  if (v16)
  {
    v17 = [v6 variableSource];
    [v17 captureFileRepresentation:v10];
LABEL_13:
  }
LABEL_15:

LABEL_16:
  return v10;
}

- (id)processForMultipleStateWithContext:(id)a3 error:(id *)a4 resolution:(int64_t *)a5
{
  uint64_t v7 = -[WFFileParameterState resolveFileURLWithContext:error:](self, "resolveFileURLWithContext:error:", a3);
  id v8 = (void *)v7;
  if (a5)
  {
    if (v7)
    {
      int64_t v9 = 1;
    }
    else
    {
      int v10 = WFShouldRequestAccessToFile(*a4);
      int64_t v9 = 2;
      if (!v10) {
        int64_t v9 = 0;
      }
    }
    *a5 = v9;
  }
  return v8;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *, void))a5;
  id v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)WFFileParameterState;
    [(WFVariableSubstitutableParameterState *)&v19 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
  else
  {
    id v18 = 0;
    v12 = [(WFFileParameterState *)self resolveFileURLWithContext:v8 error:&v18];
    id v13 = v18;
    id v14 = v13;
    if (v12)
    {
      v10[2](v10, v12, 0);
    }
    else if (WFShouldRequestAccessToFile(v13))
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __81__WFFileParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v15[3] = &unk_1E6556E20;
      v17 = v10;
      id v16 = v8;
      [(WFFileParameterState *)self requestAccessToFileWithContext:v16 completionHandler:v15];
    }
    else
    {
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v14);
    }
  }
}

void __81__WFFileParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v7 = [MEMORY[0x1E4F5A900] fileWithURL:a2 options:8];
    v3 = [v7 fileURL];
    int v4 = objc_msgSend(v3, "wf_fileIsDirectory");

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) variableSource];
      [v5 captureFileRepresentation:v7];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFFileParameterState.m", 37, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFFileValue class]]" object file lineNumber description];
  }
  id v6 = [v5 serializedRepresentation];

  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = [[WFFileValue alloc] initWithSerializedRepresentation:v9 variableProvider:v8 parameter:v7];

  return v10;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end