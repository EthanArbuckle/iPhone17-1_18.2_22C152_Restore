@interface SBSInCallPresentationRequest
+ (id)identifiersForRequestedPresentations;
+ (void)notePresentationEndForRequestWithIdentifier:(id)a3;
+ (void)performPresentationWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation SBSInCallPresentationRequest

+ (id)identifiersForRequestedPresentations
{
  BSDispatchQueueAssertMain();
  v2 = (void *)SBSInCallIdentifiersForRequestedPresentations;
  return v2;
}

+ (void)notePresentationEndForRequestWithIdentifier:(id)a3
{
  id v3 = a3;
  BSDispatchQueueAssertMain();
  [(id)SBSInCallIdentifiersForRequestedPresentations removeObject:v3];

  if (![(id)SBSInCallIdentifiersForRequestedPresentations count])
  {
    v4 = (void *)SBSInCallIdentifiersForRequestedPresentations;
    SBSInCallIdentifiersForRequestedPresentations = 0;
  }
}

+ (void)performPresentationWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = SBLogInCallPresentation();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v6;
    _os_log_impl(&dword_18FBC5000, v8, OS_LOG_TYPE_DEFAULT, "performPresentationWithConfiguration: %{public}@", buf, 0xCu);
  }

  v9 = (void *)SBSInCallIdentifiersForRequestedPresentations;
  if (!SBSInCallIdentifiersForRequestedPresentations)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    v11 = (void *)SBSInCallIdentifiersForRequestedPresentations;
    SBSInCallIdentifiersForRequestedPresentations = v10;

    v9 = (void *)SBSInCallIdentifiersForRequestedPresentations;
  }
  v12 = [v6 identifier];
  [v9 addObject:v12];

  v13 = (void *)MEMORY[0x1E4F50BB8];
  v14 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  v15 = +[SBSInCallPresentationServiceInterfaceSpecification identifier];
  v16 = [v13 endpointForMachName:v14 service:v15 instance:0];

  v17 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v16];
  v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v19 = dispatch_queue_create("com.apple.SpringBoardServices.SBSInCallPresentationRequest.connectionQueue", v18);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke;
  v29[3] = &unk_1E566C6B8;
  dispatch_queue_t v30 = v19;
  id v31 = a1;
  v20 = v19;
  [v17 configureConnection:v29];
  v21 = SBLogInCallPresentation();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v17;
    _os_log_impl(&dword_18FBC5000, v21, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
  }

  [v17 activate];
  id v22 = v17;
  v23 = [v22 remoteTarget];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_13;
  v26[3] = &unk_1E566C1E8;
  id v27 = v22;
  id v28 = v7;
  id v24 = v22;
  id v25 = v7;
  [v23 presentWithConfiguration:v6 completion:v26];
}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[SBSInCallPresentationServiceInterfaceSpecification interface];
  [v5 setInterface:v3];

  v4 = +[SBSInCallPresentationServiceInterfaceSpecification serviceQuality];
  [v5 setServiceQuality:v4];

  [v5 setInterfaceTarget:*(void *)(a1 + 40)];
  [v5 setTargetQueue:*(void *)(a1 + 32)];
  [v5 setActivationHandler:&__block_literal_global_56];
  [v5 setInterruptionHandler:&__block_literal_global_8_1];
  [v5 setInvalidationHandler:&__block_literal_global_11_1];
}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogInCallPresentation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogInCallPresentation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SBLogInCallPresentation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_19_cold_1((uint64_t)v2, v3);
  }
}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_2_14;
    v8 = &unk_1E566B4B0;
    id v10 = v4;
    id v9 = v3;
    BSDispatchMain();
  }
  [*(id *)(a1 + 32) invalidate:v5, v6, v7, v8];
}

uint64_t __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_2_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end