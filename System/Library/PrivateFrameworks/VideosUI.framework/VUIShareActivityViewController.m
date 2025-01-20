@interface VUIShareActivityViewController
@end

@implementation VUIShareActivityViewController

uint64_t __159__VUIShareActivityViewController_iOS_shareMediaItem_previewURLString_title_subtitle_imageURLStr_groupActivityMetadata_sourceView_sourceRect_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke(id *a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_2;
  v2[3] = &unk_1E6DF4998;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  id v7 = a1[8];
  id v8 = a1[9];
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F30AD0]);
  if (*(void *)(a1 + 32))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F30A48]);
    [v3 setURL:*(void *)(a1 + 32)];
    v9[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [*(id *)(a1 + 40) setImages:v4];

    [v2 setHasFetchedSubresources:0];
  }
  [*(id *)(a1 + 40) setSpecialization:*(void *)(a1 + 48)];
  [v2 setMetadata:*(void *)(a1 + 40)];
  id v5 = [v2 dataRepresentation];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [*(id *)(a1 + 56) messageComposeViewController];
      [v6 addRichLinkData:v5 withWebpageURL:*(void *)(a1 + 64)];

      id v7 = [*(id *)(a1 + 56) messageComposeViewController];
      [v7 setBody:0];
    }
  }
  uint64_t v8 = *(void *)(a1 + 72);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

void __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_4;
  v8[3] = &unk_1E6DF4998;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v1 == *(void **)(v2 + 1336))
  {
    *(void *)(v2 + 1336) = 0;

    id v8 = objc_alloc_init(MEMORY[0x1E4F30AD0]);
    [v8 setMetadata:*(void *)(a1 + 48)];
    [v8 setHasFetchedSubresources:0];
    id v4 = [v8 dataRepresentation];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = [*(id *)(a1 + 56) messageComposeViewController];
        [v5 addRichLinkData:v4 withWebpageURL:*(void *)(a1 + 64)];

        id v6 = [*(id *)(a1 + 56) messageComposeViewController];
        [v6 setBody:0];
      }
    }
    uint64_t v7 = *(void *)(a1 + 72);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

@end