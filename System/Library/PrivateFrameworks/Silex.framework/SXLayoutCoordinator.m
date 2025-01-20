@interface SXLayoutCoordinator
- (SXDOMObjectProvider)DOMObjectProvider;
- (SXDelayed)debouncer;
- (SXDocumentProviding)documentProvider;
- (SXLayoutBlueprintProvider)blueprintProvider;
- (SXLayoutCoordinator)initWithPipeline:(id)a3 integrator:(id)a4 instructionFactory:(id)a5 invalidationManager:(id)a6 blueprintProvider:(id)a7 DOMObjectProvider:(id)a8 layoutParametersManager:(id)a9 documentProvider:(id)a10 layoutPolicyManager:(id)a11;
- (SXLayoutCoordinatorDelegate)delegate;
- (SXLayoutInstructionFactory)instructionFactory;
- (SXLayoutIntegrator)integrator;
- (SXLayoutInvalidationManager)invalidationManager;
- (SXLayoutOptions)layoutOptions;
- (SXLayoutParametersManager)layoutParametersManager;
- (SXLayoutPipeline)pipeline;
- (SXLayoutPolicyManager)layoutPolicyManager;
- (id)taskWithOptions:(id)a3 layoutBlueprint:(id)a4 instructions:(id)a5;
- (void)layoutInvalidationManager:(id)a3 didInvalidateBlueprint:(id)a4;
- (void)layoutPipeline:(id)a3 finishedTask:(id)a4 withResult:(id)a5;
- (void)layoutWithOptions:(id)a3;
- (void)setDebouncer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)startTask:(id)a3;
@end

@implementation SXLayoutCoordinator

- (SXLayoutCoordinator)initWithPipeline:(id)a3 integrator:(id)a4 instructionFactory:(id)a5 invalidationManager:(id)a6 blueprintProvider:(id)a7 DOMObjectProvider:(id)a8 layoutParametersManager:(id)a9 documentProvider:(id)a10 layoutPolicyManager:(id)a11
{
  id v29 = a3;
  id v27 = a4;
  id v26 = a5;
  id v28 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)SXLayoutCoordinator;
  v19 = [(SXLayoutCoordinator *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_pipeline, a3);
    objc_storeStrong((id *)&v20->_integrator, a4);
    objc_storeStrong((id *)&v20->_instructionFactory, a5);
    objc_storeStrong((id *)&v20->_invalidationManager, a6);
    objc_storeStrong((id *)&v20->_blueprintProvider, a7);
    objc_storeStrong((id *)&v20->_DOMObjectProvider, a8);
    objc_storeStrong((id *)&v20->_layoutParametersManager, a9);
    objc_storeStrong((id *)&v20->_documentProvider, a10);
    objc_storeStrong((id *)&v20->_layoutPolicyManager, a11);
    [v29 setDelegate:v20];
    [v28 setDelegate:v20];
  }

  return v20;
}

