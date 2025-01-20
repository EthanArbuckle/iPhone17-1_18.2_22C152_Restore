@interface WFStaccatoWorkflowRunnerClient
+ (id)defaultContextualActionContext;
- (BOOL)hasCompletedRun;
- (BOOL)hasStartedRun;
- (NSString)presentableIdentifier;
- (NSString)presentableRequester;
- (WFStaccatoWorkflowRunnerClient)initWithStaccatoAction:(id)a3;
- (WFStaccatoWorkflowRunnerClient)initWithStaccatoAction:(id)a3 interactionType:(id)a4 preciseTimeStamp:(id)a5;
- (void)setHasStartedRun:(BOOL)a3;
- (void)start;
- (void)startWithInteractionType:(id)a3 preciseTimeStamp:(id)a4;
@end

@implementation WFStaccatoWorkflowRunnerClient

- (void)setHasStartedRun:(BOOL)a3
{
  self->_hasStartedRun = a3;
}

- (BOOL)hasStartedRun
{
  return self->_hasStartedRun;
}

- (BOOL)hasCompletedRun
{
  BOOL v3 = [(WFStaccatoWorkflowRunnerClient *)self hasStartedRun];
  if (v3)
  {
    v4 = [(WFSystemActionRunnerClient *)self action];
    v5 = [v4 identifier];
    char v6 = [v5 isEqualToString:@"com.apple.VoiceMemos.ToggleRecording"];

    if (v6) {
      LOBYTE(v3) = 1;
    }
    else {
      LOBYTE(v3) = ![(WFWorkflowRunnerClient *)self isRunning];
    }
  }
  return v3;
}

- (void)start
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFSystemActionRunnerClient *)self actionContext];

  v4 = getWFStaccatoLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      char v6 = [(WFSystemActionRunnerClient *)self actionContext];
      v7 = [v6 staccatoInteractionType];
      v8 = [(WFSystemActionRunnerClient *)self actionContext];
      v9 = [v8 preciseTimestamp];
      v10 = [(WFSystemActionRunnerClient *)self action];
      *(_DWORD *)buf = 136315906;
      v13 = "-[WFStaccatoWorkflowRunnerClient start]";
      __int16 v14 = 2112;
      v15 = v7;
      __int16 v16 = 2048;
      v17 = v9;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_DEFAULT, "%s Running from staccato interaction type: %@, preciseTimestamp: %p, action: %@", buf, 0x2Au);

LABEL_6:
    }
  }
  else if (v5)
  {
    char v6 = [(WFSystemActionRunnerClient *)self action];
    *(_DWORD *)buf = 136315394;
    v13 = "-[WFStaccatoWorkflowRunnerClient start]";
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_DEFAULT, "%s Running from staccato action: %@", buf, 0x16u);
    goto LABEL_6;
  }

  v11.receiver = self;
  v11.super_class = (Class)WFStaccatoWorkflowRunnerClient;
  [(WFSystemActionRunnerClient *)&v11 start];
  [(WFStaccatoWorkflowRunnerClient *)self setHasStartedRun:1];
}

- (void)startWithInteractionType:(id)a3 preciseTimeStamp:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(WFSystemActionRunnerClient *)self actionContext];

  if (v7)
  {
    v8 = [(WFSystemActionRunnerClient *)self actionContext];
    [v8 setStaccatoInteractionType:v10];

    v9 = [(WFSystemActionRunnerClient *)self actionContext];
    [v9 setPreciseTimestamp:v6];
  }
  if (![(WFStaccatoWorkflowRunnerClient *)self hasStartedRun]) {
    [(WFStaccatoWorkflowRunnerClient *)self start];
  }
}

- (NSString)presentableRequester
{
  BOOL v3 = [(WFSystemActionRunnerClient *)self action];
  v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:@"is.workflow.actions.openapp"];

  if (v5)
  {
    id v6 = [(WFSystemActionRunnerClient *)self action];
    v7 = [v6 associatedBundleIdentifier];
  }
  else
  {
    v7 = @"com.apple.ShortcutsUI";
    v8 = @"com.apple.ShortcutsUI";
  }
  return (NSString *)v7;
}

- (NSString)presentableIdentifier
{
  v2 = [(WFWorkflowRunnerClient *)self context];
  BOOL v3 = WFApertureStatusViewControllerIdentityFromRunningContext(v2);

  return (NSString *)v3;
}

- (WFStaccatoWorkflowRunnerClient)initWithStaccatoAction:(id)a3 interactionType:(id)a4 preciseTimeStamp:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_15:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFStaccatoWorkflowRunnerClient.m", 49, @"Invalid parameter not satisfying: %@", @"interactionType" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"WFStaccatoWorkflowRunnerClient.m", 48, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

  if (!v10) {
    goto LABEL_15;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_16:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"WFStaccatoWorkflowRunnerClient.m", 50, @"Invalid parameter not satisfying: %@", @"preciseTimestamp" object file lineNumber description];

LABEL_4:
  v12 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v32 = "-[WFStaccatoWorkflowRunnerClient initWithStaccatoAction:interactionType:preciseTimeStamp:]";
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2048;
    id v36 = v11;
    __int16 v37 = 2112;
    id v38 = v9;
    _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_DEFAULT, "%s Initializing Staccato runner interaction type: %@, preciseTimestamp: %p, action: %@", buf, 0x2Au);
  }

  id v13 = v9;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v14 = v13;
    }
    else {
      __int16 v14 = 0;
    }
  }
  else
  {
    __int16 v14 = 0;
  }
  id v15 = v14;

  v30.receiver = self;
  v30.super_class = (Class)WFStaccatoWorkflowRunnerClient;
  __int16 v16 = [(WFSystemActionRunnerClient *)&v30 initWithSystemAction:v15];
  v17 = [v13 sectionIdentifier];

  LOBYTE(v15) = [v17 isEqualToString:@"Shortcuts"];
  if ((v15 & 1) == 0)
  {
    __int16 v18 = [(WFWorkflowRunnerClient *)v16 runRequest];
    [v18 setPresentationMode:3];
  }
  v19 = [(WFWorkflowRunnerClient *)v16 runRequest];
  [v19 setRunSource:@"action-button"];

  uint64_t v20 = [(WFSystemActionRunnerClient *)v16 actionContext];
  [v20 setStaccatoInteractionType:v10];

  v21 = [(WFSystemActionRunnerClient *)v16 actionContext];
  [v21 setSurface:12];

  v22 = [(WFSystemActionRunnerClient *)v16 actionContext];
  [v22 setPreciseTimestamp:v11];

  v23 = [(WFWorkflowRunnerClient *)v16 runRequest];
  v24 = [(WFWorkflowRunnerClient *)v16 descriptor];
  id v25 = [(WFWorkflowRunnerClient *)v16 createRunningContextFromRequestIfNecessary:v23 descriptor:v24];

  return v16;
}

- (WFStaccatoWorkflowRunnerClient)initWithStaccatoAction:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  id v6 = [(WFStaccatoWorkflowRunnerClient *)self initWithStaccatoAction:v4 interactionType:@"WFStaccatoActionInteractionTypeUnknown" preciseTimeStamp:v5];

  return v6;
}

+ (id)defaultContextualActionContext
{
  v2 = [[WFContextualActionContext alloc] initWithSurface:12];
  return v2;
}

@end