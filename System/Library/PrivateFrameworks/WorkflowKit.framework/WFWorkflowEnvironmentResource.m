@interface WFWorkflowEnvironmentResource
+ (BOOL)mustBeAvailableForDisplay;
- (BOOL)workflowEnvironmentIsValid;
- (WFWorkflow)workflow;
- (void)refreshAvailability;
- (void)setWorkflow:(id)a3;
@end

@implementation WFWorkflowEnvironmentResource

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void).cxx_destruct
{
}

- (WFWorkflow)workflow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  return (WFWorkflow *)WeakRetained;
}

- (void)refreshAvailability
{
  BOOL v3 = [(WFWorkflowEnvironmentResource *)self workflowEnvironmentIsValid];
  [(WFResource *)self updateAvailability:v3 withError:0];
}

- (BOOL)workflowEnvironmentIsValid
{
  BOOL v3 = [(WFWorkflowEnvironmentResource *)self workflow];

  if (v3)
  {
    v4 = [(WFWorkflowEnvironmentResource *)self workflow];
    uint64_t v5 = [v4 environment];

    v6 = [(WFResource *)self definition];
    v7 = [v6 objectForKey:@"WFWorkflowEnvironment"];
    uint64_t v8 = objc_opt_class();
    v9 = WFEnforceClass(v7, v8);

    if (v9)
    {
      if ([v9 isEqualToString:@"Default"])
      {
        uint64_t v10 = 0;
LABEL_8:
        v12 = [(WFResource *)self definition];
        v13 = [v12 objectForKey:@"WFRelation"];
        uint64_t v14 = objc_opt_class();
        v15 = WFEnforceClass(v13, v14);

        if (v15)
        {
          char v16 = [v15 isEqualToString:@"!="];
          if (v5 == v10) {
            BOOL v11 = 0;
          }
          else {
            BOOL v11 = v16;
          }
        }
        else
        {
          BOOL v11 = v5 == v10;
        }

        goto LABEL_15;
      }
      if ([v9 isEqualToString:@"HomeResident"])
      {
        uint64_t v10 = 1;
        goto LABEL_8;
      }
    }
    BOOL v11 = 0;
LABEL_15:

    return v11;
  }
  return 0;
}

- (void)setWorkflow:(id)a3
{
  objc_storeWeak((id *)&self->_workflow, a3);
  [(WFResource *)self invalidateAvailability];
}

@end