- (void)layoutWithOptions:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222AC5000, v6, OS_LOG_TYPE_DEFAULT, "Received request for new layout", buf, 2u);
  }
  v7 = [(SXLayoutCoordinator *)self layoutOptions];
  int v8 = [v7 isEqual:v5];

  if (v8)
  {
    uint64_t v9 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v41 = v5;
      v10 = "Ignored layout request because options are identical to a previous request, options=%{public}@";
      v11 = v9;
LABEL_6:
      _os_log_impl(&dword_222AC5000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_50;
    }
    goto LABEL_50;
  }
  v12 = [(SXLayoutCoordinator *)self blueprintProvider];
  v13 = [v12 blueprint];
  v14 = [v13 layoutOptions];
  int v15 = [v14 isEqual:v5];

  if (v15)
  {
    v16 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v41 = v5;
      _os_log_impl(&dword_222AC5000, v16, OS_LOG_TYPE_DEFAULT, "Ignored layout request; options are identical to integrated layout blueprint, options=%{public}@",
        buf,
        0xCu);
    }
    v17 = [(SXLayoutCoordinator *)self pipeline];
    [v17 cancelTasks];

    id v18 = [(SXLayoutCoordinator *)self layoutOptions];
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    v19 = [(SXLayoutCoordinator *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      v21 = [(SXLayoutCoordinator *)self delegate];
      [v21 layoutCoordinator:self cancelledLayoutWithOptions:v18];
    }
    goto LABEL_50;
  }
  id v22 = [(SXLayoutCoordinator *)self layoutOptions];
  uint64_t v23 = [v5 diffWithLayoutOptions:v22];

  id v24 = (id)SXLayoutLog;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"<SXLayoutOptionsDiff: "];
    id v26 = v25;
    if (v23)
    {
      if (v23 == 0xFFFF)
      {
        id v27 = @"All";
      }
      else
      {
        if (v23) {
          [v25 appendString:@"ColumnLayout; "];
        }
        if ((v23 & 2) != 0) {
          [v26 appendString:@"ViewportSize; "];
        }
        if ((v23 & 4) != 0) {
          [v26 appendString:@"ContentSizeCategory; "];
        }
        if ((v23 & 8) != 0) {
          [v26 appendString:@"BundleSubscriptionStatus; "];
        }
        if ((v23 & 0x10) != 0) {
          [v26 appendString:@"ChannelSubscriptionStatus; "];
        }
        if ((v23 & 0x20) != 0) {
          [v26 appendString:@"ViewingLocation; "];
        }
        if ((v23 & 0x40) != 0) {
          [v26 appendString:@"Testing; "];
        }
        if ((v23 & 0x80) != 0) {
          [v26 appendString:@"ContentScaleFactor; "];
        }
        if ((v23 & 0x100) != 0) {
          [v26 appendString:@"PreferredColorScheme; "];
        }
        if ((v23 & 0x200) != 0) {
          [v26 appendString:@"HorizontalSizeClass; "];
        }
        if ((v23 & 0x400) != 0) {
          [v26 appendString:@"VerticalSizeClass; "];
        }
        if ((v23 & 0x800) == 0) {
          goto LABEL_43;
        }
        id v27 = @"NewsletterSubscriptionStatus; ";
      }
    }
    else
    {
      id v27 = @"Equal";
    }
    [v26 appendString:v27];
LABEL_43:
    [v26 appendString:@">"];
    *(_DWORD *)buf = 138543618;
    id v41 = v26;
    __int16 v42 = 2114;
    id v43 = v5;
    _os_log_impl(&dword_222AC5000, v24, OS_LOG_TYPE_DEFAULT, "Assessing layout request; layout diff=%{public}@, options=%{public}@",
      buf,
      0x16u);
  }
  id v28 = [(SXLayoutCoordinator *)self layoutPolicyManager];
  int v29 = [v28 shouldPerformLayoutWithLayoutOptionsDiff:v23];

  objc_super v30 = SXLayoutLog;
  BOOL v31 = os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT);
  if (!v29)
  {
    if (!v31) {
      goto LABEL_50;
    }
    *(_DWORD *)buf = 138543362;
    id v41 = v5;
    v10 = "Ignored layout request; layout policy did not require layout, options=%{public}@";
    v11 = v30;
    goto LABEL_6;
  }
  if (v31)
  {
    *(_DWORD *)buf = 138543362;
    id v41 = v5;
    _os_log_impl(&dword_222AC5000, v30, OS_LOG_TYPE_DEFAULT, "Creating layout task; layout policy requires a layout, options=%{public}@",
      buf,
      0xCu);
  }
  objc_storeStrong((id *)&self->_layoutOptions, a3);
  v32 = [(SXLayoutCoordinator *)self debouncer];
  [v32 cancel];

  objc_initWeak((id *)buf, self);
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 3221225472;
  v36 = __41__SXLayoutCoordinator_layoutWithOptions___block_invoke;
  v37 = &unk_264652AC8;
  objc_copyWeak(&v39, (id *)buf);
  id v38 = v5;
  v33 = +[SXDelayed execute:&v34 delay:0.0];
  -[SXLayoutCoordinator setDebouncer:](self, "setDebouncer:", v33, v34, v35, v36, v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);
LABEL_50:
}

void __41__SXLayoutCoordinator_layoutWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v7 = WeakRetained;
    v4 = [WeakRetained instructionFactory];
    id v5 = [v4 createInstructions];
    v6 = [v7 taskWithOptions:v3 layoutBlueprint:0 instructions:v5];

    [v7 startTask:v6];
    [v7 setDebouncer:0];

    id WeakRetained = v7;
  }
}

