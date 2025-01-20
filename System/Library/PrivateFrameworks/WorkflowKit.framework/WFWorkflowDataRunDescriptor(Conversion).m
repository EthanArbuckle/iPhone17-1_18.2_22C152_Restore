@interface WFWorkflowDataRunDescriptor(Conversion)
- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:;
@end

@implementation WFWorkflowDataRunDescriptor(Conversion)

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  v7 = a5;
  v8 = [WFWorkflowFile alloc];
  v9 = [a1 workflowData];
  id v19 = 0;
  v10 = [(WFWorkflowFile *)v8 initWithFileData:v9 name:0 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v18 = v11;
    v12 = [(WFWorkflowFile *)v10 recordRepresentationWithError:&v18];
    id v13 = v18;

    if (v12)
    {
      id v17 = v13;
      v14 = [[WFWorkflow alloc] initWithRecord:v12 reference:0 storageProvider:0 migrateIfNecessary:1 environment:a3 error:&v17];
      id v11 = v17;

      if (v14)
      {
        v15 = v14;
        id v16 = 0;
      }
      else
      {
        v15 = 0;
        id v16 = v11;
      }
      v7[2](v7, v15, v16);
    }
    else
    {
      v7[2](v7, 0, v13);
      id v11 = v13;
    }
  }
  else
  {
    v7[2](v7, 0, v11);
  }
}

@end