@interface WFOutOfProcessWorkflowControllerXPCProxy
- (BOOL)isSynchronous;
- (NSXPCConnection)connection;
- (WFOutOfProcessWorkflowControllerXPCProxy)initWithConnection:(id)a3 isSynchronous:(BOOL)a4;
- (WFOutOfProcessWorkflowControllerXPCProxy)proxyWithErrorHandler:(id)a3;
- (void)computeFinderResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5;
- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4;
- (void)getCurrentProgressCompletedWithCompletionHandler:(id)a3;
- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4;
- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4;
- (void)pauseWorkflowAndWriteStateToDisk:(id)a3;
- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6;
- (void)prewarmRunnerWithCompletion:(id)a3;
- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4;
- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)resumeRunningFromContext:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)runActionFromRunRequestData:(id)a3 runningContext:(id)a4 completion:(id)a5;
- (void)runToolWithInvocation:(id)a3;
- (void)runWorkflowWithDescriptor:(id)a3 request:(id)a4 inEnvironment:(id)a5 runningContext:(id)a6 completion:(id)a7;
- (void)setConnection:(id)a3;
- (void)setIsSynchronous:(BOOL)a3;
- (void)stopWithError:(id)a3;
- (void)updateRunViewSource:(id)a3;
@end

@implementation WFOutOfProcessWorkflowControllerXPCProxy

- (void).cxx_destruct
{
}

- (void)setIsSynchronous:(BOOL)a3
{
  self->_isSynchronous = a3;
}

- (BOOL)isSynchronous
{
  return self->_isSynchronous;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)updateRunViewSource:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:&__block_literal_global_59];
  [v5 updateRunViewSource:v4];
}

- (void)stopWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:&__block_literal_global_57];
  [v5 stopWithError:v4];
}

- (void)runWorkflowWithDescriptor:(id)a3 request:(id)a4 inEnvironment:(id)a5 runningContext:(id)a6 completion:(id)a7
{
  id v12 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __118__WFOutOfProcessWorkflowControllerXPCProxy_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke;
  v22[3] = &unk_1E6079C90;
  id v13 = v12;
  id v23 = v13;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __118__WFOutOfProcessWorkflowControllerXPCProxy_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_2;
  v20[3] = &unk_1E6077030;
  id v21 = v13;
  id v19 = v13;
  [v18 runWorkflowWithDescriptor:v17 request:v16 inEnvironment:v15 runningContext:v14 completion:v20];
}

uint64_t __118__WFOutOfProcessWorkflowControllerXPCProxy_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __118__WFOutOfProcessWorkflowControllerXPCProxy_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runToolWithInvocation:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:&__block_literal_global_55];
  [v5 runToolWithInvocation:v4];
}

- (void)runActionFromRunRequestData:(id)a3 runningContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__WFOutOfProcessWorkflowControllerXPCProxy_runActionFromRunRequestData_runningContext_completion___block_invoke;
  v16[3] = &unk_1E6079C90;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__WFOutOfProcessWorkflowControllerXPCProxy_runActionFromRunRequestData_runningContext_completion___block_invoke_2;
  v14[3] = &unk_1E6077030;
  id v15 = v9;
  id v13 = v9;
  [v12 runActionFromRunRequestData:v11 runningContext:v10 completion:v14];
}

uint64_t __98__WFOutOfProcessWorkflowControllerXPCProxy_runActionFromRunRequestData_runningContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98__WFOutOfProcessWorkflowControllerXPCProxy_runActionFromRunRequestData_runningContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resumeRunningFromContext:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__WFOutOfProcessWorkflowControllerXPCProxy_resumeRunningFromContext_withRequest_completion___block_invoke;
  v16[3] = &unk_1E6079C90;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__WFOutOfProcessWorkflowControllerXPCProxy_resumeRunningFromContext_withRequest_completion___block_invoke_2;
  v14[3] = &unk_1E6077030;
  id v15 = v9;
  id v13 = v9;
  [v12 resumeRunningFromContext:v11 withRequest:v10 completion:v14];
}