- (void)layoutPipeline:(id)a3 finishedTask:(id)a4 withResult:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFTimeInterval v11 = CACurrentMediaTime();
  v12 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = [v9 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v14;
    __int16 v45 = 2112;
    id v46 = v10;
    _os_log_impl(&dword_222AC5000, v13, OS_LOG_TYPE_DEFAULT, "Received layout result, task-identifier=%{public}@, result=%@", buf, 0x16u);
  }
  int v15 = [(SXLayoutCoordinator *)self layoutOptions];
  v16 = [v9 options];
  int v17 = [v15 isEqual:v16];

  if (v17)
  {
    id v18 = [(SXLayoutCoordinator *)self DOMObjectProvider];
    v19 = [v10 DOM];
    [v18 setDOM:v19];

    char v20 = [(SXLayoutCoordinator *)self blueprintProvider];
    uint64_t v21 = [v10 blueprint];
    [v20 updateBlueprint:v21];

    id v22 = [(SXLayoutCoordinator *)self layoutParametersManager];
    [v22 layoutFinishedForTask:v9 result:v10];

    uint64_t v23 = [(SXLayoutCoordinator *)self delegate];
    LOBYTE(v21) = objc_opt_respondsToSelector();

    if (v21)
    {
      id v24 = [(SXLayoutCoordinator *)self delegate];
      id v25 = [v10 blueprint];
      [v24 layoutCoordinator:self willIntegrateBlueprint:v25];
    }
    objc_initWeak(&location, self);
    id v26 = [(SXLayoutCoordinator *)self integrator];
    uint64_t v27 = [v10 blueprint];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __62__SXLayoutCoordinator_layoutPipeline_finishedTask_withResult___block_invoke;
    v38[3] = &unk_264653680;
    objc_copyWeak(v41, &location);
    v41[1] = *(id *)&v11;
    id v28 = v9;
    id v39 = v28;
    id v29 = v10;
    id v40 = v29;
    [v26 integrateBlueprint:v27 withCompletion:v38];

    objc_super v30 = [v29 blueprint];
    LOBYTE(v27) = [v30 isComplete];

    if ((v27 & 1) == 0)
    {
      BOOL v31 = SXLayoutLog;
      if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222AC5000, v31, OS_LOG_TYPE_DEFAULT, "Starting new layout because blueprint is incomplete", buf, 2u);
      }
      v32 = [[SXRepeatedLayoutTask alloc] initWithTask:v28 result:v29];
      if ([(SXRepeatedLayoutTask *)v32 repeatCount] > 1)
      {
        v36 = (id)SXLayoutLog;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = [v28 identifier];
          -[SXLayoutCoordinator layoutPipeline:finishedTask:withResult:](v37, buf, v36);
        }
      }
      else
      {
        [(SXLayoutCoordinator *)self startTask:v32];
      }
    }
    objc_destroyWeak(v41);
    objc_destroyWeak(&location);
  }
  else
  {
    v33 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = v33;
      uint64_t v35 = [v9 identifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v35;
      _os_log_impl(&dword_222AC5000, v34, OS_LOG_TYPE_DEFAULT, "Dropped result of layout because options are no longer valid, task-identifier=%{public}@", buf, 0xCu);
    }
  }
}

void __62__SXLayoutCoordinator_layoutPipeline_finishedTask_withResult___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    CFTimeInterval v5 = (CACurrentMediaTime() - *(double *)(a1 + 56)) * 1000.0;
    double v6 = CACurrentMediaTime();
    [*(id *)(a1 + 32) startTime];
    double v8 = (v6 - v7) * 1000.0;
    id v9 = [*(id *)(a1 + 32) identifier];
    int v14 = 134218498;
    CFTimeInterval v15 = v5;
    __int16 v16 = 2048;
    double v17 = v8;
    __int16 v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_222AC5000, v4, OS_LOG_TYPE_DEFAULT, "Integrated layout blueprint in %fms, total-duration=%fms, task-identifier=%{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v10 = [WeakRetained delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [WeakRetained delegate];
    v13 = [*(id *)(a1 + 40) blueprint];
    [v12 layoutCoordinator:WeakRetained didIntegrateBlueprint:v13];
  }
}

- (void)layoutInvalidationManager:(id)a3 didInvalidateBlueprint:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    v16[0] = 67109120;
    v16[1] = [v7 isComplete];
    _os_log_impl(&dword_222AC5000, v9, OS_LOG_TYPE_DEFAULT, "Received invalidated blueprint, requesting new layout; layoutIsComplete=%d",
      (uint8_t *)v16,
      8u);
  }
  id v10 = [v7 layoutOptions];
  char v11 = [(SXLayoutCoordinator *)self layoutOptions];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    v13 = [v7 layoutOptions];
    int v14 = [(SXLayoutCoordinator *)self taskWithOptions:v13 layoutBlueprint:v7 instructions:MEMORY[0x263EFFA68]];

    [(SXLayoutCoordinator *)self startTask:v14];
  }
  else
  {
    CFTimeInterval v15 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_222AC5000, v15, OS_LOG_TYPE_DEFAULT, "Invalidated blueprint doesn't match the current layout options", (uint8_t *)v16, 2u);
    }
  }
}

