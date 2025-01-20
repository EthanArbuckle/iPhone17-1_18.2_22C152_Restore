@interface WFRemoteQuarantinePolicyEvaluator
+ (WFRemoteQuarantinePolicyEvaluator)sharedEvaluator;
- (JSVirtualMachine)javaScriptVirtualMachine;
- (NSThread)javaScriptEvaluationThread;
- (NSTimer)javaScriptVirtualMachineDestructionTimer;
- (WFRemoteQuarantinePolicyEvaluator)init;
- (WFRemoteQuarantinePolicyEvaluatorDelegate)delegate;
- (__CFRunLoop)javaScriptEvaluationThreadRunLoop;
- (id)remoteQuarantineHashForWorkflowReference:(id)a3;
- (void)_evaluatePolicyForRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)evaluatePolicyForRequest:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setJavaScriptVirtualMachine:(id)a3;
@end

@implementation WFRemoteQuarantinePolicyEvaluator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javaScriptVirtualMachineDestructionTimer, 0);
  objc_storeStrong((id *)&self->_javaScriptEvaluationThread, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_javaScriptVirtualMachine, 0);
}

- (NSTimer)javaScriptVirtualMachineDestructionTimer
{
  return self->_javaScriptVirtualMachineDestructionTimer;
}

- (__CFRunLoop)javaScriptEvaluationThreadRunLoop
{
  return self->_javaScriptEvaluationThreadRunLoop;
}

- (NSThread)javaScriptEvaluationThread
{
  return self->_javaScriptEvaluationThread;
}

- (void)setDelegate:(id)a3
{
}

- (WFRemoteQuarantinePolicyEvaluatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFRemoteQuarantinePolicyEvaluatorDelegate *)WeakRetained;
}

- (void)setJavaScriptVirtualMachine:(id)a3
{
}

- (void)_evaluatePolicyForRequest:(id)a3 completion:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F29060] currentThread];
  v10 = [(WFRemoteQuarantinePolicyEvaluator *)self javaScriptEvaluationThread];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"WFRemoteQuarantinePolicyEvaluator.m" lineNumber:151 description:@"This metod should only be run on javaScriptEvaluationThread"];
  }
  v12 = [(WFRemoteQuarantinePolicyEvaluator *)self javaScriptVirtualMachine];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F30920]) initWithVirtualMachine:v12];
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke;
  aBlock[3] = &unk_1E654EF88;
  v56 = &v57;
  id v14 = v8;
  id v55 = v14;
  v15 = _Block_copy(aBlock);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_2;
  v52[3] = &unk_1E654EFB0;
  id v16 = v15;
  id v53 = v16;
  [v13 setExceptionHandler:v52];
  [v13 setObject:&__block_literal_global_196 forKeyedSubscript:@"WFLocalizedString"];
  v17 = +[WFRemoteQuarantinePolicyManager sharedManager];
  v18 = [v17 policyString];

  if (v18)
  {
    id v19 = (id)[v13 evaluateScript:v18];
    if (!*((unsigned char *)v58 + 24))
    {
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__12013;
      v50 = __Block_byref_object_dispose__12014;
      id v51 = 0;
      objc_initWeak(&location, self);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_197;
      v39[3] = &unk_1E654EFF8;
      v33 = &v44;
      objc_copyWeak(&v44, &location);
      v42 = &v46;
      v43 = &v57;
      id v20 = v16;
      id v41 = v20;
      id v21 = v7;
      id v40 = v21;
      v22 = _Block_copy(v39);
      [v13 setObject:v22 forKeyedSubscript:@"completionHandler"];

      v23 = [v21 policyFunctionName];
      v35 = [v13 objectForKeyedSubscript:v23];

      v24 = [v13 objectForKeyedSubscript:@"completionHandler"];
      id v38 = 0;
      v25 = [v21 javaScriptCoreRepresentationWithError:&v38];
      id v34 = v38;
      if (v25)
      {
        v26 = (void *)MEMORY[0x1E4F1CB00];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_207;
        v36[3] = &unk_1E654F020;
        id v37 = v20;
        uint64_t v27 = objc_msgSend(v26, "scheduledTimerWithTimeInterval:repeats:block:", 0, v36, 3.0, &v44);
        v28 = (void *)v47[5];
        v47[5] = v27;

        v61[0] = v25;
        v61[1] = v24;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
        id v30 = (id)[v35 callWithArguments:v29];
      }
      else
      {
        v31 = getWFRemoteQuarantineLogObject();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "-[WFRemoteQuarantinePolicyEvaluator _evaluatePolicyForRequest:completion:]";
          __int16 v64 = 2112;
          id v65 = v34;
          _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_ERROR, "%s Failed to generate JSC representation: %@", buf, 0x16u);
        }

        (*((void (**)(id, uint64_t, void))v20 + 2))(v20, 1, 0);
      }

      objc_destroyWeak(v33);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v46, 8);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v16 + 2))(v16, 1, 0);
  }

  _Block_object_dispose(&v57, 8);
}

