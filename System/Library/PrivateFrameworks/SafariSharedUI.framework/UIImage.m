@interface UIImage
@end

@implementation UIImage

void __68__UIImage_SafariSharedExtras__safari_imageWithSize_flipped_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v3 CGContext]);
}

id __69__UIImage_SafariSharedExtras__safari_dynamicImageWithSize_generator___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__9;
    v19 = __Block_byref_object_dispose__9;
    id v20 = 0;
    v8 = [v6 traitCollection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__UIImage_SafariSharedExtras__safari_dynamicImageWithSize_generator___block_invoke_13;
    v10[3] = &unk_1E5E42F98;
    v13 = &v15;
    id v12 = *(id *)(a1 + 32);
    id v11 = v6;
    long long v14 = *(_OWORD *)(a1 + 40);
    [v8 performAsCurrentTraitCollection:v10];

    id v7 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  return v7;
}

void __69__UIImage_SafariSharedExtras__safari_dynamicImageWithSize_generator___block_invoke_13(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = +[WBSImageUtilities resizedImage:*(double *)(a1 + 56) withSize:*(double *)(a1 + 64)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

id __69__UIImage_SafariSharedExtras__safari_dynamicImageWithSize_generator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [WeakRetained imageAsset];
    v8 = [v7 imageWithConfiguration:v3];
    v9 = (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v8, v3);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end