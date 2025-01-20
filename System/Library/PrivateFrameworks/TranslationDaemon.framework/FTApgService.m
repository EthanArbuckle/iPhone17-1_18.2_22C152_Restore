@interface FTApgService
- (id)performPronGuessWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
@end

@implementation FTApgService

- (id)performPronGuessWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__FTApgService_performPronGuessWithDelegate_requestBuilder_completion___block_invoke;
  v21[3] = &unk_265547FD8;
  id v10 = v8;
  id v22 = v10;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __71__FTApgService_performPronGuessWithDelegate_requestBuilder_completion___block_invoke_2;
  v19 = &unk_2655495C0;
  id v11 = v9;
  id v20 = v11;
  v12 = [(OspreyChannel *)self bidirectionalStreamingRequestWithMethodName:@"/siri.speech.qss_fb.Apg/PronGuess" requestBuilder:a4 streamingResponseHandler:v21 completion:&v16];
  v13 = [FTPronGuessStreamingContext alloc];
  v14 = -[FTPronGuessStreamingContext initWithGRPCStreamingCallContext:](v13, "initWithGRPCStreamingCallContext:", v12, v16, v17, v18, v19);

  return v14;
}

void __71__FTApgService_performPronGuessWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [[FTPronGuessStreamingResponse alloc] initAndVerifyWithFlatbuffData:v5];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) streamDidReceivePronGuessStreamingResponse:v3];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263F087E8] errorWithDomain:@"Flatbuffers" code:100 userInfo:MEMORY[0x263EFFA78]];
    [*(id *)(a1 + 32) streamFailVerifyPronGuessStreamingResponse:v4];
  }
}

uint64_t __71__FTApgService_performPronGuessWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end