@interface TVAppDocumentRequestController
@end

@implementation TVAppDocumentRequestController

void __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  v3 = [*(id *)(a1 + 32) templateViewController];
  v4 = [v3 view];
  [v4 setAlpha:v2];

  v5 = [*(id *)(a1 + 32) swipeUpMessageView];
  [v5 setAlpha:v2];

  v6 = [*(id *)(a1 + 32) mediaController];
  v7 = [v6 mediaInfo];
  uint64_t v8 = [v7 intent];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) templateViewController];
    v10 = [v9 view];
    long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v21.a = *MEMORY[0x263F000D0];
    long long v18 = *(_OWORD *)&v21.a;
    *(_OWORD *)&v21.c = v19;
    *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v17 = *(_OWORD *)&v21.tx;
    [v10 setTransform:&v21];

    v11 = [*(id *)(a1 + 32) swipeUpMessageView];
    v12 = v11;
    *(_OWORD *)&v21.a = v18;
    *(_OWORD *)&v21.c = v19;
    *(_OWORD *)&v21.tx = v17;
    v13 = &v21;
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    if (*(unsigned char *)(a1 + 40))
    {
      long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v21.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v21.c = v14;
      *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    }
    else
    {
      CGAffineTransformMakeScale(&v21, 1.1, 1.1);
    }
    v15 = [*(id *)(a1 + 32) templateViewController];
    v16 = [v15 view];
    CGAffineTransform v20 = v21;
    [v16 setTransform:&v20];

    v11 = [*(id *)(a1 + 32) swipeUpMessageView];
    v12 = v11;
    CGAffineTransform v20 = v21;
    v13 = &v20;
  }
  [v11 setTransform:v13];
}

uint64_t __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v2 = 0.0;
  }
  else {
    double v2 = 1.0;
  }
  v3 = [*(id *)(a1 + 32) templateViewController];
  v4 = [v3 view];
  [v4 setAlpha:v2];

  v5 = [*(id *)(a1 + 32) swipeUpMessageView];
  [v5 setAlpha:v2];

  v6 = [*(id *)(a1 + 32) mediaController];
  v7 = [v6 mediaInfo];
  uint64_t v8 = [v7 intent];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) templateViewController];
    v10 = [v9 view];
    long long v22 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x263F000D0];
    long long v21 = *(_OWORD *)&v24.a;
    *(_OWORD *)&v24.c = v22;
    *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v20 = *(_OWORD *)&v24.tx;
    [v10 setTransform:&v24];

    v11 = [*(id *)(a1 + 32) swipeUpMessageView];
    v12 = v11;
    *(_OWORD *)&v24.a = v21;
    *(_OWORD *)&v24.c = v22;
    *(_OWORD *)&v24.tx = v20;
    v13 = &v24;
  }
  else
  {
    memset(&v24, 0, sizeof(v24));
    if (*(unsigned char *)(a1 + 48))
    {
      CGAffineTransformMakeScale(&v24, 1.1, 1.1);
    }
    else
    {
      long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v24.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v24.c = v14;
      *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    }
    v15 = [*(id *)(a1 + 32) templateViewController];
    v16 = [v15 view];
    CGAffineTransform v23 = v24;
    [v16 setTransform:&v23];

    v11 = [*(id *)(a1 + 32) swipeUpMessageView];
    v12 = v11;
    CGAffineTransform v23 = v24;
    v13 = &v23;
  }
  [v11 setTransform:v13];

  [*(id *)(a1 + 32) _updateShowcaseFactor];
  long long v17 = *(unsigned char **)(a1 + 32);
  if (v17[1091])
  {
    long long v18 = [v17 appDelegate];
    [v18 appDocumentController:*(void *)(a1 + 32) didHideUI:*(unsigned __int8 *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) _hostingFocusEnvironment];
  [v3 setNeedsFocusUpdate];
}

@end