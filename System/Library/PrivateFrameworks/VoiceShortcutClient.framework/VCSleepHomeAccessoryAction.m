@interface VCSleepHomeAccessoryAction
- (VCSleepHomeAccessoryAction)initWithTriggerActionSetsBuilder:(id)a3;
@end

@implementation VCSleepHomeAccessoryAction

- (VCSleepHomeAccessoryAction)initWithTriggerActionSetsBuilder:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"VCSleepHomeAccessoryAction.m", 25, @"Invalid parameter not satisfying: %@", @"triggerActionSetsBuilder" object file lineNumber description];
  }
  v6 = NSString;
  v7 = WFLocalizedString(@"Set %@");
  v8 = [v5 actionSetsSummary];
  v9 = [v8 summaryText];
  v24 = objc_msgSend(v6, "stringWithFormat:", v7, v9);

  v10 = [v5 home];
  v11 = [v5 allActionSets];
  v12 = objc_msgSend(v11, "if_map:", &__block_literal_global_10138);
  v28[0] = @"WFHFTriggerActionSetsBuilderParameterStateActionSets";
  v28[1] = @"WFHFTriggerActionSetsBuilderParameterStateHome";
  v29[0] = v12;
  v13 = [v10 uuid];
  v14 = [v13 UUIDString];
  v29[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  v26 = @"WFHomeTriggerActionSets";
  v27 = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v17 = +[VCSleepAction identifierForWorkflowActionIdentifier:@"is.workflow.actions.homeaccessory" serializedParameters:v16];
  v18 = [v10 name];
  v25.receiver = self;
  v25.super_class = (Class)VCSleepHomeAccessoryAction;
  v19 = [(VCSleepAction *)&v25 initWithIdentifier:v17 workflowActionIdentifier:@"is.workflow.actions.homeaccessory" sourceAppBundleIdentifier:@"com.apple.Home" bundleIdentifierForDisplay:@"com.apple.Home" title:v24 subtitle:v18 serializedParameters:v16 shortcutAvailability:0];
  v20 = v19;
  if (v19) {
    v21 = v19;
  }

  return v20;
}

uint64_t __63__VCSleepHomeAccessoryAction_initWithTriggerActionSetsBuilder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortcutsDictionaryRepresentation];
}

@end