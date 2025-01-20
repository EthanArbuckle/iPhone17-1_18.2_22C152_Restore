@interface WFHandoffSimulator
+ (id)URLForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4;
+ (id)URLForSimulatingHandoffWithActivityType:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 fromSource:(id)a6;
+ (id)temporaryFileURLBySerializingUserInfo:(id)a3;
+ (id)userActivityForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4;
+ (void)deserializeUserInfoAtURL:(id)a3 completionHandler:(id)a4;
+ (void)getStateForContinuingWorkflowFromUserActivityUserInfo:(id)a3 completionHandler:(id)a4;
+ (void)registerHandoffURLRequestHandler:(id)a3;
@end

@implementation WFHandoffSimulator

+ (void)getStateForContinuingWorkflowFromUserActivityUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  uint64_t v8 = [v6 objectForKey:*MEMORY[0x1E4F5AB70]];
  v9 = (void *)v8;
  v10 = (void *)*MEMORY[0x1E4FB4F10];
  if (v8) {
    v10 = (void *)v8;
  }
  id v11 = v10;

  v12 = [v6 objectForKey:*MEMORY[0x1E4F5AB80]];
  uint64_t v13 = [v6 objectForKey:*MEMORY[0x1E4F5AB78]];
  v14 = (void *)v13;
  if (v12)
  {
    v7[2](v7, v12, v11);
  }
  else if (v13)
  {
    v15 = (void *)MEMORY[0x1E4F28DC0];
    v16 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __94__WFHandoffSimulator_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler___block_invoke;
    v23[3] = &unk_1E654E480;
    v25 = v7;
    id v24 = v11;
    id v17 = (id)objc_msgSend(v15, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v14, v16, v23);
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = [v6 objectForKey:@"userInfoURL"];
    v20 = [v18 URLWithString:v19];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__WFHandoffSimulator_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler___block_invoke_2;
    v21[3] = &unk_1E654E4A8;
    v22 = v7;
    [a1 deserializeUserInfoAtURL:v20 completionHandler:v21];
  }
}

uint64_t __94__WFHandoffSimulator_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

void __94__WFHandoffSimulator_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F5AB70];
  id v4 = a2;
  uint64_t v5 = [v4 objectForKey:v3];
  id v6 = (void *)v5;
  v7 = (void *)*MEMORY[0x1E4FB4F10];
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = [v4 objectForKey:*MEMORY[0x1E4F5AB80]];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)userActivityForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F5AB70];
  v18[0] = *MEMORY[0x1E4F5AB80];
  v18[1] = v8;
  v19[0] = v6;
  v19[1] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v10 = [a1 temporaryFileURLBySerializingUserInfo:v9];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F22488]);
    v12 = (void *)[v11 initWithActivityType:*MEMORY[0x1E4F5AB68]];
    v16 = @"userInfoURL";
    uint64_t v13 = [v10 absoluteString];
    id v17 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v12 setUserInfo:v14];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)deserializeUserInfoAtURL:(id)a3 completionHandler:(id)a4
{
  id v22 = a3;
  uint64_t v5 = (void (**)(id, void))a4;
  if ([v22 isFileURL]
    && ([MEMORY[0x1E4F5AA28] sharedAppGroupDirectoryURL],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_msgSend(v22, "wf_isContainedByDirectoryAtURL:", v6),
        v6,
        (v7 & 1) != 0))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F5A900];
    id v9 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44488]];
    v10 = [v8 fileWithURL:v22 options:1 ofType:v9];

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v18 = (void *)[v17 mutableCopy];

    [v18 addObject:objc_opt_class()];
    [v18 addObject:objc_opt_class()];
    v19 = (void *)MEMORY[0x1E4F28DC0];
    v20 = [v10 mappedData];
    id v21 = (id)objc_msgSend(v19, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v20, v18, v5);
  }
  else
  {
    v5[2](v5, 0);
  }
}

