@interface VUIMonogramResourceOrSymbolImageGenerator
@end

@implementation VUIMonogramResourceOrSymbolImageGenerator

void __134___VUIMonogramResourceOrSymbolImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 64));
  id v2 = objc_loadWeakRetained(&to);
  char v3 = [v2 isCancelled];

  if ((v3 & 1) == 0)
  {
    v4 = [MEMORY[0x1E4FB3C70] imageForResource:*(void *)(a1 + 32) accessibilityDescription:0];
    v5 = [v4 imageAsset];

    if (v5)
    {
      v6 = [v4 imageAsset];
      v7 = [MEMORY[0x1E4FB1E20] traitCollectionWithLayoutDirection:*(void *)(a1 + 72)];
      uint64_t v8 = [v6 imageWithTraitCollection:v7];

      v4 = (void *)v8;
    }
    v9 = [*(id *)(a1 + 40) fillColor];

    if (v9)
    {
      v10 = [*(id *)(a1 + 40) fillColor];
      uint64_t v11 = objc_msgSend(v4, "vui_imageWithColor:", v10);

      v4 = (void *)v11;
    }
    v12 = (void *)MEMORY[0x1E4FB3CB0];
    id v13 = v4;
    v14 = objc_msgSend(v12, "imageWithCGImageRef:imageOrientation:preserveAlpha:", objc_msgSend(v13, "CGImage"), objc_msgSend(v13, "imageOrientation"), 1);
    [MEMORY[0x1E4FB3C70] image:v14 didCompleteLoadingForCache:1 requestRecord:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  objc_destroyWeak(&to);
}

void __134___VUIMonogramResourceOrSymbolImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 64));
  id v2 = objc_loadWeakRetained(&to);
  char v3 = [v2 isCancelled];

  if ((v3 & 1) == 0)
  {
    if (*(double *)(a1 + 72) <= 0.0) {
      [*(id *)(a1 + 32) size];
    }
    v4 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithPointSize:weight:", (uint64_t)*MEMORY[0x1E4FB09D8]);
    v5 = [MEMORY[0x1E4FB1818] vuiSystemImageNamed:*(void *)(a1 + 40) withConfiguration:v4 accessibilityDescription:0];
    v6 = [*(id *)(a1 + 32) fillColor];

    if (v6)
    {
      v7 = [*(id *)(a1 + 32) fillColor];
      uint64_t v8 = objc_msgSend(v5, "vui_imageWithColor:", v7);

      v5 = (void *)v8;
    }
    v9 = (void *)MEMORY[0x1E4FB3CB0];
    id v10 = v5;
    uint64_t v11 = objc_msgSend(v9, "imageWithCGImageRef:imageOrientation:preserveAlpha:", objc_msgSend(v10, "CGImage"), objc_msgSend(v10, "imageOrientation"), 1);
    [MEMORY[0x1E4FB3C70] image:v11 didCompleteLoadingForCache:1 requestRecord:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  objc_destroyWeak(&to);
}

@end