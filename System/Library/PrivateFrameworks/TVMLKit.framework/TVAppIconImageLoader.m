@interface TVAppIconImageLoader
@end

@implementation TVAppIconImageLoader

uint64_t __39___TVAppIconImageLoader_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_loader_1;
  sharedInstance_loader_1 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __113___TVAppIconImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _createApplicationIconForIdentifier:*(void *)(a1 + 40)];
  v3 = [TVImage alloc];
  id v8 = v2;
  uint64_t v4 = -[TVImage initWithCGImageRef:preserveAlpha:](v3, "initWithCGImageRef:preserveAlpha:", [v8 CGImage], 1);
  v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    if (v4)
    {
      (*(void (**)(uint64_t, uint64_t, void, void, void, void))(v6 + 16))(v6, v4, 0, 0, 0, 0);
    }
    else
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, 0, v7);
    }
  }
}

@end