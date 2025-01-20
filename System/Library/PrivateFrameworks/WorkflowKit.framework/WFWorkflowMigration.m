@interface WFWorkflowMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
+ (id)migrationClassDependencies;
- (NSMutableArray)actions;
- (NSMutableDictionary)workflow;
- (NSMutableSet)warnings;
- (NSString)actionIdentifierKey;
- (NSString)actionParametersKey;
- (id)completionHandler;
- (void)enumerateActionsWithIdentifier:(id)a3 usingBlock:(id)a4;
- (void)finish;
- (void)migrateWorkflowIfNeeded:(id)a3 completion:(id)a4;
- (void)setCompletionHandler:(id)a3;
@end

@implementation WFWorkflowMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  return 0;
}

+ (id)migrationClassDependencies
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_warnings, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSMutableDictionary)workflow
{
  return self->_workflow;
}

- (void)enumerateActionsWithIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFWorkflowMigration *)self actions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__WFWorkflowMigration_enumerateActionsWithIdentifier_usingBlock___block_invoke;
  v11[3] = &unk_1E654EEF0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
}

void __65__WFWorkflowMigration_enumerateActionsWithIdentifier_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  id v6 = [*(id *)(a1 + 32) actionIdentifierKey];
  id v7 = [v12 objectForKeyedSubscript:v6];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 40)];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [*(id *)(a1 + 32) actionParametersKey];
    v11 = [v12 objectForKeyedSubscript:v10];
    (*(void (**)(uint64_t, id, void *, uint64_t))(v9 + 16))(v9, v12, v11, a4);
  }
}

- (NSString)actionParametersKey
{
  v2 = @"WFWorkflowActionParameters";
  return (NSString *)@"WFWorkflowActionParameters";
}

- (NSString)actionIdentifierKey
{
  v2 = @"WFWorkflowActionIdentifier";
  return (NSString *)@"WFWorkflowActionIdentifier";
}

- (NSMutableArray)actions
{
  v2 = [(WFWorkflowMigration *)self workflow];
  v3 = [v2 objectForKeyedSubscript:@"WFWorkflowActions"];

  return (NSMutableArray *)v3;
}

- (void)finish
{
  completionHandler = (void (**)(id, NSMutableSet *))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, self->_warnings);
  }
}

- (NSMutableSet)warnings
{
  warnings = self->_warnings;
  if (!warnings)
  {
    v4 = (NSMutableSet *)objc_opt_new();
    v5 = self->_warnings;
    self->_warnings = v4;

    warnings = self->_warnings;
  }
  return warnings;
}

- (void)migrateWorkflowIfNeeded:(id)a3 completion:(id)a4
{
  objc_storeStrong((id *)&self->_workflow, a3);
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _Block_copy(v8);

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v9;

  [(WFWorkflowMigration *)self migrateWorkflow];
}

@end