uint64_t __92__WFOutOfProcessWorkflowControllerXPCProxy_resumeRunningFromContext_withRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __92__WFOutOfProcessWorkflowControllerXPCProxy_resumeRunningFromContext_withRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __124__WFOutOfProcessWorkflowControllerXPCProxy_resolveDeferredValueFromEncodedStorage_forEncodedExpectedType_completionHandler___block_invoke;
  v16[3] = &unk_1E6079C90;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __124__WFOutOfProcessWorkflowControllerXPCProxy_resolveDeferredValueFromEncodedStorage_forEncodedExpectedType_completionHandler___block_invoke_2;
  v14[3] = &unk_1E6078688;
  id v15 = v9;
  id v13 = v9;
  [v12 resolveDeferredValueFromEncodedStorage:v11 forEncodedExpectedType:v10 completionHandler:v14];
}

uint64_t __124__WFOutOfProcessWorkflowControllerXPCProxy_resolveDeferredValueFromEncodedStorage_forEncodedExpectedType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __124__WFOutOfProcessWorkflowControllerXPCProxy_resolveDeferredValueFromEncodedStorage_forEncodedExpectedType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__WFOutOfProcessWorkflowControllerXPCProxy_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__WFOutOfProcessWorkflowControllerXPCProxy_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6079C90;
  id v12 = v7;
  id v10 = v7;
  [v9 reindexToolKitDatabaseWithRequest:v8 completionHandler:v11];
}

uint64_t __96__WFOutOfProcessWorkflowControllerXPCProxy_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__WFOutOfProcessWorkflowControllerXPCProxy_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prewarmRunnerWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__WFOutOfProcessWorkflowControllerXPCProxy_prewarmRunnerWithCompletion___block_invoke;
  v10[3] = &unk_1E6079C90;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__WFOutOfProcessWorkflowControllerXPCProxy_prewarmRunnerWithCompletion___block_invoke_2;
  v8[3] = &unk_1E6079C90;
  id v9 = v5;
  id v7 = v5;
  [v6 prewarmRunnerWithCompletion:v8];
}

uint64_t __72__WFOutOfProcessWorkflowControllerXPCProxy_prewarmRunnerWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__WFOutOfProcessWorkflowControllerXPCProxy_prewarmRunnerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__WFOutOfProcessWorkflowControllerXPCProxy_performQuery_inValueSet_toolInvocation_completionHandler___block_invoke;
  v19[3] = &unk_1E6079C90;
  id v11 = v10;
  id v20 = v11;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__WFOutOfProcessWorkflowControllerXPCProxy_performQuery_inValueSet_toolInvocation_completionHandler___block_invoke_2;
  v17[3] = &unk_1E6078688;
  id v18 = v11;
  id v16 = v11;
  [v15 performQuery:v14 inValueSet:v13 toolInvocation:v12 completionHandler:v17];
}

uint64_t __101__WFOutOfProcessWorkflowControllerXPCProxy_performQuery_inValueSet_toolInvocation_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__WFOutOfProcessWorkflowControllerXPCProxy_performQuery_inValueSet_toolInvocation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pauseWorkflowAndWriteStateToDisk:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:&__block_literal_global_52];
  [v5 pauseWorkflowAndWriteStateToDisk:v4];
}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__WFOutOfProcessWorkflowControllerXPCProxy_injectContentAsVariable_completionHandler___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__WFOutOfProcessWorkflowControllerXPCProxy_injectContentAsVariable_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6077008;
  id v12 = v7;
  id v10 = v7;
  [v9 injectContentAsVariable:v8 completionHandler:v11];
}

uint64_t __86__WFOutOfProcessWorkflowControllerXPCProxy_injectContentAsVariable_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86__WFOutOfProcessWorkflowControllerXPCProxy_injectContentAsVariable_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:&__block_literal_global_1410];
  [v8 handleIncomingFileForRemoteExecutionWithURL:v7 withIdentifier:v6];
}

