@interface UIImage
@end

@implementation UIImage

uint64_t __71__UIImage_PRUISAdditions__pruis_determineProminentColorWithCompletion___block_invoke()
{
  pruis_determineProminentColorWithCompletion__service = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

void __71__UIImage_PRUISAdditions__pruis_determineProminentColorWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 resultForAnalysis:@"PRUISAnalysis_DETERMINE_PROMINENT_COLOR"];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__UIImage_PRUISAdditions__pruis_determineProminentColorWithCompletion___block_invoke_3;
  block[3] = &unk_26546C0D0;
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __71__UIImage_PRUISAdditions__pruis_determineProminentColorWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end