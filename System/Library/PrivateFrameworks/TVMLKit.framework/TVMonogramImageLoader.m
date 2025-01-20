@interface TVMonogramImageLoader
@end

@implementation TVMonogramImageLoader

uint64_t __40___TVMonogramImageLoader_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_TVMonogramImageLoader);
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __114___TVMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __114___TVMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
  v20[3] = &unk_264BA7280;
  id v15 = *(id *)(a1 + 32);
  id v21 = v11;
  id v22 = v12;
  id v25 = v15;
  uint64_t v26 = a5;
  id v23 = v13;
  id v24 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(MEMORY[0x263EF83A0], v20);
}

uint64_t __114___TVMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[9], a1[7]);
}

@end