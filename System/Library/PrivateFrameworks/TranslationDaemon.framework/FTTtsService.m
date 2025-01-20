@interface FTTtsService
- (id)performTextToSpeechStreamingWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
- (void)performTextToSpeech:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
- (void)performTextToSpeechSpeechFeature:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
@end

@implementation FTTtsService

- (void)performTextToSpeech:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 flatbuffData];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__FTTtsService_performTextToSpeech_requestBuilder_completion___block_invoke;
  v12[3] = &unk_2655495E8;
  id v11 = v9;
  id v13 = v11;
  [(OspreyChannel *)self unaryRequestWithMethodName:@"/siri.speech.qss_fb.Tts/TextToSpeech" requestData:v10 requestBuilder:v8 responseHandler:v12];
}

void __62__FTTtsService_performTextToSpeech_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)performTextToSpeechStreamingWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __83__FTTtsService_performTextToSpeechStreamingWithDelegate_requestBuilder_completion___block_invoke;
  v21[3] = &unk_265547FD8;
  id v10 = v8;
  id v22 = v10;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __83__FTTtsService_performTextToSpeechStreamingWithDelegate_requestBuilder_completion___block_invoke_2;
  v19 = &unk_2655495C0;
  id v11 = v9;
  id v20 = v11;
  v12 = [(OspreyChannel *)self bidirectionalStreamingRequestWithMethodName:@"/siri.speech.qss_fb.Tts/TextToSpeechStreaming" requestBuilder:a4 streamingResponseHandler:v21 completion:&v16];
  id v13 = [FTTextToSpeechStreamingStreamingContext alloc];
  v14 = -[FTTextToSpeechStreamingStreamingContext initWithGRPCStreamingCallContext:](v13, "initWithGRPCStreamingCallContext:", v12, v16, v17, v18, v19);

  return v14;
}

void __83__FTTtsService_performTextToSpeechStreamingWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [[FTTextToSpeechStreamingStreamingResponse alloc] initAndVerifyWithFlatbuffData:v5];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) streamDidReceiveTextToSpeechStreamingStreamingResponse:v3];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263F087E8] errorWithDomain:@"Flatbuffers" code:100 userInfo:MEMORY[0x263EFFA78]];
    [*(id *)(a1 + 32) streamFailVerifyTextToSpeechStreamingStreamingResponse:v4];
  }
}

uint64_t __83__FTTtsService_performTextToSpeechStreamingWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performTextToSpeechSpeechFeature:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 flatbuffData];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__FTTtsService_performTextToSpeechSpeechFeature_requestBuilder_completion___block_invoke;
  v12[3] = &unk_2655495E8;
  id v11 = v9;
  id v13 = v11;
  [(OspreyChannel *)self unaryRequestWithMethodName:@"/siri.speech.qss_fb.Tts/TextToSpeechSpeechFeature" requestData:v10 requestBuilder:v8 responseHandler:v12];
}

void __75__FTTtsService_performTextToSpeechSpeechFeature_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [[FTTextToSpeechSpeechFeatureResponse alloc] initAndVerifyWithFlatbuffData:v8];
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