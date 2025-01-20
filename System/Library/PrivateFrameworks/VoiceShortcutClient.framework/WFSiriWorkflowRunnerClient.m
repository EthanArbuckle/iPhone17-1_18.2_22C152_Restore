@interface WFSiriWorkflowRunnerClient
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)dialogRequestListener;
- (WFPausedShortcutData)pausedData;
- (WFSiriExecutionMetrics)siriExecutionMetrics;
- (WFSiriWorkflowRunnerClient)initWithAutoShortcutIdentifier:(id)a3 phrase:(id)a4 runSource:(int64_t)a5 action:(id)a6 metadata:(id)a7;
- (WFSiriWorkflowRunnerClient)initWithPausedShortcutData:(id)a3 runSource:(int64_t)a4 options:(id)a5;
- (WFSiriWorkflowRunnerClient)initWithRunDescriptor:(id)a3 runSource:(int64_t)a4 options:(id)a5;
- (WFSiriWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3 runSource:(int64_t)a4 options:(id)a5;
- (WFSiriWorkflowRunnerClient)initWithWorkflowName:(id)a3 runSource:(int64_t)a4 options:(id)a5;
- (id)pauseRunningShortcut;
- (id)workflowRunSourceForSiriRunSource:(int64_t)a3;
- (int64_t)deviceIdiomForCurrentDevice;
- (int64_t)deviceIdiomFromRunSource:(int64_t)a3;
- (void)didFinishActionWithIdentifier:(id)a3;
- (void)didStartActionWithIdentifier:(id)a3;
- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4;
- (void)performDialogRequest:(id)a3 completionHandler:(id)a4;
- (void)performSiriRequest:(id)a3 completionHandler:(id)a4;
- (void)setPausedData:(id)a3;
- (void)setSiriExecutionMetrics:(id)a3;
- (void)start;
- (void)stop;
- (void)willBeginExecutingShortcutStep:(id)a3;
- (void)willBeginExecutingShortcutWithActionCount:(id)a3;
@end

@implementation WFSiriWorkflowRunnerClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pausedData, 0);
  objc_storeStrong((id *)&self->_dialogRequestListener, 0);
  objc_storeStrong((id *)&self->_siriExecutionMetrics, 0);
}

- (void)setPausedData:(id)a3
{
}

- (WFPausedShortcutData)pausedData
{
  return self->_pausedData;
}

- (NSXPCListener)dialogRequestListener
{
  return self->_dialogRequestListener;
}

- (void)setSiriExecutionMetrics:(id)a3
{
}

- (WFSiriExecutionMetrics)siriExecutionMetrics
{
  return self->_siriExecutionMetrics;
}

- (int64_t)deviceIdiomForCurrentDevice
{
  v2 = +[WFDevice currentDevice];
  unint64_t v3 = [v2 idiom];

  if (v3 > 3) {
    return 0;
  }
  else {
    return qword_1B3D88AA0[v3];
  }
}

- (int64_t)deviceIdiomFromRunSource:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int64_t result = [(WFSiriWorkflowRunnerClient *)self deviceIdiomForCurrentDevice];
      break;
    case 2:
      int64_t result = 4;
      break;
    case 3:
      int64_t result = 5;
      break;
    case 4:
      int64_t result = 3;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)workflowRunSourceForSiriRunSource:(int64_t)a3
{
  v4 = @"siri-unknown";
  v5 = @"siri-unknown";
  if ((unint64_t)(a3 - 1) <= 3)
  {
    v4 = *off_1E6077660[a3 - 1];
  }
  return v4;
}

- (void)didFinishActionWithIdentifier:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(WFWorkflowRunnerClient *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(WFWorkflowRunnerClient *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(WFWorkflowRunnerClient *)self delegate];
      [v8 workflowRunnerClient:self didFinishActionWithIdentifier:v9];
    }
  }
}

- (void)didStartActionWithIdentifier:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(WFWorkflowRunnerClient *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(WFWorkflowRunnerClient *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(WFWorkflowRunnerClient *)self delegate];
      [v8 workflowRunnerClient:self didStartActionWithIdentifier:v9];
    }
  }
}

- (void)performDialogRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, WFDialogResponse *))a4;
  v5 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315138;
    v8 = "-[WFSiriWorkflowRunnerClient performDialogRequest:completionHandler:]";
    _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_FAULT, "%s Siri workflow runner client should not present, attempting to punch out", (uint8_t *)&v7, 0xCu);
  }

  v6 = [[WFDialogResponse alloc] initWithResponseCode:4];
  v4[2](v4, v6);
}

