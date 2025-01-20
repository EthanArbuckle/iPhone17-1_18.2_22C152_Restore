@interface INRunWorkflowIntent(Workflow)
- (id)workflowForIntentInDatabase:()Workflow;
- (uint64_t)initWithWorkflowReference:()Workflow;
- (uint64_t)initWithWorkflowReference:()Workflow includeIcon:;
- (void)initWithWorkflowReference:()Workflow includeIcon:iconDrawerContext:;
- (void)setIconForAssociatedApplicationInWorkflow:()Workflow;
@end

@implementation INRunWorkflowIntent(Workflow)

- (void)setIconForAssociatedApplicationInWorkflow:()Workflow
{
  v4 = (void *)MEMORY[0x1E4FB4770];
  v5 = [a3 associatedAppBundleIdentifier];
  id v9 = [v4 applicationIconImageForBundleIdentifier:v5 format:2];

  v6 = (void *)MEMORY[0x1E4F304C0];
  v7 = [v9 PNGRepresentation];
  v8 = [v6 imageWithImageData:v7];

  [a1 setImage:v8 forParameterNamed:@"workflow"];
}

- (id)workflowForIntentInDatabase:()Workflow
{
  id v4 = a3;
  v5 = [a1 workflow];
  v6 = [v5 spokenPhrase];

  v7 = [a1 workflow];
  v8 = [v7 vocabularyIdentifier];

  if (![v8 length]
    || ([v4 referenceForWorkflowID:v8], (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v6 length])
    {
      id v9 = [v4 uniqueVisibleReferenceForWorkflowName:v6];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (void)initWithWorkflowReference:()Workflow includeIcon:iconDrawerContext:
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"WFWorkflowReference+Intents.m", 31, @"Invalid parameter not satisfying: %@", @"workflow" object file lineNumber description];
  }
  v11 = [v9 speakableString];
  v12 = (void *)[a1 initWithWorkflow:v11];

  if (v12)
  {
    [v12 _setLaunchId:*MEMORY[0x1E4FB4BE8]];
    v13 = [v9 name];
    [v12 setSuggestedInvocationPhrase:v13];

    if (a4)
    {
      v14 = [v9 associatedAppBundleIdentifier];
      uint64_t v15 = [v14 length];

      if (!v15) {
        goto LABEL_14;
      }
      v16 = [v9 associatedAppBundleIdentifier];
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithBundleIdentifier:v16];
      if ([v17 isInstalled])
      {
        v18 = v17;
      }
      else
      {
        v19 = [MEMORY[0x1E4F302D0] sharedResolver];
        v18 = [v19 resolvedAppMatchingDescriptor:v17];

        if ([v18 isInstalled])
        {
          uint64_t v20 = [v18 bundleIdentifier];

          v16 = (void *)v20;
        }
      }
      v21 = [MEMORY[0x1E4FB4770] applicationIconImageForBundleIdentifier:v16 format:2];
      v22 = [v21 PNGRepresentation];
      if (v22)
      {
        v23 = [MEMORY[0x1E4F304C0] imageWithImageData:v22];
      }
      else
      {
        v23 = 0;
      }

      if (!v23)
      {
LABEL_14:
        id v24 = objc_alloc(MEMORY[0x1E4FB4A58]);
        v25 = [v9 icon];
        v26 = (void *)[v24 initWithIcon:v25 drawerContext:v10];

        [v26 setCornerRadius:8.0];
        v27 = (void *)MEMORY[0x1E4F304C0];
        v28 = objc_msgSend(v26, "imageWithSize:", 60.0, 60.0);
        v29 = [v28 PNGRepresentation];
        v23 = [v27 imageWithImageData:v29];
      }
      [v12 setImage:v23 forParameterNamed:@"workflow"];
    }
    id v30 = v12;
  }

  return v12;
}

- (uint64_t)initWithWorkflowReference:()Workflow includeIcon:
{
  return [a1 initWithWorkflowReference:a3 includeIcon:a4 iconDrawerContext:0];
}

- (uint64_t)initWithWorkflowReference:()Workflow
{
  return [a1 initWithWorkflowReference:a3 includeIcon:1];
}

@end