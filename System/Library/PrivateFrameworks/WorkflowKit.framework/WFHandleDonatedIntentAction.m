@interface WFHandleDonatedIntentAction
+ (id)intentActionWithShortcut:(id)a3 forceExecutionOnPhone:(BOOL)a4 groupIdentifier:(id)a5 error:(id *)a6;
- (BOOL)forceExecutionOnPhone;
- (BOOL)requiresRemoteExecution;
- (INIntent)intent;
- (NSString)groupIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (WFHandleDonatedIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6;
- (WFHandleDonatedIntentAction)initWithIntent:(id)a3;
- (WFHandleDonatedIntentAction)initWithIntent:(id)a3 forceExecutionOnPhone:(BOOL)a4;
- (WFHandleDonatedIntentAction)initWithInteraction:(id)a3 forceExecutionOnPhone:(BOOL)a4;
- (id)appIdentifier;
- (id)executorWithIntent:(id)a3 groupIdentifier:(id)a4;
- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6;
- (id)intentDescription;
- (id)intentDescriptor;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedKeyParameterDisplayName;
- (id)localizedNameWithContext:(id)a3;
- (id)metricsIdentifier;
- (id)parameterSummary;
- (id)serializedParameters;
- (id)slots;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (int64_t)intentCategory;
- (void)continueInAppWithCompletionHandler:(id)a3;
- (void)initializeParameters;
- (void)setIntent:(id)a3;
- (void)setIntentDescriptor:(id)a3;
@end

@implementation WFHandleDonatedIntentAction

- (void)continueInAppWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFHandleDonatedIntentAction *)self intent];
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__WFHandleDonatedIntentAction_WFLCompatibility__continueInAppWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E654CF90;
    id v7 = v4;
    +[WFOpenUserActivityAction createActionWithIntent:v5 completionHandler:v6];
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __84__WFHandleDonatedIntentAction_WFLCompatibility__continueInAppWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__WFHandleDonatedIntentAction_WFLCompatibility__continueInAppWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E6556D78;
  id v6 = *(id *)(a1 + 32);
  [v3 runWithInput:v4 userInterface:0 runningDelegate:0 variableSource:0 workQueue:MEMORY[0x1E4F14428] completionHandler:v5];
}

uint64_t __84__WFHandleDonatedIntentAction_WFLCompatibility__continueInAppWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 == 0);
}

- (WFHandleDonatedIntentAction)initWithInteraction:(id)a3 forceExecutionOnPhone:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 intent];
  if (v7)
  {
    id v26 = 0;
    v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v26];
    v9 = v26;
    if (v8)
    {
      v28 = @"IntentData";
      v29 = v8;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      v11 = [v10 mutableCopy];

      if (v4)
      {
        v12 = [NSNumber numberWithBool:1];
        [v11 setObject:v12 forKeyedSubscript:@"ForceExecutionOnPhone"];
      }
      v13 = [v6 groupIdentifier];

      if (v13)
      {
        v14 = [v6 groupIdentifier];
        [v11 setObject:v14 forKeyedSubscript:@"GroupIdentifier"];
      }
      v15 = [[WFActionRequest alloc] initWithActionIdentifier:@"is.workflow.actions.sirikit.donation.handle" serializedParameters:v11];
      v16 = objc_opt_new();
      v27 = v15;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      [v16 createActionsForRequests:v17];

      v18 = [(WFActionRequest *)v15 result];
      uint64_t v19 = objc_opt_class();
      v20 = v18;
      if (v20 && (objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = getWFGeneralLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          v23 = objc_opt_class();
          *(_DWORD *)buf = 136315906;
          v31 = "WFEnforceClass";
          __int16 v32 = 2114;
          v33 = v20;
          __int16 v34 = 2114;
          v35 = v23;
          __int16 v36 = 2114;
          uint64_t v37 = v19;
          id v24 = v23;
          _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
        }
        v21 = 0;
      }
      else
      {
        v21 = v20;
      }
    }
    else
    {
      v11 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "-[WFHandleDonatedIntentAction(WFLCompatibility) initWithInteraction:forceExecutionOnPhone:]";
        __int16 v32 = 2114;
        v33 = v9;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to create WFL-compatible WFHandleDonatedIntentAction due to error serizlializing the intent: %{public}@", buf, 0x16u);
      }
      v21 = 0;
    }
  }
  else
  {
    v9 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[WFHandleDonatedIntentAction(WFLCompatibility) initWithInteraction:forceExecutionOnPhone:]";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to create WFL-compatible WFHandleDonatedIntentAction because intent was nil", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (WFHandleDonatedIntentAction)initWithIntent:(id)a3 forceExecutionOnPhone:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F30508];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithIntent:v7 response:0];

  v9 = [(WFHandleDonatedIntentAction *)self initWithInteraction:v8 forceExecutionOnPhone:v4];
  return v9;
}

