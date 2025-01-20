@interface UIImage(PRUISAdditions)
- (void)pruis_determineProminentColorWithCompletion:()PRUISAdditions;
@end

@implementation UIImage(PRUISAdditions)

- (void)pruis_determineProminentColorWithCompletion:()PRUISAdditions
{
  v29[1] = *MEMORY[0x263EF8340];
  v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.SBRenderer"];

    if (v7)
    {
      v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08338];
      v29[0] = @"Not allowed to be called from within SBRenderer";
      id v9 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      v10 = [v8 errorWithDomain:@"PRUIS" code:-1 userInfo:v9];
      v4[2](v4, 0, v10);
    }
    else
    {
      v11 = (void *)[a1 _copyIOSurface];
      id v12 = objc_alloc(MEMORY[0x263F5BB30]);
      v13 = v12;
      if (v11)
      {
        [a1 scale];
        uint64_t v25 = 0;
        v14 = (id *)&v25;
        uint64_t v15 = objc_msgSend(v13, "initWithIOSurface:scale:error:", v11, &v25);
      }
      else
      {
        uint64_t v24 = 0;
        v14 = (id *)&v24;
        uint64_t v15 = [v12 initWithUIImage:a1 error:&v24];
      }
      v10 = (void *)v15;
      id v9 = *v14;

      if (v9 || !v10)
      {
        if (v9)
        {
          v4[2](v4, 0, v9);
        }
        else
        {
          v19 = (void *)MEMORY[0x263F087E8];
          uint64_t v26 = *MEMORY[0x263F08338];
          v27 = @"unable to convert image to codable image";
          v20 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          v21 = [v19 errorWithDomain:@"UIImage+PaperBoardUI" code:-1 userInfo:v20];
          v4[2](v4, 0, v21);
        }
      }
      else
      {
        if (pruis_determineProminentColorWithCompletion__onceToken != -1) {
          dispatch_once(&pruis_determineProminentColorWithCompletion__onceToken, &__block_literal_global_17);
        }
        v16 = [[PRUISAnalysisServiceRequest alloc] initWithImage:v10 analysis:@"PRUISAnalysis_DETERMINE_PROMINENT_COLOR"];
        v17 = (void *)pruis_determineProminentColorWithCompletion__service;
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __71__UIImage_PRUISAdditions__pruis_determineProminentColorWithCompletion___block_invoke_2;
        v22[3] = &unk_26546C0F8;
        v23 = v4;
        id v18 = (id)[v17 executeAnalysisRequest:v16 completion:v22];
      }
    }
  }
}

@end