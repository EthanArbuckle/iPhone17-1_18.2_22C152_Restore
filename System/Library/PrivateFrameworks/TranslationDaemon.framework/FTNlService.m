@interface FTNlService
- (void)performShortcutFuzzyMatch:(id)a3 requestBuilder:(id)a4 completion:(id)a5;
@end

@implementation FTNlService

- (void)performShortcutFuzzyMatch:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 flatbuffData];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__FTNlService_performShortcutFuzzyMatch_requestBuilder_completion___block_invoke;
  v12[3] = &unk_2655495E8;
  id v11 = v9;
  id v13 = v11;
  [(OspreyChannel *)self unaryRequestWithMethodName:@"/siri.speech.qss_fb.Nl/ShortcutFuzzyMatch" requestData:v10 requestBuilder:v8 responseHandler:v12];
}

void __67__FTNlService_performShortcutFuzzyMatch_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [[FTShortcutFuzzyMatchResponse alloc] initAndVerifyWithFlatbuffData:v8];
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