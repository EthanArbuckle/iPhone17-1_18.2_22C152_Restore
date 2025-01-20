@interface WFRunWorkflowURLHandler
+ (id)workflowWithInputParameters:(id)a3 error:(id *)a4;
+ (id)workflowWithName:(id)a3 identifier:(id)a4 error:(id *)a5;
+ (void)registerOpenWorkflowHandler:(id)a3;
+ (void)registerRunWorkflowHandler:(id)a3;
@end

@implementation WFRunWorkflowURLHandler

+ (void)registerRunWorkflowHandler:(id)a3
{
  id v4 = a3;
  v5 = +[ICManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke;
  v7[3] = &unk_1E6556428;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 registerHandler:v7 forIncomingRequestsWithAction:@"run-shortcut" legacyAction:@"run-workflow" scheme:0];
}

+ (void)registerOpenWorkflowHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFGeneralLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[WFRunWorkflowURLHandler registerOpenWorkflowHandler:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Registering the open-shortcut handler", buf, 0xCu);
  }

  id v6 = +[ICManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__WFRunWorkflowURLHandler_registerOpenWorkflowHandler___block_invoke;
  v8[3] = &unk_1E6556428;
  id v9 = v4;
  id v10 = a1;
  id v7 = v4;
  [v6 registerHandler:v8 forIncomingRequestsWithAction:@"open-shortcut" legacyAction:@"open-workflow" scheme:0];
}

+ (id)workflowWithName:(id)a3 identifier:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[WFDatabase defaultDatabase];
  id v10 = v9;
  if (!v8
    || ([v9 referenceForWorkflowID:v8], (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v7)
    {
      v11 = [v10 uniqueVisibleReferenceForWorkflowName:v7];
      if (v11) {
        goto LABEL_8;
      }
      v12 = WFLocalizedString(@"Could not find the specified shortcut.");
      uint64_t v13 = NSString;
      v14 = WFLocalizedString(@"Could not find the shortcut “%@.”");
      v15 = objc_msgSend(v13, "stringWithFormat:", v14, v7);
    }
    else
    {
      v15 = WFLocalizedString(@"Could not find the specified shortcut.");
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F281F8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = v15;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    *a5 = [v16 errorWithDomain:v17 code:4 userInfo:v18];

    v11 = 0;
  }
LABEL_8:

  return v11;
}

+ (id)workflowWithInputParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKey:@"id"];
  id v8 = [v6 objectForKey:@"name"];

  id v9 = [a1 workflowWithName:v8 identifier:v7 error:a4];

  return v9;
}

void __55__WFRunWorkflowURLHandler_registerOpenWorkflowHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getWFGeneralLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "+[WFRunWorkflowURLHandler registerOpenWorkflowHandler:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Received the open-shortcut request", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 40);
  id v6 = [v3 parameters];
  id v15 = 0;
  id v7 = [v5 workflowWithInputParameters:v6 error:&v15];
  id v8 = v15;

  if (v7)
  {
    id v9 = [v3 parameters];
    id v10 = [v9 objectForKey:@"actionIndex"];

    v11 = [v3 parameters];
    v12 = [v11 objectForKey:@"actionErrorMessage"];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v13 = getWFGeneralLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "+[WFRunWorkflowURLHandler registerOpenWorkflowHandler:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Received the open-shortcut request but failed to find the workflow to open", buf, 0xCu);
  }

  v14 = [v3 failureHandler];

  if (v14)
  {
    id v10 = [v3 failureHandler];
    ((void (**)(void, id))v10)[2](v10, v8);
    goto LABEL_9;
  }
LABEL_10:
}

void __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 parameters];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_2;
  aBlock[3] = &unk_1E6556400;
  id v5 = v4;
  id v26 = v5;
  id v6 = v3;
  id v27 = v6;
  long long v24 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v24;
  long long v28 = v24;
  id v8 = _Block_copy(aBlock);
  id v9 = [v5 objectForKey:@"input"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      (*((void (**)(void *, void, void))v8 + 2))(v8, 0, 0);
      goto LABEL_17;
    }
    id v10 = v9;
    if ([v10 isEqualToString:@"text"]
      && ([v5 objectForKey:@"text"],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      v12 = (void *)MEMORY[0x1E4F5A830];
      uint64_t v13 = (void *)MEMORY[0x1E4F5A848];
      v14 = [v5 objectForKey:@"text"];
      id v15 = [v13 itemWithObject:v14];
      v30[0] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      uint64_t v17 = [v12 collectionWithItems:v16];
      (*((void (**)(void *, void *, void))v8 + 2))(v8, v17, 0);
    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", @"clipboard", v24))
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F5A830];
        v14 = [(objc_class *)getUIPasteboardClass_59482() generalPasteboard];
        [v18 generateCollectionFromPasteboard:v14 completionHandler:v8];
LABEL_16:

        goto LABEL_17;
      }
      if ([v10 isEqualToString:@"pasteboard"]
        && ([v5 objectForKey:@"pasteboard"],
            v19 = objc_claimAutoreleasedReturnValue(),
            v19,
            v19))
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F5A830];
        Class UIPasteboardClass_59482 = getUIPasteboardClass_59482();
        v14 = [v5 objectForKey:@"pasteboard"];
        id v15 = [(objc_class *)UIPasteboardClass_59482 pasteboardWithName:v14 create:0];
        [v20 generateCollectionFromPasteboard:v15 completionHandler:v8];
      }
      else
      {
        v22 = (void *)MEMORY[0x1E4F5A830];
        v14 = [MEMORY[0x1E4F5A848] itemWithObject:v10];
        v29 = v14;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        v23 = [v22 collectionWithItems:v15];
        (*((void (**)(void *, void *, void))v8 + 2))(v8, v23, 0);
      }
    }

    goto LABEL_16;
  }
  (*((void (**)(void *, void *, void))v8 + 2))(v8, v9, 0);
LABEL_17:
}

void __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKey:@"source"];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) sourceName];
  }
  id v10 = v9;

  v11 = *(void **)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  id v21 = v6;
  uint64_t v13 = [v11 workflowWithInputParameters:v12 error:&v21];
  id v14 = v21;

  if (v13)
  {
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = [*(id *)(a1 + 40) isInternalCallbackRequest];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_3;
    v19[3] = &unk_1E65563D8;
    id v20 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, uint64_t, id, void *, void *))(v15 + 16))(v15, v13, v16, v5, v19, v10);
    uint64_t v17 = (void (**)(void, void))v20;
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v18 = [*(id *)(a1 + 40) failureHandler];

  if (v18)
  {
    uint64_t v17 = [*(id *)(a1 + 40) failureHandler];
    ((void (**)(void, id))v17)[2](v17, v14);
    goto LABEL_8;
  }
LABEL_9:
}

void __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_3(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (!v8 || (a3 & 1) != 0)
  {
    v11 = v7;
    if (!v7) {
      v11 = objc_opt_new();
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_4;
    v12[3] = &unk_1E65563B0;
    id v13 = *(id *)(a1 + 32);
    char v14 = a3;
    [v11 getStringRepresentation:v12];
    if (!v7) {
  }
    }
  else
  {
    id v9 = [*(id *)(a1 + 32) failureHandler];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) failureHandler];
      ((void (**)(void, id))v10)[2](v10, v8);
    }
  }
}

void __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 length])
  {
    id v7 = @"result";
    v8[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [*(id *)(a1 + 32) successHandler];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) successHandler];
    ((void (**)(void, void *, void))v6)[2](v6, v4, *(unsigned __int8 *)(a1 + 40));
  }
}

@end