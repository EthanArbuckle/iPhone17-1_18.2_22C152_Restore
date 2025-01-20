@interface WFWorkflowDatabaseRunDescriptor(Conversion)
- (id)workflowReferenceWithDatabase:()Conversion error:;
- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:;
- (void)donateRunInteractionWithDatabase:()Conversion workflowReference:completionHandler:;
@end

@implementation WFWorkflowDatabaseRunDescriptor(Conversion)

- (void)donateRunInteractionWithDatabase:()Conversion workflowReference:completionHandler:
{
  id v6 = a4;
  id v7 = a5;
  v8 = v7;
  if (v6)
  {
    v9 = (char *)[objc_alloc(MEMORY[0x1E4F30508]) _init];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F30678]) initWithWorkflowReference:v6];
    uint64_t v11 = (int)*MEMORY[0x1E4F30878];
    v12 = *(void **)&v9[v11];
    *(void *)&v9[v11] = v10;

    v13 = [v6 identifier];
    [v9 setGroupIdentifier:v13];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __116__WFWorkflowDatabaseRunDescriptor_Conversion__donateRunInteractionWithDatabase_workflowReference_completionHandler___block_invoke;
    v14[3] = &unk_1E6558AC8;
    id v15 = v6;
    id v16 = v8;
    [v9 donateInteractionWithCompletion:v14];
  }
  else
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  id v8 = a4;
  v9 = a5;
  id v19 = 0;
  uint64_t v10 = [a1 workflowReferenceWithDatabase:v8 error:&v19];
  id v11 = v19;
  v12 = v11;
  if (v10)
  {
    id v18 = v11;
    v13 = [v8 workflowRecordForDescriptor:v10 error:&v18];
    id v14 = v18;

    if (v13)
    {
      id v17 = v14;
      id v15 = [[WFWorkflow alloc] initWithRecord:v13 reference:v10 storageProvider:0 migrateIfNecessary:1 environment:a3 error:&v17];
      id v16 = v17;

      v9[2](v9, v15, v16);
      id v14 = v16;
    }
    else
    {
      v9[2](v9, 0, v14);
    }

    v12 = v14;
  }
  else
  {
    v9[2](v9, 0, v11);
  }
}

- (id)workflowReferenceWithDatabase:()Conversion error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 identifier];

  if (v7)
  {
    id v8 = [a1 identifier];
    id v7 = [v6 referenceForWorkflowID:v8];
  }
  v9 = [a1 name];

  if (v9 && !v7)
  {
    uint64_t v10 = [a1 name];
    id v7 = [v6 uniqueVisibleReferenceForWorkflowName:v10];
  }
  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    v12 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFWorkflowDatabaseRunDescriptor(Conversion) workflowReferenceWithDatabase:error:]";
      __int16 v25 = 2112;
      v26 = a1;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Couldn't find shortcut with descriptor: %@", buf, 0x16u);
    }

    if (a4)
    {
      v13 = [a1 name];

      if (v13)
      {
        id v14 = NSString;
        id v15 = WFLocalizedString(@"Unable to find a shortcut named “%@”.");
        id v16 = [a1 name];
        id v17 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);
      }
      else
      {
        id v17 = WFLocalizedString(@"Unable to find the specified shortcut.");
      }
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22 = v17;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a4 = [v18 errorWithDomain:@"WFDatabaseErrorDomain" code:3 userInfo:v19];
    }
  }

  return v7;
}

@end