uint64_t __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_197(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v32 = 0;
    v5 = +[MTLJSONAdapter modelOfClass:objc_opt_class() fromJSONDictionary:v3 error:&v32];
    id v6 = v32;
    if (v5 && [v5 policy])
    {
      if ([v5 policy] == 2)
      {
        id v7 = [v5 errorTitle];
        id v8 = v7;
        if (v7)
        {
          id v9 = v7;
        }
        else
        {
          id v9 = [*(id *)(a1 + 32) defaultLocalizedPromptTitle];
        }
        v10 = v9;

        char v11 = [v5 errorMessage];
        v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [*(id *)(a1 + 32) defaultLocalizedPromptMessage];
        }
        id v14 = v13;

        if ([v10 length] || objc_msgSend(v14, "length"))
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F5A768]);
          [v15 setTitle:v10];
          [v15 setMessage:v14];
          id v16 = (void *)MEMORY[0x1E4F5A770];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_2_202;
          v30[3] = &unk_1E6558678;
          id v31 = *(id *)(a1 + 40);
          v17 = [v16 cancelButtonWithHandler:v30];
          [v15 addButton:v17];

          v18 = (void *)MEMORY[0x1E4F5A770];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_3_204;
          v28[3] = &unk_1E6558678;
          id v29 = *(id *)(a1 + 40);
          id v19 = [v18 okButtonWithHandler:v28];
          [v15 addButton:v19];

          id v20 = [WeakRetained delegate];
          id v21 = [v20 userInterfaceToPresentAlertForEvaluator:WeakRetained];

          if (v21) {
            [v21 presentAlert:v15];
          }
          else {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          }

          goto LABEL_26;
        }
      }
      uint64_t v22 = [v5 errorTitle];
      uint64_t v23 = [v5 errorMessage];
      if (!(v22 | v23))
      {
        uint64_t v22 = [*(id *)(a1 + 32) defaultLocalizedDeniedErrorTitle];
        uint64_t v23 = [*(id *)(a1 + 32) defaultLocalizedDeniedErrorMessage];
      }
      v24 = (void *)v23;
      v25 = objc_opt_new();
      v26 = v25;
      if (v22) {
        [v25 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F28588]];
      }
      if (v24) {
        [v26 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }
      uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFRemoteQuarantineErrorDomain" code:0 userInfo:v26];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      goto LABEL_26;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_26:
  }
}

uint64_t __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_207(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_2_202(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userCancelledError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_3_204(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[WFRemoteQuarantinePolicyManager sharedManager];
  v4 = [v3 localizedString:v2];

  return v4;
}

- (id)remoteQuarantineHashForWorkflowReference:(id)a3
{
  id v3 = a3;
  v4 = getWFWorkflowExecutionLogObject();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = getWFWorkflowExecutionLogObject();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RemoteQuarantineEvaluationHashCalculation", "", buf, 2u);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F70C20]);
  id v9 = +[WFRemoteQuarantinePolicyManager sharedManager];
  id v10 = (id)objc_msgSend(v8, "combineInteger:", objc_msgSend(v9, "policyVersion"));

  uint64_t v11 = [v3 syncHash];
  id v12 = (id)[v8 combineInteger:v11];
  uint64_t v18 = [v8 finalize];
  id v13 = getWFWorkflowExecutionLogObject();
  id v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v14, OS_SIGNPOST_INTERVAL_END, v5, "RemoteQuarantineEvaluationHashCalculation", "", v17, 2u);
  }

  id v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v18 length:8];

  return v15;
}

- (void)evaluatePolicyForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)voucher_copy();
  id v9 = [(WFRemoteQuarantinePolicyEvaluator *)self javaScriptEvaluationThreadRunLoop];
  id v10 = (const void *)*MEMORY[0x1E4F1D418];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __73__WFRemoteQuarantinePolicyEvaluator_evaluatePolicyForRequest_completion___block_invoke;
  v17 = &unk_1E65586A0;
  uint64_t v18 = self;
  id v19 = v6;
  id v20 = v8;
  id v21 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = v6;
  CFRunLoopPerformBlock(v9, v10, &v14);
  CFRunLoopWakeUp([(WFRemoteQuarantinePolicyEvaluator *)self javaScriptEvaluationThreadRunLoop]);
}

