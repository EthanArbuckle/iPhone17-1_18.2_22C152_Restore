@interface WFReversibleLinkAction
+ (Class)settingsClientClass;
- (id)reversibleSettingParameterKey;
- (void)finishRunningWithError:(id)a3;
- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation WFReversibleLinkAction

- (void)finishRunningWithError:(id)a3
{
  id v4 = a3;
  if (v4
    || ([(WFAction *)self runningDelegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)WFReversibleLinkAction;
    [(WFAppIntentExecutionAction *)&v9 finishRunningWithError:v4];
  }
  else
  {
    v7 = (void *)[(id)objc_opt_class() settingsClientClass];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__WFReversibleLinkAction_finishRunningWithError___block_invoke;
    v8[3] = &unk_1E6554D60;
    v8[4] = self;
    [v7 getBookmarkForCurrentStateWithCompletionHandler:v8];
  }
}

void __49__WFReversibleLinkAction_finishRunningWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    char v6 = [*(id *)(a1 + 32) runningDelegate];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = [v5 actionReversalState];
    [v6 action:v7 didGenerateReversalState:v8];

    objc_msgSendSuper2(&v9, sel_finishRunningWithError_, 0, *(void *)(a1 + 32), WFReversibleLinkAction, v10.receiver, v10.super_class);
  }
  else
  {
    objc_msgSendSuper2(&v10, sel_finishRunningWithError_, a3, v9.receiver, v9.super_class, *(void *)(a1 + 32), WFReversibleLinkAction);
  }
}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 name];
  v14 = [(WFReversibleLinkAction *)self reversibleSettingParameterKey];
  char v15 = [v13 isEqualToString:v14];

  if (v15)
  {
    v16 = [(WFAction *)self runningDelegate];
    v17 = [v16 actionReversalStateForAction:self];

    if (v17)
    {
      v18 = [[WFSettingsClientBookmark alloc] initWithActionReversalState:v17];
      if (v18)
      {
        v19 = (void *)[(id)objc_opt_class() settingsClientClass];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __117__WFReversibleLinkAction_getValueForParameterData_ofProcessedParameters_fallingBackToDefaultValue_completionHandler___block_invoke;
        v22[3] = &unk_1E6554D38;
        v22[4] = self;
        id v24 = v12;
        id v23 = v10;
        [v19 getReversalStateWithBookmark:v18 completionHandler:v22];
      }
      else
      {
        v20 = getWFActionsLogObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "-[WFReversibleLinkAction getValueForParameterData:ofProcessedParameters:fallingBackToDefaultValue:completionHandler:]";
          __int16 v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_FAULT, "%s Couldn't turn action reversal state %@ into a settings client bookmark", buf, 0x16u);
        }

        (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
      }
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)WFReversibleLinkAction;
      [(WFAppIntentExecutionAction *)&v21 getValueForParameterData:v10 ofProcessedParameters:v11 fallingBackToDefaultValue:v7 completionHandler:v12];
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)WFReversibleLinkAction;
    [(WFAppIntentExecutionAction *)&v25 getValueForParameterData:v10 ofProcessedParameters:v11 fallingBackToDefaultValue:v7 completionHandler:v12];
  }
}

void __117__WFReversibleLinkAction_getValueForParameterData_ofProcessedParameters_fallingBackToDefaultValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    char v6 = [*(id *)(a1 + 40) valueType];
    BOOL v7 = objc_msgSend(v6, "wf_parameterDefinitionWithParameterMetadata:", *(void *)(a1 + 40));

    uint64_t v8 = *(void *)(a1 + 48);
    objc_super v9 = [v7 linkValueWithValue:v10];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else if (objc_msgSend(v5, "wf_isUserCancelledError"))
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)reversibleSettingParameterKey
{
  return &stru_1F229A4D8;
}

+ (Class)settingsClientClass
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[WFReversibleLinkAction settingsClientClass] must be overridden"];
  return (Class)objc_opt_class();
}

@end