@interface SUICGetViewModelVoicesForVoiceCollection
@end

@implementation SUICGetViewModelVoicesForVoiceCollection

uint64_t ___SUICGetViewModelVoicesForVoiceCollection_block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E4F4E4C8];
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 sharedInstance];
  v9 = [v8 outputVoiceComparator];
  if (v4)
  {
    v10 = [v6 voiceInfo];

    v11 = [v7 voiceInfo];
  }
  else
  {
    v10 = [v7 voiceInfo];

    v11 = [v6 voiceInfo];
  }
  uint64_t v12 = ((uint64_t (**)(void, void *, void *))v9)[2](v9, v10, v11);

  return v12;
}

@end