@interface VUIMonogramImageLoader
@end

@implementation VUIMonogramImageLoader

void __41___VUIMonogramImageLoader_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_VUIMonogramImageLoader);
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v0;
}

void __115___VUIMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __115___VUIMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6DF5E78;
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
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

uint64_t __115___VUIMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[9], a1[7]);
}

@end