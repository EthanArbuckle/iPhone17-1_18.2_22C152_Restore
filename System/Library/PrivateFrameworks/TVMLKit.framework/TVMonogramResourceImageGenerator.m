@interface TVMonogramResourceImageGenerator
@end

@implementation TVMonogramResourceImageGenerator

void __125___TVMonogramResourceImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isCancelled] & 1) == 0)
  {
    v2 = +[TVInterfaceFactory sharedInterfaceFactory];
    id v14 = [v2 imageForResource:*(void *)(a1 + 32)];

    v3 = [v14 imageAsset];

    if (v3)
    {
      v4 = [v14 imageAsset];
      v5 = [MEMORY[0x263F1CB00] traitCollectionWithLayoutDirection:*(void *)(a1 + 80)];
      uint64_t v6 = [v4 imageWithTraitCollection:v5];

      id v14 = (id)v6;
    }
    v7 = [*(id *)(a1 + 40) fillColor];

    if (v7)
    {
      v8 = objc_opt_class();
      v9 = [*(id *)(a1 + 40) fillColor];
      v10 = [v8 tintImage:v14 withColor:v9];

      id v11 = v10;
      v12 = +[TVImage imageWithCGImageRef:imageOrientation:preserveAlpha:](TVImage, "imageWithCGImageRef:imageOrientation:preserveAlpha:", [v11 CGImage], objc_msgSend(v11, "imageOrientation"), 1);
      +[ITMLUtilities image:v12 didCompleteLoadingForCache:1 requestRecord:*(void *)(a1 + 56)];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      id v13 = v14;
      +[TVImage imageWithCGImageRef:imageOrientation:preserveAlpha:](TVImage, "imageWithCGImageRef:imageOrientation:preserveAlpha:", [v13 CGImage], objc_msgSend(v13, "imageOrientation"), 1);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      +[ITMLUtilities image:v11 didCompleteLoadingForCache:1 requestRecord:*(void *)(a1 + 56)];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

@end