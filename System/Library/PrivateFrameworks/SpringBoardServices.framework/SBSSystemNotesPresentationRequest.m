@interface SBSSystemNotesPresentationRequest
+ (void)performPresentationWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation SBSSystemNotesPresentationRequest

+ (void)performPresentationWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke;
  v10[3] = &unk_1E566C6E0;
  id v11 = v6;
  id v12 = v7;
  id v13 = a1;
  id v8 = v6;
  id v9 = v7;
  [v8 prepareForXPCCall:v10];
}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (*(void *)(a1 + 40))
    {
      v4 = SBLogSystemNotes();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F50BB8];
    id v6 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    id v7 = +[SBSSystemNotesPresentationServiceInterfaceSpecification identifier];
    id v8 = [v5 endpointForMachName:v6 service:v7 instance:0];

    id v9 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v8];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SpringBoardServices.SBSSystemNotesPresentationRequest.connectionQueue", v10);

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_3;
    v23[3] = &unk_1E566C6B8;
    uint64_t v12 = *(void *)(a1 + 48);
    dispatch_queue_t v24 = v11;
    uint64_t v25 = v12;
    id v13 = v11;
    [v9 configureConnection:v23];
    v14 = SBLogSystemNotes();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      _os_log_impl(&dword_18FBC5000, v14, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
    }

    [v9 activate];
    id v15 = v9;
    v16 = [v15 remoteTarget];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_12;
    v20[3] = &unk_1E566C1E8;
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v21 = v15;
    id v22 = v18;
    id v19 = v15;
    [v16 presentWithConfiguration:v17 completion:v20];
  }
}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[SBSSystemNotesPresentationServiceInterfaceSpecification interface];
  [v5 setInterface:v3];

  v4 = +[SBSSystemNotesPresentationServiceInterfaceSpecification serviceQuality];
  [v5 setServiceQuality:v4];

  [v5 setInterfaceTarget:*(void *)(a1 + 40)];
  [v5 setTargetQueue:*(void *)(a1 + 32)];
  [v5 setActivationHandler:&__block_literal_global_28];
  [v5 setInterruptionHandler:&__block_literal_global_7_2];
  [v5 setInvalidationHandler:&__block_literal_global_10_0];
}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogSystemNotes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogSystemNotes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SBLogSystemNotes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_19_cold_1((uint64_t)v2, v3);
  }
}

uint64_t __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 invalidate];
}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "Failed to prepare SBSSystemNotesPresentationConfiguration for XPC call. config: %{public}@; error: %{public}@",
    (uint8_t *)&v4,
    0x16u);
}

@end