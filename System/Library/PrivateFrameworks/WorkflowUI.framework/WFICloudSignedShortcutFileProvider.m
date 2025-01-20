@interface WFICloudSignedShortcutFileProvider
- (WFICloudSignedShortcutFileProvider)initWithWorkflow:(id)a3 userInterface:(id)a4;
- (id)shareShortcutEventForActivityType:(id)a3;
@end

@implementation WFICloudSignedShortcutFileProvider

- (id)shareShortcutEventForActivityType:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFICloudSignedShortcutFileProvider;
  v3 = [(WFWorkflowItemProvider *)&v5 shareShortcutEventForActivityType:a3];
  [v3 setSharingMode:*MEMORY[0x263F87428]];
  return v3;
}

- (WFICloudSignedShortcutFileProvider)initWithWorkflow:(id)a3 userInterface:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFICloudSignedShortcutFileProvider;
  v7 = [(WFSignedShortcutFileProvider *)&v13 initWithWorkflow:v6 userInterface:a4];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F87048]);
    v9 = objc_opt_new();
    v10 = (void *)[v8 initWithWorkflow:v6 sharingOptions:v9];
    [(WFWorkflowItemProvider *)v7 setShortcutExporter:v10];

    v11 = v7;
  }

  return v7;
}

@end