@interface WFMDMVerifier
+ (id)contentAttributionsFromContentAttributionSets:(id)a3 withManagedLevel:(unint64_t)a4;
- (BOOL)canSendDataToContentDestination:(id)a3 error:(id *)a4;
- (NSArray)contentAttributionSets;
- (NSString)actionName;
- (WFMDMVerifier)initWithAction:(id)a3;
- (WFMDMVerifier)initWithContentAttributionSets:(id)a3 actionName:(id)a4;
- (id)errorFromFailedVerificationContentAttributionSets:(id)a3 contentDestination:(id)a4 destinationManagedLevel:(unint64_t)a5;
@end

@implementation WFMDMVerifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAttributionSets, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

- (NSArray)contentAttributionSets
{
  return self->_contentAttributionSets;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (id)errorFromFailedVerificationContentAttributionSets:(id)a3 contentDestination:(id)a4 destinationManagedLevel:(unint64_t)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    if ([v8 managedLevel] == 2) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    v33 = +[WFMDMVerifier contentAttributionsFromContentAttributionSets:v7 withManagedLevel:v9];
    v10 = [v33 sortedArrayUsingComparator:&__block_literal_global_61771];
    id v11 = objc_alloc(MEMORY[0x1E4F1CAA0]);
    v32 = v10;
    v12 = objc_msgSend(v10, "if_compactMap:", &__block_literal_global_184);
    v13 = (void *)[v11 initWithArray:v12];

    v14 = [v8 localizedTitle];
    uint64_t v15 = [v13 count];
    v16 = NSString;
    if (v15) {
      BOOL v17 = v14 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {
      if (v14)
      {
        v19 = WFLocalizedString(@"Your administrator doesn’t allow sending data to %@.");
        objc_msgSend(v16, "localizedStringWithFormat:", v19, v14, 0);
      }
      else
      {
        v19 = WFLocalizedString(@"Your administrator doesn’t allow sending data to this action.");
        objc_msgSend(v16, "localizedStringWithFormat:", v19, 0, 0);
      v23 = };
    }
    else
    {
      v19 = WFLocalizedString(@"Your administrator doesn’t allow sending data from %1$@ to %2$@.");
      v20 = (void *)MEMORY[0x1E4F28DF8];
      v21 = [v13 array];
      v22 = [v20 localizedStringByJoiningStrings:v21];
      v23 = objc_msgSend(v16, "localizedStringWithFormat:", v19, v22, v14, 0);
    }
    v24 = [(WFMDMVerifier *)self actionName];
    if (v24)
    {
      v25 = NSString;
      v26 = WFLocalizedString(@"Couldn’t Run “%@”");
      v27 = objc_msgSend(v25, "localizedStringWithFormat:", v26, v24, 0);
    }
    else
    {
      v27 = WFLocalizedString(@"Couldn’t Run Action");
    }
    v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v34[0] = *MEMORY[0x1E4F28588];
    v34[1] = v29;
    v35[0] = v27;
    v35[1] = v23;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    v18 = [v28 errorWithDomain:@"WFActionErrorDomain" code:8 userInfo:v30];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

id __110__WFMDMVerifier_errorFromFailedVerificationContentAttributionSets_contentDestination_destinationManagedLevel___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 origin];
  v3 = [v2 localizedMDMDescription];

  return v3;
}

uint64_t __110__WFMDMVerifier_errorFromFailedVerificationContentAttributionSets_contentDestination_destinationManagedLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 origin];
  if (objc_opt_class())
  {
    id v7 = [v5 origin];
    uint64_t v8 = objc_opt_class();

    if (v8)
    {
      uint64_t v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v10 = [v4 origin];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }
LABEL_8:

  return v9;
}

