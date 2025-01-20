@interface FTBlazarService
- (id)performBatchTranslationWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
- (id)performMultiUserWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
- (id)performMultilingualWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
- (id)performSpeechTranslationWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
- (id)performTextToSpeechRouterStreamingWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
- (void)performServiceDiscovery:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
- (void)performTextToSpeechRouter:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
@end

@implementation FTBlazarService

- (id)performMultiUserWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __74__FTBlazarService_performMultiUserWithDelegate_requestBuilder_completion___block_invoke;
  v21[3] = &unk_265547FD8;
  id v10 = v8;
  id v22 = v10;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __74__FTBlazarService_performMultiUserWithDelegate_requestBuilder_completion___block_invoke_2;
  v19 = &unk_2655495C0;
  id v11 = v9;
  id v20 = v11;
  v12 = [(OspreyChannel *)self bidirectionalStreamingRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/MultiUser" requestBuilder:a4 streamingResponseHandler:v21 completion:&v16];
  v13 = [FTMultiUserStreamingContext alloc];
  v14 = -[FTMultiUserStreamingContext initWithGRPCStreamingCallContext:](v13, "initWithGRPCStreamingCallContext:", v12, v16, v17, v18, v19);

  return v14;
}

void __74__FTBlazarService_performMultiUserWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [[FTMultiUserStreamingResponse alloc] initAndVerifyWithFlatbuffData:v5];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) streamDidReceiveMultiUserStreamingResponse:v3];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263F087E8] errorWithDomain:@"Flatbuffers" code:100 userInfo:MEMORY[0x263EFFA78]];
    [*(id *)(a1 + 32) streamFailVerifyMultiUserStreamingResponse:v4];
  }
}

uint64_t __74__FTBlazarService_performMultiUserWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)performMultilingualWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__FTBlazarService_performMultilingualWithDelegate_requestBuilder_completion___block_invoke;
  v21[3] = &unk_265547FD8;
  id v10 = v8;
  id v22 = v10;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __77__FTBlazarService_performMultilingualWithDelegate_requestBuilder_completion___block_invoke_2;
  v19 = &unk_2655495C0;
  id v11 = v9;
  id v20 = v11;
  v12 = [(OspreyChannel *)self bidirectionalStreamingRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/Multilingual" requestBuilder:a4 streamingResponseHandler:v21 completion:&v16];
  v13 = [FTMultilingualStreamingContext alloc];
  v14 = -[FTMultilingualStreamingContext initWithGRPCStreamingCallContext:](v13, "initWithGRPCStreamingCallContext:", v12, v16, v17, v18, v19);

  return v14;
}

void __77__FTBlazarService_performMultilingualWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [[FTMultilingualStreamingResponse alloc] initAndVerifyWithFlatbuffData:v5];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) streamDidReceiveMultilingualStreamingResponse:v3];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263F087E8] errorWithDomain:@"Flatbuffers" code:100 userInfo:MEMORY[0x263EFFA78]];
    [*(id *)(a1 + 32) streamFailVerifyMultilingualStreamingResponse:v4];
  }
}

uint64_t __77__FTBlazarService_performMultilingualWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)performSpeechTranslationWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __82__FTBlazarService_performSpeechTranslationWithDelegate_requestBuilder_completion___block_invoke;
  v21[3] = &unk_265547FD8;
  id v10 = v8;
  id v22 = v10;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __82__FTBlazarService_performSpeechTranslationWithDelegate_requestBuilder_completion___block_invoke_2;
  v19 = &unk_2655495C0;
  id v11 = v9;
  id v20 = v11;
  v12 = [(OspreyChannel *)self bidirectionalStreamingRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/SpeechTranslation" requestBuilder:a4 streamingResponseHandler:v21 completion:&v16];
  v13 = [FTSpeechTranslationStreamingContext alloc];
  v14 = -[FTSpeechTranslationStreamingContext initWithGRPCStreamingCallContext:](v13, "initWithGRPCStreamingCallContext:", v12, v16, v17, v18, v19);

  return v14;
}

void __82__FTBlazarService_performSpeechTranslationWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [[FTSpeechTranslationStreamingResponse alloc] initAndVerifyWithFlatbuffData:v5];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) streamDidReceiveSpeechTranslationStreamingResponse:v3];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263F087E8] errorWithDomain:@"Flatbuffers" code:100 userInfo:MEMORY[0x263EFFA78]];
    [*(id *)(a1 + 32) streamFailVerifySpeechTranslationStreamingResponse:v4];
  }
}

