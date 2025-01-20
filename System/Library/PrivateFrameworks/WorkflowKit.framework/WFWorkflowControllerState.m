@interface WFWorkflowControllerState
+ (BOOL)supportsSecureCoding;
+ (void)getStateFromURL:(id)a3 completionHandler:(id)a4;
- (BOOL)shouldDisablePrivacyPrompts;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (NSDate)startDate;
- (NSDictionary)currentProcessedParameters;
- (NSDictionary)variables;
- (NSSet)allowedOnceSmartPromptStates;
- (NSSet)extensionResourceClasses;
- (NSString)currentRunSource;
- (WFContentAttributionTracker)currentActionContentAttributionTracker;
- (WFContentCollection)currentInput;
- (WFContentItemCache)contentItemCache;
- (WFControlFlowAttributionTracker)flowTracker;
- (WFWorkflowControllerState)initWithCoder:(id)a3;
- (WFWorkflowControllerState)initWithWorkflow:(id)a3 variables:(id)a4 currentActionIndex:(unint64_t)a5 runningContext:(id)a6 currentInput:(id)a7 currentProcessedParameters:(id)a8 startDate:(id)a9 currentRunSource:(id)a10 numberOfDialogsPresented:(int64_t)a11 outputBehavior:(unint64_t)a12 contentAttributionTracker:(id)a13 contentItemCache:(id)a14 flowTracker:(id)a15 allowedOnceSmartPromptStates:(id)a16 extensionResourceClasses:(id)a17 shouldDisablePrivacyPrompts:(BOOL)a18;
- (WFWorkflowReference)workflow;
- (WFWorkflowRunningContext)runningContext;
- (int64_t)numberOfDialogsPresented;
- (unint64_t)currentActionIndex;
- (unint64_t)outputBehavior;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWorkflowControllerState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionResourceClasses, 0);
  objc_storeStrong((id *)&self->_allowedOnceSmartPromptStates, 0);
  objc_storeStrong((id *)&self->_flowTracker, 0);
  objc_storeStrong((id *)&self->_contentItemCache, 0);
  objc_storeStrong((id *)&self->_currentActionContentAttributionTracker, 0);
  objc_storeStrong((id *)&self->_currentRunSource, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_currentProcessedParameters, 0);
  objc_storeStrong((id *)&self->_currentInput, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
}

- (BOOL)shouldDisablePrivacyPrompts
{
  return self->_shouldDisablePrivacyPrompts;
}

- (NSSet)extensionResourceClasses
{
  return self->_extensionResourceClasses;
}

- (NSSet)allowedOnceSmartPromptStates
{
  return self->_allowedOnceSmartPromptStates;
}

- (WFControlFlowAttributionTracker)flowTracker
{
  return self->_flowTracker;
}

- (WFContentItemCache)contentItemCache
{
  return self->_contentItemCache;
}

- (WFContentAttributionTracker)currentActionContentAttributionTracker
{
  return self->_currentActionContentAttributionTracker;
}

- (unint64_t)outputBehavior
{
  return self->_outputBehavior;
}

- (NSString)currentRunSource
{
  return self->_currentRunSource;
}

