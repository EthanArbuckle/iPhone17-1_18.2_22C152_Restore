@interface VUIMonogramInitialsSilhouetteImageGenerator
@end

@implementation VUIMonogramInitialsSilhouetteImageGenerator

uint64_t __77___VUIMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke(uint64_t a1)
{
  return +[_VUIMonogramInitialsSilhouetteImageGenerator drawInitialsWithRect:andDescription:](_VUIMonogramInitialsSilhouetteImageGenerator, "drawInitialsWithRect:andDescription:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __77___VUIMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __136___VUIMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v2 = objc_loadWeakRetained(&to);
  char v3 = [v2 isCancelled];

  if ((v3 & 1) == 0)
  {
    v4 = +[_VUIMonogramInitialsSilhouetteImageGenerator monogramImageWithDescription:*(void *)(a1 + 32)];
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3CB0]), "initWithCGImageRef:exifOrientation:preserveAlpha:", objc_msgSend(v4, "vuiCGImage"), 1, 1);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __136___VUIMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
    v8[3] = &unk_1E6DFAA70;
    objc_copyWeak(&v11, &to);
    id v6 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&to);
}

void __136___VUIMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

@end