- (WFHandleDonatedIntentAction)initWithIntent:(id)a3
{
  return [(WFHandleDonatedIntentAction *)self initWithIntent:a3 forceExecutionOnPhone:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_intentDescriptor, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)forceExecutionOnPhone
{
  return self->_forceExecutionOnPhone;
}

- (void)setIntent:(id)a3
{
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)setIntentDescriptor:(id)a3
{
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%@” to share %@ with “%@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%@” to run actions from “%@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (id)metricsIdentifier
{
  id v3 = NSString;
  BOOL v4 = [(WFAction *)self identifier];
  v5 = [(WFHandleDonatedIntentAction *)self intent];
  id v6 = [v5 launchId];
  id v7 = [(WFHandleDonatedIntentAction *)self intentDescription];
  v8 = [v7 name];
  id v9 = [v3 stringWithFormat:@"%@.%@.%@", v4, v6, v8];

  return v9;
}

- (BOOL)requiresRemoteExecution
{
  v3.receiver = self;
  v3.super_class = (Class)WFHandleDonatedIntentAction;
  return [(WFHandleIntentAction *)&v3 requiresRemoteExecution];
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  id v7 = [(WFHandleDonatedIntentAction *)self intent];

  if (v7)
  {
    v8 = [(WFHandleDonatedIntentAction *)self intent];
    id v7 = (void *)[v8 copy];

    id v9 = [(WFHandleDonatedIntentAction *)self intentDescriptor];
    id v10 = [v9 bundleIdentifier];
    [v7 _setLaunchId:v10];

    v11 = [(WFHandleDonatedIntentAction *)self intentDescriptor];
    v12 = [v11 extensionBundleIdentifier];
    [v7 _setExtensionBundleId:v12];
  }
  return v7;
}

- (id)slots
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)intentDescription
{
  v2 = [(WFHandleDonatedIntentAction *)self intent];
  objc_super v3 = [v2 _intentInstanceDescription];

  return v3;
}

- (id)parameterSummary
{
  objc_super v3 = [WFActionParameterSummary alloc];
  BOOL v4 = [(WFHandleDonatedIntentAction *)self title];
  v5 = [(WFActionParameterSummary *)v3 initWithLocalizedString:v4];

  return v5;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFHandleIntentAction *)self appDescriptor];
  id v6 = [v5 localizedName];

  if (v6)
  {
    id v7 = NSString;
    v8 = WFLocalizedStringResourceWithKey(@"Perform the action “%@” in %@.", @"Perform the action “%@” in %@.");
    id v9 = [v4 localize:v8];
    id v10 = [(WFAction *)self localizedName];
    v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10, v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)appIdentifier
{
  v2 = [(WFHandleDonatedIntentAction *)self intentDescriptor];
  objc_super v3 = [v2 displayableBundleIdentifier];

  return v3;
}

- (int64_t)intentCategory
{
  objc_super v3 = [(WFHandleDonatedIntentAction *)self intent];
  if (v3)
  {
    id v4 = [(WFHandleDonatedIntentAction *)self intent];
    int64_t v5 = [v4 _intentCategory];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)localizedKeyParameterDisplayName
{
  objc_super v3 = [(WFHandleDonatedIntentAction *)self intent];
  if (v3)
  {
    id v4 = [(WFHandleDonatedIntentAction *)self intent];
    int64_t v5 = [v4 _codableDescription];
    id v6 = [v5 keyAttribute];
    id v7 = [v6 localizedDisplayName];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(WFHandleDonatedIntentAction *)self title];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHandleDonatedIntentAction;
    id v7 = [(WFHandleIntentAction *)&v10 localizedNameWithContext:v4];
  }
  v8 = v7;

  return v8;
}

