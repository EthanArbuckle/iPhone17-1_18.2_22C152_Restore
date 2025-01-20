@interface WFINShortcutRunDescriptor(Conversion)
- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:;
- (void)donateRunInteractionWithDatabase:()Conversion workflowReference:completionHandler:;
@end

@implementation WFINShortcutRunDescriptor(Conversion)

- (void)donateRunInteractionWithDatabase:()Conversion workflowReference:completionHandler:
{
  id v6 = a5;
  v7 = [a1 shortcut];
  v8 = [v7 intent];

  if (v8)
  {
    v9 = (char *)[objc_alloc(MEMORY[0x1E4F30508]) _init];
    objc_storeStrong((id *)&v9[*MEMORY[0x1E4F30878]], v8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __110__WFINShortcutRunDescriptor_Conversion__donateRunInteractionWithDatabase_workflowReference_completionHandler___block_invoke;
    v10[3] = &unk_1E6558AC8;
    id v11 = v8;
    id v12 = v6;
    [v9 donateInteractionWithCompletion:v10];
  }
}

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v7 = a5;
  v8 = [a1 shortcut];
  v9 = +[WFActionRegistry sharedRegistry];
  id v24 = 0;
  v10 = [v9 createActionWithShortcut:v8 error:&v24];
  id v11 = v24;

  if (v10)
  {
    id v12 = [WFWorkflow alloc];
    v13 = objc_opt_new();
    id v23 = 0;
    v14 = [(WFWorkflow *)v12 initWithRecord:v13 reference:0 storageProvider:0 migrateIfNecessary:0 environment:a3 error:&v23];
    id v15 = v23;

    if (!v14)
    {
      v7[2](v7, 0, v15);
LABEL_13:

      goto LABEL_14;
    }
    [(WFWorkflow *)v14 addAction:v10];
    v16 = [v8 userActivity];

    if (v16)
    {
      v17 = [v8 userActivity];
      v18 = [v17 title];
    }
    else
    {
      v20 = [v8 intent];

      if (!v20)
      {
LABEL_12:
        ((void (**)(id, WFWorkflow *, id))v7)[2](v7, v14, 0);
        goto LABEL_13;
      }
      v17 = [v8 intent];
      v18 = [v17 _title];
    }
    v21 = v18;
    v22 = (void *)[v18 copy];
    [(WFWorkflow *)v14 setName:v22];

    goto LABEL_12;
  }
  v19 = getWFGeneralLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[WFINShortcutRunDescriptor(Conversion) createWorkflowWithEnvironment:database:completionHandler:]";
    __int16 v27 = 2112;
    v28 = v8;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_ERROR, "%s Unable to create action from INShortcut: %@, error: %@", buf, 0x20u);
  }

  v7[2](v7, 0, v11);
LABEL_14:
}

@end