@interface TVResourceImageLoader
@end

@implementation TVResourceImageLoader

uint64_t __40___TVResourceImageLoader_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_loader_0;
  sharedInstance_loader_0 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __114___TVResourceImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(void *a1)
{
  v2 = +[TVInterfaceFactory sharedInterfaceFactory];
  v3 = [v2 imageForResource:a1[4]];

  v4 = [v3 imageAsset];

  if (v4)
  {
    v5 = [MEMORY[0x263F1CB00] traitCollectionWithLayoutDirection:a1[7]];
    v6 = [v3 imageAsset];
    uint64_t v7 = [v6 imageWithTraitCollection:v5];

    v3 = (void *)v7;
  }
  v8 = [TVImage alloc];
  id v12 = v3;
  v9 = -[TVImage initWithCGImageRef:imageOrientation:preserveAlpha:](v8, "initWithCGImageRef:imageOrientation:preserveAlpha:", [v12 CGImage], objc_msgSend(v12, "imageOrientation"), 1);
  +[ITMLUtilities image:v9 didCompleteLoadingForCache:1 requestRecord:a1[5]];
  uint64_t v10 = a1[6];
  if (v10)
  {
    if (v9)
    {
      (*(void (**)(uint64_t, TVImage *, void, void, void, void))(v10 + 16))(v10, v9, 0, 0, 0, 0);
    }
    else
    {
      v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void, void *))(v10 + 16))(v10, 0, 0, 0, 0, v11);
    }
  }
}

@end