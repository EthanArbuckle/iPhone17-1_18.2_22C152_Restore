@interface PXDefaultAudioCueProvider
@end

@implementation PXDefaultAudioCueProvider

void __53___PXDefaultAudioCueProvider__cueProviderForCatalog___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 8);
  v3 = [NSNumber numberWithInteger:a1[6]];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(a1[5] + 8) + 40)) {
    return;
  }
  unint64_t v7 = a1[6];
  if (v7 < 2)
  {
    v8 = _PXEmptyAudioCueProvider;
  }
  else if (v7 - 2 >= 2)
  {
    if (v7 != 4)
    {
      uint64_t v12 = 0;
      goto LABEL_9;
    }
    v8 = PXFlexMusicCueProvider;
  }
  else
  {
    v8 = PXAppleMusicCueProvider;
  }
  id v9 = objc_alloc_init(v8);
  uint64_t v10 = *(void *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  unint64_t v7 = a1[6];
  uint64_t v12 = *(void *)(*(void *)(a1[5] + 8) + 40);
LABEL_9:
  v13 = *(void **)(a1[4] + 8);
  id v14 = [NSNumber numberWithInteger:v7];
  [v13 setObject:v12 forKeyedSubscript:v14];
}

void __69___PXDefaultAudioCueProvider_requestCuesForAudioAsset_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = *(id *)(a1 + 32);
  v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "requestAudioCues", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end