+ (id)temporaryFileURLBySerializingUserInfo:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", a3, 1);
  id v4 = [MEMORY[0x1E4F5AA28] proposedSharedTemporaryFileURLForFilename:@"URLHandoffUserInfo.plist"];
  uint64_t v5 = [v4 URLByDeletingLastPathComponent];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v16 = 0;
    [v10 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v9 = v16;
  }
  id v15 = v9;
  int v11 = [v3 writeToURL:v4 options:0 error:&v15];
  id v12 = v15;

  id v13 = 0;
  if (v11) {
    id v13 = v4;
  }

  return v13;
}

+ (id)URLForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || !v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFHandoffSimulator.m", 70, @"Invalid parameter not satisfying: %@", @"state && handoffSource" object file lineNumber description];
  }
  uint64_t v10 = *MEMORY[0x1E4F5AB70];
  v15[0] = *MEMORY[0x1E4F5AB80];
  v15[1] = v10;
  v16[0] = v7;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v12 = [a1 URLForSimulatingHandoffWithActivityType:*MEMORY[0x1E4F5AB68] userInfo:v11 webpageURL:0 fromSource:v9];

  return v12;
}

+ (id)URLForSimulatingHandoffWithActivityType:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 fromSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  if (!v12 || !v14)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"WFHandoffSimulator.m", 41, @"Invalid parameter not satisfying: %@", @"userInfo && handoffSource" object file lineNumber description];
  }
  int v16 = [v11 isEqualToString:*MEMORY[0x1E4F28AC0]];
  if (v13 && v16)
  {
    id v17 = v13;
    goto LABEL_13;
  }
  v18 = objc_opt_new();
  v19 = [MEMORY[0x1E4F290C8] queryItemWithName:@"type" value:v11];
  [v18 addObject:v19];

  if (!v12) {
    goto LABEL_9;
  }
  v20 = [a1 temporaryFileURLBySerializingUserInfo:v12];
  id v17 = v20;
  if (v20)
  {
    id v21 = (void *)MEMORY[0x1E4F290C8];
    id v22 = [v20 absoluteString];
    v23 = [v21 queryItemWithName:@"userInfoURL" value:v22];
    [v18 addObject:v23];

LABEL_9:
    if (v13)
    {
      id v24 = (void *)MEMORY[0x1E4F290C8];
      v25 = [v13 absoluteString];
      v26 = [v24 queryItemWithName:@"webpageURL" value:v25];
      [v18 addObject:v26];
    }
    v27 = objc_opt_new();
    [v27 setScheme:*MEMORY[0x1E4F5AC10]];
    [v27 setHost:@"continue-user-activity"];
    [v27 setQueryItems:v18];
    id v17 = [v27 URL];
  }
LABEL_13:

  return v17;
}

+ (void)registerHandoffURLRequestHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFHandoffSimulator.m", 27, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  id v6 = +[ICManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__WFHandoffSimulator_registerHandoffURLRequestHandler___block_invoke;
  v9[3] = &unk_1E6556428;
  id v10 = v5;
  id v11 = a1;
  id v7 = v5;
  [v6 registerHandler:v9 forIncomingRequestsWithAction:@"continue-user-activity" scheme:0];
}

void __55__WFHandoffSimulator_registerHandoffURLRequestHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 parameters];
  id v4 = [v3 objectForKey:@"type"];
  id v5 = [v3 objectForKey:@"webpageURL"];
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = [v3 objectForKey:@"userInfoURL"];
  id v8 = [v6 URLWithString:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__WFHandoffSimulator_registerHandoffURLRequestHandler___block_invoke_2;
  v13[3] = &unk_1E654E458;
  id v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v15 = v5;
  id v16 = v10;
  id v14 = v4;
  id v11 = v5;
  id v12 = v4;
  [v9 deserializeUserInfoAtURL:v8 completionHandler:v13];
}

uint64_t __55__WFHandoffSimulator_registerHandoffURLRequestHandler___block_invoke_2(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

@end