- (void)getCurrentProgressCompletedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__WFOutOfProcessWorkflowControllerXPCProxy_getCurrentProgressCompletedWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6079C90;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__WFOutOfProcessWorkflowControllerXPCProxy_getCurrentProgressCompletedWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E6076FE0;
  id v9 = v5;
  id v7 = v5;
  [v6 getCurrentProgressCompletedWithCompletionHandler:v8];
}

uint64_t __93__WFOutOfProcessWorkflowControllerXPCProxy_getCurrentProgressCompletedWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__WFOutOfProcessWorkflowControllerXPCProxy_getCurrentProgressCompletedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__WFOutOfProcessWorkflowControllerXPCProxy_fetchToolInvocationSummaryForInvocation_completionHandler___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__WFOutOfProcessWorkflowControllerXPCProxy_fetchToolInvocationSummaryForInvocation_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6078688;
  id v12 = v7;
  id v10 = v7;
  [v9 fetchToolInvocationSummaryForInvocation:v8 completionHandler:v11];
}

uint64_t __102__WFOutOfProcessWorkflowControllerXPCProxy_fetchToolInvocationSummaryForInvocation_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__WFOutOfProcessWorkflowControllerXPCProxy_fetchToolInvocationSummaryForInvocation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__WFOutOfProcessWorkflowControllerXPCProxy_fetchDisplayValueForRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__WFOutOfProcessWorkflowControllerXPCProxy_fetchDisplayValueForRequest_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6078688;
  id v12 = v7;
  id v10 = v7;
  [v9 fetchDisplayValueForRequest:v8 completionHandler:v11];
}

uint64_t __90__WFOutOfProcessWorkflowControllerXPCProxy_fetchDisplayValueForRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__WFOutOfProcessWorkflowControllerXPCProxy_fetchDisplayValueForRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __128__WFOutOfProcessWorkflowControllerXPCProxy_extractVariableContentFromEncodedReference_forEncodedExpectedType_completionHandler___block_invoke;
  v16[3] = &unk_1E6079C90;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __128__WFOutOfProcessWorkflowControllerXPCProxy_extractVariableContentFromEncodedReference_forEncodedExpectedType_completionHandler___block_invoke_2;
  v14[3] = &unk_1E6078688;
  id v15 = v9;
  id v13 = v9;
  [v12 extractVariableContentFromEncodedReference:v11 forEncodedExpectedType:v10 completionHandler:v14];
}

uint64_t __128__WFOutOfProcessWorkflowControllerXPCProxy_extractVariableContentFromEncodedReference_forEncodedExpectedType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __128__WFOutOfProcessWorkflowControllerXPCProxy_extractVariableContentFromEncodedReference_forEncodedExpectedType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)computeFinderResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__WFOutOfProcessWorkflowControllerXPCProxy_computeFinderResizedSizesForImages_inSizes_completion___block_invoke;
  v16[3] = &unk_1E6079C90;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self proxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__WFOutOfProcessWorkflowControllerXPCProxy_computeFinderResizedSizesForImages_inSizes_completion___block_invoke_2;
  v14[3] = &unk_1E6078EC0;
  id v15 = v9;
  id v13 = v9;
  [v12 computeFinderResizedSizesForImages:v11 inSizes:v10 completion:v14];
}

uint64_t __98__WFOutOfProcessWorkflowControllerXPCProxy_computeFinderResizedSizesForImages_inSizes_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98__WFOutOfProcessWorkflowControllerXPCProxy_computeFinderResizedSizesForImages_inSizes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFOutOfProcessWorkflowControllerXPCProxy)proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self isSynchronous];
  id v6 = [(WFOutOfProcessWorkflowControllerXPCProxy *)self connection];
  id v7 = v6;
  if (v5) {
    [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else {
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v4];
  }

  return (WFOutOfProcessWorkflowControllerXPCProxy *)v8;
}

- (WFOutOfProcessWorkflowControllerXPCProxy)initWithConnection:(id)a3 isSynchronous:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFOutOfProcessWorkflowControllerXPCProxy;
  id v8 = [(WFOutOfProcessWorkflowControllerXPCProxy *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_isSynchronous = a4;
    id v10 = v9;
  }

  return v9;
}

@end