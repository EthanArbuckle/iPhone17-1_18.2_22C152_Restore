@interface VCSleepOpenAppAction
- (VCSleepOpenAppAction)initWithBundleIdentifier:(id)a3;
@end

@implementation VCSleepOpenAppAction

- (VCSleepOpenAppAction)initWithBundleIdentifier:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"VCSleepOpenAppAction.m", 24, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];
  v7 = v6;
  if (v6
    && ([v6 applicationState],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isInstalled],
        v8,
        v9))
  {
    v10 = [v7 localizedName];
    v11 = NSString;
    v12 = WFLocalizedString(@"Open %@");
    v13 = objc_msgSend(v11, "stringWithFormat:", v12, v10);

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithApplicationRecord:v7];
    v24[0] = @"WFAppName";
    v24[1] = @"WFSelectedApp";
    v25[0] = v10;
    v15 = [v14 serializedRepresentation];
    v25[1] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

    v17 = +[VCSleepAction identifierForWorkflowActionIdentifier:@"is.workflow.actions.openapp" serializedParameters:v16];
    v23.receiver = self;
    v23.super_class = (Class)VCSleepOpenAppAction;
    v18 = [(VCSleepAction *)&v23 initWithIdentifier:v17 workflowActionIdentifier:@"is.workflow.actions.openapp" sourceAppBundleIdentifier:v5 bundleIdentifierForDisplay:v5 title:v13 subtitle:0 serializedParameters:v16 shortcutAvailability:0];
    self = v18;
    if (v18) {
      v19 = v18;
    }

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end