- (id)intentDescriptor
{
  intentDescriptor = self->_intentDescriptor;
  if (intentDescriptor) {
    goto LABEL_7;
  }
  id v4 = [(WFAction *)self supplementalParameterValueForKey:@"IntentAppDefinition" ofClass:objc_opt_class()];
  if (v4)
  {
    int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F304E0]) initWithSerializedRepresentation:v4];
LABEL_6:
    id v9 = [MEMORY[0x1E4F302D0] sharedResolver];
    objc_super v10 = [v9 resolvedIntentMatchingDescriptor:v5];
    v11 = self->_intentDescriptor;
    self->_intentDescriptor = v10;

    intentDescriptor = self->_intentDescriptor;
LABEL_7:
    v12 = intentDescriptor;
    goto LABEL_8;
  }
  id v6 = [(WFHandleDonatedIntentAction *)self intent];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F304E0]);
    v8 = [(WFHandleDonatedIntentAction *)self intent];
    int64_t v5 = (void *)[v7 initWithIntent:v8];

    goto LABEL_6;
  }
  v12 = 0;
LABEL_8:
  return v12;
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFHandleDonatedIntentAction;
  [(WFHandleIntentAction *)&v4 initializeParameters];
  objc_super v3 = [(WFAction *)self parameterForKey:@"ShowWhenRun"];
  objc_msgSend(v3, "setHidden:", -[WFHandleIntentAction requiresShowsWhenRun](self, "requiresShowsWhenRun"));
}

- (id)serializedParameters
{
  intent = self->_intent;
  if (intent)
  {
    id v12 = 0;
    objc_super v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:intent requiringSecureCoding:1 error:&v12];
    id v5 = v12;
  }
  else
  {
    objc_super v4 = 0;
    id v5 = 0;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v11.receiver = self;
  v11.super_class = (Class)WFHandleDonatedIntentAction;
  id v7 = [(WFAction *)&v11 serializedParameters];
  v8 = (void *)[v6 initWithDictionary:v7];

  [v8 setValue:v4 forKey:@"IntentData"];
  id v9 = [NSNumber numberWithBool:self->_forceExecutionOnPhone];
  [v8 setValue:v9 forKey:@"ForceExecutionOnPhone"];

  [v8 setValue:self->_groupIdentifier forKey:@"GroupIdentifier"];
  return v8;
}

- (id)executorWithIntent:(id)a3 groupIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v8 = [(WFHandleDonatedIntentAction *)self groupIdentifier];
  }
  v11.receiver = self;
  v11.super_class = (Class)WFHandleDonatedIntentAction;
  id v9 = [(WFHandleIntentAction *)&v11 executorWithIntent:v6 groupIdentifier:v8];
  if (!v7) {

  }
  objc_msgSend(v9, "setForceExecutionOnPhone:", -[WFHandleDonatedIntentAction forceExecutionOnPhone](self, "forceExecutionOnPhone"));
  return v9;
}

