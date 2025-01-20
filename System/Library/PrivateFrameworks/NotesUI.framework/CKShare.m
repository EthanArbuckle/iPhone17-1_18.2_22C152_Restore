@interface CKShare
@end

@implementation CKShare

uint64_t __35__CKShare_UI__ic_fallbackThumbnail__block_invoke()
{
  ic_fallbackThumbnail_thumbnail = objc_msgSend(MEMORY[0x1E4FB1818], "ic_applicationIconImageWithSize:", 128.0, 128.0);
  return MEMORY[0x1F41817F8]();
}

void __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 image];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

void __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 image];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

uint64_t __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke_3(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "ic_PNGData");
  objc_msgSend(v2, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v3, *MEMORY[0x1E4F831C0], 0);

  uint64_t v4 = (void *)a1[4];
  v5 = objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "ic_PNGData");
  objc_msgSend(v4, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v5, *MEMORY[0x1E4F831B8], 0);

  uint64_t result = a1[5];
  if (result)
  {
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

@end