- (BOOL)canSendDataToContentDestination:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 managedLevel];
  if (v7)
  {
    uint64_t v8 = v7;
    if (v7 == 3)
    {
      uint64_t v9 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[WFMDMVerifier canSendDataToContentDestination:error:]";
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s The content destination of an action should never be mixed", buf, 0xCu);
      }
      BOOL v10 = 0;
    }
    else
    {
      id v11 = [(WFMDMVerifier *)self contentAttributionSets];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__WFMDMVerifier_canSendDataToContentDestination_error___block_invoke;
      v14[3] = &__block_descriptor_40_e33_B16__0__WFContentAttributionSet_8l;
      v14[4] = v8;
      uint64_t v9 = objc_msgSend(v11, "if_objectsPassingTest:", v14);

      uint64_t v12 = [v9 count];
      BOOL v10 = v12 == 0;
      if (a4 && v12)
      {
        *a4 = [(WFMDMVerifier *)self errorFromFailedVerificationContentAttributionSets:v9 contentDestination:v6 destinationManagedLevel:v8];
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

uint64_t __55__WFMDMVerifier_canSendDataToContentDestination_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAllowedToBeSentToDestinationWithManagedLevel:*(void *)(a1 + 32)] ^ 1;
}

- (WFMDMVerifier)initWithAction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parameters];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__WFMDMVerifier_initWithAction___block_invoke;
  v11[3] = &unk_1E6556A08;
  id v12 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "if_flatMap:", v11);

  uint64_t v8 = [v6 localizedName];
  uint64_t v9 = [(WFMDMVerifier *)self initWithContentAttributionSets:v7 actionName:v8];

  return v9;
}

id __32__WFMDMVerifier_initWithAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 key];
  id v5 = [*(id *)(a1 + 32) parameterStateForKey:v4 fallingBackToDefaultValue:0];
  id v6 = [v5 containedVariables];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __32__WFMDMVerifier_initWithAction___block_invoke_2;
  v14[3] = &unk_1E65569E0;
  id v15 = *(id *)(a1 + 32);
  uint64_t v7 = objc_msgSend(v6, "if_compactMap:", v14);
  uint64_t v8 = [*(id *)(a1 + 32) contentAttributionTracker];
  uint64_t v9 = [v8 attributionSetForParameter:v3];

  BOOL v10 = [v7 arrayByAddingObject:v9];
  id v11 = v10;
  if (!v10) {
    BOOL v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v10;

  return v12;
}

id __32__WFMDMVerifier_initWithAction___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 variableSource];
  id v5 = WFPreferredVariableNameForVariable(v3);

  id v6 = [v4 contentForVariableWithName:v5];

  uint64_t v7 = [v6 attributionSet];

  return v7;
}

- (WFMDMVerifier)initWithContentAttributionSets:(id)a3 actionName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFMDMVerifier.m", 25, @"Invalid parameter not satisfying: %@", @"contentAttributionSets" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFMDMVerifier;
  uint64_t v9 = [(WFMDMVerifier *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    contentAttributionSets = v9->_contentAttributionSets;
    v9->_contentAttributionSets = (NSArray *)v10;

    uint64_t v12 = [v8 copy];
    actionName = v9->_actionName;
    v9->_actionName = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

+ (id)contentAttributionsFromContentAttributionSets:(id)a3 withManagedLevel:(unint64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__WFMDMVerifier_contentAttributionsFromContentAttributionSets_withManagedLevel___block_invoke;
  v6[3] = &__block_descriptor_40_e42___NSArray_16__0__WFContentAttributionSet_8l;
  v6[4] = a4;
  id v4 = objc_msgSend(a3, "if_flatMap:", v6);
  return v4;
}

id __80__WFMDMVerifier_contentAttributionsFromContentAttributionSets_withManagedLevel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 attributions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__WFMDMVerifier_contentAttributionsFromContentAttributionSets_withManagedLevel___block_invoke_2;
  v6[3] = &__block_descriptor_40_e30_B16__0__WFContentAttribution_8l;
  v6[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "if_objectsPassingTest:", v6);

  return v4;
}

BOOL __80__WFMDMVerifier_contentAttributionsFromContentAttributionSets_withManagedLevel___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 origin];
  BOOL v4 = [v3 managedLevel] == *(void *)(a1 + 32);

  return v4;
}

@end