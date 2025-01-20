@interface SAUIDisambiguationList
@end

@implementation SAUIDisambiguationList

void __80__SAUIDisambiguationList_SiriUIFoundationAdditions__sruif_combinedSpeakableText__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = [a2 speakableText];
  id v9 = [v5 _speakableStringFromString:v6 usingParser:*(void *)(a1 + 40)];

  if ([v9 length])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(unsigned char *)(v7 + 24))
    {
      *(unsigned char *)(v7 + 24) = 0;
    }
    else if (*(void *)(a1 + 72) - 1 == a3)
    {
      v8 = [*(id *)(a1 + 32) _speakableFinalDelimiterForSpeakableString:v9 usingParser:*(void *)(a1 + 40)];
      if (v8) {
        [*(id *)(a1 + 48) appendString:v8];
      }
    }
    else if (*(void *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 48), "appendString:");
    }
    [*(id *)(a1 + 48) appendString:v9];
  }
}

@end