- (void)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(WFWorkflowRunnerClient *)self delegate];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [(WFWorkflowRunnerClient *)self delegate],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    v12 = [(WFWorkflowRunnerClient *)self delegate];
    [v12 workflowRunnerClient:self performSiriRequest:v6 completionHandler:v7];

    [(WFSiriExecutionMetrics *)self->_siriExecutionMetrics setSiriInteractionCount:[(WFSiriExecutionMetrics *)self->_siriExecutionMetrics siriInteractionCount] + 1];
  }
  else
  {
    v13 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      v18 = "-[WFSiriWorkflowRunnerClient performSiriRequest:completionHandler:]";
      _os_log_impl(&dword_1B3C5C000, v13, OS_LOG_TYPE_FAULT, "%s Siri delegate not present, attempting to punch out", (uint8_t *)&v17, 0xCu);
    }

    v14 = [WFSiriActionResponse alloc];
    v15 = [MEMORY[0x1E4F28C58] wfSiriExecutionRequiresShortcutsJrError];
    v16 = [(WFSiriActionResponse *)v14 initWithError:v15];

    v7[2](v7, v16);
  }
}

- (void)willBeginExecutingShortcutStep:(id)a3
{
  uint64_t v4 = [a3 unsignedIntValue];
  siriExecutionMetrics = self->_siriExecutionMetrics;
  [(WFSiriExecutionMetrics *)siriExecutionMetrics setCurrentShortcutStep:v4];
}

- (void)willBeginExecutingShortcutWithActionCount:(id)a3
{
  uint64_t v4 = [a3 unsignedIntValue];
  siriExecutionMetrics = self->_siriExecutionMetrics;
  [(WFSiriExecutionMetrics *)siriExecutionMetrics setShortcutActionCount:v4];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = WFExternalUIPresenterXPCInterface();
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)WFSiriWorkflowRunnerClient;
  [(WFWorkflowRunnerClient *)&v4 handleWorkflowRunResult:a3 completion:a4];
}

- (id)pauseRunningShortcut
{
  [(WFWorkflowRunnerClient *)self pause];
  unint64_t v3 = [WFPausedShortcutData alloc];
  objc_super v4 = [(WFWorkflowRunnerClient *)self context];
  id v5 = [(WFWorkflowRunnerClient *)self descriptor];
  id v6 = [(WFPausedShortcutData *)v3 initWithContext:v4 descriptor:v5];

  return v6;
}

- (void)stop
{
  v4.receiver = self;
  v4.super_class = (Class)WFSiriWorkflowRunnerClient;
  [(WFWorkflowRunnerClient *)&v4 stop];
  unint64_t v3 = [(WFSiriWorkflowRunnerClient *)self dialogRequestListener];
  [v3 invalidate];
}

- (void)start
{
  unint64_t v3 = [(WFSiriWorkflowRunnerClient *)self dialogRequestListener];
  [v3 resume];

  objc_super v4 = [(WFSiriWorkflowRunnerClient *)self pausedData];

  if (v4)
  {
    uint64_t v8 = self;
    id v5 = &selRef_resume;
    id v6 = &v8;
  }
  else
  {
    int v7 = self;
    id v5 = &selRef_start;
    id v6 = &v7;
  }
  v6[1] = (WFSiriWorkflowRunnerClient *)WFSiriWorkflowRunnerClient;
  objc_msgSendSuper2((objc_super *)v6, *v5, v7);
}

- (WFSiriWorkflowRunnerClient)initWithPausedShortcutData:(id)a3 runSource:(int64_t)a4 options:(id)a5
{
  uint64_t v8 = (WFPausedShortcutData *)a3;
  uint64_t v9 = (void *)MEMORY[0x1E4F29290];
  id v10 = a5;
  char v11 = [v9 anonymousListener];
  [(NSXPCListener *)v11 setDelegate:self];
  dialogRequestListener = self->_dialogRequestListener;
  self->_dialogRequestListener = v11;
  v13 = v11;

  pausedData = self->_pausedData;
  self->_pausedData = v8;
  v15 = v8;

  v16 = [(WFPausedShortcutData *)v15 context];
  [(WFWorkflowRunnerClient *)self setContext:v16];

  int v17 = [[WFSiriWorkflowRunRequest alloc] initWithOptions:v10];
  v18 = [(WFSiriWorkflowRunnerClient *)self workflowRunSourceForSiriRunSource:a4];
  [(WFWorkflowRunRequest *)v17 setRunSource:v18];

  uint64_t v19 = [(NSXPCListener *)v13 endpoint];
  [(WFWorkflowRunRequest *)v17 setRemoteDialogPresenterEndpoint:v19];

  v20 = [(WFPausedShortcutData *)v15 descriptor];
  v23.receiver = self;
  v23.super_class = (Class)WFSiriWorkflowRunnerClient;
  v21 = [(WFWorkflowRunnerClient *)&v23 initWithDescriptor:v20 runRequest:v17];

  return v21;
}