void __73__WFRemoteQuarantinePolicyEvaluator_evaluatePolicyForRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1C87CA430]();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__WFRemoteQuarantinePolicyEvaluator_evaluatePolicyForRequest_completion___block_invoke_2;
  v5[3] = &unk_1E6557E58;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _evaluatePolicyForRequest:v4 completion:v5];
}

void __73__WFRemoteQuarantinePolicyEvaluator_evaluatePolicyForRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(id *)(a1 + 32);
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (JSVirtualMachine)javaScriptVirtualMachine
{
  uint64_t v4 = [MEMORY[0x1E4F29060] currentThread];
  id v5 = [(WFRemoteQuarantinePolicyEvaluator *)self javaScriptEvaluationThread];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"WFRemoteQuarantinePolicyEvaluator.m" lineNumber:101 description:@"This metod should only be run on javaScriptEvaluationThread"];
  }
  [(NSTimer *)self->_javaScriptVirtualMachineDestructionTimer invalidate];
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4F1CB00];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__WFRemoteQuarantinePolicyEvaluator_javaScriptVirtualMachine__block_invoke;
  v16[3] = &unk_1E654EF60;
  objc_copyWeak(&v17, &location);
  id v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v16 block:300.0];
  javaScriptVirtualMachineDestructionTimer = self->_javaScriptVirtualMachineDestructionTimer;
  self->_javaScriptVirtualMachineDestructionTimer = v8;

  javaScriptVirtualMachine = self->_javaScriptVirtualMachine;
  if (!javaScriptVirtualMachine)
  {
    id v11 = (JSVirtualMachine *)objc_opt_new();
    id v12 = self->_javaScriptVirtualMachine;
    self->_javaScriptVirtualMachine = v11;

    javaScriptVirtualMachine = self->_javaScriptVirtualMachine;
  }
  id v13 = javaScriptVirtualMachine;
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v13;
}

void __61__WFRemoteQuarantinePolicyEvaluator_javaScriptVirtualMachine__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setJavaScriptVirtualMachine:0];
}

- (void)dealloc
{
  CFRunLoopPerformBlock(self->_javaScriptEvaluationThreadRunLoop, (CFTypeRef)*MEMORY[0x1E4F1D418], &__block_literal_global_175);
  v3.receiver = self;
  v3.super_class = (Class)WFRemoteQuarantinePolicyEvaluator;
  [(WFRemoteQuarantinePolicyEvaluator *)&v3 dealloc];
}

void __44__WFRemoteQuarantinePolicyEvaluator_dealloc__block_invoke()
{
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (WFRemoteQuarantinePolicyEvaluator)init
{
  v17.receiver = self;
  v17.super_class = (Class)WFRemoteQuarantinePolicyEvaluator;
  id v2 = [(WFRemoteQuarantinePolicyEvaluator *)&v17 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    objc_initWeak(&location, v3);
    objc_initWeak(&from, v2);
    id v4 = objc_alloc(MEMORY[0x1E4F29060]);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __41__WFRemoteQuarantinePolicyEvaluator_init__block_invoke;
    id v12 = &unk_1E654EF38;
    objc_copyWeak(&v13, &from);
    objc_copyWeak(&v14, &location);
    uint64_t v5 = [v4 initWithBlock:&v9];
    javaScriptEvaluationThread = v2->_javaScriptEvaluationThread;
    v2->_javaScriptEvaluationThread = (NSThread *)v5;

    [(NSThread *)v2->_javaScriptEvaluationThread setName:@"WFRemoteQuarantinePolicyEvaluator JavaScript Evaluator Thread", v9, v10, v11, v12];
    [(NSThread *)v2->_javaScriptEvaluationThread start];
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    id v7 = v2;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__WFRemoteQuarantinePolicyEvaluator_init__block_invoke(uint64_t a1)
{
  Current = CFRunLoopGetCurrent();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  WeakRetained[4] = Current;
  dispatch_semaphore_signal(v4);

  memset(&v7, 0, sizeof(v7));
  uint64_t v5 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v7);
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D418];
  CFRunLoopAddSource(Current, v5, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  CFRunLoopRun();
  CFRunLoopRemoveSource(Current, v5, v6);
  CFRelease(v5);
}

+ (WFRemoteQuarantinePolicyEvaluator)sharedEvaluator
{
  if (sharedEvaluator_onceToken != -1) {
    dispatch_once(&sharedEvaluator_onceToken, &__block_literal_global_169);
  }
  id v2 = (void *)sharedEvaluator_evaluator;
  return (WFRemoteQuarantinePolicyEvaluator *)v2;
}

void __52__WFRemoteQuarantinePolicyEvaluator_sharedEvaluator__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)sharedEvaluator_evaluator;
  sharedEvaluator_evaluator = v0;
}

@end