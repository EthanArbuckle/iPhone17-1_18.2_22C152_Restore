@interface WFShortcutsAppRunnerClient
- (WFShortcutsAppRunnerClient)initWithContextualAction:(id)a3;
- (WFShortcutsAppRunnerClient)initWithIdentifier:(id)a3 name:(id)a4 action:(id)a5 metadata:(id)a6 runSource:(id)a7 remoteDialogPresenterEndpoint:(id)a8;
- (WFShortcutsAppRunnerClient)initWithWorkflow:(id)a3 state:(id)a4 runSource:(id)a5 input:(id)a6 remoteDialogPresenterEndpoint:(id)a7 requestOutput:(BOOL)a8;
- (WFShortcutsAppRunnerClient)initWithWorkflowData:(id)a3 runSource:(id)a4;
- (id)runWorkflowWithRequest:(id)a3 descriptor:(id)a4 completion:(id)a5;
@end

@implementation WFShortcutsAppRunnerClient

- (id)runWorkflowWithRequest:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFWorkflowRunnerClient *)self descriptor];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = [v11 context];
    v13 = [(WFWorkflowRunnerClient *)self createWorkflowControllerWithContext:v12];
    v14 = [(WFWorkflowRunnerClient *)self runRequest];
    [v13 resumeRunningWithRequest:v14 error:0];
  }
  else
  {

    v16.receiver = self;
    v16.super_class = (Class)WFShortcutsAppRunnerClient;
    v12 = [(WFWorkflowRunnerClient *)&v16 runWorkflowWithRequest:v8 descriptor:v9 completion:v10];
  }

  return v12;
}

- (WFShortcutsAppRunnerClient)initWithContextualAction:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FB4648];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithSurface:2];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB4668]) initWithAction:v5 context:v6];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB4670]) initWithAction:v5 actionContext:v6];

  v11.receiver = self;
  v11.super_class = (Class)WFShortcutsAppRunnerClient;
  id v9 = [(WFWorkflowRunnerClient *)&v11 initWithDescriptor:v7 runRequest:v8 delegateQueue:MEMORY[0x1E4F14428]];

  return v9;
}

- (WFShortcutsAppRunnerClient)initWithIdentifier:(id)a3 name:(id)a4 action:(id)a5 metadata:(id)a6 runSource:(id)a7 remoteDialogPresenterEndpoint:(id)a8
{
  v14 = (objc_class *)MEMORY[0x1E4FB47B8];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = (void *)[[v14 alloc] initWithIdentifier:v20 name:v19 action:v18 metadata:v17 isAutoShortcut:1];

  id v22 = objc_alloc(MEMORY[0x1E4FB4A78]);
  v23 = [MEMORY[0x1E4FB46B8] currentDevice];
  v24 = objc_msgSend(v22, "initWithInput:presentationMode:", 0, objc_msgSend(v23, "hasSystemAperture"));

  [v24 setRunSource:v16];
  [v24 setOutputBehavior:1];
  [v24 setAllowsDialogNotifications:0];
  [v24 setRemoteDialogPresenterEndpoint:v15];

  v27.receiver = self;
  v27.super_class = (Class)WFShortcutsAppRunnerClient;
  v25 = [(WFWorkflowRunnerClient *)&v27 initWithDescriptor:v21 runRequest:v24 delegateQueue:MEMORY[0x1E4F14428]];

  return v25;
}

- (WFShortcutsAppRunnerClient)initWithWorkflowData:(id)a3 runSource:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4FB4A38];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithWorkflowData:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB4A78]) initWithInput:0 presentationMode:3];
  [v10 setRunSource:v7];

  [v10 setOutputBehavior:2];
  [v10 setAllowsDialogNotifications:0];
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutsAppRunnerClient;
  objc_super v11 = [(WFWorkflowRunnerClient *)&v13 initWithDescriptor:v9 runRequest:v10 delegateQueue:MEMORY[0x1E4F14428]];

  return v11;
}

- (WFShortcutsAppRunnerClient)initWithWorkflow:(id)a3 state:(id)a4 runSource:(id)a5 input:(id)a6 remoteDialogPresenterEndpoint:(id)a7 requestOutput:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v40 = a5;
  id v16 = a7;
  id v17 = (objc_class *)MEMORY[0x1E4FB4A78];
  id v18 = a6;
  id v19 = [v17 alloc];
  id v20 = [MEMORY[0x1E4FB46B8] currentDevice];
  v21 = objc_msgSend(v19, "initWithInput:presentationMode:", v18, objc_msgSend(v20, "hasSystemAperture"));

  id v22 = [v15 runningContext];

  if (v22)
  {
    uint64_t v23 = *MEMORY[0x1E4FB4BE8];
    v24 = [v15 runningContext];
    [v24 setOriginatingBundleIdentifier:v23];

    v25 = [WFHandoffRunDescriptor alloc];
    v26 = [v15 runningContext];
    objc_super v27 = [(WFHandoffRunDescriptor *)v25 initWithContext:v26];

    v28 = [v15 extensionResourceClasses];
    [v21 setExtensionResourceClasses:v28];

    v29 = [v15 runningContext];
    v30 = WFWFWorkflowControllerStateDefaultSerializedURLFromContext(v29);

    if (!v30)
    {
      v38 = 0;
      v36 = v40;
      goto LABEL_13;
    }
    BOOL v31 = v8;
    id v42 = 0;
    char v32 = [v15 writeToURL:v30 error:&v42];
    id v33 = v42;
    if ((v32 & 1) == 0)
    {
      v34 = getWFXPCRunnerLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v44 = "-[WFShortcutsAppRunnerClient initWithWorkflow:state:runSource:input:remoteDialogPresenterEndpoint:requestOutput:]";
        __int16 v45 = 2112;
        v46 = v30;
        __int16 v47 = 2112;
        id v48 = v33;
        _os_log_impl(&dword_1C7F0A000, v34, OS_LOG_TYPE_FAULT, "%s Unable to save state to (%@): %@", buf, 0x20u);
      }
    }
  }
  else
  {
    BOOL v31 = v8;
    id v35 = objc_alloc(MEMORY[0x1E4FB4A40]);
    v30 = [v14 identifier];
    id v33 = [v14 name];
    objc_super v27 = (WFHandoffRunDescriptor *)[v35 initWithIdentifier:v30 name:v33];
  }

  v36 = v40;
  [v21 setRunSource:v40];
  if (v31) {
    uint64_t v37 = 2;
  }
  else {
    uint64_t v37 = 1;
  }
  objc_msgSend(v21, "setOutputBehavior:", v37, v40);
  [v21 setRemoteDialogPresenterEndpoint:v16];
  [v21 setAllowsDialogNotifications:0];
  objc_msgSend(v21, "setDonateInteraction:", objc_msgSend(v14, "hiddenFromLibraryAndSync") ^ 1);
  v41.receiver = self;
  v41.super_class = (Class)WFShortcutsAppRunnerClient;
  self = [(WFWorkflowRunnerClient *)&v41 initWithDescriptor:v27 runRequest:v21 delegateQueue:MEMORY[0x1E4F14428]];
  v38 = self;
LABEL_13:

  return v38;
}

@end