- (void)startTask:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 type] != 1) {
    goto LABEL_3;
  }
  CFTimeInterval v5 = [v4 blueprint];
  id v6 = [v5 layoutOptions];
  id v7 = [v4 options];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v23 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_ERROR)) {
      -[SXLayoutCoordinator startTask:](v23);
    }
  }
  else
  {
LABEL_3:
    id v9 = [(SXLayoutCoordinator *)self documentProvider];
    id v10 = [v9 document];

    char v11 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v11;
      v13 = [v10 identifier];
      int v14 = [v4 identifier];
      int v24 = 138543874;
      id v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = self;
      __int16 v28 = 2114;
      id v29 = v14;
      _os_log_impl(&dword_222AC5000, v12, OS_LOG_TYPE_DEFAULT, "Scheduling new layout task, document-identifier=%{public}@, coordinator=%p, task-identifier=%{public}@", (uint8_t *)&v24, 0x20u);
    }
    CFTimeInterval v15 = [(SXLayoutCoordinator *)self layoutParametersManager];
    uint64_t v16 = [(SXLayoutCoordinator *)self blueprintProvider];
    uint64_t v17 = [(id)v16 blueprint];
    __int16 v18 = [v17 layoutOptions];
    v19 = [v15 layoutParametersForTask:v4 previousLayoutOptions:v18];

    uint64_t v20 = [(SXLayoutCoordinator *)self delegate];
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if (v16)
    {
      uint64_t v21 = [(SXLayoutCoordinator *)self delegate];
      [v21 layoutCoordinator:self willLayoutWithParameters:v19];
    }
    id v22 = [(SXLayoutCoordinator *)self pipeline];
    [v22 layoutWithTask:v4];
  }
}

- (id)taskWithOptions:(id)a3 layoutBlueprint:(id)a4 instructions:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v10 count])
  {
    char v11 = +[SXDefaultLayoutInstruction instruction];
    v21[0] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];

    id v10 = (id)v12;
  }
  if ([v10 count])
  {
    v13 = [[SXLayoutInstructions alloc] initWithInstructions:v10];
  }
  else
  {
    v13 = +[SXLayoutInstructions defaultInstructions];
  }
  int v14 = v13;
  CFTimeInterval v15 = [SXLayoutTask alloc];
  uint64_t v16 = v15;
  if (v9)
  {
    uint64_t v17 = [(SXLayoutCoordinator *)self DOMObjectProvider];
    __int16 v18 = [v17 DOM];
    v19 = [(SXLayoutTask *)v16 initWithOptions:v8 instructions:v14 blueprint:v9 DOM:v18];
  }
  else
  {
    v19 = [(SXLayoutTask *)v15 initWithOptions:v8 instructions:v14];
  }

  return v19;
}

- (SXLayoutCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SXLayoutCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXLayoutPipeline)pipeline
{
  return self->_pipeline;
}

- (SXLayoutIntegrator)integrator
{
  return self->_integrator;
}

- (SXLayoutInstructionFactory)instructionFactory
{
  return self->_instructionFactory;
}

- (SXLayoutInvalidationManager)invalidationManager
{
  return self->_invalidationManager;
}

- (SXLayoutBlueprintProvider)blueprintProvider
{
  return self->_blueprintProvider;
}

- (SXDOMObjectProvider)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXLayoutParametersManager)layoutParametersManager
{
  return self->_layoutParametersManager;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXLayoutPolicyManager)layoutPolicyManager
{
  return self->_layoutPolicyManager;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
}

- (SXDelayed)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_layoutPolicyManager, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_layoutParametersManager, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_blueprintProvider, 0);
  objc_storeStrong((id *)&self->_invalidationManager, 0);
  objc_storeStrong((id *)&self->_instructionFactory, 0);
  objc_storeStrong((id *)&self->_integrator, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)layoutPipeline:(void *)a1 finishedTask:(uint8_t *)buf withResult:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_222AC5000, log, OS_LOG_TYPE_ERROR, "Loop detected, unable to complete layout, task-identifier=%{public}@", buf, 0xCu);
}

- (void)startTask:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222AC5000, log, OS_LOG_TYPE_ERROR, "Attempted to start a layout with an existing blueprint with invalid layout options", v1, 2u);
}

@end