- (WFSiriWorkflowRunnerClient)initWithAutoShortcutIdentifier:(id)a3 phrase:(id)a4 runSource:(int64_t)a5 action:(id)a6 metadata:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = [[WFLinkActionRunDescriptor alloc] initWithIdentifier:v15 name:v14 action:v13 metadata:v12 isAutoShortcut:1];

  int v17 = [MEMORY[0x1E4F29290] anonymousListener];
  [(NSXPCListener *)v17 setDelegate:self];
  dialogRequestListener = self->_dialogRequestListener;
  self->_dialogRequestListener = v17;
  uint64_t v19 = v17;

  v20 = [[WFSiriWorkflowRunnerClientOptions alloc] initWithAirPlayRouteIDs:0 executionContext:2 originatingDeviceIDSIdentifier:0 originatingDeviceRapportEffectiveIdentifier:0 originatingDeviceRapportMediaSystemIdentifier:0 isOwnedByCurrentUser:0];
  [(WFSiriWorkflowRunnerClientOptions *)v20 setCurrentDeviceIdiom:[(WFSiriWorkflowRunnerClient *)self deviceIdiomFromRunSource:a5]];
  v21 = [[WFSiriWorkflowRunRequest alloc] initWithOptions:v20];
  v22 = [(WFSiriWorkflowRunnerClient *)self workflowRunSourceForSiriRunSource:a5];
  [(WFWorkflowRunRequest *)v21 setRunSource:v22];

  objc_super v23 = [(NSXPCListener *)v19 endpoint];
  [(WFWorkflowRunRequest *)v21 setRemoteDialogPresenterEndpoint:v23];

  [(WFWorkflowRunRequest *)v21 setAllowsDialogNotifications:0];
  v24 = objc_alloc_init(WFSiriExecutionMetrics);
  siriExecutionMetrics = self->_siriExecutionMetrics;
  self->_siriExecutionMetrics = v24;

  v28.receiver = self;
  v28.super_class = (Class)WFSiriWorkflowRunnerClient;
  v26 = [(WFWorkflowRunnerClient *)&v28 initWithDescriptor:v16 runRequest:v21];

  return v26;
}

- (WFSiriWorkflowRunnerClient)initWithRunDescriptor:(id)a3 runSource:(int64_t)a4 options:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F29290];
  id v9 = a5;
  id v10 = a3;
  char v11 = [v8 anonymousListener];
  [(NSXPCListener *)v11 setDelegate:self];
  dialogRequestListener = self->_dialogRequestListener;
  self->_dialogRequestListener = v11;
  id v13 = v11;

  objc_msgSend(v9, "setCurrentDeviceIdiom:", -[WFSiriWorkflowRunnerClient deviceIdiomFromRunSource:](self, "deviceIdiomFromRunSource:", a4));
  id v14 = [[WFSiriWorkflowRunRequest alloc] initWithOptions:v9];

  id v15 = [(WFSiriWorkflowRunnerClient *)self workflowRunSourceForSiriRunSource:a4];
  [(WFWorkflowRunRequest *)v14 setRunSource:v15];

  v16 = [(NSXPCListener *)v13 endpoint];
  [(WFWorkflowRunRequest *)v14 setRemoteDialogPresenterEndpoint:v16];

  [(WFWorkflowRunRequest *)v14 setAllowsDialogNotifications:0];
  int v17 = objc_alloc_init(WFSiriExecutionMetrics);
  siriExecutionMetrics = self->_siriExecutionMetrics;
  self->_siriExecutionMetrics = v17;

  v21.receiver = self;
  v21.super_class = (Class)WFSiriWorkflowRunnerClient;
  uint64_t v19 = [(WFWorkflowRunnerClient *)&v21 initWithDescriptor:v10 runRequest:v14];

  return v19;
}

- (WFSiriWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3 runSource:(int64_t)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[WFWorkflowDatabaseRunDescriptor alloc] initWithIdentifier:v9];

  char v11 = [(WFSiriWorkflowRunnerClient *)self initWithRunDescriptor:v10 runSource:a4 options:v8];
  return v11;
}

- (WFSiriWorkflowRunnerClient)initWithWorkflowName:(id)a3 runSource:(int64_t)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[WFWorkflowDatabaseRunDescriptor alloc] initWithName:v9];

  char v11 = [(WFSiriWorkflowRunnerClient *)self initWithRunDescriptor:v10 runSource:a4 options:v8];
  return v11;
}

@end