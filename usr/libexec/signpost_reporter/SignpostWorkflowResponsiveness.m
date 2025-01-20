@interface SignpostWorkflowResponsiveness
+ (id)allWorkflows;
+ (id)workflowWithName:(id)a3;
- (BOOL)signpostInAllowList:(id)a3;
- (SignpostWorkflowResponsiveness)initWithWorkflowEventTracker:(id)a3;
- (WRWorkflowEventTracker)workflowEventTracker;
- (id)newConfiguredExtractor;
- (void)addSubsystemCategoriesOfInterestToAllowlist:(id)a3;
- (void)handleDeviceReboot;
- (void)handleSignpostEmitEvent:(id)a3;
- (void)handleSignpostInterval:(id)a3;
- (void)handleSignpostIntervalBegin:(id)a3;
@end

@implementation SignpostWorkflowResponsiveness

- (SignpostWorkflowResponsiveness)initWithWorkflowEventTracker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SignpostWorkflowResponsiveness;
  v6 = [(SignpostWorkflowResponsiveness *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workflowEventTracker, a3);
  }

  return v7;
}

+ (id)allWorkflows
{
  v2 = +[WRWorkflow allWorkflows];
  if ([v2 count])
  {
    id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v2 count]];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v13 = v2;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [objc_alloc((Class)WRWorkflowEventTracker) initForReadbackWithWorkflow:*(void *)(*((void *)&v14 + 1) + 8 * i) eventCompletionCallback:&stru_1000103C8];
          v10 = [[SignpostWorkflowResponsiveness alloc] initWithWorkflowEventTracker:v9];
          if (v10) {
            [v3 addObject:v10];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    id v11 = [v3 copy];
    v2 = v13;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)workflowWithName:(id)a3
{
  id v3 = +[WRWorkflow workflowWithName:a3];
  if (v3)
  {
    id v4 = [objc_alloc((Class)WRWorkflowEventTracker) initForReadbackWithWorkflow:v3 eventCompletionCallback:&stru_1000103E8];
    id v5 = [[SignpostWorkflowResponsiveness alloc] initWithWorkflowEventTracker:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)addSubsystemCategoriesOfInterestToAllowlist:(id)a3
{
  id v4 = a3;
  id v7 = [(SignpostWorkflowResponsiveness *)self workflowEventTracker];
  id v5 = [v7 workflow];
  id v6 = [v5 allowListForAllSignposts];
  [v4 addAllowlist:v6];
}

- (BOOL)signpostInAllowList:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostWorkflowResponsiveness *)self workflowEventTracker];
  id v6 = [v5 workflow];
  id v7 = [v6 allowListForAllSignposts];
  v8 = [v4 subsystem];
  id v9 = [v4 category];

  LOBYTE(v4) = [v7 passesSubsystem:v8 category:v9];
  return (char)v4;
}

- (void)handleDeviceReboot
{
  id v2 = [(SignpostWorkflowResponsiveness *)self workflowEventTracker];
  [v2 reset];
}

- (void)handleSignpostIntervalBegin:(id)a3
{
  id v5 = a3;
  if (-[SignpostWorkflowResponsiveness signpostInAllowList:](self, "signpostInAllowList:"))
  {
    id v4 = [(SignpostWorkflowResponsiveness *)self workflowEventTracker];
    [v4 handleSignpost:v5];
  }
}

- (void)handleSignpostEmitEvent:(id)a3
{
  id v5 = a3;
  if (-[SignpostWorkflowResponsiveness signpostInAllowList:](self, "signpostInAllowList:"))
  {
    id v4 = [(SignpostWorkflowResponsiveness *)self workflowEventTracker];
    [v4 handleSignpost:v5];
  }
}

- (void)handleSignpostInterval:(id)a3
{
  id v5 = a3;
  if (-[SignpostWorkflowResponsiveness signpostInAllowList:](self, "signpostInAllowList:"))
  {
    id v4 = [(SignpostWorkflowResponsiveness *)self workflowEventTracker];
    [v4 handleSignpost:v5];
  }
}

- (id)newConfiguredExtractor
{
  id v3 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
  id v4 = [(SignpostWorkflowResponsiveness *)self workflowEventTracker];
  id v5 = [v4 workflow];
  id v6 = [v5 allowListForAllSignposts];
  [v3 setSubsystemCategoryFilter:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000022CC;
  v11[3] = &unk_100010410;
  v11[4] = self;
  [v3 setIntervalCompletionProcessingBlock:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000022F0;
  v10[3] = &unk_100010438;
  v10[4] = self;
  [v3 setBeginEventProcessingBlock:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002314;
  v9[3] = &unk_100010438;
  v9[4] = self;
  [v3 setEmitEventProcessingBlock:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002338;
  v8[3] = &unk_100010460;
  v8[4] = self;
  [v3 setDeviceRebootProcessingBlock:v8];
  return v3;
}

- (WRWorkflowEventTracker)workflowEventTracker
{
  return self->_workflowEventTracker;
}

- (void).cxx_destruct
{
}

@end