- (WFHandleDonatedIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void *)[a5 mutableCopy];
  uint64_t v14 = objc_msgSend(v13, "wf_popObjectForKey:", @"IntentData");
  uint64_t v15 = objc_opt_class();
  v16 = WFEnforceClass(v14, v15);

  v17 = objc_msgSend(v13, "wf_popObjectForKey:", @"ForceExecutionOnPhone");
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = WFEnforceClass(v17, v18);
  char v20 = [v19 BOOLValue];

  v21 = objc_msgSend(v13, "wf_popObjectForKey:", @"GroupIdentifier");
  uint64_t v22 = objc_opt_class();
  v23 = WFEnforceClass(v21, v22);

  v55 = v16;
  if ([v16 length])
  {
    id v60 = 0;
    id v24 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v16 error:&v60];
    id v54 = v60;
    if (v24)
    {
      [v24 typeName];
      id v25 = v12;
      id v26 = v23;
      v28 = id v27 = v10;
      v29 = +[WFIntentActionProvider disabledPlatformsForIntentWithTypeName:v28];

      uint64_t v30 = WFInjectDisabledPlatformsInActionDefinition(v29, v11);

      id v11 = (id)v30;
      id v10 = v27;
      v23 = v26;
      id v12 = v25;
      v16 = v55;
    }
  }
  else
  {
    id v54 = 0;
    id v24 = 0;
  }
  v59.receiver = self;
  v59.super_class = (Class)WFHandleDonatedIntentAction;
  v31 = [(WFHandleIntentAction *)&v59 initWithIdentifier:v10 definition:v11 serializedParameters:v13 stringLocalizer:v12];
  __int16 v32 = v31;
  if (v31)
  {
    v33 = v12;
    id v53 = v10;
    p_intent = (id *)&v31->_intent;
    objc_storeStrong((id *)&v31->_intent, v24);
    v32->_forceExecutionOnPhone = v20;
    objc_storeStrong((id *)&v32->_groupIdentifier, v23);
    v35 = [*p_intent launchId];

    if (v35)
    {
      __int16 v36 = [MEMORY[0x1E4F304C8] sharedConnection];
      uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
      [*p_intent launchId];
      v39 = uint64_t v38 = v23;
      v40 = [v37 setWithObject:v39];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __98__WFHandleDonatedIntentAction_initWithIdentifier_definition_serializedParameters_stringLocalizer___block_invoke;
      v56[3] = &unk_1E6558938;
      v57 = v32;
      id v58 = v33;
      objc_msgSend(v36, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v40, v56);

      v23 = v38;
    }
    title = v32->_title;
    if (title)
    {
      v42 = title;
      v43 = v32->_title;
      v32->_title = v42;
      id v12 = v33;
    }
    else
    {
      id v12 = v33;
      v43 = [*p_intent _titleWithLocalizer:v33 fromBundleURL:0];
      uint64_t v44 = [v43 copy];
      v45 = v32->_title;
      v32->_title = (NSString *)v44;
    }
    subtitle = v32->_subtitle;
    v16 = v55;
    if (subtitle)
    {
      v47 = subtitle;
      v48 = v32->_subtitle;
      v32->_subtitle = v47;
    }
    else
    {
      v48 = [*p_intent _subtitleWithLocalizer:v12 fromBundleURL:0];
      uint64_t v49 = [v48 copy];
      v50 = v32->_subtitle;
      v32->_subtitle = (NSString *)v49;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*p_intent _setLaunchId:*MEMORY[0x1E4FB4BB8]];
    }
    v51 = v32;
    id v10 = v53;
  }

  return v32;
}

void __98__WFHandleDonatedIntentAction_initWithIdentifier_definition_serializedParameters_stringLocalizer___block_invoke(uint64_t a1)
{
  objc_super v3 = [*(id *)(*(void *)(a1 + 32) + 392) _titleWithLocalizer:*(void *)(a1 + 40) fromBundleURL:0];
  objc_super v4 = (void *)[v3 copy];
  id v5 = v4;
  if (!v4)
  {
    v1 = [*(id *)(*(void *)(a1 + 32) + 392) _codableDescription];
    id v5 = [v1 localizedTitleWithLocalizer:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 408), v5);
  if (!v4)
  {
  }
  id v9 = [*(id *)(*(void *)(a1 + 32) + 392) _subtitleWithLocalizer:*(void *)(a1 + 40) fromBundleURL:0];
  uint64_t v6 = [v9 copy];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 416);
  *(void *)(v7 + 416) = v6;
}

+ (id)intentActionWithShortcut:(id)a3 forceExecutionOnPhone:(BOOL)a4 groupIdentifier:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = [a3 intent];
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:a6];
    if ([v11 length])
    {
      id v12 = objc_opt_new();
      [v12 setValue:v11 forKey:@"IntentData"];
      if (v7)
      {
        v13 = [NSNumber numberWithBool:1];
        [v12 setObject:v13 forKey:@"ForceExecutionOnPhone"];
      }
      if (v9) {
        [v12 setObject:v9 forKey:@"GroupIdentifier"];
      }
      uint64_t v14 = +[WFActionRegistry sharedRegistry];
      uint64_t v15 = [v14 createActionWithIdentifier:@"is.workflow.actions.sirikit.donation.handle" serializedParameters:v12];

      uint64_t v16 = objc_opt_class();
      v17 = WFEnforceClass(v15, v16);
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    if (a6)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"Could not create action because the intent was missing";
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      *a6 = [v18 errorWithDomain:@"WFActionErrorDomain" code:5 userInfo:v19];
    }
    v17 = 0;
  }

  return v17;
}

@end