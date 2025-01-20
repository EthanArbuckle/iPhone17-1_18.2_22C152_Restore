@interface WFTestUIPresenterInterface
- (WFBackgroundShortcutRunner)backgroundRunner;
- (WFHarnessTestCase)testCase;
- (WFTestUIPresenterInterface)initWithTestCase:(id)a3 backgroundRunner:(id)a4;
- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4;
- (void)performDialogRequest:(id)a3 completionHandler:(id)a4;
- (void)performSiriRequest:(id)a3 completionHandler:(id)a4;
- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5;
@end

@implementation WFTestUIPresenterInterface

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundRunner);
  objc_storeStrong((id *)&self->_testCase, 0);
}

- (WFBackgroundShortcutRunner)backgroundRunner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundRunner);
  return (WFBackgroundShortcutRunner *)WeakRetained;
}

- (WFHarnessTestCase)testCase
{
  return self->_testCase;
}

- (void)performDialogRequest:(id)a3 completionHandler:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4FB46E0];
  id v6 = a4;
  id v7 = (id)[[v5 alloc] initWithResponseCode:4];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  v8 = [(WFTestUIPresenterInterface *)self backgroundRunner];
  v9 = [v8 dialogTransformer];
  v10 = [v9 currentAction];

  if (v10)
  {
    v11 = [v8 contextForAction:v10];
    v12 = [v8 currentTestCase];
    v13 = [v12 siriInteractions];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __67__WFTestUIPresenterInterface_performSiriRequest_completionHandler___block_invoke;
    v34[3] = &unk_1E654D080;
    id v14 = v6;
    id v35 = v14;
    id v15 = v11;
    id v36 = v15;
    v16 = objc_msgSend(v13, "if_compactMap:", v34);

    v17 = [v8 currentTestCase];
    v18 = [v17 handledSiriInteractions];
    [v18 unionSet:v16];

    if ([v16 count])
    {
      if ((unint64_t)[v16 count] < 2) {
        goto LABEL_9;
      }
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v20 = [NSString stringWithFormat:@"Test UI presenter asked to perform Siri request %@ but there were multiple matching interactions found", v14];
      v38 = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v22 = v19;
      uint64_t v23 = 7;
    }
    else
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v20 = [NSString stringWithFormat:@"Test UI presenter asked to perform Siri request %@ but there were no matching interactions found", v14];
      v40 = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      v22 = v28;
      uint64_t v23 = 6;
    }
    v29 = [v22 errorWithDomain:@"WFHarnessTestErrorDomain" code:v23 userInfo:v21];

    if (v29)
    {
      v30 = (void (**)(id, void *))[objc_alloc(MEMORY[0x1E4FB48B0]) initWithError:v29];
      v7[2](v7, v30);
LABEL_10:

      v27 = v35;
      goto LABEL_11;
    }
LABEL_9:
    v29 = [v16 anyObject];
    v31 = [v29 interaction];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __67__WFTestUIPresenterInterface_performSiriRequest_completionHandler___block_invoke_2;
    v32[3] = &unk_1E654D0A8;
    v33 = v7;
    ((void (**)(void, void *, id, void *))v31)[2](v31, v10, v14, v32);

    v30 = v33;
    goto LABEL_10;
  }
  v24 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v41 = *MEMORY[0x1E4F28568];
  v25 = [NSString stringWithFormat:@"Test UI presenter asked to perform Siri request %@ while no action is running", v6];
  v42[0] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
  id v15 = [v24 errorWithDomain:@"WFHarnessTestErrorDomain" code:5 userInfo:v26];

  v27 = (void *)[objc_alloc(MEMORY[0x1E4FB48B0]) initWithError:v15];
  v7[2](v7, v27);
LABEL_11:
}

id __67__WFTestUIPresenterInterface_performSiriRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 siriActionRequestClass];
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 selector],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 matchesContext:*(void *)(a1 + 40)],
        v4,
        v5))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __67__WFTestUIPresenterInterface_performSiriRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a3);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB48B0]);
    id v7 = [v9 errorRepresentation];
    v8 = (void *)[v6 initWithError:v7];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  }
}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [(WFTestUIPresenterInterface *)self backgroundRunner];
  v10 = [v9 dialogTransformer];
  v11 = [v10 currentAction];

  if (v11)
  {
    v12 = [v9 contextForAction:v11];
    v13 = [v9 currentTestCase];
    id v14 = [v13 interactions];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __81__WFTestUIPresenterInterface_showDialogRequest_runningContext_completionHandler___block_invoke;
    v33[3] = &unk_1E654D030;
    id v15 = v7;
    id v34 = v15;
    id v16 = v12;
    id v35 = v16;
    v17 = objc_msgSend(v14, "if_compactMap:", v33);

    v18 = [v9 currentTestCase];
    v19 = [v18 handledInteractions];
    [v19 unionSet:v17];

    if ([v17 count])
    {
      if ((unint64_t)[v17 count] < 2)
      {
        v21 = [v17 anyObject];
        v30 = [v21 interaction];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __81__WFTestUIPresenterInterface_showDialogRequest_runningContext_completionHandler___block_invoke_2;
        v31[3] = &unk_1E654D058;
        id v32 = v8;
        ((void (**)(void, void *, id, void *))v30)[2](v30, v11, v15, v31);

        v22 = v32;
        goto LABEL_9;
      }
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v21 = [NSString stringWithFormat:@"Test UI presenter asked to present dialog %@ but there were multiple matching interactions found", v15];
      uint64_t v37 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      uint64_t v23 = v20;
      uint64_t v24 = 4;
    }
    else
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      v21 = [NSString stringWithFormat:@"Test UI presenter asked to present dialog %@ but there were no matching interactions found", v15];
      uint64_t v39 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      uint64_t v23 = v28;
      uint64_t v24 = 3;
    }
    v29 = [v23 errorWithDomain:@"WFHarnessTestErrorDomain" code:v24 userInfo:v22];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v29);

LABEL_9:
    v26 = v34;
    goto LABEL_10;
  }
  v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v40 = *MEMORY[0x1E4F28568];
  id v16 = [NSString stringWithFormat:@"Test UI presenter asked to present dialog %@ while no action is running", v7];
  v41[0] = v16;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  v27 = [v25 errorWithDomain:@"WFHarnessTestErrorDomain" code:2 userInfo:v26];
  (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v27);

LABEL_10:
}

id __81__WFTestUIPresenterInterface_showDialogRequest_runningContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 dialogRequestClass];
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 selector],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 matchesContext:*(void *)(a1 + 40)],
        v4,
        v5))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __81__WFTestUIPresenterInterface_showDialogRequest_runningContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    v4 = *(void (**)(uint64_t, uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, a3, 0);
  }
  else
  {
    id v6 = [a2 errorRepresentation];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
}

- (WFTestUIPresenterInterface)initWithTestCase:(id)a3 backgroundRunner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFTestUIPresenterInterface;
  id v9 = [(WFTestUIPresenterInterface *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testCase, a3);
    objc_storeWeak((id *)&v10->_backgroundRunner, v8);
    v11 = v10;
  }

  return v10;
}

@end