@interface WFPencilSqueezeWorkflowRunnerClient
+ (id)defaultContextualActionContext;
- (BOOL)hasCompletedRun;
- (BOOL)hasStartedRun;
- (WFPencilSqueezeWorkflowRunnerClient)initWithSystemAction:(id)a3 preciseTimeStamp:(id)a4;
- (void)setHasStartedRun:(BOOL)a3;
- (void)start;
- (void)startWithPreciseTimeStamp:(id)a3;
@end

@implementation WFPencilSqueezeWorkflowRunnerClient

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
  BOOL v3 = [(WFPencilSqueezeWorkflowRunnerClient *)self hasStartedRun];
  if (v3) {
    LOBYTE(v3) = ![(WFWorkflowRunnerClient *)self isRunning];
  }
  return v3;
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)WFPencilSqueezeWorkflowRunnerClient;
  [(WFSystemActionRunnerClient *)&v3 start];
  [(WFPencilSqueezeWorkflowRunnerClient *)self setHasStartedRun:1];
}

- (void)startWithPreciseTimeStamp:(id)a3
{
  id v6 = a3;
  v4 = [(WFSystemActionRunnerClient *)self actionContext];

  if (v4)
  {
    v5 = [(WFSystemActionRunnerClient *)self actionContext];
    [v5 setPreciseTimestamp:v6];
  }
  if (![(WFPencilSqueezeWorkflowRunnerClient *)self hasStartedRun]) {
    [(WFPencilSqueezeWorkflowRunnerClient *)self start];
  }
}

- (WFPencilSqueezeWorkflowRunnerClient)initWithSystemAction:(id)a3 preciseTimeStamp:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFPencilSqueezeWorkflowRunnerClient.m", 37, @"Invalid parameter not satisfying: %@", @"systemAction" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WFPencilSqueezeWorkflowRunnerClient.m", 38, @"Invalid parameter not satisfying: %@", @"preciseTimestamp" object file lineNumber description];

LABEL_3:
  v10 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[WFPencilSqueezeWorkflowRunnerClient initWithSystemAction:preciseTimeStamp:]";
    __int16 v24 = 2048;
    v25 = v9;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEFAULT, "%s Initializing B532 runner - preciseTimestamp: %p, action: %@", buf, 0x20u);
  }

  v21.receiver = self;
  v21.super_class = (Class)WFPencilSqueezeWorkflowRunnerClient;
  v11 = [(WFSystemActionRunnerClient *)&v21 initWithSystemAction:v7];
  v12 = [(WFWorkflowRunnerClient *)v11 runRequest];
  [v12 setRunSource:@"pencil-squeeze"];

  v13 = [(WFSystemActionRunnerClient *)v11 actionContext];
  [v13 setSurface:13];

  v14 = [(WFSystemActionRunnerClient *)v11 actionContext];
  [v14 setPreciseTimestamp:v9];

  v15 = [(WFWorkflowRunnerClient *)v11 runRequest];
  v16 = [(WFWorkflowRunnerClient *)v11 descriptor];
  id v17 = [(WFWorkflowRunnerClient *)v11 createRunningContextFromRequestIfNecessary:v15 descriptor:v16];

  return v11;
}

+ (id)defaultContextualActionContext
{
  v2 = [[WFContextualActionContext alloc] initWithSurface:13];
  return v2;
}

@end