@interface TVSymbolImageLoader
@end

@implementation TVSymbolImageLoader

uint64_t __38___TVSymbolImageLoader_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_loader;
  sharedInstance_loader = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __112___TVSymbolImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(void *a1)
{
  v2 = [MEMORY[0x263F1C6B0] systemImageNamed:a1[4] withConfiguration:a1[5]];
  if (!v2)
  {
    v3 = +[_TVProcessInfo currentProcessInfo];
    int v4 = [v3 hasPrivateEntitlement];

    if (v4)
    {
      v2 = [MEMORY[0x263F1C6B0] _systemImageNamed:a1[4] withConfiguration:a1[5]];
    }
    else
    {
      v2 = 0;
    }
  }
  v5 = [TVImage alloc];
  id v9 = v2;
  v6 = -[TVImage initWithCGImageRef:imageOrientation:preserveAlpha:](v5, "initWithCGImageRef:imageOrientation:preserveAlpha:", [v9 CGImage], objc_msgSend(v9, "imageOrientation"), 1);
  +[ITMLUtilities image:v6 didCompleteLoadingForCache:1 requestRecord:a1[6]];
  uint64_t v7 = a1[7];
  if (v7)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, TVImage *, void, void, uint64_t, void))(v7 + 16))(v7, v6, 0, 0, 2, 0);
    }
    else
    {
      v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, uint64_t, void *))(v7 + 16))(v7, 0, 0, 0, 2, v8);
    }
  }
}

@end