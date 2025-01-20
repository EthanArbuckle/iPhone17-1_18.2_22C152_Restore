@interface PKPaymentInformationEventExtensionHostContext
- (id)replyQueue;
- (void)handleConfigurationRequest:(id)a3 completion:(id)a4;
- (void)handleInformationRequest:(id)a3 completion:(id)a4;
- (void)handleSignatureRequest:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentInformationEventExtensionHostContext

- (void)handleInformationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(PKPaymentInformationEventExtensionHostContext *)self replyQueue];
    v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);

    dispatch_time_t v10 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__32;
    v26[4] = __Block_byref_object_dispose__32;
    id v27 = _Block_copy(v7);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke;
    aBlock[3] = &unk_1E56E7628;
    v11 = v9;
    v24 = v11;
    v25 = v26;
    v12 = _Block_copy(aBlock);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_2;
    handler[3] = &unk_1E56D8360;
    id v13 = v12;
    id v22 = v13;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(v11);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_3;
    v19[3] = &unk_1E56D9528;
    v19[4] = self;
    id v14 = v13;
    id v20 = v14;
    v15 = [(PKPaymentInformationEventExtensionHostContext *)self vendorContextWithErrorHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_5;
    v17[3] = &unk_1E56E7650;
    v17[4] = self;
    id v16 = v14;
    id v18 = v16;
    [v15 handleInformationRequest:v6 completion:v17];

    _Block_object_dispose(v26, 8);
  }
}

void __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  id v8 = v3;
  if (v4)
  {
    dispatch_source_cancel(v4);
    id v3 = v8;
  }
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    id v3 = v8;
  }
}

uint64_t __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_4;
  block[3] = &unk_1E56D8360;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_6;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)handleSignatureRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(PKPaymentInformationEventExtensionHostContext *)self replyQueue];
    id v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);

    dispatch_time_t v10 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__32;
    v26[4] = __Block_byref_object_dispose__32;
    id v27 = _Block_copy(v7);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke;
    aBlock[3] = &unk_1E56E7678;
    v11 = v9;
    v24 = v11;
    v25 = v26;
    v12 = _Block_copy(aBlock);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_2;
    handler[3] = &unk_1E56D8360;
    id v13 = v12;
    id v22 = v13;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(v11);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_3;
    v19[3] = &unk_1E56D9528;
    v19[4] = self;
    id v14 = v13;
    id v20 = v14;
    v15 = [(PKPaymentInformationEventExtensionHostContext *)self vendorContextWithErrorHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_5;
    v17[3] = &unk_1E56E76A0;
    v17[4] = self;
    id v16 = v14;
    id v18 = v16;
    [v15 handleSignatureRequest:v6 completion:v17];

    _Block_object_dispose(v26, 8);
  }
}

void __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  id v8 = v3;
  if (v4)
  {
    dispatch_source_cancel(v4);
    id v3 = v8;
  }
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    id v3 = v8;
  }
}

uint64_t __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_4;
  block[3] = &unk_1E56D8360;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_6;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)handleConfigurationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentInformationEventExtensionHostContext *)self replyQueue];
  id v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);

  dispatch_time_t v10 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__32;
  v26[4] = __Block_byref_object_dispose__32;
  id v27 = _Block_copy(v7);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke;
  aBlock[3] = &unk_1E56DC618;
  v11 = v9;
  v24 = v11;
  v25 = v26;
  v12 = _Block_copy(aBlock);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_2;
  handler[3] = &unk_1E56D8360;
  id v13 = v12;
  id v22 = v13;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume(v11);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_3;
  v19[3] = &unk_1E56D9528;
  v19[4] = self;
  id v14 = v13;
  id v20 = v14;
  v15 = [(PKPaymentInformationEventExtensionHostContext *)self vendorContextWithErrorHandler:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_5;
  v17[3] = &unk_1E56D8A18;
  v17[4] = self;
  id v16 = v14;
  id v18 = v16;
  [v15 handleConfigurationRequest:v6 completion:v17];

  _Block_object_dispose(v26, 8);
}

void __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

uint64_t __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_4;
  block[3] = &unk_1E56D8360;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_6;
  block[3] = &unk_1E56D8360;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)replyQueue
{
  queue = self->_queue;
  if (!queue)
  {
    id v4 = (OS_dispatch_queue *)dispatch_queue_create("PKPaymentInformationEventExtensionHostContext.replyQueue", 0);
    id v5 = self->_queue;
    self->_queue = v4;

    queue = self->_queue;
  }
  return queue;
}

- (void).cxx_destruct
{
}

@end