- (int64_t)numberOfDialogsPresented
{
  return self->_numberOfDialogsPresented;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (unint64_t)currentActionIndex
{
  return self->_currentActionIndex;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (NSDictionary)currentProcessedParameters
{
  return self->_currentProcessedParameters;
}

- (WFContentCollection)currentInput
{
  return self->_currentInput;
}

- (WFWorkflowReference)workflow
{
  return self->_workflow;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F28DB0];
  id v7 = a3;
  v8 = objc_msgSend(v6, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", self, 1);
  id v13 = 0;
  char v9 = [v8 writeToURL:v7 options:0 error:&v13];

  id v10 = v13;
  v11 = v10;
  if (a4 && (v9 & 1) == 0) {
    *a4 = v10;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  v4 = [(WFWorkflowControllerState *)self workflow];
  [v22 encodeObject:v4 forKey:@"workflow"];

  v5 = [(WFWorkflowControllerState *)self variables];
  [v22 encodeObject:v5 forKey:@"variables"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFWorkflowControllerState currentActionIndex](self, "currentActionIndex"));
  [v22 encodeObject:v6 forKey:@"currentActionIndex"];

  id v7 = [(WFWorkflowControllerState *)self runningContext];
  [v22 encodeObject:v7 forKey:@"runningContext"];

  v8 = [(WFWorkflowControllerState *)self currentInput];
  uint64_t v9 = [v8 numberOfItems];

  if (v9)
  {
    id v10 = [(WFWorkflowControllerState *)self currentInput];
    [v22 encodeObject:v10 forKey:@"currentInput"];
  }
  v11 = [(WFWorkflowControllerState *)self currentProcessedParameters];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    id v13 = [(WFWorkflowControllerState *)self currentProcessedParameters];
    [v22 encodeObject:v13 forKey:@"currentProcessedParameters"];
  }
  v14 = [(WFWorkflowControllerState *)self startDate];
  [v22 encodeObject:v14 forKey:@"startDate"];

  v15 = [(WFWorkflowControllerState *)self currentRunSource];
  [v22 encodeObject:v15 forKey:@"currentRunSource"];

  objc_msgSend(v22, "encodeInteger:forKey:", -[WFWorkflowControllerState numberOfDialogsPresented](self, "numberOfDialogsPresented"), @"numberOfDialogsPresented");
  v16 = [(WFWorkflowControllerState *)self currentActionContentAttributionTracker];
  [v22 encodeObject:v16 forKey:@"currentActionContentAttributionTracker"];

  v17 = [(WFWorkflowControllerState *)self contentItemCache];
  [v22 encodeObject:v17 forKey:@"contentItemCache"];

  v18 = [(WFWorkflowControllerState *)self flowTracker];
  [v22 encodeObject:v18 forKey:@"flowTracker"];

  v19 = [(WFWorkflowControllerState *)self allowedOnceSmartPromptStates];
  [v22 encodeObject:v19 forKey:@"allowedOnceSmartPromptStates"];

  v20 = [(WFWorkflowControllerState *)self extensionResourceClasses];
  [v22 encodeObject:v20 forKey:@"extensionResourceClasses"];

  objc_msgSend(v22, "encodeBool:forKey:", -[WFWorkflowControllerState shouldDisablePrivacyPrompts](self, "shouldDisablePrivacyPrompts"), @"shouldDisablePrivacyPrompts");
  BOOL v21 = [(WFWorkflowControllerState *)self outputBehavior] == 1;
  objc_msgSend(v22, "encodeInteger:forKey:", -[WFWorkflowControllerState outputBehavior](self, "outputBehavior"), @"outputBehavior");
  [v22 encodeBool:v21 forKey:@"ignoresOutput"];
}

- (WFWorkflowControllerState)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)WFWorkflowControllerState;
  v5 = [(WFWorkflowControllerState *)&v47 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflow"];
    workflow = v5->_workflow;
    v5->_workflow = (WFWorkflowReference *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"variables"];
    uint64_t v13 = [v12 copy];
    variables = v5->_variables;
    v5->_variables = (NSDictionary *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentActionIndex"];
    v5->_currentActionIndex = [v15 unsignedIntegerValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runningContext"];
    runningContext = v5->_runningContext;
    v5->_runningContext = (WFWorkflowRunningContext *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentInput"];
    currentInput = v5->_currentInput;
    v5->_currentInput = (WFContentCollection *)v18;

    v20 = +[WFParameterValueRegistry registeredValueClasses];
    BOOL v21 = [v4 decodeObjectOfClasses:v20 forKey:@"currentProcessedParameters"];
    uint64_t v22 = [v21 copy];
    currentProcessedParameters = v5->_currentProcessedParameters;
    v5->_currentProcessedParameters = (NSDictionary *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentRunSource"];
    currentRunSource = v5->_currentRunSource;
    v5->_currentRunSource = (NSString *)v26;

    v5->_numberOfDialogsPresented = [v4 decodeIntegerForKey:@"numberOfDialogsPresented"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentActionContentAttributionTracker"];
    currentActionContentAttributionTracker = v5->_currentActionContentAttributionTracker;
    v5->_currentActionContentAttributionTracker = (WFContentAttributionTracker *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentItemCache"];
    contentItemCache = v5->_contentItemCache;
    v5->_contentItemCache = (WFContentItemCache *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flowTracker"];
    flowTracker = v5->_flowTracker;
    v5->_flowTracker = (WFControlFlowAttributionTracker *)v32;

    v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"allowedOnceSmartPromptStates"];
    allowedOnceSmartPromptStates = v5->_allowedOnceSmartPromptStates;
    v5->_allowedOnceSmartPromptStates = (NSSet *)v37;

    v39 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v40 = objc_opt_class();
    v41 = objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"extensionResourceClasses"];
    extensionResourceClasses = v5->_extensionResourceClasses;
    v5->_extensionResourceClasses = (NSSet *)v42;

    v5->_shouldDisablePrivacyPrompts = [v4 decodeBoolForKey:@"shouldDisablePrivacyPrompts"];
    if ([v4 containsValueForKey:@"outputBehavior"])
    {
      uint64_t v44 = [v4 decodeIntegerForKey:@"outputBehavior"];
    }
    else if ([v4 decodeBoolForKey:@"ignoresOutput"])
    {
      uint64_t v44 = 1;
    }
    else
    {
      uint64_t v44 = 2;
    }
    v5->_outputBehavior = v44;
    v45 = v5;
  }

  return v5;
}

- (WFWorkflowControllerState)initWithWorkflow:(id)a3 variables:(id)a4 currentActionIndex:(unint64_t)a5 runningContext:(id)a6 currentInput:(id)a7 currentProcessedParameters:(id)a8 startDate:(id)a9 currentRunSource:(id)a10 numberOfDialogsPresented:(int64_t)a11 outputBehavior:(unint64_t)a12 contentAttributionTracker:(id)a13 contentItemCache:(id)a14 flowTracker:(id)a15 allowedOnceSmartPromptStates:(id)a16 extensionResourceClasses:(id)a17 shouldDisablePrivacyPrompts:(BOOL)a18
{
  id v46 = a3;
  id v48 = a4;
  id v45 = a6;
  id v44 = a7;
  id v47 = a8;
  id v43 = a9;
  id v42 = a10;
  id v41 = a13;
  id v22 = a14;
  id v23 = a15;
  id v24 = a16;
  id v25 = a17;
  v49.receiver = self;
  v49.super_class = (Class)WFWorkflowControllerState;
  uint64_t v26 = [(WFWorkflowControllerState *)&v49 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_workflow, a3);
    uint64_t v28 = [v48 copy];
    variables = v27->_variables;
    v27->_variables = (NSDictionary *)v28;

    v27->_currentActionIndex = a5;
    objc_storeStrong((id *)&v27->_runningContext, a6);
    objc_storeStrong((id *)&v27->_currentInput, a7);
    uint64_t v30 = [v47 copy];
    currentProcessedParameters = v27->_currentProcessedParameters;
    v27->_currentProcessedParameters = (NSDictionary *)v30;

    objc_storeStrong((id *)&v27->_startDate, a9);
    objc_storeStrong((id *)&v27->_currentRunSource, a10);
    v27->_numberOfDialogsPresented = a11;
    v27->_outputBehavior = a12;
    objc_storeStrong((id *)&v27->_currentActionContentAttributionTracker, a13);
    objc_storeStrong((id *)&v27->_contentItemCache, a14);
    objc_storeStrong((id *)&v27->_flowTracker, a15);
    uint64_t v32 = [v24 copy];
    allowedOnceSmartPromptStates = v27->_allowedOnceSmartPromptStates;
    v27->_allowedOnceSmartPromptStates = (NSSet *)v32;

    uint64_t v34 = [v25 copy];
    extensionResourceClasses = v27->_extensionResourceClasses;
    v27->_extensionResourceClasses = (NSSet *)v34;

    v27->_shouldDisablePrivacyPrompts = a18;
    v36 = v27;
  }

  return v27;
}

+ (void)getStateFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v7 = a3;
  id v15 = 0;
  v8 = (void *)[[v6 alloc] initWithContentsOfURL:v7 options:0 error:&v15];

  id v9 = v15;
  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
    v11 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__WFWorkflowControllerState_getStateFromURL_completionHandler___block_invoke;
    v13[3] = &unk_1E6551370;
    id v14 = v5;
    id v12 = (id)objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v8, v11, v13);
  }
  else
  {
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v9);
  }
}

uint64_t __63__WFWorkflowControllerState_getStateFromURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end