uint64_t __82__FTBlazarService_performSpeechTranslationWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)performBatchTranslationWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __81__FTBlazarService_performBatchTranslationWithDelegate_requestBuilder_completion___block_invoke;
  v21[3] = &unk_265547FD8;
  id v10 = v8;
  id v22 = v10;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __81__FTBlazarService_performBatchTranslationWithDelegate_requestBuilder_completion___block_invoke_2;
  v19 = &unk_2655495C0;
  id v11 = v9;
  id v20 = v11;
  v12 = [(OspreyChannel *)self bidirectionalStreamingRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/BatchTranslation" requestBuilder:a4 streamingResponseHandler:v21 completion:&v16];
  v13 = [FTBatchTranslationStreamingContext alloc];
  v14 = -[FTBatchTranslationStreamingContext initWithGRPCStreamingCallContext:](v13, "initWithGRPCStreamingCallContext:", v12, v16, v17, v18, v19);

  return v14;
}

void __81__FTBlazarService_performBatchTranslationWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [[FTBatchTranslationStreamingResponse alloc] initAndVerifyWithFlatbuffData:v5];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) streamDidReceiveBatchTranslationStreamingResponse:v3];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263F087E8] errorWithDomain:@"Flatbuffers" code:100 userInfo:MEMORY[0x263EFFA78]];
    [*(id *)(a1 + 32) streamFailVerifyBatchTranslationStreamingResponse:v4];
  }
}

uint64_t __81__FTBlazarService_performBatchTranslationWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performTextToSpeechRouter:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 flatbuffData];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__FTBlazarService_performTextToSpeechRouter_requestBuilder_completion___block_invoke;
  v12[3] = &unk_2655495E8;
  id v11 = v9;
  id v13 = v11;
  [(OspreyChannel *)self unaryRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/TextToSpeechRouter" requestData:v10 requestBuilder:v8 responseHandler:v12];
}

void __71__FTBlazarService_performTextToSpeechRouter_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [[FTTextToSpeechResponse alloc] initAndVerifyWithFlatbuffData:v8];
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"Flatbuffers" code:100 userInfo:MEMORY[0x263EFFA78]];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (id)performTextToSpeechRouterStreamingWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __92__FTBlazarService_performTextToSpeechRouterStreamingWithDelegate_requestBuilder_completion___block_invoke;
  v21[3] = &unk_265547FD8;
  id v10 = v8;
  id v22 = v10;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __92__FTBlazarService_performTextToSpeechRouterStreamingWithDelegate_requestBuilder_completion___block_invoke_2;
  v19 = &unk_2655495C0;
  id v11 = v9;
  id v20 = v11;
  v12 = [(OspreyChannel *)self bidirectionalStreamingRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/TextToSpeechRouterStreaming" requestBuilder:a4 streamingResponseHandler:v21 completion:&v16];
  id v13 = [FTTextToSpeechRouterStreamingStreamingContext alloc];
  v14 = -[FTTextToSpeechRouterStreamingStreamingContext initWithGRPCStreamingCallContext:](v13, "initWithGRPCStreamingCallContext:", v12, v16, v17, v18, v19);

  return v14;
}

void __92__FTBlazarService_performTextToSpeechRouterStreamingWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [[FTTextToSpeechRouterStreamingStreamingResponse alloc] initAndVerifyWithFlatbuffData:v5];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) streamDidReceiveTextToSpeechRouterStreamingStreamingResponse:v3];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263F087E8] errorWithDomain:@"Flatbuffers" code:100 userInfo:MEMORY[0x263EFFA78]];
    [*(id *)(a1 + 32) streamFailVerifyTextToSpeechRouterStreamingStreamingResponse:v4];
  }
}

uint64_t __92__FTBlazarService_performTextToSpeechRouterStreamingWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performServiceDiscovery:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 flatbuffData];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__FTBlazarService_performServiceDiscovery_requestBuilder_completion___block_invoke;
  v12[3] = &unk_2655495E8;
  id v11 = v9;
  id v13 = v11;
  [(OspreyChannel *)self unaryRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/ServiceDiscovery" requestData:v10 requestBuilder:v8 responseHandler:v12];
}

void __69__FTBlazarService_performServiceDiscovery_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [[FTServiceDiscoveryResponse alloc] initAndVerifyWithFlatbuffData:v8];
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"Flatbuffers" code:100 userInfo:MEMORY[0x263EFFA78]];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

@end