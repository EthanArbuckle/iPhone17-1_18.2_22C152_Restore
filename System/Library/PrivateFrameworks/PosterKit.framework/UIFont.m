@interface UIFont
@end

@implementation UIFont

uint64_t __60__UIFont_PRTimeFont__pr_downloadableFontWithPostScriptName___block_invoke(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 1:
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        return 1;
      }
      goto LABEL_8;
    case 4:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_8:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      return 1;
    case 7:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      break;
  }
  return 1;
}

void __68__UIFont_PRTimeFont__pr_fontWithFallbacks_beforeFontContainingName___block_invoke(uint64_t a1, CTFontDescriptorRef descriptor, uint64_t a3, unsigned char *a4)
{
  id v7 = (id)CTFontDescriptorCopyAttribute(descriptor, (CFStringRef)*MEMORY[0x1E4F245A8]);
  if ([v7 rangeOfString:*(void *)(a1 + 32)] != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __50__UIFont_PRTimeFont__pr_replaceFallbackFontNames___block_invoke(uint64_t a1, CTFontDescriptorRef descriptor, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)CTFontDescriptorCopyAttribute(descriptor, (CFStringRef)*MEMORY[0x1E4F245A8]);
  uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v5];
  id v7 = (void *)v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4FB08E8];
    uint64_t v14 = *MEMORY[0x1E4FB0918];
    v15[0] = v6;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v10 = [v8 fontDescriptorWithFontAttributes:v9];

    MatchingFontDescriptorsWithOptions = (void *)CTFontDescriptorCreateMatchingFontDescriptorsWithOptions();
    v12 = MatchingFontDescriptorsWithOptions;
    if (MatchingFontDescriptorsWithOptions)
    {
      v13 = [MatchingFontDescriptorsWithOptions objectAtIndexedSubscript:0];
      [*(id *)(a1 + 48) setObject:v13 atIndexedSubscript:a3];
    }
  }
}

@end